#include <algorithm>
#include <array>
#include <map>
#include <vector>
#include <optional>
#include <iostream>
#include "cache.h"
#include "msl/lru_table.h"

uint64_t last_cl_addr=0;
int64_t last_direction;

namespace
{
struct tracker {

  struct lookahead_entry {
    uint64_t address = 0;
    int64_t stride = 0;
    int degree = 0; // degree remaining
  };

  constexpr static int PREFETCH_DEGREE = 100; // CHANGE
  constexpr static int PREFETCH_DISTANCE = 100; // CHANGE
  int CYCLE_COUNT = 0, size = 0;
  

  std::optional<lookahead_entry> active_lookahead;

  std::vector<std::vector<int64_t>> monitoring_region;

public:
  void initiate_lookahead(uint64_t cl_addr)
  {
    //int64_t stride = 0;
      if(last_cl_addr==0 and last_direction==0) return;
    // if we found a matching entry
      // calculate the stride between the current address and the last address
      // no need to check for overflow since these values are downshifted
      //stride = static_cast<int64_t>(cl_addr) - static_cast<int64_t>(found->last_cl_addr);

      int64_t direction = static_cast<int64_t>(cl_addr) - static_cast<int64_t>(last_cl_addr);
      
      // Initialize prefetch state unless we somehow saw the same address twice in
      // a row or if this is the first time we've seen this direction
      uint64_t shifted_addr = cl_addr << LOG2_BLOCK_SIZE;

      for(auto itr = monitoring_region.begin(); itr != monitoring_region.end(); ++itr){
      std::vector<int64_t> field = *itr;
      if(field[0] <= shifted_addr && shifted_addr < field[0] + field[1]*PREFETCH_DISTANCE)
        {active_lookahead = {static_cast<uint64_t>(field[0] + field[1]*PREFETCH_DISTANCE), 1, PREFETCH_DEGREE};
        field[0] += field[1]*PREFETCH_DEGREE;
        field[2] = ++CYCLE_COUNT;
        break;
        }
      else if(field[0] >= shifted_addr && shifted_addr > field[0] + field[1]*PREFETCH_DISTANCE)
        {active_lookahead = {static_cast<uint64_t>(field[0] + field[1]*PREFETCH_DISTANCE), -1, PREFETCH_DEGREE};
        field[0] += field[1]*PREFETCH_DEGREE;
        field[2] = ++CYCLE_COUNT;
        break;
        }
      }

      if (direction != 0 && ((direction > 0 && last_direction > 0) || (direction < 0 && last_direction < 0)) && direction+last_direction < PREFETCH_DISTANCE){
        CYCLE_COUNT++;
        std::vector<int64_t> field(3);
        field[0] = shifted_addr;
        if(direction>0) field[1] = 1;
        else if(direction<0) field[1] = -1;
        field[1] = (direction>0);
        field[2] = CYCLE_COUNT;

        if(size<64){
          monitoring_region.push_back(field);
          size ++;
        } 
        else{
          int64_t MIN_CYCLE_COUNT = monitoring_region[0][2];
          int MIN_CYCLE_COUNTER = 0;

          for (int i = 0; i < 64; i++)
          {
            if(monitoring_region[i][2] < MIN_CYCLE_COUNT) {
              MIN_CYCLE_COUNT = monitoring_region[i][2];
              MIN_CYCLE_COUNTER = i;
            }
          }
          
          monitoring_region[MIN_CYCLE_COUNTER] = field;

        }
    }
  }

  void advance_lookahead(CACHE* cache)
  {
    // If a lookahead is active
    if (active_lookahead.has_value()) {
      auto [old_pf_address, stride, degree] = active_lookahead.value();
      assert(degree > 0);

      auto addr_delta = stride * BLOCK_SIZE;
      auto pf_address = static_cast<uint64_t>(static_cast<int64_t>(old_pf_address) + addr_delta); // cast to signed to allow negative strides

      // If the next step would exceed the degree or run off the page, stop
      if (cache->virtual_prefetch || (pf_address >> LOG2_PAGE_SIZE) == (old_pf_address >> LOG2_PAGE_SIZE)) {
        // check the MSHR occupancy to decide if we're going to prefetch to this level or not
        bool success = cache->prefetch_line(pf_address, (cache->get_mshr_occupancy_ratio() < 0.5), 0);
        if (success)
          active_lookahead = {pf_address, stride, degree - 1};
        // If we fail, try again next cycle

        if (active_lookahead->degree == 0) {
          active_lookahead.reset();
        }
      } else {
        active_lookahead.reset();
      }
    }
  }
};

std::map<CACHE*, tracker> trackers;
} // namespace

void CACHE::prefetcher_initialize() {}

void CACHE::prefetcher_cycle_operate() { ::trackers[this].advance_lookahead(this); }

uint32_t CACHE::prefetcher_cache_operate(uint64_t addr, uint64_t ip, uint8_t cache_hit, bool useful_prefetch, uint8_t type, uint32_t metadata_in)
{
  if(!cache_hit){
    ::trackers[this].initiate_lookahead(addr >> LOG2_BLOCK_SIZE);
    if(last_cl_addr == 0) last_direction = 0;
    else last_direction = (addr >> LOG2_BLOCK_SIZE) - last_cl_addr;
    last_cl_addr = addr >> LOG2_BLOCK_SIZE;
  }
  

  return metadata_in;
}

uint32_t CACHE::prefetcher_cache_fill(uint64_t addr, uint32_t set, uint32_t way, uint8_t prefetch, uint64_t evicted_addr, uint32_t metadata_in)
{
  return metadata_in;
}

void CACHE::prefetcher_final_stats() {}

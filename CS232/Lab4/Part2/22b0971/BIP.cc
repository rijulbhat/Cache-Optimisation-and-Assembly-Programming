#include <algorithm>
#include <cassert>
#include <map>
#include <vector>
#include<iostream>
#include<random>
#include "cache.h"
#include "time.h"

namespace
{
std::map<CACHE*, std::vector<uint64_t>> lru_or_mru;
}

void CACHE::initialize_replacement() { ::lru_or_mru[this] = std::vector<uint64_t> (NUM_SET * NUM_WAY,0);}

uint32_t CACHE::find_victim(uint32_t triggering_cpu, uint64_t instr_id, uint32_t set, const BLOCK* current_set, uint64_t ip, uint64_t full_addr, uint32_t type)
{
  auto begin = std::next(std::begin(::lru_or_mru[this]), set * NUM_WAY);
  auto end = std::next(begin, NUM_WAY);
  auto victim = begin;

  for(auto itr = begin; itr != end; ++itr){
    if(*itr == 0){
      victim = itr;
      break;
    }
  }

  if(*victim == 1){
    for (auto itr = begin; itr != end; ++itr)
    {
      *itr = 0;
    }
  }

  assert(begin <= victim);
  assert(victim < end);
  
  return static_cast<uint32_t>(std::distance(begin, victim)); // cast protected by prior asserts
}

void CACHE::update_replacement_state(uint32_t triggering_cpu, uint32_t set, uint32_t way, uint64_t full_addr, uint64_t ip, uint64_t victim_addr, uint32_t type,
                                     uint8_t hit)
{
  double epsilon = 1;
  srand(time(0));
  double val = (double)rand()/RAND_MAX;
  if(!hit){
    if(val < epsilon){
      ::lru_or_mru[this].at(set*NUM_WAY + way) = 1;
    }
    else{
      ::lru_or_mru[this].at(set*NUM_WAY + way) = 0;
    }
  }
  else{
    if(::lru_or_mru[this].at(set*NUM_WAY + way) == 0) ::lru_or_mru[this].at(set*NUM_WAY + way) = 1;
  }

}

void CACHE::replacement_final_stats() {}

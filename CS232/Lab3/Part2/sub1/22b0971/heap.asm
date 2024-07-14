extern init_v
extern pop_v
extern push_v
extern size_v
extern get_element_v
extern resize_v
extern delete_v

section .text
global init_h
global delete_h
global size_h
global insert_h
global get_max
global pop_max
global dsa_heapify
global heapify
global heapsort

init_h:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        call init_v
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

delete_h:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        call delete_v
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret


size_h:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        call size_v
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret


insert_h:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        ; mov rsi, rsi
        call push_v

        call size_v
        mov rbx, rax
        sub rbx, 1
             
        while_loop:
        jmp parent
        continue:
        cmp rax, -1
        je done
        mov rsi, rax
        call get_element_v
        mov r8, rax ; heap[parent(k)]

        mov rsi, rbx
        call get_element_v
        mov r9, rax ; heap[k]
        mov r10, [r8]
        mov r11, [r9]
        cmp r10, r11
        jge done 
        mov [r8], r11
        mov [r9], r10
        jmp parent_update

        parent: 
        mov rax, rbx
        sub rax, 1
        sar rax, 1
        jmp continue
        
        parent_update:
        sub rbx, 1
        sar rbx, 1
        jmp while_loop

        done:
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

get_max:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        mov rsi, 0
        call get_element_v
        mov rax, [rax]
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

pop_max:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        call size_v
        mov rsi, rax
        sub rsi, 1
        call get_element_v
        mov r8, rax ; stored v[n-1] in r8
        mov rsi, 0
        call get_element_v
        mov r9, rax ; stored v[0] in r9
        mov r10, [r8] ; SWAP
        mov r11, [r9] ; SWAP
        mov [r9], r10 ; SWAP
        mov [r8], r11 ; SWAP
        call pop_v 
        push rax
        mov rsi, 0
        call dsa_heapify
        pop rax
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

dsa_heapify:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        push rsi
        mov rbx, rsi

        mov r8, rsi ; current largest stored in r8
        call size_h
        mov r9, rax ; size stored in r9

        mov rax, rbx
        sal rax, 1
        add rax, 1

        cmp r9, rax
        jle right
        mov r15, rax

        mov rsi, rax
        call get_element_v
        mov r10, [rax] ; heap[left(i)]

        mov rsi, r8
        call get_element_v
        mov r11, [rax] ; heap[largest]

        mov rax, r15
        cmp r10, r11
        jle right
        mov r8, rax ; largest = left

        right:
        mov rax, rbx
        sal rax, 1
        add rax, 2

        cmp r9, rax
        jle recur
        push rax
        
        mov rsi, rax
        call get_element_v
        mov r10, [rax] ; heap[right(i)]

        mov rsi, r8
        call get_element_v
        mov r11, [rax] ; heap[largest]

        pop rax
        cmp r10, r11 
        jle recur
        mov r8, rax ; largest = right
        
        recur:
        pop rsi
        cmp r8, rsi
        je done_again
        push rsi

        call get_element_v
        mov r10, rax

        mov rsi, r8
        call get_element_v
        mov r11, rax

        pop rsi
        mov r12, [r10]
        mov r13, [r11]

        mov [r10], r13
        mov [r11], r12 

        push rsi
        mov rsi, r8
        call dsa_heapify
        pop rsi
        jmp done_again

        done_again:
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

heapify:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        call size_h
        mov r8, rax
        sub r8, 1
        while_loop_again:
        cmp r8, 0
        jl exit
        mov rsi, r8
        call dsa_heapify
        sub r8, 1
        jmp while_loop_again
        exit:
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

heapsort:
        push rbp
        mov rbp, rsp
        push rax
        push rbx
        push rcx
        push rdx
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
        ; ENTER YOUR CODE HERE, DO NOT MODIFY EXTERNAL CODE
        call heapify
        mov r9, [rdi+8]
        while_loop_again_again:
        call size_h
        mov r8, rax
        cmp r8, 0
        jle exit_again
        call pop_max
        jmp while_loop_again_again
        exit_again:
        mov [rdi+8], r9
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdx
        pop rcx
        pop rbx
        mov rsp, rbp
        pop rbp
        ret

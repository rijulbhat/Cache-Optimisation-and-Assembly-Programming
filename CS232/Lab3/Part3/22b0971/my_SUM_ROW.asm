        section .text
        global  alt_sum

alt_sum:
        push rdi                       ; pointer to mat
        push rdx                       ; number of rows/ columns of the matrix (n)
        push r11

; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(r9*j+i)*8
; ; GOAL - Perform matrix alternate summation of elements in matrix and return the sum

; ; TODO - Fill your code here performing the matrix alternate summation in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){sum += (-1)^(i+j)*mat1[i][j];}}
mov r14, 0
mov r8, -1
mov r9, 1
mov r10, 0

counter_i:
cmp r14, rdx
je exit_i
        mov r15, 0     

        counter_j:
        cmp r15, rdx
        je exit_j

        imul r14, r9
        add r14, r15
        sal r14, 3

        mov r13, rdi

        add r13, r14
        mov r13, [r13]


        cmp r10, 0
        je one

        imul r13, -1
        add r11, r13

        mov r10, 0

        jmp skip_one
        
        one:
        
        add r11, r13

        mov r10, 1

        skip_one:

        sar r14, 3
        sub r14, r15
        idiv r14, r11

        add r15, 1
        j counter_j
exit_j:
add r14, 1
j counter_i
exit_i:

; ; End of code to be filled
        pop r11
        pop rdx
        pop rdi
        ret

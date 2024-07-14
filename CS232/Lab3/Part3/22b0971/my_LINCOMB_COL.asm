        section .text
        global lin_comb

lin_comb:
        push rdi                       ; pointer to mat1
        push rsi                       ; scaler 1
        push rdx                       ; pointer to mat2
        push rcx                       ; scaler 2
        push r8                        ; pointer to mat3
        push r9                        ; number of rows/ columns of the matrix (n)
        push r11


; ; 0-indexing on all matrices
; ; mat1[j][i] = rdi+(r9*j+i)*8
; ; GOAL - Perform matrix linear combination of mat1, mat2 and save result in mat3
; ; Note : mat1, mat2 and mat3 here are not the same as one given in problem statement.
; ; They are just placeholders for any three matrices using this functionality.

; ; TODO - Fill your code here performing the matrix linear combination in the following order
; ; for(int i = 0; i < n; i++){for(int j = 0; j < n; j++){mat3[j][i] = s1*mat1[j][i] + s2*mat2[j][i];}}
mov r14, 0

counter_i:
cmp r14, r11
je exit_i
        mov r15, 0        
        counter_j:
        cmp r15, r11
        je exit_j

        imul r15, r11
        add r15, r14    ; j = n*j + i
        
        mov r13, rdi
        mov r12, rdx
        mov r10, r8

        add r13, r15        
        add r12, r15   
        add r10, r15

        mov r13, [r13]
        mov r12, [r12]
        
        imul r13, rsi
        imul r12, rcx

        add r13, r12
        mov [r10], r13

        sub r15, r14
        idiv r15, r11   ; j = (j-i)/n

        add r15, 1
        j counter_j
add r14, 1
j counter_i
exit_i:
; ; End of code to be filled
        pop r11
        pop r9
        pop r8
        pop rcx
        pop rdx
        pop rsi
        pop rdi
        ret

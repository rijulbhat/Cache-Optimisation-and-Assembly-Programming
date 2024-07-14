.data
space:     .asciiz "\n"

.text
.globl main

merge:

    sub $s0, $a2, $a0 # n1 = mid - left + 1
    addi $s0, $s0, 1

    sub $s1, $a1, $a2 # n2 = right - mid

    li $t1, 0         # counter
    li $t2, 0
    mul $a0, $a0, 4
    move $t3, $a0
    div $a0, $a0, 4
    
    loop1:
        beq $t1, $s0, next_loop
        
        add $fp, $fp, $t3
        lw $t4, 0($fp)
        sub $fp, $fp, $t3

        add $s5, $s5, $t2
        sw $t4, 0($s5)
        sub $s5, $s5, $t2

        addi $t1, $t1, 1
        addi $t2, $t2, 4
        addi $t3, $t3, 4

        j loop1 
    
    next_loop:
        li $t1, 0         # counter
        li $t2, 0
        mul $a2, $a2, 4
        move $t3, $a2
        addi $t3, $t3, 4
        div $a2, $a2, 4

    loop2:
        beq $t1, $s0, merge_now

        add $fp, $fp, $t3
        lw $t4, 0($fp)
        sub $fp, $fp, $t3

        add $s6, $s6, $t2
        sw $t4, 0($s6)
        sub $s6, $s6, $t2 

        addi $t1, $t1, 1
        addi $t2, $t2, 4
        addi $t3, $t3, 4
        j loop2

    merge_now:
        li $t1, 0       # counters i=0
        li $t2, 0       # j=0
        li $t3, 0       # counters for accessing array elements
        li $t4, 0
        mul $a0, $a0, 4
        move $t5, $a0
        div $a0, $a0, 4

        merge_while:
            bge $t1, $s0, next_while

            bge $t2, $s1, next_while

            add $s5, $s5, $t3
            lw $t6, 0($s5)
            sub $s5, $s5, $t3

            add $s6, $s6, $t4
            lw $t7, 0($s6)
            sub $s6, $s6, $t4

            blt $t7, $t6, else

            add $fp, $fp, $t5
            sw $t6, 0($fp)
            sub $fp, $fp, $t5

            addi $t3, $t3, 4
            addi $t1, $t1, 1
            addi $t5, $t5, 4
            j merge_while

            else:
            
            add $fp, $fp, $t5
            sw $t7, 0($fp)
            sub $fp, $fp, $t5

            addi $t4, $t4, 4
            addi $t2, $t2, 1
            addi $t5, $t5, 4
            j merge_while
        
        next_while:
            bge $t1, $s0, last_while

            add $s5, $s5, $t3
            lw $s4, 0($s5)
            sub $s5, $s5, $t3

            add $fp, $fp, $t5
            sw $s4, 0($fp)
            sub $fp, $fp, $t5

            addi $t3, $t3, 4
            addi $t1, $t1, 1
            addi $t5, $t5, 4
            j next_while
        
        last_while:
            bge $t2, $s1, exit_merge
            
            add $s6, $s6, $t4
            lw $s4, 0($s6)
            sub $s6, $s6, $t4

            add $fp, $fp, $t5
            sw $s4, 0($fp)
            sub $fp, $fp, $t5

            addi $t4, $t4, 4
            addi $t2, $t2, 1
            addi $t5, $t5, 4
            j last_while
        
        exit_merge:

        
            jr $ra


merge_sort:

    addi $sp, $sp, -16

    bge $a0, $a1, exit_merge_sort     # if low < high is false then exit_merge_sort
    sub $s3, $a1, $a0
    div $s3, $s3, 2
    add $s3, $s3, $a0

    sw $a0, 0($sp)
    sw $a1, 4($sp)
    sw $s3, 8($sp)
    sw $ra, 12($sp)

    move $a1, $s3
    jal merge_sort
    lw $a0, 0($sp)
    lw $a1, 4($sp)
    lw $a2, 8($sp)
    lw $ra, 12($sp)
    move $s3, $a2

    addi $s3, $s3, 1
    move $a0, $s3
    jal merge_sort
    lw $a0, 0($sp)
    lw $a1, 4($sp)
    lw $a2, 8($sp)
    lw $ra, 12($sp)
    move $s3, $a2

    move $a2, $s3
    jal merge
    lw $a0, 0($sp)
    lw $a1, 4($sp)
    lw $a2, 8($sp)
    lw $ra, 12($sp)
    move $s3, $a2

    exit_merge_sort:
        addi $sp, $sp, 16
        jr $ra

bin_search_recur:

            blt $a1, $a0, exit # exit if high < low

            sub $s3, $a1, $a0
            li $s7, 2
            div $s3, $s3, $s7
            add $s3, $s3, $a0
            mul $s5, $s3, 4

            add $fp, $fp, $s5
            lw $s4, 0($fp)
            sub $fp, $fp, $s5

            bne $s4, $s2, recur
            move $v0, $s3
            j exit

        recur:
            bge $s4, $s2, else_recur    # If arr[mid] >= target
            addi $sp, $sp, -12
            sw $a0, 0($sp)
            sw $a1, 4($sp)
            sw $ra, 8($sp)
            addi $s3, $s3, 1
            move $a0, $s3
            addi $s3, $s3, -1
            jal bin_search_recur
            lw $a0, 0($sp)
            lw $a1, 4($sp)
            lw $ra, 8($sp)
            addi $sp, $sp, 12
            j exit
            
        else_recur:
            addi $sp, $sp, -12
            sw $a0, 0($sp)
            sw $a1, 4($sp)
            sw $ra, 8($sp)
            addi $s3, $s3, -1
            move $a1, $s3
            addi $s3, $s3, 1
            jal bin_search_recur
            lw $a0, 0($sp)
            lw $a1, 4($sp)
            lw $ra, 8($sp)
            addi $sp, $sp, 12
            j exit
        exit:
            jr $ra

main:
    addi $sp, $sp, -4
    move $fp, $sp

    # Read n from the user
    li $v0, 5           # Read integer system call code
    syscall
    move $t0, $v0       # Store n in $t0

    li $v0, 9
    mul $a0, $t0, 4
    syscall
    move $fp, $v0       # Main Array

    li $v0, 9
    syscall
    move $s5, $v0

    li $v0, 9
    syscall
    move $s6, $v0
    
    # Initialize loop counter and array index
    li $t1, 0           # Loop counter (i)
    li $t2, 0           # Array index

    input_loop:
        # Check if loop counter (i) is equal to n
        beq $t1, $t0, end_input

        # Read an integer from the user and store it in the array
        li $v0, 5           # Read integer system call code
        syscall
        add $fp, $fp, $t2
        sw $v0, 0($fp)
        sub $fp, $fp, $t2
        addi $t1, $t1, 1    # Increment loop counter (i)
        addi $t2, $t2, 4    # Increment array index

        j input_loop        # Repeat the loop

end_input:
    # The array now contains the inputs
    # You can process or display the inputs as needed
    
    move $a0, $zero
    addi $t0, $t0, -1
    move $a1, $t0
    jal merge_sort
    addi $t0, $t0, 1

    li $v0, 5
    syscall
    move $s0, $v0

    li $s1, 0

    bin_search:
        addi $sp, $sp, -8

        beq $s1, $s0, print_loop

        li $v0, 5
        syscall
        move $s2, $v0           # s2 is the target

        move $a0, $zero         # low
        move $a1, $t0           # high
        addi $a1, $a1, -1
        li $v0, -1

        jal bin_search_recur
        
        move $a0, $v0
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, space
        syscall

        addi $s1, $s1, 1
        j bin_search

    print_loop:

        li $t1, 0
        li $t2, 0

    output_loop: 
        j end_output
        # Check if loop counter (i) is equal to n
        beq $t1, $t0, end_output

        li $v0, 1
        add $fp, $fp, $t2
        lw $a0, 0($fp)
        sub $fp, $fp, $t2
        syscall

        li $v0, 4
        la $a0, space
        syscall

        addi $t1, $t1, 1    # Increment loop counter (i)
        addi $t2, $t2, 4    # Increment array index

        j output_loop        # Repeat the loop


    end_output:
        # Exit the program
        li $v0, 10          # Exit system call code
        syscall
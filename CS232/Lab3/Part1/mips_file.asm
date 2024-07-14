.data
array:      .space 40000  # Array to store inputs (adjust size as needed)
prompt:     .asciiz "Enter a number (0 to stop input): "
n_prompt:   .asciiz "Enter the value of n: "

.text
.globl main

swap:
    # Swap the values
    
    addi $sp, $sp, -4
    
    sw $a0, 0($sp)     # Store $a0 into 0($sp)
    move $a0, $a1      # Copy $a0 to $a1
    lw $a1, 0($sp)     # Copy value from 0($sp) to $a1
    
    addi $sp, $sp, 4
    jr $ra             # Return from the subroutine

main:
    # Ask the user for the value of n
    li $v0, 4           # Print string system call code
    la $a0, n_prompt    # Load address of the prompt
    syscall

    # Read n from the user
    li $v0, 5           # Read integer system call code
    syscall
    move $t0, $v0       # Store n in $t0

    # Initialize loop counter and array index
    li $t1, 0           # Loop counter (i)
    li $t2, 0           # Array index

input_loop:
    # Check if loop counter (i) is equal to n
    beq $t1, $t0, end_input

    # Ask the user for input
    li $v0, 4           # Print string system call code
    la $a0, prompt      # Load address of the prompt
    syscall

    # Read an integer from the user and store it in the array
    li $v0, 5           # Read integer system call code
    syscall
    sw $v0, array($t2)  # Store the input in the array
    addi $t1, $t1, 1    # Increment loop counter (i)
    addi $t2, $t2, 4    # Increment array index

    j input_loop        # Repeat the loop

end_input:
    # The array now contains the inputs
    # You can process or display the inputs as needed
    li $t1, 0
    li $t2, 4

    lw $a0, array($t1)
    lw $a1, array($t2)

    jal swap

    sw $a0, array($t1)
    sw $a1, array($t2)

    li $v0, 1           # Printing integers to check the swap function
    lw $a0 array($t1)
    syscall

    lw $a0 array($t2)   # Printing integers to check the swap function
    syscall

    # Exit the program
    li $v0, 10          # Exit system call code
    syscall

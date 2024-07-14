.data
output_msg: .asciiz "The result is: "

.text
.globl main
.globl add_numbers

# Function to add two numbers
add_numbers:
    # Arguments:
    #   $a0 - First number
    #   $a1 - Second number
    # Returns:
    #   $v0 - Result of the addition
    addi $sp, $sp, -4
    add $v0, $a0, $a1  # Add the numbers and store the result in $v0
    sw $v0, 0($sp)
    jr $ra             # Return to the caller

main:
    # Main program
    li $a0, 5          # Load the first number (e.g., 5)
    li $a1, 7          # Load the second number (e.g., 7)
    jal add_numbers    # Call the add_numbers function
    
    # Display the result
    li $v0, 4          # Print string system call code
    la $a0, output_msg # Load the address of the output message
    syscall

    li $v0, 1          # Print integer system call code
    lw $a0, 0($sp)   # Load the result from $v0
    syscall

    # Exit
    li $v0, 10         # Exit system call code
    syscall

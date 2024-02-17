.data
    array:      .word        0, 1     # Declare the initial elements of the array
    # Define string literals
    comma:      .string      " , "     # Comma separator

.bss

.text
.globl main
main:
    # Loop setup
    li a1, 1          # Initialize loop control variable
    li a2, 12         # Set the number of Fibonacci numbers to generate
    la a3, array      # Load address of the array
    addi a4, a3, 4    # Calculate address of the next element
    addi s5, a4, 4    # Calculate address of the sum element

fibonacci_loop:
    # Get the first element from the current position in array
    lw s2, 0(a3)
    # Get the second element from the next position in array
    lw s3, 0(a4)
    # Calculate the sum of the two elements
    add a5, s2, s3
    # Store the sum in the next position in the array
    sw a5, 0(s5)
    
    # Print the current Fibonacci number
    lw a0, 0(s5)
    li a7, 1          # Specify print syscall
    ecall             # Execute syscall

    # Print comma separator
    la a0, comma
    li a7, 4
    ecall

    # Move to the next elements in the arrays
    addi a3, a3, 4
    addi a4, a4, 4
    addi s5, s5, 4

    # Increment loop variable and check loop bounds
    addi a1, a1, 1
    blt a1, a2, fibonacci_loop  # Continue the loop if within bounds

    # End the program
    li a0, 0            # Specify exit code 0
    li a7, 93           # Specify exit syscall
    ecall               # Execute syscall

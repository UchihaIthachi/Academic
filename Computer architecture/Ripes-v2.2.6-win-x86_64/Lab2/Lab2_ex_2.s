.data
    array_1:      .word        1, 2, 3, 4, 5   # Declare the first array
    array_2:      .word        1, 2, 3, 4, 5   # Declare the second array

    # Define string literals
    comma:        .string      " , "           # Comma separator

.bss
    array_3:      .word 0                      # Declare space for the result array

.text
.globl main
main:
    # Loop setup
    li a1, 0          # Initialize loop control variable
    li a2, 20         # Set the upper bound for loop control
    la a5, array_3   # Load address of the result array
    la a3, array_1   # Load address of the first array
    la s6, array_2   # Load address of the second array
    addi s6, s6, 16  # Move s6 to the last element of array_2
    
    # Get the first element from array_1
    lw s2, 0(a3)
    # Get the corresponding element from the end of array_2
    lw s3, 0(s6)
    # Calculate the sum of the two elements
    add a4, s2, s3
    # Store the sum in array_3
    sw a4, 0(a5)    
    # Print the sum
    lw a0, 0(a5)
    li a7, 1
    ecall
    # Print comma separator
    la a0, comma
    li a7, 4
    ecall
    
    # Move to the next element in the arrays
    addi a1, a1, 4
    addi a3, a3, 4    # Move to the next element in array_1
    addi a5, a5, 4    # Move to the next element in array_3
    addi s6, s6, -4   # Move to the previous element in array_2
    
    # Continue looping if within bounds
    blt a1, a2, -60
     
    # End of program
    li a0, 0
    li a7, 93
    ecall

.data
    array:      .word         0, 1, 2, 7, -8 ,4 , 5 , 12 , 11 , -2,6,3 # Declare an array of elements
    
    # Define string literals
    comma:    .string       " , "                  
    c1:        .string       "[ "       # Opening bracket
    c2:       .string       "]"        # Closing bracket

.bss
    array_2:    .word 0

.text
.globl main
main:
    # Print opening bracket "["
    la a0, c1      # Load the address of the opening bracket to a0
    li a7, 1       # Specify print syscall
    ecall          # Execute syscall

    # Loop setup
    li a1, 0        # Loop control variable
    li a2, 48       # Upper bound for loop control variable
    la a3, array    # Address of the array
    add a4, a3, a1
    lw a5,0(a4)


    # Check if the first element is negative
    slti x8, a5, 0
    beq x8, a1, skip_print  # If negative, skip printing
    

    # Check if the first element is even
    lw x2, 0(a4)          # Get temp variable
    srli x2, x2, 1
    slli x2, x2, 1
    slt x3, x2, a5
    beq x3, a1, skip_print  # If not even, skip printing

    # Print the first element
    lw a0, 0(a3)    # Load the first element to be printed
    li a7, 1        # Specify print syscall
    ecall           # Execute syscall

    # Print comma separator
    la a0, comma
    li a7, 4
    ecall
    # Store the first element of the array in array_2
    la x6, array_2    # Address of the array
    addi x7, x6, 4  # Address of the second element
    sw a5, 0(x7)
skip_print:

    # Loop: Iterate through the array
    addi a1, a1, 4    # Increment loop variable by word size
    blt a1, a2, loop_start   # If within bounds, continue the loop

    # Print closing bracket "]"
    la a0, c2
    li a7, 4
    ecall

    # End the program
    li a0, 0
    li a7, 93
    ecall

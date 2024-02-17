.data
    array:      .word         9, 1, 2, 7, -8 ,4 , 5 , 12 , 11 , -2,6,3 # Declare an array of elements
    
    # Define string literals
    comma:    .string       " , "                  
.bss
    array_2:    .word 0

.text
.globl main
main:
    
    # Loop setup
    la s6, array_2    # Address of the array
    li s5,0
    
    li a1, 0        # Loop control variable
    li a2, 48       # Upper bound for loop control variable
    la a3, array    # Address of the array
    add a4, a3, a1
    lw a5,0(a4)

    # Check if the first element is negative
    sltz s2, a5
    bnez s2, 60  # If negative, skip printing    

    # Check if the first element is even
    lw s3, 0(a4)          # Get temp variable
    srli s3, s3, 1
    slli s3, s3, 1
    slt s4, s3,a5
    bnez s4, 40  # If not even, skip printing

    # Print the first element
    lw a0, 0(a4)    # Load the first element to be printed
    li a7, 1        # Specify print syscall
    ecall           # Execute syscall

    # Print comma separator
    la a0, comma
    li a7, 4
    ecall
    # Store the first element of the array in array_2
    
    sw a5, 0(s6)
    addi s6, s6, 4  # Address of the second element
    
    # Loop: Iterate through the array
    addi a1, a1, 4    # Increment loop variable by word size
    blt a1, a2, -76  
     # If within bounds, continue the loop

    # End the program
    li a0, 0
    li a7, 93
    ecall
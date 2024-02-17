.globl main
main:
    # Load immediate values into registers
    li a7, 5   # Load the value 5 into register a7
    li a6, 3   # Load the value 3 into register a6
    
    # Shift left by 3 (a6) to multiply a7 by 8
    sll a1, a7, a6
    
    # Subtract a7 from the multiplied value, effectively computing 5 * 7
    sub a0, a1, a7
    
    # End of program
    jr ra      # Return from the function

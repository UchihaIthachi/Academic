.globl main
main:
    # Load immediate values into registers
    li a7, 5   # Load 5 into register a0
    li a6 ,1
    
    # Check if 5 is odd, store the result in a2
    srl a1, a7, a6
    sll a1, a1, a6
    slt a0, a1, a7
    
    # End of program
    jr ra      # Return from the function

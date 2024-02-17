.globl main
main:
# Load immediate values into registers
li a0, 5 # Load 5 into register a0
li a4, 52106 # Load 52106 into register a4
# Add 10 to a0 and store in register a1
addi a1, a0, 10 # a1 = a0 + 10
# Take AND operation between a4 and 0b11101111100
# and store in register a5
andi a5, a4, 0b11101111100
# End of program
ret
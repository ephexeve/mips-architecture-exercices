# addressing modes
# addi example
# addi $s0, $s1, 10
#
#  op  rs  rt  imediate
# addi $s1 $s0 10
# just playing around :)

.data # data segment
newline: .asciiz "\n" # define newline = "\n"
.text

main:
	addi $s0, $0, 10 # $s0 = 10
	addi $a0, $s0, 101 # $a0 = $s0 + 101
	
	jal print_int # call print_int func and print $a0
	jal print_nw # jump to print_nw func
	
	addi $t0, $s0, -5 # $t0 = $s0 + (-5) = 5
	add $a0, $zero, $t0 # $a0 = 0 + $t0
	jal print_int # call print_int and print $a0
	
	jal halt # call halt
	
print_int:
	addi $v0, $zero, 1 # load PRINT_INTEGER system call to $v0
	syscall # print $a0
	
	jr $ra # return (copy $ra to PC)

halt: # halt program, not sure why this is needed after adding the print_nw func
	addi $v0, $0, 10 # load EXIT system call to $v0
	syscall
	
print_nw: # print newline function
	addi $v0, $zero, 4 # load PRINT_STRING system call to $v0
	la $a0, newline # load newline address to $a0
	syscall
	
	jr $ra # return (copy $ra to PC)

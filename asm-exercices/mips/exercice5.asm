# addressing through base-register
# lw $t7, 8($s0)
# format
# op rs  rt  relative address
# lw $s0 $t7 8

.data # data segment
numbers: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
newline: .asciiz "\n" # define newline = "\n"
.text

main:
	la $s0, numbers # load numbers address to $s0
	lw $t7, 0($s0) # $t7 should be numbers[0] which is 1
	lw $t0, 20($s0) # $t0 = numbers[5], since 4 * 5 (index) = 20
	
	add $a0, $zero, $t7 # $a0 = $zero + $t7 (numbers[0])
	jal print_int # call print_int and print $a0
	
	jal print_nw # call print_nw
	
	add $a0, $zero, $t0 # $a0 = $zero + $t0 (numbers[5])
	jal print_int # call print_int and print $a0
	
	jal halt

print_nw: # print newline function
	addi $v0, $zero, 4 # load PRINT_STRING system call to $v0
	la $a0, newline # load newline address to $a0
	syscall
	
	jr $ra

print_int:
	addi $v0, $zero, 1 # load PRINT_INTEGER system call to $v0
	syscall # print $a0
	
	jr $ra # return (copy $ra to PC)

halt: # halt program, not sure why this is needed after adding the print_nw func
	addi $v0, $0, 10 # load EXIT system call to $v0
	syscall
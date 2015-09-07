# addressing through registers
# add $s0, $s1, $s2
# format
# opcode   rs  rt  rd  shamt funct
# format R $s1 $s2 $s0 0     add

main:
	addi $s1, $zero, 10 # $s1 = $zero + 10
	addi $s2, $zero, 20 # $s2 = $zero + 20
	
	add $s0, $s1, $s2 # $s0 = $s1 + $s2
	add $a0, $zero, $s0 # $a0 = $zero + $s0
	
	jal print_int # call print_int and print $a0
	jal halt

print_int:
	addi $v0, $zero, 1 # load PRINT_INTEGER system call to $v0
	syscall # print $a0
	
	jr $ra # return (copy $ra to PC)
	
halt:
	add $v0, $0, 10 # load EXIT system call to $v0
	syscall
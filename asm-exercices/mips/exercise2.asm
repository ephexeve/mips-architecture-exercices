# Mips exercise
# From the book 'Computer Organisation and Design (2014)'
# A[12] = h + A[8]

.data # data segment

# define array A
A: .word 0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150

.text # code segment

main:
	addi $s2, $zero, 1 # $s2 = 1
	la $s3, A # address base is at $s3 (according to the exercise detail)
	
	lw $t0, 32($s3) # $t0 = A[8] = 8 * 4 = 32 (index)
	add $t0, $s2, $t0 # $t0 = $t0 + h
	sw $t0, 48($s3) # A[12] = $t0

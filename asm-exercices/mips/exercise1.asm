# Mips exercice
# From the book 'Computer Organisation and Design (2014)'
# f = (g + h) - (i + j)
# f = (4 + 3) - (2 + 1)
.text

main:
   	addi $v0, $zero, 1 # set $v0 to call PRINT_INTEGER
    addi $s1, $0, 4 # $s1 = 4
    addi $s2, $0, 3 # $s2 = 3
    addi $s3, $0, 2 # $s3 = 2
    addi $s4, $0, 1 # $s4 = 1

    add $t0, $s1, $s2 # $t0 = (4 + 3)
    add $t1, $s3, $s4 # $t1 = (2 - 1)
    sub $a0, $t0, $t1 # #a0 = $t0 - $t1
    syscall # print $a0

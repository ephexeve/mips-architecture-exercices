# Hello world for the Mips arch

# data segments
    .data # beginning of our data segments, where all
          # our variables will be defined.

msg:     .asciiz "Hello world!" # msg to print, duh!

    # code segments
    .text

main:
    addi $v0, $zero, 4 # $v0 = 4 (call to PRINT_STRING)
    la $a0, msg # loads the address of msg to $a0 (la is a pseudo-instruction)

    syscall # calls OS to write the msg

    addi $v0, $zero, 10 # $v0 = 0 (0 is the call to EXIT)
    syscall # ends program.

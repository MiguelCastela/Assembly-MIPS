 .data
 
numeros: .word 1,2,3,4,5,6,7,8,9,10
.text
li $t0, 0
li $t1, 0
li $t3, 0
la $t2, numeros

loop:
beq $t0,10,fim
addi $t0, $t0, 1
lw $t1, 0($t2)
add $t3, $t3, $t1
addi $t2, $t2, 4

j loop
fim:

li $v0, 1
move $a0, $t3
syscall
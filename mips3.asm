 .data
 
numeros: .word 1,2,3,4,5,10,7,8,9,3
.text
li $t0, 0
li $t1, 0
la $t2, numeros

loop:
beq $t0,10,fim
lw $t3, 0($t2)
bgt $t3, $t1, mudar
addi $t0, $t0, 1
addi $t2, $t2, 4
j loop


mudar:
move $t1, $t3
addi $t0, $t0, 1
addi $t2, $t2, 4
j loop

fim:
li $v0, 1
move $a0, $t1
syscall

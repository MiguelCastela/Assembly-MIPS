.data 
introduzir: .asciiz "introduz um inteiro"

.text
#mostrar texto
li $v0, 4
la $a0, introduzir
li $t5, 1

syscall


#pedir numero
li $v0, 5
syscall

move $t2, $v0
li $t3 ,3
mul $t2, $t2, $t3
subi $t1, $t2, 1

loop:
beq $t0, $t1, fim
addi $t0, $t0, 1
mul $t5, $t5, $t0
mflo $t5
j loop
fim: 
li $v0,1 
move $a0, $t5
syscall
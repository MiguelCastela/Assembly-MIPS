.data 
introduzir: .asciiz "introduz um inteiro"
feito: .asciiz "\nConcluido."

.text
#mostrar texto
li $v0, 4
la $a0, introduzir
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
li $v0, 1
move $a0, $t0
syscall
j loop
fim:




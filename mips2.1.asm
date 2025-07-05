.data
base: .word 0x10010000
yellow: .word  0x00FFFF00
.text
la $t0, base
lw $a0, 0($t0)
la $t0, yellow
lw $s0, 0($t0)
li $t0, 0
li $t1, 30
li $t2, 0
li $t3, 20

Linhas:
	beq $t0,$t1,jumpColunas
	addi $t0, $t0, 1
	sw $s0, 0($a0)
	addi $a0 , $a0, 4
	j Linhas


jumpColunas:
	beq $t2,$t3,Fim
	addi $t2, $t2, 1
	addi $a0 , $a0, 136   #120(30x4 +120) passa para a coluna de baixo
	li $t0, 0   #recomecar ciclo de cima
	j Linhas

Fim:
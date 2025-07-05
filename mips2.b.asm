.text
li $a0, 0x10010000    #base
li $s0, 0x00FF00FF    #magenta
li $s1, 0x000000FF    #azul
li $t0, 0
li $t1, 2048          #(256 x 128) / 4x4 
background:
    beq $t0,$t1, acabarbg
    addi $t0, $t0, 1
    sw $s1, 0($a0)
    addi $a0 , $a0, 4
    j background

acabarbg:
    li $a0, 0x10010000
    addi $a0, $a0, 3184   #256 x 12 + 112
    li $t0, 0
    li $t1, 8             #tamanho do quadrado (8 x 4 = 32)
    li $t2, 0
    j squareLines

squareLines:
    beq $t0,$t1, jumpsquareCols     #fazer uma linha inteira de 8
    addi $t0, $t0, 1
    sw $s0, 0($a0)
    addi $a0 , $a0, 4
    j squareLines
 	
jumpsquareCols:
    beq $t2,$t1, sair
    addi $t2, $t2, 1
    addi $a0, $a0, 224      #acabar o resto da linha e comecar na coluna aseguir
    li $t0, 0               #para fazer o loop de cima de novo
    j squareLines

sair:
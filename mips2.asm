.data
var: .word 100
a: .word 200

.text
la $a0, var
lw $s0, 0($a0)
addi $s1, $s0, 100
sw $s1, 0($a0)


li $v0, 1
move $s1, $a0
syscall
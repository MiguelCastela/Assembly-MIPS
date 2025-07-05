li $a0, 10
li $a1, 6
li $a2, 7
li $a3, 10


sub $t0, $a0, $a2
sub $t1,$a1,$a3
sub $t2, $t0, $t1
add $t3, $t2, 5


li $v0, 1
move $a0, $t3
syscall

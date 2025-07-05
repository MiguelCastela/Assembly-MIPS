.data 
p1: 16
p2: 20
res: 0

.text 
lw $t1, p1
lw $t2, p2
lw $t0, res
jal func

li  $v0, 1           # service 1 is print integer
add $a0, $t0, $zero  # load desired value into argument register $a0, using pseudo-op
syscall
j fim

func:
	sub $t0,$t1, $t2
	blez $t0, inverte
		
	j fimfunc
inverte:
	sub $t0, $zero, $t0
	j fimfunc

fimfunc:
jr $ra

fim:
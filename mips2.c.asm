	.data
dsp:	.word 0x10010000

	.text
# get display base address
la $t0, dsp
lw $s0, 0($t0)

li $s1, 256					# offset entire row
li $s2, 32					# heigth (rows) to paint
li $s3, 64					# width (cols) to paint

move $t0, $s0					# base address to increment
move $t1, $zero					# counter rows
move $t2, $zero					# counter columns
move $t3, $zero					# color

ROWS:
	beq $t1, $s2, END_ROWS			# if we reached the end of the area to paint, break from rows loop (stop painting)
	
	move $t0, $s0				# reset current pixel to base
	mul $t4, $s1, $t1			# calculate the offset to move to the beginning of the current row		
	add $t0, $t0, $t4			# move to the current row
	

END_ROWS:

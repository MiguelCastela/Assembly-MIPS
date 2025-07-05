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
	
	COLS:
		beq $t2, $s3, RESET_COLS	# if we reached the end of the area to paint, reset column counter and break from columns loop
		
		sw $t3, 0($t0)			# paint
		
		addi $t3, $t3, 1024		# update color (+ 4 * 0x100)
		
		addi $t2, $t2, 1		# increment columns
		addi $t0, $t0, 4		# add 4 bytes (one pixel forward)
		
		j COLS				# loop
		
		RESET_COLS:
			move $t2, $zero		# go back to first column
			subi $t3, $t3, 65536	# reset increments on green (0x10000)
			j END_COLS		# break from looping through the columns
		SKIP_RESET:
	END_COLS:
	
	addi $t3, $t3, 262144			# update color (+ 4 * 0x10000)
	addi $t1, $t1, 1			# increment rows
	j ROWS					# loop
END_ROWS:
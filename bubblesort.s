.text
init:
	li t0, 0x400		# initialize array with values
	li t1, 89
	sw t1, 0(t0)
	li t1, 63
	sw t1, 4(t0)
	li t1, -55
	sw t1, 8(t0)
	li t1, -107
	sw t1, 12(t0)
	li t1, 42
	sw t1, 16(t0)
	li t1, 98
	sw t1, 20(t0)
	li t1, -425
	sw t1, 24(t0)
	li t1, 203
	sw t1, 28(t0)
	li t1, 0
	sw t1, 32(t0)
	li t1, 303
	sw t1, 36(t0)

	li s0, 9			# num elements - 1
	add s1, x0, t0	    # current element address
	li s2, 0			# has a swap operation been made?
	li s3, 0			# loop index

bubble:
	beq s3, s0, loop
	lw s4, 0(s1)		# sortarray[i]
	lw s5, 4(s1)		# sortarray[i+1]
	blt s5, s4, swap	# if (sortarray[i+1] < sortarray[i]), swap

	addi s1, s1, 4 		# advance element address by word offset
	addi s3, s3, 1		# advance loop index by 1
	j bubble			# no swap, continue

loop:
	beq s2, x0, end		# repeat until no swap operation has been made
	add s1, x0, t0		# reset element address
	addi s3, x0, 0		# reset loop index
	addi s2, x0, 0		# reset swap operation flag
	j bubble

swap:
	sw s4, 4(s1)		# swap
	sw s5, 0(s1)		# swap
	addi s2, x0, 1		# set swap operation flag = 1
	addi s1, s1, 4 		# advance element address by word offset
	addi s3, s3, 1		# advance loop index by 1
	j bubble

end:
	j end

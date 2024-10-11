.text
main:
	addi a0, zero, 0x400	# base address of sortarray
	addi a1, zero, 15		# 15-element array
	jal init
	jal bubblesort
	j end

init:
	li t0, -15				# initialize
	sw t0, 0(a0)
	li t0, 42
	sw t0, 4(a0)
	li t0, 73
	sw t0, 8(a0)
	li t0, 19
	sw t0, 12(a0)
	li t0, -8
	sw t0, 16(a0)
	li t0, 24
	sw t0, 20(a0)
	li t0, 16
	sw t0, 24(a0)
	li t0, -2
	sw t0, 28(a0)
	li t0, 99
	sw t0, 32(a0)
	li t0, -78
	sw t0, 36(a0)
	li t0, -21
	sw t0, 40(a0)
	li t0, 23
	sw t0, 44(a0)
	li t0, -88
	sw t0, 48(a0)
	li t0, 49
	sw t0, 52(a0)
	li t0, -101
	sw t0, 56(a0)

	addi s0, a1, -1		# num elements - 1
	add s1, zero, a0	# current element address
	li s2, 0			# has a swap operation been made?
	li s3, 0			# loop index

	jr ra

bubblesort:
	bubble:
		beq s3, s0, loop
		lw s4, 0(s1)		# sortarray[i]
		lw s5, 4(s1)		# sortarray[i+1]
		blt s5, s4, swap	# if (sortarray[i+1] < sortarray[i]), swap

		addi s1, s1, 4 		# advance element address by word offset
		addi s3, s3, 1		# advance loop index by 1
		j bubble			# no swap, continue

	loop:
		beq s2, x0, finish	# repeat until no swap operation has been made
		add s1, x0, a0		# reset element address
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

	finish:
		jr ra

end:
	j end

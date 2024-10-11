.text
init:
	li t0, 0x300
	li t1, 0x12345678		# word 1
	sw t1, 0(t0)
	li t1, 0x12345678		# word 2
	sw t1, 4(t0)
	li t1, 0x12345678		# word 3
	sw t1, 8(t0)
	li t1, 0x12345678		# word 4
	sw t1, 12(t0)
	li t1, 0x12345678		# word 5
	sw t1, 16(t0)
	li t1, 0x12345678		# word 6
	sw t1, 20(t0)
	li t1, 0x12345678		# word 7
	sw t1, 24(t0)
	li t1, 0x12345678		# word 8
	sw t1, 28(t0)

	li t0, 0x300		# load starting address into t0
	addi t1, x0, 8		# max loop iterations

swap:
	beq t1, x0, end		# end loop once all 8 words have been converted

	lb t3, 0(t0)		# load byte 1 into memory
	lb t4, 3(t0)		# load byte 4 into memory
	sb t3, 3(t0)		# store byte 1 at position of byte 4
	sb t4, 0(t0)		# store byte 4 at position of byte 1

	lb t3, 1(t0)		# load byte 2 into memory
	lb t4, 2(t0)		# load byte 3 into memory
	sb t3, 2(t0)		# store byte 2 at position of byte 3
	sb t4, 1(t0)		# store byte 3 at position of byte 2

	addi t0, t0, 4		# move to next word address
	addi t1, t1, -1		# update loop counter
	j swap

end:
	j end

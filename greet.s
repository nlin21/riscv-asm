.text
main:
	addi a0, zero, 7
	jal greet				# greet(7)
	add s2, a0, zero		# save result to s2
	addi a0, zero, 10
	jal greet				# greet(10)
	add s3, a0, zero		# save result to s3
	j end

greet:
	addi sp, sp, -8			# make room for a0, ra
	sw a0, 4(sp)
	sw ra, 0(sp)
	beq a0, zero, ret0
	addi a0, a0, -1			# n = n-1
	jal greet
	lw t1, 4(sp)			# restore n into t1
	lw ra, 0(sp)			# restore ra
	addi sp, sp, 8			# restore sp
	addi t1, t1, -1			# (n-1)
	add a0, t1, a0			# a0 = (n-1) + greet(n-1)
	jr ra

ret0:
	add a0, zero, zero
	addi sp, sp, 8			# restore sp
	jr ra

end:
	j end

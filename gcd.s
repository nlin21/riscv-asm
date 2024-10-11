.text
main:
	addi a0, zero, 25		
	addi a1, zero, 15
	jal gcd					# gcd(25,15)
	add s2, a0, zero		# save result to s2
	addi a0, zero, 64
	addi a1, zero, 96
	jal gcd					# gcd(64,96)
	add s3, a0, zero		# save result to s3
	addi a0, zero, 71
	addi a1, zero, 9
	jal gcd					# gcd(71,9)
	add s4, a0, zero		# save result to s4
	j end

gcd:
	addi sp, sp, -4			# make room for ra
	sw ra, 0(sp)
	beq a0, zero, retB
	beq a1, zero, retA
	remu s0, a0, a1
	add a0, zero, a1
	add a1, zero, s0
	jal gcd
	lw ra, 0(sp)			# restore ra
	addi sp, sp, 4			# restore sp
	jr ra

retB:
	add a0, zero, a1
	addi sp, sp, 4			# restore sp
	jr ra

retA:
	add a0, zero, a0
	addi sp, sp, 4			# restore sp
	jr ra

end:
	j end

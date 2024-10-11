.text
main:
	addi a0, zero, 15		# set argument a0 = 15
	jal div9				# call div9
	add s2, a0, zero		# save return value
	addi a0, zero, 81		# set argument a0 = 81
	jal div9				# call div9
	add s3, a0, zero		# save return value
	j end					# end of program

div9:
	subtract:
		addi t0, t0, 9				# divisor
		sub a0, a0, t0				# subtract by 9
		beq a0, zero, is_divisible	# if result is zero, we know it is divisible by 9
		bge a0, t0, subtract		# if result >= 9, we can repeat subtract operation
		j is_not_divisible			# if result < 9, we know it is not divisble by 9

	is_divisible:
		addi a0, zero, 1		# set a0 to 1
		jr ra					# return to caller

	is_not_divisible:
		addi a0, zero, 0		# set a0 to 0
		jr ra					# return to caller

end:
	j end

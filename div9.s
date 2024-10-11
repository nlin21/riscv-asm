.text
init:
	addi a0, a0, 18		# load value into register a0 (a0 >= 0)
	addi t0, t0, 9		# divisor

subtract:
	sub a0, a0, t0				# subtract
	beq a0, x0, is_divisible	# if result is zero, we know it is divisible by 9
	bge a0, t0, subtract		# if result >= 9, we can repeat subtract operation
	j is_not_divisible			# if result < 9, we know it is not divisble by 9

is_divisible:
	addi a0, x0, 1		# set a0 to 1
	j end				# end

is_not_divisible:
	addi a0, x0, 0		# set a0 to 0
	j end				# end

end:
	j end		# repeatedly jump to end

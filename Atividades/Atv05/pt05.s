# Felipe Roveroni de Lima   RA112675

.section .data

saida: .asciz "Teste %d: Resultado = Hex: %X Dec: %d\n\n"
saida2: .asciz "Teste %d: Quoc > Hex: %X Dec: %d e Resto > Hex: %X Dec: %d\n\n"
saida3: .asciz "Teste %d: Resultado = Hex: %X:%X\n\n"

.section .text


.globl _start

_start:

	somadores:

		# Parte 1
		movl	$0x12340000, %eax 	# 305.397.760 em decimal
		movl	$0x00005678, %ebx 	# 	   22.136 em decimal
		addl 	%ebx, %eax 			# %eax ← %eax + %ebx
		pushl 	%eax
		pushl 	%eax
		pushl 	$1
		pushl 	$saida
		call 	printf

		# Parte 2
		movl 	$0xCFFF1234, %eax 	# -805.367.244 em decimal
		movl 	$0xDFFF5678, %ebx 	# -536.914.312 em decimal
		addl 	%ebx, %eax 			# %eax ← %eax + %ebx
		pushl 	%eax
		pushl 	%eax
		pushl 	$2
		pushl 	$saida
		call 	printf	

		# Parte 3
		movl 	$0x11001234, %eax 	# 285.217.332 em decimal
		movl 	$0x00114321, %ebx 	# 	1.131.297 em decimal
		addw 	%bx, %ax 			# %ax <- %ax + %bx
		pushl 	%eax
		pushl 	%eax
		pushl 	$3
		pushl 	$saida
		call 	printf

		# Parte 4
		movl 	$0xFFFFF456, %eax 	# -2986 em decimal
		movl 	$0xFFFFFCBB, %ebx 	#  -837 em decimal
		addw 	%bx, %ax 			# %ax <- %ax + %bx : -3.823
		pushl 	%eax
		pushl 	%eax
		pushl 	$4
		pushl 	$saida
		call 	printf

		# Parte 5
		movl 	$0x11005534, %eax 	# 285.234.484 em decimal
		movl 	$0x0011AA21, %ebx 	# 	1.157.665 em decimal
		addb 	%bl, %al 			# %al <- %al + %bl
		pushl 	%eax
		pushl 	%eax
		pushl 	$5
		pushl 	$saida
		call 	printf

		# Parte 6
		movl 	$0xFFFFFF56, %eax 	# -170 em decimal
		movl 	$0xFFFFFFBB, %ebx 	#  -69 em decimal
		addb 	%bl, %al 			# %al <- %al + %bl
		pushl 	%eax
		pushl 	%eax
		pushl 	$6
		pushl 	$saida
		call 	printf

		# Parte 7
		movl 	$0x11005534, %eax 	# 285.234.484 em decimal
		movl 	$0x0011AA21, %ebx 	#   1.157.665 em decimal
		addb 	%bh, %ah 			# %ah <- %ah + %bh
		pushl 	%eax
		pushl 	%eax
		pushl 	$7
		pushl 	$saida
		call 	printf

		# Parte 8
		movl 	$0xFFFFFF56, %eax 	# -170 em decimal
		movl 	$0xFFFFFFBB, %ebx 	#  -69 em decimal
		addb 	%bh, %ah 			# %ah <- %ah + %bh
		pushl 	%eax
		pushl 	%eax
		pushl 	$8
		pushl 	$saida
		call 	printf

	subtracoes:
		# Parte 1
		movl 	$0x12345678, %eax 	# 305.419.896
		movl 	$0x02040608, %ebx 	#  33.818.120
		subl 	%ebx, %eax 			# %eax ← %eax - %ebx
		pushl 	%eax
		pushl 	%eax
		pushl 	$9
		pushl 	$saida
		call 	printf

		# Parte 2
		movl 	$-1412627919, %eax
		movl 	$-2627000, %ebx
		subl 	%ebx, %eax 			# %eax <- %eax - %ebx
		pushl 	%eax
		pushl 	%eax
		pushl 	$10
		pushl 	$saida
		call 	printf

		# Parte 3
		movl 	$0x12345678, %eax 	# 305.419.896
		movl 	$0x02040608, %ebx 	# 33.818.120
		subw 	%bx, %ax 			# %ax ← %ax - %bx
		pushl 	%eax
		pushl 	$11
		pushl 	$saida
		call 	printf

		# Parte 4
		movl 	$-0x1234ABFF, %eax 	# -305.441.791 (dec) ou EDCB5401 (complemento de 2 [cp2])
		movl 	$-0xABFF, %ebx 		#      -44.031 (dec) ou FFFF5401 (cp2)
		subw 	%bx, %ax 			# %ax <- %ax - %bx
		pushl 	%eax
		pushl 	%eax
		pushl 	$12
		pushl 	$saida
		call 	printf

		# Parte 5
		movl 	$0x12345678, %eax 	# 305.419.896
		movl 	$0x02040608, %ebx 	#  33.818.120
		subb 	%bl, %al 			# %al ← %al - %bl
		pushl 	%eax
		pushl 	%eax
		pushl 	$13
		pushl 	$saida
		call 	printf

		# Parte 6
		movl 	$-0x1234ABFF, %eax 	# -305.441.791 (dec) ou EDCB5401 (cp2)
		movl 	$-0xABFF, %ebx 		#      -44.031 (dec) ou FFFF5401 (cp2)
		subb 	%bl, %al 			# %al ← %al - %bl
		pushl 	%eax
		pushl 	%eax
		pushl 	$14
		pushl 	$saida
		call 	printf

		# Parte 7
		movl 	$0x12345678, %eax 	# 305.419.896
		movl 	$0x02040608, %ebx 	# 33.818.120
		subb 	%bh, %ah 			# %ah ← %ah - %bh
		pushl 	%eax
		pushl 	%eax
		pushl 	$15
		pushl 	$saida
		call 	printf

		# Parte 8
		movl 	$-0x1234ABFF, %eax 	# -305.441.791 (dec) ou EDCB5401 (cp2)
		movl 	$-0xABFF, %ebx 		# 	   -44.031 (dec) ou FFFF5401 (cp2)
		subb 	%bh, %ah 			# %ah ← %ah - %bh
		pushl 	%eax
		pushl 	%eax
		pushl 	$16
		pushl 	$saida
		call 	printf

	incrementa:
		# Parte 1
		movl 	$0xA4, %eax
		incl 	%eax 				# %eax ← %eax + 1
		incw 	%ax 				#  %ax ←  %ax + 1
		incb 	%al 				#  %al ←  %al + 1
		pushl 	%eax
		pushl 	%eax
		pushl 	$17
		pushl 	$saida
		call 	printf

	decrementa:
		#Parte 1
		movl 	$0xA4, %eax
		decl 	%eax 				# %eax ← %eax - 1
		decw 	%ax 				#  %ax ←  %ax - 1
		decb 	%al 				#  %al ←  %al - 1
		pushl 	%eax
		pushl 	%eax
		pushl 	$18
		pushl 	$saida
		call 	printf

	divisao:
		# Parte 1
		movl 	$0x0000A4C8, %edx
		movl 	$0x00001234, %eax
		movl 	$0xA4C80, %ebx
		divl 	%ebx 				# %eax ← %edx:%eax / %ebx
		pushl 	%edx
		pushl 	%edx
		pushl 	%eax
		pushl 	%eax
		pushl 	$19
		pushl 	$saida2
		call 	printf

		# Parte 2
		movl 	$0x0000A4C8, %edx
		movl 	$0x00001234, %eax
		movl 	$-0xA4C80, %ebx
		idivl 	%ebx 				# %eax ← %edx:%eax / %ebx
		pushl 	%edx
		pushl 	%edx
		pushl 	%eax
		pushl 	%eax
		pushl 	$20
		pushl 	$saida2
		call 	printf

		# Parte 3
		movl 	$-0x0000A4C8, %edx
		subl 	$1, %edx 			# anulamos o cp2 e apenas mantemos o cp1
		movl 	$-0x00001234, %eax
		movl 	$0xA4C80, %ebx
		idivl 	%ebx 				# %eax ← %edx:%eax / %ebx
		pushl 	%edx
		pushl 	%edx
		pushl 	%eax
		pushl 	%eax
		pushl 	$21
		pushl 	$saida2
		call 	printf

		# Parte 4
		movl 	$0, %edx
		movl 	$0x24682467, %eax
		movl 	$2, %ebx
		divl 	%ebx 				# %eax ← %edx:%eax / %ebx
		pushl 	%edx
		pushl 	%edx
		pushl 	%eax
		pushl 	%eax
		pushl 	$22
		pushl 	$saida2
		call 	printf

		# Parte 5
		movl 	$0, %edx
		movl 	$0x24682467, %eax
		movl 	$-2, %ebx
		idivl 	%ebx 				# %eax ← %edx:%eax / %ebx
		pushl 	%edx
		pushl 	%edx
		pushl 	%eax
		pushl 	%eax
		pushl 	$23
		pushl 	$saida2
		call 	printf

		# Parte 6
		movl 	$-0x24682467, %eax
		movl 	$2, %ebx
		cdq
		idivl 	%ebx 				# %eax ← %edx:%eax / %ebx
		pushl 	%edx
		pushl 	%edx
		pushl 	%eax
		pushl 	%eax
		pushl 	$24
		pushl 	$saida2
		call 	printf

		# Parte 7
		movl 	$0, %eax
		movl 	$0x1, %edx
		movw 	$0x2F73, %ax
		movw 	$0x12F7, %bx
		divw 	%bx 				# %ax ← %dx:%ax / %bx, o resto fica em %dx
		pushl 	%edx
		pushl 	%edx
		pushl	%eax
		pushl 	%eax
		pushl 	$25
		pushl 	$saida2
		call 	printf

		# Parte 8
		movl 	$0, %eax
		movl 	$0, %edx
		movw 	$0x01F5, %ax
		movb 	$0x1F, %bl
		divb 	%bl 				# %al ← %ax / %bl, o resto fica em %ah
		movl 	%eax, %edx
		sarw 	$8,%dx
		pushl 	%edx
		pushl 	%edx
		andw 	$0x00FF, %ax
		pushl 	%eax
		pushl 	%eax
		pushl 	$26
		pushl 	$saida2
		call 	printf

	multiplicacao:
		# Parte 1
		movl 	$0xFFFFFFFF, %eax
		movl 	$0x2, %ebx
		mull 	%ebx				# %edx:%eax ← %eax * %ebx
		pushl	%eax
		pushl 	%edx
		pushl 	$27
		pushl 	$saida3
		call 	printf
		
		# Parte 2
		movl 	$0, %edx 			# apenas para limpar antes
		movl 	$0, %eax 			# apenas para limpar antes
		movw 	$0xFFFF, %ax
		movw 	$0x2, %bx
		mulw 	%bx 				# %dx:%ax ← %ax * %bx
		pushl 	%eax
		pushl 	%edx
		pushl 	$28
		pushl 	$saida3
		call 	printf
		
		# Parte 3
		movl 	$0, %edx 			# apenas para limpar antes
		movl 	$0, %eax 			# apenas para limpar antes
		movb 	$0xFF, %al
		movb 	$0x2, %bl
		mulb 	%bl 				# %ah:%al ← %al * %bl
		pushl 	%eax
		pushl 	%eax
		pushl 	$29
		pushl 	$saida
		call 	printf

	troca_sinal:
		# Parte 1
		negb 	%al
		negw 	%ax
		negl 	%eax

_end:
pushl $0
call exit

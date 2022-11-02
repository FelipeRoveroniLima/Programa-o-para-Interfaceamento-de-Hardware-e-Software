.section .data

	abert:	.asciz	"\nPrograma para Ordenar 4 Numeros\n\n\n"
	pedeN:	.asciz	"\nDigite N%d => "
	tipoN:	.asciz	"%d"

	mostra:	.asciz	"\nNumeros Ordenados: %d, %d, %d, %d\n\n"

	perg:	.asciz	"\nDeseja nova ordenacao <S>im/<N>ao? " 

	tipoC:	.asciz	" %c"	# o espaço remove <tab>s e <enter>s
				# antes do caractere a ser lido

	n1:	.int	0
	n2:	.int	0
	n3:	.int	0
	n4: .int	0

	resp:	.byte	'n'
	

.section .text
.globl _start

_start:

	pushl	$abert
	call	printf

	pushl	$1
	pushl	$pedeN
	call	printf
	pushl	$n1
	pushl	$tipoN
	call	scanf

	pushl	$2
	pushl	$pedeN
	call	printf
	pushl	$n2
	pushl	$tipoN
	call	scanf

	pushl	$3
	pushl	$pedeN
	call	printf
	pushl	$n3
	pushl	$tipoN
	call	scanf

	pushl	$4
	pushl	$pedeN
	call	printf
	pushl	$n4
	pushl	$tipoN
	call	scanf

	addl	$56, %esp

	movl	n2, %eax
	cmpl	n1, %eax
	jg		n2_n1


/*==============================*/
/*=======PRIMEIRA METADE========*/
/*==============================*/

n1_n2:
	movl	n2, %eax
	cmpl	n3, %eax
	jg		n1_n2_n3

	movl	n1, %eax
	cmpl	n3,	%eax
	jb		n3_n1_n2

	jmp		n1_n3_n2

n1_n2_n3:
	movl	n1, %eax
	cmpl	n4,	%eax
	jb		n4_n1_n2_n3 	# FINAL

	movl	n3, %eax
	cmpl	n4, %eax
	jg		n1_n2_n3_n4 	# FINAL
	
	jmp		n1_what_n3

n1_what_n3:
	movl	n2, %eax
	cmpl	n4, %eax
	jg		n1_n2_n4_n3 	# FINAL

	jmp		n1_n4_n2_n3 	# FINAL

n3_n1_n2:
	movl	n3, %eax
	cmpl	n4,	%eax
	jb		n4_n3_n1_n2		# FINAL

	movl	n2, %eax
	cmpl	n4, %eax
	jg		n3_n1_n2_n4		# FINAL
	
	jmp		n3_what_n2

n3_what_n2:
	movl	n1, %eax
	cmpl	n4, %eax
	jg		n3_n1_n4_n2		# FINAL

	jmp		n3_n4_n1_n2		# FINAL

n1_n3_n2:
	movl	n1, %eax
	cmpl	n4,	%eax
	jb		n4_n1_n3_n2		# FINAL

	movl	n2, %eax
	cmpl	n4, %eax
	jg		n1_n3_n2_n4		# FINAL
	
	jmp		n1_what_n2

n1_what_n2:
	movl	n3, %eax
	cmpl	n4, %eax
	jg		n1_n3_n4_n2		# FINAL

	jmp		n1_n4_n3_n2		# FINAL


/*==============================*/
/*========SEGUNDA METADE========*/
/*==============================*/

n2_n1:
	movl	n1, %eax
	cmpl	n3, %eax
	jg		n2_n1_n3

	movl	n2, %eax
	cmpl	n3,	%eax
	jb		n3_n2_n1

	jmp		n2_n3_n1

n2_n1_n3:
	movl	n1, %eax
	cmpl	n4,	%eax
	jb		n4_n2_n1_n3		# FINAL

	movl	n3, %eax
	cmpl	n4, %eax
	jg		n2_n1_n3_n4		# FINAL
	
	jmp		n2_what_n3

n2_what_n3:
	movl	n1, %eax
	cmpl	n4, %eax
	jg		n2_n1_n4_n3		# FINAL

	jmp		n2_n4_n1_n3		# FINAL

n3_n2_n1:
	movl	n3, %eax
	cmpl	n4,	%eax
	jb		n4_n3_n2_n1		# FINAL

	movl	n1, %eax
	cmpl	n4, %eax
	jg		n3_n2_n1_n4		# FINAL
	
	jmp		n3_what_n1

n3_what_n1:
	movl	n2, %eax
	cmpl	n4, %eax
	jg		n3_n2_n4_n1		# FINAL

	jmp		n3_n4_n2_n1		# FINAL

n2_n3_n1:
	movl	n2, %eax
	cmpl	n4,	%eax
	jb		n4_n2_n3_n1		# FINAL

	movl	n1, %eax
	cmpl	n4, %eax
	jg		n2_n3_n1_n4		# FINAL
	
	jmp		n2_what_n1

n2_what_n1:
	movl	n3, %eax
	cmpl	n4, %eax
	jg		n2_n3_n4_n1		# FINAL

	jmp		n2_n4_n3_n1		# FINAL


/*==============================*/
/*==========RESULTADOS==========*/
/*==============================*/

n1_n2_n3_n4:
	pushl	n4
	pushl	n3
	pushl	n2
	pushl	n1
	jmp		fim

n1_n2_n4_n3:
	pushl	n3
	pushl	n4
	pushl	n2
	pushl	n1
	jmp		fim

n1_n3_n2_n4:
	pushl	n4
	pushl	n2
	pushl	n3
	pushl	n1
	jmp		fim	

n1_n3_n4_n2:
	pushl	n2
	pushl	n4
	pushl	n3
	pushl	n1
	jmp		fim

n1_n4_n2_n3:
	pushl	n3
	pushl	n2
	pushl	n4
	pushl	n1
	jmp		fim

n1_n4_n3_n2:
	pushl	n2
	pushl	n3
	pushl	n4
	pushl	n1
	jmp		fim

n2_n1_n3_n4:
	pushl	n4
	pushl	n3
	pushl	n1
	pushl	n2
	jmp		fim

n2_n1_n4_n3:
	pushl	n3
	pushl	n4
	pushl	n1
	pushl	n2
	jmp		fim

n2_n3_n1_n4:
	pushl	n4
	pushl	n1
	pushl	n3
	pushl	n2
	jmp		fim

n2_n3_n4_n1:
	pushl	n1
	pushl	n4
	pushl	n3
	pushl	n2
	jmp		fim

n2_n4_n1_n3:
	pushl	n3
	pushl	n1
	pushl	n4
	pushl	n2
	jmp		fim

n2_n4_n3_n1:
	pushl	n1
	pushl	n3
	pushl	n4
	pushl	n2
	jmp		fim

n3_n1_n2_n4:
	pushl	n4
	pushl	n2
	pushl	n1
	pushl	n3
	jmp		fim

n3_n1_n4_n2:
	pushl	n2
	pushl	n4
	pushl	n1
	pushl	n3
	jmp		fim

n3_n2_n1_n4:
	pushl	n4
	pushl	n1
	pushl	n2
	pushl	n3
	jmp		fim

n3_n2_n4_n1:
	pushl	n1
	pushl	n4
	pushl	n2
	pushl	n3
	jmp		fim

n3_n4_n1_n2:
	pushl	n2
	pushl	n1
	pushl	n4
	pushl	n1
	jmp		fim

n3_n4_n2_n1:
	pushl	n1
	pushl	n2
	pushl	n4
	pushl	n3
	jmp		fim

n4_n1_n2_n3:
	pushl	n3
	pushl	n2
	pushl	n1
	pushl	n4
	jmp		fim

n4_n1_n3_n2:
	pushl	n2
	pushl	n3
	pushl	n1
	pushl	n4
	jmp		fim

n4_n2_n1_n3:
	pushl	n3
	pushl	n1
	pushl	n2
	pushl	n4
	jmp		fim

n4_n2_n3_n1:
	pushl	n1
	pushl	n3
	pushl	n2
	pushl	n4
	jmp		fim

n4_n3_n1_n2:
	pushl	n2
	pushl	n1
	pushl	n3
	pushl	n4
	jmp		fim

n4_n3_n2_n1:
	pushl	n1
	pushl	n2
	pushl	n3
	pushl	n4

fim:	
	pushl	$mostra
	call	printf

	addl	$16, %esp

	pushl	$perg
	call	printf

	pushl	$resp
	pushl	$tipoC
	call	scanf

	movb	resp, %al
	cmpb	$'s',%al
	je	_start

	pushl	$0
	call	exit

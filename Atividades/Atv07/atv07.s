# Felipe Roveroni de Lima	RA112675

section .data

	area:		.int	0
	opcao:		.int	0
	raio:		.float	0


	abertura:	.asciz	"\nCalculo de Areas de Figuras Geometricas\n\n"
	abertCir:	.asciz	"\nCalculo da Area da Circunferencia\n"

	menuOpcao:	.asciz	"\nMenu de Opcao:\n<1> Area da Circunferencia"

	pedeRaio:	.asciz	"\nDigite o valor do raio => "
	pedeOpcao:	.asciz	"\nDigite a opcao => "

	mostraCir:	.asciz	"\nArea da Circunferencia= %f\n\n"

	tipoFloat:	.asciz	"%f"
	tipoDado:	.asciz	"%d"

.section .text

.globl _start

_start:

	pushl	$abertura
	call	printf
	finit

	pushl	$menuOpcao
	call	printf

	pushl	$pedeOpcao
	call	printf
	pushl	$opcao
	pushl	$tipoDado
	call	scanf

	movl	opcao, %eax
	cmpl	$1, %eax
	je	_calcCir

	addl	$20, %esp
	jmp	_start

_calcCir:
	pushl	$abertCir
	call 	printf
	jmp		_cont


_cont:

	pushl	$pedeRaio
	call	printf
	pushl	$raio
	pushl	$tipoFloat
	call	scanf

	flds raio
	fmuls raio
	fldpi
	fmul %st(1), %st(0)

_mostraCir:

	subl	$8, %esp
	fstpl	(%esp)
	pushl	$mostraCir
	call	printf

_fim:

	addl	$56, %esp

	pushl	$0
	call	exit


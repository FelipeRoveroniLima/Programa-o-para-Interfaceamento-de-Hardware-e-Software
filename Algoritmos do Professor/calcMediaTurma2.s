
.section .data

	abertura:	.asciz		"Programa para Calculo da Media\n"

	pedeNroAlunos:	.asciz		"Digite o numero de alunos => "
	pedeNota:	.asciz		"Digite a nota %d => "
	mostraMedia:	.asciz		"Media da Turma = %d"

	nAlunos:	.int	0
	nota:		.int	0
	soma:		.int	0
	media:		.int	0

	tipoNum:	.asciz	"%d"
	
	
.section .text

	
.globl	_start
_start:

	pushl	$abertura
	call	printf

_volta1:
	pushl	$pedeNroAlunos
	call	printf

	pushl	$nAlunos
	pushl	$tipoNum
	call	scanf

	addl	$12, %esp

	movl	nAlunos, %eax
	cmpl	$0, %eax
	jle	_volta1

	movl	nAlunos, %ecx
	movl	$1, %ebx

_volta2:

	pushl	%ecx
	pushl	%ebx
	pushl	$pedeNota
	call	printf

	pushl	$nota
	pushl	$tipoNum
	call	scanf

	addl	$12, %esp
	popl	%ebx
	popl	%ecx
	
	movl	nota, %eax

	cmpl	$0, %eax
	jl	_volta2

	addl	soma, %eax
	movl	%eax, soma
	
	incl	%ebx
	loop	_volta2

	movl	$0, %edx
	movl	nAlunos, %ebx
	divl	%ebx

	movl	%eax, media

	pushl	media
	pushl	$mostraMedia
	call	printf
	addl	$8, %esp
	
_fim:

	pushl	$0
	call	exit


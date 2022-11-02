# Felipe Roveroni de Lima	RA112675

.section .data

	abertura:	.asciz		"Programa para Calculo da Media\n"

	pedeNroAlunos:	.asciz		"\nDigite o numero de alunos => "
	pedeNota:		.asciz		"\nDigite a nota (de 0 a 100) %d => "
	mostraMedia:	.asciz		"\nMedia da Turma = %d\n"
	mostraMenor:	.asciz		"\nMenor nota = %d\n\n"
	mostraMaior:	.asciz		"\nMaior nota = %d\n"

	nAlunos:	.int	0
	nota:		.int	0
	soma:		.int	0
	media:		.int	0
	maior:		.int	-1
	menor:		.int	101

	tipoNum:	.asciz	"%d"
	
	
.section .text


.globl	_start
_start:

	pushl	$abertura
	call	printf

_volta1:
    pushl   $pedeNroAlunos
    call    printf
 
    pushl   $nAlunos
    pushl   $tipoNum
    call    scanf
 
    addl    $12, %esp
 
    movl    nAlunos, %eax
    cmpl    $0, %eax
    jle 	_volta1
 
    movl    nAlunos, %ecx
    movl    $1, %ebx

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
	jl		_volta2

	addl	soma, %eax
	movl	%eax, soma

	movl	nota, %edx
	
_maior_ou_menor:
	cmpl	maior, %edx
	jg		_novo_maior

	cmpl	menor, %edx
	jl		_novo_menor
	
	jmp		_passo

_novo_maior:
	movl	%edx, maior
	jmp		_maior_ou_menor

_novo_menor:
	movl	%edx, menor
	jmp		_passo

_passo:
	incl	%ebx
	loop	_volta2

	movl	$0, %edx
	movl	nAlunos, %ebx
	divl	%ebx

	movl	%eax, media

	pushl	media
	pushl	$mostraMedia
	call	printf

	pushl	maior
	pushl	$mostraMaior
	call	printf

	pushl	menor
	pushl	$mostraMenor
	call	printf

	addl	$24, %esp

_fim:
	pushl	$0
	call	exit


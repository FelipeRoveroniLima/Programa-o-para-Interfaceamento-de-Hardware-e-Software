/*

Vamos supor um registro (record ou struct) com os seguintes campos:

- Nome: 60 caracteres + final de string ('\0') (= 64 bytes)
- Gênero (sexo): 1 caractere 'M' ou 'F' (= 4 bytes)
- RG: 1 inteiro = 4 bytes
- CPF: 11 caracteres + 3 caracteres especiais + '\0' (16 bytes)
- Data de Nascimento: dia, mes e ano (3 inteiros = 12 bytes)
- Idade: (1 inteiro = 4 bytes)
- Contato Telefonico: ddd (2 caracteres + \0 = 4 bytes)
- telefone (9 caracteres + 1 separador + \0 = 12 bytes)
- Ponteiro: 4 bytes (para apontar para o proximo)

Total = 64+4+4+16+12+4+4+12+4 = 124 bytes

Obs: Para um alinhamento adequado de memória, cada campo deve ter uma
quantidade de bytes que seja multiplo de 4 bytes, pois o acesso em
arquiteturas de 32bits eh feito de 4 em 4 bytes.

O codigo a seguir faz a leitura e escrito deste registro.

Monte, ligue e execute o programa. Rode no GBD. Analise seu funcionamento.

Depois, faça o desafio.

*/

.section .data
	txtAbertura: 	.asciz 	"\n*** Leitura e Escrita de Registros ***\n"

	txtPedeNome:	.asciz	"\nDigite o nome: "
	txtPedeGenero:	 .asciz	"\nDigite o genero <M> ou <F>: "
	txtPedeRG:	.asciz	"\nDigite o RG: "
	txtPedeCPF:	.asciz	"\nDigite o CPF: " 
	txtPedeDN:	.asciz	"\nDigite a data de nascimento\n"
	txtPedeDia:	.asciz	"Dia: "
	txtPedeMes:	.asciz	"Mes: "
	txtPedeAno:	.asciz	"Ano: "
	txtPedeIdade:	.asciz	"\nDigite a idade: "
	txtPedeContato:	.asciz	"\nDigite o contato telefonico\n"
	txtPedeDDD:	.asciz	"DDD: "
	txtPedeFone:	.asciz	"Telefone: "

	txtMostraReg:	.asciz	"\nRegistro Lido"
	txtMostraNome:	.asciz	"\nNome: %s"
	txtMostraGenero: .asciz	"Genero: %c"
	txtMostraRG:	.asciz	"\nRG: %d"
	txtMostraCPF:	.asciz	"\nCPF: %s"
	txtMostraDN:	.asciz	"\nData de Nascimento: %d/%d/%d"
	txtMostraIdade:	.asciz	"\nIdade: %d"
	txtMostraContato:	.asciz	"\nContato Telefonico: (%s) %s\n"

	txtPedeQuantReg:	.asciz	"\nQuantos registros deseja ler > "

	quantReg:	.int	0

	tipoNum: 	.asciz 	"%d"
	tipoChar:	.asciz	"%c"
	tipoStr:	.asciz	"%s"
	pulaLinha: 	.asciz 	"\n"

	tamReg:  	.int 	124

	regAtual:	.space	4
	listaReg:	.space 	4
	regAnterior:	.space 	4

	lixo:		.int	0

	NULL:		.int 0
	
.section .text
.globl _start
_start:

	pushl	$txtAbertura
	call	printf
	addl	$4, %esp

	call	leQuant
	call	leListaReg
	call	mostraListaReg

fim:
	pushl $0
	call exit

leQuant:
	pushl	$txtPedeQuantReg
	call	printf
	movl	$quantReg, %eax
	pushl	%eax
	pushl	$tipoNum
	call	scanf

	pushl	$lixo
	pushl	$tipoChar
	call	scanf

	addl	$20, %esp

	RET

leListaReg:

	movl	quantReg, %ecx	

_volta1:

	pushl	%ecx

	movl	regAtual, %eax
	movl	%eax, regAnterior

	call	leReg

	popl	%ecx
	
	cmpl	quantReg, %ecx
	je	_leuReg1

	movl	regAnterior, %edi
	addl	$120, %edi
	movl	regAtual, %eax
	movl	%eax, (%edi)

_continua:

	loop 	_volta1

	movl	regAtual, %edi
	addl	$120, %edi
	movl	$NULL, %eax
	movl	%eax, (%edi)

	RET

leReg:

	pushl	tamReg
	call	malloc
	movl	%eax, regAtual
	
	pushl	$txtPedeNome
	call	printf
	addl	$8, %esp

	pushl	stdin
	pushl	$64
	movl	regAtual, %edi
	pushl	%edi
	call	fgets

	popl	%edi
	addl	$8, %esp

	addl	$64, %edi
	pushl	%edi

	pushl	$txtPedeGenero
	call	printf
	addl	$4, %esp

	pushl	$tipoChar
	call	scanf		
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi

	pushl	$txtPedeRG
	call	printf
	addl	$4, %esp

	pushl	$tipoNum
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi

	pushl	$txtPedeCPF
	call	printf
	addl	$4, %esp

	pushl	$tipoStr
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$16, %edi
	pushl	%edi

	pushl	$txtPedeDN
	call	printf

	pushl	$txtPedeDia
	call	printf
	addl	$8, %esp

	pushl	$tipoNum
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi

	pushl	$txtPedeMes
	call	printf
	addl	$4, %esp

	pushl	$tipoNum
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi

	pushl	$txtPedeAno
	call	printf
	addl	$4, %esp

	pushl	$tipoNum
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi
	
	pushl	$txtPedeIdade
	call	printf
	addl	$4, %esp

	pushl	$tipoNum
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi

	pushl	$txtPedeContato
	call	printf

	pushl	$txtPedeDDD
	call	printf
	addl	$8, %esp

	pushl	$tipoStr
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi

	pushl	$txtPedeFone
	call	printf
	addl	$4, %esp

	pushl	$tipoStr
	call	scanf

	pushl	$lixo
	pushl	$tipoChar
	call	scanf

	addl	$16, %esp

	RET

_leuReg1:

	movl	regAtual, %edi
	movl	%edi, listaReg
	jmp	_continua

mostraListaReg:

	movl	quantReg, %ecx	
	movl	listaReg, %edi

_volta2:

	pushl	%ecx	
	movl	%edi, regAtual
	addl	$120, %edi
	movl	(%edi), %edi

	pushl	%edi
	call	mostraReg

	popl	%edi
	popl	%ecx
	loop	_volta2

	RET

mostraReg:

	pushl	$txtMostraReg
	call	printf
	addl	$4, %esp

	movl	regAtual, %edi
	pushl	%edi
	pushl	$txtMostraNome
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$64, %edi
	pushl	%edi

	movl	(%edi), %eax
	pushl	%eax
	pushl	$txtMostraGenero
	call	printf
	addl	$8, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi
	pushl	(%edi)

	pushl	$txtMostraRG
	call	printf
	addl	$8, %esp

	popl	%edi
	addl	$4, %edi
	pushl	%edi

	pushl	$txtMostraCPF
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$16, %edi

	movl	(%edi), %eax
	addl	$4, %edi
	movl	(%edi), %ebx
	addl	$4, %edi
	movl	(%edi), %ecx

	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	$txtMostraDN
	call	printf
	addl	$16, %esp

	popl	%edi
	addl	$4, %edi
	movl	(%edi), %eax
	pushl	%edi

	pushl	%eax
	pushl	$txtMostraIdade
	call	printf
	addl	$8, %esp

	popl	%edi
	addl	$4, %edi
	movl	%edi, %esi
	addl	$4, %edi
	pushl	%edi
	pushl	%esi

	pushl	$txtMostraContato
	call	printf

	addl	$12, %esp

	RET


/*
DESAFIO: Modifique o codigo fazendo o seguinte:

1) Acrescente os seguintes campos, tanto na leitura quanto na mostragem:

- RG antes do CPF: 1 inteiro
- Contato telefonico, com DDD separado, depois da idade: 2+9 caracteres
- acrescente um campo de ponteiro, apos todos os campos: 4 bytes (space), mas não precisa fazer a leitura dele. Esse campo serah usado como "campo de proximo".

2) Mude o nome "reg" para "listaReg". Aloque n registros em loop. Leia n antes. Faça listaReg apontar para o primeiro registro lido, o primeiro deve apontar para o segundo, o segundo deve apontar para o terceiro, o terceiro para o quarto e assim sucessivamente. O decimo registro deve apontar para o endereco da variavel/rotulo NULL. Depois, imprima o n registros partindo do endereco inicial do primeiro, usando %edi para avançar de registro em registro.

Obs: Cada registro deverá ser alocado antes de sua leitura. Para um registro apontar para o proximo registro, o seu campo de proximo devera conter o endereco inicial do proximo registro. Cuidado para não sobreescrever um registro sobre o outro.

*/


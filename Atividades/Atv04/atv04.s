# Felipe Roveroni de Lima   RA112675

.section .data

    valor32:    .int    0
    valorA:     .int    0
    n:          .int    0

    inicio1:        .asciz  "\nDigite um valor de 32 bits : "
    inicio2:        .asciz  "\nAgora digite um expoente para a multiplicacao : "
    confirmador:    .asciz  "\nO Valor inserido foi: %x"
    printa1:        .asciz  "\nValor da soma das duas metades : "
    printa2:        .asciz  "\nValor Final: %x\n\n"


    tipoHex:        .asciz  "%x"
    tipoInt:        .asciz  "%d"

.section .text

.globl _start

_start:

// Aqui é incializado o programa e pede-se o valor que será processado em hexadecimal
    pushl   $inicio1
    call    printf
    pushl   $valor32
    pushl   $tipoHex
    call    scanf
    addl    $12, %esp

// Aqui o programa pede o valor "n" que será usado como expoente para a multiplicação -> valor32 * 2^n 
    pushl   $inicio2
    call    printf
    pushl   $n
    pushl   $tipoInt
    call    scanf
    addl    $12, %esp
    jmp     _separador
    

_separador:

    movl    valor32, %eax
    pushl   %eax
    pushl   $confirmador
    call    printf
    addl    $4, %esp
    popl    %eax
    movw    %ax, valorA
    roll    $16, %eax
    

_calculo:

    addw    %ax, valorA
    movl    n, %ecx

_loop1:

    sall    $1, valorA
    loop    _loop1

_imprime:

    pushl   valorA
    pushl   $printa2
    call    printf
    
_saida:
    push    $0
    call    exit


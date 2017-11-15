# Geração de números primos
# Crystal e Havallon
# 11/11/17

# USO DOS REGISTRADORES PARA CALCULO DOS NUMEROS PRIMOS
# r1 registrador auxiliar
# r2 primeiro valor do intervalo
# r3 ultimo valor do intervalo
# r4 contador1
# r5 contador2
# r6 flag para detectar o numero primo
# r7 constante 1
# r8 quantidade de primos a ser exibido
# r9 dezena do numero
# r10 unidade do numero
# r11 representação do numero em 7 segmentos
# r12 binario para ser convertido para 7 segmento
# r13 ponteiro para o display que representa as dezenas
# r14 ponteiro para o display que representa as unidades
# r15 ponteiro para as START
# r16 temporização

.equ DEZENAS, 0x3030
.equ UNIDADES, 0x3020
.equ CHAVES, 0x3010
.equ START, 0x3000

#Obtendo o valor das dezenas e unidade de um numero em binario
# utilizando o quociente da divisão como as dezenas
# e o resto como a unidade
.macro bcd num, dez, uni
	movi r1, 10
	div \dez, \num, r1
	mul \uni, \dez, r1
	sub \uni, \num, \uni
.endm

#Obtendo o resto da divisao
.macro resto opA, opB, res
	div \res, \opA, \opB
	mul \res, \res, \opB
	sub \res, \opA, \res
.endm

.global main

#Inicialização dos registradores
main:
	mov r2, r0
	movi r3, 100
	mov r4, r0
	movi r5, 2
	mov r6, r0
	movi r7, 1
	movia r13, DEZENAS
	movia r14, UNIDADES
	movia r15, START
	movia r16, CHAVES
	slli r17, r13, 10
	call zero
	stwio r11, 0(r13)
	stwio r11, 0(r14)
	
waiting: #esperando o botao de start
	ldwio r1, 0(r15)
	beq r1, r0, waiting
	ldwio r1, 0(r16)
	beq r1, r0, isZero
	mov r8, r1
	stwio r8, 0(r13)
	br loop1
isZero: # caso o valor das chaves seja 0, 25 numeros primos serão exibidos
	movi r8, 25
	stwio r8, 0(r13)
loop1: 
	blt r3, r4, end
	cmpeqi r6, r2, 2
	call loop2
	movi r5, 2
	addi r4, r4, 1
	beq r6, r7, sending
	addi r2, r2, 1
	br loop1
	
loop2:
	bge r5, r2, endloop2
	resto r2, r5, r9
	beq r9, r0, else
	movi r6, 1
	addi r5, r5, 1
	br loop2
	
endloop2:
	ret

else:
	movi r6, 0
	ret

sending:
	bcd r2, r9, r10
	mov r12, r9
	call toSEG
	stwio r11, 0(r13)
	mov r12, r10
	call toSEG
	stwio r11, 0(r14)
	call delay
	subi r8, r8, 1
	beq r8, r0, end
	addi r2, r2, 1
	br loop1

delay:
	mov r1, r0
counting:
	beq r1, r17, fim
	addi r1, r1, 1
	br counting
fim:
	ret

#Convertando o valor em binario para 7 seg
toSEG:
	beq r12, r0, zero
	addi r1, r0 ,1
	beq r12, r1, um
	addi r1, r1, 1
	beq r12, r1, dois
	addi r1, r1, 1
	beq r12, r1, tres
	addi r1, r1, 1
	beq r12, r1, quatro
	addi r1, r1, 1
	beq r12, r1, cinco
	addi r1, r1, 1
	beq r12, r1, seis
	addi r1, r1, 1
	beq r12, r1, sete
	addi r1, r1, 1
	beq r12, r1, oito
	addi r1, r1, 1
	beq r12, r1, nove
	movi r11, 0b11111111
	ret

#Transformando o numero binario para os 7 segmentos
# 8bit - 0gfe_dcba
zero:
	movi r11,0b00111111
	ret
um:
	movi r11,0b00000110
	ret
dois:
	movi r11,0b01011011
	ret
tres:
	movi r11,0b01001111
	ret
quatro:
	movi r11,0b01100110
	ret
cinco:
	movi r11,0b01101101
	ret
seis:
	movi r11,0b01111101
	ret
sete:
	movi r11,0b00000111
	ret
oito:
	movi r11,0b01111111
	ret
nove:
	movi r11,0b01101111
	ret

end:
	br end
	.end

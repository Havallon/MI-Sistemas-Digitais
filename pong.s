.global main

.macro instr db
	custom 2, r0, r0, \db
.endm

.macro data db
	movi r1, 1
	custom 2, r0, r1, \db
.endm

.equ START, 0x5060

.data
score: .word 0, 0
.text

main:
	call init
	call menu
	movia r10, score
	movia r11, START
wait:
	ldwio r2, 0(r11)
	beq r2, r0, wait
	movi r2, 1
	instr r2	
	call placar
	br end

#Marcar ponto jogador 1
marcar1:
	ldw r2, 0(r10)
	addi r2, r2, 1
	movi r1, 5
	beq r1, r2, win1
	stw r2, 0(r10)
	ret

#Marcar ponto jogador 2
marcar2:
	ldw r2, 4(r10)
	addi r2, r2, 1
	movi r1, 5
	beq r1, r2, win2
	stw r2, 0(r10)
	ret

win1:
	movi r2, 0x84
	instr r2
	
	movi r2, 0x4a #J
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x67 #g
 	data r2
	movi r2, 0x61 #a
 	data r2
	movi r2, 0x64 #d
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x72 #r
 	data r2
	movi r2, 0x20 # 
 	data r2
	movi r2, 0x31 #1
 	data r2

	movi r2, 0xc5
	instr r2
	movi r2, 0x47 #G
 	data r2
	movi r2, 0x61 #a
 	data r2
	movi r2, 0x6e #n
 	data r2
	movi r2, 0x68 #h
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x75 #u
 	data r2
	
	br gameOver

win2:
	movi r2, 0x84
	instr r2
	
	movi r2, 0x4a #J
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x67 #g
 	data r2
	movi r2, 0x61 #a
 	data r2
	movi r2, 0x64 #d
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x72 #r
 	data r2
	movi r2, 0x20 # 
 	data r2
	movi r2, 0x32 #2
 	data r2

	movi r2, 0xc5
	instr r2
	movi r2, 0x47 #G
 	data r2
	movi r2, 0x61 #a
 	data r2
	movi r2, 0x6e #n
 	data r2
	movi r2, 0x68 #h
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x75 #u
 	data r2
	
	br gameOver

gameOver:
	ldwio r2, 0(r11)
	beq r2, r0, gameOver
	movi r2, 1
	instr r2	
	call menu
	br wait

#Inicialização do display lcd
init:
	#Function Set 8-bit, 2-line, F=5x8
	movi r2, 0x3c
	instr r2
	#Display ON
	movi r2, 0x0c
	instr r2
	#Clear display
	movi r2, 0x1
	instr r2
	#Entry Mode set - Increment mode
	movi r2, 0x6
	instr r2
	#Apontando para o inicio do lcd
	movi r2, 0x80
	instr r2
	ret

#Exibindo o placar no display
placar:
	movi r2, 0x80
	instr r2 
	movi r2, 0x4a #J
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x67 #g
 	data r2
	movi r2, 0x61 #a
 	data r2
	movi r2, 0x64 #d
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x72 #r
 	data r2
	movi r2, 0x20 # 
 	data r2
	movi r2, 0x31 #1
 	data r2
	movi r2, 0x3a #:
 	data r2
	movi r2, 0x30 #0
 	data r2
	
	movi r2, 0xc0
	instr r2 
	movi r2, 0x4a #J
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x67 #g
 	data r2
	movi r2, 0x61 #a
 	data r2
	movi r2, 0x64 #d
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x72 #r
 	data r2
	movi r2, 0x20 # 
 	data r2
	movi r2, 0x32 #2
 	data r2
	movi r2, 0x3a #:
 	data r2
	movi r2, 0x30 #0
 	data r2
	ret

#Exivindo o Menu no lcd
menu:
	movi r2, 0x84
	instr r2
	movi r2, 0x50 #P
 	data r2
	movi r2, 0x6f #o
 	data r2
	movi r2, 0x6e #n
 	data r2
	movi r2, 0x67 #g
 	data r2
	movi r2, 0x20 #
 	data r2
	movi r2, 0x47 #G
 	data r2
	movi r2, 0x61 #a
 	data r2
	movi r2, 0x6d #m
 	data r2
	movi r2, 0x65 #e
 	data r2

	movi r2, 0xc3
	instr r2
	movi r2, 0x50 #P
 	data r2
	movi r2, 0x72 #r
 	data r2
	movi r2, 0x65 #e
 	data r2
	movi r2, 0x73 #s
 	data r2
	movi r2, 0x73 #s
 	data r2
	movi r2, 0x20 # 
 	data r2
	movi r2, 0x53 #S
 	data r2
	movi r2, 0x74 #t
 	data r2
	movi r2, 0x61 #a
 	data r2
	movi r2, 0x72 #r
 	data r2
	movi r2, 0x74 #t
 	data r2
	ret

end:
	br end
	.end

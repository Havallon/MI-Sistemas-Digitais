.global main

.macro instr db
	custom 1, r0, r0, \db
.endm

.macro data db
	movi r1, 1
	custom 1, r0, r1, \db
.endm

.equ START, 0x5090
.equ P1X, 0x5080
.equ P1Y, 0x5070
.equ P2X, 0x5060
.equ P2Y, 0x5050
.equ BX, 0x5040
.equ BY, 0x5030
.equ PLAYER1, 0x5020
.equ PLAYER2, 0x5010
.equ BUSY, 0x5000



main:
	call resetBall
	#call init
	call menu
	movia r11, START
	movi r7, 5  # velocidade em x
	movi r8, 5   # velicodade em y
	mov r9, r0   # score jogador 1
	mov r10, r0  # score jogador 2

wait:
	ldwio r2, 0(r11)
	beq r2, r0, wait
	movi r2, 1
	instr r2	
	call placar
	
gameLoop:
	call moverBarra
	call moveBall
	call PlayersCollision
	call wallCollision
	custom 3, r1, r1, r1
	br gameLoop

PlayersCollision:
	movi r1, 610 # X da barra 2
	mov r2, r5   # X da bola
	addi r2, r2, 4
	bge r2, r1, verificarBarra2
	movi r1, 20
	subi r2, r2, 8
	bge r1, r2, verificarBarra1
	ret

verificarBarra2:
	movia r13, PLAYER2
	ldwio r1, 0(r13)
	addi r1, r1, 1
	movi r3, 4
	custom 0, r1, r1, r3
	movi r3, 6
	custom 2, r1, r1, r3
	addi r1, r1, 7
	mov r2, r6
	bge r2, r1, tamanhoBarra
	ret

verificarBarra1:
	movia r13, PLAYER1
	ldwio r1, 0(r13)
	addi r1, r1, 1
	movi r3, 4
	custom 0, r1, r1, r3
	movi r3, 6
	custom 2, r1, r1, r3
	addi r1, r1, 7
	mov r2, r6
	bge r2, r1, tamanhoBarra
	ret

tamanhoBarra:
	addi r1, r1, 80
	bge r1, r2, hit
	ret

hit:
	movi r1, -1
	custom 2, r7, r7, r1
	ret

wallCollision:
	movi r1, 471
	mov r2, r6
	addi r2,r2,4
	bge r2, r1, changeDownWall
	movi r1, 639
	mov r2, r5
	addi r2, r2, 4
	bge r2, r1, changeRightWall
	movi r1, 8
	mov r2, r6
	subi r2, r2, 4
	bge r1, r2, changeDownWall
	mov r1,r0
	mov r2, r5
	subi r2, r2, 4
	bge r1, r2, changeLeftWall
	ret

changeRightWall:
	addi r9, r9, 1
	movi r1, 5
	beq r1, r9, win1
	addi r3, r9, 48
	movi r1, 0x8a
	instr r1
	data r3
	movi r7, 5
	mov r8, r7
	br resetBall

changeLeftWall:
	addi r10, r10, 1
	movi r1, 5
	beq r1, r10, win2
	addi r3, r10, 48
	movi r1, 0xca
	instr r1
	data r3
	movi r7, 5
	mov r8, r7
	br resetBall

changeDownWall:
	movi r1, -1
	custom 2, r8,r8,r1
	ret

moveBall:
	add r5,r5,r7
	add r6,r6,r8
	movia r12, BX
	stwio r5, 0(r12)
	movia r12, BY
	stwio r6, 0(r12)
	ret

moverBarra:
	# pos = valor do potenciometro: 0-255
	# pos = (pos + 1)/4;
	# pos = (pos*6) + 7;
	movia r12, PLAYER1
	movia r13, PLAYER2
	ldwio r1, 0(r12)
	ldwio r2, 0,(r13)
	addi r1, r1, 1
	addi r2, r2, 1
	movi r3, 4
	custom 0, r1, r1, r3
	custom 0, r2, r2, r3	
	movi r3, 6
	custom 2, r1, r1, r3
	custom 2, r2, r2, r3	
	addi r1, r1, 7
	addi r2, r2, 7

	movi r3, 10
	movia r12, P1X
	stwio r3, 0(r12)
	movia r12, P1Y
	stwio r1, 0(r12)
	
	movia r3, 610
	movia r12, P2X
	stwio r3, 0(r12)
	movia r12, P2Y
	stwio r2, 0(r12)
	ret

resetBall:
	movia r12, BX
	movi r1, 316
	stwio r1, 0(r12)
	movia r12, BY
	movi r1, 236
	stwio r1, 0(r12)
	movi r5, 316 # X da bola
	movi r6, 236 # Y da bola	
	ret


win1:
	movi r2, 0x1
	instr r2
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
	movia r11, START
	br gameOver

win2:
	movi r2, 0x1
	instr r2
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
	movia r11, START
	br gameOver

gameOver:
	ldwio r2, 0(r11)
	beq r2, r0, gameOver
	movi r2, 1
	instr r2
	mov r9, r0
	mov r10, r0	
	call menu
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	custom 3, r1,r1,r1
	call resetBall
	movi r7, 5  # velocidade em x
	movi r8, 5   # velicodade em y
	mov r9, r0   # score jogador 1
	mov r10, r0  # score jogador 2
	br wait

#Inicializa��o do display lcd
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
	movi r2, 0x1
	instr r2
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

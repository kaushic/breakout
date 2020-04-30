	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall.part.0, %function
drawBall.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L4
	ldr	ip, .L4+4
	sub	sp, sp, #8
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	ldr	r4, .L4+8
	ldr	r0, [r0, #4]
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	ball
	.word	ballIconBitmap
	.word	drawImage4
	.size	drawBall.part.0, .-drawBall.part.0
	.align	2
	.global	initPaddle
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPaddle, %function
initPaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #150
	mov	r4, #2
	mov	lr, #20
	mov	r2, #110
	mov	ip, #1
	mov	r0, #251
	ldr	r3, .L8
	str	r4, [r3, #20]
	str	lr, [r3, #24]
	str	ip, [r3, #16]
	strh	r0, [r3, #28]	@ movhi
	str	r1, [r3]
	str	r1, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	paddle
	.size	initPaddle, .-initPaddle
	.align	2
	.global	updatePaddle
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePaddle, %function
updatePaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L13
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L11
	ldr	r2, .L13+4
	ldr	r3, [r2, #4]
	cmp	r3, #1
	ble	.L11
	ldr	r1, [r2, #16]
	sub	r3, r3, r1
	str	r3, [r2, #4]
	bx	lr
.L11:
	ldr	r3, .L13
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bxne	lr
	ldr	r3, .L13+4
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #24]
	add	r2, r1, r2
	cmp	r2, #239
	ldrle	r2, [r3, #16]
	addle	r1, r2, r1
	strle	r1, [r3, #4]
	bx	lr
.L14:
	.align	2
.L13:
	.word	67109120
	.word	paddle
	.size	updatePaddle, .-updatePaddle
	.align	2
	.global	drawPaddle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPaddle, %function
drawPaddle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L17
	ldrb	r2, [r0, #28]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r4, .L17+4
	ldr	r2, [r0, #24]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	paddle
	.word	drawRect4
	.size	drawPaddle, .-drawPaddle
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L33
	mov	r0, #247
	sub	sp, sp, #8
	mov	lr, pc
	bx	r3
	bl	drawPaddle
	ldr	r3, .L33+4
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bne	.L31
.L20:
	ldr	r4, .L33+8
	ldr	r6, .L33+12
	add	r5, r4, #560
	b	.L22
.L21:
	add	r4, r4, #28
	cmp	r4, r5
	beq	.L32
.L22:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L21
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	ldr	r3, [r4, #8]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	str	r2, [sp]
	add	r4, r4, #28
	ldr	r2, [r4, #-16]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L22
.L32:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	bl	drawBall.part.0
	b	.L20
.L34:
	.align	2
.L33:
	.word	fillScreen4
	.word	ball
	.word	bricks
	.word	drawRect4
	.size	drawGame, .-drawGame
	.align	2
	.global	initBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBall, %function
initBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #8
	push	{r4, r5, lr}
	mov	r0, #139
	mvn	r5, #0
	mov	r4, #253
	mov	r1, #116
	mov	r2, #1
	mov	lr, #0
	ldr	r3, .L37
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	ldr	ip, .L37+4
	str	r5, [r3, #16]
	strh	r4, [r3, #32]	@ movhi
	str	lr, [ip]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	pop	{r4, r5, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	ball
	.word	.LANCHOR0
	.size	initBall, .-initBall
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r5, .L61
	ldr	r2, [r5]
	ldr	r3, [r5, #24]
	add	r1, r2, r3
	cmp	r1, #160
	sub	sp, sp, #20
	bgt	.L60
.L40:
	ldr	r0, [r5, #4]
	ldr	ip, [r5, #16]
	ldr	r3, [r5, #20]
	ldr	lr, [r5, #36]
	add	r1, ip, r2
	add	r0, r3, r0
	cmp	lr, #0
	str	r1, [r5]
	str	r0, [r5, #4]
	beq	.L39
	cmp	r0, #0
	ldr	r2, [r5, #28]
	ble	.L42
	add	lr, r2, r0
	cmp	lr, #240
	ble	.L43
.L42:
	rsb	r3, r3, #0
	str	r3, [r5, #20]
.L43:
	cmp	r1, #0
	ldr	r3, .L61+4
	rsblt	ip, ip, #0
	strlt	ip, [r5, #16]
	add	ip, r3, #20
	ldm	ip, {ip, lr}
	str	ip, [sp, #12]
	ldr	ip, [r3]
	ldr	r3, [r3, #4]
	ldr	r6, .L61+8
	stm	sp, {r3, ip, lr}
	ldr	r3, [r5, #24]
	mov	lr, pc
	bx	r6
	mov	r9, #0
	cmp	r0, #0
	ldrne	r3, [r5, #16]
	ldr	r4, .L61+12
	rsbne	r3, r3, #0
	strne	r3, [r5, #16]
	ldr	r8, .L61+16
	add	r7, r4, #560
.L47:
	add	r0, r4, #8
	ldm	r0, {r0, r1}
	ldm	r4, {r2, r3}
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r2, [r5, #28]
	ldr	r3, [r5, #24]
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L46
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L46
	ldr	r2, [r5, #16]
	ldr	r3, [r8]
	rsb	r2, r2, #0
	sub	r3, r3, #1
	str	r9, [r4, #20]
	str	r2, [r5, #16]
	str	r3, [r8]
.L46:
	add	r4, r4, #28
	cmp	r4, r7
	bne	.L47
.L39:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L60:
	mov	ip, #0
	ldr	r1, .L61+20
	ldr	r0, [r5, #12]
	str	r1, [sp]
	ldr	r4, .L61+24
	ldr	r1, [r5, #8]
	str	ip, [r5, #36]
	mov	lr, pc
	bx	r4
	mov	r1, #1
	ldr	r3, .L61+28
	ldr	r2, [r5]
	str	r1, [r3]
	b	.L40
.L62:
	.align	2
.L61:
	.word	ball
	.word	paddle
	.word	collision
	.word	bricks
	.word	bricksRemaining
	.word	ballIconBitmap
	.word	drawImage4
	.word	.LANCHOR0
	.size	updateBall, .-updateBall
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePaddle
	pop	{r4, lr}
	b	updateBall
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bxeq	lr
	b	drawBall.part.0
.L68:
	.align	2
.L67:
	.word	ball
	.size	drawBall, .-drawBall
	.align	2
	.global	initBricks
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBricks, %function
initBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #8
	mov	r6, r0
	mov	r5, #12
	mov	r4, #1
	ldr	r2, .L73
	ldr	lr, .L73+4
	ldr	ip, .L73+8
.L70:
	umull	r3, r1, ip, r0
	lsr	r1, r1, #2
	add	r3, r1, r1, lsl #2
	sub	r3, r0, r3
	add	r8, r1, r1, lsl #3
	add	r3, r3, r3, lsl #1
	ldr	r9, [lr, r1, lsl #2]
	lsl	r3, r3, #4
	add	r0, r0, #1
	lsl	r8, r8, #1
	add	r3, r3, #12
	add	r1, r8, #4
	cmp	r0, #20
	stm	r2, {r1, r3}
	str	r7, [r2, #8]
	str	r5, [r2, #12]
	str	r4, [r2, #20]
	str	r6, [r2, #24]
	strh	r9, [r2, #16]	@ movhi
	add	r2, r2, #28
	bne	.L70
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	bricks
	.word	.LANCHOR1
	.word	-858993459
	.size	initBricks, .-initBricks
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	lr, .L79
	sub	sp, sp, #24
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, sp, #4
	stmia	ip!, {r0, r1, r2, r3}
	ldr	lr, [lr]
	mov	r3, #256
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L79+4
	ldr	r4, .L79+8
	strh	lr, [ip]	@ movhi
	mov	lr, pc
	bx	r4
	add	r3, sp, #24
	rsb	r0, r3, #83886080
	add	r0, r0, #516
	add	r3, sp, #2
	add	ip, sp, #20
.L76:
	add	r2, r0, r3
	ldrh	r1, [r3, #2]!
	cmp	r3, ip
	strh	r1, [r2]	@ movhi
	bne	.L76
	mov	r2, #1
	mov	r5, #20
	mov	r4, #150
	mov	lr, #110
	mov	r10, #2
	mov	r9, #251
	mov	ip, #8
	mov	r0, #139
	mov	r1, #116
	mvn	r8, #0
	mov	r7, #253
	mov	r6, #0
	ldr	r3, .L79+12
	strh	r9, [r3, #28]	@ movhi
	str	r2, [r3, #16]
	str	r10, [r3, #20]
	str	r5, [r3, #24]
	str	r4, [r3]
	str	r4, [r3, #8]
	str	lr, [r3, #4]
	str	lr, [r3, #12]
	ldr	r3, .L79+16
	ldr	r9, .L79+20
	str	r2, [r3, #20]
	str	r2, [r3, #36]
	ldr	r2, .L79+24
	str	r5, [r9]
	str	r8, [r3, #16]
	strh	r7, [r3, #32]	@ movhi
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r0, [r3]
	str	r0, [r3, #8]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r6, [r2]
	add	sp, sp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	initBricks
.L80:
	.align	2
.L79:
	.word	.LANCHOR2
	.word	ballIconPal
	.word	DMANow
	.word	paddle
	.word	ball
	.word	bricksRemaining
	.word	.LANCHOR0
	.size	initGame, .-initGame
	.align	2
	.global	updateBricks
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBricks, %function
updateBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #0
	ldr	r2, .L82
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r1, [r0, #20]
	str	r3, [r2]
	bx	lr
.L83:
	.align	2
.L82:
	.word	bricksRemaining
	.size	updateBricks, .-updateBricks
	.align	2
	.global	drawBricks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBricks, %function
drawBricks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldrb	r2, [r0, #16]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #8]
	str	r2, [sp]
	ldr	r4, .L93
	ldr	r2, [r0, #12]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	drawRect4
	.size	drawBricks, .-drawBricks
	.global	color
	.global	rectCols
	.global	gameOver
	.comm	bricksRemaining,4,4
	.comm	bricks,560,4
	.comm	ball,44,4
	.comm	paddle,32,4
	.section	.rodata
	.align	2
	.set	.LANCHOR2,. + 0
.LC0:
	.short	0
	.short	31744
	.short	992
	.short	31
	.short	32767
	.short	15855
	.short	31775
	.short	32736
	.short	1023
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	color, %object
	.size	color, 16
color:
	.word	248
	.word	254
	.word	253
	.word	255
	.type	rectCols, %object
	.size	rectCols, 44
rectCols:
	.word	0
	.word	22
	.word	44
	.word	66
	.word	88
	.word	110
	.word	132
	.word	154
	.word	176
	.word	198
	.word	220
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	gameOver, %object
	.size	gameOver, 4
gameOver:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

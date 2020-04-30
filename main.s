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
	.file	"main.c"
	.text
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press Enter to Start\000"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+16
	mov	r1, #30
	ldr	r2, .L4+20
	mov	r0, #60
	mov	r3, #247
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+32
	ldr	r2, .L4+36
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	breakoutStartPal
	.word	DMANow
	.word	breakoutStartBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC0
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L16
	ldr	r3, [r4]
	ldr	r2, .L16+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L16+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L9
	ldr	r3, .L16+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L15
.L9:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r0, [r4]
	ldr	r3, .L16+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L16+20
	ldr	r3, .L16+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.size	startState, .-startState
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	ldr	r3, .L19
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	state
	.size	goToGame, .-goToGame
	.section	.rodata.str1.4
	.align	2
.LC1:
	.ascii	"Pause\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+4
	ldr	r2, .L23+8
	mov	r1, #77
	mov	r0, #105
	mov	r3, #247
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L23+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L36
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L26
	ldr	r2, .L36+8
	ldrh	r2, [r2]
	tst	r2, #8
	moveq	r1, #1
	ldreq	r2, .L36+12
	streq	r1, [r2]
.L26:
	tst	r3, #4
	beq	.L25
	ldr	r3, .L36+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L35
.L25:
	pop	{r4, lr}
	bx	lr
.L35:
	pop	{r4, lr}
	b	goToStart
.L37:
	.align	2
.L36:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pauseState, .-pauseState
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"Win\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #249
	ldr	r3, .L40
	mov	lr, pc
	bx	r3
	ldr	r4, .L40+4
	ldr	r2, .L40+8
	mov	r1, #77
	mov	r0, #108
	mov	r3, #247
	mov	lr, pc
	bx	r4
	ldr	r3, .L40+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+16
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L40+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L41:
	.align	2
.L40:
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
.L42:
	pop	{r4, lr}
	bx	lr
.L48:
	pop	{r4, lr}
	b	goToStart
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"Lose\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #250
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+4
	ldr	r2, .L53+8
	mov	r1, #77
	mov	r0, #108
	mov	r3, #247
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+16
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L53+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L54:
	.align	2
.L53:
	.word	fillScreen4
	.word	drawString4
	.word	.LC3
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Bricks Remaining: %d\000"
	.text
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L66
	ldr	r4, .L66+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+8
	mov	lr, pc
	bx	r3
	ldr	r2, [r4]
	ldr	r1, .L66+12
	ldr	r3, .L66+16
	ldr	r0, .L66+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L66+24
	mov	r1, #130
	mov	r0, #5
	ldr	r2, .L66+20
	mov	r3, #251
	mov	lr, pc
	bx	r5
	ldr	r3, .L66+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L66+36
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L66+40
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
.L56:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L64
	ldr	r3, .L66+44
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L65
.L55:
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	bl	goToWin
	ldr	r3, .L66+44
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L55
.L65:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L63:
	bl	goToPause
	b	.L56
.L67:
	.align	2
.L66:
	.word	updateGame
	.word	bricksRemaining
	.word	drawGame
	.word	.LC4
	.word	sprintf
	.word	buffer
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	gameOver
	.size	gameState, .-gameState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L79
	push	{r4, r7, fp, lr}
	ldr	r3, .L79+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r6, .L79+8
	ldr	fp, .L79+12
	ldr	r5, .L79+16
	ldr	r10, .L79+20
	ldr	r9, .L79+24
	ldr	r8, .L79+28
	ldr	r7, .L79+32
	ldr	r4, .L79+36
.L69:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L70:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L70
.L72:
	.word	.L75
	.word	.L74
	.word	.L73
	.word	.L71
	.word	.L71
.L71:
	mov	lr, pc
	bx	r7
	b	.L69
.L73:
	mov	lr, pc
	bx	r8
	b	.L69
.L74:
	mov	lr, pc
	bx	r9
	b	.L69
.L75:
	mov	lr, pc
	bx	r10
	b	.L69
.L80:
	.align	2
.L79:
	.word	1044
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.comm	buffer,41,4
	.comm	bricksRemaining,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

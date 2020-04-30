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
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	rsb	r1, r1, r1, lsl #4
	add	r1, r0, r1, lsl #4
	ldr	ip, [r3]
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldrb	ip, [sp, #64]	@ zero_extendqisi2
	ldrb	lr, [sp, #64]	@ zero_extendqisi2
	subs	r4, r3, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #22]	@ movhi
	ble	.L7
	sub	r9, r2, #1
	sub	r5, r2, #2
	ldr	ip, .L26
	add	r4, r1, r4
	add	r6, r0, r2
	rsb	r3, r1, r1, lsl #4
	add	r7, r2, r2, lsr #31
	asr	r8, r9, #1
	asr	r5, r5, #1
	asr	r1, r2, #1
	orr	r8, r8, #-2130706432
	orr	r5, r5, #-2130706432
	rsb	r4, r4, r4, lsl #4
	asr	r7, r7, #1
	sub	r6, r6, #1
	orr	r1, r1, #-2130706432
	ldr	lr, [ip]
	str	r8, [sp, #8]
	str	r5, [sp, #12]
	add	r4, r0, r4, lsl #4
	add	r3, r0, r3, lsl #4
	ldr	ip, [ip, #4]
	str	r1, [sp, #4]
	orr	r7, r7, #-2130706432
	and	r6, r6, #1
	and	r0, r0, #1
	and	r5, r2, #1
	add	r8, sp, #22
	b	.L19
.L25:
	add	r1, r3, r3, lsr #31
	bic	r1, r1, #1
	cmp	r5, #0
	ldrb	r10, [lr, r1]	@ zero_extendqisi2
	ldrb	fp, [sp, #64]	@ zero_extendqisi2
	beq	.L10
	orr	r10, r10, fp, lsl #8
	cmp	r2, #1
	strh	r10, [lr, r1]	@ movhi
	ble	.L11
	mov	r10, #0
	add	r1, r3, #1
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	add	r1, lr, r1
	str	r10, [ip, #44]
	str	r8, [ip, #36]
	str	r1, [ip, #40]
	ldr	r1, [sp, #4]
	str	r1, [ip, #44]
.L11:
	add	r3, r3, #240
	cmp	r4, r3
	beq	.L7
.L19:
	cmp	r0, #0
	bne	.L25
	cmp	r5, #0
	beq	.L15
	cmp	r2, #1
	ble	.L16
	add	r1, r3, r3, lsr #31
	bic	r1, r1, #1
	add	r1, lr, r1
	str	r0, [ip, #44]
	str	r8, [ip, #36]
	str	r1, [ip, #40]
	ldr	r1, [sp, #8]
	str	r1, [ip, #44]
.L16:
	add	r1, r9, r3
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	ldrh	fp, [lr, r1]
	ldrb	r10, [sp, #64]	@ zero_extendqisi2
	cmp	r6, #0
	andne	fp, fp, #255
	andeq	fp, fp, #65280
	and	r10, r10, #255
	add	r3, r3, #240
	orrne	fp, fp, r10, lsl #8
	orreq	fp, fp, r10
	cmp	r4, r3
	strh	fp, [lr, r1]	@ movhi
	bne	.L19
.L7:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L15:
	add	r1, r3, r3, lsr #31
	bic	r1, r1, #1
	add	r1, lr, r1
	str	r5, [ip, #44]
	str	r8, [ip, #36]
	str	r1, [ip, #40]
	str	r7, [ip, #44]
	b	.L11
.L10:
	orr	r10, r10, fp, lsl #8
	cmp	r2, #2
	strh	r10, [lr, r1]	@ movhi
	ble	.L16
	add	r1, r3, #1
	add	r1, r1, r1, lsr #31
	bic	r1, r1, #1
	add	r1, lr, r1
	str	r5, [ip, #44]
	str	r8, [ip, #36]
	str	r1, [ip, #40]
	ldr	r1, [sp, #12]
	str	r1, [ip, #44]
	b	.L16
.L27:
	.align	2
.L26:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	sub	sp, sp, #20
	strb	r0, [sp, #7]
	ldr	r1, .L30
	ldrb	r2, [sp, #7]	@ zero_extendqisi2
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldm	r1, {r0, r3}
	ldr	r1, .L30+4
	orr	r2, r2, ip, lsl #8
	add	ip, sp, #14
	strh	r2, [sp, #14]	@ movhi
	str	lr, [r3, #44]
	str	ip, [r3, #36]
	str	r0, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #20
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r3, #0
	ldr	r6, [sp, #24]
	ble	.L32
	mov	ip, #0
	mov	r8, ip
	ldr	lr, .L37
	add	r4, r1, r3
	add	r5, r2, r2, lsr #31
	rsb	r4, r4, r4, lsl #4
	rsb	r1, r1, r1, lsl #4
	asr	r5, r5, #1
	ldm	lr, {r7, lr}
	add	r4, r0, r4, lsl #4
	orr	r5, r5, #-2147483648
	add	r0, r0, r1, lsl #4
.L34:
	add	r1, ip, ip, lsr #31
	add	r3, r0, r0, lsr #31
	bic	r1, r1, #1
	bic	r3, r3, #1
	add	r0, r0, #240
	add	r1, r6, r1
	add	r3, r7, r3
	cmp	r4, r0
	str	r8, [lr, #44]
	add	ip, ip, r2
	str	r1, [lr, #36]
	str	r3, [lr, #40]
	str	r5, [lr, #44]
	bne	.L34
.L32:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #0
	ldr	r2, .L40
	ldr	r1, .L40+4
	ldm	r2, {r2, r3}
	str	ip, [r3, #44]
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L41:
	.align	2
.L40:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L43:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L43
	mov	r2, #67108864
.L44:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L44
	bx	lr
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #67108864
	ldrh	r3, [r1]
	tst	r3, #16
	ldr	r2, .L51
	moveq	r2, #100663296
	ldr	r0, .L51+4
	eor	r3, r3, #16
	str	r2, [r0]
	strh	r3, [r1]	@ movhi
	bx	lr
.L52:
	.align	2
.L51:
	.word	100704256
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.align	2
	.global	DMANow
	.syntax unified
	.arm
	.fpu softvfp
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	ip, .L55
	ldr	lr, [ip, #4]
	add	r0, r0, r0, lsl #1
	add	ip, lr, r0, lsl #2
	orr	r3, r3, #-2147483648
	lsl	r0, r0, #2
	str	r4, [ip, #8]
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	pop	{r4, lr}
	str	r3, [ip, #8]
	bx	lr
.L56:
	.align	2
.L55:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #4]
	add	r3, r1, r3
	cmp	r3, ip
	blt	.L61
	ldr	r3, [sp, #12]
	add	ip, ip, r3
	cmp	ip, r1
	blt	.L61
	ldr	r3, [sp]
	add	r2, r0, r2
	cmp	r2, r3
	blt	.L61
	ldr	r2, [sp, #8]
	add	r3, r3, r2
	cmp	r3, r0
	movlt	r0, #0
	movge	r0, #1
	bx	lr
.L61:
	mov	r0, #0
	bx	lr
	.size	collision, .-collision
	.global	dma
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.ident	"GCC: (devkitARM release 53) 9.1.0"

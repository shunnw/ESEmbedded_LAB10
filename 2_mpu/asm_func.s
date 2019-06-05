.syntax unified

.global	read_sp
read_sp:
	mov r0, sp
	bx lr

.global	read_msp
read_msp:
	mrs r0, msp
	bx lr

.global	read_psp
read_psp:
	mrs r0, psp
	bx lr

.global	read_ctrl
read_ctrl:
	mrs r0, control
	bx lr

.global	start_user
start_user:
	sub sp, #8
	add r7, sp, #0
	str r0, [r7, #4]
	str r1, [r7, #0]
	mov r2, 0b011
	msr psp, r1
	msr control, r2
	ISB
	ldr r2, [r7, #4]
	bx r2

.global	sw_priv
sw_priv:
	mov r0, 0b010
	msr control, r0
	bx lr

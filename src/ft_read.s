section .text
	global ft_read

extern __errno_location

ft_read: 
	mov	rax, 0			; system call number (sys_read)
	syscall				; execute kernel call: read(fd, buf, count)
	cmp	rax, 0			; check value rax -> error on 0
	jl	error			; jump if rax is than 0 -> syscall failed (negative errno)
	ret					; success: rax = number of bytes read

error:
	neg	 rax				; convert return value: -errno -> errno (positive)
	push rax				; save errno value temporarily
	call __errno_location	; get address of thread-local errno
	pop	rdi					; restore errno value into rdi
	mov	[rax], rdi			; store errno into *(__errno_location())
	mov	rax, -1				; function return value = -1
	ret						; return to caller	
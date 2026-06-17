global ft_write

extern __errno_location

section .text
	
ft_write:
	mov	rax, 1			; system call number (sys_write)
	syscall				; execute kernel call: write(fd, src, len)
	cmp	rax, 0			; check value rax -> error on 0
	jl	error			; if rax < 0  -> syscall failed (negative errno)
	ret					; success: rax = number of bytes written

error:
	neg	 rax				; convert return value: -errno -> errno (positive)
	push rax				; save errno value temporarily
	call __errno_location	; get address of thread-local errno
	pop	rdi					; restore errno value into rdi
	mov	[rax], rdi			; store errno into *(__errno_location())
	mov	rax, -1				; function return value = -1
	ret						; return to caller

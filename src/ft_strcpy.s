global ft_strcpy

extern ft_strlen

section .text

; rdi -> dest | rsi -> src
ft_strcpy:
	push rdi			; rdi currently contains dest, so we save rdi on the stack
	mov	rdi, rsi		; set rdi for ft_strlen(rdi)
	call ft_strlen		; call ft_strlen

	mov	rcx, rax		; return value of ft_strlen(), rcx used for movsb(rcx)
	pop	rdi				; restore rdi, which we stored on the stack with 'push rdi'
	mov	rax, rdi		; set rdi as return value -> return dest;
	cld					; clear Direction Flag, if DF = 0 the pointers increase -> rdi++, rsi++
	rep	movsb			; copy one byte -> (rep): repeat while rcx != 0
	mov	BYTE[rdi], 0	; set last position to null -> dest[len] = '\0'
	ret 				; return rax
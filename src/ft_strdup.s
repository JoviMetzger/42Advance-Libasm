global ft_strdup

extern ft_strlen
extern ft_strcpy
extern malloc

section .text

; rdi -> str(input)
ft_strdup:
	push rdi		; rdi currently contains str, so we save rdi on the stack
	call ft_strlen	; call strlen(rdi)

	inc  rax		; add 1 to the length to reserve space for the null terminator '\0'
	mov	 rdi, rax	; return value of ft_strlen(), rdi used for malloc(rdi)
	call malloc		; call malloc(rdi)

	mov	 rdi, rax	; return value of malloc (new string) -> passed as first agrument to ft_strdup
	pop	 rsi		; restore rdi, which we stored on the stack with 'push rdi' -> rsi stands for second agrument passed to ft_strdup
	call ft_strcpy	; call ft_strcpy(original str, return from malloc)
	ret				; return new string
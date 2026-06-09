global ft_strlen				; Export Function

section .text

ft_strlen:
	xor	rax, rax				; Initialize counter -> Same as: mov rax, 0

; Start loop
loop:
	cmp	byte [rdi + rax], 0		; rdi: pointer to string - rax: index -> str[i]
	je	return					; If the byte is zero '\0', jump to return
	inc	rax						; Increment index -> i++
	jmp	loop					; Unconditional jump -> repeat loop

return:
	ret							; If done, return to caller
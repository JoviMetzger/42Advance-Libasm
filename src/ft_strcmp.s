global ft_strcmp

section .text

ft_strcmp:
	xor rcx, rcx			; rcx: index 1 = 0 (start comparing from first character)

loop:
	mov al, BYTE[rdi + rcx]	; s1[i]
	mov dl, BYTE[rsi + rcx]	; s2[i]

	cmp al, dl				; compare s1[i] and s2[i]
	jne return				; if charcters are different stop and return -> jne = Jump if Not Equal

	cmp al, 0				; if s1[i] == '\0'
	je return				; stop and return equal(0) -> je = Jump if Equal

	inc rcx					; increment rcx, so it goes to the next character -> i++
	jmp loop				; jump to the beginning of the loop

return:
	mov al, BYTE[rdi + rcx]	; calculates the return value
	sub al, BYTE[rsi + rcx]	; s1[i] - s2[i]
	ret						; return to caller

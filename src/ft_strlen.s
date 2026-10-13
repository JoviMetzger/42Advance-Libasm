global ft_strlen

section .text

; size_t ft_strlen(const char *str)
; RDI = str
; RAX = i
ft_strlen:
    xor     rax, rax                ; RAX is the byte index, initially zero

.loop:
    cmp     BYTE[rdi + rax], 0      ; Check if s[i] == '\0'
    je      .done                   ; jump to .done -> if the byte is zero '\0'
    inc     rax                     ; Increment index -> i++
    jmp     .loop                   ; Unconditional jump -> repeat loop

.done:
    ret                             ; Return the length in RAX

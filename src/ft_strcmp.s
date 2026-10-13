global ft_strcmp

section .text

; int ft_strcmp(const char *s1, const char *s2)
; RDI = s1
; RSI = s2
ft_strcmp:
.loop:
    movzx   eax, BYTE[rdi]      ; s1[i]
    movzx   edx, BYTE[rsi]      ; s2[j]

    cmp     eax, edx            ; Compare i and j -> s1[i] == s2[j]
    jne     .different          ; Jump to .different if not equal

    test    eax, eax            ; If equal, did both bytes equal '\0'
    je      .equal              ; Jump to .equal if byte equals '\0'

    inc     rdi                 ; i++
    inc     rsi                 ; j++
    jmp     .loop               ; Jump to .loop to repeat process 

.different:
    sub     eax, edx            ; Substract the bytes from eachother
    ret                         ; Return the difference

.equal:
    xor     eax, eax            ; Return zero for equal strings
    ret

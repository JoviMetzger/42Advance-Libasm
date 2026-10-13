global ft_strcpy

extern ft_strlen

section .text

; char *ft_strcpy(char *dst, const char *src)
; RDI = dst
; RSI = src
ft_strcpy:
    mov     rax, rdi             ; Save dst as the return value -> RAX will be returned

.copy:
    mov     dl, BYTE[rsi]        ; Load the current source byte -> src[i]
    mov     BYTE[rdi], dl        ; Store it at the current destination -> dst[j] = src[i]
    inc     rsi                  ; Increment source pointer -> i++
    inc     rdi                  ; Increment destination pointer -> j++
    test    dl, dl               ; Is src[i] == '\0' ?
    jne     .copy                ; Jump if Not Equal, to .copy (repeat loop)
    ret                          ; Return the destination pointer

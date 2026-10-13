global ft_strdup

extern ft_strlen
extern ft_strcpy
extern malloc

section .text

; rdi -> str(input)
ft_strdup:
    push    rbx                 ; Saved RBX and align stack
    mov     rbx, rdi            ; Store original source pointer

    ; malloc arguments
    call    ft_strlen           ; RAX = length of str
    lea     rdi, [rax + 1]      ; Length plus terminator
    call    malloc wrt ..plt    ; Allocate bytes -> RAX will be returned

    ; Malloc check
    test    rax, rax            ; Did malloc fail?
    jz      .done               ; Jump to .done if NULL

    ; strcpy arguments
    mov     rdi, rax            ; Allocated destination -> what malloc returned
    mov     rsi, rbx            ; Original source -> your string
    call    ft_strcpy           ; Call ft_strcpy -> RAX will be returned

.done:
    pop     rbx                 ; Restore the caller's RBX
    ret

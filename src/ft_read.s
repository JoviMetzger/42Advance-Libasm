global ft_read

extern __errno_location

section .text

; ssize_t ft_read(int fd, void *buf, size_t count)
; ABI: 
;   RAX = 0
;   arguments in RDI, RSI, RDX.
ft_read: 
    mov     rax, 0                      ; System call number for read
    syscall                             ; Execute kernel call: read(fd, *buf, c)
    test    rax, rax                    ; Check if result is negative -> a negative result indicates a syscall error
    js      .error                      ; Jump to .error if value is negative
    ret	                                ; Return the successful byte count

.error:
    neg     rax                         ; Convert -errno to errno (positive)
    push    rax                         ; Save errno and aligne stack
    call    __errno_location wrt ..plt	; Get address of thread-local errno
    pop     rdi	                        ; Restore errno value into rdi
    mov     dword[rax], edi             ; Store errno as int
    mov     rax, -1                     ; Function returns value -1 -> Indicating a error
    ret

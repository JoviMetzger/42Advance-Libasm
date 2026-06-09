global main

; list all libary functions
extern open
extern printf
extern ft_strlen
extern ft_write
extern ft_read
extern ft_strcpy
;extern ft_strcmp
extern ft_strdup

section	.data
	src db "Hello world!", 0
	len equ $ - src - 1

	srcW db "Hello world!42", 10, 0
	lenW equ $ - srcW - 1

	srcDup db "Hello world! - DUPLICATE", 10, 0
	lenDup equ $ - srcDup - 1

	filename db "test.txt", 0
	intFormat db "%zu", 10, 0

	srcCPY db "Hello - Copy", 0
	destCPY times 32 db 0
	strFormat db "%s", 10, 0

section .bss
	buffer resb 100

section .text

main:
	;; --- Standard prologue for any function --- 
	push rbp			; saves caller’s old base/frame pointer on the stack
	mov rbp, rsp		; rbp points to the current stack top, so the function can use rbp as a stable reference for its local stack frame.

	;; --- size_t ft_strlen(const char *src) ---
	mov rdi, src		; input string (devined at the top)
	call ft_strlen		; ft_strlen() function call

	mov rsi, rax		; return value of ft_strlen()
	mov rdi, intFormat	; format
	mov eax, 0			; NO floating-point/vector arguments were passed (for ABI rules)
	call printf			; call printf()

	;; Use "echo $?"
	;mov rdi, rax		; copies the ft_strlen return value into rdi so 'echo $?' works
	;mov rax, 60		; exit(rax)
	;syscall

	;; --- char *ft_strcpy(char *dst, const char *src) ---
	lea rdi, [rel destCPY]	; rdi = dest
    lea rsi, [rel srcCPY]	; rsi = src
    call ft_strcpy			; call ft_strcpy()

	lea rdi, [rel strFormat]
	mov rsi, rax			; return from ft_strcpy()
	mov eax, 0				; NO floating-point/vector arguments were passed (for ABI rules)
	call printf				; call printf()

	;; --- int ft_strcmp(const char *s1, const char *s2) ---
;ft_strcmp.s

	;; --- ssize_t ft_write(int fd, const void *buf, size_t count) ---
	mov rdi, 1			; fd = stdout
	mov rsi, srcW		; input string
	mov rdx, lenW		; length of string
	call ft_write		; call write()

	;; --- ssize_t ft_read(int fd, void *buf, size_t count); ---
	mov rdi, filename	; path to the filename
	mov rsi, 0			; O_RDONLY
	call open			; call open()

	mov rdi, rax		; fd returned by open()
	mov rsi, buffer		; buffer to read into
	mov rdx, 100		; number of bytes to read
	call ft_read		; call ft_read()

	mov rdx, rax		; number of bytes read (return from ft_read())
	mov rdi, 1			; stdout
	mov rsi, buffer		; buffer to print
	call ft_write		; call ft_write()

	;; --- char *ft_strdup(const char *src) ---
	mov rdi, srcDup		; input string
	call ft_strdup		; call ft_strdup()

	mov rdx, rax		; reurn from ft_strdup
	mov rdi, 1			; stdout
	mov rsi, lenDup		; len of string input
	call ft_write		; call ft_write()

	;; --- return 0 -> main() successful program termination ---
	mov eax, 0
	leave
	ret

	;; --- exit() ---
	;mov rdi, 0			; sets rdi to 0 -> exit successfully
	;mov rax, 60		; exit(0)
	;syscall

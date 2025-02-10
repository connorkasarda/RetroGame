; Entry point

section .data
    msg db 'Hello, Assembly!', 0xA

section .text
    global _start

_start:
    ; Print the message
    mov rax, 1      ; syscall number for sys_write
    mov rdi, 1      ; file descriptor (stdout)
    mov rsi, msg    ; message to print
    mov rdx, 18     ; length of message
    syscall         ; make syscall to print the message
    
    ; Exit the program
    mov rax, 60     ; syscall number for sys_exit
    xor rdi, rdi    ; exit code 0
    syscall         ; make syscall to exit the program

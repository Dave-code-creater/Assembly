; The text section 
section .text
    global _start

_start:
    mov edx, len 
    mov ecx, msg 
    mov ebx, 1
    mov eax, 4      ; System call (sys_write)
    int 0x80        ; To call kerel

    mov eax, 1      ;system call (sys_exit)
    int 0x80
; The data section - declaring constants 

section .data
    msg db "Hello world!", 0xa ; also 10 to print new line 
    len equ $ -msg
; The bss section - declaring variables
section .text 
	global _start 

_start:
	mov edx, len 	; This is the length of the message
	mov ecx,msg 	; This is the message 
	mov ebx, 1 	; This is a file descriptor
	mov eax, 4	; Thisi s a system call
	int 0x80	; call the kernel

	mov edx, 10
	mov ecx, star
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov eax, 1 ; To exit the system
	int 0x80

section .data
	msg db "Display 10 star", 10
	len equ $ - msg
	star times 10 db "*"
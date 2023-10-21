section .data
	userMsg db "Please enter a number: "	; Ask the user for a number 
	lenUserMsg equ $-userMsg		; the length of the userMsg
	dispMsg db "You have entered: "
	lenDispMsg equ $-dispMsg


section .bss					; Uninitalized data
	num resb 5				; resb = reseve bytes

section .text					; code segment

_start: 
	; Write the user input (prompt)

	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenUserMsg
	int 0x80

	; Read and store the user input

	mov eax, 3				; sys_read
	mov ebx, 2				;stdin
	mov ecx, num
	mov edx, 5
	int 0x80

	; write another message - you have entered

	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lenDispMsg
	int 0x80

	; write the number
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 0x80


	; exit program
	mov eax, 1 
	mov ebx, 0				; exit status (0)
	int 0x80
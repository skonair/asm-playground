SECTION .data		; section containing initialized data

EatMsg: db "Eat at Joe's!",10
EatLen: equ $-EatMsg


SECTION .bss		; section containing uninitialized data

SECTION .text		; section containing code

global _start		; linker needs this to find the entry point

_start:
	nop		; This no-op keeps gdb happy
	mov eax,4	; Specify sys_write syscall
	mov ebx,1	; Specify file descriptor 1: Standard Output
	mov ecx,EatMsg	; Pass offset of the message
	mov edx,EatLen	; Pass length of the message
	int 80H		; Make syscall to output the text to stdout

	mov eax,1	; Specify Exit syscall
	mov ebx,0	; Return a code of zero
	int 80H		; Make syscall to terminate the program


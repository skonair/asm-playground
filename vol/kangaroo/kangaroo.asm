section .data

	Snippet: db "KANGAROO",10
	SnippetLen: equ $-Snippet

section .text

global _start

_start:
  	nop
  	; put your experiments between the two nops

  	mov ecx,Snippet
  	mov eax,8
DoMore: add byte [ecx],32
	inc ecx
	dec eax
	jnz DoMore

	mov eax,4
	mov ebx,1
	mov ecx,Snippet
	mov edx,SnippetLen
	int 0x80

	mov eax,1
	mov ebx,0
	int 0x80

  ; put your experiments between the two nops
  nop

section .bss


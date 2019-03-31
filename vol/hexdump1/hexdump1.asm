section .bss

	BUFFLEN equ 16
	Buff: resb BUFFLEN

section .data
	
	HexStr: db " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00", 10
	HEXLEN	equ $-HexStr

	Digits: db "0123456789ABCDEF"

section .text

global _start

_start:
  nop
  ; put your experiments between the two nops

Read:
	mov eax,3	; specify sys_read call
	mov ebx,0	; set to stdin
	mov ecx,Buff
	mov edx,BUFFLEN
	int 0x80
	mov ebp,eax
	cmp eax,0
	je Done

	mov esi,Buff
	mov edi,HexStr
	xor ecx,ecx

Scan:
	xor eax,eax
	mov edx,ecx	; copy the char counter into edx
	shl edx,1	; multiply pointer by 2 using left shift
	add edx,ecx	; complete multiplication by 3

; get a character from the buffer and put it in eax and ebx
	mov al,byte [esi+ecx]	; put a byte from the buffer into al
	mov ebx,eax		; duplicate the byte in bl for second nybble

; look up low nybble char and insert it into the new string
	and al,0x0f		; mask out all but the low nybble
	mov al,byte [Digits+eax]	; look up the char equivalent of the low nybble
	mov byte [HexStr+edx+2],al	; write LSB char digit to line string

; look up high nybble char and insert it into the string
	shr bl,4	; shift high 4 bits of char into low 4 bits
	mov bl,byte [Digits+ebx]	; look up char equivalent of nybble
	mov byte [HexStr+edx+1],bl	; write MSB char digit to line string

; bump the buffer pointer to the next character and see if we're done
	inc ecx
	cmp ecx,ebp	; compare to the chars in the buffer
	jna Scan

; write the line of hexadecimal values to stdout
	mov eax,4
	mov ebx,1
	mov ecx,HexStr
	mov edx,HEXLEN
	int 0x80
	jmp Read

Done:
	mov eax,1
	mov ebx,0
	int 0x80

  ; put your experiments between the two nops
  nop



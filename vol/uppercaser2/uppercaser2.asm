; uppercaser2 - reads characters from stdin in a buffer and uppercases it to stdout


section .bss
        BUFFLEN equ 1024    ; length of buffer
        Buff: resb BUFFLEN  ; text buffer itself

section .data

section .text

        global _start

_start:
  nop
  ; put your experiments between the two nops

; read a buffer full of text from stdin
Read:   mov eax,3     ; specify sys_read call
        mov ebx,0     ; specify file descriptor 0 (stdin)
        mov ecx,Buff  ; pass the buffer to read to
        mov edx,BUFFLEN ; tell sys_read to read BUFFLEN chars from stdin
        int 0x80      ; call sys_read
        mov esi,eax   ; copy sys_read return value for safekeeping
        cmp eax,0     ; look at sys_read's return value in eax
        je Exit       ; jump if equal to 0 (0 means EOF) to Exit

; Set up registers for the process buffer step
        mov ecx,esi   ; place the number of bytes read into ecx
        mov ebp,Buff  ; place address of buffer into ebp
        dec ebp       ; adjust count to offset

; go through the buffer and convert lowercase characters to uppercase characters
Scan:   cmp byte [ebp+ecx], 0x61 ; test input char against lowercase 'a'
        jb Next      ; jump if below 'a' to Write
        cmp byte [ebp+ecx], 0x7a ; test input char against lowercase 'z'
        ja Next      ; jump if above 'z' to Write

        sub byte [ebp+ecx],0x20  ; substract 0x20 to give uppercase

Next:   dec ecx     ; decrement counter
        jnz Scan    ; if characters remain, loop back

; write the buffer full of processed text to stdout
Write:  mov eax,4     ; specify sys_write call
        mov ebx,1     ; specify file descriptor 1 (stdout)
        mov ecx,Buff  ; pass offset of the buffer
        mov edx,esi   ; pass the + of bytes of data in the buffer
        int 0x80      ; call sys_write
        jmp Read

Exit:   mov eax,1     ; code for exit syscall
        mov ebx,0     ; return 0 to linux
        int 0x80      ; call exit


  ; put your experiments between the two nops
  nop



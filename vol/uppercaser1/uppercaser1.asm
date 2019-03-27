; uppercaser1 - read characters from stdin and uppercases it to stdout


section .bss
        Buff resb 1

section .data

section .text

        global _start

_start:
  nop
  ; put your experiments between the two nops

Read:   mov eax,3     ; specify sys_read call
        mov ebx,0     ; specify file descriptor 0 (stdin)
        mov ecx,Buff  ; pass the buffer to read to
        mov edx,1     ; tell sys_read to read one char from stdin
        int 0x80      ; call sys_read

        cmp eax,0     ; look at sys_read's return value in eax
        je Exit       ; jump if equal to 0 (0 means EOF) to Exit
                      ; or fall through to test for lowercase
        cmp byte [Buff], 0x61 ; test input char against lowercase 'a'
        jb Write      ; jump if below 'a' to Write
        cmp byte [Buff], 0x7a ; test input char against lowercase 'z'
        ja Write      ; jump if above 'z' to Write

        sub byte [Buff],0x20  ; substract 0x20 to give uppercase

Write:  mov eax,4     ; specify sys_write call
        mov ebx,1     ; specify file descriptor 1 (stdout)
        mov ecx,Buff  ; pass the address to the char to write
        mov edx,1     ; write one char
        int 0x80      ; call sys_write
        jmp Read

Exit:   mov eax,1     ; code for exit syscall
        mov ebx,0     ; return 0 to linux
        int 0x80      ; call exit


  ; put your experiments between the two nops
  nop



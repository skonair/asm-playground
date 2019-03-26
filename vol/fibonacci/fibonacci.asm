section .data
section .text

global _start

_start:
      nop
      ; put your experiments between the two nops

      mov eax,1
      mov ebx,1
      mov edx,8
Fib:  mov ecx,eax
      add eax,ebx
      mov ebx,ecx
      dec edx
      jnz Fib 

      ; put your experiments between the two nops
      nop

section .bss


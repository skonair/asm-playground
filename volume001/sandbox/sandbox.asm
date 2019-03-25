section .data
section .text

global _start

_start:
  nop
  ; put your experiments between the two nops
  mov eax,0xffffffff
  mov ebx,0x2d
  dec ebx
  inc eax

  ; put your experiments between the two nops
  nop

section .bss


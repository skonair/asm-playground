section .data
section .text

global _start

_start:
  nop
  ; put your experiments between the two nops
  mov eax,0xa
  mov ebx,0x8
  mul ebx

  ; put your experiments between the two nops
  nop

section .bss


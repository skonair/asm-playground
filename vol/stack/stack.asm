section .data
section .text

global _start

_start:
  nop
  ; put your experiments between the two nops

  mov rax,0x7FFFFFFFFFFFFFFF ; biggest signed 64 bit integer
  push rax
  pop bx  ; bx is 16 bit register
  pop bx
  pop bx
  pop bx

  ; put your experiments between the two nops
  nop

section .bss


Compile the assembler file and create an elf64 (for 64bit; elf for 32bit) object file. 
  
  $ nasm -f elf64 -g -F stabs eatsyscall.asm

Link the object file into an executable

  $ ld -o eatsyscall eatsyscall.o


Use gdb

  $ gdb eatsyscall

Some commands/use cases for gdb:

Short cmd | Long cmd | Description
----------|----------|------------
l | | lists the program code
 | break <line> | sets a break point at line numer <line>
r | | runs the programm
i r | info registers | prints all register
i r eax | info registers eax | print register eax
s | step | to do next step
n | next | to execute the entire function
c | continue | run until end, crash or breakpoint
si | stepi |  to execute one machine instruction, then stop. e.g. assembler programs --> it is very useful to type 'display/i $pc', then the current instruction is always displayed
ni | nexti | to execute one machine instruction, if it is a function call, proceed until it returns



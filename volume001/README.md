Compile the assembler file and create an elf64 (for 64bit; elf for 32bit) object file. 
  
```shell
  $ cd eatsyscall/
  $ nasm -f elf64 -g -F stabs eatsyscall.asm
```
Link the object file into an executable

```shell
  $ ld -o eatsyscall eatsyscall.o
```

Or simply call make to execute the rules in the Makefile
```shell
  $ cd eatsyscall/
  $ make
```

Use gdb

```shell
  $ gdb eatsyscall
```

Some commands/use cases for gdb. For a complete list, see ftp://ftp.gnu.org/pub/old-gnu/Manuals/gdb/html_node/gdb_toc.html

Short cmd | Long cmd | Description
----------|----------|------------
l | list &lt;startline&gt; | lists the program code starting from line <startline>
b | break &lt;line&gt; | sets a break point at line numer <line>
i b | info break | shows info about current breakpoints
r | run | runs the programm
i r | info registers | prints all register
i r eax | info registers eax | print register eax
s | step | to do next step
n | next | to execute the entire function
c | continue | run until end, crash or breakpoint
si | stepi |  to execute one machine instruction, then stop. e.g. assembler programs --> it is very useful to type 'display/i $pc', then the current instruction is always displayed
ni | nexti | to execute one machine instruction, if it is a function call, proceed until it returns
x | examine &lt;addr&gt; | examine memory in several formats, e.g. 'x/10xb' (display next 10 memory units as hex in unit byte)



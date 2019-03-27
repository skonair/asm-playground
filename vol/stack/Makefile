stack: stack.o
	ld -o stack stack.o

stack.o: stack.asm
	nasm -f elf64 -g -F stabs stack.asm -l stack.lst


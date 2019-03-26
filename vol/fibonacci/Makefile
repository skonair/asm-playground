fibonacci: fibonacci.o
	ld -o fibonacci fibonacci.o

fibonacci.o: fibonacci.asm
	nasm -f elf64 -g -F stabs fibonacci.asm -l fibonacci.lst


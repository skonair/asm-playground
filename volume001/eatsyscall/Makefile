eatsyscall: eatsyscall.o
	ld -o eatsyscall.o eatsyscall

eatsyscall.o: eatsyscall.asm
	nasm -f elf64 -g -F stabs eatsyscall.asm


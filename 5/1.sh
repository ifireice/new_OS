gcc -c main.c -o main.o
nasm -f elf32 icos.asm -o icos.o
gcc main.o icos.o -o prog

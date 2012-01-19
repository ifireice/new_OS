nasm 1.asm -o sector1.bin
gcc -c 1.c -o 1.o
ld --script 1.ld 1.o -o sector2.o
objcopy -O binary sector2.o sector2.bin
cat sector1.bin sector2.bin > image.bin

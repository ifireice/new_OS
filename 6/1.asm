org 	0x7c00

cli
xor 	ax, ax
mov 	ds, ax
mov 	es, ax
sti

;загружаем с диска один сектор
mov 	ax, 0x0201
mov 	cx, 0x0002
mov	bx, 0x7e00
int 0x13

lgdt	[msg]

mov	eax, cr0
or 	eax, 1
mov	cr0, eax

jmp 8: _e

	_e:
		bits 32

		mov 	ax, 0x10
		mov	ds, ax
		
		add 	ax, 8
		mov 	ss, ax
		mov 	esp, 0xffff
		
		call code123

stop:
	cli
	hlt
	jmp stop		

msg:
	dw 32
	dd gdt0
	
	gdt0: dq 0
	gdt1: dq 0x004F9A000000FFFF
	gdt2: dq 0x004F92000000FFFF
	gdt3: dq 0x004F92000000FFFF

times (510+$$-$) db 0
db 0x55, 0xaa

code123:

section .text

extern print

global icos

icos:
	push 	esi
	mov	esi, esp
	sub	esp, 8
	finit
	add	esi, 8
	fld	qword[esi]
	fcos
	add	esi, 8
	fild	dword[esi]
	fmul
	sub	esi, 24
	fstp	qword[esi]
	call print
	add	esp,8
	pop 	esi
	ret

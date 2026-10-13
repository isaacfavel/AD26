.MODEL SMALL
.STACK 29h
.DATA

	cDescrip	DB 'Programa que lee un caracter',10,10,13,'$'
	cIngresar	DB 'Ingresa un carácter: $'
	cFinProg	DB 10,10,13,'"El programa a finalizado,presiona enter para terminar"$'
	cSiEsA		DB 10,13,'El caracter ingresado es una "a" minuscula$'

.CODE
	eInicio:
		
		mov ax,@Data
		mov ds,ax

		mov ah,09h
		mov dx,offset cDescrip
		int 21h

		mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah,01
		int 21h

		cmp al,61h
		je	eSiEsA

		jmp eFinProg

		eSiEsA:
			mov ah,09h
			mov dx, offset cSiEsA
			int 21h

		eFinProg:
			mov ah,09h
			mov dx, offset cFinProg
			int 21h
		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h

END eInicio
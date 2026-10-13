.MODEL SMALL
.STACK 100h  ; 100h es el tamaño estándar recomendado para la pila
.DATA
	cDescrip	DB 'Programa que lee un caracter',10,13,'$'
	cIngresar	DB 'Ingresa un caracter: $'
	
	cSiEsA		DB 10,13,'El caracter ingresado es una "a" minuscula$'
	cNoEsA		DB 10,13,'El caracter ingresado NO es una "a" minuscula$'
	cFinProg	DB 10,13,10,13,'"El programa ha finalizado, presiona ENTER para terminar"$'

.CODE
	eInicio:
		mov ax, @Data
		mov ds, ax

		; Imprime descripción
		mov ah, 09h
		mov dx, offset cDescrip
		int 21h

		; Imprime instrucción de ingreso
		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		; Lee un caracter desde teclado
		mov ah, 01h
		int 21h

		; Lógica de comparación
		cmp al, 'a'             
		je eSiEsA               ; Salta si es igual a "a"
		jne eNoEsA              ; Salta si NO es igual a "a"

	eSiEsA:
		mov ah, 09h
		mov dx, offset cSiEsA
		int 21h
		jmp eFinProg            ; Brinca el bloque de eNoEsA

	eNoEsA:
		mov ah, 09h
		mov dx, offset cNoEsA
		int 21h
		; Se eliminó el "jmp eFinProg" de aquí porque ya cae naturalmente abajo

	eFinProg:
		mov ah, 09h
		mov dx, offset cFinProg
		int 21h
		
		; Pausa (ConsoleReadKey)
		mov ah, 08h             
		int 21h

		; Fin del programa
		mov ax, 4c00h
		int 21h
END eInicio
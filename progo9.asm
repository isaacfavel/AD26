.MODEL SMALL
.STACK 100h  
.DATA
	cDescrip	DB 'Programa que lee un caracter y determina si es mayuscula o minuscula',10,13,'$'
	cIngresar	DB 'Ingresa un caracter: $'
	
	cMayuscula	DB 10,13,'El caracter ingresado es una letra MAYUSCULA$'
	cMinuscula	DB 10,13,'El caracter ingresado es una letra MINUSCULA$'
	cNoEsLetra	DB 10,13,'El caracter ingresado NO es una letra$'
	cFinProg	DB 10,13,10,13,'"El programa ha finalizado, presiona ENTER para terminar"$'

.CODE
	eInicio:
		mov ax, @Data
		mov ds, ax

		mov ah, 09h
		mov dx, offset cDescrip
		int 21h

		mov ah, 09h
		mov dx, offset cIngresar
		int 21h

		mov ah, 01h
		int 21h

		cmp al, 'A'
		jb eNoEsLetra
    
		cmp al, 'Z'
		jbe eMayuscula   

		cmp al, 'a'
		jb eNoEsLetra
    
		cmp al, 'z'
		jbe eMinuscula   
		
		jmp eNoEsLetra   

	eMayuscula:
		mov ah, 09h
		mov dx, offset cMayuscula
		int 21h
		jmp eFinProg     

	eMinuscula:
		mov ah, 09h
		mov dx, offset cMinuscula
		int 21h
		jmp eFinProg     

	eNoEsLetra:
		mov ah, 09h
		mov dx, offset cNoEsLetra
		int 21h

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
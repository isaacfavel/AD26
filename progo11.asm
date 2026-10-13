.MODEL SMALL
.STACK 100h  
.DATA
	cDescrip	DB 'Programa que lee una cifra y determina si es aprobado o reprobado',10,13,'$'
	cIngresar	DB 'Ingresa un caracter: $'
	
	cAprobado	DB 10,13,'La calificacion es aprobada$'
	cReprobado	DB 10,13,'La calificacion es reprobada$'
	cNoEsNumero	DB 10,13,'El caracter ingresado NO es un numero$'
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

		cmp al,'7'
		jb eReprobado

		cmp al,'6'
		ja eAprobado
 
		
		jmp eNoEsNumero   

	eReprobado:
		mov ah,09h
		mov dx,offset cReprobado
		int 21h
		jmp eFinProg
	
	eAprobado:
		mov ah,09h
		mov dx,offset cAprobado
		int 21h
		jmp eFinProg

	
	eNoEsNumero:
		mov ah, 09h
		mov dx, offset cNoEsNumero
		int 21h
		jmp eFinProg

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
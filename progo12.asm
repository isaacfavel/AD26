;Programa que le un caracter desde teclado y para finalizar
;muestra el caracter en pantalla
;Isaac Romero Favela
;29 de septiembre del 2026

.MODEL SMALL
.STACK 20h
.DATA

	cDescrip	DB 'Programa que lee un caracter y al finalizar, muestra el caracter en pantalla',10,13,'$'
	cIngresar	DB 'Ingresa un caracter: $'
	cFinProg	DB 10,13,'El programa a finalizado presiona enter para terminar$'
	cIngresando	DB 10,13,'El caracter ingresado fue: $'

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
		mov bl,al

		mov ah,09h
		mov dx,offset cIngresando
		int 21h

		mov ah,02h
		mov dl,bl
		int 21h

		mov ah,09h
		mov dx,offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h

END eInicio 
		

		
	
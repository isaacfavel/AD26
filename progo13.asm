;Programa que le un caracter desde teclado y para finalizar
;muestra el caracter en pantalla
;Isaac Romero Favela
;29 de septiembre del 2026

.MODEL SMALL
.STACK 20h
.DATA

	cDescrip	DB 'Programa que lee 2 caracteres y al finalizar muestra y compara ambos',10,13,'$'
	cIngresarp	DB 'Ingresa el primer caracter: $'
	cIngresars	DB 10,13,'Ingresa el segundo caracter: $'
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
		mov dx,offset cIngresarp
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
;segundo caracter

		mov ah,09h
		mov dx,offset cIngresars
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


		cmp bl,

END eInicio
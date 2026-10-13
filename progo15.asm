;Programa que le un caracter desde teclado y para finalizar
;muestra el caracter en pantalla
;Isaac Romero Favela
;29 de septiembre del 2026

.MODEL SMALL
.STACK 20h
.DATA

	cDescrip	DB 10,13,'Programa 15',10,13,'$'
    cNombre     DB 10,13,'Nombre:Isaac Romero Favela$'
    cPractica   DB 10,13,'Practica2: Ortografia$'
    cIngresar   DB 10,13,'Ingresa el caracter: $'
    cPalabra1   DB 10,13,'Completa la palabra TE_$'
    cPalabra2   DB 10,13,'Completa la palabra LAGUNA_$'
	cEsValido1   DB 10,13,'La palabra TEC ah sido completada$'
    cEsValido2   DB 10,13,'La palabra LAGUNA ah sido completada$'
    cNoValido   DB 10,13,'El caracter NO es valido$'
	cFinProg	DB 10,13,'El programa a finalizado presiona enter para terminar$'


.CODE 
	eInicio:
		mov ax,@Data
		mov ds,ax

		mov ah,09h
		mov dx,offset cDescrip
		int 21h

		mov ah,09h
		mov dx,offset cNombre
		int 21h

        mov ah,09h
		mov dx,offset cPalabra1
		int 21h

		mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah,01
		int 21h
		mov bl,al

    ;segundo caracter

        mov ah,09h
		mov dx,offset cPalabra2
		int 21h

        mov ah,09h
		mov dx,offset cIngresar
		int 21h

		mov ah,01
		int 21h
		mov bh,al

        



;comparacion

    cmp bl,'C'
    je eValido1

    jmp eNoValido1

    cmp bh,'A'
    je eValido2

    jmp eNoValido2



    eValido1:
        mov ah, 09h
		mov dx, offset cEsValido1
		int 21h

        jmp eFinProg

    eNoValido1:
        mov ah, 09h
		mov dx, offset cNoValido
		int 21h
;segundo caracter
    eValido2:
        mov ah, 09h
		mov dx, offset cEsValido2
		int 21h

        jmp eFinProg


    eNoValido2:
        mov ah, 09h
		mov dx, offset cNoValido
		int 21h
     

	

	eFinProg:
		mov ah,09h
		mov dx,offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h




END eInicio
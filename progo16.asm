;Programa que calcula cual es el mayor
;muestra el mayor en pantalla
;Isaac Romero Favela
;29 de septiembre del 2026

.MODEL SMALL
.STACK 20h
.DATA

	cDescrip	DB 10,13,'Programa 15',10,13,'$'
    cNombre     DB 10,13,'Determinar cual de los 3 numeros ingresados es mayor$'
    cnum1       DB 10,13,'Ingresa el primer numero: $'
    cnum2       DB 10,13,'Ingresa el segundo numero: $'
    cnum3       DB 10,13,'Ingresa el tercer numero: $'
	cMayor      DB 10,13,'El numero mayor es: $'
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
    ;primer numero
		mov ah,09h
		mov dx,offset cnum1
		int 21h

		mov ah,01
		int 21h
		mov bl,al

    ;segundo numero
        mov ah,09h
		mov dx,offset cnum2
		int 21h

		mov ah,01
		int 21h
		mov bh,al

    ;tercer numero 
        mov ah,09h
		mov dx,offset cnum3
		int 21h

		mov ah,01
		int 21h
		mov cl,al

        

;4,5,6
;ja mayor jb menor
;comparacion

    cmp bl,bh
    ja eMayorbl

    cmp bh,cl
        ja eMayorbh

    jmp eMayorcl




    eMayorbl:
        mov ah, 09h
		mov dx, offset cMayor
		int 21h

        mov ah,02h
	    mov dl,bl
	    int 21h
	    jmp eFinProg

    eMayorbh:
        mov ah, 09h
		mov dx, offset cMayor
		int 21h
        
        mov ah,02h
	    mov dl,bh
	    int 21h
	    jmp eFinProg

    eMayorcl:
    mov ah,09h
    mov dx,offset cMayor
    int 21h

    mov ah,02h
	mov dl,cl
	int 21h
	jmp eFinProg

	
	eFinProg:
		mov ah,09h
		mov dx,offset cFinProg
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h




END eInicio
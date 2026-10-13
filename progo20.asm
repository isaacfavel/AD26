.MODEL SMALL
.STACK 20h
.DATA

        cDescrip    DB 'Programa que solicita ingresar dos digitos de una cifra y al '
                    DB 'final muestra el resultado de la suma de los mismo....',10,10,13,'$'

        cIngresar   DB 10,10,13,'Ingrese un digito de una cifra: $'
        cResultado  DB 10,10,13,'El reultado de la suma de los digitos es: $'
        cFinProg    DB 10,10,13,'El programa a terminado, presiona enter para continuar$'


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

            mov ah,01h
            int 21
            mov bl,al
            
            ;segundo dig
             mov ah,09h
            mov dx,offset cIngresar
            int 21h

            mov ah,01h
            int 21
            mov bh,al

            add bl,bl

        eSalida:
                mov ah,09h
                mov dx,offset cSuma
                int 21h

                mov ah,02h
                mov dl,bl
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

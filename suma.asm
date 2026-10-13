;programa que pide 3 numeros y los suma con acarreo

.MODEL SMALL
.STACK 20h
.DATA

    cDescrip	DB 10,13,'Programa que pide 3 numeros y los suma',10,13,'$'
    cnum1       DB 10,13,'Ingresa el primer numero: $'
    cnum2       DB 10,13,'Ingresa el segundo numero: $'
    cnum3       DB 10,13,'Ingresa el tercer numero: $'
    cFinProg	DB 10,13,'El programa a finalizado presiona enter para terminar$'

.CODE
    eInicio:    
        mov ax,@Data
        mov ds,ax

        mov ah,09h
        mov dx,offset cDescrip
        int 21h
        ;primero
        mov ah,09h
        mov dx,offset cnum1
        int 21h

        mov ah,01h
        int 21h
        sub al,30h
        mov bl,al



        ;segundo
        mov ah,09h
        mov dx,offset cnum2
        int 21h

        mov ah,01h
        int 21h
        sub bl,30h
        add bl,al


        ;tercero

        mov ah,09h
        mov dx,offset cnum3
        int 21h

        mov ah,01h
        int 21h

        sub al,30h

        add bl,al

    mov ch,0

    ajusta:
        cmp bl,10
        jb imprimeAcarreo
        sub bl,10
        add ch,1
        jmp ajusta
    imprime:
            cmp ch,0
            je soloUnidades
            add ch,30h
            mov dl,ch
            mov ah,02h
            int 21

    soloUnidades:
                add bl,30h
                mov dl,bl
                mov ah,02h
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
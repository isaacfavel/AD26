.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 'Programa que muestra la tabla del 2',10,10,'$'
    cFinProg DB 10,10,10,13,'El programa ah finalizado$'
    cDosPor  DB 10,13,'2 X $'
    cIgual   DB ' =$'
    cDiez DB '10$'
.CODE
    eInicio:

        mov ax,@Data
        mov ds,ax


    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    mov cl,01h
    mov bl,02h
    mov bh,00h
    eCiclo:


        mov ah,09h
        mov dx,offset cDosPor
        int 21h




        cmp cl,10
        je imprimirDiez

        mov ah,02h
        mov dl,cl
        add dl,30h
        int 21h
        jmp continuar

        imprimirDiez:
        mov ah,09h
        mov dx,OFFSET cDiez
        int 21h

    continuar:
        

        mov ah,09h
        mov dx,offset cIgual
        int 21h

        mov ah,02h
        mov dl,bh
        add dl,30h
        int 21h

        mov ah,02h
        mov dl,bl
        add dl,30h
        int 21h

        mov ah,bh
        mov al,bl
        add al,02h
        aaa

        mov bl,al
        mov bh,ah

        inc cl

        

        cmp cl,10
        jbe eCiclo


         eFinProg:
            mov ah,09h
            mov dx,offset cFinProg
            int 21h

            mov ah,08h
            int 21h

            mov ax,4c00h
            int 21h

END eInicio
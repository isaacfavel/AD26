.MODEL SMALL
.STACK 20h
.DATA

        cDescrip DB 'El programa muestra la secuencia de una cifra ingresada',10,10,13,'$'
        cFinProg DB '***El programa ah finalizado***$'
        cPregunta DB 10,13,'De cuanto quieres el incremento: $'
        cSalto DB 10,13,'$'
        cComa   DB ',$'
        cVar DB 00

.CODE
    eInicio:

    mov ax,@Data
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    

    mov ch,00
    mov cl,00

    mov ah,09h
    mov dx,offset cPregunta
    int 21h

    mov ah,01h
    int 21h

    mov ah,09h
    mov dx,offset cSalto
    int 21h

    sub al,30h

    mov cl,al
    mov cVar,al

    eCiclo:

        cmp ch,00
        je esMenor

        mov ah,02h
        mov dl,ch
        add dl,30h
        int 21h

        esMenor:
        mov ah,02h
        mov dl,cl
        add dl,30h
        int 21h

        mov ah,09h
        mov dx,offset cComa
        int 21h


        mov ah,ch
        mov al,cl

        add al,cVar
        aaa

        mov ch,ah
        mov cl,al


    cmp ch,09
    ja eFinProg

    jmp eCiclo

    




    eFinProg:
        mov ah,09h
        mov dx,offset cFinProg
        int 21h

        mov ah,08h
        int 21h

        mov ax,4c00h
        int 21h





    END eInicio
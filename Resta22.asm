.MODEL SMALL
.STACK 100h
.DATA
    cDescrip DB 'Este programa hace restas',10,10,13,'$'
    cIngresa DB 10,13,'Ingresa el valor: $'
    cResultado DB 10,13,'El resultado es: $'
    cFinProg DB 10,13,'***Fin del programa***$'
    arriba DB 00

.CODE
eInicio:

    mov ax,@DATA
    mov ds,ax


    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h

    sub al,30h

    mov arriba,al

    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h

    sub al,30h

    mov bl,al

;Aqui se hace la restas
    sub arriba,bl


    mov ah,09h
    mov dx,offset cResultado
    int 21h

    mov ah,02h
    mov dl,arriba
    add dl,30h
    int 21h



    



    mov ah,09h
    mov dx,offset cFinProg
    int 21h

    mov ah,08h
    int 21h

    mov ax,4c00h
    int 21h

END eInicio
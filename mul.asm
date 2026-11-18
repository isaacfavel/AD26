.MODEL SMALL
.STACK 20H
.DATA

    cDescrip DB 'Programa que pide dos numeros y multiplica ',10,10,13,'$'
    cIngresa DB 10,13,'Ingresa un numero: $'
    cResultado DB 10,13,'El resultado es: $'
    cFinProg DB 10,13,'***Programa Finalizado***$' 

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
    mov bh,al

    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h

    sub al,30h
    mov bl,al

    mov al,bh
    mul bl
    aam

    mov bx,ax


    mov ah,09h
    mov dx,offset cResultado
    int 21h

    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h

    mov ah,02h
    mov dl,bl
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
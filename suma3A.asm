.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 'Este programa hace la suma de dos numeros con ajuste aaa',10,10,13,'$'
    cIngresa DB 10,13,'Ingresa el valor: $'
    cResultado DB 10,13,'El resultado de la suma es: $'
    cFinProg DB 10,13,'***Fin del programa***$'


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

    mov bl,al

    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h

    sub al,30h
  
    mov ah,00
    add al,bl
    aaa

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
    mov dx, offset cFinProg
    int 21h


    mov ah,08h
    int 21h

    mov ax,4c00h
    int 21h

    END eInicio

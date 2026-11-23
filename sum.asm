.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'El programa hace una suma con tiple a de 2 cifras cad numero',10,10,13,'$'
    cResultado DB 10,13,'El cResultado es: $'
    cFinProg DB 10,13,'***El programa a Finalizado$'
    cIngresa DB 10,13,'Ingresa el numero: $'
    unidad DB 00
.CODE
eInicio:

    mov ax,@DATA
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h
;PRIMER NUMERO
    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h
    sub al,30h

    mov bh,al

    mov ah,01h
    int 21h
    sub al,30h
    
    mov bl,al
    
;SEGUNDO NUMERO
    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h
    sub al,30h

    mov ch,al

    mov ah,01h
    int 21h
    sub al,30h
    
    mov cl,al

    mov al,bl
    mov ah,00
    add al,cl
    aaa

    mov unidad,al

    mov bl,ah
    mov ah,00

    mov al,bh
    add al,ch
    aaa

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

    mov ah,02h
    mov dl,unidad
    add dl,30h
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
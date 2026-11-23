.MODEL SMALL
.STACK 100h
.DATA
    cDescrip DB 'Programa que resta 2 numeros de 2 cifras',10,10,13,'$'
    cIngresa DB 10,13,'Ingresa el numero: $'
    cFinProg DB 10,13,'***FIN DEL SISTEMA###$' 
    cResultado DB 10,13,'El resultado es: $'
    prestamo DB 00   
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


    mov ah,01h
    int 21h

    sub al,30h
    mov bl,al
;Segundo numero

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

    cmp bl,cl
    jb eAjusta

    jmp eContinua

    eAjusta:
        add bl,10
        sub bl,cl

        sub bh,01

        sub bh,ch
        jmp eImprimir
    
    eContinua:
        sub bl,cl
        sub bh,ch

    eImprimir:
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
    int 21
END eInicio
.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 10,13,'Programa que pide 3 numeros y los suma',10,13,'$'
    cnum1    DB 10,13,'Ingresa el primer numero: $'
    cnum2    DB 10,13,'Ingresa el segundo numero: $'
    cnum3    DB 10,13,'Ingresa el tercer numero: $'
    cRes     DB 10,13,'El resultado de la suma es: $'
    cFinProg DB 10,13,'El programa ha finalizado, presiona enter para terminar$'

.CODE
eInicio:    
    mov ax,@Data
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    mov ah,09h
    mov dx,offset cnum1
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    mov bl,al

    mov ah,09h
    mov dx,offset cnum2
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    add bl,al

    mov ah,09h
    mov dx,offset cnum3
    int 21h
    mov ah,01h
    int 21h
    sub al,30h
    add bl,al

    mov ah,09h
    mov dx,offset cRes
    int 21h

    mov ch,0

ajusta:
    cmp bl,10
    jb imprimeAcarreo
    sub bl,10
    add ch,1
    jmp ajusta

imprimeAcarreo:
    cmp ch,0
    je soloUnidades
    add ch,30h
    mov dl,ch
    mov ah,02h
    int 21h

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

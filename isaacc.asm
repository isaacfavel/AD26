.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 'Programa que checa la temperatura ideal del refrigerador-ISAAC ROMERO FAVELA',10,10,13,'$'
    cIngresa DB 10,13,'Ingresa la temperatura: $'
    cFinProg DB 10,13,'***Fin del programa***$'
    cDentro  DB 10,13,'La temperatura se encuentra dentro del rango permitido$'
    cDebajo  DB 10,13,'Se encuentra por debajo del rango permitido$'
    cArriba  DB 10,13,'Se encuentra por arriba del rango permitido$'
    cCantidad DB 10,13,'Cantidad de mediciones fuera del rango: $'
    cPromedio DB 10,13,'La temperatura promedio es: $'
    cResiduo DB 00
    Total DB 00
    n DB 00
    diez DB 10
.CODE
eInicio:
    mov ax,@DATA
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h
mov ch,00
eCiclo:
    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h

    sub al,30h
    mov bh,al

    cmp bh,02
    jb eAbajo

    cmp bh,05
    ja eArriba

    jmp eIdeal
    eAbajo:
        mov ah,09h
        mov dx,offset cDebajo
        int 21h
        inc n
        jmp eContinua

    eArriba:
        mov ah,09h
        mov dx,offset cArriba
        int 21h
        inc n
        jmp eContinua

    eIdeal:
        mov ah,09h
        mov dx,offset cDentro
        int 21h

    eContinua:

    
    add Total,bh



    inc ch
    cmp ch,4
    jb eCiclo

    mov al,Total
    mov ah,00
    div ch

    mov bx,ax

    



    mov ah,09h
    mov dx,offset cPromedio
    int 21h

    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h

    mov ah,02h
    mov dl,'.'
    int 21h

;2739
    mov al,bh
    mul diez

    mov ah,00
    div ch
    mov bx,ax

    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h


    mov ah,09h
    mov dx,offset cCantidad
    int 21h

    mov ah,02h
    mov dl,n
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
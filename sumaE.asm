.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 'Este programa suma manualmente 2 cifras',10,10,13,'$'
    cIngresa DB 10,13,'Ingresa el valor (2 cifras): $'
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
    ;primera cifra
    mov ah,01h
    int 21h

    sub al,30h
    mov bh,al

    ;Segunda cifra
    mov ah,01h
    int 21h

    sub al,30h
    mov bl,al
;Pide segundo numero
    mov ah,09h
    mov dx,offset cIngresa
    int 21h
    ;primera cifra
    mov ah,01h
    int 21h

    sub al,30h
    mov ch,al

    ;Segunda cifra
    mov ah,01h
    int 21h

    sub al,30h
    mov cl,al

    add bh,ch
    add bl,cl

    

    

    cmp bh,09
    ja eAjusteDecenas

    jmp eImprimir

    eAjusteUnidades:
        sub bl,10
        add bh,01

        jmp eImprimir

    eAjusteDecenas:
        mov ch,00
        sub bh,10
        add ch,01
        jmp eImprimirCentenas
        

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

        jmp eFinProg

    eImprimirCentenas:
        mov ah,09h
        mov dx,offset cResultado
        int 21h

        mov ah,02h
        mov dl,ch
        add dl,30h
        int 21h

        mov ah,02h
        mov dl,bh
        add dl,30h
        int 21h

        mov ah,02h
        mov dl,bl
        add dl,30h
        int 21h

    
    eFinProg:
    mov ah,09h
    mov dx, offset cFinProg
    int 21h


    mov ah,08h
    int 21h

    mov ax,4c00h
    int 21h

    END eInicio

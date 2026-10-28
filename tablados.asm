.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 'Programa que muestra la tabla del 2',10,10,'$'
    cFinProg DB 10,10,10,13,'El programa ah finalizado$'
    cDosPor  DB 10,13,'2 X $'
    cIgual   DB ' =$'
    cSalto   DB 10,13,'$'
    cContador DB 01

.CODE
    eInicio:

    mov ax,@Data
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    mov ah,09h
    mov dx,offset cSalto
    int 21h

    mov ah,00
    mov cl,01
    mov bh,00
    mov bl,02

    eCiclo:

        mov ah,09h
        mov dx,offset cDosPor
        int 21h

        cmp cContador,9
        jbe esMenor

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
        mov dx,offset cIgual
        int 21h

        cmp bh,0
        je esunaCifra

        mov ah,02h
        mov dl,bh
        add dl,30h
        int 21h

        esunaCifra:

        mov ah,02h
        mov dl,bl
        add dl,30h
        int 21h

        mov ah,bh
        mov al,bl
        add al,02h
        aaa

        mov bh,ah
        mov bl,al

        mov ah,ch
        mov al,cl
        add al,01h
        aaa

        mov ch,ah
        mov cl,al

        inc cContador

        cmp cContador,20
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
;pedir 3 numeros (una cifra) y devolver ordenado de menor a mayor
.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 10,13,'Programa que pide un cifra y dice si es "Par" o "impar"',10,13,'$'
    cIngresa DB 10,13,'Ingresa el numero: $'
    cnum     DB 10,13,'El numero $'
    cPar     DB ' es Par$'
    cImPar   DB ' es Impar$'
    cFinProg DB 10,13,'El programa ha finalizado, presiona enter para terminar$'

.CODE
eInicio:    
    mov ax,@Data
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h
    mov bh,al
    sub al,30h
    mov bl,al

    resta2:
        cmp bl,2
        jb verificar

        sub bl,2
        jmp resta2

    verificar:
        cmp bl,0
        je esPar

    jmp esImpar

    esPar:
        mov ah,09h
        mov dx,offset cnum
        int 21h

        mov ah,02h
        mov dl,bh
        int 21h

        mov ah,09h
        mov dx,offset cPar
        int 21h


        jmp eFinProg

    esImpar:
        mov ah,09h
        mov dx,offset cnum
        int 21h

        mov ah,02h
        mov dl,bh
        int 21h

        mov ah,09h
        mov dx,offset cImPar
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
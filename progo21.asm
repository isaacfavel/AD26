;pedir 3 numeros (una cifra) y devolver ordenado de menor a mayor
.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 10,13,'Programa que pide 3 numeros y los devuelve ordenados de menor a mayor',10,13,'$'
    cnum1    DB 10,13,'Ingresa el primer numero: $'
    cnum2    DB 10,13,'Ingresa el segundo numero: $'
    cnum3    DB 10,13,'Ingresa el tercer numero: $'
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

    mov bl,al

    mov ah,09h
    mov dx,offset cnum2
    int 21h
    mov ah,01h
    int 21h

    mov cl,al

    mov ah,09h
    mov dx,offset cnum3
    int 21h
    mov ah,01h
    int 21h
    mov ch,al
;bl,cl,ch
;9, 5, 2
;2, 5, 9
    
    cmp bl,cl
    ja esMayor

    jmp esMenor

    esMayor:
        mov bh,bl
        mov bl,cl
        mov cl,bh

        cmp cl,ch
        ja esMayor1
        
        jmp imprimir
        

    esMayor1:
        mov bh,cl
        mov cl,ch
        mov ch,bh

        cmp bl,cl
        ja esMayor3

        jmp imprimir

    esMayor3:
        mov bh,cl
        mov cl,bl
        mov bl,bh
        jmp imprimir

    esMenor:
        cmp cl,ch
        ja esMayor2

    esMayor2:
        mov bh,cl
        mov cl,ch
        mov cl,bh
        jmp imprimir

    imprimir:
        mov ah,02h
        mov dl,bl
        int 21h

        mov ah,02h
        mov dl,cl
        int 21h

        mov ah,02h
        mov dl,ch
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
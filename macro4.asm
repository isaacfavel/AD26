Mensaje MACRO cadena
    mov ah,09h
    mov dx,offset cadena
    int 21h
ENDM

Guardar MACRO var
    mov ah,01h
    int 21h
    mov var,al
ENDM

.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'Programa que lee dos numeros y determian cual de ellos es el mayor',10,10,13,'$'
    cIngresar DB 10,13,'Ingrese un numero: $'
    cFinProg DB 10,13,'***Fin del Programa***$'
    cMayor1 DB 10,13,'Es mayor el primero y es el numero: $'
    cMayor2 DB 10,13,'Es mayor el segundo y es el numero: $'
    cIguales DB 10,13,'Los dos numeros son iguales$'
    vNum1 DB 00
    vNum2 DB 00


.CODE
eInicio:
    mov ax,@DATA
    mov ds,ax

    Mensaje cDescrip
    Mensaje cIngresar

    Guardar vNum1

    Mensaje cIngresar
    Guardar vNum2

    mov al,vNum2
    cmp al,vNum1
    ja eMayor2
    je eIguales
    jmp eMayor1

    eIguales:
        Mensaje cIguales
        jmp eFinProg

    eMayor1:
        Mensaje cMayor1
        mov ah,02h
        mov dl,vNum1
        int 21h
        jmp eFinProg

    eMayor2:
        Mensaje cMayor2
        mov ah,02h
        mov dl,vNum2
        int 21h

    eFinProg:
        Mensaje cFinProg
        mov ah,08h
        int 21h

        mov ax,4c00h
        int 21h


END eInicio
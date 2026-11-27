Datos MACRO
    mov ax,@DATA
    mov ds,ax
ENDM
Imprimir MACRO cadena
    mov ah,09h
    mov dx,offset cadena
    int 21h
ENDM
.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'Programa que utiliza la funcion de video',10,10,13,'$'
    cFinProg DB 10,13,'***Fin de l Programa$'
.CODE
eInicio:
    Datos
    Imprimir cDescrip

    mov ah,06h  ;funcion para video en dos
    mov bh,57h  ;Color de fondo (Decena) y fuente (Unidad)
    mov cx,0000h ;Esquina superior izquierda (Renglon -Columna)
    mov dx,184Fh ;Esquina inferior derecha (renglon -Columna)
    int 10h

    Imprimir cFinProg

    call Salida

    Salida PROC Near
        mov ah,08h
        int 21h

        mov ax,4c00h
        int 21h
        ret
    Salida ENDP

END eInicio
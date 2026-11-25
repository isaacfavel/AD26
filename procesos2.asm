.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'Programa que utiliza procedimientos',10,10,13,'$'
    cFinProg DB 10,13,'Fin del programa$'

.CODE
eInicio:
    call Datos
    mov dx,offset cDescrip
    call Mensaje
    mov dx,offset cFinProg
    call Mensaje
    call Readkey

    

    Mensaje PROC Near
        mov ah,09h
        int 21h
        ret
    Mensaje ENDP
    Datos PROC Near
        mov ax,@DATA
        mov ds,ax
        ret
    Datos ENDP

    Readkey PROC Near
        mov ah,08h
        int 21h

        mov ax,4c00h
        int 21h
    Readkey ENDP

END eInicio
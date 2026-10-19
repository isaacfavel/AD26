.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'Programa que lee dos numeros y muestra la suma de ellos'
        DB 10,13,'Ajusta cifra mayor a 09 con AAA$'
    cIngresa    DB 10,13,'Ingresa un digito$'
    cFinProg    DB 10,10,13,'El programa ah finalizado, presiona enter para terminar$'
    cSuma       DB 10,13,'La suma de los numeros es: $'
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
            sub al,30h
            mov bl,al

            mov ah,09h
            mov dx,offset cIngresa
            int 21h

            mov ah,01h
            int 21h
            sub al,30h

            mov ah,00h
            add al,bl
            aaa

            mov bx,ax

            eSalida:
                    mov ah,09h
                    mov dx,offset cSuma
                    int 21h

                    mov ah,02h
                    mov dl,bl
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
.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'Programa que le 2 numeros de 2 cifras y los suma$'
    cIngresa    DB 10,13,'Ingresa un numero de 2 cifras: $'
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
            mov bh,al

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
            mov ch,al

            mov ah,01h
            int 21h
            sub al,30h
            mov cl,al

            add bh,ch
            add bl,cl

            cmp bl,09h
            jbe eDec

            sub bl,10
            add bh,01

            eDec:
                mov ch,00
                cmp bh,09h
                jbe eSalida

                sub bh,0Ah
                mov ch,01h

        eSalida:
                    mov ah,09h
                    mov dx,offset cSuma
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
            mov dx,offset cFinProg
            int 21h

            mov ah,08h
            int 21h

            mov ax,4c00h
            int 21h

END eInicio
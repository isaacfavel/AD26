.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'Programa que imprime la tabla del 2$'
    cPor    DB 'X$'
    cIgual    DB '=$'
    cSalto DB 10,13,'$'
    cFinProg    DB 10,10,13,'El programa ah finalizado, presiona enter para terminar$'
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

        mov bh,1
        mov cl,00
        mov ch,00

        eCiclo:
            add cl,02
            cmp bh,05
            jae eCompara

            mov ah,02h
            mov dl,'2'
            int 21h

            mov ah,09h
            mov dx,offset cPor
            int 21h

            mov ah,02h
            mov dl,bh
            add dl,30h
            int 21h

            mov ah,09h
            mov dx,offset cIgual
            int 21h


             

            mov ah,02h
            mov dl,cl
            add dl,30h
            int 21h

            mov ah,09h
            mov dx,offset cSalto
            int 21h

            cmp cl,09
            jbe eIncremento

                eCompara:
                cmp ch,01
                je eAjuste
                sub cl,10
                add ch,01

                eAjuste:
                mov ah,02h
                mov dl,'2'
                int 21h

                mov ah,09h
                mov dx,offset cPor
                int 21h

                mov ah,02h
                mov dl,bh
                add dl,30h
                int 21h

                mov ah,09h
                mov dx,offset cIgual
                int 21h


                mov ah,02h
                mov dl,ch
                add dl,30h
                int 21h
                
                mov ah,02h
                mov dl,cl
                add dl,30h
                int 21h

                mov ah,09h
                mov dx,offset cSalto
                int 21h


            eIncremento:
            inc bh
            cmp bh,10
            jae eFinProg
            jmp eCiclo


        eFinProg:
            mov ah,09h
            mov dx,offset cFinProg
            int 21h

            mov ah,08h
            int 21h

            mov ax,4c00h
            int 21h

END eInicio
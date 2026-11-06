.MODEL SMALL
.STACK 20h
.DATA

        cDescrip DB 'Categoria de productos',10,10,13,'$'
        cNombre DB 'Isaac Romero Favela',10,13,'$'
        cIngresa DB 10,13,'Ingresa el numero de productos: $'
        cSin DB 10,13,'Sin reconocimiento$'
        cJunior DB 10,13,'Investigador Junior$'
        cSenior DB 10,13,'Investigador Senior$'
        cHonorifico DB 10,13,'Investigador Honorifico$'
        cFinProg DB 10,13,'***El programa ah finalizado***$'
        

.CODE
        eInicio:
                mov ax,@Data
                mov ds,ax

                mov ah,09h
                mov dx,offset cNombre
                int 21h

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

                cmp bh,01
                jae eHonorifico


                cmp bl,03
                jbe eSinReconocimiento

                cmp bl,04
                jae eJunior

                eJunior:
                        cmp bl,06
                        jbe esJunior

                        jmp esSenior

                        esJunior:
                        mov ah,09h
                        mov dx,offset cJunior
                        int 21h
                        jmp eFinProg

                eSinReconocimiento:
                        mov ah,09h
                        mov dx,offset cSin
                        int 21h
                        jmp eFinProg

                esSenior:
                        cmp bl,09
                        jbe eSenior

                        jmp eHonorifico

                        eSenior:
                        mov ah,09h
                        mov dx,offset cSenior
                        int 21h
                        jmp eFinProg

                eHonorifico:
                        
                        esMayor:
                        mov ah,09h
                        mov dx,offset cHonorifico
                        int 21h

                        eContinuar:




                



eFinProg:
        mov ah,09h
        mov dx,offset cFinProg
        int 21h

        mov ah,08h
        int 21h

        mov ax,4c00h
        int 21h





    END eInicio
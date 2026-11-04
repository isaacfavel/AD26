.MODEL SMALL
.STACK 20h
.DATA

        cDescrip DB 'El programa pide (n) calificaciones y regresa cuantas son aprobatorias y cuales no',10,10,13,'$'
        cFinProg DB '***El programa ah finalizado***$'
        cPregunta DB 10,13,'Ingresa el numero de calificaciones: $'
        cIngresa DB 10,13,'Ingresa calificacion: $'
        cAprobatoria DB 10,13,'Las calificaciones aprobatorias son: $'
        cReprobatorias DB 10,13,'Las calficaciones reprobatorias son: $'
        cN DB 00
        cAprob DB 00
        cReprob DB 00

.CODE
        eInicio:
        mov ax,@Data
        mov ds,ax

        mov ah,09h
        mov dx,offset cDescrip
        int 21h

        mov ah,09h
        mov dx,offset cPregunta
        int 21h

        mov ah,01h
        int 21h
        
        sub al,30h
        mov cN,al

        mov bh,01

        eCiclo:

        mov ah,09h
        mov dx, offset cIngresa
        int 21h

        mov ah,01h
        int 21h

        sub al,30h
        mov bl,al

        cmp bl,07
        jae esAprobatoria

         inc cReprob
         jmp eContinuar

        esAprobatoria:
                inc cAprob

        eContinuar:

        inc bh

        cmp bh,cN
        jbe eCiclo


        impresion:
                mov ah,09h
                mov dx,offset cAprobatoria
                int 21h

                mov ah,02h
                mov dl,cAprob
                add dl,30h
                int 21h

                mov ah,09h
                mov dx,offset cReprobatorias
                int 21h

                mov ah,02h
                mov dl,cReprob
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
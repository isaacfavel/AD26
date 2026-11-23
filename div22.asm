.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB 'Programa que divide dos numeros',10,10,'$'
    cIngresa DB 10,13,'Ingresa el valor: $'
    cResultado DB 10,13,'El resultados es: $'
    cResiduo   DB 10,13,'El residuo es: $'
    cFinProg DB 10,13,'El programa ah finalizado$'
    cDivisor DB 00
    cDividendo DB 00
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
        mov cDivisor,39

        mov ah,09h
        mov dx,offset cIngresa
        int 21h

        mov ah,01h
        int 21h

        sub al,30h
        mov cDividendo,5

        
        mov ah,00
        mov al,cDivisor
        div cDividendo

        mov bx,ax

        mov ah,09h
        mov dx,offset cResultado
        int 21h

        mov ah,02h
        mov dl,bl
        add dl,30h
        int 21h

        mov ah,09h
        mov dx,offset cResiduo
        int 21h

        mov ah,02h
        mov dl,bh
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
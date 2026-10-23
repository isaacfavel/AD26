.MODEL SMALL
.STACK 20h
.DATA
    cDescrip DB 'Programa que le 2 numeros de 2 cifras y los suma$'
    cIngresa    DB 10,13,'Ingresa un numero de 2 cifras: $'
    cFinProg    DB 10,10,13,'El programa ah finalizado, presiona enter para terminar$'
    
.CODE
    eInicio :
        mov ax,@Data
        mov ds,ax

        mov ah,09h
        mov dx,offset cDescrip
        int 21h

        mov bh,01h
        eCiclo:
            mov ah,02h
            mov dl,bh
            add dl,30h
            int 21h

            mov ah,02h
            mov d


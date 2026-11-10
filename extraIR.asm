.MODEL SMALL
.STACK 20h
.DATA

    cDescrip DB '-----Sistema de Inventario-----',10,10,13,'$'
    cNombre  DB 'Isaac Romero Favela',10,13,'$'
    cIngresa DB 10,13,'Ingresa la cantidad de stock: $'
    cOpc     DB 10,10,13,'MENU DE OPCIONES$'
    CIngOpc  DB 10,13,'Ingresa una opcion: $'
    cSurtir  DB 10,13,'1.Surtir$'
    cRetirar DB 10,13,'2.Retirar$'
    cSalir   DB 10,13,'3.Salir$'
    cStock   DB 10,13,'Stock Actual: $'
    cCanSurtir DB 10,13,'Ingresa la cantidad a surtir: $'
    cCanRetirar DB 10,13,'Ingresa la cantidad a retirar: $'
    cFinProg DB 10,13,'---Fin del programa, Presione enter para salir---$'
    cDebeSurtir DB 10,13,'Debes surtir el producto$'
    cNoDispone DB 10,13,'No dispone de mas articulos$'
    cLimite DB 10,13,'llegaste al limite, la mayor cantidad de articulos es (9)$'
    cCantidad DB 00

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
        mov cCantidad,al

        eCiclo:

        mov ah,09h
        mov dx,offset cStock
        int 21h

        mov ah,02h
        mov dl,cCantidad
        add dl,30h
        int 21h

        mov ah,09h
        mov dx,offset cOpc
        int 21h

        mov ah,09h
        mov dx,offset cSurtir
        int 21h

        mov ah,09h
        mov dx,offset cRetirar
        int 21h

        mov ah,09h
        mov dx,offset cSalir
        int 21h

        mov ah,09h
        mov dx,offset CIngOpc
        int 21h

        mov ah,01h
        int 21h

        sub al,30h

        mov bl,al

        cmp bl,01
        je esUno

        cmp bl,02
        je esDos

        cmp bl,03
        je esTres

        esUno:
            mov ah,09h
            mov dx,offset cCanSurtir
            int 21h

            mov ah,01h
            int 21h

            sub al,30h
            mov bh,al

            add cCantidad,bh

            cmp cCantidad,09
            ja esLimite

            jmp eCiclo

            esLimite:
                mov ah,09h
                mov dx,offset cLimite
                int 21h

                sub cCantidad,bh

                jmp eCiclo


            

        esDos:
            cmp cCantidad,00
            jbe noDispone

            mov ah,09h
            mov dx,offset cCanRetirar
            int 21h

            mov ah,01h
            int 21h

            sub al,30h
            mov bh,al

            sub cCantidad,bh

            cmp cCantidad,03
            je debeSurtir

            cmp cCantidad,00
            jbe noDispone

            jmp eCiclo

            debeSurtir:
                mov ah,09h
                mov dx,offset cDebeSurtir
                int 21h
                jmp eCiclo

            noDispone:

                mov ah,09h
                mov dx,offset cNoDispone
                int 21h
                jmp eCiclo 

        esTres:
            jmp eFinProg
        eFinProg:

            mov ah,09h
            mov dx,offset cFinProg
            int 21h

            mov ah,08h
            int 21h

            mov ax,4c00h
            int 21h
    END eInicio
.MODEL SMALL 
.STACK 20H
.DATA

    cTitulo DB 10,13,'Menu para el Examen ---Isaac Romero Favela',10,10,13,'$'
    cFinProg DB 10,13,'***Programa Finalizado***$'
    cDescripS DB 10,13,'1.Suma$'
    cIngresaP DB 10,13,'Ingresa el primer valor: $'
    cIngresaS DB 10,13,'Ingresa el segundo valor: $'
    cDescripR DB 10,13,'2.Resta$'
    cDescripM DB 10,13,'3.Multiplicacion$'
    cDescripD DB 10,13,'4.Division$'
    cSalir    DB 10,13,'5.Salir$'
    cIngresa DB 10,10,13,'Ingresa una opcion: $'
    cResultado DB 10,13,'El resultado es: $'
    vOpcion DB 00

.CODE
eInicio:

    mov ax,@DATA
    mov ds,ax

    eCiclo:

    mov ah,09h
    mov dx,offset cTitulo
    int 21h

    mov ah,09h
    mov dx,offset cDescripS
    int 21h

    mov ah,09h
    mov dx,offset cDescripR
    int 21h

    mov ah,09h
    mov dx,offset cDescripM
    int 21h

    mov ah,09h
    mov dx,offset cDescripD
    int 21h

    mov ah,09h
    mov dx,offset cSalir
    int 21h

    mov ah,09h
    mov dx,offset cIngresa
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    mov vOpcion,al

    cmp vOpcion,01
    je eSuma


    cmp vOpcion,05
    je eFinProg

    eSuma:
        mov ah,09h
        mov dx,offset cIngresaP
        int 21h

        mov ah,01h
        int 21h
        sub al,30h
        mov bh,al

        mov ah,09h
        mov dx,offset cIngresaS
        int 21h

        mov ah,01h
        int 21h
        sub al,30h
        
        mov ah,00
        add al,bh
        aaa
        mov bx,ax

        mov ah,09h
        mov dx,offset cResultado
        int 21h

        mov ah,02h
        mov dl,bh
        add dl,30h
        int 21h
        
        mov ah,02h
        mov dl,bl
        add dl,30h
        int 21h
        




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

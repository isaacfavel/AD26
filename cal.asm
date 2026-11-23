.MODEL SMALL
.STACK 20h
.DATA

cDescrip   DB 'Calcula el promedio de las calificaiones',10,10,13,'$'
cCantidad   DB 10,13,'Introduce la cantdad de calificaiones: $'
cIntroduce DB 10,13,'Introduce la calificaion: $'
cFin       DB 10,13,'Final de programa $'
cPromedio DB 10,13,'El promedio es: $'
n DB 00
Total DB 00
Diez DB 10
.CODE

    eIncio:

    mov ax,@Data
    mov ds,ax

    mov ah,09h
    mov dx,offset cDescrip
    int 21h

    mov ah,09h
    mov dx,offset cCantidad
    int 21h 

    mov ah,01h
    int 21h
    sub al,30h
    mov n,al
mov bh,00
eCiclo:
    mov ah,09h
    mov dx,offset cIntroduce
    int 21h

    mov ah,01h
    int 21h
    sub al,30h
    add Total,al

    inc bh
    cmp bh,n
    jb eCiclo

mov ah,00
mov al,Total
div n
mov bx,ax


mov ah,09h
mov dx,offset cPromedio
int 21h

mov ah,02h
mov dl,bl
add dl,30h
int 21h

cmp bh,00
ja agregarpunto
jmp eFinal


agregarpunto:
mov al,bh
mul Diez
div n
mov bx,ax

mov ah,02h
mov dl,'.'
int 21h

mov ah,02h
mov dl,bl
add dl,30h
int 21h

eFinal:
mov ah,09h
mov dx,offset cFin
int 21h

mov ah,08h
int 21h

mov ax,4c00h
int 21h

    END eIncio
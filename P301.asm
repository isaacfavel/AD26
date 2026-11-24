.MODEL SMALL
.STACK 20h
.DATA
    cMateria DB 'Materia: Lenguajes de Interfaz$'
    cDocente DB 10,13,'Docente: Idalia Ruiz Arroyo$'
    cAlumno  DB 10,13,'Alumno: Isaac Romero Favela$'
    cSemestre DB 10,13,'Semestre: AGO-DIC 2026$'

.CODE
eInicio:
    call Datos
    mov dx,offset cMateria
    call Mensaje
    mov dx,offset cDocente
    call Mensaje
    mov dx,offset cAlumno
    call Mensaje
    mov dx,offset cSemestre
    call Mensaje
    call Readkey

    Datos PROC Near
        mov ax,@DATA
        mov ds,ax
    Datos ENDP
    Mensaje PROC Near
        mov ah,09h
        int 21h
        ret
    Mensaje ENDP
    

    Readkey PROC Near
        mov ah,08h
        int 21h

        mov ax,4c00h
        int 21h
    Readkey ENDP

END eInicio
;Programa que tiene un menu
;Isaac Romero Favela
;07 de octubre del 2026

.MODEL SMALL
.STACK 20h
.DATA

	cDescrip	DB 10,13,'Menu de Opciones Isaac Romero Favela',10,13,'$'
    cAdivina     DB 10,13,'1.Adivina el numero$'
    cSuma       DB 10,13,'2.Suma$'
    cResta       DB 10,13,'3.Resta$'
    cSalir       DB 10,13,'4.Salir$'
    cIngresa     DB 10,13,'Ingresa una opcion: $'

    cAdi        DB 10,13,'tomaste la desicion de adivinar numero$'
	cSu 		DB 10,13,'tomastes la decision de sumar$'
	cRe			DB 10,13,'tomaste la decision de restar$'
	cSa 		DB 10,13,'quieres salir, presiona enter?$'
	cFinProg	DB 10,13,'El programa a finalizado presiona enter para terminar$' 

.CODE 
	eInicio:
		mov ax,@Data
		mov ds,ax

		mov ah,09h
		mov dx,offset cDescrip
		int 21h

		mov ah,09h
		mov dx,offset cAdivina
		int 21h
    
		mov ah,09h
		mov dx,offset cSuma
		int 21h

        mov ah,09h
		mov dx,offset cResta
		int 21h

        mov ah,09h
		mov dx,offset cSalir
		int 21h

        mov ah,09h
		mov dx,offset cIngresa
		int 21h

		mov ah,01
		int 21h


      cmp al,'1'
      je eAdivinar

      cmp al,'2'
      je eSuma

      cmp al,'3'
      je eResta

      jmp eSalir

	eAdivinar:
		mov ah,09h
		mov dx,offset cAdi
		int 21h
		jmp eFinProg


	eSuma:
		mov ah,09h
		mov dx,offset cSu
		int 21h
		jmp eFinProg

	eResta:
		mov ah,09h
		mov dx,offset cRe
		int 21h
		jmp eFinProg

	eSalir:
		mov ah,09h
		mov dx,offset cSa
		int 21h

		mov ah,08h
		int 21h

		mov ax,4c00h
		int 21h

	eFinProg:
		
		mov ah, 08h             
		int 21h

		
		mov ax, 4c00h
		int 21h



END eInicio
bits 16 ; real time 
org 0x7c00 ; load address and start from it 

mov si, 0 ; counter 

print:
	mov ah, 0x0e
	mov al, [hello + si]
	int 0x10 
	add si, 1
	cmp byte [hello +si], 0
	jne print
    jmp $

hello:
	db "Hello world",0

times 510 - ($ - $$) db 0 ; fills rest with 0s
dw 0xAA55 

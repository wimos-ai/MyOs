
section	.text
;
; A simple boot sector program that prints a string using the BIOS
;
bootSectorEntryPt: 

	mov bp , 0x8000 ; Set the base of the stack a little above where BIOS
	mov sp , bp ; loads our boot sector - so it won ’t overwrite us.
	
	mov bx, string 
	call BIOSPrintStr ;Make sure we have a stack before we use call and ret
	
	mov bx,string2
	call BIOSPrintStr
	
	jmp $
	
	
BIOSPrintStr:
	add bx, 0x7c00  ;Adds the offset
	mov ah, 0x0e    ;Sets the propper interupt flag for scrolling teletype
	
	beginLoop:
		mov al , [bx] ;Loads the charecter to al
		
		; Checks to see if al is zero
		cmp al , 0
		jz return ;if al is zero, we jump to the return segment
		
		int 0x10      ; Triggers printing interupt
		add bx, 1     ;increments bx
		
		jmp beginLoop ; cycles back through the loop

	return:
		retn
	
string:
	db "I am a string",0xa,0xd,0
	
string2:
	db "I am also a string",0xa,0xd,0
		
	
	
	

times 510 -( $ - $$ ) db 0 ; When compiled , our program must fit into 512 bytes ,
				; with the last two bytes being the magic number ,
				; so here , tell our assembly compiler to pad out our
				; program with enough zero bytes (db 0) to bring us to the
				; 510th byte.
dw 0xaa55 ; Last two bytes ( one word ) form the magic number ,
; so BIOS knows we are a boot sector.
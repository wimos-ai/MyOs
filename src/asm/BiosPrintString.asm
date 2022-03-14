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
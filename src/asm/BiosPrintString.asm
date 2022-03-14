BIOSPrintStr:
	mov ah, 0x0e    ;Sets the proper interrupt flag for scrolling teletype
	
	beginLoop:
		mov al , [bx] ;Loads the character to al
		
		; Checks to see if al is zero
		cmp al , 0
		jz return ;if al is zero, we jump to the return segment
		
		int 0x10      ; Triggers printing interrupt
		add bx, 1     ;increments bx
		
		jmp beginLoop ; cycles back through the loop

	return:
		retn
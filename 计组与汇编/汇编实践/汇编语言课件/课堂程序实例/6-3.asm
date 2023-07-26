DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
main	proc	far

    MOV AX,DATAS
    MOV DS,AX
repeat1:		call	decibin
			call	crlf
			call	binihex
			call	crlf
			jmp		repeat1
			
			   ;此处输入代码段代码
				;    MOV AH,4CH
				;    INT 21H
main		endp

decibin		proc	near
			mov	bx,0
newchar:	
			mov	ah,1
			int	21h
			sub	al,30h
			jl	exit
			cmp	al,9d
			jg	exit
			cbw
			xchg	ax,bx
			mov	cx,	10d
			mul	cx
			xchg	ax,bx
			
			add		bx,ax
			jmp		newchar
			
exit:		ret
decibin		endp

binihex	proc	near
			mov	ch,4
rotate:		mov	cl,4
			rol	bx,cl
			mov	al,bl
			and	al,0fh
			add	al,30h
			cmp	al,3ah
			jl	printit
			add	al,7h

printit:	mov	dl,al
			mov	ah,2
			int	21h
			dec	ch
			jnz	rotate
			ret
			
binihex		endp


crlf		proc	near
			mov		dl,0dh
			mov		ah,2
			int		21h
			mov		dl,0ah
			mov		ah,2
			int		21h
			ret
			
crlf		endp


		

CODES ENDS
    END main

DATAS SEGMENT
    ;此处输入数据段代码
    branch_table  dw  routine1
              dw  routine2
              dw  routine3 
              dw  routine4 
              dw  routine5 
              dw  routine6 
              dw  routine7 
              dw  routine8
  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    
    mov	al,00000100b
    ;此处输入代码段代码

   cmp  al, 0           ;AL为逻辑尺
   je   continue
   lea  bx, branch_table
L:   
   shr  al, 1           ;逻辑右移
   jnc  add1
   jmp	word ptr[bx]	;段内间接转移
add1: 
	add  bx, type branch_table  ;add bx,2
    jmp  L
continue: 
		  mov	dl,'0'
		  mov	ah,02
		  int	21h	 
		  jmp exit   
		  
routine1:   
		  mov	dl,'1'
		  mov	ah,02
		  int	21h	 
  		  jmp  exit 
routine2:  
		  mov	dl,'2'
		  mov	ah,02
		  int	21h	 
   		  jmp  exit 
routine3:   
		  mov	dl,'3'
		  mov	ah,02
		  int	21h	 
		  jmp 	exit 
routine4:  
		  mov	dl,'4'
		  mov	ah,02
		  int	21h	 
		  jmp 	exit 
routine5:   
		  mov	dl,'5'
		  mov	ah,02
		  int	21h	 
		  jmp	exit 
routine6:  
		  mov	dl,'6'
		  mov	ah,02
		  int	21h	 
		  jmp 	exit 
routine7:   
		  mov	dl,'7'
		  mov	ah,02
		  int	21h	 
		  jmp 	exit  
routine8:  
		  mov	dl,'8'
		  mov	ah,02
		  int	21h	 
		  jmp 	exit 
exit:
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

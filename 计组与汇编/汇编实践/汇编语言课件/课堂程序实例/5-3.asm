DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
             mov  bx, 0
newchar: mov  ah, 1        
      int  21h
      sub  al, 30h
      jl   exit         ; <0 exit
      cmp  al, 10
      jl   add_to
      sub  al, 27h      ; ‘a’~‘f’
      cmp  al, 0ah
      jl   exit         ; <‘a’exit
      cmp  al, 10h
      jge  exit         ; >’f’exit 
add_to:  mov  cl, 4
      shl  bx, cl
      mov  ah, 0
      add  bx, ax
      jmp  newchar
exit:    
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

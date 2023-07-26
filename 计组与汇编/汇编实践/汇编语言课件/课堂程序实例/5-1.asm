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
         mov	bx,1234h
         mov  ch, 4
rotate:  mov  cl, 4
         rol  bx, cl
         mov  al, bl
         and  al, 0fh
         add  al, 30h   ; ’0’~’9’ ASCII 30H~39H
         cmp  al, 3ah
         jl   printit
         add  al, 7h    ; ’A’~’F’ ASCII 41H~46H
printit: mov  dl, al
         mov  ah, 2
         int  21h
         dec  ch
         jnz  rotate

    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

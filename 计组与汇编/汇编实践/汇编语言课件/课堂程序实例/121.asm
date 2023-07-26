DATAS SEGMENT
 		org	100h
        string		db		'happy new year!',0dh,0ah,'$'
        COUNT       DW     17

DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
;                 mov    cx,  count                   ; mov  cx, 17         
;            mov    bx,  offset  string        ; string的偏址 ? bx
;Next :   mov   dl,   [bx]                     
;            mov    ah,   2
;           int       21h                             ; 显示一个字符
;            inc      bx
;            loop   next                             ; 循环指令

             mov  cx,  count                  ; mov  cx, 17      
            mov  di,   0                         
Next :   mov  dl,   string[di]             ; mov  dl,  [string+si] 
            mov  ah,  2
            int     21h                           ; 显示一个字符
            inc     di
            loop   next 



    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

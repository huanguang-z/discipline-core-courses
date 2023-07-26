DATAS SEGMENT
    ;此处输入数据段代码 
       array     dw   12,11,22,33,44,55,66,
                      77,88,99,111,222,333
       number    dw   90
       low_idx   dw   ?
       high_idx  dw   ?
       
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
      lea  di, array
      mov  ax, number  ;要查找数
      cmp  ax, [di+2]  ; (ax)与第一个元素比较
      ja   chk_last
      lea  si, [di+2]  ; lea 不影响标志
      je   exit        ; (ax)＝第一个元素,找到退出
      stc
      jmp  exit        ; (ax)<第一个元素,未找到退出
chk_last:
      mov  si, [di]    ; 元素个数
      shl  si, 1       ; 计算最后一个元素
      add  si, di      ;     的地址，byte VS word
      cmp  ax, [si]    ; (ax)与最后一个元素比较
      jb   search
      je   exit        ; (ax)＝最后一个元素,找到退出
      stc
      jmp  exit        ; (ax)>最后一个元素,未找到退出
      
search:
    mov  low_idx, 1
    mov  bx, [di] ;个数
    mov  high_idx, bx
    mov  bx, di
mid:
    mov  cx, low_idx
    mov  dx, high_idx
    cmp  cx, dx
    ja   no_match
    add  cx, dx
    shr  cx, 1
    mov  si, cx
    shl  si, 1
    
compare:
   cmp  ax, [bx+si]
   je   exit
   ja   higher
   dec  cx
   mov  high_idx, cx
   jmp  mid
higher:
   inc  cx
   mov  low_idx, cx
   jmp  mid
no_match:
   stc

exit:   	
MOV AH,4CH
    	INT 21H
CODES ENDS
    END START

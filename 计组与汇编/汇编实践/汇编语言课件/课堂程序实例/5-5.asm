DATAS SEGMENT
    ;此处输入数据段代码  
    A	dw	8,5,16,84,32
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
          mov     cx, 5       ;元素个数
          dec     cx           ;比较遍数
loop1:    mov     di, cx      ;比较次数
          mov     bx, 0
loop2:     
          mov     ax, A[bx]      ;相邻两数
          cmp     ax, A[bx+2] ;  比较
          jle        continue
          xchg    ax, A[bx+2] ;交换位置
          mov     A[bx], ax
continue:
          add      bx, 2 
          loop     loop2
          mov     cx, di
          loop     loop1

    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

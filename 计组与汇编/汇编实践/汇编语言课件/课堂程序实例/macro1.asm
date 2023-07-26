DATAS SEGMENT
    ;此处输入数据段代码  
    A	dw	8,5,16,84,32
    var	dw	20h
    var1	dw	30h
    xyz	dw	20 dup (?)
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

multiply MACRO opr1,opr2,result
      push  dx
      push  ax
      mov   ax,opr1
      imul  opr2
      mov   result,ax
      pop   ax
      pop   dx
      ENDM
      
CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
   		 multiply cx,var,xyz[bx]
   		  multiply var1,var,xyz[bx]
   		 
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


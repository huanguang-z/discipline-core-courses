.MODEL SMALL  ;定义程序的存储模式，小型程序一般采用小模式small

.DATA
     ;此处输入数据段代码  
     BYTE_ARRAY  LABEL  BYTE
     WORD_ARRAY  DW  50  DUP (20h)
       tos  LABEL  WORD
       aay dw 11h
.STACK
     ;此处输入堆栈段代码

.CODE
.STARTUP  ;程序入口点，自动初始化DS、SS
 
     ;此处输入汇编源代码
     mov	ax,tos
    
.EXIT 0
   END

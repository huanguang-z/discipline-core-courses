.MODEL SMALL  ;定义程序的存储模式，小型程序一般采用小模式small

.DATA
     ;此处输入数据段代码  
     OPER1  DB  1, 2,30h,0
	 OPER2  DW  1234h, 5678h
.STACK 
     ;此处输入堆栈段代码

.CODE
.STARTUP  ;程序入口点，自动初始化DS、SS
 
     ;此处输入汇编源代码
    MOV  AX, WORD PTR  OPER1+1
    MOV  AL, BYTE PTR  OPER2
    
.EXIT 0
   END

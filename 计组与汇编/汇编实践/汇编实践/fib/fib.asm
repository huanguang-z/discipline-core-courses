DATA segment
 result db 1d,24 dup (0)
 x db 1d,24 dup (0)
 
 mess1 db 0dh,0ah,'Please choose a data from 1 to 100:','$'
 mess2 db 0dh ,0ah,' The result is :','$'
 mess3 db 0dh ,0ah,' Press Q to exit.','$' 
 flag  dw ?
 mess4 db 0dh ,0ah,'Iuput error , please enter again.','$'
 mess5 db 0dh ,0ah,'exit.','$'
DATA ends 

stack segment ;此处输入堆栈段代码
 dW 128 dup (?)
stack ends
 
CODE segment 
 assume cs:CODE, ds:DATA, ss:stack, es : DATA
start :
 push ds 
 sub ax,ax
 sub bx,bx
 push ax	
 mov ax , DATA 
 mov ds , ax 
 mov es , ax 
 mov ax , stack
 mov ss , ax 

reinput :
 push ax 
 push bx
 push cx
 push dx
 push si
 push di
 lea dx,mess3 
 mov ah,09
 int 21h          ;显示' Press Q to exit.'
 lea  dx,mess1
 mov ah,09
 int 21h          ;显示'Please choose a data from 1 to 100:'
 mov bx,0
input:     ;输入n,并转化为十进制数
   mov ah,01
   int 21h
   cmp al,'Q'
   jz end1      ;若输入Q,则退出
   cmp al,0dh
   jz count      ;判断是否是回车(十进制数是否转化完成),进而开始计算fibonacci数
   cmp al,'0'
   jb  error
   sub al,30h  
   cbw
   xchg ax,bx   
   mov cx ,10d
   mul cx 
   xchg ax,bx 
   add bx,ax       ;将十六进制数转化为十进制数
   jmp input 
error: ;输入出错  
   lea dx,mess4
   mov ah,09 
   int 21h
   jmp reinput ;跳转回开始状态
end1:    ; 退出程序
  lea dx,mess5
  mov ah,09
  int 21h       ;显示' You have typed Q to exit.'
  mov ah ,4ch
  int 21h
  ret 
count : 
   mov cx,bx ;将输入的数放到 cx 中
   cmp cx ,2
   jle print ;如果小于等于2,就直接输出结果
   sub cx ,2;否则以cx-2作为循环,将两数相加
next : 
   mov di,cx 
   mov cx,25   ;循环次数
   mov si,0
add1 : 
   mov  dl,x[ si ]
   mov  dh,result[ si ]
   add  dl,dh ;将两个存储单元的数中进行相加
   mov  result[si],dl
   mov  x[si],dh ;将上次的相加结果放入x[si]中
   cmp   dl,10d
   jae   great ;如果大于10D
   inc   si 
   jmp goon 
great : 
   sub   result[si],10d ;将尾数存入result[si]
   inc   si
   add   x[si],1;高位加1 
goon :
   loop add1
   mov cx,di 
   loop next 
print : 
    lea dx ,mess2  ;显示' The result is :'
    mov ah ,09
    int 21h
    mov cx,25
    mov si,24
display1:
    cmp flag,0;标志位判断输出的高位是否为0
    jnz if_nz
    cmp result [si],0
    jz  if_z
    add flag,1
if_nz: 
   mov  dl,result[si] ;以十进制输出
   add dl ,30h
   mov ah ,02h
   int 21h
if_z: 
   dec si
   loop display1
   mov flag ,0  
   mov result[0],1d
   mov x[0],1d
   mov si,1
   mov cx,24      
initial:  ;初始化
   mov result[si],0
   mov x[si],0
   add si,1
   loop initial
   mov si,0
   pop di
   pop si
   pop dx
   pop cx
   pop bx
   pop ax
   jmp reinput;跳转到开始状态
   
   mov ah,4ch
   int 21h
  
 CODE ends
   end start


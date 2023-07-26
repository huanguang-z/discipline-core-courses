;先存够电话数，再开始显示查找
dataarea  segment 
mess1    db    'Please input name:','$' 
mess2    db    'Please input telephone number:','$' 
mess3    db    'Do you want to search a telephone number?(y/n)','$' 
mess4    db    0dh,0ah,'what is the name?','$' 
mess5    db    'Not find',0dh,0ah,'$' 
mess6    db    'the number you want to store:50',13,10,'$' 
crlf     db     0dh,0ah,'$' 


ArrayName  label  byte                       ;接收名字输入
max1      db     21
act1      db     ?
Name_char    db     21 dup(?)
                                             
ArrayTel  label  word                        ;接收电话号码输入
max2      db     9
act2      db     ?
Telchar   db    9 dup(?)
 
Tel_Tab   db     50 dup(28 dup(?))      ;字符串和人名的表，在附加段

count    db 0
name_count dw    0
endAddress   dw  ?
swapped   dw     ?                      ;交换位swapped来判断是否结束排序
TotalNumber dw   50
tempSave    db   28 dup(?),0dh,0ah,'$'  ;暂存Tel_Tab的一项
FindAdd dw    ?
flag      db     ?
show      db     'name                phone',0dh,0ah,'$' ;显示
dataarea  ends
;
codesg  segment
   assume ds:dataarea,cs:codesg,es:dataarea
main    proc    far
       mov ax,dataarea 
       mov ds,ax 
       mov es,ax 
       lea di,Tel_Tab     ;将空字符串和电话号码数组放入 
       lea dx,mess6        ;显示信息，请输入想存入的电话号码总个数 50
       mov ah,09   
       int 21h             ;OUTPUT DX
 Mstep1:                              
       lea dx,mess1                 ;显示请输入名字
       mov ah,09 
       int 21h 
       call input_name              ;输入名字 
       inc  name_count              ;名字数++
       call stor_name               ;把名字存入存储空间
       lea dx,mess2                 ;显示请输入电话
       mov ah,09 
       int 21h 
       call input_Tel                 ;输入号码
       call stor_phone              ;存储号码 
       cmp  name_count,0   
       je  exit 
       mov bx,TotalNumber           ;号码总数存入BX
       cmp  name_count,bx           ;输入50组的姓名，电话，来手动循环
       jnz  Mstep1 
       call name_sort 
 Mstep2:
       lea dx,mess3                  ;显示是否需要查找电话号码
       mov ah,09 
       int 21h
       mov ah,08                     ;键盘输入x或y进行选择，无回显，AL=输入字符
       int 21h
       cmp al,'y'
       jz  Mstep3
       cmp al,'n'
       jz  exit
       jmp Mstep2                          
 Mstep3:
       mov ah,09
       lea dx,mess4                  ;显示询问名字
       int 21h                       ;搜索前输入要搜索的名字
       call input_name      
 Mstep4:
       call FindName              ;开始搜索
       jmp Mstep2                    
 exit:
       mov ax,4c00h            ;返回终止
       int 21h
 main endp
;--------------------------------------------------------------------
input_name  proc  near
     mov ah,0ah
     lea dx,ArrayName       ;将名字数组地址到DX
     int 21h
     mov ah,09              ;输入名字
     lea dx,crlf            ;回车换行
     int 21h
     sub bh,bh              ;bh清零,BL存长度
     mov bl,act1            ;两个16进制位能存下ACT1
     mov cx,21
     sub cx,bx              ;CX=CX-BX为空缺部分,CX为计数器
b10:
     mov Name_char[bx],' '   ;补全空格
     inc bx
     loop b10
    ret
input_name endp
;--------------------------------------------------------------------
stor_name     proc   near
      lea  si,Name_char
      mov  cx,20
      rep  movsb ;movsb指令用于把字节从ds:si 搬到es:di附加段；rep是repeat的意思，rep movsb 就是多次搬运。
                 ;搬运前先把字符串的长度存在cx寄存器中，然后重复的次数就是cx寄存器所存数据的值。
      ret
stor_name  endp
;--------------------------------------------------------------------
input_Tel   proc   near
     mov ah,0ah 
     lea dx,ArrayTel 
     int 21h 
     mov ah,09         ;输电话号码
     lea dx,crlf       ;换行回车
     int 21h 
     sub bh,bh         ;原理同存储，名字
     mov bl,act2 
     mov cx,9  
     sub cx,bx 
c10:
     mov Telchar[bx],' ' ;补充空格
     inc bx              ;
     loop c10
     ret 
input_Tel endp
;--------------------------------------------------------------------
stor_phone  proc near
     lea  si,Telchar
     mov  cx,8
     rep  movsb   ;movs 串传送指令 cmps 串比较操作
     ret
stor_phone endp
;--------------------------------------------------------------------
name_sort  proc near        ;冒泡法排序名+电话号码，按升序
     sub  di,28             ;此时DI指向最后一个字符串的首地址
     mov  endAddress,di        ;DI-28->结束地址
 c1:
     mov  swapped,0            ;swap从0开始
     lea  si,Tel_Tab 
 c2: 
     mov  cx,20 
     mov  di,si 
     add  di,28   ;现在DI=表地址+28也就是下一组号码名字  ，SI和DI作为两个变址指针，指向ES段
     mov  ax,di 
     mov  bx,si   ;cmpsb si-di  movsb di<-si
     repz cmpsb   ;repz 当为0时重复串操作；
     jbe  if_Loop ;CF或ZF=1，小于等于则转移
                ;repz是一个串操作前缀，它重复串操作指令，每重复一次ECX的值就减一
                ;一直到CX为0或ZF为0时停止。
                ;大于则交换位置
     mov si,bx    
     lea di,tempSave ;DI指向TempSave
     mov cx,28
     rep movsb       ;转移到tempSave先
     mov cx,28                   ;从ds:si 搬到es:di附加段
     mov di,bx       ;DI指向BX
     rep movsb       ;搬到BX
     mov cx,28
     lea si,tempSave 
     rep movsb       ;tempSave搬回去
     mov swapped,1
 if_Loop:
     mov  si,ax
     cmp  si,endAddress ;看看有没有比完（一轮的从头到尾）
     jb   c2            ;小于则CF=1，则转移，
     cmp  swapped,0      ;CMP - 如果这两个值相等，则Z标志被设置为（1），否则它没有被设置（0）
     jnz  c1             ;结果不为0则转移
     ret 
name_sort endp
;--------------------------------------------------------------------
FindName proc near
      lea  bx,Tel_Tab
	mov  flag,0      
   dStep1: 
      mov  cx,20 
	lea si,Name_char 
      mov  di,bx            ;补空格为了方便搜索和比较
      repz cmpsb            ;BX存着表
      jz  Found
      add bx,28             ;指向下一条看看还有没有
      cmp  bx,endAddress    ;endAress是表尾指针 
      jbe  dStep1           ;没到尾部未结束，继续找
	sub flag,0            ;要是没有找到的话
      jz NotFound
      jmp  dexit            ;结束，退出
  NotFound:  
      lea dx,mess5
      mov ah,09
      int 21h 
  Found:
      mov FindAdd,bx       ;  BX对应找到的地址给FindAdd
	inc flag
	call printf
	add bx,28            ;下一条
      cmp  bx,endAddress   ;是否结束？
      jbe  dStep1          ;未结束，继续找
      jmp  dexit           ;结束，退出
      jnz  dStep1
 dexit:
        ret
FindName endp
;--------------------------------------------------------------------
printf proc  near
       sub flag,0     ;要是没有找到的话，跳到Notfind
       jz  Nofind

 pStep:
       mov ah,09
       lea dx,show
       int 21h
       mov cx,28
       mov si,FindAdd
       lea di,tempSave
       rep movsb
       lea dx,tempSave
       mov ah,09
       int 21h
       jmp FinalExit

Nofind:    
       lea dx,mess5
       mov ah,09
       int 21h 
FinalExit:  
       ret
printf endp

codesg ends

end main       

DATAREA SEGMENT
   mess1 db "Enter keyword:",'$'
   mess2 db "Enter sentence:",'$'
   mess3 db "Match at location:",'$'
   mess4 db "No match!",13,10,'$'
   mess5 db "match",13,10,'$'
   mess6 db "H of the sentence",13,10,'$'
   ;
   stok1 label byte
   max1 db 10
   act1 db ?
   stocks1 db 10 dup(?)
   ;
   stok2 label byte
   max2 db 50
   act2 db ?
   stocks2 db 50 dup(?)
DATAREA ENDS

PROGNAM segment
;

MAIN PROC FAR
     ASSUME CS:PROGNAM ,DS:DATAREA,ES:DATAREA
    start:
     PUSH DS
     SUB AX,AX
     SUB BX,BX
     PUSH AX
     mov AX,DATAREA
     MOV DS,AX
     MOV ES,AX
     ;�˴���ʼ�����ַ����ĶԱ�
     ;����ʾ��һ�� �ؼ���
     lea dx,mess1
    mov ah,09;ds:dx��ʾ�ַ���
     int 21h
     lea dx, stok1
     mov ah,0ah;ds:dx �������뵽������
     int 21h
     cmp act1,0
     je exit;���δ���뼴�ؼ���Ϊ��ʱֱ������
    
    ;��ʱ��Ҫ�س�����
step1:  
    call crlf
    lea dx,mess2
    mov ah,09
    int 21h
    lea dx,stok2
    mov ah,0ah
    int 21h
    cmp act2,0
    je nomatch
    mov al,act1
    cbw
    mov cx,ax;cx��װ��act1��ֵ
    push cx;cx����Ҫ�Ƚϵ�keyword�ĳ��� 
    mov al,act2
    inc al
    sub al,act1;���������ַ�����С�ڹؼ�����϶�Ҳ��ƥ��
    js nomatch;���Ϊ����ֱ��ת�Ƶ���ƥ��
    mov di,0
    mov si,0
    lea bx,stocks2
   
    
 step2:
    mov ah,[bx+di]
    cmp ah,stocks1[si]
    jne step3
    inc si
    inc di
    dec cx
    cmp cx,0
    je match
    jmp step2;��δ�Ƚ���ͼ����Ƚ�
 step3:
       inc bx;����һ���ַ����бȽ�
       dec al
       cmp al,0
       je nomatch
       mov si,0
       mov di,0
       pop cx
       push cx
      ;��һ����Ϊ�ָ�cx��ֵ
       jmp step2
  exit:
      call crlf
      ret
  nomatch:
      call crlf
      lea dx,mess4
      mov ah,09
      int 21h
      jmp step1;///////��������һ����Ҫ���ܺ��ؼ��ֵ��ַ���
  match:
      call crlf
      lea dx,mess3
       mov ah,09
       int 21h
       sub bx,offset stocks2
       inc bx
       call trans;��ʱ��Ҫ���ж����Ƶ�ʮ�����Ƶ�ת��
       lea dx,mess6
       mov ah,09
       int 21h
       jmp step1
       
crlf proc near;�س�����
          mov dl,0dh
          mov ah,2
          int 21h
          mov dl,0ah
          mov ah,2
          int 21h
          ret
crlf endp          
          
 trans proc near;������ת��Ϊʮ������
   mov ch,4
   rotate:
   mov cl,4
   rol bx,cl
   mov al,bl
   and al,0fh
   add al,30h
   cmp al,3ah
   jl printit
   add al,07h
  printit:
       mov dl,al
       mov ah,2
       int 21h
       dec ch
       jnz rotate
       ret
       trans endp
       main endp
       prognam ends 
       end main



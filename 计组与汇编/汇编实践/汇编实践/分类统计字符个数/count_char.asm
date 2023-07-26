DATAS SEGMENT
    mess db "string?",13,10,'$'
    mess1 db "the number of the letter is:",'$'
    mess2 db "the number of the digit is:",'$'
    mess3 db "the number of the other is:",'$'
    letter dw 0 
    digit dw 0
    other dw 0
 string label byte;初始化输入缓冲区
    max db 81
    act db ?
    char db 81 dup(?)
    DATAS ends
   
CODES SEGMENT
main proc far
    ASSUME CS:CODES,DS:DATAS
START:
    MOV AX,DATAS
    MOV DS,AX
   MOV letter,0
   mov digit,0
   mov other,0
   lea dx,mess
   mov ah,09
   int 21h
   lea dx,string
   mov ah,0ah
   int 21h;输入需要统计的字符串
   mov dl,13
   mov ah,02
   int 21h
   mov dl,10
   mov ah,02
   int 21h;回车换行
   lea si,char
   sub cx,cx
   sub ax,ax
   mov cl,act
 compare:
     mov al,[si]
     cmp al,48
     jl oth
     cmp al,57;大于0且小于9
     jle dig
     cmp al,65
     jl oth
     cmp al,90
     jle let
     cmp al,97
     jl oth
     cmp al,122
     jle let
     jmp oth
 let:
       inc letter
       jmp loopandprint
 oth:
       inc other
       jmp loopandprint
 dig:
      inc digit
      jmp loopandprint
 loopandprint:
       inc si
       loop compare
       lea dx,mess1
       mov ah,09h
       int 21h
       mov ax,letter
       mov dl,al
       add dl,30h
       mov ah,02h
       int 21h
       mov dl,13
       mov ah,02h
       int 21h
       mov dl,10
       mov ah,02h
       int 21h;回车换行
       
       lea dx,mess2
       mov ah,09h
       int 21h
       mov ax,digit
       mov dl,al
       add dl,30h
       mov ah,02h
       int 21h
       mov dl,13
   mov ah,02h
   int 21h
   mov dl,10
   mov ah,02h
   int 21h;回车换行
       
       lea dx,mess3
       mov ah,09h
       int 21h
       mov ax,other
       mov dl,al
       add dl,30h
       mov ah,02h
       int 21h
       mov dl,13
   mov ah,02
   int 21h
   mov dl,10
   mov ah,02
   int 21h;回车换行
       
       MOV AH,4CH
       INT 21H;
  exit:
         ret
 main endp
CODES ENDS
    END MAIN
   
    



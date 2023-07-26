data  segment
      ary    dw 10,20,30,40,50,60,70,80,90,100
      count  dw 10
      sum    dw ?
data  ends

stack segment   
      dw   100    dup (?)
      tos  label  word
stack ends

code1 segment
main  proc    far
      assume  cs:code1, ds:data, ss:stack

start:

      mov     ax,  stack
      mov     ss,  ax
      mov     sp,  offset  tos
      mov     ax,  data
      mov     ds,  ax
      mov     bx,  offset  ary
      push    bx
      mov     bx,  offset  count
      push    bx
      mov     bx,  offset  sum
      push    bx
   call    far  ptr  proadd
   mov     ax,  4c00h
   int     21h
main  endp
code1 ends

code2    segment
  assume cs:code2

proadd   proc  far

  push  bp
  mov   bp, sp

  push  ax
  push  cx
  push  si
  push  di

  mov   si,[bp+0ah]
  mov   di,[bp+8]
  mov   cx,[di]
  mov   di,[bp+6]
  xor   ax,  ax
next:
  add   ax,  [si]
  add   si,  2
  loop  next
  mov   [di],ax

  pop   di
  pop   si
  pop   cx
  pop   ax

  pop   bp

  ret   6

proadd  endp

code2    ends
         end main

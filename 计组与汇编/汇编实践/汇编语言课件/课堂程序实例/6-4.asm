data  segment
      ary     dw  10,20,30,40,50,60,70,80,90,100
      count   dw  10
      sum     dw  ?
      table   dw  3  dup (?)           ; µÿ÷∑±Ì
data  ends
code  segment
main  proc   far
      assume cs:code, ds:data
      push   ds
      sub    ax, ax
      push   ax
      mov    ax, data
      mov    ds, ax
      mov    table,   offset  ary
      mov    table+2, offset  count
      mov    table+4, offset  sum
      mov    bx,      offset  table
      call   proadd
      ret
main  endp 

proadd  proc  near
        push  ax
        push  cx
        push  si
        push  di
        mov   si, [bx]
        mov   di, [bx+2]
        mov   cx, [di]
        mov   di, [bx+4]
        xor   ax, ax
next:    
        add   ax, [si]
        add   si, 2
        loop  next
        mov   [di],ax
        pop   di
        pop   si
        pop   cx
        pop   ax
        ret
proadd  endp
code    ends
        end   main


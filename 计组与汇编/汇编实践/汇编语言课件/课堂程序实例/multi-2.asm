; proadd2.asm

public  proadd
data    segment  common
        ary      dw  1,2,3,4,5,6,7,8,9,10
        count    dw  10
        sum      dw  ?
data    ends?

code2   segment  
proadd  proc   far
        assume cs:code2,ds:data
?       mov    ax, data
        mov    ds, ax
?       push   ax
        push   cx
        push   si
        lea    si, ary
        mov    cx, count
        xor    ax, ax
        next:   add   ax, [si]
        add   si, 2
        loop  next
        mov   sum,ax
?       pop   si
        pop   cx
        pop   ax
?       ret
proadd  endp
code2   ends
        end

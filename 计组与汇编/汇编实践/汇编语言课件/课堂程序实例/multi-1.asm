extrn  proadd : far
data   segment  common
       ary      dw  1,2,3,4,5,6,7,8,9,10
       count    dw  10
       sum      dw  ?
data   ends

code1  segment  
main   proc     far
       assume   cs:code1, ds:data
start:
       mov      ax, data
       mov      ds, ax
       call     far ptr proadd
       mov	ah,4ch
       int      21h
main   endp
code1  ends
       end      main

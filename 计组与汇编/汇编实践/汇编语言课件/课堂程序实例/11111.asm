.MODEL SMALL
.DATA
  S1 DB "Yes",0DH, 0AH, '$'
  S2 DB "No", 0DH, 0AH, '$'
.CODE
  MAIN PROC FAR
    MOV AX, @DATA
    MOV DS, AX
    MOV CX, 10
    MOV BX, 2
 AGAIN:
    MOV AX, 3D
    MOV DX, 0
    DIV BX
    CMP DX, 0
    JZ L1
    INC BX
    LOOP AGAIN
    MOV BX, OFFSET S1
    JMP L2
  L1:
    MOV BX, OFFSET S2
  L2:
    MOV DX, BX
    MOV AH, 9H
    INT 21H
    MOV AX, 4C00H
    INT 21H
   MAIN ENDP
 END



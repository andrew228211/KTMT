.model small
.stack 100h
.data  
    str db "Hien chuoi ki tu la: $" 
    kitu db 13,10,"HELLO $" 
.code         
    mov ax,@data
    mov ds,ax
main proc  
    mov ah,09
    lea dx,str
    int 21h
    mov ah,0eh
    mov al,07
    mov bh,0
    int 10h  
    mov cx,7
    mov si,offset kitu
 again:
    lodsb
    mov ah,0eh
    int 10h
    loop again
main endp
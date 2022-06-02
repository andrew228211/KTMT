.model small
.stack 100h
.data
    tb1 db "Nhap chuoi: $"
    s db 100, ? , 101 dup ('$')   
    tb2 db 13,10,"Do dai cua chuoi la: $"
    cnt db ?
.code   
    mov cnt,0
main proc
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,tb1 
    int 21h
    mov ah,10;nhap chuoi
    lea dx,s
    int 21h
    xor cx,cx
    lea si,s+1
    mov cl,[si] 
    mov bl,10     
    mov ah,9
    lea dx,tb2
    int 21h 
    mov ax,cx  
    mov cx,0
    chia:
        mov dx,0
        div bx
        push dx 
        inc cx
        cmp ax,0 
        jne chia 
    in:         
        pop dx 
        add dx,'0'
        mov ah,2 
        int 21h
        dec cx
        cmp cx,0
        jne in
main endp

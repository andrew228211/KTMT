.model small
.stack 100h
.data
    tb1 db "Nhap so n bat ki: $"
    tb2 db 10,13,"Giai thua la: $"
    x dw ?
    y dw 0
.code    
    mov ax,@data
    mov ds,ax 
main proc
    mov ah,9
    mov dx,offset tb1
    int 21h  
    mov bx,10 
    mov x,0
    mov y,0   
    nhap_so:
        mov ah,1
        int 21h     
        cmp al,13   
        je end
        sub al,'0' 
        mov ah,0 
 
        mov y,ax ; y=1,y=2
        mov ax,x;  ax=0,ax=1
        mul bx ; ax = 0, ax=10
        add ax,y; ax = 1,ax=12
        mov x,ax;x  = 1 , x=12
        jmp nhap_so 
    end:    
        mov ax,x
        mov bx,10
        mov cx,0
    chia:
        mov dx,0
        div bx
        push dx 
        inc cx
        cmp ax,0
        jne chia
    hienthi:
        pop dx
        sub dl,'0'
        mov ah,2  
        int 21h 
        dec cx
        cmp cx,0
        jne hienthi
        mov ah,4ch
        int 21h
main endp
.model small
.stack 100h
.data
    tb1 db "Nhap n<8: $"
    ketqua db 10,13,"Giai thua la: $"
    x db 0
    giai_thua dw 0
.code
main proc
    mov ax,@data
    mov ds,ax; khoi dong thanh ghi ds
    nhap_so_a:
        mov ah,9
        mov dx,offset tb1
        int 21h
        mov ah,1;nhap 1 ki tu ASCII
        int 21h 
	sub al,'0'
        mov x,al  
    giaithua:
        mov cx,0 ; cx =0
        mov cl,x; gan cl=x
        mov ax,1           
        for:                        
            mul cx; AX*CX,CX=CX-1 
            ;lay gia tri ax luu trong al
        LOOP for  
        mov giai_thua,ax
    tach:    
        mov ah,9
        mov dx,offset ketqua
        int 21h
        mov ax, giai_thua
        mov bx, 10
        mov cx, 0
         
    chia:
        mov dx, 0
        div bx                                  
        push dx
        inc cx
        cmp ax, 0
        je hienthi ;nhay neu dieu kien  = 0
        jmp chia  ; nhay khong dieu kien
    hienthi:
        pop dx
        add dl, 30h
        mov ah, 2h
        int 21h
        dec cx
        cmp cx,0
        jne hienthi ;nhay neu dieu kien khac 0
        mov ah, 4ch
        int 21h              
    
main endp

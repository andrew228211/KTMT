; tinh n!, voi n bat ki
.Model Small
.Stack 100h
.Data
    msg1 db "Nhap so n bat ki: $"
    msg2 db 10, 13, "Giai thu la = $"
    x dw ?
    y dw ?
    arr dw 100 dup(?); khai bao mang 100 bye de chua 100 gia tri
    size dw ?
    carry dw ?
.Code
main proc
 
    mov ax, @Data
    mov ds, ax  ; khoi tao thanh ghi ds
    call nhap   ; goi ham con 
    call giai_thua
    call xuat
    mov ah, 4ch
    int 21h 
 
main endp
 
nhap proc
 
    mov ah, 9h ; hien chuoi ki tu len man hinh
    mov dx, offset msg1; offset mg1 vao dia chi dx
    int 21h
    mov x, 0
    mov y, 0
    mov bx, 10
    input:
        mov ah, 1h
        int 21h
 
        cmp al, 13
        je return
 
        sub al, 30h; chuyen ve so
        mov ah, 0; ax = al
        mov y, ax; gan so vua nhap cho y
        mov ax, x; gan tong hien tai cho ax
        mul bx; ax = ax * 10
        add ax, y; ax = ax + so vua nhap
        mov x, ax; cap nhat tong hien tai
        jmp input
 
    return:
        ret; lenh ve cua chuong trinh con        
nhap endp
giai_thua proc
    mov si, offset arr
    mov size, 1; kich thuoc array
    mov [si], 1; chi so = 1
    mov ax, x; gan thua so hien tai cho ax
    for1:
        cmp ax, 0
        je exit_for1 ; ax = 0 thi nhay sang ham exit_for1
 
        mov si, offset arr ; doc dia chi cua mang
        mov cx, size; co the cap nhat lai size
        mov carry, 0
        for2:
            cmp cx, 0
            je exit_for2
 
            mov ax, x; gan thua so hien tai cho ax
            mov bx, [si]
            mul bx; ax = ax * [si]
            add ax, carry; ax = ax + carry
            mov bx, 10
            div bx; ax = ax / 10, dx = ax % 10
            mov [si], dx
            mov carry, ax
            add si, 2; tang si len 2 byte
            dec cx; cx--
            jmp for2
 
            exit_for2:
            mov ax, x; gan thua so hien tai cho ax
            dec ax; x--
            mov x, ax; cap nhat lai thua so hien tai
 
            mov dx, carry
            cmp dx, 0
            je for1
 
            mov [si], dx
            mov cx, size
            inc cx; tang size array len 1
            mov size, cx; cap nhat lai size
            jmp for1     
 
        exit_for1:
            ret
 
giai_thua endp    
 
xuat proc
 
    mov ah, 9h
    mov dx, offset msg2
    int 21h
 
    mov si, offset arr
    mov bx, size
    mov cx, size
    push_stack:
        cmp bx, 0
        je pop_stack
 
        mov dx, [si]
        push dx
        add si, 2; tang si len 2 byte
        dec bx; cx--
        jmp push_stack
 
    pop_stack:
        cmp cx, 0
        je thoat
 
        mov ah, 2h ; hien 1 ki tu len ma hinh
        pop dx
        add dl, 30h; chuyen ve chu, chua ki tu can hien thi
        int 21h
        dec cx; cx--
        jmp pop_stack
 
    thoat:
        ret
 
xuat endp    
 
end main
.model small
.stack 100h
.data
    mydata db 'Chao Ban'
.code    
    mov ax,@data
    mov ds,ax
    mov ax,1300h
    mov bh,07
    mov bh,01
    mov cx,5
    mov dh,3
    mov dl,25
    mov bp,offset mydata
    mov si,seg mydata;lay dia chi o segment
    mov es,si; es=segment cua xau
    int 10h
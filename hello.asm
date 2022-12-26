[bits 64]
[org 0x0000]

push rbp
mov rbp, rsp
sub rsp, 15
mov rax, 1
mov rdi, 1
mov [rbp - 15], BYTE 'H'
mov [rbp - 14], BYTE 'e'
mov [rbp - 13], BYTE 'l'
mov [rbp - 12], BYTE 'l'
mov [rbp - 11], BYTE 'o'
mov [rbp - 10], BYTE ','
mov [rbp - 9], BYTE ' '
mov [rbp - 8], BYTE 'w'
mov [rbp - 7], BYTE 'o'
mov [rbp - 6], BYTE 'r'
mov [rbp - 5], BYTE 'l'
mov [rbp - 4], BYTE 'd'
mov [rbp - 3], BYTE '!'
mov [rbp - 2], BYTE 10
mov [rbp - 1], BYTE 0
lea rsi, [rbp - 15]
mov rdx, 15
syscall
add rsp, 15
leave
ret
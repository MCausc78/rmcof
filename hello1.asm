[bits 64]
[org 0x0000]

push rbp
mov rbp, rsp
mov rax, 1
mov rdi, 1
mov rsi, hello
mov rdx, 15
syscall
add rsp, 15
leave
ret

hello db 'Hello, world!', 10, 0
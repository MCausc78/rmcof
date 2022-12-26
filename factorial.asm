[bits 64]
[org 0x0000]

factorial:
	mov rax, 1
	mov rbx, 1
	jmp .compare
.every_iteration:
	imul rbx
	inc rbx
	jmp .compare
.compare:
	cmp rbx, 7
	jle .every_iteration
	ret

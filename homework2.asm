
;   nasm -f elf64 homework2.asm
;   ld homework2.o -o homework2
;   ./homework2


				global		_start
			
				section		.text
_start:			
			
				mov			rax, 0				;i=0
				jmp			L3
			
L4:				add			[rdi + 8*rax], 1
				mov			rdx, 4
				mov			eax, [rdi + 8*rax]
				add 		rax, 1				;i++
				jmp			write9digits

L3:				cmp			rax, 8
				jb			L4
				ret
			
write9digits:	mov			eax, [rdi + 8*rax]
				cmp			0, eax
				jl			if_loop
				cmp			0, eax
				jge			else_loop
				mov			rbx, 0				;k=0
				
				jmp			for_loop
				
if_loop:		mov			rsi, empty 			;putchar(' ');
				mov			rdx, 1
				syscall
				
else_loop:		mov 		ebx, digits
				neg			ebx
				mov			rsi, minus			;putchar('-');
				mov			rdx, 1	
				syscall
												
				
				
for_loop:		cmp			rbx, 9
				jb			L5
				ret

L5:				mov			eax, rcx
				div			digits
				mov			rcx, numbers
				mov			rsi, rcx
				add			rsi, 48
				syscall
				
				mov			eax, edx
				mov			edx, 0
				mov			ecx, digits
				div			ecx
				mov			eax, edx
				mov			[rdi + 8*rax], eax				;numbers%


				div			rcx, 10
				mov			rsi, putchar_10
				mov			rdx, 4
				syscall 

			section		.data
digits:		db			100000000
empty:		db			" "
minus:		db			"-"
putchar_10: db			10
numbers:	dd			0x1310B06A, 9, 0x002D22EA, 0, 0x01277FEF, 0x12, 0xFFFEB33F, 0xFFFDFC68
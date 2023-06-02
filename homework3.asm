
; Runs on 64-bit Linux only.
; To assemble and run:

;   nasm -f elf64 n.asm
;   ld homework3.o -o homework3
;   ./homework3

					global    _start

					section   .text
_start:   			  
					mov		rax, 1
					mov		rdi, 1
					mov 	rdx, 1

					mov 	r12, [radius]		;r12==radius
					mov		r13, r12			;r13==size
					add		r13, r12
					inc		r13
					  
					mov		r10, 0				;r10==y
					mov 	r9, 0				;r9==x
					  
					o_loop:		
					
						mov		r14, r10		;r14==deltaY
						sub		r14, r12
						cmp		r14, 0
						jg		zero
						neg 	r14		 		
						
					zero:	
						mov 	r9, 0			;x==0
						
					inner_loop:
						mov		r15, r9			;r15==deltaX
						sub		r15, r12
						cmp		r15, 0
						jg		continue
						neg		r15
						
					continue:
						mov		rcx, r15		;rcx==dist
						add		rcx, r14
						cmp		rcx, 4  
						jle		empty
						
						add		rcx, 60
						push	rcx
						mov     rsi, rsp   	     ; use char on stack
						syscall                  ; invoke operating system to do the write
						add     rsp, 1
						jmp		ending
						
					empty:
						mov		rcx, 32			;putchar(' ');
						push	rcx
						mov     rsi, rsp   	            
						syscall                           
						
					
					ending:
						inc		r9
						cmp		r9, r13
						jle		inner_loop
											
						mov		rcx, 10					
						push	rcx
						mov     rsi, rsp   	     
						syscall                  
						

						inc		r10
						cmp		r10, r13
						jl		o_loop
						
						mov		rax, 60
						xor  	rdi, rdi
						syscall

					section   .data
space:  			  db        32      				
minimumDistance: 	  db	    4		
charOffSet: 		  db		60
radius:				  db		15
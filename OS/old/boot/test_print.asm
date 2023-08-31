org 0x7c00
BITS 16

start:
  mov bp, 0x8000 
  mov sp, bp

  mov bx, message
  push bx
  call print_string
  
  jmp $

%include "print.asm"
; DATA 
message: 
  db "Hello world", 0 

times 510-($-$$) db 0
dw 0xaa55

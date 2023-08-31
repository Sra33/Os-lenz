; A boot sector that enters 32 - bit protected mode.
[org 0x7c00]
KERNEL_OFFSET equ 0x1000 ;Memory offset where kernel is loaded

mov [BOOT_DRIVE], dl

mov bp , 0x9000      ; Set the stack.
mov sp , bp

call load_kernel
call switch_to_pm     ; Note that we never return from here.

jmp $

%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"
%include "disk_load.asm"

; load_kernel
load_kernel:
  mov bx , KERNEL_OFFSET    ;Set - up parameters for our disk_load routine , so
  mov dh , 15               ;that we load the first 15 sectors ( excluding
  mov dl , [BOOT_DRIVE]   ;the boot sector ) from the boot disk ( i.e. our
  call disk_load            ;kernel code ) to address KERNEL_OFFSET

  ret

[ bits 32]
; This is where we arrive after switching to and initialising protected mode.
[extern main]

BEGIN_PM:
  mov ebx, MSG_PROT_MODE
  call print_string_pm      ; Use our 32 - bit print routine.
  call KERNEL_OFFSET 
  call main
  jmp $                   ; Hang.

; Global variables
  BOOT_DRIVE db 0
  MSG_LOAD_KERNEL db "Loading Kernel into memory", 0
  MSG_REAL_MODE db "Started in 16 - bit Real Mode", 0
  MSG_PROT_MODE db "Successfully landed in 32 - bit Protected Mode", 0

; Bootsector padding
times 510-($-$$) db 0
dw 0xaa55

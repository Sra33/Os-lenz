print_string:
  mov ah, 0eh
  pop bx
.loop:
  mov al, [bx]
  cmp al, 0
  je .done
  int 0x10
  inc bx
  jmp .loop
.done:
  ret

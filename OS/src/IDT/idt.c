#include "idt.h"
#include "../config.h"
#include "memory.h"
#include <stdint.h>
struct idt_desc idt_descriptor[OS_TOTAL_INTERUPTS];
struct idtr_desc idtr_descriptor;

void idt_set(int interrupt_no, void *address) {
  struct idt_desc *desc = &idt_descriptor[interrupt_no];
  desc->offset_1 = (uint32_t)address & 0x0000ffff;
}

void idt_int() {
  memset(idt_descriptor, 0, sizeof(idt_descriptor));
  idtr_descriptor.limit = sizeof(idt_descriptor) - 1;
  idtr_descriptor.base = sizeof(idtr_descriptor);
}

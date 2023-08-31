#ifndef IDT_H_
#define IDT_H_
#include <stdint.h>
struct idt_desc {
  uint16_t offset_1;
  uint16_t selector;
  uint8_t zero;
  uint8_t type_attr;
  uint16_t offset_2;

} __attribute__((packed));

struct idtr_desc {
  uint16_t limit;
  uint32_t base;
} __attribute__((__packed__));

#endif // IDT_H_

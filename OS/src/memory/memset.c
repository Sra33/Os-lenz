#include "memset.h"
/* memset - It copies character c into th first n characters of the string
 * pointed to, by the argument str str: string c: integer n: size_t
 */
void *memset(void *str, int c, size_t n) {

  char *c_ptr = (char *)str;
  for (int i = 0; i < n; i++) {
    c_ptr[i] = (char)c;
  }
  return str;
}

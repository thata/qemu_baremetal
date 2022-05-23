  .text
  .globl _start
  .type _start, @function

_start:
  li s0, 0x4649
loop:
  j loop

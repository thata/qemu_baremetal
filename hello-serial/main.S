  .text
  .globl main

main:
  li a0, 'H'
  call putc

  li a0, 'E'
  call putc

  li a0, 'L'
  call putc

  li a0, 'L'
  call putc

  li a0, 'O'
  call putc

  li a0, '\n'
  call putc
loop:
  j loop

putc:
  li t0, 0x10000000
  sw a0, 0(t0)
  ret

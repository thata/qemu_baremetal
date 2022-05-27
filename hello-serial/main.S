  .text
  .globl main

main:
  li gp, 0x10000000
  li a0, 'H'
  sw a0, 0(gp)
  li a0, 'E'
  sw a0, 0(gp)
  li a0, 'L'
  sw a0, 0(gp)
  li a0, 'L'
  sw a0, 0(gp)
  li a0, 'O'
  sw a0, 0(gp)
  li a0, '\n'
  sw a0, 0(gp)
loop:
  j loop

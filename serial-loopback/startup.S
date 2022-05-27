.text
.globl _start
.type _start, @function

.globl _stack_top

_start:
  la sp, _stack_top
  call main
loop:
  j loop

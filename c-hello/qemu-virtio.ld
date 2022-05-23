OUTPUT_ARCH("riscv")
ENTRY(_start)

MEMORY
{
  ram (rwx) : ORIGIN = 0x80000000, LENGTH = 128M
}

SECTIONS
{
  .text : {
    *(.text)
  } >ram

  .rodata : {
    *(.rodata)
  } >ram

  .data : {
    . = ALIGN(4096);
    *(.data)
  } >ram

  .bss : {
    . = ALIGN(16);
    *(.bss)
  } >ram

  .stack : {
    . = ALIGN(16);
    . = . + 4096;
    PROVIDE(_stack_top = .);
  } >ram
}

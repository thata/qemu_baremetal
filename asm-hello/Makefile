all: asm-hello.elf

clean:
	rm -f *.o *.elf

asm-hello.o:
	riscv64-unknown-elf-gcc -march=rv32if -mabi=ilp32f -c asm-hello.S

asm-hello.elf: asm-hello.o
	riscv-none-embed-ld -m elf32lriscv -b elf32-littleriscv --no-relax -Tqemu-virtio.ld asm-hello.o -o asm-hello.elf

run:
	qemu-system-riscv32 -M virt -monitor stdio -bios asm-hello.elf

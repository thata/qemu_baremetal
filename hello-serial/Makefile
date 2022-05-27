all: c-hello.elf

clean:
	rm -f *.o *.elf

startup.o:
	riscv64-unknown-elf-gcc -O0 -march=rv32if -mabi=ilp32f -c startup.S

main.o:
	riscv64-unknown-elf-gcc -O0 -march=rv32if -mabi=ilp32f -c main.S

c-hello.elf: startup.o main.o
	riscv64-unknown-elf-ld -m elf32lriscv -b elf32-littleriscv -Tqemu-virtio.ld startup.o main.o -o c-hello.elf

run: c-hello.elf
	qemu-system-riscv32 -M virt -nographic -device loader,file=c-hello.elf -bios none

dump:
	riscv64-unknown-elf-objdump -S c-hello.elf

readelf:
	riscv64-unknown-elf-readelf -a c-hello.elf

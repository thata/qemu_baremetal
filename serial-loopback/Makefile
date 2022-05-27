all: serial-loopback.elf

clean:
	rm -f *.o *.elf

startup.o:
	riscv64-unknown-elf-gcc -O0 -march=rv32if -mabi=ilp32f -c startup.S

main.o:
	riscv64-unknown-elf-gcc -O0 -march=rv32if -mabi=ilp32f -c main.S

serial-loopback.elf: startup.o main.o
	riscv64-unknown-elf-ld -m elf32lriscv -b elf32-littleriscv -Tqemu-virtio.ld startup.o main.o -o serial-loopback.elf

run: serial-loopback.elf
	qemu-system-riscv32 -d guest_errors -M virt -nographic -device loader,file=serial-loopback.elf -bios none

dump:
	riscv64-unknown-elf-objdump -S serial-loopback.elf

readelf:
	riscv64-unknown-elf-readelf -a serial-loopback.elf

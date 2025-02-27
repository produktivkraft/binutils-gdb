riscv64-unknown-elf-as xyz_tests/add_intrinsic.s -o xyz_tests/add_intrinsic.o
riscv64-unknown-elf-ld xyz_tests/add_intrinsic.o -o xyz_tests/add_intrinsic

riscv64-unknown-elf-objdump -D xyz_tests/add_intrinsic.o
riscv64-unknown-elf-readelf -a xyz_tests/add_intrinsic

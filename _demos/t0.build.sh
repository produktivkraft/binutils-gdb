# on macos

# TODO: unify env
# brew install riscv-gnu-toolchain
micromamba install m4

mkdir -p build && pushd build

M4=$(which m4) \
CC_FOR_TARGET='riscv64-unknown-elf-gcc' CXX_FOR_TARGET='riscv64-unknown-elf-g++' \
CFLAGS_FOR_TARGET="--target=riscv64-unknown-elf -mcmodel=medany -nostdlib -O2" \
CXXFLAGS_FOR_TARGET="--target=riscv64-unknown-elf -mcmodel=medany -nostdlib -O2" \
  ../configure \
  --target=riscv64-unknown-elf \
  --prefix=$PWD/install \
  --disable-gdb \
  --disable-sim \
  --disable-werror

make -j$(nproc) all
make install

popd

./configure -h

###############################################################################

# on macos

###############################################################################

# TODO: unify env
micromamba activate mlir
micromamba install clangdev llvmdev
# which clang
# clang -print-targets
micromamba install m4
micromamba install texinfo

###############################################################################

mkdir -p build && pushd build

M4=$(which m4) \
CC_FOR_TARGET='clang' CXX_FOR_TARGET='clang++' \
CFLAGS_FOR_TARGET="--target=riscv64-unknown-elf -mcmodel=medany -nostdlib -O2" \
CXXFLAGS_FOR_TARGET="--target=riscv64-unknown-elf -mcmodel=medany -nostdlib -O2" \
  ../configure \
  --target=riscv64-unknown-elf \
  --prefix=$PWD/install \
  --disable-gdb \
  --disable-sim \
  --disable-werror

$CONDA_PREFIX/../bear/bin/bear -- make -j$(nproc)
# or
make -j$(nproc) all

make install

popd

###############################################################################

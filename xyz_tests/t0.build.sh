###############################################################################

# using micromamba on macos

alias nproc="sysctl -n hw.physicalcpu"

# deps
micromamba install m4 -y
micromamba install texinfo -y

# need a compiler has riscv target
micromamba install clangdev
# or build by your self
# export PATH="llvm-project/build/bin:$PATH"

which clang
clang -print-targets

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

# use `Bear` for `compile_commands.json`
# https://github.com/rizsotto/Bear
# bear -- make -j$(nproc)
# or
make -j$(nproc) all

make install

popd

###############################################################################

export PATH="$PWD/build/install/bin:$PATH"

bash xyz_tests/test.sh

###############################################################################

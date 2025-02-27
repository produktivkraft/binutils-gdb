	.attribute	4, 16
	.attribute	5, "rv64i2p1_xxyz1p0"
	.file	"LLVMDialectModule"
	.text
	.globl	main                            # -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	lui	a1, %hi(g_42)
	lw	a0, %lo(g_42)(a1)
	xyz.nop
	addiw	a0, a0, 1
	sw	a0, %lo(g_42)(a1)
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	g_42,@object                    # @g_42
	.data
	.p2align	2, 0x0
g_42:
	.word	42                              # 0x2a
	.size	g_42, 4

	.section	".note.GNU-stack","",@progbits

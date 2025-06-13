	.file	"llvm_architecture_example.c"
	.text
	.globl	test                            // -- Begin function test
	.p2align	4
	.type	test,@function
test:                                   // @test
	.cfi_startproc
// %bb.0:                               // %entry
	add	w0, w1, w0
	ret
.Lfunc_end0:
	.size	test, .Lfunc_end0-test
	.cfi_endproc
                                        // -- End function
	.ident	"clang version 21.0.0git (https://github.com/llvm/llvm-project.git b73d1a25765d37b81aa9de9a6654c426af87c916)"
	.section	".note.GNU-stack","",@progbits
	.addrsig

	.text
	.file	"FlexVecExample.c"
	.globl	benchmark                       // -- Begin function benchmark
	.p2align	2
	.type	benchmark,@function
benchmark:                              // @benchmark
.Lfunc_begin0:
	.file	1 "/home/omalley242/University/FYP/src" "./tests/early-loop-termination/FlexVecExample/FlexVecExample.c"
	.loc	1 1 0                           // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:1:0
	.cfi_startproc
// %bb.0:
	str	x29, [sp, #-16]!                // 8-byte Folded Spill
	.cfi_def_cfa_offset 16
	.cfi_offset w29, -16
	sub	sp, sp, #512
	.cfi_def_cfa_offset 528
	mov	x8, xzr
	add	x9, sp, #256
.LBB0_1:                                // =>This Inner Loop Header: Depth=1
.Ltmp0:
	.loc	1 14 35 prologue_end            // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:14:35
	str	w8, [x9, x8, lsl #2]
	.loc	1 13 59                         // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:13:59
	add	x8, x8, #1
	.loc	1 13 5 is_stmt 0                // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:13:5
	cmp	x8, #64
	b.ne	.LBB0_1
// %bb.2:
	.loc	1 0 5                           // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:0:5
	mov	x8, xzr
	mov	x9, sp
.LBB0_3:                                // =>This Inner Loop Header: Depth=1
	.loc	1 18 22 is_stmt 1               // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:18:22
	str	w8, [x9, x8, lsl #2]
	.loc	1 17 47                         // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:17:47
	add	x8, x8, #1
	.loc	1 17 5 is_stmt 0                // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:17:5
	cmp	x8, #64
	b.ne	.LBB0_3
// %bb.4:
	.loc	1 0 5                           // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:0:5
	mov	w8, #-1                         // =0xffffffff
	mov	x0, xzr
	mov	x9, sp
	.loc	1 21 12 is_stmt 1               // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:21:12
	str	w8, [sp, #128]
	add	x8, sp, #256
.LBB0_5:                                // =>This Inner Loop Header: Depth=1
	.loc	1 25 16                         // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:25:16
	ldrsw	x10, [x8, x0, lsl #2]
	.loc	1 26 17                         // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:26:17
	ldr	w10, [x9, x10, lsl #2]
	.loc	1 27 13                         // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:27:13
	tbnz	w10, #31, .LBB0_7
// %bb.6:                               //   in Loop: Header=BB0_5 Depth=1
	.loc	1 24 24                         // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:24:24
	add	x0, x0, #1
	.loc	1 24 5 is_stmt 0                // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:24:5
	cmp	x0, #64
	b.ne	.LBB0_5
.LBB0_7:
                                        // kill: def $w0 killed $w0 killed $x0
	.loc	1 33 5 epilogue_begin is_stmt 1 // ./tests/early-loop-termination/FlexVecExample/FlexVecExample.c:33:5
	add	sp, sp, #512
	.cfi_def_cfa_offset 16
	ldr	x29, [sp], #16                  // 8-byte Folded Reload
	.cfi_def_cfa_offset 0
	.cfi_restore w29
	ret
.Ltmp1:
.Lfunc_end0:
	.size	benchmark, .Lfunc_end0-benchmark
	.cfi_endproc
                                        // -- End function
	.section	.debug_abbrev,"",@progbits
	.byte	1                               // Abbreviation Code
	.byte	17                              // DW_TAG_compile_unit
	.byte	0                               // DW_CHILDREN_no
	.byte	37                              // DW_AT_producer
	.byte	14                              // DW_FORM_strp
	.byte	19                              // DW_AT_language
	.byte	5                               // DW_FORM_data2
	.byte	3                               // DW_AT_name
	.byte	14                              // DW_FORM_strp
	.byte	16                              // DW_AT_stmt_list
	.byte	23                              // DW_FORM_sec_offset
	.byte	27                              // DW_AT_comp_dir
	.byte	14                              // DW_FORM_strp
	.byte	17                              // DW_AT_low_pc
	.byte	1                               // DW_FORM_addr
	.byte	18                              // DW_AT_high_pc
	.byte	6                               // DW_FORM_data4
	.byte	0                               // EOM(1)
	.byte	0                               // EOM(2)
	.byte	0                               // EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.word	.Ldebug_info_end0-.Ldebug_info_start0 // Length of Unit
.Ldebug_info_start0:
	.hword	4                               // DWARF version number
	.word	.debug_abbrev                   // Offset Into Abbrev. Section
	.byte	8                               // Address Size (in bytes)
	.byte	1                               // Abbrev [1] 0xb:0x1f DW_TAG_compile_unit
	.word	.Linfo_string0                  // DW_AT_producer
	.hword	29                              // DW_AT_language
	.word	.Linfo_string1                  // DW_AT_name
	.word	.Lline_table_start0             // DW_AT_stmt_list
	.word	.Linfo_string2                  // DW_AT_comp_dir
	.xword	.Lfunc_begin0                   // DW_AT_low_pc
	.word	.Lfunc_end0-.Lfunc_begin0       // DW_AT_high_pc
.Ldebug_info_end0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"Ubuntu clang version 18.1.3 (1ubuntu1)" // string offset=0
.Linfo_string1:
	.asciz	"tests/early-loop-termination/FlexVecExample/FlexVecExample.c" // string offset=39
.Linfo_string2:
	.asciz	"/home/omalley242/University/FYP/src" // string offset=100
	.ident	"Ubuntu clang version 18.1.3 (1ubuntu1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:

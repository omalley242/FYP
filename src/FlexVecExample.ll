; ModuleID = './tests/early-loop-termination/FlexVecExample/FlexVecExample.c'
source_filename = "./tests/early-loop-termination/FlexVecExample/FlexVecExample.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable vscale_range(1,16)
define dso_local i32 @main() local_unnamed_addr #0 !dbg !11 {
entry:
  %spiral_srch = alloca [64 x i32], align 4, !DIAssignID !35
    #dbg_assign(i1 poison, !25, !DIExpression(), !35, ptr %spiral_srch, !DIExpression(), !36)
  %mv = alloca [64 x i32], align 4, !DIAssignID !37
    #dbg_assign(i1 poison, !29, !DIExpression(), !37, ptr %mv, !DIExpression(), !36)
    #dbg_value(i32 0, !17, !DIExpression(), !36)
    #dbg_value(i32 1000, !18, !DIExpression(), !36)
    #dbg_value(i32 0, !22, !DIExpression(), !36)
    #dbg_value(i32 4, !23, !DIExpression(), !36)
    #dbg_value(i32 0, !24, !DIExpression(), !36)
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %spiral_srch) #4, !dbg !38
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %mv) #4, !dbg !39
    #dbg_value(i32 0, !30, !DIExpression(), !36)
    #dbg_value(i32 0, !31, !DIExpression(), !40)
  %0 = tail call i64 @llvm.vscale.i64(), !dbg !41
  %1 = shl nuw nsw i64 %0, 2, !dbg !41
  %n.rnd.up = add nuw nsw i64 %1, 999, !dbg !41
  %.not = sub nsw i64 0, %1, !dbg !41
  %n.vec = and i64 %n.rnd.up, %.not, !dbg !41
  %2 = tail call i64 @llvm.vscale.i64(), !dbg !41
  %3 = shl nuw nsw i64 %2, 2, !dbg !41
  %4 = tail call <vscale x 4 x i32> @llvm.stepvector.nxv4i32(), !dbg !42
  %5 = trunc nuw nsw i64 %3 to i32, !dbg !41
  %.splatinsert = insertelement <vscale x 4 x i32> poison, i32 %5, i64 0, !dbg !41
  %.splat = shufflevector <vscale x 4 x i32> %.splatinsert, <vscale x 4 x i32> poison, <vscale x 4 x i32> zeroinitializer, !dbg !41
  br label %vector.body, !dbg !41

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next, %vector.body ], !dbg !45
  %vec.ind = phi <vscale x 4 x i32> [ %4, %entry ], [ %vec.ind.next, %vector.body ], !dbg !42
  %active.lane.mask = tail call <vscale x 4 x i1> @llvm.get.active.lane.mask.nxv4i1.i64(i64 %index, i64 1000)
  %6 = getelementptr inbounds nuw [64 x i32], ptr %spiral_srch, i64 0, i64 %index, !dbg !46
  call void @llvm.masked.store.nxv4i32.p0(<vscale x 4 x i32> %vec.ind, ptr %6, i32 4, <vscale x 4 x i1> %active.lane.mask), !dbg !42, !tbaa !47
  %index.next = add nuw i64 %index, %3, !dbg !45
  %vec.ind.next = add <vscale x 4 x i32> %vec.ind, %.splat, !dbg !42
  %7 = icmp eq i64 %index.next, %n.vec, !dbg !45
  br i1 %7, label %vector.ph55, label %vector.body, !dbg !45, !llvm.loop !51

vector.ph55:                                      ; preds = %vector.body
  %8 = tail call i64 @llvm.vscale.i64(), !dbg !57
  %9 = shl nuw nsw i64 %8, 2, !dbg !57
  %n.rnd.up56 = add nuw nsw i64 %9, 999, !dbg !57
  %.not70 = sub nsw i64 0, %9, !dbg !57
  %n.vec58 = and i64 %n.rnd.up56, %.not70, !dbg !57
  %10 = tail call i64 @llvm.vscale.i64(), !dbg !57
  %11 = shl nuw nsw i64 %10, 2, !dbg !57
  %12 = tail call <vscale x 4 x i32> @llvm.stepvector.nxv4i32(), !dbg !58
  %13 = trunc nuw nsw i64 %11 to i32, !dbg !57
  %.splatinsert62 = insertelement <vscale x 4 x i32> poison, i32 %13, i64 0, !dbg !57
  %.splat63 = shufflevector <vscale x 4 x i32> %.splatinsert62, <vscale x 4 x i32> poison, <vscale x 4 x i32> zeroinitializer, !dbg !57
  br label %vector.body59, !dbg !57

vector.body59:                                    ; preds = %vector.body59, %vector.ph55
  %index60 = phi i64 [ 0, %vector.ph55 ], [ %index.next67, %vector.body59 ], !dbg !61
  %vec.ind64 = phi <vscale x 4 x i32> [ %12, %vector.ph55 ], [ %vec.ind.next65, %vector.body59 ], !dbg !58
  %active.lane.mask66 = tail call <vscale x 4 x i1> @llvm.get.active.lane.mask.nxv4i1.i64(i64 %index60, i64 1000)
  %14 = getelementptr inbounds nuw [64 x i32], ptr %mv, i64 0, i64 %index60, !dbg !62
  call void @llvm.masked.store.nxv4i32.p0(<vscale x 4 x i32> %vec.ind64, ptr %14, i32 4, <vscale x 4 x i1> %active.lane.mask66), !dbg !58, !tbaa !47
  %index.next67 = add nuw i64 %index60, %11, !dbg !61
  %vec.ind.next65 = add <vscale x 4 x i32> %vec.ind64, %.splat63, !dbg !58
  %15 = icmp eq i64 %index.next67, %n.vec58, !dbg !61
  br i1 %15, label %for.cond.cleanup3, label %vector.body59, !dbg !61, !llvm.loop !63

for.cond.cleanup3:                                ; preds = %vector.body59
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %mv, i64 128, !dbg !65
  store i32 -1, ptr %arrayidx10, align 4, !dbg !66, !tbaa !47, !DIAssignID !67
    #dbg_assign(i32 -1, !29, !DIExpression(DW_OP_LLVM_fragment, 1024, 32), !67, ptr %arrayidx10, !DIExpression(), !36)
    #dbg_value(i32 0, !30, !DIExpression(), !36)
    #dbg_value(i32 0, !17, !DIExpression(), !36)
  br label %for.body13, !dbg !68

for.body13:                                       ; preds = %for.cond.cleanup3, %if.end21
  %indvars.iv45 = phi i64 [ 0, %for.cond.cleanup3 ], [ %indvars.iv.next46, %if.end21 ]
  %temp.039 = phi i32 [ 0, %for.cond.cleanup3 ], [ %add, %if.end21 ]
    #dbg_value(i32 %temp.039, !30, !DIExpression(), !36)
    #dbg_value(i64 %indvars.iv45, !17, !DIExpression(), !36)
  %arrayidx15 = getelementptr inbounds nuw [64 x i32], ptr %spiral_srch, i64 0, i64 %indvars.iv45, !dbg !70
  %16 = load i32, ptr %arrayidx15, align 4, !dbg !70, !tbaa !47
    #dbg_value(i32 %16, !19, !DIExpression(), !36)
  %idxprom16 = sext i32 %16 to i64, !dbg !73
  %arrayidx17 = getelementptr inbounds [64 x i32], ptr %mv, i64 0, i64 %idxprom16, !dbg !73
  %17 = load i32, ptr %arrayidx17, align 4, !dbg !73, !tbaa !47
    #dbg_value(i32 %17, !20, !DIExpression(), !36)
  %cmp18 = icmp slt i32 %17, 0, !dbg !74
  br i1 %cmp18, label %for.end24.split.loop.exit49, label %if.end, !dbg !74

if.end:                                           ; preds = %for.body13
  %cmp19 = icmp samesign ult i32 %17, 4, !dbg !76
  br i1 %cmp19, label %for.end24, label %if.end21, !dbg !76

if.end21:                                         ; preds = %if.end
  %add = add nuw nsw i32 %temp.039, 5, !dbg !78
    #dbg_value(i32 %add, !30, !DIExpression(), !36)
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1, !dbg !79
    #dbg_value(i64 %indvars.iv.next46, !17, !DIExpression(), !36)
  %exitcond48.not = icmp eq i64 %indvars.iv.next46, 1000, !dbg !80
  br i1 %exitcond48.not, label %for.end24, label %for.body13, !dbg !68, !llvm.loop !81

for.end24.split.loop.exit49:                      ; preds = %for.body13
  %18 = trunc nuw nsw i64 %indvars.iv45 to i32
  br label %for.end24, !dbg !87

for.end24:                                        ; preds = %if.end21, %if.end, %for.end24.split.loop.exit49
  %best_pos.0 = phi i32 [ %18, %for.end24.split.loop.exit49 ], [ %temp.039, %if.end ], [ 0, %if.end21 ], !dbg !36
    #dbg_value(i32 %best_pos.0, !24, !DIExpression(), !36)
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %mv) #4, !dbg !87
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %spiral_srch) #4, !dbg !87
  ret i32 %best_pos.0, !dbg !88
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr captures(none)) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.vscale.i64() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i32> @llvm.stepvector.nxv4i32() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <vscale x 4 x i1> @llvm.get.active.lane.mask.nxv4i1.i64(i64, i64) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.nxv4i32.p0(<vscale x 4 x i32>, ptr captures(none), i32 immarg, <vscale x 4 x i1>) #3

attributes #0 = { nofree norecurse nosync nounwind memory(none) uwtable vscale_range(1,16) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="neoverse-v2" "target-features"="+bf16,+bti,+ccidx,+complxnum,+crc,+dit,+dotprod,+ete,+flagm,+fp-armv8,+fp16fml,+fpac,+fullfp16,+i8mm,+jsconv,+lse,+mte,+neon,+outline-atomics,+pauth,+perfmon,+predres,+rand,+ras,+rcpc,+rdm,+sb,+spe,+ssbs,+sve,+sve-bitperm,+sve2,+trbe,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+v9a,-fmv" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 21.0.0git (https://github.com/llvm/llvm-project.git b73d1a25765d37b81aa9de9a6654c426af87c916)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "tests/early-loop-termination/FlexVecExample/FlexVecExample.c", directory: "/home/omalley242/University/FYP/src", checksumkind: CSK_MD5, checksum: "4c37576e882c0a3f55a6cb1117001718")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 1}
!9 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!10 = !{!"clang version 21.0.0git (https://github.com/llvm/llvm-project.git b73d1a25765d37b81aa9de9a6654c426af87c916)"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 1, type: !13, scopeLine: 1, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !16)
!12 = !DIFile(filename: "./tests/early-loop-termination/FlexVecExample/FlexVecExample.c", directory: "/home/omalley242/University/FYP/src", checksumkind: CSK_MD5, checksum: "4c37576e882c0a3f55a6cb1117001718")
!13 = !DISubroutineType(types: !14)
!14 = !{!15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!17, !18, !19, !20, !21, !22, !23, !24, !25, !29, !30, !31, !33}
!17 = !DILocalVariable(name: "pos", scope: !11, file: !12, line: 4, type: !15)
!18 = !DILocalVariable(name: "max_pos", scope: !11, file: !12, line: 5, type: !15)
!19 = !DILocalVariable(name: "cand", scope: !11, file: !12, line: 6, type: !15)
!20 = !DILocalVariable(name: "mcost", scope: !11, file: !12, line: 7, type: !15)
!21 = !DILocalVariable(name: "mcost_2", scope: !11, file: !12, line: 8, type: !15)
!22 = !DILocalVariable(name: "min_mcost", scope: !11, file: !12, line: 9, type: !15)
!23 = !DILocalVariable(name: "min_mcost_2", scope: !11, file: !12, line: 10, type: !15)
!24 = !DILocalVariable(name: "best_pos", scope: !11, file: !12, line: 11, type: !15)
!25 = !DILocalVariable(name: "spiral_srch", scope: !11, file: !12, line: 12, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 2048, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 64)
!29 = !DILocalVariable(name: "mv", scope: !11, file: !12, line: 13, type: !26)
!30 = !DILocalVariable(name: "temp", scope: !11, file: !12, line: 14, type: !15)
!31 = !DILocalVariable(name: "spiral_index", scope: !32, file: !12, line: 18, type: !15)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 18, column: 5)
!33 = !DILocalVariable(name: "mv_index", scope: !34, file: !12, line: 22, type: !15)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 22, column: 5)
!35 = distinct !DIAssignID()
!36 = !DILocation(line: 0, scope: !11)
!37 = distinct !DIAssignID()
!38 = !DILocation(line: 12, column: 5, scope: !11)
!39 = !DILocation(line: 13, column: 5, scope: !11)
!40 = !DILocation(line: 0, scope: !32)
!41 = !DILocation(line: 18, column: 5, scope: !32)
!42 = !DILocation(line: 19, column: 35, scope: !43)
!43 = distinct !DILexicalBlock(scope: !44, file: !12, line: 18, column: 64)
!44 = distinct !DILexicalBlock(scope: !32, file: !12, line: 18, column: 5)
!45 = !DILocation(line: 18, column: 61, scope: !44)
!46 = !DILocation(line: 19, column: 9, scope: !43)
!47 = !{!48, !48, i64 0}
!48 = !{!"int", !49, i64 0}
!49 = !{!"omnipotent char", !50, i64 0}
!50 = !{!"Simple C/C++ TBAA"}
!51 = distinct !{!51, !41, !52, !53, !54, !55, !56}
!52 = !DILocation(line: 20, column: 5, scope: !32)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !{!"llvm.loop.unroll.disable"}
!55 = !{!"llvm.loop.isvectorized", i32 1}
!56 = !{!"llvm.loop.unroll.runtime.disable"}
!57 = !DILocation(line: 22, column: 5, scope: !34)
!58 = !DILocation(line: 23, column: 22, scope: !59)
!59 = distinct !DILexicalBlock(scope: !60, file: !12, line: 22, column: 52)
!60 = distinct !DILexicalBlock(scope: !34, file: !12, line: 22, column: 5)
!61 = !DILocation(line: 22, column: 49, scope: !60)
!62 = !DILocation(line: 23, column: 9, scope: !59)
!63 = distinct !{!63, !57, !64, !53, !54, !55, !56}
!64 = !DILocation(line: 24, column: 5, scope: !34)
!65 = !DILocation(line: 26, column: 5, scope: !11)
!66 = !DILocation(line: 26, column: 12, scope: !11)
!67 = distinct !DIAssignID()
!68 = !DILocation(line: 30, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!70 = !DILocation(line: 31, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !72, file: !12, line: 30, column: 33)
!72 = distinct !DILexicalBlock(scope: !69, file: !12, line: 30, column: 5)
!73 = !DILocation(line: 32, column: 17, scope: !71)
!74 = !DILocation(line: 35, column: 19, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !12, line: 35, column: 13)
!76 = !DILocation(line: 41, column: 19, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !12, line: 41, column: 13)
!78 = !DILocation(line: 46, column: 14, scope: !71)
!79 = !DILocation(line: 30, column: 30, scope: !72)
!80 = !DILocation(line: 30, column: 16, scope: !72)
!81 = distinct !{!81, !68, !82, !53, !54, !83, !84, !85, !86}
!82 = !DILocation(line: 48, column: 5, scope: !69)
!83 = !{!"llvm.loop.vectorize.width", i32 4}
!84 = !{!"llvm.loop.vectorize.scalable.enable", i1 true}
!85 = !{!"llvm.loop.interleave.count", i32 4}
!86 = !{!"llvm.loop.vectorize.enable", i1 true}
!87 = !DILocation(line: 51, column: 1, scope: !11)
!88 = !DILocation(line: 50, column: 5, scope: !11)

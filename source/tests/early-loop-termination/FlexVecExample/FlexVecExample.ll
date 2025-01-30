; ModuleID = './tests/early-loop-termination/FlexVecExample/FlexVecExample.c'
source_filename = "./tests/early-loop-termination/FlexVecExample/FlexVecExample.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(none)
define dso_local i32 @benchmark() local_unnamed_addr #0 {
entry:
  %spiral_srch = alloca [64 x i32], align 16
  %mv = alloca [64 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %spiral_srch) #2
  call void @llvm.lifetime.start.p0(i64 256, ptr nonnull %mv) #2
  store i32 0, ptr %spiral_srch, align 16, !tbaa !2
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 4
  store i32 1, ptr %arrayidx.1, align 4, !tbaa !2
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 8
  store i32 2, ptr %arrayidx.2, align 8, !tbaa !2
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 12
  store i32 3, ptr %arrayidx.3, align 4, !tbaa !2
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 16
  store i32 4, ptr %arrayidx.4, align 16, !tbaa !2
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 20
  store i32 5, ptr %arrayidx.5, align 4, !tbaa !2
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 24
  store i32 6, ptr %arrayidx.6, align 8, !tbaa !2
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 28
  store i32 7, ptr %arrayidx.7, align 4, !tbaa !2
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 32
  store i32 8, ptr %arrayidx.8, align 16, !tbaa !2
  %arrayidx.9 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 36
  store i32 9, ptr %arrayidx.9, align 4, !tbaa !2
  %arrayidx.10 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 40
  store i32 10, ptr %arrayidx.10, align 8, !tbaa !2
  %arrayidx.11 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 44
  store i32 11, ptr %arrayidx.11, align 4, !tbaa !2
  %arrayidx.12 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 48
  store i32 12, ptr %arrayidx.12, align 16, !tbaa !2
  %arrayidx.13 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 52
  store i32 13, ptr %arrayidx.13, align 4, !tbaa !2
  %arrayidx.14 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 56
  store i32 14, ptr %arrayidx.14, align 8, !tbaa !2
  %arrayidx.15 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 60
  store i32 15, ptr %arrayidx.15, align 4, !tbaa !2
  %arrayidx.16 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 64
  store i32 16, ptr %arrayidx.16, align 16, !tbaa !2
  %arrayidx.17 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 68
  store i32 17, ptr %arrayidx.17, align 4, !tbaa !2
  %arrayidx.18 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 72
  store i32 18, ptr %arrayidx.18, align 8, !tbaa !2
  %arrayidx.19 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 76
  store i32 19, ptr %arrayidx.19, align 4, !tbaa !2
  %arrayidx.20 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 80
  store i32 20, ptr %arrayidx.20, align 16, !tbaa !2
  %arrayidx.21 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 84
  store i32 21, ptr %arrayidx.21, align 4, !tbaa !2
  %arrayidx.22 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 88
  store i32 22, ptr %arrayidx.22, align 8, !tbaa !2
  %arrayidx.23 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 92
  store i32 23, ptr %arrayidx.23, align 4, !tbaa !2
  %arrayidx.24 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 96
  store i32 24, ptr %arrayidx.24, align 16, !tbaa !2
  %arrayidx.25 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 100
  store i32 25, ptr %arrayidx.25, align 4, !tbaa !2
  %arrayidx.26 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 104
  store i32 26, ptr %arrayidx.26, align 8, !tbaa !2
  %arrayidx.27 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 108
  store i32 27, ptr %arrayidx.27, align 4, !tbaa !2
  %arrayidx.28 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 112
  store i32 28, ptr %arrayidx.28, align 16, !tbaa !2
  %arrayidx.29 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 116
  store i32 29, ptr %arrayidx.29, align 4, !tbaa !2
  %arrayidx.30 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 120
  store i32 30, ptr %arrayidx.30, align 8, !tbaa !2
  %arrayidx.31 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 124
  store i32 31, ptr %arrayidx.31, align 4, !tbaa !2
  %arrayidx.32 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 128
  store i32 32, ptr %arrayidx.32, align 16, !tbaa !2
  %arrayidx.33 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 132
  store i32 33, ptr %arrayidx.33, align 4, !tbaa !2
  %arrayidx.34 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 136
  store i32 34, ptr %arrayidx.34, align 8, !tbaa !2
  %arrayidx.35 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 140
  store i32 35, ptr %arrayidx.35, align 4, !tbaa !2
  %arrayidx.36 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 144
  store i32 36, ptr %arrayidx.36, align 16, !tbaa !2
  %arrayidx.37 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 148
  store i32 37, ptr %arrayidx.37, align 4, !tbaa !2
  %arrayidx.38 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 152
  store i32 38, ptr %arrayidx.38, align 8, !tbaa !2
  %arrayidx.39 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 156
  store i32 39, ptr %arrayidx.39, align 4, !tbaa !2
  %arrayidx.40 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 160
  store i32 40, ptr %arrayidx.40, align 16, !tbaa !2
  %arrayidx.41 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 164
  store i32 41, ptr %arrayidx.41, align 4, !tbaa !2
  %arrayidx.42 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 168
  store i32 42, ptr %arrayidx.42, align 8, !tbaa !2
  %arrayidx.43 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 172
  store i32 43, ptr %arrayidx.43, align 4, !tbaa !2
  %arrayidx.44 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 176
  store i32 44, ptr %arrayidx.44, align 16, !tbaa !2
  %arrayidx.45 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 180
  store i32 45, ptr %arrayidx.45, align 4, !tbaa !2
  %arrayidx.46 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 184
  store i32 46, ptr %arrayidx.46, align 8, !tbaa !2
  %arrayidx.47 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 188
  store i32 47, ptr %arrayidx.47, align 4, !tbaa !2
  %arrayidx.48 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 192
  store i32 48, ptr %arrayidx.48, align 16, !tbaa !2
  %arrayidx.49 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 196
  store i32 49, ptr %arrayidx.49, align 4, !tbaa !2
  %arrayidx.50 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 200
  store i32 50, ptr %arrayidx.50, align 8, !tbaa !2
  %arrayidx.51 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 204
  store i32 51, ptr %arrayidx.51, align 4, !tbaa !2
  %arrayidx.52 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 208
  store i32 52, ptr %arrayidx.52, align 16, !tbaa !2
  %arrayidx.53 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 212
  store i32 53, ptr %arrayidx.53, align 4, !tbaa !2
  %arrayidx.54 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 216
  store i32 54, ptr %arrayidx.54, align 8, !tbaa !2
  %arrayidx.55 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 220
  store i32 55, ptr %arrayidx.55, align 4, !tbaa !2
  %arrayidx.56 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 224
  store i32 56, ptr %arrayidx.56, align 16, !tbaa !2
  %arrayidx.57 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 228
  store i32 57, ptr %arrayidx.57, align 4, !tbaa !2
  %arrayidx.58 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 232
  store i32 58, ptr %arrayidx.58, align 8, !tbaa !2
  %arrayidx.59 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 236
  store i32 59, ptr %arrayidx.59, align 4, !tbaa !2
  %arrayidx.60 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 240
  store i32 60, ptr %arrayidx.60, align 16, !tbaa !2
  %arrayidx.61 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 244
  store i32 61, ptr %arrayidx.61, align 4, !tbaa !2
  %arrayidx.62 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 248
  store i32 62, ptr %arrayidx.62, align 8, !tbaa !2
  %arrayidx.63 = getelementptr inbounds nuw i8, ptr %spiral_srch, i64 252
  store i32 63, ptr %arrayidx.63, align 4, !tbaa !2
  store i32 0, ptr %mv, align 16, !tbaa !2
  %arrayidx6.1 = getelementptr inbounds nuw i8, ptr %mv, i64 4
  store i32 1, ptr %arrayidx6.1, align 4, !tbaa !2
  %arrayidx6.2 = getelementptr inbounds nuw i8, ptr %mv, i64 8
  store i32 2, ptr %arrayidx6.2, align 8, !tbaa !2
  %arrayidx6.3 = getelementptr inbounds nuw i8, ptr %mv, i64 12
  store i32 3, ptr %arrayidx6.3, align 4, !tbaa !2
  %arrayidx6.4 = getelementptr inbounds nuw i8, ptr %mv, i64 16
  store i32 4, ptr %arrayidx6.4, align 16, !tbaa !2
  %arrayidx6.5 = getelementptr inbounds nuw i8, ptr %mv, i64 20
  store i32 5, ptr %arrayidx6.5, align 4, !tbaa !2
  %arrayidx6.6 = getelementptr inbounds nuw i8, ptr %mv, i64 24
  store i32 6, ptr %arrayidx6.6, align 8, !tbaa !2
  %arrayidx6.7 = getelementptr inbounds nuw i8, ptr %mv, i64 28
  store i32 7, ptr %arrayidx6.7, align 4, !tbaa !2
  %arrayidx6.8 = getelementptr inbounds nuw i8, ptr %mv, i64 32
  store i32 8, ptr %arrayidx6.8, align 16, !tbaa !2
  %arrayidx6.9 = getelementptr inbounds nuw i8, ptr %mv, i64 36
  store i32 9, ptr %arrayidx6.9, align 4, !tbaa !2
  %arrayidx6.10 = getelementptr inbounds nuw i8, ptr %mv, i64 40
  store i32 10, ptr %arrayidx6.10, align 8, !tbaa !2
  %arrayidx6.11 = getelementptr inbounds nuw i8, ptr %mv, i64 44
  store i32 11, ptr %arrayidx6.11, align 4, !tbaa !2
  %arrayidx6.12 = getelementptr inbounds nuw i8, ptr %mv, i64 48
  store i32 12, ptr %arrayidx6.12, align 16, !tbaa !2
  %arrayidx6.13 = getelementptr inbounds nuw i8, ptr %mv, i64 52
  store i32 13, ptr %arrayidx6.13, align 4, !tbaa !2
  %arrayidx6.14 = getelementptr inbounds nuw i8, ptr %mv, i64 56
  store i32 14, ptr %arrayidx6.14, align 8, !tbaa !2
  %arrayidx6.15 = getelementptr inbounds nuw i8, ptr %mv, i64 60
  store i32 15, ptr %arrayidx6.15, align 4, !tbaa !2
  %arrayidx6.16 = getelementptr inbounds nuw i8, ptr %mv, i64 64
  store i32 16, ptr %arrayidx6.16, align 16, !tbaa !2
  %arrayidx6.17 = getelementptr inbounds nuw i8, ptr %mv, i64 68
  store i32 17, ptr %arrayidx6.17, align 4, !tbaa !2
  %arrayidx6.18 = getelementptr inbounds nuw i8, ptr %mv, i64 72
  store i32 18, ptr %arrayidx6.18, align 8, !tbaa !2
  %arrayidx6.19 = getelementptr inbounds nuw i8, ptr %mv, i64 76
  store i32 19, ptr %arrayidx6.19, align 4, !tbaa !2
  %arrayidx6.20 = getelementptr inbounds nuw i8, ptr %mv, i64 80
  store i32 20, ptr %arrayidx6.20, align 16, !tbaa !2
  %arrayidx6.21 = getelementptr inbounds nuw i8, ptr %mv, i64 84
  store i32 21, ptr %arrayidx6.21, align 4, !tbaa !2
  %arrayidx6.22 = getelementptr inbounds nuw i8, ptr %mv, i64 88
  store i32 22, ptr %arrayidx6.22, align 8, !tbaa !2
  %arrayidx6.23 = getelementptr inbounds nuw i8, ptr %mv, i64 92
  store i32 23, ptr %arrayidx6.23, align 4, !tbaa !2
  %arrayidx6.24 = getelementptr inbounds nuw i8, ptr %mv, i64 96
  store i32 24, ptr %arrayidx6.24, align 16, !tbaa !2
  %arrayidx6.25 = getelementptr inbounds nuw i8, ptr %mv, i64 100
  store i32 25, ptr %arrayidx6.25, align 4, !tbaa !2
  %arrayidx6.26 = getelementptr inbounds nuw i8, ptr %mv, i64 104
  store i32 26, ptr %arrayidx6.26, align 8, !tbaa !2
  %arrayidx6.27 = getelementptr inbounds nuw i8, ptr %mv, i64 108
  store i32 27, ptr %arrayidx6.27, align 4, !tbaa !2
  %arrayidx6.28 = getelementptr inbounds nuw i8, ptr %mv, i64 112
  store i32 28, ptr %arrayidx6.28, align 16, !tbaa !2
  %arrayidx6.29 = getelementptr inbounds nuw i8, ptr %mv, i64 116
  store i32 29, ptr %arrayidx6.29, align 4, !tbaa !2
  %arrayidx6.30 = getelementptr inbounds nuw i8, ptr %mv, i64 120
  store i32 30, ptr %arrayidx6.30, align 8, !tbaa !2
  %arrayidx6.31 = getelementptr inbounds nuw i8, ptr %mv, i64 124
  store i32 31, ptr %arrayidx6.31, align 4, !tbaa !2
  %arrayidx6.32 = getelementptr inbounds nuw i8, ptr %mv, i64 128
  %arrayidx6.33 = getelementptr inbounds nuw i8, ptr %mv, i64 132
  store i32 33, ptr %arrayidx6.33, align 4, !tbaa !2
  %arrayidx6.34 = getelementptr inbounds nuw i8, ptr %mv, i64 136
  store i32 34, ptr %arrayidx6.34, align 8, !tbaa !2
  %arrayidx6.35 = getelementptr inbounds nuw i8, ptr %mv, i64 140
  store i32 35, ptr %arrayidx6.35, align 4, !tbaa !2
  %arrayidx6.36 = getelementptr inbounds nuw i8, ptr %mv, i64 144
  store i32 36, ptr %arrayidx6.36, align 16, !tbaa !2
  %arrayidx6.37 = getelementptr inbounds nuw i8, ptr %mv, i64 148
  store i32 37, ptr %arrayidx6.37, align 4, !tbaa !2
  %arrayidx6.38 = getelementptr inbounds nuw i8, ptr %mv, i64 152
  store i32 38, ptr %arrayidx6.38, align 8, !tbaa !2
  %arrayidx6.39 = getelementptr inbounds nuw i8, ptr %mv, i64 156
  store i32 39, ptr %arrayidx6.39, align 4, !tbaa !2
  %arrayidx6.40 = getelementptr inbounds nuw i8, ptr %mv, i64 160
  store i32 40, ptr %arrayidx6.40, align 16, !tbaa !2
  %arrayidx6.41 = getelementptr inbounds nuw i8, ptr %mv, i64 164
  store i32 41, ptr %arrayidx6.41, align 4, !tbaa !2
  %arrayidx6.42 = getelementptr inbounds nuw i8, ptr %mv, i64 168
  store i32 42, ptr %arrayidx6.42, align 8, !tbaa !2
  %arrayidx6.43 = getelementptr inbounds nuw i8, ptr %mv, i64 172
  store i32 43, ptr %arrayidx6.43, align 4, !tbaa !2
  %arrayidx6.44 = getelementptr inbounds nuw i8, ptr %mv, i64 176
  store i32 44, ptr %arrayidx6.44, align 16, !tbaa !2
  %arrayidx6.45 = getelementptr inbounds nuw i8, ptr %mv, i64 180
  store i32 45, ptr %arrayidx6.45, align 4, !tbaa !2
  %arrayidx6.46 = getelementptr inbounds nuw i8, ptr %mv, i64 184
  store i32 46, ptr %arrayidx6.46, align 8, !tbaa !2
  %arrayidx6.47 = getelementptr inbounds nuw i8, ptr %mv, i64 188
  store i32 47, ptr %arrayidx6.47, align 4, !tbaa !2
  %arrayidx6.48 = getelementptr inbounds nuw i8, ptr %mv, i64 192
  store i32 48, ptr %arrayidx6.48, align 16, !tbaa !2
  %arrayidx6.49 = getelementptr inbounds nuw i8, ptr %mv, i64 196
  store i32 49, ptr %arrayidx6.49, align 4, !tbaa !2
  %arrayidx6.50 = getelementptr inbounds nuw i8, ptr %mv, i64 200
  store i32 50, ptr %arrayidx6.50, align 8, !tbaa !2
  %arrayidx6.51 = getelementptr inbounds nuw i8, ptr %mv, i64 204
  store i32 51, ptr %arrayidx6.51, align 4, !tbaa !2
  %arrayidx6.52 = getelementptr inbounds nuw i8, ptr %mv, i64 208
  store i32 52, ptr %arrayidx6.52, align 16, !tbaa !2
  %arrayidx6.53 = getelementptr inbounds nuw i8, ptr %mv, i64 212
  store i32 53, ptr %arrayidx6.53, align 4, !tbaa !2
  %arrayidx6.54 = getelementptr inbounds nuw i8, ptr %mv, i64 216
  store i32 54, ptr %arrayidx6.54, align 8, !tbaa !2
  %arrayidx6.55 = getelementptr inbounds nuw i8, ptr %mv, i64 220
  store i32 55, ptr %arrayidx6.55, align 4, !tbaa !2
  %arrayidx6.56 = getelementptr inbounds nuw i8, ptr %mv, i64 224
  store i32 56, ptr %arrayidx6.56, align 16, !tbaa !2
  %arrayidx6.57 = getelementptr inbounds nuw i8, ptr %mv, i64 228
  store i32 57, ptr %arrayidx6.57, align 4, !tbaa !2
  %arrayidx6.58 = getelementptr inbounds nuw i8, ptr %mv, i64 232
  store i32 58, ptr %arrayidx6.58, align 8, !tbaa !2
  %arrayidx6.59 = getelementptr inbounds nuw i8, ptr %mv, i64 236
  store i32 59, ptr %arrayidx6.59, align 4, !tbaa !2
  %arrayidx6.60 = getelementptr inbounds nuw i8, ptr %mv, i64 240
  store i32 60, ptr %arrayidx6.60, align 16, !tbaa !2
  %arrayidx6.61 = getelementptr inbounds nuw i8, ptr %mv, i64 244
  store i32 61, ptr %arrayidx6.61, align 4, !tbaa !2
  %arrayidx6.62 = getelementptr inbounds nuw i8, ptr %mv, i64 248
  store i32 62, ptr %arrayidx6.62, align 8, !tbaa !2
  %arrayidx6.63 = getelementptr inbounds nuw i8, ptr %mv, i64 252
  store i32 63, ptr %arrayidx6.63, align 4, !tbaa !2
  store i32 -1, ptr %arrayidx6.32, align 16, !tbaa !2
  br label %for.body13

for.body13:                                       ; preds = %entry, %for.inc19
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc19 ]
  %arrayidx15 = getelementptr inbounds nuw [64 x i32], ptr %spiral_srch, i64 0, i64 %indvars.iv
  %0 = load i32, ptr %arrayidx15, align 4, !tbaa !2
  %idxprom16 = sext i32 %0 to i64
  %arrayidx17 = getelementptr inbounds [64 x i32], ptr %mv, i64 0, i64 %idxprom16
  %1 = load i32, ptr %arrayidx17, align 4, !tbaa !2
  %cmp18 = icmp slt i32 %1, 0
  br i1 %cmp18, label %for.end21.split.loop.exit, label %for.inc19

for.inc19:                                        ; preds = %for.body13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 64
  br i1 %exitcond.not, label %for.end21, label %for.body13, !llvm.loop !6

for.end21.split.loop.exit:                        ; preds = %for.body13
  %2 = trunc nuw nsw i64 %indvars.iv to i32
  br label %for.end21

for.end21:                                        ; preds = %for.inc19, %for.end21.split.loop.exit
  %pos.0.lcssa = phi i32 [ %2, %for.end21.split.loop.exit ], [ 64, %for.inc19 ]
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %mv) #2
  call void @llvm.lifetime.end.p0(i64 256, ptr nonnull %spiral_srch) #2
  ret i32 %pos.0.lcssa
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nofree norecurse nosync nounwind memory(none) "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-features"="+cx8,+mmx,+sse,+sse2,+x87" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 20.0.0git (git@github.com:omalley242/llvm-project-fyp.git eba7690d2b94ebe7fcf3e8ceecd4486f328de035)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}

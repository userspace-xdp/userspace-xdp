; ModuleID = '.llvm_ir/xdp_tx.bpf.ll'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr #0 {
setupBlock:
  %2 = getelementptr i8, ptr %0, i64 8
  %3 = load i64, ptr %2, align 4
  %4 = load i64, ptr %0, align 4
  %5 = add i64 %4, 14
  %6 = icmp ugt i64 %5, %3
  br i1 %6, label %bb_inst_19, label %bb_inst_6

bb_inst_6:                                        ; preds = %setupBlock
  %7 = inttoptr i64 %4 to ptr
  %8 = load i16, ptr %7, align 2
  %9 = getelementptr i8, ptr %7, i64 6
  %10 = load i16, ptr %9, align 2
  store i16 %10, ptr %7, align 2
  %11 = getelementptr i8, ptr %7, i64 8
  %12 = load i16, ptr %11, align 2
  %13 = getelementptr i8, ptr %7, i64 2
  %14 = load i16, ptr %13, align 2
  store i16 %14, ptr %11, align 2
  store i16 %12, ptr %13, align 2
  %15 = getelementptr i8, ptr %7, i64 10
  %16 = load i16, ptr %15, align 2
  %17 = getelementptr i8, ptr %7, i64 4
  %18 = load i16, ptr %17, align 2
  store i16 %18, ptr %15, align 2
  store i16 %8, ptr %9, align 2
  store i16 %16, ptr %17, align 2
  br label %bb_inst_19

bb_inst_19:                                       ; preds = %bb_inst_6, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 3, %bb_inst_6 ]
  ret i64 %r0.0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn }

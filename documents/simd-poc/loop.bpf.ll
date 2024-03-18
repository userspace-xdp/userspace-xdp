; ModuleID = 'bpf-jit'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind
define i64 @bpf_main(ptr %0, i64 %1) local_unnamed_addr #0 {
setupBlock:
  %2 = load i64, ptr %0, align 4
  %3 = getelementptr i8, ptr %0, i64 8
  %4 = load i64, ptr %3, align 4
  %5 = sub i64 %4, %2
  %6 = shl i64 %5, 32
  %7 = ashr exact i64 %6, 32
  %8 = icmp slt i64 %6, 4294967296
  br i1 %8, label %exitBlock, label %bb_inst_8.preheader

bb_inst_8.preheader:                              ; preds = %setupBlock
  br label %bb_inst_8

bb_inst_8:                                        ; preds = %bb_inst_8.preheader, %bb_inst_8
  %r3.0 = phi i64 [ %12, %bb_inst_8 ], [ 0, %bb_inst_8.preheader ]
  %9 = add i64 %2, %r3.0
  %.cast = inttoptr i64 %9 to ptr
  %10 = load i8, ptr %.cast, align 1
  %11 = add i8 %10, 1
  store i8 %11, ptr %.cast, align 1
  %12 = add nuw nsw i64 %r3.0, 1
  %13 = icmp sgt i64 %7, %12
  br i1 %13, label %bb_inst_8, label %exitBlock

exitBlock:                                        ; preds = %bb_inst_8, %setupBlock
  ret i64 0
}

attributes #0 = { nofree norecurse nosync nounwind }

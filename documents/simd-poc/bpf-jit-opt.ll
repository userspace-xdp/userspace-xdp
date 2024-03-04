; ModuleID = 'bpf-jit.ll'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind
define i64 @bpf_main(ptr %0, i64 %1) local_unnamed_addr #0 {
setupBlock:
  %2 = ptrtoint ptr %0 to i64
  br label %bb_inst_1

bb_inst_1:                                        ; preds = %bb_inst_1, %setupBlock
  %r2.0 = phi i64 [ 0, %setupBlock ], [ %9, %bb_inst_1 ]
  %3 = add i64 %r2.0, %2
  %.cast = inttoptr i64 %3 to ptr
  %4 = load i32, ptr %.cast, align 4
  %5 = getelementptr i8, ptr %.cast, i64 4096
  %6 = load i32, ptr %5, align 4
  %7 = add i32 %6, %4
  %8 = getelementptr i8, ptr %.cast, i64 8192
  store i32 %7, ptr %8, align 4
  %9 = add nuw nsw i64 %r2.0, 4
  %10 = icmp eq i64 %9, 4096
  br i1 %10, label %exitBlock, label %bb_inst_1

exitBlock:                                        ; preds = %bb_inst_1
  ret i64 undef
}

attributes #0 = { nofree norecurse nosync nounwind }

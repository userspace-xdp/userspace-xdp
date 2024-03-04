; ModuleID = 'bpf-jit'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind
define i64 @bpf_main(ptr nocapture readnone %0, i64 %1) local_unnamed_addr #0 {
setupBlock:
  br label %bb_inst_1

bb_inst_1:                                        ; preds = %bb_inst_1, %setupBlock
  %r1.0 = phi i64 [ 0, %setupBlock ], [ %7, %bb_inst_1 ]
  %.cast = inttoptr i64 %r1.0 to ptr
  %2 = load i32, ptr %.cast, align 4
  %3 = getelementptr i8, ptr %.cast, i64 4096
  %4 = load i32, ptr %3, align 4
  %5 = add i32 %4, %2
  %6 = getelementptr i8, ptr %.cast, i64 8192
  store i32 %5, ptr %6, align 4
  %7 = add nuw nsw i64 %r1.0, 4
  %8 = icmp eq i64 %7, 4096
  br i1 %8, label %exitBlock, label %bb_inst_1

exitBlock:                                        ; preds = %bb_inst_1
  ret i64 undef
}

attributes #0 = { nofree norecurse nosync nounwind }
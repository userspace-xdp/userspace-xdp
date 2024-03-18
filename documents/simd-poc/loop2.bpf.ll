; ModuleID = 'bpf-jit'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind
define i64 @bpf_main(ptr %0, i64 %1) local_unnamed_addr #0 {
setupBlock:
  %2 = ptrtoint ptr %0 to i64
  br label %bb_inst_9

bb_inst_9:                                        ; preds = %setupBlock, %bb_inst_9
  %lsr.iv11 = phi i32 [ -1, %setupBlock ], [ %lsr.iv.next12, %bb_inst_9 ]
  %lsr.iv = phi i64 [ %2, %setupBlock ], [ %lsr.iv.next, %bb_inst_9 ]
  %3 = add i64 %lsr.iv, 64
  %.cast = inttoptr i64 %3 to ptr
  %4 = load i8, ptr %.cast, align 1
  %5 = add i8 %4, 1
  %.cast2 = inttoptr i64 %lsr.iv to ptr
  store i8 %5, ptr %.cast2, align 1
  %lsr.iv.next = add i64 %lsr.iv, 1
  %lsr.iv.next12 = add nsw i32 %lsr.iv11, 1
  %6 = icmp ugt i32 %lsr.iv.next12, 62
  br i1 %6, label %exitBlock, label %bb_inst_9

exitBlock:                                        ; preds = %bb_inst_9
  ret i64 0
}

attributes #0 = { nofree norecurse nosync nounwind }

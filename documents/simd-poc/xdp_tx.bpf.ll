; ModuleID = 'bpf-jit'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind
define i64 @bpf_main(ptr %0, i64 %1) local_unnamed_addr #0 {
setupBlock:
  %2 = shl i64 %1, 32
  %3 = icmp slt i64 %2, 4294967296
  br i1 %3, label %bb_inst_13, label %bb_inst_5

bb_inst_5:                                        ; preds = %setupBlock
  %4 = ptrtoint ptr %0 to i64
  %5 = and i64 %1, 4294967295
  br label %bb_inst_15

bb_inst_10:                                       ; preds = %bb_inst_24, %bb_inst_15
  %6 = add i64 %r1.0, 8
  %7 = add nuw nsw i64 %r3.0, 1
  %8 = icmp ugt i64 %5, %7
  br i1 %8, label %bb_inst_15, label %bb_inst_13

bb_inst_13:                                       ; preds = %bb_inst_10, %setupBlock
  ret i64 3

bb_inst_15:                                       ; preds = %bb_inst_10, %bb_inst_5
  %r1.0 = phi i64 [ %4, %bb_inst_5 ], [ %6, %bb_inst_10 ]
  %r3.0 = phi i64 [ 0, %bb_inst_5 ], [ %7, %bb_inst_10 ]
  %9 = inttoptr i64 %r1.0 to ptr
  %10 = load i64, ptr %9, align 4
  %11 = add i64 %10, 8
  %.cast = inttoptr i64 %11 to ptr
  %12 = load i64, ptr %.cast, align 4
  %.cast1 = inttoptr i64 %10 to ptr
  %13 = load i64, ptr %.cast1, align 4
  %14 = add i64 %13, 14
  %15 = icmp ugt i64 %14, %12
  br i1 %15, label %bb_inst_10, label %bb_inst_24

bb_inst_24:                                       ; preds = %bb_inst_15
  %16 = inttoptr i64 %13 to ptr
  %17 = load i16, ptr %16, align 2
  %18 = getelementptr i8, ptr %16, i64 6
  %19 = load i16, ptr %18, align 2
  store i16 %19, ptr %16, align 2
  %20 = getelementptr i8, ptr %16, i64 8
  %21 = load i16, ptr %20, align 2
  %22 = getelementptr i8, ptr %16, i64 2
  %23 = load i16, ptr %22, align 2
  store i16 %23, ptr %20, align 2
  store i16 %21, ptr %22, align 2
  %24 = getelementptr i8, ptr %16, i64 10
  %25 = load i16, ptr %24, align 2
  %26 = getelementptr i8, ptr %16, i64 4
  %27 = load i16, ptr %26, align 2
  store i16 %27, ptr %24, align 2
  store i16 %17, ptr %18, align 2
  store i16 %25, ptr %26, align 2
  br label %bb_inst_10
}

attributes #0 = { nofree norecurse nosync nounwind }
; ModuleID = 'bpf-jit'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind
define i64 @bpf_main(ptr %0, i64 %1) local_unnamed_addr #0 {
setupBlock:
  %stackBegin1 = alloca [2058 x i64], align 8
  %2 = ptrtoint ptr %0 to i64
  %3 = getelementptr inbounds i64, ptr %stackBegin1, i64 2046
  store i64 %2, ptr %3, align 8
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load i64, ptr %4, align 4
  %6 = getelementptr inbounds i64, ptr %stackBegin1, i64 2045
  store i64 %5, ptr %6, align 8
  %7 = load i64, ptr %0, align 4
  %8 = getelementptr inbounds i64, ptr %stackBegin1, i64 2044
  store i64 %7, ptr %8, align 8
  %9 = sub i64 %5, %7
  %10 = trunc i64 %9 to i32
  %11 = getelementptr inbounds i8, ptr %stackBegin1, i64 16284
  store i32 %10, ptr %11, align 4
  %12 = shl i64 %9, 32
  %13 = icmp sgt i64 %12, 270582939648
  br i1 %13, label %bb_inst_20, label %exitBlock

bb_inst_20:                                       ; preds = %setupBlock
  %14 = getelementptr inbounds i64, ptr %stackBegin1, i64 2035
  store i32 0, ptr %14, align 8
  br label %bb_inst_28

bb_inst_28:                                       ; preds = %bb_inst_20, %bb_inst_28
  %15 = phi i32 [ 0, %bb_inst_20 ], [ %22, %bb_inst_28 ]
  %sunkaddr = getelementptr inbounds i8, ptr %stackBegin1, i64 16352
  %16 = load i64, ptr %sunkaddr, align 8
  %17 = sext i32 %15 to i64
  %18 = add i64 %16, %17
  %.cast3 = inttoptr i64 %18 to ptr
  %19 = load i8, ptr %.cast3, align 1
  %20 = add i8 %19, 1
  %sunkaddr27 = getelementptr i8, ptr %stackBegin1, i64 %17
  %sunkaddr28 = getelementptr i8, ptr %sunkaddr27, i64 16288
  store i8 %20, ptr %sunkaddr28, align 1
  %sunkaddr29 = getelementptr inbounds i8, ptr %stackBegin1, i64 16280
  %21 = load i32, ptr %sunkaddr29, align 8
  %22 = add i32 %21, 1
  store i32 %22, ptr %sunkaddr29, align 8
  %23 = icmp sgt i32 %22, 63
  br i1 %23, label %bb_inst_44, label %bb_inst_28

bb_inst_44:                                       ; preds = %bb_inst_28
  %24 = getelementptr inbounds i8, ptr %stackBegin1, i64 16276
  store i32 0, ptr %24, align 4
  br label %bb_inst_52

bb_inst_52:                                       ; preds = %bb_inst_44, %bb_inst_52
  %storemerge25 = phi i32 [ 0, %bb_inst_44 ], [ %30, %bb_inst_52 ]
  %25 = sext i32 %storemerge25 to i64
  %sunkaddr30 = getelementptr i8, ptr %stackBegin1, i64 %25
  %sunkaddr31 = getelementptr i8, ptr %sunkaddr30, i64 16288
  %26 = load i8, ptr %sunkaddr31, align 1
  %sunkaddr32 = getelementptr inbounds i8, ptr %stackBegin1, i64 16352
  %27 = load i64, ptr %sunkaddr32, align 8
  %28 = add i64 %27, %25
  %.cast7 = inttoptr i64 %28 to ptr
  store i8 %26, ptr %.cast7, align 1
  %sunkaddr33 = getelementptr inbounds i8, ptr %stackBegin1, i64 16276
  %29 = load i32, ptr %sunkaddr33, align 4
  %30 = add i32 %29, 1
  store i32 %30, ptr %sunkaddr33, align 4
  %31 = icmp sgt i32 %30, 63
  br i1 %31, label %exitBlock, label %bb_inst_52

exitBlock:                                        ; preds = %bb_inst_52, %setupBlock
  %.sink = phi i32 [ -1, %setupBlock ], [ 0, %bb_inst_52 ]
  %32 = getelementptr inbounds i8, ptr %stackBegin1, i64 16380
  store i32 %.sink, ptr %32, align 4
  %33 = zext i32 %.sink to i64
  ret i64 %33
}

attributes #0 = { nofree norecurse nosync nounwind }

; ModuleID = 'xdp_map_access.bpf.inline.ll'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ctl_array = global [2 x i32] zeroinitializer, align 4
@cntrs_array = global [512 x i64] zeroinitializer, align 8

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin41 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin41, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = load i64, ptr %0, align 4
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load i64, ptr %4, align 4
  %6 = getelementptr inbounds i8, ptr %stackEnd, i64 -4
  store i32 0, ptr %6, align 4
  %7 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i32 0, ptr %7, align 8
  %8 = add i64 %2, -4
  %arrayidx = getelementptr inbounds [2 x i32], ptr @ctl_array, i64 0
  %9 = ptrtoint ptr %arrayidx to i64
  ; %9 = call i64 @_bpf_helper_ext_0001(i64 0, i64 %8, i64 undef, i64 undef, i64 undef)
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %bb_inst_41, label %bb_inst_13

bb_inst_13:                                       ; preds = %setupBlock
  %11 = inttoptr i64 %9 to ptr
  %12 = load i32, ptr %11, align 4
  %.not = icmp eq i32 %12, 0
  br i1 %.not, label %bb_inst_15, label %bb_inst_41

bb_inst_15:                                       ; preds = %bb_inst_13
  %13 = add i64 %2, -8
  %arrayidx1 = getelementptr inbounds [512 x i64], ptr @cntrs_array, i64 0
  %14 = ptrtoint ptr %arrayidx1 to i64
  ; %14 = call i64 @_bpf_helper_ext_0001(i64 0, i64 %13, i64 undef, i64 undef, i64 undef)
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %bb_inst_24, label %bb_inst_21

bb_inst_21:                                       ; preds = %bb_inst_15
  %16 = inttoptr i64 %14 to ptr
  %17 = load i64, ptr %16, align 4
  %18 = add i64 %17, 1
  store i64 %18, ptr %16, align 4
  br label %bb_inst_24

bb_inst_24:                                       ; preds = %bb_inst_21, %bb_inst_15
  %19 = add i64 %3, 14
  %20 = icmp ugt i64 %19, %5
  br i1 %20, label %bb_inst_41, label %bb_inst_28

bb_inst_28:                                       ; preds = %bb_inst_24
  %21 = inttoptr i64 %3 to ptr
  %22 = load i16, ptr %21, align 2
  %23 = getelementptr i8, ptr %21, i64 6
  %24 = load i16, ptr %23, align 2
  store i16 %24, ptr %21, align 2
  %25 = getelementptr i8, ptr %21, i64 8
  %26 = load i16, ptr %25, align 2
  %27 = getelementptr i8, ptr %21, i64 2
  %28 = load i16, ptr %27, align 2
  store i16 %28, ptr %25, align 2
  store i16 %26, ptr %27, align 2
  %29 = getelementptr i8, ptr %21, i64 10
  %30 = load i16, ptr %29, align 2
  %31 = getelementptr i8, ptr %21, i64 4
  %32 = load i16, ptr %31, align 2
  store i16 %32, ptr %29, align 2
  store i16 %22, ptr %23, align 2
  store i16 %30, ptr %31, align 2
  br label %bb_inst_41

bb_inst_41:                                       ; preds = %bb_inst_28, %bb_inst_24, %bb_inst_13, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_13 ], [ 1, %bb_inst_24 ], [ 3, %bb_inst_28 ]
  ret i64 %r0.0
}

; ModuleID = 'xdp_map_access.ll'
source_filename = "bpf-jit"

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin41 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin41, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = load i32, ptr %0, align 4
  %4 = zext i32 %3 to i64
  %5 = getelementptr i8, ptr %0, i64 4
  %6 = load i32, ptr %5, align 4
  %7 = zext i32 %6 to i64
  %8 = getelementptr inbounds i8, ptr %stackEnd, i64 -4
  store i32 0, ptr %8, align 4
  %9 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i32 0, ptr %9, align 8
  %10 = add i64 %2, -4
  %11 = call i64 @_bpf_helper_ext_0001(i64 0, i64 %10, i64 undef, i64 undef, i64 undef)
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %bb_inst_41, label %bb_inst_13

bb_inst_13:                                       ; preds = %setupBlock
  %13 = inttoptr i64 %11 to ptr
  %14 = load i32, ptr %13, align 4
  %.not = icmp eq i32 %14, 0
  br i1 %.not, label %bb_inst_15, label %bb_inst_41

bb_inst_15:                                       ; preds = %bb_inst_13
  %15 = add i64 %2, -8
  %16 = call i64 @_bpf_helper_ext_0001(i64 0, i64 %15, i64 undef, i64 undef, i64 undef)
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %bb_inst_24, label %bb_inst_21

bb_inst_21:                                       ; preds = %bb_inst_15
  %18 = inttoptr i64 %16 to ptr
  %19 = load i64, ptr %18, align 4
  %20 = add i64 %19, 1
  store i64 %20, ptr %18, align 4
  br label %bb_inst_24

bb_inst_24:                                       ; preds = %bb_inst_21, %bb_inst_15
  %21 = add nuw nsw i64 %4, 14
  %22 = icmp ugt i64 %21, %7
  br i1 %22, label %bb_inst_41, label %bb_inst_28

bb_inst_28:                                       ; preds = %bb_inst_24
  %23 = inttoptr i64 %4 to ptr
  %24 = load i16, ptr %23, align 2
  %25 = getelementptr i8, ptr %23, i64 6
  %26 = load i16, ptr %25, align 2
  store i16 %26, ptr %23, align 2
  %27 = getelementptr i8, ptr %23, i64 8
  %28 = load i16, ptr %27, align 2
  %29 = getelementptr i8, ptr %23, i64 2
  %30 = load i16, ptr %29, align 2
  store i16 %30, ptr %27, align 2
  store i16 %28, ptr %29, align 2
  %31 = getelementptr i8, ptr %23, i64 10
  %32 = load i16, ptr %31, align 2
  %33 = getelementptr i8, ptr %23, i64 4
  %34 = load i16, ptr %33, align 2
  store i16 %34, ptr %31, align 2
  store i16 %24, ptr %25, align 2
  store i16 %32, ptr %33, align 2
  br label %bb_inst_41

bb_inst_41:                                       ; preds = %bb_inst_28, %bb_inst_24, %bb_inst_13, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_13 ], [ 1, %bb_inst_24 ], [ 3, %bb_inst_28 ]
  ret i64 %r0.0
}

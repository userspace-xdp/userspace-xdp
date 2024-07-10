; ModuleID = '.llvm_ir/xdping.bpf.ll'
source_filename = "bpf-jit"

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0028(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin77 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin77, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = load i64, ptr %0, align 4
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load i64, ptr %4, align 4
  %6 = add i64 %3, 98
  %7 = icmp ugt i64 %6, %5
  br i1 %7, label %bb_inst_76, label %bb_inst_6

bb_inst_6:                                        ; preds = %setupBlock
  %8 = inttoptr i64 %3 to ptr
  %9 = getelementptr i8, ptr %8, i64 12
  %10 = load i16, ptr %9, align 2
  %.not = icmp eq i16 %10, 8
  br i1 %.not, label %bb_inst_8, label %bb_inst_76

bb_inst_8:                                        ; preds = %bb_inst_6
  %11 = add i64 %3, 14
  %12 = inttoptr i64 %11 to ptr
  %13 = getelementptr i8, ptr %12, i64 9
  %14 = load i8, ptr %13, align 1
  %.not78 = icmp eq i8 %14, 1
  br i1 %.not78, label %bb_inst_12, label %bb_inst_76

bb_inst_12:                                       ; preds = %bb_inst_8
  %15 = add i64 %3, 34
  %.not79 = icmp ult i64 %5, %15
  br i1 %.not79, label %bb_inst_17, label %bb_inst_35

bb_inst_17:                                       ; preds = %bb_inst_12
  %16 = getelementptr inbounds i8, ptr %stackEnd, i64 -6
  store i8 0, ptr %16, align 2
  %17 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i16 2672, ptr %17, align 8
  %18 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i64 7882259360673000545, ptr %18, align 8
  %19 = getelementptr inbounds i8, ptr %stackEnd, i64 -24
  store i64 8533873931993441824, ptr %19, align 8
  %20 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  store i64 6004214541667288152, ptr %20, align 8
  %21 = add i64 %2, -32
  %22 = call i64 @_bpf_helper_ext_0006(i64 %21, i64 27, i64 0, i64 undef, i64 undef)
  br label %bb_inst_76

bb_inst_35:                                       ; preds = %bb_inst_12
  %23 = getelementptr i8, ptr %12, i64 12
  %24 = load i32, ptr %23, align 4
  %25 = load i16, ptr %8, align 2
  %26 = getelementptr i8, ptr %8, i64 6
  %27 = load i16, ptr %26, align 2
  store i16 %27, ptr %8, align 2
  %28 = getelementptr i8, ptr %8, i64 8
  %29 = load i16, ptr %28, align 2
  %30 = getelementptr i8, ptr %8, i64 2
  %31 = load i16, ptr %30, align 2
  store i16 %31, ptr %28, align 2
  store i16 %29, ptr %30, align 2
  %32 = getelementptr i8, ptr %8, i64 10
  %33 = load i16, ptr %32, align 2
  %34 = getelementptr i8, ptr %8, i64 4
  %35 = load i16, ptr %34, align 2
  store i16 %35, ptr %32, align 2
  store i16 %25, ptr %26, align 2
  store i16 %33, ptr %34, align 2
  %36 = getelementptr i8, ptr %12, i64 16
  %37 = load i32, ptr %36, align 4
  store i32 %37, ptr %23, align 4
  store i32 %24, ptr %36, align 4
  %38 = inttoptr i64 %15 to ptr
  store i8 0, ptr %38, align 1
  %39 = getelementptr i8, ptr %38, i64 2
  store i16 0, ptr %39, align 2
  %40 = call i64 @_bpf_helper_ext_0028(i64 0, i64 0, i64 %15, i64 64, i64 0)
  %41 = and i64 %40, 65535
  %42 = lshr i64 %40, 16
  %43 = and i64 %42, 65535
  %44 = add nuw nsw i64 %43, %41
  %45 = lshr i64 %44, 16
  %46 = add nuw nsw i64 %45, %44
  %47 = trunc i64 %46 to i16
  %48 = xor i16 %47, -1
  store i16 %48, ptr %39, align 2
  br label %bb_inst_76

bb_inst_76:                                       ; preds = %bb_inst_35, %bb_inst_17, %bb_inst_8, %bb_inst_6, %setupBlock
  %r7.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_6 ], [ 2, %bb_inst_8 ], [ 3, %bb_inst_35 ], [ 2, %bb_inst_17 ]
  ret i64 %r7.0
}

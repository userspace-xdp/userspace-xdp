; ModuleID = '.llvm_ir/xdp_csum.bpf.ll'
source_filename = "bpf-jit"

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0028(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin63 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin63, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = getelementptr i8, ptr %0, i64 8
  %4 = load i64, ptr %3, align 4
  %5 = load i64, ptr %0, align 4
  %6 = getelementptr inbounds i8, ptr %stackEnd, i64 -4
  store i32 23, ptr %6, align 4
  %7 = add i64 %5, 14
  %8 = icmp ugt i64 %7, %4
  br i1 %8, label %bb_inst_64, label %bb_inst_8

bb_inst_8:                                        ; preds = %setupBlock
  %9 = inttoptr i64 %5 to ptr
  %10 = getelementptr i8, ptr %9, i64 12
  %11 = load i16, ptr %10, align 2
  %.not = icmp ne i16 %11, 8
  %12 = add i64 %5, 34
  %13 = icmp ugt i64 %12, %4
  %or.cond = select i1 %.not, i1 true, i1 %13
  br i1 %or.cond, label %bb_inst_64, label %bb_inst_13

bb_inst_13:                                       ; preds = %bb_inst_8
  %14 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i64 %5, ptr %14, align 8
  %15 = inttoptr i64 %7 to ptr
  %16 = getelementptr i8, ptr %15, i64 10
  %17 = add i64 %2, -4
  br label %bb_inst_18

bb_inst_18:                                       ; preds = %bb_inst_18, %bb_inst_13
  %r7.0 = phi i64 [ 0, %bb_inst_13 ], [ %25, %bb_inst_18 ]
  %r9.0 = phi i64 [ 32, %bb_inst_13 ], [ %26, %bb_inst_18 ]
  %18 = call i64 @_bpf_helper_ext_0028(i64 0, i64 0, i64 %7, i64 20, i64 %r7.0)
  %19 = lshr i64 %18, 16
  %20 = and i64 %19, 65535
  %21 = add i64 %20, %18
  %22 = xor i64 %21, -1
  %23 = trunc i64 %22 to i16
  store i16 %23, ptr %16, align 2
  %24 = call i64 @_bpf_helper_ext_0001(i64 0, i64 %17, i64 %7, i64 20, i64 %r7.0)
  %25 = and i64 %22, 65535
  %26 = add nsw i64 %r9.0, -1
  %27 = and i64 %26, 4294967295
  %.not64 = icmp eq i64 %27, 0
  br i1 %.not64, label %bb_inst_41, label %bb_inst_18

bb_inst_41:                                       ; preds = %bb_inst_18
  %28 = call i64 @_bpf_helper_ext_0001(i64 0, i64 %17, i64 %7, i64 20, i64 %r7.0)
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %bb_inst_50, label %bb_inst_47

bb_inst_47:                                       ; preds = %bb_inst_41
  %30 = inttoptr i64 %28 to ptr
  %31 = load i64, ptr %30, align 4
  %32 = add i64 %31, 1
  store i64 %32, ptr %30, align 4
  br label %bb_inst_50

bb_inst_50:                                       ; preds = %bb_inst_47, %bb_inst_41
  %33 = load i64, ptr %14, align 8
  %34 = inttoptr i64 %33 to ptr
  %35 = load i16, ptr %34, align 2
  %36 = getelementptr i8, ptr %34, i64 6
  %37 = load i16, ptr %36, align 2
  store i16 %37, ptr %34, align 2
  %38 = getelementptr i8, ptr %34, i64 8
  %39 = load i16, ptr %38, align 2
  %40 = getelementptr i8, ptr %34, i64 2
  %41 = load i16, ptr %40, align 2
  store i16 %41, ptr %38, align 2
  store i16 %39, ptr %40, align 2
  %42 = getelementptr i8, ptr %34, i64 10
  %43 = load i16, ptr %42, align 2
  %44 = getelementptr i8, ptr %34, i64 4
  %45 = load i16, ptr %44, align 2
  store i16 %45, ptr %42, align 2
  store i16 %35, ptr %36, align 2
  store i16 %43, ptr %44, align 2
  br label %bb_inst_64

bb_inst_64:                                       ; preds = %bb_inst_50, %bb_inst_8, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_8 ], [ 3, %bb_inst_50 ]
  ret i64 %r0.0
}

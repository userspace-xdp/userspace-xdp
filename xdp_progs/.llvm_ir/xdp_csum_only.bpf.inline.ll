; ModuleID = '.llvm_ir/xdp_csum_only.bpf.ll'
source_filename = "bpf-jit"

declare i64 @_bpf_helper_ext_0028(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %2 = getelementptr i8, ptr %0, i64 8
  %3 = load i64, ptr %2, align 4
  %4 = load i64, ptr %0, align 4
  %5 = add i64 %4, 14
  %6 = icmp ugt i64 %5, %3
  br i1 %6, label %bb_inst_45, label %bb_inst_6

bb_inst_6:                                        ; preds = %setupBlock
  %7 = inttoptr i64 %4 to ptr
  %8 = getelementptr i8, ptr %7, i64 12
  %9 = load i16, ptr %8, align 2
  %.not = icmp ne i16 %9, 8
  %10 = add i64 %4, 34
  %11 = icmp ugt i64 %10, %3
  %or.cond = select i1 %.not, i1 true, i1 %11
  br i1 %or.cond, label %bb_inst_45, label %bb_inst_15.preheader

bb_inst_15.preheader:                             ; preds = %bb_inst_6
  %12 = inttoptr i64 %5 to ptr
  %13 = getelementptr i8, ptr %12, i64 10
  br label %bb_inst_15

bb_inst_15:                                       ; preds = %bb_inst_15.preheader, %bb_inst_15
  %r5.0 = phi i64 [ %20, %bb_inst_15 ], [ 0, %bb_inst_15.preheader ]
  %r8.0 = phi i64 [ %21, %bb_inst_15 ], [ 32, %bb_inst_15.preheader ]
  %14 = tail call i64 @_bpf_helper_ext_0028(i64 0, i64 0, i64 %5, i64 20, i64 %r5.0)
  %15 = lshr i64 %14, 16
  %16 = and i64 %15, 65535
  %17 = add i64 %16, %14
  %18 = xor i64 %17, -1
  %19 = trunc i64 %18 to i16
  store i16 %19, ptr %13, align 2
  %20 = and i64 %18, 65535
  %21 = add nsw i64 %r8.0, -1
  %22 = and i64 %21, 4294967295
  %.not41 = icmp eq i64 %22, 0
  br i1 %.not41, label %bb_inst_32, label %bb_inst_15

bb_inst_32:                                       ; preds = %bb_inst_15
  %23 = load i16, ptr %7, align 2
  %24 = getelementptr i8, ptr %7, i64 6
  %25 = load i16, ptr %24, align 2
  store i16 %25, ptr %7, align 2
  %26 = getelementptr i8, ptr %7, i64 8
  %27 = load i16, ptr %26, align 2
  %28 = getelementptr i8, ptr %7, i64 2
  %29 = load i16, ptr %28, align 2
  store i16 %29, ptr %26, align 2
  store i16 %27, ptr %28, align 2
  %30 = getelementptr i8, ptr %7, i64 10
  %31 = load i16, ptr %30, align 2
  %32 = getelementptr i8, ptr %7, i64 4
  %33 = load i16, ptr %32, align 2
  store i16 %33, ptr %30, align 2
  store i16 %23, ptr %24, align 2
  store i16 %31, ptr %32, align 2
  br label %bb_inst_45

bb_inst_45:                                       ; preds = %bb_inst_32, %bb_inst_6, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_6 ], [ 3, %bb_inst_32 ]
  ret i64 %r0.0
}

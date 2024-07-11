; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.llvm_ir/xdp-maps.bpf.ll'
source_filename = "bpf-jit"

declare i64 @__lddw_helper_map_by_fd(i32) local_unnamed_addr

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0002(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin41 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin41, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = getelementptr i8, ptr %0, i64 8
  %4 = load i64, ptr %3, align 4
  %5 = load i64, ptr %0, align 4
  %6 = sub i64 %4, %5
  %7 = trunc i64 %6 to i32
  %8 = getelementptr inbounds i8, ptr %stackEnd, i64 -4
  store i32 %7, ptr %8, align 4
  %9 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i32 0, ptr %9, align 8
  %10 = add i64 %2, -4
  %11 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %12 = call i64 @_bpf_helper_ext_0001(i64 %11, i64 %10, i64 undef, i64 0, i64 undef)
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %bb_inst_16, label %bb_inst_13

bb_inst_13:                                       ; preds = %setupBlock
  %14 = inttoptr i64 %12 to ptr
  %15 = load i32, ptr %14, align 4
  %16 = add i32 %15, 1
  store i32 %16, ptr %9, align 8
  br label %bb_inst_16

bb_inst_16:                                       ; preds = %bb_inst_13, %setupBlock
  %17 = add i64 %2, -8
  %18 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %19 = call i64 @_bpf_helper_ext_0002(i64 %18, i64 %10, i64 %17, i64 0, i64 undef)
  %20 = add i64 %5, 14
  %21 = icmp ugt i64 %20, %4
  br i1 %21, label %bb_inst_41, label %bb_inst_28

bb_inst_28:                                       ; preds = %bb_inst_16
  %22 = inttoptr i64 %5 to ptr
  %23 = load i16, ptr %22, align 2
  %24 = getelementptr i8, ptr %22, i64 6
  %25 = load i16, ptr %24, align 2
  store i16 %25, ptr %22, align 2
  %26 = getelementptr i8, ptr %22, i64 8
  %27 = load i16, ptr %26, align 2
  %28 = getelementptr i8, ptr %22, i64 2
  %29 = load i16, ptr %28, align 2
  store i16 %29, ptr %26, align 2
  store i16 %27, ptr %28, align 2
  %30 = getelementptr i8, ptr %22, i64 10
  %31 = load i16, ptr %30, align 2
  %32 = getelementptr i8, ptr %22, i64 4
  %33 = load i16, ptr %32, align 2
  store i16 %33, ptr %30, align 2
  store i16 %23, ptr %24, align 2
  store i16 %31, ptr %32, align 2
  br label %bb_inst_41

bb_inst_41:                                       ; preds = %bb_inst_28, %bb_inst_16
  %r0.0 = phi i64 [ 1, %bb_inst_16 ], [ 3, %bb_inst_28 ]
  ret i64 %r0.0
}

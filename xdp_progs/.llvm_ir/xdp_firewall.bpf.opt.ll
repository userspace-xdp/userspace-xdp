; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.llvm_ir/xdp_firewall.bpf.ll'
source_filename = "bpf-jit"

declare i64 @__lddw_helper_map_by_fd(i32) local_unnamed_addr

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin143 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin143, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = getelementptr i8, ptr %0, i64 8
  %4 = load i64, ptr %3, align 4
  %5 = load i64, ptr %0, align 4
  %6 = add i64 %5, 14
  %7 = icmp ugt i64 %6, %4
  br i1 %7, label %bb_inst_120, label %bb_inst_6

bb_inst_6:                                        ; preds = %setupBlock
  %8 = inttoptr i64 %5 to ptr
  %9 = getelementptr i8, ptr %8, i64 12
  %10 = load i16, ptr %9, align 2
  switch i16 %10, label %bb_inst_15 [
    i16 129, label %bb_inst_10
    i16 -22392, label %bb_inst_10
  ]

bb_inst_10:                                       ; preds = %bb_inst_6, %bb_inst_6
  %11 = add i64 %5, 18
  %12 = icmp ugt i64 %11, %4
  br i1 %12, label %bb_inst_120, label %bb_inst_13

bb_inst_13:                                       ; preds = %bb_inst_10
  %13 = getelementptr i8, ptr %8, i64 16
  %14 = load i16, ptr %13, align 2
  br label %bb_inst_15

bb_inst_15:                                       ; preds = %bb_inst_6, %bb_inst_13
  %r3.0.in = phi i16 [ %14, %bb_inst_13 ], [ %10, %bb_inst_6 ]
  %r1.0 = phi i64 [ 18, %bb_inst_13 ], [ 14, %bb_inst_6 ]
  switch i16 %r3.0.in, label %bb_inst_28 [
    i16 -22392, label %bb_inst_19
    i16 129, label %bb_inst_19
  ]

bb_inst_19:                                       ; preds = %bb_inst_15, %bb_inst_15
  %15 = add nuw nsw i64 %r1.0, 4
  %16 = add i64 %15, %5
  %17 = icmp ugt i64 %16, %4
  br i1 %17, label %bb_inst_120, label %bb_inst_24

bb_inst_24:                                       ; preds = %bb_inst_19
  %18 = add i64 %r1.0, %5
  %19 = inttoptr i64 %18 to ptr
  %20 = getelementptr i8, ptr %19, i64 2
  %21 = load i16, ptr %20, align 2
  br label %bb_inst_28

bb_inst_28:                                       ; preds = %bb_inst_15, %bb_inst_24
  %r3.1.in = phi i16 [ %r3.0.in, %bb_inst_15 ], [ %21, %bb_inst_24 ]
  %r1.1 = phi i64 [ %r1.0, %bb_inst_15 ], [ %15, %bb_inst_24 ]
  %22 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i64 2048, ptr %22, align 8
  switch i16 %r3.1.in, label %bb_inst_107 [
    i16 -8826, label %bb_inst_51
    i16 8, label %bb_inst_33
  ]

bb_inst_33:                                       ; preds = %bb_inst_28
  %23 = add i64 %r1.1, %5
  %24 = add i64 %23, 20
  %25 = icmp ugt i64 %24, %4
  br i1 %25, label %bb_inst_107, label %bb_inst_38

bb_inst_38:                                       ; preds = %bb_inst_33
  %26 = inttoptr i64 %23 to ptr
  %27 = getelementptr i8, ptr %26, i64 2
  %28 = load i16, ptr %27, align 2
  %29 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i64 0, ptr %29, align 8
  %30 = getelementptr inbounds i8, ptr %stackEnd, i64 -20
  store i32 0, ptr %30, align 4
  %31 = getelementptr i8, ptr %26, i64 16
  %32 = load i32, ptr %31, align 4
  %33 = getelementptr inbounds i8, ptr %stackEnd, i64 -24
  store i32 %32, ptr %33, align 8
  %34 = getelementptr i8, ptr %26, i64 9
  %35 = load i8, ptr %34, align 1
  %36 = zext i8 %35 to i64
  switch i8 %35, label %bb_inst_78 [
    i8 112, label %bb_inst_46
    i8 51, label %bb_inst_68
  ]

bb_inst_46:                                       ; preds = %bb_inst_38
  %37 = add i64 %23, 28
  %38 = icmp ugt i64 %37, %4
  br i1 %38, label %bb_inst_120, label %bb_inst_78

bb_inst_51:                                       ; preds = %bb_inst_28
  %39 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  store i64 2925136675237744, ptr %39, align 8
  %40 = getelementptr inbounds i8, ptr %stackEnd, i64 -40
  store i64 8103509687735492660, ptr %40, align 8
  %41 = getelementptr inbounds i8, ptr %stackEnd, i64 -48
  store i64 8534436882064109167, ptr %41, align 8
  %42 = add i64 %2, -48
  %43 = call i64 @_bpf_helper_ext_0006(i64 %42, i64 24, i64 34525, i64 2048, i64 undef)
  br label %bb_inst_120

bb_inst_68:                                       ; preds = %bb_inst_38
  %44 = add i64 %23, 32
  %45 = icmp ugt i64 %44, %4
  br i1 %45, label %bb_inst_107, label %bb_inst_71

bb_inst_71:                                       ; preds = %bb_inst_68
  %46 = inttoptr i64 %24 to ptr
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i64
  %.not147 = icmp eq i8 %47, 112
  br i1 %.not147, label %bb_inst_73, label %bb_inst_78

bb_inst_73:                                       ; preds = %bb_inst_71
  %49 = add i64 %23, 40
  %50 = icmp ugt i64 %49, %4
  br i1 %50, label %bb_inst_120, label %bb_inst_78

bb_inst_78:                                       ; preds = %bb_inst_38, %bb_inst_46, %bb_inst_73, %bb_inst_71
  %r3.2 = phi i64 [ %48, %bb_inst_71 ], [ 112, %bb_inst_73 ], [ %24, %bb_inst_46 ], [ %24, %bb_inst_38 ]
  %r4.0 = phi i64 [ %44, %bb_inst_71 ], [ %44, %bb_inst_73 ], [ %23, %bb_inst_46 ], [ %36, %bb_inst_38 ]
  %r8.0 = phi i64 [ 0, %bb_inst_71 ], [ %44, %bb_inst_73 ], [ %24, %bb_inst_46 ], [ 0, %bb_inst_38 ]
  %51 = add i64 %2, -24
  %52 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %53 = call i64 @_bpf_helper_ext_0001(i64 %52, i64 %51, i64 %r3.2, i64 %r4.0, i64 %36)
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %bb_inst_89, label %bb_inst_84

bb_inst_84:                                       ; preds = %bb_inst_78
  %55 = inttoptr i64 %53 to ptr
  %56 = load i64, ptr %55, align 4
  %57 = add i64 %56, 1
  store i64 %57, ptr %55, align 4
  br label %bb_inst_120

bb_inst_89:                                       ; preds = %bb_inst_78
  %58 = icmp eq i64 %r8.0, 0
  br i1 %58, label %bb_inst_107, label %bb_inst_90

bb_inst_90:                                       ; preds = %bb_inst_89
  %59 = inttoptr i64 %r8.0 to ptr
  %60 = getelementptr i8, ptr %59, i64 1
  %61 = load i8, ptr %60, align 1
  %62 = zext i8 %61 to i32
  %63 = getelementptr inbounds i8, ptr %stackEnd, i64 -48
  store i32 %62, ptr %63, align 8
  %64 = add i64 %2, -48
  %65 = call i64 @__lddw_helper_map_by_fd(i32 5)
  %66 = call i64 @_bpf_helper_ext_0001(i64 %65, i64 %64, i64 %r3.2, i64 %r4.0, i64 %36)
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %bb_inst_107, label %bb_inst_98

bb_inst_98:                                       ; preds = %bb_inst_90
  %rev = call i16 @llvm.bswap.i16(i16 %28)
  %68 = zext i16 %rev to i64
  %69 = inttoptr i64 %66 to ptr
  %70 = getelementptr i8, ptr %69, i64 16
  %71 = load i64, ptr %70, align 4
  %72 = add i64 %71, 1
  store i64 %72, ptr %70, align 4
  %73 = getelementptr i8, ptr %69, i64 32
  %74 = load i64, ptr %73, align 4
  %75 = add i64 %74, %68
  store i64 %75, ptr %73, align 4
  %76 = load i32, ptr %69, align 4
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %bb_inst_121, label %bb_inst_107

bb_inst_107:                                      ; preds = %bb_inst_28, %bb_inst_98, %bb_inst_90, %bb_inst_89, %bb_inst_68, %bb_inst_33
  %78 = load i16, ptr %8, align 2
  %79 = getelementptr i8, ptr %8, i64 6
  %80 = load i16, ptr %79, align 2
  store i16 %80, ptr %8, align 2
  %81 = getelementptr i8, ptr %8, i64 8
  %82 = load i16, ptr %81, align 2
  %83 = getelementptr i8, ptr %8, i64 2
  %84 = load i16, ptr %83, align 2
  store i16 %84, ptr %81, align 2
  store i16 %82, ptr %83, align 2
  %85 = getelementptr i8, ptr %8, i64 10
  %86 = load i16, ptr %85, align 2
  %87 = getelementptr i8, ptr %8, i64 4
  %88 = load i16, ptr %87, align 2
  store i16 %88, ptr %85, align 2
  store i16 %78, ptr %79, align 2
  store i16 %86, ptr %87, align 2
  br label %bb_inst_120

bb_inst_120:                                      ; preds = %bb_inst_46, %bb_inst_51, %bb_inst_73, %bb_inst_121, %bb_inst_107, %bb_inst_84, %bb_inst_19, %bb_inst_10, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_10 ], [ 3, %bb_inst_107 ], [ 1, %bb_inst_121 ], [ 1, %bb_inst_84 ], [ 2, %bb_inst_19 ], [ 1, %bb_inst_73 ], [ 1, %bb_inst_51 ], [ 1, %bb_inst_46 ]
  ret i64 %r0.0

bb_inst_121:                                      ; preds = %bb_inst_98
  %89 = getelementptr i8, ptr %69, i64 8
  %90 = load i64, ptr %89, align 4
  %91 = add i64 %90, 1
  store i64 %91, ptr %89, align 4
  %92 = getelementptr i8, ptr %69, i64 24
  %93 = load i64, ptr %92, align 4
  %94 = add i64 %93, %68
  store i64 %94, ptr %92, align 4
  br label %bb_inst_120
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

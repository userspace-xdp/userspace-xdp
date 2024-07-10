; ModuleID = '.llvm_ir/xdp_firewall.bpf.ll'
source_filename = "bpf-jit"

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin135 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin135, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = getelementptr i8, ptr %0, i64 8
  %4 = load i64, ptr %3, align 4
  %5 = load i64, ptr %0, align 4
  %6 = add i64 %5, 14
  %7 = icmp ugt i64 %6, %4
  br i1 %7, label %bb_inst_111, label %bb_inst_6

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
  br i1 %12, label %bb_inst_111, label %bb_inst_13

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
  br i1 %17, label %bb_inst_111, label %bb_inst_24

bb_inst_24:                                       ; preds = %bb_inst_19
  %18 = add i64 %r1.0, %5
  %19 = inttoptr i64 %18 to ptr
  %20 = getelementptr i8, ptr %19, i64 2
  %21 = load i16, ptr %20, align 2
  br label %bb_inst_28

bb_inst_28:                                       ; preds = %bb_inst_15, %bb_inst_24
  %r3.1.in = phi i16 [ %r3.0.in, %bb_inst_15 ], [ %21, %bb_inst_24 ]
  %r1.1 = phi i64 [ %r1.0, %bb_inst_15 ], [ %15, %bb_inst_24 ]
  %22 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i64 2048, ptr %22, align 8
  switch i16 %r3.1.in, label %bb_inst_98 [
    i16 -8826, label %bb_inst_51
    i16 8, label %bb_inst_33
  ]

bb_inst_33:                                       ; preds = %bb_inst_28
  %23 = add i64 %r1.1, %5
  %24 = add i64 %23, 20
  %25 = icmp ugt i64 %24, %4
  br i1 %25, label %bb_inst_98, label %bb_inst_38

bb_inst_38:                                       ; preds = %bb_inst_33
  %26 = inttoptr i64 %23 to ptr
  %27 = getelementptr i8, ptr %26, i64 2
  %28 = load i16, ptr %27, align 2
  %29 = getelementptr inbounds i8, ptr %stackEnd, i64 -24
  store i64 0, ptr %29, align 8
  %30 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  store i32 0, ptr %30, align 4
  %31 = getelementptr i8, ptr %26, i64 16
  %32 = load i32, ptr %31, align 4
  %33 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  store i32 %32, ptr %33, align 8
  %34 = getelementptr i8, ptr %26, i64 9
  %35 = load i8, ptr %34, align 1
  %36 = zext i8 %35 to i64
  switch i8 %35, label %bb_inst_69 [
    i8 112, label %bb_inst_46
    i8 51, label %bb_inst_59
  ]

bb_inst_46:                                       ; preds = %bb_inst_38
  %37 = add i64 %23, 28
  %38 = icmp ugt i64 %37, %4
  br i1 %38, label %bb_inst_111, label %bb_inst_69

bb_inst_51:                                       ; preds = %bb_inst_28
  %39 = call i64 @_bpf_helper_ext_0006(i64 0, i64 24, i64 34525, i64 2048, i64 undef)
  br label %bb_inst_111

bb_inst_59:                                       ; preds = %bb_inst_38
  %40 = add i64 %23, 32
  %41 = icmp ugt i64 %40, %4
  br i1 %41, label %bb_inst_98, label %bb_inst_62

bb_inst_62:                                       ; preds = %bb_inst_59
  %42 = inttoptr i64 %24 to ptr
  %43 = load i8, ptr %42, align 1
  %44 = zext i8 %43 to i64
  %.not139 = icmp eq i8 %43, 112
  br i1 %.not139, label %bb_inst_64, label %bb_inst_69

bb_inst_64:                                       ; preds = %bb_inst_62
  %45 = add i64 %23, 40
  %46 = icmp ugt i64 %45, %4
  br i1 %46, label %bb_inst_111, label %bb_inst_69

bb_inst_69:                                       ; preds = %bb_inst_38, %bb_inst_46, %bb_inst_64, %bb_inst_62
  %r3.2 = phi i64 [ %44, %bb_inst_62 ], [ 112, %bb_inst_64 ], [ %24, %bb_inst_46 ], [ %24, %bb_inst_38 ]
  %r4.0 = phi i64 [ %40, %bb_inst_62 ], [ %40, %bb_inst_64 ], [ %23, %bb_inst_46 ], [ %36, %bb_inst_38 ]
  %r8.0 = phi i64 [ 0, %bb_inst_62 ], [ %40, %bb_inst_64 ], [ %24, %bb_inst_46 ], [ 0, %bb_inst_38 ]
  %47 = add i64 %2, -32
  %48 = call i64 @_bpf_helper_ext_0001(i64 17179869184, i64 %47, i64 %r3.2, i64 %r4.0, i64 %36)
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %bb_inst_80, label %bb_inst_75

bb_inst_75:                                       ; preds = %bb_inst_69
  %50 = inttoptr i64 %48 to ptr
  %51 = load i64, ptr %50, align 4
  %52 = add i64 %51, 1
  store i64 %52, ptr %50, align 4
  br label %bb_inst_111

bb_inst_80:                                       ; preds = %bb_inst_69
  %53 = icmp eq i64 %r8.0, 0
  br i1 %53, label %bb_inst_98, label %bb_inst_81

bb_inst_81:                                       ; preds = %bb_inst_80
  %54 = inttoptr i64 %r8.0 to ptr
  %55 = getelementptr i8, ptr %54, i64 1
  %56 = load i8, ptr %55, align 1
  %57 = zext i8 %56 to i32
  %58 = getelementptr inbounds i8, ptr %stackEnd, i64 -4
  store i32 %57, ptr %58, align 4
  %59 = add i64 %2, -4
  %60 = call i64 @_bpf_helper_ext_0001(i64 21474836480, i64 %59, i64 %r3.2, i64 %r4.0, i64 %36)
  %61 = icmp eq i64 %60, 0
  br i1 %61, label %bb_inst_98, label %bb_inst_89

bb_inst_89:                                       ; preds = %bb_inst_81
  %rev = call i16 @llvm.bswap.i16(i16 %28)
  %62 = zext i16 %rev to i64
  %63 = inttoptr i64 %60 to ptr
  %64 = getelementptr i8, ptr %63, i64 16
  %65 = load i64, ptr %64, align 4
  %66 = add i64 %65, 1
  store i64 %66, ptr %64, align 4
  %67 = getelementptr i8, ptr %63, i64 32
  %68 = load i64, ptr %67, align 4
  %69 = add i64 %68, %62
  store i64 %69, ptr %67, align 4
  %70 = load i32, ptr %63, align 4
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %bb_inst_112, label %bb_inst_98

bb_inst_98:                                       ; preds = %bb_inst_28, %bb_inst_89, %bb_inst_81, %bb_inst_80, %bb_inst_59, %bb_inst_33
  %72 = load i16, ptr %8, align 2
  %73 = getelementptr i8, ptr %8, i64 6
  %74 = load i16, ptr %73, align 2
  store i16 %74, ptr %8, align 2
  %75 = getelementptr i8, ptr %8, i64 8
  %76 = load i16, ptr %75, align 2
  %77 = getelementptr i8, ptr %8, i64 2
  %78 = load i16, ptr %77, align 2
  store i16 %78, ptr %75, align 2
  store i16 %76, ptr %77, align 2
  %79 = getelementptr i8, ptr %8, i64 10
  %80 = load i16, ptr %79, align 2
  %81 = getelementptr i8, ptr %8, i64 4
  %82 = load i16, ptr %81, align 2
  store i16 %82, ptr %79, align 2
  store i16 %72, ptr %73, align 2
  store i16 %80, ptr %81, align 2
  br label %bb_inst_111

bb_inst_111:                                      ; preds = %bb_inst_46, %bb_inst_51, %bb_inst_64, %bb_inst_112, %bb_inst_98, %bb_inst_75, %bb_inst_19, %bb_inst_10, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_10 ], [ 3, %bb_inst_98 ], [ 1, %bb_inst_112 ], [ 1, %bb_inst_75 ], [ 2, %bb_inst_19 ], [ 1, %bb_inst_64 ], [ 1, %bb_inst_51 ], [ 1, %bb_inst_46 ]
  ret i64 %r0.0

bb_inst_112:                                      ; preds = %bb_inst_89
  %83 = getelementptr i8, ptr %63, i64 8
  %84 = load i64, ptr %83, align 4
  %85 = add i64 %84, 1
  store i64 %85, ptr %83, align 4
  %86 = getelementptr i8, ptr %63, i64 24
  %87 = load i64, ptr %86, align 4
  %88 = add i64 %87, %62
  store i64 %88, ptr %86, align 4
  br label %bb_inst_111
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

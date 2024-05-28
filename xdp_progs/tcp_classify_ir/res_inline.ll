; ModuleID = 'tcp_classify_ir/res.ll'
source_filename = "bpf-jit"

declare i64 @_bpf_helper_ext_0130(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0182(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0189(i64, i64, i64, i64, i64) local_unnamed_addr

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3


%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.event = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

define dso_local i64 @bpf_strncmp(i8* nocapture noundef readonly %0, i32 noundef %1, i8* nocapture noundef readonly %2) local_unnamed_addr alwaysinline {
  switch i32 %1, label %38 [
    i32 4, label %4
    i32 0, label %56
  ]

4:                                                ; preds = %3
  %5 = bitcast i8* %0 to i32*
  %6 = load i32, i32* %5, align 4
  %7 = bitcast i8* %2 to i32*
  %8 = load i32, i32* %7, align 4
  %9 = icmp eq i32 %6, %8
  %10 = trunc i32 %6 to i8
  %11 = trunc i32 %8 to i8
  %12 = lshr i32 %6, 8
  %13 = trunc i32 %12 to i8
  %14 = lshr i32 %8, 8
  %15 = trunc i32 %14 to i8
  %16 = lshr i32 %6, 16
  %17 = trunc i32 %16 to i8
  %18 = lshr i32 %8, 16
  %19 = trunc i32 %18 to i8
  %20 = lshr i32 %6, 24
  %21 = trunc i32 %20 to i8
  %22 = lshr i32 %8, 24
  %23 = trunc i32 %22 to i8
  br i1 %9, label %56, label %24

24:                                               ; preds = %4
  %25 = icmp eq i8 %10, %11
  br i1 %25, label %26, label %32

26:                                               ; preds = %24
  %27 = icmp eq i8 %13, %15
  br i1 %27, label %28, label %32

28:                                               ; preds = %26
  %29 = icmp eq i8 %17, %19
  br i1 %29, label %30, label %32

30:                                               ; preds = %28
  %31 = icmp eq i8 %21, %23
  br i1 %31, label %56, label %32

32:                                               ; preds = %30, %28, %26, %24
  %33 = phi i8 [ %10, %24 ], [ %13, %26 ], [ %17, %28 ], [ %21, %30 ]
  %34 = phi i8 [ %11, %24 ], [ %15, %26 ], [ %19, %28 ], [ %23, %30 ]
  %35 = zext i8 %33 to i64
  %36 = zext i8 %34 to i64
  %37 = sub nsw i64 %35, %36
  br label %56

38:                                               ; preds = %3, %50
  %39 = phi i32 [ %42, %50 ], [ %1, %3 ]
  %40 = phi i8* [ %52, %50 ], [ %0, %3 ]
  %41 = phi i8* [ %53, %50 ], [ %2, %3 ]
  %42 = add i32 %39, -1
  %43 = load i8, i8* %40, align 1
  %44 = load i8, i8* %41, align 1
  %45 = icmp eq i8 %43, %44
  br i1 %45, label %50, label %46

46:                                               ; preds = %38
  %47 = zext i8 %43 to i64
  %48 = zext i8 %44 to i64
  %49 = sub nsw i64 %47, %48
  br label %56

50:                                               ; preds = %38
  %51 = icmp eq i8 %43, 0
  %52 = getelementptr inbounds i8, i8* %40, i64 1
  %53 = getelementptr inbounds i8, i8* %41, i64 1
  %54 = icmp eq i32 %42, 0
  %55 = select i1 %51, i1 true, i1 %54
  br i1 %55, label %56, label %38

56:                                               ; preds = %50, %3, %30, %4, %32, %46
  %57 = phi i64 [ %49, %46 ], [ %37, %32 ], [ 0, %4 ], [ 0, %30 ], [ 0, %3 ], [ 0, %50 ]
  ret i64 %57
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

define dso_local i64 @bpf_xdp_load_bytes(%struct.xdp_md* nocapture noundef readonly %0, i32 noundef %1, i8* nocapture noundef writeonly %2, i32 noundef %3) local_unnamed_addr alwaysinline {
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %6 = load i64, i64* %5, align 8
  %7 = zext i32 %1 to i64
  %8 = add i64 %6, %7
  %9 = inttoptr i64 %8 to i8*
  %10 = zext i32 %3 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %9, i64 %10, i1 false)
  ret i64 0
}


define i64 @bpf_main(ptr %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin114 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin114, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = ptrtoint ptr %0 to i64
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load i64, ptr %4, align 4
  %6 = load i64, ptr %0, align 4
  %7 = add i64 %6, 14
  %8 = icmp ugt i64 %7, %5
  br i1 %8, label %bb_inst_101, label %bb_inst_7

bb_inst_7:                                        ; preds = %setupBlock
  %9 = inttoptr i64 %6 to ptr
  %10 = getelementptr i8, ptr %9, i64 12
  %11 = load i16, ptr %10, align 2
  %.not = icmp eq i16 %11, 8
  br i1 %.not, label %bb_inst_9, label %bb_inst_101

bb_inst_9:                                        ; preds = %bb_inst_7
  %12 = add i64 %6, 34
  %13 = icmp ugt i64 %12, %5
  br i1 %13, label %bb_inst_101, label %bb_inst_12

bb_inst_12:                                       ; preds = %bb_inst_9
  %14 = inttoptr i64 %7 to ptr
  %15 = getelementptr i8, ptr %14, i64 9
  %16 = load i8, ptr %15, align 1
  %.not115 = icmp ne i8 %16, 6
  %17 = add i64 %6, 54
  %18 = icmp ugt i64 %17, %5
  %or.cond = select i1 %.not115, i1 true, i1 %18
  br i1 %or.cond, label %bb_inst_101, label %bb_inst_17

bb_inst_17:                                       ; preds = %bb_inst_12
  %19 = getelementptr i8, ptr %14, i64 12
  %20 = load i32, ptr %19, align 4
  %21 = getelementptr inbounds i8, ptr %stackEnd, i64 -296
  store i32 %20, ptr %21, align 8
  %22 = getelementptr i8, ptr %14, i64 16
  %23 = load i32, ptr %22, align 4
  %24 = getelementptr inbounds i8, ptr %stackEnd, i64 -292
  store i32 %23, ptr %24, align 4
  %25 = inttoptr i64 %12 to ptr
  %26 = load i16, ptr %25, align 2
  %rev = call i16 @llvm.bswap.i16(i16 %26)
  %27 = zext i16 %rev to i32
  %28 = getelementptr inbounds i8, ptr %stackEnd, i64 -304
  store i32 %27, ptr %28, align 8
  %29 = getelementptr i8, ptr %25, i64 2
  %30 = load i16, ptr %29, align 2
  %rev116 = call i16 @llvm.bswap.i16(i16 %30)
  %31 = zext i16 %rev116 to i32
  %32 = getelementptr inbounds i8, ptr %stackEnd, i64 -300
  store i32 %31, ptr %32, align 4
  %33 = getelementptr i8, ptr %25, i64 12
  %34 = load i16, ptr %33, align 2
  %35 = lshr i16 %34, 9
  %36 = and i16 %35, 1
  %37 = zext i16 %36 to i32
  %38 = getelementptr inbounds i8, ptr %stackEnd, i64 -288
  store i32 %37, ptr %38, align 8
  %39 = load i16, ptr %33, align 2
  %40 = lshr i16 %39, 8
  %41 = and i16 %40, 1
  %42 = zext i16 %41 to i32
  %43 = getelementptr inbounds i8, ptr %stackEnd, i64 -284
  store i32 %42, ptr %43, align 4
  %44 = load i16, ptr %33, align 2
  %45 = lshr i16 %44, 10
  %46 = and i16 %45, 1
  %47 = zext i16 %46 to i32
  %48 = getelementptr inbounds i8, ptr %stackEnd, i64 -280
  store i32 %47, ptr %48, align 8
  %49 = load i16, ptr %33, align 2
  %50 = lshr i16 %49, 11
  %51 = and i16 %50, 1
  %52 = zext i16 %51 to i32
  %53 = getelementptr inbounds i8, ptr %stackEnd, i64 -276
  store i32 %52, ptr %53, align 4
  %54 = sub i64 %5, %6
  %55 = load i16, ptr %33, align 2
  %56 = trunc i64 %54 to i32
  %57 = getelementptr inbounds i8, ptr %stackEnd, i64 -264
  store i32 %56, ptr %57, align 8
  %58 = lshr i16 %55, 12
  %59 = and i16 %58, 1
  %60 = zext i16 %59 to i32
  %61 = getelementptr inbounds i8, ptr %stackEnd, i64 -272
  store i32 %60, ptr %61, align 8
  %62 = load i16, ptr %33, align 2
  %63 = lshr i16 %62, 2
  %64 = and i16 %63, 60
  %65 = zext i16 %64 to i64
  %66 = add i64 %6, 38
  %67 = add i64 %66, %65
  %.not117 = icmp ult i64 %67, %5
  br i1 %.not117, label %bb_inst_56, label %bb_inst_72

bb_inst_56:                                       ; preds = %bb_inst_17
  %68 = add i64 %2, -260
  %69 = call i64 @bpf_xdp_load_bytes(i64 %3, i64 0, i64 %68, i64 4, i64 undef)
  %70 = call i64 @bpf_strncmp(i64 %68, i64 4, i64 0, i64 4, i64 undef)
  %71 = icmp eq i64 %70, 0
  %72 = zext i1 %71 to i32
  %73 = getelementptr inbounds i8, ptr %stackEnd, i64 -268
  store i32 %72, ptr %73, align 4
  br label %bb_inst_72

bb_inst_72:                                       ; preds = %bb_inst_56, %bb_inst_17
  %74 = add i64 %6, 60
  %.not118 = icmp ult i64 %74, %5
  br i1 %.not118, label %bb_inst_75, label %bb_inst_81

bb_inst_75:                                       ; preds = %bb_inst_72
  %75 = add i64 %2, -260
  %76 = call i64 @bpf_xdp_load_bytes(i64 %3, i64 0, i64 %75, i64 60, i64 undef)
  br label %bb_inst_81

bb_inst_81:                                       ; preds = %bb_inst_75, %bb_inst_72
  %77 = add i64 %2, -304
  %78 = call i64 @_bpf_helper_ext_0130(i64 0, i64 %77, i64 300, i64 0, i64 undef)
  %79 = load i16, ptr %9, align 2
  %80 = getelementptr i8, ptr %9, i64 6
  %81 = load i16, ptr %80, align 2
  store i16 %81, ptr %9, align 2
  %82 = getelementptr i8, ptr %9, i64 2
  %83 = load i16, ptr %82, align 2
  %84 = getelementptr i8, ptr %9, i64 8
  %85 = load i16, ptr %84, align 2
  store i16 %85, ptr %82, align 2
  %86 = getelementptr i8, ptr %9, i64 4
  %87 = load i16, ptr %86, align 2
  %88 = getelementptr i8, ptr %9, i64 10
  %89 = load i16, ptr %88, align 2
  store i16 %89, ptr %86, align 2
  store i16 %79, ptr %80, align 2
  store i16 %83, ptr %84, align 2
  store i16 %87, ptr %88, align 2
  br label %bb_inst_101

bb_inst_101:                                      ; preds = %bb_inst_81, %bb_inst_12, %bb_inst_9, %bb_inst_7, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_7 ], [ 2, %bb_inst_9 ], [ 2, %bb_inst_12 ], [ 3, %bb_inst_81 ]
  ret i64 %r0.0
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

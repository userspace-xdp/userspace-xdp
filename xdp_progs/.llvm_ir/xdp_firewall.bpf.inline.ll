; ModuleID = '.llvm_ir/xdp_firewall.bpf.ll'
source_filename = "bpf-jit"

%struct.vrrp_filter = type { i32, i64, i64, i64, i64 }
%struct.bpftime_hash_map_t = type { i32, i32, i32, i8* }

@__vrrp_vrid_filter = dso_local global [256 x %struct.vrrp_filter] zeroinitializer, align 16

@__l3_filter_data = dso_local global [6656 x i8] zeroinitializer, align 16
@__l3_filter = dso_local local_unnamed_addr global %struct.bpftime_hash_map_t { i32 128, i32 16, i32 32, i8* getelementptr inbounds ([6656 x i8], [6656 x i8]* @__l3_filter_data, i32 0, i32 0) }, align 8

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
  %48 = call i64 @bpf_helper_ext_0001_hash(i64 17179869184, i64 %47, i64 %r3.2, i64 %r4.0, i64 %36)
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
  %60 = call i64 @bpf_helper_ext_0001_array(i64 21474836480, i64 %59, i64 %r3.2, i64 %r4.0, i64 %36)
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

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i64 @bpf_helper_ext_0001_hash(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = inttoptr i64 %1 to i8*
  %4 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 1), align 4, !tbaa !5
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %94, label %6

6:                                                ; preds = %2
  %7 = zext i32 %4 to i64
  %8 = add nsw i64 %7, -1
  %9 = and i64 %7, 3
  %10 = icmp ult i64 %8, 3
  br i1 %10, label %43, label %11

11:                                               ; preds = %6
  %12 = and i64 %7, 4294967292
  br label %13

13:                                               ; preds = %13, %11
  %14 = phi i64 [ 0, %11 ], [ %40, %13 ]
  %15 = phi i32 [ 0, %11 ], [ %39, %13 ]
  %16 = phi i64 [ 0, %11 ], [ %41, %13 ]
  %17 = mul i32 %15, 31
  %18 = getelementptr inbounds i8, i8* %3, i64 %14
  %19 = load i8, i8* %18, align 1, !tbaa !11
  %20 = zext i8 %19 to i32
  %21 = add i32 %17, %20
  %22 = or i64 %14, 1
  %23 = mul i32 %21, 31
  %24 = getelementptr inbounds i8, i8* %3, i64 %22
  %25 = load i8, i8* %24, align 1, !tbaa !11
  %26 = zext i8 %25 to i32
  %27 = add i32 %23, %26
  %28 = or i64 %14, 2
  %29 = mul i32 %27, 31
  %30 = getelementptr inbounds i8, i8* %3, i64 %28
  %31 = load i8, i8* %30, align 1, !tbaa !11
  %32 = zext i8 %31 to i32
  %33 = add i32 %29, %32
  %34 = or i64 %14, 3
  %35 = mul i32 %33, 31
  %36 = getelementptr inbounds i8, i8* %3, i64 %34
  %37 = load i8, i8* %36, align 1, !tbaa !11
  %38 = zext i8 %37 to i32
  %39 = add i32 %35, %38
  %40 = add nuw nsw i64 %14, 4
  %41 = add i64 %16, 4
  %42 = icmp eq i64 %41, %12
  br i1 %42, label %43, label %13, !llvm.loop !12

43:                                               ; preds = %13, %6
  %44 = phi i32 [ undef, %6 ], [ %39, %13 ]
  %45 = phi i64 [ 0, %6 ], [ %40, %13 ]
  %46 = phi i32 [ 0, %6 ], [ %39, %13 ]
  %47 = icmp eq i64 %9, 0
  br i1 %47, label %60, label %48

48:                                               ; preds = %43, %48
  %49 = phi i64 [ %57, %48 ], [ %45, %43 ]
  %50 = phi i32 [ %56, %48 ], [ %46, %43 ]
  %51 = phi i64 [ %58, %48 ], [ 0, %43 ]
  %52 = mul i32 %50, 31
  %53 = getelementptr inbounds i8, i8* %3, i64 %49
  %54 = load i8, i8* %53, align 1, !tbaa !11
  %55 = zext i8 %54 to i32
  %56 = add i32 %52, %55
  %57 = add nuw nsw i64 %49, 1
  %58 = add i64 %51, 1
  %59 = icmp eq i64 %58, %9
  br i1 %59, label %60, label %48, !llvm.loop !14

60:                                               ; preds = %48, %43
  %61 = phi i32 [ %44, %43 ], [ %56, %48 ]
  %62 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 0), align 8, !tbaa !16
  %63 = urem i32 %61, %62
  %64 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3), align 8, !tbaa !17
  %65 = add i32 %4, 4
  %66 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 2), align 8, !tbaa !18
  %67 = add i32 %66, %65
  br label %68

68:                                               ; preds = %90, %60
  %69 = phi i32 [ %92, %90 ], [ %63, %60 ]
  %70 = mul i32 %69, %67
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8* %64, i64 %71
  %73 = bitcast i8* %72 to i32*
  %74 = load i32, i32* %73, align 4, !tbaa !19
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %107, label %76

76:                                               ; preds = %68
  %77 = add i32 %70, 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8* %64, i64 %78
  br label %82

80:                                               ; preds = %82
  %81 = icmp eq i64 %89, %7
  br i1 %81, label %99, label %82, !llvm.loop !20

82:                                               ; preds = %80, %76
  %83 = phi i64 [ 0, %76 ], [ %89, %80 ]
  %84 = getelementptr inbounds i8, i8* %79, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !11
  %86 = getelementptr inbounds i8, i8* %3, i64 %83
  %87 = load i8, i8* %86, align 1, !tbaa !11
  %88 = icmp eq i8 %85, %87
  %89 = add nuw nsw i64 %83, 1
  br i1 %88, label %80, label %90

90:                                               ; preds = %82
  %91 = add i32 %69, 1
  %92 = urem i32 %91, %62
  %93 = icmp eq i32 %92, %63
  br i1 %93, label %107, label %68, !llvm.loop !21

94:                                               ; preds = %2
  %95 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3), align 8, !tbaa !17
  %96 = bitcast i8* %95 to i32*
  %97 = load i32, i32* %96, align 4, !tbaa !19
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %107, label %102

99:                                               ; preds = %80
  %100 = add i32 %70, %65
  %101 = zext i32 %100 to i64
  br label %102

102:                                              ; preds = %99, %94
  %103 = phi i8* [ %95, %94 ], [ %64, %99 ]
  %104 = phi i64 [ 4, %94 ], [ %101, %99 ]
  %105 = getelementptr inbounds i8, i8* %103, i64 %104
  %106 = ptrtoint i8* %105 to i64
  br label %107

107:                                              ; preds = %68, %90, %94, %102
  %108 = phi i64 [ %106, %102 ], [ 0, %94 ], [ 0, %90 ], [ 0, %68 ]
  ret i64 %108
}

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i64 @bpf_helper_ext_0001_array(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %arrayidx1 = getelementptr inbounds [512 x i64], ptr @__vrrp_vrid_filter, i64 0
  %3 = ptrtoint ptr %arrayidx1 to i64
  ret i64 0
}


; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i64 @bpf_helper_ext_0002_hash(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) local_unnamed_addr #1 {
  %5 = inttoptr i64 %1 to i8*
  %6 = inttoptr i64 %2 to i8*
  %7 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 1), align 4, !tbaa !5
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %99, label %9

9:                                                ; preds = %4
  %10 = zext i32 %7 to i64
  %11 = add nsw i64 %10, -1
  %12 = and i64 %10, 3
  %13 = icmp ult i64 %11, 3
  br i1 %13, label %46, label %14

14:                                               ; preds = %9
  %15 = and i64 %10, 4294967292
  br label %16

16:                                               ; preds = %16, %14
  %17 = phi i64 [ 0, %14 ], [ %43, %16 ]
  %18 = phi i32 [ 0, %14 ], [ %42, %16 ]
  %19 = phi i64 [ 0, %14 ], [ %44, %16 ]
  %20 = mul i32 %18, 31
  %21 = getelementptr inbounds i8, i8* %5, i64 %17
  %22 = load i8, i8* %21, align 1, !tbaa !11
  %23 = zext i8 %22 to i32
  %24 = add i32 %20, %23
  %25 = or i64 %17, 1
  %26 = mul i32 %24, 31
  %27 = getelementptr inbounds i8, i8* %5, i64 %25
  %28 = load i8, i8* %27, align 1, !tbaa !11
  %29 = zext i8 %28 to i32
  %30 = add i32 %26, %29
  %31 = or i64 %17, 2
  %32 = mul i32 %30, 31
  %33 = getelementptr inbounds i8, i8* %5, i64 %31
  %34 = load i8, i8* %33, align 1, !tbaa !11
  %35 = zext i8 %34 to i32
  %36 = add i32 %32, %35
  %37 = or i64 %17, 3
  %38 = mul i32 %36, 31
  %39 = getelementptr inbounds i8, i8* %5, i64 %37
  %40 = load i8, i8* %39, align 1, !tbaa !11
  %41 = zext i8 %40 to i32
  %42 = add i32 %38, %41
  %43 = add nuw nsw i64 %17, 4
  %44 = add i64 %19, 4
  %45 = icmp eq i64 %44, %15
  br i1 %45, label %46, label %16, !llvm.loop !12

46:                                               ; preds = %16, %9
  %47 = phi i32 [ undef, %9 ], [ %42, %16 ]
  %48 = phi i64 [ 0, %9 ], [ %43, %16 ]
  %49 = phi i32 [ 0, %9 ], [ %42, %16 ]
  %50 = icmp eq i64 %12, 0
  br i1 %50, label %63, label %51

51:                                               ; preds = %46, %51
  %52 = phi i64 [ %60, %51 ], [ %48, %46 ]
  %53 = phi i32 [ %59, %51 ], [ %49, %46 ]
  %54 = phi i64 [ %61, %51 ], [ 0, %46 ]
  %55 = mul i32 %53, 31
  %56 = getelementptr inbounds i8, i8* %5, i64 %52
  %57 = load i8, i8* %56, align 1, !tbaa !11
  %58 = zext i8 %57 to i32
  %59 = add i32 %55, %58
  %60 = add nuw nsw i64 %52, 1
  %61 = add i64 %54, 1
  %62 = icmp eq i64 %61, %12
  br i1 %62, label %63, label %51, !llvm.loop !22

63:                                               ; preds = %51, %46
  %64 = phi i32 [ %47, %46 ], [ %59, %51 ]
  %65 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 0), align 8
  %66 = urem i32 %64, %65
  %67 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3), align 8, !tbaa !17
  %68 = add i32 %7, 4
  %69 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 2), align 8, !tbaa !18
  %70 = add i32 %68, %69
  br label %71

71:                                               ; preds = %93, %63
  %72 = phi i32 [ %95, %93 ], [ %66, %63 ]
  %73 = mul i32 %72, %70
  %74 = add i32 %73, 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %67, i64 %75
  %77 = zext i32 %73 to i64
  %78 = getelementptr inbounds i8, i8* %67, i64 %77
  %79 = bitcast i8* %78 to i32*
  %80 = load i32, i32* %79, align 4, !tbaa !19
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %84, label %85

82:                                               ; preds = %85
  %83 = icmp eq i64 %92, %10
  br i1 %83, label %84, label %85, !llvm.loop !23

84:                                               ; preds = %71, %82
  br label %110

85:                                               ; preds = %71, %82
  %86 = phi i64 [ %92, %82 ], [ 0, %71 ]
  %87 = getelementptr inbounds i8, i8* %76, i64 %86
  %88 = load i8, i8* %87, align 1, !tbaa !11
  %89 = getelementptr inbounds i8, i8* %5, i64 %86
  %90 = load i8, i8* %89, align 1, !tbaa !11
  %91 = icmp eq i8 %88, %90
  %92 = add nuw nsw i64 %86, 1
  br i1 %91, label %82, label %93

93:                                               ; preds = %85
  %94 = add i32 %72, 1
  %95 = urem i32 %94, %65
  %96 = icmp eq i32 %95, %66
  br i1 %96, label %140, label %71, !llvm.loop !24

97:                                               ; preds = %110
  %98 = add i32 %116, 4
  br label %99

99:                                               ; preds = %97, %4
  %100 = phi i32 [ 0, %4 ], [ %72, %97 ]
  %101 = phi i32 [ 4, %4 ], [ %98, %97 ]
  %102 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3), align 8, !tbaa !17
  %103 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 2), align 8, !tbaa !18
  %104 = add i32 %103, %101
  %105 = mul i32 %104, %100
  %106 = add i32 %105, %101
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8* %102, i64 %107
  %109 = icmp eq i32 %103, 0
  br i1 %109, label %133, label %119

110:                                              ; preds = %84, %110
  %111 = phi i64 [ %115, %110 ], [ 0, %84 ]
  %112 = getelementptr inbounds i8, i8* %5, i64 %111
  %113 = load i8, i8* %112, align 1, !tbaa !11
  %114 = getelementptr inbounds i8, i8* %76, i64 %111
  store i8 %113, i8* %114, align 1, !tbaa !11
  %115 = add nuw nsw i64 %111, 1
  %116 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 1), align 4, !tbaa !5
  %117 = zext i32 %116 to i64
  %118 = icmp ult i64 %115, %117
  br i1 %118, label %110, label %97, !llvm.loop !25

119:                                              ; preds = %99, %119
  %120 = phi i64 [ %124, %119 ], [ 0, %99 ]
  %121 = getelementptr inbounds i8, i8* %6, i64 %120
  %122 = load i8, i8* %121, align 1, !tbaa !11
  %123 = getelementptr inbounds i8, i8* %108, i64 %120
  store i8 %122, i8* %123, align 1, !tbaa !11
  %124 = add nuw nsw i64 %120, 1
  %125 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 2), align 8, !tbaa !18
  %126 = zext i32 %125 to i64
  %127 = icmp ult i64 %124, %126
  br i1 %127, label %119, label %128, !llvm.loop !26

128:                                              ; preds = %119
  %129 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3), align 8, !tbaa !17
  %130 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 1), align 4, !tbaa !5
  %131 = add i32 %125, 4
  %132 = add i32 %131, %130
  br label %133

133:                                              ; preds = %128, %99
  %134 = phi i32 [ %132, %128 ], [ %101, %99 ]
  %135 = phi i8* [ %129, %128 ], [ %102, %99 ]
  %136 = mul i32 %134, %100
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds i8, i8* %135, i64 %137
  %139 = bitcast i8* %138 to i32*
  store i32 1, i32* %139, align 4, !tbaa !19
  br label %140

140:                                              ; preds = %93, %133
  %141 = phi i64 [ 1, %133 ], [ 0, %93 ]
  ret i64 %141
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i64 @bpf_helper_ext_0003_hash(i64 noundef %0, i64 noundef %1) local_unnamed_addr #1 {
  %3 = inttoptr i64 %1 to i8*
  %4 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 1), align 4, !tbaa !5
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %94, label %6

6:                                                ; preds = %2
  %7 = zext i32 %4 to i64
  %8 = add nsw i64 %7, -1
  %9 = and i64 %7, 3
  %10 = icmp ult i64 %8, 3
  br i1 %10, label %43, label %11

11:                                               ; preds = %6
  %12 = and i64 %7, 4294967292
  br label %13

13:                                               ; preds = %13, %11
  %14 = phi i64 [ 0, %11 ], [ %40, %13 ]
  %15 = phi i32 [ 0, %11 ], [ %39, %13 ]
  %16 = phi i64 [ 0, %11 ], [ %41, %13 ]
  %17 = mul i32 %15, 31
  %18 = getelementptr inbounds i8, i8* %3, i64 %14
  %19 = load i8, i8* %18, align 1, !tbaa !11
  %20 = zext i8 %19 to i32
  %21 = add i32 %17, %20
  %22 = or i64 %14, 1
  %23 = mul i32 %21, 31
  %24 = getelementptr inbounds i8, i8* %3, i64 %22
  %25 = load i8, i8* %24, align 1, !tbaa !11
  %26 = zext i8 %25 to i32
  %27 = add i32 %23, %26
  %28 = or i64 %14, 2
  %29 = mul i32 %27, 31
  %30 = getelementptr inbounds i8, i8* %3, i64 %28
  %31 = load i8, i8* %30, align 1, !tbaa !11
  %32 = zext i8 %31 to i32
  %33 = add i32 %29, %32
  %34 = or i64 %14, 3
  %35 = mul i32 %33, 31
  %36 = getelementptr inbounds i8, i8* %3, i64 %34
  %37 = load i8, i8* %36, align 1, !tbaa !11
  %38 = zext i8 %37 to i32
  %39 = add i32 %35, %38
  %40 = add nuw nsw i64 %14, 4
  %41 = add i64 %16, 4
  %42 = icmp eq i64 %41, %12
  br i1 %42, label %43, label %13, !llvm.loop !12

43:                                               ; preds = %13, %6
  %44 = phi i32 [ undef, %6 ], [ %39, %13 ]
  %45 = phi i64 [ 0, %6 ], [ %40, %13 ]
  %46 = phi i32 [ 0, %6 ], [ %39, %13 ]
  %47 = icmp eq i64 %9, 0
  br i1 %47, label %60, label %48

48:                                               ; preds = %43, %48
  %49 = phi i64 [ %57, %48 ], [ %45, %43 ]
  %50 = phi i32 [ %56, %48 ], [ %46, %43 ]
  %51 = phi i64 [ %58, %48 ], [ 0, %43 ]
  %52 = mul i32 %50, 31
  %53 = getelementptr inbounds i8, i8* %3, i64 %49
  %54 = load i8, i8* %53, align 1, !tbaa !11
  %55 = zext i8 %54 to i32
  %56 = add i32 %52, %55
  %57 = add nuw nsw i64 %49, 1
  %58 = add i64 %51, 1
  %59 = icmp eq i64 %58, %9
  br i1 %59, label %60, label %48, !llvm.loop !27

60:                                               ; preds = %48, %43
  %61 = phi i32 [ %44, %43 ], [ %56, %48 ]
  %62 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 0), align 8
  %63 = urem i32 %61, %62
  %64 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3), align 8, !tbaa !17
  %65 = add i32 %4, 4
  %66 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 2), align 8, !tbaa !18
  %67 = add i32 %65, %66
  br label %68

68:                                               ; preds = %90, %60
  %69 = phi i32 [ %92, %90 ], [ %63, %60 ]
  %70 = mul i32 %69, %67
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8* %64, i64 %71
  %73 = bitcast i8* %72 to i32*
  %74 = load i32, i32* %73, align 4, !tbaa !19
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %102, label %76

76:                                               ; preds = %68
  %77 = add i32 %70, 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8, i8* %64, i64 %78
  br label %82

80:                                               ; preds = %82
  %81 = icmp eq i64 %89, %7
  br i1 %81, label %98, label %82, !llvm.loop !28

82:                                               ; preds = %80, %76
  %83 = phi i64 [ 0, %76 ], [ %89, %80 ]
  %84 = getelementptr inbounds i8, i8* %79, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !11
  %86 = getelementptr inbounds i8, i8* %3, i64 %83
  %87 = load i8, i8* %86, align 1, !tbaa !11
  %88 = icmp eq i8 %85, %87
  %89 = add nuw nsw i64 %83, 1
  br i1 %88, label %80, label %90

90:                                               ; preds = %82
  %91 = add i32 %69, 1
  %92 = urem i32 %91, %62
  %93 = icmp eq i32 %92, %63
  br i1 %93, label %102, label %68, !llvm.loop !29

94:                                               ; preds = %2
  %95 = load i32*, i32** bitcast (i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3) to i32**), align 8, !tbaa !17
  %96 = load i32, i32* %95, align 4, !tbaa !19
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %102, label %100

98:                                               ; preds = %80
  %99 = bitcast i8* %72 to i32*
  br label %100

100:                                              ; preds = %98, %94
  %101 = phi i32* [ %95, %94 ], [ %99, %98 ]
  store i32 0, i32* %101, align 4, !tbaa !19
  br label %102

102:                                              ; preds = %68, %90, %94, %100
  %103 = phi i64 [ 1, %100 ], [ 0, %94 ], [ 0, %90 ], [ 0, %68 ]
  ret i64 %103
}

attributes #0 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !7, i64 4}
!6 = !{!"", !7, i64 0, !7, i64 4, !7, i64 8, !10, i64 16}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"any pointer", !8, i64 0}
!11 = !{!8, !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = !{!6, !7, i64 0}
!17 = !{!6, !10, i64 16}
!18 = !{!6, !7, i64 8}
!19 = !{!7, !7, i64 0}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13}
!22 = distinct !{!22, !15}
!23 = distinct !{!23, !13}
!24 = distinct !{!24, !13}
!25 = distinct !{!25, !13}
!26 = distinct !{!26, !13}
!27 = distinct !{!27, !15}
!28 = distinct !{!28, !13}
!29 = distinct !{!29, !13}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

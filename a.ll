; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.bpftime_hash_map_t = type { i32, i32, i32, ptr }

@__packet_size_distribute_data = dso_local global [6656 x i8] zeroinitializer, align 16
@__packet_size_distribute = dso_local local_unnamed_addr global %struct.bpftime_hash_map_t { i32 128, i32 16, i32 32, ptr @__packet_size_distribute_data }, align 8

; Function Attrs: nofree norecurse nosync nounwind memory(read) uwtable
define dso_local i64 @bpf_helper_ext_0001(i64 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = inttoptr i64 %1 to ptr
  %4 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 1), align 4, !tbaa !5
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
  %18 = getelementptr inbounds i8, ptr %3, i64 %14
  %19 = load i8, ptr %18, align 1, !tbaa !11
  %20 = zext i8 %19 to i32
  %21 = add i32 %17, %20
  %22 = or i64 %14, 1
  %23 = mul i32 %21, 31
  %24 = getelementptr inbounds i8, ptr %3, i64 %22
  %25 = load i8, ptr %24, align 1, !tbaa !11
  %26 = zext i8 %25 to i32
  %27 = add i32 %23, %26
  %28 = or i64 %14, 2
  %29 = mul i32 %27, 31
  %30 = getelementptr inbounds i8, ptr %3, i64 %28
  %31 = load i8, ptr %30, align 1, !tbaa !11
  %32 = zext i8 %31 to i32
  %33 = add i32 %29, %32
  %34 = or i64 %14, 3
  %35 = mul i32 %33, 31
  %36 = getelementptr inbounds i8, ptr %3, i64 %34
  %37 = load i8, ptr %36, align 1, !tbaa !11
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

48:                                               ; preds = %48, %43
  %49 = phi i64 [ %57, %48 ], [ %45, %43 ]
  %50 = phi i32 [ %56, %48 ], [ %46, %43 ]
  %51 = phi i64 [ %58, %48 ], [ 0, %43 ]
  %52 = mul i32 %50, 31
  %53 = getelementptr inbounds i8, ptr %3, i64 %49
  %54 = load i8, ptr %53, align 1, !tbaa !11
  %55 = zext i8 %54 to i32
  %56 = add i32 %52, %55
  %57 = add nuw nsw i64 %49, 1
  %58 = add i64 %51, 1
  %59 = icmp eq i64 %58, %9
  br i1 %59, label %60, label %48, !llvm.loop !14

60:                                               ; preds = %48, %43
  %61 = phi i32 [ %44, %43 ], [ %56, %48 ]
  %62 = load i32, ptr @__packet_size_distribute, align 8, !tbaa !16
  %63 = urem i32 %61, %62
  %64 = load ptr, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !17
  %65 = add i32 %4, 4
  %66 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !18
  %67 = add i32 %66, %65
  br label %68

68:                                               ; preds = %90, %60
  %69 = phi i32 [ %92, %90 ], [ %63, %60 ]
  %70 = mul i32 %69, %67
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr %64, i64 %71
  %73 = bitcast ptr %72 to ptr
  %74 = load i32, ptr %73, align 4, !tbaa !19
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %107, label %76

76:                                               ; preds = %68
  %77 = add i32 %70, 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8, ptr %64, i64 %78
  br label %82

80:                                               ; preds = %82
  %81 = icmp eq i64 %89, %7
  br i1 %81, label %99, label %82, !llvm.loop !20

82:                                               ; preds = %80, %76
  %83 = phi i64 [ 0, %76 ], [ %89, %80 ]
  %84 = getelementptr inbounds i8, ptr %79, i64 %83
  %85 = load i8, ptr %84, align 1, !tbaa !11
  %86 = getelementptr inbounds i8, ptr %3, i64 %83
  %87 = load i8, ptr %86, align 1, !tbaa !11
  %88 = icmp eq i8 %85, %87
  %89 = add nuw nsw i64 %83, 1
  br i1 %88, label %80, label %90

90:                                               ; preds = %82
  %91 = add i32 %69, 1
  %92 = urem i32 %91, %62
  %93 = icmp eq i32 %92, %63
  br i1 %93, label %107, label %68, !llvm.loop !21

94:                                               ; preds = %2
  %95 = load ptr, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !17
  %96 = bitcast ptr %95 to ptr
  %97 = load i32, ptr %96, align 4, !tbaa !19
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %107, label %102

99:                                               ; preds = %80
  %100 = add i32 %70, %65
  %101 = zext i32 %100 to i64
  br label %102

102:                                              ; preds = %99, %94
  %103 = phi ptr [ %95, %94 ], [ %64, %99 ]
  %104 = phi i64 [ 4, %94 ], [ %101, %99 ]
  %105 = getelementptr inbounds i8, ptr %103, i64 %104
  %106 = ptrtoint ptr %105 to i64
  br label %107

107:                                              ; preds = %102, %94, %90, %68
  %108 = phi i64 [ %106, %102 ], [ 0, %94 ], [ 0, %90 ], [ 0, %68 ]
  ret i64 %108
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i64 @bpf_helper_ext_0002(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) local_unnamed_addr #1 {
  %5 = inttoptr i64 %1 to ptr
  %6 = inttoptr i64 %2 to ptr
  %7 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 1), align 4, !tbaa !5
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
  %21 = getelementptr inbounds i8, ptr %5, i64 %17
  %22 = load i8, ptr %21, align 1, !tbaa !11
  %23 = zext i8 %22 to i32
  %24 = add i32 %20, %23
  %25 = or i64 %17, 1
  %26 = mul i32 %24, 31
  %27 = getelementptr inbounds i8, ptr %5, i64 %25
  %28 = load i8, ptr %27, align 1, !tbaa !11
  %29 = zext i8 %28 to i32
  %30 = add i32 %26, %29
  %31 = or i64 %17, 2
  %32 = mul i32 %30, 31
  %33 = getelementptr inbounds i8, ptr %5, i64 %31
  %34 = load i8, ptr %33, align 1, !tbaa !11
  %35 = zext i8 %34 to i32
  %36 = add i32 %32, %35
  %37 = or i64 %17, 3
  %38 = mul i32 %36, 31
  %39 = getelementptr inbounds i8, ptr %5, i64 %37
  %40 = load i8, ptr %39, align 1, !tbaa !11
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

51:                                               ; preds = %51, %46
  %52 = phi i64 [ %60, %51 ], [ %48, %46 ]
  %53 = phi i32 [ %59, %51 ], [ %49, %46 ]
  %54 = phi i64 [ %61, %51 ], [ 0, %46 ]
  %55 = mul i32 %53, 31
  %56 = getelementptr inbounds i8, ptr %5, i64 %52
  %57 = load i8, ptr %56, align 1, !tbaa !11
  %58 = zext i8 %57 to i32
  %59 = add i32 %55, %58
  %60 = add nuw nsw i64 %52, 1
  %61 = add i64 %54, 1
  %62 = icmp eq i64 %61, %12
  br i1 %62, label %63, label %51, !llvm.loop !22

63:                                               ; preds = %51, %46
  %64 = phi i32 [ %47, %46 ], [ %59, %51 ]
  %65 = load i32, ptr @__packet_size_distribute, align 8
  %66 = urem i32 %64, %65
  %67 = load ptr, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !17
  %68 = add i32 %7, 4
  %69 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !18
  %70 = add i32 %68, %69
  br label %71

71:                                               ; preds = %93, %63
  %72 = phi i32 [ %95, %93 ], [ %66, %63 ]
  %73 = mul i32 %72, %70
  %74 = add i32 %73, 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr %67, i64 %75
  %77 = zext i32 %73 to i64
  %78 = getelementptr inbounds i8, ptr %67, i64 %77
  %79 = bitcast ptr %78 to ptr
  %80 = load i32, ptr %79, align 4, !tbaa !19
  %81 = icmp eq i32 %80, 0
  br i1 %81, label %84, label %85

82:                                               ; preds = %85
  %83 = icmp eq i64 %92, %10
  br i1 %83, label %84, label %85, !llvm.loop !23

84:                                               ; preds = %82, %71
  br label %110

85:                                               ; preds = %82, %71
  %86 = phi i64 [ %92, %82 ], [ 0, %71 ]
  %87 = getelementptr inbounds i8, ptr %76, i64 %86
  %88 = load i8, ptr %87, align 1, !tbaa !11
  %89 = getelementptr inbounds i8, ptr %5, i64 %86
  %90 = load i8, ptr %89, align 1, !tbaa !11
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
  %102 = load ptr, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !17
  %103 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !18
  %104 = add i32 %103, %101
  %105 = mul i32 %104, %100
  %106 = add i32 %105, %101
  %107 = zext i32 %106 to i64
  %108 = getelementptr inbounds i8, ptr %102, i64 %107
  %109 = icmp eq i32 %103, 0
  br i1 %109, label %133, label %119

110:                                              ; preds = %110, %84
  %111 = phi i64 [ %115, %110 ], [ 0, %84 ]
  %112 = getelementptr inbounds i8, ptr %5, i64 %111
  %113 = load i8, ptr %112, align 1, !tbaa !11
  %114 = getelementptr inbounds i8, ptr %76, i64 %111
  store i8 %113, ptr %114, align 1, !tbaa !11
  %115 = add nuw nsw i64 %111, 1
  %116 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 1), align 4, !tbaa !5
  %117 = zext i32 %116 to i64
  %118 = icmp ult i64 %115, %117
  br i1 %118, label %110, label %97, !llvm.loop !25

119:                                              ; preds = %119, %99
  %120 = phi i64 [ %124, %119 ], [ 0, %99 ]
  %121 = getelementptr inbounds i8, ptr %6, i64 %120
  %122 = load i8, ptr %121, align 1, !tbaa !11
  %123 = getelementptr inbounds i8, ptr %108, i64 %120
  store i8 %122, ptr %123, align 1, !tbaa !11
  %124 = add nuw nsw i64 %120, 1
  %125 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !18
  %126 = zext i32 %125 to i64
  %127 = icmp ult i64 %124, %126
  br i1 %127, label %119, label %128, !llvm.loop !26

128:                                              ; preds = %119
  %129 = load ptr, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !17
  %130 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 1), align 4, !tbaa !5
  %131 = add i32 %125, 4
  %132 = add i32 %131, %130
  br label %133

133:                                              ; preds = %128, %99
  %134 = phi i32 [ %132, %128 ], [ %101, %99 ]
  %135 = phi ptr [ %129, %128 ], [ %102, %99 ]
  %136 = mul i32 %134, %100
  %137 = zext i32 %136 to i64
  %138 = getelementptr inbounds i8, ptr %135, i64 %137
  %139 = bitcast ptr %138 to ptr
  store i32 1, ptr %139, align 4, !tbaa !19
  br label %140

140:                                              ; preds = %133, %93
  %141 = phi i64 [ 1, %133 ], [ 0, %93 ]
  ret i64 %141
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i64 @bpf_helper_ext_0003(i64 noundef %0, i64 noundef %1) local_unnamed_addr #1 {
  %3 = inttoptr i64 %1 to ptr
  %4 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 1), align 4, !tbaa !5
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
  %18 = getelementptr inbounds i8, ptr %3, i64 %14
  %19 = load i8, ptr %18, align 1, !tbaa !11
  %20 = zext i8 %19 to i32
  %21 = add i32 %17, %20
  %22 = or i64 %14, 1
  %23 = mul i32 %21, 31
  %24 = getelementptr inbounds i8, ptr %3, i64 %22
  %25 = load i8, ptr %24, align 1, !tbaa !11
  %26 = zext i8 %25 to i32
  %27 = add i32 %23, %26
  %28 = or i64 %14, 2
  %29 = mul i32 %27, 31
  %30 = getelementptr inbounds i8, ptr %3, i64 %28
  %31 = load i8, ptr %30, align 1, !tbaa !11
  %32 = zext i8 %31 to i32
  %33 = add i32 %29, %32
  %34 = or i64 %14, 3
  %35 = mul i32 %33, 31
  %36 = getelementptr inbounds i8, ptr %3, i64 %34
  %37 = load i8, ptr %36, align 1, !tbaa !11
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

48:                                               ; preds = %48, %43
  %49 = phi i64 [ %57, %48 ], [ %45, %43 ]
  %50 = phi i32 [ %56, %48 ], [ %46, %43 ]
  %51 = phi i64 [ %58, %48 ], [ 0, %43 ]
  %52 = mul i32 %50, 31
  %53 = getelementptr inbounds i8, ptr %3, i64 %49
  %54 = load i8, ptr %53, align 1, !tbaa !11
  %55 = zext i8 %54 to i32
  %56 = add i32 %52, %55
  %57 = add nuw nsw i64 %49, 1
  %58 = add i64 %51, 1
  %59 = icmp eq i64 %58, %9
  br i1 %59, label %60, label %48, !llvm.loop !27

60:                                               ; preds = %48, %43
  %61 = phi i32 [ %44, %43 ], [ %56, %48 ]
  %62 = load i32, ptr @__packet_size_distribute, align 8
  %63 = urem i32 %61, %62
  %64 = load ptr, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !17
  %65 = add i32 %4, 4
  %66 = load i32, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !18
  %67 = add i32 %65, %66
  br label %68

68:                                               ; preds = %90, %60
  %69 = phi i32 [ %92, %90 ], [ %63, %60 ]
  %70 = mul i32 %69, %67
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr %64, i64 %71
  %73 = bitcast ptr %72 to ptr
  %74 = load i32, ptr %73, align 4, !tbaa !19
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %102, label %76

76:                                               ; preds = %68
  %77 = add i32 %70, 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds i8, ptr %64, i64 %78
  br label %82

80:                                               ; preds = %82
  %81 = icmp eq i64 %89, %7
  br i1 %81, label %98, label %82, !llvm.loop !28

82:                                               ; preds = %80, %76
  %83 = phi i64 [ 0, %76 ], [ %89, %80 ]
  %84 = getelementptr inbounds i8, ptr %79, i64 %83
  %85 = load i8, ptr %84, align 1, !tbaa !11
  %86 = getelementptr inbounds i8, ptr %3, i64 %83
  %87 = load i8, ptr %86, align 1, !tbaa !11
  %88 = icmp eq i8 %85, %87
  %89 = add nuw nsw i64 %83, 1
  br i1 %88, label %80, label %90

90:                                               ; preds = %82
  %91 = add i32 %69, 1
  %92 = urem i32 %91, %62
  %93 = icmp eq i32 %92, %63
  br i1 %93, label %102, label %68, !llvm.loop !29

94:                                               ; preds = %2
  %95 = load ptr, ptr getelementptr inbounds (%struct.bpftime_hash_map_t, ptr @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !17
  %96 = load i32, ptr %95, align 4, !tbaa !19
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %102, label %100

98:                                               ; preds = %80
  %99 = bitcast ptr %72 to ptr
  br label %100

100:                                              ; preds = %98, %94
  %101 = phi ptr [ %95, %94 ], [ %99, %98 ]
  store i32 0, ptr %101, align 4, !tbaa !19
  br label %102

102:                                              ; preds = %100, %94, %90, %68
  %103 = phi i64 [ 1, %100 ], [ 0, %94 ], [ 0, %90 ], [ 0, %68 ]
  ret i64 %103
}

define i64 @bpf_main(ptr %0, i64 %1) {
setupBlock:
  %r0 = alloca i64, align 8
  %r1 = alloca i64, align 8
  %r2 = alloca i64, align 8
  %r3 = alloca i64, align 8
  %r4 = alloca i64, align 8
  %r5 = alloca i64, align 8
  %r6 = alloca i64, align 8
  %r7 = alloca i64, align 8
  %r8 = alloca i64, align 8
  %r9 = alloca i64, align 8
  %r10 = alloca i64, align 8
  %stackBegin = alloca i64, i32 2058, align 8
  %stackEnd = getelementptr i64, ptr %stackBegin, i32 2048
  store ptr %stackEnd, ptr %r10, align 8
  store ptr %0, ptr %r1, align 8
  store i64 %1, ptr %r2, align 4
  %callStack = alloca ptr, i32 320, align 8
  %callItemCnt = alloca i64, align 8
  store i64 0, ptr %callItemCnt, align 4
  br label %bb_inst_0

bb_inst_0:                                        ; preds = %setupBlock
  %2 = load ptr, ptr %r1, align 8
  %3 = getelementptr i8, ptr %2, i64 8
  %4 = load i64, ptr %3, align 4
  store i64 %4, ptr %r6, align 4
  %5 = load ptr, ptr %r1, align 8
  %6 = getelementptr i8, ptr %5, i64 0
  %7 = load i64, ptr %6, align 4
  store i64 %7, ptr %r8, align 4
  %8 = load i64, ptr %r8, align 4
  store i64 %8, ptr %r9, align 4
  %9 = load i64, ptr %r9, align 4
  %10 = add i64 %9, 14
  store i64 %10, ptr %r9, align 4
  %11 = load i64, ptr %r9, align 4
  %12 = load i64, ptr %r6, align 4
  %13 = icmp uge i64 %12, %11
  br i1 %13, label %bb_inst_19, label %bb_inst_5

bb_inst_5:                                        ; preds = %bb_inst_0
  store i64 10, ptr %r1, align 4
  %14 = load i64, ptr %r1, align 4
  %15 = trunc i64 %14 to i16
  %16 = load ptr, ptr %r10, align 8
  %17 = getelementptr i8, ptr %16, i64 -12
  store i16 %15, ptr %17, align 2
  store i64 1919182952, ptr %r1, align 4
  %18 = load i64, ptr %r1, align 4
  %19 = trunc i64 %18 to i32
  %20 = load ptr, ptr %r10, align 8
  %21 = getelementptr i8, ptr %20, i64 -16
  store i32 %19, ptr %21, align 4
  store i64 8387145561025705327, ptr %r1, align 4
  br label %bb_inst_11

bb_inst_11:                                       ; preds = %bb_inst_45, %bb_inst_5
  %22 = load i64, ptr %r1, align 4
  %23 = load ptr, ptr %r10, align 8
  %24 = getelementptr i8, ptr %23, i64 -24
  store i64 %22, ptr %24, align 4
  store i64 7070764042443584847, ptr %r1, align 4
  %25 = load i64, ptr %r1, align 4
  %26 = load ptr, ptr %r10, align 8
  %27 = getelementptr i8, ptr %26, i64 -32
  store i64 %25, ptr %27, align 4
  %28 = load i64, ptr %r10, align 4
  store i64 %28, ptr %r1, align 4
  %29 = load i64, ptr %r1, align 4
  %30 = add i64 %29, -32
  store i64 %30, ptr %r1, align 4
  store i64 22, ptr %r2, align 4
  br label %bb_inst_35

bb_inst_19:                                       ; preds = %bb_inst_0
  %31 = load i64, ptr %r8, align 4
  store i64 %31, ptr %r2, align 4
  %32 = load i64, ptr %r2, align 4
  %33 = add i64 %32, 34
  store i64 %33, ptr %r2, align 4
  %34 = load i64, ptr %r2, align 4
  %35 = load i64, ptr %r6, align 4
  %36 = icmp uge i64 %35, %34
  br i1 %36, label %bb_inst_39, label %bb_inst_22

bb_inst_22:                                       ; preds = %bb_inst_19
  store i64 0, ptr %r1, align 4
  %37 = load i64, ptr %r1, align 4
  %38 = trunc i64 %37 to i8
  %39 = load ptr, ptr %r10, align 8
  %40 = getelementptr i8, ptr %39, i64 -12
  store i8 %38, ptr %40, align 1
  store i64 175268968, ptr %r1, align 4
  %41 = load i64, ptr %r1, align 4
  %42 = trunc i64 %41 to i32
  %43 = load ptr, ptr %r10, align 8
  %44 = getelementptr i8, ptr %43, i64 -16
  store i32 %42, ptr %44, align 4
  store i64 8100041084780836207, ptr %r1, align 4
  %45 = load i64, ptr %r1, align 4
  %46 = load ptr, ptr %r10, align 8
  %47 = getelementptr i8, ptr %46, i64 -24
  store i64 %45, ptr %47, align 4
  store i64 7070764042443584847, ptr %r1, align 4
  %48 = load i64, ptr %r1, align 4
  %49 = load ptr, ptr %r10, align 8
  %50 = getelementptr i8, ptr %49, i64 -32
  store i64 %48, ptr %50, align 4
  %51 = load i64, ptr %r10, align 4
  store i64 %51, ptr %r1, align 4
  %52 = load i64, ptr %r1, align 4
  %53 = add i64 %52, -32
  store i64 %53, ptr %r1, align 4
  store i64 21, ptr %r2, align 4
  br label %bb_inst_35

bb_inst_35:                                       ; preds = %bb_inst_22, %bb_inst_11
  %54 = load i64, ptr %r1, align 4
  %55 = load i64, ptr %r2, align 4
  %56 = load i64, ptr %r3, align 4
  %57 = load i64, ptr %r4, align 4
  %58 = load i64, ptr %r5, align 4
  %59 = call i64 @_bpf_helper_ext_0006(i64 %54, i64 %55, i64 %56, i64 %57, i64 %58)
  store i64 %59, ptr %r0, align 4
  br label %bb_inst_36

bb_inst_36:                                       ; preds = %bb_inst_35
  store i64 1, ptr %r7, align 4
  br label %bb_inst_37

bb_inst_37:                                       ; preds = %bb_inst_568, %bb_inst_338, %bb_inst_328, %bb_inst_319, %bb_inst_309, %bb_inst_82, %bb_inst_77, %bb_inst_76, %bb_inst_39, %bb_inst_36
  %60 = load i64, ptr %r7, align 4
  store i64 %60, ptr %r0, align 4
  %61 = load i64, ptr %callItemCnt, align 4
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %exitBlock, label %localFuncReturnBlock

bb_inst_39:                                       ; preds = %bb_inst_19
  store i64 2, ptr %r7, align 4
  %63 = load ptr, ptr %r9, align 8
  %64 = getelementptr i8, ptr %63, i64 9
  %65 = load i8, ptr %64, align 1
  %66 = zext i8 %65 to i64
  store i64 %66, ptr %r1, align 4
  %67 = load i64, ptr %r1, align 4
  %68 = icmp ne i64 %67, 6
  br i1 %68, label %bb_inst_37, label %bb_inst_42

bb_inst_42:                                       ; preds = %bb_inst_39
  %69 = load i64, ptr %r8, align 4
  store i64 %69, ptr %r1, align 4
  %70 = load i64, ptr %r1, align 4
  %71 = add i64 %70, 54
  store i64 %71, ptr %r1, align 4
  %72 = load i64, ptr %r1, align 4
  %73 = load i64, ptr %r6, align 4
  %74 = icmp uge i64 %73, %72
  br i1 %74, label %bb_inst_52, label %bb_inst_45

bb_inst_45:                                       ; preds = %bb_inst_42
  store i64 10, ptr %r1, align 4
  %75 = load i64, ptr %r1, align 4
  %76 = trunc i64 %75 to i16
  %77 = load ptr, ptr %r10, align 8
  %78 = getelementptr i8, ptr %77, i64 -12
  store i16 %76, ptr %78, align 2
  store i64 1919182960, ptr %r1, align 4
  %79 = load i64, ptr %r1, align 4
  %80 = trunc i64 %79 to i32
  %81 = load ptr, ptr %r10, align 8
  %82 = getelementptr i8, ptr %81, i64 -16
  store i32 %80, ptr %82, align 4
  store i64 7166388587031590255, ptr %r1, align 4
  br label %bb_inst_11

bb_inst_52:                                       ; preds = %bb_inst_42
  %83 = load i64, ptr %r2, align 4
  %84 = load ptr, ptr %r10, align 8
  %85 = getelementptr i8, ptr %84, i64 -48
  store i64 %83, ptr %85, align 4
  store i64 1, ptr %r1, align 4
  %86 = load i64, ptr %r1, align 4
  %87 = trunc i64 %86 to i32
  %88 = load ptr, ptr %r10, align 8
  %89 = getelementptr i8, ptr %88, i64 -4
  store i32 %87, ptr %89, align 4
  %90 = load i64, ptr %r10, align 4
  store i64 %90, ptr %r2, align 4
  %91 = load i64, ptr %r2, align 4
  %92 = add i64 %91, -4
  store i64 %92, ptr %r2, align 4
  %93 = call i64 @__lddw_helper_map_by_fd(i32 4)
  store i64 %93, ptr %r1, align 4
  %94 = load i64, ptr %r1, align 4
  %95 = load i64, ptr %r2, align 4
  %96 = load i64, ptr %r3, align 4
  %97 = load i64, ptr %r4, align 4
  %98 = load i64, ptr %r5, align 4
  %99 = call i64 @_bpf_helper_ext_0001(i64 %94, i64 %95, i64 %96, i64 %97, i64 %98)
  store i64 %99, ptr %r0, align 4
  br label %bb_inst_60

bb_inst_60:                                       ; preds = %bb_inst_52
  %100 = load i64, ptr %r0, align 4
  %101 = icmp ne i64 %100, 0
  br i1 %101, label %bb_inst_77, label %bb_inst_61

bb_inst_61:                                       ; preds = %bb_inst_60
  store i64 748844888709537908, ptr %r1, align 4
  %102 = load i64, ptr %r1, align 4
  %103 = load ptr, ptr %r10, align 8
  %104 = getelementptr i8, ptr %103, i64 -16
  store i64 %102, ptr %104, align 4
  store i64 8029390814170213999, ptr %r1, align 4
  %105 = load i64, ptr %r1, align 4
  %106 = load ptr, ptr %r10, align 8
  %107 = getelementptr i8, ptr %106, i64 -24
  store i64 %105, ptr %107, align 4
  store i64 7142837026506239043, ptr %r1, align 4
  %108 = load i64, ptr %r1, align 4
  %109 = load ptr, ptr %r10, align 8
  %110 = getelementptr i8, ptr %109, i64 -32
  store i64 %108, ptr %110, align 4
  store i64 0, ptr %r7, align 4
  %111 = load i64, ptr %r7, align 4
  %112 = trunc i64 %111 to i8
  %113 = load ptr, ptr %r10, align 8
  %114 = getelementptr i8, ptr %113, i64 -8
  store i8 %112, ptr %114, align 1
  %115 = load i64, ptr %r10, align 4
  store i64 %115, ptr %r1, align 4
  %116 = load i64, ptr %r1, align 4
  %117 = add i64 %116, -32
  store i64 %117, ptr %r1, align 4
  store i64 25, ptr %r2, align 4
  %118 = load i64, ptr %r1, align 4
  %119 = load i64, ptr %r2, align 4
  %120 = load i64, ptr %r3, align 4
  %121 = load i64, ptr %r4, align 4
  %122 = load i64, ptr %r5, align 4
  %123 = call i64 @_bpf_helper_ext_0006(i64 %118, i64 %119, i64 %120, i64 %121, i64 %122)
  store i64 %123, ptr %r0, align 4
  br label %bb_inst_76

bb_inst_76:                                       ; preds = %bb_inst_61
  br label %bb_inst_37

bb_inst_77:                                       ; preds = %bb_inst_60
  %124 = load i64, ptr %r9, align 4
  %125 = load ptr, ptr %r10, align 8
  %126 = getelementptr i8, ptr %125, i64 -56
  store i64 %124, ptr %126, align 4
  store i64 2, ptr %r7, align 4
  %127 = load i64, ptr %r8, align 4
  store i64 %127, ptr %r1, align 4
  %128 = load i64, ptr %r1, align 4
  %129 = add i64 %128, 1200
  store i64 %129, ptr %r1, align 4
  %130 = load i64, ptr %r1, align 4
  %131 = load i64, ptr %r6, align 4
  %132 = icmp ugt i64 %131, %130
  br i1 %132, label %bb_inst_37, label %bb_inst_82

bb_inst_82:                                       ; preds = %bb_inst_77
  %133 = load i64, ptr %r8, align 4
  store i64 %133, ptr %r1, align 4
  %134 = load i64, ptr %r1, align 4
  %135 = add i64 %134, 60
  store i64 %135, ptr %r1, align 4
  %136 = load i64, ptr %r6, align 4
  %137 = load i64, ptr %r1, align 4
  %138 = icmp ugt i64 %137, %136
  br i1 %138, label %bb_inst_37, label %bb_inst_85

bb_inst_85:                                       ; preds = %bb_inst_82
  store i64 0, ptr %r1, align 4
  store i64 0, ptr %r6, align 4
  br label %bb_inst_87

bb_inst_87:                                       ; preds = %bb_inst_87, %bb_inst_85
  %139 = load i64, ptr %r8, align 4
  store i64 %139, ptr %r2, align 4
  %140 = load i64, ptr %r2, align 4
  %141 = load i64, ptr %r1, align 4
  %142 = add i64 %140, %141
  store i64 %142, ptr %r2, align 4
  %143 = load ptr, ptr %r2, align 8
  %144 = getelementptr i8, ptr %143, i64 0
  %145 = load i8, ptr %144, align 1
  %146 = zext i8 %145 to i64
  store i64 %146, ptr %r2, align 4
  %147 = load i64, ptr %r6, align 4
  %148 = load i64, ptr %r2, align 4
  %149 = add i64 %147, %148
  store i64 %149, ptr %r6, align 4
  %150 = load i64, ptr %r1, align 4
  %151 = add i64 %150, 1
  store i64 %151, ptr %r1, align 4
  %152 = load i64, ptr %r1, align 4
  %153 = icmp ne i64 %152, 60
  br i1 %153, label %bb_inst_87, label %bb_inst_93

bb_inst_93:                                       ; preds = %bb_inst_87
  store i64 60, ptr %r4, align 4
  %154 = load i64, ptr %r6, align 4
  store i64 %154, ptr %r2, align 4
  %155 = load i64, ptr %r2, align 4
  %156 = add i64 %155, 1640531535
  store i64 %156, ptr %r2, align 4
  %157 = load i64, ptr %r8, align 4
  store i64 %157, ptr %r7, align 4
  %158 = load i64, ptr %r6, align 4
  store i64 %158, ptr %r9, align 4
  %159 = load i64, ptr %r9, align 4
  %160 = add i64 %159, -2048144777
  store i64 %160, ptr %r9, align 4
  %161 = load i64, ptr %r6, align 4
  store i64 %161, ptr %r8, align 4
  %162 = load i64, ptr %r8, align 4
  %163 = add i64 %162, 606290984
  store i64 %163, ptr %r8, align 4
  %164 = load i64, ptr %r7, align 4
  %165 = load ptr, ptr %r10, align 8
  %166 = getelementptr i8, ptr %165, i64 -64
  store i64 %164, ptr %166, align 4
  br label %bb_inst_102

bb_inst_102:                                      ; preds = %bb_inst_102, %bb_inst_93
  %167 = load i64, ptr %r2, align 4
  %168 = load ptr, ptr %r10, align 8
  %169 = getelementptr i8, ptr %168, i64 -40
  store i64 %167, ptr %169, align 4
  %170 = load ptr, ptr %r7, align 8
  %171 = getelementptr i8, ptr %170, i64 13
  %172 = load i8, ptr %171, align 1
  %173 = zext i8 %172 to i64
  store i64 %173, ptr %r3, align 4
  %174 = load i64, ptr %r3, align 4
  %175 = shl i64 %174, 8
  store i64 %175, ptr %r3, align 4
  %176 = load ptr, ptr %r7, align 8
  %177 = getelementptr i8, ptr %176, i64 12
  %178 = load i8, ptr %177, align 1
  %179 = zext i8 %178 to i64
  store i64 %179, ptr %r1, align 4
  %180 = load i64, ptr %r3, align 4
  %181 = load i64, ptr %r1, align 4
  %182 = or i64 %180, %181
  store i64 %182, ptr %r3, align 4
  %183 = load ptr, ptr %r7, align 8
  %184 = getelementptr i8, ptr %183, i64 1
  %185 = load i8, ptr %184, align 1
  %186 = zext i8 %185 to i64
  store i64 %186, ptr %r1, align 4
  %187 = load i64, ptr %r1, align 4
  %188 = shl i64 %187, 8
  store i64 %188, ptr %r1, align 4
  %189 = load ptr, ptr %r7, align 8
  %190 = getelementptr i8, ptr %189, i64 0
  %191 = load i8, ptr %190, align 1
  %192 = zext i8 %191 to i64
  store i64 %192, ptr %r2, align 4
  %193 = load i64, ptr %r1, align 4
  %194 = load i64, ptr %r2, align 4
  %195 = or i64 %193, %194
  store i64 %195, ptr %r1, align 4
  %196 = load ptr, ptr %r7, align 8
  %197 = getelementptr i8, ptr %196, i64 5
  %198 = load i8, ptr %197, align 1
  %199 = zext i8 %198 to i64
  store i64 %199, ptr %r5, align 4
  %200 = load i64, ptr %r5, align 4
  %201 = shl i64 %200, 8
  store i64 %201, ptr %r5, align 4
  %202 = load ptr, ptr %r7, align 8
  %203 = getelementptr i8, ptr %202, i64 4
  %204 = load i8, ptr %203, align 1
  %205 = zext i8 %204 to i64
  store i64 %205, ptr %r2, align 4
  %206 = load i64, ptr %r5, align 4
  %207 = load i64, ptr %r2, align 4
  %208 = or i64 %206, %207
  store i64 %208, ptr %r5, align 4
  %209 = load ptr, ptr %r7, align 8
  %210 = getelementptr i8, ptr %209, i64 2
  %211 = load i8, ptr %210, align 1
  %212 = zext i8 %211 to i64
  store i64 %212, ptr %r2, align 4
  %213 = load i64, ptr %r2, align 4
  %214 = shl i64 %213, 16
  store i64 %214, ptr %r2, align 4
  %215 = load i64, ptr %r1, align 4
  %216 = load i64, ptr %r2, align 4
  %217 = or i64 %215, %216
  store i64 %217, ptr %r1, align 4
  %218 = load ptr, ptr %r7, align 8
  %219 = getelementptr i8, ptr %218, i64 14
  %220 = load i8, ptr %219, align 1
  %221 = zext i8 %220 to i64
  store i64 %221, ptr %r2, align 4
  %222 = load i64, ptr %r2, align 4
  %223 = shl i64 %222, 16
  store i64 %223, ptr %r2, align 4
  %224 = load i64, ptr %r3, align 4
  %225 = load i64, ptr %r2, align 4
  %226 = or i64 %224, %225
  store i64 %226, ptr %r3, align 4
  %227 = load ptr, ptr %r7, align 8
  %228 = getelementptr i8, ptr %227, i64 9
  %229 = load i8, ptr %228, align 1
  %230 = zext i8 %229 to i64
  store i64 %230, ptr %r2, align 4
  %231 = load i64, ptr %r2, align 4
  %232 = shl i64 %231, 8
  store i64 %232, ptr %r2, align 4
  %233 = load ptr, ptr %r7, align 8
  %234 = getelementptr i8, ptr %233, i64 8
  %235 = load i8, ptr %234, align 1
  %236 = zext i8 %235 to i64
  store i64 %236, ptr %r0, align 4
  %237 = load i64, ptr %r2, align 4
  %238 = load i64, ptr %r0, align 4
  %239 = or i64 %237, %238
  store i64 %239, ptr %r2, align 4
  %240 = load ptr, ptr %r7, align 8
  %241 = getelementptr i8, ptr %240, i64 10
  %242 = load i8, ptr %241, align 1
  %243 = zext i8 %242 to i64
  store i64 %243, ptr %r0, align 4
  %244 = load i64, ptr %r0, align 4
  %245 = shl i64 %244, 16
  store i64 %245, ptr %r0, align 4
  %246 = load i64, ptr %r2, align 4
  %247 = load i64, ptr %r0, align 4
  %248 = or i64 %246, %247
  store i64 %248, ptr %r2, align 4
  %249 = load ptr, ptr %r7, align 8
  %250 = getelementptr i8, ptr %249, i64 11
  %251 = load i8, ptr %250, align 1
  %252 = zext i8 %251 to i64
  store i64 %252, ptr %r0, align 4
  %253 = load i64, ptr %r0, align 4
  %254 = shl i64 %253, 24
  store i64 %254, ptr %r0, align 4
  %255 = load i64, ptr %r2, align 4
  %256 = load i64, ptr %r0, align 4
  %257 = or i64 %255, %256
  store i64 %257, ptr %r2, align 4
  %258 = load ptr, ptr %r7, align 8
  %259 = getelementptr i8, ptr %258, i64 15
  %260 = load i8, ptr %259, align 1
  %261 = zext i8 %260 to i64
  store i64 %261, ptr %r0, align 4
  %262 = load i64, ptr %r0, align 4
  %263 = shl i64 %262, 24
  store i64 %263, ptr %r0, align 4
  %264 = load i64, ptr %r3, align 4
  %265 = load i64, ptr %r0, align 4
  %266 = or i64 %264, %265
  store i64 %266, ptr %r3, align 4
  %267 = load ptr, ptr %r7, align 8
  %268 = getelementptr i8, ptr %267, i64 3
  %269 = load i8, ptr %268, align 1
  %270 = zext i8 %269 to i64
  store i64 %270, ptr %r0, align 4
  %271 = load i64, ptr %r0, align 4
  %272 = shl i64 %271, 24
  store i64 %272, ptr %r0, align 4
  %273 = load i64, ptr %r1, align 4
  %274 = load i64, ptr %r0, align 4
  %275 = or i64 %273, %274
  store i64 %275, ptr %r1, align 4
  %276 = load ptr, ptr %r7, align 8
  %277 = getelementptr i8, ptr %276, i64 6
  %278 = load i8, ptr %277, align 1
  %279 = zext i8 %278 to i64
  store i64 %279, ptr %r0, align 4
  %280 = load i64, ptr %r0, align 4
  %281 = shl i64 %280, 16
  store i64 %281, ptr %r0, align 4
  %282 = load i64, ptr %r5, align 4
  %283 = load i64, ptr %r0, align 4
  %284 = or i64 %282, %283
  store i64 %284, ptr %r5, align 4
  %285 = load ptr, ptr %r7, align 8
  %286 = getelementptr i8, ptr %285, i64 7
  %287 = load i8, ptr %286, align 1
  %288 = zext i8 %287 to i64
  store i64 %288, ptr %r0, align 4
  %289 = load i64, ptr %r0, align 4
  %290 = shl i64 %289, 24
  store i64 %290, ptr %r0, align 4
  %291 = load i64, ptr %r5, align 4
  %292 = load i64, ptr %r0, align 4
  %293 = or i64 %291, %292
  store i64 %293, ptr %r5, align 4
  %294 = load i64, ptr %r5, align 4
  %295 = mul i64 %294, -2048144777
  store i64 %295, ptr %r5, align 4
  %296 = load i64, ptr %r5, align 4
  %297 = load i64, ptr %r9, align 4
  %298 = add i64 %296, %297
  store i64 %298, ptr %r5, align 4
  %299 = load i64, ptr %r1, align 4
  %300 = mul i64 %299, -2048144777
  store i64 %300, ptr %r1, align 4
  %301 = load i64, ptr %r1, align 4
  %302 = load i64, ptr %r8, align 4
  %303 = add i64 %301, %302
  store i64 %303, ptr %r1, align 4
  %304 = load i64, ptr %r3, align 4
  %305 = mul i64 %304, -2048144777
  store i64 %305, ptr %r3, align 4
  %306 = load ptr, ptr %r10, align 8
  %307 = getelementptr i8, ptr %306, i64 -40
  %308 = load i64, ptr %307, align 4
  store i64 %308, ptr %r0, align 4
  %309 = load i64, ptr %r3, align 4
  %310 = load i64, ptr %r0, align 4
  %311 = add i64 %309, %310
  store i64 %311, ptr %r3, align 4
  %312 = load i64, ptr %r2, align 4
  %313 = mul i64 %312, -2048144777
  store i64 %313, ptr %r2, align 4
  %314 = load i64, ptr %r2, align 4
  %315 = load i64, ptr %r6, align 4
  %316 = add i64 %314, %315
  store i64 %316, ptr %r2, align 4
  %317 = load i64, ptr %r1, align 4
  store i64 %317, ptr %r8, align 4
  %318 = load i64, ptr %r8, align 4
  %319 = shl i64 %318, 13
  store i64 %319, ptr %r8, align 4
  store i64 4294443008, ptr %r0, align 4
  %320 = load i64, ptr %r1, align 4
  %321 = load i64, ptr %r0, align 4
  %322 = and i64 %320, %321
  store i64 %322, ptr %r1, align 4
  %323 = load i64, ptr %r1, align 4
  %324 = lshr i64 %323, 19
  store i64 %324, ptr %r1, align 4
  %325 = load i64, ptr %r8, align 4
  %326 = load i64, ptr %r1, align 4
  %327 = or i64 %325, %326
  store i64 %327, ptr %r8, align 4
  %328 = load i64, ptr %r5, align 4
  store i64 %328, ptr %r9, align 4
  %329 = load i64, ptr %r9, align 4
  %330 = shl i64 %329, 13
  store i64 %330, ptr %r9, align 4
  %331 = load i64, ptr %r5, align 4
  %332 = load i64, ptr %r0, align 4
  %333 = and i64 %331, %332
  store i64 %333, ptr %r5, align 4
  %334 = load i64, ptr %r5, align 4
  %335 = lshr i64 %334, 19
  store i64 %335, ptr %r5, align 4
  %336 = load i64, ptr %r9, align 4
  %337 = load i64, ptr %r5, align 4
  %338 = or i64 %336, %337
  store i64 %338, ptr %r9, align 4
  %339 = load i64, ptr %r2, align 4
  store i64 %339, ptr %r6, align 4
  %340 = load i64, ptr %r6, align 4
  %341 = shl i64 %340, 13
  store i64 %341, ptr %r6, align 4
  %342 = load i64, ptr %r2, align 4
  %343 = load i64, ptr %r0, align 4
  %344 = and i64 %342, %343
  store i64 %344, ptr %r2, align 4
  %345 = load i64, ptr %r2, align 4
  %346 = lshr i64 %345, 19
  store i64 %346, ptr %r2, align 4
  %347 = load i64, ptr %r6, align 4
  %348 = load i64, ptr %r2, align 4
  %349 = or i64 %347, %348
  store i64 %349, ptr %r6, align 4
  %350 = load i64, ptr %r3, align 4
  store i64 %350, ptr %r1, align 4
  %351 = load i64, ptr %r1, align 4
  %352 = load i64, ptr %r0, align 4
  %353 = and i64 %351, %352
  store i64 %353, ptr %r1, align 4
  %354 = load i64, ptr %r3, align 4
  %355 = shl i64 %354, 13
  store i64 %355, ptr %r3, align 4
  %356 = load i64, ptr %r1, align 4
  %357 = lshr i64 %356, 19
  store i64 %357, ptr %r1, align 4
  %358 = load i64, ptr %r3, align 4
  %359 = load i64, ptr %r1, align 4
  %360 = or i64 %358, %359
  store i64 %360, ptr %r3, align 4
  %361 = load i64, ptr %r7, align 4
  %362 = add i64 %361, 16
  store i64 %362, ptr %r7, align 4
  %363 = load i64, ptr %r3, align 4
  %364 = mul i64 %363, -1640531535
  store i64 %364, ptr %r3, align 4
  %365 = load i64, ptr %r6, align 4
  %366 = mul i64 %365, -1640531535
  store i64 %366, ptr %r6, align 4
  %367 = load i64, ptr %r9, align 4
  %368 = mul i64 %367, -1640531535
  store i64 %368, ptr %r9, align 4
  %369 = load i64, ptr %r8, align 4
  %370 = mul i64 %369, -1640531535
  store i64 %370, ptr %r8, align 4
  %371 = load i64, ptr %r4, align 4
  %372 = add i64 %371, -16
  store i64 %372, ptr %r4, align 4
  %373 = load i64, ptr %r4, align 4
  store i64 %373, ptr %r1, align 4
  %374 = load i64, ptr %r1, align 4
  %375 = shl i64 %374, 32
  store i64 %375, ptr %r1, align 4
  %376 = load i64, ptr %r1, align 4
  %377 = lshr i64 %376, 32
  store i64 %377, ptr %r1, align 4
  %378 = load i64, ptr %r3, align 4
  store i64 %378, ptr %r2, align 4
  %379 = load i64, ptr %r1, align 4
  %380 = icmp ugt i64 %379, 15
  br i1 %380, label %bb_inst_102, label %bb_inst_185

bb_inst_185:                                      ; preds = %bb_inst_102
  store i64 4261412864, ptr %r1, align 4
  %381 = load i64, ptr %r9, align 4
  store i64 %381, ptr %r2, align 4
  %382 = load i64, ptr %r2, align 4
  %383 = load i64, ptr %r1, align 4
  %384 = and i64 %382, %383
  store i64 %384, ptr %r2, align 4
  %385 = load i64, ptr %r2, align 4
  %386 = lshr i64 %385, 25
  store i64 %386, ptr %r2, align 4
  %387 = load i64, ptr %r9, align 4
  %388 = shl i64 %387, 7
  store i64 %388, ptr %r9, align 4
  %389 = load i64, ptr %r9, align 4
  %390 = load i64, ptr %r2, align 4
  %391 = or i64 %389, %390
  store i64 %391, ptr %r9, align 4
  store i64 2147483648, ptr %r1, align 4
  %392 = load i64, ptr %r8, align 4
  store i64 %392, ptr %r2, align 4
  %393 = load i64, ptr %r2, align 4
  %394 = load i64, ptr %r1, align 4
  %395 = and i64 %393, %394
  store i64 %395, ptr %r2, align 4
  %396 = load i64, ptr %r2, align 4
  %397 = lshr i64 %396, 31
  store i64 %397, ptr %r2, align 4
  %398 = load i64, ptr %r8, align 4
  %399 = shl i64 %398, 1
  store i64 %399, ptr %r8, align 4
  %400 = load i64, ptr %r8, align 4
  %401 = load i64, ptr %r2, align 4
  %402 = or i64 %400, %401
  store i64 %402, ptr %r8, align 4
  %403 = load i64, ptr %r8, align 4
  %404 = load i64, ptr %r9, align 4
  %405 = add i64 %403, %404
  store i64 %405, ptr %r8, align 4
  store i64 4293918720, ptr %r1, align 4
  %406 = load i64, ptr %r6, align 4
  store i64 %406, ptr %r2, align 4
  %407 = load i64, ptr %r2, align 4
  %408 = load i64, ptr %r1, align 4
  %409 = and i64 %407, %408
  store i64 %409, ptr %r2, align 4
  %410 = load i64, ptr %r2, align 4
  %411 = lshr i64 %410, 20
  store i64 %411, ptr %r2, align 4
  %412 = load i64, ptr %r6, align 4
  %413 = shl i64 %412, 12
  store i64 %413, ptr %r6, align 4
  %414 = load i64, ptr %r6, align 4
  %415 = load i64, ptr %r2, align 4
  %416 = or i64 %414, %415
  store i64 %416, ptr %r6, align 4
  %417 = load i64, ptr %r8, align 4
  %418 = load i64, ptr %r6, align 4
  %419 = add i64 %417, %418
  store i64 %419, ptr %r8, align 4
  store i64 4294950912, ptr %r1, align 4
  %420 = load i64, ptr %r3, align 4
  store i64 %420, ptr %r2, align 4
  %421 = load i64, ptr %r2, align 4
  %422 = load i64, ptr %r1, align 4
  %423 = and i64 %421, %422
  store i64 %423, ptr %r2, align 4
  %424 = load i64, ptr %r2, align 4
  %425 = lshr i64 %424, 14
  store i64 %425, ptr %r2, align 4
  %426 = load i64, ptr %r3, align 4
  %427 = shl i64 %426, 18
  store i64 %427, ptr %r3, align 4
  %428 = load i64, ptr %r3, align 4
  %429 = load i64, ptr %r2, align 4
  %430 = or i64 %428, %429
  store i64 %430, ptr %r3, align 4
  %431 = load i64, ptr %r8, align 4
  %432 = load i64, ptr %r3, align 4
  %433 = add i64 %431, %432
  store i64 %433, ptr %r8, align 4
  store i64 12, ptr %r3, align 4
  %434 = load ptr, ptr %r10, align 8
  %435 = getelementptr i8, ptr %434, i64 -64
  %436 = load i64, ptr %435, align 4
  store i64 %436, ptr %r9, align 4
  %437 = load i64, ptr %r9, align 4
  store i64 %437, ptr %r0, align 4
  %438 = load i64, ptr %r0, align 4
  %439 = add i64 %438, 48
  store i64 %439, ptr %r0, align 4
  %440 = load i64, ptr %r8, align 4
  %441 = add i64 %440, 60
  store i64 %441, ptr %r8, align 4
  store i64 4, ptr %r2, align 4
  store i64 4294934528, ptr %r4, align 4
  store i64 4292870144, ptr %r5, align 4
  %442 = load i64, ptr %r0, align 4
  %443 = load ptr, ptr %r10, align 8
  %444 = getelementptr i8, ptr %443, i64 -72
  store i64 %442, ptr %444, align 4
  br label %bb_inst_227

bb_inst_227:                                      ; preds = %bb_inst_252, %bb_inst_185
  %445 = load i64, ptr %r3, align 4
  store i64 %445, ptr %r1, align 4
  %446 = load i64, ptr %r1, align 4
  %447 = shl i64 %446, 32
  store i64 %447, ptr %r1, align 4
  %448 = load i64, ptr %r1, align 4
  %449 = lshr i64 %448, 32
  store i64 %449, ptr %r1, align 4
  %450 = load i64, ptr %r1, align 4
  %451 = load i64, ptr %r2, align 4
  %452 = icmp ugt i64 %451, %450
  br i1 %452, label %bb_inst_257, label %bb_inst_231

bb_inst_231:                                      ; preds = %bb_inst_227
  %453 = load ptr, ptr %r0, align 8
  %454 = getelementptr i8, ptr %453, i64 1
  %455 = load i8, ptr %454, align 1
  %456 = zext i8 %455 to i64
  store i64 %456, ptr %r1, align 4
  %457 = load i64, ptr %r1, align 4
  %458 = shl i64 %457, 8
  store i64 %458, ptr %r1, align 4
  %459 = load ptr, ptr %r0, align 8
  %460 = getelementptr i8, ptr %459, i64 0
  %461 = load i8, ptr %460, align 1
  %462 = zext i8 %461 to i64
  store i64 %462, ptr %r6, align 4
  %463 = load i64, ptr %r1, align 4
  %464 = load i64, ptr %r6, align 4
  %465 = or i64 %463, %464
  store i64 %465, ptr %r1, align 4
  %466 = load ptr, ptr %r0, align 8
  %467 = getelementptr i8, ptr %466, i64 2
  %468 = load i8, ptr %467, align 1
  %469 = zext i8 %468 to i64
  store i64 %469, ptr %r6, align 4
  %470 = load i64, ptr %r6, align 4
  %471 = shl i64 %470, 16
  store i64 %471, ptr %r6, align 4
  %472 = load i64, ptr %r1, align 4
  %473 = load i64, ptr %r6, align 4
  %474 = or i64 %472, %473
  store i64 %474, ptr %r1, align 4
  %475 = load ptr, ptr %r0, align 8
  %476 = getelementptr i8, ptr %475, i64 3
  %477 = load i8, ptr %476, align 1
  %478 = zext i8 %477 to i64
  store i64 %478, ptr %r6, align 4
  %479 = load i64, ptr %r6, align 4
  %480 = shl i64 %479, 24
  store i64 %480, ptr %r6, align 4
  %481 = load i64, ptr %r1, align 4
  %482 = load i64, ptr %r6, align 4
  %483 = or i64 %481, %482
  store i64 %483, ptr %r1, align 4
  %484 = load i64, ptr %r1, align 4
  %485 = mul i64 %484, -1028477379
  store i64 %485, ptr %r1, align 4
  %486 = load i64, ptr %r1, align 4
  %487 = load i64, ptr %r8, align 4
  %488 = add i64 %486, %487
  store i64 %488, ptr %r1, align 4
  %489 = load i64, ptr %r1, align 4
  store i64 %489, ptr %r6, align 4
  %490 = load i64, ptr %r6, align 4
  %491 = load i64, ptr %r4, align 4
  %492 = and i64 %490, %491
  store i64 %492, ptr %r6, align 4
  %493 = load i64, ptr %r1, align 4
  %494 = shl i64 %493, 17
  store i64 %494, ptr %r1, align 4
  %495 = load i64, ptr %r6, align 4
  %496 = lshr i64 %495, 15
  store i64 %496, ptr %r6, align 4
  %497 = load i64, ptr %r1, align 4
  %498 = load i64, ptr %r6, align 4
  %499 = or i64 %497, %498
  store i64 %499, ptr %r1, align 4
  store i64 4294967292, ptr %r6, align 4
  store i64 4, ptr %r7, align 4
  %500 = load i64, ptr %r1, align 4
  %501 = mul i64 %500, 668265263
  store i64 %501, ptr %r1, align 4
  br label %bb_inst_252

bb_inst_252:                                      ; preds = %bb_inst_258, %bb_inst_231
  %502 = load i64, ptr %r1, align 4
  store i64 %502, ptr %r8, align 4
  %503 = load i64, ptr %r6, align 4
  %504 = load i64, ptr %r3, align 4
  %505 = add i64 %503, %504
  store i64 %505, ptr %r6, align 4
  %506 = load i64, ptr %r0, align 4
  %507 = load i64, ptr %r7, align 4
  %508 = add i64 %506, %507
  store i64 %508, ptr %r0, align 4
  %509 = load i64, ptr %r6, align 4
  store i64 %509, ptr %r3, align 4
  br label %bb_inst_227

bb_inst_257:                                      ; preds = %bb_inst_227
  %510 = load i64, ptr %r1, align 4
  %511 = icmp eq i64 %510, 0
  br i1 %511, label %bb_inst_271, label %bb_inst_258

bb_inst_258:                                      ; preds = %bb_inst_257
  %512 = load ptr, ptr %r0, align 8
  %513 = getelementptr i8, ptr %512, i64 0
  %514 = load i8, ptr %513, align 1
  %515 = zext i8 %514 to i64
  store i64 %515, ptr %r1, align 4
  %516 = load i64, ptr %r1, align 4
  %517 = mul i64 %516, 374761393
  store i64 %517, ptr %r1, align 4
  %518 = load i64, ptr %r1, align 4
  %519 = load i64, ptr %r8, align 4
  %520 = add i64 %518, %519
  store i64 %520, ptr %r1, align 4
  %521 = load i64, ptr %r1, align 4
  store i64 %521, ptr %r6, align 4
  %522 = load i64, ptr %r6, align 4
  %523 = load i64, ptr %r5, align 4
  %524 = and i64 %522, %523
  store i64 %524, ptr %r6, align 4
  %525 = load i64, ptr %r1, align 4
  %526 = shl i64 %525, 11
  store i64 %526, ptr %r1, align 4
  %527 = load i64, ptr %r6, align 4
  %528 = lshr i64 %527, 21
  store i64 %528, ptr %r6, align 4
  %529 = load i64, ptr %r1, align 4
  %530 = load i64, ptr %r6, align 4
  %531 = or i64 %529, %530
  store i64 %531, ptr %r1, align 4
  store i64 4294967295, ptr %r6, align 4
  store i64 1, ptr %r7, align 4
  %532 = load i64, ptr %r1, align 4
  %533 = mul i64 %532, -1640531535
  store i64 %533, ptr %r1, align 4
  br label %bb_inst_252

bb_inst_271:                                      ; preds = %bb_inst_257
  store i64 4294934528, ptr %r1, align 4
  %534 = load i64, ptr %r8, align 4
  store i64 %534, ptr %r2, align 4
  %535 = load i64, ptr %r2, align 4
  %536 = load i64, ptr %r1, align 4
  %537 = and i64 %535, %536
  store i64 %537, ptr %r2, align 4
  %538 = load i64, ptr %r2, align 4
  %539 = lshr i64 %538, 15
  store i64 %539, ptr %r2, align 4
  %540 = load i64, ptr %r2, align 4
  %541 = load i64, ptr %r8, align 4
  %542 = xor i64 %540, %541
  store i64 %542, ptr %r2, align 4
  %543 = load i64, ptr %r2, align 4
  %544 = mul i64 %543, -2048144777
  store i64 %544, ptr %r2, align 4
  store i64 4294959104, ptr %r1, align 4
  %545 = load i64, ptr %r2, align 4
  store i64 %545, ptr %r3, align 4
  %546 = load i64, ptr %r3, align 4
  %547 = load i64, ptr %r1, align 4
  %548 = and i64 %546, %547
  store i64 %548, ptr %r3, align 4
  %549 = load i64, ptr %r3, align 4
  %550 = lshr i64 %549, 13
  store i64 %550, ptr %r3, align 4
  %551 = load i64, ptr %r3, align 4
  %552 = load i64, ptr %r2, align 4
  %553 = xor i64 %551, %552
  store i64 %553, ptr %r3, align 4
  %554 = load i64, ptr %r3, align 4
  %555 = mul i64 %554, -1028477379
  store i64 %555, ptr %r3, align 4
  store i64 4294901760, ptr %r1, align 4
  %556 = load i64, ptr %r3, align 4
  store i64 %556, ptr %r2, align 4
  %557 = load i64, ptr %r2, align 4
  %558 = load i64, ptr %r1, align 4
  %559 = and i64 %557, %558
  store i64 %559, ptr %r2, align 4
  %560 = load i64, ptr %r2, align 4
  %561 = lshr i64 %560, 16
  store i64 %561, ptr %r2, align 4
  %562 = load i64, ptr %r2, align 4
  %563 = load i64, ptr %r3, align 4
  %564 = xor i64 %562, %563
  store i64 %564, ptr %r2, align 4
  %565 = load i64, ptr %r2, align 4
  %566 = shl i64 %565, 32
  store i64 %566, ptr %r2, align 4
  %567 = load i64, ptr %r2, align 4
  %568 = lshr i64 %567, 32
  store i64 %568, ptr %r2, align 4
  store i64 2, ptr %r1, align 4
  %569 = load i64, ptr %r2, align 4
  %570 = load i64, ptr %r1, align 4
  %571 = icmp ugt i64 %570, %569
  br i1 %571, label %bb_inst_321, label %bb_inst_295

bb_inst_295:                                      ; preds = %bb_inst_271
  %572 = load ptr, ptr %r10, align 8
  %573 = getelementptr i8, ptr %572, i64 -48
  %574 = load i64, ptr %573, align 4
  store i64 %574, ptr %r3, align 4
  %575 = load ptr, ptr %r3, align 8
  %576 = getelementptr i8, ptr %575, i64 0
  %577 = load i16, ptr %576, align 2
  %578 = zext i16 %577 to i64
  store i64 %578, ptr %r1, align 4
  %579 = load ptr, ptr %r10, align 8
  %580 = getelementptr i8, ptr %579, i64 -56
  %581 = load i64, ptr %580, align 4
  store i64 %581, ptr %r2, align 4
  %582 = load ptr, ptr %r2, align 8
  %583 = getelementptr i8, ptr %582, i64 12
  %584 = load i32, ptr %583, align 4
  %585 = zext i32 %584 to i64
  store i64 %585, ptr %r2, align 4
  %586 = load i64, ptr %r2, align 4
  %587 = load i64, ptr %r1, align 4
  %588 = xor i64 %586, %587
  store i64 %588, ptr %r2, align 4
  %589 = load ptr, ptr %r3, align 8
  %590 = getelementptr i8, ptr %589, i64 2
  %591 = load i16, ptr %590, align 2
  %592 = zext i16 %591 to i64
  store i64 %592, ptr %r1, align 4
  %593 = load i64, ptr %r2, align 4
  %594 = load i64, ptr %r1, align 4
  %595 = xor i64 %593, %594
  store i64 %595, ptr %r2, align 4
  %596 = load i64, ptr %r2, align 4
  %597 = and i64 %596, 1
  store i64 %597, ptr %r2, align 4
  %598 = load i64, ptr %r2, align 4
  %599 = trunc i64 %598 to i32
  %600 = load ptr, ptr %r10, align 8
  %601 = getelementptr i8, ptr %600, i64 -4
  store i32 %599, ptr %601, align 4
  %602 = load i64, ptr %r10, align 4
  store i64 %602, ptr %r2, align 4
  %603 = load i64, ptr %r2, align 4
  %604 = add i64 %603, -4
  store i64 %604, ptr %r2, align 4
  %605 = call i64 @__lddw_helper_map_by_fd(i32 5)
  store i64 %605, ptr %r1, align 4
  %606 = load i64, ptr %r1, align 4
  %607 = load i64, ptr %r2, align 4
  %608 = load i64, ptr %r3, align 4
  %609 = load i64, ptr %r4, align 4
  %610 = load i64, ptr %r5, align 4
  %611 = call i64 @_bpf_helper_ext_0001(i64 %606, i64 %607, i64 %608, i64 %609, i64 %610)
  store i64 %611, ptr %r0, align 4
  br label %bb_inst_309

bb_inst_309:                                      ; preds = %bb_inst_295
  %612 = load i64, ptr %r0, align 4
  store i64 %612, ptr %r6, align 4
  store i64 0, ptr %r7, align 4
  %613 = load i64, ptr %r6, align 4
  %614 = icmp eq i64 %613, 0
  br i1 %614, label %bb_inst_37, label %bb_inst_312

bb_inst_312:                                      ; preds = %bb_inst_309
  store i64 0, ptr %r7, align 4
  %615 = load i64, ptr %r7, align 4
  %616 = trunc i64 %615 to i32
  %617 = load ptr, ptr %r10, align 8
  %618 = getelementptr i8, ptr %617, i64 -4
  store i32 %616, ptr %618, align 4
  %619 = load i64, ptr %r10, align 4
  store i64 %619, ptr %r2, align 4
  %620 = load i64, ptr %r2, align 4
  %621 = add i64 %620, -4
  store i64 %621, ptr %r2, align 4
  %622 = call i64 @__lddw_helper_map_by_fd(i32 4)
  store i64 %622, ptr %r1, align 4
  %623 = load i64, ptr %r1, align 4
  %624 = load i64, ptr %r2, align 4
  %625 = load i64, ptr %r3, align 4
  %626 = load i64, ptr %r4, align 4
  %627 = load i64, ptr %r5, align 4
  %628 = call i64 @_bpf_helper_ext_0001(i64 %623, i64 %624, i64 %625, i64 %626, i64 %627)
  store i64 %628, ptr %r0, align 4
  br label %bb_inst_319

bb_inst_319:                                      ; preds = %bb_inst_312
  %629 = load i64, ptr %r0, align 4
  %630 = icmp eq i64 %629, 0
  br i1 %630, label %bb_inst_37, label %bb_inst_320

bb_inst_320:                                      ; preds = %bb_inst_319
  br label %bb_inst_339

bb_inst_321:                                      ; preds = %bb_inst_271
  store i64 1, ptr %r1, align 4
  %631 = load i64, ptr %r1, align 4
  %632 = trunc i64 %631 to i32
  %633 = load ptr, ptr %r10, align 8
  %634 = getelementptr i8, ptr %633, i64 -4
  store i32 %632, ptr %634, align 4
  %635 = load i64, ptr %r10, align 4
  store i64 %635, ptr %r2, align 4
  %636 = load i64, ptr %r2, align 4
  %637 = add i64 %636, -4
  store i64 %637, ptr %r2, align 4
  %638 = call i64 @__lddw_helper_map_by_fd(i32 4)
  store i64 %638, ptr %r1, align 4
  %639 = load i64, ptr %r1, align 4
  %640 = load i64, ptr %r2, align 4
  %641 = load i64, ptr %r3, align 4
  %642 = load i64, ptr %r4, align 4
  %643 = load i64, ptr %r5, align 4
  %644 = call i64 @_bpf_helper_ext_0001(i64 %639, i64 %640, i64 %641, i64 %642, i64 %643)
  store i64 %644, ptr %r0, align 4
  br label %bb_inst_328

bb_inst_328:                                      ; preds = %bb_inst_321
  %645 = load i64, ptr %r0, align 4
  store i64 %645, ptr %r6, align 4
  store i64 0, ptr %r7, align 4
  %646 = load i64, ptr %r6, align 4
  %647 = icmp eq i64 %646, 0
  br i1 %647, label %bb_inst_37, label %bb_inst_331

bb_inst_331:                                      ; preds = %bb_inst_328
  store i64 0, ptr %r7, align 4
  %648 = load i64, ptr %r7, align 4
  %649 = trunc i64 %648 to i32
  %650 = load ptr, ptr %r10, align 8
  %651 = getelementptr i8, ptr %650, i64 -4
  store i32 %649, ptr %651, align 4
  %652 = load i64, ptr %r10, align 4
  store i64 %652, ptr %r2, align 4
  %653 = load i64, ptr %r2, align 4
  %654 = add i64 %653, -4
  store i64 %654, ptr %r2, align 4
  %655 = call i64 @__lddw_helper_map_by_fd(i32 4)
  store i64 %655, ptr %r1, align 4
  %656 = load i64, ptr %r1, align 4
  %657 = load i64, ptr %r2, align 4
  %658 = load i64, ptr %r3, align 4
  %659 = load i64, ptr %r4, align 4
  %660 = load i64, ptr %r5, align 4
  %661 = call i64 @_bpf_helper_ext_0001(i64 %656, i64 %657, i64 %658, i64 %659, i64 %660)
  store i64 %661, ptr %r0, align 4
  br label %bb_inst_338

bb_inst_338:                                      ; preds = %bb_inst_331
  %662 = load i64, ptr %r0, align 4
  %663 = icmp eq i64 %662, 0
  br i1 %663, label %bb_inst_37, label %bb_inst_339

bb_inst_339:                                      ; preds = %bb_inst_338, %bb_inst_320
  store i64 0, ptr %r1, align 4
  %664 = load i64, ptr %r9, align 4
  store i64 %664, ptr %r2, align 4
  %665 = load i64, ptr %r2, align 4
  %666 = load i64, ptr %r1, align 4
  %667 = add i64 %665, %666
  store i64 %667, ptr %r2, align 4
  %668 = load ptr, ptr %r6, align 8
  %669 = getelementptr i8, ptr %668, i64 4
  %670 = load i16, ptr %669, align 2
  %671 = zext i16 %670 to i64
  store i64 %671, ptr %r1, align 4
  %672 = load i64, ptr %r1, align 4
  %673 = trunc i64 %672 to i16
  %674 = load ptr, ptr %r2, align 8
  %675 = getelementptr i8, ptr %674, i64 4
  store i16 %673, ptr %675, align 2
  %676 = load ptr, ptr %r6, align 8
  %677 = getelementptr i8, ptr %676, i64 2
  %678 = load i16, ptr %677, align 2
  %679 = zext i16 %678 to i64
  store i64 %679, ptr %r1, align 4
  %680 = load i64, ptr %r1, align 4
  %681 = trunc i64 %680 to i16
  %682 = load ptr, ptr %r2, align 8
  %683 = getelementptr i8, ptr %682, i64 2
  store i16 %681, ptr %683, align 2
  %684 = load ptr, ptr %r6, align 8
  %685 = getelementptr i8, ptr %684, i64 0
  %686 = load i16, ptr %685, align 2
  %687 = zext i16 %686 to i64
  store i64 %687, ptr %r1, align 4
  %688 = load i64, ptr %r1, align 4
  %689 = trunc i64 %688 to i16
  %690 = load ptr, ptr %r9, align 8
  %691 = getelementptr i8, ptr %690, i64 0
  store i16 %689, ptr %691, align 2
  store i64 6, ptr %r1, align 4
  %692 = load i64, ptr %r9, align 4
  store i64 %692, ptr %r2, align 4
  %693 = load i64, ptr %r2, align 4
  %694 = load i64, ptr %r1, align 4
  %695 = add i64 %693, %694
  store i64 %695, ptr %r2, align 4
  %696 = load ptr, ptr %r0, align 8
  %697 = getelementptr i8, ptr %696, i64 4
  %698 = load i16, ptr %697, align 2
  %699 = zext i16 %698 to i64
  store i64 %699, ptr %r1, align 4
  %700 = load i64, ptr %r1, align 4
  %701 = trunc i64 %700 to i16
  %702 = load ptr, ptr %r2, align 8
  %703 = getelementptr i8, ptr %702, i64 4
  store i16 %701, ptr %703, align 2
  %704 = load ptr, ptr %r0, align 8
  %705 = getelementptr i8, ptr %704, i64 0
  %706 = load i16, ptr %705, align 2
  %707 = zext i16 %706 to i64
  store i64 %707, ptr %r1, align 4
  %708 = load i64, ptr %r1, align 4
  %709 = trunc i64 %708 to i16
  %710 = load ptr, ptr %r9, align 8
  %711 = getelementptr i8, ptr %710, i64 6
  store i16 %709, ptr %711, align 2
  %712 = load ptr, ptr %r0, align 8
  %713 = getelementptr i8, ptr %712, i64 2
  %714 = load i16, ptr %713, align 2
  %715 = zext i16 %714 to i64
  store i64 %715, ptr %r1, align 4
  %716 = load i64, ptr %r1, align 4
  %717 = trunc i64 %716 to i16
  %718 = load ptr, ptr %r2, align 8
  %719 = getelementptr i8, ptr %718, i64 2
  store i16 %717, ptr %719, align 2
  %720 = load ptr, ptr %r6, align 8
  %721 = getelementptr i8, ptr %720, i64 8
  %722 = load i32, ptr %721, align 4
  %723 = zext i32 %722 to i64
  store i64 %723, ptr %r1, align 4
  %724 = load i64, ptr %r1, align 4
  %725 = lshr i64 %724, 0
  %726 = and i64 %725, 255
  %727 = lshr i64 %724, 8
  %728 = and i64 %727, 255
  %729 = lshr i64 %724, 16
  %730 = and i64 %729, 255
  %731 = lshr i64 %724, 24
  %732 = and i64 %731, 255
  %733 = shl i64 %726, 8
  %734 = or i64 %733, %728
  %735 = shl i64 %734, 8
  %736 = or i64 %735, %730
  %737 = shl i64 %736, 8
  %738 = or i64 %737, %732
  store i64 %738, ptr %r1, align 4
  %739 = load ptr, ptr %r10, align 8
  %740 = getelementptr i8, ptr %739, i64 -56
  %741 = load i64, ptr %740, align 4
  store i64 %741, ptr %r7, align 4
  %742 = load i64, ptr %r1, align 4
  %743 = trunc i64 %742 to i32
  %744 = load ptr, ptr %r7, align 8
  %745 = getelementptr i8, ptr %744, i64 16
  store i32 %743, ptr %745, align 4
  %746 = load ptr, ptr %r0, align 8
  %747 = getelementptr i8, ptr %746, i64 8
  %748 = load i32, ptr %747, align 4
  %749 = zext i32 %748 to i64
  store i64 %749, ptr %r1, align 4
  %750 = load i64, ptr %r1, align 4
  %751 = lshr i64 %750, 0
  %752 = and i64 %751, 255
  %753 = lshr i64 %750, 8
  %754 = and i64 %753, 255
  %755 = lshr i64 %750, 16
  %756 = and i64 %755, 255
  %757 = lshr i64 %750, 24
  %758 = and i64 %757, 255
  %759 = shl i64 %752, 8
  %760 = or i64 %759, %754
  %761 = shl i64 %760, 8
  %762 = or i64 %761, %756
  %763 = shl i64 %762, 8
  %764 = or i64 %763, %758
  store i64 %764, ptr %r1, align 4
  %765 = load i64, ptr %r1, align 4
  %766 = trunc i64 %765 to i32
  %767 = load ptr, ptr %r7, align 8
  %768 = getelementptr i8, ptr %767, i64 12
  store i32 %766, ptr %768, align 4
  store i64 0, ptr %r6, align 4
  %769 = load i64, ptr %r6, align 4
  %770 = trunc i64 %769 to i16
  %771 = load ptr, ptr %r7, align 8
  %772 = getelementptr i8, ptr %771, i64 10
  store i16 %770, ptr %772, align 2
  store i64 0, ptr %r1, align 4
  store i64 0, ptr %r2, align 4
  %773 = load i64, ptr %r7, align 4
  store i64 %773, ptr %r3, align 4
  store i64 20, ptr %r4, align 4
  store i64 0, ptr %r5, align 4
  %774 = load i64, ptr %r1, align 4
  %775 = load i64, ptr %r2, align 4
  %776 = load i64, ptr %r3, align 4
  %777 = load i64, ptr %r4, align 4
  %778 = load i64, ptr %r5, align 4
  %779 = call i64 @_bpf_helper_ext_0028(i64 %774, i64 %775, i64 %776, i64 %777, i64 %778)
  store i64 %779, ptr %r0, align 4
  br label %bb_inst_372

bb_inst_372:                                      ; preds = %bb_inst_339
  store i64 4294901760, ptr %r1, align 4
  %780 = load i64, ptr %r0, align 4
  store i64 %780, ptr %r2, align 4
  %781 = load i64, ptr %r2, align 4
  %782 = load i64, ptr %r1, align 4
  %783 = and i64 %781, %782
  store i64 %783, ptr %r2, align 4
  %784 = load i64, ptr %r0, align 4
  %785 = and i64 %784, 65535
  store i64 %785, ptr %r0, align 4
  %786 = load i64, ptr %r2, align 4
  %787 = lshr i64 %786, 16
  store i64 %787, ptr %r2, align 4
  %788 = load i64, ptr %r2, align 4
  %789 = load i64, ptr %r0, align 4
  %790 = add i64 %788, %789
  store i64 %790, ptr %r2, align 4
  %791 = load i64, ptr %r2, align 4
  store i64 %791, ptr %r1, align 4
  %792 = load i64, ptr %r1, align 4
  %793 = lshr i64 %792, 16
  store i64 %793, ptr %r1, align 4
  %794 = load i64, ptr %r1, align 4
  %795 = load i64, ptr %r2, align 4
  %796 = add i64 %794, %795
  store i64 %796, ptr %r1, align 4
  %797 = load i64, ptr %r1, align 4
  %798 = xor i64 %797, -1
  store i64 %798, ptr %r1, align 4
  %799 = load i64, ptr %r1, align 4
  %800 = trunc i64 %799 to i16
  %801 = load ptr, ptr %r7, align 8
  %802 = getelementptr i8, ptr %801, i64 10
  store i16 %800, ptr %802, align 2
  store i64 0, ptr %r2, align 4
  br label %bb_inst_385

bb_inst_385:                                      ; preds = %bb_inst_385, %bb_inst_372
  %803 = load i64, ptr %r9, align 4
  store i64 %803, ptr %r1, align 4
  %804 = load i64, ptr %r1, align 4
  %805 = load i64, ptr %r6, align 4
  %806 = add i64 %804, %805
  store i64 %806, ptr %r1, align 4
  %807 = load ptr, ptr %r1, align 8
  %808 = getelementptr i8, ptr %807, i64 0
  %809 = load i8, ptr %808, align 1
  %810 = zext i8 %809 to i64
  store i64 %810, ptr %r1, align 4
  %811 = load i64, ptr %r2, align 4
  %812 = load i64, ptr %r1, align 4
  %813 = add i64 %811, %812
  store i64 %813, ptr %r2, align 4
  %814 = load i64, ptr %r6, align 4
  %815 = add i64 %814, 1
  store i64 %815, ptr %r6, align 4
  %816 = load i64, ptr %r6, align 4
  %817 = icmp ne i64 %816, 60
  br i1 %817, label %bb_inst_385, label %bb_inst_391

bb_inst_391:                                      ; preds = %bb_inst_385
  store i64 60, ptr %r5, align 4
  %818 = load i64, ptr %r2, align 4
  store i64 %818, ptr %r4, align 4
  %819 = load i64, ptr %r4, align 4
  %820 = add i64 %819, 1640531535
  store i64 %820, ptr %r4, align 4
  %821 = load i64, ptr %r2, align 4
  store i64 %821, ptr %r0, align 4
  %822 = load i64, ptr %r0, align 4
  %823 = add i64 %822, -2048144777
  store i64 %823, ptr %r0, align 4
  %824 = load i64, ptr %r2, align 4
  store i64 %824, ptr %r1, align 4
  %825 = load i64, ptr %r1, align 4
  %826 = add i64 %825, 606290984
  store i64 %826, ptr %r1, align 4
  %827 = load i64, ptr %r2, align 4
  %828 = load ptr, ptr %r10, align 8
  %829 = getelementptr i8, ptr %828, i64 -48
  store i64 %827, ptr %829, align 4
  %830 = load i64, ptr %r2, align 4
  store i64 %830, ptr %r6, align 4
  %831 = load i64, ptr %r9, align 4
  store i64 %831, ptr %r7, align 4
  br label %bb_inst_401

bb_inst_401:                                      ; preds = %bb_inst_401, %bb_inst_391
  %832 = load i64, ptr %r4, align 4
  %833 = load ptr, ptr %r10, align 8
  %834 = getelementptr i8, ptr %833, i64 -40
  store i64 %832, ptr %834, align 4
  %835 = load ptr, ptr %r7, align 8
  %836 = getelementptr i8, ptr %835, i64 13
  %837 = load i8, ptr %836, align 1
  %838 = zext i8 %837 to i64
  store i64 %838, ptr %r3, align 4
  %839 = load i64, ptr %r3, align 4
  %840 = shl i64 %839, 8
  store i64 %840, ptr %r3, align 4
  %841 = load ptr, ptr %r7, align 8
  %842 = getelementptr i8, ptr %841, i64 12
  %843 = load i8, ptr %842, align 1
  %844 = zext i8 %843 to i64
  store i64 %844, ptr %r2, align 4
  %845 = load i64, ptr %r3, align 4
  %846 = load i64, ptr %r2, align 4
  %847 = or i64 %845, %846
  store i64 %847, ptr %r3, align 4
  %848 = load ptr, ptr %r7, align 8
  %849 = getelementptr i8, ptr %848, i64 1
  %850 = load i8, ptr %849, align 1
  %851 = zext i8 %850 to i64
  store i64 %851, ptr %r2, align 4
  %852 = load i64, ptr %r2, align 4
  %853 = shl i64 %852, 8
  store i64 %853, ptr %r2, align 4
  %854 = load ptr, ptr %r7, align 8
  %855 = getelementptr i8, ptr %854, i64 0
  %856 = load i8, ptr %855, align 1
  %857 = zext i8 %856 to i64
  store i64 %857, ptr %r4, align 4
  %858 = load i64, ptr %r2, align 4
  %859 = load i64, ptr %r4, align 4
  %860 = or i64 %858, %859
  store i64 %860, ptr %r2, align 4
  %861 = load ptr, ptr %r7, align 8
  %862 = getelementptr i8, ptr %861, i64 5
  %863 = load i8, ptr %862, align 1
  %864 = zext i8 %863 to i64
  store i64 %864, ptr %r9, align 4
  %865 = load i64, ptr %r9, align 4
  %866 = shl i64 %865, 8
  store i64 %866, ptr %r9, align 4
  %867 = load ptr, ptr %r7, align 8
  %868 = getelementptr i8, ptr %867, i64 4
  %869 = load i8, ptr %868, align 1
  %870 = zext i8 %869 to i64
  store i64 %870, ptr %r4, align 4
  %871 = load i64, ptr %r9, align 4
  %872 = load i64, ptr %r4, align 4
  %873 = or i64 %871, %872
  store i64 %873, ptr %r9, align 4
  %874 = load ptr, ptr %r7, align 8
  %875 = getelementptr i8, ptr %874, i64 2
  %876 = load i8, ptr %875, align 1
  %877 = zext i8 %876 to i64
  store i64 %877, ptr %r4, align 4
  %878 = load i64, ptr %r4, align 4
  %879 = shl i64 %878, 16
  store i64 %879, ptr %r4, align 4
  %880 = load i64, ptr %r2, align 4
  %881 = load i64, ptr %r4, align 4
  %882 = or i64 %880, %881
  store i64 %882, ptr %r2, align 4
  %883 = load ptr, ptr %r7, align 8
  %884 = getelementptr i8, ptr %883, i64 14
  %885 = load i8, ptr %884, align 1
  %886 = zext i8 %885 to i64
  store i64 %886, ptr %r4, align 4
  %887 = load i64, ptr %r4, align 4
  %888 = shl i64 %887, 16
  store i64 %888, ptr %r4, align 4
  %889 = load i64, ptr %r3, align 4
  %890 = load i64, ptr %r4, align 4
  %891 = or i64 %889, %890
  store i64 %891, ptr %r3, align 4
  %892 = load ptr, ptr %r7, align 8
  %893 = getelementptr i8, ptr %892, i64 9
  %894 = load i8, ptr %893, align 1
  %895 = zext i8 %894 to i64
  store i64 %895, ptr %r4, align 4
  %896 = load i64, ptr %r4, align 4
  %897 = shl i64 %896, 8
  store i64 %897, ptr %r4, align 4
  %898 = load ptr, ptr %r7, align 8
  %899 = getelementptr i8, ptr %898, i64 8
  %900 = load i8, ptr %899, align 1
  %901 = zext i8 %900 to i64
  store i64 %901, ptr %r8, align 4
  %902 = load i64, ptr %r4, align 4
  %903 = load i64, ptr %r8, align 4
  %904 = or i64 %902, %903
  store i64 %904, ptr %r4, align 4
  %905 = load ptr, ptr %r7, align 8
  %906 = getelementptr i8, ptr %905, i64 10
  %907 = load i8, ptr %906, align 1
  %908 = zext i8 %907 to i64
  store i64 %908, ptr %r8, align 4
  %909 = load i64, ptr %r8, align 4
  %910 = shl i64 %909, 16
  store i64 %910, ptr %r8, align 4
  %911 = load i64, ptr %r4, align 4
  %912 = load i64, ptr %r8, align 4
  %913 = or i64 %911, %912
  store i64 %913, ptr %r4, align 4
  %914 = load ptr, ptr %r7, align 8
  %915 = getelementptr i8, ptr %914, i64 11
  %916 = load i8, ptr %915, align 1
  %917 = zext i8 %916 to i64
  store i64 %917, ptr %r8, align 4
  %918 = load i64, ptr %r8, align 4
  %919 = shl i64 %918, 24
  store i64 %919, ptr %r8, align 4
  %920 = load i64, ptr %r4, align 4
  %921 = load i64, ptr %r8, align 4
  %922 = or i64 %920, %921
  store i64 %922, ptr %r4, align 4
  %923 = load ptr, ptr %r7, align 8
  %924 = getelementptr i8, ptr %923, i64 15
  %925 = load i8, ptr %924, align 1
  %926 = zext i8 %925 to i64
  store i64 %926, ptr %r8, align 4
  %927 = load i64, ptr %r8, align 4
  %928 = shl i64 %927, 24
  store i64 %928, ptr %r8, align 4
  %929 = load i64, ptr %r3, align 4
  %930 = load i64, ptr %r8, align 4
  %931 = or i64 %929, %930
  store i64 %931, ptr %r3, align 4
  %932 = load ptr, ptr %r7, align 8
  %933 = getelementptr i8, ptr %932, i64 3
  %934 = load i8, ptr %933, align 1
  %935 = zext i8 %934 to i64
  store i64 %935, ptr %r8, align 4
  %936 = load i64, ptr %r8, align 4
  %937 = shl i64 %936, 24
  store i64 %937, ptr %r8, align 4
  %938 = load i64, ptr %r2, align 4
  %939 = load i64, ptr %r8, align 4
  %940 = or i64 %938, %939
  store i64 %940, ptr %r2, align 4
  %941 = load ptr, ptr %r7, align 8
  %942 = getelementptr i8, ptr %941, i64 6
  %943 = load i8, ptr %942, align 1
  %944 = zext i8 %943 to i64
  store i64 %944, ptr %r8, align 4
  %945 = load i64, ptr %r8, align 4
  %946 = shl i64 %945, 16
  store i64 %946, ptr %r8, align 4
  %947 = load i64, ptr %r9, align 4
  %948 = load i64, ptr %r8, align 4
  %949 = or i64 %947, %948
  store i64 %949, ptr %r9, align 4
  %950 = load ptr, ptr %r7, align 8
  %951 = getelementptr i8, ptr %950, i64 7
  %952 = load i8, ptr %951, align 1
  %953 = zext i8 %952 to i64
  store i64 %953, ptr %r8, align 4
  %954 = load i64, ptr %r8, align 4
  %955 = shl i64 %954, 24
  store i64 %955, ptr %r8, align 4
  %956 = load i64, ptr %r9, align 4
  %957 = load i64, ptr %r8, align 4
  %958 = or i64 %956, %957
  store i64 %958, ptr %r9, align 4
  %959 = load i64, ptr %r9, align 4
  %960 = mul i64 %959, -2048144777
  store i64 %960, ptr %r9, align 4
  %961 = load i64, ptr %r9, align 4
  %962 = load i64, ptr %r0, align 4
  %963 = add i64 %961, %962
  store i64 %963, ptr %r9, align 4
  %964 = load i64, ptr %r2, align 4
  %965 = mul i64 %964, -2048144777
  store i64 %965, ptr %r2, align 4
  %966 = load i64, ptr %r2, align 4
  %967 = load i64, ptr %r1, align 4
  %968 = add i64 %966, %967
  store i64 %968, ptr %r2, align 4
  %969 = load i64, ptr %r3, align 4
  %970 = mul i64 %969, -2048144777
  store i64 %970, ptr %r3, align 4
  %971 = load ptr, ptr %r10, align 8
  %972 = getelementptr i8, ptr %971, i64 -40
  %973 = load i64, ptr %972, align 4
  store i64 %973, ptr %r1, align 4
  %974 = load i64, ptr %r3, align 4
  %975 = load i64, ptr %r1, align 4
  %976 = add i64 %974, %975
  store i64 %976, ptr %r3, align 4
  %977 = load i64, ptr %r4, align 4
  %978 = mul i64 %977, -2048144777
  store i64 %978, ptr %r4, align 4
  %979 = load i64, ptr %r4, align 4
  %980 = load i64, ptr %r6, align 4
  %981 = add i64 %979, %980
  store i64 %981, ptr %r4, align 4
  %982 = load i64, ptr %r2, align 4
  store i64 %982, ptr %r1, align 4
  %983 = load i64, ptr %r1, align 4
  %984 = shl i64 %983, 13
  store i64 %984, ptr %r1, align 4
  store i64 4294443008, ptr %r8, align 4
  %985 = load i64, ptr %r2, align 4
  %986 = load i64, ptr %r8, align 4
  %987 = and i64 %985, %986
  store i64 %987, ptr %r2, align 4
  %988 = load i64, ptr %r2, align 4
  %989 = lshr i64 %988, 19
  store i64 %989, ptr %r2, align 4
  %990 = load i64, ptr %r1, align 4
  %991 = load i64, ptr %r2, align 4
  %992 = or i64 %990, %991
  store i64 %992, ptr %r1, align 4
  %993 = load i64, ptr %r9, align 4
  store i64 %993, ptr %r0, align 4
  %994 = load i64, ptr %r0, align 4
  %995 = shl i64 %994, 13
  store i64 %995, ptr %r0, align 4
  %996 = load i64, ptr %r9, align 4
  %997 = load i64, ptr %r8, align 4
  %998 = and i64 %996, %997
  store i64 %998, ptr %r9, align 4
  %999 = load i64, ptr %r9, align 4
  %1000 = lshr i64 %999, 19
  store i64 %1000, ptr %r9, align 4
  %1001 = load i64, ptr %r0, align 4
  %1002 = load i64, ptr %r9, align 4
  %1003 = or i64 %1001, %1002
  store i64 %1003, ptr %r0, align 4
  %1004 = load i64, ptr %r4, align 4
  store i64 %1004, ptr %r6, align 4
  %1005 = load i64, ptr %r6, align 4
  %1006 = shl i64 %1005, 13
  store i64 %1006, ptr %r6, align 4
  %1007 = load i64, ptr %r4, align 4
  %1008 = load i64, ptr %r8, align 4
  %1009 = and i64 %1007, %1008
  store i64 %1009, ptr %r4, align 4
  %1010 = load i64, ptr %r4, align 4
  %1011 = lshr i64 %1010, 19
  store i64 %1011, ptr %r4, align 4
  %1012 = load i64, ptr %r6, align 4
  %1013 = load i64, ptr %r4, align 4
  %1014 = or i64 %1012, %1013
  store i64 %1014, ptr %r6, align 4
  %1015 = load i64, ptr %r3, align 4
  store i64 %1015, ptr %r2, align 4
  %1016 = load i64, ptr %r2, align 4
  %1017 = load i64, ptr %r8, align 4
  %1018 = and i64 %1016, %1017
  store i64 %1018, ptr %r2, align 4
  %1019 = load i64, ptr %r3, align 4
  %1020 = shl i64 %1019, 13
  store i64 %1020, ptr %r3, align 4
  %1021 = load i64, ptr %r2, align 4
  %1022 = lshr i64 %1021, 19
  store i64 %1022, ptr %r2, align 4
  %1023 = load i64, ptr %r3, align 4
  %1024 = load i64, ptr %r2, align 4
  %1025 = or i64 %1023, %1024
  store i64 %1025, ptr %r3, align 4
  %1026 = load i64, ptr %r7, align 4
  %1027 = add i64 %1026, 16
  store i64 %1027, ptr %r7, align 4
  %1028 = load i64, ptr %r3, align 4
  %1029 = mul i64 %1028, -1640531535
  store i64 %1029, ptr %r3, align 4
  %1030 = load i64, ptr %r6, align 4
  %1031 = mul i64 %1030, -1640531535
  store i64 %1031, ptr %r6, align 4
  %1032 = load i64, ptr %r0, align 4
  %1033 = mul i64 %1032, -1640531535
  store i64 %1033, ptr %r0, align 4
  %1034 = load i64, ptr %r1, align 4
  %1035 = mul i64 %1034, -1640531535
  store i64 %1035, ptr %r1, align 4
  %1036 = load i64, ptr %r5, align 4
  %1037 = add i64 %1036, -16
  store i64 %1037, ptr %r5, align 4
  %1038 = load i64, ptr %r5, align 4
  store i64 %1038, ptr %r2, align 4
  %1039 = load i64, ptr %r2, align 4
  %1040 = shl i64 %1039, 32
  store i64 %1040, ptr %r2, align 4
  %1041 = load i64, ptr %r2, align 4
  %1042 = lshr i64 %1041, 32
  store i64 %1042, ptr %r2, align 4
  %1043 = load i64, ptr %r3, align 4
  store i64 %1043, ptr %r4, align 4
  %1044 = load i64, ptr %r2, align 4
  %1045 = icmp ugt i64 %1044, 15
  br i1 %1045, label %bb_inst_401, label %bb_inst_484

bb_inst_484:                                      ; preds = %bb_inst_401
  store i64 4261412864, ptr %r2, align 4
  %1046 = load i64, ptr %r0, align 4
  store i64 %1046, ptr %r4, align 4
  %1047 = load i64, ptr %r4, align 4
  %1048 = load i64, ptr %r2, align 4
  %1049 = and i64 %1047, %1048
  store i64 %1049, ptr %r4, align 4
  %1050 = load i64, ptr %r4, align 4
  %1051 = lshr i64 %1050, 25
  store i64 %1051, ptr %r4, align 4
  %1052 = load i64, ptr %r0, align 4
  %1053 = shl i64 %1052, 7
  store i64 %1053, ptr %r0, align 4
  %1054 = load i64, ptr %r0, align 4
  %1055 = load i64, ptr %r4, align 4
  %1056 = or i64 %1054, %1055
  store i64 %1056, ptr %r0, align 4
  store i64 2147483648, ptr %r2, align 4
  %1057 = load i64, ptr %r1, align 4
  store i64 %1057, ptr %r4, align 4
  %1058 = load i64, ptr %r4, align 4
  %1059 = load i64, ptr %r2, align 4
  %1060 = and i64 %1058, %1059
  store i64 %1060, ptr %r4, align 4
  %1061 = load i64, ptr %r4, align 4
  %1062 = lshr i64 %1061, 31
  store i64 %1062, ptr %r4, align 4
  %1063 = load i64, ptr %r1, align 4
  %1064 = shl i64 %1063, 1
  store i64 %1064, ptr %r1, align 4
  %1065 = load i64, ptr %r1, align 4
  %1066 = load i64, ptr %r4, align 4
  %1067 = or i64 %1065, %1066
  store i64 %1067, ptr %r1, align 4
  %1068 = load i64, ptr %r1, align 4
  %1069 = load i64, ptr %r0, align 4
  %1070 = add i64 %1068, %1069
  store i64 %1070, ptr %r1, align 4
  store i64 4293918720, ptr %r2, align 4
  %1071 = load i64, ptr %r6, align 4
  store i64 %1071, ptr %r4, align 4
  %1072 = load i64, ptr %r4, align 4
  %1073 = load i64, ptr %r2, align 4
  %1074 = and i64 %1072, %1073
  store i64 %1074, ptr %r4, align 4
  %1075 = load i64, ptr %r4, align 4
  %1076 = lshr i64 %1075, 20
  store i64 %1076, ptr %r4, align 4
  %1077 = load i64, ptr %r6, align 4
  %1078 = shl i64 %1077, 12
  store i64 %1078, ptr %r6, align 4
  %1079 = load i64, ptr %r6, align 4
  %1080 = load i64, ptr %r4, align 4
  %1081 = or i64 %1079, %1080
  store i64 %1081, ptr %r6, align 4
  %1082 = load i64, ptr %r1, align 4
  %1083 = load i64, ptr %r6, align 4
  %1084 = add i64 %1082, %1083
  store i64 %1084, ptr %r1, align 4
  store i64 4294950912, ptr %r2, align 4
  %1085 = load i64, ptr %r3, align 4
  store i64 %1085, ptr %r4, align 4
  %1086 = load i64, ptr %r4, align 4
  %1087 = load i64, ptr %r2, align 4
  %1088 = and i64 %1086, %1087
  store i64 %1088, ptr %r4, align 4
  %1089 = load i64, ptr %r4, align 4
  %1090 = lshr i64 %1089, 14
  store i64 %1090, ptr %r4, align 4
  %1091 = load i64, ptr %r3, align 4
  %1092 = shl i64 %1091, 18
  store i64 %1092, ptr %r3, align 4
  %1093 = load i64, ptr %r3, align 4
  %1094 = load i64, ptr %r4, align 4
  %1095 = or i64 %1093, %1094
  store i64 %1095, ptr %r3, align 4
  %1096 = load i64, ptr %r1, align 4
  %1097 = load i64, ptr %r3, align 4
  %1098 = add i64 %1096, %1097
  store i64 %1098, ptr %r1, align 4
  store i64 12, ptr %r0, align 4
  %1099 = load i64, ptr %r1, align 4
  %1100 = add i64 %1099, 60
  store i64 %1100, ptr %r1, align 4
  store i64 4, ptr %r3, align 4
  store i64 4294934528, ptr %r4, align 4
  store i64 4292870144, ptr %r5, align 4
  %1101 = load ptr, ptr %r10, align 8
  %1102 = getelementptr i8, ptr %1101, i64 -64
  %1103 = load i64, ptr %1102, align 4
  store i64 %1103, ptr %r8, align 4
  %1104 = load ptr, ptr %r10, align 8
  %1105 = getelementptr i8, ptr %1104, i64 -72
  %1106 = load i64, ptr %1105, align 4
  store i64 %1106, ptr %r9, align 4
  br label %bb_inst_524

bb_inst_524:                                      ; preds = %bb_inst_549, %bb_inst_484
  %1107 = load i64, ptr %r0, align 4
  store i64 %1107, ptr %r2, align 4
  %1108 = load i64, ptr %r2, align 4
  %1109 = shl i64 %1108, 32
  store i64 %1109, ptr %r2, align 4
  %1110 = load i64, ptr %r2, align 4
  %1111 = lshr i64 %1110, 32
  store i64 %1111, ptr %r2, align 4
  %1112 = load i64, ptr %r2, align 4
  %1113 = load i64, ptr %r3, align 4
  %1114 = icmp ugt i64 %1113, %1112
  br i1 %1114, label %bb_inst_554, label %bb_inst_528

bb_inst_528:                                      ; preds = %bb_inst_524
  %1115 = load ptr, ptr %r9, align 8
  %1116 = getelementptr i8, ptr %1115, i64 1
  %1117 = load i8, ptr %1116, align 1
  %1118 = zext i8 %1117 to i64
  store i64 %1118, ptr %r2, align 4
  %1119 = load i64, ptr %r2, align 4
  %1120 = shl i64 %1119, 8
  store i64 %1120, ptr %r2, align 4
  %1121 = load ptr, ptr %r9, align 8
  %1122 = getelementptr i8, ptr %1121, i64 0
  %1123 = load i8, ptr %1122, align 1
  %1124 = zext i8 %1123 to i64
  store i64 %1124, ptr %r6, align 4
  %1125 = load i64, ptr %r2, align 4
  %1126 = load i64, ptr %r6, align 4
  %1127 = or i64 %1125, %1126
  store i64 %1127, ptr %r2, align 4
  %1128 = load ptr, ptr %r9, align 8
  %1129 = getelementptr i8, ptr %1128, i64 2
  %1130 = load i8, ptr %1129, align 1
  %1131 = zext i8 %1130 to i64
  store i64 %1131, ptr %r6, align 4
  %1132 = load i64, ptr %r6, align 4
  %1133 = shl i64 %1132, 16
  store i64 %1133, ptr %r6, align 4
  %1134 = load i64, ptr %r2, align 4
  %1135 = load i64, ptr %r6, align 4
  %1136 = or i64 %1134, %1135
  store i64 %1136, ptr %r2, align 4
  %1137 = load ptr, ptr %r9, align 8
  %1138 = getelementptr i8, ptr %1137, i64 3
  %1139 = load i8, ptr %1138, align 1
  %1140 = zext i8 %1139 to i64
  store i64 %1140, ptr %r6, align 4
  %1141 = load i64, ptr %r6, align 4
  %1142 = shl i64 %1141, 24
  store i64 %1142, ptr %r6, align 4
  %1143 = load i64, ptr %r2, align 4
  %1144 = load i64, ptr %r6, align 4
  %1145 = or i64 %1143, %1144
  store i64 %1145, ptr %r2, align 4
  %1146 = load i64, ptr %r2, align 4
  %1147 = mul i64 %1146, -1028477379
  store i64 %1147, ptr %r2, align 4
  %1148 = load i64, ptr %r2, align 4
  %1149 = load i64, ptr %r1, align 4
  %1150 = add i64 %1148, %1149
  store i64 %1150, ptr %r2, align 4
  %1151 = load i64, ptr %r2, align 4
  store i64 %1151, ptr %r1, align 4
  %1152 = load i64, ptr %r1, align 4
  %1153 = load i64, ptr %r4, align 4
  %1154 = and i64 %1152, %1153
  store i64 %1154, ptr %r1, align 4
  %1155 = load i64, ptr %r2, align 4
  %1156 = shl i64 %1155, 17
  store i64 %1156, ptr %r2, align 4
  %1157 = load i64, ptr %r1, align 4
  %1158 = lshr i64 %1157, 15
  store i64 %1158, ptr %r1, align 4
  %1159 = load i64, ptr %r2, align 4
  %1160 = load i64, ptr %r1, align 4
  %1161 = or i64 %1159, %1160
  store i64 %1161, ptr %r2, align 4
  store i64 4294967292, ptr %r6, align 4
  store i64 4, ptr %r7, align 4
  %1162 = load i64, ptr %r2, align 4
  %1163 = mul i64 %1162, 668265263
  store i64 %1163, ptr %r2, align 4
  br label %bb_inst_549

bb_inst_549:                                      ; preds = %bb_inst_555, %bb_inst_528
  %1164 = load i64, ptr %r2, align 4
  store i64 %1164, ptr %r1, align 4
  %1165 = load i64, ptr %r6, align 4
  %1166 = load i64, ptr %r0, align 4
  %1167 = add i64 %1165, %1166
  store i64 %1167, ptr %r6, align 4
  %1168 = load i64, ptr %r9, align 4
  %1169 = load i64, ptr %r7, align 4
  %1170 = add i64 %1168, %1169
  store i64 %1170, ptr %r9, align 4
  %1171 = load i64, ptr %r6, align 4
  store i64 %1171, ptr %r0, align 4
  br label %bb_inst_524

bb_inst_554:                                      ; preds = %bb_inst_524
  %1172 = load i64, ptr %r2, align 4
  %1173 = icmp eq i64 %1172, 0
  br i1 %1173, label %bb_inst_568, label %bb_inst_555

bb_inst_555:                                      ; preds = %bb_inst_554
  %1174 = load ptr, ptr %r9, align 8
  %1175 = getelementptr i8, ptr %1174, i64 0
  %1176 = load i8, ptr %1175, align 1
  %1177 = zext i8 %1176 to i64
  store i64 %1177, ptr %r2, align 4
  %1178 = load i64, ptr %r2, align 4
  %1179 = mul i64 %1178, 374761393
  store i64 %1179, ptr %r2, align 4
  %1180 = load i64, ptr %r2, align 4
  %1181 = load i64, ptr %r1, align 4
  %1182 = add i64 %1180, %1181
  store i64 %1182, ptr %r2, align 4
  %1183 = load i64, ptr %r2, align 4
  store i64 %1183, ptr %r1, align 4
  %1184 = load i64, ptr %r1, align 4
  %1185 = load i64, ptr %r5, align 4
  %1186 = and i64 %1184, %1185
  store i64 %1186, ptr %r1, align 4
  %1187 = load i64, ptr %r2, align 4
  %1188 = shl i64 %1187, 11
  store i64 %1188, ptr %r2, align 4
  %1189 = load i64, ptr %r1, align 4
  %1190 = lshr i64 %1189, 21
  store i64 %1190, ptr %r1, align 4
  %1191 = load i64, ptr %r2, align 4
  %1192 = load i64, ptr %r1, align 4
  %1193 = or i64 %1191, %1192
  store i64 %1193, ptr %r2, align 4
  store i64 4294967295, ptr %r6, align 4
  store i64 1, ptr %r7, align 4
  %1194 = load i64, ptr %r2, align 4
  %1195 = mul i64 %1194, -1640531535
  store i64 %1195, ptr %r2, align 4
  br label %bb_inst_549

bb_inst_568:                                      ; preds = %bb_inst_554
  store i64 4294934528, ptr %r2, align 4
  %1196 = load i64, ptr %r1, align 4
  store i64 %1196, ptr %r3, align 4
  %1197 = load i64, ptr %r3, align 4
  %1198 = load i64, ptr %r2, align 4
  %1199 = and i64 %1197, %1198
  store i64 %1199, ptr %r3, align 4
  %1200 = load i64, ptr %r3, align 4
  %1201 = lshr i64 %1200, 15
  store i64 %1201, ptr %r3, align 4
  %1202 = load i64, ptr %r3, align 4
  %1203 = load i64, ptr %r1, align 4
  %1204 = xor i64 %1202, %1203
  store i64 %1204, ptr %r3, align 4
  %1205 = load i64, ptr %r3, align 4
  %1206 = mul i64 %1205, -2048144777
  store i64 %1206, ptr %r3, align 4
  store i64 4294959104, ptr %r2, align 4
  %1207 = load i64, ptr %r3, align 4
  store i64 %1207, ptr %r1, align 4
  %1208 = load i64, ptr %r1, align 4
  %1209 = load i64, ptr %r2, align 4
  %1210 = and i64 %1208, %1209
  store i64 %1210, ptr %r1, align 4
  %1211 = load i64, ptr %r1, align 4
  %1212 = lshr i64 %1211, 13
  store i64 %1212, ptr %r1, align 4
  %1213 = load i64, ptr %r1, align 4
  %1214 = load i64, ptr %r3, align 4
  %1215 = xor i64 %1213, %1214
  store i64 %1215, ptr %r1, align 4
  %1216 = load ptr, ptr %r10, align 8
  %1217 = getelementptr i8, ptr %1216, i64 -48
  %1218 = load i64, ptr %1217, align 4
  store i64 %1218, ptr %r3, align 4
  %1219 = load i64, ptr %r3, align 4
  store i64 %1219, ptr %r2, align 4
  %1220 = load i64, ptr %r2, align 4
  %1221 = lshr i64 %1220, 24
  store i64 %1221, ptr %r2, align 4
  %1222 = load i64, ptr %r2, align 4
  %1223 = trunc i64 %1222 to i8
  %1224 = load ptr, ptr %r8, align 8
  %1225 = getelementptr i8, ptr %1224, i64 37
  store i8 %1223, ptr %1225, align 1
  %1226 = load i64, ptr %r3, align 4
  store i64 %1226, ptr %r2, align 4
  %1227 = load i64, ptr %r2, align 4
  %1228 = lshr i64 %1227, 16
  store i64 %1228, ptr %r2, align 4
  %1229 = load i64, ptr %r2, align 4
  %1230 = trunc i64 %1229 to i8
  %1231 = load ptr, ptr %r8, align 8
  %1232 = getelementptr i8, ptr %1231, i64 36
  store i8 %1230, ptr %1232, align 1
  %1233 = load i64, ptr %r3, align 4
  %1234 = trunc i64 %1233 to i8
  %1235 = load ptr, ptr %r8, align 8
  %1236 = getelementptr i8, ptr %1235, i64 34
  store i8 %1234, ptr %1236, align 1
  %1237 = load i64, ptr %r3, align 4
  %1238 = lshr i64 %1237, 8
  store i64 %1238, ptr %r3, align 4
  %1239 = load i64, ptr %r3, align 4
  %1240 = trunc i64 %1239 to i8
  %1241 = load ptr, ptr %r8, align 8
  %1242 = getelementptr i8, ptr %1241, i64 35
  store i8 %1240, ptr %1242, align 1
  %1243 = load i64, ptr %r1, align 4
  %1244 = mul i64 %1243, -1028477379
  store i64 %1244, ptr %r1, align 4
  %1245 = load i64, ptr %r1, align 4
  store i64 %1245, ptr %r2, align 4
  %1246 = load i64, ptr %r2, align 4
  %1247 = lshr i64 %1246, 24
  store i64 %1247, ptr %r2, align 4
  %1248 = load i64, ptr %r2, align 4
  %1249 = trunc i64 %1248 to i8
  %1250 = load ptr, ptr %r8, align 8
  %1251 = getelementptr i8, ptr %1250, i64 41
  store i8 %1249, ptr %1251, align 1
  %1252 = load i64, ptr %r1, align 4
  store i64 %1252, ptr %r2, align 4
  %1253 = load i64, ptr %r2, align 4
  %1254 = lshr i64 %1253, 16
  store i64 %1254, ptr %r2, align 4
  %1255 = load i64, ptr %r2, align 4
  %1256 = trunc i64 %1255 to i8
  %1257 = load ptr, ptr %r8, align 8
  %1258 = getelementptr i8, ptr %1257, i64 40
  store i8 %1256, ptr %1258, align 1
  store i64 4294901760, ptr %r2, align 4
  %1259 = load i64, ptr %r1, align 4
  store i64 %1259, ptr %r3, align 4
  %1260 = load i64, ptr %r3, align 4
  %1261 = load i64, ptr %r2, align 4
  %1262 = and i64 %1260, %1261
  store i64 %1262, ptr %r3, align 4
  %1263 = load i64, ptr %r3, align 4
  %1264 = lshr i64 %1263, 16
  store i64 %1264, ptr %r3, align 4
  %1265 = load i64, ptr %r3, align 4
  %1266 = load i64, ptr %r1, align 4
  %1267 = xor i64 %1265, %1266
  store i64 %1267, ptr %r3, align 4
  %1268 = load i64, ptr %r3, align 4
  %1269 = trunc i64 %1268 to i8
  %1270 = load ptr, ptr %r8, align 8
  %1271 = getelementptr i8, ptr %1270, i64 38
  store i8 %1269, ptr %1271, align 1
  %1272 = load i64, ptr %r3, align 4
  %1273 = lshr i64 %1272, 8
  store i64 %1273, ptr %r3, align 4
  %1274 = load i64, ptr %r3, align 4
  %1275 = trunc i64 %1274 to i8
  %1276 = load ptr, ptr %r8, align 8
  %1277 = getelementptr i8, ptr %1276, i64 39
  store i8 %1275, ptr %1277, align 1
  store i64 3, ptr %r7, align 4
  br label %bb_inst_37

exitBlock:                                        ; preds = %bb_inst_37
  %1278 = load i64, ptr %r0, align 4
  ret i64 %1278

localFuncReturnBlock:                             ; preds = %bb_inst_37
  %1279 = load i64, ptr %callItemCnt, align 4
  %1280 = sub i64 %1279, 1
  %1281 = getelementptr ptr, ptr %callStack, i64 %1280
  %1282 = load ptr, ptr %1281, align 8
  %1283 = sub i64 %1279, 2
  %1284 = getelementptr i64, ptr %callStack, i64 %1283
  %1285 = load i64, ptr %1284, align 4
  store i64 %1285, ptr %r6, align 4
  %1286 = sub i64 %1279, 3
  %1287 = getelementptr i64, ptr %callStack, i64 %1286
  %1288 = load i64, ptr %1287, align 4
  store i64 %1288, ptr %r7, align 4
  %1289 = sub i64 %1279, 4
  %1290 = getelementptr i64, ptr %callStack, i64 %1289
  %1291 = load i64, ptr %1290, align 4
  store i64 %1291, ptr %r8, align 4
  %1292 = sub i64 %1279, 5
  %1293 = getelementptr i64, ptr %callStack, i64 %1292
  %1294 = load i64, ptr %1293, align 4
  store i64 %1294, ptr %r9, align 4
  %1295 = sub i64 %1279, 5
  store i64 %1295, ptr %callItemCnt, align 4
  %1296 = load i64, ptr %r10, align 4
  %1297 = add i64 %1296, 64
  store i64 %1297, ptr %r10, align 4
  indirectbr ptr %1282, []
}

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64)

declare i64 @__lddw_helper_map_by_fd(i32)

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0028(i64, i64, i64, i64, i64)

attributes #0 = { nofree norecurse nosync nounwind memory(read) uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
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

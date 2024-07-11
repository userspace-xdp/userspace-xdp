; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.llvm_ir/xdp-tcpclassify.bpf.inline.ll'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md_userspace = type { i64, i64, i32, i32, i32, i32, i64, i64 }

declare i64 @__lddw_helper_map_by_fd(i32) local_unnamed_addr

declare i64 @__lddw_helper_map_val(i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0130(i64, i64, i64, i64, i64) local_unnamed_addr

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
  %69 = call i64 @bpf_helper_ext_0189(i64 %3, i64 0, i64 %68, i64 4, i64 undef)
  %70 = call i64 @__lddw_helper_map_by_fd(i32 5)
  %71 = call i64 @__lddw_helper_map_val(i64 %70)
  %72 = call i64 @bpf_helper_ext_0182(i64 %68, i64 4, i64 %71, i64 4, i64 undef)
  %73 = icmp eq i64 %72, 0
  %74 = zext i1 %73 to i32
  %75 = getelementptr inbounds i8, ptr %stackEnd, i64 -268
  store i32 %74, ptr %75, align 4
  br label %bb_inst_72

bb_inst_72:                                       ; preds = %bb_inst_56, %bb_inst_17
  %76 = add i64 %6, 60
  %.not118 = icmp ult i64 %76, %5
  br i1 %.not118, label %bb_inst_75, label %bb_inst_81

bb_inst_75:                                       ; preds = %bb_inst_72
  %77 = add i64 %2, -260
  %78 = call i64 @bpf_helper_ext_0189(i64 %3, i64 0, i64 %77, i64 60, i64 undef)
  br label %bb_inst_81

bb_inst_81:                                       ; preds = %bb_inst_75, %bb_inst_72
  %79 = add i64 %2, -304
  %80 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %81 = call i64 @_bpf_helper_ext_0130(i64 %80, i64 %79, i64 300, i64 0, i64 undef)
  %82 = load i16, ptr %9, align 2
  %83 = getelementptr i8, ptr %9, i64 6
  %84 = load i16, ptr %83, align 2
  store i16 %84, ptr %9, align 2
  %85 = getelementptr i8, ptr %9, i64 2
  %86 = load i16, ptr %85, align 2
  %87 = getelementptr i8, ptr %9, i64 8
  %88 = load i16, ptr %87, align 2
  store i16 %88, ptr %85, align 2
  %89 = getelementptr i8, ptr %9, i64 4
  %90 = load i16, ptr %89, align 2
  %91 = getelementptr i8, ptr %9, i64 10
  %92 = load i16, ptr %91, align 2
  store i16 %92, ptr %89, align 2
  store i16 %82, ptr %83, align 2
  store i16 %86, ptr %87, align 2
  store i16 %90, ptr %91, align 2
  br label %bb_inst_101

bb_inst_101:                                      ; preds = %bb_inst_81, %bb_inst_12, %bb_inst_9, %bb_inst_7, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_7 ], [ 2, %bb_inst_9 ], [ 2, %bb_inst_12 ], [ 3, %bb_inst_81 ]
  ret i64 %r0.0
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #0

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i64 @bpf_helper_ext_0189(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) local_unnamed_addr #1 {
  %5 = inttoptr i64 %0 to ptr
  %6 = getelementptr inbounds %struct.xdp_md_userspace, ptr %5, i64 0, i32 0
  %7 = load i64, ptr %6, align 8, !tbaa !5
  %8 = add i64 %7, %1
  %9 = inttoptr i64 %2 to ptr
  %10 = inttoptr i64 %8 to ptr
  %11 = icmp eq i64 %3, 0
  br i1 %11, label %136, label %12

12:                                               ; preds = %4
  %13 = icmp ult i64 %3, 8
  br i1 %13, label %118, label %14

14:                                               ; preds = %12
  %15 = getelementptr i8, ptr %9, i64 %3
  %16 = getelementptr i8, ptr %10, i64 %3
  %17 = icmp ugt ptr %16, %9
  %18 = icmp ugt ptr %15, %10
  %19 = and i1 %17, %18
  br i1 %19, label %118, label %20

20:                                               ; preds = %14
  %21 = icmp ult i64 %3, 32
  br i1 %21, label %104, label %22

22:                                               ; preds = %20
  %23 = and i64 %3, -32
  %24 = add i64 %23, -32
  %25 = lshr exact i64 %24, 5
  %26 = add nuw nsw i64 %25, 1
  %27 = and i64 %26, 3
  %28 = icmp ult i64 %24, 96
  br i1 %28, label %80, label %29

29:                                               ; preds = %22
  %30 = and i64 %26, 1152921504606846972
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi i64 [ 0, %29 ], [ %77, %31 ]
  %33 = phi i64 [ 0, %29 ], [ %78, %31 ]
  %34 = getelementptr inbounds i8, ptr %10, i64 %32
  %35 = bitcast ptr %34 to ptr
  %36 = load <16 x i8>, ptr %35, align 1, !tbaa !11, !alias.scope !12
  %37 = getelementptr inbounds i8, ptr %34, i64 16
  %38 = bitcast ptr %37 to ptr
  %39 = load <16 x i8>, ptr %38, align 1, !tbaa !11, !alias.scope !12
  %40 = getelementptr inbounds i8, ptr %9, i64 %32
  %41 = bitcast ptr %40 to ptr
  store <16 x i8> %36, ptr %41, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %42 = getelementptr inbounds i8, ptr %40, i64 16
  %43 = bitcast ptr %42 to ptr
  store <16 x i8> %39, ptr %43, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %44 = or i64 %32, 32
  %45 = getelementptr inbounds i8, ptr %10, i64 %44
  %46 = bitcast ptr %45 to ptr
  %47 = load <16 x i8>, ptr %46, align 1, !tbaa !11, !alias.scope !12
  %48 = getelementptr inbounds i8, ptr %45, i64 16
  %49 = bitcast ptr %48 to ptr
  %50 = load <16 x i8>, ptr %49, align 1, !tbaa !11, !alias.scope !12
  %51 = getelementptr inbounds i8, ptr %9, i64 %44
  %52 = bitcast ptr %51 to ptr
  store <16 x i8> %47, ptr %52, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %53 = getelementptr inbounds i8, ptr %51, i64 16
  %54 = bitcast ptr %53 to ptr
  store <16 x i8> %50, ptr %54, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %55 = or i64 %32, 64
  %56 = getelementptr inbounds i8, ptr %10, i64 %55
  %57 = bitcast ptr %56 to ptr
  %58 = load <16 x i8>, ptr %57, align 1, !tbaa !11, !alias.scope !12
  %59 = getelementptr inbounds i8, ptr %56, i64 16
  %60 = bitcast ptr %59 to ptr
  %61 = load <16 x i8>, ptr %60, align 1, !tbaa !11, !alias.scope !12
  %62 = getelementptr inbounds i8, ptr %9, i64 %55
  %63 = bitcast ptr %62 to ptr
  store <16 x i8> %58, ptr %63, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %64 = getelementptr inbounds i8, ptr %62, i64 16
  %65 = bitcast ptr %64 to ptr
  store <16 x i8> %61, ptr %65, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %66 = or i64 %32, 96
  %67 = getelementptr inbounds i8, ptr %10, i64 %66
  %68 = bitcast ptr %67 to ptr
  %69 = load <16 x i8>, ptr %68, align 1, !tbaa !11, !alias.scope !12
  %70 = getelementptr inbounds i8, ptr %67, i64 16
  %71 = bitcast ptr %70 to ptr
  %72 = load <16 x i8>, ptr %71, align 1, !tbaa !11, !alias.scope !12
  %73 = getelementptr inbounds i8, ptr %9, i64 %66
  %74 = bitcast ptr %73 to ptr
  store <16 x i8> %69, ptr %74, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %75 = getelementptr inbounds i8, ptr %73, i64 16
  %76 = bitcast ptr %75 to ptr
  store <16 x i8> %72, ptr %76, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %77 = add nuw i64 %32, 128
  %78 = add i64 %33, 4
  %79 = icmp eq i64 %78, %30
  br i1 %79, label %80, label %31, !llvm.loop !17

80:                                               ; preds = %31, %22
  %81 = phi i64 [ 0, %22 ], [ %77, %31 ]
  %82 = icmp eq i64 %27, 0
  br i1 %82, label %99, label %83

83:                                               ; preds = %83, %80
  %84 = phi i64 [ %96, %83 ], [ %81, %80 ]
  %85 = phi i64 [ %97, %83 ], [ 0, %80 ]
  %86 = getelementptr inbounds i8, ptr %10, i64 %84
  %87 = bitcast ptr %86 to ptr
  %88 = load <16 x i8>, ptr %87, align 1, !tbaa !11, !alias.scope !12
  %89 = getelementptr inbounds i8, ptr %86, i64 16
  %90 = bitcast ptr %89 to ptr
  %91 = load <16 x i8>, ptr %90, align 1, !tbaa !11, !alias.scope !12
  %92 = getelementptr inbounds i8, ptr %9, i64 %84
  %93 = bitcast ptr %92 to ptr
  store <16 x i8> %88, ptr %93, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %94 = getelementptr inbounds i8, ptr %92, i64 16
  %95 = bitcast ptr %94 to ptr
  store <16 x i8> %91, ptr %95, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %96 = add nuw i64 %84, 32
  %97 = add i64 %85, 1
  %98 = icmp eq i64 %97, %27
  br i1 %98, label %99, label %83, !llvm.loop !20

99:                                               ; preds = %83, %80
  %100 = icmp eq i64 %23, %3
  br i1 %100, label %136, label %101

101:                                              ; preds = %99
  %102 = and i64 %3, 24
  %103 = icmp eq i64 %102, 0
  br i1 %103, label %118, label %104

104:                                              ; preds = %101, %20
  %105 = phi i64 [ %23, %101 ], [ 0, %20 ]
  %106 = and i64 %3, -8
  br label %107

107:                                              ; preds = %107, %104
  %108 = phi i64 [ %105, %104 ], [ %114, %107 ]
  %109 = getelementptr inbounds i8, ptr %10, i64 %108
  %110 = bitcast ptr %109 to ptr
  %111 = load <8 x i8>, ptr %110, align 1, !tbaa !11
  %112 = getelementptr inbounds i8, ptr %9, i64 %108
  %113 = bitcast ptr %112 to ptr
  store <8 x i8> %111, ptr %113, align 1, !tbaa !11
  %114 = add nuw i64 %108, 8
  %115 = icmp eq i64 %114, %106
  br i1 %115, label %116, label %107, !llvm.loop !22

116:                                              ; preds = %107
  %117 = icmp eq i64 %106, %3
  br i1 %117, label %136, label %118

118:                                              ; preds = %116, %101, %14, %12
  %119 = phi i64 [ 0, %12 ], [ 0, %14 ], [ %23, %101 ], [ %106, %116 ]
  %120 = xor i64 %119, -1
  %121 = add i64 %120, %3
  %122 = and i64 %3, 3
  %123 = icmp eq i64 %122, 0
  br i1 %123, label %133, label %124

124:                                              ; preds = %124, %118
  %125 = phi i64 [ %130, %124 ], [ %119, %118 ]
  %126 = phi i64 [ %131, %124 ], [ 0, %118 ]
  %127 = getelementptr inbounds i8, ptr %10, i64 %125
  %128 = load i8, ptr %127, align 1, !tbaa !11
  %129 = getelementptr inbounds i8, ptr %9, i64 %125
  store i8 %128, ptr %129, align 1, !tbaa !11
  %130 = add nuw i64 %125, 1
  %131 = add i64 %126, 1
  %132 = icmp eq i64 %131, %122
  br i1 %132, label %133, label %124, !llvm.loop !24

133:                                              ; preds = %124, %118
  %134 = phi i64 [ %119, %118 ], [ %130, %124 ]
  %135 = icmp ult i64 %121, 3
  br i1 %135, label %136, label %137

136:                                              ; preds = %137, %133, %116, %99, %4
  ret i64 0

137:                                              ; preds = %137, %133
  %138 = phi i64 [ %154, %137 ], [ %134, %133 ]
  %139 = getelementptr inbounds i8, ptr %10, i64 %138
  %140 = load i8, ptr %139, align 1, !tbaa !11
  %141 = getelementptr inbounds i8, ptr %9, i64 %138
  store i8 %140, ptr %141, align 1, !tbaa !11
  %142 = add nuw i64 %138, 1
  %143 = getelementptr inbounds i8, ptr %10, i64 %142
  %144 = load i8, ptr %143, align 1, !tbaa !11
  %145 = getelementptr inbounds i8, ptr %9, i64 %142
  store i8 %144, ptr %145, align 1, !tbaa !11
  %146 = add nuw i64 %138, 2
  %147 = getelementptr inbounds i8, ptr %10, i64 %146
  %148 = load i8, ptr %147, align 1, !tbaa !11
  %149 = getelementptr inbounds i8, ptr %9, i64 %146
  store i8 %148, ptr %149, align 1, !tbaa !11
  %150 = add nuw i64 %138, 3
  %151 = getelementptr inbounds i8, ptr %10, i64 %150
  %152 = load i8, ptr %151, align 1, !tbaa !11
  %153 = getelementptr inbounds i8, ptr %9, i64 %150
  store i8 %152, ptr %153, align 1, !tbaa !11
  %154 = add nuw i64 %138, 4
  %155 = icmp eq i64 %154, %3
  br i1 %155, label %136, label %137, !llvm.loop !25
}

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i64 @bpf_helper_ext_0182(i64 noundef %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #2 {
  %4 = inttoptr i64 %0 to ptr
  %5 = inttoptr i64 %2 to ptr
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %25, label %9

7:                                                ; preds = %9
  %8 = icmp eq i64 %20, %1
  br i1 %8, label %25, label %9, !llvm.loop !26

9:                                                ; preds = %7, %3
  %10 = phi i64 [ %20, %7 ], [ 0, %3 ]
  %11 = getelementptr inbounds i8, ptr %4, i64 %10
  %12 = load i8, ptr %11, align 1, !tbaa !11
  %13 = getelementptr inbounds i8, ptr %5, i64 %10
  %14 = load i8, ptr %13, align 1, !tbaa !11
  %15 = icmp ne i8 %12, %14
  %16 = icmp eq i8 %12, 0
  %17 = or i1 %16, %15
  %18 = icmp eq i8 %14, 0
  %19 = or i1 %18, %17
  %20 = add nuw i64 %10, 1
  br i1 %19, label %21, label %7

21:                                               ; preds = %9
  %22 = zext i8 %12 to i64
  %23 = zext i8 %14 to i64
  %24 = sub nsw i64 %22, %23
  br label %25

25:                                               ; preds = %21, %7, %3
  %26 = phi i64 [ %24, %21 ], [ 0, %3 ], [ 0, %7 ]
  ret i64 %26
}

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !7, i64 0}
!6 = !{!"xdp_md_userspace", !7, i64 0, !7, i64 8, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !7, i64 32, !7, i64 40}
!7 = !{!"long long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!8, !8, i64 0}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !18, !19}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !18, !19, !23}
!23 = !{!"llvm.loop.unroll.runtime.disable"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !18, !19}
!26 = distinct !{!26, !18}

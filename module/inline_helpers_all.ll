; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/module/inline_helpers_all.c'
source_filename = "/home/yunwei/ebpf-xdp-dpdk/module/inline_helpers_all.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md_userspace = type { i64, i64, i32, i32, i32, i32, i64, i64 }

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i64 @bpf_helper_ext_0189(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) local_unnamed_addr #0 {
  %5 = inttoptr i64 %0 to %struct.xdp_md_userspace*
  %6 = getelementptr inbounds %struct.xdp_md_userspace, %struct.xdp_md_userspace* %5, i64 0, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !5
  %8 = add i64 %7, %1
  %9 = inttoptr i64 %2 to i8*
  %10 = inttoptr i64 %8 to i8*
  %11 = icmp eq i64 %3, 0
  br i1 %11, label %136, label %12

12:                                               ; preds = %4
  %13 = icmp ult i64 %3, 8
  br i1 %13, label %118, label %14

14:                                               ; preds = %12
  %15 = getelementptr i8, i8* %9, i64 %3
  %16 = getelementptr i8, i8* %10, i64 %3
  %17 = icmp ugt i8* %16, %9
  %18 = icmp ugt i8* %15, %10
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
  %34 = getelementptr inbounds i8, i8* %10, i64 %32
  %35 = bitcast i8* %34 to <16 x i8>*
  %36 = load <16 x i8>, <16 x i8>* %35, align 1, !tbaa !11, !alias.scope !12
  %37 = getelementptr inbounds i8, i8* %34, i64 16
  %38 = bitcast i8* %37 to <16 x i8>*
  %39 = load <16 x i8>, <16 x i8>* %38, align 1, !tbaa !11, !alias.scope !12
  %40 = getelementptr inbounds i8, i8* %9, i64 %32
  %41 = bitcast i8* %40 to <16 x i8>*
  store <16 x i8> %36, <16 x i8>* %41, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %42 = getelementptr inbounds i8, i8* %40, i64 16
  %43 = bitcast i8* %42 to <16 x i8>*
  store <16 x i8> %39, <16 x i8>* %43, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %44 = or i64 %32, 32
  %45 = getelementptr inbounds i8, i8* %10, i64 %44
  %46 = bitcast i8* %45 to <16 x i8>*
  %47 = load <16 x i8>, <16 x i8>* %46, align 1, !tbaa !11, !alias.scope !12
  %48 = getelementptr inbounds i8, i8* %45, i64 16
  %49 = bitcast i8* %48 to <16 x i8>*
  %50 = load <16 x i8>, <16 x i8>* %49, align 1, !tbaa !11, !alias.scope !12
  %51 = getelementptr inbounds i8, i8* %9, i64 %44
  %52 = bitcast i8* %51 to <16 x i8>*
  store <16 x i8> %47, <16 x i8>* %52, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %53 = getelementptr inbounds i8, i8* %51, i64 16
  %54 = bitcast i8* %53 to <16 x i8>*
  store <16 x i8> %50, <16 x i8>* %54, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %55 = or i64 %32, 64
  %56 = getelementptr inbounds i8, i8* %10, i64 %55
  %57 = bitcast i8* %56 to <16 x i8>*
  %58 = load <16 x i8>, <16 x i8>* %57, align 1, !tbaa !11, !alias.scope !12
  %59 = getelementptr inbounds i8, i8* %56, i64 16
  %60 = bitcast i8* %59 to <16 x i8>*
  %61 = load <16 x i8>, <16 x i8>* %60, align 1, !tbaa !11, !alias.scope !12
  %62 = getelementptr inbounds i8, i8* %9, i64 %55
  %63 = bitcast i8* %62 to <16 x i8>*
  store <16 x i8> %58, <16 x i8>* %63, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %64 = getelementptr inbounds i8, i8* %62, i64 16
  %65 = bitcast i8* %64 to <16 x i8>*
  store <16 x i8> %61, <16 x i8>* %65, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %66 = or i64 %32, 96
  %67 = getelementptr inbounds i8, i8* %10, i64 %66
  %68 = bitcast i8* %67 to <16 x i8>*
  %69 = load <16 x i8>, <16 x i8>* %68, align 1, !tbaa !11, !alias.scope !12
  %70 = getelementptr inbounds i8, i8* %67, i64 16
  %71 = bitcast i8* %70 to <16 x i8>*
  %72 = load <16 x i8>, <16 x i8>* %71, align 1, !tbaa !11, !alias.scope !12
  %73 = getelementptr inbounds i8, i8* %9, i64 %66
  %74 = bitcast i8* %73 to <16 x i8>*
  store <16 x i8> %69, <16 x i8>* %74, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %75 = getelementptr inbounds i8, i8* %73, i64 16
  %76 = bitcast i8* %75 to <16 x i8>*
  store <16 x i8> %72, <16 x i8>* %76, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %77 = add nuw i64 %32, 128
  %78 = add i64 %33, 4
  %79 = icmp eq i64 %78, %30
  br i1 %79, label %80, label %31, !llvm.loop !17

80:                                               ; preds = %31, %22
  %81 = phi i64 [ 0, %22 ], [ %77, %31 ]
  %82 = icmp eq i64 %27, 0
  br i1 %82, label %99, label %83

83:                                               ; preds = %80, %83
  %84 = phi i64 [ %96, %83 ], [ %81, %80 ]
  %85 = phi i64 [ %97, %83 ], [ 0, %80 ]
  %86 = getelementptr inbounds i8, i8* %10, i64 %84
  %87 = bitcast i8* %86 to <16 x i8>*
  %88 = load <16 x i8>, <16 x i8>* %87, align 1, !tbaa !11, !alias.scope !12
  %89 = getelementptr inbounds i8, i8* %86, i64 16
  %90 = bitcast i8* %89 to <16 x i8>*
  %91 = load <16 x i8>, <16 x i8>* %90, align 1, !tbaa !11, !alias.scope !12
  %92 = getelementptr inbounds i8, i8* %9, i64 %84
  %93 = bitcast i8* %92 to <16 x i8>*
  store <16 x i8> %88, <16 x i8>* %93, align 1, !tbaa !11, !alias.scope !15, !noalias !12
  %94 = getelementptr inbounds i8, i8* %92, i64 16
  %95 = bitcast i8* %94 to <16 x i8>*
  store <16 x i8> %91, <16 x i8>* %95, align 1, !tbaa !11, !alias.scope !15, !noalias !12
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

104:                                              ; preds = %20, %101
  %105 = phi i64 [ %23, %101 ], [ 0, %20 ]
  %106 = and i64 %3, -8
  br label %107

107:                                              ; preds = %107, %104
  %108 = phi i64 [ %105, %104 ], [ %114, %107 ]
  %109 = getelementptr inbounds i8, i8* %10, i64 %108
  %110 = bitcast i8* %109 to <8 x i8>*
  %111 = load <8 x i8>, <8 x i8>* %110, align 1, !tbaa !11
  %112 = getelementptr inbounds i8, i8* %9, i64 %108
  %113 = bitcast i8* %112 to <8 x i8>*
  store <8 x i8> %111, <8 x i8>* %113, align 1, !tbaa !11
  %114 = add nuw i64 %108, 8
  %115 = icmp eq i64 %114, %106
  br i1 %115, label %116, label %107, !llvm.loop !22

116:                                              ; preds = %107
  %117 = icmp eq i64 %106, %3
  br i1 %117, label %136, label %118

118:                                              ; preds = %14, %12, %101, %116
  %119 = phi i64 [ 0, %12 ], [ 0, %14 ], [ %23, %101 ], [ %106, %116 ]
  %120 = xor i64 %119, -1
  %121 = add i64 %120, %3
  %122 = and i64 %3, 3
  %123 = icmp eq i64 %122, 0
  br i1 %123, label %133, label %124

124:                                              ; preds = %118, %124
  %125 = phi i64 [ %130, %124 ], [ %119, %118 ]
  %126 = phi i64 [ %131, %124 ], [ 0, %118 ]
  %127 = getelementptr inbounds i8, i8* %10, i64 %125
  %128 = load i8, i8* %127, align 1, !tbaa !11
  %129 = getelementptr inbounds i8, i8* %9, i64 %125
  store i8 %128, i8* %129, align 1, !tbaa !11
  %130 = add nuw i64 %125, 1
  %131 = add i64 %126, 1
  %132 = icmp eq i64 %131, %122
  br i1 %132, label %133, label %124, !llvm.loop !24

133:                                              ; preds = %124, %118
  %134 = phi i64 [ %119, %118 ], [ %130, %124 ]
  %135 = icmp ult i64 %121, 3
  br i1 %135, label %136, label %137

136:                                              ; preds = %133, %137, %99, %116, %4
  ret i64 0

137:                                              ; preds = %133, %137
  %138 = phi i64 [ %154, %137 ], [ %134, %133 ]
  %139 = getelementptr inbounds i8, i8* %10, i64 %138
  %140 = load i8, i8* %139, align 1, !tbaa !11
  %141 = getelementptr inbounds i8, i8* %9, i64 %138
  store i8 %140, i8* %141, align 1, !tbaa !11
  %142 = add nuw i64 %138, 1
  %143 = getelementptr inbounds i8, i8* %10, i64 %142
  %144 = load i8, i8* %143, align 1, !tbaa !11
  %145 = getelementptr inbounds i8, i8* %9, i64 %142
  store i8 %144, i8* %145, align 1, !tbaa !11
  %146 = add nuw i64 %138, 2
  %147 = getelementptr inbounds i8, i8* %10, i64 %146
  %148 = load i8, i8* %147, align 1, !tbaa !11
  %149 = getelementptr inbounds i8, i8* %9, i64 %146
  store i8 %148, i8* %149, align 1, !tbaa !11
  %150 = add nuw i64 %138, 3
  %151 = getelementptr inbounds i8, i8* %10, i64 %150
  %152 = load i8, i8* %151, align 1, !tbaa !11
  %153 = getelementptr inbounds i8, i8* %9, i64 %150
  store i8 %152, i8* %153, align 1, !tbaa !11
  %154 = add nuw i64 %138, 4
  %155 = icmp eq i64 %154, %3
  br i1 %155, label %136, label %137, !llvm.loop !25
}

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i64 @bpf_helper_ext_0182(i64 noundef %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #1 {
  %4 = inttoptr i64 %0 to i8*
  %5 = inttoptr i64 %2 to i8*
  %6 = icmp eq i64 %1, 0
  br i1 %6, label %25, label %9

7:                                                ; preds = %9
  %8 = icmp eq i64 %20, %1
  br i1 %8, label %25, label %9, !llvm.loop !26

9:                                                ; preds = %3, %7
  %10 = phi i64 [ %20, %7 ], [ 0, %3 ]
  %11 = getelementptr inbounds i8, i8* %4, i64 %10
  %12 = load i8, i8* %11, align 1, !tbaa !11
  %13 = getelementptr inbounds i8, i8* %5, i64 %10
  %14 = load i8, i8* %13, align 1, !tbaa !11
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

25:                                               ; preds = %7, %3, %21
  %26 = phi i64 [ %24, %21 ], [ 0, %3 ], [ 0, %7 ]
  ret i64 %26
}

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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

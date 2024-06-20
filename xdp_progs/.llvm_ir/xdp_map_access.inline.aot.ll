; ModuleID = 'xdp_map_access.bpf.c'
source_filename = "xdp_map_access.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i32]*, i32*, i32*, [2 x i32]* }
%struct.anon.0 = type { [6 x i32]*, i32*, i64*, [512 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@__ctl_array = dso_local local_unnamed_addr global [2 x i32] zeroinitializer, align 4
@__cntrs_array = dso_local local_unnamed_addr global [512 x i64] zeroinitializer, align 16
@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@ctl_array = dso_local local_unnamed_addr global %struct.anon zeroinitializer, align 8
@cntrs_array = dso_local local_unnamed_addr global %struct.anon.0 zeroinitializer, align 8

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to i64*
  %3 = load i64, i64* %2, align 8, !tbaa !5
  %4 = inttoptr i64 %3 to i8*
  %5 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @__ctl_array, i64 0, i64 0), align 4, !tbaa !11
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %34

7:                                                ; preds = %1
  %8 = getelementptr inbounds i8, i8* %0, i64 8
  %9 = bitcast i8* %8 to i64*
  %10 = load i64, i64* %9, align 8, !tbaa !12
  %11 = inttoptr i64 %10 to i8*
  %12 = load i64, i64* getelementptr inbounds ([512 x i64], [512 x i64]* @__cntrs_array, i64 0, i64 0), align 16, !tbaa !13
  %13 = add i64 %12, 1
  store i64 %13, i64* getelementptr inbounds ([512 x i64], [512 x i64]* @__cntrs_array, i64 0, i64 0), align 16, !tbaa !13
  %14 = getelementptr i8, i8* %4, i64 14
  %15 = icmp ugt i8* %14, %11
  br i1 %15, label %34, label %16

16:                                               ; preds = %7
  %17 = inttoptr i64 %3 to i16*
  %18 = load i16, i16* %17, align 2, !tbaa !14
  %19 = getelementptr inbounds i8, i8* %4, i64 2
  %20 = bitcast i8* %19 to i16*
  %21 = load i16, i16* %20, align 2, !tbaa !14
  %22 = getelementptr inbounds i8, i8* %4, i64 4
  %23 = bitcast i8* %22 to i16*
  %24 = load i16, i16* %23, align 2, !tbaa !14
  %25 = getelementptr inbounds i8, i8* %4, i64 6
  %26 = bitcast i8* %25 to i16*
  %27 = load i16, i16* %26, align 2, !tbaa !14
  store i16 %27, i16* %17, align 2, !tbaa !14
  %28 = getelementptr inbounds i8, i8* %4, i64 8
  %29 = bitcast i8* %28 to i16*
  %30 = load i16, i16* %29, align 2, !tbaa !14
  store i16 %30, i16* %20, align 2, !tbaa !14
  %31 = getelementptr inbounds i8, i8* %4, i64 10
  %32 = bitcast i8* %31 to i16*
  %33 = load i16, i16* %32, align 2, !tbaa !14
  store i16 %33, i16* %23, align 2, !tbaa !14
  store i16 %18, i16* %26, align 2, !tbaa !14
  store i16 %21, i16* %29, align 2, !tbaa !14
  store i16 %24, i16* %32, align 2, !tbaa !14
  br label %34

34:                                               ; preds = %1, %7, %16
  %35 = phi i32 [ 2, %1 ], [ 3, %16 ], [ 1, %7 ]
  ret i32 %35
}

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !5
  %4 = inttoptr i64 %3 to i8*
  %5 = load i32, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @__ctl_array, i64 0, i64 0), align 4, !tbaa !11
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %33

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %9 = load i64, i64* %8, align 8, !tbaa !12
  %10 = inttoptr i64 %9 to i8*
  %11 = load i64, i64* getelementptr inbounds ([512 x i64], [512 x i64]* @__cntrs_array, i64 0, i64 0), align 16, !tbaa !13
  %12 = add i64 %11, 1
  store i64 %12, i64* getelementptr inbounds ([512 x i64], [512 x i64]* @__cntrs_array, i64 0, i64 0), align 16, !tbaa !13
  %13 = getelementptr i8, i8* %4, i64 14
  %14 = icmp ugt i8* %13, %10
  br i1 %14, label %33, label %15

15:                                               ; preds = %7
  %16 = inttoptr i64 %3 to i16*
  %17 = load i16, i16* %16, align 2, !tbaa !14
  %18 = getelementptr inbounds i8, i8* %4, i64 2
  %19 = bitcast i8* %18 to i16*
  %20 = load i16, i16* %19, align 2, !tbaa !14
  %21 = getelementptr inbounds i8, i8* %4, i64 4
  %22 = bitcast i8* %21 to i16*
  %23 = load i16, i16* %22, align 2, !tbaa !14
  %24 = getelementptr inbounds i8, i8* %4, i64 6
  %25 = bitcast i8* %24 to i16*
  %26 = load i16, i16* %25, align 2, !tbaa !14
  store i16 %26, i16* %16, align 2, !tbaa !14
  %27 = getelementptr inbounds i8, i8* %4, i64 8
  %28 = bitcast i8* %27 to i16*
  %29 = load i16, i16* %28, align 2, !tbaa !14
  store i16 %29, i16* %19, align 2, !tbaa !14
  %30 = getelementptr inbounds i8, i8* %4, i64 10
  %31 = bitcast i8* %30 to i16*
  %32 = load i16, i16* %31, align 2, !tbaa !14
  store i16 %32, i16* %22, align 2, !tbaa !14
  store i16 %17, i16* %25, align 2, !tbaa !14
  store i16 %20, i16* %28, align 2, !tbaa !14
  store i16 %23, i16* %31, align 2, !tbaa !14
  br label %33

33:                                               ; preds = %15, %7, %1
  %34 = phi i32 [ 2, %1 ], [ 3, %15 ], [ 1, %7 ]
  ret i32 %34
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !7, i64 0}
!6 = !{!"xdp_md", !7, i64 0, !7, i64 8, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28}
!7 = !{!"long long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!10, !10, i64 0}
!12 = !{!6, !7, i64 8}
!13 = !{!7, !7, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !8, i64 0}

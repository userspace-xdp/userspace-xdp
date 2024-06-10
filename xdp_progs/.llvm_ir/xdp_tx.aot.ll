; ModuleID = 'xdp_tx.bpf.c'
source_filename = "xdp_tx.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds i8, i8* %0, i64 8
  %3 = bitcast i8* %2 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !5
  %5 = inttoptr i64 %4 to i8*
  %6 = bitcast i8* %0 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !11
  %8 = inttoptr i64 %7 to i8*
  %9 = getelementptr i8, i8* %8, i64 14
  %10 = icmp ugt i8* %9, %5
  br i1 %10, label %29, label %11

11:                                               ; preds = %1
  %12 = inttoptr i64 %7 to i16*
  %13 = load i16, i16* %12, align 2, !tbaa !12
  %14 = getelementptr inbounds i8, i8* %8, i64 2
  %15 = bitcast i8* %14 to i16*
  %16 = load i16, i16* %15, align 2, !tbaa !12
  %17 = getelementptr inbounds i8, i8* %8, i64 4
  %18 = bitcast i8* %17 to i16*
  %19 = load i16, i16* %18, align 2, !tbaa !12
  %20 = getelementptr inbounds i8, i8* %8, i64 6
  %21 = bitcast i8* %20 to i16*
  %22 = load i16, i16* %21, align 2, !tbaa !12
  store i16 %22, i16* %12, align 2, !tbaa !12
  %23 = getelementptr inbounds i8, i8* %8, i64 8
  %24 = bitcast i8* %23 to i16*
  %25 = load i16, i16* %24, align 2, !tbaa !12
  store i16 %25, i16* %15, align 2, !tbaa !12
  %26 = getelementptr inbounds i8, i8* %8, i64 10
  %27 = bitcast i8* %26 to i16*
  %28 = load i16, i16* %27, align 2, !tbaa !12
  store i16 %28, i16* %18, align 2, !tbaa !12
  store i16 %13, i16* %21, align 2, !tbaa !12
  store i16 %16, i16* %24, align 2, !tbaa !12
  store i16 %19, i16* %27, align 2, !tbaa !12
  br label %29

29:                                               ; preds = %1, %11
  %30 = phi i32 [ 3, %11 ], [ 2, %1 ]
  ret i32 %30
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %3 = load i64, i64* %2, align 8, !tbaa !5
  %4 = inttoptr i64 %3 to i8*
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %6 = load i64, i64* %5, align 8, !tbaa !11
  %7 = inttoptr i64 %6 to i8*
  %8 = getelementptr i8, i8* %7, i64 14
  %9 = icmp ugt i8* %8, %4
  br i1 %9, label %28, label %10

10:                                               ; preds = %1
  %11 = inttoptr i64 %6 to i16*
  %12 = load i16, i16* %11, align 2, !tbaa !12
  %13 = getelementptr inbounds i8, i8* %7, i64 2
  %14 = bitcast i8* %13 to i16*
  %15 = load i16, i16* %14, align 2, !tbaa !12
  %16 = getelementptr inbounds i8, i8* %7, i64 4
  %17 = bitcast i8* %16 to i16*
  %18 = load i16, i16* %17, align 2, !tbaa !12
  %19 = getelementptr inbounds i8, i8* %7, i64 6
  %20 = bitcast i8* %19 to i16*
  %21 = load i16, i16* %20, align 2, !tbaa !12
  store i16 %21, i16* %11, align 2, !tbaa !12
  %22 = getelementptr inbounds i8, i8* %7, i64 8
  %23 = bitcast i8* %22 to i16*
  %24 = load i16, i16* %23, align 2, !tbaa !12
  store i16 %24, i16* %14, align 2, !tbaa !12
  %25 = getelementptr inbounds i8, i8* %7, i64 10
  %26 = bitcast i8* %25 to i16*
  %27 = load i16, i16* %26, align 2, !tbaa !12
  store i16 %27, i16* %17, align 2, !tbaa !12
  store i16 %12, i16* %20, align 2, !tbaa !12
  store i16 %15, i16* %23, align 2, !tbaa !12
  store i16 %18, i16* %26, align 2, !tbaa !12
  br label %28

28:                                               ; preds = %1, %10
  %29 = phi i32 [ 3, %10 ], [ 2, %1 ]
  ret i32 %29
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !7, i64 8}
!6 = !{!"xdp_md", !7, i64 0, !7, i64 8, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28}
!7 = !{!"long long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!6, !7, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"short", !8, i64 0}

; ModuleID = 'xdp_tx.bpf.c'
source_filename = "xdp_tx.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i32 @batch_xdp_pass(%struct.xdp_md** nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %3

2:                                                ; preds = %33
  ret i32 3

3:                                                ; preds = %1, %33
  %4 = phi i64 [ 0, %1 ], [ %34, %33 ]
  %5 = getelementptr inbounds %struct.xdp_md*, %struct.xdp_md** %0, i64 %4
  %6 = load %struct.xdp_md*, %struct.xdp_md** %5, align 8, !tbaa !5
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %6, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !9
  %9 = inttoptr i64 %8 to i8*
  %10 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %6, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !13
  %12 = inttoptr i64 %11 to i8*
  %13 = getelementptr i8, i8* %12, i64 14
  %14 = icmp ugt i8* %13, %9
  br i1 %14, label %33, label %15

15:                                               ; preds = %3
  %16 = inttoptr i64 %11 to i16*
  %17 = load i16, i16* %16, align 2, !tbaa !14
  %18 = getelementptr inbounds i8, i8* %12, i64 2
  %19 = bitcast i8* %18 to i16*
  %20 = load i16, i16* %19, align 2, !tbaa !14
  %21 = getelementptr inbounds i8, i8* %12, i64 4
  %22 = bitcast i8* %21 to i16*
  %23 = load i16, i16* %22, align 2, !tbaa !14
  %24 = getelementptr inbounds i8, i8* %12, i64 6
  %25 = bitcast i8* %24 to i16*
  %26 = load i16, i16* %25, align 2, !tbaa !14
  store i16 %26, i16* %16, align 2, !tbaa !14
  %27 = getelementptr inbounds i8, i8* %12, i64 8
  %28 = bitcast i8* %27 to i16*
  %29 = load i16, i16* %28, align 2, !tbaa !14
  store i16 %29, i16* %19, align 2, !tbaa !14
  %30 = getelementptr inbounds i8, i8* %12, i64 10
  %31 = bitcast i8* %30 to i16*
  %32 = load i16, i16* %31, align 2, !tbaa !14
  store i16 %32, i16* %22, align 2, !tbaa !14
  store i16 %17, i16* %25, align 2, !tbaa !14
  store i16 %20, i16* %28, align 2, !tbaa !14
  store i16 %23, i16* %31, align 2, !tbaa !14
  br label %33

33:                                               ; preds = %3, %15
  %34 = add nuw nsw i64 %4, 1
  %35 = icmp eq i64 %34, 16
  br i1 %35, label %2, label %3, !llvm.loop !16
}

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !11, i64 8}
!10 = !{!"xdp_md", !11, i64 0, !11, i64 8, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28}
!11 = !{!"long long", !7, i64 0}
!12 = !{!"int", !7, i64 0}
!13 = !{!10, !11, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !7, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}

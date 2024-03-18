; ModuleID = 'xdp_tx.bpf.c'
source_filename = "xdp_tx.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i32 @batch_xdp_pass(ptr nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = zext i32 %1 to i64
  br label %7

6:                                                ; preds = %26, %2
  ret i32 3

7:                                                ; preds = %4, %26
  %8 = phi i64 [ 0, %4 ], [ %27, %26 ]
  %9 = getelementptr inbounds ptr, ptr %0, i64 %8
  %10 = load ptr, ptr %9, align 8, !tbaa !5
  %11 = getelementptr inbounds %struct.xdp_md, ptr %10, i64 0, i32 1
  %12 = load i64, ptr %11, align 8, !tbaa !9
  %13 = inttoptr i64 %12 to ptr
  %14 = load i64, ptr %10, align 8, !tbaa !13
  %15 = inttoptr i64 %14 to ptr
  %16 = getelementptr i8, ptr %15, i64 14
  %17 = icmp ugt ptr %16, %13
  br i1 %17, label %26, label %18

18:                                               ; preds = %7
  %19 = getelementptr inbounds i16, ptr %15, i64 2
  %20 = load i16, ptr %19, align 2, !tbaa !14
  %21 = getelementptr inbounds i16, ptr %15, i64 3
  %22 = load <2 x i16>, ptr %21, align 2, !tbaa !14
  %23 = getelementptr inbounds i16, ptr %15, i64 5
  %24 = load i16, ptr %23, align 2, !tbaa !14
  store i16 %24, ptr %19, align 2, !tbaa !14
  %25 = load <2 x i16>, ptr %15, align 2, !tbaa !14
  store <2 x i16> %22, ptr %15, align 2, !tbaa !14
  store <2 x i16> %25, ptr %21, align 2, !tbaa !14
  store i16 %20, ptr %23, align 2, !tbaa !14
  br label %26

26:                                               ; preds = %7, %18
  %27 = add nuw nsw i64 %8, 1
  %28 = icmp eq i64 %27, %5
  br i1 %28, label %6, label %7, !llvm.loop !16
}

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 15.0.7"}
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

; ModuleID = 'loop.bpf.c'
source_filename = "loop.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { ptr, ptr }

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i32 @add_arrays(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8, !tbaa !5
  %4 = load ptr, ptr %0, align 8, !tbaa !10
  %5 = ptrtoint ptr %3 to i64
  %6 = ptrtoint ptr %4 to i64
  %7 = sub i64 %5, %6
  %8 = trunc i64 %7 to i32
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %47

10:                                               ; preds = %1
  %11 = and i64 %7, 4294967295
  %12 = icmp ult i64 %11, 8
  br i1 %12, label %45, label %13

13:                                               ; preds = %10
  %14 = icmp ult i64 %11, 32
  br i1 %14, label %32, label %15

15:                                               ; preds = %13
  %16 = and i64 %7, 31
  %17 = sub nsw i64 %11, %16
  br label %18

18:                                               ; preds = %18, %15
  %19 = phi i64 [ 0, %15 ], [ %26, %18 ]
  %20 = getelementptr inbounds i8, ptr %4, i64 %19
  %21 = load <16 x i8>, ptr %20, align 1, !tbaa !11
  %22 = getelementptr inbounds i8, ptr %20, i64 16
  %23 = load <16 x i8>, ptr %22, align 1, !tbaa !11
  %24 = add <16 x i8> %21, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %25 = add <16 x i8> %23, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  store <16 x i8> %24, ptr %20, align 1, !tbaa !11
  store <16 x i8> %25, ptr %22, align 1, !tbaa !11
  %26 = add nuw i64 %19, 32
  %27 = icmp eq i64 %26, %17
  br i1 %27, label %28, label %18, !llvm.loop !12

28:                                               ; preds = %18
  %29 = icmp eq i64 %16, 0
  br i1 %29, label %47, label %30

30:                                               ; preds = %28
  %31 = icmp ult i64 %16, 8
  br i1 %31, label %45, label %32

32:                                               ; preds = %13, %30
  %33 = phi i64 [ %17, %30 ], [ 0, %13 ]
  %34 = and i64 %7, 7
  %35 = sub nsw i64 %11, %34
  br label %36

36:                                               ; preds = %36, %32
  %37 = phi i64 [ %33, %32 ], [ %41, %36 ]
  %38 = getelementptr inbounds i8, ptr %4, i64 %37
  %39 = load <8 x i8>, ptr %38, align 1, !tbaa !11
  %40 = add <8 x i8> %39, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  store <8 x i8> %40, ptr %38, align 1, !tbaa !11
  %41 = add nuw i64 %37, 8
  %42 = icmp eq i64 %41, %35
  br i1 %42, label %43, label %36, !llvm.loop !15

43:                                               ; preds = %36
  %44 = icmp eq i64 %34, 0
  br i1 %44, label %47, label %45

45:                                               ; preds = %10, %30, %43
  %46 = phi i64 [ 0, %10 ], [ %17, %30 ], [ %35, %43 ]
  br label %48

47:                                               ; preds = %48, %28, %43, %1
  ret i32 0

48:                                               ; preds = %45, %48
  %49 = phi i64 [ %53, %48 ], [ %46, %45 ]
  %50 = getelementptr inbounds i8, ptr %4, i64 %49
  %51 = load i8, ptr %50, align 1, !tbaa !11
  %52 = add i8 %51, 1
  store i8 %52, ptr %50, align 1, !tbaa !11
  %53 = add nuw nsw i64 %49, 1
  %54 = icmp eq i64 %53, %11
  br i1 %54, label %47, label %48, !llvm.loop !17
}

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 15.0.7"}
!5 = !{!6, !7, i64 8}
!6 = !{!"xdp_md", !7, i64 0, !7, i64 8}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!6, !7, i64 0}
!11 = !{!8, !8, i64 0}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = distinct !{!15, !13, !14, !16}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
!17 = distinct !{!17, !13, !16, !14}

; ModuleID = 'loop2.bpf.c'
source_filename = "loop2.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable
define dso_local i32 @add_arrays(ptr nocapture noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds i8, ptr %0, i64 64
  %3 = load <16 x i8>, ptr %2, align 1, !tbaa !5
  %4 = add <16 x i8> %3, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  store <16 x i8> %4, ptr %0, align 1, !tbaa !5
  %5 = getelementptr inbounds i8, ptr %0, i64 80
  %6 = load <16 x i8>, ptr %5, align 1, !tbaa !5
  %7 = add <16 x i8> %6, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %8 = getelementptr inbounds i8, ptr %0, i64 16
  store <16 x i8> %7, ptr %8, align 1, !tbaa !5
  %9 = getelementptr inbounds i8, ptr %0, i64 96
  %10 = load <16 x i8>, ptr %9, align 1, !tbaa !5
  %11 = add <16 x i8> %10, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %12 = getelementptr inbounds i8, ptr %0, i64 32
  store <16 x i8> %11, ptr %12, align 1, !tbaa !5
  %13 = getelementptr inbounds i8, ptr %0, i64 112
  %14 = load <16 x i8>, ptr %13, align 1, !tbaa !5
  %15 = add <16 x i8> %14, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %16 = getelementptr inbounds i8, ptr %0, i64 48
  store <16 x i8> %15, ptr %16, align 1, !tbaa !5
  ret i32 0
}

attributes #0 = { argmemonly nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 15.0.7"}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}

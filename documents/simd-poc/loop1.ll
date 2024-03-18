; ModuleID = 'loop1.bpf.c'
source_filename = "loop1.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { ptr, ptr }

; Function Attrs: nofree nosync nounwind uwtable
define dso_local i32 @add_arrays(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca [64 x i8], align 16
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 1
  %4 = load ptr, ptr %3, align 8, !tbaa !5
  %5 = load ptr, ptr %0, align 8, !tbaa !10
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %2) #3
  %6 = ptrtoint ptr %4 to i64
  %7 = ptrtoint ptr %5 to i64
  %8 = sub i64 %6, %7
  %9 = trunc i64 %8 to i32
  %10 = icmp slt i32 %9, 64
  br i1 %10, label %26, label %11

11:                                               ; preds = %1
  %12 = load <16 x i8>, ptr %5, align 1, !tbaa !11
  %13 = add <16 x i8> %12, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  store <16 x i8> %13, ptr %2, align 16, !tbaa !11
  %14 = getelementptr inbounds i8, ptr %5, i64 16
  %15 = load <16 x i8>, ptr %14, align 1, !tbaa !11
  %16 = add <16 x i8> %15, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %17 = getelementptr inbounds [64 x i8], ptr %2, i64 0, i64 16
  store <16 x i8> %16, ptr %17, align 16, !tbaa !11
  %18 = getelementptr inbounds i8, ptr %5, i64 32
  %19 = load <16 x i8>, ptr %18, align 1, !tbaa !11
  %20 = add <16 x i8> %19, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %21 = getelementptr inbounds [64 x i8], ptr %2, i64 0, i64 32
  store <16 x i8> %20, ptr %21, align 16, !tbaa !11
  %22 = getelementptr inbounds i8, ptr %5, i64 48
  %23 = load <16 x i8>, ptr %22, align 1, !tbaa !11
  %24 = add <16 x i8> %23, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %25 = getelementptr inbounds [64 x i8], ptr %2, i64 0, i64 48
  store <16 x i8> %24, ptr %25, align 16, !tbaa !11
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(64) %5, ptr noundef nonnull align 16 dereferenceable(64) %2, i64 64, i1 false), !tbaa !11
  br label %26

26:                                               ; preds = %11, %1
  %27 = phi i32 [ -1, %1 ], [ 0, %11 ]
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %2) #3
  ret i32 %27
}

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }
attributes #3 = { nounwind }

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

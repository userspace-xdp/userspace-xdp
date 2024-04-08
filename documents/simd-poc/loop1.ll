; ModuleID = 'loop1.bpf.c'
source_filename = "loop1.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i8*, i8* }

; Function Attrs: nofree nosync nounwind uwtable
define dso_local i32 @add_arrays(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca [64 x i8], align 16
  %3 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %5 = load i8*, i8** %4, align 8, !tbaa !5
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8, !tbaa !10
  %8 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %8) #3
  %9 = ptrtoint i8* %5 to i64
  %10 = ptrtoint i8* %7 to i64
  %11 = sub i64 %9, %10
  %12 = trunc i64 %11 to i32
  %13 = icmp slt i32 %12, 64
  br i1 %13, label %37, label %14

14:                                               ; preds = %1
  %15 = bitcast i8* %7 to <16 x i8>*
  %16 = load <16 x i8>, <16 x i8>* %15, align 1, !tbaa !11
  %17 = add <16 x i8> %16, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %18 = bitcast [64 x i8]* %2 to <16 x i8>*
  store <16 x i8> %17, <16 x i8>* %18, align 16, !tbaa !11
  %19 = getelementptr inbounds i8, i8* %7, i64 16
  %20 = bitcast i8* %19 to <16 x i8>*
  %21 = load <16 x i8>, <16 x i8>* %20, align 1, !tbaa !11
  %22 = add <16 x i8> %21, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %23 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 16
  %24 = bitcast i8* %23 to <16 x i8>*
  store <16 x i8> %22, <16 x i8>* %24, align 16, !tbaa !11
  %25 = getelementptr inbounds i8, i8* %7, i64 32
  %26 = bitcast i8* %25 to <16 x i8>*
  %27 = load <16 x i8>, <16 x i8>* %26, align 1, !tbaa !11
  %28 = add <16 x i8> %27, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %29 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 32
  %30 = bitcast i8* %29 to <16 x i8>*
  store <16 x i8> %28, <16 x i8>* %30, align 16, !tbaa !11
  %31 = getelementptr inbounds i8, i8* %7, i64 48
  %32 = bitcast i8* %31 to <16 x i8>*
  %33 = load <16 x i8>, <16 x i8>* %32, align 1, !tbaa !11
  %34 = add <16 x i8> %33, <i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1>
  %35 = getelementptr inbounds [64 x i8], [64 x i8]* %2, i64 0, i64 48
  %36 = bitcast i8* %35 to <16 x i8>*
  store <16 x i8> %34, <16 x i8>* %36, align 16, !tbaa !11
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(64) %7, i8* noundef nonnull align 16 dereferenceable(64) %3, i64 64, i1 false), !tbaa !11
  br label %37

37:                                               ; preds = %14, %1
  %38 = phi i32 [ -1, %1 ], [ 0, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %8) #3
  ret i32 %38
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !7, i64 8}
!6 = !{!"xdp_md", !7, i64 0, !7, i64 8}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!6, !7, i64 0}
!11 = !{!8, !8, i64 0}

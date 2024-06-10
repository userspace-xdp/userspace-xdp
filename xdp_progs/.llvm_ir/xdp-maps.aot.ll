; ModuleID = 'xdp-maps.bpf.c'
source_filename = "xdp-maps.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [1 x i32]*, [8192 x i32]*, i32*, i32* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@__license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@packet_size_distribute = dso_local local_unnamed_addr global %struct.anon zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = bitcast i8* %0 to i64*
  %5 = load i64, i64* %4, align 8, !tbaa !5
  %6 = inttoptr i64 %5 to i8*
  %7 = getelementptr inbounds i8, i8* %0, i64 8
  %8 = bitcast i8* %7 to i64*
  %9 = load i64, i64* %8, align 8, !tbaa !11
  %10 = inttoptr i64 %9 to i8*
  %11 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #3
  %12 = sub i64 %9, %5
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %2, align 4, !tbaa !12
  %14 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14) #3
  store i32 0, i32* %3, align 4, !tbaa !12
  %15 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %11) #3
  %16 = icmp eq i8* %15, null
  br i1 %16, label %21, label %17

17:                                               ; preds = %1
  %18 = bitcast i8* %15 to i32*
  %19 = load i32, i32* %18, align 4, !tbaa !12
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %3, align 4, !tbaa !12
  br label %21

21:                                               ; preds = %17, %1
  %22 = call i32 (i64, i8*, i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i64, i8*, i8*, i64, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %11, i8* noundef nonnull %14, i64 noundef 0) #3
  %23 = getelementptr i8, i8* %6, i64 14
  %24 = icmp ugt i8* %23, %10
  br i1 %24, label %43, label %25

25:                                               ; preds = %21
  %26 = inttoptr i64 %5 to i16*
  %27 = load i16, i16* %26, align 2, !tbaa !13
  %28 = getelementptr inbounds i8, i8* %6, i64 2
  %29 = bitcast i8* %28 to i16*
  %30 = load i16, i16* %29, align 2, !tbaa !13
  %31 = getelementptr inbounds i8, i8* %6, i64 4
  %32 = bitcast i8* %31 to i16*
  %33 = load i16, i16* %32, align 2, !tbaa !13
  %34 = getelementptr inbounds i8, i8* %6, i64 6
  %35 = bitcast i8* %34 to i16*
  %36 = load i16, i16* %35, align 2, !tbaa !13
  store i16 %36, i16* %26, align 2, !tbaa !13
  %37 = getelementptr inbounds i8, i8* %6, i64 8
  %38 = bitcast i8* %37 to i16*
  %39 = load i16, i16* %38, align 2, !tbaa !13
  store i16 %39, i16* %29, align 2, !tbaa !13
  %40 = getelementptr inbounds i8, i8* %6, i64 10
  %41 = bitcast i8* %40 to i16*
  %42 = load i16, i16* %41, align 2, !tbaa !13
  store i16 %42, i16* %32, align 2, !tbaa !13
  store i16 %27, i16* %35, align 2, !tbaa !13
  store i16 %30, i16* %38, align 2, !tbaa !13
  store i16 %33, i16* %41, align 2, !tbaa !13
  br label %43

43:                                               ; preds = %21, %25
  %44 = phi i32 [ 3, %25 ], [ 1, %21 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #3
  ret i32 %44
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !5
  %6 = inttoptr i64 %5 to i8*
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !11
  %9 = inttoptr i64 %8 to i8*
  %10 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #3
  %11 = sub i64 %8, %5
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %2, align 4, !tbaa !12
  %13 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %13) #3
  store i32 0, i32* %3, align 4, !tbaa !12
  %14 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %10) #3
  %15 = icmp eq i8* %14, null
  br i1 %15, label %20, label %16

16:                                               ; preds = %1
  %17 = bitcast i8* %14 to i32*
  %18 = load i32, i32* %17, align 4, !tbaa !12
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %3, align 4, !tbaa !12
  br label %20

20:                                               ; preds = %16, %1
  %21 = call i32 (i64, i8*, i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i64, i8*, i8*, i64, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %10, i8* noundef nonnull %13, i64 noundef 0) #3
  %22 = getelementptr i8, i8* %6, i64 14
  %23 = icmp ugt i8* %22, %9
  br i1 %23, label %42, label %24

24:                                               ; preds = %20
  %25 = inttoptr i64 %5 to i16*
  %26 = load i16, i16* %25, align 2, !tbaa !13
  %27 = getelementptr inbounds i8, i8* %6, i64 2
  %28 = bitcast i8* %27 to i16*
  %29 = load i16, i16* %28, align 2, !tbaa !13
  %30 = getelementptr inbounds i8, i8* %6, i64 4
  %31 = bitcast i8* %30 to i16*
  %32 = load i16, i16* %31, align 2, !tbaa !13
  %33 = getelementptr inbounds i8, i8* %6, i64 6
  %34 = bitcast i8* %33 to i16*
  %35 = load i16, i16* %34, align 2, !tbaa !13
  store i16 %35, i16* %25, align 2, !tbaa !13
  %36 = getelementptr inbounds i8, i8* %6, i64 8
  %37 = bitcast i8* %36 to i16*
  %38 = load i16, i16* %37, align 2, !tbaa !13
  store i16 %38, i16* %28, align 2, !tbaa !13
  %39 = getelementptr inbounds i8, i8* %6, i64 10
  %40 = bitcast i8* %39 to i16*
  %41 = load i16, i16* %40, align 2, !tbaa !13
  store i16 %41, i16* %31, align 2, !tbaa !13
  store i16 %26, i16* %34, align 2, !tbaa !13
  store i16 %29, i16* %37, align 2, !tbaa !13
  store i16 %32, i16* %40, align 2, !tbaa !13
  br label %42

42:                                               ; preds = %20, %24
  %43 = phi i32 [ 3, %24 ], [ 1, %20 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %13) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #3
  ret i32 %43
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare i8* @_bpf_helper_ext_0001(...) local_unnamed_addr #2

declare i32 @_bpf_helper_ext_0002(...) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
!11 = !{!6, !7, i64 8}
!12 = !{!10, !10, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"short", !8, i64 0}

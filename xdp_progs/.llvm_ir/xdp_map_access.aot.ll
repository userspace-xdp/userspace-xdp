; ModuleID = 'xdp_map_access.bpf.c'
source_filename = "xdp_map_access.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i32]*, i32*, i32*, [2 x i32]* }
%struct.anon.0 = type { [6 x i32]*, i32*, i64*, [512 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@ctl_array = dso_local local_unnamed_addr global %struct.anon zeroinitializer, align 8
@cntrs_array = dso_local local_unnamed_addr global %struct.anon.0 zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = getelementptr inbounds i8, i8* %0, i64 8
  %5 = bitcast i8* %4 to i64*
  %6 = load i64, i64* %5, align 8, !tbaa !5
  %7 = inttoptr i64 %6 to i8*
  %8 = bitcast i8* %0 to i64*
  %9 = load i64, i64* %8, align 8, !tbaa !11
  %10 = inttoptr i64 %9 to i8*
  %11 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #3
  store i32 0, i32* %2, align 4, !tbaa !12
  %12 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %12) #3
  store i32 0, i32* %3, align 4, !tbaa !12
  %13 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %11) #3
  %14 = icmp eq i8* %13, null
  br i1 %14, label %47, label %15

15:                                               ; preds = %1
  %16 = bitcast i8* %13 to i32*
  %17 = load i32, i32* %16, align 4, !tbaa !12
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %47

19:                                               ; preds = %15
  %20 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %12) #3
  %21 = bitcast i8* %20 to i64*
  %22 = icmp eq i8* %20, null
  br i1 %22, label %26, label %23

23:                                               ; preds = %19
  %24 = load i64, i64* %21, align 8, !tbaa !13
  %25 = add i64 %24, 1
  store i64 %25, i64* %21, align 8, !tbaa !13
  br label %26

26:                                               ; preds = %23, %19
  %27 = getelementptr i8, i8* %10, i64 14
  %28 = icmp ugt i8* %27, %7
  br i1 %28, label %47, label %29

29:                                               ; preds = %26
  %30 = inttoptr i64 %9 to i16*
  %31 = load i16, i16* %30, align 2, !tbaa !14
  %32 = getelementptr inbounds i8, i8* %10, i64 2
  %33 = bitcast i8* %32 to i16*
  %34 = load i16, i16* %33, align 2, !tbaa !14
  %35 = getelementptr inbounds i8, i8* %10, i64 4
  %36 = bitcast i8* %35 to i16*
  %37 = load i16, i16* %36, align 2, !tbaa !14
  %38 = getelementptr inbounds i8, i8* %10, i64 6
  %39 = bitcast i8* %38 to i16*
  %40 = load i16, i16* %39, align 2, !tbaa !14
  store i16 %40, i16* %30, align 2, !tbaa !14
  %41 = getelementptr inbounds i8, i8* %10, i64 8
  %42 = bitcast i8* %41 to i16*
  %43 = load i16, i16* %42, align 2, !tbaa !14
  store i16 %43, i16* %33, align 2, !tbaa !14
  %44 = getelementptr inbounds i8, i8* %10, i64 10
  %45 = bitcast i8* %44 to i16*
  %46 = load i16, i16* %45, align 2, !tbaa !14
  store i16 %46, i16* %36, align 2, !tbaa !14
  store i16 %31, i16* %39, align 2, !tbaa !14
  store i16 %34, i16* %42, align 2, !tbaa !14
  store i16 %37, i16* %45, align 2, !tbaa !14
  br label %47

47:                                               ; preds = %1, %15, %26, %29
  %48 = phi i32 [ 2, %15 ], [ 2, %1 ], [ 3, %29 ], [ 1, %26 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %12) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #3
  ret i32 %48
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %5 = load i64, i64* %4, align 8, !tbaa !5
  %6 = inttoptr i64 %5 to i8*
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %8 = load i64, i64* %7, align 8, !tbaa !11
  %9 = inttoptr i64 %8 to i8*
  %10 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #3
  store i32 0, i32* %2, align 4, !tbaa !12
  %11 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11) #3
  store i32 0, i32* %3, align 4, !tbaa !12
  %12 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %10) #3
  %13 = icmp eq i8* %12, null
  br i1 %13, label %46, label %14

14:                                               ; preds = %1
  %15 = bitcast i8* %12 to i32*
  %16 = load i32, i32* %15, align 4, !tbaa !12
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %46

18:                                               ; preds = %14
  %19 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %11) #3
  %20 = bitcast i8* %19 to i64*
  %21 = icmp eq i8* %19, null
  br i1 %21, label %25, label %22

22:                                               ; preds = %18
  %23 = load i64, i64* %20, align 8, !tbaa !13
  %24 = add i64 %23, 1
  store i64 %24, i64* %20, align 8, !tbaa !13
  br label %25

25:                                               ; preds = %22, %18
  %26 = getelementptr i8, i8* %9, i64 14
  %27 = icmp ugt i8* %26, %6
  br i1 %27, label %46, label %28

28:                                               ; preds = %25
  %29 = inttoptr i64 %8 to i16*
  %30 = load i16, i16* %29, align 2, !tbaa !14
  %31 = getelementptr inbounds i8, i8* %9, i64 2
  %32 = bitcast i8* %31 to i16*
  %33 = load i16, i16* %32, align 2, !tbaa !14
  %34 = getelementptr inbounds i8, i8* %9, i64 4
  %35 = bitcast i8* %34 to i16*
  %36 = load i16, i16* %35, align 2, !tbaa !14
  %37 = getelementptr inbounds i8, i8* %9, i64 6
  %38 = bitcast i8* %37 to i16*
  %39 = load i16, i16* %38, align 2, !tbaa !14
  store i16 %39, i16* %29, align 2, !tbaa !14
  %40 = getelementptr inbounds i8, i8* %9, i64 8
  %41 = bitcast i8* %40 to i16*
  %42 = load i16, i16* %41, align 2, !tbaa !14
  store i16 %42, i16* %32, align 2, !tbaa !14
  %43 = getelementptr inbounds i8, i8* %9, i64 10
  %44 = bitcast i8* %43 to i16*
  %45 = load i16, i16* %44, align 2, !tbaa !14
  store i16 %45, i16* %35, align 2, !tbaa !14
  store i16 %30, i16* %38, align 2, !tbaa !14
  store i16 %33, i16* %41, align 2, !tbaa !14
  store i16 %36, i16* %44, align 2, !tbaa !14
  br label %46

46:                                               ; preds = %28, %25, %1, %14
  %47 = phi i32 [ 2, %14 ], [ 2, %1 ], [ 3, %28 ], [ 1, %25 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #3
  ret i32 %47
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare i8* @_bpf_helper_ext_0001(...) local_unnamed_addr #2

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
!5 = !{!6, !7, i64 8}
!6 = !{!"xdp_md", !7, i64 0, !7, i64 8, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28}
!7 = !{!"long long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!6, !7, i64 0}
!12 = !{!10, !10, i64 0}
!13 = !{!7, !7, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !8, i64 0}

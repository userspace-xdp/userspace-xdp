; ModuleID = 'xdping.bpf.c'
source_filename = "xdping.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.4 = type { [1 x i32]*, [256 x i32]*, i32*, %struct.pinginfo* }
%struct.pinginfo = type { i64, i16, i16, i32, [10 x i64] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@ping_map = dso_local local_unnamed_addr global %struct.anon.4 zeroinitializer, align 8
@__const.icmp_check.____fmt = private unnamed_addr constant [27 x i8] c"XDP_PASS for invalid icmp\0A\00", align 16

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca [27 x i8], align 16
  %3 = bitcast i8* %0 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !5
  %5 = inttoptr i64 %4 to i8*
  %6 = getelementptr i8, i8* %0, i64 8
  %7 = bitcast i8* %6 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !11
  %9 = inttoptr i64 %8 to i8*
  %10 = getelementptr i8, i8* %5, i64 34
  %11 = getelementptr i8, i8* %5, i64 98
  %12 = icmp ugt i8* %11, %9
  br i1 %12, label %61, label %13

13:                                               ; preds = %1
  %14 = inttoptr i64 %4 to %struct.ethhdr*
  %15 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 2
  %16 = load i16, i16* %15, align 2, !tbaa !12
  %17 = icmp eq i16 %16, 8
  br i1 %17, label %18, label %61

18:                                               ; preds = %13
  %19 = getelementptr i8, i8* %5, i64 23
  %20 = load i8, i8* %19, align 1, !tbaa !15
  %21 = icmp eq i8 %20, 1
  br i1 %21, label %22, label %61

22:                                               ; preds = %18
  %23 = icmp ugt i8* %10, %9
  br i1 %23, label %24, label %27

24:                                               ; preds = %22
  %25 = getelementptr inbounds [27 x i8], [27 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %25) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(27) %25, i8* noundef nonnull align 16 dereferenceable(27) getelementptr inbounds ([27 x i8], [27 x i8]* @__const.icmp_check.____fmt, i64 0, i64 0), i64 27, i1 false) #4
  %26 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %25, i64 noundef 27) #4
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %25) #4
  br label %61

27:                                               ; preds = %22
  %28 = getelementptr i8, i8* %5, i64 26
  %29 = bitcast i8* %28 to i32*
  %30 = load i32, i32* %29, align 4, !tbaa !17
  %31 = inttoptr i64 %4 to i16*
  %32 = load i16, i16* %31, align 2, !tbaa !18
  %33 = getelementptr inbounds i8, i8* %5, i64 2
  %34 = bitcast i8* %33 to i16*
  %35 = load i16, i16* %34, align 2, !tbaa !18
  %36 = getelementptr inbounds i8, i8* %5, i64 4
  %37 = bitcast i8* %36 to i16*
  %38 = load i16, i16* %37, align 2, !tbaa !18
  %39 = getelementptr inbounds i8, i8* %5, i64 6
  %40 = bitcast i8* %39 to i16*
  %41 = load i16, i16* %40, align 2, !tbaa !18
  store i16 %41, i16* %31, align 2, !tbaa !18
  %42 = getelementptr inbounds i8, i8* %5, i64 8
  %43 = bitcast i8* %42 to i16*
  %44 = load i16, i16* %43, align 2, !tbaa !18
  store i16 %44, i16* %34, align 2, !tbaa !18
  %45 = getelementptr inbounds i8, i8* %5, i64 10
  %46 = bitcast i8* %45 to i16*
  %47 = load i16, i16* %46, align 2, !tbaa !18
  store i16 %47, i16* %37, align 2, !tbaa !18
  store i16 %32, i16* %40, align 2, !tbaa !18
  store i16 %35, i16* %43, align 2, !tbaa !18
  store i16 %38, i16* %46, align 2, !tbaa !18
  %48 = getelementptr i8, i8* %5, i64 30
  %49 = bitcast i8* %48 to i32*
  %50 = load i32, i32* %49, align 4, !tbaa !17
  store i32 %50, i32* %29, align 4, !tbaa !17
  store i32 %30, i32* %49, align 4, !tbaa !17
  store i8 0, i8* %10, align 4, !tbaa !19
  %51 = getelementptr i8, i8* %5, i64 36
  %52 = bitcast i8* %51 to i16*
  store i16 0, i16* %52, align 2, !tbaa !21
  %53 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef nonnull %10, i32 noundef 64, i32 noundef 0) #4
  %54 = and i32 %53, 65535
  %55 = lshr i32 %53, 16
  %56 = add nuw nsw i32 %54, %55
  %57 = lshr i32 %56, 16
  %58 = add nuw nsw i32 %57, %56
  %59 = trunc i32 %58 to i16
  %60 = xor i16 %59, -1
  store i16 %60, i16* %52, align 2, !tbaa !21
  br label %61

61:                                               ; preds = %1, %13, %18, %24, %27
  %62 = phi i32 [ 3, %27 ], [ 2, %24 ], [ 2, %1 ], [ 2, %13 ], [ 2, %18 ]
  ret i32 %62
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca [27 x i8], align 16
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !5
  %5 = inttoptr i64 %4 to i8*
  %6 = getelementptr %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %7 = load i64, i64* %6, align 8, !tbaa !11
  %8 = inttoptr i64 %7 to i8*
  %9 = getelementptr i8, i8* %5, i64 34
  %10 = getelementptr i8, i8* %5, i64 98
  %11 = icmp ugt i8* %10, %8
  br i1 %11, label %60, label %12

12:                                               ; preds = %1
  %13 = inttoptr i64 %4 to %struct.ethhdr*
  %14 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 2
  %15 = load i16, i16* %14, align 2, !tbaa !12
  %16 = icmp eq i16 %15, 8
  br i1 %16, label %17, label %60

17:                                               ; preds = %12
  %18 = getelementptr i8, i8* %5, i64 23
  %19 = load i8, i8* %18, align 1, !tbaa !15
  %20 = icmp eq i8 %19, 1
  br i1 %20, label %21, label %60

21:                                               ; preds = %17
  %22 = icmp ugt i8* %9, %8
  br i1 %22, label %23, label %26

23:                                               ; preds = %21
  %24 = getelementptr inbounds [27 x i8], [27 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %24) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(27) %24, i8* noundef nonnull align 16 dereferenceable(27) getelementptr inbounds ([27 x i8], [27 x i8]* @__const.icmp_check.____fmt, i64 0, i64 0), i64 27, i1 false) #4
  %25 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %24, i64 noundef 27) #4
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %24) #4
  br label %60

26:                                               ; preds = %21
  %27 = getelementptr i8, i8* %5, i64 26
  %28 = bitcast i8* %27 to i32*
  %29 = load i32, i32* %28, align 4, !tbaa !17
  %30 = inttoptr i64 %4 to i16*
  %31 = load i16, i16* %30, align 2, !tbaa !18
  %32 = getelementptr inbounds i8, i8* %5, i64 2
  %33 = bitcast i8* %32 to i16*
  %34 = load i16, i16* %33, align 2, !tbaa !18
  %35 = getelementptr inbounds i8, i8* %5, i64 4
  %36 = bitcast i8* %35 to i16*
  %37 = load i16, i16* %36, align 2, !tbaa !18
  %38 = getelementptr inbounds i8, i8* %5, i64 6
  %39 = bitcast i8* %38 to i16*
  %40 = load i16, i16* %39, align 2, !tbaa !18
  store i16 %40, i16* %30, align 2, !tbaa !18
  %41 = getelementptr inbounds i8, i8* %5, i64 8
  %42 = bitcast i8* %41 to i16*
  %43 = load i16, i16* %42, align 2, !tbaa !18
  store i16 %43, i16* %33, align 2, !tbaa !18
  %44 = getelementptr inbounds i8, i8* %5, i64 10
  %45 = bitcast i8* %44 to i16*
  %46 = load i16, i16* %45, align 2, !tbaa !18
  store i16 %46, i16* %36, align 2, !tbaa !18
  store i16 %31, i16* %39, align 2, !tbaa !18
  store i16 %34, i16* %42, align 2, !tbaa !18
  store i16 %37, i16* %45, align 2, !tbaa !18
  %47 = getelementptr i8, i8* %5, i64 30
  %48 = bitcast i8* %47 to i32*
  %49 = load i32, i32* %48, align 4, !tbaa !17
  store i32 %49, i32* %28, align 4, !tbaa !17
  store i32 %29, i32* %48, align 4, !tbaa !17
  store i8 0, i8* %9, align 4, !tbaa !19
  %50 = getelementptr i8, i8* %5, i64 36
  %51 = bitcast i8* %50 to i16*
  store i16 0, i16* %51, align 2, !tbaa !21
  %52 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef nonnull %9, i32 noundef 64, i32 noundef 0) #4
  %53 = and i32 %52, 65535
  %54 = lshr i32 %52, 16
  %55 = add nuw nsw i32 %53, %54
  %56 = lshr i32 %55, 16
  %57 = add nuw nsw i32 %56, %55
  %58 = trunc i32 %57 to i16
  %59 = xor i16 %58, -1
  store i16 %59, i16* %51, align 2, !tbaa !21
  br label %60

60:                                               ; preds = %17, %12, %1, %23, %26
  %61 = phi i32 [ 3, %26 ], [ 2, %23 ], [ 2, %1 ], [ 2, %12 ], [ 2, %17 ]
  ret i32 %61
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @_bpf_helper_ext_0006(...) local_unnamed_addr #3

declare i32 @_bpf_helper_ext_0028(...) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

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
!12 = !{!13, !14, i64 12}
!13 = !{!"ethhdr", !8, i64 0, !8, i64 6, !14, i64 12}
!14 = !{!"short", !8, i64 0}
!15 = !{!16, !8, i64 9}
!16 = !{!"iphdr", !8, i64 0, !8, i64 0, !8, i64 1, !14, i64 2, !14, i64 4, !14, i64 6, !8, i64 8, !8, i64 9, !14, i64 10, !8, i64 12}
!17 = !{!8, !8, i64 0}
!18 = !{!14, !14, i64 0}
!19 = !{!20, !8, i64 0}
!20 = !{!"icmphdr", !8, i64 0, !8, i64 1, !14, i64 2, !8, i64 4}
!21 = !{!20, !14, i64 2}

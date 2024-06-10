; ModuleID = 'xdp_csum.bpf.c'
source_filename = "xdp_csum.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.1 = type { [6 x i32]*, i32*, i64*, [256 x i32]* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@rxcnt = dso_local local_unnamed_addr global %struct.anon.1 zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = getelementptr inbounds i8, i8* %0, i64 8
  %4 = bitcast i8* %3 to i64*
  %5 = load i64, i64* %4, align 8, !tbaa !5
  %6 = inttoptr i64 %5 to i8*
  %7 = bitcast i8* %0 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !11
  %9 = inttoptr i64 %8 to i8*
  %10 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #3
  store i32 23, i32* %2, align 4, !tbaa !12
  %11 = getelementptr i8, i8* %9, i64 14
  %12 = icmp ugt i8* %11, %6
  br i1 %12, label %61, label %13

13:                                               ; preds = %1
  %14 = inttoptr i64 %8 to %struct.ethhdr*
  %15 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %14, i64 0, i32 2
  %16 = load i16, i16* %15, align 2, !tbaa !13
  %17 = icmp ne i16 %16, 8
  %18 = getelementptr i8, i8* %9, i64 34
  %19 = icmp ugt i8* %18, %6
  %20 = select i1 %17, i1 true, i1 %19
  br i1 %20, label %61, label %21

21:                                               ; preds = %13
  %22 = getelementptr i8, i8* %9, i64 24
  %23 = bitcast i8* %22 to i16*
  br label %24

24:                                               ; preds = %24, %21
  %25 = phi i32 [ 0, %21 ], [ %34, %24 ]
  %26 = phi i32 [ 0, %21 ], [ %31, %24 ]
  %27 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %11, i32 noundef 20, i32 noundef %26) #3
  %28 = lshr i32 %27, 16
  %29 = add i32 %28, %27
  %30 = and i32 %29, 65535
  %31 = xor i32 %30, 65535
  %32 = trunc i32 %31 to i16
  store i16 %32, i16* %23, align 2, !tbaa !16
  %33 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %10) #3
  %34 = add nuw nsw i32 %25, 1
  %35 = icmp eq i32 %34, 32
  br i1 %35, label %36, label %24, !llvm.loop !18

36:                                               ; preds = %24
  %37 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %10) #3
  %38 = bitcast i8* %37 to i64*
  %39 = icmp eq i8* %37, null
  br i1 %39, label %43, label %40

40:                                               ; preds = %36
  %41 = load i64, i64* %38, align 8, !tbaa !20
  %42 = add nsw i64 %41, 1
  store i64 %42, i64* %38, align 8, !tbaa !20
  br label %43

43:                                               ; preds = %40, %36
  %44 = inttoptr i64 %8 to i16*
  %45 = load i16, i16* %44, align 2, !tbaa !22
  %46 = getelementptr inbounds i8, i8* %9, i64 2
  %47 = bitcast i8* %46 to i16*
  %48 = load i16, i16* %47, align 2, !tbaa !22
  %49 = getelementptr inbounds i8, i8* %9, i64 4
  %50 = bitcast i8* %49 to i16*
  %51 = load i16, i16* %50, align 2, !tbaa !22
  %52 = getelementptr inbounds i8, i8* %9, i64 6
  %53 = bitcast i8* %52 to i16*
  %54 = load i16, i16* %53, align 2, !tbaa !22
  store i16 %54, i16* %44, align 2, !tbaa !22
  %55 = getelementptr inbounds i8, i8* %9, i64 8
  %56 = bitcast i8* %55 to i16*
  %57 = load i16, i16* %56, align 2, !tbaa !22
  store i16 %57, i16* %47, align 2, !tbaa !22
  %58 = getelementptr inbounds i8, i8* %9, i64 10
  %59 = bitcast i8* %58 to i16*
  %60 = load i16, i16* %59, align 2, !tbaa !22
  store i16 %60, i16* %50, align 2, !tbaa !22
  store i16 %45, i16* %53, align 2, !tbaa !22
  store i16 %48, i16* %56, align 2, !tbaa !22
  store i16 %51, i16* %59, align 2, !tbaa !22
  br label %61

61:                                               ; preds = %1, %13, %43
  %62 = phi i32 [ 3, %43 ], [ 2, %1 ], [ 2, %13 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #3
  ret i32 %62
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %4 = load i64, i64* %3, align 8, !tbaa !5
  %5 = inttoptr i64 %4 to i8*
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %7 = load i64, i64* %6, align 8, !tbaa !11
  %8 = inttoptr i64 %7 to i8*
  %9 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #3
  store i32 23, i32* %2, align 4, !tbaa !12
  %10 = getelementptr i8, i8* %8, i64 14
  %11 = icmp ugt i8* %10, %5
  br i1 %11, label %60, label %12

12:                                               ; preds = %1
  %13 = inttoptr i64 %7 to %struct.ethhdr*
  %14 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 2
  %15 = load i16, i16* %14, align 2, !tbaa !13
  %16 = icmp ne i16 %15, 8
  %17 = getelementptr i8, i8* %8, i64 34
  %18 = icmp ugt i8* %17, %5
  %19 = select i1 %16, i1 true, i1 %18
  br i1 %19, label %60, label %20

20:                                               ; preds = %12
  %21 = getelementptr i8, i8* %8, i64 24
  %22 = bitcast i8* %21 to i16*
  br label %23

23:                                               ; preds = %20, %23
  %24 = phi i32 [ 0, %20 ], [ %33, %23 ]
  %25 = phi i32 [ 0, %20 ], [ %30, %23 ]
  %26 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %10, i32 noundef 20, i32 noundef %25) #3
  %27 = lshr i32 %26, 16
  %28 = add i32 %27, %26
  %29 = and i32 %28, 65535
  %30 = xor i32 %29, 65535
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* %22, align 2, !tbaa !16
  %32 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %9) #3
  %33 = add nuw nsw i32 %24, 1
  %34 = icmp eq i32 %33, 32
  br i1 %34, label %35, label %23, !llvm.loop !18

35:                                               ; preds = %23
  %36 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %9) #3
  %37 = bitcast i8* %36 to i64*
  %38 = icmp eq i8* %36, null
  br i1 %38, label %42, label %39

39:                                               ; preds = %35
  %40 = load i64, i64* %37, align 8, !tbaa !20
  %41 = add nsw i64 %40, 1
  store i64 %41, i64* %37, align 8, !tbaa !20
  br label %42

42:                                               ; preds = %39, %35
  %43 = inttoptr i64 %7 to i16*
  %44 = load i16, i16* %43, align 2, !tbaa !22
  %45 = getelementptr inbounds i8, i8* %8, i64 2
  %46 = bitcast i8* %45 to i16*
  %47 = load i16, i16* %46, align 2, !tbaa !22
  %48 = getelementptr inbounds i8, i8* %8, i64 4
  %49 = bitcast i8* %48 to i16*
  %50 = load i16, i16* %49, align 2, !tbaa !22
  %51 = getelementptr inbounds i8, i8* %8, i64 6
  %52 = bitcast i8* %51 to i16*
  %53 = load i16, i16* %52, align 2, !tbaa !22
  store i16 %53, i16* %43, align 2, !tbaa !22
  %54 = getelementptr inbounds i8, i8* %8, i64 8
  %55 = bitcast i8* %54 to i16*
  %56 = load i16, i16* %55, align 2, !tbaa !22
  store i16 %56, i16* %46, align 2, !tbaa !22
  %57 = getelementptr inbounds i8, i8* %8, i64 10
  %58 = bitcast i8* %57 to i16*
  %59 = load i16, i16* %58, align 2, !tbaa !22
  store i16 %59, i16* %49, align 2, !tbaa !22
  store i16 %44, i16* %52, align 2, !tbaa !22
  store i16 %47, i16* %55, align 2, !tbaa !22
  store i16 %50, i16* %58, align 2, !tbaa !22
  br label %60

60:                                               ; preds = %12, %1, %42
  %61 = phi i32 [ 3, %42 ], [ 2, %1 ], [ 2, %12 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #3
  ret i32 %61
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @_bpf_helper_ext_0028(...) local_unnamed_addr #2

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
!13 = !{!14, !15, i64 12}
!14 = !{!"ethhdr", !8, i64 0, !8, i64 6, !15, i64 12}
!15 = !{!"short", !8, i64 0}
!16 = !{!17, !15, i64 10}
!17 = !{!"iphdr", !8, i64 0, !8, i64 0, !8, i64 1, !15, i64 2, !15, i64 4, !15, i64 6, !8, i64 8, !8, i64 9, !15, i64 10, !8, i64 12}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.mustprogress"}
!20 = !{!21, !21, i64 0}
!21 = !{!"long", !8, i64 0}
!22 = !{!15, !15, i64 0}

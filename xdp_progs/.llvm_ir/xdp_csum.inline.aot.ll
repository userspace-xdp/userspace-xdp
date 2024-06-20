; ModuleID = 'xdp_csum.bpf.c'
source_filename = "xdp_csum.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.1 = type { [6 x i32]*, i32*, i64*, [256 x i32]* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@rxcnt = dso_local local_unnamed_addr global %struct.anon.1 zeroinitializer, align 8
@__rxcnt.0 = internal unnamed_addr global i64 0, align 16

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds i8, i8* %0, i64 8
  %3 = bitcast i8* %2 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !5
  %5 = inttoptr i64 %4 to i8*
  %6 = bitcast i8* %0 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !11
  %8 = inttoptr i64 %7 to i8*
  %9 = getelementptr i8, i8* %8, i64 14
  %10 = icmp ugt i8* %9, %5
  br i1 %10, label %53, label %11

11:                                               ; preds = %1
  %12 = inttoptr i64 %7 to %struct.ethhdr*
  %13 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 2
  %14 = load i16, i16* %13, align 2, !tbaa !12
  %15 = icmp ne i16 %14, 8
  %16 = getelementptr i8, i8* %8, i64 34
  %17 = icmp ugt i8* %16, %5
  %18 = select i1 %15, i1 true, i1 %17
  br i1 %18, label %53, label %19

19:                                               ; preds = %11
  %20 = getelementptr i8, i8* %8, i64 24
  %21 = bitcast i8* %20 to i16*
  br label %22

22:                                               ; preds = %22, %19
  %23 = phi i32 [ 0, %19 ], [ %31, %22 ]
  %24 = phi i32 [ 0, %19 ], [ %29, %22 ]
  %25 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %9, i32 noundef 20, i32 noundef %24) #2
  %26 = lshr i32 %25, 16
  %27 = add i32 %26, %25
  %28 = and i32 %27, 65535
  %29 = xor i32 %28, 65535
  %30 = trunc i32 %29 to i16
  store i16 %30, i16* %21, align 2, !tbaa !15
  %31 = add nuw nsw i32 %23, 1
  %32 = icmp eq i32 %31, 32
  br i1 %32, label %33, label %22, !llvm.loop !17

33:                                               ; preds = %22
  %34 = load i64, i64* @__rxcnt.0, align 16, !tbaa !19
  %35 = add nsw i64 %34, 1
  store i64 %35, i64* @__rxcnt.0, align 16, !tbaa !19
  %36 = inttoptr i64 %7 to i16*
  %37 = load i16, i16* %36, align 2, !tbaa !21
  %38 = getelementptr inbounds i8, i8* %8, i64 2
  %39 = bitcast i8* %38 to i16*
  %40 = load i16, i16* %39, align 2, !tbaa !21
  %41 = getelementptr inbounds i8, i8* %8, i64 4
  %42 = bitcast i8* %41 to i16*
  %43 = load i16, i16* %42, align 2, !tbaa !21
  %44 = getelementptr inbounds i8, i8* %8, i64 6
  %45 = bitcast i8* %44 to i16*
  %46 = load i16, i16* %45, align 2, !tbaa !21
  store i16 %46, i16* %36, align 2, !tbaa !21
  %47 = getelementptr inbounds i8, i8* %8, i64 8
  %48 = bitcast i8* %47 to i16*
  %49 = load i16, i16* %48, align 2, !tbaa !21
  store i16 %49, i16* %39, align 2, !tbaa !21
  %50 = getelementptr inbounds i8, i8* %8, i64 10
  %51 = bitcast i8* %50 to i16*
  %52 = load i16, i16* %51, align 2, !tbaa !21
  store i16 %52, i16* %42, align 2, !tbaa !21
  store i16 %37, i16* %45, align 2, !tbaa !21
  store i16 %40, i16* %48, align 2, !tbaa !21
  store i16 %43, i16* %51, align 2, !tbaa !21
  br label %53

53:                                               ; preds = %1, %11, %33
  %54 = phi i32 [ 3, %33 ], [ 2, %1 ], [ 2, %11 ]
  ret i32 %54
}

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %3 = load i64, i64* %2, align 8, !tbaa !5
  %4 = inttoptr i64 %3 to i8*
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %6 = load i64, i64* %5, align 8, !tbaa !11
  %7 = inttoptr i64 %6 to i8*
  %8 = getelementptr i8, i8* %7, i64 14
  %9 = icmp ugt i8* %8, %4
  br i1 %9, label %52, label %10

10:                                               ; preds = %1
  %11 = inttoptr i64 %6 to %struct.ethhdr*
  %12 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 2
  %13 = load i16, i16* %12, align 2, !tbaa !12
  %14 = icmp ne i16 %13, 8
  %15 = getelementptr i8, i8* %7, i64 34
  %16 = icmp ugt i8* %15, %4
  %17 = select i1 %14, i1 true, i1 %16
  br i1 %17, label %52, label %18

18:                                               ; preds = %10
  %19 = getelementptr i8, i8* %7, i64 24
  %20 = bitcast i8* %19 to i16*
  br label %21

21:                                               ; preds = %18, %21
  %22 = phi i32 [ 0, %18 ], [ %30, %21 ]
  %23 = phi i32 [ 0, %18 ], [ %28, %21 ]
  %24 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %8, i32 noundef 20, i32 noundef %23) #2
  %25 = lshr i32 %24, 16
  %26 = add i32 %25, %24
  %27 = and i32 %26, 65535
  %28 = xor i32 %27, 65535
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %20, align 2, !tbaa !15
  %30 = add nuw nsw i32 %22, 1
  %31 = icmp eq i32 %30, 32
  br i1 %31, label %32, label %21, !llvm.loop !17

32:                                               ; preds = %21
  %33 = load i64, i64* @__rxcnt.0, align 16, !tbaa !19
  %34 = add nsw i64 %33, 1
  store i64 %34, i64* @__rxcnt.0, align 16, !tbaa !19
  %35 = inttoptr i64 %6 to i16*
  %36 = load i16, i16* %35, align 2, !tbaa !21
  %37 = getelementptr inbounds i8, i8* %7, i64 2
  %38 = bitcast i8* %37 to i16*
  %39 = load i16, i16* %38, align 2, !tbaa !21
  %40 = getelementptr inbounds i8, i8* %7, i64 4
  %41 = bitcast i8* %40 to i16*
  %42 = load i16, i16* %41, align 2, !tbaa !21
  %43 = getelementptr inbounds i8, i8* %7, i64 6
  %44 = bitcast i8* %43 to i16*
  %45 = load i16, i16* %44, align 2, !tbaa !21
  store i16 %45, i16* %35, align 2, !tbaa !21
  %46 = getelementptr inbounds i8, i8* %7, i64 8
  %47 = bitcast i8* %46 to i16*
  %48 = load i16, i16* %47, align 2, !tbaa !21
  store i16 %48, i16* %38, align 2, !tbaa !21
  %49 = getelementptr inbounds i8, i8* %7, i64 10
  %50 = bitcast i8* %49 to i16*
  %51 = load i16, i16* %50, align 2, !tbaa !21
  store i16 %51, i16* %41, align 2, !tbaa !21
  store i16 %36, i16* %44, align 2, !tbaa !21
  store i16 %39, i16* %47, align 2, !tbaa !21
  store i16 %42, i16* %50, align 2, !tbaa !21
  br label %52

52:                                               ; preds = %10, %1, %32
  %53 = phi i32 [ 3, %32 ], [ 2, %1 ], [ 2, %10 ]
  ret i32 %53
}

declare i32 @_bpf_helper_ext_0028(...) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

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
!12 = !{!13, !14, i64 12}
!13 = !{!"ethhdr", !8, i64 0, !8, i64 6, !14, i64 12}
!14 = !{!"short", !8, i64 0}
!15 = !{!16, !14, i64 10}
!16 = !{!"iphdr", !8, i64 0, !8, i64 0, !8, i64 1, !14, i64 2, !14, i64 4, !14, i64 6, !8, i64 8, !8, i64 9, !14, i64 10, !8, i64 12}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
!19 = !{!20, !20, i64 0}
!20 = !{!"long", !8, i64 0}
!21 = !{!14, !14, i64 0}

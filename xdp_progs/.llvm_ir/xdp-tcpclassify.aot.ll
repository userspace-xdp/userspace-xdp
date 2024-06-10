; ModuleID = 'xdp-tcpclassify.bpf.c'
source_filename = "xdp-tcpclassify.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.1 = type { [27 x i32]*, [262144 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.event = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@.str = private unnamed_addr constant [5 x i8] c"HTTP\00", align 1
@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@ringbuf = dso_local local_unnamed_addr global %struct.anon.1 zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to %struct.xdp_md*
  %3 = tail call i32 @xdp_pass(%struct.xdp_md* noundef %2)
  ret i32 %3
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.event, align 4
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !5
  %5 = inttoptr i64 %4 to i8*
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %7 = load i64, i64* %6, align 8, !tbaa !11
  %8 = inttoptr i64 %7 to i8*
  %9 = getelementptr i8, i8* %5, i64 14
  %10 = icmp ugt i8* %9, %8
  br i1 %10, label %116, label %11

11:                                               ; preds = %1
  %12 = inttoptr i64 %4 to %struct.ethhdr*
  %13 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 2
  %14 = load i16, i16* %13, align 2, !tbaa !12
  %15 = icmp eq i16 %14, 8
  br i1 %15, label %16, label %116

16:                                               ; preds = %11
  %17 = getelementptr i8, i8* %5, i64 34
  %18 = icmp ugt i8* %17, %8
  br i1 %18, label %116, label %19

19:                                               ; preds = %16
  %20 = getelementptr i8, i8* %5, i64 23
  %21 = load i8, i8* %20, align 1, !tbaa !15
  %22 = icmp ne i8 %21, 6
  %23 = getelementptr i8, i8* %5, i64 54
  %24 = icmp ugt i8* %23, %8
  %25 = select i1 %22, i1 true, i1 %24
  br i1 %25, label %116, label %26

26:                                               ; preds = %19
  %27 = bitcast %struct.event* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 300, i8* nonnull %27) #4
  %28 = getelementptr i8, i8* %5, i64 26
  %29 = bitcast i8* %28 to i32*
  %30 = load i32, i32* %29, align 4, !tbaa !17
  %31 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 2
  store i32 %30, i32* %31, align 4, !tbaa !18
  %32 = getelementptr i8, i8* %5, i64 30
  %33 = bitcast i8* %32 to i32*
  %34 = load i32, i32* %33, align 4, !tbaa !17
  %35 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 3
  store i32 %34, i32* %35, align 4, !tbaa !20
  %36 = bitcast i8* %17 to i16*
  %37 = load i16, i16* %36, align 4, !tbaa !21
  %38 = tail call i16 @llvm.bswap.i16(i16 %37)
  %39 = zext i16 %38 to i32
  %40 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 0
  store i32 %39, i32* %40, align 4, !tbaa !23
  %41 = getelementptr i8, i8* %5, i64 36
  %42 = bitcast i8* %41 to i16*
  %43 = load i16, i16* %42, align 2, !tbaa !24
  %44 = tail call i16 @llvm.bswap.i16(i16 %43)
  %45 = zext i16 %44 to i32
  %46 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 1
  store i32 %45, i32* %46, align 4, !tbaa !25
  %47 = getelementptr i8, i8* %5, i64 46
  %48 = bitcast i8* %47 to i16*
  %49 = load i16, i16* %48, align 4
  %50 = lshr i16 %49, 9
  %51 = and i16 %50, 1
  %52 = zext i16 %51 to i32
  %53 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 4
  store i32 %52, i32* %53, align 4, !tbaa !26
  %54 = load i16, i16* %48, align 4
  %55 = lshr i16 %54, 8
  %56 = and i16 %55, 1
  %57 = zext i16 %56 to i32
  %58 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 5
  store i32 %57, i32* %58, align 4, !tbaa !27
  %59 = load i16, i16* %48, align 4
  %60 = lshr i16 %59, 10
  %61 = and i16 %60, 1
  %62 = zext i16 %61 to i32
  %63 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 6
  store i32 %62, i32* %63, align 4, !tbaa !28
  %64 = load i16, i16* %48, align 4
  %65 = lshr i16 %64, 11
  %66 = and i16 %65, 1
  %67 = zext i16 %66 to i32
  %68 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 7
  store i32 %67, i32* %68, align 4, !tbaa !29
  %69 = load i16, i16* %48, align 4
  %70 = lshr i16 %69, 12
  %71 = and i16 %70, 1
  %72 = zext i16 %71 to i32
  %73 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 8
  store i32 %72, i32* %73, align 4, !tbaa !30
  %74 = sub i64 %7, %4
  %75 = trunc i64 %74 to i32
  %76 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 10
  store i32 %75, i32* %76, align 4, !tbaa !31
  %77 = load i16, i16* %48, align 4
  %78 = lshr i16 %77, 2
  %79 = and i16 %78, 60
  %80 = zext i16 %79 to i64
  %81 = getelementptr i8, i8* %17, i64 %80
  %82 = getelementptr i8, i8* %81, i64 4
  %83 = icmp ult i8* %82, %8
  br i1 %83, label %84, label %91

84:                                               ; preds = %26
  %85 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 11, i64 0
  %86 = call i32 (%struct.xdp_md*, i32, i8*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0189 to i32 (%struct.xdp_md*, i32, i8*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef 0, i8* noundef nonnull %85, i32 noundef 4) #4
  %87 = call i32 (i8*, i32, i8*, ...) bitcast (i32 (...)* @bpf_strncmp to i32 (i8*, i32, i8*, ...)*)(i8* noundef nonnull %85, i32 noundef 4, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #4
  %88 = icmp eq i32 %87, 0
  %89 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 9
  %90 = zext i1 %88 to i32
  store i32 %90, i32* %89, align 4, !tbaa !32
  br label %91

91:                                               ; preds = %84, %26
  %92 = getelementptr i8, i8* %5, i64 60
  %93 = icmp ult i8* %92, %8
  br i1 %93, label %94, label %97

94:                                               ; preds = %91
  %95 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 11
  %96 = call i32 (%struct.xdp_md*, i32, [256 x i8]*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0189 to i32 (%struct.xdp_md*, i32, [256 x i8]*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef 0, [256 x i8]* noundef nonnull %95, i32 noundef 60) #4
  br label %97

97:                                               ; preds = %94, %91
  %98 = call i32 (i64, i8*, i64, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0130 to i32 (i64, i8*, i64, i64, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %27, i64 noundef 300, i64 noundef 0) #4
  %99 = inttoptr i64 %4 to i16*
  %100 = load i16, i16* %99, align 2, !tbaa !33
  %101 = getelementptr inbounds i8, i8* %5, i64 2
  %102 = bitcast i8* %101 to i16*
  %103 = load i16, i16* %102, align 2, !tbaa !33
  %104 = getelementptr inbounds i8, i8* %5, i64 4
  %105 = bitcast i8* %104 to i16*
  %106 = load i16, i16* %105, align 2, !tbaa !33
  %107 = getelementptr inbounds i8, i8* %5, i64 6
  %108 = bitcast i8* %107 to i16*
  %109 = load i16, i16* %108, align 2, !tbaa !33
  store i16 %109, i16* %99, align 2, !tbaa !33
  %110 = getelementptr inbounds i8, i8* %5, i64 8
  %111 = bitcast i8* %110 to i16*
  %112 = load i16, i16* %111, align 2, !tbaa !33
  store i16 %112, i16* %102, align 2, !tbaa !33
  %113 = getelementptr inbounds i8, i8* %5, i64 10
  %114 = bitcast i8* %113 to i16*
  %115 = load i16, i16* %114, align 2, !tbaa !33
  store i16 %115, i16* %105, align 2, !tbaa !33
  store i16 %100, i16* %108, align 2, !tbaa !33
  store i16 %103, i16* %111, align 2, !tbaa !33
  store i16 %106, i16* %114, align 2, !tbaa !33
  call void @llvm.lifetime.end.p0i8(i64 300, i8* nonnull %27) #4
  br label %116

116:                                              ; preds = %16, %19, %97, %11, %1
  %117 = phi i32 [ 2, %1 ], [ 2, %11 ], [ 2, %16 ], [ 2, %19 ], [ 3, %97 ]
  ret i32 %117
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

declare i32 @_bpf_helper_ext_0189(...) local_unnamed_addr #3

declare i32 @bpf_strncmp(...) local_unnamed_addr #3

declare i32 @_bpf_helper_ext_0130(...) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
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
!18 = !{!19, !10, i64 8}
!19 = !{!"event", !10, i64 0, !10, i64 4, !10, i64 8, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !10, i64 32, !10, i64 36, !10, i64 40, !8, i64 44}
!20 = !{!19, !10, i64 12}
!21 = !{!22, !14, i64 0}
!22 = !{!"tcphdr", !14, i64 0, !14, i64 2, !10, i64 4, !10, i64 8, !14, i64 12, !14, i64 12, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 14, !14, i64 16, !14, i64 18}
!23 = !{!19, !10, i64 0}
!24 = !{!22, !14, i64 2}
!25 = !{!19, !10, i64 4}
!26 = !{!19, !10, i64 16}
!27 = !{!19, !10, i64 20}
!28 = !{!19, !10, i64 24}
!29 = !{!19, !10, i64 28}
!30 = !{!19, !10, i64 32}
!31 = !{!19, !10, i64 40}
!32 = !{!19, !10, i64 36}
!33 = !{!14, !14, i64 0}

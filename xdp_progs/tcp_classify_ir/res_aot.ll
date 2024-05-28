; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/xdp_progs/tcpclassify.bpf.aot.c'
source_filename = "/home/yunwei/ebpf-xdp-dpdk/xdp_progs/tcpclassify.bpf.aot.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.event = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i64 @bpf_strncmp(i8* nocapture noundef readonly %0, i32 noundef %1, i8* nocapture noundef readonly %2) local_unnamed_addr #0 {
  switch i32 %1, label %38 [
    i32 4, label %4
    i32 0, label %56
  ]

4:                                                ; preds = %3
  %5 = bitcast i8* %0 to i32*
  %6 = load i32, i32* %5, align 4, !tbaa !5
  %7 = bitcast i8* %2 to i32*
  %8 = load i32, i32* %7, align 4, !tbaa !5
  %9 = icmp eq i32 %6, %8
  %10 = trunc i32 %6 to i8
  %11 = trunc i32 %8 to i8
  %12 = lshr i32 %6, 8
  %13 = trunc i32 %12 to i8
  %14 = lshr i32 %8, 8
  %15 = trunc i32 %14 to i8
  %16 = lshr i32 %6, 16
  %17 = trunc i32 %16 to i8
  %18 = lshr i32 %8, 16
  %19 = trunc i32 %18 to i8
  %20 = lshr i32 %6, 24
  %21 = trunc i32 %20 to i8
  %22 = lshr i32 %8, 24
  %23 = trunc i32 %22 to i8
  br i1 %9, label %56, label %24

24:                                               ; preds = %4
  %25 = icmp eq i8 %10, %11
  br i1 %25, label %26, label %32

26:                                               ; preds = %24
  %27 = icmp eq i8 %13, %15
  br i1 %27, label %28, label %32

28:                                               ; preds = %26
  %29 = icmp eq i8 %17, %19
  br i1 %29, label %30, label %32

30:                                               ; preds = %28
  %31 = icmp eq i8 %21, %23
  br i1 %31, label %56, label %32

32:                                               ; preds = %30, %28, %26, %24
  %33 = phi i8 [ %10, %24 ], [ %13, %26 ], [ %17, %28 ], [ %21, %30 ]
  %34 = phi i8 [ %11, %24 ], [ %15, %26 ], [ %19, %28 ], [ %23, %30 ]
  %35 = zext i8 %33 to i64
  %36 = zext i8 %34 to i64
  %37 = sub nsw i64 %35, %36
  br label %56

38:                                               ; preds = %3, %50
  %39 = phi i32 [ %42, %50 ], [ %1, %3 ]
  %40 = phi i8* [ %52, %50 ], [ %0, %3 ]
  %41 = phi i8* [ %53, %50 ], [ %2, %3 ]
  %42 = add i32 %39, -1
  %43 = load i8, i8* %40, align 1, !tbaa !9
  %44 = load i8, i8* %41, align 1, !tbaa !9
  %45 = icmp eq i8 %43, %44
  br i1 %45, label %50, label %46

46:                                               ; preds = %38
  %47 = zext i8 %43 to i64
  %48 = zext i8 %44 to i64
  %49 = sub nsw i64 %47, %48
  br label %56

50:                                               ; preds = %38
  %51 = icmp eq i8 %43, 0
  %52 = getelementptr inbounds i8, i8* %40, i64 1
  %53 = getelementptr inbounds i8, i8* %41, i64 1
  %54 = icmp eq i32 %42, 0
  %55 = select i1 %51, i1 true, i1 %54
  br i1 %55, label %56, label %38, !llvm.loop !10

56:                                               ; preds = %50, %3, %30, %4, %32, %46
  %57 = phi i64 [ %49, %46 ], [ %37, %32 ], [ 0, %4 ], [ 0, %30 ], [ 0, %3 ], [ 0, %50 ]
  ret i64 %57
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind uwtable willreturn
define dso_local i64 @bpf_xdp_load_bytes(%struct.xdp_md* nocapture noundef readonly %0, i32 noundef %1, i8* nocapture noundef writeonly %2, i32 noundef %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %6 = load i64, i64* %5, align 8, !tbaa !12
  %7 = zext i32 %1 to i64
  %8 = add i64 %6, %7
  %9 = inttoptr i64 %8 to i8*
  %10 = zext i32 %3 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %9, i64 %10, i1 false)
  ret i64 0
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #4 {
  %2 = alloca %struct.event, align 4
  %3 = getelementptr inbounds i8, i8* %0, i64 8
  %4 = bitcast i8* %3 to i64*
  %5 = load i64, i64* %4, align 8, !tbaa !15
  %6 = inttoptr i64 %5 to i8*
  %7 = bitcast i8* %0 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !12
  %9 = inttoptr i64 %8 to i8*
  %10 = getelementptr i8, i8* %9, i64 14
  %11 = icmp ugt i8* %10, %6
  br i1 %11, label %140, label %12

12:                                               ; preds = %1
  %13 = inttoptr i64 %8 to %struct.ethhdr*
  %14 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 2
  %15 = load i16, i16* %14, align 2, !tbaa !16
  %16 = icmp eq i16 %15, 8
  br i1 %16, label %17, label %140

17:                                               ; preds = %12
  %18 = getelementptr i8, i8* %9, i64 34
  %19 = icmp ugt i8* %18, %6
  br i1 %19, label %140, label %20

20:                                               ; preds = %17
  %21 = getelementptr i8, i8* %9, i64 23
  %22 = load i8, i8* %21, align 1, !tbaa !19
  %23 = icmp ne i8 %22, 6
  %24 = getelementptr i8, i8* %9, i64 54
  %25 = icmp ugt i8* %24, %6
  %26 = select i1 %23, i1 true, i1 %25
  br i1 %26, label %140, label %27

27:                                               ; preds = %20
  %28 = bitcast %struct.event* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 300, i8* nonnull %28) #7
  %29 = getelementptr i8, i8* %9, i64 26
  %30 = bitcast i8* %29 to i32*
  %31 = load i32, i32* %30, align 4, !tbaa !9
  %32 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 2
  store i32 %31, i32* %32, align 4, !tbaa !21
  %33 = getelementptr i8, i8* %9, i64 30
  %34 = bitcast i8* %33 to i32*
  %35 = load i32, i32* %34, align 4, !tbaa !9
  %36 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 3
  store i32 %35, i32* %36, align 4, !tbaa !23
  %37 = bitcast i8* %18 to i16*
  %38 = load i16, i16* %37, align 4, !tbaa !24
  %39 = tail call i16 @llvm.bswap.i16(i16 %38)
  %40 = zext i16 %39 to i32
  %41 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 0
  store i32 %40, i32* %41, align 4, !tbaa !26
  %42 = getelementptr i8, i8* %9, i64 36
  %43 = bitcast i8* %42 to i16*
  %44 = load i16, i16* %43, align 2, !tbaa !27
  %45 = tail call i16 @llvm.bswap.i16(i16 %44)
  %46 = zext i16 %45 to i32
  %47 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 1
  store i32 %46, i32* %47, align 4, !tbaa !28
  %48 = getelementptr i8, i8* %9, i64 46
  %49 = bitcast i8* %48 to i16*
  %50 = load i16, i16* %49, align 4
  %51 = lshr i16 %50, 9
  %52 = and i16 %51, 1
  %53 = zext i16 %52 to i32
  %54 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 4
  store i32 %53, i32* %54, align 4, !tbaa !29
  %55 = load i16, i16* %49, align 4
  %56 = lshr i16 %55, 8
  %57 = and i16 %56, 1
  %58 = zext i16 %57 to i32
  %59 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 5
  store i32 %58, i32* %59, align 4, !tbaa !30
  %60 = load i16, i16* %49, align 4
  %61 = lshr i16 %60, 10
  %62 = and i16 %61, 1
  %63 = zext i16 %62 to i32
  %64 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 6
  store i32 %63, i32* %64, align 4, !tbaa !31
  %65 = load i16, i16* %49, align 4
  %66 = lshr i16 %65, 11
  %67 = and i16 %66, 1
  %68 = zext i16 %67 to i32
  %69 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 7
  store i32 %68, i32* %69, align 4, !tbaa !32
  %70 = load i16, i16* %49, align 4
  %71 = lshr i16 %70, 12
  %72 = and i16 %71, 1
  %73 = zext i16 %72 to i32
  %74 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 8
  store i32 %73, i32* %74, align 4, !tbaa !33
  %75 = sub i64 %5, %8
  %76 = trunc i64 %75 to i32
  %77 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 10
  store i32 %76, i32* %77, align 4, !tbaa !34
  %78 = load i16, i16* %49, align 4
  %79 = lshr i16 %78, 2
  %80 = and i16 %79, 60
  %81 = zext i16 %80 to i64
  %82 = getelementptr i8, i8* %18, i64 %81
  %83 = getelementptr i8, i8* %82, i64 4
  %84 = icmp ult i8* %83, %6
  br i1 %84, label %85, label %116

85:                                               ; preds = %27
  %86 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 11, i64 0
  %87 = inttoptr i64 %8 to i32*
  %88 = bitcast i8* %86 to i32*
  %89 = load i32, i32* %87, align 1
  store i32 %89, i32* %88, align 4
  %90 = icmp eq i32 %89, 1347703880
  %91 = trunc i32 %89 to i8
  %92 = lshr i32 %89, 8
  %93 = trunc i32 %92 to i8
  %94 = lshr i32 %89, 16
  %95 = trunc i32 %94 to i8
  %96 = lshr i32 %89, 24
  %97 = trunc i32 %96 to i8
  br i1 %90, label %113, label %98

98:                                               ; preds = %85
  %99 = icmp eq i8 %91, 72
  br i1 %99, label %100, label %106

100:                                              ; preds = %98
  %101 = icmp eq i8 %93, 84
  br i1 %101, label %102, label %106

102:                                              ; preds = %100
  %103 = icmp eq i8 %95, 84
  br i1 %103, label %104, label %106

104:                                              ; preds = %102
  %105 = icmp eq i8 %97, 80
  br i1 %105, label %113, label %106

106:                                              ; preds = %98, %100, %102, %104
  %107 = phi i8 [ %91, %98 ], [ %93, %100 ], [ %95, %102 ], [ %97, %104 ]
  %108 = phi i64 [ -72, %98 ], [ -84, %100 ], [ -84, %102 ], [ -80, %104 ]
  %109 = zext i8 %107 to i64
  %110 = sub nsw i64 0, %109
  %111 = icmp eq i64 %108, %110
  %112 = zext i1 %111 to i32
  br label %113

113:                                              ; preds = %106, %85, %104
  %114 = phi i32 [ 1, %104 ], [ 1, %85 ], [ %112, %106 ]
  %115 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 9
  store i32 %114, i32* %115, align 4, !tbaa !35
  br label %116

116:                                              ; preds = %113, %27
  %117 = getelementptr i8, i8* %9, i64 60
  %118 = icmp ult i8* %117, %6
  br i1 %118, label %119, label %121

119:                                              ; preds = %116
  %120 = getelementptr inbounds %struct.event, %struct.event* %2, i64 0, i32 11, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(60) %120, i8* noundef nonnull align 1 dereferenceable(60) %9, i64 60, i1 false) #7
  br label %121

121:                                              ; preds = %119, %116
  %122 = call i64 @_bpf_helper_ext_0130(i64 noundef 17179869184, i8* noundef nonnull %28, i64 noundef 300, i64 noundef 0) #7
  %123 = inttoptr i64 %8 to i16*
  %124 = load i16, i16* %123, align 2, !tbaa !36
  %125 = getelementptr inbounds i8, i8* %9, i64 2
  %126 = bitcast i8* %125 to i16*
  %127 = load i16, i16* %126, align 2, !tbaa !36
  %128 = getelementptr inbounds i8, i8* %9, i64 4
  %129 = bitcast i8* %128 to i16*
  %130 = load i16, i16* %129, align 2, !tbaa !36
  %131 = getelementptr inbounds i8, i8* %9, i64 6
  %132 = bitcast i8* %131 to i16*
  %133 = load i16, i16* %132, align 2, !tbaa !36
  store i16 %133, i16* %123, align 2, !tbaa !36
  %134 = getelementptr inbounds i8, i8* %9, i64 8
  %135 = bitcast i8* %134 to i16*
  %136 = load i16, i16* %135, align 2, !tbaa !36
  store i16 %136, i16* %126, align 2, !tbaa !36
  %137 = getelementptr inbounds i8, i8* %9, i64 10
  %138 = bitcast i8* %137 to i16*
  %139 = load i16, i16* %138, align 2, !tbaa !36
  store i16 %139, i16* %129, align 2, !tbaa !36
  store i16 %124, i16* %132, align 2, !tbaa !36
  store i16 %127, i16* %135, align 2, !tbaa !36
  store i16 %130, i16* %138, align 2, !tbaa !36
  call void @llvm.lifetime.end.p0i8(i64 300, i8* nonnull %28) #7
  br label %140

140:                                              ; preds = %17, %20, %121, %12, %1
  %141 = phi i32 [ 2, %1 ], [ 2, %12 ], [ 2, %17 ], [ 2, %20 ], [ 3, %121 ]
  ret i32 %141
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #5

declare i64 @_bpf_helper_ext_0130(i64 noundef, i8* noundef, i64 noundef, i64 noundef) local_unnamed_addr #6

attributes #0 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !14, i64 0}
!13 = !{!"xdp_md", !14, i64 0, !14, i64 8, !6, i64 16, !6, i64 20, !6, i64 24, !6, i64 28}
!14 = !{!"long long", !7, i64 0}
!15 = !{!13, !14, i64 8}
!16 = !{!17, !18, i64 12}
!17 = !{!"ethhdr", !7, i64 0, !7, i64 6, !18, i64 12}
!18 = !{!"short", !7, i64 0}
!19 = !{!20, !7, i64 9}
!20 = !{!"iphdr", !7, i64 0, !7, i64 0, !7, i64 1, !18, i64 2, !18, i64 4, !18, i64 6, !7, i64 8, !7, i64 9, !18, i64 10, !7, i64 12}
!21 = !{!22, !6, i64 8}
!22 = !{!"event", !6, i64 0, !6, i64 4, !6, i64 8, !6, i64 12, !6, i64 16, !6, i64 20, !6, i64 24, !6, i64 28, !6, i64 32, !6, i64 36, !6, i64 40, !7, i64 44}
!23 = !{!22, !6, i64 12}
!24 = !{!25, !18, i64 0}
!25 = !{!"tcphdr", !18, i64 0, !18, i64 2, !6, i64 4, !6, i64 8, !18, i64 12, !18, i64 12, !18, i64 13, !18, i64 13, !18, i64 13, !18, i64 13, !18, i64 13, !18, i64 13, !18, i64 13, !18, i64 13, !18, i64 14, !18, i64 16, !18, i64 18}
!26 = !{!22, !6, i64 0}
!27 = !{!25, !18, i64 2}
!28 = !{!22, !6, i64 4}
!29 = !{!22, !6, i64 16}
!30 = !{!22, !6, i64 20}
!31 = !{!22, !6, i64 24}
!32 = !{!22, !6, i64 28}
!33 = !{!22, !6, i64 32}
!34 = !{!22, !6, i64 40}
!35 = !{!22, !6, i64 36}
!36 = !{!18, !18, i64 0}

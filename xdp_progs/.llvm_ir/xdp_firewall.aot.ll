; ModuleID = 'xdp_firewall.bpf.c'
source_filename = "xdp_firewall.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [5 x i32]*, %struct.flow_key*, i64*, [32768 x i32]*, [1 x i32]* }
%struct.flow_key = type { %union.anon, i32, [4 x i8] }
%union.anon = type { [4 x i32] }
%struct.anon.0 = type { [6 x i32]*, i32*, %struct.vrrp_filter*, [256 x i32]* }
%struct.vrrp_filter = type { i32, i64, i64, i64, i64 }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.vrrphdr = type { i8, i8, i8, i8, %union.anon.4, i16 }
%union.anon.4 = type { %struct.anon.6 }
%struct.anon.6 = type { i16 }

@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@l3_filter = dso_local local_unnamed_addr global %struct.anon zeroinitializer, align 8
@vrrp_vrid_filter = dso_local local_unnamed_addr global %struct.anon.0 zeroinitializer, align 8
@__const.layer3_filter.____fmt = private unnamed_addr constant [24 x i8] c"only ipv4 is supported\0A\00", align 16

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to %struct.xdp_md*
  %3 = tail call i32 @xdp_pass(%struct.xdp_md* noundef %2)
  ret i32 %3
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.flow_key, align 8
  %4 = alloca [24 x i8], align 16
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %6 = load i64, i64* %5, align 8, !tbaa !5
  %7 = inttoptr i64 %6 to i8*
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %9 = load i64, i64* %8, align 8, !tbaa !11
  %10 = inttoptr i64 %9 to i8*
  %11 = inttoptr i64 %9 to %struct.ethhdr*
  %12 = getelementptr %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 14
  %13 = icmp ugt i8* %12, %7
  br i1 %13, label %145, label %14

14:                                               ; preds = %1
  %15 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 2
  %16 = load i16, i16* %15, align 2, !tbaa !12
  switch i16 %16, label %24 [
    i16 -22392, label %17
    i16 129, label %17
  ]

17:                                               ; preds = %14, %14
  %18 = getelementptr %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 18
  %19 = icmp ugt i8* %18, %7
  br i1 %19, label %145, label %20

20:                                               ; preds = %17
  %21 = getelementptr %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 16
  %22 = bitcast i8* %21 to i16*
  %23 = load i16, i16* %22, align 2, !tbaa !15
  br label %24

24:                                               ; preds = %20, %14
  %25 = phi i16 [ %23, %20 ], [ %16, %14 ]
  %26 = phi i8 [ 18, %20 ], [ 14, %14 ]
  switch i16 %25, label %38 [
    i16 -22392, label %27
    i16 129, label %27
  ]

27:                                               ; preds = %24, %24
  %28 = add nuw nsw i8 %26, 4
  %29 = zext i8 %28 to i64
  %30 = getelementptr %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 %29
  %31 = icmp ugt i8* %30, %7
  br i1 %31, label %145, label %32

32:                                               ; preds = %27
  %33 = zext i8 %26 to i64
  %34 = getelementptr %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 %33
  %35 = getelementptr inbounds i8, i8* %34, i64 2
  %36 = bitcast i8* %35 to i16*
  %37 = load i16, i16* %36, align 2, !tbaa !15
  br label %38

38:                                               ; preds = %32, %24
  %39 = phi i16 [ %37, %32 ], [ %25, %24 ]
  %40 = phi i8 [ %28, %32 ], [ %26, %24 ]
  %41 = tail call i16 @llvm.bswap.i16(i16 %39) #5
  %42 = bitcast %struct.flow_key* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %42) #5
  %43 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %3, i64 0, i32 1
  %44 = bitcast i32* %43 to i64*
  store i64 2048, i64* %44, align 8
  switch i16 %41, label %115 [
    i16 2048, label %45
    i16 -31011, label %82
  ]

45:                                               ; preds = %38
  %46 = zext i8 %40 to i64
  %47 = getelementptr i8, i8* %10, i64 %46
  %48 = getelementptr i8, i8* %47, i64 20
  %49 = icmp ugt i8* %48, %7
  br i1 %49, label %115, label %50

50:                                               ; preds = %45
  %51 = getelementptr inbounds i8, i8* %47, i64 2
  %52 = bitcast i8* %51 to i16*
  %53 = load i16, i16* %52, align 2, !tbaa !17
  %54 = tail call i16 @llvm.bswap.i16(i16 %53) #5
  %55 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %3, i64 0, i32 0, i32 0, i64 3
  store i32 0, i32* %55, align 4, !tbaa !19
  %56 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %3, i64 0, i32 0, i32 0, i64 2
  store i32 0, i32* %56, align 8, !tbaa !19
  %57 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %3, i64 0, i32 0, i32 0, i64 1
  store i32 0, i32* %57, align 4, !tbaa !19
  %58 = getelementptr inbounds i8, i8* %47, i64 12
  %59 = getelementptr inbounds i8, i8* %58, i64 4
  %60 = bitcast i8* %59 to i32*
  %61 = load i32, i32* %60, align 4, !tbaa !19
  %62 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %3, i64 0, i32 0, i32 0, i64 0
  store i32 %61, i32* %62, align 8, !tbaa !19
  %63 = getelementptr inbounds i8, i8* %47, i64 9
  %64 = load i8, i8* %63, align 1, !tbaa !20
  switch i8 %64, label %85 [
    i8 112, label %65
    i8 51, label %69
  ]

65:                                               ; preds = %50
  %66 = bitcast i8* %48 to %struct.vrrphdr*
  %67 = getelementptr inbounds i8, i8* %48, i64 8
  %68 = icmp ugt i8* %67, %7
  br i1 %68, label %116, label %85

69:                                               ; preds = %50
  %70 = getelementptr inbounds i8, i8* %48, i64 12
  %71 = icmp ugt i8* %70, %7
  br i1 %71, label %115, label %72

72:                                               ; preds = %69
  %73 = load i8, i8* %48, align 4, !tbaa !21
  %74 = icmp eq i8 %73, 112
  br i1 %74, label %75, label %85

75:                                               ; preds = %72
  %76 = add nuw nsw i64 %46, 20
  %77 = getelementptr i8, i8* %10, i64 %76
  %78 = getelementptr i8, i8* %77, i64 12
  %79 = bitcast i8* %78 to %struct.vrrphdr*
  %80 = getelementptr inbounds i8, i8* %78, i64 8
  %81 = icmp ugt i8* %80, %7
  br i1 %81, label %116, label %85

82:                                               ; preds = %38
  %83 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %83) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %83, i8* noundef nonnull align 16 dereferenceable(24) getelementptr inbounds ([24 x i8], [24 x i8]* @__const.layer3_filter.____fmt, i64 0, i64 0), i64 24, i1 false) #5
  %84 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %83, i64 noundef 24) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %83) #5
  br label %116

85:                                               ; preds = %75, %72, %65, %50
  %86 = phi %struct.vrrphdr* [ %66, %65 ], [ %79, %75 ], [ null, %72 ], [ null, %50 ]
  %87 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %42) #5
  %88 = bitcast i8* %87 to i64*
  %89 = icmp eq i8* %87, null
  br i1 %89, label %93, label %90

90:                                               ; preds = %85
  %91 = load i64, i64* %88, align 8, !tbaa !23
  %92 = add i64 %91, 1
  store i64 %92, i64* %88, align 8, !tbaa !23
  br label %116

93:                                               ; preds = %85
  %94 = icmp eq %struct.vrrphdr* %86, null
  br i1 %94, label %115, label %95

95:                                               ; preds = %93
  %96 = getelementptr %struct.vrrphdr, %struct.vrrphdr* %86, i64 0, i32 1
  %97 = load i8, i8* %96, align 1, !tbaa !24
  %98 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %98) #5
  %99 = zext i8 %97 to i32
  store i32 %99, i32* %2, align 4, !tbaa !26
  %100 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %98) #5
  %101 = icmp eq i8* %100, null
  br i1 %101, label %117, label %102

102:                                              ; preds = %95
  %103 = getelementptr inbounds i8, i8* %100, i64 16
  %104 = bitcast i8* %103 to i64*
  %105 = load i64, i64* %104, align 8, !tbaa !27
  %106 = add i64 %105, 1
  store i64 %106, i64* %104, align 8, !tbaa !27
  %107 = zext i16 %54 to i64
  %108 = getelementptr inbounds i8, i8* %100, i64 32
  %109 = bitcast i8* %108 to i64*
  %110 = load i64, i64* %109, align 8, !tbaa !29
  %111 = add i64 %110, %107
  store i64 %111, i64* %109, align 8, !tbaa !29
  %112 = bitcast i8* %100 to i32*
  %113 = load i32, i32* %112, align 8, !tbaa !30
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %118, label %117

115:                                              ; preds = %45, %69, %38, %93
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %42) #5
  br label %127

116:                                              ; preds = %90, %82, %65, %75
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %42) #5
  br label %145

117:                                              ; preds = %95, %102
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %98) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %42) #5
  br label %127

118:                                              ; preds = %102
  %119 = getelementptr inbounds i8, i8* %100, i64 8
  %120 = bitcast i8* %119 to i64*
  %121 = load i64, i64* %120, align 8, !tbaa !31
  %122 = add i64 %121, 1
  store i64 %122, i64* %120, align 8, !tbaa !31
  %123 = getelementptr inbounds i8, i8* %100, i64 24
  %124 = bitcast i8* %123 to i64*
  %125 = load i64, i64* %124, align 8, !tbaa !32
  %126 = add i64 %125, %107
  store i64 %126, i64* %124, align 8, !tbaa !32
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %98) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %42) #5
  br label %145

127:                                              ; preds = %117, %115
  %128 = inttoptr i64 %9 to i16*
  %129 = load i16, i16* %128, align 2, !tbaa !33
  %130 = getelementptr inbounds i8, i8* %10, i64 2
  %131 = bitcast i8* %130 to i16*
  %132 = load i16, i16* %131, align 2, !tbaa !33
  %133 = getelementptr inbounds i8, i8* %10, i64 4
  %134 = bitcast i8* %133 to i16*
  %135 = load i16, i16* %134, align 2, !tbaa !33
  %136 = getelementptr inbounds i8, i8* %10, i64 6
  %137 = bitcast i8* %136 to i16*
  %138 = load i16, i16* %137, align 2, !tbaa !33
  store i16 %138, i16* %128, align 2, !tbaa !33
  %139 = getelementptr inbounds i8, i8* %10, i64 8
  %140 = bitcast i8* %139 to i16*
  %141 = load i16, i16* %140, align 2, !tbaa !33
  store i16 %141, i16* %131, align 2, !tbaa !33
  %142 = getelementptr inbounds i8, i8* %10, i64 10
  %143 = bitcast i8* %142 to i16*
  %144 = load i16, i16* %143, align 2, !tbaa !33
  store i16 %144, i16* %134, align 2, !tbaa !33
  store i16 %129, i16* %137, align 2, !tbaa !33
  store i16 %132, i16* %140, align 2, !tbaa !33
  store i16 %135, i16* %143, align 2, !tbaa !33
  br label %145

145:                                              ; preds = %27, %17, %1, %118, %116, %127
  %146 = phi i32 [ 3, %127 ], [ 1, %118 ], [ 1, %116 ], [ 2, %1 ], [ 2, %17 ], [ 2, %27 ]
  ret i32 %146
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @_bpf_helper_ext_0006(...) local_unnamed_addr #4

declare i8* @_bpf_helper_ext_0001(...) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
!15 = !{!16, !14, i64 2}
!16 = !{!"_vlan_hdr", !14, i64 0, !14, i64 2}
!17 = !{!18, !14, i64 2}
!18 = !{!"iphdr", !8, i64 0, !8, i64 0, !8, i64 1, !14, i64 2, !14, i64 4, !14, i64 6, !8, i64 8, !8, i64 9, !14, i64 10, !8, i64 12}
!19 = !{!8, !8, i64 0}
!20 = !{!18, !8, i64 9}
!21 = !{!22, !8, i64 0}
!22 = !{!"ip_auth_hdr", !8, i64 0, !8, i64 1, !14, i64 2, !10, i64 4, !10, i64 8, !8, i64 12}
!23 = !{!7, !7, i64 0}
!24 = !{!25, !8, i64 1}
!25 = !{!"vrrphdr", !8, i64 0, !8, i64 1, !8, i64 2, !8, i64 3, !8, i64 4, !14, i64 6}
!26 = !{!10, !10, i64 0}
!27 = !{!28, !7, i64 16}
!28 = !{!"vrrp_filter", !10, i64 0, !7, i64 8, !7, i64 16, !7, i64 24, !7, i64 32}
!29 = !{!28, !7, i64 32}
!30 = !{!28, !10, i64 0}
!31 = !{!28, !7, i64 8}
!32 = !{!28, !7, i64 24}
!33 = !{!14, !14, i64 0}

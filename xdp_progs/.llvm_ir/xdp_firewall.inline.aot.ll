; ModuleID = 'xdp_firewall.bpf.c'
source_filename = "xdp_firewall.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.vrrp_filter = type { i32, i64, i64, i64, i64 }
%struct.anon = type { [5 x i32]*, %struct.flow_key*, i64*, [32768 x i32]*, [1 x i32]* }
%struct.flow_key = type { %union.anon, i32, [4 x i8] }
%union.anon = type { [4 x i32] }
%struct.anon.0 = type { [6 x i32]*, i32*, %struct.vrrp_filter*, [256 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.vrrphdr = type { i8, i8, i8, i8, %union.anon.4, i16 }
%union.anon.4 = type { %struct.anon.6 }
%struct.anon.6 = type { i16 }

@__vrrp_vrid_filter = dso_local local_unnamed_addr global [256 x %struct.vrrp_filter] zeroinitializer, align 16
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
  %2 = alloca %struct.flow_key, align 8
  %3 = alloca [24 x i8], align 16
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %5 = load i64, i64* %4, align 8, !tbaa !5
  %6 = inttoptr i64 %5 to i8*
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %8 = load i64, i64* %7, align 8, !tbaa !11
  %9 = inttoptr i64 %8 to i8*
  %10 = inttoptr i64 %8 to %struct.ethhdr*
  %11 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 14
  %12 = icmp ugt i8* %11, %6
  br i1 %12, label %134, label %13

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 2
  %15 = load i16, i16* %14, align 2, !tbaa !12
  switch i16 %15, label %23 [
    i16 -22392, label %16
    i16 129, label %16
  ]

16:                                               ; preds = %13, %13
  %17 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 18
  %18 = icmp ugt i8* %17, %6
  br i1 %18, label %134, label %19

19:                                               ; preds = %16
  %20 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 16
  %21 = bitcast i8* %20 to i16*
  %22 = load i16, i16* %21, align 2, !tbaa !15
  br label %23

23:                                               ; preds = %19, %13
  %24 = phi i16 [ %22, %19 ], [ %15, %13 ]
  %25 = phi i8 [ 18, %19 ], [ 14, %13 ]
  switch i16 %24, label %37 [
    i16 -22392, label %26
    i16 129, label %26
  ]

26:                                               ; preds = %23, %23
  %27 = add nuw nsw i8 %25, 4
  %28 = zext i8 %27 to i64
  %29 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 %28
  %30 = icmp ugt i8* %29, %6
  br i1 %30, label %134, label %31

31:                                               ; preds = %26
  %32 = zext i8 %25 to i64
  %33 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 %32
  %34 = getelementptr inbounds i8, i8* %33, i64 2
  %35 = bitcast i8* %34 to i16*
  %36 = load i16, i16* %35, align 2, !tbaa !15
  br label %37

37:                                               ; preds = %31, %23
  %38 = phi i16 [ %36, %31 ], [ %24, %23 ]
  %39 = phi i8 [ %27, %31 ], [ %25, %23 ]
  %40 = tail call i16 @llvm.bswap.i16(i16 %38) #5
  %41 = bitcast %struct.flow_key* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %41) #5
  %42 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 1
  %43 = bitcast i32* %42 to i64*
  store i64 2048, i64* %43, align 8
  switch i16 %40, label %116 [
    i16 2048, label %44
    i16 -31011, label %81
  ]

44:                                               ; preds = %37
  %45 = zext i8 %39 to i64
  %46 = getelementptr i8, i8* %9, i64 %45
  %47 = getelementptr i8, i8* %46, i64 20
  %48 = icmp ugt i8* %47, %6
  br i1 %48, label %116, label %49

49:                                               ; preds = %44
  %50 = getelementptr inbounds i8, i8* %46, i64 2
  %51 = bitcast i8* %50 to i16*
  %52 = load i16, i16* %51, align 2, !tbaa !17
  %53 = tail call i16 @llvm.bswap.i16(i16 %52) #5
  %54 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 0, i32 0, i64 3
  store i32 0, i32* %54, align 4, !tbaa !19
  %55 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 0, i32 0, i64 2
  store i32 0, i32* %55, align 8, !tbaa !19
  %56 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 0, i32 0, i64 1
  store i32 0, i32* %56, align 4, !tbaa !19
  %57 = getelementptr inbounds i8, i8* %46, i64 12
  %58 = getelementptr inbounds i8, i8* %57, i64 4
  %59 = bitcast i8* %58 to i32*
  %60 = load i32, i32* %59, align 4, !tbaa !19
  %61 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 0, i32 0, i64 0
  store i32 %60, i32* %61, align 8, !tbaa !19
  %62 = getelementptr inbounds i8, i8* %46, i64 9
  %63 = load i8, i8* %62, align 1, !tbaa !20
  switch i8 %63, label %84 [
    i8 112, label %64
    i8 51, label %68
  ]

64:                                               ; preds = %49
  %65 = bitcast i8* %47 to %struct.vrrphdr*
  %66 = getelementptr inbounds i8, i8* %47, i64 8
  %67 = icmp ugt i8* %66, %6
  br i1 %67, label %115, label %84

68:                                               ; preds = %49
  %69 = getelementptr inbounds i8, i8* %47, i64 12
  %70 = icmp ugt i8* %69, %6
  br i1 %70, label %116, label %71

71:                                               ; preds = %68
  %72 = load i8, i8* %47, align 4, !tbaa !21
  %73 = icmp eq i8 %72, 112
  br i1 %73, label %74, label %84

74:                                               ; preds = %71
  %75 = add nuw nsw i64 %45, 20
  %76 = getelementptr i8, i8* %9, i64 %75
  %77 = getelementptr i8, i8* %76, i64 12
  %78 = bitcast i8* %77 to %struct.vrrphdr*
  %79 = getelementptr inbounds i8, i8* %77, i64 8
  %80 = icmp ugt i8* %79, %6
  br i1 %80, label %115, label %84

81:                                               ; preds = %37
  %82 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %82) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %82, i8* noundef nonnull align 16 dereferenceable(24) getelementptr inbounds ([24 x i8], [24 x i8]* @__const.layer3_filter.____fmt, i64 0, i64 0), i64 24, i1 false) #5
  %83 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %82, i64 noundef 24) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %82) #5
  br label %115

84:                                               ; preds = %74, %71, %64, %49
  %85 = phi %struct.vrrphdr* [ %65, %64 ], [ %78, %74 ], [ null, %71 ], [ null, %49 ]
  %86 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %41) #5
  %87 = bitcast i8* %86 to i64*
  %88 = icmp eq i8* %86, null
  br i1 %88, label %92, label %89

89:                                               ; preds = %84
  %90 = load i64, i64* %87, align 8, !tbaa !23
  %91 = add i64 %90, 1
  store i64 %91, i64* %87, align 8, !tbaa !23
  br label %115

92:                                               ; preds = %84
  %93 = icmp eq %struct.vrrphdr* %85, null
  br i1 %93, label %116, label %94

94:                                               ; preds = %92
  %95 = getelementptr %struct.vrrphdr, %struct.vrrphdr* %85, i64 0, i32 1
  %96 = load i8, i8* %95, align 1, !tbaa !24
  %97 = zext i8 %96 to i64
  %98 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %97, i32 2
  %99 = load i64, i64* %98, align 8, !tbaa !26
  %100 = add i64 %99, 1
  store i64 %100, i64* %98, align 8, !tbaa !26
  %101 = zext i16 %53 to i64
  %102 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %97, i32 4
  %103 = load i64, i64* %102, align 8, !tbaa !28
  %104 = add i64 %103, %101
  store i64 %104, i64* %102, align 8, !tbaa !28
  %105 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %97, i32 0
  %106 = load i32, i32* %105, align 8, !tbaa !29
  %107 = icmp eq i32 %106, 0
  br i1 %107, label %108, label %116

108:                                              ; preds = %94
  %109 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %97, i32 1
  %110 = load i64, i64* %109, align 8, !tbaa !30
  %111 = add i64 %110, 1
  store i64 %111, i64* %109, align 8, !tbaa !30
  %112 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %97, i32 3
  %113 = load i64, i64* %112, align 8, !tbaa !31
  %114 = add i64 %113, %101
  store i64 %114, i64* %112, align 8, !tbaa !31
  br label %115

115:                                              ; preds = %64, %74, %81, %89, %108
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %41) #5
  br label %134

116:                                              ; preds = %44, %68, %37, %92, %94
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %41) #5
  %117 = inttoptr i64 %8 to i16*
  %118 = load i16, i16* %117, align 2, !tbaa !32
  %119 = getelementptr inbounds i8, i8* %9, i64 2
  %120 = bitcast i8* %119 to i16*
  %121 = load i16, i16* %120, align 2, !tbaa !32
  %122 = getelementptr inbounds i8, i8* %9, i64 4
  %123 = bitcast i8* %122 to i16*
  %124 = load i16, i16* %123, align 2, !tbaa !32
  %125 = getelementptr inbounds i8, i8* %9, i64 6
  %126 = bitcast i8* %125 to i16*
  %127 = load i16, i16* %126, align 2, !tbaa !32
  store i16 %127, i16* %117, align 2, !tbaa !32
  %128 = getelementptr inbounds i8, i8* %9, i64 8
  %129 = bitcast i8* %128 to i16*
  %130 = load i16, i16* %129, align 2, !tbaa !32
  store i16 %130, i16* %120, align 2, !tbaa !32
  %131 = getelementptr inbounds i8, i8* %9, i64 10
  %132 = bitcast i8* %131 to i16*
  %133 = load i16, i16* %132, align 2, !tbaa !32
  store i16 %133, i16* %123, align 2, !tbaa !32
  store i16 %118, i16* %126, align 2, !tbaa !32
  store i16 %121, i16* %129, align 2, !tbaa !32
  store i16 %124, i16* %132, align 2, !tbaa !32
  br label %134

134:                                              ; preds = %26, %16, %1, %115, %116
  %135 = phi i32 [ 3, %116 ], [ 1, %115 ], [ 2, %1 ], [ 2, %16 ], [ 2, %26 ]
  ret i32 %135
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
!26 = !{!27, !7, i64 16}
!27 = !{!"vrrp_filter", !10, i64 0, !7, i64 8, !7, i64 16, !7, i64 24, !7, i64 32}
!28 = !{!27, !7, i64 32}
!29 = !{!27, !10, i64 0}
!30 = !{!27, !7, i64 8}
!31 = !{!27, !7, i64 24}
!32 = !{!14, !14, i64 0}

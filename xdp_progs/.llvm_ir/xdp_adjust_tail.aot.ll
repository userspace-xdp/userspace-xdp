; ModuleID = 'xdp_adjust_tail.bpf.c'
source_filename = "xdp_adjust_tail.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i32]*, i32*, i64*, [1 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@icmpcnt = dso_local local_unnamed_addr global %struct.anon zeroinitializer, align 8
@max_pcktsz = internal global i32 128, align 4
@__const.send_icmp4_too_big.____fmt = private unnamed_addr constant [24 x i8] c"xdp_adjust_head failed\0A\00", align 16
@__const.send_icmp4_too_big.____fmt.1 = private unnamed_addr constant [62 x i8] c"Invalid packet data + ICMP_TOOBIG_SIZE + headroom > data_end\0A\00", align 16
@__const.send_icmp4_too_big.____fmt.2 = private unnamed_addr constant [57 x i8] c"data: %p, ICMP_TOOBIG_SIZE + headroom: %d, data_end: %p\0A\00", align 16

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
  %2 = alloca i64, align 8
  %3 = alloca [24 x i8], align 16
  %4 = alloca [62 x i8], align 16
  %5 = alloca [57 x i8], align 16
  %6 = alloca i32, align 4
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !5
  %9 = inttoptr i64 %8 to i8*
  %10 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !11
  %12 = inttoptr i64 %11 to i8*
  %13 = getelementptr i8, i8* %12, i64 14
  %14 = icmp ugt i8* %13, %9
  br i1 %14, label %105, label %15

15:                                               ; preds = %1
  %16 = inttoptr i64 %11 to %struct.ethhdr*
  %17 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %16, i64 0, i32 2
  %18 = load i16, i16* %17, align 2, !tbaa !12
  %19 = icmp eq i16 %18, 8
  br i1 %19, label %20, label %105

20:                                               ; preds = %15
  %21 = sub i64 %8, %11
  %22 = trunc i64 %21 to i32
  %23 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %23)
  %24 = load volatile i32, i32* @max_pcktsz, align 4, !tbaa !15
  store volatile i32 %24, i32* %6, align 4, !tbaa !15
  %25 = load volatile i32, i32* %6, align 4, !tbaa !15
  %26 = icmp ugt i32 %25, 98
  br i1 %26, label %27, label %29

27:                                               ; preds = %20
  %28 = load volatile i32, i32* %6, align 4, !tbaa !15
  br label %29

29:                                               ; preds = %27, %20
  %30 = phi i32 [ %28, %27 ], [ 98, %20 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %23)
  %31 = icmp ult i32 %30, %22
  br i1 %31, label %32, label %105

32:                                               ; preds = %29
  %33 = tail call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0065 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef 0) #5
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %105

35:                                               ; preds = %32
  %36 = tail call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -28) #5
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %41, label %38

38:                                               ; preds = %35
  %39 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %39) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %39, i8* noundef nonnull align 16 dereferenceable(24) getelementptr inbounds ([24 x i8], [24 x i8]* @__const.send_icmp4_too_big.____fmt, i64 0, i64 0), i64 24, i1 false) #5
  %40 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %39, i64 noundef 24) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %39) #5
  br label %105

41:                                               ; preds = %35
  %42 = load i64, i64* %10, align 8, !tbaa !11
  %43 = inttoptr i64 %42 to i8*
  %44 = load i64, i64* %7, align 8, !tbaa !5
  %45 = inttoptr i64 %44 to i8*
  %46 = getelementptr i8, i8* %43, i64 126
  %47 = icmp ugt i8* %46, %45
  br i1 %47, label %48, label %53

48:                                               ; preds = %41
  %49 = getelementptr inbounds [62 x i8], [62 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %49) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %49, i8* noundef nonnull align 16 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @__const.send_icmp4_too_big.____fmt.1, i64 0, i64 0), i64 62, i1 false) #5
  %50 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %49, i64 noundef 62) #5
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %49) #5
  %51 = getelementptr inbounds [57 x i8], [57 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 57, i8* nonnull %51) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(57) %51, i8* noundef nonnull align 16 dereferenceable(57) getelementptr inbounds ([57 x i8], [57 x i8]* @__const.send_icmp4_too_big.____fmt.2, i64 0, i64 0), i64 57, i1 false) #5
  %52 = call i32 (i8*, i64, i8*, i32, i8*, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, i8*, i32, i8*, ...)*)(i8* noundef nonnull %51, i64 noundef 57, i8* noundef %43, i32 noundef 126, i8* noundef %45) #5
  call void @llvm.lifetime.end.p0i8(i64 57, i8* nonnull %51) #5
  br label %105

53:                                               ; preds = %41
  %54 = getelementptr i8, i8* %43, i64 28
  %55 = getelementptr inbounds i8, i8* %43, i64 6
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %55, i8* noundef nonnull align 2 dereferenceable(6) %54, i64 6, i1 false) #5
  %56 = getelementptr i8, i8* %43, i64 34
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %43, i8* noundef nonnull align 2 dereferenceable(6) %56, i64 6, i1 false) #5
  %57 = getelementptr i8, i8* %43, i64 40
  %58 = bitcast i8* %57 to i16*
  %59 = load i16, i16* %58, align 2, !tbaa !12
  %60 = getelementptr inbounds i8, i8* %43, i64 12
  %61 = bitcast i8* %60 to i16*
  store i16 %59, i16* %61, align 2, !tbaa !12
  %62 = getelementptr i8, i8* %43, i64 14
  store i8 3, i8* %56, align 4, !tbaa !16
  %63 = getelementptr i8, i8* %43, i64 35
  store i8 4, i8* %63, align 1, !tbaa !18
  %64 = load volatile i32, i32* @max_pcktsz, align 4, !tbaa !15
  %65 = trunc i32 %64 to i16
  %66 = add i16 %65, -14
  %67 = tail call i16 @llvm.bswap.i16(i16 %66) #5
  store i16 %67, i16* %58, align 2, !tbaa !19
  %68 = getelementptr i8, i8* %43, i64 36
  %69 = bitcast i8* %68 to i16*
  store i16 0, i16* %69, align 2, !tbaa !20
  %70 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef nonnull %56, i32 noundef 92, i32 noundef 0) #5
  %71 = lshr i32 %70, 16
  %72 = add i32 %71, %70
  %73 = trunc i32 %72 to i16
  %74 = xor i16 %73, -1
  store i16 %74, i16* %69, align 2, !tbaa !20
  %75 = getelementptr i8, i8* %43, i64 22
  store i8 64, i8* %75, align 4, !tbaa !21
  %76 = getelementptr i8, i8* %43, i64 54
  %77 = bitcast i8* %76 to i32*
  %78 = load i32, i32* %77, align 4, !tbaa !19
  %79 = getelementptr i8, i8* %43, i64 26
  %80 = getelementptr i8, i8* %43, i64 30
  %81 = bitcast i8* %80 to i32*
  store i32 %78, i32* %81, align 4, !tbaa !19
  %82 = getelementptr i8, i8* %43, i64 58
  %83 = bitcast i8* %82 to i32*
  %84 = load i32, i32* %83, align 4, !tbaa !19
  %85 = bitcast i8* %79 to i32*
  store i32 %84, i32* %85, align 4, !tbaa !19
  store i8 69, i8* %62, align 4
  %86 = getelementptr i8, i8* %43, i64 23
  store i8 1, i8* %86, align 1, !tbaa !23
  %87 = getelementptr i8, i8* %43, i64 15
  store i8 0, i8* %87, align 1, !tbaa !24
  %88 = getelementptr i8, i8* %43, i64 16
  %89 = bitcast i8* %88 to i16*
  store i16 28672, i16* %89, align 2, !tbaa !25
  %90 = getelementptr i8, i8* %43, i64 24
  %91 = bitcast i8* %90 to i16*
  store i16 0, i16* %91, align 2, !tbaa !26
  %92 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef nonnull %62, i32 noundef 20, i32 noundef 0) #5
  %93 = lshr i32 %92, 16
  %94 = add i32 %93, %92
  %95 = trunc i32 %94 to i16
  %96 = xor i16 %95, -1
  store i16 %96, i16* %91, align 2, !tbaa !26
  %97 = bitcast i64* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %97) #5
  store i64 0, i64* %2, align 8, !tbaa !27
  %98 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %97) #5
  %99 = bitcast i8* %98 to i64*
  %100 = icmp eq i8* %98, null
  br i1 %100, label %104, label %101

101:                                              ; preds = %53
  %102 = load i64, i64* %99, align 8, !tbaa !27
  %103 = add i64 %102, 1
  store i64 %103, i64* %99, align 8, !tbaa !27
  br label %104

104:                                              ; preds = %101, %53
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %97) #5
  br label %105

105:                                              ; preds = %104, %48, %38, %32, %29, %15, %1
  %106 = phi i32 [ 1, %1 ], [ 2, %15 ], [ 2, %32 ], [ 2, %29 ], [ 1, %38 ], [ 1, %48 ], [ 3, %104 ]
  ret i32 %106
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @_bpf_helper_ext_0065(...) local_unnamed_addr #2

declare i32 @_bpf_helper_ext_0044(...) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @_bpf_helper_ext_0006(...) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #4

declare i32 @_bpf_helper_ext_0028(...) local_unnamed_addr #2

declare i8* @_bpf_helper_ext_0001(...) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
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
!15 = !{!10, !10, i64 0}
!16 = !{!17, !8, i64 0}
!17 = !{!"icmphdr", !8, i64 0, !8, i64 1, !14, i64 2, !8, i64 4}
!18 = !{!17, !8, i64 1}
!19 = !{!8, !8, i64 0}
!20 = !{!17, !14, i64 2}
!21 = !{!22, !8, i64 8}
!22 = !{!"iphdr", !8, i64 0, !8, i64 0, !8, i64 1, !14, i64 2, !14, i64 4, !14, i64 6, !8, i64 8, !8, i64 9, !14, i64 10, !8, i64 12}
!23 = !{!22, !8, i64 9}
!24 = !{!22, !8, i64 1}
!25 = !{!22, !14, i64 2}
!26 = !{!22, !14, i64 10}
!27 = !{!7, !7, i64 0}

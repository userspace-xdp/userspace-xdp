; ModuleID = 'xdp_adjust_tail.bpf.c'
source_filename = "xdp_adjust_tail.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i32]*, i32*, i64*, [1 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@__const.xdp_pass.____fmt = private unnamed_addr constant [35 x i8] c"Invalid packet eth + 1 > data_end\0A\00", align 16
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
  %7 = alloca [35 x i8], align 16
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %9 = load i64, i64* %8, align 8, !tbaa !5
  %10 = inttoptr i64 %9 to i8*
  %11 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !11
  %13 = inttoptr i64 %12 to i8*
  %14 = getelementptr i8, i8* %13, i64 1
  %15 = icmp ugt i8* %14, %10
  br i1 %15, label %16, label %19

16:                                               ; preds = %1
  %17 = getelementptr inbounds [35 x i8], [35 x i8]* %7, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 35, i8* nonnull %17) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(35) %17, i8* noundef nonnull align 16 dereferenceable(35) getelementptr inbounds ([35 x i8], [35 x i8]* @__const.xdp_pass.____fmt, i64 0, i64 0), i64 35, i1 false)
  %18 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %17, i64 noundef 35) #5
  call void @llvm.lifetime.end.p0i8(i64 35, i8* nonnull %17) #5
  br label %108

19:                                               ; preds = %1
  %20 = inttoptr i64 %12 to %struct.ethhdr*
  %21 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %20, i64 0, i32 2
  %22 = load i16, i16* %21, align 2, !tbaa !12
  %23 = icmp eq i16 %22, 8
  br i1 %23, label %24, label %108

24:                                               ; preds = %19
  %25 = sub i64 %9, %12
  %26 = trunc i64 %25 to i32
  %27 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %27)
  %28 = load volatile i32, i32* @max_pcktsz, align 4, !tbaa !15
  store volatile i32 %28, i32* %6, align 4, !tbaa !15
  %29 = load volatile i32, i32* %6, align 4, !tbaa !15
  %30 = icmp ugt i32 %29, 98
  br i1 %30, label %31, label %33

31:                                               ; preds = %24
  %32 = load volatile i32, i32* %6, align 4, !tbaa !15
  br label %33

33:                                               ; preds = %31, %24
  %34 = phi i32 [ %32, %31 ], [ 98, %24 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %27)
  %35 = icmp ult i32 %34, %26
  br i1 %35, label %36, label %108

36:                                               ; preds = %33
  %37 = sub i32 98, %26
  %38 = tail call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0065 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef %37) #5
  %39 = tail call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -28) #5
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %44, label %41

41:                                               ; preds = %36
  %42 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %42) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %42, i8* noundef nonnull align 16 dereferenceable(24) getelementptr inbounds ([24 x i8], [24 x i8]* @__const.send_icmp4_too_big.____fmt, i64 0, i64 0), i64 24, i1 false) #5
  %43 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %42, i64 noundef 24) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %42) #5
  br label %108

44:                                               ; preds = %36
  %45 = load i64, i64* %11, align 8, !tbaa !11
  %46 = inttoptr i64 %45 to i8*
  %47 = load i64, i64* %8, align 8, !tbaa !5
  %48 = inttoptr i64 %47 to i8*
  %49 = getelementptr i8, i8* %46, i64 126
  %50 = icmp ugt i8* %49, %48
  br i1 %50, label %51, label %56

51:                                               ; preds = %44
  %52 = getelementptr inbounds [62 x i8], [62 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %52) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %52, i8* noundef nonnull align 16 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @__const.send_icmp4_too_big.____fmt.1, i64 0, i64 0), i64 62, i1 false) #5
  %53 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %52, i64 noundef 62) #5
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %52) #5
  %54 = getelementptr inbounds [57 x i8], [57 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 57, i8* nonnull %54) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(57) %54, i8* noundef nonnull align 16 dereferenceable(57) getelementptr inbounds ([57 x i8], [57 x i8]* @__const.send_icmp4_too_big.____fmt.2, i64 0, i64 0), i64 57, i1 false) #5
  %55 = call i32 (i8*, i64, i8*, i32, i8*, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, i8*, i32, i8*, ...)*)(i8* noundef nonnull %54, i64 noundef 57, i8* noundef %46, i32 noundef 126, i8* noundef %48) #5
  call void @llvm.lifetime.end.p0i8(i64 57, i8* nonnull %54) #5
  br label %108

56:                                               ; preds = %44
  %57 = getelementptr i8, i8* %46, i64 28
  %58 = getelementptr inbounds i8, i8* %46, i64 6
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %58, i8* noundef nonnull align 2 dereferenceable(6) %57, i64 6, i1 false) #5
  %59 = getelementptr i8, i8* %46, i64 34
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %46, i8* noundef nonnull align 2 dereferenceable(6) %59, i64 6, i1 false) #5
  %60 = getelementptr i8, i8* %46, i64 40
  %61 = bitcast i8* %60 to i16*
  %62 = load i16, i16* %61, align 2, !tbaa !12
  %63 = getelementptr inbounds i8, i8* %46, i64 12
  %64 = bitcast i8* %63 to i16*
  store i16 %62, i16* %64, align 2, !tbaa !12
  %65 = getelementptr i8, i8* %46, i64 14
  store i8 3, i8* %59, align 4, !tbaa !16
  %66 = getelementptr i8, i8* %46, i64 35
  store i8 4, i8* %66, align 1, !tbaa !18
  %67 = load volatile i32, i32* @max_pcktsz, align 4, !tbaa !15
  %68 = trunc i32 %67 to i16
  %69 = add i16 %68, -14
  %70 = tail call i16 @llvm.bswap.i16(i16 %69) #5
  store i16 %70, i16* %61, align 2, !tbaa !19
  %71 = getelementptr i8, i8* %46, i64 36
  %72 = bitcast i8* %71 to i16*
  store i16 0, i16* %72, align 2, !tbaa !20
  %73 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef nonnull %59, i32 noundef 92, i32 noundef 0) #5
  %74 = lshr i32 %73, 16
  %75 = add i32 %74, %73
  %76 = trunc i32 %75 to i16
  %77 = xor i16 %76, -1
  store i16 %77, i16* %72, align 2, !tbaa !20
  %78 = getelementptr i8, i8* %46, i64 22
  store i8 64, i8* %78, align 4, !tbaa !21
  %79 = getelementptr i8, i8* %46, i64 54
  %80 = bitcast i8* %79 to i32*
  %81 = load i32, i32* %80, align 4, !tbaa !19
  %82 = getelementptr i8, i8* %46, i64 26
  %83 = getelementptr i8, i8* %46, i64 30
  %84 = bitcast i8* %83 to i32*
  store i32 %81, i32* %84, align 4, !tbaa !19
  %85 = getelementptr i8, i8* %46, i64 58
  %86 = bitcast i8* %85 to i32*
  %87 = load i32, i32* %86, align 4, !tbaa !19
  %88 = bitcast i8* %82 to i32*
  store i32 %87, i32* %88, align 4, !tbaa !19
  store i8 69, i8* %65, align 4
  %89 = getelementptr i8, i8* %46, i64 23
  store i8 1, i8* %89, align 1, !tbaa !23
  %90 = getelementptr i8, i8* %46, i64 15
  store i8 0, i8* %90, align 1, !tbaa !24
  %91 = getelementptr i8, i8* %46, i64 16
  %92 = bitcast i8* %91 to i16*
  store i16 28672, i16* %92, align 2, !tbaa !25
  %93 = getelementptr i8, i8* %46, i64 24
  %94 = bitcast i8* %93 to i16*
  store i16 0, i16* %94, align 2, !tbaa !26
  %95 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef nonnull %65, i32 noundef 20, i32 noundef 0) #5
  %96 = lshr i32 %95, 16
  %97 = add i32 %96, %95
  %98 = trunc i32 %97 to i16
  %99 = xor i16 %98, -1
  store i16 %99, i16* %94, align 2, !tbaa !26
  %100 = bitcast i64* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %100) #5
  store i64 0, i64* %2, align 8, !tbaa !27
  %101 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %100) #5
  %102 = bitcast i8* %101 to i64*
  %103 = icmp eq i8* %101, null
  br i1 %103, label %107, label %104

104:                                              ; preds = %56
  %105 = load i64, i64* %102, align 8, !tbaa !27
  %106 = add i64 %105, 1
  store i64 %106, i64* %102, align 8, !tbaa !27
  br label %107

107:                                              ; preds = %104, %56
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %100) #5
  br label %108

108:                                              ; preds = %107, %51, %41, %33, %19, %16
  %109 = phi i32 [ 1, %16 ], [ 2, %19 ], [ 2, %33 ], [ 1, %41 ], [ 1, %51 ], [ 3, %107 ]
  ret i32 %109
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @_bpf_helper_ext_0006(...) local_unnamed_addr #3

declare i32 @_bpf_helper_ext_0065(...) local_unnamed_addr #3

declare i32 @_bpf_helper_ext_0044(...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #4

declare i32 @_bpf_helper_ext_0028(...) local_unnamed_addr #3

declare i8* @_bpf_helper_ext_0001(...) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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

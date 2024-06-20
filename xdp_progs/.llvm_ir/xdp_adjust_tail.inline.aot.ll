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
@__icmpcnt.0 = internal unnamed_addr global i64 0, align 8

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
  %2 = alloca [24 x i8], align 16
  %3 = alloca [62 x i8], align 16
  %4 = alloca [57 x i8], align 16
  %5 = alloca i32, align 4
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %7 = load i64, i64* %6, align 8, !tbaa !5
  %8 = inttoptr i64 %7 to i8*
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !11
  %11 = inttoptr i64 %10 to i8*
  %12 = getelementptr i8, i8* %11, i64 14
  %13 = icmp ugt i8* %12, %8
  br i1 %13, label %98, label %14

14:                                               ; preds = %1
  %15 = inttoptr i64 %10 to %struct.ethhdr*
  %16 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %15, i64 0, i32 2
  %17 = load i16, i16* %16, align 2, !tbaa !12
  %18 = icmp eq i16 %17, 8
  br i1 %18, label %19, label %98

19:                                               ; preds = %14
  %20 = sub i64 %7, %10
  %21 = trunc i64 %20 to i32
  %22 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %22)
  %23 = load volatile i32, i32* @max_pcktsz, align 4, !tbaa !15
  store volatile i32 %23, i32* %5, align 4, !tbaa !15
  %24 = load volatile i32, i32* %5, align 4, !tbaa !15
  %25 = icmp ugt i32 %24, 98
  br i1 %25, label %26, label %28

26:                                               ; preds = %19
  %27 = load volatile i32, i32* %5, align 4, !tbaa !15
  br label %28

28:                                               ; preds = %26, %19
  %29 = phi i32 [ %27, %26 ], [ 98, %19 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %22)
  %30 = icmp ult i32 %29, %21
  br i1 %30, label %31, label %98

31:                                               ; preds = %28
  %32 = tail call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0065 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef 0) #5
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %98

34:                                               ; preds = %31
  %35 = tail call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -28) #5
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %40, label %37

37:                                               ; preds = %34
  %38 = getelementptr inbounds [24 x i8], [24 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %38) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %38, i8* noundef nonnull align 16 dereferenceable(24) getelementptr inbounds ([24 x i8], [24 x i8]* @__const.send_icmp4_too_big.____fmt, i64 0, i64 0), i64 24, i1 false) #5
  %39 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %38, i64 noundef 24) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %38) #5
  br label %98

40:                                               ; preds = %34
  %41 = load i64, i64* %9, align 8, !tbaa !11
  %42 = inttoptr i64 %41 to i8*
  %43 = load i64, i64* %6, align 8, !tbaa !5
  %44 = inttoptr i64 %43 to i8*
  %45 = getelementptr i8, i8* %42, i64 126
  %46 = icmp ugt i8* %45, %44
  br i1 %46, label %47, label %52

47:                                               ; preds = %40
  %48 = getelementptr inbounds [62 x i8], [62 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 62, i8* nonnull %48) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(62) %48, i8* noundef nonnull align 16 dereferenceable(62) getelementptr inbounds ([62 x i8], [62 x i8]* @__const.send_icmp4_too_big.____fmt.1, i64 0, i64 0), i64 62, i1 false) #5
  %49 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %48, i64 noundef 62) #5
  call void @llvm.lifetime.end.p0i8(i64 62, i8* nonnull %48) #5
  %50 = getelementptr inbounds [57 x i8], [57 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 57, i8* nonnull %50) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(57) %50, i8* noundef nonnull align 16 dereferenceable(57) getelementptr inbounds ([57 x i8], [57 x i8]* @__const.send_icmp4_too_big.____fmt.2, i64 0, i64 0), i64 57, i1 false) #5
  %51 = call i32 (i8*, i64, i8*, i32, i8*, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, i8*, i32, i8*, ...)*)(i8* noundef nonnull %50, i64 noundef 57, i8* noundef %42, i32 noundef 126, i8* noundef %44) #5
  call void @llvm.lifetime.end.p0i8(i64 57, i8* nonnull %50) #5
  br label %98

52:                                               ; preds = %40
  %53 = getelementptr i8, i8* %42, i64 28
  %54 = getelementptr inbounds i8, i8* %42, i64 6
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %54, i8* noundef nonnull align 2 dereferenceable(6) %53, i64 6, i1 false) #5
  %55 = getelementptr i8, i8* %42, i64 34
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %42, i8* noundef nonnull align 2 dereferenceable(6) %55, i64 6, i1 false) #5
  %56 = getelementptr i8, i8* %42, i64 40
  %57 = bitcast i8* %56 to i16*
  %58 = load i16, i16* %57, align 2, !tbaa !12
  %59 = getelementptr inbounds i8, i8* %42, i64 12
  %60 = bitcast i8* %59 to i16*
  store i16 %58, i16* %60, align 2, !tbaa !12
  %61 = getelementptr i8, i8* %42, i64 14
  store i8 3, i8* %55, align 4, !tbaa !16
  %62 = getelementptr i8, i8* %42, i64 35
  store i8 4, i8* %62, align 1, !tbaa !18
  %63 = load volatile i32, i32* @max_pcktsz, align 4, !tbaa !15
  %64 = trunc i32 %63 to i16
  %65 = add i16 %64, -14
  %66 = tail call i16 @llvm.bswap.i16(i16 %65) #5
  store i16 %66, i16* %57, align 2, !tbaa !19
  %67 = getelementptr i8, i8* %42, i64 36
  %68 = bitcast i8* %67 to i16*
  store i16 0, i16* %68, align 2, !tbaa !20
  %69 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef nonnull %55, i32 noundef 92, i32 noundef 0) #5
  %70 = lshr i32 %69, 16
  %71 = add i32 %70, %69
  %72 = trunc i32 %71 to i16
  %73 = xor i16 %72, -1
  store i16 %73, i16* %68, align 2, !tbaa !20
  %74 = getelementptr i8, i8* %42, i64 22
  store i8 64, i8* %74, align 4, !tbaa !21
  %75 = getelementptr i8, i8* %42, i64 54
  %76 = bitcast i8* %75 to i32*
  %77 = load i32, i32* %76, align 4, !tbaa !19
  %78 = getelementptr i8, i8* %42, i64 26
  %79 = getelementptr i8, i8* %42, i64 30
  %80 = bitcast i8* %79 to i32*
  store i32 %77, i32* %80, align 4, !tbaa !19
  %81 = getelementptr i8, i8* %42, i64 58
  %82 = bitcast i8* %81 to i32*
  %83 = load i32, i32* %82, align 4, !tbaa !19
  %84 = bitcast i8* %78 to i32*
  store i32 %83, i32* %84, align 4, !tbaa !19
  store i8 69, i8* %61, align 4
  %85 = getelementptr i8, i8* %42, i64 23
  store i8 1, i8* %85, align 1, !tbaa !23
  %86 = getelementptr i8, i8* %42, i64 15
  store i8 0, i8* %86, align 1, !tbaa !24
  %87 = getelementptr i8, i8* %42, i64 16
  %88 = bitcast i8* %87 to i16*
  store i16 28672, i16* %88, align 2, !tbaa !25
  %89 = getelementptr i8, i8* %42, i64 24
  %90 = bitcast i8* %89 to i16*
  store i16 0, i16* %90, align 2, !tbaa !26
  %91 = tail call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef nonnull %61, i32 noundef 20, i32 noundef 0) #5
  %92 = lshr i32 %91, 16
  %93 = add i32 %92, %91
  %94 = trunc i32 %93 to i16
  %95 = xor i16 %94, -1
  store i16 %95, i16* %90, align 2, !tbaa !26
  %96 = load i64, i64* @__icmpcnt.0, align 8, !tbaa !27
  %97 = add i64 %96, 1
  store i64 %97, i64* @__icmpcnt.0, align 8, !tbaa !27
  br label %98

98:                                               ; preds = %52, %47, %37, %31, %28, %14, %1
  %99 = phi i32 [ 1, %1 ], [ 2, %14 ], [ 2, %31 ], [ 2, %28 ], [ 1, %37 ], [ 1, %47 ], [ 3, %52 ]
  ret i32 %99
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

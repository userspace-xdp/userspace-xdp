; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.llvm_ir/xdp-tcpclassify.bpf.ll'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md_userspace = type { i64, i64, i32, i32, i32, i32, i64, i64 }

declare i64 @__lddw_helper_map_by_fd(i32) local_unnamed_addr

declare i64 @__lddw_helper_map_val(i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0130(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0182(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0189(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin114 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin114, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = ptrtoint ptr %0 to i64
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load i64, ptr %4, align 4
  %6 = load i64, ptr %0, align 4
  %7 = add i64 %6, 14
  %8 = icmp ugt i64 %7, %5
  br i1 %8, label %bb_inst_101, label %bb_inst_7

bb_inst_7:                                        ; preds = %setupBlock
  %9 = inttoptr i64 %6 to ptr
  %10 = getelementptr i8, ptr %9, i64 12
  %11 = load i16, ptr %10, align 2
  %.not = icmp eq i16 %11, 8
  br i1 %.not, label %bb_inst_9, label %bb_inst_101

bb_inst_9:                                        ; preds = %bb_inst_7
  %12 = add i64 %6, 34
  %13 = icmp ugt i64 %12, %5
  br i1 %13, label %bb_inst_101, label %bb_inst_12

bb_inst_12:                                       ; preds = %bb_inst_9
  %14 = inttoptr i64 %7 to ptr
  %15 = getelementptr i8, ptr %14, i64 9
  %16 = load i8, ptr %15, align 1
  %.not115 = icmp ne i8 %16, 6
  %17 = add i64 %6, 54
  %18 = icmp ugt i64 %17, %5
  %or.cond = select i1 %.not115, i1 true, i1 %18
  br i1 %or.cond, label %bb_inst_101, label %bb_inst_17

bb_inst_17:                                       ; preds = %bb_inst_12
  %19 = getelementptr i8, ptr %14, i64 12
  %20 = load i32, ptr %19, align 4
  %21 = getelementptr inbounds i8, ptr %stackEnd, i64 -296
  store i32 %20, ptr %21, align 8
  %22 = getelementptr i8, ptr %14, i64 16
  %23 = load i32, ptr %22, align 4
  %24 = getelementptr inbounds i8, ptr %stackEnd, i64 -292
  store i32 %23, ptr %24, align 4
  %25 = inttoptr i64 %12 to ptr
  %26 = load i16, ptr %25, align 2
  %rev = call i16 @llvm.bswap.i16(i16 %26)
  %27 = zext i16 %rev to i32
  %28 = getelementptr inbounds i8, ptr %stackEnd, i64 -304
  store i32 %27, ptr %28, align 8
  %29 = getelementptr i8, ptr %25, i64 2
  %30 = load i16, ptr %29, align 2
  %rev116 = call i16 @llvm.bswap.i16(i16 %30)
  %31 = zext i16 %rev116 to i32
  %32 = getelementptr inbounds i8, ptr %stackEnd, i64 -300
  store i32 %31, ptr %32, align 4
  %33 = getelementptr i8, ptr %25, i64 12
  %34 = load i16, ptr %33, align 2
  %35 = lshr i16 %34, 9
  %36 = and i16 %35, 1
  %37 = zext i16 %36 to i32
  %38 = getelementptr inbounds i8, ptr %stackEnd, i64 -288
  store i32 %37, ptr %38, align 8
  %39 = load i16, ptr %33, align 2
  %40 = lshr i16 %39, 8
  %41 = and i16 %40, 1
  %42 = zext i16 %41 to i32
  %43 = getelementptr inbounds i8, ptr %stackEnd, i64 -284
  store i32 %42, ptr %43, align 4
  %44 = load i16, ptr %33, align 2
  %45 = lshr i16 %44, 10
  %46 = and i16 %45, 1
  %47 = zext i16 %46 to i32
  %48 = getelementptr inbounds i8, ptr %stackEnd, i64 -280
  store i32 %47, ptr %48, align 8
  %49 = load i16, ptr %33, align 2
  %50 = lshr i16 %49, 11
  %51 = and i16 %50, 1
  %52 = zext i16 %51 to i32
  %53 = getelementptr inbounds i8, ptr %stackEnd, i64 -276
  store i32 %52, ptr %53, align 4
  %54 = sub i64 %5, %6
  %55 = load i16, ptr %33, align 2
  %56 = trunc i64 %54 to i32
  %57 = getelementptr inbounds i8, ptr %stackEnd, i64 -264
  store i32 %56, ptr %57, align 8
  %58 = lshr i16 %55, 12
  %59 = and i16 %58, 1
  %60 = zext i16 %59 to i32
  %61 = getelementptr inbounds i8, ptr %stackEnd, i64 -272
  store i32 %60, ptr %61, align 8
  %62 = load i16, ptr %33, align 2
  %63 = lshr i16 %62, 2
  %64 = and i16 %63, 60
  %65 = zext i16 %64 to i64
  %66 = add i64 %6, 38
  %67 = add i64 %66, %65
  %.not117 = icmp ult i64 %67, %5
  br i1 %.not117, label %bb_inst_56, label %bb_inst_72

bb_inst_56:                                       ; preds = %bb_inst_17
  %68 = add i64 %2, -260
  %69 = call i64 @bpf_helper_ext_0189(i64 %3, i64 0, i64 %68, i64 4, i64 undef)
  %70 = call i64 @__lddw_helper_map_by_fd(i32 5)
  %71 = call i64 @__lddw_helper_map_val(i64 %70)
  %72 = call i64 @bpf_helper_ext_0182(i64 %68, i64 4, i64 %71, i64 4, i64 undef)
  %73 = icmp eq i64 %72, 0
  %74 = zext i1 %73 to i32
  %75 = getelementptr inbounds i8, ptr %stackEnd, i64 -268
  store i32 %74, ptr %75, align 4
  br label %bb_inst_72

bb_inst_72:                                       ; preds = %bb_inst_56, %bb_inst_17
  %76 = add i64 %6, 60
  %.not118 = icmp ult i64 %76, %5
  br i1 %.not118, label %bb_inst_75, label %bb_inst_81

bb_inst_75:                                       ; preds = %bb_inst_72
  %77 = add i64 %2, -260
  %78 = call i64 @bpf_helper_ext_0189(i64 %3, i64 0, i64 %77, i64 60, i64 undef)
  br label %bb_inst_81

bb_inst_81:                                       ; preds = %bb_inst_75, %bb_inst_72
  %79 = add i64 %2, -304
  %80 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %81 = call i64 @_bpf_helper_ext_0130(i64 %80, i64 %79, i64 300, i64 0, i64 undef)
  %82 = load i16, ptr %9, align 2
  %83 = getelementptr i8, ptr %9, i64 6
  %84 = load i16, ptr %83, align 2
  store i16 %84, ptr %9, align 2
  %85 = getelementptr i8, ptr %9, i64 2
  %86 = load i16, ptr %85, align 2
  %87 = getelementptr i8, ptr %9, i64 8
  %88 = load i16, ptr %87, align 2
  store i16 %88, ptr %85, align 2
  %89 = getelementptr i8, ptr %9, i64 4
  %90 = load i16, ptr %89, align 2
  %91 = getelementptr i8, ptr %9, i64 10
  %92 = load i16, ptr %91, align 2
  store i16 %92, ptr %89, align 2
  store i16 %82, ptr %83, align 2
  store i16 %86, ptr %87, align 2
  store i16 %90, ptr %91, align 2
  br label %bb_inst_101

bb_inst_101:                                      ; preds = %bb_inst_81, %bb_inst_12, %bb_inst_9, %bb_inst_7, %setupBlock
  %r0.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_7 ], [ 2, %bb_inst_9 ], [ 2, %bb_inst_12 ], [ 3, %bb_inst_81 ]
  ret i64 %r0.0
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

; Function Attrs: nounwind optnone uwtable
define dso_local i64 @bpf_helper_ext_0189(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca %struct.xdp_md_userspace*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i64, align 8
  store i64 %0, i64* %5, align 8
  store i64 %1, i64* %6, align 8
  store i64 %2, i64* %7, align 8
  store i64 %3, i64* %8, align 8
  %14 = load i64, i64* %5, align 8
  %15 = inttoptr i64 %14 to %struct.xdp_md_userspace*
  store %struct.xdp_md_userspace* %15, %struct.xdp_md_userspace** %9, align 8
  %16 = load %struct.xdp_md_userspace*, %struct.xdp_md_userspace** %9, align 8
  %17 = getelementptr inbounds %struct.xdp_md_userspace, %struct.xdp_md_userspace* %16, i32 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = load i64, i64* %6, align 8
  %20 = add i64 %18, %19
  store i64 %20, i64* %10, align 8
  %21 = load i64, i64* %7, align 8
  %22 = inttoptr i64 %21 to i8*
  store i8* %22, i8** %11, align 8
  %23 = load i64, i64* %10, align 8
  %24 = inttoptr i64 %23 to i8*
  store i8* %24, i8** %12, align 8
  store i64 0, i64* %13, align 8
  br label %25

25:                                               ; preds = %37, %4
  %26 = load i64, i64* %13, align 8
  %27 = load i64, i64* %8, align 8
  %28 = icmp ult i64 %26, %27
  br i1 %28, label %29, label %40

29:                                               ; preds = %25
  %30 = load i8*, i8** %12, align 8
  %31 = load i64, i64* %13, align 8
  %32 = getelementptr inbounds i8, i8* %30, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = load i8*, i8** %11, align 8
  %35 = load i64, i64* %13, align 8
  %36 = getelementptr inbounds i8, i8* %34, i64 %35
  store i8 %33, i8* %36, align 1
  br label %37

37:                                               ; preds = %29
  %38 = load i64, i64* %13, align 8
  %39 = add i64 %38, 1
  store i64 %39, i64* %13, align 8
  br label %25, !llvm.loop !6

40:                                               ; preds = %25
  ret i64 0
}

; Function Attrs: nounwind optnone uwtable
define dso_local i64 @bpf_helper_ext_0182(i64 noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64, align 8
  store i64 %0, i64* %5, align 8
  store i64 %1, i64* %6, align 8
  store i64 %2, i64* %7, align 8
  %11 = load i64, i64* %5, align 8
  %12 = inttoptr i64 %11 to i8*
  store i8* %12, i8** %8, align 8
  %13 = load i64, i64* %7, align 8
  %14 = inttoptr i64 %13 to i8*
  store i8* %14, i8** %9, align 8
  store i64 0, i64* %10, align 8
  br label %15

15:                                               ; preds = %59, %3
  %16 = load i64, i64* %10, align 8
  %17 = load i64, i64* %6, align 8
  %18 = icmp ult i64 %16, %17
  br i1 %18, label %19, label %62

19:                                               ; preds = %15
  %20 = load i8*, i8** %8, align 8
  %21 = load i64, i64* %10, align 8
  %22 = getelementptr inbounds i8, i8* %20, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = load i8*, i8** %9, align 8
  %26 = load i64, i64* %10, align 8
  %27 = getelementptr inbounds i8, i8* %25, i64 %26
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = icmp ne i32 %24, %29
  br i1 %30, label %45, label %31

31:                                               ; preds = %19
  %32 = load i8*, i8** %8, align 8
  %33 = load i64, i64* %10, align 8
  %34 = getelementptr inbounds i8, i8* %32, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %45, label %38

38:                                               ; preds = %31
  %39 = load i8*, i8** %9, align 8
  %40 = load i64, i64* %10, align 8
  %41 = getelementptr inbounds i8, i8* %39, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = sext i8 %42 to i32
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %58

45:                                               ; preds = %38, %31, %19
  %46 = load i8*, i8** %8, align 8
  %47 = load i64, i64* %10, align 8
  %48 = getelementptr inbounds i8, i8* %46, i64 %47
  %49 = load i8, i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = load i8*, i8** %9, align 8
  %52 = load i64, i64* %10, align 8
  %53 = getelementptr inbounds i8, i8* %51, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = sub nsw i32 %50, %55
  %57 = sext i32 %56 to i64
  store i64 %57, i64* %4, align 8
  br label %63

58:                                               ; preds = %38
  br label %59

59:                                               ; preds = %58
  %60 = load i64, i64* %10, align 8
  %61 = add i64 %60, 1
  store i64 %61, i64* %10, align 8
  br label %15, !llvm.loop !8

62:                                               ; preds = %15
  store i64 0, i64* %4, align 8
  br label %63

63:                                               ; preds = %62, %45
  %64 = load i64, i64* %4, align 8
  ret i64 %64
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}

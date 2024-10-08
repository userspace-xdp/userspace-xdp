; ModuleID = '.llvm_ir/xdping.bpf.ll'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin77 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin77, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = load i64, ptr %0, align 4
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load i64, ptr %4, align 4
  %6 = add i64 %3, 98
  %7 = icmp ugt i64 %6, %5
  br i1 %7, label %bb_inst_76, label %bb_inst_6

bb_inst_6:                                        ; preds = %setupBlock
  %8 = inttoptr i64 %3 to ptr
  %9 = getelementptr i8, ptr %8, i64 12
  %10 = load i16, ptr %9, align 2
  %.not = icmp eq i16 %10, 8
  br i1 %.not, label %bb_inst_8, label %bb_inst_76

bb_inst_8:                                        ; preds = %bb_inst_6
  %11 = add i64 %3, 14
  %12 = inttoptr i64 %11 to ptr
  %13 = getelementptr i8, ptr %12, i64 9
  %14 = load i8, ptr %13, align 1
  %.not78 = icmp eq i8 %14, 1
  br i1 %.not78, label %bb_inst_12, label %bb_inst_76

bb_inst_12:                                       ; preds = %bb_inst_8
  %15 = add i64 %3, 34
  %.not79 = icmp ult i64 %5, %15
  br i1 %.not79, label %bb_inst_17, label %bb_inst_35

bb_inst_17:                                       ; preds = %bb_inst_12
  %16 = getelementptr inbounds i8, ptr %stackEnd, i64 -6
  store i8 0, ptr %16, align 2
  %17 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i16 2672, ptr %17, align 8
  %18 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i64 7882259360673000545, ptr %18, align 8
  %19 = getelementptr inbounds i8, ptr %stackEnd, i64 -24
  store i64 8533873931993441824, ptr %19, align 8
  %20 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  store i64 6004214541667288152, ptr %20, align 8
  %21 = add i64 %2, -32
  %22 = call i64 @_bpf_helper_ext_0006(i64 %21, i64 27, i64 0, i64 undef, i64 undef)
  br label %bb_inst_76

bb_inst_35:                                       ; preds = %bb_inst_12
  %23 = getelementptr i8, ptr %12, i64 12
  %24 = load i32, ptr %23, align 4
  %25 = load i16, ptr %8, align 2
  %26 = getelementptr i8, ptr %8, i64 6
  %27 = load i16, ptr %26, align 2
  store i16 %27, ptr %8, align 2
  %28 = getelementptr i8, ptr %8, i64 8
  %29 = load i16, ptr %28, align 2
  %30 = getelementptr i8, ptr %8, i64 2
  %31 = load i16, ptr %30, align 2
  store i16 %31, ptr %28, align 2
  store i16 %29, ptr %30, align 2
  %32 = getelementptr i8, ptr %8, i64 10
  %33 = load i16, ptr %32, align 2
  %34 = getelementptr i8, ptr %8, i64 4
  %35 = load i16, ptr %34, align 2
  store i16 %35, ptr %32, align 2
  store i16 %25, ptr %26, align 2
  store i16 %33, ptr %34, align 2
  %36 = getelementptr i8, ptr %12, i64 16
  %37 = load i32, ptr %36, align 4
  store i32 %37, ptr %23, align 4
  store i32 %24, ptr %36, align 4
  %38 = inttoptr i64 %15 to ptr
  store i8 0, ptr %38, align 1
  %39 = getelementptr i8, ptr %38, i64 2
  store i16 0, ptr %39, align 2
  %40 = call i64 @bpf_helper_ext_0028(i64 0, i64 0, i64 %15, i64 64, i64 0)
  %41 = and i64 %40, 65535
  %42 = lshr i64 %40, 16
  %43 = and i64 %42, 65535
  %44 = add nuw nsw i64 %43, %41
  %45 = lshr i64 %44, 16
  %46 = add nuw nsw i64 %45, %44
  %47 = trunc i64 %46 to i16
  %48 = xor i16 %47, -1
  store i16 %48, ptr %39, align 2
  br label %bb_inst_76

bb_inst_76:                                       ; preds = %bb_inst_35, %bb_inst_17, %bb_inst_8, %bb_inst_6, %setupBlock
  %r7.0 = phi i64 [ 2, %setupBlock ], [ 2, %bb_inst_6 ], [ 2, %bb_inst_8 ], [ 3, %bb_inst_35 ], [ 2, %bb_inst_17 ]
  ret i64 %r7.0
}

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i64 @bpf_helper_ext_0028(i64 noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4) local_unnamed_addr #0 {
  %6 = trunc i64 %1 to i32
  %7 = trunc i64 %4 to i32
  %8 = or i64 %3, %1
  %9 = and i64 %8, 3
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %111

11:                                               ; preds = %5
  %12 = trunc i64 %3 to i32
  %13 = icmp ne i64 %2, 0
  %14 = icmp sgt i32 %12, 1
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %57

16:                                               ; preds = %11
  %17 = lshr i64 %3, 1
  %18 = inttoptr i64 %2 to i16*
  %19 = and i64 %17, 2147483647
  %20 = icmp ult i64 %19, 8
  br i1 %20, label %45, label %21

21:                                               ; preds = %16
  %22 = and i64 %17, 7
  %23 = sub nsw i64 %19, %22
  %24 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %7, i64 0
  br label %25

25:                                               ; preds = %25, %21
  %26 = phi i64 [ 0, %21 ], [ %39, %25 ]
  %27 = phi <4 x i32> [ %24, %21 ], [ %37, %25 ]
  %28 = phi <4 x i32> [ zeroinitializer, %21 ], [ %38, %25 ]
  %29 = getelementptr inbounds i16, i16* %18, i64 %26
  %30 = bitcast i16* %29 to <4 x i16>*
  %31 = load <4 x i16>, <4 x i16>* %30, align 2, !tbaa !5
  %32 = getelementptr inbounds i16, i16* %29, i64 4
  %33 = bitcast i16* %32 to <4 x i16>*
  %34 = load <4 x i16>, <4 x i16>* %33, align 2, !tbaa !5
  %35 = zext <4 x i16> %31 to <4 x i32>
  %36 = zext <4 x i16> %34 to <4 x i32>
  %37 = add <4 x i32> %27, %35
  %38 = add <4 x i32> %28, %36
  %39 = add nuw i64 %26, 8
  %40 = icmp eq i64 %39, %23
  br i1 %40, label %41, label %25, !llvm.loop !9

41:                                               ; preds = %25
  %42 = add <4 x i32> %38, %37
  %43 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %42)
  %44 = icmp eq i64 %22, 0
  br i1 %44, label %57, label %45

45:                                               ; preds = %16, %41
  %46 = phi i64 [ 0, %16 ], [ %23, %41 ]
  %47 = phi i32 [ %7, %16 ], [ %43, %41 ]
  br label %48

48:                                               ; preds = %45, %48
  %49 = phi i64 [ %55, %48 ], [ %46, %45 ]
  %50 = phi i32 [ %54, %48 ], [ %47, %45 ]
  %51 = getelementptr inbounds i16, i16* %18, i64 %49
  %52 = load i16, i16* %51, align 2, !tbaa !5
  %53 = zext i16 %52 to i32
  %54 = add nsw i32 %50, %53
  %55 = add nuw nsw i64 %49, 1
  %56 = icmp eq i64 %55, %19
  br i1 %56, label %57, label %48, !llvm.loop !12

57:                                               ; preds = %48, %41, %11
  %58 = phi i32 [ %7, %11 ], [ %43, %41 ], [ %54, %48 ]
  %59 = icmp ne i64 %0, 0
  %60 = icmp sgt i32 %6, 1
  %61 = and i1 %59, %60
  br i1 %61, label %62, label %106

62:                                               ; preds = %57
  %63 = lshr i64 %1, 1
  %64 = inttoptr i64 %0 to i16*
  %65 = and i64 %63, 2147483647
  %66 = icmp ult i64 %65, 8
  br i1 %66, label %93, label %67

67:                                               ; preds = %62
  %68 = and i64 %63, 7
  %69 = sub nsw i64 %65, %68
  %70 = insertelement <4 x i32> <i32 poison, i32 0, i32 0, i32 0>, i32 %58, i64 0
  br label %71

71:                                               ; preds = %71, %67
  %72 = phi i64 [ 0, %67 ], [ %87, %71 ]
  %73 = phi <4 x i32> [ %70, %67 ], [ %85, %71 ]
  %74 = phi <4 x i32> [ zeroinitializer, %67 ], [ %86, %71 ]
  %75 = getelementptr inbounds i16, i16* %64, i64 %72
  %76 = bitcast i16* %75 to <4 x i16>*
  %77 = load <4 x i16>, <4 x i16>* %76, align 2, !tbaa !5
  %78 = getelementptr inbounds i16, i16* %75, i64 4
  %79 = bitcast i16* %78 to <4 x i16>*
  %80 = load <4 x i16>, <4 x i16>* %79, align 2, !tbaa !5
  %81 = xor <4 x i16> %77, <i16 -1, i16 -1, i16 -1, i16 -1>
  %82 = xor <4 x i16> %80, <i16 -1, i16 -1, i16 -1, i16 -1>
  %83 = zext <4 x i16> %81 to <4 x i32>
  %84 = zext <4 x i16> %82 to <4 x i32>
  %85 = add <4 x i32> %73, %83
  %86 = add <4 x i32> %74, %84
  %87 = add nuw i64 %72, 8
  %88 = icmp eq i64 %87, %69
  br i1 %88, label %89, label %71, !llvm.loop !14

89:                                               ; preds = %71
  %90 = add <4 x i32> %86, %85
  %91 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %90)
  %92 = icmp eq i64 %68, 0
  br i1 %92, label %106, label %93

93:                                               ; preds = %62, %89
  %94 = phi i64 [ 0, %62 ], [ %69, %89 ]
  %95 = phi i32 [ %58, %62 ], [ %91, %89 ]
  br label %96

96:                                               ; preds = %93, %96
  %97 = phi i64 [ %104, %96 ], [ %94, %93 ]
  %98 = phi i32 [ %103, %96 ], [ %95, %93 ]
  %99 = getelementptr inbounds i16, i16* %64, i64 %97
  %100 = load i16, i16* %99, align 2, !tbaa !5
  %101 = xor i16 %100, -1
  %102 = zext i16 %101 to i32
  %103 = add nsw i32 %98, %102
  %104 = add nuw nsw i64 %97, 1
  %105 = icmp eq i64 %104, %65
  br i1 %105, label %106, label %96, !llvm.loop !15

106:                                              ; preds = %96, %89, %57
  %107 = phi i32 [ %58, %57 ], [ %91, %89 ], [ %103, %96 ]
  %108 = icmp slt i32 %107, 0
  %109 = select i1 %108, i32 -22, i32 %107
  %110 = sext i32 %109 to i64
  br label %111

111:                                              ; preds = %5, %106
  %112 = phi i64 [ -22, %5 ], [ %110, %106 ]
  ret i64 %112
}

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #1

attributes #0 = { nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone willreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = distinct !{!12, !10, !13, !11}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
!14 = distinct !{!14, !10, !11}
!15 = distinct !{!15, !10, !13, !11}

; ModuleID = 'xxhash32.c'
source_filename = "xxhash32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind readonly uwtable
define dso_local i32 @xxhash32(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp ugt i32 %1, 15
  br i1 %4, label %5, label %114

5:                                                ; preds = %3
  %6 = add i32 %2, 606290984
  %7 = add i32 %2, -2048144777
  %8 = add i32 %2, 1640531535
  br label %9

9:                                                ; preds = %5, %9
  %10 = phi i32 [ %104, %9 ], [ %8, %5 ]
  %11 = phi i32 [ %82, %9 ], [ %2, %5 ]
  %12 = phi i32 [ %60, %9 ], [ %7, %5 ]
  %13 = phi i32 [ %38, %9 ], [ %6, %5 ]
  %14 = phi i32 [ %17, %9 ], [ %1, %5 ]
  %15 = phi ptr [ %16, %9 ], [ %0, %5 ]
  %16 = getelementptr inbounds i8, ptr %15, i64 16
  %17 = add i32 %14, -16
  %18 = load i8, ptr %15, align 1, !tbaa !5
  %19 = zext i8 %18 to i32
  %20 = getelementptr inbounds i8, ptr %15, i64 1
  %21 = load i8, ptr %20, align 1, !tbaa !5
  %22 = zext i8 %21 to i32
  %23 = shl nuw nsw i32 %22, 8
  %24 = or i32 %23, %19
  %25 = getelementptr inbounds i8, ptr %15, i64 2
  %26 = load i8, ptr %25, align 1, !tbaa !5
  %27 = zext i8 %26 to i32
  %28 = shl nuw nsw i32 %27, 16
  %29 = or i32 %24, %28
  %30 = getelementptr inbounds i8, ptr %15, i64 3
  %31 = load i8, ptr %30, align 1, !tbaa !5
  %32 = zext i8 %31 to i32
  %33 = shl nuw i32 %32, 24
  %34 = or i32 %29, %33
  %35 = mul i32 %34, -2048144777
  %36 = add i32 %35, %13
  %37 = tail call i32 @llvm.fshl.i32(i32 %36, i32 %36, i32 13)
  %38 = mul i32 %37, -1640531535
  %39 = getelementptr inbounds i8, ptr %15, i64 4
  %40 = load i8, ptr %39, align 1, !tbaa !5
  %41 = zext i8 %40 to i32
  %42 = getelementptr inbounds i8, ptr %15, i64 5
  %43 = load i8, ptr %42, align 1, !tbaa !5
  %44 = zext i8 %43 to i32
  %45 = shl nuw nsw i32 %44, 8
  %46 = or i32 %45, %41
  %47 = getelementptr inbounds i8, ptr %15, i64 6
  %48 = load i8, ptr %47, align 1, !tbaa !5
  %49 = zext i8 %48 to i32
  %50 = shl nuw nsw i32 %49, 16
  %51 = or i32 %46, %50
  %52 = getelementptr inbounds i8, ptr %15, i64 7
  %53 = load i8, ptr %52, align 1, !tbaa !5
  %54 = zext i8 %53 to i32
  %55 = shl nuw i32 %54, 24
  %56 = or i32 %51, %55
  %57 = mul i32 %56, -2048144777
  %58 = add i32 %57, %12
  %59 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 13)
  %60 = mul i32 %59, -1640531535
  %61 = getelementptr inbounds i8, ptr %15, i64 8
  %62 = load i8, ptr %61, align 1, !tbaa !5
  %63 = zext i8 %62 to i32
  %64 = getelementptr inbounds i8, ptr %15, i64 9
  %65 = load i8, ptr %64, align 1, !tbaa !5
  %66 = zext i8 %65 to i32
  %67 = shl nuw nsw i32 %66, 8
  %68 = or i32 %67, %63
  %69 = getelementptr inbounds i8, ptr %15, i64 10
  %70 = load i8, ptr %69, align 1, !tbaa !5
  %71 = zext i8 %70 to i32
  %72 = shl nuw nsw i32 %71, 16
  %73 = or i32 %68, %72
  %74 = getelementptr inbounds i8, ptr %15, i64 11
  %75 = load i8, ptr %74, align 1, !tbaa !5
  %76 = zext i8 %75 to i32
  %77 = shl nuw i32 %76, 24
  %78 = or i32 %73, %77
  %79 = mul i32 %78, -2048144777
  %80 = add i32 %79, %11
  %81 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 13)
  %82 = mul i32 %81, -1640531535
  %83 = getelementptr inbounds i8, ptr %15, i64 12
  %84 = load i8, ptr %83, align 1, !tbaa !5
  %85 = zext i8 %84 to i32
  %86 = getelementptr inbounds i8, ptr %15, i64 13
  %87 = load i8, ptr %86, align 1, !tbaa !5
  %88 = zext i8 %87 to i32
  %89 = shl nuw nsw i32 %88, 8
  %90 = or i32 %89, %85
  %91 = getelementptr inbounds i8, ptr %15, i64 14
  %92 = load i8, ptr %91, align 1, !tbaa !5
  %93 = zext i8 %92 to i32
  %94 = shl nuw nsw i32 %93, 16
  %95 = or i32 %90, %94
  %96 = getelementptr inbounds i8, ptr %15, i64 15
  %97 = load i8, ptr %96, align 1, !tbaa !5
  %98 = zext i8 %97 to i32
  %99 = shl nuw i32 %98, 24
  %100 = or i32 %95, %99
  %101 = mul i32 %100, -2048144777
  %102 = add i32 %101, %10
  %103 = tail call i32 @llvm.fshl.i32(i32 %102, i32 %102, i32 13)
  %104 = mul i32 %103, -1640531535
  %105 = icmp ugt i32 %17, 15
  br i1 %105, label %9, label %106

106:                                              ; preds = %9
  %107 = tail call i32 @llvm.fshl.i32(i32 %38, i32 %38, i32 1)
  %108 = tail call i32 @llvm.fshl.i32(i32 %60, i32 %60, i32 7)
  %109 = add i32 %108, %107
  %110 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %82, i32 12)
  %111 = add i32 %109, %110
  %112 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %104, i32 18)
  %113 = add i32 %111, %112
  br label %116

114:                                              ; preds = %3
  %115 = add i32 %2, 374761393
  br label %116

116:                                              ; preds = %114, %106
  %117 = phi i32 [ %113, %106 ], [ %115, %114 ]
  %118 = add i32 %117, %1
  %119 = and i32 %1, -16
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds i8, ptr %0, i64 %120
  %122 = and i32 %1, 15
  br label %123

123:                                              ; preds = %150, %116
  %124 = phi i32 [ %118, %116 ], [ %153, %150 ]
  %125 = phi ptr [ %121, %116 ], [ %154, %150 ]
  %126 = phi i32 [ %122, %116 ], [ %155, %150 ]
  %127 = icmp ugt i32 %126, 3
  br i1 %127, label %128, label %156

128:                                              ; preds = %123
  %129 = load i8, ptr %125, align 1, !tbaa !5
  %130 = zext i8 %129 to i32
  %131 = getelementptr inbounds i8, ptr %125, i64 1
  %132 = load i8, ptr %131, align 1, !tbaa !5
  %133 = zext i8 %132 to i32
  %134 = shl nuw nsw i32 %133, 8
  %135 = or i32 %134, %130
  %136 = getelementptr inbounds i8, ptr %125, i64 2
  %137 = load i8, ptr %136, align 1, !tbaa !5
  %138 = zext i8 %137 to i32
  %139 = shl nuw nsw i32 %138, 16
  %140 = or i32 %135, %139
  %141 = getelementptr inbounds i8, ptr %125, i64 3
  %142 = load i8, ptr %141, align 1, !tbaa !5
  %143 = zext i8 %142 to i32
  %144 = shl nuw i32 %143, 24
  %145 = or i32 %140, %144
  %146 = mul i32 %145, -1028477379
  %147 = add i32 %146, %124
  %148 = tail call i32 @llvm.fshl.i32(i32 %147, i32 %147, i32 17)
  %149 = mul i32 %148, 668265263
  br label %150

150:                                              ; preds = %158, %128
  %151 = phi i64 [ 4, %128 ], [ 1, %158 ]
  %152 = phi i32 [ -4, %128 ], [ -1, %158 ]
  %153 = phi i32 [ %149, %128 ], [ %164, %158 ]
  %154 = getelementptr inbounds i8, ptr %125, i64 %151
  %155 = add i32 %152, %126
  br label %123

156:                                              ; preds = %123
  %157 = icmp eq i32 %126, 0
  br i1 %157, label %165, label %158

158:                                              ; preds = %156
  %159 = load i8, ptr %125, align 1, !tbaa !5
  %160 = zext i8 %159 to i32
  %161 = mul i32 %160, 374761393
  %162 = add i32 %161, %124
  %163 = tail call i32 @llvm.fshl.i32(i32 %162, i32 %162, i32 11)
  %164 = mul i32 %163, -1640531535
  br label %150

165:                                              ; preds = %156
  %166 = lshr i32 %124, 15
  %167 = xor i32 %166, %124
  %168 = mul i32 %167, -2048144777
  %169 = lshr i32 %168, 13
  %170 = xor i32 %169, %168
  %171 = mul i32 %170, -1028477379
  %172 = lshr i32 %171, 16
  %173 = xor i32 %172, %171
  ret i32 %173
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

attributes #0 = { nofree nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 15.0.7"}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}

; ModuleID = 'loop.bpf.c'
source_filename = "loop.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i8*, i8* }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @add_arrays(%struct.xdp_md* noundef %0) #0 {
  %2 = alloca %struct.xdp_md*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %2, align 8
  %7 = load %struct.xdp_md*, %struct.xdp_md** %2, align 8
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %7, i32 0, i32 1
  %9 = load i8*, i8** %8, align 8
  store i8* %9, i8** %3, align 8
  %10 = load %struct.xdp_md*, %struct.xdp_md** %2, align 8
  %11 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %10, i32 0, i32 0
  %12 = load i8*, i8** %11, align 8
  store i8* %12, i8** %4, align 8
  %13 = load i8*, i8** %3, align 8
  %14 = load i8*, i8** %4, align 8
  %15 = ptrtoint i8* %13 to i64
  %16 = ptrtoint i8* %14 to i64
  %17 = sub i64 %15, %16
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %19

19:                                               ; preds = %36, %1
  %20 = load i32, i32* %6, align 4
  %21 = load i32, i32* %5, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %39

23:                                               ; preds = %19
  %24 = load i8*, i8** %4, align 8
  %25 = load i32, i32* %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8* %24, i64 %26
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = add nsw i32 %29, 1
  %31 = trunc i32 %30 to i8
  %32 = load i8*, i8** %4, align 8
  %33 = load i32, i32* %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* %32, i64 %34
  store i8 %31, i8* %35, align 1
  br label %36

36:                                               ; preds = %23
  %37 = load i32, i32* %6, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %6, align 4
  br label %19, !llvm.loop !6

39:                                               ; preds = %19
  ret i32 0
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

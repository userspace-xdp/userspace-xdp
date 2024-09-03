; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/module/inline_helpers1.c'
source_filename = "/home/yunwei/ebpf-xdp-dpdk/module/inline_helpers1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md_userspace = type { i64, i64, i32, i32, i32, i32, i64, i64 }

; Function Attrs: noinline nounwind optnone uwtable
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

; Function Attrs: noinline nounwind optnone uwtable
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

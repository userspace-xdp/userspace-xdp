; ModuleID = 'xdp_csum_only.bpf.c'
source_filename = "xdp_csum_only.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@bpf_csum_diff = internal global i64 (i32*, i32, i32*, i32, i32)* inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*), align 8
@llvm.compiler.used = appending global [2 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.xdp_md*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %struct.ethhdr*, align 8
  %11 = alloca %struct.iphdr*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i64*, align 8
  %14 = alloca i16, align 2
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %7, align 8
  %19 = load %struct.xdp_md*, %struct.xdp_md** %7, align 8
  %20 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %19, i32 0, i32 1
  %21 = load i64, i64* %20, align 8
  %22 = inttoptr i64 %21 to i8*
  store i8* %22, i8** %8, align 8
  %23 = load %struct.xdp_md*, %struct.xdp_md** %7, align 8
  %24 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %23, i32 0, i32 0
  %25 = load i64, i64* %24, align 8
  %26 = inttoptr i64 %25 to i8*
  store i8* %26, i8** %9, align 8
  %27 = load i8*, i8** %9, align 8
  %28 = bitcast i8* %27 to %struct.ethhdr*
  store %struct.ethhdr* %28, %struct.ethhdr** %10, align 8
  store i32 2, i32* %12, align 4
  store i32 23, i32* %16, align 4
  store i32 0, i32* %17, align 4
  store i32 0, i32* %18, align 4
  store i64 14, i64* %15, align 8
  %29 = load i8*, i8** %9, align 8
  %30 = load i64, i64* %15, align 8
  %31 = getelementptr i8, i8* %29, i64 %30
  %32 = load i8*, i8** %8, align 8
  %33 = icmp ugt i8* %31, %32
  br i1 %33, label %34, label %36

34:                                               ; preds = %1
  %35 = load i32, i32* %12, align 4
  store i32 %35, i32* %6, align 4
  br label %96

36:                                               ; preds = %1
  %37 = load %struct.ethhdr*, %struct.ethhdr** %10, align 8
  %38 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %37, i32 0, i32 2
  %39 = load i16, i16* %38, align 2
  store i16 %39, i16* %14, align 2
  %40 = load i16, i16* %14, align 2
  %41 = zext i16 %40 to i32
  %42 = icmp ne i32 %41, 8
  br i1 %42, label %43, label %45

43:                                               ; preds = %36
  %44 = load i32, i32* %12, align 4
  store i32 %44, i32* %6, align 4
  br label %96

45:                                               ; preds = %36
  %46 = load i8*, i8** %9, align 8
  %47 = load i64, i64* %15, align 8
  %48 = getelementptr i8, i8* %46, i64 %47
  %49 = bitcast i8* %48 to %struct.iphdr*
  store %struct.iphdr* %49, %struct.iphdr** %11, align 8
  %50 = load i64, i64* %15, align 8
  %51 = add i64 %50, 20
  store i64 %51, i64* %15, align 8
  %52 = load i8*, i8** %9, align 8
  %53 = load i64, i64* %15, align 8
  %54 = getelementptr i8, i8* %52, i64 %53
  %55 = load i8*, i8** %8, align 8
  %56 = icmp ugt i8* %54, %55
  br i1 %56, label %57, label %59

57:                                               ; preds = %45
  %58 = load i32, i32* %12, align 4
  store i32 %58, i32* %6, align 4
  br label %96

59:                                               ; preds = %45
  store i32 0, i32* %18, align 4
  br label %60

60:                                               ; preds = %90, %59
  %61 = load i32, i32* %18, align 4
  %62 = icmp slt i32 %61, 32
  br i1 %62, label %63, label %93

63:                                               ; preds = %60
  %64 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %65 = bitcast %struct.iphdr* %64 to i8*
  store i8* %65, i8** %3, align 8
  store i32 20, i32* %4, align 4
  store i32* %17, i32** %5, align 8
  %66 = load i64 (i32*, i32, i32*, i32, i32)*, i64 (i32*, i32, i32*, i32, i32)** @bpf_csum_diff, align 8
  %67 = load i8*, i8** %3, align 8
  %68 = bitcast i8* %67 to i32*
  %69 = load i32, i32* %4, align 4
  %70 = load i32*, i32** %5, align 8
  %71 = load i32, i32* %70, align 4
  %72 = call i64 %66(i32* noundef null, i32 noundef 0, i32* noundef %68, i32 noundef %69, i32 noundef %71) #1
  %73 = trunc i64 %72 to i32
  %74 = load i32*, i32** %5, align 8
  store i32 %73, i32* %74, align 4
  %75 = load i32*, i32** %5, align 8
  %76 = load i32, i32* %75, align 4
  store i32 %76, i32* %2, align 4
  %77 = load i32, i32* %2, align 4
  %78 = and i32 %77, 65535
  %79 = load i32, i32* %2, align 4
  %80 = lshr i32 %79, 16
  %81 = add i32 %78, %80
  %82 = xor i32 %81, -1
  %83 = trunc i32 %82 to i16
  %84 = zext i16 %83 to i32
  %85 = load i32*, i32** %5, align 8
  store i32 %84, i32* %85, align 4
  %86 = load i32, i32* %17, align 4
  %87 = trunc i32 %86 to i16
  %88 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %89 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %88, i32 0, i32 7
  store i16 %87, i16* %89, align 2
  br label %90

90:                                               ; preds = %63
  %91 = load i32, i32* %18, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %18, align 4
  br label %60, !llvm.loop !6

93:                                               ; preds = %60
  %94 = load i8*, i8** %9, align 8
  call void @swap_src_dst_mac(i8* noundef %94)
  store i32 3, i32* %12, align 4
  %95 = load i32, i32* %12, align 4
  store i32 %95, i32* %6, align 4
  br label %96

96:                                               ; preds = %93, %57, %43, %34
  %97 = load i32, i32* %6, align 4
  ret i32 %97
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @swap_src_dst_mac(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca [3 x i16], align 2
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = bitcast i8* %5 to i16*
  store i16* %6, i16** %3, align 8
  %7 = load i16*, i16** %3, align 8
  %8 = getelementptr inbounds i16, i16* %7, i64 0
  %9 = load i16, i16* %8, align 2
  %10 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 0
  store i16 %9, i16* %10, align 2
  %11 = load i16*, i16** %3, align 8
  %12 = getelementptr inbounds i16, i16* %11, i64 1
  %13 = load i16, i16* %12, align 2
  %14 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 1
  store i16 %13, i16* %14, align 2
  %15 = load i16*, i16** %3, align 8
  %16 = getelementptr inbounds i16, i16* %15, i64 2
  %17 = load i16, i16* %16, align 2
  %18 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 2
  store i16 %17, i16* %18, align 2
  %19 = load i16*, i16** %3, align 8
  %20 = getelementptr inbounds i16, i16* %19, i64 3
  %21 = load i16, i16* %20, align 2
  %22 = load i16*, i16** %3, align 8
  %23 = getelementptr inbounds i16, i16* %22, i64 0
  store i16 %21, i16* %23, align 2
  %24 = load i16*, i16** %3, align 8
  %25 = getelementptr inbounds i16, i16* %24, i64 4
  %26 = load i16, i16* %25, align 2
  %27 = load i16*, i16** %3, align 8
  %28 = getelementptr inbounds i16, i16* %27, i64 1
  store i16 %26, i16* %28, align 2
  %29 = load i16*, i16** %3, align 8
  %30 = getelementptr inbounds i16, i16* %29, i64 5
  %31 = load i16, i16* %30, align 2
  %32 = load i16*, i16** %3, align 8
  %33 = getelementptr inbounds i16, i16* %32, i64 2
  store i16 %31, i16* %33, align 2
  %34 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 0
  %35 = load i16, i16* %34, align 2
  %36 = load i16*, i16** %3, align 8
  %37 = getelementptr inbounds i16, i16* %36, i64 3
  store i16 %35, i16* %37, align 2
  %38 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 1
  %39 = load i16, i16* %38, align 2
  %40 = load i16*, i16** %3, align 8
  %41 = getelementptr inbounds i16, i16* %40, i64 4
  store i16 %39, i16* %41, align 2
  %42 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 2
  %43 = load i16, i16* %42, align 2
  %44 = load i16*, i16** %3, align 8
  %45 = getelementptr inbounds i16, i16* %44, i64 5
  store i16 %43, i16* %45, align 2
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind }

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

; ModuleID = 'xdp_drop.bpf.c'
source_filename = "xdp_drop.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [2 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca %struct.xdp_md*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.ethhdr*, align 8
  %7 = alloca %struct.iphdr*, align 8
  %8 = alloca %struct.tcphdr*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %3, align 8
  %9 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %10 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %9, i32 0, i32 0
  %11 = load i64, i64* %10, align 8
  %12 = inttoptr i64 %11 to i8*
  store i8* %12, i8** %4, align 8
  %13 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %14 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %13, i32 0, i32 1
  %15 = load i64, i64* %14, align 8
  %16 = inttoptr i64 %15 to i8*
  store i8* %16, i8** %5, align 8
  %17 = load i8*, i8** %4, align 8
  %18 = bitcast i8* %17 to %struct.ethhdr*
  store %struct.ethhdr* %18, %struct.ethhdr** %6, align 8
  %19 = load i8*, i8** %4, align 8
  %20 = getelementptr i8, i8* %19, i64 14
  %21 = load i8*, i8** %5, align 8
  %22 = icmp ugt i8* %20, %21
  br i1 %22, label %23, label %24

23:                                               ; preds = %1
  store i32 0, i32* %2, align 4
  br label %87

24:                                               ; preds = %1
  %25 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %26 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %25, i32 0, i32 2
  %27 = load i16, i16* %26, align 2
  %28 = call i1 @llvm.is.constant.i16(i16 %27)
  br i1 %28, label %29, label %47

29:                                               ; preds = %24
  %30 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %31 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %30, i32 0, i32 2
  %32 = load i16, i16* %31, align 2
  %33 = zext i16 %32 to i32
  %34 = shl i32 %33, 8
  %35 = ashr i32 %34, 8
  %36 = shl i32 %35, 8
  %37 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %38 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %37, i32 0, i32 2
  %39 = load i16, i16* %38, align 2
  %40 = zext i16 %39 to i32
  %41 = shl i32 %40, 0
  %42 = ashr i32 %41, 8
  %43 = shl i32 %42, 0
  %44 = or i32 %36, %43
  %45 = trunc i32 %44 to i16
  %46 = zext i16 %45 to i32
  br label %53

47:                                               ; preds = %24
  %48 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %49 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %48, i32 0, i32 2
  %50 = load i16, i16* %49, align 2
  %51 = call i16 @llvm.bswap.i16(i16 %50)
  %52 = zext i16 %51 to i32
  br label %53

53:                                               ; preds = %47, %29
  %54 = phi i32 [ %46, %29 ], [ %52, %47 ]
  %55 = icmp ne i32 %54, 2048
  br i1 %55, label %56, label %57

56:                                               ; preds = %53
  store i32 2, i32* %2, align 4
  br label %87

57:                                               ; preds = %53
  %58 = load i8*, i8** %4, align 8
  %59 = getelementptr i8, i8* %58, i64 14
  %60 = bitcast i8* %59 to %struct.iphdr*
  store %struct.iphdr* %60, %struct.iphdr** %7, align 8
  %61 = load i8*, i8** %4, align 8
  %62 = getelementptr i8, i8* %61, i64 14
  %63 = getelementptr i8, i8* %62, i64 20
  %64 = load i8*, i8** %5, align 8
  %65 = icmp ugt i8* %63, %64
  br i1 %65, label %66, label %67

66:                                               ; preds = %57
  store i32 0, i32* %2, align 4
  br label %87

67:                                               ; preds = %57
  %68 = load %struct.iphdr*, %struct.iphdr** %7, align 8
  %69 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %68, i32 0, i32 6
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = icmp ne i32 %71, 6
  br i1 %72, label %73, label %74

73:                                               ; preds = %67
  store i32 2, i32* %2, align 4
  br label %87

74:                                               ; preds = %67
  %75 = load i8*, i8** %4, align 8
  %76 = getelementptr i8, i8* %75, i64 14
  %77 = getelementptr i8, i8* %76, i64 20
  %78 = bitcast i8* %77 to %struct.tcphdr*
  store %struct.tcphdr* %78, %struct.tcphdr** %8, align 8
  %79 = load i8*, i8** %4, align 8
  %80 = getelementptr i8, i8* %79, i64 14
  %81 = getelementptr i8, i8* %80, i64 20
  %82 = getelementptr i8, i8* %81, i64 20
  %83 = load i8*, i8** %5, align 8
  %84 = icmp ugt i8* %82, %83
  br i1 %84, label %85, label %86

85:                                               ; preds = %74
  store i32 0, i32* %2, align 4
  br label %87

86:                                               ; preds = %74
  store i32 1, i32* %2, align 4
  br label %87

87:                                               ; preds = %86, %85, %73, %66, %56, %23
  %88 = load i32, i32* %2, align 4
  ret i32 %88
}

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i16(i16) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { convergent nofree nosync nounwind readnone willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

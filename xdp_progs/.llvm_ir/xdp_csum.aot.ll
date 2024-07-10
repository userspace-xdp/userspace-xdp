; ModuleID = 'xdp_csum.bpf.c'
source_filename = "xdp_csum.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.1 = type { [6 x i32]*, i32*, i64*, [256 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }

@rxcnt_id = internal constant i64 17179869184, align 8
@_license = dso_local global [4 x i8] c"GPL\00", align 1
@rxcnt = dso_local global %struct.anon.1 zeroinitializer, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bpf_main(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.xdp_md*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = bitcast i8* %4 to %struct.xdp_md*
  store %struct.xdp_md* %5, %struct.xdp_md** %3, align 8
  %6 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %7 = call i32 @xdp_pass(%struct.xdp_md* noundef %6)
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.xdp_md*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca %struct.ethhdr*, align 8
  %15 = alloca %struct.iphdr*, align 8
  %16 = alloca i32, align 4
  %17 = alloca i64*, align 8
  %18 = alloca i16, align 2
  %19 = alloca i64, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %11, align 8
  %23 = load %struct.xdp_md*, %struct.xdp_md** %11, align 8
  %24 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %23, i32 0, i32 1
  %25 = load i64, i64* %24, align 8
  %26 = inttoptr i64 %25 to i8*
  store i8* %26, i8** %12, align 8
  %27 = load %struct.xdp_md*, %struct.xdp_md** %11, align 8
  %28 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %27, i32 0, i32 0
  %29 = load i64, i64* %28, align 8
  %30 = inttoptr i64 %29 to i8*
  store i8* %30, i8** %13, align 8
  %31 = load i8*, i8** %13, align 8
  %32 = bitcast i8* %31 to %struct.ethhdr*
  store %struct.ethhdr* %32, %struct.ethhdr** %14, align 8
  store i32 2, i32* %16, align 4
  store i32 23, i32* %20, align 4
  store i32 0, i32* %21, align 4
  store i32 0, i32* %22, align 4
  store i64 14, i64* %19, align 8
  %33 = load i8*, i8** %13, align 8
  %34 = load i64, i64* %19, align 8
  %35 = getelementptr i8, i8* %33, i64 %34
  %36 = load i8*, i8** %12, align 8
  %37 = icmp ugt i8* %35, %36
  br i1 %37, label %38, label %40

38:                                               ; preds = %1
  %39 = load i32, i32* %16, align 4
  store i32 %39, i32* %10, align 4
  br label %116

40:                                               ; preds = %1
  %41 = load %struct.ethhdr*, %struct.ethhdr** %14, align 8
  %42 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %41, i32 0, i32 2
  %43 = load i16, i16* %42, align 2
  store i16 %43, i16* %18, align 2
  %44 = load i16, i16* %18, align 2
  %45 = zext i16 %44 to i32
  %46 = icmp ne i32 %45, 8
  br i1 %46, label %47, label %49

47:                                               ; preds = %40
  %48 = load i32, i32* %16, align 4
  store i32 %48, i32* %10, align 4
  br label %116

49:                                               ; preds = %40
  %50 = load i8*, i8** %13, align 8
  %51 = load i64, i64* %19, align 8
  %52 = getelementptr i8, i8* %50, i64 %51
  %53 = bitcast i8* %52 to %struct.iphdr*
  store %struct.iphdr* %53, %struct.iphdr** %15, align 8
  %54 = load i64, i64* %19, align 8
  %55 = add i64 %54, 20
  store i64 %55, i64* %19, align 8
  %56 = load i8*, i8** %13, align 8
  %57 = load i64, i64* %19, align 8
  %58 = getelementptr i8, i8* %56, i64 %57
  %59 = load i8*, i8** %12, align 8
  %60 = icmp ugt i8* %58, %59
  br i1 %60, label %61, label %63

61:                                               ; preds = %49
  %62 = load i32, i32* %16, align 4
  store i32 %62, i32* %10, align 4
  br label %116

63:                                               ; preds = %49
  store i32 0, i32* %22, align 4
  br label %64

64:                                               ; preds = %97, %63
  %65 = load i32, i32* %22, align 4
  %66 = icmp slt i32 %65, 32
  br i1 %66, label %67, label %100

67:                                               ; preds = %64
  %68 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %69 = bitcast %struct.iphdr* %68 to i8*
  store i8* %69, i8** %7, align 8
  store i32 20, i32* %8, align 4
  store i32* %21, i32** %9, align 8
  %70 = load i8*, i8** %7, align 8
  %71 = load i32, i32* %8, align 4
  %72 = load i32*, i32** %9, align 8
  %73 = load i32, i32* %72, align 4
  %74 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %70, i32 noundef %71, i32 noundef %73) #2
  %75 = load i32*, i32** %9, align 8
  store i32 %74, i32* %75, align 4
  %76 = load i32*, i32** %9, align 8
  %77 = load i32, i32* %76, align 4
  store i32 %77, i32* %2, align 4
  %78 = load i32, i32* %2, align 4
  %79 = and i32 %78, 65535
  %80 = load i32, i32* %2, align 4
  %81 = lshr i32 %80, 16
  %82 = add i32 %79, %81
  %83 = xor i32 %82, -1
  %84 = trunc i32 %83 to i16
  %85 = zext i16 %84 to i32
  %86 = load i32*, i32** %9, align 8
  store i32 %85, i32* %86, align 4
  %87 = load i32, i32* %21, align 4
  %88 = trunc i32 %87 to i16
  %89 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %90 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %89, i32 0, i32 7
  store i16 %88, i16* %90, align 2
  %91 = bitcast i32* %20 to i8*
  store i64* @rxcnt_id, i64** %3, align 8
  store i8* %91, i8** %4, align 8
  %92 = load i64*, i64** %3, align 8
  %93 = load i64, i64* %92, align 8
  %94 = load i8*, i8** %4, align 8
  %95 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %93, i8* noundef %94) #2
  %96 = bitcast i8* %95 to i64*
  store i64* %96, i64** %17, align 8
  br label %97

97:                                               ; preds = %67
  %98 = load i32, i32* %22, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %22, align 4
  br label %64, !llvm.loop !6

100:                                              ; preds = %64
  %101 = bitcast i32* %20 to i8*
  store i64* @rxcnt_id, i64** %5, align 8
  store i8* %101, i8** %6, align 8
  %102 = load i64*, i64** %5, align 8
  %103 = load i64, i64* %102, align 8
  %104 = load i8*, i8** %6, align 8
  %105 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %103, i8* noundef %104) #2
  %106 = bitcast i8* %105 to i64*
  store i64* %106, i64** %17, align 8
  %107 = load i64*, i64** %17, align 8
  %108 = icmp ne i64* %107, null
  br i1 %108, label %109, label %113

109:                                              ; preds = %100
  %110 = load i64*, i64** %17, align 8
  %111 = load i64, i64* %110, align 8
  %112 = add nsw i64 %111, 1
  store i64 %112, i64* %110, align 8
  br label %113

113:                                              ; preds = %109, %100
  %114 = load i8*, i8** %13, align 8
  call void @swap_src_dst_mac(i8* noundef %114)
  store i32 3, i32* %16, align 4
  %115 = load i32, i32* %16, align 4
  store i32 %115, i32* %10, align 4
  br label %116

116:                                              ; preds = %113, %61, %47, %38
  %117 = load i32, i32* %10, align 4
  ret i32 %117
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

declare i32 @_bpf_helper_ext_0028(...) #1

declare i8* @_bpf_helper_ext_0001(...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

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

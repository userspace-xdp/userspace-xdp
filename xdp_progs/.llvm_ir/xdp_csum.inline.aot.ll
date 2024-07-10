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
@__rxcnt = internal global [256 x i32] zeroinitializer, align 16

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
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.xdp_md*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca %struct.ethhdr*, align 8
  %17 = alloca %struct.iphdr*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i64*, align 8
  %20 = alloca i16, align 2
  %21 = alloca i64, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %13, align 8
  %25 = load %struct.xdp_md*, %struct.xdp_md** %13, align 8
  %26 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %25, i32 0, i32 1
  %27 = load i64, i64* %26, align 8
  %28 = inttoptr i64 %27 to i8*
  store i8* %28, i8** %14, align 8
  %29 = load %struct.xdp_md*, %struct.xdp_md** %13, align 8
  %30 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %29, i32 0, i32 0
  %31 = load i64, i64* %30, align 8
  %32 = inttoptr i64 %31 to i8*
  store i8* %32, i8** %15, align 8
  %33 = load i8*, i8** %15, align 8
  %34 = bitcast i8* %33 to %struct.ethhdr*
  store %struct.ethhdr* %34, %struct.ethhdr** %16, align 8
  store i32 2, i32* %18, align 4
  store i32 23, i32* %22, align 4
  store i32 0, i32* %23, align 4
  store i32 0, i32* %24, align 4
  store i64 14, i64* %21, align 8
  %35 = load i8*, i8** %15, align 8
  %36 = load i64, i64* %21, align 8
  %37 = getelementptr i8, i8* %35, i64 %36
  %38 = load i8*, i8** %14, align 8
  %39 = icmp ugt i8* %37, %38
  br i1 %39, label %40, label %42

40:                                               ; preds = %1
  %41 = load i32, i32* %18, align 4
  store i32 %41, i32* %12, align 4
  br label %144

42:                                               ; preds = %1
  %43 = load %struct.ethhdr*, %struct.ethhdr** %16, align 8
  %44 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %43, i32 0, i32 2
  %45 = load i16, i16* %44, align 2
  store i16 %45, i16* %20, align 2
  %46 = load i16, i16* %20, align 2
  %47 = zext i16 %46 to i32
  %48 = icmp ne i32 %47, 8
  br i1 %48, label %49, label %51

49:                                               ; preds = %42
  %50 = load i32, i32* %18, align 4
  store i32 %50, i32* %12, align 4
  br label %144

51:                                               ; preds = %42
  %52 = load i8*, i8** %15, align 8
  %53 = load i64, i64* %21, align 8
  %54 = getelementptr i8, i8* %52, i64 %53
  %55 = bitcast i8* %54 to %struct.iphdr*
  store %struct.iphdr* %55, %struct.iphdr** %17, align 8
  %56 = load i64, i64* %21, align 8
  %57 = add i64 %56, 20
  store i64 %57, i64* %21, align 8
  %58 = load i8*, i8** %15, align 8
  %59 = load i64, i64* %21, align 8
  %60 = getelementptr i8, i8* %58, i64 %59
  %61 = load i8*, i8** %14, align 8
  %62 = icmp ugt i8* %60, %61
  br i1 %62, label %63, label %65

63:                                               ; preds = %51
  %64 = load i32, i32* %18, align 4
  store i32 %64, i32* %12, align 4
  br label %144

65:                                               ; preds = %51
  store i32 0, i32* %24, align 4
  br label %66

66:                                               ; preds = %112, %65
  %67 = load i32, i32* %24, align 4
  %68 = icmp slt i32 %67, 32
  br i1 %68, label %69, label %115

69:                                               ; preds = %66
  %70 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %71 = bitcast %struct.iphdr* %70 to i8*
  store i8* %71, i8** %9, align 8
  store i32 20, i32* %10, align 4
  store i32* %23, i32** %11, align 8
  %72 = load i8*, i8** %9, align 8
  %73 = load i32, i32* %10, align 4
  %74 = load i32*, i32** %11, align 8
  %75 = load i32, i32* %74, align 4
  %76 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %72, i32 noundef %73, i32 noundef %75) #2
  %77 = load i32*, i32** %11, align 8
  store i32 %76, i32* %77, align 4
  %78 = load i32*, i32** %11, align 8
  %79 = load i32, i32* %78, align 4
  store i32 %79, i32* %2, align 4
  %80 = load i32, i32* %2, align 4
  %81 = and i32 %80, 65535
  %82 = load i32, i32* %2, align 4
  %83 = lshr i32 %82, 16
  %84 = add i32 %81, %83
  %85 = xor i32 %84, -1
  %86 = trunc i32 %85 to i16
  %87 = zext i16 %86 to i32
  %88 = load i32*, i32** %11, align 8
  store i32 %87, i32* %88, align 4
  %89 = load i32, i32* %23, align 4
  %90 = trunc i32 %89 to i16
  %91 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %92 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %91, i32 0, i32 7
  store i16 %90, i16* %92, align 2
  %93 = bitcast i32* %22 to i8*
  store i64* @rxcnt_id, i64** %4, align 8
  store i8* %93, i8** %5, align 8
  %94 = load i64*, i64** %4, align 8
  %95 = load i64, i64* %94, align 8
  %96 = icmp eq i64 %95, 17179869184
  br i1 %96, label %97, label %104

97:                                               ; preds = %69
  %98 = load i8*, i8** %5, align 8
  %99 = bitcast i8* %98 to i32*
  %100 = load i32, i32* %99, align 4
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds [256 x i32], [256 x i32]* @__rxcnt, i64 0, i64 %101
  %103 = bitcast i32* %102 to i8*
  store i8* %103, i8** %3, align 8
  br label %109

104:                                              ; preds = %69
  %105 = load i64*, i64** %4, align 8
  %106 = load i64, i64* %105, align 8
  %107 = load i8*, i8** %5, align 8
  %108 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %106, i8* noundef %107) #2
  store i8* %108, i8** %3, align 8
  br label %109

109:                                              ; preds = %97, %104
  %110 = load i8*, i8** %3, align 8
  %111 = bitcast i8* %110 to i64*
  store i64* %111, i64** %19, align 8
  br label %112

112:                                              ; preds = %109
  %113 = load i32, i32* %24, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %24, align 4
  br label %66, !llvm.loop !6

115:                                              ; preds = %66
  %116 = bitcast i32* %22 to i8*
  store i64* @rxcnt_id, i64** %7, align 8
  store i8* %116, i8** %8, align 8
  %117 = load i64*, i64** %7, align 8
  %118 = load i64, i64* %117, align 8
  %119 = icmp eq i64 %118, 17179869184
  br i1 %119, label %120, label %127

120:                                              ; preds = %115
  %121 = load i8*, i8** %8, align 8
  %122 = bitcast i8* %121 to i32*
  %123 = load i32, i32* %122, align 4
  %124 = zext i32 %123 to i64
  %125 = getelementptr inbounds [256 x i32], [256 x i32]* @__rxcnt, i64 0, i64 %124
  %126 = bitcast i32* %125 to i8*
  store i8* %126, i8** %6, align 8
  br label %132

127:                                              ; preds = %115
  %128 = load i64*, i64** %7, align 8
  %129 = load i64, i64* %128, align 8
  %130 = load i8*, i8** %8, align 8
  %131 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %129, i8* noundef %130) #2
  store i8* %131, i8** %6, align 8
  br label %132

132:                                              ; preds = %120, %127
  %133 = load i8*, i8** %6, align 8
  %134 = bitcast i8* %133 to i64*
  store i64* %134, i64** %19, align 8
  %135 = load i64*, i64** %19, align 8
  %136 = icmp ne i64* %135, null
  br i1 %136, label %137, label %141

137:                                              ; preds = %132
  %138 = load i64*, i64** %19, align 8
  %139 = load i64, i64* %138, align 8
  %140 = add nsw i64 %139, 1
  store i64 %140, i64* %138, align 8
  br label %141

141:                                              ; preds = %137, %132
  %142 = load i8*, i8** %15, align 8
  call void @swap_src_dst_mac(i8* noundef %142)
  store i32 3, i32* %18, align 4
  %143 = load i32, i32* %18, align 4
  store i32 %143, i32* %12, align 4
  br label %144

144:                                              ; preds = %141, %63, %49, %40
  %145 = load i32, i32* %12, align 4
  ret i32 %145
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

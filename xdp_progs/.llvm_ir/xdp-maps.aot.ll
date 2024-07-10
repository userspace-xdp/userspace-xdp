; ModuleID = 'xdp-maps.bpf.c'
source_filename = "xdp-maps.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [1 x i32]*, [8192 x i32]*, i32*, i32* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@packet_size_distribute_id = internal constant i64 17179869184, align 8
@__license = dso_local global [4 x i8] c"GPL\00", align 1
@packet_size_distribute = dso_local global %struct.anon zeroinitializer, align 8

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
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.xdp_md*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca %struct.ethhdr*, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %9, align 8
  %17 = load %struct.xdp_md*, %struct.xdp_md** %9, align 8
  %18 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %17, i32 0, i32 0
  %19 = load i64, i64* %18, align 8
  %20 = inttoptr i64 %19 to i8*
  store i8* %20, i8** %10, align 8
  %21 = load %struct.xdp_md*, %struct.xdp_md** %9, align 8
  %22 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %21, i32 0, i32 1
  %23 = load i64, i64* %22, align 8
  %24 = inttoptr i64 %23 to i8*
  store i8* %24, i8** %11, align 8
  %25 = load i8*, i8** %11, align 8
  %26 = load i8*, i8** %10, align 8
  %27 = ptrtoint i8* %25 to i64
  %28 = ptrtoint i8* %26 to i64
  %29 = sub i64 %27, %28
  %30 = trunc i64 %29 to i32
  store i32 %30, i32* %12, align 4
  %31 = load i8*, i8** %10, align 8
  %32 = bitcast i8* %31 to %struct.ethhdr*
  store %struct.ethhdr* %32, %struct.ethhdr** %13, align 8
  store i32 0, i32* %15, align 4
  %33 = bitcast i32* %12 to i8*
  store i64* @packet_size_distribute_id, i64** %6, align 8
  store i8* %33, i8** %7, align 8
  %34 = load i64*, i64** %6, align 8
  %35 = load i64, i64* %34, align 8
  %36 = load i8*, i8** %7, align 8
  %37 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %35, i8* noundef %36) #2
  %38 = bitcast i8* %37 to i32*
  store i32* %38, i32** %16, align 8
  %39 = load i32*, i32** %16, align 8
  %40 = icmp ne i32* %39, null
  br i1 %40, label %41, label %45

41:                                               ; preds = %1
  %42 = load i32*, i32** %16, align 8
  %43 = load i32, i32* %42, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %15, align 4
  br label %45

45:                                               ; preds = %41, %1
  %46 = bitcast i32* %12 to i8*
  %47 = bitcast i32* %15 to i8*
  store i64* @packet_size_distribute_id, i64** %2, align 8
  store i8* %46, i8** %3, align 8
  store i8* %47, i8** %4, align 8
  store i64 0, i64* %5, align 8
  %48 = load i64*, i64** %2, align 8
  %49 = load i64, i64* %48, align 8
  %50 = load i8*, i8** %3, align 8
  %51 = load i8*, i8** %4, align 8
  %52 = load i64, i64* %5, align 8
  %53 = call i32 (i64, i8*, i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i64, i8*, i8*, i64, ...)*)(i64 noundef %49, i8* noundef %50, i8* noundef %51, i64 noundef %52) #2
  store i64 14, i64* %14, align 8
  %54 = load i8*, i8** %10, align 8
  %55 = load i64, i64* %14, align 8
  %56 = getelementptr i8, i8* %54, i64 %55
  %57 = load i8*, i8** %11, align 8
  %58 = icmp ugt i8* %56, %57
  br i1 %58, label %59, label %60

59:                                               ; preds = %45
  store i32 1, i32* %8, align 4
  br label %62

60:                                               ; preds = %45
  %61 = load i8*, i8** %10, align 8
  call void @swap_src_dst_mac(i8* noundef %61)
  store i32 3, i32* %8, align 4
  br label %62

62:                                               ; preds = %60, %59
  %63 = load i32, i32* %8, align 4
  ret i32 %63
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

declare i8* @_bpf_helper_ext_0001(...) #1

declare i32 @_bpf_helper_ext_0002(...) #1

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

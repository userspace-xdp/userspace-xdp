; ModuleID = 'xdp-maps.bpf.c'
source_filename = "xdp-maps.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [1 x i32]*, [8192 x i32]*, i32*, i32* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@bpf_map_lookup_elem = internal global i8* (i8*, i8*)* inttoptr (i64 1 to i8* (i8*, i8*)*), align 8
@packet_size_distribute = dso_local global %struct.anon zeroinitializer, section ".maps", align 8
@bpf_map_update_elem = internal global i64 (i8*, i8*, i8*, i64)* inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*), align 8
@__license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [3 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__license, i32 0, i32 0), i8* bitcast (%struct.anon* @packet_size_distribute to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca %struct.xdp_md*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.ethhdr*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %3, align 8
  %11 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %12 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %11, i32 0, i32 0
  %13 = load i64, i64* %12, align 8
  %14 = inttoptr i64 %13 to i8*
  store i8* %14, i8** %4, align 8
  %15 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %16 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %15, i32 0, i32 1
  %17 = load i64, i64* %16, align 8
  %18 = inttoptr i64 %17 to i8*
  store i8* %18, i8** %5, align 8
  %19 = load i8*, i8** %5, align 8
  %20 = load i8*, i8** %4, align 8
  %21 = ptrtoint i8* %19 to i64
  %22 = ptrtoint i8* %20 to i64
  %23 = sub i64 %21, %22
  %24 = trunc i64 %23 to i32
  store i32 %24, i32* %6, align 4
  %25 = load i8*, i8** %4, align 8
  %26 = bitcast i8* %25 to %struct.ethhdr*
  store %struct.ethhdr* %26, %struct.ethhdr** %7, align 8
  store i32 0, i32* %9, align 4
  %27 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %28 = bitcast i32* %6 to i8*
  %29 = call i8* %27(i8* noundef bitcast (%struct.anon* @packet_size_distribute to i8*), i8* noundef %28)
  %30 = bitcast i8* %29 to i32*
  store i32* %30, i32** %10, align 8
  %31 = load i32*, i32** %10, align 8
  %32 = icmp ne i32* %31, null
  br i1 %32, label %33, label %37

33:                                               ; preds = %1
  %34 = load i32*, i32** %10, align 8
  %35 = load i32, i32* %34, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %9, align 4
  br label %37

37:                                               ; preds = %33, %1
  %38 = load i64 (i8*, i8*, i8*, i64)*, i64 (i8*, i8*, i8*, i64)** @bpf_map_update_elem, align 8
  %39 = bitcast i32* %6 to i8*
  %40 = bitcast i32* %9 to i8*
  %41 = call i64 %38(i8* noundef bitcast (%struct.anon* @packet_size_distribute to i8*), i8* noundef %39, i8* noundef %40, i64 noundef 0)
  store i64 14, i64* %8, align 8
  %42 = load i8*, i8** %4, align 8
  %43 = load i64, i64* %8, align 8
  %44 = getelementptr i8, i8* %42, i64 %43
  %45 = load i8*, i8** %5, align 8
  %46 = icmp ugt i8* %44, %45
  br i1 %46, label %47, label %48

47:                                               ; preds = %37
  store i32 1, i32* %2, align 4
  br label %50

48:                                               ; preds = %37
  %49 = load i8*, i8** %4, align 8
  call void @swap_src_dst_mac(i8* noundef %49)
  store i32 3, i32* %2, align 4
  br label %50

50:                                               ; preds = %48, %47
  %51 = load i32, i32* %2, align 4
  ret i32 %51
}

; Function Attrs: noinline nounwind optnone
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

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

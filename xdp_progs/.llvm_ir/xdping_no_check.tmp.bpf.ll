; ModuleID = 'xdping_no_check.bpf.c'
source_filename = "xdping_no_check.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.4 = type { [1 x i32]*, [256 x i32]*, i32*, %struct.pinginfo* }
%struct.pinginfo = type { i64, i16, i16, i32, [10 x i64] }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon }
%union.anon = type { i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { i32, i32 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@ping_map = dso_local global %struct.anon.4 zeroinitializer, section ".maps", align 8
@bpf_csum_diff = internal global i64 (i32*, i32, i32*, i32, i32)* inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*), align 8
@llvm.compiler.used = appending global [4 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdping_client to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.4* @ping_map to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca [3 x i16], align 2
  %9 = alloca %struct.xdp_md*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca %struct.ethhdr*, align 8
  %12 = alloca %struct.icmphdr*, align 8
  %13 = alloca %struct.iphdr*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %9, align 8
  %16 = load %struct.xdp_md*, %struct.xdp_md** %9, align 8
  %17 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %16, i32 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = inttoptr i64 %18 to i8*
  store i8* %19, i8** %10, align 8
  %20 = load i8*, i8** %10, align 8
  %21 = bitcast i8* %20 to %struct.ethhdr*
  store %struct.ethhdr* %21, %struct.ethhdr** %11, align 8
  %22 = load i8*, i8** %10, align 8
  %23 = getelementptr i8, i8* %22, i64 14
  %24 = bitcast i8* %23 to %struct.iphdr*
  store %struct.iphdr* %24, %struct.iphdr** %13, align 8
  %25 = load i8*, i8** %10, align 8
  %26 = getelementptr i8, i8* %25, i64 14
  %27 = getelementptr i8, i8* %26, i64 20
  %28 = bitcast i8* %27 to %struct.icmphdr*
  store %struct.icmphdr* %28, %struct.icmphdr** %12, align 8
  %29 = load %struct.iphdr*, %struct.iphdr** %13, align 8
  %30 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %29, i32 0, i32 8
  %31 = bitcast %union.anon.1* %30 to %struct.anon.2*
  %32 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %31, i32 0, i32 0
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %14, align 4
  %34 = load i8*, i8** %10, align 8
  store i8* %34, i8** %6, align 8
  %35 = load i8*, i8** %6, align 8
  %36 = bitcast i8* %35 to i16*
  store i16* %36, i16** %7, align 8
  %37 = load i16*, i16** %7, align 8
  %38 = load i16, i16* %37, align 2
  %39 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 0
  store i16 %38, i16* %39, align 2
  %40 = load i16*, i16** %7, align 8
  %41 = getelementptr inbounds i16, i16* %40, i64 1
  %42 = load i16, i16* %41, align 2
  %43 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 1
  store i16 %42, i16* %43, align 2
  %44 = load i16*, i16** %7, align 8
  %45 = getelementptr inbounds i16, i16* %44, i64 2
  %46 = load i16, i16* %45, align 2
  %47 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 2
  store i16 %46, i16* %47, align 2
  %48 = load i16*, i16** %7, align 8
  %49 = getelementptr inbounds i16, i16* %48, i64 3
  %50 = load i16, i16* %49, align 2
  %51 = load i16*, i16** %7, align 8
  store i16 %50, i16* %51, align 2
  %52 = load i16*, i16** %7, align 8
  %53 = getelementptr inbounds i16, i16* %52, i64 4
  %54 = load i16, i16* %53, align 2
  %55 = load i16*, i16** %7, align 8
  %56 = getelementptr inbounds i16, i16* %55, i64 1
  store i16 %54, i16* %56, align 2
  %57 = load i16*, i16** %7, align 8
  %58 = getelementptr inbounds i16, i16* %57, i64 5
  %59 = load i16, i16* %58, align 2
  %60 = load i16*, i16** %7, align 8
  %61 = getelementptr inbounds i16, i16* %60, i64 2
  store i16 %59, i16* %61, align 2
  %62 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 0
  %63 = load i16, i16* %62, align 2
  %64 = load i16*, i16** %7, align 8
  %65 = getelementptr inbounds i16, i16* %64, i64 3
  store i16 %63, i16* %65, align 2
  %66 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 1
  %67 = load i16, i16* %66, align 2
  %68 = load i16*, i16** %7, align 8
  %69 = getelementptr inbounds i16, i16* %68, i64 4
  store i16 %67, i16* %69, align 2
  %70 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 2
  %71 = load i16, i16* %70, align 2
  %72 = load i16*, i16** %7, align 8
  %73 = getelementptr inbounds i16, i16* %72, i64 5
  store i16 %71, i16* %73, align 2
  %74 = load %struct.iphdr*, %struct.iphdr** %13, align 8
  %75 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %74, i32 0, i32 8
  %76 = bitcast %union.anon.1* %75 to %struct.anon.2*
  %77 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %76, i32 0, i32 1
  %78 = load i32, i32* %77, align 4
  %79 = load %struct.iphdr*, %struct.iphdr** %13, align 8
  %80 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %79, i32 0, i32 8
  %81 = bitcast %union.anon.1* %80 to %struct.anon.2*
  %82 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %81, i32 0, i32 0
  store i32 %78, i32* %82, align 4
  %83 = load i32, i32* %14, align 4
  %84 = load %struct.iphdr*, %struct.iphdr** %13, align 8
  %85 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %84, i32 0, i32 8
  %86 = bitcast %union.anon.1* %85 to %struct.anon.2*
  %87 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %86, i32 0, i32 1
  store i32 %83, i32* %87, align 4
  %88 = load %struct.icmphdr*, %struct.icmphdr** %12, align 8
  %89 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %88, i32 0, i32 0
  store i8 0, i8* %89, align 4
  %90 = load %struct.icmphdr*, %struct.icmphdr** %12, align 8
  %91 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %90, i32 0, i32 2
  store i16 0, i16* %91, align 2
  %92 = load %struct.icmphdr*, %struct.icmphdr** %12, align 8
  %93 = bitcast %struct.icmphdr* %92 to i8*
  store i8* %93, i8** %3, align 8
  store i32 64, i32* %4, align 4
  %94 = load i64 (i32*, i32, i32*, i32, i32)*, i64 (i32*, i32, i32*, i32, i32)** @bpf_csum_diff, align 8
  %95 = load i8*, i8** %3, align 8
  %96 = bitcast i8* %95 to i32*
  %97 = load i32, i32* %4, align 4
  %98 = call i64 %94(i32* noundef null, i32 noundef 0, i32* noundef %96, i32 noundef %97, i32 noundef 0) #1
  %99 = trunc i64 %98 to i32
  store i32 %99, i32* %5, align 4
  %100 = load i32, i32* %5, align 4
  store i32 %100, i32* %2, align 4
  %101 = load i32, i32* %2, align 4
  %102 = and i32 %101, 65535
  %103 = load i32, i32* %2, align 4
  %104 = lshr i32 %103, 16
  %105 = add i32 %102, %104
  store i32 %105, i32* %2, align 4
  %106 = load i32, i32* %2, align 4
  %107 = and i32 %106, 65535
  %108 = load i32, i32* %2, align 4
  %109 = lshr i32 %108, 16
  %110 = add i32 %107, %109
  %111 = xor i32 %110, -1
  %112 = trunc i32 %111 to i16
  %113 = load %struct.icmphdr*, %struct.icmphdr** %12, align 8
  %114 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %113, i32 0, i32 2
  store i16 %112, i16* %114, align 2
  ret i32 3
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @xdping_client(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca %struct.xdp_md*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %2, align 8
  ret i32 3
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

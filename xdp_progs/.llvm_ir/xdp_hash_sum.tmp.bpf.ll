; ModuleID = 'xdp_hash_sum.bpf.c'
source_filename = "xdp_hash_sum.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hash_and_sum = type { i32, i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [2 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca %struct.xdp_md*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.ethhdr*, align 8
  %7 = alloca i64, align 8
  %8 = alloca i16, align 2
  %9 = alloca %struct.hash_and_sum, align 4
  %10 = alloca %struct.iphdr*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %3, align 8
  %11 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %12 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %11, i32 0, i32 1
  %13 = load i64, i64* %12, align 8
  %14 = inttoptr i64 %13 to i8*
  store i8* %14, i8** %4, align 8
  %15 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %16 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %15, i32 0, i32 0
  %17 = load i64, i64* %16, align 8
  %18 = inttoptr i64 %17 to i8*
  store i8* %18, i8** %5, align 8
  %19 = load i8*, i8** %5, align 8
  %20 = bitcast i8* %19 to %struct.ethhdr*
  store %struct.ethhdr* %20, %struct.ethhdr** %6, align 8
  store i64 14, i64* %7, align 8
  %21 = load i8*, i8** %5, align 8
  %22 = load i64, i64* %7, align 8
  %23 = getelementptr i8, i8* %21, i64 %22
  %24 = load i8*, i8** %4, align 8
  %25 = icmp ugt i8* %23, %24
  br i1 %25, label %26, label %27

26:                                               ; preds = %1
  store i32 2, i32* %2, align 4
  br label %79

27:                                               ; preds = %1
  %28 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %29 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %28, i32 0, i32 2
  %30 = load i16, i16* %29, align 2
  store i16 %30, i16* %8, align 2
  %31 = load i16, i16* %8, align 2
  %32 = zext i16 %31 to i32
  %33 = icmp ne i32 %32, 8
  br i1 %33, label %34, label %35

34:                                               ; preds = %27
  store i32 2, i32* %2, align 4
  br label %79

35:                                               ; preds = %27
  %36 = load i8*, i8** %5, align 8
  %37 = getelementptr i8, i8* %36, i64 14
  %38 = bitcast i8* %37 to %struct.iphdr*
  store %struct.iphdr* %38, %struct.iphdr** %10, align 8
  %39 = load %struct.iphdr*, %struct.iphdr** %10, align 8
  %40 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %39, i64 1
  %41 = load i8*, i8** %4, align 8
  %42 = bitcast i8* %41 to %struct.iphdr*
  %43 = icmp ugt %struct.iphdr* %40, %42
  br i1 %43, label %44, label %45

44:                                               ; preds = %35
  store i32 2, i32* %2, align 4
  br label %79

45:                                               ; preds = %35
  %46 = load i8*, i8** %5, align 8
  %47 = getelementptr i8, i8* %46, i64 1200
  %48 = load i8*, i8** %4, align 8
  %49 = icmp ult i8* %47, %48
  br i1 %49, label %50, label %51

50:                                               ; preds = %45
  store i32 2, i32* %2, align 4
  br label %79

51:                                               ; preds = %45
  %52 = load i8*, i8** %5, align 8
  %53 = getelementptr i8, i8* %52, i64 60
  %54 = load i8*, i8** %4, align 8
  %55 = icmp ugt i8* %53, %54
  br i1 %55, label %56, label %57

56:                                               ; preds = %51
  store i32 2, i32* %2, align 4
  br label %79

57:                                               ; preds = %51
  %58 = load %struct.iphdr*, %struct.iphdr** %10, align 8
  %59 = bitcast %struct.iphdr* %58 to i8*
  %60 = getelementptr i8, i8* %59, i64 20
  %61 = getelementptr i8, i8* %60, i64 8
  %62 = load i8*, i8** %4, align 8
  %63 = icmp ugt i8* %61, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %57
  store i32 2, i32* %2, align 4
  br label %79

65:                                               ; preds = %57
  %66 = load i8*, i8** %5, align 8
  %67 = call i32 @calculate_checksum(i8* noundef %66, i32 noundef 60)
  %68 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %9, i32 0, i32 0
  store i32 %67, i32* %68, align 4
  %69 = load i8*, i8** %5, align 8
  %70 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %9, i32 0, i32 0
  %71 = load i32, i32* %70, align 4
  %72 = call i32 @xxhash32(i8* noundef %69, i32 noundef 60, i32 noundef %71)
  %73 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %9, i32 0, i32 1
  store i32 %72, i32* %73, align 4
  %74 = load %struct.iphdr*, %struct.iphdr** %10, align 8
  %75 = bitcast %struct.iphdr* %74 to i8*
  %76 = getelementptr i8, i8* %75, i64 20
  %77 = bitcast %struct.hash_and_sum* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %76, i8* align 4 %77, i64 8, i1 false)
  %78 = load i8*, i8** %5, align 8
  call void @swap_src_dst_mac(i8* noundef %78)
  store i32 3, i32* %2, align 4
  br label %79

79:                                               ; preds = %65, %64, %56, %50, %44, %34, %26
  %80 = load i32, i32* %2, align 4
  ret i32 %80
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @calculate_checksum(i8* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %7

7:                                                ; preds = %20, %2
  %8 = load i32, i32* %6, align 4
  %9 = load i32, i32* %4, align 4
  %10 = icmp ult i32 %8, %9
  br i1 %10, label %11, label %23

11:                                               ; preds = %7
  %12 = load i8*, i8** %3, align 8
  %13 = load i32, i32* %6, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %12, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = load i32, i32* %5, align 4
  %19 = add i32 %18, %17
  store i32 %19, i32* %5, align 4
  br label %20

20:                                               ; preds = %11
  %21 = load i32, i32* %6, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* %6, align 4
  br label %7, !llvm.loop !6

23:                                               ; preds = %7
  %24 = load i32, i32* %5, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @xxhash32(i8* noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i8* %0, i8** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  %10 = load i32, i32* %8, align 4
  %11 = icmp uge i32 %10, 16
  br i1 %11, label %12, label %27

12:                                               ; preds = %3
  %13 = load i8*, i8** %7, align 8
  %14 = load i32, i32* %8, align 4
  %15 = load i32, i32* %9, align 4
  store i8* %13, i8** %4, align 8
  store i32 %14, i32* %5, align 4
  store i32 %15, i32* %6, align 4
  %16 = load i8*, i8** %4, align 8
  %17 = load i32, i32* %5, align 4
  %18 = load i32, i32* %6, align 4
  %19 = add i32 %18, -1640531535
  %20 = add i32 %19, -2048144777
  %21 = load i32, i32* %6, align 4
  %22 = add i32 %21, -2048144777
  %23 = load i32, i32* %6, align 4
  %24 = load i32, i32* %6, align 4
  %25 = sub i32 %24, -1640531535
  %26 = call i32 @h16bytes_4(i8* noundef %16, i32 noundef %17, i32 noundef %20, i32 noundef %22, i32 noundef %23, i32 noundef %25) #2
  br label %30

27:                                               ; preds = %3
  %28 = load i32, i32* %9, align 4
  %29 = add i32 %28, 374761393
  br label %30

30:                                               ; preds = %27, %12
  %31 = phi i32 [ %26, %12 ], [ %29, %27 ]
  %32 = load i32, i32* %8, align 4
  %33 = add i32 %31, %32
  %34 = load i8*, i8** %7, align 8
  %35 = load i32, i32* %8, align 4
  %36 = and i32 %35, -16
  %37 = zext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %34, i64 %37
  %39 = load i32, i32* %8, align 4
  %40 = and i32 %39, 15
  %41 = call i32 @finalize(i32 noundef %33, i8* noundef %38, i32 noundef %40)
  ret i32 %41
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

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

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @finalize(i32 noundef %0, i8* noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i8*, align 8
  %21 = alloca i32, align 4
  store i32 %0, i32* %19, align 4
  store i8* %1, i8** %20, align 8
  store i32 %2, i32* %21, align 4
  %22 = load i32, i32* %21, align 4
  %23 = icmp uge i32 %22, 4
  br i1 %23, label %24, label %64

24:                                               ; preds = %3
  %25 = load i32, i32* %19, align 4
  %26 = load i8*, i8** %20, align 8
  store i8* %26, i8** %14, align 8
  %27 = load i8*, i8** %14, align 8
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = load i8*, i8** %14, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = shl i32 %33, 8
  %35 = or i32 %29, %34
  %36 = load i8*, i8** %14, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 2
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = shl i32 %39, 16
  %41 = or i32 %35, %40
  %42 = load i8*, i8** %14, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 3
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = shl i32 %45, 24
  %47 = or i32 %41, %46
  %48 = mul i32 %47, -1028477379
  %49 = add i32 %25, %48
  store i32 %49, i32* %15, align 4
  store i32 17, i32* %16, align 4
  %50 = load i32, i32* %15, align 4
  %51 = load i32, i32* %16, align 4
  %52 = shl i32 %50, %51
  %53 = load i32, i32* %15, align 4
  %54 = load i32, i32* %16, align 4
  %55 = sub nsw i32 32, %54
  %56 = lshr i32 %53, %55
  %57 = or i32 %52, %56
  %58 = mul i32 %57, 668265263
  %59 = load i8*, i8** %20, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 4
  %61 = load i32, i32* %21, align 4
  %62 = sub i32 %61, 4
  %63 = call i32 @finalize(i32 noundef %58, i8* noundef %60, i32 noundef %62)
  br label %114

64:                                               ; preds = %3
  %65 = load i32, i32* %21, align 4
  %66 = icmp ugt i32 %65, 0
  br i1 %66, label %67, label %88

67:                                               ; preds = %64
  %68 = load i32, i32* %19, align 4
  %69 = load i8*, i8** %20, align 8
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = mul i32 %71, 374761393
  %73 = add i32 %68, %72
  store i32 %73, i32* %17, align 4
  store i32 11, i32* %18, align 4
  %74 = load i32, i32* %17, align 4
  %75 = load i32, i32* %18, align 4
  %76 = shl i32 %74, %75
  %77 = load i32, i32* %17, align 4
  %78 = load i32, i32* %18, align 4
  %79 = sub nsw i32 32, %78
  %80 = lshr i32 %77, %79
  %81 = or i32 %76, %80
  %82 = mul i32 %81, -1640531535
  %83 = load i8*, i8** %20, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 1
  %85 = load i32, i32* %21, align 4
  %86 = sub i32 %85, 1
  %87 = call i32 @finalize(i32 noundef %82, i8* noundef %84, i32 noundef %86)
  br label %112

88:                                               ; preds = %64
  %89 = load i32, i32* %19, align 4
  store i32 %89, i32* %13, align 4
  %90 = load i32, i32* %13, align 4
  store i32 %90, i32* %4, align 4
  store i32 15, i32* %5, align 4
  store i32 -2048144777, i32* %6, align 4
  %91 = load i32, i32* %4, align 4
  %92 = load i32, i32* %4, align 4
  %93 = load i32, i32* %5, align 4
  %94 = lshr i32 %92, %93
  %95 = xor i32 %91, %94
  %96 = load i32, i32* %6, align 4
  %97 = mul i32 %95, %96
  store i32 %97, i32* %7, align 4
  store i32 13, i32* %8, align 4
  store i32 -1028477379, i32* %9, align 4
  %98 = load i32, i32* %7, align 4
  %99 = load i32, i32* %7, align 4
  %100 = load i32, i32* %8, align 4
  %101 = lshr i32 %99, %100
  %102 = xor i32 %98, %101
  %103 = load i32, i32* %9, align 4
  %104 = mul i32 %102, %103
  store i32 %104, i32* %10, align 4
  store i32 16, i32* %11, align 4
  store i32 1, i32* %12, align 4
  %105 = load i32, i32* %10, align 4
  %106 = load i32, i32* %10, align 4
  %107 = load i32, i32* %11, align 4
  %108 = lshr i32 %106, %107
  %109 = xor i32 %105, %108
  %110 = load i32, i32* %12, align 4
  %111 = mul i32 %109, %110
  br label %112

112:                                              ; preds = %88, %67
  %113 = phi i32 [ %87, %67 ], [ %111, %88 ]
  br label %114

114:                                              ; preds = %112, %24
  %115 = phi i32 [ %63, %24 ], [ %113, %112 ]
  ret i32 %115
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @h16bytes_4(i8* noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i8*, align 8
  %27 = alloca i8*, align 8
  %28 = alloca i32, align 4
  %29 = alloca i8*, align 8
  %30 = alloca i8*, align 8
  %31 = alloca i32, align 4
  %32 = alloca i8*, align 8
  %33 = alloca i8*, align 8
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i8*, align 8
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  store i8* %0, i8** %43, align 8
  store i32 %1, i32* %44, align 4
  store i32 %2, i32* %45, align 4
  store i32 %3, i32* %46, align 4
  store i32 %4, i32* %47, align 4
  store i32 %5, i32* %48, align 4
  %49 = load i32, i32* %44, align 4
  %50 = icmp uge i32 %49, 16
  br i1 %50, label %51, label %212

51:                                               ; preds = %6
  %52 = load i8*, i8** %43, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 16
  %54 = load i32, i32* %44, align 4
  %55 = sub i32 %54, 16
  %56 = load i8*, i8** %43, align 8
  %57 = load i32, i32* %45, align 4
  store i8* %56, i8** %24, align 8
  store i32 %57, i32* %25, align 4
  %58 = load i32, i32* %25, align 4
  %59 = load i8*, i8** %24, align 8
  store i8* %59, i8** %23, align 8
  %60 = load i8*, i8** %23, align 8
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = load i8*, i8** %23, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 1
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = shl i32 %66, 8
  %68 = or i32 %62, %67
  %69 = load i8*, i8** %23, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 2
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = shl i32 %72, 16
  %74 = or i32 %68, %73
  %75 = load i8*, i8** %23, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 3
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = shl i32 %78, 24
  %80 = or i32 %74, %79
  store i32 %58, i32* %21, align 4
  store i32 %80, i32* %22, align 4
  %81 = load i32, i32* %21, align 4
  %82 = load i32, i32* %22, align 4
  %83 = mul i32 %82, -2048144777
  %84 = add i32 %81, %83
  store i32 %84, i32* %19, align 4
  store i32 13, i32* %20, align 4
  %85 = load i32, i32* %19, align 4
  %86 = load i32, i32* %20, align 4
  %87 = shl i32 %85, %86
  %88 = load i32, i32* %19, align 4
  %89 = load i32, i32* %20, align 4
  %90 = sub nsw i32 32, %89
  %91 = lshr i32 %88, %90
  %92 = or i32 %87, %91
  %93 = mul i32 %92, -1640531535
  %94 = load i8*, i8** %43, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 4
  %96 = load i32, i32* %46, align 4
  store i8* %95, i8** %27, align 8
  store i32 %96, i32* %28, align 4
  %97 = load i32, i32* %28, align 4
  %98 = load i8*, i8** %27, align 8
  store i8* %98, i8** %26, align 8
  %99 = load i8*, i8** %26, align 8
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = load i8*, i8** %26, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 1
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = shl i32 %105, 8
  %107 = or i32 %101, %106
  %108 = load i8*, i8** %26, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 2
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = shl i32 %111, 16
  %113 = or i32 %107, %112
  %114 = load i8*, i8** %26, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 3
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i32
  %118 = shl i32 %117, 24
  %119 = or i32 %113, %118
  store i32 %97, i32* %17, align 4
  store i32 %119, i32* %18, align 4
  %120 = load i32, i32* %17, align 4
  %121 = load i32, i32* %18, align 4
  %122 = mul i32 %121, -2048144777
  %123 = add i32 %120, %122
  store i32 %123, i32* %15, align 4
  store i32 13, i32* %16, align 4
  %124 = load i32, i32* %15, align 4
  %125 = load i32, i32* %16, align 4
  %126 = shl i32 %124, %125
  %127 = load i32, i32* %15, align 4
  %128 = load i32, i32* %16, align 4
  %129 = sub nsw i32 32, %128
  %130 = lshr i32 %127, %129
  %131 = or i32 %126, %130
  %132 = mul i32 %131, -1640531535
  %133 = load i8*, i8** %43, align 8
  %134 = getelementptr inbounds i8, i8* %133, i64 8
  %135 = load i32, i32* %47, align 4
  store i8* %134, i8** %30, align 8
  store i32 %135, i32* %31, align 4
  %136 = load i32, i32* %31, align 4
  %137 = load i8*, i8** %30, align 8
  store i8* %137, i8** %29, align 8
  %138 = load i8*, i8** %29, align 8
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = load i8*, i8** %29, align 8
  %142 = getelementptr inbounds i8, i8* %141, i64 1
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i32
  %145 = shl i32 %144, 8
  %146 = or i32 %140, %145
  %147 = load i8*, i8** %29, align 8
  %148 = getelementptr inbounds i8, i8* %147, i64 2
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = shl i32 %150, 16
  %152 = or i32 %146, %151
  %153 = load i8*, i8** %29, align 8
  %154 = getelementptr inbounds i8, i8* %153, i64 3
  %155 = load i8, i8* %154, align 1
  %156 = zext i8 %155 to i32
  %157 = shl i32 %156, 24
  %158 = or i32 %152, %157
  store i32 %136, i32* %13, align 4
  store i32 %158, i32* %14, align 4
  %159 = load i32, i32* %13, align 4
  %160 = load i32, i32* %14, align 4
  %161 = mul i32 %160, -2048144777
  %162 = add i32 %159, %161
  store i32 %162, i32* %11, align 4
  store i32 13, i32* %12, align 4
  %163 = load i32, i32* %11, align 4
  %164 = load i32, i32* %12, align 4
  %165 = shl i32 %163, %164
  %166 = load i32, i32* %11, align 4
  %167 = load i32, i32* %12, align 4
  %168 = sub nsw i32 32, %167
  %169 = lshr i32 %166, %168
  %170 = or i32 %165, %169
  %171 = mul i32 %170, -1640531535
  %172 = load i8*, i8** %43, align 8
  %173 = getelementptr inbounds i8, i8* %172, i64 12
  %174 = load i32, i32* %48, align 4
  store i8* %173, i8** %33, align 8
  store i32 %174, i32* %34, align 4
  %175 = load i32, i32* %34, align 4
  %176 = load i8*, i8** %33, align 8
  store i8* %176, i8** %32, align 8
  %177 = load i8*, i8** %32, align 8
  %178 = load i8, i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = load i8*, i8** %32, align 8
  %181 = getelementptr inbounds i8, i8* %180, i64 1
  %182 = load i8, i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = shl i32 %183, 8
  %185 = or i32 %179, %184
  %186 = load i8*, i8** %32, align 8
  %187 = getelementptr inbounds i8, i8* %186, i64 2
  %188 = load i8, i8* %187, align 1
  %189 = zext i8 %188 to i32
  %190 = shl i32 %189, 16
  %191 = or i32 %185, %190
  %192 = load i8*, i8** %32, align 8
  %193 = getelementptr inbounds i8, i8* %192, i64 3
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = shl i32 %195, 24
  %197 = or i32 %191, %196
  store i32 %175, i32* %9, align 4
  store i32 %197, i32* %10, align 4
  %198 = load i32, i32* %9, align 4
  %199 = load i32, i32* %10, align 4
  %200 = mul i32 %199, -2048144777
  %201 = add i32 %198, %200
  store i32 %201, i32* %7, align 4
  store i32 13, i32* %8, align 4
  %202 = load i32, i32* %7, align 4
  %203 = load i32, i32* %8, align 4
  %204 = shl i32 %202, %203
  %205 = load i32, i32* %7, align 4
  %206 = load i32, i32* %8, align 4
  %207 = sub nsw i32 32, %206
  %208 = lshr i32 %205, %207
  %209 = or i32 %204, %208
  %210 = mul i32 %209, -1640531535
  %211 = call i32 @h16bytes_4(i8* noundef %53, i32 noundef %55, i32 noundef %93, i32 noundef %132, i32 noundef %171, i32 noundef %210)
  br label %252

212:                                              ; preds = %6
  %213 = load i32, i32* %45, align 4
  store i32 %213, i32* %35, align 4
  store i32 1, i32* %36, align 4
  %214 = load i32, i32* %35, align 4
  %215 = load i32, i32* %36, align 4
  %216 = shl i32 %214, %215
  %217 = load i32, i32* %35, align 4
  %218 = load i32, i32* %36, align 4
  %219 = sub nsw i32 32, %218
  %220 = lshr i32 %217, %219
  %221 = or i32 %216, %220
  %222 = load i32, i32* %46, align 4
  store i32 %222, i32* %37, align 4
  store i32 7, i32* %38, align 4
  %223 = load i32, i32* %37, align 4
  %224 = load i32, i32* %38, align 4
  %225 = shl i32 %223, %224
  %226 = load i32, i32* %37, align 4
  %227 = load i32, i32* %38, align 4
  %228 = sub nsw i32 32, %227
  %229 = lshr i32 %226, %228
  %230 = or i32 %225, %229
  %231 = add i32 %221, %230
  %232 = load i32, i32* %47, align 4
  store i32 %232, i32* %39, align 4
  store i32 12, i32* %40, align 4
  %233 = load i32, i32* %39, align 4
  %234 = load i32, i32* %40, align 4
  %235 = shl i32 %233, %234
  %236 = load i32, i32* %39, align 4
  %237 = load i32, i32* %40, align 4
  %238 = sub nsw i32 32, %237
  %239 = lshr i32 %236, %238
  %240 = or i32 %235, %239
  %241 = add i32 %231, %240
  %242 = load i32, i32* %48, align 4
  store i32 %242, i32* %41, align 4
  store i32 18, i32* %42, align 4
  %243 = load i32, i32* %41, align 4
  %244 = load i32, i32* %42, align 4
  %245 = shl i32 %243, %244
  %246 = load i32, i32* %41, align 4
  %247 = load i32, i32* %42, align 4
  %248 = sub nsw i32 32, %247
  %249 = lshr i32 %246, %248
  %250 = or i32 %245, %249
  %251 = add i32 %241, %250
  br label %252

252:                                              ; preds = %212, %51
  %253 = phi i32 [ %211, %51 ], [ %251, %212 ]
  ret i32 %253
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
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

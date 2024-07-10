; ModuleID = 'xdp-maps.bpf.c'
source_filename = "xdp-maps.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.bpftime_hash_map_t = type { i32, i32, i32, i8* }
%struct.anon = type { [1 x i32]*, [8192 x i32]*, i32*, i32* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@__packet_size_distribute_data = dso_local global [6656 x i8] zeroinitializer, align 16
@__packet_size_distribute = dso_local global %struct.bpftime_hash_map_t { i32 128, i32 16, i32 32, i8* getelementptr inbounds ([6656 x i8], [6656 x i8]* @__packet_size_distribute_data, i32 0, i32 0) }, align 8
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
  %2 = alloca i32, align 4
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca %struct.xdp_md*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.ethhdr*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %11, align 8
  %19 = load %struct.xdp_md*, %struct.xdp_md** %11, align 8
  %20 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %19, i32 0, i32 0
  %21 = load i64, i64* %20, align 8
  %22 = inttoptr i64 %21 to i8*
  store i8* %22, i8** %12, align 8
  %23 = load %struct.xdp_md*, %struct.xdp_md** %11, align 8
  %24 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %23, i32 0, i32 1
  %25 = load i64, i64* %24, align 8
  %26 = inttoptr i64 %25 to i8*
  store i8* %26, i8** %13, align 8
  %27 = load i8*, i8** %13, align 8
  %28 = load i8*, i8** %12, align 8
  %29 = ptrtoint i8* %27 to i64
  %30 = ptrtoint i8* %28 to i64
  %31 = sub i64 %29, %30
  %32 = trunc i64 %31 to i32
  store i32 %32, i32* %14, align 4
  %33 = load i8*, i8** %12, align 8
  %34 = bitcast i8* %33 to %struct.ethhdr*
  store %struct.ethhdr* %34, %struct.ethhdr** %15, align 8
  store i32 0, i32* %17, align 4
  %35 = bitcast i32* %14 to i8*
  store i64* @packet_size_distribute_id, i64** %8, align 8
  store i8* %35, i8** %9, align 8
  %36 = load i64*, i64** %8, align 8
  %37 = load i64, i64* %36, align 8
  %38 = icmp eq i64 %37, 17179869184
  br i1 %38, label %39, label %42

39:                                               ; preds = %1
  %40 = load i8*, i8** %9, align 8
  %41 = call i8* @elem_lookup(%struct.bpftime_hash_map_t* noundef @__packet_size_distribute, i8* noundef %40) #2
  store i8* %41, i8** %7, align 8
  br label %47

42:                                               ; preds = %1
  %43 = load i64*, i64** %8, align 8
  %44 = load i64, i64* %43, align 8
  %45 = load i8*, i8** %9, align 8
  %46 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %44, i8* noundef %45) #2
  store i8* %46, i8** %7, align 8
  br label %47

47:                                               ; preds = %39, %42
  %48 = load i8*, i8** %7, align 8
  %49 = bitcast i8* %48 to i32*
  store i32* %49, i32** %18, align 8
  %50 = load i32*, i32** %18, align 8
  %51 = icmp ne i32* %50, null
  br i1 %51, label %52, label %56

52:                                               ; preds = %47
  %53 = load i32*, i32** %18, align 8
  %54 = load i32, i32* %53, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %17, align 4
  br label %56

56:                                               ; preds = %52, %47
  %57 = bitcast i32* %14 to i8*
  %58 = bitcast i32* %17 to i8*
  store i64* @packet_size_distribute_id, i64** %3, align 8
  store i8* %57, i8** %4, align 8
  store i8* %58, i8** %5, align 8
  store i64 0, i64* %6, align 8
  %59 = load i64*, i64** %3, align 8
  %60 = load i64, i64* %59, align 8
  %61 = icmp eq i64 %60, 17179869184
  br i1 %61, label %62, label %66

62:                                               ; preds = %56
  %63 = load i8*, i8** %4, align 8
  %64 = load i8*, i8** %5, align 8
  %65 = call i32 @elem_update(%struct.bpftime_hash_map_t* noundef @__packet_size_distribute, i8* noundef %63, i8* noundef %64) #2
  store i32 %65, i32* %2, align 4
  br label %73

66:                                               ; preds = %56
  %67 = load i64*, i64** %3, align 8
  %68 = load i64, i64* %67, align 8
  %69 = load i8*, i8** %4, align 8
  %70 = load i8*, i8** %5, align 8
  %71 = load i64, i64* %6, align 8
  %72 = call i32 (i64, i8*, i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i64, i8*, i8*, i64, ...)*)(i64 noundef %68, i8* noundef %69, i8* noundef %70, i64 noundef %71) #2
  store i32 %72, i32* %2, align 4
  br label %73

73:                                               ; preds = %62, %66
  %74 = load i32, i32* %2, align 4
  store i64 14, i64* %16, align 8
  %75 = load i8*, i8** %12, align 8
  %76 = load i64, i64* %16, align 8
  %77 = getelementptr i8, i8* %75, i64 %76
  %78 = load i8*, i8** %13, align 8
  %79 = icmp ugt i8* %77, %78
  br i1 %79, label %80, label %81

80:                                               ; preds = %73
  store i32 1, i32* %10, align 4
  br label %83

81:                                               ; preds = %73
  %82 = load i8*, i8** %12, align 8
  call void @swap_src_dst_mac(i8* noundef %82)
  store i32 3, i32* %10, align 4
  br label %83

83:                                               ; preds = %81, %80
  %84 = load i32, i32* %10, align 4
  ret i32 %84
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

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @elem_lookup(%struct.bpftime_hash_map_t* noundef %0, i8* noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.bpftime_hash_map_t*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %4, align 8
  store i8* %1, i8** %5, align 8
  %11 = load i8*, i8** %5, align 8
  %12 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %13 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = call i32 @hash_func(i8* noundef %11, i32 noundef %14)
  %16 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %17 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %16, i32 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = urem i32 %15, %18
  store i32 %19, i32* %6, align 4
  %20 = load i32, i32* %6, align 4
  store i32 %20, i32* %7, align 4
  br label %21

21:                                               ; preds = %70, %2
  %22 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %23 = load i32, i32* %6, align 4
  %24 = call i32 @is_empty(%struct.bpftime_hash_map_t* noundef %22, i32 noundef %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %21
  store i8* null, i8** %3, align 8
  br label %75

27:                                               ; preds = %21
  %28 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %29 = load i32, i32* %6, align 4
  %30 = call i8* @get_key(%struct.bpftime_hash_map_t* noundef %28, i32 noundef %29)
  store i8* %30, i8** %8, align 8
  store i32 1, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %31

31:                                               ; preds = %53, %27
  %32 = load i32, i32* %10, align 4
  %33 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %34 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %33, i32 0, i32 1
  %35 = load i32, i32* %34, align 4
  %36 = icmp ult i32 %32, %35
  br i1 %36, label %37, label %56

37:                                               ; preds = %31
  %38 = load i8*, i8** %8, align 8
  %39 = load i32, i32* %10, align 4
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* %38, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = load i8*, i8** %5, align 8
  %45 = load i32, i32* %10, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %44, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp ne i32 %43, %49
  br i1 %50, label %51, label %52

51:                                               ; preds = %37
  store i32 0, i32* %9, align 4
  br label %56

52:                                               ; preds = %37
  br label %53

53:                                               ; preds = %52
  %54 = load i32, i32* %10, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %10, align 4
  br label %31, !llvm.loop !6

56:                                               ; preds = %51, %31
  %57 = load i32, i32* %9, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %63

59:                                               ; preds = %56
  %60 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %61 = load i32, i32* %6, align 4
  %62 = call i8* @get_value(%struct.bpftime_hash_map_t* noundef %60, i32 noundef %61)
  store i8* %62, i8** %3, align 8
  br label %75

63:                                               ; preds = %56
  %64 = load i32, i32* %6, align 4
  %65 = add i32 %64, 1
  %66 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %67 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %66, i32 0, i32 0
  %68 = load i32, i32* %67, align 8
  %69 = urem i32 %65, %68
  store i32 %69, i32* %6, align 4
  br label %70

70:                                               ; preds = %63
  %71 = load i32, i32* %6, align 4
  %72 = load i32, i32* %7, align 4
  %73 = icmp ne i32 %71, %72
  br i1 %73, label %21, label %74, !llvm.loop !8

74:                                               ; preds = %70
  store i8* null, i8** %3, align 8
  br label %75

75:                                               ; preds = %74, %59, %26
  %76 = load i8*, i8** %3, align 8
  ret i8* %76
}

declare i8* @_bpf_helper_ext_0001(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @hash_func(i8* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %7

7:                                                ; preds = %21, %2
  %8 = load i32, i32* %6, align 4
  %9 = load i32, i32* %4, align 4
  %10 = icmp ult i32 %8, %9
  br i1 %10, label %11, label %24

11:                                               ; preds = %7
  %12 = load i32, i32* %5, align 4
  %13 = mul i32 %12, 31
  %14 = load i8*, i8** %3, align 8
  %15 = load i32, i32* %6, align 4
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %14, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = add i32 %13, %19
  store i32 %20, i32* %5, align 4
  br label %21

21:                                               ; preds = %11
  %22 = load i32, i32* %6, align 4
  %23 = add i32 %22, 1
  store i32 %23, i32* %6, align 4
  br label %7, !llvm.loop !9

24:                                               ; preds = %7
  %25 = load i32, i32* %5, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @is_empty(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %6 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %5, i32 0, i32 3
  %7 = load i8*, i8** %6, align 8
  %8 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %8, i32 noundef %9)
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds i8, i8* %7, i64 %11
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  %16 = zext i1 %15 to i32
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @get_key(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %6 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %5, i32 0, i32 3
  %7 = load i8*, i8** %6, align 8
  %8 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %8, i32 noundef %9)
  %11 = add i32 %10, 4
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i8, i8* %7, i64 %12
  ret i8* %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @get_value(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %6 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %5, i32 0, i32 3
  %7 = load i8*, i8** %6, align 8
  %8 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %8, i32 noundef %9)
  %11 = add i32 %10, 4
  %12 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %13 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = add i32 %11, %14
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %7, i64 %16
  ret i8* %17
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %7 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %6, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = add i32 4, %8
  %10 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %11 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %10, i32 0, i32 2
  %12 = load i32, i32* %11, align 8
  %13 = add i32 %9, %12
  %14 = mul i32 %5, %13
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @elem_update(%struct.bpftime_hash_map_t* noundef %0, i8* noundef %1, i8* noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.bpftime_hash_map_t*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  %16 = load i8*, i8** %6, align 8
  %17 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %18 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %17, i32 0, i32 1
  %19 = load i32, i32* %18, align 4
  %20 = call i32 @hash_func(i8* noundef %16, i32 noundef %19)
  %21 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %22 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %21, i32 0, i32 0
  %23 = load i32, i32* %22, align 8
  %24 = urem i32 %20, %23
  store i32 %24, i32* %8, align 4
  %25 = load i32, i32* %8, align 4
  store i32 %25, i32* %9, align 4
  br label %26

26:                                               ; preds = %118, %3
  %27 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %28 = load i32, i32* %8, align 4
  %29 = call i8* @get_key(%struct.bpftime_hash_map_t* noundef %27, i32 noundef %28)
  store i8* %29, i8** %10, align 8
  %30 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %31 = load i32, i32* %8, align 4
  %32 = call i32 @is_empty(%struct.bpftime_hash_map_t* noundef %30, i32 noundef %31)
  store i32 %32, i32* %11, align 4
  %33 = load i32, i32* %11, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %62, label %35

35:                                               ; preds = %26
  store i32 1, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %36

36:                                               ; preds = %58, %35
  %37 = load i32, i32* %12, align 4
  %38 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %39 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %38, i32 0, i32 1
  %40 = load i32, i32* %39, align 4
  %41 = icmp ult i32 %37, %40
  br i1 %41, label %42, label %61

42:                                               ; preds = %36
  %43 = load i8*, i8** %10, align 8
  %44 = load i32, i32* %12, align 4
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i8, i8* %43, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = load i8*, i8** %6, align 8
  %50 = load i32, i32* %12, align 4
  %51 = zext i32 %50 to i64
  %52 = getelementptr inbounds i8, i8* %49, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = icmp ne i32 %48, %54
  br i1 %55, label %56, label %57

56:                                               ; preds = %42
  store i32 0, i32* %11, align 4
  br label %61

57:                                               ; preds = %42
  br label %58

58:                                               ; preds = %57
  %59 = load i32, i32* %12, align 4
  %60 = add i32 %59, 1
  store i32 %60, i32* %12, align 4
  br label %36, !llvm.loop !10

61:                                               ; preds = %56, %36
  br label %62

62:                                               ; preds = %61, %26
  %63 = load i32, i32* %11, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %111

65:                                               ; preds = %62
  store i32 0, i32* %13, align 4
  br label %66

66:                                               ; preds = %82, %65
  %67 = load i32, i32* %13, align 4
  %68 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %69 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %68, i32 0, i32 1
  %70 = load i32, i32* %69, align 4
  %71 = icmp ult i32 %67, %70
  br i1 %71, label %72, label %85

72:                                               ; preds = %66
  %73 = load i8*, i8** %6, align 8
  %74 = load i32, i32* %13, align 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, i8* %73, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = load i8*, i8** %10, align 8
  %79 = load i32, i32* %13, align 4
  %80 = zext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8* %78, i64 %80
  store i8 %77, i8* %81, align 1
  br label %82

82:                                               ; preds = %72
  %83 = load i32, i32* %13, align 4
  %84 = add i32 %83, 1
  store i32 %84, i32* %13, align 4
  br label %66, !llvm.loop !11

85:                                               ; preds = %66
  %86 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %87 = load i32, i32* %8, align 4
  %88 = call i8* @get_value(%struct.bpftime_hash_map_t* noundef %86, i32 noundef %87)
  store i8* %88, i8** %14, align 8
  store i32 0, i32* %15, align 4
  br label %89

89:                                               ; preds = %105, %85
  %90 = load i32, i32* %15, align 4
  %91 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %92 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %91, i32 0, i32 2
  %93 = load i32, i32* %92, align 8
  %94 = icmp ult i32 %90, %93
  br i1 %94, label %95, label %108

95:                                               ; preds = %89
  %96 = load i8*, i8** %7, align 8
  %97 = load i32, i32* %15, align 4
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8* %96, i64 %98
  %100 = load i8, i8* %99, align 1
  %101 = load i8*, i8** %14, align 8
  %102 = load i32, i32* %15, align 4
  %103 = zext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8* %101, i64 %103
  store i8 %100, i8* %104, align 1
  br label %105

105:                                              ; preds = %95
  %106 = load i32, i32* %15, align 4
  %107 = add i32 %106, 1
  store i32 %107, i32* %15, align 4
  br label %89, !llvm.loop !12

108:                                              ; preds = %89
  %109 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %110 = load i32, i32* %8, align 4
  call void @set_filled(%struct.bpftime_hash_map_t* noundef %109, i32 noundef %110)
  store i32 1, i32* %4, align 4
  br label %123

111:                                              ; preds = %62
  %112 = load i32, i32* %8, align 4
  %113 = add i32 %112, 1
  %114 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %5, align 8
  %115 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %114, i32 0, i32 0
  %116 = load i32, i32* %115, align 8
  %117 = urem i32 %113, %116
  store i32 %117, i32* %8, align 4
  br label %118

118:                                              ; preds = %111
  %119 = load i32, i32* %8, align 4
  %120 = load i32, i32* %9, align 4
  %121 = icmp ne i32 %119, %120
  br i1 %121, label %26, label %122, !llvm.loop !13

122:                                              ; preds = %118
  store i32 0, i32* %4, align 4
  br label %123

123:                                              ; preds = %122, %108
  %124 = load i32, i32* %4, align 4
  ret i32 %124
}

declare i32 @_bpf_helper_ext_0002(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @set_filled(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %6 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %5, i32 0, i32 3
  %7 = load i8*, i8** %6, align 8
  %8 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %8, i32 noundef %9)
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds i8, i8* %7, i64 %11
  %13 = bitcast i8* %12 to i32*
  store i32 1, i32* %13, align 4
  ret void
}

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}

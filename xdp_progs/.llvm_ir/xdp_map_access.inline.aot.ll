; ModuleID = 'xdp_map_access.bpf.c'
source_filename = "xdp_map_access.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i32]*, i32*, i32*, [2 x i32]* }
%struct.anon.0 = type { [6 x i32]*, i32*, i64*, [512 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@__ctl_array = dso_local global [2 x i32] zeroinitializer, align 4
@__cntrs_array = dso_local global [512 x i64] zeroinitializer, align 16
@ctl_array_id = internal constant i64 17179869184, align 8
@cntrs_array_id = internal constant i64 21474836480, align 8
@_license = dso_local global [4 x i8] c"GPL\00", align 1
@ctl_array = dso_local global %struct.anon zeroinitializer, align 8
@cntrs_array = dso_local global %struct.anon.0 zeroinitializer, align 8

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
  %2 = alloca i8*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca %struct.xdp_md*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32*, align 8
  %15 = alloca i64*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %9, align 8
  %16 = load %struct.xdp_md*, %struct.xdp_md** %9, align 8
  %17 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %16, i32 0, i32 1
  %18 = load i64, i64* %17, align 8
  %19 = inttoptr i64 %18 to i8*
  store i8* %19, i8** %10, align 8
  %20 = load %struct.xdp_md*, %struct.xdp_md** %9, align 8
  %21 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %20, i32 0, i32 0
  %22 = load i64, i64* %21, align 8
  %23 = inttoptr i64 %22 to i8*
  store i8* %23, i8** %11, align 8
  store i32 0, i32* %12, align 4
  store i32 0, i32* %13, align 4
  %24 = bitcast i32* %12 to i8*
  store i64* @ctl_array_id, i64** %3, align 8
  store i8* %24, i8** %4, align 8
  %25 = load i64*, i64** %3, align 8
  %26 = load i64, i64* %25, align 8
  %27 = icmp eq i64 %26, 17179869184
  br i1 %27, label %28, label %35

28:                                               ; preds = %1
  %29 = load i8*, i8** %4, align 8
  %30 = bitcast i8* %29 to i32*
  %31 = load i32, i32* %30, align 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds [2 x i32], [2 x i32]* @__ctl_array, i64 0, i64 %32
  %34 = bitcast i32* %33 to i8*
  store i8* %34, i8** %2, align 8
  br label %51

35:                                               ; preds = %1
  %36 = load i64*, i64** %3, align 8
  %37 = load i64, i64* %36, align 8
  %38 = icmp eq i64 %37, 21474836480
  br i1 %38, label %39, label %46

39:                                               ; preds = %35
  %40 = load i8*, i8** %4, align 8
  %41 = bitcast i8* %40 to i32*
  %42 = load i32, i32* %41, align 4
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds [512 x i64], [512 x i64]* @__cntrs_array, i64 0, i64 %43
  %45 = bitcast i64* %44 to i8*
  store i8* %45, i8** %2, align 8
  br label %51

46:                                               ; preds = %35
  %47 = load i64*, i64** %3, align 8
  %48 = load i64, i64* %47, align 8
  %49 = load i8*, i8** %4, align 8
  %50 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %48, i8* noundef %49) #2
  store i8* %50, i8** %2, align 8
  br label %51

51:                                               ; preds = %28, %39, %46
  %52 = load i8*, i8** %2, align 8
  %53 = bitcast i8* %52 to i32*
  store i32* %53, i32** %14, align 8
  %54 = load i32*, i32** %14, align 8
  %55 = icmp ne i32* %54, null
  br i1 %55, label %56, label %60

56:                                               ; preds = %51
  %57 = load i32*, i32** %14, align 8
  %58 = load i32, i32* %57, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %61

60:                                               ; preds = %56, %51
  store i32 2, i32* %8, align 4
  br label %106

61:                                               ; preds = %56
  %62 = bitcast i32* %13 to i8*
  store i64* @cntrs_array_id, i64** %6, align 8
  store i8* %62, i8** %7, align 8
  %63 = load i64*, i64** %6, align 8
  %64 = load i64, i64* %63, align 8
  %65 = icmp eq i64 %64, 17179869184
  br i1 %65, label %66, label %73

66:                                               ; preds = %61
  %67 = load i8*, i8** %7, align 8
  %68 = bitcast i8* %67 to i32*
  %69 = load i32, i32* %68, align 4
  %70 = zext i32 %69 to i64
  %71 = getelementptr inbounds [2 x i32], [2 x i32]* @__ctl_array, i64 0, i64 %70
  %72 = bitcast i32* %71 to i8*
  store i8* %72, i8** %5, align 8
  br label %89

73:                                               ; preds = %61
  %74 = load i64*, i64** %6, align 8
  %75 = load i64, i64* %74, align 8
  %76 = icmp eq i64 %75, 21474836480
  br i1 %76, label %77, label %84

77:                                               ; preds = %73
  %78 = load i8*, i8** %7, align 8
  %79 = bitcast i8* %78 to i32*
  %80 = load i32, i32* %79, align 4
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds [512 x i64], [512 x i64]* @__cntrs_array, i64 0, i64 %81
  %83 = bitcast i64* %82 to i8*
  store i8* %83, i8** %5, align 8
  br label %89

84:                                               ; preds = %73
  %85 = load i64*, i64** %6, align 8
  %86 = load i64, i64* %85, align 8
  %87 = load i8*, i8** %7, align 8
  %88 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %86, i8* noundef %87) #2
  store i8* %88, i8** %5, align 8
  br label %89

89:                                               ; preds = %66, %77, %84
  %90 = load i8*, i8** %5, align 8
  %91 = bitcast i8* %90 to i64*
  store i64* %91, i64** %15, align 8
  %92 = load i64*, i64** %15, align 8
  %93 = icmp ne i64* %92, null
  br i1 %93, label %94, label %98

94:                                               ; preds = %89
  %95 = load i64*, i64** %15, align 8
  %96 = load i64, i64* %95, align 8
  %97 = add i64 %96, 1
  store i64 %97, i64* %95, align 8
  br label %98

98:                                               ; preds = %94, %89
  %99 = load i8*, i8** %11, align 8
  %100 = getelementptr i8, i8* %99, i64 14
  %101 = load i8*, i8** %10, align 8
  %102 = icmp ugt i8* %100, %101
  br i1 %102, label %103, label %104

103:                                              ; preds = %98
  store i32 1, i32* %8, align 4
  br label %106

104:                                              ; preds = %98
  %105 = load i8*, i8** %11, align 8
  call void @swap_src_dst_mac(i8* noundef %105)
  store i32 3, i32* %8, align 4
  br label %106

106:                                              ; preds = %104, %103, %60
  %107 = load i32, i32* %8, align 4
  ret i32 %107
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @bpf_map_lookup_elem__ctl_array(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = inttoptr i64 %3 to i32*
  %5 = load i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds [2 x i32], [2 x i32]* @__ctl_array, i64 0, i64 %6
  %8 = ptrtoint i32* %7 to i64
  ret i64 %8
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @bpf_map_lookup_elem__cntrs_array(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = inttoptr i64 %3 to i32*
  %5 = load i32, i32* %4, align 4
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds [2 x i32], [2 x i32]* @__ctl_array, i64 0, i64 %6
  %8 = ptrtoint i32* %7 to i64
  ret i64 %8
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

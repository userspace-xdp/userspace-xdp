; ModuleID = 'xdp_map_access.bpf.c'
source_filename = "xdp_map_access.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i32]*, i32*, i32*, [2 x i32]* }
%struct.anon.0 = type { [6 x i32]*, i32*, i64*, [512 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

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
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.xdp_md*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32*, align 8
  %13 = alloca i64*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %7, align 8
  %14 = load %struct.xdp_md*, %struct.xdp_md** %7, align 8
  %15 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %14, i32 0, i32 1
  %16 = load i64, i64* %15, align 8
  %17 = inttoptr i64 %16 to i8*
  store i8* %17, i8** %8, align 8
  %18 = load %struct.xdp_md*, %struct.xdp_md** %7, align 8
  %19 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %18, i32 0, i32 0
  %20 = load i64, i64* %19, align 8
  %21 = inttoptr i64 %20 to i8*
  store i8* %21, i8** %9, align 8
  store i32 0, i32* %10, align 4
  store i32 0, i32* %11, align 4
  %22 = bitcast i32* %10 to i8*
  store i64* @ctl_array_id, i64** %2, align 8
  store i8* %22, i8** %3, align 8
  %23 = load i64*, i64** %2, align 8
  %24 = load i64, i64* %23, align 8
  %25 = load i8*, i8** %3, align 8
  %26 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %24, i8* noundef %25) #2
  %27 = bitcast i8* %26 to i32*
  store i32* %27, i32** %12, align 8
  %28 = load i32*, i32** %12, align 8
  %29 = icmp ne i32* %28, null
  br i1 %29, label %30, label %34

30:                                               ; preds = %1
  %31 = load i32*, i32** %12, align 8
  %32 = load i32, i32* %31, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %35

34:                                               ; preds = %30, %1
  store i32 2, i32* %6, align 4
  br label %56

35:                                               ; preds = %30
  %36 = bitcast i32* %11 to i8*
  store i64* @cntrs_array_id, i64** %4, align 8
  store i8* %36, i8** %5, align 8
  %37 = load i64*, i64** %4, align 8
  %38 = load i64, i64* %37, align 8
  %39 = load i8*, i8** %5, align 8
  %40 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %38, i8* noundef %39) #2
  %41 = bitcast i8* %40 to i64*
  store i64* %41, i64** %13, align 8
  %42 = load i64*, i64** %13, align 8
  %43 = icmp ne i64* %42, null
  br i1 %43, label %44, label %48

44:                                               ; preds = %35
  %45 = load i64*, i64** %13, align 8
  %46 = load i64, i64* %45, align 8
  %47 = add i64 %46, 1
  store i64 %47, i64* %45, align 8
  br label %48

48:                                               ; preds = %44, %35
  %49 = load i8*, i8** %9, align 8
  %50 = getelementptr i8, i8* %49, i64 14
  %51 = load i8*, i8** %8, align 8
  %52 = icmp ugt i8* %50, %51
  br i1 %52, label %53, label %54

53:                                               ; preds = %48
  store i32 1, i32* %6, align 4
  br label %56

54:                                               ; preds = %48
  %55 = load i8*, i8** %9, align 8
  call void @swap_src_dst_mac(i8* noundef %55)
  store i32 3, i32* %6, align 4
  br label %56

56:                                               ; preds = %54, %53, %34
  %57 = load i32, i32* %6, align 4
  ret i32 %57
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

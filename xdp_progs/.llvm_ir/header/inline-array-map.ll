
@__ctl_array = dso_local global [2 x i32] zeroinitializer, align 4
@__cntrs_array = dso_local global [512 x i64] zeroinitializer, align 16

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

; Function Attrs: always_inline nounwind optnone uwtable
define internal i64 @bpf_map_lookup_elem__ctl_array(i64 noundef %0, i64 noundef %1) local_unnamed_addr {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = inttoptr i64 %5 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* @__ctl_array, i64 0, i64 %8
  %10 = bitcast i32* %9 to i8*
  %11 = ptrtoint i8* %10 to i64
  ret i64 %11
}

; Function Attrs: always_inline noinline nounwind optnone uwtable
define internal i64 @bpf_map_lookup_elem__cntrs_array(i64 noundef %0, i64 noundef %1) local_unnamed_addr {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = inttoptr i64 %5 to i32*
  %7 = load i32, i32* %6, align 4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* @__cntrs_array, i64 0, i64 %8
  %10 = bitcast i32* %9 to i8*
  %11 = ptrtoint i8* %10 to i64
  ret i64 %11
}

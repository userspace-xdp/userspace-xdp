; ModuleID = 'bpf-jit'
source_filename = "bpf-jit"

declare i64 @__lddw_helper_map_by_fd(i32)

declare i64 @__lddw_helper_map_val(i64)

declare i64 @_bpf_helper_ext_0000(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0002(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0003(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0004(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0005(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0007(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0008(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0009(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0010(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0011(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0012(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0013(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0014(i64, i64, i64, i64, i64)

define i64 @bpf_main(ptr %0, i64 %1) {
setupBlock:
  %r0 = alloca i64, align 8
  %r1 = alloca i64, align 8
  %r2 = alloca i64, align 8
  %r3 = alloca i64, align 8
  %r4 = alloca i64, align 8
  %r5 = alloca i64, align 8
  %r6 = alloca i64, align 8
  %r7 = alloca i64, align 8
  %r8 = alloca i64, align 8
  %r9 = alloca i64, align 8
  %r10 = alloca i64, align 8
  %stackBegin = alloca i64, i32 2058, align 8
  %stackEnd = getelementptr i64, ptr %stackBegin, i32 2048
  store ptr %stackEnd, ptr %r10, align 8
  store ptr %0, ptr %r1, align 8
  store i64 %1, ptr %r2, align 4
  %callStack = alloca ptr, i32 320, align 8
  %callItemCnt = alloca i64, align 8
  store i64 0, ptr %callItemCnt, align 4
  br label %bb_inst_0

bb_inst_0:                                        ; preds = %setupBlock
  %2 = load ptr, ptr %r1, align 8
  %3 = getelementptr i8, ptr %2, i64 8
  %4 = load i64, ptr %3, align 4
  store i64 %4, ptr %r7, align 4
  %5 = load ptr, ptr %r1, align 8
  %6 = getelementptr i8, ptr %5, i64 0
  %7 = load i64, ptr %6, align 4
  store i64 %7, ptr %r6, align 4
  %8 = load i64, ptr %r7, align 4
  store i64 %8, ptr %r1, align 4
  %9 = load i64, ptr %r1, align 4
  %10 = load i64, ptr %r6, align 4
  %11 = sub i64 %9, %10
  store i64 %11, ptr %r1, align 4
  %12 = load i64, ptr %r1, align 4
  %13 = trunc i64 %12 to i32
  %14 = load ptr, ptr %r10, align 8
  %15 = getelementptr i8, ptr %14, i64 -4
  store i32 %13, ptr %15, align 4
  store i64 0, ptr %r1, align 4
  %16 = load i64, ptr %r1, align 4
  %17 = trunc i64 %16 to i32
  %18 = load ptr, ptr %r10, align 8
  %19 = getelementptr i8, ptr %18, i64 -8
  store i32 %17, ptr %19, align 4
  %20 = load i64, ptr %r10, align 4
  store i64 %20, ptr %r2, align 4
  %21 = load i64, ptr %r2, align 4
  %22 = add i64 %21, -4
  store i64 %22, ptr %r2, align 4
  %23 = call i64 @__lddw_helper_map_by_fd(i32 4)
  store i64 %23, ptr %r1, align 4
  %24 = load i64, ptr %r1, align 4
  %25 = load i64, ptr %r2, align 4
  %26 = load i64, ptr %r3, align 4
  %27 = load i64, ptr %r4, align 4
  %28 = load i64, ptr %r5, align 4
  %29 = call i64 @_bpf_helper_ext_0001(i64 %24, i64 %25, i64 %26, i64 %27, i64 %28)
  store i64 %29, ptr %r0, align 4
  br label %bb_inst_12

bb_inst_12:                                       ; preds = %bb_inst_0
  %30 = load i64, ptr %r0, align 4
  %31 = icmp eq i64 %30, 0
  br i1 %31, label %bb_inst_16, label %bb_inst_13

bb_inst_13:                                       ; preds = %bb_inst_12
  %32 = load ptr, ptr %r0, align 8
  %33 = getelementptr i8, ptr %32, i64 0
  %34 = load i32, ptr %33, align 4
  %35 = zext i32 %34 to i64
  store i64 %35, ptr %r1, align 4
  %36 = load i64, ptr %r1, align 4
  %37 = add i64 %36, 1
  store i64 %37, ptr %r1, align 4
  %38 = load i64, ptr %r1, align 4
  %39 = trunc i64 %38 to i32
  %40 = load ptr, ptr %r10, align 8
  %41 = getelementptr i8, ptr %40, i64 -8
  store i32 %39, ptr %41, align 4
  br label %bb_inst_16

bb_inst_16:                                       ; preds = %bb_inst_13, %bb_inst_12
  %42 = load i64, ptr %r10, align 4
  store i64 %42, ptr %r2, align 4
  %43 = load i64, ptr %r2, align 4
  %44 = add i64 %43, -4
  store i64 %44, ptr %r2, align 4
  %45 = load i64, ptr %r10, align 4
  store i64 %45, ptr %r3, align 4
  %46 = load i64, ptr %r3, align 4
  %47 = add i64 %46, -8
  store i64 %47, ptr %r3, align 4
  %48 = call i64 @__lddw_helper_map_by_fd(i32 4)
  store i64 %48, ptr %r1, align 4
  store i64 0, ptr %r4, align 4
  %49 = load i64, ptr %r1, align 4
  %50 = load i64, ptr %r2, align 4
  %51 = load i64, ptr %r3, align 4
  %52 = load i64, ptr %r4, align 4
  %53 = load i64, ptr %r5, align 4
  %54 = call i64 @_bpf_helper_ext_0002(i64 %49, i64 %50, i64 %51, i64 %52, i64 %53)
  store i64 %54, ptr %r0, align 4
  br label %bb_inst_24

bb_inst_24:                                       ; preds = %bb_inst_16
  store i64 1, ptr %r0, align 4
  %55 = load i64, ptr %r6, align 4
  store i64 %55, ptr %r1, align 4
  %56 = load i64, ptr %r1, align 4
  %57 = add i64 %56, 14
  store i64 %57, ptr %r1, align 4
  %58 = load i64, ptr %r7, align 4
  %59 = load i64, ptr %r1, align 4
  %60 = icmp ugt i64 %59, %58
  br i1 %60, label %bb_inst_41, label %bb_inst_28

bb_inst_28:                                       ; preds = %bb_inst_24
  %61 = load ptr, ptr %r6, align 8
  %62 = getelementptr i8, ptr %61, i64 0
  %63 = load i16, ptr %62, align 2
  %64 = zext i16 %63 to i64
  store i64 %64, ptr %r1, align 4
  %65 = load ptr, ptr %r6, align 8
  %66 = getelementptr i8, ptr %65, i64 6
  %67 = load i16, ptr %66, align 2
  %68 = zext i16 %67 to i64
  store i64 %68, ptr %r2, align 4
  %69 = load i64, ptr %r2, align 4
  %70 = trunc i64 %69 to i16
  %71 = load ptr, ptr %r6, align 8
  %72 = getelementptr i8, ptr %71, i64 0
  store i16 %70, ptr %72, align 2
  %73 = load ptr, ptr %r6, align 8
  %74 = getelementptr i8, ptr %73, i64 8
  %75 = load i16, ptr %74, align 2
  %76 = zext i16 %75 to i64
  store i64 %76, ptr %r2, align 4
  %77 = load ptr, ptr %r6, align 8
  %78 = getelementptr i8, ptr %77, i64 2
  %79 = load i16, ptr %78, align 2
  %80 = zext i16 %79 to i64
  store i64 %80, ptr %r3, align 4
  %81 = load i64, ptr %r3, align 4
  %82 = trunc i64 %81 to i16
  %83 = load ptr, ptr %r6, align 8
  %84 = getelementptr i8, ptr %83, i64 8
  store i16 %82, ptr %84, align 2
  %85 = load i64, ptr %r2, align 4
  %86 = trunc i64 %85 to i16
  %87 = load ptr, ptr %r6, align 8
  %88 = getelementptr i8, ptr %87, i64 2
  store i16 %86, ptr %88, align 2
  %89 = load ptr, ptr %r6, align 8
  %90 = getelementptr i8, ptr %89, i64 10
  %91 = load i16, ptr %90, align 2
  %92 = zext i16 %91 to i64
  store i64 %92, ptr %r2, align 4
  %93 = load ptr, ptr %r6, align 8
  %94 = getelementptr i8, ptr %93, i64 4
  %95 = load i16, ptr %94, align 2
  %96 = zext i16 %95 to i64
  store i64 %96, ptr %r3, align 4
  %97 = load i64, ptr %r3, align 4
  %98 = trunc i64 %97 to i16
  %99 = load ptr, ptr %r6, align 8
  %100 = getelementptr i8, ptr %99, i64 10
  store i16 %98, ptr %100, align 2
  %101 = load i64, ptr %r1, align 4
  %102 = trunc i64 %101 to i16
  %103 = load ptr, ptr %r6, align 8
  %104 = getelementptr i8, ptr %103, i64 6
  store i16 %102, ptr %104, align 2
  %105 = load i64, ptr %r2, align 4
  %106 = trunc i64 %105 to i16
  %107 = load ptr, ptr %r6, align 8
  %108 = getelementptr i8, ptr %107, i64 4
  store i16 %106, ptr %108, align 2
  store i64 3, ptr %r0, align 4
  br label %bb_inst_41

bb_inst_41:                                       ; preds = %bb_inst_28, %bb_inst_24
  %109 = load i64, ptr %callItemCnt, align 4
  %110 = icmp eq i64 %109, 0
  br i1 %110, label %exitBlock, label %localFuncReturnBlock

exitBlock:                                        ; preds = %bb_inst_41
  %111 = load i64, ptr %r0, align 4
  ret i64 %111

localFuncReturnBlock:                             ; preds = %bb_inst_41
  %112 = load i64, ptr %callItemCnt, align 4
  %113 = sub i64 %112, 1
  %114 = getelementptr ptr, ptr %callStack, i64 %113
  %115 = load ptr, ptr %114, align 8
  %116 = sub i64 %112, 2
  %117 = getelementptr i64, ptr %callStack, i64 %116
  %118 = load i64, ptr %117, align 4
  store i64 %118, ptr %r6, align 4
  %119 = sub i64 %112, 3
  %120 = getelementptr i64, ptr %callStack, i64 %119
  %121 = load i64, ptr %120, align 4
  store i64 %121, ptr %r7, align 4
  %122 = sub i64 %112, 4
  %123 = getelementptr i64, ptr %callStack, i64 %122
  %124 = load i64, ptr %123, align 4
  store i64 %124, ptr %r8, align 4
  %125 = sub i64 %112, 5
  %126 = getelementptr i64, ptr %callStack, i64 %125
  %127 = load i64, ptr %126, align 4
  store i64 %127, ptr %r9, align 4
  %128 = sub i64 %112, 5
  store i64 %128, ptr %callItemCnt, align 4
  %129 = load i64, ptr %r10, align 4
  %130 = add i64 %129, 64
  store i64 %130, ptr %r10, align 4
  indirectbr ptr %115, []
}

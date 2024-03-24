; ModuleID = 'bpf-jit'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"


define i64 @bpf_main(ptr %0, i64 %1) #0 {
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
  %2 = load i64, ptr %r1, align 4
  %3 = load ptr, ptr %r10, align 8
  %4 = getelementptr i8, ptr %3, i64 -8
  store i64 %2, ptr %4, align 4
  store i64 0, ptr %r1, align 4
  %5 = load i64, ptr %r1, align 4
  %6 = trunc i64 %5 to i32
  %7 = load ptr, ptr %r10, align 8
  %8 = getelementptr i8, ptr %7, i64 -12
  store i32 %6, ptr %8, align 4
  br label %bb_inst_4

bb_inst_4:                                        ; preds = %bb_inst_25, %bb_inst_0
  %9 = load ptr, ptr %r10, align 8
  %10 = getelementptr i8, ptr %9, i64 -12
  %11 = load i32, ptr %10, align 4
  %12 = zext i32 %11 to i64
  store i64 %12, ptr %r1, align 4
  %13 = load i64, ptr %r1, align 4
  %14 = shl i64 %13, 32
  store i64 %14, ptr %r1, align 4
  %15 = load i64, ptr %r1, align 4
  %16 = ashr i64 %15, 32
  store i64 %16, ptr %r1, align 4
  %17 = load i64, ptr %r1, align 4
  %18 = icmp sgt i64 %17, 63
  br i1 %18, label %bb_inst_29, label %bb_inst_8

bb_inst_8:                                        ; preds = %bb_inst_4
  br label %bb_inst_9

bb_inst_9:                                        ; preds = %bb_inst_8
  %19 = load ptr, ptr %r10, align 8
  %20 = getelementptr i8, ptr %19, i64 -8
  %21 = load i64, ptr %20, align 4
  store i64 %21, ptr %r2, align 4
  %22 = load ptr, ptr %r10, align 8
  %23 = getelementptr i8, ptr %22, i64 -12
  %24 = load i32, ptr %23, align 4
  %25 = zext i32 %24 to i64
  store i64 %25, ptr %r4, align 4
  %26 = load i64, ptr %r4, align 4
  %27 = shl i64 %26, 32
  store i64 %27, ptr %r4, align 4
  %28 = load i64, ptr %r4, align 4
  store i64 %28, ptr %r3, align 4
  %29 = load i64, ptr %r3, align 4
  %30 = ashr i64 %29, 32
  store i64 %30, ptr %r3, align 4
  store i64 274877906944, ptr %r1, align 4
  %31 = load i64, ptr %r4, align 4
  %32 = load i64, ptr %r1, align 4
  %33 = add i64 %31, %32
  store i64 %33, ptr %r4, align 4
  %34 = load i64, ptr %r4, align 4
  %35 = ashr i64 %34, 32
  store i64 %35, ptr %r4, align 4
  %36 = load i64, ptr %r2, align 4
  store i64 %36, ptr %r1, align 4
  %37 = load i64, ptr %r1, align 4
  %38 = load i64, ptr %r4, align 4
  %39 = add i64 %37, %38
  store i64 %39, ptr %r1, align 4
  %40 = load ptr, ptr %r1, align 8
  %41 = getelementptr i8, ptr %40, i64 0
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i64
  store i64 %43, ptr %r1, align 4
  %44 = load i64, ptr %r1, align 4
  %45 = add i64 %44, 1
  store i64 %45, ptr %r1, align 4
  %46 = load i64, ptr %r2, align 4
  %47 = load i64, ptr %r3, align 4
  %48 = add i64 %46, %47
  store i64 %48, ptr %r2, align 4
  %49 = load i64, ptr %r1, align 4
  %50 = trunc i64 %49 to i8
  %51 = load ptr, ptr %r2, align 8
  %52 = getelementptr i8, ptr %51, i64 0
  store i8 %50, ptr %52, align 1
  br label %bb_inst_25

bb_inst_25:                                       ; preds = %bb_inst_9
  %53 = load ptr, ptr %r10, align 8
  %54 = getelementptr i8, ptr %53, i64 -12
  %55 = load i32, ptr %54, align 4
  %56 = zext i32 %55 to i64
  store i64 %56, ptr %r1, align 4
  %57 = load i64, ptr %r1, align 4
  %58 = add i64 %57, 1
  store i64 %58, ptr %r1, align 4
  %59 = load i64, ptr %r1, align 4
  %60 = trunc i64 %59 to i32
  %61 = load ptr, ptr %r10, align 8
  %62 = getelementptr i8, ptr %61, i64 -12
  store i32 %60, ptr %62, align 4
  br label %bb_inst_4

bb_inst_29:                                       ; preds = %bb_inst_4
  store i64 0, ptr %r0, align 4
  %63 = load i64, ptr %callItemCnt, align 4
  %64 = icmp eq i64 %63, 0
  br i1 %64, label %exitBlock, label %localFuncReturnBlock

exitBlock:                                        ; preds = %bb_inst_29
  %65 = load i64, ptr %r0, align 4
  ret i64 %65

localFuncReturnBlock:                             ; preds = %bb_inst_29
  %66 = load i64, ptr %callItemCnt, align 4
  %67 = sub i64 %66, 1
  %68 = getelementptr ptr, ptr %callStack, i64 %67
  %69 = load ptr, ptr %68, align 8
  %70 = sub i64 %66, 2
  %71 = getelementptr i64, ptr %callStack, i64 %70
  %72 = load i64, ptr %71, align 4
  store i64 %72, ptr %r6, align 4
  %73 = sub i64 %66, 3
  %74 = getelementptr i64, ptr %callStack, i64 %73
  %75 = load i64, ptr %74, align 4
  store i64 %75, ptr %r7, align 4
  %76 = sub i64 %66, 4
  %77 = getelementptr i64, ptr %callStack, i64 %76
  %78 = load i64, ptr %77, align 4
  store i64 %78, ptr %r8, align 4
  %79 = sub i64 %66, 5
  %80 = getelementptr i64, ptr %callStack, i64 %79
  %81 = load i64, ptr %80, align 4
  store i64 %81, ptr %r9, align 4
  %82 = sub i64 %66, 5
  store i64 %82, ptr %callItemCnt, align 4
  %83 = load i64, ptr %r10, align 4
  %84 = add i64 %83, 64
  store i64 %84, ptr %r10, align 4
  indirectbr ptr %69, []
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 15.0.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}

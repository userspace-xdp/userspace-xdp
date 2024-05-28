
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.event = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

; Function Attrs: nofree norecurse nosync nounwind readonly uwtable
define dso_local i64 @bpf_strncmp(i8* nocapture noundef readonly %0, i32 noundef %1, i8* nocapture noundef readonly %2) local_unnamed_addr #0 {
  switch i32 %1, label %38 [
    i32 4, label %4
    i32 0, label %56
  ]

4:                                                ; preds = %3
  %5 = bitcast i8* %0 to i32*
  %6 = load i32, i32* %5, align 4, !tbaa !5
  %7 = bitcast i8* %2 to i32*
  %8 = load i32, i32* %7, align 4, !tbaa !5
  %9 = icmp eq i32 %6, %8
  %10 = trunc i32 %6 to i8
  %11 = trunc i32 %8 to i8
  %12 = lshr i32 %6, 8
  %13 = trunc i32 %12 to i8
  %14 = lshr i32 %8, 8
  %15 = trunc i32 %14 to i8
  %16 = lshr i32 %6, 16
  %17 = trunc i32 %16 to i8
  %18 = lshr i32 %8, 16
  %19 = trunc i32 %18 to i8
  %20 = lshr i32 %6, 24
  %21 = trunc i32 %20 to i8
  %22 = lshr i32 %8, 24
  %23 = trunc i32 %22 to i8
  br i1 %9, label %56, label %24

24:                                               ; preds = %4
  %25 = icmp eq i8 %10, %11
  br i1 %25, label %26, label %32

26:                                               ; preds = %24
  %27 = icmp eq i8 %13, %15
  br i1 %27, label %28, label %32

28:                                               ; preds = %26
  %29 = icmp eq i8 %17, %19
  br i1 %29, label %30, label %32

30:                                               ; preds = %28
  %31 = icmp eq i8 %21, %23
  br i1 %31, label %56, label %32

32:                                               ; preds = %30, %28, %26, %24
  %33 = phi i8 [ %10, %24 ], [ %13, %26 ], [ %17, %28 ], [ %21, %30 ]
  %34 = phi i8 [ %11, %24 ], [ %15, %26 ], [ %19, %28 ], [ %23, %30 ]
  %35 = zext i8 %33 to i64
  %36 = zext i8 %34 to i64
  %37 = sub nsw i64 %35, %36
  br label %56

38:                                               ; preds = %3, %50
  %39 = phi i32 [ %42, %50 ], [ %1, %3 ]
  %40 = phi i8* [ %52, %50 ], [ %0, %3 ]
  %41 = phi i8* [ %53, %50 ], [ %2, %3 ]
  %42 = add i32 %39, -1
  %43 = load i8, i8* %40, align 1, !tbaa !9
  %44 = load i8, i8* %41, align 1, !tbaa !9
  %45 = icmp eq i8 %43, %44
  br i1 %45, label %50, label %46

46:                                               ; preds = %38
  %47 = zext i8 %43 to i64
  %48 = zext i8 %44 to i64
  %49 = sub nsw i64 %47, %48
  br label %56

50:                                               ; preds = %38
  %51 = icmp eq i8 %43, 0
  %52 = getelementptr inbounds i8, i8* %40, i64 1
  %53 = getelementptr inbounds i8, i8* %41, i64 1
  %54 = icmp eq i32 %42, 0
  %55 = select i1 %51, i1 true, i1 %54
  br i1 %55, label %56, label %38, !llvm.loop !10

56:                                               ; preds = %50, %3, %30, %4, %32, %46
  %57 = phi i64 [ %49, %46 ], [ %37, %32 ], [ 0, %4 ], [ 0, %30 ], [ 0, %3 ], [ 0, %50 ]
  ret i64 %57
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind uwtable willreturn
define dso_local i64 @bpf_xdp_load_bytes(%struct.xdp_md* nocapture noundef readonly %0, i32 noundef %1, i8* nocapture noundef writeonly %2, i32 noundef %3) local_unnamed_addr #2 {
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %6 = load i64, i64* %5, align 8, !tbaa !12
  %7 = zext i32 %1 to i64
  %8 = add i64 %6, %7
  %9 = inttoptr i64 %8 to i8*
  %10 = zext i32 %3 to i64
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 %9, i64 %10, i1 false)
  ret i64 0
}
; ModuleID = 'xdp_map_access.ll'
source_filename = "bpf-jit"

; Function Attrs: mustprogress nofree nosync nounwind willreturn
define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr #0 {
setupBlock:
  %2 = getelementptr i8, ptr %0, i64 4
  %3 = load i32, ptr %2, align 4
  %4 = zext i32 %3 to i64
  %5 = load i32, ptr %0, align 4
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, 14
  %8 = icmp ugt i64 %7, %4
  tail call void @llvm.assume(i1 %8)
  ret i64 2
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { mustprogress nofree nosync nounwind willreturn }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }

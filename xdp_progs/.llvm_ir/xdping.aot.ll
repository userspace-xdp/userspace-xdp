; ModuleID = 'xdping.bpf.c'
source_filename = "xdping.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.4 = type { [1 x i32]*, [256 x i32]*, i32*, %struct.pinginfo* }
%struct.pinginfo = type { i64, i16, i16, i32, [10 x i64] }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon }
%union.anon = type { i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { i32, i32 }

@_license = dso_local global [4 x i8] c"GPL\00", align 1
@ping_map = dso_local global %struct.anon.4 zeroinitializer, align 8
@__const.icmp_check.____fmt = private unnamed_addr constant [27 x i8] c"XDP_PASS for invalid icmp\0A\00", align 16

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
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca [3 x i16], align 2
  %9 = alloca i32, align 4
  %10 = alloca %struct.xdp_md*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca %struct.ethhdr*, align 8
  %15 = alloca %struct.icmphdr*, align 8
  %16 = alloca %struct.iphdr*, align 8
  %17 = alloca [27 x i8], align 16
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca %struct.xdp_md*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca %struct.ethhdr*, align 8
  %23 = alloca %struct.icmphdr*, align 8
  %24 = alloca %struct.iphdr*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %20, align 8
  %27 = load %struct.xdp_md*, %struct.xdp_md** %20, align 8
  %28 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %27, i32 0, i32 0
  %29 = load i64, i64* %28, align 8
  %30 = inttoptr i64 %29 to i8*
  store i8* %30, i8** %21, align 8
  %31 = load i8*, i8** %21, align 8
  %32 = bitcast i8* %31 to %struct.ethhdr*
  store %struct.ethhdr* %32, %struct.ethhdr** %22, align 8
  %33 = load %struct.xdp_md*, %struct.xdp_md** %20, align 8
  store %struct.xdp_md* %33, %struct.xdp_md** %10, align 8
  store i32 8, i32* %11, align 4
  %34 = load %struct.xdp_md*, %struct.xdp_md** %10, align 8
  %35 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %34, i32 0, i32 1
  %36 = load i64, i64* %35, align 8
  %37 = inttoptr i64 %36 to i8*
  store i8* %37, i8** %12, align 8
  %38 = load %struct.xdp_md*, %struct.xdp_md** %10, align 8
  %39 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %38, i32 0, i32 0
  %40 = load i64, i64* %39, align 8
  %41 = inttoptr i64 %40 to i8*
  store i8* %41, i8** %13, align 8
  %42 = load i8*, i8** %13, align 8
  %43 = bitcast i8* %42 to %struct.ethhdr*
  store %struct.ethhdr* %43, %struct.ethhdr** %14, align 8
  %44 = load i8*, i8** %13, align 8
  %45 = getelementptr i8, i8* %44, i64 14
  %46 = getelementptr i8, i8* %45, i64 20
  %47 = getelementptr i8, i8* %46, i64 64
  %48 = load i8*, i8** %12, align 8
  %49 = icmp ugt i8* %47, %48
  br i1 %49, label %50, label %51

50:                                               ; preds = %1
  store i32 2, i32* %9, align 4
  br label %83

51:                                               ; preds = %1
  %52 = load %struct.ethhdr*, %struct.ethhdr** %14, align 8
  %53 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %52, i32 0, i32 2
  %54 = load i16, i16* %53, align 2
  %55 = zext i16 %54 to i32
  %56 = icmp ne i32 %55, 8
  br i1 %56, label %57, label %58

57:                                               ; preds = %51
  store i32 2, i32* %9, align 4
  br label %83

58:                                               ; preds = %51
  %59 = load i8*, i8** %13, align 8
  %60 = getelementptr i8, i8* %59, i64 14
  %61 = bitcast i8* %60 to %struct.iphdr*
  store %struct.iphdr* %61, %struct.iphdr** %16, align 8
  %62 = load %struct.iphdr*, %struct.iphdr** %16, align 8
  %63 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %62, i32 0, i32 6
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp ne i32 %65, 1
  br i1 %66, label %67, label %68

67:                                               ; preds = %58
  store i32 2, i32* %9, align 4
  br label %83

68:                                               ; preds = %58
  %69 = load i8*, i8** %13, align 8
  %70 = getelementptr i8, i8* %69, i64 14
  %71 = getelementptr i8, i8* %70, i64 20
  %72 = bitcast i8* %71 to %struct.icmphdr*
  store %struct.icmphdr* %72, %struct.icmphdr** %15, align 8
  %73 = load %struct.icmphdr*, %struct.icmphdr** %15, align 8
  %74 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %73, i32 0, i32 0
  %75 = load i8*, i8** %12, align 8
  %76 = icmp ugt i8* %74, %75
  br i1 %76, label %77, label %82

77:                                               ; preds = %68
  %78 = bitcast [27 x i8]* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %78, i8* align 16 getelementptr inbounds ([27 x i8], [27 x i8]* @__const.icmp_check.____fmt, i32 0, i32 0), i64 27, i1 false) #3
  %79 = getelementptr inbounds [27 x i8], [27 x i8]* %17, i64 0, i64 0
  %80 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %79, i64 noundef 27) #3
  store i32 %80, i32* %18, align 4
  %81 = load i32, i32* %18, align 4
  store i32 2, i32* %9, align 4
  br label %83

82:                                               ; preds = %68
  store i32 3, i32* %9, align 4
  br label %83

83:                                               ; preds = %50, %57, %67, %77, %82
  %84 = load i32, i32* %9, align 4
  store i32 %84, i32* %26, align 4
  %85 = load i32, i32* %26, align 4
  %86 = icmp ne i32 %85, 3
  br i1 %86, label %87, label %89

87:                                               ; preds = %83
  %88 = load i32, i32* %26, align 4
  store i32 %88, i32* %19, align 4
  br label %180

89:                                               ; preds = %83
  %90 = load i8*, i8** %21, align 8
  %91 = getelementptr i8, i8* %90, i64 14
  %92 = bitcast i8* %91 to %struct.iphdr*
  store %struct.iphdr* %92, %struct.iphdr** %24, align 8
  %93 = load i8*, i8** %21, align 8
  %94 = getelementptr i8, i8* %93, i64 14
  %95 = getelementptr i8, i8* %94, i64 20
  %96 = bitcast i8* %95 to %struct.icmphdr*
  store %struct.icmphdr* %96, %struct.icmphdr** %23, align 8
  %97 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %98 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %97, i32 0, i32 8
  %99 = bitcast %union.anon.1* %98 to %struct.anon.2*
  %100 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %99, i32 0, i32 0
  %101 = load i32, i32* %100, align 4
  store i32 %101, i32* %25, align 4
  %102 = load i8*, i8** %21, align 8
  store i8* %102, i8** %6, align 8
  %103 = load i8*, i8** %6, align 8
  %104 = bitcast i8* %103 to i16*
  store i16* %104, i16** %7, align 8
  %105 = load i16*, i16** %7, align 8
  %106 = load i16, i16* %105, align 2
  %107 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 0
  store i16 %106, i16* %107, align 2
  %108 = load i16*, i16** %7, align 8
  %109 = getelementptr inbounds i16, i16* %108, i64 1
  %110 = load i16, i16* %109, align 2
  %111 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 1
  store i16 %110, i16* %111, align 2
  %112 = load i16*, i16** %7, align 8
  %113 = getelementptr inbounds i16, i16* %112, i64 2
  %114 = load i16, i16* %113, align 2
  %115 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 2
  store i16 %114, i16* %115, align 2
  %116 = load i16*, i16** %7, align 8
  %117 = getelementptr inbounds i16, i16* %116, i64 3
  %118 = load i16, i16* %117, align 2
  %119 = load i16*, i16** %7, align 8
  store i16 %118, i16* %119, align 2
  %120 = load i16*, i16** %7, align 8
  %121 = getelementptr inbounds i16, i16* %120, i64 4
  %122 = load i16, i16* %121, align 2
  %123 = load i16*, i16** %7, align 8
  %124 = getelementptr inbounds i16, i16* %123, i64 1
  store i16 %122, i16* %124, align 2
  %125 = load i16*, i16** %7, align 8
  %126 = getelementptr inbounds i16, i16* %125, i64 5
  %127 = load i16, i16* %126, align 2
  %128 = load i16*, i16** %7, align 8
  %129 = getelementptr inbounds i16, i16* %128, i64 2
  store i16 %127, i16* %129, align 2
  %130 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 0
  %131 = load i16, i16* %130, align 2
  %132 = load i16*, i16** %7, align 8
  %133 = getelementptr inbounds i16, i16* %132, i64 3
  store i16 %131, i16* %133, align 2
  %134 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 1
  %135 = load i16, i16* %134, align 2
  %136 = load i16*, i16** %7, align 8
  %137 = getelementptr inbounds i16, i16* %136, i64 4
  store i16 %135, i16* %137, align 2
  %138 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 2
  %139 = load i16, i16* %138, align 2
  %140 = load i16*, i16** %7, align 8
  %141 = getelementptr inbounds i16, i16* %140, i64 5
  store i16 %139, i16* %141, align 2
  %142 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %143 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %142, i32 0, i32 8
  %144 = bitcast %union.anon.1* %143 to %struct.anon.2*
  %145 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %144, i32 0, i32 1
  %146 = load i32, i32* %145, align 4
  %147 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %148 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %147, i32 0, i32 8
  %149 = bitcast %union.anon.1* %148 to %struct.anon.2*
  %150 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %149, i32 0, i32 0
  store i32 %146, i32* %150, align 4
  %151 = load i32, i32* %25, align 4
  %152 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %153 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %152, i32 0, i32 8
  %154 = bitcast %union.anon.1* %153 to %struct.anon.2*
  %155 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %154, i32 0, i32 1
  store i32 %151, i32* %155, align 4
  %156 = load %struct.icmphdr*, %struct.icmphdr** %23, align 8
  %157 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %156, i32 0, i32 0
  store i8 0, i8* %157, align 4
  %158 = load %struct.icmphdr*, %struct.icmphdr** %23, align 8
  %159 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %158, i32 0, i32 2
  store i16 0, i16* %159, align 2
  %160 = load %struct.icmphdr*, %struct.icmphdr** %23, align 8
  %161 = bitcast %struct.icmphdr* %160 to i8*
  store i8* %161, i8** %3, align 8
  store i32 64, i32* %4, align 4
  %162 = load i8*, i8** %3, align 8
  %163 = load i32, i32* %4, align 4
  %164 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %162, i32 noundef %163, i32 noundef 0) #3
  store i32 %164, i32* %5, align 4
  %165 = load i32, i32* %5, align 4
  store i32 %165, i32* %2, align 4
  %166 = load i32, i32* %2, align 4
  %167 = and i32 %166, 65535
  %168 = load i32, i32* %2, align 4
  %169 = lshr i32 %168, 16
  %170 = add i32 %167, %169
  store i32 %170, i32* %2, align 4
  %171 = load i32, i32* %2, align 4
  %172 = and i32 %171, 65535
  %173 = load i32, i32* %2, align 4
  %174 = lshr i32 %173, 16
  %175 = add i32 %172, %174
  %176 = xor i32 %175, -1
  %177 = trunc i32 %176 to i16
  %178 = load %struct.icmphdr*, %struct.icmphdr** %23, align 8
  %179 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %178, i32 0, i32 2
  store i16 %177, i16* %179, align 2
  store i32 3, i32* %19, align 4
  br label %180

180:                                              ; preds = %89, %87
  %181 = load i32, i32* %19, align 4
  ret i32 %181
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @_bpf_helper_ext_0006(...) #2

declare i32 @_bpf_helper_ext_0028(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

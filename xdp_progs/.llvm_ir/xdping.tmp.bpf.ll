; ModuleID = 'xdping.bpf.c'
source_filename = "xdping.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.4 = type { [1 x i32]*, [256 x i32]*, i32*, %struct.pinginfo* }
%struct.pinginfo = type { i64, i16, i16, i32, [10 x i64] }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon }
%union.anon = type { i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { i32, i32 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@ping_map = dso_local global %struct.anon.4 zeroinitializer, section ".maps", align 8
@__const.icmp_check.____fmt = private unnamed_addr constant [27 x i8] c"XDP_PASS for invalid icmp\0A\00", align 1
@bpf_trace_printk = internal global i64 (i8*, i32, ...)* inttoptr (i64 6 to i64 (i8*, i32, ...)*), align 8
@bpf_csum_diff = internal global i64 (i32*, i32, i32*, i32, i32)* inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*), align 8
@llvm.compiler.used = appending global [3 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.4* @ping_map to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
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
  %17 = alloca [27 x i8], align 1
  %18 = alloca i64, align 8
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
  br label %84

51:                                               ; preds = %1
  %52 = load %struct.ethhdr*, %struct.ethhdr** %14, align 8
  %53 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %52, i32 0, i32 2
  %54 = load i16, i16* %53, align 2
  %55 = zext i16 %54 to i32
  %56 = icmp ne i32 %55, 8
  br i1 %56, label %57, label %58

57:                                               ; preds = %51
  store i32 2, i32* %9, align 4
  br label %84

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
  br label %84

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
  br i1 %76, label %77, label %83

77:                                               ; preds = %68
  %78 = bitcast [27 x i8]* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %78, i8* align 1 getelementptr inbounds ([27 x i8], [27 x i8]* @__const.icmp_check.____fmt, i32 0, i32 0), i64 27, i1 false) #2
  %79 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %80 = getelementptr inbounds [27 x i8], [27 x i8]* %17, i64 0, i64 0
  %81 = call i64 (i8*, i32, ...) %79(i8* noundef %80, i32 noundef 27) #2
  store i64 %81, i64* %18, align 8
  %82 = load i64, i64* %18, align 8
  store i32 2, i32* %9, align 4
  br label %84

83:                                               ; preds = %68
  store i32 3, i32* %9, align 4
  br label %84

84:                                               ; preds = %50, %57, %67, %77, %83
  %85 = load i32, i32* %9, align 4
  store i32 %85, i32* %26, align 4
  %86 = load i32, i32* %26, align 4
  %87 = icmp ne i32 %86, 3
  br i1 %87, label %88, label %90

88:                                               ; preds = %84
  %89 = load i32, i32* %26, align 4
  store i32 %89, i32* %19, align 4
  br label %184

90:                                               ; preds = %84
  %91 = load i8*, i8** %21, align 8
  %92 = getelementptr i8, i8* %91, i64 14
  %93 = bitcast i8* %92 to %struct.iphdr*
  store %struct.iphdr* %93, %struct.iphdr** %24, align 8
  %94 = load i8*, i8** %21, align 8
  %95 = getelementptr i8, i8* %94, i64 14
  %96 = getelementptr i8, i8* %95, i64 20
  %97 = bitcast i8* %96 to %struct.icmphdr*
  store %struct.icmphdr* %97, %struct.icmphdr** %23, align 8
  %98 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %99 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %98, i32 0, i32 8
  %100 = bitcast %union.anon.1* %99 to %struct.anon.2*
  %101 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %100, i32 0, i32 0
  %102 = load i32, i32* %101, align 4
  store i32 %102, i32* %25, align 4
  %103 = load i8*, i8** %21, align 8
  store i8* %103, i8** %6, align 8
  %104 = load i8*, i8** %6, align 8
  %105 = bitcast i8* %104 to i16*
  store i16* %105, i16** %7, align 8
  %106 = load i16*, i16** %7, align 8
  %107 = load i16, i16* %106, align 2
  %108 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 0
  store i16 %107, i16* %108, align 2
  %109 = load i16*, i16** %7, align 8
  %110 = getelementptr inbounds i16, i16* %109, i64 1
  %111 = load i16, i16* %110, align 2
  %112 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 1
  store i16 %111, i16* %112, align 2
  %113 = load i16*, i16** %7, align 8
  %114 = getelementptr inbounds i16, i16* %113, i64 2
  %115 = load i16, i16* %114, align 2
  %116 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 2
  store i16 %115, i16* %116, align 2
  %117 = load i16*, i16** %7, align 8
  %118 = getelementptr inbounds i16, i16* %117, i64 3
  %119 = load i16, i16* %118, align 2
  %120 = load i16*, i16** %7, align 8
  store i16 %119, i16* %120, align 2
  %121 = load i16*, i16** %7, align 8
  %122 = getelementptr inbounds i16, i16* %121, i64 4
  %123 = load i16, i16* %122, align 2
  %124 = load i16*, i16** %7, align 8
  %125 = getelementptr inbounds i16, i16* %124, i64 1
  store i16 %123, i16* %125, align 2
  %126 = load i16*, i16** %7, align 8
  %127 = getelementptr inbounds i16, i16* %126, i64 5
  %128 = load i16, i16* %127, align 2
  %129 = load i16*, i16** %7, align 8
  %130 = getelementptr inbounds i16, i16* %129, i64 2
  store i16 %128, i16* %130, align 2
  %131 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 0
  %132 = load i16, i16* %131, align 2
  %133 = load i16*, i16** %7, align 8
  %134 = getelementptr inbounds i16, i16* %133, i64 3
  store i16 %132, i16* %134, align 2
  %135 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 1
  %136 = load i16, i16* %135, align 2
  %137 = load i16*, i16** %7, align 8
  %138 = getelementptr inbounds i16, i16* %137, i64 4
  store i16 %136, i16* %138, align 2
  %139 = getelementptr inbounds [3 x i16], [3 x i16]* %8, i64 0, i64 2
  %140 = load i16, i16* %139, align 2
  %141 = load i16*, i16** %7, align 8
  %142 = getelementptr inbounds i16, i16* %141, i64 5
  store i16 %140, i16* %142, align 2
  %143 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %144 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %143, i32 0, i32 8
  %145 = bitcast %union.anon.1* %144 to %struct.anon.2*
  %146 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %145, i32 0, i32 1
  %147 = load i32, i32* %146, align 4
  %148 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %149 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %148, i32 0, i32 8
  %150 = bitcast %union.anon.1* %149 to %struct.anon.2*
  %151 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %150, i32 0, i32 0
  store i32 %147, i32* %151, align 4
  %152 = load i32, i32* %25, align 4
  %153 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %154 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %153, i32 0, i32 8
  %155 = bitcast %union.anon.1* %154 to %struct.anon.2*
  %156 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %155, i32 0, i32 1
  store i32 %152, i32* %156, align 4
  %157 = load %struct.icmphdr*, %struct.icmphdr** %23, align 8
  %158 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %157, i32 0, i32 0
  store i8 0, i8* %158, align 4
  %159 = load %struct.icmphdr*, %struct.icmphdr** %23, align 8
  %160 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %159, i32 0, i32 2
  store i16 0, i16* %160, align 2
  %161 = load %struct.icmphdr*, %struct.icmphdr** %23, align 8
  %162 = bitcast %struct.icmphdr* %161 to i8*
  store i8* %162, i8** %3, align 8
  store i32 64, i32* %4, align 4
  %163 = load i64 (i32*, i32, i32*, i32, i32)*, i64 (i32*, i32, i32*, i32, i32)** @bpf_csum_diff, align 8
  %164 = load i8*, i8** %3, align 8
  %165 = bitcast i8* %164 to i32*
  %166 = load i32, i32* %4, align 4
  %167 = call i64 %163(i32* noundef null, i32 noundef 0, i32* noundef %165, i32 noundef %166, i32 noundef 0) #2
  %168 = trunc i64 %167 to i32
  store i32 %168, i32* %5, align 4
  %169 = load i32, i32* %5, align 4
  store i32 %169, i32* %2, align 4
  %170 = load i32, i32* %2, align 4
  %171 = and i32 %170, 65535
  %172 = load i32, i32* %2, align 4
  %173 = lshr i32 %172, 16
  %174 = add i32 %171, %173
  store i32 %174, i32* %2, align 4
  %175 = load i32, i32* %2, align 4
  %176 = and i32 %175, 65535
  %177 = load i32, i32* %2, align 4
  %178 = lshr i32 %177, 16
  %179 = add i32 %176, %178
  %180 = xor i32 %179, -1
  %181 = trunc i32 %180 to i16
  %182 = load %struct.icmphdr*, %struct.icmphdr** %23, align 8
  %183 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %182, i32 0, i32 2
  store i16 %181, i16* %183, align 2
  store i32 3, i32* %19, align 4
  br label %184

184:                                              ; preds = %90, %88
  %185 = load i32, i32* %19, align 4
  ret i32 %185
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

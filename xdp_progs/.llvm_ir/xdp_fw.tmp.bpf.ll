; ModuleID = 'xdp_fw.bpf.c'
source_filename = "xdp_fw.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.1 = type { [1 x i32]*, %struct.flow_ctx_table_key*, %struct.flow_ctx_table_leaf*, [1024 x i32]* }
%struct.flow_ctx_table_key = type { i16, i16, i16, i32, i32 }
%struct.flow_ctx_table_leaf = type { i8, i16 }
%struct.anon.2 = type { [14 x i32]*, i32*, i32*, [10 x i32]* }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.udphdr = type { i16, i16, i16, i16 }

@bpf_map_lookup_elem = internal global i8* (i8*, i8*)* inttoptr (i64 1 to i8* (i8*, i8*)*), align 8
@flow_ctx_table = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8
@bpf_redirect_map = internal global i64 (i8*, i64, i64)* inttoptr (i64 51 to i64 (i8*, i64, i64)*), align 8
@tx_port = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8
@bpf_map_update_elem = internal global i64 (i8*, i8*, i8*, i64)* inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*), align 8
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [4 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.2* @tx_port to i8*), i8* bitcast (%struct.anon.1* @flow_ctx_table to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca %struct.xdp_md*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.flow_ctx_table_leaf, align 2
  %7 = alloca %struct.flow_ctx_table_key, align 4
  %8 = alloca %struct.flow_ctx_table_leaf*, align 8
  %9 = alloca %struct.ethhdr*, align 8
  %10 = alloca %struct.iphdr*, align 8
  %11 = alloca %struct.udphdr*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i8, align 1
  %15 = alloca i32, align 4
  %16 = alloca i8, align 1
  %17 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %3, align 8
  %18 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %19 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 4
  %21 = zext i32 %20 to i64
  %22 = inttoptr i64 %21 to i8*
  store i8* %22, i8** %4, align 8
  %23 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %24 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %23, i32 0, i32 0
  %25 = load i32, i32* %24, align 4
  %26 = zext i32 %25 to i64
  %27 = inttoptr i64 %26 to i8*
  store i8* %27, i8** %5, align 8
  %28 = bitcast %struct.flow_ctx_table_leaf* %6 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %28, i8 0, i64 4, i1 false)
  %29 = bitcast %struct.flow_ctx_table_key* %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %29, i8 0, i64 16, i1 false)
  store i64 0, i64* %13, align 8
  store i8 0, i8* %14, align 1
  store i32 2, i32* %15, align 4
  store i8 0, i8* %16, align 1
  store i32 0, i32* %17, align 4
  br label %30

30:                                               ; preds = %31, %1
  br i1 false, label %31, label %32

31:                                               ; preds = %30
  br label %30

32:                                               ; preds = %30
  br label %33

33:                                               ; preds = %32
  %34 = load i8*, i8** %5, align 8
  %35 = bitcast i8* %34 to %struct.ethhdr*
  store %struct.ethhdr* %35, %struct.ethhdr** %9, align 8
  store i64 14, i64* %13, align 8
  %36 = load i8*, i8** %5, align 8
  %37 = load i64, i64* %13, align 8
  %38 = getelementptr i8, i8* %36, i64 %37
  %39 = load i8*, i8** %4, align 8
  %40 = icmp ugt i8* %38, %39
  br i1 %40, label %41, label %42

41:                                               ; preds = %33
  br label %186

42:                                               ; preds = %33
  %43 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %44 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %43, i32 0, i32 3
  %45 = load i32, i32* %44, align 4
  store i32 %45, i32* %12, align 4
  br label %46

46:                                               ; preds = %47, %42
  br i1 false, label %47, label %48

47:                                               ; preds = %46
  br label %46

48:                                               ; preds = %46
  %49 = load %struct.ethhdr*, %struct.ethhdr** %9, align 8
  %50 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %49, i32 0, i32 2
  %51 = load i16, i16* %50, align 2
  %52 = call i1 @llvm.is.constant.i16(i16 %51)
  br i1 %52, label %53, label %71

53:                                               ; preds = %48
  %54 = load %struct.ethhdr*, %struct.ethhdr** %9, align 8
  %55 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %54, i32 0, i32 2
  %56 = load i16, i16* %55, align 2
  %57 = zext i16 %56 to i32
  %58 = shl i32 %57, 8
  %59 = ashr i32 %58, 8
  %60 = shl i32 %59, 8
  %61 = load %struct.ethhdr*, %struct.ethhdr** %9, align 8
  %62 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %61, i32 0, i32 2
  %63 = load i16, i16* %62, align 2
  %64 = zext i16 %63 to i32
  %65 = shl i32 %64, 0
  %66 = ashr i32 %65, 8
  %67 = shl i32 %66, 0
  %68 = or i32 %60, %67
  %69 = trunc i32 %68 to i16
  %70 = zext i16 %69 to i32
  br label %77

71:                                               ; preds = %48
  %72 = load %struct.ethhdr*, %struct.ethhdr** %9, align 8
  %73 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %72, i32 0, i32 2
  %74 = load i16, i16* %73, align 2
  %75 = call i16 @llvm.bswap.i16(i16 %74)
  %76 = zext i16 %75 to i32
  br label %77

77:                                               ; preds = %71, %53
  %78 = phi i32 [ %70, %53 ], [ %76, %71 ]
  switch i32 %78, label %80 [
    i32 2048, label %79
  ]

79:                                               ; preds = %77
  br label %81

80:                                               ; preds = %77
  br label %186

81:                                               ; preds = %79
  br label %82

82:                                               ; preds = %83, %81
  br i1 false, label %83, label %84

83:                                               ; preds = %82
  br label %82

84:                                               ; preds = %82
  %85 = load i8*, i8** %5, align 8
  %86 = load i64, i64* %13, align 8
  %87 = getelementptr i8, i8* %85, i64 %86
  %88 = bitcast i8* %87 to %struct.iphdr*
  store %struct.iphdr* %88, %struct.iphdr** %10, align 8
  %89 = load i64, i64* %13, align 8
  %90 = add i64 %89, 20
  store i64 %90, i64* %13, align 8
  %91 = load i8*, i8** %5, align 8
  %92 = load i64, i64* %13, align 8
  %93 = getelementptr i8, i8* %91, i64 %92
  %94 = load i8*, i8** %4, align 8
  %95 = icmp ugt i8* %93, %94
  br i1 %95, label %96, label %97

96:                                               ; preds = %84
  br label %186

97:                                               ; preds = %84
  %98 = load %struct.iphdr*, %struct.iphdr** %10, align 8
  %99 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %98, i32 0, i32 6
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  switch i32 %101, label %104 [
    i32 6, label %102
    i32 17, label %103
  ]

102:                                              ; preds = %97
  br label %105

103:                                              ; preds = %97
  br label %105

104:                                              ; preds = %97
  br label %186

105:                                              ; preds = %103, %102
  br label %106

106:                                              ; preds = %107, %105
  br i1 false, label %107, label %108

107:                                              ; preds = %106
  br label %106

108:                                              ; preds = %106
  %109 = load i8*, i8** %5, align 8
  %110 = load i64, i64* %13, align 8
  %111 = getelementptr i8, i8* %109, i64 %110
  %112 = bitcast i8* %111 to %struct.udphdr*
  store %struct.udphdr* %112, %struct.udphdr** %11, align 8
  %113 = load i64, i64* %13, align 8
  %114 = add i64 %113, 8
  store i64 %114, i64* %13, align 8
  %115 = load i8*, i8** %5, align 8
  %116 = load i64, i64* %13, align 8
  %117 = getelementptr i8, i8* %115, i64 %116
  %118 = load i8*, i8** %4, align 8
  %119 = icmp ugt i8* %117, %118
  br i1 %119, label %120, label %121

120:                                              ; preds = %108
  br label %186

121:                                              ; preds = %108
  br label %122

122:                                              ; preds = %123, %121
  br i1 false, label %123, label %124

123:                                              ; preds = %122
  br label %122

124:                                              ; preds = %122
  %125 = load %struct.iphdr*, %struct.iphdr** %10, align 8
  %126 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %125, i32 0, i32 6
  %127 = load i8, i8* %126, align 1
  %128 = zext i8 %127 to i16
  %129 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %7, i32 0, i32 0
  store i16 %128, i16* %129, align 4
  %130 = load %struct.iphdr*, %struct.iphdr** %10, align 8
  %131 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %130, i32 0, i32 8
  %132 = bitcast %union.anon* %131 to %struct.anon*
  %133 = getelementptr inbounds %struct.anon, %struct.anon* %132, i32 0, i32 0
  %134 = load i32, i32* %133, align 4
  %135 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %7, i32 0, i32 3
  store i32 %134, i32* %135, align 4
  %136 = load %struct.iphdr*, %struct.iphdr** %10, align 8
  %137 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %136, i32 0, i32 8
  %138 = bitcast %union.anon* %137 to %struct.anon*
  %139 = getelementptr inbounds %struct.anon, %struct.anon* %138, i32 0, i32 1
  %140 = load i32, i32* %139, align 4
  %141 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %7, i32 0, i32 4
  store i32 %140, i32* %141, align 4
  %142 = load %struct.udphdr*, %struct.udphdr** %11, align 8
  %143 = getelementptr inbounds %struct.udphdr, %struct.udphdr* %142, i32 0, i32 0
  %144 = load i16, i16* %143, align 2
  %145 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %7, i32 0, i32 1
  store i16 %144, i16* %145, align 2
  %146 = load %struct.udphdr*, %struct.udphdr** %11, align 8
  %147 = getelementptr inbounds %struct.udphdr, %struct.udphdr* %146, i32 0, i32 1
  %148 = load i16, i16* %147, align 2
  %149 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %7, i32 0, i32 2
  store i16 %148, i16* %149, align 4
  call void @biflow(%struct.flow_ctx_table_key* noundef %7)
  %150 = load i32, i32* %12, align 4
  %151 = icmp eq i32 %150, 7
  br i1 %151, label %152, label %168

152:                                              ; preds = %124
  %153 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %154 = bitcast %struct.flow_ctx_table_key* %7 to i8*
  %155 = call i8* %153(i8* noundef bitcast (%struct.anon.1* @flow_ctx_table to i8*), i8* noundef %154)
  %156 = bitcast i8* %155 to %struct.flow_ctx_table_leaf*
  store %struct.flow_ctx_table_leaf* %156, %struct.flow_ctx_table_leaf** %8, align 8
  %157 = load %struct.flow_ctx_table_leaf*, %struct.flow_ctx_table_leaf** %8, align 8
  %158 = icmp ne %struct.flow_ctx_table_leaf* %157, null
  br i1 %158, label %159, label %167

159:                                              ; preds = %152
  %160 = load i64 (i8*, i64, i64)*, i64 (i8*, i64, i64)** @bpf_redirect_map, align 8
  %161 = load %struct.flow_ctx_table_leaf*, %struct.flow_ctx_table_leaf** %8, align 8
  %162 = getelementptr inbounds %struct.flow_ctx_table_leaf, %struct.flow_ctx_table_leaf* %161, i32 0, i32 0
  %163 = load i8, i8* %162, align 2
  %164 = zext i8 %163 to i64
  %165 = call i64 %160(i8* noundef bitcast (%struct.anon.2* @tx_port to i8*), i64 noundef %164, i64 noundef 0)
  %166 = trunc i64 %165 to i32
  store i32 %166, i32* %2, align 4
  br label %187

167:                                              ; preds = %152
  store i32 2, i32* %2, align 4
  br label %187

168:                                              ; preds = %124
  %169 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %170 = bitcast %struct.flow_ctx_table_key* %7 to i8*
  %171 = call i8* %169(i8* noundef bitcast (%struct.anon.1* @flow_ctx_table to i8*), i8* noundef %170)
  %172 = bitcast i8* %171 to %struct.flow_ctx_table_leaf*
  store %struct.flow_ctx_table_leaf* %172, %struct.flow_ctx_table_leaf** %8, align 8
  %173 = load %struct.flow_ctx_table_leaf*, %struct.flow_ctx_table_leaf** %8, align 8
  %174 = icmp ne %struct.flow_ctx_table_leaf* %173, null
  br i1 %174, label %182, label %175

175:                                              ; preds = %168
  %176 = getelementptr inbounds %struct.flow_ctx_table_leaf, %struct.flow_ctx_table_leaf* %6, i32 0, i32 1
  store i16 7, i16* %176, align 2
  %177 = getelementptr inbounds %struct.flow_ctx_table_leaf, %struct.flow_ctx_table_leaf* %6, i32 0, i32 0
  store i8 6, i8* %177, align 2
  %178 = load i64 (i8*, i8*, i8*, i64)*, i64 (i8*, i8*, i8*, i64)** @bpf_map_update_elem, align 8
  %179 = bitcast %struct.flow_ctx_table_key* %7 to i8*
  %180 = bitcast %struct.flow_ctx_table_leaf* %6 to i8*
  %181 = call i64 %178(i8* noundef bitcast (%struct.anon.1* @flow_ctx_table to i8*), i8* noundef %179, i8* noundef %180, i64 noundef 0)
  br label %182

182:                                              ; preds = %175, %168
  %183 = load i64 (i8*, i64, i64)*, i64 (i8*, i64, i64)** @bpf_redirect_map, align 8
  %184 = call i64 %183(i8* noundef bitcast (%struct.anon.2* @tx_port to i8*), i64 noundef 7, i64 noundef 0)
  %185 = trunc i64 %184 to i32
  store i32 %185, i32* %2, align 4
  br label %187

186:                                              ; preds = %120, %104, %96, %80, %41
  store i32 2, i32* %2, align 4
  br label %187

187:                                              ; preds = %186, %182, %167, %159
  %188 = load i32, i32* %2, align 4
  ret i32 %188
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i16(i16) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @biflow(%struct.flow_ctx_table_key* noundef %0) #0 {
  %2 = alloca %struct.flow_ctx_table_key*, align 8
  %3 = alloca i32, align 4
  store %struct.flow_ctx_table_key* %0, %struct.flow_ctx_table_key** %2, align 8
  %4 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %5 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %4, i32 0, i32 3
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %8 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %7, i32 0, i32 4
  %9 = load i32, i32* %8, align 4
  %10 = icmp ugt i32 %6, %9
  br i1 %10, label %11, label %23

11:                                               ; preds = %1
  %12 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %13 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %12, i32 0, i32 3
  %14 = load i32, i32* %13, align 4
  store i32 %14, i32* %3, align 4
  %15 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %16 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %15, i32 0, i32 4
  %17 = load i32, i32* %16, align 4
  %18 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %19 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %18, i32 0, i32 3
  store i32 %17, i32* %19, align 4
  %20 = load i32, i32* %3, align 4
  %21 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %22 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %21, i32 0, i32 4
  store i32 %20, i32* %22, align 4
  br label %23

23:                                               ; preds = %11, %1
  %24 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %25 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %24, i32 0, i32 1
  %26 = load i16, i16* %25, align 2
  %27 = zext i16 %26 to i32
  %28 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %29 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %28, i32 0, i32 2
  %30 = load i16, i16* %29, align 4
  %31 = zext i16 %30 to i32
  %32 = icmp sgt i32 %27, %31
  br i1 %32, label %33, label %47

33:                                               ; preds = %23
  %34 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %35 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %34, i32 0, i32 1
  %36 = load i16, i16* %35, align 2
  %37 = zext i16 %36 to i32
  store i32 %37, i32* %3, align 4
  %38 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %39 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %38, i32 0, i32 2
  %40 = load i16, i16* %39, align 4
  %41 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %42 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %41, i32 0, i32 1
  store i16 %40, i16* %42, align 2
  %43 = load i32, i32* %3, align 4
  %44 = trunc i32 %43 to i16
  %45 = load %struct.flow_ctx_table_key*, %struct.flow_ctx_table_key** %2, align 8
  %46 = getelementptr inbounds %struct.flow_ctx_table_key, %struct.flow_ctx_table_key* %45, i32 0, i32 2
  store i16 %44, i16* %46, align 4
  br label %47

47:                                               ; preds = %33, %23
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }
attributes #2 = { convergent nofree nosync nounwind readnone willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

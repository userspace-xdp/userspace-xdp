; ModuleID = 'xdp-tcpclassify.bpf.c'
source_filename = "xdp-tcpclassify.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.anon.1 = type { [27 x i32]*, [262144 x i32]* }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.event = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }

@bpf_xdp_load_bytes = internal global i64 (%struct.xdp_md*, i32, i8*, i32)* inttoptr (i64 189 to i64 (%struct.xdp_md*, i32, i8*, i32)*), align 8
@bpf_strncmp = internal global i64 (i8*, i32, i8*)* inttoptr (i64 182 to i64 (i8*, i32, i8*)*), align 8
@.str = private unnamed_addr constant [5 x i8] c"HTTP\00", align 1
@bpf_ringbuf_output = internal global i64 (i8*, i8*, i64, i64)* inttoptr (i64 130 to i64 (i8*, i8*, i64, i64)*), align 8
@ringbuf = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [3 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.1* @ringbuf to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca %struct.xdp_md*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.ethhdr*, align 8
  %7 = alloca %struct.iphdr*, align 8
  %8 = alloca %struct.tcphdr*, align 8
  %9 = alloca %struct.event, align 4
  %10 = alloca i8*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %3, align 8
  %11 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %12 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %11, i32 0, i32 0
  %13 = load i64, i64* %12, align 8
  %14 = inttoptr i64 %13 to i8*
  store i8* %14, i8** %4, align 8
  %15 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %16 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %15, i32 0, i32 1
  %17 = load i64, i64* %16, align 8
  %18 = inttoptr i64 %17 to i8*
  store i8* %18, i8** %5, align 8
  %19 = load i8*, i8** %4, align 8
  %20 = bitcast i8* %19 to %struct.ethhdr*
  store %struct.ethhdr* %20, %struct.ethhdr** %6, align 8
  %21 = load i8*, i8** %4, align 8
  %22 = getelementptr i8, i8* %21, i64 14
  %23 = load i8*, i8** %5, align 8
  %24 = icmp ugt i8* %22, %23
  br i1 %24, label %25, label %26

25:                                               ; preds = %1
  store i32 2, i32* %2, align 4
  br label %252

26:                                               ; preds = %1
  %27 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %28 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %27, i32 0, i32 2
  %29 = load i16, i16* %28, align 2
  %30 = call i1 @llvm.is.constant.i16(i16 %29)
  br i1 %30, label %31, label %49

31:                                               ; preds = %26
  %32 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %33 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %32, i32 0, i32 2
  %34 = load i16, i16* %33, align 2
  %35 = zext i16 %34 to i32
  %36 = shl i32 %35, 8
  %37 = ashr i32 %36, 8
  %38 = shl i32 %37, 8
  %39 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %40 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %39, i32 0, i32 2
  %41 = load i16, i16* %40, align 2
  %42 = zext i16 %41 to i32
  %43 = shl i32 %42, 0
  %44 = ashr i32 %43, 8
  %45 = shl i32 %44, 0
  %46 = or i32 %38, %45
  %47 = trunc i32 %46 to i16
  %48 = zext i16 %47 to i32
  br label %55

49:                                               ; preds = %26
  %50 = load %struct.ethhdr*, %struct.ethhdr** %6, align 8
  %51 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %50, i32 0, i32 2
  %52 = load i16, i16* %51, align 2
  %53 = call i16 @llvm.bswap.i16(i16 %52)
  %54 = zext i16 %53 to i32
  br label %55

55:                                               ; preds = %49, %31
  %56 = phi i32 [ %48, %31 ], [ %54, %49 ]
  %57 = icmp ne i32 %56, 2048
  br i1 %57, label %58, label %59

58:                                               ; preds = %55
  store i32 2, i32* %2, align 4
  br label %252

59:                                               ; preds = %55
  %60 = load i8*, i8** %4, align 8
  %61 = getelementptr i8, i8* %60, i64 14
  %62 = bitcast i8* %61 to %struct.iphdr*
  store %struct.iphdr* %62, %struct.iphdr** %7, align 8
  %63 = load i8*, i8** %4, align 8
  %64 = getelementptr i8, i8* %63, i64 14
  %65 = getelementptr i8, i8* %64, i64 20
  %66 = load i8*, i8** %5, align 8
  %67 = icmp ugt i8* %65, %66
  br i1 %67, label %68, label %69

68:                                               ; preds = %59
  store i32 2, i32* %2, align 4
  br label %252

69:                                               ; preds = %59
  %70 = load %struct.iphdr*, %struct.iphdr** %7, align 8
  %71 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %70, i32 0, i32 6
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp ne i32 %73, 6
  br i1 %74, label %75, label %76

75:                                               ; preds = %69
  store i32 2, i32* %2, align 4
  br label %252

76:                                               ; preds = %69
  %77 = load i8*, i8** %4, align 8
  %78 = getelementptr i8, i8* %77, i64 14
  %79 = getelementptr i8, i8* %78, i64 20
  %80 = bitcast i8* %79 to %struct.tcphdr*
  store %struct.tcphdr* %80, %struct.tcphdr** %8, align 8
  %81 = load i8*, i8** %4, align 8
  %82 = getelementptr i8, i8* %81, i64 14
  %83 = getelementptr i8, i8* %82, i64 20
  %84 = getelementptr i8, i8* %83, i64 20
  %85 = load i8*, i8** %5, align 8
  %86 = icmp ugt i8* %84, %85
  br i1 %86, label %87, label %88

87:                                               ; preds = %76
  store i32 2, i32* %2, align 4
  br label %252

88:                                               ; preds = %76
  %89 = load %struct.iphdr*, %struct.iphdr** %7, align 8
  %90 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %89, i32 0, i32 8
  %91 = bitcast %union.anon* %90 to %struct.anon*
  %92 = getelementptr inbounds %struct.anon, %struct.anon* %91, i32 0, i32 0
  %93 = load i32, i32* %92, align 4
  %94 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 2
  store i32 %93, i32* %94, align 4
  %95 = load %struct.iphdr*, %struct.iphdr** %7, align 8
  %96 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %95, i32 0, i32 8
  %97 = bitcast %union.anon* %96 to %struct.anon*
  %98 = getelementptr inbounds %struct.anon, %struct.anon* %97, i32 0, i32 1
  %99 = load i32, i32* %98, align 4
  %100 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 3
  store i32 %99, i32* %100, align 4
  %101 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %102 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %101, i32 0, i32 0
  %103 = load i16, i16* %102, align 4
  %104 = call i1 @llvm.is.constant.i16(i16 %103)
  br i1 %104, label %105, label %123

105:                                              ; preds = %88
  %106 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %107 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %106, i32 0, i32 0
  %108 = load i16, i16* %107, align 4
  %109 = zext i16 %108 to i32
  %110 = shl i32 %109, 8
  %111 = ashr i32 %110, 8
  %112 = shl i32 %111, 8
  %113 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %114 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %113, i32 0, i32 0
  %115 = load i16, i16* %114, align 4
  %116 = zext i16 %115 to i32
  %117 = shl i32 %116, 0
  %118 = ashr i32 %117, 8
  %119 = shl i32 %118, 0
  %120 = or i32 %112, %119
  %121 = trunc i32 %120 to i16
  %122 = zext i16 %121 to i32
  br label %129

123:                                              ; preds = %88
  %124 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %125 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %124, i32 0, i32 0
  %126 = load i16, i16* %125, align 4
  %127 = call i16 @llvm.bswap.i16(i16 %126)
  %128 = zext i16 %127 to i32
  br label %129

129:                                              ; preds = %123, %105
  %130 = phi i32 [ %122, %105 ], [ %128, %123 ]
  %131 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 0
  store i32 %130, i32* %131, align 4
  %132 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %133 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %132, i32 0, i32 1
  %134 = load i16, i16* %133, align 2
  %135 = call i1 @llvm.is.constant.i16(i16 %134)
  br i1 %135, label %136, label %154

136:                                              ; preds = %129
  %137 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %138 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %137, i32 0, i32 1
  %139 = load i16, i16* %138, align 2
  %140 = zext i16 %139 to i32
  %141 = shl i32 %140, 8
  %142 = ashr i32 %141, 8
  %143 = shl i32 %142, 8
  %144 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %145 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %144, i32 0, i32 1
  %146 = load i16, i16* %145, align 2
  %147 = zext i16 %146 to i32
  %148 = shl i32 %147, 0
  %149 = ashr i32 %148, 8
  %150 = shl i32 %149, 0
  %151 = or i32 %143, %150
  %152 = trunc i32 %151 to i16
  %153 = zext i16 %152 to i32
  br label %160

154:                                              ; preds = %129
  %155 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %156 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %155, i32 0, i32 1
  %157 = load i16, i16* %156, align 2
  %158 = call i16 @llvm.bswap.i16(i16 %157)
  %159 = zext i16 %158 to i32
  br label %160

160:                                              ; preds = %154, %136
  %161 = phi i32 [ %153, %136 ], [ %159, %154 ]
  %162 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 1
  store i32 %161, i32* %162, align 4
  %163 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %164 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %163, i32 0, i32 4
  %165 = load i16, i16* %164, align 4
  %166 = lshr i16 %165, 9
  %167 = and i16 %166, 1
  %168 = zext i16 %167 to i32
  %169 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 4
  store i32 %168, i32* %169, align 4
  %170 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %171 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %170, i32 0, i32 4
  %172 = load i16, i16* %171, align 4
  %173 = lshr i16 %172, 8
  %174 = and i16 %173, 1
  %175 = zext i16 %174 to i32
  %176 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 5
  store i32 %175, i32* %176, align 4
  %177 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %178 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %177, i32 0, i32 4
  %179 = load i16, i16* %178, align 4
  %180 = lshr i16 %179, 10
  %181 = and i16 %180, 1
  %182 = zext i16 %181 to i32
  %183 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 6
  store i32 %182, i32* %183, align 4
  %184 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %185 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %184, i32 0, i32 4
  %186 = load i16, i16* %185, align 4
  %187 = lshr i16 %186, 11
  %188 = and i16 %187, 1
  %189 = zext i16 %188 to i32
  %190 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 7
  store i32 %189, i32* %190, align 4
  %191 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %192 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %191, i32 0, i32 4
  %193 = load i16, i16* %192, align 4
  %194 = lshr i16 %193, 12
  %195 = and i16 %194, 1
  %196 = zext i16 %195 to i32
  %197 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 8
  store i32 %196, i32* %197, align 4
  %198 = load i8*, i8** %5, align 8
  %199 = load i8*, i8** %4, align 8
  %200 = ptrtoint i8* %198 to i64
  %201 = ptrtoint i8* %199 to i64
  %202 = sub i64 %200, %201
  %203 = trunc i64 %202 to i32
  %204 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 10
  store i32 %203, i32* %204, align 4
  %205 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %206 = bitcast %struct.tcphdr* %205 to i8*
  %207 = load %struct.tcphdr*, %struct.tcphdr** %8, align 8
  %208 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %207, i32 0, i32 4
  %209 = load i16, i16* %208, align 4
  %210 = lshr i16 %209, 4
  %211 = and i16 %210, 15
  %212 = zext i16 %211 to i32
  %213 = mul nsw i32 %212, 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr i8, i8* %206, i64 %214
  store i8* %215, i8** %10, align 8
  %216 = load i8*, i8** %10, align 8
  %217 = getelementptr i8, i8* %216, i64 4
  %218 = load i8*, i8** %5, align 8
  %219 = icmp ult i8* %217, %218
  br i1 %219, label %220, label %236

220:                                              ; preds = %160
  %221 = load i64 (%struct.xdp_md*, i32, i8*, i32)*, i64 (%struct.xdp_md*, i32, i8*, i32)** @bpf_xdp_load_bytes, align 8
  %222 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %223 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 11
  %224 = getelementptr inbounds [256 x i8], [256 x i8]* %223, i64 0, i64 0
  %225 = call i64 %221(%struct.xdp_md* noundef %222, i32 noundef 0, i8* noundef %224, i32 noundef 4)
  %226 = load i64 (i8*, i32, i8*)*, i64 (i8*, i32, i8*)** @bpf_strncmp, align 8
  %227 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 11
  %228 = getelementptr inbounds [256 x i8], [256 x i8]* %227, i64 0, i64 0
  %229 = call i64 %226(i8* noundef %228, i32 noundef 4, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0))
  %230 = icmp eq i64 %229, 0
  br i1 %230, label %231, label %233

231:                                              ; preds = %220
  %232 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 9
  store i32 1, i32* %232, align 4
  br label %235

233:                                              ; preds = %220
  %234 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 9
  store i32 0, i32* %234, align 4
  br label %235

235:                                              ; preds = %233, %231
  br label %236

236:                                              ; preds = %235, %160
  %237 = load i8*, i8** %4, align 8
  %238 = getelementptr i8, i8* %237, i64 60
  %239 = load i8*, i8** %5, align 8
  %240 = icmp ult i8* %238, %239
  br i1 %240, label %241, label %247

241:                                              ; preds = %236
  %242 = load i64 (%struct.xdp_md*, i32, i8*, i32)*, i64 (%struct.xdp_md*, i32, i8*, i32)** @bpf_xdp_load_bytes, align 8
  %243 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %244 = getelementptr inbounds %struct.event, %struct.event* %9, i32 0, i32 11
  %245 = bitcast [256 x i8]* %244 to i8*
  %246 = call i64 %242(%struct.xdp_md* noundef %243, i32 noundef 0, i8* noundef %245, i32 noundef 60)
  br label %247

247:                                              ; preds = %241, %236
  %248 = load i64 (i8*, i8*, i64, i64)*, i64 (i8*, i8*, i64, i64)** @bpf_ringbuf_output, align 8
  %249 = bitcast %struct.event* %9 to i8*
  %250 = call i64 %248(i8* noundef bitcast (%struct.anon.1* @ringbuf to i8*), i8* noundef %249, i64 noundef 300, i64 noundef 0)
  %251 = load i8*, i8** %4, align 8
  call void @swap_src_dst_mac(i8* noundef %251)
  store i32 3, i32* %2, align 4
  br label %252

252:                                              ; preds = %247, %87, %75, %68, %58, %25
  %253 = load i32, i32* %2, align 4
  ret i32 %253
}

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i16(i16) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

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

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { convergent nofree nosync nounwind readnone willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

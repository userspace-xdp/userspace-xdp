; ModuleID = 'xdp-tcpclassify.bpf.c'
source_filename = "xdp-tcpclassify.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.1 = type { [27 x i32]*, [262144 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.event = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8] }

@.str = private unnamed_addr constant [5 x i8] c"HTTP\00", align 1
@ringbuf_id = internal constant i64 17179869184, align 8
@_license = dso_local global [4 x i8] c"GPL\00", align 1
@ringbuf = dso_local global %struct.anon.1 zeroinitializer, align 8

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
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.xdp_md*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %struct.ethhdr*, align 8
  %11 = alloca %struct.iphdr*, align 8
  %12 = alloca %struct.tcphdr*, align 8
  %13 = alloca %struct.event, align 4
  %14 = alloca i8*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %7, align 8
  %15 = load %struct.xdp_md*, %struct.xdp_md** %7, align 8
  %16 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %15, i32 0, i32 0
  %17 = load i64, i64* %16, align 8
  %18 = inttoptr i64 %17 to i8*
  store i8* %18, i8** %8, align 8
  %19 = load %struct.xdp_md*, %struct.xdp_md** %7, align 8
  %20 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %19, i32 0, i32 1
  %21 = load i64, i64* %20, align 8
  %22 = inttoptr i64 %21 to i8*
  store i8* %22, i8** %9, align 8
  %23 = load i8*, i8** %8, align 8
  %24 = bitcast i8* %23 to %struct.ethhdr*
  store %struct.ethhdr* %24, %struct.ethhdr** %10, align 8
  %25 = load i8*, i8** %8, align 8
  %26 = getelementptr i8, i8* %25, i64 14
  %27 = load i8*, i8** %9, align 8
  %28 = icmp ugt i8* %26, %27
  br i1 %28, label %29, label %30

29:                                               ; preds = %1
  store i32 2, i32* %6, align 4
  br label %257

30:                                               ; preds = %1
  %31 = load %struct.ethhdr*, %struct.ethhdr** %10, align 8
  %32 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %31, i32 0, i32 2
  %33 = load i16, i16* %32, align 2
  %34 = call i1 @llvm.is.constant.i16(i16 %33)
  br i1 %34, label %35, label %53

35:                                               ; preds = %30
  %36 = load %struct.ethhdr*, %struct.ethhdr** %10, align 8
  %37 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %36, i32 0, i32 2
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = shl i32 %39, 8
  %41 = ashr i32 %40, 8
  %42 = shl i32 %41, 8
  %43 = load %struct.ethhdr*, %struct.ethhdr** %10, align 8
  %44 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %43, i32 0, i32 2
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = shl i32 %46, 0
  %48 = ashr i32 %47, 8
  %49 = shl i32 %48, 0
  %50 = or i32 %42, %49
  %51 = trunc i32 %50 to i16
  %52 = zext i16 %51 to i32
  br label %59

53:                                               ; preds = %30
  %54 = load %struct.ethhdr*, %struct.ethhdr** %10, align 8
  %55 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %54, i32 0, i32 2
  %56 = load i16, i16* %55, align 2
  %57 = call i16 @llvm.bswap.i16(i16 %56)
  %58 = zext i16 %57 to i32
  br label %59

59:                                               ; preds = %53, %35
  %60 = phi i32 [ %52, %35 ], [ %58, %53 ]
  %61 = icmp ne i32 %60, 2048
  br i1 %61, label %62, label %63

62:                                               ; preds = %59
  store i32 2, i32* %6, align 4
  br label %257

63:                                               ; preds = %59
  %64 = load i8*, i8** %8, align 8
  %65 = getelementptr i8, i8* %64, i64 14
  %66 = bitcast i8* %65 to %struct.iphdr*
  store %struct.iphdr* %66, %struct.iphdr** %11, align 8
  %67 = load i8*, i8** %8, align 8
  %68 = getelementptr i8, i8* %67, i64 14
  %69 = getelementptr i8, i8* %68, i64 20
  %70 = load i8*, i8** %9, align 8
  %71 = icmp ugt i8* %69, %70
  br i1 %71, label %72, label %73

72:                                               ; preds = %63
  store i32 2, i32* %6, align 4
  br label %257

73:                                               ; preds = %63
  %74 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %75 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %74, i32 0, i32 6
  %76 = load i8, i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = icmp ne i32 %77, 6
  br i1 %78, label %79, label %80

79:                                               ; preds = %73
  store i32 2, i32* %6, align 4
  br label %257

80:                                               ; preds = %73
  %81 = load i8*, i8** %8, align 8
  %82 = getelementptr i8, i8* %81, i64 14
  %83 = getelementptr i8, i8* %82, i64 20
  %84 = bitcast i8* %83 to %struct.tcphdr*
  store %struct.tcphdr* %84, %struct.tcphdr** %12, align 8
  %85 = load i8*, i8** %8, align 8
  %86 = getelementptr i8, i8* %85, i64 14
  %87 = getelementptr i8, i8* %86, i64 20
  %88 = getelementptr i8, i8* %87, i64 20
  %89 = load i8*, i8** %9, align 8
  %90 = icmp ugt i8* %88, %89
  br i1 %90, label %91, label %92

91:                                               ; preds = %80
  store i32 2, i32* %6, align 4
  br label %257

92:                                               ; preds = %80
  %93 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %94 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %93, i32 0, i32 8
  %95 = bitcast %union.anon* %94 to %struct.anon*
  %96 = getelementptr inbounds %struct.anon, %struct.anon* %95, i32 0, i32 0
  %97 = load i32, i32* %96, align 4
  %98 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 2
  store i32 %97, i32* %98, align 4
  %99 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %100 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %99, i32 0, i32 8
  %101 = bitcast %union.anon* %100 to %struct.anon*
  %102 = getelementptr inbounds %struct.anon, %struct.anon* %101, i32 0, i32 1
  %103 = load i32, i32* %102, align 4
  %104 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 3
  store i32 %103, i32* %104, align 4
  %105 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %106 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %105, i32 0, i32 0
  %107 = load i16, i16* %106, align 4
  %108 = call i1 @llvm.is.constant.i16(i16 %107)
  br i1 %108, label %109, label %127

109:                                              ; preds = %92
  %110 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %111 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %110, i32 0, i32 0
  %112 = load i16, i16* %111, align 4
  %113 = zext i16 %112 to i32
  %114 = shl i32 %113, 8
  %115 = ashr i32 %114, 8
  %116 = shl i32 %115, 8
  %117 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %118 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %117, i32 0, i32 0
  %119 = load i16, i16* %118, align 4
  %120 = zext i16 %119 to i32
  %121 = shl i32 %120, 0
  %122 = ashr i32 %121, 8
  %123 = shl i32 %122, 0
  %124 = or i32 %116, %123
  %125 = trunc i32 %124 to i16
  %126 = zext i16 %125 to i32
  br label %133

127:                                              ; preds = %92
  %128 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %129 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %128, i32 0, i32 0
  %130 = load i16, i16* %129, align 4
  %131 = call i16 @llvm.bswap.i16(i16 %130)
  %132 = zext i16 %131 to i32
  br label %133

133:                                              ; preds = %127, %109
  %134 = phi i32 [ %126, %109 ], [ %132, %127 ]
  %135 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 0
  store i32 %134, i32* %135, align 4
  %136 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %137 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %136, i32 0, i32 1
  %138 = load i16, i16* %137, align 2
  %139 = call i1 @llvm.is.constant.i16(i16 %138)
  br i1 %139, label %140, label %158

140:                                              ; preds = %133
  %141 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %142 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %141, i32 0, i32 1
  %143 = load i16, i16* %142, align 2
  %144 = zext i16 %143 to i32
  %145 = shl i32 %144, 8
  %146 = ashr i32 %145, 8
  %147 = shl i32 %146, 8
  %148 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %149 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %148, i32 0, i32 1
  %150 = load i16, i16* %149, align 2
  %151 = zext i16 %150 to i32
  %152 = shl i32 %151, 0
  %153 = ashr i32 %152, 8
  %154 = shl i32 %153, 0
  %155 = or i32 %147, %154
  %156 = trunc i32 %155 to i16
  %157 = zext i16 %156 to i32
  br label %164

158:                                              ; preds = %133
  %159 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %160 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %159, i32 0, i32 1
  %161 = load i16, i16* %160, align 2
  %162 = call i16 @llvm.bswap.i16(i16 %161)
  %163 = zext i16 %162 to i32
  br label %164

164:                                              ; preds = %158, %140
  %165 = phi i32 [ %157, %140 ], [ %163, %158 ]
  %166 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 1
  store i32 %165, i32* %166, align 4
  %167 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %168 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %167, i32 0, i32 4
  %169 = load i16, i16* %168, align 4
  %170 = lshr i16 %169, 9
  %171 = and i16 %170, 1
  %172 = zext i16 %171 to i32
  %173 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 4
  store i32 %172, i32* %173, align 4
  %174 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %175 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %174, i32 0, i32 4
  %176 = load i16, i16* %175, align 4
  %177 = lshr i16 %176, 8
  %178 = and i16 %177, 1
  %179 = zext i16 %178 to i32
  %180 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 5
  store i32 %179, i32* %180, align 4
  %181 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %182 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %181, i32 0, i32 4
  %183 = load i16, i16* %182, align 4
  %184 = lshr i16 %183, 10
  %185 = and i16 %184, 1
  %186 = zext i16 %185 to i32
  %187 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 6
  store i32 %186, i32* %187, align 4
  %188 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %189 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %188, i32 0, i32 4
  %190 = load i16, i16* %189, align 4
  %191 = lshr i16 %190, 11
  %192 = and i16 %191, 1
  %193 = zext i16 %192 to i32
  %194 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 7
  store i32 %193, i32* %194, align 4
  %195 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %196 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %195, i32 0, i32 4
  %197 = load i16, i16* %196, align 4
  %198 = lshr i16 %197, 12
  %199 = and i16 %198, 1
  %200 = zext i16 %199 to i32
  %201 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 8
  store i32 %200, i32* %201, align 4
  %202 = load i8*, i8** %9, align 8
  %203 = load i8*, i8** %8, align 8
  %204 = ptrtoint i8* %202 to i64
  %205 = ptrtoint i8* %203 to i64
  %206 = sub i64 %204, %205
  %207 = trunc i64 %206 to i32
  %208 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 10
  store i32 %207, i32* %208, align 4
  %209 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %210 = bitcast %struct.tcphdr* %209 to i8*
  %211 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %212 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %211, i32 0, i32 4
  %213 = load i16, i16* %212, align 4
  %214 = lshr i16 %213, 4
  %215 = and i16 %214, 15
  %216 = zext i16 %215 to i32
  %217 = mul nsw i32 %216, 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr i8, i8* %210, i64 %218
  store i8* %219, i8** %14, align 8
  %220 = load i8*, i8** %14, align 8
  %221 = getelementptr i8, i8* %220, i64 4
  %222 = load i8*, i8** %9, align 8
  %223 = icmp ult i8* %221, %222
  br i1 %223, label %224, label %238

224:                                              ; preds = %164
  %225 = load %struct.xdp_md*, %struct.xdp_md** %7, align 8
  %226 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 11
  %227 = getelementptr inbounds [256 x i8], [256 x i8]* %226, i64 0, i64 0
  %228 = call i32 (%struct.xdp_md*, i32, i8*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0189 to i32 (%struct.xdp_md*, i32, i8*, i32, ...)*)(%struct.xdp_md* noundef %225, i32 noundef 0, i8* noundef %227, i32 noundef 4)
  %229 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 11
  %230 = getelementptr inbounds [256 x i8], [256 x i8]* %229, i64 0, i64 0
  %231 = call i32 (i8*, i32, i8*, ...) bitcast (i32 (...)* @_bpf_helper_ext_0182 to i32 (i8*, i32, i8*, ...)*)(i8* noundef %230, i32 noundef 4, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0))
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %233, label %235

233:                                              ; preds = %224
  %234 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 9
  store i32 1, i32* %234, align 4
  br label %237

235:                                              ; preds = %224
  %236 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 9
  store i32 0, i32* %236, align 4
  br label %237

237:                                              ; preds = %235, %233
  br label %238

238:                                              ; preds = %237, %164
  %239 = load i8*, i8** %8, align 8
  %240 = getelementptr i8, i8* %239, i64 60
  %241 = load i8*, i8** %9, align 8
  %242 = icmp ult i8* %240, %241
  br i1 %242, label %243, label %247

243:                                              ; preds = %238
  %244 = load %struct.xdp_md*, %struct.xdp_md** %7, align 8
  %245 = getelementptr inbounds %struct.event, %struct.event* %13, i32 0, i32 11
  %246 = call i32 (%struct.xdp_md*, i32, [256 x i8]*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0189 to i32 (%struct.xdp_md*, i32, [256 x i8]*, i32, ...)*)(%struct.xdp_md* noundef %244, i32 noundef 0, [256 x i8]* noundef %245, i32 noundef 60)
  br label %247

247:                                              ; preds = %243, %238
  %248 = bitcast %struct.event* %13 to i8*
  store i64* @ringbuf_id, i64** %2, align 8
  store i8* %248, i8** %3, align 8
  store i64 300, i64* %4, align 8
  store i64 0, i64* %5, align 8
  %249 = load i64*, i64** %2, align 8
  %250 = load i64, i64* %249, align 8
  %251 = load i8*, i8** %3, align 8
  %252 = load i64, i64* %4, align 8
  %253 = load i64, i64* %5, align 8
  %254 = call i32 (i64, i8*, i64, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0130 to i32 (i64, i8*, i64, i64, ...)*)(i64 noundef %250, i8* noundef %251, i64 noundef %252, i64 noundef %253) #4
  %255 = sext i32 %254 to i64
  %256 = load i8*, i8** %8, align 8
  call void @swap_src_dst_mac(i8* noundef %256)
  store i32 3, i32* %6, align 4
  br label %257

257:                                              ; preds = %247, %91, %79, %72, %62, %29
  %258 = load i32, i32* %6, align 4
  ret i32 %258
}

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i16(i16) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

declare i32 @_bpf_helper_ext_0189(...) #3

declare i32 @_bpf_helper_ext_0182(...) #3

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

declare i32 @_bpf_helper_ext_0130(...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { convergent nofree nosync nounwind readnone willreturn }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

; ModuleID = 'xdp_hash_sum.bpf.c'
source_filename = "xdp_hash_sum.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }

@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1

; Function Attrs: nofree nosync nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to %struct.xdp_md*
  %3 = tail call i32 @xdp_pass(%struct.xdp_md* noundef %2)
  ret i32 %3
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %3 = load i64, i64* %2, align 8, !tbaa !5
  %4 = inttoptr i64 %3 to i8*
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %6 = load i64, i64* %5, align 8, !tbaa !11
  %7 = inttoptr i64 %6 to i8*
  %8 = getelementptr i8, i8* %7, i64 14
  %9 = icmp ugt i8* %8, %4
  br i1 %9, label %425, label %10

10:                                               ; preds = %1
  %11 = inttoptr i64 %6 to %struct.ethhdr*
  %12 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 2
  %13 = load i16, i16* %12, align 2, !tbaa !12
  %14 = icmp eq i16 %13, 8
  br i1 %14, label %15, label %425

15:                                               ; preds = %10
  %16 = getelementptr i8, i8* %7, i64 34
  %17 = bitcast i8* %16 to %struct.iphdr*
  %18 = inttoptr i64 %3 to %struct.iphdr*
  %19 = icmp ugt %struct.iphdr* %17, %18
  %20 = getelementptr i8, i8* %7, i64 1200
  %21 = icmp ult i8* %20, %4
  %22 = select i1 %19, i1 true, i1 %21
  %23 = getelementptr i8, i8* %7, i64 60
  %24 = icmp ugt i8* %23, %4
  %25 = select i1 %22, i1 true, i1 %24
  %26 = getelementptr i8, i8* %7, i64 42
  %27 = icmp ugt i8* %26, %4
  %28 = select i1 %25, i1 true, i1 %27
  br i1 %28, label %425, label %29

29:                                               ; preds = %15
  %30 = load i8, i8* %7, align 1, !tbaa !15
  %31 = zext i8 %30 to i32
  %32 = getelementptr inbounds i8, i8* %7, i64 1
  %33 = load i8, i8* %32, align 1, !tbaa !15
  %34 = zext i8 %33 to i32
  %35 = add nuw nsw i32 %34, %31
  %36 = getelementptr inbounds i8, i8* %7, i64 2
  %37 = load i8, i8* %36, align 1, !tbaa !15
  %38 = zext i8 %37 to i32
  %39 = add nuw nsw i32 %35, %38
  %40 = getelementptr inbounds i8, i8* %7, i64 3
  %41 = load i8, i8* %40, align 1, !tbaa !15
  %42 = zext i8 %41 to i32
  %43 = add nuw nsw i32 %39, %42
  %44 = getelementptr inbounds i8, i8* %7, i64 4
  %45 = load i8, i8* %44, align 1, !tbaa !15
  %46 = zext i8 %45 to i32
  %47 = add nuw nsw i32 %43, %46
  %48 = getelementptr inbounds i8, i8* %7, i64 5
  %49 = load i8, i8* %48, align 1, !tbaa !15
  %50 = zext i8 %49 to i32
  %51 = add nuw nsw i32 %47, %50
  %52 = getelementptr inbounds i8, i8* %7, i64 6
  %53 = load i8, i8* %52, align 1, !tbaa !15
  %54 = zext i8 %53 to i32
  %55 = add nuw nsw i32 %51, %54
  %56 = getelementptr inbounds i8, i8* %7, i64 7
  %57 = load i8, i8* %56, align 1, !tbaa !15
  %58 = zext i8 %57 to i32
  %59 = add nuw nsw i32 %55, %58
  %60 = getelementptr inbounds i8, i8* %7, i64 8
  %61 = load i8, i8* %60, align 1, !tbaa !15
  %62 = zext i8 %61 to i32
  %63 = add nuw nsw i32 %59, %62
  %64 = getelementptr inbounds i8, i8* %7, i64 9
  %65 = load i8, i8* %64, align 1, !tbaa !15
  %66 = zext i8 %65 to i32
  %67 = add nuw nsw i32 %63, %66
  %68 = getelementptr inbounds i8, i8* %7, i64 10
  %69 = load i8, i8* %68, align 1, !tbaa !15
  %70 = zext i8 %69 to i32
  %71 = add nuw nsw i32 %67, %70
  %72 = getelementptr inbounds i8, i8* %7, i64 11
  %73 = load i8, i8* %72, align 1, !tbaa !15
  %74 = zext i8 %73 to i32
  %75 = add nuw nsw i32 %71, %74
  %76 = getelementptr inbounds i8, i8* %7, i64 12
  %77 = load i8, i8* %76, align 1, !tbaa !15
  %78 = zext i8 %77 to i32
  %79 = add nuw nsw i32 %75, %78
  %80 = getelementptr inbounds i8, i8* %7, i64 13
  %81 = load i8, i8* %80, align 1, !tbaa !15
  %82 = zext i8 %81 to i32
  %83 = add nuw nsw i32 %79, %82
  %84 = load i8, i8* %8, align 1, !tbaa !15
  %85 = zext i8 %84 to i32
  %86 = add nuw nsw i32 %83, %85
  %87 = getelementptr inbounds i8, i8* %7, i64 15
  %88 = load i8, i8* %87, align 1, !tbaa !15
  %89 = zext i8 %88 to i32
  %90 = add nuw nsw i32 %86, %89
  %91 = getelementptr inbounds i8, i8* %7, i64 16
  %92 = load i8, i8* %91, align 1, !tbaa !15
  %93 = zext i8 %92 to i32
  %94 = add nuw nsw i32 %90, %93
  %95 = getelementptr inbounds i8, i8* %7, i64 17
  %96 = load i8, i8* %95, align 1, !tbaa !15
  %97 = zext i8 %96 to i32
  %98 = add nuw nsw i32 %94, %97
  %99 = getelementptr inbounds i8, i8* %7, i64 18
  %100 = load i8, i8* %99, align 1, !tbaa !15
  %101 = zext i8 %100 to i32
  %102 = add nuw nsw i32 %98, %101
  %103 = getelementptr inbounds i8, i8* %7, i64 19
  %104 = load i8, i8* %103, align 1, !tbaa !15
  %105 = zext i8 %104 to i32
  %106 = add nuw nsw i32 %102, %105
  %107 = getelementptr inbounds i8, i8* %7, i64 20
  %108 = load i8, i8* %107, align 1, !tbaa !15
  %109 = zext i8 %108 to i32
  %110 = add nuw nsw i32 %106, %109
  %111 = getelementptr inbounds i8, i8* %7, i64 21
  %112 = load i8, i8* %111, align 1, !tbaa !15
  %113 = zext i8 %112 to i32
  %114 = add nuw nsw i32 %110, %113
  %115 = getelementptr inbounds i8, i8* %7, i64 22
  %116 = load i8, i8* %115, align 1, !tbaa !15
  %117 = zext i8 %116 to i32
  %118 = add nuw nsw i32 %114, %117
  %119 = getelementptr inbounds i8, i8* %7, i64 23
  %120 = load i8, i8* %119, align 1, !tbaa !15
  %121 = zext i8 %120 to i32
  %122 = add nuw nsw i32 %118, %121
  %123 = getelementptr inbounds i8, i8* %7, i64 24
  %124 = load i8, i8* %123, align 1, !tbaa !15
  %125 = zext i8 %124 to i32
  %126 = add nuw nsw i32 %122, %125
  %127 = getelementptr inbounds i8, i8* %7, i64 25
  %128 = load i8, i8* %127, align 1, !tbaa !15
  %129 = zext i8 %128 to i32
  %130 = add nuw nsw i32 %126, %129
  %131 = getelementptr inbounds i8, i8* %7, i64 26
  %132 = load i8, i8* %131, align 1, !tbaa !15
  %133 = zext i8 %132 to i32
  %134 = add nuw nsw i32 %130, %133
  %135 = getelementptr inbounds i8, i8* %7, i64 27
  %136 = load i8, i8* %135, align 1, !tbaa !15
  %137 = zext i8 %136 to i32
  %138 = add nuw nsw i32 %134, %137
  %139 = getelementptr inbounds i8, i8* %7, i64 28
  %140 = load i8, i8* %139, align 1, !tbaa !15
  %141 = zext i8 %140 to i32
  %142 = add nuw nsw i32 %138, %141
  %143 = getelementptr inbounds i8, i8* %7, i64 29
  %144 = load i8, i8* %143, align 1, !tbaa !15
  %145 = zext i8 %144 to i32
  %146 = add nuw nsw i32 %142, %145
  %147 = getelementptr inbounds i8, i8* %7, i64 30
  %148 = load i8, i8* %147, align 1, !tbaa !15
  %149 = zext i8 %148 to i32
  %150 = add nuw nsw i32 %146, %149
  %151 = getelementptr inbounds i8, i8* %7, i64 31
  %152 = load i8, i8* %151, align 1, !tbaa !15
  %153 = zext i8 %152 to i32
  %154 = add nuw nsw i32 %150, %153
  %155 = getelementptr inbounds i8, i8* %7, i64 32
  %156 = load i8, i8* %155, align 1, !tbaa !15
  %157 = zext i8 %156 to i32
  %158 = add nuw nsw i32 %154, %157
  %159 = getelementptr inbounds i8, i8* %7, i64 33
  %160 = load i8, i8* %159, align 1, !tbaa !15
  %161 = zext i8 %160 to i32
  %162 = add nuw nsw i32 %158, %161
  %163 = load i8, i8* %16, align 1, !tbaa !15
  %164 = zext i8 %163 to i32
  %165 = add nuw nsw i32 %162, %164
  %166 = getelementptr inbounds i8, i8* %7, i64 35
  %167 = load i8, i8* %166, align 1, !tbaa !15
  %168 = zext i8 %167 to i32
  %169 = add nuw nsw i32 %165, %168
  %170 = getelementptr inbounds i8, i8* %7, i64 36
  %171 = load i8, i8* %170, align 1, !tbaa !15
  %172 = zext i8 %171 to i32
  %173 = add nuw nsw i32 %169, %172
  %174 = getelementptr inbounds i8, i8* %7, i64 37
  %175 = load i8, i8* %174, align 1, !tbaa !15
  %176 = zext i8 %175 to i32
  %177 = add nuw nsw i32 %173, %176
  %178 = getelementptr inbounds i8, i8* %7, i64 38
  %179 = load i8, i8* %178, align 1, !tbaa !15
  %180 = zext i8 %179 to i32
  %181 = add nuw nsw i32 %177, %180
  %182 = getelementptr inbounds i8, i8* %7, i64 39
  %183 = load i8, i8* %182, align 1, !tbaa !15
  %184 = zext i8 %183 to i32
  %185 = add nuw nsw i32 %181, %184
  %186 = getelementptr inbounds i8, i8* %7, i64 40
  %187 = load i8, i8* %186, align 1, !tbaa !15
  %188 = zext i8 %187 to i32
  %189 = add nuw nsw i32 %185, %188
  %190 = getelementptr inbounds i8, i8* %7, i64 41
  %191 = load i8, i8* %190, align 1, !tbaa !15
  %192 = zext i8 %191 to i32
  %193 = add nuw nsw i32 %189, %192
  %194 = load i8, i8* %26, align 1, !tbaa !15
  %195 = zext i8 %194 to i32
  %196 = add nuw nsw i32 %193, %195
  %197 = getelementptr inbounds i8, i8* %7, i64 43
  %198 = load i8, i8* %197, align 1, !tbaa !15
  %199 = zext i8 %198 to i32
  %200 = add nuw nsw i32 %196, %199
  %201 = getelementptr inbounds i8, i8* %7, i64 44
  %202 = load i8, i8* %201, align 1, !tbaa !15
  %203 = zext i8 %202 to i32
  %204 = add nuw nsw i32 %200, %203
  %205 = getelementptr inbounds i8, i8* %7, i64 45
  %206 = load i8, i8* %205, align 1, !tbaa !15
  %207 = zext i8 %206 to i32
  %208 = add nuw nsw i32 %204, %207
  %209 = getelementptr inbounds i8, i8* %7, i64 46
  %210 = load i8, i8* %209, align 1, !tbaa !15
  %211 = zext i8 %210 to i32
  %212 = add nuw nsw i32 %208, %211
  %213 = getelementptr inbounds i8, i8* %7, i64 47
  %214 = load i8, i8* %213, align 1, !tbaa !15
  %215 = zext i8 %214 to i32
  %216 = add nuw nsw i32 %212, %215
  %217 = getelementptr inbounds i8, i8* %7, i64 48
  %218 = bitcast i8* %217 to <8 x i8>*
  %219 = load <8 x i8>, <8 x i8>* %218, align 1, !tbaa !15
  %220 = zext <8 x i8> %219 to <8 x i32>
  %221 = getelementptr inbounds i8, i8* %7, i64 56
  %222 = bitcast i8* %221 to <4 x i8>*
  %223 = load <4 x i8>, <4 x i8>* %222, align 1, !tbaa !15
  %224 = zext <4 x i8> %223 to <4 x i32>
  %225 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %220)
  %226 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %224)
  %227 = add nuw nsw i32 %225, %226
  %228 = add nuw nsw i32 %227, %216
  %229 = shl nuw nsw i32 %34, 8
  %230 = or i32 %229, %31
  %231 = shl nuw nsw i32 %38, 16
  %232 = or i32 %230, %231
  %233 = shl nuw i32 %42, 24
  %234 = or i32 %232, %233
  %235 = mul i32 %234, -2048144777
  %236 = add i32 %235, 606290984
  %237 = add i32 %236, %228
  %238 = tail call i32 @llvm.fshl.i32(i32 %237, i32 %237, i32 13) #3
  %239 = mul i32 %238, -1640531535
  %240 = shl nuw nsw i32 %50, 8
  %241 = or i32 %240, %46
  %242 = shl nuw nsw i32 %54, 16
  %243 = or i32 %241, %242
  %244 = shl nuw i32 %58, 24
  %245 = or i32 %243, %244
  %246 = mul i32 %245, -2048144777
  %247 = add i32 %246, -2048144777
  %248 = add i32 %247, %228
  %249 = tail call i32 @llvm.fshl.i32(i32 %248, i32 %248, i32 13) #3
  %250 = mul i32 %249, -1640531535
  %251 = shl nuw nsw i32 %66, 8
  %252 = or i32 %251, %62
  %253 = shl nuw nsw i32 %70, 16
  %254 = or i32 %252, %253
  %255 = shl nuw i32 %74, 24
  %256 = or i32 %254, %255
  %257 = mul i32 %256, -2048144777
  %258 = add i32 %228, %257
  %259 = tail call i32 @llvm.fshl.i32(i32 %258, i32 %258, i32 13) #3
  %260 = mul i32 %259, -1640531535
  %261 = shl nuw nsw i32 %82, 8
  %262 = or i32 %261, %78
  %263 = shl nuw nsw i32 %85, 16
  %264 = or i32 %262, %263
  %265 = shl nuw i32 %89, 24
  %266 = or i32 %264, %265
  %267 = mul i32 %266, -2048144777
  %268 = add i32 %267, 1640531535
  %269 = add i32 %268, %228
  %270 = tail call i32 @llvm.fshl.i32(i32 %269, i32 %269, i32 13) #3
  %271 = mul i32 %270, -1640531535
  %272 = shl nuw nsw i32 %97, 8
  %273 = or i32 %272, %93
  %274 = shl nuw nsw i32 %101, 16
  %275 = or i32 %273, %274
  %276 = shl nuw i32 %105, 24
  %277 = or i32 %275, %276
  %278 = mul i32 %277, -2048144777
  %279 = add i32 %239, %278
  %280 = tail call i32 @llvm.fshl.i32(i32 %279, i32 %279, i32 13) #3
  %281 = mul i32 %280, -1640531535
  %282 = shl nuw nsw i32 %113, 8
  %283 = or i32 %282, %109
  %284 = shl nuw nsw i32 %117, 16
  %285 = or i32 %283, %284
  %286 = shl nuw i32 %121, 24
  %287 = or i32 %285, %286
  %288 = mul i32 %287, -2048144777
  %289 = add i32 %250, %288
  %290 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 13) #3
  %291 = mul i32 %290, -1640531535
  %292 = shl nuw nsw i32 %129, 8
  %293 = or i32 %292, %125
  %294 = shl nuw nsw i32 %133, 16
  %295 = or i32 %293, %294
  %296 = shl nuw i32 %137, 24
  %297 = or i32 %295, %296
  %298 = mul i32 %297, -2048144777
  %299 = add i32 %260, %298
  %300 = tail call i32 @llvm.fshl.i32(i32 %299, i32 %299, i32 13) #3
  %301 = mul i32 %300, -1640531535
  %302 = shl nuw nsw i32 %145, 8
  %303 = or i32 %302, %141
  %304 = shl nuw nsw i32 %149, 16
  %305 = or i32 %303, %304
  %306 = shl nuw i32 %153, 24
  %307 = or i32 %305, %306
  %308 = mul i32 %307, -2048144777
  %309 = add i32 %271, %308
  %310 = tail call i32 @llvm.fshl.i32(i32 %309, i32 %309, i32 13) #3
  %311 = mul i32 %310, -1640531535
  %312 = shl nuw nsw i32 %161, 8
  %313 = or i32 %312, %157
  %314 = shl nuw nsw i32 %164, 16
  %315 = or i32 %313, %314
  %316 = shl nuw i32 %168, 24
  %317 = or i32 %315, %316
  %318 = mul i32 %317, -2048144777
  %319 = add i32 %281, %318
  %320 = tail call i32 @llvm.fshl.i32(i32 %319, i32 %319, i32 13) #3
  %321 = mul i32 %320, -1640531535
  %322 = shl nuw nsw i32 %176, 8
  %323 = or i32 %322, %172
  %324 = shl nuw nsw i32 %180, 16
  %325 = or i32 %323, %324
  %326 = shl nuw i32 %184, 24
  %327 = or i32 %325, %326
  %328 = mul i32 %327, -2048144777
  %329 = add i32 %291, %328
  %330 = tail call i32 @llvm.fshl.i32(i32 %329, i32 %329, i32 13) #3
  %331 = mul i32 %330, -1640531535
  %332 = shl nuw nsw i32 %192, 8
  %333 = or i32 %332, %188
  %334 = shl nuw nsw i32 %195, 16
  %335 = or i32 %333, %334
  %336 = shl nuw i32 %199, 24
  %337 = or i32 %335, %336
  %338 = mul i32 %337, -2048144777
  %339 = add i32 %301, %338
  %340 = tail call i32 @llvm.fshl.i32(i32 %339, i32 %339, i32 13) #3
  %341 = mul i32 %340, -1640531535
  %342 = shl nuw nsw i32 %207, 8
  %343 = or i32 %342, %203
  %344 = shl nuw nsw i32 %211, 16
  %345 = or i32 %343, %344
  %346 = shl nuw i32 %215, 24
  %347 = or i32 %345, %346
  %348 = mul i32 %347, -2048144777
  %349 = add i32 %311, %348
  %350 = tail call i32 @llvm.fshl.i32(i32 %349, i32 %349, i32 13) #3
  %351 = mul i32 %350, -1640531535
  %352 = tail call i32 @llvm.fshl.i32(i32 %321, i32 %321, i32 1) #3
  %353 = tail call i32 @llvm.fshl.i32(i32 %331, i32 %331, i32 7) #3
  %354 = tail call i32 @llvm.fshl.i32(i32 %341, i32 %341, i32 12) #3
  %355 = tail call i32 @llvm.fshl.i32(i32 %351, i32 %351, i32 18) #3
  %356 = add i32 %354, 60
  %357 = add i32 %356, %352
  %358 = add i32 %357, %353
  %359 = add i32 %358, %355
  br label %360

360:                                              ; preds = %387, %29
  %361 = phi i32 [ %359, %29 ], [ %390, %387 ]
  %362 = phi i8* [ %217, %29 ], [ %391, %387 ]
  %363 = phi i32 [ 12, %29 ], [ %392, %387 ]
  %364 = icmp ugt i32 %363, 3
  br i1 %364, label %365, label %393

365:                                              ; preds = %360
  %366 = load i8, i8* %362, align 1, !tbaa !15
  %367 = zext i8 %366 to i32
  %368 = getelementptr inbounds i8, i8* %362, i64 1
  %369 = load i8, i8* %368, align 1, !tbaa !15
  %370 = zext i8 %369 to i32
  %371 = shl nuw nsw i32 %370, 8
  %372 = or i32 %371, %367
  %373 = getelementptr inbounds i8, i8* %362, i64 2
  %374 = load i8, i8* %373, align 1, !tbaa !15
  %375 = zext i8 %374 to i32
  %376 = shl nuw nsw i32 %375, 16
  %377 = or i32 %372, %376
  %378 = getelementptr inbounds i8, i8* %362, i64 3
  %379 = load i8, i8* %378, align 1, !tbaa !15
  %380 = zext i8 %379 to i32
  %381 = shl nuw i32 %380, 24
  %382 = or i32 %377, %381
  %383 = mul i32 %382, -1028477379
  %384 = add i32 %383, %361
  %385 = tail call i32 @llvm.fshl.i32(i32 %384, i32 %384, i32 17) #3
  %386 = mul i32 %385, 668265263
  br label %387

387:                                              ; preds = %395, %365
  %388 = phi i64 [ 4, %365 ], [ 1, %395 ]
  %389 = phi i32 [ -4, %365 ], [ -1, %395 ]
  %390 = phi i32 [ %386, %365 ], [ %401, %395 ]
  %391 = getelementptr inbounds i8, i8* %362, i64 %388
  %392 = add i32 %389, %363
  br label %360

393:                                              ; preds = %360
  %394 = icmp eq i32 %363, 0
  br i1 %394, label %402, label %395

395:                                              ; preds = %393
  %396 = load i8, i8* %362, align 1, !tbaa !15
  %397 = zext i8 %396 to i32
  %398 = mul i32 %397, 374761393
  %399 = add i32 %398, %361
  %400 = tail call i32 @llvm.fshl.i32(i32 %399, i32 %399, i32 11) #3
  %401 = mul i32 %400, -1640531535
  br label %387

402:                                              ; preds = %393
  %403 = lshr i32 %361, 15
  %404 = xor i32 %403, %361
  %405 = mul i32 %404, -2048144777
  %406 = lshr i32 %405, 13
  %407 = xor i32 %406, %405
  %408 = mul i32 %407, -1028477379
  %409 = lshr i32 %408, 16
  %410 = xor i32 %409, %408
  %411 = bitcast i8* %16 to i32*
  store i32 %228, i32* %411, align 1
  %412 = bitcast i8* %178 to i32*
  store i32 %410, i32* %412, align 1
  %413 = inttoptr i64 %6 to i16*
  %414 = load i16, i16* %413, align 2, !tbaa !16
  %415 = bitcast i8* %36 to i16*
  %416 = load i16, i16* %415, align 2, !tbaa !16
  %417 = bitcast i8* %44 to i16*
  %418 = load i16, i16* %417, align 2, !tbaa !16
  %419 = bitcast i8* %52 to i16*
  %420 = load i16, i16* %419, align 2, !tbaa !16
  store i16 %420, i16* %413, align 2, !tbaa !16
  %421 = bitcast i8* %60 to i16*
  %422 = load i16, i16* %421, align 2, !tbaa !16
  store i16 %422, i16* %415, align 2, !tbaa !16
  %423 = bitcast i8* %68 to i16*
  %424 = load i16, i16* %423, align 2, !tbaa !16
  store i16 %424, i16* %417, align 2, !tbaa !16
  store i16 %414, i16* %419, align 2, !tbaa !16
  store i16 %416, i16* %421, align 2, !tbaa !16
  store i16 %418, i16* %423, align 2, !tbaa !16
  br label %425

425:                                              ; preds = %15, %10, %1, %402
  %426 = phi i32 [ 3, %402 ], [ 2, %1 ], [ 2, %10 ], [ 2, %15 ]
  ret i32 %426
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #2

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #2

attributes #0 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree nosync nounwind readnone willreturn }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !7, i64 8}
!6 = !{!"xdp_md", !7, i64 0, !7, i64 8, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28}
!7 = !{!"long long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!6, !7, i64 0}
!12 = !{!13, !14, i64 12}
!13 = !{!"ethhdr", !8, i64 0, !8, i64 6, !14, i64 12}
!14 = !{!"short", !8, i64 0}
!15 = !{!8, !8, i64 0}
!16 = !{!14, !14, i64 0}

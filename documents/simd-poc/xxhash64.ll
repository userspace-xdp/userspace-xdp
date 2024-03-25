; ModuleID = 'xxhash64.c'
source_filename = "xxhash64.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind readonly uwtable
define dso_local i64 @xxhash64(ptr nocapture noundef readonly %0, i64 noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp ugt i64 %1, 31
  br i1 %4, label %5, label %218

5:                                                ; preds = %3
  %6 = add i64 %2, 6983438078262162902
  %7 = add i64 %2, -4417276706812531889
  %8 = add i64 %2, 7046029288634856825
  br label %9

9:                                                ; preds = %5, %9
  %10 = phi i64 [ %184, %9 ], [ %8, %5 ]
  %11 = phi i64 [ %142, %9 ], [ %2, %5 ]
  %12 = phi i64 [ %100, %9 ], [ %7, %5 ]
  %13 = phi i64 [ %58, %9 ], [ %6, %5 ]
  %14 = phi i64 [ %17, %9 ], [ %1, %5 ]
  %15 = phi ptr [ %16, %9 ], [ %0, %5 ]
  %16 = getelementptr inbounds i8, ptr %15, i64 32
  %17 = add i64 %14, -32
  %18 = load i8, ptr %15, align 1, !tbaa !5
  %19 = zext i8 %18 to i64
  %20 = getelementptr inbounds i8, ptr %15, i64 1
  %21 = load i8, ptr %20, align 1, !tbaa !5
  %22 = zext i8 %21 to i64
  %23 = shl nuw nsw i64 %22, 8
  %24 = or i64 %23, %19
  %25 = getelementptr inbounds i8, ptr %15, i64 2
  %26 = load i8, ptr %25, align 1, !tbaa !5
  %27 = zext i8 %26 to i64
  %28 = shl nuw nsw i64 %27, 16
  %29 = or i64 %24, %28
  %30 = getelementptr inbounds i8, ptr %15, i64 3
  %31 = load i8, ptr %30, align 1, !tbaa !5
  %32 = zext i8 %31 to i64
  %33 = shl nuw nsw i64 %32, 24
  %34 = or i64 %29, %33
  %35 = getelementptr inbounds i8, ptr %15, i64 4
  %36 = load i8, ptr %35, align 1, !tbaa !5
  %37 = zext i8 %36 to i64
  %38 = shl nuw nsw i64 %37, 32
  %39 = or i64 %34, %38
  %40 = getelementptr inbounds i8, ptr %15, i64 5
  %41 = load i8, ptr %40, align 1, !tbaa !5
  %42 = zext i8 %41 to i64
  %43 = shl nuw nsw i64 %42, 40
  %44 = or i64 %39, %43
  %45 = getelementptr inbounds i8, ptr %15, i64 6
  %46 = load i8, ptr %45, align 1, !tbaa !5
  %47 = zext i8 %46 to i64
  %48 = shl nuw nsw i64 %47, 48
  %49 = or i64 %44, %48
  %50 = getelementptr inbounds i8, ptr %15, i64 7
  %51 = load i8, ptr %50, align 1, !tbaa !5
  %52 = zext i8 %51 to i64
  %53 = shl nuw i64 %52, 56
  %54 = or i64 %49, %53
  %55 = mul i64 %54, -4417276706812531889
  %56 = add i64 %55, %13
  %57 = tail call i64 @llvm.fshl.i64(i64 %56, i64 %56, i64 31)
  %58 = mul i64 %57, -7046029288634856825
  %59 = getelementptr inbounds i8, ptr %15, i64 8
  %60 = load i8, ptr %59, align 1, !tbaa !5
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds i8, ptr %15, i64 9
  %63 = load i8, ptr %62, align 1, !tbaa !5
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 8
  %66 = or i64 %65, %61
  %67 = getelementptr inbounds i8, ptr %15, i64 10
  %68 = load i8, ptr %67, align 1, !tbaa !5
  %69 = zext i8 %68 to i64
  %70 = shl nuw nsw i64 %69, 16
  %71 = or i64 %66, %70
  %72 = getelementptr inbounds i8, ptr %15, i64 11
  %73 = load i8, ptr %72, align 1, !tbaa !5
  %74 = zext i8 %73 to i64
  %75 = shl nuw nsw i64 %74, 24
  %76 = or i64 %71, %75
  %77 = getelementptr inbounds i8, ptr %15, i64 12
  %78 = load i8, ptr %77, align 1, !tbaa !5
  %79 = zext i8 %78 to i64
  %80 = shl nuw nsw i64 %79, 32
  %81 = or i64 %76, %80
  %82 = getelementptr inbounds i8, ptr %15, i64 13
  %83 = load i8, ptr %82, align 1, !tbaa !5
  %84 = zext i8 %83 to i64
  %85 = shl nuw nsw i64 %84, 40
  %86 = or i64 %81, %85
  %87 = getelementptr inbounds i8, ptr %15, i64 14
  %88 = load i8, ptr %87, align 1, !tbaa !5
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 48
  %91 = or i64 %86, %90
  %92 = getelementptr inbounds i8, ptr %15, i64 15
  %93 = load i8, ptr %92, align 1, !tbaa !5
  %94 = zext i8 %93 to i64
  %95 = shl nuw i64 %94, 56
  %96 = or i64 %91, %95
  %97 = mul i64 %96, -4417276706812531889
  %98 = add i64 %97, %12
  %99 = tail call i64 @llvm.fshl.i64(i64 %98, i64 %98, i64 31)
  %100 = mul i64 %99, -7046029288634856825
  %101 = getelementptr inbounds i8, ptr %15, i64 16
  %102 = load i8, ptr %101, align 1, !tbaa !5
  %103 = zext i8 %102 to i64
  %104 = getelementptr inbounds i8, ptr %15, i64 17
  %105 = load i8, ptr %104, align 1, !tbaa !5
  %106 = zext i8 %105 to i64
  %107 = shl nuw nsw i64 %106, 8
  %108 = or i64 %107, %103
  %109 = getelementptr inbounds i8, ptr %15, i64 18
  %110 = load i8, ptr %109, align 1, !tbaa !5
  %111 = zext i8 %110 to i64
  %112 = shl nuw nsw i64 %111, 16
  %113 = or i64 %108, %112
  %114 = getelementptr inbounds i8, ptr %15, i64 19
  %115 = load i8, ptr %114, align 1, !tbaa !5
  %116 = zext i8 %115 to i64
  %117 = shl nuw nsw i64 %116, 24
  %118 = or i64 %113, %117
  %119 = getelementptr inbounds i8, ptr %15, i64 20
  %120 = load i8, ptr %119, align 1, !tbaa !5
  %121 = zext i8 %120 to i64
  %122 = shl nuw nsw i64 %121, 32
  %123 = or i64 %118, %122
  %124 = getelementptr inbounds i8, ptr %15, i64 21
  %125 = load i8, ptr %124, align 1, !tbaa !5
  %126 = zext i8 %125 to i64
  %127 = shl nuw nsw i64 %126, 40
  %128 = or i64 %123, %127
  %129 = getelementptr inbounds i8, ptr %15, i64 22
  %130 = load i8, ptr %129, align 1, !tbaa !5
  %131 = zext i8 %130 to i64
  %132 = shl nuw nsw i64 %131, 48
  %133 = or i64 %128, %132
  %134 = getelementptr inbounds i8, ptr %15, i64 23
  %135 = load i8, ptr %134, align 1, !tbaa !5
  %136 = zext i8 %135 to i64
  %137 = shl nuw i64 %136, 56
  %138 = or i64 %133, %137
  %139 = mul i64 %138, -4417276706812531889
  %140 = add i64 %139, %11
  %141 = tail call i64 @llvm.fshl.i64(i64 %140, i64 %140, i64 31)
  %142 = mul i64 %141, -7046029288634856825
  %143 = getelementptr inbounds i8, ptr %15, i64 24
  %144 = load i8, ptr %143, align 1, !tbaa !5
  %145 = zext i8 %144 to i64
  %146 = getelementptr inbounds i8, ptr %15, i64 25
  %147 = load i8, ptr %146, align 1, !tbaa !5
  %148 = zext i8 %147 to i64
  %149 = shl nuw nsw i64 %148, 8
  %150 = or i64 %149, %145
  %151 = getelementptr inbounds i8, ptr %15, i64 26
  %152 = load i8, ptr %151, align 1, !tbaa !5
  %153 = zext i8 %152 to i64
  %154 = shl nuw nsw i64 %153, 16
  %155 = or i64 %150, %154
  %156 = getelementptr inbounds i8, ptr %15, i64 27
  %157 = load i8, ptr %156, align 1, !tbaa !5
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 24
  %160 = or i64 %155, %159
  %161 = getelementptr inbounds i8, ptr %15, i64 28
  %162 = load i8, ptr %161, align 1, !tbaa !5
  %163 = zext i8 %162 to i64
  %164 = shl nuw nsw i64 %163, 32
  %165 = or i64 %160, %164
  %166 = getelementptr inbounds i8, ptr %15, i64 29
  %167 = load i8, ptr %166, align 1, !tbaa !5
  %168 = zext i8 %167 to i64
  %169 = shl nuw nsw i64 %168, 40
  %170 = or i64 %165, %169
  %171 = getelementptr inbounds i8, ptr %15, i64 30
  %172 = load i8, ptr %171, align 1, !tbaa !5
  %173 = zext i8 %172 to i64
  %174 = shl nuw nsw i64 %173, 48
  %175 = or i64 %170, %174
  %176 = getelementptr inbounds i8, ptr %15, i64 31
  %177 = load i8, ptr %176, align 1, !tbaa !5
  %178 = zext i8 %177 to i64
  %179 = shl nuw i64 %178, 56
  %180 = or i64 %175, %179
  %181 = mul i64 %180, -4417276706812531889
  %182 = add i64 %181, %10
  %183 = tail call i64 @llvm.fshl.i64(i64 %182, i64 %182, i64 31)
  %184 = mul i64 %183, -7046029288634856825
  %185 = icmp ugt i64 %17, 31
  br i1 %185, label %9, label %186

186:                                              ; preds = %9
  %187 = tail call i64 @llvm.fshl.i64(i64 %58, i64 %58, i64 1)
  %188 = tail call i64 @llvm.fshl.i64(i64 %100, i64 %100, i64 7)
  %189 = add i64 %188, %187
  %190 = tail call i64 @llvm.fshl.i64(i64 %142, i64 %142, i64 12)
  %191 = add i64 %189, %190
  %192 = tail call i64 @llvm.fshl.i64(i64 %184, i64 %184, i64 18)
  %193 = add i64 %191, %192
  %194 = mul i64 %57, -2381459717836149591
  %195 = tail call i64 @llvm.fshl.i64(i64 %194, i64 %194, i64 31)
  %196 = mul i64 %195, -7046029288634856825
  %197 = xor i64 %193, %196
  %198 = mul i64 %197, -7046029288634856825
  %199 = add i64 %198, -8796714831421723037
  %200 = mul i64 %99, -2381459717836149591
  %201 = tail call i64 @llvm.fshl.i64(i64 %200, i64 %200, i64 31)
  %202 = mul i64 %201, -7046029288634856825
  %203 = xor i64 %199, %202
  %204 = mul i64 %203, -7046029288634856825
  %205 = add i64 %204, -8796714831421723037
  %206 = mul i64 %141, -2381459717836149591
  %207 = tail call i64 @llvm.fshl.i64(i64 %206, i64 %206, i64 31)
  %208 = mul i64 %207, -7046029288634856825
  %209 = xor i64 %205, %208
  %210 = mul i64 %209, -7046029288634856825
  %211 = add i64 %210, -8796714831421723037
  %212 = mul i64 %183, -2381459717836149591
  %213 = tail call i64 @llvm.fshl.i64(i64 %212, i64 %212, i64 31)
  %214 = mul i64 %213, -7046029288634856825
  %215 = xor i64 %211, %214
  %216 = mul i64 %215, -7046029288634856825
  %217 = add i64 %216, -8796714831421723037
  br label %220

218:                                              ; preds = %3
  %219 = add i64 %2, 2870177450012600261
  br label %220

220:                                              ; preds = %218, %186
  %221 = phi i64 [ %217, %186 ], [ %219, %218 ]
  %222 = add i64 %221, %1
  %223 = and i64 %1, -32
  %224 = getelementptr inbounds i8, ptr %0, i64 %223
  %225 = and i64 %1, 31
  br label %226

226:                                              ; preds = %276, %220
  %227 = phi i64 [ %222, %220 ], [ %279, %276 ]
  %228 = phi ptr [ %224, %220 ], [ %280, %276 ]
  %229 = phi i64 [ %225, %220 ], [ %281, %276 ]
  %230 = icmp ugt i64 %229, 7
  br i1 %230, label %231, label %282

231:                                              ; preds = %226
  %232 = load i8, ptr %228, align 1, !tbaa !5
  %233 = zext i8 %232 to i64
  %234 = getelementptr inbounds i8, ptr %228, i64 1
  %235 = load i8, ptr %234, align 1, !tbaa !5
  %236 = zext i8 %235 to i64
  %237 = shl nuw nsw i64 %236, 8
  %238 = or i64 %237, %233
  %239 = getelementptr inbounds i8, ptr %228, i64 2
  %240 = load i8, ptr %239, align 1, !tbaa !5
  %241 = zext i8 %240 to i64
  %242 = shl nuw nsw i64 %241, 16
  %243 = or i64 %238, %242
  %244 = getelementptr inbounds i8, ptr %228, i64 3
  %245 = load i8, ptr %244, align 1, !tbaa !5
  %246 = zext i8 %245 to i64
  %247 = shl nuw nsw i64 %246, 24
  %248 = or i64 %243, %247
  %249 = getelementptr inbounds i8, ptr %228, i64 4
  %250 = load i8, ptr %249, align 1, !tbaa !5
  %251 = zext i8 %250 to i64
  %252 = shl nuw nsw i64 %251, 32
  %253 = or i64 %248, %252
  %254 = getelementptr inbounds i8, ptr %228, i64 5
  %255 = load i8, ptr %254, align 1, !tbaa !5
  %256 = zext i8 %255 to i64
  %257 = shl nuw nsw i64 %256, 40
  %258 = or i64 %253, %257
  %259 = getelementptr inbounds i8, ptr %228, i64 6
  %260 = load i8, ptr %259, align 1, !tbaa !5
  %261 = zext i8 %260 to i64
  %262 = shl nuw nsw i64 %261, 48
  %263 = or i64 %258, %262
  %264 = getelementptr inbounds i8, ptr %228, i64 7
  %265 = load i8, ptr %264, align 1, !tbaa !5
  %266 = zext i8 %265 to i64
  %267 = shl nuw i64 %266, 56
  %268 = or i64 %263, %267
  %269 = mul i64 %268, -4417276706812531889
  %270 = tail call i64 @llvm.fshl.i64(i64 %269, i64 %269, i64 31)
  %271 = mul i64 %270, -7046029288634856825
  %272 = xor i64 %271, %227
  %273 = tail call i64 @llvm.fshl.i64(i64 %272, i64 %272, i64 27)
  %274 = mul i64 %273, -7046029288634856825
  %275 = add i64 %274, -8796714831421723037
  br label %276

276:                                              ; preds = %309, %284, %231
  %277 = phi i64 [ 8, %231 ], [ 4, %284 ], [ 1, %309 ]
  %278 = phi i64 [ -8, %231 ], [ -4, %284 ], [ -1, %309 ]
  %279 = phi i64 [ %275, %231 ], [ %306, %284 ], [ %315, %309 ]
  %280 = getelementptr inbounds i8, ptr %228, i64 %277
  %281 = add i64 %278, %229
  br label %226

282:                                              ; preds = %226
  %283 = icmp ugt i64 %229, 3
  br i1 %283, label %284, label %307

284:                                              ; preds = %282
  %285 = load i8, ptr %228, align 1, !tbaa !5
  %286 = zext i8 %285 to i64
  %287 = getelementptr inbounds i8, ptr %228, i64 1
  %288 = load i8, ptr %287, align 1, !tbaa !5
  %289 = zext i8 %288 to i64
  %290 = shl nuw nsw i64 %289, 8
  %291 = or i64 %290, %286
  %292 = getelementptr inbounds i8, ptr %228, i64 2
  %293 = load i8, ptr %292, align 1, !tbaa !5
  %294 = zext i8 %293 to i64
  %295 = shl nuw nsw i64 %294, 16
  %296 = or i64 %291, %295
  %297 = getelementptr inbounds i8, ptr %228, i64 3
  %298 = load i8, ptr %297, align 1, !tbaa !5
  %299 = zext i8 %298 to i64
  %300 = shl nuw nsw i64 %299, 24
  %301 = or i64 %296, %300
  %302 = mul i64 %301, -7046029288634856825
  %303 = xor i64 %302, %227
  %304 = tail call i64 @llvm.fshl.i64(i64 %303, i64 %303, i64 23)
  %305 = mul i64 %304, -4417276706812531889
  %306 = add i64 %305, 1609587929392839161
  br label %276

307:                                              ; preds = %282
  %308 = icmp eq i64 %229, 0
  br i1 %308, label %316, label %309

309:                                              ; preds = %307
  %310 = load i8, ptr %228, align 1, !tbaa !5
  %311 = zext i8 %310 to i64
  %312 = mul i64 %311, 2870177450012600261
  %313 = xor i64 %312, %227
  %314 = tail call i64 @llvm.fshl.i64(i64 %313, i64 %313, i64 11)
  %315 = mul i64 %314, -7046029288634856825
  br label %276

316:                                              ; preds = %307
  %317 = lshr i64 %227, 33
  %318 = xor i64 %317, %227
  %319 = mul i64 %318, -4417276706812531889
  %320 = lshr i64 %319, 29
  %321 = xor i64 %320, %319
  %322 = mul i64 %321, 1609587929392839161
  %323 = lshr i64 %322, 32
  %324 = xor i64 %323, %322
  ret i64 %324
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.fshl.i64(i64, i64, i64) #1

attributes #0 = { nofree nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 15.0.7"}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}

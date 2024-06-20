; ModuleID = 'xdp-maps.bpf.c'
source_filename = "xdp-maps.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.bpftime_hash_map_t = type { i32, i32, i32, i8* }
%struct.anon = type { [1 x i32]*, [8192 x i32]*, i32*, i32* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

@__packet_size_distribute_data = dso_local global [6656 x i8] zeroinitializer, align 16
@__packet_size_distribute = dso_local local_unnamed_addr global %struct.bpftime_hash_map_t { i32 128, i32 16, i32 32, i8* getelementptr inbounds ([6656 x i8], [6656 x i8]* @__packet_size_distribute_data, i32 0, i32 0) }, align 8
@__license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@packet_size_distribute = dso_local local_unnamed_addr global %struct.anon zeroinitializer, align 8

; Function Attrs: nofree nosync nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to %struct.xdp_md*
  %3 = tail call i32 @xdp_pass(%struct.xdp_md* noundef %2)
  ret i32 %3
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nosync nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !5
  %6 = inttoptr i64 %5 to i8*
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !11
  %9 = inttoptr i64 %8 to i8*
  %10 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %10) #2
  %11 = sub i64 %8, %5
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %2, align 4, !tbaa !12
  %13 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %13) #2
  store i32 0, i32* %3, align 4, !tbaa !12
  %14 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 1), align 4, !tbaa !13
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %109, label %16

16:                                               ; preds = %1
  %17 = trunc i64 %11 to i32
  %18 = zext i32 %14 to i64
  %19 = and i32 %17, 255
  %20 = icmp eq i32 %14, 1
  br i1 %20, label %75, label %21, !llvm.loop !16

21:                                               ; preds = %16
  %22 = add nsw i64 %18, -1
  %23 = add nsw i64 %18, -2
  %24 = and i64 %22, 3
  %25 = icmp ult i64 %23, 3
  br i1 %25, label %58, label %26

26:                                               ; preds = %21
  %27 = and i64 %22, -4
  br label %28

28:                                               ; preds = %28, %26
  %29 = phi i64 [ 1, %26 ], [ %55, %28 ]
  %30 = phi i32 [ %19, %26 ], [ %54, %28 ]
  %31 = phi i64 [ 0, %26 ], [ %56, %28 ]
  %32 = getelementptr inbounds i8, i8* %10, i64 %29
  %33 = load i8, i8* %32, align 1, !tbaa !18
  %34 = mul i32 %30, 31
  %35 = zext i8 %33 to i32
  %36 = add i32 %34, %35
  %37 = add nuw nsw i64 %29, 1
  %38 = getelementptr inbounds i8, i8* %10, i64 %37
  %39 = load i8, i8* %38, align 1, !tbaa !18
  %40 = mul i32 %36, 31
  %41 = zext i8 %39 to i32
  %42 = add i32 %40, %41
  %43 = add nuw nsw i64 %29, 2
  %44 = getelementptr inbounds i8, i8* %10, i64 %43
  %45 = load i8, i8* %44, align 1, !tbaa !18
  %46 = mul i32 %42, 31
  %47 = zext i8 %45 to i32
  %48 = add i32 %46, %47
  %49 = add nuw nsw i64 %29, 3
  %50 = getelementptr inbounds i8, i8* %10, i64 %49
  %51 = load i8, i8* %50, align 1, !tbaa !18
  %52 = mul i32 %48, 31
  %53 = zext i8 %51 to i32
  %54 = add i32 %52, %53
  %55 = add nuw nsw i64 %29, 4
  %56 = add i64 %31, 4
  %57 = icmp eq i64 %56, %27
  br i1 %57, label %58, label %28, !llvm.loop !16

58:                                               ; preds = %28, %21
  %59 = phi i32 [ undef, %21 ], [ %54, %28 ]
  %60 = phi i64 [ 1, %21 ], [ %55, %28 ]
  %61 = phi i32 [ %19, %21 ], [ %54, %28 ]
  %62 = icmp eq i64 %24, 0
  br i1 %62, label %75, label %63

63:                                               ; preds = %58, %63
  %64 = phi i64 [ %72, %63 ], [ %60, %58 ]
  %65 = phi i32 [ %71, %63 ], [ %61, %58 ]
  %66 = phi i64 [ %73, %63 ], [ 0, %58 ]
  %67 = getelementptr inbounds i8, i8* %10, i64 %64
  %68 = load i8, i8* %67, align 1, !tbaa !18
  %69 = mul i32 %65, 31
  %70 = zext i8 %68 to i32
  %71 = add i32 %69, %70
  %72 = add nuw nsw i64 %64, 1
  %73 = add i64 %66, 1
  %74 = icmp eq i64 %73, %24
  br i1 %74, label %75, label %63, !llvm.loop !19

75:                                               ; preds = %58, %63, %16
  %76 = phi i32 [ %19, %16 ], [ %59, %58 ], [ %71, %63 ]
  %77 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 0), align 8, !tbaa !21
  %78 = urem i32 %76, %77
  %79 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !22
  %80 = add i32 %14, 4
  %81 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !23
  %82 = add i32 %81, %80
  br label %83

83:                                               ; preds = %105, %75
  %84 = phi i32 [ %107, %105 ], [ %78, %75 ]
  %85 = mul i32 %84, %82
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds i8, i8* %79, i64 %86
  %88 = bitcast i8* %87 to i32*
  %89 = load i32, i32* %88, align 4, !tbaa !12
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %124, label %91

91:                                               ; preds = %83
  %92 = add i32 %85, 4
  %93 = zext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8* %79, i64 %93
  br label %97

95:                                               ; preds = %97
  %96 = icmp eq i64 %104, %18
  br i1 %96, label %114, label %97, !llvm.loop !24

97:                                               ; preds = %95, %91
  %98 = phi i64 [ 0, %91 ], [ %104, %95 ]
  %99 = getelementptr inbounds i8, i8* %94, i64 %98
  %100 = load i8, i8* %99, align 1, !tbaa !18
  %101 = getelementptr inbounds i8, i8* %10, i64 %98
  %102 = load i8, i8* %101, align 1, !tbaa !18
  %103 = icmp eq i8 %100, %102
  %104 = add nuw nsw i64 %98, 1
  br i1 %103, label %95, label %105

105:                                              ; preds = %97
  %106 = add i32 %84, 1
  %107 = urem i32 %106, %77
  %108 = icmp eq i32 %107, %78
  br i1 %108, label %124, label %83, !llvm.loop !25

109:                                              ; preds = %1
  %110 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !22
  %111 = bitcast i8* %110 to i32*
  %112 = load i32, i32* %111, align 4, !tbaa !12
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %216, label %117

114:                                              ; preds = %95
  %115 = add i32 %85, %80
  %116 = zext i32 %115 to i64
  br label %117

117:                                              ; preds = %114, %109
  %118 = phi i8* [ %110, %109 ], [ %79, %114 ]
  %119 = phi i64 [ 4, %109 ], [ %116, %114 ]
  %120 = getelementptr inbounds i8, i8* %118, i64 %119
  %121 = bitcast i8* %120 to i32*
  %122 = load i32, i32* %121, align 4, !tbaa !12
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %3, align 4, !tbaa !12
  br label %124

124:                                              ; preds = %83, %105, %117
  %125 = phi i8* [ %118, %117 ], [ %79, %105 ], [ %79, %83 ]
  br i1 %15, label %216, label %126

126:                                              ; preds = %124
  %127 = zext i32 %14 to i64
  %128 = add nsw i64 %127, -1
  %129 = and i64 %127, 3
  %130 = icmp ult i64 %128, 3
  br i1 %130, label %163, label %131

131:                                              ; preds = %126
  %132 = and i64 %127, 4294967292
  br label %133

133:                                              ; preds = %133, %131
  %134 = phi i64 [ 0, %131 ], [ %160, %133 ]
  %135 = phi i32 [ 0, %131 ], [ %159, %133 ]
  %136 = phi i64 [ 0, %131 ], [ %161, %133 ]
  %137 = mul i32 %135, 31
  %138 = getelementptr inbounds i8, i8* %10, i64 %134
  %139 = load i8, i8* %138, align 4, !tbaa !18
  %140 = zext i8 %139 to i32
  %141 = add i32 %137, %140
  %142 = or i64 %134, 1
  %143 = mul i32 %141, 31
  %144 = getelementptr inbounds i8, i8* %10, i64 %142
  %145 = load i8, i8* %144, align 1, !tbaa !18
  %146 = zext i8 %145 to i32
  %147 = add i32 %143, %146
  %148 = or i64 %134, 2
  %149 = mul i32 %147, 31
  %150 = getelementptr inbounds i8, i8* %10, i64 %148
  %151 = load i8, i8* %150, align 2, !tbaa !18
  %152 = zext i8 %151 to i32
  %153 = add i32 %149, %152
  %154 = or i64 %134, 3
  %155 = mul i32 %153, 31
  %156 = getelementptr inbounds i8, i8* %10, i64 %154
  %157 = load i8, i8* %156, align 1, !tbaa !18
  %158 = zext i8 %157 to i32
  %159 = add i32 %155, %158
  %160 = add nuw nsw i64 %134, 4
  %161 = add i64 %136, 4
  %162 = icmp eq i64 %161, %132
  br i1 %162, label %163, label %133, !llvm.loop !16

163:                                              ; preds = %133, %126
  %164 = phi i32 [ undef, %126 ], [ %159, %133 ]
  %165 = phi i64 [ 0, %126 ], [ %160, %133 ]
  %166 = phi i32 [ 0, %126 ], [ %159, %133 ]
  %167 = icmp eq i64 %129, 0
  br i1 %167, label %180, label %168

168:                                              ; preds = %163, %168
  %169 = phi i64 [ %177, %168 ], [ %165, %163 ]
  %170 = phi i32 [ %176, %168 ], [ %166, %163 ]
  %171 = phi i64 [ %178, %168 ], [ 0, %163 ]
  %172 = mul i32 %170, 31
  %173 = getelementptr inbounds i8, i8* %10, i64 %169
  %174 = load i8, i8* %173, align 1, !tbaa !18
  %175 = zext i8 %174 to i32
  %176 = add i32 %172, %175
  %177 = add nuw nsw i64 %169, 1
  %178 = add i64 %171, 1
  %179 = icmp eq i64 %178, %129
  br i1 %179, label %180, label %168, !llvm.loop !26

180:                                              ; preds = %168, %163
  %181 = phi i32 [ %164, %163 ], [ %176, %168 ]
  %182 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 0), align 8
  %183 = urem i32 %181, %182
  %184 = add i32 %14, 4
  %185 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !23
  %186 = add i32 %184, %185
  br label %187

187:                                              ; preds = %209, %180
  %188 = phi i32 [ %211, %209 ], [ %183, %180 ]
  %189 = mul i32 %188, %186
  %190 = add i32 %189, 4
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds i8, i8* %125, i64 %191
  %193 = zext i32 %189 to i64
  %194 = getelementptr inbounds i8, i8* %125, i64 %193
  %195 = bitcast i8* %194 to i32*
  %196 = load i32, i32* %195, align 4, !tbaa !12
  %197 = icmp eq i32 %196, 0
  br i1 %197, label %200, label %201

198:                                              ; preds = %201
  %199 = icmp eq i64 %208, %127
  br i1 %199, label %200, label %201, !llvm.loop !27

200:                                              ; preds = %187, %198
  br label %227

201:                                              ; preds = %187, %198
  %202 = phi i64 [ %208, %198 ], [ 0, %187 ]
  %203 = getelementptr inbounds i8, i8* %192, i64 %202
  %204 = load i8, i8* %203, align 1, !tbaa !18
  %205 = getelementptr inbounds i8, i8* %10, i64 %202
  %206 = load i8, i8* %205, align 1, !tbaa !18
  %207 = icmp eq i8 %204, %206
  %208 = add nuw nsw i64 %202, 1
  br i1 %207, label %198, label %209

209:                                              ; preds = %201
  %210 = add i32 %188, 1
  %211 = urem i32 %210, %182
  %212 = icmp eq i32 %211, %183
  br i1 %212, label %257, label %187, !llvm.loop !28

213:                                              ; preds = %227
  %214 = add i32 %233, 4
  %215 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !22
  br label %216

216:                                              ; preds = %109, %213, %124
  %217 = phi i8* [ %125, %124 ], [ %215, %213 ], [ %110, %109 ]
  %218 = phi i32 [ 0, %124 ], [ %188, %213 ], [ 0, %109 ]
  %219 = phi i32 [ 4, %124 ], [ %214, %213 ], [ 4, %109 ]
  %220 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !23
  %221 = add i32 %220, %219
  %222 = mul i32 %221, %218
  %223 = add i32 %222, %219
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds i8, i8* %217, i64 %224
  %226 = icmp eq i32 %220, 0
  br i1 %226, label %241, label %248

227:                                              ; preds = %200, %227
  %228 = phi i64 [ %232, %227 ], [ 0, %200 ]
  %229 = getelementptr inbounds i8, i8* %10, i64 %228
  %230 = load i8, i8* %229, align 1, !tbaa !18
  %231 = getelementptr inbounds i8, i8* %192, i64 %228
  store i8 %230, i8* %231, align 1, !tbaa !18
  %232 = add nuw nsw i64 %228, 1
  %233 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 1), align 4, !tbaa !13
  %234 = zext i32 %233 to i64
  %235 = icmp ult i64 %232, %234
  br i1 %235, label %227, label %213, !llvm.loop !29

236:                                              ; preds = %248
  %237 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 3), align 8, !tbaa !22
  %238 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 1), align 4, !tbaa !13
  %239 = add i32 %254, 4
  %240 = add i32 %239, %238
  br label %241

241:                                              ; preds = %236, %216
  %242 = phi i32 [ %240, %236 ], [ %219, %216 ]
  %243 = phi i8* [ %237, %236 ], [ %217, %216 ]
  %244 = mul i32 %242, %218
  %245 = zext i32 %244 to i64
  %246 = getelementptr inbounds i8, i8* %243, i64 %245
  %247 = bitcast i8* %246 to i32*
  store i32 1, i32* %247, align 4, !tbaa !12
  br label %257

248:                                              ; preds = %216, %248
  %249 = phi i64 [ %253, %248 ], [ 0, %216 ]
  %250 = getelementptr inbounds i8, i8* %13, i64 %249
  %251 = load i8, i8* %250, align 1, !tbaa !18
  %252 = getelementptr inbounds i8, i8* %225, i64 %249
  store i8 %251, i8* %252, align 1, !tbaa !18
  %253 = add nuw nsw i64 %249, 1
  %254 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__packet_size_distribute, i64 0, i32 2), align 8, !tbaa !23
  %255 = zext i32 %254 to i64
  %256 = icmp ult i64 %253, %255
  br i1 %256, label %248, label %236, !llvm.loop !30

257:                                              ; preds = %209, %241
  %258 = getelementptr i8, i8* %6, i64 14
  %259 = icmp ugt i8* %258, %9
  br i1 %259, label %278, label %260

260:                                              ; preds = %257
  %261 = inttoptr i64 %5 to i16*
  %262 = load i16, i16* %261, align 2, !tbaa !31
  %263 = getelementptr inbounds i8, i8* %6, i64 2
  %264 = bitcast i8* %263 to i16*
  %265 = load i16, i16* %264, align 2, !tbaa !31
  %266 = getelementptr inbounds i8, i8* %6, i64 4
  %267 = bitcast i8* %266 to i16*
  %268 = load i16, i16* %267, align 2, !tbaa !31
  %269 = getelementptr inbounds i8, i8* %6, i64 6
  %270 = bitcast i8* %269 to i16*
  %271 = load i16, i16* %270, align 2, !tbaa !31
  store i16 %271, i16* %261, align 2, !tbaa !31
  %272 = getelementptr inbounds i8, i8* %6, i64 8
  %273 = bitcast i8* %272 to i16*
  %274 = load i16, i16* %273, align 2, !tbaa !31
  store i16 %274, i16* %264, align 2, !tbaa !31
  %275 = getelementptr inbounds i8, i8* %6, i64 10
  %276 = bitcast i8* %275 to i16*
  %277 = load i16, i16* %276, align 2, !tbaa !31
  store i16 %277, i16* %267, align 2, !tbaa !31
  store i16 %262, i16* %270, align 2, !tbaa !31
  store i16 %265, i16* %273, align 2, !tbaa !31
  store i16 %268, i16* %276, align 2, !tbaa !31
  br label %278

278:                                              ; preds = %257, %260
  %279 = phi i32 [ 3, %260 ], [ 1, %257 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %13) #2
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %10) #2
  ret i32 %279
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !7, i64 0}
!6 = !{!"xdp_md", !7, i64 0, !7, i64 8, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28}
!7 = !{!"long long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!6, !7, i64 8}
!12 = !{!10, !10, i64 0}
!13 = !{!14, !10, i64 4}
!14 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8, !15, i64 16}
!15 = !{!"any pointer", !8, i64 0}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!8, !8, i64 0}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = !{!14, !10, i64 0}
!22 = !{!14, !15, i64 16}
!23 = !{!14, !10, i64 8}
!24 = distinct !{!24, !17}
!25 = distinct !{!25, !17}
!26 = distinct !{!26, !20}
!27 = distinct !{!27, !17}
!28 = distinct !{!28, !17}
!29 = distinct !{!29, !17}
!30 = distinct !{!30, !17}
!31 = !{!32, !32, i64 0}
!32 = !{!"short", !8, i64 0}

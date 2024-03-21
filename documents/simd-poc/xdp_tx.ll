; ModuleID = 'xdp_tx.bpf.c'
source_filename = "xdp_tx.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local i32 @batch_xdp_pass(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = load ptr, ptr %0, align 8, !tbaa !5
  %3 = getelementptr inbounds %struct.xdp_md, ptr %2, i64 0, i32 1
  %4 = load i64, ptr %3, align 8, !tbaa !9
  %5 = inttoptr i64 %4 to ptr
  %6 = load i64, ptr %2, align 8, !tbaa !13
  %7 = inttoptr i64 %6 to ptr
  %8 = getelementptr i8, ptr %7, i64 14
  %9 = icmp ugt ptr %8, %5
  br i1 %9, label %18, label %10

10:                                               ; preds = %1
  %11 = getelementptr inbounds i16, ptr %7, i64 2
  %12 = load i16, ptr %11, align 2, !tbaa !14
  %13 = getelementptr inbounds i16, ptr %7, i64 3
  %14 = load <2 x i16>, ptr %13, align 2, !tbaa !14
  %15 = getelementptr inbounds i16, ptr %7, i64 5
  %16 = load i16, ptr %15, align 2, !tbaa !14
  store i16 %16, ptr %11, align 2, !tbaa !14
  %17 = load <2 x i16>, ptr %7, align 2, !tbaa !14
  store <2 x i16> %14, ptr %7, align 2, !tbaa !14
  store <2 x i16> %17, ptr %13, align 2, !tbaa !14
  store i16 %12, ptr %15, align 2, !tbaa !14
  br label %18

18:                                               ; preds = %1, %10
  %19 = getelementptr inbounds ptr, ptr %0, i64 1
  %20 = load ptr, ptr %19, align 8, !tbaa !5
  %21 = getelementptr inbounds %struct.xdp_md, ptr %20, i64 0, i32 1
  %22 = load i64, ptr %21, align 8, !tbaa !9
  %23 = inttoptr i64 %22 to ptr
  %24 = load i64, ptr %20, align 8, !tbaa !13
  %25 = inttoptr i64 %24 to ptr
  %26 = getelementptr i8, ptr %25, i64 14
  %27 = icmp ugt ptr %26, %23
  br i1 %27, label %36, label %28

28:                                               ; preds = %18
  %29 = getelementptr inbounds i16, ptr %25, i64 2
  %30 = load i16, ptr %29, align 2, !tbaa !14
  %31 = getelementptr inbounds i16, ptr %25, i64 3
  %32 = load <2 x i16>, ptr %31, align 2, !tbaa !14
  %33 = getelementptr inbounds i16, ptr %25, i64 5
  %34 = load i16, ptr %33, align 2, !tbaa !14
  store i16 %34, ptr %29, align 2, !tbaa !14
  %35 = load <2 x i16>, ptr %25, align 2, !tbaa !14
  store <2 x i16> %32, ptr %25, align 2, !tbaa !14
  store <2 x i16> %35, ptr %31, align 2, !tbaa !14
  store i16 %30, ptr %33, align 2, !tbaa !14
  br label %36

36:                                               ; preds = %28, %18
  %37 = getelementptr inbounds ptr, ptr %0, i64 2
  %38 = load ptr, ptr %37, align 8, !tbaa !5
  %39 = getelementptr inbounds %struct.xdp_md, ptr %38, i64 0, i32 1
  %40 = load i64, ptr %39, align 8, !tbaa !9
  %41 = inttoptr i64 %40 to ptr
  %42 = load i64, ptr %38, align 8, !tbaa !13
  %43 = inttoptr i64 %42 to ptr
  %44 = getelementptr i8, ptr %43, i64 14
  %45 = icmp ugt ptr %44, %41
  br i1 %45, label %54, label %46

46:                                               ; preds = %36
  %47 = getelementptr inbounds i16, ptr %43, i64 2
  %48 = load i16, ptr %47, align 2, !tbaa !14
  %49 = getelementptr inbounds i16, ptr %43, i64 3
  %50 = load <2 x i16>, ptr %49, align 2, !tbaa !14
  %51 = getelementptr inbounds i16, ptr %43, i64 5
  %52 = load i16, ptr %51, align 2, !tbaa !14
  store i16 %52, ptr %47, align 2, !tbaa !14
  %53 = load <2 x i16>, ptr %43, align 2, !tbaa !14
  store <2 x i16> %50, ptr %43, align 2, !tbaa !14
  store <2 x i16> %53, ptr %49, align 2, !tbaa !14
  store i16 %48, ptr %51, align 2, !tbaa !14
  br label %54

54:                                               ; preds = %46, %36
  %55 = getelementptr inbounds ptr, ptr %0, i64 3
  %56 = load ptr, ptr %55, align 8, !tbaa !5
  %57 = getelementptr inbounds %struct.xdp_md, ptr %56, i64 0, i32 1
  %58 = load i64, ptr %57, align 8, !tbaa !9
  %59 = inttoptr i64 %58 to ptr
  %60 = load i64, ptr %56, align 8, !tbaa !13
  %61 = inttoptr i64 %60 to ptr
  %62 = getelementptr i8, ptr %61, i64 14
  %63 = icmp ugt ptr %62, %59
  br i1 %63, label %72, label %64

64:                                               ; preds = %54
  %65 = getelementptr inbounds i16, ptr %61, i64 2
  %66 = load i16, ptr %65, align 2, !tbaa !14
  %67 = getelementptr inbounds i16, ptr %61, i64 3
  %68 = load <2 x i16>, ptr %67, align 2, !tbaa !14
  %69 = getelementptr inbounds i16, ptr %61, i64 5
  %70 = load i16, ptr %69, align 2, !tbaa !14
  store i16 %70, ptr %65, align 2, !tbaa !14
  %71 = load <2 x i16>, ptr %61, align 2, !tbaa !14
  store <2 x i16> %68, ptr %61, align 2, !tbaa !14
  store <2 x i16> %71, ptr %67, align 2, !tbaa !14
  store i16 %66, ptr %69, align 2, !tbaa !14
  br label %72

72:                                               ; preds = %64, %54
  %73 = getelementptr inbounds ptr, ptr %0, i64 4
  %74 = load ptr, ptr %73, align 8, !tbaa !5
  %75 = getelementptr inbounds %struct.xdp_md, ptr %74, i64 0, i32 1
  %76 = load i64, ptr %75, align 8, !tbaa !9
  %77 = inttoptr i64 %76 to ptr
  %78 = load i64, ptr %74, align 8, !tbaa !13
  %79 = inttoptr i64 %78 to ptr
  %80 = getelementptr i8, ptr %79, i64 14
  %81 = icmp ugt ptr %80, %77
  br i1 %81, label %90, label %82

82:                                               ; preds = %72
  %83 = getelementptr inbounds i16, ptr %79, i64 2
  %84 = load i16, ptr %83, align 2, !tbaa !14
  %85 = getelementptr inbounds i16, ptr %79, i64 3
  %86 = load <2 x i16>, ptr %85, align 2, !tbaa !14
  %87 = getelementptr inbounds i16, ptr %79, i64 5
  %88 = load i16, ptr %87, align 2, !tbaa !14
  store i16 %88, ptr %83, align 2, !tbaa !14
  %89 = load <2 x i16>, ptr %79, align 2, !tbaa !14
  store <2 x i16> %86, ptr %79, align 2, !tbaa !14
  store <2 x i16> %89, ptr %85, align 2, !tbaa !14
  store i16 %84, ptr %87, align 2, !tbaa !14
  br label %90

90:                                               ; preds = %82, %72
  %91 = getelementptr inbounds ptr, ptr %0, i64 5
  %92 = load ptr, ptr %91, align 8, !tbaa !5
  %93 = getelementptr inbounds %struct.xdp_md, ptr %92, i64 0, i32 1
  %94 = load i64, ptr %93, align 8, !tbaa !9
  %95 = inttoptr i64 %94 to ptr
  %96 = load i64, ptr %92, align 8, !tbaa !13
  %97 = inttoptr i64 %96 to ptr
  %98 = getelementptr i8, ptr %97, i64 14
  %99 = icmp ugt ptr %98, %95
  br i1 %99, label %108, label %100

100:                                              ; preds = %90
  %101 = getelementptr inbounds i16, ptr %97, i64 2
  %102 = load i16, ptr %101, align 2, !tbaa !14
  %103 = getelementptr inbounds i16, ptr %97, i64 3
  %104 = load <2 x i16>, ptr %103, align 2, !tbaa !14
  %105 = getelementptr inbounds i16, ptr %97, i64 5
  %106 = load i16, ptr %105, align 2, !tbaa !14
  store i16 %106, ptr %101, align 2, !tbaa !14
  %107 = load <2 x i16>, ptr %97, align 2, !tbaa !14
  store <2 x i16> %104, ptr %97, align 2, !tbaa !14
  store <2 x i16> %107, ptr %103, align 2, !tbaa !14
  store i16 %102, ptr %105, align 2, !tbaa !14
  br label %108

108:                                              ; preds = %100, %90
  %109 = getelementptr inbounds ptr, ptr %0, i64 6
  %110 = load ptr, ptr %109, align 8, !tbaa !5
  %111 = getelementptr inbounds %struct.xdp_md, ptr %110, i64 0, i32 1
  %112 = load i64, ptr %111, align 8, !tbaa !9
  %113 = inttoptr i64 %112 to ptr
  %114 = load i64, ptr %110, align 8, !tbaa !13
  %115 = inttoptr i64 %114 to ptr
  %116 = getelementptr i8, ptr %115, i64 14
  %117 = icmp ugt ptr %116, %113
  br i1 %117, label %126, label %118

118:                                              ; preds = %108
  %119 = getelementptr inbounds i16, ptr %115, i64 2
  %120 = load i16, ptr %119, align 2, !tbaa !14
  %121 = getelementptr inbounds i16, ptr %115, i64 3
  %122 = load <2 x i16>, ptr %121, align 2, !tbaa !14
  %123 = getelementptr inbounds i16, ptr %115, i64 5
  %124 = load i16, ptr %123, align 2, !tbaa !14
  store i16 %124, ptr %119, align 2, !tbaa !14
  %125 = load <2 x i16>, ptr %115, align 2, !tbaa !14
  store <2 x i16> %122, ptr %115, align 2, !tbaa !14
  store <2 x i16> %125, ptr %121, align 2, !tbaa !14
  store i16 %120, ptr %123, align 2, !tbaa !14
  br label %126

126:                                              ; preds = %118, %108
  %127 = getelementptr inbounds ptr, ptr %0, i64 7
  %128 = load ptr, ptr %127, align 8, !tbaa !5
  %129 = getelementptr inbounds %struct.xdp_md, ptr %128, i64 0, i32 1
  %130 = load i64, ptr %129, align 8, !tbaa !9
  %131 = inttoptr i64 %130 to ptr
  %132 = load i64, ptr %128, align 8, !tbaa !13
  %133 = inttoptr i64 %132 to ptr
  %134 = getelementptr i8, ptr %133, i64 14
  %135 = icmp ugt ptr %134, %131
  br i1 %135, label %144, label %136

136:                                              ; preds = %126
  %137 = getelementptr inbounds i16, ptr %133, i64 2
  %138 = load i16, ptr %137, align 2, !tbaa !14
  %139 = getelementptr inbounds i16, ptr %133, i64 3
  %140 = load <2 x i16>, ptr %139, align 2, !tbaa !14
  %141 = getelementptr inbounds i16, ptr %133, i64 5
  %142 = load i16, ptr %141, align 2, !tbaa !14
  store i16 %142, ptr %137, align 2, !tbaa !14
  %143 = load <2 x i16>, ptr %133, align 2, !tbaa !14
  store <2 x i16> %140, ptr %133, align 2, !tbaa !14
  store <2 x i16> %143, ptr %139, align 2, !tbaa !14
  store i16 %138, ptr %141, align 2, !tbaa !14
  br label %144

144:                                              ; preds = %136, %126
  %145 = getelementptr inbounds ptr, ptr %0, i64 8
  %146 = load ptr, ptr %145, align 8, !tbaa !5
  %147 = getelementptr inbounds %struct.xdp_md, ptr %146, i64 0, i32 1
  %148 = load i64, ptr %147, align 8, !tbaa !9
  %149 = inttoptr i64 %148 to ptr
  %150 = load i64, ptr %146, align 8, !tbaa !13
  %151 = inttoptr i64 %150 to ptr
  %152 = getelementptr i8, ptr %151, i64 14
  %153 = icmp ugt ptr %152, %149
  br i1 %153, label %162, label %154

154:                                              ; preds = %144
  %155 = getelementptr inbounds i16, ptr %151, i64 2
  %156 = load i16, ptr %155, align 2, !tbaa !14
  %157 = getelementptr inbounds i16, ptr %151, i64 3
  %158 = load <2 x i16>, ptr %157, align 2, !tbaa !14
  %159 = getelementptr inbounds i16, ptr %151, i64 5
  %160 = load i16, ptr %159, align 2, !tbaa !14
  store i16 %160, ptr %155, align 2, !tbaa !14
  %161 = load <2 x i16>, ptr %151, align 2, !tbaa !14
  store <2 x i16> %158, ptr %151, align 2, !tbaa !14
  store <2 x i16> %161, ptr %157, align 2, !tbaa !14
  store i16 %156, ptr %159, align 2, !tbaa !14
  br label %162

162:                                              ; preds = %154, %144
  %163 = getelementptr inbounds ptr, ptr %0, i64 9
  %164 = load ptr, ptr %163, align 8, !tbaa !5
  %165 = getelementptr inbounds %struct.xdp_md, ptr %164, i64 0, i32 1
  %166 = load i64, ptr %165, align 8, !tbaa !9
  %167 = inttoptr i64 %166 to ptr
  %168 = load i64, ptr %164, align 8, !tbaa !13
  %169 = inttoptr i64 %168 to ptr
  %170 = getelementptr i8, ptr %169, i64 14
  %171 = icmp ugt ptr %170, %167
  br i1 %171, label %180, label %172

172:                                              ; preds = %162
  %173 = getelementptr inbounds i16, ptr %169, i64 2
  %174 = load i16, ptr %173, align 2, !tbaa !14
  %175 = getelementptr inbounds i16, ptr %169, i64 3
  %176 = load <2 x i16>, ptr %175, align 2, !tbaa !14
  %177 = getelementptr inbounds i16, ptr %169, i64 5
  %178 = load i16, ptr %177, align 2, !tbaa !14
  store i16 %178, ptr %173, align 2, !tbaa !14
  %179 = load <2 x i16>, ptr %169, align 2, !tbaa !14
  store <2 x i16> %176, ptr %169, align 2, !tbaa !14
  store <2 x i16> %179, ptr %175, align 2, !tbaa !14
  store i16 %174, ptr %177, align 2, !tbaa !14
  br label %180

180:                                              ; preds = %172, %162
  %181 = getelementptr inbounds ptr, ptr %0, i64 10
  %182 = load ptr, ptr %181, align 8, !tbaa !5
  %183 = getelementptr inbounds %struct.xdp_md, ptr %182, i64 0, i32 1
  %184 = load i64, ptr %183, align 8, !tbaa !9
  %185 = inttoptr i64 %184 to ptr
  %186 = load i64, ptr %182, align 8, !tbaa !13
  %187 = inttoptr i64 %186 to ptr
  %188 = getelementptr i8, ptr %187, i64 14
  %189 = icmp ugt ptr %188, %185
  br i1 %189, label %198, label %190

190:                                              ; preds = %180
  %191 = getelementptr inbounds i16, ptr %187, i64 2
  %192 = load i16, ptr %191, align 2, !tbaa !14
  %193 = getelementptr inbounds i16, ptr %187, i64 3
  %194 = load <2 x i16>, ptr %193, align 2, !tbaa !14
  %195 = getelementptr inbounds i16, ptr %187, i64 5
  %196 = load i16, ptr %195, align 2, !tbaa !14
  store i16 %196, ptr %191, align 2, !tbaa !14
  %197 = load <2 x i16>, ptr %187, align 2, !tbaa !14
  store <2 x i16> %194, ptr %187, align 2, !tbaa !14
  store <2 x i16> %197, ptr %193, align 2, !tbaa !14
  store i16 %192, ptr %195, align 2, !tbaa !14
  br label %198

198:                                              ; preds = %190, %180
  %199 = getelementptr inbounds ptr, ptr %0, i64 11
  %200 = load ptr, ptr %199, align 8, !tbaa !5
  %201 = getelementptr inbounds %struct.xdp_md, ptr %200, i64 0, i32 1
  %202 = load i64, ptr %201, align 8, !tbaa !9
  %203 = inttoptr i64 %202 to ptr
  %204 = load i64, ptr %200, align 8, !tbaa !13
  %205 = inttoptr i64 %204 to ptr
  %206 = getelementptr i8, ptr %205, i64 14
  %207 = icmp ugt ptr %206, %203
  br i1 %207, label %216, label %208

208:                                              ; preds = %198
  %209 = getelementptr inbounds i16, ptr %205, i64 2
  %210 = load i16, ptr %209, align 2, !tbaa !14
  %211 = getelementptr inbounds i16, ptr %205, i64 3
  %212 = load <2 x i16>, ptr %211, align 2, !tbaa !14
  %213 = getelementptr inbounds i16, ptr %205, i64 5
  %214 = load i16, ptr %213, align 2, !tbaa !14
  store i16 %214, ptr %209, align 2, !tbaa !14
  %215 = load <2 x i16>, ptr %205, align 2, !tbaa !14
  store <2 x i16> %212, ptr %205, align 2, !tbaa !14
  store <2 x i16> %215, ptr %211, align 2, !tbaa !14
  store i16 %210, ptr %213, align 2, !tbaa !14
  br label %216

216:                                              ; preds = %208, %198
  %217 = getelementptr inbounds ptr, ptr %0, i64 12
  %218 = load ptr, ptr %217, align 8, !tbaa !5
  %219 = getelementptr inbounds %struct.xdp_md, ptr %218, i64 0, i32 1
  %220 = load i64, ptr %219, align 8, !tbaa !9
  %221 = inttoptr i64 %220 to ptr
  %222 = load i64, ptr %218, align 8, !tbaa !13
  %223 = inttoptr i64 %222 to ptr
  %224 = getelementptr i8, ptr %223, i64 14
  %225 = icmp ugt ptr %224, %221
  br i1 %225, label %234, label %226

226:                                              ; preds = %216
  %227 = getelementptr inbounds i16, ptr %223, i64 2
  %228 = load i16, ptr %227, align 2, !tbaa !14
  %229 = getelementptr inbounds i16, ptr %223, i64 3
  %230 = load <2 x i16>, ptr %229, align 2, !tbaa !14
  %231 = getelementptr inbounds i16, ptr %223, i64 5
  %232 = load i16, ptr %231, align 2, !tbaa !14
  store i16 %232, ptr %227, align 2, !tbaa !14
  %233 = load <2 x i16>, ptr %223, align 2, !tbaa !14
  store <2 x i16> %230, ptr %223, align 2, !tbaa !14
  store <2 x i16> %233, ptr %229, align 2, !tbaa !14
  store i16 %228, ptr %231, align 2, !tbaa !14
  br label %234

234:                                              ; preds = %226, %216
  %235 = getelementptr inbounds ptr, ptr %0, i64 13
  %236 = load ptr, ptr %235, align 8, !tbaa !5
  %237 = getelementptr inbounds %struct.xdp_md, ptr %236, i64 0, i32 1
  %238 = load i64, ptr %237, align 8, !tbaa !9
  %239 = inttoptr i64 %238 to ptr
  %240 = load i64, ptr %236, align 8, !tbaa !13
  %241 = inttoptr i64 %240 to ptr
  %242 = getelementptr i8, ptr %241, i64 14
  %243 = icmp ugt ptr %242, %239
  br i1 %243, label %252, label %244

244:                                              ; preds = %234
  %245 = getelementptr inbounds i16, ptr %241, i64 2
  %246 = load i16, ptr %245, align 2, !tbaa !14
  %247 = getelementptr inbounds i16, ptr %241, i64 3
  %248 = load <2 x i16>, ptr %247, align 2, !tbaa !14
  %249 = getelementptr inbounds i16, ptr %241, i64 5
  %250 = load i16, ptr %249, align 2, !tbaa !14
  store i16 %250, ptr %245, align 2, !tbaa !14
  %251 = load <2 x i16>, ptr %241, align 2, !tbaa !14
  store <2 x i16> %248, ptr %241, align 2, !tbaa !14
  store <2 x i16> %251, ptr %247, align 2, !tbaa !14
  store i16 %246, ptr %249, align 2, !tbaa !14
  br label %252

252:                                              ; preds = %244, %234
  %253 = getelementptr inbounds ptr, ptr %0, i64 14
  %254 = load ptr, ptr %253, align 8, !tbaa !5
  %255 = getelementptr inbounds %struct.xdp_md, ptr %254, i64 0, i32 1
  %256 = load i64, ptr %255, align 8, !tbaa !9
  %257 = inttoptr i64 %256 to ptr
  %258 = load i64, ptr %254, align 8, !tbaa !13
  %259 = inttoptr i64 %258 to ptr
  %260 = getelementptr i8, ptr %259, i64 14
  %261 = icmp ugt ptr %260, %257
  br i1 %261, label %270, label %262

262:                                              ; preds = %252
  %263 = getelementptr inbounds i16, ptr %259, i64 2
  %264 = load i16, ptr %263, align 2, !tbaa !14
  %265 = getelementptr inbounds i16, ptr %259, i64 3
  %266 = load <2 x i16>, ptr %265, align 2, !tbaa !14
  %267 = getelementptr inbounds i16, ptr %259, i64 5
  %268 = load i16, ptr %267, align 2, !tbaa !14
  store i16 %268, ptr %263, align 2, !tbaa !14
  %269 = load <2 x i16>, ptr %259, align 2, !tbaa !14
  store <2 x i16> %266, ptr %259, align 2, !tbaa !14
  store <2 x i16> %269, ptr %265, align 2, !tbaa !14
  store i16 %264, ptr %267, align 2, !tbaa !14
  br label %270

270:                                              ; preds = %262, %252
  %271 = getelementptr inbounds ptr, ptr %0, i64 15
  %272 = load ptr, ptr %271, align 8, !tbaa !5
  %273 = getelementptr inbounds %struct.xdp_md, ptr %272, i64 0, i32 1
  %274 = load i64, ptr %273, align 8, !tbaa !9
  %275 = inttoptr i64 %274 to ptr
  %276 = load i64, ptr %272, align 8, !tbaa !13
  %277 = inttoptr i64 %276 to ptr
  %278 = getelementptr i8, ptr %277, i64 14
  %279 = icmp ugt ptr %278, %275
  br i1 %279, label %288, label %280

280:                                              ; preds = %270
  %281 = getelementptr inbounds i16, ptr %277, i64 2
  %282 = load i16, ptr %281, align 2, !tbaa !14
  %283 = getelementptr inbounds i16, ptr %277, i64 3
  %284 = load <2 x i16>, ptr %283, align 2, !tbaa !14
  %285 = getelementptr inbounds i16, ptr %277, i64 5
  %286 = load i16, ptr %285, align 2, !tbaa !14
  store i16 %286, ptr %281, align 2, !tbaa !14
  %287 = load <2 x i16>, ptr %277, align 2, !tbaa !14
  store <2 x i16> %284, ptr %277, align 2, !tbaa !14
  store <2 x i16> %287, ptr %283, align 2, !tbaa !14
  store i16 %282, ptr %285, align 2, !tbaa !14
  br label %288

288:                                              ; preds = %280, %270
  ret i32 3
}

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 15.0.7"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !11, i64 8}
!10 = !{!"xdp_md", !11, i64 0, !11, i64 8, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28}
!11 = !{!"long long", !7, i64 0}
!12 = !{!"int", !7, i64 0}
!13 = !{!10, !11, i64 0}
!14 = !{!15, !15, i64 0}
!15 = !{!"short", !7, i64 0}

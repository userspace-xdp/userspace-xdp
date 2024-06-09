; ModuleID = 'xdp_lb.ll'
source_filename = "bpf-jit"

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0028(i64, i64, i64, i64, i64) local_unnamed_addr

%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }

define i64 @bpf_main(%struct.xdp_md* nocapture noundef readonly %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin671 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin671, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = getelementptr i8, ptr %0, i64 8
  %4 = load i64, ptr %3, align 4
  %5 = load i64, ptr %0, align 4
  %6 = add i64 %5, 14
  %.not = icmp ult i64 %4, %6
  br i1 %.not, label %bb_inst_11, label %bb_inst_19

bb_inst_11:                                       ; preds = %setupBlock, %bb_inst_42
  %.sink = phi i32 [ 1919182960, %bb_inst_42 ], [ 1919182952, %setupBlock ]
  %r1.0 = phi i64 [ 7166388587031590255, %bb_inst_42 ], [ 8387145561025705327, %setupBlock ]
  %7 = getelementptr inbounds i8, ptr %stackEnd, i64 -12
  store i16 10, ptr %7, align 4
  br label %bb_inst_35

bb_inst_19:                                       ; preds = %setupBlock
  %8 = add i64 %5, 34
  %.not672 = icmp ult i64 %4, %8
  br i1 %.not672, label %bb_inst_22, label %bb_inst_39

bb_inst_22:                                       ; preds = %bb_inst_19
  %9 = getelementptr inbounds i8, ptr %stackEnd, i64 -12
  store i8 0, ptr %9, align 4
  br label %bb_inst_35

bb_inst_35:                                       ; preds = %bb_inst_22, %bb_inst_11
  %.sink726 = phi i32 [ 175268968, %bb_inst_22 ], [ %.sink, %bb_inst_11 ]
  %.sink724 = phi i64 [ 8100041084780836207, %bb_inst_22 ], [ %r1.0, %bb_inst_11 ]
  %r2.0 = phi i64 [ 21, %bb_inst_22 ], [ 22, %bb_inst_11 ]
  %10 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 %.sink726, ptr %10, align 8
  %11 = getelementptr inbounds i8, ptr %stackEnd, i64 -24
  store i64 %.sink724, ptr %11, align 8
  %12 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  store i64 7070764042443584847, ptr %12, align 8
  %r1.1 = add i64 %2, -32
  %13 = call i64 @_bpf_helper_ext_0006(i64 %r1.1, i64 %r2.0, i64 undef, i64 undef, i64 undef)
  br label %bb_inst_37

bb_inst_37:                                       ; preds = %bb_inst_568, %bb_inst_331, %bb_inst_321, %bb_inst_312, %bb_inst_295, %bb_inst_77, %bb_inst_61, %bb_inst_39, %bb_inst_35
  %r7.0 = phi i64 [ 2, %bb_inst_39 ], [ 2, %bb_inst_77 ], [ 0, %bb_inst_321 ], [ 0, %bb_inst_331 ], [ 3, %bb_inst_568 ], [ 0, %bb_inst_295 ], [ 0, %bb_inst_312 ], [ 0, %bb_inst_61 ], [ 1, %bb_inst_35 ]
  ret i64 %r7.0

bb_inst_39:                                       ; preds = %bb_inst_19
  %14 = inttoptr i64 %6 to ptr
  %15 = getelementptr i8, ptr %14, i64 9
  %16 = load i8, ptr %15, align 1
  %.not673 = icmp eq i8 %16, 6
  br i1 %.not673, label %bb_inst_42, label %bb_inst_37

bb_inst_42:                                       ; preds = %bb_inst_39
  %17 = add i64 %5, 54
  %.not674 = icmp ult i64 %4, %17
  br i1 %.not674, label %bb_inst_11, label %bb_inst_52

bb_inst_52:                                       ; preds = %bb_inst_42
  %18 = getelementptr inbounds i8, ptr %stackEnd, i64 -48
  store i64 %8, ptr %18, align 8
  %19 = getelementptr inbounds i8, ptr %stackEnd, i64 -4
  store i32 1, ptr %19, align 4
  %20 = add i64 %2, -4
  %21 = call i64 @_bpf_helper_ext_0001(i64 17179869184, i64 %20, i64 undef, i64 undef, i64 undef)
  %.not675 = icmp eq i64 %21, 0
  br i1 %.not675, label %bb_inst_61, label %bb_inst_77

bb_inst_61:                                       ; preds = %bb_inst_52
  %22 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i64 748844888709537908, ptr %22, align 8
  %23 = getelementptr inbounds i8, ptr %stackEnd, i64 -24
  store i64 8029390814170213999, ptr %23, align 8
  %24 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  store i64 7142837026506239043, ptr %24, align 8
  %25 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i8 0, ptr %25, align 8
  %26 = add i64 %2, -32
  %27 = call i64 @_bpf_helper_ext_0006(i64 %26, i64 25, i64 undef, i64 undef, i64 undef)
  br label %bb_inst_37

bb_inst_77:                                       ; preds = %bb_inst_52
  %28 = getelementptr inbounds i8, ptr %stackEnd, i64 -56
  store i64 %6, ptr %28, align 8
  %29 = add i64 %5, 1200
  %30 = icmp ugt i64 %4, %29
  %31 = add i64 %5, 60
  %32 = icmp ugt i64 %31, %4
  %or.cond = or i1 %30, %32
  br i1 %or.cond, label %bb_inst_37, label %bb_inst_87

bb_inst_87:                                       ; preds = %bb_inst_77, %bb_inst_87
  %r6.0 = phi i64 [ %37, %bb_inst_87 ], [ 0, %bb_inst_77 ]
  %r1.2 = phi i64 [ %38, %bb_inst_87 ], [ 0, %bb_inst_77 ]
  %33 = add i64 %r1.2, %5
  %34 = inttoptr i64 %33 to ptr
  %35 = load i8, ptr %34, align 1
  %36 = zext i8 %35 to i64
  %37 = add i64 %r6.0, %36
  %38 = add nuw nsw i64 %r1.2, 1
  %.not676 = icmp eq i64 %38, 60
  br i1 %.not676, label %bb_inst_93, label %bb_inst_87

bb_inst_93:                                       ; preds = %bb_inst_87
  %39 = add i64 %37, -2048144777
  %40 = insertelement <2 x i64> poison, i64 %37, i64 0
  %41 = shufflevector <2 x i64> %40, <2 x i64> poison, <2 x i32> zeroinitializer
  %42 = add <2 x i64> %41, <i64 1640531535, i64 606290984>
  %43 = getelementptr inbounds i8, ptr %stackEnd, i64 -64
  store i64 %5, ptr %43, align 8
  %44 = getelementptr inbounds i8, ptr %stackEnd, i64 -40
  %45 = extractelement <2 x i64> %42, i64 0
  store i64 %45, ptr %44, align 8
  %46 = inttoptr i64 %5 to ptr
  %47 = getelementptr i8, ptr %46, i64 13
  %48 = load i8, ptr %47, align 1
  %49 = getelementptr i8, ptr %46, i64 12
  %50 = load i8, ptr %49, align 1
  %51 = getelementptr i8, ptr %46, i64 1
  %52 = load i8, ptr %51, align 1
  %53 = insertelement <2 x i8> poison, i8 %48, i64 0
  %54 = insertelement <2 x i8> %53, i8 %52, i64 1
  %55 = zext <2 x i8> %54 to <2 x i64>
  %56 = shl nuw nsw <2 x i64> %55, <i64 8, i64 8>
  %57 = load i8, ptr %46, align 1
  %58 = insertelement <2 x i8> poison, i8 %50, i64 0
  %59 = insertelement <2 x i8> %58, i8 %57, i64 1
  %60 = zext <2 x i8> %59 to <2 x i64>
  %61 = or <2 x i64> %56, %60
  %62 = getelementptr i8, ptr %46, i64 5
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i64
  %65 = shl nuw nsw i64 %64, 8
  %66 = getelementptr i8, ptr %46, i64 4
  %67 = load i8, ptr %66, align 1
  %68 = zext i8 %67 to i64
  %69 = or i64 %65, %68
  %70 = getelementptr i8, ptr %46, i64 2
  %71 = load i8, ptr %70, align 1
  %72 = getelementptr i8, ptr %46, i64 14
  %73 = load i8, ptr %72, align 1
  %74 = insertelement <2 x i8> poison, i8 %73, i64 0
  %75 = insertelement <2 x i8> %74, i8 %71, i64 1
  %76 = zext <2 x i8> %75 to <2 x i64>
  %77 = shl nuw nsw <2 x i64> %76, <i64 16, i64 16>
  %78 = or <2 x i64> %61, %77
  %79 = getelementptr i8, ptr %46, i64 9
  %80 = load i8, ptr %79, align 1
  %81 = zext i8 %80 to i64
  %82 = shl nuw nsw i64 %81, 8
  %83 = getelementptr i8, ptr %46, i64 8
  %84 = load i8, ptr %83, align 1
  %85 = zext i8 %84 to i64
  %86 = or i64 %82, %85
  %87 = getelementptr i8, ptr %46, i64 10
  %88 = load i8, ptr %87, align 1
  %89 = zext i8 %88 to i64
  %90 = shl nuw nsw i64 %89, 16
  %91 = or i64 %86, %90
  %92 = getelementptr i8, ptr %46, i64 11
  %93 = load i8, ptr %92, align 1
  %94 = zext i8 %93 to i64
  %95 = shl nuw nsw i64 %94, 24
  %96 = or i64 %91, %95
  %97 = getelementptr i8, ptr %46, i64 15
  %98 = load i8, ptr %97, align 1
  %99 = getelementptr i8, ptr %46, i64 3
  %100 = load i8, ptr %99, align 1
  %101 = insertelement <2 x i8> poison, i8 %98, i64 0
  %102 = insertelement <2 x i8> %101, i8 %100, i64 1
  %103 = zext <2 x i8> %102 to <2 x i64>
  %104 = shl nuw nsw <2 x i64> %103, <i64 24, i64 24>
  %105 = or <2 x i64> %78, %104
  %106 = getelementptr i8, ptr %46, i64 6
  %107 = load i8, ptr %106, align 1
  %108 = zext i8 %107 to i64
  %109 = shl nuw nsw i64 %108, 16
  %110 = or i64 %69, %109
  %111 = getelementptr i8, ptr %46, i64 7
  %112 = load i8, ptr %111, align 1
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 24
  %115 = or i64 %110, %114
  %116 = mul nsw i64 %115, -2048144777
  %117 = add i64 %116, %39
  %118 = mul nsw <2 x i64> %105, <i64 -2048144777, i64 -2048144777>
  %119 = add <2 x i64> %118, %42
  %120 = mul nsw i64 %96, -2048144777
  %121 = add i64 %120, %37
  %122 = shl i64 %117, 13
  %123 = lshr i64 %117, 19
  %124 = and i64 %123, 8191
  %125 = or i64 %124, %122
  %126 = shl i64 %121, 13
  %127 = lshr i64 %121, 19
  %128 = and i64 %127, 8191
  %129 = or i64 %128, %126
  %130 = shl <2 x i64> %119, <i64 13, i64 13>
  %131 = lshr <2 x i64> %119, <i64 19, i64 19>
  %132 = and <2 x i64> %131, <i64 8191, i64 8191>
  %133 = or <2 x i64> %132, %130
  %134 = add i64 %5, 16
  %135 = mul i64 %129, -1640531535
  %136 = mul i64 %125, -1640531535
  %137 = mul <2 x i64> %133, <i64 -1640531535, i64 -1640531535>
  %138 = extractelement <2 x i64> %137, i64 0
  store i64 %138, ptr %44, align 8
  %139 = inttoptr i64 %134 to ptr
  %140 = getelementptr i8, ptr %139, i64 13
  %141 = load i8, ptr %140, align 1
  %142 = getelementptr i8, ptr %139, i64 12
  %143 = load i8, ptr %142, align 1
  %144 = getelementptr i8, ptr %139, i64 1
  %145 = load i8, ptr %144, align 1
  %146 = insertelement <2 x i8> poison, i8 %141, i64 0
  %147 = insertelement <2 x i8> %146, i8 %145, i64 1
  %148 = zext <2 x i8> %147 to <2 x i64>
  %149 = shl nuw nsw <2 x i64> %148, <i64 8, i64 8>
  %150 = load i8, ptr %139, align 1
  %151 = insertelement <2 x i8> poison, i8 %143, i64 0
  %152 = insertelement <2 x i8> %151, i8 %150, i64 1
  %153 = zext <2 x i8> %152 to <2 x i64>
  %154 = or <2 x i64> %149, %153
  %155 = getelementptr i8, ptr %139, i64 5
  %156 = load i8, ptr %155, align 1
  %157 = zext i8 %156 to i64
  %158 = shl nuw nsw i64 %157, 8
  %159 = getelementptr i8, ptr %139, i64 4
  %160 = load i8, ptr %159, align 1
  %161 = zext i8 %160 to i64
  %162 = or i64 %158, %161
  %163 = getelementptr i8, ptr %139, i64 2
  %164 = load i8, ptr %163, align 1
  %165 = getelementptr i8, ptr %139, i64 14
  %166 = load i8, ptr %165, align 1
  %167 = insertelement <2 x i8> poison, i8 %166, i64 0
  %168 = insertelement <2 x i8> %167, i8 %164, i64 1
  %169 = zext <2 x i8> %168 to <2 x i64>
  %170 = shl nuw nsw <2 x i64> %169, <i64 16, i64 16>
  %171 = or <2 x i64> %154, %170
  %172 = getelementptr i8, ptr %139, i64 9
  %173 = load i8, ptr %172, align 1
  %174 = zext i8 %173 to i64
  %175 = shl nuw nsw i64 %174, 8
  %176 = getelementptr i8, ptr %139, i64 8
  %177 = load i8, ptr %176, align 1
  %178 = zext i8 %177 to i64
  %179 = or i64 %175, %178
  %180 = getelementptr i8, ptr %139, i64 10
  %181 = load i8, ptr %180, align 1
  %182 = zext i8 %181 to i64
  %183 = shl nuw nsw i64 %182, 16
  %184 = or i64 %179, %183
  %185 = getelementptr i8, ptr %139, i64 11
  %186 = load i8, ptr %185, align 1
  %187 = zext i8 %186 to i64
  %188 = shl nuw nsw i64 %187, 24
  %189 = or i64 %184, %188
  %190 = getelementptr i8, ptr %139, i64 15
  %191 = load i8, ptr %190, align 1
  %192 = getelementptr i8, ptr %139, i64 3
  %193 = load i8, ptr %192, align 1
  %194 = insertelement <2 x i8> poison, i8 %191, i64 0
  %195 = insertelement <2 x i8> %194, i8 %193, i64 1
  %196 = zext <2 x i8> %195 to <2 x i64>
  %197 = shl nuw nsw <2 x i64> %196, <i64 24, i64 24>
  %198 = or <2 x i64> %171, %197
  %199 = getelementptr i8, ptr %139, i64 6
  %200 = load <2 x i8>, ptr %199, align 1
  %201 = zext <2 x i8> %200 to <2 x i64>
  %202 = shl nuw nsw <2 x i64> %201, <i64 16, i64 24>
  %203 = extractelement <2 x i64> %202, i64 0
  %204 = or i64 %162, %203
  %205 = extractelement <2 x i64> %202, i64 1
  %206 = or i64 %204, %205
  %207 = mul nsw i64 %206, -2048144777
  %208 = add i64 %207, %136
  %209 = mul nsw <2 x i64> %198, <i64 -2048144777, i64 -2048144777>
  %210 = add <2 x i64> %209, %137
  %211 = mul nsw i64 %189, -2048144777
  %212 = add i64 %211, %135
  %213 = shl i64 %208, 13
  %214 = lshr i64 %208, 19
  %215 = and i64 %214, 8191
  %216 = or i64 %215, %213
  %217 = shl i64 %212, 13
  %218 = lshr i64 %212, 19
  %219 = and i64 %218, 8191
  %220 = or i64 %219, %217
  %221 = shl <2 x i64> %210, <i64 13, i64 13>
  %222 = lshr <2 x i64> %210, <i64 19, i64 19>
  %223 = and <2 x i64> %222, <i64 8191, i64 8191>
  %224 = or <2 x i64> %223, %221
  %225 = add i64 %5, 32
  %226 = mul i64 %220, -1640531535
  %227 = mul i64 %216, -1640531535
  %228 = mul <2 x i64> %224, <i64 -1640531535, i64 -1640531535>
  %229 = extractelement <2 x i64> %228, i64 0
  store i64 %229, ptr %44, align 8
  %230 = inttoptr i64 %225 to ptr
  %231 = getelementptr i8, ptr %230, i64 13
  %232 = load i8, ptr %231, align 1
  %233 = getelementptr i8, ptr %230, i64 12
  %234 = load i8, ptr %233, align 1
  %235 = getelementptr i8, ptr %230, i64 1
  %236 = load i8, ptr %235, align 1
  %237 = insertelement <2 x i8> poison, i8 %232, i64 0
  %238 = insertelement <2 x i8> %237, i8 %236, i64 1
  %239 = zext <2 x i8> %238 to <2 x i64>
  %240 = shl nuw nsw <2 x i64> %239, <i64 8, i64 8>
  %241 = load i8, ptr %230, align 1
  %242 = insertelement <2 x i8> poison, i8 %234, i64 0
  %243 = insertelement <2 x i8> %242, i8 %241, i64 1
  %244 = zext <2 x i8> %243 to <2 x i64>
  %245 = or <2 x i64> %240, %244
  %246 = getelementptr i8, ptr %230, i64 5
  %247 = load i8, ptr %246, align 1
  %248 = zext i8 %247 to i64
  %249 = shl nuw nsw i64 %248, 8
  %250 = getelementptr i8, ptr %230, i64 4
  %251 = load i8, ptr %250, align 1
  %252 = zext i8 %251 to i64
  %253 = or i64 %249, %252
  %254 = getelementptr i8, ptr %230, i64 2
  %255 = load i8, ptr %254, align 1
  %256 = getelementptr i8, ptr %230, i64 14
  %257 = load i8, ptr %256, align 1
  %258 = insertelement <2 x i8> poison, i8 %257, i64 0
  %259 = insertelement <2 x i8> %258, i8 %255, i64 1
  %260 = zext <2 x i8> %259 to <2 x i64>
  %261 = shl nuw nsw <2 x i64> %260, <i64 16, i64 16>
  %262 = or <2 x i64> %245, %261
  %263 = getelementptr i8, ptr %230, i64 9
  %264 = load i8, ptr %263, align 1
  %265 = zext i8 %264 to i64
  %266 = shl nuw nsw i64 %265, 8
  %267 = getelementptr i8, ptr %230, i64 8
  %268 = load i8, ptr %267, align 1
  %269 = zext i8 %268 to i64
  %270 = or i64 %266, %269
  %271 = getelementptr i8, ptr %230, i64 10
  %272 = load i8, ptr %271, align 1
  %273 = zext i8 %272 to i64
  %274 = shl nuw nsw i64 %273, 16
  %275 = or i64 %270, %274
  %276 = getelementptr i8, ptr %230, i64 11
  %277 = load i8, ptr %276, align 1
  %278 = zext i8 %277 to i64
  %279 = shl nuw nsw i64 %278, 24
  %280 = or i64 %275, %279
  %281 = getelementptr i8, ptr %230, i64 15
  %282 = load i8, ptr %281, align 1
  %283 = getelementptr i8, ptr %230, i64 3
  %284 = load i8, ptr %283, align 1
  %285 = insertelement <2 x i8> poison, i8 %282, i64 0
  %286 = insertelement <2 x i8> %285, i8 %284, i64 1
  %287 = zext <2 x i8> %286 to <2 x i64>
  %288 = shl nuw nsw <2 x i64> %287, <i64 24, i64 24>
  %289 = or <2 x i64> %262, %288
  %290 = getelementptr i8, ptr %230, i64 6
  %291 = load <2 x i8>, ptr %290, align 1
  %292 = zext <2 x i8> %291 to <2 x i64>
  %293 = shl nuw nsw <2 x i64> %292, <i64 16, i64 24>
  %294 = extractelement <2 x i64> %293, i64 0
  %295 = or i64 %253, %294
  %296 = extractelement <2 x i64> %293, i64 1
  %297 = or i64 %295, %296
  %298 = mul nsw i64 %297, -2048144777
  %299 = add i64 %298, %227
  %300 = mul nsw <2 x i64> %289, <i64 -2048144777, i64 -2048144777>
  %301 = add <2 x i64> %300, %228
  %302 = mul nsw i64 %280, -2048144777
  %303 = add i64 %302, %226
  %304 = shl i64 %299, 13
  %305 = lshr i64 %299, 19
  %306 = and i64 %305, 8191
  %307 = or i64 %306, %304
  %308 = shl i64 %303, 13
  %309 = lshr i64 %303, 19
  %310 = and i64 %309, 8191
  %311 = or i64 %310, %308
  %312 = shl <2 x i64> %301, <i64 13, i64 13>
  %313 = lshr <2 x i64> %301, <i64 19, i64 19>
  %314 = and <2 x i64> %313, <i64 8191, i64 8191>
  %315 = or <2 x i64> %314, %312
  %316 = mul i64 %311, -1640531535
  %317 = mul i64 %307, -1640531535
  %318 = mul <2 x i64> %315, <i64 -1640531535, i64 -1640531535>
  %319 = lshr i64 %317, 25
  %320 = and i64 %319, 127
  %321 = mul i64 %307, -209988036480
  %322 = extractelement <2 x i64> %315, i64 1
  %323 = mul i64 %322, -3281063070
  %324 = lshr i64 %316, 20
  %325 = and i64 %324, 4095
  %326 = mul i64 %311, -6719617167360
  %327 = lshr <2 x i64> %318, <i64 14, i64 31>
  %328 = and <2 x i64> %327, <i64 262143, i64 1>
  %329 = extractelement <2 x i64> %315, i64 0
  %330 = mul i64 %329, -430055498711040
  %331 = load i64, ptr %43, align 8
  %332 = add i64 %331, 48
  %333 = or i64 %326, 60
  %334 = add i64 %333, %330
  %335 = add i64 %334, %325
  %336 = add i64 %335, %323
  %337 = extractelement <2 x i64> %328, i64 0
  %338 = add i64 %336, %337
  %339 = extractelement <2 x i64> %328, i64 1
  %340 = add i64 %338, %339
  %341 = add i64 %340, %321
  %342 = add i64 %341, %320
  %343 = getelementptr inbounds i8, ptr %stackEnd, i64 -72
  store i64 %332, ptr %343, align 8
  br label %bb_inst_227

bb_inst_227:                                      ; preds = %bb_inst_252, %bb_inst_93
  %r3.0 = phi i64 [ 12, %bb_inst_93 ], [ %369, %bb_inst_252 ]
  %r8.1 = phi i64 [ %342, %bb_inst_93 ], [ %r1.3, %bb_inst_252 ]
  %r0.0 = phi i64 [ %332, %bb_inst_93 ], [ %370, %bb_inst_252 ]
  %344 = and i64 %r3.0, 4294967295
  %345 = icmp ult i64 %344, 4
  br i1 %345, label %bb_inst_257, label %bb_inst_231

bb_inst_231:                                      ; preds = %bb_inst_227
  %346 = inttoptr i64 %r0.0 to ptr
  %347 = getelementptr i8, ptr %346, i64 1
  %348 = load i8, ptr %347, align 1
  %349 = zext i8 %348 to i64
  %350 = shl nuw nsw i64 %349, 8
  %351 = load i8, ptr %346, align 1
  %352 = zext i8 %351 to i64
  %353 = or i64 %350, %352
  %354 = getelementptr i8, ptr %346, i64 2
  %355 = load <2 x i8>, ptr %354, align 1
  %356 = zext <2 x i8> %355 to <2 x i64>
  %357 = shl nuw nsw <2 x i64> %356, <i64 16, i64 24>
  %358 = extractelement <2 x i64> %357, i64 0
  %359 = or i64 %353, %358
  %360 = extractelement <2 x i64> %357, i64 1
  %361 = or i64 %359, %360
  %362 = mul nsw i64 %361, -1028477379
  %363 = add i64 %362, %r8.1
  %364 = shl i64 %363, 17
  %365 = lshr i64 %363, 15
  %366 = and i64 %365, 131071
  %367 = or i64 %366, %364
  %368 = mul i64 %367, 668265263
  br label %bb_inst_252

bb_inst_252:                                      ; preds = %bb_inst_258, %bb_inst_231
  %r6.2 = phi i64 [ 4294967295, %bb_inst_258 ], [ 4294967292, %bb_inst_231 ]
  %r7.2 = phi i64 [ 1, %bb_inst_258 ], [ 4, %bb_inst_231 ]
  %r1.3 = phi i64 [ %381, %bb_inst_258 ], [ %368, %bb_inst_231 ]
  %369 = add i64 %r6.2, %r3.0
  %370 = add i64 %r7.2, %r0.0
  br label %bb_inst_227

bb_inst_257:                                      ; preds = %bb_inst_227
  %371 = icmp eq i64 %344, 0
  br i1 %371, label %bb_inst_271, label %bb_inst_258

bb_inst_258:                                      ; preds = %bb_inst_257
  %372 = inttoptr i64 %r0.0 to ptr
  %373 = load i8, ptr %372, align 1
  %374 = zext i8 %373 to i64
  %375 = mul nuw nsw i64 %374, 374761393
  %376 = add i64 %375, %r8.1
  %377 = shl i64 %376, 11
  %378 = lshr i64 %376, 21
  %379 = and i64 %378, 2047
  %380 = or i64 %379, %377
  %381 = mul i64 %380, -1640531535
  br label %bb_inst_252

bb_inst_271:                                      ; preds = %bb_inst_257
  %382 = lshr i64 %r8.1, 15
  %383 = and i64 %382, 131071
  %384 = xor i64 %383, %r8.1
  %385 = mul i64 %384, -2048144777
  %386 = lshr i64 %385, 13
  %387 = and i64 %386, 524287
  %388 = xor i64 %387, %385
  %389 = mul i64 %388, -1028477379
  %390 = lshr i64 %389, 16
  %391 = and i64 %390, 65534
  %.masked = and i64 %389, 4294967294
  %392 = icmp eq i64 %391, %.masked
  br i1 %392, label %bb_inst_321, label %bb_inst_295

bb_inst_295:                                      ; preds = %bb_inst_271
  %393 = load i64, ptr %18, align 8
  %394 = inttoptr i64 %393 to ptr
  %395 = load i16, ptr %394, align 2
  %396 = zext i16 %395 to i32
  %397 = load i64, ptr %28, align 8
  %398 = inttoptr i64 %397 to ptr
  %399 = getelementptr i8, ptr %398, i64 12
  %400 = load i32, ptr %399, align 4
  %401 = xor i32 %400, %396
  %402 = getelementptr i8, ptr %394, i64 2
  %403 = load i16, ptr %402, align 2
  %404 = zext i16 %403 to i32
  %405 = xor i32 %401, %404
  %406 = and i32 %405, 1
  store i32 %406, ptr %19, align 4
  %407 = call i64 @_bpf_helper_ext_0001(i64 17179869185, i64 %20, i64 %393, i64 4294934528, i64 4292870144)
  %408 = icmp eq i64 %407, 0
  br i1 %408, label %bb_inst_37, label %bb_inst_312

bb_inst_312:                                      ; preds = %bb_inst_295
  store i32 0, ptr %19, align 4
  %409 = call i64 @_bpf_helper_ext_0001(i64 17179869184, i64 %20, i64 %393, i64 4294934528, i64 4292870144)
  %410 = icmp eq i64 %409, 0
  br i1 %410, label %bb_inst_37, label %bb_inst_339

bb_inst_321:                                      ; preds = %bb_inst_271
  store i32 1, ptr %19, align 4
  %411 = call i64 @_bpf_helper_ext_0001(i64 17179869185, i64 %20, i64 %389, i64 4294934528, i64 4292870144)
  %412 = icmp eq i64 %411, 0
  br i1 %412, label %bb_inst_37, label %bb_inst_331

bb_inst_331:                                      ; preds = %bb_inst_321
  store i32 0, ptr %19, align 4
  %413 = call i64 @_bpf_helper_ext_0001(i64 17179869184, i64 %20, i64 %389, i64 4294934528, i64 4292870144)
  %414 = icmp eq i64 %413, 0
  br i1 %414, label %bb_inst_37, label %bb_inst_339

bb_inst_339:                                      ; preds = %bb_inst_312, %bb_inst_331
  %r6.3 = phi i64 [ %411, %bb_inst_331 ], [ %407, %bb_inst_312 ]
  %r0.1 = phi i64 [ %413, %bb_inst_331 ], [ %409, %bb_inst_312 ]
  %415 = inttoptr i64 %r6.3 to ptr
  %416 = getelementptr i8, ptr %415, i64 4
  %417 = load i16, ptr %416, align 2
  %418 = inttoptr i64 %331 to ptr
  %419 = getelementptr i8, ptr %418, i64 4
  store i16 %417, ptr %419, align 2
  %420 = getelementptr i8, ptr %415, i64 2
  %421 = load i16, ptr %420, align 2
  %422 = getelementptr i8, ptr %418, i64 2
  store i16 %421, ptr %422, align 2
  %423 = load i16, ptr %415, align 2
  store i16 %423, ptr %418, align 2
  %424 = add i64 %331, 6
  %425 = inttoptr i64 %r0.1 to ptr
  %426 = getelementptr i8, ptr %425, i64 4
  %427 = load i16, ptr %426, align 2
  %428 = inttoptr i64 %424 to ptr
  %429 = getelementptr i8, ptr %428, i64 4
  store i16 %427, ptr %429, align 2
  %430 = load i16, ptr %425, align 2
  %431 = getelementptr i8, ptr %418, i64 6
  store i16 %430, ptr %431, align 2
  %432 = getelementptr i8, ptr %425, i64 2
  %433 = load i16, ptr %432, align 2
  %434 = getelementptr i8, ptr %428, i64 2
  store i16 %433, ptr %434, align 2
  %435 = getelementptr i8, ptr %415, i64 8
  %436 = load i32, ptr %435, align 4
  %rev = call i32 @llvm.bswap.i32(i32 %436)
  %437 = load i64, ptr %28, align 8
  %438 = inttoptr i64 %437 to ptr
  %439 = getelementptr i8, ptr %438, i64 16
  store i32 %rev, ptr %439, align 4
  %440 = getelementptr i8, ptr %425, i64 8
  %441 = load i32, ptr %440, align 4
  %rev681 = call i32 @llvm.bswap.i32(i32 %441)
  %442 = getelementptr i8, ptr %438, i64 12
  store i32 %rev681, ptr %442, align 4
  %443 = getelementptr i8, ptr %438, i64 10
  store i16 0, ptr %443, align 2
  %444 = call i64 @_bpf_helper_ext_0028(i64 0, i64 0, i64 %437, i64 20, i64 0)
  %445 = and i64 %444, 65535
  %446 = lshr i64 %444, 16
  %447 = and i64 %446, 65535
  %448 = add nuw nsw i64 %447, %445
  %449 = lshr i64 %448, 16
  %450 = add nuw nsw i64 %449, %448
  %451 = trunc i64 %450 to i16
  %452 = xor i16 %451, -1
  store i16 %452, ptr %443, align 2
  br label %bb_inst_385

bb_inst_385:                                      ; preds = %bb_inst_385, %bb_inst_339
  %r2.2 = phi i64 [ 0, %bb_inst_339 ], [ %457, %bb_inst_385 ]
  %r6.4 = phi i64 [ 0, %bb_inst_339 ], [ %458, %bb_inst_385 ]
  %453 = add i64 %r6.4, %331
  %454 = inttoptr i64 %453 to ptr
  %455 = load i8, ptr %454, align 1
  %456 = zext i8 %455 to i64
  %457 = add i64 %r2.2, %456
  %458 = add nuw nsw i64 %r6.4, 1
  %.not682 = icmp eq i64 %458, 60
  br i1 %.not682, label %bb_inst_391, label %bb_inst_385

bb_inst_391:                                      ; preds = %bb_inst_385
  %459 = add i64 %457, -2048144777
  %460 = insertelement <2 x i64> poison, i64 %457, i64 0
  %461 = shufflevector <2 x i64> %460, <2 x i64> poison, <2 x i32> zeroinitializer
  %462 = add <2 x i64> %461, <i64 1640531535, i64 606290984>
  store i64 %457, ptr %18, align 8
  %463 = extractelement <2 x i64> %462, i64 0
  store i64 %463, ptr %44, align 8
  %464 = getelementptr i8, ptr %418, i64 13
  %465 = load i8, ptr %464, align 1
  %466 = getelementptr i8, ptr %418, i64 12
  %467 = load i8, ptr %466, align 1
  %468 = getelementptr i8, ptr %418, i64 1
  %469 = load i8, ptr %468, align 1
  %470 = insertelement <2 x i8> poison, i8 %465, i64 0
  %471 = insertelement <2 x i8> %470, i8 %469, i64 1
  %472 = zext <2 x i8> %471 to <2 x i64>
  %473 = shl nuw nsw <2 x i64> %472, <i64 8, i64 8>
  %474 = load i8, ptr %418, align 1
  %475 = insertelement <2 x i8> poison, i8 %467, i64 0
  %476 = insertelement <2 x i8> %475, i8 %474, i64 1
  %477 = zext <2 x i8> %476 to <2 x i64>
  %478 = or <2 x i64> %473, %477
  %479 = getelementptr i8, ptr %418, i64 5
  %480 = load i8, ptr %479, align 1
  %481 = zext i8 %480 to i64
  %482 = shl nuw nsw i64 %481, 8
  %483 = load i8, ptr %419, align 1
  %484 = zext i8 %483 to i64
  %485 = or i64 %482, %484
  %486 = load i8, ptr %422, align 1
  %487 = getelementptr i8, ptr %418, i64 14
  %488 = load i8, ptr %487, align 1
  %489 = insertelement <2 x i8> poison, i8 %488, i64 0
  %490 = insertelement <2 x i8> %489, i8 %486, i64 1
  %491 = zext <2 x i8> %490 to <2 x i64>
  %492 = shl nuw nsw <2 x i64> %491, <i64 16, i64 16>
  %493 = or <2 x i64> %478, %492
  %494 = getelementptr i8, ptr %418, i64 9
  %495 = load i8, ptr %494, align 1
  %496 = zext i8 %495 to i64
  %497 = shl nuw nsw i64 %496, 8
  %498 = getelementptr i8, ptr %418, i64 8
  %499 = load i8, ptr %498, align 1
  %500 = zext i8 %499 to i64
  %501 = or i64 %497, %500
  %502 = getelementptr i8, ptr %418, i64 10
  %503 = load i8, ptr %502, align 1
  %504 = zext i8 %503 to i64
  %505 = shl nuw nsw i64 %504, 16
  %506 = or i64 %501, %505
  %507 = getelementptr i8, ptr %418, i64 11
  %508 = load i8, ptr %507, align 1
  %509 = zext i8 %508 to i64
  %510 = shl nuw nsw i64 %509, 24
  %511 = or i64 %506, %510
  %512 = getelementptr i8, ptr %418, i64 15
  %513 = load i8, ptr %512, align 1
  %514 = getelementptr i8, ptr %418, i64 3
  %515 = load i8, ptr %514, align 1
  %516 = insertelement <2 x i8> poison, i8 %513, i64 0
  %517 = insertelement <2 x i8> %516, i8 %515, i64 1
  %518 = zext <2 x i8> %517 to <2 x i64>
  %519 = shl nuw nsw <2 x i64> %518, <i64 24, i64 24>
  %520 = or <2 x i64> %493, %519
  %521 = load i8, ptr %431, align 1
  %522 = zext i8 %521 to i64
  %523 = shl nuw nsw i64 %522, 16
  %524 = or i64 %485, %523
  %525 = getelementptr i8, ptr %418, i64 7
  %526 = load i8, ptr %525, align 1
  %527 = zext i8 %526 to i64
  %528 = shl nuw nsw i64 %527, 24
  %529 = or i64 %524, %528
  %530 = mul nsw i64 %529, -2048144777
  %531 = add i64 %530, %459
  %532 = mul nsw <2 x i64> %520, <i64 -2048144777, i64 -2048144777>
  %533 = add <2 x i64> %532, %462
  %534 = mul nsw i64 %511, -2048144777
  %535 = add i64 %534, %457
  %536 = shl i64 %531, 13
  %537 = lshr i64 %531, 19
  %538 = and i64 %537, 8191
  %539 = or i64 %538, %536
  %540 = shl i64 %535, 13
  %541 = lshr i64 %535, 19
  %542 = and i64 %541, 8191
  %543 = or i64 %542, %540
  %544 = shl <2 x i64> %533, <i64 13, i64 13>
  %545 = lshr <2 x i64> %533, <i64 19, i64 19>
  %546 = and <2 x i64> %545, <i64 8191, i64 8191>
  %547 = or <2 x i64> %546, %544
  %548 = add i64 %331, 16
  %549 = mul i64 %543, -1640531535
  %550 = mul i64 %539, -1640531535
  %551 = mul <2 x i64> %547, <i64 -1640531535, i64 -1640531535>
  %552 = extractelement <2 x i64> %551, i64 0
  store i64 %552, ptr %44, align 8
  %553 = inttoptr i64 %548 to ptr
  %554 = getelementptr i8, ptr %553, i64 13
  %555 = load i8, ptr %554, align 1
  %556 = getelementptr i8, ptr %553, i64 12
  %557 = load i8, ptr %556, align 1
  %558 = getelementptr i8, ptr %553, i64 1
  %559 = load i8, ptr %558, align 1
  %560 = insertelement <2 x i8> poison, i8 %555, i64 0
  %561 = insertelement <2 x i8> %560, i8 %559, i64 1
  %562 = zext <2 x i8> %561 to <2 x i64>
  %563 = shl nuw nsw <2 x i64> %562, <i64 8, i64 8>
  %564 = load i8, ptr %553, align 1
  %565 = insertelement <2 x i8> poison, i8 %557, i64 0
  %566 = insertelement <2 x i8> %565, i8 %564, i64 1
  %567 = zext <2 x i8> %566 to <2 x i64>
  %568 = or <2 x i64> %563, %567
  %569 = getelementptr i8, ptr %553, i64 5
  %570 = load i8, ptr %569, align 1
  %571 = zext i8 %570 to i64
  %572 = shl nuw nsw i64 %571, 8
  %573 = getelementptr i8, ptr %553, i64 4
  %574 = load i8, ptr %573, align 1
  %575 = zext i8 %574 to i64
  %576 = or i64 %572, %575
  %577 = getelementptr i8, ptr %553, i64 2
  %578 = load i8, ptr %577, align 1
  %579 = getelementptr i8, ptr %553, i64 14
  %580 = load i8, ptr %579, align 1
  %581 = insertelement <2 x i8> poison, i8 %580, i64 0
  %582 = insertelement <2 x i8> %581, i8 %578, i64 1
  %583 = zext <2 x i8> %582 to <2 x i64>
  %584 = shl nuw nsw <2 x i64> %583, <i64 16, i64 16>
  %585 = or <2 x i64> %568, %584
  %586 = getelementptr i8, ptr %553, i64 9
  %587 = load i8, ptr %586, align 1
  %588 = zext i8 %587 to i64
  %589 = shl nuw nsw i64 %588, 8
  %590 = getelementptr i8, ptr %553, i64 8
  %591 = load i8, ptr %590, align 1
  %592 = zext i8 %591 to i64
  %593 = or i64 %589, %592
  %594 = getelementptr i8, ptr %553, i64 10
  %595 = load i8, ptr %594, align 1
  %596 = zext i8 %595 to i64
  %597 = shl nuw nsw i64 %596, 16
  %598 = or i64 %593, %597
  %599 = getelementptr i8, ptr %553, i64 11
  %600 = load i8, ptr %599, align 1
  %601 = zext i8 %600 to i64
  %602 = shl nuw nsw i64 %601, 24
  %603 = or i64 %598, %602
  %604 = getelementptr i8, ptr %553, i64 15
  %605 = load i8, ptr %604, align 1
  %606 = getelementptr i8, ptr %553, i64 3
  %607 = load i8, ptr %606, align 1
  %608 = insertelement <2 x i8> poison, i8 %605, i64 0
  %609 = insertelement <2 x i8> %608, i8 %607, i64 1
  %610 = zext <2 x i8> %609 to <2 x i64>
  %611 = shl nuw nsw <2 x i64> %610, <i64 24, i64 24>
  %612 = or <2 x i64> %585, %611
  %613 = getelementptr i8, ptr %553, i64 6
  %614 = load <2 x i8>, ptr %613, align 1
  %615 = zext <2 x i8> %614 to <2 x i64>
  %616 = shl nuw nsw <2 x i64> %615, <i64 16, i64 24>
  %617 = extractelement <2 x i64> %616, i64 0
  %618 = or i64 %576, %617
  %619 = extractelement <2 x i64> %616, i64 1
  %620 = or i64 %618, %619
  %621 = mul nsw i64 %620, -2048144777
  %622 = add i64 %621, %550
  %623 = mul nsw <2 x i64> %612, <i64 -2048144777, i64 -2048144777>
  %624 = add <2 x i64> %623, %551
  %625 = mul nsw i64 %603, -2048144777
  %626 = add i64 %625, %549
  %627 = shl i64 %622, 13
  %628 = lshr i64 %622, 19
  %629 = and i64 %628, 8191
  %630 = or i64 %629, %627
  %631 = shl i64 %626, 13
  %632 = lshr i64 %626, 19
  %633 = and i64 %632, 8191
  %634 = or i64 %633, %631
  %635 = shl <2 x i64> %624, <i64 13, i64 13>
  %636 = lshr <2 x i64> %624, <i64 19, i64 19>
  %637 = and <2 x i64> %636, <i64 8191, i64 8191>
  %638 = or <2 x i64> %637, %635
  %639 = add i64 %331, 32
  %640 = mul i64 %634, -1640531535
  %641 = mul i64 %630, -1640531535
  %642 = mul <2 x i64> %638, <i64 -1640531535, i64 -1640531535>
  %643 = extractelement <2 x i64> %642, i64 0
  store i64 %643, ptr %44, align 8
  %644 = inttoptr i64 %639 to ptr
  %645 = getelementptr i8, ptr %644, i64 13
  %646 = load i8, ptr %645, align 1
  %647 = getelementptr i8, ptr %644, i64 12
  %648 = load i8, ptr %647, align 1
  %649 = getelementptr i8, ptr %644, i64 1
  %650 = load i8, ptr %649, align 1
  %651 = insertelement <2 x i8> poison, i8 %646, i64 0
  %652 = insertelement <2 x i8> %651, i8 %650, i64 1
  %653 = zext <2 x i8> %652 to <2 x i64>
  %654 = shl nuw nsw <2 x i64> %653, <i64 8, i64 8>
  %655 = load i8, ptr %644, align 1
  %656 = insertelement <2 x i8> poison, i8 %648, i64 0
  %657 = insertelement <2 x i8> %656, i8 %655, i64 1
  %658 = zext <2 x i8> %657 to <2 x i64>
  %659 = or <2 x i64> %654, %658
  %660 = getelementptr i8, ptr %644, i64 5
  %661 = load i8, ptr %660, align 1
  %662 = zext i8 %661 to i64
  %663 = shl nuw nsw i64 %662, 8
  %664 = getelementptr i8, ptr %644, i64 4
  %665 = load i8, ptr %664, align 1
  %666 = zext i8 %665 to i64
  %667 = or i64 %663, %666
  %668 = getelementptr i8, ptr %644, i64 2
  %669 = load i8, ptr %668, align 1
  %670 = getelementptr i8, ptr %644, i64 14
  %671 = load i8, ptr %670, align 1
  %672 = insertelement <2 x i8> poison, i8 %671, i64 0
  %673 = insertelement <2 x i8> %672, i8 %669, i64 1
  %674 = zext <2 x i8> %673 to <2 x i64>
  %675 = shl nuw nsw <2 x i64> %674, <i64 16, i64 16>
  %676 = or <2 x i64> %659, %675
  %677 = getelementptr i8, ptr %644, i64 9
  %678 = load i8, ptr %677, align 1
  %679 = zext i8 %678 to i64
  %680 = shl nuw nsw i64 %679, 8
  %681 = getelementptr i8, ptr %644, i64 8
  %682 = load i8, ptr %681, align 1
  %683 = zext i8 %682 to i64
  %684 = or i64 %680, %683
  %685 = getelementptr i8, ptr %644, i64 10
  %686 = load i8, ptr %685, align 1
  %687 = zext i8 %686 to i64
  %688 = shl nuw nsw i64 %687, 16
  %689 = or i64 %684, %688
  %690 = getelementptr i8, ptr %644, i64 11
  %691 = load i8, ptr %690, align 1
  %692 = zext i8 %691 to i64
  %693 = shl nuw nsw i64 %692, 24
  %694 = or i64 %689, %693
  %695 = getelementptr i8, ptr %644, i64 15
  %696 = load i8, ptr %695, align 1
  %697 = getelementptr i8, ptr %644, i64 3
  %698 = load i8, ptr %697, align 1
  %699 = insertelement <2 x i8> poison, i8 %696, i64 0
  %700 = insertelement <2 x i8> %699, i8 %698, i64 1
  %701 = zext <2 x i8> %700 to <2 x i64>
  %702 = shl nuw nsw <2 x i64> %701, <i64 24, i64 24>
  %703 = or <2 x i64> %676, %702
  %704 = getelementptr i8, ptr %644, i64 6
  %705 = load <2 x i8>, ptr %704, align 1
  %706 = zext <2 x i8> %705 to <2 x i64>
  %707 = shl nuw nsw <2 x i64> %706, <i64 16, i64 24>
  %708 = extractelement <2 x i64> %707, i64 0
  %709 = or i64 %667, %708
  %710 = extractelement <2 x i64> %707, i64 1
  %711 = or i64 %709, %710
  %712 = mul nsw i64 %711, -2048144777
  %713 = add i64 %712, %641
  %714 = mul nsw <2 x i64> %703, <i64 -2048144777, i64 -2048144777>
  %715 = add <2 x i64> %714, %642
  %716 = mul nsw i64 %694, -2048144777
  %717 = add i64 %716, %640
  %718 = shl i64 %713, 13
  %719 = lshr i64 %713, 19
  %720 = and i64 %719, 8191
  %721 = or i64 %720, %718
  %722 = shl i64 %717, 13
  %723 = lshr i64 %717, 19
  %724 = and i64 %723, 8191
  %725 = or i64 %724, %722
  %726 = shl <2 x i64> %715, <i64 13, i64 13>
  %727 = lshr <2 x i64> %715, <i64 19, i64 19>
  %728 = and <2 x i64> %727, <i64 8191, i64 8191>
  %729 = or <2 x i64> %728, %726
  %730 = mul i64 %725, -1640531535
  %731 = mul i64 %721, -1640531535
  %732 = mul <2 x i64> %729, <i64 -1640531535, i64 -1640531535>
  %733 = lshr i64 %731, 25
  %734 = and i64 %733, 127
  %735 = mul i64 %721, -209988036480
  %736 = extractelement <2 x i64> %729, i64 1
  %737 = mul i64 %736, -3281063070
  %738 = lshr i64 %730, 20
  %739 = and i64 %738, 4095
  %740 = mul i64 %725, -6719617167360
  %741 = lshr <2 x i64> %732, <i64 14, i64 31>
  %742 = and <2 x i64> %741, <i64 262143, i64 1>
  %743 = extractelement <2 x i64> %729, i64 0
  %744 = mul i64 %743, -430055498711040
  %745 = or i64 %740, 60
  %746 = add i64 %745, %744
  %747 = add i64 %746, %739
  %748 = add i64 %747, %737
  %749 = extractelement <2 x i64> %742, i64 0
  %750 = add i64 %748, %749
  %751 = extractelement <2 x i64> %742, i64 1
  %752 = add i64 %750, %751
  %753 = add i64 %752, %735
  %754 = add i64 %753, %734
  %755 = load i64, ptr %43, align 8
  %756 = load i64, ptr %343, align 8
  br label %bb_inst_524

bb_inst_524:                                      ; preds = %bb_inst_549, %bb_inst_391
  %r9.1 = phi i64 [ %756, %bb_inst_391 ], [ %783, %bb_inst_549 ]
  %r1.5 = phi i64 [ %754, %bb_inst_391 ], [ %r2.3, %bb_inst_549 ]
  %r0.3 = phi i64 [ 12, %bb_inst_391 ], [ %782, %bb_inst_549 ]
  %757 = and i64 %r0.3, 4294967295
  %758 = icmp ult i64 %757, 4
  br i1 %758, label %bb_inst_554, label %bb_inst_528

bb_inst_528:                                      ; preds = %bb_inst_524
  %759 = inttoptr i64 %r9.1 to ptr
  %760 = getelementptr i8, ptr %759, i64 1
  %761 = load i8, ptr %760, align 1
  %762 = zext i8 %761 to i64
  %763 = shl nuw nsw i64 %762, 8
  %764 = load i8, ptr %759, align 1
  %765 = zext i8 %764 to i64
  %766 = or i64 %763, %765
  %767 = getelementptr i8, ptr %759, i64 2
  %768 = load <2 x i8>, ptr %767, align 1
  %769 = zext <2 x i8> %768 to <2 x i64>
  %770 = shl nuw nsw <2 x i64> %769, <i64 16, i64 24>
  %771 = extractelement <2 x i64> %770, i64 0
  %772 = or i64 %766, %771
  %773 = extractelement <2 x i64> %770, i64 1
  %774 = or i64 %772, %773
  %775 = mul nsw i64 %774, -1028477379
  %776 = add i64 %775, %r1.5
  %777 = shl i64 %776, 17
  %778 = lshr i64 %776, 15
  %779 = and i64 %778, 131071
  %780 = or i64 %779, %777
  %781 = mul i64 %780, 668265263
  br label %bb_inst_549

bb_inst_549:                                      ; preds = %bb_inst_555, %bb_inst_528
  %r2.3 = phi i64 [ %794, %bb_inst_555 ], [ %781, %bb_inst_528 ]
  %r6.6 = phi i64 [ 4294967295, %bb_inst_555 ], [ 4294967292, %bb_inst_528 ]
  %r7.4 = phi i64 [ 1, %bb_inst_555 ], [ 4, %bb_inst_528 ]
  %782 = add i64 %r6.6, %r0.3
  %783 = add i64 %r7.4, %r9.1
  br label %bb_inst_524

bb_inst_554:                                      ; preds = %bb_inst_524
  %784 = icmp eq i64 %757, 0
  br i1 %784, label %bb_inst_568, label %bb_inst_555

bb_inst_555:                                      ; preds = %bb_inst_554
  %785 = inttoptr i64 %r9.1 to ptr
  %786 = load i8, ptr %785, align 1
  %787 = zext i8 %786 to i64
  %788 = mul nuw nsw i64 %787, 374761393
  %789 = add i64 %788, %r1.5
  %790 = shl i64 %789, 11
  %791 = lshr i64 %789, 21
  %792 = and i64 %791, 2047
  %793 = or i64 %792, %790
  %794 = mul i64 %793, -1640531535
  br label %bb_inst_549

bb_inst_568:                                      ; preds = %bb_inst_554
  %795 = lshr i64 %r1.5, 15
  %796 = and i64 %795, 131071
  %797 = xor i64 %796, %r1.5
  %798 = mul i64 %797, -2048144777
  %799 = lshr i64 %798, 13
  %800 = and i64 %799, 524287
  %801 = xor i64 %800, %798
  %802 = load i64, ptr %18, align 8
  %803 = lshr i64 %802, 24
  %804 = trunc i64 %803 to i8
  %805 = inttoptr i64 %755 to ptr
  %806 = getelementptr i8, ptr %805, i64 37
  store i8 %804, ptr %806, align 1
  %807 = lshr i64 %802, 16
  %808 = trunc i64 %807 to i8
  %809 = getelementptr i8, ptr %805, i64 36
  store i8 %808, ptr %809, align 1
  %810 = trunc i64 %802 to i8
  %811 = getelementptr i8, ptr %805, i64 34
  store i8 %810, ptr %811, align 1
  %812 = lshr i64 %802, 8
  %813 = trunc i64 %812 to i8
  %814 = getelementptr i8, ptr %805, i64 35
  store i8 %813, ptr %814, align 1
  %815 = mul i64 %801, -1028477379
  %816 = lshr i64 %815, 24
  %817 = trunc i64 %816 to i8
  %818 = getelementptr i8, ptr %805, i64 41
  store i8 %817, ptr %818, align 1
  %819 = lshr i64 %815, 16
  %820 = trunc i64 %819 to i8
  %821 = getelementptr i8, ptr %805, i64 40
  store i8 %820, ptr %821, align 1
  %822 = and i64 %819, 65535
  %823 = xor i64 %822, %815
  %824 = trunc i64 %823 to i8
  %825 = getelementptr i8, ptr %805, i64 38
  store i8 %824, ptr %825, align 1
  %826 = lshr i64 %823, 8
  %827 = trunc i64 %826 to i8
  %828 = getelementptr i8, ptr %805, i64 39
  store i8 %827, ptr %828, align 1
  br label %bb_inst_37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

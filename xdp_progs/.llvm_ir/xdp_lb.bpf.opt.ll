; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.llvm_ir/xdp_lb.bpf.ll'
source_filename = "bpf-jit"

declare i64 @__lddw_helper_map_by_fd(i32) local_unnamed_addr

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0028(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr nocapture readonly %0, i64 %1) local_unnamed_addr {
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
  %21 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %22 = call i64 @_bpf_helper_ext_0001(i64 %21, i64 %20, i64 undef, i64 undef, i64 undef)
  %.not675 = icmp eq i64 %22, 0
  br i1 %.not675, label %bb_inst_61, label %bb_inst_77

bb_inst_61:                                       ; preds = %bb_inst_52
  %23 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i64 748844888709537908, ptr %23, align 8
  %24 = getelementptr inbounds i8, ptr %stackEnd, i64 -24
  store i64 8029390814170213999, ptr %24, align 8
  %25 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  store i64 7142837026506239043, ptr %25, align 8
  %26 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i8 0, ptr %26, align 8
  %27 = add i64 %2, -32
  %28 = call i64 @_bpf_helper_ext_0006(i64 %27, i64 25, i64 undef, i64 undef, i64 undef)
  br label %bb_inst_37

bb_inst_77:                                       ; preds = %bb_inst_52
  %29 = getelementptr inbounds i8, ptr %stackEnd, i64 -56
  store i64 %6, ptr %29, align 8
  %30 = add i64 %5, 1200
  %31 = icmp ugt i64 %4, %30
  %32 = add i64 %5, 60
  %33 = icmp ugt i64 %32, %4
  %or.cond = or i1 %31, %33
  br i1 %or.cond, label %bb_inst_37, label %bb_inst_87

bb_inst_87:                                       ; preds = %bb_inst_77, %bb_inst_87
  %r6.0 = phi i64 [ %38, %bb_inst_87 ], [ 0, %bb_inst_77 ]
  %r1.2 = phi i64 [ %39, %bb_inst_87 ], [ 0, %bb_inst_77 ]
  %34 = add i64 %r1.2, %5
  %35 = inttoptr i64 %34 to ptr
  %36 = load i8, ptr %35, align 1
  %37 = zext i8 %36 to i64
  %38 = add i64 %r6.0, %37
  %39 = add nuw nsw i64 %r1.2, 1
  %.not676 = icmp eq i64 %39, 60
  br i1 %.not676, label %bb_inst_93, label %bb_inst_87

bb_inst_93:                                       ; preds = %bb_inst_87
  %40 = add i64 %38, -2048144777
  %41 = insertelement <2 x i64> poison, i64 %38, i64 0
  %42 = shufflevector <2 x i64> %41, <2 x i64> poison, <2 x i32> zeroinitializer
  %43 = add <2 x i64> %42, <i64 1640531535, i64 606290984>
  %44 = getelementptr inbounds i8, ptr %stackEnd, i64 -64
  store i64 %5, ptr %44, align 8
  %45 = getelementptr inbounds i8, ptr %stackEnd, i64 -40
  %46 = extractelement <2 x i64> %43, i64 0
  store i64 %46, ptr %45, align 8
  %47 = inttoptr i64 %5 to ptr
  %48 = getelementptr i8, ptr %47, i64 13
  %49 = load i8, ptr %48, align 1
  %50 = getelementptr i8, ptr %47, i64 12
  %51 = load i8, ptr %50, align 1
  %52 = getelementptr i8, ptr %47, i64 1
  %53 = load i8, ptr %52, align 1
  %54 = insertelement <2 x i8> poison, i8 %49, i64 0
  %55 = insertelement <2 x i8> %54, i8 %53, i64 1
  %56 = zext <2 x i8> %55 to <2 x i64>
  %57 = shl nuw nsw <2 x i64> %56, <i64 8, i64 8>
  %58 = load i8, ptr %47, align 1
  %59 = insertelement <2 x i8> poison, i8 %51, i64 0
  %60 = insertelement <2 x i8> %59, i8 %58, i64 1
  %61 = zext <2 x i8> %60 to <2 x i64>
  %62 = or <2 x i64> %57, %61
  %63 = getelementptr i8, ptr %47, i64 5
  %64 = load i8, ptr %63, align 1
  %65 = zext i8 %64 to i64
  %66 = shl nuw nsw i64 %65, 8
  %67 = getelementptr i8, ptr %47, i64 4
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i64
  %70 = or i64 %66, %69
  %71 = getelementptr i8, ptr %47, i64 2
  %72 = load i8, ptr %71, align 1
  %73 = getelementptr i8, ptr %47, i64 14
  %74 = load i8, ptr %73, align 1
  %75 = insertelement <2 x i8> poison, i8 %74, i64 0
  %76 = insertelement <2 x i8> %75, i8 %72, i64 1
  %77 = zext <2 x i8> %76 to <2 x i64>
  %78 = shl nuw nsw <2 x i64> %77, <i64 16, i64 16>
  %79 = or <2 x i64> %62, %78
  %80 = getelementptr i8, ptr %47, i64 9
  %81 = load i8, ptr %80, align 1
  %82 = zext i8 %81 to i64
  %83 = shl nuw nsw i64 %82, 8
  %84 = getelementptr i8, ptr %47, i64 8
  %85 = load i8, ptr %84, align 1
  %86 = zext i8 %85 to i64
  %87 = or i64 %83, %86
  %88 = getelementptr i8, ptr %47, i64 10
  %89 = load i8, ptr %88, align 1
  %90 = zext i8 %89 to i64
  %91 = shl nuw nsw i64 %90, 16
  %92 = or i64 %87, %91
  %93 = getelementptr i8, ptr %47, i64 11
  %94 = load i8, ptr %93, align 1
  %95 = zext i8 %94 to i64
  %96 = shl nuw nsw i64 %95, 24
  %97 = or i64 %92, %96
  %98 = getelementptr i8, ptr %47, i64 15
  %99 = load i8, ptr %98, align 1
  %100 = getelementptr i8, ptr %47, i64 3
  %101 = load i8, ptr %100, align 1
  %102 = insertelement <2 x i8> poison, i8 %99, i64 0
  %103 = insertelement <2 x i8> %102, i8 %101, i64 1
  %104 = zext <2 x i8> %103 to <2 x i64>
  %105 = shl nuw nsw <2 x i64> %104, <i64 24, i64 24>
  %106 = or <2 x i64> %79, %105
  %107 = getelementptr i8, ptr %47, i64 6
  %108 = load i8, ptr %107, align 1
  %109 = zext i8 %108 to i64
  %110 = shl nuw nsw i64 %109, 16
  %111 = or i64 %70, %110
  %112 = getelementptr i8, ptr %47, i64 7
  %113 = load i8, ptr %112, align 1
  %114 = zext i8 %113 to i64
  %115 = shl nuw nsw i64 %114, 24
  %116 = or i64 %111, %115
  %117 = mul nsw i64 %116, -2048144777
  %118 = add i64 %117, %40
  %119 = mul nsw <2 x i64> %106, <i64 -2048144777, i64 -2048144777>
  %120 = add <2 x i64> %119, %43
  %121 = mul nsw i64 %97, -2048144777
  %122 = add i64 %121, %38
  %123 = shl i64 %118, 13
  %124 = lshr i64 %118, 19
  %125 = and i64 %124, 8191
  %126 = or i64 %125, %123
  %127 = shl i64 %122, 13
  %128 = lshr i64 %122, 19
  %129 = and i64 %128, 8191
  %130 = or i64 %129, %127
  %131 = shl <2 x i64> %120, <i64 13, i64 13>
  %132 = lshr <2 x i64> %120, <i64 19, i64 19>
  %133 = and <2 x i64> %132, <i64 8191, i64 8191>
  %134 = or <2 x i64> %133, %131
  %135 = add i64 %5, 16
  %136 = mul i64 %130, -1640531535
  %137 = mul i64 %126, -1640531535
  %138 = mul <2 x i64> %134, <i64 -1640531535, i64 -1640531535>
  %139 = extractelement <2 x i64> %138, i64 0
  store i64 %139, ptr %45, align 8
  %140 = inttoptr i64 %135 to ptr
  %141 = getelementptr i8, ptr %140, i64 13
  %142 = load i8, ptr %141, align 1
  %143 = getelementptr i8, ptr %140, i64 12
  %144 = load i8, ptr %143, align 1
  %145 = getelementptr i8, ptr %140, i64 1
  %146 = load i8, ptr %145, align 1
  %147 = insertelement <2 x i8> poison, i8 %142, i64 0
  %148 = insertelement <2 x i8> %147, i8 %146, i64 1
  %149 = zext <2 x i8> %148 to <2 x i64>
  %150 = shl nuw nsw <2 x i64> %149, <i64 8, i64 8>
  %151 = load i8, ptr %140, align 1
  %152 = insertelement <2 x i8> poison, i8 %144, i64 0
  %153 = insertelement <2 x i8> %152, i8 %151, i64 1
  %154 = zext <2 x i8> %153 to <2 x i64>
  %155 = or <2 x i64> %150, %154
  %156 = getelementptr i8, ptr %140, i64 5
  %157 = load i8, ptr %156, align 1
  %158 = zext i8 %157 to i64
  %159 = shl nuw nsw i64 %158, 8
  %160 = getelementptr i8, ptr %140, i64 4
  %161 = load i8, ptr %160, align 1
  %162 = zext i8 %161 to i64
  %163 = or i64 %159, %162
  %164 = getelementptr i8, ptr %140, i64 2
  %165 = load i8, ptr %164, align 1
  %166 = getelementptr i8, ptr %140, i64 14
  %167 = load i8, ptr %166, align 1
  %168 = insertelement <2 x i8> poison, i8 %167, i64 0
  %169 = insertelement <2 x i8> %168, i8 %165, i64 1
  %170 = zext <2 x i8> %169 to <2 x i64>
  %171 = shl nuw nsw <2 x i64> %170, <i64 16, i64 16>
  %172 = or <2 x i64> %155, %171
  %173 = getelementptr i8, ptr %140, i64 9
  %174 = load i8, ptr %173, align 1
  %175 = zext i8 %174 to i64
  %176 = shl nuw nsw i64 %175, 8
  %177 = getelementptr i8, ptr %140, i64 8
  %178 = load i8, ptr %177, align 1
  %179 = zext i8 %178 to i64
  %180 = or i64 %176, %179
  %181 = getelementptr i8, ptr %140, i64 10
  %182 = load i8, ptr %181, align 1
  %183 = zext i8 %182 to i64
  %184 = shl nuw nsw i64 %183, 16
  %185 = or i64 %180, %184
  %186 = getelementptr i8, ptr %140, i64 11
  %187 = load i8, ptr %186, align 1
  %188 = zext i8 %187 to i64
  %189 = shl nuw nsw i64 %188, 24
  %190 = or i64 %185, %189
  %191 = getelementptr i8, ptr %140, i64 15
  %192 = load i8, ptr %191, align 1
  %193 = getelementptr i8, ptr %140, i64 3
  %194 = load i8, ptr %193, align 1
  %195 = insertelement <2 x i8> poison, i8 %192, i64 0
  %196 = insertelement <2 x i8> %195, i8 %194, i64 1
  %197 = zext <2 x i8> %196 to <2 x i64>
  %198 = shl nuw nsw <2 x i64> %197, <i64 24, i64 24>
  %199 = or <2 x i64> %172, %198
  %200 = getelementptr i8, ptr %140, i64 6
  %201 = load <2 x i8>, ptr %200, align 1
  %202 = zext <2 x i8> %201 to <2 x i64>
  %203 = shl nuw nsw <2 x i64> %202, <i64 16, i64 24>
  %204 = extractelement <2 x i64> %203, i64 0
  %205 = or i64 %163, %204
  %206 = extractelement <2 x i64> %203, i64 1
  %207 = or i64 %205, %206
  %208 = mul nsw i64 %207, -2048144777
  %209 = add i64 %208, %137
  %210 = mul nsw <2 x i64> %199, <i64 -2048144777, i64 -2048144777>
  %211 = add <2 x i64> %210, %138
  %212 = mul nsw i64 %190, -2048144777
  %213 = add i64 %212, %136
  %214 = shl i64 %209, 13
  %215 = lshr i64 %209, 19
  %216 = and i64 %215, 8191
  %217 = or i64 %216, %214
  %218 = shl i64 %213, 13
  %219 = lshr i64 %213, 19
  %220 = and i64 %219, 8191
  %221 = or i64 %220, %218
  %222 = shl <2 x i64> %211, <i64 13, i64 13>
  %223 = lshr <2 x i64> %211, <i64 19, i64 19>
  %224 = and <2 x i64> %223, <i64 8191, i64 8191>
  %225 = or <2 x i64> %224, %222
  %226 = add i64 %5, 32
  %227 = mul i64 %221, -1640531535
  %228 = mul i64 %217, -1640531535
  %229 = mul <2 x i64> %225, <i64 -1640531535, i64 -1640531535>
  %230 = extractelement <2 x i64> %229, i64 0
  store i64 %230, ptr %45, align 8
  %231 = inttoptr i64 %226 to ptr
  %232 = getelementptr i8, ptr %231, i64 13
  %233 = load i8, ptr %232, align 1
  %234 = getelementptr i8, ptr %231, i64 12
  %235 = load i8, ptr %234, align 1
  %236 = getelementptr i8, ptr %231, i64 1
  %237 = load i8, ptr %236, align 1
  %238 = insertelement <2 x i8> poison, i8 %233, i64 0
  %239 = insertelement <2 x i8> %238, i8 %237, i64 1
  %240 = zext <2 x i8> %239 to <2 x i64>
  %241 = shl nuw nsw <2 x i64> %240, <i64 8, i64 8>
  %242 = load i8, ptr %231, align 1
  %243 = insertelement <2 x i8> poison, i8 %235, i64 0
  %244 = insertelement <2 x i8> %243, i8 %242, i64 1
  %245 = zext <2 x i8> %244 to <2 x i64>
  %246 = or <2 x i64> %241, %245
  %247 = getelementptr i8, ptr %231, i64 5
  %248 = load i8, ptr %247, align 1
  %249 = zext i8 %248 to i64
  %250 = shl nuw nsw i64 %249, 8
  %251 = getelementptr i8, ptr %231, i64 4
  %252 = load i8, ptr %251, align 1
  %253 = zext i8 %252 to i64
  %254 = or i64 %250, %253
  %255 = getelementptr i8, ptr %231, i64 2
  %256 = load i8, ptr %255, align 1
  %257 = getelementptr i8, ptr %231, i64 14
  %258 = load i8, ptr %257, align 1
  %259 = insertelement <2 x i8> poison, i8 %258, i64 0
  %260 = insertelement <2 x i8> %259, i8 %256, i64 1
  %261 = zext <2 x i8> %260 to <2 x i64>
  %262 = shl nuw nsw <2 x i64> %261, <i64 16, i64 16>
  %263 = or <2 x i64> %246, %262
  %264 = getelementptr i8, ptr %231, i64 9
  %265 = load i8, ptr %264, align 1
  %266 = zext i8 %265 to i64
  %267 = shl nuw nsw i64 %266, 8
  %268 = getelementptr i8, ptr %231, i64 8
  %269 = load i8, ptr %268, align 1
  %270 = zext i8 %269 to i64
  %271 = or i64 %267, %270
  %272 = getelementptr i8, ptr %231, i64 10
  %273 = load i8, ptr %272, align 1
  %274 = zext i8 %273 to i64
  %275 = shl nuw nsw i64 %274, 16
  %276 = or i64 %271, %275
  %277 = getelementptr i8, ptr %231, i64 11
  %278 = load i8, ptr %277, align 1
  %279 = zext i8 %278 to i64
  %280 = shl nuw nsw i64 %279, 24
  %281 = or i64 %276, %280
  %282 = getelementptr i8, ptr %231, i64 15
  %283 = load i8, ptr %282, align 1
  %284 = getelementptr i8, ptr %231, i64 3
  %285 = load i8, ptr %284, align 1
  %286 = insertelement <2 x i8> poison, i8 %283, i64 0
  %287 = insertelement <2 x i8> %286, i8 %285, i64 1
  %288 = zext <2 x i8> %287 to <2 x i64>
  %289 = shl nuw nsw <2 x i64> %288, <i64 24, i64 24>
  %290 = or <2 x i64> %263, %289
  %291 = getelementptr i8, ptr %231, i64 6
  %292 = load <2 x i8>, ptr %291, align 1
  %293 = zext <2 x i8> %292 to <2 x i64>
  %294 = shl nuw nsw <2 x i64> %293, <i64 16, i64 24>
  %295 = extractelement <2 x i64> %294, i64 0
  %296 = or i64 %254, %295
  %297 = extractelement <2 x i64> %294, i64 1
  %298 = or i64 %296, %297
  %299 = mul nsw i64 %298, -2048144777
  %300 = add i64 %299, %228
  %301 = mul nsw <2 x i64> %290, <i64 -2048144777, i64 -2048144777>
  %302 = add <2 x i64> %301, %229
  %303 = mul nsw i64 %281, -2048144777
  %304 = add i64 %303, %227
  %305 = shl i64 %300, 13
  %306 = lshr i64 %300, 19
  %307 = and i64 %306, 8191
  %308 = or i64 %307, %305
  %309 = shl i64 %304, 13
  %310 = lshr i64 %304, 19
  %311 = and i64 %310, 8191
  %312 = or i64 %311, %309
  %313 = shl <2 x i64> %302, <i64 13, i64 13>
  %314 = lshr <2 x i64> %302, <i64 19, i64 19>
  %315 = and <2 x i64> %314, <i64 8191, i64 8191>
  %316 = or <2 x i64> %315, %313
  %317 = mul i64 %312, -1640531535
  %318 = mul i64 %308, -1640531535
  %319 = mul <2 x i64> %316, <i64 -1640531535, i64 -1640531535>
  %320 = lshr i64 %318, 25
  %321 = and i64 %320, 127
  %322 = mul i64 %308, -209988036480
  %323 = extractelement <2 x i64> %316, i64 1
  %324 = mul i64 %323, -3281063070
  %325 = lshr i64 %317, 20
  %326 = and i64 %325, 4095
  %327 = mul i64 %312, -6719617167360
  %328 = lshr <2 x i64> %319, <i64 14, i64 31>
  %329 = and <2 x i64> %328, <i64 262143, i64 1>
  %330 = extractelement <2 x i64> %316, i64 0
  %331 = mul i64 %330, -430055498711040
  %332 = load i64, ptr %44, align 8
  %333 = add i64 %332, 48
  %334 = or i64 %327, 60
  %335 = add i64 %334, %331
  %336 = add i64 %335, %326
  %337 = add i64 %336, %324
  %338 = extractelement <2 x i64> %329, i64 0
  %339 = add i64 %337, %338
  %340 = extractelement <2 x i64> %329, i64 1
  %341 = add i64 %339, %340
  %342 = add i64 %341, %322
  %343 = add i64 %342, %321
  %344 = getelementptr inbounds i8, ptr %stackEnd, i64 -72
  store i64 %333, ptr %344, align 8
  br label %bb_inst_227

bb_inst_227:                                      ; preds = %bb_inst_252, %bb_inst_93
  %r3.0 = phi i64 [ 12, %bb_inst_93 ], [ %370, %bb_inst_252 ]
  %r8.1 = phi i64 [ %343, %bb_inst_93 ], [ %r1.3, %bb_inst_252 ]
  %r0.0 = phi i64 [ %333, %bb_inst_93 ], [ %371, %bb_inst_252 ]
  %345 = and i64 %r3.0, 4294967295
  %346 = icmp ult i64 %345, 4
  br i1 %346, label %bb_inst_257, label %bb_inst_231

bb_inst_231:                                      ; preds = %bb_inst_227
  %347 = inttoptr i64 %r0.0 to ptr
  %348 = getelementptr i8, ptr %347, i64 1
  %349 = load i8, ptr %348, align 1
  %350 = zext i8 %349 to i64
  %351 = shl nuw nsw i64 %350, 8
  %352 = load i8, ptr %347, align 1
  %353 = zext i8 %352 to i64
  %354 = or i64 %351, %353
  %355 = getelementptr i8, ptr %347, i64 2
  %356 = load <2 x i8>, ptr %355, align 1
  %357 = zext <2 x i8> %356 to <2 x i64>
  %358 = shl nuw nsw <2 x i64> %357, <i64 16, i64 24>
  %359 = extractelement <2 x i64> %358, i64 0
  %360 = or i64 %354, %359
  %361 = extractelement <2 x i64> %358, i64 1
  %362 = or i64 %360, %361
  %363 = mul nsw i64 %362, -1028477379
  %364 = add i64 %363, %r8.1
  %365 = shl i64 %364, 17
  %366 = lshr i64 %364, 15
  %367 = and i64 %366, 131071
  %368 = or i64 %367, %365
  %369 = mul i64 %368, 668265263
  br label %bb_inst_252

bb_inst_252:                                      ; preds = %bb_inst_258, %bb_inst_231
  %r6.2 = phi i64 [ 4294967295, %bb_inst_258 ], [ 4294967292, %bb_inst_231 ]
  %r7.2 = phi i64 [ 1, %bb_inst_258 ], [ 4, %bb_inst_231 ]
  %r1.3 = phi i64 [ %382, %bb_inst_258 ], [ %369, %bb_inst_231 ]
  %370 = add i64 %r6.2, %r3.0
  %371 = add i64 %r7.2, %r0.0
  br label %bb_inst_227

bb_inst_257:                                      ; preds = %bb_inst_227
  %372 = icmp eq i64 %345, 0
  br i1 %372, label %bb_inst_271, label %bb_inst_258

bb_inst_258:                                      ; preds = %bb_inst_257
  %373 = inttoptr i64 %r0.0 to ptr
  %374 = load i8, ptr %373, align 1
  %375 = zext i8 %374 to i64
  %376 = mul nuw nsw i64 %375, 374761393
  %377 = add i64 %376, %r8.1
  %378 = shl i64 %377, 11
  %379 = lshr i64 %377, 21
  %380 = and i64 %379, 2047
  %381 = or i64 %380, %378
  %382 = mul i64 %381, -1640531535
  br label %bb_inst_252

bb_inst_271:                                      ; preds = %bb_inst_257
  %383 = lshr i64 %r8.1, 15
  %384 = and i64 %383, 131071
  %385 = xor i64 %384, %r8.1
  %386 = mul i64 %385, -2048144777
  %387 = lshr i64 %386, 13
  %388 = and i64 %387, 524287
  %389 = xor i64 %388, %386
  %390 = mul i64 %389, -1028477379
  %391 = lshr i64 %390, 16
  %392 = and i64 %391, 65534
  %.masked = and i64 %390, 4294967294
  %393 = icmp eq i64 %392, %.masked
  br i1 %393, label %bb_inst_321, label %bb_inst_295

bb_inst_295:                                      ; preds = %bb_inst_271
  %394 = load i64, ptr %18, align 8
  %395 = inttoptr i64 %394 to ptr
  %396 = load i16, ptr %395, align 2
  %397 = zext i16 %396 to i32
  %398 = load i64, ptr %29, align 8
  %399 = inttoptr i64 %398 to ptr
  %400 = getelementptr i8, ptr %399, i64 12
  %401 = load i32, ptr %400, align 4
  %402 = xor i32 %401, %397
  %403 = getelementptr i8, ptr %395, i64 2
  %404 = load i16, ptr %403, align 2
  %405 = zext i16 %404 to i32
  %406 = xor i32 %402, %405
  %407 = and i32 %406, 1
  store i32 %407, ptr %19, align 4
  %408 = call i64 @__lddw_helper_map_by_fd(i32 5)
  %409 = call i64 @_bpf_helper_ext_0001(i64 %408, i64 %20, i64 %394, i64 4294934528, i64 4292870144)
  %410 = icmp eq i64 %409, 0
  br i1 %410, label %bb_inst_37, label %bb_inst_312

bb_inst_312:                                      ; preds = %bb_inst_295
  store i32 0, ptr %19, align 4
  %411 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %412 = call i64 @_bpf_helper_ext_0001(i64 %411, i64 %20, i64 %394, i64 4294934528, i64 4292870144)
  %413 = icmp eq i64 %412, 0
  br i1 %413, label %bb_inst_37, label %bb_inst_339

bb_inst_321:                                      ; preds = %bb_inst_271
  store i32 1, ptr %19, align 4
  %414 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %415 = call i64 @_bpf_helper_ext_0001(i64 %414, i64 %20, i64 %390, i64 4294934528, i64 4292870144)
  %416 = icmp eq i64 %415, 0
  br i1 %416, label %bb_inst_37, label %bb_inst_331

bb_inst_331:                                      ; preds = %bb_inst_321
  store i32 0, ptr %19, align 4
  %417 = call i64 @__lddw_helper_map_by_fd(i32 4)
  %418 = call i64 @_bpf_helper_ext_0001(i64 %417, i64 %20, i64 %390, i64 4294934528, i64 4292870144)
  %419 = icmp eq i64 %418, 0
  br i1 %419, label %bb_inst_37, label %bb_inst_339

bb_inst_339:                                      ; preds = %bb_inst_312, %bb_inst_331
  %r6.3 = phi i64 [ %415, %bb_inst_331 ], [ %409, %bb_inst_312 ]
  %r0.1 = phi i64 [ %418, %bb_inst_331 ], [ %412, %bb_inst_312 ]
  %420 = inttoptr i64 %r6.3 to ptr
  %421 = getelementptr i8, ptr %420, i64 4
  %422 = load i16, ptr %421, align 2
  %423 = inttoptr i64 %332 to ptr
  %424 = getelementptr i8, ptr %423, i64 4
  store i16 %422, ptr %424, align 2
  %425 = getelementptr i8, ptr %420, i64 2
  %426 = load i16, ptr %425, align 2
  %427 = getelementptr i8, ptr %423, i64 2
  store i16 %426, ptr %427, align 2
  %428 = load i16, ptr %420, align 2
  store i16 %428, ptr %423, align 2
  %429 = add i64 %332, 6
  %430 = inttoptr i64 %r0.1 to ptr
  %431 = getelementptr i8, ptr %430, i64 4
  %432 = load i16, ptr %431, align 2
  %433 = inttoptr i64 %429 to ptr
  %434 = getelementptr i8, ptr %433, i64 4
  store i16 %432, ptr %434, align 2
  %435 = load i16, ptr %430, align 2
  %436 = getelementptr i8, ptr %423, i64 6
  store i16 %435, ptr %436, align 2
  %437 = getelementptr i8, ptr %430, i64 2
  %438 = load i16, ptr %437, align 2
  %439 = getelementptr i8, ptr %433, i64 2
  store i16 %438, ptr %439, align 2
  %440 = getelementptr i8, ptr %420, i64 8
  %441 = load i32, ptr %440, align 4
  %rev = call i32 @llvm.bswap.i32(i32 %441)
  %442 = load i64, ptr %29, align 8
  %443 = inttoptr i64 %442 to ptr
  %444 = getelementptr i8, ptr %443, i64 16
  store i32 %rev, ptr %444, align 4
  %445 = getelementptr i8, ptr %430, i64 8
  %446 = load i32, ptr %445, align 4
  %rev681 = call i32 @llvm.bswap.i32(i32 %446)
  %447 = getelementptr i8, ptr %443, i64 12
  store i32 %rev681, ptr %447, align 4
  %448 = getelementptr i8, ptr %443, i64 10
  store i16 0, ptr %448, align 2
  %449 = call i64 @_bpf_helper_ext_0028(i64 0, i64 0, i64 %442, i64 20, i64 0)
  %450 = and i64 %449, 65535
  %451 = lshr i64 %449, 16
  %452 = and i64 %451, 65535
  %453 = add nuw nsw i64 %452, %450
  %454 = lshr i64 %453, 16
  %455 = add nuw nsw i64 %454, %453
  %456 = trunc i64 %455 to i16
  %457 = xor i16 %456, -1
  store i16 %457, ptr %448, align 2
  br label %bb_inst_385

bb_inst_385:                                      ; preds = %bb_inst_385, %bb_inst_339
  %r2.2 = phi i64 [ 0, %bb_inst_339 ], [ %462, %bb_inst_385 ]
  %r6.4 = phi i64 [ 0, %bb_inst_339 ], [ %463, %bb_inst_385 ]
  %458 = add i64 %r6.4, %332
  %459 = inttoptr i64 %458 to ptr
  %460 = load i8, ptr %459, align 1
  %461 = zext i8 %460 to i64
  %462 = add i64 %r2.2, %461
  %463 = add nuw nsw i64 %r6.4, 1
  %.not682 = icmp eq i64 %463, 60
  br i1 %.not682, label %bb_inst_391, label %bb_inst_385

bb_inst_391:                                      ; preds = %bb_inst_385
  %464 = add i64 %462, -2048144777
  %465 = insertelement <2 x i64> poison, i64 %462, i64 0
  %466 = shufflevector <2 x i64> %465, <2 x i64> poison, <2 x i32> zeroinitializer
  %467 = add <2 x i64> %466, <i64 1640531535, i64 606290984>
  store i64 %462, ptr %18, align 8
  %468 = extractelement <2 x i64> %467, i64 0
  store i64 %468, ptr %45, align 8
  %469 = getelementptr i8, ptr %423, i64 13
  %470 = load i8, ptr %469, align 1
  %471 = getelementptr i8, ptr %423, i64 12
  %472 = load i8, ptr %471, align 1
  %473 = getelementptr i8, ptr %423, i64 1
  %474 = load i8, ptr %473, align 1
  %475 = insertelement <2 x i8> poison, i8 %470, i64 0
  %476 = insertelement <2 x i8> %475, i8 %474, i64 1
  %477 = zext <2 x i8> %476 to <2 x i64>
  %478 = shl nuw nsw <2 x i64> %477, <i64 8, i64 8>
  %479 = load i8, ptr %423, align 1
  %480 = insertelement <2 x i8> poison, i8 %472, i64 0
  %481 = insertelement <2 x i8> %480, i8 %479, i64 1
  %482 = zext <2 x i8> %481 to <2 x i64>
  %483 = or <2 x i64> %478, %482
  %484 = getelementptr i8, ptr %423, i64 5
  %485 = load i8, ptr %484, align 1
  %486 = zext i8 %485 to i64
  %487 = shl nuw nsw i64 %486, 8
  %488 = load i8, ptr %424, align 1
  %489 = zext i8 %488 to i64
  %490 = or i64 %487, %489
  %491 = load i8, ptr %427, align 1
  %492 = getelementptr i8, ptr %423, i64 14
  %493 = load i8, ptr %492, align 1
  %494 = insertelement <2 x i8> poison, i8 %493, i64 0
  %495 = insertelement <2 x i8> %494, i8 %491, i64 1
  %496 = zext <2 x i8> %495 to <2 x i64>
  %497 = shl nuw nsw <2 x i64> %496, <i64 16, i64 16>
  %498 = or <2 x i64> %483, %497
  %499 = getelementptr i8, ptr %423, i64 9
  %500 = load i8, ptr %499, align 1
  %501 = zext i8 %500 to i64
  %502 = shl nuw nsw i64 %501, 8
  %503 = getelementptr i8, ptr %423, i64 8
  %504 = load i8, ptr %503, align 1
  %505 = zext i8 %504 to i64
  %506 = or i64 %502, %505
  %507 = getelementptr i8, ptr %423, i64 10
  %508 = load i8, ptr %507, align 1
  %509 = zext i8 %508 to i64
  %510 = shl nuw nsw i64 %509, 16
  %511 = or i64 %506, %510
  %512 = getelementptr i8, ptr %423, i64 11
  %513 = load i8, ptr %512, align 1
  %514 = zext i8 %513 to i64
  %515 = shl nuw nsw i64 %514, 24
  %516 = or i64 %511, %515
  %517 = getelementptr i8, ptr %423, i64 15
  %518 = load i8, ptr %517, align 1
  %519 = getelementptr i8, ptr %423, i64 3
  %520 = load i8, ptr %519, align 1
  %521 = insertelement <2 x i8> poison, i8 %518, i64 0
  %522 = insertelement <2 x i8> %521, i8 %520, i64 1
  %523 = zext <2 x i8> %522 to <2 x i64>
  %524 = shl nuw nsw <2 x i64> %523, <i64 24, i64 24>
  %525 = or <2 x i64> %498, %524
  %526 = load i8, ptr %436, align 1
  %527 = zext i8 %526 to i64
  %528 = shl nuw nsw i64 %527, 16
  %529 = or i64 %490, %528
  %530 = getelementptr i8, ptr %423, i64 7
  %531 = load i8, ptr %530, align 1
  %532 = zext i8 %531 to i64
  %533 = shl nuw nsw i64 %532, 24
  %534 = or i64 %529, %533
  %535 = mul nsw i64 %534, -2048144777
  %536 = add i64 %535, %464
  %537 = mul nsw <2 x i64> %525, <i64 -2048144777, i64 -2048144777>
  %538 = add <2 x i64> %537, %467
  %539 = mul nsw i64 %516, -2048144777
  %540 = add i64 %539, %462
  %541 = shl i64 %536, 13
  %542 = lshr i64 %536, 19
  %543 = and i64 %542, 8191
  %544 = or i64 %543, %541
  %545 = shl i64 %540, 13
  %546 = lshr i64 %540, 19
  %547 = and i64 %546, 8191
  %548 = or i64 %547, %545
  %549 = shl <2 x i64> %538, <i64 13, i64 13>
  %550 = lshr <2 x i64> %538, <i64 19, i64 19>
  %551 = and <2 x i64> %550, <i64 8191, i64 8191>
  %552 = or <2 x i64> %551, %549
  %553 = add i64 %332, 16
  %554 = mul i64 %548, -1640531535
  %555 = mul i64 %544, -1640531535
  %556 = mul <2 x i64> %552, <i64 -1640531535, i64 -1640531535>
  %557 = extractelement <2 x i64> %556, i64 0
  store i64 %557, ptr %45, align 8
  %558 = inttoptr i64 %553 to ptr
  %559 = getelementptr i8, ptr %558, i64 13
  %560 = load i8, ptr %559, align 1
  %561 = getelementptr i8, ptr %558, i64 12
  %562 = load i8, ptr %561, align 1
  %563 = getelementptr i8, ptr %558, i64 1
  %564 = load i8, ptr %563, align 1
  %565 = insertelement <2 x i8> poison, i8 %560, i64 0
  %566 = insertelement <2 x i8> %565, i8 %564, i64 1
  %567 = zext <2 x i8> %566 to <2 x i64>
  %568 = shl nuw nsw <2 x i64> %567, <i64 8, i64 8>
  %569 = load i8, ptr %558, align 1
  %570 = insertelement <2 x i8> poison, i8 %562, i64 0
  %571 = insertelement <2 x i8> %570, i8 %569, i64 1
  %572 = zext <2 x i8> %571 to <2 x i64>
  %573 = or <2 x i64> %568, %572
  %574 = getelementptr i8, ptr %558, i64 5
  %575 = load i8, ptr %574, align 1
  %576 = zext i8 %575 to i64
  %577 = shl nuw nsw i64 %576, 8
  %578 = getelementptr i8, ptr %558, i64 4
  %579 = load i8, ptr %578, align 1
  %580 = zext i8 %579 to i64
  %581 = or i64 %577, %580
  %582 = getelementptr i8, ptr %558, i64 2
  %583 = load i8, ptr %582, align 1
  %584 = getelementptr i8, ptr %558, i64 14
  %585 = load i8, ptr %584, align 1
  %586 = insertelement <2 x i8> poison, i8 %585, i64 0
  %587 = insertelement <2 x i8> %586, i8 %583, i64 1
  %588 = zext <2 x i8> %587 to <2 x i64>
  %589 = shl nuw nsw <2 x i64> %588, <i64 16, i64 16>
  %590 = or <2 x i64> %573, %589
  %591 = getelementptr i8, ptr %558, i64 9
  %592 = load i8, ptr %591, align 1
  %593 = zext i8 %592 to i64
  %594 = shl nuw nsw i64 %593, 8
  %595 = getelementptr i8, ptr %558, i64 8
  %596 = load i8, ptr %595, align 1
  %597 = zext i8 %596 to i64
  %598 = or i64 %594, %597
  %599 = getelementptr i8, ptr %558, i64 10
  %600 = load i8, ptr %599, align 1
  %601 = zext i8 %600 to i64
  %602 = shl nuw nsw i64 %601, 16
  %603 = or i64 %598, %602
  %604 = getelementptr i8, ptr %558, i64 11
  %605 = load i8, ptr %604, align 1
  %606 = zext i8 %605 to i64
  %607 = shl nuw nsw i64 %606, 24
  %608 = or i64 %603, %607
  %609 = getelementptr i8, ptr %558, i64 15
  %610 = load i8, ptr %609, align 1
  %611 = getelementptr i8, ptr %558, i64 3
  %612 = load i8, ptr %611, align 1
  %613 = insertelement <2 x i8> poison, i8 %610, i64 0
  %614 = insertelement <2 x i8> %613, i8 %612, i64 1
  %615 = zext <2 x i8> %614 to <2 x i64>
  %616 = shl nuw nsw <2 x i64> %615, <i64 24, i64 24>
  %617 = or <2 x i64> %590, %616
  %618 = getelementptr i8, ptr %558, i64 6
  %619 = load <2 x i8>, ptr %618, align 1
  %620 = zext <2 x i8> %619 to <2 x i64>
  %621 = shl nuw nsw <2 x i64> %620, <i64 16, i64 24>
  %622 = extractelement <2 x i64> %621, i64 0
  %623 = or i64 %581, %622
  %624 = extractelement <2 x i64> %621, i64 1
  %625 = or i64 %623, %624
  %626 = mul nsw i64 %625, -2048144777
  %627 = add i64 %626, %555
  %628 = mul nsw <2 x i64> %617, <i64 -2048144777, i64 -2048144777>
  %629 = add <2 x i64> %628, %556
  %630 = mul nsw i64 %608, -2048144777
  %631 = add i64 %630, %554
  %632 = shl i64 %627, 13
  %633 = lshr i64 %627, 19
  %634 = and i64 %633, 8191
  %635 = or i64 %634, %632
  %636 = shl i64 %631, 13
  %637 = lshr i64 %631, 19
  %638 = and i64 %637, 8191
  %639 = or i64 %638, %636
  %640 = shl <2 x i64> %629, <i64 13, i64 13>
  %641 = lshr <2 x i64> %629, <i64 19, i64 19>
  %642 = and <2 x i64> %641, <i64 8191, i64 8191>
  %643 = or <2 x i64> %642, %640
  %644 = add i64 %332, 32
  %645 = mul i64 %639, -1640531535
  %646 = mul i64 %635, -1640531535
  %647 = mul <2 x i64> %643, <i64 -1640531535, i64 -1640531535>
  %648 = extractelement <2 x i64> %647, i64 0
  store i64 %648, ptr %45, align 8
  %649 = inttoptr i64 %644 to ptr
  %650 = getelementptr i8, ptr %649, i64 13
  %651 = load i8, ptr %650, align 1
  %652 = getelementptr i8, ptr %649, i64 12
  %653 = load i8, ptr %652, align 1
  %654 = getelementptr i8, ptr %649, i64 1
  %655 = load i8, ptr %654, align 1
  %656 = insertelement <2 x i8> poison, i8 %651, i64 0
  %657 = insertelement <2 x i8> %656, i8 %655, i64 1
  %658 = zext <2 x i8> %657 to <2 x i64>
  %659 = shl nuw nsw <2 x i64> %658, <i64 8, i64 8>
  %660 = load i8, ptr %649, align 1
  %661 = insertelement <2 x i8> poison, i8 %653, i64 0
  %662 = insertelement <2 x i8> %661, i8 %660, i64 1
  %663 = zext <2 x i8> %662 to <2 x i64>
  %664 = or <2 x i64> %659, %663
  %665 = getelementptr i8, ptr %649, i64 5
  %666 = load i8, ptr %665, align 1
  %667 = zext i8 %666 to i64
  %668 = shl nuw nsw i64 %667, 8
  %669 = getelementptr i8, ptr %649, i64 4
  %670 = load i8, ptr %669, align 1
  %671 = zext i8 %670 to i64
  %672 = or i64 %668, %671
  %673 = getelementptr i8, ptr %649, i64 2
  %674 = load i8, ptr %673, align 1
  %675 = getelementptr i8, ptr %649, i64 14
  %676 = load i8, ptr %675, align 1
  %677 = insertelement <2 x i8> poison, i8 %676, i64 0
  %678 = insertelement <2 x i8> %677, i8 %674, i64 1
  %679 = zext <2 x i8> %678 to <2 x i64>
  %680 = shl nuw nsw <2 x i64> %679, <i64 16, i64 16>
  %681 = or <2 x i64> %664, %680
  %682 = getelementptr i8, ptr %649, i64 9
  %683 = load i8, ptr %682, align 1
  %684 = zext i8 %683 to i64
  %685 = shl nuw nsw i64 %684, 8
  %686 = getelementptr i8, ptr %649, i64 8
  %687 = load i8, ptr %686, align 1
  %688 = zext i8 %687 to i64
  %689 = or i64 %685, %688
  %690 = getelementptr i8, ptr %649, i64 10
  %691 = load i8, ptr %690, align 1
  %692 = zext i8 %691 to i64
  %693 = shl nuw nsw i64 %692, 16
  %694 = or i64 %689, %693
  %695 = getelementptr i8, ptr %649, i64 11
  %696 = load i8, ptr %695, align 1
  %697 = zext i8 %696 to i64
  %698 = shl nuw nsw i64 %697, 24
  %699 = or i64 %694, %698
  %700 = getelementptr i8, ptr %649, i64 15
  %701 = load i8, ptr %700, align 1
  %702 = getelementptr i8, ptr %649, i64 3
  %703 = load i8, ptr %702, align 1
  %704 = insertelement <2 x i8> poison, i8 %701, i64 0
  %705 = insertelement <2 x i8> %704, i8 %703, i64 1
  %706 = zext <2 x i8> %705 to <2 x i64>
  %707 = shl nuw nsw <2 x i64> %706, <i64 24, i64 24>
  %708 = or <2 x i64> %681, %707
  %709 = getelementptr i8, ptr %649, i64 6
  %710 = load <2 x i8>, ptr %709, align 1
  %711 = zext <2 x i8> %710 to <2 x i64>
  %712 = shl nuw nsw <2 x i64> %711, <i64 16, i64 24>
  %713 = extractelement <2 x i64> %712, i64 0
  %714 = or i64 %672, %713
  %715 = extractelement <2 x i64> %712, i64 1
  %716 = or i64 %714, %715
  %717 = mul nsw i64 %716, -2048144777
  %718 = add i64 %717, %646
  %719 = mul nsw <2 x i64> %708, <i64 -2048144777, i64 -2048144777>
  %720 = add <2 x i64> %719, %647
  %721 = mul nsw i64 %699, -2048144777
  %722 = add i64 %721, %645
  %723 = shl i64 %718, 13
  %724 = lshr i64 %718, 19
  %725 = and i64 %724, 8191
  %726 = or i64 %725, %723
  %727 = shl i64 %722, 13
  %728 = lshr i64 %722, 19
  %729 = and i64 %728, 8191
  %730 = or i64 %729, %727
  %731 = shl <2 x i64> %720, <i64 13, i64 13>
  %732 = lshr <2 x i64> %720, <i64 19, i64 19>
  %733 = and <2 x i64> %732, <i64 8191, i64 8191>
  %734 = or <2 x i64> %733, %731
  %735 = mul i64 %730, -1640531535
  %736 = mul i64 %726, -1640531535
  %737 = mul <2 x i64> %734, <i64 -1640531535, i64 -1640531535>
  %738 = lshr i64 %736, 25
  %739 = and i64 %738, 127
  %740 = mul i64 %726, -209988036480
  %741 = extractelement <2 x i64> %734, i64 1
  %742 = mul i64 %741, -3281063070
  %743 = lshr i64 %735, 20
  %744 = and i64 %743, 4095
  %745 = mul i64 %730, -6719617167360
  %746 = lshr <2 x i64> %737, <i64 14, i64 31>
  %747 = and <2 x i64> %746, <i64 262143, i64 1>
  %748 = extractelement <2 x i64> %734, i64 0
  %749 = mul i64 %748, -430055498711040
  %750 = or i64 %745, 60
  %751 = add i64 %750, %749
  %752 = add i64 %751, %744
  %753 = add i64 %752, %742
  %754 = extractelement <2 x i64> %747, i64 0
  %755 = add i64 %753, %754
  %756 = extractelement <2 x i64> %747, i64 1
  %757 = add i64 %755, %756
  %758 = add i64 %757, %740
  %759 = add i64 %758, %739
  %760 = load i64, ptr %44, align 8
  %761 = load i64, ptr %344, align 8
  br label %bb_inst_524

bb_inst_524:                                      ; preds = %bb_inst_549, %bb_inst_391
  %r9.1 = phi i64 [ %761, %bb_inst_391 ], [ %788, %bb_inst_549 ]
  %r1.5 = phi i64 [ %759, %bb_inst_391 ], [ %r2.3, %bb_inst_549 ]
  %r0.3 = phi i64 [ 12, %bb_inst_391 ], [ %787, %bb_inst_549 ]
  %762 = and i64 %r0.3, 4294967295
  %763 = icmp ult i64 %762, 4
  br i1 %763, label %bb_inst_554, label %bb_inst_528

bb_inst_528:                                      ; preds = %bb_inst_524
  %764 = inttoptr i64 %r9.1 to ptr
  %765 = getelementptr i8, ptr %764, i64 1
  %766 = load i8, ptr %765, align 1
  %767 = zext i8 %766 to i64
  %768 = shl nuw nsw i64 %767, 8
  %769 = load i8, ptr %764, align 1
  %770 = zext i8 %769 to i64
  %771 = or i64 %768, %770
  %772 = getelementptr i8, ptr %764, i64 2
  %773 = load <2 x i8>, ptr %772, align 1
  %774 = zext <2 x i8> %773 to <2 x i64>
  %775 = shl nuw nsw <2 x i64> %774, <i64 16, i64 24>
  %776 = extractelement <2 x i64> %775, i64 0
  %777 = or i64 %771, %776
  %778 = extractelement <2 x i64> %775, i64 1
  %779 = or i64 %777, %778
  %780 = mul nsw i64 %779, -1028477379
  %781 = add i64 %780, %r1.5
  %782 = shl i64 %781, 17
  %783 = lshr i64 %781, 15
  %784 = and i64 %783, 131071
  %785 = or i64 %784, %782
  %786 = mul i64 %785, 668265263
  br label %bb_inst_549

bb_inst_549:                                      ; preds = %bb_inst_555, %bb_inst_528
  %r2.3 = phi i64 [ %799, %bb_inst_555 ], [ %786, %bb_inst_528 ]
  %r6.6 = phi i64 [ 4294967295, %bb_inst_555 ], [ 4294967292, %bb_inst_528 ]
  %r7.4 = phi i64 [ 1, %bb_inst_555 ], [ 4, %bb_inst_528 ]
  %787 = add i64 %r6.6, %r0.3
  %788 = add i64 %r7.4, %r9.1
  br label %bb_inst_524

bb_inst_554:                                      ; preds = %bb_inst_524
  %789 = icmp eq i64 %762, 0
  br i1 %789, label %bb_inst_568, label %bb_inst_555

bb_inst_555:                                      ; preds = %bb_inst_554
  %790 = inttoptr i64 %r9.1 to ptr
  %791 = load i8, ptr %790, align 1
  %792 = zext i8 %791 to i64
  %793 = mul nuw nsw i64 %792, 374761393
  %794 = add i64 %793, %r1.5
  %795 = shl i64 %794, 11
  %796 = lshr i64 %794, 21
  %797 = and i64 %796, 2047
  %798 = or i64 %797, %795
  %799 = mul i64 %798, -1640531535
  br label %bb_inst_549

bb_inst_568:                                      ; preds = %bb_inst_554
  %800 = lshr i64 %r1.5, 15
  %801 = and i64 %800, 131071
  %802 = xor i64 %801, %r1.5
  %803 = mul i64 %802, -2048144777
  %804 = lshr i64 %803, 13
  %805 = and i64 %804, 524287
  %806 = xor i64 %805, %803
  %807 = load i64, ptr %18, align 8
  %808 = lshr i64 %807, 24
  %809 = trunc i64 %808 to i8
  %810 = inttoptr i64 %760 to ptr
  %811 = getelementptr i8, ptr %810, i64 37
  store i8 %809, ptr %811, align 1
  %812 = lshr i64 %807, 16
  %813 = trunc i64 %812 to i8
  %814 = getelementptr i8, ptr %810, i64 36
  store i8 %813, ptr %814, align 1
  %815 = trunc i64 %807 to i8
  %816 = getelementptr i8, ptr %810, i64 34
  store i8 %815, ptr %816, align 1
  %817 = lshr i64 %807, 8
  %818 = trunc i64 %817 to i8
  %819 = getelementptr i8, ptr %810, i64 35
  store i8 %818, ptr %819, align 1
  %820 = mul i64 %806, -1028477379
  %821 = lshr i64 %820, 24
  %822 = trunc i64 %821 to i8
  %823 = getelementptr i8, ptr %810, i64 41
  store i8 %822, ptr %823, align 1
  %824 = lshr i64 %820, 16
  %825 = trunc i64 %824 to i8
  %826 = getelementptr i8, ptr %810, i64 40
  store i8 %825, ptr %826, align 1
  %827 = and i64 %824, 65535
  %828 = xor i64 %827, %820
  %829 = trunc i64 %828 to i8
  %830 = getelementptr i8, ptr %810, i64 38
  store i8 %829, ptr %830, align 1
  %831 = lshr i64 %828, 8
  %832 = trunc i64 %831 to i8
  %833 = getelementptr i8, ptr %810, i64 39
  store i8 %832, ptr %833, align 1
  br label %bb_inst_37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #0

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }

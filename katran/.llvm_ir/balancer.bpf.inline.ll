; ModuleID = '/home/yunwei/ebpf-xdp-dpdk/katran/.llvm_ir/balancer.bpf.ll'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0002(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0005(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0008(i64, i64, i64, i64, i64) local_unnamed_addr

declare i64 @_bpf_helper_ext_0044(i64, i64, i64, i64, i64) local_unnamed_addr

define i64 @bpf_main(ptr %0, i64 %1) local_unnamed_addr {
setupBlock:
  %stackBegin2881 = alloca [2058 x i64], align 8
  %stackEnd = getelementptr inbounds [2058 x i64], ptr %stackBegin2881, i64 0, i64 2048
  %2 = ptrtoint ptr %stackEnd to i64
  %3 = ptrtoint ptr %0 to i64
  %4 = getelementptr i8, ptr %0, i64 8
  %5 = load i64, ptr %4, align 4
  %6 = load i64, ptr %0, align 4
  %7 = add i64 %6, 14
  %8 = icmp ugt i64 %7, %5
  br i1 %8, label %bb_inst_942, label %bb_inst_7

bb_inst_7:                                        ; preds = %setupBlock
  %9 = inttoptr i64 %6 to ptr
  %10 = getelementptr i8, ptr %9, i64 12
  %11 = load i8, ptr %10, align 1
  %12 = zext i8 %11 to i16
  %13 = getelementptr i8, ptr %9, i64 13
  %14 = load i8, ptr %13, align 1
  %15 = zext i8 %14 to i16
  %16 = shl nuw i16 %15, 8
  %17 = or i16 %16, %12
  switch i16 %17, label %bb_inst_942 [
    i16 -8826, label %bb_inst_106
    i16 8, label %bb_inst_14
  ]

bb_inst_14:                                       ; preds = %bb_inst_7
  %18 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  %19 = getelementptr inbounds i8, ptr %stackEnd, i64 -40
  %20 = getelementptr inbounds i8, ptr %stackEnd, i64 -56
  %21 = getelementptr inbounds i8, ptr %stackEnd, i64 -72
  %22 = getelementptr inbounds i8, ptr %stackEnd, i64 -80
  %23 = getelementptr inbounds i8, ptr %stackEnd, i64 -96
  %24 = getelementptr inbounds i8, ptr %stackEnd, i64 -104
  store i32 0, ptr %24, align 8
  %25 = add i64 %6, 34
  %26 = icmp ugt i64 %25, %5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(20) %23, i8 0, i64 20, i1 false)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(48) %21, i8 0, i64 48, i1 false)
  br i1 %26, label %bb_inst_942, label %bb_inst_29

bb_inst_29:                                       ; preds = %bb_inst_14
  %27 = inttoptr i64 %7 to ptr
  %28 = load i8, ptr %27, align 1
  %29 = and i8 %28, 15
  %.not2882 = icmp eq i8 %29, 5
  br i1 %.not2882, label %bb_inst_33, label %bb_inst_942

bb_inst_33:                                       ; preds = %bb_inst_29
  %30 = getelementptr i8, ptr %9, i64 15
  %31 = load i8, ptr %30, align 1
  %32 = getelementptr inbounds i8, ptr %stackEnd, i64 -27
  store i8 %31, ptr %32, align 1
  %33 = getelementptr i8, ptr %9, i64 23
  %34 = load i8, ptr %33, align 1
  %35 = getelementptr inbounds i8, ptr %stackEnd, i64 -36
  store i8 %34, ptr %35, align 4
  %36 = getelementptr i8, ptr %9, i64 20
  %37 = load i16, ptr %36, align 2
  %38 = zext i16 %37 to i64
  %39 = and i64 %38, 65343
  %.not2883 = icmp eq i64 %39, 0
  br i1 %.not2883, label %bb_inst_42, label %bb_inst_942

bb_inst_42:                                       ; preds = %bb_inst_33
  %40 = getelementptr i8, ptr %9, i64 16
  %41 = load i16, ptr %40, align 2
  %42 = zext i16 %41 to i64
  %43 = getelementptr inbounds i8, ptr %stackEnd, i64 -128
  store i64 %42, ptr %43, align 8
  %.not2884 = icmp eq i8 %34, 1
  br i1 %.not2884, label %bb_inst_46, label %bb_inst_285

bb_inst_46:                                       ; preds = %bb_inst_42
  %44 = add i64 %6, 42
  %45 = icmp ugt i64 %44, %5
  br i1 %45, label %bb_inst_942, label %bb_inst_50

bb_inst_50:                                       ; preds = %bb_inst_46
  %46 = inttoptr i64 %25 to ptr
  %47 = load i8, ptr %46, align 1
  switch i8 %47, label %bb_inst_942 [
    i8 3, label %bb_inst_496
    i8 8, label %bb_inst_54
  ]

bb_inst_54:                                       ; preds = %bb_inst_50
  %48 = getelementptr i8, ptr %9, i64 22
  store i8 64, ptr %48, align 1
  %49 = getelementptr i8, ptr %9, i64 14
  %50 = load i16, ptr %49, align 2
  %51 = zext i16 %50 to i64
  %52 = getelementptr i8, ptr %9, i64 30
  %53 = load i32, ptr %52, align 4
  %54 = zext i32 %53 to i64
  %55 = and i64 %54, 65535
  %56 = lshr i64 %54, 16
  %57 = getelementptr i8, ptr %9, i64 26
  %58 = load i32, ptr %57, align 4
  %59 = zext i32 %58 to i64
  %60 = and i64 %59, 65535
  %61 = lshr i64 %59, 16
  %62 = getelementptr i8, ptr %9, i64 18
  %63 = load i16, ptr %62, align 2
  %64 = zext i16 %63 to i64
  %65 = load i16, ptr %48, align 2
  %66 = zext i16 %65 to i64
  %67 = add nuw nsw i64 %42, %38
  %68 = add nuw nsw i64 %67, %51
  %69 = add nuw nsw i64 %68, %55
  %70 = add nuw nsw i64 %69, %56
  %71 = add nuw nsw i64 %70, %60
  %72 = add nuw nsw i64 %71, %61
  %73 = add nuw nsw i64 %72, %64
  %74 = add nuw nsw i64 %73, %66
  %75 = icmp ult i64 %74, 65536
  %76 = lshr i64 %74, 16
  %77 = and i64 %74, 65535
  %78 = add nuw nsw i64 %77, %76
  %r2.0 = select i1 %75, i64 %74, i64 %78
  %79 = icmp ult i64 %r2.0, 65536
  %80 = lshr i64 %r2.0, 16
  %81 = and i64 %r2.0, 65535
  %82 = add nuw nsw i64 %81, %80
  %r2.1 = select i1 %79, i64 %r2.0, i64 %82
  %83 = icmp ult i64 %r2.1, 65536
  %84 = lshr i64 %r2.1, 16
  %85 = and i64 %r2.1, 65535
  %86 = add nuw nsw i64 %85, %84
  %r2.2 = select i1 %83, i64 %r2.1, i64 %86
  %87 = getelementptr i8, ptr %9, i64 34
  store i8 0, ptr %87, align 1
  store i32 %58, ptr %52, align 4
  store i32 %53, ptr %57, align 4
  %88 = getelementptr i8, ptr %9, i64 36
  %89 = load i16, ptr %88, align 2
  %90 = add i16 %89, 8
  store i16 %90, ptr %88, align 2
  %91 = lshr i64 %r2.2, 16
  %92 = add nuw nsw i64 %91, %r2.2
  %93 = trunc i64 %92 to i16
  %94 = xor i16 %93, -1
  %95 = getelementptr i8, ptr %9, i64 24
  store i16 %94, ptr %95, align 2
  br label %bb_inst_174

bb_inst_106:                                      ; preds = %bb_inst_7
  %96 = getelementptr inbounds i8, ptr %stackEnd, i64 -32
  %97 = getelementptr inbounds i8, ptr %stackEnd, i64 -40
  %98 = getelementptr inbounds i8, ptr %stackEnd, i64 -48
  %99 = getelementptr inbounds i8, ptr %stackEnd, i64 -56
  %100 = getelementptr inbounds i8, ptr %stackEnd, i64 -64
  %101 = getelementptr inbounds i8, ptr %stackEnd, i64 -72
  %102 = getelementptr inbounds i8, ptr %stackEnd, i64 -80
  %103 = getelementptr inbounds i8, ptr %stackEnd, i64 -88
  %104 = getelementptr inbounds i8, ptr %stackEnd, i64 -96
  %105 = getelementptr inbounds i8, ptr %stackEnd, i64 -104
  store i32 0, ptr %105, align 8
  %106 = add i64 %6, 54
  %107 = icmp ugt i64 %106, %5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(20) %104, i8 0, i64 20, i1 false)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(48) %101, i8 0, i64 48, i1 false)
  br i1 %107, label %bb_inst_942, label %bb_inst_121

bb_inst_121:                                      ; preds = %bb_inst_106
  %108 = getelementptr i8, ptr %9, i64 20
  %109 = load i8, ptr %108, align 1
  %110 = getelementptr inbounds i8, ptr %stackEnd, i64 -36
  store i8 %109, ptr %110, align 4
  %111 = getelementptr i8, ptr %9, i64 14
  %112 = load i8, ptr %111, align 1
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 4
  %115 = trunc i64 %114 to i8
  %116 = getelementptr inbounds i8, ptr %stackEnd, i64 -27
  store i8 %115, ptr %116, align 1
  %117 = getelementptr i8, ptr %9, i64 15
  %118 = load i8, ptr %117, align 1
  %119 = lshr i8 %118, 4
  %120 = zext i8 %119 to i64
  %121 = or i64 %114, %120
  %122 = trunc i64 %121 to i8
  store i8 %122, ptr %116, align 1
  %123 = icmp eq i8 %109, 44
  br i1 %123, label %bb_inst_942, label %bb_inst_131

bb_inst_131:                                      ; preds = %bb_inst_121
  %124 = getelementptr i8, ptr %9, i64 18
  %125 = load i16, ptr %124, align 2
  %126 = zext i16 %125 to i64
  %.not2918 = icmp eq i8 %109, 58
  br i1 %.not2918, label %bb_inst_133, label %bb_inst_239

bb_inst_133:                                      ; preds = %bb_inst_131
  %127 = add i64 %6, 62
  %128 = icmp ugt i64 %127, %5
  br i1 %128, label %bb_inst_942, label %bb_inst_136

bb_inst_136:                                      ; preds = %bb_inst_133
  %129 = inttoptr i64 %106 to ptr
  %130 = load i8, ptr %129, align 1
  switch i8 %130, label %bb_inst_942 [
    i8 1, label %bb_inst_449
    i8 2, label %bb_inst_430
    i8 -128, label %bb_inst_141
  ]

bb_inst_141:                                      ; preds = %bb_inst_136
  %131 = getelementptr i8, ptr %9, i64 54
  store i8 -127, ptr %131, align 1
  %132 = getelementptr i8, ptr %9, i64 21
  store i8 64, ptr %132, align 1
  %133 = getelementptr i8, ptr %9, i64 56
  %134 = load i16, ptr %133, align 2
  %135 = add i16 %134, -1
  store i16 %135, ptr %133, align 2
  %136 = getelementptr i8, ptr %9, i64 34
  %137 = load i32, ptr %136, align 4
  %138 = zext i32 %137 to i64
  %139 = shl nuw i64 %138, 32
  %140 = getelementptr i8, ptr %9, i64 30
  %141 = load i32, ptr %140, align 4
  %142 = zext i32 %141 to i64
  %143 = or i64 %139, %142
  %144 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  store i64 %143, ptr %144, align 8
  %145 = getelementptr i8, ptr %9, i64 26
  %146 = load i32, ptr %145, align 4
  %147 = zext i32 %146 to i64
  %148 = shl nuw i64 %147, 32
  %149 = getelementptr i8, ptr %9, i64 22
  %150 = load i32, ptr %149, align 4
  %151 = zext i32 %150 to i64
  %152 = or i64 %148, %151
  %153 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i64 %152, ptr %153, align 8
  %154 = getelementptr i8, ptr %9, i64 38
  %155 = getelementptr i8, ptr %9, i64 42
  %156 = getelementptr i8, ptr %9, i64 46
  %157 = getelementptr i8, ptr %9, i64 50
  %158 = load <4 x i32>, ptr %154, align 4
  store <4 x i32> %158, ptr %149, align 4
  %159 = load i64, ptr %153, align 8
  %160 = trunc i64 %159 to i32
  store i32 %160, ptr %154, align 4
  %161 = lshr i64 %159, 32
  %162 = trunc i64 %161 to i32
  store i32 %162, ptr %155, align 4
  %163 = load i64, ptr %144, align 8
  %164 = trunc i64 %163 to i32
  store i32 %164, ptr %156, align 4
  %165 = lshr i64 %163, 32
  %166 = trunc i64 %165 to i32
  store i32 %166, ptr %157, align 4
  br label %bb_inst_174

bb_inst_174:                                      ; preds = %bb_inst_141, %bb_inst_54
  %167 = getelementptr i8, ptr %9, i64 11
  %168 = load i8, ptr %167, align 1
  %169 = zext i8 %168 to i16
  %170 = shl nuw i16 %169, 8
  %171 = getelementptr i8, ptr %9, i64 10
  %172 = load i8, ptr %171, align 1
  %173 = zext i8 %172 to i16
  %174 = or i16 %170, %173
  %175 = getelementptr inbounds i8, ptr %stackEnd, i64 -116
  store i16 %174, ptr %175, align 4
  %176 = getelementptr i8, ptr %9, i64 7
  %177 = load i8, ptr %176, align 1
  %178 = zext i8 %177 to i32
  %179 = shl nuw nsw i32 %178, 8
  %180 = getelementptr i8, ptr %9, i64 6
  %181 = load i8, ptr %180, align 1
  %182 = zext i8 %181 to i32
  %183 = getelementptr i8, ptr %9, i64 9
  %184 = load i8, ptr %183, align 1
  %185 = zext i8 %184 to i32
  %186 = getelementptr i8, ptr %9, i64 8
  %187 = load i8, ptr %186, align 1
  %188 = zext i8 %187 to i32
  %189 = shl nuw i32 %185, 24
  %190 = shl nuw nsw i32 %188, 16
  %191 = or i32 %179, %182
  %192 = or i32 %191, %189
  %193 = or i32 %192, %190
  %194 = getelementptr inbounds i8, ptr %stackEnd, i64 -120
  store i32 %193, ptr %194, align 8
  %195 = getelementptr i8, ptr %9, i64 2
  %196 = load i8, ptr %195, align 1
  store i8 %196, ptr %186, align 1
  %197 = getelementptr i8, ptr %9, i64 3
  %198 = load i8, ptr %197, align 1
  store i8 %198, ptr %183, align 1
  %199 = load i8, ptr %9, align 1
  store i8 %199, ptr %180, align 1
  %200 = getelementptr i8, ptr %9, i64 1
  %201 = load i8, ptr %200, align 1
  store i8 %201, ptr %176, align 1
  %202 = getelementptr i8, ptr %9, i64 4
  %203 = load i8, ptr %202, align 1
  store i8 %203, ptr %171, align 1
  %204 = getelementptr i8, ptr %9, i64 5
  %205 = load i8, ptr %204, align 1
  store i8 %205, ptr %167, align 1
  %206 = load i32, ptr %194, align 8
  %207 = lshr i32 %206, 16
  %208 = trunc i32 %207 to i8
  store i8 %208, ptr %195, align 1
  %209 = lshr i32 %206, 24
  %210 = trunc i32 %209 to i8
  store i8 %210, ptr %197, align 1
  %211 = trunc i32 %206 to i8
  store i8 %211, ptr %9, align 1
  %212 = lshr i32 %206, 8
  %213 = trunc i32 %212 to i8
  store i8 %213, ptr %200, align 1
  %214 = load i16, ptr %175, align 4
  %215 = trunc i16 %214 to i8
  store i8 %215, ptr %202, align 1
  %216 = lshr i16 %214, 8
  %217 = trunc i16 %216 to i8
  store i8 %217, ptr %204, align 1
  br label %bb_inst_942

bb_inst_239:                                      ; preds = %bb_inst_131, %bb_inst_453
  %.sink3103 = phi i64 [ 90, %bb_inst_453 ], [ 34, %bb_inst_131 ]
  %.sink3099 = phi i64 [ 86, %bb_inst_453 ], [ 30, %bb_inst_131 ]
  %.sink3094 = phi ptr [ %101, %bb_inst_453 ], [ %100, %bb_inst_131 ]
  %.sink3092 = phi i64 [ 98, %bb_inst_453 ], [ 26, %bb_inst_131 ]
  %.sink3088 = phi i64 [ 94, %bb_inst_453 ], [ 22, %bb_inst_131 ]
  %.sink3083 = phi ptr [ %100, %bb_inst_453 ], [ %101, %bb_inst_131 ]
  %.sink3081 = phi i64 [ 74, %bb_inst_453 ], [ 50, %bb_inst_131 ]
  %.sink3077 = phi i64 [ 70, %bb_inst_453 ], [ 46, %bb_inst_131 ]
  %.sink3072 = phi ptr [ %99, %bb_inst_453 ], [ %98, %bb_inst_131 ]
  %.sink3070 = phi i64 [ 78, %bb_inst_453 ], [ 38, %bb_inst_131 ]
  %.sink3067 = phi i64 [ 82, %bb_inst_453 ], [ 42, %bb_inst_131 ]
  %.sink3061 = phi ptr [ %98, %bb_inst_453 ], [ %99, %bb_inst_131 ]
  %r2.3 = phi i64 [ %397, %bb_inst_453 ], [ 0, %bb_inst_131 ]
  %r1.0.in = phi i8 [ %393, %bb_inst_453 ], [ %109, %bb_inst_131 ]
  %r0.0 = phi i64 [ %r0.2, %bb_inst_453 ], [ %126, %bb_inst_131 ]
  %218 = getelementptr i8, ptr %9, i64 %.sink3103
  %219 = load i32, ptr %218, align 4
  %220 = zext i32 %219 to i64
  %221 = shl nuw i64 %220, 32
  %222 = getelementptr i8, ptr %9, i64 %.sink3099
  %223 = load i32, ptr %222, align 4
  %224 = zext i32 %223 to i64
  %225 = or i64 %221, %224
  store i64 %225, ptr %.sink3094, align 8
  %226 = getelementptr i8, ptr %9, i64 %.sink3092
  %227 = load i32, ptr %226, align 4
  %228 = zext i32 %227 to i64
  %229 = shl nuw i64 %228, 32
  %230 = getelementptr i8, ptr %9, i64 %.sink3088
  %231 = load i32, ptr %230, align 4
  %232 = zext i32 %231 to i64
  %233 = or i64 %229, %232
  store i64 %233, ptr %.sink3083, align 8
  %234 = getelementptr i8, ptr %9, i64 %.sink3081
  %235 = load i32, ptr %234, align 4
  %236 = zext i32 %235 to i64
  %237 = shl nuw i64 %236, 32
  %238 = getelementptr i8, ptr %9, i64 %.sink3077
  %239 = load i32, ptr %238, align 4
  %240 = zext i32 %239 to i64
  %241 = or i64 %237, %240
  store i64 %241, ptr %.sink3072, align 8
  %242 = getelementptr i8, ptr %9, i64 %.sink3070
  %243 = load i32, ptr %242, align 4
  %244 = zext i32 %243 to i64
  %245 = getelementptr i8, ptr %9, i64 %.sink3067
  %246 = load i32, ptr %245, align 4
  %247 = zext i32 %246 to i64
  %248 = shl nuw i64 %247, 32
  %249 = or i64 %248, %244
  store i64 %249, ptr %.sink3061, align 8
  switch i8 %r1.0.in, label %bb_inst_942 [
    i8 17, label %bb_inst_267
    i8 6, label %bb_inst_243
  ]

bb_inst_243:                                      ; preds = %bb_inst_239
  %250 = and i64 %r2.3, 1
  %251 = icmp eq i64 %250, 0
  %spec.store.select = select i1 %251, i64 54, i64 102
  %252 = add i64 %spec.store.select, %6
  %253 = add i64 %252, 20
  %254 = icmp ugt i64 %253, %5
  br i1 %254, label %bb_inst_942, label %bb_inst_254

bb_inst_254:                                      ; preds = %bb_inst_243
  %255 = inttoptr i64 %252 to ptr
  %256 = getelementptr i8, ptr %255, i64 12
  %257 = load i16, ptr %256, align 2
  %258 = and i16 %257, 512
  %259 = zext i16 %258 to i64
  %260 = icmp eq i16 %258, 0
  br i1 %260, label %bb_inst_259, label %bb_inst_257

bb_inst_257:                                      ; preds = %bb_inst_254
  %261 = trunc i64 %r2.3 to i8
  %262 = or i8 %261, 2
  %263 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  store i8 %262, ptr %263, align 4
  br label %bb_inst_259

bb_inst_259:                                      ; preds = %bb_inst_257, %bb_inst_254
  %264 = getelementptr inbounds i8, ptr %stackEnd, i64 -128
  store i64 %r0.0, ptr %264, align 8
  br i1 %251, label %bb_inst_261, label %bb_inst_314

bb_inst_261:                                      ; preds = %bb_inst_277, %bb_inst_259
  %.pre-phi3053 = phi ptr [ %255, %bb_inst_259 ], [ %.pre3052, %bb_inst_277 ]
  %r3.0 = phi i64 [ %252, %bb_inst_259 ], [ %269, %bb_inst_277 ]
  %r5.0 = phi i64 [ %259, %bb_inst_259 ], [ undef, %bb_inst_277 ]
  %265 = load i16, ptr %.pre-phi3053, align 2
  store i16 %265, ptr %97, align 8
  %266 = add i64 %r3.0, 2
  %.pre = inttoptr i64 %266 to ptr
  br label %bb_inst_318

bb_inst_267:                                      ; preds = %bb_inst_239
  %267 = and i64 %r2.3, 1
  %268 = icmp eq i64 %267, 0
  %spec.store.select1 = select i1 %268, i64 54, i64 102
  %269 = add i64 %spec.store.select1, %6
  %270 = add i64 %269, 8
  %271 = icmp ugt i64 %270, %5
  br i1 %271, label %bb_inst_942, label %bb_inst_277

bb_inst_277:                                      ; preds = %bb_inst_267
  %272 = getelementptr inbounds i8, ptr %stackEnd, i64 -128
  store i64 %r0.0, ptr %272, align 8
  %.pre3052 = inttoptr i64 %269 to ptr
  br i1 %268, label %bb_inst_261, label %bb_inst_314

bb_inst_285:                                      ; preds = %bb_inst_42, %bb_inst_526
  %.sink3107 = phi i64 [ 58, %bb_inst_526 ], [ 26, %bb_inst_42 ]
  %.sink3104 = phi i64 [ 54, %bb_inst_526 ], [ 30, %bb_inst_42 ]
  %r3.1 = phi i64 [ %434, %bb_inst_526 ], [ 0, %bb_inst_42 ]
  %r1.1.in = phi i8 [ %430, %bb_inst_526 ], [ %34, %bb_inst_42 ]
  %273 = getelementptr i8, ptr %9, i64 %.sink3107
  %274 = load i32, ptr %273, align 4
  store i32 %274, ptr %21, align 8
  %275 = add i64 %6, %.sink3104
  %276 = inttoptr i64 %275 to ptr
  %277 = load i32, ptr %276, align 4
  store i32 %277, ptr %20, align 8
  switch i8 %r1.1.in, label %bb_inst_942 [
    i8 17, label %bb_inst_479
    i8 6, label %bb_inst_291
  ]

bb_inst_291:                                      ; preds = %bb_inst_285
  %278 = and i64 %r3.1, 1
  %279 = icmp eq i64 %278, 0
  %spec.store.select2 = select i1 %279, i64 34, i64 62
  %280 = add i64 %spec.store.select2, %6
  %281 = add i64 %280, 20
  %282 = icmp ugt i64 %281, %5
  br i1 %282, label %bb_inst_942, label %bb_inst_302

bb_inst_302:                                      ; preds = %bb_inst_291
  %283 = inttoptr i64 %280 to ptr
  %284 = getelementptr i8, ptr %283, i64 12
  %285 = load i16, ptr %284, align 2
  %286 = and i16 %285, 512
  %287 = icmp eq i16 %286, 0
  br i1 %287, label %bb_inst_307, label %bb_inst_305

bb_inst_305:                                      ; preds = %bb_inst_302
  %288 = trunc i64 %r3.1 to i8
  %289 = or i8 %288, 2
  %290 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  store i8 %289, ptr %290, align 4
  br label %bb_inst_307

bb_inst_307:                                      ; preds = %bb_inst_305, %bb_inst_302
  br i1 %279, label %bb_inst_310, label %bb_inst_536

bb_inst_310:                                      ; preds = %bb_inst_307
  %291 = load i16, ptr %283, align 2
  store i16 %291, ptr %19, align 8
  %292 = add i64 %280, 2
  br label %bb_inst_543

bb_inst_314:                                      ; preds = %bb_inst_277, %bb_inst_259
  %.pre-phi3057 = phi ptr [ %255, %bb_inst_259 ], [ %.pre3052, %bb_inst_277 ]
  %r3.2 = phi i64 [ %252, %bb_inst_259 ], [ %269, %bb_inst_277 ]
  %r5.1 = phi i64 [ %259, %bb_inst_259 ], [ undef, %bb_inst_277 ]
  %293 = getelementptr i8, ptr %.pre-phi3057, i64 2
  %294 = load i16, ptr %293, align 2
  store i16 %294, ptr %97, align 8
  br label %bb_inst_318

bb_inst_318:                                      ; preds = %bb_inst_314, %bb_inst_261
  %.pre-phi = phi ptr [ %.pre-phi3057, %bb_inst_314 ], [ %.pre, %bb_inst_261 ]
  %r3.3 = phi i64 [ %r3.2, %bb_inst_314 ], [ %266, %bb_inst_261 ]
  %r5.2 = phi i64 [ %r5.1, %bb_inst_314 ], [ %r5.0, %bb_inst_261 ]
  %r4.0 = add i64 %2, -40
  %295 = load i16, ptr %.pre-phi, align 2
  %296 = getelementptr inbounds i8, ptr %stackEnd, i64 -136
  store i64 %r4.0, ptr %296, align 8
  %297 = inttoptr i64 %r4.0 to ptr
  %298 = getelementptr i8, ptr %297, i64 2
  store i16 %295, ptr %298, align 2
  %299 = getelementptr inbounds i8, ptr %stackEnd, i64 -78
  store i8 %r1.0.in, ptr %299, align 2
  store i16 %295, ptr %102, align 8
  %300 = load <2 x i64>, ptr %99, align 8
  store <2 x i64> %300, ptr %104, align 8
  %301 = add i64 %2, -96
  %302 = shl i64 5, 32
  %303 = call i64 @_bpf_helper_ext_0001(i64 %302, i64 %301, i64 %r3.3, i64 %r4.0, i64 %r5.2)
  %.not2926 = icmp eq i64 %303, 0
  br i1 %.not2926, label %bb_inst_333, label %bb_inst_350

bb_inst_333:                                      ; preds = %bb_inst_318
  store i16 0, ptr %102, align 8
  %304 = shl i64 5, 32
  %305 = call i64 @_bpf_helper_ext_0001(i64 %304, i64 %301, i64 %r3.3, i64 %r4.0, i64 %r5.2)
  %306 = icmp eq i64 %305, 0
  br i1 %306, label %bb_inst_942, label %bb_inst_343

bb_inst_343:                                      ; preds = %bb_inst_333
  %307 = inttoptr i64 %305 to ptr
  %308 = load i32, ptr %307, align 4
  %309 = and i32 %308, 136
  %.not2927 = icmp eq i32 %309, 0
  br i1 %.not2927, label %bb_inst_347, label %bb_inst_350

bb_inst_347:                                      ; preds = %bb_inst_343
  %310 = load i64, ptr %296, align 8
  %311 = inttoptr i64 %310 to ptr
  %312 = getelementptr i8, ptr %311, i64 2
  store i16 0, ptr %312, align 2
  br label %bb_inst_350

bb_inst_350:                                      ; preds = %bb_inst_347, %bb_inst_343, %bb_inst_318
  %r0.1 = phi i64 [ %303, %bb_inst_318 ], [ %305, %bb_inst_343 ], [ %305, %bb_inst_347 ]
  %313 = sub i64 %5, %6
  %314 = getelementptr inbounds i8, ptr %stackEnd, i64 -128
  %315 = icmp sgt i64 %313, 1514
  br i1 %315, label %bb_inst_942, label %bb_inst_355

bb_inst_355:                                      ; preds = %bb_inst_350
  %316 = getelementptr inbounds i8, ptr %stackEnd, i64 -144
  store i64 %r0.1, ptr %316, align 8
  %317 = getelementptr inbounds i8, ptr %stackEnd, i64 -108
  store i32 512, ptr %317, align 4
  %318 = add i64 %2, -108
  %319 = shl i64 13, 32
  %320 = call i64 @_bpf_helper_ext_0001(i64 %319, i64 %318, i64 %r3.3, i64 %r4.0, i64 %r5.2)
  %321 = icmp eq i64 %320, 0
  br i1 %321, label %bb_inst_942, label %bb_inst_366

bb_inst_366:                                      ; preds = %bb_inst_355
  %322 = inttoptr i64 %320 to ptr
  %323 = load i64, ptr %322, align 4
  %324 = add i64 %323, 1
  %325 = getelementptr inbounds i8, ptr %stackEnd, i64 -160
  store i64 %320, ptr %325, align 8
  store i64 %324, ptr %322, align 4
  %326 = load i64, ptr %316, align 8
  %327 = inttoptr i64 %326 to ptr
  %328 = load i32, ptr %327, align 4
  %329 = and i32 %328, 1
  %330 = icmp eq i32 %329, 0
  br i1 %330, label %bb_inst_376, label %bb_inst_374

bb_inst_374:                                      ; preds = %bb_inst_366
  store i16 0, ptr %97, align 8
  br label %bb_inst_376

bb_inst_376:                                      ; preds = %bb_inst_374, %bb_inst_366
  %331 = getelementptr i8, ptr %327, i64 4
  %332 = load i32, ptr %331, align 4
  %333 = zext i32 %332 to i64
  %334 = getelementptr inbounds i8, ptr %stackEnd, i64 -100
  store i32 %332, ptr %334, align 4
  %335 = call i64 @_bpf_helper_ext_0008(i64 %333, i64 %318, i64 %r3.3, i64 %r4.0, i64 %r5.2)
  %336 = trunc i64 %335 to i32
  %337 = getelementptr inbounds i8, ptr %stackEnd, i64 -112
  store i32 %336, ptr %337, align 8
  %338 = add i64 %2, -112
  %339 = shl i64 8, 32
  %340 = call i64 @_bpf_helper_ext_0001(i64 %339, i64 %338, i64 %r3.3, i64 %r4.0, i64 %r5.2)
  %.not2928 = icmp eq i64 %340, 0
  br i1 %.not2928, label %bb_inst_387, label %bb_inst_401

bb_inst_387:                                      ; preds = %bb_inst_376
  %341 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 515, ptr %341, align 8
  %342 = add i64 %2, -16
  %343 = shl i64 13, 32
  %344 = call i64 @_bpf_helper_ext_0001(i64 %343, i64 %342, i64 0, i64 %r4.0, i64 %r5.2)
  %345 = icmp eq i64 %344, 0
  br i1 %345, label %bb_inst_942, label %bb_inst_395

bb_inst_395:                                      ; preds = %bb_inst_387
  %346 = inttoptr i64 %344 to ptr
  %347 = load i64, ptr %346, align 4
  %348 = add i64 %347, 1
  store i64 %348, ptr %346, align 4
  %349 = shl i64 6, 32
  %350 = load i64, ptr %316, align 8
  %.pre3044 = inttoptr i64 %350 to ptr
  br label %bb_inst_401

bb_inst_401:                                      ; preds = %bb_inst_395, %bb_inst_376
  %.pre-phi3045 = phi ptr [ %.pre3044, %bb_inst_395 ], [ %327, %bb_inst_376 ]
  %r3.4 = phi i64 [ %349, %bb_inst_395 ], [ %340, %bb_inst_376 ]
  %r8.0 = phi i64 [ %350, %bb_inst_395 ], [ %326, %bb_inst_376 ]
  %351 = load i32, ptr %.pre-phi3045, align 4
  %352 = and i32 %351, 4
  %353 = icmp eq i32 %352, 0
  br i1 %353, label %bb_inst_1223, label %bb_inst_405

bb_inst_405:                                      ; preds = %bb_inst_401
  %354 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  %355 = load i8, ptr %354, align 4
  %356 = and i8 %355, 1
  %357 = icmp eq i8 %356, 0
  br i1 %357, label %bb_inst_646, label %bb_inst_408

bb_inst_408:                                      ; preds = %bb_inst_405
  %358 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 523, ptr %358, align 8
  %359 = add i64 %2, -16
  %360 = shl i64 13, 32
  %361 = call i64 @_bpf_helper_ext_0001(i64 %360, i64 %359, i64 %r3.4, i64 %r4.0, i64 %r5.2)
  %362 = icmp eq i64 %361, 0
  br i1 %362, label %bb_inst_942, label %bb_inst_417

bb_inst_417:                                      ; preds = %bb_inst_408
  %363 = inttoptr i64 %361 to ptr
  %364 = load i64, ptr %363, align 4
  %365 = add i64 %364, 1
  store i64 %365, ptr %363, align 4
  %366 = getelementptr i8, ptr %9, i64 55
  %367 = load i8, ptr %366, align 1
  %368 = load i64, ptr %316, align 8
  %369 = add i8 %367, -5
  %370 = icmp ult i8 %369, -2
  br i1 %370, label %bb_inst_1223, label %bb_inst_425

bb_inst_425:                                      ; preds = %bb_inst_417
  %371 = getelementptr i8, ptr %363, i64 8
  %372 = load i64, ptr %371, align 4
  %373 = add i64 %372, 1
  store i64 %373, ptr %371, align 4
  br label %bb_inst_1223

bb_inst_430:                                      ; preds = %bb_inst_136
  %374 = getelementptr inbounds i8, ptr %stackEnd, i64 -128
  store i64 %126, ptr %374, align 8
  %375 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 524, ptr %375, align 8
  %376 = add i64 %2, -16
  %377 = shl i64 13, 32
  %378 = call i64 @_bpf_helper_ext_0001(i64 %377, i64 %376, i64 %114, i64 %121, i64 undef)
  %379 = icmp eq i64 %378, 0
  br i1 %379, label %bb_inst_942, label %bb_inst_439

bb_inst_439:                                      ; preds = %bb_inst_430
  %380 = inttoptr i64 %378 to ptr
  %381 = load i64, ptr %380, align 4
  %382 = add i64 %381, 1
  store i64 %382, ptr %380, align 4
  %383 = getelementptr i8, ptr %9, i64 58
  %384 = load i32, ptr %383, align 4
  %rev2923 = call i32 @llvm.bswap.i32(i32 %384)
  %385 = icmp ugt i32 %rev2923, 1279
  br i1 %385, label %bb_inst_448, label %bb_inst_445

bb_inst_445:                                      ; preds = %bb_inst_439
  %386 = getelementptr i8, ptr %380, i64 8
  %387 = load i64, ptr %386, align 4
  %388 = add i64 %387, 1
  store i64 %388, ptr %386, align 4
  br label %bb_inst_448

bb_inst_448:                                      ; preds = %bb_inst_445, %bb_inst_439
  %389 = load i64, ptr %374, align 8
  br label %bb_inst_449

bb_inst_449:                                      ; preds = %bb_inst_136, %bb_inst_448
  %r0.2 = phi i64 [ %126, %bb_inst_136 ], [ %389, %bb_inst_448 ]
  %390 = add i64 %6, 102
  %391 = icmp ugt i64 %390, %5
  br i1 %391, label %bb_inst_942, label %bb_inst_453

bb_inst_453:                                      ; preds = %bb_inst_449
  %392 = getelementptr i8, ptr %9, i64 68
  %393 = load i8, ptr %392, align 1
  store i8 %393, ptr %110, align 4
  %394 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  %395 = load i8, ptr %394, align 4
  %396 = or i8 %395, 1
  %397 = zext i8 %396 to i64
  store i8 %396, ptr %394, align 4
  br label %bb_inst_239

bb_inst_479:                                      ; preds = %bb_inst_285
  %398 = and i64 %r3.1, 1
  %399 = icmp eq i64 %398, 0
  %spec.store.select3 = select i1 %399, i64 34, i64 62
  %400 = add i64 %spec.store.select3, %6
  %401 = add i64 %400, 8
  %402 = icmp ugt i64 %401, %5
  br i1 %402, label %bb_inst_942, label %bb_inst_489

bb_inst_489:                                      ; preds = %bb_inst_479
  %403 = inttoptr i64 %400 to ptr
  br i1 %399, label %bb_inst_490, label %bb_inst_539

bb_inst_490:                                      ; preds = %bb_inst_489
  %404 = load i16, ptr %403, align 2
  store i16 %404, ptr %19, align 8
  %405 = add i64 %400, 2
  br label %bb_inst_543

bb_inst_496:                                      ; preds = %bb_inst_50
  %406 = getelementptr i8, ptr %9, i64 35
  %407 = load i8, ptr %406, align 1
  %.not2886 = icmp eq i8 %407, 4
  br i1 %.not2886, label %bb_inst_498, label %bb_inst_517

bb_inst_498:                                      ; preds = %bb_inst_496
  %408 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 525, ptr %408, align 8
  %409 = add i64 %2, -16
  %410 = shl i64 13, 32
  %411 = call i64 @_bpf_helper_ext_0001(i64 %410, i64 %409, i64 %25, i64 %44, i64 undef)
  %412 = icmp eq i64 %411, 0
  br i1 %412, label %bb_inst_942, label %bb_inst_507

bb_inst_507:                                      ; preds = %bb_inst_498
  %413 = inttoptr i64 %411 to ptr
  %414 = load i64, ptr %413, align 4
  %415 = add i64 %414, 1
  store i64 %415, ptr %413, align 4
  %416 = getelementptr i8, ptr %9, i64 40
  %417 = load i16, ptr %416, align 2
  %418 = and i16 %417, 255
  %419 = icmp ugt i16 %418, 4
  br i1 %419, label %bb_inst_517, label %bb_inst_513

bb_inst_513:                                      ; preds = %bb_inst_507
  %420 = getelementptr i8, ptr %413, i64 8
  %421 = load i64, ptr %420, align 4
  %422 = add i64 %421, 1
  store i64 %422, ptr %420, align 4
  br label %bb_inst_517

bb_inst_517:                                      ; preds = %bb_inst_507, %bb_inst_513, %bb_inst_496
  %423 = add i64 %6, 62
  %424 = icmp ugt i64 %423, %5
  br i1 %424, label %bb_inst_942, label %bb_inst_521

bb_inst_521:                                      ; preds = %bb_inst_517
  %425 = inttoptr i64 %44 to ptr
  %426 = load i8, ptr %425, align 1
  %427 = and i8 %426, 15
  %428 = icmp eq i8 %427, 5
  br i1 %428, label %bb_inst_526, label %bb_inst_942

bb_inst_526:                                      ; preds = %bb_inst_521
  %429 = getelementptr i8, ptr %9, i64 51
  %430 = load i8, ptr %429, align 1
  store i8 %430, ptr %35, align 4
  %431 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  %432 = load i8, ptr %431, align 4
  %433 = or i8 %432, 1
  %434 = zext i8 %433 to i64
  store i8 %433, ptr %431, align 4
  br label %bb_inst_285

bb_inst_536:                                      ; preds = %bb_inst_307
  %435 = getelementptr i8, ptr %283, i64 2
  %436 = load i16, ptr %435, align 2
  store i16 %436, ptr %19, align 8
  br label %bb_inst_543

bb_inst_539:                                      ; preds = %bb_inst_489
  %437 = getelementptr i8, ptr %403, i64 2
  %438 = load i16, ptr %437, align 2
  store i16 %438, ptr %19, align 8
  br label %bb_inst_543

bb_inst_543:                                      ; preds = %bb_inst_539, %bb_inst_536, %bb_inst_490, %bb_inst_310
  %r4.2 = phi i64 [ %400, %bb_inst_539 ], [ %405, %bb_inst_490 ], [ %280, %bb_inst_536 ], [ %292, %bb_inst_310 ]
  %r5.3 = phi i64 [ %401, %bb_inst_539 ], [ %401, %bb_inst_490 ], [ 1, %bb_inst_536 ], [ 0, %bb_inst_310 ]
  %r0.3 = add i64 %2, -40
  %439 = inttoptr i64 %r4.2 to ptr
  %440 = load i16, ptr %439, align 2
  %441 = zext i16 %440 to i64
  %442 = getelementptr inbounds i8, ptr %stackEnd, i64 -136
  store i64 %r0.3, ptr %442, align 8
  %443 = inttoptr i64 %r0.3 to ptr
  %444 = getelementptr i8, ptr %443, i64 2
  store i16 %440, ptr %444, align 2
  %445 = getelementptr inbounds i8, ptr %stackEnd, i64 -78
  store i8 %r1.1.in, ptr %445, align 2
  store i16 %440, ptr %22, align 8
  store i32 %277, ptr %23, align 8
  %446 = add i64 %2, -96
  %447 = shl i64 5, 32
  %448 = call i64 @_bpf_helper_ext_0001(i64 %447, i64 %446, i64 %441, i64 %r4.2, i64 %r5.3)
  %.not2889 = icmp eq i64 %448, 0
  br i1 %.not2889, label %bb_inst_555, label %bb_inst_570

bb_inst_555:                                      ; preds = %bb_inst_543
  store i16 0, ptr %22, align 8
  %449 = shl i64 5, 32
  %450 = call i64 @_bpf_helper_ext_0001(i64 %449, i64 %446, i64 %441, i64 %r4.2, i64 %r5.3)
  %451 = icmp eq i64 %450, 0
  br i1 %451, label %bb_inst_942, label %bb_inst_564

bb_inst_564:                                      ; preds = %bb_inst_555
  %452 = inttoptr i64 %450 to ptr
  %453 = load i32, ptr %452, align 4
  %454 = and i32 %453, 136
  %.not2890 = icmp eq i32 %454, 0
  br i1 %.not2890, label %bb_inst_567, label %bb_inst_570

bb_inst_567:                                      ; preds = %bb_inst_564
  %455 = load i64, ptr %442, align 8
  %456 = inttoptr i64 %455 to ptr
  %457 = getelementptr i8, ptr %456, i64 2
  store i16 0, ptr %457, align 2
  br label %bb_inst_570

bb_inst_570:                                      ; preds = %bb_inst_567, %bb_inst_564, %bb_inst_543
  %r0.4 = phi i64 [ %448, %bb_inst_543 ], [ %450, %bb_inst_564 ], [ %450, %bb_inst_567 ]
  %458 = sub i64 %5, %6
  %459 = icmp sgt i64 %458, 1514
  br i1 %459, label %bb_inst_942, label %bb_inst_574

bb_inst_574:                                      ; preds = %bb_inst_570
  %460 = getelementptr inbounds i8, ptr %stackEnd, i64 -144
  store i64 %r0.4, ptr %460, align 8
  %461 = getelementptr inbounds i8, ptr %stackEnd, i64 -108
  store i32 512, ptr %461, align 4
  %462 = add i64 %2, -108
  %463 = shl i64 13, 32
  %464 = call i64 @_bpf_helper_ext_0001(i64 %463, i64 %462, i64 %441, i64 %r4.2, i64 %r5.3)
  %465 = icmp eq i64 %464, 0
  br i1 %465, label %bb_inst_942, label %bb_inst_584

bb_inst_584:                                      ; preds = %bb_inst_574
  %466 = inttoptr i64 %464 to ptr
  %467 = load i64, ptr %466, align 4
  %468 = add i64 %467, 1
  %469 = getelementptr inbounds i8, ptr %stackEnd, i64 -160
  store i64 %464, ptr %469, align 8
  store i64 %468, ptr %466, align 4
  %470 = load i64, ptr %460, align 8
  %471 = inttoptr i64 %470 to ptr
  %472 = load i32, ptr %471, align 4
  %473 = and i32 %472, 1
  %474 = icmp eq i32 %473, 0
  br i1 %474, label %bb_inst_594, label %bb_inst_592

bb_inst_592:                                      ; preds = %bb_inst_584
  store i16 0, ptr %19, align 8
  br label %bb_inst_594

bb_inst_594:                                      ; preds = %bb_inst_592, %bb_inst_584
  %475 = getelementptr i8, ptr %471, i64 4
  %476 = load i32, ptr %475, align 4
  %477 = zext i32 %476 to i64
  %478 = getelementptr inbounds i8, ptr %stackEnd, i64 -100
  store i32 %476, ptr %478, align 4
  %479 = call i64 @_bpf_helper_ext_0008(i64 %477, i64 %462, i64 %441, i64 %r4.2, i64 %r5.3)
  %480 = trunc i64 %479 to i32
  %481 = getelementptr inbounds i8, ptr %stackEnd, i64 -112
  store i32 %480, ptr %481, align 8
  %482 = add i64 %2, -112
  %483 = shl i64 8, 32
  %484 = call i64 @_bpf_helper_ext_0001(i64 %483, i64 %482, i64 %441, i64 %r4.2, i64 %r5.3)
  %.not2891 = icmp eq i64 %484, 0
  br i1 %.not2891, label %bb_inst_605, label %bb_inst_619

bb_inst_605:                                      ; preds = %bb_inst_594
  %485 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 515, ptr %485, align 8
  %486 = add i64 %2, -16
  %487 = shl i64 13, 32
  %488 = call i64 @_bpf_helper_ext_0001(i64 %487, i64 %486, i64 0, i64 %r4.2, i64 %r5.3)
  %489 = icmp eq i64 %488, 0
  br i1 %489, label %bb_inst_942, label %bb_inst_613

bb_inst_613:                                      ; preds = %bb_inst_605
  %490 = inttoptr i64 %488 to ptr
  %491 = load i64, ptr %490, align 4
  %492 = add i64 %491, 1
  store i64 %492, ptr %490, align 4
  %493 = shl i64 6, 32
  %494 = load i64, ptr %460, align 8
  %.pre3050 = inttoptr i64 %494 to ptr
  br label %bb_inst_619

bb_inst_619:                                      ; preds = %bb_inst_613, %bb_inst_594
  %.pre-phi3051 = phi ptr [ %.pre3050, %bb_inst_613 ], [ %471, %bb_inst_594 ]
  %r3.5 = phi i64 [ %493, %bb_inst_613 ], [ %484, %bb_inst_594 ]
  %r8.1 = phi i64 [ %494, %bb_inst_613 ], [ %470, %bb_inst_594 ]
  %495 = load i32, ptr %.pre-phi3051, align 4
  %496 = and i32 %495, 4
  %497 = getelementptr inbounds i8, ptr %stackEnd, i64 -152
  store i64 %r3.5, ptr %497, align 8
  %498 = icmp eq i32 %496, 0
  br i1 %498, label %bb_inst_720, label %bb_inst_623

bb_inst_623:                                      ; preds = %bb_inst_619
  %499 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  %500 = load i8, ptr %499, align 4
  %501 = and i8 %500, 1
  %502 = icmp eq i8 %501, 0
  br i1 %502, label %bb_inst_680, label %bb_inst_626

bb_inst_626:                                      ; preds = %bb_inst_623
  %503 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 523, ptr %503, align 8
  %504 = add i64 %2, -16
  %505 = shl i64 13, 32
  %506 = call i64 @_bpf_helper_ext_0001(i64 %505, i64 %504, i64 %r3.5, i64 %r4.2, i64 %r5.3)
  %507 = icmp eq i64 %506, 0
  br i1 %507, label %bb_inst_942, label %bb_inst_634

bb_inst_634:                                      ; preds = %bb_inst_626
  %508 = inttoptr i64 %506 to ptr
  %509 = load i64, ptr %508, align 4
  %510 = add i64 %509, 1
  store i64 %510, ptr %508, align 4
  %511 = getelementptr i8, ptr %9, i64 35
  %512 = load i8, ptr %511, align 1
  %513 = and i8 %512, -3
  %.not2892 = icmp eq i8 %513, 1
  br i1 %.not2892, label %bb_inst_640, label %bb_inst_643

bb_inst_640:                                      ; preds = %bb_inst_634
  %514 = getelementptr i8, ptr %508, i64 8
  %515 = load i64, ptr %514, align 4
  %516 = add i64 %515, 1
  store i64 %516, ptr %514, align 4
  br label %bb_inst_643

bb_inst_643:                                      ; preds = %bb_inst_640, %bb_inst_634
  %517 = load i64, ptr %460, align 8
  %518 = load i64, ptr %497, align 8
  br label %bb_inst_720

bb_inst_646:                                      ; preds = %bb_inst_405
  %519 = getelementptr inbounds i8, ptr %stackEnd, i64 -152
  store i64 %r3.4, ptr %519, align 8
  %520 = getelementptr inbounds i8, ptr %stackEnd, i64 -120
  store i32 0, ptr %520, align 8
  %521 = add i64 %2, -120
  %522 = shl i64 14, 32
  %523 = call i64 @_bpf_helper_ext_0001(i64 %522, i64 %521, i64 %r3.4, i64 %r4.0, i64 %r5.2)
  %524 = icmp eq i64 %523, 0
  br i1 %524, label %bb_inst_942, label %bb_inst_656

bb_inst_656:                                      ; preds = %bb_inst_646
  %525 = load i8, ptr %354, align 4
  %526 = and i8 %525, 1
  %527 = icmp eq i8 %526, 0
  %spec.store.select4 = select i1 %527, i64 54, i64 102
  %528 = add i64 %spec.store.select4, %6
  %529 = add i64 %528, 9
  %530 = icmp ugt i64 %529, %5
  br i1 %530, label %bb_inst_1221.sink.split, label %bb_inst_665

bb_inst_665:                                      ; preds = %bb_inst_656
  %531 = add i64 %528, 8
  %532 = inttoptr i64 %531 to ptr
  %533 = load i8, ptr %532, align 1
  %534 = icmp sgt i8 %533, -1
  br i1 %534, label %bb_inst_1107, label %bb_inst_670

bb_inst_670:                                      ; preds = %bb_inst_665
  %535 = add i64 %528, 22
  %536 = icmp ugt i64 %535, %5
  br i1 %536, label %bb_inst_1221.sink.split, label %bb_inst_673

bb_inst_673:                                      ; preds = %bb_inst_670
  %537 = and i8 %533, 32
  %538 = icmp eq i8 %537, 0
  br i1 %538, label %bb_inst_1145, label %bb_inst_675

bb_inst_675:                                      ; preds = %bb_inst_673
  %539 = getelementptr i8, ptr %532, i64 5
  %540 = load i8, ptr %539, align 1
  %541 = add i64 %528, 14
  %542 = icmp ult i8 %540, 8
  br i1 %542, label %bb_inst_1221.sink.split, label %bb_inst_1111

bb_inst_680:                                      ; preds = %bb_inst_623
  %543 = getelementptr inbounds i8, ptr %stackEnd, i64 -120
  store i32 0, ptr %543, align 8
  %544 = add i64 %2, -120
  %545 = shl i64 14, 32
  %546 = call i64 @_bpf_helper_ext_0001(i64 %545, i64 %544, i64 %r3.5, i64 %r4.2, i64 %r5.3)
  %547 = icmp eq i64 %546, 0
  br i1 %547, label %bb_inst_942, label %bb_inst_688

bb_inst_688:                                      ; preds = %bb_inst_680
  %548 = getelementptr inbounds i8, ptr %stackEnd, i64 -168
  store i64 %546, ptr %548, align 8
  %549 = load i8, ptr %499, align 4
  %550 = and i8 %549, 1
  %551 = icmp eq i8 %550, 0
  %spec.store.select5 = select i1 %551, i64 34, i64 62
  %552 = add i64 %spec.store.select5, %6
  %553 = add i64 %552, 9
  %554 = icmp ugt i64 %553, %5
  br i1 %554, label %bb_inst_718.sink.split, label %bb_inst_699

bb_inst_699:                                      ; preds = %bb_inst_688
  %555 = add i64 %552, 8
  %556 = inttoptr i64 %555 to ptr
  %557 = load i8, ptr %556, align 1
  %558 = icmp sgt i8 %557, -1
  br i1 %558, label %bb_inst_1126, label %bb_inst_704

bb_inst_704:                                      ; preds = %bb_inst_699
  %559 = add i64 %552, 22
  %560 = icmp ugt i64 %559, %5
  br i1 %560, label %bb_inst_718.sink.split, label %bb_inst_707

bb_inst_707:                                      ; preds = %bb_inst_704
  %561 = and i8 %557, 32
  %562 = icmp eq i8 %561, 0
  br i1 %562, label %bb_inst_2032, label %bb_inst_709

bb_inst_709:                                      ; preds = %bb_inst_707
  %563 = getelementptr i8, ptr %556, i64 5
  %564 = load i8, ptr %563, align 1
  %565 = add i64 %552, 14
  %566 = icmp ult i8 %564, 8
  br i1 %566, label %bb_inst_718.sink.split, label %bb_inst_1130

bb_inst_718.sink.split:                           ; preds = %bb_inst_2101, %bb_inst_1130, %bb_inst_2066, %bb_inst_1126, %bb_inst_709, %bb_inst_704, %bb_inst_688, %bb_inst_2032
  %r2.5.sink = phi i64 [ %1540, %bb_inst_2032 ], [ %1594, %bb_inst_2101 ], [ %546, %bb_inst_1130 ], [ %546, %bb_inst_2066 ], [ %546, %bb_inst_1126 ], [ %546, %bb_inst_709 ], [ %546, %bb_inst_704 ], [ %546, %bb_inst_688 ]
  %567 = inttoptr i64 %r2.5.sink to ptr
  %568 = load i64, ptr %567, align 4
  %569 = add i64 %568, 1
  store i64 %569, ptr %567, align 4
  br label %bb_inst_718

bb_inst_718:                                      ; preds = %bb_inst_718.sink.split, %bb_inst_2032
  %570 = load i64, ptr %497, align 8
  %571 = load i64, ptr %460, align 8
  br label %bb_inst_720

bb_inst_720:                                      ; preds = %bb_inst_718, %bb_inst_643, %bb_inst_619
  %r3.6 = phi i64 [ %r3.5, %bb_inst_619 ], [ %570, %bb_inst_718 ], [ %518, %bb_inst_643 ]
  %r8.2 = phi i64 [ %r8.1, %bb_inst_619 ], [ %571, %bb_inst_718 ], [ %517, %bb_inst_643 ]
  %572 = load i16, ptr %19, align 8
  %573 = zext i16 %572 to i64
  %574 = getelementptr inbounds i8, ptr %stackEnd, i64 -168
  store i64 %573, ptr %574, align 8
  %575 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  %576 = load i8, ptr %575, align 4
  %577 = and i8 %576, 2
  %.not2893 = icmp eq i8 %577, 0
  br i1 %.not2893, label %bb_inst_725, label %bb_inst_754

bb_inst_725:                                      ; preds = %bb_inst_720
  %578 = inttoptr i64 %r8.2 to ptr
  %579 = load i32, ptr %578, align 4
  %580 = and i32 %579, 2
  %.not2894 = icmp eq i32 %580, 0
  br i1 %.not2894, label %bb_inst_728, label %bb_inst_754

bb_inst_728:                                      ; preds = %bb_inst_725
  %581 = add i64 %2, -72
  %582 = call i64 @_bpf_helper_ext_0001(i64 %r3.6, i64 %581, i64 %r3.6, i64 %r4.2, i64 %r5.3)
  %583 = icmp eq i64 %582, 0
  br i1 %583, label %bb_inst_754, label %bb_inst_734

bb_inst_734:                                      ; preds = %bb_inst_728
  %584 = load i8, ptr %35, align 4
  %.not2895 = icmp eq i8 %584, 17
  br i1 %.not2895, label %bb_inst_736, label %bb_inst_734.bb_inst_744_crit_edge

bb_inst_734.bb_inst_744_crit_edge:                ; preds = %bb_inst_734
  %.pre3058 = inttoptr i64 %582 to ptr
  br label %bb_inst_744

bb_inst_736:                                      ; preds = %bb_inst_734
  %585 = call i64 @_bpf_helper_ext_0005(i64 17, i64 %581, i64 %r3.6, i64 %r4.2, i64 %r5.3)
  %586 = inttoptr i64 %582 to ptr
  %587 = getelementptr i8, ptr %586, i64 8
  %588 = load i64, ptr %587, align 4
  %589 = sub i64 %585, %588
  %590 = icmp ugt i64 %589, 30000000000
  br i1 %590, label %bb_inst_754, label %bb_inst_743

bb_inst_743:                                      ; preds = %bb_inst_736
  store i64 %585, ptr %587, align 4
  br label %bb_inst_744

bb_inst_744:                                      ; preds = %bb_inst_734.bb_inst_744_crit_edge, %bb_inst_743
  %.pre-phi3059 = phi ptr [ %.pre3058, %bb_inst_734.bb_inst_744_crit_edge ], [ %586, %bb_inst_743 ]
  %591 = load i32, ptr %.pre-phi3059, align 4
  store i32 %591, ptr %18, align 8
  %592 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 %591, ptr %592, align 8
  %593 = add i64 %2, -16
  %594 = shl i64 9, 32
  %595 = call i64 @_bpf_helper_ext_0001(i64 %594, i64 %593, i64 %r3.6, i64 %r4.2, i64 %r5.3)
  %596 = getelementptr inbounds i8, ptr %stackEnd, i64 -176
  store i64 %595, ptr %596, align 8
  %.not2896 = icmp eq i64 %595, 0
  br i1 %.not2896, label %bb_inst_754, label %bb_inst_997

bb_inst_754:                                      ; preds = %bb_inst_744, %bb_inst_736, %bb_inst_728, %bb_inst_725, %bb_inst_720
  %597 = load i8, ptr %35, align 4
  %.not2897 = icmp eq i8 %597, 6
  br i1 %.not2897, label %bb_inst_756, label %bb_inst_774

bb_inst_756:                                      ; preds = %bb_inst_754
  %598 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 513, ptr %598, align 8
  %599 = add i64 %2, -16
  %600 = shl i64 13, 32
  %601 = call i64 @_bpf_helper_ext_0001(i64 %600, i64 %599, i64 %r3.6, i64 %r4.2, i64 %r5.3)
  %602 = icmp eq i64 %601, 0
  br i1 %602, label %bb_inst_942, label %bb_inst_764

bb_inst_764:                                      ; preds = %bb_inst_756
  %603 = load i8, ptr %575, align 4
  %604 = shl i8 %603, 2
  %605 = and i8 %604, 8
  %606 = xor i8 %605, 8
  %607 = zext i8 %606 to i64
  %608 = add i64 %601, %607
  %609 = inttoptr i64 %608 to ptr
  %610 = load i64, ptr %609, align 4
  %611 = add i64 %610, 1
  store i64 %611, ptr %609, align 4
  br label %bb_inst_774

bb_inst_774:                                      ; preds = %bb_inst_764, %bb_inst_754
  %612 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  %613 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  %614 = getelementptr inbounds i8, ptr %stackEnd, i64 -120
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %613, i8 0, i64 16, i1 false)
  store i32 514, ptr %614, align 8
  %615 = add i64 %2, -120
  %616 = shl i64 13, 32
  %617 = call i64 @_bpf_helper_ext_0001(i64 %616, i64 %615, i64 %r3.6, i64 %r4.2, i64 %r5.3)
  %618 = icmp eq i64 %617, 0
  br i1 %618, label %bb_inst_803, label %bb_inst_787

bb_inst_787:                                      ; preds = %bb_inst_774
  %619 = call i64 @_bpf_helper_ext_0005(i64 %616, i64 %615, i64 %r3.6, i64 %r4.2, i64 %r5.3)
  %620 = inttoptr i64 %617 to ptr
  %621 = getelementptr i8, ptr %620, i64 8
  %622 = load i64, ptr %621, align 4
  %623 = sub i64 %619, %622
  %624 = icmp ult i64 %623, 1000000001
  br i1 %624, label %bb_inst_798, label %bb_inst_794

bb_inst_794:                                      ; preds = %bb_inst_787
  store i64 %619, ptr %621, align 4
  store i64 1, ptr %620, align 4
  br label %bb_inst_802

bb_inst_798:                                      ; preds = %bb_inst_787
  %625 = load i64, ptr %620, align 4
  %626 = add i64 %625, 1
  store i64 %626, ptr %620, align 4
  %627 = icmp ugt i64 %626, 125000
  br i1 %627, label %bb_inst_803, label %bb_inst_802

bb_inst_802:                                      ; preds = %bb_inst_798, %bb_inst_794
  br label %bb_inst_803

bb_inst_803:                                      ; preds = %bb_inst_802, %bb_inst_798, %bb_inst_774
  %r8.3 = phi i64 [ 0, %bb_inst_774 ], [ %619, %bb_inst_798 ], [ %619, %bb_inst_802 ]
  %r9.0 = phi i64 [ 1, %bb_inst_774 ], [ 1, %bb_inst_798 ], [ 0, %bb_inst_802 ]
  %628 = load i64, ptr %460, align 8
  %629 = inttoptr i64 %628 to ptr
  %630 = load i32, ptr %629, align 4
  %631 = and i32 %630, 8
  %.not2898 = icmp eq i32 %631, 0
  br i1 %.not2898, label %bb_inst_807, label %bb_inst_809

bb_inst_807:                                      ; preds = %bb_inst_803
  %632 = load i32, ptr %21, align 8
  %633 = zext i32 %632 to i64
  br label %bb_inst_815

bb_inst_809:                                      ; preds = %bb_inst_803
  %634 = load i64, ptr %442, align 8
  %635 = inttoptr i64 %634 to ptr
  %636 = getelementptr i8, ptr %635, i64 2
  %637 = load i16, ptr %636, align 2
  store i16 %637, ptr %19, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %21, i8 0, i64 16, i1 false)
  br label %bb_inst_815

bb_inst_815:                                      ; preds = %bb_inst_809, %bb_inst_807
  %r5.4 = phi i64 [ 0, %bb_inst_809 ], [ %633, %bb_inst_807 ]
  %638 = load i32, ptr %19, align 8
  %639 = zext i32 %638 to i64
  %640 = add nsw i64 %639, -525483785
  %641 = lshr i64 %640, 18
  %642 = and i64 %641, 16383
  %.neg3026 = mul nsw i64 %640, -16384
  %643 = xor i64 %640, -525483785
  %.neg2971 = add nsw i64 %643, %.neg3026
  %644 = sub nsw i64 %.neg2971, %642
  %645 = lshr i64 %644, 21
  %646 = and i64 %645, 2047
  %.neg = mul nsw i64 %644, -2048
  %647 = add nsw i64 %r5.4, -525483785
  %648 = xor i64 %644, %647
  %.neg2974 = add nsw i64 %648, %.neg
  %649 = sub i64 %.neg2974, %646
  %650 = lshr i64 %649, 7
  %651 = and i64 %650, 33554431
  %.neg3027 = mul i64 %649, -33554432
  %652 = xor i64 %649, %640
  %.neg2977 = add i64 %652, %.neg3027
  %653 = sub i64 %.neg2977, %651
  %654 = lshr i64 %653, 16
  %655 = and i64 %654, 65535
  %.neg3028 = mul i64 %653, -65536
  %656 = xor i64 %653, %644
  %.neg2980 = add i64 %656, %.neg3028
  %657 = sub i64 %.neg2980, %655
  %658 = lshr i64 %657, 28
  %659 = and i64 %658, 15
  %.neg3029 = mul i64 %657, -16
  %660 = xor i64 %657, %649
  %.neg2983 = add i64 %660, %.neg3029
  %661 = sub i64 %.neg2983, %659
  %662 = lshr i64 %661, 18
  %663 = and i64 %662, 16383
  %.neg3030 = mul i64 %661, -16384
  %664 = xor i64 %661, %653
  %.neg2986 = add i64 %664, %.neg3030
  %665 = sub i64 %.neg2986, %663
  %666 = lshr i64 %665, 8
  %667 = and i64 %666, 16777215
  %.neg3031 = mul i64 %665, -16777216
  %668 = xor i64 %665, %657
  %.neg2989 = add i64 %668, %.neg3031
  %669 = sub i64 %.neg2989, %667
  %.lhs.trunc2967 = trunc i64 %669 to i32
  %670 = urem i32 %.lhs.trunc2967, 65537
  %671 = getelementptr i8, ptr %629, i64 4
  %672 = load i32, ptr %671, align 4
  %673 = mul i32 %672, 65537
  %674 = add i32 %670, %673
  %675 = getelementptr inbounds i8, ptr %stackEnd, i64 -20
  store i32 %674, ptr %675, align 4
  %676 = add i64 %2, -20
  %677 = shl i64 7, 32
  %678 = call i64 @_bpf_helper_ext_0001(i64 %677, i64 %676, i64 %657, i64 %667, i64 %653)
  %679 = icmp eq i64 %678, 0
  br i1 %679, label %bb_inst_942, label %bb_inst_908

bb_inst_908:                                      ; preds = %bb_inst_815
  %680 = inttoptr i64 %678 to ptr
  %681 = load i32, ptr %680, align 4
  store i32 %681, ptr %675, align 4
  %.not2900 = icmp eq i32 %681, 0
  br i1 %.not2900, label %bb_inst_911, label %bb_inst_923

bb_inst_911:                                      ; preds = %bb_inst_908
  store i32 521, ptr %614, align 8
  %682 = shl i64 13, 32
  %683 = call i64 @_bpf_helper_ext_0001(i64 %682, i64 %615, i64 %657, i64 %667, i64 %653)
  %684 = icmp eq i64 %683, 0
  br i1 %684, label %bb_inst_922, label %bb_inst_919

bb_inst_919:                                      ; preds = %bb_inst_911
  %685 = inttoptr i64 %683 to ptr
  %686 = getelementptr i8, ptr %685, i64 8
  %687 = load i64, ptr %686, align 4
  %688 = add i64 %687, 1
  store i64 %688, ptr %686, align 4
  br label %bb_inst_922

bb_inst_922:                                      ; preds = %bb_inst_919, %bb_inst_911
  %689 = load i32, ptr %675, align 4
  br label %bb_inst_923

bb_inst_923:                                      ; preds = %bb_inst_922, %bb_inst_908
  %r1.2.in = phi i32 [ %681, %bb_inst_908 ], [ %689, %bb_inst_922 ]
  store i32 %r1.2.in, ptr %18, align 8
  %690 = shl i64 9, 32
  %691 = call i64 @_bpf_helper_ext_0001(i64 %690, i64 %676, i64 %657, i64 %667, i64 %653)
  %.not2901 = icmp eq i64 %691, 0
  br i1 %.not2901, label %bb_inst_930, label %bb_inst_944

bb_inst_930:                                      ; preds = %bb_inst_923
  store i32 521, ptr %614, align 8
  %692 = shl i64 13, 32
  %693 = call i64 @_bpf_helper_ext_0001(i64 %692, i64 %615, i64 %657, i64 %667, i64 %653)
  %694 = icmp eq i64 %693, 0
  br i1 %694, label %bb_inst_942, label %bb_inst_938

bb_inst_938:                                      ; preds = %bb_inst_1613, %bb_inst_930
  %r0.5 = phi i64 [ %1167, %bb_inst_1613 ], [ %693, %bb_inst_930 ]
  %695 = inttoptr i64 %r0.5 to ptr
  %696 = load i64, ptr %695, align 4
  %697 = add i64 %696, 1
  store i64 %697, ptr %695, align 4
  br label %bb_inst_942

bb_inst_942:                                      ; preds = %bb_inst_387, %bb_inst_408, %bb_inst_498, %bb_inst_605, %bb_inst_626, %bb_inst_646, %bb_inst_680, %bb_inst_756, %bb_inst_815, %bb_inst_930, %bb_inst_938, %bb_inst_965, %bb_inst_982, %bb_inst_1208, %bb_inst_1261, %bb_inst_1340, %bb_inst_1613, %bb_inst_1642, %bb_inst_1672, %bb_inst_2096, %bb_inst_285, %bb_inst_239, %bb_inst_174, %bb_inst_1799, %bb_inst_1912, %bb_inst_136, %bb_inst_50, %bb_inst_7, %bb_inst_521, %bb_inst_1927, %bb_inst_1918, %bb_inst_1819, %bb_inst_1810, %bb_inst_1736, %bb_inst_1729, %bb_inst_1702, %bb_inst_1696, %bb_inst_1688, %bb_inst_1044, %bb_inst_1037, %bb_inst_1011, %bb_inst_1005, %bb_inst_997, %bb_inst_574, %bb_inst_570, %bb_inst_555, %bb_inst_517, %bb_inst_479, %bb_inst_449, %bb_inst_430, %bb_inst_355, %bb_inst_350, %bb_inst_333, %bb_inst_291, %bb_inst_267, %bb_inst_243, %bb_inst_133, %bb_inst_121, %bb_inst_106, %bb_inst_46, %bb_inst_33, %bb_inst_29, %bb_inst_14, %setupBlock
  %r8.4 = phi i64 [ 1, %setupBlock ], [ 1, %bb_inst_106 ], [ 1, %bb_inst_121 ], [ 1, %bb_inst_267 ], [ 1, %bb_inst_350 ], [ 1, %bb_inst_355 ], [ 1, %bb_inst_1688 ], [ 1, %bb_inst_1696 ], [ 1, %bb_inst_1702 ], [ 1, %bb_inst_1810 ], [ 1, %bb_inst_1819 ], [ 1, %bb_inst_1729 ], [ 1, %bb_inst_1736 ], [ 2, %bb_inst_333 ], [ 1, %bb_inst_243 ], [ 1, %bb_inst_133 ], [ 1, %bb_inst_449 ], [ 1, %bb_inst_430 ], [ 1, %bb_inst_14 ], [ 1, %bb_inst_29 ], [ 1, %bb_inst_33 ], [ 1, %bb_inst_479 ], [ 1, %bb_inst_570 ], [ 1, %bb_inst_574 ], [ 1, %bb_inst_997 ], [ 1, %bb_inst_1005 ], [ 1, %bb_inst_1011 ], [ 1, %bb_inst_1918 ], [ 1, %bb_inst_1927 ], [ 1, %bb_inst_1037 ], [ 1, %bb_inst_1044 ], [ 2, %bb_inst_555 ], [ 1, %bb_inst_291 ], [ 1, %bb_inst_46 ], [ 1, %bb_inst_517 ], [ 1, %bb_inst_521 ], [ 2, %bb_inst_7 ], [ 2, %bb_inst_50 ], [ 2, %bb_inst_136 ], [ 3, %bb_inst_1912 ], [ 3, %bb_inst_1799 ], [ 3, %bb_inst_174 ], [ 2, %bb_inst_239 ], [ 2, %bb_inst_285 ], [ 1, %bb_inst_2096 ], [ 1, %bb_inst_1672 ], [ 1, %bb_inst_1642 ], [ 1, %bb_inst_1613 ], [ 1, %bb_inst_1340 ], [ 1, %bb_inst_1261 ], [ 1, %bb_inst_1208 ], [ 1, %bb_inst_982 ], [ 1, %bb_inst_965 ], [ 1, %bb_inst_938 ], [ 1, %bb_inst_930 ], [ 1, %bb_inst_815 ], [ 1, %bb_inst_756 ], [ 1, %bb_inst_680 ], [ 1, %bb_inst_646 ], [ 1, %bb_inst_626 ], [ 1, %bb_inst_605 ], [ 1, %bb_inst_498 ], [ 1, %bb_inst_408 ], [ 1, %bb_inst_387 ]
  ret i64 %r8.4

bb_inst_944:                                      ; preds = %bb_inst_923
  %698 = getelementptr inbounds i8, ptr %stackEnd, i64 -176
  store i64 %691, ptr %698, align 8
  %699 = load i64, ptr %497, align 8
  %700 = icmp eq i64 %699, 0
  br i1 %700, label %bb_inst_965, label %bb_inst_947

bb_inst_947:                                      ; preds = %bb_inst_944
  %701 = load i64, ptr %460, align 8
  %702 = inttoptr i64 %701 to ptr
  %703 = load i32, ptr %702, align 4
  %704 = lshr i32 %703, 1
  %705 = and i32 %704, 1
  %706 = zext i32 %705 to i64
  %707 = or i64 %r9.0, %706
  %.not2902 = icmp eq i64 %707, 0
  br i1 %.not2902, label %bb_inst_953, label %bb_inst_965

bb_inst_953:                                      ; preds = %bb_inst_947
  %708 = load i8, ptr %35, align 4
  %.not2903 = icmp eq i8 %708, 17
  br i1 %.not2903, label %bb_inst_955, label %bb_inst_956

bb_inst_955:                                      ; preds = %bb_inst_953
  store i64 %r8.3, ptr %612, align 8
  br label %bb_inst_956

bb_inst_956:                                      ; preds = %bb_inst_955, %bb_inst_953
  %709 = load i32, ptr %675, align 4
  store i32 %709, ptr %613, align 8
  %710 = add i64 %2, -72
  %711 = add i64 %2, -16
  %712 = call i64 @_bpf_helper_ext_0002(i64 %699, i64 %710, i64 %711, i64 0, i64 %653)
  br label %bb_inst_965

bb_inst_965:                                      ; preds = %bb_inst_956, %bb_inst_947, %bb_inst_944
  %r3.7 = phi i64 [ %657, %bb_inst_944 ], [ %657, %bb_inst_947 ], [ %711, %bb_inst_956 ]
  %r4.3 = phi i64 [ %667, %bb_inst_944 ], [ %667, %bb_inst_947 ], [ 0, %bb_inst_956 ]
  store i32 0, ptr %613, align 8
  %713 = add i64 %2, -16
  %714 = shl i64 12, 32
  %715 = call i64 @_bpf_helper_ext_0001(i64 %714, i64 %713, i64 %r3.7, i64 %r4.3, i64 %653)
  %716 = icmp eq i64 %715, 0
  br i1 %716, label %bb_inst_942, label %bb_inst_973

bb_inst_973:                                      ; preds = %bb_inst_965
  %717 = load i16, ptr %22, align 8
  %718 = load i32, ptr %23, align 8
  %719 = zext i32 %718 to i64
  %720 = load i8, ptr %445, align 2
  %721 = inttoptr i64 %715 to ptr
  %722 = getelementptr i8, ptr %721, i64 18
  store i8 %720, ptr %722, align 1
  %723 = load i32, ptr %721, align 4
  %724 = zext i32 %723 to i64
  %.not2904 = icmp eq i32 %723, %718
  br i1 %.not2904, label %bb_inst_979, label %bb_inst_993

bb_inst_979:                                      ; preds = %bb_inst_973
  %725 = getelementptr i8, ptr %721, i64 16
  %726 = load i16, ptr %725, align 2
  %727 = zext i16 %726 to i64
  %728 = icmp ne i16 %726, %717
  %729 = icmp eq i8 %720, 0
  %or.cond = select i1 %728, i1 true, i1 %729
  br i1 %or.cond, label %bb_inst_993, label %bb_inst_982

bb_inst_982:                                      ; preds = %bb_inst_979
  %730 = load i32, ptr %18, align 8
  store i32 %730, ptr %614, align 8
  %731 = shl i64 11, 32
  %732 = call i64 @_bpf_helper_ext_0001(i64 %731, i64 %615, i64 %727, i64 %724, i64 %653)
  %733 = icmp eq i64 %732, 0
  br i1 %733, label %bb_inst_942, label %bb_inst_990

bb_inst_990:                                      ; preds = %bb_inst_982
  %734 = inttoptr i64 %732 to ptr
  %735 = load i32, ptr %734, align 4
  %736 = add i32 %735, 1
  store i32 %736, ptr %734, align 4
  br label %bb_inst_993

bb_inst_993:                                      ; preds = %bb_inst_990, %bb_inst_979, %bb_inst_973
  %r3.8 = phi i64 [ %719, %bb_inst_973 ], [ %727, %bb_inst_979 ], [ %727, %bb_inst_990 ]
  %737 = load i64, ptr %469, align 8
  %738 = inttoptr i64 %737 to ptr
  %739 = getelementptr i8, ptr %738, i64 8
  %740 = load i64, ptr %739, align 4
  %741 = add i64 %740, 1
  store i64 %741, ptr %739, align 4
  br label %bb_inst_997

bb_inst_997:                                      ; preds = %bb_inst_2241, %bb_inst_993, %bb_inst_744
  %r3.9 = phi i64 [ %r3.8, %bb_inst_993 ], [ %r3.6, %bb_inst_744 ], [ %r3.26, %bb_inst_2241 ]
  %r4.4 = phi i64 [ %724, %bb_inst_993 ], [ %r4.2, %bb_inst_744 ], [ %r4.11, %bb_inst_2241 ]
  %r5.5 = phi i64 [ %653, %bb_inst_993 ], [ %r5.3, %bb_inst_744 ], [ %r5.3, %bb_inst_2241 ]
  %742 = add i64 %2, -104
  %743 = shl i64 4, 32
  %744 = call i64 @_bpf_helper_ext_0001(i64 %743, i64 %742, i64 %r3.9, i64 %r4.4, i64 %r5.5)
  %745 = icmp eq i64 %744, 0
  br i1 %745, label %bb_inst_942, label %bb_inst_1005

bb_inst_1005:                                     ; preds = %bb_inst_997
  %746 = add i64 %2, -100
  %747 = shl i64 13, 32
  %748 = call i64 @_bpf_helper_ext_0001(i64 %747, i64 %746, i64 %r3.9, i64 %r4.4, i64 %r5.5)
  %749 = icmp eq i64 %748, 0
  br i1 %749, label %bb_inst_942, label %bb_inst_1011

bb_inst_1011:                                     ; preds = %bb_inst_1005
  %750 = load i64, ptr %43, align 8
  %trunc = trunc i64 %750 to i16
  %rev = call i16 @llvm.bswap.i16(i16 %trunc)
  %751 = zext i16 %rev to i64
  %752 = inttoptr i64 %748 to ptr
  %753 = load <2 x i64>, ptr %752, align 4
  %754 = insertelement <2 x i64> <i64 1, i64 poison>, i64 %751, i64 1
  %755 = add <2 x i64> %753, %754
  store <2 x i64> %755, ptr %752, align 4
  %756 = add i64 %2, -32
  %757 = shl i64 10, 32
  %758 = call i64 @_bpf_helper_ext_0001(i64 %757, i64 %756, i64 %r3.9, i64 %r4.4, i64 %r5.5)
  %759 = icmp eq i64 %758, 0
  br i1 %759, label %bb_inst_942, label %bb_inst_1025

bb_inst_1025:                                     ; preds = %bb_inst_1011
  %760 = inttoptr i64 %758 to ptr
  %761 = load <2 x i64>, ptr %760, align 4
  %762 = add <2 x i64> %761, %754
  store <2 x i64> %762, ptr %760, align 4
  %763 = getelementptr inbounds i8, ptr %stackEnd, i64 -168
  %764 = load i64, ptr %763, align 8
  %765 = trunc i64 %764 to i16
  store i16 %765, ptr %19, align 8
  %766 = getelementptr inbounds i8, ptr %stackEnd, i64 -176
  %767 = load i64, ptr %766, align 8
  %768 = inttoptr i64 %767 to ptr
  %769 = getelementptr i8, ptr %768, i64 16
  %770 = load i8, ptr %769, align 1
  %771 = and i8 %770, 1
  %772 = icmp eq i8 %771, 0
  br i1 %772, label %bb_inst_1918, label %bb_inst_1037

bb_inst_1037:                                     ; preds = %bb_inst_1025
  %773 = call i64 @_bpf_helper_ext_0044(i64 %3, i64 4294967256, i64 %r3.9, i64 %r4.4, i64 %r5.5)
  %774 = and i64 %773, 4294967295
  %.not2905 = icmp eq i64 %774, 0
  br i1 %.not2905, label %bb_inst_1044, label %bb_inst_942

bb_inst_1044:                                     ; preds = %bb_inst_1037
  %775 = load i64, ptr %0, align 4
  %776 = load i64, ptr %4, align 4
  %777 = add i64 %775, 14
  %778 = icmp ugt i64 %777, %776
  %779 = add i64 %775, 54
  %780 = icmp ugt i64 %779, %776
  %or.cond2960 = or i1 %778, %780
  br i1 %or.cond2960, label %bb_inst_942, label %bb_inst_1053

bb_inst_1053:                                     ; preds = %bb_inst_1044
  %781 = add i64 %775, 40
  %782 = inttoptr i64 %744 to ptr
  %783 = getelementptr i8, ptr %782, i64 5
  %784 = load i8, ptr %783, align 1
  %785 = inttoptr i64 %775 to ptr
  %786 = getelementptr i8, ptr %785, i64 5
  store i8 %784, ptr %786, align 1
  %787 = getelementptr i8, ptr %782, i64 4
  %788 = load i8, ptr %787, align 1
  %789 = getelementptr i8, ptr %785, i64 4
  store i8 %788, ptr %789, align 1
  %790 = getelementptr i8, ptr %782, i64 3
  %791 = load i8, ptr %790, align 1
  %792 = getelementptr i8, ptr %785, i64 3
  store i8 %791, ptr %792, align 1
  %793 = getelementptr i8, ptr %782, i64 2
  %794 = load i8, ptr %793, align 1
  %795 = getelementptr i8, ptr %785, i64 2
  store i8 %794, ptr %795, align 1
  %796 = getelementptr i8, ptr %782, i64 1
  %797 = load i8, ptr %796, align 1
  %798 = getelementptr i8, ptr %785, i64 1
  store i8 %797, ptr %798, align 1
  %799 = load i8, ptr %782, align 1
  store i8 %799, ptr %785, align 1
  %800 = inttoptr i64 %781 to ptr
  %801 = getelementptr i8, ptr %800, i64 2
  %802 = load i8, ptr %801, align 1
  %803 = getelementptr i8, ptr %785, i64 8
  store i8 %802, ptr %803, align 1
  %804 = getelementptr i8, ptr %800, i64 3
  %805 = load i8, ptr %804, align 1
  %806 = getelementptr i8, ptr %785, i64 9
  store i8 %805, ptr %806, align 1
  %807 = load i8, ptr %800, align 1
  %808 = getelementptr i8, ptr %785, i64 6
  store i8 %807, ptr %808, align 1
  %809 = getelementptr i8, ptr %800, i64 1
  %810 = load i8, ptr %809, align 1
  %811 = getelementptr i8, ptr %785, i64 7
  store i8 %810, ptr %811, align 1
  %812 = getelementptr i8, ptr %800, i64 4
  %813 = load i8, ptr %812, align 1
  %814 = getelementptr i8, ptr %785, i64 10
  store i8 %813, ptr %814, align 1
  %815 = getelementptr i8, ptr %800, i64 5
  %816 = load i8, ptr %815, align 1
  %817 = getelementptr i8, ptr %785, i64 11
  store i8 %816, ptr %817, align 1
  %818 = getelementptr i8, ptr %785, i64 12
  store i8 -122, ptr %818, align 1
  %819 = getelementptr i8, ptr %785, i64 13
  store i8 -35, ptr %819, align 1
  %820 = load i16, ptr %19, align 8
  %821 = zext i16 %820 to i32
  %822 = load i32, ptr %21, align 8
  %823 = xor i32 %822, %821
  %824 = load i8, ptr %32, align 1
  %825 = getelementptr i8, ptr %785, i64 20
  store i16 16388, ptr %825, align 2
  %826 = getelementptr i8, ptr %785, i64 22
  store i32 1, ptr %826, align 4
  %827 = getelementptr i8, ptr %785, i64 26
  store i32 0, ptr %827, align 4
  %828 = getelementptr i8, ptr %785, i64 30
  store i32 0, ptr %828, align 4
  %829 = getelementptr i8, ptr %785, i64 16
  store i8 0, ptr %829, align 1
  %830 = getelementptr i8, ptr %785, i64 17
  store i8 0, ptr %830, align 1
  %831 = load i64, ptr %43, align 8
  %832 = trunc i64 %831 to i16
  %833 = getelementptr i8, ptr %785, i64 18
  store i16 %832, ptr %833, align 2
  br label %bb_inst_1799

bb_inst_1107:                                     ; preds = %bb_inst_665
  %834 = add i64 %528, 17
  %835 = icmp ugt i64 %834, %5
  br i1 %835, label %bb_inst_1221.sink.split, label %bb_inst_1111

bb_inst_1111:                                     ; preds = %bb_inst_675, %bb_inst_1107
  %r7.0 = phi i64 [ %529, %bb_inst_1107 ], [ %541, %bb_inst_675 ]
  %836 = inttoptr i64 %r7.0 to ptr
  %837 = load i8, ptr %836, align 1
  %838 = zext i8 %837 to i64
  %839 = lshr i64 %838, 6
  switch i64 %839, label %bb_inst_1221.sink.split [
    i64 3, label %bb_inst_1160
    i64 2, label %bb_inst_1171
    i64 1, label %bb_inst_1117
  ]

bb_inst_1117:                                     ; preds = %bb_inst_1111
  %840 = shl nuw nsw i64 %838, 10
  %841 = and i64 %840, 64512
  %842 = getelementptr i8, ptr %836, i64 1
  %843 = load i8, ptr %842, align 1
  %844 = zext i8 %843 to i64
  %845 = shl nuw nsw i64 %844, 2
  %846 = or i64 %845, %841
  %847 = getelementptr i8, ptr %836, i64 2
  %848 = load i8, ptr %847, align 1
  %849 = lshr i8 %848, 6
  br label %bb_inst_1178

bb_inst_1126:                                     ; preds = %bb_inst_699
  %850 = add i64 %552, 17
  %851 = icmp ugt i64 %850, %5
  br i1 %851, label %bb_inst_718.sink.split, label %bb_inst_1130

bb_inst_1130:                                     ; preds = %bb_inst_709, %bb_inst_1126
  %r7.1 = phi i64 [ %553, %bb_inst_1126 ], [ %565, %bb_inst_709 ]
  %852 = inttoptr i64 %r7.1 to ptr
  %853 = load i8, ptr %852, align 1
  %854 = zext i8 %853 to i64
  %855 = lshr i64 %854, 6
  switch i64 %855, label %bb_inst_718.sink.split [
    i64 3, label %bb_inst_2048
    i64 2, label %bb_inst_2059
    i64 1, label %bb_inst_1136
  ]

bb_inst_1136:                                     ; preds = %bb_inst_1130
  %856 = shl nuw nsw i64 %854, 10
  %857 = and i64 %856, 64512
  %858 = getelementptr i8, ptr %852, i64 1
  %859 = load i8, ptr %858, align 1
  %860 = zext i8 %859 to i64
  %861 = shl nuw nsw i64 %860, 2
  %862 = or i64 %861, %857
  %863 = getelementptr i8, ptr %852, i64 2
  %864 = load i8, ptr %863, align 1
  %865 = lshr i8 %864, 6
  br label %bb_inst_2066

bb_inst_1145:                                     ; preds = %bb_inst_673
  %866 = inttoptr i64 %523 to ptr
  %867 = getelementptr i8, ptr %866, i64 8
  %868 = load i64, ptr %867, align 4
  %869 = add i64 %868, 1
  store i64 %869, ptr %867, align 4
  %870 = load i32, ptr %334, align 4
  %871 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 %870, ptr %871, align 8
  %872 = add i64 %2, -16
  %873 = shl i64 18, 32
  %874 = call i64 @_bpf_helper_ext_0001(i64 %873, i64 %872, i64 %r3.4, i64 %r4.0, i64 %r5.2)
  %875 = icmp eq i64 %874, 0
  br i1 %875, label %bb_inst_1221, label %bb_inst_1221.sink.split

bb_inst_1160:                                     ; preds = %bb_inst_1111
  %876 = getelementptr i8, ptr %836, i64 1
  %877 = load i8, ptr %876, align 1
  %878 = zext i8 %877 to i64
  %879 = shl nuw nsw i64 %878, 24
  %880 = getelementptr i8, ptr %836, i64 2
  %881 = load i8, ptr %880, align 1
  %882 = zext i8 %881 to i64
  %883 = shl nuw nsw i64 %882, 16
  %884 = or i64 %883, %879
  %885 = getelementptr i8, ptr %836, i64 3
  %886 = load i8, ptr %885, align 1
  %887 = zext i8 %886 to i64
  %888 = shl nuw nsw i64 %887, 8
  %889 = or i64 %884, %888
  %890 = getelementptr i8, ptr %836, i64 4
  %891 = load i8, ptr %890, align 1
  br label %bb_inst_1178

bb_inst_1171:                                     ; preds = %bb_inst_1111
  %892 = getelementptr i8, ptr %836, i64 1
  %893 = load i8, ptr %892, align 1
  %894 = zext i8 %893 to i64
  %895 = shl nuw nsw i64 %894, 16
  %896 = getelementptr i8, ptr %836, i64 2
  %897 = load i8, ptr %896, align 1
  %898 = zext i8 %897 to i64
  %899 = shl nuw nsw i64 %898, 8
  %900 = or i64 %899, %895
  %901 = getelementptr i8, ptr %836, i64 3
  %902 = load i8, ptr %901, align 1
  br label %bb_inst_1178

bb_inst_1178:                                     ; preds = %bb_inst_1171, %bb_inst_1160, %bb_inst_1117
  %r2.6.in = phi i8 [ %891, %bb_inst_1160 ], [ %902, %bb_inst_1171 ], [ %849, %bb_inst_1117 ]
  %r9.1 = phi i64 [ %889, %bb_inst_1160 ], [ %900, %bb_inst_1171 ], [ %846, %bb_inst_1117 ]
  %r1.3 = phi i64 [ 72, %bb_inst_1160 ], [ 64, %bb_inst_1171 ], [ 56, %bb_inst_1117 ]
  %r2.6 = zext i8 %r2.6.in to i64
  %903 = or i64 %r9.1, %r2.6
  %904 = shl i64 %903, 32
  %905 = ashr exact i64 %904, 32
  %906 = icmp slt i64 %904, 4294967296
  br i1 %906, label %bb_inst_1221.sink.split, label %bb_inst_1185

bb_inst_1185:                                     ; preds = %bb_inst_1178
  %907 = add i64 %r1.3, %523
  %908 = inttoptr i64 %907 to ptr
  %909 = load i64, ptr %908, align 4
  %910 = add i64 %909, 1
  store i64 %910, ptr %908, align 4
  %911 = trunc i64 %903 to i32
  %912 = getelementptr inbounds i8, ptr %stackEnd, i64 -20
  store i32 %911, ptr %912, align 4
  %913 = add i64 %2, -20
  %914 = shl i64 16, 32
  %915 = call i64 @_bpf_helper_ext_0001(i64 %914, i64 %913, i64 1, i64 %r4.0, i64 %r5.2)
  %916 = icmp eq i64 %915, 0
  br i1 %916, label %bb_inst_1212, label %bb_inst_1197

bb_inst_1197:                                     ; preds = %bb_inst_1185
  %917 = inttoptr i64 %915 to ptr
  %918 = load i32, ptr %917, align 4
  store i32 %918, ptr %912, align 4
  %919 = icmp eq i32 %918, 0
  br i1 %919, label %bb_inst_1212, label %bb_inst_1200

bb_inst_1200:                                     ; preds = %bb_inst_1197
  store i32 %918, ptr %96, align 8
  %920 = shl i64 9, 32
  %921 = call i64 @_bpf_helper_ext_0001(i64 %920, i64 %913, i64 1, i64 %r4.0, i64 %r5.2)
  %922 = getelementptr inbounds i8, ptr %stackEnd, i64 -168
  store i64 %921, ptr %922, align 8
  %.not2957 = icmp eq i64 %921, 0
  br i1 %.not2957, label %bb_inst_1208, label %bb_inst_2019

bb_inst_1208:                                     ; preds = %bb_inst_1200
  %923 = inttoptr i64 %523 to ptr
  %924 = getelementptr i8, ptr %923, i64 40
  %925 = load i64, ptr %924, align 4
  %926 = add i64 %925, 1
  store i64 %926, ptr %924, align 4
  br label %bb_inst_942

bb_inst_1212:                                     ; preds = %bb_inst_1197, %bb_inst_1185
  %927 = inttoptr i64 %523 to ptr
  %928 = getelementptr i8, ptr %927, i64 24
  store i64 %905, ptr %928, align 4
  %929 = getelementptr i8, ptr %927, i64 16
  %930 = load i64, ptr %929, align 4
  %931 = add i64 %930, 1
  store i64 %931, ptr %929, align 4
  br label %bb_inst_1221.sink.split

bb_inst_1221.sink.split:                          ; preds = %bb_inst_656, %bb_inst_670, %bb_inst_675, %bb_inst_1107, %bb_inst_1178, %bb_inst_1212, %bb_inst_1111, %bb_inst_1145
  %.sink3136 = phi i64 [ %874, %bb_inst_1145 ], [ %523, %bb_inst_1111 ], [ %523, %bb_inst_1212 ], [ %523, %bb_inst_1178 ], [ %523, %bb_inst_1107 ], [ %523, %bb_inst_675 ], [ %523, %bb_inst_670 ], [ %523, %bb_inst_656 ]
  %932 = inttoptr i64 %.sink3136 to ptr
  %933 = load i64, ptr %932, align 4
  %934 = add i64 %933, 1
  store i64 %934, ptr %932, align 4
  br label %bb_inst_1221

bb_inst_1221:                                     ; preds = %bb_inst_1221.sink.split, %bb_inst_1145
  %935 = load i64, ptr %519, align 8
  %936 = load i64, ptr %316, align 8
  br label %bb_inst_1223

bb_inst_1223:                                     ; preds = %bb_inst_417, %bb_inst_425, %bb_inst_1221, %bb_inst_401
  %r2.7 = phi i64 [ %r8.0, %bb_inst_401 ], [ %936, %bb_inst_1221 ], [ %368, %bb_inst_425 ], [ %368, %bb_inst_417 ]
  %r3.10 = phi i64 [ %r3.4, %bb_inst_401 ], [ %935, %bb_inst_1221 ], [ %r3.4, %bb_inst_425 ], [ %r3.4, %bb_inst_417 ]
  %937 = load i16, ptr %97, align 8
  %938 = zext i16 %937 to i64
  %939 = getelementptr inbounds i8, ptr %stackEnd, i64 -192
  store i64 %938, ptr %939, align 8
  %940 = getelementptr inbounds i8, ptr %stackEnd, i64 -28
  %941 = load i8, ptr %940, align 4
  %942 = and i8 %941, 2
  %.not2929 = icmp eq i8 %942, 0
  br i1 %.not2929, label %bb_inst_1228, label %bb_inst_1259

bb_inst_1228:                                     ; preds = %bb_inst_1223
  %943 = inttoptr i64 %r2.7 to ptr
  %944 = load i32, ptr %943, align 4
  %945 = and i32 %944, 2
  %.not2930 = icmp eq i32 %945, 0
  br i1 %.not2930, label %bb_inst_1231, label %bb_inst_1259

bb_inst_1231:                                     ; preds = %bb_inst_1228
  %946 = add i64 %2, -72
  %947 = call i64 @_bpf_helper_ext_0001(i64 %r3.10, i64 %946, i64 %r3.10, i64 %r4.0, i64 %r5.2)
  %948 = icmp eq i64 %947, 0
  br i1 %948, label %bb_inst_1259, label %bb_inst_1238

bb_inst_1238:                                     ; preds = %bb_inst_1231
  %949 = load i8, ptr %110, align 4
  %.not2931 = icmp eq i8 %949, 17
  br i1 %.not2931, label %bb_inst_1240, label %bb_inst_1238.bb_inst_1248_crit_edge

bb_inst_1238.bb_inst_1248_crit_edge:              ; preds = %bb_inst_1238
  %.pre3054 = inttoptr i64 %947 to ptr
  br label %bb_inst_1248

bb_inst_1240:                                     ; preds = %bb_inst_1238
  %950 = call i64 @_bpf_helper_ext_0005(i64 17, i64 %946, i64 %r3.10, i64 %r4.0, i64 %r5.2)
  %951 = inttoptr i64 %947 to ptr
  %952 = getelementptr i8, ptr %951, i64 8
  %953 = load i64, ptr %952, align 4
  %954 = sub i64 %950, %953
  %955 = icmp ugt i64 %954, 30000000000
  br i1 %955, label %bb_inst_1259, label %bb_inst_1247

bb_inst_1247:                                     ; preds = %bb_inst_1240
  store i64 %950, ptr %952, align 4
  br label %bb_inst_1248

bb_inst_1248:                                     ; preds = %bb_inst_1238.bb_inst_1248_crit_edge, %bb_inst_1247
  %.pre-phi3055 = phi ptr [ %.pre3054, %bb_inst_1238.bb_inst_1248_crit_edge ], [ %951, %bb_inst_1247 ]
  %956 = load i32, ptr %.pre-phi3055, align 4
  store i32 %956, ptr %96, align 8
  %957 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 %956, ptr %957, align 8
  %958 = add i64 %2, -16
  %959 = shl i64 9, 32
  %960 = call i64 @_bpf_helper_ext_0001(i64 %959, i64 %958, i64 %r3.10, i64 %r4.0, i64 %r5.2)
  %961 = getelementptr inbounds i8, ptr %stackEnd, i64 -168
  store i64 %960, ptr %961, align 8
  %.not2932 = icmp eq i64 %960, 0
  br i1 %.not2932, label %bb_inst_1259, label %bb_inst_1688

bb_inst_1259:                                     ; preds = %bb_inst_1231, %bb_inst_1240, %bb_inst_1248, %bb_inst_1228, %bb_inst_1223
  %962 = load i8, ptr %110, align 4
  %.not2933 = icmp eq i8 %962, 6
  br i1 %.not2933, label %bb_inst_1261, label %bb_inst_1281

bb_inst_1261:                                     ; preds = %bb_inst_1259
  %963 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 513, ptr %963, align 8
  %964 = add i64 %2, -16
  %965 = shl i64 13, 32
  %966 = call i64 @_bpf_helper_ext_0001(i64 %965, i64 %964, i64 %r3.10, i64 %r4.0, i64 %r5.2)
  %967 = icmp eq i64 %966, 0
  br i1 %967, label %bb_inst_942, label %bb_inst_1270

bb_inst_1270:                                     ; preds = %bb_inst_1261
  %968 = load i8, ptr %940, align 4
  %969 = shl i8 %968, 2
  %970 = and i8 %969, 8
  %971 = xor i8 %970, 8
  %972 = zext i8 %971 to i64
  %973 = add i64 %966, %972
  %974 = inttoptr i64 %973 to ptr
  %975 = load i64, ptr %974, align 4
  %976 = add i64 %975, 1
  store i64 %976, ptr %974, align 4
  br label %bb_inst_1281

bb_inst_1281:                                     ; preds = %bb_inst_1270, %bb_inst_1259
  %977 = getelementptr inbounds i8, ptr %stackEnd, i64 -152
  store i64 %r3.10, ptr %977, align 8
  %978 = getelementptr inbounds i8, ptr %stackEnd, i64 -8
  %979 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  %980 = getelementptr inbounds i8, ptr %stackEnd, i64 -120
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %979, i8 0, i64 16, i1 false)
  store i32 514, ptr %980, align 8
  %981 = add i64 %2, -120
  %982 = shl i64 13, 32
  %983 = call i64 @_bpf_helper_ext_0001(i64 %982, i64 %981, i64 %r3.10, i64 %r4.0, i64 %r5.2)
  %984 = icmp eq i64 %983, 0
  br i1 %984, label %bb_inst_1311, label %bb_inst_1295

bb_inst_1295:                                     ; preds = %bb_inst_1281
  %985 = call i64 @_bpf_helper_ext_0005(i64 %982, i64 %981, i64 %r3.10, i64 %r4.0, i64 %r5.2)
  %986 = inttoptr i64 %983 to ptr
  %987 = getelementptr i8, ptr %986, i64 8
  %988 = load i64, ptr %987, align 4
  %989 = sub i64 %985, %988
  %990 = icmp ult i64 %989, 1000000001
  br i1 %990, label %bb_inst_1306, label %bb_inst_1302

bb_inst_1302:                                     ; preds = %bb_inst_1295
  store i64 %985, ptr %987, align 4
  store i64 1, ptr %986, align 4
  br label %bb_inst_1310

bb_inst_1306:                                     ; preds = %bb_inst_1295
  %991 = load i64, ptr %986, align 4
  %992 = add i64 %991, 1
  store i64 %992, ptr %986, align 4
  %993 = icmp ugt i64 %992, 125000
  br i1 %993, label %bb_inst_1311, label %bb_inst_1310

bb_inst_1310:                                     ; preds = %bb_inst_1306, %bb_inst_1302
  br label %bb_inst_1311

bb_inst_1311:                                     ; preds = %bb_inst_1310, %bb_inst_1306, %bb_inst_1281
  %r7.2 = phi i64 [ 0, %bb_inst_1281 ], [ %985, %bb_inst_1306 ], [ %985, %bb_inst_1310 ]
  %r9.2 = phi i64 [ 1, %bb_inst_1281 ], [ 1, %bb_inst_1306 ], [ 0, %bb_inst_1310 ]
  %994 = getelementptr inbounds i8, ptr %stackEnd, i64 -184
  store i64 %r9.2, ptr %994, align 8
  %995 = load i64, ptr %316, align 8
  %996 = inttoptr i64 %995 to ptr
  %997 = load i32, ptr %996, align 4
  %998 = and i32 %997, 8
  %999 = getelementptr inbounds i8, ptr %stackEnd, i64 -200
  store i64 %r7.2, ptr %999, align 8
  %.not2934 = icmp eq i32 %998, 0
  br i1 %.not2934, label %bb_inst_1317, label %bb_inst_1326

bb_inst_1317:                                     ; preds = %bb_inst_1311
  %1000 = getelementptr inbounds i8, ptr %stackEnd, i64 -60
  %1001 = load i8, ptr %1000, align 4
  %1002 = zext i8 %1001 to i64
  %1003 = getelementptr inbounds i8, ptr %stackEnd, i64 -59
  %1004 = load i8, ptr %1003, align 1
  %1005 = zext i8 %1004 to i64
  %1006 = getelementptr inbounds i8, ptr %stackEnd, i64 -58
  %1007 = load i8, ptr %1006, align 2
  %1008 = zext i8 %1007 to i64
  %1009 = getelementptr inbounds i8, ptr %stackEnd, i64 -57
  %1010 = load i8, ptr %1009, align 1
  %1011 = zext i8 %1010 to i64
  %1012 = load i32, ptr %100, align 8
  %1013 = zext i32 %1012 to i64
  %1014 = getelementptr inbounds i8, ptr %stackEnd, i64 -68
  %1015 = load i32, ptr %1014, align 4
  %1016 = zext i32 %1015 to i64
  %1017 = load i32, ptr %101, align 8
  %1018 = zext i32 %1017 to i64
  br label %bb_inst_1340

bb_inst_1326:                                     ; preds = %bb_inst_1311
  %1019 = load i64, ptr %296, align 8
  %1020 = inttoptr i64 %1019 to ptr
  %1021 = getelementptr i8, ptr %1020, i64 2
  %1022 = load i16, ptr %1021, align 2
  store i16 %1022, ptr %97, align 8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(16) %101, i8 0, i64 16, i1 false)
  br label %bb_inst_1340

bb_inst_1340:                                     ; preds = %bb_inst_1326, %bb_inst_1317
  %.sink = phi i64 [ %1002, %bb_inst_1317 ], [ 0, %bb_inst_1326 ]
  %r2.8 = phi i64 [ %1016, %bb_inst_1317 ], [ 0, %bb_inst_1326 ]
  %r4.5 = phi i64 [ %1013, %bb_inst_1317 ], [ 0, %bb_inst_1326 ]
  %r8.5 = phi i64 [ %1011, %bb_inst_1317 ], [ 0, %bb_inst_1326 ]
  %r9.3 = phi i64 [ %1005, %bb_inst_1317 ], [ 0, %bb_inst_1326 ]
  %r1.4 = phi i64 [ %1018, %bb_inst_1317 ], [ 0, %bb_inst_1326 ]
  %r0.6 = phi i64 [ %1008, %bb_inst_1317 ], [ 0, %bb_inst_1326 ]
  %1023 = getelementptr inbounds i8, ptr %stackEnd, i64 -176
  store i64 %.sink, ptr %1023, align 8
  %1024 = sub nsw i64 %r1.4, %r4.5
  %1025 = add nsw i64 %r4.5, -559038209
  %1026 = lshr i64 %1025, 28
  %1027 = and i64 %1026, 15
  %1028 = shl nsw i64 %1025, 4
  %1029 = or i64 %1027, %1028
  %1030 = xor i64 %1029, %1024
  %1031 = lshr i64 %1030, 26
  %1032 = and i64 %1031, 63
  %1033 = shl nsw i64 %1030, 6
  %1034 = or i64 %1032, %1033
  %1035 = add nsw i64 %r2.8, -559038209
  %1036 = sub nsw i64 %1035, %1030
  %1037 = xor i64 %1034, %1036
  %1038 = shl nuw nsw i64 %r8.5, 24
  %1039 = shl nuw nsw i64 %r0.6, 16
  %1040 = load i32, ptr %97, align 8
  %1041 = zext i32 %1040 to i64
  %1042 = add nsw i64 %1041, -525483785
  store i64 %1042, ptr %296, align 8
  %1043 = lshr i64 %1042, 18
  %1044 = and i64 %1043, 16383
  %.neg3032 = mul nsw i64 %1042, -16384
  %1045 = xor i64 %1042, -525483785
  %.neg2992 = add nsw i64 %1045, %.neg3032
  %1046 = sub nsw i64 %.neg2992, %1044
  %1047 = add nsw i64 %1025, %1035
  %1048 = shl nuw nsw i64 %r9.3, 8
  %1049 = lshr i64 %1037, 24
  %1050 = and i64 %1049, 255
  %1051 = shl i64 %1037, 8
  %1052 = or i64 %1050, %1051
  %1053 = add nsw i64 %1030, %1047
  %1054 = sub i64 %1047, %1037
  %1055 = xor i64 %1052, %1054
  %1056 = getelementptr inbounds i8, ptr %stackEnd, i64 -168
  store i64 %1046, ptr %1056, align 8
  %1057 = lshr i64 %1046, 21
  %1058 = and i64 %1057, 2047
  %.neg3040 = mul nsw i64 %1046, -2048
  %1059 = lshr i64 %1055, 16
  %1060 = and i64 %1059, 65535
  %1061 = shl i64 %1055, 16
  %1062 = or i64 %1060, %1061
  %1063 = add i64 %1037, %1053
  %1064 = sub i64 %1053, %1055
  %1065 = xor i64 %1062, %1064
  %1066 = lshr i64 %1065, 13
  %1067 = and i64 %1066, 524287
  %1068 = shl i64 %1065, 19
  %1069 = or i64 %1067, %1068
  %1070 = add i64 %1055, %1063
  %1071 = sub i64 %1063, %1065
  %1072 = xor i64 %1069, %1071
  %1073 = add i64 %1065, %1070
  %1074 = add i64 %1072, %1073
  %1075 = lshr i64 %1074, 18
  %1076 = and i64 %1075, 16383
  %.neg3033 = mul i64 %1074, -16384
  %1077 = lshr i64 %1072, 28
  %1078 = and i64 %1077, 15
  %1079 = sub i64 %1070, %1072
  %1080 = shl i64 %1072, 4
  %1081 = or i64 %1078, %1080
  %1082 = or i64 %1048, %1038
  %1083 = or i64 %1082, %1039
  %1084 = or i64 %1083, %.sink
  %1085 = add i64 %1084, %1073
  %1086 = xor i64 %1074, %1079
  %1087 = xor i64 %1086, %1081
  %.neg2995 = sub i64 %.neg3033, %1076
  %1088 = add i64 %.neg2995, %1087
  %1089 = lshr i64 %1088, 21
  %1090 = and i64 %1089, 2047
  %.neg3034 = mul i64 %1088, -2048
  %1091 = xor i64 %1088, %1085
  %.neg2998 = add i64 %1091, %.neg3034
  %1092 = sub i64 %.neg2998, %1090
  %1093 = lshr i64 %1092, 7
  %1094 = and i64 %1093, 33554431
  %.neg3035 = mul i64 %1092, -33554432
  %1095 = xor i64 %1092, %1074
  %.neg3001 = add i64 %1095, %.neg3035
  %1096 = sub i64 %.neg3001, %1094
  %1097 = lshr i64 %1096, 16
  %1098 = and i64 %1097, 65535
  %.neg3036 = mul i64 %1096, -65536
  %1099 = xor i64 %1096, %1088
  %.neg3004 = add i64 %1099, %.neg3036
  %1100 = sub i64 %.neg3004, %1098
  %1101 = lshr i64 %1100, 28
  %1102 = and i64 %1101, 15
  %.neg3037 = mul i64 %1100, -16
  %1103 = xor i64 %1100, %1092
  %.neg3007 = add i64 %1103, %.neg3037
  %1104 = sub i64 %.neg3007, %1102
  %1105 = lshr i64 %1104, 18
  %1106 = and i64 %1105, 16383
  %.neg3038 = mul i64 %1104, -16384
  %1107 = xor i64 %1104, %1096
  %.neg3010 = add i64 %1107, %.neg3038
  %1108 = sub i64 %.neg3010, %1106
  %1109 = lshr i64 %1108, 8
  %1110 = and i64 %1109, 16777215
  %.neg3039 = mul i64 %1108, -16777216
  %1111 = xor i64 %1108, %1100
  %.neg3013 = add i64 %.neg3039, -525483785
  %1112 = add i64 %.neg3013, %1111
  %1113 = sub i64 %1112, %1110
  %1114 = xor i64 %1113, %1046
  %.neg3016 = sub nsw i64 %.neg3040, %1058
  %1115 = add i64 %.neg3016, %1114
  %1116 = lshr i64 %1115, 7
  %1117 = and i64 %1116, 33554431
  %.neg3041 = mul i64 %1115, -33554432
  %1118 = xor i64 %1115, %1042
  %.neg3019 = add i64 %1118, %.neg3041
  %1119 = sub i64 %.neg3019, %1117
  %1120 = lshr i64 %1119, 16
  %1121 = and i64 %1120, 65535
  %.neg3042 = mul i64 %1119, -65536
  %1122 = xor i64 %1119, %1046
  %.neg3022 = add i64 %1122, %.neg3042
  %1123 = sub i64 %.neg3022, %1121
  %1124 = lshr i64 %1123, 28
  %1125 = and i64 %1124, 15
  %.neg3043 = mul i64 %1123, -16
  %1126 = xor i64 %1123, %1115
  %.neg3025 = add i64 %1126, %.neg3043
  %1127 = sub i64 %.neg3025, %1125
  %1128 = lshr i64 %1127, 18
  %1129 = and i64 %1128, 16383
  %1130 = shl i64 %1127, 14
  %1131 = or i64 %1129, %1130
  %1132 = xor i64 %1127, %1119
  %1133 = sub i64 %1132, %1131
  %1134 = lshr i64 %1133, 8
  %1135 = and i64 %1134, 16777215
  %1136 = shl i64 %1133, 24
  %1137 = or i64 %1135, %1136
  %1138 = xor i64 %1133, %1123
  %1139 = sub i64 %1138, %1137
  %.lhs.trunc = trunc i64 %1139 to i32
  %1140 = urem i32 %.lhs.trunc, 65537
  %1141 = load i64, ptr %316, align 8
  %1142 = inttoptr i64 %1141 to ptr
  %1143 = getelementptr i8, ptr %1142, i64 4
  %1144 = load i32, ptr %1143, align 4
  %1145 = mul i32 %1144, 65537
  %1146 = add i32 %1140, %1145
  %1147 = getelementptr inbounds i8, ptr %stackEnd, i64 -20
  store i32 %1146, ptr %1147, align 4
  %1148 = add i64 %2, -20
  %1149 = shl i64 7, 32
  %1150 = call i64 @_bpf_helper_ext_0001(i64 %1149, i64 %1148, i64 %1137, i64 %1123, i64 %1131)
  %1151 = icmp eq i64 %1150, 0
  br i1 %1151, label %bb_inst_942, label %bb_inst_1588

bb_inst_1588:                                     ; preds = %bb_inst_1340
  %1152 = inttoptr i64 %1150 to ptr
  %1153 = load i32, ptr %1152, align 4
  store i32 %1153, ptr %1147, align 4
  %1154 = load i64, ptr %977, align 8
  %1155 = load i64, ptr %994, align 8
  %.not2935 = icmp eq i32 %1153, 0
  br i1 %.not2935, label %bb_inst_1593, label %bb_inst_1605

bb_inst_1593:                                     ; preds = %bb_inst_1588
  store i32 521, ptr %980, align 8
  %1156 = shl i64 13, 32
  %1157 = call i64 @_bpf_helper_ext_0001(i64 %1156, i64 %981, i64 %1137, i64 %1123, i64 %1131)
  %1158 = icmp eq i64 %1157, 0
  br i1 %1158, label %bb_inst_1604, label %bb_inst_1601

bb_inst_1601:                                     ; preds = %bb_inst_1593
  %1159 = inttoptr i64 %1157 to ptr
  %1160 = getelementptr i8, ptr %1159, i64 8
  %1161 = load i64, ptr %1160, align 4
  %1162 = add i64 %1161, 1
  store i64 %1162, ptr %1160, align 4
  br label %bb_inst_1604

bb_inst_1604:                                     ; preds = %bb_inst_1601, %bb_inst_1593
  %1163 = load i32, ptr %1147, align 4
  br label %bb_inst_1605

bb_inst_1605:                                     ; preds = %bb_inst_1604, %bb_inst_1588
  %r1.5.in = phi i32 [ %1153, %bb_inst_1588 ], [ %1163, %bb_inst_1604 ]
  store i32 %r1.5.in, ptr %96, align 8
  %1164 = shl i64 9, 32
  %1165 = call i64 @_bpf_helper_ext_0001(i64 %1164, i64 %1148, i64 %1137, i64 %1123, i64 %1131)
  %.not2936 = icmp eq i64 %1165, 0
  br i1 %.not2936, label %bb_inst_1613, label %bb_inst_1622

bb_inst_1613:                                     ; preds = %bb_inst_1605
  store i32 521, ptr %980, align 8
  %1166 = shl i64 13, 32
  %1167 = call i64 @_bpf_helper_ext_0001(i64 %1166, i64 %981, i64 %1137, i64 %1123, i64 %1131)
  %1168 = icmp eq i64 %1167, 0
  br i1 %1168, label %bb_inst_942, label %bb_inst_938

bb_inst_1622:                                     ; preds = %bb_inst_1605
  %1169 = icmp eq i64 %1154, 0
  br i1 %1169, label %bb_inst_1642, label %bb_inst_1623

bb_inst_1623:                                     ; preds = %bb_inst_1622
  %1170 = load i64, ptr %316, align 8
  %1171 = inttoptr i64 %1170 to ptr
  %1172 = load i32, ptr %1171, align 4
  %1173 = lshr i32 %1172, 1
  %1174 = and i32 %1173, 1
  %1175 = zext i32 %1174 to i64
  %1176 = or i64 %1155, %1175
  %.not2937 = icmp eq i64 %1176, 0
  br i1 %.not2937, label %bb_inst_1629, label %bb_inst_1642

bb_inst_1629:                                     ; preds = %bb_inst_1623
  %1177 = load i8, ptr %110, align 4
  %.not2938 = icmp eq i8 %1177, 17
  br i1 %.not2938, label %bb_inst_1631, label %bb_inst_1633

bb_inst_1631:                                     ; preds = %bb_inst_1629
  %1178 = load i64, ptr %999, align 8
  store i64 %1178, ptr %978, align 8
  br label %bb_inst_1633

bb_inst_1633:                                     ; preds = %bb_inst_1631, %bb_inst_1629
  %1179 = load i32, ptr %1147, align 4
  store i32 %1179, ptr %979, align 8
  %1180 = add i64 %2, -72
  %1181 = add i64 %2, -16
  %1182 = call i64 @_bpf_helper_ext_0002(i64 %1154, i64 %1180, i64 %1181, i64 0, i64 %1131)
  br label %bb_inst_1642

bb_inst_1642:                                     ; preds = %bb_inst_1633, %bb_inst_1623, %bb_inst_1622
  %r3.13 = phi i64 [ %1137, %bb_inst_1622 ], [ %1137, %bb_inst_1623 ], [ %1181, %bb_inst_1633 ]
  %r4.6 = phi i64 [ %1123, %bb_inst_1622 ], [ %1123, %bb_inst_1623 ], [ 0, %bb_inst_1633 ]
  store i32 0, ptr %979, align 8
  %1183 = add i64 %2, -16
  %1184 = shl i64 12, 32
  %1185 = call i64 @_bpf_helper_ext_0001(i64 %1184, i64 %1183, i64 %r3.13, i64 %r4.6, i64 %1131)
  %1186 = icmp eq i64 %1185, 0
  br i1 %1186, label %bb_inst_942, label %bb_inst_1650

bb_inst_1650:                                     ; preds = %bb_inst_1642
  %1187 = inttoptr i64 %1185 to ptr
  %1188 = load i32, ptr %1187, align 4
  %1189 = load i32, ptr %104, align 8
  %.not2939 = icmp eq i32 %1188, %1189
  br i1 %.not2939, label %bb_inst_1653, label %bb_inst_1664.thread

bb_inst_1653:                                     ; preds = %bb_inst_1650
  %1190 = getelementptr i8, ptr %1187, i64 4
  %1191 = load i32, ptr %1190, align 4
  %1192 = getelementptr inbounds i8, ptr %stackEnd, i64 -92
  %1193 = load i32, ptr %1192, align 4
  %.not2940 = icmp eq i32 %1191, %1193
  br i1 %.not2940, label %bb_inst_1656, label %bb_inst_1664.thread

bb_inst_1656:                                     ; preds = %bb_inst_1653
  %1194 = getelementptr i8, ptr %1187, i64 8
  %1195 = load i32, ptr %1194, align 4
  %1196 = load i32, ptr %103, align 8
  %.not2941 = icmp eq i32 %1195, %1196
  br i1 %.not2941, label %bb_inst_1664, label %bb_inst_1664.thread

bb_inst_1664.thread:                              ; preds = %bb_inst_1656, %bb_inst_1653, %bb_inst_1650
  %1197 = load i8, ptr %299, align 2
  %1198 = getelementptr i8, ptr %1187, i64 18
  store i8 %1197, ptr %1198, align 1
  br label %bb_inst_1683

bb_inst_1664:                                     ; preds = %bb_inst_1656
  %1199 = getelementptr i8, ptr %1187, i64 12
  %1200 = load i32, ptr %1199, align 4
  %1201 = getelementptr inbounds i8, ptr %stackEnd, i64 -84
  %1202 = load i32, ptr %1201, align 4
  %.not = icmp eq i32 %1200, %1202
  %1203 = load i16, ptr %102, align 8
  %1204 = load i8, ptr %299, align 2
  %1205 = getelementptr i8, ptr %1187, i64 18
  store i8 %1204, ptr %1205, align 1
  br i1 %.not, label %bb_inst_1669, label %bb_inst_1683

bb_inst_1669:                                     ; preds = %bb_inst_1664
  %1206 = getelementptr i8, ptr %1187, i64 16
  %1207 = load i16, ptr %1206, align 2
  %1208 = zext i16 %1207 to i64
  %1209 = icmp ne i16 %1207, %1203
  %1210 = icmp eq i8 %1204, 0
  %or.cond10 = select i1 %1209, i1 true, i1 %1210
  br i1 %or.cond10, label %bb_inst_1683, label %bb_inst_1672

bb_inst_1672:                                     ; preds = %bb_inst_1669
  %1211 = load i32, ptr %96, align 8
  store i32 %1211, ptr %980, align 8
  %1212 = shl i64 11, 32
  %1213 = call i64 @_bpf_helper_ext_0001(i64 %1212, i64 %981, i64 %1208, i64 %r4.6, i64 %1131)
  %1214 = icmp eq i64 %1213, 0
  br i1 %1214, label %bb_inst_942, label %bb_inst_1680

bb_inst_1680:                                     ; preds = %bb_inst_1672
  %1215 = inttoptr i64 %1213 to ptr
  %1216 = load i32, ptr %1215, align 4
  %1217 = add i32 %1216, 1
  store i32 %1217, ptr %1215, align 4
  br label %bb_inst_1683

bb_inst_1683:                                     ; preds = %bb_inst_1664.thread, %bb_inst_1680, %bb_inst_1669, %bb_inst_1664
  %r3.14 = phi i64 [ %r3.13, %bb_inst_1664 ], [ %1208, %bb_inst_1669 ], [ %1208, %bb_inst_1680 ], [ %r3.13, %bb_inst_1664.thread ]
  store i64 %1165, ptr %1056, align 8
  %1218 = load i64, ptr %325, align 8
  %1219 = inttoptr i64 %1218 to ptr
  %1220 = getelementptr i8, ptr %1219, i64 8
  %1221 = load i64, ptr %1220, align 4
  %1222 = add i64 %1221, 1
  store i64 %1222, ptr %1220, align 4
  br label %bb_inst_1688

bb_inst_1688:                                     ; preds = %bb_inst_2178, %bb_inst_1683, %bb_inst_1248
  %r3.15 = phi i64 [ %r3.14, %bb_inst_1683 ], [ %r3.10, %bb_inst_1248 ], [ %r3.24, %bb_inst_2178 ]
  %r4.7 = phi i64 [ %r4.6, %bb_inst_1683 ], [ %r4.0, %bb_inst_1248 ], [ %r4.9, %bb_inst_2178 ]
  %r5.6 = phi i64 [ %1131, %bb_inst_1683 ], [ %r5.2, %bb_inst_1248 ], [ %r5.2, %bb_inst_2178 ]
  %1223 = add i64 %2, -104
  %1224 = shl i64 4, 32
  %1225 = call i64 @_bpf_helper_ext_0001(i64 %1224, i64 %1223, i64 %r3.15, i64 %r4.7, i64 %r5.6)
  %1226 = icmp eq i64 %1225, 0
  br i1 %1226, label %bb_inst_942, label %bb_inst_1696

bb_inst_1696:                                     ; preds = %bb_inst_1688
  %1227 = add i64 %2, -100
  %1228 = shl i64 13, 32
  %1229 = call i64 @_bpf_helper_ext_0001(i64 %1228, i64 %1227, i64 %r3.15, i64 %r4.7, i64 %r5.6)
  %1230 = icmp eq i64 %1229, 0
  br i1 %1230, label %bb_inst_942, label %bb_inst_1702

bb_inst_1702:                                     ; preds = %bb_inst_1696
  %1231 = load i64, ptr %314, align 8
  %trunc2942 = trunc i64 %1231 to i16
  %rev2943 = call i16 @llvm.bswap.i16(i16 %trunc2942)
  %1232 = zext i16 %rev2943 to i64
  %1233 = inttoptr i64 %1229 to ptr
  %1234 = load <2 x i64>, ptr %1233, align 4
  %1235 = insertelement <2 x i64> <i64 1, i64 poison>, i64 %1232, i64 1
  %1236 = add <2 x i64> %1234, %1235
  store <2 x i64> %1236, ptr %1233, align 4
  %1237 = add i64 %2, -32
  %1238 = shl i64 10, 32
  %1239 = call i64 @_bpf_helper_ext_0001(i64 %1238, i64 %1237, i64 %r3.15, i64 %r4.7, i64 %r5.6)
  %1240 = icmp eq i64 %1239, 0
  br i1 %1240, label %bb_inst_942, label %bb_inst_1717

bb_inst_1717:                                     ; preds = %bb_inst_1702
  %1241 = inttoptr i64 %1239 to ptr
  %1242 = load <2 x i64>, ptr %1241, align 4
  %1243 = add <2 x i64> %1242, %1235
  store <2 x i64> %1243, ptr %1241, align 4
  %1244 = getelementptr inbounds i8, ptr %stackEnd, i64 -192
  %1245 = load i64, ptr %1244, align 8
  %1246 = trunc i64 %1245 to i16
  store i16 %1246, ptr %97, align 8
  %1247 = getelementptr inbounds i8, ptr %stackEnd, i64 -168
  %1248 = load i64, ptr %1247, align 8
  %1249 = inttoptr i64 %1248 to ptr
  %1250 = getelementptr i8, ptr %1249, i64 16
  %1251 = load i8, ptr %1250, align 1
  %1252 = and i8 %1251, 1
  %1253 = icmp eq i8 %1252, 0
  br i1 %1253, label %bb_inst_1810, label %bb_inst_1729

bb_inst_1729:                                     ; preds = %bb_inst_1717
  %1254 = call i64 @_bpf_helper_ext_0044(i64 %3, i64 4294967256, i64 %r3.15, i64 %r4.7, i64 %r5.6)
  %1255 = and i64 %1254, 4294967295
  %.not2944 = icmp eq i64 %1255, 0
  br i1 %.not2944, label %bb_inst_1736, label %bb_inst_942

bb_inst_1736:                                     ; preds = %bb_inst_1729
  %1256 = load i64, ptr %0, align 4
  %1257 = load i64, ptr %4, align 4
  %1258 = add i64 %1256, 14
  %1259 = icmp ugt i64 %1258, %1257
  %1260 = add i64 %1256, 54
  %1261 = icmp ugt i64 %1260, %1257
  %or.cond2962 = or i1 %1259, %1261
  br i1 %or.cond2962, label %bb_inst_942, label %bb_inst_1745

bb_inst_1745:                                     ; preds = %bb_inst_1736
  %1262 = add i64 %1256, 40
  %1263 = inttoptr i64 %1225 to ptr
  %1264 = getelementptr i8, ptr %1263, i64 5
  %1265 = load i8, ptr %1264, align 1
  %1266 = inttoptr i64 %1256 to ptr
  %1267 = getelementptr i8, ptr %1266, i64 5
  store i8 %1265, ptr %1267, align 1
  %1268 = getelementptr i8, ptr %1263, i64 4
  %1269 = load i8, ptr %1268, align 1
  %1270 = getelementptr i8, ptr %1266, i64 4
  store i8 %1269, ptr %1270, align 1
  %1271 = getelementptr i8, ptr %1263, i64 3
  %1272 = load i8, ptr %1271, align 1
  %1273 = getelementptr i8, ptr %1266, i64 3
  store i8 %1272, ptr %1273, align 1
  %1274 = getelementptr i8, ptr %1263, i64 2
  %1275 = load i8, ptr %1274, align 1
  %1276 = getelementptr i8, ptr %1266, i64 2
  store i8 %1275, ptr %1276, align 1
  %1277 = getelementptr i8, ptr %1263, i64 1
  %1278 = load i8, ptr %1277, align 1
  %1279 = getelementptr i8, ptr %1266, i64 1
  store i8 %1278, ptr %1279, align 1
  %1280 = load i8, ptr %1263, align 1
  store i8 %1280, ptr %1266, align 1
  %1281 = inttoptr i64 %1262 to ptr
  %1282 = getelementptr i8, ptr %1281, i64 2
  %1283 = load i8, ptr %1282, align 1
  %1284 = getelementptr i8, ptr %1266, i64 8
  store i8 %1283, ptr %1284, align 1
  %1285 = getelementptr i8, ptr %1281, i64 3
  %1286 = load i8, ptr %1285, align 1
  %1287 = getelementptr i8, ptr %1266, i64 9
  store i8 %1286, ptr %1287, align 1
  %1288 = load i8, ptr %1281, align 1
  %1289 = getelementptr i8, ptr %1266, i64 6
  store i8 %1288, ptr %1289, align 1
  %1290 = getelementptr i8, ptr %1281, i64 1
  %1291 = load i8, ptr %1290, align 1
  %1292 = getelementptr i8, ptr %1266, i64 7
  store i8 %1291, ptr %1292, align 1
  %1293 = getelementptr i8, ptr %1281, i64 4
  %1294 = load i8, ptr %1293, align 1
  %1295 = getelementptr i8, ptr %1266, i64 10
  store i8 %1294, ptr %1295, align 1
  %1296 = getelementptr i8, ptr %1281, i64 5
  %1297 = load i8, ptr %1296, align 1
  %1298 = getelementptr i8, ptr %1266, i64 11
  store i8 %1297, ptr %1298, align 1
  %1299 = getelementptr i8, ptr %1266, i64 12
  store i8 -122, ptr %1299, align 1
  %1300 = getelementptr i8, ptr %1266, i64 13
  store i8 -35, ptr %1300, align 1
  %1301 = load i16, ptr %97, align 8
  %1302 = zext i16 %1301 to i32
  %1303 = getelementptr inbounds i8, ptr %stackEnd, i64 -60
  %1304 = load i32, ptr %1303, align 4
  %1305 = xor i32 %1304, %1302
  %1306 = load i8, ptr %116, align 1
  %1307 = getelementptr i8, ptr %1266, i64 22
  store i32 1, ptr %1307, align 4
  %1308 = add i16 %rev2943, 40
  %rev2946 = call i16 @llvm.bswap.i16(i16 %1308)
  %1309 = getelementptr i8, ptr %1266, i64 18
  store i16 %rev2946, ptr %1309, align 2
  %1310 = getelementptr i8, ptr %1266, i64 26
  store i32 0, ptr %1310, align 4
  %1311 = getelementptr i8, ptr %1266, i64 30
  store i32 0, ptr %1311, align 4
  %1312 = getelementptr i8, ptr %1266, i64 16
  store i8 0, ptr %1312, align 1
  %1313 = getelementptr i8, ptr %1266, i64 17
  store i8 0, ptr %1313, align 1
  %1314 = getelementptr i8, ptr %1266, i64 20
  store i16 16425, ptr %1314, align 2
  br label %bb_inst_1799

bb_inst_1799:                                     ; preds = %bb_inst_1745, %bb_inst_1053
  %.sink3127 = phi ptr [ %1266, %bb_inst_1745 ], [ %785, %bb_inst_1053 ]
  %.sink3125 = phi i32 [ %1305, %bb_inst_1745 ], [ %823, %bb_inst_1053 ]
  %.sink3124 = phi i8 [ %1306, %bb_inst_1745 ], [ %824, %bb_inst_1053 ]
  %r3.16.in = phi ptr [ %1247, %bb_inst_1745 ], [ %766, %bb_inst_1053 ]
  %1315 = getelementptr i8, ptr %.sink3127, i64 34
  store i32 %.sink3125, ptr %1315, align 4
  %1316 = shl i8 %.sink3124, 4
  %1317 = getelementptr i8, ptr %.sink3127, i64 15
  store i8 %1316, ptr %1317, align 1
  %1318 = lshr i8 %.sink3124, 4
  %1319 = or i8 %1318, 96
  %1320 = getelementptr i8, ptr %.sink3127, i64 14
  store i8 %1319, ptr %1320, align 1
  %r3.16 = load i64, ptr %r3.16.in, align 4
  %1321 = inttoptr i64 %r3.16 to ptr
  %1322 = getelementptr i8, ptr %1321, i64 12
  %1323 = load i32, ptr %1322, align 4
  %1324 = getelementptr i8, ptr %.sink3127, i64 50
  store i32 %1323, ptr %1324, align 4
  %1325 = getelementptr i8, ptr %1321, i64 8
  %1326 = load i32, ptr %1325, align 4
  %1327 = getelementptr i8, ptr %.sink3127, i64 46
  store i32 %1326, ptr %1327, align 4
  %1328 = getelementptr i8, ptr %1321, i64 4
  %1329 = load i32, ptr %1328, align 4
  %1330 = getelementptr i8, ptr %.sink3127, i64 42
  store i32 %1329, ptr %1330, align 4
  %1331 = load i32, ptr %1321, align 4
  %1332 = getelementptr i8, ptr %.sink3127, i64 38
  store i32 %1331, ptr %1332, align 4
  br label %bb_inst_942

bb_inst_1810:                                     ; preds = %bb_inst_1717
  %1333 = load i32, ptr %101, align 8
  %1334 = zext i32 %1333 to i64
  store i64 %1334, ptr %314, align 8
  %1335 = call i64 @_bpf_helper_ext_0044(i64 %3, i64 4294967276, i64 %r3.15, i64 %r4.7, i64 %r5.6)
  %1336 = and i64 %1335, 4294967295
  %.not2947 = icmp eq i64 %1336, 0
  br i1 %.not2947, label %bb_inst_1819, label %bb_inst_942

bb_inst_1819:                                     ; preds = %bb_inst_1810
  %1337 = load i64, ptr %0, align 4
  %1338 = load i64, ptr %4, align 4
  %1339 = add i64 %1337, 14
  %1340 = icmp ugt i64 %1339, %1338
  %1341 = add i64 %1337, 34
  %1342 = icmp ugt i64 %1341, %1338
  %or.cond2964 = or i1 %1340, %1342
  br i1 %or.cond2964, label %bb_inst_942, label %bb_inst_1828

bb_inst_1828:                                     ; preds = %bb_inst_1819
  %1343 = load i64, ptr %1244, align 8
  %trunc2952 = trunc i64 %1343 to i32
  %1344 = and i32 %trunc2952, 65535
  %1345 = call i32 @llvm.bswap.i32(i32 %1344)
  %1346 = zext i32 %1345 to i64
  %1347 = load i64, ptr %314, align 8
  %1348 = and i64 %1347, -65536
  %1349 = xor i64 %1348, %1346
  %1350 = add i64 %1337, 20
  %1351 = inttoptr i64 %1225 to ptr
  %1352 = getelementptr i8, ptr %1351, i64 5
  %1353 = load i8, ptr %1352, align 1
  %1354 = inttoptr i64 %1337 to ptr
  %1355 = getelementptr i8, ptr %1354, i64 5
  store i8 %1353, ptr %1355, align 1
  %1356 = getelementptr i8, ptr %1351, i64 4
  %1357 = load i8, ptr %1356, align 1
  %1358 = getelementptr i8, ptr %1354, i64 4
  store i8 %1357, ptr %1358, align 1
  %1359 = getelementptr i8, ptr %1351, i64 3
  %1360 = load i8, ptr %1359, align 1
  %1361 = getelementptr i8, ptr %1354, i64 3
  store i8 %1360, ptr %1361, align 1
  %1362 = getelementptr i8, ptr %1351, i64 2
  %1363 = load i8, ptr %1362, align 1
  %1364 = getelementptr i8, ptr %1354, i64 2
  store i8 %1363, ptr %1364, align 1
  %1365 = getelementptr i8, ptr %1351, i64 1
  %1366 = load i8, ptr %1365, align 1
  %1367 = getelementptr i8, ptr %1354, i64 1
  store i8 %1366, ptr %1367, align 1
  %1368 = load i8, ptr %1351, align 1
  store i8 %1368, ptr %1354, align 1
  %1369 = inttoptr i64 %1350 to ptr
  %1370 = getelementptr i8, ptr %1369, i64 2
  %1371 = load i8, ptr %1370, align 1
  %1372 = getelementptr i8, ptr %1354, i64 8
  store i8 %1371, ptr %1372, align 1
  %1373 = getelementptr i8, ptr %1369, i64 3
  %1374 = load i8, ptr %1373, align 1
  %1375 = getelementptr i8, ptr %1354, i64 9
  store i8 %1374, ptr %1375, align 1
  %1376 = load i8, ptr %1369, align 1
  %1377 = getelementptr i8, ptr %1354, i64 6
  store i8 %1376, ptr %1377, align 1
  %1378 = getelementptr i8, ptr %1369, i64 1
  %1379 = load i8, ptr %1378, align 1
  %1380 = getelementptr i8, ptr %1354, i64 7
  store i8 %1379, ptr %1380, align 1
  %1381 = getelementptr i8, ptr %1369, i64 4
  %1382 = load i8, ptr %1381, align 1
  %1383 = getelementptr i8, ptr %1354, i64 10
  store i8 %1382, ptr %1383, align 1
  %1384 = getelementptr i8, ptr %1369, i64 5
  %1385 = load i8, ptr %1384, align 1
  %1386 = getelementptr i8, ptr %1354, i64 11
  store i8 %1385, ptr %1386, align 1
  %1387 = getelementptr i8, ptr %1354, i64 12
  store i8 8, ptr %1387, align 1
  %1388 = getelementptr i8, ptr %1354, i64 13
  store i8 0, ptr %1388, align 1
  %1389 = load i64, ptr %1247, align 8
  %1390 = inttoptr i64 %1389 to ptr
  %1391 = load i32, ptr %1390, align 4
  %1392 = zext i32 %1391 to i64
  %1393 = load i8, ptr %116, align 1
  %1394 = getelementptr i8, ptr %1354, i64 14
  store i8 69, ptr %1394, align 1
  %1395 = getelementptr i8, ptr %1354, i64 15
  store i8 %1393, ptr %1395, align 1
  %1396 = lshr exact i64 %1349, 16
  %1397 = and i64 %1396, 65535
  %1398 = and i64 %1392, 65535
  %1399 = getelementptr i8, ptr %1354, i64 18
  store i32 0, ptr %1399, align 4
  %1400 = getelementptr i8, ptr %1354, i64 22
  store i16 1088, ptr %1400, align 2
  %1401 = trunc i64 %1349 to i32
  %1402 = or i32 %1401, 4268
  %1403 = getelementptr i8, ptr %1354, i64 26
  store i32 %1402, ptr %1403, align 4
  %1404 = getelementptr i8, ptr %1354, i64 30
  store i32 %1391, ptr %1404, align 4
  %1405 = lshr i64 %1392, 16
  %1406 = add i16 %rev2943, 20
  %rev2955 = call i16 @llvm.bswap.i16(i16 %1406)
  %1407 = zext i16 %rev2955 to i64
  %1408 = getelementptr i8, ptr %1354, i64 16
  store i16 %rev2955, ptr %1408, align 2
  %1409 = load i16, ptr %1394, align 2
  %1410 = zext i16 %1409 to i64
  %1411 = add nuw nsw i64 %1397, %1407
  %1412 = add nuw nsw i64 %1411, %1398
  %1413 = add nuw nsw i64 %1412, %1405
  %1414 = add nuw nsw i64 %1413, %1410
  %1415 = add nuw nsw i64 %1414, 5356
  %1416 = icmp ult i64 %1414, 60180
  %1417 = lshr i64 %1415, 16
  %1418 = and i64 %1415, 65535
  %1419 = add nuw nsw i64 %1418, %1417
  %r3.17 = select i1 %1416, i64 %1415, i64 %1419
  %1420 = icmp ult i64 %r3.17, 65536
  %1421 = lshr i64 %r3.17, 16
  %1422 = and i64 %r3.17, 65535
  %1423 = add nuw nsw i64 %1422, %1421
  %r3.18 = select i1 %1420, i64 %r3.17, i64 %1423
  %1424 = icmp ult i64 %r3.18, 65536
  br i1 %1424, label %bb_inst_1912, label %bb_inst_1910

bb_inst_1910:                                     ; preds = %bb_inst_1936, %bb_inst_1828
  %.pre3046.pre-phi = phi ptr [ %1451, %bb_inst_1936 ], [ %1354, %bb_inst_1828 ]
  br label %bb_inst_1912

bb_inst_1912:                                     ; preds = %bb_inst_1936, %bb_inst_1910, %bb_inst_1828
  %.pre-phi3047 = phi ptr [ %1451, %bb_inst_1936 ], [ %.pre3046.pre-phi, %bb_inst_1910 ], [ %1354, %bb_inst_1828 ]
  %r3.20 = phi i64 [ %r3.22, %bb_inst_1936 ], [ 1, %bb_inst_1910 ], [ %r3.18, %bb_inst_1828 ]
  %1425 = lshr i64 %r3.20, 16
  %1426 = add nuw nsw i64 %1425, %r3.20
  %1427 = trunc i64 %1426 to i16
  %1428 = xor i16 %1427, -1
  %1429 = getelementptr i8, ptr %.pre-phi3047, i64 24
  store i16 %1428, ptr %1429, align 2
  br label %bb_inst_942

bb_inst_1918:                                     ; preds = %bb_inst_1025
  %1430 = load i32, ptr %21, align 8
  %1431 = zext i32 %1430 to i64
  store i64 %1431, ptr %43, align 8
  %1432 = call i64 @_bpf_helper_ext_0044(i64 %3, i64 4294967276, i64 %r3.9, i64 %r4.4, i64 %r5.5)
  %1433 = and i64 %1432, 4294967295
  %.not2906 = icmp eq i64 %1433, 0
  br i1 %.not2906, label %bb_inst_1927, label %bb_inst_942

bb_inst_1927:                                     ; preds = %bb_inst_1918
  %1434 = load i64, ptr %0, align 4
  %1435 = load i64, ptr %4, align 4
  %1436 = add i64 %1434, 14
  %1437 = icmp ugt i64 %1436, %1435
  %1438 = add i64 %1434, 34
  %1439 = icmp ugt i64 %1438, %1435
  %or.cond2966 = or i1 %1437, %1439
  br i1 %or.cond2966, label %bb_inst_942, label %bb_inst_1936

bb_inst_1936:                                     ; preds = %bb_inst_1927
  %1440 = load i64, ptr %763, align 8
  %trunc2911 = trunc i64 %1440 to i32
  %1441 = and i32 %trunc2911, 65535
  %1442 = call i32 @llvm.bswap.i32(i32 %1441)
  %1443 = zext i32 %1442 to i64
  %1444 = load i64, ptr %43, align 8
  %1445 = and i64 %1444, -65536
  %1446 = xor i64 %1445, %1443
  %1447 = add i64 %1434, 20
  %1448 = inttoptr i64 %744 to ptr
  %1449 = getelementptr i8, ptr %1448, i64 5
  %1450 = load i8, ptr %1449, align 1
  %1451 = inttoptr i64 %1434 to ptr
  %1452 = getelementptr i8, ptr %1451, i64 5
  store i8 %1450, ptr %1452, align 1
  %1453 = getelementptr i8, ptr %1448, i64 4
  %1454 = load i8, ptr %1453, align 1
  %1455 = getelementptr i8, ptr %1451, i64 4
  store i8 %1454, ptr %1455, align 1
  %1456 = getelementptr i8, ptr %1448, i64 3
  %1457 = load i8, ptr %1456, align 1
  %1458 = getelementptr i8, ptr %1451, i64 3
  store i8 %1457, ptr %1458, align 1
  %1459 = getelementptr i8, ptr %1448, i64 2
  %1460 = load i8, ptr %1459, align 1
  %1461 = getelementptr i8, ptr %1451, i64 2
  store i8 %1460, ptr %1461, align 1
  %1462 = getelementptr i8, ptr %1448, i64 1
  %1463 = load i8, ptr %1462, align 1
  %1464 = getelementptr i8, ptr %1451, i64 1
  store i8 %1463, ptr %1464, align 1
  %1465 = load i8, ptr %1448, align 1
  store i8 %1465, ptr %1451, align 1
  %1466 = inttoptr i64 %1447 to ptr
  %1467 = getelementptr i8, ptr %1466, i64 2
  %1468 = load i8, ptr %1467, align 1
  %1469 = getelementptr i8, ptr %1451, i64 8
  store i8 %1468, ptr %1469, align 1
  %1470 = getelementptr i8, ptr %1466, i64 3
  %1471 = load i8, ptr %1470, align 1
  %1472 = getelementptr i8, ptr %1451, i64 9
  store i8 %1471, ptr %1472, align 1
  %1473 = load i8, ptr %1466, align 1
  %1474 = getelementptr i8, ptr %1451, i64 6
  store i8 %1473, ptr %1474, align 1
  %1475 = getelementptr i8, ptr %1466, i64 1
  %1476 = load i8, ptr %1475, align 1
  %1477 = getelementptr i8, ptr %1451, i64 7
  store i8 %1476, ptr %1477, align 1
  %1478 = getelementptr i8, ptr %1466, i64 4
  %1479 = load i8, ptr %1478, align 1
  %1480 = getelementptr i8, ptr %1451, i64 10
  store i8 %1479, ptr %1480, align 1
  %1481 = getelementptr i8, ptr %1466, i64 5
  %1482 = load i8, ptr %1481, align 1
  %1483 = getelementptr i8, ptr %1451, i64 11
  store i8 %1482, ptr %1483, align 1
  %1484 = getelementptr i8, ptr %1451, i64 12
  store i8 8, ptr %1484, align 1
  %1485 = getelementptr i8, ptr %1451, i64 13
  store i8 0, ptr %1485, align 1
  %1486 = load i64, ptr %766, align 8
  %1487 = inttoptr i64 %1486 to ptr
  %1488 = load i32, ptr %1487, align 4
  %1489 = zext i32 %1488 to i64
  %1490 = load i8, ptr %32, align 1
  %1491 = getelementptr i8, ptr %1451, i64 14
  store i8 69, ptr %1491, align 1
  %1492 = getelementptr i8, ptr %1451, i64 15
  store i8 %1490, ptr %1492, align 1
  %1493 = lshr exact i64 %1446, 16
  %1494 = and i64 %1493, 65535
  %1495 = and i64 %1489, 65535
  %1496 = getelementptr i8, ptr %1451, i64 18
  store i32 0, ptr %1496, align 4
  %1497 = getelementptr i8, ptr %1451, i64 22
  store i16 1088, ptr %1497, align 2
  %1498 = trunc i64 %1446 to i32
  %1499 = or i32 %1498, 4268
  %1500 = getelementptr i8, ptr %1451, i64 26
  store i32 %1499, ptr %1500, align 4
  %1501 = getelementptr i8, ptr %1451, i64 30
  store i32 %1488, ptr %1501, align 4
  %1502 = lshr i64 %1489, 16
  %1503 = add i16 %rev, 20
  %rev2914 = call i16 @llvm.bswap.i16(i16 %1503)
  %1504 = zext i16 %rev2914 to i64
  %1505 = getelementptr i8, ptr %1451, i64 16
  store i16 %rev2914, ptr %1505, align 2
  %1506 = load i16, ptr %1491, align 2
  %1507 = zext i16 %1506 to i64
  %1508 = add nuw nsw i64 %1494, %1504
  %1509 = add nuw nsw i64 %1508, %1495
  %1510 = add nuw nsw i64 %1509, %1502
  %1511 = add nuw nsw i64 %1510, %1507
  %1512 = add nuw nsw i64 %1511, 5356
  %1513 = icmp ult i64 %1511, 60180
  %1514 = lshr i64 %1512, 16
  %1515 = and i64 %1512, 65535
  %1516 = add nuw nsw i64 %1515, %1514
  %r3.21 = select i1 %1513, i64 %1512, i64 %1516
  %1517 = icmp ult i64 %r3.21, 65536
  %1518 = lshr i64 %r3.21, 16
  %1519 = and i64 %r3.21, 65535
  %1520 = add nuw nsw i64 %1519, %1518
  %r3.22 = select i1 %1517, i64 %r3.21, i64 %1520
  %1521 = icmp ult i64 %r3.22, 65536
  br i1 %1521, label %bb_inst_1912, label %bb_inst_1910

bb_inst_2019:                                     ; preds = %bb_inst_1200
  %1522 = add i64 %2, -72
  %1523 = load i64, ptr %519, align 8
  %1524 = call i64 @_bpf_helper_ext_0001(i64 %1523, i64 %1522, i64 1, i64 %r4.0, i64 %r5.2)
  %1525 = icmp eq i64 %1524, 0
  br i1 %1525, label %bb_inst_2109, label %bb_inst_2024

bb_inst_2024:                                     ; preds = %bb_inst_2019
  %1526 = inttoptr i64 %1524 to ptr
  %1527 = load i32, ptr %1526, align 4
  %1528 = load i32, ptr %96, align 8
  %1529 = icmp eq i32 %1527, %1528
  br i1 %1529, label %bb_inst_2028, label %bb_inst_2140

bb_inst_2028:                                     ; preds = %bb_inst_2024
  %1530 = inttoptr i64 %523 to ptr
  %1531 = getelementptr i8, ptr %1530, i64 80
  br label %bb_inst_2178.sink.split

bb_inst_2032:                                     ; preds = %bb_inst_707
  %1532 = inttoptr i64 %546 to ptr
  %1533 = getelementptr i8, ptr %1532, i64 8
  %1534 = load i64, ptr %1533, align 4
  %1535 = add i64 %1534, 1
  store i64 %1535, ptr %1533, align 4
  %1536 = load i32, ptr %478, align 4
  %1537 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 %1536, ptr %1537, align 8
  %1538 = add i64 %2, -16
  %1539 = shl i64 18, 32
  %1540 = call i64 @_bpf_helper_ext_0001(i64 %1539, i64 %1538, i64 %r3.5, i64 %r4.2, i64 %r5.3)
  %1541 = icmp eq i64 %1540, 0
  br i1 %1541, label %bb_inst_718, label %bb_inst_718.sink.split

bb_inst_2048:                                     ; preds = %bb_inst_1130
  %1542 = getelementptr i8, ptr %852, i64 1
  %1543 = load i8, ptr %1542, align 1
  %1544 = zext i8 %1543 to i64
  %1545 = shl nuw nsw i64 %1544, 24
  %1546 = getelementptr i8, ptr %852, i64 2
  %1547 = load i8, ptr %1546, align 1
  %1548 = zext i8 %1547 to i64
  %1549 = shl nuw nsw i64 %1548, 16
  %1550 = or i64 %1549, %1545
  %1551 = getelementptr i8, ptr %852, i64 3
  %1552 = load i8, ptr %1551, align 1
  %1553 = zext i8 %1552 to i64
  %1554 = shl nuw nsw i64 %1553, 8
  %1555 = or i64 %1550, %1554
  %1556 = getelementptr i8, ptr %852, i64 4
  %1557 = load i8, ptr %1556, align 1
  br label %bb_inst_2066

bb_inst_2059:                                     ; preds = %bb_inst_1130
  %1558 = getelementptr i8, ptr %852, i64 1
  %1559 = load i8, ptr %1558, align 1
  %1560 = zext i8 %1559 to i64
  %1561 = shl nuw nsw i64 %1560, 16
  %1562 = getelementptr i8, ptr %852, i64 2
  %1563 = load i8, ptr %1562, align 1
  %1564 = zext i8 %1563 to i64
  %1565 = shl nuw nsw i64 %1564, 8
  %1566 = or i64 %1565, %1561
  %1567 = getelementptr i8, ptr %852, i64 3
  %1568 = load i8, ptr %1567, align 1
  br label %bb_inst_2066

bb_inst_2066:                                     ; preds = %bb_inst_2059, %bb_inst_2048, %bb_inst_1136
  %r2.10.in = phi i8 [ %1557, %bb_inst_2048 ], [ %1568, %bb_inst_2059 ], [ %865, %bb_inst_1136 ]
  %r8.6 = phi i64 [ %1555, %bb_inst_2048 ], [ %1566, %bb_inst_2059 ], [ %862, %bb_inst_1136 ]
  %r1.9 = phi i64 [ 72, %bb_inst_2048 ], [ 64, %bb_inst_2059 ], [ 56, %bb_inst_1136 ]
  %r2.10 = zext i8 %r2.10.in to i64
  %1569 = or i64 %r8.6, %r2.10
  %1570 = shl i64 %1569, 32
  %1571 = ashr exact i64 %1570, 32
  %1572 = icmp slt i64 %1570, 4294967296
  br i1 %1572, label %bb_inst_718.sink.split, label %bb_inst_2073

bb_inst_2073:                                     ; preds = %bb_inst_2066
  %1573 = add i64 %r1.9, %546
  %1574 = inttoptr i64 %1573 to ptr
  %1575 = load i64, ptr %1574, align 4
  %1576 = add i64 %1575, 1
  store i64 %1576, ptr %1574, align 4
  %1577 = trunc i64 %1569 to i32
  %1578 = getelementptr inbounds i8, ptr %stackEnd, i64 -20
  store i32 %1577, ptr %1578, align 4
  %1579 = add i64 %2, -20
  %1580 = shl i64 16, 32
  %1581 = call i64 @_bpf_helper_ext_0001(i64 %1580, i64 %1579, i64 1, i64 %r4.2, i64 %r5.3)
  %1582 = icmp eq i64 %1581, 0
  br i1 %1582, label %bb_inst_2101, label %bb_inst_2085

bb_inst_2085:                                     ; preds = %bb_inst_2073
  %1583 = inttoptr i64 %1581 to ptr
  %1584 = load i32, ptr %1583, align 4
  store i32 %1584, ptr %1578, align 4
  %1585 = icmp eq i32 %1584, 0
  br i1 %1585, label %bb_inst_2101, label %bb_inst_2088

bb_inst_2088:                                     ; preds = %bb_inst_2085
  store i32 %1584, ptr %18, align 8
  %1586 = shl i64 9, 32
  %1587 = call i64 @_bpf_helper_ext_0001(i64 %1586, i64 %1579, i64 1, i64 %r4.2, i64 %r5.3)
  %1588 = getelementptr inbounds i8, ptr %stackEnd, i64 -176
  store i64 %1587, ptr %1588, align 8
  %.not2916 = icmp eq i64 %1587, 0
  br i1 %.not2916, label %bb_inst_2096, label %bb_inst_2156

bb_inst_2096:                                     ; preds = %bb_inst_2088
  %1589 = load i64, ptr %548, align 8
  %1590 = inttoptr i64 %1589 to ptr
  %1591 = getelementptr i8, ptr %1590, i64 40
  %1592 = load i64, ptr %1591, align 4
  %1593 = add i64 %1592, 1
  store i64 %1593, ptr %1591, align 4
  br label %bb_inst_942

bb_inst_2101:                                     ; preds = %bb_inst_2085, %bb_inst_2073
  %1594 = load i64, ptr %548, align 8
  %1595 = inttoptr i64 %1594 to ptr
  %1596 = getelementptr i8, ptr %1595, i64 24
  store i64 %1571, ptr %1596, align 4
  %1597 = getelementptr i8, ptr %1595, i64 16
  %1598 = load i64, ptr %1597, align 4
  %1599 = add i64 %1598, 1
  store i64 %1599, ptr %1597, align 4
  br label %bb_inst_718.sink.split

bb_inst_2109:                                     ; preds = %bb_inst_2019
  %1600 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 514, ptr %1600, align 8
  %1601 = add i64 %2, -16
  %1602 = shl i64 13, 32
  %1603 = call i64 @_bpf_helper_ext_0001(i64 %1602, i64 %1601, i64 1, i64 %r4.0, i64 %r5.2)
  %1604 = icmp eq i64 %1603, 0
  br i1 %1604, label %bb_inst_2175, label %bb_inst_2118

bb_inst_2118:                                     ; preds = %bb_inst_2109
  %1605 = call i64 @_bpf_helper_ext_0005(i64 %1602, i64 %1601, i64 1, i64 %r4.0, i64 %r5.2)
  %1606 = inttoptr i64 %1603 to ptr
  %1607 = getelementptr i8, ptr %1606, i64 8
  %1608 = load i64, ptr %1607, align 4
  %1609 = sub i64 %1605, %1608
  %1610 = icmp ult i64 %1609, 1000000001
  br i1 %1610, label %bb_inst_2170, label %bb_inst_2124

bb_inst_2124:                                     ; preds = %bb_inst_2118
  store i64 %1605, ptr %1607, align 4
  store i64 1, ptr %1606, align 4
  br label %bb_inst_2127

bb_inst_2127:                                     ; preds = %bb_inst_2170, %bb_inst_2124
  %1611 = load i32, ptr %96, align 8
  store i32 %1611, ptr %1600, align 8
  %1612 = load i64, ptr %519, align 8
  %1613 = call i64 @_bpf_helper_ext_0002(i64 %1612, i64 %1522, i64 %1601, i64 0, i64 %r5.2)
  br label %bb_inst_2175

bb_inst_2140:                                     ; preds = %bb_inst_2024
  store i32 %1528, ptr %1526, align 4
  %1614 = inttoptr i64 %523 to ptr
  %1615 = getelementptr i8, ptr %1614, i64 88
  %1616 = load i64, ptr %1615, align 4
  %1617 = add i64 %1616, 1
  store i64 %1617, ptr %1615, align 4
  %1618 = load i32, ptr %334, align 4
  %1619 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 %1618, ptr %1619, align 8
  %1620 = add i64 %2, -16
  %1621 = shl i64 18, 32
  %1622 = call i64 @_bpf_helper_ext_0001(i64 %1621, i64 %1620, i64 1, i64 %r4.0, i64 %r5.2)
  %1623 = icmp eq i64 %1622, 0
  br i1 %1623, label %bb_inst_2178, label %bb_inst_2152

bb_inst_2152:                                     ; preds = %bb_inst_2140
  %1624 = inttoptr i64 %1622 to ptr
  %1625 = getelementptr i8, ptr %1624, i64 8
  br label %bb_inst_2178.sink.split

bb_inst_2156:                                     ; preds = %bb_inst_2088
  %1626 = add i64 %2, -72
  %1627 = load i64, ptr %497, align 8
  %1628 = call i64 @_bpf_helper_ext_0001(i64 %1627, i64 %1626, i64 1, i64 %r4.2, i64 %r5.3)
  %1629 = icmp eq i64 %1628, 0
  br i1 %1629, label %bb_inst_2184, label %bb_inst_2161

bb_inst_2161:                                     ; preds = %bb_inst_2156
  %1630 = inttoptr i64 %1628 to ptr
  %1631 = load i32, ptr %1630, align 4
  %1632 = load i32, ptr %18, align 8
  %1633 = icmp eq i32 %1631, %1632
  br i1 %1633, label %bb_inst_2241.sink.split.sink.split, label %bb_inst_2215

bb_inst_2170:                                     ; preds = %bb_inst_2118
  %1634 = load i64, ptr %1606, align 4
  %1635 = add i64 %1634, 1
  store i64 %1635, ptr %1606, align 4
  %1636 = icmp ult i64 %1635, 125001
  br i1 %1636, label %bb_inst_2127, label %bb_inst_2175

bb_inst_2175:                                     ; preds = %bb_inst_2170, %bb_inst_2127, %bb_inst_2109
  %r3.23 = phi i64 [ 1, %bb_inst_2109 ], [ %1601, %bb_inst_2127 ], [ 1, %bb_inst_2170 ]
  %r4.8 = phi i64 [ %r4.0, %bb_inst_2109 ], [ 0, %bb_inst_2127 ], [ %r4.0, %bb_inst_2170 ]
  %1637 = inttoptr i64 %523 to ptr
  %1638 = getelementptr i8, ptr %1637, i64 96
  br label %bb_inst_2178.sink.split

bb_inst_2178.sink.split:                          ; preds = %bb_inst_2028, %bb_inst_2152, %bb_inst_2175
  %.sink3131 = phi ptr [ %1638, %bb_inst_2175 ], [ %1625, %bb_inst_2152 ], [ %1531, %bb_inst_2028 ]
  %.pre-phi3049.ph = phi ptr [ %1637, %bb_inst_2175 ], [ %1614, %bb_inst_2152 ], [ %1530, %bb_inst_2028 ]
  %r3.24.ph = phi i64 [ %r3.23, %bb_inst_2175 ], [ 1, %bb_inst_2152 ], [ 1, %bb_inst_2028 ]
  %r4.9.ph = phi i64 [ %r4.8, %bb_inst_2175 ], [ %r4.0, %bb_inst_2152 ], [ %r4.0, %bb_inst_2028 ]
  %1639 = load i64, ptr %.sink3131, align 4
  %1640 = add i64 %1639, 1
  store i64 %1640, ptr %.sink3131, align 4
  br label %bb_inst_2178

bb_inst_2178:                                     ; preds = %bb_inst_2178.sink.split, %bb_inst_2140
  %.pre-phi3049 = phi ptr [ %1614, %bb_inst_2140 ], [ %.pre-phi3049.ph, %bb_inst_2178.sink.split ]
  %r3.24 = phi i64 [ 1, %bb_inst_2140 ], [ %r3.24.ph, %bb_inst_2178.sink.split ]
  %r4.9 = phi i64 [ %r4.0, %bb_inst_2140 ], [ %r4.9.ph, %bb_inst_2178.sink.split ]
  %1641 = getelementptr i8, ptr %.pre-phi3049, i64 32
  %1642 = load i64, ptr %1641, align 4
  %1643 = add i64 %1642, 1
  store i64 %1643, ptr %1641, align 4
  %1644 = load i16, ptr %97, align 8
  %1645 = zext i16 %1644 to i64
  %1646 = getelementptr inbounds i8, ptr %stackEnd, i64 -192
  store i64 %1645, ptr %1646, align 8
  br label %bb_inst_1688

bb_inst_2184:                                     ; preds = %bb_inst_2156
  %1647 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 514, ptr %1647, align 8
  %1648 = add i64 %2, -16
  %1649 = shl i64 13, 32
  %1650 = call i64 @_bpf_helper_ext_0001(i64 %1649, i64 %1648, i64 1, i64 %r4.2, i64 %r5.3)
  %1651 = icmp eq i64 %1650, 0
  br i1 %1651, label %bb_inst_2241.sink.split.sink.split, label %bb_inst_2193

bb_inst_2193:                                     ; preds = %bb_inst_2184
  %1652 = call i64 @_bpf_helper_ext_0005(i64 %1649, i64 %1648, i64 1, i64 %r4.2, i64 %r5.3)
  %1653 = inttoptr i64 %1650 to ptr
  %1654 = getelementptr i8, ptr %1653, i64 8
  %1655 = load i64, ptr %1654, align 4
  %1656 = sub i64 %1652, %1655
  %1657 = icmp ult i64 %1656, 1000000001
  br i1 %1657, label %bb_inst_2232, label %bb_inst_2199

bb_inst_2199:                                     ; preds = %bb_inst_2193
  store i64 %1652, ptr %1654, align 4
  store i64 1, ptr %1653, align 4
  br label %bb_inst_2202

bb_inst_2202:                                     ; preds = %bb_inst_2232, %bb_inst_2199
  %1658 = load i32, ptr %18, align 8
  store i32 %1658, ptr %1647, align 8
  %1659 = load i64, ptr %497, align 8
  %1660 = call i64 @_bpf_helper_ext_0002(i64 %1659, i64 %1626, i64 %1648, i64 0, i64 %r5.3)
  br label %bb_inst_2241.sink.split.sink.split

bb_inst_2215:                                     ; preds = %bb_inst_2161
  store i32 %1632, ptr %1630, align 4
  %1661 = load i64, ptr %548, align 8
  %1662 = inttoptr i64 %1661 to ptr
  %1663 = getelementptr i8, ptr %1662, i64 88
  %1664 = load i64, ptr %1663, align 4
  %1665 = add i64 %1664, 1
  store i64 %1665, ptr %1663, align 4
  %1666 = load i32, ptr %478, align 4
  %1667 = getelementptr inbounds i8, ptr %stackEnd, i64 -16
  store i32 %1666, ptr %1667, align 8
  %1668 = add i64 %2, -16
  %1669 = shl i64 18, 32
  %1670 = call i64 @_bpf_helper_ext_0001(i64 %1669, i64 %1668, i64 1, i64 %r4.2, i64 %r5.3)
  %1671 = icmp eq i64 %1670, 0
  br i1 %1671, label %bb_inst_2241, label %bb_inst_2241.sink.split

bb_inst_2232:                                     ; preds = %bb_inst_2193
  %1672 = load i64, ptr %1653, align 4
  %1673 = add i64 %1672, 1
  store i64 %1673, ptr %1653, align 4
  %1674 = icmp ult i64 %1673, 125001
  br i1 %1674, label %bb_inst_2202, label %bb_inst_2241.sink.split.sink.split

bb_inst_2241.sink.split.sink.split:               ; preds = %bb_inst_2184, %bb_inst_2202, %bb_inst_2232, %bb_inst_2161
  %.sink3138.ph = phi i64 [ 80, %bb_inst_2161 ], [ 96, %bb_inst_2232 ], [ 96, %bb_inst_2202 ], [ 96, %bb_inst_2184 ]
  %r3.26.ph.ph = phi i64 [ 1, %bb_inst_2161 ], [ 1, %bb_inst_2232 ], [ %1648, %bb_inst_2202 ], [ 1, %bb_inst_2184 ]
  %r4.11.ph.ph = phi i64 [ %r4.2, %bb_inst_2161 ], [ %r4.2, %bb_inst_2232 ], [ 0, %bb_inst_2202 ], [ %r4.2, %bb_inst_2184 ]
  %1675 = load i64, ptr %548, align 8
  br label %bb_inst_2241.sink.split

bb_inst_2241.sink.split:                          ; preds = %bb_inst_2241.sink.split.sink.split, %bb_inst_2215
  %.sink3139 = phi i64 [ %1670, %bb_inst_2215 ], [ %1675, %bb_inst_2241.sink.split.sink.split ]
  %.sink3138 = phi i64 [ 8, %bb_inst_2215 ], [ %.sink3138.ph, %bb_inst_2241.sink.split.sink.split ]
  %r3.26.ph = phi i64 [ 1, %bb_inst_2215 ], [ %r3.26.ph.ph, %bb_inst_2241.sink.split.sink.split ]
  %r4.11.ph = phi i64 [ %r4.2, %bb_inst_2215 ], [ %r4.11.ph.ph, %bb_inst_2241.sink.split.sink.split ]
  %1676 = inttoptr i64 %.sink3139 to ptr
  %1677 = getelementptr i8, ptr %1676, i64 %.sink3138
  %1678 = load i64, ptr %1677, align 4
  %1679 = add i64 %1678, 1
  store i64 %1679, ptr %1677, align 4
  br label %bb_inst_2241

bb_inst_2241:                                     ; preds = %bb_inst_2241.sink.split, %bb_inst_2215
  %r3.26 = phi i64 [ 1, %bb_inst_2215 ], [ %r3.26.ph, %bb_inst_2241.sink.split ]
  %r4.11 = phi i64 [ %r4.2, %bb_inst_2215 ], [ %r4.11.ph, %bb_inst_2241.sink.split ]
  %1680 = load i64, ptr %548, align 8
  %1681 = inttoptr i64 %1680 to ptr
  %1682 = getelementptr i8, ptr %1681, i64 32
  %1683 = load i64, ptr %1682, align 4
  %1684 = add i64 %1683, 1
  store i64 %1684, ptr %1682, align 4
  %1685 = load i16, ptr %19, align 8
  %1686 = zext i16 %1685 to i64
  store i64 %1686, ptr %548, align 8
  br label %bb_inst_997
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #0

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #0

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }

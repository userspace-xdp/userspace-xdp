; ModuleID = 'xdp_lb.bpf.c'
source_filename = "xdp_lb.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ip_mac_pair = type { %struct.eth_addr, i32 }
%struct.eth_addr = type { [6 x i8] }
%struct.anon.1 = type { [2 x i32]*, i32*, %struct.ip_mac_pair*, [64 x i32]* }
%struct.anon.2 = type { [2 x i32]*, i32*, %struct.ip_mac_pair*, [64 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@__const.xdp_pass.____fmt = private unnamed_addr constant [22 x i8] c"Out of bounds ethhdr\0A\00", align 16
@__const.xdp_pass.____fmt.1 = private unnamed_addr constant [21 x i8] c"Out of bounds iphdr\0A\00", align 16
@__const.xdp_pass.____fmt.2 = private unnamed_addr constant [22 x i8] c"Out of bounds tcphdr\0A\00", align 16
@LICENSE = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@__config_map = dso_local local_unnamed_addr global [64 x %struct.ip_mac_pair] zeroinitializer, align 16
@__targets_map = dso_local local_unnamed_addr global [64 x %struct.ip_mac_pair] zeroinitializer, align 16
@targets_map = dso_local local_unnamed_addr global %struct.anon.1 zeroinitializer, align 8
@config_map = dso_local local_unnamed_addr global %struct.anon.2 zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to %struct.xdp_md*
  %3 = tail call i32 @xdp_pass(%struct.xdp_md* noundef %2)
  ret i32 %3
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = alloca [22 x i8], align 16
  %3 = alloca [21 x i8], align 16
  %4 = alloca [22 x i8], align 16
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %6 = load i64, i64* %5, align 8, !tbaa !5
  %7 = inttoptr i64 %6 to i8*
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %9 = load i64, i64* %8, align 8, !tbaa !11
  %10 = inttoptr i64 %9 to i8*
  %11 = inttoptr i64 %9 to %struct.ethhdr*
  %12 = getelementptr i8, i8* %10, i64 14
  %13 = icmp ugt i8* %12, %7
  br i1 %13, label %14, label %17

14:                                               ; preds = %1
  %15 = getelementptr inbounds [22 x i8], [22 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %15) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(22) %15, i8* noundef nonnull align 16 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt, i64 0, i64 0), i64 22, i1 false)
  %16 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %15, i64 noundef 22) #8
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %15) #8
  br label %679

17:                                               ; preds = %1
  %18 = getelementptr i8, i8* %10, i64 34
  %19 = icmp ugt i8* %18, %7
  br i1 %19, label %20, label %23

20:                                               ; preds = %17
  %21 = getelementptr inbounds [21 x i8], [21 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %21) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(21) %21, i8* noundef nonnull align 16 dereferenceable(21) getelementptr inbounds ([21 x i8], [21 x i8]* @__const.xdp_pass.____fmt.1, i64 0, i64 0), i64 21, i1 false)
  %22 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %21, i64 noundef 21) #8
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %21) #8
  br label %679

23:                                               ; preds = %17
  %24 = getelementptr i8, i8* %10, i64 23
  %25 = load i8, i8* %24, align 1, !tbaa !12
  %26 = icmp eq i8 %25, 6
  br i1 %26, label %27, label %679

27:                                               ; preds = %23
  %28 = getelementptr i8, i8* %10, i64 54
  %29 = icmp ugt i8* %28, %7
  br i1 %29, label %30, label %33

30:                                               ; preds = %27
  %31 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %31) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(22) %31, i8* noundef nonnull align 16 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt.2, i64 0, i64 0), i64 22, i1 false)
  %32 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %31, i64 noundef 22) #8
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %31) #8
  br label %679

33:                                               ; preds = %27
  %34 = getelementptr i8, i8* %10, i64 1200
  %35 = icmp ult i8* %34, %7
  %36 = getelementptr i8, i8* %10, i64 60
  %37 = icmp ugt i8* %36, %7
  %38 = or i1 %35, %37
  br i1 %38, label %679, label %39

39:                                               ; preds = %33
  %40 = tail call fastcc i32 @calculate_checksum(i8* noundef nonnull %10)
  %41 = add i32 %40, 606290984
  %42 = add i32 %40, -2048144777
  %43 = add i32 %40, 1640531535
  %44 = getelementptr inbounds i8, i8* %10, i64 16
  %45 = load i8, i8* %10, align 1, !tbaa !15
  %46 = zext i8 %45 to i32
  %47 = getelementptr inbounds i8, i8* %10, i64 1
  %48 = load i8, i8* %47, align 1, !tbaa !15
  %49 = zext i8 %48 to i32
  %50 = shl nuw nsw i32 %49, 8
  %51 = or i32 %50, %46
  %52 = getelementptr inbounds i8, i8* %10, i64 2
  %53 = load i8, i8* %52, align 1, !tbaa !15
  %54 = zext i8 %53 to i32
  %55 = shl nuw nsw i32 %54, 16
  %56 = or i32 %51, %55
  %57 = getelementptr inbounds i8, i8* %10, i64 3
  %58 = load i8, i8* %57, align 1, !tbaa !15
  %59 = zext i8 %58 to i32
  %60 = shl nuw i32 %59, 24
  %61 = or i32 %56, %60
  %62 = mul i32 %61, -2048144777
  %63 = add i32 %41, %62
  %64 = tail call i32 @llvm.fshl.i32(i32 %63, i32 %63, i32 13) #8
  %65 = mul i32 %64, -1640531535
  %66 = getelementptr inbounds i8, i8* %10, i64 4
  %67 = load i8, i8* %66, align 1, !tbaa !15
  %68 = zext i8 %67 to i32
  %69 = getelementptr inbounds i8, i8* %10, i64 5
  %70 = load i8, i8* %69, align 1, !tbaa !15
  %71 = zext i8 %70 to i32
  %72 = shl nuw nsw i32 %71, 8
  %73 = or i32 %72, %68
  %74 = getelementptr inbounds i8, i8* %10, i64 6
  %75 = load i8, i8* %74, align 1, !tbaa !15
  %76 = zext i8 %75 to i32
  %77 = shl nuw nsw i32 %76, 16
  %78 = or i32 %73, %77
  %79 = getelementptr inbounds i8, i8* %10, i64 7
  %80 = load i8, i8* %79, align 1, !tbaa !15
  %81 = zext i8 %80 to i32
  %82 = shl nuw i32 %81, 24
  %83 = or i32 %78, %82
  %84 = mul i32 %83, -2048144777
  %85 = add i32 %42, %84
  %86 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 13) #8
  %87 = mul i32 %86, -1640531535
  %88 = getelementptr inbounds i8, i8* %10, i64 8
  %89 = load i8, i8* %88, align 1, !tbaa !15
  %90 = zext i8 %89 to i32
  %91 = getelementptr inbounds i8, i8* %10, i64 9
  %92 = load i8, i8* %91, align 1, !tbaa !15
  %93 = zext i8 %92 to i32
  %94 = shl nuw nsw i32 %93, 8
  %95 = or i32 %94, %90
  %96 = getelementptr inbounds i8, i8* %10, i64 10
  %97 = load i8, i8* %96, align 1, !tbaa !15
  %98 = zext i8 %97 to i32
  %99 = shl nuw nsw i32 %98, 16
  %100 = or i32 %95, %99
  %101 = getelementptr inbounds i8, i8* %10, i64 11
  %102 = load i8, i8* %101, align 1, !tbaa !15
  %103 = zext i8 %102 to i32
  %104 = shl nuw i32 %103, 24
  %105 = or i32 %100, %104
  %106 = mul i32 %105, -2048144777
  %107 = add i32 %106, %40
  %108 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 13) #8
  %109 = mul i32 %108, -1640531535
  %110 = getelementptr inbounds i8, i8* %10, i64 12
  %111 = load i8, i8* %110, align 1, !tbaa !15
  %112 = zext i8 %111 to i32
  %113 = getelementptr inbounds i8, i8* %10, i64 13
  %114 = load i8, i8* %113, align 1, !tbaa !15
  %115 = zext i8 %114 to i32
  %116 = shl nuw nsw i32 %115, 8
  %117 = or i32 %116, %112
  %118 = load i8, i8* %12, align 1, !tbaa !15
  %119 = zext i8 %118 to i32
  %120 = shl nuw nsw i32 %119, 16
  %121 = or i32 %117, %120
  %122 = getelementptr inbounds i8, i8* %10, i64 15
  %123 = load i8, i8* %122, align 1, !tbaa !15
  %124 = zext i8 %123 to i32
  %125 = shl nuw i32 %124, 24
  %126 = or i32 %121, %125
  %127 = mul i32 %126, -2048144777
  %128 = add i32 %43, %127
  %129 = tail call i32 @llvm.fshl.i32(i32 %128, i32 %128, i32 13) #8
  %130 = mul i32 %129, -1640531535
  %131 = getelementptr inbounds i8, i8* %10, i64 32
  %132 = load i8, i8* %44, align 1, !tbaa !15
  %133 = zext i8 %132 to i32
  %134 = getelementptr inbounds i8, i8* %10, i64 17
  %135 = load i8, i8* %134, align 1, !tbaa !15
  %136 = zext i8 %135 to i32
  %137 = shl nuw nsw i32 %136, 8
  %138 = or i32 %137, %133
  %139 = getelementptr inbounds i8, i8* %10, i64 18
  %140 = load i8, i8* %139, align 1, !tbaa !15
  %141 = zext i8 %140 to i32
  %142 = shl nuw nsw i32 %141, 16
  %143 = or i32 %138, %142
  %144 = getelementptr inbounds i8, i8* %10, i64 19
  %145 = load i8, i8* %144, align 1, !tbaa !15
  %146 = zext i8 %145 to i32
  %147 = shl nuw i32 %146, 24
  %148 = or i32 %143, %147
  %149 = mul i32 %148, -2048144777
  %150 = add i32 %149, %65
  %151 = tail call i32 @llvm.fshl.i32(i32 %150, i32 %150, i32 13) #8
  %152 = mul i32 %151, -1640531535
  %153 = getelementptr inbounds i8, i8* %10, i64 20
  %154 = load i8, i8* %153, align 1, !tbaa !15
  %155 = zext i8 %154 to i32
  %156 = getelementptr inbounds i8, i8* %10, i64 21
  %157 = load i8, i8* %156, align 1, !tbaa !15
  %158 = zext i8 %157 to i32
  %159 = shl nuw nsw i32 %158, 8
  %160 = getelementptr inbounds i8, i8* %10, i64 22
  %161 = load i8, i8* %160, align 1, !tbaa !15
  %162 = zext i8 %161 to i32
  %163 = shl nuw nsw i32 %162, 16
  %164 = or i32 %159, %155
  %165 = or i32 %164, %163
  %166 = or i32 %165, 100663296
  %167 = mul i32 %166, -2048144777
  %168 = add i32 %167, %87
  %169 = tail call i32 @llvm.fshl.i32(i32 %168, i32 %168, i32 13) #8
  %170 = mul i32 %169, -1640531535
  %171 = getelementptr inbounds i8, i8* %10, i64 24
  %172 = load i8, i8* %171, align 1, !tbaa !15
  %173 = zext i8 %172 to i32
  %174 = getelementptr inbounds i8, i8* %10, i64 25
  %175 = load i8, i8* %174, align 1, !tbaa !15
  %176 = zext i8 %175 to i32
  %177 = shl nuw nsw i32 %176, 8
  %178 = or i32 %177, %173
  %179 = getelementptr inbounds i8, i8* %10, i64 26
  %180 = load i8, i8* %179, align 1, !tbaa !15
  %181 = zext i8 %180 to i32
  %182 = shl nuw nsw i32 %181, 16
  %183 = or i32 %178, %182
  %184 = getelementptr inbounds i8, i8* %10, i64 27
  %185 = load i8, i8* %184, align 1, !tbaa !15
  %186 = zext i8 %185 to i32
  %187 = shl nuw i32 %186, 24
  %188 = or i32 %183, %187
  %189 = mul i32 %188, -2048144777
  %190 = add i32 %189, %109
  %191 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %190, i32 13) #8
  %192 = mul i32 %191, -1640531535
  %193 = getelementptr inbounds i8, i8* %10, i64 28
  %194 = load i8, i8* %193, align 1, !tbaa !15
  %195 = zext i8 %194 to i32
  %196 = getelementptr inbounds i8, i8* %10, i64 29
  %197 = load i8, i8* %196, align 1, !tbaa !15
  %198 = zext i8 %197 to i32
  %199 = shl nuw nsw i32 %198, 8
  %200 = or i32 %199, %195
  %201 = getelementptr inbounds i8, i8* %10, i64 30
  %202 = load i8, i8* %201, align 1, !tbaa !15
  %203 = zext i8 %202 to i32
  %204 = shl nuw nsw i32 %203, 16
  %205 = or i32 %200, %204
  %206 = getelementptr inbounds i8, i8* %10, i64 31
  %207 = load i8, i8* %206, align 1, !tbaa !15
  %208 = zext i8 %207 to i32
  %209 = shl nuw i32 %208, 24
  %210 = or i32 %205, %209
  %211 = mul i32 %210, -2048144777
  %212 = add i32 %211, %130
  %213 = tail call i32 @llvm.fshl.i32(i32 %212, i32 %212, i32 13) #8
  %214 = mul i32 %213, -1640531535
  %215 = load i8, i8* %131, align 1, !tbaa !15
  %216 = zext i8 %215 to i32
  %217 = getelementptr inbounds i8, i8* %10, i64 33
  %218 = load i8, i8* %217, align 1, !tbaa !15
  %219 = zext i8 %218 to i32
  %220 = shl nuw nsw i32 %219, 8
  %221 = or i32 %220, %216
  %222 = load i8, i8* %18, align 1, !tbaa !15
  %223 = zext i8 %222 to i32
  %224 = shl nuw nsw i32 %223, 16
  %225 = or i32 %221, %224
  %226 = getelementptr inbounds i8, i8* %10, i64 35
  %227 = load i8, i8* %226, align 1, !tbaa !15
  %228 = zext i8 %227 to i32
  %229 = shl nuw i32 %228, 24
  %230 = or i32 %225, %229
  %231 = mul i32 %230, -2048144777
  %232 = add i32 %231, %152
  %233 = tail call i32 @llvm.fshl.i32(i32 %232, i32 %232, i32 13) #8
  %234 = mul i32 %233, -1640531535
  %235 = getelementptr inbounds i8, i8* %10, i64 36
  %236 = load i8, i8* %235, align 1, !tbaa !15
  %237 = zext i8 %236 to i32
  %238 = getelementptr inbounds i8, i8* %10, i64 37
  %239 = load i8, i8* %238, align 1, !tbaa !15
  %240 = zext i8 %239 to i32
  %241 = shl nuw nsw i32 %240, 8
  %242 = or i32 %241, %237
  %243 = getelementptr inbounds i8, i8* %10, i64 38
  %244 = load i8, i8* %243, align 1, !tbaa !15
  %245 = zext i8 %244 to i32
  %246 = shl nuw nsw i32 %245, 16
  %247 = or i32 %242, %246
  %248 = getelementptr inbounds i8, i8* %10, i64 39
  %249 = load i8, i8* %248, align 1, !tbaa !15
  %250 = zext i8 %249 to i32
  %251 = shl nuw i32 %250, 24
  %252 = or i32 %247, %251
  %253 = mul i32 %252, -2048144777
  %254 = add i32 %253, %170
  %255 = tail call i32 @llvm.fshl.i32(i32 %254, i32 %254, i32 13) #8
  %256 = mul i32 %255, -1640531535
  %257 = getelementptr inbounds i8, i8* %10, i64 40
  %258 = load i8, i8* %257, align 1, !tbaa !15
  %259 = zext i8 %258 to i32
  %260 = getelementptr inbounds i8, i8* %10, i64 41
  %261 = load i8, i8* %260, align 1, !tbaa !15
  %262 = zext i8 %261 to i32
  %263 = shl nuw nsw i32 %262, 8
  %264 = or i32 %263, %259
  %265 = getelementptr inbounds i8, i8* %10, i64 42
  %266 = load i8, i8* %265, align 1, !tbaa !15
  %267 = zext i8 %266 to i32
  %268 = shl nuw nsw i32 %267, 16
  %269 = or i32 %264, %268
  %270 = getelementptr inbounds i8, i8* %10, i64 43
  %271 = load i8, i8* %270, align 1, !tbaa !15
  %272 = zext i8 %271 to i32
  %273 = shl nuw i32 %272, 24
  %274 = or i32 %269, %273
  %275 = mul i32 %274, -2048144777
  %276 = add i32 %275, %192
  %277 = tail call i32 @llvm.fshl.i32(i32 %276, i32 %276, i32 13) #8
  %278 = mul i32 %277, -1640531535
  %279 = getelementptr inbounds i8, i8* %10, i64 44
  %280 = load i8, i8* %279, align 1, !tbaa !15
  %281 = zext i8 %280 to i32
  %282 = getelementptr inbounds i8, i8* %10, i64 45
  %283 = load i8, i8* %282, align 1, !tbaa !15
  %284 = zext i8 %283 to i32
  %285 = shl nuw nsw i32 %284, 8
  %286 = or i32 %285, %281
  %287 = getelementptr inbounds i8, i8* %10, i64 46
  %288 = load i8, i8* %287, align 1, !tbaa !15
  %289 = zext i8 %288 to i32
  %290 = shl nuw nsw i32 %289, 16
  %291 = or i32 %286, %290
  %292 = getelementptr inbounds i8, i8* %10, i64 47
  %293 = load i8, i8* %292, align 1, !tbaa !15
  %294 = zext i8 %293 to i32
  %295 = shl nuw i32 %294, 24
  %296 = or i32 %291, %295
  %297 = mul i32 %296, -2048144777
  %298 = add i32 %297, %214
  %299 = tail call i32 @llvm.fshl.i32(i32 %298, i32 %298, i32 13) #8
  %300 = mul i32 %299, -1640531535
  %301 = tail call i32 @llvm.fshl.i32(i32 %234, i32 %234, i32 1) #8
  %302 = tail call i32 @llvm.fshl.i32(i32 %256, i32 %256, i32 7) #8
  %303 = tail call i32 @llvm.fshl.i32(i32 %278, i32 %278, i32 12) #8
  %304 = tail call i32 @llvm.fshl.i32(i32 %300, i32 %300, i32 18) #8
  %305 = add i32 %301, 60
  %306 = add i32 %305, %302
  %307 = add i32 %306, %303
  %308 = add i32 %307, %304
  %309 = getelementptr inbounds i8, i8* %10, i64 48
  br label %310

310:                                              ; preds = %337, %39
  %311 = phi i32 [ %308, %39 ], [ %340, %337 ]
  %312 = phi i8* [ %309, %39 ], [ %341, %337 ]
  %313 = phi i32 [ 12, %39 ], [ %342, %337 ]
  %314 = icmp ugt i32 %313, 3
  br i1 %314, label %315, label %343

315:                                              ; preds = %310
  %316 = load i8, i8* %312, align 1, !tbaa !15
  %317 = zext i8 %316 to i32
  %318 = getelementptr inbounds i8, i8* %312, i64 1
  %319 = load i8, i8* %318, align 1, !tbaa !15
  %320 = zext i8 %319 to i32
  %321 = shl nuw nsw i32 %320, 8
  %322 = or i32 %321, %317
  %323 = getelementptr inbounds i8, i8* %312, i64 2
  %324 = load i8, i8* %323, align 1, !tbaa !15
  %325 = zext i8 %324 to i32
  %326 = shl nuw nsw i32 %325, 16
  %327 = or i32 %322, %326
  %328 = getelementptr inbounds i8, i8* %312, i64 3
  %329 = load i8, i8* %328, align 1, !tbaa !15
  %330 = zext i8 %329 to i32
  %331 = shl nuw i32 %330, 24
  %332 = or i32 %327, %331
  %333 = mul i32 %332, -1028477379
  %334 = add i32 %333, %311
  %335 = tail call i32 @llvm.fshl.i32(i32 %334, i32 %334, i32 17) #8
  %336 = mul i32 %335, 668265263
  br label %337

337:                                              ; preds = %345, %315
  %338 = phi i64 [ 4, %315 ], [ 1, %345 ]
  %339 = phi i32 [ -4, %315 ], [ -1, %345 ]
  %340 = phi i32 [ %336, %315 ], [ %351, %345 ]
  %341 = getelementptr inbounds i8, i8* %312, i64 %338
  %342 = add i32 %339, %313
  br label %310

343:                                              ; preds = %310
  %344 = icmp eq i32 %313, 0
  br i1 %344, label %352, label %345

345:                                              ; preds = %343
  %346 = load i8, i8* %312, align 1, !tbaa !15
  %347 = zext i8 %346 to i32
  %348 = mul i32 %347, 374761393
  %349 = add i32 %348, %311
  %350 = tail call i32 @llvm.fshl.i32(i32 %349, i32 %349, i32 11) #8
  %351 = mul i32 %350, -1640531535
  br label %337

352:                                              ; preds = %343
  %353 = lshr i32 %311, 15
  %354 = xor i32 %353, %311
  %355 = mul i32 %354, -2048144777
  %356 = lshr i32 %355, 13
  %357 = xor i32 %356, %355
  %358 = mul i32 %357, -1028477379
  %359 = lshr i32 %358, 16
  %360 = xor i32 %359, %358
  %361 = icmp ult i32 %360, 2
  br i1 %361, label %376, label %362

362:                                              ; preds = %352
  %363 = bitcast i8* %179 to i32*
  %364 = load i32, i32* %363, align 4, !tbaa !15
  %365 = bitcast i8* %18 to i16*
  %366 = load i16, i16* %365, align 4, !tbaa !16
  %367 = bitcast i8* %235 to i16*
  %368 = load i16, i16* %367, align 2, !tbaa !18
  %369 = zext i16 %366 to i32
  %370 = xor i32 %364, %369
  %371 = zext i16 %368 to i32
  %372 = xor i32 %370, %371
  %373 = and i32 %372, 1
  %374 = zext i32 %373 to i64
  %375 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__targets_map, i64 0, i64 %374, i32 0, i32 0, i64 0
  br label %376

376:                                              ; preds = %352, %362
  %377 = phi i8* [ %375, %362 ], [ getelementptr inbounds ([64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__config_map, i64 0, i64 1, i32 0, i32 0, i64 0), %352 ]
  %378 = bitcast i8* %179 to i32*
  %379 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 0
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %379, i8* noundef nonnull align 4 dereferenceable(6) %377, i64 6, i1 false)
  %380 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 0
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %380, i8* noundef nonnull align 16 dereferenceable(6) getelementptr inbounds ([64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__config_map, i64 0, i64 0, i32 0, i32 0, i64 0), i64 6, i1 false)
  %381 = getelementptr inbounds i8, i8* %377, i64 8
  %382 = bitcast i8* %381 to i32*
  %383 = load i32, i32* %382, align 4, !tbaa !19
  %384 = tail call i32 @llvm.bswap.i32(i32 %383)
  %385 = bitcast i8* %201 to i32*
  store i32 %384, i32* %385, align 4, !tbaa !15
  %386 = load i32, i32* getelementptr inbounds ([64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__config_map, i64 0, i64 0, i32 1), align 8, !tbaa !19
  %387 = tail call i32 @llvm.bswap.i32(i32 %386)
  store i32 %387, i32* %378, align 4, !tbaa !15
  %388 = bitcast i8* %171 to i16*
  store i16 0, i16* %388, align 2, !tbaa !22
  %389 = bitcast i8* %12 to i32*
  %390 = tail call i32 (i32, i32, i32*, i64, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i32*, i64, i32, ...)*)(i32 noundef 0, i32 noundef 0, i32* noundef nonnull %389, i64 noundef 20, i32 noundef 0) #8
  %391 = lshr i32 %390, 16
  %392 = and i32 %390, 65535
  %393 = add nuw nsw i32 %391, %392
  %394 = lshr i32 %393, 16
  %395 = add nuw nsw i32 %394, %393
  %396 = trunc i32 %395 to i16
  %397 = xor i16 %396, -1
  store i16 %397, i16* %388, align 2, !tbaa !22
  %398 = tail call fastcc i32 @calculate_checksum(i8* noundef %10)
  %399 = add i32 %398, 606290984
  %400 = add i32 %398, -2048144777
  %401 = add i32 %398, 1640531535
  %402 = load i8, i8* %10, align 1, !tbaa !15
  %403 = zext i8 %402 to i32
  %404 = load i8, i8* %47, align 1, !tbaa !15
  %405 = zext i8 %404 to i32
  %406 = shl nuw nsw i32 %405, 8
  %407 = or i32 %406, %403
  %408 = load i8, i8* %52, align 1, !tbaa !15
  %409 = zext i8 %408 to i32
  %410 = shl nuw nsw i32 %409, 16
  %411 = or i32 %407, %410
  %412 = load i8, i8* %57, align 1, !tbaa !15
  %413 = zext i8 %412 to i32
  %414 = shl nuw i32 %413, 24
  %415 = or i32 %411, %414
  %416 = mul i32 %415, -2048144777
  %417 = add i32 %399, %416
  %418 = tail call i32 @llvm.fshl.i32(i32 %417, i32 %417, i32 13) #8
  %419 = mul i32 %418, -1640531535
  %420 = load i8, i8* %66, align 1, !tbaa !15
  %421 = zext i8 %420 to i32
  %422 = load i8, i8* %69, align 1, !tbaa !15
  %423 = zext i8 %422 to i32
  %424 = shl nuw nsw i32 %423, 8
  %425 = or i32 %424, %421
  %426 = load i8, i8* %74, align 1, !tbaa !15
  %427 = zext i8 %426 to i32
  %428 = shl nuw nsw i32 %427, 16
  %429 = or i32 %425, %428
  %430 = load i8, i8* %79, align 1, !tbaa !15
  %431 = zext i8 %430 to i32
  %432 = shl nuw i32 %431, 24
  %433 = or i32 %429, %432
  %434 = mul i32 %433, -2048144777
  %435 = add i32 %400, %434
  %436 = tail call i32 @llvm.fshl.i32(i32 %435, i32 %435, i32 13) #8
  %437 = mul i32 %436, -1640531535
  %438 = load i8, i8* %88, align 1, !tbaa !15
  %439 = zext i8 %438 to i32
  %440 = load i8, i8* %91, align 1, !tbaa !15
  %441 = zext i8 %440 to i32
  %442 = shl nuw nsw i32 %441, 8
  %443 = or i32 %442, %439
  %444 = load i8, i8* %96, align 1, !tbaa !15
  %445 = zext i8 %444 to i32
  %446 = shl nuw nsw i32 %445, 16
  %447 = or i32 %443, %446
  %448 = load i8, i8* %101, align 1, !tbaa !15
  %449 = zext i8 %448 to i32
  %450 = shl nuw i32 %449, 24
  %451 = or i32 %447, %450
  %452 = mul i32 %451, -2048144777
  %453 = add i32 %452, %398
  %454 = tail call i32 @llvm.fshl.i32(i32 %453, i32 %453, i32 13) #8
  %455 = mul i32 %454, -1640531535
  %456 = load i8, i8* %110, align 1, !tbaa !15
  %457 = zext i8 %456 to i32
  %458 = load i8, i8* %113, align 1, !tbaa !15
  %459 = zext i8 %458 to i32
  %460 = shl nuw nsw i32 %459, 8
  %461 = or i32 %460, %457
  %462 = load i8, i8* %12, align 1, !tbaa !15
  %463 = zext i8 %462 to i32
  %464 = shl nuw nsw i32 %463, 16
  %465 = or i32 %461, %464
  %466 = load i8, i8* %122, align 1, !tbaa !15
  %467 = zext i8 %466 to i32
  %468 = shl nuw i32 %467, 24
  %469 = or i32 %465, %468
  %470 = mul i32 %469, -2048144777
  %471 = add i32 %401, %470
  %472 = tail call i32 @llvm.fshl.i32(i32 %471, i32 %471, i32 13) #8
  %473 = mul i32 %472, -1640531535
  %474 = load i8, i8* %44, align 1, !tbaa !15
  %475 = zext i8 %474 to i32
  %476 = load i8, i8* %134, align 1, !tbaa !15
  %477 = zext i8 %476 to i32
  %478 = shl nuw nsw i32 %477, 8
  %479 = or i32 %478, %475
  %480 = load i8, i8* %139, align 1, !tbaa !15
  %481 = zext i8 %480 to i32
  %482 = shl nuw nsw i32 %481, 16
  %483 = or i32 %479, %482
  %484 = load i8, i8* %144, align 1, !tbaa !15
  %485 = zext i8 %484 to i32
  %486 = shl nuw i32 %485, 24
  %487 = or i32 %483, %486
  %488 = mul i32 %487, -2048144777
  %489 = add i32 %488, %419
  %490 = tail call i32 @llvm.fshl.i32(i32 %489, i32 %489, i32 13) #8
  %491 = mul i32 %490, -1640531535
  %492 = load i8, i8* %153, align 1, !tbaa !15
  %493 = zext i8 %492 to i32
  %494 = load i8, i8* %156, align 1, !tbaa !15
  %495 = zext i8 %494 to i32
  %496 = shl nuw nsw i32 %495, 8
  %497 = or i32 %496, %493
  %498 = load i8, i8* %160, align 1, !tbaa !15
  %499 = zext i8 %498 to i32
  %500 = shl nuw nsw i32 %499, 16
  %501 = or i32 %497, %500
  %502 = load i8, i8* %24, align 1, !tbaa !15
  %503 = zext i8 %502 to i32
  %504 = shl nuw i32 %503, 24
  %505 = or i32 %501, %504
  %506 = mul i32 %505, -2048144777
  %507 = add i32 %506, %437
  %508 = tail call i32 @llvm.fshl.i32(i32 %507, i32 %507, i32 13) #8
  %509 = mul i32 %508, -1640531535
  %510 = load i8, i8* %171, align 1, !tbaa !15
  %511 = zext i8 %510 to i32
  %512 = load i8, i8* %174, align 1, !tbaa !15
  %513 = zext i8 %512 to i32
  %514 = shl nuw nsw i32 %513, 8
  %515 = or i32 %514, %511
  %516 = load i8, i8* %179, align 1, !tbaa !15
  %517 = zext i8 %516 to i32
  %518 = shl nuw nsw i32 %517, 16
  %519 = or i32 %515, %518
  %520 = load i8, i8* %184, align 1, !tbaa !15
  %521 = zext i8 %520 to i32
  %522 = shl nuw i32 %521, 24
  %523 = or i32 %519, %522
  %524 = mul i32 %523, -2048144777
  %525 = add i32 %524, %455
  %526 = tail call i32 @llvm.fshl.i32(i32 %525, i32 %525, i32 13) #8
  %527 = mul i32 %526, -1640531535
  %528 = load i8, i8* %193, align 1, !tbaa !15
  %529 = zext i8 %528 to i32
  %530 = load i8, i8* %196, align 1, !tbaa !15
  %531 = zext i8 %530 to i32
  %532 = shl nuw nsw i32 %531, 8
  %533 = or i32 %532, %529
  %534 = load i8, i8* %201, align 1, !tbaa !15
  %535 = zext i8 %534 to i32
  %536 = shl nuw nsw i32 %535, 16
  %537 = or i32 %533, %536
  %538 = load i8, i8* %206, align 1, !tbaa !15
  %539 = zext i8 %538 to i32
  %540 = shl nuw i32 %539, 24
  %541 = or i32 %537, %540
  %542 = mul i32 %541, -2048144777
  %543 = add i32 %542, %473
  %544 = tail call i32 @llvm.fshl.i32(i32 %543, i32 %543, i32 13) #8
  %545 = mul i32 %544, -1640531535
  %546 = load i8, i8* %131, align 1, !tbaa !15
  %547 = zext i8 %546 to i32
  %548 = load i8, i8* %217, align 1, !tbaa !15
  %549 = zext i8 %548 to i32
  %550 = shl nuw nsw i32 %549, 8
  %551 = or i32 %550, %547
  %552 = load i8, i8* %18, align 1, !tbaa !15
  %553 = zext i8 %552 to i32
  %554 = shl nuw nsw i32 %553, 16
  %555 = or i32 %551, %554
  %556 = load i8, i8* %226, align 1, !tbaa !15
  %557 = zext i8 %556 to i32
  %558 = shl nuw i32 %557, 24
  %559 = or i32 %555, %558
  %560 = mul i32 %559, -2048144777
  %561 = add i32 %560, %491
  %562 = tail call i32 @llvm.fshl.i32(i32 %561, i32 %561, i32 13) #8
  %563 = mul i32 %562, -1640531535
  %564 = load i8, i8* %235, align 1, !tbaa !15
  %565 = zext i8 %564 to i32
  %566 = load i8, i8* %238, align 1, !tbaa !15
  %567 = zext i8 %566 to i32
  %568 = shl nuw nsw i32 %567, 8
  %569 = or i32 %568, %565
  %570 = load i8, i8* %243, align 1, !tbaa !15
  %571 = zext i8 %570 to i32
  %572 = shl nuw nsw i32 %571, 16
  %573 = or i32 %569, %572
  %574 = load i8, i8* %248, align 1, !tbaa !15
  %575 = zext i8 %574 to i32
  %576 = shl nuw i32 %575, 24
  %577 = or i32 %573, %576
  %578 = mul i32 %577, -2048144777
  %579 = add i32 %578, %509
  %580 = tail call i32 @llvm.fshl.i32(i32 %579, i32 %579, i32 13) #8
  %581 = mul i32 %580, -1640531535
  %582 = load i8, i8* %257, align 1, !tbaa !15
  %583 = zext i8 %582 to i32
  %584 = load i8, i8* %260, align 1, !tbaa !15
  %585 = zext i8 %584 to i32
  %586 = shl nuw nsw i32 %585, 8
  %587 = or i32 %586, %583
  %588 = load i8, i8* %265, align 1, !tbaa !15
  %589 = zext i8 %588 to i32
  %590 = shl nuw nsw i32 %589, 16
  %591 = or i32 %587, %590
  %592 = load i8, i8* %270, align 1, !tbaa !15
  %593 = zext i8 %592 to i32
  %594 = shl nuw i32 %593, 24
  %595 = or i32 %591, %594
  %596 = mul i32 %595, -2048144777
  %597 = add i32 %596, %527
  %598 = tail call i32 @llvm.fshl.i32(i32 %597, i32 %597, i32 13) #8
  %599 = mul i32 %598, -1640531535
  %600 = load i8, i8* %279, align 1, !tbaa !15
  %601 = zext i8 %600 to i32
  %602 = load i8, i8* %282, align 1, !tbaa !15
  %603 = zext i8 %602 to i32
  %604 = shl nuw nsw i32 %603, 8
  %605 = or i32 %604, %601
  %606 = load i8, i8* %287, align 1, !tbaa !15
  %607 = zext i8 %606 to i32
  %608 = shl nuw nsw i32 %607, 16
  %609 = or i32 %605, %608
  %610 = load i8, i8* %292, align 1, !tbaa !15
  %611 = zext i8 %610 to i32
  %612 = shl nuw i32 %611, 24
  %613 = or i32 %609, %612
  %614 = mul i32 %613, -2048144777
  %615 = add i32 %614, %545
  %616 = tail call i32 @llvm.fshl.i32(i32 %615, i32 %615, i32 13) #8
  %617 = mul i32 %616, -1640531535
  %618 = tail call i32 @llvm.fshl.i32(i32 %563, i32 %563, i32 1) #8
  %619 = tail call i32 @llvm.fshl.i32(i32 %581, i32 %581, i32 7) #8
  %620 = tail call i32 @llvm.fshl.i32(i32 %599, i32 %599, i32 12) #8
  %621 = tail call i32 @llvm.fshl.i32(i32 %617, i32 %617, i32 18) #8
  %622 = add i32 %618, 60
  %623 = add i32 %622, %619
  %624 = add i32 %623, %620
  %625 = add i32 %624, %621
  br label %626

626:                                              ; preds = %653, %376
  %627 = phi i32 [ %625, %376 ], [ %656, %653 ]
  %628 = phi i8* [ %309, %376 ], [ %657, %653 ]
  %629 = phi i32 [ 12, %376 ], [ %658, %653 ]
  %630 = icmp ugt i32 %629, 3
  br i1 %630, label %631, label %659

631:                                              ; preds = %626
  %632 = load i8, i8* %628, align 1, !tbaa !15
  %633 = zext i8 %632 to i32
  %634 = getelementptr inbounds i8, i8* %628, i64 1
  %635 = load i8, i8* %634, align 1, !tbaa !15
  %636 = zext i8 %635 to i32
  %637 = shl nuw nsw i32 %636, 8
  %638 = or i32 %637, %633
  %639 = getelementptr inbounds i8, i8* %628, i64 2
  %640 = load i8, i8* %639, align 1, !tbaa !15
  %641 = zext i8 %640 to i32
  %642 = shl nuw nsw i32 %641, 16
  %643 = or i32 %638, %642
  %644 = getelementptr inbounds i8, i8* %628, i64 3
  %645 = load i8, i8* %644, align 1, !tbaa !15
  %646 = zext i8 %645 to i32
  %647 = shl nuw i32 %646, 24
  %648 = or i32 %643, %647
  %649 = mul i32 %648, -1028477379
  %650 = add i32 %649, %627
  %651 = tail call i32 @llvm.fshl.i32(i32 %650, i32 %650, i32 17) #8
  %652 = mul i32 %651, 668265263
  br label %653

653:                                              ; preds = %661, %631
  %654 = phi i64 [ 4, %631 ], [ 1, %661 ]
  %655 = phi i32 [ -4, %631 ], [ -1, %661 ]
  %656 = phi i32 [ %652, %631 ], [ %667, %661 ]
  %657 = getelementptr inbounds i8, i8* %628, i64 %654
  %658 = add i32 %655, %629
  br label %626

659:                                              ; preds = %626
  %660 = icmp eq i32 %629, 0
  br i1 %660, label %668, label %661

661:                                              ; preds = %659
  %662 = load i8, i8* %628, align 1, !tbaa !15
  %663 = zext i8 %662 to i32
  %664 = mul i32 %663, 374761393
  %665 = add i32 %664, %627
  %666 = tail call i32 @llvm.fshl.i32(i32 %665, i32 %665, i32 11) #8
  %667 = mul i32 %666, -1640531535
  br label %653

668:                                              ; preds = %659
  %669 = lshr i32 %627, 15
  %670 = xor i32 %669, %627
  %671 = mul i32 %670, -2048144777
  %672 = lshr i32 %671, 13
  %673 = xor i32 %672, %671
  %674 = mul i32 %673, -1028477379
  %675 = lshr i32 %674, 16
  %676 = xor i32 %675, %674
  %677 = bitcast i8* %18 to i32*
  store i32 %398, i32* %677, align 1
  %678 = bitcast i8* %243 to i32*
  store i32 %676, i32* %678, align 1
  br label %679

679:                                              ; preds = %33, %668, %20, %30, %23, %14
  %680 = phi i32 [ 1, %14 ], [ 1, %20 ], [ 1, %30 ], [ 2, %23 ], [ 3, %668 ], [ 2, %33 ]
  ret i32 %680
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @_bpf_helper_ext_0006(...) local_unnamed_addr #3

; Function Attrs: inlinehint nofree norecurse nosync nounwind readonly uwtable
define internal fastcc i32 @calculate_checksum(i8* nocapture noundef readonly %0) unnamed_addr #4 {
  %2 = bitcast i8* %0 to <32 x i8>*
  %3 = load <32 x i8>, <32 x i8>* %2, align 1, !tbaa !15
  %4 = zext <32 x i8> %3 to <32 x i32>
  %5 = getelementptr inbounds i8, i8* %0, i64 32
  %6 = bitcast i8* %5 to <16 x i8>*
  %7 = load <16 x i8>, <16 x i8>* %6, align 1, !tbaa !15
  %8 = zext <16 x i8> %7 to <16 x i32>
  %9 = getelementptr inbounds i8, i8* %0, i64 48
  %10 = bitcast i8* %9 to <8 x i8>*
  %11 = load <8 x i8>, <8 x i8>* %10, align 1, !tbaa !15
  %12 = zext <8 x i8> %11 to <8 x i32>
  %13 = getelementptr inbounds i8, i8* %0, i64 56
  %14 = bitcast i8* %13 to <4 x i8>*
  %15 = load <4 x i8>, <4 x i8>* %14, align 1, !tbaa !15
  %16 = zext <4 x i8> %15 to <4 x i32>
  %17 = call i32 @llvm.vector.reduce.add.v32i32(<32 x i32> %4)
  %18 = call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %8)
  %19 = add nuw nsw i32 %17, %18
  %20 = call i32 @llvm.vector.reduce.add.v8i32(<8 x i32> %12)
  %21 = add nuw nsw i32 %19, %20
  %22 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %16)
  %23 = add nuw nsw i32 %21, %22
  ret i32 %23
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #5

declare i32 @_bpf_helper_ext_0028(...) local_unnamed_addr #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #6

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v32i32(<32 x i32>) #7

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v16i32(<16 x i32>) #7

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v8i32(<8 x i32>) #7

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #7

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { inlinehint nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nofree nosync nounwind readnone willreturn }
attributes #8 = { nounwind }

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
!12 = !{!13, !8, i64 9}
!13 = !{!"iphdr", !8, i64 0, !8, i64 0, !8, i64 1, !14, i64 2, !14, i64 4, !14, i64 6, !8, i64 8, !8, i64 9, !14, i64 10, !8, i64 12}
!14 = !{!"short", !8, i64 0}
!15 = !{!8, !8, i64 0}
!16 = !{!17, !14, i64 0}
!17 = !{!"tcphdr", !14, i64 0, !14, i64 2, !10, i64 4, !10, i64 8, !14, i64 12, !14, i64 12, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 14, !14, i64 16, !14, i64 18}
!18 = !{!17, !14, i64 2}
!19 = !{!20, !10, i64 8}
!20 = !{!"ip_mac_pair", !21, i64 0, !10, i64 8}
!21 = !{!"eth_addr", !8, i64 0}
!22 = !{!13, !14, i64 10}

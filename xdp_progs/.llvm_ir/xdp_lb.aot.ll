; ModuleID = 'xdp_lb.bpf.c'
source_filename = "xdp_lb.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.1 = type { [2 x i32]*, i32*, %struct.ip_mac_pair*, [64 x i32]* }
%struct.ip_mac_pair = type { %struct.eth_addr, i32 }
%struct.eth_addr = type { [6 x i8] }
%struct.anon.2 = type { [2 x i32]*, i32*, %struct.ip_mac_pair*, [64 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@__const.xdp_pass.____fmt = private unnamed_addr constant [22 x i8] c"Out of bounds ethhdr\0A\00", align 16
@__const.xdp_pass.____fmt.1 = private unnamed_addr constant [21 x i8] c"Out of bounds iphdr\0A\00", align 16
@__const.xdp_pass.____fmt.2 = private unnamed_addr constant [22 x i8] c"Out of bounds tcphdr\0A\00", align 16
@__const.xdp_pass.____fmt.3 = private unnamed_addr constant [25 x i8] c"Client config not found\0A\00", align 16
@LICENSE = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
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
  %5 = alloca i32, align 4
  %6 = alloca [25 x i8], align 16
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !5
  %9 = inttoptr i64 %8 to i8*
  %10 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !11
  %12 = inttoptr i64 %11 to i8*
  %13 = inttoptr i64 %11 to %struct.ethhdr*
  %14 = getelementptr i8, i8* %12, i64 14
  %15 = icmp ugt i8* %14, %9
  br i1 %15, label %16, label %19

16:                                               ; preds = %1
  %17 = getelementptr inbounds [22 x i8], [22 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %17) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(22) %17, i8* noundef nonnull align 16 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt, i64 0, i64 0), i64 22, i1 false)
  %18 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %17, i64 noundef 22) #8
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %17) #8
  br label %705

19:                                               ; preds = %1
  %20 = getelementptr i8, i8* %12, i64 34
  %21 = icmp ugt i8* %20, %9
  br i1 %21, label %22, label %25

22:                                               ; preds = %19
  %23 = getelementptr inbounds [21 x i8], [21 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %23) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(21) %23, i8* noundef nonnull align 16 dereferenceable(21) getelementptr inbounds ([21 x i8], [21 x i8]* @__const.xdp_pass.____fmt.1, i64 0, i64 0), i64 21, i1 false)
  %24 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %23, i64 noundef 21) #8
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %23) #8
  br label %705

25:                                               ; preds = %19
  %26 = getelementptr i8, i8* %12, i64 23
  %27 = load i8, i8* %26, align 1, !tbaa !12
  %28 = icmp eq i8 %27, 6
  br i1 %28, label %29, label %705

29:                                               ; preds = %25
  %30 = getelementptr i8, i8* %12, i64 54
  %31 = icmp ugt i8* %30, %9
  br i1 %31, label %32, label %35

32:                                               ; preds = %29
  %33 = getelementptr inbounds [22 x i8], [22 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 22, i8* nonnull %33) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(22) %33, i8* noundef nonnull align 16 dereferenceable(22) getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt.2, i64 0, i64 0), i64 22, i1 false)
  %34 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %33, i64 noundef 22) #8
  call void @llvm.lifetime.end.p0i8(i64 22, i8* nonnull %33) #8
  br label %705

35:                                               ; preds = %29
  %36 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %36) #8
  store i32 1, i32* %5, align 4, !tbaa !15
  %37 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %36) #8
  %38 = icmp eq i8* %37, null
  br i1 %38, label %39, label %42

39:                                               ; preds = %35
  %40 = getelementptr inbounds [25 x i8], [25 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %40) #8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(25) %40, i8* noundef nonnull align 16 dereferenceable(25) getelementptr inbounds ([25 x i8], [25 x i8]* @__const.xdp_pass.____fmt.3, i64 0, i64 0), i64 25, i1 false)
  %41 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %40, i64 noundef 25) #8
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %40) #8
  br label %703

42:                                               ; preds = %35
  %43 = getelementptr i8, i8* %12, i64 1200
  %44 = icmp ult i8* %43, %9
  %45 = getelementptr i8, i8* %12, i64 60
  %46 = icmp ugt i8* %45, %9
  %47 = or i1 %44, %46
  br i1 %47, label %703, label %48

48:                                               ; preds = %42
  %49 = call fastcc i32 @calculate_checksum(i8* noundef nonnull %12)
  %50 = add i32 %49, 606290984
  %51 = add i32 %49, -2048144777
  %52 = add i32 %49, 1640531535
  %53 = getelementptr inbounds i8, i8* %12, i64 16
  %54 = load i8, i8* %12, align 1, !tbaa !16
  %55 = zext i8 %54 to i32
  %56 = getelementptr inbounds i8, i8* %12, i64 1
  %57 = load i8, i8* %56, align 1, !tbaa !16
  %58 = zext i8 %57 to i32
  %59 = shl nuw nsw i32 %58, 8
  %60 = or i32 %59, %55
  %61 = getelementptr inbounds i8, i8* %12, i64 2
  %62 = load i8, i8* %61, align 1, !tbaa !16
  %63 = zext i8 %62 to i32
  %64 = shl nuw nsw i32 %63, 16
  %65 = or i32 %60, %64
  %66 = getelementptr inbounds i8, i8* %12, i64 3
  %67 = load i8, i8* %66, align 1, !tbaa !16
  %68 = zext i8 %67 to i32
  %69 = shl nuw i32 %68, 24
  %70 = or i32 %65, %69
  %71 = mul i32 %70, -2048144777
  %72 = add i32 %50, %71
  %73 = call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 13) #8
  %74 = mul i32 %73, -1640531535
  %75 = getelementptr inbounds i8, i8* %12, i64 4
  %76 = load i8, i8* %75, align 1, !tbaa !16
  %77 = zext i8 %76 to i32
  %78 = getelementptr inbounds i8, i8* %12, i64 5
  %79 = load i8, i8* %78, align 1, !tbaa !16
  %80 = zext i8 %79 to i32
  %81 = shl nuw nsw i32 %80, 8
  %82 = or i32 %81, %77
  %83 = getelementptr inbounds i8, i8* %12, i64 6
  %84 = load i8, i8* %83, align 1, !tbaa !16
  %85 = zext i8 %84 to i32
  %86 = shl nuw nsw i32 %85, 16
  %87 = or i32 %82, %86
  %88 = getelementptr inbounds i8, i8* %12, i64 7
  %89 = load i8, i8* %88, align 1, !tbaa !16
  %90 = zext i8 %89 to i32
  %91 = shl nuw i32 %90, 24
  %92 = or i32 %87, %91
  %93 = mul i32 %92, -2048144777
  %94 = add i32 %51, %93
  %95 = call i32 @llvm.fshl.i32(i32 %94, i32 %94, i32 13) #8
  %96 = mul i32 %95, -1640531535
  %97 = getelementptr inbounds i8, i8* %12, i64 8
  %98 = load i8, i8* %97, align 1, !tbaa !16
  %99 = zext i8 %98 to i32
  %100 = getelementptr inbounds i8, i8* %12, i64 9
  %101 = load i8, i8* %100, align 1, !tbaa !16
  %102 = zext i8 %101 to i32
  %103 = shl nuw nsw i32 %102, 8
  %104 = or i32 %103, %99
  %105 = getelementptr inbounds i8, i8* %12, i64 10
  %106 = load i8, i8* %105, align 1, !tbaa !16
  %107 = zext i8 %106 to i32
  %108 = shl nuw nsw i32 %107, 16
  %109 = or i32 %104, %108
  %110 = getelementptr inbounds i8, i8* %12, i64 11
  %111 = load i8, i8* %110, align 1, !tbaa !16
  %112 = zext i8 %111 to i32
  %113 = shl nuw i32 %112, 24
  %114 = or i32 %109, %113
  %115 = mul i32 %114, -2048144777
  %116 = add i32 %115, %49
  %117 = call i32 @llvm.fshl.i32(i32 %116, i32 %116, i32 13) #8
  %118 = mul i32 %117, -1640531535
  %119 = getelementptr inbounds i8, i8* %12, i64 12
  %120 = load i8, i8* %119, align 1, !tbaa !16
  %121 = zext i8 %120 to i32
  %122 = getelementptr inbounds i8, i8* %12, i64 13
  %123 = load i8, i8* %122, align 1, !tbaa !16
  %124 = zext i8 %123 to i32
  %125 = shl nuw nsw i32 %124, 8
  %126 = or i32 %125, %121
  %127 = load i8, i8* %14, align 1, !tbaa !16
  %128 = zext i8 %127 to i32
  %129 = shl nuw nsw i32 %128, 16
  %130 = or i32 %126, %129
  %131 = getelementptr inbounds i8, i8* %12, i64 15
  %132 = load i8, i8* %131, align 1, !tbaa !16
  %133 = zext i8 %132 to i32
  %134 = shl nuw i32 %133, 24
  %135 = or i32 %130, %134
  %136 = mul i32 %135, -2048144777
  %137 = add i32 %52, %136
  %138 = call i32 @llvm.fshl.i32(i32 %137, i32 %137, i32 13) #8
  %139 = mul i32 %138, -1640531535
  %140 = getelementptr inbounds i8, i8* %12, i64 32
  %141 = load i8, i8* %53, align 1, !tbaa !16
  %142 = zext i8 %141 to i32
  %143 = getelementptr inbounds i8, i8* %12, i64 17
  %144 = load i8, i8* %143, align 1, !tbaa !16
  %145 = zext i8 %144 to i32
  %146 = shl nuw nsw i32 %145, 8
  %147 = or i32 %146, %142
  %148 = getelementptr inbounds i8, i8* %12, i64 18
  %149 = load i8, i8* %148, align 1, !tbaa !16
  %150 = zext i8 %149 to i32
  %151 = shl nuw nsw i32 %150, 16
  %152 = or i32 %147, %151
  %153 = getelementptr inbounds i8, i8* %12, i64 19
  %154 = load i8, i8* %153, align 1, !tbaa !16
  %155 = zext i8 %154 to i32
  %156 = shl nuw i32 %155, 24
  %157 = or i32 %152, %156
  %158 = mul i32 %157, -2048144777
  %159 = add i32 %158, %74
  %160 = call i32 @llvm.fshl.i32(i32 %159, i32 %159, i32 13) #8
  %161 = mul i32 %160, -1640531535
  %162 = getelementptr inbounds i8, i8* %12, i64 20
  %163 = load i8, i8* %162, align 1, !tbaa !16
  %164 = zext i8 %163 to i32
  %165 = getelementptr inbounds i8, i8* %12, i64 21
  %166 = load i8, i8* %165, align 1, !tbaa !16
  %167 = zext i8 %166 to i32
  %168 = shl nuw nsw i32 %167, 8
  %169 = or i32 %168, %164
  %170 = getelementptr inbounds i8, i8* %12, i64 22
  %171 = load i8, i8* %170, align 1, !tbaa !16
  %172 = zext i8 %171 to i32
  %173 = shl nuw nsw i32 %172, 16
  %174 = or i32 %169, %173
  %175 = load i8, i8* %26, align 1, !tbaa !16
  %176 = zext i8 %175 to i32
  %177 = shl nuw i32 %176, 24
  %178 = or i32 %174, %177
  %179 = mul i32 %178, -2048144777
  %180 = add i32 %179, %96
  %181 = call i32 @llvm.fshl.i32(i32 %180, i32 %180, i32 13) #8
  %182 = mul i32 %181, -1640531535
  %183 = getelementptr inbounds i8, i8* %12, i64 24
  %184 = load i8, i8* %183, align 1, !tbaa !16
  %185 = zext i8 %184 to i32
  %186 = getelementptr inbounds i8, i8* %12, i64 25
  %187 = load i8, i8* %186, align 1, !tbaa !16
  %188 = zext i8 %187 to i32
  %189 = shl nuw nsw i32 %188, 8
  %190 = or i32 %189, %185
  %191 = getelementptr inbounds i8, i8* %12, i64 26
  %192 = load i8, i8* %191, align 1, !tbaa !16
  %193 = zext i8 %192 to i32
  %194 = shl nuw nsw i32 %193, 16
  %195 = or i32 %190, %194
  %196 = getelementptr inbounds i8, i8* %12, i64 27
  %197 = load i8, i8* %196, align 1, !tbaa !16
  %198 = zext i8 %197 to i32
  %199 = shl nuw i32 %198, 24
  %200 = or i32 %195, %199
  %201 = mul i32 %200, -2048144777
  %202 = add i32 %201, %118
  %203 = call i32 @llvm.fshl.i32(i32 %202, i32 %202, i32 13) #8
  %204 = mul i32 %203, -1640531535
  %205 = getelementptr inbounds i8, i8* %12, i64 28
  %206 = load i8, i8* %205, align 1, !tbaa !16
  %207 = zext i8 %206 to i32
  %208 = getelementptr inbounds i8, i8* %12, i64 29
  %209 = load i8, i8* %208, align 1, !tbaa !16
  %210 = zext i8 %209 to i32
  %211 = shl nuw nsw i32 %210, 8
  %212 = or i32 %211, %207
  %213 = getelementptr inbounds i8, i8* %12, i64 30
  %214 = load i8, i8* %213, align 1, !tbaa !16
  %215 = zext i8 %214 to i32
  %216 = shl nuw nsw i32 %215, 16
  %217 = or i32 %212, %216
  %218 = getelementptr inbounds i8, i8* %12, i64 31
  %219 = load i8, i8* %218, align 1, !tbaa !16
  %220 = zext i8 %219 to i32
  %221 = shl nuw i32 %220, 24
  %222 = or i32 %217, %221
  %223 = mul i32 %222, -2048144777
  %224 = add i32 %223, %139
  %225 = call i32 @llvm.fshl.i32(i32 %224, i32 %224, i32 13) #8
  %226 = mul i32 %225, -1640531535
  %227 = load i8, i8* %140, align 1, !tbaa !16
  %228 = zext i8 %227 to i32
  %229 = getelementptr inbounds i8, i8* %12, i64 33
  %230 = load i8, i8* %229, align 1, !tbaa !16
  %231 = zext i8 %230 to i32
  %232 = shl nuw nsw i32 %231, 8
  %233 = or i32 %232, %228
  %234 = load i8, i8* %20, align 1, !tbaa !16
  %235 = zext i8 %234 to i32
  %236 = shl nuw nsw i32 %235, 16
  %237 = or i32 %233, %236
  %238 = getelementptr inbounds i8, i8* %12, i64 35
  %239 = load i8, i8* %238, align 1, !tbaa !16
  %240 = zext i8 %239 to i32
  %241 = shl nuw i32 %240, 24
  %242 = or i32 %237, %241
  %243 = mul i32 %242, -2048144777
  %244 = add i32 %243, %161
  %245 = call i32 @llvm.fshl.i32(i32 %244, i32 %244, i32 13) #8
  %246 = mul i32 %245, -1640531535
  %247 = getelementptr inbounds i8, i8* %12, i64 36
  %248 = load i8, i8* %247, align 1, !tbaa !16
  %249 = zext i8 %248 to i32
  %250 = getelementptr inbounds i8, i8* %12, i64 37
  %251 = load i8, i8* %250, align 1, !tbaa !16
  %252 = zext i8 %251 to i32
  %253 = shl nuw nsw i32 %252, 8
  %254 = or i32 %253, %249
  %255 = getelementptr inbounds i8, i8* %12, i64 38
  %256 = load i8, i8* %255, align 1, !tbaa !16
  %257 = zext i8 %256 to i32
  %258 = shl nuw nsw i32 %257, 16
  %259 = or i32 %254, %258
  %260 = getelementptr inbounds i8, i8* %12, i64 39
  %261 = load i8, i8* %260, align 1, !tbaa !16
  %262 = zext i8 %261 to i32
  %263 = shl nuw i32 %262, 24
  %264 = or i32 %259, %263
  %265 = mul i32 %264, -2048144777
  %266 = add i32 %265, %182
  %267 = call i32 @llvm.fshl.i32(i32 %266, i32 %266, i32 13) #8
  %268 = mul i32 %267, -1640531535
  %269 = getelementptr inbounds i8, i8* %12, i64 40
  %270 = load i8, i8* %269, align 1, !tbaa !16
  %271 = zext i8 %270 to i32
  %272 = getelementptr inbounds i8, i8* %12, i64 41
  %273 = load i8, i8* %272, align 1, !tbaa !16
  %274 = zext i8 %273 to i32
  %275 = shl nuw nsw i32 %274, 8
  %276 = or i32 %275, %271
  %277 = getelementptr inbounds i8, i8* %12, i64 42
  %278 = load i8, i8* %277, align 1, !tbaa !16
  %279 = zext i8 %278 to i32
  %280 = shl nuw nsw i32 %279, 16
  %281 = or i32 %276, %280
  %282 = getelementptr inbounds i8, i8* %12, i64 43
  %283 = load i8, i8* %282, align 1, !tbaa !16
  %284 = zext i8 %283 to i32
  %285 = shl nuw i32 %284, 24
  %286 = or i32 %281, %285
  %287 = mul i32 %286, -2048144777
  %288 = add i32 %287, %204
  %289 = call i32 @llvm.fshl.i32(i32 %288, i32 %288, i32 13) #8
  %290 = mul i32 %289, -1640531535
  %291 = getelementptr inbounds i8, i8* %12, i64 44
  %292 = load i8, i8* %291, align 1, !tbaa !16
  %293 = zext i8 %292 to i32
  %294 = getelementptr inbounds i8, i8* %12, i64 45
  %295 = load i8, i8* %294, align 1, !tbaa !16
  %296 = zext i8 %295 to i32
  %297 = shl nuw nsw i32 %296, 8
  %298 = or i32 %297, %293
  %299 = getelementptr inbounds i8, i8* %12, i64 46
  %300 = load i8, i8* %299, align 1, !tbaa !16
  %301 = zext i8 %300 to i32
  %302 = shl nuw nsw i32 %301, 16
  %303 = or i32 %298, %302
  %304 = getelementptr inbounds i8, i8* %12, i64 47
  %305 = load i8, i8* %304, align 1, !tbaa !16
  %306 = zext i8 %305 to i32
  %307 = shl nuw i32 %306, 24
  %308 = or i32 %303, %307
  %309 = mul i32 %308, -2048144777
  %310 = add i32 %309, %226
  %311 = call i32 @llvm.fshl.i32(i32 %310, i32 %310, i32 13) #8
  %312 = mul i32 %311, -1640531535
  %313 = call i32 @llvm.fshl.i32(i32 %246, i32 %246, i32 1) #8
  %314 = call i32 @llvm.fshl.i32(i32 %268, i32 %268, i32 7) #8
  %315 = call i32 @llvm.fshl.i32(i32 %290, i32 %290, i32 12) #8
  %316 = call i32 @llvm.fshl.i32(i32 %312, i32 %312, i32 18) #8
  %317 = add i32 %313, 60
  %318 = add i32 %317, %314
  %319 = add i32 %318, %315
  %320 = add i32 %319, %316
  %321 = getelementptr inbounds i8, i8* %12, i64 48
  br label %322

322:                                              ; preds = %349, %48
  %323 = phi i32 [ %320, %48 ], [ %352, %349 ]
  %324 = phi i8* [ %321, %48 ], [ %353, %349 ]
  %325 = phi i32 [ 12, %48 ], [ %354, %349 ]
  %326 = icmp ugt i32 %325, 3
  br i1 %326, label %327, label %355

327:                                              ; preds = %322
  %328 = load i8, i8* %324, align 1, !tbaa !16
  %329 = zext i8 %328 to i32
  %330 = getelementptr inbounds i8, i8* %324, i64 1
  %331 = load i8, i8* %330, align 1, !tbaa !16
  %332 = zext i8 %331 to i32
  %333 = shl nuw nsw i32 %332, 8
  %334 = or i32 %333, %329
  %335 = getelementptr inbounds i8, i8* %324, i64 2
  %336 = load i8, i8* %335, align 1, !tbaa !16
  %337 = zext i8 %336 to i32
  %338 = shl nuw nsw i32 %337, 16
  %339 = or i32 %334, %338
  %340 = getelementptr inbounds i8, i8* %324, i64 3
  %341 = load i8, i8* %340, align 1, !tbaa !16
  %342 = zext i8 %341 to i32
  %343 = shl nuw i32 %342, 24
  %344 = or i32 %339, %343
  %345 = mul i32 %344, -1028477379
  %346 = add i32 %345, %323
  %347 = call i32 @llvm.fshl.i32(i32 %346, i32 %346, i32 17) #8
  %348 = mul i32 %347, 668265263
  br label %349

349:                                              ; preds = %357, %327
  %350 = phi i64 [ 4, %327 ], [ 1, %357 ]
  %351 = phi i32 [ -4, %327 ], [ -1, %357 ]
  %352 = phi i32 [ %348, %327 ], [ %363, %357 ]
  %353 = getelementptr inbounds i8, i8* %324, i64 %350
  %354 = add i32 %351, %325
  br label %322

355:                                              ; preds = %322
  %356 = icmp eq i32 %325, 0
  br i1 %356, label %364, label %357

357:                                              ; preds = %355
  %358 = load i8, i8* %324, align 1, !tbaa !16
  %359 = zext i8 %358 to i32
  %360 = mul i32 %359, 374761393
  %361 = add i32 %360, %323
  %362 = call i32 @llvm.fshl.i32(i32 %361, i32 %361, i32 11) #8
  %363 = mul i32 %362, -1640531535
  br label %349

364:                                              ; preds = %355
  %365 = lshr i32 %323, 15
  %366 = xor i32 %365, %323
  %367 = mul i32 %366, -2048144777
  %368 = lshr i32 %367, 13
  %369 = xor i32 %368, %367
  %370 = mul i32 %369, -1028477379
  %371 = lshr i32 %370, 16
  %372 = xor i32 %371, %370
  %373 = icmp ult i32 %372, 2
  br i1 %373, label %391, label %374

374:                                              ; preds = %364
  %375 = bitcast i8* %191 to i32*
  %376 = load i32, i32* %375, align 4, !tbaa !16
  %377 = bitcast i8* %20 to i16*
  %378 = load i16, i16* %377, align 4, !tbaa !17
  %379 = bitcast i8* %247 to i16*
  %380 = load i16, i16* %379, align 2, !tbaa !19
  %381 = zext i16 %378 to i32
  %382 = xor i32 %376, %381
  %383 = zext i16 %380 to i32
  %384 = xor i32 %382, %383
  %385 = and i32 %384, 1
  store i32 %385, i32* %5, align 4, !tbaa !15
  %386 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %36) #8
  %387 = icmp eq i8* %386, null
  br i1 %387, label %703, label %388

388:                                              ; preds = %374
  store i32 0, i32* %5, align 4, !tbaa !15
  %389 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %36) #8
  %390 = icmp eq i8* %389, null
  br i1 %390, label %703, label %397

391:                                              ; preds = %364
  store i32 1, i32* %5, align 4, !tbaa !15
  %392 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %36) #8
  %393 = icmp eq i8* %392, null
  br i1 %393, label %703, label %394

394:                                              ; preds = %391
  store i32 0, i32* %5, align 4, !tbaa !15
  %395 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %36) #8
  %396 = icmp eq i8* %395, null
  br i1 %396, label %703, label %397

397:                                              ; preds = %394, %388
  %398 = phi i8* [ %386, %388 ], [ %392, %394 ]
  %399 = phi i8* [ %389, %388 ], [ %395, %394 ]
  %400 = bitcast i8* %191 to i32*
  %401 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %401, i8* noundef nonnull align 4 dereferenceable(6) %398, i64 6, i1 false)
  %402 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %13, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 2 dereferenceable(6) %402, i8* noundef nonnull align 4 dereferenceable(6) %399, i64 6, i1 false)
  %403 = getelementptr inbounds i8, i8* %398, i64 8
  %404 = bitcast i8* %403 to i32*
  %405 = load i32, i32* %404, align 4, !tbaa !20
  %406 = call i32 @llvm.bswap.i32(i32 %405)
  %407 = bitcast i8* %213 to i32*
  store i32 %406, i32* %407, align 4, !tbaa !16
  %408 = getelementptr inbounds i8, i8* %399, i64 8
  %409 = bitcast i8* %408 to i32*
  %410 = load i32, i32* %409, align 4, !tbaa !20
  %411 = call i32 @llvm.bswap.i32(i32 %410)
  store i32 %411, i32* %400, align 4, !tbaa !16
  %412 = bitcast i8* %183 to i16*
  store i16 0, i16* %412, align 2, !tbaa !23
  %413 = bitcast i8* %14 to i32*
  %414 = call i32 (i32, i32, i32*, i64, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i32*, i64, i32, ...)*)(i32 noundef 0, i32 noundef 0, i32* noundef nonnull %413, i64 noundef 20, i32 noundef 0) #8
  %415 = lshr i32 %414, 16
  %416 = and i32 %414, 65535
  %417 = add nuw nsw i32 %415, %416
  %418 = lshr i32 %417, 16
  %419 = add nuw nsw i32 %418, %417
  %420 = trunc i32 %419 to i16
  %421 = xor i16 %420, -1
  store i16 %421, i16* %412, align 2, !tbaa !23
  %422 = call fastcc i32 @calculate_checksum(i8* noundef %12)
  %423 = add i32 %422, 606290984
  %424 = add i32 %422, -2048144777
  %425 = add i32 %422, 1640531535
  %426 = load i8, i8* %12, align 1, !tbaa !16
  %427 = zext i8 %426 to i32
  %428 = load i8, i8* %56, align 1, !tbaa !16
  %429 = zext i8 %428 to i32
  %430 = shl nuw nsw i32 %429, 8
  %431 = or i32 %430, %427
  %432 = load i8, i8* %61, align 1, !tbaa !16
  %433 = zext i8 %432 to i32
  %434 = shl nuw nsw i32 %433, 16
  %435 = or i32 %431, %434
  %436 = load i8, i8* %66, align 1, !tbaa !16
  %437 = zext i8 %436 to i32
  %438 = shl nuw i32 %437, 24
  %439 = or i32 %435, %438
  %440 = mul i32 %439, -2048144777
  %441 = add i32 %423, %440
  %442 = call i32 @llvm.fshl.i32(i32 %441, i32 %441, i32 13) #8
  %443 = mul i32 %442, -1640531535
  %444 = load i8, i8* %75, align 1, !tbaa !16
  %445 = zext i8 %444 to i32
  %446 = load i8, i8* %78, align 1, !tbaa !16
  %447 = zext i8 %446 to i32
  %448 = shl nuw nsw i32 %447, 8
  %449 = or i32 %448, %445
  %450 = load i8, i8* %83, align 1, !tbaa !16
  %451 = zext i8 %450 to i32
  %452 = shl nuw nsw i32 %451, 16
  %453 = or i32 %449, %452
  %454 = load i8, i8* %88, align 1, !tbaa !16
  %455 = zext i8 %454 to i32
  %456 = shl nuw i32 %455, 24
  %457 = or i32 %453, %456
  %458 = mul i32 %457, -2048144777
  %459 = add i32 %424, %458
  %460 = call i32 @llvm.fshl.i32(i32 %459, i32 %459, i32 13) #8
  %461 = mul i32 %460, -1640531535
  %462 = load i8, i8* %97, align 1, !tbaa !16
  %463 = zext i8 %462 to i32
  %464 = load i8, i8* %100, align 1, !tbaa !16
  %465 = zext i8 %464 to i32
  %466 = shl nuw nsw i32 %465, 8
  %467 = or i32 %466, %463
  %468 = load i8, i8* %105, align 1, !tbaa !16
  %469 = zext i8 %468 to i32
  %470 = shl nuw nsw i32 %469, 16
  %471 = or i32 %467, %470
  %472 = load i8, i8* %110, align 1, !tbaa !16
  %473 = zext i8 %472 to i32
  %474 = shl nuw i32 %473, 24
  %475 = or i32 %471, %474
  %476 = mul i32 %475, -2048144777
  %477 = add i32 %476, %422
  %478 = call i32 @llvm.fshl.i32(i32 %477, i32 %477, i32 13) #8
  %479 = mul i32 %478, -1640531535
  %480 = load i8, i8* %119, align 1, !tbaa !16
  %481 = zext i8 %480 to i32
  %482 = load i8, i8* %122, align 1, !tbaa !16
  %483 = zext i8 %482 to i32
  %484 = shl nuw nsw i32 %483, 8
  %485 = or i32 %484, %481
  %486 = load i8, i8* %14, align 1, !tbaa !16
  %487 = zext i8 %486 to i32
  %488 = shl nuw nsw i32 %487, 16
  %489 = or i32 %485, %488
  %490 = load i8, i8* %131, align 1, !tbaa !16
  %491 = zext i8 %490 to i32
  %492 = shl nuw i32 %491, 24
  %493 = or i32 %489, %492
  %494 = mul i32 %493, -2048144777
  %495 = add i32 %425, %494
  %496 = call i32 @llvm.fshl.i32(i32 %495, i32 %495, i32 13) #8
  %497 = mul i32 %496, -1640531535
  %498 = load i8, i8* %53, align 1, !tbaa !16
  %499 = zext i8 %498 to i32
  %500 = load i8, i8* %143, align 1, !tbaa !16
  %501 = zext i8 %500 to i32
  %502 = shl nuw nsw i32 %501, 8
  %503 = or i32 %502, %499
  %504 = load i8, i8* %148, align 1, !tbaa !16
  %505 = zext i8 %504 to i32
  %506 = shl nuw nsw i32 %505, 16
  %507 = or i32 %503, %506
  %508 = load i8, i8* %153, align 1, !tbaa !16
  %509 = zext i8 %508 to i32
  %510 = shl nuw i32 %509, 24
  %511 = or i32 %507, %510
  %512 = mul i32 %511, -2048144777
  %513 = add i32 %512, %443
  %514 = call i32 @llvm.fshl.i32(i32 %513, i32 %513, i32 13) #8
  %515 = mul i32 %514, -1640531535
  %516 = load i8, i8* %162, align 1, !tbaa !16
  %517 = zext i8 %516 to i32
  %518 = load i8, i8* %165, align 1, !tbaa !16
  %519 = zext i8 %518 to i32
  %520 = shl nuw nsw i32 %519, 8
  %521 = or i32 %520, %517
  %522 = load i8, i8* %170, align 1, !tbaa !16
  %523 = zext i8 %522 to i32
  %524 = shl nuw nsw i32 %523, 16
  %525 = or i32 %521, %524
  %526 = load i8, i8* %26, align 1, !tbaa !16
  %527 = zext i8 %526 to i32
  %528 = shl nuw i32 %527, 24
  %529 = or i32 %525, %528
  %530 = mul i32 %529, -2048144777
  %531 = add i32 %530, %461
  %532 = call i32 @llvm.fshl.i32(i32 %531, i32 %531, i32 13) #8
  %533 = mul i32 %532, -1640531535
  %534 = load i8, i8* %183, align 1, !tbaa !16
  %535 = zext i8 %534 to i32
  %536 = load i8, i8* %186, align 1, !tbaa !16
  %537 = zext i8 %536 to i32
  %538 = shl nuw nsw i32 %537, 8
  %539 = or i32 %538, %535
  %540 = load i8, i8* %191, align 1, !tbaa !16
  %541 = zext i8 %540 to i32
  %542 = shl nuw nsw i32 %541, 16
  %543 = or i32 %539, %542
  %544 = load i8, i8* %196, align 1, !tbaa !16
  %545 = zext i8 %544 to i32
  %546 = shl nuw i32 %545, 24
  %547 = or i32 %543, %546
  %548 = mul i32 %547, -2048144777
  %549 = add i32 %548, %479
  %550 = call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 13) #8
  %551 = mul i32 %550, -1640531535
  %552 = load i8, i8* %205, align 1, !tbaa !16
  %553 = zext i8 %552 to i32
  %554 = load i8, i8* %208, align 1, !tbaa !16
  %555 = zext i8 %554 to i32
  %556 = shl nuw nsw i32 %555, 8
  %557 = or i32 %556, %553
  %558 = load i8, i8* %213, align 1, !tbaa !16
  %559 = zext i8 %558 to i32
  %560 = shl nuw nsw i32 %559, 16
  %561 = or i32 %557, %560
  %562 = load i8, i8* %218, align 1, !tbaa !16
  %563 = zext i8 %562 to i32
  %564 = shl nuw i32 %563, 24
  %565 = or i32 %561, %564
  %566 = mul i32 %565, -2048144777
  %567 = add i32 %566, %497
  %568 = call i32 @llvm.fshl.i32(i32 %567, i32 %567, i32 13) #8
  %569 = mul i32 %568, -1640531535
  %570 = load i8, i8* %140, align 1, !tbaa !16
  %571 = zext i8 %570 to i32
  %572 = load i8, i8* %229, align 1, !tbaa !16
  %573 = zext i8 %572 to i32
  %574 = shl nuw nsw i32 %573, 8
  %575 = or i32 %574, %571
  %576 = load i8, i8* %20, align 1, !tbaa !16
  %577 = zext i8 %576 to i32
  %578 = shl nuw nsw i32 %577, 16
  %579 = or i32 %575, %578
  %580 = load i8, i8* %238, align 1, !tbaa !16
  %581 = zext i8 %580 to i32
  %582 = shl nuw i32 %581, 24
  %583 = or i32 %579, %582
  %584 = mul i32 %583, -2048144777
  %585 = add i32 %584, %515
  %586 = call i32 @llvm.fshl.i32(i32 %585, i32 %585, i32 13) #8
  %587 = mul i32 %586, -1640531535
  %588 = load i8, i8* %247, align 1, !tbaa !16
  %589 = zext i8 %588 to i32
  %590 = load i8, i8* %250, align 1, !tbaa !16
  %591 = zext i8 %590 to i32
  %592 = shl nuw nsw i32 %591, 8
  %593 = or i32 %592, %589
  %594 = load i8, i8* %255, align 1, !tbaa !16
  %595 = zext i8 %594 to i32
  %596 = shl nuw nsw i32 %595, 16
  %597 = or i32 %593, %596
  %598 = load i8, i8* %260, align 1, !tbaa !16
  %599 = zext i8 %598 to i32
  %600 = shl nuw i32 %599, 24
  %601 = or i32 %597, %600
  %602 = mul i32 %601, -2048144777
  %603 = add i32 %602, %533
  %604 = call i32 @llvm.fshl.i32(i32 %603, i32 %603, i32 13) #8
  %605 = mul i32 %604, -1640531535
  %606 = load i8, i8* %269, align 1, !tbaa !16
  %607 = zext i8 %606 to i32
  %608 = load i8, i8* %272, align 1, !tbaa !16
  %609 = zext i8 %608 to i32
  %610 = shl nuw nsw i32 %609, 8
  %611 = or i32 %610, %607
  %612 = load i8, i8* %277, align 1, !tbaa !16
  %613 = zext i8 %612 to i32
  %614 = shl nuw nsw i32 %613, 16
  %615 = or i32 %611, %614
  %616 = load i8, i8* %282, align 1, !tbaa !16
  %617 = zext i8 %616 to i32
  %618 = shl nuw i32 %617, 24
  %619 = or i32 %615, %618
  %620 = mul i32 %619, -2048144777
  %621 = add i32 %620, %551
  %622 = call i32 @llvm.fshl.i32(i32 %621, i32 %621, i32 13) #8
  %623 = mul i32 %622, -1640531535
  %624 = load i8, i8* %291, align 1, !tbaa !16
  %625 = zext i8 %624 to i32
  %626 = load i8, i8* %294, align 1, !tbaa !16
  %627 = zext i8 %626 to i32
  %628 = shl nuw nsw i32 %627, 8
  %629 = or i32 %628, %625
  %630 = load i8, i8* %299, align 1, !tbaa !16
  %631 = zext i8 %630 to i32
  %632 = shl nuw nsw i32 %631, 16
  %633 = or i32 %629, %632
  %634 = load i8, i8* %304, align 1, !tbaa !16
  %635 = zext i8 %634 to i32
  %636 = shl nuw i32 %635, 24
  %637 = or i32 %633, %636
  %638 = mul i32 %637, -2048144777
  %639 = add i32 %638, %569
  %640 = call i32 @llvm.fshl.i32(i32 %639, i32 %639, i32 13) #8
  %641 = mul i32 %640, -1640531535
  %642 = call i32 @llvm.fshl.i32(i32 %587, i32 %587, i32 1) #8
  %643 = call i32 @llvm.fshl.i32(i32 %605, i32 %605, i32 7) #8
  %644 = call i32 @llvm.fshl.i32(i32 %623, i32 %623, i32 12) #8
  %645 = call i32 @llvm.fshl.i32(i32 %641, i32 %641, i32 18) #8
  %646 = add i32 %642, 60
  %647 = add i32 %646, %643
  %648 = add i32 %647, %644
  %649 = add i32 %648, %645
  br label %650

650:                                              ; preds = %677, %397
  %651 = phi i32 [ %649, %397 ], [ %680, %677 ]
  %652 = phi i8* [ %321, %397 ], [ %681, %677 ]
  %653 = phi i32 [ 12, %397 ], [ %682, %677 ]
  %654 = icmp ugt i32 %653, 3
  br i1 %654, label %655, label %683

655:                                              ; preds = %650
  %656 = load i8, i8* %652, align 1, !tbaa !16
  %657 = zext i8 %656 to i32
  %658 = getelementptr inbounds i8, i8* %652, i64 1
  %659 = load i8, i8* %658, align 1, !tbaa !16
  %660 = zext i8 %659 to i32
  %661 = shl nuw nsw i32 %660, 8
  %662 = or i32 %661, %657
  %663 = getelementptr inbounds i8, i8* %652, i64 2
  %664 = load i8, i8* %663, align 1, !tbaa !16
  %665 = zext i8 %664 to i32
  %666 = shl nuw nsw i32 %665, 16
  %667 = or i32 %662, %666
  %668 = getelementptr inbounds i8, i8* %652, i64 3
  %669 = load i8, i8* %668, align 1, !tbaa !16
  %670 = zext i8 %669 to i32
  %671 = shl nuw i32 %670, 24
  %672 = or i32 %667, %671
  %673 = mul i32 %672, -1028477379
  %674 = add i32 %673, %651
  %675 = call i32 @llvm.fshl.i32(i32 %674, i32 %674, i32 17) #8
  %676 = mul i32 %675, 668265263
  br label %677

677:                                              ; preds = %685, %655
  %678 = phi i64 [ 4, %655 ], [ 1, %685 ]
  %679 = phi i32 [ -4, %655 ], [ -1, %685 ]
  %680 = phi i32 [ %676, %655 ], [ %691, %685 ]
  %681 = getelementptr inbounds i8, i8* %652, i64 %678
  %682 = add i32 %679, %653
  br label %650

683:                                              ; preds = %650
  %684 = icmp eq i32 %653, 0
  br i1 %684, label %692, label %685

685:                                              ; preds = %683
  %686 = load i8, i8* %652, align 1, !tbaa !16
  %687 = zext i8 %686 to i32
  %688 = mul i32 %687, 374761393
  %689 = add i32 %688, %651
  %690 = call i32 @llvm.fshl.i32(i32 %689, i32 %689, i32 11) #8
  %691 = mul i32 %690, -1640531535
  br label %677

692:                                              ; preds = %683
  %693 = lshr i32 %651, 15
  %694 = xor i32 %693, %651
  %695 = mul i32 %694, -2048144777
  %696 = lshr i32 %695, 13
  %697 = xor i32 %696, %695
  %698 = mul i32 %697, -1028477379
  %699 = lshr i32 %698, 16
  %700 = xor i32 %699, %698
  %701 = bitcast i8* %20 to i32*
  store i32 %422, i32* %701, align 1
  %702 = bitcast i8* %255 to i32*
  store i32 %700, i32* %702, align 1
  br label %703

703:                                              ; preds = %692, %42, %374, %388, %391, %394, %39
  %704 = phi i32 [ 0, %39 ], [ 3, %692 ], [ 2, %42 ], [ 0, %374 ], [ 0, %388 ], [ 0, %391 ], [ 0, %394 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %36) #8
  br label %705

705:                                              ; preds = %22, %703, %32, %25, %16
  %706 = phi i32 [ 1, %16 ], [ 1, %22 ], [ 1, %32 ], [ %704, %703 ], [ 2, %25 ]
  ret i32 %706
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @_bpf_helper_ext_0006(...) local_unnamed_addr #3

; Function Attrs: inlinehint nofree norecurse nosync nounwind readonly uwtable
define internal fastcc i32 @calculate_checksum(i8* nocapture noundef readonly %0) unnamed_addr #4 {
  %2 = bitcast i8* %0 to <32 x i8>*
  %3 = load <32 x i8>, <32 x i8>* %2, align 1, !tbaa !16
  %4 = zext <32 x i8> %3 to <32 x i32>
  %5 = getelementptr inbounds i8, i8* %0, i64 32
  %6 = bitcast i8* %5 to <16 x i8>*
  %7 = load <16 x i8>, <16 x i8>* %6, align 1, !tbaa !16
  %8 = zext <16 x i8> %7 to <16 x i32>
  %9 = getelementptr inbounds i8, i8* %0, i64 48
  %10 = bitcast i8* %9 to <8 x i8>*
  %11 = load <8 x i8>, <8 x i8>* %10, align 1, !tbaa !16
  %12 = zext <8 x i8> %11 to <8 x i32>
  %13 = getelementptr inbounds i8, i8* %0, i64 56
  %14 = bitcast i8* %13 to <4 x i8>*
  %15 = load <4 x i8>, <4 x i8>* %14, align 1, !tbaa !16
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

declare i8* @_bpf_helper_ext_0001(...) local_unnamed_addr #3

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
!15 = !{!10, !10, i64 0}
!16 = !{!8, !8, i64 0}
!17 = !{!18, !14, i64 0}
!18 = !{!"tcphdr", !14, i64 0, !14, i64 2, !10, i64 4, !10, i64 8, !14, i64 12, !14, i64 12, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 14, !14, i64 16, !14, i64 18}
!19 = !{!18, !14, i64 2}
!20 = !{!21, !10, i64 8}
!21 = !{!"ip_mac_pair", !22, i64 0, !10, i64 8}
!22 = !{!"eth_addr", !8, i64 0}
!23 = !{!13, !14, i64 10}

; ModuleID = 'xdp_firewall.bpf.c'
source_filename = "xdp_firewall.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.vrrp_filter = type { i32, i64, i64, i64, i64 }
%struct.bpftime_hash_map_t = type { i32, i32, i32, i8* }
%struct.anon = type { [5 x i32]*, %struct.flow_key*, i64*, [32768 x i32]*, [1 x i32]* }
%struct.flow_key = type { %union.anon, i32, [4 x i8] }
%union.anon = type { [4 x i32] }
%struct.anon.0 = type { [6 x i32]*, i32*, %struct.vrrp_filter*, [256 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.vrrphdr = type { i8, i8, i8, i8, %union.anon.4, i16 }
%union.anon.4 = type { %struct.anon.6 }
%struct.anon.6 = type { i16 }

@__vrrp_vrid_filter = dso_local local_unnamed_addr global [256 x %struct.vrrp_filter] zeroinitializer, align 16
@__l3_filter_data = dso_local global [1179648 x i8] zeroinitializer, align 16
@__l3_filter = dso_local local_unnamed_addr global %struct.bpftime_hash_map_t { i32 32768, i32 24, i32 8, i8* getelementptr inbounds ([1179648 x i8], [1179648 x i8]* @__l3_filter_data, i32 0, i32 0) }, align 8
@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@l3_filter = dso_local local_unnamed_addr global %struct.anon zeroinitializer, align 8
@vrrp_vrid_filter = dso_local local_unnamed_addr global %struct.anon.0 zeroinitializer, align 8
@__const.layer3_filter.____fmt = private unnamed_addr constant [24 x i8] c"only ipv4 is supported\0A\00", align 16

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
  %2 = alloca %struct.flow_key, align 8
  %3 = alloca [24 x i8], align 16
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %5 = load i64, i64* %4, align 8, !tbaa !5
  %6 = inttoptr i64 %5 to i8*
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %8 = load i64, i64* %7, align 8, !tbaa !11
  %9 = inttoptr i64 %8 to i8*
  %10 = inttoptr i64 %8 to %struct.ethhdr*
  %11 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 14
  %12 = icmp ugt i8* %11, %6
  br i1 %12, label %237, label %13

13:                                               ; preds = %1
  %14 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 2
  %15 = load i16, i16* %14, align 2, !tbaa !12
  switch i16 %15, label %23 [
    i16 -22392, label %16
    i16 129, label %16
  ]

16:                                               ; preds = %13, %13
  %17 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 18
  %18 = icmp ugt i8* %17, %6
  br i1 %18, label %237, label %19

19:                                               ; preds = %16
  %20 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 16
  %21 = bitcast i8* %20 to i16*
  %22 = load i16, i16* %21, align 2, !tbaa !15
  br label %23

23:                                               ; preds = %19, %13
  %24 = phi i16 [ %22, %19 ], [ %15, %13 ]
  %25 = phi i8 [ 18, %19 ], [ 14, %13 ]
  switch i16 %24, label %37 [
    i16 -22392, label %26
    i16 129, label %26
  ]

26:                                               ; preds = %23, %23
  %27 = add nuw nsw i8 %25, 4
  %28 = zext i8 %27 to i64
  %29 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 %28
  %30 = icmp ugt i8* %29, %6
  br i1 %30, label %237, label %31

31:                                               ; preds = %26
  %32 = zext i8 %25 to i64
  %33 = getelementptr %struct.ethhdr, %struct.ethhdr* %10, i64 0, i32 0, i64 %32
  %34 = getelementptr inbounds i8, i8* %33, i64 2
  %35 = bitcast i8* %34 to i16*
  %36 = load i16, i16* %35, align 2, !tbaa !15
  br label %37

37:                                               ; preds = %31, %23
  %38 = phi i16 [ %36, %31 ], [ %24, %23 ]
  %39 = phi i8 [ %27, %31 ], [ %25, %23 ]
  %40 = tail call i16 @llvm.bswap.i16(i16 %38) #5
  %41 = bitcast %struct.flow_key* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %41) #5
  %42 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 1
  %43 = bitcast i32* %42 to i64*
  store i64 2048, i64* %43, align 8
  switch i16 %40, label %219 [
    i16 2048, label %44
    i16 -31011, label %81
  ]

44:                                               ; preds = %37
  %45 = zext i8 %39 to i64
  %46 = getelementptr i8, i8* %9, i64 %45
  %47 = getelementptr i8, i8* %46, i64 20
  %48 = icmp ugt i8* %47, %6
  br i1 %48, label %219, label %49

49:                                               ; preds = %44
  %50 = getelementptr inbounds i8, i8* %46, i64 2
  %51 = bitcast i8* %50 to i16*
  %52 = load i16, i16* %51, align 2, !tbaa !17
  %53 = tail call i16 @llvm.bswap.i16(i16 %52) #5
  %54 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 0, i32 0, i64 3
  store i32 0, i32* %54, align 4, !tbaa !19
  %55 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 0, i32 0, i64 2
  store i32 0, i32* %55, align 8, !tbaa !19
  %56 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 0, i32 0, i64 1
  store i32 0, i32* %56, align 4, !tbaa !19
  %57 = getelementptr inbounds i8, i8* %46, i64 12
  %58 = getelementptr inbounds i8, i8* %57, i64 4
  %59 = bitcast i8* %58 to i32*
  %60 = load i32, i32* %59, align 4, !tbaa !19
  %61 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %2, i64 0, i32 0, i32 0, i64 0
  store i32 %60, i32* %61, align 8, !tbaa !19
  %62 = getelementptr inbounds i8, i8* %46, i64 9
  %63 = load i8, i8* %62, align 1, !tbaa !20
  switch i8 %63, label %84 [
    i8 112, label %64
    i8 51, label %68
  ]

64:                                               ; preds = %49
  %65 = bitcast i8* %47 to %struct.vrrphdr*
  %66 = getelementptr inbounds i8, i8* %47, i64 8
  %67 = icmp ugt i8* %66, %6
  br i1 %67, label %218, label %84

68:                                               ; preds = %49
  %69 = getelementptr inbounds i8, i8* %47, i64 12
  %70 = icmp ugt i8* %69, %6
  br i1 %70, label %219, label %71

71:                                               ; preds = %68
  %72 = load i8, i8* %47, align 4, !tbaa !21
  %73 = icmp eq i8 %72, 112
  br i1 %73, label %74, label %84

74:                                               ; preds = %71
  %75 = add nuw nsw i64 %45, 20
  %76 = getelementptr i8, i8* %9, i64 %75
  %77 = getelementptr i8, i8* %76, i64 12
  %78 = bitcast i8* %77 to %struct.vrrphdr*
  %79 = getelementptr inbounds i8, i8* %77, i64 8
  %80 = icmp ugt i8* %79, %6
  br i1 %80, label %218, label %84

81:                                               ; preds = %37
  %82 = getelementptr inbounds [24 x i8], [24 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %82) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %82, i8* noundef nonnull align 16 dereferenceable(24) getelementptr inbounds ([24 x i8], [24 x i8]* @__const.layer3_filter.____fmt, i64 0, i64 0), i64 24, i1 false) #5
  %83 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef nonnull %82, i64 noundef 24) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %82) #5
  br label %218

84:                                               ; preds = %74, %71, %64, %49
  %85 = phi %struct.vrrphdr* [ %65, %64 ], [ %78, %74 ], [ null, %71 ], [ null, %49 ]
  %86 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 1), align 4, !tbaa !23
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %180, label %88

88:                                               ; preds = %84
  %89 = zext i32 %86 to i64
  %90 = and i32 %60, 255
  %91 = icmp eq i32 %86, 1
  br i1 %91, label %146, label %92, !llvm.loop !26

92:                                               ; preds = %88
  %93 = add nsw i64 %89, -1
  %94 = add nsw i64 %89, -2
  %95 = and i64 %93, 3
  %96 = icmp ult i64 %94, 3
  br i1 %96, label %129, label %97

97:                                               ; preds = %92
  %98 = and i64 %93, -4
  br label %99

99:                                               ; preds = %99, %97
  %100 = phi i64 [ 1, %97 ], [ %126, %99 ]
  %101 = phi i32 [ %90, %97 ], [ %125, %99 ]
  %102 = phi i64 [ 0, %97 ], [ %127, %99 ]
  %103 = getelementptr inbounds i8, i8* %41, i64 %100
  %104 = load i8, i8* %103, align 1, !tbaa !19
  %105 = mul i32 %101, 31
  %106 = zext i8 %104 to i32
  %107 = add i32 %105, %106
  %108 = add nuw nsw i64 %100, 1
  %109 = getelementptr inbounds i8, i8* %41, i64 %108
  %110 = load i8, i8* %109, align 1, !tbaa !19
  %111 = mul i32 %107, 31
  %112 = zext i8 %110 to i32
  %113 = add i32 %111, %112
  %114 = add nuw nsw i64 %100, 2
  %115 = getelementptr inbounds i8, i8* %41, i64 %114
  %116 = load i8, i8* %115, align 1, !tbaa !19
  %117 = mul i32 %113, 31
  %118 = zext i8 %116 to i32
  %119 = add i32 %117, %118
  %120 = add nuw nsw i64 %100, 3
  %121 = getelementptr inbounds i8, i8* %41, i64 %120
  %122 = load i8, i8* %121, align 1, !tbaa !19
  %123 = mul i32 %119, 31
  %124 = zext i8 %122 to i32
  %125 = add i32 %123, %124
  %126 = add nuw nsw i64 %100, 4
  %127 = add i64 %102, 4
  %128 = icmp eq i64 %127, %98
  br i1 %128, label %129, label %99, !llvm.loop !26

129:                                              ; preds = %99, %92
  %130 = phi i32 [ undef, %92 ], [ %125, %99 ]
  %131 = phi i64 [ 1, %92 ], [ %126, %99 ]
  %132 = phi i32 [ %90, %92 ], [ %125, %99 ]
  %133 = icmp eq i64 %95, 0
  br i1 %133, label %146, label %134

134:                                              ; preds = %129, %134
  %135 = phi i64 [ %143, %134 ], [ %131, %129 ]
  %136 = phi i32 [ %142, %134 ], [ %132, %129 ]
  %137 = phi i64 [ %144, %134 ], [ 0, %129 ]
  %138 = getelementptr inbounds i8, i8* %41, i64 %135
  %139 = load i8, i8* %138, align 1, !tbaa !19
  %140 = mul i32 %136, 31
  %141 = zext i8 %139 to i32
  %142 = add i32 %140, %141
  %143 = add nuw nsw i64 %135, 1
  %144 = add i64 %137, 1
  %145 = icmp eq i64 %144, %95
  br i1 %145, label %146, label %134, !llvm.loop !28

146:                                              ; preds = %129, %134, %88
  %147 = phi i32 [ %90, %88 ], [ %130, %129 ], [ %142, %134 ]
  %148 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 0), align 8, !tbaa !30
  %149 = urem i32 %147, %148
  %150 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3), align 8, !tbaa !31
  %151 = add i32 %86, 4
  %152 = load i32, i32* getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 2), align 8, !tbaa !32
  %153 = add i32 %152, %151
  br label %154

154:                                              ; preds = %176, %146
  %155 = phi i32 [ %178, %176 ], [ %149, %146 ]
  %156 = mul i32 %155, %153
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds i8, i8* %150, i64 %157
  %159 = bitcast i8* %158 to i32*
  %160 = load i32, i32* %159, align 4, !tbaa !33
  %161 = icmp eq i32 %160, 0
  br i1 %161, label %195, label %162

162:                                              ; preds = %154
  %163 = add i32 %156, 4
  %164 = zext i32 %163 to i64
  %165 = getelementptr inbounds i8, i8* %150, i64 %164
  br label %168

166:                                              ; preds = %168
  %167 = icmp eq i64 %175, %89
  br i1 %167, label %185, label %168, !llvm.loop !34

168:                                              ; preds = %166, %162
  %169 = phi i64 [ 0, %162 ], [ %175, %166 ]
  %170 = getelementptr inbounds i8, i8* %165, i64 %169
  %171 = load i8, i8* %170, align 1, !tbaa !19
  %172 = getelementptr inbounds i8, i8* %41, i64 %169
  %173 = load i8, i8* %172, align 1, !tbaa !19
  %174 = icmp eq i8 %171, %173
  %175 = add nuw nsw i64 %169, 1
  br i1 %174, label %166, label %176

176:                                              ; preds = %168
  %177 = add i32 %155, 1
  %178 = urem i32 %177, %148
  %179 = icmp eq i32 %178, %149
  br i1 %179, label %195, label %154, !llvm.loop !35

180:                                              ; preds = %84
  %181 = load i8*, i8** getelementptr inbounds (%struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* @__l3_filter, i64 0, i32 3), align 8, !tbaa !31
  %182 = bitcast i8* %181 to i32*
  %183 = load i32, i32* %182, align 4, !tbaa !33
  %184 = icmp eq i32 %183, 0
  br i1 %184, label %195, label %188

185:                                              ; preds = %166
  %186 = add i32 %156, %151
  %187 = zext i32 %186 to i64
  br label %188

188:                                              ; preds = %185, %180
  %189 = phi i8* [ %181, %180 ], [ %150, %185 ]
  %190 = phi i64 [ 4, %180 ], [ %187, %185 ]
  %191 = getelementptr inbounds i8, i8* %189, i64 %190
  %192 = bitcast i8* %191 to i64*
  %193 = load i64, i64* %192, align 8, !tbaa !36
  %194 = add i64 %193, 1
  store i64 %194, i64* %192, align 8, !tbaa !36
  br label %218

195:                                              ; preds = %176, %154, %180
  %196 = icmp eq %struct.vrrphdr* %85, null
  br i1 %196, label %219, label %197

197:                                              ; preds = %195
  %198 = getelementptr %struct.vrrphdr, %struct.vrrphdr* %85, i64 0, i32 1
  %199 = load i8, i8* %198, align 1, !tbaa !37
  %200 = zext i8 %199 to i64
  %201 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %200, i32 2
  %202 = load i64, i64* %201, align 8, !tbaa !39
  %203 = add i64 %202, 1
  store i64 %203, i64* %201, align 8, !tbaa !39
  %204 = zext i16 %53 to i64
  %205 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %200, i32 4
  %206 = load i64, i64* %205, align 8, !tbaa !41
  %207 = add i64 %206, %204
  store i64 %207, i64* %205, align 8, !tbaa !41
  %208 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %200, i32 0
  %209 = load i32, i32* %208, align 8, !tbaa !42
  %210 = icmp eq i32 %209, 0
  br i1 %210, label %211, label %219

211:                                              ; preds = %197
  %212 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %200, i32 1
  %213 = load i64, i64* %212, align 8, !tbaa !43
  %214 = add i64 %213, 1
  store i64 %214, i64* %212, align 8, !tbaa !43
  %215 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %200, i32 3
  %216 = load i64, i64* %215, align 8, !tbaa !44
  %217 = add i64 %216, %204
  store i64 %217, i64* %215, align 8, !tbaa !44
  br label %218

218:                                              ; preds = %64, %74, %81, %188, %211
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %41) #5
  br label %237

219:                                              ; preds = %44, %68, %37, %195, %197
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %41) #5
  %220 = inttoptr i64 %8 to i16*
  %221 = load i16, i16* %220, align 2, !tbaa !45
  %222 = getelementptr inbounds i8, i8* %9, i64 2
  %223 = bitcast i8* %222 to i16*
  %224 = load i16, i16* %223, align 2, !tbaa !45
  %225 = getelementptr inbounds i8, i8* %9, i64 4
  %226 = bitcast i8* %225 to i16*
  %227 = load i16, i16* %226, align 2, !tbaa !45
  %228 = getelementptr inbounds i8, i8* %9, i64 6
  %229 = bitcast i8* %228 to i16*
  %230 = load i16, i16* %229, align 2, !tbaa !45
  store i16 %230, i16* %220, align 2, !tbaa !45
  %231 = getelementptr inbounds i8, i8* %9, i64 8
  %232 = bitcast i8* %231 to i16*
  %233 = load i16, i16* %232, align 2, !tbaa !45
  store i16 %233, i16* %223, align 2, !tbaa !45
  %234 = getelementptr inbounds i8, i8* %9, i64 10
  %235 = bitcast i8* %234 to i16*
  %236 = load i16, i16* %235, align 2, !tbaa !45
  store i16 %236, i16* %226, align 2, !tbaa !45
  store i16 %221, i16* %229, align 2, !tbaa !45
  store i16 %224, i16* %232, align 2, !tbaa !45
  store i16 %227, i16* %235, align 2, !tbaa !45
  br label %237

237:                                              ; preds = %26, %16, %1, %218, %219
  %238 = phi i32 [ 3, %219 ], [ 1, %218 ], [ 2, %1 ], [ 2, %16 ], [ 2, %26 ]
  ret i32 %238
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @_bpf_helper_ext_0006(...) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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
!15 = !{!16, !14, i64 2}
!16 = !{!"_vlan_hdr", !14, i64 0, !14, i64 2}
!17 = !{!18, !14, i64 2}
!18 = !{!"iphdr", !8, i64 0, !8, i64 0, !8, i64 1, !14, i64 2, !14, i64 4, !14, i64 6, !8, i64 8, !8, i64 9, !14, i64 10, !8, i64 12}
!19 = !{!8, !8, i64 0}
!20 = !{!18, !8, i64 9}
!21 = !{!22, !8, i64 0}
!22 = !{!"ip_auth_hdr", !8, i64 0, !8, i64 1, !14, i64 2, !10, i64 4, !10, i64 8, !8, i64 12}
!23 = !{!24, !10, i64 4}
!24 = !{!"", !10, i64 0, !10, i64 4, !10, i64 8, !25, i64 16}
!25 = !{!"any pointer", !8, i64 0}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.mustprogress"}
!28 = distinct !{!28, !29}
!29 = !{!"llvm.loop.unroll.disable"}
!30 = !{!24, !10, i64 0}
!31 = !{!24, !25, i64 16}
!32 = !{!24, !10, i64 8}
!33 = !{!10, !10, i64 0}
!34 = distinct !{!34, !27}
!35 = distinct !{!35, !27}
!36 = !{!7, !7, i64 0}
!37 = !{!38, !8, i64 1}
!38 = !{!"vrrphdr", !8, i64 0, !8, i64 1, !8, i64 2, !8, i64 3, !8, i64 4, !14, i64 6}
!39 = !{!40, !7, i64 16}
!40 = !{!"vrrp_filter", !10, i64 0, !7, i64 8, !7, i64 16, !7, i64 24, !7, i64 32}
!41 = !{!40, !7, i64 32}
!42 = !{!40, !10, i64 0}
!43 = !{!40, !7, i64 8}
!44 = !{!40, !7, i64 24}
!45 = !{!14, !14, i64 0}

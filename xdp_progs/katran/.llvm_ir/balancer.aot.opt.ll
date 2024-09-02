; ModuleID = 'lib-aot/bpf/balancer.bpf.c'
source_filename = "lib-aot/bpf/balancer.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i32]*, i32*, %struct.ctl_value*, [16 x i32]*, [0 x i32]* }
%struct.ctl_value = type { %union.anon }
%union.anon = type { i64 }
%struct.anon.0 = type { [1 x i32]*, %struct.vip_definition*, %struct.vip_meta*, [512 x i32]*, [0 x i32]* }
%struct.vip_definition = type { %union.anon.1, i16, i8 }
%union.anon.1 = type { [4 x i32] }
%struct.vip_meta = type { i32, i32 }
%struct.anon.2 = type { [9 x i32]*, %struct.flow_key*, %struct.real_pos_lru*, [1000 x i32]*, [0 x i32]* }
%struct.flow_key = type { %union.anon.3, %union.anon.4, %union.anon.5, i8 }
%union.anon.3 = type { [4 x i32] }
%union.anon.4 = type { [4 x i32] }
%union.anon.5 = type { i32 }
%struct.real_pos_lru = type { i32, i64 }
%struct.anon.6 = type { [12 x i32]*, i32*, i32*, [128 x i32]*, [0 x i32]*, [0 x %struct.anon.7*] }
%struct.anon.7 = type { [9 x i32]*, %struct.flow_key*, %struct.real_pos_lru*, [1000 x i32]* }
%struct.anon.8 = type { [2 x i32]*, i32*, i32*, [33554944 x i32]*, [0 x i32]* }
%struct.anon.9 = type { [2 x i32]*, i32*, %struct.real_definition*, [4096 x i32]*, [0 x i32]* }
%struct.real_definition = type { %union.anon.10, i8 }
%union.anon.10 = type { [4 x i32] }
%struct.anon.11 = type { [6 x i32]*, i32*, %struct.lb_stats*, [4096 x i32]*, [0 x i32]* }
%struct.lb_stats = type { i64, i64 }
%struct.anon.12 = type { [6 x i32]*, i32*, i32*, [4096 x i32]*, [0 x i32]* }
%struct.anon.13 = type { [2 x i32]*, i32*, %struct.vip_definition*, [1 x i32]*, [0 x i32]* }
%struct.anon.14 = type { [6 x i32]*, i32*, %struct.lb_stats*, [1024 x i32]*, [0 x i32]* }
%struct.anon.15 = type { [6 x i32]*, i32*, %struct.lb_quic_packets_stats*, [1 x i32]*, [0 x i32]* }
%struct.lb_quic_packets_stats = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.anon.16 = type { [6 x i32]*, i32*, %struct.lb_stats*, [512 x i32]*, [0 x i32]* }
%struct.anon.17 = type { [2 x i32]*, i32*, i32*, [16777214 x i32]*, [0 x i32]* }
%struct.anon.18 = type { [6 x i32]*, i32*, %struct.lb_tpr_packets_stats*, [1 x i32]*, [0 x i32]* }
%struct.lb_tpr_packets_stats = type { i64, i64, i64, i64 }
%struct.anon.19 = type { [6 x i32]*, i32*, %struct.lb_stats*, [512 x i32]*, [0 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32 }
%struct.packet_description = type { %struct.flow_key, i32, i8, i8 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.23 }
%union.anon.23 = type { %struct.anon.24 }
%struct.anon.24 = type { %struct.in6_addr, %struct.in6_addr }
%struct.in6_addr = type { %union.anon.25 }
%union.anon.25 = type { [4 x i32] }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.20 }
%union.anon.20 = type { %struct.anon.21 }
%struct.anon.21 = type { i32, i32 }

@ctl_array_id = dso_local local_unnamed_addr constant i64 17179869184, align 8
@vip_map_id = dso_local local_unnamed_addr constant i64 21474836480, align 8
@fallback_cache_id = dso_local local_unnamed_addr constant i64 25769803776, align 8
@lru_mapping_id = dso_local local_unnamed_addr constant i64 34359738368, align 8
@ch_rings_id = dso_local local_unnamed_addr constant i64 30064771072, align 8
@reals_id = dso_local local_unnamed_addr constant i64 38654705664, align 8
@reals_stats_id = dso_local local_unnamed_addr constant i64 42949672960, align 8
@lru_miss_stats_id = dso_local local_unnamed_addr constant i64 47244640256, align 8
@vip_miss_stats_id = dso_local local_unnamed_addr constant i64 51539607552, align 8
@stats_id = dso_local local_unnamed_addr constant i64 55834574848, align 8
@quic_stats_map_id = dso_local local_unnamed_addr constant i64 60129542144, align 8
@decap_vip_stats_id = dso_local local_unnamed_addr constant i64 64424509440, align 8
@server_id_map_id = dso_local local_unnamed_addr constant i64 68719476736, align 8
@tpr_stats_map_id = dso_local local_unnamed_addr constant i64 73014444032, align 8
@server_id_stats_id = dso_local local_unnamed_addr constant i64 77309411328, align 8
@_license = dso_local local_unnamed_addr global [4 x i8] c"GPL\00", align 1
@ctl_array = dso_local local_unnamed_addr global %struct.anon zeroinitializer, align 8
@vip_map = dso_local local_unnamed_addr global %struct.anon.0 zeroinitializer, align 8
@fallback_cache = dso_local global %struct.anon.2 zeroinitializer, align 8
@lru_mapping = dso_local local_unnamed_addr global %struct.anon.6 zeroinitializer, align 8
@ch_rings = dso_local local_unnamed_addr global %struct.anon.8 zeroinitializer, align 8
@reals = dso_local local_unnamed_addr global %struct.anon.9 zeroinitializer, align 8
@reals_stats = dso_local local_unnamed_addr global %struct.anon.11 zeroinitializer, align 8
@lru_miss_stats = dso_local local_unnamed_addr global %struct.anon.12 zeroinitializer, align 8
@vip_miss_stats = dso_local local_unnamed_addr global %struct.anon.13 zeroinitializer, align 8
@stats = dso_local local_unnamed_addr global %struct.anon.14 zeroinitializer, align 8
@quic_stats_map = dso_local local_unnamed_addr global %struct.anon.15 zeroinitializer, align 8
@decap_vip_stats = dso_local local_unnamed_addr global %struct.anon.16 zeroinitializer, align 8
@server_id_map = dso_local local_unnamed_addr global %struct.anon.17 zeroinitializer, align 8
@tpr_stats_map = dso_local local_unnamed_addr global %struct.anon.18 zeroinitializer, align 8
@server_id_stats = dso_local local_unnamed_addr global %struct.anon.19 zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define dso_local i32 @balancer_ingress(%struct.xdp_md* noundef %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.real_pos_lru, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.real_pos_lru, align 8
  %14 = alloca [6 x i8], align 1
  %15 = alloca [4 x i32], align 16
  %16 = alloca i32, align 4
  %17 = alloca %struct.packet_description, align 4
  %18 = alloca %struct.vip_definition, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca %struct.real_pos_lru, align 8
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca %struct.real_pos_lru, align 8
  %40 = alloca [6 x i8], align 1
  %41 = alloca i32, align 4
  %42 = alloca %struct.packet_description, align 4
  %43 = alloca %struct.vip_definition, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca i32, align 4
  %53 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %54 = load i64, i64* %53, align 8, !tbaa !5
  %55 = inttoptr i64 %54 to i8*
  %56 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %57 = load i64, i64* %56, align 8, !tbaa !11
  %58 = inttoptr i64 %57 to i8*
  %59 = getelementptr i8, i8* %55, i64 14
  %60 = icmp ugt i8* %59, %58
  br i1 %60, label %1848, label %61

61:                                               ; preds = %1
  %62 = inttoptr i64 %54 to %struct.ethhdr*
  %63 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %62, i64 0, i32 2
  %64 = load i16, i16* %63, align 1, !tbaa !12
  switch i16 %64, label %1848 [
    i16 8, label %65
    i16 -8826, label %940
  ]

65:                                               ; preds = %61
  %66 = bitcast %struct.packet_description* %42 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %66) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(48) %66, i8 0, i64 48, i1 false) #7
  %67 = bitcast %struct.vip_definition* %43 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %67) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %67, i8 0, i64 20, i1 false) #7
  %68 = bitcast i32* %44 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %68) #7
  %69 = bitcast i32* %45 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %69) #7
  store i32 0, i32* %45, align 4, !tbaa !15
  %70 = getelementptr i8, i8* %55, i64 34
  %71 = icmp ugt i8* %70, %58
  br i1 %71, label %938, label %72

72:                                               ; preds = %65
  %73 = load i8, i8* %59, align 4
  %74 = and i8 %73, 15
  %75 = icmp eq i8 %74, 5
  br i1 %75, label %76, label %938

76:                                               ; preds = %72
  %77 = getelementptr i8, i8* %55, i64 15
  %78 = load i8, i8* %77, align 1, !tbaa !16
  %79 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 3
  store i8 %78, i8* %79, align 1, !tbaa !18
  %80 = getelementptr i8, i8* %55, i64 23
  %81 = load i8, i8* %80, align 1, !tbaa !21
  %82 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 3
  store i8 %81, i8* %82, align 4, !tbaa !22
  %83 = getelementptr i8, i8* %55, i64 16
  %84 = bitcast i8* %83 to i16*
  %85 = load i16, i16* %84, align 2, !tbaa !23
  %86 = tail call i16 @llvm.bswap.i16(i16 %85) #7
  %87 = getelementptr i8, i8* %55, i64 20
  %88 = bitcast i8* %87 to i16*
  %89 = load i16, i16* %88, align 2, !tbaa !24
  %90 = and i16 %89, -193
  %91 = icmp eq i16 %90, 0
  br i1 %91, label %92, label %938

92:                                               ; preds = %76
  %93 = icmp eq i8 %81, 1
  br i1 %93, label %94, label %205

94:                                               ; preds = %92
  %95 = getelementptr i8, i8* %55, i64 42
  %96 = icmp ugt i8* %95, %58
  br i1 %96, label %938, label %97

97:                                               ; preds = %94
  %98 = load i8, i8* %70, align 4, !tbaa !25
  switch i8 %98, label %938 [
    i8 8, label %99
    i8 3, label %161
  ]

99:                                               ; preds = %97
  store i8 0, i8* %70, align 4, !tbaa !25
  %100 = getelementptr i8, i8* %55, i64 36
  %101 = bitcast i8* %100 to i16*
  %102 = load i16, i16* %101, align 2, !tbaa !27
  %103 = add i16 %102, 8
  store i16 %103, i16* %101, align 2, !tbaa !27
  %104 = getelementptr i8, i8* %55, i64 22
  store i8 64, i8* %104, align 4, !tbaa !28
  %105 = getelementptr i8, i8* %55, i64 26
  %106 = getelementptr i8, i8* %55, i64 30
  %107 = bitcast i8* %106 to i32*
  %108 = load i32, i32* %107, align 4, !tbaa !29
  %109 = bitcast i8* %105 to i32*
  %110 = load i32, i32* %109, align 4, !tbaa !29
  store i32 %110, i32* %107, align 4, !tbaa !29
  store i32 %108, i32* %109, align 4, !tbaa !29
  %111 = getelementptr i8, i8* %55, i64 24
  %112 = bitcast i8* %111 to i16*
  %113 = bitcast i8* %59 to i16*
  %114 = load i16, i16* %113, align 2, !tbaa !30
  %115 = zext i16 %114 to i64
  %116 = getelementptr i8, i8* %55, i64 18
  %117 = bitcast i8* %116 to i16*
  %118 = zext i16 %85 to i64
  %119 = load i16, i16* %117, align 2, !tbaa !30
  %120 = zext i16 %119 to i64
  %121 = bitcast i8* %104 to i16*
  %122 = zext i16 %89 to i64
  %123 = load i16, i16* %121, align 2, !tbaa !30
  %124 = zext i16 %123 to i64
  %125 = and i32 %108, 65535
  %126 = lshr i32 %108, 16
  %127 = and i32 %110, 65535
  %128 = lshr i32 %110, 16
  %129 = add nuw nsw i32 %126, %125
  %130 = add nuw nsw i32 %129, %127
  %131 = add nuw nsw i32 %130, %128
  %132 = zext i32 %131 to i64
  %133 = add nuw nsw i64 %122, %118
  %134 = add nuw nsw i64 %133, %115
  %135 = add nuw nsw i64 %134, %132
  %136 = add nuw nsw i64 %135, %120
  %137 = add nuw nsw i64 %136, %124
  %138 = icmp ult i64 %137, 65536
  %139 = lshr i64 %137, 16
  %140 = and i64 %137, 65535
  %141 = add nuw nsw i64 %140, %139
  %142 = select i1 %138, i64 %137, i64 %141
  %143 = icmp ult i64 %142, 65536
  %144 = lshr i64 %142, 16
  %145 = and i64 %142, 65535
  %146 = add nuw nsw i64 %145, %144
  %147 = select i1 %143, i64 %142, i64 %146
  %148 = icmp ult i64 %147, 65536
  %149 = lshr i64 %147, 16
  %150 = and i64 %147, 65535
  %151 = add nuw nsw i64 %150, %149
  %152 = select i1 %148, i64 %147, i64 %151
  %153 = icmp ult i64 %152, 65536
  %154 = lshr i64 %152, 16
  %155 = select i1 %153, i64 65536, i64 %154
  %156 = add nuw nsw i64 %155, %152
  %157 = trunc i64 %156 to i16
  %158 = xor i16 %157, -1
  store i16 %158, i16* %112, align 2, !tbaa !31
  %159 = getelementptr inbounds [6 x i8], [6 x i8]* %40, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %159)
  %160 = getelementptr inbounds i8, i8* %55, i64 6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %159, i8* noundef nonnull align 1 dereferenceable(6) %160, i64 6, i1 false) #7
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %160, i8* noundef nonnull align 1 dereferenceable(6) %55, i64 6, i1 false) #7
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %55, i8* noundef nonnull align 1 dereferenceable(6) %159, i64 6, i1 false) #7
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %159)
  br label %938

161:                                              ; preds = %97
  %162 = getelementptr i8, i8* %55, i64 35
  %163 = load i8, i8* %162, align 1, !tbaa !32
  %164 = icmp eq i8 %163, 4
  br i1 %164, label %165, label %186

165:                                              ; preds = %161
  %166 = bitcast i32* %41 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %166) #7
  store i32 525, i32* %41, align 4, !tbaa !15
  %167 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %166) #7
  %168 = icmp eq i8* %167, null
  br i1 %168, label %193, label %169

169:                                              ; preds = %165
  %170 = bitcast i8* %167 to i64*
  %171 = load i64, i64* %170, align 8, !tbaa !33
  %172 = add i64 %171, 1
  store i64 %172, i64* %170, align 8, !tbaa !33
  %173 = getelementptr i8, i8* %55, i64 40
  %174 = bitcast i8* %173 to i16*
  %175 = load i16, i16* %174, align 2, !tbaa !29
  %176 = trunc i16 %175 to i8
  %177 = icmp ult i8 %176, 5
  br i1 %177, label %178, label %183

178:                                              ; preds = %169
  %179 = getelementptr inbounds i8, i8* %167, i64 8
  %180 = bitcast i8* %179 to i64*
  %181 = load i64, i64* %180, align 8, !tbaa !35
  %182 = add i64 %181, 1
  store i64 %182, i64* %180, align 8, !tbaa !35
  br label %183

183:                                              ; preds = %178, %169
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %166) #7
  %184 = getelementptr i8, i8* %55, i64 62
  %185 = icmp ugt i8* %184, %58
  br i1 %185, label %938, label %189

186:                                              ; preds = %161
  %187 = getelementptr i8, i8* %55, i64 62
  %188 = icmp ugt i8* %187, %58
  br i1 %188, label %938, label %189

189:                                              ; preds = %186, %183
  %190 = load i8, i8* %95, align 4
  %191 = and i8 %190, 15
  %192 = icmp eq i8 %191, 5
  br i1 %192, label %194, label %938

193:                                              ; preds = %165
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %166) #7
  br label %938

194:                                              ; preds = %189
  %195 = getelementptr i8, i8* %55, i64 51
  %196 = load i8, i8* %195, align 1, !tbaa !21
  store i8 %196, i8* %82, align 4, !tbaa !22
  %197 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 2
  %198 = load i8, i8* %197, align 4, !tbaa !36
  %199 = or i8 %198, 1
  store i8 %199, i8* %197, align 4, !tbaa !36
  %200 = getelementptr i8, i8* %55, i64 54
  %201 = getelementptr i8, i8* %55, i64 58
  %202 = bitcast i8* %201 to i32*
  %203 = load i32, i32* %202, align 4, !tbaa !29
  %204 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 0, i32 0, i64 0
  store i32 %203, i32* %204, align 4, !tbaa !29
  br label %211

205:                                              ; preds = %92
  %206 = getelementptr i8, i8* %55, i64 26
  %207 = bitcast i8* %206 to i32*
  %208 = load i32, i32* %207, align 4, !tbaa !29
  %209 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 0, i32 0, i64 0
  store i32 %208, i32* %209, align 4, !tbaa !29
  %210 = getelementptr i8, i8* %55, i64 30
  br label %211

211:                                              ; preds = %205, %194
  %212 = phi i8* [ %210, %205 ], [ %200, %194 ]
  %213 = phi i8 [ 0, %205 ], [ %199, %194 ]
  %214 = phi i8 [ %81, %205 ], [ %196, %194 ]
  %215 = bitcast i8* %212 to i32*
  %216 = load i32, i32* %215, align 4, !tbaa !29
  %217 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 1, i32 0, i64 0
  store i32 %216, i32* %217, align 4, !tbaa !29
  switch i8 %214, label %938 [
    i8 6, label %218
    i8 17, label %247
  ]

218:                                              ; preds = %211
  %219 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 2
  %220 = and i8 %213, 1
  %221 = icmp eq i8 %220, 0
  %222 = select i1 %221, i64 34, i64 62
  %223 = getelementptr i8, i8* %55, i64 %222
  %224 = getelementptr inbounds i8, i8* %223, i64 20
  %225 = icmp ugt i8* %224, %58
  br i1 %225, label %938, label %226

226:                                              ; preds = %218
  %227 = getelementptr inbounds i8, i8* %223, i64 12
  %228 = bitcast i8* %227 to i16*
  %229 = load i16, i16* %228, align 4
  %230 = and i16 %229, 512
  %231 = icmp eq i16 %230, 0
  br i1 %231, label %234, label %232

232:                                              ; preds = %226
  %233 = or i8 %213, 2
  store i8 %233, i8* %219, align 4, !tbaa !36
  br label %234

234:                                              ; preds = %232, %226
  br i1 %221, label %235, label %241

235:                                              ; preds = %234
  %236 = bitcast i8* %223 to i16*
  %237 = load i16, i16* %236, align 4, !tbaa !37
  %238 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 2
  %239 = bitcast %union.anon.5* %238 to i16*
  store i16 %237, i16* %239, align 4, !tbaa !29
  %240 = getelementptr inbounds i8, i8* %223, i64 2
  br label %267

241:                                              ; preds = %234
  %242 = getelementptr inbounds i8, i8* %223, i64 2
  %243 = bitcast i8* %242 to i16*
  %244 = load i16, i16* %243, align 2, !tbaa !39
  %245 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 2
  %246 = bitcast %union.anon.5* %245 to i16*
  store i16 %244, i16* %246, align 4, !tbaa !29
  br label %267

247:                                              ; preds = %211
  %248 = and i8 %213, 1
  %249 = icmp eq i8 %248, 0
  %250 = select i1 %249, i64 34, i64 62
  %251 = getelementptr i8, i8* %55, i64 %250
  %252 = getelementptr inbounds i8, i8* %251, i64 8
  %253 = icmp ugt i8* %252, %58
  br i1 %253, label %938, label %254

254:                                              ; preds = %247
  br i1 %249, label %255, label %261

255:                                              ; preds = %254
  %256 = bitcast i8* %251 to i16*
  %257 = load i16, i16* %256, align 2, !tbaa !40
  %258 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 2
  %259 = bitcast %union.anon.5* %258 to i16*
  store i16 %257, i16* %259, align 4, !tbaa !29
  %260 = getelementptr inbounds i8, i8* %251, i64 2
  br label %267

261:                                              ; preds = %254
  %262 = getelementptr inbounds i8, i8* %251, i64 2
  %263 = bitcast i8* %262 to i16*
  %264 = load i16, i16* %263, align 2, !tbaa !42
  %265 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 2
  %266 = bitcast %union.anon.5* %265 to i16*
  store i16 %264, i16* %266, align 4, !tbaa !29
  br label %267

267:                                              ; preds = %255, %261, %235, %241
  %268 = phi %union.anon.5* [ %238, %235 ], [ %245, %241 ], [ %258, %255 ], [ %265, %261 ]
  %269 = phi i8* [ %240, %235 ], [ %223, %241 ], [ %260, %255 ], [ %251, %261 ]
  %270 = bitcast i8* %269 to i16*
  %271 = load i16, i16* %270, align 2, !tbaa !30
  %272 = bitcast %union.anon.5* %268 to [2 x i16]*
  %273 = getelementptr inbounds [2 x i16], [2 x i16]* %272, i64 0, i64 1
  store i16 %271, i16* %273, align 2, !tbaa !29
  %274 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 1, i32 0, i64 0
  %275 = load i32, i32* %274, align 4, !tbaa !29
  %276 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %43, i64 0, i32 0, i32 0, i64 0
  store i32 %275, i32* %276, align 4, !tbaa !29
  %277 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 2
  %278 = bitcast %union.anon.5* %277 to [2 x i16]*
  %279 = getelementptr inbounds [2 x i16], [2 x i16]* %278, i64 0, i64 1
  %280 = load i16, i16* %279, align 2, !tbaa !29
  %281 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %43, i64 0, i32 1
  store i16 %280, i16* %281, align 4, !tbaa !43
  %282 = load i8, i8* %82, align 4, !tbaa !22
  %283 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %43, i64 0, i32 2
  store i8 %282, i8* %283, align 2, !tbaa !45
  %284 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %67) #7
  %285 = icmp eq i8* %284, null
  br i1 %285, label %286, label %295

286:                                              ; preds = %267
  store i16 0, i16* %281, align 4, !tbaa !43
  %287 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %67) #7
  %288 = icmp eq i8* %287, null
  br i1 %288, label %938, label %289

289:                                              ; preds = %286
  %290 = bitcast i8* %287 to i32*
  %291 = load i32, i32* %290, align 4, !tbaa !46
  %292 = and i32 %291, 136
  %293 = icmp eq i32 %292, 0
  br i1 %293, label %294, label %295

294:                                              ; preds = %289
  store i16 0, i16* %279, align 2, !tbaa !29
  br label %295

295:                                              ; preds = %294, %289, %267
  %296 = phi i8* [ %284, %267 ], [ %287, %289 ], [ %287, %294 ]
  %297 = sub i64 %57, %54
  %298 = icmp sgt i64 %297, 1514
  br i1 %298, label %938, label %299

299:                                              ; preds = %295
  %300 = bitcast i32* %46 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %300) #7
  store i32 512, i32* %46, align 4, !tbaa !15
  %301 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %300) #7
  %302 = icmp eq i8* %301, null
  br i1 %302, label %936, label %303

303:                                              ; preds = %299
  %304 = bitcast i8* %301 to i64*
  %305 = load i64, i64* %304, align 8, !tbaa !33
  %306 = add i64 %305, 1
  store i64 %306, i64* %304, align 8, !tbaa !33
  %307 = bitcast i8* %296 to i32*
  %308 = load i32, i32* %307, align 4, !tbaa !46
  %309 = and i32 %308, 1
  %310 = icmp eq i32 %309, 0
  br i1 %310, label %313, label %311

311:                                              ; preds = %303
  %312 = bitcast %union.anon.5* %277 to i16*
  store i16 0, i16* %312, align 4, !tbaa !29
  br label %313

313:                                              ; preds = %311, %303
  %314 = getelementptr inbounds i8, i8* %296, i64 4
  %315 = bitcast i8* %314 to i32*
  %316 = load i32, i32* %315, align 4, !tbaa !48
  store i32 %316, i32* %44, align 4, !tbaa !15
  %317 = bitcast i32* %47 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %317) #7
  %318 = call i32 (...) @_bpf_helper_ext_0008() #7
  store i32 %318, i32* %47, align 4, !tbaa !15
  %319 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 34359738368, i8* noundef nonnull %317) #7
  %320 = icmp eq i8* %319, null
  br i1 %320, label %321, label %329

321:                                              ; preds = %313
  %322 = bitcast i32* %48 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %322) #7
  store i32 515, i32* %48, align 4, !tbaa !15
  %323 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %322) #7
  %324 = icmp eq i8* %323, null
  br i1 %324, label %932, label %325

325:                                              ; preds = %321
  %326 = bitcast i8* %323 to i64*
  %327 = load i64, i64* %326, align 8, !tbaa !33
  %328 = add i64 %327, 1
  store i64 %328, i64* %326, align 8, !tbaa !33
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %322) #7
  br label %329

329:                                              ; preds = %325, %313
  %330 = phi i8* [ %319, %313 ], [ bitcast (%struct.anon.2* @fallback_cache to i8*), %325 ]
  %331 = load i32, i32* %307, align 4, !tbaa !46
  %332 = and i32 %331, 4
  %333 = icmp eq i32 %332, 0
  br i1 %333, label %562, label %334

334:                                              ; preds = %329
  %335 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 2
  %336 = load i8, i8* %335, align 4, !tbaa !36
  %337 = and i8 %336, 1
  %338 = icmp eq i8 %337, 0
  br i1 %338, label %357, label %339

339:                                              ; preds = %334
  %340 = bitcast i32* %49 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %340) #7
  store i32 523, i32* %49, align 4, !tbaa !15
  %341 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %340) #7
  %342 = icmp eq i8* %341, null
  br i1 %342, label %541, label %343

343:                                              ; preds = %339
  %344 = bitcast i8* %341 to i64*
  %345 = load i64, i64* %344, align 8, !tbaa !33
  %346 = add i64 %345, 1
  store i64 %346, i64* %344, align 8, !tbaa !33
  %347 = getelementptr i8, i8* %55, i64 35
  %348 = load i8, i8* %347, align 1, !tbaa !32
  %349 = and i8 %348, -3
  %350 = icmp eq i8 %349, 1
  br i1 %350, label %351, label %356

351:                                              ; preds = %343
  %352 = getelementptr inbounds i8, i8* %341, i64 8
  %353 = bitcast i8* %352 to i64*
  %354 = load i64, i64* %353, align 8, !tbaa !35
  %355 = add i64 %354, 1
  store i64 %355, i64* %353, align 8, !tbaa !35
  br label %356

356:                                              ; preds = %351, %343
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %340) #7
  br label %562

357:                                              ; preds = %334
  %358 = bitcast i32* %50 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %358) #7
  store i32 0, i32* %50, align 4, !tbaa !15
  %359 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 60129542144, i8* noundef nonnull %358) #7
  %360 = icmp eq i8* %359, null
  br i1 %360, label %540, label %361

361:                                              ; preds = %357
  %362 = load i8, i8* %335, align 4, !tbaa !36
  %363 = and i8 %362, 1
  %364 = icmp eq i8 %363, 0
  %365 = select i1 %364, i64 34, i64 62
  %366 = getelementptr i8, i8* %55, i64 %365
  %367 = getelementptr i8, i8* %366, i64 8
  %368 = getelementptr i8, i8* %367, i64 1
  %369 = icmp ugt i8* %368, %58
  br i1 %369, label %523, label %370

370:                                              ; preds = %361
  %371 = load i8, i8* %367, align 1, !tbaa !29
  %372 = zext i8 %371 to i32
  %373 = and i32 %372, 128
  %374 = icmp eq i32 %373, 0
  br i1 %374, label %386, label %375

375:                                              ; preds = %370
  %376 = getelementptr inbounds i8, i8* %367, i64 14
  %377 = icmp ugt i8* %376, %58
  br i1 %377, label %523, label %378

378:                                              ; preds = %375
  %379 = and i32 %372, 32
  %380 = icmp eq i32 %379, 0
  br i1 %380, label %527, label %381

381:                                              ; preds = %378
  %382 = getelementptr inbounds i8, i8* %367, i64 5
  %383 = load i8, i8* %382, align 1, !tbaa !49
  %384 = icmp ult i8 %383, 8
  %385 = getelementptr inbounds i8, i8* %367, i64 6
  br i1 %384, label %523, label %391

386:                                              ; preds = %370
  %387 = getelementptr inbounds i8, i8* %367, i64 9
  %388 = icmp ugt i8* %387, %58
  %389 = icmp eq i8* %368, null
  %390 = or i1 %388, %389
  br i1 %390, label %523, label %391

391:                                              ; preds = %386, %381
  %392 = phi i8* [ %385, %381 ], [ %368, %386 ]
  %393 = load i8, i8* %392, align 1, !tbaa !29
  %394 = lshr i8 %393, 6
  switch i8 %394, label %523 [
    i8 1, label %395
    i8 2, label %407
    i8 3, label %419
  ]

395:                                              ; preds = %391
  %396 = and i8 %393, 63
  %397 = zext i8 %396 to i64
  %398 = shl nuw nsw i64 %397, 10
  %399 = getelementptr inbounds i8, i8* %392, i64 1
  %400 = load i8, i8* %399, align 1, !tbaa !29
  %401 = zext i8 %400 to i64
  %402 = shl nuw nsw i64 %401, 2
  %403 = or i64 %402, %398
  %404 = getelementptr inbounds i8, i8* %392, i64 2
  %405 = load i8, i8* %404, align 1, !tbaa !29
  %406 = lshr i8 %405, 6
  br label %436

407:                                              ; preds = %391
  %408 = getelementptr inbounds i8, i8* %392, i64 1
  %409 = load i8, i8* %408, align 1, !tbaa !29
  %410 = zext i8 %409 to i64
  %411 = shl nuw nsw i64 %410, 16
  %412 = getelementptr inbounds i8, i8* %392, i64 2
  %413 = load i8, i8* %412, align 1, !tbaa !29
  %414 = zext i8 %413 to i64
  %415 = shl nuw nsw i64 %414, 8
  %416 = or i64 %415, %411
  %417 = getelementptr inbounds i8, i8* %392, i64 3
  %418 = load i8, i8* %417, align 1, !tbaa !29
  br label %436

419:                                              ; preds = %391
  %420 = getelementptr inbounds i8, i8* %392, i64 1
  %421 = load i8, i8* %420, align 1, !tbaa !29
  %422 = zext i8 %421 to i64
  %423 = shl nuw nsw i64 %422, 24
  %424 = getelementptr inbounds i8, i8* %392, i64 2
  %425 = load i8, i8* %424, align 1, !tbaa !29
  %426 = zext i8 %425 to i64
  %427 = shl nuw nsw i64 %426, 16
  %428 = or i64 %427, %423
  %429 = getelementptr inbounds i8, i8* %392, i64 3
  %430 = load i8, i8* %429, align 1, !tbaa !29
  %431 = zext i8 %430 to i64
  %432 = shl nuw nsw i64 %431, 8
  %433 = or i64 %428, %432
  %434 = getelementptr inbounds i8, i8* %392, i64 4
  %435 = load i8, i8* %434, align 1, !tbaa !29
  br label %436

436:                                              ; preds = %419, %407, %395
  %437 = phi i8 [ %406, %395 ], [ %418, %407 ], [ %435, %419 ]
  %438 = phi i64 [ %403, %395 ], [ %416, %407 ], [ %433, %419 ]
  %439 = phi i64 [ 56, %395 ], [ 64, %407 ], [ 72, %419 ]
  %440 = zext i8 %437 to i64
  %441 = or i64 %438, %440
  %442 = trunc i64 %441 to i32
  %443 = icmp sgt i32 %442, 0
  br i1 %443, label %444, label %523

444:                                              ; preds = %436
  %445 = getelementptr inbounds i8, i8* %359, i64 %439
  %446 = bitcast i8* %445 to i64*
  %447 = load i64, i64* %446, align 8, !tbaa !51
  %448 = add i64 %447, 1
  store i64 %448, i64* %446, align 8, !tbaa !51
  %449 = bitcast i32* %51 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %449) #7
  store i32 %442, i32* %51, align 4, !tbaa !15
  %450 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 68719476736, i8* noundef nonnull %449) #7
  %451 = icmp eq i8* %450, null
  br i1 %451, label %543, label %452

452:                                              ; preds = %444
  %453 = bitcast i8* %450 to i32*
  %454 = load i32, i32* %453, align 4, !tbaa !15
  store i32 %454, i32* %51, align 4, !tbaa !15
  %455 = icmp eq i32 %454, 0
  br i1 %455, label %543, label %456

456:                                              ; preds = %452
  %457 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 1
  store i32 %454, i32* %457, align 4, !tbaa !52
  %458 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %449) #7
  %459 = icmp eq i8* %458, null
  br i1 %459, label %460, label %465

460:                                              ; preds = %456
  %461 = getelementptr inbounds i8, i8* %359, i64 40
  %462 = bitcast i8* %461 to i64*
  %463 = load i64, i64* %462, align 8, !tbaa !53
  %464 = add i64 %463, 1
  store i64 %464, i64* %462, align 8, !tbaa !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %449) #7
  br label %540

465:                                              ; preds = %456
  %466 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0
  %467 = call i8* (i8*, %struct.flow_key*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i8*, %struct.flow_key*, ...)*)(i8* noundef %330, %struct.flow_key* noundef nonnull %466) #7
  %468 = icmp eq i8* %467, null
  br i1 %468, label %474, label %469

469:                                              ; preds = %465
  %470 = bitcast i8* %467 to i32*
  %471 = load i32, i32* %470, align 8, !tbaa !55
  %472 = load i32, i32* %457, align 4, !tbaa !52
  %473 = icmp eq i32 %471, %472
  br i1 %473, label %498, label %503

474:                                              ; preds = %465
  %475 = bitcast i32* %38 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %475) #7
  store i32 514, i32* %38, align 4, !tbaa !15
  %476 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %475) #7
  %477 = icmp eq i8* %476, null
  br i1 %477, label %492, label %478

478:                                              ; preds = %474
  %479 = call i32 (...) @_bpf_helper_ext_0005() #7
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds i8, i8* %476, i64 8
  %482 = bitcast i8* %481 to i64*
  %483 = load i64, i64* %482, align 8, !tbaa !35
  %484 = sub i64 %480, %483
  %485 = icmp ugt i64 %484, 1000000000
  %486 = bitcast i8* %476 to i64*
  br i1 %485, label %487, label %488

487:                                              ; preds = %478
  store i64 1, i64* %486, align 8, !tbaa !33
  store i64 %480, i64* %482, align 8, !tbaa !35
  br label %493

488:                                              ; preds = %478
  %489 = load i64, i64* %486, align 8, !tbaa !33
  %490 = add i64 %489, 1
  store i64 %490, i64* %486, align 8, !tbaa !33
  %491 = icmp ugt i64 %490, 125000
  br i1 %491, label %492, label %493

492:                                              ; preds = %488, %474
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %475) #7
  br label %518

493:                                              ; preds = %488, %487
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %475) #7
  %494 = bitcast %struct.real_pos_lru* %39 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %494) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %494, i8 0, i64 16, i1 false) #7
  %495 = load i32, i32* %457, align 4, !tbaa !52
  %496 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %39, i64 0, i32 0
  store i32 %495, i32* %496, align 8, !tbaa !55
  %497 = call i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...)*)(i8* noundef %330, %struct.flow_key* noundef nonnull %466, %struct.real_pos_lru* noundef nonnull %39, i32 noundef 0) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %494) #7
  br label %518

498:                                              ; preds = %469
  %499 = getelementptr inbounds i8, i8* %359, i64 80
  %500 = bitcast i8* %499 to i64*
  %501 = load i64, i64* %500, align 8, !tbaa !57
  %502 = add i64 %501, 1
  store i64 %502, i64* %500, align 8, !tbaa !57
  br label %555

503:                                              ; preds = %469
  store i32 %472, i32* %470, align 8, !tbaa !55
  %504 = getelementptr inbounds i8, i8* %359, i64 88
  %505 = bitcast i8* %504 to i64*
  %506 = load i64, i64* %505, align 8, !tbaa !58
  %507 = add i64 %506, 1
  store i64 %507, i64* %505, align 8, !tbaa !58
  %508 = load i32, i32* %44, align 4, !tbaa !15
  %509 = bitcast i32* %37 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %509) #7
  store i32 %508, i32* %37, align 4, !tbaa !15
  %510 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 77309411328, i8* noundef nonnull %509) #7
  %511 = icmp eq i8* %510, null
  br i1 %511, label %517, label %512

512:                                              ; preds = %503
  %513 = getelementptr inbounds i8, i8* %510, i64 8
  %514 = bitcast i8* %513 to i64*
  %515 = load i64, i64* %514, align 8, !tbaa !35
  %516 = add i64 %515, 1
  store i64 %516, i64* %514, align 8, !tbaa !35
  br label %517

517:                                              ; preds = %512, %503
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %509) #7
  br label %555

518:                                              ; preds = %493, %492
  %519 = getelementptr inbounds i8, i8* %359, i64 96
  %520 = bitcast i8* %519 to i64*
  %521 = load i64, i64* %520, align 8, !tbaa !59
  %522 = add i64 %521, 1
  store i64 %522, i64* %520, align 8, !tbaa !59
  br label %555

523:                                              ; preds = %436, %391, %386, %381, %375, %361
  %524 = bitcast i8* %359 to i64*
  %525 = load i64, i64* %524, align 8, !tbaa !60
  %526 = add i64 %525, 1
  store i64 %526, i64* %524, align 8, !tbaa !60
  br label %542

527:                                              ; preds = %378
  %528 = getelementptr inbounds i8, i8* %359, i64 8
  %529 = bitcast i8* %528 to i64*
  %530 = load i64, i64* %529, align 8, !tbaa !61
  %531 = add i64 %530, 1
  store i64 %531, i64* %529, align 8, !tbaa !61
  %532 = bitcast i32* %36 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %532) #7
  store i32 %316, i32* %36, align 4, !tbaa !15
  %533 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 77309411328, i8* noundef nonnull %532) #7
  %534 = icmp eq i8* %533, null
  br i1 %534, label %539, label %535

535:                                              ; preds = %527
  %536 = bitcast i8* %533 to i64*
  %537 = load i64, i64* %536, align 8, !tbaa !33
  %538 = add i64 %537, 1
  store i64 %538, i64* %536, align 8, !tbaa !33
  br label %539

539:                                              ; preds = %535, %527
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %532) #7
  br label %542

540:                                              ; preds = %460, %357
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %358) #7
  br label %934

541:                                              ; preds = %339
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %340) #7
  br label %934

542:                                              ; preds = %539, %523
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %358) #7
  br label %562

543:                                              ; preds = %452, %444
  %544 = getelementptr inbounds i8, i8* %359, i64 16
  %545 = bitcast i8* %544 to i64*
  %546 = load i64, i64* %545, align 8, !tbaa !62
  %547 = add i64 %546, 1
  store i64 %547, i64* %545, align 8, !tbaa !62
  %548 = shl i64 %441, 32
  %549 = ashr exact i64 %548, 32
  %550 = getelementptr inbounds i8, i8* %359, i64 24
  %551 = bitcast i8* %550 to i64*
  store i64 %549, i64* %551, align 8, !tbaa !63
  %552 = bitcast i8* %359 to i64*
  %553 = load i64, i64* %552, align 8, !tbaa !60
  %554 = add i64 %553, 1
  store i64 %554, i64* %552, align 8, !tbaa !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %449) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %358) #7
  br label %562

555:                                              ; preds = %518, %517, %498
  %556 = getelementptr inbounds i8, i8* %359, i64 32
  %557 = bitcast i8* %556 to i64*
  %558 = load i64, i64* %557, align 8, !tbaa !64
  %559 = add i64 %558, 1
  store i64 %559, i64* %557, align 8, !tbaa !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %449) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %358) #7
  %560 = bitcast %union.anon.5* %277 to i16*
  %561 = load i16, i16* %560, align 4, !tbaa !29
  br label %761

562:                                              ; preds = %543, %542, %356, %329
  %563 = bitcast %union.anon.5* %277 to i16*
  %564 = load i16, i16* %563, align 4, !tbaa !29
  %565 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 2
  %566 = load i8, i8* %565, align 4, !tbaa !36
  %567 = and i8 %566, 2
  %568 = icmp eq i8 %567, 0
  br i1 %568, label %569, label %597

569:                                              ; preds = %562
  %570 = load i32, i32* %307, align 4, !tbaa !46
  %571 = and i32 %570, 2
  %572 = icmp eq i32 %571, 0
  br i1 %572, label %573, label %597

573:                                              ; preds = %569
  %574 = bitcast i32* %35 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %574) #7
  %575 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0
  %576 = call i8* (i8*, %struct.flow_key*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i8*, %struct.flow_key*, ...)*)(i8* noundef %330, %struct.flow_key* noundef nonnull %575) #7
  %577 = icmp eq i8* %576, null
  br i1 %577, label %590, label %578

578:                                              ; preds = %573
  %579 = load i8, i8* %82, align 4, !tbaa !22
  %580 = icmp eq i8 %579, 17
  br i1 %580, label %581, label %591

581:                                              ; preds = %578
  %582 = call i32 (...) @_bpf_helper_ext_0005() #7
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds i8, i8* %576, i64 8
  %585 = bitcast i8* %584 to i64*
  %586 = load i64, i64* %585, align 8, !tbaa !65
  %587 = sub i64 %583, %586
  %588 = icmp ugt i64 %587, 30000000000
  br i1 %588, label %590, label %589

589:                                              ; preds = %581
  store i64 %583, i64* %585, align 8, !tbaa !65
  br label %591

590:                                              ; preds = %581, %573
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %574) #7
  br label %597

591:                                              ; preds = %589, %578
  %592 = bitcast i8* %576 to i32*
  %593 = load i32, i32* %592, align 8, !tbaa !55
  store i32 %593, i32* %35, align 4, !tbaa !15
  %594 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 1
  store i32 %593, i32* %594, align 4, !tbaa !52
  %595 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %574) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %574) #7
  %596 = icmp eq i8* %595, null
  br i1 %596, label %597, label %761

597:                                              ; preds = %591, %590, %569, %562
  %598 = load i8, i8* %82, align 4, !tbaa !22
  %599 = icmp eq i8 %598, 6
  br i1 %599, label %600, label %614

600:                                              ; preds = %597
  %601 = bitcast i32* %52 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %601) #7
  store i32 513, i32* %52, align 4, !tbaa !15
  %602 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %601) #7
  %603 = icmp eq i8* %602, null
  br i1 %603, label %933, label %604

604:                                              ; preds = %600
  %605 = load i8, i8* %565, align 4, !tbaa !36
  %606 = shl i8 %605, 2
  %607 = and i8 %606, 8
  %608 = xor i8 %607, 8
  %609 = zext i8 %608 to i64
  %610 = getelementptr i8, i8* %602, i64 %609
  %611 = bitcast i8* %610 to i64*
  %612 = load i64, i64* %611, align 8, !tbaa !51
  %613 = add i64 %612, 1
  store i64 %613, i64* %611, align 8, !tbaa !51
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %601) #7
  br label %614

614:                                              ; preds = %604, %597
  %615 = bitcast %struct.real_pos_lru* %33 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %615) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %615, i8 0, i64 16, i1 false) #7
  %616 = bitcast i32* %34 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %616) #7
  %617 = bitcast i32* %32 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %617) #7
  store i32 514, i32* %32, align 4, !tbaa !15
  %618 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %617) #7
  %619 = icmp eq i8* %618, null
  br i1 %619, label %635, label %620

620:                                              ; preds = %614
  %621 = call i32 (...) @_bpf_helper_ext_0005() #7
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds i8, i8* %618, i64 8
  %624 = bitcast i8* %623 to i64*
  %625 = load i64, i64* %624, align 8, !tbaa !35
  %626 = sub i64 %622, %625
  %627 = icmp ugt i64 %626, 1000000000
  %628 = bitcast i8* %618 to i64*
  br i1 %627, label %629, label %630

629:                                              ; preds = %620
  store i64 1, i64* %628, align 8, !tbaa !33
  store i64 %622, i64* %624, align 8, !tbaa !35
  br label %634

630:                                              ; preds = %620
  %631 = load i64, i64* %628, align 8, !tbaa !33
  %632 = add i64 %631, 1
  store i64 %632, i64* %628, align 8, !tbaa !33
  %633 = icmp ugt i64 %632, 125000
  br i1 %633, label %635, label %634

634:                                              ; preds = %630, %629
  br label %635

635:                                              ; preds = %634, %630, %614
  %636 = phi i64 [ 0, %614 ], [ %622, %634 ], [ %622, %630 ]
  %637 = phi i1 [ true, %614 ], [ false, %634 ], [ true, %630 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %617) #7
  %638 = load i32, i32* %307, align 4, !tbaa !46
  %639 = and i32 %638, 8
  %640 = icmp eq i32 %639, 0
  br i1 %640, label %641, label %644

641:                                              ; preds = %635
  %642 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 0, i32 0, i64 0
  %643 = load i32, i32* %642, align 4, !tbaa !29
  br label %646

644:                                              ; preds = %635
  %645 = load i16, i16* %279, align 2, !tbaa !29
  store i16 %645, i16* %563, align 4, !tbaa !29
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %66, i8 0, i64 16, i1 false) #7
  br label %646

646:                                              ; preds = %641, %644
  %647 = phi i32 [ %643, %641 ], [ 0, %644 ]
  %648 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 2, i32 0
  %649 = load i32, i32* %648, align 4, !tbaa !29
  %650 = add i32 %647, -525483785
  %651 = add i32 %649, -525483785
  %652 = xor i32 %651, -525483785
  %653 = call i32 @llvm.fshl.i32(i32 %651, i32 %651, i32 14) #7
  %654 = sub i32 %652, %653
  %655 = xor i32 %654, %650
  %656 = call i32 @llvm.fshl.i32(i32 %654, i32 %654, i32 11) #7
  %657 = sub i32 %655, %656
  %658 = xor i32 %657, %651
  %659 = call i32 @llvm.fshl.i32(i32 %657, i32 %657, i32 25) #7
  %660 = sub i32 %658, %659
  %661 = xor i32 %660, %654
  %662 = call i32 @llvm.fshl.i32(i32 %660, i32 %660, i32 16) #7
  %663 = sub i32 %661, %662
  %664 = xor i32 %663, %657
  %665 = call i32 @llvm.fshl.i32(i32 %663, i32 %663, i32 4) #7
  %666 = sub i32 %664, %665
  %667 = xor i32 %666, %660
  %668 = call i32 @llvm.fshl.i32(i32 %666, i32 %666, i32 14) #7
  %669 = sub i32 %667, %668
  %670 = xor i32 %669, %663
  %671 = call i32 @llvm.fshl.i32(i32 %669, i32 %669, i32 24) #7
  %672 = sub i32 %670, %671
  %673 = urem i32 %672, 65537
  %674 = load i32, i32* %315, align 4, !tbaa !48
  %675 = mul i32 %674, 65537
  %676 = add i32 %673, %675
  store i32 %676, i32* %34, align 4, !tbaa !15
  %677 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 30064771072, i8* noundef nonnull %616) #7
  %678 = icmp eq i8* %677, null
  br i1 %678, label %725, label %679

679:                                              ; preds = %646
  %680 = bitcast i8* %677 to i32*
  %681 = load i32, i32* %680, align 4, !tbaa !15
  store i32 %681, i32* %34, align 4, !tbaa !15
  %682 = icmp eq i32 %681, 0
  br i1 %682, label %683, label %694

683:                                              ; preds = %679
  %684 = bitcast i32* %31 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %684) #7
  store i32 521, i32* %31, align 4, !tbaa !15
  %685 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %684) #7
  %686 = icmp eq i8* %685, null
  br i1 %686, label %692, label %687

687:                                              ; preds = %683
  %688 = getelementptr inbounds i8, i8* %685, i64 8
  %689 = bitcast i8* %688 to i64*
  %690 = load i64, i64* %689, align 8, !tbaa !35
  %691 = add i64 %690, 1
  store i64 %691, i64* %689, align 8, !tbaa !35
  br label %692

692:                                              ; preds = %687, %683
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %684) #7
  %693 = load i32, i32* %34, align 4, !tbaa !15
  br label %694

694:                                              ; preds = %692, %679
  %695 = phi i32 [ %693, %692 ], [ %681, %679 ]
  %696 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 1
  store i32 %695, i32* %696, align 4, !tbaa !52
  %697 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %616) #7
  %698 = icmp eq i8* %697, null
  br i1 %698, label %699, label %708

699:                                              ; preds = %694
  %700 = bitcast i32* %30 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %700) #7
  store i32 521, i32* %30, align 4, !tbaa !15
  %701 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %700) #7
  %702 = icmp eq i8* %701, null
  br i1 %702, label %707, label %703

703:                                              ; preds = %699
  %704 = bitcast i8* %701 to i64*
  %705 = load i64, i64* %704, align 8, !tbaa !33
  %706 = add i64 %705, 1
  store i64 %706, i64* %704, align 8, !tbaa !33
  br label %707

707:                                              ; preds = %703, %699
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %700) #7
  br label %725

708:                                              ; preds = %694
  %709 = icmp eq i8* %330, null
  br i1 %709, label %726, label %710

710:                                              ; preds = %708
  %711 = load i32, i32* %307, align 4, !tbaa !46
  %712 = and i32 %711, 2
  %713 = icmp ne i32 %712, 0
  %714 = or i1 %637, %713
  br i1 %714, label %726, label %715

715:                                              ; preds = %710
  %716 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0
  %717 = load i8, i8* %82, align 4, !tbaa !22
  %718 = icmp eq i8 %717, 17
  br i1 %718, label %719, label %721

719:                                              ; preds = %715
  %720 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %33, i64 0, i32 1
  store i64 %636, i64* %720, align 8, !tbaa !65
  br label %721

721:                                              ; preds = %719, %715
  %722 = load i32, i32* %34, align 4, !tbaa !15
  %723 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %33, i64 0, i32 0
  store i32 %722, i32* %723, align 8, !tbaa !55
  %724 = call i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...)*)(i8* noundef nonnull %330, %struct.flow_key* noundef nonnull %716, %struct.real_pos_lru* noundef nonnull %33, i32 noundef 0) #7
  br label %726

725:                                              ; preds = %707, %646
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %616) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %615) #7
  br label %934

726:                                              ; preds = %721, %710, %708
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %616) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %615) #7
  %727 = bitcast i32* %28 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %727) #7
  store i32 0, i32* %28, align 4, !tbaa !15
  %728 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 51539607552, i8* noundef nonnull %727) #7
  %729 = icmp eq i8* %728, null
  br i1 %729, label %755, label %730

730:                                              ; preds = %726
  %731 = bitcast i8* %728 to i32*
  %732 = load i32, i32* %731, align 4, !tbaa !29
  %733 = load i32, i32* %276, align 4, !tbaa !29
  %734 = icmp ne i32 %732, %733
  %735 = getelementptr inbounds i8, i8* %728, i64 16
  %736 = bitcast i8* %735 to i16*
  %737 = load i16, i16* %736, align 4, !tbaa !43
  %738 = load i16, i16* %281, align 4, !tbaa !43
  %739 = load i8, i8* %283, align 2, !tbaa !45
  %740 = getelementptr inbounds i8, i8* %728, i64 18
  store i8 %739, i8* %740, align 2, !tbaa !45
  %741 = icmp eq i8 %739, 0
  %742 = icmp ne i16 %737, %738
  %743 = select i1 %734, i1 true, i1 %742
  %744 = select i1 %743, i1 true, i1 %741
  br i1 %744, label %756, label %745

745:                                              ; preds = %730
  %746 = bitcast i32* %29 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %746) #7
  %747 = load i32, i32* %696, align 4, !tbaa !52
  store i32 %747, i32* %29, align 4, !tbaa !15
  %748 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 47244640256, i8* noundef nonnull %746) #7
  %749 = bitcast i8* %748 to i32*
  %750 = icmp eq i8* %748, null
  br i1 %750, label %754, label %751

751:                                              ; preds = %745
  %752 = load i32, i32* %749, align 4, !tbaa !15
  %753 = add i32 %752, 1
  store i32 %753, i32* %749, align 4, !tbaa !15
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %746) #7
  br label %756

754:                                              ; preds = %745
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %746) #7
  br label %755

755:                                              ; preds = %754, %726
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %727) #7
  br label %934

756:                                              ; preds = %751, %730
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %727) #7
  %757 = getelementptr inbounds i8, i8* %301, i64 8
  %758 = bitcast i8* %757 to i64*
  %759 = load i64, i64* %758, align 8, !tbaa !35
  %760 = add i64 %759, 1
  store i64 %760, i64* %758, align 8, !tbaa !35
  br label %761

761:                                              ; preds = %756, %591, %555
  %762 = phi i16 [ %564, %756 ], [ %564, %591 ], [ %561, %555 ]
  %763 = phi i8* [ %697, %756 ], [ %595, %591 ], [ %458, %555 ]
  %764 = bitcast %union.anon.5* %277 to i16*
  %765 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %69) #7
  %766 = icmp eq i8* %765, null
  br i1 %766, label %934, label %767

767:                                              ; preds = %761
  %768 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %68) #7
  %769 = icmp eq i8* %768, null
  br i1 %769, label %934, label %770

770:                                              ; preds = %767
  %771 = zext i16 %86 to i64
  %772 = bitcast i8* %768 to <2 x i64>*
  %773 = load <2 x i64>, <2 x i64>* %772, align 8, !tbaa !51
  %774 = insertelement <2 x i64> <i64 1, i64 poison>, i64 %771, i64 1
  %775 = add <2 x i64> %773, %774
  %776 = bitcast i8* %768 to <2 x i64>*
  store <2 x i64> %775, <2 x i64>* %776, align 8, !tbaa !51
  %777 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 1
  %778 = bitcast i32* %777 to i8*
  %779 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 42949672960, i8* noundef nonnull %778) #7
  %780 = icmp eq i8* %779, null
  br i1 %780, label %934, label %781

781:                                              ; preds = %770
  %782 = bitcast i8* %779 to <2 x i64>*
  %783 = load <2 x i64>, <2 x i64>* %782, align 8, !tbaa !51
  %784 = add <2 x i64> %783, %774
  %785 = bitcast i8* %779 to <2 x i64>*
  store <2 x i64> %784, <2 x i64>* %785, align 8, !tbaa !51
  store i16 %762, i16* %764, align 4, !tbaa !29
  %786 = getelementptr inbounds i8, i8* %763, i64 16
  %787 = load i8, i8* %786, align 4, !tbaa !66
  %788 = and i8 %787, 1
  %789 = icmp eq i8 %788, 0
  br i1 %789, label %840, label %790

790:                                              ; preds = %781
  %791 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -40) #7
  %792 = icmp eq i32 %791, 0
  br i1 %792, label %793, label %934

793:                                              ; preds = %790
  %794 = load i64, i64* %53, align 8, !tbaa !5
  %795 = inttoptr i64 %794 to i8*
  %796 = load i64, i64* %56, align 8, !tbaa !11
  %797 = inttoptr i64 %794 to %struct.ethhdr*
  %798 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %797, i64 1
  %799 = inttoptr i64 %796 to %struct.ethhdr*
  %800 = icmp ugt %struct.ethhdr* %798, %799
  %801 = getelementptr i8, i8* %795, i64 54
  %802 = bitcast i8* %801 to %struct.ethhdr*
  %803 = icmp ugt %struct.ethhdr* %802, %799
  %804 = select i1 %800, i1 true, i1 %803
  %805 = bitcast i8* %801 to %struct.ipv6hdr*
  %806 = inttoptr i64 %796 to %struct.ipv6hdr*
  %807 = icmp ugt %struct.ipv6hdr* %805, %806
  %808 = select i1 %804, i1 true, i1 %807
  br i1 %808, label %934, label %809

809:                                              ; preds = %793
  %810 = getelementptr i8, i8* %795, i64 14
  %811 = getelementptr i8, i8* %795, i64 40
  %812 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %797, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %812, i8* noundef nonnull align 8 dereferenceable(6) %765, i64 6, i1 false) #7
  %813 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %797, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %813, i8* noundef nonnull align 1 dereferenceable(6) %811, i64 6, i1 false) #7
  %814 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %797, i64 0, i32 2
  store i16 -8826, i16* %814, align 1, !tbaa !12
  %815 = load i16, i16* %764, align 4, !tbaa !29
  %816 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 0, i32 0, i64 0
  %817 = load i32, i32* %816, align 4, !tbaa !29
  %818 = zext i16 %815 to i32
  %819 = xor i32 %817, %818
  %820 = load i8, i8* %79, align 1, !tbaa !18
  %821 = getelementptr i8, i8* %795, i64 15
  %822 = getelementptr i8, i8* %795, i64 16
  %823 = bitcast i8* %822 to i16*
  store i16 0, i16* %823, align 1
  %824 = lshr i8 %820, 4
  %825 = or i8 %824, 96
  store i8 %825, i8* %810, align 4
  %826 = shl i8 %820, 4
  store i8 %826, i8* %821, align 1, !tbaa !29
  %827 = getelementptr i8, i8* %795, i64 20
  store i8 4, i8* %827, align 2, !tbaa !68
  %828 = getelementptr i8, i8* %795, i64 18
  %829 = bitcast i8* %828 to i16*
  store i16 %85, i16* %829, align 4, !tbaa !70
  %830 = getelementptr i8, i8* %795, i64 21
  store i8 64, i8* %830, align 1, !tbaa !71
  %831 = getelementptr i8, i8* %795, i64 22
  %832 = bitcast i8* %831 to i32*
  store i32 1, i32* %832, align 4
  %833 = getelementptr i8, i8* %795, i64 26
  %834 = bitcast i8* %833 to i32*
  store i32 0, i32* %834, align 4
  %835 = getelementptr i8, i8* %795, i64 30
  %836 = bitcast i8* %835 to i32*
  store i32 0, i32* %836, align 4
  %837 = getelementptr i8, i8* %795, i64 34
  %838 = bitcast i8* %837 to i32*
  store i32 %819, i32* %838, align 4
  %839 = getelementptr i8, i8* %795, i64 38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %839, i8* noundef nonnull align 4 dereferenceable(16) %763, i64 16, i1 false) #7
  br label %934

840:                                              ; preds = %781
  %841 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %42, i64 0, i32 0, i32 0, i32 0, i64 0
  %842 = load i32, i32* %841, align 4, !tbaa !29
  %843 = call i16 @llvm.bswap.i16(i16 %762) #7
  %844 = zext i16 %843 to i32
  %845 = shl nuw i32 %844, 16
  %846 = and i32 %842, -65536
  %847 = xor i32 %846, %845
  %848 = or i32 %847, 4268
  %849 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -20) #7
  %850 = icmp eq i32 %849, 0
  br i1 %850, label %851, label %934

851:                                              ; preds = %840
  %852 = load i64, i64* %53, align 8, !tbaa !5
  %853 = inttoptr i64 %852 to i8*
  %854 = load i64, i64* %56, align 8, !tbaa !11
  %855 = inttoptr i64 %852 to %struct.ethhdr*
  %856 = getelementptr i8, i8* %853, i64 14
  %857 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %855, i64 1
  %858 = inttoptr i64 %854 to %struct.ethhdr*
  %859 = icmp ugt %struct.ethhdr* %857, %858
  %860 = getelementptr i8, i8* %853, i64 34
  %861 = bitcast i8* %860 to %struct.ethhdr*
  %862 = icmp ugt %struct.ethhdr* %861, %858
  %863 = select i1 %859, i1 true, i1 %862
  %864 = bitcast i8* %860 to %struct.iphdr*
  %865 = inttoptr i64 %854 to %struct.iphdr*
  %866 = icmp ugt %struct.iphdr* %864, %865
  %867 = select i1 %863, i1 true, i1 %866
  br i1 %867, label %934, label %868

868:                                              ; preds = %851
  %869 = getelementptr i8, i8* %853, i64 20
  %870 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %855, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %870, i8* noundef nonnull align 8 dereferenceable(6) %765, i64 6, i1 false) #7
  %871 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %855, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %871, i8* noundef nonnull align 1 dereferenceable(6) %869, i64 6, i1 false) #7
  %872 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %855, i64 0, i32 2
  store i16 8, i16* %872, align 1, !tbaa !12
  %873 = load i8, i8* %79, align 1, !tbaa !18
  %874 = bitcast i8* %763 to i32*
  %875 = load i32, i32* %874, align 4, !tbaa !29
  store i8 69, i8* %856, align 4
  %876 = bitcast i8* %869 to i16*
  store i16 0, i16* %876, align 2, !tbaa !24
  %877 = getelementptr i8, i8* %853, i64 23
  store i8 4, i8* %877, align 1, !tbaa !21
  %878 = getelementptr i8, i8* %853, i64 24
  %879 = bitcast i8* %878 to i16*
  %880 = getelementptr i8, i8* %853, i64 15
  store i8 %873, i8* %880, align 1, !tbaa !16
  %881 = add i16 %86, 20
  %882 = call i16 @llvm.bswap.i16(i16 %881) #7
  %883 = getelementptr i8, i8* %853, i64 16
  %884 = bitcast i8* %883 to i16*
  store i16 %882, i16* %884, align 2, !tbaa !23
  %885 = getelementptr i8, i8* %853, i64 18
  %886 = bitcast i8* %885 to i16*
  store i16 0, i16* %886, align 4, !tbaa !72
  %887 = getelementptr i8, i8* %853, i64 30
  %888 = bitcast i8* %887 to i32*
  store i32 %875, i32* %888, align 4, !tbaa !29
  %889 = getelementptr i8, i8* %853, i64 26
  %890 = bitcast i8* %889 to i32*
  store i32 %848, i32* %890, align 4, !tbaa !29
  %891 = getelementptr i8, i8* %853, i64 22
  store i8 64, i8* %891, align 4, !tbaa !28
  %892 = bitcast i8* %856 to i16*
  %893 = load i16, i16* %892, align 2, !tbaa !30
  %894 = zext i16 %893 to i64
  %895 = zext i16 %882 to i64
  %896 = bitcast i8* %891 to i16*
  %897 = load i16, i16* %896, align 2, !tbaa !30
  %898 = zext i16 %897 to i64
  %899 = lshr exact i32 %847, 16
  %900 = zext i32 %899 to i64
  %901 = and i32 %875, 65535
  %902 = zext i32 %901 to i64
  %903 = lshr i32 %875, 16
  %904 = zext i32 %903 to i64
  %905 = add nuw nsw i64 %895, 4268
  %906 = add nuw nsw i64 %905, %900
  %907 = add nuw nsw i64 %906, %902
  %908 = add nuw nsw i64 %907, %904
  %909 = add nuw nsw i64 %908, %894
  %910 = add nuw nsw i64 %909, %898
  %911 = icmp ult i64 %910, 65536
  %912 = lshr i64 %910, 16
  %913 = and i64 %910, 65535
  %914 = add nuw nsw i64 %913, %912
  %915 = select i1 %911, i64 %910, i64 %914
  %916 = icmp ult i64 %915, 65536
  %917 = lshr i64 %915, 16
  %918 = and i64 %915, 65535
  %919 = add nuw nsw i64 %918, %917
  %920 = select i1 %916, i64 %915, i64 %919
  %921 = icmp ult i64 %920, 65536
  %922 = lshr i64 %920, 16
  %923 = and i64 %920, 65535
  %924 = add nuw nsw i64 %923, %922
  %925 = select i1 %921, i64 %920, i64 %924
  %926 = icmp ult i64 %925, 65536
  %927 = lshr i64 %925, 16
  %928 = select i1 %926, i64 65536, i64 %927
  %929 = add nuw nsw i64 %928, %925
  %930 = trunc i64 %929 to i16
  %931 = xor i16 %930, -1
  store i16 %931, i16* %879, align 2, !tbaa !31
  br label %934

932:                                              ; preds = %321
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %322) #7
  br label %934

933:                                              ; preds = %600
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %601) #7
  br label %934

934:                                              ; preds = %933, %932, %868, %851, %840, %809, %793, %790, %770, %767, %761, %755, %725, %541, %540
  %935 = phi i32 [ 1, %541 ], [ 1, %932 ], [ 1, %933 ], [ 1, %725 ], [ 1, %761 ], [ 1, %767 ], [ 1, %770 ], [ 1, %540 ], [ 1, %755 ], [ 3, %868 ], [ 3, %809 ], [ 1, %790 ], [ 1, %793 ], [ 1, %840 ], [ 1, %851 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %317) #7
  br label %936

936:                                              ; preds = %934, %299
  %937 = phi i32 [ %935, %934 ], [ 1, %299 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %300) #7
  br label %938

938:                                              ; preds = %65, %72, %76, %94, %97, %99, %183, %186, %189, %193, %211, %218, %247, %286, %295, %936
  %939 = phi i32 [ %937, %936 ], [ 2, %211 ], [ 2, %286 ], [ 1, %295 ], [ 1, %218 ], [ 1, %247 ], [ 3, %99 ], [ 1, %183 ], [ 1, %94 ], [ 2, %97 ], [ 1, %193 ], [ 1, %186 ], [ 1, %189 ], [ 1, %76 ], [ 1, %72 ], [ 1, %65 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %69) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %68) #7
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %67) #7
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %66) #7
  br label %1848

940:                                              ; preds = %61
  %941 = bitcast %struct.packet_description* %17 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %941) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(48) %941, i8 0, i64 48, i1 false) #7
  %942 = bitcast %struct.vip_definition* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %942) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %942, i8 0, i64 20, i1 false) #7
  %943 = bitcast i32* %19 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %943) #7
  %944 = bitcast i32* %20 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %944) #7
  store i32 0, i32* %20, align 4, !tbaa !15
  %945 = getelementptr i8, i8* %55, i64 54
  %946 = icmp ugt i8* %945, %58
  br i1 %946, label %1846, label %947

947:                                              ; preds = %940
  %948 = getelementptr i8, i8* %55, i64 20
  %949 = load i8, i8* %948, align 2, !tbaa !68
  %950 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 3
  store i8 %949, i8* %950, align 4, !tbaa !22
  %951 = load i8, i8* %59, align 4
  %952 = shl i8 %951, 4
  %953 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 3
  store i8 %952, i8* %953, align 1, !tbaa !18
  %954 = getelementptr i8, i8* %55, i64 15
  %955 = load i8, i8* %954, align 1, !tbaa !29
  %956 = lshr i8 %955, 4
  %957 = or i8 %956, %952
  store i8 %957, i8* %953, align 1, !tbaa !18
  %958 = getelementptr i8, i8* %55, i64 18
  %959 = bitcast i8* %958 to i16*
  %960 = load i16, i16* %959, align 4, !tbaa !70
  %961 = tail call i16 @llvm.bswap.i16(i16 %960) #7
  switch i8 %949, label %1016 [
    i8 44, label %1846
    i8 58, label %962
  ]

962:                                              ; preds = %947
  %963 = getelementptr i8, i8* %55, i64 62
  %964 = icmp ugt i8* %963, %58
  br i1 %964, label %1846, label %965

965:                                              ; preds = %962
  %966 = load i8, i8* %945, align 4, !tbaa !73
  switch i8 %966, label %1846 [
    i8 -128, label %967
    i8 2, label %978
    i8 1, label %1002
  ]

967:                                              ; preds = %965
  %968 = bitcast [4 x i32]* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %968)
  store i8 -127, i8* %945, align 4, !tbaa !73
  %969 = getelementptr i8, i8* %55, i64 56
  %970 = bitcast i8* %969 to i16*
  %971 = load i16, i16* %970, align 2, !tbaa !75
  %972 = add i16 %971, -1
  store i16 %972, i16* %970, align 2, !tbaa !75
  %973 = getelementptr i8, i8* %55, i64 21
  store i8 64, i8* %973, align 1, !tbaa !71
  %974 = getelementptr i8, i8* %55, i64 22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %968, i8* noundef nonnull align 4 dereferenceable(16) %974, i64 16, i1 false) #7
  %975 = getelementptr i8, i8* %55, i64 38
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %974, i8* noundef nonnull align 4 dereferenceable(16) %975, i64 16, i1 false) #7
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %975, i8* noundef nonnull align 16 dereferenceable(16) %968, i64 16, i1 false) #7
  %976 = getelementptr inbounds [6 x i8], [6 x i8]* %14, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %976)
  %977 = getelementptr inbounds i8, i8* %55, i64 6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %976, i8* noundef nonnull align 1 dereferenceable(6) %977, i64 6, i1 false) #7
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %977, i8* noundef nonnull align 1 dereferenceable(6) %55, i64 6, i1 false) #7
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %55, i8* noundef nonnull align 1 dereferenceable(6) %976, i64 6, i1 false) #7
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %976)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %968)
  br label %1846

978:                                              ; preds = %965
  %979 = bitcast i32* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %979) #7
  store i32 524, i32* %16, align 4, !tbaa !15
  %980 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %979) #7
  %981 = icmp eq i8* %980, null
  br i1 %981, label %1005, label %982

982:                                              ; preds = %978
  %983 = bitcast i8* %980 to i64*
  %984 = load i64, i64* %983, align 8, !tbaa !33
  %985 = add i64 %984, 1
  store i64 %985, i64* %983, align 8, !tbaa !33
  %986 = getelementptr i8, i8* %55, i64 58
  %987 = bitcast i8* %986 to i32*
  %988 = load i32, i32* %987, align 4, !tbaa !29
  %989 = call i32 @llvm.bswap.i32(i32 %988) #7
  %990 = icmp ult i32 %989, 1280
  br i1 %990, label %991, label %996

991:                                              ; preds = %982
  %992 = getelementptr inbounds i8, i8* %980, i64 8
  %993 = bitcast i8* %992 to i64*
  %994 = load i64, i64* %993, align 8, !tbaa !35
  %995 = add i64 %994, 1
  store i64 %995, i64* %993, align 8, !tbaa !35
  br label %996

996:                                              ; preds = %991, %982
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %979) #7
  %997 = getelementptr i8, i8* %55, i64 102
  %998 = icmp ugt i8* %997, %58
  br i1 %998, label %1846, label %999

999:                                              ; preds = %996
  %1000 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 2
  %1001 = load i8, i8* %1000, align 4, !tbaa !36
  br label %1006

1002:                                             ; preds = %965
  %1003 = getelementptr i8, i8* %55, i64 102
  %1004 = icmp ugt i8* %1003, %58
  br i1 %1004, label %1846, label %1006

1005:                                             ; preds = %978
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %979) #7
  br label %1846

1006:                                             ; preds = %1002, %999
  %1007 = phi i8 [ %1001, %999 ], [ 0, %1002 ]
  %1008 = getelementptr i8, i8* %55, i64 68
  %1009 = load i8, i8* %1008, align 2, !tbaa !68
  store i8 %1009, i8* %950, align 4, !tbaa !22
  %1010 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 2
  %1011 = or i8 %1007, 1
  store i8 %1011, i8* %1010, align 4, !tbaa !36
  %1012 = getelementptr i8, i8* %55, i64 70
  %1013 = getelementptr i8, i8* %55, i64 86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %941, i8* noundef nonnull align 4 dereferenceable(16) %1013, i64 16, i1 false) #7
  %1014 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 1, i32 0, i64 0
  %1015 = bitcast i32* %1014 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %1015, i8* noundef nonnull align 4 dereferenceable(16) %1012, i64 16, i1 false) #7
  br label %1021

1016:                                             ; preds = %947
  %1017 = getelementptr i8, i8* %55, i64 22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %941, i8* noundef nonnull align 4 dereferenceable(16) %1017, i64 16, i1 false) #7
  %1018 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 1, i32 0, i64 0
  %1019 = bitcast i32* %1018 to i8*
  %1020 = getelementptr i8, i8* %55, i64 38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %1019, i8* noundef nonnull align 4 dereferenceable(16) %1020, i64 16, i1 false) #7
  br label %1021

1021:                                             ; preds = %1016, %1006
  %1022 = phi i8 [ 0, %1016 ], [ %1011, %1006 ]
  %1023 = phi i8 [ %949, %1016 ], [ %1009, %1006 ]
  switch i8 %1023, label %1846 [
    i8 6, label %1024
    i8 17, label %1053
  ]

1024:                                             ; preds = %1021
  %1025 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 2
  %1026 = and i8 %1022, 1
  %1027 = icmp eq i8 %1026, 0
  %1028 = select i1 %1027, i64 54, i64 102
  %1029 = getelementptr i8, i8* %55, i64 %1028
  %1030 = getelementptr inbounds i8, i8* %1029, i64 20
  %1031 = icmp ugt i8* %1030, %58
  br i1 %1031, label %1846, label %1032

1032:                                             ; preds = %1024
  %1033 = getelementptr inbounds i8, i8* %1029, i64 12
  %1034 = bitcast i8* %1033 to i16*
  %1035 = load i16, i16* %1034, align 4
  %1036 = and i16 %1035, 512
  %1037 = icmp eq i16 %1036, 0
  br i1 %1037, label %1040, label %1038

1038:                                             ; preds = %1032
  %1039 = or i8 %1022, 2
  store i8 %1039, i8* %1025, align 4, !tbaa !36
  br label %1040

1040:                                             ; preds = %1038, %1032
  br i1 %1027, label %1041, label %1047

1041:                                             ; preds = %1040
  %1042 = bitcast i8* %1029 to i16*
  %1043 = load i16, i16* %1042, align 4, !tbaa !37
  %1044 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 2
  %1045 = bitcast %union.anon.5* %1044 to i16*
  store i16 %1043, i16* %1045, align 4, !tbaa !29
  %1046 = getelementptr inbounds i8, i8* %1029, i64 2
  br label %1073

1047:                                             ; preds = %1040
  %1048 = getelementptr inbounds i8, i8* %1029, i64 2
  %1049 = bitcast i8* %1048 to i16*
  %1050 = load i16, i16* %1049, align 2, !tbaa !39
  %1051 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 2
  %1052 = bitcast %union.anon.5* %1051 to i16*
  store i16 %1050, i16* %1052, align 4, !tbaa !29
  br label %1073

1053:                                             ; preds = %1021
  %1054 = and i8 %1022, 1
  %1055 = icmp eq i8 %1054, 0
  %1056 = select i1 %1055, i64 54, i64 102
  %1057 = getelementptr i8, i8* %55, i64 %1056
  %1058 = getelementptr inbounds i8, i8* %1057, i64 8
  %1059 = icmp ugt i8* %1058, %58
  br i1 %1059, label %1846, label %1060

1060:                                             ; preds = %1053
  br i1 %1055, label %1061, label %1067

1061:                                             ; preds = %1060
  %1062 = bitcast i8* %1057 to i16*
  %1063 = load i16, i16* %1062, align 2, !tbaa !40
  %1064 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 2
  %1065 = bitcast %union.anon.5* %1064 to i16*
  store i16 %1063, i16* %1065, align 4, !tbaa !29
  %1066 = getelementptr inbounds i8, i8* %1057, i64 2
  br label %1073

1067:                                             ; preds = %1060
  %1068 = getelementptr inbounds i8, i8* %1057, i64 2
  %1069 = bitcast i8* %1068 to i16*
  %1070 = load i16, i16* %1069, align 2, !tbaa !42
  %1071 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 2
  %1072 = bitcast %union.anon.5* %1071 to i16*
  store i16 %1070, i16* %1072, align 4, !tbaa !29
  br label %1073

1073:                                             ; preds = %1061, %1067, %1041, %1047
  %1074 = phi %union.anon.5* [ %1044, %1041 ], [ %1051, %1047 ], [ %1064, %1061 ], [ %1071, %1067 ]
  %1075 = phi i8* [ %1046, %1041 ], [ %1029, %1047 ], [ %1066, %1061 ], [ %1057, %1067 ]
  %1076 = bitcast i8* %1075 to i16*
  %1077 = load i16, i16* %1076, align 2, !tbaa !30
  %1078 = bitcast %union.anon.5* %1074 to [2 x i16]*
  %1079 = getelementptr inbounds [2 x i16], [2 x i16]* %1078, i64 0, i64 1
  store i16 %1077, i16* %1079, align 2, !tbaa !29
  %1080 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 1, i32 0, i64 0
  %1081 = bitcast i32* %1080 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %942, i8* noundef nonnull align 4 dereferenceable(16) %1081, i64 16, i1 false) #7
  %1082 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 2
  %1083 = bitcast %union.anon.5* %1082 to [2 x i16]*
  %1084 = getelementptr inbounds [2 x i16], [2 x i16]* %1083, i64 0, i64 1
  %1085 = load i16, i16* %1084, align 2, !tbaa !29
  %1086 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %18, i64 0, i32 1
  store i16 %1085, i16* %1086, align 4, !tbaa !43
  %1087 = load i8, i8* %950, align 4, !tbaa !22
  %1088 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %18, i64 0, i32 2
  store i8 %1087, i8* %1088, align 2, !tbaa !45
  %1089 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %942) #7
  %1090 = icmp eq i8* %1089, null
  br i1 %1090, label %1091, label %1100

1091:                                             ; preds = %1073
  store i16 0, i16* %1086, align 4, !tbaa !43
  %1092 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %942) #7
  %1093 = icmp eq i8* %1092, null
  br i1 %1093, label %1846, label %1094

1094:                                             ; preds = %1091
  %1095 = bitcast i8* %1092 to i32*
  %1096 = load i32, i32* %1095, align 4, !tbaa !46
  %1097 = and i32 %1096, 136
  %1098 = icmp eq i32 %1097, 0
  br i1 %1098, label %1099, label %1100

1099:                                             ; preds = %1094
  store i16 0, i16* %1084, align 2, !tbaa !29
  br label %1100

1100:                                             ; preds = %1099, %1094, %1073
  %1101 = phi i8* [ %1089, %1073 ], [ %1092, %1094 ], [ %1092, %1099 ]
  %1102 = sub i64 %57, %54
  %1103 = icmp sgt i64 %1102, 1514
  br i1 %1103, label %1846, label %1104

1104:                                             ; preds = %1100
  %1105 = bitcast i32* %21 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1105) #7
  store i32 512, i32* %21, align 4, !tbaa !15
  %1106 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %1105) #7
  %1107 = icmp eq i8* %1106, null
  br i1 %1107, label %1844, label %1108

1108:                                             ; preds = %1104
  %1109 = bitcast i8* %1106 to i64*
  %1110 = load i64, i64* %1109, align 8, !tbaa !33
  %1111 = add i64 %1110, 1
  store i64 %1111, i64* %1109, align 8, !tbaa !33
  %1112 = bitcast i8* %1101 to i32*
  %1113 = load i32, i32* %1112, align 4, !tbaa !46
  %1114 = and i32 %1113, 1
  %1115 = icmp eq i32 %1114, 0
  br i1 %1115, label %1118, label %1116

1116:                                             ; preds = %1108
  %1117 = bitcast %union.anon.5* %1082 to i16*
  store i16 0, i16* %1117, align 4, !tbaa !29
  br label %1118

1118:                                             ; preds = %1116, %1108
  %1119 = getelementptr inbounds i8, i8* %1101, i64 4
  %1120 = bitcast i8* %1119 to i32*
  %1121 = load i32, i32* %1120, align 4, !tbaa !48
  store i32 %1121, i32* %19, align 4, !tbaa !15
  %1122 = bitcast i32* %22 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1122) #7
  %1123 = call i32 (...) @_bpf_helper_ext_0008() #7
  store i32 %1123, i32* %22, align 4, !tbaa !15
  %1124 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 34359738368, i8* noundef nonnull %1122) #7
  %1125 = icmp eq i8* %1124, null
  br i1 %1125, label %1126, label %1134

1126:                                             ; preds = %1118
  %1127 = bitcast i32* %23 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1127) #7
  store i32 515, i32* %23, align 4, !tbaa !15
  %1128 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %1127) #7
  %1129 = icmp eq i8* %1128, null
  br i1 %1129, label %1840, label %1130

1130:                                             ; preds = %1126
  %1131 = bitcast i8* %1128 to i64*
  %1132 = load i64, i64* %1131, align 8, !tbaa !33
  %1133 = add i64 %1132, 1
  store i64 %1133, i64* %1131, align 8, !tbaa !33
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1127) #7
  br label %1134

1134:                                             ; preds = %1130, %1118
  %1135 = phi i8* [ %1124, %1118 ], [ bitcast (%struct.anon.2* @fallback_cache to i8*), %1130 ]
  %1136 = load i32, i32* %1112, align 4, !tbaa !46
  %1137 = and i32 %1136, 4
  %1138 = icmp eq i32 %1137, 0
  br i1 %1138, label %1367, label %1139

1139:                                             ; preds = %1134
  %1140 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 2
  %1141 = load i8, i8* %1140, align 4, !tbaa !36
  %1142 = and i8 %1141, 1
  %1143 = icmp eq i8 %1142, 0
  br i1 %1143, label %1162, label %1144

1144:                                             ; preds = %1139
  %1145 = bitcast i32* %24 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1145) #7
  store i32 523, i32* %24, align 4, !tbaa !15
  %1146 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %1145) #7
  %1147 = icmp eq i8* %1146, null
  br i1 %1147, label %1346, label %1148

1148:                                             ; preds = %1144
  %1149 = bitcast i8* %1146 to i64*
  %1150 = load i64, i64* %1149, align 8, !tbaa !33
  %1151 = add i64 %1150, 1
  store i64 %1151, i64* %1149, align 8, !tbaa !33
  %1152 = getelementptr i8, i8* %55, i64 55
  %1153 = load i8, i8* %1152, align 1, !tbaa !76
  %1154 = add i8 %1153, -3
  %1155 = icmp ult i8 %1154, 2
  br i1 %1155, label %1156, label %1161

1156:                                             ; preds = %1148
  %1157 = getelementptr inbounds i8, i8* %1146, i64 8
  %1158 = bitcast i8* %1157 to i64*
  %1159 = load i64, i64* %1158, align 8, !tbaa !35
  %1160 = add i64 %1159, 1
  store i64 %1160, i64* %1158, align 8, !tbaa !35
  br label %1161

1161:                                             ; preds = %1156, %1148
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1145) #7
  br label %1367

1162:                                             ; preds = %1139
  %1163 = bitcast i32* %25 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1163) #7
  store i32 0, i32* %25, align 4, !tbaa !15
  %1164 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 60129542144, i8* noundef nonnull %1163) #7
  %1165 = icmp eq i8* %1164, null
  br i1 %1165, label %1345, label %1166

1166:                                             ; preds = %1162
  %1167 = load i8, i8* %1140, align 4, !tbaa !36
  %1168 = and i8 %1167, 1
  %1169 = icmp eq i8 %1168, 0
  %1170 = select i1 %1169, i64 54, i64 102
  %1171 = getelementptr i8, i8* %55, i64 %1170
  %1172 = getelementptr i8, i8* %1171, i64 8
  %1173 = getelementptr i8, i8* %1172, i64 1
  %1174 = icmp ugt i8* %1173, %58
  br i1 %1174, label %1328, label %1175

1175:                                             ; preds = %1166
  %1176 = load i8, i8* %1172, align 1, !tbaa !29
  %1177 = zext i8 %1176 to i32
  %1178 = and i32 %1177, 128
  %1179 = icmp eq i32 %1178, 0
  br i1 %1179, label %1191, label %1180

1180:                                             ; preds = %1175
  %1181 = getelementptr inbounds i8, i8* %1172, i64 14
  %1182 = icmp ugt i8* %1181, %58
  br i1 %1182, label %1328, label %1183

1183:                                             ; preds = %1180
  %1184 = and i32 %1177, 32
  %1185 = icmp eq i32 %1184, 0
  br i1 %1185, label %1332, label %1186

1186:                                             ; preds = %1183
  %1187 = getelementptr inbounds i8, i8* %1172, i64 5
  %1188 = load i8, i8* %1187, align 1, !tbaa !49
  %1189 = icmp ult i8 %1188, 8
  %1190 = getelementptr inbounds i8, i8* %1172, i64 6
  br i1 %1189, label %1328, label %1196

1191:                                             ; preds = %1175
  %1192 = getelementptr inbounds i8, i8* %1172, i64 9
  %1193 = icmp ugt i8* %1192, %58
  %1194 = icmp eq i8* %1173, null
  %1195 = or i1 %1193, %1194
  br i1 %1195, label %1328, label %1196

1196:                                             ; preds = %1191, %1186
  %1197 = phi i8* [ %1190, %1186 ], [ %1173, %1191 ]
  %1198 = load i8, i8* %1197, align 1, !tbaa !29
  %1199 = lshr i8 %1198, 6
  switch i8 %1199, label %1328 [
    i8 1, label %1200
    i8 2, label %1212
    i8 3, label %1224
  ]

1200:                                             ; preds = %1196
  %1201 = and i8 %1198, 63
  %1202 = zext i8 %1201 to i64
  %1203 = shl nuw nsw i64 %1202, 10
  %1204 = getelementptr inbounds i8, i8* %1197, i64 1
  %1205 = load i8, i8* %1204, align 1, !tbaa !29
  %1206 = zext i8 %1205 to i64
  %1207 = shl nuw nsw i64 %1206, 2
  %1208 = or i64 %1207, %1203
  %1209 = getelementptr inbounds i8, i8* %1197, i64 2
  %1210 = load i8, i8* %1209, align 1, !tbaa !29
  %1211 = lshr i8 %1210, 6
  br label %1241

1212:                                             ; preds = %1196
  %1213 = getelementptr inbounds i8, i8* %1197, i64 1
  %1214 = load i8, i8* %1213, align 1, !tbaa !29
  %1215 = zext i8 %1214 to i64
  %1216 = shl nuw nsw i64 %1215, 16
  %1217 = getelementptr inbounds i8, i8* %1197, i64 2
  %1218 = load i8, i8* %1217, align 1, !tbaa !29
  %1219 = zext i8 %1218 to i64
  %1220 = shl nuw nsw i64 %1219, 8
  %1221 = or i64 %1220, %1216
  %1222 = getelementptr inbounds i8, i8* %1197, i64 3
  %1223 = load i8, i8* %1222, align 1, !tbaa !29
  br label %1241

1224:                                             ; preds = %1196
  %1225 = getelementptr inbounds i8, i8* %1197, i64 1
  %1226 = load i8, i8* %1225, align 1, !tbaa !29
  %1227 = zext i8 %1226 to i64
  %1228 = shl nuw nsw i64 %1227, 24
  %1229 = getelementptr inbounds i8, i8* %1197, i64 2
  %1230 = load i8, i8* %1229, align 1, !tbaa !29
  %1231 = zext i8 %1230 to i64
  %1232 = shl nuw nsw i64 %1231, 16
  %1233 = or i64 %1232, %1228
  %1234 = getelementptr inbounds i8, i8* %1197, i64 3
  %1235 = load i8, i8* %1234, align 1, !tbaa !29
  %1236 = zext i8 %1235 to i64
  %1237 = shl nuw nsw i64 %1236, 8
  %1238 = or i64 %1233, %1237
  %1239 = getelementptr inbounds i8, i8* %1197, i64 4
  %1240 = load i8, i8* %1239, align 1, !tbaa !29
  br label %1241

1241:                                             ; preds = %1224, %1212, %1200
  %1242 = phi i8 [ %1211, %1200 ], [ %1223, %1212 ], [ %1240, %1224 ]
  %1243 = phi i64 [ %1208, %1200 ], [ %1221, %1212 ], [ %1238, %1224 ]
  %1244 = phi i64 [ 56, %1200 ], [ 64, %1212 ], [ 72, %1224 ]
  %1245 = zext i8 %1242 to i64
  %1246 = or i64 %1243, %1245
  %1247 = trunc i64 %1246 to i32
  %1248 = icmp sgt i32 %1247, 0
  br i1 %1248, label %1249, label %1328

1249:                                             ; preds = %1241
  %1250 = getelementptr inbounds i8, i8* %1164, i64 %1244
  %1251 = bitcast i8* %1250 to i64*
  %1252 = load i64, i64* %1251, align 8, !tbaa !51
  %1253 = add i64 %1252, 1
  store i64 %1253, i64* %1251, align 8, !tbaa !51
  %1254 = bitcast i32* %26 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1254) #7
  store i32 %1247, i32* %26, align 4, !tbaa !15
  %1255 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 68719476736, i8* noundef nonnull %1254) #7
  %1256 = icmp eq i8* %1255, null
  br i1 %1256, label %1348, label %1257

1257:                                             ; preds = %1249
  %1258 = bitcast i8* %1255 to i32*
  %1259 = load i32, i32* %1258, align 4, !tbaa !15
  store i32 %1259, i32* %26, align 4, !tbaa !15
  %1260 = icmp eq i32 %1259, 0
  br i1 %1260, label %1348, label %1261

1261:                                             ; preds = %1257
  %1262 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 1
  store i32 %1259, i32* %1262, align 4, !tbaa !52
  %1263 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %1254) #7
  %1264 = icmp eq i8* %1263, null
  br i1 %1264, label %1265, label %1270

1265:                                             ; preds = %1261
  %1266 = getelementptr inbounds i8, i8* %1164, i64 40
  %1267 = bitcast i8* %1266 to i64*
  %1268 = load i64, i64* %1267, align 8, !tbaa !53
  %1269 = add i64 %1268, 1
  store i64 %1269, i64* %1267, align 8, !tbaa !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1254) #7
  br label %1345

1270:                                             ; preds = %1261
  %1271 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0
  %1272 = call i8* (i8*, %struct.flow_key*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i8*, %struct.flow_key*, ...)*)(i8* noundef %1135, %struct.flow_key* noundef nonnull %1271) #7
  %1273 = icmp eq i8* %1272, null
  br i1 %1273, label %1279, label %1274

1274:                                             ; preds = %1270
  %1275 = bitcast i8* %1272 to i32*
  %1276 = load i32, i32* %1275, align 8, !tbaa !55
  %1277 = load i32, i32* %1262, align 4, !tbaa !52
  %1278 = icmp eq i32 %1276, %1277
  br i1 %1278, label %1303, label %1308

1279:                                             ; preds = %1270
  %1280 = bitcast i32* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1280) #7
  store i32 514, i32* %12, align 4, !tbaa !15
  %1281 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %1280) #7
  %1282 = icmp eq i8* %1281, null
  br i1 %1282, label %1297, label %1283

1283:                                             ; preds = %1279
  %1284 = call i32 (...) @_bpf_helper_ext_0005() #7
  %1285 = sext i32 %1284 to i64
  %1286 = getelementptr inbounds i8, i8* %1281, i64 8
  %1287 = bitcast i8* %1286 to i64*
  %1288 = load i64, i64* %1287, align 8, !tbaa !35
  %1289 = sub i64 %1285, %1288
  %1290 = icmp ugt i64 %1289, 1000000000
  %1291 = bitcast i8* %1281 to i64*
  br i1 %1290, label %1292, label %1293

1292:                                             ; preds = %1283
  store i64 1, i64* %1291, align 8, !tbaa !33
  store i64 %1285, i64* %1287, align 8, !tbaa !35
  br label %1298

1293:                                             ; preds = %1283
  %1294 = load i64, i64* %1291, align 8, !tbaa !33
  %1295 = add i64 %1294, 1
  store i64 %1295, i64* %1291, align 8, !tbaa !33
  %1296 = icmp ugt i64 %1295, 125000
  br i1 %1296, label %1297, label %1298

1297:                                             ; preds = %1293, %1279
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1280) #7
  br label %1323

1298:                                             ; preds = %1293, %1292
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1280) #7
  %1299 = bitcast %struct.real_pos_lru* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1299) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %1299, i8 0, i64 16, i1 false) #7
  %1300 = load i32, i32* %1262, align 4, !tbaa !52
  %1301 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %13, i64 0, i32 0
  store i32 %1300, i32* %1301, align 8, !tbaa !55
  %1302 = call i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...)*)(i8* noundef %1135, %struct.flow_key* noundef nonnull %1271, %struct.real_pos_lru* noundef nonnull %13, i32 noundef 0) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1299) #7
  br label %1323

1303:                                             ; preds = %1274
  %1304 = getelementptr inbounds i8, i8* %1164, i64 80
  %1305 = bitcast i8* %1304 to i64*
  %1306 = load i64, i64* %1305, align 8, !tbaa !57
  %1307 = add i64 %1306, 1
  store i64 %1307, i64* %1305, align 8, !tbaa !57
  br label %1360

1308:                                             ; preds = %1274
  store i32 %1277, i32* %1275, align 8, !tbaa !55
  %1309 = getelementptr inbounds i8, i8* %1164, i64 88
  %1310 = bitcast i8* %1309 to i64*
  %1311 = load i64, i64* %1310, align 8, !tbaa !58
  %1312 = add i64 %1311, 1
  store i64 %1312, i64* %1310, align 8, !tbaa !58
  %1313 = load i32, i32* %19, align 4, !tbaa !15
  %1314 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1314) #7
  store i32 %1313, i32* %11, align 4, !tbaa !15
  %1315 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 77309411328, i8* noundef nonnull %1314) #7
  %1316 = icmp eq i8* %1315, null
  br i1 %1316, label %1322, label %1317

1317:                                             ; preds = %1308
  %1318 = getelementptr inbounds i8, i8* %1315, i64 8
  %1319 = bitcast i8* %1318 to i64*
  %1320 = load i64, i64* %1319, align 8, !tbaa !35
  %1321 = add i64 %1320, 1
  store i64 %1321, i64* %1319, align 8, !tbaa !35
  br label %1322

1322:                                             ; preds = %1317, %1308
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1314) #7
  br label %1360

1323:                                             ; preds = %1298, %1297
  %1324 = getelementptr inbounds i8, i8* %1164, i64 96
  %1325 = bitcast i8* %1324 to i64*
  %1326 = load i64, i64* %1325, align 8, !tbaa !59
  %1327 = add i64 %1326, 1
  store i64 %1327, i64* %1325, align 8, !tbaa !59
  br label %1360

1328:                                             ; preds = %1241, %1196, %1191, %1186, %1180, %1166
  %1329 = bitcast i8* %1164 to i64*
  %1330 = load i64, i64* %1329, align 8, !tbaa !60
  %1331 = add i64 %1330, 1
  store i64 %1331, i64* %1329, align 8, !tbaa !60
  br label %1347

1332:                                             ; preds = %1183
  %1333 = getelementptr inbounds i8, i8* %1164, i64 8
  %1334 = bitcast i8* %1333 to i64*
  %1335 = load i64, i64* %1334, align 8, !tbaa !61
  %1336 = add i64 %1335, 1
  store i64 %1336, i64* %1334, align 8, !tbaa !61
  %1337 = bitcast i32* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1337) #7
  store i32 %1121, i32* %10, align 4, !tbaa !15
  %1338 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 77309411328, i8* noundef nonnull %1337) #7
  %1339 = icmp eq i8* %1338, null
  br i1 %1339, label %1344, label %1340

1340:                                             ; preds = %1332
  %1341 = bitcast i8* %1338 to i64*
  %1342 = load i64, i64* %1341, align 8, !tbaa !33
  %1343 = add i64 %1342, 1
  store i64 %1343, i64* %1341, align 8, !tbaa !33
  br label %1344

1344:                                             ; preds = %1340, %1332
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1337) #7
  br label %1347

1345:                                             ; preds = %1265, %1162
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1163) #7
  br label %1842

1346:                                             ; preds = %1144
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1145) #7
  br label %1842

1347:                                             ; preds = %1344, %1328
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1163) #7
  br label %1367

1348:                                             ; preds = %1257, %1249
  %1349 = getelementptr inbounds i8, i8* %1164, i64 16
  %1350 = bitcast i8* %1349 to i64*
  %1351 = load i64, i64* %1350, align 8, !tbaa !62
  %1352 = add i64 %1351, 1
  store i64 %1352, i64* %1350, align 8, !tbaa !62
  %1353 = shl i64 %1246, 32
  %1354 = ashr exact i64 %1353, 32
  %1355 = getelementptr inbounds i8, i8* %1164, i64 24
  %1356 = bitcast i8* %1355 to i64*
  store i64 %1354, i64* %1356, align 8, !tbaa !63
  %1357 = bitcast i8* %1164 to i64*
  %1358 = load i64, i64* %1357, align 8, !tbaa !60
  %1359 = add i64 %1358, 1
  store i64 %1359, i64* %1357, align 8, !tbaa !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1254) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1163) #7
  br label %1367

1360:                                             ; preds = %1323, %1322, %1303
  %1361 = getelementptr inbounds i8, i8* %1164, i64 32
  %1362 = bitcast i8* %1361 to i64*
  %1363 = load i64, i64* %1362, align 8, !tbaa !64
  %1364 = add i64 %1363, 1
  store i64 %1364, i64* %1362, align 8, !tbaa !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1254) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1163) #7
  %1365 = bitcast %union.anon.5* %1082 to i16*
  %1366 = load i16, i16* %1365, align 4, !tbaa !29
  br label %1667

1367:                                             ; preds = %1348, %1347, %1161, %1134
  %1368 = bitcast %union.anon.5* %1082 to i16*
  %1369 = load i16, i16* %1368, align 4, !tbaa !29
  %1370 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 2
  %1371 = load i8, i8* %1370, align 4, !tbaa !36
  %1372 = and i8 %1371, 2
  %1373 = icmp eq i8 %1372, 0
  br i1 %1373, label %1374, label %1402

1374:                                             ; preds = %1367
  %1375 = load i32, i32* %1112, align 4, !tbaa !46
  %1376 = and i32 %1375, 2
  %1377 = icmp eq i32 %1376, 0
  br i1 %1377, label %1378, label %1402

1378:                                             ; preds = %1374
  %1379 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1379) #7
  %1380 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0
  %1381 = call i8* (i8*, %struct.flow_key*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i8*, %struct.flow_key*, ...)*)(i8* noundef %1135, %struct.flow_key* noundef nonnull %1380) #7
  %1382 = icmp eq i8* %1381, null
  br i1 %1382, label %1395, label %1383

1383:                                             ; preds = %1378
  %1384 = load i8, i8* %950, align 4, !tbaa !22
  %1385 = icmp eq i8 %1384, 17
  br i1 %1385, label %1386, label %1396

1386:                                             ; preds = %1383
  %1387 = call i32 (...) @_bpf_helper_ext_0005() #7
  %1388 = sext i32 %1387 to i64
  %1389 = getelementptr inbounds i8, i8* %1381, i64 8
  %1390 = bitcast i8* %1389 to i64*
  %1391 = load i64, i64* %1390, align 8, !tbaa !65
  %1392 = sub i64 %1388, %1391
  %1393 = icmp ugt i64 %1392, 30000000000
  br i1 %1393, label %1395, label %1394

1394:                                             ; preds = %1386
  store i64 %1388, i64* %1390, align 8, !tbaa !65
  br label %1396

1395:                                             ; preds = %1386, %1378
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1379) #7
  br label %1402

1396:                                             ; preds = %1394, %1383
  %1397 = bitcast i8* %1381 to i32*
  %1398 = load i32, i32* %1397, align 8, !tbaa !55
  store i32 %1398, i32* %9, align 4, !tbaa !15
  %1399 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 1
  store i32 %1398, i32* %1399, align 4, !tbaa !52
  %1400 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %1379) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1379) #7
  %1401 = icmp eq i8* %1400, null
  br i1 %1401, label %1402, label %1667

1402:                                             ; preds = %1396, %1395, %1374, %1367
  %1403 = load i8, i8* %950, align 4, !tbaa !22
  %1404 = icmp eq i8 %1403, 6
  br i1 %1404, label %1405, label %1419

1405:                                             ; preds = %1402
  %1406 = bitcast i32* %27 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1406) #7
  store i32 513, i32* %27, align 4, !tbaa !15
  %1407 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %1406) #7
  %1408 = icmp eq i8* %1407, null
  br i1 %1408, label %1841, label %1409

1409:                                             ; preds = %1405
  %1410 = load i8, i8* %1370, align 4, !tbaa !36
  %1411 = shl i8 %1410, 2
  %1412 = and i8 %1411, 8
  %1413 = xor i8 %1412, 8
  %1414 = zext i8 %1413 to i64
  %1415 = getelementptr i8, i8* %1407, i64 %1414
  %1416 = bitcast i8* %1415 to i64*
  %1417 = load i64, i64* %1416, align 8, !tbaa !51
  %1418 = add i64 %1417, 1
  store i64 %1418, i64* %1416, align 8, !tbaa !51
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1406) #7
  br label %1419

1419:                                             ; preds = %1409, %1402
  %1420 = bitcast %struct.real_pos_lru* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1420) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %1420, i8 0, i64 16, i1 false) #7
  %1421 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1421) #7
  %1422 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1422) #7
  store i32 514, i32* %6, align 4, !tbaa !15
  %1423 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %1422) #7
  %1424 = icmp eq i8* %1423, null
  br i1 %1424, label %1440, label %1425

1425:                                             ; preds = %1419
  %1426 = call i32 (...) @_bpf_helper_ext_0005() #7
  %1427 = sext i32 %1426 to i64
  %1428 = getelementptr inbounds i8, i8* %1423, i64 8
  %1429 = bitcast i8* %1428 to i64*
  %1430 = load i64, i64* %1429, align 8, !tbaa !35
  %1431 = sub i64 %1427, %1430
  %1432 = icmp ugt i64 %1431, 1000000000
  %1433 = bitcast i8* %1423 to i64*
  br i1 %1432, label %1434, label %1435

1434:                                             ; preds = %1425
  store i64 1, i64* %1433, align 8, !tbaa !33
  store i64 %1427, i64* %1429, align 8, !tbaa !35
  br label %1439

1435:                                             ; preds = %1425
  %1436 = load i64, i64* %1433, align 8, !tbaa !33
  %1437 = add i64 %1436, 1
  store i64 %1437, i64* %1433, align 8, !tbaa !33
  %1438 = icmp ugt i64 %1437, 125000
  br i1 %1438, label %1440, label %1439

1439:                                             ; preds = %1435, %1434
  br label %1440

1440:                                             ; preds = %1439, %1435, %1419
  %1441 = phi i64 [ 0, %1419 ], [ %1427, %1439 ], [ %1427, %1435 ]
  %1442 = phi i1 [ true, %1419 ], [ false, %1439 ], [ true, %1435 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1422) #7
  %1443 = load i32, i32* %1112, align 4, !tbaa !46
  %1444 = and i32 %1443, 8
  %1445 = icmp eq i32 %1444, 0
  br i1 %1445, label %1446, label %1462

1446:                                             ; preds = %1440
  %1447 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 0, i32 0, i64 0
  %1448 = load i32, i32* %1447, align 4, !tbaa !29
  %1449 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 0, i32 0, i64 1
  %1450 = load i32, i32* %1449, align 4, !tbaa !15
  %1451 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 0, i32 0, i64 2
  %1452 = load i32, i32* %1451, align 4, !tbaa !15
  %1453 = getelementptr inbounds i8, i8* %941, i64 15
  %1454 = load i8, i8* %1453, align 1, !tbaa !29
  %1455 = getelementptr inbounds i8, i8* %941, i64 14
  %1456 = load i8, i8* %1455, align 2, !tbaa !29
  %1457 = getelementptr inbounds i8, i8* %941, i64 13
  %1458 = load i8, i8* %1457, align 1, !tbaa !29
  %1459 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 0, i32 0, i64 3
  %1460 = bitcast i32* %1459 to i8*
  %1461 = load i8, i8* %1460, align 4, !tbaa !29
  br label %1464

1462:                                             ; preds = %1440
  %1463 = load i16, i16* %1084, align 2, !tbaa !29
  store i16 %1463, i16* %1368, align 4, !tbaa !29
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %941, i8 0, i64 16, i1 false) #7
  br label %1464

1464:                                             ; preds = %1446, %1462
  %1465 = phi i8 [ %1461, %1446 ], [ 0, %1462 ]
  %1466 = phi i8 [ %1458, %1446 ], [ 0, %1462 ]
  %1467 = phi i8 [ %1456, %1446 ], [ 0, %1462 ]
  %1468 = phi i8 [ %1454, %1446 ], [ 0, %1462 ]
  %1469 = phi i32 [ %1452, %1446 ], [ 0, %1462 ]
  %1470 = phi i32 [ %1450, %1446 ], [ 0, %1462 ]
  %1471 = phi i32 [ %1448, %1446 ], [ 0, %1462 ]
  %1472 = add i32 %1470, -559038209
  %1473 = add i32 %1469, -559038209
  %1474 = sub i32 %1471, %1469
  %1475 = call i32 @llvm.fshl.i32(i32 %1473, i32 %1473, i32 4) #7
  %1476 = xor i32 %1475, %1474
  %1477 = add i32 %1473, %1472
  %1478 = sub i32 %1472, %1476
  %1479 = call i32 @llvm.fshl.i32(i32 %1476, i32 %1476, i32 6) #7
  %1480 = xor i32 %1478, %1479
  %1481 = add i32 %1476, %1477
  %1482 = sub i32 %1477, %1480
  %1483 = call i32 @llvm.fshl.i32(i32 %1480, i32 %1480, i32 8) #7
  %1484 = xor i32 %1482, %1483
  %1485 = add i32 %1480, %1481
  %1486 = sub i32 %1481, %1484
  %1487 = call i32 @llvm.fshl.i32(i32 %1484, i32 %1484, i32 16) #7
  %1488 = xor i32 %1486, %1487
  %1489 = add i32 %1484, %1485
  %1490 = sub i32 %1485, %1488
  %1491 = call i32 @llvm.fshl.i32(i32 %1488, i32 %1488, i32 19) #7
  %1492 = xor i32 %1490, %1491
  %1493 = add i32 %1488, %1489
  %1494 = sub i32 %1489, %1492
  %1495 = call i32 @llvm.fshl.i32(i32 %1492, i32 %1492, i32 4) #7
  %1496 = xor i32 %1494, %1495
  %1497 = add i32 %1492, %1493
  %1498 = zext i8 %1468 to i32
  %1499 = shl nuw i32 %1498, 24
  %1500 = zext i8 %1467 to i32
  %1501 = shl nuw nsw i32 %1500, 16
  %1502 = zext i8 %1466 to i32
  %1503 = shl nuw nsw i32 %1502, 8
  %1504 = zext i8 %1465 to i32
  %1505 = or i32 %1501, %1499
  %1506 = or i32 %1505, %1503
  %1507 = or i32 %1506, %1504
  %1508 = add i32 %1493, %1507
  %1509 = xor i32 %1496, %1497
  %1510 = call i32 @llvm.fshl.i32(i32 %1497, i32 %1497, i32 14) #7
  %1511 = sub i32 %1509, %1510
  %1512 = xor i32 %1511, %1508
  %1513 = call i32 @llvm.fshl.i32(i32 %1511, i32 %1511, i32 11) #7
  %1514 = sub i32 %1512, %1513
  %1515 = xor i32 %1514, %1497
  %1516 = call i32 @llvm.fshl.i32(i32 %1514, i32 %1514, i32 25) #7
  %1517 = sub i32 %1515, %1516
  %1518 = xor i32 %1517, %1511
  %1519 = call i32 @llvm.fshl.i32(i32 %1517, i32 %1517, i32 16) #7
  %1520 = sub i32 %1518, %1519
  %1521 = xor i32 %1520, %1514
  %1522 = call i32 @llvm.fshl.i32(i32 %1520, i32 %1520, i32 4) #7
  %1523 = sub i32 %1521, %1522
  %1524 = xor i32 %1523, %1517
  %1525 = call i32 @llvm.fshl.i32(i32 %1523, i32 %1523, i32 14) #7
  %1526 = sub i32 %1524, %1525
  %1527 = xor i32 %1526, %1520
  %1528 = call i32 @llvm.fshl.i32(i32 %1526, i32 %1526, i32 24) #7
  %1529 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 2, i32 0
  %1530 = load i32, i32* %1529, align 4, !tbaa !29
  %1531 = sub i32 -525483785, %1528
  %1532 = add i32 %1531, %1527
  %1533 = add i32 %1530, -525483785
  %1534 = xor i32 %1533, -525483785
  %1535 = call i32 @llvm.fshl.i32(i32 %1533, i32 %1533, i32 14) #7
  %1536 = sub i32 %1534, %1535
  %1537 = xor i32 %1532, %1536
  %1538 = call i32 @llvm.fshl.i32(i32 %1536, i32 %1536, i32 11) #7
  %1539 = sub i32 %1537, %1538
  %1540 = xor i32 %1539, %1533
  %1541 = call i32 @llvm.fshl.i32(i32 %1539, i32 %1539, i32 25) #7
  %1542 = sub i32 %1540, %1541
  %1543 = xor i32 %1542, %1536
  %1544 = call i32 @llvm.fshl.i32(i32 %1542, i32 %1542, i32 16) #7
  %1545 = sub i32 %1543, %1544
  %1546 = xor i32 %1545, %1539
  %1547 = call i32 @llvm.fshl.i32(i32 %1545, i32 %1545, i32 4) #7
  %1548 = sub i32 %1546, %1547
  %1549 = xor i32 %1548, %1542
  %1550 = call i32 @llvm.fshl.i32(i32 %1548, i32 %1548, i32 14) #7
  %1551 = sub i32 %1549, %1550
  %1552 = xor i32 %1551, %1545
  %1553 = call i32 @llvm.fshl.i32(i32 %1551, i32 %1551, i32 24) #7
  %1554 = sub i32 %1552, %1553
  %1555 = urem i32 %1554, 65537
  %1556 = load i32, i32* %1120, align 4, !tbaa !48
  %1557 = mul i32 %1556, 65537
  %1558 = add i32 %1555, %1557
  store i32 %1558, i32* %8, align 4, !tbaa !15
  %1559 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 30064771072, i8* noundef nonnull %1421) #7
  %1560 = icmp eq i8* %1559, null
  br i1 %1560, label %1607, label %1561

1561:                                             ; preds = %1464
  %1562 = bitcast i8* %1559 to i32*
  %1563 = load i32, i32* %1562, align 4, !tbaa !15
  store i32 %1563, i32* %8, align 4, !tbaa !15
  %1564 = icmp eq i32 %1563, 0
  br i1 %1564, label %1565, label %1576

1565:                                             ; preds = %1561
  %1566 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1566) #7
  store i32 521, i32* %5, align 4, !tbaa !15
  %1567 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %1566) #7
  %1568 = icmp eq i8* %1567, null
  br i1 %1568, label %1574, label %1569

1569:                                             ; preds = %1565
  %1570 = getelementptr inbounds i8, i8* %1567, i64 8
  %1571 = bitcast i8* %1570 to i64*
  %1572 = load i64, i64* %1571, align 8, !tbaa !35
  %1573 = add i64 %1572, 1
  store i64 %1573, i64* %1571, align 8, !tbaa !35
  br label %1574

1574:                                             ; preds = %1569, %1565
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1566) #7
  %1575 = load i32, i32* %8, align 4, !tbaa !15
  br label %1576

1576:                                             ; preds = %1574, %1561
  %1577 = phi i32 [ %1575, %1574 ], [ %1563, %1561 ]
  %1578 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 1
  store i32 %1577, i32* %1578, align 4, !tbaa !52
  %1579 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %1421) #7
  %1580 = icmp eq i8* %1579, null
  br i1 %1580, label %1581, label %1590

1581:                                             ; preds = %1576
  %1582 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1582) #7
  store i32 521, i32* %4, align 4, !tbaa !15
  %1583 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %1582) #7
  %1584 = icmp eq i8* %1583, null
  br i1 %1584, label %1589, label %1585

1585:                                             ; preds = %1581
  %1586 = bitcast i8* %1583 to i64*
  %1587 = load i64, i64* %1586, align 8, !tbaa !33
  %1588 = add i64 %1587, 1
  store i64 %1588, i64* %1586, align 8, !tbaa !33
  br label %1589

1589:                                             ; preds = %1585, %1581
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1582) #7
  br label %1607

1590:                                             ; preds = %1576
  %1591 = icmp eq i8* %1135, null
  br i1 %1591, label %1608, label %1592

1592:                                             ; preds = %1590
  %1593 = load i32, i32* %1112, align 4, !tbaa !46
  %1594 = and i32 %1593, 2
  %1595 = icmp ne i32 %1594, 0
  %1596 = or i1 %1442, %1595
  br i1 %1596, label %1608, label %1597

1597:                                             ; preds = %1592
  %1598 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0
  %1599 = load i8, i8* %950, align 4, !tbaa !22
  %1600 = icmp eq i8 %1599, 17
  br i1 %1600, label %1601, label %1603

1601:                                             ; preds = %1597
  %1602 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %7, i64 0, i32 1
  store i64 %1441, i64* %1602, align 8, !tbaa !65
  br label %1603

1603:                                             ; preds = %1601, %1597
  %1604 = load i32, i32* %8, align 4, !tbaa !15
  %1605 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %7, i64 0, i32 0
  store i32 %1604, i32* %1605, align 8, !tbaa !55
  %1606 = call i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...)*)(i8* noundef nonnull %1135, %struct.flow_key* noundef nonnull %1598, %struct.real_pos_lru* noundef nonnull %7, i32 noundef 0) #7
  br label %1608

1607:                                             ; preds = %1589, %1464
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1421) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1420) #7
  br label %1842

1608:                                             ; preds = %1603, %1592, %1590
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1421) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1420) #7
  %1609 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1609) #7
  store i32 0, i32* %2, align 4, !tbaa !15
  %1610 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 51539607552, i8* noundef nonnull %1609) #7
  %1611 = icmp eq i8* %1610, null
  br i1 %1611, label %1661, label %1612

1612:                                             ; preds = %1608
  %1613 = bitcast i8* %1610 to i32*
  %1614 = load i32, i32* %1613, align 4, !tbaa !29
  %1615 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %18, i64 0, i32 0, i32 0, i64 0
  %1616 = load i32, i32* %1615, align 4, !tbaa !29
  %1617 = icmp eq i32 %1614, %1616
  br i1 %1617, label %1618, label %1639

1618:                                             ; preds = %1612
  %1619 = getelementptr inbounds i8, i8* %1610, i64 4
  %1620 = bitcast i8* %1619 to i32*
  %1621 = load i32, i32* %1620, align 4, !tbaa !29
  %1622 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %18, i64 0, i32 0, i32 0, i64 1
  %1623 = load i32, i32* %1622, align 4, !tbaa !29
  %1624 = icmp eq i32 %1621, %1623
  br i1 %1624, label %1625, label %1639

1625:                                             ; preds = %1618
  %1626 = getelementptr inbounds i8, i8* %1610, i64 8
  %1627 = bitcast i8* %1626 to i32*
  %1628 = load i32, i32* %1627, align 4, !tbaa !29
  %1629 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %18, i64 0, i32 0, i32 0, i64 2
  %1630 = load i32, i32* %1629, align 4, !tbaa !29
  %1631 = icmp eq i32 %1628, %1630
  br i1 %1631, label %1632, label %1639

1632:                                             ; preds = %1625
  %1633 = getelementptr inbounds i8, i8* %1610, i64 12
  %1634 = bitcast i8* %1633 to i32*
  %1635 = load i32, i32* %1634, align 4, !tbaa !29
  %1636 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %18, i64 0, i32 0, i32 0, i64 3
  %1637 = load i32, i32* %1636, align 4, !tbaa !29
  %1638 = icmp ne i32 %1635, %1637
  br label %1639

1639:                                             ; preds = %1632, %1625, %1618, %1612
  %1640 = phi i1 [ %1638, %1632 ], [ true, %1625 ], [ true, %1618 ], [ true, %1612 ]
  %1641 = getelementptr inbounds i8, i8* %1610, i64 16
  %1642 = bitcast i8* %1641 to i16*
  %1643 = load i16, i16* %1642, align 4, !tbaa !43
  %1644 = load i16, i16* %1086, align 4, !tbaa !43
  %1645 = load i8, i8* %1088, align 2, !tbaa !45
  %1646 = getelementptr inbounds i8, i8* %1610, i64 18
  store i8 %1645, i8* %1646, align 2, !tbaa !45
  %1647 = icmp eq i8 %1645, 0
  %1648 = icmp ne i16 %1643, %1644
  %1649 = select i1 %1640, i1 true, i1 %1648
  %1650 = select i1 %1649, i1 true, i1 %1647
  br i1 %1650, label %1662, label %1651

1651:                                             ; preds = %1639
  %1652 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1652) #7
  %1653 = load i32, i32* %1578, align 4, !tbaa !52
  store i32 %1653, i32* %3, align 4, !tbaa !15
  %1654 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 47244640256, i8* noundef nonnull %1652) #7
  %1655 = bitcast i8* %1654 to i32*
  %1656 = icmp eq i8* %1654, null
  br i1 %1656, label %1660, label %1657

1657:                                             ; preds = %1651
  %1658 = load i32, i32* %1655, align 4, !tbaa !15
  %1659 = add i32 %1658, 1
  store i32 %1659, i32* %1655, align 4, !tbaa !15
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1652) #7
  br label %1662

1660:                                             ; preds = %1651
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1652) #7
  br label %1661

1661:                                             ; preds = %1660, %1608
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1609) #7
  br label %1842

1662:                                             ; preds = %1657, %1639
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1609) #7
  %1663 = getelementptr inbounds i8, i8* %1106, i64 8
  %1664 = bitcast i8* %1663 to i64*
  %1665 = load i64, i64* %1664, align 8, !tbaa !35
  %1666 = add i64 %1665, 1
  store i64 %1666, i64* %1664, align 8, !tbaa !35
  br label %1667

1667:                                             ; preds = %1662, %1396, %1360
  %1668 = phi i16 [ %1369, %1662 ], [ %1369, %1396 ], [ %1366, %1360 ]
  %1669 = phi i8* [ %1579, %1662 ], [ %1400, %1396 ], [ %1263, %1360 ]
  %1670 = bitcast %union.anon.5* %1082 to i16*
  %1671 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %944) #7
  %1672 = icmp eq i8* %1671, null
  br i1 %1672, label %1842, label %1673

1673:                                             ; preds = %1667
  %1674 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 55834574848, i8* noundef nonnull %943) #7
  %1675 = icmp eq i8* %1674, null
  br i1 %1675, label %1842, label %1676

1676:                                             ; preds = %1673
  %1677 = zext i16 %961 to i64
  %1678 = bitcast i8* %1674 to <2 x i64>*
  %1679 = load <2 x i64>, <2 x i64>* %1678, align 8, !tbaa !51
  %1680 = insertelement <2 x i64> <i64 1, i64 poison>, i64 %1677, i64 1
  %1681 = add <2 x i64> %1679, %1680
  %1682 = bitcast i8* %1674 to <2 x i64>*
  store <2 x i64> %1681, <2 x i64>* %1682, align 8, !tbaa !51
  %1683 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 1
  %1684 = bitcast i32* %1683 to i8*
  %1685 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 42949672960, i8* noundef nonnull %1684) #7
  %1686 = icmp eq i8* %1685, null
  br i1 %1686, label %1842, label %1687

1687:                                             ; preds = %1676
  %1688 = bitcast i8* %1685 to <2 x i64>*
  %1689 = load <2 x i64>, <2 x i64>* %1688, align 8, !tbaa !51
  %1690 = add <2 x i64> %1689, %1680
  %1691 = bitcast i8* %1685 to <2 x i64>*
  store <2 x i64> %1690, <2 x i64>* %1691, align 8, !tbaa !51
  store i16 %1668, i16* %1670, align 4, !tbaa !29
  %1692 = getelementptr inbounds i8, i8* %1669, i64 16
  %1693 = load i8, i8* %1692, align 4, !tbaa !66
  %1694 = and i8 %1693, 1
  %1695 = icmp eq i8 %1694, 0
  br i1 %1695, label %1748, label %1696

1696:                                             ; preds = %1687
  %1697 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -40) #7
  %1698 = icmp eq i32 %1697, 0
  br i1 %1698, label %1699, label %1842

1699:                                             ; preds = %1696
  %1700 = load i64, i64* %53, align 8, !tbaa !5
  %1701 = inttoptr i64 %1700 to i8*
  %1702 = load i64, i64* %56, align 8, !tbaa !11
  %1703 = inttoptr i64 %1700 to %struct.ethhdr*
  %1704 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1703, i64 1
  %1705 = inttoptr i64 %1702 to %struct.ethhdr*
  %1706 = icmp ugt %struct.ethhdr* %1704, %1705
  %1707 = getelementptr i8, i8* %1701, i64 54
  %1708 = bitcast i8* %1707 to %struct.ethhdr*
  %1709 = icmp ugt %struct.ethhdr* %1708, %1705
  %1710 = select i1 %1706, i1 true, i1 %1709
  %1711 = bitcast i8* %1707 to %struct.ipv6hdr*
  %1712 = inttoptr i64 %1702 to %struct.ipv6hdr*
  %1713 = icmp ugt %struct.ipv6hdr* %1711, %1712
  %1714 = select i1 %1710, i1 true, i1 %1713
  br i1 %1714, label %1842, label %1715

1715:                                             ; preds = %1699
  %1716 = getelementptr i8, i8* %1701, i64 14
  %1717 = getelementptr i8, i8* %1701, i64 40
  %1718 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1703, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %1718, i8* noundef nonnull align 8 dereferenceable(6) %1671, i64 6, i1 false) #7
  %1719 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1703, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %1719, i8* noundef nonnull align 1 dereferenceable(6) %1717, i64 6, i1 false) #7
  %1720 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1703, i64 0, i32 2
  store i16 -8826, i16* %1720, align 1, !tbaa !12
  %1721 = load i16, i16* %1670, align 4, !tbaa !29
  %1722 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 0, i32 0, i64 3
  %1723 = load i32, i32* %1722, align 4, !tbaa !29
  %1724 = zext i16 %1721 to i32
  %1725 = xor i32 %1723, %1724
  %1726 = add i16 %961, 40
  %1727 = load i8, i8* %953, align 1, !tbaa !18
  %1728 = getelementptr i8, i8* %1701, i64 15
  %1729 = getelementptr i8, i8* %1701, i64 16
  %1730 = bitcast i8* %1729 to i16*
  store i16 0, i16* %1730, align 1
  %1731 = lshr i8 %1727, 4
  %1732 = or i8 %1731, 96
  store i8 %1732, i8* %1716, align 4
  %1733 = shl i8 %1727, 4
  store i8 %1733, i8* %1728, align 1, !tbaa !29
  %1734 = getelementptr i8, i8* %1701, i64 20
  store i8 41, i8* %1734, align 2, !tbaa !68
  %1735 = call i16 @llvm.bswap.i16(i16 %1726) #7
  %1736 = getelementptr i8, i8* %1701, i64 18
  %1737 = bitcast i8* %1736 to i16*
  store i16 %1735, i16* %1737, align 4, !tbaa !70
  %1738 = getelementptr i8, i8* %1701, i64 21
  store i8 64, i8* %1738, align 1, !tbaa !71
  %1739 = getelementptr i8, i8* %1701, i64 22
  %1740 = bitcast i8* %1739 to i32*
  store i32 1, i32* %1740, align 4
  %1741 = getelementptr i8, i8* %1701, i64 26
  %1742 = bitcast i8* %1741 to i32*
  store i32 0, i32* %1742, align 4
  %1743 = getelementptr i8, i8* %1701, i64 30
  %1744 = bitcast i8* %1743 to i32*
  store i32 0, i32* %1744, align 4
  %1745 = getelementptr i8, i8* %1701, i64 34
  %1746 = bitcast i8* %1745 to i32*
  store i32 %1725, i32* %1746, align 4
  %1747 = getelementptr i8, i8* %1701, i64 38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %1747, i8* noundef nonnull align 4 dereferenceable(16) %1669, i64 16, i1 false) #7
  br label %1842

1748:                                             ; preds = %1687
  %1749 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %17, i64 0, i32 0, i32 0, i32 0, i64 0
  %1750 = load i32, i32* %1749, align 4, !tbaa !29
  %1751 = call i16 @llvm.bswap.i16(i16 %1668) #7
  %1752 = zext i16 %1751 to i32
  %1753 = shl nuw i32 %1752, 16
  %1754 = and i32 %1750, -65536
  %1755 = xor i32 %1754, %1753
  %1756 = or i32 %1755, 4268
  %1757 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -20) #7
  %1758 = icmp eq i32 %1757, 0
  br i1 %1758, label %1759, label %1842

1759:                                             ; preds = %1748
  %1760 = load i64, i64* %53, align 8, !tbaa !5
  %1761 = inttoptr i64 %1760 to i8*
  %1762 = load i64, i64* %56, align 8, !tbaa !11
  %1763 = inttoptr i64 %1760 to %struct.ethhdr*
  %1764 = getelementptr i8, i8* %1761, i64 14
  %1765 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1763, i64 1
  %1766 = inttoptr i64 %1762 to %struct.ethhdr*
  %1767 = icmp ugt %struct.ethhdr* %1765, %1766
  %1768 = getelementptr i8, i8* %1761, i64 34
  %1769 = bitcast i8* %1768 to %struct.ethhdr*
  %1770 = icmp ugt %struct.ethhdr* %1769, %1766
  %1771 = select i1 %1767, i1 true, i1 %1770
  %1772 = bitcast i8* %1768 to %struct.iphdr*
  %1773 = inttoptr i64 %1762 to %struct.iphdr*
  %1774 = icmp ugt %struct.iphdr* %1772, %1773
  %1775 = select i1 %1771, i1 true, i1 %1774
  br i1 %1775, label %1842, label %1776

1776:                                             ; preds = %1759
  %1777 = getelementptr i8, i8* %1761, i64 20
  %1778 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1763, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %1778, i8* noundef nonnull align 8 dereferenceable(6) %1671, i64 6, i1 false) #7
  %1779 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1763, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %1779, i8* noundef nonnull align 1 dereferenceable(6) %1777, i64 6, i1 false) #7
  %1780 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1763, i64 0, i32 2
  store i16 8, i16* %1780, align 1, !tbaa !12
  %1781 = load i8, i8* %953, align 1, !tbaa !18
  %1782 = bitcast i8* %1669 to i32*
  %1783 = load i32, i32* %1782, align 4, !tbaa !29
  store i8 69, i8* %1764, align 4
  %1784 = bitcast i8* %1777 to i16*
  store i16 0, i16* %1784, align 2, !tbaa !24
  %1785 = getelementptr i8, i8* %1761, i64 23
  store i8 4, i8* %1785, align 1, !tbaa !21
  %1786 = getelementptr i8, i8* %1761, i64 24
  %1787 = bitcast i8* %1786 to i16*
  %1788 = getelementptr i8, i8* %1761, i64 15
  store i8 %1781, i8* %1788, align 1, !tbaa !16
  %1789 = add i16 %961, 20
  %1790 = call i16 @llvm.bswap.i16(i16 %1789) #7
  %1791 = getelementptr i8, i8* %1761, i64 16
  %1792 = bitcast i8* %1791 to i16*
  store i16 %1790, i16* %1792, align 2, !tbaa !23
  %1793 = getelementptr i8, i8* %1761, i64 18
  %1794 = bitcast i8* %1793 to i16*
  store i16 0, i16* %1794, align 4, !tbaa !72
  %1795 = getelementptr i8, i8* %1761, i64 30
  %1796 = bitcast i8* %1795 to i32*
  store i32 %1783, i32* %1796, align 4, !tbaa !29
  %1797 = getelementptr i8, i8* %1761, i64 26
  %1798 = bitcast i8* %1797 to i32*
  store i32 %1756, i32* %1798, align 4, !tbaa !29
  %1799 = getelementptr i8, i8* %1761, i64 22
  store i8 64, i8* %1799, align 4, !tbaa !28
  %1800 = bitcast i8* %1764 to i16*
  %1801 = load i16, i16* %1800, align 2, !tbaa !30
  %1802 = zext i16 %1801 to i64
  %1803 = zext i16 %1790 to i64
  %1804 = bitcast i8* %1799 to i16*
  %1805 = load i16, i16* %1804, align 2, !tbaa !30
  %1806 = zext i16 %1805 to i64
  %1807 = lshr exact i32 %1755, 16
  %1808 = zext i32 %1807 to i64
  %1809 = and i32 %1783, 65535
  %1810 = zext i32 %1809 to i64
  %1811 = lshr i32 %1783, 16
  %1812 = zext i32 %1811 to i64
  %1813 = add nuw nsw i64 %1803, 4268
  %1814 = add nuw nsw i64 %1813, %1808
  %1815 = add nuw nsw i64 %1814, %1810
  %1816 = add nuw nsw i64 %1815, %1812
  %1817 = add nuw nsw i64 %1816, %1802
  %1818 = add nuw nsw i64 %1817, %1806
  %1819 = icmp ult i64 %1818, 65536
  %1820 = lshr i64 %1818, 16
  %1821 = and i64 %1818, 65535
  %1822 = add nuw nsw i64 %1821, %1820
  %1823 = select i1 %1819, i64 %1818, i64 %1822
  %1824 = icmp ult i64 %1823, 65536
  %1825 = lshr i64 %1823, 16
  %1826 = and i64 %1823, 65535
  %1827 = add nuw nsw i64 %1826, %1825
  %1828 = select i1 %1824, i64 %1823, i64 %1827
  %1829 = icmp ult i64 %1828, 65536
  %1830 = lshr i64 %1828, 16
  %1831 = and i64 %1828, 65535
  %1832 = add nuw nsw i64 %1831, %1830
  %1833 = select i1 %1829, i64 %1828, i64 %1832
  %1834 = icmp ult i64 %1833, 65536
  %1835 = lshr i64 %1833, 16
  %1836 = select i1 %1834, i64 65536, i64 %1835
  %1837 = add nuw nsw i64 %1836, %1833
  %1838 = trunc i64 %1837 to i16
  %1839 = xor i16 %1838, -1
  store i16 %1839, i16* %1787, align 2, !tbaa !31
  br label %1842

1840:                                             ; preds = %1126
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1127) #7
  br label %1842

1841:                                             ; preds = %1405
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1406) #7
  br label %1842

1842:                                             ; preds = %1841, %1840, %1776, %1759, %1748, %1715, %1699, %1696, %1676, %1673, %1667, %1661, %1607, %1346, %1345
  %1843 = phi i32 [ 1, %1346 ], [ 1, %1840 ], [ 1, %1841 ], [ 1, %1607 ], [ 1, %1667 ], [ 1, %1673 ], [ 1, %1676 ], [ 1, %1345 ], [ 1, %1661 ], [ 3, %1776 ], [ 3, %1715 ], [ 1, %1696 ], [ 1, %1699 ], [ 1, %1748 ], [ 1, %1759 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1122) #7
  br label %1844

1844:                                             ; preds = %1842, %1104
  %1845 = phi i32 [ %1843, %1842 ], [ 1, %1104 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1105) #7
  br label %1846

1846:                                             ; preds = %940, %947, %962, %965, %967, %996, %1002, %1005, %1021, %1024, %1053, %1091, %1100, %1844
  %1847 = phi i32 [ %1845, %1844 ], [ 2, %1021 ], [ 2, %1091 ], [ 1, %1100 ], [ 1, %1024 ], [ 1, %1053 ], [ 3, %967 ], [ 1, %996 ], [ 1, %962 ], [ 2, %965 ], [ 1, %1005 ], [ 1, %1002 ], [ 1, %947 ], [ 1, %940 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %944) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %943) #7
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %942) #7
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %941) #7
  br label %1848

1848:                                             ; preds = %61, %1, %1846, %938
  %1849 = phi i32 [ %939, %938 ], [ %1847, %1846 ], [ 1, %1 ], [ 2, %61 ]
  ret i32 %1849
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @bpf_main(i8* noundef %0) local_unnamed_addr #0 {
  %2 = bitcast i8* %0 to %struct.xdp_md*
  %3 = tail call i32 @balancer_ingress(%struct.xdp_md* noundef %2)
  ret i32 %3
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i32 @_bpf_helper_ext_0008(...) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #5

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #5

declare i8* @_bpf_helper_ext_0001(...) local_unnamed_addr #4

declare i32 @_bpf_helper_ext_0002(...) local_unnamed_addr #4

declare i32 @_bpf_helper_ext_0005(...) local_unnamed_addr #4

declare i32 @_bpf_helper_ext_0044(...) local_unnamed_addr #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #6

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nounwind willreturn writeonly }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #7 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !7, i64 0}
!6 = !{!"xdp_md", !7, i64 0, !7, i64 8, !10, i64 16, !10, i64 20, !10, i64 24}
!7 = !{!"long long", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!6, !7, i64 8}
!12 = !{!13, !14, i64 12}
!13 = !{!"ethhdr", !8, i64 0, !8, i64 6, !14, i64 12}
!14 = !{!"short", !8, i64 0}
!15 = !{!10, !10, i64 0}
!16 = !{!17, !8, i64 1}
!17 = !{!"iphdr", !8, i64 0, !8, i64 0, !8, i64 1, !14, i64 2, !14, i64 4, !14, i64 6, !8, i64 8, !8, i64 9, !14, i64 10, !8, i64 12}
!18 = !{!19, !8, i64 45}
!19 = !{!"packet_description", !20, i64 0, !10, i64 40, !8, i64 44, !8, i64 45}
!20 = !{!"flow_key", !8, i64 0, !8, i64 16, !8, i64 32, !8, i64 36}
!21 = !{!17, !8, i64 9}
!22 = !{!19, !8, i64 36}
!23 = !{!17, !14, i64 2}
!24 = !{!17, !14, i64 6}
!25 = !{!26, !8, i64 0}
!26 = !{!"icmphdr", !8, i64 0, !8, i64 1, !14, i64 2, !8, i64 4}
!27 = !{!26, !14, i64 2}
!28 = !{!17, !8, i64 8}
!29 = !{!8, !8, i64 0}
!30 = !{!14, !14, i64 0}
!31 = !{!17, !14, i64 10}
!32 = !{!26, !8, i64 1}
!33 = !{!34, !7, i64 0}
!34 = !{!"lb_stats", !7, i64 0, !7, i64 8}
!35 = !{!34, !7, i64 8}
!36 = !{!19, !8, i64 44}
!37 = !{!38, !14, i64 0}
!38 = !{!"tcphdr", !14, i64 0, !14, i64 2, !10, i64 4, !10, i64 8, !14, i64 12, !14, i64 12, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 13, !14, i64 14, !14, i64 16, !14, i64 18}
!39 = !{!38, !14, i64 2}
!40 = !{!41, !14, i64 0}
!41 = !{!"udphdr", !14, i64 0, !14, i64 2, !14, i64 4, !14, i64 6}
!42 = !{!41, !14, i64 2}
!43 = !{!44, !14, i64 16}
!44 = !{!"vip_definition", !8, i64 0, !14, i64 16, !8, i64 18}
!45 = !{!44, !8, i64 18}
!46 = !{!47, !10, i64 0}
!47 = !{!"vip_meta", !10, i64 0, !10, i64 4}
!48 = !{!47, !10, i64 4}
!49 = !{!50, !8, i64 5}
!50 = !{!"quic_long_header", !8, i64 0, !10, i64 1, !8, i64 5, !8, i64 6}
!51 = !{!7, !7, i64 0}
!52 = !{!19, !10, i64 40}
!53 = !{!54, !7, i64 40}
!54 = !{!"lb_quic_packets_stats", !7, i64 0, !7, i64 8, !7, i64 16, !7, i64 24, !7, i64 32, !7, i64 40, !7, i64 48, !7, i64 56, !7, i64 64, !7, i64 72, !7, i64 80, !7, i64 88, !7, i64 96}
!55 = !{!56, !10, i64 0}
!56 = !{!"real_pos_lru", !10, i64 0, !7, i64 8}
!57 = !{!54, !7, i64 80}
!58 = !{!54, !7, i64 88}
!59 = !{!54, !7, i64 96}
!60 = !{!54, !7, i64 0}
!61 = !{!54, !7, i64 8}
!62 = !{!54, !7, i64 16}
!63 = !{!54, !7, i64 24}
!64 = !{!54, !7, i64 32}
!65 = !{!56, !7, i64 8}
!66 = !{!67, !8, i64 16}
!67 = !{!"real_definition", !8, i64 0, !8, i64 16}
!68 = !{!69, !8, i64 6}
!69 = !{!"ipv6hdr", !8, i64 0, !8, i64 0, !8, i64 1, !14, i64 4, !8, i64 6, !8, i64 7, !8, i64 8}
!70 = !{!69, !14, i64 4}
!71 = !{!69, !8, i64 7}
!72 = !{!17, !14, i64 4}
!73 = !{!74, !8, i64 0}
!74 = !{!"icmp6hdr", !8, i64 0, !8, i64 1, !14, i64 2, !8, i64 4}
!75 = !{!74, !14, i64 2}
!76 = !{!74, !8, i64 1}

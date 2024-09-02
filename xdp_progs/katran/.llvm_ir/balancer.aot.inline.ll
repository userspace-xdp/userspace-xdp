; ModuleID = 'lib-inline/bpf/balancer.bpf.c'
source_filename = "lib-inline/bpf/balancer.bpf.c"
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
%struct.__lb_stats = type { i64, i64 }
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
@__lru_miss_stats = internal unnamed_addr global [4096 x i32] zeroinitializer, align 16
@__reals_stats = internal unnamed_addr global [4096 x %struct.__lb_stats] zeroinitializer, align 16
@__stats = internal unnamed_addr global [1024 x %struct.__lb_stats] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define dso_local i32 @balancer_ingress(%struct.xdp_md* noundef %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.real_pos_lru, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.real_pos_lru, align 8
  %9 = alloca [6 x i8], align 1
  %10 = alloca [4 x i32], align 16
  %11 = alloca %struct.packet_description, align 4
  %12 = alloca %struct.vip_definition, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca %struct.real_pos_lru, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca %struct.real_pos_lru, align 8
  %24 = alloca [6 x i8], align 1
  %25 = alloca %struct.packet_description, align 4
  %26 = alloca %struct.vip_definition, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0
  %32 = load i64, i64* %31, align 8, !tbaa !5
  %33 = inttoptr i64 %32 to i8*
  %34 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1
  %35 = load i64, i64* %34, align 8, !tbaa !11
  %36 = inttoptr i64 %35 to i8*
  %37 = getelementptr i8, i8* %33, i64 14
  %38 = icmp ugt i8* %37, %36
  br i1 %38, label %1660, label %39

39:                                               ; preds = %1
  %40 = inttoptr i64 %32 to %struct.ethhdr*
  %41 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %40, i64 0, i32 2
  %42 = load i16, i16* %41, align 1, !tbaa !12
  switch i16 %42, label %1660 [
    i16 8, label %43
    i16 -8826, label %836
  ]

43:                                               ; preds = %39
  %44 = bitcast %struct.packet_description* %25 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %44) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(48) %44, i8 0, i64 48, i1 false) #7
  %45 = bitcast %struct.vip_definition* %26 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %45) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %45, i8 0, i64 20, i1 false) #7
  %46 = bitcast i32* %27 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %46) #7
  store i32 0, i32* %27, align 4, !tbaa !15
  %47 = getelementptr i8, i8* %33, i64 34
  %48 = icmp ugt i8* %47, %36
  br i1 %48, label %834, label %49

49:                                               ; preds = %43
  %50 = load i8, i8* %37, align 4
  %51 = and i8 %50, 15
  %52 = icmp eq i8 %51, 5
  br i1 %52, label %53, label %834

53:                                               ; preds = %49
  %54 = getelementptr i8, i8* %33, i64 15
  %55 = load i8, i8* %54, align 1, !tbaa !16
  %56 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 3
  store i8 %55, i8* %56, align 1, !tbaa !18
  %57 = getelementptr i8, i8* %33, i64 23
  %58 = load i8, i8* %57, align 1, !tbaa !21
  %59 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 3
  store i8 %58, i8* %59, align 4, !tbaa !22
  %60 = getelementptr i8, i8* %33, i64 16
  %61 = bitcast i8* %60 to i16*
  %62 = load i16, i16* %61, align 2, !tbaa !23
  %63 = tail call i16 @llvm.bswap.i16(i16 %62) #7
  %64 = getelementptr i8, i8* %33, i64 20
  %65 = bitcast i8* %64 to i16*
  %66 = load i16, i16* %65, align 2, !tbaa !24
  %67 = and i16 %66, -193
  %68 = icmp eq i16 %67, 0
  br i1 %68, label %69, label %834

69:                                               ; preds = %53
  %70 = icmp eq i8 %58, 1
  br i1 %70, label %71, label %172

71:                                               ; preds = %69
  %72 = getelementptr i8, i8* %33, i64 42
  %73 = icmp ugt i8* %72, %36
  br i1 %73, label %834, label %74

74:                                               ; preds = %71
  %75 = load i8, i8* %47, align 4, !tbaa !25
  switch i8 %75, label %834 [
    i8 8, label %76
    i8 3, label %138
  ]

76:                                               ; preds = %74
  store i8 0, i8* %47, align 4, !tbaa !25
  %77 = getelementptr i8, i8* %33, i64 36
  %78 = bitcast i8* %77 to i16*
  %79 = load i16, i16* %78, align 2, !tbaa !27
  %80 = add i16 %79, 8
  store i16 %80, i16* %78, align 2, !tbaa !27
  %81 = getelementptr i8, i8* %33, i64 22
  store i8 64, i8* %81, align 4, !tbaa !28
  %82 = getelementptr i8, i8* %33, i64 26
  %83 = getelementptr i8, i8* %33, i64 30
  %84 = bitcast i8* %83 to i32*
  %85 = load i32, i32* %84, align 4, !tbaa !29
  %86 = bitcast i8* %82 to i32*
  %87 = load i32, i32* %86, align 4, !tbaa !29
  store i32 %87, i32* %84, align 4, !tbaa !29
  store i32 %85, i32* %86, align 4, !tbaa !29
  %88 = getelementptr i8, i8* %33, i64 24
  %89 = bitcast i8* %88 to i16*
  %90 = bitcast i8* %37 to i16*
  %91 = load i16, i16* %90, align 2, !tbaa !30
  %92 = zext i16 %91 to i64
  %93 = getelementptr i8, i8* %33, i64 18
  %94 = bitcast i8* %93 to i16*
  %95 = zext i16 %62 to i64
  %96 = load i16, i16* %94, align 2, !tbaa !30
  %97 = zext i16 %96 to i64
  %98 = bitcast i8* %81 to i16*
  %99 = zext i16 %66 to i64
  %100 = load i16, i16* %98, align 2, !tbaa !30
  %101 = zext i16 %100 to i64
  %102 = and i32 %85, 65535
  %103 = lshr i32 %85, 16
  %104 = and i32 %87, 65535
  %105 = lshr i32 %87, 16
  %106 = add nuw nsw i32 %103, %102
  %107 = add nuw nsw i32 %106, %104
  %108 = add nuw nsw i32 %107, %105
  %109 = zext i32 %108 to i64
  %110 = add nuw nsw i64 %99, %95
  %111 = add nuw nsw i64 %110, %92
  %112 = add nuw nsw i64 %111, %109
  %113 = add nuw nsw i64 %112, %97
  %114 = add nuw nsw i64 %113, %101
  %115 = icmp ult i64 %114, 65536
  %116 = lshr i64 %114, 16
  %117 = and i64 %114, 65535
  %118 = add nuw nsw i64 %117, %116
  %119 = select i1 %115, i64 %114, i64 %118
  %120 = icmp ult i64 %119, 65536
  %121 = lshr i64 %119, 16
  %122 = and i64 %119, 65535
  %123 = add nuw nsw i64 %122, %121
  %124 = select i1 %120, i64 %119, i64 %123
  %125 = icmp ult i64 %124, 65536
  %126 = lshr i64 %124, 16
  %127 = and i64 %124, 65535
  %128 = add nuw nsw i64 %127, %126
  %129 = select i1 %125, i64 %124, i64 %128
  %130 = icmp ult i64 %129, 65536
  %131 = lshr i64 %129, 16
  %132 = select i1 %130, i64 65536, i64 %131
  %133 = add nuw nsw i64 %132, %129
  %134 = trunc i64 %133 to i16
  %135 = xor i16 %134, -1
  store i16 %135, i16* %89, align 2, !tbaa !31
  %136 = getelementptr inbounds [6 x i8], [6 x i8]* %24, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %136)
  %137 = getelementptr inbounds i8, i8* %33, i64 6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %136, i8* noundef nonnull align 1 dereferenceable(6) %137, i64 6, i1 false) #7
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %137, i8* noundef nonnull align 1 dereferenceable(6) %33, i64 6, i1 false) #7
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %33, i8* noundef nonnull align 1 dereferenceable(6) %136, i64 6, i1 false) #7
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %136)
  br label %834

138:                                              ; preds = %74
  %139 = getelementptr i8, i8* %33, i64 35
  %140 = load i8, i8* %139, align 1, !tbaa !32
  %141 = icmp eq i8 %140, 4
  br i1 %141, label %142, label %156

142:                                              ; preds = %138
  %143 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 525, i32 0), align 16, !tbaa !33
  %144 = add i64 %143, 1
  store i64 %144, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 525, i32 0), align 16, !tbaa !33
  %145 = getelementptr i8, i8* %33, i64 40
  %146 = bitcast i8* %145 to i16*
  %147 = load i16, i16* %146, align 2, !tbaa !29
  %148 = trunc i16 %147 to i8
  %149 = icmp ult i8 %148, 5
  br i1 %149, label %150, label %153

150:                                              ; preds = %142
  %151 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 525, i32 1), align 8, !tbaa !35
  %152 = add i64 %151, 1
  store i64 %152, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 525, i32 1), align 8, !tbaa !35
  br label %153

153:                                              ; preds = %150, %142
  %154 = getelementptr i8, i8* %33, i64 62
  %155 = icmp ugt i8* %154, %36
  br i1 %155, label %834, label %159

156:                                              ; preds = %138
  %157 = getelementptr i8, i8* %33, i64 62
  %158 = icmp ugt i8* %157, %36
  br i1 %158, label %834, label %159

159:                                              ; preds = %156, %153
  %160 = load i8, i8* %72, align 4
  %161 = and i8 %160, 15
  %162 = icmp eq i8 %161, 5
  br i1 %162, label %163, label %834

163:                                              ; preds = %159
  %164 = getelementptr i8, i8* %33, i64 51
  %165 = load i8, i8* %164, align 1, !tbaa !21
  store i8 %165, i8* %59, align 4, !tbaa !22
  %166 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 2
  store i8 1, i8* %166, align 4, !tbaa !36
  %167 = getelementptr i8, i8* %33, i64 54
  %168 = getelementptr i8, i8* %33, i64 58
  %169 = bitcast i8* %168 to i32*
  %170 = load i32, i32* %169, align 4, !tbaa !29
  %171 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 0, i32 0, i64 0
  store i32 %170, i32* %171, align 4, !tbaa !29
  br label %178

172:                                              ; preds = %69
  %173 = getelementptr i8, i8* %33, i64 26
  %174 = bitcast i8* %173 to i32*
  %175 = load i32, i32* %174, align 4, !tbaa !29
  %176 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 0, i32 0, i64 0
  store i32 %175, i32* %176, align 4, !tbaa !29
  %177 = getelementptr i8, i8* %33, i64 30
  br label %178

178:                                              ; preds = %172, %163
  %179 = phi i8* [ %177, %172 ], [ %167, %163 ]
  %180 = phi i8 [ 2, %172 ], [ 3, %163 ]
  %181 = phi i8 [ %58, %172 ], [ %165, %163 ]
  %182 = bitcast i8* %179 to i32*
  %183 = load i32, i32* %182, align 4, !tbaa !29
  %184 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 1, i32 0, i64 0
  store i32 %183, i32* %184, align 4, !tbaa !29
  switch i8 %181, label %834 [
    i8 6, label %185
    i8 17, label %211
  ]

185:                                              ; preds = %178
  %186 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 2
  %187 = select i1 %70, i64 62, i64 34
  %188 = getelementptr i8, i8* %33, i64 %187
  %189 = getelementptr inbounds i8, i8* %188, i64 20
  %190 = icmp ugt i8* %189, %36
  br i1 %190, label %834, label %191

191:                                              ; preds = %185
  %192 = getelementptr inbounds i8, i8* %188, i64 12
  %193 = bitcast i8* %192 to i16*
  %194 = load i16, i16* %193, align 4
  %195 = and i16 %194, 512
  %196 = icmp eq i16 %195, 0
  br i1 %196, label %198, label %197

197:                                              ; preds = %191
  store i8 %180, i8* %186, align 4, !tbaa !36
  br label %198

198:                                              ; preds = %197, %191
  br i1 %70, label %205, label %199

199:                                              ; preds = %198
  %200 = bitcast i8* %188 to i16*
  %201 = load i16, i16* %200, align 4, !tbaa !37
  %202 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 2
  %203 = bitcast %union.anon.5* %202 to i16*
  store i16 %201, i16* %203, align 4, !tbaa !29
  %204 = getelementptr inbounds i8, i8* %188, i64 2
  br label %229

205:                                              ; preds = %198
  %206 = getelementptr inbounds i8, i8* %188, i64 2
  %207 = bitcast i8* %206 to i16*
  %208 = load i16, i16* %207, align 2, !tbaa !39
  %209 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 2
  %210 = bitcast %union.anon.5* %209 to i16*
  store i16 %208, i16* %210, align 4, !tbaa !29
  br label %229

211:                                              ; preds = %178
  %212 = select i1 %70, i64 62, i64 34
  %213 = getelementptr i8, i8* %33, i64 %212
  %214 = getelementptr inbounds i8, i8* %213, i64 8
  %215 = icmp ugt i8* %214, %36
  br i1 %215, label %834, label %216

216:                                              ; preds = %211
  br i1 %70, label %223, label %217

217:                                              ; preds = %216
  %218 = bitcast i8* %213 to i16*
  %219 = load i16, i16* %218, align 2, !tbaa !40
  %220 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 2
  %221 = bitcast %union.anon.5* %220 to i16*
  store i16 %219, i16* %221, align 4, !tbaa !29
  %222 = getelementptr inbounds i8, i8* %213, i64 2
  br label %229

223:                                              ; preds = %216
  %224 = getelementptr inbounds i8, i8* %213, i64 2
  %225 = bitcast i8* %224 to i16*
  %226 = load i16, i16* %225, align 2, !tbaa !42
  %227 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 2
  %228 = bitcast %union.anon.5* %227 to i16*
  store i16 %226, i16* %228, align 4, !tbaa !29
  br label %229

229:                                              ; preds = %217, %223, %199, %205
  %230 = phi %union.anon.5* [ %202, %199 ], [ %209, %205 ], [ %220, %217 ], [ %227, %223 ]
  %231 = phi i8* [ %204, %199 ], [ %188, %205 ], [ %222, %217 ], [ %213, %223 ]
  %232 = bitcast i8* %231 to i16*
  %233 = load i16, i16* %232, align 2, !tbaa !30
  %234 = bitcast %union.anon.5* %230 to [2 x i16]*
  %235 = getelementptr inbounds [2 x i16], [2 x i16]* %234, i64 0, i64 1
  store i16 %233, i16* %235, align 2, !tbaa !29
  %236 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 1, i32 0, i64 0
  %237 = load i32, i32* %236, align 4, !tbaa !29
  %238 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %26, i64 0, i32 0, i32 0, i64 0
  store i32 %237, i32* %238, align 4, !tbaa !29
  %239 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 2
  %240 = bitcast %union.anon.5* %239 to [2 x i16]*
  %241 = getelementptr inbounds [2 x i16], [2 x i16]* %240, i64 0, i64 1
  %242 = load i16, i16* %241, align 2, !tbaa !29
  %243 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %26, i64 0, i32 1
  store i16 %242, i16* %243, align 4, !tbaa !43
  %244 = load i8, i8* %59, align 4, !tbaa !22
  %245 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %26, i64 0, i32 2
  store i8 %244, i8* %245, align 2, !tbaa !45
  %246 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %45) #7
  %247 = icmp eq i8* %246, null
  br i1 %247, label %248, label %257

248:                                              ; preds = %229
  store i16 0, i16* %243, align 4, !tbaa !43
  %249 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %45) #7
  %250 = icmp eq i8* %249, null
  br i1 %250, label %834, label %251

251:                                              ; preds = %248
  %252 = bitcast i8* %249 to i32*
  %253 = load i32, i32* %252, align 4, !tbaa !46
  %254 = and i32 %253, 136
  %255 = icmp eq i32 %254, 0
  br i1 %255, label %256, label %257

256:                                              ; preds = %251
  store i16 0, i16* %241, align 2, !tbaa !29
  br label %257

257:                                              ; preds = %256, %251, %229
  %258 = phi i8* [ %246, %229 ], [ %249, %251 ], [ %249, %256 ]
  %259 = sub i64 %35, %32
  %260 = icmp sgt i64 %259, 1514
  br i1 %260, label %834, label %261

261:                                              ; preds = %257
  %262 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 512, i32 0), align 16, !tbaa !33
  %263 = add i64 %262, 1
  store i64 %263, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 512, i32 0), align 16, !tbaa !33
  %264 = bitcast i8* %258 to i32*
  %265 = load i32, i32* %264, align 4, !tbaa !46
  %266 = and i32 %265, 1
  %267 = icmp eq i32 %266, 0
  br i1 %267, label %270, label %268

268:                                              ; preds = %261
  %269 = bitcast %union.anon.5* %239 to i16*
  store i16 0, i16* %269, align 4, !tbaa !29
  br label %270

270:                                              ; preds = %268, %261
  %271 = getelementptr inbounds i8, i8* %258, i64 4
  %272 = bitcast i8* %271 to i32*
  %273 = load i32, i32* %272, align 4, !tbaa !48
  %274 = bitcast i32* %28 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %274) #7
  %275 = call i32 (...) @_bpf_helper_ext_0008() #7
  store i32 %275, i32* %28, align 4, !tbaa !15
  %276 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 34359738368, i8* noundef nonnull %274) #7
  %277 = icmp eq i8* %276, null
  br i1 %277, label %278, label %281

278:                                              ; preds = %270
  %279 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 515, i32 0), align 16, !tbaa !33
  %280 = add i64 %279, 1
  store i64 %280, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 515, i32 0), align 16, !tbaa !33
  br label %281

281:                                              ; preds = %278, %270
  %282 = phi i8* [ %276, %270 ], [ bitcast (%struct.anon.2* @fallback_cache to i8*), %278 ]
  %283 = load i32, i32* %264, align 4, !tbaa !46
  %284 = and i32 %283, 4
  %285 = icmp eq i32 %284, 0
  br i1 %285, label %496, label %286

286:                                              ; preds = %281
  %287 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 2
  %288 = load i8, i8* %287, align 4, !tbaa !36
  %289 = and i8 %288, 1
  %290 = icmp eq i8 %289, 0
  br i1 %290, label %301, label %291

291:                                              ; preds = %286
  %292 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 523, i32 0), align 16, !tbaa !33
  %293 = add i64 %292, 1
  store i64 %293, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 523, i32 0), align 16, !tbaa !33
  %294 = getelementptr i8, i8* %33, i64 35
  %295 = load i8, i8* %294, align 1, !tbaa !32
  %296 = and i8 %295, -3
  %297 = icmp eq i8 %296, 1
  br i1 %297, label %298, label %496

298:                                              ; preds = %291
  %299 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 523, i32 1), align 8, !tbaa !35
  %300 = add i64 %299, 1
  store i64 %300, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 523, i32 1), align 8, !tbaa !35
  br label %496

301:                                              ; preds = %286
  %302 = bitcast i32* %29 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %302) #7
  store i32 0, i32* %29, align 4, !tbaa !15
  %303 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 60129542144, i8* noundef nonnull %302) #7
  %304 = icmp eq i8* %303, null
  br i1 %304, label %475, label %305

305:                                              ; preds = %301
  %306 = load i8, i8* %287, align 4, !tbaa !36
  %307 = and i8 %306, 1
  %308 = icmp eq i8 %307, 0
  %309 = select i1 %308, i64 34, i64 62
  %310 = getelementptr i8, i8* %33, i64 %309
  %311 = getelementptr i8, i8* %310, i64 8
  %312 = getelementptr i8, i8* %311, i64 1
  %313 = icmp ugt i8* %312, %36
  br i1 %313, label %458, label %314

314:                                              ; preds = %305
  %315 = load i8, i8* %311, align 1, !tbaa !29
  %316 = zext i8 %315 to i32
  %317 = and i32 %316, 128
  %318 = icmp eq i32 %317, 0
  br i1 %318, label %330, label %319

319:                                              ; preds = %314
  %320 = getelementptr inbounds i8, i8* %311, i64 14
  %321 = icmp ugt i8* %320, %36
  br i1 %321, label %458, label %322

322:                                              ; preds = %319
  %323 = and i32 %316, 32
  %324 = icmp eq i32 %323, 0
  br i1 %324, label %462, label %325

325:                                              ; preds = %322
  %326 = getelementptr inbounds i8, i8* %311, i64 5
  %327 = load i8, i8* %326, align 1, !tbaa !49
  %328 = icmp ult i8 %327, 8
  %329 = getelementptr inbounds i8, i8* %311, i64 6
  br i1 %328, label %458, label %335

330:                                              ; preds = %314
  %331 = getelementptr inbounds i8, i8* %311, i64 9
  %332 = icmp ugt i8* %331, %36
  %333 = icmp eq i8* %312, null
  %334 = or i1 %332, %333
  br i1 %334, label %458, label %335

335:                                              ; preds = %330, %325
  %336 = phi i8* [ %329, %325 ], [ %312, %330 ]
  %337 = load i8, i8* %336, align 1, !tbaa !29
  %338 = lshr i8 %337, 6
  switch i8 %338, label %458 [
    i8 1, label %339
    i8 2, label %351
    i8 3, label %363
  ]

339:                                              ; preds = %335
  %340 = and i8 %337, 63
  %341 = zext i8 %340 to i64
  %342 = shl nuw nsw i64 %341, 10
  %343 = getelementptr inbounds i8, i8* %336, i64 1
  %344 = load i8, i8* %343, align 1, !tbaa !29
  %345 = zext i8 %344 to i64
  %346 = shl nuw nsw i64 %345, 2
  %347 = or i64 %346, %342
  %348 = getelementptr inbounds i8, i8* %336, i64 2
  %349 = load i8, i8* %348, align 1, !tbaa !29
  %350 = lshr i8 %349, 6
  br label %380

351:                                              ; preds = %335
  %352 = getelementptr inbounds i8, i8* %336, i64 1
  %353 = load i8, i8* %352, align 1, !tbaa !29
  %354 = zext i8 %353 to i64
  %355 = shl nuw nsw i64 %354, 16
  %356 = getelementptr inbounds i8, i8* %336, i64 2
  %357 = load i8, i8* %356, align 1, !tbaa !29
  %358 = zext i8 %357 to i64
  %359 = shl nuw nsw i64 %358, 8
  %360 = or i64 %359, %355
  %361 = getelementptr inbounds i8, i8* %336, i64 3
  %362 = load i8, i8* %361, align 1, !tbaa !29
  br label %380

363:                                              ; preds = %335
  %364 = getelementptr inbounds i8, i8* %336, i64 1
  %365 = load i8, i8* %364, align 1, !tbaa !29
  %366 = zext i8 %365 to i64
  %367 = shl nuw nsw i64 %366, 24
  %368 = getelementptr inbounds i8, i8* %336, i64 2
  %369 = load i8, i8* %368, align 1, !tbaa !29
  %370 = zext i8 %369 to i64
  %371 = shl nuw nsw i64 %370, 16
  %372 = or i64 %371, %367
  %373 = getelementptr inbounds i8, i8* %336, i64 3
  %374 = load i8, i8* %373, align 1, !tbaa !29
  %375 = zext i8 %374 to i64
  %376 = shl nuw nsw i64 %375, 8
  %377 = or i64 %372, %376
  %378 = getelementptr inbounds i8, i8* %336, i64 4
  %379 = load i8, i8* %378, align 1, !tbaa !29
  br label %380

380:                                              ; preds = %363, %351, %339
  %381 = phi i8 [ %350, %339 ], [ %362, %351 ], [ %379, %363 ]
  %382 = phi i64 [ %347, %339 ], [ %360, %351 ], [ %377, %363 ]
  %383 = phi i64 [ 56, %339 ], [ 64, %351 ], [ 72, %363 ]
  %384 = zext i8 %381 to i64
  %385 = or i64 %382, %384
  %386 = trunc i64 %385 to i32
  %387 = icmp sgt i32 %386, 0
  br i1 %387, label %388, label %458

388:                                              ; preds = %380
  %389 = getelementptr inbounds i8, i8* %303, i64 %383
  %390 = bitcast i8* %389 to i64*
  %391 = load i64, i64* %390, align 8, !tbaa !51
  %392 = add i64 %391, 1
  store i64 %392, i64* %390, align 8, !tbaa !51
  %393 = bitcast i32* %30 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %393) #7
  store i32 %386, i32* %30, align 4, !tbaa !15
  %394 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 68719476736, i8* noundef nonnull %393) #7
  %395 = icmp eq i8* %394, null
  br i1 %395, label %477, label %396

396:                                              ; preds = %388
  %397 = bitcast i8* %394 to i32*
  %398 = load i32, i32* %397, align 4, !tbaa !15
  store i32 %398, i32* %30, align 4, !tbaa !15
  %399 = icmp eq i32 %398, 0
  br i1 %399, label %477, label %400

400:                                              ; preds = %396
  %401 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 1
  store i32 %398, i32* %401, align 4, !tbaa !52
  %402 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %393) #7
  %403 = icmp eq i8* %402, null
  br i1 %403, label %404, label %409

404:                                              ; preds = %400
  %405 = getelementptr inbounds i8, i8* %303, i64 40
  %406 = bitcast i8* %405 to i64*
  %407 = load i64, i64* %406, align 8, !tbaa !53
  %408 = add i64 %407, 1
  store i64 %408, i64* %406, align 8, !tbaa !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %393) #7
  br label %475

409:                                              ; preds = %400
  %410 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0
  %411 = call i8* (i8*, %struct.flow_key*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i8*, %struct.flow_key*, ...)*)(i8* noundef %282, %struct.flow_key* noundef nonnull %410) #7
  %412 = icmp eq i8* %411, null
  br i1 %412, label %418, label %413

413:                                              ; preds = %409
  %414 = bitcast i8* %411 to i32*
  %415 = load i32, i32* %414, align 8, !tbaa !55
  %416 = load i32, i32* %401, align 4, !tbaa !52
  %417 = icmp eq i32 %415, %416
  br i1 %417, label %434, label %439

418:                                              ; preds = %409
  %419 = call i32 (...) @_bpf_helper_ext_0005() #7
  %420 = sext i32 %419 to i64
  %421 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 1), align 8, !tbaa !35
  %422 = sub i64 %420, %421
  %423 = icmp ugt i64 %422, 1000000000
  br i1 %423, label %424, label %425

424:                                              ; preds = %418
  store i64 1, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  store i64 %420, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 1), align 8, !tbaa !35
  br label %429

425:                                              ; preds = %418
  %426 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  %427 = add i64 %426, 1
  store i64 %427, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  %428 = icmp ugt i64 %427, 125000
  br i1 %428, label %453, label %429

429:                                              ; preds = %425, %424
  %430 = bitcast %struct.real_pos_lru* %23 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %430) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %430, i8 0, i64 16, i1 false) #7
  %431 = load i32, i32* %401, align 4, !tbaa !52
  %432 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %23, i64 0, i32 0
  store i32 %431, i32* %432, align 8, !tbaa !55
  %433 = call i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...)*)(i8* noundef %282, %struct.flow_key* noundef nonnull %410, %struct.real_pos_lru* noundef nonnull %23, i32 noundef 0) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %430) #7
  br label %453

434:                                              ; preds = %413
  %435 = getelementptr inbounds i8, i8* %303, i64 80
  %436 = bitcast i8* %435 to i64*
  %437 = load i64, i64* %436, align 8, !tbaa !57
  %438 = add i64 %437, 1
  store i64 %438, i64* %436, align 8, !tbaa !57
  br label %489

439:                                              ; preds = %413
  store i32 %416, i32* %414, align 8, !tbaa !55
  %440 = getelementptr inbounds i8, i8* %303, i64 88
  %441 = bitcast i8* %440 to i64*
  %442 = load i64, i64* %441, align 8, !tbaa !58
  %443 = add i64 %442, 1
  store i64 %443, i64* %441, align 8, !tbaa !58
  %444 = bitcast i32* %22 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %444) #7
  store i32 %273, i32* %22, align 4, !tbaa !15
  %445 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 77309411328, i8* noundef nonnull %444) #7
  %446 = icmp eq i8* %445, null
  br i1 %446, label %452, label %447

447:                                              ; preds = %439
  %448 = getelementptr inbounds i8, i8* %445, i64 8
  %449 = bitcast i8* %448 to i64*
  %450 = load i64, i64* %449, align 8, !tbaa !35
  %451 = add i64 %450, 1
  store i64 %451, i64* %449, align 8, !tbaa !35
  br label %452

452:                                              ; preds = %447, %439
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %444) #7
  br label %489

453:                                              ; preds = %429, %425
  %454 = getelementptr inbounds i8, i8* %303, i64 96
  %455 = bitcast i8* %454 to i64*
  %456 = load i64, i64* %455, align 8, !tbaa !59
  %457 = add i64 %456, 1
  store i64 %457, i64* %455, align 8, !tbaa !59
  br label %489

458:                                              ; preds = %380, %335, %330, %325, %319, %305
  %459 = bitcast i8* %303 to i64*
  %460 = load i64, i64* %459, align 8, !tbaa !60
  %461 = add i64 %460, 1
  store i64 %461, i64* %459, align 8, !tbaa !60
  br label %476

462:                                              ; preds = %322
  %463 = getelementptr inbounds i8, i8* %303, i64 8
  %464 = bitcast i8* %463 to i64*
  %465 = load i64, i64* %464, align 8, !tbaa !61
  %466 = add i64 %465, 1
  store i64 %466, i64* %464, align 8, !tbaa !61
  %467 = bitcast i32* %21 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %467) #7
  store i32 %273, i32* %21, align 4, !tbaa !15
  %468 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 77309411328, i8* noundef nonnull %467) #7
  %469 = icmp eq i8* %468, null
  br i1 %469, label %474, label %470

470:                                              ; preds = %462
  %471 = bitcast i8* %468 to i64*
  %472 = load i64, i64* %471, align 8, !tbaa !33
  %473 = add i64 %472, 1
  store i64 %473, i64* %471, align 8, !tbaa !33
  br label %474

474:                                              ; preds = %470, %462
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %467) #7
  br label %476

475:                                              ; preds = %404, %301
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %302) #7
  br label %832

476:                                              ; preds = %474, %458
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %302) #7
  br label %496

477:                                              ; preds = %396, %388
  %478 = getelementptr inbounds i8, i8* %303, i64 16
  %479 = bitcast i8* %478 to i64*
  %480 = load i64, i64* %479, align 8, !tbaa !62
  %481 = add i64 %480, 1
  store i64 %481, i64* %479, align 8, !tbaa !62
  %482 = shl i64 %385, 32
  %483 = ashr exact i64 %482, 32
  %484 = getelementptr inbounds i8, i8* %303, i64 24
  %485 = bitcast i8* %484 to i64*
  store i64 %483, i64* %485, align 8, !tbaa !63
  %486 = bitcast i8* %303 to i64*
  %487 = load i64, i64* %486, align 8, !tbaa !60
  %488 = add i64 %487, 1
  store i64 %488, i64* %486, align 8, !tbaa !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %393) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %302) #7
  br label %496

489:                                              ; preds = %453, %452, %434
  %490 = getelementptr inbounds i8, i8* %303, i64 32
  %491 = bitcast i8* %490 to i64*
  %492 = load i64, i64* %491, align 8, !tbaa !64
  %493 = add i64 %492, 1
  store i64 %493, i64* %491, align 8, !tbaa !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %393) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %302) #7
  %494 = bitcast %union.anon.5* %239 to i16*
  %495 = load i16, i16* %494, align 4, !tbaa !29
  br label %659

496:                                              ; preds = %477, %476, %298, %291, %281
  %497 = bitcast %union.anon.5* %239 to i16*
  %498 = load i16, i16* %497, align 4, !tbaa !29
  %499 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 2
  %500 = load i8, i8* %499, align 4, !tbaa !36
  %501 = and i8 %500, 2
  %502 = icmp eq i8 %501, 0
  br i1 %502, label %503, label %531

503:                                              ; preds = %496
  %504 = load i32, i32* %264, align 4, !tbaa !46
  %505 = and i32 %504, 2
  %506 = icmp eq i32 %505, 0
  br i1 %506, label %507, label %531

507:                                              ; preds = %503
  %508 = bitcast i32* %20 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %508) #7
  %509 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0
  %510 = call i8* (i8*, %struct.flow_key*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i8*, %struct.flow_key*, ...)*)(i8* noundef %282, %struct.flow_key* noundef nonnull %509) #7
  %511 = icmp eq i8* %510, null
  br i1 %511, label %524, label %512

512:                                              ; preds = %507
  %513 = load i8, i8* %59, align 4, !tbaa !22
  %514 = icmp eq i8 %513, 17
  br i1 %514, label %515, label %525

515:                                              ; preds = %512
  %516 = call i32 (...) @_bpf_helper_ext_0005() #7
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds i8, i8* %510, i64 8
  %519 = bitcast i8* %518 to i64*
  %520 = load i64, i64* %519, align 8, !tbaa !65
  %521 = sub i64 %517, %520
  %522 = icmp ugt i64 %521, 30000000000
  br i1 %522, label %524, label %523

523:                                              ; preds = %515
  store i64 %517, i64* %519, align 8, !tbaa !65
  br label %525

524:                                              ; preds = %515, %507
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %508) #7
  br label %531

525:                                              ; preds = %523, %512
  %526 = bitcast i8* %510 to i32*
  %527 = load i32, i32* %526, align 8, !tbaa !55
  store i32 %527, i32* %20, align 4, !tbaa !15
  %528 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 1
  store i32 %527, i32* %528, align 4, !tbaa !52
  %529 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %508) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %508) #7
  %530 = icmp eq i8* %529, null
  br i1 %530, label %531, label %659

531:                                              ; preds = %525, %524, %503, %496
  %532 = load i8, i8* %59, align 4, !tbaa !22
  %533 = icmp eq i8 %532, 6
  br i1 %533, label %534, label %544

534:                                              ; preds = %531
  %535 = load i8, i8* %499, align 4, !tbaa !36
  %536 = and i8 %535, 2
  %537 = icmp eq i8 %536, 0
  br i1 %537, label %541, label %538

538:                                              ; preds = %534
  %539 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 513, i32 0), align 16, !tbaa !33
  %540 = add i64 %539, 1
  store i64 %540, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 513, i32 0), align 16, !tbaa !33
  br label %544

541:                                              ; preds = %534
  %542 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 513, i32 1), align 8, !tbaa !35
  %543 = add i64 %542, 1
  store i64 %543, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 513, i32 1), align 8, !tbaa !35
  br label %544

544:                                              ; preds = %541, %538, %531
  %545 = bitcast %struct.real_pos_lru* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %545) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %545, i8 0, i64 16, i1 false) #7
  %546 = bitcast i32* %19 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %546) #7
  %547 = call i32 (...) @_bpf_helper_ext_0005() #7
  %548 = sext i32 %547 to i64
  %549 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 1), align 8, !tbaa !35
  %550 = sub i64 %548, %549
  %551 = icmp ugt i64 %550, 1000000000
  br i1 %551, label %552, label %553

552:                                              ; preds = %544
  store i64 1, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  store i64 %548, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 1), align 8, !tbaa !35
  br label %557

553:                                              ; preds = %544
  %554 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  %555 = add i64 %554, 1
  store i64 %555, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  %556 = icmp ugt i64 %555, 125000
  br i1 %556, label %558, label %557

557:                                              ; preds = %553, %552
  br label %558

558:                                              ; preds = %557, %553
  %559 = phi i1 [ false, %557 ], [ true, %553 ]
  %560 = load i32, i32* %264, align 4, !tbaa !46
  %561 = and i32 %560, 8
  %562 = icmp eq i32 %561, 0
  br i1 %562, label %563, label %567

563:                                              ; preds = %558
  %564 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 0, i32 0, i64 0
  %565 = load i32, i32* %564, align 4, !tbaa !29
  %566 = add i32 %565, -525483785
  br label %569

567:                                              ; preds = %558
  %568 = load i16, i16* %241, align 2, !tbaa !29
  store i16 %568, i16* %497, align 4, !tbaa !29
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %44, i8 0, i64 16, i1 false) #7
  br label %569

569:                                              ; preds = %563, %567
  %570 = phi i32 [ %566, %563 ], [ -525483785, %567 ]
  %571 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 2, i32 0
  %572 = load i32, i32* %571, align 4, !tbaa !29
  %573 = add i32 %572, -525483785
  %574 = xor i32 %573, -525483785
  %575 = call i32 @llvm.fshl.i32(i32 %573, i32 %573, i32 14) #7
  %576 = sub i32 %574, %575
  %577 = xor i32 %576, %570
  %578 = call i32 @llvm.fshl.i32(i32 %576, i32 %576, i32 11) #7
  %579 = sub i32 %577, %578
  %580 = xor i32 %579, %573
  %581 = call i32 @llvm.fshl.i32(i32 %579, i32 %579, i32 25) #7
  %582 = sub i32 %580, %581
  %583 = xor i32 %582, %576
  %584 = call i32 @llvm.fshl.i32(i32 %582, i32 %582, i32 16) #7
  %585 = sub i32 %583, %584
  %586 = xor i32 %585, %579
  %587 = call i32 @llvm.fshl.i32(i32 %585, i32 %585, i32 4) #7
  %588 = sub i32 %586, %587
  %589 = xor i32 %588, %582
  %590 = call i32 @llvm.fshl.i32(i32 %588, i32 %588, i32 14) #7
  %591 = sub i32 %589, %590
  %592 = xor i32 %591, %585
  %593 = call i32 @llvm.fshl.i32(i32 %591, i32 %591, i32 24) #7
  %594 = sub i32 %592, %593
  %595 = urem i32 %594, 65537
  %596 = load i32, i32* %272, align 4, !tbaa !48
  %597 = mul i32 %596, 65537
  %598 = add i32 %595, %597
  %599 = icmp ugt i32 %598, 33554943
  br i1 %599, label %626, label %600

600:                                              ; preds = %569
  store i32 0, i32* %19, align 4, !tbaa !15
  %601 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 521, i32 1), align 8, !tbaa !35
  %602 = add i64 %601, 1
  store i64 %602, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 521, i32 1), align 8, !tbaa !35
  %603 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 1
  store i32 0, i32* %603, align 4, !tbaa !52
  %604 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %546) #7
  %605 = icmp eq i8* %604, null
  br i1 %605, label %606, label %609

606:                                              ; preds = %600
  %607 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 521, i32 0), align 16, !tbaa !33
  %608 = add i64 %607, 1
  store i64 %608, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 521, i32 0), align 16, !tbaa !33
  br label %626

609:                                              ; preds = %600
  %610 = icmp eq i8* %282, null
  br i1 %610, label %627, label %611

611:                                              ; preds = %609
  %612 = load i32, i32* %264, align 4, !tbaa !46
  %613 = and i32 %612, 2
  %614 = icmp ne i32 %613, 0
  %615 = or i1 %559, %614
  br i1 %615, label %627, label %616

616:                                              ; preds = %611
  %617 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0
  %618 = load i8, i8* %59, align 4, !tbaa !22
  %619 = icmp eq i8 %618, 17
  br i1 %619, label %620, label %622

620:                                              ; preds = %616
  %621 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %18, i64 0, i32 1
  store i64 %548, i64* %621, align 8, !tbaa !65
  br label %622

622:                                              ; preds = %620, %616
  %623 = load i32, i32* %19, align 4, !tbaa !15
  %624 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %18, i64 0, i32 0
  store i32 %623, i32* %624, align 8, !tbaa !55
  %625 = call i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...)*)(i8* noundef nonnull %282, %struct.flow_key* noundef nonnull %617, %struct.real_pos_lru* noundef nonnull %18, i32 noundef 0) #7
  br label %627

626:                                              ; preds = %606, %569
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %546) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %545) #7
  br label %832

627:                                              ; preds = %622, %611, %609
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %546) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %545) #7
  %628 = bitcast i32* %17 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %628) #7
  store i32 0, i32* %17, align 4, !tbaa !15
  %629 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 51539607552, i8* noundef nonnull %628) #7
  %630 = icmp eq i8* %629, null
  br i1 %630, label %655, label %631

631:                                              ; preds = %627
  %632 = bitcast i8* %629 to i32*
  %633 = load i32, i32* %632, align 4, !tbaa !29
  %634 = load i32, i32* %238, align 4, !tbaa !29
  %635 = icmp ne i32 %633, %634
  %636 = getelementptr inbounds i8, i8* %629, i64 16
  %637 = bitcast i8* %636 to i16*
  %638 = load i16, i16* %637, align 4, !tbaa !43
  %639 = load i16, i16* %243, align 4, !tbaa !43
  %640 = load i8, i8* %245, align 2, !tbaa !45
  %641 = getelementptr inbounds i8, i8* %629, i64 18
  store i8 %640, i8* %641, align 2, !tbaa !45
  %642 = icmp eq i8 %640, 0
  %643 = icmp ne i16 %638, %639
  %644 = select i1 %635, i1 true, i1 %643
  %645 = select i1 %644, i1 true, i1 %642
  br i1 %645, label %656, label %646

646:                                              ; preds = %631
  %647 = load i32, i32* %603, align 4, !tbaa !52
  %648 = icmp ugt i32 %647, 4095
  %649 = zext i32 %647 to i64
  %650 = getelementptr inbounds [4096 x i32], [4096 x i32]* @__lru_miss_stats, i64 0, i64 %649
  %651 = select i1 %648, i32* null, i32* %650
  br i1 %648, label %655, label %652

652:                                              ; preds = %646
  %653 = load i32, i32* %651, align 4, !tbaa !15
  %654 = add i32 %653, 1
  store i32 %654, i32* %651, align 4, !tbaa !15
  br label %656

655:                                              ; preds = %646, %627
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %628) #7
  br label %832

656:                                              ; preds = %652, %631
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %628) #7
  %657 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 512, i32 1), align 8, !tbaa !35
  %658 = add i64 %657, 1
  store i64 %658, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 512, i32 1), align 8, !tbaa !35
  br label %659

659:                                              ; preds = %656, %525, %489
  %660 = phi i16 [ %498, %656 ], [ %498, %525 ], [ %495, %489 ]
  %661 = phi i8* [ %604, %656 ], [ %529, %525 ], [ %402, %489 ]
  %662 = bitcast %union.anon.5* %239 to i16*
  %663 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %46) #7
  %664 = icmp eq i8* %663, null
  %665 = icmp ugt i32 %273, 1023
  %666 = select i1 %664, i1 true, i1 %665
  br i1 %666, label %832, label %667

667:                                              ; preds = %659
  %668 = zext i32 %273 to i64
  %669 = getelementptr inbounds [1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 %668, i32 0
  %670 = zext i16 %63 to i64
  %671 = bitcast i64* %669 to <2 x i64>*
  %672 = load <2 x i64>, <2 x i64>* %671, align 16, !tbaa !51
  %673 = insertelement <2 x i64> <i64 1, i64 poison>, i64 %670, i64 1
  %674 = add <2 x i64> %672, %673
  %675 = bitcast i64* %669 to <2 x i64>*
  store <2 x i64> %674, <2 x i64>* %675, align 16, !tbaa !51
  %676 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 1
  %677 = load i32, i32* %676, align 4, !tbaa !15
  %678 = icmp ugt i32 %677, 4095
  br i1 %678, label %832, label %679

679:                                              ; preds = %667
  %680 = zext i32 %677 to i64
  %681 = getelementptr inbounds [4096 x %struct.__lb_stats], [4096 x %struct.__lb_stats]* @__reals_stats, i64 0, i64 %680, i32 0
  %682 = bitcast i64* %681 to <2 x i64>*
  %683 = load <2 x i64>, <2 x i64>* %682, align 16, !tbaa !51
  %684 = add <2 x i64> %683, %673
  %685 = bitcast i64* %681 to <2 x i64>*
  store <2 x i64> %684, <2 x i64>* %685, align 16, !tbaa !51
  store i16 %660, i16* %662, align 4, !tbaa !29
  %686 = getelementptr inbounds i8, i8* %661, i64 16
  %687 = load i8, i8* %686, align 4, !tbaa !66
  %688 = and i8 %687, 1
  %689 = icmp eq i8 %688, 0
  br i1 %689, label %740, label %690

690:                                              ; preds = %679
  %691 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -40) #7
  %692 = icmp eq i32 %691, 0
  br i1 %692, label %693, label %832

693:                                              ; preds = %690
  %694 = load i64, i64* %31, align 8, !tbaa !5
  %695 = inttoptr i64 %694 to i8*
  %696 = load i64, i64* %34, align 8, !tbaa !11
  %697 = inttoptr i64 %694 to %struct.ethhdr*
  %698 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %697, i64 1
  %699 = inttoptr i64 %696 to %struct.ethhdr*
  %700 = icmp ugt %struct.ethhdr* %698, %699
  %701 = getelementptr i8, i8* %695, i64 54
  %702 = bitcast i8* %701 to %struct.ethhdr*
  %703 = icmp ugt %struct.ethhdr* %702, %699
  %704 = select i1 %700, i1 true, i1 %703
  %705 = bitcast i8* %701 to %struct.ipv6hdr*
  %706 = inttoptr i64 %696 to %struct.ipv6hdr*
  %707 = icmp ugt %struct.ipv6hdr* %705, %706
  %708 = select i1 %704, i1 true, i1 %707
  br i1 %708, label %832, label %709

709:                                              ; preds = %693
  %710 = getelementptr i8, i8* %695, i64 14
  %711 = getelementptr i8, i8* %695, i64 40
  %712 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %697, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %712, i8* noundef nonnull align 8 dereferenceable(6) %663, i64 6, i1 false) #7
  %713 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %697, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %713, i8* noundef nonnull align 1 dereferenceable(6) %711, i64 6, i1 false) #7
  %714 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %697, i64 0, i32 2
  store i16 -8826, i16* %714, align 1, !tbaa !12
  %715 = load i16, i16* %662, align 4, !tbaa !29
  %716 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 0, i32 0, i64 0
  %717 = load i32, i32* %716, align 4, !tbaa !29
  %718 = zext i16 %715 to i32
  %719 = xor i32 %717, %718
  %720 = load i8, i8* %56, align 1, !tbaa !18
  %721 = getelementptr i8, i8* %695, i64 15
  %722 = getelementptr i8, i8* %695, i64 16
  %723 = bitcast i8* %722 to i16*
  store i16 0, i16* %723, align 1
  %724 = lshr i8 %720, 4
  %725 = or i8 %724, 96
  store i8 %725, i8* %710, align 4
  %726 = shl i8 %720, 4
  store i8 %726, i8* %721, align 1, !tbaa !29
  %727 = getelementptr i8, i8* %695, i64 20
  store i8 4, i8* %727, align 2, !tbaa !68
  %728 = getelementptr i8, i8* %695, i64 18
  %729 = bitcast i8* %728 to i16*
  store i16 %62, i16* %729, align 4, !tbaa !70
  %730 = getelementptr i8, i8* %695, i64 21
  store i8 64, i8* %730, align 1, !tbaa !71
  %731 = getelementptr i8, i8* %695, i64 22
  %732 = bitcast i8* %731 to i32*
  store i32 1, i32* %732, align 4
  %733 = getelementptr i8, i8* %695, i64 26
  %734 = bitcast i8* %733 to i32*
  store i32 0, i32* %734, align 4
  %735 = getelementptr i8, i8* %695, i64 30
  %736 = bitcast i8* %735 to i32*
  store i32 0, i32* %736, align 4
  %737 = getelementptr i8, i8* %695, i64 34
  %738 = bitcast i8* %737 to i32*
  store i32 %719, i32* %738, align 4
  %739 = getelementptr i8, i8* %695, i64 38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %739, i8* noundef nonnull align 4 dereferenceable(16) %661, i64 16, i1 false) #7
  br label %832

740:                                              ; preds = %679
  %741 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %25, i64 0, i32 0, i32 0, i32 0, i64 0
  %742 = load i32, i32* %741, align 4, !tbaa !29
  %743 = call i16 @llvm.bswap.i16(i16 %660) #7
  %744 = zext i16 %743 to i32
  %745 = shl nuw i32 %744, 16
  %746 = and i32 %742, -65536
  %747 = xor i32 %746, %745
  %748 = or i32 %747, 4268
  %749 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -20) #7
  %750 = icmp eq i32 %749, 0
  br i1 %750, label %751, label %832

751:                                              ; preds = %740
  %752 = load i64, i64* %31, align 8, !tbaa !5
  %753 = inttoptr i64 %752 to i8*
  %754 = load i64, i64* %34, align 8, !tbaa !11
  %755 = inttoptr i64 %752 to %struct.ethhdr*
  %756 = getelementptr i8, i8* %753, i64 14
  %757 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %755, i64 1
  %758 = inttoptr i64 %754 to %struct.ethhdr*
  %759 = icmp ugt %struct.ethhdr* %757, %758
  %760 = getelementptr i8, i8* %753, i64 34
  %761 = bitcast i8* %760 to %struct.ethhdr*
  %762 = icmp ugt %struct.ethhdr* %761, %758
  %763 = select i1 %759, i1 true, i1 %762
  %764 = bitcast i8* %760 to %struct.iphdr*
  %765 = inttoptr i64 %754 to %struct.iphdr*
  %766 = icmp ugt %struct.iphdr* %764, %765
  %767 = select i1 %763, i1 true, i1 %766
  br i1 %767, label %832, label %768

768:                                              ; preds = %751
  %769 = getelementptr i8, i8* %753, i64 20
  %770 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %755, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %770, i8* noundef nonnull align 8 dereferenceable(6) %663, i64 6, i1 false) #7
  %771 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %755, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %771, i8* noundef nonnull align 1 dereferenceable(6) %769, i64 6, i1 false) #7
  %772 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %755, i64 0, i32 2
  store i16 8, i16* %772, align 1, !tbaa !12
  %773 = load i8, i8* %56, align 1, !tbaa !18
  %774 = bitcast i8* %661 to i32*
  %775 = load i32, i32* %774, align 4, !tbaa !29
  store i8 69, i8* %756, align 4
  %776 = bitcast i8* %769 to i16*
  store i16 0, i16* %776, align 2, !tbaa !24
  %777 = getelementptr i8, i8* %753, i64 23
  store i8 4, i8* %777, align 1, !tbaa !21
  %778 = getelementptr i8, i8* %753, i64 24
  %779 = bitcast i8* %778 to i16*
  %780 = getelementptr i8, i8* %753, i64 15
  store i8 %773, i8* %780, align 1, !tbaa !16
  %781 = add i16 %63, 20
  %782 = call i16 @llvm.bswap.i16(i16 %781) #7
  %783 = getelementptr i8, i8* %753, i64 16
  %784 = bitcast i8* %783 to i16*
  store i16 %782, i16* %784, align 2, !tbaa !23
  %785 = getelementptr i8, i8* %753, i64 18
  %786 = bitcast i8* %785 to i16*
  store i16 0, i16* %786, align 4, !tbaa !72
  %787 = getelementptr i8, i8* %753, i64 30
  %788 = bitcast i8* %787 to i32*
  store i32 %775, i32* %788, align 4, !tbaa !29
  %789 = getelementptr i8, i8* %753, i64 26
  %790 = bitcast i8* %789 to i32*
  store i32 %748, i32* %790, align 4, !tbaa !29
  %791 = getelementptr i8, i8* %753, i64 22
  store i8 64, i8* %791, align 4, !tbaa !28
  %792 = bitcast i8* %756 to i16*
  %793 = load i16, i16* %792, align 2, !tbaa !30
  %794 = zext i16 %793 to i64
  %795 = zext i16 %782 to i64
  %796 = bitcast i8* %791 to i16*
  %797 = load i16, i16* %796, align 2, !tbaa !30
  %798 = zext i16 %797 to i64
  %799 = lshr exact i32 %747, 16
  %800 = zext i32 %799 to i64
  %801 = and i32 %775, 65535
  %802 = zext i32 %801 to i64
  %803 = lshr i32 %775, 16
  %804 = zext i32 %803 to i64
  %805 = add nuw nsw i64 %795, 4268
  %806 = add nuw nsw i64 %805, %800
  %807 = add nuw nsw i64 %806, %802
  %808 = add nuw nsw i64 %807, %804
  %809 = add nuw nsw i64 %808, %794
  %810 = add nuw nsw i64 %809, %798
  %811 = icmp ult i64 %810, 65536
  %812 = lshr i64 %810, 16
  %813 = and i64 %810, 65535
  %814 = add nuw nsw i64 %813, %812
  %815 = select i1 %811, i64 %810, i64 %814
  %816 = icmp ult i64 %815, 65536
  %817 = lshr i64 %815, 16
  %818 = and i64 %815, 65535
  %819 = add nuw nsw i64 %818, %817
  %820 = select i1 %816, i64 %815, i64 %819
  %821 = icmp ult i64 %820, 65536
  %822 = lshr i64 %820, 16
  %823 = and i64 %820, 65535
  %824 = add nuw nsw i64 %823, %822
  %825 = select i1 %821, i64 %820, i64 %824
  %826 = icmp ult i64 %825, 65536
  %827 = lshr i64 %825, 16
  %828 = select i1 %826, i64 65536, i64 %827
  %829 = add nuw nsw i64 %828, %825
  %830 = trunc i64 %829 to i16
  %831 = xor i16 %830, -1
  store i16 %831, i16* %779, align 2, !tbaa !31
  br label %832

832:                                              ; preds = %768, %751, %740, %709, %693, %690, %667, %659, %655, %626, %475
  %833 = phi i32 [ 1, %626 ], [ 1, %659 ], [ 1, %667 ], [ 1, %475 ], [ 1, %655 ], [ 3, %768 ], [ 3, %709 ], [ 1, %690 ], [ 1, %693 ], [ 1, %740 ], [ 1, %751 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %274) #7
  br label %834

834:                                              ; preds = %43, %49, %53, %71, %74, %76, %153, %156, %159, %178, %185, %211, %248, %257, %832
  %835 = phi i32 [ %833, %832 ], [ 2, %178 ], [ 2, %248 ], [ 1, %257 ], [ 1, %185 ], [ 1, %211 ], [ 3, %76 ], [ 1, %153 ], [ 1, %71 ], [ 2, %74 ], [ 1, %156 ], [ 1, %159 ], [ 1, %53 ], [ 1, %49 ], [ 1, %43 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %46) #7
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %45) #7
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %44) #7
  br label %1660

836:                                              ; preds = %39
  %837 = bitcast %struct.packet_description* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %837) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(48) %837, i8 0, i64 48, i1 false) #7
  %838 = bitcast %struct.vip_definition* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %838) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(20) %838, i8 0, i64 20, i1 false) #7
  %839 = bitcast i32* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %839) #7
  store i32 0, i32* %13, align 4, !tbaa !15
  %840 = getelementptr i8, i8* %33, i64 54
  %841 = icmp ugt i8* %840, %36
  br i1 %841, label %1658, label %842

842:                                              ; preds = %836
  %843 = getelementptr i8, i8* %33, i64 20
  %844 = load i8, i8* %843, align 2, !tbaa !68
  %845 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 3
  store i8 %844, i8* %845, align 4, !tbaa !22
  %846 = load i8, i8* %37, align 4
  %847 = shl i8 %846, 4
  %848 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 3
  store i8 %847, i8* %848, align 1, !tbaa !18
  %849 = getelementptr i8, i8* %33, i64 15
  %850 = load i8, i8* %849, align 1, !tbaa !29
  %851 = lshr i8 %850, 4
  %852 = or i8 %851, %847
  store i8 %852, i8* %848, align 1, !tbaa !18
  %853 = getelementptr i8, i8* %33, i64 18
  %854 = bitcast i8* %853 to i16*
  %855 = load i16, i16* %854, align 4, !tbaa !70
  %856 = tail call i16 @llvm.bswap.i16(i16 %855) #7
  switch i8 %844, label %898 [
    i8 44, label %1658
    i8 58, label %857
  ]

857:                                              ; preds = %842
  %858 = getelementptr i8, i8* %33, i64 62
  %859 = icmp ugt i8* %858, %36
  br i1 %859, label %1658, label %860

860:                                              ; preds = %857
  %861 = load i8, i8* %840, align 4, !tbaa !73
  switch i8 %861, label %1658 [
    i8 -128, label %862
    i8 2, label %873
    i8 1, label %887
  ]

862:                                              ; preds = %860
  %863 = bitcast [4 x i32]* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %863)
  store i8 -127, i8* %840, align 4, !tbaa !73
  %864 = getelementptr i8, i8* %33, i64 56
  %865 = bitcast i8* %864 to i16*
  %866 = load i16, i16* %865, align 2, !tbaa !75
  %867 = add i16 %866, -1
  store i16 %867, i16* %865, align 2, !tbaa !75
  %868 = getelementptr i8, i8* %33, i64 21
  store i8 64, i8* %868, align 1, !tbaa !71
  %869 = getelementptr i8, i8* %33, i64 22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(16) %863, i8* noundef nonnull align 4 dereferenceable(16) %869, i64 16, i1 false) #7
  %870 = getelementptr i8, i8* %33, i64 38
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %869, i8* noundef nonnull align 4 dereferenceable(16) %870, i64 16, i1 false) #7
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %870, i8* noundef nonnull align 16 dereferenceable(16) %863, i64 16, i1 false) #7
  %871 = getelementptr inbounds [6 x i8], [6 x i8]* %9, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %871)
  %872 = getelementptr inbounds i8, i8* %33, i64 6
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %871, i8* noundef nonnull align 1 dereferenceable(6) %872, i64 6, i1 false) #7
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %872, i8* noundef nonnull align 1 dereferenceable(6) %33, i64 6, i1 false) #7
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %33, i8* noundef nonnull align 1 dereferenceable(6) %871, i64 6, i1 false) #7
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %871)
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %863)
  br label %1658

873:                                              ; preds = %860
  %874 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 524, i32 0), align 16, !tbaa !33
  %875 = add i64 %874, 1
  store i64 %875, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 524, i32 0), align 16, !tbaa !33
  %876 = getelementptr i8, i8* %33, i64 58
  %877 = bitcast i8* %876 to i32*
  %878 = load i32, i32* %877, align 4, !tbaa !29
  %879 = tail call i32 @llvm.bswap.i32(i32 %878) #7
  %880 = icmp ult i32 %879, 1280
  br i1 %880, label %881, label %884

881:                                              ; preds = %873
  %882 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 524, i32 1), align 8, !tbaa !35
  %883 = add i64 %882, 1
  store i64 %883, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 524, i32 1), align 8, !tbaa !35
  br label %884

884:                                              ; preds = %881, %873
  %885 = getelementptr i8, i8* %33, i64 102
  %886 = icmp ugt i8* %885, %36
  br i1 %886, label %1658, label %890

887:                                              ; preds = %860
  %888 = getelementptr i8, i8* %33, i64 102
  %889 = icmp ugt i8* %888, %36
  br i1 %889, label %1658, label %890

890:                                              ; preds = %887, %884
  %891 = getelementptr i8, i8* %33, i64 68
  %892 = load i8, i8* %891, align 2, !tbaa !68
  store i8 %892, i8* %845, align 4, !tbaa !22
  %893 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 2
  store i8 1, i8* %893, align 4, !tbaa !36
  %894 = getelementptr i8, i8* %33, i64 70
  %895 = getelementptr i8, i8* %33, i64 86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %837, i8* noundef nonnull align 4 dereferenceable(16) %895, i64 16, i1 false) #7
  %896 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 1, i32 0, i64 0
  %897 = bitcast i32* %896 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %897, i8* noundef nonnull align 4 dereferenceable(16) %894, i64 16, i1 false) #7
  br label %903

898:                                              ; preds = %842
  %899 = getelementptr i8, i8* %33, i64 22
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %837, i8* noundef nonnull align 4 dereferenceable(16) %899, i64 16, i1 false) #7
  %900 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 1, i32 0, i64 0
  %901 = bitcast i32* %900 to i8*
  %902 = getelementptr i8, i8* %33, i64 38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %901, i8* noundef nonnull align 4 dereferenceable(16) %902, i64 16, i1 false) #7
  br label %903

903:                                              ; preds = %898, %890
  %904 = phi i1 [ true, %898 ], [ false, %890 ]
  %905 = phi i8 [ 2, %898 ], [ 3, %890 ]
  %906 = phi i8 [ %844, %898 ], [ %892, %890 ]
  switch i8 %906, label %1658 [
    i8 6, label %907
    i8 17, label %933
  ]

907:                                              ; preds = %903
  %908 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 2
  %909 = select i1 %904, i64 54, i64 102
  %910 = getelementptr i8, i8* %33, i64 %909
  %911 = getelementptr inbounds i8, i8* %910, i64 20
  %912 = icmp ugt i8* %911, %36
  br i1 %912, label %1658, label %913

913:                                              ; preds = %907
  %914 = getelementptr inbounds i8, i8* %910, i64 12
  %915 = bitcast i8* %914 to i16*
  %916 = load i16, i16* %915, align 4
  %917 = and i16 %916, 512
  %918 = icmp eq i16 %917, 0
  br i1 %918, label %920, label %919

919:                                              ; preds = %913
  store i8 %905, i8* %908, align 4, !tbaa !36
  br label %920

920:                                              ; preds = %919, %913
  br i1 %904, label %921, label %927

921:                                              ; preds = %920
  %922 = bitcast i8* %910 to i16*
  %923 = load i16, i16* %922, align 4, !tbaa !37
  %924 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 2
  %925 = bitcast %union.anon.5* %924 to i16*
  store i16 %923, i16* %925, align 4, !tbaa !29
  %926 = getelementptr inbounds i8, i8* %910, i64 2
  br label %951

927:                                              ; preds = %920
  %928 = getelementptr inbounds i8, i8* %910, i64 2
  %929 = bitcast i8* %928 to i16*
  %930 = load i16, i16* %929, align 2, !tbaa !39
  %931 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 2
  %932 = bitcast %union.anon.5* %931 to i16*
  store i16 %930, i16* %932, align 4, !tbaa !29
  br label %951

933:                                              ; preds = %903
  %934 = select i1 %904, i64 54, i64 102
  %935 = getelementptr i8, i8* %33, i64 %934
  %936 = getelementptr inbounds i8, i8* %935, i64 8
  %937 = icmp ugt i8* %936, %36
  br i1 %937, label %1658, label %938

938:                                              ; preds = %933
  br i1 %904, label %939, label %945

939:                                              ; preds = %938
  %940 = bitcast i8* %935 to i16*
  %941 = load i16, i16* %940, align 2, !tbaa !40
  %942 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 2
  %943 = bitcast %union.anon.5* %942 to i16*
  store i16 %941, i16* %943, align 4, !tbaa !29
  %944 = getelementptr inbounds i8, i8* %935, i64 2
  br label %951

945:                                              ; preds = %938
  %946 = getelementptr inbounds i8, i8* %935, i64 2
  %947 = bitcast i8* %946 to i16*
  %948 = load i16, i16* %947, align 2, !tbaa !42
  %949 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 2
  %950 = bitcast %union.anon.5* %949 to i16*
  store i16 %948, i16* %950, align 4, !tbaa !29
  br label %951

951:                                              ; preds = %939, %945, %921, %927
  %952 = phi %union.anon.5* [ %924, %921 ], [ %931, %927 ], [ %942, %939 ], [ %949, %945 ]
  %953 = phi i8* [ %926, %921 ], [ %910, %927 ], [ %944, %939 ], [ %935, %945 ]
  %954 = bitcast i8* %953 to i16*
  %955 = load i16, i16* %954, align 2, !tbaa !30
  %956 = bitcast %union.anon.5* %952 to [2 x i16]*
  %957 = getelementptr inbounds [2 x i16], [2 x i16]* %956, i64 0, i64 1
  store i16 %955, i16* %957, align 2, !tbaa !29
  %958 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 1, i32 0, i64 0
  %959 = bitcast i32* %958 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %838, i8* noundef nonnull align 4 dereferenceable(16) %959, i64 16, i1 false) #7
  %960 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 2
  %961 = bitcast %union.anon.5* %960 to [2 x i16]*
  %962 = getelementptr inbounds [2 x i16], [2 x i16]* %961, i64 0, i64 1
  %963 = load i16, i16* %962, align 2, !tbaa !29
  %964 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %12, i64 0, i32 1
  store i16 %963, i16* %964, align 4, !tbaa !43
  %965 = load i8, i8* %845, align 4, !tbaa !22
  %966 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %12, i64 0, i32 2
  store i8 %965, i8* %966, align 2, !tbaa !45
  %967 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %838) #7
  %968 = icmp eq i8* %967, null
  br i1 %968, label %969, label %978

969:                                              ; preds = %951
  store i16 0, i16* %964, align 4, !tbaa !43
  %970 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 21474836480, i8* noundef nonnull %838) #7
  %971 = icmp eq i8* %970, null
  br i1 %971, label %1658, label %972

972:                                              ; preds = %969
  %973 = bitcast i8* %970 to i32*
  %974 = load i32, i32* %973, align 4, !tbaa !46
  %975 = and i32 %974, 136
  %976 = icmp eq i32 %975, 0
  br i1 %976, label %977, label %978

977:                                              ; preds = %972
  store i16 0, i16* %962, align 2, !tbaa !29
  br label %978

978:                                              ; preds = %977, %972, %951
  %979 = phi i8* [ %967, %951 ], [ %970, %972 ], [ %970, %977 ]
  %980 = sub i64 %35, %32
  %981 = icmp sgt i64 %980, 1514
  br i1 %981, label %1658, label %982

982:                                              ; preds = %978
  %983 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 512, i32 0), align 16, !tbaa !33
  %984 = add i64 %983, 1
  store i64 %984, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 512, i32 0), align 16, !tbaa !33
  %985 = bitcast i8* %979 to i32*
  %986 = load i32, i32* %985, align 4, !tbaa !46
  %987 = and i32 %986, 1
  %988 = icmp eq i32 %987, 0
  br i1 %988, label %991, label %989

989:                                              ; preds = %982
  %990 = bitcast %union.anon.5* %960 to i16*
  store i16 0, i16* %990, align 4, !tbaa !29
  br label %991

991:                                              ; preds = %989, %982
  %992 = getelementptr inbounds i8, i8* %979, i64 4
  %993 = bitcast i8* %992 to i32*
  %994 = load i32, i32* %993, align 4, !tbaa !48
  %995 = bitcast i32* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %995) #7
  %996 = call i32 (...) @_bpf_helper_ext_0008() #7
  store i32 %996, i32* %14, align 4, !tbaa !15
  %997 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 34359738368, i8* noundef nonnull %995) #7
  %998 = icmp eq i8* %997, null
  br i1 %998, label %999, label %1002

999:                                              ; preds = %991
  %1000 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 515, i32 0), align 16, !tbaa !33
  %1001 = add i64 %1000, 1
  store i64 %1001, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 515, i32 0), align 16, !tbaa !33
  br label %1002

1002:                                             ; preds = %999, %991
  %1003 = phi i8* [ %997, %991 ], [ bitcast (%struct.anon.2* @fallback_cache to i8*), %999 ]
  %1004 = load i32, i32* %985, align 4, !tbaa !46
  %1005 = and i32 %1004, 4
  %1006 = icmp eq i32 %1005, 0
  br i1 %1006, label %1217, label %1007

1007:                                             ; preds = %1002
  %1008 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 2
  %1009 = load i8, i8* %1008, align 4, !tbaa !36
  %1010 = and i8 %1009, 1
  %1011 = icmp eq i8 %1010, 0
  br i1 %1011, label %1022, label %1012

1012:                                             ; preds = %1007
  %1013 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 523, i32 0), align 16, !tbaa !33
  %1014 = add i64 %1013, 1
  store i64 %1014, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 523, i32 0), align 16, !tbaa !33
  %1015 = getelementptr i8, i8* %33, i64 55
  %1016 = load i8, i8* %1015, align 1, !tbaa !76
  %1017 = add i8 %1016, -3
  %1018 = icmp ult i8 %1017, 2
  br i1 %1018, label %1019, label %1217

1019:                                             ; preds = %1012
  %1020 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 523, i32 1), align 8, !tbaa !35
  %1021 = add i64 %1020, 1
  store i64 %1021, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 523, i32 1), align 8, !tbaa !35
  br label %1217

1022:                                             ; preds = %1007
  %1023 = bitcast i32* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1023) #7
  store i32 0, i32* %15, align 4, !tbaa !15
  %1024 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 60129542144, i8* noundef nonnull %1023) #7
  %1025 = icmp eq i8* %1024, null
  br i1 %1025, label %1196, label %1026

1026:                                             ; preds = %1022
  %1027 = load i8, i8* %1008, align 4, !tbaa !36
  %1028 = and i8 %1027, 1
  %1029 = icmp eq i8 %1028, 0
  %1030 = select i1 %1029, i64 54, i64 102
  %1031 = getelementptr i8, i8* %33, i64 %1030
  %1032 = getelementptr i8, i8* %1031, i64 8
  %1033 = getelementptr i8, i8* %1032, i64 1
  %1034 = icmp ugt i8* %1033, %36
  br i1 %1034, label %1179, label %1035

1035:                                             ; preds = %1026
  %1036 = load i8, i8* %1032, align 1, !tbaa !29
  %1037 = zext i8 %1036 to i32
  %1038 = and i32 %1037, 128
  %1039 = icmp eq i32 %1038, 0
  br i1 %1039, label %1051, label %1040

1040:                                             ; preds = %1035
  %1041 = getelementptr inbounds i8, i8* %1032, i64 14
  %1042 = icmp ugt i8* %1041, %36
  br i1 %1042, label %1179, label %1043

1043:                                             ; preds = %1040
  %1044 = and i32 %1037, 32
  %1045 = icmp eq i32 %1044, 0
  br i1 %1045, label %1183, label %1046

1046:                                             ; preds = %1043
  %1047 = getelementptr inbounds i8, i8* %1032, i64 5
  %1048 = load i8, i8* %1047, align 1, !tbaa !49
  %1049 = icmp ult i8 %1048, 8
  %1050 = getelementptr inbounds i8, i8* %1032, i64 6
  br i1 %1049, label %1179, label %1056

1051:                                             ; preds = %1035
  %1052 = getelementptr inbounds i8, i8* %1032, i64 9
  %1053 = icmp ugt i8* %1052, %36
  %1054 = icmp eq i8* %1033, null
  %1055 = or i1 %1053, %1054
  br i1 %1055, label %1179, label %1056

1056:                                             ; preds = %1051, %1046
  %1057 = phi i8* [ %1050, %1046 ], [ %1033, %1051 ]
  %1058 = load i8, i8* %1057, align 1, !tbaa !29
  %1059 = lshr i8 %1058, 6
  switch i8 %1059, label %1179 [
    i8 1, label %1060
    i8 2, label %1072
    i8 3, label %1084
  ]

1060:                                             ; preds = %1056
  %1061 = and i8 %1058, 63
  %1062 = zext i8 %1061 to i64
  %1063 = shl nuw nsw i64 %1062, 10
  %1064 = getelementptr inbounds i8, i8* %1057, i64 1
  %1065 = load i8, i8* %1064, align 1, !tbaa !29
  %1066 = zext i8 %1065 to i64
  %1067 = shl nuw nsw i64 %1066, 2
  %1068 = or i64 %1067, %1063
  %1069 = getelementptr inbounds i8, i8* %1057, i64 2
  %1070 = load i8, i8* %1069, align 1, !tbaa !29
  %1071 = lshr i8 %1070, 6
  br label %1101

1072:                                             ; preds = %1056
  %1073 = getelementptr inbounds i8, i8* %1057, i64 1
  %1074 = load i8, i8* %1073, align 1, !tbaa !29
  %1075 = zext i8 %1074 to i64
  %1076 = shl nuw nsw i64 %1075, 16
  %1077 = getelementptr inbounds i8, i8* %1057, i64 2
  %1078 = load i8, i8* %1077, align 1, !tbaa !29
  %1079 = zext i8 %1078 to i64
  %1080 = shl nuw nsw i64 %1079, 8
  %1081 = or i64 %1080, %1076
  %1082 = getelementptr inbounds i8, i8* %1057, i64 3
  %1083 = load i8, i8* %1082, align 1, !tbaa !29
  br label %1101

1084:                                             ; preds = %1056
  %1085 = getelementptr inbounds i8, i8* %1057, i64 1
  %1086 = load i8, i8* %1085, align 1, !tbaa !29
  %1087 = zext i8 %1086 to i64
  %1088 = shl nuw nsw i64 %1087, 24
  %1089 = getelementptr inbounds i8, i8* %1057, i64 2
  %1090 = load i8, i8* %1089, align 1, !tbaa !29
  %1091 = zext i8 %1090 to i64
  %1092 = shl nuw nsw i64 %1091, 16
  %1093 = or i64 %1092, %1088
  %1094 = getelementptr inbounds i8, i8* %1057, i64 3
  %1095 = load i8, i8* %1094, align 1, !tbaa !29
  %1096 = zext i8 %1095 to i64
  %1097 = shl nuw nsw i64 %1096, 8
  %1098 = or i64 %1093, %1097
  %1099 = getelementptr inbounds i8, i8* %1057, i64 4
  %1100 = load i8, i8* %1099, align 1, !tbaa !29
  br label %1101

1101:                                             ; preds = %1084, %1072, %1060
  %1102 = phi i8 [ %1071, %1060 ], [ %1083, %1072 ], [ %1100, %1084 ]
  %1103 = phi i64 [ %1068, %1060 ], [ %1081, %1072 ], [ %1098, %1084 ]
  %1104 = phi i64 [ 56, %1060 ], [ 64, %1072 ], [ 72, %1084 ]
  %1105 = zext i8 %1102 to i64
  %1106 = or i64 %1103, %1105
  %1107 = trunc i64 %1106 to i32
  %1108 = icmp sgt i32 %1107, 0
  br i1 %1108, label %1109, label %1179

1109:                                             ; preds = %1101
  %1110 = getelementptr inbounds i8, i8* %1024, i64 %1104
  %1111 = bitcast i8* %1110 to i64*
  %1112 = load i64, i64* %1111, align 8, !tbaa !51
  %1113 = add i64 %1112, 1
  store i64 %1113, i64* %1111, align 8, !tbaa !51
  %1114 = bitcast i32* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1114) #7
  store i32 %1107, i32* %16, align 4, !tbaa !15
  %1115 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 68719476736, i8* noundef nonnull %1114) #7
  %1116 = icmp eq i8* %1115, null
  br i1 %1116, label %1198, label %1117

1117:                                             ; preds = %1109
  %1118 = bitcast i8* %1115 to i32*
  %1119 = load i32, i32* %1118, align 4, !tbaa !15
  store i32 %1119, i32* %16, align 4, !tbaa !15
  %1120 = icmp eq i32 %1119, 0
  br i1 %1120, label %1198, label %1121

1121:                                             ; preds = %1117
  %1122 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 1
  store i32 %1119, i32* %1122, align 4, !tbaa !52
  %1123 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %1114) #7
  %1124 = icmp eq i8* %1123, null
  br i1 %1124, label %1125, label %1130

1125:                                             ; preds = %1121
  %1126 = getelementptr inbounds i8, i8* %1024, i64 40
  %1127 = bitcast i8* %1126 to i64*
  %1128 = load i64, i64* %1127, align 8, !tbaa !53
  %1129 = add i64 %1128, 1
  store i64 %1129, i64* %1127, align 8, !tbaa !53
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1114) #7
  br label %1196

1130:                                             ; preds = %1121
  %1131 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0
  %1132 = call i8* (i8*, %struct.flow_key*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i8*, %struct.flow_key*, ...)*)(i8* noundef %1003, %struct.flow_key* noundef nonnull %1131) #7
  %1133 = icmp eq i8* %1132, null
  br i1 %1133, label %1139, label %1134

1134:                                             ; preds = %1130
  %1135 = bitcast i8* %1132 to i32*
  %1136 = load i32, i32* %1135, align 8, !tbaa !55
  %1137 = load i32, i32* %1122, align 4, !tbaa !52
  %1138 = icmp eq i32 %1136, %1137
  br i1 %1138, label %1155, label %1160

1139:                                             ; preds = %1130
  %1140 = call i32 (...) @_bpf_helper_ext_0005() #7
  %1141 = sext i32 %1140 to i64
  %1142 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 1), align 8, !tbaa !35
  %1143 = sub i64 %1141, %1142
  %1144 = icmp ugt i64 %1143, 1000000000
  br i1 %1144, label %1145, label %1146

1145:                                             ; preds = %1139
  store i64 1, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  store i64 %1141, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 1), align 8, !tbaa !35
  br label %1150

1146:                                             ; preds = %1139
  %1147 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  %1148 = add i64 %1147, 1
  store i64 %1148, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  %1149 = icmp ugt i64 %1148, 125000
  br i1 %1149, label %1174, label %1150

1150:                                             ; preds = %1146, %1145
  %1151 = bitcast %struct.real_pos_lru* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1151) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %1151, i8 0, i64 16, i1 false) #7
  %1152 = load i32, i32* %1122, align 4, !tbaa !52
  %1153 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %8, i64 0, i32 0
  store i32 %1152, i32* %1153, align 8, !tbaa !55
  %1154 = call i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...)*)(i8* noundef %1003, %struct.flow_key* noundef nonnull %1131, %struct.real_pos_lru* noundef nonnull %8, i32 noundef 0) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1151) #7
  br label %1174

1155:                                             ; preds = %1134
  %1156 = getelementptr inbounds i8, i8* %1024, i64 80
  %1157 = bitcast i8* %1156 to i64*
  %1158 = load i64, i64* %1157, align 8, !tbaa !57
  %1159 = add i64 %1158, 1
  store i64 %1159, i64* %1157, align 8, !tbaa !57
  br label %1210

1160:                                             ; preds = %1134
  store i32 %1137, i32* %1135, align 8, !tbaa !55
  %1161 = getelementptr inbounds i8, i8* %1024, i64 88
  %1162 = bitcast i8* %1161 to i64*
  %1163 = load i64, i64* %1162, align 8, !tbaa !58
  %1164 = add i64 %1163, 1
  store i64 %1164, i64* %1162, align 8, !tbaa !58
  %1165 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1165) #7
  store i32 %994, i32* %7, align 4, !tbaa !15
  %1166 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 77309411328, i8* noundef nonnull %1165) #7
  %1167 = icmp eq i8* %1166, null
  br i1 %1167, label %1173, label %1168

1168:                                             ; preds = %1160
  %1169 = getelementptr inbounds i8, i8* %1166, i64 8
  %1170 = bitcast i8* %1169 to i64*
  %1171 = load i64, i64* %1170, align 8, !tbaa !35
  %1172 = add i64 %1171, 1
  store i64 %1172, i64* %1170, align 8, !tbaa !35
  br label %1173

1173:                                             ; preds = %1168, %1160
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1165) #7
  br label %1210

1174:                                             ; preds = %1150, %1146
  %1175 = getelementptr inbounds i8, i8* %1024, i64 96
  %1176 = bitcast i8* %1175 to i64*
  %1177 = load i64, i64* %1176, align 8, !tbaa !59
  %1178 = add i64 %1177, 1
  store i64 %1178, i64* %1176, align 8, !tbaa !59
  br label %1210

1179:                                             ; preds = %1101, %1056, %1051, %1046, %1040, %1026
  %1180 = bitcast i8* %1024 to i64*
  %1181 = load i64, i64* %1180, align 8, !tbaa !60
  %1182 = add i64 %1181, 1
  store i64 %1182, i64* %1180, align 8, !tbaa !60
  br label %1197

1183:                                             ; preds = %1043
  %1184 = getelementptr inbounds i8, i8* %1024, i64 8
  %1185 = bitcast i8* %1184 to i64*
  %1186 = load i64, i64* %1185, align 8, !tbaa !61
  %1187 = add i64 %1186, 1
  store i64 %1187, i64* %1185, align 8, !tbaa !61
  %1188 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1188) #7
  store i32 %994, i32* %6, align 4, !tbaa !15
  %1189 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 77309411328, i8* noundef nonnull %1188) #7
  %1190 = icmp eq i8* %1189, null
  br i1 %1190, label %1195, label %1191

1191:                                             ; preds = %1183
  %1192 = bitcast i8* %1189 to i64*
  %1193 = load i64, i64* %1192, align 8, !tbaa !33
  %1194 = add i64 %1193, 1
  store i64 %1194, i64* %1192, align 8, !tbaa !33
  br label %1195

1195:                                             ; preds = %1191, %1183
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1188) #7
  br label %1197

1196:                                             ; preds = %1125, %1022
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1023) #7
  br label %1656

1197:                                             ; preds = %1195, %1179
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1023) #7
  br label %1217

1198:                                             ; preds = %1117, %1109
  %1199 = getelementptr inbounds i8, i8* %1024, i64 16
  %1200 = bitcast i8* %1199 to i64*
  %1201 = load i64, i64* %1200, align 8, !tbaa !62
  %1202 = add i64 %1201, 1
  store i64 %1202, i64* %1200, align 8, !tbaa !62
  %1203 = shl i64 %1106, 32
  %1204 = ashr exact i64 %1203, 32
  %1205 = getelementptr inbounds i8, i8* %1024, i64 24
  %1206 = bitcast i8* %1205 to i64*
  store i64 %1204, i64* %1206, align 8, !tbaa !63
  %1207 = bitcast i8* %1024 to i64*
  %1208 = load i64, i64* %1207, align 8, !tbaa !60
  %1209 = add i64 %1208, 1
  store i64 %1209, i64* %1207, align 8, !tbaa !60
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1114) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1023) #7
  br label %1217

1210:                                             ; preds = %1174, %1173, %1155
  %1211 = getelementptr inbounds i8, i8* %1024, i64 32
  %1212 = bitcast i8* %1211 to i64*
  %1213 = load i64, i64* %1212, align 8, !tbaa !64
  %1214 = add i64 %1213, 1
  store i64 %1214, i64* %1212, align 8, !tbaa !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1114) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1023) #7
  %1215 = bitcast %union.anon.5* %960 to i16*
  %1216 = load i16, i16* %1215, align 4, !tbaa !29
  br label %1481

1217:                                             ; preds = %1198, %1197, %1019, %1012, %1002
  %1218 = bitcast %union.anon.5* %960 to i16*
  %1219 = load i16, i16* %1218, align 4, !tbaa !29
  %1220 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 2
  %1221 = load i8, i8* %1220, align 4, !tbaa !36
  %1222 = and i8 %1221, 2
  %1223 = icmp eq i8 %1222, 0
  br i1 %1223, label %1224, label %1252

1224:                                             ; preds = %1217
  %1225 = load i32, i32* %985, align 4, !tbaa !46
  %1226 = and i32 %1225, 2
  %1227 = icmp eq i32 %1226, 0
  br i1 %1227, label %1228, label %1252

1228:                                             ; preds = %1224
  %1229 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1229) #7
  %1230 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0
  %1231 = call i8* (i8*, %struct.flow_key*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i8*, %struct.flow_key*, ...)*)(i8* noundef %1003, %struct.flow_key* noundef nonnull %1230) #7
  %1232 = icmp eq i8* %1231, null
  br i1 %1232, label %1245, label %1233

1233:                                             ; preds = %1228
  %1234 = load i8, i8* %845, align 4, !tbaa !22
  %1235 = icmp eq i8 %1234, 17
  br i1 %1235, label %1236, label %1246

1236:                                             ; preds = %1233
  %1237 = call i32 (...) @_bpf_helper_ext_0005() #7
  %1238 = sext i32 %1237 to i64
  %1239 = getelementptr inbounds i8, i8* %1231, i64 8
  %1240 = bitcast i8* %1239 to i64*
  %1241 = load i64, i64* %1240, align 8, !tbaa !65
  %1242 = sub i64 %1238, %1241
  %1243 = icmp ugt i64 %1242, 30000000000
  br i1 %1243, label %1245, label %1244

1244:                                             ; preds = %1236
  store i64 %1238, i64* %1240, align 8, !tbaa !65
  br label %1246

1245:                                             ; preds = %1236, %1228
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1229) #7
  br label %1252

1246:                                             ; preds = %1244, %1233
  %1247 = bitcast i8* %1231 to i32*
  %1248 = load i32, i32* %1247, align 8, !tbaa !55
  store i32 %1248, i32* %5, align 4, !tbaa !15
  %1249 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 1
  store i32 %1248, i32* %1249, align 4, !tbaa !52
  %1250 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %1229) #7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1229) #7
  %1251 = icmp eq i8* %1250, null
  br i1 %1251, label %1252, label %1481

1252:                                             ; preds = %1246, %1245, %1224, %1217
  %1253 = load i8, i8* %845, align 4, !tbaa !22
  %1254 = icmp eq i8 %1253, 6
  br i1 %1254, label %1255, label %1265

1255:                                             ; preds = %1252
  %1256 = load i8, i8* %1220, align 4, !tbaa !36
  %1257 = and i8 %1256, 2
  %1258 = icmp eq i8 %1257, 0
  br i1 %1258, label %1262, label %1259

1259:                                             ; preds = %1255
  %1260 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 513, i32 0), align 16, !tbaa !33
  %1261 = add i64 %1260, 1
  store i64 %1261, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 513, i32 0), align 16, !tbaa !33
  br label %1265

1262:                                             ; preds = %1255
  %1263 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 513, i32 1), align 8, !tbaa !35
  %1264 = add i64 %1263, 1
  store i64 %1264, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 513, i32 1), align 8, !tbaa !35
  br label %1265

1265:                                             ; preds = %1262, %1259, %1252
  %1266 = bitcast %struct.real_pos_lru* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %1266) #7
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(16) %1266, i8 0, i64 16, i1 false) #7
  %1267 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1267) #7
  %1268 = call i32 (...) @_bpf_helper_ext_0005() #7
  %1269 = sext i32 %1268 to i64
  %1270 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 1), align 8, !tbaa !35
  %1271 = sub i64 %1269, %1270
  %1272 = icmp ugt i64 %1271, 1000000000
  br i1 %1272, label %1273, label %1274

1273:                                             ; preds = %1265
  store i64 1, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  store i64 %1269, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 1), align 8, !tbaa !35
  br label %1278

1274:                                             ; preds = %1265
  %1275 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  %1276 = add i64 %1275, 1
  store i64 %1276, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 514, i32 0), align 16, !tbaa !33
  %1277 = icmp ugt i64 %1276, 125000
  br i1 %1277, label %1279, label %1278

1278:                                             ; preds = %1274, %1273
  br label %1279

1279:                                             ; preds = %1278, %1274
  %1280 = phi i1 [ false, %1278 ], [ true, %1274 ]
  %1281 = load i32, i32* %985, align 4, !tbaa !46
  %1282 = and i32 %1281, 8
  %1283 = icmp eq i32 %1282, 0
  br i1 %1283, label %1284, label %1300

1284:                                             ; preds = %1279
  %1285 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 0, i32 0, i64 0
  %1286 = load i32, i32* %1285, align 4, !tbaa !29
  %1287 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 0, i32 0, i64 1
  %1288 = load i32, i32* %1287, align 4, !tbaa !15
  %1289 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 0, i32 0, i64 2
  %1290 = load i32, i32* %1289, align 4, !tbaa !15
  %1291 = getelementptr inbounds i8, i8* %837, i64 15
  %1292 = load i8, i8* %1291, align 1, !tbaa !29
  %1293 = getelementptr inbounds i8, i8* %837, i64 14
  %1294 = load i8, i8* %1293, align 2, !tbaa !29
  %1295 = getelementptr inbounds i8, i8* %837, i64 13
  %1296 = load i8, i8* %1295, align 1, !tbaa !29
  %1297 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 0, i32 0, i64 3
  %1298 = bitcast i32* %1297 to i8*
  %1299 = load i8, i8* %1298, align 4, !tbaa !29
  br label %1302

1300:                                             ; preds = %1279
  %1301 = load i16, i16* %962, align 2, !tbaa !29
  store i16 %1301, i16* %1218, align 4, !tbaa !29
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %837, i8 0, i64 16, i1 false) #7
  br label %1302

1302:                                             ; preds = %1284, %1300
  %1303 = phi i8 [ %1299, %1284 ], [ 0, %1300 ]
  %1304 = phi i8 [ %1296, %1284 ], [ 0, %1300 ]
  %1305 = phi i8 [ %1294, %1284 ], [ 0, %1300 ]
  %1306 = phi i8 [ %1292, %1284 ], [ 0, %1300 ]
  %1307 = phi i32 [ %1290, %1284 ], [ 0, %1300 ]
  %1308 = phi i32 [ %1288, %1284 ], [ 0, %1300 ]
  %1309 = phi i32 [ %1286, %1284 ], [ 0, %1300 ]
  %1310 = add i32 %1308, -559038209
  %1311 = add i32 %1307, -559038209
  %1312 = sub i32 %1309, %1307
  %1313 = call i32 @llvm.fshl.i32(i32 %1311, i32 %1311, i32 4) #7
  %1314 = xor i32 %1313, %1312
  %1315 = add i32 %1311, %1310
  %1316 = sub i32 %1310, %1314
  %1317 = call i32 @llvm.fshl.i32(i32 %1314, i32 %1314, i32 6) #7
  %1318 = xor i32 %1316, %1317
  %1319 = add i32 %1314, %1315
  %1320 = sub i32 %1315, %1318
  %1321 = call i32 @llvm.fshl.i32(i32 %1318, i32 %1318, i32 8) #7
  %1322 = xor i32 %1320, %1321
  %1323 = add i32 %1318, %1319
  %1324 = sub i32 %1319, %1322
  %1325 = call i32 @llvm.fshl.i32(i32 %1322, i32 %1322, i32 16) #7
  %1326 = xor i32 %1324, %1325
  %1327 = add i32 %1322, %1323
  %1328 = sub i32 %1323, %1326
  %1329 = call i32 @llvm.fshl.i32(i32 %1326, i32 %1326, i32 19) #7
  %1330 = xor i32 %1328, %1329
  %1331 = add i32 %1326, %1327
  %1332 = sub i32 %1327, %1330
  %1333 = call i32 @llvm.fshl.i32(i32 %1330, i32 %1330, i32 4) #7
  %1334 = xor i32 %1332, %1333
  %1335 = add i32 %1330, %1331
  %1336 = zext i8 %1306 to i32
  %1337 = shl nuw i32 %1336, 24
  %1338 = zext i8 %1305 to i32
  %1339 = shl nuw nsw i32 %1338, 16
  %1340 = zext i8 %1304 to i32
  %1341 = shl nuw nsw i32 %1340, 8
  %1342 = zext i8 %1303 to i32
  %1343 = or i32 %1339, %1337
  %1344 = or i32 %1343, %1341
  %1345 = or i32 %1344, %1342
  %1346 = add i32 %1331, %1345
  %1347 = xor i32 %1334, %1335
  %1348 = call i32 @llvm.fshl.i32(i32 %1335, i32 %1335, i32 14) #7
  %1349 = sub i32 %1347, %1348
  %1350 = xor i32 %1349, %1346
  %1351 = call i32 @llvm.fshl.i32(i32 %1349, i32 %1349, i32 11) #7
  %1352 = sub i32 %1350, %1351
  %1353 = xor i32 %1352, %1335
  %1354 = call i32 @llvm.fshl.i32(i32 %1352, i32 %1352, i32 25) #7
  %1355 = sub i32 %1353, %1354
  %1356 = xor i32 %1355, %1349
  %1357 = call i32 @llvm.fshl.i32(i32 %1355, i32 %1355, i32 16) #7
  %1358 = sub i32 %1356, %1357
  %1359 = xor i32 %1358, %1352
  %1360 = call i32 @llvm.fshl.i32(i32 %1358, i32 %1358, i32 4) #7
  %1361 = sub i32 %1359, %1360
  %1362 = xor i32 %1361, %1355
  %1363 = call i32 @llvm.fshl.i32(i32 %1361, i32 %1361, i32 14) #7
  %1364 = sub i32 %1362, %1363
  %1365 = xor i32 %1364, %1358
  %1366 = call i32 @llvm.fshl.i32(i32 %1364, i32 %1364, i32 24) #7
  %1367 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 2, i32 0
  %1368 = load i32, i32* %1367, align 4, !tbaa !29
  %1369 = sub i32 -525483785, %1366
  %1370 = add i32 %1369, %1365
  %1371 = add i32 %1368, -525483785
  %1372 = xor i32 %1371, -525483785
  %1373 = call i32 @llvm.fshl.i32(i32 %1371, i32 %1371, i32 14) #7
  %1374 = sub i32 %1372, %1373
  %1375 = xor i32 %1370, %1374
  %1376 = call i32 @llvm.fshl.i32(i32 %1374, i32 %1374, i32 11) #7
  %1377 = sub i32 %1375, %1376
  %1378 = xor i32 %1377, %1371
  %1379 = call i32 @llvm.fshl.i32(i32 %1377, i32 %1377, i32 25) #7
  %1380 = sub i32 %1378, %1379
  %1381 = xor i32 %1380, %1374
  %1382 = call i32 @llvm.fshl.i32(i32 %1380, i32 %1380, i32 16) #7
  %1383 = sub i32 %1381, %1382
  %1384 = xor i32 %1383, %1377
  %1385 = call i32 @llvm.fshl.i32(i32 %1383, i32 %1383, i32 4) #7
  %1386 = sub i32 %1384, %1385
  %1387 = xor i32 %1386, %1380
  %1388 = call i32 @llvm.fshl.i32(i32 %1386, i32 %1386, i32 14) #7
  %1389 = sub i32 %1387, %1388
  %1390 = xor i32 %1389, %1383
  %1391 = call i32 @llvm.fshl.i32(i32 %1389, i32 %1389, i32 24) #7
  %1392 = sub i32 %1390, %1391
  %1393 = urem i32 %1392, 65537
  %1394 = load i32, i32* %993, align 4, !tbaa !48
  %1395 = mul i32 %1394, 65537
  %1396 = add i32 %1393, %1395
  %1397 = icmp ugt i32 %1396, 33554943
  br i1 %1397, label %1424, label %1398

1398:                                             ; preds = %1302
  store i32 0, i32* %4, align 4, !tbaa !15
  %1399 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 521, i32 1), align 8, !tbaa !35
  %1400 = add i64 %1399, 1
  store i64 %1400, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 521, i32 1), align 8, !tbaa !35
  %1401 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 1
  store i32 0, i32* %1401, align 4, !tbaa !52
  %1402 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 38654705664, i8* noundef nonnull %1267) #7
  %1403 = icmp eq i8* %1402, null
  br i1 %1403, label %1404, label %1407

1404:                                             ; preds = %1398
  %1405 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 521, i32 0), align 16, !tbaa !33
  %1406 = add i64 %1405, 1
  store i64 %1406, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 521, i32 0), align 16, !tbaa !33
  br label %1424

1407:                                             ; preds = %1398
  %1408 = icmp eq i8* %1003, null
  br i1 %1408, label %1425, label %1409

1409:                                             ; preds = %1407
  %1410 = load i32, i32* %985, align 4, !tbaa !46
  %1411 = and i32 %1410, 2
  %1412 = icmp ne i32 %1411, 0
  %1413 = or i1 %1280, %1412
  br i1 %1413, label %1425, label %1414

1414:                                             ; preds = %1409
  %1415 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0
  %1416 = load i8, i8* %845, align 4, !tbaa !22
  %1417 = icmp eq i8 %1416, 17
  br i1 %1417, label %1418, label %1420

1418:                                             ; preds = %1414
  %1419 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %3, i64 0, i32 1
  store i64 %1269, i64* %1419, align 8, !tbaa !65
  br label %1420

1420:                                             ; preds = %1418, %1414
  %1421 = load i32, i32* %4, align 4, !tbaa !15
  %1422 = getelementptr inbounds %struct.real_pos_lru, %struct.real_pos_lru* %3, i64 0, i32 0
  store i32 %1421, i32* %1422, align 8, !tbaa !55
  %1423 = call i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0002 to i32 (i8*, %struct.flow_key*, %struct.real_pos_lru*, i32, ...)*)(i8* noundef nonnull %1003, %struct.flow_key* noundef nonnull %1415, %struct.real_pos_lru* noundef nonnull %3, i32 noundef 0) #7
  br label %1425

1424:                                             ; preds = %1404, %1302
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1267) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1266) #7
  br label %1656

1425:                                             ; preds = %1420, %1409, %1407
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1267) #7
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %1266) #7
  %1426 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1426) #7
  store i32 0, i32* %2, align 4, !tbaa !15
  %1427 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 51539607552, i8* noundef nonnull %1426) #7
  %1428 = icmp eq i8* %1427, null
  br i1 %1428, label %1477, label %1429

1429:                                             ; preds = %1425
  %1430 = bitcast i8* %1427 to i32*
  %1431 = load i32, i32* %1430, align 4, !tbaa !29
  %1432 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %12, i64 0, i32 0, i32 0, i64 0
  %1433 = load i32, i32* %1432, align 4, !tbaa !29
  %1434 = icmp eq i32 %1431, %1433
  br i1 %1434, label %1435, label %1456

1435:                                             ; preds = %1429
  %1436 = getelementptr inbounds i8, i8* %1427, i64 4
  %1437 = bitcast i8* %1436 to i32*
  %1438 = load i32, i32* %1437, align 4, !tbaa !29
  %1439 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %12, i64 0, i32 0, i32 0, i64 1
  %1440 = load i32, i32* %1439, align 4, !tbaa !29
  %1441 = icmp eq i32 %1438, %1440
  br i1 %1441, label %1442, label %1456

1442:                                             ; preds = %1435
  %1443 = getelementptr inbounds i8, i8* %1427, i64 8
  %1444 = bitcast i8* %1443 to i32*
  %1445 = load i32, i32* %1444, align 4, !tbaa !29
  %1446 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %12, i64 0, i32 0, i32 0, i64 2
  %1447 = load i32, i32* %1446, align 4, !tbaa !29
  %1448 = icmp eq i32 %1445, %1447
  br i1 %1448, label %1449, label %1456

1449:                                             ; preds = %1442
  %1450 = getelementptr inbounds i8, i8* %1427, i64 12
  %1451 = bitcast i8* %1450 to i32*
  %1452 = load i32, i32* %1451, align 4, !tbaa !29
  %1453 = getelementptr inbounds %struct.vip_definition, %struct.vip_definition* %12, i64 0, i32 0, i32 0, i64 3
  %1454 = load i32, i32* %1453, align 4, !tbaa !29
  %1455 = icmp ne i32 %1452, %1454
  br label %1456

1456:                                             ; preds = %1449, %1442, %1435, %1429
  %1457 = phi i1 [ %1455, %1449 ], [ true, %1442 ], [ true, %1435 ], [ true, %1429 ]
  %1458 = getelementptr inbounds i8, i8* %1427, i64 16
  %1459 = bitcast i8* %1458 to i16*
  %1460 = load i16, i16* %1459, align 4, !tbaa !43
  %1461 = load i16, i16* %964, align 4, !tbaa !43
  %1462 = load i8, i8* %966, align 2, !tbaa !45
  %1463 = getelementptr inbounds i8, i8* %1427, i64 18
  store i8 %1462, i8* %1463, align 2, !tbaa !45
  %1464 = icmp eq i8 %1462, 0
  %1465 = icmp ne i16 %1460, %1461
  %1466 = select i1 %1457, i1 true, i1 %1465
  %1467 = select i1 %1466, i1 true, i1 %1464
  br i1 %1467, label %1478, label %1468

1468:                                             ; preds = %1456
  %1469 = load i32, i32* %1401, align 4, !tbaa !52
  %1470 = icmp ugt i32 %1469, 4095
  %1471 = zext i32 %1469 to i64
  %1472 = getelementptr inbounds [4096 x i32], [4096 x i32]* @__lru_miss_stats, i64 0, i64 %1471
  %1473 = select i1 %1470, i32* null, i32* %1472
  br i1 %1470, label %1477, label %1474

1474:                                             ; preds = %1468
  %1475 = load i32, i32* %1473, align 4, !tbaa !15
  %1476 = add i32 %1475, 1
  store i32 %1476, i32* %1473, align 4, !tbaa !15
  br label %1478

1477:                                             ; preds = %1468, %1425
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1426) #7
  br label %1656

1478:                                             ; preds = %1474, %1456
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1426) #7
  %1479 = load i64, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 512, i32 1), align 8, !tbaa !35
  %1480 = add i64 %1479, 1
  store i64 %1480, i64* getelementptr inbounds ([1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 512, i32 1), align 8, !tbaa !35
  br label %1481

1481:                                             ; preds = %1478, %1246, %1210
  %1482 = phi i16 [ %1219, %1478 ], [ %1219, %1246 ], [ %1216, %1210 ]
  %1483 = phi i8* [ %1402, %1478 ], [ %1250, %1246 ], [ %1123, %1210 ]
  %1484 = bitcast %union.anon.5* %960 to i16*
  %1485 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef 17179869184, i8* noundef nonnull %839) #7
  %1486 = icmp eq i8* %1485, null
  %1487 = icmp ugt i32 %994, 1023
  %1488 = select i1 %1486, i1 true, i1 %1487
  br i1 %1488, label %1656, label %1489

1489:                                             ; preds = %1481
  %1490 = zext i32 %994 to i64
  %1491 = getelementptr inbounds [1024 x %struct.__lb_stats], [1024 x %struct.__lb_stats]* @__stats, i64 0, i64 %1490, i32 0
  %1492 = zext i16 %856 to i64
  %1493 = bitcast i64* %1491 to <2 x i64>*
  %1494 = load <2 x i64>, <2 x i64>* %1493, align 16, !tbaa !51
  %1495 = insertelement <2 x i64> <i64 1, i64 poison>, i64 %1492, i64 1
  %1496 = add <2 x i64> %1494, %1495
  %1497 = bitcast i64* %1491 to <2 x i64>*
  store <2 x i64> %1496, <2 x i64>* %1497, align 16, !tbaa !51
  %1498 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 1
  %1499 = load i32, i32* %1498, align 4, !tbaa !15
  %1500 = icmp ugt i32 %1499, 4095
  br i1 %1500, label %1656, label %1501

1501:                                             ; preds = %1489
  %1502 = zext i32 %1499 to i64
  %1503 = getelementptr inbounds [4096 x %struct.__lb_stats], [4096 x %struct.__lb_stats]* @__reals_stats, i64 0, i64 %1502, i32 0
  %1504 = bitcast i64* %1503 to <2 x i64>*
  %1505 = load <2 x i64>, <2 x i64>* %1504, align 16, !tbaa !51
  %1506 = add <2 x i64> %1505, %1495
  %1507 = bitcast i64* %1503 to <2 x i64>*
  store <2 x i64> %1506, <2 x i64>* %1507, align 16, !tbaa !51
  store i16 %1482, i16* %1484, align 4, !tbaa !29
  %1508 = getelementptr inbounds i8, i8* %1483, i64 16
  %1509 = load i8, i8* %1508, align 4, !tbaa !66
  %1510 = and i8 %1509, 1
  %1511 = icmp eq i8 %1510, 0
  br i1 %1511, label %1564, label %1512

1512:                                             ; preds = %1501
  %1513 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -40) #7
  %1514 = icmp eq i32 %1513, 0
  br i1 %1514, label %1515, label %1656

1515:                                             ; preds = %1512
  %1516 = load i64, i64* %31, align 8, !tbaa !5
  %1517 = inttoptr i64 %1516 to i8*
  %1518 = load i64, i64* %34, align 8, !tbaa !11
  %1519 = inttoptr i64 %1516 to %struct.ethhdr*
  %1520 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1519, i64 1
  %1521 = inttoptr i64 %1518 to %struct.ethhdr*
  %1522 = icmp ugt %struct.ethhdr* %1520, %1521
  %1523 = getelementptr i8, i8* %1517, i64 54
  %1524 = bitcast i8* %1523 to %struct.ethhdr*
  %1525 = icmp ugt %struct.ethhdr* %1524, %1521
  %1526 = select i1 %1522, i1 true, i1 %1525
  %1527 = bitcast i8* %1523 to %struct.ipv6hdr*
  %1528 = inttoptr i64 %1518 to %struct.ipv6hdr*
  %1529 = icmp ugt %struct.ipv6hdr* %1527, %1528
  %1530 = select i1 %1526, i1 true, i1 %1529
  br i1 %1530, label %1656, label %1531

1531:                                             ; preds = %1515
  %1532 = getelementptr i8, i8* %1517, i64 14
  %1533 = getelementptr i8, i8* %1517, i64 40
  %1534 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1519, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %1534, i8* noundef nonnull align 8 dereferenceable(6) %1485, i64 6, i1 false) #7
  %1535 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1519, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %1535, i8* noundef nonnull align 1 dereferenceable(6) %1533, i64 6, i1 false) #7
  %1536 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1519, i64 0, i32 2
  store i16 -8826, i16* %1536, align 1, !tbaa !12
  %1537 = load i16, i16* %1484, align 4, !tbaa !29
  %1538 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 0, i32 0, i64 3
  %1539 = load i32, i32* %1538, align 4, !tbaa !29
  %1540 = zext i16 %1537 to i32
  %1541 = xor i32 %1539, %1540
  %1542 = add i16 %856, 40
  %1543 = load i8, i8* %848, align 1, !tbaa !18
  %1544 = getelementptr i8, i8* %1517, i64 15
  %1545 = getelementptr i8, i8* %1517, i64 16
  %1546 = bitcast i8* %1545 to i16*
  store i16 0, i16* %1546, align 1
  %1547 = lshr i8 %1543, 4
  %1548 = or i8 %1547, 96
  store i8 %1548, i8* %1532, align 4
  %1549 = shl i8 %1543, 4
  store i8 %1549, i8* %1544, align 1, !tbaa !29
  %1550 = getelementptr i8, i8* %1517, i64 20
  store i8 41, i8* %1550, align 2, !tbaa !68
  %1551 = call i16 @llvm.bswap.i16(i16 %1542) #7
  %1552 = getelementptr i8, i8* %1517, i64 18
  %1553 = bitcast i8* %1552 to i16*
  store i16 %1551, i16* %1553, align 4, !tbaa !70
  %1554 = getelementptr i8, i8* %1517, i64 21
  store i8 64, i8* %1554, align 1, !tbaa !71
  %1555 = getelementptr i8, i8* %1517, i64 22
  %1556 = bitcast i8* %1555 to i32*
  store i32 1, i32* %1556, align 4
  %1557 = getelementptr i8, i8* %1517, i64 26
  %1558 = bitcast i8* %1557 to i32*
  store i32 0, i32* %1558, align 4
  %1559 = getelementptr i8, i8* %1517, i64 30
  %1560 = bitcast i8* %1559 to i32*
  store i32 0, i32* %1560, align 4
  %1561 = getelementptr i8, i8* %1517, i64 34
  %1562 = bitcast i8* %1561 to i32*
  store i32 %1541, i32* %1562, align 4
  %1563 = getelementptr i8, i8* %1517, i64 38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(16) %1563, i8* noundef nonnull align 4 dereferenceable(16) %1483, i64 16, i1 false) #7
  br label %1656

1564:                                             ; preds = %1501
  %1565 = getelementptr inbounds %struct.packet_description, %struct.packet_description* %11, i64 0, i32 0, i32 0, i32 0, i64 0
  %1566 = load i32, i32* %1565, align 4, !tbaa !29
  %1567 = call i16 @llvm.bswap.i16(i16 %1482) #7
  %1568 = zext i16 %1567 to i32
  %1569 = shl nuw i32 %1568, 16
  %1570 = and i32 %1566, -65536
  %1571 = xor i32 %1570, %1569
  %1572 = or i32 %1571, 4268
  %1573 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef nonnull %0, i32 noundef -20) #7
  %1574 = icmp eq i32 %1573, 0
  br i1 %1574, label %1575, label %1656

1575:                                             ; preds = %1564
  %1576 = load i64, i64* %31, align 8, !tbaa !5
  %1577 = inttoptr i64 %1576 to i8*
  %1578 = load i64, i64* %34, align 8, !tbaa !11
  %1579 = inttoptr i64 %1576 to %struct.ethhdr*
  %1580 = getelementptr i8, i8* %1577, i64 14
  %1581 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1579, i64 1
  %1582 = inttoptr i64 %1578 to %struct.ethhdr*
  %1583 = icmp ugt %struct.ethhdr* %1581, %1582
  %1584 = getelementptr i8, i8* %1577, i64 34
  %1585 = bitcast i8* %1584 to %struct.ethhdr*
  %1586 = icmp ugt %struct.ethhdr* %1585, %1582
  %1587 = select i1 %1583, i1 true, i1 %1586
  %1588 = bitcast i8* %1584 to %struct.iphdr*
  %1589 = inttoptr i64 %1578 to %struct.iphdr*
  %1590 = icmp ugt %struct.iphdr* %1588, %1589
  %1591 = select i1 %1587, i1 true, i1 %1590
  br i1 %1591, label %1656, label %1592

1592:                                             ; preds = %1575
  %1593 = getelementptr i8, i8* %1577, i64 20
  %1594 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1579, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %1594, i8* noundef nonnull align 8 dereferenceable(6) %1485, i64 6, i1 false) #7
  %1595 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1579, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %1595, i8* noundef nonnull align 1 dereferenceable(6) %1593, i64 6, i1 false) #7
  %1596 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1579, i64 0, i32 2
  store i16 8, i16* %1596, align 1, !tbaa !12
  %1597 = load i8, i8* %848, align 1, !tbaa !18
  %1598 = bitcast i8* %1483 to i32*
  %1599 = load i32, i32* %1598, align 4, !tbaa !29
  store i8 69, i8* %1580, align 4
  %1600 = bitcast i8* %1593 to i16*
  store i16 0, i16* %1600, align 2, !tbaa !24
  %1601 = getelementptr i8, i8* %1577, i64 23
  store i8 4, i8* %1601, align 1, !tbaa !21
  %1602 = getelementptr i8, i8* %1577, i64 24
  %1603 = bitcast i8* %1602 to i16*
  %1604 = getelementptr i8, i8* %1577, i64 15
  store i8 %1597, i8* %1604, align 1, !tbaa !16
  %1605 = add i16 %856, 20
  %1606 = call i16 @llvm.bswap.i16(i16 %1605) #7
  %1607 = getelementptr i8, i8* %1577, i64 16
  %1608 = bitcast i8* %1607 to i16*
  store i16 %1606, i16* %1608, align 2, !tbaa !23
  %1609 = getelementptr i8, i8* %1577, i64 18
  %1610 = bitcast i8* %1609 to i16*
  store i16 0, i16* %1610, align 4, !tbaa !72
  %1611 = getelementptr i8, i8* %1577, i64 30
  %1612 = bitcast i8* %1611 to i32*
  store i32 %1599, i32* %1612, align 4, !tbaa !29
  %1613 = getelementptr i8, i8* %1577, i64 26
  %1614 = bitcast i8* %1613 to i32*
  store i32 %1572, i32* %1614, align 4, !tbaa !29
  %1615 = getelementptr i8, i8* %1577, i64 22
  store i8 64, i8* %1615, align 4, !tbaa !28
  %1616 = bitcast i8* %1580 to i16*
  %1617 = load i16, i16* %1616, align 2, !tbaa !30
  %1618 = zext i16 %1617 to i64
  %1619 = zext i16 %1606 to i64
  %1620 = bitcast i8* %1615 to i16*
  %1621 = load i16, i16* %1620, align 2, !tbaa !30
  %1622 = zext i16 %1621 to i64
  %1623 = lshr exact i32 %1571, 16
  %1624 = zext i32 %1623 to i64
  %1625 = and i32 %1599, 65535
  %1626 = zext i32 %1625 to i64
  %1627 = lshr i32 %1599, 16
  %1628 = zext i32 %1627 to i64
  %1629 = add nuw nsw i64 %1619, 4268
  %1630 = add nuw nsw i64 %1629, %1624
  %1631 = add nuw nsw i64 %1630, %1626
  %1632 = add nuw nsw i64 %1631, %1628
  %1633 = add nuw nsw i64 %1632, %1618
  %1634 = add nuw nsw i64 %1633, %1622
  %1635 = icmp ult i64 %1634, 65536
  %1636 = lshr i64 %1634, 16
  %1637 = and i64 %1634, 65535
  %1638 = add nuw nsw i64 %1637, %1636
  %1639 = select i1 %1635, i64 %1634, i64 %1638
  %1640 = icmp ult i64 %1639, 65536
  %1641 = lshr i64 %1639, 16
  %1642 = and i64 %1639, 65535
  %1643 = add nuw nsw i64 %1642, %1641
  %1644 = select i1 %1640, i64 %1639, i64 %1643
  %1645 = icmp ult i64 %1644, 65536
  %1646 = lshr i64 %1644, 16
  %1647 = and i64 %1644, 65535
  %1648 = add nuw nsw i64 %1647, %1646
  %1649 = select i1 %1645, i64 %1644, i64 %1648
  %1650 = icmp ult i64 %1649, 65536
  %1651 = lshr i64 %1649, 16
  %1652 = select i1 %1650, i64 65536, i64 %1651
  %1653 = add nuw nsw i64 %1652, %1649
  %1654 = trunc i64 %1653 to i16
  %1655 = xor i16 %1654, -1
  store i16 %1655, i16* %1603, align 2, !tbaa !31
  br label %1656

1656:                                             ; preds = %1592, %1575, %1564, %1531, %1515, %1512, %1489, %1481, %1477, %1424, %1196
  %1657 = phi i32 [ 1, %1424 ], [ 1, %1481 ], [ 1, %1489 ], [ 1, %1196 ], [ 1, %1477 ], [ 3, %1592 ], [ 3, %1531 ], [ 1, %1512 ], [ 1, %1515 ], [ 1, %1564 ], [ 1, %1575 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %995) #7
  br label %1658

1658:                                             ; preds = %836, %842, %857, %860, %862, %884, %887, %903, %907, %933, %969, %978, %1656
  %1659 = phi i32 [ %1657, %1656 ], [ 2, %903 ], [ 2, %969 ], [ 1, %978 ], [ 1, %907 ], [ 1, %933 ], [ 3, %862 ], [ 1, %884 ], [ 1, %857 ], [ 2, %860 ], [ 1, %887 ], [ 1, %842 ], [ 1, %836 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %839) #7
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %838) #7
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %837) #7
  br label %1660

1660:                                             ; preds = %39, %1, %1658, %834
  %1661 = phi i32 [ %835, %834 ], [ %1659, %1658 ], [ 1, %1 ], [ 2, %39 ]
  ret i32 %1661
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

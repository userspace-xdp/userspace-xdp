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
%struct.vrrphdr = type { i8, i8, i8, i8, %union.anon.4, i16 }
%union.anon.4 = type { %struct.anon.6 }
%struct.anon.6 = type { i16 }
%struct.parse_pkt = type { i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.1 }
%union.anon.1 = type { %struct.anon.2 }
%struct.anon.2 = type { i32, i32 }
%struct.ip_auth_hdr = type { i8, i8, i16, i32, i32, [0 x i8] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct._vlan_hdr = type { i16, i16 }

@__vrrp_vrid_filter = dso_local global [256 x %struct.vrrp_filter] zeroinitializer, align 16
@__l3_filter_data = dso_local global [1179648 x i8] zeroinitializer, align 16
@__l3_filter = dso_local global %struct.bpftime_hash_map_t { i32 32768, i32 24, i32 8, i8* getelementptr inbounds ([1179648 x i8], [1179648 x i8]* @__l3_filter_data, i32 0, i32 0) }, align 8
@_license = dso_local global [4 x i8] c"GPL\00", align 1
@l3_filter = dso_local global %struct.anon zeroinitializer, align 8
@vrrp_vrid_filter = dso_local global %struct.anon.0 zeroinitializer, align 8
@__const.layer3_filter.key = private unnamed_addr constant %struct.flow_key { %union.anon zeroinitializer, i32 0, [4 x i8] undef }, align 8
@__const.layer3_filter.____fmt = private unnamed_addr constant [24 x i8] c"only ipv4 is supported\0A\00", align 16
@l3_filter_id = internal constant i64 17179869184, align 8
@vrrp_vrid_filter_id = internal constant i64 21474836480, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bpf_main(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca %struct.xdp_md*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = bitcast i8* %4 to %struct.xdp_md*
  store %struct.xdp_md* %5, %struct.xdp_md** %3, align 8
  %6 = load %struct.xdp_md*, %struct.xdp_md** %3, align 8
  %7 = call i32 @xdp_pass(%struct.xdp_md* noundef %6)
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.vrrphdr*, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.vrrp_filter*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i64*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca %struct.parse_pkt*, align 8
  %17 = alloca %struct.iphdr*, align 8
  %18 = alloca %struct.vrrphdr*, align 8
  %19 = alloca %struct.ip_auth_hdr*, align 8
  %20 = alloca %struct.flow_key, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i64*, align 8
  %24 = alloca [24 x i8], align 16
  %25 = alloca i32, align 4
  %26 = alloca i8, align 1
  %27 = alloca %struct.ethhdr*, align 8
  %28 = alloca i8*, align 8
  %29 = alloca %struct.parse_pkt*, align 8
  %30 = alloca %struct._vlan_hdr*, align 8
  %31 = alloca i16, align 2
  %32 = alloca i8, align 1
  %33 = alloca i32, align 4
  %34 = alloca %struct.xdp_md*, align 8
  %35 = alloca i8*, align 8
  %36 = alloca i8*, align 8
  %37 = alloca %struct.parse_pkt, align 2
  %38 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %34, align 8
  %39 = load %struct.xdp_md*, %struct.xdp_md** %34, align 8
  %40 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %39, i32 0, i32 1
  %41 = load i64, i64* %40, align 8
  %42 = inttoptr i64 %41 to i8*
  store i8* %42, i8** %35, align 8
  %43 = load %struct.xdp_md*, %struct.xdp_md** %34, align 8
  %44 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %43, i32 0, i32 0
  %45 = load i64, i64* %44, align 8
  %46 = inttoptr i64 %45 to i8*
  store i8* %46, i8** %36, align 8
  %47 = bitcast %struct.parse_pkt* %37 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %47, i8 0, i64 4, i1 false)
  %48 = load i8*, i8** %36, align 8
  %49 = bitcast i8* %48 to %struct.ethhdr*
  %50 = load i8*, i8** %35, align 8
  store %struct.ethhdr* %49, %struct.ethhdr** %27, align 8
  store i8* %50, i8** %28, align 8
  store %struct.parse_pkt* %37, %struct.parse_pkt** %29, align 8
  store i8 14, i8* %32, align 1
  %51 = load %struct.ethhdr*, %struct.ethhdr** %27, align 8
  %52 = bitcast %struct.ethhdr* %51 to i8*
  %53 = load i8, i8* %32, align 1
  %54 = zext i8 %53 to i32
  %55 = sext i32 %54 to i64
  %56 = getelementptr i8, i8* %52, i64 %55
  %57 = load i8*, i8** %28, align 8
  %58 = icmp ugt i8* %56, %57
  br i1 %58, label %59, label %60

59:                                               ; preds = %1
  store i8 0, i8* %26, align 1
  br label %157

60:                                               ; preds = %1
  %61 = load %struct.ethhdr*, %struct.ethhdr** %27, align 8
  %62 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %61, i32 0, i32 2
  %63 = load i16, i16* %62, align 2
  store i16 %63, i16* %31, align 2
  %64 = load i16, i16* %31, align 2
  %65 = zext i16 %64 to i32
  %66 = icmp eq i32 %65, 129
  br i1 %66, label %71, label %67

67:                                               ; preds = %60
  %68 = load i16, i16* %31, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp eq i32 %69, 43144
  br i1 %70, label %71, label %96

71:                                               ; preds = %67, %60
  %72 = load %struct.ethhdr*, %struct.ethhdr** %27, align 8
  %73 = bitcast %struct.ethhdr* %72 to i8*
  %74 = load i8, i8* %32, align 1
  %75 = zext i8 %74 to i32
  %76 = sext i32 %75 to i64
  %77 = getelementptr i8, i8* %73, i64 %76
  %78 = bitcast i8* %77 to %struct._vlan_hdr*
  store %struct._vlan_hdr* %78, %struct._vlan_hdr** %30, align 8
  %79 = load i8, i8* %32, align 1
  %80 = zext i8 %79 to i64
  %81 = add i64 %80, 4
  %82 = trunc i64 %81 to i8
  store i8 %82, i8* %32, align 1
  %83 = load %struct.ethhdr*, %struct.ethhdr** %27, align 8
  %84 = bitcast %struct.ethhdr* %83 to i8*
  %85 = load i8, i8* %32, align 1
  %86 = zext i8 %85 to i32
  %87 = sext i32 %86 to i64
  %88 = getelementptr i8, i8* %84, i64 %87
  %89 = load i8*, i8** %28, align 8
  %90 = icmp ugt i8* %88, %89
  br i1 %90, label %91, label %92

91:                                               ; preds = %71
  store i8 0, i8* %26, align 1
  br label %157

92:                                               ; preds = %71
  %93 = load %struct._vlan_hdr*, %struct._vlan_hdr** %30, align 8
  %94 = getelementptr inbounds %struct._vlan_hdr, %struct._vlan_hdr* %93, i32 0, i32 1
  %95 = load i16, i16* %94, align 2
  store i16 %95, i16* %31, align 2
  br label %96

96:                                               ; preds = %92, %67
  %97 = load i16, i16* %31, align 2
  %98 = zext i16 %97 to i32
  %99 = icmp eq i32 %98, 129
  br i1 %99, label %104, label %100

100:                                              ; preds = %96
  %101 = load i16, i16* %31, align 2
  %102 = zext i16 %101 to i32
  %103 = icmp eq i32 %102, 43144
  br i1 %103, label %104, label %129

104:                                              ; preds = %100, %96
  %105 = load %struct.ethhdr*, %struct.ethhdr** %27, align 8
  %106 = bitcast %struct.ethhdr* %105 to i8*
  %107 = load i8, i8* %32, align 1
  %108 = zext i8 %107 to i32
  %109 = sext i32 %108 to i64
  %110 = getelementptr i8, i8* %106, i64 %109
  %111 = bitcast i8* %110 to %struct._vlan_hdr*
  store %struct._vlan_hdr* %111, %struct._vlan_hdr** %30, align 8
  %112 = load i8, i8* %32, align 1
  %113 = zext i8 %112 to i64
  %114 = add i64 %113, 4
  %115 = trunc i64 %114 to i8
  store i8 %115, i8* %32, align 1
  %116 = load %struct.ethhdr*, %struct.ethhdr** %27, align 8
  %117 = bitcast %struct.ethhdr* %116 to i8*
  %118 = load i8, i8* %32, align 1
  %119 = zext i8 %118 to i32
  %120 = sext i32 %119 to i64
  %121 = getelementptr i8, i8* %117, i64 %120
  %122 = load i8*, i8** %28, align 8
  %123 = icmp ugt i8* %121, %122
  br i1 %123, label %124, label %125

124:                                              ; preds = %104
  store i8 0, i8* %26, align 1
  br label %157

125:                                              ; preds = %104
  %126 = load %struct._vlan_hdr*, %struct._vlan_hdr** %30, align 8
  %127 = getelementptr inbounds %struct._vlan_hdr, %struct._vlan_hdr* %126, i32 0, i32 1
  %128 = load i16, i16* %127, align 2
  store i16 %128, i16* %31, align 2
  br label %129

129:                                              ; preds = %125, %100
  %130 = load i16, i16* %31, align 2
  %131 = call i1 @llvm.is.constant.i16(i16 %130) #6
  br i1 %131, label %132, label %144

132:                                              ; preds = %129
  %133 = load i16, i16* %31, align 2
  %134 = zext i16 %133 to i32
  %135 = shl i32 %134, 8
  %136 = ashr i32 %135, 8
  %137 = shl i32 %136, 8
  %138 = load i16, i16* %31, align 2
  %139 = zext i16 %138 to i32
  %140 = ashr i32 %139, 8
  %141 = or i32 %137, %140
  %142 = trunc i32 %141 to i16
  %143 = zext i16 %142 to i32
  br label %148

144:                                              ; preds = %129
  %145 = load i16, i16* %31, align 2
  %146 = call i16 @llvm.bswap.i16(i16 %145) #6
  %147 = zext i16 %146 to i32
  br label %148

148:                                              ; preds = %144, %132
  %149 = phi i32 [ %143, %132 ], [ %147, %144 ]
  %150 = trunc i32 %149 to i16
  %151 = load %struct.parse_pkt*, %struct.parse_pkt** %29, align 8
  %152 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %151, i32 0, i32 0
  store i16 %150, i16* %152, align 2
  %153 = load i8, i8* %32, align 1
  %154 = zext i8 %153 to i16
  %155 = load %struct.parse_pkt*, %struct.parse_pkt** %29, align 8
  %156 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %155, i32 0, i32 1
  store i16 %154, i16* %156, align 2
  store i8 1, i8* %26, align 1
  br label %157

157:                                              ; preds = %59, %91, %124, %148
  %158 = load i8, i8* %26, align 1
  %159 = icmp ne i8 %158, 0
  br i1 %159, label %161, label %160

160:                                              ; preds = %157
  store i32 2, i32* %33, align 4
  br label %423

161:                                              ; preds = %157
  %162 = load i8*, i8** %36, align 8
  %163 = load i8*, i8** %35, align 8
  store i8* %162, i8** %14, align 8
  store i8* %163, i8** %15, align 8
  store %struct.parse_pkt* %37, %struct.parse_pkt** %16, align 8
  store %struct.vrrphdr* null, %struct.vrrphdr** %18, align 8
  %164 = bitcast %struct.flow_key* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %164, i8* align 8 bitcast (%struct.flow_key* @__const.layer3_filter.key to i8*), i64 24, i1 false) #6
  store i32 0, i32* %21, align 4
  store i32 0, i32* %22, align 4
  %165 = load %struct.parse_pkt*, %struct.parse_pkt** %16, align 8
  %166 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %165, i32 0, i32 0
  %167 = load i16, i16* %166, align 2
  %168 = zext i16 %167 to i32
  %169 = icmp eq i32 %168, 2048
  br i1 %169, label %170, label %330

170:                                              ; preds = %161
  %171 = load i8*, i8** %14, align 8
  %172 = load %struct.parse_pkt*, %struct.parse_pkt** %16, align 8
  %173 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %172, i32 0, i32 1
  %174 = load i16, i16* %173, align 2
  %175 = zext i16 %174 to i32
  %176 = sext i32 %175 to i64
  %177 = getelementptr i8, i8* %171, i64 %176
  %178 = bitcast i8* %177 to %struct.iphdr*
  store %struct.iphdr* %178, %struct.iphdr** %17, align 8
  %179 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %180 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %179, i64 1
  %181 = load i8*, i8** %15, align 8
  %182 = bitcast i8* %181 to %struct.iphdr*
  %183 = icmp ugt %struct.iphdr* %180, %182
  br i1 %183, label %184, label %185

184:                                              ; preds = %170
  store i32 2, i32* %13, align 4
  br label %415

185:                                              ; preds = %170
  %186 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %187 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %186, i32 0, i32 2
  %188 = load i16, i16* %187, align 2
  %189 = call i1 @llvm.is.constant.i16(i16 %188) #6
  br i1 %189, label %190, label %206

190:                                              ; preds = %185
  %191 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %192 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %191, i32 0, i32 2
  %193 = load i16, i16* %192, align 2
  %194 = zext i16 %193 to i32
  %195 = shl i32 %194, 8
  %196 = ashr i32 %195, 8
  %197 = shl i32 %196, 8
  %198 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %199 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %198, i32 0, i32 2
  %200 = load i16, i16* %199, align 2
  %201 = zext i16 %200 to i32
  %202 = ashr i32 %201, 8
  %203 = or i32 %197, %202
  %204 = trunc i32 %203 to i16
  %205 = zext i16 %204 to i32
  br label %212

206:                                              ; preds = %185
  %207 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %208 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %207, i32 0, i32 2
  %209 = load i16, i16* %208, align 2
  %210 = call i16 @llvm.bswap.i16(i16 %209) #6
  %211 = zext i16 %210 to i32
  br label %212

212:                                              ; preds = %206, %190
  %213 = phi i32 [ %205, %190 ], [ %211, %206 ]
  store i32 %213, i32* %22, align 4
  %214 = load %struct.parse_pkt*, %struct.parse_pkt** %16, align 8
  %215 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %214, i32 0, i32 1
  %216 = load i16, i16* %215, align 2
  %217 = zext i16 %216 to i32
  %218 = load i32, i32* %21, align 4
  %219 = add nsw i32 %218, %217
  store i32 %219, i32* %21, align 4
  %220 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %20, i32 0, i32 1
  store i32 2048, i32* %220, align 8
  %221 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %20, i32 0, i32 0
  %222 = bitcast %union.anon* %221 to [4 x i32]*
  %223 = getelementptr inbounds [4 x i32], [4 x i32]* %222, i64 0, i64 3
  store i32 0, i32* %223, align 4
  %224 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %20, i32 0, i32 0
  %225 = bitcast %union.anon* %224 to [4 x i32]*
  %226 = getelementptr inbounds [4 x i32], [4 x i32]* %225, i64 0, i64 2
  store i32 0, i32* %226, align 8
  %227 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %20, i32 0, i32 0
  %228 = bitcast %union.anon* %227 to [4 x i32]*
  %229 = getelementptr inbounds [4 x i32], [4 x i32]* %228, i64 0, i64 1
  store i32 0, i32* %229, align 4
  %230 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %231 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %230, i32 0, i32 8
  %232 = bitcast %union.anon.1* %231 to %struct.anon.2*
  %233 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %232, i32 0, i32 1
  %234 = load i32, i32* %233, align 4
  %235 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %20, i32 0, i32 0
  %236 = bitcast %union.anon* %235 to i32*
  store i32 %234, i32* %236, align 8
  %237 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %238 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %237, i32 0, i32 6
  %239 = load i8, i8* %238, align 1
  %240 = zext i8 %239 to i32
  %241 = icmp eq i32 %240, 112
  br i1 %241, label %242, label %256

242:                                              ; preds = %212
  %243 = load i8*, i8** %14, align 8
  %244 = load i32, i32* %21, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr i8, i8* %243, i64 %245
  %247 = getelementptr i8, i8* %246, i64 20
  %248 = bitcast i8* %247 to %struct.vrrphdr*
  store %struct.vrrphdr* %248, %struct.vrrphdr** %18, align 8
  %249 = load %struct.vrrphdr*, %struct.vrrphdr** %18, align 8
  %250 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %249, i64 1
  %251 = load i8*, i8** %15, align 8
  %252 = bitcast i8* %251 to %struct.vrrphdr*
  %253 = icmp ugt %struct.vrrphdr* %250, %252
  br i1 %253, label %254, label %255

254:                                              ; preds = %242
  store i32 1, i32* %13, align 4
  br label %415

255:                                              ; preds = %242
  br label %301

256:                                              ; preds = %212
  %257 = load %struct.iphdr*, %struct.iphdr** %17, align 8
  %258 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %257, i32 0, i32 6
  %259 = load i8, i8* %258, align 1
  %260 = zext i8 %259 to i32
  %261 = icmp eq i32 %260, 51
  br i1 %261, label %262, label %300

262:                                              ; preds = %256
  %263 = load i8*, i8** %14, align 8
  %264 = load i32, i32* %21, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr i8, i8* %263, i64 %265
  %267 = getelementptr i8, i8* %266, i64 20
  %268 = bitcast i8* %267 to %struct.ip_auth_hdr*
  store %struct.ip_auth_hdr* %268, %struct.ip_auth_hdr** %19, align 8
  %269 = load %struct.ip_auth_hdr*, %struct.ip_auth_hdr** %19, align 8
  %270 = getelementptr inbounds %struct.ip_auth_hdr, %struct.ip_auth_hdr* %269, i64 1
  %271 = load i8*, i8** %15, align 8
  %272 = bitcast i8* %271 to %struct.ip_auth_hdr*
  %273 = icmp ugt %struct.ip_auth_hdr* %270, %272
  br i1 %273, label %274, label %275

274:                                              ; preds = %262
  store i32 2, i32* %13, align 4
  br label %415

275:                                              ; preds = %262
  %276 = load i32, i32* %21, align 4
  %277 = sext i32 %276 to i64
  %278 = add i64 %277, 20
  %279 = trunc i64 %278 to i32
  store i32 %279, i32* %21, align 4
  %280 = load %struct.ip_auth_hdr*, %struct.ip_auth_hdr** %19, align 8
  %281 = getelementptr inbounds %struct.ip_auth_hdr, %struct.ip_auth_hdr* %280, i32 0, i32 0
  %282 = load i8, i8* %281, align 4
  %283 = zext i8 %282 to i32
  %284 = icmp eq i32 %283, 112
  br i1 %284, label %285, label %299

285:                                              ; preds = %275
  %286 = load i8*, i8** %14, align 8
  %287 = load i32, i32* %21, align 4
  %288 = sext i32 %287 to i64
  %289 = getelementptr i8, i8* %286, i64 %288
  %290 = getelementptr i8, i8* %289, i64 12
  %291 = bitcast i8* %290 to %struct.vrrphdr*
  store %struct.vrrphdr* %291, %struct.vrrphdr** %18, align 8
  %292 = load %struct.vrrphdr*, %struct.vrrphdr** %18, align 8
  %293 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %292, i64 1
  %294 = load i8*, i8** %15, align 8
  %295 = bitcast i8* %294 to %struct.vrrphdr*
  %296 = icmp ugt %struct.vrrphdr* %293, %295
  br i1 %296, label %297, label %298

297:                                              ; preds = %285
  store i32 1, i32* %13, align 4
  br label %415

298:                                              ; preds = %285
  br label %299

299:                                              ; preds = %298, %275
  br label %300

300:                                              ; preds = %299, %256
  br label %301

301:                                              ; preds = %300, %255
  %302 = bitcast %struct.flow_key* %20 to i8*
  store i64* @l3_filter_id, i64** %11, align 8
  store i8* %302, i8** %12, align 8
  %303 = load i64*, i64** %11, align 8
  %304 = load i64, i64* %303, align 8
  %305 = icmp eq i64 %304, 17179869184
  br i1 %305, label %306, label %309

306:                                              ; preds = %301
  %307 = load i8*, i8** %12, align 8
  %308 = call i8* @elem_lookup(%struct.bpftime_hash_map_t* noundef @__l3_filter, i8* noundef %307) #6
  store i8* %308, i8** %10, align 8
  br label %325

309:                                              ; preds = %301
  %310 = load i64*, i64** %11, align 8
  %311 = load i64, i64* %310, align 8
  %312 = icmp eq i64 %311, 21474836480
  br i1 %312, label %313, label %320

313:                                              ; preds = %309
  %314 = load i8*, i8** %12, align 8
  %315 = bitcast i8* %314 to i32*
  %316 = load i32, i32* %315, align 4
  %317 = zext i32 %316 to i64
  %318 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %317
  %319 = bitcast %struct.vrrp_filter* %318 to i8*
  store i8* %319, i8** %10, align 8
  br label %325

320:                                              ; preds = %309
  %321 = load i64*, i64** %11, align 8
  %322 = load i64, i64* %321, align 8
  %323 = load i8*, i8** %12, align 8
  %324 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %322, i8* noundef %323) #6
  store i8* %324, i8** %10, align 8
  br label %325

325:                                              ; preds = %306, %313, %320
  %326 = load i8*, i8** %10, align 8
  %327 = bitcast i8* %326 to i64*
  store i64* %327, i64** %23, align 8
  %328 = load i64*, i64** %23, align 8
  %329 = icmp ne i64* %328, null
  br i1 %329, label %342, label %346

330:                                              ; preds = %161
  %331 = load %struct.parse_pkt*, %struct.parse_pkt** %16, align 8
  %332 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %331, i32 0, i32 0
  %333 = load i16, i16* %332, align 2
  %334 = zext i16 %333 to i32
  %335 = icmp eq i32 %334, 34525
  br i1 %335, label %336, label %341

336:                                              ; preds = %330
  %337 = bitcast [24 x i8]* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %337, i8* align 16 getelementptr inbounds ([24 x i8], [24 x i8]* @__const.layer3_filter.____fmt, i32 0, i32 0), i64 24, i1 false) #6
  %338 = getelementptr inbounds [24 x i8], [24 x i8]* %24, i64 0, i64 0
  %339 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %338, i64 noundef 24) #6
  store i32 %339, i32* %25, align 4
  %340 = load i32, i32* %25, align 4
  store i32 1, i32* %13, align 4
  br label %415

341:                                              ; preds = %330
  store i32 2, i32* %13, align 4
  br label %415

342:                                              ; preds = %325
  %343 = load i64*, i64** %23, align 8
  %344 = load i64, i64* %343, align 8
  %345 = add i64 %344, 1
  store i64 %345, i64* %343, align 8
  store i32 1, i32* %13, align 4
  br label %415

346:                                              ; preds = %325
  %347 = load %struct.vrrphdr*, %struct.vrrphdr** %18, align 8
  %348 = icmp ne %struct.vrrphdr* %347, null
  br i1 %348, label %349, label %414

349:                                              ; preds = %346
  %350 = load %struct.vrrphdr*, %struct.vrrphdr** %18, align 8
  %351 = load i32, i32* %22, align 4
  store %struct.vrrphdr* %350, %struct.vrrphdr** %6, align 8
  store i32 %351, i32* %7, align 4
  %352 = load %struct.vrrphdr*, %struct.vrrphdr** %6, align 8
  %353 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %352, i32 0, i32 1
  %354 = load i8, i8* %353, align 1
  %355 = zext i8 %354 to i32
  store i32 %355, i32* %9, align 4
  %356 = bitcast i32* %9 to i8*
  store i64* @vrrp_vrid_filter_id, i64** %3, align 8
  store i8* %356, i8** %4, align 8
  %357 = load i64*, i64** %3, align 8
  %358 = load i64, i64* %357, align 8
  %359 = icmp eq i64 %358, 17179869184
  br i1 %359, label %360, label %363

360:                                              ; preds = %349
  %361 = load i8*, i8** %4, align 8
  %362 = call i8* @elem_lookup(%struct.bpftime_hash_map_t* noundef @__l3_filter, i8* noundef %361) #6
  store i8* %362, i8** %2, align 8
  br label %379

363:                                              ; preds = %349
  %364 = load i64*, i64** %3, align 8
  %365 = load i64, i64* %364, align 8
  %366 = icmp eq i64 %365, 21474836480
  br i1 %366, label %367, label %374

367:                                              ; preds = %363
  %368 = load i8*, i8** %4, align 8
  %369 = bitcast i8* %368 to i32*
  %370 = load i32, i32* %369, align 4
  %371 = zext i32 %370 to i64
  %372 = getelementptr inbounds [256 x %struct.vrrp_filter], [256 x %struct.vrrp_filter]* @__vrrp_vrid_filter, i64 0, i64 %371
  %373 = bitcast %struct.vrrp_filter* %372 to i8*
  store i8* %373, i8** %2, align 8
  br label %379

374:                                              ; preds = %363
  %375 = load i64*, i64** %3, align 8
  %376 = load i64, i64* %375, align 8
  %377 = load i8*, i8** %4, align 8
  %378 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %376, i8* noundef %377) #6
  store i8* %378, i8** %2, align 8
  br label %379

379:                                              ; preds = %374, %367, %360
  %380 = load i8*, i8** %2, align 8
  %381 = bitcast i8* %380 to %struct.vrrp_filter*
  store %struct.vrrp_filter* %381, %struct.vrrp_filter** %8, align 8
  %382 = load %struct.vrrp_filter*, %struct.vrrp_filter** %8, align 8
  %383 = icmp ne %struct.vrrp_filter* %382, null
  br i1 %383, label %385, label %384

384:                                              ; preds = %379
  store i32 2, i32* %5, align 4
  br label %412

385:                                              ; preds = %379
  %386 = load %struct.vrrp_filter*, %struct.vrrp_filter** %8, align 8
  %387 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %386, i32 0, i32 2
  %388 = load i64, i64* %387, align 8
  %389 = add i64 %388, 1
  store i64 %389, i64* %387, align 8
  %390 = load i32, i32* %7, align 4
  %391 = sext i32 %390 to i64
  %392 = load %struct.vrrp_filter*, %struct.vrrp_filter** %8, align 8
  %393 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %392, i32 0, i32 4
  %394 = load i64, i64* %393, align 8
  %395 = add i64 %394, %391
  store i64 %395, i64* %393, align 8
  %396 = load %struct.vrrp_filter*, %struct.vrrp_filter** %8, align 8
  %397 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %396, i32 0, i32 0
  %398 = load i32, i32* %397, align 8
  %399 = icmp ne i32 %398, 0
  br i1 %399, label %400, label %401

400:                                              ; preds = %385
  store i32 2, i32* %5, align 4
  br label %412

401:                                              ; preds = %385
  %402 = load %struct.vrrp_filter*, %struct.vrrp_filter** %8, align 8
  %403 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %402, i32 0, i32 1
  %404 = load i64, i64* %403, align 8
  %405 = add i64 %404, 1
  store i64 %405, i64* %403, align 8
  %406 = load i32, i32* %7, align 4
  %407 = sext i32 %406 to i64
  %408 = load %struct.vrrp_filter*, %struct.vrrp_filter** %8, align 8
  %409 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %408, i32 0, i32 3
  %410 = load i64, i64* %409, align 8
  %411 = add i64 %410, %407
  store i64 %411, i64* %409, align 8
  store i32 1, i32* %5, align 4
  br label %412

412:                                              ; preds = %384, %400, %401
  %413 = load i32, i32* %5, align 4
  store i32 %413, i32* %13, align 4
  br label %415

414:                                              ; preds = %346
  store i32 2, i32* %13, align 4
  br label %415

415:                                              ; preds = %184, %254, %274, %297, %336, %341, %342, %412, %414
  %416 = load i32, i32* %13, align 4
  store i32 %416, i32* %38, align 4
  %417 = load i32, i32* %38, align 4
  %418 = icmp eq i32 %417, 2
  br i1 %418, label %419, label %421

419:                                              ; preds = %415
  %420 = load i8*, i8** %36, align 8
  call void @swap_src_dst_mac(i8* noundef %420)
  store i32 3, i32* %33, align 4
  br label %423

421:                                              ; preds = %415
  %422 = load i32, i32* %38, align 4
  store i32 %422, i32* %33, align 4
  br label %423

423:                                              ; preds = %421, %419, %160
  %424 = load i32, i32* %33, align 4
  ret i32 %424
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @swap_src_dst_mac(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca [3 x i16], align 2
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = bitcast i8* %5 to i16*
  store i16* %6, i16** %3, align 8
  %7 = load i16*, i16** %3, align 8
  %8 = getelementptr inbounds i16, i16* %7, i64 0
  %9 = load i16, i16* %8, align 2
  %10 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 0
  store i16 %9, i16* %10, align 2
  %11 = load i16*, i16** %3, align 8
  %12 = getelementptr inbounds i16, i16* %11, i64 1
  %13 = load i16, i16* %12, align 2
  %14 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 1
  store i16 %13, i16* %14, align 2
  %15 = load i16*, i16** %3, align 8
  %16 = getelementptr inbounds i16, i16* %15, i64 2
  %17 = load i16, i16* %16, align 2
  %18 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 2
  store i16 %17, i16* %18, align 2
  %19 = load i16*, i16** %3, align 8
  %20 = getelementptr inbounds i16, i16* %19, i64 3
  %21 = load i16, i16* %20, align 2
  %22 = load i16*, i16** %3, align 8
  %23 = getelementptr inbounds i16, i16* %22, i64 0
  store i16 %21, i16* %23, align 2
  %24 = load i16*, i16** %3, align 8
  %25 = getelementptr inbounds i16, i16* %24, i64 4
  %26 = load i16, i16* %25, align 2
  %27 = load i16*, i16** %3, align 8
  %28 = getelementptr inbounds i16, i16* %27, i64 1
  store i16 %26, i16* %28, align 2
  %29 = load i16*, i16** %3, align 8
  %30 = getelementptr inbounds i16, i16* %29, i64 5
  %31 = load i16, i16* %30, align 2
  %32 = load i16*, i16** %3, align 8
  %33 = getelementptr inbounds i16, i16* %32, i64 2
  store i16 %31, i16* %33, align 2
  %34 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 0
  %35 = load i16, i16* %34, align 2
  %36 = load i16*, i16** %3, align 8
  %37 = getelementptr inbounds i16, i16* %36, i64 3
  store i16 %35, i16* %37, align 2
  %38 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 1
  %39 = load i16, i16* %38, align 2
  %40 = load i16*, i16** %3, align 8
  %41 = getelementptr inbounds i16, i16* %40, i64 4
  store i16 %39, i16* %41, align 2
  %42 = getelementptr inbounds [3 x i16], [3 x i16]* %4, i64 0, i64 2
  %43 = load i16, i16* %42, align 2
  %44 = load i16*, i16** %3, align 8
  %45 = getelementptr inbounds i16, i16* %44, i64 5
  store i16 %43, i16* %45, align 2
  ret void
}

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i16(i16) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare i32 @_bpf_helper_ext_0006(...) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @elem_lookup(%struct.bpftime_hash_map_t* noundef %0, i8* noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.bpftime_hash_map_t*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %4, align 8
  store i8* %1, i8** %5, align 8
  %11 = load i8*, i8** %5, align 8
  %12 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %13 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = call i32 @hash_func(i8* noundef %11, i32 noundef %14)
  %16 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %17 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %16, i32 0, i32 0
  %18 = load i32, i32* %17, align 8
  %19 = urem i32 %15, %18
  store i32 %19, i32* %6, align 4
  %20 = load i32, i32* %6, align 4
  store i32 %20, i32* %7, align 4
  br label %21

21:                                               ; preds = %70, %2
  %22 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %23 = load i32, i32* %6, align 4
  %24 = call i32 @is_empty(%struct.bpftime_hash_map_t* noundef %22, i32 noundef %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %21
  store i8* null, i8** %3, align 8
  br label %75

27:                                               ; preds = %21
  %28 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %29 = load i32, i32* %6, align 4
  %30 = call i8* @get_key(%struct.bpftime_hash_map_t* noundef %28, i32 noundef %29)
  store i8* %30, i8** %8, align 8
  store i32 1, i32* %9, align 4
  store i32 0, i32* %10, align 4
  br label %31

31:                                               ; preds = %53, %27
  %32 = load i32, i32* %10, align 4
  %33 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %34 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %33, i32 0, i32 1
  %35 = load i32, i32* %34, align 4
  %36 = icmp ult i32 %32, %35
  br i1 %36, label %37, label %56

37:                                               ; preds = %31
  %38 = load i8*, i8** %8, align 8
  %39 = load i32, i32* %10, align 4
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds i8, i8* %38, i64 %40
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = load i8*, i8** %5, align 8
  %45 = load i32, i32* %10, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %44, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp ne i32 %43, %49
  br i1 %50, label %51, label %52

51:                                               ; preds = %37
  store i32 0, i32* %9, align 4
  br label %56

52:                                               ; preds = %37
  br label %53

53:                                               ; preds = %52
  %54 = load i32, i32* %10, align 4
  %55 = add i32 %54, 1
  store i32 %55, i32* %10, align 4
  br label %31, !llvm.loop !6

56:                                               ; preds = %51, %31
  %57 = load i32, i32* %9, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %63

59:                                               ; preds = %56
  %60 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %61 = load i32, i32* %6, align 4
  %62 = call i8* @get_value(%struct.bpftime_hash_map_t* noundef %60, i32 noundef %61)
  store i8* %62, i8** %3, align 8
  br label %75

63:                                               ; preds = %56
  %64 = load i32, i32* %6, align 4
  %65 = add i32 %64, 1
  %66 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %4, align 8
  %67 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %66, i32 0, i32 0
  %68 = load i32, i32* %67, align 8
  %69 = urem i32 %65, %68
  store i32 %69, i32* %6, align 4
  br label %70

70:                                               ; preds = %63
  %71 = load i32, i32* %6, align 4
  %72 = load i32, i32* %7, align 4
  %73 = icmp ne i32 %71, %72
  br i1 %73, label %21, label %74, !llvm.loop !8

74:                                               ; preds = %70
  store i8* null, i8** %3, align 8
  br label %75

75:                                               ; preds = %74, %59, %26
  %76 = load i8*, i8** %3, align 8
  ret i8* %76
}

declare i8* @_bpf_helper_ext_0001(...) #5

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @hash_func(i8* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %7

7:                                                ; preds = %21, %2
  %8 = load i32, i32* %6, align 4
  %9 = load i32, i32* %4, align 4
  %10 = icmp ult i32 %8, %9
  br i1 %10, label %11, label %24

11:                                               ; preds = %7
  %12 = load i32, i32* %5, align 4
  %13 = mul i32 %12, 31
  %14 = load i8*, i8** %3, align 8
  %15 = load i32, i32* %6, align 4
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %14, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = add i32 %13, %19
  store i32 %20, i32* %5, align 4
  br label %21

21:                                               ; preds = %11
  %22 = load i32, i32* %6, align 4
  %23 = add i32 %22, 1
  store i32 %23, i32* %6, align 4
  br label %7, !llvm.loop !9

24:                                               ; preds = %7
  %25 = load i32, i32* %5, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @is_empty(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %6 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %5, i32 0, i32 3
  %7 = load i8*, i8** %6, align 8
  %8 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %8, i32 noundef %9)
  %11 = zext i32 %10 to i64
  %12 = getelementptr inbounds i8, i8* %7, i64 %11
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 4
  %15 = icmp eq i32 %14, 0
  %16 = zext i1 %15 to i32
  ret i32 %16
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @get_key(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %6 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %5, i32 0, i32 3
  %7 = load i8*, i8** %6, align 8
  %8 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %8, i32 noundef %9)
  %11 = add i32 %10, 4
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i8, i8* %7, i64 %12
  ret i8* %13
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @get_value(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %6 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %5, i32 0, i32 3
  %7 = load i8*, i8** %6, align 8
  %8 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %9 = load i32, i32* %4, align 4
  %10 = call i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %8, i32 noundef %9)
  %11 = add i32 %10, 4
  %12 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %13 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %12, i32 0, i32 1
  %14 = load i32, i32* %13, align 4
  %15 = add i32 %11, %14
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %7, i64 %16
  ret i8* %17
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @get_elem_offset(%struct.bpftime_hash_map_t* noundef %0, i32 noundef %1) #0 {
  %3 = alloca %struct.bpftime_hash_map_t*, align 8
  %4 = alloca i32, align 4
  store %struct.bpftime_hash_map_t* %0, %struct.bpftime_hash_map_t** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %7 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %6, i32 0, i32 1
  %8 = load i32, i32* %7, align 4
  %9 = add i32 4, %8
  %10 = load %struct.bpftime_hash_map_t*, %struct.bpftime_hash_map_t** %3, align 8
  %11 = getelementptr inbounds %struct.bpftime_hash_map_t, %struct.bpftime_hash_map_t* %10, i32 0, i32 2
  %12 = load i32, i32* %11, align 8
  %13 = add i32 %9, %12
  %14 = mul i32 %5, %13
  ret i32 %14
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }
attributes #2 = { convergent nofree nosync nounwind readnone willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}

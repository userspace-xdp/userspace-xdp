; ModuleID = 'xdp_firewall.bpf.c'
source_filename = "xdp_firewall.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [5 x i32]*, %struct.flow_key*, i64*, [32768 x i32]*, [1 x i32]* }
%struct.flow_key = type { %union.anon, i32, [4 x i8] }
%union.anon = type { [4 x i32] }
%struct.anon.0 = type { [6 x i32]*, i32*, %struct.vrrp_filter*, [256 x i32]* }
%struct.vrrp_filter = type { i32, i64, i64, i64, i64 }
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

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@l3_filter = dso_local global %struct.anon zeroinitializer, section ".maps", align 8
@vrrp_vrid_filter = dso_local global %struct.anon.0 zeroinitializer, section ".maps", align 8
@__const.layer3_filter.key = private unnamed_addr constant %struct.flow_key { %union.anon zeroinitializer, i32 0, [4 x i8] undef }, align 8
@layer3_filter.____fmt = internal constant [24 x i8] c"only ipv4 is supported\0A\00", align 1
@bpf_trace_printk = internal global i64 (i8*, i32, ...)* inttoptr (i64 6 to i64 (i8*, i32, ...)*), align 8
@bpf_map_lookup_elem = internal global i8* (i8*, i8*)* inttoptr (i64 1 to i8* (i8*, i8*)*), align 8
@llvm.compiler.used = appending global [4 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @l3_filter to i8*), i8* bitcast (%struct.anon.0* @vrrp_vrid_filter to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca %struct.vrrphdr*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.vrrp_filter*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %struct.parse_pkt*, align 8
  %11 = alloca %struct.iphdr*, align 8
  %12 = alloca %struct.vrrphdr*, align 8
  %13 = alloca %struct.ip_auth_hdr*, align 8
  %14 = alloca %struct.flow_key, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i64*, align 8
  %18 = alloca i64, align 8
  %19 = alloca i8, align 1
  %20 = alloca %struct.ethhdr*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca %struct.parse_pkt*, align 8
  %23 = alloca %struct._vlan_hdr*, align 8
  %24 = alloca i16, align 2
  %25 = alloca i8, align 1
  %26 = alloca i32, align 4
  %27 = alloca %struct.xdp_md*, align 8
  %28 = alloca i8*, align 8
  %29 = alloca i8*, align 8
  %30 = alloca %struct.parse_pkt, align 2
  %31 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %27, align 8
  %32 = load %struct.xdp_md*, %struct.xdp_md** %27, align 8
  %33 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %32, i32 0, i32 1
  %34 = load i64, i64* %33, align 8
  %35 = inttoptr i64 %34 to i8*
  store i8* %35, i8** %28, align 8
  %36 = load %struct.xdp_md*, %struct.xdp_md** %27, align 8
  %37 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %36, i32 0, i32 0
  %38 = load i64, i64* %37, align 8
  %39 = inttoptr i64 %38 to i8*
  store i8* %39, i8** %29, align 8
  %40 = bitcast %struct.parse_pkt* %30 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %40, i8 0, i64 4, i1 false)
  %41 = load i8*, i8** %29, align 8
  %42 = bitcast i8* %41 to %struct.ethhdr*
  %43 = load i8*, i8** %28, align 8
  store %struct.ethhdr* %42, %struct.ethhdr** %20, align 8
  store i8* %43, i8** %21, align 8
  store %struct.parse_pkt* %30, %struct.parse_pkt** %22, align 8
  store i8 14, i8* %25, align 1
  %44 = load %struct.ethhdr*, %struct.ethhdr** %20, align 8
  %45 = bitcast %struct.ethhdr* %44 to i8*
  %46 = load i8, i8* %25, align 1
  %47 = zext i8 %46 to i32
  %48 = sext i32 %47 to i64
  %49 = getelementptr i8, i8* %45, i64 %48
  %50 = load i8*, i8** %21, align 8
  %51 = icmp ugt i8* %49, %50
  br i1 %51, label %52, label %53

52:                                               ; preds = %1
  store i8 0, i8* %19, align 1
  br label %150

53:                                               ; preds = %1
  %54 = load %struct.ethhdr*, %struct.ethhdr** %20, align 8
  %55 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %54, i32 0, i32 2
  %56 = load i16, i16* %55, align 2
  store i16 %56, i16* %24, align 2
  %57 = load i16, i16* %24, align 2
  %58 = zext i16 %57 to i32
  %59 = icmp eq i32 %58, 129
  br i1 %59, label %64, label %60

60:                                               ; preds = %53
  %61 = load i16, i16* %24, align 2
  %62 = zext i16 %61 to i32
  %63 = icmp eq i32 %62, 43144
  br i1 %63, label %64, label %89

64:                                               ; preds = %60, %53
  %65 = load %struct.ethhdr*, %struct.ethhdr** %20, align 8
  %66 = bitcast %struct.ethhdr* %65 to i8*
  %67 = load i8, i8* %25, align 1
  %68 = zext i8 %67 to i32
  %69 = sext i32 %68 to i64
  %70 = getelementptr i8, i8* %66, i64 %69
  %71 = bitcast i8* %70 to %struct._vlan_hdr*
  store %struct._vlan_hdr* %71, %struct._vlan_hdr** %23, align 8
  %72 = load i8, i8* %25, align 1
  %73 = zext i8 %72 to i64
  %74 = add i64 %73, 4
  %75 = trunc i64 %74 to i8
  store i8 %75, i8* %25, align 1
  %76 = load %struct.ethhdr*, %struct.ethhdr** %20, align 8
  %77 = bitcast %struct.ethhdr* %76 to i8*
  %78 = load i8, i8* %25, align 1
  %79 = zext i8 %78 to i32
  %80 = sext i32 %79 to i64
  %81 = getelementptr i8, i8* %77, i64 %80
  %82 = load i8*, i8** %21, align 8
  %83 = icmp ugt i8* %81, %82
  br i1 %83, label %84, label %85

84:                                               ; preds = %64
  store i8 0, i8* %19, align 1
  br label %150

85:                                               ; preds = %64
  %86 = load %struct._vlan_hdr*, %struct._vlan_hdr** %23, align 8
  %87 = getelementptr inbounds %struct._vlan_hdr, %struct._vlan_hdr* %86, i32 0, i32 1
  %88 = load i16, i16* %87, align 2
  store i16 %88, i16* %24, align 2
  br label %89

89:                                               ; preds = %85, %60
  %90 = load i16, i16* %24, align 2
  %91 = zext i16 %90 to i32
  %92 = icmp eq i32 %91, 129
  br i1 %92, label %97, label %93

93:                                               ; preds = %89
  %94 = load i16, i16* %24, align 2
  %95 = zext i16 %94 to i32
  %96 = icmp eq i32 %95, 43144
  br i1 %96, label %97, label %122

97:                                               ; preds = %93, %89
  %98 = load %struct.ethhdr*, %struct.ethhdr** %20, align 8
  %99 = bitcast %struct.ethhdr* %98 to i8*
  %100 = load i8, i8* %25, align 1
  %101 = zext i8 %100 to i32
  %102 = sext i32 %101 to i64
  %103 = getelementptr i8, i8* %99, i64 %102
  %104 = bitcast i8* %103 to %struct._vlan_hdr*
  store %struct._vlan_hdr* %104, %struct._vlan_hdr** %23, align 8
  %105 = load i8, i8* %25, align 1
  %106 = zext i8 %105 to i64
  %107 = add i64 %106, 4
  %108 = trunc i64 %107 to i8
  store i8 %108, i8* %25, align 1
  %109 = load %struct.ethhdr*, %struct.ethhdr** %20, align 8
  %110 = bitcast %struct.ethhdr* %109 to i8*
  %111 = load i8, i8* %25, align 1
  %112 = zext i8 %111 to i32
  %113 = sext i32 %112 to i64
  %114 = getelementptr i8, i8* %110, i64 %113
  %115 = load i8*, i8** %21, align 8
  %116 = icmp ugt i8* %114, %115
  br i1 %116, label %117, label %118

117:                                              ; preds = %97
  store i8 0, i8* %19, align 1
  br label %150

118:                                              ; preds = %97
  %119 = load %struct._vlan_hdr*, %struct._vlan_hdr** %23, align 8
  %120 = getelementptr inbounds %struct._vlan_hdr, %struct._vlan_hdr* %119, i32 0, i32 1
  %121 = load i16, i16* %120, align 2
  store i16 %121, i16* %24, align 2
  br label %122

122:                                              ; preds = %118, %93
  %123 = load i16, i16* %24, align 2
  %124 = call i1 @llvm.is.constant.i16(i16 %123) #5
  br i1 %124, label %125, label %137

125:                                              ; preds = %122
  %126 = load i16, i16* %24, align 2
  %127 = zext i16 %126 to i32
  %128 = shl i32 %127, 8
  %129 = ashr i32 %128, 8
  %130 = shl i32 %129, 8
  %131 = load i16, i16* %24, align 2
  %132 = zext i16 %131 to i32
  %133 = ashr i32 %132, 8
  %134 = or i32 %130, %133
  %135 = trunc i32 %134 to i16
  %136 = zext i16 %135 to i32
  br label %141

137:                                              ; preds = %122
  %138 = load i16, i16* %24, align 2
  %139 = call i16 @llvm.bswap.i16(i16 %138) #5
  %140 = zext i16 %139 to i32
  br label %141

141:                                              ; preds = %137, %125
  %142 = phi i32 [ %136, %125 ], [ %140, %137 ]
  %143 = trunc i32 %142 to i16
  %144 = load %struct.parse_pkt*, %struct.parse_pkt** %22, align 8
  %145 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %144, i32 0, i32 0
  store i16 %143, i16* %145, align 2
  %146 = load i8, i8* %25, align 1
  %147 = zext i8 %146 to i16
  %148 = load %struct.parse_pkt*, %struct.parse_pkt** %22, align 8
  %149 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %148, i32 0, i32 1
  store i16 %147, i16* %149, align 2
  store i8 1, i8* %19, align 1
  br label %150

150:                                              ; preds = %52, %84, %117, %141
  %151 = load i8, i8* %19, align 1
  %152 = icmp ne i8 %151, 0
  br i1 %152, label %154, label %153

153:                                              ; preds = %150
  store i32 2, i32* %26, align 4
  br label %371

154:                                              ; preds = %150
  %155 = load i8*, i8** %29, align 8
  %156 = load i8*, i8** %28, align 8
  store i8* %155, i8** %8, align 8
  store i8* %156, i8** %9, align 8
  store %struct.parse_pkt* %30, %struct.parse_pkt** %10, align 8
  store %struct.vrrphdr* null, %struct.vrrphdr** %12, align 8
  %157 = bitcast %struct.flow_key* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %157, i8* align 8 bitcast (%struct.flow_key* @__const.layer3_filter.key to i8*), i64 24, i1 false) #5
  store i32 0, i32* %15, align 4
  store i32 0, i32* %16, align 4
  %158 = load %struct.parse_pkt*, %struct.parse_pkt** %10, align 8
  %159 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %158, i32 0, i32 0
  %160 = load i16, i16* %159, align 2
  %161 = zext i16 %160 to i32
  %162 = icmp eq i32 %161, 2048
  br i1 %162, label %163, label %301

163:                                              ; preds = %154
  %164 = load i8*, i8** %8, align 8
  %165 = load %struct.parse_pkt*, %struct.parse_pkt** %10, align 8
  %166 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %165, i32 0, i32 1
  %167 = load i16, i16* %166, align 2
  %168 = zext i16 %167 to i32
  %169 = sext i32 %168 to i64
  %170 = getelementptr i8, i8* %164, i64 %169
  %171 = bitcast i8* %170 to %struct.iphdr*
  store %struct.iphdr* %171, %struct.iphdr** %11, align 8
  %172 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %173 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %172, i64 1
  %174 = load i8*, i8** %9, align 8
  %175 = bitcast i8* %174 to %struct.iphdr*
  %176 = icmp ugt %struct.iphdr* %173, %175
  br i1 %176, label %177, label %178

177:                                              ; preds = %163
  store i32 2, i32* %7, align 4
  br label %363

178:                                              ; preds = %163
  %179 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %180 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %179, i32 0, i32 2
  %181 = load i16, i16* %180, align 2
  %182 = call i1 @llvm.is.constant.i16(i16 %181) #5
  br i1 %182, label %183, label %199

183:                                              ; preds = %178
  %184 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %185 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %184, i32 0, i32 2
  %186 = load i16, i16* %185, align 2
  %187 = zext i16 %186 to i32
  %188 = shl i32 %187, 8
  %189 = ashr i32 %188, 8
  %190 = shl i32 %189, 8
  %191 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %192 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %191, i32 0, i32 2
  %193 = load i16, i16* %192, align 2
  %194 = zext i16 %193 to i32
  %195 = ashr i32 %194, 8
  %196 = or i32 %190, %195
  %197 = trunc i32 %196 to i16
  %198 = zext i16 %197 to i32
  br label %205

199:                                              ; preds = %178
  %200 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %201 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %200, i32 0, i32 2
  %202 = load i16, i16* %201, align 2
  %203 = call i16 @llvm.bswap.i16(i16 %202) #5
  %204 = zext i16 %203 to i32
  br label %205

205:                                              ; preds = %199, %183
  %206 = phi i32 [ %198, %183 ], [ %204, %199 ]
  store i32 %206, i32* %16, align 4
  %207 = load %struct.parse_pkt*, %struct.parse_pkt** %10, align 8
  %208 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %207, i32 0, i32 1
  %209 = load i16, i16* %208, align 2
  %210 = zext i16 %209 to i32
  %211 = load i32, i32* %15, align 4
  %212 = add nsw i32 %211, %210
  store i32 %212, i32* %15, align 4
  %213 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %14, i32 0, i32 1
  store i32 2048, i32* %213, align 8
  %214 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %14, i32 0, i32 0
  %215 = bitcast %union.anon* %214 to [4 x i32]*
  %216 = getelementptr inbounds [4 x i32], [4 x i32]* %215, i64 0, i64 3
  store i32 0, i32* %216, align 4
  %217 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %14, i32 0, i32 0
  %218 = bitcast %union.anon* %217 to [4 x i32]*
  %219 = getelementptr inbounds [4 x i32], [4 x i32]* %218, i64 0, i64 2
  store i32 0, i32* %219, align 8
  %220 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %14, i32 0, i32 0
  %221 = bitcast %union.anon* %220 to [4 x i32]*
  %222 = getelementptr inbounds [4 x i32], [4 x i32]* %221, i64 0, i64 1
  store i32 0, i32* %222, align 4
  %223 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %224 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %223, i32 0, i32 8
  %225 = bitcast %union.anon.1* %224 to %struct.anon.2*
  %226 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %225, i32 0, i32 1
  %227 = load i32, i32* %226, align 4
  %228 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %14, i32 0, i32 0
  %229 = bitcast %union.anon* %228 to i32*
  store i32 %227, i32* %229, align 8
  %230 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %231 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %230, i32 0, i32 6
  %232 = load i8, i8* %231, align 1
  %233 = zext i8 %232 to i32
  %234 = icmp eq i32 %233, 112
  br i1 %234, label %235, label %249

235:                                              ; preds = %205
  %236 = load i8*, i8** %8, align 8
  %237 = load i32, i32* %15, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr i8, i8* %236, i64 %238
  %240 = getelementptr i8, i8* %239, i64 20
  %241 = bitcast i8* %240 to %struct.vrrphdr*
  store %struct.vrrphdr* %241, %struct.vrrphdr** %12, align 8
  %242 = load %struct.vrrphdr*, %struct.vrrphdr** %12, align 8
  %243 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %242, i64 1
  %244 = load i8*, i8** %9, align 8
  %245 = bitcast i8* %244 to %struct.vrrphdr*
  %246 = icmp ugt %struct.vrrphdr* %243, %245
  br i1 %246, label %247, label %248

247:                                              ; preds = %235
  store i32 1, i32* %7, align 4
  br label %363

248:                                              ; preds = %235
  br label %294

249:                                              ; preds = %205
  %250 = load %struct.iphdr*, %struct.iphdr** %11, align 8
  %251 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %250, i32 0, i32 6
  %252 = load i8, i8* %251, align 1
  %253 = zext i8 %252 to i32
  %254 = icmp eq i32 %253, 51
  br i1 %254, label %255, label %293

255:                                              ; preds = %249
  %256 = load i8*, i8** %8, align 8
  %257 = load i32, i32* %15, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr i8, i8* %256, i64 %258
  %260 = getelementptr i8, i8* %259, i64 20
  %261 = bitcast i8* %260 to %struct.ip_auth_hdr*
  store %struct.ip_auth_hdr* %261, %struct.ip_auth_hdr** %13, align 8
  %262 = load %struct.ip_auth_hdr*, %struct.ip_auth_hdr** %13, align 8
  %263 = getelementptr inbounds %struct.ip_auth_hdr, %struct.ip_auth_hdr* %262, i64 1
  %264 = load i8*, i8** %9, align 8
  %265 = bitcast i8* %264 to %struct.ip_auth_hdr*
  %266 = icmp ugt %struct.ip_auth_hdr* %263, %265
  br i1 %266, label %267, label %268

267:                                              ; preds = %255
  store i32 2, i32* %7, align 4
  br label %363

268:                                              ; preds = %255
  %269 = load i32, i32* %15, align 4
  %270 = sext i32 %269 to i64
  %271 = add i64 %270, 20
  %272 = trunc i64 %271 to i32
  store i32 %272, i32* %15, align 4
  %273 = load %struct.ip_auth_hdr*, %struct.ip_auth_hdr** %13, align 8
  %274 = getelementptr inbounds %struct.ip_auth_hdr, %struct.ip_auth_hdr* %273, i32 0, i32 0
  %275 = load i8, i8* %274, align 4
  %276 = zext i8 %275 to i32
  %277 = icmp eq i32 %276, 112
  br i1 %277, label %278, label %292

278:                                              ; preds = %268
  %279 = load i8*, i8** %8, align 8
  %280 = load i32, i32* %15, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr i8, i8* %279, i64 %281
  %283 = getelementptr i8, i8* %282, i64 12
  %284 = bitcast i8* %283 to %struct.vrrphdr*
  store %struct.vrrphdr* %284, %struct.vrrphdr** %12, align 8
  %285 = load %struct.vrrphdr*, %struct.vrrphdr** %12, align 8
  %286 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %285, i64 1
  %287 = load i8*, i8** %9, align 8
  %288 = bitcast i8* %287 to %struct.vrrphdr*
  %289 = icmp ugt %struct.vrrphdr* %286, %288
  br i1 %289, label %290, label %291

290:                                              ; preds = %278
  store i32 1, i32* %7, align 4
  br label %363

291:                                              ; preds = %278
  br label %292

292:                                              ; preds = %291, %268
  br label %293

293:                                              ; preds = %292, %249
  br label %294

294:                                              ; preds = %293, %248
  %295 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %296 = bitcast %struct.flow_key* %14 to i8*
  %297 = call i8* %295(i8* noundef bitcast (%struct.anon* @l3_filter to i8*), i8* noundef %296) #5
  %298 = bitcast i8* %297 to i64*
  store i64* %298, i64** %17, align 8
  %299 = load i64*, i64** %17, align 8
  %300 = icmp ne i64* %299, null
  br i1 %300, label %312, label %316

301:                                              ; preds = %154
  %302 = load %struct.parse_pkt*, %struct.parse_pkt** %10, align 8
  %303 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %302, i32 0, i32 0
  %304 = load i16, i16* %303, align 2
  %305 = zext i16 %304 to i32
  %306 = icmp eq i32 %305, 34525
  br i1 %306, label %307, label %311

307:                                              ; preds = %301
  %308 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %309 = call i64 (i8*, i32, ...) %308(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @layer3_filter.____fmt, i64 0, i64 0), i32 noundef 24) #5
  store i64 %309, i64* %18, align 8
  %310 = load i64, i64* %18, align 8
  store i32 1, i32* %7, align 4
  br label %363

311:                                              ; preds = %301
  store i32 2, i32* %7, align 4
  br label %363

312:                                              ; preds = %294
  %313 = load i64*, i64** %17, align 8
  %314 = load i64, i64* %313, align 8
  %315 = add i64 %314, 1
  store i64 %315, i64* %313, align 8
  store i32 1, i32* %7, align 4
  br label %363

316:                                              ; preds = %294
  %317 = load %struct.vrrphdr*, %struct.vrrphdr** %12, align 8
  %318 = icmp ne %struct.vrrphdr* %317, null
  br i1 %318, label %319, label %362

319:                                              ; preds = %316
  %320 = load %struct.vrrphdr*, %struct.vrrphdr** %12, align 8
  %321 = load i32, i32* %16, align 4
  store %struct.vrrphdr* %320, %struct.vrrphdr** %3, align 8
  store i32 %321, i32* %4, align 4
  %322 = load %struct.vrrphdr*, %struct.vrrphdr** %3, align 8
  %323 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %322, i32 0, i32 1
  %324 = load i8, i8* %323, align 1
  %325 = zext i8 %324 to i32
  store i32 %325, i32* %6, align 4
  %326 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %327 = bitcast i32* %6 to i8*
  %328 = call i8* %326(i8* noundef bitcast (%struct.anon.0* @vrrp_vrid_filter to i8*), i8* noundef %327) #5
  %329 = bitcast i8* %328 to %struct.vrrp_filter*
  store %struct.vrrp_filter* %329, %struct.vrrp_filter** %5, align 8
  %330 = load %struct.vrrp_filter*, %struct.vrrp_filter** %5, align 8
  %331 = icmp ne %struct.vrrp_filter* %330, null
  br i1 %331, label %333, label %332

332:                                              ; preds = %319
  store i32 2, i32* %2, align 4
  br label %360

333:                                              ; preds = %319
  %334 = load %struct.vrrp_filter*, %struct.vrrp_filter** %5, align 8
  %335 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %334, i32 0, i32 2
  %336 = load i64, i64* %335, align 8
  %337 = add i64 %336, 1
  store i64 %337, i64* %335, align 8
  %338 = load i32, i32* %4, align 4
  %339 = sext i32 %338 to i64
  %340 = load %struct.vrrp_filter*, %struct.vrrp_filter** %5, align 8
  %341 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %340, i32 0, i32 4
  %342 = load i64, i64* %341, align 8
  %343 = add i64 %342, %339
  store i64 %343, i64* %341, align 8
  %344 = load %struct.vrrp_filter*, %struct.vrrp_filter** %5, align 8
  %345 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %344, i32 0, i32 0
  %346 = load i32, i32* %345, align 8
  %347 = icmp ne i32 %346, 0
  br i1 %347, label %348, label %349

348:                                              ; preds = %333
  store i32 2, i32* %2, align 4
  br label %360

349:                                              ; preds = %333
  %350 = load %struct.vrrp_filter*, %struct.vrrp_filter** %5, align 8
  %351 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %350, i32 0, i32 1
  %352 = load i64, i64* %351, align 8
  %353 = add i64 %352, 1
  store i64 %353, i64* %351, align 8
  %354 = load i32, i32* %4, align 4
  %355 = sext i32 %354 to i64
  %356 = load %struct.vrrp_filter*, %struct.vrrp_filter** %5, align 8
  %357 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %356, i32 0, i32 3
  %358 = load i64, i64* %357, align 8
  %359 = add i64 %358, %355
  store i64 %359, i64* %357, align 8
  store i32 1, i32* %2, align 4
  br label %360

360:                                              ; preds = %332, %348, %349
  %361 = load i32, i32* %2, align 4
  store i32 %361, i32* %7, align 4
  br label %363

362:                                              ; preds = %316
  store i32 2, i32* %7, align 4
  br label %363

363:                                              ; preds = %177, %247, %267, %290, %307, %311, %312, %360, %362
  %364 = load i32, i32* %7, align 4
  store i32 %364, i32* %31, align 4
  %365 = load i32, i32* %31, align 4
  %366 = icmp eq i32 %365, 2
  br i1 %366, label %367, label %369

367:                                              ; preds = %363
  %368 = load i8*, i8** %29, align 8
  call void @swap_src_dst_mac(i8* noundef %368)
  store i32 3, i32* %26, align 4
  br label %371

369:                                              ; preds = %363
  %370 = load i32, i32* %31, align 4
  store i32 %370, i32* %26, align 4
  br label %371

371:                                              ; preds = %369, %367, %153
  %372 = load i32, i32* %26, align 4
  ret i32 %372
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone
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

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }
attributes #2 = { convergent nofree nosync nounwind readnone willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

; ModuleID = 'xdp_firewall.bpf.c'
source_filename = "xdp_firewall.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.vrrphdr*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.vrrp_filter*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i8*, align 8
  %14 = alloca %struct.parse_pkt*, align 8
  %15 = alloca %struct.iphdr*, align 8
  %16 = alloca %struct.vrrphdr*, align 8
  %17 = alloca %struct.ip_auth_hdr*, align 8
  %18 = alloca %struct.flow_key, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i64*, align 8
  %22 = alloca [24 x i8], align 16
  %23 = alloca i32, align 4
  %24 = alloca i8, align 1
  %25 = alloca %struct.ethhdr*, align 8
  %26 = alloca i8*, align 8
  %27 = alloca %struct.parse_pkt*, align 8
  %28 = alloca %struct._vlan_hdr*, align 8
  %29 = alloca i16, align 2
  %30 = alloca i8, align 1
  %31 = alloca i32, align 4
  %32 = alloca %struct.xdp_md*, align 8
  %33 = alloca i8*, align 8
  %34 = alloca i8*, align 8
  %35 = alloca %struct.parse_pkt, align 2
  %36 = alloca i32, align 4
  store %struct.xdp_md* %0, %struct.xdp_md** %32, align 8
  %37 = load %struct.xdp_md*, %struct.xdp_md** %32, align 8
  %38 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %37, i32 0, i32 1
  %39 = load i64, i64* %38, align 8
  %40 = inttoptr i64 %39 to i8*
  store i8* %40, i8** %33, align 8
  %41 = load %struct.xdp_md*, %struct.xdp_md** %32, align 8
  %42 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %41, i32 0, i32 0
  %43 = load i64, i64* %42, align 8
  %44 = inttoptr i64 %43 to i8*
  store i8* %44, i8** %34, align 8
  %45 = bitcast %struct.parse_pkt* %35 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 2 %45, i8 0, i64 4, i1 false)
  %46 = load i8*, i8** %34, align 8
  %47 = bitcast i8* %46 to %struct.ethhdr*
  %48 = load i8*, i8** %33, align 8
  store %struct.ethhdr* %47, %struct.ethhdr** %25, align 8
  store i8* %48, i8** %26, align 8
  store %struct.parse_pkt* %35, %struct.parse_pkt** %27, align 8
  store i8 14, i8* %30, align 1
  %49 = load %struct.ethhdr*, %struct.ethhdr** %25, align 8
  %50 = bitcast %struct.ethhdr* %49 to i8*
  %51 = load i8, i8* %30, align 1
  %52 = zext i8 %51 to i32
  %53 = sext i32 %52 to i64
  %54 = getelementptr i8, i8* %50, i64 %53
  %55 = load i8*, i8** %26, align 8
  %56 = icmp ugt i8* %54, %55
  br i1 %56, label %57, label %58

57:                                               ; preds = %1
  store i8 0, i8* %24, align 1
  br label %155

58:                                               ; preds = %1
  %59 = load %struct.ethhdr*, %struct.ethhdr** %25, align 8
  %60 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %59, i32 0, i32 2
  %61 = load i16, i16* %60, align 2
  store i16 %61, i16* %29, align 2
  %62 = load i16, i16* %29, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp eq i32 %63, 129
  br i1 %64, label %69, label %65

65:                                               ; preds = %58
  %66 = load i16, i16* %29, align 2
  %67 = zext i16 %66 to i32
  %68 = icmp eq i32 %67, 43144
  br i1 %68, label %69, label %94

69:                                               ; preds = %65, %58
  %70 = load %struct.ethhdr*, %struct.ethhdr** %25, align 8
  %71 = bitcast %struct.ethhdr* %70 to i8*
  %72 = load i8, i8* %30, align 1
  %73 = zext i8 %72 to i32
  %74 = sext i32 %73 to i64
  %75 = getelementptr i8, i8* %71, i64 %74
  %76 = bitcast i8* %75 to %struct._vlan_hdr*
  store %struct._vlan_hdr* %76, %struct._vlan_hdr** %28, align 8
  %77 = load i8, i8* %30, align 1
  %78 = zext i8 %77 to i64
  %79 = add i64 %78, 4
  %80 = trunc i64 %79 to i8
  store i8 %80, i8* %30, align 1
  %81 = load %struct.ethhdr*, %struct.ethhdr** %25, align 8
  %82 = bitcast %struct.ethhdr* %81 to i8*
  %83 = load i8, i8* %30, align 1
  %84 = zext i8 %83 to i32
  %85 = sext i32 %84 to i64
  %86 = getelementptr i8, i8* %82, i64 %85
  %87 = load i8*, i8** %26, align 8
  %88 = icmp ugt i8* %86, %87
  br i1 %88, label %89, label %90

89:                                               ; preds = %69
  store i8 0, i8* %24, align 1
  br label %155

90:                                               ; preds = %69
  %91 = load %struct._vlan_hdr*, %struct._vlan_hdr** %28, align 8
  %92 = getelementptr inbounds %struct._vlan_hdr, %struct._vlan_hdr* %91, i32 0, i32 1
  %93 = load i16, i16* %92, align 2
  store i16 %93, i16* %29, align 2
  br label %94

94:                                               ; preds = %90, %65
  %95 = load i16, i16* %29, align 2
  %96 = zext i16 %95 to i32
  %97 = icmp eq i32 %96, 129
  br i1 %97, label %102, label %98

98:                                               ; preds = %94
  %99 = load i16, i16* %29, align 2
  %100 = zext i16 %99 to i32
  %101 = icmp eq i32 %100, 43144
  br i1 %101, label %102, label %127

102:                                              ; preds = %98, %94
  %103 = load %struct.ethhdr*, %struct.ethhdr** %25, align 8
  %104 = bitcast %struct.ethhdr* %103 to i8*
  %105 = load i8, i8* %30, align 1
  %106 = zext i8 %105 to i32
  %107 = sext i32 %106 to i64
  %108 = getelementptr i8, i8* %104, i64 %107
  %109 = bitcast i8* %108 to %struct._vlan_hdr*
  store %struct._vlan_hdr* %109, %struct._vlan_hdr** %28, align 8
  %110 = load i8, i8* %30, align 1
  %111 = zext i8 %110 to i64
  %112 = add i64 %111, 4
  %113 = trunc i64 %112 to i8
  store i8 %113, i8* %30, align 1
  %114 = load %struct.ethhdr*, %struct.ethhdr** %25, align 8
  %115 = bitcast %struct.ethhdr* %114 to i8*
  %116 = load i8, i8* %30, align 1
  %117 = zext i8 %116 to i32
  %118 = sext i32 %117 to i64
  %119 = getelementptr i8, i8* %115, i64 %118
  %120 = load i8*, i8** %26, align 8
  %121 = icmp ugt i8* %119, %120
  br i1 %121, label %122, label %123

122:                                              ; preds = %102
  store i8 0, i8* %24, align 1
  br label %155

123:                                              ; preds = %102
  %124 = load %struct._vlan_hdr*, %struct._vlan_hdr** %28, align 8
  %125 = getelementptr inbounds %struct._vlan_hdr, %struct._vlan_hdr* %124, i32 0, i32 1
  %126 = load i16, i16* %125, align 2
  store i16 %126, i16* %29, align 2
  br label %127

127:                                              ; preds = %123, %98
  %128 = load i16, i16* %29, align 2
  %129 = call i1 @llvm.is.constant.i16(i16 %128) #6
  br i1 %129, label %130, label %142

130:                                              ; preds = %127
  %131 = load i16, i16* %29, align 2
  %132 = zext i16 %131 to i32
  %133 = shl i32 %132, 8
  %134 = ashr i32 %133, 8
  %135 = shl i32 %134, 8
  %136 = load i16, i16* %29, align 2
  %137 = zext i16 %136 to i32
  %138 = ashr i32 %137, 8
  %139 = or i32 %135, %138
  %140 = trunc i32 %139 to i16
  %141 = zext i16 %140 to i32
  br label %146

142:                                              ; preds = %127
  %143 = load i16, i16* %29, align 2
  %144 = call i16 @llvm.bswap.i16(i16 %143) #6
  %145 = zext i16 %144 to i32
  br label %146

146:                                              ; preds = %142, %130
  %147 = phi i32 [ %141, %130 ], [ %145, %142 ]
  %148 = trunc i32 %147 to i16
  %149 = load %struct.parse_pkt*, %struct.parse_pkt** %27, align 8
  %150 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %149, i32 0, i32 0
  store i16 %148, i16* %150, align 2
  %151 = load i8, i8* %30, align 1
  %152 = zext i8 %151 to i16
  %153 = load %struct.parse_pkt*, %struct.parse_pkt** %27, align 8
  %154 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %153, i32 0, i32 1
  store i16 %152, i16* %154, align 2
  store i8 1, i8* %24, align 1
  br label %155

155:                                              ; preds = %57, %89, %122, %146
  %156 = load i8, i8* %24, align 1
  %157 = icmp ne i8 %156, 0
  br i1 %157, label %159, label %158

158:                                              ; preds = %155
  store i32 2, i32* %31, align 4
  br label %381

159:                                              ; preds = %155
  %160 = load i8*, i8** %34, align 8
  %161 = load i8*, i8** %33, align 8
  store i8* %160, i8** %12, align 8
  store i8* %161, i8** %13, align 8
  store %struct.parse_pkt* %35, %struct.parse_pkt** %14, align 8
  store %struct.vrrphdr* null, %struct.vrrphdr** %16, align 8
  %162 = bitcast %struct.flow_key* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %162, i8* align 8 bitcast (%struct.flow_key* @__const.layer3_filter.key to i8*), i64 24, i1 false) #6
  store i32 0, i32* %19, align 4
  store i32 0, i32* %20, align 4
  %163 = load %struct.parse_pkt*, %struct.parse_pkt** %14, align 8
  %164 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %163, i32 0, i32 0
  %165 = load i16, i16* %164, align 2
  %166 = zext i16 %165 to i32
  %167 = icmp eq i32 %166, 2048
  br i1 %167, label %168, label %308

168:                                              ; preds = %159
  %169 = load i8*, i8** %12, align 8
  %170 = load %struct.parse_pkt*, %struct.parse_pkt** %14, align 8
  %171 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %170, i32 0, i32 1
  %172 = load i16, i16* %171, align 2
  %173 = zext i16 %172 to i32
  %174 = sext i32 %173 to i64
  %175 = getelementptr i8, i8* %169, i64 %174
  %176 = bitcast i8* %175 to %struct.iphdr*
  store %struct.iphdr* %176, %struct.iphdr** %15, align 8
  %177 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %178 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %177, i64 1
  %179 = load i8*, i8** %13, align 8
  %180 = bitcast i8* %179 to %struct.iphdr*
  %181 = icmp ugt %struct.iphdr* %178, %180
  br i1 %181, label %182, label %183

182:                                              ; preds = %168
  store i32 2, i32* %11, align 4
  br label %373

183:                                              ; preds = %168
  %184 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %185 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %184, i32 0, i32 2
  %186 = load i16, i16* %185, align 2
  %187 = call i1 @llvm.is.constant.i16(i16 %186) #6
  br i1 %187, label %188, label %204

188:                                              ; preds = %183
  %189 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %190 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %189, i32 0, i32 2
  %191 = load i16, i16* %190, align 2
  %192 = zext i16 %191 to i32
  %193 = shl i32 %192, 8
  %194 = ashr i32 %193, 8
  %195 = shl i32 %194, 8
  %196 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %197 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %196, i32 0, i32 2
  %198 = load i16, i16* %197, align 2
  %199 = zext i16 %198 to i32
  %200 = ashr i32 %199, 8
  %201 = or i32 %195, %200
  %202 = trunc i32 %201 to i16
  %203 = zext i16 %202 to i32
  br label %210

204:                                              ; preds = %183
  %205 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %206 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %205, i32 0, i32 2
  %207 = load i16, i16* %206, align 2
  %208 = call i16 @llvm.bswap.i16(i16 %207) #6
  %209 = zext i16 %208 to i32
  br label %210

210:                                              ; preds = %204, %188
  %211 = phi i32 [ %203, %188 ], [ %209, %204 ]
  store i32 %211, i32* %20, align 4
  %212 = load %struct.parse_pkt*, %struct.parse_pkt** %14, align 8
  %213 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %212, i32 0, i32 1
  %214 = load i16, i16* %213, align 2
  %215 = zext i16 %214 to i32
  %216 = load i32, i32* %19, align 4
  %217 = add nsw i32 %216, %215
  store i32 %217, i32* %19, align 4
  %218 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %18, i32 0, i32 1
  store i32 2048, i32* %218, align 8
  %219 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %18, i32 0, i32 0
  %220 = bitcast %union.anon* %219 to [4 x i32]*
  %221 = getelementptr inbounds [4 x i32], [4 x i32]* %220, i64 0, i64 3
  store i32 0, i32* %221, align 4
  %222 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %18, i32 0, i32 0
  %223 = bitcast %union.anon* %222 to [4 x i32]*
  %224 = getelementptr inbounds [4 x i32], [4 x i32]* %223, i64 0, i64 2
  store i32 0, i32* %224, align 8
  %225 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %18, i32 0, i32 0
  %226 = bitcast %union.anon* %225 to [4 x i32]*
  %227 = getelementptr inbounds [4 x i32], [4 x i32]* %226, i64 0, i64 1
  store i32 0, i32* %227, align 4
  %228 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %229 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %228, i32 0, i32 8
  %230 = bitcast %union.anon.1* %229 to %struct.anon.2*
  %231 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %230, i32 0, i32 1
  %232 = load i32, i32* %231, align 4
  %233 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %18, i32 0, i32 0
  %234 = bitcast %union.anon* %233 to i32*
  store i32 %232, i32* %234, align 8
  %235 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %236 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %235, i32 0, i32 6
  %237 = load i8, i8* %236, align 1
  %238 = zext i8 %237 to i32
  %239 = icmp eq i32 %238, 112
  br i1 %239, label %240, label %254

240:                                              ; preds = %210
  %241 = load i8*, i8** %12, align 8
  %242 = load i32, i32* %19, align 4
  %243 = sext i32 %242 to i64
  %244 = getelementptr i8, i8* %241, i64 %243
  %245 = getelementptr i8, i8* %244, i64 20
  %246 = bitcast i8* %245 to %struct.vrrphdr*
  store %struct.vrrphdr* %246, %struct.vrrphdr** %16, align 8
  %247 = load %struct.vrrphdr*, %struct.vrrphdr** %16, align 8
  %248 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %247, i64 1
  %249 = load i8*, i8** %13, align 8
  %250 = bitcast i8* %249 to %struct.vrrphdr*
  %251 = icmp ugt %struct.vrrphdr* %248, %250
  br i1 %251, label %252, label %253

252:                                              ; preds = %240
  store i32 1, i32* %11, align 4
  br label %373

253:                                              ; preds = %240
  br label %299

254:                                              ; preds = %210
  %255 = load %struct.iphdr*, %struct.iphdr** %15, align 8
  %256 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %255, i32 0, i32 6
  %257 = load i8, i8* %256, align 1
  %258 = zext i8 %257 to i32
  %259 = icmp eq i32 %258, 51
  br i1 %259, label %260, label %298

260:                                              ; preds = %254
  %261 = load i8*, i8** %12, align 8
  %262 = load i32, i32* %19, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr i8, i8* %261, i64 %263
  %265 = getelementptr i8, i8* %264, i64 20
  %266 = bitcast i8* %265 to %struct.ip_auth_hdr*
  store %struct.ip_auth_hdr* %266, %struct.ip_auth_hdr** %17, align 8
  %267 = load %struct.ip_auth_hdr*, %struct.ip_auth_hdr** %17, align 8
  %268 = getelementptr inbounds %struct.ip_auth_hdr, %struct.ip_auth_hdr* %267, i64 1
  %269 = load i8*, i8** %13, align 8
  %270 = bitcast i8* %269 to %struct.ip_auth_hdr*
  %271 = icmp ugt %struct.ip_auth_hdr* %268, %270
  br i1 %271, label %272, label %273

272:                                              ; preds = %260
  store i32 2, i32* %11, align 4
  br label %373

273:                                              ; preds = %260
  %274 = load i32, i32* %19, align 4
  %275 = sext i32 %274 to i64
  %276 = add i64 %275, 20
  %277 = trunc i64 %276 to i32
  store i32 %277, i32* %19, align 4
  %278 = load %struct.ip_auth_hdr*, %struct.ip_auth_hdr** %17, align 8
  %279 = getelementptr inbounds %struct.ip_auth_hdr, %struct.ip_auth_hdr* %278, i32 0, i32 0
  %280 = load i8, i8* %279, align 4
  %281 = zext i8 %280 to i32
  %282 = icmp eq i32 %281, 112
  br i1 %282, label %283, label %297

283:                                              ; preds = %273
  %284 = load i8*, i8** %12, align 8
  %285 = load i32, i32* %19, align 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr i8, i8* %284, i64 %286
  %288 = getelementptr i8, i8* %287, i64 12
  %289 = bitcast i8* %288 to %struct.vrrphdr*
  store %struct.vrrphdr* %289, %struct.vrrphdr** %16, align 8
  %290 = load %struct.vrrphdr*, %struct.vrrphdr** %16, align 8
  %291 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %290, i64 1
  %292 = load i8*, i8** %13, align 8
  %293 = bitcast i8* %292 to %struct.vrrphdr*
  %294 = icmp ugt %struct.vrrphdr* %291, %293
  br i1 %294, label %295, label %296

295:                                              ; preds = %283
  store i32 1, i32* %11, align 4
  br label %373

296:                                              ; preds = %283
  br label %297

297:                                              ; preds = %296, %273
  br label %298

298:                                              ; preds = %297, %254
  br label %299

299:                                              ; preds = %298, %253
  %300 = bitcast %struct.flow_key* %18 to i8*
  store i64* @l3_filter_id, i64** %9, align 8
  store i8* %300, i8** %10, align 8
  %301 = load i64*, i64** %9, align 8
  %302 = load i64, i64* %301, align 8
  %303 = load i8*, i8** %10, align 8
  %304 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %302, i8* noundef %303) #6
  %305 = bitcast i8* %304 to i64*
  store i64* %305, i64** %21, align 8
  %306 = load i64*, i64** %21, align 8
  %307 = icmp ne i64* %306, null
  br i1 %307, label %320, label %324

308:                                              ; preds = %159
  %309 = load %struct.parse_pkt*, %struct.parse_pkt** %14, align 8
  %310 = getelementptr inbounds %struct.parse_pkt, %struct.parse_pkt* %309, i32 0, i32 0
  %311 = load i16, i16* %310, align 2
  %312 = zext i16 %311 to i32
  %313 = icmp eq i32 %312, 34525
  br i1 %313, label %314, label %319

314:                                              ; preds = %308
  %315 = bitcast [24 x i8]* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %315, i8* align 16 getelementptr inbounds ([24 x i8], [24 x i8]* @__const.layer3_filter.____fmt, i32 0, i32 0), i64 24, i1 false) #6
  %316 = getelementptr inbounds [24 x i8], [24 x i8]* %22, i64 0, i64 0
  %317 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %316, i64 noundef 24) #6
  store i32 %317, i32* %23, align 4
  %318 = load i32, i32* %23, align 4
  store i32 1, i32* %11, align 4
  br label %373

319:                                              ; preds = %308
  store i32 2, i32* %11, align 4
  br label %373

320:                                              ; preds = %299
  %321 = load i64*, i64** %21, align 8
  %322 = load i64, i64* %321, align 8
  %323 = add i64 %322, 1
  store i64 %323, i64* %321, align 8
  store i32 1, i32* %11, align 4
  br label %373

324:                                              ; preds = %299
  %325 = load %struct.vrrphdr*, %struct.vrrphdr** %16, align 8
  %326 = icmp ne %struct.vrrphdr* %325, null
  br i1 %326, label %327, label %372

327:                                              ; preds = %324
  %328 = load %struct.vrrphdr*, %struct.vrrphdr** %16, align 8
  %329 = load i32, i32* %20, align 4
  store %struct.vrrphdr* %328, %struct.vrrphdr** %5, align 8
  store i32 %329, i32* %6, align 4
  %330 = load %struct.vrrphdr*, %struct.vrrphdr** %5, align 8
  %331 = getelementptr inbounds %struct.vrrphdr, %struct.vrrphdr* %330, i32 0, i32 1
  %332 = load i8, i8* %331, align 1
  %333 = zext i8 %332 to i32
  store i32 %333, i32* %8, align 4
  %334 = bitcast i32* %8 to i8*
  store i64* @vrrp_vrid_filter_id, i64** %2, align 8
  store i8* %334, i8** %3, align 8
  %335 = load i64*, i64** %2, align 8
  %336 = load i64, i64* %335, align 8
  %337 = load i8*, i8** %3, align 8
  %338 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %336, i8* noundef %337) #6
  %339 = bitcast i8* %338 to %struct.vrrp_filter*
  store %struct.vrrp_filter* %339, %struct.vrrp_filter** %7, align 8
  %340 = load %struct.vrrp_filter*, %struct.vrrp_filter** %7, align 8
  %341 = icmp ne %struct.vrrp_filter* %340, null
  br i1 %341, label %343, label %342

342:                                              ; preds = %327
  store i32 2, i32* %4, align 4
  br label %370

343:                                              ; preds = %327
  %344 = load %struct.vrrp_filter*, %struct.vrrp_filter** %7, align 8
  %345 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %344, i32 0, i32 2
  %346 = load i64, i64* %345, align 8
  %347 = add i64 %346, 1
  store i64 %347, i64* %345, align 8
  %348 = load i32, i32* %6, align 4
  %349 = sext i32 %348 to i64
  %350 = load %struct.vrrp_filter*, %struct.vrrp_filter** %7, align 8
  %351 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %350, i32 0, i32 4
  %352 = load i64, i64* %351, align 8
  %353 = add i64 %352, %349
  store i64 %353, i64* %351, align 8
  %354 = load %struct.vrrp_filter*, %struct.vrrp_filter** %7, align 8
  %355 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %354, i32 0, i32 0
  %356 = load i32, i32* %355, align 8
  %357 = icmp ne i32 %356, 0
  br i1 %357, label %358, label %359

358:                                              ; preds = %343
  store i32 2, i32* %4, align 4
  br label %370

359:                                              ; preds = %343
  %360 = load %struct.vrrp_filter*, %struct.vrrp_filter** %7, align 8
  %361 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %360, i32 0, i32 1
  %362 = load i64, i64* %361, align 8
  %363 = add i64 %362, 1
  store i64 %363, i64* %361, align 8
  %364 = load i32, i32* %6, align 4
  %365 = sext i32 %364 to i64
  %366 = load %struct.vrrp_filter*, %struct.vrrp_filter** %7, align 8
  %367 = getelementptr inbounds %struct.vrrp_filter, %struct.vrrp_filter* %366, i32 0, i32 3
  %368 = load i64, i64* %367, align 8
  %369 = add i64 %368, %365
  store i64 %369, i64* %367, align 8
  store i32 1, i32* %4, align 4
  br label %370

370:                                              ; preds = %342, %358, %359
  %371 = load i32, i32* %4, align 4
  store i32 %371, i32* %11, align 4
  br label %373

372:                                              ; preds = %324
  store i32 2, i32* %11, align 4
  br label %373

373:                                              ; preds = %182, %252, %272, %295, %314, %319, %320, %370, %372
  %374 = load i32, i32* %11, align 4
  store i32 %374, i32* %36, align 4
  %375 = load i32, i32* %36, align 4
  %376 = icmp eq i32 %375, 2
  br i1 %376, label %377, label %379

377:                                              ; preds = %373
  %378 = load i8*, i8** %34, align 8
  call void @swap_src_dst_mac(i8* noundef %378)
  store i32 3, i32* %31, align 4
  br label %381

379:                                              ; preds = %373
  %380 = load i32, i32* %36, align 4
  store i32 %380, i32* %31, align 4
  br label %381

381:                                              ; preds = %379, %377, %158
  %382 = load i32, i32* %31, align 4
  ret i32 %382
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

declare i8* @_bpf_helper_ext_0001(...) #5

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

; ModuleID = 'xdp_lb.bpf.c'
source_filename = "xdp_lb.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon.1 = type { [2 x i32]*, i32*, %struct.ip_mac_pair*, [64 x i32]* }
%struct.ip_mac_pair = type { %struct.eth_addr, i32 }
%struct.eth_addr = type { [6 x i8] }
%struct.anon.2 = type { [2 x i32]*, i32*, %struct.ip_mac_pair*, [64 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.hash_and_sum = type { i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }

@__const.xdp_pass.____fmt = private unnamed_addr constant [22 x i8] c"Out of bounds ethhdr\0A\00", align 16
@bpf_trace_printk = internal global i64 (i8*, i32, ...)* inttoptr (i64 6 to i64 (i8*, i32, ...)*), align 8
@__const.xdp_pass.____fmt.1 = private unnamed_addr constant [21 x i8] c"Out of bounds iphdr\0A\00", align 16
@__const.xdp_pass.____fmt.2 = private unnamed_addr constant [22 x i8] c"Out of bounds tcphdr\0A\00", align 16
@bpf_map_lookup_elem = internal global i8* (i8*, i8*)* inttoptr (i64 1 to i8* (i8*, i8*)*), align 8
@config_map = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8
@__const.xdp_pass.____fmt.3 = private unnamed_addr constant [25 x i8] c"Client config not found\0A\00", align 16
@targets_map = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8
@bpf_csum_diff = internal global i64 (i32*, i32, i32*, i32, i32)* inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*), align 8
@LICENSE = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@llvm.compiler.used = appending global [4 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @LICENSE, i32 0, i32 0), i8* bitcast (%struct.anon.2* @targets_map to i8*), i8* bitcast (%struct.anon.1* @config_map to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca %struct.xdp_md*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca %struct.hash_and_sum, align 4
  %24 = alloca %struct.ethhdr*, align 8
  %25 = alloca [22 x i8], align 16
  %26 = alloca i64, align 8
  %27 = alloca %struct.iphdr*, align 8
  %28 = alloca [21 x i8], align 16
  %29 = alloca i64, align 8
  %30 = alloca %struct.tcphdr*, align 8
  %31 = alloca [22 x i8], align 16
  %32 = alloca i64, align 8
  %33 = alloca i32, align 4
  %34 = alloca %struct.ip_mac_pair*, align 8
  %35 = alloca [25 x i8], align 16
  %36 = alloca i64, align 8
  %37 = alloca %struct.ip_mac_pair*, align 8
  %38 = alloca %struct.ip_mac_pair*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %20, align 8
  %39 = load %struct.xdp_md*, %struct.xdp_md** %20, align 8
  %40 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %39, i32 0, i32 1
  %41 = load i64, i64* %40, align 8
  %42 = inttoptr i64 %41 to i8*
  store i8* %42, i8** %21, align 8
  %43 = load %struct.xdp_md*, %struct.xdp_md** %20, align 8
  %44 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %43, i32 0, i32 0
  %45 = load i64, i64* %44, align 8
  %46 = inttoptr i64 %45 to i8*
  store i8* %46, i8** %22, align 8
  %47 = load i8*, i8** %22, align 8
  %48 = bitcast i8* %47 to %struct.ethhdr*
  store %struct.ethhdr* %48, %struct.ethhdr** %24, align 8
  %49 = load i8*, i8** %22, align 8
  %50 = getelementptr i8, i8* %49, i64 14
  %51 = load i8*, i8** %21, align 8
  %52 = icmp ugt i8* %50, %51
  br i1 %52, label %53, label %59

53:                                               ; preds = %1
  %54 = bitcast [22 x i8]* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %54, i8* align 16 getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt, i32 0, i32 0), i64 22, i1 false)
  %55 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %56 = getelementptr inbounds [22 x i8], [22 x i8]* %25, i64 0, i64 0
  %57 = call i64 (i8*, i32, ...) %55(i8* noundef %56, i32 noundef 22)
  store i64 %57, i64* %26, align 8
  %58 = load i64, i64* %26, align 8
  store i32 1, i32* %19, align 4
  br label %400

59:                                               ; preds = %1
  %60 = load i8*, i8** %22, align 8
  %61 = getelementptr i8, i8* %60, i64 14
  %62 = bitcast i8* %61 to %struct.iphdr*
  store %struct.iphdr* %62, %struct.iphdr** %27, align 8
  %63 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %64 = bitcast %struct.iphdr* %63 to i8*
  %65 = getelementptr i8, i8* %64, i64 20
  %66 = load i8*, i8** %21, align 8
  %67 = icmp ugt i8* %65, %66
  br i1 %67, label %68, label %74

68:                                               ; preds = %59
  %69 = bitcast [21 x i8]* %28 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %69, i8* align 16 getelementptr inbounds ([21 x i8], [21 x i8]* @__const.xdp_pass.____fmt.1, i32 0, i32 0), i64 21, i1 false)
  %70 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %71 = getelementptr inbounds [21 x i8], [21 x i8]* %28, i64 0, i64 0
  %72 = call i64 (i8*, i32, ...) %70(i8* noundef %71, i32 noundef 21)
  store i64 %72, i64* %29, align 8
  %73 = load i64, i64* %29, align 8
  store i32 1, i32* %19, align 4
  br label %400

74:                                               ; preds = %59
  %75 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %76 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %75, i32 0, i32 6
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = icmp eq i32 %78, 6
  br i1 %79, label %80, label %399

80:                                               ; preds = %74
  %81 = load i8*, i8** %22, align 8
  %82 = getelementptr i8, i8* %81, i64 14
  %83 = getelementptr i8, i8* %82, i64 20
  %84 = bitcast i8* %83 to %struct.tcphdr*
  store %struct.tcphdr* %84, %struct.tcphdr** %30, align 8
  %85 = load %struct.tcphdr*, %struct.tcphdr** %30, align 8
  %86 = bitcast %struct.tcphdr* %85 to i8*
  %87 = getelementptr i8, i8* %86, i64 20
  %88 = load i8*, i8** %21, align 8
  %89 = icmp ugt i8* %87, %88
  br i1 %89, label %90, label %96

90:                                               ; preds = %80
  %91 = bitcast [22 x i8]* %31 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %91, i8* align 16 getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt.2, i32 0, i32 0), i64 22, i1 false)
  %92 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %93 = getelementptr inbounds [22 x i8], [22 x i8]* %31, i64 0, i64 0
  %94 = call i64 (i8*, i32, ...) %92(i8* noundef %93, i32 noundef 22)
  store i64 %94, i64* %32, align 8
  %95 = load i64, i64* %32, align 8
  store i32 1, i32* %19, align 4
  br label %400

96:                                               ; preds = %80
  store i32 1, i32* %33, align 4
  %97 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %98 = bitcast i32* %33 to i8*
  %99 = call i8* %97(i8* noundef bitcast (%struct.anon.1* @config_map to i8*), i8* noundef %98)
  %100 = bitcast i8* %99 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %100, %struct.ip_mac_pair** %34, align 8
  %101 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %34, align 8
  %102 = icmp ne %struct.ip_mac_pair* %101, null
  br i1 %102, label %109, label %103

103:                                              ; preds = %96
  %104 = bitcast [25 x i8]* %35 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %104, i8* align 16 getelementptr inbounds ([25 x i8], [25 x i8]* @__const.xdp_pass.____fmt.3, i32 0, i32 0), i64 25, i1 false)
  %105 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %106 = getelementptr inbounds [25 x i8], [25 x i8]* %35, i64 0, i64 0
  %107 = call i64 (i8*, i32, ...) %105(i8* noundef %106, i32 noundef 25)
  store i64 %107, i64* %36, align 8
  %108 = load i64, i64* %36, align 8
  store i32 0, i32* %19, align 4
  br label %400

109:                                              ; preds = %96
  %110 = load i8*, i8** %22, align 8
  %111 = getelementptr i8, i8* %110, i64 1200
  %112 = load i8*, i8** %21, align 8
  %113 = icmp ult i8* %111, %112
  br i1 %113, label %114, label %115

114:                                              ; preds = %109
  store i32 2, i32* %19, align 4
  br label %400

115:                                              ; preds = %109
  %116 = load i8*, i8** %22, align 8
  %117 = getelementptr i8, i8* %116, i64 60
  %118 = load i8*, i8** %21, align 8
  %119 = icmp ugt i8* %117, %118
  br i1 %119, label %120, label %121

120:                                              ; preds = %115
  store i32 2, i32* %19, align 4
  br label %400

121:                                              ; preds = %115
  %122 = load i8*, i8** %22, align 8
  %123 = call i32 @calculate_checksum(i8* noundef %122, i32 noundef 60)
  %124 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %23, i32 0, i32 0
  store i32 %123, i32* %124, align 4
  %125 = load i8*, i8** %22, align 8
  %126 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %23, i32 0, i32 0
  %127 = load i32, i32* %126, align 4
  store i8* %125, i8** %13, align 8
  store i32 60, i32* %14, align 4
  store i32 %127, i32* %15, align 4
  %128 = load i32, i32* %14, align 4
  %129 = icmp uge i32 %128, 16
  br i1 %129, label %130, label %145

130:                                              ; preds = %121
  %131 = load i8*, i8** %13, align 8
  %132 = load i32, i32* %14, align 4
  %133 = load i32, i32* %15, align 4
  store i8* %131, i8** %5, align 8
  store i32 %132, i32* %6, align 4
  store i32 %133, i32* %7, align 4
  %134 = load i8*, i8** %5, align 8
  %135 = load i32, i32* %6, align 4
  %136 = load i32, i32* %7, align 4
  %137 = add i32 %136, -1640531535
  %138 = add i32 %137, -2048144777
  %139 = load i32, i32* %7, align 4
  %140 = add i32 %139, -2048144777
  %141 = load i32, i32* %7, align 4
  %142 = load i32, i32* %7, align 4
  %143 = sub i32 %142, -1640531535
  %144 = call i32 @h16bytes_4(i8* noundef %134, i32 noundef %135, i32 noundef %138, i32 noundef %140, i32 noundef %141, i32 noundef %143) #5
  br label %148

145:                                              ; preds = %121
  %146 = load i32, i32* %15, align 4
  %147 = add i32 %146, 374761393
  br label %148

148:                                              ; preds = %130, %145
  %149 = phi i32 [ %144, %130 ], [ %147, %145 ]
  %150 = load i32, i32* %14, align 4
  %151 = add i32 %149, %150
  %152 = load i8*, i8** %13, align 8
  %153 = load i32, i32* %14, align 4
  %154 = and i32 %153, -16
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds i8, i8* %152, i64 %155
  %157 = load i32, i32* %14, align 4
  %158 = and i32 %157, 15
  %159 = call i32 @finalize(i32 noundef %151, i8* noundef %156, i32 noundef %158) #5
  %160 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %23, i32 0, i32 1
  store i32 %159, i32* %160, align 4
  %161 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %23, i32 0, i32 1
  %162 = load i32, i32* %161, align 4
  %163 = udiv i32 %162, 2
  %164 = icmp ne i32 %163, 0
  br i1 %164, label %165, label %202

165:                                              ; preds = %148
  %166 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %167 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %166, i32 0, i32 8
  %168 = bitcast %union.anon* %167 to %struct.anon*
  %169 = getelementptr inbounds %struct.anon, %struct.anon* %168, i32 0, i32 0
  %170 = load i32, i32* %169, align 4
  %171 = load %struct.tcphdr*, %struct.tcphdr** %30, align 8
  %172 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %171, i32 0, i32 0
  %173 = load i16, i16* %172, align 4
  %174 = load %struct.tcphdr*, %struct.tcphdr** %30, align 8
  %175 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %174, i32 0, i32 1
  %176 = load i16, i16* %175, align 2
  store i32 %170, i32* %9, align 4
  store i16 %173, i16* %10, align 2
  store i16 %176, i16* %11, align 2
  %177 = load i32, i32* %9, align 4
  %178 = load i16, i16* %10, align 2
  %179 = zext i16 %178 to i32
  %180 = xor i32 %177, %179
  %181 = load i16, i16* %11, align 2
  %182 = zext i16 %181 to i32
  %183 = xor i32 %180, %182
  %184 = and i32 %183, 1
  store i32 %184, i32* %12, align 4
  %185 = load i32, i32* %12, align 4
  store i32 %185, i32* %33, align 4
  %186 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %187 = bitcast i32* %33 to i8*
  %188 = call i8* %186(i8* noundef bitcast (%struct.anon.2* @targets_map to i8*), i8* noundef %187)
  %189 = bitcast i8* %188 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %189, %struct.ip_mac_pair** %37, align 8
  %190 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %191 = icmp ne %struct.ip_mac_pair* %190, null
  br i1 %191, label %193, label %192

192:                                              ; preds = %165
  store i32 0, i32* %19, align 4
  br label %400

193:                                              ; preds = %165
  store i32 0, i32* %33, align 4
  %194 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %195 = bitcast i32* %33 to i8*
  %196 = call i8* %194(i8* noundef bitcast (%struct.anon.1* @config_map to i8*), i8* noundef %195)
  %197 = bitcast i8* %196 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %197, %struct.ip_mac_pair** %38, align 8
  %198 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %199 = icmp ne %struct.ip_mac_pair* %198, null
  br i1 %199, label %201, label %200

200:                                              ; preds = %193
  store i32 0, i32* %19, align 4
  br label %400

201:                                              ; preds = %193
  br label %219

202:                                              ; preds = %148
  store i32 1, i32* %33, align 4
  %203 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %204 = bitcast i32* %33 to i8*
  %205 = call i8* %203(i8* noundef bitcast (%struct.anon.1* @config_map to i8*), i8* noundef %204)
  %206 = bitcast i8* %205 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %206, %struct.ip_mac_pair** %37, align 8
  %207 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %208 = icmp ne %struct.ip_mac_pair* %207, null
  br i1 %208, label %210, label %209

209:                                              ; preds = %202
  store i32 0, i32* %19, align 4
  br label %400

210:                                              ; preds = %202
  store i32 0, i32* %33, align 4
  %211 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %212 = bitcast i32* %33 to i8*
  %213 = call i8* %211(i8* noundef bitcast (%struct.anon.1* @config_map to i8*), i8* noundef %212)
  %214 = bitcast i8* %213 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %214, %struct.ip_mac_pair** %38, align 8
  %215 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %216 = icmp ne %struct.ip_mac_pair* %215, null
  br i1 %216, label %218, label %217

217:                                              ; preds = %210
  store i32 0, i32* %19, align 4
  br label %400

218:                                              ; preds = %210
  br label %219

219:                                              ; preds = %218, %201
  %220 = load %struct.ethhdr*, %struct.ethhdr** %24, align 8
  %221 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %220, i32 0, i32 0
  %222 = getelementptr inbounds [6 x i8], [6 x i8]* %221, i64 0, i64 0
  %223 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %224 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %223, i32 0, i32 0
  %225 = bitcast %struct.eth_addr* %224 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %222, i8* align 4 %225, i64 6, i1 false)
  %226 = load %struct.ethhdr*, %struct.ethhdr** %24, align 8
  %227 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %226, i32 0, i32 1
  %228 = getelementptr inbounds [6 x i8], [6 x i8]* %227, i64 0, i64 0
  %229 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %230 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %229, i32 0, i32 0
  %231 = bitcast %struct.eth_addr* %230 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %228, i8* align 4 %231, i64 6, i1 false)
  %232 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %233 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %232, i32 0, i32 1
  %234 = load i32, i32* %233, align 4
  %235 = call i1 @llvm.is.constant.i32(i32 %234)
  br i1 %235, label %236, label %264

236:                                              ; preds = %219
  %237 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %238 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %237, i32 0, i32 1
  %239 = load i32, i32* %238, align 4
  %240 = shl i32 %239, 24
  %241 = lshr i32 %240, 24
  %242 = shl i32 %241, 24
  %243 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %244 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %243, i32 0, i32 1
  %245 = load i32, i32* %244, align 4
  %246 = shl i32 %245, 16
  %247 = lshr i32 %246, 24
  %248 = shl i32 %247, 16
  %249 = or i32 %242, %248
  %250 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %251 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %250, i32 0, i32 1
  %252 = load i32, i32* %251, align 4
  %253 = shl i32 %252, 8
  %254 = lshr i32 %253, 24
  %255 = shl i32 %254, 8
  %256 = or i32 %249, %255
  %257 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %258 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %257, i32 0, i32 1
  %259 = load i32, i32* %258, align 4
  %260 = shl i32 %259, 0
  %261 = lshr i32 %260, 24
  %262 = shl i32 %261, 0
  %263 = or i32 %256, %262
  br label %269

264:                                              ; preds = %219
  %265 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %37, align 8
  %266 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %265, i32 0, i32 1
  %267 = load i32, i32* %266, align 4
  %268 = call i32 @llvm.bswap.i32(i32 %267)
  br label %269

269:                                              ; preds = %264, %236
  %270 = phi i32 [ %263, %236 ], [ %268, %264 ]
  %271 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %272 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %271, i32 0, i32 8
  %273 = bitcast %union.anon* %272 to %struct.anon*
  %274 = getelementptr inbounds %struct.anon, %struct.anon* %273, i32 0, i32 1
  store i32 %270, i32* %274, align 4
  %275 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %276 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %275, i32 0, i32 1
  %277 = load i32, i32* %276, align 4
  %278 = call i1 @llvm.is.constant.i32(i32 %277)
  br i1 %278, label %279, label %307

279:                                              ; preds = %269
  %280 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %281 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %280, i32 0, i32 1
  %282 = load i32, i32* %281, align 4
  %283 = shl i32 %282, 24
  %284 = lshr i32 %283, 24
  %285 = shl i32 %284, 24
  %286 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %287 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %286, i32 0, i32 1
  %288 = load i32, i32* %287, align 4
  %289 = shl i32 %288, 16
  %290 = lshr i32 %289, 24
  %291 = shl i32 %290, 16
  %292 = or i32 %285, %291
  %293 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %294 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %293, i32 0, i32 1
  %295 = load i32, i32* %294, align 4
  %296 = shl i32 %295, 8
  %297 = lshr i32 %296, 24
  %298 = shl i32 %297, 8
  %299 = or i32 %292, %298
  %300 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %301 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %300, i32 0, i32 1
  %302 = load i32, i32* %301, align 4
  %303 = shl i32 %302, 0
  %304 = lshr i32 %303, 24
  %305 = shl i32 %304, 0
  %306 = or i32 %299, %305
  br label %312

307:                                              ; preds = %269
  %308 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %38, align 8
  %309 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %308, i32 0, i32 1
  %310 = load i32, i32* %309, align 4
  %311 = call i32 @llvm.bswap.i32(i32 %310)
  br label %312

312:                                              ; preds = %307, %279
  %313 = phi i32 [ %306, %279 ], [ %311, %307 ]
  %314 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %315 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %314, i32 0, i32 8
  %316 = bitcast %union.anon* %315 to %struct.anon*
  %317 = getelementptr inbounds %struct.anon, %struct.anon* %316, i32 0, i32 0
  store i32 %313, i32* %317, align 4
  %318 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %319 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %318, i32 0, i32 7
  store i16 0, i16* %319, align 2
  %320 = load i64 (i32*, i32, i32*, i32, i32)*, i64 (i32*, i32, i32*, i32, i32)** @bpf_csum_diff, align 8
  %321 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %322 = bitcast %struct.iphdr* %321 to i32*
  %323 = call i64 %320(i32* noundef null, i32 noundef 0, i32* noundef %322, i32 noundef 20, i32 noundef 0)
  %324 = trunc i64 %323 to i32
  store i32 %324, i32* %8, align 4
  %325 = load i32, i32* %8, align 4
  %326 = and i32 %325, -65536
  %327 = lshr i32 %326, 16
  %328 = load i32, i32* %8, align 4
  %329 = and i32 %328, 65535
  %330 = add i32 %327, %329
  store i32 %330, i32* %8, align 4
  %331 = load i32, i32* %8, align 4
  %332 = and i32 %331, -65536
  %333 = lshr i32 %332, 16
  %334 = load i32, i32* %8, align 4
  %335 = and i32 %334, 65535
  %336 = add i32 %333, %335
  store i32 %336, i32* %8, align 4
  %337 = load i32, i32* %8, align 4
  %338 = trunc i32 %337 to i16
  %339 = zext i16 %338 to i32
  %340 = xor i32 %339, -1
  %341 = trunc i32 %340 to i16
  %342 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %343 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %342, i32 0, i32 7
  store i16 %341, i16* %343, align 2
  %344 = load i8*, i8** %22, align 8
  %345 = getelementptr i8, i8* %344, i64 1200
  %346 = load i8*, i8** %21, align 8
  %347 = icmp ult i8* %345, %346
  br i1 %347, label %348, label %349

348:                                              ; preds = %312
  store i32 2, i32* %19, align 4
  br label %400

349:                                              ; preds = %312
  %350 = load i8*, i8** %22, align 8
  %351 = getelementptr i8, i8* %350, i64 60
  %352 = load i8*, i8** %21, align 8
  %353 = icmp ugt i8* %351, %352
  br i1 %353, label %354, label %355

354:                                              ; preds = %349
  store i32 2, i32* %19, align 4
  br label %400

355:                                              ; preds = %349
  %356 = load i8*, i8** %22, align 8
  %357 = call i32 @calculate_checksum(i8* noundef %356, i32 noundef 60)
  %358 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %23, i32 0, i32 0
  store i32 %357, i32* %358, align 4
  %359 = load i8*, i8** %22, align 8
  %360 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %23, i32 0, i32 0
  %361 = load i32, i32* %360, align 4
  store i8* %359, i8** %16, align 8
  store i32 60, i32* %17, align 4
  store i32 %361, i32* %18, align 4
  %362 = load i32, i32* %17, align 4
  %363 = icmp uge i32 %362, 16
  br i1 %363, label %364, label %379

364:                                              ; preds = %355
  %365 = load i8*, i8** %16, align 8
  %366 = load i32, i32* %17, align 4
  %367 = load i32, i32* %18, align 4
  store i8* %365, i8** %2, align 8
  store i32 %366, i32* %3, align 4
  store i32 %367, i32* %4, align 4
  %368 = load i8*, i8** %2, align 8
  %369 = load i32, i32* %3, align 4
  %370 = load i32, i32* %4, align 4
  %371 = add i32 %370, -1640531535
  %372 = add i32 %371, -2048144777
  %373 = load i32, i32* %4, align 4
  %374 = add i32 %373, -2048144777
  %375 = load i32, i32* %4, align 4
  %376 = load i32, i32* %4, align 4
  %377 = sub i32 %376, -1640531535
  %378 = call i32 @h16bytes_4(i8* noundef %368, i32 noundef %369, i32 noundef %372, i32 noundef %374, i32 noundef %375, i32 noundef %377) #5
  br label %382

379:                                              ; preds = %355
  %380 = load i32, i32* %18, align 4
  %381 = add i32 %380, 374761393
  br label %382

382:                                              ; preds = %364, %379
  %383 = phi i32 [ %378, %364 ], [ %381, %379 ]
  %384 = load i32, i32* %17, align 4
  %385 = add i32 %383, %384
  %386 = load i8*, i8** %16, align 8
  %387 = load i32, i32* %17, align 4
  %388 = and i32 %387, -16
  %389 = zext i32 %388 to i64
  %390 = getelementptr inbounds i8, i8* %386, i64 %389
  %391 = load i32, i32* %17, align 4
  %392 = and i32 %391, 15
  %393 = call i32 @finalize(i32 noundef %385, i8* noundef %390, i32 noundef %392) #5
  %394 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %23, i32 0, i32 1
  store i32 %393, i32* %394, align 4
  %395 = load %struct.iphdr*, %struct.iphdr** %27, align 8
  %396 = bitcast %struct.iphdr* %395 to i8*
  %397 = getelementptr i8, i8* %396, i64 20
  %398 = bitcast %struct.hash_and_sum* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %397, i8* align 4 %398, i64 8, i1 false)
  store i32 3, i32* %19, align 4
  br label %400

399:                                              ; preds = %74
  store i32 2, i32* %19, align 4
  br label %400

400:                                              ; preds = %399, %382, %354, %348, %217, %209, %200, %192, %120, %114, %103, %90, %68, %53
  %401 = load i32, i32* %19, align 4
  ret i32 %401
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @calculate_checksum(i8* noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %7

7:                                                ; preds = %20, %2
  %8 = load i32, i32* %6, align 4
  %9 = load i32, i32* %4, align 4
  %10 = icmp ult i32 %8, %9
  br i1 %10, label %11, label %23

11:                                               ; preds = %7
  %12 = load i8*, i8** %3, align 8
  %13 = load i32, i32* %6, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i8, i8* %12, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = load i32, i32* %5, align 4
  %19 = add i32 %18, %17
  store i32 %19, i32* %5, align 4
  br label %20

20:                                               ; preds = %11
  %21 = load i32, i32* %6, align 4
  %22 = add i32 %21, 1
  store i32 %22, i32* %6, align 4
  br label %7, !llvm.loop !6

23:                                               ; preds = %7
  %24 = load i32, i32* %5, align 4
  ret i32 %24
}

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i32(i32) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #3

; Function Attrs: alwaysinline nounwind uwtable
define internal i32 @finalize(i32 noundef %0, i8* noundef %1, i32 noundef %2) #4 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i8*, align 8
  %21 = alloca i32, align 4
  store i32 %0, i32* %19, align 4
  store i8* %1, i8** %20, align 8
  store i32 %2, i32* %21, align 4
  %22 = load i32, i32* %21, align 4
  %23 = icmp uge i32 %22, 4
  br i1 %23, label %24, label %64

24:                                               ; preds = %3
  %25 = load i32, i32* %19, align 4
  %26 = load i8*, i8** %20, align 8
  store i8* %26, i8** %14, align 8
  %27 = load i8*, i8** %14, align 8
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = load i8*, i8** %14, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  %32 = load i8, i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = shl i32 %33, 8
  %35 = or i32 %29, %34
  %36 = load i8*, i8** %14, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 2
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = shl i32 %39, 16
  %41 = or i32 %35, %40
  %42 = load i8*, i8** %14, align 8
  %43 = getelementptr inbounds i8, i8* %42, i64 3
  %44 = load i8, i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = shl i32 %45, 24
  %47 = or i32 %41, %46
  %48 = mul i32 %47, -1028477379
  %49 = add i32 %25, %48
  store i32 %49, i32* %15, align 4
  store i32 17, i32* %16, align 4
  %50 = load i32, i32* %15, align 4
  %51 = load i32, i32* %16, align 4
  %52 = shl i32 %50, %51
  %53 = load i32, i32* %15, align 4
  %54 = load i32, i32* %16, align 4
  %55 = sub nsw i32 32, %54
  %56 = lshr i32 %53, %55
  %57 = or i32 %52, %56
  %58 = mul i32 %57, 668265263
  %59 = load i8*, i8** %20, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 4
  %61 = load i32, i32* %21, align 4
  %62 = sub i32 %61, 4
  %63 = call i32 @finalize(i32 noundef %58, i8* noundef %60, i32 noundef %62)
  br label %114

64:                                               ; preds = %3
  %65 = load i32, i32* %21, align 4
  %66 = icmp ugt i32 %65, 0
  br i1 %66, label %67, label %88

67:                                               ; preds = %64
  %68 = load i32, i32* %19, align 4
  %69 = load i8*, i8** %20, align 8
  %70 = load i8, i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = mul i32 %71, 374761393
  %73 = add i32 %68, %72
  store i32 %73, i32* %17, align 4
  store i32 11, i32* %18, align 4
  %74 = load i32, i32* %17, align 4
  %75 = load i32, i32* %18, align 4
  %76 = shl i32 %74, %75
  %77 = load i32, i32* %17, align 4
  %78 = load i32, i32* %18, align 4
  %79 = sub nsw i32 32, %78
  %80 = lshr i32 %77, %79
  %81 = or i32 %76, %80
  %82 = mul i32 %81, -1640531535
  %83 = load i8*, i8** %20, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 1
  %85 = load i32, i32* %21, align 4
  %86 = sub i32 %85, 1
  %87 = call i32 @finalize(i32 noundef %82, i8* noundef %84, i32 noundef %86)
  br label %112

88:                                               ; preds = %64
  %89 = load i32, i32* %19, align 4
  store i32 %89, i32* %13, align 4
  %90 = load i32, i32* %13, align 4
  store i32 %90, i32* %4, align 4
  store i32 15, i32* %5, align 4
  store i32 -2048144777, i32* %6, align 4
  %91 = load i32, i32* %4, align 4
  %92 = load i32, i32* %4, align 4
  %93 = load i32, i32* %5, align 4
  %94 = lshr i32 %92, %93
  %95 = xor i32 %91, %94
  %96 = load i32, i32* %6, align 4
  %97 = mul i32 %95, %96
  store i32 %97, i32* %7, align 4
  store i32 13, i32* %8, align 4
  store i32 -1028477379, i32* %9, align 4
  %98 = load i32, i32* %7, align 4
  %99 = load i32, i32* %7, align 4
  %100 = load i32, i32* %8, align 4
  %101 = lshr i32 %99, %100
  %102 = xor i32 %98, %101
  %103 = load i32, i32* %9, align 4
  %104 = mul i32 %102, %103
  store i32 %104, i32* %10, align 4
  store i32 16, i32* %11, align 4
  store i32 1, i32* %12, align 4
  %105 = load i32, i32* %10, align 4
  %106 = load i32, i32* %10, align 4
  %107 = load i32, i32* %11, align 4
  %108 = lshr i32 %106, %107
  %109 = xor i32 %105, %108
  %110 = load i32, i32* %12, align 4
  %111 = mul i32 %109, %110
  br label %112

112:                                              ; preds = %88, %67
  %113 = phi i32 [ %87, %67 ], [ %111, %88 ]
  br label %114

114:                                              ; preds = %112, %24
  %115 = phi i32 [ %63, %24 ], [ %113, %112 ]
  ret i32 %115
}

; Function Attrs: alwaysinline nounwind uwtable
define internal i32 @h16bytes_4(i8* noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #4 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i32, align 4
  %26 = alloca i8*, align 8
  %27 = alloca i8*, align 8
  %28 = alloca i32, align 4
  %29 = alloca i8*, align 8
  %30 = alloca i8*, align 8
  %31 = alloca i32, align 4
  %32 = alloca i8*, align 8
  %33 = alloca i8*, align 8
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i8*, align 8
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  store i8* %0, i8** %43, align 8
  store i32 %1, i32* %44, align 4
  store i32 %2, i32* %45, align 4
  store i32 %3, i32* %46, align 4
  store i32 %4, i32* %47, align 4
  store i32 %5, i32* %48, align 4
  %49 = load i32, i32* %44, align 4
  %50 = icmp uge i32 %49, 16
  br i1 %50, label %51, label %212

51:                                               ; preds = %6
  %52 = load i8*, i8** %43, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 16
  %54 = load i32, i32* %44, align 4
  %55 = sub i32 %54, 16
  %56 = load i8*, i8** %43, align 8
  %57 = load i32, i32* %45, align 4
  store i8* %56, i8** %24, align 8
  store i32 %57, i32* %25, align 4
  %58 = load i32, i32* %25, align 4
  %59 = load i8*, i8** %24, align 8
  store i8* %59, i8** %23, align 8
  %60 = load i8*, i8** %23, align 8
  %61 = load i8, i8* %60, align 1
  %62 = zext i8 %61 to i32
  %63 = load i8*, i8** %23, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 1
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = shl i32 %66, 8
  %68 = or i32 %62, %67
  %69 = load i8*, i8** %23, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 2
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = shl i32 %72, 16
  %74 = or i32 %68, %73
  %75 = load i8*, i8** %23, align 8
  %76 = getelementptr inbounds i8, i8* %75, i64 3
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = shl i32 %78, 24
  %80 = or i32 %74, %79
  store i32 %58, i32* %21, align 4
  store i32 %80, i32* %22, align 4
  %81 = load i32, i32* %21, align 4
  %82 = load i32, i32* %22, align 4
  %83 = mul i32 %82, -2048144777
  %84 = add i32 %81, %83
  store i32 %84, i32* %19, align 4
  store i32 13, i32* %20, align 4
  %85 = load i32, i32* %19, align 4
  %86 = load i32, i32* %20, align 4
  %87 = shl i32 %85, %86
  %88 = load i32, i32* %19, align 4
  %89 = load i32, i32* %20, align 4
  %90 = sub nsw i32 32, %89
  %91 = lshr i32 %88, %90
  %92 = or i32 %87, %91
  %93 = mul i32 %92, -1640531535
  %94 = load i8*, i8** %43, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 4
  %96 = load i32, i32* %46, align 4
  store i8* %95, i8** %27, align 8
  store i32 %96, i32* %28, align 4
  %97 = load i32, i32* %28, align 4
  %98 = load i8*, i8** %27, align 8
  store i8* %98, i8** %26, align 8
  %99 = load i8*, i8** %26, align 8
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = load i8*, i8** %26, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 1
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = shl i32 %105, 8
  %107 = or i32 %101, %106
  %108 = load i8*, i8** %26, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 2
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = shl i32 %111, 16
  %113 = or i32 %107, %112
  %114 = load i8*, i8** %26, align 8
  %115 = getelementptr inbounds i8, i8* %114, i64 3
  %116 = load i8, i8* %115, align 1
  %117 = zext i8 %116 to i32
  %118 = shl i32 %117, 24
  %119 = or i32 %113, %118
  store i32 %97, i32* %17, align 4
  store i32 %119, i32* %18, align 4
  %120 = load i32, i32* %17, align 4
  %121 = load i32, i32* %18, align 4
  %122 = mul i32 %121, -2048144777
  %123 = add i32 %120, %122
  store i32 %123, i32* %15, align 4
  store i32 13, i32* %16, align 4
  %124 = load i32, i32* %15, align 4
  %125 = load i32, i32* %16, align 4
  %126 = shl i32 %124, %125
  %127 = load i32, i32* %15, align 4
  %128 = load i32, i32* %16, align 4
  %129 = sub nsw i32 32, %128
  %130 = lshr i32 %127, %129
  %131 = or i32 %126, %130
  %132 = mul i32 %131, -1640531535
  %133 = load i8*, i8** %43, align 8
  %134 = getelementptr inbounds i8, i8* %133, i64 8
  %135 = load i32, i32* %47, align 4
  store i8* %134, i8** %30, align 8
  store i32 %135, i32* %31, align 4
  %136 = load i32, i32* %31, align 4
  %137 = load i8*, i8** %30, align 8
  store i8* %137, i8** %29, align 8
  %138 = load i8*, i8** %29, align 8
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i32
  %141 = load i8*, i8** %29, align 8
  %142 = getelementptr inbounds i8, i8* %141, i64 1
  %143 = load i8, i8* %142, align 1
  %144 = zext i8 %143 to i32
  %145 = shl i32 %144, 8
  %146 = or i32 %140, %145
  %147 = load i8*, i8** %29, align 8
  %148 = getelementptr inbounds i8, i8* %147, i64 2
  %149 = load i8, i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = shl i32 %150, 16
  %152 = or i32 %146, %151
  %153 = load i8*, i8** %29, align 8
  %154 = getelementptr inbounds i8, i8* %153, i64 3
  %155 = load i8, i8* %154, align 1
  %156 = zext i8 %155 to i32
  %157 = shl i32 %156, 24
  %158 = or i32 %152, %157
  store i32 %136, i32* %13, align 4
  store i32 %158, i32* %14, align 4
  %159 = load i32, i32* %13, align 4
  %160 = load i32, i32* %14, align 4
  %161 = mul i32 %160, -2048144777
  %162 = add i32 %159, %161
  store i32 %162, i32* %11, align 4
  store i32 13, i32* %12, align 4
  %163 = load i32, i32* %11, align 4
  %164 = load i32, i32* %12, align 4
  %165 = shl i32 %163, %164
  %166 = load i32, i32* %11, align 4
  %167 = load i32, i32* %12, align 4
  %168 = sub nsw i32 32, %167
  %169 = lshr i32 %166, %168
  %170 = or i32 %165, %169
  %171 = mul i32 %170, -1640531535
  %172 = load i8*, i8** %43, align 8
  %173 = getelementptr inbounds i8, i8* %172, i64 12
  %174 = load i32, i32* %48, align 4
  store i8* %173, i8** %33, align 8
  store i32 %174, i32* %34, align 4
  %175 = load i32, i32* %34, align 4
  %176 = load i8*, i8** %33, align 8
  store i8* %176, i8** %32, align 8
  %177 = load i8*, i8** %32, align 8
  %178 = load i8, i8* %177, align 1
  %179 = zext i8 %178 to i32
  %180 = load i8*, i8** %32, align 8
  %181 = getelementptr inbounds i8, i8* %180, i64 1
  %182 = load i8, i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = shl i32 %183, 8
  %185 = or i32 %179, %184
  %186 = load i8*, i8** %32, align 8
  %187 = getelementptr inbounds i8, i8* %186, i64 2
  %188 = load i8, i8* %187, align 1
  %189 = zext i8 %188 to i32
  %190 = shl i32 %189, 16
  %191 = or i32 %185, %190
  %192 = load i8*, i8** %32, align 8
  %193 = getelementptr inbounds i8, i8* %192, i64 3
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = shl i32 %195, 24
  %197 = or i32 %191, %196
  store i32 %175, i32* %9, align 4
  store i32 %197, i32* %10, align 4
  %198 = load i32, i32* %9, align 4
  %199 = load i32, i32* %10, align 4
  %200 = mul i32 %199, -2048144777
  %201 = add i32 %198, %200
  store i32 %201, i32* %7, align 4
  store i32 13, i32* %8, align 4
  %202 = load i32, i32* %7, align 4
  %203 = load i32, i32* %8, align 4
  %204 = shl i32 %202, %203
  %205 = load i32, i32* %7, align 4
  %206 = load i32, i32* %8, align 4
  %207 = sub nsw i32 32, %206
  %208 = lshr i32 %205, %207
  %209 = or i32 %204, %208
  %210 = mul i32 %209, -1640531535
  %211 = call i32 @h16bytes_4(i8* noundef %53, i32 noundef %55, i32 noundef %93, i32 noundef %132, i32 noundef %171, i32 noundef %210)
  br label %252

212:                                              ; preds = %6
  %213 = load i32, i32* %45, align 4
  store i32 %213, i32* %35, align 4
  store i32 1, i32* %36, align 4
  %214 = load i32, i32* %35, align 4
  %215 = load i32, i32* %36, align 4
  %216 = shl i32 %214, %215
  %217 = load i32, i32* %35, align 4
  %218 = load i32, i32* %36, align 4
  %219 = sub nsw i32 32, %218
  %220 = lshr i32 %217, %219
  %221 = or i32 %216, %220
  %222 = load i32, i32* %46, align 4
  store i32 %222, i32* %37, align 4
  store i32 7, i32* %38, align 4
  %223 = load i32, i32* %37, align 4
  %224 = load i32, i32* %38, align 4
  %225 = shl i32 %223, %224
  %226 = load i32, i32* %37, align 4
  %227 = load i32, i32* %38, align 4
  %228 = sub nsw i32 32, %227
  %229 = lshr i32 %226, %228
  %230 = or i32 %225, %229
  %231 = add i32 %221, %230
  %232 = load i32, i32* %47, align 4
  store i32 %232, i32* %39, align 4
  store i32 12, i32* %40, align 4
  %233 = load i32, i32* %39, align 4
  %234 = load i32, i32* %40, align 4
  %235 = shl i32 %233, %234
  %236 = load i32, i32* %39, align 4
  %237 = load i32, i32* %40, align 4
  %238 = sub nsw i32 32, %237
  %239 = lshr i32 %236, %238
  %240 = or i32 %235, %239
  %241 = add i32 %231, %240
  %242 = load i32, i32* %48, align 4
  store i32 %242, i32* %41, align 4
  store i32 18, i32* %42, align 4
  %243 = load i32, i32* %41, align 4
  %244 = load i32, i32* %42, align 4
  %245 = shl i32 %243, %244
  %246 = load i32, i32* %41, align 4
  %247 = load i32, i32* %42, align 4
  %248 = sub nsw i32 32, %247
  %249 = lshr i32 %246, %248
  %250 = or i32 %245, %249
  %251 = add i32 %241, %250
  br label %252

252:                                              ; preds = %212, %51
  %253 = phi i32 [ %211, %51 ], [ %251, %212 ]
  ret i32 %253
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { convergent nofree nosync nounwind readnone willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { alwaysinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

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

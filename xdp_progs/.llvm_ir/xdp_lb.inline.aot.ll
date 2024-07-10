; ModuleID = 'xdp_lb.bpf.c'
source_filename = "xdp_lb.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ip_mac_pair = type { %struct.eth_addr, i32 }
%struct.eth_addr = type { [6 x i8] }
%struct.anon.1 = type { [2 x i32]*, i32*, %struct.ip_mac_pair*, [64 x i32]* }
%struct.anon.2 = type { [2 x i32]*, i32*, %struct.ip_mac_pair*, [64 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.hash_and_sum = type { i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon }
%struct.anon = type { i32, i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }

@__const.xdp_pass.____fmt = private unnamed_addr constant [22 x i8] c"Out of bounds ethhdr\0A\00", align 16
@__const.xdp_pass.____fmt.1 = private unnamed_addr constant [21 x i8] c"Out of bounds iphdr\0A\00", align 16
@__const.xdp_pass.____fmt.2 = private unnamed_addr constant [22 x i8] c"Out of bounds tcphdr\0A\00", align 16
@config_map_id = internal constant i64 17179869184, align 8
@__const.xdp_pass.____fmt.3 = private unnamed_addr constant [25 x i8] c"Client config not found\0A\00", align 16
@targets_map_id = internal constant i64 21474836480, align 8
@LICENSE = dso_local global [4 x i8] c"GPL\00", align 1
@__config_map = dso_local global [64 x %struct.ip_mac_pair] zeroinitializer, align 16
@__targets_map = dso_local global [64 x %struct.ip_mac_pair] zeroinitializer, align 16
@targets_map = dso_local global %struct.anon.1 zeroinitializer, align 8
@config_map = dso_local global %struct.anon.2 zeroinitializer, align 8

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
  %19 = alloca i8*, align 8
  %20 = alloca i64*, align 8
  %21 = alloca i8*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i64*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i8*, align 8
  %26 = alloca i64*, align 8
  %27 = alloca i8*, align 8
  %28 = alloca i8*, align 8
  %29 = alloca i64*, align 8
  %30 = alloca i8*, align 8
  %31 = alloca i8*, align 8
  %32 = alloca i64*, align 8
  %33 = alloca i8*, align 8
  %34 = alloca i32, align 4
  %35 = alloca %struct.xdp_md*, align 8
  %36 = alloca i8*, align 8
  %37 = alloca i8*, align 8
  %38 = alloca %struct.hash_and_sum, align 4
  %39 = alloca %struct.ethhdr*, align 8
  %40 = alloca [22 x i8], align 16
  %41 = alloca i32, align 4
  %42 = alloca %struct.iphdr*, align 8
  %43 = alloca [21 x i8], align 16
  %44 = alloca i32, align 4
  %45 = alloca %struct.tcphdr*, align 8
  %46 = alloca [22 x i8], align 16
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca %struct.ip_mac_pair*, align 8
  %50 = alloca [25 x i8], align 16
  %51 = alloca i32, align 4
  %52 = alloca %struct.ip_mac_pair*, align 8
  %53 = alloca %struct.ip_mac_pair*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %35, align 8
  %54 = load %struct.xdp_md*, %struct.xdp_md** %35, align 8
  %55 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %54, i32 0, i32 1
  %56 = load i64, i64* %55, align 8
  %57 = inttoptr i64 %56 to i8*
  store i8* %57, i8** %36, align 8
  %58 = load %struct.xdp_md*, %struct.xdp_md** %35, align 8
  %59 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %58, i32 0, i32 0
  %60 = load i64, i64* %59, align 8
  %61 = inttoptr i64 %60 to i8*
  store i8* %61, i8** %37, align 8
  %62 = load i8*, i8** %37, align 8
  %63 = bitcast i8* %62 to %struct.ethhdr*
  store %struct.ethhdr* %63, %struct.ethhdr** %39, align 8
  %64 = load i8*, i8** %37, align 8
  %65 = getelementptr i8, i8* %64, i64 14
  %66 = load i8*, i8** %36, align 8
  %67 = icmp ugt i8* %65, %66
  br i1 %67, label %68, label %73

68:                                               ; preds = %1
  %69 = bitcast [22 x i8]* %40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %69, i8* align 16 getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt, i32 0, i32 0), i64 22, i1 false)
  %70 = getelementptr inbounds [22 x i8], [22 x i8]* %40, i64 0, i64 0
  %71 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %70, i64 noundef 22)
  store i32 %71, i32* %41, align 4
  %72 = load i32, i32* %41, align 4
  store i32 1, i32* %34, align 4
  br label %539

73:                                               ; preds = %1
  %74 = load i8*, i8** %37, align 8
  %75 = getelementptr i8, i8* %74, i64 14
  %76 = bitcast i8* %75 to %struct.iphdr*
  store %struct.iphdr* %76, %struct.iphdr** %42, align 8
  %77 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %78 = bitcast %struct.iphdr* %77 to i8*
  %79 = getelementptr i8, i8* %78, i64 20
  %80 = load i8*, i8** %36, align 8
  %81 = icmp ugt i8* %79, %80
  br i1 %81, label %82, label %87

82:                                               ; preds = %73
  %83 = bitcast [21 x i8]* %43 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %83, i8* align 16 getelementptr inbounds ([21 x i8], [21 x i8]* @__const.xdp_pass.____fmt.1, i32 0, i32 0), i64 21, i1 false)
  %84 = getelementptr inbounds [21 x i8], [21 x i8]* %43, i64 0, i64 0
  %85 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %84, i64 noundef 21)
  store i32 %85, i32* %44, align 4
  %86 = load i32, i32* %44, align 4
  store i32 1, i32* %34, align 4
  br label %539

87:                                               ; preds = %73
  %88 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %89 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %88, i32 0, i32 6
  %90 = load i8, i8* %89, align 1
  %91 = zext i8 %90 to i32
  %92 = icmp eq i32 %91, 6
  br i1 %92, label %93, label %538

93:                                               ; preds = %87
  %94 = load i8*, i8** %37, align 8
  %95 = getelementptr i8, i8* %94, i64 14
  %96 = getelementptr i8, i8* %95, i64 20
  %97 = bitcast i8* %96 to %struct.tcphdr*
  store %struct.tcphdr* %97, %struct.tcphdr** %45, align 8
  %98 = load %struct.tcphdr*, %struct.tcphdr** %45, align 8
  %99 = bitcast %struct.tcphdr* %98 to i8*
  %100 = getelementptr i8, i8* %99, i64 20
  %101 = load i8*, i8** %36, align 8
  %102 = icmp ugt i8* %100, %101
  br i1 %102, label %103, label %108

103:                                              ; preds = %93
  %104 = bitcast [22 x i8]* %46 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %104, i8* align 16 getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt.2, i32 0, i32 0), i64 22, i1 false)
  %105 = getelementptr inbounds [22 x i8], [22 x i8]* %46, i64 0, i64 0
  %106 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %105, i64 noundef 22)
  store i32 %106, i32* %47, align 4
  %107 = load i32, i32* %47, align 4
  store i32 1, i32* %34, align 4
  br label %539

108:                                              ; preds = %93
  store i32 1, i32* %48, align 4
  %109 = bitcast i32* %48 to i8*
  store i64* @config_map_id, i64** %20, align 8
  store i8* %109, i8** %21, align 8
  %110 = load i64*, i64** %20, align 8
  %111 = load i64, i64* %110, align 8
  %112 = icmp eq i64 %111, 17179869184
  br i1 %112, label %113, label %120

113:                                              ; preds = %108
  %114 = load i8*, i8** %21, align 8
  %115 = bitcast i8* %114 to i32*
  %116 = load i32, i32* %115, align 4
  %117 = zext i32 %116 to i64
  %118 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__config_map, i64 0, i64 %117
  %119 = bitcast %struct.ip_mac_pair* %118 to i8*
  store i8* %119, i8** %19, align 8
  br label %136

120:                                              ; preds = %108
  %121 = load i64*, i64** %20, align 8
  %122 = load i64, i64* %121, align 8
  %123 = icmp eq i64 %122, 21474836480
  br i1 %123, label %124, label %131

124:                                              ; preds = %120
  %125 = load i8*, i8** %21, align 8
  %126 = bitcast i8* %125 to i32*
  %127 = load i32, i32* %126, align 4
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__targets_map, i64 0, i64 %128
  %130 = bitcast %struct.ip_mac_pair* %129 to i8*
  store i8* %130, i8** %19, align 8
  br label %136

131:                                              ; preds = %120
  %132 = load i64*, i64** %20, align 8
  %133 = load i64, i64* %132, align 8
  %134 = load i8*, i8** %21, align 8
  %135 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %133, i8* noundef %134) #6
  store i8* %135, i8** %19, align 8
  br label %136

136:                                              ; preds = %113, %124, %131
  %137 = load i8*, i8** %19, align 8
  %138 = bitcast i8* %137 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %138, %struct.ip_mac_pair** %49, align 8
  %139 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %49, align 8
  %140 = icmp ne %struct.ip_mac_pair* %139, null
  br i1 %140, label %146, label %141

141:                                              ; preds = %136
  %142 = bitcast [25 x i8]* %50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %142, i8* align 16 getelementptr inbounds ([25 x i8], [25 x i8]* @__const.xdp_pass.____fmt.3, i32 0, i32 0), i64 25, i1 false)
  %143 = getelementptr inbounds [25 x i8], [25 x i8]* %50, i64 0, i64 0
  %144 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %143, i64 noundef 25)
  store i32 %144, i32* %51, align 4
  %145 = load i32, i32* %51, align 4
  store i32 0, i32* %34, align 4
  br label %539

146:                                              ; preds = %136
  %147 = load i8*, i8** %37, align 8
  %148 = getelementptr i8, i8* %147, i64 1200
  %149 = load i8*, i8** %36, align 8
  %150 = icmp ult i8* %148, %149
  br i1 %150, label %151, label %152

151:                                              ; preds = %146
  store i32 2, i32* %34, align 4
  br label %539

152:                                              ; preds = %146
  %153 = load i8*, i8** %37, align 8
  %154 = getelementptr i8, i8* %153, i64 60
  %155 = load i8*, i8** %36, align 8
  %156 = icmp ugt i8* %154, %155
  br i1 %156, label %157, label %158

157:                                              ; preds = %152
  store i32 2, i32* %34, align 4
  br label %539

158:                                              ; preds = %152
  %159 = load i8*, i8** %37, align 8
  %160 = call i32 @calculate_checksum(i8* noundef %159, i32 noundef 60)
  %161 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %38, i32 0, i32 0
  store i32 %160, i32* %161, align 4
  %162 = load i8*, i8** %37, align 8
  %163 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %38, i32 0, i32 0
  %164 = load i32, i32* %163, align 4
  store i8* %162, i8** %13, align 8
  store i32 60, i32* %14, align 4
  store i32 %164, i32* %15, align 4
  %165 = load i32, i32* %14, align 4
  %166 = icmp uge i32 %165, 16
  br i1 %166, label %167, label %182

167:                                              ; preds = %158
  %168 = load i8*, i8** %13, align 8
  %169 = load i32, i32* %14, align 4
  %170 = load i32, i32* %15, align 4
  store i8* %168, i8** %5, align 8
  store i32 %169, i32* %6, align 4
  store i32 %170, i32* %7, align 4
  %171 = load i8*, i8** %5, align 8
  %172 = load i32, i32* %6, align 4
  %173 = load i32, i32* %7, align 4
  %174 = add i32 %173, -1640531535
  %175 = add i32 %174, -2048144777
  %176 = load i32, i32* %7, align 4
  %177 = add i32 %176, -2048144777
  %178 = load i32, i32* %7, align 4
  %179 = load i32, i32* %7, align 4
  %180 = sub i32 %179, -1640531535
  %181 = call i32 @h16bytes_4(i8* noundef %171, i32 noundef %172, i32 noundef %175, i32 noundef %177, i32 noundef %178, i32 noundef %180) #6
  br label %185

182:                                              ; preds = %158
  %183 = load i32, i32* %15, align 4
  %184 = add i32 %183, 374761393
  br label %185

185:                                              ; preds = %167, %182
  %186 = phi i32 [ %181, %167 ], [ %184, %182 ]
  %187 = load i32, i32* %14, align 4
  %188 = add i32 %186, %187
  %189 = load i8*, i8** %13, align 8
  %190 = load i32, i32* %14, align 4
  %191 = and i32 %190, -16
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds i8, i8* %189, i64 %192
  %194 = load i32, i32* %14, align 4
  %195 = and i32 %194, 15
  %196 = call i32 @finalize(i32 noundef %188, i8* noundef %193, i32 noundef %195) #6
  %197 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %38, i32 0, i32 1
  store i32 %196, i32* %197, align 4
  %198 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %38, i32 0, i32 1
  %199 = load i32, i32* %198, align 4
  %200 = udiv i32 %199, 2
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %202, label %291

202:                                              ; preds = %185
  %203 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %204 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %203, i32 0, i32 8
  %205 = bitcast %union.anon* %204 to %struct.anon*
  %206 = getelementptr inbounds %struct.anon, %struct.anon* %205, i32 0, i32 0
  %207 = load i32, i32* %206, align 4
  %208 = load %struct.tcphdr*, %struct.tcphdr** %45, align 8
  %209 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %208, i32 0, i32 0
  %210 = load i16, i16* %209, align 4
  %211 = load %struct.tcphdr*, %struct.tcphdr** %45, align 8
  %212 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %211, i32 0, i32 1
  %213 = load i16, i16* %212, align 2
  store i32 %207, i32* %9, align 4
  store i16 %210, i16* %10, align 2
  store i16 %213, i16* %11, align 2
  %214 = load i32, i32* %9, align 4
  %215 = load i16, i16* %10, align 2
  %216 = zext i16 %215 to i32
  %217 = xor i32 %214, %216
  %218 = load i16, i16* %11, align 2
  %219 = zext i16 %218 to i32
  %220 = xor i32 %217, %219
  %221 = and i32 %220, 1
  store i32 %221, i32* %12, align 4
  %222 = load i32, i32* %12, align 4
  store i32 %222, i32* %48, align 4
  %223 = bitcast i32* %48 to i8*
  store i64* @targets_map_id, i64** %23, align 8
  store i8* %223, i8** %24, align 8
  %224 = load i64*, i64** %23, align 8
  %225 = load i64, i64* %224, align 8
  %226 = icmp eq i64 %225, 17179869184
  br i1 %226, label %227, label %234

227:                                              ; preds = %202
  %228 = load i8*, i8** %24, align 8
  %229 = bitcast i8* %228 to i32*
  %230 = load i32, i32* %229, align 4
  %231 = zext i32 %230 to i64
  %232 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__config_map, i64 0, i64 %231
  %233 = bitcast %struct.ip_mac_pair* %232 to i8*
  store i8* %233, i8** %22, align 8
  br label %250

234:                                              ; preds = %202
  %235 = load i64*, i64** %23, align 8
  %236 = load i64, i64* %235, align 8
  %237 = icmp eq i64 %236, 21474836480
  br i1 %237, label %238, label %245

238:                                              ; preds = %234
  %239 = load i8*, i8** %24, align 8
  %240 = bitcast i8* %239 to i32*
  %241 = load i32, i32* %240, align 4
  %242 = zext i32 %241 to i64
  %243 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__targets_map, i64 0, i64 %242
  %244 = bitcast %struct.ip_mac_pair* %243 to i8*
  store i8* %244, i8** %22, align 8
  br label %250

245:                                              ; preds = %234
  %246 = load i64*, i64** %23, align 8
  %247 = load i64, i64* %246, align 8
  %248 = load i8*, i8** %24, align 8
  %249 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %247, i8* noundef %248) #6
  store i8* %249, i8** %22, align 8
  br label %250

250:                                              ; preds = %227, %238, %245
  %251 = load i8*, i8** %22, align 8
  %252 = bitcast i8* %251 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %252, %struct.ip_mac_pair** %52, align 8
  %253 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %254 = icmp ne %struct.ip_mac_pair* %253, null
  br i1 %254, label %256, label %255

255:                                              ; preds = %250
  store i32 0, i32* %34, align 4
  br label %539

256:                                              ; preds = %250
  store i32 0, i32* %48, align 4
  %257 = bitcast i32* %48 to i8*
  store i64* @config_map_id, i64** %26, align 8
  store i8* %257, i8** %27, align 8
  %258 = load i64*, i64** %26, align 8
  %259 = load i64, i64* %258, align 8
  %260 = icmp eq i64 %259, 17179869184
  br i1 %260, label %261, label %268

261:                                              ; preds = %256
  %262 = load i8*, i8** %27, align 8
  %263 = bitcast i8* %262 to i32*
  %264 = load i32, i32* %263, align 4
  %265 = zext i32 %264 to i64
  %266 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__config_map, i64 0, i64 %265
  %267 = bitcast %struct.ip_mac_pair* %266 to i8*
  store i8* %267, i8** %25, align 8
  br label %284

268:                                              ; preds = %256
  %269 = load i64*, i64** %26, align 8
  %270 = load i64, i64* %269, align 8
  %271 = icmp eq i64 %270, 21474836480
  br i1 %271, label %272, label %279

272:                                              ; preds = %268
  %273 = load i8*, i8** %27, align 8
  %274 = bitcast i8* %273 to i32*
  %275 = load i32, i32* %274, align 4
  %276 = zext i32 %275 to i64
  %277 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__targets_map, i64 0, i64 %276
  %278 = bitcast %struct.ip_mac_pair* %277 to i8*
  store i8* %278, i8** %25, align 8
  br label %284

279:                                              ; preds = %268
  %280 = load i64*, i64** %26, align 8
  %281 = load i64, i64* %280, align 8
  %282 = load i8*, i8** %27, align 8
  %283 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %281, i8* noundef %282) #6
  store i8* %283, i8** %25, align 8
  br label %284

284:                                              ; preds = %261, %272, %279
  %285 = load i8*, i8** %25, align 8
  %286 = bitcast i8* %285 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %286, %struct.ip_mac_pair** %53, align 8
  %287 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %288 = icmp ne %struct.ip_mac_pair* %287, null
  br i1 %288, label %290, label %289

289:                                              ; preds = %284
  store i32 0, i32* %34, align 4
  br label %539

290:                                              ; preds = %284
  br label %360

291:                                              ; preds = %185
  store i32 1, i32* %48, align 4
  %292 = bitcast i32* %48 to i8*
  store i64* @config_map_id, i64** %29, align 8
  store i8* %292, i8** %30, align 8
  %293 = load i64*, i64** %29, align 8
  %294 = load i64, i64* %293, align 8
  %295 = icmp eq i64 %294, 17179869184
  br i1 %295, label %296, label %303

296:                                              ; preds = %291
  %297 = load i8*, i8** %30, align 8
  %298 = bitcast i8* %297 to i32*
  %299 = load i32, i32* %298, align 4
  %300 = zext i32 %299 to i64
  %301 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__config_map, i64 0, i64 %300
  %302 = bitcast %struct.ip_mac_pair* %301 to i8*
  store i8* %302, i8** %28, align 8
  br label %319

303:                                              ; preds = %291
  %304 = load i64*, i64** %29, align 8
  %305 = load i64, i64* %304, align 8
  %306 = icmp eq i64 %305, 21474836480
  br i1 %306, label %307, label %314

307:                                              ; preds = %303
  %308 = load i8*, i8** %30, align 8
  %309 = bitcast i8* %308 to i32*
  %310 = load i32, i32* %309, align 4
  %311 = zext i32 %310 to i64
  %312 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__targets_map, i64 0, i64 %311
  %313 = bitcast %struct.ip_mac_pair* %312 to i8*
  store i8* %313, i8** %28, align 8
  br label %319

314:                                              ; preds = %303
  %315 = load i64*, i64** %29, align 8
  %316 = load i64, i64* %315, align 8
  %317 = load i8*, i8** %30, align 8
  %318 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %316, i8* noundef %317) #6
  store i8* %318, i8** %28, align 8
  br label %319

319:                                              ; preds = %296, %307, %314
  %320 = load i8*, i8** %28, align 8
  %321 = bitcast i8* %320 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %321, %struct.ip_mac_pair** %52, align 8
  %322 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %323 = icmp ne %struct.ip_mac_pair* %322, null
  br i1 %323, label %325, label %324

324:                                              ; preds = %319
  store i32 0, i32* %34, align 4
  br label %539

325:                                              ; preds = %319
  store i32 0, i32* %48, align 4
  %326 = bitcast i32* %48 to i8*
  store i64* @config_map_id, i64** %32, align 8
  store i8* %326, i8** %33, align 8
  %327 = load i64*, i64** %32, align 8
  %328 = load i64, i64* %327, align 8
  %329 = icmp eq i64 %328, 17179869184
  br i1 %329, label %330, label %337

330:                                              ; preds = %325
  %331 = load i8*, i8** %33, align 8
  %332 = bitcast i8* %331 to i32*
  %333 = load i32, i32* %332, align 4
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__config_map, i64 0, i64 %334
  %336 = bitcast %struct.ip_mac_pair* %335 to i8*
  store i8* %336, i8** %31, align 8
  br label %353

337:                                              ; preds = %325
  %338 = load i64*, i64** %32, align 8
  %339 = load i64, i64* %338, align 8
  %340 = icmp eq i64 %339, 21474836480
  br i1 %340, label %341, label %348

341:                                              ; preds = %337
  %342 = load i8*, i8** %33, align 8
  %343 = bitcast i8* %342 to i32*
  %344 = load i32, i32* %343, align 4
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds [64 x %struct.ip_mac_pair], [64 x %struct.ip_mac_pair]* @__targets_map, i64 0, i64 %345
  %347 = bitcast %struct.ip_mac_pair* %346 to i8*
  store i8* %347, i8** %31, align 8
  br label %353

348:                                              ; preds = %337
  %349 = load i64*, i64** %32, align 8
  %350 = load i64, i64* %349, align 8
  %351 = load i8*, i8** %33, align 8
  %352 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %350, i8* noundef %351) #6
  store i8* %352, i8** %31, align 8
  br label %353

353:                                              ; preds = %330, %341, %348
  %354 = load i8*, i8** %31, align 8
  %355 = bitcast i8* %354 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %355, %struct.ip_mac_pair** %53, align 8
  %356 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %357 = icmp ne %struct.ip_mac_pair* %356, null
  br i1 %357, label %359, label %358

358:                                              ; preds = %353
  store i32 0, i32* %34, align 4
  br label %539

359:                                              ; preds = %353
  br label %360

360:                                              ; preds = %359, %290
  %361 = load %struct.ethhdr*, %struct.ethhdr** %39, align 8
  %362 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %361, i32 0, i32 0
  %363 = getelementptr inbounds [6 x i8], [6 x i8]* %362, i64 0, i64 0
  %364 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %365 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %364, i32 0, i32 0
  %366 = bitcast %struct.eth_addr* %365 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %363, i8* align 4 %366, i64 6, i1 false)
  %367 = load %struct.ethhdr*, %struct.ethhdr** %39, align 8
  %368 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %367, i32 0, i32 1
  %369 = getelementptr inbounds [6 x i8], [6 x i8]* %368, i64 0, i64 0
  %370 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %371 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %370, i32 0, i32 0
  %372 = bitcast %struct.eth_addr* %371 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %369, i8* align 4 %372, i64 6, i1 false)
  %373 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %374 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %373, i32 0, i32 1
  %375 = load i32, i32* %374, align 4
  %376 = call i1 @llvm.is.constant.i32(i32 %375)
  br i1 %376, label %377, label %405

377:                                              ; preds = %360
  %378 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %379 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %378, i32 0, i32 1
  %380 = load i32, i32* %379, align 4
  %381 = shl i32 %380, 24
  %382 = lshr i32 %381, 24
  %383 = shl i32 %382, 24
  %384 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %385 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %384, i32 0, i32 1
  %386 = load i32, i32* %385, align 4
  %387 = shl i32 %386, 16
  %388 = lshr i32 %387, 24
  %389 = shl i32 %388, 16
  %390 = or i32 %383, %389
  %391 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %392 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %391, i32 0, i32 1
  %393 = load i32, i32* %392, align 4
  %394 = shl i32 %393, 8
  %395 = lshr i32 %394, 24
  %396 = shl i32 %395, 8
  %397 = or i32 %390, %396
  %398 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %399 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %398, i32 0, i32 1
  %400 = load i32, i32* %399, align 4
  %401 = shl i32 %400, 0
  %402 = lshr i32 %401, 24
  %403 = shl i32 %402, 0
  %404 = or i32 %397, %403
  br label %410

405:                                              ; preds = %360
  %406 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %52, align 8
  %407 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %406, i32 0, i32 1
  %408 = load i32, i32* %407, align 4
  %409 = call i32 @llvm.bswap.i32(i32 %408)
  br label %410

410:                                              ; preds = %405, %377
  %411 = phi i32 [ %404, %377 ], [ %409, %405 ]
  %412 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %413 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %412, i32 0, i32 8
  %414 = bitcast %union.anon* %413 to %struct.anon*
  %415 = getelementptr inbounds %struct.anon, %struct.anon* %414, i32 0, i32 1
  store i32 %411, i32* %415, align 4
  %416 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %417 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %416, i32 0, i32 1
  %418 = load i32, i32* %417, align 4
  %419 = call i1 @llvm.is.constant.i32(i32 %418)
  br i1 %419, label %420, label %448

420:                                              ; preds = %410
  %421 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %422 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %421, i32 0, i32 1
  %423 = load i32, i32* %422, align 4
  %424 = shl i32 %423, 24
  %425 = lshr i32 %424, 24
  %426 = shl i32 %425, 24
  %427 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %428 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %427, i32 0, i32 1
  %429 = load i32, i32* %428, align 4
  %430 = shl i32 %429, 16
  %431 = lshr i32 %430, 24
  %432 = shl i32 %431, 16
  %433 = or i32 %426, %432
  %434 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %435 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %434, i32 0, i32 1
  %436 = load i32, i32* %435, align 4
  %437 = shl i32 %436, 8
  %438 = lshr i32 %437, 24
  %439 = shl i32 %438, 8
  %440 = or i32 %433, %439
  %441 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %442 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %441, i32 0, i32 1
  %443 = load i32, i32* %442, align 4
  %444 = shl i32 %443, 0
  %445 = lshr i32 %444, 24
  %446 = shl i32 %445, 0
  %447 = or i32 %440, %446
  br label %453

448:                                              ; preds = %410
  %449 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %53, align 8
  %450 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %449, i32 0, i32 1
  %451 = load i32, i32* %450, align 4
  %452 = call i32 @llvm.bswap.i32(i32 %451)
  br label %453

453:                                              ; preds = %448, %420
  %454 = phi i32 [ %447, %420 ], [ %452, %448 ]
  %455 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %456 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %455, i32 0, i32 8
  %457 = bitcast %union.anon* %456 to %struct.anon*
  %458 = getelementptr inbounds %struct.anon, %struct.anon* %457, i32 0, i32 0
  store i32 %454, i32* %458, align 4
  %459 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %460 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %459, i32 0, i32 7
  store i16 0, i16* %460, align 2
  %461 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %462 = bitcast %struct.iphdr* %461 to i32*
  %463 = call i32 (i32, i32, i32*, i64, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i32*, i64, i32, ...)*)(i32 noundef 0, i32 noundef 0, i32* noundef %462, i64 noundef 20, i32 noundef 0)
  store i32 %463, i32* %8, align 4
  %464 = load i32, i32* %8, align 4
  %465 = and i32 %464, -65536
  %466 = lshr i32 %465, 16
  %467 = load i32, i32* %8, align 4
  %468 = and i32 %467, 65535
  %469 = add i32 %466, %468
  store i32 %469, i32* %8, align 4
  %470 = load i32, i32* %8, align 4
  %471 = and i32 %470, -65536
  %472 = lshr i32 %471, 16
  %473 = load i32, i32* %8, align 4
  %474 = and i32 %473, 65535
  %475 = add i32 %472, %474
  store i32 %475, i32* %8, align 4
  %476 = load i32, i32* %8, align 4
  %477 = trunc i32 %476 to i16
  %478 = zext i16 %477 to i32
  %479 = xor i32 %478, -1
  %480 = trunc i32 %479 to i16
  %481 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %482 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %481, i32 0, i32 7
  store i16 %480, i16* %482, align 2
  %483 = load i8*, i8** %37, align 8
  %484 = getelementptr i8, i8* %483, i64 1200
  %485 = load i8*, i8** %36, align 8
  %486 = icmp ult i8* %484, %485
  br i1 %486, label %487, label %488

487:                                              ; preds = %453
  store i32 2, i32* %34, align 4
  br label %539

488:                                              ; preds = %453
  %489 = load i8*, i8** %37, align 8
  %490 = getelementptr i8, i8* %489, i64 60
  %491 = load i8*, i8** %36, align 8
  %492 = icmp ugt i8* %490, %491
  br i1 %492, label %493, label %494

493:                                              ; preds = %488
  store i32 2, i32* %34, align 4
  br label %539

494:                                              ; preds = %488
  %495 = load i8*, i8** %37, align 8
  %496 = call i32 @calculate_checksum(i8* noundef %495, i32 noundef 60)
  %497 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %38, i32 0, i32 0
  store i32 %496, i32* %497, align 4
  %498 = load i8*, i8** %37, align 8
  %499 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %38, i32 0, i32 0
  %500 = load i32, i32* %499, align 4
  store i8* %498, i8** %16, align 8
  store i32 60, i32* %17, align 4
  store i32 %500, i32* %18, align 4
  %501 = load i32, i32* %17, align 4
  %502 = icmp uge i32 %501, 16
  br i1 %502, label %503, label %518

503:                                              ; preds = %494
  %504 = load i8*, i8** %16, align 8
  %505 = load i32, i32* %17, align 4
  %506 = load i32, i32* %18, align 4
  store i8* %504, i8** %2, align 8
  store i32 %505, i32* %3, align 4
  store i32 %506, i32* %4, align 4
  %507 = load i8*, i8** %2, align 8
  %508 = load i32, i32* %3, align 4
  %509 = load i32, i32* %4, align 4
  %510 = add i32 %509, -1640531535
  %511 = add i32 %510, -2048144777
  %512 = load i32, i32* %4, align 4
  %513 = add i32 %512, -2048144777
  %514 = load i32, i32* %4, align 4
  %515 = load i32, i32* %4, align 4
  %516 = sub i32 %515, -1640531535
  %517 = call i32 @h16bytes_4(i8* noundef %507, i32 noundef %508, i32 noundef %511, i32 noundef %513, i32 noundef %514, i32 noundef %516) #6
  br label %521

518:                                              ; preds = %494
  %519 = load i32, i32* %18, align 4
  %520 = add i32 %519, 374761393
  br label %521

521:                                              ; preds = %503, %518
  %522 = phi i32 [ %517, %503 ], [ %520, %518 ]
  %523 = load i32, i32* %17, align 4
  %524 = add i32 %522, %523
  %525 = load i8*, i8** %16, align 8
  %526 = load i32, i32* %17, align 4
  %527 = and i32 %526, -16
  %528 = zext i32 %527 to i64
  %529 = getelementptr inbounds i8, i8* %525, i64 %528
  %530 = load i32, i32* %17, align 4
  %531 = and i32 %530, 15
  %532 = call i32 @finalize(i32 noundef %524, i8* noundef %529, i32 noundef %531) #6
  %533 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %38, i32 0, i32 1
  store i32 %532, i32* %533, align 4
  %534 = load %struct.iphdr*, %struct.iphdr** %42, align 8
  %535 = bitcast %struct.iphdr* %534 to i8*
  %536 = getelementptr i8, i8* %535, i64 20
  %537 = bitcast %struct.hash_and_sum* %38 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %536, i8* align 4 %537, i64 8, i1 false)
  store i32 3, i32* %34, align 4
  br label %539

538:                                              ; preds = %87
  store i32 2, i32* %34, align 4
  br label %539

539:                                              ; preds = %538, %521, %493, %487, %358, %324, %289, %255, %157, %151, %141, %103, %82, %68
  %540 = load i32, i32* %34, align 4
  ret i32 %540
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare i32 @_bpf_helper_ext_0006(...) #2

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
declare i1 @llvm.is.constant.i32(i32) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #4

declare i32 @_bpf_helper_ext_0028(...) #2

declare i8* @_bpf_helper_ext_0001(...) #2

; Function Attrs: alwaysinline nounwind uwtable
define internal i32 @finalize(i32 noundef %0, i8* noundef %1, i32 noundef %2) #5 {
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
define internal i32 @h16bytes_4(i8* noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #5 {
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
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { convergent nofree nosync nounwind readnone willreturn }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { alwaysinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
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

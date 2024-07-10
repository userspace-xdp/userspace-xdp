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
@__const.xdp_pass.____fmt.1 = private unnamed_addr constant [21 x i8] c"Out of bounds iphdr\0A\00", align 16
@__const.xdp_pass.____fmt.2 = private unnamed_addr constant [22 x i8] c"Out of bounds tcphdr\0A\00", align 16
@config_map_id = internal constant i64 17179869184, align 8
@__const.xdp_pass.____fmt.3 = private unnamed_addr constant [25 x i8] c"Client config not found\0A\00", align 16
@targets_map_id = internal constant i64 21474836480, align 8
@LICENSE = dso_local global [4 x i8] c"GPL\00", align 1
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
  %19 = alloca i64*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i64*, align 8
  %22 = alloca i8*, align 8
  %23 = alloca i64*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca i64*, align 8
  %26 = alloca i8*, align 8
  %27 = alloca i64*, align 8
  %28 = alloca i8*, align 8
  %29 = alloca i32, align 4
  %30 = alloca %struct.xdp_md*, align 8
  %31 = alloca i8*, align 8
  %32 = alloca i8*, align 8
  %33 = alloca %struct.hash_and_sum, align 4
  %34 = alloca %struct.ethhdr*, align 8
  %35 = alloca [22 x i8], align 16
  %36 = alloca i32, align 4
  %37 = alloca %struct.iphdr*, align 8
  %38 = alloca [21 x i8], align 16
  %39 = alloca i32, align 4
  %40 = alloca %struct.tcphdr*, align 8
  %41 = alloca [22 x i8], align 16
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca %struct.ip_mac_pair*, align 8
  %45 = alloca [25 x i8], align 16
  %46 = alloca i32, align 4
  %47 = alloca %struct.ip_mac_pair*, align 8
  %48 = alloca %struct.ip_mac_pair*, align 8
  store %struct.xdp_md* %0, %struct.xdp_md** %30, align 8
  %49 = load %struct.xdp_md*, %struct.xdp_md** %30, align 8
  %50 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %49, i32 0, i32 1
  %51 = load i64, i64* %50, align 8
  %52 = inttoptr i64 %51 to i8*
  store i8* %52, i8** %31, align 8
  %53 = load %struct.xdp_md*, %struct.xdp_md** %30, align 8
  %54 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %53, i32 0, i32 0
  %55 = load i64, i64* %54, align 8
  %56 = inttoptr i64 %55 to i8*
  store i8* %56, i8** %32, align 8
  %57 = load i8*, i8** %32, align 8
  %58 = bitcast i8* %57 to %struct.ethhdr*
  store %struct.ethhdr* %58, %struct.ethhdr** %34, align 8
  %59 = load i8*, i8** %32, align 8
  %60 = getelementptr i8, i8* %59, i64 14
  %61 = load i8*, i8** %31, align 8
  %62 = icmp ugt i8* %60, %61
  br i1 %62, label %63, label %68

63:                                               ; preds = %1
  %64 = bitcast [22 x i8]* %35 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %64, i8* align 16 getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt, i32 0, i32 0), i64 22, i1 false)
  %65 = getelementptr inbounds [22 x i8], [22 x i8]* %35, i64 0, i64 0
  %66 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %65, i64 noundef 22)
  store i32 %66, i32* %36, align 4
  %67 = load i32, i32* %36, align 4
  store i32 1, i32* %29, align 4
  br label %414

68:                                               ; preds = %1
  %69 = load i8*, i8** %32, align 8
  %70 = getelementptr i8, i8* %69, i64 14
  %71 = bitcast i8* %70 to %struct.iphdr*
  store %struct.iphdr* %71, %struct.iphdr** %37, align 8
  %72 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %73 = bitcast %struct.iphdr* %72 to i8*
  %74 = getelementptr i8, i8* %73, i64 20
  %75 = load i8*, i8** %31, align 8
  %76 = icmp ugt i8* %74, %75
  br i1 %76, label %77, label %82

77:                                               ; preds = %68
  %78 = bitcast [21 x i8]* %38 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %78, i8* align 16 getelementptr inbounds ([21 x i8], [21 x i8]* @__const.xdp_pass.____fmt.1, i32 0, i32 0), i64 21, i1 false)
  %79 = getelementptr inbounds [21 x i8], [21 x i8]* %38, i64 0, i64 0
  %80 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %79, i64 noundef 21)
  store i32 %80, i32* %39, align 4
  %81 = load i32, i32* %39, align 4
  store i32 1, i32* %29, align 4
  br label %414

82:                                               ; preds = %68
  %83 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %84 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %83, i32 0, i32 6
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = icmp eq i32 %86, 6
  br i1 %87, label %88, label %413

88:                                               ; preds = %82
  %89 = load i8*, i8** %32, align 8
  %90 = getelementptr i8, i8* %89, i64 14
  %91 = getelementptr i8, i8* %90, i64 20
  %92 = bitcast i8* %91 to %struct.tcphdr*
  store %struct.tcphdr* %92, %struct.tcphdr** %40, align 8
  %93 = load %struct.tcphdr*, %struct.tcphdr** %40, align 8
  %94 = bitcast %struct.tcphdr* %93 to i8*
  %95 = getelementptr i8, i8* %94, i64 20
  %96 = load i8*, i8** %31, align 8
  %97 = icmp ugt i8* %95, %96
  br i1 %97, label %98, label %103

98:                                               ; preds = %88
  %99 = bitcast [22 x i8]* %41 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %99, i8* align 16 getelementptr inbounds ([22 x i8], [22 x i8]* @__const.xdp_pass.____fmt.2, i32 0, i32 0), i64 22, i1 false)
  %100 = getelementptr inbounds [22 x i8], [22 x i8]* %41, i64 0, i64 0
  %101 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %100, i64 noundef 22)
  store i32 %101, i32* %42, align 4
  %102 = load i32, i32* %42, align 4
  store i32 1, i32* %29, align 4
  br label %414

103:                                              ; preds = %88
  store i32 1, i32* %43, align 4
  %104 = bitcast i32* %43 to i8*
  store i64* @config_map_id, i64** %19, align 8
  store i8* %104, i8** %20, align 8
  %105 = load i64*, i64** %19, align 8
  %106 = load i64, i64* %105, align 8
  %107 = load i8*, i8** %20, align 8
  %108 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %106, i8* noundef %107) #6
  %109 = bitcast i8* %108 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %109, %struct.ip_mac_pair** %44, align 8
  %110 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %44, align 8
  %111 = icmp ne %struct.ip_mac_pair* %110, null
  br i1 %111, label %117, label %112

112:                                              ; preds = %103
  %113 = bitcast [25 x i8]* %45 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %113, i8* align 16 getelementptr inbounds ([25 x i8], [25 x i8]* @__const.xdp_pass.____fmt.3, i32 0, i32 0), i64 25, i1 false)
  %114 = getelementptr inbounds [25 x i8], [25 x i8]* %45, i64 0, i64 0
  %115 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %114, i64 noundef 25)
  store i32 %115, i32* %46, align 4
  %116 = load i32, i32* %46, align 4
  store i32 0, i32* %29, align 4
  br label %414

117:                                              ; preds = %103
  %118 = load i8*, i8** %32, align 8
  %119 = getelementptr i8, i8* %118, i64 1200
  %120 = load i8*, i8** %31, align 8
  %121 = icmp ult i8* %119, %120
  br i1 %121, label %122, label %123

122:                                              ; preds = %117
  store i32 2, i32* %29, align 4
  br label %414

123:                                              ; preds = %117
  %124 = load i8*, i8** %32, align 8
  %125 = getelementptr i8, i8* %124, i64 60
  %126 = load i8*, i8** %31, align 8
  %127 = icmp ugt i8* %125, %126
  br i1 %127, label %128, label %129

128:                                              ; preds = %123
  store i32 2, i32* %29, align 4
  br label %414

129:                                              ; preds = %123
  %130 = load i8*, i8** %32, align 8
  %131 = call i32 @calculate_checksum(i8* noundef %130, i32 noundef 60)
  %132 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %33, i32 0, i32 0
  store i32 %131, i32* %132, align 4
  %133 = load i8*, i8** %32, align 8
  %134 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %33, i32 0, i32 0
  %135 = load i32, i32* %134, align 4
  store i8* %133, i8** %13, align 8
  store i32 60, i32* %14, align 4
  store i32 %135, i32* %15, align 4
  %136 = load i32, i32* %14, align 4
  %137 = icmp uge i32 %136, 16
  br i1 %137, label %138, label %153

138:                                              ; preds = %129
  %139 = load i8*, i8** %13, align 8
  %140 = load i32, i32* %14, align 4
  %141 = load i32, i32* %15, align 4
  store i8* %139, i8** %5, align 8
  store i32 %140, i32* %6, align 4
  store i32 %141, i32* %7, align 4
  %142 = load i8*, i8** %5, align 8
  %143 = load i32, i32* %6, align 4
  %144 = load i32, i32* %7, align 4
  %145 = add i32 %144, -1640531535
  %146 = add i32 %145, -2048144777
  %147 = load i32, i32* %7, align 4
  %148 = add i32 %147, -2048144777
  %149 = load i32, i32* %7, align 4
  %150 = load i32, i32* %7, align 4
  %151 = sub i32 %150, -1640531535
  %152 = call i32 @h16bytes_4(i8* noundef %142, i32 noundef %143, i32 noundef %146, i32 noundef %148, i32 noundef %149, i32 noundef %151) #6
  br label %156

153:                                              ; preds = %129
  %154 = load i32, i32* %15, align 4
  %155 = add i32 %154, 374761393
  br label %156

156:                                              ; preds = %138, %153
  %157 = phi i32 [ %152, %138 ], [ %155, %153 ]
  %158 = load i32, i32* %14, align 4
  %159 = add i32 %157, %158
  %160 = load i8*, i8** %13, align 8
  %161 = load i32, i32* %14, align 4
  %162 = and i32 %161, -16
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds i8, i8* %160, i64 %163
  %165 = load i32, i32* %14, align 4
  %166 = and i32 %165, 15
  %167 = call i32 @finalize(i32 noundef %159, i8* noundef %164, i32 noundef %166) #6
  %168 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %33, i32 0, i32 1
  store i32 %167, i32* %168, align 4
  %169 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %33, i32 0, i32 1
  %170 = load i32, i32* %169, align 4
  %171 = udiv i32 %170, 2
  %172 = icmp ne i32 %171, 0
  br i1 %172, label %173, label %214

173:                                              ; preds = %156
  %174 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %175 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %174, i32 0, i32 8
  %176 = bitcast %union.anon* %175 to %struct.anon*
  %177 = getelementptr inbounds %struct.anon, %struct.anon* %176, i32 0, i32 0
  %178 = load i32, i32* %177, align 4
  %179 = load %struct.tcphdr*, %struct.tcphdr** %40, align 8
  %180 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %179, i32 0, i32 0
  %181 = load i16, i16* %180, align 4
  %182 = load %struct.tcphdr*, %struct.tcphdr** %40, align 8
  %183 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %182, i32 0, i32 1
  %184 = load i16, i16* %183, align 2
  store i32 %178, i32* %9, align 4
  store i16 %181, i16* %10, align 2
  store i16 %184, i16* %11, align 2
  %185 = load i32, i32* %9, align 4
  %186 = load i16, i16* %10, align 2
  %187 = zext i16 %186 to i32
  %188 = xor i32 %185, %187
  %189 = load i16, i16* %11, align 2
  %190 = zext i16 %189 to i32
  %191 = xor i32 %188, %190
  %192 = and i32 %191, 1
  store i32 %192, i32* %12, align 4
  %193 = load i32, i32* %12, align 4
  store i32 %193, i32* %43, align 4
  %194 = bitcast i32* %43 to i8*
  store i64* @targets_map_id, i64** %21, align 8
  store i8* %194, i8** %22, align 8
  %195 = load i64*, i64** %21, align 8
  %196 = load i64, i64* %195, align 8
  %197 = load i8*, i8** %22, align 8
  %198 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %196, i8* noundef %197) #6
  %199 = bitcast i8* %198 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %199, %struct.ip_mac_pair** %47, align 8
  %200 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %201 = icmp ne %struct.ip_mac_pair* %200, null
  br i1 %201, label %203, label %202

202:                                              ; preds = %173
  store i32 0, i32* %29, align 4
  br label %414

203:                                              ; preds = %173
  store i32 0, i32* %43, align 4
  %204 = bitcast i32* %43 to i8*
  store i64* @config_map_id, i64** %23, align 8
  store i8* %204, i8** %24, align 8
  %205 = load i64*, i64** %23, align 8
  %206 = load i64, i64* %205, align 8
  %207 = load i8*, i8** %24, align 8
  %208 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %206, i8* noundef %207) #6
  %209 = bitcast i8* %208 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %209, %struct.ip_mac_pair** %48, align 8
  %210 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %211 = icmp ne %struct.ip_mac_pair* %210, null
  br i1 %211, label %213, label %212

212:                                              ; preds = %203
  store i32 0, i32* %29, align 4
  br label %414

213:                                              ; preds = %203
  br label %235

214:                                              ; preds = %156
  store i32 1, i32* %43, align 4
  %215 = bitcast i32* %43 to i8*
  store i64* @config_map_id, i64** %25, align 8
  store i8* %215, i8** %26, align 8
  %216 = load i64*, i64** %25, align 8
  %217 = load i64, i64* %216, align 8
  %218 = load i8*, i8** %26, align 8
  %219 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %217, i8* noundef %218) #6
  %220 = bitcast i8* %219 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %220, %struct.ip_mac_pair** %47, align 8
  %221 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %222 = icmp ne %struct.ip_mac_pair* %221, null
  br i1 %222, label %224, label %223

223:                                              ; preds = %214
  store i32 0, i32* %29, align 4
  br label %414

224:                                              ; preds = %214
  store i32 0, i32* %43, align 4
  %225 = bitcast i32* %43 to i8*
  store i64* @config_map_id, i64** %27, align 8
  store i8* %225, i8** %28, align 8
  %226 = load i64*, i64** %27, align 8
  %227 = load i64, i64* %226, align 8
  %228 = load i8*, i8** %28, align 8
  %229 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %227, i8* noundef %228) #6
  %230 = bitcast i8* %229 to %struct.ip_mac_pair*
  store %struct.ip_mac_pair* %230, %struct.ip_mac_pair** %48, align 8
  %231 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %232 = icmp ne %struct.ip_mac_pair* %231, null
  br i1 %232, label %234, label %233

233:                                              ; preds = %224
  store i32 0, i32* %29, align 4
  br label %414

234:                                              ; preds = %224
  br label %235

235:                                              ; preds = %234, %213
  %236 = load %struct.ethhdr*, %struct.ethhdr** %34, align 8
  %237 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %236, i32 0, i32 0
  %238 = getelementptr inbounds [6 x i8], [6 x i8]* %237, i64 0, i64 0
  %239 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %240 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %239, i32 0, i32 0
  %241 = bitcast %struct.eth_addr* %240 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %238, i8* align 4 %241, i64 6, i1 false)
  %242 = load %struct.ethhdr*, %struct.ethhdr** %34, align 8
  %243 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %242, i32 0, i32 1
  %244 = getelementptr inbounds [6 x i8], [6 x i8]* %243, i64 0, i64 0
  %245 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %246 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %245, i32 0, i32 0
  %247 = bitcast %struct.eth_addr* %246 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %244, i8* align 4 %247, i64 6, i1 false)
  %248 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %249 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %248, i32 0, i32 1
  %250 = load i32, i32* %249, align 4
  %251 = call i1 @llvm.is.constant.i32(i32 %250)
  br i1 %251, label %252, label %280

252:                                              ; preds = %235
  %253 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %254 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %253, i32 0, i32 1
  %255 = load i32, i32* %254, align 4
  %256 = shl i32 %255, 24
  %257 = lshr i32 %256, 24
  %258 = shl i32 %257, 24
  %259 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %260 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %259, i32 0, i32 1
  %261 = load i32, i32* %260, align 4
  %262 = shl i32 %261, 16
  %263 = lshr i32 %262, 24
  %264 = shl i32 %263, 16
  %265 = or i32 %258, %264
  %266 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %267 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %266, i32 0, i32 1
  %268 = load i32, i32* %267, align 4
  %269 = shl i32 %268, 8
  %270 = lshr i32 %269, 24
  %271 = shl i32 %270, 8
  %272 = or i32 %265, %271
  %273 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %274 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %273, i32 0, i32 1
  %275 = load i32, i32* %274, align 4
  %276 = shl i32 %275, 0
  %277 = lshr i32 %276, 24
  %278 = shl i32 %277, 0
  %279 = or i32 %272, %278
  br label %285

280:                                              ; preds = %235
  %281 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %47, align 8
  %282 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %281, i32 0, i32 1
  %283 = load i32, i32* %282, align 4
  %284 = call i32 @llvm.bswap.i32(i32 %283)
  br label %285

285:                                              ; preds = %280, %252
  %286 = phi i32 [ %279, %252 ], [ %284, %280 ]
  %287 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %288 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %287, i32 0, i32 8
  %289 = bitcast %union.anon* %288 to %struct.anon*
  %290 = getelementptr inbounds %struct.anon, %struct.anon* %289, i32 0, i32 1
  store i32 %286, i32* %290, align 4
  %291 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %292 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %291, i32 0, i32 1
  %293 = load i32, i32* %292, align 4
  %294 = call i1 @llvm.is.constant.i32(i32 %293)
  br i1 %294, label %295, label %323

295:                                              ; preds = %285
  %296 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %297 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %296, i32 0, i32 1
  %298 = load i32, i32* %297, align 4
  %299 = shl i32 %298, 24
  %300 = lshr i32 %299, 24
  %301 = shl i32 %300, 24
  %302 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %303 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %302, i32 0, i32 1
  %304 = load i32, i32* %303, align 4
  %305 = shl i32 %304, 16
  %306 = lshr i32 %305, 24
  %307 = shl i32 %306, 16
  %308 = or i32 %301, %307
  %309 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %310 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %309, i32 0, i32 1
  %311 = load i32, i32* %310, align 4
  %312 = shl i32 %311, 8
  %313 = lshr i32 %312, 24
  %314 = shl i32 %313, 8
  %315 = or i32 %308, %314
  %316 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %317 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %316, i32 0, i32 1
  %318 = load i32, i32* %317, align 4
  %319 = shl i32 %318, 0
  %320 = lshr i32 %319, 24
  %321 = shl i32 %320, 0
  %322 = or i32 %315, %321
  br label %328

323:                                              ; preds = %285
  %324 = load %struct.ip_mac_pair*, %struct.ip_mac_pair** %48, align 8
  %325 = getelementptr inbounds %struct.ip_mac_pair, %struct.ip_mac_pair* %324, i32 0, i32 1
  %326 = load i32, i32* %325, align 4
  %327 = call i32 @llvm.bswap.i32(i32 %326)
  br label %328

328:                                              ; preds = %323, %295
  %329 = phi i32 [ %322, %295 ], [ %327, %323 ]
  %330 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %331 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %330, i32 0, i32 8
  %332 = bitcast %union.anon* %331 to %struct.anon*
  %333 = getelementptr inbounds %struct.anon, %struct.anon* %332, i32 0, i32 0
  store i32 %329, i32* %333, align 4
  %334 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %335 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %334, i32 0, i32 7
  store i16 0, i16* %335, align 2
  %336 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %337 = bitcast %struct.iphdr* %336 to i32*
  %338 = call i32 (i32, i32, i32*, i64, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i32*, i64, i32, ...)*)(i32 noundef 0, i32 noundef 0, i32* noundef %337, i64 noundef 20, i32 noundef 0)
  store i32 %338, i32* %8, align 4
  %339 = load i32, i32* %8, align 4
  %340 = and i32 %339, -65536
  %341 = lshr i32 %340, 16
  %342 = load i32, i32* %8, align 4
  %343 = and i32 %342, 65535
  %344 = add i32 %341, %343
  store i32 %344, i32* %8, align 4
  %345 = load i32, i32* %8, align 4
  %346 = and i32 %345, -65536
  %347 = lshr i32 %346, 16
  %348 = load i32, i32* %8, align 4
  %349 = and i32 %348, 65535
  %350 = add i32 %347, %349
  store i32 %350, i32* %8, align 4
  %351 = load i32, i32* %8, align 4
  %352 = trunc i32 %351 to i16
  %353 = zext i16 %352 to i32
  %354 = xor i32 %353, -1
  %355 = trunc i32 %354 to i16
  %356 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %357 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %356, i32 0, i32 7
  store i16 %355, i16* %357, align 2
  %358 = load i8*, i8** %32, align 8
  %359 = getelementptr i8, i8* %358, i64 1200
  %360 = load i8*, i8** %31, align 8
  %361 = icmp ult i8* %359, %360
  br i1 %361, label %362, label %363

362:                                              ; preds = %328
  store i32 2, i32* %29, align 4
  br label %414

363:                                              ; preds = %328
  %364 = load i8*, i8** %32, align 8
  %365 = getelementptr i8, i8* %364, i64 60
  %366 = load i8*, i8** %31, align 8
  %367 = icmp ugt i8* %365, %366
  br i1 %367, label %368, label %369

368:                                              ; preds = %363
  store i32 2, i32* %29, align 4
  br label %414

369:                                              ; preds = %363
  %370 = load i8*, i8** %32, align 8
  %371 = call i32 @calculate_checksum(i8* noundef %370, i32 noundef 60)
  %372 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %33, i32 0, i32 0
  store i32 %371, i32* %372, align 4
  %373 = load i8*, i8** %32, align 8
  %374 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %33, i32 0, i32 0
  %375 = load i32, i32* %374, align 4
  store i8* %373, i8** %16, align 8
  store i32 60, i32* %17, align 4
  store i32 %375, i32* %18, align 4
  %376 = load i32, i32* %17, align 4
  %377 = icmp uge i32 %376, 16
  br i1 %377, label %378, label %393

378:                                              ; preds = %369
  %379 = load i8*, i8** %16, align 8
  %380 = load i32, i32* %17, align 4
  %381 = load i32, i32* %18, align 4
  store i8* %379, i8** %2, align 8
  store i32 %380, i32* %3, align 4
  store i32 %381, i32* %4, align 4
  %382 = load i8*, i8** %2, align 8
  %383 = load i32, i32* %3, align 4
  %384 = load i32, i32* %4, align 4
  %385 = add i32 %384, -1640531535
  %386 = add i32 %385, -2048144777
  %387 = load i32, i32* %4, align 4
  %388 = add i32 %387, -2048144777
  %389 = load i32, i32* %4, align 4
  %390 = load i32, i32* %4, align 4
  %391 = sub i32 %390, -1640531535
  %392 = call i32 @h16bytes_4(i8* noundef %382, i32 noundef %383, i32 noundef %386, i32 noundef %388, i32 noundef %389, i32 noundef %391) #6
  br label %396

393:                                              ; preds = %369
  %394 = load i32, i32* %18, align 4
  %395 = add i32 %394, 374761393
  br label %396

396:                                              ; preds = %378, %393
  %397 = phi i32 [ %392, %378 ], [ %395, %393 ]
  %398 = load i32, i32* %17, align 4
  %399 = add i32 %397, %398
  %400 = load i8*, i8** %16, align 8
  %401 = load i32, i32* %17, align 4
  %402 = and i32 %401, -16
  %403 = zext i32 %402 to i64
  %404 = getelementptr inbounds i8, i8* %400, i64 %403
  %405 = load i32, i32* %17, align 4
  %406 = and i32 %405, 15
  %407 = call i32 @finalize(i32 noundef %399, i8* noundef %404, i32 noundef %406) #6
  %408 = getelementptr inbounds %struct.hash_and_sum, %struct.hash_and_sum* %33, i32 0, i32 1
  store i32 %407, i32* %408, align 4
  %409 = load %struct.iphdr*, %struct.iphdr** %37, align 8
  %410 = bitcast %struct.iphdr* %409 to i8*
  %411 = getelementptr i8, i8* %410, i64 20
  %412 = bitcast %struct.hash_and_sum* %33 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %411, i8* align 4 %412, i64 8, i1 false)
  store i32 3, i32* %29, align 4
  br label %414

413:                                              ; preds = %82
  store i32 2, i32* %29, align 4
  br label %414

414:                                              ; preds = %413, %396, %368, %362, %233, %223, %212, %202, %128, %122, %112, %98, %77, %63
  %415 = load i32, i32* %29, align 4
  ret i32 %415
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

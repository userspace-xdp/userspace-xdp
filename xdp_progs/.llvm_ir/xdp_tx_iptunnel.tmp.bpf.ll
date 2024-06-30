; ModuleID = 'xdp_tx_iptunnel.bpf.c'
source_filename = "xdp_tx_iptunnel.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [6 x i32]*, i32*, i64*, [256 x i32]* }
%struct.anon.0 = type { [1 x i32]*, %struct.vip*, %struct.iptnl_info*, [256 x i32]* }
%struct.vip = type { %union.anon, i16, i16, i8 }
%union.anon = type { [4 x i32] }
%struct.iptnl_info = type { %union.anon.1, %union.anon.2, i16, [6 x i8] }
%union.anon.1 = type { [4 x i32] }
%union.anon.2 = type { [4 x i32] }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.3 }
%union.anon.3 = type { %struct.anon.4 }
%struct.anon.4 = type { i32, i32 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@rxcnt = dso_local global %struct.anon zeroinitializer, section ".maps", align 8
@vip2tnl = dso_local global %struct.anon.0 zeroinitializer, section ".maps", align 8
@handle_ipv4.____fmt = internal constant [13 x i8] c"handle_ipv4\0A\00", align 1
@bpf_trace_printk = internal global i64 (i8*, i32, ...)* inttoptr (i64 6 to i64 (i8*, i32, ...)*), align 8
@handle_ipv4.____fmt.1 = internal constant [22 x i8] c"handle_ipv4 1, valid\0A\00", align 1
@handle_ipv4.____fmt.2 = internal constant [18 x i8] c"start map lookup\0A\00", align 1
@bpf_map_lookup_elem = internal global i8* (i8*, i8*)* inttoptr (i64 1 to i8* (i8*, i8*)*), align 8
@handle_ipv4.____fmt.3 = internal constant [9 x i8] c"tnl: %p\0A\00", align 1
@handle_ipv4.____fmt.4 = internal constant [12 x i8] c"map lookup\0A\00", align 1
@bpf_xdp_adjust_head = internal global i64 (%struct.xdp_md*, i32)* inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*), align 8
@handle_ipv4.____fmt.5 = internal constant [13 x i8] c"adjust head\0A\00", align 1
@handle_ipv4.____fmt.6 = internal constant [30 x i8] c"handle_ipv4 2, not too small\0A\00", align 1
@handle_ipv4.____fmt.7 = internal constant [20 x i8] c"handle_ipv4 XDP_TX\0A\00", align 1
@llvm.compiler.used = appending global [4 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @rxcnt to i8*), i8* bitcast (%struct.anon.0* @vip2tnl to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca i64*, align 8
  %4 = alloca %struct.ethhdr*, align 8
  %5 = alloca %struct.ethhdr*, align 8
  %6 = alloca %struct.iptnl_info*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8, align 1
  %12 = alloca %struct.tcphdr*, align 8
  %13 = alloca %struct.udphdr*, align 8
  %14 = alloca i32, align 4
  %15 = alloca %struct.xdp_md*, align 8
  %16 = alloca i8*, align 8
  %17 = alloca i8*, align 8
  %18 = alloca %struct.iptnl_info*, align 8
  %19 = alloca %struct.ethhdr*, align 8
  %20 = alloca %struct.ethhdr*, align 8
  %21 = alloca %struct.iphdr*, align 8
  %22 = alloca i16*, align 8
  %23 = alloca i16, align 2
  %24 = alloca %struct.vip, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i64, align 8
  %29 = alloca i64, align 8
  %30 = alloca i64, align 8
  %31 = alloca i64, align 8
  %32 = alloca i64, align 8
  %33 = alloca i64, align 8
  %34 = alloca i64, align 8
  %35 = alloca i64, align 8
  %36 = alloca i32, align 4
  %37 = alloca %struct.xdp_md*, align 8
  %38 = alloca i8*, align 8
  %39 = alloca i8*, align 8
  %40 = alloca %struct.ethhdr*, align 8
  %41 = alloca i16, align 2
  store %struct.xdp_md* %0, %struct.xdp_md** %37, align 8
  %42 = load %struct.xdp_md*, %struct.xdp_md** %37, align 8
  %43 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %42, i32 0, i32 1
  %44 = load i32, i32* %43, align 4
  %45 = zext i32 %44 to i64
  %46 = inttoptr i64 %45 to i8*
  store i8* %46, i8** %38, align 8
  %47 = load %struct.xdp_md*, %struct.xdp_md** %37, align 8
  %48 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %47, i32 0, i32 0
  %49 = load i32, i32* %48, align 4
  %50 = zext i32 %49 to i64
  %51 = inttoptr i64 %50 to i8*
  store i8* %51, i8** %39, align 8
  %52 = load i8*, i8** %39, align 8
  %53 = bitcast i8* %52 to %struct.ethhdr*
  store %struct.ethhdr* %53, %struct.ethhdr** %40, align 8
  %54 = load %struct.ethhdr*, %struct.ethhdr** %40, align 8
  %55 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %54, i64 1
  %56 = load i8*, i8** %38, align 8
  %57 = bitcast i8* %56 to %struct.ethhdr*
  %58 = icmp ugt %struct.ethhdr* %55, %57
  br i1 %58, label %59, label %60

59:                                               ; preds = %1
  store i32 1, i32* %36, align 4
  br label %390

60:                                               ; preds = %1
  %61 = load %struct.ethhdr*, %struct.ethhdr** %40, align 8
  %62 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %61, i32 0, i32 2
  %63 = load i16, i16* %62, align 2
  store i16 %63, i16* %41, align 2
  %64 = load i16, i16* %41, align 2
  %65 = zext i16 %64 to i32
  %66 = icmp eq i32 %65, 8
  br i1 %66, label %67, label %389

67:                                               ; preds = %60
  %68 = load %struct.xdp_md*, %struct.xdp_md** %37, align 8
  store %struct.xdp_md* %68, %struct.xdp_md** %15, align 8
  %69 = load %struct.xdp_md*, %struct.xdp_md** %15, align 8
  %70 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %69, i32 0, i32 1
  %71 = load i32, i32* %70, align 4
  %72 = zext i32 %71 to i64
  %73 = inttoptr i64 %72 to i8*
  store i8* %73, i8** %16, align 8
  %74 = load %struct.xdp_md*, %struct.xdp_md** %15, align 8
  %75 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %74, i32 0, i32 0
  %76 = load i32, i32* %75, align 4
  %77 = zext i32 %76 to i64
  %78 = inttoptr i64 %77 to i8*
  store i8* %78, i8** %17, align 8
  %79 = load i8*, i8** %17, align 8
  %80 = getelementptr i8, i8* %79, i64 14
  %81 = bitcast i8* %80 to %struct.iphdr*
  store %struct.iphdr* %81, %struct.iphdr** %21, align 8
  %82 = bitcast %struct.vip* %24 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %82, i8 0, i64 24, i1 false) #5
  store i32 0, i32* %26, align 4
  %83 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %84 = call i64 (i8*, i32, ...) %83(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @handle_ipv4.____fmt, i64 0, i64 0), i32 noundef 13) #5
  store i64 %84, i64* %28, align 8
  %85 = load i64, i64* %28, align 8
  %86 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %87 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %86, i64 1
  %88 = load i8*, i8** %16, align 8
  %89 = bitcast i8* %88 to %struct.iphdr*
  %90 = icmp ugt %struct.iphdr* %87, %89
  br i1 %90, label %91, label %92

91:                                               ; preds = %67
  store i32 1, i32* %14, align 4
  br label %387

92:                                               ; preds = %67
  %93 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %94 = call i64 (i8*, i32, ...) %93(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @handle_ipv4.____fmt.1, i64 0, i64 0), i32 noundef 22) #5
  store i64 %94, i64* %29, align 8
  %95 = load i64, i64* %29, align 8
  %96 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %97 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %96, i64 1
  %98 = bitcast %struct.iphdr* %97 to i8*
  %99 = load i8*, i8** %16, align 8
  %100 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %101 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %100, i32 0, i32 6
  %102 = load i8, i8* %101, align 1
  store i8* %98, i8** %9, align 8
  store i8* %99, i8** %10, align 8
  store i8 %102, i8* %11, align 1
  %103 = load i8, i8* %11, align 1
  %104 = zext i8 %103 to i32
  switch i32 %104, label %133 [
    i32 6, label %105
    i32 17, label %119
  ]

105:                                              ; preds = %92
  %106 = load i8*, i8** %9, align 8
  %107 = bitcast i8* %106 to %struct.tcphdr*
  store %struct.tcphdr* %107, %struct.tcphdr** %12, align 8
  %108 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %109 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %108, i64 1
  %110 = load i8*, i8** %10, align 8
  %111 = bitcast i8* %110 to %struct.tcphdr*
  %112 = icmp ugt %struct.tcphdr* %109, %111
  br i1 %112, label %113, label %114

113:                                              ; preds = %105
  store i32 -1, i32* %8, align 4
  br label %134

114:                                              ; preds = %105
  %115 = load %struct.tcphdr*, %struct.tcphdr** %12, align 8
  %116 = getelementptr inbounds %struct.tcphdr, %struct.tcphdr* %115, i32 0, i32 1
  %117 = load i16, i16* %116, align 2
  %118 = zext i16 %117 to i32
  store i32 %118, i32* %8, align 4
  br label %134

119:                                              ; preds = %92
  %120 = load i8*, i8** %9, align 8
  %121 = bitcast i8* %120 to %struct.udphdr*
  store %struct.udphdr* %121, %struct.udphdr** %13, align 8
  %122 = load %struct.udphdr*, %struct.udphdr** %13, align 8
  %123 = getelementptr inbounds %struct.udphdr, %struct.udphdr* %122, i64 1
  %124 = load i8*, i8** %10, align 8
  %125 = bitcast i8* %124 to %struct.udphdr*
  %126 = icmp ugt %struct.udphdr* %123, %125
  br i1 %126, label %127, label %128

127:                                              ; preds = %119
  store i32 -1, i32* %8, align 4
  br label %134

128:                                              ; preds = %119
  %129 = load %struct.udphdr*, %struct.udphdr** %13, align 8
  %130 = getelementptr inbounds %struct.udphdr, %struct.udphdr* %129, i32 0, i32 1
  %131 = load i16, i16* %130, align 2
  %132 = zext i16 %131 to i32
  store i32 %132, i32* %8, align 4
  br label %134

133:                                              ; preds = %92
  store i32 0, i32* %8, align 4
  br label %134

134:                                              ; preds = %113, %114, %127, %128, %133
  %135 = load i32, i32* %8, align 4
  store i32 %135, i32* %25, align 4
  %136 = load i32, i32* %25, align 4
  %137 = icmp eq i32 %136, -1
  br i1 %137, label %138, label %139

138:                                              ; preds = %134
  store i32 1, i32* %14, align 4
  br label %387

139:                                              ; preds = %134
  %140 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %141 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %140, i32 0, i32 6
  %142 = load i8, i8* %141, align 1
  %143 = getelementptr inbounds %struct.vip, %struct.vip* %24, i32 0, i32 3
  store i8 %142, i8* %143, align 4
  %144 = getelementptr inbounds %struct.vip, %struct.vip* %24, i32 0, i32 2
  store i16 2, i16* %144, align 2
  %145 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %146 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %145, i32 0, i32 8
  %147 = bitcast %union.anon.3* %146 to %struct.anon.4*
  %148 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %147, i32 0, i32 1
  %149 = load i32, i32* %148, align 4
  %150 = getelementptr inbounds %struct.vip, %struct.vip* %24, i32 0, i32 0
  %151 = bitcast %union.anon* %150 to i32*
  store i32 %149, i32* %151, align 4
  %152 = load i32, i32* %25, align 4
  %153 = trunc i32 %152 to i16
  %154 = getelementptr inbounds %struct.vip, %struct.vip* %24, i32 0, i32 1
  store i16 %153, i16* %154, align 4
  %155 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %156 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %155, i32 0, i32 2
  %157 = load i16, i16* %156, align 2
  %158 = call i1 @llvm.is.constant.i16(i16 %157) #5
  br i1 %158, label %159, label %175

159:                                              ; preds = %139
  %160 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %161 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %160, i32 0, i32 2
  %162 = load i16, i16* %161, align 2
  %163 = zext i16 %162 to i32
  %164 = shl i32 %163, 8
  %165 = ashr i32 %164, 8
  %166 = shl i32 %165, 8
  %167 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %168 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %167, i32 0, i32 2
  %169 = load i16, i16* %168, align 2
  %170 = zext i16 %169 to i32
  %171 = ashr i32 %170, 8
  %172 = or i32 %166, %171
  %173 = trunc i32 %172 to i16
  %174 = zext i16 %173 to i32
  br label %181

175:                                              ; preds = %139
  %176 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %177 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %176, i32 0, i32 2
  %178 = load i16, i16* %177, align 2
  %179 = call i16 @llvm.bswap.i16(i16 %178) #5
  %180 = zext i16 %179 to i32
  br label %181

181:                                              ; preds = %175, %159
  %182 = phi i32 [ %174, %159 ], [ %180, %175 ]
  %183 = trunc i32 %182 to i16
  store i16 %183, i16* %23, align 2
  %184 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %185 = call i64 (i8*, i32, ...) %184(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @handle_ipv4.____fmt.2, i64 0, i64 0), i32 noundef 18) #5
  store i64 %185, i64* %30, align 8
  %186 = load i64, i64* %30, align 8
  %187 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %188 = bitcast %struct.vip* %24 to i8*
  %189 = call i8* %187(i8* noundef bitcast (%struct.anon.0* @vip2tnl to i8*), i8* noundef %188) #5
  %190 = bitcast i8* %189 to %struct.iptnl_info*
  store %struct.iptnl_info* %190, %struct.iptnl_info** %18, align 8
  %191 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %192 = load %struct.iptnl_info*, %struct.iptnl_info** %18, align 8
  %193 = call i64 (i8*, i32, ...) %191(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @handle_ipv4.____fmt.3, i64 0, i64 0), i32 noundef 9, %struct.iptnl_info* noundef %192) #5
  store i64 %193, i64* %31, align 8
  %194 = load i64, i64* %31, align 8
  %195 = load %struct.iptnl_info*, %struct.iptnl_info** %18, align 8
  %196 = icmp ne %struct.iptnl_info* %195, null
  br i1 %196, label %197, label %203

197:                                              ; preds = %181
  %198 = load %struct.iptnl_info*, %struct.iptnl_info** %18, align 8
  %199 = getelementptr inbounds %struct.iptnl_info, %struct.iptnl_info* %198, i32 0, i32 2
  %200 = load i16, i16* %199, align 4
  %201 = zext i16 %200 to i32
  %202 = icmp ne i32 %201, 2
  br i1 %202, label %203, label %204

203:                                              ; preds = %197, %181
  store i32 2, i32* %14, align 4
  br label %387

204:                                              ; preds = %197
  %205 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %206 = call i64 (i8*, i32, ...) %205(i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @handle_ipv4.____fmt.4, i64 0, i64 0), i32 noundef 12) #5
  store i64 %206, i64* %32, align 8
  %207 = load i64, i64* %32, align 8
  %208 = load i64 (%struct.xdp_md*, i32)*, i64 (%struct.xdp_md*, i32)** @bpf_xdp_adjust_head, align 8
  %209 = load %struct.xdp_md*, %struct.xdp_md** %15, align 8
  %210 = call i64 %208(%struct.xdp_md* noundef %209, i32 noundef -20) #5
  %211 = icmp ne i64 %210, 0
  br i1 %211, label %212, label %213

212:                                              ; preds = %204
  store i32 1, i32* %14, align 4
  br label %387

213:                                              ; preds = %204
  %214 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %215 = call i64 (i8*, i32, ...) %214(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @handle_ipv4.____fmt.5, i64 0, i64 0), i32 noundef 13) #5
  store i64 %215, i64* %33, align 8
  %216 = load i64, i64* %33, align 8
  %217 = load %struct.xdp_md*, %struct.xdp_md** %15, align 8
  %218 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %217, i32 0, i32 0
  %219 = load i32, i32* %218, align 4
  %220 = zext i32 %219 to i64
  %221 = inttoptr i64 %220 to i8*
  store i8* %221, i8** %17, align 8
  %222 = load %struct.xdp_md*, %struct.xdp_md** %15, align 8
  %223 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %222, i32 0, i32 1
  %224 = load i32, i32* %223, align 4
  %225 = zext i32 %224 to i64
  %226 = inttoptr i64 %225 to i8*
  store i8* %226, i8** %16, align 8
  %227 = load i8*, i8** %17, align 8
  %228 = bitcast i8* %227 to %struct.ethhdr*
  store %struct.ethhdr* %228, %struct.ethhdr** %19, align 8
  %229 = load i8*, i8** %17, align 8
  %230 = getelementptr i8, i8* %229, i64 14
  %231 = bitcast i8* %230 to %struct.iphdr*
  store %struct.iphdr* %231, %struct.iphdr** %21, align 8
  %232 = load i8*, i8** %17, align 8
  %233 = getelementptr i8, i8* %232, i64 20
  %234 = bitcast i8* %233 to %struct.ethhdr*
  store %struct.ethhdr* %234, %struct.ethhdr** %20, align 8
  %235 = load %struct.ethhdr*, %struct.ethhdr** %19, align 8
  %236 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %235, i64 1
  %237 = load i8*, i8** %16, align 8
  %238 = bitcast i8* %237 to %struct.ethhdr*
  %239 = icmp ugt %struct.ethhdr* %236, %238
  br i1 %239, label %252, label %240

240:                                              ; preds = %213
  %241 = load %struct.ethhdr*, %struct.ethhdr** %20, align 8
  %242 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %241, i64 1
  %243 = load i8*, i8** %16, align 8
  %244 = bitcast i8* %243 to %struct.ethhdr*
  %245 = icmp ugt %struct.ethhdr* %242, %244
  br i1 %245, label %252, label %246

246:                                              ; preds = %240
  %247 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %248 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %247, i64 1
  %249 = load i8*, i8** %16, align 8
  %250 = bitcast i8* %249 to %struct.iphdr*
  %251 = icmp ugt %struct.iphdr* %248, %250
  br i1 %251, label %252, label %253

252:                                              ; preds = %246, %240, %213
  store i32 1, i32* %14, align 4
  br label %387

253:                                              ; preds = %246
  %254 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %255 = call i64 (i8*, i32, ...) %254(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @handle_ipv4.____fmt.6, i64 0, i64 0), i32 noundef 30) #5
  store i64 %255, i64* %34, align 8
  %256 = load i64, i64* %34, align 8
  %257 = load %struct.ethhdr*, %struct.ethhdr** %19, align 8
  %258 = load %struct.ethhdr*, %struct.ethhdr** %20, align 8
  %259 = load %struct.iptnl_info*, %struct.iptnl_info** %18, align 8
  store %struct.ethhdr* %257, %struct.ethhdr** %4, align 8
  store %struct.ethhdr* %258, %struct.ethhdr** %5, align 8
  store %struct.iptnl_info* %259, %struct.iptnl_info** %6, align 8
  store i16 8, i16* %7, align 2
  %260 = load %struct.ethhdr*, %struct.ethhdr** %4, align 8
  %261 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %260, i32 0, i32 1
  %262 = getelementptr inbounds [6 x i8], [6 x i8]* %261, i64 0, i64 0
  %263 = load %struct.ethhdr*, %struct.ethhdr** %5, align 8
  %264 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %263, i32 0, i32 0
  %265 = getelementptr inbounds [6 x i8], [6 x i8]* %264, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %262, i8* align 2 %265, i64 6, i1 false) #5
  %266 = load %struct.ethhdr*, %struct.ethhdr** %4, align 8
  %267 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %266, i32 0, i32 0
  %268 = getelementptr inbounds [6 x i8], [6 x i8]* %267, i64 0, i64 0
  %269 = load %struct.iptnl_info*, %struct.iptnl_info** %6, align 8
  %270 = getelementptr inbounds %struct.iptnl_info, %struct.iptnl_info* %269, i32 0, i32 3
  %271 = getelementptr inbounds [6 x i8], [6 x i8]* %270, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %268, i8* align 2 %271, i64 6, i1 false) #5
  %272 = load i16, i16* %7, align 2
  %273 = load %struct.ethhdr*, %struct.ethhdr** %4, align 8
  %274 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %273, i32 0, i32 2
  store i16 %272, i16* %274, align 2
  %275 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %276 = bitcast %struct.iphdr* %275 to i8*
  %277 = load i8, i8* %276, align 4
  %278 = and i8 %277, 15
  %279 = or i8 %278, 64
  store i8 %279, i8* %276, align 4
  %280 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %281 = bitcast %struct.iphdr* %280 to i8*
  %282 = load i8, i8* %281, align 4
  %283 = and i8 %282, -16
  %284 = or i8 %283, 5
  store i8 %284, i8* %281, align 4
  %285 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %286 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %285, i32 0, i32 4
  store i16 0, i16* %286, align 2
  %287 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %288 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %287, i32 0, i32 6
  store i8 4, i8* %288, align 1
  %289 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %290 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %289, i32 0, i32 7
  store i16 0, i16* %290, align 2
  %291 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %292 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %291, i32 0, i32 1
  store i8 0, i8* %292, align 1
  %293 = load i16, i16* %23, align 2
  %294 = zext i16 %293 to i64
  %295 = add i64 %294, 20
  %296 = call i1 @llvm.is.constant.i64(i64 %295) #5
  br i1 %296, label %297, label %315

297:                                              ; preds = %253
  %298 = load i16, i16* %23, align 2
  %299 = zext i16 %298 to i64
  %300 = add i64 %299, 20
  %301 = trunc i64 %300 to i16
  %302 = zext i16 %301 to i32
  %303 = shl i32 %302, 8
  %304 = ashr i32 %303, 8
  %305 = shl i32 %304, 8
  %306 = load i16, i16* %23, align 2
  %307 = zext i16 %306 to i64
  %308 = add i64 %307, 20
  %309 = trunc i64 %308 to i16
  %310 = zext i16 %309 to i32
  %311 = ashr i32 %310, 8
  %312 = or i32 %305, %311
  %313 = trunc i32 %312 to i16
  %314 = zext i16 %313 to i32
  br label %322

315:                                              ; preds = %253
  %316 = load i16, i16* %23, align 2
  %317 = zext i16 %316 to i64
  %318 = add i64 %317, 20
  %319 = trunc i64 %318 to i16
  %320 = call i16 @llvm.bswap.i16(i16 %319) #5
  %321 = zext i16 %320 to i32
  br label %322

322:                                              ; preds = %315, %297
  %323 = phi i32 [ %314, %297 ], [ %321, %315 ]
  %324 = trunc i32 %323 to i16
  %325 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %326 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %325, i32 0, i32 2
  store i16 %324, i16* %326, align 2
  %327 = load %struct.iptnl_info*, %struct.iptnl_info** %18, align 8
  %328 = getelementptr inbounds %struct.iptnl_info, %struct.iptnl_info* %327, i32 0, i32 1
  %329 = bitcast %union.anon.2* %328 to i32*
  %330 = load i32, i32* %329, align 4
  %331 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %332 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %331, i32 0, i32 8
  %333 = bitcast %union.anon.3* %332 to %struct.anon.4*
  %334 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %333, i32 0, i32 1
  store i32 %330, i32* %334, align 4
  %335 = load %struct.iptnl_info*, %struct.iptnl_info** %18, align 8
  %336 = getelementptr inbounds %struct.iptnl_info, %struct.iptnl_info* %335, i32 0, i32 0
  %337 = bitcast %union.anon.1* %336 to i32*
  %338 = load i32, i32* %337, align 4
  %339 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %340 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %339, i32 0, i32 8
  %341 = bitcast %union.anon.3* %340 to %struct.anon.4*
  %342 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %341, i32 0, i32 0
  store i32 %338, i32* %342, align 4
  %343 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %344 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %343, i32 0, i32 5
  store i8 8, i8* %344, align 4
  %345 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %346 = bitcast %struct.iphdr* %345 to i16*
  store i16* %346, i16** %22, align 8
  store i32 0, i32* %27, align 4
  br label %347

347:                                              ; preds = %351, %322
  %348 = load i32, i32* %27, align 4
  %349 = sext i32 %348 to i64
  %350 = icmp ult i64 %349, 10
  br i1 %350, label %351, label %360

351:                                              ; preds = %347
  %352 = load i16*, i16** %22, align 8
  %353 = getelementptr inbounds i16, i16* %352, i32 1
  store i16* %353, i16** %22, align 8
  %354 = load i16, i16* %352, align 2
  %355 = zext i16 %354 to i32
  %356 = load i32, i32* %26, align 4
  %357 = add i32 %356, %355
  store i32 %357, i32* %26, align 4
  %358 = load i32, i32* %27, align 4
  %359 = add nsw i32 %358, 1
  store i32 %359, i32* %27, align 4
  br label %347, !llvm.loop !3

360:                                              ; preds = %347
  %361 = load i32, i32* %26, align 4
  %362 = and i32 %361, 65535
  %363 = load i32, i32* %26, align 4
  %364 = lshr i32 %363, 16
  %365 = add i32 %362, %364
  %366 = xor i32 %365, -1
  %367 = trunc i32 %366 to i16
  %368 = load %struct.iphdr*, %struct.iphdr** %21, align 8
  %369 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %368, i32 0, i32 7
  store i16 %367, i16* %369, align 2
  %370 = getelementptr inbounds %struct.vip, %struct.vip* %24, i32 0, i32 3
  %371 = load i8, i8* %370, align 4
  %372 = zext i8 %371 to i32
  store i32 %372, i32* %2, align 4
  %373 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %374 = bitcast i32* %2 to i8*
  %375 = call i8* %373(i8* noundef bitcast (%struct.anon* @rxcnt to i8*), i8* noundef %374) #5
  %376 = bitcast i8* %375 to i64*
  store i64* %376, i64** %3, align 8
  %377 = load i64*, i64** %3, align 8
  %378 = icmp ne i64* %377, null
  br i1 %378, label %379, label %383

379:                                              ; preds = %360
  %380 = load i64*, i64** %3, align 8
  %381 = load i64, i64* %380, align 8
  %382 = add i64 %381, 1
  store i64 %382, i64* %380, align 8
  br label %383

383:                                              ; preds = %360, %379
  %384 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %385 = call i64 (i8*, i32, ...) %384(i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @handle_ipv4.____fmt.7, i64 0, i64 0), i32 noundef 20) #5
  store i64 %385, i64* %35, align 8
  %386 = load i64, i64* %35, align 8
  store i32 3, i32* %14, align 4
  br label %387

387:                                              ; preds = %91, %138, %203, %212, %252, %383
  %388 = load i32, i32* %14, align 4
  store i32 %388, i32* %36, align 4
  br label %390

389:                                              ; preds = %60
  store i32 2, i32* %36, align 4
  br label %390

390:                                              ; preds = %389, %387, %59
  %391 = load i32, i32* %36, align 4
  ret i32 %391
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i16(i16) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #3

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i64(i64) #2

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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.mustprogress"}
!5 = !{!"llvm.loop.unroll.full"}

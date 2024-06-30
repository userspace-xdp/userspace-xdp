; ModuleID = 'xdp_adjust_tail.bpf.c'
source_filename = "xdp_adjust_tail.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { [2 x i32]*, i32*, i64*, [1 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon.0 }
%struct.anon.0 = type { i32, i32 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.2 }
%union.anon.2 = type { i32 }
%struct.anon.4 = type { i16, i16 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1
@icmpcnt = dso_local global %struct.anon zeroinitializer, section ".maps", align 8
@max_pcktsz = internal global i32 128, align 4
@bpf_xdp_adjust_tail = internal global i64 (%struct.xdp_md*, i32)* inttoptr (i64 65 to i64 (%struct.xdp_md*, i32)*), align 8
@bpf_xdp_adjust_head = internal global i64 (%struct.xdp_md*, i32)* inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*), align 8
@send_icmp4_too_big.____fmt = internal constant [24 x i8] c"xdp_adjust_head failed\0A\00", align 1
@bpf_trace_printk = internal global i64 (i8*, i32, ...)* inttoptr (i64 6 to i64 (i8*, i32, ...)*), align 8
@send_icmp4_too_big.____fmt.1 = internal constant [62 x i8] c"Invalid packet data + ICMP_TOOBIG_SIZE + headroom > data_end\0A\00", align 1
@send_icmp4_too_big.____fmt.2 = internal constant [57 x i8] c"data: %p, ICMP_TOOBIG_SIZE + headroom: %d, data_end: %p\0A\00", align 1
@bpf_csum_diff = internal global i64 (i32*, i32, i32*, i32, i32)* inttoptr (i64 28 to i64 (i32*, i32, i32*, i32, i32)*), align 8
@bpf_map_lookup_elem = internal global i8* (i8*, i8*)* inttoptr (i64 1 to i8* (i8*, i8*)*), align 8
@llvm.compiler.used = appending global [3 x i8*] [i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon* @icmpcnt to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @xdp_pass(%struct.xdp_md* noundef %0) #0 section "xdp" {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca %struct.ethhdr*, align 8
  %14 = alloca %struct.ethhdr*, align 8
  %15 = alloca i32, align 4
  %16 = alloca %struct.xdp_md*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i64, align 8
  %19 = alloca i8*, align 8
  %20 = alloca i8*, align 8
  %21 = alloca i64, align 8
  %22 = alloca i64, align 8
  %23 = alloca %struct.iphdr*, align 8
  %24 = alloca %struct.iphdr*, align 8
  %25 = alloca %struct.icmphdr*, align 8
  %26 = alloca %struct.ethhdr*, align 8
  %27 = alloca i32, align 4
  %28 = alloca i64, align 8
  %29 = alloca i32, align 4
  %30 = alloca %struct.xdp_md*, align 8
  %31 = alloca i8*, align 8
  %32 = alloca i8*, align 8
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca %struct.xdp_md*, align 8
  %40 = alloca i8*, align 8
  %41 = alloca i8*, align 8
  %42 = alloca %struct.ethhdr*, align 8
  %43 = alloca i16, align 2
  store %struct.xdp_md* %0, %struct.xdp_md** %39, align 8
  %44 = load %struct.xdp_md*, %struct.xdp_md** %39, align 8
  %45 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %44, i32 0, i32 1
  %46 = load i64, i64* %45, align 8
  %47 = inttoptr i64 %46 to i8*
  store i8* %47, i8** %40, align 8
  %48 = load %struct.xdp_md*, %struct.xdp_md** %39, align 8
  %49 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %48, i32 0, i32 0
  %50 = load i64, i64* %49, align 8
  %51 = inttoptr i64 %50 to i8*
  store i8* %51, i8** %41, align 8
  %52 = load i8*, i8** %41, align 8
  %53 = bitcast i8* %52 to %struct.ethhdr*
  store %struct.ethhdr* %53, %struct.ethhdr** %42, align 8
  %54 = load %struct.ethhdr*, %struct.ethhdr** %42, align 8
  %55 = bitcast %struct.ethhdr* %54 to i8*
  %56 = getelementptr i8, i8* %55, i64 14
  %57 = load i8*, i8** %40, align 8
  %58 = icmp ugt i8* %56, %57
  br i1 %58, label %59, label %60

59:                                               ; preds = %1
  store i32 1, i32* %38, align 4
  br label %347

60:                                               ; preds = %1
  %61 = load %struct.ethhdr*, %struct.ethhdr** %42, align 8
  %62 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %61, i32 0, i32 2
  %63 = load i16, i16* %62, align 2
  store i16 %63, i16* %43, align 2
  %64 = load i16, i16* %43, align 2
  %65 = zext i16 %64 to i32
  %66 = icmp eq i32 %65, 8
  br i1 %66, label %67, label %346

67:                                               ; preds = %60
  %68 = load %struct.xdp_md*, %struct.xdp_md** %39, align 8
  store %struct.xdp_md* %68, %struct.xdp_md** %30, align 8
  %69 = load %struct.xdp_md*, %struct.xdp_md** %30, align 8
  %70 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %69, i32 0, i32 1
  %71 = load i64, i64* %70, align 8
  %72 = inttoptr i64 %71 to i8*
  store i8* %72, i8** %31, align 8
  %73 = load %struct.xdp_md*, %struct.xdp_md** %30, align 8
  %74 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %73, i32 0, i32 0
  %75 = load i64, i64* %74, align 8
  %76 = inttoptr i64 %75 to i8*
  store i8* %76, i8** %32, align 8
  %77 = load i8*, i8** %31, align 8
  %78 = load i8*, i8** %32, align 8
  %79 = ptrtoint i8* %77 to i64
  %80 = ptrtoint i8* %78 to i64
  %81 = sub i64 %79, %80
  %82 = trunc i64 %81 to i32
  store i32 %82, i32* %33, align 4
  %83 = load i32, i32* %33, align 4
  %84 = load volatile i32, i32* @max_pcktsz, align 4
  store volatile i32 %84, i32* %35, align 4
  store i32 98, i32* %36, align 4
  %85 = load volatile i32, i32* %35, align 4
  %86 = load i32, i32* %36, align 4
  %87 = icmp ugt i32 %85, %86
  br i1 %87, label %88, label %90

88:                                               ; preds = %67
  %89 = load volatile i32, i32* %35, align 4
  br label %92

90:                                               ; preds = %67
  %91 = load i32, i32* %36, align 4
  br label %92

92:                                               ; preds = %90, %88
  %93 = phi i32 [ %89, %88 ], [ %91, %90 ]
  store i32 %93, i32* %37, align 4
  %94 = load i32, i32* %37, align 4
  %95 = icmp ugt i32 %83, %94
  br i1 %95, label %96, label %343

96:                                               ; preds = %92
  %97 = load i32, i32* %33, align 4
  %98 = sub nsw i32 %97, 98
  store i32 %98, i32* %34, align 4
  %99 = load i64 (%struct.xdp_md*, i32)*, i64 (%struct.xdp_md*, i32)** @bpf_xdp_adjust_tail, align 8
  %100 = load %struct.xdp_md*, %struct.xdp_md** %30, align 8
  %101 = call i64 %99(%struct.xdp_md* noundef %100, i32 noundef 0) #4
  %102 = icmp ne i64 %101, 0
  br i1 %102, label %103, label %104

103:                                              ; preds = %96
  store i32 2, i32* %29, align 4
  br label %344

104:                                              ; preds = %96
  %105 = load %struct.xdp_md*, %struct.xdp_md** %30, align 8
  store %struct.xdp_md* %105, %struct.xdp_md** %16, align 8
  store i32 28, i32* %17, align 4
  %106 = load i64 (%struct.xdp_md*, i32)*, i64 (%struct.xdp_md*, i32)** @bpf_xdp_adjust_head, align 8
  %107 = load %struct.xdp_md*, %struct.xdp_md** %16, align 8
  %108 = load i32, i32* %17, align 4
  %109 = sub nsw i32 0, %108
  %110 = call i64 %106(%struct.xdp_md* noundef %107, i32 noundef %109) #4
  %111 = icmp ne i64 %110, 0
  br i1 %111, label %112, label %116

112:                                              ; preds = %104
  %113 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %114 = call i64 (i8*, i32, ...) %113(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @send_icmp4_too_big.____fmt, i64 0, i64 0), i32 noundef 24) #4
  store i64 %114, i64* %18, align 8
  %115 = load i64, i64* %18, align 8
  store i32 1, i32* %15, align 4
  br label %341

116:                                              ; preds = %104
  %117 = load %struct.xdp_md*, %struct.xdp_md** %16, align 8
  %118 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %117, i32 0, i32 0
  %119 = load i64, i64* %118, align 8
  %120 = inttoptr i64 %119 to i8*
  store i8* %120, i8** %19, align 8
  %121 = load %struct.xdp_md*, %struct.xdp_md** %16, align 8
  %122 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %121, i32 0, i32 1
  %123 = load i64, i64* %122, align 8
  %124 = inttoptr i64 %123 to i8*
  store i8* %124, i8** %20, align 8
  %125 = load i8*, i8** %19, align 8
  %126 = load i32, i32* %17, align 4
  %127 = add nsw i32 98, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr i8, i8* %125, i64 %128
  %130 = load i8*, i8** %20, align 8
  %131 = icmp ugt i8* %129, %130
  br i1 %131, label %132, label %143

132:                                              ; preds = %116
  %133 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %134 = call i64 (i8*, i32, ...) %133(i8* noundef getelementptr inbounds ([62 x i8], [62 x i8]* @send_icmp4_too_big.____fmt.1, i64 0, i64 0), i32 noundef 62) #4
  store i64 %134, i64* %21, align 8
  %135 = load i64, i64* %21, align 8
  %136 = load i64 (i8*, i32, ...)*, i64 (i8*, i32, ...)** @bpf_trace_printk, align 8
  %137 = load i8*, i8** %19, align 8
  %138 = load i32, i32* %17, align 4
  %139 = add nsw i32 98, %138
  %140 = load i8*, i8** %20, align 8
  %141 = call i64 (i8*, i32, ...) %136(i8* noundef getelementptr inbounds ([57 x i8], [57 x i8]* @send_icmp4_too_big.____fmt.2, i64 0, i64 0), i32 noundef 57, i8* noundef %137, i32 noundef %139, i8* noundef %140) #4
  store i64 %141, i64* %22, align 8
  %142 = load i64, i64* %22, align 8
  store i32 1, i32* %15, align 4
  br label %341

143:                                              ; preds = %116
  store i32 0, i32* %27, align 4
  store i64 0, i64* %28, align 8
  %144 = load i8*, i8** %19, align 8
  %145 = load i32, i32* %17, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr i8, i8* %144, i64 %146
  %148 = bitcast i8* %147 to %struct.ethhdr*
  store %struct.ethhdr* %148, %struct.ethhdr** %26, align 8
  %149 = load i8*, i8** %19, align 8
  %150 = load %struct.ethhdr*, %struct.ethhdr** %26, align 8
  store i8* %149, i8** %12, align 8
  store %struct.ethhdr* %150, %struct.ethhdr** %13, align 8
  %151 = load i8*, i8** %12, align 8
  %152 = bitcast i8* %151 to %struct.ethhdr*
  store %struct.ethhdr* %152, %struct.ethhdr** %14, align 8
  %153 = load %struct.ethhdr*, %struct.ethhdr** %14, align 8
  %154 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %153, i32 0, i32 1
  %155 = getelementptr inbounds [6 x i8], [6 x i8]* %154, i64 0, i64 0
  %156 = load %struct.ethhdr*, %struct.ethhdr** %13, align 8
  %157 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %156, i32 0, i32 0
  %158 = getelementptr inbounds [6 x i8], [6 x i8]* %157, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %155, i8* align 2 %158, i64 6, i1 false) #4
  %159 = load %struct.ethhdr*, %struct.ethhdr** %14, align 8
  %160 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %159, i32 0, i32 0
  %161 = getelementptr inbounds [6 x i8], [6 x i8]* %160, i64 0, i64 0
  %162 = load %struct.ethhdr*, %struct.ethhdr** %13, align 8
  %163 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %162, i32 0, i32 1
  %164 = getelementptr inbounds [6 x i8], [6 x i8]* %163, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %161, i8* align 2 %164, i64 6, i1 false) #4
  %165 = load %struct.ethhdr*, %struct.ethhdr** %13, align 8
  %166 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %165, i32 0, i32 2
  %167 = load i16, i16* %166, align 2
  %168 = load %struct.ethhdr*, %struct.ethhdr** %14, align 8
  %169 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %168, i32 0, i32 2
  store i16 %167, i16* %169, align 2
  %170 = load i64, i64* %28, align 8
  %171 = add i64 %170, 14
  store i64 %171, i64* %28, align 8
  %172 = load i8*, i8** %19, align 8
  %173 = load i64, i64* %28, align 8
  %174 = getelementptr i8, i8* %172, i64 %173
  %175 = bitcast i8* %174 to %struct.iphdr*
  store %struct.iphdr* %175, %struct.iphdr** %23, align 8
  %176 = load i64, i64* %28, align 8
  %177 = add i64 %176, 20
  store i64 %177, i64* %28, align 8
  %178 = load i8*, i8** %19, align 8
  %179 = load i64, i64* %28, align 8
  %180 = getelementptr i8, i8* %178, i64 %179
  %181 = bitcast i8* %180 to %struct.icmphdr*
  store %struct.icmphdr* %181, %struct.icmphdr** %25, align 8
  %182 = load i64, i64* %28, align 8
  %183 = add i64 %182, 8
  store i64 %183, i64* %28, align 8
  %184 = load i8*, i8** %19, align 8
  %185 = load i64, i64* %28, align 8
  %186 = getelementptr i8, i8* %184, i64 %185
  %187 = bitcast i8* %186 to %struct.iphdr*
  store %struct.iphdr* %187, %struct.iphdr** %24, align 8
  %188 = load %struct.icmphdr*, %struct.icmphdr** %25, align 8
  %189 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %188, i32 0, i32 0
  store i8 3, i8* %189, align 4
  %190 = load %struct.icmphdr*, %struct.icmphdr** %25, align 8
  %191 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %190, i32 0, i32 1
  store i8 4, i8* %191, align 1
  %192 = load volatile i32, i32* @max_pcktsz, align 4
  %193 = zext i32 %192 to i64
  %194 = sub i64 %193, 14
  %195 = trunc i64 %194 to i16
  %196 = call i16 @llvm.bswap.i16(i16 %195) #4
  %197 = zext i16 %196 to i32
  %198 = load %struct.icmphdr*, %struct.icmphdr** %25, align 8
  %199 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %198, i32 0, i32 3
  %200 = bitcast %union.anon.2* %199 to %struct.anon.4*
  %201 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %200, i32 0, i32 1
  store i16 %196, i16* %201, align 2
  %202 = load %struct.icmphdr*, %struct.icmphdr** %25, align 8
  %203 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %202, i32 0, i32 2
  store i16 0, i16* %203, align 2
  %204 = load %struct.icmphdr*, %struct.icmphdr** %25, align 8
  %205 = bitcast %struct.icmphdr* %204 to i8*
  store i8* %205, i8** %6, align 8
  store i32 92, i32* %7, align 4
  store i32* %27, i32** %8, align 8
  %206 = load i64 (i32*, i32, i32*, i32, i32)*, i64 (i32*, i32, i32*, i32, i32)** @bpf_csum_diff, align 8
  %207 = load i8*, i8** %6, align 8
  %208 = bitcast i8* %207 to i32*
  %209 = load i32, i32* %7, align 4
  %210 = load i32*, i32** %8, align 8
  %211 = load i32, i32* %210, align 4
  %212 = call i64 %206(i32* noundef null, i32 noundef 0, i32* noundef %208, i32 noundef %209, i32 noundef %211) #4
  %213 = trunc i64 %212 to i32
  %214 = load i32*, i32** %8, align 8
  store i32 %213, i32* %214, align 4
  %215 = load i32*, i32** %8, align 8
  %216 = load i32, i32* %215, align 4
  store i32 %216, i32* %3, align 4
  %217 = load i32, i32* %3, align 4
  %218 = and i32 %217, 65535
  %219 = load i32, i32* %3, align 4
  %220 = lshr i32 %219, 16
  %221 = add i32 %218, %220
  %222 = xor i32 %221, -1
  %223 = trunc i32 %222 to i16
  %224 = zext i16 %223 to i32
  %225 = load i32*, i32** %8, align 8
  store i32 %224, i32* %225, align 4
  %226 = load i32, i32* %27, align 4
  %227 = trunc i32 %226 to i16
  %228 = load %struct.icmphdr*, %struct.icmphdr** %25, align 8
  %229 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %228, i32 0, i32 2
  store i16 %227, i16* %229, align 2
  %230 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %231 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %230, i32 0, i32 5
  store i8 64, i8* %231, align 4
  %232 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %233 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %232, i32 0, i32 8
  %234 = bitcast %union.anon* %233 to %struct.anon.0*
  %235 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %234, i32 0, i32 0
  %236 = load i32, i32* %235, align 4
  %237 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %238 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %237, i32 0, i32 8
  %239 = bitcast %union.anon* %238 to %struct.anon.0*
  %240 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %239, i32 0, i32 1
  store i32 %236, i32* %240, align 4
  %241 = load %struct.iphdr*, %struct.iphdr** %24, align 8
  %242 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %241, i32 0, i32 8
  %243 = bitcast %union.anon* %242 to %struct.anon.0*
  %244 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %243, i32 0, i32 1
  %245 = load i32, i32* %244, align 4
  %246 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %247 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %246, i32 0, i32 8
  %248 = bitcast %union.anon* %247 to %struct.anon.0*
  %249 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %248, i32 0, i32 0
  store i32 %245, i32* %249, align 4
  %250 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %251 = bitcast %struct.iphdr* %250 to i8*
  %252 = load i8, i8* %251, align 4
  %253 = and i8 %252, 15
  %254 = or i8 %253, 64
  store i8 %254, i8* %251, align 4
  %255 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %256 = bitcast %struct.iphdr* %255 to i8*
  %257 = load i8, i8* %256, align 4
  %258 = and i8 %257, -16
  %259 = or i8 %258, 5
  store i8 %259, i8* %256, align 4
  %260 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %261 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %260, i32 0, i32 6
  store i8 1, i8* %261, align 1
  %262 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %263 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %262, i32 0, i32 1
  store i8 0, i8* %263, align 1
  %264 = load i32, i32* %17, align 4
  %265 = add nsw i32 98, %264
  %266 = sext i32 %265 to i64
  %267 = sub i64 %266, 14
  %268 = call i1 @llvm.is.constant.i64(i64 %267) #4
  br i1 %268, label %269, label %289

269:                                              ; preds = %143
  %270 = load i32, i32* %17, align 4
  %271 = add nsw i32 98, %270
  %272 = sext i32 %271 to i64
  %273 = sub i64 %272, 14
  %274 = trunc i64 %273 to i16
  %275 = zext i16 %274 to i32
  %276 = shl i32 %275, 8
  %277 = ashr i32 %276, 8
  %278 = shl i32 %277, 8
  %279 = load i32, i32* %17, align 4
  %280 = add nsw i32 98, %279
  %281 = sext i32 %280 to i64
  %282 = sub i64 %281, 14
  %283 = trunc i64 %282 to i16
  %284 = zext i16 %283 to i32
  %285 = ashr i32 %284, 8
  %286 = or i32 %278, %285
  %287 = trunc i32 %286 to i16
  %288 = zext i16 %287 to i32
  br label %297

289:                                              ; preds = %143
  %290 = load i32, i32* %17, align 4
  %291 = add nsw i32 98, %290
  %292 = sext i32 %291 to i64
  %293 = sub i64 %292, 14
  %294 = trunc i64 %293 to i16
  %295 = call i16 @llvm.bswap.i16(i16 %294) #4
  %296 = zext i16 %295 to i32
  br label %297

297:                                              ; preds = %289, %269
  %298 = phi i32 [ %288, %269 ], [ %296, %289 ]
  %299 = trunc i32 %298 to i16
  %300 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %301 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %300, i32 0, i32 2
  store i16 %299, i16* %301, align 2
  %302 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %303 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %302, i32 0, i32 7
  store i16 0, i16* %303, align 2
  store i32 0, i32* %27, align 4
  %304 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %305 = bitcast %struct.iphdr* %304 to i8*
  store i8* %305, i8** %9, align 8
  store i32 20, i32* %10, align 4
  store i32* %27, i32** %11, align 8
  %306 = load i64 (i32*, i32, i32*, i32, i32)*, i64 (i32*, i32, i32*, i32, i32)** @bpf_csum_diff, align 8
  %307 = load i8*, i8** %9, align 8
  %308 = bitcast i8* %307 to i32*
  %309 = load i32, i32* %10, align 4
  %310 = load i32*, i32** %11, align 8
  %311 = load i32, i32* %310, align 4
  %312 = call i64 %306(i32* noundef null, i32 noundef 0, i32* noundef %308, i32 noundef %309, i32 noundef %311) #4
  %313 = trunc i64 %312 to i32
  %314 = load i32*, i32** %11, align 8
  store i32 %313, i32* %314, align 4
  %315 = load i32*, i32** %11, align 8
  %316 = load i32, i32* %315, align 4
  store i32 %316, i32* %2, align 4
  %317 = load i32, i32* %2, align 4
  %318 = and i32 %317, 65535
  %319 = load i32, i32* %2, align 4
  %320 = lshr i32 %319, 16
  %321 = add i32 %318, %320
  %322 = xor i32 %321, -1
  %323 = trunc i32 %322 to i16
  %324 = zext i16 %323 to i32
  %325 = load i32*, i32** %11, align 8
  store i32 %324, i32* %325, align 4
  %326 = load i32, i32* %27, align 4
  %327 = trunc i32 %326 to i16
  %328 = load %struct.iphdr*, %struct.iphdr** %23, align 8
  %329 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %328, i32 0, i32 7
  store i16 %327, i16* %329, align 2
  store i64 0, i64* %4, align 8
  %330 = load i8* (i8*, i8*)*, i8* (i8*, i8*)** @bpf_map_lookup_elem, align 8
  %331 = bitcast i64* %4 to i8*
  %332 = call i8* %330(i8* noundef bitcast (%struct.anon* @icmpcnt to i8*), i8* noundef %331) #4
  %333 = bitcast i8* %332 to i64*
  store i64* %333, i64** %5, align 8
  %334 = load i64*, i64** %5, align 8
  %335 = icmp ne i64* %334, null
  br i1 %335, label %336, label %340

336:                                              ; preds = %297
  %337 = load i64*, i64** %5, align 8
  %338 = load i64, i64* %337, align 8
  %339 = add i64 %338, 1
  store i64 %339, i64* %337, align 8
  br label %340

340:                                              ; preds = %297, %336
  store i32 3, i32* %15, align 4
  br label %341

341:                                              ; preds = %112, %132, %340
  %342 = load i32, i32* %15, align 4
  store i32 %342, i32* %29, align 4
  br label %344

343:                                              ; preds = %92
  store i32 2, i32* %29, align 4
  br label %344

344:                                              ; preds = %103, %341, %343
  %345 = load i32, i32* %29, align 4
  store i32 %345, i32* %38, align 4
  br label %347

346:                                              ; preds = %60
  store i32 2, i32* %38, align 4
  br label %347

347:                                              ; preds = %346, %344, %59
  %348 = load i32, i32* %38, align 4
  ret i32 %348
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i64(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { convergent nofree nosync nounwind readnone willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

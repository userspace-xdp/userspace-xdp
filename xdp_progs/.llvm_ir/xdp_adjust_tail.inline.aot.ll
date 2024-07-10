; ModuleID = 'xdp_adjust_tail.bpf.c'
source_filename = "xdp_adjust_tail.bpf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { [2 x i32]*, i32*, i64*, [1 x i32]* }
%struct.xdp_md = type { i64, i64, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon }
%union.anon = type { %struct.anon.0 }
%struct.anon.0 = type { i32, i32 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.2 }
%union.anon.2 = type { i32 }
%struct.anon.4 = type { i16, i16 }

@_license = dso_local global [4 x i8] c"GPL\00", align 1
@icmpcnt = dso_local global %struct.anon zeroinitializer, align 8
@max_pcktsz = internal global i32 128, align 4
@__const.send_icmp4_too_big.____fmt = private unnamed_addr constant [24 x i8] c"xdp_adjust_head failed\0A\00", align 16
@__const.send_icmp4_too_big.____fmt.1 = private unnamed_addr constant [62 x i8] c"Invalid packet data + ICMP_TOOBIG_SIZE + headroom > data_end\0A\00", align 16
@__const.send_icmp4_too_big.____fmt.2 = private unnamed_addr constant [57 x i8] c"data: %p, ICMP_TOOBIG_SIZE + headroom: %d, data_end: %p\0A\00", align 16
@icmpcnt_id = internal constant i64 17179869184, align 8
@__icmpcnt = internal global [1 x i64] zeroinitializer, align 8

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
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32*, align 8
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32*, align 8
  %15 = alloca i8*, align 8
  %16 = alloca %struct.ethhdr*, align 8
  %17 = alloca %struct.ethhdr*, align 8
  %18 = alloca i32, align 4
  %19 = alloca %struct.xdp_md*, align 8
  %20 = alloca i32, align 4
  %21 = alloca [24 x i8], align 16
  %22 = alloca i32, align 4
  %23 = alloca i8*, align 8
  %24 = alloca i8*, align 8
  %25 = alloca [62 x i8], align 16
  %26 = alloca i32, align 4
  %27 = alloca [57 x i8], align 16
  %28 = alloca i32, align 4
  %29 = alloca %struct.iphdr*, align 8
  %30 = alloca %struct.iphdr*, align 8
  %31 = alloca %struct.icmphdr*, align 8
  %32 = alloca %struct.ethhdr*, align 8
  %33 = alloca i32, align 4
  %34 = alloca i64, align 8
  %35 = alloca i32, align 4
  %36 = alloca %struct.xdp_md*, align 8
  %37 = alloca i8*, align 8
  %38 = alloca i8*, align 8
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca %struct.xdp_md*, align 8
  %46 = alloca i8*, align 8
  %47 = alloca i8*, align 8
  %48 = alloca %struct.ethhdr*, align 8
  %49 = alloca i16, align 2
  store %struct.xdp_md* %0, %struct.xdp_md** %45, align 8
  %50 = load %struct.xdp_md*, %struct.xdp_md** %45, align 8
  %51 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %50, i32 0, i32 1
  %52 = load i64, i64* %51, align 8
  %53 = inttoptr i64 %52 to i8*
  store i8* %53, i8** %46, align 8
  %54 = load %struct.xdp_md*, %struct.xdp_md** %45, align 8
  %55 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %54, i32 0, i32 0
  %56 = load i64, i64* %55, align 8
  %57 = inttoptr i64 %56 to i8*
  store i8* %57, i8** %47, align 8
  %58 = load i8*, i8** %47, align 8
  %59 = bitcast i8* %58 to %struct.ethhdr*
  store %struct.ethhdr* %59, %struct.ethhdr** %48, align 8
  %60 = load %struct.ethhdr*, %struct.ethhdr** %48, align 8
  %61 = bitcast %struct.ethhdr* %60 to i8*
  %62 = getelementptr i8, i8* %61, i64 14
  %63 = load i8*, i8** %46, align 8
  %64 = icmp ugt i8* %62, %63
  br i1 %64, label %65, label %66

65:                                               ; preds = %1
  store i32 1, i32* %44, align 4
  br label %357

66:                                               ; preds = %1
  %67 = load %struct.ethhdr*, %struct.ethhdr** %48, align 8
  %68 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %67, i32 0, i32 2
  %69 = load i16, i16* %68, align 2
  store i16 %69, i16* %49, align 2
  %70 = load i16, i16* %49, align 2
  %71 = zext i16 %70 to i32
  %72 = icmp eq i32 %71, 8
  br i1 %72, label %73, label %356

73:                                               ; preds = %66
  %74 = load %struct.xdp_md*, %struct.xdp_md** %45, align 8
  store %struct.xdp_md* %74, %struct.xdp_md** %36, align 8
  %75 = load %struct.xdp_md*, %struct.xdp_md** %36, align 8
  %76 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %75, i32 0, i32 1
  %77 = load i64, i64* %76, align 8
  %78 = inttoptr i64 %77 to i8*
  store i8* %78, i8** %37, align 8
  %79 = load %struct.xdp_md*, %struct.xdp_md** %36, align 8
  %80 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %79, i32 0, i32 0
  %81 = load i64, i64* %80, align 8
  %82 = inttoptr i64 %81 to i8*
  store i8* %82, i8** %38, align 8
  %83 = load i8*, i8** %37, align 8
  %84 = load i8*, i8** %38, align 8
  %85 = ptrtoint i8* %83 to i64
  %86 = ptrtoint i8* %84 to i64
  %87 = sub i64 %85, %86
  %88 = trunc i64 %87 to i32
  store i32 %88, i32* %39, align 4
  %89 = load i32, i32* %39, align 4
  %90 = load volatile i32, i32* @max_pcktsz, align 4
  store volatile i32 %90, i32* %41, align 4
  store i32 98, i32* %42, align 4
  %91 = load volatile i32, i32* %41, align 4
  %92 = load i32, i32* %42, align 4
  %93 = icmp ugt i32 %91, %92
  br i1 %93, label %94, label %96

94:                                               ; preds = %73
  %95 = load volatile i32, i32* %41, align 4
  br label %98

96:                                               ; preds = %73
  %97 = load i32, i32* %42, align 4
  br label %98

98:                                               ; preds = %96, %94
  %99 = phi i32 [ %95, %94 ], [ %97, %96 ]
  store i32 %99, i32* %43, align 4
  %100 = load i32, i32* %43, align 4
  %101 = icmp ugt i32 %89, %100
  br i1 %101, label %102, label %353

102:                                              ; preds = %98
  %103 = load i32, i32* %39, align 4
  %104 = sub nsw i32 %103, 98
  store i32 %104, i32* %40, align 4
  %105 = load %struct.xdp_md*, %struct.xdp_md** %36, align 8
  %106 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0065 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef %105, i32 noundef 0) #5
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %109

108:                                              ; preds = %102
  store i32 2, i32* %35, align 4
  br label %354

109:                                              ; preds = %102
  %110 = load %struct.xdp_md*, %struct.xdp_md** %36, align 8
  store %struct.xdp_md* %110, %struct.xdp_md** %19, align 8
  store i32 28, i32* %20, align 4
  %111 = load %struct.xdp_md*, %struct.xdp_md** %19, align 8
  %112 = load i32, i32* %20, align 4
  %113 = sub nsw i32 0, %112
  %114 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef %111, i32 noundef %113) #5
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %116, label %121

116:                                              ; preds = %109
  %117 = bitcast [24 x i8]* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %117, i8* align 16 getelementptr inbounds ([24 x i8], [24 x i8]* @__const.send_icmp4_too_big.____fmt, i32 0, i32 0), i64 24, i1 false) #5
  %118 = getelementptr inbounds [24 x i8], [24 x i8]* %21, i64 0, i64 0
  %119 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %118, i64 noundef 24) #5
  store i32 %119, i32* %22, align 4
  %120 = load i32, i32* %22, align 4
  store i32 1, i32* %18, align 4
  br label %351

121:                                              ; preds = %109
  %122 = load %struct.xdp_md*, %struct.xdp_md** %19, align 8
  %123 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %122, i32 0, i32 0
  %124 = load i64, i64* %123, align 8
  %125 = inttoptr i64 %124 to i8*
  store i8* %125, i8** %23, align 8
  %126 = load %struct.xdp_md*, %struct.xdp_md** %19, align 8
  %127 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %126, i32 0, i32 1
  %128 = load i64, i64* %127, align 8
  %129 = inttoptr i64 %128 to i8*
  store i8* %129, i8** %24, align 8
  %130 = load i8*, i8** %23, align 8
  %131 = load i32, i32* %20, align 4
  %132 = add nsw i32 98, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr i8, i8* %130, i64 %133
  %135 = load i8*, i8** %24, align 8
  %136 = icmp ugt i8* %134, %135
  br i1 %136, label %137, label %150

137:                                              ; preds = %121
  %138 = bitcast [62 x i8]* %25 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %138, i8* align 16 getelementptr inbounds ([62 x i8], [62 x i8]* @__const.send_icmp4_too_big.____fmt.1, i32 0, i32 0), i64 62, i1 false) #5
  %139 = getelementptr inbounds [62 x i8], [62 x i8]* %25, i64 0, i64 0
  %140 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %139, i64 noundef 62) #5
  store i32 %140, i32* %26, align 4
  %141 = load i32, i32* %26, align 4
  %142 = bitcast [57 x i8]* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %142, i8* align 16 getelementptr inbounds ([57 x i8], [57 x i8]* @__const.send_icmp4_too_big.____fmt.2, i32 0, i32 0), i64 57, i1 false) #5
  %143 = getelementptr inbounds [57 x i8], [57 x i8]* %27, i64 0, i64 0
  %144 = load i8*, i8** %23, align 8
  %145 = load i32, i32* %20, align 4
  %146 = add nsw i32 98, %145
  %147 = load i8*, i8** %24, align 8
  %148 = call i32 (i8*, i64, i8*, i32, i8*, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, i8*, i32, i8*, ...)*)(i8* noundef %143, i64 noundef 57, i8* noundef %144, i32 noundef %146, i8* noundef %147) #5
  store i32 %148, i32* %28, align 4
  %149 = load i32, i32* %28, align 4
  store i32 1, i32* %18, align 4
  br label %351

150:                                              ; preds = %121
  store i32 0, i32* %33, align 4
  store i64 0, i64* %34, align 8
  %151 = load i8*, i8** %23, align 8
  %152 = load i32, i32* %20, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr i8, i8* %151, i64 %153
  %155 = bitcast i8* %154 to %struct.ethhdr*
  store %struct.ethhdr* %155, %struct.ethhdr** %32, align 8
  %156 = load i8*, i8** %23, align 8
  %157 = load %struct.ethhdr*, %struct.ethhdr** %32, align 8
  store i8* %156, i8** %15, align 8
  store %struct.ethhdr* %157, %struct.ethhdr** %16, align 8
  %158 = load i8*, i8** %15, align 8
  %159 = bitcast i8* %158 to %struct.ethhdr*
  store %struct.ethhdr* %159, %struct.ethhdr** %17, align 8
  %160 = load %struct.ethhdr*, %struct.ethhdr** %17, align 8
  %161 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %160, i32 0, i32 1
  %162 = getelementptr inbounds [6 x i8], [6 x i8]* %161, i64 0, i64 0
  %163 = load %struct.ethhdr*, %struct.ethhdr** %16, align 8
  %164 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %163, i32 0, i32 0
  %165 = getelementptr inbounds [6 x i8], [6 x i8]* %164, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %162, i8* align 2 %165, i64 6, i1 false) #5
  %166 = load %struct.ethhdr*, %struct.ethhdr** %17, align 8
  %167 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %166, i32 0, i32 0
  %168 = getelementptr inbounds [6 x i8], [6 x i8]* %167, i64 0, i64 0
  %169 = load %struct.ethhdr*, %struct.ethhdr** %16, align 8
  %170 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %169, i32 0, i32 1
  %171 = getelementptr inbounds [6 x i8], [6 x i8]* %170, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %168, i8* align 2 %171, i64 6, i1 false) #5
  %172 = load %struct.ethhdr*, %struct.ethhdr** %16, align 8
  %173 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %172, i32 0, i32 2
  %174 = load i16, i16* %173, align 2
  %175 = load %struct.ethhdr*, %struct.ethhdr** %17, align 8
  %176 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %175, i32 0, i32 2
  store i16 %174, i16* %176, align 2
  %177 = load i64, i64* %34, align 8
  %178 = add i64 %177, 14
  store i64 %178, i64* %34, align 8
  %179 = load i8*, i8** %23, align 8
  %180 = load i64, i64* %34, align 8
  %181 = getelementptr i8, i8* %179, i64 %180
  %182 = bitcast i8* %181 to %struct.iphdr*
  store %struct.iphdr* %182, %struct.iphdr** %29, align 8
  %183 = load i64, i64* %34, align 8
  %184 = add i64 %183, 20
  store i64 %184, i64* %34, align 8
  %185 = load i8*, i8** %23, align 8
  %186 = load i64, i64* %34, align 8
  %187 = getelementptr i8, i8* %185, i64 %186
  %188 = bitcast i8* %187 to %struct.icmphdr*
  store %struct.icmphdr* %188, %struct.icmphdr** %31, align 8
  %189 = load i64, i64* %34, align 8
  %190 = add i64 %189, 8
  store i64 %190, i64* %34, align 8
  %191 = load i8*, i8** %23, align 8
  %192 = load i64, i64* %34, align 8
  %193 = getelementptr i8, i8* %191, i64 %192
  %194 = bitcast i8* %193 to %struct.iphdr*
  store %struct.iphdr* %194, %struct.iphdr** %30, align 8
  %195 = load %struct.icmphdr*, %struct.icmphdr** %31, align 8
  %196 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %195, i32 0, i32 0
  store i8 3, i8* %196, align 4
  %197 = load %struct.icmphdr*, %struct.icmphdr** %31, align 8
  %198 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %197, i32 0, i32 1
  store i8 4, i8* %198, align 1
  %199 = load volatile i32, i32* @max_pcktsz, align 4
  %200 = zext i32 %199 to i64
  %201 = sub i64 %200, 14
  %202 = trunc i64 %201 to i16
  %203 = call i16 @llvm.bswap.i16(i16 %202) #5
  %204 = zext i16 %203 to i32
  %205 = load %struct.icmphdr*, %struct.icmphdr** %31, align 8
  %206 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %205, i32 0, i32 3
  %207 = bitcast %union.anon.2* %206 to %struct.anon.4*
  %208 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %207, i32 0, i32 1
  store i16 %203, i16* %208, align 2
  %209 = load %struct.icmphdr*, %struct.icmphdr** %31, align 8
  %210 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %209, i32 0, i32 2
  store i16 0, i16* %210, align 2
  %211 = load %struct.icmphdr*, %struct.icmphdr** %31, align 8
  %212 = bitcast %struct.icmphdr* %211 to i8*
  store i8* %212, i8** %9, align 8
  store i32 92, i32* %10, align 4
  store i32* %33, i32** %11, align 8
  %213 = load i8*, i8** %9, align 8
  %214 = load i32, i32* %10, align 4
  %215 = load i32*, i32** %11, align 8
  %216 = load i32, i32* %215, align 4
  %217 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %213, i32 noundef %214, i32 noundef %216) #5
  %218 = load i32*, i32** %11, align 8
  store i32 %217, i32* %218, align 4
  %219 = load i32*, i32** %11, align 8
  %220 = load i32, i32* %219, align 4
  store i32 %220, i32* %6, align 4
  %221 = load i32, i32* %6, align 4
  %222 = and i32 %221, 65535
  %223 = load i32, i32* %6, align 4
  %224 = lshr i32 %223, 16
  %225 = add i32 %222, %224
  %226 = xor i32 %225, -1
  %227 = trunc i32 %226 to i16
  %228 = zext i16 %227 to i32
  %229 = load i32*, i32** %11, align 8
  store i32 %228, i32* %229, align 4
  %230 = load i32, i32* %33, align 4
  %231 = trunc i32 %230 to i16
  %232 = load %struct.icmphdr*, %struct.icmphdr** %31, align 8
  %233 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %232, i32 0, i32 2
  store i16 %231, i16* %233, align 2
  %234 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %235 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %234, i32 0, i32 5
  store i8 64, i8* %235, align 4
  %236 = load %struct.iphdr*, %struct.iphdr** %30, align 8
  %237 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %236, i32 0, i32 8
  %238 = bitcast %union.anon* %237 to %struct.anon.0*
  %239 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %238, i32 0, i32 0
  %240 = load i32, i32* %239, align 4
  %241 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %242 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %241, i32 0, i32 8
  %243 = bitcast %union.anon* %242 to %struct.anon.0*
  %244 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %243, i32 0, i32 1
  store i32 %240, i32* %244, align 4
  %245 = load %struct.iphdr*, %struct.iphdr** %30, align 8
  %246 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %245, i32 0, i32 8
  %247 = bitcast %union.anon* %246 to %struct.anon.0*
  %248 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %247, i32 0, i32 1
  %249 = load i32, i32* %248, align 4
  %250 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %251 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %250, i32 0, i32 8
  %252 = bitcast %union.anon* %251 to %struct.anon.0*
  %253 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %252, i32 0, i32 0
  store i32 %249, i32* %253, align 4
  %254 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %255 = bitcast %struct.iphdr* %254 to i8*
  %256 = load i8, i8* %255, align 4
  %257 = and i8 %256, 15
  %258 = or i8 %257, 64
  store i8 %258, i8* %255, align 4
  %259 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %260 = bitcast %struct.iphdr* %259 to i8*
  %261 = load i8, i8* %260, align 4
  %262 = and i8 %261, -16
  %263 = or i8 %262, 5
  store i8 %263, i8* %260, align 4
  %264 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %265 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %264, i32 0, i32 6
  store i8 1, i8* %265, align 1
  %266 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %267 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %266, i32 0, i32 1
  store i8 0, i8* %267, align 1
  %268 = load i32, i32* %20, align 4
  %269 = add nsw i32 98, %268
  %270 = sext i32 %269 to i64
  %271 = sub i64 %270, 14
  %272 = call i1 @llvm.is.constant.i64(i64 %271) #5
  br i1 %272, label %273, label %293

273:                                              ; preds = %150
  %274 = load i32, i32* %20, align 4
  %275 = add nsw i32 98, %274
  %276 = sext i32 %275 to i64
  %277 = sub i64 %276, 14
  %278 = trunc i64 %277 to i16
  %279 = zext i16 %278 to i32
  %280 = shl i32 %279, 8
  %281 = ashr i32 %280, 8
  %282 = shl i32 %281, 8
  %283 = load i32, i32* %20, align 4
  %284 = add nsw i32 98, %283
  %285 = sext i32 %284 to i64
  %286 = sub i64 %285, 14
  %287 = trunc i64 %286 to i16
  %288 = zext i16 %287 to i32
  %289 = ashr i32 %288, 8
  %290 = or i32 %282, %289
  %291 = trunc i32 %290 to i16
  %292 = zext i16 %291 to i32
  br label %301

293:                                              ; preds = %150
  %294 = load i32, i32* %20, align 4
  %295 = add nsw i32 98, %294
  %296 = sext i32 %295 to i64
  %297 = sub i64 %296, 14
  %298 = trunc i64 %297 to i16
  %299 = call i16 @llvm.bswap.i16(i16 %298) #5
  %300 = zext i16 %299 to i32
  br label %301

301:                                              ; preds = %293, %273
  %302 = phi i32 [ %292, %273 ], [ %300, %293 ]
  %303 = trunc i32 %302 to i16
  %304 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %305 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %304, i32 0, i32 2
  store i16 %303, i16* %305, align 2
  %306 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %307 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %306, i32 0, i32 7
  store i16 0, i16* %307, align 2
  store i32 0, i32* %33, align 4
  %308 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %309 = bitcast %struct.iphdr* %308 to i8*
  store i8* %309, i8** %12, align 8
  store i32 20, i32* %13, align 4
  store i32* %33, i32** %14, align 8
  %310 = load i8*, i8** %12, align 8
  %311 = load i32, i32* %13, align 4
  %312 = load i32*, i32** %14, align 8
  %313 = load i32, i32* %312, align 4
  %314 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %310, i32 noundef %311, i32 noundef %313) #5
  %315 = load i32*, i32** %14, align 8
  store i32 %314, i32* %315, align 4
  %316 = load i32*, i32** %14, align 8
  %317 = load i32, i32* %316, align 4
  store i32 %317, i32* %5, align 4
  %318 = load i32, i32* %5, align 4
  %319 = and i32 %318, 65535
  %320 = load i32, i32* %5, align 4
  %321 = lshr i32 %320, 16
  %322 = add i32 %319, %321
  %323 = xor i32 %322, -1
  %324 = trunc i32 %323 to i16
  %325 = zext i16 %324 to i32
  %326 = load i32*, i32** %14, align 8
  store i32 %325, i32* %326, align 4
  %327 = load i32, i32* %33, align 4
  %328 = trunc i32 %327 to i16
  %329 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %330 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %329, i32 0, i32 7
  store i16 %328, i16* %330, align 2
  store i64 0, i64* %7, align 8
  %331 = bitcast i64* %7 to i8*
  store i64* @icmpcnt_id, i64** %3, align 8
  store i8* %331, i8** %4, align 8
  %332 = load i64*, i64** %3, align 8
  %333 = load i64, i64* %332, align 8
  %334 = icmp eq i64 %333, 17179869184
  br i1 %334, label %335, label %336

335:                                              ; preds = %301
  store i8* bitcast ([1 x i64]* @__icmpcnt to i8*), i8** %2, align 8
  br label %341

336:                                              ; preds = %301
  %337 = load i64*, i64** %3, align 8
  %338 = load i64, i64* %337, align 8
  %339 = load i8*, i8** %4, align 8
  %340 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %338, i8* noundef %339) #5
  store i8* %340, i8** %2, align 8
  br label %341

341:                                              ; preds = %335, %336
  %342 = load i8*, i8** %2, align 8
  %343 = bitcast i8* %342 to i64*
  store i64* %343, i64** %8, align 8
  %344 = load i64*, i64** %8, align 8
  %345 = icmp ne i64* %344, null
  br i1 %345, label %346, label %350

346:                                              ; preds = %341
  %347 = load i64*, i64** %8, align 8
  %348 = load i64, i64* %347, align 8
  %349 = add i64 %348, 1
  store i64 %349, i64* %347, align 8
  br label %350

350:                                              ; preds = %341, %346
  store i32 3, i32* %18, align 4
  br label %351

351:                                              ; preds = %116, %137, %350
  %352 = load i32, i32* %18, align 4
  store i32 %352, i32* %35, align 4
  br label %354

353:                                              ; preds = %98
  store i32 2, i32* %35, align 4
  br label %354

354:                                              ; preds = %108, %351, %353
  %355 = load i32, i32* %35, align 4
  store i32 %355, i32* %44, align 4
  br label %357

356:                                              ; preds = %66
  store i32 2, i32* %44, align 4
  br label %357

357:                                              ; preds = %356, %354, %65
  %358 = load i32, i32* %44, align 4
  ret i32 %358
}

declare i32 @_bpf_helper_ext_0065(...) #1

declare i32 @_bpf_helper_ext_0044(...) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i32 @_bpf_helper_ext_0006(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #3

; Function Attrs: convergent nofree nosync nounwind readnone willreturn
declare i1 @llvm.is.constant.i64(i64) #4

declare i32 @_bpf_helper_ext_0028(...) #1

declare i8* @_bpf_helper_ext_0001(...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { convergent nofree nosync nounwind readnone willreturn }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}

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
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i64*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca %struct.ethhdr*, align 8
  %16 = alloca %struct.ethhdr*, align 8
  %17 = alloca i32, align 4
  %18 = alloca %struct.xdp_md*, align 8
  %19 = alloca i32, align 4
  %20 = alloca [24 x i8], align 16
  %21 = alloca i32, align 4
  %22 = alloca i8*, align 8
  %23 = alloca i8*, align 8
  %24 = alloca [62 x i8], align 16
  %25 = alloca i32, align 4
  %26 = alloca [57 x i8], align 16
  %27 = alloca i32, align 4
  %28 = alloca %struct.iphdr*, align 8
  %29 = alloca %struct.iphdr*, align 8
  %30 = alloca %struct.icmphdr*, align 8
  %31 = alloca %struct.ethhdr*, align 8
  %32 = alloca i32, align 4
  %33 = alloca i64, align 8
  %34 = alloca i32, align 4
  %35 = alloca %struct.xdp_md*, align 8
  %36 = alloca i8*, align 8
  %37 = alloca i8*, align 8
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca %struct.xdp_md*, align 8
  %45 = alloca i8*, align 8
  %46 = alloca i8*, align 8
  %47 = alloca %struct.ethhdr*, align 8
  %48 = alloca i16, align 2
  store %struct.xdp_md* %0, %struct.xdp_md** %44, align 8
  %49 = load %struct.xdp_md*, %struct.xdp_md** %44, align 8
  %50 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %49, i32 0, i32 1
  %51 = load i64, i64* %50, align 8
  %52 = inttoptr i64 %51 to i8*
  store i8* %52, i8** %45, align 8
  %53 = load %struct.xdp_md*, %struct.xdp_md** %44, align 8
  %54 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %53, i32 0, i32 0
  %55 = load i64, i64* %54, align 8
  %56 = inttoptr i64 %55 to i8*
  store i8* %56, i8** %46, align 8
  %57 = load i8*, i8** %46, align 8
  %58 = bitcast i8* %57 to %struct.ethhdr*
  store %struct.ethhdr* %58, %struct.ethhdr** %47, align 8
  %59 = load %struct.ethhdr*, %struct.ethhdr** %47, align 8
  %60 = bitcast %struct.ethhdr* %59 to i8*
  %61 = getelementptr i8, i8* %60, i64 14
  %62 = load i8*, i8** %45, align 8
  %63 = icmp ugt i8* %61, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %1
  store i32 1, i32* %43, align 4
  br label %349

65:                                               ; preds = %1
  %66 = load %struct.ethhdr*, %struct.ethhdr** %47, align 8
  %67 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %66, i32 0, i32 2
  %68 = load i16, i16* %67, align 2
  store i16 %68, i16* %48, align 2
  %69 = load i16, i16* %48, align 2
  %70 = zext i16 %69 to i32
  %71 = icmp eq i32 %70, 8
  br i1 %71, label %72, label %348

72:                                               ; preds = %65
  %73 = load %struct.xdp_md*, %struct.xdp_md** %44, align 8
  store %struct.xdp_md* %73, %struct.xdp_md** %35, align 8
  %74 = load %struct.xdp_md*, %struct.xdp_md** %35, align 8
  %75 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %74, i32 0, i32 1
  %76 = load i64, i64* %75, align 8
  %77 = inttoptr i64 %76 to i8*
  store i8* %77, i8** %36, align 8
  %78 = load %struct.xdp_md*, %struct.xdp_md** %35, align 8
  %79 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %78, i32 0, i32 0
  %80 = load i64, i64* %79, align 8
  %81 = inttoptr i64 %80 to i8*
  store i8* %81, i8** %37, align 8
  %82 = load i8*, i8** %36, align 8
  %83 = load i8*, i8** %37, align 8
  %84 = ptrtoint i8* %82 to i64
  %85 = ptrtoint i8* %83 to i64
  %86 = sub i64 %84, %85
  %87 = trunc i64 %86 to i32
  store i32 %87, i32* %38, align 4
  %88 = load i32, i32* %38, align 4
  %89 = load volatile i32, i32* @max_pcktsz, align 4
  store volatile i32 %89, i32* %40, align 4
  store i32 98, i32* %41, align 4
  %90 = load volatile i32, i32* %40, align 4
  %91 = load i32, i32* %41, align 4
  %92 = icmp ugt i32 %90, %91
  br i1 %92, label %93, label %95

93:                                               ; preds = %72
  %94 = load volatile i32, i32* %40, align 4
  br label %97

95:                                               ; preds = %72
  %96 = load i32, i32* %41, align 4
  br label %97

97:                                               ; preds = %95, %93
  %98 = phi i32 [ %94, %93 ], [ %96, %95 ]
  store i32 %98, i32* %42, align 4
  %99 = load i32, i32* %42, align 4
  %100 = icmp ugt i32 %88, %99
  br i1 %100, label %101, label %345

101:                                              ; preds = %97
  %102 = load i32, i32* %38, align 4
  %103 = sub nsw i32 %102, 98
  store i32 %103, i32* %39, align 4
  %104 = load %struct.xdp_md*, %struct.xdp_md** %35, align 8
  %105 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0065 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef %104, i32 noundef 0) #5
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %108

107:                                              ; preds = %101
  store i32 2, i32* %34, align 4
  br label %346

108:                                              ; preds = %101
  %109 = load %struct.xdp_md*, %struct.xdp_md** %35, align 8
  store %struct.xdp_md* %109, %struct.xdp_md** %18, align 8
  store i32 28, i32* %19, align 4
  %110 = load %struct.xdp_md*, %struct.xdp_md** %18, align 8
  %111 = load i32, i32* %19, align 4
  %112 = sub nsw i32 0, %111
  %113 = call i32 (%struct.xdp_md*, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0044 to i32 (%struct.xdp_md*, i32, ...)*)(%struct.xdp_md* noundef %110, i32 noundef %112) #5
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %120

115:                                              ; preds = %108
  %116 = bitcast [24 x i8]* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %116, i8* align 16 getelementptr inbounds ([24 x i8], [24 x i8]* @__const.send_icmp4_too_big.____fmt, i32 0, i32 0), i64 24, i1 false) #5
  %117 = getelementptr inbounds [24 x i8], [24 x i8]* %20, i64 0, i64 0
  %118 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %117, i64 noundef 24) #5
  store i32 %118, i32* %21, align 4
  %119 = load i32, i32* %21, align 4
  store i32 1, i32* %17, align 4
  br label %343

120:                                              ; preds = %108
  %121 = load %struct.xdp_md*, %struct.xdp_md** %18, align 8
  %122 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %121, i32 0, i32 0
  %123 = load i64, i64* %122, align 8
  %124 = inttoptr i64 %123 to i8*
  store i8* %124, i8** %22, align 8
  %125 = load %struct.xdp_md*, %struct.xdp_md** %18, align 8
  %126 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %125, i32 0, i32 1
  %127 = load i64, i64* %126, align 8
  %128 = inttoptr i64 %127 to i8*
  store i8* %128, i8** %23, align 8
  %129 = load i8*, i8** %22, align 8
  %130 = load i32, i32* %19, align 4
  %131 = add nsw i32 98, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr i8, i8* %129, i64 %132
  %134 = load i8*, i8** %23, align 8
  %135 = icmp ugt i8* %133, %134
  br i1 %135, label %136, label %149

136:                                              ; preds = %120
  %137 = bitcast [62 x i8]* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %137, i8* align 16 getelementptr inbounds ([62 x i8], [62 x i8]* @__const.send_icmp4_too_big.____fmt.1, i32 0, i32 0), i64 62, i1 false) #5
  %138 = getelementptr inbounds [62 x i8], [62 x i8]* %24, i64 0, i64 0
  %139 = call i32 (i8*, i64, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, ...)*)(i8* noundef %138, i64 noundef 62) #5
  store i32 %139, i32* %25, align 4
  %140 = load i32, i32* %25, align 4
  %141 = bitcast [57 x i8]* %26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %141, i8* align 16 getelementptr inbounds ([57 x i8], [57 x i8]* @__const.send_icmp4_too_big.____fmt.2, i32 0, i32 0), i64 57, i1 false) #5
  %142 = getelementptr inbounds [57 x i8], [57 x i8]* %26, i64 0, i64 0
  %143 = load i8*, i8** %22, align 8
  %144 = load i32, i32* %19, align 4
  %145 = add nsw i32 98, %144
  %146 = load i8*, i8** %23, align 8
  %147 = call i32 (i8*, i64, i8*, i32, i8*, ...) bitcast (i32 (...)* @_bpf_helper_ext_0006 to i32 (i8*, i64, i8*, i32, i8*, ...)*)(i8* noundef %142, i64 noundef 57, i8* noundef %143, i32 noundef %145, i8* noundef %146) #5
  store i32 %147, i32* %27, align 4
  %148 = load i32, i32* %27, align 4
  store i32 1, i32* %17, align 4
  br label %343

149:                                              ; preds = %120
  store i32 0, i32* %32, align 4
  store i64 0, i64* %33, align 8
  %150 = load i8*, i8** %22, align 8
  %151 = load i32, i32* %19, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr i8, i8* %150, i64 %152
  %154 = bitcast i8* %153 to %struct.ethhdr*
  store %struct.ethhdr* %154, %struct.ethhdr** %31, align 8
  %155 = load i8*, i8** %22, align 8
  %156 = load %struct.ethhdr*, %struct.ethhdr** %31, align 8
  store i8* %155, i8** %14, align 8
  store %struct.ethhdr* %156, %struct.ethhdr** %15, align 8
  %157 = load i8*, i8** %14, align 8
  %158 = bitcast i8* %157 to %struct.ethhdr*
  store %struct.ethhdr* %158, %struct.ethhdr** %16, align 8
  %159 = load %struct.ethhdr*, %struct.ethhdr** %16, align 8
  %160 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %159, i32 0, i32 1
  %161 = getelementptr inbounds [6 x i8], [6 x i8]* %160, i64 0, i64 0
  %162 = load %struct.ethhdr*, %struct.ethhdr** %15, align 8
  %163 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %162, i32 0, i32 0
  %164 = getelementptr inbounds [6 x i8], [6 x i8]* %163, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %161, i8* align 2 %164, i64 6, i1 false) #5
  %165 = load %struct.ethhdr*, %struct.ethhdr** %16, align 8
  %166 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %165, i32 0, i32 0
  %167 = getelementptr inbounds [6 x i8], [6 x i8]* %166, i64 0, i64 0
  %168 = load %struct.ethhdr*, %struct.ethhdr** %15, align 8
  %169 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %168, i32 0, i32 1
  %170 = getelementptr inbounds [6 x i8], [6 x i8]* %169, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %167, i8* align 2 %170, i64 6, i1 false) #5
  %171 = load %struct.ethhdr*, %struct.ethhdr** %15, align 8
  %172 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %171, i32 0, i32 2
  %173 = load i16, i16* %172, align 2
  %174 = load %struct.ethhdr*, %struct.ethhdr** %16, align 8
  %175 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %174, i32 0, i32 2
  store i16 %173, i16* %175, align 2
  %176 = load i64, i64* %33, align 8
  %177 = add i64 %176, 14
  store i64 %177, i64* %33, align 8
  %178 = load i8*, i8** %22, align 8
  %179 = load i64, i64* %33, align 8
  %180 = getelementptr i8, i8* %178, i64 %179
  %181 = bitcast i8* %180 to %struct.iphdr*
  store %struct.iphdr* %181, %struct.iphdr** %28, align 8
  %182 = load i64, i64* %33, align 8
  %183 = add i64 %182, 20
  store i64 %183, i64* %33, align 8
  %184 = load i8*, i8** %22, align 8
  %185 = load i64, i64* %33, align 8
  %186 = getelementptr i8, i8* %184, i64 %185
  %187 = bitcast i8* %186 to %struct.icmphdr*
  store %struct.icmphdr* %187, %struct.icmphdr** %30, align 8
  %188 = load i64, i64* %33, align 8
  %189 = add i64 %188, 8
  store i64 %189, i64* %33, align 8
  %190 = load i8*, i8** %22, align 8
  %191 = load i64, i64* %33, align 8
  %192 = getelementptr i8, i8* %190, i64 %191
  %193 = bitcast i8* %192 to %struct.iphdr*
  store %struct.iphdr* %193, %struct.iphdr** %29, align 8
  %194 = load %struct.icmphdr*, %struct.icmphdr** %30, align 8
  %195 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %194, i32 0, i32 0
  store i8 3, i8* %195, align 4
  %196 = load %struct.icmphdr*, %struct.icmphdr** %30, align 8
  %197 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %196, i32 0, i32 1
  store i8 4, i8* %197, align 1
  %198 = load volatile i32, i32* @max_pcktsz, align 4
  %199 = zext i32 %198 to i64
  %200 = sub i64 %199, 14
  %201 = trunc i64 %200 to i16
  %202 = call i16 @llvm.bswap.i16(i16 %201) #5
  %203 = zext i16 %202 to i32
  %204 = load %struct.icmphdr*, %struct.icmphdr** %30, align 8
  %205 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %204, i32 0, i32 3
  %206 = bitcast %union.anon.2* %205 to %struct.anon.4*
  %207 = getelementptr inbounds %struct.anon.4, %struct.anon.4* %206, i32 0, i32 1
  store i16 %202, i16* %207, align 2
  %208 = load %struct.icmphdr*, %struct.icmphdr** %30, align 8
  %209 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %208, i32 0, i32 2
  store i16 0, i16* %209, align 2
  %210 = load %struct.icmphdr*, %struct.icmphdr** %30, align 8
  %211 = bitcast %struct.icmphdr* %210 to i8*
  store i8* %211, i8** %8, align 8
  store i32 92, i32* %9, align 4
  store i32* %32, i32** %10, align 8
  %212 = load i8*, i8** %8, align 8
  %213 = load i32, i32* %9, align 4
  %214 = load i32*, i32** %10, align 8
  %215 = load i32, i32* %214, align 4
  %216 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %212, i32 noundef %213, i32 noundef %215) #5
  %217 = load i32*, i32** %10, align 8
  store i32 %216, i32* %217, align 4
  %218 = load i32*, i32** %10, align 8
  %219 = load i32, i32* %218, align 4
  store i32 %219, i32* %5, align 4
  %220 = load i32, i32* %5, align 4
  %221 = and i32 %220, 65535
  %222 = load i32, i32* %5, align 4
  %223 = lshr i32 %222, 16
  %224 = add i32 %221, %223
  %225 = xor i32 %224, -1
  %226 = trunc i32 %225 to i16
  %227 = zext i16 %226 to i32
  %228 = load i32*, i32** %10, align 8
  store i32 %227, i32* %228, align 4
  %229 = load i32, i32* %32, align 4
  %230 = trunc i32 %229 to i16
  %231 = load %struct.icmphdr*, %struct.icmphdr** %30, align 8
  %232 = getelementptr inbounds %struct.icmphdr, %struct.icmphdr* %231, i32 0, i32 2
  store i16 %230, i16* %232, align 2
  %233 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %234 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %233, i32 0, i32 5
  store i8 64, i8* %234, align 4
  %235 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %236 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %235, i32 0, i32 8
  %237 = bitcast %union.anon* %236 to %struct.anon.0*
  %238 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %237, i32 0, i32 0
  %239 = load i32, i32* %238, align 4
  %240 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %241 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %240, i32 0, i32 8
  %242 = bitcast %union.anon* %241 to %struct.anon.0*
  %243 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %242, i32 0, i32 1
  store i32 %239, i32* %243, align 4
  %244 = load %struct.iphdr*, %struct.iphdr** %29, align 8
  %245 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %244, i32 0, i32 8
  %246 = bitcast %union.anon* %245 to %struct.anon.0*
  %247 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %246, i32 0, i32 1
  %248 = load i32, i32* %247, align 4
  %249 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %250 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %249, i32 0, i32 8
  %251 = bitcast %union.anon* %250 to %struct.anon.0*
  %252 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %251, i32 0, i32 0
  store i32 %248, i32* %252, align 4
  %253 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %254 = bitcast %struct.iphdr* %253 to i8*
  %255 = load i8, i8* %254, align 4
  %256 = and i8 %255, 15
  %257 = or i8 %256, 64
  store i8 %257, i8* %254, align 4
  %258 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %259 = bitcast %struct.iphdr* %258 to i8*
  %260 = load i8, i8* %259, align 4
  %261 = and i8 %260, -16
  %262 = or i8 %261, 5
  store i8 %262, i8* %259, align 4
  %263 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %264 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %263, i32 0, i32 6
  store i8 1, i8* %264, align 1
  %265 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %266 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %265, i32 0, i32 1
  store i8 0, i8* %266, align 1
  %267 = load i32, i32* %19, align 4
  %268 = add nsw i32 98, %267
  %269 = sext i32 %268 to i64
  %270 = sub i64 %269, 14
  %271 = call i1 @llvm.is.constant.i64(i64 %270) #5
  br i1 %271, label %272, label %292

272:                                              ; preds = %149
  %273 = load i32, i32* %19, align 4
  %274 = add nsw i32 98, %273
  %275 = sext i32 %274 to i64
  %276 = sub i64 %275, 14
  %277 = trunc i64 %276 to i16
  %278 = zext i16 %277 to i32
  %279 = shl i32 %278, 8
  %280 = ashr i32 %279, 8
  %281 = shl i32 %280, 8
  %282 = load i32, i32* %19, align 4
  %283 = add nsw i32 98, %282
  %284 = sext i32 %283 to i64
  %285 = sub i64 %284, 14
  %286 = trunc i64 %285 to i16
  %287 = zext i16 %286 to i32
  %288 = ashr i32 %287, 8
  %289 = or i32 %281, %288
  %290 = trunc i32 %289 to i16
  %291 = zext i16 %290 to i32
  br label %300

292:                                              ; preds = %149
  %293 = load i32, i32* %19, align 4
  %294 = add nsw i32 98, %293
  %295 = sext i32 %294 to i64
  %296 = sub i64 %295, 14
  %297 = trunc i64 %296 to i16
  %298 = call i16 @llvm.bswap.i16(i16 %297) #5
  %299 = zext i16 %298 to i32
  br label %300

300:                                              ; preds = %292, %272
  %301 = phi i32 [ %291, %272 ], [ %299, %292 ]
  %302 = trunc i32 %301 to i16
  %303 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %304 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %303, i32 0, i32 2
  store i16 %302, i16* %304, align 2
  %305 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %306 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %305, i32 0, i32 7
  store i16 0, i16* %306, align 2
  store i32 0, i32* %32, align 4
  %307 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %308 = bitcast %struct.iphdr* %307 to i8*
  store i8* %308, i8** %11, align 8
  store i32 20, i32* %12, align 4
  store i32* %32, i32** %13, align 8
  %309 = load i8*, i8** %11, align 8
  %310 = load i32, i32* %12, align 4
  %311 = load i32*, i32** %13, align 8
  %312 = load i32, i32* %311, align 4
  %313 = call i32 (i32, i32, i8*, i32, i32, ...) bitcast (i32 (...)* @_bpf_helper_ext_0028 to i32 (i32, i32, i8*, i32, i32, ...)*)(i32 noundef 0, i32 noundef 0, i8* noundef %309, i32 noundef %310, i32 noundef %312) #5
  %314 = load i32*, i32** %13, align 8
  store i32 %313, i32* %314, align 4
  %315 = load i32*, i32** %13, align 8
  %316 = load i32, i32* %315, align 4
  store i32 %316, i32* %4, align 4
  %317 = load i32, i32* %4, align 4
  %318 = and i32 %317, 65535
  %319 = load i32, i32* %4, align 4
  %320 = lshr i32 %319, 16
  %321 = add i32 %318, %320
  %322 = xor i32 %321, -1
  %323 = trunc i32 %322 to i16
  %324 = zext i16 %323 to i32
  %325 = load i32*, i32** %13, align 8
  store i32 %324, i32* %325, align 4
  %326 = load i32, i32* %32, align 4
  %327 = trunc i32 %326 to i16
  %328 = load %struct.iphdr*, %struct.iphdr** %28, align 8
  %329 = getelementptr inbounds %struct.iphdr, %struct.iphdr* %328, i32 0, i32 7
  store i16 %327, i16* %329, align 2
  store i64 0, i64* %6, align 8
  %330 = bitcast i64* %6 to i8*
  store i64* @icmpcnt_id, i64** %2, align 8
  store i8* %330, i8** %3, align 8
  %331 = load i64*, i64** %2, align 8
  %332 = load i64, i64* %331, align 8
  %333 = load i8*, i8** %3, align 8
  %334 = call i8* (i64, i8*, ...) bitcast (i8* (...)* @_bpf_helper_ext_0001 to i8* (i64, i8*, ...)*)(i64 noundef %332, i8* noundef %333) #5
  %335 = bitcast i8* %334 to i64*
  store i64* %335, i64** %7, align 8
  %336 = load i64*, i64** %7, align 8
  %337 = icmp ne i64* %336, null
  br i1 %337, label %338, label %342

338:                                              ; preds = %300
  %339 = load i64*, i64** %7, align 8
  %340 = load i64, i64* %339, align 8
  %341 = add i64 %340, 1
  store i64 %341, i64* %339, align 8
  br label %342

342:                                              ; preds = %300, %338
  store i32 3, i32* %17, align 4
  br label %343

343:                                              ; preds = %115, %136, %342
  %344 = load i32, i32* %17, align 4
  store i32 %344, i32* %34, align 4
  br label %346

345:                                              ; preds = %97
  store i32 2, i32* %34, align 4
  br label %346

346:                                              ; preds = %107, %343, %345
  %347 = load i32, i32* %34, align 4
  store i32 %347, i32* %43, align 4
  br label %349

348:                                              ; preds = %65
  store i32 2, i32* %43, align 4
  br label %349

349:                                              ; preds = %348, %346, %64
  %350 = load i32, i32* %43, align 4
  ret i32 %350
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

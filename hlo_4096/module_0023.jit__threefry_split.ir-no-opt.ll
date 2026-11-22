; ModuleID = 'jit__threefry_split'
source_filename = "jit__threefry_split"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 16 dereferenceable(8) %0, ptr noalias align 256 dereferenceable(32768) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %5 = mul i32 %4, 128
  %6 = add i32 %5, %3
  %7 = zext i32 %6 to i64
  %8 = lshr i64 %7, 32
  %9 = trunc i64 %8 to i32
  %10 = call i32 @fused_concatenate_broadcast_0_81(ptr %0, i32 %6)
  %11 = add i32 %9, %10
  %12 = trunc i64 %7 to i32
  %13 = call i32 @fused_concatenate_broadcast_1_81(ptr %0, i32 %6)
  %14 = add i32 %12, %13
  %15 = add i32 %11, %14
  %16 = call i32 @fused_concatenate_broadcast_2_43(ptr %0, i32 %6)
  %17 = shl i32 %14, %16
  %18 = icmp ult i32 %16, 32
  %19 = select i1 %18, i32 %17, i32 0
  %20 = call i32 @fused_concatenate_broadcast_4_43(ptr %0, i32 %6)
  %21 = lshr i32 %14, %20
  %22 = icmp ult i32 %20, 32
  %23 = select i1 %22, i32 %21, i32 0
  %24 = or i32 %19, %23
  %25 = xor i32 %15, %24
  %26 = add i32 %15, %25
  %27 = call i32 @fused_concatenate_broadcast_5_71(ptr %0, i32 %6)
  %28 = shl i32 %25, %27
  %29 = icmp ult i32 %27, 32
  %30 = select i1 %29, i32 %28, i32 0
  %31 = call i32 @fused_concatenate_broadcast_6_71(ptr %0, i32 %6)
  %32 = lshr i32 %25, %31
  %33 = icmp ult i32 %31, 32
  %34 = select i1 %33, i32 %32, i32 0
  %35 = or i32 %30, %34
  %36 = xor i32 %26, %35
  %37 = add i32 %26, %36
  %38 = call i32 @fused_concatenate_broadcast_7_88(ptr %0, i32 %6)
  %39 = shl i32 %36, %38
  %40 = icmp ult i32 %38, 32
  %41 = select i1 %40, i32 %39, i32 0
  %42 = call i32 @fused_concatenate_broadcast_8_88(ptr %0, i32 %6)
  %43 = lshr i32 %36, %42
  %44 = icmp ult i32 %42, 32
  %45 = select i1 %44, i32 %43, i32 0
  %46 = or i32 %41, %45
  %47 = xor i32 %37, %46
  %48 = add i32 %37, %47
  %49 = add i32 %48, %13
  %50 = shl i32 %47, %42
  %51 = select i1 %44, i32 %50, i32 0
  %52 = lshr i32 %47, %38
  %53 = select i1 %40, i32 %52, i32 0
  %54 = or i32 %51, %53
  %55 = xor i32 %48, %54
  %56 = call i32 @fused_concatenate_broadcast_10_48(ptr %0, i32 %6)
  %57 = add i32 %55, %56
  %58 = add i32 %57, 1
  %59 = add i32 %49, %58
  %60 = shl i32 %58, %31
  %61 = select i1 %33, i32 %60, i32 0
  %62 = lshr i32 %58, %27
  %63 = select i1 %29, i32 %62, i32 0
  %64 = or i32 %61, %63
  %65 = xor i32 %59, %64
  %66 = add i32 %59, %65
  %67 = call i32 @fused_concatenate_broadcast_12_32(ptr %0, i32 %6)
  %68 = shl i32 %65, %67
  %69 = icmp ult i32 %67, 32
  %70 = select i1 %69, i32 %68, i32 0
  %71 = call i32 @fused_concatenate_broadcast_13_41(ptr %0, i32 %6)
  %72 = lshr i32 %65, %71
  %73 = icmp ult i32 %71, 32
  %74 = select i1 %73, i32 %72, i32 0
  %75 = or i32 %70, %74
  %76 = xor i32 %66, %75
  %77 = add i32 %66, %76
  %78 = call i32 @fused_concatenate_broadcast_14_64(ptr %0, i32 %6)
  %79 = shl i32 %76, %78
  %80 = icmp ult i32 %78, 32
  %81 = select i1 %80, i32 %79, i32 0
  %82 = lshr i32 %76, %78
  %83 = select i1 %80, i32 %82, i32 0
  %84 = or i32 %81, %83
  %85 = xor i32 %77, %84
  %86 = add i32 %77, %85
  %87 = add i32 %86, %56
  %88 = call i32 @fused_concatenate_broadcast_16_30(ptr %0, i32 %6)
  %89 = shl i32 %85, %88
  %90 = icmp ult i32 %88, 32
  %91 = select i1 %90, i32 %89, i32 0
  %92 = call i32 @fused_concatenate_broadcast_18_30(ptr %0, i32 %6)
  %93 = lshr i32 %85, %92
  %94 = icmp ult i32 %92, 32
  %95 = select i1 %94, i32 %93, i32 0
  %96 = or i32 %91, %95
  %97 = xor i32 %86, %96
  %98 = add i32 %97, %10
  %99 = add i32 %98, 2
  %100 = add i32 %87, %99
  %101 = shl i32 %99, %16
  %102 = select i1 %18, i32 %101, i32 0
  %103 = lshr i32 %99, %20
  %104 = select i1 %22, i32 %103, i32 0
  %105 = or i32 %102, %104
  %106 = xor i32 %100, %105
  %107 = add i32 %100, %106
  %108 = shl i32 %106, %27
  %109 = select i1 %29, i32 %108, i32 0
  %110 = lshr i32 %106, %31
  %111 = select i1 %33, i32 %110, i32 0
  %112 = or i32 %109, %111
  %113 = xor i32 %107, %112
  %114 = add i32 %107, %113
  %115 = shl i32 %113, %38
  %116 = select i1 %40, i32 %115, i32 0
  %117 = lshr i32 %113, %42
  %118 = select i1 %44, i32 %117, i32 0
  %119 = or i32 %116, %118
  %120 = xor i32 %114, %119
  %121 = add i32 %114, %120
  %122 = add i32 %121, %10
  %123 = shl i32 %120, %42
  %124 = select i1 %44, i32 %123, i32 0
  %125 = lshr i32 %120, %38
  %126 = select i1 %40, i32 %125, i32 0
  %127 = or i32 %124, %126
  %128 = xor i32 %121, %127
  %129 = add i32 %128, %13
  %130 = add i32 %129, %71
  %131 = add i32 %122, %130
  %132 = shl i32 %130, %31
  %133 = select i1 %33, i32 %132, i32 0
  %134 = lshr i32 %130, %27
  %135 = select i1 %29, i32 %134, i32 0
  %136 = or i32 %133, %135
  %137 = xor i32 %131, %136
  %138 = add i32 %131, %137
  %139 = shl i32 %137, %67
  %140 = select i1 %69, i32 %139, i32 0
  %141 = lshr i32 %137, %71
  %142 = select i1 %73, i32 %141, i32 0
  %143 = or i32 %140, %142
  %144 = xor i32 %138, %143
  %145 = add i32 %138, %144
  %146 = shl i32 %144, %78
  %147 = select i1 %80, i32 %146, i32 0
  %148 = lshr i32 %144, %78
  %149 = select i1 %80, i32 %148, i32 0
  %150 = or i32 %147, %149
  %151 = xor i32 %145, %150
  %152 = add i32 %145, %151
  %153 = add i32 %152, %13
  %154 = shl i32 %151, %88
  %155 = select i1 %90, i32 %154, i32 0
  %156 = lshr i32 %151, %92
  %157 = select i1 %94, i32 %156, i32 0
  %158 = or i32 %155, %157
  %159 = xor i32 %152, %158
  %160 = add i32 %159, %56
  %161 = add i32 %160, 4
  %162 = add i32 %153, %161
  %163 = shl i32 %161, %16
  %164 = select i1 %18, i32 %163, i32 0
  %165 = lshr i32 %161, %20
  %166 = select i1 %22, i32 %165, i32 0
  %167 = or i32 %164, %166
  %168 = xor i32 %162, %167
  %169 = add i32 %162, %168
  %170 = shl i32 %168, %27
  %171 = select i1 %29, i32 %170, i32 0
  %172 = lshr i32 %168, %31
  %173 = select i1 %33, i32 %172, i32 0
  %174 = or i32 %171, %173
  %175 = xor i32 %169, %174
  %176 = add i32 %169, %175
  %177 = shl i32 %175, %38
  %178 = select i1 %40, i32 %177, i32 0
  %179 = lshr i32 %175, %42
  %180 = select i1 %44, i32 %179, i32 0
  %181 = or i32 %178, %180
  %182 = xor i32 %176, %181
  %183 = add i32 %176, %182
  %184 = add i32 %183, %56
  %185 = call i32 @fused_concatenate__epilogue__concatenate_185_1(ptr %0, i32 %6, i32 0, i32 %184)
  %186 = mul i32 %3, 2
  %187 = mul i32 %4, 256
  %188 = add i32 %186, %187
  %189 = getelementptr inbounds i32, ptr %1, i32 %188
  store i32 %185, ptr %189, align 4
  %190 = call i32 @fused_concatenate_broadcast_1_81(ptr %0, i32 %6)
  %191 = add i32 %12, %190
  %192 = call i32 @fused_concatenate_broadcast_2_43(ptr %0, i32 %6)
  %193 = shl i32 %191, %192
  %194 = icmp ult i32 %192, 32
  %195 = select i1 %194, i32 %193, i32 0
  %196 = call i32 @fused_concatenate_broadcast_4_43(ptr %0, i32 %6)
  %197 = lshr i32 %191, %196
  %198 = icmp ult i32 %196, 32
  %199 = select i1 %198, i32 %197, i32 0
  %200 = or i32 %195, %199
  %201 = call i32 @fused_concatenate_broadcast_0_81(ptr %0, i32 %6)
  %202 = add i32 %9, %201
  %203 = add i32 %202, %191
  %204 = xor i32 %203, %200
  %205 = call i32 @fused_concatenate_broadcast_5_71(ptr %0, i32 %6)
  %206 = shl i32 %204, %205
  %207 = icmp ult i32 %205, 32
  %208 = select i1 %207, i32 %206, i32 0
  %209 = call i32 @fused_concatenate_broadcast_6_71(ptr %0, i32 %6)
  %210 = lshr i32 %204, %209
  %211 = icmp ult i32 %209, 32
  %212 = select i1 %211, i32 %210, i32 0
  %213 = or i32 %208, %212
  %214 = add i32 %203, %204
  %215 = xor i32 %214, %213
  %216 = call i32 @fused_concatenate_broadcast_7_88(ptr %0, i32 %6)
  %217 = shl i32 %215, %216
  %218 = icmp ult i32 %216, 32
  %219 = select i1 %218, i32 %217, i32 0
  %220 = call i32 @fused_concatenate_broadcast_8_88(ptr %0, i32 %6)
  %221 = lshr i32 %215, %220
  %222 = icmp ult i32 %220, 32
  %223 = select i1 %222, i32 %221, i32 0
  %224 = or i32 %219, %223
  %225 = add i32 %214, %215
  %226 = xor i32 %225, %224
  %227 = shl i32 %226, %220
  %228 = select i1 %222, i32 %227, i32 0
  %229 = lshr i32 %226, %216
  %230 = select i1 %218, i32 %229, i32 0
  %231 = or i32 %228, %230
  %232 = add i32 %225, %226
  %233 = xor i32 %232, %231
  %234 = call i32 @fused_concatenate_broadcast_10_48(ptr %0, i32 %6)
  %235 = add i32 %233, %234
  %236 = add i32 %235, 1
  %237 = shl i32 %236, %209
  %238 = select i1 %211, i32 %237, i32 0
  %239 = lshr i32 %236, %205
  %240 = select i1 %207, i32 %239, i32 0
  %241 = or i32 %238, %240
  %242 = add i32 %232, %190
  %243 = add i32 %242, %236
  %244 = xor i32 %243, %241
  %245 = call i32 @fused_concatenate_broadcast_12_32(ptr %0, i32 %6)
  %246 = shl i32 %244, %245
  %247 = icmp ult i32 %245, 32
  %248 = select i1 %247, i32 %246, i32 0
  %249 = call i32 @fused_concatenate_broadcast_13_41(ptr %0, i32 %6)
  %250 = lshr i32 %244, %249
  %251 = icmp ult i32 %249, 32
  %252 = select i1 %251, i32 %250, i32 0
  %253 = or i32 %248, %252
  %254 = add i32 %243, %244
  %255 = xor i32 %254, %253
  %256 = call i32 @fused_concatenate_broadcast_14_64(ptr %0, i32 %6)
  %257 = shl i32 %255, %256
  %258 = icmp ult i32 %256, 32
  %259 = select i1 %258, i32 %257, i32 0
  %260 = lshr i32 %255, %256
  %261 = select i1 %258, i32 %260, i32 0
  %262 = or i32 %259, %261
  %263 = add i32 %254, %255
  %264 = xor i32 %263, %262
  %265 = call i32 @fused_concatenate_broadcast_16_30(ptr %0, i32 %6)
  %266 = shl i32 %264, %265
  %267 = icmp ult i32 %265, 32
  %268 = select i1 %267, i32 %266, i32 0
  %269 = call i32 @fused_concatenate_broadcast_18_30(ptr %0, i32 %6)
  %270 = lshr i32 %264, %269
  %271 = icmp ult i32 %269, 32
  %272 = select i1 %271, i32 %270, i32 0
  %273 = or i32 %268, %272
  %274 = add i32 %263, %264
  %275 = xor i32 %274, %273
  %276 = add i32 %275, %201
  %277 = add i32 %276, 2
  %278 = shl i32 %277, %192
  %279 = select i1 %194, i32 %278, i32 0
  %280 = lshr i32 %277, %196
  %281 = select i1 %198, i32 %280, i32 0
  %282 = or i32 %279, %281
  %283 = add i32 %274, %234
  %284 = add i32 %283, %277
  %285 = xor i32 %284, %282
  %286 = shl i32 %285, %205
  %287 = select i1 %207, i32 %286, i32 0
  %288 = lshr i32 %285, %209
  %289 = select i1 %211, i32 %288, i32 0
  %290 = or i32 %287, %289
  %291 = add i32 %284, %285
  %292 = xor i32 %291, %290
  %293 = shl i32 %292, %216
  %294 = select i1 %218, i32 %293, i32 0
  %295 = lshr i32 %292, %220
  %296 = select i1 %222, i32 %295, i32 0
  %297 = or i32 %294, %296
  %298 = add i32 %291, %292
  %299 = xor i32 %298, %297
  %300 = shl i32 %299, %220
  %301 = select i1 %222, i32 %300, i32 0
  %302 = lshr i32 %299, %216
  %303 = select i1 %218, i32 %302, i32 0
  %304 = or i32 %301, %303
  %305 = add i32 %298, %299
  %306 = xor i32 %305, %304
  %307 = add i32 %306, %190
  %308 = add i32 %307, %249
  %309 = shl i32 %308, %209
  %310 = select i1 %211, i32 %309, i32 0
  %311 = lshr i32 %308, %205
  %312 = select i1 %207, i32 %311, i32 0
  %313 = or i32 %310, %312
  %314 = add i32 %305, %201
  %315 = add i32 %314, %308
  %316 = xor i32 %315, %313
  %317 = shl i32 %316, %245
  %318 = select i1 %247, i32 %317, i32 0
  %319 = lshr i32 %316, %249
  %320 = select i1 %251, i32 %319, i32 0
  %321 = or i32 %318, %320
  %322 = add i32 %315, %316
  %323 = xor i32 %322, %321
  %324 = shl i32 %323, %256
  %325 = select i1 %258, i32 %324, i32 0
  %326 = lshr i32 %323, %256
  %327 = select i1 %258, i32 %326, i32 0
  %328 = or i32 %325, %327
  %329 = add i32 %322, %323
  %330 = xor i32 %329, %328
  %331 = shl i32 %330, %265
  %332 = select i1 %267, i32 %331, i32 0
  %333 = lshr i32 %330, %269
  %334 = select i1 %271, i32 %333, i32 0
  %335 = or i32 %332, %334
  %336 = add i32 %329, %330
  %337 = xor i32 %336, %335
  %338 = add i32 %337, %234
  %339 = add i32 %338, 4
  %340 = shl i32 %339, %192
  %341 = select i1 %194, i32 %340, i32 0
  %342 = lshr i32 %339, %196
  %343 = select i1 %198, i32 %342, i32 0
  %344 = or i32 %341, %343
  %345 = add i32 %336, %190
  %346 = add i32 %345, %339
  %347 = xor i32 %346, %344
  %348 = shl i32 %347, %205
  %349 = select i1 %207, i32 %348, i32 0
  %350 = lshr i32 %347, %209
  %351 = select i1 %211, i32 %350, i32 0
  %352 = or i32 %349, %351
  %353 = add i32 %346, %347
  %354 = xor i32 %353, %352
  %355 = shl i32 %354, %216
  %356 = select i1 %218, i32 %355, i32 0
  %357 = lshr i32 %354, %220
  %358 = select i1 %222, i32 %357, i32 0
  %359 = or i32 %356, %358
  %360 = add i32 %353, %354
  %361 = xor i32 %360, %359
  %362 = shl i32 %361, %220
  %363 = select i1 %222, i32 %362, i32 0
  %364 = lshr i32 %361, %216
  %365 = select i1 %218, i32 %364, i32 0
  %366 = or i32 %363, %365
  %367 = add i32 %360, %361
  %368 = xor i32 %367, %366
  %369 = add i32 %368, %201
  %370 = add i32 %369, 5
  %371 = call i32 @fused_concatenate__epilogue__concatenate_185_1(ptr %0, i32 %6, i32 1, i32 %370)
  %372 = add i32 %188, 1
  %373 = getelementptr inbounds i32, ptr %1, i32 %372
  store i32 %371, ptr %373, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

define internal i32 @fused_concatenate_broadcast_0_81(ptr noalias %0, i32 %1) {
  %3 = call i32 @fused_concatenate_bitcast_102(ptr %0)
  ret i32 %3
}

define internal i32 @fused_concatenate_broadcast_1_81(ptr noalias %0, i32 %1) {
  %3 = call i32 @fused_concatenate_bitcast_1_98(ptr %0)
  ret i32 %3
}

define internal i32 @fused_concatenate_broadcast_2_43(ptr noalias %0, i32 %1) {
  ret i32 13
}

define internal i32 @fused_concatenate_broadcast_4_43(ptr noalias %0, i32 %1) {
  ret i32 19
}

define internal i32 @fused_concatenate_broadcast_5_71(ptr noalias %0, i32 %1) {
  ret i32 15
}

define internal i32 @fused_concatenate_broadcast_6_71(ptr noalias %0, i32 %1) {
  ret i32 17
}

define internal i32 @fused_concatenate_broadcast_7_88(ptr noalias %0, i32 %1) {
  ret i32 26
}

define internal i32 @fused_concatenate_broadcast_8_88(ptr noalias %0, i32 %1) {
  ret i32 6
}

define internal i32 @fused_concatenate_broadcast_10_48(ptr noalias %0, i32 %1) {
  %3 = call i32 @fused_concatenate_bitcast_102(ptr %0)
  %4 = call i32 @fused_concatenate_bitcast_1_98(ptr %0)
  %5 = xor i32 %3, %4
  %6 = xor i32 %5, 466688986
  ret i32 %6
}

define internal i32 @fused_concatenate_broadcast_12_32(ptr noalias %0, i32 %1) {
  ret i32 29
}

define internal i32 @fused_concatenate_broadcast_13_41(ptr noalias %0, i32 %1) {
  ret i32 3
}

define internal i32 @fused_concatenate_broadcast_14_64(ptr noalias %0, i32 %1) {
  ret i32 16
}

define internal i32 @fused_concatenate_broadcast_16_30(ptr noalias %0, i32 %1) {
  ret i32 24
}

define internal i32 @fused_concatenate_broadcast_18_30(ptr noalias %0, i32 %1) {
  ret i32 8
}

define internal i32 @fused_concatenate__epilogue__concatenate_185_1(ptr noalias %0, i32 %1, i32 %2, i32 %3) {
  ret i32 %3
}

define internal i32 @fused_concatenate_bitcast_102(ptr noalias %0) {
  %2 = load i32, ptr %0, align 4, !invariant.load !3
  ret i32 %2
}

define internal i32 @fused_concatenate_bitcast_1_98(ptr noalias %0) {
  %2 = getelementptr inbounds i32, ptr %0, i32 1
  %3 = load i32, ptr %2, align 4, !invariant.load !3
  ret i32 %3
}

attributes #0 = { "nvvm.reqntid"="128,1,1" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 128}
!2 = !{i32 0, i32 32}
!3 = !{}

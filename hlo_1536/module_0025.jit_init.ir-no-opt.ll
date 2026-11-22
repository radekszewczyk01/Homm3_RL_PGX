; ModuleID = 'jit_init'
source_filename = "jit_init"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_56_0 = constant [64 x i8] zeroinitializer, align 256
@buffer_for_constant_2_0 = constant [64 x i8] zeroinitializer, align 256
@sort.4.0_tile_param_0 = private addrspace(3) global [64 x i32] undef
@sort.4.0_tile_param_1 = private addrspace(3) global [64 x i32] undef
@sort.4.0_tile_param_2 = private addrspace(3) global [64 x i32] undef
@sort.5.0_tile_param_0 = private addrspace(3) global [64 x i32] undef
@sort.5.0_tile_param_1 = private addrspace(3) global [64 x i32] undef
@sort.5.0_tile_param_2 = private addrspace(3) global [64 x i32] undef
@sort.6.0_tile_param_0 = private addrspace(3) global [256 x float] undef
@sort.6.0_tile_param_1 = private addrspace(3) global [256 x i32] undef
@buffer_for_constant_1101_0 = constant [64 x i8] c"\00\00\C0\7F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 256
@buffer_for_constant_1102_0 = constant [64 x i8] zeroinitializer, align 256
@buffer_for_constant_1103_0 = constant [64 x i8] zeroinitializer, align 256
@buffer_for_constant_1105_0 = constant [64 x i8] c"\FF\FF\FF\7F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 256
@shared_0 = private addrspace(3) global [1056 x float] undef
@shared_01 = private addrspace(3) global [1056 x float] undef

define ptx_kernel void @loop_add_fusion_2(ptr noalias align 16 dereferenceable(12288) %0, ptr noalias align 256 dereferenceable(36864) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = udiv i32 %3, 12
  %6 = sext i32 %5 to i64
  %7 = lshr i64 %6, 32
  %8 = trunc i64 %7 to i32
  %9 = urem i32 %3, 12
  %10 = mul i32 %9, 256
  %11 = mul i32 %4, 2
  %12 = add i32 %10, %11
  %13 = add i32 %12, 1
  %14 = getelementptr inbounds i32, ptr %0, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = add i32 %5, %15
  %17 = shl i32 %16, 13
  %18 = lshr i32 %16, 19
  %19 = getelementptr inbounds i32, ptr %0, i32 %12
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = add i32 %8, %20
  %22 = or i32 %17, %18
  %23 = add i32 %21, %16
  %24 = xor i32 %23, %22
  %25 = shl i32 %24, 15
  %26 = lshr i32 %24, 17
  %27 = or i32 %25, %26
  %28 = add i32 %23, %24
  %29 = xor i32 %28, %27
  %30 = shl i32 %29, 26
  %31 = lshr i32 %29, 6
  %32 = add i32 %28, %29
  %33 = or i32 %30, %31
  %34 = xor i32 %32, %33
  %35 = shl i32 %34, 6
  %36 = lshr i32 %34, 26
  %37 = or i32 %35, %36
  %38 = add i32 %32, %34
  %39 = xor i32 %38, %37
  %40 = xor i32 %20, %15
  %41 = xor i32 %40, 466688986
  %42 = add i32 %39, %41
  %43 = add i32 %42, 1
  %44 = shl i32 %43, 17
  %45 = lshr i32 %43, 15
  %46 = add i32 %38, %15
  %47 = or i32 %44, %45
  %48 = add i32 %46, %43
  %49 = xor i32 %48, %47
  %50 = shl i32 %49, 29
  %51 = lshr i32 %49, 3
  %52 = or i32 %50, %51
  %53 = add i32 %48, %49
  %54 = xor i32 %53, %52
  %55 = shl i32 %54, 16
  %56 = lshr i32 %54, 16
  %57 = add i32 %53, %54
  %58 = or i32 %55, %56
  %59 = xor i32 %57, %58
  %60 = shl i32 %59, 24
  %61 = lshr i32 %59, 8
  %62 = or i32 %60, %61
  %63 = add i32 %57, %59
  %64 = xor i32 %63, %62
  %65 = add i32 %64, %20
  %66 = add i32 %65, 2
  %67 = shl i32 %66, 13
  %68 = lshr i32 %66, 19
  %69 = add i32 %63, %41
  %70 = or i32 %67, %68
  %71 = add i32 %69, %66
  %72 = xor i32 %71, %70
  %73 = shl i32 %72, 15
  %74 = lshr i32 %72, 17
  %75 = or i32 %73, %74
  %76 = add i32 %71, %72
  %77 = xor i32 %76, %75
  %78 = shl i32 %77, 26
  %79 = lshr i32 %77, 6
  %80 = add i32 %76, %77
  %81 = or i32 %78, %79
  %82 = xor i32 %80, %81
  %83 = shl i32 %82, 6
  %84 = lshr i32 %82, 26
  %85 = or i32 %83, %84
  %86 = add i32 %80, %82
  %87 = xor i32 %86, %85
  %88 = add i32 %87, %15
  %89 = add i32 %86, %20
  %90 = add i32 %88, 3
  %91 = add i32 %89, %90
  %92 = mul i32 %3, 128
  %93 = add i32 %92, %4
  %94 = getelementptr inbounds i32, ptr %1, i32 %93
  store i32 %91, ptr %94, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 256 dereferenceable(36864) %0, ptr noalias align 16 dereferenceable(12288) %1, ptr noalias align 256 dereferenceable(73728) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %6 = udiv i32 %5, 12
  %7 = urem i32 %5, 12
  %8 = mul i32 %7, 128
  %9 = add i32 %8, %4
  %10 = call i32 @fused_concatenate_add_2244_1(ptr %0, ptr %1, i32 %6, i32 %9)
  %11 = zext i32 %6 to i64
  %12 = lshr i64 %11, 32
  %13 = trunc i64 %12 to i32
  %14 = trunc i64 %11 to i32
  %15 = call i32 @fused_concatenate_broadcast_3086_95(ptr %0, ptr %1, i32 %6, i32 %9)
  %16 = add i32 %14, %15
  %17 = call i32 @fused_concatenate_broadcast_3087_63(ptr %0, ptr %1, i32 %6, i32 %9)
  %18 = shl i32 %16, %17
  %19 = icmp ult i32 %17, 32
  %20 = select i1 %19, i32 %18, i32 0
  %21 = call i32 @fused_concatenate_broadcast_3088_63(ptr %0, ptr %1, i32 %6, i32 %9)
  %22 = lshr i32 %16, %21
  %23 = icmp ult i32 %21, 32
  %24 = select i1 %23, i32 %22, i32 0
  %25 = call i32 @fused_concatenate_broadcast_3082_51(ptr %0, ptr %1, i32 %6, i32 %9)
  %26 = add i32 %13, %25
  %27 = or i32 %20, %24
  %28 = add i32 %26, %16
  %29 = xor i32 %28, %27
  %30 = call i32 @fused_concatenate_broadcast_3089_51(ptr %0, ptr %1, i32 %6, i32 %9)
  %31 = shl i32 %29, %30
  %32 = icmp ult i32 %30, 32
  %33 = select i1 %32, i32 %31, i32 0
  %34 = call i32 @fused_concatenate_broadcast_3090_51(ptr %0, ptr %1, i32 %6, i32 %9)
  %35 = lshr i32 %29, %34
  %36 = icmp ult i32 %34, 32
  %37 = select i1 %36, i32 %35, i32 0
  %38 = or i32 %33, %37
  %39 = add i32 %28, %29
  %40 = xor i32 %39, %38
  %41 = call i32 @fused_concatenate_broadcast_3091_74(ptr %0, ptr %1, i32 %6, i32 %9)
  %42 = shl i32 %40, %41
  %43 = icmp ult i32 %41, 32
  %44 = select i1 %43, i32 %42, i32 0
  %45 = call i32 @fused_concatenate_broadcast_3092_74(ptr %0, ptr %1, i32 %6, i32 %9)
  %46 = lshr i32 %40, %45
  %47 = icmp ult i32 %45, 32
  %48 = select i1 %47, i32 %46, i32 0
  %49 = add i32 %39, %40
  %50 = or i32 %44, %48
  %51 = xor i32 %49, %50
  %52 = shl i32 %51, %45
  %53 = select i1 %47, i32 %52, i32 0
  %54 = lshr i32 %51, %41
  %55 = select i1 %43, i32 %54, i32 0
  %56 = or i32 %53, %55
  %57 = add i32 %49, %51
  %58 = xor i32 %57, %56
  %59 = call i32 @fused_concatenate_broadcast_3093_35(ptr %0, ptr %1, i32 %6, i32 %9)
  %60 = add i32 %58, %59
  %61 = add i32 %60, 1
  %62 = shl i32 %61, %34
  %63 = select i1 %36, i32 %62, i32 0
  %64 = lshr i32 %61, %30
  %65 = select i1 %32, i32 %64, i32 0
  %66 = add i32 %57, %15
  %67 = or i32 %63, %65
  %68 = add i32 %66, %61
  %69 = xor i32 %68, %67
  %70 = call i32 @fused_concatenate_broadcast_3095_18(ptr %0, ptr %1, i32 %6, i32 %9)
  %71 = shl i32 %69, %70
  %72 = icmp ult i32 %70, 32
  %73 = select i1 %72, i32 %71, i32 0
  %74 = call i32 @fused_concatenate_broadcast_3096_25(ptr %0, ptr %1, i32 %6, i32 %9)
  %75 = lshr i32 %69, %74
  %76 = icmp ult i32 %74, 32
  %77 = select i1 %76, i32 %75, i32 0
  %78 = or i32 %73, %77
  %79 = add i32 %68, %69
  %80 = xor i32 %79, %78
  %81 = call i32 @fused_concatenate_broadcast_3097_36(ptr %0, ptr %1, i32 %6, i32 %9)
  %82 = shl i32 %80, %81
  %83 = icmp ult i32 %81, 32
  %84 = select i1 %83, i32 %82, i32 0
  %85 = lshr i32 %80, %81
  %86 = select i1 %83, i32 %85, i32 0
  %87 = add i32 %79, %80
  %88 = or i32 %84, %86
  %89 = xor i32 %87, %88
  %90 = call i32 @fused_concatenate_broadcast_3098_22(ptr %0, ptr %1, i32 %6, i32 %9)
  %91 = shl i32 %89, %90
  %92 = icmp ult i32 %90, 32
  %93 = select i1 %92, i32 %91, i32 0
  %94 = call i32 @fused_concatenate_broadcast_3099_22(ptr %0, ptr %1, i32 %6, i32 %9)
  %95 = lshr i32 %89, %94
  %96 = icmp ult i32 %94, 32
  %97 = select i1 %96, i32 %95, i32 0
  %98 = or i32 %93, %97
  %99 = add i32 %87, %89
  %100 = xor i32 %99, %98
  %101 = add i32 %100, %25
  %102 = add i32 %101, 2
  %103 = shl i32 %102, %17
  %104 = select i1 %19, i32 %103, i32 0
  %105 = lshr i32 %102, %21
  %106 = select i1 %23, i32 %105, i32 0
  %107 = add i32 %99, %59
  %108 = or i32 %104, %106
  %109 = add i32 %107, %102
  %110 = xor i32 %109, %108
  %111 = shl i32 %110, %30
  %112 = select i1 %32, i32 %111, i32 0
  %113 = lshr i32 %110, %34
  %114 = select i1 %36, i32 %113, i32 0
  %115 = or i32 %112, %114
  %116 = add i32 %109, %110
  %117 = xor i32 %116, %115
  %118 = shl i32 %117, %41
  %119 = select i1 %43, i32 %118, i32 0
  %120 = lshr i32 %117, %45
  %121 = select i1 %47, i32 %120, i32 0
  %122 = or i32 %119, %121
  %123 = add i32 %116, %117
  %124 = xor i32 %123, %122
  %125 = shl i32 %124, %45
  %126 = select i1 %47, i32 %125, i32 0
  %127 = lshr i32 %124, %41
  %128 = select i1 %43, i32 %127, i32 0
  %129 = add i32 %123, %124
  %130 = or i32 %126, %128
  %131 = xor i32 %129, %130
  %132 = add i32 %131, %15
  %133 = add i32 %132, %74
  %134 = shl i32 %133, %34
  %135 = select i1 %36, i32 %134, i32 0
  %136 = lshr i32 %133, %30
  %137 = select i1 %32, i32 %136, i32 0
  %138 = or i32 %135, %137
  %139 = mul i32 %5, 128
  %140 = add i32 %139, %4
  %141 = getelementptr inbounds i32, ptr %0, i32 %140
  %142 = load i32, ptr %141, align 4, !invariant.load !3
  %143 = xor i32 %142, %138
  %144 = shl i32 %143, %70
  %145 = select i1 %72, i32 %144, i32 0
  %146 = lshr i32 %143, %74
  %147 = select i1 %76, i32 %146, i32 0
  %148 = or i32 %145, %147
  %149 = xor i32 %10, %148
  %150 = add i32 %10, %149
  %151 = shl i32 %149, %81
  %152 = select i1 %83, i32 %151, i32 0
  %153 = lshr i32 %149, %81
  %154 = select i1 %83, i32 %153, i32 0
  %155 = or i32 %152, %154
  %156 = xor i32 %150, %155
  %157 = add i32 %150, %156
  %158 = add i32 %157, %15
  %159 = shl i32 %156, %90
  %160 = select i1 %92, i32 %159, i32 0
  %161 = lshr i32 %156, %94
  %162 = select i1 %96, i32 %161, i32 0
  %163 = or i32 %160, %162
  %164 = xor i32 %157, %163
  %165 = add i32 %164, %59
  %166 = add i32 %165, 4
  %167 = add i32 %158, %166
  %168 = shl i32 %166, %17
  %169 = select i1 %19, i32 %168, i32 0
  %170 = lshr i32 %166, %21
  %171 = select i1 %23, i32 %170, i32 0
  %172 = or i32 %169, %171
  %173 = xor i32 %167, %172
  %174 = add i32 %167, %173
  %175 = shl i32 %173, %30
  %176 = select i1 %32, i32 %175, i32 0
  %177 = lshr i32 %173, %34
  %178 = select i1 %36, i32 %177, i32 0
  %179 = or i32 %176, %178
  %180 = xor i32 %174, %179
  %181 = add i32 %174, %180
  %182 = shl i32 %180, %41
  %183 = select i1 %43, i32 %182, i32 0
  %184 = lshr i32 %180, %45
  %185 = select i1 %47, i32 %184, i32 0
  %186 = or i32 %183, %185
  %187 = xor i32 %181, %186
  %188 = add i32 %181, %187
  %189 = add i32 %188, %59
  %190 = call i32 @fused_concatenate__epilogue__concatenate_135_1(ptr %0, ptr %1, i32 %6, i32 %9, i32 0, i32 %189)
  %191 = mul i32 %4, 2
  %192 = mul i32 %5, 256
  %193 = add i32 %191, %192
  %194 = getelementptr inbounds i32, ptr %2, i32 %193
  store i32 %190, ptr %194, align 4
  %195 = call i32 @fused_concatenate_broadcast_3086_95(ptr %0, ptr %1, i32 %6, i32 %9)
  %196 = add i32 %14, %195
  %197 = call i32 @fused_concatenate_broadcast_3087_63(ptr %0, ptr %1, i32 %6, i32 %9)
  %198 = shl i32 %196, %197
  %199 = icmp ult i32 %197, 32
  %200 = select i1 %199, i32 %198, i32 0
  %201 = call i32 @fused_concatenate_broadcast_3088_63(ptr %0, ptr %1, i32 %6, i32 %9)
  %202 = lshr i32 %196, %201
  %203 = icmp ult i32 %201, 32
  %204 = select i1 %203, i32 %202, i32 0
  %205 = call i32 @fused_concatenate_broadcast_3082_51(ptr %0, ptr %1, i32 %6, i32 %9)
  %206 = add i32 %13, %205
  %207 = or i32 %200, %204
  %208 = add i32 %206, %196
  %209 = xor i32 %208, %207
  %210 = call i32 @fused_concatenate_broadcast_3089_51(ptr %0, ptr %1, i32 %6, i32 %9)
  %211 = shl i32 %209, %210
  %212 = icmp ult i32 %210, 32
  %213 = select i1 %212, i32 %211, i32 0
  %214 = call i32 @fused_concatenate_broadcast_3090_51(ptr %0, ptr %1, i32 %6, i32 %9)
  %215 = lshr i32 %209, %214
  %216 = icmp ult i32 %214, 32
  %217 = select i1 %216, i32 %215, i32 0
  %218 = or i32 %213, %217
  %219 = add i32 %208, %209
  %220 = xor i32 %219, %218
  %221 = call i32 @fused_concatenate_broadcast_3091_74(ptr %0, ptr %1, i32 %6, i32 %9)
  %222 = shl i32 %220, %221
  %223 = icmp ult i32 %221, 32
  %224 = select i1 %223, i32 %222, i32 0
  %225 = call i32 @fused_concatenate_broadcast_3092_74(ptr %0, ptr %1, i32 %6, i32 %9)
  %226 = lshr i32 %220, %225
  %227 = icmp ult i32 %225, 32
  %228 = select i1 %227, i32 %226, i32 0
  %229 = add i32 %219, %220
  %230 = or i32 %224, %228
  %231 = xor i32 %229, %230
  %232 = shl i32 %231, %225
  %233 = select i1 %227, i32 %232, i32 0
  %234 = lshr i32 %231, %221
  %235 = select i1 %223, i32 %234, i32 0
  %236 = or i32 %233, %235
  %237 = add i32 %229, %231
  %238 = xor i32 %237, %236
  %239 = call i32 @fused_concatenate_broadcast_3093_35(ptr %0, ptr %1, i32 %6, i32 %9)
  %240 = add i32 %238, %239
  %241 = add i32 %240, 1
  %242 = shl i32 %241, %214
  %243 = select i1 %216, i32 %242, i32 0
  %244 = lshr i32 %241, %210
  %245 = select i1 %212, i32 %244, i32 0
  %246 = add i32 %237, %195
  %247 = or i32 %243, %245
  %248 = add i32 %246, %241
  %249 = xor i32 %248, %247
  %250 = call i32 @fused_concatenate_broadcast_3095_18(ptr %0, ptr %1, i32 %6, i32 %9)
  %251 = shl i32 %249, %250
  %252 = icmp ult i32 %250, 32
  %253 = select i1 %252, i32 %251, i32 0
  %254 = call i32 @fused_concatenate_broadcast_3096_25(ptr %0, ptr %1, i32 %6, i32 %9)
  %255 = lshr i32 %249, %254
  %256 = icmp ult i32 %254, 32
  %257 = select i1 %256, i32 %255, i32 0
  %258 = or i32 %253, %257
  %259 = add i32 %248, %249
  %260 = xor i32 %259, %258
  %261 = call i32 @fused_concatenate_broadcast_3097_36(ptr %0, ptr %1, i32 %6, i32 %9)
  %262 = shl i32 %260, %261
  %263 = icmp ult i32 %261, 32
  %264 = select i1 %263, i32 %262, i32 0
  %265 = lshr i32 %260, %261
  %266 = select i1 %263, i32 %265, i32 0
  %267 = add i32 %259, %260
  %268 = or i32 %264, %266
  %269 = xor i32 %267, %268
  %270 = call i32 @fused_concatenate_broadcast_3098_22(ptr %0, ptr %1, i32 %6, i32 %9)
  %271 = shl i32 %269, %270
  %272 = icmp ult i32 %270, 32
  %273 = select i1 %272, i32 %271, i32 0
  %274 = call i32 @fused_concatenate_broadcast_3099_22(ptr %0, ptr %1, i32 %6, i32 %9)
  %275 = lshr i32 %269, %274
  %276 = icmp ult i32 %274, 32
  %277 = select i1 %276, i32 %275, i32 0
  %278 = or i32 %273, %277
  %279 = add i32 %267, %269
  %280 = xor i32 %279, %278
  %281 = add i32 %280, %205
  %282 = add i32 %281, 2
  %283 = shl i32 %282, %197
  %284 = select i1 %199, i32 %283, i32 0
  %285 = lshr i32 %282, %201
  %286 = select i1 %203, i32 %285, i32 0
  %287 = add i32 %279, %239
  %288 = or i32 %284, %286
  %289 = add i32 %287, %282
  %290 = xor i32 %289, %288
  %291 = shl i32 %290, %210
  %292 = select i1 %212, i32 %291, i32 0
  %293 = lshr i32 %290, %214
  %294 = select i1 %216, i32 %293, i32 0
  %295 = or i32 %292, %294
  %296 = add i32 %289, %290
  %297 = xor i32 %296, %295
  %298 = shl i32 %297, %221
  %299 = select i1 %223, i32 %298, i32 0
  %300 = lshr i32 %297, %225
  %301 = select i1 %227, i32 %300, i32 0
  %302 = or i32 %299, %301
  %303 = add i32 %296, %297
  %304 = xor i32 %303, %302
  %305 = shl i32 %304, %225
  %306 = select i1 %227, i32 %305, i32 0
  %307 = lshr i32 %304, %221
  %308 = select i1 %223, i32 %307, i32 0
  %309 = add i32 %303, %304
  %310 = or i32 %306, %308
  %311 = xor i32 %309, %310
  %312 = add i32 %311, %195
  %313 = add i32 %312, %254
  %314 = shl i32 %313, %214
  %315 = select i1 %216, i32 %314, i32 0
  %316 = lshr i32 %313, %210
  %317 = select i1 %212, i32 %316, i32 0
  %318 = or i32 %315, %317
  %319 = load i32, ptr %141, align 4, !invariant.load !3
  %320 = xor i32 %319, %318
  %321 = shl i32 %320, %250
  %322 = select i1 %252, i32 %321, i32 0
  %323 = lshr i32 %320, %254
  %324 = select i1 %256, i32 %323, i32 0
  %325 = or i32 %322, %324
  %326 = call i32 @fused_concatenate_add_2244_1(ptr %0, ptr %1, i32 %6, i32 %9)
  %327 = xor i32 %326, %325
  %328 = shl i32 %327, %261
  %329 = select i1 %263, i32 %328, i32 0
  %330 = lshr i32 %327, %261
  %331 = select i1 %263, i32 %330, i32 0
  %332 = or i32 %329, %331
  %333 = add i32 %326, %327
  %334 = xor i32 %333, %332
  %335 = shl i32 %334, %270
  %336 = select i1 %272, i32 %335, i32 0
  %337 = lshr i32 %334, %274
  %338 = select i1 %276, i32 %337, i32 0
  %339 = or i32 %336, %338
  %340 = add i32 %333, %334
  %341 = xor i32 %340, %339
  %342 = add i32 %341, %239
  %343 = add i32 %342, 4
  %344 = shl i32 %343, %197
  %345 = select i1 %199, i32 %344, i32 0
  %346 = lshr i32 %343, %201
  %347 = select i1 %203, i32 %346, i32 0
  %348 = or i32 %345, %347
  %349 = add i32 %340, %195
  %350 = add i32 %349, %343
  %351 = xor i32 %350, %348
  %352 = shl i32 %351, %210
  %353 = select i1 %212, i32 %352, i32 0
  %354 = lshr i32 %351, %214
  %355 = select i1 %216, i32 %354, i32 0
  %356 = or i32 %353, %355
  %357 = add i32 %350, %351
  %358 = xor i32 %357, %356
  %359 = shl i32 %358, %221
  %360 = select i1 %223, i32 %359, i32 0
  %361 = lshr i32 %358, %225
  %362 = select i1 %227, i32 %361, i32 0
  %363 = or i32 %360, %362
  %364 = add i32 %357, %358
  %365 = xor i32 %364, %363
  %366 = shl i32 %365, %225
  %367 = select i1 %227, i32 %366, i32 0
  %368 = lshr i32 %365, %221
  %369 = select i1 %223, i32 %368, i32 0
  %370 = or i32 %367, %369
  %371 = add i32 %364, %365
  %372 = xor i32 %371, %370
  %373 = add i32 %372, %205
  %374 = add i32 %373, 5
  %375 = call i32 @fused_concatenate__epilogue__concatenate_135_1(ptr %0, ptr %1, i32 %6, i32 %9, i32 1, i32 %374)
  %376 = add i32 %193, 1
  %377 = getelementptr inbounds i32, ptr %2, i32 %376
  store i32 %375, ptr %377, align 4
  ret void
}

define internal i32 @fused_concatenate_add_2244_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = mul i32 %2, 1536
  %6 = add i32 %5, %3
  %7 = getelementptr inbounds i32, ptr %0, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  %9 = call i32 @fused_concatenate_xor_1224_3(ptr %0, ptr %1, i32 %2, i32 %3)
  %10 = add i32 %8, %9
  ret i32 %10
}

define internal i32 @fused_concatenate_broadcast_3086_95(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_concatenate_slice_30_14(ptr %0, ptr %1, i32 %3, i32 0)
  ret i32 %5
}

define internal i32 @fused_concatenate_broadcast_3087_63(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 13
}

define internal i32 @fused_concatenate_broadcast_3088_63(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 19
}

define internal i32 @fused_concatenate_broadcast_3082_51(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_concatenate_slice_29_14(ptr %0, ptr %1, i32 %3, i32 0)
  ret i32 %5
}

define internal i32 @fused_concatenate_broadcast_3089_51(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 15
}

define internal i32 @fused_concatenate_broadcast_3090_51(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 17
}

define internal i32 @fused_concatenate_broadcast_3091_74(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 26
}

define internal i32 @fused_concatenate_broadcast_3092_74(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 6
}

define internal i32 @fused_concatenate_broadcast_3093_35(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_concatenate_slice_29_14(ptr %0, ptr %1, i32 %3, i32 0)
  %6 = call i32 @fused_concatenate_slice_30_14(ptr %0, ptr %1, i32 %3, i32 0)
  %7 = xor i32 %5, %6
  %8 = xor i32 %7, 466688986
  ret i32 %8
}

define internal i32 @fused_concatenate_broadcast_3095_18(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 29
}

define internal i32 @fused_concatenate_broadcast_3096_25(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 3
}

define internal i32 @fused_concatenate_broadcast_3097_36(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 16
}

define internal i32 @fused_concatenate_broadcast_3098_22(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 24
}

define internal i32 @fused_concatenate_broadcast_3099_22(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 8
}

define internal i32 @fused_concatenate__epilogue__concatenate_135_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4, i32 %5) {
  ret i32 %5
}

define internal i32 @fused_concatenate_slice_29_14(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = mul i32 %2, 2
  %6 = add i32 %5, %3
  %7 = getelementptr inbounds i32, ptr %1, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  ret i32 %8
}

define internal i32 @fused_concatenate_slice_30_14(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = mul i32 %2, 2
  %6 = add i32 %5, 1
  %7 = getelementptr inbounds i32, ptr %1, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  ret i32 %8
}

define internal i32 @fused_concatenate_xor_1224_3(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = zext i32 %2 to i64
  %6 = lshr i64 %5, 32
  %7 = trunc i64 %6 to i32
  %8 = trunc i64 %5 to i32
  %9 = call i32 @fused_concatenate_broadcast_3086_95(ptr %0, ptr %1, i32 %2, i32 %3)
  %10 = add i32 %8, %9
  %11 = call i32 @fused_concatenate_broadcast_3087_63(ptr %0, ptr %1, i32 %2, i32 %3)
  %12 = shl i32 %10, %11
  %13 = icmp ult i32 %11, 32
  %14 = select i1 %13, i32 %12, i32 0
  %15 = call i32 @fused_concatenate_broadcast_3088_63(ptr %0, ptr %1, i32 %2, i32 %3)
  %16 = lshr i32 %10, %15
  %17 = icmp ult i32 %15, 32
  %18 = select i1 %17, i32 %16, i32 0
  %19 = call i32 @fused_concatenate_broadcast_3082_51(ptr %0, ptr %1, i32 %2, i32 %3)
  %20 = add i32 %7, %19
  %21 = or i32 %14, %18
  %22 = add i32 %20, %10
  %23 = xor i32 %22, %21
  %24 = call i32 @fused_concatenate_broadcast_3089_51(ptr %0, ptr %1, i32 %2, i32 %3)
  %25 = shl i32 %23, %24
  %26 = icmp ult i32 %24, 32
  %27 = select i1 %26, i32 %25, i32 0
  %28 = call i32 @fused_concatenate_broadcast_3090_51(ptr %0, ptr %1, i32 %2, i32 %3)
  %29 = lshr i32 %23, %28
  %30 = icmp ult i32 %28, 32
  %31 = select i1 %30, i32 %29, i32 0
  %32 = or i32 %27, %31
  %33 = add i32 %22, %23
  %34 = xor i32 %33, %32
  %35 = call i32 @fused_concatenate_broadcast_3091_74(ptr %0, ptr %1, i32 %2, i32 %3)
  %36 = shl i32 %34, %35
  %37 = icmp ult i32 %35, 32
  %38 = select i1 %37, i32 %36, i32 0
  %39 = call i32 @fused_concatenate_broadcast_3092_74(ptr %0, ptr %1, i32 %2, i32 %3)
  %40 = lshr i32 %34, %39
  %41 = icmp ult i32 %39, 32
  %42 = select i1 %41, i32 %40, i32 0
  %43 = add i32 %33, %34
  %44 = or i32 %38, %42
  %45 = xor i32 %43, %44
  %46 = shl i32 %45, %39
  %47 = select i1 %41, i32 %46, i32 0
  %48 = lshr i32 %45, %35
  %49 = select i1 %37, i32 %48, i32 0
  %50 = or i32 %47, %49
  %51 = add i32 %43, %45
  %52 = xor i32 %51, %50
  %53 = call i32 @fused_concatenate_broadcast_3093_35(ptr %0, ptr %1, i32 %2, i32 %3)
  %54 = add i32 %52, %53
  %55 = add i32 %54, 1
  %56 = shl i32 %55, %28
  %57 = select i1 %30, i32 %56, i32 0
  %58 = lshr i32 %55, %24
  %59 = select i1 %26, i32 %58, i32 0
  %60 = add i32 %51, %9
  %61 = or i32 %57, %59
  %62 = add i32 %60, %55
  %63 = xor i32 %62, %61
  %64 = call i32 @fused_concatenate_broadcast_3095_18(ptr %0, ptr %1, i32 %2, i32 %3)
  %65 = shl i32 %63, %64
  %66 = icmp ult i32 %64, 32
  %67 = select i1 %66, i32 %65, i32 0
  %68 = call i32 @fused_concatenate_broadcast_3096_25(ptr %0, ptr %1, i32 %2, i32 %3)
  %69 = lshr i32 %63, %68
  %70 = icmp ult i32 %68, 32
  %71 = select i1 %70, i32 %69, i32 0
  %72 = or i32 %67, %71
  %73 = add i32 %62, %63
  %74 = xor i32 %73, %72
  %75 = call i32 @fused_concatenate_broadcast_3097_36(ptr %0, ptr %1, i32 %2, i32 %3)
  %76 = shl i32 %74, %75
  %77 = icmp ult i32 %75, 32
  %78 = select i1 %77, i32 %76, i32 0
  %79 = lshr i32 %74, %75
  %80 = select i1 %77, i32 %79, i32 0
  %81 = add i32 %73, %74
  %82 = or i32 %78, %80
  %83 = xor i32 %81, %82
  %84 = call i32 @fused_concatenate_broadcast_3098_22(ptr %0, ptr %1, i32 %2, i32 %3)
  %85 = shl i32 %83, %84
  %86 = icmp ult i32 %84, 32
  %87 = select i1 %86, i32 %85, i32 0
  %88 = call i32 @fused_concatenate_broadcast_3099_22(ptr %0, ptr %1, i32 %2, i32 %3)
  %89 = lshr i32 %83, %88
  %90 = icmp ult i32 %88, 32
  %91 = select i1 %90, i32 %89, i32 0
  %92 = or i32 %87, %91
  %93 = add i32 %81, %83
  %94 = xor i32 %93, %92
  %95 = add i32 %94, %19
  %96 = add i32 %95, 2
  %97 = shl i32 %96, %11
  %98 = select i1 %13, i32 %97, i32 0
  %99 = lshr i32 %96, %15
  %100 = select i1 %17, i32 %99, i32 0
  %101 = add i32 %93, %53
  %102 = or i32 %98, %100
  %103 = add i32 %101, %96
  %104 = xor i32 %103, %102
  %105 = shl i32 %104, %24
  %106 = select i1 %26, i32 %105, i32 0
  %107 = lshr i32 %104, %28
  %108 = select i1 %30, i32 %107, i32 0
  %109 = or i32 %106, %108
  %110 = add i32 %103, %104
  %111 = xor i32 %110, %109
  %112 = shl i32 %111, %35
  %113 = select i1 %37, i32 %112, i32 0
  %114 = lshr i32 %111, %39
  %115 = select i1 %41, i32 %114, i32 0
  %116 = or i32 %113, %115
  %117 = add i32 %110, %111
  %118 = xor i32 %117, %116
  %119 = shl i32 %118, %39
  %120 = select i1 %41, i32 %119, i32 0
  %121 = lshr i32 %118, %35
  %122 = select i1 %37, i32 %121, i32 0
  %123 = add i32 %117, %118
  %124 = or i32 %120, %122
  %125 = xor i32 %123, %124
  %126 = add i32 %125, %9
  %127 = add i32 %126, %68
  %128 = shl i32 %127, %28
  %129 = select i1 %30, i32 %128, i32 0
  %130 = lshr i32 %127, %24
  %131 = select i1 %26, i32 %130, i32 0
  %132 = or i32 %129, %131
  %133 = mul i32 %2, 1536
  %134 = add i32 %133, %3
  %135 = getelementptr inbounds i32, ptr %0, i32 %134
  %136 = load i32, ptr %135, align 4, !invariant.load !3
  %137 = xor i32 %136, %132
  ret i32 %137
}

define ptx_kernel void @loop_add_slice_fusion(ptr noalias align 256 dereferenceable(73728) %0, ptr noalias align 256 dereferenceable(12288) %1, ptr noalias align 256 dereferenceable(12288) %2, ptr noalias align 256 dereferenceable(12288) %3, ptr noalias align 256 dereferenceable(12288) %4, ptr noalias align 256 dereferenceable(12288) %5, ptr noalias align 256 dereferenceable(12288) %6, ptr noalias align 256 dereferenceable(12288) %7, ptr noalias align 256 dereferenceable(12288) %8) #0 {
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = udiv i32 %10, 12
  %13 = urem i32 %10, 12
  %14 = mul i32 %13, 128
  %15 = add i32 %14, %11
  %16 = icmp ult i32 %12, 1
  br i1 %16, label %17, label %197

17:                                               ; preds = %9
  %18 = call i32 @fused_add_slice_broadcast_3080_24(ptr %0, i32 1, i32 %15)
  %19 = call i32 @fused_add_slice_broadcast_3131_25(ptr %0, i32 1, i32 %15)
  %20 = add i32 %18, %19
  %21 = call i32 @fused_add_slice_broadcast_3104_268_clone_1(ptr %0, i32 1, i32 %15)
  %22 = call i32 @fused_add_slice_broadcast_3132_51(ptr %0, i32 1, i32 %15)
  %23 = add i32 %21, %22
  %24 = add i32 %20, %23
  %25 = call i32 @fused_add_slice_broadcast_3106_208_clone_1(ptr %0, i32 1, i32 %15)
  %26 = shl i32 %23, %25
  %27 = icmp ult i32 %25, 32
  %28 = select i1 %27, i32 %26, i32 0
  %29 = call i32 @fused_add_slice_broadcast_3107_208_clone_1(ptr %0, i32 1, i32 %15)
  %30 = lshr i32 %23, %29
  %31 = icmp ult i32 %29, 32
  %32 = select i1 %31, i32 %30, i32 0
  %33 = or i32 %28, %32
  %34 = xor i32 %24, %33
  %35 = add i32 %24, %34
  %36 = call i32 @fused_add_slice_broadcast_3108_474_clone_1(ptr %0, i32 1, i32 %15)
  %37 = shl i32 %34, %36
  %38 = icmp ult i32 %36, 32
  %39 = select i1 %38, i32 %37, i32 0
  %40 = call i32 @fused_add_slice_broadcast_3110_474_clone_1(ptr %0, i32 1, i32 %15)
  %41 = lshr i32 %34, %40
  %42 = icmp ult i32 %40, 32
  %43 = select i1 %42, i32 %41, i32 0
  %44 = or i32 %39, %43
  %45 = xor i32 %35, %44
  %46 = add i32 %35, %45
  %47 = call i32 @fused_add_slice_broadcast_3111_324_clone_1(ptr %0, i32 1, i32 %15)
  %48 = shl i32 %45, %47
  %49 = icmp ult i32 %47, 32
  %50 = select i1 %49, i32 %48, i32 0
  %51 = call i32 @fused_add_slice_broadcast_3112_324_clone_1(ptr %0, i32 1, i32 %15)
  %52 = lshr i32 %45, %51
  %53 = icmp ult i32 %51, 32
  %54 = select i1 %53, i32 %52, i32 0
  %55 = or i32 %50, %54
  %56 = xor i32 %46, %55
  %57 = add i32 %46, %56
  %58 = add i32 %57, %22
  %59 = shl i32 %56, %51
  %60 = select i1 %53, i32 %59, i32 0
  %61 = lshr i32 %56, %47
  %62 = select i1 %49, i32 %61, i32 0
  %63 = or i32 %60, %62
  %64 = xor i32 %57, %63
  %65 = call i32 @fused_add_slice_broadcast_3133_23(ptr %0, i32 1, i32 %15)
  %66 = add i32 %64, %65
  %67 = call i32 @fused_add_slice_broadcast_3115_18_clone_1(ptr %0, i32 1, i32 %15)
  %68 = add i32 %66, %67
  %69 = add i32 %58, %68
  %70 = shl i32 %68, %40
  %71 = select i1 %42, i32 %70, i32 0
  %72 = lshr i32 %68, %36
  %73 = select i1 %38, i32 %72, i32 0
  %74 = or i32 %71, %73
  %75 = xor i32 %69, %74
  %76 = add i32 %69, %75
  %77 = call i32 @fused_add_slice_broadcast_3116_266_clone_1(ptr %0, i32 1, i32 %15)
  %78 = shl i32 %75, %77
  %79 = icmp ult i32 %77, 32
  %80 = select i1 %79, i32 %78, i32 0
  %81 = call i32 @fused_add_slice_broadcast_3117_284_clone_1(ptr %0, i32 1, i32 %15)
  %82 = lshr i32 %75, %81
  %83 = icmp ult i32 %81, 32
  %84 = select i1 %83, i32 %82, i32 0
  %85 = or i32 %80, %84
  %86 = xor i32 %76, %85
  %87 = add i32 %76, %86
  %88 = call i32 @fused_add_slice_broadcast_3118_532_clone_1(ptr %0, i32 1, i32 %15)
  %89 = shl i32 %86, %88
  %90 = icmp ult i32 %88, 32
  %91 = select i1 %90, i32 %89, i32 0
  %92 = lshr i32 %86, %88
  %93 = select i1 %90, i32 %92, i32 0
  %94 = or i32 %91, %93
  %95 = xor i32 %87, %94
  %96 = add i32 %87, %95
  %97 = add i32 %96, %65
  %98 = call i32 @fused_add_slice_broadcast_3119_134_clone_1(ptr %0, i32 1, i32 %15)
  %99 = shl i32 %95, %98
  %100 = icmp ult i32 %98, 32
  %101 = select i1 %100, i32 %99, i32 0
  %102 = call i32 @fused_add_slice_broadcast_3120_134_clone_1(ptr %0, i32 1, i32 %15)
  %103 = lshr i32 %95, %102
  %104 = icmp ult i32 %102, 32
  %105 = select i1 %104, i32 %103, i32 0
  %106 = or i32 %101, %105
  %107 = xor i32 %96, %106
  %108 = add i32 %107, %19
  %109 = call i32 @fused_add_slice_broadcast_3121_44_clone_1(ptr %0, i32 1, i32 %15)
  %110 = add i32 %108, %109
  %111 = add i32 %97, %110
  %112 = shl i32 %110, %25
  %113 = select i1 %27, i32 %112, i32 0
  %114 = lshr i32 %110, %29
  %115 = select i1 %31, i32 %114, i32 0
  %116 = or i32 %113, %115
  %117 = xor i32 %111, %116
  %118 = add i32 %111, %117
  %119 = shl i32 %117, %36
  %120 = select i1 %38, i32 %119, i32 0
  %121 = lshr i32 %117, %40
  %122 = select i1 %42, i32 %121, i32 0
  %123 = or i32 %120, %122
  %124 = xor i32 %118, %123
  %125 = add i32 %118, %124
  %126 = shl i32 %124, %47
  %127 = select i1 %49, i32 %126, i32 0
  %128 = lshr i32 %124, %51
  %129 = select i1 %53, i32 %128, i32 0
  %130 = or i32 %127, %129
  %131 = xor i32 %125, %130
  %132 = add i32 %125, %131
  %133 = add i32 %132, %19
  %134 = shl i32 %131, %51
  %135 = select i1 %53, i32 %134, i32 0
  %136 = lshr i32 %131, %47
  %137 = select i1 %49, i32 %136, i32 0
  %138 = or i32 %135, %137
  %139 = xor i32 %132, %138
  %140 = add i32 %139, %22
  %141 = add i32 %140, %81
  %142 = add i32 %133, %141
  %143 = shl i32 %141, %40
  %144 = select i1 %42, i32 %143, i32 0
  %145 = lshr i32 %141, %36
  %146 = select i1 %38, i32 %145, i32 0
  %147 = or i32 %144, %146
  %148 = xor i32 %142, %147
  %149 = add i32 %142, %148
  %150 = shl i32 %148, %77
  %151 = select i1 %79, i32 %150, i32 0
  %152 = lshr i32 %148, %81
  %153 = select i1 %83, i32 %152, i32 0
  %154 = or i32 %151, %153
  %155 = xor i32 %149, %154
  %156 = add i32 %149, %155
  %157 = shl i32 %155, %88
  %158 = select i1 %90, i32 %157, i32 0
  %159 = lshr i32 %155, %88
  %160 = select i1 %90, i32 %159, i32 0
  %161 = or i32 %158, %160
  %162 = xor i32 %156, %161
  %163 = add i32 %156, %162
  %164 = add i32 %163, %22
  %165 = shl i32 %162, %98
  %166 = select i1 %100, i32 %165, i32 0
  %167 = lshr i32 %162, %102
  %168 = select i1 %104, i32 %167, i32 0
  %169 = or i32 %166, %168
  %170 = xor i32 %163, %169
  %171 = add i32 %170, %65
  %172 = call i32 @fused_add_slice_broadcast_3122_20_clone_1(ptr %0, i32 1, i32 %15)
  %173 = add i32 %171, %172
  %174 = add i32 %164, %173
  %175 = shl i32 %173, %25
  %176 = select i1 %27, i32 %175, i32 0
  %177 = lshr i32 %173, %29
  %178 = select i1 %31, i32 %177, i32 0
  %179 = or i32 %176, %178
  %180 = xor i32 %174, %179
  %181 = add i32 %174, %180
  %182 = shl i32 %180, %36
  %183 = select i1 %38, i32 %182, i32 0
  %184 = lshr i32 %180, %40
  %185 = select i1 %42, i32 %184, i32 0
  %186 = or i32 %183, %185
  %187 = xor i32 %181, %186
  %188 = add i32 %181, %187
  %189 = shl i32 %187, %47
  %190 = select i1 %49, i32 %189, i32 0
  %191 = lshr i32 %187, %51
  %192 = select i1 %53, i32 %191, i32 0
  %193 = or i32 %190, %192
  %194 = xor i32 %188, %193
  %195 = add i32 %188, %194
  %196 = add i32 %195, %65
  br label %385

197:                                              ; preds = %9
  %198 = call i32 @fused_add_slice_broadcast_3104_268_clone_1(ptr %0, i32 1, i32 %15)
  %199 = call i32 @fused_add_slice_broadcast_3132_51(ptr %0, i32 1, i32 %15)
  %200 = add i32 %198, %199
  %201 = call i32 @fused_add_slice_broadcast_3106_208_clone_1(ptr %0, i32 1, i32 %15)
  %202 = shl i32 %200, %201
  %203 = icmp ult i32 %201, 32
  %204 = select i1 %203, i32 %202, i32 0
  %205 = call i32 @fused_add_slice_broadcast_3107_208_clone_1(ptr %0, i32 1, i32 %15)
  %206 = lshr i32 %200, %205
  %207 = icmp ult i32 %205, 32
  %208 = select i1 %207, i32 %206, i32 0
  %209 = or i32 %204, %208
  %210 = call i32 @fused_add_slice_broadcast_3080_24(ptr %0, i32 1, i32 %15)
  %211 = call i32 @fused_add_slice_broadcast_3131_25(ptr %0, i32 1, i32 %15)
  %212 = add i32 %210, %211
  %213 = add i32 %212, %200
  %214 = xor i32 %213, %209
  %215 = call i32 @fused_add_slice_broadcast_3108_474_clone_1(ptr %0, i32 1, i32 %15)
  %216 = shl i32 %214, %215
  %217 = icmp ult i32 %215, 32
  %218 = select i1 %217, i32 %216, i32 0
  %219 = call i32 @fused_add_slice_broadcast_3110_474_clone_1(ptr %0, i32 1, i32 %15)
  %220 = lshr i32 %214, %219
  %221 = icmp ult i32 %219, 32
  %222 = select i1 %221, i32 %220, i32 0
  %223 = or i32 %218, %222
  %224 = add i32 %213, %214
  %225 = xor i32 %224, %223
  %226 = call i32 @fused_add_slice_broadcast_3111_324_clone_1(ptr %0, i32 1, i32 %15)
  %227 = shl i32 %225, %226
  %228 = icmp ult i32 %226, 32
  %229 = select i1 %228, i32 %227, i32 0
  %230 = call i32 @fused_add_slice_broadcast_3112_324_clone_1(ptr %0, i32 1, i32 %15)
  %231 = lshr i32 %225, %230
  %232 = icmp ult i32 %230, 32
  %233 = select i1 %232, i32 %231, i32 0
  %234 = or i32 %229, %233
  %235 = add i32 %224, %225
  %236 = xor i32 %235, %234
  %237 = shl i32 %236, %230
  %238 = select i1 %232, i32 %237, i32 0
  %239 = lshr i32 %236, %226
  %240 = select i1 %228, i32 %239, i32 0
  %241 = or i32 %238, %240
  %242 = add i32 %235, %236
  %243 = xor i32 %242, %241
  %244 = call i32 @fused_add_slice_broadcast_3133_23(ptr %0, i32 1, i32 %15)
  %245 = add i32 %243, %244
  %246 = call i32 @fused_add_slice_broadcast_3115_18_clone_1(ptr %0, i32 1, i32 %15)
  %247 = add i32 %245, %246
  %248 = shl i32 %247, %219
  %249 = select i1 %221, i32 %248, i32 0
  %250 = lshr i32 %247, %215
  %251 = select i1 %217, i32 %250, i32 0
  %252 = or i32 %249, %251
  %253 = add i32 %242, %199
  %254 = add i32 %253, %247
  %255 = xor i32 %254, %252
  %256 = call i32 @fused_add_slice_broadcast_3116_266_clone_1(ptr %0, i32 1, i32 %15)
  %257 = shl i32 %255, %256
  %258 = icmp ult i32 %256, 32
  %259 = select i1 %258, i32 %257, i32 0
  %260 = call i32 @fused_add_slice_broadcast_3117_284_clone_1(ptr %0, i32 1, i32 %15)
  %261 = lshr i32 %255, %260
  %262 = icmp ult i32 %260, 32
  %263 = select i1 %262, i32 %261, i32 0
  %264 = or i32 %259, %263
  %265 = add i32 %254, %255
  %266 = xor i32 %265, %264
  %267 = call i32 @fused_add_slice_broadcast_3118_532_clone_1(ptr %0, i32 1, i32 %15)
  %268 = shl i32 %266, %267
  %269 = icmp ult i32 %267, 32
  %270 = select i1 %269, i32 %268, i32 0
  %271 = lshr i32 %266, %267
  %272 = select i1 %269, i32 %271, i32 0
  %273 = or i32 %270, %272
  %274 = add i32 %265, %266
  %275 = xor i32 %274, %273
  %276 = call i32 @fused_add_slice_broadcast_3119_134_clone_1(ptr %0, i32 1, i32 %15)
  %277 = shl i32 %275, %276
  %278 = icmp ult i32 %276, 32
  %279 = select i1 %278, i32 %277, i32 0
  %280 = call i32 @fused_add_slice_broadcast_3120_134_clone_1(ptr %0, i32 1, i32 %15)
  %281 = lshr i32 %275, %280
  %282 = icmp ult i32 %280, 32
  %283 = select i1 %282, i32 %281, i32 0
  %284 = or i32 %279, %283
  %285 = add i32 %274, %275
  %286 = xor i32 %285, %284
  %287 = add i32 %286, %211
  %288 = call i32 @fused_add_slice_broadcast_3121_44_clone_1(ptr %0, i32 1, i32 %15)
  %289 = add i32 %287, %288
  %290 = shl i32 %289, %201
  %291 = select i1 %203, i32 %290, i32 0
  %292 = lshr i32 %289, %205
  %293 = select i1 %207, i32 %292, i32 0
  %294 = or i32 %291, %293
  %295 = add i32 %285, %244
  %296 = add i32 %295, %289
  %297 = xor i32 %296, %294
  %298 = shl i32 %297, %215
  %299 = select i1 %217, i32 %298, i32 0
  %300 = lshr i32 %297, %219
  %301 = select i1 %221, i32 %300, i32 0
  %302 = or i32 %299, %301
  %303 = add i32 %296, %297
  %304 = xor i32 %303, %302
  %305 = shl i32 %304, %226
  %306 = select i1 %228, i32 %305, i32 0
  %307 = lshr i32 %304, %230
  %308 = select i1 %232, i32 %307, i32 0
  %309 = or i32 %306, %308
  %310 = add i32 %303, %304
  %311 = xor i32 %310, %309
  %312 = shl i32 %311, %230
  %313 = select i1 %232, i32 %312, i32 0
  %314 = lshr i32 %311, %226
  %315 = select i1 %228, i32 %314, i32 0
  %316 = or i32 %313, %315
  %317 = add i32 %310, %311
  %318 = xor i32 %317, %316
  %319 = add i32 %318, %199
  %320 = add i32 %319, %260
  %321 = shl i32 %320, %219
  %322 = select i1 %221, i32 %321, i32 0
  %323 = lshr i32 %320, %215
  %324 = select i1 %217, i32 %323, i32 0
  %325 = or i32 %322, %324
  %326 = add i32 %317, %211
  %327 = add i32 %326, %320
  %328 = xor i32 %327, %325
  %329 = shl i32 %328, %256
  %330 = select i1 %258, i32 %329, i32 0
  %331 = lshr i32 %328, %260
  %332 = select i1 %262, i32 %331, i32 0
  %333 = or i32 %330, %332
  %334 = add i32 %327, %328
  %335 = xor i32 %334, %333
  %336 = shl i32 %335, %267
  %337 = select i1 %269, i32 %336, i32 0
  %338 = lshr i32 %335, %267
  %339 = select i1 %269, i32 %338, i32 0
  %340 = or i32 %337, %339
  %341 = add i32 %334, %335
  %342 = xor i32 %341, %340
  %343 = shl i32 %342, %276
  %344 = select i1 %278, i32 %343, i32 0
  %345 = lshr i32 %342, %280
  %346 = select i1 %282, i32 %345, i32 0
  %347 = or i32 %344, %346
  %348 = add i32 %341, %342
  %349 = xor i32 %348, %347
  %350 = add i32 %349, %244
  %351 = call i32 @fused_add_slice_broadcast_3122_20_clone_1(ptr %0, i32 1, i32 %15)
  %352 = add i32 %350, %351
  %353 = shl i32 %352, %201
  %354 = select i1 %203, i32 %353, i32 0
  %355 = lshr i32 %352, %205
  %356 = select i1 %207, i32 %355, i32 0
  %357 = or i32 %354, %356
  %358 = add i32 %348, %199
  %359 = add i32 %358, %352
  %360 = xor i32 %359, %357
  %361 = shl i32 %360, %215
  %362 = select i1 %217, i32 %361, i32 0
  %363 = lshr i32 %360, %219
  %364 = select i1 %221, i32 %363, i32 0
  %365 = or i32 %362, %364
  %366 = add i32 %359, %360
  %367 = xor i32 %366, %365
  %368 = shl i32 %367, %226
  %369 = select i1 %228, i32 %368, i32 0
  %370 = lshr i32 %367, %230
  %371 = select i1 %232, i32 %370, i32 0
  %372 = or i32 %369, %371
  %373 = add i32 %366, %367
  %374 = xor i32 %373, %372
  %375 = shl i32 %374, %230
  %376 = select i1 %232, i32 %375, i32 0
  %377 = lshr i32 %374, %226
  %378 = select i1 %228, i32 %377, i32 0
  %379 = or i32 %376, %378
  %380 = add i32 %373, %374
  %381 = xor i32 %380, %379
  %382 = add i32 %381, %211
  %383 = call i32 @fused_add_slice_broadcast_3123_3_clone_1(ptr %0, i32 1, i32 %15)
  %384 = add i32 %382, %383
  br label %385

385:                                              ; preds = %17, %197
  %386 = phi i32 [ %384, %197 ], [ %196, %17 ]
  br label %387

387:                                              ; preds = %385
  %388 = mul i32 %10, 64
  %389 = udiv i32 %11, 2
  %390 = add i32 %388, %389
  %391 = urem i32 %15, 2
  %392 = icmp ult i32 %391, 1
  br i1 %392, label %393, label %573

393:                                              ; preds = %387
  %394 = call i32 @fused_add_slice_broadcast_3080_24(ptr %0, i32 1, i32 %390)
  %395 = call i32 @fused_add_slice_broadcast_3134_23_clone_1(ptr %0, i32 1, i32 %390)
  %396 = add i32 %394, %395
  %397 = call i32 @fused_add_slice_broadcast_3104_268_clone_1(ptr %0, i32 1, i32 %390)
  %398 = call i32 @fused_add_slice_broadcast_3135_41_clone_1(ptr %0, i32 1, i32 %390)
  %399 = add i32 %397, %398
  %400 = add i32 %396, %399
  %401 = call i32 @fused_add_slice_broadcast_3106_208_clone_1(ptr %0, i32 1, i32 %390)
  %402 = shl i32 %399, %401
  %403 = icmp ult i32 %401, 32
  %404 = select i1 %403, i32 %402, i32 0
  %405 = call i32 @fused_add_slice_broadcast_3107_208_clone_1(ptr %0, i32 1, i32 %390)
  %406 = lshr i32 %399, %405
  %407 = icmp ult i32 %405, 32
  %408 = select i1 %407, i32 %406, i32 0
  %409 = or i32 %404, %408
  %410 = xor i32 %400, %409
  %411 = add i32 %400, %410
  %412 = call i32 @fused_add_slice_broadcast_3108_474_clone_1(ptr %0, i32 1, i32 %390)
  %413 = shl i32 %410, %412
  %414 = icmp ult i32 %412, 32
  %415 = select i1 %414, i32 %413, i32 0
  %416 = call i32 @fused_add_slice_broadcast_3110_474_clone_1(ptr %0, i32 1, i32 %390)
  %417 = lshr i32 %410, %416
  %418 = icmp ult i32 %416, 32
  %419 = select i1 %418, i32 %417, i32 0
  %420 = or i32 %415, %419
  %421 = xor i32 %411, %420
  %422 = add i32 %411, %421
  %423 = call i32 @fused_add_slice_broadcast_3111_324_clone_1(ptr %0, i32 1, i32 %390)
  %424 = shl i32 %421, %423
  %425 = icmp ult i32 %423, 32
  %426 = select i1 %425, i32 %424, i32 0
  %427 = call i32 @fused_add_slice_broadcast_3112_324_clone_1(ptr %0, i32 1, i32 %390)
  %428 = lshr i32 %421, %427
  %429 = icmp ult i32 %427, 32
  %430 = select i1 %429, i32 %428, i32 0
  %431 = or i32 %426, %430
  %432 = xor i32 %422, %431
  %433 = add i32 %422, %432
  %434 = add i32 %433, %398
  %435 = shl i32 %432, %427
  %436 = select i1 %429, i32 %435, i32 0
  %437 = lshr i32 %432, %423
  %438 = select i1 %425, i32 %437, i32 0
  %439 = or i32 %436, %438
  %440 = xor i32 %433, %439
  %441 = call i32 @fused_add_slice_broadcast_3136_23_clone_1(ptr %0, i32 1, i32 %390)
  %442 = add i32 %440, %441
  %443 = call i32 @fused_add_slice_broadcast_3115_18_clone_1(ptr %0, i32 1, i32 %390)
  %444 = add i32 %442, %443
  %445 = add i32 %434, %444
  %446 = shl i32 %444, %416
  %447 = select i1 %418, i32 %446, i32 0
  %448 = lshr i32 %444, %412
  %449 = select i1 %414, i32 %448, i32 0
  %450 = or i32 %447, %449
  %451 = xor i32 %445, %450
  %452 = add i32 %445, %451
  %453 = call i32 @fused_add_slice_broadcast_3116_266_clone_1(ptr %0, i32 1, i32 %390)
  %454 = shl i32 %451, %453
  %455 = icmp ult i32 %453, 32
  %456 = select i1 %455, i32 %454, i32 0
  %457 = call i32 @fused_add_slice_broadcast_3117_284_clone_1(ptr %0, i32 1, i32 %390)
  %458 = lshr i32 %451, %457
  %459 = icmp ult i32 %457, 32
  %460 = select i1 %459, i32 %458, i32 0
  %461 = or i32 %456, %460
  %462 = xor i32 %452, %461
  %463 = add i32 %452, %462
  %464 = call i32 @fused_add_slice_broadcast_3118_532_clone_1(ptr %0, i32 1, i32 %390)
  %465 = shl i32 %462, %464
  %466 = icmp ult i32 %464, 32
  %467 = select i1 %466, i32 %465, i32 0
  %468 = lshr i32 %462, %464
  %469 = select i1 %466, i32 %468, i32 0
  %470 = or i32 %467, %469
  %471 = xor i32 %463, %470
  %472 = add i32 %463, %471
  %473 = add i32 %472, %441
  %474 = call i32 @fused_add_slice_broadcast_3119_134_clone_1(ptr %0, i32 1, i32 %390)
  %475 = shl i32 %471, %474
  %476 = icmp ult i32 %474, 32
  %477 = select i1 %476, i32 %475, i32 0
  %478 = call i32 @fused_add_slice_broadcast_3120_134_clone_1(ptr %0, i32 1, i32 %390)
  %479 = lshr i32 %471, %478
  %480 = icmp ult i32 %478, 32
  %481 = select i1 %480, i32 %479, i32 0
  %482 = or i32 %477, %481
  %483 = xor i32 %472, %482
  %484 = add i32 %483, %395
  %485 = call i32 @fused_add_slice_broadcast_3121_44_clone_1(ptr %0, i32 1, i32 %390)
  %486 = add i32 %484, %485
  %487 = add i32 %473, %486
  %488 = shl i32 %486, %401
  %489 = select i1 %403, i32 %488, i32 0
  %490 = lshr i32 %486, %405
  %491 = select i1 %407, i32 %490, i32 0
  %492 = or i32 %489, %491
  %493 = xor i32 %487, %492
  %494 = add i32 %487, %493
  %495 = shl i32 %493, %412
  %496 = select i1 %414, i32 %495, i32 0
  %497 = lshr i32 %493, %416
  %498 = select i1 %418, i32 %497, i32 0
  %499 = or i32 %496, %498
  %500 = xor i32 %494, %499
  %501 = add i32 %494, %500
  %502 = shl i32 %500, %423
  %503 = select i1 %425, i32 %502, i32 0
  %504 = lshr i32 %500, %427
  %505 = select i1 %429, i32 %504, i32 0
  %506 = or i32 %503, %505
  %507 = xor i32 %501, %506
  %508 = add i32 %501, %507
  %509 = add i32 %508, %395
  %510 = shl i32 %507, %427
  %511 = select i1 %429, i32 %510, i32 0
  %512 = lshr i32 %507, %423
  %513 = select i1 %425, i32 %512, i32 0
  %514 = or i32 %511, %513
  %515 = xor i32 %508, %514
  %516 = add i32 %515, %398
  %517 = add i32 %516, %457
  %518 = add i32 %509, %517
  %519 = shl i32 %517, %416
  %520 = select i1 %418, i32 %519, i32 0
  %521 = lshr i32 %517, %412
  %522 = select i1 %414, i32 %521, i32 0
  %523 = or i32 %520, %522
  %524 = xor i32 %518, %523
  %525 = add i32 %518, %524
  %526 = shl i32 %524, %453
  %527 = select i1 %455, i32 %526, i32 0
  %528 = lshr i32 %524, %457
  %529 = select i1 %459, i32 %528, i32 0
  %530 = or i32 %527, %529
  %531 = xor i32 %525, %530
  %532 = add i32 %525, %531
  %533 = shl i32 %531, %464
  %534 = select i1 %466, i32 %533, i32 0
  %535 = lshr i32 %531, %464
  %536 = select i1 %466, i32 %535, i32 0
  %537 = or i32 %534, %536
  %538 = xor i32 %532, %537
  %539 = add i32 %532, %538
  %540 = add i32 %539, %398
  %541 = shl i32 %538, %474
  %542 = select i1 %476, i32 %541, i32 0
  %543 = lshr i32 %538, %478
  %544 = select i1 %480, i32 %543, i32 0
  %545 = or i32 %542, %544
  %546 = xor i32 %539, %545
  %547 = add i32 %546, %441
  %548 = call i32 @fused_add_slice_broadcast_3122_20_clone_1(ptr %0, i32 1, i32 %390)
  %549 = add i32 %547, %548
  %550 = add i32 %540, %549
  %551 = shl i32 %549, %401
  %552 = select i1 %403, i32 %551, i32 0
  %553 = lshr i32 %549, %405
  %554 = select i1 %407, i32 %553, i32 0
  %555 = or i32 %552, %554
  %556 = xor i32 %550, %555
  %557 = add i32 %550, %556
  %558 = shl i32 %556, %412
  %559 = select i1 %414, i32 %558, i32 0
  %560 = lshr i32 %556, %416
  %561 = select i1 %418, i32 %560, i32 0
  %562 = or i32 %559, %561
  %563 = xor i32 %557, %562
  %564 = add i32 %557, %563
  %565 = shl i32 %563, %423
  %566 = select i1 %425, i32 %565, i32 0
  %567 = lshr i32 %563, %427
  %568 = select i1 %429, i32 %567, i32 0
  %569 = or i32 %566, %568
  %570 = xor i32 %564, %569
  %571 = add i32 %564, %570
  %572 = add i32 %571, %441
  br label %761

573:                                              ; preds = %387
  %574 = call i32 @fused_add_slice_broadcast_3104_268_clone_1(ptr %0, i32 1, i32 %390)
  %575 = call i32 @fused_add_slice_broadcast_3135_41_clone_1(ptr %0, i32 1, i32 %390)
  %576 = add i32 %574, %575
  %577 = call i32 @fused_add_slice_broadcast_3106_208_clone_1(ptr %0, i32 1, i32 %390)
  %578 = shl i32 %576, %577
  %579 = icmp ult i32 %577, 32
  %580 = select i1 %579, i32 %578, i32 0
  %581 = call i32 @fused_add_slice_broadcast_3107_208_clone_1(ptr %0, i32 1, i32 %390)
  %582 = lshr i32 %576, %581
  %583 = icmp ult i32 %581, 32
  %584 = select i1 %583, i32 %582, i32 0
  %585 = or i32 %580, %584
  %586 = call i32 @fused_add_slice_broadcast_3080_24(ptr %0, i32 1, i32 %390)
  %587 = call i32 @fused_add_slice_broadcast_3134_23_clone_1(ptr %0, i32 1, i32 %390)
  %588 = add i32 %586, %587
  %589 = add i32 %588, %576
  %590 = xor i32 %589, %585
  %591 = call i32 @fused_add_slice_broadcast_3108_474_clone_1(ptr %0, i32 1, i32 %390)
  %592 = shl i32 %590, %591
  %593 = icmp ult i32 %591, 32
  %594 = select i1 %593, i32 %592, i32 0
  %595 = call i32 @fused_add_slice_broadcast_3110_474_clone_1(ptr %0, i32 1, i32 %390)
  %596 = lshr i32 %590, %595
  %597 = icmp ult i32 %595, 32
  %598 = select i1 %597, i32 %596, i32 0
  %599 = or i32 %594, %598
  %600 = add i32 %589, %590
  %601 = xor i32 %600, %599
  %602 = call i32 @fused_add_slice_broadcast_3111_324_clone_1(ptr %0, i32 1, i32 %390)
  %603 = shl i32 %601, %602
  %604 = icmp ult i32 %602, 32
  %605 = select i1 %604, i32 %603, i32 0
  %606 = call i32 @fused_add_slice_broadcast_3112_324_clone_1(ptr %0, i32 1, i32 %390)
  %607 = lshr i32 %601, %606
  %608 = icmp ult i32 %606, 32
  %609 = select i1 %608, i32 %607, i32 0
  %610 = or i32 %605, %609
  %611 = add i32 %600, %601
  %612 = xor i32 %611, %610
  %613 = shl i32 %612, %606
  %614 = select i1 %608, i32 %613, i32 0
  %615 = lshr i32 %612, %602
  %616 = select i1 %604, i32 %615, i32 0
  %617 = or i32 %614, %616
  %618 = add i32 %611, %612
  %619 = xor i32 %618, %617
  %620 = call i32 @fused_add_slice_broadcast_3136_23_clone_1(ptr %0, i32 1, i32 %390)
  %621 = add i32 %619, %620
  %622 = call i32 @fused_add_slice_broadcast_3115_18_clone_1(ptr %0, i32 1, i32 %390)
  %623 = add i32 %621, %622
  %624 = shl i32 %623, %595
  %625 = select i1 %597, i32 %624, i32 0
  %626 = lshr i32 %623, %591
  %627 = select i1 %593, i32 %626, i32 0
  %628 = or i32 %625, %627
  %629 = add i32 %618, %575
  %630 = add i32 %629, %623
  %631 = xor i32 %630, %628
  %632 = call i32 @fused_add_slice_broadcast_3116_266_clone_1(ptr %0, i32 1, i32 %390)
  %633 = shl i32 %631, %632
  %634 = icmp ult i32 %632, 32
  %635 = select i1 %634, i32 %633, i32 0
  %636 = call i32 @fused_add_slice_broadcast_3117_284_clone_1(ptr %0, i32 1, i32 %390)
  %637 = lshr i32 %631, %636
  %638 = icmp ult i32 %636, 32
  %639 = select i1 %638, i32 %637, i32 0
  %640 = or i32 %635, %639
  %641 = add i32 %630, %631
  %642 = xor i32 %641, %640
  %643 = call i32 @fused_add_slice_broadcast_3118_532_clone_1(ptr %0, i32 1, i32 %390)
  %644 = shl i32 %642, %643
  %645 = icmp ult i32 %643, 32
  %646 = select i1 %645, i32 %644, i32 0
  %647 = lshr i32 %642, %643
  %648 = select i1 %645, i32 %647, i32 0
  %649 = or i32 %646, %648
  %650 = add i32 %641, %642
  %651 = xor i32 %650, %649
  %652 = call i32 @fused_add_slice_broadcast_3119_134_clone_1(ptr %0, i32 1, i32 %390)
  %653 = shl i32 %651, %652
  %654 = icmp ult i32 %652, 32
  %655 = select i1 %654, i32 %653, i32 0
  %656 = call i32 @fused_add_slice_broadcast_3120_134_clone_1(ptr %0, i32 1, i32 %390)
  %657 = lshr i32 %651, %656
  %658 = icmp ult i32 %656, 32
  %659 = select i1 %658, i32 %657, i32 0
  %660 = or i32 %655, %659
  %661 = add i32 %650, %651
  %662 = xor i32 %661, %660
  %663 = add i32 %662, %587
  %664 = call i32 @fused_add_slice_broadcast_3121_44_clone_1(ptr %0, i32 1, i32 %390)
  %665 = add i32 %663, %664
  %666 = shl i32 %665, %577
  %667 = select i1 %579, i32 %666, i32 0
  %668 = lshr i32 %665, %581
  %669 = select i1 %583, i32 %668, i32 0
  %670 = or i32 %667, %669
  %671 = add i32 %661, %620
  %672 = add i32 %671, %665
  %673 = xor i32 %672, %670
  %674 = shl i32 %673, %591
  %675 = select i1 %593, i32 %674, i32 0
  %676 = lshr i32 %673, %595
  %677 = select i1 %597, i32 %676, i32 0
  %678 = or i32 %675, %677
  %679 = add i32 %672, %673
  %680 = xor i32 %679, %678
  %681 = shl i32 %680, %602
  %682 = select i1 %604, i32 %681, i32 0
  %683 = lshr i32 %680, %606
  %684 = select i1 %608, i32 %683, i32 0
  %685 = or i32 %682, %684
  %686 = add i32 %679, %680
  %687 = xor i32 %686, %685
  %688 = shl i32 %687, %606
  %689 = select i1 %608, i32 %688, i32 0
  %690 = lshr i32 %687, %602
  %691 = select i1 %604, i32 %690, i32 0
  %692 = or i32 %689, %691
  %693 = add i32 %686, %687
  %694 = xor i32 %693, %692
  %695 = add i32 %694, %575
  %696 = add i32 %695, %636
  %697 = shl i32 %696, %595
  %698 = select i1 %597, i32 %697, i32 0
  %699 = lshr i32 %696, %591
  %700 = select i1 %593, i32 %699, i32 0
  %701 = or i32 %698, %700
  %702 = add i32 %693, %587
  %703 = add i32 %702, %696
  %704 = xor i32 %703, %701
  %705 = shl i32 %704, %632
  %706 = select i1 %634, i32 %705, i32 0
  %707 = lshr i32 %704, %636
  %708 = select i1 %638, i32 %707, i32 0
  %709 = or i32 %706, %708
  %710 = add i32 %703, %704
  %711 = xor i32 %710, %709
  %712 = shl i32 %711, %643
  %713 = select i1 %645, i32 %712, i32 0
  %714 = lshr i32 %711, %643
  %715 = select i1 %645, i32 %714, i32 0
  %716 = or i32 %713, %715
  %717 = add i32 %710, %711
  %718 = xor i32 %717, %716
  %719 = shl i32 %718, %652
  %720 = select i1 %654, i32 %719, i32 0
  %721 = lshr i32 %718, %656
  %722 = select i1 %658, i32 %721, i32 0
  %723 = or i32 %720, %722
  %724 = add i32 %717, %718
  %725 = xor i32 %724, %723
  %726 = add i32 %725, %620
  %727 = call i32 @fused_add_slice_broadcast_3122_20_clone_1(ptr %0, i32 1, i32 %390)
  %728 = add i32 %726, %727
  %729 = shl i32 %728, %577
  %730 = select i1 %579, i32 %729, i32 0
  %731 = lshr i32 %728, %581
  %732 = select i1 %583, i32 %731, i32 0
  %733 = or i32 %730, %732
  %734 = add i32 %724, %575
  %735 = add i32 %734, %728
  %736 = xor i32 %735, %733
  %737 = shl i32 %736, %591
  %738 = select i1 %593, i32 %737, i32 0
  %739 = lshr i32 %736, %595
  %740 = select i1 %597, i32 %739, i32 0
  %741 = or i32 %738, %740
  %742 = add i32 %735, %736
  %743 = xor i32 %742, %741
  %744 = shl i32 %743, %602
  %745 = select i1 %604, i32 %744, i32 0
  %746 = lshr i32 %743, %606
  %747 = select i1 %608, i32 %746, i32 0
  %748 = or i32 %745, %747
  %749 = add i32 %742, %743
  %750 = xor i32 %749, %748
  %751 = shl i32 %750, %606
  %752 = select i1 %608, i32 %751, i32 0
  %753 = lshr i32 %750, %602
  %754 = select i1 %604, i32 %753, i32 0
  %755 = or i32 %752, %754
  %756 = add i32 %749, %750
  %757 = xor i32 %756, %755
  %758 = add i32 %757, %587
  %759 = call i32 @fused_add_slice_broadcast_3123_3_clone_1(ptr %0, i32 1, i32 %390)
  %760 = add i32 %758, %759
  br label %761

761:                                              ; preds = %393, %573
  %762 = phi i32 [ %760, %573 ], [ %572, %393 ]
  br label %763

763:                                              ; preds = %761
  %764 = call i32 @fused_add_slice_bitcast_17_26_clone_1(ptr %0, i32 %15, i32 1)
  %765 = call i32 @fused_add_slice_broadcast_3104_268_clone_1(ptr %0, i32 %12, i32 %15)
  %766 = add i32 %765, %764
  %767 = call i32 @fused_add_slice_broadcast_3106_208_clone_1(ptr %0, i32 %12, i32 %15)
  %768 = shl i32 %766, %767
  %769 = icmp ult i32 %767, 32
  %770 = select i1 %769, i32 %768, i32 0
  %771 = call i32 @fused_add_slice_broadcast_3107_208_clone_1(ptr %0, i32 %12, i32 %15)
  %772 = lshr i32 %766, %771
  %773 = icmp ult i32 %771, 32
  %774 = select i1 %773, i32 %772, i32 0
  %775 = call i32 @fused_add_slice_broadcast_3080_24(ptr %0, i32 %12, i32 %15)
  %776 = call i32 @fused_add_slice_bitcast_17_26_clone_1(ptr %0, i32 %15, i32 0)
  %777 = add i32 %775, %776
  %778 = or i32 %770, %774
  %779 = add i32 %777, %766
  %780 = xor i32 %779, %778
  %781 = call i32 @fused_add_slice_broadcast_3108_474_clone_1(ptr %0, i32 %12, i32 %15)
  %782 = shl i32 %780, %781
  %783 = icmp ult i32 %781, 32
  %784 = select i1 %783, i32 %782, i32 0
  %785 = call i32 @fused_add_slice_broadcast_3110_474_clone_1(ptr %0, i32 %12, i32 %15)
  %786 = lshr i32 %780, %785
  %787 = icmp ult i32 %785, 32
  %788 = select i1 %787, i32 %786, i32 0
  %789 = or i32 %784, %788
  %790 = add i32 %779, %780
  %791 = xor i32 %790, %789
  %792 = call i32 @fused_add_slice_broadcast_3111_324_clone_1(ptr %0, i32 %12, i32 %15)
  %793 = shl i32 %791, %792
  %794 = icmp ult i32 %792, 32
  %795 = select i1 %794, i32 %793, i32 0
  %796 = call i32 @fused_add_slice_broadcast_3112_324_clone_1(ptr %0, i32 %12, i32 %15)
  %797 = lshr i32 %791, %796
  %798 = icmp ult i32 %796, 32
  %799 = select i1 %798, i32 %797, i32 0
  %800 = add i32 %790, %791
  %801 = or i32 %795, %799
  %802 = xor i32 %800, %801
  %803 = shl i32 %802, %796
  %804 = select i1 %798, i32 %803, i32 0
  %805 = lshr i32 %802, %792
  %806 = select i1 %794, i32 %805, i32 0
  %807 = or i32 %804, %806
  %808 = add i32 %800, %802
  %809 = xor i32 %808, %807
  %810 = xor i32 %776, %764
  %811 = call i32 @fused_add_slice_broadcast_1685_97_clone_1(ptr %0, i32 %15, i32 0)
  %812 = xor i32 %810, %811
  %813 = add i32 %809, %812
  %814 = call i32 @fused_add_slice_broadcast_3115_18_clone_1(ptr %0, i32 %12, i32 %15)
  %815 = add i32 %813, %814
  %816 = shl i32 %815, %785
  %817 = select i1 %787, i32 %816, i32 0
  %818 = lshr i32 %815, %781
  %819 = select i1 %783, i32 %818, i32 0
  %820 = add i32 %808, %764
  %821 = or i32 %817, %819
  %822 = add i32 %820, %815
  %823 = xor i32 %822, %821
  %824 = call i32 @fused_add_slice_broadcast_3116_266_clone_1(ptr %0, i32 %12, i32 %15)
  %825 = shl i32 %823, %824
  %826 = icmp ult i32 %824, 32
  %827 = select i1 %826, i32 %825, i32 0
  %828 = call i32 @fused_add_slice_broadcast_3117_284_clone_1(ptr %0, i32 %12, i32 %15)
  %829 = lshr i32 %823, %828
  %830 = icmp ult i32 %828, 32
  %831 = select i1 %830, i32 %829, i32 0
  %832 = or i32 %827, %831
  %833 = add i32 %822, %823
  %834 = xor i32 %833, %832
  %835 = call i32 @fused_add_slice_broadcast_3118_532_clone_1(ptr %0, i32 %12, i32 %15)
  %836 = shl i32 %834, %835
  %837 = icmp ult i32 %835, 32
  %838 = select i1 %837, i32 %836, i32 0
  %839 = lshr i32 %834, %835
  %840 = select i1 %837, i32 %839, i32 0
  %841 = add i32 %833, %834
  %842 = or i32 %838, %840
  %843 = xor i32 %841, %842
  %844 = call i32 @fused_add_slice_broadcast_3119_134_clone_1(ptr %0, i32 %12, i32 %15)
  %845 = shl i32 %843, %844
  %846 = icmp ult i32 %844, 32
  %847 = select i1 %846, i32 %845, i32 0
  %848 = call i32 @fused_add_slice_broadcast_3120_134_clone_1(ptr %0, i32 %12, i32 %15)
  %849 = lshr i32 %843, %848
  %850 = icmp ult i32 %848, 32
  %851 = select i1 %850, i32 %849, i32 0
  %852 = or i32 %847, %851
  %853 = add i32 %841, %843
  %854 = xor i32 %853, %852
  %855 = add i32 %854, %776
  %856 = call i32 @fused_add_slice_broadcast_3121_44_clone_1(ptr %0, i32 %12, i32 %15)
  %857 = add i32 %855, %856
  %858 = shl i32 %857, %767
  %859 = select i1 %769, i32 %858, i32 0
  %860 = lshr i32 %857, %771
  %861 = select i1 %773, i32 %860, i32 0
  %862 = add i32 %853, %812
  %863 = or i32 %859, %861
  %864 = add i32 %862, %857
  %865 = xor i32 %864, %863
  %866 = shl i32 %865, %781
  %867 = select i1 %783, i32 %866, i32 0
  %868 = lshr i32 %865, %785
  %869 = select i1 %787, i32 %868, i32 0
  %870 = or i32 %867, %869
  %871 = add i32 %864, %865
  %872 = xor i32 %871, %870
  %873 = shl i32 %872, %792
  %874 = select i1 %794, i32 %873, i32 0
  %875 = lshr i32 %872, %796
  %876 = select i1 %798, i32 %875, i32 0
  %877 = add i32 %871, %872
  %878 = or i32 %874, %876
  %879 = xor i32 %877, %878
  %880 = shl i32 %879, %796
  %881 = select i1 %798, i32 %880, i32 0
  %882 = lshr i32 %879, %792
  %883 = select i1 %794, i32 %882, i32 0
  %884 = or i32 %881, %883
  %885 = add i32 %877, %879
  %886 = xor i32 %885, %884
  %887 = add i32 %886, %764
  %888 = add i32 %887, %828
  %889 = shl i32 %888, %785
  %890 = select i1 %787, i32 %889, i32 0
  %891 = lshr i32 %888, %781
  %892 = select i1 %783, i32 %891, i32 0
  %893 = add i32 %885, %776
  %894 = or i32 %890, %892
  %895 = add i32 %893, %888
  %896 = xor i32 %895, %894
  %897 = shl i32 %896, %824
  %898 = select i1 %826, i32 %897, i32 0
  %899 = lshr i32 %896, %828
  %900 = select i1 %830, i32 %899, i32 0
  %901 = or i32 %898, %900
  %902 = add i32 %895, %896
  %903 = xor i32 %902, %901
  %904 = shl i32 %903, %835
  %905 = select i1 %837, i32 %904, i32 0
  %906 = lshr i32 %903, %835
  %907 = select i1 %837, i32 %906, i32 0
  %908 = add i32 %902, %903
  %909 = or i32 %905, %907
  %910 = xor i32 %908, %909
  %911 = shl i32 %910, %844
  %912 = select i1 %846, i32 %911, i32 0
  %913 = lshr i32 %910, %848
  %914 = select i1 %850, i32 %913, i32 0
  %915 = or i32 %912, %914
  %916 = add i32 %908, %910
  %917 = xor i32 %916, %915
  %918 = add i32 %917, %812
  %919 = call i32 @fused_add_slice_broadcast_3122_20_clone_1(ptr %0, i32 %12, i32 %15)
  %920 = add i32 %918, %919
  %921 = shl i32 %920, %767
  %922 = select i1 %769, i32 %921, i32 0
  %923 = lshr i32 %920, %771
  %924 = select i1 %773, i32 %923, i32 0
  %925 = add i32 %916, %764
  %926 = or i32 %922, %924
  %927 = add i32 %925, %920
  %928 = xor i32 %927, %926
  %929 = shl i32 %928, %781
  %930 = select i1 %783, i32 %929, i32 0
  %931 = lshr i32 %928, %785
  %932 = select i1 %787, i32 %931, i32 0
  %933 = or i32 %930, %932
  %934 = add i32 %927, %928
  %935 = xor i32 %934, %933
  %936 = shl i32 %935, %792
  %937 = select i1 %794, i32 %936, i32 0
  %938 = lshr i32 %935, %796
  %939 = select i1 %798, i32 %938, i32 0
  %940 = or i32 %937, %939
  %941 = add i32 %934, %935
  %942 = xor i32 %941, %940
  %943 = add i32 %941, %942
  %944 = add i32 %943, %812
  %945 = call i32 @fused_add_slice_bitcast_103_26_clone_1(ptr %0, i32 %15, i32 1)
  %946 = add i32 %765, %945
  %947 = shl i32 %946, %767
  %948 = select i1 %769, i32 %947, i32 0
  %949 = lshr i32 %946, %771
  %950 = select i1 %773, i32 %949, i32 0
  %951 = call i32 @fused_add_slice_bitcast_103_26_clone_1(ptr %0, i32 %15, i32 0)
  %952 = add i32 %775, %951
  %953 = or i32 %948, %950
  %954 = add i32 %952, %946
  %955 = xor i32 %954, %953
  %956 = shl i32 %955, %781
  %957 = select i1 %783, i32 %956, i32 0
  %958 = lshr i32 %955, %785
  %959 = select i1 %787, i32 %958, i32 0
  %960 = or i32 %957, %959
  %961 = add i32 %954, %955
  %962 = xor i32 %961, %960
  %963 = shl i32 %962, %792
  %964 = select i1 %794, i32 %963, i32 0
  %965 = lshr i32 %962, %796
  %966 = select i1 %798, i32 %965, i32 0
  %967 = add i32 %961, %962
  %968 = or i32 %964, %966
  %969 = xor i32 %967, %968
  %970 = shl i32 %969, %796
  %971 = select i1 %798, i32 %970, i32 0
  %972 = lshr i32 %969, %792
  %973 = select i1 %794, i32 %972, i32 0
  %974 = or i32 %971, %973
  %975 = add i32 %967, %969
  %976 = xor i32 %975, %974
  %977 = xor i32 %951, %945
  %978 = xor i32 %977, %811
  %979 = add i32 %976, %978
  %980 = add i32 %979, %814
  %981 = shl i32 %980, %785
  %982 = select i1 %787, i32 %981, i32 0
  %983 = lshr i32 %980, %781
  %984 = select i1 %783, i32 %983, i32 0
  %985 = add i32 %975, %945
  %986 = or i32 %982, %984
  %987 = add i32 %985, %980
  %988 = xor i32 %987, %986
  %989 = shl i32 %988, %824
  %990 = select i1 %826, i32 %989, i32 0
  %991 = lshr i32 %988, %828
  %992 = select i1 %830, i32 %991, i32 0
  %993 = or i32 %990, %992
  %994 = add i32 %987, %988
  %995 = xor i32 %994, %993
  %996 = shl i32 %995, %835
  %997 = select i1 %837, i32 %996, i32 0
  %998 = lshr i32 %995, %835
  %999 = select i1 %837, i32 %998, i32 0
  %1000 = add i32 %994, %995
  %1001 = or i32 %997, %999
  %1002 = xor i32 %1000, %1001
  %1003 = shl i32 %1002, %844
  %1004 = select i1 %846, i32 %1003, i32 0
  %1005 = lshr i32 %1002, %848
  %1006 = select i1 %850, i32 %1005, i32 0
  %1007 = or i32 %1004, %1006
  %1008 = add i32 %1000, %1002
  %1009 = xor i32 %1008, %1007
  %1010 = add i32 %1009, %951
  %1011 = add i32 %1010, %856
  %1012 = shl i32 %1011, %767
  %1013 = select i1 %769, i32 %1012, i32 0
  %1014 = lshr i32 %1011, %771
  %1015 = select i1 %773, i32 %1014, i32 0
  %1016 = add i32 %1008, %978
  %1017 = or i32 %1013, %1015
  %1018 = add i32 %1016, %1011
  %1019 = xor i32 %1018, %1017
  %1020 = shl i32 %1019, %781
  %1021 = select i1 %783, i32 %1020, i32 0
  %1022 = lshr i32 %1019, %785
  %1023 = select i1 %787, i32 %1022, i32 0
  %1024 = or i32 %1021, %1023
  %1025 = add i32 %1018, %1019
  %1026 = xor i32 %1025, %1024
  %1027 = shl i32 %1026, %792
  %1028 = select i1 %794, i32 %1027, i32 0
  %1029 = lshr i32 %1026, %796
  %1030 = select i1 %798, i32 %1029, i32 0
  %1031 = add i32 %1025, %1026
  %1032 = or i32 %1028, %1030
  %1033 = xor i32 %1031, %1032
  %1034 = shl i32 %1033, %796
  %1035 = select i1 %798, i32 %1034, i32 0
  %1036 = lshr i32 %1033, %792
  %1037 = select i1 %794, i32 %1036, i32 0
  %1038 = or i32 %1035, %1037
  %1039 = add i32 %1031, %1033
  %1040 = xor i32 %1039, %1038
  %1041 = add i32 %1040, %945
  %1042 = add i32 %1041, %828
  %1043 = shl i32 %1042, %785
  %1044 = select i1 %787, i32 %1043, i32 0
  %1045 = lshr i32 %1042, %781
  %1046 = select i1 %783, i32 %1045, i32 0
  %1047 = add i32 %1039, %951
  %1048 = or i32 %1044, %1046
  %1049 = add i32 %1047, %1042
  %1050 = xor i32 %1049, %1048
  %1051 = shl i32 %1050, %824
  %1052 = select i1 %826, i32 %1051, i32 0
  %1053 = lshr i32 %1050, %828
  %1054 = select i1 %830, i32 %1053, i32 0
  %1055 = or i32 %1052, %1054
  %1056 = add i32 %1049, %1050
  %1057 = xor i32 %1056, %1055
  %1058 = shl i32 %1057, %835
  %1059 = select i1 %837, i32 %1058, i32 0
  %1060 = lshr i32 %1057, %835
  %1061 = select i1 %837, i32 %1060, i32 0
  %1062 = add i32 %1056, %1057
  %1063 = or i32 %1059, %1061
  %1064 = xor i32 %1062, %1063
  %1065 = shl i32 %1064, %844
  %1066 = select i1 %846, i32 %1065, i32 0
  %1067 = lshr i32 %1064, %848
  %1068 = select i1 %850, i32 %1067, i32 0
  %1069 = or i32 %1066, %1068
  %1070 = add i32 %1062, %1064
  %1071 = xor i32 %1070, %1069
  %1072 = add i32 %1071, %978
  %1073 = add i32 %1072, %919
  %1074 = shl i32 %1073, %767
  %1075 = select i1 %769, i32 %1074, i32 0
  %1076 = lshr i32 %1073, %771
  %1077 = select i1 %773, i32 %1076, i32 0
  %1078 = add i32 %1070, %945
  %1079 = or i32 %1075, %1077
  %1080 = add i32 %1078, %1073
  %1081 = xor i32 %1080, %1079
  %1082 = shl i32 %1081, %781
  %1083 = select i1 %783, i32 %1082, i32 0
  %1084 = lshr i32 %1081, %785
  %1085 = select i1 %787, i32 %1084, i32 0
  %1086 = or i32 %1083, %1085
  %1087 = add i32 %1080, %1081
  %1088 = xor i32 %1087, %1086
  %1089 = shl i32 %1088, %792
  %1090 = select i1 %794, i32 %1089, i32 0
  %1091 = lshr i32 %1088, %796
  %1092 = select i1 %798, i32 %1091, i32 0
  %1093 = or i32 %1090, %1092
  %1094 = add i32 %1087, %1088
  %1095 = xor i32 %1094, %1093
  %1096 = add i32 %1094, %1095
  %1097 = add i32 %1096, %978
  %1098 = call i32 @fused_add_slice_bitcast_5_30_clone_1(ptr %0, i32 %15, i32 1)
  %1099 = add i32 %765, %1098
  %1100 = shl i32 %1099, %767
  %1101 = select i1 %769, i32 %1100, i32 0
  %1102 = lshr i32 %1099, %771
  %1103 = select i1 %773, i32 %1102, i32 0
  %1104 = call i32 @fused_add_slice_bitcast_5_30_clone_1(ptr %0, i32 %15, i32 0)
  %1105 = add i32 %775, %1104
  %1106 = or i32 %1101, %1103
  %1107 = add i32 %1105, %1099
  %1108 = xor i32 %1107, %1106
  %1109 = shl i32 %1108, %781
  %1110 = select i1 %783, i32 %1109, i32 0
  %1111 = lshr i32 %1108, %785
  %1112 = select i1 %787, i32 %1111, i32 0
  %1113 = or i32 %1110, %1112
  %1114 = add i32 %1107, %1108
  %1115 = xor i32 %1114, %1113
  %1116 = shl i32 %1115, %792
  %1117 = select i1 %794, i32 %1116, i32 0
  %1118 = lshr i32 %1115, %796
  %1119 = select i1 %798, i32 %1118, i32 0
  %1120 = add i32 %1114, %1115
  %1121 = or i32 %1117, %1119
  %1122 = xor i32 %1120, %1121
  %1123 = shl i32 %1122, %796
  %1124 = select i1 %798, i32 %1123, i32 0
  %1125 = lshr i32 %1122, %792
  %1126 = select i1 %794, i32 %1125, i32 0
  %1127 = or i32 %1124, %1126
  %1128 = add i32 %1120, %1122
  %1129 = xor i32 %1128, %1127
  %1130 = xor i32 %1104, %1098
  %1131 = xor i32 %1130, %811
  %1132 = add i32 %1129, %1131
  %1133 = add i32 %1132, %814
  %1134 = shl i32 %1133, %785
  %1135 = select i1 %787, i32 %1134, i32 0
  %1136 = lshr i32 %1133, %781
  %1137 = select i1 %783, i32 %1136, i32 0
  %1138 = add i32 %1128, %1098
  %1139 = or i32 %1135, %1137
  %1140 = add i32 %1138, %1133
  %1141 = xor i32 %1140, %1139
  %1142 = shl i32 %1141, %824
  %1143 = select i1 %826, i32 %1142, i32 0
  %1144 = lshr i32 %1141, %828
  %1145 = select i1 %830, i32 %1144, i32 0
  %1146 = or i32 %1143, %1145
  %1147 = add i32 %1140, %1141
  %1148 = xor i32 %1147, %1146
  %1149 = shl i32 %1148, %835
  %1150 = select i1 %837, i32 %1149, i32 0
  %1151 = lshr i32 %1148, %835
  %1152 = select i1 %837, i32 %1151, i32 0
  %1153 = add i32 %1147, %1148
  %1154 = or i32 %1150, %1152
  %1155 = xor i32 %1153, %1154
  %1156 = shl i32 %1155, %844
  %1157 = select i1 %846, i32 %1156, i32 0
  %1158 = lshr i32 %1155, %848
  %1159 = select i1 %850, i32 %1158, i32 0
  %1160 = or i32 %1157, %1159
  %1161 = add i32 %1153, %1155
  %1162 = xor i32 %1161, %1160
  %1163 = add i32 %1162, %1104
  %1164 = add i32 %1163, %856
  %1165 = shl i32 %1164, %767
  %1166 = select i1 %769, i32 %1165, i32 0
  %1167 = lshr i32 %1164, %771
  %1168 = select i1 %773, i32 %1167, i32 0
  %1169 = add i32 %1161, %1131
  %1170 = or i32 %1166, %1168
  %1171 = add i32 %1169, %1164
  %1172 = xor i32 %1171, %1170
  %1173 = shl i32 %1172, %781
  %1174 = select i1 %783, i32 %1173, i32 0
  %1175 = lshr i32 %1172, %785
  %1176 = select i1 %787, i32 %1175, i32 0
  %1177 = or i32 %1174, %1176
  %1178 = add i32 %1171, %1172
  %1179 = xor i32 %1178, %1177
  %1180 = shl i32 %1179, %792
  %1181 = select i1 %794, i32 %1180, i32 0
  %1182 = lshr i32 %1179, %796
  %1183 = select i1 %798, i32 %1182, i32 0
  %1184 = add i32 %1178, %1179
  %1185 = or i32 %1181, %1183
  %1186 = xor i32 %1184, %1185
  %1187 = shl i32 %1186, %796
  %1188 = select i1 %798, i32 %1187, i32 0
  %1189 = lshr i32 %1186, %792
  %1190 = select i1 %794, i32 %1189, i32 0
  %1191 = or i32 %1188, %1190
  %1192 = add i32 %1184, %1186
  %1193 = xor i32 %1192, %1191
  %1194 = add i32 %1193, %1098
  %1195 = add i32 %1194, %828
  %1196 = shl i32 %1195, %785
  %1197 = select i1 %787, i32 %1196, i32 0
  %1198 = lshr i32 %1195, %781
  %1199 = select i1 %783, i32 %1198, i32 0
  %1200 = add i32 %1192, %1104
  %1201 = or i32 %1197, %1199
  %1202 = add i32 %1200, %1195
  %1203 = xor i32 %1202, %1201
  %1204 = shl i32 %1203, %824
  %1205 = select i1 %826, i32 %1204, i32 0
  %1206 = lshr i32 %1203, %828
  %1207 = select i1 %830, i32 %1206, i32 0
  %1208 = or i32 %1205, %1207
  %1209 = add i32 %1202, %1203
  %1210 = xor i32 %1209, %1208
  %1211 = shl i32 %1210, %835
  %1212 = select i1 %837, i32 %1211, i32 0
  %1213 = lshr i32 %1210, %835
  %1214 = select i1 %837, i32 %1213, i32 0
  %1215 = add i32 %1209, %1210
  %1216 = or i32 %1212, %1214
  %1217 = xor i32 %1215, %1216
  %1218 = shl i32 %1217, %844
  %1219 = select i1 %846, i32 %1218, i32 0
  %1220 = lshr i32 %1217, %848
  %1221 = select i1 %850, i32 %1220, i32 0
  %1222 = or i32 %1219, %1221
  %1223 = add i32 %1215, %1217
  %1224 = xor i32 %1223, %1222
  %1225 = add i32 %1224, %1131
  %1226 = add i32 %1225, %919
  %1227 = shl i32 %1226, %767
  %1228 = select i1 %769, i32 %1227, i32 0
  %1229 = lshr i32 %1226, %771
  %1230 = select i1 %773, i32 %1229, i32 0
  %1231 = add i32 %1223, %1098
  %1232 = or i32 %1228, %1230
  %1233 = add i32 %1231, %1226
  %1234 = xor i32 %1233, %1232
  %1235 = shl i32 %1234, %781
  %1236 = select i1 %783, i32 %1235, i32 0
  %1237 = lshr i32 %1234, %785
  %1238 = select i1 %787, i32 %1237, i32 0
  %1239 = or i32 %1236, %1238
  %1240 = add i32 %1233, %1234
  %1241 = xor i32 %1240, %1239
  %1242 = shl i32 %1241, %792
  %1243 = select i1 %794, i32 %1242, i32 0
  %1244 = lshr i32 %1241, %796
  %1245 = select i1 %798, i32 %1244, i32 0
  %1246 = or i32 %1243, %1245
  %1247 = add i32 %1240, %1241
  %1248 = xor i32 %1247, %1246
  %1249 = shl i32 %1248, %796
  %1250 = select i1 %798, i32 %1249, i32 0
  %1251 = lshr i32 %1248, %792
  %1252 = select i1 %794, i32 %1251, i32 0
  %1253 = add i32 %1247, %1248
  %1254 = or i32 %1250, %1252
  %1255 = xor i32 %1253, %1254
  %1256 = add i32 %1255, %1104
  %1257 = call i32 @fused_add_slice_broadcast_3123_3_clone_1(ptr %0, i32 %12, i32 %15)
  %1258 = add i32 %1256, %1257
  %1259 = shl i32 %1095, %796
  %1260 = select i1 %798, i32 %1259, i32 0
  %1261 = lshr i32 %1095, %792
  %1262 = select i1 %794, i32 %1261, i32 0
  %1263 = or i32 %1260, %1262
  %1264 = xor i32 %1096, %1263
  %1265 = add i32 %1264, %951
  %1266 = add i32 %1265, %1257
  %1267 = shl i32 %942, %796
  %1268 = select i1 %798, i32 %1267, i32 0
  %1269 = lshr i32 %942, %792
  %1270 = select i1 %794, i32 %1269, i32 0
  %1271 = or i32 %1268, %1270
  %1272 = xor i32 %943, %1271
  %1273 = add i32 %1272, %776
  %1274 = add i32 %1273, %1257
  %1275 = add i32 %1253, %1131
  %1276 = mul i32 %10, 128
  %1277 = add i32 %1276, %11
  %1278 = getelementptr inbounds i32, ptr %1, i32 %1277
  store i32 %386, ptr %1278, align 4
  %1279 = getelementptr inbounds i32, ptr %2, i32 %1277
  store i32 %762, ptr %1279, align 4
  %1280 = getelementptr inbounds i32, ptr %3, i32 %1277
  store i32 %944, ptr %1280, align 4
  %1281 = getelementptr inbounds i32, ptr %4, i32 %1277
  store i32 %1097, ptr %1281, align 4
  %1282 = getelementptr inbounds i32, ptr %5, i32 %1277
  store i32 %1258, ptr %1282, align 4
  %1283 = getelementptr inbounds i32, ptr %6, i32 %1277
  store i32 %1266, ptr %1283, align 4
  %1284 = getelementptr inbounds i32, ptr %7, i32 %1277
  store i32 %1274, ptr %1284, align 4
  %1285 = getelementptr inbounds i32, ptr %8, i32 %1277
  store i32 %1275, ptr %1285, align 4
  ret void
}

define internal i32 @fused_add_slice_broadcast_3080_24(ptr noalias %0, i32 %1, i32 %2) {
  %4 = sext i32 %1 to i64
  %5 = lshr i64 %4, 32
  %6 = trunc i64 %5 to i32
  ret i32 %6
}

define internal i32 @fused_add_slice_broadcast_3131_25(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_174_3(ptr %0, i32 0, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_broadcast_3104_268_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 %1
}

define internal i32 @fused_add_slice_broadcast_3132_51(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_175_3(ptr %0, i32 0, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_broadcast_3106_208_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 13
}

define internal i32 @fused_add_slice_broadcast_3107_208_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 19
}

define internal i32 @fused_add_slice_broadcast_3108_474_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 15
}

define internal i32 @fused_add_slice_broadcast_3110_474_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 17
}

define internal i32 @fused_add_slice_broadcast_3111_324_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 26
}

define internal i32 @fused_add_slice_broadcast_3112_324_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 6
}

define internal i32 @fused_add_slice_broadcast_3133_23(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_174_3(ptr %0, i32 0, i32 %2)
  %5 = call i32 @fused_add_slice_slice_175_3(ptr %0, i32 0, i32 %2)
  %6 = xor i32 %4, %5
  %7 = call i32 @fused_add_slice_broadcast_3185_9(ptr %0, i32 0, i32 %2)
  %8 = xor i32 %6, %7
  ret i32 %8
}

define internal i32 @fused_add_slice_broadcast_3115_18_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 1
}

define internal i32 @fused_add_slice_broadcast_3116_266_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 29
}

define internal i32 @fused_add_slice_broadcast_3117_284_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 3
}

define internal i32 @fused_add_slice_broadcast_3118_532_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 16
}

define internal i32 @fused_add_slice_broadcast_3119_134_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 24
}

define internal i32 @fused_add_slice_broadcast_3120_134_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 8
}

define internal i32 @fused_add_slice_broadcast_3121_44_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 2
}

define internal i32 @fused_add_slice_broadcast_3122_20_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 4
}

define internal i32 @fused_add_slice_broadcast_3123_3_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 5
}

define internal i32 @fused_add_slice_broadcast_3134_23_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_180_3_clone_1(ptr %0, i32 0, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_broadcast_3135_41_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_181_3_clone_1(ptr %0, i32 0, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_broadcast_3136_23_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_180_3_clone_1(ptr %0, i32 0, i32 %2)
  %5 = call i32 @fused_add_slice_slice_181_3_clone_1(ptr %0, i32 0, i32 %2)
  %6 = xor i32 %4, %5
  %7 = call i32 @fused_add_slice_broadcast_3185_9(ptr %0, i32 0, i32 %2)
  %8 = xor i32 %6, %7
  ret i32 %8
}

define internal i32 @fused_add_slice_bitcast_17_26_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 2
  %5 = add i32 %4, %2
  %6 = getelementptr inbounds i32, ptr %0, i32 %5
  %7 = load i32, ptr %6, align 4, !invariant.load !3
  ret i32 %7
}

define internal i32 @fused_add_slice_broadcast_1685_97_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 466688986
}

define internal i32 @fused_add_slice_bitcast_103_26_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 2
  %5 = add i32 %4, %2
  %6 = add i32 %5, 9216
  %7 = getelementptr inbounds i32, ptr %0, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  ret i32 %8
}

define internal i32 @fused_add_slice_bitcast_5_30_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 2
  %5 = add i32 %4, %2
  %6 = add i32 %5, 15360
  %7 = getelementptr inbounds i32, ptr %0, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  ret i32 %8
}

define internal i32 @fused_add_slice_slice_180_3_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_bitcast_2026_6_clone_1(ptr %0, i32 %1, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_slice_181_3_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_bitcast_2026_6_clone_1(ptr %0, i32 1, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_broadcast_3185_9(ptr noalias %0, i32 %1, i32 %2) {
  ret i32 466688986
}

define internal i32 @fused_add_slice_bitcast_2026_6_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_concatenate_138_15(ptr %0, i32 %1, i32 1, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_concatenate_138_15(ptr noalias %0, i32 %1, i32 %2, i32 %3) {
  %5 = icmp ult i32 %1, 1
  br i1 %5, label %6, label %186

6:                                                ; preds = %4
  %7 = call i32 @fused_add_slice_broadcast_3080_24(ptr %0, i32 %2, i32 %3)
  %8 = call i32 @fused_add_slice_broadcast_3128_35_clone_1(ptr %0, i32 %2, i32 %3)
  %9 = add i32 %7, %8
  %10 = call i32 @fused_add_slice_broadcast_3104_268_clone_1(ptr %0, i32 %2, i32 %3)
  %11 = call i32 @fused_add_slice_broadcast_3129_69_clone_1(ptr %0, i32 %2, i32 %3)
  %12 = add i32 %10, %11
  %13 = add i32 %9, %12
  %14 = call i32 @fused_add_slice_broadcast_3106_208_clone_1(ptr %0, i32 %2, i32 %3)
  %15 = shl i32 %12, %14
  %16 = icmp ult i32 %14, 32
  %17 = select i1 %16, i32 %15, i32 0
  %18 = call i32 @fused_add_slice_broadcast_3107_208_clone_1(ptr %0, i32 %2, i32 %3)
  %19 = lshr i32 %12, %18
  %20 = icmp ult i32 %18, 32
  %21 = select i1 %20, i32 %19, i32 0
  %22 = or i32 %17, %21
  %23 = xor i32 %13, %22
  %24 = add i32 %13, %23
  %25 = call i32 @fused_add_slice_broadcast_3108_474_clone_1(ptr %0, i32 %2, i32 %3)
  %26 = shl i32 %23, %25
  %27 = icmp ult i32 %25, 32
  %28 = select i1 %27, i32 %26, i32 0
  %29 = call i32 @fused_add_slice_broadcast_3110_474_clone_1(ptr %0, i32 %2, i32 %3)
  %30 = lshr i32 %23, %29
  %31 = icmp ult i32 %29, 32
  %32 = select i1 %31, i32 %30, i32 0
  %33 = or i32 %28, %32
  %34 = xor i32 %24, %33
  %35 = add i32 %24, %34
  %36 = call i32 @fused_add_slice_broadcast_3111_324_clone_1(ptr %0, i32 %2, i32 %3)
  %37 = shl i32 %34, %36
  %38 = icmp ult i32 %36, 32
  %39 = select i1 %38, i32 %37, i32 0
  %40 = call i32 @fused_add_slice_broadcast_3112_324_clone_1(ptr %0, i32 %2, i32 %3)
  %41 = lshr i32 %34, %40
  %42 = icmp ult i32 %40, 32
  %43 = select i1 %42, i32 %41, i32 0
  %44 = or i32 %39, %43
  %45 = xor i32 %35, %44
  %46 = add i32 %35, %45
  %47 = add i32 %46, %11
  %48 = shl i32 %45, %40
  %49 = select i1 %42, i32 %48, i32 0
  %50 = lshr i32 %45, %36
  %51 = select i1 %38, i32 %50, i32 0
  %52 = or i32 %49, %51
  %53 = xor i32 %46, %52
  %54 = call i32 @fused_add_slice_broadcast_3130_35_clone_1(ptr %0, i32 %2, i32 %3)
  %55 = add i32 %53, %54
  %56 = call i32 @fused_add_slice_broadcast_3115_18_clone_1(ptr %0, i32 %2, i32 %3)
  %57 = add i32 %55, %56
  %58 = add i32 %47, %57
  %59 = shl i32 %57, %29
  %60 = select i1 %31, i32 %59, i32 0
  %61 = lshr i32 %57, %25
  %62 = select i1 %27, i32 %61, i32 0
  %63 = or i32 %60, %62
  %64 = xor i32 %58, %63
  %65 = add i32 %58, %64
  %66 = call i32 @fused_add_slice_broadcast_3116_266_clone_1(ptr %0, i32 %2, i32 %3)
  %67 = shl i32 %64, %66
  %68 = icmp ult i32 %66, 32
  %69 = select i1 %68, i32 %67, i32 0
  %70 = call i32 @fused_add_slice_broadcast_3117_284_clone_1(ptr %0, i32 %2, i32 %3)
  %71 = lshr i32 %64, %70
  %72 = icmp ult i32 %70, 32
  %73 = select i1 %72, i32 %71, i32 0
  %74 = or i32 %69, %73
  %75 = xor i32 %65, %74
  %76 = add i32 %65, %75
  %77 = call i32 @fused_add_slice_broadcast_3118_532_clone_1(ptr %0, i32 %2, i32 %3)
  %78 = shl i32 %75, %77
  %79 = icmp ult i32 %77, 32
  %80 = select i1 %79, i32 %78, i32 0
  %81 = lshr i32 %75, %77
  %82 = select i1 %79, i32 %81, i32 0
  %83 = or i32 %80, %82
  %84 = xor i32 %76, %83
  %85 = add i32 %76, %84
  %86 = add i32 %85, %54
  %87 = call i32 @fused_add_slice_broadcast_3119_134_clone_1(ptr %0, i32 %2, i32 %3)
  %88 = shl i32 %84, %87
  %89 = icmp ult i32 %87, 32
  %90 = select i1 %89, i32 %88, i32 0
  %91 = call i32 @fused_add_slice_broadcast_3120_134_clone_1(ptr %0, i32 %2, i32 %3)
  %92 = lshr i32 %84, %91
  %93 = icmp ult i32 %91, 32
  %94 = select i1 %93, i32 %92, i32 0
  %95 = or i32 %90, %94
  %96 = xor i32 %85, %95
  %97 = add i32 %96, %8
  %98 = call i32 @fused_add_slice_broadcast_3121_44_clone_1(ptr %0, i32 %2, i32 %3)
  %99 = add i32 %97, %98
  %100 = add i32 %86, %99
  %101 = shl i32 %99, %14
  %102 = select i1 %16, i32 %101, i32 0
  %103 = lshr i32 %99, %18
  %104 = select i1 %20, i32 %103, i32 0
  %105 = or i32 %102, %104
  %106 = xor i32 %100, %105
  %107 = add i32 %100, %106
  %108 = shl i32 %106, %25
  %109 = select i1 %27, i32 %108, i32 0
  %110 = lshr i32 %106, %29
  %111 = select i1 %31, i32 %110, i32 0
  %112 = or i32 %109, %111
  %113 = xor i32 %107, %112
  %114 = add i32 %107, %113
  %115 = shl i32 %113, %36
  %116 = select i1 %38, i32 %115, i32 0
  %117 = lshr i32 %113, %40
  %118 = select i1 %42, i32 %117, i32 0
  %119 = or i32 %116, %118
  %120 = xor i32 %114, %119
  %121 = add i32 %114, %120
  %122 = add i32 %121, %8
  %123 = shl i32 %120, %40
  %124 = select i1 %42, i32 %123, i32 0
  %125 = lshr i32 %120, %36
  %126 = select i1 %38, i32 %125, i32 0
  %127 = or i32 %124, %126
  %128 = xor i32 %121, %127
  %129 = add i32 %128, %11
  %130 = add i32 %129, %70
  %131 = add i32 %122, %130
  %132 = shl i32 %130, %29
  %133 = select i1 %31, i32 %132, i32 0
  %134 = lshr i32 %130, %25
  %135 = select i1 %27, i32 %134, i32 0
  %136 = or i32 %133, %135
  %137 = xor i32 %131, %136
  %138 = add i32 %131, %137
  %139 = shl i32 %137, %66
  %140 = select i1 %68, i32 %139, i32 0
  %141 = lshr i32 %137, %70
  %142 = select i1 %72, i32 %141, i32 0
  %143 = or i32 %140, %142
  %144 = xor i32 %138, %143
  %145 = add i32 %138, %144
  %146 = shl i32 %144, %77
  %147 = select i1 %79, i32 %146, i32 0
  %148 = lshr i32 %144, %77
  %149 = select i1 %79, i32 %148, i32 0
  %150 = or i32 %147, %149
  %151 = xor i32 %145, %150
  %152 = add i32 %145, %151
  %153 = add i32 %152, %11
  %154 = shl i32 %151, %87
  %155 = select i1 %89, i32 %154, i32 0
  %156 = lshr i32 %151, %91
  %157 = select i1 %93, i32 %156, i32 0
  %158 = or i32 %155, %157
  %159 = xor i32 %152, %158
  %160 = add i32 %159, %54
  %161 = call i32 @fused_add_slice_broadcast_3122_20_clone_1(ptr %0, i32 %2, i32 %3)
  %162 = add i32 %160, %161
  %163 = add i32 %153, %162
  %164 = shl i32 %162, %14
  %165 = select i1 %16, i32 %164, i32 0
  %166 = lshr i32 %162, %18
  %167 = select i1 %20, i32 %166, i32 0
  %168 = or i32 %165, %167
  %169 = xor i32 %163, %168
  %170 = add i32 %163, %169
  %171 = shl i32 %169, %25
  %172 = select i1 %27, i32 %171, i32 0
  %173 = lshr i32 %169, %29
  %174 = select i1 %31, i32 %173, i32 0
  %175 = or i32 %172, %174
  %176 = xor i32 %170, %175
  %177 = add i32 %170, %176
  %178 = shl i32 %176, %36
  %179 = select i1 %38, i32 %178, i32 0
  %180 = lshr i32 %176, %40
  %181 = select i1 %42, i32 %180, i32 0
  %182 = or i32 %179, %181
  %183 = xor i32 %177, %182
  %184 = add i32 %177, %183
  %185 = add i32 %184, %54
  br label %374

186:                                              ; preds = %4
  %187 = call i32 @fused_add_slice_broadcast_3104_268_clone_1(ptr %0, i32 %2, i32 %3)
  %188 = call i32 @fused_add_slice_broadcast_3129_69_clone_1(ptr %0, i32 %2, i32 %3)
  %189 = add i32 %187, %188
  %190 = call i32 @fused_add_slice_broadcast_3106_208_clone_1(ptr %0, i32 %2, i32 %3)
  %191 = shl i32 %189, %190
  %192 = icmp ult i32 %190, 32
  %193 = select i1 %192, i32 %191, i32 0
  %194 = call i32 @fused_add_slice_broadcast_3107_208_clone_1(ptr %0, i32 %2, i32 %3)
  %195 = lshr i32 %189, %194
  %196 = icmp ult i32 %194, 32
  %197 = select i1 %196, i32 %195, i32 0
  %198 = or i32 %193, %197
  %199 = call i32 @fused_add_slice_broadcast_3080_24(ptr %0, i32 %2, i32 %3)
  %200 = call i32 @fused_add_slice_broadcast_3128_35_clone_1(ptr %0, i32 %2, i32 %3)
  %201 = add i32 %199, %200
  %202 = add i32 %201, %189
  %203 = xor i32 %202, %198
  %204 = call i32 @fused_add_slice_broadcast_3108_474_clone_1(ptr %0, i32 %2, i32 %3)
  %205 = shl i32 %203, %204
  %206 = icmp ult i32 %204, 32
  %207 = select i1 %206, i32 %205, i32 0
  %208 = call i32 @fused_add_slice_broadcast_3110_474_clone_1(ptr %0, i32 %2, i32 %3)
  %209 = lshr i32 %203, %208
  %210 = icmp ult i32 %208, 32
  %211 = select i1 %210, i32 %209, i32 0
  %212 = or i32 %207, %211
  %213 = add i32 %202, %203
  %214 = xor i32 %213, %212
  %215 = call i32 @fused_add_slice_broadcast_3111_324_clone_1(ptr %0, i32 %2, i32 %3)
  %216 = shl i32 %214, %215
  %217 = icmp ult i32 %215, 32
  %218 = select i1 %217, i32 %216, i32 0
  %219 = call i32 @fused_add_slice_broadcast_3112_324_clone_1(ptr %0, i32 %2, i32 %3)
  %220 = lshr i32 %214, %219
  %221 = icmp ult i32 %219, 32
  %222 = select i1 %221, i32 %220, i32 0
  %223 = or i32 %218, %222
  %224 = add i32 %213, %214
  %225 = xor i32 %224, %223
  %226 = shl i32 %225, %219
  %227 = select i1 %221, i32 %226, i32 0
  %228 = lshr i32 %225, %215
  %229 = select i1 %217, i32 %228, i32 0
  %230 = or i32 %227, %229
  %231 = add i32 %224, %225
  %232 = xor i32 %231, %230
  %233 = call i32 @fused_add_slice_broadcast_3130_35_clone_1(ptr %0, i32 %2, i32 %3)
  %234 = add i32 %232, %233
  %235 = call i32 @fused_add_slice_broadcast_3115_18_clone_1(ptr %0, i32 %2, i32 %3)
  %236 = add i32 %234, %235
  %237 = shl i32 %236, %208
  %238 = select i1 %210, i32 %237, i32 0
  %239 = lshr i32 %236, %204
  %240 = select i1 %206, i32 %239, i32 0
  %241 = or i32 %238, %240
  %242 = add i32 %231, %188
  %243 = add i32 %242, %236
  %244 = xor i32 %243, %241
  %245 = call i32 @fused_add_slice_broadcast_3116_266_clone_1(ptr %0, i32 %2, i32 %3)
  %246 = shl i32 %244, %245
  %247 = icmp ult i32 %245, 32
  %248 = select i1 %247, i32 %246, i32 0
  %249 = call i32 @fused_add_slice_broadcast_3117_284_clone_1(ptr %0, i32 %2, i32 %3)
  %250 = lshr i32 %244, %249
  %251 = icmp ult i32 %249, 32
  %252 = select i1 %251, i32 %250, i32 0
  %253 = or i32 %248, %252
  %254 = add i32 %243, %244
  %255 = xor i32 %254, %253
  %256 = call i32 @fused_add_slice_broadcast_3118_532_clone_1(ptr %0, i32 %2, i32 %3)
  %257 = shl i32 %255, %256
  %258 = icmp ult i32 %256, 32
  %259 = select i1 %258, i32 %257, i32 0
  %260 = lshr i32 %255, %256
  %261 = select i1 %258, i32 %260, i32 0
  %262 = or i32 %259, %261
  %263 = add i32 %254, %255
  %264 = xor i32 %263, %262
  %265 = call i32 @fused_add_slice_broadcast_3119_134_clone_1(ptr %0, i32 %2, i32 %3)
  %266 = shl i32 %264, %265
  %267 = icmp ult i32 %265, 32
  %268 = select i1 %267, i32 %266, i32 0
  %269 = call i32 @fused_add_slice_broadcast_3120_134_clone_1(ptr %0, i32 %2, i32 %3)
  %270 = lshr i32 %264, %269
  %271 = icmp ult i32 %269, 32
  %272 = select i1 %271, i32 %270, i32 0
  %273 = or i32 %268, %272
  %274 = add i32 %263, %264
  %275 = xor i32 %274, %273
  %276 = add i32 %275, %200
  %277 = call i32 @fused_add_slice_broadcast_3121_44_clone_1(ptr %0, i32 %2, i32 %3)
  %278 = add i32 %276, %277
  %279 = shl i32 %278, %190
  %280 = select i1 %192, i32 %279, i32 0
  %281 = lshr i32 %278, %194
  %282 = select i1 %196, i32 %281, i32 0
  %283 = or i32 %280, %282
  %284 = add i32 %274, %233
  %285 = add i32 %284, %278
  %286 = xor i32 %285, %283
  %287 = shl i32 %286, %204
  %288 = select i1 %206, i32 %287, i32 0
  %289 = lshr i32 %286, %208
  %290 = select i1 %210, i32 %289, i32 0
  %291 = or i32 %288, %290
  %292 = add i32 %285, %286
  %293 = xor i32 %292, %291
  %294 = shl i32 %293, %215
  %295 = select i1 %217, i32 %294, i32 0
  %296 = lshr i32 %293, %219
  %297 = select i1 %221, i32 %296, i32 0
  %298 = or i32 %295, %297
  %299 = add i32 %292, %293
  %300 = xor i32 %299, %298
  %301 = shl i32 %300, %219
  %302 = select i1 %221, i32 %301, i32 0
  %303 = lshr i32 %300, %215
  %304 = select i1 %217, i32 %303, i32 0
  %305 = or i32 %302, %304
  %306 = add i32 %299, %300
  %307 = xor i32 %306, %305
  %308 = add i32 %307, %188
  %309 = add i32 %308, %249
  %310 = shl i32 %309, %208
  %311 = select i1 %210, i32 %310, i32 0
  %312 = lshr i32 %309, %204
  %313 = select i1 %206, i32 %312, i32 0
  %314 = or i32 %311, %313
  %315 = add i32 %306, %200
  %316 = add i32 %315, %309
  %317 = xor i32 %316, %314
  %318 = shl i32 %317, %245
  %319 = select i1 %247, i32 %318, i32 0
  %320 = lshr i32 %317, %249
  %321 = select i1 %251, i32 %320, i32 0
  %322 = or i32 %319, %321
  %323 = add i32 %316, %317
  %324 = xor i32 %323, %322
  %325 = shl i32 %324, %256
  %326 = select i1 %258, i32 %325, i32 0
  %327 = lshr i32 %324, %256
  %328 = select i1 %258, i32 %327, i32 0
  %329 = or i32 %326, %328
  %330 = add i32 %323, %324
  %331 = xor i32 %330, %329
  %332 = shl i32 %331, %265
  %333 = select i1 %267, i32 %332, i32 0
  %334 = lshr i32 %331, %269
  %335 = select i1 %271, i32 %334, i32 0
  %336 = or i32 %333, %335
  %337 = add i32 %330, %331
  %338 = xor i32 %337, %336
  %339 = add i32 %338, %233
  %340 = call i32 @fused_add_slice_broadcast_3122_20_clone_1(ptr %0, i32 %2, i32 %3)
  %341 = add i32 %339, %340
  %342 = shl i32 %341, %190
  %343 = select i1 %192, i32 %342, i32 0
  %344 = lshr i32 %341, %194
  %345 = select i1 %196, i32 %344, i32 0
  %346 = or i32 %343, %345
  %347 = add i32 %337, %188
  %348 = add i32 %347, %341
  %349 = xor i32 %348, %346
  %350 = shl i32 %349, %204
  %351 = select i1 %206, i32 %350, i32 0
  %352 = lshr i32 %349, %208
  %353 = select i1 %210, i32 %352, i32 0
  %354 = or i32 %351, %353
  %355 = add i32 %348, %349
  %356 = xor i32 %355, %354
  %357 = shl i32 %356, %215
  %358 = select i1 %217, i32 %357, i32 0
  %359 = lshr i32 %356, %219
  %360 = select i1 %221, i32 %359, i32 0
  %361 = or i32 %358, %360
  %362 = add i32 %355, %356
  %363 = xor i32 %362, %361
  %364 = shl i32 %363, %219
  %365 = select i1 %221, i32 %364, i32 0
  %366 = lshr i32 %363, %215
  %367 = select i1 %217, i32 %366, i32 0
  %368 = or i32 %365, %367
  %369 = add i32 %362, %363
  %370 = xor i32 %369, %368
  %371 = add i32 %370, %200
  %372 = call i32 @fused_add_slice_broadcast_3123_3_clone_1(ptr %0, i32 %2, i32 %3)
  %373 = add i32 %371, %372
  br label %374

374:                                              ; preds = %6, %186
  %375 = phi i32 [ %373, %186 ], [ %185, %6 ]
  br label %376

376:                                              ; preds = %374
  ret i32 %375
}

define internal i32 @fused_add_slice_broadcast_3128_35_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_31_13_clone_1(ptr %0, i32 %2, i32 0)
  ret i32 %4
}

define internal i32 @fused_add_slice_broadcast_3129_69_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_32_13_clone_1(ptr %0, i32 %2, i32 0)
  ret i32 %4
}

define internal i32 @fused_add_slice_broadcast_3130_35_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_slice_31_13_clone_1(ptr %0, i32 %2, i32 0)
  %5 = call i32 @fused_add_slice_slice_32_13_clone_1(ptr %0, i32 %2, i32 0)
  %6 = xor i32 %4, %5
  %7 = call i32 @fused_add_slice_broadcast_1685_97_clone_1(ptr %0, i32 %2, i32 0)
  %8 = xor i32 %6, %7
  ret i32 %8
}

define internal i32 @fused_add_slice_slice_31_13_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_bitcast_36_26_clone_1(ptr %0, i32 %1, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_slice_32_13_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_bitcast_36_26_clone_1(ptr %0, i32 %1, i32 1)
  ret i32 %4
}

define internal i32 @fused_add_slice_bitcast_36_26_clone_1(ptr noalias %0, i32 %1, i32 %2) {
  %4 = mul i32 %1, 2
  %5 = add i32 %4, %2
  %6 = add i32 %5, 6144
  %7 = getelementptr inbounds i32, ptr %0, i32 %6
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  ret i32 %8
}

define internal i32 @fused_add_slice_slice_174_3(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_bitcast_1649_4(ptr %0, i32 %1, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_slice_175_3(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_bitcast_1649_4(ptr %0, i32 1, i32 %2)
  ret i32 %4
}

define internal i32 @fused_add_slice_bitcast_1649_4(ptr noalias %0, i32 %1, i32 %2) {
  %4 = call i32 @fused_add_slice_concatenate_138_15(ptr %0, i32 %1, i32 0, i32 %2)
  ret i32 %4
}

define ptx_kernel void @loop_xor_fusion_1(ptr noalias align 256 dereferenceable(12288) %0, ptr noalias align 256 dereferenceable(67584) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %3, 128
  %6 = add i32 %5, %4
  %7 = udiv i32 %6, 11
  %8 = urem i32 %6, 11
  %9 = sext i32 %8 to i64
  %10 = lshr i64 %9, 32
  %11 = trunc i64 %10 to i32
  %12 = add i32 %7, 1536
  %13 = getelementptr inbounds i32, ptr %0, i32 %12
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  %15 = add i32 %8, %14
  %16 = shl i32 %15, 13
  %17 = lshr i32 %15, 19
  %18 = getelementptr inbounds i32, ptr %0, i32 %7
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  %20 = add i32 %11, %19
  %21 = or i32 %16, %17
  %22 = add i32 %20, %15
  %23 = xor i32 %22, %21
  %24 = shl i32 %23, 15
  %25 = lshr i32 %23, 17
  %26 = or i32 %24, %25
  %27 = add i32 %22, %23
  %28 = xor i32 %27, %26
  %29 = shl i32 %28, 26
  %30 = lshr i32 %28, 6
  %31 = add i32 %27, %28
  %32 = or i32 %29, %30
  %33 = xor i32 %31, %32
  %34 = shl i32 %33, 6
  %35 = lshr i32 %33, 26
  %36 = or i32 %34, %35
  %37 = add i32 %31, %33
  %38 = xor i32 %37, %36
  %39 = xor i32 %19, %14
  %40 = xor i32 %39, 466688986
  %41 = add i32 %38, %40
  %42 = add i32 %41, 1
  %43 = shl i32 %42, 17
  %44 = lshr i32 %42, 15
  %45 = add i32 %37, %14
  %46 = or i32 %43, %44
  %47 = add i32 %45, %42
  %48 = xor i32 %47, %46
  %49 = shl i32 %48, 29
  %50 = lshr i32 %48, 3
  %51 = or i32 %49, %50
  %52 = add i32 %47, %48
  %53 = xor i32 %52, %51
  %54 = shl i32 %53, 16
  %55 = lshr i32 %53, 16
  %56 = add i32 %52, %53
  %57 = or i32 %54, %55
  %58 = xor i32 %56, %57
  %59 = shl i32 %58, 24
  %60 = lshr i32 %58, 8
  %61 = or i32 %59, %60
  %62 = add i32 %56, %58
  %63 = xor i32 %62, %61
  %64 = add i32 %63, %19
  %65 = add i32 %64, 2
  %66 = shl i32 %65, 13
  %67 = lshr i32 %65, 19
  %68 = add i32 %62, %40
  %69 = or i32 %66, %67
  %70 = add i32 %68, %65
  %71 = xor i32 %70, %69
  %72 = shl i32 %71, 15
  %73 = lshr i32 %71, 17
  %74 = or i32 %72, %73
  %75 = add i32 %70, %71
  %76 = xor i32 %75, %74
  %77 = shl i32 %76, 26
  %78 = lshr i32 %76, 6
  %79 = add i32 %75, %76
  %80 = or i32 %77, %78
  %81 = xor i32 %79, %80
  %82 = shl i32 %81, 6
  %83 = lshr i32 %81, 26
  %84 = or i32 %82, %83
  %85 = add i32 %79, %81
  %86 = xor i32 %85, %84
  %87 = add i32 %86, %14
  %88 = add i32 %87, 3
  %89 = shl i32 %88, 17
  %90 = lshr i32 %88, 15
  %91 = add i32 %85, %19
  %92 = or i32 %89, %90
  %93 = add i32 %91, %88
  %94 = xor i32 %93, %92
  %95 = shl i32 %94, 29
  %96 = lshr i32 %94, 3
  %97 = or i32 %95, %96
  %98 = add i32 %93, %94
  %99 = xor i32 %98, %97
  %100 = shl i32 %99, 16
  %101 = lshr i32 %99, 16
  %102 = add i32 %98, %99
  %103 = or i32 %100, %101
  %104 = xor i32 %102, %103
  %105 = shl i32 %104, 24
  %106 = lshr i32 %104, 8
  %107 = or i32 %105, %106
  %108 = add i32 %102, %104
  %109 = xor i32 %108, %107
  %110 = add i32 %109, %40
  %111 = add i32 %110, 4
  %112 = shl i32 %111, 13
  %113 = lshr i32 %111, 19
  %114 = add i32 %108, %14
  %115 = or i32 %112, %113
  %116 = add i32 %114, %111
  %117 = xor i32 %116, %115
  %118 = shl i32 %117, 15
  %119 = lshr i32 %117, 17
  %120 = or i32 %118, %119
  %121 = add i32 %116, %117
  %122 = xor i32 %121, %120
  %123 = shl i32 %122, 26
  %124 = lshr i32 %122, 6
  %125 = add i32 %121, %122
  %126 = or i32 %123, %124
  %127 = xor i32 %125, %126
  %128 = shl i32 %127, 6
  %129 = lshr i32 %127, 26
  %130 = or i32 %128, %129
  %131 = add i32 %125, %127
  %132 = xor i32 %131, %130
  %133 = add i32 %132, %19
  %134 = add i32 %131, %40
  %135 = add i32 %133, 5
  %136 = xor i32 %134, %135
  %137 = getelementptr inbounds i32, ptr %1, i32 %6
  store i32 %136, ptr %137, align 4
  ret void
}

define ptx_kernel void @wrapped_iota_1(ptr noalias align 256 dereferenceable(67584) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %2, 128
  %5 = add i32 %4, %3
  %6 = urem i32 %5, 11
  %7 = getelementptr inbounds i32, ptr %0, i32 %5
  store i32 %6, ptr %7, align 4
  ret void
}

define ptx_kernel void @sort_4_0(ptr noalias align 256 dereferenceable(67584) %arg0, ptr noalias align 256 dereferenceable(67584) %arg1, ptr noalias align 256 dereferenceable(67584) %arg2) #2 {
entry:
  %compare_return_buffer146 = alloca i8, align 1
  %compare_return_buffer140 = alloca i8, align 1
  %compare_return_buffer131 = alloca i8, align 1
  %compare_return_buffer125 = alloca i8, align 1
  %compare_return_buffer116 = alloca i8, align 1
  %compare_return_buffer110 = alloca i8, align 1
  %compare_return_buffer101 = alloca i8, align 1
  %compare_return_buffer95 = alloca i8, align 1
  %compare_return_buffer86 = alloca i8, align 1
  %compare_return_buffer80 = alloca i8, align 1
  %compare_return_buffer71 = alloca i8, align 1
  %compare_return_buffer65 = alloca i8, align 1
  %compare_return_buffer56 = alloca i8, align 1
  %compare_return_buffer50 = alloca i8, align 1
  %compare_return_buffer41 = alloca i8, align 1
  %compare_return_buffer35 = alloca i8, align 1
  %compare_return_buffer26 = alloca i8, align 1
  %compare_return_buffer20 = alloca i8, align 1
  %compare_return_buffer11 = alloca i8, align 1
  %compare_return_buffer = alloca i8, align 1
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %block_id = zext i32 %0 to i64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %thread_id_x = zext i32 %1 to i64
  %2 = mul nuw nsw i64 %block_id, 8
  %linear_index = add nuw nsw i64 %2, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 12288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %3 = udiv i64 %linear_index0, 1
  %4 = urem i64 %3, 8
  %5 = udiv i64 %linear_index0, 8
  %6 = icmp ult i64 %linear_index, 12288
  br i1 %6, label %sort.4.0.in_bounds-true, label %sort.4.0.in_bounds-after

sort.4.0.in_bounds-after:                         ; preds = %smaller_keys_index-after159, %entry
  ret void

sort.4.0.in_bounds-true:                          ; preds = %entry
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %thread.id.x = sext i32 %7 to i64
  %8 = shl i64 %4, 1
  %9 = icmp slt i64 %8, 11
  br i1 %9, label %smaller_keys_index-true, label %smaller_keys_index-after

smaller_keys_index-after:                         ; preds = %inner_smaller_keys_index-after, %sort.4.0.in_bounds-true
  %10 = shl i64 %4, 1
  %11 = icmp slt i64 %10, 11
  br i1 %11, label %smaller_keys_index-true1, label %smaller_keys_index-after2

smaller_keys_index-after2:                        ; preds = %inner_smaller_keys_index-after4, %smaller_keys_index-after
  %12 = shl i64 %4, 1
  %13 = icmp slt i64 %12, 11
  br i1 %13, label %smaller_keys_index-true5, label %smaller_keys_index-after6

smaller_keys_index-after6:                        ; preds = %inner_smaller_keys_index-after8, %smaller_keys_index-after2
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %14 = mul i64 %4, 2
  %15 = icmp uge i64 %14, 0
  br i1 %15, label %is_last_tile-true, label %is_last_tile-false

is_last_tile-after:                               ; preds = %smaller_comparison_index-after10, %smaller_comparison_index-after
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %16 = mul i64 %4, 2
  %17 = icmp uge i64 %16, 0
  br i1 %17, label %is_last_tile-true15, label %is_last_tile-false16

is_last_tile-after17:                             ; preds = %smaller_comparison_index-after25, %smaller_comparison_index-after19
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %18 = mul i64 %4, 2
  %19 = icmp uge i64 %18, 0
  br i1 %19, label %is_last_tile-true30, label %is_last_tile-false31

is_last_tile-after32:                             ; preds = %smaller_comparison_index-after40, %smaller_comparison_index-after34
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %20 = mul i64 %4, 2
  %21 = icmp uge i64 %20, 0
  br i1 %21, label %is_last_tile-true45, label %is_last_tile-false46

is_last_tile-after47:                             ; preds = %smaller_comparison_index-after55, %smaller_comparison_index-after49
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %22 = mul i64 %4, 2
  %23 = icmp uge i64 %22, 0
  br i1 %23, label %is_last_tile-true60, label %is_last_tile-false61

is_last_tile-after62:                             ; preds = %smaller_comparison_index-after70, %smaller_comparison_index-after64
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %24 = mul i64 %4, 2
  %25 = icmp uge i64 %24, 0
  br i1 %25, label %is_last_tile-true75, label %is_last_tile-false76

is_last_tile-after77:                             ; preds = %smaller_comparison_index-after85, %smaller_comparison_index-after79
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %26 = mul i64 %4, 2
  %27 = icmp uge i64 %26, 0
  br i1 %27, label %is_last_tile-true90, label %is_last_tile-false91

is_last_tile-after92:                             ; preds = %smaller_comparison_index-after100, %smaller_comparison_index-after94
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %28 = mul i64 %4, 2
  %29 = icmp uge i64 %28, 0
  br i1 %29, label %is_last_tile-true105, label %is_last_tile-false106

is_last_tile-after107:                            ; preds = %smaller_comparison_index-after115, %smaller_comparison_index-after109
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %30 = mul i64 %4, 2
  %31 = icmp uge i64 %30, 0
  br i1 %31, label %is_last_tile-true120, label %is_last_tile-false121

is_last_tile-after122:                            ; preds = %smaller_comparison_index-after130, %smaller_comparison_index-after124
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %32 = mul i64 %4, 2
  %33 = icmp uge i64 %32, 0
  br i1 %33, label %is_last_tile-true135, label %is_last_tile-false136

is_last_tile-after137:                            ; preds = %smaller_comparison_index-after145, %smaller_comparison_index-after139
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %34 = shl i64 %4, 1
  %35 = icmp slt i64 %34, 11
  br i1 %35, label %smaller_keys_index-true150, label %smaller_keys_index-after151

smaller_keys_index-after151:                      ; preds = %inner_smaller_keys_index-after153, %is_last_tile-after137
  %36 = shl i64 %4, 1
  %37 = icmp slt i64 %36, 11
  br i1 %37, label %smaller_keys_index-true154, label %smaller_keys_index-after155

smaller_keys_index-after155:                      ; preds = %inner_smaller_keys_index-after157, %smaller_keys_index-after151
  %38 = shl i64 %4, 1
  %39 = icmp slt i64 %38, 11
  br i1 %39, label %smaller_keys_index-true158, label %smaller_keys_index-after159

smaller_keys_index-after159:                      ; preds = %inner_smaller_keys_index-after161, %smaller_keys_index-after155
  br label %sort.4.0.in_bounds-after

smaller_keys_index-true:                          ; preds = %sort.4.0.in_bounds-true
  %40 = shl i64 %thread.id.x, 1
  %41 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %8
  %42 = load i32, ptr %41, align 4
  %43 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %40
  store i32 %42, ptr addrspace(3) %43, align 4
  %44 = add i64 %8, 1
  %45 = icmp slt i64 %44, 11
  br i1 %45, label %inner_smaller_keys_index-true, label %inner_smaller_keys_index-after

inner_smaller_keys_index-after:                   ; preds = %inner_smaller_keys_index-true, %smaller_keys_index-true
  br label %smaller_keys_index-after

inner_smaller_keys_index-true:                    ; preds = %smaller_keys_index-true
  %46 = add i64 %40, 1
  %47 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %44
  %48 = load i32, ptr %47, align 4
  %49 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %46
  store i32 %48, ptr addrspace(3) %49, align 4
  br label %inner_smaller_keys_index-after

smaller_keys_index-true1:                         ; preds = %smaller_keys_index-after
  %50 = shl i64 %thread.id.x, 1
  %51 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %10
  %52 = load i32, ptr %51, align 4
  %53 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %50
  store i32 %52, ptr addrspace(3) %53, align 4
  %54 = add i64 %10, 1
  %55 = icmp slt i64 %54, 11
  br i1 %55, label %inner_smaller_keys_index-true3, label %inner_smaller_keys_index-after4

inner_smaller_keys_index-after4:                  ; preds = %inner_smaller_keys_index-true3, %smaller_keys_index-true1
  br label %smaller_keys_index-after2

inner_smaller_keys_index-true3:                   ; preds = %smaller_keys_index-true1
  %56 = add i64 %50, 1
  %57 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %54
  %58 = load i32, ptr %57, align 4
  %59 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %56
  store i32 %58, ptr addrspace(3) %59, align 4
  br label %inner_smaller_keys_index-after4

smaller_keys_index-true5:                         ; preds = %smaller_keys_index-after2
  %60 = shl i64 %thread.id.x, 1
  %61 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %12
  %62 = load i32, ptr %61, align 4
  %63 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %60
  store i32 %62, ptr addrspace(3) %63, align 4
  %64 = add i64 %12, 1
  %65 = icmp slt i64 %64, 11
  br i1 %65, label %inner_smaller_keys_index-true7, label %inner_smaller_keys_index-after8

inner_smaller_keys_index-after8:                  ; preds = %inner_smaller_keys_index-true7, %smaller_keys_index-true5
  br label %smaller_keys_index-after6

inner_smaller_keys_index-true7:                   ; preds = %smaller_keys_index-true5
  %66 = add i64 %60, 1
  %67 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %64
  %68 = load i32, ptr %67, align 4
  %69 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %66
  store i32 %68, ptr addrspace(3) %69, align 4
  br label %inner_smaller_keys_index-after8

is_last_tile-true:                                ; preds = %smaller_keys_index-after6
  %70 = mul i64 %thread.id.x, 2
  %71 = xor i64 %70, 1
  %72 = icmp slt i64 %70, %71
  %73 = icmp slt i64 %71, 11
  %74 = and i1 %72, %73
  br i1 %74, label %smaller_comparison_index-true, label %smaller_comparison_index-after

smaller_comparison_index-after:                   ; preds = %is_smaller_than-after, %is_last_tile-true
  br label %is_last_tile-after

is_last_tile-false:                               ; preds = %smaller_keys_index-after6
  %75 = mul i64 %thread.id.x, 2
  %76 = xor i64 %75, 1
  %77 = icmp slt i64 %75, %76
  %78 = icmp slt i64 %76, 16
  br i1 true, label %smaller_comparison_index-true9, label %smaller_comparison_index-after10

smaller_comparison_index-after10:                 ; preds = %is_smaller_than-after14, %is_last_tile-false
  br label %is_last_tile-after

smaller_comparison_index-true:                    ; preds = %is_last_tile-true
  %79 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %71
  %80 = addrspacecast ptr addrspace(3) %79 to ptr
  %81 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %70
  %82 = addrspacecast ptr addrspace(3) %81 to ptr
  %83 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %71
  %84 = addrspacecast ptr addrspace(3) %83 to ptr
  %85 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %70
  %86 = addrspacecast ptr addrspace(3) %85 to ptr
  %87 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %71
  %88 = addrspacecast ptr addrspace(3) %87 to ptr
  %89 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %70
  %90 = addrspacecast ptr addrspace(3) %89 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %80, ptr %82, ptr %84, ptr %86, ptr %88, ptr %90, ptr %compare_return_buffer)
  %91 = load i8, ptr %compare_return_buffer, align 1
  %boolean_predicate = icmp ne i8 %91, 0
  br i1 %boolean_predicate, label %is_smaller_than-true, label %is_smaller_than-after

is_smaller_than-after:                            ; preds = %is_smaller_than-true, %smaller_comparison_index-true
  br label %smaller_comparison_index-after

is_smaller_than-true:                             ; preds = %smaller_comparison_index-true
  %92 = load i32, ptr %80, align 4
  %93 = load i32, ptr %82, align 4
  %94 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %70
  store i32 %92, ptr addrspace(3) %94, align 4
  %95 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %71
  store i32 %93, ptr addrspace(3) %95, align 4
  %96 = load i32, ptr %84, align 4
  %97 = load i32, ptr %86, align 4
  %98 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %70
  store i32 %96, ptr addrspace(3) %98, align 4
  %99 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %71
  store i32 %97, ptr addrspace(3) %99, align 4
  %100 = load i32, ptr %88, align 4
  %101 = load i32, ptr %90, align 4
  %102 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %70
  store i32 %100, ptr addrspace(3) %102, align 4
  %103 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %71
  store i32 %101, ptr addrspace(3) %103, align 4
  br label %is_smaller_than-after

smaller_comparison_index-true9:                   ; preds = %is_last_tile-false
  %104 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %76
  %105 = addrspacecast ptr addrspace(3) %104 to ptr
  %106 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %75
  %107 = addrspacecast ptr addrspace(3) %106 to ptr
  %108 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %76
  %109 = addrspacecast ptr addrspace(3) %108 to ptr
  %110 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %75
  %111 = addrspacecast ptr addrspace(3) %110 to ptr
  %112 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %76
  %113 = addrspacecast ptr addrspace(3) %112 to ptr
  %114 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %75
  %115 = addrspacecast ptr addrspace(3) %114 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %105, ptr %107, ptr %109, ptr %111, ptr %113, ptr %115, ptr %compare_return_buffer11)
  %116 = load i8, ptr %compare_return_buffer11, align 1
  %boolean_predicate12 = icmp ne i8 %116, 0
  br i1 %boolean_predicate12, label %is_smaller_than-true13, label %is_smaller_than-after14

is_smaller_than-after14:                          ; preds = %is_smaller_than-true13, %smaller_comparison_index-true9
  br label %smaller_comparison_index-after10

is_smaller_than-true13:                           ; preds = %smaller_comparison_index-true9
  %117 = load i32, ptr %105, align 4
  %118 = load i32, ptr %107, align 4
  %119 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %75
  store i32 %117, ptr addrspace(3) %119, align 4
  %120 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %76
  store i32 %118, ptr addrspace(3) %120, align 4
  %121 = load i32, ptr %109, align 4
  %122 = load i32, ptr %111, align 4
  %123 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %75
  store i32 %121, ptr addrspace(3) %123, align 4
  %124 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %76
  store i32 %122, ptr addrspace(3) %124, align 4
  %125 = load i32, ptr %113, align 4
  %126 = load i32, ptr %115, align 4
  %127 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %75
  store i32 %125, ptr addrspace(3) %127, align 4
  %128 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %76
  store i32 %126, ptr addrspace(3) %128, align 4
  br label %is_smaller_than-after14

is_last_tile-true15:                              ; preds = %is_last_tile-after
  %129 = udiv i64 %thread.id.x, 2
  %130 = urem i64 %thread.id.x, 2
  %131 = mul i64 %129, 4
  %132 = add i64 %131, %130
  %133 = xor i64 %132, 3
  %134 = icmp slt i64 %132, %133
  %135 = icmp slt i64 %133, 11
  %136 = and i1 %134, %135
  br i1 %136, label %smaller_comparison_index-true18, label %smaller_comparison_index-after19

smaller_comparison_index-after19:                 ; preds = %is_smaller_than-after23, %is_last_tile-true15
  br label %is_last_tile-after17

is_last_tile-false16:                             ; preds = %is_last_tile-after
  %137 = udiv i64 %thread.id.x, 2
  %138 = urem i64 %thread.id.x, 2
  %139 = mul i64 %137, 4
  %140 = add i64 %139, %138
  %141 = xor i64 %140, 3
  %142 = icmp slt i64 %140, %141
  %143 = icmp slt i64 %141, 16
  br i1 true, label %smaller_comparison_index-true24, label %smaller_comparison_index-after25

smaller_comparison_index-after25:                 ; preds = %is_smaller_than-after29, %is_last_tile-false16
  br label %is_last_tile-after17

smaller_comparison_index-true18:                  ; preds = %is_last_tile-true15
  %144 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %133
  %145 = addrspacecast ptr addrspace(3) %144 to ptr
  %146 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %132
  %147 = addrspacecast ptr addrspace(3) %146 to ptr
  %148 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %133
  %149 = addrspacecast ptr addrspace(3) %148 to ptr
  %150 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %132
  %151 = addrspacecast ptr addrspace(3) %150 to ptr
  %152 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %133
  %153 = addrspacecast ptr addrspace(3) %152 to ptr
  %154 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %132
  %155 = addrspacecast ptr addrspace(3) %154 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %145, ptr %147, ptr %149, ptr %151, ptr %153, ptr %155, ptr %compare_return_buffer20)
  %156 = load i8, ptr %compare_return_buffer20, align 1
  %boolean_predicate21 = icmp ne i8 %156, 0
  br i1 %boolean_predicate21, label %is_smaller_than-true22, label %is_smaller_than-after23

is_smaller_than-after23:                          ; preds = %is_smaller_than-true22, %smaller_comparison_index-true18
  br label %smaller_comparison_index-after19

is_smaller_than-true22:                           ; preds = %smaller_comparison_index-true18
  %157 = load i32, ptr %145, align 4
  %158 = load i32, ptr %147, align 4
  %159 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %132
  store i32 %157, ptr addrspace(3) %159, align 4
  %160 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %133
  store i32 %158, ptr addrspace(3) %160, align 4
  %161 = load i32, ptr %149, align 4
  %162 = load i32, ptr %151, align 4
  %163 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %132
  store i32 %161, ptr addrspace(3) %163, align 4
  %164 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %133
  store i32 %162, ptr addrspace(3) %164, align 4
  %165 = load i32, ptr %153, align 4
  %166 = load i32, ptr %155, align 4
  %167 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %132
  store i32 %165, ptr addrspace(3) %167, align 4
  %168 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %133
  store i32 %166, ptr addrspace(3) %168, align 4
  br label %is_smaller_than-after23

smaller_comparison_index-true24:                  ; preds = %is_last_tile-false16
  %169 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %141
  %170 = addrspacecast ptr addrspace(3) %169 to ptr
  %171 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %140
  %172 = addrspacecast ptr addrspace(3) %171 to ptr
  %173 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %141
  %174 = addrspacecast ptr addrspace(3) %173 to ptr
  %175 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %140
  %176 = addrspacecast ptr addrspace(3) %175 to ptr
  %177 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %141
  %178 = addrspacecast ptr addrspace(3) %177 to ptr
  %179 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %140
  %180 = addrspacecast ptr addrspace(3) %179 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %170, ptr %172, ptr %174, ptr %176, ptr %178, ptr %180, ptr %compare_return_buffer26)
  %181 = load i8, ptr %compare_return_buffer26, align 1
  %boolean_predicate27 = icmp ne i8 %181, 0
  br i1 %boolean_predicate27, label %is_smaller_than-true28, label %is_smaller_than-after29

is_smaller_than-after29:                          ; preds = %is_smaller_than-true28, %smaller_comparison_index-true24
  br label %smaller_comparison_index-after25

is_smaller_than-true28:                           ; preds = %smaller_comparison_index-true24
  %182 = load i32, ptr %170, align 4
  %183 = load i32, ptr %172, align 4
  %184 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %140
  store i32 %182, ptr addrspace(3) %184, align 4
  %185 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %141
  store i32 %183, ptr addrspace(3) %185, align 4
  %186 = load i32, ptr %174, align 4
  %187 = load i32, ptr %176, align 4
  %188 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %140
  store i32 %186, ptr addrspace(3) %188, align 4
  %189 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %141
  store i32 %187, ptr addrspace(3) %189, align 4
  %190 = load i32, ptr %178, align 4
  %191 = load i32, ptr %180, align 4
  %192 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %140
  store i32 %190, ptr addrspace(3) %192, align 4
  %193 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %141
  store i32 %191, ptr addrspace(3) %193, align 4
  br label %is_smaller_than-after29

is_last_tile-true30:                              ; preds = %is_last_tile-after17
  %194 = mul i64 %thread.id.x, 2
  %195 = xor i64 %194, 1
  %196 = icmp slt i64 %194, %195
  %197 = icmp slt i64 %195, 11
  %198 = and i1 %196, %197
  br i1 %198, label %smaller_comparison_index-true33, label %smaller_comparison_index-after34

smaller_comparison_index-after34:                 ; preds = %is_smaller_than-after38, %is_last_tile-true30
  br label %is_last_tile-after32

is_last_tile-false31:                             ; preds = %is_last_tile-after17
  %199 = mul i64 %thread.id.x, 2
  %200 = xor i64 %199, 1
  %201 = icmp slt i64 %199, %200
  %202 = icmp slt i64 %200, 16
  br i1 true, label %smaller_comparison_index-true39, label %smaller_comparison_index-after40

smaller_comparison_index-after40:                 ; preds = %is_smaller_than-after44, %is_last_tile-false31
  br label %is_last_tile-after32

smaller_comparison_index-true33:                  ; preds = %is_last_tile-true30
  %203 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %195
  %204 = addrspacecast ptr addrspace(3) %203 to ptr
  %205 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %194
  %206 = addrspacecast ptr addrspace(3) %205 to ptr
  %207 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %195
  %208 = addrspacecast ptr addrspace(3) %207 to ptr
  %209 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %194
  %210 = addrspacecast ptr addrspace(3) %209 to ptr
  %211 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %195
  %212 = addrspacecast ptr addrspace(3) %211 to ptr
  %213 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %194
  %214 = addrspacecast ptr addrspace(3) %213 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %204, ptr %206, ptr %208, ptr %210, ptr %212, ptr %214, ptr %compare_return_buffer35)
  %215 = load i8, ptr %compare_return_buffer35, align 1
  %boolean_predicate36 = icmp ne i8 %215, 0
  br i1 %boolean_predicate36, label %is_smaller_than-true37, label %is_smaller_than-after38

is_smaller_than-after38:                          ; preds = %is_smaller_than-true37, %smaller_comparison_index-true33
  br label %smaller_comparison_index-after34

is_smaller_than-true37:                           ; preds = %smaller_comparison_index-true33
  %216 = load i32, ptr %204, align 4
  %217 = load i32, ptr %206, align 4
  %218 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %194
  store i32 %216, ptr addrspace(3) %218, align 4
  %219 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %195
  store i32 %217, ptr addrspace(3) %219, align 4
  %220 = load i32, ptr %208, align 4
  %221 = load i32, ptr %210, align 4
  %222 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %194
  store i32 %220, ptr addrspace(3) %222, align 4
  %223 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %195
  store i32 %221, ptr addrspace(3) %223, align 4
  %224 = load i32, ptr %212, align 4
  %225 = load i32, ptr %214, align 4
  %226 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %194
  store i32 %224, ptr addrspace(3) %226, align 4
  %227 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %195
  store i32 %225, ptr addrspace(3) %227, align 4
  br label %is_smaller_than-after38

smaller_comparison_index-true39:                  ; preds = %is_last_tile-false31
  %228 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %200
  %229 = addrspacecast ptr addrspace(3) %228 to ptr
  %230 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %199
  %231 = addrspacecast ptr addrspace(3) %230 to ptr
  %232 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %200
  %233 = addrspacecast ptr addrspace(3) %232 to ptr
  %234 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %199
  %235 = addrspacecast ptr addrspace(3) %234 to ptr
  %236 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %200
  %237 = addrspacecast ptr addrspace(3) %236 to ptr
  %238 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %199
  %239 = addrspacecast ptr addrspace(3) %238 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %229, ptr %231, ptr %233, ptr %235, ptr %237, ptr %239, ptr %compare_return_buffer41)
  %240 = load i8, ptr %compare_return_buffer41, align 1
  %boolean_predicate42 = icmp ne i8 %240, 0
  br i1 %boolean_predicate42, label %is_smaller_than-true43, label %is_smaller_than-after44

is_smaller_than-after44:                          ; preds = %is_smaller_than-true43, %smaller_comparison_index-true39
  br label %smaller_comparison_index-after40

is_smaller_than-true43:                           ; preds = %smaller_comparison_index-true39
  %241 = load i32, ptr %229, align 4
  %242 = load i32, ptr %231, align 4
  %243 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %199
  store i32 %241, ptr addrspace(3) %243, align 4
  %244 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %200
  store i32 %242, ptr addrspace(3) %244, align 4
  %245 = load i32, ptr %233, align 4
  %246 = load i32, ptr %235, align 4
  %247 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %199
  store i32 %245, ptr addrspace(3) %247, align 4
  %248 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %200
  store i32 %246, ptr addrspace(3) %248, align 4
  %249 = load i32, ptr %237, align 4
  %250 = load i32, ptr %239, align 4
  %251 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %199
  store i32 %249, ptr addrspace(3) %251, align 4
  %252 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %200
  store i32 %250, ptr addrspace(3) %252, align 4
  br label %is_smaller_than-after44

is_last_tile-true45:                              ; preds = %is_last_tile-after32
  %253 = udiv i64 %thread.id.x, 4
  %254 = urem i64 %thread.id.x, 4
  %255 = mul i64 %253, 8
  %256 = add i64 %255, %254
  %257 = xor i64 %256, 7
  %258 = icmp slt i64 %256, %257
  %259 = icmp slt i64 %257, 11
  %260 = and i1 %258, %259
  br i1 %260, label %smaller_comparison_index-true48, label %smaller_comparison_index-after49

smaller_comparison_index-after49:                 ; preds = %is_smaller_than-after53, %is_last_tile-true45
  br label %is_last_tile-after47

is_last_tile-false46:                             ; preds = %is_last_tile-after32
  %261 = udiv i64 %thread.id.x, 4
  %262 = urem i64 %thread.id.x, 4
  %263 = mul i64 %261, 8
  %264 = add i64 %263, %262
  %265 = xor i64 %264, 7
  %266 = icmp slt i64 %264, %265
  %267 = icmp slt i64 %265, 16
  br i1 true, label %smaller_comparison_index-true54, label %smaller_comparison_index-after55

smaller_comparison_index-after55:                 ; preds = %is_smaller_than-after59, %is_last_tile-false46
  br label %is_last_tile-after47

smaller_comparison_index-true48:                  ; preds = %is_last_tile-true45
  %268 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %257
  %269 = addrspacecast ptr addrspace(3) %268 to ptr
  %270 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %256
  %271 = addrspacecast ptr addrspace(3) %270 to ptr
  %272 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %257
  %273 = addrspacecast ptr addrspace(3) %272 to ptr
  %274 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %256
  %275 = addrspacecast ptr addrspace(3) %274 to ptr
  %276 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %257
  %277 = addrspacecast ptr addrspace(3) %276 to ptr
  %278 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %256
  %279 = addrspacecast ptr addrspace(3) %278 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %269, ptr %271, ptr %273, ptr %275, ptr %277, ptr %279, ptr %compare_return_buffer50)
  %280 = load i8, ptr %compare_return_buffer50, align 1
  %boolean_predicate51 = icmp ne i8 %280, 0
  br i1 %boolean_predicate51, label %is_smaller_than-true52, label %is_smaller_than-after53

is_smaller_than-after53:                          ; preds = %is_smaller_than-true52, %smaller_comparison_index-true48
  br label %smaller_comparison_index-after49

is_smaller_than-true52:                           ; preds = %smaller_comparison_index-true48
  %281 = load i32, ptr %269, align 4
  %282 = load i32, ptr %271, align 4
  %283 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %256
  store i32 %281, ptr addrspace(3) %283, align 4
  %284 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %257
  store i32 %282, ptr addrspace(3) %284, align 4
  %285 = load i32, ptr %273, align 4
  %286 = load i32, ptr %275, align 4
  %287 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %256
  store i32 %285, ptr addrspace(3) %287, align 4
  %288 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %257
  store i32 %286, ptr addrspace(3) %288, align 4
  %289 = load i32, ptr %277, align 4
  %290 = load i32, ptr %279, align 4
  %291 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %256
  store i32 %289, ptr addrspace(3) %291, align 4
  %292 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %257
  store i32 %290, ptr addrspace(3) %292, align 4
  br label %is_smaller_than-after53

smaller_comparison_index-true54:                  ; preds = %is_last_tile-false46
  %293 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %265
  %294 = addrspacecast ptr addrspace(3) %293 to ptr
  %295 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %264
  %296 = addrspacecast ptr addrspace(3) %295 to ptr
  %297 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %265
  %298 = addrspacecast ptr addrspace(3) %297 to ptr
  %299 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %264
  %300 = addrspacecast ptr addrspace(3) %299 to ptr
  %301 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %265
  %302 = addrspacecast ptr addrspace(3) %301 to ptr
  %303 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %264
  %304 = addrspacecast ptr addrspace(3) %303 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %294, ptr %296, ptr %298, ptr %300, ptr %302, ptr %304, ptr %compare_return_buffer56)
  %305 = load i8, ptr %compare_return_buffer56, align 1
  %boolean_predicate57 = icmp ne i8 %305, 0
  br i1 %boolean_predicate57, label %is_smaller_than-true58, label %is_smaller_than-after59

is_smaller_than-after59:                          ; preds = %is_smaller_than-true58, %smaller_comparison_index-true54
  br label %smaller_comparison_index-after55

is_smaller_than-true58:                           ; preds = %smaller_comparison_index-true54
  %306 = load i32, ptr %294, align 4
  %307 = load i32, ptr %296, align 4
  %308 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %264
  store i32 %306, ptr addrspace(3) %308, align 4
  %309 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %265
  store i32 %307, ptr addrspace(3) %309, align 4
  %310 = load i32, ptr %298, align 4
  %311 = load i32, ptr %300, align 4
  %312 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %264
  store i32 %310, ptr addrspace(3) %312, align 4
  %313 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %265
  store i32 %311, ptr addrspace(3) %313, align 4
  %314 = load i32, ptr %302, align 4
  %315 = load i32, ptr %304, align 4
  %316 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %264
  store i32 %314, ptr addrspace(3) %316, align 4
  %317 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %265
  store i32 %315, ptr addrspace(3) %317, align 4
  br label %is_smaller_than-after59

is_last_tile-true60:                              ; preds = %is_last_tile-after47
  %318 = udiv i64 %thread.id.x, 2
  %319 = urem i64 %thread.id.x, 2
  %320 = mul i64 %318, 4
  %321 = add i64 %320, %319
  %322 = xor i64 %321, 2
  %323 = icmp slt i64 %321, %322
  %324 = icmp slt i64 %322, 11
  %325 = and i1 %323, %324
  br i1 %325, label %smaller_comparison_index-true63, label %smaller_comparison_index-after64

smaller_comparison_index-after64:                 ; preds = %is_smaller_than-after68, %is_last_tile-true60
  br label %is_last_tile-after62

is_last_tile-false61:                             ; preds = %is_last_tile-after47
  %326 = udiv i64 %thread.id.x, 2
  %327 = urem i64 %thread.id.x, 2
  %328 = mul i64 %326, 4
  %329 = add i64 %328, %327
  %330 = xor i64 %329, 2
  %331 = icmp slt i64 %329, %330
  %332 = icmp slt i64 %330, 16
  br i1 true, label %smaller_comparison_index-true69, label %smaller_comparison_index-after70

smaller_comparison_index-after70:                 ; preds = %is_smaller_than-after74, %is_last_tile-false61
  br label %is_last_tile-after62

smaller_comparison_index-true63:                  ; preds = %is_last_tile-true60
  %333 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %322
  %334 = addrspacecast ptr addrspace(3) %333 to ptr
  %335 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %321
  %336 = addrspacecast ptr addrspace(3) %335 to ptr
  %337 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %322
  %338 = addrspacecast ptr addrspace(3) %337 to ptr
  %339 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %321
  %340 = addrspacecast ptr addrspace(3) %339 to ptr
  %341 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %322
  %342 = addrspacecast ptr addrspace(3) %341 to ptr
  %343 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %321
  %344 = addrspacecast ptr addrspace(3) %343 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %334, ptr %336, ptr %338, ptr %340, ptr %342, ptr %344, ptr %compare_return_buffer65)
  %345 = load i8, ptr %compare_return_buffer65, align 1
  %boolean_predicate66 = icmp ne i8 %345, 0
  br i1 %boolean_predicate66, label %is_smaller_than-true67, label %is_smaller_than-after68

is_smaller_than-after68:                          ; preds = %is_smaller_than-true67, %smaller_comparison_index-true63
  br label %smaller_comparison_index-after64

is_smaller_than-true67:                           ; preds = %smaller_comparison_index-true63
  %346 = load i32, ptr %334, align 4
  %347 = load i32, ptr %336, align 4
  %348 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %321
  store i32 %346, ptr addrspace(3) %348, align 4
  %349 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %322
  store i32 %347, ptr addrspace(3) %349, align 4
  %350 = load i32, ptr %338, align 4
  %351 = load i32, ptr %340, align 4
  %352 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %321
  store i32 %350, ptr addrspace(3) %352, align 4
  %353 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %322
  store i32 %351, ptr addrspace(3) %353, align 4
  %354 = load i32, ptr %342, align 4
  %355 = load i32, ptr %344, align 4
  %356 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %321
  store i32 %354, ptr addrspace(3) %356, align 4
  %357 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %322
  store i32 %355, ptr addrspace(3) %357, align 4
  br label %is_smaller_than-after68

smaller_comparison_index-true69:                  ; preds = %is_last_tile-false61
  %358 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %330
  %359 = addrspacecast ptr addrspace(3) %358 to ptr
  %360 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %329
  %361 = addrspacecast ptr addrspace(3) %360 to ptr
  %362 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %330
  %363 = addrspacecast ptr addrspace(3) %362 to ptr
  %364 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %329
  %365 = addrspacecast ptr addrspace(3) %364 to ptr
  %366 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %330
  %367 = addrspacecast ptr addrspace(3) %366 to ptr
  %368 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %329
  %369 = addrspacecast ptr addrspace(3) %368 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %359, ptr %361, ptr %363, ptr %365, ptr %367, ptr %369, ptr %compare_return_buffer71)
  %370 = load i8, ptr %compare_return_buffer71, align 1
  %boolean_predicate72 = icmp ne i8 %370, 0
  br i1 %boolean_predicate72, label %is_smaller_than-true73, label %is_smaller_than-after74

is_smaller_than-after74:                          ; preds = %is_smaller_than-true73, %smaller_comparison_index-true69
  br label %smaller_comparison_index-after70

is_smaller_than-true73:                           ; preds = %smaller_comparison_index-true69
  %371 = load i32, ptr %359, align 4
  %372 = load i32, ptr %361, align 4
  %373 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %329
  store i32 %371, ptr addrspace(3) %373, align 4
  %374 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %330
  store i32 %372, ptr addrspace(3) %374, align 4
  %375 = load i32, ptr %363, align 4
  %376 = load i32, ptr %365, align 4
  %377 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %329
  store i32 %375, ptr addrspace(3) %377, align 4
  %378 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %330
  store i32 %376, ptr addrspace(3) %378, align 4
  %379 = load i32, ptr %367, align 4
  %380 = load i32, ptr %369, align 4
  %381 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %329
  store i32 %379, ptr addrspace(3) %381, align 4
  %382 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %330
  store i32 %380, ptr addrspace(3) %382, align 4
  br label %is_smaller_than-after74

is_last_tile-true75:                              ; preds = %is_last_tile-after62
  %383 = mul i64 %thread.id.x, 2
  %384 = xor i64 %383, 1
  %385 = icmp slt i64 %383, %384
  %386 = icmp slt i64 %384, 11
  %387 = and i1 %385, %386
  br i1 %387, label %smaller_comparison_index-true78, label %smaller_comparison_index-after79

smaller_comparison_index-after79:                 ; preds = %is_smaller_than-after83, %is_last_tile-true75
  br label %is_last_tile-after77

is_last_tile-false76:                             ; preds = %is_last_tile-after62
  %388 = mul i64 %thread.id.x, 2
  %389 = xor i64 %388, 1
  %390 = icmp slt i64 %388, %389
  %391 = icmp slt i64 %389, 16
  br i1 true, label %smaller_comparison_index-true84, label %smaller_comparison_index-after85

smaller_comparison_index-after85:                 ; preds = %is_smaller_than-after89, %is_last_tile-false76
  br label %is_last_tile-after77

smaller_comparison_index-true78:                  ; preds = %is_last_tile-true75
  %392 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %384
  %393 = addrspacecast ptr addrspace(3) %392 to ptr
  %394 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %383
  %395 = addrspacecast ptr addrspace(3) %394 to ptr
  %396 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %384
  %397 = addrspacecast ptr addrspace(3) %396 to ptr
  %398 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %383
  %399 = addrspacecast ptr addrspace(3) %398 to ptr
  %400 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %384
  %401 = addrspacecast ptr addrspace(3) %400 to ptr
  %402 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %383
  %403 = addrspacecast ptr addrspace(3) %402 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %393, ptr %395, ptr %397, ptr %399, ptr %401, ptr %403, ptr %compare_return_buffer80)
  %404 = load i8, ptr %compare_return_buffer80, align 1
  %boolean_predicate81 = icmp ne i8 %404, 0
  br i1 %boolean_predicate81, label %is_smaller_than-true82, label %is_smaller_than-after83

is_smaller_than-after83:                          ; preds = %is_smaller_than-true82, %smaller_comparison_index-true78
  br label %smaller_comparison_index-after79

is_smaller_than-true82:                           ; preds = %smaller_comparison_index-true78
  %405 = load i32, ptr %393, align 4
  %406 = load i32, ptr %395, align 4
  %407 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %383
  store i32 %405, ptr addrspace(3) %407, align 4
  %408 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %384
  store i32 %406, ptr addrspace(3) %408, align 4
  %409 = load i32, ptr %397, align 4
  %410 = load i32, ptr %399, align 4
  %411 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %383
  store i32 %409, ptr addrspace(3) %411, align 4
  %412 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %384
  store i32 %410, ptr addrspace(3) %412, align 4
  %413 = load i32, ptr %401, align 4
  %414 = load i32, ptr %403, align 4
  %415 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %383
  store i32 %413, ptr addrspace(3) %415, align 4
  %416 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %384
  store i32 %414, ptr addrspace(3) %416, align 4
  br label %is_smaller_than-after83

smaller_comparison_index-true84:                  ; preds = %is_last_tile-false76
  %417 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %389
  %418 = addrspacecast ptr addrspace(3) %417 to ptr
  %419 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %388
  %420 = addrspacecast ptr addrspace(3) %419 to ptr
  %421 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %389
  %422 = addrspacecast ptr addrspace(3) %421 to ptr
  %423 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %388
  %424 = addrspacecast ptr addrspace(3) %423 to ptr
  %425 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %389
  %426 = addrspacecast ptr addrspace(3) %425 to ptr
  %427 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %388
  %428 = addrspacecast ptr addrspace(3) %427 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %418, ptr %420, ptr %422, ptr %424, ptr %426, ptr %428, ptr %compare_return_buffer86)
  %429 = load i8, ptr %compare_return_buffer86, align 1
  %boolean_predicate87 = icmp ne i8 %429, 0
  br i1 %boolean_predicate87, label %is_smaller_than-true88, label %is_smaller_than-after89

is_smaller_than-after89:                          ; preds = %is_smaller_than-true88, %smaller_comparison_index-true84
  br label %smaller_comparison_index-after85

is_smaller_than-true88:                           ; preds = %smaller_comparison_index-true84
  %430 = load i32, ptr %418, align 4
  %431 = load i32, ptr %420, align 4
  %432 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %388
  store i32 %430, ptr addrspace(3) %432, align 4
  %433 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %389
  store i32 %431, ptr addrspace(3) %433, align 4
  %434 = load i32, ptr %422, align 4
  %435 = load i32, ptr %424, align 4
  %436 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %388
  store i32 %434, ptr addrspace(3) %436, align 4
  %437 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %389
  store i32 %435, ptr addrspace(3) %437, align 4
  %438 = load i32, ptr %426, align 4
  %439 = load i32, ptr %428, align 4
  %440 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %388
  store i32 %438, ptr addrspace(3) %440, align 4
  %441 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %389
  store i32 %439, ptr addrspace(3) %441, align 4
  br label %is_smaller_than-after89

is_last_tile-true90:                              ; preds = %is_last_tile-after77
  %442 = xor i64 %thread.id.x, 15
  %443 = icmp slt i64 %thread.id.x, %442
  %444 = icmp slt i64 %442, 11
  %445 = and i1 %443, %444
  br i1 %445, label %smaller_comparison_index-true93, label %smaller_comparison_index-after94

smaller_comparison_index-after94:                 ; preds = %is_smaller_than-after98, %is_last_tile-true90
  br label %is_last_tile-after92

is_last_tile-false91:                             ; preds = %is_last_tile-after77
  %446 = xor i64 %thread.id.x, 15
  %447 = icmp slt i64 %thread.id.x, %446
  %448 = icmp slt i64 %446, 16
  br i1 true, label %smaller_comparison_index-true99, label %smaller_comparison_index-after100

smaller_comparison_index-after100:                ; preds = %is_smaller_than-after104, %is_last_tile-false91
  br label %is_last_tile-after92

smaller_comparison_index-true93:                  ; preds = %is_last_tile-true90
  %449 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %442
  %450 = addrspacecast ptr addrspace(3) %449 to ptr
  %451 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %thread.id.x
  %452 = addrspacecast ptr addrspace(3) %451 to ptr
  %453 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %442
  %454 = addrspacecast ptr addrspace(3) %453 to ptr
  %455 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %thread.id.x
  %456 = addrspacecast ptr addrspace(3) %455 to ptr
  %457 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %442
  %458 = addrspacecast ptr addrspace(3) %457 to ptr
  %459 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %thread.id.x
  %460 = addrspacecast ptr addrspace(3) %459 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %450, ptr %452, ptr %454, ptr %456, ptr %458, ptr %460, ptr %compare_return_buffer95)
  %461 = load i8, ptr %compare_return_buffer95, align 1
  %boolean_predicate96 = icmp ne i8 %461, 0
  br i1 %boolean_predicate96, label %is_smaller_than-true97, label %is_smaller_than-after98

is_smaller_than-after98:                          ; preds = %is_smaller_than-true97, %smaller_comparison_index-true93
  br label %smaller_comparison_index-after94

is_smaller_than-true97:                           ; preds = %smaller_comparison_index-true93
  %462 = load i32, ptr %450, align 4
  %463 = load i32, ptr %452, align 4
  %464 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %thread.id.x
  store i32 %462, ptr addrspace(3) %464, align 4
  %465 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %442
  store i32 %463, ptr addrspace(3) %465, align 4
  %466 = load i32, ptr %454, align 4
  %467 = load i32, ptr %456, align 4
  %468 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %thread.id.x
  store i32 %466, ptr addrspace(3) %468, align 4
  %469 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %442
  store i32 %467, ptr addrspace(3) %469, align 4
  %470 = load i32, ptr %458, align 4
  %471 = load i32, ptr %460, align 4
  %472 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %thread.id.x
  store i32 %470, ptr addrspace(3) %472, align 4
  %473 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %442
  store i32 %471, ptr addrspace(3) %473, align 4
  br label %is_smaller_than-after98

smaller_comparison_index-true99:                  ; preds = %is_last_tile-false91
  %474 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %446
  %475 = addrspacecast ptr addrspace(3) %474 to ptr
  %476 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %thread.id.x
  %477 = addrspacecast ptr addrspace(3) %476 to ptr
  %478 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %446
  %479 = addrspacecast ptr addrspace(3) %478 to ptr
  %480 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %thread.id.x
  %481 = addrspacecast ptr addrspace(3) %480 to ptr
  %482 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %446
  %483 = addrspacecast ptr addrspace(3) %482 to ptr
  %484 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %thread.id.x
  %485 = addrspacecast ptr addrspace(3) %484 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %475, ptr %477, ptr %479, ptr %481, ptr %483, ptr %485, ptr %compare_return_buffer101)
  %486 = load i8, ptr %compare_return_buffer101, align 1
  %boolean_predicate102 = icmp ne i8 %486, 0
  br i1 %boolean_predicate102, label %is_smaller_than-true103, label %is_smaller_than-after104

is_smaller_than-after104:                         ; preds = %is_smaller_than-true103, %smaller_comparison_index-true99
  br label %smaller_comparison_index-after100

is_smaller_than-true103:                          ; preds = %smaller_comparison_index-true99
  %487 = load i32, ptr %475, align 4
  %488 = load i32, ptr %477, align 4
  %489 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %thread.id.x
  store i32 %487, ptr addrspace(3) %489, align 4
  %490 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %446
  store i32 %488, ptr addrspace(3) %490, align 4
  %491 = load i32, ptr %479, align 4
  %492 = load i32, ptr %481, align 4
  %493 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %thread.id.x
  store i32 %491, ptr addrspace(3) %493, align 4
  %494 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %446
  store i32 %492, ptr addrspace(3) %494, align 4
  %495 = load i32, ptr %483, align 4
  %496 = load i32, ptr %485, align 4
  %497 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %thread.id.x
  store i32 %495, ptr addrspace(3) %497, align 4
  %498 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %446
  store i32 %496, ptr addrspace(3) %498, align 4
  br label %is_smaller_than-after104

is_last_tile-true105:                             ; preds = %is_last_tile-after92
  %499 = udiv i64 %thread.id.x, 4
  %500 = urem i64 %thread.id.x, 4
  %501 = mul i64 %499, 8
  %502 = add i64 %501, %500
  %503 = xor i64 %502, 4
  %504 = icmp slt i64 %502, %503
  %505 = icmp slt i64 %503, 11
  %506 = and i1 %504, %505
  br i1 %506, label %smaller_comparison_index-true108, label %smaller_comparison_index-after109

smaller_comparison_index-after109:                ; preds = %is_smaller_than-after113, %is_last_tile-true105
  br label %is_last_tile-after107

is_last_tile-false106:                            ; preds = %is_last_tile-after92
  %507 = udiv i64 %thread.id.x, 4
  %508 = urem i64 %thread.id.x, 4
  %509 = mul i64 %507, 8
  %510 = add i64 %509, %508
  %511 = xor i64 %510, 4
  %512 = icmp slt i64 %510, %511
  %513 = icmp slt i64 %511, 16
  br i1 true, label %smaller_comparison_index-true114, label %smaller_comparison_index-after115

smaller_comparison_index-after115:                ; preds = %is_smaller_than-after119, %is_last_tile-false106
  br label %is_last_tile-after107

smaller_comparison_index-true108:                 ; preds = %is_last_tile-true105
  %514 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %503
  %515 = addrspacecast ptr addrspace(3) %514 to ptr
  %516 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %502
  %517 = addrspacecast ptr addrspace(3) %516 to ptr
  %518 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %503
  %519 = addrspacecast ptr addrspace(3) %518 to ptr
  %520 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %502
  %521 = addrspacecast ptr addrspace(3) %520 to ptr
  %522 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %503
  %523 = addrspacecast ptr addrspace(3) %522 to ptr
  %524 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %502
  %525 = addrspacecast ptr addrspace(3) %524 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %515, ptr %517, ptr %519, ptr %521, ptr %523, ptr %525, ptr %compare_return_buffer110)
  %526 = load i8, ptr %compare_return_buffer110, align 1
  %boolean_predicate111 = icmp ne i8 %526, 0
  br i1 %boolean_predicate111, label %is_smaller_than-true112, label %is_smaller_than-after113

is_smaller_than-after113:                         ; preds = %is_smaller_than-true112, %smaller_comparison_index-true108
  br label %smaller_comparison_index-after109

is_smaller_than-true112:                          ; preds = %smaller_comparison_index-true108
  %527 = load i32, ptr %515, align 4
  %528 = load i32, ptr %517, align 4
  %529 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %502
  store i32 %527, ptr addrspace(3) %529, align 4
  %530 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %503
  store i32 %528, ptr addrspace(3) %530, align 4
  %531 = load i32, ptr %519, align 4
  %532 = load i32, ptr %521, align 4
  %533 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %502
  store i32 %531, ptr addrspace(3) %533, align 4
  %534 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %503
  store i32 %532, ptr addrspace(3) %534, align 4
  %535 = load i32, ptr %523, align 4
  %536 = load i32, ptr %525, align 4
  %537 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %502
  store i32 %535, ptr addrspace(3) %537, align 4
  %538 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %503
  store i32 %536, ptr addrspace(3) %538, align 4
  br label %is_smaller_than-after113

smaller_comparison_index-true114:                 ; preds = %is_last_tile-false106
  %539 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %511
  %540 = addrspacecast ptr addrspace(3) %539 to ptr
  %541 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %510
  %542 = addrspacecast ptr addrspace(3) %541 to ptr
  %543 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %511
  %544 = addrspacecast ptr addrspace(3) %543 to ptr
  %545 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %510
  %546 = addrspacecast ptr addrspace(3) %545 to ptr
  %547 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %511
  %548 = addrspacecast ptr addrspace(3) %547 to ptr
  %549 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %510
  %550 = addrspacecast ptr addrspace(3) %549 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %540, ptr %542, ptr %544, ptr %546, ptr %548, ptr %550, ptr %compare_return_buffer116)
  %551 = load i8, ptr %compare_return_buffer116, align 1
  %boolean_predicate117 = icmp ne i8 %551, 0
  br i1 %boolean_predicate117, label %is_smaller_than-true118, label %is_smaller_than-after119

is_smaller_than-after119:                         ; preds = %is_smaller_than-true118, %smaller_comparison_index-true114
  br label %smaller_comparison_index-after115

is_smaller_than-true118:                          ; preds = %smaller_comparison_index-true114
  %552 = load i32, ptr %540, align 4
  %553 = load i32, ptr %542, align 4
  %554 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %510
  store i32 %552, ptr addrspace(3) %554, align 4
  %555 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %511
  store i32 %553, ptr addrspace(3) %555, align 4
  %556 = load i32, ptr %544, align 4
  %557 = load i32, ptr %546, align 4
  %558 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %510
  store i32 %556, ptr addrspace(3) %558, align 4
  %559 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %511
  store i32 %557, ptr addrspace(3) %559, align 4
  %560 = load i32, ptr %548, align 4
  %561 = load i32, ptr %550, align 4
  %562 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %510
  store i32 %560, ptr addrspace(3) %562, align 4
  %563 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %511
  store i32 %561, ptr addrspace(3) %563, align 4
  br label %is_smaller_than-after119

is_last_tile-true120:                             ; preds = %is_last_tile-after107
  %564 = udiv i64 %thread.id.x, 2
  %565 = urem i64 %thread.id.x, 2
  %566 = mul i64 %564, 4
  %567 = add i64 %566, %565
  %568 = xor i64 %567, 2
  %569 = icmp slt i64 %567, %568
  %570 = icmp slt i64 %568, 11
  %571 = and i1 %569, %570
  br i1 %571, label %smaller_comparison_index-true123, label %smaller_comparison_index-after124

smaller_comparison_index-after124:                ; preds = %is_smaller_than-after128, %is_last_tile-true120
  br label %is_last_tile-after122

is_last_tile-false121:                            ; preds = %is_last_tile-after107
  %572 = udiv i64 %thread.id.x, 2
  %573 = urem i64 %thread.id.x, 2
  %574 = mul i64 %572, 4
  %575 = add i64 %574, %573
  %576 = xor i64 %575, 2
  %577 = icmp slt i64 %575, %576
  %578 = icmp slt i64 %576, 16
  br i1 true, label %smaller_comparison_index-true129, label %smaller_comparison_index-after130

smaller_comparison_index-after130:                ; preds = %is_smaller_than-after134, %is_last_tile-false121
  br label %is_last_tile-after122

smaller_comparison_index-true123:                 ; preds = %is_last_tile-true120
  %579 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %568
  %580 = addrspacecast ptr addrspace(3) %579 to ptr
  %581 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %567
  %582 = addrspacecast ptr addrspace(3) %581 to ptr
  %583 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %568
  %584 = addrspacecast ptr addrspace(3) %583 to ptr
  %585 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %567
  %586 = addrspacecast ptr addrspace(3) %585 to ptr
  %587 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %568
  %588 = addrspacecast ptr addrspace(3) %587 to ptr
  %589 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %567
  %590 = addrspacecast ptr addrspace(3) %589 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %580, ptr %582, ptr %584, ptr %586, ptr %588, ptr %590, ptr %compare_return_buffer125)
  %591 = load i8, ptr %compare_return_buffer125, align 1
  %boolean_predicate126 = icmp ne i8 %591, 0
  br i1 %boolean_predicate126, label %is_smaller_than-true127, label %is_smaller_than-after128

is_smaller_than-after128:                         ; preds = %is_smaller_than-true127, %smaller_comparison_index-true123
  br label %smaller_comparison_index-after124

is_smaller_than-true127:                          ; preds = %smaller_comparison_index-true123
  %592 = load i32, ptr %580, align 4
  %593 = load i32, ptr %582, align 4
  %594 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %567
  store i32 %592, ptr addrspace(3) %594, align 4
  %595 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %568
  store i32 %593, ptr addrspace(3) %595, align 4
  %596 = load i32, ptr %584, align 4
  %597 = load i32, ptr %586, align 4
  %598 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %567
  store i32 %596, ptr addrspace(3) %598, align 4
  %599 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %568
  store i32 %597, ptr addrspace(3) %599, align 4
  %600 = load i32, ptr %588, align 4
  %601 = load i32, ptr %590, align 4
  %602 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %567
  store i32 %600, ptr addrspace(3) %602, align 4
  %603 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %568
  store i32 %601, ptr addrspace(3) %603, align 4
  br label %is_smaller_than-after128

smaller_comparison_index-true129:                 ; preds = %is_last_tile-false121
  %604 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %576
  %605 = addrspacecast ptr addrspace(3) %604 to ptr
  %606 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %575
  %607 = addrspacecast ptr addrspace(3) %606 to ptr
  %608 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %576
  %609 = addrspacecast ptr addrspace(3) %608 to ptr
  %610 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %575
  %611 = addrspacecast ptr addrspace(3) %610 to ptr
  %612 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %576
  %613 = addrspacecast ptr addrspace(3) %612 to ptr
  %614 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %575
  %615 = addrspacecast ptr addrspace(3) %614 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %605, ptr %607, ptr %609, ptr %611, ptr %613, ptr %615, ptr %compare_return_buffer131)
  %616 = load i8, ptr %compare_return_buffer131, align 1
  %boolean_predicate132 = icmp ne i8 %616, 0
  br i1 %boolean_predicate132, label %is_smaller_than-true133, label %is_smaller_than-after134

is_smaller_than-after134:                         ; preds = %is_smaller_than-true133, %smaller_comparison_index-true129
  br label %smaller_comparison_index-after130

is_smaller_than-true133:                          ; preds = %smaller_comparison_index-true129
  %617 = load i32, ptr %605, align 4
  %618 = load i32, ptr %607, align 4
  %619 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %575
  store i32 %617, ptr addrspace(3) %619, align 4
  %620 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %576
  store i32 %618, ptr addrspace(3) %620, align 4
  %621 = load i32, ptr %609, align 4
  %622 = load i32, ptr %611, align 4
  %623 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %575
  store i32 %621, ptr addrspace(3) %623, align 4
  %624 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %576
  store i32 %622, ptr addrspace(3) %624, align 4
  %625 = load i32, ptr %613, align 4
  %626 = load i32, ptr %615, align 4
  %627 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %575
  store i32 %625, ptr addrspace(3) %627, align 4
  %628 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %576
  store i32 %626, ptr addrspace(3) %628, align 4
  br label %is_smaller_than-after134

is_last_tile-true135:                             ; preds = %is_last_tile-after122
  %629 = mul i64 %thread.id.x, 2
  %630 = xor i64 %629, 1
  %631 = icmp slt i64 %629, %630
  %632 = icmp slt i64 %630, 11
  %633 = and i1 %631, %632
  br i1 %633, label %smaller_comparison_index-true138, label %smaller_comparison_index-after139

smaller_comparison_index-after139:                ; preds = %is_smaller_than-after143, %is_last_tile-true135
  br label %is_last_tile-after137

is_last_tile-false136:                            ; preds = %is_last_tile-after122
  %634 = mul i64 %thread.id.x, 2
  %635 = xor i64 %634, 1
  %636 = icmp slt i64 %634, %635
  %637 = icmp slt i64 %635, 16
  br i1 true, label %smaller_comparison_index-true144, label %smaller_comparison_index-after145

smaller_comparison_index-after145:                ; preds = %is_smaller_than-after149, %is_last_tile-false136
  br label %is_last_tile-after137

smaller_comparison_index-true138:                 ; preds = %is_last_tile-true135
  %638 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %630
  %639 = addrspacecast ptr addrspace(3) %638 to ptr
  %640 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %629
  %641 = addrspacecast ptr addrspace(3) %640 to ptr
  %642 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %630
  %643 = addrspacecast ptr addrspace(3) %642 to ptr
  %644 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %629
  %645 = addrspacecast ptr addrspace(3) %644 to ptr
  %646 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %630
  %647 = addrspacecast ptr addrspace(3) %646 to ptr
  %648 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %629
  %649 = addrspacecast ptr addrspace(3) %648 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %639, ptr %641, ptr %643, ptr %645, ptr %647, ptr %649, ptr %compare_return_buffer140)
  %650 = load i8, ptr %compare_return_buffer140, align 1
  %boolean_predicate141 = icmp ne i8 %650, 0
  br i1 %boolean_predicate141, label %is_smaller_than-true142, label %is_smaller_than-after143

is_smaller_than-after143:                         ; preds = %is_smaller_than-true142, %smaller_comparison_index-true138
  br label %smaller_comparison_index-after139

is_smaller_than-true142:                          ; preds = %smaller_comparison_index-true138
  %651 = load i32, ptr %639, align 4
  %652 = load i32, ptr %641, align 4
  %653 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %629
  store i32 %651, ptr addrspace(3) %653, align 4
  %654 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %630
  store i32 %652, ptr addrspace(3) %654, align 4
  %655 = load i32, ptr %643, align 4
  %656 = load i32, ptr %645, align 4
  %657 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %629
  store i32 %655, ptr addrspace(3) %657, align 4
  %658 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %630
  store i32 %656, ptr addrspace(3) %658, align 4
  %659 = load i32, ptr %647, align 4
  %660 = load i32, ptr %649, align 4
  %661 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %629
  store i32 %659, ptr addrspace(3) %661, align 4
  %662 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %630
  store i32 %660, ptr addrspace(3) %662, align 4
  br label %is_smaller_than-after143

smaller_comparison_index-true144:                 ; preds = %is_last_tile-false136
  %663 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %635
  %664 = addrspacecast ptr addrspace(3) %663 to ptr
  %665 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %634
  %666 = addrspacecast ptr addrspace(3) %665 to ptr
  %667 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %635
  %668 = addrspacecast ptr addrspace(3) %667 to ptr
  %669 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %634
  %670 = addrspacecast ptr addrspace(3) %669 to ptr
  %671 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %635
  %672 = addrspacecast ptr addrspace(3) %671 to ptr
  %673 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %634
  %674 = addrspacecast ptr addrspace(3) %673 to ptr
  call void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr %664, ptr %666, ptr %668, ptr %670, ptr %672, ptr %674, ptr %compare_return_buffer146)
  %675 = load i8, ptr %compare_return_buffer146, align 1
  %boolean_predicate147 = icmp ne i8 %675, 0
  br i1 %boolean_predicate147, label %is_smaller_than-true148, label %is_smaller_than-after149

is_smaller_than-after149:                         ; preds = %is_smaller_than-true148, %smaller_comparison_index-true144
  br label %smaller_comparison_index-after145

is_smaller_than-true148:                          ; preds = %smaller_comparison_index-true144
  %676 = load i32, ptr %664, align 4
  %677 = load i32, ptr %666, align 4
  %678 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %634
  store i32 %676, ptr addrspace(3) %678, align 4
  %679 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %635
  store i32 %677, ptr addrspace(3) %679, align 4
  %680 = load i32, ptr %668, align 4
  %681 = load i32, ptr %670, align 4
  %682 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %634
  store i32 %680, ptr addrspace(3) %682, align 4
  %683 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %635
  store i32 %681, ptr addrspace(3) %683, align 4
  %684 = load i32, ptr %672, align 4
  %685 = load i32, ptr %674, align 4
  %686 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %634
  store i32 %684, ptr addrspace(3) %686, align 4
  %687 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %635
  store i32 %685, ptr addrspace(3) %687, align 4
  br label %is_smaller_than-after149

smaller_keys_index-true150:                       ; preds = %is_last_tile-after137
  %688 = shl i64 %thread.id.x, 1
  %689 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %688
  %690 = load i32, ptr addrspace(3) %689, align 4
  %691 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %34
  store i32 %690, ptr %691, align 4
  %692 = add i64 %34, 1
  %693 = icmp slt i64 %692, 11
  br i1 %693, label %inner_smaller_keys_index-true152, label %inner_smaller_keys_index-after153

inner_smaller_keys_index-after153:                ; preds = %inner_smaller_keys_index-true152, %smaller_keys_index-true150
  br label %smaller_keys_index-after151

inner_smaller_keys_index-true152:                 ; preds = %smaller_keys_index-true150
  %694 = add i64 %688, 1
  %695 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %694
  %696 = load i32, ptr addrspace(3) %695, align 4
  %697 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %692
  store i32 %696, ptr %697, align 4
  br label %inner_smaller_keys_index-after153

smaller_keys_index-true154:                       ; preds = %smaller_keys_index-after151
  %698 = shl i64 %thread.id.x, 1
  %699 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %698
  %700 = load i32, ptr addrspace(3) %699, align 4
  %701 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %36
  store i32 %700, ptr %701, align 4
  %702 = add i64 %36, 1
  %703 = icmp slt i64 %702, 11
  br i1 %703, label %inner_smaller_keys_index-true156, label %inner_smaller_keys_index-after157

inner_smaller_keys_index-after157:                ; preds = %inner_smaller_keys_index-true156, %smaller_keys_index-true154
  br label %smaller_keys_index-after155

inner_smaller_keys_index-true156:                 ; preds = %smaller_keys_index-true154
  %704 = add i64 %698, 1
  %705 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %704
  %706 = load i32, ptr addrspace(3) %705, align 4
  %707 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %702
  store i32 %706, ptr %707, align 4
  br label %inner_smaller_keys_index-after157

smaller_keys_index-true158:                       ; preds = %smaller_keys_index-after155
  %708 = shl i64 %thread.id.x, 1
  %709 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %708
  %710 = load i32, ptr addrspace(3) %709, align 4
  %711 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %38
  store i32 %710, ptr %711, align 4
  %712 = add i64 %38, 1
  %713 = icmp slt i64 %712, 11
  br i1 %713, label %inner_smaller_keys_index-true160, label %inner_smaller_keys_index-after161

inner_smaller_keys_index-after161:                ; preds = %inner_smaller_keys_index-true160, %smaller_keys_index-true158
  br label %smaller_keys_index-after159

inner_smaller_keys_index-true160:                 ; preds = %smaller_keys_index-true158
  %714 = add i64 %708, 1
  %715 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %714
  %716 = load i32, ptr addrspace(3) %715, align 4
  %717 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %712
  store i32 %716, ptr %717, align 4
  br label %inner_smaller_keys_index-after161
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier.cta.sync.aligned.all(i32) #4

define internal void @region_0_1446_clone_1_64dc1a8f7b50_8e8c20831bdb3683(ptr dereferenceable(4) %0, ptr dereferenceable(4) %1, ptr dereferenceable(4) %2, ptr dereferenceable(4) %3, ptr dereferenceable(4) %4, ptr dereferenceable(4) %5, ptr dereferenceable(1) %output_arg) {
entry:
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %Arg_0.97 = load i32, ptr %0, align 4
  %Arg_1.91 = load i32, ptr %1, align 4
  %11 = icmp ult i32 %Arg_0.97, %Arg_1.91
  %12 = zext i1 %11 to i8
  store i8 %12, ptr %9, align 1
  %Arg_1.911 = load i32, ptr %1, align 4
  %Arg_0.972 = load i32, ptr %0, align 4
  %13 = icmp ult i32 %Arg_1.911, %Arg_0.972
  %14 = zext i1 %13 to i8
  store i8 %14, ptr %8, align 1
  %compare.123.0 = load i8, ptr %9, align 1
  %compare.124.0 = load i8, ptr %8, align 1
  %15 = icmp eq i8 %compare.123.0, %compare.124.0
  %16 = zext i1 %15 to i8
  store i8 %16, ptr %7, align 1
  %p.2.lhs.clone = load i32, ptr %4, align 4
  %p.2.rhs.clone = load i32, ptr %5, align 4
  %17 = icmp slt i32 %p.2.lhs.clone, %p.2.rhs.clone
  %18 = zext i1 %17 to i8
  store i8 %18, ptr %6, align 1
  %compare.125.0 = load i8, ptr %7, align 1
  %compare.126.0 = load i8, ptr %6, align 1
  %compare.123.03 = load i8, ptr %9, align 1
  %19 = trunc i8 %compare.125.0 to i1
  %20 = select i1 %19, i8 %compare.126.0, i8 %compare.123.03
  store i8 %20, ptr %10, align 1
  %load_ret_value = load i8, ptr %10, align 1
  store i8 %load_ret_value, ptr %output_arg, align 1
  ret void
}

define ptx_kernel void @loop_xor_fusion(ptr noalias align 256 dereferenceable(12288) %0, ptr noalias align 256 dereferenceable(67584) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %3, 128
  %6 = add i32 %5, %4
  %7 = udiv i32 %6, 11
  %8 = urem i32 %6, 11
  %9 = sext i32 %8 to i64
  %10 = lshr i64 %9, 32
  %11 = trunc i64 %10 to i32
  %12 = mul i32 %7, 2
  %13 = add i32 %12, 1
  %14 = getelementptr inbounds i32, ptr %0, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = add i32 %8, %15
  %17 = shl i32 %16, 13
  %18 = lshr i32 %16, 19
  %19 = getelementptr inbounds i32, ptr %0, i32 %12
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = add i32 %11, %20
  %22 = or i32 %17, %18
  %23 = add i32 %21, %16
  %24 = xor i32 %23, %22
  %25 = shl i32 %24, 15
  %26 = lshr i32 %24, 17
  %27 = or i32 %25, %26
  %28 = add i32 %23, %24
  %29 = xor i32 %28, %27
  %30 = shl i32 %29, 26
  %31 = lshr i32 %29, 6
  %32 = add i32 %28, %29
  %33 = or i32 %30, %31
  %34 = xor i32 %32, %33
  %35 = shl i32 %34, 6
  %36 = lshr i32 %34, 26
  %37 = or i32 %35, %36
  %38 = add i32 %32, %34
  %39 = xor i32 %38, %37
  %40 = xor i32 %20, %15
  %41 = xor i32 %40, 466688986
  %42 = add i32 %39, %41
  %43 = add i32 %42, 1
  %44 = shl i32 %43, 17
  %45 = lshr i32 %43, 15
  %46 = add i32 %38, %15
  %47 = or i32 %44, %45
  %48 = add i32 %46, %43
  %49 = xor i32 %48, %47
  %50 = shl i32 %49, 29
  %51 = lshr i32 %49, 3
  %52 = or i32 %50, %51
  %53 = add i32 %48, %49
  %54 = xor i32 %53, %52
  %55 = shl i32 %54, 16
  %56 = lshr i32 %54, 16
  %57 = add i32 %53, %54
  %58 = or i32 %55, %56
  %59 = xor i32 %57, %58
  %60 = shl i32 %59, 24
  %61 = lshr i32 %59, 8
  %62 = or i32 %60, %61
  %63 = add i32 %57, %59
  %64 = xor i32 %63, %62
  %65 = add i32 %64, %20
  %66 = add i32 %65, 2
  %67 = shl i32 %66, 13
  %68 = lshr i32 %66, 19
  %69 = add i32 %63, %41
  %70 = or i32 %67, %68
  %71 = add i32 %69, %66
  %72 = xor i32 %71, %70
  %73 = shl i32 %72, 15
  %74 = lshr i32 %72, 17
  %75 = or i32 %73, %74
  %76 = add i32 %71, %72
  %77 = xor i32 %76, %75
  %78 = shl i32 %77, 26
  %79 = lshr i32 %77, 6
  %80 = add i32 %76, %77
  %81 = or i32 %78, %79
  %82 = xor i32 %80, %81
  %83 = shl i32 %82, 6
  %84 = lshr i32 %82, 26
  %85 = or i32 %83, %84
  %86 = add i32 %80, %82
  %87 = xor i32 %86, %85
  %88 = add i32 %87, %15
  %89 = add i32 %88, 3
  %90 = shl i32 %89, 17
  %91 = lshr i32 %89, 15
  %92 = add i32 %86, %20
  %93 = or i32 %90, %91
  %94 = add i32 %92, %89
  %95 = xor i32 %94, %93
  %96 = shl i32 %95, 29
  %97 = lshr i32 %95, 3
  %98 = or i32 %96, %97
  %99 = add i32 %94, %95
  %100 = xor i32 %99, %98
  %101 = shl i32 %100, 16
  %102 = lshr i32 %100, 16
  %103 = add i32 %99, %100
  %104 = or i32 %101, %102
  %105 = xor i32 %103, %104
  %106 = shl i32 %105, 24
  %107 = lshr i32 %105, 8
  %108 = or i32 %106, %107
  %109 = add i32 %103, %105
  %110 = xor i32 %109, %108
  %111 = add i32 %110, %41
  %112 = add i32 %111, 4
  %113 = shl i32 %112, 13
  %114 = lshr i32 %112, 19
  %115 = add i32 %109, %15
  %116 = or i32 %113, %114
  %117 = add i32 %115, %112
  %118 = xor i32 %117, %116
  %119 = shl i32 %118, 15
  %120 = lshr i32 %118, 17
  %121 = or i32 %119, %120
  %122 = add i32 %117, %118
  %123 = xor i32 %122, %121
  %124 = shl i32 %123, 26
  %125 = lshr i32 %123, 6
  %126 = add i32 %122, %123
  %127 = or i32 %124, %125
  %128 = xor i32 %126, %127
  %129 = shl i32 %128, 6
  %130 = lshr i32 %128, 26
  %131 = or i32 %129, %130
  %132 = add i32 %126, %128
  %133 = xor i32 %132, %131
  %134 = add i32 %133, %20
  %135 = add i32 %132, %41
  %136 = add i32 %134, 5
  %137 = xor i32 %135, %136
  %138 = getelementptr inbounds i32, ptr %1, i32 %6
  store i32 %137, ptr %138, align 4
  ret void
}

define ptx_kernel void @sort_5_0(ptr noalias align 256 dereferenceable(67584) %arg0, ptr noalias align 256 dereferenceable(67584) %arg1, ptr noalias align 256 dereferenceable(67584) %arg2) #2 {
entry:
  %compare_return_buffer146 = alloca i8, align 1
  %compare_return_buffer140 = alloca i8, align 1
  %compare_return_buffer131 = alloca i8, align 1
  %compare_return_buffer125 = alloca i8, align 1
  %compare_return_buffer116 = alloca i8, align 1
  %compare_return_buffer110 = alloca i8, align 1
  %compare_return_buffer101 = alloca i8, align 1
  %compare_return_buffer95 = alloca i8, align 1
  %compare_return_buffer86 = alloca i8, align 1
  %compare_return_buffer80 = alloca i8, align 1
  %compare_return_buffer71 = alloca i8, align 1
  %compare_return_buffer65 = alloca i8, align 1
  %compare_return_buffer56 = alloca i8, align 1
  %compare_return_buffer50 = alloca i8, align 1
  %compare_return_buffer41 = alloca i8, align 1
  %compare_return_buffer35 = alloca i8, align 1
  %compare_return_buffer26 = alloca i8, align 1
  %compare_return_buffer20 = alloca i8, align 1
  %compare_return_buffer11 = alloca i8, align 1
  %compare_return_buffer = alloca i8, align 1
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %block_id = zext i32 %0 to i64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %thread_id_x = zext i32 %1 to i64
  %2 = mul nuw nsw i64 %block_id, 8
  %linear_index = add nuw nsw i64 %2, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 12288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %3 = udiv i64 %linear_index0, 1
  %4 = urem i64 %3, 8
  %5 = udiv i64 %linear_index0, 8
  %6 = icmp ult i64 %linear_index, 12288
  br i1 %6, label %sort.5.0.in_bounds-true, label %sort.5.0.in_bounds-after

sort.5.0.in_bounds-after:                         ; preds = %smaller_keys_index-after159, %entry
  ret void

sort.5.0.in_bounds-true:                          ; preds = %entry
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !7
  %thread.id.x = sext i32 %7 to i64
  %8 = shl i64 %4, 1
  %9 = icmp slt i64 %8, 11
  br i1 %9, label %smaller_keys_index-true, label %smaller_keys_index-after

smaller_keys_index-after:                         ; preds = %inner_smaller_keys_index-after, %sort.5.0.in_bounds-true
  %10 = shl i64 %4, 1
  %11 = icmp slt i64 %10, 11
  br i1 %11, label %smaller_keys_index-true1, label %smaller_keys_index-after2

smaller_keys_index-after2:                        ; preds = %inner_smaller_keys_index-after4, %smaller_keys_index-after
  %12 = shl i64 %4, 1
  %13 = icmp slt i64 %12, 11
  br i1 %13, label %smaller_keys_index-true5, label %smaller_keys_index-after6

smaller_keys_index-after6:                        ; preds = %inner_smaller_keys_index-after8, %smaller_keys_index-after2
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %14 = mul i64 %4, 2
  %15 = icmp uge i64 %14, 0
  br i1 %15, label %is_last_tile-true, label %is_last_tile-false

is_last_tile-after:                               ; preds = %smaller_comparison_index-after10, %smaller_comparison_index-after
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %16 = mul i64 %4, 2
  %17 = icmp uge i64 %16, 0
  br i1 %17, label %is_last_tile-true15, label %is_last_tile-false16

is_last_tile-after17:                             ; preds = %smaller_comparison_index-after25, %smaller_comparison_index-after19
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %18 = mul i64 %4, 2
  %19 = icmp uge i64 %18, 0
  br i1 %19, label %is_last_tile-true30, label %is_last_tile-false31

is_last_tile-after32:                             ; preds = %smaller_comparison_index-after40, %smaller_comparison_index-after34
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %20 = mul i64 %4, 2
  %21 = icmp uge i64 %20, 0
  br i1 %21, label %is_last_tile-true45, label %is_last_tile-false46

is_last_tile-after47:                             ; preds = %smaller_comparison_index-after55, %smaller_comparison_index-after49
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %22 = mul i64 %4, 2
  %23 = icmp uge i64 %22, 0
  br i1 %23, label %is_last_tile-true60, label %is_last_tile-false61

is_last_tile-after62:                             ; preds = %smaller_comparison_index-after70, %smaller_comparison_index-after64
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %24 = mul i64 %4, 2
  %25 = icmp uge i64 %24, 0
  br i1 %25, label %is_last_tile-true75, label %is_last_tile-false76

is_last_tile-after77:                             ; preds = %smaller_comparison_index-after85, %smaller_comparison_index-after79
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %26 = mul i64 %4, 2
  %27 = icmp uge i64 %26, 0
  br i1 %27, label %is_last_tile-true90, label %is_last_tile-false91

is_last_tile-after92:                             ; preds = %smaller_comparison_index-after100, %smaller_comparison_index-after94
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %28 = mul i64 %4, 2
  %29 = icmp uge i64 %28, 0
  br i1 %29, label %is_last_tile-true105, label %is_last_tile-false106

is_last_tile-after107:                            ; preds = %smaller_comparison_index-after115, %smaller_comparison_index-after109
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %30 = mul i64 %4, 2
  %31 = icmp uge i64 %30, 0
  br i1 %31, label %is_last_tile-true120, label %is_last_tile-false121

is_last_tile-after122:                            ; preds = %smaller_comparison_index-after130, %smaller_comparison_index-after124
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %32 = mul i64 %4, 2
  %33 = icmp uge i64 %32, 0
  br i1 %33, label %is_last_tile-true135, label %is_last_tile-false136

is_last_tile-after137:                            ; preds = %smaller_comparison_index-after145, %smaller_comparison_index-after139
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %34 = shl i64 %4, 1
  %35 = icmp slt i64 %34, 11
  br i1 %35, label %smaller_keys_index-true150, label %smaller_keys_index-after151

smaller_keys_index-after151:                      ; preds = %inner_smaller_keys_index-after153, %is_last_tile-after137
  %36 = shl i64 %4, 1
  %37 = icmp slt i64 %36, 11
  br i1 %37, label %smaller_keys_index-true154, label %smaller_keys_index-after155

smaller_keys_index-after155:                      ; preds = %inner_smaller_keys_index-after157, %smaller_keys_index-after151
  %38 = shl i64 %4, 1
  %39 = icmp slt i64 %38, 11
  br i1 %39, label %smaller_keys_index-true158, label %smaller_keys_index-after159

smaller_keys_index-after159:                      ; preds = %inner_smaller_keys_index-after161, %smaller_keys_index-after155
  br label %sort.5.0.in_bounds-after

smaller_keys_index-true:                          ; preds = %sort.5.0.in_bounds-true
  %40 = shl i64 %thread.id.x, 1
  %41 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %8
  %42 = load i32, ptr %41, align 4
  %43 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %40
  store i32 %42, ptr addrspace(3) %43, align 4
  %44 = add i64 %8, 1
  %45 = icmp slt i64 %44, 11
  br i1 %45, label %inner_smaller_keys_index-true, label %inner_smaller_keys_index-after

inner_smaller_keys_index-after:                   ; preds = %inner_smaller_keys_index-true, %smaller_keys_index-true
  br label %smaller_keys_index-after

inner_smaller_keys_index-true:                    ; preds = %smaller_keys_index-true
  %46 = add i64 %40, 1
  %47 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %44
  %48 = load i32, ptr %47, align 4
  %49 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %46
  store i32 %48, ptr addrspace(3) %49, align 4
  br label %inner_smaller_keys_index-after

smaller_keys_index-true1:                         ; preds = %smaller_keys_index-after
  %50 = shl i64 %thread.id.x, 1
  %51 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %10
  %52 = load i32, ptr %51, align 4
  %53 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %50
  store i32 %52, ptr addrspace(3) %53, align 4
  %54 = add i64 %10, 1
  %55 = icmp slt i64 %54, 11
  br i1 %55, label %inner_smaller_keys_index-true3, label %inner_smaller_keys_index-after4

inner_smaller_keys_index-after4:                  ; preds = %inner_smaller_keys_index-true3, %smaller_keys_index-true1
  br label %smaller_keys_index-after2

inner_smaller_keys_index-true3:                   ; preds = %smaller_keys_index-true1
  %56 = add i64 %50, 1
  %57 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %54
  %58 = load i32, ptr %57, align 4
  %59 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %56
  store i32 %58, ptr addrspace(3) %59, align 4
  br label %inner_smaller_keys_index-after4

smaller_keys_index-true5:                         ; preds = %smaller_keys_index-after2
  %60 = shl i64 %thread.id.x, 1
  %61 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %12
  %62 = load i32, ptr %61, align 4
  %63 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %60
  store i32 %62, ptr addrspace(3) %63, align 4
  %64 = add i64 %12, 1
  %65 = icmp slt i64 %64, 11
  br i1 %65, label %inner_smaller_keys_index-true7, label %inner_smaller_keys_index-after8

inner_smaller_keys_index-after8:                  ; preds = %inner_smaller_keys_index-true7, %smaller_keys_index-true5
  br label %smaller_keys_index-after6

inner_smaller_keys_index-true7:                   ; preds = %smaller_keys_index-true5
  %66 = add i64 %60, 1
  %67 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %64
  %68 = load i32, ptr %67, align 4
  %69 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %66
  store i32 %68, ptr addrspace(3) %69, align 4
  br label %inner_smaller_keys_index-after8

is_last_tile-true:                                ; preds = %smaller_keys_index-after6
  %70 = mul i64 %thread.id.x, 2
  %71 = xor i64 %70, 1
  %72 = icmp slt i64 %70, %71
  %73 = icmp slt i64 %71, 11
  %74 = and i1 %72, %73
  br i1 %74, label %smaller_comparison_index-true, label %smaller_comparison_index-after

smaller_comparison_index-after:                   ; preds = %is_smaller_than-after, %is_last_tile-true
  br label %is_last_tile-after

is_last_tile-false:                               ; preds = %smaller_keys_index-after6
  %75 = mul i64 %thread.id.x, 2
  %76 = xor i64 %75, 1
  %77 = icmp slt i64 %75, %76
  %78 = icmp slt i64 %76, 16
  br i1 true, label %smaller_comparison_index-true9, label %smaller_comparison_index-after10

smaller_comparison_index-after10:                 ; preds = %is_smaller_than-after14, %is_last_tile-false
  br label %is_last_tile-after

smaller_comparison_index-true:                    ; preds = %is_last_tile-true
  %79 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %71
  %80 = addrspacecast ptr addrspace(3) %79 to ptr
  %81 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %70
  %82 = addrspacecast ptr addrspace(3) %81 to ptr
  %83 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %71
  %84 = addrspacecast ptr addrspace(3) %83 to ptr
  %85 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %70
  %86 = addrspacecast ptr addrspace(3) %85 to ptr
  %87 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %71
  %88 = addrspacecast ptr addrspace(3) %87 to ptr
  %89 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %70
  %90 = addrspacecast ptr addrspace(3) %89 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %80, ptr %82, ptr %84, ptr %86, ptr %88, ptr %90, ptr %compare_return_buffer)
  %91 = load i8, ptr %compare_return_buffer, align 1
  %boolean_predicate = icmp ne i8 %91, 0
  br i1 %boolean_predicate, label %is_smaller_than-true, label %is_smaller_than-after

is_smaller_than-after:                            ; preds = %is_smaller_than-true, %smaller_comparison_index-true
  br label %smaller_comparison_index-after

is_smaller_than-true:                             ; preds = %smaller_comparison_index-true
  %92 = load i32, ptr %80, align 4
  %93 = load i32, ptr %82, align 4
  %94 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %70
  store i32 %92, ptr addrspace(3) %94, align 4
  %95 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %71
  store i32 %93, ptr addrspace(3) %95, align 4
  %96 = load i32, ptr %84, align 4
  %97 = load i32, ptr %86, align 4
  %98 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %70
  store i32 %96, ptr addrspace(3) %98, align 4
  %99 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %71
  store i32 %97, ptr addrspace(3) %99, align 4
  %100 = load i32, ptr %88, align 4
  %101 = load i32, ptr %90, align 4
  %102 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %70
  store i32 %100, ptr addrspace(3) %102, align 4
  %103 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %71
  store i32 %101, ptr addrspace(3) %103, align 4
  br label %is_smaller_than-after

smaller_comparison_index-true9:                   ; preds = %is_last_tile-false
  %104 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %76
  %105 = addrspacecast ptr addrspace(3) %104 to ptr
  %106 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %75
  %107 = addrspacecast ptr addrspace(3) %106 to ptr
  %108 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %76
  %109 = addrspacecast ptr addrspace(3) %108 to ptr
  %110 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %75
  %111 = addrspacecast ptr addrspace(3) %110 to ptr
  %112 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %76
  %113 = addrspacecast ptr addrspace(3) %112 to ptr
  %114 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %75
  %115 = addrspacecast ptr addrspace(3) %114 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %105, ptr %107, ptr %109, ptr %111, ptr %113, ptr %115, ptr %compare_return_buffer11)
  %116 = load i8, ptr %compare_return_buffer11, align 1
  %boolean_predicate12 = icmp ne i8 %116, 0
  br i1 %boolean_predicate12, label %is_smaller_than-true13, label %is_smaller_than-after14

is_smaller_than-after14:                          ; preds = %is_smaller_than-true13, %smaller_comparison_index-true9
  br label %smaller_comparison_index-after10

is_smaller_than-true13:                           ; preds = %smaller_comparison_index-true9
  %117 = load i32, ptr %105, align 4
  %118 = load i32, ptr %107, align 4
  %119 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %75
  store i32 %117, ptr addrspace(3) %119, align 4
  %120 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %76
  store i32 %118, ptr addrspace(3) %120, align 4
  %121 = load i32, ptr %109, align 4
  %122 = load i32, ptr %111, align 4
  %123 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %75
  store i32 %121, ptr addrspace(3) %123, align 4
  %124 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %76
  store i32 %122, ptr addrspace(3) %124, align 4
  %125 = load i32, ptr %113, align 4
  %126 = load i32, ptr %115, align 4
  %127 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %75
  store i32 %125, ptr addrspace(3) %127, align 4
  %128 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %76
  store i32 %126, ptr addrspace(3) %128, align 4
  br label %is_smaller_than-after14

is_last_tile-true15:                              ; preds = %is_last_tile-after
  %129 = udiv i64 %thread.id.x, 2
  %130 = urem i64 %thread.id.x, 2
  %131 = mul i64 %129, 4
  %132 = add i64 %131, %130
  %133 = xor i64 %132, 3
  %134 = icmp slt i64 %132, %133
  %135 = icmp slt i64 %133, 11
  %136 = and i1 %134, %135
  br i1 %136, label %smaller_comparison_index-true18, label %smaller_comparison_index-after19

smaller_comparison_index-after19:                 ; preds = %is_smaller_than-after23, %is_last_tile-true15
  br label %is_last_tile-after17

is_last_tile-false16:                             ; preds = %is_last_tile-after
  %137 = udiv i64 %thread.id.x, 2
  %138 = urem i64 %thread.id.x, 2
  %139 = mul i64 %137, 4
  %140 = add i64 %139, %138
  %141 = xor i64 %140, 3
  %142 = icmp slt i64 %140, %141
  %143 = icmp slt i64 %141, 16
  br i1 true, label %smaller_comparison_index-true24, label %smaller_comparison_index-after25

smaller_comparison_index-after25:                 ; preds = %is_smaller_than-after29, %is_last_tile-false16
  br label %is_last_tile-after17

smaller_comparison_index-true18:                  ; preds = %is_last_tile-true15
  %144 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %133
  %145 = addrspacecast ptr addrspace(3) %144 to ptr
  %146 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %132
  %147 = addrspacecast ptr addrspace(3) %146 to ptr
  %148 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %133
  %149 = addrspacecast ptr addrspace(3) %148 to ptr
  %150 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %132
  %151 = addrspacecast ptr addrspace(3) %150 to ptr
  %152 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %133
  %153 = addrspacecast ptr addrspace(3) %152 to ptr
  %154 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %132
  %155 = addrspacecast ptr addrspace(3) %154 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %145, ptr %147, ptr %149, ptr %151, ptr %153, ptr %155, ptr %compare_return_buffer20)
  %156 = load i8, ptr %compare_return_buffer20, align 1
  %boolean_predicate21 = icmp ne i8 %156, 0
  br i1 %boolean_predicate21, label %is_smaller_than-true22, label %is_smaller_than-after23

is_smaller_than-after23:                          ; preds = %is_smaller_than-true22, %smaller_comparison_index-true18
  br label %smaller_comparison_index-after19

is_smaller_than-true22:                           ; preds = %smaller_comparison_index-true18
  %157 = load i32, ptr %145, align 4
  %158 = load i32, ptr %147, align 4
  %159 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %132
  store i32 %157, ptr addrspace(3) %159, align 4
  %160 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %133
  store i32 %158, ptr addrspace(3) %160, align 4
  %161 = load i32, ptr %149, align 4
  %162 = load i32, ptr %151, align 4
  %163 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %132
  store i32 %161, ptr addrspace(3) %163, align 4
  %164 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %133
  store i32 %162, ptr addrspace(3) %164, align 4
  %165 = load i32, ptr %153, align 4
  %166 = load i32, ptr %155, align 4
  %167 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %132
  store i32 %165, ptr addrspace(3) %167, align 4
  %168 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %133
  store i32 %166, ptr addrspace(3) %168, align 4
  br label %is_smaller_than-after23

smaller_comparison_index-true24:                  ; preds = %is_last_tile-false16
  %169 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %141
  %170 = addrspacecast ptr addrspace(3) %169 to ptr
  %171 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %140
  %172 = addrspacecast ptr addrspace(3) %171 to ptr
  %173 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %141
  %174 = addrspacecast ptr addrspace(3) %173 to ptr
  %175 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %140
  %176 = addrspacecast ptr addrspace(3) %175 to ptr
  %177 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %141
  %178 = addrspacecast ptr addrspace(3) %177 to ptr
  %179 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %140
  %180 = addrspacecast ptr addrspace(3) %179 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %170, ptr %172, ptr %174, ptr %176, ptr %178, ptr %180, ptr %compare_return_buffer26)
  %181 = load i8, ptr %compare_return_buffer26, align 1
  %boolean_predicate27 = icmp ne i8 %181, 0
  br i1 %boolean_predicate27, label %is_smaller_than-true28, label %is_smaller_than-after29

is_smaller_than-after29:                          ; preds = %is_smaller_than-true28, %smaller_comparison_index-true24
  br label %smaller_comparison_index-after25

is_smaller_than-true28:                           ; preds = %smaller_comparison_index-true24
  %182 = load i32, ptr %170, align 4
  %183 = load i32, ptr %172, align 4
  %184 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %140
  store i32 %182, ptr addrspace(3) %184, align 4
  %185 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %141
  store i32 %183, ptr addrspace(3) %185, align 4
  %186 = load i32, ptr %174, align 4
  %187 = load i32, ptr %176, align 4
  %188 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %140
  store i32 %186, ptr addrspace(3) %188, align 4
  %189 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %141
  store i32 %187, ptr addrspace(3) %189, align 4
  %190 = load i32, ptr %178, align 4
  %191 = load i32, ptr %180, align 4
  %192 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %140
  store i32 %190, ptr addrspace(3) %192, align 4
  %193 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %141
  store i32 %191, ptr addrspace(3) %193, align 4
  br label %is_smaller_than-after29

is_last_tile-true30:                              ; preds = %is_last_tile-after17
  %194 = mul i64 %thread.id.x, 2
  %195 = xor i64 %194, 1
  %196 = icmp slt i64 %194, %195
  %197 = icmp slt i64 %195, 11
  %198 = and i1 %196, %197
  br i1 %198, label %smaller_comparison_index-true33, label %smaller_comparison_index-after34

smaller_comparison_index-after34:                 ; preds = %is_smaller_than-after38, %is_last_tile-true30
  br label %is_last_tile-after32

is_last_tile-false31:                             ; preds = %is_last_tile-after17
  %199 = mul i64 %thread.id.x, 2
  %200 = xor i64 %199, 1
  %201 = icmp slt i64 %199, %200
  %202 = icmp slt i64 %200, 16
  br i1 true, label %smaller_comparison_index-true39, label %smaller_comparison_index-after40

smaller_comparison_index-after40:                 ; preds = %is_smaller_than-after44, %is_last_tile-false31
  br label %is_last_tile-after32

smaller_comparison_index-true33:                  ; preds = %is_last_tile-true30
  %203 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %195
  %204 = addrspacecast ptr addrspace(3) %203 to ptr
  %205 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %194
  %206 = addrspacecast ptr addrspace(3) %205 to ptr
  %207 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %195
  %208 = addrspacecast ptr addrspace(3) %207 to ptr
  %209 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %194
  %210 = addrspacecast ptr addrspace(3) %209 to ptr
  %211 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %195
  %212 = addrspacecast ptr addrspace(3) %211 to ptr
  %213 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %194
  %214 = addrspacecast ptr addrspace(3) %213 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %204, ptr %206, ptr %208, ptr %210, ptr %212, ptr %214, ptr %compare_return_buffer35)
  %215 = load i8, ptr %compare_return_buffer35, align 1
  %boolean_predicate36 = icmp ne i8 %215, 0
  br i1 %boolean_predicate36, label %is_smaller_than-true37, label %is_smaller_than-after38

is_smaller_than-after38:                          ; preds = %is_smaller_than-true37, %smaller_comparison_index-true33
  br label %smaller_comparison_index-after34

is_smaller_than-true37:                           ; preds = %smaller_comparison_index-true33
  %216 = load i32, ptr %204, align 4
  %217 = load i32, ptr %206, align 4
  %218 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %194
  store i32 %216, ptr addrspace(3) %218, align 4
  %219 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %195
  store i32 %217, ptr addrspace(3) %219, align 4
  %220 = load i32, ptr %208, align 4
  %221 = load i32, ptr %210, align 4
  %222 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %194
  store i32 %220, ptr addrspace(3) %222, align 4
  %223 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %195
  store i32 %221, ptr addrspace(3) %223, align 4
  %224 = load i32, ptr %212, align 4
  %225 = load i32, ptr %214, align 4
  %226 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %194
  store i32 %224, ptr addrspace(3) %226, align 4
  %227 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %195
  store i32 %225, ptr addrspace(3) %227, align 4
  br label %is_smaller_than-after38

smaller_comparison_index-true39:                  ; preds = %is_last_tile-false31
  %228 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %200
  %229 = addrspacecast ptr addrspace(3) %228 to ptr
  %230 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %199
  %231 = addrspacecast ptr addrspace(3) %230 to ptr
  %232 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %200
  %233 = addrspacecast ptr addrspace(3) %232 to ptr
  %234 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %199
  %235 = addrspacecast ptr addrspace(3) %234 to ptr
  %236 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %200
  %237 = addrspacecast ptr addrspace(3) %236 to ptr
  %238 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %199
  %239 = addrspacecast ptr addrspace(3) %238 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %229, ptr %231, ptr %233, ptr %235, ptr %237, ptr %239, ptr %compare_return_buffer41)
  %240 = load i8, ptr %compare_return_buffer41, align 1
  %boolean_predicate42 = icmp ne i8 %240, 0
  br i1 %boolean_predicate42, label %is_smaller_than-true43, label %is_smaller_than-after44

is_smaller_than-after44:                          ; preds = %is_smaller_than-true43, %smaller_comparison_index-true39
  br label %smaller_comparison_index-after40

is_smaller_than-true43:                           ; preds = %smaller_comparison_index-true39
  %241 = load i32, ptr %229, align 4
  %242 = load i32, ptr %231, align 4
  %243 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %199
  store i32 %241, ptr addrspace(3) %243, align 4
  %244 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %200
  store i32 %242, ptr addrspace(3) %244, align 4
  %245 = load i32, ptr %233, align 4
  %246 = load i32, ptr %235, align 4
  %247 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %199
  store i32 %245, ptr addrspace(3) %247, align 4
  %248 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %200
  store i32 %246, ptr addrspace(3) %248, align 4
  %249 = load i32, ptr %237, align 4
  %250 = load i32, ptr %239, align 4
  %251 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %199
  store i32 %249, ptr addrspace(3) %251, align 4
  %252 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %200
  store i32 %250, ptr addrspace(3) %252, align 4
  br label %is_smaller_than-after44

is_last_tile-true45:                              ; preds = %is_last_tile-after32
  %253 = udiv i64 %thread.id.x, 4
  %254 = urem i64 %thread.id.x, 4
  %255 = mul i64 %253, 8
  %256 = add i64 %255, %254
  %257 = xor i64 %256, 7
  %258 = icmp slt i64 %256, %257
  %259 = icmp slt i64 %257, 11
  %260 = and i1 %258, %259
  br i1 %260, label %smaller_comparison_index-true48, label %smaller_comparison_index-after49

smaller_comparison_index-after49:                 ; preds = %is_smaller_than-after53, %is_last_tile-true45
  br label %is_last_tile-after47

is_last_tile-false46:                             ; preds = %is_last_tile-after32
  %261 = udiv i64 %thread.id.x, 4
  %262 = urem i64 %thread.id.x, 4
  %263 = mul i64 %261, 8
  %264 = add i64 %263, %262
  %265 = xor i64 %264, 7
  %266 = icmp slt i64 %264, %265
  %267 = icmp slt i64 %265, 16
  br i1 true, label %smaller_comparison_index-true54, label %smaller_comparison_index-after55

smaller_comparison_index-after55:                 ; preds = %is_smaller_than-after59, %is_last_tile-false46
  br label %is_last_tile-after47

smaller_comparison_index-true48:                  ; preds = %is_last_tile-true45
  %268 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %257
  %269 = addrspacecast ptr addrspace(3) %268 to ptr
  %270 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %256
  %271 = addrspacecast ptr addrspace(3) %270 to ptr
  %272 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %257
  %273 = addrspacecast ptr addrspace(3) %272 to ptr
  %274 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %256
  %275 = addrspacecast ptr addrspace(3) %274 to ptr
  %276 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %257
  %277 = addrspacecast ptr addrspace(3) %276 to ptr
  %278 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %256
  %279 = addrspacecast ptr addrspace(3) %278 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %269, ptr %271, ptr %273, ptr %275, ptr %277, ptr %279, ptr %compare_return_buffer50)
  %280 = load i8, ptr %compare_return_buffer50, align 1
  %boolean_predicate51 = icmp ne i8 %280, 0
  br i1 %boolean_predicate51, label %is_smaller_than-true52, label %is_smaller_than-after53

is_smaller_than-after53:                          ; preds = %is_smaller_than-true52, %smaller_comparison_index-true48
  br label %smaller_comparison_index-after49

is_smaller_than-true52:                           ; preds = %smaller_comparison_index-true48
  %281 = load i32, ptr %269, align 4
  %282 = load i32, ptr %271, align 4
  %283 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %256
  store i32 %281, ptr addrspace(3) %283, align 4
  %284 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %257
  store i32 %282, ptr addrspace(3) %284, align 4
  %285 = load i32, ptr %273, align 4
  %286 = load i32, ptr %275, align 4
  %287 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %256
  store i32 %285, ptr addrspace(3) %287, align 4
  %288 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %257
  store i32 %286, ptr addrspace(3) %288, align 4
  %289 = load i32, ptr %277, align 4
  %290 = load i32, ptr %279, align 4
  %291 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %256
  store i32 %289, ptr addrspace(3) %291, align 4
  %292 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %257
  store i32 %290, ptr addrspace(3) %292, align 4
  br label %is_smaller_than-after53

smaller_comparison_index-true54:                  ; preds = %is_last_tile-false46
  %293 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %265
  %294 = addrspacecast ptr addrspace(3) %293 to ptr
  %295 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %264
  %296 = addrspacecast ptr addrspace(3) %295 to ptr
  %297 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %265
  %298 = addrspacecast ptr addrspace(3) %297 to ptr
  %299 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %264
  %300 = addrspacecast ptr addrspace(3) %299 to ptr
  %301 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %265
  %302 = addrspacecast ptr addrspace(3) %301 to ptr
  %303 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %264
  %304 = addrspacecast ptr addrspace(3) %303 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %294, ptr %296, ptr %298, ptr %300, ptr %302, ptr %304, ptr %compare_return_buffer56)
  %305 = load i8, ptr %compare_return_buffer56, align 1
  %boolean_predicate57 = icmp ne i8 %305, 0
  br i1 %boolean_predicate57, label %is_smaller_than-true58, label %is_smaller_than-after59

is_smaller_than-after59:                          ; preds = %is_smaller_than-true58, %smaller_comparison_index-true54
  br label %smaller_comparison_index-after55

is_smaller_than-true58:                           ; preds = %smaller_comparison_index-true54
  %306 = load i32, ptr %294, align 4
  %307 = load i32, ptr %296, align 4
  %308 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %264
  store i32 %306, ptr addrspace(3) %308, align 4
  %309 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %265
  store i32 %307, ptr addrspace(3) %309, align 4
  %310 = load i32, ptr %298, align 4
  %311 = load i32, ptr %300, align 4
  %312 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %264
  store i32 %310, ptr addrspace(3) %312, align 4
  %313 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %265
  store i32 %311, ptr addrspace(3) %313, align 4
  %314 = load i32, ptr %302, align 4
  %315 = load i32, ptr %304, align 4
  %316 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %264
  store i32 %314, ptr addrspace(3) %316, align 4
  %317 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %265
  store i32 %315, ptr addrspace(3) %317, align 4
  br label %is_smaller_than-after59

is_last_tile-true60:                              ; preds = %is_last_tile-after47
  %318 = udiv i64 %thread.id.x, 2
  %319 = urem i64 %thread.id.x, 2
  %320 = mul i64 %318, 4
  %321 = add i64 %320, %319
  %322 = xor i64 %321, 2
  %323 = icmp slt i64 %321, %322
  %324 = icmp slt i64 %322, 11
  %325 = and i1 %323, %324
  br i1 %325, label %smaller_comparison_index-true63, label %smaller_comparison_index-after64

smaller_comparison_index-after64:                 ; preds = %is_smaller_than-after68, %is_last_tile-true60
  br label %is_last_tile-after62

is_last_tile-false61:                             ; preds = %is_last_tile-after47
  %326 = udiv i64 %thread.id.x, 2
  %327 = urem i64 %thread.id.x, 2
  %328 = mul i64 %326, 4
  %329 = add i64 %328, %327
  %330 = xor i64 %329, 2
  %331 = icmp slt i64 %329, %330
  %332 = icmp slt i64 %330, 16
  br i1 true, label %smaller_comparison_index-true69, label %smaller_comparison_index-after70

smaller_comparison_index-after70:                 ; preds = %is_smaller_than-after74, %is_last_tile-false61
  br label %is_last_tile-after62

smaller_comparison_index-true63:                  ; preds = %is_last_tile-true60
  %333 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %322
  %334 = addrspacecast ptr addrspace(3) %333 to ptr
  %335 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %321
  %336 = addrspacecast ptr addrspace(3) %335 to ptr
  %337 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %322
  %338 = addrspacecast ptr addrspace(3) %337 to ptr
  %339 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %321
  %340 = addrspacecast ptr addrspace(3) %339 to ptr
  %341 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %322
  %342 = addrspacecast ptr addrspace(3) %341 to ptr
  %343 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %321
  %344 = addrspacecast ptr addrspace(3) %343 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %334, ptr %336, ptr %338, ptr %340, ptr %342, ptr %344, ptr %compare_return_buffer65)
  %345 = load i8, ptr %compare_return_buffer65, align 1
  %boolean_predicate66 = icmp ne i8 %345, 0
  br i1 %boolean_predicate66, label %is_smaller_than-true67, label %is_smaller_than-after68

is_smaller_than-after68:                          ; preds = %is_smaller_than-true67, %smaller_comparison_index-true63
  br label %smaller_comparison_index-after64

is_smaller_than-true67:                           ; preds = %smaller_comparison_index-true63
  %346 = load i32, ptr %334, align 4
  %347 = load i32, ptr %336, align 4
  %348 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %321
  store i32 %346, ptr addrspace(3) %348, align 4
  %349 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %322
  store i32 %347, ptr addrspace(3) %349, align 4
  %350 = load i32, ptr %338, align 4
  %351 = load i32, ptr %340, align 4
  %352 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %321
  store i32 %350, ptr addrspace(3) %352, align 4
  %353 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %322
  store i32 %351, ptr addrspace(3) %353, align 4
  %354 = load i32, ptr %342, align 4
  %355 = load i32, ptr %344, align 4
  %356 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %321
  store i32 %354, ptr addrspace(3) %356, align 4
  %357 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %322
  store i32 %355, ptr addrspace(3) %357, align 4
  br label %is_smaller_than-after68

smaller_comparison_index-true69:                  ; preds = %is_last_tile-false61
  %358 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %330
  %359 = addrspacecast ptr addrspace(3) %358 to ptr
  %360 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %329
  %361 = addrspacecast ptr addrspace(3) %360 to ptr
  %362 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %330
  %363 = addrspacecast ptr addrspace(3) %362 to ptr
  %364 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %329
  %365 = addrspacecast ptr addrspace(3) %364 to ptr
  %366 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %330
  %367 = addrspacecast ptr addrspace(3) %366 to ptr
  %368 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %329
  %369 = addrspacecast ptr addrspace(3) %368 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %359, ptr %361, ptr %363, ptr %365, ptr %367, ptr %369, ptr %compare_return_buffer71)
  %370 = load i8, ptr %compare_return_buffer71, align 1
  %boolean_predicate72 = icmp ne i8 %370, 0
  br i1 %boolean_predicate72, label %is_smaller_than-true73, label %is_smaller_than-after74

is_smaller_than-after74:                          ; preds = %is_smaller_than-true73, %smaller_comparison_index-true69
  br label %smaller_comparison_index-after70

is_smaller_than-true73:                           ; preds = %smaller_comparison_index-true69
  %371 = load i32, ptr %359, align 4
  %372 = load i32, ptr %361, align 4
  %373 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %329
  store i32 %371, ptr addrspace(3) %373, align 4
  %374 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %330
  store i32 %372, ptr addrspace(3) %374, align 4
  %375 = load i32, ptr %363, align 4
  %376 = load i32, ptr %365, align 4
  %377 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %329
  store i32 %375, ptr addrspace(3) %377, align 4
  %378 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %330
  store i32 %376, ptr addrspace(3) %378, align 4
  %379 = load i32, ptr %367, align 4
  %380 = load i32, ptr %369, align 4
  %381 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %329
  store i32 %379, ptr addrspace(3) %381, align 4
  %382 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %330
  store i32 %380, ptr addrspace(3) %382, align 4
  br label %is_smaller_than-after74

is_last_tile-true75:                              ; preds = %is_last_tile-after62
  %383 = mul i64 %thread.id.x, 2
  %384 = xor i64 %383, 1
  %385 = icmp slt i64 %383, %384
  %386 = icmp slt i64 %384, 11
  %387 = and i1 %385, %386
  br i1 %387, label %smaller_comparison_index-true78, label %smaller_comparison_index-after79

smaller_comparison_index-after79:                 ; preds = %is_smaller_than-after83, %is_last_tile-true75
  br label %is_last_tile-after77

is_last_tile-false76:                             ; preds = %is_last_tile-after62
  %388 = mul i64 %thread.id.x, 2
  %389 = xor i64 %388, 1
  %390 = icmp slt i64 %388, %389
  %391 = icmp slt i64 %389, 16
  br i1 true, label %smaller_comparison_index-true84, label %smaller_comparison_index-after85

smaller_comparison_index-after85:                 ; preds = %is_smaller_than-after89, %is_last_tile-false76
  br label %is_last_tile-after77

smaller_comparison_index-true78:                  ; preds = %is_last_tile-true75
  %392 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %384
  %393 = addrspacecast ptr addrspace(3) %392 to ptr
  %394 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %383
  %395 = addrspacecast ptr addrspace(3) %394 to ptr
  %396 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %384
  %397 = addrspacecast ptr addrspace(3) %396 to ptr
  %398 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %383
  %399 = addrspacecast ptr addrspace(3) %398 to ptr
  %400 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %384
  %401 = addrspacecast ptr addrspace(3) %400 to ptr
  %402 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %383
  %403 = addrspacecast ptr addrspace(3) %402 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %393, ptr %395, ptr %397, ptr %399, ptr %401, ptr %403, ptr %compare_return_buffer80)
  %404 = load i8, ptr %compare_return_buffer80, align 1
  %boolean_predicate81 = icmp ne i8 %404, 0
  br i1 %boolean_predicate81, label %is_smaller_than-true82, label %is_smaller_than-after83

is_smaller_than-after83:                          ; preds = %is_smaller_than-true82, %smaller_comparison_index-true78
  br label %smaller_comparison_index-after79

is_smaller_than-true82:                           ; preds = %smaller_comparison_index-true78
  %405 = load i32, ptr %393, align 4
  %406 = load i32, ptr %395, align 4
  %407 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %383
  store i32 %405, ptr addrspace(3) %407, align 4
  %408 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %384
  store i32 %406, ptr addrspace(3) %408, align 4
  %409 = load i32, ptr %397, align 4
  %410 = load i32, ptr %399, align 4
  %411 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %383
  store i32 %409, ptr addrspace(3) %411, align 4
  %412 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %384
  store i32 %410, ptr addrspace(3) %412, align 4
  %413 = load i32, ptr %401, align 4
  %414 = load i32, ptr %403, align 4
  %415 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %383
  store i32 %413, ptr addrspace(3) %415, align 4
  %416 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %384
  store i32 %414, ptr addrspace(3) %416, align 4
  br label %is_smaller_than-after83

smaller_comparison_index-true84:                  ; preds = %is_last_tile-false76
  %417 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %389
  %418 = addrspacecast ptr addrspace(3) %417 to ptr
  %419 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %388
  %420 = addrspacecast ptr addrspace(3) %419 to ptr
  %421 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %389
  %422 = addrspacecast ptr addrspace(3) %421 to ptr
  %423 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %388
  %424 = addrspacecast ptr addrspace(3) %423 to ptr
  %425 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %389
  %426 = addrspacecast ptr addrspace(3) %425 to ptr
  %427 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %388
  %428 = addrspacecast ptr addrspace(3) %427 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %418, ptr %420, ptr %422, ptr %424, ptr %426, ptr %428, ptr %compare_return_buffer86)
  %429 = load i8, ptr %compare_return_buffer86, align 1
  %boolean_predicate87 = icmp ne i8 %429, 0
  br i1 %boolean_predicate87, label %is_smaller_than-true88, label %is_smaller_than-after89

is_smaller_than-after89:                          ; preds = %is_smaller_than-true88, %smaller_comparison_index-true84
  br label %smaller_comparison_index-after85

is_smaller_than-true88:                           ; preds = %smaller_comparison_index-true84
  %430 = load i32, ptr %418, align 4
  %431 = load i32, ptr %420, align 4
  %432 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %388
  store i32 %430, ptr addrspace(3) %432, align 4
  %433 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %389
  store i32 %431, ptr addrspace(3) %433, align 4
  %434 = load i32, ptr %422, align 4
  %435 = load i32, ptr %424, align 4
  %436 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %388
  store i32 %434, ptr addrspace(3) %436, align 4
  %437 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %389
  store i32 %435, ptr addrspace(3) %437, align 4
  %438 = load i32, ptr %426, align 4
  %439 = load i32, ptr %428, align 4
  %440 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %388
  store i32 %438, ptr addrspace(3) %440, align 4
  %441 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %389
  store i32 %439, ptr addrspace(3) %441, align 4
  br label %is_smaller_than-after89

is_last_tile-true90:                              ; preds = %is_last_tile-after77
  %442 = xor i64 %thread.id.x, 15
  %443 = icmp slt i64 %thread.id.x, %442
  %444 = icmp slt i64 %442, 11
  %445 = and i1 %443, %444
  br i1 %445, label %smaller_comparison_index-true93, label %smaller_comparison_index-after94

smaller_comparison_index-after94:                 ; preds = %is_smaller_than-after98, %is_last_tile-true90
  br label %is_last_tile-after92

is_last_tile-false91:                             ; preds = %is_last_tile-after77
  %446 = xor i64 %thread.id.x, 15
  %447 = icmp slt i64 %thread.id.x, %446
  %448 = icmp slt i64 %446, 16
  br i1 true, label %smaller_comparison_index-true99, label %smaller_comparison_index-after100

smaller_comparison_index-after100:                ; preds = %is_smaller_than-after104, %is_last_tile-false91
  br label %is_last_tile-after92

smaller_comparison_index-true93:                  ; preds = %is_last_tile-true90
  %449 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %442
  %450 = addrspacecast ptr addrspace(3) %449 to ptr
  %451 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %thread.id.x
  %452 = addrspacecast ptr addrspace(3) %451 to ptr
  %453 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %442
  %454 = addrspacecast ptr addrspace(3) %453 to ptr
  %455 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %thread.id.x
  %456 = addrspacecast ptr addrspace(3) %455 to ptr
  %457 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %442
  %458 = addrspacecast ptr addrspace(3) %457 to ptr
  %459 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %thread.id.x
  %460 = addrspacecast ptr addrspace(3) %459 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %450, ptr %452, ptr %454, ptr %456, ptr %458, ptr %460, ptr %compare_return_buffer95)
  %461 = load i8, ptr %compare_return_buffer95, align 1
  %boolean_predicate96 = icmp ne i8 %461, 0
  br i1 %boolean_predicate96, label %is_smaller_than-true97, label %is_smaller_than-after98

is_smaller_than-after98:                          ; preds = %is_smaller_than-true97, %smaller_comparison_index-true93
  br label %smaller_comparison_index-after94

is_smaller_than-true97:                           ; preds = %smaller_comparison_index-true93
  %462 = load i32, ptr %450, align 4
  %463 = load i32, ptr %452, align 4
  %464 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %thread.id.x
  store i32 %462, ptr addrspace(3) %464, align 4
  %465 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %442
  store i32 %463, ptr addrspace(3) %465, align 4
  %466 = load i32, ptr %454, align 4
  %467 = load i32, ptr %456, align 4
  %468 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %thread.id.x
  store i32 %466, ptr addrspace(3) %468, align 4
  %469 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %442
  store i32 %467, ptr addrspace(3) %469, align 4
  %470 = load i32, ptr %458, align 4
  %471 = load i32, ptr %460, align 4
  %472 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %thread.id.x
  store i32 %470, ptr addrspace(3) %472, align 4
  %473 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %442
  store i32 %471, ptr addrspace(3) %473, align 4
  br label %is_smaller_than-after98

smaller_comparison_index-true99:                  ; preds = %is_last_tile-false91
  %474 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %446
  %475 = addrspacecast ptr addrspace(3) %474 to ptr
  %476 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %thread.id.x
  %477 = addrspacecast ptr addrspace(3) %476 to ptr
  %478 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %446
  %479 = addrspacecast ptr addrspace(3) %478 to ptr
  %480 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %thread.id.x
  %481 = addrspacecast ptr addrspace(3) %480 to ptr
  %482 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %446
  %483 = addrspacecast ptr addrspace(3) %482 to ptr
  %484 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %thread.id.x
  %485 = addrspacecast ptr addrspace(3) %484 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %475, ptr %477, ptr %479, ptr %481, ptr %483, ptr %485, ptr %compare_return_buffer101)
  %486 = load i8, ptr %compare_return_buffer101, align 1
  %boolean_predicate102 = icmp ne i8 %486, 0
  br i1 %boolean_predicate102, label %is_smaller_than-true103, label %is_smaller_than-after104

is_smaller_than-after104:                         ; preds = %is_smaller_than-true103, %smaller_comparison_index-true99
  br label %smaller_comparison_index-after100

is_smaller_than-true103:                          ; preds = %smaller_comparison_index-true99
  %487 = load i32, ptr %475, align 4
  %488 = load i32, ptr %477, align 4
  %489 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %thread.id.x
  store i32 %487, ptr addrspace(3) %489, align 4
  %490 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %446
  store i32 %488, ptr addrspace(3) %490, align 4
  %491 = load i32, ptr %479, align 4
  %492 = load i32, ptr %481, align 4
  %493 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %thread.id.x
  store i32 %491, ptr addrspace(3) %493, align 4
  %494 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %446
  store i32 %492, ptr addrspace(3) %494, align 4
  %495 = load i32, ptr %483, align 4
  %496 = load i32, ptr %485, align 4
  %497 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %thread.id.x
  store i32 %495, ptr addrspace(3) %497, align 4
  %498 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %446
  store i32 %496, ptr addrspace(3) %498, align 4
  br label %is_smaller_than-after104

is_last_tile-true105:                             ; preds = %is_last_tile-after92
  %499 = udiv i64 %thread.id.x, 4
  %500 = urem i64 %thread.id.x, 4
  %501 = mul i64 %499, 8
  %502 = add i64 %501, %500
  %503 = xor i64 %502, 4
  %504 = icmp slt i64 %502, %503
  %505 = icmp slt i64 %503, 11
  %506 = and i1 %504, %505
  br i1 %506, label %smaller_comparison_index-true108, label %smaller_comparison_index-after109

smaller_comparison_index-after109:                ; preds = %is_smaller_than-after113, %is_last_tile-true105
  br label %is_last_tile-after107

is_last_tile-false106:                            ; preds = %is_last_tile-after92
  %507 = udiv i64 %thread.id.x, 4
  %508 = urem i64 %thread.id.x, 4
  %509 = mul i64 %507, 8
  %510 = add i64 %509, %508
  %511 = xor i64 %510, 4
  %512 = icmp slt i64 %510, %511
  %513 = icmp slt i64 %511, 16
  br i1 true, label %smaller_comparison_index-true114, label %smaller_comparison_index-after115

smaller_comparison_index-after115:                ; preds = %is_smaller_than-after119, %is_last_tile-false106
  br label %is_last_tile-after107

smaller_comparison_index-true108:                 ; preds = %is_last_tile-true105
  %514 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %503
  %515 = addrspacecast ptr addrspace(3) %514 to ptr
  %516 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %502
  %517 = addrspacecast ptr addrspace(3) %516 to ptr
  %518 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %503
  %519 = addrspacecast ptr addrspace(3) %518 to ptr
  %520 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %502
  %521 = addrspacecast ptr addrspace(3) %520 to ptr
  %522 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %503
  %523 = addrspacecast ptr addrspace(3) %522 to ptr
  %524 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %502
  %525 = addrspacecast ptr addrspace(3) %524 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %515, ptr %517, ptr %519, ptr %521, ptr %523, ptr %525, ptr %compare_return_buffer110)
  %526 = load i8, ptr %compare_return_buffer110, align 1
  %boolean_predicate111 = icmp ne i8 %526, 0
  br i1 %boolean_predicate111, label %is_smaller_than-true112, label %is_smaller_than-after113

is_smaller_than-after113:                         ; preds = %is_smaller_than-true112, %smaller_comparison_index-true108
  br label %smaller_comparison_index-after109

is_smaller_than-true112:                          ; preds = %smaller_comparison_index-true108
  %527 = load i32, ptr %515, align 4
  %528 = load i32, ptr %517, align 4
  %529 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %502
  store i32 %527, ptr addrspace(3) %529, align 4
  %530 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %503
  store i32 %528, ptr addrspace(3) %530, align 4
  %531 = load i32, ptr %519, align 4
  %532 = load i32, ptr %521, align 4
  %533 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %502
  store i32 %531, ptr addrspace(3) %533, align 4
  %534 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %503
  store i32 %532, ptr addrspace(3) %534, align 4
  %535 = load i32, ptr %523, align 4
  %536 = load i32, ptr %525, align 4
  %537 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %502
  store i32 %535, ptr addrspace(3) %537, align 4
  %538 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %503
  store i32 %536, ptr addrspace(3) %538, align 4
  br label %is_smaller_than-after113

smaller_comparison_index-true114:                 ; preds = %is_last_tile-false106
  %539 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %511
  %540 = addrspacecast ptr addrspace(3) %539 to ptr
  %541 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %510
  %542 = addrspacecast ptr addrspace(3) %541 to ptr
  %543 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %511
  %544 = addrspacecast ptr addrspace(3) %543 to ptr
  %545 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %510
  %546 = addrspacecast ptr addrspace(3) %545 to ptr
  %547 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %511
  %548 = addrspacecast ptr addrspace(3) %547 to ptr
  %549 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %510
  %550 = addrspacecast ptr addrspace(3) %549 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %540, ptr %542, ptr %544, ptr %546, ptr %548, ptr %550, ptr %compare_return_buffer116)
  %551 = load i8, ptr %compare_return_buffer116, align 1
  %boolean_predicate117 = icmp ne i8 %551, 0
  br i1 %boolean_predicate117, label %is_smaller_than-true118, label %is_smaller_than-after119

is_smaller_than-after119:                         ; preds = %is_smaller_than-true118, %smaller_comparison_index-true114
  br label %smaller_comparison_index-after115

is_smaller_than-true118:                          ; preds = %smaller_comparison_index-true114
  %552 = load i32, ptr %540, align 4
  %553 = load i32, ptr %542, align 4
  %554 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %510
  store i32 %552, ptr addrspace(3) %554, align 4
  %555 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %511
  store i32 %553, ptr addrspace(3) %555, align 4
  %556 = load i32, ptr %544, align 4
  %557 = load i32, ptr %546, align 4
  %558 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %510
  store i32 %556, ptr addrspace(3) %558, align 4
  %559 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %511
  store i32 %557, ptr addrspace(3) %559, align 4
  %560 = load i32, ptr %548, align 4
  %561 = load i32, ptr %550, align 4
  %562 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %510
  store i32 %560, ptr addrspace(3) %562, align 4
  %563 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %511
  store i32 %561, ptr addrspace(3) %563, align 4
  br label %is_smaller_than-after119

is_last_tile-true120:                             ; preds = %is_last_tile-after107
  %564 = udiv i64 %thread.id.x, 2
  %565 = urem i64 %thread.id.x, 2
  %566 = mul i64 %564, 4
  %567 = add i64 %566, %565
  %568 = xor i64 %567, 2
  %569 = icmp slt i64 %567, %568
  %570 = icmp slt i64 %568, 11
  %571 = and i1 %569, %570
  br i1 %571, label %smaller_comparison_index-true123, label %smaller_comparison_index-after124

smaller_comparison_index-after124:                ; preds = %is_smaller_than-after128, %is_last_tile-true120
  br label %is_last_tile-after122

is_last_tile-false121:                            ; preds = %is_last_tile-after107
  %572 = udiv i64 %thread.id.x, 2
  %573 = urem i64 %thread.id.x, 2
  %574 = mul i64 %572, 4
  %575 = add i64 %574, %573
  %576 = xor i64 %575, 2
  %577 = icmp slt i64 %575, %576
  %578 = icmp slt i64 %576, 16
  br i1 true, label %smaller_comparison_index-true129, label %smaller_comparison_index-after130

smaller_comparison_index-after130:                ; preds = %is_smaller_than-after134, %is_last_tile-false121
  br label %is_last_tile-after122

smaller_comparison_index-true123:                 ; preds = %is_last_tile-true120
  %579 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %568
  %580 = addrspacecast ptr addrspace(3) %579 to ptr
  %581 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %567
  %582 = addrspacecast ptr addrspace(3) %581 to ptr
  %583 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %568
  %584 = addrspacecast ptr addrspace(3) %583 to ptr
  %585 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %567
  %586 = addrspacecast ptr addrspace(3) %585 to ptr
  %587 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %568
  %588 = addrspacecast ptr addrspace(3) %587 to ptr
  %589 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %567
  %590 = addrspacecast ptr addrspace(3) %589 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %580, ptr %582, ptr %584, ptr %586, ptr %588, ptr %590, ptr %compare_return_buffer125)
  %591 = load i8, ptr %compare_return_buffer125, align 1
  %boolean_predicate126 = icmp ne i8 %591, 0
  br i1 %boolean_predicate126, label %is_smaller_than-true127, label %is_smaller_than-after128

is_smaller_than-after128:                         ; preds = %is_smaller_than-true127, %smaller_comparison_index-true123
  br label %smaller_comparison_index-after124

is_smaller_than-true127:                          ; preds = %smaller_comparison_index-true123
  %592 = load i32, ptr %580, align 4
  %593 = load i32, ptr %582, align 4
  %594 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %567
  store i32 %592, ptr addrspace(3) %594, align 4
  %595 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %568
  store i32 %593, ptr addrspace(3) %595, align 4
  %596 = load i32, ptr %584, align 4
  %597 = load i32, ptr %586, align 4
  %598 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %567
  store i32 %596, ptr addrspace(3) %598, align 4
  %599 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %568
  store i32 %597, ptr addrspace(3) %599, align 4
  %600 = load i32, ptr %588, align 4
  %601 = load i32, ptr %590, align 4
  %602 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %567
  store i32 %600, ptr addrspace(3) %602, align 4
  %603 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %568
  store i32 %601, ptr addrspace(3) %603, align 4
  br label %is_smaller_than-after128

smaller_comparison_index-true129:                 ; preds = %is_last_tile-false121
  %604 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %576
  %605 = addrspacecast ptr addrspace(3) %604 to ptr
  %606 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %575
  %607 = addrspacecast ptr addrspace(3) %606 to ptr
  %608 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %576
  %609 = addrspacecast ptr addrspace(3) %608 to ptr
  %610 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %575
  %611 = addrspacecast ptr addrspace(3) %610 to ptr
  %612 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %576
  %613 = addrspacecast ptr addrspace(3) %612 to ptr
  %614 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %575
  %615 = addrspacecast ptr addrspace(3) %614 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %605, ptr %607, ptr %609, ptr %611, ptr %613, ptr %615, ptr %compare_return_buffer131)
  %616 = load i8, ptr %compare_return_buffer131, align 1
  %boolean_predicate132 = icmp ne i8 %616, 0
  br i1 %boolean_predicate132, label %is_smaller_than-true133, label %is_smaller_than-after134

is_smaller_than-after134:                         ; preds = %is_smaller_than-true133, %smaller_comparison_index-true129
  br label %smaller_comparison_index-after130

is_smaller_than-true133:                          ; preds = %smaller_comparison_index-true129
  %617 = load i32, ptr %605, align 4
  %618 = load i32, ptr %607, align 4
  %619 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %575
  store i32 %617, ptr addrspace(3) %619, align 4
  %620 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %576
  store i32 %618, ptr addrspace(3) %620, align 4
  %621 = load i32, ptr %609, align 4
  %622 = load i32, ptr %611, align 4
  %623 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %575
  store i32 %621, ptr addrspace(3) %623, align 4
  %624 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %576
  store i32 %622, ptr addrspace(3) %624, align 4
  %625 = load i32, ptr %613, align 4
  %626 = load i32, ptr %615, align 4
  %627 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %575
  store i32 %625, ptr addrspace(3) %627, align 4
  %628 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %576
  store i32 %626, ptr addrspace(3) %628, align 4
  br label %is_smaller_than-after134

is_last_tile-true135:                             ; preds = %is_last_tile-after122
  %629 = mul i64 %thread.id.x, 2
  %630 = xor i64 %629, 1
  %631 = icmp slt i64 %629, %630
  %632 = icmp slt i64 %630, 11
  %633 = and i1 %631, %632
  br i1 %633, label %smaller_comparison_index-true138, label %smaller_comparison_index-after139

smaller_comparison_index-after139:                ; preds = %is_smaller_than-after143, %is_last_tile-true135
  br label %is_last_tile-after137

is_last_tile-false136:                            ; preds = %is_last_tile-after122
  %634 = mul i64 %thread.id.x, 2
  %635 = xor i64 %634, 1
  %636 = icmp slt i64 %634, %635
  %637 = icmp slt i64 %635, 16
  br i1 true, label %smaller_comparison_index-true144, label %smaller_comparison_index-after145

smaller_comparison_index-after145:                ; preds = %is_smaller_than-after149, %is_last_tile-false136
  br label %is_last_tile-after137

smaller_comparison_index-true138:                 ; preds = %is_last_tile-true135
  %638 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %630
  %639 = addrspacecast ptr addrspace(3) %638 to ptr
  %640 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %629
  %641 = addrspacecast ptr addrspace(3) %640 to ptr
  %642 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %630
  %643 = addrspacecast ptr addrspace(3) %642 to ptr
  %644 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %629
  %645 = addrspacecast ptr addrspace(3) %644 to ptr
  %646 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %630
  %647 = addrspacecast ptr addrspace(3) %646 to ptr
  %648 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %629
  %649 = addrspacecast ptr addrspace(3) %648 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %639, ptr %641, ptr %643, ptr %645, ptr %647, ptr %649, ptr %compare_return_buffer140)
  %650 = load i8, ptr %compare_return_buffer140, align 1
  %boolean_predicate141 = icmp ne i8 %650, 0
  br i1 %boolean_predicate141, label %is_smaller_than-true142, label %is_smaller_than-after143

is_smaller_than-after143:                         ; preds = %is_smaller_than-true142, %smaller_comparison_index-true138
  br label %smaller_comparison_index-after139

is_smaller_than-true142:                          ; preds = %smaller_comparison_index-true138
  %651 = load i32, ptr %639, align 4
  %652 = load i32, ptr %641, align 4
  %653 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %629
  store i32 %651, ptr addrspace(3) %653, align 4
  %654 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %630
  store i32 %652, ptr addrspace(3) %654, align 4
  %655 = load i32, ptr %643, align 4
  %656 = load i32, ptr %645, align 4
  %657 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %629
  store i32 %655, ptr addrspace(3) %657, align 4
  %658 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %630
  store i32 %656, ptr addrspace(3) %658, align 4
  %659 = load i32, ptr %647, align 4
  %660 = load i32, ptr %649, align 4
  %661 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %629
  store i32 %659, ptr addrspace(3) %661, align 4
  %662 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %630
  store i32 %660, ptr addrspace(3) %662, align 4
  br label %is_smaller_than-after143

smaller_comparison_index-true144:                 ; preds = %is_last_tile-false136
  %663 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %635
  %664 = addrspacecast ptr addrspace(3) %663 to ptr
  %665 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %634
  %666 = addrspacecast ptr addrspace(3) %665 to ptr
  %667 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %635
  %668 = addrspacecast ptr addrspace(3) %667 to ptr
  %669 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %634
  %670 = addrspacecast ptr addrspace(3) %669 to ptr
  %671 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %635
  %672 = addrspacecast ptr addrspace(3) %671 to ptr
  %673 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %634
  %674 = addrspacecast ptr addrspace(3) %673 to ptr
  call void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr %664, ptr %666, ptr %668, ptr %670, ptr %672, ptr %674, ptr %compare_return_buffer146)
  %675 = load i8, ptr %compare_return_buffer146, align 1
  %boolean_predicate147 = icmp ne i8 %675, 0
  br i1 %boolean_predicate147, label %is_smaller_than-true148, label %is_smaller_than-after149

is_smaller_than-after149:                         ; preds = %is_smaller_than-true148, %smaller_comparison_index-true144
  br label %smaller_comparison_index-after145

is_smaller_than-true148:                          ; preds = %smaller_comparison_index-true144
  %676 = load i32, ptr %664, align 4
  %677 = load i32, ptr %666, align 4
  %678 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %634
  store i32 %676, ptr addrspace(3) %678, align 4
  %679 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %635
  store i32 %677, ptr addrspace(3) %679, align 4
  %680 = load i32, ptr %668, align 4
  %681 = load i32, ptr %670, align 4
  %682 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %634
  store i32 %680, ptr addrspace(3) %682, align 4
  %683 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %635
  store i32 %681, ptr addrspace(3) %683, align 4
  %684 = load i32, ptr %672, align 4
  %685 = load i32, ptr %674, align 4
  %686 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %634
  store i32 %684, ptr addrspace(3) %686, align 4
  %687 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %635
  store i32 %685, ptr addrspace(3) %687, align 4
  br label %is_smaller_than-after149

smaller_keys_index-true150:                       ; preds = %is_last_tile-after137
  %688 = shl i64 %thread.id.x, 1
  %689 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %688
  %690 = load i32, ptr addrspace(3) %689, align 4
  %691 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %34
  store i32 %690, ptr %691, align 4
  %692 = add i64 %34, 1
  %693 = icmp slt i64 %692, 11
  br i1 %693, label %inner_smaller_keys_index-true152, label %inner_smaller_keys_index-after153

inner_smaller_keys_index-after153:                ; preds = %inner_smaller_keys_index-true152, %smaller_keys_index-true150
  br label %smaller_keys_index-after151

inner_smaller_keys_index-true152:                 ; preds = %smaller_keys_index-true150
  %694 = add i64 %688, 1
  %695 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %694
  %696 = load i32, ptr addrspace(3) %695, align 4
  %697 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %692
  store i32 %696, ptr %697, align 4
  br label %inner_smaller_keys_index-after153

smaller_keys_index-true154:                       ; preds = %smaller_keys_index-after151
  %698 = shl i64 %thread.id.x, 1
  %699 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %698
  %700 = load i32, ptr addrspace(3) %699, align 4
  %701 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %36
  store i32 %700, ptr %701, align 4
  %702 = add i64 %36, 1
  %703 = icmp slt i64 %702, 11
  br i1 %703, label %inner_smaller_keys_index-true156, label %inner_smaller_keys_index-after157

inner_smaller_keys_index-after157:                ; preds = %inner_smaller_keys_index-true156, %smaller_keys_index-true154
  br label %smaller_keys_index-after155

inner_smaller_keys_index-true156:                 ; preds = %smaller_keys_index-true154
  %704 = add i64 %698, 1
  %705 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %704
  %706 = load i32, ptr addrspace(3) %705, align 4
  %707 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %702
  store i32 %706, ptr %707, align 4
  br label %inner_smaller_keys_index-after157

smaller_keys_index-true158:                       ; preds = %smaller_keys_index-after155
  %708 = shl i64 %thread.id.x, 1
  %709 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %708
  %710 = load i32, ptr addrspace(3) %709, align 4
  %711 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %38
  store i32 %710, ptr %711, align 4
  %712 = add i64 %38, 1
  %713 = icmp slt i64 %712, 11
  br i1 %713, label %inner_smaller_keys_index-true160, label %inner_smaller_keys_index-after161

inner_smaller_keys_index-after161:                ; preds = %inner_smaller_keys_index-true160, %smaller_keys_index-true158
  br label %smaller_keys_index-after159

inner_smaller_keys_index-true160:                 ; preds = %smaller_keys_index-true158
  %714 = add i64 %708, 1
  %715 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %714
  %716 = load i32, ptr addrspace(3) %715, align 4
  %717 = getelementptr inbounds [1536 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %712
  store i32 %716, ptr %717, align 4
  br label %inner_smaller_keys_index-after161
}

define internal void @region_0_1446_clone_1_clone_64dc19b37a80_8e8c20831bdb3683(ptr dereferenceable(4) %0, ptr dereferenceable(4) %1, ptr dereferenceable(4) %2, ptr dereferenceable(4) %3, ptr dereferenceable(4) %4, ptr dereferenceable(4) %5, ptr dereferenceable(1) %output_arg) {
entry:
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i8, align 1
  %9 = alloca i8, align 1
  %10 = alloca i8, align 1
  %Arg_0.103 = load i32, ptr %0, align 4
  %Arg_1.97 = load i32, ptr %1, align 4
  %11 = icmp ult i32 %Arg_0.103, %Arg_1.97
  %12 = zext i1 %11 to i8
  store i8 %12, ptr %9, align 1
  %Arg_1.971 = load i32, ptr %1, align 4
  %Arg_0.1032 = load i32, ptr %0, align 4
  %13 = icmp ult i32 %Arg_1.971, %Arg_0.1032
  %14 = zext i1 %13 to i8
  store i8 %14, ptr %8, align 1
  %compare.246.0 = load i8, ptr %9, align 1
  %compare.247.0 = load i8, ptr %8, align 1
  %15 = icmp eq i8 %compare.246.0, %compare.247.0
  %16 = zext i1 %15 to i8
  store i8 %16, ptr %7, align 1
  %p.2.lhs.clone.2 = load i32, ptr %4, align 4
  %p.2.rhs.clone.2 = load i32, ptr %5, align 4
  %17 = icmp slt i32 %p.2.lhs.clone.2, %p.2.rhs.clone.2
  %18 = zext i1 %17 to i8
  store i8 %18, ptr %6, align 1
  %compare.248.0 = load i8, ptr %7, align 1
  %compare.249.0 = load i8, ptr %6, align 1
  %compare.246.03 = load i8, ptr %9, align 1
  %19 = trunc i8 %compare.248.0 to i1
  %20 = select i1 %19, i8 %compare.249.0, i8 %compare.246.03
  store i8 %20, ptr %10, align 1
  %load_ret_value = load i8, ptr %10, align 1
  store i8 %load_ret_value, ptr %output_arg, align 1
  ret void
}

define ptx_kernel void @input_concatenate_fusion_3(ptr noalias align 256 dereferenceable(67584) %0, ptr noalias align 256 dereferenceable(67584) %1, ptr noalias align 256 dereferenceable(86016) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %6 = mul i32 %5, 128
  %7 = add i32 %6, %4
  %8 = udiv i32 %7, 7
  %9 = urem i32 %7, 7
  %10 = mul i32 %8, 11
  %11 = add i32 %10, %9
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = call i32 @fused_concatenate_3_broadcast_123_10(ptr %0, ptr %1, i32 %8, i32 %9)
  %15 = mul i32 %13, %14
  %16 = add i32 %15, 1
  %17 = call i32 @fused_concatenate_3__epilogue__concatenate_1460_1(ptr %0, ptr %1, i32 %8, i32 %9, i32 %16)
  %18 = mul i32 %8, 14
  %19 = add i32 %18, %9
  %20 = getelementptr inbounds i32, ptr %2, i32 %19
  store i32 %17, ptr %20, align 4
  %21 = add i32 %9, 7
  %22 = getelementptr inbounds i32, ptr %0, i32 %11
  %23 = load i32, ptr %22, align 4, !invariant.load !3
  %24 = call i32 @fused_concatenate_3_broadcast_123_10(ptr %0, ptr %1, i32 %8, i32 %9)
  %25 = mul i32 %23, %24
  %26 = add i32 %25, 13
  %27 = call i32 @fused_concatenate_3__epilogue__concatenate_1460_1(ptr %0, ptr %1, i32 %8, i32 %21, i32 %26)
  %28 = add i32 %19, 7
  %29 = getelementptr inbounds i32, ptr %2, i32 %28
  store i32 %27, ptr %29, align 4
  ret void
}

define internal i32 @fused_concatenate_3_broadcast_123_10(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 15
}

define internal i32 @fused_concatenate_3__epilogue__concatenate_1460_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4) {
  ret i32 %4
}

define ptx_kernel void @loop_convert_fusion(ptr noalias align 256 dereferenceable(12288) %0, ptr noalias align 256 dereferenceable(12288) %1, ptr noalias align 256 dereferenceable(86016) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = mul i32 %4, 128
  %7 = add i32 %6, %5
  %8 = udiv i32 %7, 14
  %9 = urem i32 %7, 14
  %10 = call i32 @fused_convert_bitcast_1257_6(ptr %0, ptr %1, i32 1, i32 %8)
  %11 = add i32 %9, %10
  %12 = shl i32 %11, 13
  %13 = lshr i32 %11, 19
  %14 = sext i32 %9 to i64
  %15 = lshr i64 %14, 32
  %16 = trunc i64 %15 to i32
  %17 = call i32 @fused_convert_bitcast_1257_6(ptr %0, ptr %1, i32 0, i32 %8)
  %18 = add i32 %16, %17
  %19 = or i32 %12, %13
  %20 = add i32 %18, %11
  %21 = xor i32 %20, %19
  %22 = shl i32 %21, 15
  %23 = lshr i32 %21, 17
  %24 = call i32 @fused_convert_bitcast_1273_6(ptr %0, ptr %1, i32 1, i32 %8)
  %25 = add i32 %9, %24
  %26 = shl i32 %25, 13
  %27 = lshr i32 %25, 19
  %28 = or i32 %22, %23
  %29 = add i32 %20, %21
  %30 = xor i32 %29, %28
  %31 = shl i32 %30, 26
  %32 = lshr i32 %30, 6
  %33 = add i32 %29, %30
  %34 = or i32 %31, %32
  %35 = xor i32 %33, %34
  %36 = shl i32 %35, 6
  %37 = lshr i32 %35, 26
  %38 = call i32 @fused_convert_bitcast_1273_6(ptr %0, ptr %1, i32 0, i32 %8)
  %39 = add i32 %16, %38
  %40 = or i32 %26, %27
  %41 = add i32 %39, %25
  %42 = xor i32 %41, %40
  %43 = shl i32 %42, 15
  %44 = lshr i32 %42, 17
  %45 = or i32 %36, %37
  %46 = or i32 %43, %44
  %47 = add i32 %41, %42
  %48 = xor i32 %47, %46
  %49 = shl i32 %48, 26
  %50 = lshr i32 %48, 6
  %51 = add i32 %47, %48
  %52 = or i32 %49, %50
  %53 = xor i32 %51, %52
  %54 = shl i32 %53, 6
  %55 = lshr i32 %53, 26
  %56 = add i32 %33, %35
  %57 = xor i32 %56, %45
  %58 = or i32 %54, %55
  %59 = xor i32 %17, %10
  %60 = xor i32 %59, 466688986
  %61 = add i32 %57, %60
  %62 = add i32 %61, 1
  %63 = shl i32 %62, 17
  %64 = lshr i32 %62, 15
  %65 = add i32 %51, %53
  %66 = xor i32 %65, %58
  %67 = add i32 %56, %10
  %68 = or i32 %63, %64
  %69 = add i32 %67, %62
  %70 = xor i32 %69, %68
  %71 = shl i32 %70, 29
  %72 = lshr i32 %70, 3
  %73 = xor i32 %38, %24
  %74 = xor i32 %73, 466688986
  %75 = add i32 %66, %74
  %76 = add i32 %75, 1
  %77 = shl i32 %76, 17
  %78 = lshr i32 %76, 15
  %79 = or i32 %71, %72
  %80 = add i32 %69, %70
  %81 = xor i32 %80, %79
  %82 = shl i32 %81, 16
  %83 = lshr i32 %81, 16
  %84 = add i32 %80, %81
  %85 = or i32 %82, %83
  %86 = xor i32 %84, %85
  %87 = shl i32 %86, 24
  %88 = lshr i32 %86, 8
  %89 = add i32 %65, %24
  %90 = or i32 %77, %78
  %91 = add i32 %89, %76
  %92 = xor i32 %91, %90
  %93 = shl i32 %92, 29
  %94 = lshr i32 %92, 3
  %95 = or i32 %87, %88
  %96 = or i32 %93, %94
  %97 = add i32 %91, %92
  %98 = xor i32 %97, %96
  %99 = shl i32 %98, 16
  %100 = lshr i32 %98, 16
  %101 = add i32 %97, %98
  %102 = or i32 %99, %100
  %103 = xor i32 %101, %102
  %104 = shl i32 %103, 24
  %105 = lshr i32 %103, 8
  %106 = add i32 %84, %86
  %107 = xor i32 %106, %95
  %108 = or i32 %104, %105
  %109 = add i32 %107, %17
  %110 = add i32 %109, 2
  %111 = shl i32 %110, 13
  %112 = lshr i32 %110, 19
  %113 = add i32 %101, %103
  %114 = xor i32 %113, %108
  %115 = add i32 %106, %60
  %116 = or i32 %111, %112
  %117 = add i32 %115, %110
  %118 = xor i32 %117, %116
  %119 = shl i32 %118, 15
  %120 = lshr i32 %118, 17
  %121 = add i32 %114, %38
  %122 = add i32 %121, 2
  %123 = shl i32 %122, 13
  %124 = lshr i32 %122, 19
  %125 = or i32 %119, %120
  %126 = add i32 %117, %118
  %127 = xor i32 %126, %125
  %128 = shl i32 %127, 26
  %129 = lshr i32 %127, 6
  %130 = add i32 %126, %127
  %131 = or i32 %128, %129
  %132 = xor i32 %130, %131
  %133 = shl i32 %132, 6
  %134 = lshr i32 %132, 26
  %135 = add i32 %113, %74
  %136 = or i32 %123, %124
  %137 = add i32 %135, %122
  %138 = xor i32 %137, %136
  %139 = shl i32 %138, 15
  %140 = lshr i32 %138, 17
  %141 = or i32 %133, %134
  %142 = or i32 %139, %140
  %143 = add i32 %137, %138
  %144 = xor i32 %143, %142
  %145 = shl i32 %144, 26
  %146 = lshr i32 %144, 6
  %147 = add i32 %143, %144
  %148 = or i32 %145, %146
  %149 = xor i32 %147, %148
  %150 = shl i32 %149, 6
  %151 = lshr i32 %149, 26
  %152 = add i32 %130, %132
  %153 = xor i32 %152, %141
  %154 = or i32 %150, %151
  %155 = add i32 %153, %10
  %156 = add i32 %155, 3
  %157 = shl i32 %156, 17
  %158 = lshr i32 %156, 15
  %159 = add i32 %147, %149
  %160 = xor i32 %159, %154
  %161 = add i32 %152, %17
  %162 = or i32 %157, %158
  %163 = add i32 %161, %156
  %164 = xor i32 %163, %162
  %165 = shl i32 %164, 29
  %166 = lshr i32 %164, 3
  %167 = add i32 %160, %24
  %168 = add i32 %167, 3
  %169 = shl i32 %168, 17
  %170 = lshr i32 %168, 15
  %171 = or i32 %165, %166
  %172 = add i32 %163, %164
  %173 = xor i32 %172, %171
  %174 = shl i32 %173, 16
  %175 = lshr i32 %173, 16
  %176 = add i32 %172, %173
  %177 = or i32 %174, %175
  %178 = xor i32 %176, %177
  %179 = shl i32 %178, 24
  %180 = lshr i32 %178, 8
  %181 = add i32 %159, %38
  %182 = or i32 %169, %170
  %183 = add i32 %181, %168
  %184 = xor i32 %183, %182
  %185 = shl i32 %184, 29
  %186 = lshr i32 %184, 3
  %187 = or i32 %179, %180
  %188 = or i32 %185, %186
  %189 = add i32 %183, %184
  %190 = xor i32 %189, %188
  %191 = shl i32 %190, 16
  %192 = lshr i32 %190, 16
  %193 = add i32 %189, %190
  %194 = or i32 %191, %192
  %195 = xor i32 %193, %194
  %196 = shl i32 %195, 24
  %197 = lshr i32 %195, 8
  %198 = add i32 %176, %178
  %199 = xor i32 %198, %187
  %200 = or i32 %196, %197
  %201 = add i32 %199, %60
  %202 = add i32 %201, 4
  %203 = shl i32 %202, 13
  %204 = lshr i32 %202, 19
  %205 = add i32 %193, %195
  %206 = xor i32 %205, %200
  %207 = add i32 %198, %10
  %208 = or i32 %203, %204
  %209 = add i32 %207, %202
  %210 = xor i32 %209, %208
  %211 = shl i32 %210, 15
  %212 = lshr i32 %210, 17
  %213 = add i32 %206, %74
  %214 = add i32 %213, 4
  %215 = shl i32 %214, 13
  %216 = lshr i32 %214, 19
  %217 = or i32 %211, %212
  %218 = add i32 %209, %210
  %219 = xor i32 %218, %217
  %220 = shl i32 %219, 26
  %221 = lshr i32 %219, 6
  %222 = add i32 %218, %219
  %223 = or i32 %220, %221
  %224 = xor i32 %222, %223
  %225 = shl i32 %224, 6
  %226 = lshr i32 %224, 26
  %227 = add i32 %205, %24
  %228 = or i32 %215, %216
  %229 = add i32 %227, %214
  %230 = xor i32 %229, %228
  %231 = shl i32 %230, 15
  %232 = lshr i32 %230, 17
  %233 = or i32 %225, %226
  %234 = or i32 %231, %232
  %235 = add i32 %229, %230
  %236 = xor i32 %235, %234
  %237 = shl i32 %236, 26
  %238 = lshr i32 %236, 6
  %239 = add i32 %235, %236
  %240 = or i32 %237, %238
  %241 = xor i32 %239, %240
  %242 = shl i32 %241, 6
  %243 = lshr i32 %241, 26
  %244 = add i32 %222, %224
  %245 = xor i32 %244, %233
  %246 = or i32 %242, %243
  %247 = add i32 %245, %17
  %248 = add i32 %239, %241
  %249 = xor i32 %248, %246
  %250 = add i32 %244, %60
  %251 = add i32 %247, 5
  %252 = add i32 %249, %38
  %253 = xor i32 %250, %251
  %254 = add i32 %248, %74
  %255 = add i32 %252, 5
  %256 = urem i32 %253, 101
  %257 = xor i32 %254, %255
  %258 = mul i32 %256, 68
  %259 = urem i32 %257, 101
  %260 = add i32 %258, %259
  %261 = urem i32 %260, 101
  %262 = getelementptr inbounds i32, ptr %2, i32 %7
  store i32 %261, ptr %262, align 4
  ret void
}

define internal i32 @fused_convert_bitcast_1257_6(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_convert_concatenate_137_17(ptr %0, ptr %1, i32 %2, i32 0, i32 %3)
  ret i32 %5
}

define internal i32 @fused_convert_bitcast_1273_6(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_convert_concatenate_137_17(ptr %0, ptr %1, i32 %2, i32 1, i32 %3)
  ret i32 %5
}

define internal i32 @fused_convert_concatenate_137_17(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4) {
  %6 = icmp ult i32 %2, 1
  br i1 %6, label %7, label %12

7:                                                ; preds = %5
  %8 = mul i32 %3, 1536
  %9 = add i32 %8, %4
  %10 = getelementptr inbounds i32, ptr %1, i32 %9
  %11 = load i32, ptr %10, align 4, !invariant.load !3
  br label %17

12:                                               ; preds = %5
  %13 = mul i32 %3, 1536
  %14 = add i32 %13, %4
  %15 = getelementptr inbounds i32, ptr %0, i32 %14
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  br label %17

17:                                               ; preds = %7, %12
  %18 = phi i32 [ %16, %12 ], [ %11, %7 ]
  br label %19

19:                                               ; preds = %17
  ret i32 %18
}

define ptx_kernel void @loop_divide_fusion(ptr noalias align 256 dereferenceable(73728) %0, ptr noalias align 256 dereferenceable(12288) %1, ptr noalias align 256 dereferenceable(12288) %2, ptr noalias align 256 dereferenceable(6144) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = mul i32 %5, 128
  %8 = add i32 %7, %6
  %9 = call i32 @fused_divide_bitcast_891_76(ptr %0, ptr %1, ptr %2, i32 1, i32 %8)
  %10 = shl i32 %9, 13
  %11 = lshr i32 %9, 19
  %12 = call i32 @fused_divide_bitcast_74_26(ptr %0, ptr %1, ptr %2, i32 %8, i32 1)
  %13 = shl i32 %12, 13
  %14 = lshr i32 %12, 19
  %15 = or i32 %10, %11
  %16 = call i32 @fused_divide_bitcast_891_76(ptr %0, ptr %1, ptr %2, i32 0, i32 %8)
  %17 = add i32 %16, %9
  %18 = xor i32 %17, %15
  %19 = shl i32 %18, 15
  %20 = lshr i32 %18, 17
  %21 = call i32 @fused_divide_bitcast_900_76(ptr %0, ptr %1, ptr %2, i32 1, i32 %8)
  %22 = shl i32 %21, 13
  %23 = lshr i32 %21, 19
  %24 = or i32 %13, %14
  %25 = call i32 @fused_divide_bitcast_74_26(ptr %0, ptr %1, ptr %2, i32 %8, i32 0)
  %26 = add i32 %25, %12
  %27 = xor i32 %26, %24
  %28 = shl i32 %27, 15
  %29 = lshr i32 %27, 17
  %30 = or i32 %19, %20
  %31 = add i32 %17, %18
  %32 = xor i32 %31, %30
  %33 = shl i32 %32, 26
  %34 = lshr i32 %32, 6
  %35 = add i32 %31, %32
  %36 = or i32 %33, %34
  %37 = xor i32 %35, %36
  %38 = shl i32 %37, 6
  %39 = lshr i32 %37, 26
  %40 = or i32 %22, %23
  %41 = call i32 @fused_divide_bitcast_900_76(ptr %0, ptr %1, ptr %2, i32 0, i32 %8)
  %42 = add i32 %41, %21
  %43 = xor i32 %42, %40
  %44 = shl i32 %43, 15
  %45 = lshr i32 %43, 17
  %46 = or i32 %28, %29
  %47 = add i32 %26, %27
  %48 = xor i32 %47, %46
  %49 = shl i32 %48, 26
  %50 = lshr i32 %48, 6
  %51 = add i32 %47, %48
  %52 = or i32 %49, %50
  %53 = xor i32 %51, %52
  %54 = shl i32 %53, 6
  %55 = lshr i32 %53, 26
  %56 = or i32 %38, %39
  %57 = or i32 %44, %45
  %58 = add i32 %42, %43
  %59 = xor i32 %58, %57
  %60 = shl i32 %59, 26
  %61 = lshr i32 %59, 6
  %62 = add i32 %58, %59
  %63 = or i32 %60, %61
  %64 = xor i32 %62, %63
  %65 = shl i32 %64, 6
  %66 = lshr i32 %64, 26
  %67 = or i32 %54, %55
  %68 = add i32 %35, %37
  %69 = xor i32 %68, %56
  %70 = or i32 %65, %66
  %71 = add i32 %51, %53
  %72 = xor i32 %71, %67
  %73 = xor i32 %16, %9
  %74 = xor i32 %73, 466688986
  %75 = add i32 %69, %74
  %76 = add i32 %75, 1
  %77 = shl i32 %76, 17
  %78 = lshr i32 %76, 15
  %79 = add i32 %62, %64
  %80 = xor i32 %79, %70
  %81 = xor i32 %25, %12
  %82 = xor i32 %81, 466688986
  %83 = add i32 %72, %82
  %84 = add i32 %83, 1
  %85 = shl i32 %84, 17
  %86 = lshr i32 %84, 15
  %87 = add i32 %68, %9
  %88 = or i32 %77, %78
  %89 = add i32 %87, %76
  %90 = xor i32 %89, %88
  %91 = shl i32 %90, 29
  %92 = lshr i32 %90, 3
  %93 = xor i32 %41, %21
  %94 = xor i32 %93, 466688986
  %95 = add i32 %80, %94
  %96 = add i32 %95, 1
  %97 = shl i32 %96, 17
  %98 = lshr i32 %96, 15
  %99 = add i32 %71, %12
  %100 = or i32 %85, %86
  %101 = add i32 %99, %84
  %102 = xor i32 %101, %100
  %103 = shl i32 %102, 29
  %104 = lshr i32 %102, 3
  %105 = or i32 %91, %92
  %106 = add i32 %89, %90
  %107 = xor i32 %106, %105
  %108 = shl i32 %107, 16
  %109 = lshr i32 %107, 16
  %110 = add i32 %106, %107
  %111 = or i32 %108, %109
  %112 = xor i32 %110, %111
  %113 = shl i32 %112, 24
  %114 = lshr i32 %112, 8
  %115 = add i32 %79, %21
  %116 = or i32 %97, %98
  %117 = add i32 %115, %96
  %118 = xor i32 %117, %116
  %119 = shl i32 %118, 29
  %120 = lshr i32 %118, 3
  %121 = or i32 %103, %104
  %122 = add i32 %101, %102
  %123 = xor i32 %122, %121
  %124 = shl i32 %123, 16
  %125 = lshr i32 %123, 16
  %126 = add i32 %122, %123
  %127 = or i32 %124, %125
  %128 = xor i32 %126, %127
  %129 = shl i32 %128, 24
  %130 = lshr i32 %128, 8
  %131 = or i32 %113, %114
  %132 = or i32 %119, %120
  %133 = add i32 %117, %118
  %134 = xor i32 %133, %132
  %135 = shl i32 %134, 16
  %136 = lshr i32 %134, 16
  %137 = add i32 %133, %134
  %138 = or i32 %135, %136
  %139 = xor i32 %137, %138
  %140 = shl i32 %139, 24
  %141 = lshr i32 %139, 8
  %142 = or i32 %129, %130
  %143 = add i32 %110, %112
  %144 = xor i32 %143, %131
  %145 = or i32 %140, %141
  %146 = add i32 %126, %128
  %147 = xor i32 %146, %142
  %148 = add i32 %144, %16
  %149 = add i32 %148, 2
  %150 = shl i32 %149, 13
  %151 = lshr i32 %149, 19
  %152 = add i32 %137, %139
  %153 = xor i32 %152, %145
  %154 = add i32 %147, %25
  %155 = add i32 %154, 2
  %156 = shl i32 %155, 13
  %157 = lshr i32 %155, 19
  %158 = add i32 %143, %74
  %159 = or i32 %150, %151
  %160 = add i32 %158, %149
  %161 = xor i32 %160, %159
  %162 = shl i32 %161, 15
  %163 = lshr i32 %161, 17
  %164 = add i32 %153, %41
  %165 = add i32 %164, 2
  %166 = shl i32 %165, 13
  %167 = lshr i32 %165, 19
  %168 = add i32 %146, %82
  %169 = or i32 %156, %157
  %170 = add i32 %168, %155
  %171 = xor i32 %170, %169
  %172 = shl i32 %171, 15
  %173 = lshr i32 %171, 17
  %174 = or i32 %162, %163
  %175 = add i32 %160, %161
  %176 = xor i32 %175, %174
  %177 = shl i32 %176, 26
  %178 = lshr i32 %176, 6
  %179 = add i32 %175, %176
  %180 = or i32 %177, %178
  %181 = xor i32 %179, %180
  %182 = shl i32 %181, 6
  %183 = lshr i32 %181, 26
  %184 = add i32 %152, %94
  %185 = or i32 %166, %167
  %186 = add i32 %184, %165
  %187 = xor i32 %186, %185
  %188 = shl i32 %187, 15
  %189 = lshr i32 %187, 17
  %190 = or i32 %172, %173
  %191 = add i32 %170, %171
  %192 = xor i32 %191, %190
  %193 = shl i32 %192, 26
  %194 = lshr i32 %192, 6
  %195 = add i32 %191, %192
  %196 = or i32 %193, %194
  %197 = xor i32 %195, %196
  %198 = shl i32 %197, 6
  %199 = lshr i32 %197, 26
  %200 = or i32 %182, %183
  %201 = or i32 %188, %189
  %202 = add i32 %186, %187
  %203 = xor i32 %202, %201
  %204 = shl i32 %203, 26
  %205 = lshr i32 %203, 6
  %206 = add i32 %202, %203
  %207 = or i32 %204, %205
  %208 = xor i32 %206, %207
  %209 = shl i32 %208, 6
  %210 = lshr i32 %208, 26
  %211 = or i32 %198, %199
  %212 = add i32 %179, %181
  %213 = xor i32 %212, %200
  %214 = or i32 %209, %210
  %215 = add i32 %195, %197
  %216 = xor i32 %215, %211
  %217 = add i32 %213, %9
  %218 = add i32 %217, 3
  %219 = shl i32 %218, 17
  %220 = lshr i32 %218, 15
  %221 = add i32 %206, %208
  %222 = xor i32 %221, %214
  %223 = add i32 %216, %12
  %224 = add i32 %223, 3
  %225 = shl i32 %224, 17
  %226 = lshr i32 %224, 15
  %227 = add i32 %212, %16
  %228 = or i32 %219, %220
  %229 = add i32 %227, %218
  %230 = xor i32 %229, %228
  %231 = shl i32 %230, 29
  %232 = lshr i32 %230, 3
  %233 = add i32 %222, %21
  %234 = add i32 %233, 3
  %235 = shl i32 %234, 17
  %236 = lshr i32 %234, 15
  %237 = add i32 %215, %25
  %238 = or i32 %225, %226
  %239 = add i32 %237, %224
  %240 = xor i32 %239, %238
  %241 = shl i32 %240, 29
  %242 = lshr i32 %240, 3
  %243 = or i32 %231, %232
  %244 = add i32 %229, %230
  %245 = xor i32 %244, %243
  %246 = shl i32 %245, 16
  %247 = lshr i32 %245, 16
  %248 = add i32 %244, %245
  %249 = or i32 %246, %247
  %250 = xor i32 %248, %249
  %251 = shl i32 %250, 24
  %252 = lshr i32 %250, 8
  %253 = add i32 %221, %41
  %254 = or i32 %235, %236
  %255 = add i32 %253, %234
  %256 = xor i32 %255, %254
  %257 = shl i32 %256, 29
  %258 = lshr i32 %256, 3
  %259 = or i32 %241, %242
  %260 = add i32 %239, %240
  %261 = xor i32 %260, %259
  %262 = shl i32 %261, 16
  %263 = lshr i32 %261, 16
  %264 = add i32 %260, %261
  %265 = or i32 %262, %263
  %266 = xor i32 %264, %265
  %267 = shl i32 %266, 24
  %268 = lshr i32 %266, 8
  %269 = or i32 %251, %252
  %270 = or i32 %257, %258
  %271 = add i32 %255, %256
  %272 = xor i32 %271, %270
  %273 = shl i32 %272, 16
  %274 = lshr i32 %272, 16
  %275 = add i32 %271, %272
  %276 = or i32 %273, %274
  %277 = xor i32 %275, %276
  %278 = shl i32 %277, 24
  %279 = lshr i32 %277, 8
  %280 = or i32 %267, %268
  %281 = add i32 %248, %250
  %282 = xor i32 %281, %269
  %283 = or i32 %278, %279
  %284 = add i32 %264, %266
  %285 = xor i32 %284, %280
  %286 = add i32 %282, %74
  %287 = add i32 %286, 4
  %288 = shl i32 %287, 13
  %289 = lshr i32 %287, 19
  %290 = add i32 %275, %277
  %291 = xor i32 %290, %283
  %292 = add i32 %285, %82
  %293 = add i32 %292, 4
  %294 = shl i32 %293, 13
  %295 = lshr i32 %293, 19
  %296 = add i32 %281, %9
  %297 = or i32 %288, %289
  %298 = add i32 %296, %287
  %299 = xor i32 %298, %297
  %300 = shl i32 %299, 15
  %301 = lshr i32 %299, 17
  %302 = add i32 %291, %94
  %303 = add i32 %302, 4
  %304 = shl i32 %303, 13
  %305 = lshr i32 %303, 19
  %306 = add i32 %284, %12
  %307 = or i32 %294, %295
  %308 = add i32 %306, %293
  %309 = xor i32 %308, %307
  %310 = shl i32 %309, 15
  %311 = lshr i32 %309, 17
  %312 = or i32 %300, %301
  %313 = add i32 %298, %299
  %314 = xor i32 %313, %312
  %315 = shl i32 %314, 26
  %316 = lshr i32 %314, 6
  %317 = add i32 %313, %314
  %318 = or i32 %315, %316
  %319 = xor i32 %317, %318
  %320 = shl i32 %319, 6
  %321 = lshr i32 %319, 26
  %322 = add i32 %290, %21
  %323 = or i32 %304, %305
  %324 = add i32 %322, %303
  %325 = xor i32 %324, %323
  %326 = shl i32 %325, 15
  %327 = lshr i32 %325, 17
  %328 = or i32 %310, %311
  %329 = add i32 %308, %309
  %330 = xor i32 %329, %328
  %331 = shl i32 %330, 26
  %332 = lshr i32 %330, 6
  %333 = add i32 %329, %330
  %334 = or i32 %331, %332
  %335 = xor i32 %333, %334
  %336 = shl i32 %335, 6
  %337 = lshr i32 %335, 26
  %338 = or i32 %320, %321
  %339 = or i32 %326, %327
  %340 = add i32 %324, %325
  %341 = xor i32 %340, %339
  %342 = shl i32 %341, 26
  %343 = lshr i32 %341, 6
  %344 = add i32 %340, %341
  %345 = or i32 %342, %343
  %346 = xor i32 %344, %345
  %347 = shl i32 %346, 6
  %348 = lshr i32 %346, 26
  %349 = or i32 %336, %337
  %350 = add i32 %317, %319
  %351 = xor i32 %350, %338
  %352 = or i32 %347, %348
  %353 = add i32 %333, %335
  %354 = xor i32 %353, %349
  %355 = add i32 %351, %16
  %356 = add i32 %344, %346
  %357 = xor i32 %356, %352
  %358 = add i32 %354, %25
  %359 = add i32 %350, %74
  %360 = add i32 %355, 5
  %361 = add i32 %357, %41
  %362 = add i32 %353, %82
  %363 = add i32 %358, 5
  %364 = xor i32 %359, %360
  %365 = add i32 %356, %94
  %366 = add i32 %361, 5
  %367 = xor i32 %362, %363
  %368 = urem i32 %364, 6
  %369 = xor i32 %365, %366
  %370 = lshr i32 %367, 9
  %371 = mul i32 %368, 4
  %372 = urem i32 %369, 6
  %373 = or i32 %370, 1065353216
  %374 = add i32 %371, %372
  %375 = bitcast i32 %373 to float
  %376 = urem i32 %374, 6
  %377 = fadd float %375, -1.000000e+00
  %378 = fmul float %377, 3.700000e+04
  %379 = add i32 %376, 2
  %380 = fadd float %378, 3.000000e+03
  %381 = call i32 @llvm.smax.i32(i32 %379, i32 1)
  %382 = call float @llvm.maximum.f32(float %380, float 3.000000e+03)
  %383 = sitofp i32 %381 to float
  %384 = fdiv float %382, %383
  %385 = getelementptr inbounds float, ptr %3, i32 %8
  store float %384, ptr %385, align 4
  ret void
}

define internal i32 @fused_divide_bitcast_891_76(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = call i32 @fused_divide_concatenate_136_161(ptr %0, ptr %1, ptr %2, i32 %3, i32 0, i32 %4)
  ret i32 %6
}

define internal i32 @fused_divide_bitcast_74_26(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = mul i32 %3, 2
  %7 = add i32 %6, %4
  %8 = add i32 %7, 3072
  %9 = getelementptr inbounds i32, ptr %0, i32 %8
  %10 = load i32, ptr %9, align 4, !invariant.load !3
  ret i32 %10
}

define internal i32 @fused_divide_bitcast_900_76(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = call i32 @fused_divide_concatenate_136_161(ptr %0, ptr %1, ptr %2, i32 %3, i32 1, i32 %4)
  ret i32 %6
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

define internal i32 @fused_divide_concatenate_136_161(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4, i32 %5) {
  %7 = icmp ult i32 %3, 1
  br i1 %7, label %8, label %13

8:                                                ; preds = %6
  %9 = mul i32 %4, 1536
  %10 = add i32 %9, %5
  %11 = getelementptr inbounds i32, ptr %2, i32 %10
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  br label %18

13:                                               ; preds = %6
  %14 = mul i32 %4, 1536
  %15 = add i32 %14, %5
  %16 = getelementptr inbounds i32, ptr %1, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  br label %18

18:                                               ; preds = %8, %13
  %19 = phi i32 [ %17, %13 ], [ %12, %8 ]
  br label %20

20:                                               ; preds = %18
  ret i32 %19
}

define ptx_kernel void @loop_and_compare_convert_maximum_select_slice_fusion(ptr noalias align 256 dereferenceable(8080) %0, ptr noalias align 256 dereferenceable(6144) %1, ptr noalias align 256 dereferenceable(86016) %2, ptr noalias align 256 dereferenceable(86016) %3, ptr noalias align 256 dereferenceable(12288) %4, ptr noalias align 256 dereferenceable(12288) %5, ptr noalias align 256 dereferenceable(86016) %6, ptr noalias align 256 dereferenceable(86016) %7, ptr noalias align 256 dereferenceable(21504) %8, ptr noalias align 256 dereferenceable(86016) %9, ptr noalias align 256 dereferenceable(21504) %10, ptr noalias align 256 dereferenceable(21504) %11, ptr noalias align 256 dereferenceable(21504) %12, ptr noalias align 256 dereferenceable(86016) %13, ptr noalias align 256 dereferenceable(21504) %14, ptr noalias align 256 dereferenceable(86016) %15, ptr noalias align 256 dereferenceable(86016) %16, ptr noalias align 256 dereferenceable(21504) %17, ptr noalias align 256 dereferenceable(86016) %18, ptr noalias align 256 dereferenceable(86016) %19, ptr noalias align 256 dereferenceable(86016) %20, ptr noalias align 256 dereferenceable(86016) %21, ptr noalias align 256 dereferenceable(86016) %22, ptr noalias align 256 dereferenceable(86016) %23, ptr noalias align 256 dereferenceable(21504) %24, ptr noalias align 256 dereferenceable(21504) %25, ptr noalias align 256 dereferenceable(21504) %26, ptr noalias align 256 dereferenceable(21504) %27, ptr noalias align 256 dereferenceable(21504) %28, ptr noalias align 256 dereferenceable(21504) %29, ptr noalias align 256 dereferenceable(86016) %30, ptr noalias align 256 dereferenceable(21504) %31) #0 {
  %33 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %34 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %35 = mul i32 %33, 128
  %36 = add i32 %35, %34
  %37 = udiv i32 %36, 14
  %38 = urem i32 %36, 14
  %39 = call i32 @fused_and_compare_convert_maximum_select_slice_maximum_82_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37, i32 %38)
  %40 = srem i32 %38, 7
  %41 = icmp slt i32 %40, 0
  %42 = icmp ne i32 %40, 0
  %43 = and i1 %41, %42
  %44 = add i32 %40, 7
  %45 = select i1 %43, i32 %44, i32 %40
  %46 = call i32 @fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 1, i32 %37)
  %47 = shl i32 %46, 13
  %48 = lshr i32 %46, 19
  %49 = or i32 %47, %48
  %50 = call i32 @fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37)
  %51 = add i32 %50, %46
  %52 = xor i32 %51, %49
  %53 = shl i32 %52, 15
  %54 = lshr i32 %52, 17
  %55 = call i32 @fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 1, i32 %37)
  %56 = shl i32 %55, 13
  %57 = lshr i32 %55, 19
  %58 = or i32 %53, %54
  %59 = add i32 %51, %52
  %60 = xor i32 %59, %58
  %61 = shl i32 %60, 26
  %62 = lshr i32 %60, 6
  %63 = add i32 %59, %60
  %64 = or i32 %61, %62
  %65 = xor i32 %63, %64
  %66 = shl i32 %65, 6
  %67 = lshr i32 %65, 26
  %68 = or i32 %56, %57
  %69 = call i32 @fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37)
  %70 = add i32 %69, %55
  %71 = xor i32 %70, %68
  %72 = shl i32 %71, 15
  %73 = lshr i32 %71, 17
  %74 = or i32 %66, %67
  %75 = or i32 %72, %73
  %76 = add i32 %70, %71
  %77 = xor i32 %76, %75
  %78 = shl i32 %77, 26
  %79 = lshr i32 %77, 6
  %80 = add i32 %76, %77
  %81 = or i32 %78, %79
  %82 = xor i32 %80, %81
  %83 = shl i32 %82, 6
  %84 = lshr i32 %82, 26
  %85 = add i32 %63, %65
  %86 = xor i32 %85, %74
  %87 = or i32 %83, %84
  %88 = xor i32 %50, %46
  %89 = xor i32 %88, 466688986
  %90 = add i32 %86, %89
  %91 = add i32 %90, 1
  %92 = shl i32 %91, 17
  %93 = lshr i32 %91, 15
  %94 = add i32 %80, %82
  %95 = xor i32 %94, %87
  %96 = add i32 %85, %46
  %97 = or i32 %92, %93
  %98 = add i32 %96, %91
  %99 = xor i32 %98, %97
  %100 = shl i32 %99, 29
  %101 = lshr i32 %99, 3
  %102 = xor i32 %69, %55
  %103 = xor i32 %102, 466688986
  %104 = add i32 %95, %103
  %105 = add i32 %104, 1
  %106 = shl i32 %105, 17
  %107 = lshr i32 %105, 15
  %108 = or i32 %100, %101
  %109 = add i32 %98, %99
  %110 = xor i32 %109, %108
  %111 = shl i32 %110, 16
  %112 = lshr i32 %110, 16
  %113 = add i32 %109, %110
  %114 = or i32 %111, %112
  %115 = xor i32 %113, %114
  %116 = shl i32 %115, 24
  %117 = lshr i32 %115, 8
  %118 = add i32 %94, %55
  %119 = or i32 %106, %107
  %120 = add i32 %118, %105
  %121 = xor i32 %120, %119
  %122 = shl i32 %121, 29
  %123 = lshr i32 %121, 3
  %124 = or i32 %116, %117
  %125 = or i32 %122, %123
  %126 = add i32 %120, %121
  %127 = xor i32 %126, %125
  %128 = shl i32 %127, 16
  %129 = lshr i32 %127, 16
  %130 = add i32 %126, %127
  %131 = or i32 %128, %129
  %132 = xor i32 %130, %131
  %133 = shl i32 %132, 24
  %134 = lshr i32 %132, 8
  %135 = add i32 %113, %115
  %136 = xor i32 %135, %124
  %137 = or i32 %133, %134
  %138 = add i32 %136, %50
  %139 = add i32 %138, 2
  %140 = shl i32 %139, 13
  %141 = lshr i32 %139, 19
  %142 = add i32 %130, %132
  %143 = xor i32 %142, %137
  %144 = add i32 %135, %89
  %145 = or i32 %140, %141
  %146 = add i32 %144, %139
  %147 = xor i32 %146, %145
  %148 = shl i32 %147, 15
  %149 = lshr i32 %147, 17
  %150 = add i32 %143, %69
  %151 = add i32 %150, 2
  %152 = shl i32 %151, 13
  %153 = lshr i32 %151, 19
  %154 = or i32 %148, %149
  %155 = add i32 %146, %147
  %156 = xor i32 %155, %154
  %157 = shl i32 %156, 26
  %158 = lshr i32 %156, 6
  %159 = add i32 %155, %156
  %160 = or i32 %157, %158
  %161 = xor i32 %159, %160
  %162 = shl i32 %161, 6
  %163 = lshr i32 %161, 26
  %164 = add i32 %142, %103
  %165 = or i32 %152, %153
  %166 = add i32 %164, %151
  %167 = xor i32 %166, %165
  %168 = shl i32 %167, 15
  %169 = lshr i32 %167, 17
  %170 = or i32 %162, %163
  %171 = or i32 %168, %169
  %172 = add i32 %166, %167
  %173 = xor i32 %172, %171
  %174 = shl i32 %173, 26
  %175 = lshr i32 %173, 6
  %176 = add i32 %172, %173
  %177 = or i32 %174, %175
  %178 = xor i32 %176, %177
  %179 = shl i32 %178, 6
  %180 = lshr i32 %178, 26
  %181 = add i32 %159, %161
  %182 = xor i32 %181, %170
  %183 = or i32 %179, %180
  %184 = add i32 %182, %46
  %185 = add i32 %184, 3
  %186 = shl i32 %185, 17
  %187 = lshr i32 %185, 15
  %188 = add i32 %176, %178
  %189 = xor i32 %188, %183
  %190 = add i32 %181, %50
  %191 = or i32 %186, %187
  %192 = add i32 %190, %185
  %193 = xor i32 %192, %191
  %194 = shl i32 %193, 29
  %195 = lshr i32 %193, 3
  %196 = add i32 %189, %55
  %197 = add i32 %196, 3
  %198 = shl i32 %197, 17
  %199 = lshr i32 %197, 15
  %200 = or i32 %194, %195
  %201 = add i32 %192, %193
  %202 = xor i32 %201, %200
  %203 = shl i32 %202, 16
  %204 = lshr i32 %202, 16
  %205 = add i32 %201, %202
  %206 = or i32 %203, %204
  %207 = xor i32 %205, %206
  %208 = shl i32 %207, 24
  %209 = lshr i32 %207, 8
  %210 = add i32 %188, %69
  %211 = or i32 %198, %199
  %212 = add i32 %210, %197
  %213 = xor i32 %212, %211
  %214 = shl i32 %213, 29
  %215 = lshr i32 %213, 3
  %216 = or i32 %208, %209
  %217 = or i32 %214, %215
  %218 = add i32 %212, %213
  %219 = xor i32 %218, %217
  %220 = shl i32 %219, 16
  %221 = lshr i32 %219, 16
  %222 = add i32 %218, %219
  %223 = or i32 %220, %221
  %224 = xor i32 %222, %223
  %225 = shl i32 %224, 24
  %226 = lshr i32 %224, 8
  %227 = add i32 %205, %207
  %228 = xor i32 %227, %216
  %229 = or i32 %225, %226
  %230 = add i32 %228, %89
  %231 = add i32 %230, 4
  %232 = shl i32 %231, 13
  %233 = lshr i32 %231, 19
  %234 = add i32 %222, %224
  %235 = xor i32 %234, %229
  %236 = add i32 %227, %46
  %237 = or i32 %232, %233
  %238 = add i32 %236, %231
  %239 = xor i32 %238, %237
  %240 = shl i32 %239, 15
  %241 = lshr i32 %239, 17
  %242 = add i32 %235, %103
  %243 = add i32 %242, 4
  %244 = shl i32 %243, 13
  %245 = lshr i32 %243, 19
  %246 = or i32 %240, %241
  %247 = add i32 %238, %239
  %248 = xor i32 %247, %246
  %249 = shl i32 %248, 26
  %250 = lshr i32 %248, 6
  %251 = add i32 %247, %248
  %252 = or i32 %249, %250
  %253 = xor i32 %251, %252
  %254 = shl i32 %253, 6
  %255 = lshr i32 %253, 26
  %256 = add i32 %234, %55
  %257 = or i32 %244, %245
  %258 = add i32 %256, %243
  %259 = xor i32 %258, %257
  %260 = shl i32 %259, 15
  %261 = lshr i32 %259, 17
  %262 = or i32 %254, %255
  %263 = or i32 %260, %261
  %264 = add i32 %258, %259
  %265 = xor i32 %264, %263
  %266 = shl i32 %265, 26
  %267 = lshr i32 %265, 6
  %268 = add i32 %264, %265
  %269 = or i32 %266, %267
  %270 = xor i32 %268, %269
  %271 = shl i32 %270, 6
  %272 = lshr i32 %270, 26
  %273 = add i32 %251, %253
  %274 = xor i32 %273, %262
  %275 = or i32 %271, %272
  %276 = add i32 %274, %50
  %277 = add i32 %268, %270
  %278 = xor i32 %277, %275
  %279 = add i32 %273, %89
  %280 = add i32 %276, 5
  %281 = add i32 %278, %69
  %282 = xor i32 %279, %280
  %283 = add i32 %277, %103
  %284 = add i32 %281, 5
  %285 = urem i32 %282, 6
  %286 = xor i32 %283, %284
  %287 = mul i32 %285, 4
  %288 = urem i32 %286, 6
  %289 = add i32 %287, %288
  %290 = urem i32 %289, 6
  %291 = add i32 %290, 2
  %292 = sitofp i32 %39 to float
  %293 = call float @fused_and_compare_convert_maximum_select_slice_slice_185_9(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37, i32 %38)
  %294 = icmp slt i32 %45, %291
  %295 = fmul float %292, %293
  %296 = select i1 %294, float %295, float 0.000000e+00
  %297 = getelementptr inbounds i32, ptr %3, i32 %36
  %298 = load i32, ptr %297, align 4, !invariant.load !3
  %299 = srem i32 %298, 15
  %300 = call i32 @fused_and_compare_convert_maximum_select_slice_broadcast_1984_58(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %37, i32 %38)
  %301 = icmp slt i32 %299, %300
  %302 = icmp ne i32 %299, %300
  %303 = and i1 %301, %302
  %304 = add i32 %299, 15
  %305 = select i1 %303, i32 %304, i32 %299
  %306 = zext i1 %294 to i8
  %307 = call i8 @fused_and_compare_convert_maximum_select_slice_compare_252_11_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37, i32 %38)
  %308 = icmp sge i32 %38, 7
  %309 = zext i1 %308 to i32
  %310 = icmp eq i32 %309, 0
  %311 = icmp sge i32 %305, 1
  %312 = zext i1 %311 to i8
  %313 = icmp sle i32 %305, 13
  %314 = zext i1 %313 to i8
  %315 = and i8 %306, %307
  %316 = select i1 %310, i8 %312, i8 %314
  %317 = and i8 %315, %316
  %318 = select i1 %310, i32 -1, i32 1
  %319 = add i32 %298, %318
  %320 = and i8 %307, %316
  %321 = call i32 @llvm.smax.i32(i32 %300, i32 %319)
  %322 = call i32 @llvm.smin.i32(i32 %321, i32 164)
  %323 = trunc i8 %320 to i1
  %324 = select i1 %323, i32 %322, i32 %298
  %325 = icmp slt i32 %324, %300
  %326 = add i32 %324, 165
  %327 = select i1 %325, i32 %326, i32 %324
  %328 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 16, i32 %37, i32 %38)
  %329 = call float @fused_and_compare_convert_maximum_select_slice_broadcast_3138_53_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37, i32 %38)
  %330 = fcmp ogt float %328, %329
  %331 = zext i1 %330 to i8
  %332 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 18, i32 %37, i32 %38)
  %333 = fcmp ogt float %332, %329
  %334 = zext i1 %333 to i8
  %335 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 17, i32 %37, i32 %38)
  %336 = fcmp ogt float %335, %329
  %337 = zext i1 %336 to i8
  %338 = call i32 @fused_and_compare_convert_maximum_select_slice_convert_103_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37, i32 %38)
  %339 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 12, i32 %37, i32 %38)
  %340 = fptosi float %339 to i32
  %341 = fcmp ole float %339, 0xC1E0000000000000
  %342 = select i1 %341, i32 -2147483648, i32 %340
  %343 = fcmp oge float %339, 0x41E0000000000000
  %344 = select i1 %343, i32 2147483647, i32 %342
  %345 = fcmp uno float %339, %339
  %346 = select i1 %345, i32 0, i32 %344
  %347 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 7, i32 %37, i32 %38)
  %348 = fcmp ogt float %347, %329
  %349 = zext i1 %348 to i8
  %350 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 2, i32 %37, i32 %38)
  %351 = fptosi float %350 to i32
  %352 = fcmp ole float %350, 0xC1E0000000000000
  %353 = select i1 %352, i32 -2147483648, i32 %351
  %354 = fcmp oge float %350, 0x41E0000000000000
  %355 = select i1 %354, i32 2147483647, i32 %353
  %356 = fcmp uno float %350, %350
  %357 = select i1 %356, i32 0, i32 %355
  %358 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 3, i32 %37, i32 %38)
  %359 = fptosi float %358 to i32
  %360 = fcmp ole float %358, 0xC1E0000000000000
  %361 = select i1 %360, i32 -2147483648, i32 %359
  %362 = fcmp oge float %358, 0x41E0000000000000
  %363 = select i1 %362, i32 2147483647, i32 %361
  %364 = fcmp uno float %358, %358
  %365 = select i1 %364, i32 0, i32 %363
  %366 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37, i32 %38)
  %367 = fptosi float %366 to i32
  %368 = fcmp ole float %366, 0xC1E0000000000000
  %369 = select i1 %368, i32 -2147483648, i32 %367
  %370 = fcmp oge float %366, 0x41E0000000000000
  %371 = select i1 %370, i32 2147483647, i32 %369
  %372 = fcmp uno float %366, %366
  %373 = select i1 %372, i32 0, i32 %371
  %374 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 1, i32 %37, i32 %38)
  %375 = fptosi float %374 to i32
  %376 = fcmp ole float %374, 0xC1E0000000000000
  %377 = select i1 %376, i32 -2147483648, i32 %375
  %378 = fcmp oge float %374, 0x41E0000000000000
  %379 = select i1 %378, i32 2147483647, i32 %377
  %380 = fcmp uno float %374, %374
  %381 = select i1 %380, i32 0, i32 %379
  %382 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 4, i32 %37, i32 %38)
  %383 = fptosi float %382 to i32
  %384 = fcmp ole float %382, 0xC1E0000000000000
  %385 = select i1 %384, i32 -2147483648, i32 %383
  %386 = fcmp oge float %382, 0x41E0000000000000
  %387 = select i1 %386, i32 2147483647, i32 %385
  %388 = fcmp uno float %382, %382
  %389 = select i1 %388, i32 0, i32 %387
  %390 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 19, i32 %37, i32 %38)
  %391 = fptosi float %390 to i32
  %392 = fcmp ole float %390, 0xC1E0000000000000
  %393 = select i1 %392, i32 -2147483648, i32 %391
  %394 = fcmp oge float %390, 0x41E0000000000000
  %395 = select i1 %394, i32 2147483647, i32 %393
  %396 = fcmp uno float %390, %390
  %397 = select i1 %396, i32 0, i32 %395
  %398 = call i32 @fused_and_compare_convert_maximum_select_slice_broadcast_3139_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 0, i32 %37, i32 %38)
  %399 = call i32 @llvm.smax.i32(i32 %397, i32 %398)
  %400 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 8, i32 %37, i32 %38)
  %401 = fcmp ogt float %400, %329
  %402 = zext i1 %401 to i8
  %403 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 10, i32 %37, i32 %38)
  %404 = fcmp ogt float %403, %329
  %405 = zext i1 %404 to i8
  %406 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 11, i32 %37, i32 %38)
  %407 = fcmp ogt float %406, %329
  %408 = zext i1 %407 to i8
  %409 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 13, i32 %37, i32 %38)
  %410 = fcmp ogt float %409, %329
  %411 = zext i1 %410 to i8
  %412 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 14, i32 %37, i32 %38)
  %413 = fcmp ogt float %412, %329
  %414 = zext i1 %413 to i8
  %415 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 15, i32 %37, i32 %38)
  %416 = fcmp ogt float %415, %329
  %417 = zext i1 %416 to i8
  %418 = add i32 %338, 1000
  %419 = select i1 %294, i32 %418, i32 -10000
  %420 = getelementptr inbounds i32, ptr %6, i32 %36
  store i32 %39, ptr %420, align 4
  %421 = getelementptr inbounds float, ptr %7, i32 %36
  store float %296, ptr %421, align 4
  %422 = getelementptr inbounds i8, ptr %8, i32 %36
  store i8 %317, ptr %422, align 1
  %423 = getelementptr inbounds i32, ptr %9, i32 %36
  store i32 %327, ptr %423, align 4
  %424 = getelementptr inbounds i8, ptr %10, i32 %36
  store i8 %331, ptr %424, align 1
  %425 = getelementptr inbounds i8, ptr %11, i32 %36
  store i8 %334, ptr %425, align 1
  %426 = getelementptr inbounds i8, ptr %12, i32 %36
  store i8 %337, ptr %426, align 1
  %427 = getelementptr inbounds i32, ptr %13, i32 %36
  store i32 %338, ptr %427, align 4
  %428 = getelementptr inbounds i8, ptr %14, i32 %36
  store i8 %307, ptr %428, align 1
  %429 = getelementptr inbounds float, ptr %15, i32 %36
  store float %293, ptr %429, align 4
  %430 = getelementptr inbounds i32, ptr %16, i32 %36
  store i32 %346, ptr %430, align 4
  %431 = getelementptr inbounds i8, ptr %17, i32 %36
  store i8 %349, ptr %431, align 1
  %432 = getelementptr inbounds i32, ptr %18, i32 %36
  store i32 %357, ptr %432, align 4
  %433 = getelementptr inbounds i32, ptr %19, i32 %36
  store i32 %365, ptr %433, align 4
  %434 = getelementptr inbounds i32, ptr %20, i32 %36
  store i32 %373, ptr %434, align 4
  %435 = getelementptr inbounds i32, ptr %21, i32 %36
  store i32 %381, ptr %435, align 4
  %436 = getelementptr inbounds i32, ptr %22, i32 %36
  store i32 %389, ptr %436, align 4
  %437 = getelementptr inbounds i32, ptr %23, i32 %36
  store i32 %399, ptr %437, align 4
  %438 = getelementptr inbounds i8, ptr %24, i32 %36
  store i8 %402, ptr %438, align 1
  %439 = getelementptr inbounds i8, ptr %25, i32 %36
  store i8 %405, ptr %439, align 1
  %440 = getelementptr inbounds i8, ptr %26, i32 %36
  store i8 %408, ptr %440, align 1
  %441 = getelementptr inbounds i8, ptr %27, i32 %36
  store i8 %411, ptr %441, align 1
  %442 = getelementptr inbounds i8, ptr %28, i32 %36
  store i8 %414, ptr %442, align 1
  %443 = getelementptr inbounds i8, ptr %29, i32 %36
  store i8 %417, ptr %443, align 1
  %444 = getelementptr inbounds i32, ptr %30, i32 %36
  store i32 %419, ptr %444, align 4
  %445 = getelementptr inbounds i8, ptr %31, i32 %36
  store i8 %306, ptr %445, align 1
  ret void
}

define internal i32 @fused_and_compare_convert_maximum_select_slice_maximum_82_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7, i32 %8) {
  %10 = getelementptr inbounds float, ptr %1, i32 %7
  %11 = load float, ptr %10, align 4, !invariant.load !3
  %12 = call float @fused_and_compare_convert_maximum_select_slice_slice_185_9(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %6, i32 %7, i32 %8)
  %13 = call float @llvm.maximum.f32(float %12, float 1.000000e+00)
  %14 = fdiv float %11, %13
  %15 = fptosi float %14 to i32
  %16 = fcmp ole float %14, 0xC1E0000000000000
  %17 = select i1 %16, i32 -2147483648, i32 %15
  %18 = fcmp oge float %14, 0x41E0000000000000
  %19 = select i1 %18, i32 2147483647, i32 %17
  %20 = fcmp uno float %14, %14
  %21 = select i1 %20, i32 0, i32 %19
  %22 = call i32 @fused_and_compare_convert_maximum_select_slice_broadcast_3139_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %6, i32 %7, i32 %8)
  %23 = call i32 @llvm.smax.i32(i32 %21, i32 %22)
  ret i32 %23
}

define internal i32 @fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = call i32 @fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %6, i32 0, i32 %7)
  ret i32 %9
}

define internal i32 @fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = call i32 @fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %6, i32 1, i32 %7)
  ret i32 %9
}

define internal float @fused_and_compare_convert_maximum_select_slice_slice_185_9(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7, i32 %8) {
  %10 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 6, i32 %7, i32 %8)
  ret float %10
}

define internal i32 @fused_and_compare_convert_maximum_select_slice_broadcast_1984_58(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  ret i32 0
}

define internal i8 @fused_and_compare_convert_maximum_select_slice_compare_252_11_clone_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7, i32 %8) {
  %10 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 9, i32 %7, i32 %8)
  %11 = call float @fused_and_compare_convert_maximum_select_slice_broadcast_3138_53_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %6, i32 %7, i32 %8)
  %12 = fcmp ogt float %10, %11
  %13 = zext i1 %12 to i8
  ret i8 %13
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

define internal float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7, i32 %8) {
  %10 = mul i32 %7, 14
  %11 = add i32 %10, %8
  %12 = getelementptr inbounds i32, ptr %2, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = call i32 @fused_and_compare_convert_maximum_select_slice_broadcast_1984_58(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %7, i32 %8)
  %15 = icmp slt i32 %13, %14
  %16 = add i32 %13, 101
  %17 = select i1 %15, i32 %16, i32 %13
  %18 = call i32 @llvm.smin.i32(i32 %17, i32 100)
  %19 = call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = mul i32 %19, 20
  %21 = add i32 %20, %6
  %22 = getelementptr inbounds float, ptr %0, i32 %21
  %23 = load float, ptr %22, align 4, !invariant.load !3
  ret float %23
}

define internal float @fused_and_compare_convert_maximum_select_slice_broadcast_3138_53_clone_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7, i32 %8) {
  ret float 0.000000e+00
}

define internal i32 @fused_and_compare_convert_maximum_select_slice_convert_103_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7, i32 %8) {
  %10 = call float @fused_and_compare_convert_maximum_select_slice_bitcast_1290_126(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 5, i32 %7, i32 %8)
  %11 = fptosi float %10 to i32
  %12 = fcmp ole float %10, 0xC1E0000000000000
  %13 = select i1 %12, i32 -2147483648, i32 %11
  %14 = fcmp oge float %10, 0x41E0000000000000
  %15 = select i1 %14, i32 2147483647, i32 %13
  %16 = fcmp uno float %10, %10
  %17 = select i1 %16, i32 0, i32 %15
  ret i32 %17
}

define internal i32 @fused_and_compare_convert_maximum_select_slice_broadcast_3139_3(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7, i32 %8) {
  ret i32 1
}

define internal i32 @fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7, i32 %8) {
  %10 = icmp ult i32 %6, 1
  br i1 %10, label %11, label %16

11:                                               ; preds = %9
  %12 = mul i32 %7, 1536
  %13 = add i32 %12, %8
  %14 = getelementptr inbounds i32, ptr %5, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  br label %21

16:                                               ; preds = %9
  %17 = mul i32 %7, 1536
  %18 = add i32 %17, %8
  %19 = getelementptr inbounds i32, ptr %4, i32 %18
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  br label %21

21:                                               ; preds = %11, %16
  %22 = phi i32 [ %20, %16 ], [ %15, %11 ]
  br label %23

23:                                               ; preds = %21
  ret i32 %22
}

define ptx_kernel void @loop_transpose_fusion_2(ptr noalias align 256 dereferenceable(86016) %0, ptr noalias align 256 dereferenceable(172032) %1, ptr noalias align 256 dereferenceable(172032) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !11
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = mul i32 %4, 64
  %7 = udiv i32 %5, 2
  %8 = add i32 %6, %7
  %9 = urem i32 %5, 2
  %10 = mul i32 %4, 128
  %11 = add i32 %10, %5
  %12 = udiv i32 %11, 28
  %13 = urem i32 %8, 14
  %14 = icmp ult i32 %9, 1
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  br label %32

16:                                               ; preds = %3
  %17 = getelementptr inbounds i32, ptr %0, i32 %8
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = icmp sge i32 %13, 7
  %20 = zext i1 %19 to i32
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 -1, i32 1
  %23 = add i32 %18, %22
  %24 = call i32 @llvm.smax.i32(i32 %23, i32 0)
  %25 = call i32 @llvm.smin.i32(i32 %24, i32 164)
  %26 = icmp slt i32 %25, 0
  %27 = add i32 %25, 165
  %28 = select i1 %26, i32 %27, i32 %25
  %29 = icmp slt i32 %18, 0
  %30 = add i32 %18, 165
  %31 = select i1 %29, i32 %30, i32 %18
  br label %32

32:                                               ; preds = %15, %16
  %33 = phi i32 [ %28, %16 ], [ %12, %15 ]
  %34 = phi i32 [ %31, %16 ], [ %12, %15 ]
  br label %35

35:                                               ; preds = %32
  %36 = getelementptr inbounds i32, ptr %1, i32 %11
  store i32 %33, ptr %36, align 4
  %37 = getelementptr inbounds i32, ptr %2, i32 %11
  store i32 %34, ptr %37, align 4
  ret void
}

define ptx_kernel void @loop_broadcast_fusion_6(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(253440) %1, ptr noalias align 256 dereferenceable(253440) %2, ptr noalias align 256 dereferenceable(253440) %3, ptr noalias align 256 dereferenceable(253440) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = mul i32 %7, 4
  %9 = mul i32 %6, 512
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i8, ptr %0, i32 %10
  store <4 x i8> zeroinitializer, ptr %11, align 4
  %12 = getelementptr inbounds i8, ptr %1, i32 %10
  store <4 x i8> zeroinitializer, ptr %12, align 4
  %13 = getelementptr inbounds i8, ptr %2, i32 %10
  store <4 x i8> zeroinitializer, ptr %13, align 4
  %14 = getelementptr inbounds i8, ptr %3, i32 %10
  store <4 x i8> zeroinitializer, ptr %14, align 4
  %15 = getelementptr inbounds i8, ptr %4, i32 %10
  store <4 x i8> zeroinitializer, ptr %15, align 4
  ret void
}

define ptx_kernel void @input_scatter_fusion_15(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(172032) %1, ptr noalias align 256 dereferenceable(21504) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %6 = mul i32 %4, 2
  %7 = mul i32 %5, 256
  %8 = add i32 %6, %7
  %9 = getelementptr inbounds i32, ptr %1, i32 %8
  %10 = load i32, ptr %9, align 4, !invariant.load !3
  %11 = add i32 %8, 1
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = icmp ule i32 %10, 1535
  %15 = icmp ule i32 %13, 164
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %48

17:                                               ; preds = %3
  %18 = mul i32 %5, 128
  %19 = add i32 %18, %4
  %20 = getelementptr inbounds i8, ptr %2, i32 %19
  %21 = load i8, ptr %20, align 1, !invariant.load !3
  %22 = mul i32 %10, 165
  %23 = add i32 %22, %13
  %24 = getelementptr inbounds i8, ptr %0, i32 %23
  %25 = ptrtoint ptr %24 to i64
  %26 = and i64 %25, 3
  %27 = mul i64 %26, -1
  %28 = getelementptr inbounds i8, ptr %24, i64 %27
  %29 = trunc i64 %26 to i32
  %30 = mul i32 %29, 8
  %31 = shl i32 255, %30
  %32 = xor i32 -1, %31
  %33 = load i32, ptr %28, align 4
  br label %34

34:                                               ; preds = %34, %17
  %35 = phi i32 [ %44, %34 ], [ %33, %17 ]
  %36 = lshr i32 %35, %30
  %37 = trunc i32 %36 to i8
  %38 = or i8 %37, %21
  %39 = zext i8 %38 to i32
  %40 = and i32 %35, %32
  %41 = shl i32 %39, %30
  %42 = or i32 %40, %41
  %43 = cmpxchg ptr %28, i32 %35, i32 %42 monotonic monotonic, align 4
  %44 = extractvalue { i32, i1 } %43, 0
  %45 = extractvalue { i32, i1 } %43, 1
  %46 = xor i1 %45, true
  br i1 %46, label %34, label %47

47:                                               ; preds = %34
  br label %48

48:                                               ; preds = %47, %3
  ret void
}

define ptx_kernel void @loop_transpose_fusion_1(ptr noalias align 256 dereferenceable(86016) %0, ptr noalias align 256 dereferenceable(172032) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !11
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %3, 64
  %6 = udiv i32 %4, 2
  %7 = add i32 %5, %6
  %8 = urem i32 %4, 2
  %9 = mul i32 %3, 128
  %10 = add i32 %9, %4
  %11 = udiv i32 %10, 28
  %12 = icmp ult i32 %8, 1
  br i1 %12, label %13, label %14

13:                                               ; preds = %2
  br label %17

14:                                               ; preds = %2
  %15 = getelementptr inbounds i32, ptr %0, i32 %7
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  br label %17

17:                                               ; preds = %13, %14
  %18 = phi i32 [ %16, %14 ], [ %11, %13 ]
  br label %19

19:                                               ; preds = %17
  %20 = getelementptr inbounds i32, ptr %1, i32 %10
  store i32 %18, ptr %20, align 4
  ret void
}

define ptx_kernel void @input_scatter_fusion_14(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(172032) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(86016) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %8 = mul i32 %6, 2
  %9 = mul i32 %7, 256
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i32, ptr %1, i32 %10
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  %13 = add i32 %10, 1
  %14 = getelementptr inbounds i32, ptr %1, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = icmp ule i32 %12, 1535
  %17 = icmp ule i32 %15, 164
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %64

19:                                               ; preds = %5
  %20 = mul i32 %7, 128
  %21 = add i32 %20, %6
  %22 = getelementptr inbounds i8, ptr %2, i32 %21
  %23 = load i8, ptr %22, align 1, !invariant.load !3
  %24 = getelementptr inbounds i32, ptr %4, i32 %21
  %25 = load i32, ptr %24, align 4, !invariant.load !3
  %26 = icmp slt i32 %25, 0
  %27 = add i32 %25, 101
  %28 = select i1 %26, i32 %27, i32 %25
  %29 = call i32 @llvm.smin.i32(i32 %28, i32 100)
  %30 = call i32 @llvm.smax.i32(i32 %29, i32 0)
  %31 = mul i32 %30, 20
  %32 = add i32 %31, 9
  %33 = getelementptr inbounds float, ptr %3, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !3
  %35 = fcmp ogt float %34, 0.000000e+00
  %36 = zext i1 %35 to i8
  %37 = and i8 %23, %36
  %38 = mul i32 %12, 165
  %39 = add i32 %38, %15
  %40 = getelementptr inbounds i8, ptr %0, i32 %39
  %41 = ptrtoint ptr %40 to i64
  %42 = and i64 %41, 3
  %43 = mul i64 %42, -1
  %44 = getelementptr inbounds i8, ptr %40, i64 %43
  %45 = trunc i64 %42 to i32
  %46 = mul i32 %45, 8
  %47 = shl i32 255, %46
  %48 = xor i32 -1, %47
  %49 = load i32, ptr %44, align 4
  br label %50

50:                                               ; preds = %50, %19
  %51 = phi i32 [ %60, %50 ], [ %49, %19 ]
  %52 = lshr i32 %51, %46
  %53 = trunc i32 %52 to i8
  %54 = or i8 %53, %37
  %55 = zext i8 %54 to i32
  %56 = and i32 %51, %48
  %57 = shl i32 %55, %46
  %58 = or i32 %56, %57
  %59 = cmpxchg ptr %44, i32 %51, i32 %58 monotonic monotonic, align 4
  %60 = extractvalue { i32, i1 } %59, 0
  %61 = extractvalue { i32, i1 } %59, 1
  %62 = xor i1 %61, true
  br i1 %62, label %50, label %63

63:                                               ; preds = %50
  br label %64

64:                                               ; preds = %63, %5
  ret void
}

define ptx_kernel void @loop_reduce_fusion(ptr noalias align 256 dereferenceable(86016) %0, ptr noalias align 256 dereferenceable(6144) %1, ptr noalias align 256 dereferenceable(6144) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = mul i32 %4, 128
  %7 = add i32 %6, %5
  %8 = mul i32 %5, 14
  %9 = mul i32 %4, 1792
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i32, ptr %0, i32 %10
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  %13 = icmp slt i32 %12, -2147483648
  %14 = select i1 %13, i32 -2147483648, i32 %12
  %15 = add i32 %10, 1
  %16 = getelementptr inbounds i32, ptr %0, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = icmp sgt i32 %14, %17
  %19 = select i1 %18, i32 %14, i32 %17
  %20 = icmp eq i32 %14, %17
  %21 = or i1 %18, %20
  %22 = xor i1 %21, true
  %23 = zext i1 %22 to i32
  %24 = add i32 %10, 2
  %25 = getelementptr inbounds i32, ptr %0, i32 %24
  %26 = load i32, ptr %25, align 4, !invariant.load !3
  %27 = icmp sgt i32 %19, %26
  %28 = select i1 %27, i32 %19, i32 %26
  %29 = icmp eq i32 %19, %26
  %30 = icmp slt i32 %23, 2
  %31 = and i1 %29, %30
  %32 = or i1 %27, %31
  %33 = select i1 %32, i32 %23, i32 2
  %34 = add i32 %10, 3
  %35 = getelementptr inbounds i32, ptr %0, i32 %34
  %36 = load i32, ptr %35, align 4, !invariant.load !3
  %37 = icmp sgt i32 %28, %36
  %38 = select i1 %37, i32 %28, i32 %36
  %39 = icmp eq i32 %28, %36
  %40 = icmp slt i32 %33, 3
  %41 = and i1 %39, %40
  %42 = or i1 %37, %41
  %43 = select i1 %42, i32 %33, i32 3
  %44 = add i32 %10, 4
  %45 = getelementptr inbounds i32, ptr %0, i32 %44
  %46 = load i32, ptr %45, align 4, !invariant.load !3
  %47 = icmp sgt i32 %38, %46
  %48 = select i1 %47, i32 %38, i32 %46
  %49 = icmp eq i32 %38, %46
  %50 = icmp slt i32 %43, 4
  %51 = and i1 %49, %50
  %52 = or i1 %47, %51
  %53 = select i1 %52, i32 %43, i32 4
  %54 = add i32 %10, 5
  %55 = getelementptr inbounds i32, ptr %0, i32 %54
  %56 = load i32, ptr %55, align 4, !invariant.load !3
  %57 = icmp sgt i32 %48, %56
  %58 = select i1 %57, i32 %48, i32 %56
  %59 = icmp eq i32 %48, %56
  %60 = icmp slt i32 %53, 5
  %61 = and i1 %59, %60
  %62 = or i1 %57, %61
  %63 = select i1 %62, i32 %53, i32 5
  %64 = add i32 %10, 6
  %65 = getelementptr inbounds i32, ptr %0, i32 %64
  %66 = load i32, ptr %65, align 4, !invariant.load !3
  %67 = icmp sgt i32 %58, %66
  %68 = select i1 %67, i32 %58, i32 %66
  %69 = icmp eq i32 %58, %66
  %70 = icmp slt i32 %63, 6
  %71 = and i1 %69, %70
  %72 = or i1 %67, %71
  %73 = select i1 %72, i32 %63, i32 6
  %74 = add i32 %10, 7
  %75 = getelementptr inbounds i32, ptr %0, i32 %74
  %76 = load i32, ptr %75, align 4, !invariant.load !3
  %77 = icmp sgt i32 %68, %76
  %78 = select i1 %77, i32 %68, i32 %76
  %79 = icmp eq i32 %68, %76
  %80 = icmp slt i32 %73, 7
  %81 = and i1 %79, %80
  %82 = or i1 %77, %81
  %83 = select i1 %82, i32 %73, i32 7
  %84 = add i32 %10, 8
  %85 = getelementptr inbounds i32, ptr %0, i32 %84
  %86 = load i32, ptr %85, align 4, !invariant.load !3
  %87 = icmp sgt i32 %78, %86
  %88 = select i1 %87, i32 %78, i32 %86
  %89 = icmp eq i32 %78, %86
  %90 = icmp slt i32 %83, 8
  %91 = and i1 %89, %90
  %92 = or i1 %87, %91
  %93 = select i1 %92, i32 %83, i32 8
  %94 = add i32 %10, 9
  %95 = getelementptr inbounds i32, ptr %0, i32 %94
  %96 = load i32, ptr %95, align 4, !invariant.load !3
  %97 = icmp sgt i32 %88, %96
  %98 = select i1 %97, i32 %88, i32 %96
  %99 = icmp eq i32 %88, %96
  %100 = icmp slt i32 %93, 9
  %101 = and i1 %99, %100
  %102 = or i1 %97, %101
  %103 = select i1 %102, i32 %93, i32 9
  %104 = add i32 %10, 10
  %105 = getelementptr inbounds i32, ptr %0, i32 %104
  %106 = load i32, ptr %105, align 4, !invariant.load !3
  %107 = icmp sgt i32 %98, %106
  %108 = select i1 %107, i32 %98, i32 %106
  %109 = icmp eq i32 %98, %106
  %110 = icmp slt i32 %103, 10
  %111 = and i1 %109, %110
  %112 = or i1 %107, %111
  %113 = select i1 %112, i32 %103, i32 10
  %114 = add i32 %10, 11
  %115 = getelementptr inbounds i32, ptr %0, i32 %114
  %116 = load i32, ptr %115, align 4, !invariant.load !3
  %117 = icmp sgt i32 %108, %116
  %118 = select i1 %117, i32 %108, i32 %116
  %119 = icmp eq i32 %108, %116
  %120 = icmp slt i32 %113, 11
  %121 = and i1 %119, %120
  %122 = or i1 %117, %121
  %123 = select i1 %122, i32 %113, i32 11
  %124 = add i32 %10, 12
  %125 = getelementptr inbounds i32, ptr %0, i32 %124
  %126 = load i32, ptr %125, align 4, !invariant.load !3
  %127 = icmp sgt i32 %118, %126
  %128 = select i1 %127, i32 %118, i32 %126
  %129 = icmp eq i32 %118, %126
  %130 = icmp slt i32 %123, 12
  %131 = and i1 %129, %130
  %132 = or i1 %127, %131
  %133 = select i1 %132, i32 %123, i32 12
  %134 = add i32 %10, 13
  %135 = getelementptr inbounds i32, ptr %0, i32 %134
  %136 = load i32, ptr %135, align 4, !invariant.load !3
  %137 = icmp sgt i32 %128, %136
  %138 = select i1 %137, i32 %128, i32 %136
  %139 = icmp eq i32 %128, %136
  %140 = icmp slt i32 %133, 13
  %141 = and i1 %139, %140
  %142 = or i1 %137, %141
  %143 = select i1 %142, i32 %133, i32 13
  %144 = getelementptr inbounds i32, ptr %1, i32 %7
  store i32 %138, ptr %144, align 4
  %145 = getelementptr inbounds i32, ptr %2, i32 %7
  store i32 %143, ptr %145, align 4
  ret void
}

define ptx_kernel void @loop_and_fusion_1(ptr noalias align 256 dereferenceable(165) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %2, 128
  %5 = add i32 %4, %3
  %6 = icmp sle i32 %5, 164
  br i1 %6, label %7, label %14

7:                                                ; preds = %1
  %8 = srem i32 %5, 15
  %9 = icmp slt i32 %8, 0
  %10 = icmp ne i32 %8, 0
  %11 = and i1 %9, %10
  %12 = zext i1 %11 to i8
  %13 = getelementptr inbounds i8, ptr %0, i32 %5
  store i8 %12, ptr %13, align 1
  br label %14

14:                                               ; preds = %7, %1
  ret void
}

define ptx_kernel void @loop_select_fusion_3(ptr noalias align 256 dereferenceable(73728) %0, ptr noalias align 256 dereferenceable(165) %1, ptr noalias align 256 dereferenceable(1013760) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = mul i32 %5, 4
  %7 = mul i32 %4, 512
  %8 = add i32 %6, %7
  %9 = udiv i32 %8, 165
  %10 = urem i32 %8, 165
  %11 = sext i32 %10 to i64
  %12 = lshr i64 %11, 32
  %13 = trunc i64 %12 to i32
  %14 = call i32 @fused_select_3_bitcast_99_4(ptr %0, ptr %1, i32 %9, i32 1)
  %15 = add i32 %10, %14
  %16 = shl i32 %15, 13
  %17 = lshr i32 %15, 19
  %18 = call i32 @fused_select_3_bitcast_99_4(ptr %0, ptr %1, i32 %9, i32 0)
  %19 = add i32 %13, %18
  %20 = or i32 %16, %17
  %21 = add i32 %19, %15
  %22 = xor i32 %21, %20
  %23 = shl i32 %22, 15
  %24 = lshr i32 %22, 17
  %25 = or i32 %23, %24
  %26 = add i32 %21, %22
  %27 = xor i32 %26, %25
  %28 = shl i32 %27, 26
  %29 = lshr i32 %27, 6
  %30 = add i32 %26, %27
  %31 = or i32 %28, %29
  %32 = xor i32 %30, %31
  %33 = shl i32 %32, 6
  %34 = lshr i32 %32, 26
  %35 = or i32 %33, %34
  %36 = add i32 %30, %32
  %37 = xor i32 %36, %35
  %38 = xor i32 %18, %14
  %39 = xor i32 %38, 466688986
  %40 = add i32 %37, %39
  %41 = add i32 %40, 1
  %42 = shl i32 %41, 17
  %43 = lshr i32 %41, 15
  %44 = add i32 %36, %14
  %45 = or i32 %42, %43
  %46 = add i32 %44, %41
  %47 = xor i32 %46, %45
  %48 = shl i32 %47, 29
  %49 = lshr i32 %47, 3
  %50 = or i32 %48, %49
  %51 = add i32 %46, %47
  %52 = xor i32 %51, %50
  %53 = shl i32 %52, 16
  %54 = lshr i32 %52, 16
  %55 = add i32 %51, %52
  %56 = or i32 %53, %54
  %57 = xor i32 %55, %56
  %58 = shl i32 %57, 24
  %59 = lshr i32 %57, 8
  %60 = or i32 %58, %59
  %61 = add i32 %55, %57
  %62 = xor i32 %61, %60
  %63 = add i32 %62, %18
  %64 = add i32 %63, 2
  %65 = shl i32 %64, 13
  %66 = lshr i32 %64, 19
  %67 = add i32 %61, %39
  %68 = or i32 %65, %66
  %69 = add i32 %67, %64
  %70 = xor i32 %69, %68
  %71 = shl i32 %70, 15
  %72 = lshr i32 %70, 17
  %73 = or i32 %71, %72
  %74 = add i32 %69, %70
  %75 = xor i32 %74, %73
  %76 = shl i32 %75, 26
  %77 = lshr i32 %75, 6
  %78 = add i32 %74, %75
  %79 = or i32 %76, %77
  %80 = xor i32 %78, %79
  %81 = shl i32 %80, 6
  %82 = lshr i32 %80, 26
  %83 = or i32 %81, %82
  %84 = add i32 %78, %80
  %85 = xor i32 %84, %83
  %86 = add i32 %85, %14
  %87 = add i32 %86, 3
  %88 = shl i32 %87, 17
  %89 = lshr i32 %87, 15
  %90 = add i32 %84, %18
  %91 = or i32 %88, %89
  %92 = add i32 %90, %87
  %93 = xor i32 %92, %91
  %94 = shl i32 %93, 29
  %95 = lshr i32 %93, 3
  %96 = or i32 %94, %95
  %97 = add i32 %92, %93
  %98 = xor i32 %97, %96
  %99 = shl i32 %98, 16
  %100 = lshr i32 %98, 16
  %101 = add i32 %97, %98
  %102 = or i32 %99, %100
  %103 = xor i32 %101, %102
  %104 = shl i32 %103, 24
  %105 = lshr i32 %103, 8
  %106 = or i32 %104, %105
  %107 = add i32 %101, %103
  %108 = xor i32 %107, %106
  %109 = add i32 %108, %39
  %110 = add i32 %109, 4
  %111 = shl i32 %110, 13
  %112 = lshr i32 %110, 19
  %113 = add i32 %107, %14
  %114 = or i32 %111, %112
  %115 = add i32 %113, %110
  %116 = xor i32 %115, %114
  %117 = shl i32 %116, 15
  %118 = lshr i32 %116, 17
  %119 = or i32 %117, %118
  %120 = add i32 %115, %116
  %121 = xor i32 %120, %119
  %122 = shl i32 %121, 26
  %123 = lshr i32 %121, 6
  %124 = add i32 %120, %121
  %125 = or i32 %122, %123
  %126 = xor i32 %124, %125
  %127 = shl i32 %126, 6
  %128 = lshr i32 %126, 26
  %129 = or i32 %127, %128
  %130 = add i32 %124, %126
  %131 = xor i32 %130, %129
  %132 = add i32 %131, %18
  %133 = add i32 %130, %39
  %134 = add i32 %132, 5
  %135 = xor i32 %133, %134
  %136 = lshr i32 %135, 9
  %137 = or i32 %136, 1065353216
  %138 = bitcast i32 %137 to float
  %139 = fadd float %138, -1.000000e+00
  %140 = getelementptr inbounds i8, ptr %1, i32 %10
  %141 = load i8, ptr %140, align 1, !invariant.load !3
  %142 = srem i32 %10, 15
  %143 = add i32 %142, 15
  %144 = trunc i8 %141 to i1
  %145 = select i1 %144, i32 %143, i32 %142
  %146 = icmp sge i32 %145, 3
  %147 = icmp sle i32 %145, 11
  %148 = and i1 %146, %147
  %149 = call float @llvm.maximum.f32(float %139, float 0.000000e+00)
  %150 = select i1 %148, float %149, float -1.000000e+00
  %151 = insertelement <4 x float> zeroinitializer, float %150, i64 0
  %152 = add i32 %8, 1
  %153 = udiv i32 %152, 165
  %154 = urem i32 %152, 165
  %155 = sext i32 %154 to i64
  %156 = lshr i64 %155, 32
  %157 = trunc i64 %156 to i32
  %158 = call i32 @fused_select_3_bitcast_99_4(ptr %0, ptr %1, i32 %153, i32 1)
  %159 = add i32 %154, %158
  %160 = shl i32 %159, 13
  %161 = lshr i32 %159, 19
  %162 = call i32 @fused_select_3_bitcast_99_4(ptr %0, ptr %1, i32 %153, i32 0)
  %163 = add i32 %157, %162
  %164 = or i32 %160, %161
  %165 = add i32 %163, %159
  %166 = xor i32 %165, %164
  %167 = shl i32 %166, 15
  %168 = lshr i32 %166, 17
  %169 = or i32 %167, %168
  %170 = add i32 %165, %166
  %171 = xor i32 %170, %169
  %172 = shl i32 %171, 26
  %173 = lshr i32 %171, 6
  %174 = add i32 %170, %171
  %175 = or i32 %172, %173
  %176 = xor i32 %174, %175
  %177 = shl i32 %176, 6
  %178 = lshr i32 %176, 26
  %179 = or i32 %177, %178
  %180 = add i32 %174, %176
  %181 = xor i32 %180, %179
  %182 = xor i32 %162, %158
  %183 = xor i32 %182, 466688986
  %184 = add i32 %181, %183
  %185 = add i32 %184, 1
  %186 = shl i32 %185, 17
  %187 = lshr i32 %185, 15
  %188 = add i32 %180, %158
  %189 = or i32 %186, %187
  %190 = add i32 %188, %185
  %191 = xor i32 %190, %189
  %192 = shl i32 %191, 29
  %193 = lshr i32 %191, 3
  %194 = or i32 %192, %193
  %195 = add i32 %190, %191
  %196 = xor i32 %195, %194
  %197 = shl i32 %196, 16
  %198 = lshr i32 %196, 16
  %199 = add i32 %195, %196
  %200 = or i32 %197, %198
  %201 = xor i32 %199, %200
  %202 = shl i32 %201, 24
  %203 = lshr i32 %201, 8
  %204 = or i32 %202, %203
  %205 = add i32 %199, %201
  %206 = xor i32 %205, %204
  %207 = add i32 %206, %162
  %208 = add i32 %207, 2
  %209 = shl i32 %208, 13
  %210 = lshr i32 %208, 19
  %211 = add i32 %205, %183
  %212 = or i32 %209, %210
  %213 = add i32 %211, %208
  %214 = xor i32 %213, %212
  %215 = shl i32 %214, 15
  %216 = lshr i32 %214, 17
  %217 = or i32 %215, %216
  %218 = add i32 %213, %214
  %219 = xor i32 %218, %217
  %220 = shl i32 %219, 26
  %221 = lshr i32 %219, 6
  %222 = add i32 %218, %219
  %223 = or i32 %220, %221
  %224 = xor i32 %222, %223
  %225 = shl i32 %224, 6
  %226 = lshr i32 %224, 26
  %227 = or i32 %225, %226
  %228 = add i32 %222, %224
  %229 = xor i32 %228, %227
  %230 = add i32 %229, %158
  %231 = add i32 %230, 3
  %232 = shl i32 %231, 17
  %233 = lshr i32 %231, 15
  %234 = add i32 %228, %162
  %235 = or i32 %232, %233
  %236 = add i32 %234, %231
  %237 = xor i32 %236, %235
  %238 = shl i32 %237, 29
  %239 = lshr i32 %237, 3
  %240 = or i32 %238, %239
  %241 = add i32 %236, %237
  %242 = xor i32 %241, %240
  %243 = shl i32 %242, 16
  %244 = lshr i32 %242, 16
  %245 = add i32 %241, %242
  %246 = or i32 %243, %244
  %247 = xor i32 %245, %246
  %248 = shl i32 %247, 24
  %249 = lshr i32 %247, 8
  %250 = or i32 %248, %249
  %251 = add i32 %245, %247
  %252 = xor i32 %251, %250
  %253 = add i32 %252, %183
  %254 = add i32 %253, 4
  %255 = shl i32 %254, 13
  %256 = lshr i32 %254, 19
  %257 = add i32 %251, %158
  %258 = or i32 %255, %256
  %259 = add i32 %257, %254
  %260 = xor i32 %259, %258
  %261 = shl i32 %260, 15
  %262 = lshr i32 %260, 17
  %263 = or i32 %261, %262
  %264 = add i32 %259, %260
  %265 = xor i32 %264, %263
  %266 = shl i32 %265, 26
  %267 = lshr i32 %265, 6
  %268 = add i32 %264, %265
  %269 = or i32 %266, %267
  %270 = xor i32 %268, %269
  %271 = shl i32 %270, 6
  %272 = lshr i32 %270, 26
  %273 = or i32 %271, %272
  %274 = add i32 %268, %270
  %275 = xor i32 %274, %273
  %276 = add i32 %275, %162
  %277 = add i32 %274, %183
  %278 = add i32 %276, 5
  %279 = xor i32 %277, %278
  %280 = lshr i32 %279, 9
  %281 = or i32 %280, 1065353216
  %282 = bitcast i32 %281 to float
  %283 = fadd float %282, -1.000000e+00
  %284 = getelementptr inbounds i8, ptr %1, i32 %154
  %285 = load i8, ptr %284, align 1, !invariant.load !3
  %286 = srem i32 %154, 15
  %287 = add i32 %286, 15
  %288 = trunc i8 %285 to i1
  %289 = select i1 %288, i32 %287, i32 %286
  %290 = icmp sge i32 %289, 3
  %291 = icmp sle i32 %289, 11
  %292 = and i1 %290, %291
  %293 = call float @llvm.maximum.f32(float %283, float 0.000000e+00)
  %294 = select i1 %292, float %293, float -1.000000e+00
  %295 = insertelement <4 x float> %151, float %294, i64 1
  %296 = add i32 %8, 2
  %297 = udiv i32 %296, 165
  %298 = urem i32 %296, 165
  %299 = sext i32 %298 to i64
  %300 = lshr i64 %299, 32
  %301 = trunc i64 %300 to i32
  %302 = call i32 @fused_select_3_bitcast_99_4(ptr %0, ptr %1, i32 %297, i32 1)
  %303 = add i32 %298, %302
  %304 = shl i32 %303, 13
  %305 = lshr i32 %303, 19
  %306 = call i32 @fused_select_3_bitcast_99_4(ptr %0, ptr %1, i32 %297, i32 0)
  %307 = add i32 %301, %306
  %308 = or i32 %304, %305
  %309 = add i32 %307, %303
  %310 = xor i32 %309, %308
  %311 = shl i32 %310, 15
  %312 = lshr i32 %310, 17
  %313 = or i32 %311, %312
  %314 = add i32 %309, %310
  %315 = xor i32 %314, %313
  %316 = shl i32 %315, 26
  %317 = lshr i32 %315, 6
  %318 = add i32 %314, %315
  %319 = or i32 %316, %317
  %320 = xor i32 %318, %319
  %321 = shl i32 %320, 6
  %322 = lshr i32 %320, 26
  %323 = or i32 %321, %322
  %324 = add i32 %318, %320
  %325 = xor i32 %324, %323
  %326 = xor i32 %306, %302
  %327 = xor i32 %326, 466688986
  %328 = add i32 %325, %327
  %329 = add i32 %328, 1
  %330 = shl i32 %329, 17
  %331 = lshr i32 %329, 15
  %332 = add i32 %324, %302
  %333 = or i32 %330, %331
  %334 = add i32 %332, %329
  %335 = xor i32 %334, %333
  %336 = shl i32 %335, 29
  %337 = lshr i32 %335, 3
  %338 = or i32 %336, %337
  %339 = add i32 %334, %335
  %340 = xor i32 %339, %338
  %341 = shl i32 %340, 16
  %342 = lshr i32 %340, 16
  %343 = add i32 %339, %340
  %344 = or i32 %341, %342
  %345 = xor i32 %343, %344
  %346 = shl i32 %345, 24
  %347 = lshr i32 %345, 8
  %348 = or i32 %346, %347
  %349 = add i32 %343, %345
  %350 = xor i32 %349, %348
  %351 = add i32 %350, %306
  %352 = add i32 %351, 2
  %353 = shl i32 %352, 13
  %354 = lshr i32 %352, 19
  %355 = add i32 %349, %327
  %356 = or i32 %353, %354
  %357 = add i32 %355, %352
  %358 = xor i32 %357, %356
  %359 = shl i32 %358, 15
  %360 = lshr i32 %358, 17
  %361 = or i32 %359, %360
  %362 = add i32 %357, %358
  %363 = xor i32 %362, %361
  %364 = shl i32 %363, 26
  %365 = lshr i32 %363, 6
  %366 = add i32 %362, %363
  %367 = or i32 %364, %365
  %368 = xor i32 %366, %367
  %369 = shl i32 %368, 6
  %370 = lshr i32 %368, 26
  %371 = or i32 %369, %370
  %372 = add i32 %366, %368
  %373 = xor i32 %372, %371
  %374 = add i32 %373, %302
  %375 = add i32 %374, 3
  %376 = shl i32 %375, 17
  %377 = lshr i32 %375, 15
  %378 = add i32 %372, %306
  %379 = or i32 %376, %377
  %380 = add i32 %378, %375
  %381 = xor i32 %380, %379
  %382 = shl i32 %381, 29
  %383 = lshr i32 %381, 3
  %384 = or i32 %382, %383
  %385 = add i32 %380, %381
  %386 = xor i32 %385, %384
  %387 = shl i32 %386, 16
  %388 = lshr i32 %386, 16
  %389 = add i32 %385, %386
  %390 = or i32 %387, %388
  %391 = xor i32 %389, %390
  %392 = shl i32 %391, 24
  %393 = lshr i32 %391, 8
  %394 = or i32 %392, %393
  %395 = add i32 %389, %391
  %396 = xor i32 %395, %394
  %397 = add i32 %396, %327
  %398 = add i32 %397, 4
  %399 = shl i32 %398, 13
  %400 = lshr i32 %398, 19
  %401 = add i32 %395, %302
  %402 = or i32 %399, %400
  %403 = add i32 %401, %398
  %404 = xor i32 %403, %402
  %405 = shl i32 %404, 15
  %406 = lshr i32 %404, 17
  %407 = or i32 %405, %406
  %408 = add i32 %403, %404
  %409 = xor i32 %408, %407
  %410 = shl i32 %409, 26
  %411 = lshr i32 %409, 6
  %412 = add i32 %408, %409
  %413 = or i32 %410, %411
  %414 = xor i32 %412, %413
  %415 = shl i32 %414, 6
  %416 = lshr i32 %414, 26
  %417 = or i32 %415, %416
  %418 = add i32 %412, %414
  %419 = xor i32 %418, %417
  %420 = add i32 %419, %306
  %421 = add i32 %418, %327
  %422 = add i32 %420, 5
  %423 = xor i32 %421, %422
  %424 = lshr i32 %423, 9
  %425 = or i32 %424, 1065353216
  %426 = bitcast i32 %425 to float
  %427 = fadd float %426, -1.000000e+00
  %428 = getelementptr inbounds i8, ptr %1, i32 %298
  %429 = load i8, ptr %428, align 1, !invariant.load !3
  %430 = srem i32 %298, 15
  %431 = add i32 %430, 15
  %432 = trunc i8 %429 to i1
  %433 = select i1 %432, i32 %431, i32 %430
  %434 = icmp sge i32 %433, 3
  %435 = icmp sle i32 %433, 11
  %436 = and i1 %434, %435
  %437 = call float @llvm.maximum.f32(float %427, float 0.000000e+00)
  %438 = select i1 %436, float %437, float -1.000000e+00
  %439 = insertelement <4 x float> %295, float %438, i64 2
  %440 = add i32 %8, 3
  %441 = udiv i32 %440, 165
  %442 = urem i32 %440, 165
  %443 = sext i32 %442 to i64
  %444 = lshr i64 %443, 32
  %445 = trunc i64 %444 to i32
  %446 = call i32 @fused_select_3_bitcast_99_4(ptr %0, ptr %1, i32 %441, i32 1)
  %447 = add i32 %442, %446
  %448 = shl i32 %447, 13
  %449 = lshr i32 %447, 19
  %450 = call i32 @fused_select_3_bitcast_99_4(ptr %0, ptr %1, i32 %441, i32 0)
  %451 = add i32 %445, %450
  %452 = or i32 %448, %449
  %453 = add i32 %451, %447
  %454 = xor i32 %453, %452
  %455 = shl i32 %454, 15
  %456 = lshr i32 %454, 17
  %457 = or i32 %455, %456
  %458 = add i32 %453, %454
  %459 = xor i32 %458, %457
  %460 = shl i32 %459, 26
  %461 = lshr i32 %459, 6
  %462 = add i32 %458, %459
  %463 = or i32 %460, %461
  %464 = xor i32 %462, %463
  %465 = shl i32 %464, 6
  %466 = lshr i32 %464, 26
  %467 = or i32 %465, %466
  %468 = add i32 %462, %464
  %469 = xor i32 %468, %467
  %470 = xor i32 %450, %446
  %471 = xor i32 %470, 466688986
  %472 = add i32 %469, %471
  %473 = add i32 %472, 1
  %474 = shl i32 %473, 17
  %475 = lshr i32 %473, 15
  %476 = add i32 %468, %446
  %477 = or i32 %474, %475
  %478 = add i32 %476, %473
  %479 = xor i32 %478, %477
  %480 = shl i32 %479, 29
  %481 = lshr i32 %479, 3
  %482 = or i32 %480, %481
  %483 = add i32 %478, %479
  %484 = xor i32 %483, %482
  %485 = shl i32 %484, 16
  %486 = lshr i32 %484, 16
  %487 = add i32 %483, %484
  %488 = or i32 %485, %486
  %489 = xor i32 %487, %488
  %490 = shl i32 %489, 24
  %491 = lshr i32 %489, 8
  %492 = or i32 %490, %491
  %493 = add i32 %487, %489
  %494 = xor i32 %493, %492
  %495 = add i32 %494, %450
  %496 = add i32 %495, 2
  %497 = shl i32 %496, 13
  %498 = lshr i32 %496, 19
  %499 = add i32 %493, %471
  %500 = or i32 %497, %498
  %501 = add i32 %499, %496
  %502 = xor i32 %501, %500
  %503 = shl i32 %502, 15
  %504 = lshr i32 %502, 17
  %505 = or i32 %503, %504
  %506 = add i32 %501, %502
  %507 = xor i32 %506, %505
  %508 = shl i32 %507, 26
  %509 = lshr i32 %507, 6
  %510 = add i32 %506, %507
  %511 = or i32 %508, %509
  %512 = xor i32 %510, %511
  %513 = shl i32 %512, 6
  %514 = lshr i32 %512, 26
  %515 = or i32 %513, %514
  %516 = add i32 %510, %512
  %517 = xor i32 %516, %515
  %518 = add i32 %517, %446
  %519 = add i32 %518, 3
  %520 = shl i32 %519, 17
  %521 = lshr i32 %519, 15
  %522 = add i32 %516, %450
  %523 = or i32 %520, %521
  %524 = add i32 %522, %519
  %525 = xor i32 %524, %523
  %526 = shl i32 %525, 29
  %527 = lshr i32 %525, 3
  %528 = or i32 %526, %527
  %529 = add i32 %524, %525
  %530 = xor i32 %529, %528
  %531 = shl i32 %530, 16
  %532 = lshr i32 %530, 16
  %533 = add i32 %529, %530
  %534 = or i32 %531, %532
  %535 = xor i32 %533, %534
  %536 = shl i32 %535, 24
  %537 = lshr i32 %535, 8
  %538 = or i32 %536, %537
  %539 = add i32 %533, %535
  %540 = xor i32 %539, %538
  %541 = add i32 %540, %471
  %542 = add i32 %541, 4
  %543 = shl i32 %542, 13
  %544 = lshr i32 %542, 19
  %545 = add i32 %539, %446
  %546 = or i32 %543, %544
  %547 = add i32 %545, %542
  %548 = xor i32 %547, %546
  %549 = shl i32 %548, 15
  %550 = lshr i32 %548, 17
  %551 = or i32 %549, %550
  %552 = add i32 %547, %548
  %553 = xor i32 %552, %551
  %554 = shl i32 %553, 26
  %555 = lshr i32 %553, 6
  %556 = add i32 %552, %553
  %557 = or i32 %554, %555
  %558 = xor i32 %556, %557
  %559 = shl i32 %558, 6
  %560 = lshr i32 %558, 26
  %561 = or i32 %559, %560
  %562 = add i32 %556, %558
  %563 = xor i32 %562, %561
  %564 = add i32 %563, %450
  %565 = add i32 %562, %471
  %566 = add i32 %564, 5
  %567 = xor i32 %565, %566
  %568 = lshr i32 %567, 9
  %569 = or i32 %568, 1065353216
  %570 = bitcast i32 %569 to float
  %571 = fadd float %570, -1.000000e+00
  %572 = getelementptr inbounds i8, ptr %1, i32 %442
  %573 = load i8, ptr %572, align 1, !invariant.load !3
  %574 = srem i32 %442, 15
  %575 = add i32 %574, 15
  %576 = trunc i8 %573 to i1
  %577 = select i1 %576, i32 %575, i32 %574
  %578 = icmp sge i32 %577, 3
  %579 = icmp sle i32 %577, 11
  %580 = and i1 %578, %579
  %581 = call float @llvm.maximum.f32(float %571, float 0.000000e+00)
  %582 = select i1 %580, float %581, float -1.000000e+00
  %583 = insertelement <4 x float> %439, float %582, i64 3
  %584 = getelementptr inbounds float, ptr %2, i32 %8
  store <4 x float> %583, ptr %584, align 16
  ret void
}

define internal i32 @fused_select_3_bitcast_99_4(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = mul i32 %2, 2
  %6 = add i32 %5, %3
  %7 = add i32 %6, 12288
  %8 = getelementptr inbounds i32, ptr %0, i32 %7
  %9 = load i32, ptr %8, align 4, !invariant.load !3
  ret i32 %9
}

define ptx_kernel void @wrapped_iota_2(ptr noalias align 256 dereferenceable(1013760) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %3, 4
  %5 = mul i32 %2, 512
  %6 = add i32 %4, %5
  %7 = urem i32 %6, 165
  %8 = insertelement <4 x i32> zeroinitializer, i32 %7, i64 0
  %9 = add i32 %6, 1
  %10 = urem i32 %9, 165
  %11 = insertelement <4 x i32> %8, i32 %10, i64 1
  %12 = add i32 %6, 2
  %13 = urem i32 %12, 165
  %14 = insertelement <4 x i32> %11, i32 %13, i64 2
  %15 = add i32 %6, 3
  %16 = urem i32 %15, 165
  %17 = insertelement <4 x i32> %14, i32 %16, i64 3
  %18 = getelementptr inbounds i32, ptr %0, i32 %6
  store <4 x i32> %17, ptr %18, align 16
  ret void
}

define ptx_kernel void @sort_6_0(ptr noalias align 256 dereferenceable(1013760) %arg0, ptr noalias align 256 dereferenceable(1013760) %arg1) #0 {
entry:
  %compare_return_buffer532 = alloca i8, align 1
  %compare_return_buffer526 = alloca i8, align 1
  %compare_return_buffer517 = alloca i8, align 1
  %compare_return_buffer511 = alloca i8, align 1
  %compare_return_buffer502 = alloca i8, align 1
  %compare_return_buffer496 = alloca i8, align 1
  %compare_return_buffer487 = alloca i8, align 1
  %compare_return_buffer481 = alloca i8, align 1
  %compare_return_buffer472 = alloca i8, align 1
  %compare_return_buffer466 = alloca i8, align 1
  %compare_return_buffer457 = alloca i8, align 1
  %compare_return_buffer451 = alloca i8, align 1
  %compare_return_buffer442 = alloca i8, align 1
  %compare_return_buffer436 = alloca i8, align 1
  %compare_return_buffer427 = alloca i8, align 1
  %compare_return_buffer421 = alloca i8, align 1
  %compare_return_buffer412 = alloca i8, align 1
  %compare_return_buffer406 = alloca i8, align 1
  %compare_return_buffer397 = alloca i8, align 1
  %compare_return_buffer391 = alloca i8, align 1
  %compare_return_buffer382 = alloca i8, align 1
  %compare_return_buffer376 = alloca i8, align 1
  %compare_return_buffer367 = alloca i8, align 1
  %compare_return_buffer361 = alloca i8, align 1
  %compare_return_buffer352 = alloca i8, align 1
  %compare_return_buffer346 = alloca i8, align 1
  %compare_return_buffer337 = alloca i8, align 1
  %compare_return_buffer331 = alloca i8, align 1
  %compare_return_buffer322 = alloca i8, align 1
  %compare_return_buffer316 = alloca i8, align 1
  %compare_return_buffer307 = alloca i8, align 1
  %compare_return_buffer301 = alloca i8, align 1
  %compare_return_buffer292 = alloca i8, align 1
  %compare_return_buffer286 = alloca i8, align 1
  %compare_return_buffer277 = alloca i8, align 1
  %compare_return_buffer271 = alloca i8, align 1
  %compare_return_buffer262 = alloca i8, align 1
  %compare_return_buffer256 = alloca i8, align 1
  %compare_return_buffer247 = alloca i8, align 1
  %compare_return_buffer241 = alloca i8, align 1
  %compare_return_buffer232 = alloca i8, align 1
  %compare_return_buffer226 = alloca i8, align 1
  %compare_return_buffer217 = alloca i8, align 1
  %compare_return_buffer211 = alloca i8, align 1
  %compare_return_buffer202 = alloca i8, align 1
  %compare_return_buffer196 = alloca i8, align 1
  %compare_return_buffer187 = alloca i8, align 1
  %compare_return_buffer181 = alloca i8, align 1
  %compare_return_buffer172 = alloca i8, align 1
  %compare_return_buffer166 = alloca i8, align 1
  %compare_return_buffer157 = alloca i8, align 1
  %compare_return_buffer151 = alloca i8, align 1
  %compare_return_buffer142 = alloca i8, align 1
  %compare_return_buffer136 = alloca i8, align 1
  %compare_return_buffer127 = alloca i8, align 1
  %compare_return_buffer121 = alloca i8, align 1
  %compare_return_buffer112 = alloca i8, align 1
  %compare_return_buffer106 = alloca i8, align 1
  %compare_return_buffer97 = alloca i8, align 1
  %compare_return_buffer91 = alloca i8, align 1
  %compare_return_buffer82 = alloca i8, align 1
  %compare_return_buffer76 = alloca i8, align 1
  %compare_return_buffer67 = alloca i8, align 1
  %compare_return_buffer61 = alloca i8, align 1
  %compare_return_buffer52 = alloca i8, align 1
  %compare_return_buffer46 = alloca i8, align 1
  %compare_return_buffer37 = alloca i8, align 1
  %compare_return_buffer31 = alloca i8, align 1
  %compare_return_buffer22 = alloca i8, align 1
  %compare_return_buffer16 = alloca i8, align 1
  %compare_return_buffer7 = alloca i8, align 1
  %compare_return_buffer = alloca i8, align 1
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %block_id = zext i32 %0 to i64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %thread_id_x = zext i32 %1 to i64
  %2 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %2, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 196608
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %3 = udiv i64 %linear_index0, 1
  %4 = urem i64 %3, 128
  %5 = udiv i64 %linear_index0, 128
  %6 = icmp ult i64 %linear_index, 196608
  br i1 %6, label %sort.6.0.in_bounds-true, label %sort.6.0.in_bounds-after

sort.6.0.in_bounds-after:                         ; preds = %smaller_keys_index-after541, %entry
  ret void

sort.6.0.in_bounds-true:                          ; preds = %entry
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %thread.id.x = sext i32 %7 to i64
  %8 = shl i64 %4, 1
  %9 = icmp slt i64 %8, 165
  br i1 %9, label %smaller_keys_index-true, label %smaller_keys_index-after

smaller_keys_index-after:                         ; preds = %inner_smaller_keys_index-after, %sort.6.0.in_bounds-true
  %10 = shl i64 %4, 1
  %11 = icmp slt i64 %10, 165
  br i1 %11, label %smaller_keys_index-true1, label %smaller_keys_index-after2

smaller_keys_index-after2:                        ; preds = %inner_smaller_keys_index-after4, %smaller_keys_index-after
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %12 = mul i64 %4, 2
  %13 = icmp uge i64 %12, 0
  br i1 %13, label %is_last_tile-true, label %is_last_tile-false

is_last_tile-after:                               ; preds = %smaller_comparison_index-after6, %smaller_comparison_index-after
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %14 = mul i64 %4, 2
  %15 = icmp uge i64 %14, 0
  br i1 %15, label %is_last_tile-true11, label %is_last_tile-false12

is_last_tile-after13:                             ; preds = %smaller_comparison_index-after21, %smaller_comparison_index-after15
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %16 = mul i64 %4, 2
  %17 = icmp uge i64 %16, 0
  br i1 %17, label %is_last_tile-true26, label %is_last_tile-false27

is_last_tile-after28:                             ; preds = %smaller_comparison_index-after36, %smaller_comparison_index-after30
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %18 = mul i64 %4, 2
  %19 = icmp uge i64 %18, 0
  br i1 %19, label %is_last_tile-true41, label %is_last_tile-false42

is_last_tile-after43:                             ; preds = %smaller_comparison_index-after51, %smaller_comparison_index-after45
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %20 = mul i64 %4, 2
  %21 = icmp uge i64 %20, 0
  br i1 %21, label %is_last_tile-true56, label %is_last_tile-false57

is_last_tile-after58:                             ; preds = %smaller_comparison_index-after66, %smaller_comparison_index-after60
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %22 = mul i64 %4, 2
  %23 = icmp uge i64 %22, 0
  br i1 %23, label %is_last_tile-true71, label %is_last_tile-false72

is_last_tile-after73:                             ; preds = %smaller_comparison_index-after81, %smaller_comparison_index-after75
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %24 = mul i64 %4, 2
  %25 = icmp uge i64 %24, 0
  br i1 %25, label %is_last_tile-true86, label %is_last_tile-false87

is_last_tile-after88:                             ; preds = %smaller_comparison_index-after96, %smaller_comparison_index-after90
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %26 = mul i64 %4, 2
  %27 = icmp uge i64 %26, 0
  br i1 %27, label %is_last_tile-true101, label %is_last_tile-false102

is_last_tile-after103:                            ; preds = %smaller_comparison_index-after111, %smaller_comparison_index-after105
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %28 = mul i64 %4, 2
  %29 = icmp uge i64 %28, 0
  br i1 %29, label %is_last_tile-true116, label %is_last_tile-false117

is_last_tile-after118:                            ; preds = %smaller_comparison_index-after126, %smaller_comparison_index-after120
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %30 = mul i64 %4, 2
  %31 = icmp uge i64 %30, 0
  br i1 %31, label %is_last_tile-true131, label %is_last_tile-false132

is_last_tile-after133:                            ; preds = %smaller_comparison_index-after141, %smaller_comparison_index-after135
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %32 = mul i64 %4, 2
  %33 = icmp uge i64 %32, 0
  br i1 %33, label %is_last_tile-true146, label %is_last_tile-false147

is_last_tile-after148:                            ; preds = %smaller_comparison_index-after156, %smaller_comparison_index-after150
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %34 = mul i64 %4, 2
  %35 = icmp uge i64 %34, 0
  br i1 %35, label %is_last_tile-true161, label %is_last_tile-false162

is_last_tile-after163:                            ; preds = %smaller_comparison_index-after171, %smaller_comparison_index-after165
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %36 = mul i64 %4, 2
  %37 = icmp uge i64 %36, 0
  br i1 %37, label %is_last_tile-true176, label %is_last_tile-false177

is_last_tile-after178:                            ; preds = %smaller_comparison_index-after186, %smaller_comparison_index-after180
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %38 = mul i64 %4, 2
  %39 = icmp uge i64 %38, 0
  br i1 %39, label %is_last_tile-true191, label %is_last_tile-false192

is_last_tile-after193:                            ; preds = %smaller_comparison_index-after201, %smaller_comparison_index-after195
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %40 = mul i64 %4, 2
  %41 = icmp uge i64 %40, 0
  br i1 %41, label %is_last_tile-true206, label %is_last_tile-false207

is_last_tile-after208:                            ; preds = %smaller_comparison_index-after216, %smaller_comparison_index-after210
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %42 = mul i64 %4, 2
  %43 = icmp uge i64 %42, 0
  br i1 %43, label %is_last_tile-true221, label %is_last_tile-false222

is_last_tile-after223:                            ; preds = %smaller_comparison_index-after231, %smaller_comparison_index-after225
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %44 = mul i64 %4, 2
  %45 = icmp uge i64 %44, 0
  br i1 %45, label %is_last_tile-true236, label %is_last_tile-false237

is_last_tile-after238:                            ; preds = %smaller_comparison_index-after246, %smaller_comparison_index-after240
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %46 = mul i64 %4, 2
  %47 = icmp uge i64 %46, 0
  br i1 %47, label %is_last_tile-true251, label %is_last_tile-false252

is_last_tile-after253:                            ; preds = %smaller_comparison_index-after261, %smaller_comparison_index-after255
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %48 = mul i64 %4, 2
  %49 = icmp uge i64 %48, 0
  br i1 %49, label %is_last_tile-true266, label %is_last_tile-false267

is_last_tile-after268:                            ; preds = %smaller_comparison_index-after276, %smaller_comparison_index-after270
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %50 = mul i64 %4, 2
  %51 = icmp uge i64 %50, 0
  br i1 %51, label %is_last_tile-true281, label %is_last_tile-false282

is_last_tile-after283:                            ; preds = %smaller_comparison_index-after291, %smaller_comparison_index-after285
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %52 = mul i64 %4, 2
  %53 = icmp uge i64 %52, 0
  br i1 %53, label %is_last_tile-true296, label %is_last_tile-false297

is_last_tile-after298:                            ; preds = %smaller_comparison_index-after306, %smaller_comparison_index-after300
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %54 = mul i64 %4, 2
  %55 = icmp uge i64 %54, 0
  br i1 %55, label %is_last_tile-true311, label %is_last_tile-false312

is_last_tile-after313:                            ; preds = %smaller_comparison_index-after321, %smaller_comparison_index-after315
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %56 = mul i64 %4, 2
  %57 = icmp uge i64 %56, 0
  br i1 %57, label %is_last_tile-true326, label %is_last_tile-false327

is_last_tile-after328:                            ; preds = %smaller_comparison_index-after336, %smaller_comparison_index-after330
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %58 = mul i64 %4, 2
  %59 = icmp uge i64 %58, 0
  br i1 %59, label %is_last_tile-true341, label %is_last_tile-false342

is_last_tile-after343:                            ; preds = %smaller_comparison_index-after351, %smaller_comparison_index-after345
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %60 = mul i64 %4, 2
  %61 = icmp uge i64 %60, 0
  br i1 %61, label %is_last_tile-true356, label %is_last_tile-false357

is_last_tile-after358:                            ; preds = %smaller_comparison_index-after366, %smaller_comparison_index-after360
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %62 = mul i64 %4, 2
  %63 = icmp uge i64 %62, 0
  br i1 %63, label %is_last_tile-true371, label %is_last_tile-false372

is_last_tile-after373:                            ; preds = %smaller_comparison_index-after381, %smaller_comparison_index-after375
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %64 = mul i64 %4, 2
  %65 = icmp uge i64 %64, 0
  br i1 %65, label %is_last_tile-true386, label %is_last_tile-false387

is_last_tile-after388:                            ; preds = %smaller_comparison_index-after396, %smaller_comparison_index-after390
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %66 = mul i64 %4, 2
  %67 = icmp uge i64 %66, 0
  br i1 %67, label %is_last_tile-true401, label %is_last_tile-false402

is_last_tile-after403:                            ; preds = %smaller_comparison_index-after411, %smaller_comparison_index-after405
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %68 = mul i64 %4, 2
  %69 = icmp uge i64 %68, 0
  br i1 %69, label %is_last_tile-true416, label %is_last_tile-false417

is_last_tile-after418:                            ; preds = %smaller_comparison_index-after426, %smaller_comparison_index-after420
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %70 = mul i64 %4, 2
  %71 = icmp uge i64 %70, 0
  br i1 %71, label %is_last_tile-true431, label %is_last_tile-false432

is_last_tile-after433:                            ; preds = %smaller_comparison_index-after441, %smaller_comparison_index-after435
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %72 = mul i64 %4, 2
  %73 = icmp uge i64 %72, 0
  br i1 %73, label %is_last_tile-true446, label %is_last_tile-false447

is_last_tile-after448:                            ; preds = %smaller_comparison_index-after456, %smaller_comparison_index-after450
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %74 = mul i64 %4, 2
  %75 = icmp uge i64 %74, 0
  br i1 %75, label %is_last_tile-true461, label %is_last_tile-false462

is_last_tile-after463:                            ; preds = %smaller_comparison_index-after471, %smaller_comparison_index-after465
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %76 = mul i64 %4, 2
  %77 = icmp uge i64 %76, 0
  br i1 %77, label %is_last_tile-true476, label %is_last_tile-false477

is_last_tile-after478:                            ; preds = %smaller_comparison_index-after486, %smaller_comparison_index-after480
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %78 = mul i64 %4, 2
  %79 = icmp uge i64 %78, 0
  br i1 %79, label %is_last_tile-true491, label %is_last_tile-false492

is_last_tile-after493:                            ; preds = %smaller_comparison_index-after501, %smaller_comparison_index-after495
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %80 = mul i64 %4, 2
  %81 = icmp uge i64 %80, 0
  br i1 %81, label %is_last_tile-true506, label %is_last_tile-false507

is_last_tile-after508:                            ; preds = %smaller_comparison_index-after516, %smaller_comparison_index-after510
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %82 = mul i64 %4, 2
  %83 = icmp uge i64 %82, 0
  br i1 %83, label %is_last_tile-true521, label %is_last_tile-false522

is_last_tile-after523:                            ; preds = %smaller_comparison_index-after531, %smaller_comparison_index-after525
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %84 = shl i64 %4, 1
  %85 = icmp slt i64 %84, 165
  br i1 %85, label %smaller_keys_index-true536, label %smaller_keys_index-after537

smaller_keys_index-after537:                      ; preds = %inner_smaller_keys_index-after539, %is_last_tile-after523
  %86 = shl i64 %4, 1
  %87 = icmp slt i64 %86, 165
  br i1 %87, label %smaller_keys_index-true540, label %smaller_keys_index-after541

smaller_keys_index-after541:                      ; preds = %inner_smaller_keys_index-after543, %smaller_keys_index-after537
  br label %sort.6.0.in_bounds-after

smaller_keys_index-true:                          ; preds = %sort.6.0.in_bounds-true
  %88 = shl i64 %thread.id.x, 1
  %89 = getelementptr inbounds [1536 x [165 x float]], ptr %arg0, i64 0, i64 %5, i64 %8
  %90 = load float, ptr %89, align 4
  %91 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %88
  store float %90, ptr addrspace(3) %91, align 4
  %92 = add i64 %8, 1
  %93 = icmp slt i64 %92, 165
  br i1 %93, label %inner_smaller_keys_index-true, label %inner_smaller_keys_index-after

inner_smaller_keys_index-after:                   ; preds = %inner_smaller_keys_index-true, %smaller_keys_index-true
  br label %smaller_keys_index-after

inner_smaller_keys_index-true:                    ; preds = %smaller_keys_index-true
  %94 = add i64 %88, 1
  %95 = getelementptr inbounds [1536 x [165 x float]], ptr %arg0, i64 0, i64 %5, i64 %92
  %96 = load float, ptr %95, align 4
  %97 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %94
  store float %96, ptr addrspace(3) %97, align 4
  br label %inner_smaller_keys_index-after

smaller_keys_index-true1:                         ; preds = %smaller_keys_index-after
  %98 = shl i64 %thread.id.x, 1
  %99 = getelementptr inbounds [1536 x [165 x i32]], ptr %arg1, i64 0, i64 %5, i64 %10
  %100 = load i32, ptr %99, align 4
  %101 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %98
  store i32 %100, ptr addrspace(3) %101, align 4
  %102 = add i64 %10, 1
  %103 = icmp slt i64 %102, 165
  br i1 %103, label %inner_smaller_keys_index-true3, label %inner_smaller_keys_index-after4

inner_smaller_keys_index-after4:                  ; preds = %inner_smaller_keys_index-true3, %smaller_keys_index-true1
  br label %smaller_keys_index-after2

inner_smaller_keys_index-true3:                   ; preds = %smaller_keys_index-true1
  %104 = add i64 %98, 1
  %105 = getelementptr inbounds [1536 x [165 x i32]], ptr %arg1, i64 0, i64 %5, i64 %102
  %106 = load i32, ptr %105, align 4
  %107 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %104
  store i32 %106, ptr addrspace(3) %107, align 4
  br label %inner_smaller_keys_index-after4

is_last_tile-true:                                ; preds = %smaller_keys_index-after2
  %108 = mul i64 %thread.id.x, 2
  %109 = xor i64 %108, 1
  %110 = icmp slt i64 %108, %109
  %111 = icmp slt i64 %109, 165
  %112 = and i1 %110, %111
  br i1 %112, label %smaller_comparison_index-true, label %smaller_comparison_index-after

smaller_comparison_index-after:                   ; preds = %is_smaller_than-after, %is_last_tile-true
  br label %is_last_tile-after

is_last_tile-false:                               ; preds = %smaller_keys_index-after2
  %113 = mul i64 %thread.id.x, 2
  %114 = xor i64 %113, 1
  %115 = icmp slt i64 %113, %114
  %116 = icmp slt i64 %114, 256
  br i1 true, label %smaller_comparison_index-true5, label %smaller_comparison_index-after6

smaller_comparison_index-after6:                  ; preds = %is_smaller_than-after10, %is_last_tile-false
  br label %is_last_tile-after

smaller_comparison_index-true:                    ; preds = %is_last_tile-true
  %117 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %109
  %118 = addrspacecast ptr addrspace(3) %117 to ptr
  %119 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %108
  %120 = addrspacecast ptr addrspace(3) %119 to ptr
  %121 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %109
  %122 = addrspacecast ptr addrspace(3) %121 to ptr
  %123 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %108
  %124 = addrspacecast ptr addrspace(3) %123 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %118, ptr %120, ptr %122, ptr %124, ptr %compare_return_buffer)
  %125 = load i8, ptr %compare_return_buffer, align 1
  %boolean_predicate = icmp ne i8 %125, 0
  br i1 %boolean_predicate, label %is_smaller_than-true, label %is_smaller_than-after

is_smaller_than-after:                            ; preds = %is_smaller_than-true, %smaller_comparison_index-true
  br label %smaller_comparison_index-after

is_smaller_than-true:                             ; preds = %smaller_comparison_index-true
  %126 = load float, ptr %118, align 4
  %127 = load float, ptr %120, align 4
  %128 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %108
  store float %126, ptr addrspace(3) %128, align 4
  %129 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %109
  store float %127, ptr addrspace(3) %129, align 4
  %130 = load i32, ptr %122, align 4
  %131 = load i32, ptr %124, align 4
  %132 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %108
  store i32 %130, ptr addrspace(3) %132, align 4
  %133 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %109
  store i32 %131, ptr addrspace(3) %133, align 4
  br label %is_smaller_than-after

smaller_comparison_index-true5:                   ; preds = %is_last_tile-false
  %134 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %114
  %135 = addrspacecast ptr addrspace(3) %134 to ptr
  %136 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %113
  %137 = addrspacecast ptr addrspace(3) %136 to ptr
  %138 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %114
  %139 = addrspacecast ptr addrspace(3) %138 to ptr
  %140 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %113
  %141 = addrspacecast ptr addrspace(3) %140 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %135, ptr %137, ptr %139, ptr %141, ptr %compare_return_buffer7)
  %142 = load i8, ptr %compare_return_buffer7, align 1
  %boolean_predicate8 = icmp ne i8 %142, 0
  br i1 %boolean_predicate8, label %is_smaller_than-true9, label %is_smaller_than-after10

is_smaller_than-after10:                          ; preds = %is_smaller_than-true9, %smaller_comparison_index-true5
  br label %smaller_comparison_index-after6

is_smaller_than-true9:                            ; preds = %smaller_comparison_index-true5
  %143 = load float, ptr %135, align 4
  %144 = load float, ptr %137, align 4
  %145 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %113
  store float %143, ptr addrspace(3) %145, align 4
  %146 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %114
  store float %144, ptr addrspace(3) %146, align 4
  %147 = load i32, ptr %139, align 4
  %148 = load i32, ptr %141, align 4
  %149 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %113
  store i32 %147, ptr addrspace(3) %149, align 4
  %150 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %114
  store i32 %148, ptr addrspace(3) %150, align 4
  br label %is_smaller_than-after10

is_last_tile-true11:                              ; preds = %is_last_tile-after
  %151 = udiv i64 %thread.id.x, 2
  %152 = urem i64 %thread.id.x, 2
  %153 = mul i64 %151, 4
  %154 = add i64 %153, %152
  %155 = xor i64 %154, 3
  %156 = icmp slt i64 %154, %155
  %157 = icmp slt i64 %155, 165
  %158 = and i1 %156, %157
  br i1 %158, label %smaller_comparison_index-true14, label %smaller_comparison_index-after15

smaller_comparison_index-after15:                 ; preds = %is_smaller_than-after19, %is_last_tile-true11
  br label %is_last_tile-after13

is_last_tile-false12:                             ; preds = %is_last_tile-after
  %159 = udiv i64 %thread.id.x, 2
  %160 = urem i64 %thread.id.x, 2
  %161 = mul i64 %159, 4
  %162 = add i64 %161, %160
  %163 = xor i64 %162, 3
  %164 = icmp slt i64 %162, %163
  %165 = icmp slt i64 %163, 256
  br i1 true, label %smaller_comparison_index-true20, label %smaller_comparison_index-after21

smaller_comparison_index-after21:                 ; preds = %is_smaller_than-after25, %is_last_tile-false12
  br label %is_last_tile-after13

smaller_comparison_index-true14:                  ; preds = %is_last_tile-true11
  %166 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %155
  %167 = addrspacecast ptr addrspace(3) %166 to ptr
  %168 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %154
  %169 = addrspacecast ptr addrspace(3) %168 to ptr
  %170 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %155
  %171 = addrspacecast ptr addrspace(3) %170 to ptr
  %172 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %154
  %173 = addrspacecast ptr addrspace(3) %172 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %167, ptr %169, ptr %171, ptr %173, ptr %compare_return_buffer16)
  %174 = load i8, ptr %compare_return_buffer16, align 1
  %boolean_predicate17 = icmp ne i8 %174, 0
  br i1 %boolean_predicate17, label %is_smaller_than-true18, label %is_smaller_than-after19

is_smaller_than-after19:                          ; preds = %is_smaller_than-true18, %smaller_comparison_index-true14
  br label %smaller_comparison_index-after15

is_smaller_than-true18:                           ; preds = %smaller_comparison_index-true14
  %175 = load float, ptr %167, align 4
  %176 = load float, ptr %169, align 4
  %177 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %154
  store float %175, ptr addrspace(3) %177, align 4
  %178 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %155
  store float %176, ptr addrspace(3) %178, align 4
  %179 = load i32, ptr %171, align 4
  %180 = load i32, ptr %173, align 4
  %181 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %154
  store i32 %179, ptr addrspace(3) %181, align 4
  %182 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %155
  store i32 %180, ptr addrspace(3) %182, align 4
  br label %is_smaller_than-after19

smaller_comparison_index-true20:                  ; preds = %is_last_tile-false12
  %183 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %163
  %184 = addrspacecast ptr addrspace(3) %183 to ptr
  %185 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %162
  %186 = addrspacecast ptr addrspace(3) %185 to ptr
  %187 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %163
  %188 = addrspacecast ptr addrspace(3) %187 to ptr
  %189 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %162
  %190 = addrspacecast ptr addrspace(3) %189 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %184, ptr %186, ptr %188, ptr %190, ptr %compare_return_buffer22)
  %191 = load i8, ptr %compare_return_buffer22, align 1
  %boolean_predicate23 = icmp ne i8 %191, 0
  br i1 %boolean_predicate23, label %is_smaller_than-true24, label %is_smaller_than-after25

is_smaller_than-after25:                          ; preds = %is_smaller_than-true24, %smaller_comparison_index-true20
  br label %smaller_comparison_index-after21

is_smaller_than-true24:                           ; preds = %smaller_comparison_index-true20
  %192 = load float, ptr %184, align 4
  %193 = load float, ptr %186, align 4
  %194 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %162
  store float %192, ptr addrspace(3) %194, align 4
  %195 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %163
  store float %193, ptr addrspace(3) %195, align 4
  %196 = load i32, ptr %188, align 4
  %197 = load i32, ptr %190, align 4
  %198 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %162
  store i32 %196, ptr addrspace(3) %198, align 4
  %199 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %163
  store i32 %197, ptr addrspace(3) %199, align 4
  br label %is_smaller_than-after25

is_last_tile-true26:                              ; preds = %is_last_tile-after13
  %200 = mul i64 %thread.id.x, 2
  %201 = xor i64 %200, 1
  %202 = icmp slt i64 %200, %201
  %203 = icmp slt i64 %201, 165
  %204 = and i1 %202, %203
  br i1 %204, label %smaller_comparison_index-true29, label %smaller_comparison_index-after30

smaller_comparison_index-after30:                 ; preds = %is_smaller_than-after34, %is_last_tile-true26
  br label %is_last_tile-after28

is_last_tile-false27:                             ; preds = %is_last_tile-after13
  %205 = mul i64 %thread.id.x, 2
  %206 = xor i64 %205, 1
  %207 = icmp slt i64 %205, %206
  %208 = icmp slt i64 %206, 256
  br i1 true, label %smaller_comparison_index-true35, label %smaller_comparison_index-after36

smaller_comparison_index-after36:                 ; preds = %is_smaller_than-after40, %is_last_tile-false27
  br label %is_last_tile-after28

smaller_comparison_index-true29:                  ; preds = %is_last_tile-true26
  %209 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %201
  %210 = addrspacecast ptr addrspace(3) %209 to ptr
  %211 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %200
  %212 = addrspacecast ptr addrspace(3) %211 to ptr
  %213 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %201
  %214 = addrspacecast ptr addrspace(3) %213 to ptr
  %215 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %200
  %216 = addrspacecast ptr addrspace(3) %215 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %210, ptr %212, ptr %214, ptr %216, ptr %compare_return_buffer31)
  %217 = load i8, ptr %compare_return_buffer31, align 1
  %boolean_predicate32 = icmp ne i8 %217, 0
  br i1 %boolean_predicate32, label %is_smaller_than-true33, label %is_smaller_than-after34

is_smaller_than-after34:                          ; preds = %is_smaller_than-true33, %smaller_comparison_index-true29
  br label %smaller_comparison_index-after30

is_smaller_than-true33:                           ; preds = %smaller_comparison_index-true29
  %218 = load float, ptr %210, align 4
  %219 = load float, ptr %212, align 4
  %220 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %200
  store float %218, ptr addrspace(3) %220, align 4
  %221 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %201
  store float %219, ptr addrspace(3) %221, align 4
  %222 = load i32, ptr %214, align 4
  %223 = load i32, ptr %216, align 4
  %224 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %200
  store i32 %222, ptr addrspace(3) %224, align 4
  %225 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %201
  store i32 %223, ptr addrspace(3) %225, align 4
  br label %is_smaller_than-after34

smaller_comparison_index-true35:                  ; preds = %is_last_tile-false27
  %226 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %206
  %227 = addrspacecast ptr addrspace(3) %226 to ptr
  %228 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %205
  %229 = addrspacecast ptr addrspace(3) %228 to ptr
  %230 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %206
  %231 = addrspacecast ptr addrspace(3) %230 to ptr
  %232 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %205
  %233 = addrspacecast ptr addrspace(3) %232 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %227, ptr %229, ptr %231, ptr %233, ptr %compare_return_buffer37)
  %234 = load i8, ptr %compare_return_buffer37, align 1
  %boolean_predicate38 = icmp ne i8 %234, 0
  br i1 %boolean_predicate38, label %is_smaller_than-true39, label %is_smaller_than-after40

is_smaller_than-after40:                          ; preds = %is_smaller_than-true39, %smaller_comparison_index-true35
  br label %smaller_comparison_index-after36

is_smaller_than-true39:                           ; preds = %smaller_comparison_index-true35
  %235 = load float, ptr %227, align 4
  %236 = load float, ptr %229, align 4
  %237 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %205
  store float %235, ptr addrspace(3) %237, align 4
  %238 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %206
  store float %236, ptr addrspace(3) %238, align 4
  %239 = load i32, ptr %231, align 4
  %240 = load i32, ptr %233, align 4
  %241 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %205
  store i32 %239, ptr addrspace(3) %241, align 4
  %242 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %206
  store i32 %240, ptr addrspace(3) %242, align 4
  br label %is_smaller_than-after40

is_last_tile-true41:                              ; preds = %is_last_tile-after28
  %243 = udiv i64 %thread.id.x, 4
  %244 = urem i64 %thread.id.x, 4
  %245 = mul i64 %243, 8
  %246 = add i64 %245, %244
  %247 = xor i64 %246, 7
  %248 = icmp slt i64 %246, %247
  %249 = icmp slt i64 %247, 165
  %250 = and i1 %248, %249
  br i1 %250, label %smaller_comparison_index-true44, label %smaller_comparison_index-after45

smaller_comparison_index-after45:                 ; preds = %is_smaller_than-after49, %is_last_tile-true41
  br label %is_last_tile-after43

is_last_tile-false42:                             ; preds = %is_last_tile-after28
  %251 = udiv i64 %thread.id.x, 4
  %252 = urem i64 %thread.id.x, 4
  %253 = mul i64 %251, 8
  %254 = add i64 %253, %252
  %255 = xor i64 %254, 7
  %256 = icmp slt i64 %254, %255
  %257 = icmp slt i64 %255, 256
  br i1 true, label %smaller_comparison_index-true50, label %smaller_comparison_index-after51

smaller_comparison_index-after51:                 ; preds = %is_smaller_than-after55, %is_last_tile-false42
  br label %is_last_tile-after43

smaller_comparison_index-true44:                  ; preds = %is_last_tile-true41
  %258 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %247
  %259 = addrspacecast ptr addrspace(3) %258 to ptr
  %260 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %246
  %261 = addrspacecast ptr addrspace(3) %260 to ptr
  %262 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %247
  %263 = addrspacecast ptr addrspace(3) %262 to ptr
  %264 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %246
  %265 = addrspacecast ptr addrspace(3) %264 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %259, ptr %261, ptr %263, ptr %265, ptr %compare_return_buffer46)
  %266 = load i8, ptr %compare_return_buffer46, align 1
  %boolean_predicate47 = icmp ne i8 %266, 0
  br i1 %boolean_predicate47, label %is_smaller_than-true48, label %is_smaller_than-after49

is_smaller_than-after49:                          ; preds = %is_smaller_than-true48, %smaller_comparison_index-true44
  br label %smaller_comparison_index-after45

is_smaller_than-true48:                           ; preds = %smaller_comparison_index-true44
  %267 = load float, ptr %259, align 4
  %268 = load float, ptr %261, align 4
  %269 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %246
  store float %267, ptr addrspace(3) %269, align 4
  %270 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %247
  store float %268, ptr addrspace(3) %270, align 4
  %271 = load i32, ptr %263, align 4
  %272 = load i32, ptr %265, align 4
  %273 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %246
  store i32 %271, ptr addrspace(3) %273, align 4
  %274 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %247
  store i32 %272, ptr addrspace(3) %274, align 4
  br label %is_smaller_than-after49

smaller_comparison_index-true50:                  ; preds = %is_last_tile-false42
  %275 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %255
  %276 = addrspacecast ptr addrspace(3) %275 to ptr
  %277 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %254
  %278 = addrspacecast ptr addrspace(3) %277 to ptr
  %279 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %255
  %280 = addrspacecast ptr addrspace(3) %279 to ptr
  %281 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %254
  %282 = addrspacecast ptr addrspace(3) %281 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %276, ptr %278, ptr %280, ptr %282, ptr %compare_return_buffer52)
  %283 = load i8, ptr %compare_return_buffer52, align 1
  %boolean_predicate53 = icmp ne i8 %283, 0
  br i1 %boolean_predicate53, label %is_smaller_than-true54, label %is_smaller_than-after55

is_smaller_than-after55:                          ; preds = %is_smaller_than-true54, %smaller_comparison_index-true50
  br label %smaller_comparison_index-after51

is_smaller_than-true54:                           ; preds = %smaller_comparison_index-true50
  %284 = load float, ptr %276, align 4
  %285 = load float, ptr %278, align 4
  %286 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %254
  store float %284, ptr addrspace(3) %286, align 4
  %287 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %255
  store float %285, ptr addrspace(3) %287, align 4
  %288 = load i32, ptr %280, align 4
  %289 = load i32, ptr %282, align 4
  %290 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %254
  store i32 %288, ptr addrspace(3) %290, align 4
  %291 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %255
  store i32 %289, ptr addrspace(3) %291, align 4
  br label %is_smaller_than-after55

is_last_tile-true56:                              ; preds = %is_last_tile-after43
  %292 = udiv i64 %thread.id.x, 2
  %293 = urem i64 %thread.id.x, 2
  %294 = mul i64 %292, 4
  %295 = add i64 %294, %293
  %296 = xor i64 %295, 2
  %297 = icmp slt i64 %295, %296
  %298 = icmp slt i64 %296, 165
  %299 = and i1 %297, %298
  br i1 %299, label %smaller_comparison_index-true59, label %smaller_comparison_index-after60

smaller_comparison_index-after60:                 ; preds = %is_smaller_than-after64, %is_last_tile-true56
  br label %is_last_tile-after58

is_last_tile-false57:                             ; preds = %is_last_tile-after43
  %300 = udiv i64 %thread.id.x, 2
  %301 = urem i64 %thread.id.x, 2
  %302 = mul i64 %300, 4
  %303 = add i64 %302, %301
  %304 = xor i64 %303, 2
  %305 = icmp slt i64 %303, %304
  %306 = icmp slt i64 %304, 256
  br i1 true, label %smaller_comparison_index-true65, label %smaller_comparison_index-after66

smaller_comparison_index-after66:                 ; preds = %is_smaller_than-after70, %is_last_tile-false57
  br label %is_last_tile-after58

smaller_comparison_index-true59:                  ; preds = %is_last_tile-true56
  %307 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %296
  %308 = addrspacecast ptr addrspace(3) %307 to ptr
  %309 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %295
  %310 = addrspacecast ptr addrspace(3) %309 to ptr
  %311 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %296
  %312 = addrspacecast ptr addrspace(3) %311 to ptr
  %313 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %295
  %314 = addrspacecast ptr addrspace(3) %313 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %308, ptr %310, ptr %312, ptr %314, ptr %compare_return_buffer61)
  %315 = load i8, ptr %compare_return_buffer61, align 1
  %boolean_predicate62 = icmp ne i8 %315, 0
  br i1 %boolean_predicate62, label %is_smaller_than-true63, label %is_smaller_than-after64

is_smaller_than-after64:                          ; preds = %is_smaller_than-true63, %smaller_comparison_index-true59
  br label %smaller_comparison_index-after60

is_smaller_than-true63:                           ; preds = %smaller_comparison_index-true59
  %316 = load float, ptr %308, align 4
  %317 = load float, ptr %310, align 4
  %318 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %295
  store float %316, ptr addrspace(3) %318, align 4
  %319 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %296
  store float %317, ptr addrspace(3) %319, align 4
  %320 = load i32, ptr %312, align 4
  %321 = load i32, ptr %314, align 4
  %322 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %295
  store i32 %320, ptr addrspace(3) %322, align 4
  %323 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %296
  store i32 %321, ptr addrspace(3) %323, align 4
  br label %is_smaller_than-after64

smaller_comparison_index-true65:                  ; preds = %is_last_tile-false57
  %324 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %304
  %325 = addrspacecast ptr addrspace(3) %324 to ptr
  %326 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %303
  %327 = addrspacecast ptr addrspace(3) %326 to ptr
  %328 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %304
  %329 = addrspacecast ptr addrspace(3) %328 to ptr
  %330 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %303
  %331 = addrspacecast ptr addrspace(3) %330 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %325, ptr %327, ptr %329, ptr %331, ptr %compare_return_buffer67)
  %332 = load i8, ptr %compare_return_buffer67, align 1
  %boolean_predicate68 = icmp ne i8 %332, 0
  br i1 %boolean_predicate68, label %is_smaller_than-true69, label %is_smaller_than-after70

is_smaller_than-after70:                          ; preds = %is_smaller_than-true69, %smaller_comparison_index-true65
  br label %smaller_comparison_index-after66

is_smaller_than-true69:                           ; preds = %smaller_comparison_index-true65
  %333 = load float, ptr %325, align 4
  %334 = load float, ptr %327, align 4
  %335 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %303
  store float %333, ptr addrspace(3) %335, align 4
  %336 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %304
  store float %334, ptr addrspace(3) %336, align 4
  %337 = load i32, ptr %329, align 4
  %338 = load i32, ptr %331, align 4
  %339 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %303
  store i32 %337, ptr addrspace(3) %339, align 4
  %340 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %304
  store i32 %338, ptr addrspace(3) %340, align 4
  br label %is_smaller_than-after70

is_last_tile-true71:                              ; preds = %is_last_tile-after58
  %341 = mul i64 %thread.id.x, 2
  %342 = xor i64 %341, 1
  %343 = icmp slt i64 %341, %342
  %344 = icmp slt i64 %342, 165
  %345 = and i1 %343, %344
  br i1 %345, label %smaller_comparison_index-true74, label %smaller_comparison_index-after75

smaller_comparison_index-after75:                 ; preds = %is_smaller_than-after79, %is_last_tile-true71
  br label %is_last_tile-after73

is_last_tile-false72:                             ; preds = %is_last_tile-after58
  %346 = mul i64 %thread.id.x, 2
  %347 = xor i64 %346, 1
  %348 = icmp slt i64 %346, %347
  %349 = icmp slt i64 %347, 256
  br i1 true, label %smaller_comparison_index-true80, label %smaller_comparison_index-after81

smaller_comparison_index-after81:                 ; preds = %is_smaller_than-after85, %is_last_tile-false72
  br label %is_last_tile-after73

smaller_comparison_index-true74:                  ; preds = %is_last_tile-true71
  %350 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %342
  %351 = addrspacecast ptr addrspace(3) %350 to ptr
  %352 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %341
  %353 = addrspacecast ptr addrspace(3) %352 to ptr
  %354 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %342
  %355 = addrspacecast ptr addrspace(3) %354 to ptr
  %356 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %341
  %357 = addrspacecast ptr addrspace(3) %356 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %351, ptr %353, ptr %355, ptr %357, ptr %compare_return_buffer76)
  %358 = load i8, ptr %compare_return_buffer76, align 1
  %boolean_predicate77 = icmp ne i8 %358, 0
  br i1 %boolean_predicate77, label %is_smaller_than-true78, label %is_smaller_than-after79

is_smaller_than-after79:                          ; preds = %is_smaller_than-true78, %smaller_comparison_index-true74
  br label %smaller_comparison_index-after75

is_smaller_than-true78:                           ; preds = %smaller_comparison_index-true74
  %359 = load float, ptr %351, align 4
  %360 = load float, ptr %353, align 4
  %361 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %341
  store float %359, ptr addrspace(3) %361, align 4
  %362 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %342
  store float %360, ptr addrspace(3) %362, align 4
  %363 = load i32, ptr %355, align 4
  %364 = load i32, ptr %357, align 4
  %365 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %341
  store i32 %363, ptr addrspace(3) %365, align 4
  %366 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %342
  store i32 %364, ptr addrspace(3) %366, align 4
  br label %is_smaller_than-after79

smaller_comparison_index-true80:                  ; preds = %is_last_tile-false72
  %367 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %347
  %368 = addrspacecast ptr addrspace(3) %367 to ptr
  %369 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %346
  %370 = addrspacecast ptr addrspace(3) %369 to ptr
  %371 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %347
  %372 = addrspacecast ptr addrspace(3) %371 to ptr
  %373 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %346
  %374 = addrspacecast ptr addrspace(3) %373 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %368, ptr %370, ptr %372, ptr %374, ptr %compare_return_buffer82)
  %375 = load i8, ptr %compare_return_buffer82, align 1
  %boolean_predicate83 = icmp ne i8 %375, 0
  br i1 %boolean_predicate83, label %is_smaller_than-true84, label %is_smaller_than-after85

is_smaller_than-after85:                          ; preds = %is_smaller_than-true84, %smaller_comparison_index-true80
  br label %smaller_comparison_index-after81

is_smaller_than-true84:                           ; preds = %smaller_comparison_index-true80
  %376 = load float, ptr %368, align 4
  %377 = load float, ptr %370, align 4
  %378 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %346
  store float %376, ptr addrspace(3) %378, align 4
  %379 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %347
  store float %377, ptr addrspace(3) %379, align 4
  %380 = load i32, ptr %372, align 4
  %381 = load i32, ptr %374, align 4
  %382 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %346
  store i32 %380, ptr addrspace(3) %382, align 4
  %383 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %347
  store i32 %381, ptr addrspace(3) %383, align 4
  br label %is_smaller_than-after85

is_last_tile-true86:                              ; preds = %is_last_tile-after73
  %384 = udiv i64 %thread.id.x, 8
  %385 = urem i64 %thread.id.x, 8
  %386 = mul i64 %384, 16
  %387 = add i64 %386, %385
  %388 = xor i64 %387, 15
  %389 = icmp slt i64 %387, %388
  %390 = icmp slt i64 %388, 165
  %391 = and i1 %389, %390
  br i1 %391, label %smaller_comparison_index-true89, label %smaller_comparison_index-after90

smaller_comparison_index-after90:                 ; preds = %is_smaller_than-after94, %is_last_tile-true86
  br label %is_last_tile-after88

is_last_tile-false87:                             ; preds = %is_last_tile-after73
  %392 = udiv i64 %thread.id.x, 8
  %393 = urem i64 %thread.id.x, 8
  %394 = mul i64 %392, 16
  %395 = add i64 %394, %393
  %396 = xor i64 %395, 15
  %397 = icmp slt i64 %395, %396
  %398 = icmp slt i64 %396, 256
  br i1 true, label %smaller_comparison_index-true95, label %smaller_comparison_index-after96

smaller_comparison_index-after96:                 ; preds = %is_smaller_than-after100, %is_last_tile-false87
  br label %is_last_tile-after88

smaller_comparison_index-true89:                  ; preds = %is_last_tile-true86
  %399 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %388
  %400 = addrspacecast ptr addrspace(3) %399 to ptr
  %401 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %387
  %402 = addrspacecast ptr addrspace(3) %401 to ptr
  %403 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %388
  %404 = addrspacecast ptr addrspace(3) %403 to ptr
  %405 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %387
  %406 = addrspacecast ptr addrspace(3) %405 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %400, ptr %402, ptr %404, ptr %406, ptr %compare_return_buffer91)
  %407 = load i8, ptr %compare_return_buffer91, align 1
  %boolean_predicate92 = icmp ne i8 %407, 0
  br i1 %boolean_predicate92, label %is_smaller_than-true93, label %is_smaller_than-after94

is_smaller_than-after94:                          ; preds = %is_smaller_than-true93, %smaller_comparison_index-true89
  br label %smaller_comparison_index-after90

is_smaller_than-true93:                           ; preds = %smaller_comparison_index-true89
  %408 = load float, ptr %400, align 4
  %409 = load float, ptr %402, align 4
  %410 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %387
  store float %408, ptr addrspace(3) %410, align 4
  %411 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %388
  store float %409, ptr addrspace(3) %411, align 4
  %412 = load i32, ptr %404, align 4
  %413 = load i32, ptr %406, align 4
  %414 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %387
  store i32 %412, ptr addrspace(3) %414, align 4
  %415 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %388
  store i32 %413, ptr addrspace(3) %415, align 4
  br label %is_smaller_than-after94

smaller_comparison_index-true95:                  ; preds = %is_last_tile-false87
  %416 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %396
  %417 = addrspacecast ptr addrspace(3) %416 to ptr
  %418 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %395
  %419 = addrspacecast ptr addrspace(3) %418 to ptr
  %420 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %396
  %421 = addrspacecast ptr addrspace(3) %420 to ptr
  %422 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %395
  %423 = addrspacecast ptr addrspace(3) %422 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %417, ptr %419, ptr %421, ptr %423, ptr %compare_return_buffer97)
  %424 = load i8, ptr %compare_return_buffer97, align 1
  %boolean_predicate98 = icmp ne i8 %424, 0
  br i1 %boolean_predicate98, label %is_smaller_than-true99, label %is_smaller_than-after100

is_smaller_than-after100:                         ; preds = %is_smaller_than-true99, %smaller_comparison_index-true95
  br label %smaller_comparison_index-after96

is_smaller_than-true99:                           ; preds = %smaller_comparison_index-true95
  %425 = load float, ptr %417, align 4
  %426 = load float, ptr %419, align 4
  %427 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %395
  store float %425, ptr addrspace(3) %427, align 4
  %428 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %396
  store float %426, ptr addrspace(3) %428, align 4
  %429 = load i32, ptr %421, align 4
  %430 = load i32, ptr %423, align 4
  %431 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %395
  store i32 %429, ptr addrspace(3) %431, align 4
  %432 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %396
  store i32 %430, ptr addrspace(3) %432, align 4
  br label %is_smaller_than-after100

is_last_tile-true101:                             ; preds = %is_last_tile-after88
  %433 = udiv i64 %thread.id.x, 4
  %434 = urem i64 %thread.id.x, 4
  %435 = mul i64 %433, 8
  %436 = add i64 %435, %434
  %437 = xor i64 %436, 4
  %438 = icmp slt i64 %436, %437
  %439 = icmp slt i64 %437, 165
  %440 = and i1 %438, %439
  br i1 %440, label %smaller_comparison_index-true104, label %smaller_comparison_index-after105

smaller_comparison_index-after105:                ; preds = %is_smaller_than-after109, %is_last_tile-true101
  br label %is_last_tile-after103

is_last_tile-false102:                            ; preds = %is_last_tile-after88
  %441 = udiv i64 %thread.id.x, 4
  %442 = urem i64 %thread.id.x, 4
  %443 = mul i64 %441, 8
  %444 = add i64 %443, %442
  %445 = xor i64 %444, 4
  %446 = icmp slt i64 %444, %445
  %447 = icmp slt i64 %445, 256
  br i1 true, label %smaller_comparison_index-true110, label %smaller_comparison_index-after111

smaller_comparison_index-after111:                ; preds = %is_smaller_than-after115, %is_last_tile-false102
  br label %is_last_tile-after103

smaller_comparison_index-true104:                 ; preds = %is_last_tile-true101
  %448 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %437
  %449 = addrspacecast ptr addrspace(3) %448 to ptr
  %450 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %436
  %451 = addrspacecast ptr addrspace(3) %450 to ptr
  %452 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %437
  %453 = addrspacecast ptr addrspace(3) %452 to ptr
  %454 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %436
  %455 = addrspacecast ptr addrspace(3) %454 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %449, ptr %451, ptr %453, ptr %455, ptr %compare_return_buffer106)
  %456 = load i8, ptr %compare_return_buffer106, align 1
  %boolean_predicate107 = icmp ne i8 %456, 0
  br i1 %boolean_predicate107, label %is_smaller_than-true108, label %is_smaller_than-after109

is_smaller_than-after109:                         ; preds = %is_smaller_than-true108, %smaller_comparison_index-true104
  br label %smaller_comparison_index-after105

is_smaller_than-true108:                          ; preds = %smaller_comparison_index-true104
  %457 = load float, ptr %449, align 4
  %458 = load float, ptr %451, align 4
  %459 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %436
  store float %457, ptr addrspace(3) %459, align 4
  %460 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %437
  store float %458, ptr addrspace(3) %460, align 4
  %461 = load i32, ptr %453, align 4
  %462 = load i32, ptr %455, align 4
  %463 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %436
  store i32 %461, ptr addrspace(3) %463, align 4
  %464 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %437
  store i32 %462, ptr addrspace(3) %464, align 4
  br label %is_smaller_than-after109

smaller_comparison_index-true110:                 ; preds = %is_last_tile-false102
  %465 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %445
  %466 = addrspacecast ptr addrspace(3) %465 to ptr
  %467 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %444
  %468 = addrspacecast ptr addrspace(3) %467 to ptr
  %469 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %445
  %470 = addrspacecast ptr addrspace(3) %469 to ptr
  %471 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %444
  %472 = addrspacecast ptr addrspace(3) %471 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %466, ptr %468, ptr %470, ptr %472, ptr %compare_return_buffer112)
  %473 = load i8, ptr %compare_return_buffer112, align 1
  %boolean_predicate113 = icmp ne i8 %473, 0
  br i1 %boolean_predicate113, label %is_smaller_than-true114, label %is_smaller_than-after115

is_smaller_than-after115:                         ; preds = %is_smaller_than-true114, %smaller_comparison_index-true110
  br label %smaller_comparison_index-after111

is_smaller_than-true114:                          ; preds = %smaller_comparison_index-true110
  %474 = load float, ptr %466, align 4
  %475 = load float, ptr %468, align 4
  %476 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %444
  store float %474, ptr addrspace(3) %476, align 4
  %477 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %445
  store float %475, ptr addrspace(3) %477, align 4
  %478 = load i32, ptr %470, align 4
  %479 = load i32, ptr %472, align 4
  %480 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %444
  store i32 %478, ptr addrspace(3) %480, align 4
  %481 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %445
  store i32 %479, ptr addrspace(3) %481, align 4
  br label %is_smaller_than-after115

is_last_tile-true116:                             ; preds = %is_last_tile-after103
  %482 = udiv i64 %thread.id.x, 2
  %483 = urem i64 %thread.id.x, 2
  %484 = mul i64 %482, 4
  %485 = add i64 %484, %483
  %486 = xor i64 %485, 2
  %487 = icmp slt i64 %485, %486
  %488 = icmp slt i64 %486, 165
  %489 = and i1 %487, %488
  br i1 %489, label %smaller_comparison_index-true119, label %smaller_comparison_index-after120

smaller_comparison_index-after120:                ; preds = %is_smaller_than-after124, %is_last_tile-true116
  br label %is_last_tile-after118

is_last_tile-false117:                            ; preds = %is_last_tile-after103
  %490 = udiv i64 %thread.id.x, 2
  %491 = urem i64 %thread.id.x, 2
  %492 = mul i64 %490, 4
  %493 = add i64 %492, %491
  %494 = xor i64 %493, 2
  %495 = icmp slt i64 %493, %494
  %496 = icmp slt i64 %494, 256
  br i1 true, label %smaller_comparison_index-true125, label %smaller_comparison_index-after126

smaller_comparison_index-after126:                ; preds = %is_smaller_than-after130, %is_last_tile-false117
  br label %is_last_tile-after118

smaller_comparison_index-true119:                 ; preds = %is_last_tile-true116
  %497 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %486
  %498 = addrspacecast ptr addrspace(3) %497 to ptr
  %499 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %485
  %500 = addrspacecast ptr addrspace(3) %499 to ptr
  %501 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %486
  %502 = addrspacecast ptr addrspace(3) %501 to ptr
  %503 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %485
  %504 = addrspacecast ptr addrspace(3) %503 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %498, ptr %500, ptr %502, ptr %504, ptr %compare_return_buffer121)
  %505 = load i8, ptr %compare_return_buffer121, align 1
  %boolean_predicate122 = icmp ne i8 %505, 0
  br i1 %boolean_predicate122, label %is_smaller_than-true123, label %is_smaller_than-after124

is_smaller_than-after124:                         ; preds = %is_smaller_than-true123, %smaller_comparison_index-true119
  br label %smaller_comparison_index-after120

is_smaller_than-true123:                          ; preds = %smaller_comparison_index-true119
  %506 = load float, ptr %498, align 4
  %507 = load float, ptr %500, align 4
  %508 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %485
  store float %506, ptr addrspace(3) %508, align 4
  %509 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %486
  store float %507, ptr addrspace(3) %509, align 4
  %510 = load i32, ptr %502, align 4
  %511 = load i32, ptr %504, align 4
  %512 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %485
  store i32 %510, ptr addrspace(3) %512, align 4
  %513 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %486
  store i32 %511, ptr addrspace(3) %513, align 4
  br label %is_smaller_than-after124

smaller_comparison_index-true125:                 ; preds = %is_last_tile-false117
  %514 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %494
  %515 = addrspacecast ptr addrspace(3) %514 to ptr
  %516 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %493
  %517 = addrspacecast ptr addrspace(3) %516 to ptr
  %518 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %494
  %519 = addrspacecast ptr addrspace(3) %518 to ptr
  %520 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %493
  %521 = addrspacecast ptr addrspace(3) %520 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %515, ptr %517, ptr %519, ptr %521, ptr %compare_return_buffer127)
  %522 = load i8, ptr %compare_return_buffer127, align 1
  %boolean_predicate128 = icmp ne i8 %522, 0
  br i1 %boolean_predicate128, label %is_smaller_than-true129, label %is_smaller_than-after130

is_smaller_than-after130:                         ; preds = %is_smaller_than-true129, %smaller_comparison_index-true125
  br label %smaller_comparison_index-after126

is_smaller_than-true129:                          ; preds = %smaller_comparison_index-true125
  %523 = load float, ptr %515, align 4
  %524 = load float, ptr %517, align 4
  %525 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %493
  store float %523, ptr addrspace(3) %525, align 4
  %526 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %494
  store float %524, ptr addrspace(3) %526, align 4
  %527 = load i32, ptr %519, align 4
  %528 = load i32, ptr %521, align 4
  %529 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %493
  store i32 %527, ptr addrspace(3) %529, align 4
  %530 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %494
  store i32 %528, ptr addrspace(3) %530, align 4
  br label %is_smaller_than-after130

is_last_tile-true131:                             ; preds = %is_last_tile-after118
  %531 = mul i64 %thread.id.x, 2
  %532 = xor i64 %531, 1
  %533 = icmp slt i64 %531, %532
  %534 = icmp slt i64 %532, 165
  %535 = and i1 %533, %534
  br i1 %535, label %smaller_comparison_index-true134, label %smaller_comparison_index-after135

smaller_comparison_index-after135:                ; preds = %is_smaller_than-after139, %is_last_tile-true131
  br label %is_last_tile-after133

is_last_tile-false132:                            ; preds = %is_last_tile-after118
  %536 = mul i64 %thread.id.x, 2
  %537 = xor i64 %536, 1
  %538 = icmp slt i64 %536, %537
  %539 = icmp slt i64 %537, 256
  br i1 true, label %smaller_comparison_index-true140, label %smaller_comparison_index-after141

smaller_comparison_index-after141:                ; preds = %is_smaller_than-after145, %is_last_tile-false132
  br label %is_last_tile-after133

smaller_comparison_index-true134:                 ; preds = %is_last_tile-true131
  %540 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %532
  %541 = addrspacecast ptr addrspace(3) %540 to ptr
  %542 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %531
  %543 = addrspacecast ptr addrspace(3) %542 to ptr
  %544 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %532
  %545 = addrspacecast ptr addrspace(3) %544 to ptr
  %546 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %531
  %547 = addrspacecast ptr addrspace(3) %546 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %541, ptr %543, ptr %545, ptr %547, ptr %compare_return_buffer136)
  %548 = load i8, ptr %compare_return_buffer136, align 1
  %boolean_predicate137 = icmp ne i8 %548, 0
  br i1 %boolean_predicate137, label %is_smaller_than-true138, label %is_smaller_than-after139

is_smaller_than-after139:                         ; preds = %is_smaller_than-true138, %smaller_comparison_index-true134
  br label %smaller_comparison_index-after135

is_smaller_than-true138:                          ; preds = %smaller_comparison_index-true134
  %549 = load float, ptr %541, align 4
  %550 = load float, ptr %543, align 4
  %551 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %531
  store float %549, ptr addrspace(3) %551, align 4
  %552 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %532
  store float %550, ptr addrspace(3) %552, align 4
  %553 = load i32, ptr %545, align 4
  %554 = load i32, ptr %547, align 4
  %555 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %531
  store i32 %553, ptr addrspace(3) %555, align 4
  %556 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %532
  store i32 %554, ptr addrspace(3) %556, align 4
  br label %is_smaller_than-after139

smaller_comparison_index-true140:                 ; preds = %is_last_tile-false132
  %557 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %537
  %558 = addrspacecast ptr addrspace(3) %557 to ptr
  %559 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %536
  %560 = addrspacecast ptr addrspace(3) %559 to ptr
  %561 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %537
  %562 = addrspacecast ptr addrspace(3) %561 to ptr
  %563 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %536
  %564 = addrspacecast ptr addrspace(3) %563 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %558, ptr %560, ptr %562, ptr %564, ptr %compare_return_buffer142)
  %565 = load i8, ptr %compare_return_buffer142, align 1
  %boolean_predicate143 = icmp ne i8 %565, 0
  br i1 %boolean_predicate143, label %is_smaller_than-true144, label %is_smaller_than-after145

is_smaller_than-after145:                         ; preds = %is_smaller_than-true144, %smaller_comparison_index-true140
  br label %smaller_comparison_index-after141

is_smaller_than-true144:                          ; preds = %smaller_comparison_index-true140
  %566 = load float, ptr %558, align 4
  %567 = load float, ptr %560, align 4
  %568 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %536
  store float %566, ptr addrspace(3) %568, align 4
  %569 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %537
  store float %567, ptr addrspace(3) %569, align 4
  %570 = load i32, ptr %562, align 4
  %571 = load i32, ptr %564, align 4
  %572 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %536
  store i32 %570, ptr addrspace(3) %572, align 4
  %573 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %537
  store i32 %571, ptr addrspace(3) %573, align 4
  br label %is_smaller_than-after145

is_last_tile-true146:                             ; preds = %is_last_tile-after133
  %574 = udiv i64 %thread.id.x, 16
  %575 = urem i64 %thread.id.x, 16
  %576 = mul i64 %574, 32
  %577 = add i64 %576, %575
  %578 = xor i64 %577, 31
  %579 = icmp slt i64 %577, %578
  %580 = icmp slt i64 %578, 165
  %581 = and i1 %579, %580
  br i1 %581, label %smaller_comparison_index-true149, label %smaller_comparison_index-after150

smaller_comparison_index-after150:                ; preds = %is_smaller_than-after154, %is_last_tile-true146
  br label %is_last_tile-after148

is_last_tile-false147:                            ; preds = %is_last_tile-after133
  %582 = udiv i64 %thread.id.x, 16
  %583 = urem i64 %thread.id.x, 16
  %584 = mul i64 %582, 32
  %585 = add i64 %584, %583
  %586 = xor i64 %585, 31
  %587 = icmp slt i64 %585, %586
  %588 = icmp slt i64 %586, 256
  br i1 true, label %smaller_comparison_index-true155, label %smaller_comparison_index-after156

smaller_comparison_index-after156:                ; preds = %is_smaller_than-after160, %is_last_tile-false147
  br label %is_last_tile-after148

smaller_comparison_index-true149:                 ; preds = %is_last_tile-true146
  %589 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %578
  %590 = addrspacecast ptr addrspace(3) %589 to ptr
  %591 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %577
  %592 = addrspacecast ptr addrspace(3) %591 to ptr
  %593 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %578
  %594 = addrspacecast ptr addrspace(3) %593 to ptr
  %595 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %577
  %596 = addrspacecast ptr addrspace(3) %595 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %590, ptr %592, ptr %594, ptr %596, ptr %compare_return_buffer151)
  %597 = load i8, ptr %compare_return_buffer151, align 1
  %boolean_predicate152 = icmp ne i8 %597, 0
  br i1 %boolean_predicate152, label %is_smaller_than-true153, label %is_smaller_than-after154

is_smaller_than-after154:                         ; preds = %is_smaller_than-true153, %smaller_comparison_index-true149
  br label %smaller_comparison_index-after150

is_smaller_than-true153:                          ; preds = %smaller_comparison_index-true149
  %598 = load float, ptr %590, align 4
  %599 = load float, ptr %592, align 4
  %600 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %577
  store float %598, ptr addrspace(3) %600, align 4
  %601 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %578
  store float %599, ptr addrspace(3) %601, align 4
  %602 = load i32, ptr %594, align 4
  %603 = load i32, ptr %596, align 4
  %604 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %577
  store i32 %602, ptr addrspace(3) %604, align 4
  %605 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %578
  store i32 %603, ptr addrspace(3) %605, align 4
  br label %is_smaller_than-after154

smaller_comparison_index-true155:                 ; preds = %is_last_tile-false147
  %606 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %586
  %607 = addrspacecast ptr addrspace(3) %606 to ptr
  %608 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %585
  %609 = addrspacecast ptr addrspace(3) %608 to ptr
  %610 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %586
  %611 = addrspacecast ptr addrspace(3) %610 to ptr
  %612 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %585
  %613 = addrspacecast ptr addrspace(3) %612 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %607, ptr %609, ptr %611, ptr %613, ptr %compare_return_buffer157)
  %614 = load i8, ptr %compare_return_buffer157, align 1
  %boolean_predicate158 = icmp ne i8 %614, 0
  br i1 %boolean_predicate158, label %is_smaller_than-true159, label %is_smaller_than-after160

is_smaller_than-after160:                         ; preds = %is_smaller_than-true159, %smaller_comparison_index-true155
  br label %smaller_comparison_index-after156

is_smaller_than-true159:                          ; preds = %smaller_comparison_index-true155
  %615 = load float, ptr %607, align 4
  %616 = load float, ptr %609, align 4
  %617 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %585
  store float %615, ptr addrspace(3) %617, align 4
  %618 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %586
  store float %616, ptr addrspace(3) %618, align 4
  %619 = load i32, ptr %611, align 4
  %620 = load i32, ptr %613, align 4
  %621 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %585
  store i32 %619, ptr addrspace(3) %621, align 4
  %622 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %586
  store i32 %620, ptr addrspace(3) %622, align 4
  br label %is_smaller_than-after160

is_last_tile-true161:                             ; preds = %is_last_tile-after148
  %623 = udiv i64 %thread.id.x, 8
  %624 = urem i64 %thread.id.x, 8
  %625 = mul i64 %623, 16
  %626 = add i64 %625, %624
  %627 = xor i64 %626, 8
  %628 = icmp slt i64 %626, %627
  %629 = icmp slt i64 %627, 165
  %630 = and i1 %628, %629
  br i1 %630, label %smaller_comparison_index-true164, label %smaller_comparison_index-after165

smaller_comparison_index-after165:                ; preds = %is_smaller_than-after169, %is_last_tile-true161
  br label %is_last_tile-after163

is_last_tile-false162:                            ; preds = %is_last_tile-after148
  %631 = udiv i64 %thread.id.x, 8
  %632 = urem i64 %thread.id.x, 8
  %633 = mul i64 %631, 16
  %634 = add i64 %633, %632
  %635 = xor i64 %634, 8
  %636 = icmp slt i64 %634, %635
  %637 = icmp slt i64 %635, 256
  br i1 true, label %smaller_comparison_index-true170, label %smaller_comparison_index-after171

smaller_comparison_index-after171:                ; preds = %is_smaller_than-after175, %is_last_tile-false162
  br label %is_last_tile-after163

smaller_comparison_index-true164:                 ; preds = %is_last_tile-true161
  %638 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %627
  %639 = addrspacecast ptr addrspace(3) %638 to ptr
  %640 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %626
  %641 = addrspacecast ptr addrspace(3) %640 to ptr
  %642 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %627
  %643 = addrspacecast ptr addrspace(3) %642 to ptr
  %644 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %626
  %645 = addrspacecast ptr addrspace(3) %644 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %639, ptr %641, ptr %643, ptr %645, ptr %compare_return_buffer166)
  %646 = load i8, ptr %compare_return_buffer166, align 1
  %boolean_predicate167 = icmp ne i8 %646, 0
  br i1 %boolean_predicate167, label %is_smaller_than-true168, label %is_smaller_than-after169

is_smaller_than-after169:                         ; preds = %is_smaller_than-true168, %smaller_comparison_index-true164
  br label %smaller_comparison_index-after165

is_smaller_than-true168:                          ; preds = %smaller_comparison_index-true164
  %647 = load float, ptr %639, align 4
  %648 = load float, ptr %641, align 4
  %649 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %626
  store float %647, ptr addrspace(3) %649, align 4
  %650 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %627
  store float %648, ptr addrspace(3) %650, align 4
  %651 = load i32, ptr %643, align 4
  %652 = load i32, ptr %645, align 4
  %653 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %626
  store i32 %651, ptr addrspace(3) %653, align 4
  %654 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %627
  store i32 %652, ptr addrspace(3) %654, align 4
  br label %is_smaller_than-after169

smaller_comparison_index-true170:                 ; preds = %is_last_tile-false162
  %655 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %635
  %656 = addrspacecast ptr addrspace(3) %655 to ptr
  %657 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %634
  %658 = addrspacecast ptr addrspace(3) %657 to ptr
  %659 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %635
  %660 = addrspacecast ptr addrspace(3) %659 to ptr
  %661 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %634
  %662 = addrspacecast ptr addrspace(3) %661 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %656, ptr %658, ptr %660, ptr %662, ptr %compare_return_buffer172)
  %663 = load i8, ptr %compare_return_buffer172, align 1
  %boolean_predicate173 = icmp ne i8 %663, 0
  br i1 %boolean_predicate173, label %is_smaller_than-true174, label %is_smaller_than-after175

is_smaller_than-after175:                         ; preds = %is_smaller_than-true174, %smaller_comparison_index-true170
  br label %smaller_comparison_index-after171

is_smaller_than-true174:                          ; preds = %smaller_comparison_index-true170
  %664 = load float, ptr %656, align 4
  %665 = load float, ptr %658, align 4
  %666 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %634
  store float %664, ptr addrspace(3) %666, align 4
  %667 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %635
  store float %665, ptr addrspace(3) %667, align 4
  %668 = load i32, ptr %660, align 4
  %669 = load i32, ptr %662, align 4
  %670 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %634
  store i32 %668, ptr addrspace(3) %670, align 4
  %671 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %635
  store i32 %669, ptr addrspace(3) %671, align 4
  br label %is_smaller_than-after175

is_last_tile-true176:                             ; preds = %is_last_tile-after163
  %672 = udiv i64 %thread.id.x, 4
  %673 = urem i64 %thread.id.x, 4
  %674 = mul i64 %672, 8
  %675 = add i64 %674, %673
  %676 = xor i64 %675, 4
  %677 = icmp slt i64 %675, %676
  %678 = icmp slt i64 %676, 165
  %679 = and i1 %677, %678
  br i1 %679, label %smaller_comparison_index-true179, label %smaller_comparison_index-after180

smaller_comparison_index-after180:                ; preds = %is_smaller_than-after184, %is_last_tile-true176
  br label %is_last_tile-after178

is_last_tile-false177:                            ; preds = %is_last_tile-after163
  %680 = udiv i64 %thread.id.x, 4
  %681 = urem i64 %thread.id.x, 4
  %682 = mul i64 %680, 8
  %683 = add i64 %682, %681
  %684 = xor i64 %683, 4
  %685 = icmp slt i64 %683, %684
  %686 = icmp slt i64 %684, 256
  br i1 true, label %smaller_comparison_index-true185, label %smaller_comparison_index-after186

smaller_comparison_index-after186:                ; preds = %is_smaller_than-after190, %is_last_tile-false177
  br label %is_last_tile-after178

smaller_comparison_index-true179:                 ; preds = %is_last_tile-true176
  %687 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %676
  %688 = addrspacecast ptr addrspace(3) %687 to ptr
  %689 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %675
  %690 = addrspacecast ptr addrspace(3) %689 to ptr
  %691 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %676
  %692 = addrspacecast ptr addrspace(3) %691 to ptr
  %693 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %675
  %694 = addrspacecast ptr addrspace(3) %693 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %688, ptr %690, ptr %692, ptr %694, ptr %compare_return_buffer181)
  %695 = load i8, ptr %compare_return_buffer181, align 1
  %boolean_predicate182 = icmp ne i8 %695, 0
  br i1 %boolean_predicate182, label %is_smaller_than-true183, label %is_smaller_than-after184

is_smaller_than-after184:                         ; preds = %is_smaller_than-true183, %smaller_comparison_index-true179
  br label %smaller_comparison_index-after180

is_smaller_than-true183:                          ; preds = %smaller_comparison_index-true179
  %696 = load float, ptr %688, align 4
  %697 = load float, ptr %690, align 4
  %698 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %675
  store float %696, ptr addrspace(3) %698, align 4
  %699 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %676
  store float %697, ptr addrspace(3) %699, align 4
  %700 = load i32, ptr %692, align 4
  %701 = load i32, ptr %694, align 4
  %702 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %675
  store i32 %700, ptr addrspace(3) %702, align 4
  %703 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %676
  store i32 %701, ptr addrspace(3) %703, align 4
  br label %is_smaller_than-after184

smaller_comparison_index-true185:                 ; preds = %is_last_tile-false177
  %704 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %684
  %705 = addrspacecast ptr addrspace(3) %704 to ptr
  %706 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %683
  %707 = addrspacecast ptr addrspace(3) %706 to ptr
  %708 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %684
  %709 = addrspacecast ptr addrspace(3) %708 to ptr
  %710 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %683
  %711 = addrspacecast ptr addrspace(3) %710 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %705, ptr %707, ptr %709, ptr %711, ptr %compare_return_buffer187)
  %712 = load i8, ptr %compare_return_buffer187, align 1
  %boolean_predicate188 = icmp ne i8 %712, 0
  br i1 %boolean_predicate188, label %is_smaller_than-true189, label %is_smaller_than-after190

is_smaller_than-after190:                         ; preds = %is_smaller_than-true189, %smaller_comparison_index-true185
  br label %smaller_comparison_index-after186

is_smaller_than-true189:                          ; preds = %smaller_comparison_index-true185
  %713 = load float, ptr %705, align 4
  %714 = load float, ptr %707, align 4
  %715 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %683
  store float %713, ptr addrspace(3) %715, align 4
  %716 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %684
  store float %714, ptr addrspace(3) %716, align 4
  %717 = load i32, ptr %709, align 4
  %718 = load i32, ptr %711, align 4
  %719 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %683
  store i32 %717, ptr addrspace(3) %719, align 4
  %720 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %684
  store i32 %718, ptr addrspace(3) %720, align 4
  br label %is_smaller_than-after190

is_last_tile-true191:                             ; preds = %is_last_tile-after178
  %721 = udiv i64 %thread.id.x, 2
  %722 = urem i64 %thread.id.x, 2
  %723 = mul i64 %721, 4
  %724 = add i64 %723, %722
  %725 = xor i64 %724, 2
  %726 = icmp slt i64 %724, %725
  %727 = icmp slt i64 %725, 165
  %728 = and i1 %726, %727
  br i1 %728, label %smaller_comparison_index-true194, label %smaller_comparison_index-after195

smaller_comparison_index-after195:                ; preds = %is_smaller_than-after199, %is_last_tile-true191
  br label %is_last_tile-after193

is_last_tile-false192:                            ; preds = %is_last_tile-after178
  %729 = udiv i64 %thread.id.x, 2
  %730 = urem i64 %thread.id.x, 2
  %731 = mul i64 %729, 4
  %732 = add i64 %731, %730
  %733 = xor i64 %732, 2
  %734 = icmp slt i64 %732, %733
  %735 = icmp slt i64 %733, 256
  br i1 true, label %smaller_comparison_index-true200, label %smaller_comparison_index-after201

smaller_comparison_index-after201:                ; preds = %is_smaller_than-after205, %is_last_tile-false192
  br label %is_last_tile-after193

smaller_comparison_index-true194:                 ; preds = %is_last_tile-true191
  %736 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %725
  %737 = addrspacecast ptr addrspace(3) %736 to ptr
  %738 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %724
  %739 = addrspacecast ptr addrspace(3) %738 to ptr
  %740 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %725
  %741 = addrspacecast ptr addrspace(3) %740 to ptr
  %742 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %724
  %743 = addrspacecast ptr addrspace(3) %742 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %737, ptr %739, ptr %741, ptr %743, ptr %compare_return_buffer196)
  %744 = load i8, ptr %compare_return_buffer196, align 1
  %boolean_predicate197 = icmp ne i8 %744, 0
  br i1 %boolean_predicate197, label %is_smaller_than-true198, label %is_smaller_than-after199

is_smaller_than-after199:                         ; preds = %is_smaller_than-true198, %smaller_comparison_index-true194
  br label %smaller_comparison_index-after195

is_smaller_than-true198:                          ; preds = %smaller_comparison_index-true194
  %745 = load float, ptr %737, align 4
  %746 = load float, ptr %739, align 4
  %747 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %724
  store float %745, ptr addrspace(3) %747, align 4
  %748 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %725
  store float %746, ptr addrspace(3) %748, align 4
  %749 = load i32, ptr %741, align 4
  %750 = load i32, ptr %743, align 4
  %751 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %724
  store i32 %749, ptr addrspace(3) %751, align 4
  %752 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %725
  store i32 %750, ptr addrspace(3) %752, align 4
  br label %is_smaller_than-after199

smaller_comparison_index-true200:                 ; preds = %is_last_tile-false192
  %753 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %733
  %754 = addrspacecast ptr addrspace(3) %753 to ptr
  %755 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %732
  %756 = addrspacecast ptr addrspace(3) %755 to ptr
  %757 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %733
  %758 = addrspacecast ptr addrspace(3) %757 to ptr
  %759 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %732
  %760 = addrspacecast ptr addrspace(3) %759 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %754, ptr %756, ptr %758, ptr %760, ptr %compare_return_buffer202)
  %761 = load i8, ptr %compare_return_buffer202, align 1
  %boolean_predicate203 = icmp ne i8 %761, 0
  br i1 %boolean_predicate203, label %is_smaller_than-true204, label %is_smaller_than-after205

is_smaller_than-after205:                         ; preds = %is_smaller_than-true204, %smaller_comparison_index-true200
  br label %smaller_comparison_index-after201

is_smaller_than-true204:                          ; preds = %smaller_comparison_index-true200
  %762 = load float, ptr %754, align 4
  %763 = load float, ptr %756, align 4
  %764 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %732
  store float %762, ptr addrspace(3) %764, align 4
  %765 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %733
  store float %763, ptr addrspace(3) %765, align 4
  %766 = load i32, ptr %758, align 4
  %767 = load i32, ptr %760, align 4
  %768 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %732
  store i32 %766, ptr addrspace(3) %768, align 4
  %769 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %733
  store i32 %767, ptr addrspace(3) %769, align 4
  br label %is_smaller_than-after205

is_last_tile-true206:                             ; preds = %is_last_tile-after193
  %770 = mul i64 %thread.id.x, 2
  %771 = xor i64 %770, 1
  %772 = icmp slt i64 %770, %771
  %773 = icmp slt i64 %771, 165
  %774 = and i1 %772, %773
  br i1 %774, label %smaller_comparison_index-true209, label %smaller_comparison_index-after210

smaller_comparison_index-after210:                ; preds = %is_smaller_than-after214, %is_last_tile-true206
  br label %is_last_tile-after208

is_last_tile-false207:                            ; preds = %is_last_tile-after193
  %775 = mul i64 %thread.id.x, 2
  %776 = xor i64 %775, 1
  %777 = icmp slt i64 %775, %776
  %778 = icmp slt i64 %776, 256
  br i1 true, label %smaller_comparison_index-true215, label %smaller_comparison_index-after216

smaller_comparison_index-after216:                ; preds = %is_smaller_than-after220, %is_last_tile-false207
  br label %is_last_tile-after208

smaller_comparison_index-true209:                 ; preds = %is_last_tile-true206
  %779 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %771
  %780 = addrspacecast ptr addrspace(3) %779 to ptr
  %781 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %770
  %782 = addrspacecast ptr addrspace(3) %781 to ptr
  %783 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %771
  %784 = addrspacecast ptr addrspace(3) %783 to ptr
  %785 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %770
  %786 = addrspacecast ptr addrspace(3) %785 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %780, ptr %782, ptr %784, ptr %786, ptr %compare_return_buffer211)
  %787 = load i8, ptr %compare_return_buffer211, align 1
  %boolean_predicate212 = icmp ne i8 %787, 0
  br i1 %boolean_predicate212, label %is_smaller_than-true213, label %is_smaller_than-after214

is_smaller_than-after214:                         ; preds = %is_smaller_than-true213, %smaller_comparison_index-true209
  br label %smaller_comparison_index-after210

is_smaller_than-true213:                          ; preds = %smaller_comparison_index-true209
  %788 = load float, ptr %780, align 4
  %789 = load float, ptr %782, align 4
  %790 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %770
  store float %788, ptr addrspace(3) %790, align 4
  %791 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %771
  store float %789, ptr addrspace(3) %791, align 4
  %792 = load i32, ptr %784, align 4
  %793 = load i32, ptr %786, align 4
  %794 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %770
  store i32 %792, ptr addrspace(3) %794, align 4
  %795 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %771
  store i32 %793, ptr addrspace(3) %795, align 4
  br label %is_smaller_than-after214

smaller_comparison_index-true215:                 ; preds = %is_last_tile-false207
  %796 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %776
  %797 = addrspacecast ptr addrspace(3) %796 to ptr
  %798 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %775
  %799 = addrspacecast ptr addrspace(3) %798 to ptr
  %800 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %776
  %801 = addrspacecast ptr addrspace(3) %800 to ptr
  %802 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %775
  %803 = addrspacecast ptr addrspace(3) %802 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %797, ptr %799, ptr %801, ptr %803, ptr %compare_return_buffer217)
  %804 = load i8, ptr %compare_return_buffer217, align 1
  %boolean_predicate218 = icmp ne i8 %804, 0
  br i1 %boolean_predicate218, label %is_smaller_than-true219, label %is_smaller_than-after220

is_smaller_than-after220:                         ; preds = %is_smaller_than-true219, %smaller_comparison_index-true215
  br label %smaller_comparison_index-after216

is_smaller_than-true219:                          ; preds = %smaller_comparison_index-true215
  %805 = load float, ptr %797, align 4
  %806 = load float, ptr %799, align 4
  %807 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %775
  store float %805, ptr addrspace(3) %807, align 4
  %808 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %776
  store float %806, ptr addrspace(3) %808, align 4
  %809 = load i32, ptr %801, align 4
  %810 = load i32, ptr %803, align 4
  %811 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %775
  store i32 %809, ptr addrspace(3) %811, align 4
  %812 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %776
  store i32 %810, ptr addrspace(3) %812, align 4
  br label %is_smaller_than-after220

is_last_tile-true221:                             ; preds = %is_last_tile-after208
  %813 = udiv i64 %thread.id.x, 32
  %814 = urem i64 %thread.id.x, 32
  %815 = mul i64 %813, 64
  %816 = add i64 %815, %814
  %817 = xor i64 %816, 63
  %818 = icmp slt i64 %816, %817
  %819 = icmp slt i64 %817, 165
  %820 = and i1 %818, %819
  br i1 %820, label %smaller_comparison_index-true224, label %smaller_comparison_index-after225

smaller_comparison_index-after225:                ; preds = %is_smaller_than-after229, %is_last_tile-true221
  br label %is_last_tile-after223

is_last_tile-false222:                            ; preds = %is_last_tile-after208
  %821 = udiv i64 %thread.id.x, 32
  %822 = urem i64 %thread.id.x, 32
  %823 = mul i64 %821, 64
  %824 = add i64 %823, %822
  %825 = xor i64 %824, 63
  %826 = icmp slt i64 %824, %825
  %827 = icmp slt i64 %825, 256
  br i1 true, label %smaller_comparison_index-true230, label %smaller_comparison_index-after231

smaller_comparison_index-after231:                ; preds = %is_smaller_than-after235, %is_last_tile-false222
  br label %is_last_tile-after223

smaller_comparison_index-true224:                 ; preds = %is_last_tile-true221
  %828 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %817
  %829 = addrspacecast ptr addrspace(3) %828 to ptr
  %830 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %816
  %831 = addrspacecast ptr addrspace(3) %830 to ptr
  %832 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %817
  %833 = addrspacecast ptr addrspace(3) %832 to ptr
  %834 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %816
  %835 = addrspacecast ptr addrspace(3) %834 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %829, ptr %831, ptr %833, ptr %835, ptr %compare_return_buffer226)
  %836 = load i8, ptr %compare_return_buffer226, align 1
  %boolean_predicate227 = icmp ne i8 %836, 0
  br i1 %boolean_predicate227, label %is_smaller_than-true228, label %is_smaller_than-after229

is_smaller_than-after229:                         ; preds = %is_smaller_than-true228, %smaller_comparison_index-true224
  br label %smaller_comparison_index-after225

is_smaller_than-true228:                          ; preds = %smaller_comparison_index-true224
  %837 = load float, ptr %829, align 4
  %838 = load float, ptr %831, align 4
  %839 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %816
  store float %837, ptr addrspace(3) %839, align 4
  %840 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %817
  store float %838, ptr addrspace(3) %840, align 4
  %841 = load i32, ptr %833, align 4
  %842 = load i32, ptr %835, align 4
  %843 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %816
  store i32 %841, ptr addrspace(3) %843, align 4
  %844 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %817
  store i32 %842, ptr addrspace(3) %844, align 4
  br label %is_smaller_than-after229

smaller_comparison_index-true230:                 ; preds = %is_last_tile-false222
  %845 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %825
  %846 = addrspacecast ptr addrspace(3) %845 to ptr
  %847 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %824
  %848 = addrspacecast ptr addrspace(3) %847 to ptr
  %849 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %825
  %850 = addrspacecast ptr addrspace(3) %849 to ptr
  %851 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %824
  %852 = addrspacecast ptr addrspace(3) %851 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %846, ptr %848, ptr %850, ptr %852, ptr %compare_return_buffer232)
  %853 = load i8, ptr %compare_return_buffer232, align 1
  %boolean_predicate233 = icmp ne i8 %853, 0
  br i1 %boolean_predicate233, label %is_smaller_than-true234, label %is_smaller_than-after235

is_smaller_than-after235:                         ; preds = %is_smaller_than-true234, %smaller_comparison_index-true230
  br label %smaller_comparison_index-after231

is_smaller_than-true234:                          ; preds = %smaller_comparison_index-true230
  %854 = load float, ptr %846, align 4
  %855 = load float, ptr %848, align 4
  %856 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %824
  store float %854, ptr addrspace(3) %856, align 4
  %857 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %825
  store float %855, ptr addrspace(3) %857, align 4
  %858 = load i32, ptr %850, align 4
  %859 = load i32, ptr %852, align 4
  %860 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %824
  store i32 %858, ptr addrspace(3) %860, align 4
  %861 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %825
  store i32 %859, ptr addrspace(3) %861, align 4
  br label %is_smaller_than-after235

is_last_tile-true236:                             ; preds = %is_last_tile-after223
  %862 = udiv i64 %thread.id.x, 16
  %863 = urem i64 %thread.id.x, 16
  %864 = mul i64 %862, 32
  %865 = add i64 %864, %863
  %866 = xor i64 %865, 16
  %867 = icmp slt i64 %865, %866
  %868 = icmp slt i64 %866, 165
  %869 = and i1 %867, %868
  br i1 %869, label %smaller_comparison_index-true239, label %smaller_comparison_index-after240

smaller_comparison_index-after240:                ; preds = %is_smaller_than-after244, %is_last_tile-true236
  br label %is_last_tile-after238

is_last_tile-false237:                            ; preds = %is_last_tile-after223
  %870 = udiv i64 %thread.id.x, 16
  %871 = urem i64 %thread.id.x, 16
  %872 = mul i64 %870, 32
  %873 = add i64 %872, %871
  %874 = xor i64 %873, 16
  %875 = icmp slt i64 %873, %874
  %876 = icmp slt i64 %874, 256
  br i1 true, label %smaller_comparison_index-true245, label %smaller_comparison_index-after246

smaller_comparison_index-after246:                ; preds = %is_smaller_than-after250, %is_last_tile-false237
  br label %is_last_tile-after238

smaller_comparison_index-true239:                 ; preds = %is_last_tile-true236
  %877 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %866
  %878 = addrspacecast ptr addrspace(3) %877 to ptr
  %879 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %865
  %880 = addrspacecast ptr addrspace(3) %879 to ptr
  %881 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %866
  %882 = addrspacecast ptr addrspace(3) %881 to ptr
  %883 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %865
  %884 = addrspacecast ptr addrspace(3) %883 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %878, ptr %880, ptr %882, ptr %884, ptr %compare_return_buffer241)
  %885 = load i8, ptr %compare_return_buffer241, align 1
  %boolean_predicate242 = icmp ne i8 %885, 0
  br i1 %boolean_predicate242, label %is_smaller_than-true243, label %is_smaller_than-after244

is_smaller_than-after244:                         ; preds = %is_smaller_than-true243, %smaller_comparison_index-true239
  br label %smaller_comparison_index-after240

is_smaller_than-true243:                          ; preds = %smaller_comparison_index-true239
  %886 = load float, ptr %878, align 4
  %887 = load float, ptr %880, align 4
  %888 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %865
  store float %886, ptr addrspace(3) %888, align 4
  %889 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %866
  store float %887, ptr addrspace(3) %889, align 4
  %890 = load i32, ptr %882, align 4
  %891 = load i32, ptr %884, align 4
  %892 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %865
  store i32 %890, ptr addrspace(3) %892, align 4
  %893 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %866
  store i32 %891, ptr addrspace(3) %893, align 4
  br label %is_smaller_than-after244

smaller_comparison_index-true245:                 ; preds = %is_last_tile-false237
  %894 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %874
  %895 = addrspacecast ptr addrspace(3) %894 to ptr
  %896 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %873
  %897 = addrspacecast ptr addrspace(3) %896 to ptr
  %898 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %874
  %899 = addrspacecast ptr addrspace(3) %898 to ptr
  %900 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %873
  %901 = addrspacecast ptr addrspace(3) %900 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %895, ptr %897, ptr %899, ptr %901, ptr %compare_return_buffer247)
  %902 = load i8, ptr %compare_return_buffer247, align 1
  %boolean_predicate248 = icmp ne i8 %902, 0
  br i1 %boolean_predicate248, label %is_smaller_than-true249, label %is_smaller_than-after250

is_smaller_than-after250:                         ; preds = %is_smaller_than-true249, %smaller_comparison_index-true245
  br label %smaller_comparison_index-after246

is_smaller_than-true249:                          ; preds = %smaller_comparison_index-true245
  %903 = load float, ptr %895, align 4
  %904 = load float, ptr %897, align 4
  %905 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %873
  store float %903, ptr addrspace(3) %905, align 4
  %906 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %874
  store float %904, ptr addrspace(3) %906, align 4
  %907 = load i32, ptr %899, align 4
  %908 = load i32, ptr %901, align 4
  %909 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %873
  store i32 %907, ptr addrspace(3) %909, align 4
  %910 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %874
  store i32 %908, ptr addrspace(3) %910, align 4
  br label %is_smaller_than-after250

is_last_tile-true251:                             ; preds = %is_last_tile-after238
  %911 = udiv i64 %thread.id.x, 8
  %912 = urem i64 %thread.id.x, 8
  %913 = mul i64 %911, 16
  %914 = add i64 %913, %912
  %915 = xor i64 %914, 8
  %916 = icmp slt i64 %914, %915
  %917 = icmp slt i64 %915, 165
  %918 = and i1 %916, %917
  br i1 %918, label %smaller_comparison_index-true254, label %smaller_comparison_index-after255

smaller_comparison_index-after255:                ; preds = %is_smaller_than-after259, %is_last_tile-true251
  br label %is_last_tile-after253

is_last_tile-false252:                            ; preds = %is_last_tile-after238
  %919 = udiv i64 %thread.id.x, 8
  %920 = urem i64 %thread.id.x, 8
  %921 = mul i64 %919, 16
  %922 = add i64 %921, %920
  %923 = xor i64 %922, 8
  %924 = icmp slt i64 %922, %923
  %925 = icmp slt i64 %923, 256
  br i1 true, label %smaller_comparison_index-true260, label %smaller_comparison_index-after261

smaller_comparison_index-after261:                ; preds = %is_smaller_than-after265, %is_last_tile-false252
  br label %is_last_tile-after253

smaller_comparison_index-true254:                 ; preds = %is_last_tile-true251
  %926 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %915
  %927 = addrspacecast ptr addrspace(3) %926 to ptr
  %928 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %914
  %929 = addrspacecast ptr addrspace(3) %928 to ptr
  %930 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %915
  %931 = addrspacecast ptr addrspace(3) %930 to ptr
  %932 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %914
  %933 = addrspacecast ptr addrspace(3) %932 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %927, ptr %929, ptr %931, ptr %933, ptr %compare_return_buffer256)
  %934 = load i8, ptr %compare_return_buffer256, align 1
  %boolean_predicate257 = icmp ne i8 %934, 0
  br i1 %boolean_predicate257, label %is_smaller_than-true258, label %is_smaller_than-after259

is_smaller_than-after259:                         ; preds = %is_smaller_than-true258, %smaller_comparison_index-true254
  br label %smaller_comparison_index-after255

is_smaller_than-true258:                          ; preds = %smaller_comparison_index-true254
  %935 = load float, ptr %927, align 4
  %936 = load float, ptr %929, align 4
  %937 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %914
  store float %935, ptr addrspace(3) %937, align 4
  %938 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %915
  store float %936, ptr addrspace(3) %938, align 4
  %939 = load i32, ptr %931, align 4
  %940 = load i32, ptr %933, align 4
  %941 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %914
  store i32 %939, ptr addrspace(3) %941, align 4
  %942 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %915
  store i32 %940, ptr addrspace(3) %942, align 4
  br label %is_smaller_than-after259

smaller_comparison_index-true260:                 ; preds = %is_last_tile-false252
  %943 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %923
  %944 = addrspacecast ptr addrspace(3) %943 to ptr
  %945 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %922
  %946 = addrspacecast ptr addrspace(3) %945 to ptr
  %947 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %923
  %948 = addrspacecast ptr addrspace(3) %947 to ptr
  %949 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %922
  %950 = addrspacecast ptr addrspace(3) %949 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %944, ptr %946, ptr %948, ptr %950, ptr %compare_return_buffer262)
  %951 = load i8, ptr %compare_return_buffer262, align 1
  %boolean_predicate263 = icmp ne i8 %951, 0
  br i1 %boolean_predicate263, label %is_smaller_than-true264, label %is_smaller_than-after265

is_smaller_than-after265:                         ; preds = %is_smaller_than-true264, %smaller_comparison_index-true260
  br label %smaller_comparison_index-after261

is_smaller_than-true264:                          ; preds = %smaller_comparison_index-true260
  %952 = load float, ptr %944, align 4
  %953 = load float, ptr %946, align 4
  %954 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %922
  store float %952, ptr addrspace(3) %954, align 4
  %955 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %923
  store float %953, ptr addrspace(3) %955, align 4
  %956 = load i32, ptr %948, align 4
  %957 = load i32, ptr %950, align 4
  %958 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %922
  store i32 %956, ptr addrspace(3) %958, align 4
  %959 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %923
  store i32 %957, ptr addrspace(3) %959, align 4
  br label %is_smaller_than-after265

is_last_tile-true266:                             ; preds = %is_last_tile-after253
  %960 = udiv i64 %thread.id.x, 4
  %961 = urem i64 %thread.id.x, 4
  %962 = mul i64 %960, 8
  %963 = add i64 %962, %961
  %964 = xor i64 %963, 4
  %965 = icmp slt i64 %963, %964
  %966 = icmp slt i64 %964, 165
  %967 = and i1 %965, %966
  br i1 %967, label %smaller_comparison_index-true269, label %smaller_comparison_index-after270

smaller_comparison_index-after270:                ; preds = %is_smaller_than-after274, %is_last_tile-true266
  br label %is_last_tile-after268

is_last_tile-false267:                            ; preds = %is_last_tile-after253
  %968 = udiv i64 %thread.id.x, 4
  %969 = urem i64 %thread.id.x, 4
  %970 = mul i64 %968, 8
  %971 = add i64 %970, %969
  %972 = xor i64 %971, 4
  %973 = icmp slt i64 %971, %972
  %974 = icmp slt i64 %972, 256
  br i1 true, label %smaller_comparison_index-true275, label %smaller_comparison_index-after276

smaller_comparison_index-after276:                ; preds = %is_smaller_than-after280, %is_last_tile-false267
  br label %is_last_tile-after268

smaller_comparison_index-true269:                 ; preds = %is_last_tile-true266
  %975 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %964
  %976 = addrspacecast ptr addrspace(3) %975 to ptr
  %977 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %963
  %978 = addrspacecast ptr addrspace(3) %977 to ptr
  %979 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %964
  %980 = addrspacecast ptr addrspace(3) %979 to ptr
  %981 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %963
  %982 = addrspacecast ptr addrspace(3) %981 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %976, ptr %978, ptr %980, ptr %982, ptr %compare_return_buffer271)
  %983 = load i8, ptr %compare_return_buffer271, align 1
  %boolean_predicate272 = icmp ne i8 %983, 0
  br i1 %boolean_predicate272, label %is_smaller_than-true273, label %is_smaller_than-after274

is_smaller_than-after274:                         ; preds = %is_smaller_than-true273, %smaller_comparison_index-true269
  br label %smaller_comparison_index-after270

is_smaller_than-true273:                          ; preds = %smaller_comparison_index-true269
  %984 = load float, ptr %976, align 4
  %985 = load float, ptr %978, align 4
  %986 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %963
  store float %984, ptr addrspace(3) %986, align 4
  %987 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %964
  store float %985, ptr addrspace(3) %987, align 4
  %988 = load i32, ptr %980, align 4
  %989 = load i32, ptr %982, align 4
  %990 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %963
  store i32 %988, ptr addrspace(3) %990, align 4
  %991 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %964
  store i32 %989, ptr addrspace(3) %991, align 4
  br label %is_smaller_than-after274

smaller_comparison_index-true275:                 ; preds = %is_last_tile-false267
  %992 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %972
  %993 = addrspacecast ptr addrspace(3) %992 to ptr
  %994 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %971
  %995 = addrspacecast ptr addrspace(3) %994 to ptr
  %996 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %972
  %997 = addrspacecast ptr addrspace(3) %996 to ptr
  %998 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %971
  %999 = addrspacecast ptr addrspace(3) %998 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %993, ptr %995, ptr %997, ptr %999, ptr %compare_return_buffer277)
  %1000 = load i8, ptr %compare_return_buffer277, align 1
  %boolean_predicate278 = icmp ne i8 %1000, 0
  br i1 %boolean_predicate278, label %is_smaller_than-true279, label %is_smaller_than-after280

is_smaller_than-after280:                         ; preds = %is_smaller_than-true279, %smaller_comparison_index-true275
  br label %smaller_comparison_index-after276

is_smaller_than-true279:                          ; preds = %smaller_comparison_index-true275
  %1001 = load float, ptr %993, align 4
  %1002 = load float, ptr %995, align 4
  %1003 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %971
  store float %1001, ptr addrspace(3) %1003, align 4
  %1004 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %972
  store float %1002, ptr addrspace(3) %1004, align 4
  %1005 = load i32, ptr %997, align 4
  %1006 = load i32, ptr %999, align 4
  %1007 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %971
  store i32 %1005, ptr addrspace(3) %1007, align 4
  %1008 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %972
  store i32 %1006, ptr addrspace(3) %1008, align 4
  br label %is_smaller_than-after280

is_last_tile-true281:                             ; preds = %is_last_tile-after268
  %1009 = udiv i64 %thread.id.x, 2
  %1010 = urem i64 %thread.id.x, 2
  %1011 = mul i64 %1009, 4
  %1012 = add i64 %1011, %1010
  %1013 = xor i64 %1012, 2
  %1014 = icmp slt i64 %1012, %1013
  %1015 = icmp slt i64 %1013, 165
  %1016 = and i1 %1014, %1015
  br i1 %1016, label %smaller_comparison_index-true284, label %smaller_comparison_index-after285

smaller_comparison_index-after285:                ; preds = %is_smaller_than-after289, %is_last_tile-true281
  br label %is_last_tile-after283

is_last_tile-false282:                            ; preds = %is_last_tile-after268
  %1017 = udiv i64 %thread.id.x, 2
  %1018 = urem i64 %thread.id.x, 2
  %1019 = mul i64 %1017, 4
  %1020 = add i64 %1019, %1018
  %1021 = xor i64 %1020, 2
  %1022 = icmp slt i64 %1020, %1021
  %1023 = icmp slt i64 %1021, 256
  br i1 true, label %smaller_comparison_index-true290, label %smaller_comparison_index-after291

smaller_comparison_index-after291:                ; preds = %is_smaller_than-after295, %is_last_tile-false282
  br label %is_last_tile-after283

smaller_comparison_index-true284:                 ; preds = %is_last_tile-true281
  %1024 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1013
  %1025 = addrspacecast ptr addrspace(3) %1024 to ptr
  %1026 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1012
  %1027 = addrspacecast ptr addrspace(3) %1026 to ptr
  %1028 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1013
  %1029 = addrspacecast ptr addrspace(3) %1028 to ptr
  %1030 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1012
  %1031 = addrspacecast ptr addrspace(3) %1030 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1025, ptr %1027, ptr %1029, ptr %1031, ptr %compare_return_buffer286)
  %1032 = load i8, ptr %compare_return_buffer286, align 1
  %boolean_predicate287 = icmp ne i8 %1032, 0
  br i1 %boolean_predicate287, label %is_smaller_than-true288, label %is_smaller_than-after289

is_smaller_than-after289:                         ; preds = %is_smaller_than-true288, %smaller_comparison_index-true284
  br label %smaller_comparison_index-after285

is_smaller_than-true288:                          ; preds = %smaller_comparison_index-true284
  %1033 = load float, ptr %1025, align 4
  %1034 = load float, ptr %1027, align 4
  %1035 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1012
  store float %1033, ptr addrspace(3) %1035, align 4
  %1036 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1013
  store float %1034, ptr addrspace(3) %1036, align 4
  %1037 = load i32, ptr %1029, align 4
  %1038 = load i32, ptr %1031, align 4
  %1039 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1012
  store i32 %1037, ptr addrspace(3) %1039, align 4
  %1040 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1013
  store i32 %1038, ptr addrspace(3) %1040, align 4
  br label %is_smaller_than-after289

smaller_comparison_index-true290:                 ; preds = %is_last_tile-false282
  %1041 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1021
  %1042 = addrspacecast ptr addrspace(3) %1041 to ptr
  %1043 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1020
  %1044 = addrspacecast ptr addrspace(3) %1043 to ptr
  %1045 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1021
  %1046 = addrspacecast ptr addrspace(3) %1045 to ptr
  %1047 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1020
  %1048 = addrspacecast ptr addrspace(3) %1047 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1042, ptr %1044, ptr %1046, ptr %1048, ptr %compare_return_buffer292)
  %1049 = load i8, ptr %compare_return_buffer292, align 1
  %boolean_predicate293 = icmp ne i8 %1049, 0
  br i1 %boolean_predicate293, label %is_smaller_than-true294, label %is_smaller_than-after295

is_smaller_than-after295:                         ; preds = %is_smaller_than-true294, %smaller_comparison_index-true290
  br label %smaller_comparison_index-after291

is_smaller_than-true294:                          ; preds = %smaller_comparison_index-true290
  %1050 = load float, ptr %1042, align 4
  %1051 = load float, ptr %1044, align 4
  %1052 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1020
  store float %1050, ptr addrspace(3) %1052, align 4
  %1053 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1021
  store float %1051, ptr addrspace(3) %1053, align 4
  %1054 = load i32, ptr %1046, align 4
  %1055 = load i32, ptr %1048, align 4
  %1056 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1020
  store i32 %1054, ptr addrspace(3) %1056, align 4
  %1057 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1021
  store i32 %1055, ptr addrspace(3) %1057, align 4
  br label %is_smaller_than-after295

is_last_tile-true296:                             ; preds = %is_last_tile-after283
  %1058 = mul i64 %thread.id.x, 2
  %1059 = xor i64 %1058, 1
  %1060 = icmp slt i64 %1058, %1059
  %1061 = icmp slt i64 %1059, 165
  %1062 = and i1 %1060, %1061
  br i1 %1062, label %smaller_comparison_index-true299, label %smaller_comparison_index-after300

smaller_comparison_index-after300:                ; preds = %is_smaller_than-after304, %is_last_tile-true296
  br label %is_last_tile-after298

is_last_tile-false297:                            ; preds = %is_last_tile-after283
  %1063 = mul i64 %thread.id.x, 2
  %1064 = xor i64 %1063, 1
  %1065 = icmp slt i64 %1063, %1064
  %1066 = icmp slt i64 %1064, 256
  br i1 true, label %smaller_comparison_index-true305, label %smaller_comparison_index-after306

smaller_comparison_index-after306:                ; preds = %is_smaller_than-after310, %is_last_tile-false297
  br label %is_last_tile-after298

smaller_comparison_index-true299:                 ; preds = %is_last_tile-true296
  %1067 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1059
  %1068 = addrspacecast ptr addrspace(3) %1067 to ptr
  %1069 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1058
  %1070 = addrspacecast ptr addrspace(3) %1069 to ptr
  %1071 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1059
  %1072 = addrspacecast ptr addrspace(3) %1071 to ptr
  %1073 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1058
  %1074 = addrspacecast ptr addrspace(3) %1073 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1068, ptr %1070, ptr %1072, ptr %1074, ptr %compare_return_buffer301)
  %1075 = load i8, ptr %compare_return_buffer301, align 1
  %boolean_predicate302 = icmp ne i8 %1075, 0
  br i1 %boolean_predicate302, label %is_smaller_than-true303, label %is_smaller_than-after304

is_smaller_than-after304:                         ; preds = %is_smaller_than-true303, %smaller_comparison_index-true299
  br label %smaller_comparison_index-after300

is_smaller_than-true303:                          ; preds = %smaller_comparison_index-true299
  %1076 = load float, ptr %1068, align 4
  %1077 = load float, ptr %1070, align 4
  %1078 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1058
  store float %1076, ptr addrspace(3) %1078, align 4
  %1079 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1059
  store float %1077, ptr addrspace(3) %1079, align 4
  %1080 = load i32, ptr %1072, align 4
  %1081 = load i32, ptr %1074, align 4
  %1082 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1058
  store i32 %1080, ptr addrspace(3) %1082, align 4
  %1083 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1059
  store i32 %1081, ptr addrspace(3) %1083, align 4
  br label %is_smaller_than-after304

smaller_comparison_index-true305:                 ; preds = %is_last_tile-false297
  %1084 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1064
  %1085 = addrspacecast ptr addrspace(3) %1084 to ptr
  %1086 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1063
  %1087 = addrspacecast ptr addrspace(3) %1086 to ptr
  %1088 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1064
  %1089 = addrspacecast ptr addrspace(3) %1088 to ptr
  %1090 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1063
  %1091 = addrspacecast ptr addrspace(3) %1090 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1085, ptr %1087, ptr %1089, ptr %1091, ptr %compare_return_buffer307)
  %1092 = load i8, ptr %compare_return_buffer307, align 1
  %boolean_predicate308 = icmp ne i8 %1092, 0
  br i1 %boolean_predicate308, label %is_smaller_than-true309, label %is_smaller_than-after310

is_smaller_than-after310:                         ; preds = %is_smaller_than-true309, %smaller_comparison_index-true305
  br label %smaller_comparison_index-after306

is_smaller_than-true309:                          ; preds = %smaller_comparison_index-true305
  %1093 = load float, ptr %1085, align 4
  %1094 = load float, ptr %1087, align 4
  %1095 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1063
  store float %1093, ptr addrspace(3) %1095, align 4
  %1096 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1064
  store float %1094, ptr addrspace(3) %1096, align 4
  %1097 = load i32, ptr %1089, align 4
  %1098 = load i32, ptr %1091, align 4
  %1099 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1063
  store i32 %1097, ptr addrspace(3) %1099, align 4
  %1100 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1064
  store i32 %1098, ptr addrspace(3) %1100, align 4
  br label %is_smaller_than-after310

is_last_tile-true311:                             ; preds = %is_last_tile-after298
  %1101 = udiv i64 %thread.id.x, 64
  %1102 = urem i64 %thread.id.x, 64
  %1103 = mul i64 %1101, 128
  %1104 = add i64 %1103, %1102
  %1105 = xor i64 %1104, 127
  %1106 = icmp slt i64 %1104, %1105
  %1107 = icmp slt i64 %1105, 165
  %1108 = and i1 %1106, %1107
  br i1 %1108, label %smaller_comparison_index-true314, label %smaller_comparison_index-after315

smaller_comparison_index-after315:                ; preds = %is_smaller_than-after319, %is_last_tile-true311
  br label %is_last_tile-after313

is_last_tile-false312:                            ; preds = %is_last_tile-after298
  %1109 = udiv i64 %thread.id.x, 64
  %1110 = urem i64 %thread.id.x, 64
  %1111 = mul i64 %1109, 128
  %1112 = add i64 %1111, %1110
  %1113 = xor i64 %1112, 127
  %1114 = icmp slt i64 %1112, %1113
  %1115 = icmp slt i64 %1113, 256
  br i1 true, label %smaller_comparison_index-true320, label %smaller_comparison_index-after321

smaller_comparison_index-after321:                ; preds = %is_smaller_than-after325, %is_last_tile-false312
  br label %is_last_tile-after313

smaller_comparison_index-true314:                 ; preds = %is_last_tile-true311
  %1116 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1105
  %1117 = addrspacecast ptr addrspace(3) %1116 to ptr
  %1118 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1104
  %1119 = addrspacecast ptr addrspace(3) %1118 to ptr
  %1120 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1105
  %1121 = addrspacecast ptr addrspace(3) %1120 to ptr
  %1122 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1104
  %1123 = addrspacecast ptr addrspace(3) %1122 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1117, ptr %1119, ptr %1121, ptr %1123, ptr %compare_return_buffer316)
  %1124 = load i8, ptr %compare_return_buffer316, align 1
  %boolean_predicate317 = icmp ne i8 %1124, 0
  br i1 %boolean_predicate317, label %is_smaller_than-true318, label %is_smaller_than-after319

is_smaller_than-after319:                         ; preds = %is_smaller_than-true318, %smaller_comparison_index-true314
  br label %smaller_comparison_index-after315

is_smaller_than-true318:                          ; preds = %smaller_comparison_index-true314
  %1125 = load float, ptr %1117, align 4
  %1126 = load float, ptr %1119, align 4
  %1127 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1104
  store float %1125, ptr addrspace(3) %1127, align 4
  %1128 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1105
  store float %1126, ptr addrspace(3) %1128, align 4
  %1129 = load i32, ptr %1121, align 4
  %1130 = load i32, ptr %1123, align 4
  %1131 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1104
  store i32 %1129, ptr addrspace(3) %1131, align 4
  %1132 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1105
  store i32 %1130, ptr addrspace(3) %1132, align 4
  br label %is_smaller_than-after319

smaller_comparison_index-true320:                 ; preds = %is_last_tile-false312
  %1133 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1113
  %1134 = addrspacecast ptr addrspace(3) %1133 to ptr
  %1135 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1112
  %1136 = addrspacecast ptr addrspace(3) %1135 to ptr
  %1137 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1113
  %1138 = addrspacecast ptr addrspace(3) %1137 to ptr
  %1139 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1112
  %1140 = addrspacecast ptr addrspace(3) %1139 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1134, ptr %1136, ptr %1138, ptr %1140, ptr %compare_return_buffer322)
  %1141 = load i8, ptr %compare_return_buffer322, align 1
  %boolean_predicate323 = icmp ne i8 %1141, 0
  br i1 %boolean_predicate323, label %is_smaller_than-true324, label %is_smaller_than-after325

is_smaller_than-after325:                         ; preds = %is_smaller_than-true324, %smaller_comparison_index-true320
  br label %smaller_comparison_index-after321

is_smaller_than-true324:                          ; preds = %smaller_comparison_index-true320
  %1142 = load float, ptr %1134, align 4
  %1143 = load float, ptr %1136, align 4
  %1144 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1112
  store float %1142, ptr addrspace(3) %1144, align 4
  %1145 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1113
  store float %1143, ptr addrspace(3) %1145, align 4
  %1146 = load i32, ptr %1138, align 4
  %1147 = load i32, ptr %1140, align 4
  %1148 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1112
  store i32 %1146, ptr addrspace(3) %1148, align 4
  %1149 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1113
  store i32 %1147, ptr addrspace(3) %1149, align 4
  br label %is_smaller_than-after325

is_last_tile-true326:                             ; preds = %is_last_tile-after313
  %1150 = udiv i64 %thread.id.x, 32
  %1151 = urem i64 %thread.id.x, 32
  %1152 = mul i64 %1150, 64
  %1153 = add i64 %1152, %1151
  %1154 = xor i64 %1153, 32
  %1155 = icmp slt i64 %1153, %1154
  %1156 = icmp slt i64 %1154, 165
  %1157 = and i1 %1155, %1156
  br i1 %1157, label %smaller_comparison_index-true329, label %smaller_comparison_index-after330

smaller_comparison_index-after330:                ; preds = %is_smaller_than-after334, %is_last_tile-true326
  br label %is_last_tile-after328

is_last_tile-false327:                            ; preds = %is_last_tile-after313
  %1158 = udiv i64 %thread.id.x, 32
  %1159 = urem i64 %thread.id.x, 32
  %1160 = mul i64 %1158, 64
  %1161 = add i64 %1160, %1159
  %1162 = xor i64 %1161, 32
  %1163 = icmp slt i64 %1161, %1162
  %1164 = icmp slt i64 %1162, 256
  br i1 true, label %smaller_comparison_index-true335, label %smaller_comparison_index-after336

smaller_comparison_index-after336:                ; preds = %is_smaller_than-after340, %is_last_tile-false327
  br label %is_last_tile-after328

smaller_comparison_index-true329:                 ; preds = %is_last_tile-true326
  %1165 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1154
  %1166 = addrspacecast ptr addrspace(3) %1165 to ptr
  %1167 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1153
  %1168 = addrspacecast ptr addrspace(3) %1167 to ptr
  %1169 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1154
  %1170 = addrspacecast ptr addrspace(3) %1169 to ptr
  %1171 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1153
  %1172 = addrspacecast ptr addrspace(3) %1171 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1166, ptr %1168, ptr %1170, ptr %1172, ptr %compare_return_buffer331)
  %1173 = load i8, ptr %compare_return_buffer331, align 1
  %boolean_predicate332 = icmp ne i8 %1173, 0
  br i1 %boolean_predicate332, label %is_smaller_than-true333, label %is_smaller_than-after334

is_smaller_than-after334:                         ; preds = %is_smaller_than-true333, %smaller_comparison_index-true329
  br label %smaller_comparison_index-after330

is_smaller_than-true333:                          ; preds = %smaller_comparison_index-true329
  %1174 = load float, ptr %1166, align 4
  %1175 = load float, ptr %1168, align 4
  %1176 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1153
  store float %1174, ptr addrspace(3) %1176, align 4
  %1177 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1154
  store float %1175, ptr addrspace(3) %1177, align 4
  %1178 = load i32, ptr %1170, align 4
  %1179 = load i32, ptr %1172, align 4
  %1180 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1153
  store i32 %1178, ptr addrspace(3) %1180, align 4
  %1181 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1154
  store i32 %1179, ptr addrspace(3) %1181, align 4
  br label %is_smaller_than-after334

smaller_comparison_index-true335:                 ; preds = %is_last_tile-false327
  %1182 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1162
  %1183 = addrspacecast ptr addrspace(3) %1182 to ptr
  %1184 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1161
  %1185 = addrspacecast ptr addrspace(3) %1184 to ptr
  %1186 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1162
  %1187 = addrspacecast ptr addrspace(3) %1186 to ptr
  %1188 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1161
  %1189 = addrspacecast ptr addrspace(3) %1188 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1183, ptr %1185, ptr %1187, ptr %1189, ptr %compare_return_buffer337)
  %1190 = load i8, ptr %compare_return_buffer337, align 1
  %boolean_predicate338 = icmp ne i8 %1190, 0
  br i1 %boolean_predicate338, label %is_smaller_than-true339, label %is_smaller_than-after340

is_smaller_than-after340:                         ; preds = %is_smaller_than-true339, %smaller_comparison_index-true335
  br label %smaller_comparison_index-after336

is_smaller_than-true339:                          ; preds = %smaller_comparison_index-true335
  %1191 = load float, ptr %1183, align 4
  %1192 = load float, ptr %1185, align 4
  %1193 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1161
  store float %1191, ptr addrspace(3) %1193, align 4
  %1194 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1162
  store float %1192, ptr addrspace(3) %1194, align 4
  %1195 = load i32, ptr %1187, align 4
  %1196 = load i32, ptr %1189, align 4
  %1197 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1161
  store i32 %1195, ptr addrspace(3) %1197, align 4
  %1198 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1162
  store i32 %1196, ptr addrspace(3) %1198, align 4
  br label %is_smaller_than-after340

is_last_tile-true341:                             ; preds = %is_last_tile-after328
  %1199 = udiv i64 %thread.id.x, 16
  %1200 = urem i64 %thread.id.x, 16
  %1201 = mul i64 %1199, 32
  %1202 = add i64 %1201, %1200
  %1203 = xor i64 %1202, 16
  %1204 = icmp slt i64 %1202, %1203
  %1205 = icmp slt i64 %1203, 165
  %1206 = and i1 %1204, %1205
  br i1 %1206, label %smaller_comparison_index-true344, label %smaller_comparison_index-after345

smaller_comparison_index-after345:                ; preds = %is_smaller_than-after349, %is_last_tile-true341
  br label %is_last_tile-after343

is_last_tile-false342:                            ; preds = %is_last_tile-after328
  %1207 = udiv i64 %thread.id.x, 16
  %1208 = urem i64 %thread.id.x, 16
  %1209 = mul i64 %1207, 32
  %1210 = add i64 %1209, %1208
  %1211 = xor i64 %1210, 16
  %1212 = icmp slt i64 %1210, %1211
  %1213 = icmp slt i64 %1211, 256
  br i1 true, label %smaller_comparison_index-true350, label %smaller_comparison_index-after351

smaller_comparison_index-after351:                ; preds = %is_smaller_than-after355, %is_last_tile-false342
  br label %is_last_tile-after343

smaller_comparison_index-true344:                 ; preds = %is_last_tile-true341
  %1214 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1203
  %1215 = addrspacecast ptr addrspace(3) %1214 to ptr
  %1216 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1202
  %1217 = addrspacecast ptr addrspace(3) %1216 to ptr
  %1218 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1203
  %1219 = addrspacecast ptr addrspace(3) %1218 to ptr
  %1220 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1202
  %1221 = addrspacecast ptr addrspace(3) %1220 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1215, ptr %1217, ptr %1219, ptr %1221, ptr %compare_return_buffer346)
  %1222 = load i8, ptr %compare_return_buffer346, align 1
  %boolean_predicate347 = icmp ne i8 %1222, 0
  br i1 %boolean_predicate347, label %is_smaller_than-true348, label %is_smaller_than-after349

is_smaller_than-after349:                         ; preds = %is_smaller_than-true348, %smaller_comparison_index-true344
  br label %smaller_comparison_index-after345

is_smaller_than-true348:                          ; preds = %smaller_comparison_index-true344
  %1223 = load float, ptr %1215, align 4
  %1224 = load float, ptr %1217, align 4
  %1225 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1202
  store float %1223, ptr addrspace(3) %1225, align 4
  %1226 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1203
  store float %1224, ptr addrspace(3) %1226, align 4
  %1227 = load i32, ptr %1219, align 4
  %1228 = load i32, ptr %1221, align 4
  %1229 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1202
  store i32 %1227, ptr addrspace(3) %1229, align 4
  %1230 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1203
  store i32 %1228, ptr addrspace(3) %1230, align 4
  br label %is_smaller_than-after349

smaller_comparison_index-true350:                 ; preds = %is_last_tile-false342
  %1231 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1211
  %1232 = addrspacecast ptr addrspace(3) %1231 to ptr
  %1233 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1210
  %1234 = addrspacecast ptr addrspace(3) %1233 to ptr
  %1235 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1211
  %1236 = addrspacecast ptr addrspace(3) %1235 to ptr
  %1237 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1210
  %1238 = addrspacecast ptr addrspace(3) %1237 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1232, ptr %1234, ptr %1236, ptr %1238, ptr %compare_return_buffer352)
  %1239 = load i8, ptr %compare_return_buffer352, align 1
  %boolean_predicate353 = icmp ne i8 %1239, 0
  br i1 %boolean_predicate353, label %is_smaller_than-true354, label %is_smaller_than-after355

is_smaller_than-after355:                         ; preds = %is_smaller_than-true354, %smaller_comparison_index-true350
  br label %smaller_comparison_index-after351

is_smaller_than-true354:                          ; preds = %smaller_comparison_index-true350
  %1240 = load float, ptr %1232, align 4
  %1241 = load float, ptr %1234, align 4
  %1242 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1210
  store float %1240, ptr addrspace(3) %1242, align 4
  %1243 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1211
  store float %1241, ptr addrspace(3) %1243, align 4
  %1244 = load i32, ptr %1236, align 4
  %1245 = load i32, ptr %1238, align 4
  %1246 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1210
  store i32 %1244, ptr addrspace(3) %1246, align 4
  %1247 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1211
  store i32 %1245, ptr addrspace(3) %1247, align 4
  br label %is_smaller_than-after355

is_last_tile-true356:                             ; preds = %is_last_tile-after343
  %1248 = udiv i64 %thread.id.x, 8
  %1249 = urem i64 %thread.id.x, 8
  %1250 = mul i64 %1248, 16
  %1251 = add i64 %1250, %1249
  %1252 = xor i64 %1251, 8
  %1253 = icmp slt i64 %1251, %1252
  %1254 = icmp slt i64 %1252, 165
  %1255 = and i1 %1253, %1254
  br i1 %1255, label %smaller_comparison_index-true359, label %smaller_comparison_index-after360

smaller_comparison_index-after360:                ; preds = %is_smaller_than-after364, %is_last_tile-true356
  br label %is_last_tile-after358

is_last_tile-false357:                            ; preds = %is_last_tile-after343
  %1256 = udiv i64 %thread.id.x, 8
  %1257 = urem i64 %thread.id.x, 8
  %1258 = mul i64 %1256, 16
  %1259 = add i64 %1258, %1257
  %1260 = xor i64 %1259, 8
  %1261 = icmp slt i64 %1259, %1260
  %1262 = icmp slt i64 %1260, 256
  br i1 true, label %smaller_comparison_index-true365, label %smaller_comparison_index-after366

smaller_comparison_index-after366:                ; preds = %is_smaller_than-after370, %is_last_tile-false357
  br label %is_last_tile-after358

smaller_comparison_index-true359:                 ; preds = %is_last_tile-true356
  %1263 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1252
  %1264 = addrspacecast ptr addrspace(3) %1263 to ptr
  %1265 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1251
  %1266 = addrspacecast ptr addrspace(3) %1265 to ptr
  %1267 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1252
  %1268 = addrspacecast ptr addrspace(3) %1267 to ptr
  %1269 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1251
  %1270 = addrspacecast ptr addrspace(3) %1269 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1264, ptr %1266, ptr %1268, ptr %1270, ptr %compare_return_buffer361)
  %1271 = load i8, ptr %compare_return_buffer361, align 1
  %boolean_predicate362 = icmp ne i8 %1271, 0
  br i1 %boolean_predicate362, label %is_smaller_than-true363, label %is_smaller_than-after364

is_smaller_than-after364:                         ; preds = %is_smaller_than-true363, %smaller_comparison_index-true359
  br label %smaller_comparison_index-after360

is_smaller_than-true363:                          ; preds = %smaller_comparison_index-true359
  %1272 = load float, ptr %1264, align 4
  %1273 = load float, ptr %1266, align 4
  %1274 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1251
  store float %1272, ptr addrspace(3) %1274, align 4
  %1275 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1252
  store float %1273, ptr addrspace(3) %1275, align 4
  %1276 = load i32, ptr %1268, align 4
  %1277 = load i32, ptr %1270, align 4
  %1278 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1251
  store i32 %1276, ptr addrspace(3) %1278, align 4
  %1279 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1252
  store i32 %1277, ptr addrspace(3) %1279, align 4
  br label %is_smaller_than-after364

smaller_comparison_index-true365:                 ; preds = %is_last_tile-false357
  %1280 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1260
  %1281 = addrspacecast ptr addrspace(3) %1280 to ptr
  %1282 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1259
  %1283 = addrspacecast ptr addrspace(3) %1282 to ptr
  %1284 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1260
  %1285 = addrspacecast ptr addrspace(3) %1284 to ptr
  %1286 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1259
  %1287 = addrspacecast ptr addrspace(3) %1286 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1281, ptr %1283, ptr %1285, ptr %1287, ptr %compare_return_buffer367)
  %1288 = load i8, ptr %compare_return_buffer367, align 1
  %boolean_predicate368 = icmp ne i8 %1288, 0
  br i1 %boolean_predicate368, label %is_smaller_than-true369, label %is_smaller_than-after370

is_smaller_than-after370:                         ; preds = %is_smaller_than-true369, %smaller_comparison_index-true365
  br label %smaller_comparison_index-after366

is_smaller_than-true369:                          ; preds = %smaller_comparison_index-true365
  %1289 = load float, ptr %1281, align 4
  %1290 = load float, ptr %1283, align 4
  %1291 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1259
  store float %1289, ptr addrspace(3) %1291, align 4
  %1292 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1260
  store float %1290, ptr addrspace(3) %1292, align 4
  %1293 = load i32, ptr %1285, align 4
  %1294 = load i32, ptr %1287, align 4
  %1295 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1259
  store i32 %1293, ptr addrspace(3) %1295, align 4
  %1296 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1260
  store i32 %1294, ptr addrspace(3) %1296, align 4
  br label %is_smaller_than-after370

is_last_tile-true371:                             ; preds = %is_last_tile-after358
  %1297 = udiv i64 %thread.id.x, 4
  %1298 = urem i64 %thread.id.x, 4
  %1299 = mul i64 %1297, 8
  %1300 = add i64 %1299, %1298
  %1301 = xor i64 %1300, 4
  %1302 = icmp slt i64 %1300, %1301
  %1303 = icmp slt i64 %1301, 165
  %1304 = and i1 %1302, %1303
  br i1 %1304, label %smaller_comparison_index-true374, label %smaller_comparison_index-after375

smaller_comparison_index-after375:                ; preds = %is_smaller_than-after379, %is_last_tile-true371
  br label %is_last_tile-after373

is_last_tile-false372:                            ; preds = %is_last_tile-after358
  %1305 = udiv i64 %thread.id.x, 4
  %1306 = urem i64 %thread.id.x, 4
  %1307 = mul i64 %1305, 8
  %1308 = add i64 %1307, %1306
  %1309 = xor i64 %1308, 4
  %1310 = icmp slt i64 %1308, %1309
  %1311 = icmp slt i64 %1309, 256
  br i1 true, label %smaller_comparison_index-true380, label %smaller_comparison_index-after381

smaller_comparison_index-after381:                ; preds = %is_smaller_than-after385, %is_last_tile-false372
  br label %is_last_tile-after373

smaller_comparison_index-true374:                 ; preds = %is_last_tile-true371
  %1312 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1301
  %1313 = addrspacecast ptr addrspace(3) %1312 to ptr
  %1314 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1300
  %1315 = addrspacecast ptr addrspace(3) %1314 to ptr
  %1316 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1301
  %1317 = addrspacecast ptr addrspace(3) %1316 to ptr
  %1318 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1300
  %1319 = addrspacecast ptr addrspace(3) %1318 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1313, ptr %1315, ptr %1317, ptr %1319, ptr %compare_return_buffer376)
  %1320 = load i8, ptr %compare_return_buffer376, align 1
  %boolean_predicate377 = icmp ne i8 %1320, 0
  br i1 %boolean_predicate377, label %is_smaller_than-true378, label %is_smaller_than-after379

is_smaller_than-after379:                         ; preds = %is_smaller_than-true378, %smaller_comparison_index-true374
  br label %smaller_comparison_index-after375

is_smaller_than-true378:                          ; preds = %smaller_comparison_index-true374
  %1321 = load float, ptr %1313, align 4
  %1322 = load float, ptr %1315, align 4
  %1323 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1300
  store float %1321, ptr addrspace(3) %1323, align 4
  %1324 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1301
  store float %1322, ptr addrspace(3) %1324, align 4
  %1325 = load i32, ptr %1317, align 4
  %1326 = load i32, ptr %1319, align 4
  %1327 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1300
  store i32 %1325, ptr addrspace(3) %1327, align 4
  %1328 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1301
  store i32 %1326, ptr addrspace(3) %1328, align 4
  br label %is_smaller_than-after379

smaller_comparison_index-true380:                 ; preds = %is_last_tile-false372
  %1329 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1309
  %1330 = addrspacecast ptr addrspace(3) %1329 to ptr
  %1331 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1308
  %1332 = addrspacecast ptr addrspace(3) %1331 to ptr
  %1333 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1309
  %1334 = addrspacecast ptr addrspace(3) %1333 to ptr
  %1335 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1308
  %1336 = addrspacecast ptr addrspace(3) %1335 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1330, ptr %1332, ptr %1334, ptr %1336, ptr %compare_return_buffer382)
  %1337 = load i8, ptr %compare_return_buffer382, align 1
  %boolean_predicate383 = icmp ne i8 %1337, 0
  br i1 %boolean_predicate383, label %is_smaller_than-true384, label %is_smaller_than-after385

is_smaller_than-after385:                         ; preds = %is_smaller_than-true384, %smaller_comparison_index-true380
  br label %smaller_comparison_index-after381

is_smaller_than-true384:                          ; preds = %smaller_comparison_index-true380
  %1338 = load float, ptr %1330, align 4
  %1339 = load float, ptr %1332, align 4
  %1340 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1308
  store float %1338, ptr addrspace(3) %1340, align 4
  %1341 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1309
  store float %1339, ptr addrspace(3) %1341, align 4
  %1342 = load i32, ptr %1334, align 4
  %1343 = load i32, ptr %1336, align 4
  %1344 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1308
  store i32 %1342, ptr addrspace(3) %1344, align 4
  %1345 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1309
  store i32 %1343, ptr addrspace(3) %1345, align 4
  br label %is_smaller_than-after385

is_last_tile-true386:                             ; preds = %is_last_tile-after373
  %1346 = udiv i64 %thread.id.x, 2
  %1347 = urem i64 %thread.id.x, 2
  %1348 = mul i64 %1346, 4
  %1349 = add i64 %1348, %1347
  %1350 = xor i64 %1349, 2
  %1351 = icmp slt i64 %1349, %1350
  %1352 = icmp slt i64 %1350, 165
  %1353 = and i1 %1351, %1352
  br i1 %1353, label %smaller_comparison_index-true389, label %smaller_comparison_index-after390

smaller_comparison_index-after390:                ; preds = %is_smaller_than-after394, %is_last_tile-true386
  br label %is_last_tile-after388

is_last_tile-false387:                            ; preds = %is_last_tile-after373
  %1354 = udiv i64 %thread.id.x, 2
  %1355 = urem i64 %thread.id.x, 2
  %1356 = mul i64 %1354, 4
  %1357 = add i64 %1356, %1355
  %1358 = xor i64 %1357, 2
  %1359 = icmp slt i64 %1357, %1358
  %1360 = icmp slt i64 %1358, 256
  br i1 true, label %smaller_comparison_index-true395, label %smaller_comparison_index-after396

smaller_comparison_index-after396:                ; preds = %is_smaller_than-after400, %is_last_tile-false387
  br label %is_last_tile-after388

smaller_comparison_index-true389:                 ; preds = %is_last_tile-true386
  %1361 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1350
  %1362 = addrspacecast ptr addrspace(3) %1361 to ptr
  %1363 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1349
  %1364 = addrspacecast ptr addrspace(3) %1363 to ptr
  %1365 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1350
  %1366 = addrspacecast ptr addrspace(3) %1365 to ptr
  %1367 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1349
  %1368 = addrspacecast ptr addrspace(3) %1367 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1362, ptr %1364, ptr %1366, ptr %1368, ptr %compare_return_buffer391)
  %1369 = load i8, ptr %compare_return_buffer391, align 1
  %boolean_predicate392 = icmp ne i8 %1369, 0
  br i1 %boolean_predicate392, label %is_smaller_than-true393, label %is_smaller_than-after394

is_smaller_than-after394:                         ; preds = %is_smaller_than-true393, %smaller_comparison_index-true389
  br label %smaller_comparison_index-after390

is_smaller_than-true393:                          ; preds = %smaller_comparison_index-true389
  %1370 = load float, ptr %1362, align 4
  %1371 = load float, ptr %1364, align 4
  %1372 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1349
  store float %1370, ptr addrspace(3) %1372, align 4
  %1373 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1350
  store float %1371, ptr addrspace(3) %1373, align 4
  %1374 = load i32, ptr %1366, align 4
  %1375 = load i32, ptr %1368, align 4
  %1376 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1349
  store i32 %1374, ptr addrspace(3) %1376, align 4
  %1377 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1350
  store i32 %1375, ptr addrspace(3) %1377, align 4
  br label %is_smaller_than-after394

smaller_comparison_index-true395:                 ; preds = %is_last_tile-false387
  %1378 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1358
  %1379 = addrspacecast ptr addrspace(3) %1378 to ptr
  %1380 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1357
  %1381 = addrspacecast ptr addrspace(3) %1380 to ptr
  %1382 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1358
  %1383 = addrspacecast ptr addrspace(3) %1382 to ptr
  %1384 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1357
  %1385 = addrspacecast ptr addrspace(3) %1384 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1379, ptr %1381, ptr %1383, ptr %1385, ptr %compare_return_buffer397)
  %1386 = load i8, ptr %compare_return_buffer397, align 1
  %boolean_predicate398 = icmp ne i8 %1386, 0
  br i1 %boolean_predicate398, label %is_smaller_than-true399, label %is_smaller_than-after400

is_smaller_than-after400:                         ; preds = %is_smaller_than-true399, %smaller_comparison_index-true395
  br label %smaller_comparison_index-after396

is_smaller_than-true399:                          ; preds = %smaller_comparison_index-true395
  %1387 = load float, ptr %1379, align 4
  %1388 = load float, ptr %1381, align 4
  %1389 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1357
  store float %1387, ptr addrspace(3) %1389, align 4
  %1390 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1358
  store float %1388, ptr addrspace(3) %1390, align 4
  %1391 = load i32, ptr %1383, align 4
  %1392 = load i32, ptr %1385, align 4
  %1393 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1357
  store i32 %1391, ptr addrspace(3) %1393, align 4
  %1394 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1358
  store i32 %1392, ptr addrspace(3) %1394, align 4
  br label %is_smaller_than-after400

is_last_tile-true401:                             ; preds = %is_last_tile-after388
  %1395 = mul i64 %thread.id.x, 2
  %1396 = xor i64 %1395, 1
  %1397 = icmp slt i64 %1395, %1396
  %1398 = icmp slt i64 %1396, 165
  %1399 = and i1 %1397, %1398
  br i1 %1399, label %smaller_comparison_index-true404, label %smaller_comparison_index-after405

smaller_comparison_index-after405:                ; preds = %is_smaller_than-after409, %is_last_tile-true401
  br label %is_last_tile-after403

is_last_tile-false402:                            ; preds = %is_last_tile-after388
  %1400 = mul i64 %thread.id.x, 2
  %1401 = xor i64 %1400, 1
  %1402 = icmp slt i64 %1400, %1401
  %1403 = icmp slt i64 %1401, 256
  br i1 true, label %smaller_comparison_index-true410, label %smaller_comparison_index-after411

smaller_comparison_index-after411:                ; preds = %is_smaller_than-after415, %is_last_tile-false402
  br label %is_last_tile-after403

smaller_comparison_index-true404:                 ; preds = %is_last_tile-true401
  %1404 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1396
  %1405 = addrspacecast ptr addrspace(3) %1404 to ptr
  %1406 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1395
  %1407 = addrspacecast ptr addrspace(3) %1406 to ptr
  %1408 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1396
  %1409 = addrspacecast ptr addrspace(3) %1408 to ptr
  %1410 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1395
  %1411 = addrspacecast ptr addrspace(3) %1410 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1405, ptr %1407, ptr %1409, ptr %1411, ptr %compare_return_buffer406)
  %1412 = load i8, ptr %compare_return_buffer406, align 1
  %boolean_predicate407 = icmp ne i8 %1412, 0
  br i1 %boolean_predicate407, label %is_smaller_than-true408, label %is_smaller_than-after409

is_smaller_than-after409:                         ; preds = %is_smaller_than-true408, %smaller_comparison_index-true404
  br label %smaller_comparison_index-after405

is_smaller_than-true408:                          ; preds = %smaller_comparison_index-true404
  %1413 = load float, ptr %1405, align 4
  %1414 = load float, ptr %1407, align 4
  %1415 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1395
  store float %1413, ptr addrspace(3) %1415, align 4
  %1416 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1396
  store float %1414, ptr addrspace(3) %1416, align 4
  %1417 = load i32, ptr %1409, align 4
  %1418 = load i32, ptr %1411, align 4
  %1419 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1395
  store i32 %1417, ptr addrspace(3) %1419, align 4
  %1420 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1396
  store i32 %1418, ptr addrspace(3) %1420, align 4
  br label %is_smaller_than-after409

smaller_comparison_index-true410:                 ; preds = %is_last_tile-false402
  %1421 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1401
  %1422 = addrspacecast ptr addrspace(3) %1421 to ptr
  %1423 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1400
  %1424 = addrspacecast ptr addrspace(3) %1423 to ptr
  %1425 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1401
  %1426 = addrspacecast ptr addrspace(3) %1425 to ptr
  %1427 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1400
  %1428 = addrspacecast ptr addrspace(3) %1427 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1422, ptr %1424, ptr %1426, ptr %1428, ptr %compare_return_buffer412)
  %1429 = load i8, ptr %compare_return_buffer412, align 1
  %boolean_predicate413 = icmp ne i8 %1429, 0
  br i1 %boolean_predicate413, label %is_smaller_than-true414, label %is_smaller_than-after415

is_smaller_than-after415:                         ; preds = %is_smaller_than-true414, %smaller_comparison_index-true410
  br label %smaller_comparison_index-after411

is_smaller_than-true414:                          ; preds = %smaller_comparison_index-true410
  %1430 = load float, ptr %1422, align 4
  %1431 = load float, ptr %1424, align 4
  %1432 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1400
  store float %1430, ptr addrspace(3) %1432, align 4
  %1433 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1401
  store float %1431, ptr addrspace(3) %1433, align 4
  %1434 = load i32, ptr %1426, align 4
  %1435 = load i32, ptr %1428, align 4
  %1436 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1400
  store i32 %1434, ptr addrspace(3) %1436, align 4
  %1437 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1401
  store i32 %1435, ptr addrspace(3) %1437, align 4
  br label %is_smaller_than-after415

is_last_tile-true416:                             ; preds = %is_last_tile-after403
  %1438 = xor i64 %thread.id.x, 255
  %1439 = icmp slt i64 %thread.id.x, %1438
  %1440 = icmp slt i64 %1438, 165
  %1441 = and i1 %1439, %1440
  br i1 %1441, label %smaller_comparison_index-true419, label %smaller_comparison_index-after420

smaller_comparison_index-after420:                ; preds = %is_smaller_than-after424, %is_last_tile-true416
  br label %is_last_tile-after418

is_last_tile-false417:                            ; preds = %is_last_tile-after403
  %1442 = xor i64 %thread.id.x, 255
  %1443 = icmp slt i64 %thread.id.x, %1442
  %1444 = icmp slt i64 %1442, 256
  br i1 true, label %smaller_comparison_index-true425, label %smaller_comparison_index-after426

smaller_comparison_index-after426:                ; preds = %is_smaller_than-after430, %is_last_tile-false417
  br label %is_last_tile-after418

smaller_comparison_index-true419:                 ; preds = %is_last_tile-true416
  %1445 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1438
  %1446 = addrspacecast ptr addrspace(3) %1445 to ptr
  %1447 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %thread.id.x
  %1448 = addrspacecast ptr addrspace(3) %1447 to ptr
  %1449 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1438
  %1450 = addrspacecast ptr addrspace(3) %1449 to ptr
  %1451 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %thread.id.x
  %1452 = addrspacecast ptr addrspace(3) %1451 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1446, ptr %1448, ptr %1450, ptr %1452, ptr %compare_return_buffer421)
  %1453 = load i8, ptr %compare_return_buffer421, align 1
  %boolean_predicate422 = icmp ne i8 %1453, 0
  br i1 %boolean_predicate422, label %is_smaller_than-true423, label %is_smaller_than-after424

is_smaller_than-after424:                         ; preds = %is_smaller_than-true423, %smaller_comparison_index-true419
  br label %smaller_comparison_index-after420

is_smaller_than-true423:                          ; preds = %smaller_comparison_index-true419
  %1454 = load float, ptr %1446, align 4
  %1455 = load float, ptr %1448, align 4
  %1456 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %thread.id.x
  store float %1454, ptr addrspace(3) %1456, align 4
  %1457 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1438
  store float %1455, ptr addrspace(3) %1457, align 4
  %1458 = load i32, ptr %1450, align 4
  %1459 = load i32, ptr %1452, align 4
  %1460 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %thread.id.x
  store i32 %1458, ptr addrspace(3) %1460, align 4
  %1461 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1438
  store i32 %1459, ptr addrspace(3) %1461, align 4
  br label %is_smaller_than-after424

smaller_comparison_index-true425:                 ; preds = %is_last_tile-false417
  %1462 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1442
  %1463 = addrspacecast ptr addrspace(3) %1462 to ptr
  %1464 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %thread.id.x
  %1465 = addrspacecast ptr addrspace(3) %1464 to ptr
  %1466 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1442
  %1467 = addrspacecast ptr addrspace(3) %1466 to ptr
  %1468 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %thread.id.x
  %1469 = addrspacecast ptr addrspace(3) %1468 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1463, ptr %1465, ptr %1467, ptr %1469, ptr %compare_return_buffer427)
  %1470 = load i8, ptr %compare_return_buffer427, align 1
  %boolean_predicate428 = icmp ne i8 %1470, 0
  br i1 %boolean_predicate428, label %is_smaller_than-true429, label %is_smaller_than-after430

is_smaller_than-after430:                         ; preds = %is_smaller_than-true429, %smaller_comparison_index-true425
  br label %smaller_comparison_index-after426

is_smaller_than-true429:                          ; preds = %smaller_comparison_index-true425
  %1471 = load float, ptr %1463, align 4
  %1472 = load float, ptr %1465, align 4
  %1473 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %thread.id.x
  store float %1471, ptr addrspace(3) %1473, align 4
  %1474 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1442
  store float %1472, ptr addrspace(3) %1474, align 4
  %1475 = load i32, ptr %1467, align 4
  %1476 = load i32, ptr %1469, align 4
  %1477 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %thread.id.x
  store i32 %1475, ptr addrspace(3) %1477, align 4
  %1478 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1442
  store i32 %1476, ptr addrspace(3) %1478, align 4
  br label %is_smaller_than-after430

is_last_tile-true431:                             ; preds = %is_last_tile-after418
  %1479 = udiv i64 %thread.id.x, 64
  %1480 = urem i64 %thread.id.x, 64
  %1481 = mul i64 %1479, 128
  %1482 = add i64 %1481, %1480
  %1483 = xor i64 %1482, 64
  %1484 = icmp slt i64 %1482, %1483
  %1485 = icmp slt i64 %1483, 165
  %1486 = and i1 %1484, %1485
  br i1 %1486, label %smaller_comparison_index-true434, label %smaller_comparison_index-after435

smaller_comparison_index-after435:                ; preds = %is_smaller_than-after439, %is_last_tile-true431
  br label %is_last_tile-after433

is_last_tile-false432:                            ; preds = %is_last_tile-after418
  %1487 = udiv i64 %thread.id.x, 64
  %1488 = urem i64 %thread.id.x, 64
  %1489 = mul i64 %1487, 128
  %1490 = add i64 %1489, %1488
  %1491 = xor i64 %1490, 64
  %1492 = icmp slt i64 %1490, %1491
  %1493 = icmp slt i64 %1491, 256
  br i1 true, label %smaller_comparison_index-true440, label %smaller_comparison_index-after441

smaller_comparison_index-after441:                ; preds = %is_smaller_than-after445, %is_last_tile-false432
  br label %is_last_tile-after433

smaller_comparison_index-true434:                 ; preds = %is_last_tile-true431
  %1494 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1483
  %1495 = addrspacecast ptr addrspace(3) %1494 to ptr
  %1496 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1482
  %1497 = addrspacecast ptr addrspace(3) %1496 to ptr
  %1498 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1483
  %1499 = addrspacecast ptr addrspace(3) %1498 to ptr
  %1500 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1482
  %1501 = addrspacecast ptr addrspace(3) %1500 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1495, ptr %1497, ptr %1499, ptr %1501, ptr %compare_return_buffer436)
  %1502 = load i8, ptr %compare_return_buffer436, align 1
  %boolean_predicate437 = icmp ne i8 %1502, 0
  br i1 %boolean_predicate437, label %is_smaller_than-true438, label %is_smaller_than-after439

is_smaller_than-after439:                         ; preds = %is_smaller_than-true438, %smaller_comparison_index-true434
  br label %smaller_comparison_index-after435

is_smaller_than-true438:                          ; preds = %smaller_comparison_index-true434
  %1503 = load float, ptr %1495, align 4
  %1504 = load float, ptr %1497, align 4
  %1505 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1482
  store float %1503, ptr addrspace(3) %1505, align 4
  %1506 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1483
  store float %1504, ptr addrspace(3) %1506, align 4
  %1507 = load i32, ptr %1499, align 4
  %1508 = load i32, ptr %1501, align 4
  %1509 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1482
  store i32 %1507, ptr addrspace(3) %1509, align 4
  %1510 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1483
  store i32 %1508, ptr addrspace(3) %1510, align 4
  br label %is_smaller_than-after439

smaller_comparison_index-true440:                 ; preds = %is_last_tile-false432
  %1511 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1491
  %1512 = addrspacecast ptr addrspace(3) %1511 to ptr
  %1513 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1490
  %1514 = addrspacecast ptr addrspace(3) %1513 to ptr
  %1515 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1491
  %1516 = addrspacecast ptr addrspace(3) %1515 to ptr
  %1517 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1490
  %1518 = addrspacecast ptr addrspace(3) %1517 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1512, ptr %1514, ptr %1516, ptr %1518, ptr %compare_return_buffer442)
  %1519 = load i8, ptr %compare_return_buffer442, align 1
  %boolean_predicate443 = icmp ne i8 %1519, 0
  br i1 %boolean_predicate443, label %is_smaller_than-true444, label %is_smaller_than-after445

is_smaller_than-after445:                         ; preds = %is_smaller_than-true444, %smaller_comparison_index-true440
  br label %smaller_comparison_index-after441

is_smaller_than-true444:                          ; preds = %smaller_comparison_index-true440
  %1520 = load float, ptr %1512, align 4
  %1521 = load float, ptr %1514, align 4
  %1522 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1490
  store float %1520, ptr addrspace(3) %1522, align 4
  %1523 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1491
  store float %1521, ptr addrspace(3) %1523, align 4
  %1524 = load i32, ptr %1516, align 4
  %1525 = load i32, ptr %1518, align 4
  %1526 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1490
  store i32 %1524, ptr addrspace(3) %1526, align 4
  %1527 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1491
  store i32 %1525, ptr addrspace(3) %1527, align 4
  br label %is_smaller_than-after445

is_last_tile-true446:                             ; preds = %is_last_tile-after433
  %1528 = udiv i64 %thread.id.x, 32
  %1529 = urem i64 %thread.id.x, 32
  %1530 = mul i64 %1528, 64
  %1531 = add i64 %1530, %1529
  %1532 = xor i64 %1531, 32
  %1533 = icmp slt i64 %1531, %1532
  %1534 = icmp slt i64 %1532, 165
  %1535 = and i1 %1533, %1534
  br i1 %1535, label %smaller_comparison_index-true449, label %smaller_comparison_index-after450

smaller_comparison_index-after450:                ; preds = %is_smaller_than-after454, %is_last_tile-true446
  br label %is_last_tile-after448

is_last_tile-false447:                            ; preds = %is_last_tile-after433
  %1536 = udiv i64 %thread.id.x, 32
  %1537 = urem i64 %thread.id.x, 32
  %1538 = mul i64 %1536, 64
  %1539 = add i64 %1538, %1537
  %1540 = xor i64 %1539, 32
  %1541 = icmp slt i64 %1539, %1540
  %1542 = icmp slt i64 %1540, 256
  br i1 true, label %smaller_comparison_index-true455, label %smaller_comparison_index-after456

smaller_comparison_index-after456:                ; preds = %is_smaller_than-after460, %is_last_tile-false447
  br label %is_last_tile-after448

smaller_comparison_index-true449:                 ; preds = %is_last_tile-true446
  %1543 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1532
  %1544 = addrspacecast ptr addrspace(3) %1543 to ptr
  %1545 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1531
  %1546 = addrspacecast ptr addrspace(3) %1545 to ptr
  %1547 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1532
  %1548 = addrspacecast ptr addrspace(3) %1547 to ptr
  %1549 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1531
  %1550 = addrspacecast ptr addrspace(3) %1549 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1544, ptr %1546, ptr %1548, ptr %1550, ptr %compare_return_buffer451)
  %1551 = load i8, ptr %compare_return_buffer451, align 1
  %boolean_predicate452 = icmp ne i8 %1551, 0
  br i1 %boolean_predicate452, label %is_smaller_than-true453, label %is_smaller_than-after454

is_smaller_than-after454:                         ; preds = %is_smaller_than-true453, %smaller_comparison_index-true449
  br label %smaller_comparison_index-after450

is_smaller_than-true453:                          ; preds = %smaller_comparison_index-true449
  %1552 = load float, ptr %1544, align 4
  %1553 = load float, ptr %1546, align 4
  %1554 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1531
  store float %1552, ptr addrspace(3) %1554, align 4
  %1555 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1532
  store float %1553, ptr addrspace(3) %1555, align 4
  %1556 = load i32, ptr %1548, align 4
  %1557 = load i32, ptr %1550, align 4
  %1558 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1531
  store i32 %1556, ptr addrspace(3) %1558, align 4
  %1559 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1532
  store i32 %1557, ptr addrspace(3) %1559, align 4
  br label %is_smaller_than-after454

smaller_comparison_index-true455:                 ; preds = %is_last_tile-false447
  %1560 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1540
  %1561 = addrspacecast ptr addrspace(3) %1560 to ptr
  %1562 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1539
  %1563 = addrspacecast ptr addrspace(3) %1562 to ptr
  %1564 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1540
  %1565 = addrspacecast ptr addrspace(3) %1564 to ptr
  %1566 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1539
  %1567 = addrspacecast ptr addrspace(3) %1566 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1561, ptr %1563, ptr %1565, ptr %1567, ptr %compare_return_buffer457)
  %1568 = load i8, ptr %compare_return_buffer457, align 1
  %boolean_predicate458 = icmp ne i8 %1568, 0
  br i1 %boolean_predicate458, label %is_smaller_than-true459, label %is_smaller_than-after460

is_smaller_than-after460:                         ; preds = %is_smaller_than-true459, %smaller_comparison_index-true455
  br label %smaller_comparison_index-after456

is_smaller_than-true459:                          ; preds = %smaller_comparison_index-true455
  %1569 = load float, ptr %1561, align 4
  %1570 = load float, ptr %1563, align 4
  %1571 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1539
  store float %1569, ptr addrspace(3) %1571, align 4
  %1572 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1540
  store float %1570, ptr addrspace(3) %1572, align 4
  %1573 = load i32, ptr %1565, align 4
  %1574 = load i32, ptr %1567, align 4
  %1575 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1539
  store i32 %1573, ptr addrspace(3) %1575, align 4
  %1576 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1540
  store i32 %1574, ptr addrspace(3) %1576, align 4
  br label %is_smaller_than-after460

is_last_tile-true461:                             ; preds = %is_last_tile-after448
  %1577 = udiv i64 %thread.id.x, 16
  %1578 = urem i64 %thread.id.x, 16
  %1579 = mul i64 %1577, 32
  %1580 = add i64 %1579, %1578
  %1581 = xor i64 %1580, 16
  %1582 = icmp slt i64 %1580, %1581
  %1583 = icmp slt i64 %1581, 165
  %1584 = and i1 %1582, %1583
  br i1 %1584, label %smaller_comparison_index-true464, label %smaller_comparison_index-after465

smaller_comparison_index-after465:                ; preds = %is_smaller_than-after469, %is_last_tile-true461
  br label %is_last_tile-after463

is_last_tile-false462:                            ; preds = %is_last_tile-after448
  %1585 = udiv i64 %thread.id.x, 16
  %1586 = urem i64 %thread.id.x, 16
  %1587 = mul i64 %1585, 32
  %1588 = add i64 %1587, %1586
  %1589 = xor i64 %1588, 16
  %1590 = icmp slt i64 %1588, %1589
  %1591 = icmp slt i64 %1589, 256
  br i1 true, label %smaller_comparison_index-true470, label %smaller_comparison_index-after471

smaller_comparison_index-after471:                ; preds = %is_smaller_than-after475, %is_last_tile-false462
  br label %is_last_tile-after463

smaller_comparison_index-true464:                 ; preds = %is_last_tile-true461
  %1592 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1581
  %1593 = addrspacecast ptr addrspace(3) %1592 to ptr
  %1594 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1580
  %1595 = addrspacecast ptr addrspace(3) %1594 to ptr
  %1596 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1581
  %1597 = addrspacecast ptr addrspace(3) %1596 to ptr
  %1598 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1580
  %1599 = addrspacecast ptr addrspace(3) %1598 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1593, ptr %1595, ptr %1597, ptr %1599, ptr %compare_return_buffer466)
  %1600 = load i8, ptr %compare_return_buffer466, align 1
  %boolean_predicate467 = icmp ne i8 %1600, 0
  br i1 %boolean_predicate467, label %is_smaller_than-true468, label %is_smaller_than-after469

is_smaller_than-after469:                         ; preds = %is_smaller_than-true468, %smaller_comparison_index-true464
  br label %smaller_comparison_index-after465

is_smaller_than-true468:                          ; preds = %smaller_comparison_index-true464
  %1601 = load float, ptr %1593, align 4
  %1602 = load float, ptr %1595, align 4
  %1603 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1580
  store float %1601, ptr addrspace(3) %1603, align 4
  %1604 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1581
  store float %1602, ptr addrspace(3) %1604, align 4
  %1605 = load i32, ptr %1597, align 4
  %1606 = load i32, ptr %1599, align 4
  %1607 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1580
  store i32 %1605, ptr addrspace(3) %1607, align 4
  %1608 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1581
  store i32 %1606, ptr addrspace(3) %1608, align 4
  br label %is_smaller_than-after469

smaller_comparison_index-true470:                 ; preds = %is_last_tile-false462
  %1609 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1589
  %1610 = addrspacecast ptr addrspace(3) %1609 to ptr
  %1611 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1588
  %1612 = addrspacecast ptr addrspace(3) %1611 to ptr
  %1613 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1589
  %1614 = addrspacecast ptr addrspace(3) %1613 to ptr
  %1615 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1588
  %1616 = addrspacecast ptr addrspace(3) %1615 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1610, ptr %1612, ptr %1614, ptr %1616, ptr %compare_return_buffer472)
  %1617 = load i8, ptr %compare_return_buffer472, align 1
  %boolean_predicate473 = icmp ne i8 %1617, 0
  br i1 %boolean_predicate473, label %is_smaller_than-true474, label %is_smaller_than-after475

is_smaller_than-after475:                         ; preds = %is_smaller_than-true474, %smaller_comparison_index-true470
  br label %smaller_comparison_index-after471

is_smaller_than-true474:                          ; preds = %smaller_comparison_index-true470
  %1618 = load float, ptr %1610, align 4
  %1619 = load float, ptr %1612, align 4
  %1620 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1588
  store float %1618, ptr addrspace(3) %1620, align 4
  %1621 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1589
  store float %1619, ptr addrspace(3) %1621, align 4
  %1622 = load i32, ptr %1614, align 4
  %1623 = load i32, ptr %1616, align 4
  %1624 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1588
  store i32 %1622, ptr addrspace(3) %1624, align 4
  %1625 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1589
  store i32 %1623, ptr addrspace(3) %1625, align 4
  br label %is_smaller_than-after475

is_last_tile-true476:                             ; preds = %is_last_tile-after463
  %1626 = udiv i64 %thread.id.x, 8
  %1627 = urem i64 %thread.id.x, 8
  %1628 = mul i64 %1626, 16
  %1629 = add i64 %1628, %1627
  %1630 = xor i64 %1629, 8
  %1631 = icmp slt i64 %1629, %1630
  %1632 = icmp slt i64 %1630, 165
  %1633 = and i1 %1631, %1632
  br i1 %1633, label %smaller_comparison_index-true479, label %smaller_comparison_index-after480

smaller_comparison_index-after480:                ; preds = %is_smaller_than-after484, %is_last_tile-true476
  br label %is_last_tile-after478

is_last_tile-false477:                            ; preds = %is_last_tile-after463
  %1634 = udiv i64 %thread.id.x, 8
  %1635 = urem i64 %thread.id.x, 8
  %1636 = mul i64 %1634, 16
  %1637 = add i64 %1636, %1635
  %1638 = xor i64 %1637, 8
  %1639 = icmp slt i64 %1637, %1638
  %1640 = icmp slt i64 %1638, 256
  br i1 true, label %smaller_comparison_index-true485, label %smaller_comparison_index-after486

smaller_comparison_index-after486:                ; preds = %is_smaller_than-after490, %is_last_tile-false477
  br label %is_last_tile-after478

smaller_comparison_index-true479:                 ; preds = %is_last_tile-true476
  %1641 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1630
  %1642 = addrspacecast ptr addrspace(3) %1641 to ptr
  %1643 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1629
  %1644 = addrspacecast ptr addrspace(3) %1643 to ptr
  %1645 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1630
  %1646 = addrspacecast ptr addrspace(3) %1645 to ptr
  %1647 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1629
  %1648 = addrspacecast ptr addrspace(3) %1647 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1642, ptr %1644, ptr %1646, ptr %1648, ptr %compare_return_buffer481)
  %1649 = load i8, ptr %compare_return_buffer481, align 1
  %boolean_predicate482 = icmp ne i8 %1649, 0
  br i1 %boolean_predicate482, label %is_smaller_than-true483, label %is_smaller_than-after484

is_smaller_than-after484:                         ; preds = %is_smaller_than-true483, %smaller_comparison_index-true479
  br label %smaller_comparison_index-after480

is_smaller_than-true483:                          ; preds = %smaller_comparison_index-true479
  %1650 = load float, ptr %1642, align 4
  %1651 = load float, ptr %1644, align 4
  %1652 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1629
  store float %1650, ptr addrspace(3) %1652, align 4
  %1653 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1630
  store float %1651, ptr addrspace(3) %1653, align 4
  %1654 = load i32, ptr %1646, align 4
  %1655 = load i32, ptr %1648, align 4
  %1656 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1629
  store i32 %1654, ptr addrspace(3) %1656, align 4
  %1657 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1630
  store i32 %1655, ptr addrspace(3) %1657, align 4
  br label %is_smaller_than-after484

smaller_comparison_index-true485:                 ; preds = %is_last_tile-false477
  %1658 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1638
  %1659 = addrspacecast ptr addrspace(3) %1658 to ptr
  %1660 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1637
  %1661 = addrspacecast ptr addrspace(3) %1660 to ptr
  %1662 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1638
  %1663 = addrspacecast ptr addrspace(3) %1662 to ptr
  %1664 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1637
  %1665 = addrspacecast ptr addrspace(3) %1664 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1659, ptr %1661, ptr %1663, ptr %1665, ptr %compare_return_buffer487)
  %1666 = load i8, ptr %compare_return_buffer487, align 1
  %boolean_predicate488 = icmp ne i8 %1666, 0
  br i1 %boolean_predicate488, label %is_smaller_than-true489, label %is_smaller_than-after490

is_smaller_than-after490:                         ; preds = %is_smaller_than-true489, %smaller_comparison_index-true485
  br label %smaller_comparison_index-after486

is_smaller_than-true489:                          ; preds = %smaller_comparison_index-true485
  %1667 = load float, ptr %1659, align 4
  %1668 = load float, ptr %1661, align 4
  %1669 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1637
  store float %1667, ptr addrspace(3) %1669, align 4
  %1670 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1638
  store float %1668, ptr addrspace(3) %1670, align 4
  %1671 = load i32, ptr %1663, align 4
  %1672 = load i32, ptr %1665, align 4
  %1673 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1637
  store i32 %1671, ptr addrspace(3) %1673, align 4
  %1674 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1638
  store i32 %1672, ptr addrspace(3) %1674, align 4
  br label %is_smaller_than-after490

is_last_tile-true491:                             ; preds = %is_last_tile-after478
  %1675 = udiv i64 %thread.id.x, 4
  %1676 = urem i64 %thread.id.x, 4
  %1677 = mul i64 %1675, 8
  %1678 = add i64 %1677, %1676
  %1679 = xor i64 %1678, 4
  %1680 = icmp slt i64 %1678, %1679
  %1681 = icmp slt i64 %1679, 165
  %1682 = and i1 %1680, %1681
  br i1 %1682, label %smaller_comparison_index-true494, label %smaller_comparison_index-after495

smaller_comparison_index-after495:                ; preds = %is_smaller_than-after499, %is_last_tile-true491
  br label %is_last_tile-after493

is_last_tile-false492:                            ; preds = %is_last_tile-after478
  %1683 = udiv i64 %thread.id.x, 4
  %1684 = urem i64 %thread.id.x, 4
  %1685 = mul i64 %1683, 8
  %1686 = add i64 %1685, %1684
  %1687 = xor i64 %1686, 4
  %1688 = icmp slt i64 %1686, %1687
  %1689 = icmp slt i64 %1687, 256
  br i1 true, label %smaller_comparison_index-true500, label %smaller_comparison_index-after501

smaller_comparison_index-after501:                ; preds = %is_smaller_than-after505, %is_last_tile-false492
  br label %is_last_tile-after493

smaller_comparison_index-true494:                 ; preds = %is_last_tile-true491
  %1690 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1679
  %1691 = addrspacecast ptr addrspace(3) %1690 to ptr
  %1692 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1678
  %1693 = addrspacecast ptr addrspace(3) %1692 to ptr
  %1694 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1679
  %1695 = addrspacecast ptr addrspace(3) %1694 to ptr
  %1696 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1678
  %1697 = addrspacecast ptr addrspace(3) %1696 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1691, ptr %1693, ptr %1695, ptr %1697, ptr %compare_return_buffer496)
  %1698 = load i8, ptr %compare_return_buffer496, align 1
  %boolean_predicate497 = icmp ne i8 %1698, 0
  br i1 %boolean_predicate497, label %is_smaller_than-true498, label %is_smaller_than-after499

is_smaller_than-after499:                         ; preds = %is_smaller_than-true498, %smaller_comparison_index-true494
  br label %smaller_comparison_index-after495

is_smaller_than-true498:                          ; preds = %smaller_comparison_index-true494
  %1699 = load float, ptr %1691, align 4
  %1700 = load float, ptr %1693, align 4
  %1701 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1678
  store float %1699, ptr addrspace(3) %1701, align 4
  %1702 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1679
  store float %1700, ptr addrspace(3) %1702, align 4
  %1703 = load i32, ptr %1695, align 4
  %1704 = load i32, ptr %1697, align 4
  %1705 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1678
  store i32 %1703, ptr addrspace(3) %1705, align 4
  %1706 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1679
  store i32 %1704, ptr addrspace(3) %1706, align 4
  br label %is_smaller_than-after499

smaller_comparison_index-true500:                 ; preds = %is_last_tile-false492
  %1707 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1687
  %1708 = addrspacecast ptr addrspace(3) %1707 to ptr
  %1709 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1686
  %1710 = addrspacecast ptr addrspace(3) %1709 to ptr
  %1711 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1687
  %1712 = addrspacecast ptr addrspace(3) %1711 to ptr
  %1713 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1686
  %1714 = addrspacecast ptr addrspace(3) %1713 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1708, ptr %1710, ptr %1712, ptr %1714, ptr %compare_return_buffer502)
  %1715 = load i8, ptr %compare_return_buffer502, align 1
  %boolean_predicate503 = icmp ne i8 %1715, 0
  br i1 %boolean_predicate503, label %is_smaller_than-true504, label %is_smaller_than-after505

is_smaller_than-after505:                         ; preds = %is_smaller_than-true504, %smaller_comparison_index-true500
  br label %smaller_comparison_index-after501

is_smaller_than-true504:                          ; preds = %smaller_comparison_index-true500
  %1716 = load float, ptr %1708, align 4
  %1717 = load float, ptr %1710, align 4
  %1718 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1686
  store float %1716, ptr addrspace(3) %1718, align 4
  %1719 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1687
  store float %1717, ptr addrspace(3) %1719, align 4
  %1720 = load i32, ptr %1712, align 4
  %1721 = load i32, ptr %1714, align 4
  %1722 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1686
  store i32 %1720, ptr addrspace(3) %1722, align 4
  %1723 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1687
  store i32 %1721, ptr addrspace(3) %1723, align 4
  br label %is_smaller_than-after505

is_last_tile-true506:                             ; preds = %is_last_tile-after493
  %1724 = udiv i64 %thread.id.x, 2
  %1725 = urem i64 %thread.id.x, 2
  %1726 = mul i64 %1724, 4
  %1727 = add i64 %1726, %1725
  %1728 = xor i64 %1727, 2
  %1729 = icmp slt i64 %1727, %1728
  %1730 = icmp slt i64 %1728, 165
  %1731 = and i1 %1729, %1730
  br i1 %1731, label %smaller_comparison_index-true509, label %smaller_comparison_index-after510

smaller_comparison_index-after510:                ; preds = %is_smaller_than-after514, %is_last_tile-true506
  br label %is_last_tile-after508

is_last_tile-false507:                            ; preds = %is_last_tile-after493
  %1732 = udiv i64 %thread.id.x, 2
  %1733 = urem i64 %thread.id.x, 2
  %1734 = mul i64 %1732, 4
  %1735 = add i64 %1734, %1733
  %1736 = xor i64 %1735, 2
  %1737 = icmp slt i64 %1735, %1736
  %1738 = icmp slt i64 %1736, 256
  br i1 true, label %smaller_comparison_index-true515, label %smaller_comparison_index-after516

smaller_comparison_index-after516:                ; preds = %is_smaller_than-after520, %is_last_tile-false507
  br label %is_last_tile-after508

smaller_comparison_index-true509:                 ; preds = %is_last_tile-true506
  %1739 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1728
  %1740 = addrspacecast ptr addrspace(3) %1739 to ptr
  %1741 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1727
  %1742 = addrspacecast ptr addrspace(3) %1741 to ptr
  %1743 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1728
  %1744 = addrspacecast ptr addrspace(3) %1743 to ptr
  %1745 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1727
  %1746 = addrspacecast ptr addrspace(3) %1745 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1740, ptr %1742, ptr %1744, ptr %1746, ptr %compare_return_buffer511)
  %1747 = load i8, ptr %compare_return_buffer511, align 1
  %boolean_predicate512 = icmp ne i8 %1747, 0
  br i1 %boolean_predicate512, label %is_smaller_than-true513, label %is_smaller_than-after514

is_smaller_than-after514:                         ; preds = %is_smaller_than-true513, %smaller_comparison_index-true509
  br label %smaller_comparison_index-after510

is_smaller_than-true513:                          ; preds = %smaller_comparison_index-true509
  %1748 = load float, ptr %1740, align 4
  %1749 = load float, ptr %1742, align 4
  %1750 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1727
  store float %1748, ptr addrspace(3) %1750, align 4
  %1751 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1728
  store float %1749, ptr addrspace(3) %1751, align 4
  %1752 = load i32, ptr %1744, align 4
  %1753 = load i32, ptr %1746, align 4
  %1754 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1727
  store i32 %1752, ptr addrspace(3) %1754, align 4
  %1755 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1728
  store i32 %1753, ptr addrspace(3) %1755, align 4
  br label %is_smaller_than-after514

smaller_comparison_index-true515:                 ; preds = %is_last_tile-false507
  %1756 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1736
  %1757 = addrspacecast ptr addrspace(3) %1756 to ptr
  %1758 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1735
  %1759 = addrspacecast ptr addrspace(3) %1758 to ptr
  %1760 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1736
  %1761 = addrspacecast ptr addrspace(3) %1760 to ptr
  %1762 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1735
  %1763 = addrspacecast ptr addrspace(3) %1762 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1757, ptr %1759, ptr %1761, ptr %1763, ptr %compare_return_buffer517)
  %1764 = load i8, ptr %compare_return_buffer517, align 1
  %boolean_predicate518 = icmp ne i8 %1764, 0
  br i1 %boolean_predicate518, label %is_smaller_than-true519, label %is_smaller_than-after520

is_smaller_than-after520:                         ; preds = %is_smaller_than-true519, %smaller_comparison_index-true515
  br label %smaller_comparison_index-after516

is_smaller_than-true519:                          ; preds = %smaller_comparison_index-true515
  %1765 = load float, ptr %1757, align 4
  %1766 = load float, ptr %1759, align 4
  %1767 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1735
  store float %1765, ptr addrspace(3) %1767, align 4
  %1768 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1736
  store float %1766, ptr addrspace(3) %1768, align 4
  %1769 = load i32, ptr %1761, align 4
  %1770 = load i32, ptr %1763, align 4
  %1771 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1735
  store i32 %1769, ptr addrspace(3) %1771, align 4
  %1772 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1736
  store i32 %1770, ptr addrspace(3) %1772, align 4
  br label %is_smaller_than-after520

is_last_tile-true521:                             ; preds = %is_last_tile-after508
  %1773 = mul i64 %thread.id.x, 2
  %1774 = xor i64 %1773, 1
  %1775 = icmp slt i64 %1773, %1774
  %1776 = icmp slt i64 %1774, 165
  %1777 = and i1 %1775, %1776
  br i1 %1777, label %smaller_comparison_index-true524, label %smaller_comparison_index-after525

smaller_comparison_index-after525:                ; preds = %is_smaller_than-after529, %is_last_tile-true521
  br label %is_last_tile-after523

is_last_tile-false522:                            ; preds = %is_last_tile-after508
  %1778 = mul i64 %thread.id.x, 2
  %1779 = xor i64 %1778, 1
  %1780 = icmp slt i64 %1778, %1779
  %1781 = icmp slt i64 %1779, 256
  br i1 true, label %smaller_comparison_index-true530, label %smaller_comparison_index-after531

smaller_comparison_index-after531:                ; preds = %is_smaller_than-after535, %is_last_tile-false522
  br label %is_last_tile-after523

smaller_comparison_index-true524:                 ; preds = %is_last_tile-true521
  %1782 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1774
  %1783 = addrspacecast ptr addrspace(3) %1782 to ptr
  %1784 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1773
  %1785 = addrspacecast ptr addrspace(3) %1784 to ptr
  %1786 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1774
  %1787 = addrspacecast ptr addrspace(3) %1786 to ptr
  %1788 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1773
  %1789 = addrspacecast ptr addrspace(3) %1788 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1783, ptr %1785, ptr %1787, ptr %1789, ptr %compare_return_buffer526)
  %1790 = load i8, ptr %compare_return_buffer526, align 1
  %boolean_predicate527 = icmp ne i8 %1790, 0
  br i1 %boolean_predicate527, label %is_smaller_than-true528, label %is_smaller_than-after529

is_smaller_than-after529:                         ; preds = %is_smaller_than-true528, %smaller_comparison_index-true524
  br label %smaller_comparison_index-after525

is_smaller_than-true528:                          ; preds = %smaller_comparison_index-true524
  %1791 = load float, ptr %1783, align 4
  %1792 = load float, ptr %1785, align 4
  %1793 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1773
  store float %1791, ptr addrspace(3) %1793, align 4
  %1794 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1774
  store float %1792, ptr addrspace(3) %1794, align 4
  %1795 = load i32, ptr %1787, align 4
  %1796 = load i32, ptr %1789, align 4
  %1797 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1773
  store i32 %1795, ptr addrspace(3) %1797, align 4
  %1798 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1774
  store i32 %1796, ptr addrspace(3) %1798, align 4
  br label %is_smaller_than-after529

smaller_comparison_index-true530:                 ; preds = %is_last_tile-false522
  %1799 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1779
  %1800 = addrspacecast ptr addrspace(3) %1799 to ptr
  %1801 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1778
  %1802 = addrspacecast ptr addrspace(3) %1801 to ptr
  %1803 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1779
  %1804 = addrspacecast ptr addrspace(3) %1803 to ptr
  %1805 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1778
  %1806 = addrspacecast ptr addrspace(3) %1805 to ptr
  call void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr %1800, ptr %1802, ptr %1804, ptr %1806, ptr %compare_return_buffer532)
  %1807 = load i8, ptr %compare_return_buffer532, align 1
  %boolean_predicate533 = icmp ne i8 %1807, 0
  br i1 %boolean_predicate533, label %is_smaller_than-true534, label %is_smaller_than-after535

is_smaller_than-after535:                         ; preds = %is_smaller_than-true534, %smaller_comparison_index-true530
  br label %smaller_comparison_index-after531

is_smaller_than-true534:                          ; preds = %smaller_comparison_index-true530
  %1808 = load float, ptr %1800, align 4
  %1809 = load float, ptr %1802, align 4
  %1810 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1778
  store float %1808, ptr addrspace(3) %1810, align 4
  %1811 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1779
  store float %1809, ptr addrspace(3) %1811, align 4
  %1812 = load i32, ptr %1804, align 4
  %1813 = load i32, ptr %1806, align 4
  %1814 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1778
  store i32 %1812, ptr addrspace(3) %1814, align 4
  %1815 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1779
  store i32 %1813, ptr addrspace(3) %1815, align 4
  br label %is_smaller_than-after535

smaller_keys_index-true536:                       ; preds = %is_last_tile-after523
  %1816 = shl i64 %thread.id.x, 1
  %1817 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1816
  %1818 = load float, ptr addrspace(3) %1817, align 4
  %1819 = getelementptr inbounds [1536 x [165 x float]], ptr %arg0, i64 0, i64 %5, i64 %84
  store float %1818, ptr %1819, align 4
  %1820 = add i64 %84, 1
  %1821 = icmp slt i64 %1820, 165
  br i1 %1821, label %inner_smaller_keys_index-true538, label %inner_smaller_keys_index-after539

inner_smaller_keys_index-after539:                ; preds = %inner_smaller_keys_index-true538, %smaller_keys_index-true536
  br label %smaller_keys_index-after537

inner_smaller_keys_index-true538:                 ; preds = %smaller_keys_index-true536
  %1822 = add i64 %1816, 1
  %1823 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %1822
  %1824 = load float, ptr addrspace(3) %1823, align 4
  %1825 = getelementptr inbounds [1536 x [165 x float]], ptr %arg0, i64 0, i64 %5, i64 %1820
  store float %1824, ptr %1825, align 4
  br label %inner_smaller_keys_index-after539

smaller_keys_index-true540:                       ; preds = %smaller_keys_index-after537
  %1826 = shl i64 %thread.id.x, 1
  %1827 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1826
  %1828 = load i32, ptr addrspace(3) %1827, align 4
  %1829 = getelementptr inbounds [1536 x [165 x i32]], ptr %arg1, i64 0, i64 %5, i64 %86
  store i32 %1828, ptr %1829, align 4
  %1830 = add i64 %86, 1
  %1831 = icmp slt i64 %1830, 165
  br i1 %1831, label %inner_smaller_keys_index-true542, label %inner_smaller_keys_index-after543

inner_smaller_keys_index-after543:                ; preds = %inner_smaller_keys_index-true542, %smaller_keys_index-true540
  br label %smaller_keys_index-after541

inner_smaller_keys_index-true542:                 ; preds = %smaller_keys_index-true540
  %1832 = add i64 %1826, 1
  %1833 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1832
  %1834 = load i32, ptr addrspace(3) %1833, align 4
  %1835 = getelementptr inbounds [1536 x [165 x i32]], ptr %arg1, i64 0, i64 %5, i64 %1830
  store i32 %1834, ptr %1835, align 4
  br label %inner_smaller_keys_index-after543
}

define internal void @region_1_1754_clone_64dc1a7bd4b0_752844b529617a84(ptr dereferenceable(4) %0, ptr dereferenceable(4) %1, ptr dereferenceable(4) %2, ptr dereferenceable(4) %3, ptr dereferenceable(1) %output_arg) {
entry:
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca float, align 4
  %17 = alloca i8, align 1
  %18 = alloca float, align 4
  %19 = alloca i8, align 1
  %20 = alloca float, align 4
  %21 = alloca i8, align 1
  %22 = alloca float, align 4
  %23 = alloca i8, align 1
  %24 = alloca i8, align 1
  %Arg_0.99 = load float, ptr %0, align 4
  %Arg_0.991 = load float, ptr %0, align 4
  %compare.132.0 = fcmp une float %Arg_0.99, %Arg_0.991
  %25 = zext i1 %compare.132.0 to i8
  store i8 %25, ptr %21, align 1
  %Arg_0.992 = load float, ptr %0, align 4
  %constant_1102_0 = load float, ptr @buffer_for_constant_1102_0, align 4
  %compare.131.0 = fcmp oeq float %Arg_0.992, %constant_1102_0
  %26 = zext i1 %compare.131.0 to i8
  store i8 %26, ptr %23, align 1
  %compare.131.03 = load i8, ptr %23, align 1
  %constant_1102_04 = load float, ptr @buffer_for_constant_1102_0, align 4
  %Arg_0.995 = load float, ptr %0, align 4
  %27 = trunc i8 %compare.131.03 to i1
  %28 = select i1 %27, float %constant_1102_04, float %Arg_0.995
  store float %28, ptr %22, align 4
  %compare.132.06 = load i8, ptr %21, align 1
  %constant_1101_0 = load float, ptr @buffer_for_constant_1101_0, align 4
  %select.181.0 = load float, ptr %22, align 4
  %29 = trunc i8 %compare.132.06 to i1
  %30 = select i1 %29, float %constant_1101_0, float %select.181.0
  store float %30, ptr %20, align 4
  %select.182.0 = load float, ptr %20, align 4
  %31 = bitcast float %select.182.0 to i32
  store i32 %31, ptr %15, align 4
  %bitcast-convert.4.0 = load i32, ptr %15, align 4
  %constant_1103_0 = load i32, ptr @buffer_for_constant_1103_0, align 4
  %32 = icmp slt i32 %bitcast-convert.4.0, %constant_1103_0
  %33 = zext i1 %32 to i8
  store i8 %33, ptr %13, align 1
  %constant_1105_0 = load i32, ptr @buffer_for_constant_1105_0, align 4
  %bitcast-convert.4.07 = load i32, ptr %15, align 4
  %34 = xor i32 %constant_1105_0, %bitcast-convert.4.07
  store i32 %34, ptr %14, align 4
  %compare.135.0 = load i8, ptr %13, align 1
  %xor.1208.0 = load i32, ptr %14, align 4
  %bitcast-convert.4.08 = load i32, ptr %15, align 4
  %35 = trunc i8 %compare.135.0 to i1
  %36 = select i1 %35, i32 %xor.1208.0, i32 %bitcast-convert.4.08
  store i32 %36, ptr %12, align 4
  %Arg_1.93 = load float, ptr %1, align 4
  %Arg_1.939 = load float, ptr %1, align 4
  %compare.134.0 = fcmp une float %Arg_1.93, %Arg_1.939
  %37 = zext i1 %compare.134.0 to i8
  store i8 %37, ptr %17, align 1
  %Arg_1.9310 = load float, ptr %1, align 4
  %constant_1102_011 = load float, ptr @buffer_for_constant_1102_0, align 4
  %compare.133.0 = fcmp oeq float %Arg_1.9310, %constant_1102_011
  %38 = zext i1 %compare.133.0 to i8
  store i8 %38, ptr %19, align 1
  %compare.133.012 = load i8, ptr %19, align 1
  %constant_1102_013 = load float, ptr @buffer_for_constant_1102_0, align 4
  %Arg_1.9314 = load float, ptr %1, align 4
  %39 = trunc i8 %compare.133.012 to i1
  %40 = select i1 %39, float %constant_1102_013, float %Arg_1.9314
  store float %40, ptr %18, align 4
  %compare.134.015 = load i8, ptr %17, align 1
  %constant_1101_016 = load float, ptr @buffer_for_constant_1101_0, align 4
  %select.183.0 = load float, ptr %18, align 4
  %41 = trunc i8 %compare.134.015 to i1
  %42 = select i1 %41, float %constant_1101_016, float %select.183.0
  store float %42, ptr %16, align 4
  %select.184.0 = load float, ptr %16, align 4
  %43 = bitcast float %select.184.0 to i32
  store i32 %43, ptr %11, align 4
  %bitcast-convert.5.0 = load i32, ptr %11, align 4
  %constant_1103_017 = load i32, ptr @buffer_for_constant_1103_0, align 4
  %44 = icmp slt i32 %bitcast-convert.5.0, %constant_1103_017
  %45 = zext i1 %44 to i8
  store i8 %45, ptr %9, align 1
  %constant_1105_018 = load i32, ptr @buffer_for_constant_1105_0, align 4
  %bitcast-convert.5.019 = load i32, ptr %11, align 4
  %46 = xor i32 %constant_1105_018, %bitcast-convert.5.019
  store i32 %46, ptr %10, align 4
  %compare.136.0 = load i8, ptr %9, align 1
  %xor.1209.0 = load i32, ptr %10, align 4
  %bitcast-convert.5.020 = load i32, ptr %11, align 4
  %47 = trunc i8 %compare.136.0 to i1
  %48 = select i1 %47, i32 %xor.1209.0, i32 %bitcast-convert.5.020
  store i32 %48, ptr %8, align 4
  %select.185.0 = load i32, ptr %12, align 4
  %select.186.0 = load i32, ptr %8, align 4
  %49 = icmp slt i32 %select.185.0, %select.186.0
  %50 = zext i1 %49 to i8
  store i8 %50, ptr %7, align 1
  %select.186.021 = load i32, ptr %8, align 4
  %select.185.022 = load i32, ptr %12, align 4
  %51 = icmp slt i32 %select.186.021, %select.185.022
  %52 = zext i1 %51 to i8
  store i8 %52, ptr %6, align 1
  %compare.137.0 = load i8, ptr %7, align 1
  %compare.144.0 = load i8, ptr %6, align 1
  %53 = icmp eq i8 %compare.137.0, %compare.144.0
  %54 = zext i1 %53 to i8
  store i8 %54, ptr %5, align 1
  %p.1.lhs.clone = load i32, ptr %2, align 4
  %p.1.rhs.clone = load i32, ptr %3, align 4
  %55 = icmp slt i32 %p.1.lhs.clone, %p.1.rhs.clone
  %56 = zext i1 %55 to i8
  store i8 %56, ptr %4, align 1
  %compare.145.0 = load i8, ptr %5, align 1
  %compare.146.0 = load i8, ptr %4, align 1
  %compare.137.023 = load i8, ptr %7, align 1
  %57 = trunc i8 %compare.145.0 to i1
  %58 = select i1 %57, i8 %compare.146.0, i8 %compare.137.023
  store i8 %58, ptr %24, align 1
  %load_ret_value = load i8, ptr %24, align 1
  store i8 %load_ret_value, ptr %output_arg, align 1
  ret void
}

define ptx_kernel void @loop_broadcast_compare_gather_select_fusion(ptr noalias align 256 dereferenceable(6144) %0, ptr noalias align 256 dereferenceable(86016) %1, ptr noalias align 256 dereferenceable(1013760) %2, ptr noalias align 256 dereferenceable(12288) %3, ptr noalias align 256 dereferenceable(12288) %4, ptr noalias align 256 dereferenceable(1536) %5, ptr noalias align 256 dereferenceable(6144) %6, ptr noalias align 256 dereferenceable(1536) %7, ptr noalias align 256 dereferenceable(6144) %8, ptr noalias align 256 dereferenceable(6144) %9, ptr noalias align 256 dereferenceable(6144) %10) #0 {
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %14 = mul i32 %12, 128
  %15 = add i32 %14, %13
  %16 = mul i32 %13, 14
  %17 = mul i32 %12, 1792
  %18 = add i32 %16, %17
  %19 = getelementptr inbounds i32, ptr %1, i32 %18
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = add i32 %18, 1
  %22 = getelementptr inbounds i32, ptr %1, i32 %21
  %23 = load i32, ptr %22, align 4, !invariant.load !3
  %24 = call i32 @llvm.smax.i32(i32 %20, i32 %23)
  %25 = add i32 %18, 2
  %26 = getelementptr inbounds i32, ptr %1, i32 %25
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  %28 = call i32 @llvm.smax.i32(i32 %24, i32 %27)
  %29 = add i32 %18, 3
  %30 = getelementptr inbounds i32, ptr %1, i32 %29
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = call i32 @llvm.smax.i32(i32 %28, i32 %31)
  %33 = add i32 %18, 4
  %34 = getelementptr inbounds i32, ptr %1, i32 %33
  %35 = load i32, ptr %34, align 4, !invariant.load !3
  %36 = call i32 @llvm.smax.i32(i32 %32, i32 %35)
  %37 = add i32 %18, 5
  %38 = getelementptr inbounds i32, ptr %1, i32 %37
  %39 = load i32, ptr %38, align 4, !invariant.load !3
  %40 = call i32 @llvm.smax.i32(i32 %36, i32 %39)
  %41 = add i32 %18, 6
  %42 = getelementptr inbounds i32, ptr %1, i32 %41
  %43 = load i32, ptr %42, align 4, !invariant.load !3
  %44 = call i32 @llvm.smax.i32(i32 %40, i32 %43)
  %45 = add i32 %18, 7
  %46 = getelementptr inbounds i32, ptr %1, i32 %45
  %47 = load i32, ptr %46, align 4, !invariant.load !3
  %48 = call i32 @llvm.smax.i32(i32 %44, i32 %47)
  %49 = add i32 %18, 8
  %50 = getelementptr inbounds i32, ptr %1, i32 %49
  %51 = load i32, ptr %50, align 4, !invariant.load !3
  %52 = call i32 @llvm.smax.i32(i32 %48, i32 %51)
  %53 = add i32 %18, 9
  %54 = getelementptr inbounds i32, ptr %1, i32 %53
  %55 = load i32, ptr %54, align 4, !invariant.load !3
  %56 = call i32 @llvm.smax.i32(i32 %52, i32 %55)
  %57 = add i32 %18, 10
  %58 = getelementptr inbounds i32, ptr %1, i32 %57
  %59 = load i32, ptr %58, align 4, !invariant.load !3
  %60 = call i32 @llvm.smax.i32(i32 %56, i32 %59)
  %61 = add i32 %18, 11
  %62 = getelementptr inbounds i32, ptr %1, i32 %61
  %63 = load i32, ptr %62, align 4, !invariant.load !3
  %64 = call i32 @llvm.smax.i32(i32 %60, i32 %63)
  %65 = add i32 %18, 12
  %66 = getelementptr inbounds i32, ptr %1, i32 %65
  %67 = load i32, ptr %66, align 4, !invariant.load !3
  %68 = call i32 @llvm.smax.i32(i32 %64, i32 %67)
  %69 = add i32 %18, 13
  %70 = getelementptr inbounds i32, ptr %1, i32 %69
  %71 = load i32, ptr %70, align 4, !invariant.load !3
  %72 = call i32 @llvm.smax.i32(i32 %68, i32 %71)
  %73 = icmp sgt i32 %72, -10000
  %74 = getelementptr inbounds i32, ptr %0, i32 %15
  %75 = load i32, ptr %74, align 4, !invariant.load !3
  %76 = select i1 %73, i32 %75, i32 -1
  %77 = icmp slt i32 %76, 0
  %78 = zext i1 %77 to i32
  %79 = icmp slt i32 %78, 1
  %80 = zext i1 %79 to i8
  %81 = call i32 @llvm.smax.i32(i32 %76, i32 0)
  %82 = call i32 @llvm.smin.i32(i32 %81, i32 13)
  %83 = icmp slt i32 %82, 0
  %84 = add i32 %82, 14
  %85 = select i1 %83, i32 %84, i32 %82
  %86 = call i32 @llvm.smin.i32(i32 %85, i32 13)
  %87 = call i32 @llvm.smax.i32(i32 %86, i32 0)
  %88 = icmp sge i32 %87, 7
  %89 = zext i1 %88 to i32
  %90 = icmp eq i32 %89, 0
  %91 = zext i1 %90 to i8
  %92 = call i32 @llvm.smin.i32(i32 %15, i32 1535)
  %93 = call i32 @llvm.smax.i32(i32 %92, i32 0)
  %94 = call i32 @fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 0, i32 %15)
  %95 = call i32 @fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 1, i32 %15)
  %96 = add i32 %94, %95
  %97 = shl i32 %95, 13
  %98 = lshr i32 %95, 19
  %99 = or i32 %97, %98
  %100 = xor i32 %96, %99
  %101 = add i32 %96, %100
  %102 = shl i32 %100, 15
  %103 = lshr i32 %100, 17
  %104 = or i32 %102, %103
  %105 = xor i32 %101, %104
  %106 = add i32 %101, %105
  %107 = shl i32 %105, 26
  %108 = lshr i32 %105, 6
  %109 = or i32 %107, %108
  %110 = xor i32 %106, %109
  %111 = add i32 %106, %110
  %112 = add i32 %111, %95
  %113 = shl i32 %110, 6
  %114 = lshr i32 %110, 26
  %115 = or i32 %113, %114
  %116 = xor i32 %111, %115
  %117 = xor i32 %94, %95
  %118 = xor i32 %117, 466688986
  %119 = add i32 %116, %118
  %120 = add i32 %119, 1
  %121 = add i32 %112, %120
  %122 = shl i32 %120, 17
  %123 = lshr i32 %120, 15
  %124 = or i32 %122, %123
  %125 = xor i32 %121, %124
  %126 = add i32 %121, %125
  %127 = shl i32 %125, 29
  %128 = lshr i32 %125, 3
  %129 = or i32 %127, %128
  %130 = xor i32 %126, %129
  %131 = add i32 %126, %130
  %132 = shl i32 %130, 16
  %133 = lshr i32 %130, 16
  %134 = or i32 %132, %133
  %135 = xor i32 %131, %134
  %136 = add i32 %131, %135
  %137 = add i32 %136, %118
  %138 = shl i32 %135, 24
  %139 = lshr i32 %135, 8
  %140 = or i32 %138, %139
  %141 = xor i32 %136, %140
  %142 = add i32 %141, %94
  %143 = add i32 %142, 2
  %144 = add i32 %137, %143
  %145 = shl i32 %143, 13
  %146 = lshr i32 %143, 19
  %147 = or i32 %145, %146
  %148 = xor i32 %144, %147
  %149 = add i32 %144, %148
  %150 = shl i32 %148, 15
  %151 = lshr i32 %148, 17
  %152 = or i32 %150, %151
  %153 = xor i32 %149, %152
  %154 = add i32 %149, %153
  %155 = shl i32 %153, 26
  %156 = lshr i32 %153, 6
  %157 = or i32 %155, %156
  %158 = xor i32 %154, %157
  %159 = add i32 %154, %158
  %160 = add i32 %159, %94
  %161 = shl i32 %158, 6
  %162 = lshr i32 %158, 26
  %163 = or i32 %161, %162
  %164 = xor i32 %159, %163
  %165 = add i32 %164, %95
  %166 = add i32 %165, 3
  %167 = add i32 %160, %166
  %168 = shl i32 %166, 17
  %169 = lshr i32 %166, 15
  %170 = or i32 %168, %169
  %171 = xor i32 %167, %170
  %172 = add i32 %167, %171
  %173 = shl i32 %171, 29
  %174 = lshr i32 %171, 3
  %175 = or i32 %173, %174
  %176 = xor i32 %172, %175
  %177 = add i32 %172, %176
  %178 = shl i32 %176, 16
  %179 = lshr i32 %176, 16
  %180 = or i32 %178, %179
  %181 = xor i32 %177, %180
  %182 = add i32 %177, %181
  %183 = add i32 %182, %95
  %184 = shl i32 %181, 24
  %185 = lshr i32 %181, 8
  %186 = or i32 %184, %185
  %187 = xor i32 %182, %186
  %188 = add i32 %187, %118
  %189 = add i32 %188, 4
  %190 = add i32 %183, %189
  %191 = shl i32 %189, 13
  %192 = lshr i32 %189, 19
  %193 = or i32 %191, %192
  %194 = xor i32 %190, %193
  %195 = add i32 %190, %194
  %196 = shl i32 %194, 15
  %197 = lshr i32 %194, 17
  %198 = or i32 %196, %197
  %199 = xor i32 %195, %198
  %200 = add i32 %195, %199
  %201 = shl i32 %199, 26
  %202 = lshr i32 %199, 6
  %203 = or i32 %201, %202
  %204 = xor i32 %200, %203
  %205 = add i32 %200, %204
  %206 = add i32 %205, %118
  %207 = shl i32 %204, 6
  %208 = lshr i32 %204, 26
  %209 = or i32 %207, %208
  %210 = xor i32 %205, %209
  %211 = add i32 %210, %94
  %212 = add i32 %211, 5
  %213 = xor i32 %206, %212
  %214 = urem i32 %213, 9
  %215 = mul i32 %214, 4
  %216 = call i32 @fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 0, i32 %15)
  %217 = call i32 @fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 1, i32 %15)
  %218 = add i32 %216, %217
  %219 = shl i32 %217, 13
  %220 = lshr i32 %217, 19
  %221 = or i32 %219, %220
  %222 = xor i32 %218, %221
  %223 = add i32 %218, %222
  %224 = shl i32 %222, 15
  %225 = lshr i32 %222, 17
  %226 = or i32 %224, %225
  %227 = xor i32 %223, %226
  %228 = add i32 %223, %227
  %229 = shl i32 %227, 26
  %230 = lshr i32 %227, 6
  %231 = or i32 %229, %230
  %232 = xor i32 %228, %231
  %233 = add i32 %228, %232
  %234 = add i32 %233, %217
  %235 = shl i32 %232, 6
  %236 = lshr i32 %232, 26
  %237 = or i32 %235, %236
  %238 = xor i32 %233, %237
  %239 = xor i32 %216, %217
  %240 = xor i32 %239, 466688986
  %241 = add i32 %238, %240
  %242 = add i32 %241, 1
  %243 = add i32 %234, %242
  %244 = shl i32 %242, 17
  %245 = lshr i32 %242, 15
  %246 = or i32 %244, %245
  %247 = xor i32 %243, %246
  %248 = add i32 %243, %247
  %249 = shl i32 %247, 29
  %250 = lshr i32 %247, 3
  %251 = or i32 %249, %250
  %252 = xor i32 %248, %251
  %253 = add i32 %248, %252
  %254 = shl i32 %252, 16
  %255 = lshr i32 %252, 16
  %256 = or i32 %254, %255
  %257 = xor i32 %253, %256
  %258 = add i32 %253, %257
  %259 = add i32 %258, %240
  %260 = shl i32 %257, 24
  %261 = lshr i32 %257, 8
  %262 = or i32 %260, %261
  %263 = xor i32 %258, %262
  %264 = add i32 %263, %216
  %265 = add i32 %264, 2
  %266 = add i32 %259, %265
  %267 = shl i32 %265, 13
  %268 = lshr i32 %265, 19
  %269 = or i32 %267, %268
  %270 = xor i32 %266, %269
  %271 = add i32 %266, %270
  %272 = shl i32 %270, 15
  %273 = lshr i32 %270, 17
  %274 = or i32 %272, %273
  %275 = xor i32 %271, %274
  %276 = add i32 %271, %275
  %277 = shl i32 %275, 26
  %278 = lshr i32 %275, 6
  %279 = or i32 %277, %278
  %280 = xor i32 %276, %279
  %281 = add i32 %276, %280
  %282 = add i32 %281, %216
  %283 = shl i32 %280, 6
  %284 = lshr i32 %280, 26
  %285 = or i32 %283, %284
  %286 = xor i32 %281, %285
  %287 = add i32 %286, %217
  %288 = add i32 %287, 3
  %289 = add i32 %282, %288
  %290 = shl i32 %288, 17
  %291 = lshr i32 %288, 15
  %292 = or i32 %290, %291
  %293 = xor i32 %289, %292
  %294 = add i32 %289, %293
  %295 = shl i32 %293, 29
  %296 = lshr i32 %293, 3
  %297 = or i32 %295, %296
  %298 = xor i32 %294, %297
  %299 = add i32 %294, %298
  %300 = shl i32 %298, 16
  %301 = lshr i32 %298, 16
  %302 = or i32 %300, %301
  %303 = xor i32 %299, %302
  %304 = add i32 %299, %303
  %305 = add i32 %304, %217
  %306 = shl i32 %303, 24
  %307 = lshr i32 %303, 8
  %308 = or i32 %306, %307
  %309 = xor i32 %304, %308
  %310 = add i32 %309, %240
  %311 = add i32 %310, 4
  %312 = add i32 %305, %311
  %313 = shl i32 %311, 13
  %314 = lshr i32 %311, 19
  %315 = or i32 %313, %314
  %316 = xor i32 %312, %315
  %317 = add i32 %312, %316
  %318 = shl i32 %316, 15
  %319 = lshr i32 %316, 17
  %320 = or i32 %318, %319
  %321 = xor i32 %317, %320
  %322 = add i32 %317, %321
  %323 = shl i32 %321, 26
  %324 = lshr i32 %321, 6
  %325 = or i32 %323, %324
  %326 = xor i32 %322, %325
  %327 = add i32 %322, %326
  %328 = add i32 %327, %240
  %329 = shl i32 %326, 6
  %330 = lshr i32 %326, 26
  %331 = or i32 %329, %330
  %332 = xor i32 %327, %331
  %333 = add i32 %332, %216
  %334 = add i32 %333, 5
  %335 = xor i32 %328, %334
  %336 = urem i32 %335, 9
  %337 = add i32 %215, %336
  %338 = urem i32 %337, 9
  %339 = sub i32 164, %338
  %340 = icmp slt i32 %339, 0
  %341 = sub i32 329, %338
  %342 = select i1 %340, i32 %341, i32 %339
  %343 = call i32 @llvm.smin.i32(i32 %342, i32 164)
  %344 = call i32 @llvm.smax.i32(i32 %343, i32 0)
  %345 = mul i32 %93, 165
  %346 = add i32 %345, %344
  %347 = getelementptr inbounds float, ptr %2, i32 %346
  %348 = load float, ptr %347, align 4, !invariant.load !3
  %349 = getelementptr inbounds i8, ptr %5, i32 %15
  store i8 %80, ptr %349, align 1
  %350 = getelementptr inbounds i32, ptr %6, i32 %15
  store i32 %89, ptr %350, align 4
  %351 = getelementptr inbounds i8, ptr %7, i32 %15
  store i8 %91, ptr %351, align 1
  %352 = getelementptr inbounds i32, ptr %8, i32 %15
  store i32 %76, ptr %352, align 4
  %353 = getelementptr inbounds float, ptr %9, i32 %15
  store float %348, ptr %353, align 4
  %354 = getelementptr inbounds i32, ptr %10, i32 %15
  store i32 0, ptr %354, align 4
  ret void
}

define internal i32 @fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, i32 %5, i32 %6) {
  %8 = call i32 @fused_broadcast_compare_gather_select_concatenate_154_131_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %5, i32 0, i32 %6)
  ret i32 %8
}

define internal i32 @fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, i32 %5, i32 %6) {
  %8 = call i32 @fused_broadcast_compare_gather_select_concatenate_154_131_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, i32 %5, i32 1, i32 %6)
  ret i32 %8
}

define internal i32 @fused_broadcast_compare_gather_select_concatenate_154_131_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, i32 %5, i32 %6, i32 %7) {
  %9 = icmp ult i32 %5, 1
  br i1 %9, label %10, label %15

10:                                               ; preds = %8
  %11 = mul i32 %6, 1536
  %12 = add i32 %11, %7
  %13 = getelementptr inbounds i32, ptr %4, i32 %12
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  br label %20

15:                                               ; preds = %8
  %16 = mul i32 %6, 1536
  %17 = add i32 %16, %7
  %18 = getelementptr inbounds i32, ptr %3, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  br label %20

20:                                               ; preds = %10, %15
  %21 = phi i32 [ %19, %15 ], [ %14, %10 ]
  br label %22

22:                                               ; preds = %20
  ret i32 %21
}

define ptx_kernel void @loop_and_or_fusion(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(165) %1, ptr noalias align 256 dereferenceable(1013760) %2, ptr noalias align 256 dereferenceable(6144) %3, ptr noalias align 256 dereferenceable(253440) %4, ptr noalias align 256 dereferenceable(253440) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %9 = mul i32 %8, 4
  %10 = mul i32 %7, 512
  %11 = add i32 %9, %10
  %12 = getelementptr inbounds i8, ptr %0, i32 %11
  %13 = load <4 x i8>, ptr %12, align 4, !invariant.load !3
  %14 = getelementptr inbounds float, ptr %2, i32 %11
  %15 = load <4 x float>, ptr %14, align 16, !invariant.load !3
  %16 = udiv i32 %11, 165
  %17 = urem i32 %11, 165
  %18 = extractelement <4 x float> %15, i64 0
  %19 = getelementptr inbounds float, ptr %3, i32 %16
  %20 = load float, ptr %19, align 4, !invariant.load !3
  %21 = fcmp ogt float %18, %20
  %22 = getelementptr inbounds i8, ptr %1, i32 %17
  %23 = load i8, ptr %22, align 1, !invariant.load !3
  %24 = srem i32 %17, 15
  %25 = add i32 %24, 15
  %26 = trunc i8 %23 to i1
  %27 = select i1 %26, i32 %25, i32 %24
  %28 = icmp sge i32 %27, 3
  %29 = icmp sle i32 %27, 11
  %30 = and i1 %28, %29
  %31 = extractelement <4 x i8> %13, i64 0
  %32 = and i1 %21, %30
  %33 = zext i1 %32 to i8
  %34 = or i8 %31, %33
  %35 = insertelement <4 x i8> zeroinitializer, i8 %33, i64 0
  %36 = insertelement <4 x i8> zeroinitializer, i8 %34, i64 0
  %37 = add i32 %11, 1
  %38 = udiv i32 %37, 165
  %39 = urem i32 %37, 165
  %40 = extractelement <4 x float> %15, i64 1
  %41 = getelementptr inbounds float, ptr %3, i32 %38
  %42 = load float, ptr %41, align 4, !invariant.load !3
  %43 = fcmp ogt float %40, %42
  %44 = getelementptr inbounds i8, ptr %1, i32 %39
  %45 = load i8, ptr %44, align 1, !invariant.load !3
  %46 = srem i32 %39, 15
  %47 = add i32 %46, 15
  %48 = trunc i8 %45 to i1
  %49 = select i1 %48, i32 %47, i32 %46
  %50 = icmp sge i32 %49, 3
  %51 = icmp sle i32 %49, 11
  %52 = and i1 %50, %51
  %53 = extractelement <4 x i8> %13, i64 1
  %54 = and i1 %43, %52
  %55 = zext i1 %54 to i8
  %56 = or i8 %53, %55
  %57 = insertelement <4 x i8> %35, i8 %55, i64 1
  %58 = insertelement <4 x i8> %36, i8 %56, i64 1
  %59 = add i32 %11, 2
  %60 = udiv i32 %59, 165
  %61 = urem i32 %59, 165
  %62 = extractelement <4 x float> %15, i64 2
  %63 = getelementptr inbounds float, ptr %3, i32 %60
  %64 = load float, ptr %63, align 4, !invariant.load !3
  %65 = fcmp ogt float %62, %64
  %66 = getelementptr inbounds i8, ptr %1, i32 %61
  %67 = load i8, ptr %66, align 1, !invariant.load !3
  %68 = srem i32 %61, 15
  %69 = add i32 %68, 15
  %70 = trunc i8 %67 to i1
  %71 = select i1 %70, i32 %69, i32 %68
  %72 = icmp sge i32 %71, 3
  %73 = icmp sle i32 %71, 11
  %74 = and i1 %72, %73
  %75 = extractelement <4 x i8> %13, i64 2
  %76 = and i1 %65, %74
  %77 = zext i1 %76 to i8
  %78 = or i8 %75, %77
  %79 = insertelement <4 x i8> %57, i8 %77, i64 2
  %80 = insertelement <4 x i8> %58, i8 %78, i64 2
  %81 = add i32 %11, 3
  %82 = udiv i32 %81, 165
  %83 = urem i32 %81, 165
  %84 = extractelement <4 x float> %15, i64 3
  %85 = getelementptr inbounds float, ptr %3, i32 %82
  %86 = load float, ptr %85, align 4, !invariant.load !3
  %87 = fcmp ogt float %84, %86
  %88 = getelementptr inbounds i8, ptr %1, i32 %83
  %89 = load i8, ptr %88, align 1, !invariant.load !3
  %90 = srem i32 %83, 15
  %91 = add i32 %90, 15
  %92 = trunc i8 %89 to i1
  %93 = select i1 %92, i32 %91, i32 %90
  %94 = icmp sge i32 %93, 3
  %95 = icmp sle i32 %93, 11
  %96 = and i1 %94, %95
  %97 = extractelement <4 x i8> %13, i64 3
  %98 = and i1 %87, %96
  %99 = zext i1 %98 to i8
  %100 = or i8 %97, %99
  %101 = insertelement <4 x i8> %79, i8 %99, i64 3
  %102 = insertelement <4 x i8> %80, i8 %100, i64 3
  %103 = getelementptr inbounds i8, ptr %4, i32 %11
  store <4 x i8> %102, ptr %103, align 4
  %104 = getelementptr inbounds i8, ptr %5, i32 %11
  store <4 x i8> %101, ptr %104, align 4
  ret void
}

define ptx_kernel void @input_concatenate_fusion_1(ptr noalias align 256 dereferenceable(6144) %0, ptr noalias align 256 dereferenceable(6144) %1, ptr noalias align 256 dereferenceable(12288) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %6 = mul i32 %5, 128
  %7 = add i32 %6, %4
  %8 = zext i32 %7 to i64
  %9 = trunc i64 %8 to i32
  %10 = call i32 @fused_concatenate_1__epilogue__concatenate_57_1(ptr %0, ptr %1, i32 %7, i32 0, i32 %9)
  %11 = mul i32 %4, 2
  %12 = mul i32 %5, 256
  %13 = add i32 %11, %12
  %14 = getelementptr inbounds i32, ptr %2, i32 %13
  store i32 %10, ptr %14, align 4
  %15 = getelementptr inbounds i32, ptr %1, i32 %7
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = getelementptr inbounds i32, ptr %0, i32 %7
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = icmp slt i32 %18, %16
  %20 = add i32 %18, 14
  %21 = select i1 %19, i32 %20, i32 %18
  %22 = call i32 @fused_concatenate_1__epilogue__concatenate_57_1(ptr %0, ptr %1, i32 %7, i32 1, i32 %21)
  %23 = add i32 %13, 1
  %24 = getelementptr inbounds i32, ptr %2, i32 %23
  store i32 %22, ptr %24, align 4
  ret void
}

define internal i32 @fused_concatenate_1__epilogue__concatenate_57_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4) {
  ret i32 %4
}

define ptx_kernel void @input_scatter_fusion_32(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(6144) %1, ptr noalias align 256 dereferenceable(86016) %2, ptr noalias align 256 dereferenceable(12288) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %5
  %9 = call i32 @fused_scatter_32_concatenate_59_5(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 0)
  %10 = call i32 @fused_scatter_32_concatenate_59_5(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 1)
  %11 = icmp ule i32 %9, 1535
  %12 = icmp ule i32 %10, 164
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %18

14:                                               ; preds = %4
  %15 = mul i32 %9, 165
  %16 = add i32 %15, %10
  %17 = getelementptr inbounds i8, ptr %0, i32 %16
  store i8 0, ptr %17, align 1
  br label %18

18:                                               ; preds = %14, %4
  ret void
}

define internal i32 @fused_scatter_32_concatenate_59_5(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = icmp ult i32 %5, 1
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = zext i32 %4 to i64
  %10 = trunc i64 %9 to i32
  br label %31

11:                                               ; preds = %6
  %12 = getelementptr inbounds i32, ptr %1, i32 %4
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = mul i32 %4, 2
  %15 = getelementptr inbounds i32, ptr %3, i32 %14
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = call i32 @llvm.smin.i32(i32 %16, i32 1535)
  %18 = call i32 @llvm.smax.i32(i32 %17, i32 0)
  %19 = add i32 %14, 1
  %20 = getelementptr inbounds i32, ptr %3, i32 %19
  %21 = load i32, ptr %20, align 4, !invariant.load !3
  %22 = call i32 @llvm.smin.i32(i32 %21, i32 13)
  %23 = call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = mul i32 %18, 14
  %25 = add i32 %24, %23
  %26 = getelementptr inbounds i32, ptr %2, i32 %25
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  %28 = icmp slt i32 %27, %13
  %29 = add i32 %27, 165
  %30 = select i1 %28, i32 %29, i32 %27
  br label %31

31:                                               ; preds = %8, %11
  %32 = phi i32 [ %30, %11 ], [ %10, %8 ]
  br label %33

33:                                               ; preds = %31
  ret i32 %32
}

define ptx_kernel void @input_concatenate_fusion_2(ptr noalias align 256 dereferenceable(6144) %0, ptr noalias align 256 dereferenceable(6144) %1, ptr noalias align 256 dereferenceable(12288) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %6 = mul i32 %5, 128
  %7 = add i32 %6, %4
  %8 = zext i32 %7 to i64
  %9 = trunc i64 %8 to i32
  %10 = call i32 @fused_concatenate_2__epilogue__concatenate_31_1(ptr %0, ptr %1, i32 %7, i32 0, i32 %9)
  %11 = mul i32 %4, 2
  %12 = mul i32 %5, 256
  %13 = add i32 %11, %12
  %14 = getelementptr inbounds i32, ptr %2, i32 %13
  store i32 %10, ptr %14, align 4
  %15 = getelementptr inbounds i32, ptr %0, i32 %7
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = getelementptr inbounds i32, ptr %1, i32 %7
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = call i32 @llvm.smax.i32(i32 %16, i32 %18)
  %20 = call i32 @llvm.smin.i32(i32 %19, i32 13)
  %21 = icmp slt i32 %20, %16
  %22 = add i32 %20, 14
  %23 = select i1 %21, i32 %22, i32 %20
  %24 = call i32 @fused_concatenate_2__epilogue__concatenate_31_1(ptr %0, ptr %1, i32 %7, i32 1, i32 %23)
  %25 = add i32 %13, 1
  %26 = getelementptr inbounds i32, ptr %2, i32 %25
  store i32 %24, ptr %26, align 4
  ret void
}

define internal i32 @fused_concatenate_2__epilogue__concatenate_31_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4) {
  ret i32 %4
}

define ptx_kernel void @loop_broadcast_fusion(ptr noalias align 256 dereferenceable(86016) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %2, 128
  %5 = add i32 %4, %3
  %6 = urem i32 %5, 14
  %7 = icmp sge i32 %6, 7
  %8 = zext i1 %7 to i32
  %9 = getelementptr inbounds i32, ptr %0, i32 %5
  store i32 %8, ptr %9, align 4
  ret void
}

define ptx_kernel void @loop_compare_gather_fusion(ptr noalias align 256 dereferenceable(12288) %0, ptr noalias align 256 dereferenceable(8080) %1, ptr noalias align 256 dereferenceable(86016) %2, ptr noalias align 256 dereferenceable(86016) %3, ptr noalias align 256 dereferenceable(12288) %4, ptr noalias align 256 dereferenceable(6144) %5, ptr noalias align 256 dereferenceable(1536) %6, ptr noalias align 256 dereferenceable(6144) %7) #0 {
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %11 = mul i32 %9, 128
  %12 = add i32 %11, %10
  %13 = mul i32 %10, 2
  %14 = mul i32 %9, 256
  %15 = add i32 %13, %14
  %16 = getelementptr inbounds i32, ptr %0, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = call i32 @llvm.smin.i32(i32 %17, i32 1535)
  %19 = call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = add i32 %15, 1
  %21 = getelementptr inbounds i32, ptr %0, i32 %20
  %22 = load i32, ptr %21, align 4, !invariant.load !3
  %23 = call i32 @llvm.smin.i32(i32 %22, i32 13)
  %24 = call i32 @llvm.smax.i32(i32 %23, i32 0)
  %25 = mul i32 %19, 14
  %26 = add i32 %25, %24
  %27 = getelementptr inbounds i32, ptr %2, i32 %26
  %28 = load i32, ptr %27, align 4, !invariant.load !3
  %29 = icmp slt i32 %28, 0
  %30 = add i32 %28, 101
  %31 = select i1 %29, i32 %30, i32 %28
  %32 = call i32 @llvm.smin.i32(i32 %31, i32 100)
  %33 = call i32 @llvm.smax.i32(i32 %32, i32 0)
  %34 = mul i32 %33, 20
  %35 = add i32 %34, 5
  %36 = getelementptr inbounds float, ptr %1, i32 %35
  %37 = load float, ptr %36, align 4, !invariant.load !3
  %38 = fptosi float %37 to i32
  %39 = fcmp ole float %37, 0xC1E0000000000000
  %40 = select i1 %39, i32 -2147483648, i32 %38
  %41 = fcmp oge float %37, 0x41E0000000000000
  %42 = select i1 %41, i32 2147483647, i32 %40
  %43 = fcmp uno float %37, %37
  %44 = select i1 %43, i32 0, i32 %42
  %45 = getelementptr inbounds i32, ptr %3, i32 %26
  %46 = load i32, ptr %45, align 4, !invariant.load !3
  %47 = icmp eq i32 %46, 0
  %48 = zext i1 %47 to i8
  %49 = getelementptr inbounds i32, ptr %4, i32 %15
  %50 = load i32, ptr %49, align 4, !invariant.load !3
  %51 = call i32 @llvm.smin.i32(i32 %50, i32 1535)
  %52 = call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = getelementptr inbounds i32, ptr %4, i32 %20
  %54 = load i32, ptr %53, align 4, !invariant.load !3
  %55 = call i32 @llvm.smin.i32(i32 %54, i32 13)
  %56 = call i32 @llvm.smax.i32(i32 %55, i32 0)
  %57 = mul i32 %52, 14
  %58 = add i32 %57, %56
  %59 = getelementptr inbounds i32, ptr %2, i32 %58
  %60 = load i32, ptr %59, align 4, !invariant.load !3
  %61 = icmp slt i32 %60, 0
  %62 = add i32 %60, 101
  %63 = select i1 %61, i32 %62, i32 %60
  %64 = call i32 @llvm.smin.i32(i32 %63, i32 100)
  %65 = call i32 @llvm.smax.i32(i32 %64, i32 0)
  %66 = mul i32 %65, 20
  %67 = add i32 %66, 5
  %68 = getelementptr inbounds float, ptr %1, i32 %67
  %69 = load float, ptr %68, align 4, !invariant.load !3
  %70 = fptosi float %69 to i32
  %71 = fcmp ole float %69, 0xC1E0000000000000
  %72 = select i1 %71, i32 -2147483648, i32 %70
  %73 = fcmp oge float %69, 0x41E0000000000000
  %74 = select i1 %73, i32 2147483647, i32 %72
  %75 = fcmp uno float %69, %69
  %76 = select i1 %75, i32 0, i32 %74
  %77 = getelementptr inbounds i32, ptr %5, i32 %12
  store i32 %44, ptr %77, align 4
  %78 = getelementptr inbounds i8, ptr %6, i32 %12
  store i8 %48, ptr %78, align 1
  %79 = getelementptr inbounds i32, ptr %7, i32 %12
  store i32 %76, ptr %79, align 4
  ret void
}

define ptx_kernel void @input_scatter_fusion_29(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(6144) %1, ptr noalias align 256 dereferenceable(1536) %2, ptr noalias align 256 dereferenceable(12288) %3, ptr noalias align 256 dereferenceable(8080) %4, ptr noalias align 256 dereferenceable(86016) %5, ptr noalias align 256 dereferenceable(86016) %6) #0 {
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %10 = mul i32 %9, 128
  %11 = add i32 %10, %8
  %12 = call i32 @fused_scatter_29_concatenate_67_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %11, i32 0)
  %13 = call i32 @fused_scatter_29_concatenate_67_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %11, i32 1)
  %14 = icmp ule i32 %12, 1535
  %15 = icmp ule i32 %13, 164
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %21

17:                                               ; preds = %7
  %18 = mul i32 %12, 165
  %19 = add i32 %18, %13
  %20 = getelementptr inbounds i8, ptr %0, i32 %19
  store i8 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %17, %7
  ret void
}

define internal i32 @fused_scatter_29_concatenate_67_3(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, i32 %7, i32 %8) {
  %10 = icmp ult i32 %8, 1
  br i1 %10, label %11, label %14

11:                                               ; preds = %9
  %12 = zext i32 %7 to i64
  %13 = trunc i64 %12 to i32
  br label %68

14:                                               ; preds = %9
  %15 = mul i32 %7, 2
  %16 = getelementptr inbounds i32, ptr %3, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = call i32 @llvm.smin.i32(i32 %17, i32 1535)
  %19 = call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = add i32 %15, 1
  %21 = getelementptr inbounds i32, ptr %3, i32 %20
  %22 = load i32, ptr %21, align 4, !invariant.load !3
  %23 = call i32 @llvm.smin.i32(i32 %22, i32 13)
  %24 = call i32 @llvm.smax.i32(i32 %23, i32 0)
  %25 = mul i32 %19, 14
  %26 = add i32 %25, %24
  %27 = getelementptr inbounds i32, ptr %6, i32 %26
  %28 = load i32, ptr %27, align 4, !invariant.load !3
  %29 = srem i32 %28, 15
  %30 = getelementptr inbounds i32, ptr %1, i32 %7
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = icmp slt i32 %29, %31
  %33 = icmp ne i32 %29, %31
  %34 = and i1 %32, %33
  %35 = add i32 %29, 15
  %36 = select i1 %34, i32 %35, i32 %29
  %37 = getelementptr inbounds i8, ptr %2, i32 %7
  %38 = load i8, ptr %37, align 1, !invariant.load !3
  %39 = icmp sge i32 %36, 1
  %40 = zext i1 %39 to i8
  %41 = icmp sle i32 %36, 13
  %42 = zext i1 %41 to i8
  %43 = trunc i8 %38 to i1
  %44 = select i1 %43, i32 -1, i32 1
  %45 = getelementptr inbounds i32, ptr %5, i32 %26
  %46 = load i32, ptr %45, align 4, !invariant.load !3
  %47 = icmp slt i32 %46, 0
  %48 = add i32 %46, 101
  %49 = select i1 %47, i32 %48, i32 %46
  %50 = call i32 @llvm.smin.i32(i32 %49, i32 100)
  %51 = call i32 @llvm.smax.i32(i32 %50, i32 0)
  %52 = mul i32 %51, 20
  %53 = add i32 %52, 9
  %54 = getelementptr inbounds float, ptr %4, i32 %53
  %55 = load float, ptr %54, align 4, !invariant.load !3
  %56 = fcmp ogt float %55, 0.000000e+00
  %57 = zext i1 %56 to i8
  %58 = select i1 %43, i8 %40, i8 %42
  %59 = add i32 %28, %44
  %60 = and i8 %57, %58
  %61 = call i32 @llvm.smax.i32(i32 %31, i32 %59)
  %62 = call i32 @llvm.smin.i32(i32 %61, i32 164)
  %63 = trunc i8 %60 to i1
  %64 = select i1 %63, i32 %62, i32 %28
  %65 = icmp slt i32 %64, %31
  %66 = add i32 %64, 165
  %67 = select i1 %65, i32 %66, i32 %64
  br label %68

68:                                               ; preds = %11, %14
  %69 = phi i32 [ %67, %14 ], [ %13, %11 ]
  br label %70

70:                                               ; preds = %68
  ret i32 %69
}

define ptx_kernel void @input_scatter_fusion_30(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(6144) %1, ptr noalias align 256 dereferenceable(1536) %2, ptr noalias align 256 dereferenceable(86016) %3, ptr noalias align 256 dereferenceable(12288) %4, ptr noalias align 256 dereferenceable(8080) %5, ptr noalias align 256 dereferenceable(86016) %6) #0 {
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %10 = mul i32 %9, 128
  %11 = add i32 %10, %8
  %12 = call i32 @fused_scatter_30_concatenate_40_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %11, i32 0)
  %13 = call i32 @fused_scatter_30_concatenate_40_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %11, i32 1)
  %14 = icmp ule i32 %12, 1535
  %15 = icmp ule i32 %13, 164
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %21

17:                                               ; preds = %7
  %18 = mul i32 %12, 165
  %19 = add i32 %18, %13
  %20 = getelementptr inbounds i8, ptr %0, i32 %19
  store i8 0, ptr %20, align 1
  br label %21

21:                                               ; preds = %17, %7
  ret void
}

define internal i32 @fused_scatter_30_concatenate_40_3(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, i32 %7, i32 %8) {
  %10 = icmp ult i32 %8, 1
  br i1 %10, label %11, label %14

11:                                               ; preds = %9
  %12 = zext i32 %7 to i64
  %13 = trunc i64 %12 to i32
  br label %68

14:                                               ; preds = %9
  %15 = mul i32 %7, 2
  %16 = getelementptr inbounds i32, ptr %4, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = call i32 @llvm.smin.i32(i32 %17, i32 1535)
  %19 = call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = add i32 %15, 1
  %21 = getelementptr inbounds i32, ptr %4, i32 %20
  %22 = load i32, ptr %21, align 4, !invariant.load !3
  %23 = call i32 @llvm.smin.i32(i32 %22, i32 13)
  %24 = call i32 @llvm.smax.i32(i32 %23, i32 0)
  %25 = mul i32 %19, 14
  %26 = add i32 %25, %24
  %27 = getelementptr inbounds i32, ptr %3, i32 %26
  %28 = load i32, ptr %27, align 4, !invariant.load !3
  %29 = srem i32 %28, 15
  %30 = getelementptr inbounds i32, ptr %1, i32 %7
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = icmp slt i32 %29, %31
  %33 = icmp ne i32 %29, %31
  %34 = and i1 %32, %33
  %35 = add i32 %29, 15
  %36 = select i1 %34, i32 %35, i32 %29
  %37 = getelementptr inbounds i8, ptr %2, i32 %7
  %38 = load i8, ptr %37, align 1, !invariant.load !3
  %39 = icmp sge i32 %36, 1
  %40 = zext i1 %39 to i8
  %41 = icmp sle i32 %36, 13
  %42 = zext i1 %41 to i8
  %43 = trunc i8 %38 to i1
  %44 = select i1 %43, i32 -1, i32 1
  %45 = getelementptr inbounds i32, ptr %6, i32 %26
  %46 = load i32, ptr %45, align 4, !invariant.load !3
  %47 = icmp slt i32 %46, 0
  %48 = add i32 %46, 101
  %49 = select i1 %47, i32 %48, i32 %46
  %50 = call i32 @llvm.smin.i32(i32 %49, i32 100)
  %51 = call i32 @llvm.smax.i32(i32 %50, i32 0)
  %52 = mul i32 %51, 20
  %53 = add i32 %52, 9
  %54 = getelementptr inbounds float, ptr %5, i32 %53
  %55 = load float, ptr %54, align 4, !invariant.load !3
  %56 = fcmp ogt float %55, 0.000000e+00
  %57 = zext i1 %56 to i8
  %58 = select i1 %43, i8 %40, i8 %42
  %59 = add i32 %28, %44
  %60 = and i8 %57, %58
  %61 = call i32 @llvm.smax.i32(i32 %31, i32 %59)
  %62 = call i32 @llvm.smin.i32(i32 %61, i32 164)
  %63 = trunc i8 %60 to i1
  %64 = select i1 %63, i32 %62, i32 %28
  %65 = icmp slt i32 %64, %31
  %66 = add i32 %64, 165
  %67 = select i1 %65, i32 %66, i32 %64
  br label %68

68:                                               ; preds = %11, %14
  %69 = phi i32 [ %67, %14 ], [ %13, %11 ]
  br label %70

70:                                               ; preds = %68
  ret i32 %69
}

define ptx_kernel void @loop_broadcast_fusion_7(ptr noalias align 256 dereferenceable(1013760) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %3, 4
  %5 = mul i32 %2, 512
  %6 = add i32 %4, %5
  %7 = getelementptr inbounds i32, ptr %0, i32 %6
  store <4 x i32> splat (i32 -1), ptr %7, align 16
  ret void
}

define ptx_kernel void @input_scatter_fusion_8(ptr noalias align 256 dereferenceable(1013760) %0, ptr noalias align 256 dereferenceable(172032) %1, ptr noalias align 256 dereferenceable(21504) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %6 = mul i32 %4, 2
  %7 = mul i32 %5, 256
  %8 = add i32 %6, %7
  %9 = getelementptr inbounds i32, ptr %1, i32 %8
  %10 = load i32, ptr %9, align 4, !invariant.load !3
  %11 = add i32 %8, 1
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = icmp ule i32 %10, 1535
  %15 = icmp ule i32 %13, 164
  %16 = and i1 %14, %15
  br i1 %16, label %17, label %31

17:                                               ; preds = %3
  %18 = mul i32 %5, 128
  %19 = add i32 %18, %4
  %20 = urem i32 %19, 14
  %21 = getelementptr inbounds i8, ptr %2, i32 %19
  %22 = load i8, ptr %21, align 1, !invariant.load !3
  %23 = zext i32 %20 to i64
  %24 = trunc i64 %23 to i32
  %25 = trunc i8 %22 to i1
  %26 = select i1 %25, i32 %24, i32 -1
  %27 = mul i32 %10, 165
  %28 = add i32 %27, %13
  %29 = getelementptr inbounds i32, ptr %0, i32 %28
  %30 = atomicrmw max ptr %29, i32 %26 monotonic, align 4
  br label %31

31:                                               ; preds = %17, %3
  ret void
}

define ptx_kernel void @input_scatter_fusion_7(ptr noalias align 256 dereferenceable(1013760) %0, ptr noalias align 256 dereferenceable(172032) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(86016) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %8 = mul i32 %6, 2
  %9 = mul i32 %7, 256
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i32, ptr %1, i32 %10
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  %13 = add i32 %10, 1
  %14 = getelementptr inbounds i32, ptr %1, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = icmp ule i32 %12, 1535
  %17 = icmp ule i32 %15, 164
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %47

19:                                               ; preds = %5
  %20 = mul i32 %7, 128
  %21 = add i32 %20, %6
  %22 = urem i32 %21, 14
  %23 = getelementptr inbounds i8, ptr %2, i32 %21
  %24 = load i8, ptr %23, align 1, !invariant.load !3
  %25 = getelementptr inbounds i32, ptr %4, i32 %21
  %26 = load i32, ptr %25, align 4, !invariant.load !3
  %27 = icmp slt i32 %26, 0
  %28 = add i32 %26, 101
  %29 = select i1 %27, i32 %28, i32 %26
  %30 = call i32 @llvm.smin.i32(i32 %29, i32 100)
  %31 = call i32 @llvm.smax.i32(i32 %30, i32 0)
  %32 = mul i32 %31, 20
  %33 = add i32 %32, 9
  %34 = getelementptr inbounds float, ptr %3, i32 %33
  %35 = load float, ptr %34, align 4, !invariant.load !3
  %36 = fcmp ogt float %35, 0.000000e+00
  %37 = zext i1 %36 to i8
  %38 = and i8 %24, %37
  %39 = zext i32 %22 to i64
  %40 = trunc i64 %39 to i32
  %41 = trunc i8 %38 to i1
  %42 = select i1 %41, i32 %40, i32 -1
  %43 = mul i32 %12, 165
  %44 = add i32 %43, %15
  %45 = getelementptr inbounds i32, ptr %0, i32 %44
  %46 = atomicrmw max ptr %45, i32 %42 monotonic, align 4
  br label %47

47:                                               ; preds = %19, %5
  ret void
}

define ptx_kernel void @loop_and_fusion(ptr noalias align 256 dereferenceable(86016) %0, ptr noalias align 256 dereferenceable(1013760) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(12288) %3, ptr noalias align 256 dereferenceable(253440) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = mul i32 %7, 4
  %9 = mul i32 %6, 512
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i32, ptr %1, i32 %10
  %12 = load <4 x i32>, ptr %11, align 16, !invariant.load !3
  %13 = udiv i32 %10, 165
  %14 = extractelement <4 x i32> %12, i64 0
  %15 = icmp sge i32 %14, 0
  %16 = call i32 @llvm.smin.i32(i32 %13, i32 1535)
  %17 = call i32 @llvm.smax.i32(i32 %16, i32 0)
  %18 = call i32 @llvm.smax.i32(i32 %14, i32 0)
  %19 = call i32 @llvm.smin.i32(i32 %18, i32 13)
  %20 = icmp slt i32 %19, 0
  %21 = add i32 %19, 14
  %22 = select i1 %20, i32 %21, i32 %19
  %23 = call i32 @llvm.smin.i32(i32 %22, i32 13)
  %24 = call i32 @llvm.smax.i32(i32 %23, i32 0)
  %25 = mul i32 %17, 14
  %26 = add i32 %25, %24
  %27 = getelementptr inbounds i32, ptr %0, i32 %26
  %28 = load i32, ptr %27, align 4, !invariant.load !3
  %29 = mul i32 %13, 2
  %30 = getelementptr inbounds i32, ptr %3, i32 %29
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = call i32 @llvm.smin.i32(i32 %31, i32 1535)
  %33 = call i32 @llvm.smax.i32(i32 %32, i32 0)
  %34 = add i32 %29, 1
  %35 = getelementptr inbounds i32, ptr %3, i32 %34
  %36 = load i32, ptr %35, align 4, !invariant.load !3
  %37 = call i32 @llvm.smin.i32(i32 %36, i32 13)
  %38 = call i32 @llvm.smax.i32(i32 %37, i32 0)
  %39 = mul i32 %33, 14
  %40 = add i32 %39, %38
  %41 = getelementptr inbounds i32, ptr %0, i32 %40
  %42 = load i32, ptr %41, align 4, !invariant.load !3
  %43 = icmp ne i32 %28, %42
  %44 = and i1 %15, %43
  %45 = zext i1 %44 to i8
  %46 = getelementptr inbounds i8, ptr %2, i32 %26
  %47 = load i8, ptr %46, align 1, !invariant.load !3
  %48 = and i8 %45, %47
  %49 = insertelement <4 x i8> zeroinitializer, i8 %48, i64 0
  %50 = add i32 %10, 1
  %51 = udiv i32 %50, 165
  %52 = extractelement <4 x i32> %12, i64 1
  %53 = icmp sge i32 %52, 0
  %54 = call i32 @llvm.smin.i32(i32 %51, i32 1535)
  %55 = call i32 @llvm.smax.i32(i32 %54, i32 0)
  %56 = call i32 @llvm.smax.i32(i32 %52, i32 0)
  %57 = call i32 @llvm.smin.i32(i32 %56, i32 13)
  %58 = icmp slt i32 %57, 0
  %59 = add i32 %57, 14
  %60 = select i1 %58, i32 %59, i32 %57
  %61 = call i32 @llvm.smin.i32(i32 %60, i32 13)
  %62 = call i32 @llvm.smax.i32(i32 %61, i32 0)
  %63 = mul i32 %55, 14
  %64 = add i32 %63, %62
  %65 = getelementptr inbounds i32, ptr %0, i32 %64
  %66 = load i32, ptr %65, align 4, !invariant.load !3
  %67 = mul i32 %51, 2
  %68 = getelementptr inbounds i32, ptr %3, i32 %67
  %69 = load i32, ptr %68, align 4, !invariant.load !3
  %70 = call i32 @llvm.smin.i32(i32 %69, i32 1535)
  %71 = call i32 @llvm.smax.i32(i32 %70, i32 0)
  %72 = add i32 %67, 1
  %73 = getelementptr inbounds i32, ptr %3, i32 %72
  %74 = load i32, ptr %73, align 4, !invariant.load !3
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 13)
  %76 = call i32 @llvm.smax.i32(i32 %75, i32 0)
  %77 = mul i32 %71, 14
  %78 = add i32 %77, %76
  %79 = getelementptr inbounds i32, ptr %0, i32 %78
  %80 = load i32, ptr %79, align 4, !invariant.load !3
  %81 = icmp ne i32 %66, %80
  %82 = and i1 %53, %81
  %83 = zext i1 %82 to i8
  %84 = getelementptr inbounds i8, ptr %2, i32 %64
  %85 = load i8, ptr %84, align 1, !invariant.load !3
  %86 = and i8 %83, %85
  %87 = insertelement <4 x i8> %49, i8 %86, i64 1
  %88 = add i32 %10, 2
  %89 = udiv i32 %88, 165
  %90 = extractelement <4 x i32> %12, i64 2
  %91 = icmp sge i32 %90, 0
  %92 = call i32 @llvm.smin.i32(i32 %89, i32 1535)
  %93 = call i32 @llvm.smax.i32(i32 %92, i32 0)
  %94 = call i32 @llvm.smax.i32(i32 %90, i32 0)
  %95 = call i32 @llvm.smin.i32(i32 %94, i32 13)
  %96 = icmp slt i32 %95, 0
  %97 = add i32 %95, 14
  %98 = select i1 %96, i32 %97, i32 %95
  %99 = call i32 @llvm.smin.i32(i32 %98, i32 13)
  %100 = call i32 @llvm.smax.i32(i32 %99, i32 0)
  %101 = mul i32 %93, 14
  %102 = add i32 %101, %100
  %103 = getelementptr inbounds i32, ptr %0, i32 %102
  %104 = load i32, ptr %103, align 4, !invariant.load !3
  %105 = mul i32 %89, 2
  %106 = getelementptr inbounds i32, ptr %3, i32 %105
  %107 = load i32, ptr %106, align 4, !invariant.load !3
  %108 = call i32 @llvm.smin.i32(i32 %107, i32 1535)
  %109 = call i32 @llvm.smax.i32(i32 %108, i32 0)
  %110 = add i32 %105, 1
  %111 = getelementptr inbounds i32, ptr %3, i32 %110
  %112 = load i32, ptr %111, align 4, !invariant.load !3
  %113 = call i32 @llvm.smin.i32(i32 %112, i32 13)
  %114 = call i32 @llvm.smax.i32(i32 %113, i32 0)
  %115 = mul i32 %109, 14
  %116 = add i32 %115, %114
  %117 = getelementptr inbounds i32, ptr %0, i32 %116
  %118 = load i32, ptr %117, align 4, !invariant.load !3
  %119 = icmp ne i32 %104, %118
  %120 = and i1 %91, %119
  %121 = zext i1 %120 to i8
  %122 = getelementptr inbounds i8, ptr %2, i32 %102
  %123 = load i8, ptr %122, align 1, !invariant.load !3
  %124 = and i8 %121, %123
  %125 = insertelement <4 x i8> %87, i8 %124, i64 2
  %126 = add i32 %10, 3
  %127 = udiv i32 %126, 165
  %128 = extractelement <4 x i32> %12, i64 3
  %129 = icmp sge i32 %128, 0
  %130 = call i32 @llvm.smin.i32(i32 %127, i32 1535)
  %131 = call i32 @llvm.smax.i32(i32 %130, i32 0)
  %132 = call i32 @llvm.smax.i32(i32 %128, i32 0)
  %133 = call i32 @llvm.smin.i32(i32 %132, i32 13)
  %134 = icmp slt i32 %133, 0
  %135 = add i32 %133, 14
  %136 = select i1 %134, i32 %135, i32 %133
  %137 = call i32 @llvm.smin.i32(i32 %136, i32 13)
  %138 = call i32 @llvm.smax.i32(i32 %137, i32 0)
  %139 = mul i32 %131, 14
  %140 = add i32 %139, %138
  %141 = getelementptr inbounds i32, ptr %0, i32 %140
  %142 = load i32, ptr %141, align 4, !invariant.load !3
  %143 = mul i32 %127, 2
  %144 = getelementptr inbounds i32, ptr %3, i32 %143
  %145 = load i32, ptr %144, align 4, !invariant.load !3
  %146 = call i32 @llvm.smin.i32(i32 %145, i32 1535)
  %147 = call i32 @llvm.smax.i32(i32 %146, i32 0)
  %148 = add i32 %143, 1
  %149 = getelementptr inbounds i32, ptr %3, i32 %148
  %150 = load i32, ptr %149, align 4, !invariant.load !3
  %151 = call i32 @llvm.smin.i32(i32 %150, i32 13)
  %152 = call i32 @llvm.smax.i32(i32 %151, i32 0)
  %153 = mul i32 %147, 14
  %154 = add i32 %153, %152
  %155 = getelementptr inbounds i32, ptr %0, i32 %154
  %156 = load i32, ptr %155, align 4, !invariant.load !3
  %157 = icmp ne i32 %142, %156
  %158 = and i1 %129, %157
  %159 = zext i1 %158 to i8
  %160 = getelementptr inbounds i8, ptr %2, i32 %140
  %161 = load i8, ptr %160, align 1, !invariant.load !3
  %162 = and i8 %159, %161
  %163 = insertelement <4 x i8> %125, i8 %162, i64 3
  %164 = getelementptr inbounds i8, ptr %4, i32 %10
  store <4 x i8> %163, ptr %164, align 4
  ret void
}

define ptx_kernel void @wrapped_broadcast(ptr noalias align 256 dereferenceable(27225) %0, ptr noalias align 256 dereferenceable(41817600) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !14
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %4, 4
  %6 = mul i32 %3, 512
  %7 = add i32 %5, %6
  %8 = udiv i32 %7, 165
  %9 = urem i32 %8, 165
  %10 = mul i32 %9, 165
  %11 = urem i32 %7, 165
  %12 = add i32 %10, %11
  %13 = getelementptr inbounds i8, ptr %0, i32 %12
  %14 = load i8, ptr %13, align 1, !invariant.load !3
  %15 = insertelement <4 x i8> zeroinitializer, i8 %14, i64 0
  %16 = add i32 %7, 1
  %17 = udiv i32 %16, 165
  %18 = urem i32 %17, 165
  %19 = mul i32 %18, 165
  %20 = urem i32 %16, 165
  %21 = add i32 %19, %20
  %22 = getelementptr inbounds i8, ptr %0, i32 %21
  %23 = load i8, ptr %22, align 1, !invariant.load !3
  %24 = insertelement <4 x i8> %15, i8 %23, i64 1
  %25 = add i32 %7, 2
  %26 = udiv i32 %25, 165
  %27 = urem i32 %26, 165
  %28 = mul i32 %27, 165
  %29 = urem i32 %25, 165
  %30 = add i32 %28, %29
  %31 = getelementptr inbounds i8, ptr %0, i32 %30
  %32 = load i8, ptr %31, align 1, !invariant.load !3
  %33 = insertelement <4 x i8> %24, i8 %32, i64 2
  %34 = add i32 %7, 3
  %35 = udiv i32 %34, 165
  %36 = urem i32 %35, 165
  %37 = mul i32 %36, 165
  %38 = urem i32 %34, 165
  %39 = add i32 %37, %38
  %40 = getelementptr inbounds i8, ptr %0, i32 %39
  %41 = load i8, ptr %40, align 1, !invariant.load !3
  %42 = insertelement <4 x i8> %33, i8 %41, i64 3
  %43 = getelementptr inbounds i8, ptr %1, i32 %7
  store <4 x i8> %42, ptr %43, align 4
  ret void
}

define ptx_kernel void @input_and_reduce_fusion(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(41817600) %1, ptr noalias align 256 dereferenceable(6144) %2, ptr noalias align 256 dereferenceable(86016) %3, ptr noalias align 256 dereferenceable(12288) %4, ptr noalias align 256 dereferenceable(1536) %5, ptr noalias align 256 dereferenceable(8080) %6, ptr noalias align 256 dereferenceable(86016) %7, ptr noalias align 256 dereferenceable(165) %8, ptr noalias align 256 dereferenceable(253440) %9, ptr noalias align 256 dereferenceable(1536) %10, ptr noalias align 256 dereferenceable(12288) %11, ptr noalias align 256 dereferenceable(253440) %12, ptr noalias align 256 dereferenceable(1536) %13, ptr noalias align 256 dereferenceable(1536) %14, ptr noalias align 256 dereferenceable(253440) %15, ptr noalias align 256 dereferenceable(253440) %16) #5 {
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !15
  %19 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %20 = mul i32 %19, 8
  %21 = udiv i32 %18, 32
  %22 = add i32 %20, %21
  %23 = zext i32 %22 to i64
  %24 = trunc i64 %23 to i32
  %25 = call i32 @llvm.smin.i32(i32 %24, i32 1535)
  %26 = call i32 @llvm.smax.i32(i32 %25, i32 0)
  %27 = mul i32 %21, 2
  %28 = mul i32 %19, 16
  %29 = add i32 %27, %28
  %30 = getelementptr inbounds i32, ptr %4, i32 %29
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = call i32 @llvm.smin.i32(i32 %31, i32 1535)
  %33 = call i32 @llvm.smax.i32(i32 %32, i32 0)
  %34 = add i32 %29, 1
  %35 = getelementptr inbounds i32, ptr %4, i32 %34
  %36 = load i32, ptr %35, align 4, !invariant.load !3
  %37 = call i32 @llvm.smin.i32(i32 %36, i32 13)
  %38 = call i32 @llvm.smax.i32(i32 %37, i32 0)
  %39 = mul i32 %33, 14
  %40 = add i32 %39, %38
  %41 = getelementptr inbounds i32, ptr %3, i32 %40
  %42 = load i32, ptr %41, align 4, !invariant.load !3
  %43 = getelementptr inbounds i32, ptr %2, i32 %22
  %44 = load i32, ptr %43, align 4, !invariant.load !3
  %45 = icmp slt i32 %42, %44
  %46 = add i32 %42, 165
  %47 = select i1 %45, i32 %46, i32 %42
  %48 = call i32 @llvm.smin.i32(i32 %47, i32 164)
  %49 = call i32 @llvm.smax.i32(i32 %48, i32 0)
  %50 = call i8 @fused_and_reduce_bitcast_65_20_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %33, i32 %38)
  %51 = getelementptr inbounds i8, ptr %5, i32 %22
  %52 = load i8, ptr %51, align 1, !invariant.load !3
  %53 = srem i32 %42, 15
  %54 = icmp slt i32 %53, %44
  %55 = icmp ne i32 %53, %44
  %56 = and i1 %54, %55
  %57 = add i32 %53, 15
  %58 = select i1 %56, i32 %57, i32 %53
  %59 = icmp sge i32 %58, 1
  %60 = zext i1 %59 to i8
  %61 = icmp sle i32 %58, 13
  %62 = zext i1 %61 to i8
  %63 = trunc i8 %52 to i1
  %64 = select i1 %63, i8 %60, i8 %62
  %65 = and i8 %50, %64
  %66 = select i1 %63, i32 -1, i32 1
  %67 = add i32 %42, %66
  %68 = call i32 @llvm.smax.i32(i32 %44, i32 %67)
  %69 = call i32 @llvm.smin.i32(i32 %68, i32 164)
  %70 = trunc i8 %65 to i1
  %71 = select i1 %70, i32 %69, i32 %42
  %72 = icmp slt i32 %71, %44
  %73 = add i32 %71, 165
  %74 = select i1 %72, i32 %73, i32 %71
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 164)
  %76 = call i32 @llvm.smax.i32(i32 %75, i32 0)
  %77 = icmp eq i8 %50, 0
  %78 = zext i1 %77 to i8
  %79 = getelementptr inbounds i8, ptr %10, i32 %22
  %80 = load i8, ptr %79, align 1, !invariant.load !3
  %81 = trunc i8 %80 to i1
  %82 = select i1 %81, i32 -1, i32 1
  %83 = getelementptr inbounds i32, ptr %11, i32 %29
  %84 = load i32, ptr %83, align 4, !invariant.load !3
  %85 = call i32 @llvm.smin.i32(i32 %84, i32 1535)
  %86 = call i32 @llvm.smax.i32(i32 %85, i32 0)
  %87 = getelementptr inbounds i32, ptr %11, i32 %34
  %88 = load i32, ptr %87, align 4, !invariant.load !3
  %89 = call i32 @llvm.smin.i32(i32 %88, i32 13)
  %90 = call i32 @llvm.smax.i32(i32 %89, i32 0)
  %91 = call i8 @fused_and_reduce_bitcast_65_20_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %86, i32 %90)
  %92 = icmp eq i8 %91, 0
  %93 = zext i1 %92 to i8
  %94 = urem i32 %18, 32
  %95 = mul i32 %26, 27225
  %96 = mul i32 %49, 165
  %97 = add i32 %95, %96
  %98 = add i32 %97, %94
  %99 = getelementptr inbounds i8, ptr %1, i32 %98
  %100 = load i8, ptr %99, align 1, !invariant.load !3
  %101 = mul i32 %21, 165
  %102 = mul i32 %19, 1320
  %103 = add i32 %101, %102
  %104 = add i32 %103, %94
  %105 = getelementptr inbounds i8, ptr %0, i32 %104
  %106 = load i8, ptr %105, align 1, !invariant.load !3
  %107 = and i8 %100, %106
  %108 = call i8 @region_23_2538_or_2537_0(i8 0, i8 %107)
  %109 = mul i32 %76, 165
  %110 = add i32 %95, %109
  %111 = add i32 %110, %94
  %112 = getelementptr inbounds i8, ptr %1, i32 %111
  %113 = load i8, ptr %112, align 1, !invariant.load !3
  %114 = and i8 %113, %106
  %115 = call i8 @region_23_2538_clone_or_1090_0(i8 0, i8 %114)
  %116 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %94)
  %117 = getelementptr inbounds i8, ptr %8, i32 %94
  %118 = load i8, ptr %117, align 1, !invariant.load !3
  %119 = zext i32 %94 to i64
  %120 = trunc i64 %119 to i32
  %121 = srem i32 %120, 15
  %122 = add i32 %121, 15
  %123 = trunc i8 %118 to i1
  %124 = select i1 %123, i32 %122, i32 %121
  %125 = icmp sge i32 %124, 1
  %126 = zext i1 %125 to i8
  %127 = icmp sle i32 %124, 13
  %128 = zext i1 %127 to i8
  %129 = select i1 %63, i8 %126, i8 %128
  %130 = add i32 %120, %66
  %131 = call i32 @llvm.smax.i32(i32 %130, i32 0)
  %132 = call i32 @llvm.smin.i32(i32 %131, i32 164)
  %133 = icmp slt i32 %132, 0
  %134 = add i32 %132, 165
  %135 = select i1 %133, i32 %134, i32 %132
  %136 = call i32 @llvm.smin.i32(i32 %135, i32 164)
  %137 = call i32 @llvm.smax.i32(i32 %136, i32 0)
  %138 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %137)
  %139 = and i8 %129, %138
  %140 = or i8 %78, %139
  %141 = and i8 %116, %140
  %142 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %94)
  %143 = select i1 %81, i8 %126, i8 %128
  %144 = add i32 %120, %82
  %145 = call i32 @llvm.smax.i32(i32 %144, i32 0)
  %146 = call i32 @llvm.smin.i32(i32 %145, i32 164)
  %147 = icmp slt i32 %146, 0
  %148 = add i32 %146, 165
  %149 = select i1 %147, i32 %148, i32 %146
  %150 = call i32 @llvm.smin.i32(i32 %149, i32 164)
  %151 = call i32 @llvm.smax.i32(i32 %150, i32 0)
  %152 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %151)
  %153 = and i8 %143, %152
  %154 = or i8 %93, %153
  %155 = and i8 %142, %154
  %156 = getelementptr inbounds i8, ptr %15, i32 %104
  store i8 %141, ptr %156, align 1
  %157 = getelementptr inbounds i8, ptr %16, i32 %104
  store i8 %155, ptr %157, align 1
  %158 = add i32 %94, 32
  %159 = add i32 %98, 32
  %160 = getelementptr inbounds i8, ptr %1, i32 %159
  %161 = load i8, ptr %160, align 1, !invariant.load !3
  %162 = add i32 %104, 32
  %163 = getelementptr inbounds i8, ptr %0, i32 %162
  %164 = load i8, ptr %163, align 1, !invariant.load !3
  %165 = and i8 %161, %164
  %166 = call i8 @region_23_2538_or_2537_0(i8 %108, i8 %165)
  %167 = add i32 %111, 32
  %168 = getelementptr inbounds i8, ptr %1, i32 %167
  %169 = load i8, ptr %168, align 1, !invariant.load !3
  %170 = and i8 %169, %164
  %171 = call i8 @region_23_2538_clone_or_1090_0(i8 %115, i8 %170)
  %172 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %158)
  %173 = getelementptr inbounds i8, ptr %8, i32 %158
  %174 = load i8, ptr %173, align 1, !invariant.load !3
  %175 = zext i32 %158 to i64
  %176 = trunc i64 %175 to i32
  %177 = srem i32 %176, 15
  %178 = add i32 %177, 15
  %179 = trunc i8 %174 to i1
  %180 = select i1 %179, i32 %178, i32 %177
  %181 = icmp sge i32 %180, 1
  %182 = zext i1 %181 to i8
  %183 = icmp sle i32 %180, 13
  %184 = zext i1 %183 to i8
  %185 = select i1 %63, i8 %182, i8 %184
  %186 = add i32 %176, %66
  %187 = call i32 @llvm.smax.i32(i32 %186, i32 0)
  %188 = call i32 @llvm.smin.i32(i32 %187, i32 164)
  %189 = icmp slt i32 %188, 0
  %190 = add i32 %188, 165
  %191 = select i1 %189, i32 %190, i32 %188
  %192 = call i32 @llvm.smin.i32(i32 %191, i32 164)
  %193 = call i32 @llvm.smax.i32(i32 %192, i32 0)
  %194 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %193)
  %195 = and i8 %185, %194
  %196 = or i8 %78, %195
  %197 = and i8 %172, %196
  %198 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %158)
  %199 = select i1 %81, i8 %182, i8 %184
  %200 = add i32 %176, %82
  %201 = call i32 @llvm.smax.i32(i32 %200, i32 0)
  %202 = call i32 @llvm.smin.i32(i32 %201, i32 164)
  %203 = icmp slt i32 %202, 0
  %204 = add i32 %202, 165
  %205 = select i1 %203, i32 %204, i32 %202
  %206 = call i32 @llvm.smin.i32(i32 %205, i32 164)
  %207 = call i32 @llvm.smax.i32(i32 %206, i32 0)
  %208 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %207)
  %209 = and i8 %199, %208
  %210 = or i8 %93, %209
  %211 = and i8 %198, %210
  %212 = getelementptr inbounds i8, ptr %15, i32 %162
  store i8 %197, ptr %212, align 1
  %213 = getelementptr inbounds i8, ptr %16, i32 %162
  store i8 %211, ptr %213, align 1
  %214 = add i32 %94, 64
  %215 = add i32 %98, 64
  %216 = getelementptr inbounds i8, ptr %1, i32 %215
  %217 = load i8, ptr %216, align 1, !invariant.load !3
  %218 = add i32 %104, 64
  %219 = getelementptr inbounds i8, ptr %0, i32 %218
  %220 = load i8, ptr %219, align 1, !invariant.load !3
  %221 = and i8 %217, %220
  %222 = call i8 @region_23_2538_or_2537_0(i8 %166, i8 %221)
  %223 = add i32 %111, 64
  %224 = getelementptr inbounds i8, ptr %1, i32 %223
  %225 = load i8, ptr %224, align 1, !invariant.load !3
  %226 = and i8 %225, %220
  %227 = call i8 @region_23_2538_clone_or_1090_0(i8 %171, i8 %226)
  %228 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %214)
  %229 = getelementptr inbounds i8, ptr %8, i32 %214
  %230 = load i8, ptr %229, align 1, !invariant.load !3
  %231 = zext i32 %214 to i64
  %232 = trunc i64 %231 to i32
  %233 = srem i32 %232, 15
  %234 = add i32 %233, 15
  %235 = trunc i8 %230 to i1
  %236 = select i1 %235, i32 %234, i32 %233
  %237 = icmp sge i32 %236, 1
  %238 = zext i1 %237 to i8
  %239 = icmp sle i32 %236, 13
  %240 = zext i1 %239 to i8
  %241 = select i1 %63, i8 %238, i8 %240
  %242 = add i32 %232, %66
  %243 = call i32 @llvm.smax.i32(i32 %242, i32 0)
  %244 = call i32 @llvm.smin.i32(i32 %243, i32 164)
  %245 = icmp slt i32 %244, 0
  %246 = add i32 %244, 165
  %247 = select i1 %245, i32 %246, i32 %244
  %248 = call i32 @llvm.smin.i32(i32 %247, i32 164)
  %249 = call i32 @llvm.smax.i32(i32 %248, i32 0)
  %250 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %249)
  %251 = and i8 %241, %250
  %252 = or i8 %78, %251
  %253 = and i8 %228, %252
  %254 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %214)
  %255 = select i1 %81, i8 %238, i8 %240
  %256 = add i32 %232, %82
  %257 = call i32 @llvm.smax.i32(i32 %256, i32 0)
  %258 = call i32 @llvm.smin.i32(i32 %257, i32 164)
  %259 = icmp slt i32 %258, 0
  %260 = add i32 %258, 165
  %261 = select i1 %259, i32 %260, i32 %258
  %262 = call i32 @llvm.smin.i32(i32 %261, i32 164)
  %263 = call i32 @llvm.smax.i32(i32 %262, i32 0)
  %264 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %263)
  %265 = and i8 %255, %264
  %266 = or i8 %93, %265
  %267 = and i8 %254, %266
  %268 = getelementptr inbounds i8, ptr %15, i32 %218
  store i8 %253, ptr %268, align 1
  %269 = getelementptr inbounds i8, ptr %16, i32 %218
  store i8 %267, ptr %269, align 1
  %270 = add i32 %94, 96
  %271 = add i32 %98, 96
  %272 = getelementptr inbounds i8, ptr %1, i32 %271
  %273 = load i8, ptr %272, align 1, !invariant.load !3
  %274 = add i32 %104, 96
  %275 = getelementptr inbounds i8, ptr %0, i32 %274
  %276 = load i8, ptr %275, align 1, !invariant.load !3
  %277 = and i8 %273, %276
  %278 = call i8 @region_23_2538_or_2537_0(i8 %222, i8 %277)
  %279 = add i32 %111, 96
  %280 = getelementptr inbounds i8, ptr %1, i32 %279
  %281 = load i8, ptr %280, align 1, !invariant.load !3
  %282 = and i8 %281, %276
  %283 = call i8 @region_23_2538_clone_or_1090_0(i8 %227, i8 %282)
  %284 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %270)
  %285 = getelementptr inbounds i8, ptr %8, i32 %270
  %286 = load i8, ptr %285, align 1, !invariant.load !3
  %287 = zext i32 %270 to i64
  %288 = trunc i64 %287 to i32
  %289 = srem i32 %288, 15
  %290 = add i32 %289, 15
  %291 = trunc i8 %286 to i1
  %292 = select i1 %291, i32 %290, i32 %289
  %293 = icmp sge i32 %292, 1
  %294 = zext i1 %293 to i8
  %295 = icmp sle i32 %292, 13
  %296 = zext i1 %295 to i8
  %297 = select i1 %63, i8 %294, i8 %296
  %298 = add i32 %288, %66
  %299 = call i32 @llvm.smax.i32(i32 %298, i32 0)
  %300 = call i32 @llvm.smin.i32(i32 %299, i32 164)
  %301 = icmp slt i32 %300, 0
  %302 = add i32 %300, 165
  %303 = select i1 %301, i32 %302, i32 %300
  %304 = call i32 @llvm.smin.i32(i32 %303, i32 164)
  %305 = call i32 @llvm.smax.i32(i32 %304, i32 0)
  %306 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %305)
  %307 = and i8 %297, %306
  %308 = or i8 %78, %307
  %309 = and i8 %284, %308
  %310 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %270)
  %311 = select i1 %81, i8 %294, i8 %296
  %312 = add i32 %288, %82
  %313 = call i32 @llvm.smax.i32(i32 %312, i32 0)
  %314 = call i32 @llvm.smin.i32(i32 %313, i32 164)
  %315 = icmp slt i32 %314, 0
  %316 = add i32 %314, 165
  %317 = select i1 %315, i32 %316, i32 %314
  %318 = call i32 @llvm.smin.i32(i32 %317, i32 164)
  %319 = call i32 @llvm.smax.i32(i32 %318, i32 0)
  %320 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %319)
  %321 = and i8 %311, %320
  %322 = or i8 %93, %321
  %323 = and i8 %310, %322
  %324 = getelementptr inbounds i8, ptr %15, i32 %274
  store i8 %309, ptr %324, align 1
  %325 = getelementptr inbounds i8, ptr %16, i32 %274
  store i8 %323, ptr %325, align 1
  %326 = add i32 %94, 128
  %327 = add i32 %98, 128
  %328 = getelementptr inbounds i8, ptr %1, i32 %327
  %329 = load i8, ptr %328, align 1, !invariant.load !3
  %330 = add i32 %104, 128
  %331 = getelementptr inbounds i8, ptr %0, i32 %330
  %332 = load i8, ptr %331, align 1, !invariant.load !3
  %333 = and i8 %329, %332
  %334 = call i8 @region_23_2538_or_2537_0(i8 %278, i8 %333)
  %335 = add i32 %111, 128
  %336 = getelementptr inbounds i8, ptr %1, i32 %335
  %337 = load i8, ptr %336, align 1, !invariant.load !3
  %338 = and i8 %337, %332
  %339 = call i8 @region_23_2538_clone_or_1090_0(i8 %283, i8 %338)
  %340 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %326)
  %341 = getelementptr inbounds i8, ptr %8, i32 %326
  %342 = load i8, ptr %341, align 1, !invariant.load !3
  %343 = zext i32 %326 to i64
  %344 = trunc i64 %343 to i32
  %345 = srem i32 %344, 15
  %346 = add i32 %345, 15
  %347 = trunc i8 %342 to i1
  %348 = select i1 %347, i32 %346, i32 %345
  %349 = icmp sge i32 %348, 1
  %350 = zext i1 %349 to i8
  %351 = icmp sle i32 %348, 13
  %352 = zext i1 %351 to i8
  %353 = select i1 %63, i8 %350, i8 %352
  %354 = add i32 %344, %66
  %355 = call i32 @llvm.smax.i32(i32 %354, i32 0)
  %356 = call i32 @llvm.smin.i32(i32 %355, i32 164)
  %357 = icmp slt i32 %356, 0
  %358 = add i32 %356, 165
  %359 = select i1 %357, i32 %358, i32 %356
  %360 = call i32 @llvm.smin.i32(i32 %359, i32 164)
  %361 = call i32 @llvm.smax.i32(i32 %360, i32 0)
  %362 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %361)
  %363 = and i8 %353, %362
  %364 = or i8 %78, %363
  %365 = and i8 %340, %364
  %366 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %326)
  %367 = select i1 %81, i8 %350, i8 %352
  %368 = add i32 %344, %82
  %369 = call i32 @llvm.smax.i32(i32 %368, i32 0)
  %370 = call i32 @llvm.smin.i32(i32 %369, i32 164)
  %371 = icmp slt i32 %370, 0
  %372 = add i32 %370, 165
  %373 = select i1 %371, i32 %372, i32 %370
  %374 = call i32 @llvm.smin.i32(i32 %373, i32 164)
  %375 = call i32 @llvm.smax.i32(i32 %374, i32 0)
  %376 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %375)
  %377 = and i8 %367, %376
  %378 = or i8 %93, %377
  %379 = and i8 %366, %378
  %380 = getelementptr inbounds i8, ptr %15, i32 %330
  store i8 %365, ptr %380, align 1
  %381 = getelementptr inbounds i8, ptr %16, i32 %330
  store i8 %379, ptr %381, align 1
  %382 = icmp sle i32 %94, 4
  br i1 %382, label %383, label %501

383:                                              ; preds = %17
  %384 = add i32 %94, 160
  %385 = load i32, ptr %30, align 4, !invariant.load !3
  %386 = call i32 @llvm.smin.i32(i32 %385, i32 1535)
  %387 = call i32 @llvm.smax.i32(i32 %386, i32 0)
  %388 = load i32, ptr %35, align 4, !invariant.load !3
  %389 = call i32 @llvm.smin.i32(i32 %388, i32 13)
  %390 = call i32 @llvm.smax.i32(i32 %389, i32 0)
  %391 = mul i32 %387, 14
  %392 = add i32 %391, %390
  %393 = getelementptr inbounds i32, ptr %3, i32 %392
  %394 = load i32, ptr %393, align 4, !invariant.load !3
  %395 = load i32, ptr %43, align 4, !invariant.load !3
  %396 = icmp slt i32 %394, %395
  %397 = add i32 %394, 165
  %398 = select i1 %396, i32 %397, i32 %394
  %399 = call i32 @llvm.smin.i32(i32 %398, i32 164)
  %400 = call i32 @llvm.smax.i32(i32 %399, i32 0)
  %401 = add i32 %94, %95
  %402 = mul i32 %400, 165
  %403 = add i32 %401, %402
  %404 = add i32 %403, 160
  %405 = getelementptr inbounds i8, ptr %1, i32 %404
  %406 = load i8, ptr %405, align 1, !invariant.load !3
  %407 = add i32 %104, 160
  %408 = getelementptr inbounds i8, ptr %0, i32 %407
  %409 = load i8, ptr %408, align 1, !invariant.load !3
  %410 = and i8 %406, %409
  %411 = call i8 @region_23_2538_or_2537_0(i8 %334, i8 %410)
  %412 = call i8 @fused_and_reduce_bitcast_65_20_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %387, i32 %390)
  %413 = load i8, ptr %51, align 1, !invariant.load !3
  %414 = srem i32 %394, 15
  %415 = icmp slt i32 %414, %395
  %416 = icmp ne i32 %414, %395
  %417 = and i1 %415, %416
  %418 = add i32 %414, 15
  %419 = select i1 %417, i32 %418, i32 %414
  %420 = icmp sge i32 %419, 1
  %421 = zext i1 %420 to i8
  %422 = icmp sle i32 %419, 13
  %423 = zext i1 %422 to i8
  %424 = trunc i8 %413 to i1
  %425 = select i1 %424, i8 %421, i8 %423
  %426 = and i8 %412, %425
  %427 = select i1 %424, i32 -1, i32 1
  %428 = add i32 %394, %427
  %429 = call i32 @llvm.smax.i32(i32 %395, i32 %428)
  %430 = call i32 @llvm.smin.i32(i32 %429, i32 164)
  %431 = trunc i8 %426 to i1
  %432 = select i1 %431, i32 %430, i32 %394
  %433 = icmp slt i32 %432, %395
  %434 = add i32 %432, 165
  %435 = select i1 %433, i32 %434, i32 %432
  %436 = call i32 @llvm.smin.i32(i32 %435, i32 164)
  %437 = call i32 @llvm.smax.i32(i32 %436, i32 0)
  %438 = mul i32 %437, 165
  %439 = add i32 %401, %438
  %440 = add i32 %439, 160
  %441 = getelementptr inbounds i8, ptr %1, i32 %440
  %442 = load i8, ptr %441, align 1, !invariant.load !3
  %443 = and i8 %442, %409
  %444 = call i8 @region_23_2538_clone_or_1090_0(i8 %339, i8 %443)
  %445 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %384)
  %446 = getelementptr inbounds i8, ptr %8, i32 %384
  %447 = load i8, ptr %446, align 1, !invariant.load !3
  %448 = zext i32 %384 to i64
  %449 = trunc i64 %448 to i32
  %450 = srem i32 %449, 15
  %451 = add i32 %450, 15
  %452 = trunc i8 %447 to i1
  %453 = select i1 %452, i32 %451, i32 %450
  %454 = icmp sge i32 %453, 1
  %455 = zext i1 %454 to i8
  %456 = icmp sle i32 %453, 13
  %457 = zext i1 %456 to i8
  %458 = select i1 %424, i8 %455, i8 %457
  %459 = add i32 %449, %427
  %460 = call i32 @llvm.smax.i32(i32 %459, i32 0)
  %461 = call i32 @llvm.smin.i32(i32 %460, i32 164)
  %462 = icmp slt i32 %461, 0
  %463 = add i32 %461, 165
  %464 = select i1 %462, i32 %463, i32 %461
  %465 = call i32 @llvm.smin.i32(i32 %464, i32 164)
  %466 = call i32 @llvm.smax.i32(i32 %465, i32 0)
  %467 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %466)
  %468 = icmp eq i8 %412, 0
  %469 = zext i1 %468 to i8
  %470 = and i8 %458, %467
  %471 = or i8 %469, %470
  %472 = and i8 %445, %471
  %473 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %22, i32 %384)
  %474 = load i8, ptr %79, align 1, !invariant.load !3
  %475 = trunc i8 %474 to i1
  %476 = select i1 %475, i8 %455, i8 %457
  %477 = select i1 %475, i32 -1, i32 1
  %478 = add i32 %449, %477
  %479 = call i32 @llvm.smax.i32(i32 %478, i32 0)
  %480 = call i32 @llvm.smin.i32(i32 %479, i32 164)
  %481 = icmp slt i32 %480, 0
  %482 = add i32 %480, 165
  %483 = select i1 %481, i32 %482, i32 %480
  %484 = call i32 @llvm.smin.i32(i32 %483, i32 164)
  %485 = call i32 @llvm.smax.i32(i32 %484, i32 0)
  %486 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %26, i32 %485)
  %487 = load i32, ptr %83, align 4, !invariant.load !3
  %488 = call i32 @llvm.smin.i32(i32 %487, i32 1535)
  %489 = call i32 @llvm.smax.i32(i32 %488, i32 0)
  %490 = load i32, ptr %87, align 4, !invariant.load !3
  %491 = call i32 @llvm.smin.i32(i32 %490, i32 13)
  %492 = call i32 @llvm.smax.i32(i32 %491, i32 0)
  %493 = call i8 @fused_and_reduce_bitcast_65_20_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, ptr %12, i32 %489, i32 %492)
  %494 = icmp eq i8 %493, 0
  %495 = zext i1 %494 to i8
  %496 = and i8 %476, %486
  %497 = or i8 %495, %496
  %498 = and i8 %473, %497
  %499 = getelementptr inbounds i8, ptr %15, i32 %407
  store i8 %472, ptr %499, align 1
  %500 = getelementptr inbounds i8, ptr %16, i32 %407
  store i8 %498, ptr %500, align 1
  br label %502

501:                                              ; preds = %17
  br label %502

502:                                              ; preds = %383, %501
  %503 = phi i8 [ %339, %501 ], [ %444, %383 ]
  %504 = phi i8 [ %334, %501 ], [ %411, %383 ]
  br label %505

505:                                              ; preds = %502
  %506 = zext i8 %504 to i32
  %507 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %506, i32 16, i32 31)
  %508 = trunc i32 %507 to i8
  %509 = call i8 @region_23_2538_or_2537_0(i8 %504, i8 %508)
  %510 = zext i8 %509 to i32
  %511 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %510, i32 8, i32 31)
  %512 = trunc i32 %511 to i8
  %513 = call i8 @region_23_2538_or_2537_0(i8 %509, i8 %512)
  %514 = zext i8 %513 to i32
  %515 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %514, i32 4, i32 31)
  %516 = trunc i32 %515 to i8
  %517 = call i8 @region_23_2538_or_2537_0(i8 %513, i8 %516)
  %518 = zext i8 %517 to i32
  %519 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %518, i32 2, i32 31)
  %520 = trunc i32 %519 to i8
  %521 = call i8 @region_23_2538_or_2537_0(i8 %517, i8 %520)
  %522 = zext i8 %521 to i32
  %523 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %522, i32 1, i32 31)
  %524 = trunc i32 %523 to i8
  %525 = call i8 @region_23_2538_or_2537_0(i8 %521, i8 %524)
  %526 = zext i8 %503 to i32
  %527 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %526, i32 16, i32 31)
  %528 = trunc i32 %527 to i8
  %529 = call i8 @region_23_2538_clone_or_1090_0(i8 %503, i8 %528)
  %530 = zext i8 %529 to i32
  %531 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %530, i32 8, i32 31)
  %532 = trunc i32 %531 to i8
  %533 = call i8 @region_23_2538_clone_or_1090_0(i8 %529, i8 %532)
  %534 = zext i8 %533 to i32
  %535 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %534, i32 4, i32 31)
  %536 = trunc i32 %535 to i8
  %537 = call i8 @region_23_2538_clone_or_1090_0(i8 %533, i8 %536)
  %538 = zext i8 %537 to i32
  %539 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %538, i32 2, i32 31)
  %540 = trunc i32 %539 to i8
  %541 = call i8 @region_23_2538_clone_or_1090_0(i8 %537, i8 %540)
  %542 = zext i8 %541 to i32
  %543 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %542, i32 1, i32 31)
  %544 = trunc i32 %543 to i8
  %545 = call i8 @region_23_2538_clone_or_1090_0(i8 %541, i8 %544)
  %546 = icmp eq i32 %94, 0
  %547 = icmp sle i32 %18, 224
  %548 = and i1 %546, %547
  br i1 %548, label %549, label %552

549:                                              ; preds = %505
  %550 = getelementptr inbounds i8, ptr %13, i32 %22
  store i8 %525, ptr %550, align 1
  %551 = getelementptr inbounds i8, ptr %14, i32 %22
  store i8 %545, ptr %551, align 1
  br label %552

552:                                              ; preds = %549, %505
  ret void
}

define internal i8 @fused_and_reduce_bitcast_65_20_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, ptr noalias %11, ptr noalias %12, i32 %13, i32 %14) {
  %16 = mul i32 %13, 14
  %17 = add i32 %16, %14
  %18 = getelementptr inbounds i32, ptr %7, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  %20 = icmp slt i32 %19, 0
  %21 = add i32 %19, 101
  %22 = select i1 %20, i32 %21, i32 %19
  %23 = call i32 @llvm.smin.i32(i32 %22, i32 100)
  %24 = call i32 @llvm.smax.i32(i32 %23, i32 0)
  %25 = mul i32 %24, 20
  %26 = add i32 %25, 9
  %27 = getelementptr inbounds float, ptr %6, i32 %26
  %28 = load float, ptr %27, align 4, !invariant.load !3
  %29 = fcmp ogt float %28, 0.000000e+00
  %30 = zext i1 %29 to i8
  ret i8 %30
}

define internal i8 @region_23_2538_or_2537_0(i8 %0, i8 %1) {
  %3 = or i8 %0, %1
  ret i8 %3
}

define internal i8 @region_23_2538_clone_or_1090_0(i8 %0, i8 %1) {
  %3 = or i8 %0, %1
  ret i8 %3
}

define internal i8 @fused_and_reduce_not_2084_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, ptr noalias %11, ptr noalias %12, i32 %13, i32 %14) {
  %16 = mul i32 %13, 165
  %17 = add i32 %16, %14
  %18 = getelementptr inbounds i8, ptr %9, i32 %17
  %19 = load i8, ptr %18, align 1, !invariant.load !3
  %20 = icmp eq i8 %19, 0
  %21 = zext i1 %20 to i8
  ret i8 %21
}

define internal i8 @fused_and_reduce_not_3018_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, ptr noalias %11, ptr noalias %12, i32 %13, i32 %14) {
  %16 = mul i32 %13, 165
  %17 = add i32 %16, %14
  %18 = getelementptr inbounds i8, ptr %12, i32 %17
  %19 = load i8, ptr %18, align 1, !invariant.load !3
  %20 = icmp eq i8 %19, 0
  %21 = zext i1 %20 to i8
  ret i8 %21
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #6

define ptx_kernel void @input_scatter_fusion_35(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(6144) %1, ptr noalias align 256 dereferenceable(86016) %2, ptr noalias align 256 dereferenceable(12288) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %5
  %9 = call i32 @fused_scatter_35_concatenate_59_3(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 0)
  %10 = call i32 @fused_scatter_35_concatenate_59_3(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 1)
  %11 = icmp ule i32 %9, 1535
  %12 = icmp ule i32 %10, 164
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %18

14:                                               ; preds = %4
  %15 = mul i32 %9, 165
  %16 = add i32 %15, %10
  %17 = getelementptr inbounds i8, ptr %0, i32 %16
  store i8 1, ptr %17, align 1
  br label %18

18:                                               ; preds = %14, %4
  ret void
}

define internal i32 @fused_scatter_35_concatenate_59_3(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = icmp ult i32 %5, 1
  br i1 %7, label %8, label %11

8:                                                ; preds = %6
  %9 = zext i32 %4 to i64
  %10 = trunc i64 %9 to i32
  br label %31

11:                                               ; preds = %6
  %12 = getelementptr inbounds i32, ptr %1, i32 %4
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = mul i32 %4, 2
  %15 = getelementptr inbounds i32, ptr %3, i32 %14
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = call i32 @llvm.smin.i32(i32 %16, i32 1535)
  %18 = call i32 @llvm.smax.i32(i32 %17, i32 0)
  %19 = add i32 %14, 1
  %20 = getelementptr inbounds i32, ptr %3, i32 %19
  %21 = load i32, ptr %20, align 4, !invariant.load !3
  %22 = call i32 @llvm.smin.i32(i32 %21, i32 13)
  %23 = call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = mul i32 %18, 14
  %25 = add i32 %24, %23
  %26 = getelementptr inbounds i32, ptr %2, i32 %25
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  %28 = icmp slt i32 %27, %13
  %29 = add i32 %27, 165
  %30 = select i1 %28, i32 %29, i32 %27
  br label %31

31:                                               ; preds = %8, %11
  %32 = phi i32 [ %30, %11 ], [ %10, %8 ]
  br label %33

33:                                               ; preds = %31
  ret i32 %32
}

define ptx_kernel void @loop_compare_fusion(ptr noalias align 256 dereferenceable(4) %0, ptr noalias align 256 dereferenceable(1) %1) #7 {
  %3 = load i32, ptr %0, align 4, !invariant.load !3
  %4 = icmp slt i32 %3, 20
  %5 = zext i1 %4 to i8
  store i8 %5, ptr %1, align 1
  ret void
}

define ptx_kernel void @input_reduce_fusion(ptr noalias align 256 dereferenceable(41817600) %0, ptr noalias align 256 dereferenceable(253440) %1, ptr noalias align 256 dereferenceable(253440) %2) #5 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !15
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !17
  %6 = udiv i32 %4, 32
  %7 = mul i32 %6, 165
  %8 = mul i32 %5, 1320
  %9 = add i32 %7, %8
  %10 = urem i32 %4, 32
  %11 = add i32 %9, %10
  %12 = getelementptr inbounds i8, ptr %0, i32 %11
  %13 = load i8, ptr %12, align 1, !invariant.load !3
  %14 = mul i32 %5, 256
  %15 = add i32 %14, %4
  %16 = udiv i32 %15, 5280
  %17 = mul i32 %16, 165
  %18 = add i32 %17, %10
  %19 = getelementptr inbounds i8, ptr %1, i32 %18
  %20 = load i8, ptr %19, align 1, !invariant.load !3
  %21 = and i8 %13, %20
  %22 = call i8 @scalar_add_computation_add_2145_0(i8 0, i8 %21)
  %23 = add i32 %11, 32
  %24 = getelementptr inbounds i8, ptr %0, i32 %23
  %25 = load i8, ptr %24, align 1, !invariant.load !3
  %26 = add i32 %18, 32
  %27 = getelementptr inbounds i8, ptr %1, i32 %26
  %28 = load i8, ptr %27, align 1, !invariant.load !3
  %29 = and i8 %25, %28
  %30 = call i8 @scalar_add_computation_add_2145_0(i8 %22, i8 %29)
  %31 = add i32 %11, 64
  %32 = getelementptr inbounds i8, ptr %0, i32 %31
  %33 = load i8, ptr %32, align 1, !invariant.load !3
  %34 = add i32 %18, 64
  %35 = getelementptr inbounds i8, ptr %1, i32 %34
  %36 = load i8, ptr %35, align 1, !invariant.load !3
  %37 = and i8 %33, %36
  %38 = call i8 @scalar_add_computation_add_2145_0(i8 %30, i8 %37)
  %39 = add i32 %11, 96
  %40 = getelementptr inbounds i8, ptr %0, i32 %39
  %41 = load i8, ptr %40, align 1, !invariant.load !3
  %42 = add i32 %18, 96
  %43 = getelementptr inbounds i8, ptr %1, i32 %42
  %44 = load i8, ptr %43, align 1, !invariant.load !3
  %45 = and i8 %41, %44
  %46 = call i8 @scalar_add_computation_add_2145_0(i8 %38, i8 %45)
  %47 = add i32 %11, 128
  %48 = getelementptr inbounds i8, ptr %0, i32 %47
  %49 = load i8, ptr %48, align 1, !invariant.load !3
  %50 = add i32 %18, 128
  %51 = getelementptr inbounds i8, ptr %1, i32 %50
  %52 = load i8, ptr %51, align 1, !invariant.load !3
  %53 = and i8 %49, %52
  %54 = call i8 @scalar_add_computation_add_2145_0(i8 %46, i8 %53)
  %55 = icmp sle i32 %10, 4
  br i1 %55, label %56, label %65

56:                                               ; preds = %3
  %57 = add i32 %11, 160
  %58 = getelementptr inbounds i8, ptr %0, i32 %57
  %59 = load i8, ptr %58, align 1, !invariant.load !3
  %60 = add i32 %18, 160
  %61 = getelementptr inbounds i8, ptr %1, i32 %60
  %62 = load i8, ptr %61, align 1, !invariant.load !3
  %63 = and i8 %59, %62
  %64 = call i8 @scalar_add_computation_add_2145_0(i8 %54, i8 %63)
  br label %66

65:                                               ; preds = %3
  br label %66

66:                                               ; preds = %56, %65
  %67 = phi i8 [ %54, %65 ], [ %64, %56 ]
  br label %68

68:                                               ; preds = %66
  %69 = zext i8 %67 to i32
  %70 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %69, i32 16, i32 31)
  %71 = trunc i32 %70 to i8
  %72 = call i8 @scalar_add_computation_add_2145_0(i8 %67, i8 %71)
  %73 = zext i8 %72 to i32
  %74 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %73, i32 8, i32 31)
  %75 = trunc i32 %74 to i8
  %76 = call i8 @scalar_add_computation_add_2145_0(i8 %72, i8 %75)
  %77 = zext i8 %76 to i32
  %78 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %77, i32 4, i32 31)
  %79 = trunc i32 %78 to i8
  %80 = call i8 @scalar_add_computation_add_2145_0(i8 %76, i8 %79)
  %81 = zext i8 %80 to i32
  %82 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %81, i32 2, i32 31)
  %83 = trunc i32 %82 to i8
  %84 = call i8 @scalar_add_computation_add_2145_0(i8 %80, i8 %83)
  %85 = zext i8 %84 to i32
  %86 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %85, i32 1, i32 31)
  %87 = trunc i32 %86 to i8
  %88 = call i8 @scalar_add_computation_add_2145_0(i8 %84, i8 %87)
  %89 = icmp eq i32 %10, 0
  %90 = icmp sle i32 %4, 224
  %91 = and i1 %89, %90
  br i1 %91, label %92, label %96

92:                                               ; preds = %68
  %93 = mul i32 %5, 8
  %94 = add i32 %93, %6
  %95 = getelementptr inbounds i8, ptr %2, i32 %94
  store i8 %88, ptr %95, align 1
  br label %96

96:                                               ; preds = %92, %68
  ret void
}

define internal i8 @scalar_add_computation_add_2145_0(i8 %0, i8 %1) {
  %3 = or i8 %0, %1
  ret i8 %3
}

define ptx_kernel void @loop_select_fusion(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(253440) %1, ptr noalias align 256 dereferenceable(253440) %2, ptr noalias align 256 dereferenceable(6144) %3, ptr noalias align 256 dereferenceable(4) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = load i32, ptr %4, align 4, !invariant.load !3
  %9 = mul i32 %7, 4
  %10 = mul i32 %6, 512
  %11 = add i32 %9, %10
  %12 = getelementptr inbounds i8, ptr %0, i32 %11
  %13 = load <4 x i8>, ptr %12, align 4
  %14 = getelementptr inbounds i8, ptr %2, i32 %11
  %15 = load <4 x i8>, ptr %14, align 4, !invariant.load !3
  %16 = getelementptr inbounds i8, ptr %1, i32 %11
  %17 = load <4 x i8>, ptr %16, align 4, !invariant.load !3
  %18 = udiv i32 %11, 165
  %19 = extractelement <4 x i8> %17, i64 0
  %20 = extractelement <4 x i8> %15, i64 0
  %21 = and i8 %19, %20
  %22 = getelementptr inbounds i32, ptr %3, i32 %18
  %23 = load i32, ptr %22, align 4, !invariant.load !3
  %24 = icmp slt i32 %8, %23
  %25 = extractelement <4 x i8> %13, i64 0
  %26 = or i8 %25, %21
  %27 = select i1 %24, i8 %26, i8 %25
  %28 = insertelement <4 x i8> zeroinitializer, i8 %27, i64 0
  %29 = add i32 %11, 1
  %30 = udiv i32 %29, 165
  %31 = extractelement <4 x i8> %17, i64 1
  %32 = extractelement <4 x i8> %15, i64 1
  %33 = and i8 %31, %32
  %34 = getelementptr inbounds i32, ptr %3, i32 %30
  %35 = load i32, ptr %34, align 4, !invariant.load !3
  %36 = icmp slt i32 %8, %35
  %37 = extractelement <4 x i8> %13, i64 1
  %38 = or i8 %37, %33
  %39 = select i1 %36, i8 %38, i8 %37
  %40 = insertelement <4 x i8> %28, i8 %39, i64 1
  %41 = add i32 %11, 2
  %42 = udiv i32 %41, 165
  %43 = extractelement <4 x i8> %17, i64 2
  %44 = extractelement <4 x i8> %15, i64 2
  %45 = and i8 %43, %44
  %46 = getelementptr inbounds i32, ptr %3, i32 %42
  %47 = load i32, ptr %46, align 4, !invariant.load !3
  %48 = icmp slt i32 %8, %47
  %49 = extractelement <4 x i8> %13, i64 2
  %50 = or i8 %49, %45
  %51 = select i1 %48, i8 %50, i8 %49
  %52 = insertelement <4 x i8> %40, i8 %51, i64 2
  %53 = add i32 %11, 3
  %54 = udiv i32 %53, 165
  %55 = extractelement <4 x i8> %17, i64 3
  %56 = extractelement <4 x i8> %15, i64 3
  %57 = and i8 %55, %56
  %58 = getelementptr inbounds i32, ptr %3, i32 %54
  %59 = load i32, ptr %58, align 4, !invariant.load !3
  %60 = icmp slt i32 %8, %59
  %61 = extractelement <4 x i8> %13, i64 3
  %62 = or i8 %61, %57
  %63 = select i1 %60, i8 %62, i8 %61
  %64 = insertelement <4 x i8> %52, i8 %63, i64 3
  store <4 x i8> %64, ptr %12, align 4
  ret void
}

define ptx_kernel void @loop_add_fusion(ptr noalias align 256 dereferenceable(4) %0) #7 {
  %2 = load i32, ptr %0, align 4
  %3 = add i32 %2, 1
  store i32 %3, ptr %0, align 4
  ret void
}

define ptx_kernel void @loop_select_fusion_4(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias align 256 dereferenceable(253440) %1, ptr noalias align 256 dereferenceable(108900) %2, ptr noalias align 256 dereferenceable(6144) %3, ptr noalias align 256 dereferenceable(86016) %4, ptr noalias align 256 dereferenceable(12288) %5, ptr noalias align 256 dereferenceable(8080) %6, ptr noalias align 256 dereferenceable(86016) %7, ptr noalias align 256 dereferenceable(253440) %8, ptr noalias align 256 dereferenceable(253440) %9, ptr noalias align 256 dereferenceable(12288) %10, ptr noalias align 256 dereferenceable(253440) %11, ptr noalias align 256 dereferenceable(253440) %12) #0 {
  %14 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %15 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %16 = mul i32 %15, 4
  %17 = mul i32 %14, 512
  %18 = add i32 %16, %17
  %19 = getelementptr inbounds i8, ptr %8, i32 %18
  %20 = load <4 x i8>, ptr %19, align 4, !invariant.load !3
  %21 = getelementptr inbounds i8, ptr %9, i32 %18
  %22 = load <4 x i8>, ptr %21, align 4, !invariant.load !3
  %23 = getelementptr inbounds i8, ptr %0, i32 %18
  %24 = load <4 x i8>, ptr %23, align 4, !invariant.load !3
  %25 = getelementptr inbounds i8, ptr %1, i32 %18
  %26 = load <4 x i8>, ptr %25, align 4, !invariant.load !3
  %27 = udiv i32 %18, 165
  %28 = urem i32 %18, 165
  %29 = mul i32 %27, 2
  %30 = getelementptr inbounds i32, ptr %5, i32 %29
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = call i32 @llvm.smin.i32(i32 %31, i32 1535)
  %33 = call i32 @llvm.smax.i32(i32 %32, i32 0)
  %34 = add i32 %29, 1
  %35 = getelementptr inbounds i32, ptr %5, i32 %34
  %36 = load i32, ptr %35, align 4, !invariant.load !3
  %37 = call i32 @llvm.smin.i32(i32 %36, i32 13)
  %38 = call i32 @llvm.smax.i32(i32 %37, i32 0)
  %39 = mul i32 %33, 14
  %40 = add i32 %39, %38
  %41 = getelementptr inbounds i32, ptr %4, i32 %40
  %42 = load i32, ptr %41, align 4, !invariant.load !3
  %43 = getelementptr inbounds i32, ptr %3, i32 %27
  %44 = load i32, ptr %43, align 4, !invariant.load !3
  %45 = icmp slt i32 %42, %44
  %46 = add i32 %42, 165
  %47 = select i1 %45, i32 %46, i32 %42
  %48 = call i32 @llvm.smin.i32(i32 %47, i32 164)
  %49 = call i32 @llvm.smax.i32(i32 %48, i32 0)
  %50 = mul i32 %49, 165
  %51 = add i32 %50, %28
  %52 = getelementptr inbounds i32, ptr %2, i32 %51
  %53 = load i32, ptr %52, align 4, !invariant.load !3
  %54 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 5, i32 %33, i32 %38)
  %55 = fptosi float %54 to i32
  %56 = fcmp ole float %54, 0xC1E0000000000000
  %57 = select i1 %56, i32 -2147483648, i32 %55
  %58 = fcmp oge float %54, 0x41E0000000000000
  %59 = select i1 %58, i32 2147483647, i32 %57
  %60 = fcmp uno float %54, %54
  %61 = select i1 %60, i32 0, i32 %59
  %62 = icmp sle i32 %53, %61
  %63 = zext i1 %62 to i8
  %64 = extractelement <4 x i8> %26, i64 0
  %65 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 7, i32 %33, i32 %38)
  %66 = fcmp ogt float %65, 0.000000e+00
  %67 = zext i1 %66 to i32
  %68 = icmp slt i32 %67, 1
  %69 = extractelement <4 x i8> %24, i64 0
  %70 = and i8 %63, %64
  %71 = select i1 %68, i8 %69, i8 %70
  %72 = getelementptr inbounds i32, ptr %10, i32 %29
  %73 = load i32, ptr %72, align 4, !invariant.load !3
  %74 = call i32 @llvm.smin.i32(i32 %73, i32 1535)
  %75 = call i32 @llvm.smax.i32(i32 %74, i32 0)
  %76 = getelementptr inbounds i32, ptr %10, i32 %34
  %77 = load i32, ptr %76, align 4, !invariant.load !3
  %78 = call i32 @llvm.smin.i32(i32 %77, i32 13)
  %79 = call i32 @llvm.smax.i32(i32 %78, i32 0)
  %80 = mul i32 %75, 14
  %81 = add i32 %80, %79
  %82 = getelementptr inbounds i32, ptr %4, i32 %81
  %83 = load i32, ptr %82, align 4, !invariant.load !3
  %84 = icmp slt i32 %83, %44
  %85 = add i32 %83, 165
  %86 = select i1 %84, i32 %85, i32 %83
  %87 = call i32 @llvm.smin.i32(i32 %86, i32 164)
  %88 = call i32 @llvm.smax.i32(i32 %87, i32 0)
  %89 = mul i32 %88, 165
  %90 = add i32 %89, %28
  %91 = getelementptr inbounds i32, ptr %2, i32 %90
  %92 = load i32, ptr %91, align 4, !invariant.load !3
  %93 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 5, i32 %75, i32 %79)
  %94 = fptosi float %93 to i32
  %95 = fcmp ole float %93, 0xC1E0000000000000
  %96 = select i1 %95, i32 -2147483648, i32 %94
  %97 = fcmp oge float %93, 0x41E0000000000000
  %98 = select i1 %97, i32 2147483647, i32 %96
  %99 = fcmp uno float %93, %93
  %100 = select i1 %99, i32 0, i32 %98
  %101 = icmp sle i32 %92, %100
  %102 = zext i1 %101 to i8
  %103 = extractelement <4 x i8> %22, i64 0
  %104 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 7, i32 %75, i32 %79)
  %105 = fcmp ogt float %104, 0.000000e+00
  %106 = zext i1 %105 to i32
  %107 = icmp slt i32 %106, 1
  %108 = extractelement <4 x i8> %20, i64 0
  %109 = and i8 %102, %103
  %110 = select i1 %107, i8 %108, i8 %109
  %111 = insertelement <4 x i8> zeroinitializer, i8 %110, i64 0
  %112 = insertelement <4 x i8> zeroinitializer, i8 %71, i64 0
  %113 = add i32 %18, 1
  %114 = udiv i32 %113, 165
  %115 = urem i32 %113, 165
  %116 = mul i32 %114, 2
  %117 = getelementptr inbounds i32, ptr %5, i32 %116
  %118 = load i32, ptr %117, align 4, !invariant.load !3
  %119 = call i32 @llvm.smin.i32(i32 %118, i32 1535)
  %120 = call i32 @llvm.smax.i32(i32 %119, i32 0)
  %121 = add i32 %116, 1
  %122 = getelementptr inbounds i32, ptr %5, i32 %121
  %123 = load i32, ptr %122, align 4, !invariant.load !3
  %124 = call i32 @llvm.smin.i32(i32 %123, i32 13)
  %125 = call i32 @llvm.smax.i32(i32 %124, i32 0)
  %126 = mul i32 %120, 14
  %127 = add i32 %126, %125
  %128 = getelementptr inbounds i32, ptr %4, i32 %127
  %129 = load i32, ptr %128, align 4, !invariant.load !3
  %130 = getelementptr inbounds i32, ptr %3, i32 %114
  %131 = load i32, ptr %130, align 4, !invariant.load !3
  %132 = icmp slt i32 %129, %131
  %133 = add i32 %129, 165
  %134 = select i1 %132, i32 %133, i32 %129
  %135 = call i32 @llvm.smin.i32(i32 %134, i32 164)
  %136 = call i32 @llvm.smax.i32(i32 %135, i32 0)
  %137 = mul i32 %136, 165
  %138 = add i32 %137, %115
  %139 = getelementptr inbounds i32, ptr %2, i32 %138
  %140 = load i32, ptr %139, align 4, !invariant.load !3
  %141 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 5, i32 %120, i32 %125)
  %142 = fptosi float %141 to i32
  %143 = fcmp ole float %141, 0xC1E0000000000000
  %144 = select i1 %143, i32 -2147483648, i32 %142
  %145 = fcmp oge float %141, 0x41E0000000000000
  %146 = select i1 %145, i32 2147483647, i32 %144
  %147 = fcmp uno float %141, %141
  %148 = select i1 %147, i32 0, i32 %146
  %149 = icmp sle i32 %140, %148
  %150 = zext i1 %149 to i8
  %151 = extractelement <4 x i8> %26, i64 1
  %152 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 7, i32 %120, i32 %125)
  %153 = fcmp ogt float %152, 0.000000e+00
  %154 = zext i1 %153 to i32
  %155 = icmp slt i32 %154, 1
  %156 = extractelement <4 x i8> %24, i64 1
  %157 = and i8 %150, %151
  %158 = select i1 %155, i8 %156, i8 %157
  %159 = getelementptr inbounds i32, ptr %10, i32 %116
  %160 = load i32, ptr %159, align 4, !invariant.load !3
  %161 = call i32 @llvm.smin.i32(i32 %160, i32 1535)
  %162 = call i32 @llvm.smax.i32(i32 %161, i32 0)
  %163 = getelementptr inbounds i32, ptr %10, i32 %121
  %164 = load i32, ptr %163, align 4, !invariant.load !3
  %165 = call i32 @llvm.smin.i32(i32 %164, i32 13)
  %166 = call i32 @llvm.smax.i32(i32 %165, i32 0)
  %167 = mul i32 %162, 14
  %168 = add i32 %167, %166
  %169 = getelementptr inbounds i32, ptr %4, i32 %168
  %170 = load i32, ptr %169, align 4, !invariant.load !3
  %171 = icmp slt i32 %170, %131
  %172 = add i32 %170, 165
  %173 = select i1 %171, i32 %172, i32 %170
  %174 = call i32 @llvm.smin.i32(i32 %173, i32 164)
  %175 = call i32 @llvm.smax.i32(i32 %174, i32 0)
  %176 = mul i32 %175, 165
  %177 = add i32 %176, %115
  %178 = getelementptr inbounds i32, ptr %2, i32 %177
  %179 = load i32, ptr %178, align 4, !invariant.load !3
  %180 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 5, i32 %162, i32 %166)
  %181 = fptosi float %180 to i32
  %182 = fcmp ole float %180, 0xC1E0000000000000
  %183 = select i1 %182, i32 -2147483648, i32 %181
  %184 = fcmp oge float %180, 0x41E0000000000000
  %185 = select i1 %184, i32 2147483647, i32 %183
  %186 = fcmp uno float %180, %180
  %187 = select i1 %186, i32 0, i32 %185
  %188 = icmp sle i32 %179, %187
  %189 = zext i1 %188 to i8
  %190 = extractelement <4 x i8> %22, i64 1
  %191 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 7, i32 %162, i32 %166)
  %192 = fcmp ogt float %191, 0.000000e+00
  %193 = zext i1 %192 to i32
  %194 = icmp slt i32 %193, 1
  %195 = extractelement <4 x i8> %20, i64 1
  %196 = and i8 %189, %190
  %197 = select i1 %194, i8 %195, i8 %196
  %198 = insertelement <4 x i8> %111, i8 %197, i64 1
  %199 = insertelement <4 x i8> %112, i8 %158, i64 1
  %200 = add i32 %18, 2
  %201 = udiv i32 %200, 165
  %202 = urem i32 %200, 165
  %203 = mul i32 %201, 2
  %204 = getelementptr inbounds i32, ptr %5, i32 %203
  %205 = load i32, ptr %204, align 4, !invariant.load !3
  %206 = call i32 @llvm.smin.i32(i32 %205, i32 1535)
  %207 = call i32 @llvm.smax.i32(i32 %206, i32 0)
  %208 = add i32 %203, 1
  %209 = getelementptr inbounds i32, ptr %5, i32 %208
  %210 = load i32, ptr %209, align 4, !invariant.load !3
  %211 = call i32 @llvm.smin.i32(i32 %210, i32 13)
  %212 = call i32 @llvm.smax.i32(i32 %211, i32 0)
  %213 = mul i32 %207, 14
  %214 = add i32 %213, %212
  %215 = getelementptr inbounds i32, ptr %4, i32 %214
  %216 = load i32, ptr %215, align 4, !invariant.load !3
  %217 = getelementptr inbounds i32, ptr %3, i32 %201
  %218 = load i32, ptr %217, align 4, !invariant.load !3
  %219 = icmp slt i32 %216, %218
  %220 = add i32 %216, 165
  %221 = select i1 %219, i32 %220, i32 %216
  %222 = call i32 @llvm.smin.i32(i32 %221, i32 164)
  %223 = call i32 @llvm.smax.i32(i32 %222, i32 0)
  %224 = mul i32 %223, 165
  %225 = add i32 %224, %202
  %226 = getelementptr inbounds i32, ptr %2, i32 %225
  %227 = load i32, ptr %226, align 4, !invariant.load !3
  %228 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 5, i32 %207, i32 %212)
  %229 = fptosi float %228 to i32
  %230 = fcmp ole float %228, 0xC1E0000000000000
  %231 = select i1 %230, i32 -2147483648, i32 %229
  %232 = fcmp oge float %228, 0x41E0000000000000
  %233 = select i1 %232, i32 2147483647, i32 %231
  %234 = fcmp uno float %228, %228
  %235 = select i1 %234, i32 0, i32 %233
  %236 = icmp sle i32 %227, %235
  %237 = zext i1 %236 to i8
  %238 = extractelement <4 x i8> %26, i64 2
  %239 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 7, i32 %207, i32 %212)
  %240 = fcmp ogt float %239, 0.000000e+00
  %241 = zext i1 %240 to i32
  %242 = icmp slt i32 %241, 1
  %243 = extractelement <4 x i8> %24, i64 2
  %244 = and i8 %237, %238
  %245 = select i1 %242, i8 %243, i8 %244
  %246 = getelementptr inbounds i32, ptr %10, i32 %203
  %247 = load i32, ptr %246, align 4, !invariant.load !3
  %248 = call i32 @llvm.smin.i32(i32 %247, i32 1535)
  %249 = call i32 @llvm.smax.i32(i32 %248, i32 0)
  %250 = getelementptr inbounds i32, ptr %10, i32 %208
  %251 = load i32, ptr %250, align 4, !invariant.load !3
  %252 = call i32 @llvm.smin.i32(i32 %251, i32 13)
  %253 = call i32 @llvm.smax.i32(i32 %252, i32 0)
  %254 = mul i32 %249, 14
  %255 = add i32 %254, %253
  %256 = getelementptr inbounds i32, ptr %4, i32 %255
  %257 = load i32, ptr %256, align 4, !invariant.load !3
  %258 = icmp slt i32 %257, %218
  %259 = add i32 %257, 165
  %260 = select i1 %258, i32 %259, i32 %257
  %261 = call i32 @llvm.smin.i32(i32 %260, i32 164)
  %262 = call i32 @llvm.smax.i32(i32 %261, i32 0)
  %263 = mul i32 %262, 165
  %264 = add i32 %263, %202
  %265 = getelementptr inbounds i32, ptr %2, i32 %264
  %266 = load i32, ptr %265, align 4, !invariant.load !3
  %267 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 5, i32 %249, i32 %253)
  %268 = fptosi float %267 to i32
  %269 = fcmp ole float %267, 0xC1E0000000000000
  %270 = select i1 %269, i32 -2147483648, i32 %268
  %271 = fcmp oge float %267, 0x41E0000000000000
  %272 = select i1 %271, i32 2147483647, i32 %270
  %273 = fcmp uno float %267, %267
  %274 = select i1 %273, i32 0, i32 %272
  %275 = icmp sle i32 %266, %274
  %276 = zext i1 %275 to i8
  %277 = extractelement <4 x i8> %22, i64 2
  %278 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 7, i32 %249, i32 %253)
  %279 = fcmp ogt float %278, 0.000000e+00
  %280 = zext i1 %279 to i32
  %281 = icmp slt i32 %280, 1
  %282 = extractelement <4 x i8> %20, i64 2
  %283 = and i8 %276, %277
  %284 = select i1 %281, i8 %282, i8 %283
  %285 = insertelement <4 x i8> %198, i8 %284, i64 2
  %286 = insertelement <4 x i8> %199, i8 %245, i64 2
  %287 = add i32 %18, 3
  %288 = udiv i32 %287, 165
  %289 = urem i32 %287, 165
  %290 = mul i32 %288, 2
  %291 = getelementptr inbounds i32, ptr %5, i32 %290
  %292 = load i32, ptr %291, align 4, !invariant.load !3
  %293 = call i32 @llvm.smin.i32(i32 %292, i32 1535)
  %294 = call i32 @llvm.smax.i32(i32 %293, i32 0)
  %295 = add i32 %290, 1
  %296 = getelementptr inbounds i32, ptr %5, i32 %295
  %297 = load i32, ptr %296, align 4, !invariant.load !3
  %298 = call i32 @llvm.smin.i32(i32 %297, i32 13)
  %299 = call i32 @llvm.smax.i32(i32 %298, i32 0)
  %300 = mul i32 %294, 14
  %301 = add i32 %300, %299
  %302 = getelementptr inbounds i32, ptr %4, i32 %301
  %303 = load i32, ptr %302, align 4, !invariant.load !3
  %304 = getelementptr inbounds i32, ptr %3, i32 %288
  %305 = load i32, ptr %304, align 4, !invariant.load !3
  %306 = icmp slt i32 %303, %305
  %307 = add i32 %303, 165
  %308 = select i1 %306, i32 %307, i32 %303
  %309 = call i32 @llvm.smin.i32(i32 %308, i32 164)
  %310 = call i32 @llvm.smax.i32(i32 %309, i32 0)
  %311 = mul i32 %310, 165
  %312 = add i32 %311, %289
  %313 = getelementptr inbounds i32, ptr %2, i32 %312
  %314 = load i32, ptr %313, align 4, !invariant.load !3
  %315 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 5, i32 %294, i32 %299)
  %316 = fptosi float %315 to i32
  %317 = fcmp ole float %315, 0xC1E0000000000000
  %318 = select i1 %317, i32 -2147483648, i32 %316
  %319 = fcmp oge float %315, 0x41E0000000000000
  %320 = select i1 %319, i32 2147483647, i32 %318
  %321 = fcmp uno float %315, %315
  %322 = select i1 %321, i32 0, i32 %320
  %323 = icmp sle i32 %314, %322
  %324 = zext i1 %323 to i8
  %325 = extractelement <4 x i8> %26, i64 3
  %326 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 7, i32 %294, i32 %299)
  %327 = fcmp ogt float %326, 0.000000e+00
  %328 = zext i1 %327 to i32
  %329 = icmp slt i32 %328, 1
  %330 = extractelement <4 x i8> %24, i64 3
  %331 = and i8 %324, %325
  %332 = select i1 %329, i8 %330, i8 %331
  %333 = getelementptr inbounds i32, ptr %10, i32 %290
  %334 = load i32, ptr %333, align 4, !invariant.load !3
  %335 = call i32 @llvm.smin.i32(i32 %334, i32 1535)
  %336 = call i32 @llvm.smax.i32(i32 %335, i32 0)
  %337 = getelementptr inbounds i32, ptr %10, i32 %295
  %338 = load i32, ptr %337, align 4, !invariant.load !3
  %339 = call i32 @llvm.smin.i32(i32 %338, i32 13)
  %340 = call i32 @llvm.smax.i32(i32 %339, i32 0)
  %341 = mul i32 %336, 14
  %342 = add i32 %341, %340
  %343 = getelementptr inbounds i32, ptr %4, i32 %342
  %344 = load i32, ptr %343, align 4, !invariant.load !3
  %345 = icmp slt i32 %344, %305
  %346 = add i32 %344, 165
  %347 = select i1 %345, i32 %346, i32 %344
  %348 = call i32 @llvm.smin.i32(i32 %347, i32 164)
  %349 = call i32 @llvm.smax.i32(i32 %348, i32 0)
  %350 = mul i32 %349, 165
  %351 = add i32 %350, %289
  %352 = getelementptr inbounds i32, ptr %2, i32 %351
  %353 = load i32, ptr %352, align 4, !invariant.load !3
  %354 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 5, i32 %336, i32 %340)
  %355 = fptosi float %354 to i32
  %356 = fcmp ole float %354, 0xC1E0000000000000
  %357 = select i1 %356, i32 -2147483648, i32 %355
  %358 = fcmp oge float %354, 0x41E0000000000000
  %359 = select i1 %358, i32 2147483647, i32 %357
  %360 = fcmp uno float %354, %354
  %361 = select i1 %360, i32 0, i32 %359
  %362 = icmp sle i32 %353, %361
  %363 = zext i1 %362 to i8
  %364 = extractelement <4 x i8> %22, i64 3
  %365 = call float @fused_select_4_bitcast_1290_310(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 7, i32 %336, i32 %340)
  %366 = fcmp ogt float %365, 0.000000e+00
  %367 = zext i1 %366 to i32
  %368 = icmp slt i32 %367, 1
  %369 = extractelement <4 x i8> %20, i64 3
  %370 = and i8 %363, %364
  %371 = select i1 %368, i8 %369, i8 %370
  %372 = insertelement <4 x i8> %285, i8 %371, i64 3
  %373 = insertelement <4 x i8> %286, i8 %332, i64 3
  %374 = getelementptr inbounds i8, ptr %11, i32 %18
  store <4 x i8> %373, ptr %374, align 4
  %375 = getelementptr inbounds i8, ptr %12, i32 %18
  store <4 x i8> %372, ptr %375, align 4
  ret void
}

define internal float @fused_select_4_bitcast_1290_310(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, i32 %11, i32 %12, i32 %13) {
  %15 = mul i32 %12, 14
  %16 = add i32 %15, %13
  %17 = getelementptr inbounds i32, ptr %7, i32 %16
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = icmp slt i32 %18, 0
  %20 = add i32 %18, 101
  %21 = select i1 %19, i32 %20, i32 %18
  %22 = call i32 @llvm.smin.i32(i32 %21, i32 100)
  %23 = call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = mul i32 %23, 20
  %25 = add i32 %24, %11
  %26 = getelementptr inbounds float, ptr %6, i32 %25
  %27 = load float, ptr %26, align 4, !invariant.load !3
  ret float %27
}

define ptx_kernel void @loop_broadcast_fusion_3(ptr noalias align 256 dereferenceable(2030592) %0, ptr noalias align 256 dereferenceable(2030592) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %4, 4
  %6 = mul i32 %3, 512
  %7 = add i32 %5, %6
  %8 = getelementptr inbounds i8, ptr %0, i32 %7
  store <4 x i8> zeroinitializer, ptr %8, align 4
  %9 = getelementptr inbounds i8, ptr %1, i32 %7
  store <4 x i8> zeroinitializer, ptr %9, align 4
  ret void
}

define ptx_kernel void @input_scatter_fusion_9(ptr noalias align 256 dereferenceable(2030592) %0, ptr noalias align 256 dereferenceable(253440) %1, ptr noalias align 256 dereferenceable(86016) %2, ptr noalias align 256 dereferenceable(12288) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !19
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %5
  %9 = call i32 @fused_scatter_9_bitcast_165_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 0)
  %10 = call i32 @fused_scatter_9_bitcast_165_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 1)
  %11 = icmp ule i32 %9, 1535
  %12 = icmp ule i32 %10, 1321
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %61

14:                                               ; preds = %4
  %15 = udiv i32 %8, 165
  %16 = urem i32 %8, 165
  %17 = zext i32 %16 to i64
  %18 = trunc i64 %17 to i32
  %19 = mul i32 %15, 2
  %20 = getelementptr inbounds i32, ptr %3, i32 %19
  %21 = load i32, ptr %20, align 4, !invariant.load !3
  %22 = call i32 @llvm.smin.i32(i32 %21, i32 1535)
  %23 = call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = add i32 %19, 1
  %25 = getelementptr inbounds i32, ptr %3, i32 %24
  %26 = load i32, ptr %25, align 4, !invariant.load !3
  %27 = call i32 @llvm.smin.i32(i32 %26, i32 13)
  %28 = call i32 @llvm.smax.i32(i32 %27, i32 0)
  %29 = mul i32 %23, 14
  %30 = add i32 %29, %28
  %31 = getelementptr inbounds i32, ptr %2, i32 %30
  %32 = load i32, ptr %31, align 4, !invariant.load !3
  %33 = getelementptr inbounds i8, ptr %1, i32 %8
  %34 = load i8, ptr %33, align 1, !invariant.load !3
  %35 = icmp ne i32 %18, %32
  %36 = zext i1 %35 to i8
  %37 = and i8 %34, %36
  %38 = mul i32 %9, 1322
  %39 = add i32 %38, %10
  %40 = getelementptr inbounds i8, ptr %0, i32 %39
  %41 = ptrtoint ptr %40 to i64
  %42 = and i64 %41, 3
  %43 = mul i64 %42, -1
  %44 = getelementptr inbounds i8, ptr %40, i64 %43
  %45 = trunc i64 %42 to i32
  %46 = mul i32 %45, 8
  %47 = shl i32 255, %46
  %48 = xor i32 -1, %47
  %49 = load i32, ptr %44, align 4
  %50 = zext i8 %37 to i32
  %51 = shl i32 %50, %46
  br label %52

52:                                               ; preds = %52, %14
  %53 = phi i32 [ %57, %52 ], [ %49, %14 ]
  %54 = and i32 %53, %48
  %55 = or i32 %54, %51
  %56 = cmpxchg ptr %44, i32 %53, i32 %55 monotonic monotonic, align 4
  %57 = extractvalue { i32, i1 } %56, 0
  %58 = extractvalue { i32, i1 } %56, 1
  %59 = xor i1 %58, true
  br i1 %59, label %52, label %60

60:                                               ; preds = %52
  br label %61

61:                                               ; preds = %60, %4
  ret void
}

define internal i32 @fused_scatter_9_bitcast_165_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = udiv i32 %4, 165
  %8 = urem i32 %4, 165
  %9 = icmp ult i32 %5, 1
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = zext i32 %7 to i64
  %12 = trunc i64 %11 to i32
  br label %20

13:                                               ; preds = %6
  %14 = zext i32 %8 to i64
  %15 = trunc i64 %14 to i32
  %16 = mul i32 %15, 8
  %17 = icmp slt i32 %16, 0
  %18 = add i32 %16, 1322
  %19 = select i1 %17, i32 %18, i32 %16
  br label %20

20:                                               ; preds = %10, %13
  %21 = phi i32 [ %19, %13 ], [ %12, %10 ]
  br label %22

22:                                               ; preds = %20
  ret i32 %21
}

define ptx_kernel void @input_scatter_fusion_6(ptr noalias align 256 dereferenceable(2030592) %0, ptr noalias align 256 dereferenceable(660) %1, ptr noalias align 256 dereferenceable(253440) %2, ptr noalias align 256 dereferenceable(660) %3, ptr noalias align 256 dereferenceable(253440) %4, ptr noalias align 256 dereferenceable(165) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !19
  %9 = mul i32 %8, 128
  %10 = add i32 %9, %7
  %11 = call i32 @fused_scatter_6_bitcast_180_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 0)
  %12 = call i32 @fused_scatter_6_bitcast_180_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 1)
  %13 = icmp ule i32 %11, 1535
  %14 = icmp ule i32 %12, 1321
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %60

16:                                               ; preds = %6
  %17 = udiv i32 %10, 165
  %18 = urem i32 %10, 165
  %19 = getelementptr inbounds i8, ptr %4, i32 %10
  %20 = load i8, ptr %19, align 1, !invariant.load !3
  %21 = getelementptr inbounds i8, ptr %5, i32 %18
  %22 = load i8, ptr %21, align 1, !invariant.load !3
  %23 = and i8 %20, %22
  %24 = zext i32 %17 to i64
  %25 = trunc i64 %24 to i32
  %26 = call i32 @llvm.smin.i32(i32 %25, i32 1535)
  %27 = call i32 @llvm.smax.i32(i32 %26, i32 0)
  %28 = getelementptr inbounds i32, ptr %3, i32 %18
  %29 = load i32, ptr %28, align 4, !invariant.load !3
  %30 = call i32 @llvm.smin.i32(i32 %29, i32 164)
  %31 = call i32 @llvm.smax.i32(i32 %30, i32 0)
  %32 = mul i32 %27, 165
  %33 = add i32 %32, %31
  %34 = getelementptr inbounds i8, ptr %2, i32 %33
  %35 = load i8, ptr %34, align 1, !invariant.load !3
  %36 = and i8 %23, %35
  %37 = mul i32 %11, 1322
  %38 = add i32 %37, %12
  %39 = getelementptr inbounds i8, ptr %0, i32 %38
  %40 = ptrtoint ptr %39 to i64
  %41 = and i64 %40, 3
  %42 = mul i64 %41, -1
  %43 = getelementptr inbounds i8, ptr %39, i64 %42
  %44 = trunc i64 %41 to i32
  %45 = mul i32 %44, 8
  %46 = shl i32 255, %45
  %47 = xor i32 -1, %46
  %48 = load i32, ptr %43, align 4
  %49 = zext i8 %36 to i32
  %50 = shl i32 %49, %45
  br label %51

51:                                               ; preds = %51, %16
  %52 = phi i32 [ %56, %51 ], [ %48, %16 ]
  %53 = and i32 %52, %47
  %54 = or i32 %53, %50
  %55 = cmpxchg ptr %43, i32 %52, i32 %54 monotonic monotonic, align 4
  %56 = extractvalue { i32, i1 } %55, 0
  %57 = extractvalue { i32, i1 } %55, 1
  %58 = xor i1 %57, true
  br i1 %58, label %51, label %59

59:                                               ; preds = %51
  br label %60

60:                                               ; preds = %59, %6
  ret void
}

define internal i32 @fused_scatter_6_bitcast_180_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = udiv i32 %6, 165
  %10 = urem i32 %6, 165
  %11 = icmp ult i32 %7, 1
  br i1 %11, label %12, label %15

12:                                               ; preds = %8
  %13 = zext i32 %9 to i64
  %14 = trunc i64 %13 to i32
  br label %18

15:                                               ; preds = %8
  %16 = getelementptr inbounds i32, ptr %1, i32 %10
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  br label %18

18:                                               ; preds = %12, %15
  %19 = phi i32 [ %17, %15 ], [ %14, %12 ]
  br label %20

20:                                               ; preds = %18
  ret i32 %19
}

define ptx_kernel void @input_scatter_fusion(ptr noalias align 256 dereferenceable(2030592) %0, ptr noalias align 256 dereferenceable(660) %1, ptr noalias align 256 dereferenceable(253440) %2, ptr noalias align 256 dereferenceable(1536) %3, ptr noalias align 256 dereferenceable(1536) %4, ptr noalias align 256 dereferenceable(12288) %5, ptr noalias align 256 dereferenceable(8080) %6, ptr noalias align 256 dereferenceable(86016) %7) #0 {
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !19
  %11 = mul i32 %10, 128
  %12 = add i32 %11, %9
  %13 = call i32 @fused_scatter_bitcast_212_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 0)
  %14 = call i32 @fused_scatter_bitcast_212_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, i32 %12, i32 1)
  %15 = icmp ule i32 %13, 1535
  %16 = icmp ule i32 %14, 1321
  %17 = and i1 %15, %16
  br i1 %17, label %18, label %85

18:                                               ; preds = %8
  %19 = udiv i32 %12, 165
  %20 = getelementptr inbounds i8, ptr %3, i32 %19
  %21 = load i8, ptr %20, align 1, !invariant.load !3
  %22 = getelementptr inbounds i8, ptr %4, i32 %19
  %23 = load i8, ptr %22, align 1, !invariant.load !3
  %24 = or i8 %21, %23
  %25 = mul i32 %19, 2
  %26 = getelementptr inbounds i32, ptr %5, i32 %25
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  %28 = call i32 @llvm.smin.i32(i32 %27, i32 1535)
  %29 = call i32 @llvm.smax.i32(i32 %28, i32 0)
  %30 = add i32 %25, 1
  %31 = getelementptr inbounds i32, ptr %5, i32 %30
  %32 = load i32, ptr %31, align 4, !invariant.load !3
  %33 = call i32 @llvm.smin.i32(i32 %32, i32 13)
  %34 = call i32 @llvm.smax.i32(i32 %33, i32 0)
  %35 = mul i32 %29, 14
  %36 = add i32 %35, %34
  %37 = getelementptr inbounds i32, ptr %7, i32 %36
  %38 = load i32, ptr %37, align 4, !invariant.load !3
  %39 = icmp slt i32 %38, 0
  %40 = add i32 %38, 101
  %41 = select i1 %39, i32 %40, i32 %38
  %42 = call i32 @llvm.smin.i32(i32 %41, i32 100)
  %43 = call i32 @llvm.smax.i32(i32 %42, i32 0)
  %44 = mul i32 %43, 20
  %45 = add i32 %44, 12
  %46 = getelementptr inbounds float, ptr %6, i32 %45
  %47 = load float, ptr %46, align 4, !invariant.load !3
  %48 = fptosi float %47 to i32
  %49 = fcmp ole float %47, 0xC1E0000000000000
  %50 = select i1 %49, i32 -2147483648, i32 %48
  %51 = fcmp oge float %47, 0x41E0000000000000
  %52 = select i1 %51, i32 2147483647, i32 %50
  %53 = fcmp uno float %47, %47
  %54 = select i1 %53, i32 0, i32 %52
  %55 = icmp sgt i32 %54, 0
  %56 = icmp eq i8 %24, 0
  %57 = and i1 %55, %56
  %58 = zext i1 %57 to i8
  %59 = getelementptr inbounds i8, ptr %2, i32 %12
  %60 = load i8, ptr %59, align 1, !invariant.load !3
  %61 = and i8 %58, %60
  %62 = mul i32 %13, 1322
  %63 = add i32 %62, %14
  %64 = getelementptr inbounds i8, ptr %0, i32 %63
  %65 = ptrtoint ptr %64 to i64
  %66 = and i64 %65, 3
  %67 = mul i64 %66, -1
  %68 = getelementptr inbounds i8, ptr %64, i64 %67
  %69 = trunc i64 %66 to i32
  %70 = mul i32 %69, 8
  %71 = shl i32 255, %70
  %72 = xor i32 -1, %71
  %73 = load i32, ptr %68, align 4
  %74 = zext i8 %61 to i32
  %75 = shl i32 %74, %70
  br label %76

76:                                               ; preds = %76, %18
  %77 = phi i32 [ %81, %76 ], [ %73, %18 ]
  %78 = and i32 %77, %72
  %79 = or i32 %78, %75
  %80 = cmpxchg ptr %68, i32 %77, i32 %79 monotonic monotonic, align 4
  %81 = extractvalue { i32, i1 } %80, 0
  %82 = extractvalue { i32, i1 } %80, 1
  %83 = xor i1 %82, true
  br i1 %83, label %76, label %84

84:                                               ; preds = %76
  br label %85

85:                                               ; preds = %84, %8
  ret void
}

define internal i32 @fused_scatter_bitcast_212_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, i32 %8, i32 %9) {
  %11 = udiv i32 %8, 165
  %12 = urem i32 %8, 165
  %13 = icmp ult i32 %9, 1
  br i1 %13, label %14, label %17

14:                                               ; preds = %10
  %15 = zext i32 %11 to i64
  %16 = trunc i64 %15 to i32
  br label %20

17:                                               ; preds = %10
  %18 = getelementptr inbounds i32, ptr %1, i32 %12
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  br label %20

20:                                               ; preds = %14, %17
  %21 = phi i32 [ %19, %17 ], [ %16, %14 ]
  br label %22

22:                                               ; preds = %20
  ret i32 %21
}

define ptx_kernel void @loop_broadcast_fusion_5(ptr noalias align 256 dereferenceable(21504) %0, ptr noalias align 256 dereferenceable(21504) %1, ptr noalias align 256 dereferenceable(21504) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = mul i32 %4, 128
  %7 = add i32 %6, %5
  %8 = getelementptr inbounds i8, ptr %0, i32 %7
  store i8 0, ptr %8, align 1
  %9 = getelementptr inbounds i8, ptr %1, i32 %7
  store i8 0, ptr %9, align 1
  %10 = getelementptr inbounds i8, ptr %2, i32 %7
  store i8 0, ptr %10, align 1
  ret void
}

define ptx_kernel void @loop_select_fusion_2(ptr noalias align 256 dereferenceable(2030592) %0, ptr noalias align 256 dereferenceable(1536) %1, ptr noalias align 256 dereferenceable(2030592) %2, ptr noalias align 256 dereferenceable(21504) %3, ptr noalias align 256 dereferenceable(12288) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = mul i32 %7, 4
  %9 = mul i32 %6, 512
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i8, ptr %0, i32 %10
  %12 = load <4 x i8>, ptr %11, align 4
  %13 = mul i32 %7, 2
  %14 = mul i32 %6, 256
  %15 = add i32 %13, %14
  %16 = udiv i32 %15, 661
  %17 = urem i32 %10, 1322
  %18 = getelementptr inbounds i8, ptr %1, i32 %16
  %19 = load i8, ptr %18, align 1, !invariant.load !3
  %20 = icmp sge i32 %17, 1321
  br i1 %20, label %21, label %22

21:                                               ; preds = %5
  br label %49

22:                                               ; preds = %5
  %23 = icmp sge i32 %17, 1320
  %24 = icmp slt i32 %17, 1321
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %43

26:                                               ; preds = %22
  %27 = mul i32 %16, 2
  %28 = getelementptr inbounds i32, ptr %4, i32 %27
  %29 = load i32, ptr %28, align 4, !invariant.load !3
  %30 = call i32 @llvm.smin.i32(i32 %29, i32 1535)
  %31 = call i32 @llvm.smax.i32(i32 %30, i32 0)
  %32 = add i32 %27, 1
  %33 = getelementptr inbounds i32, ptr %4, i32 %32
  %34 = load i32, ptr %33, align 4, !invariant.load !3
  %35 = call i32 @llvm.smin.i32(i32 %34, i32 13)
  %36 = call i32 @llvm.smax.i32(i32 %35, i32 0)
  %37 = mul i32 %31, 14
  %38 = add i32 %37, %36
  %39 = getelementptr inbounds i8, ptr %3, i32 %38
  %40 = load i8, ptr %39, align 1, !invariant.load !3
  %41 = icmp eq i8 %40, 0
  %42 = zext i1 %41 to i8
  br label %46

43:                                               ; preds = %22
  %44 = getelementptr inbounds i8, ptr %2, i32 %10
  %45 = load i8, ptr %44, align 1, !invariant.load !3
  br label %46

46:                                               ; preds = %26, %43
  %47 = phi i8 [ %45, %43 ], [ %42, %26 ]
  br label %48

48:                                               ; preds = %46
  br label %49

49:                                               ; preds = %21, %48
  %50 = phi i8 [ %47, %48 ], [ 1, %21 ]
  br label %51

51:                                               ; preds = %49
  %52 = extractelement <4 x i8> %12, i64 0
  %53 = trunc i8 %19 to i1
  %54 = select i1 %53, i8 %50, i8 %52
  %55 = insertelement <4 x i8> zeroinitializer, i8 %54, i64 0
  %56 = add i32 %10, 1
  %57 = urem i32 %56, 1322
  %58 = icmp sge i32 %57, 1321
  br i1 %58, label %59, label %60

59:                                               ; preds = %51
  br label %87

60:                                               ; preds = %51
  %61 = icmp sge i32 %57, 1320
  %62 = icmp slt i32 %57, 1321
  %63 = and i1 %61, %62
  br i1 %63, label %64, label %81

64:                                               ; preds = %60
  %65 = mul i32 %16, 2
  %66 = getelementptr inbounds i32, ptr %4, i32 %65
  %67 = load i32, ptr %66, align 4, !invariant.load !3
  %68 = call i32 @llvm.smin.i32(i32 %67, i32 1535)
  %69 = call i32 @llvm.smax.i32(i32 %68, i32 0)
  %70 = add i32 %65, 1
  %71 = getelementptr inbounds i32, ptr %4, i32 %70
  %72 = load i32, ptr %71, align 4, !invariant.load !3
  %73 = call i32 @llvm.smin.i32(i32 %72, i32 13)
  %74 = call i32 @llvm.smax.i32(i32 %73, i32 0)
  %75 = mul i32 %69, 14
  %76 = add i32 %75, %74
  %77 = getelementptr inbounds i8, ptr %3, i32 %76
  %78 = load i8, ptr %77, align 1, !invariant.load !3
  %79 = icmp eq i8 %78, 0
  %80 = zext i1 %79 to i8
  br label %84

81:                                               ; preds = %60
  %82 = getelementptr inbounds i8, ptr %2, i32 %56
  %83 = load i8, ptr %82, align 1, !invariant.load !3
  br label %84

84:                                               ; preds = %64, %81
  %85 = phi i8 [ %83, %81 ], [ %80, %64 ]
  br label %86

86:                                               ; preds = %84
  br label %87

87:                                               ; preds = %59, %86
  %88 = phi i8 [ %85, %86 ], [ 1, %59 ]
  br label %89

89:                                               ; preds = %87
  %90 = extractelement <4 x i8> %12, i64 1
  %91 = select i1 %53, i8 %88, i8 %90
  %92 = insertelement <4 x i8> %55, i8 %91, i64 1
  %93 = add i32 %15, 1
  %94 = udiv i32 %93, 661
  %95 = add i32 %10, 2
  %96 = urem i32 %95, 1322
  %97 = getelementptr inbounds i8, ptr %1, i32 %94
  %98 = load i8, ptr %97, align 1, !invariant.load !3
  %99 = icmp sge i32 %96, 1321
  br i1 %99, label %100, label %101

100:                                              ; preds = %89
  br label %128

101:                                              ; preds = %89
  %102 = icmp sge i32 %96, 1320
  %103 = icmp slt i32 %96, 1321
  %104 = and i1 %102, %103
  br i1 %104, label %105, label %122

105:                                              ; preds = %101
  %106 = mul i32 %94, 2
  %107 = getelementptr inbounds i32, ptr %4, i32 %106
  %108 = load i32, ptr %107, align 4, !invariant.load !3
  %109 = call i32 @llvm.smin.i32(i32 %108, i32 1535)
  %110 = call i32 @llvm.smax.i32(i32 %109, i32 0)
  %111 = add i32 %106, 1
  %112 = getelementptr inbounds i32, ptr %4, i32 %111
  %113 = load i32, ptr %112, align 4, !invariant.load !3
  %114 = call i32 @llvm.smin.i32(i32 %113, i32 13)
  %115 = call i32 @llvm.smax.i32(i32 %114, i32 0)
  %116 = mul i32 %110, 14
  %117 = add i32 %116, %115
  %118 = getelementptr inbounds i8, ptr %3, i32 %117
  %119 = load i8, ptr %118, align 1, !invariant.load !3
  %120 = icmp eq i8 %119, 0
  %121 = zext i1 %120 to i8
  br label %125

122:                                              ; preds = %101
  %123 = getelementptr inbounds i8, ptr %2, i32 %95
  %124 = load i8, ptr %123, align 1, !invariant.load !3
  br label %125

125:                                              ; preds = %105, %122
  %126 = phi i8 [ %124, %122 ], [ %121, %105 ]
  br label %127

127:                                              ; preds = %125
  br label %128

128:                                              ; preds = %100, %127
  %129 = phi i8 [ %126, %127 ], [ 1, %100 ]
  br label %130

130:                                              ; preds = %128
  %131 = extractelement <4 x i8> %12, i64 2
  %132 = trunc i8 %98 to i1
  %133 = select i1 %132, i8 %129, i8 %131
  %134 = insertelement <4 x i8> %92, i8 %133, i64 2
  %135 = add i32 %10, 3
  %136 = udiv i32 %135, 1322
  %137 = urem i32 %135, 1322
  %138 = getelementptr inbounds i8, ptr %1, i32 %136
  %139 = load i8, ptr %138, align 1, !invariant.load !3
  %140 = icmp sge i32 %137, 1321
  br i1 %140, label %141, label %142

141:                                              ; preds = %130
  br label %169

142:                                              ; preds = %130
  %143 = icmp sge i32 %137, 1320
  %144 = icmp slt i32 %137, 1321
  %145 = and i1 %143, %144
  br i1 %145, label %146, label %163

146:                                              ; preds = %142
  %147 = mul i32 %136, 2
  %148 = getelementptr inbounds i32, ptr %4, i32 %147
  %149 = load i32, ptr %148, align 4, !invariant.load !3
  %150 = call i32 @llvm.smin.i32(i32 %149, i32 1535)
  %151 = call i32 @llvm.smax.i32(i32 %150, i32 0)
  %152 = add i32 %147, 1
  %153 = getelementptr inbounds i32, ptr %4, i32 %152
  %154 = load i32, ptr %153, align 4, !invariant.load !3
  %155 = call i32 @llvm.smin.i32(i32 %154, i32 13)
  %156 = call i32 @llvm.smax.i32(i32 %155, i32 0)
  %157 = mul i32 %151, 14
  %158 = add i32 %157, %156
  %159 = getelementptr inbounds i8, ptr %3, i32 %158
  %160 = load i8, ptr %159, align 1, !invariant.load !3
  %161 = icmp eq i8 %160, 0
  %162 = zext i1 %161 to i8
  br label %166

163:                                              ; preds = %142
  %164 = getelementptr inbounds i8, ptr %2, i32 %135
  %165 = load i8, ptr %164, align 1, !invariant.load !3
  br label %166

166:                                              ; preds = %146, %163
  %167 = phi i8 [ %165, %163 ], [ %162, %146 ]
  br label %168

168:                                              ; preds = %166
  br label %169

169:                                              ; preds = %141, %168
  %170 = phi i8 [ %167, %168 ], [ 1, %141 ]
  br label %171

171:                                              ; preds = %169
  %172 = extractelement <4 x i8> %12, i64 3
  %173 = trunc i8 %139 to i1
  %174 = select i1 %173, i8 %170, i8 %172
  %175 = insertelement <4 x i8> %134, i8 %174, i64 3
  store <4 x i8> %175, ptr %11, align 4
  ret void
}

define ptx_kernel void @loop_transpose_fusion_3(ptr noalias align 256 dereferenceable(86016) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(258048) %2, ptr noalias align 256 dereferenceable(258048) %3, ptr noalias align 256 dereferenceable(258048) %4, ptr noalias align 256 dereferenceable(258048) %5, ptr noalias align 256 dereferenceable(258048) %6, ptr noalias align 256 dereferenceable(258048) %7, ptr noalias align 256 dereferenceable(258048) %8) #0 {
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = mul i32 %10, 128
  %13 = add i32 %12, %11
  %14 = udiv i32 %13, 3
  %15 = urem i32 %13, 3
  %16 = udiv i32 %13, 42
  %17 = icmp ult i32 %15, 1
  br i1 %17, label %18, label %19

18:                                               ; preds = %9
  br label %38

19:                                               ; preds = %9
  %20 = icmp ult i32 %15, 2
  br i1 %20, label %21, label %27

21:                                               ; preds = %19
  %22 = getelementptr inbounds i32, ptr %0, i32 %14
  %23 = load i32, ptr %22, align 4, !invariant.load !3
  %24 = icmp slt i32 %23, 0
  %25 = add i32 %23, 165
  %26 = select i1 %24, i32 %25, i32 %23
  br label %28

27:                                               ; preds = %19
  br label %28

28:                                               ; preds = %21, %27
  %29 = phi i32 [ 4, %27 ], [ %26, %21 ]
  %30 = phi i32 [ 8, %27 ], [ %26, %21 ]
  %31 = phi i32 [ 5, %27 ], [ %26, %21 ]
  %32 = phi i32 [ 9, %27 ], [ %26, %21 ]
  %33 = phi i32 [ 0, %27 ], [ %26, %21 ]
  %34 = phi i32 [ 1, %27 ], [ %26, %21 ]
  %35 = phi i32 [ 2, %27 ], [ %26, %21 ]
  %36 = phi i32 [ 3, %27 ], [ %26, %21 ]
  br label %37

37:                                               ; preds = %28
  br label %38

38:                                               ; preds = %18, %37
  %39 = phi i32 [ %29, %37 ], [ %16, %18 ]
  %40 = phi i32 [ %30, %37 ], [ %16, %18 ]
  %41 = phi i32 [ %31, %37 ], [ %16, %18 ]
  %42 = phi i32 [ %32, %37 ], [ %16, %18 ]
  %43 = phi i32 [ %33, %37 ], [ %16, %18 ]
  %44 = phi i32 [ %34, %37 ], [ %16, %18 ]
  %45 = phi i32 [ %35, %37 ], [ %16, %18 ]
  %46 = phi i32 [ %36, %37 ], [ %16, %18 ]
  br label %47

47:                                               ; preds = %38
  %48 = getelementptr inbounds i32, ptr %1, i32 %13
  store i32 %39, ptr %48, align 4
  %49 = getelementptr inbounds i32, ptr %2, i32 %13
  store i32 %40, ptr %49, align 4
  %50 = getelementptr inbounds i32, ptr %3, i32 %13
  store i32 %41, ptr %50, align 4
  %51 = getelementptr inbounds i32, ptr %4, i32 %13
  store i32 %42, ptr %51, align 4
  %52 = getelementptr inbounds i32, ptr %5, i32 %13
  store i32 %43, ptr %52, align 4
  %53 = getelementptr inbounds i32, ptr %6, i32 %13
  store i32 %44, ptr %53, align 4
  %54 = getelementptr inbounds i32, ptr %7, i32 %13
  store i32 %45, ptr %54, align 4
  %55 = getelementptr inbounds i32, ptr %8, i32 %13
  store i32 %46, ptr %55, align 4
  ret void
}

define ptx_kernel void @loop_broadcast_fusion_2(ptr noalias align 256 dereferenceable(12165120) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %3, 4
  %5 = mul i32 %2, 512
  %6 = add i32 %4, %5
  %7 = getelementptr inbounds float, ptr %0, i32 %6
  store <4 x float> zeroinitializer, ptr %7, align 16
  ret void
}

define ptx_kernel void @input_scatter_fusion_28(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(86016) %3, ptr noalias align 256 dereferenceable(6144) %4, ptr noalias align 256 dereferenceable(6144) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %9 = mul i32 %7, 3
  %10 = mul i32 %8, 384
  %11 = add i32 %9, %10
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = add i32 %11, 1
  %15 = getelementptr inbounds i32, ptr %1, i32 %14
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = add i32 %11, 2
  %18 = getelementptr inbounds i32, ptr %1, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  %20 = icmp ule i32 %13, 1535
  %21 = icmp ule i32 %16, 164
  %22 = and i1 %20, %21
  %23 = icmp ule i32 %19, 11
  %24 = and i1 %22, %23
  br i1 %24, label %25, label %76

25:                                               ; preds = %6
  %26 = mul i32 %8, 128
  %27 = add i32 %26, %7
  %28 = udiv i32 %27, 14
  %29 = getelementptr inbounds i32, ptr %3, i32 %27
  %30 = load i32, ptr %29, align 4, !invariant.load !3
  %31 = getelementptr inbounds i32, ptr %4, i32 %28
  %32 = load i32, ptr %31, align 4, !invariant.load !3
  %33 = getelementptr inbounds i32, ptr %5, i32 %28
  %34 = load i32, ptr %33, align 4, !invariant.load !3
  %35 = call i32 @llvm.smax.i32(i32 %32, i32 %34)
  %36 = call i32 @llvm.smin.i32(i32 %35, i32 13)
  %37 = icmp slt i32 %36, %32
  %38 = add i32 %36, 14
  %39 = select i1 %37, i32 %38, i32 %36
  %40 = call i32 @llvm.smin.i32(i32 %39, i32 13)
  %41 = call i32 @llvm.smax.i32(i32 %40, i32 0)
  %42 = zext i32 %41 to i64
  %43 = trunc i64 %42 to i32
  %44 = icmp sge i32 %43, 7
  %45 = zext i1 %44 to i32
  %46 = icmp eq i32 %30, %45
  %47 = zext i1 %46 to i8
  %48 = getelementptr inbounds i8, ptr %2, i32 %27
  %49 = load i8, ptr %48, align 1, !invariant.load !3
  %50 = and i8 %49, %47
  %51 = sitofp i8 %50 to float
  %52 = trunc i8 %49 to i1
  %53 = select i1 %52, float %51, float 0.000000e+00
  %54 = mul i32 %13, 1980
  %55 = mul i32 %16, 12
  %56 = add i32 %54, %55
  %57 = add i32 %56, %19
  %58 = getelementptr inbounds float, ptr %0, i32 %57
  %59 = load float, ptr %58, align 4
  %60 = fcmp uno float %59, %59
  br i1 %60, label %61, label %62

61:                                               ; preds = %25
  br label %75

62:                                               ; preds = %25
  %63 = fcmp uno float %53, %53
  %64 = select i1 %63, float 0x7FF8000000000000, float %53
  %65 = fcmp ult float %59, %64
  br i1 %65, label %66, label %74

66:                                               ; preds = %62
  %67 = bitcast float %64 to i32
  %68 = icmp sge i32 %67, 0
  br i1 %68, label %69, label %71

69:                                               ; preds = %66
  %70 = atomicrmw max ptr %58, i32 %67 monotonic, align 4
  br label %73

71:                                               ; preds = %66
  %72 = atomicrmw umin ptr %58, i32 %67 monotonic, align 4
  br label %73

73:                                               ; preds = %69, %71
  br label %74

74:                                               ; preds = %73, %62
  br label %75

75:                                               ; preds = %61, %74
  br label %76

76:                                               ; preds = %75, %6
  ret void
}

define ptx_kernel void @loop_transpose_fusion(ptr noalias align 256 dereferenceable(86016) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(258048) %2, ptr noalias align 256 dereferenceable(258048) %3, ptr noalias align 256 dereferenceable(258048) %4, ptr noalias align 256 dereferenceable(258048) %5, ptr noalias align 256 dereferenceable(258048) %6, ptr noalias align 256 dereferenceable(258048) %7, ptr noalias align 256 dereferenceable(258048) %8) #0 {
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = mul i32 %10, 128
  %13 = add i32 %12, %11
  %14 = udiv i32 %13, 3
  %15 = urem i32 %13, 3
  %16 = udiv i32 %13, 42
  %17 = icmp ult i32 %15, 1
  br i1 %17, label %18, label %19

18:                                               ; preds = %9
  br label %35

19:                                               ; preds = %9
  %20 = icmp ult i32 %15, 2
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = getelementptr inbounds i32, ptr %0, i32 %14
  %23 = load i32, ptr %22, align 4, !invariant.load !3
  br label %25

24:                                               ; preds = %19
  br label %25

25:                                               ; preds = %21, %24
  %26 = phi i32 [ 9, %24 ], [ %23, %21 ]
  %27 = phi i32 [ 0, %24 ], [ %23, %21 ]
  %28 = phi i32 [ 1, %24 ], [ %23, %21 ]
  %29 = phi i32 [ 2, %24 ], [ %23, %21 ]
  %30 = phi i32 [ 3, %24 ], [ %23, %21 ]
  %31 = phi i32 [ 4, %24 ], [ %23, %21 ]
  %32 = phi i32 [ 5, %24 ], [ %23, %21 ]
  %33 = phi i32 [ 8, %24 ], [ %23, %21 ]
  br label %34

34:                                               ; preds = %25
  br label %35

35:                                               ; preds = %18, %34
  %36 = phi i32 [ %26, %34 ], [ %16, %18 ]
  %37 = phi i32 [ %27, %34 ], [ %16, %18 ]
  %38 = phi i32 [ %28, %34 ], [ %16, %18 ]
  %39 = phi i32 [ %29, %34 ], [ %16, %18 ]
  %40 = phi i32 [ %30, %34 ], [ %16, %18 ]
  %41 = phi i32 [ %31, %34 ], [ %16, %18 ]
  %42 = phi i32 [ %32, %34 ], [ %16, %18 ]
  %43 = phi i32 [ %33, %34 ], [ %16, %18 ]
  br label %44

44:                                               ; preds = %35
  %45 = getelementptr inbounds i32, ptr %1, i32 %13
  store i32 %36, ptr %45, align 4
  %46 = getelementptr inbounds i32, ptr %2, i32 %13
  store i32 %37, ptr %46, align 4
  %47 = getelementptr inbounds i32, ptr %3, i32 %13
  store i32 %38, ptr %47, align 4
  %48 = getelementptr inbounds i32, ptr %4, i32 %13
  store i32 %39, ptr %48, align 4
  %49 = getelementptr inbounds i32, ptr %5, i32 %13
  store i32 %40, ptr %49, align 4
  %50 = getelementptr inbounds i32, ptr %6, i32 %13
  store i32 %41, ptr %50, align 4
  %51 = getelementptr inbounds i32, ptr %7, i32 %13
  store i32 %42, ptr %51, align 4
  %52 = getelementptr inbounds i32, ptr %8, i32 %13
  store i32 %43, ptr %52, align 4
  ret void
}

define ptx_kernel void @input_scatter_fusion_27(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(21504) %3, ptr noalias align 256 dereferenceable(86016) %4, ptr noalias align 256 dereferenceable(6144) %5, ptr noalias align 256 dereferenceable(6144) %6) #0 {
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %10 = mul i32 %8, 3
  %11 = mul i32 %9, 384
  %12 = add i32 %10, %11
  %13 = getelementptr inbounds i32, ptr %1, i32 %12
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  %15 = add i32 %12, 1
  %16 = getelementptr inbounds i32, ptr %1, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = add i32 %12, 2
  %19 = getelementptr inbounds i32, ptr %1, i32 %18
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = icmp ule i32 %14, 1535
  %22 = icmp ule i32 %17, 164
  %23 = and i1 %21, %22
  %24 = icmp ule i32 %20, 11
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %79

26:                                               ; preds = %7
  %27 = mul i32 %9, 128
  %28 = add i32 %27, %8
  %29 = udiv i32 %28, 14
  %30 = getelementptr inbounds i32, ptr %4, i32 %28
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = getelementptr inbounds i32, ptr %5, i32 %29
  %33 = load i32, ptr %32, align 4, !invariant.load !3
  %34 = getelementptr inbounds i32, ptr %6, i32 %29
  %35 = load i32, ptr %34, align 4, !invariant.load !3
  %36 = call i32 @llvm.smax.i32(i32 %33, i32 %35)
  %37 = call i32 @llvm.smin.i32(i32 %36, i32 13)
  %38 = icmp slt i32 %37, %33
  %39 = add i32 %37, 14
  %40 = select i1 %38, i32 %39, i32 %37
  %41 = call i32 @llvm.smin.i32(i32 %40, i32 13)
  %42 = call i32 @llvm.smax.i32(i32 %41, i32 0)
  %43 = zext i32 %42 to i64
  %44 = trunc i64 %43 to i32
  %45 = icmp sge i32 %44, 7
  %46 = zext i1 %45 to i32
  %47 = getelementptr inbounds i8, ptr %3, i32 %28
  %48 = load i8, ptr %47, align 1, !invariant.load !3
  %49 = icmp eq i32 %31, %46
  %50 = zext i1 %49 to i8
  %51 = and i8 %48, %50
  %52 = getelementptr inbounds i8, ptr %2, i32 %28
  %53 = load i8, ptr %52, align 1, !invariant.load !3
  %54 = sitofp i8 %51 to float
  %55 = trunc i8 %53 to i1
  %56 = select i1 %55, float %54, float 0.000000e+00
  %57 = mul i32 %14, 1980
  %58 = mul i32 %17, 12
  %59 = add i32 %57, %58
  %60 = add i32 %59, %20
  %61 = getelementptr inbounds float, ptr %0, i32 %60
  %62 = load float, ptr %61, align 4
  %63 = fcmp uno float %62, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %26
  br label %78

65:                                               ; preds = %26
  %66 = fcmp uno float %56, %56
  %67 = select i1 %66, float 0x7FF8000000000000, float %56
  %68 = fcmp ult float %62, %67
  br i1 %68, label %69, label %77

69:                                               ; preds = %65
  %70 = bitcast float %67 to i32
  %71 = icmp sge i32 %70, 0
  br i1 %71, label %72, label %74

72:                                               ; preds = %69
  %73 = atomicrmw max ptr %61, i32 %70 monotonic, align 4
  br label %76

74:                                               ; preds = %69
  %75 = atomicrmw umin ptr %61, i32 %70 monotonic, align 4
  br label %76

76:                                               ; preds = %72, %74
  br label %77

77:                                               ; preds = %76, %65
  br label %78

78:                                               ; preds = %64, %77
  br label %79

79:                                               ; preds = %78, %7
  ret void
}

define ptx_kernel void @input_scatter_fusion_26(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(86016) %3, ptr noalias align 256 dereferenceable(6144) %4, ptr noalias align 256 dereferenceable(6144) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %9 = mul i32 %7, 3
  %10 = mul i32 %8, 384
  %11 = add i32 %9, %10
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = add i32 %11, 1
  %15 = getelementptr inbounds i32, ptr %1, i32 %14
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = add i32 %11, 2
  %18 = getelementptr inbounds i32, ptr %1, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  %20 = icmp ule i32 %13, 1535
  %21 = icmp ule i32 %16, 164
  %22 = and i1 %20, %21
  %23 = icmp ule i32 %19, 11
  %24 = and i1 %22, %23
  br i1 %24, label %25, label %76

25:                                               ; preds = %6
  %26 = mul i32 %8, 128
  %27 = add i32 %26, %7
  %28 = udiv i32 %27, 14
  %29 = getelementptr inbounds i32, ptr %3, i32 %27
  %30 = load i32, ptr %29, align 4, !invariant.load !3
  %31 = getelementptr inbounds i32, ptr %4, i32 %28
  %32 = load i32, ptr %31, align 4, !invariant.load !3
  %33 = getelementptr inbounds i32, ptr %5, i32 %28
  %34 = load i32, ptr %33, align 4, !invariant.load !3
  %35 = call i32 @llvm.smax.i32(i32 %32, i32 %34)
  %36 = call i32 @llvm.smin.i32(i32 %35, i32 13)
  %37 = icmp slt i32 %36, %32
  %38 = add i32 %36, 14
  %39 = select i1 %37, i32 %38, i32 %36
  %40 = call i32 @llvm.smin.i32(i32 %39, i32 13)
  %41 = call i32 @llvm.smax.i32(i32 %40, i32 0)
  %42 = zext i32 %41 to i64
  %43 = trunc i64 %42 to i32
  %44 = icmp sge i32 %43, 7
  %45 = zext i1 %44 to i32
  %46 = icmp ne i32 %30, %45
  %47 = zext i1 %46 to i8
  %48 = getelementptr inbounds i8, ptr %2, i32 %27
  %49 = load i8, ptr %48, align 1, !invariant.load !3
  %50 = and i8 %49, %47
  %51 = sitofp i8 %50 to float
  %52 = trunc i8 %49 to i1
  %53 = select i1 %52, float %51, float 0.000000e+00
  %54 = mul i32 %13, 1980
  %55 = mul i32 %16, 12
  %56 = add i32 %54, %55
  %57 = add i32 %56, %19
  %58 = getelementptr inbounds float, ptr %0, i32 %57
  %59 = load float, ptr %58, align 4
  %60 = fcmp uno float %59, %59
  br i1 %60, label %61, label %62

61:                                               ; preds = %25
  br label %75

62:                                               ; preds = %25
  %63 = fcmp uno float %53, %53
  %64 = select i1 %63, float 0x7FF8000000000000, float %53
  %65 = fcmp ult float %59, %64
  br i1 %65, label %66, label %74

66:                                               ; preds = %62
  %67 = bitcast float %64 to i32
  %68 = icmp sge i32 %67, 0
  br i1 %68, label %69, label %71

69:                                               ; preds = %66
  %70 = atomicrmw max ptr %58, i32 %67 monotonic, align 4
  br label %73

71:                                               ; preds = %66
  %72 = atomicrmw umin ptr %58, i32 %67 monotonic, align 4
  br label %73

73:                                               ; preds = %69, %71
  br label %74

74:                                               ; preds = %73, %62
  br label %75

75:                                               ; preds = %61, %74
  br label %76

76:                                               ; preds = %75, %6
  ret void
}

define ptx_kernel void @input_scatter_fusion_25(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(21504) %3, ptr noalias align 256 dereferenceable(86016) %4, ptr noalias align 256 dereferenceable(6144) %5, ptr noalias align 256 dereferenceable(6144) %6) #0 {
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %10 = mul i32 %8, 3
  %11 = mul i32 %9, 384
  %12 = add i32 %10, %11
  %13 = getelementptr inbounds i32, ptr %1, i32 %12
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  %15 = add i32 %12, 1
  %16 = getelementptr inbounds i32, ptr %1, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = add i32 %12, 2
  %19 = getelementptr inbounds i32, ptr %1, i32 %18
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = icmp ule i32 %14, 1535
  %22 = icmp ule i32 %17, 164
  %23 = and i1 %21, %22
  %24 = icmp ule i32 %20, 11
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %79

26:                                               ; preds = %7
  %27 = mul i32 %9, 128
  %28 = add i32 %27, %8
  %29 = udiv i32 %28, 14
  %30 = getelementptr inbounds i32, ptr %4, i32 %28
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = getelementptr inbounds i32, ptr %5, i32 %29
  %33 = load i32, ptr %32, align 4, !invariant.load !3
  %34 = getelementptr inbounds i32, ptr %6, i32 %29
  %35 = load i32, ptr %34, align 4, !invariant.load !3
  %36 = call i32 @llvm.smax.i32(i32 %33, i32 %35)
  %37 = call i32 @llvm.smin.i32(i32 %36, i32 13)
  %38 = icmp slt i32 %37, %33
  %39 = add i32 %37, 14
  %40 = select i1 %38, i32 %39, i32 %37
  %41 = call i32 @llvm.smin.i32(i32 %40, i32 13)
  %42 = call i32 @llvm.smax.i32(i32 %41, i32 0)
  %43 = zext i32 %42 to i64
  %44 = trunc i64 %43 to i32
  %45 = icmp sge i32 %44, 7
  %46 = zext i1 %45 to i32
  %47 = getelementptr inbounds i8, ptr %3, i32 %28
  %48 = load i8, ptr %47, align 1, !invariant.load !3
  %49 = icmp ne i32 %31, %46
  %50 = zext i1 %49 to i8
  %51 = and i8 %48, %50
  %52 = getelementptr inbounds i8, ptr %2, i32 %28
  %53 = load i8, ptr %52, align 1, !invariant.load !3
  %54 = sitofp i8 %51 to float
  %55 = trunc i8 %53 to i1
  %56 = select i1 %55, float %54, float 0.000000e+00
  %57 = mul i32 %14, 1980
  %58 = mul i32 %17, 12
  %59 = add i32 %57, %58
  %60 = add i32 %59, %20
  %61 = getelementptr inbounds float, ptr %0, i32 %60
  %62 = load float, ptr %61, align 4
  %63 = fcmp uno float %62, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %26
  br label %78

65:                                               ; preds = %26
  %66 = fcmp uno float %56, %56
  %67 = select i1 %66, float 0x7FF8000000000000, float %56
  %68 = fcmp ult float %62, %67
  br i1 %68, label %69, label %77

69:                                               ; preds = %65
  %70 = bitcast float %67 to i32
  %71 = icmp sge i32 %70, 0
  br i1 %71, label %72, label %74

72:                                               ; preds = %69
  %73 = atomicrmw max ptr %61, i32 %70 monotonic, align 4
  br label %76

74:                                               ; preds = %69
  %75 = atomicrmw umin ptr %61, i32 %70 monotonic, align 4
  br label %76

76:                                               ; preds = %72, %74
  br label %77

77:                                               ; preds = %76, %65
  br label %78

78:                                               ; preds = %64, %77
  br label %79

79:                                               ; preds = %78, %7
  ret void
}

declare ptx_kernel void @fusion_487_impl(ptr, ptr, ptr, ptr) #8

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.div.full(float, float) #9

define ptx_kernel void @fusion_487(ptr noalias align 256 dereferenceable(21504) %arg0, ptr noalias align 256 dereferenceable(86016) %arg1, ptr noalias align 256 dereferenceable(86016) %arg2) #10 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = addrspacecast ptr null to ptr addrspace(1)
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %6 = sext i32 %5 to i64
  %7 = mul i64 %6, 448
  %8 = getelementptr i8, ptr addrspace(1) %1, i64 %7
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %10 = urem i32 %9, 32
  %11 = udiv i32 %9, 32
  %12 = and i32 %10, 8
  %13 = icmp eq i32 %12, 0
  %14 = select i1 %13, i32 0, i32 1
  %15 = xor i32 0, %14
  %16 = and i32 %10, 16
  %17 = icmp eq i32 %16, 0
  %18 = select i1 %17, i32 0, i32 2
  %19 = xor i32 %15, %18
  %20 = and i32 %11, 1
  %21 = icmp eq i32 %20, 0
  %22 = select i1 %21, i32 0, i32 4
  %23 = xor i32 %19, %22
  %24 = xor i32 %23, 0
  %25 = xor i32 %23, 8
  %26 = xor i32 %23, 16
  %27 = xor i32 %23, 24
  %28 = add i32 %24, 0
  %29 = add i32 %25, 0
  %30 = add i32 %26, 0
  %31 = add i32 %27, 0
  %32 = sext i32 %28 to i64
  %33 = sext i32 %29 to i64
  %34 = sext i32 %30 to i64
  %35 = sext i32 %31 to i64
  %36 = mul i64 %32, 14
  %37 = mul i64 %33, 14
  %38 = mul i64 %34, 14
  %39 = mul i64 %35, 14
  %40 = and i32 %10, 1
  %41 = icmp eq i32 %40, 0
  %42 = select i1 %41, i32 0, i32 2
  %43 = xor i32 0, %42
  %44 = and i32 %10, 2
  %45 = icmp eq i32 %44, 0
  %46 = select i1 %45, i32 0, i32 4
  %47 = xor i32 %43, %46
  %48 = and i32 %10, 4
  %49 = icmp eq i32 %48, 0
  %50 = select i1 %49, i32 0, i32 8
  %51 = xor i32 %47, %50
  %52 = xor i32 %51, 0
  %53 = add i32 %52, 0
  %54 = sext i32 %53 to i64
  %55 = add i64 %36, %54
  %56 = add i64 %37, %54
  %57 = add i64 %38, %54
  %58 = add i64 %39, %54
  %59 = getelementptr i8, ptr addrspace(1) %8, i64 %55
  %60 = getelementptr i8, ptr addrspace(1) %8, i64 %56
  %61 = getelementptr i8, ptr addrspace(1) %8, i64 %57
  %62 = getelementptr i8, ptr addrspace(1) %8, i64 %58
  %63 = icmp sge i64 %54, 0
  %64 = icmp slt i64 %54, 14
  %65 = and i1 %63, %64
  %66 = call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %59, i1 %65)
  %67 = bitcast i16 %66 to <2 x i8>
  %68 = extractelement <2 x i8> %67, i32 0
  %69 = extractelement <2 x i8> %67, i32 1
  %70 = call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %60, i1 %65)
  %71 = bitcast i16 %70 to <2 x i8>
  %72 = extractelement <2 x i8> %71, i32 0
  %73 = extractelement <2 x i8> %71, i32 1
  %74 = call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %61, i1 %65)
  %75 = bitcast i16 %74 to <2 x i8>
  %76 = extractelement <2 x i8> %75, i32 0
  %77 = extractelement <2 x i8> %75, i32 1
  %78 = call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %62, i1 %65)
  %79 = bitcast i16 %78 to <2 x i8>
  %80 = extractelement <2 x i8> %79, i32 0
  %81 = extractelement <2 x i8> %79, i32 1
  %82 = trunc i8 %68 to i1
  %83 = trunc i8 %69 to i1
  %84 = trunc i8 %72 to i1
  %85 = trunc i8 %73 to i1
  %86 = trunc i8 %76 to i1
  %87 = trunc i8 %77 to i1
  %88 = trunc i8 %80 to i1
  %89 = trunc i8 %81 to i1
  %90 = getelementptr float, ptr addrspace(1) %2, i64 %7
  %91 = getelementptr float, ptr addrspace(1) %90, i64 %55
  %92 = getelementptr float, ptr addrspace(1) %90, i64 %56
  %93 = getelementptr float, ptr addrspace(1) %90, i64 %57
  %94 = getelementptr float, ptr addrspace(1) %90, i64 %58
  %95 = call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %91, i1 %65)
  %96 = extractvalue { i32, i32 } %95, 0
  %97 = bitcast i32 %96 to <1 x float>
  %98 = extractvalue { i32, i32 } %95, 1
  %99 = bitcast i32 %98 to <1 x float>
  %100 = extractelement <1 x float> %97, i32 0
  %101 = extractelement <1 x float> %99, i32 0
  %102 = call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %92, i1 %65)
  %103 = extractvalue { i32, i32 } %102, 0
  %104 = bitcast i32 %103 to <1 x float>
  %105 = extractvalue { i32, i32 } %102, 1
  %106 = bitcast i32 %105 to <1 x float>
  %107 = extractelement <1 x float> %104, i32 0
  %108 = extractelement <1 x float> %106, i32 0
  %109 = call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %93, i1 %65)
  %110 = extractvalue { i32, i32 } %109, 0
  %111 = bitcast i32 %110 to <1 x float>
  %112 = extractvalue { i32, i32 } %109, 1
  %113 = bitcast i32 %112 to <1 x float>
  %114 = extractelement <1 x float> %111, i32 0
  %115 = extractelement <1 x float> %113, i32 0
  %116 = call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %94, i1 %65)
  %117 = extractvalue { i32, i32 } %116, 0
  %118 = bitcast i32 %117 to <1 x float>
  %119 = extractvalue { i32, i32 } %116, 1
  %120 = bitcast i32 %119 to <1 x float>
  %121 = extractelement <1 x float> %118, i32 0
  %122 = extractelement <1 x float> %120, i32 0
  %123 = icmp slt i32 %53, 14
  %124 = select i1 %123, float %100, float 0.000000e+00
  %125 = select i1 %123, float %101, float 0.000000e+00
  %126 = select i1 %123, float %107, float 0.000000e+00
  %127 = select i1 %123, float %108, float 0.000000e+00
  %128 = select i1 %123, float %114, float 0.000000e+00
  %129 = select i1 %123, float %115, float 0.000000e+00
  %130 = select i1 %123, float %121, float 0.000000e+00
  %131 = select i1 %123, float %122, float 0.000000e+00
  %132 = fadd float %124, %125
  %133 = fadd float %126, %127
  %134 = fadd float %128, %129
  %135 = fadd float %130, %131
  %136 = bitcast float %132 to i32
  %137 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %136, i32 4, i32 31)
  %138 = bitcast i32 %137 to float
  %139 = fadd float %132, %138
  %140 = bitcast float %139 to i32
  %141 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %140, i32 2, i32 31)
  %142 = bitcast i32 %141 to float
  %143 = fadd float %139, %142
  %144 = bitcast float %143 to i32
  %145 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %144, i32 1, i32 31)
  %146 = bitcast i32 %145 to float
  %147 = fadd float %143, %146
  %148 = bitcast float %133 to i32
  %149 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %148, i32 4, i32 31)
  %150 = bitcast i32 %149 to float
  %151 = fadd float %133, %150
  %152 = bitcast float %151 to i32
  %153 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %152, i32 2, i32 31)
  %154 = bitcast i32 %153 to float
  %155 = fadd float %151, %154
  %156 = bitcast float %155 to i32
  %157 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %156, i32 1, i32 31)
  %158 = bitcast i32 %157 to float
  %159 = fadd float %155, %158
  %160 = bitcast float %134 to i32
  %161 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %160, i32 4, i32 31)
  %162 = bitcast i32 %161 to float
  %163 = fadd float %134, %162
  %164 = bitcast float %163 to i32
  %165 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %164, i32 2, i32 31)
  %166 = bitcast i32 %165 to float
  %167 = fadd float %163, %166
  %168 = bitcast float %167 to i32
  %169 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %168, i32 1, i32 31)
  %170 = bitcast i32 %169 to float
  %171 = fadd float %167, %170
  %172 = bitcast float %135 to i32
  %173 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %172, i32 4, i32 31)
  %174 = bitcast i32 %173 to float
  %175 = fadd float %135, %174
  %176 = bitcast float %175 to i32
  %177 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %176, i32 2, i32 31)
  %178 = bitcast i32 %177 to float
  %179 = fadd float %175, %178
  %180 = bitcast float %179 to i32
  %181 = call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %180, i32 1, i32 31)
  %182 = bitcast i32 %181 to float
  %183 = fadd float %179, %182
  %184 = call float @llvm.maximum.f32(float %147, float 1.000000e+00)
  %185 = call float @llvm.maximum.f32(float %159, float 1.000000e+00)
  %186 = call float @llvm.maximum.f32(float %171, float 1.000000e+00)
  %187 = call float @llvm.maximum.f32(float %183, float 1.000000e+00)
  %188 = call float @llvm.nvvm.div.full(float %100, float %184)
  %189 = call float @llvm.nvvm.div.full(float %101, float %184)
  %190 = call float @llvm.nvvm.div.full(float %107, float %185)
  %191 = call float @llvm.nvvm.div.full(float %108, float %185)
  %192 = call float @llvm.nvvm.div.full(float %114, float %186)
  %193 = call float @llvm.nvvm.div.full(float %115, float %186)
  %194 = call float @llvm.nvvm.div.full(float %121, float %187)
  %195 = call float @llvm.nvvm.div.full(float %122, float %187)
  %196 = select i1 %82, float %188, float 0.000000e+00
  %197 = select i1 %83, float %189, float 0.000000e+00
  %198 = select i1 %84, float %190, float 0.000000e+00
  %199 = select i1 %85, float %191, float 0.000000e+00
  %200 = select i1 %86, float %192, float 0.000000e+00
  %201 = select i1 %87, float %193, float 0.000000e+00
  %202 = select i1 %88, float %194, float 0.000000e+00
  %203 = select i1 %89, float %195, float 0.000000e+00
  %204 = getelementptr float, ptr addrspace(1) %3, i64 %7
  %205 = getelementptr float, ptr addrspace(1) %204, i64 %55
  %206 = getelementptr float, ptr addrspace(1) %204, i64 %56
  %207 = getelementptr float, ptr addrspace(1) %204, i64 %57
  %208 = getelementptr float, ptr addrspace(1) %204, i64 %58
  %209 = insertelement <1 x float> undef, float %196, i32 0
  %210 = bitcast <1 x float> %209 to i32
  %211 = insertelement <1 x float> undef, float %197, i32 0
  %212 = bitcast <1 x float> %211 to i32
  call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %210, i32 %212, ptr addrspace(1) %205, i1 %65)
  %213 = insertelement <1 x float> undef, float %198, i32 0
  %214 = bitcast <1 x float> %213 to i32
  %215 = insertelement <1 x float> undef, float %199, i32 0
  %216 = bitcast <1 x float> %215 to i32
  call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %214, i32 %216, ptr addrspace(1) %206, i1 %65)
  %217 = insertelement <1 x float> undef, float %200, i32 0
  %218 = bitcast <1 x float> %217 to i32
  %219 = insertelement <1 x float> undef, float %201, i32 0
  %220 = bitcast <1 x float> %219 to i32
  call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %218, i32 %220, ptr addrspace(1) %207, i1 %65)
  %221 = insertelement <1 x float> undef, float %202, i32 0
  %222 = bitcast <1 x float> %221 to i32
  %223 = insertelement <1 x float> undef, float %203, i32 0
  %224 = bitcast <1 x float> %223 to i32
  call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %222, i32 %224, ptr addrspace(1) %208, i1 %65)
  ret void

entry:                                            ; No predecessors!
  ret void
}

define ptx_kernel void @input_scatter_fusion_24(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(86016) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %6 = mul i32 %4, 3
  %7 = mul i32 %5, 384
  %8 = add i32 %6, %7
  %9 = getelementptr inbounds i32, ptr %1, i32 %8
  %10 = load i32, ptr %9, align 4, !invariant.load !3
  %11 = add i32 %8, 1
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = add i32 %8, 2
  %15 = getelementptr inbounds i32, ptr %1, i32 %14
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = icmp ule i32 %10, 1535
  %18 = icmp ule i32 %13, 164
  %19 = and i1 %17, %18
  %20 = icmp ule i32 %16, 11
  %21 = and i1 %19, %20
  br i1 %21, label %22, label %49

22:                                               ; preds = %3
  %23 = mul i32 %5, 128
  %24 = add i32 %23, %4
  %25 = getelementptr inbounds float, ptr %2, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  %27 = mul i32 %10, 1980
  %28 = mul i32 %13, 12
  %29 = add i32 %27, %28
  %30 = add i32 %29, %16
  %31 = getelementptr inbounds float, ptr %0, i32 %30
  %32 = load float, ptr %31, align 4
  %33 = fcmp uno float %32, %32
  br i1 %33, label %34, label %35

34:                                               ; preds = %22
  br label %48

35:                                               ; preds = %22
  %36 = fcmp uno float %26, %26
  %37 = select i1 %36, float 0x7FF8000000000000, float %26
  %38 = fcmp ult float %32, %37
  br i1 %38, label %39, label %47

39:                                               ; preds = %35
  %40 = bitcast float %37 to i32
  %41 = icmp sge i32 %40, 0
  br i1 %41, label %42, label %44

42:                                               ; preds = %39
  %43 = atomicrmw max ptr %31, i32 %40 monotonic, align 4
  br label %46

44:                                               ; preds = %39
  %45 = atomicrmw umin ptr %31, i32 %40 monotonic, align 4
  br label %46

46:                                               ; preds = %42, %44
  br label %47

47:                                               ; preds = %46, %35
  br label %48

48:                                               ; preds = %34, %47
  br label %49

49:                                               ; preds = %48, %3
  ret void
}

define ptx_kernel void @input_scatter_fusion_22(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(86016) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %8 = mul i32 %6, 3
  %9 = mul i32 %7, 384
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i32, ptr %1, i32 %10
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  %13 = add i32 %10, 1
  %14 = getelementptr inbounds i32, ptr %1, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = add i32 %10, 2
  %17 = getelementptr inbounds i32, ptr %1, i32 %16
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = icmp ule i32 %12, 1535
  %20 = icmp ule i32 %15, 164
  %21 = and i1 %19, %20
  %22 = icmp ule i32 %18, 11
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %74

24:                                               ; preds = %5
  %25 = mul i32 %7, 128
  %26 = add i32 %25, %6
  %27 = getelementptr inbounds i32, ptr %4, i32 %26
  %28 = load i32, ptr %27, align 4, !invariant.load !3
  %29 = icmp slt i32 %28, 0
  %30 = add i32 %28, 101
  %31 = select i1 %29, i32 %30, i32 %28
  %32 = call i32 @llvm.smin.i32(i32 %31, i32 100)
  %33 = call i32 @llvm.smax.i32(i32 %32, i32 0)
  %34 = mul i32 %33, 20
  %35 = add i32 %34, 12
  %36 = getelementptr inbounds float, ptr %3, i32 %35
  %37 = load float, ptr %36, align 4, !invariant.load !3
  %38 = fptosi float %37 to i32
  %39 = fcmp ole float %37, 0xC1E0000000000000
  %40 = select i1 %39, i32 -2147483648, i32 %38
  %41 = fcmp oge float %37, 0x41E0000000000000
  %42 = select i1 %41, i32 2147483647, i32 %40
  %43 = fcmp uno float %37, %37
  %44 = select i1 %43, i32 0, i32 %42
  %45 = icmp sgt i32 %44, 0
  %46 = zext i1 %45 to i8
  %47 = getelementptr inbounds i8, ptr %2, i32 %26
  %48 = load i8, ptr %47, align 1, !invariant.load !3
  %49 = sitofp i8 %46 to float
  %50 = trunc i8 %48 to i1
  %51 = select i1 %50, float %49, float 0.000000e+00
  %52 = mul i32 %12, 1980
  %53 = mul i32 %15, 12
  %54 = add i32 %52, %53
  %55 = add i32 %54, %18
  %56 = getelementptr inbounds float, ptr %0, i32 %55
  %57 = load float, ptr %56, align 4
  %58 = fcmp uno float %57, %57
  br i1 %58, label %59, label %60

59:                                               ; preds = %24
  br label %73

60:                                               ; preds = %24
  %61 = fcmp uno float %51, %51
  %62 = select i1 %61, float 0x7FF8000000000000, float %51
  %63 = fcmp ult float %57, %62
  br i1 %63, label %64, label %72

64:                                               ; preds = %60
  %65 = bitcast float %62 to i32
  %66 = icmp sge i32 %65, 0
  br i1 %66, label %67, label %69

67:                                               ; preds = %64
  %68 = atomicrmw max ptr %56, i32 %65 monotonic, align 4
  br label %71

69:                                               ; preds = %64
  %70 = atomicrmw umin ptr %56, i32 %65 monotonic, align 4
  br label %71

71:                                               ; preds = %67, %69
  br label %72

72:                                               ; preds = %71, %60
  br label %73

73:                                               ; preds = %59, %72
  br label %74

74:                                               ; preds = %73, %5
  ret void
}

define ptx_kernel void @input_scatter_fusion_20(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(6144) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %7 = mul i32 %5, 3
  %8 = mul i32 %6, 384
  %9 = add i32 %7, %8
  %10 = getelementptr inbounds i32, ptr %1, i32 %9
  %11 = load i32, ptr %10, align 4, !invariant.load !3
  %12 = add i32 %9, 1
  %13 = getelementptr inbounds i32, ptr %1, i32 %12
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  %15 = add i32 %9, 2
  %16 = getelementptr inbounds i32, ptr %1, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = icmp ule i32 %11, 1535
  %19 = icmp ule i32 %14, 164
  %20 = and i1 %18, %19
  %21 = icmp ule i32 %17, 11
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %61

23:                                               ; preds = %4
  %24 = mul i32 %6, 128
  %25 = add i32 %24, %5
  %26 = udiv i32 %25, 14
  %27 = urem i32 %25, 14
  %28 = zext i32 %27 to i64
  %29 = trunc i64 %28 to i32
  %30 = getelementptr inbounds i32, ptr %3, i32 %26
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = icmp eq i32 %29, %31
  %33 = zext i1 %32 to i8
  %34 = getelementptr inbounds i8, ptr %2, i32 %25
  %35 = load i8, ptr %34, align 1, !invariant.load !3
  %36 = sitofp i8 %33 to float
  %37 = trunc i8 %35 to i1
  %38 = select i1 %37, float %36, float 0.000000e+00
  %39 = mul i32 %11, 1980
  %40 = mul i32 %14, 12
  %41 = add i32 %39, %40
  %42 = add i32 %41, %17
  %43 = getelementptr inbounds float, ptr %0, i32 %42
  %44 = load float, ptr %43, align 4
  %45 = fcmp uno float %44, %44
  br i1 %45, label %46, label %47

46:                                               ; preds = %23
  br label %60

47:                                               ; preds = %23
  %48 = fcmp uno float %38, %38
  %49 = select i1 %48, float 0x7FF8000000000000, float %38
  %50 = fcmp ult float %44, %49
  br i1 %50, label %51, label %59

51:                                               ; preds = %47
  %52 = bitcast float %49 to i32
  %53 = icmp sge i32 %52, 0
  br i1 %53, label %54, label %56

54:                                               ; preds = %51
  %55 = atomicrmw max ptr %43, i32 %52 monotonic, align 4
  br label %58

56:                                               ; preds = %51
  %57 = atomicrmw umin ptr %43, i32 %52 monotonic, align 4
  br label %58

58:                                               ; preds = %54, %56
  br label %59

59:                                               ; preds = %58, %47
  br label %60

60:                                               ; preds = %46, %59
  br label %61

61:                                               ; preds = %60, %4
  ret void
}

define ptx_kernel void @input_scatter_fusion_18(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(86016) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %7 = mul i32 %5, 3
  %8 = mul i32 %6, 384
  %9 = add i32 %7, %8
  %10 = getelementptr inbounds i32, ptr %1, i32 %9
  %11 = load i32, ptr %10, align 4, !invariant.load !3
  %12 = add i32 %9, 1
  %13 = getelementptr inbounds i32, ptr %1, i32 %12
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  %15 = add i32 %9, 2
  %16 = getelementptr inbounds i32, ptr %1, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = icmp ule i32 %11, 1535
  %19 = icmp ule i32 %14, 164
  %20 = and i1 %18, %19
  %21 = icmp ule i32 %17, 11
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %142

23:                                               ; preds = %4
  %24 = mul i32 %6, 128
  %25 = add i32 %24, %5
  %26 = getelementptr inbounds i32, ptr %3, i32 %25
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  %28 = udiv i32 %25, 14
  %29 = mul i32 %28, 14
  %30 = getelementptr inbounds i32, ptr %3, i32 %29
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = icmp sgt i32 %31, %27
  %33 = zext i1 %32 to i32
  %34 = add i32 %29, 1
  %35 = getelementptr inbounds i32, ptr %3, i32 %34
  %36 = load i32, ptr %35, align 4, !invariant.load !3
  %37 = icmp sgt i32 %36, %27
  %38 = zext i1 %37 to i32
  %39 = add i32 %33, %38
  %40 = add i32 %29, 2
  %41 = getelementptr inbounds i32, ptr %3, i32 %40
  %42 = load i32, ptr %41, align 4, !invariant.load !3
  %43 = icmp sgt i32 %42, %27
  %44 = zext i1 %43 to i32
  %45 = add i32 %39, %44
  %46 = add i32 %29, 3
  %47 = getelementptr inbounds i32, ptr %3, i32 %46
  %48 = load i32, ptr %47, align 4, !invariant.load !3
  %49 = icmp sgt i32 %48, %27
  %50 = zext i1 %49 to i32
  %51 = add i32 %45, %50
  %52 = add i32 %29, 4
  %53 = getelementptr inbounds i32, ptr %3, i32 %52
  %54 = load i32, ptr %53, align 4, !invariant.load !3
  %55 = icmp sgt i32 %54, %27
  %56 = zext i1 %55 to i32
  %57 = add i32 %51, %56
  %58 = add i32 %29, 5
  %59 = getelementptr inbounds i32, ptr %3, i32 %58
  %60 = load i32, ptr %59, align 4, !invariant.load !3
  %61 = icmp sgt i32 %60, %27
  %62 = zext i1 %61 to i32
  %63 = add i32 %57, %62
  %64 = add i32 %29, 6
  %65 = getelementptr inbounds i32, ptr %3, i32 %64
  %66 = load i32, ptr %65, align 4, !invariant.load !3
  %67 = icmp sgt i32 %66, %27
  %68 = zext i1 %67 to i32
  %69 = add i32 %63, %68
  %70 = add i32 %29, 7
  %71 = getelementptr inbounds i32, ptr %3, i32 %70
  %72 = load i32, ptr %71, align 4, !invariant.load !3
  %73 = icmp sgt i32 %72, %27
  %74 = zext i1 %73 to i32
  %75 = add i32 %69, %74
  %76 = add i32 %29, 8
  %77 = getelementptr inbounds i32, ptr %3, i32 %76
  %78 = load i32, ptr %77, align 4, !invariant.load !3
  %79 = icmp sgt i32 %78, %27
  %80 = zext i1 %79 to i32
  %81 = add i32 %75, %80
  %82 = add i32 %29, 9
  %83 = getelementptr inbounds i32, ptr %3, i32 %82
  %84 = load i32, ptr %83, align 4, !invariant.load !3
  %85 = icmp sgt i32 %84, %27
  %86 = zext i1 %85 to i32
  %87 = add i32 %81, %86
  %88 = add i32 %29, 10
  %89 = getelementptr inbounds i32, ptr %3, i32 %88
  %90 = load i32, ptr %89, align 4, !invariant.load !3
  %91 = icmp sgt i32 %90, %27
  %92 = zext i1 %91 to i32
  %93 = add i32 %87, %92
  %94 = add i32 %29, 11
  %95 = getelementptr inbounds i32, ptr %3, i32 %94
  %96 = load i32, ptr %95, align 4, !invariant.load !3
  %97 = icmp sgt i32 %96, %27
  %98 = zext i1 %97 to i32
  %99 = add i32 %93, %98
  %100 = add i32 %29, 12
  %101 = getelementptr inbounds i32, ptr %3, i32 %100
  %102 = load i32, ptr %101, align 4, !invariant.load !3
  %103 = icmp sgt i32 %102, %27
  %104 = zext i1 %103 to i32
  %105 = add i32 %99, %104
  %106 = add i32 %29, 13
  %107 = getelementptr inbounds i32, ptr %3, i32 %106
  %108 = load i32, ptr %107, align 4, !invariant.load !3
  %109 = icmp sgt i32 %108, %27
  %110 = zext i1 %109 to i32
  %111 = add i32 %105, %110
  %112 = sitofp i32 %111 to float
  %113 = fmul float %112, 0x3FB24924A0000000
  %114 = getelementptr inbounds i8, ptr %2, i32 %25
  %115 = load i8, ptr %114, align 1, !invariant.load !3
  %116 = call float @llvm.maximum.f32(float %113, float 0.000000e+00)
  %117 = call float @llvm.minimum.f32(float %116, float 1.000000e+00)
  %118 = trunc i8 %115 to i1
  %119 = select i1 %118, float %117, float 0.000000e+00
  %120 = mul i32 %11, 1980
  %121 = mul i32 %14, 12
  %122 = add i32 %120, %121
  %123 = add i32 %122, %17
  %124 = getelementptr inbounds float, ptr %0, i32 %123
  %125 = load float, ptr %124, align 4
  %126 = fcmp uno float %125, %125
  br i1 %126, label %127, label %128

127:                                              ; preds = %23
  br label %141

128:                                              ; preds = %23
  %129 = fcmp uno float %119, %119
  %130 = select i1 %129, float 0x7FF8000000000000, float %119
  %131 = fcmp ult float %125, %130
  br i1 %131, label %132, label %140

132:                                              ; preds = %128
  %133 = bitcast float %130 to i32
  %134 = icmp sge i32 %133, 0
  br i1 %134, label %135, label %137

135:                                              ; preds = %132
  %136 = atomicrmw max ptr %124, i32 %133 monotonic, align 4
  br label %139

137:                                              ; preds = %132
  %138 = atomicrmw umin ptr %124, i32 %133 monotonic, align 4
  br label %139

139:                                              ; preds = %135, %137
  br label %140

140:                                              ; preds = %139, %128
  br label %141

141:                                              ; preds = %127, %140
  br label %142

142:                                              ; preds = %141, %4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minimum.f32(float, float) #1

define ptx_kernel void @input_transpose_fusion_1(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(253440) %1, ptr noalias align 256 dereferenceable(253440) %2, ptr noalias align 256 dereferenceable(253440) %3, ptr noalias align 256 dereferenceable(253440) %4, ptr noalias align 256 dereferenceable(6144) %5, ptr noalias align 256 dereferenceable(6144) %6, ptr noalias align 256 dereferenceable(12165120) %7) #0 {
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %11 = mul i32 %10, 32
  %12 = urem i32 %9, 32
  %13 = add i32 %11, %12
  %14 = udiv i32 %13, 165
  %15 = mul i32 %12, 12
  %16 = mul i32 %10, 384
  %17 = add i32 %15, %16
  %18 = udiv i32 %9, 32
  %19 = add i32 %17, %18
  %20 = getelementptr inbounds float, ptr %0, i32 %19
  %21 = load float, ptr %20, align 4, !invariant.load !3
  %22 = mul i32 %12, 33
  %23 = add i32 %22, %18
  %24 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %23
  store float %21, ptr %24, align 4
  %25 = add i32 %18, 4
  %26 = icmp sge i32 %25, 6
  %27 = icmp slt i32 %25, 7
  %28 = and i1 %26, %27
  br i1 %28, label %29, label %41

29:                                               ; preds = %8
  %30 = getelementptr inbounds i32, ptr %5, i32 %14
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = getelementptr inbounds i32, ptr %6, i32 %14
  %33 = load i32, ptr %32, align 4, !invariant.load !3
  %34 = icmp sge i32 %31, %33
  %35 = getelementptr inbounds i8, ptr %3, i32 %13
  %36 = load i8, ptr %35, align 1, !invariant.load !3
  %37 = getelementptr inbounds i8, ptr %4, i32 %13
  %38 = load i8, ptr %37, align 1, !invariant.load !3
  %39 = select i1 %34, i8 %36, i8 %38
  %40 = sitofp i8 %39 to float
  br label %54

41:                                               ; preds = %8
  %42 = icmp sge i32 %25, 7
  br i1 %42, label %43, label %47

43:                                               ; preds = %41
  %44 = getelementptr inbounds i8, ptr %1, i32 %13
  %45 = load i8, ptr %44, align 1, !invariant.load !3
  %46 = sitofp i8 %45 to float
  br label %51

47:                                               ; preds = %41
  %48 = add i32 %19, 4
  %49 = getelementptr inbounds float, ptr %0, i32 %48
  %50 = load float, ptr %49, align 4, !invariant.load !3
  br label %51

51:                                               ; preds = %43, %47
  %52 = phi float [ %50, %47 ], [ %46, %43 ]
  br label %53

53:                                               ; preds = %51
  br label %54

54:                                               ; preds = %29, %53
  %55 = phi float [ %52, %53 ], [ %40, %29 ]
  br label %56

56:                                               ; preds = %54
  %57 = add i32 %23, 4
  %58 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %57
  store float %55, ptr %58, align 4
  %59 = add i32 %18, 8
  %60 = icmp sge i32 %59, 10
  %61 = icmp slt i32 %59, 11
  %62 = and i1 %60, %61
  br i1 %62, label %63, label %67

63:                                               ; preds = %56
  %64 = getelementptr inbounds i8, ptr %2, i32 %13
  %65 = load i8, ptr %64, align 1, !invariant.load !3
  %66 = sitofp i8 %65 to float
  br label %71

67:                                               ; preds = %56
  %68 = add i32 %19, 8
  %69 = getelementptr inbounds float, ptr %0, i32 %68
  %70 = load float, ptr %69, align 4, !invariant.load !3
  br label %71

71:                                               ; preds = %63, %67
  %72 = phi float [ %70, %67 ], [ %66, %63 ]
  br label %73

73:                                               ; preds = %71
  %74 = add i32 %23, 8
  %75 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %74
  store float %72, ptr %75, align 4
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %76 = icmp sle i32 %12, 11
  br i1 %76, label %77, label %121

77:                                               ; preds = %73
  %78 = mul i32 %18, 33
  %79 = add i32 %78, %12
  %80 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %79
  %81 = load float, ptr %80, align 4
  %82 = mul i32 %18, 12
  %83 = add i32 %82, %16
  %84 = add i32 %83, %12
  %85 = getelementptr inbounds float, ptr %7, i32 %84
  store float %81, ptr %85, align 4
  %86 = add i32 %79, 132
  %87 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %86
  %88 = load float, ptr %87, align 4
  %89 = add i32 %84, 48
  %90 = getelementptr inbounds float, ptr %7, i32 %89
  store float %88, ptr %90, align 4
  %91 = add i32 %79, 264
  %92 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %91
  %93 = load float, ptr %92, align 4
  %94 = add i32 %84, 96
  %95 = getelementptr inbounds float, ptr %7, i32 %94
  store float %93, ptr %95, align 4
  %96 = add i32 %79, 396
  %97 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %96
  %98 = load float, ptr %97, align 4
  %99 = add i32 %84, 144
  %100 = getelementptr inbounds float, ptr %7, i32 %99
  store float %98, ptr %100, align 4
  %101 = add i32 %79, 528
  %102 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %101
  %103 = load float, ptr %102, align 4
  %104 = add i32 %84, 192
  %105 = getelementptr inbounds float, ptr %7, i32 %104
  store float %103, ptr %105, align 4
  %106 = add i32 %79, 660
  %107 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %106
  %108 = load float, ptr %107, align 4
  %109 = add i32 %84, 240
  %110 = getelementptr inbounds float, ptr %7, i32 %109
  store float %108, ptr %110, align 4
  %111 = add i32 %79, 792
  %112 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %111
  %113 = load float, ptr %112, align 4
  %114 = add i32 %84, 288
  %115 = getelementptr inbounds float, ptr %7, i32 %114
  store float %113, ptr %115, align 4
  %116 = add i32 %79, 924
  %117 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_0 to ptr), i32 %116
  %118 = load float, ptr %117, align 4
  %119 = add i32 %84, 336
  %120 = getelementptr inbounds float, ptr %7, i32 %119
  store float %118, ptr %120, align 4
  br label %121

121:                                              ; preds = %77, %73
  ret void
}

define ptx_kernel void @input_scatter_fusion_13(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(6144) %4, ptr noalias align 256 dereferenceable(86016) %5, ptr noalias align 256 dereferenceable(12288) %6, ptr noalias align 256 dereferenceable(6144) %7, ptr noalias align 256 dereferenceable(6144) %8, ptr noalias align 256 dereferenceable(86016) %9) #0 {
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %13 = mul i32 %11, 3
  %14 = mul i32 %12, 384
  %15 = add i32 %13, %14
  %16 = getelementptr inbounds i32, ptr %1, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = add i32 %15, 1
  %19 = getelementptr inbounds i32, ptr %1, i32 %18
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = add i32 %15, 2
  %22 = getelementptr inbounds i32, ptr %1, i32 %21
  %23 = load i32, ptr %22, align 4, !invariant.load !3
  %24 = icmp ule i32 %17, 1535
  %25 = icmp ule i32 %20, 164
  %26 = and i1 %24, %25
  %27 = icmp ule i32 %23, 11
  %28 = and i1 %26, %27
  br i1 %28, label %29, label %173

29:                                               ; preds = %10
  %30 = mul i32 %12, 128
  %31 = add i32 %30, %11
  %32 = udiv i32 %31, 14
  %33 = urem i32 %31, 14
  %34 = zext i32 %33 to i64
  %35 = trunc i64 %34 to i32
  %36 = call i32 @llvm.smin.i32(i32 %35, i32 13)
  %37 = call i32 @llvm.smax.i32(i32 %36, i32 0)
  %38 = call float @fused_scatter_13_bitcast_1290_292(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 1, i32 %32, i32 %37)
  %39 = fptosi float %38 to i32
  %40 = fcmp ole float %38, 0xC1E0000000000000
  %41 = select i1 %40, i32 -2147483648, i32 %39
  %42 = fcmp oge float %38, 0x41E0000000000000
  %43 = select i1 %42, i32 2147483647, i32 %41
  %44 = fcmp uno float %38, %38
  %45 = select i1 %44, i32 0, i32 %43
  %46 = mul i32 %32, 2
  %47 = getelementptr inbounds i32, ptr %6, i32 %46
  %48 = load i32, ptr %47, align 4, !invariant.load !3
  %49 = call i32 @llvm.smin.i32(i32 %48, i32 1535)
  %50 = call i32 @llvm.smax.i32(i32 %49, i32 0)
  %51 = add i32 %46, 1
  %52 = getelementptr inbounds i32, ptr %6, i32 %51
  %53 = load i32, ptr %52, align 4, !invariant.load !3
  %54 = call i32 @llvm.smin.i32(i32 %53, i32 13)
  %55 = call i32 @llvm.smax.i32(i32 %54, i32 0)
  %56 = call float @fused_scatter_13_bitcast_1290_292(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %50, i32 %55)
  %57 = fptosi float %56 to i32
  %58 = fcmp ole float %56, 0xC1E0000000000000
  %59 = select i1 %58, i32 -2147483648, i32 %57
  %60 = fcmp oge float %56, 0x41E0000000000000
  %61 = select i1 %60, i32 2147483647, i32 %59
  %62 = fcmp uno float %56, %56
  %63 = select i1 %62, i32 0, i32 %61
  %64 = sub i32 %63, %45
  %65 = sub i32 0, %64
  %66 = call i32 @llvm.smin.i32(i32 %64, i32 60)
  %67 = call i32 @llvm.smin.i32(i32 %65, i32 28)
  %68 = call i32 @fused_scatter_13_maximum_82_31(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %37)
  %69 = sitofp i32 %66 to float
  %70 = sitofp i32 %67 to float
  %71 = add i32 %68, -1
  %72 = fmul float %69, 0x3FA99999A0000000
  %73 = fmul float %70, 0x3F999999A0000000
  %74 = call float @fused_scatter_13_bitcast_1290_292(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 4, i32 %32, i32 %37)
  %75 = fptosi float %74 to i32
  %76 = fcmp ole float %74, 0xC1E0000000000000
  %77 = select i1 %76, i32 -2147483648, i32 %75
  %78 = fcmp oge float %74, 0x41E0000000000000
  %79 = select i1 %78, i32 2147483647, i32 %77
  %80 = fcmp uno float %74, %74
  %81 = select i1 %80, i32 0, i32 %79
  %82 = mul i32 %71, %81
  %83 = icmp sge i32 %64, 0
  %84 = call float @fused_scatter_13_broadcast_3142_85(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %33)
  %85 = fadd float %72, %84
  %86 = fsub float %84, %73
  %87 = add i32 %82, %81
  %88 = call float @fused_scatter_13_bitcast_1290_292(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 2, i32 %50, i32 %55)
  %89 = fptosi float %88 to i32
  %90 = fcmp ole float %88, 0xC1E0000000000000
  %91 = select i1 %90, i32 -2147483648, i32 %89
  %92 = fcmp oge float %88, 0x41E0000000000000
  %93 = select i1 %92, i32 2147483647, i32 %91
  %94 = fcmp uno float %88, %88
  %95 = select i1 %94, i32 0, i32 %93
  %96 = call float @fused_scatter_13_bitcast_1290_292(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 3, i32 %50, i32 %55)
  %97 = fptosi float %96 to i32
  %98 = fcmp ole float %96, 0xC1E0000000000000
  %99 = select i1 %98, i32 -2147483648, i32 %97
  %100 = fcmp oge float %96, 0x41E0000000000000
  %101 = select i1 %100, i32 2147483647, i32 %99
  %102 = fcmp uno float %96, %96
  %103 = select i1 %102, i32 0, i32 %101
  %104 = add i32 %95, %103
  %105 = call i32 @fused_scatter_13_maximum_82_31(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %50, i32 %55)
  %106 = sitofp i32 %104 to float
  %107 = sitofp i32 %105 to float
  %108 = fmul float %106, 5.000000e-01
  %109 = fmul float %107, %108
  %110 = select i1 %83, float %85, float %86
  %111 = call i32 @fused_scatter_13_broadcast_3139_45(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %33)
  %112 = call i32 @llvm.smax.i32(i32 %87, i32 %111)
  %113 = fmul float %109, %110
  %114 = sitofp i32 %112 to float
  %115 = mul i32 %32, 14
  %116 = add i32 %115, %37
  %117 = getelementptr inbounds i32, ptr %9, i32 %116
  %118 = load i32, ptr %117, align 4, !invariant.load !3
  %119 = getelementptr inbounds i32, ptr %8, i32 %32
  %120 = load i32, ptr %119, align 4, !invariant.load !3
  %121 = getelementptr inbounds i32, ptr %7, i32 %32
  %122 = load i32, ptr %121, align 4, !invariant.load !3
  %123 = call i32 @llvm.smax.i32(i32 %120, i32 %122)
  %124 = call i32 @llvm.smin.i32(i32 %123, i32 13)
  %125 = icmp slt i32 %124, %120
  %126 = add i32 %124, 14
  %127 = select i1 %125, i32 %126, i32 %124
  %128 = call i32 @llvm.smin.i32(i32 %127, i32 13)
  %129 = call i32 @llvm.smax.i32(i32 %128, i32 0)
  %130 = zext i32 %129 to i64
  %131 = trunc i64 %130 to i32
  %132 = icmp sge i32 %131, 7
  %133 = zext i1 %132 to i32
  %134 = icmp ne i32 %118, %133
  %135 = zext i1 %134 to i8
  %136 = getelementptr inbounds i8, ptr %2, i32 %116
  %137 = load i8, ptr %136, align 1, !invariant.load !3
  %138 = and i8 %137, %135
  %139 = icmp sge i32 %122, %120
  %140 = zext i1 %139 to i8
  %141 = fdiv float %113, %114
  %142 = and i8 %138, %140
  %143 = call float @llvm.maximum.f32(float %141, float 0.000000e+00)
  %144 = call float @llvm.minimum.f32(float %143, float %84)
  %145 = trunc i8 %142 to i1
  %146 = select i1 %145, float %144, float 0.000000e+00
  %147 = getelementptr inbounds i8, ptr %2, i32 %31
  %148 = load i8, ptr %147, align 1, !invariant.load !3
  %149 = trunc i8 %148 to i1
  %150 = select i1 %149, float %146, float 0.000000e+00
  %151 = mul i32 %17, 1980
  %152 = mul i32 %20, 12
  %153 = add i32 %151, %152
  %154 = add i32 %153, %23
  %155 = getelementptr inbounds float, ptr %0, i32 %154
  %156 = load float, ptr %155, align 4
  %157 = fcmp uno float %156, %156
  br i1 %157, label %158, label %159

158:                                              ; preds = %29
  br label %172

159:                                              ; preds = %29
  %160 = fcmp uno float %150, %150
  %161 = select i1 %160, float 0x7FF8000000000000, float %150
  %162 = fcmp ult float %156, %161
  br i1 %162, label %163, label %171

163:                                              ; preds = %159
  %164 = bitcast float %161 to i32
  %165 = icmp sge i32 %164, 0
  br i1 %165, label %166, label %168

166:                                              ; preds = %163
  %167 = atomicrmw max ptr %155, i32 %164 monotonic, align 4
  br label %170

168:                                              ; preds = %163
  %169 = atomicrmw umin ptr %155, i32 %164 monotonic, align 4
  br label %170

170:                                              ; preds = %166, %168
  br label %171

171:                                              ; preds = %170, %159
  br label %172

172:                                              ; preds = %158, %171
  br label %173

173:                                              ; preds = %172, %10
  ret void
}

define internal float @fused_scatter_13_bitcast_1290_292(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = mul i32 %11, 14
  %15 = add i32 %14, %12
  %16 = getelementptr inbounds i32, ptr %5, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = icmp slt i32 %17, 0
  %19 = add i32 %17, 101
  %20 = select i1 %18, i32 %19, i32 %17
  %21 = call i32 @llvm.smin.i32(i32 %20, i32 100)
  %22 = call i32 @llvm.smax.i32(i32 %21, i32 0)
  %23 = mul i32 %22, 20
  %24 = add i32 %23, %10
  %25 = getelementptr inbounds float, ptr %3, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  ret float %26
}

define internal i32 @fused_scatter_13_maximum_82_31(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = call float @fused_scatter_13_bitcast_1290_292(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 6, i32 %11, i32 %12)
  %15 = getelementptr inbounds float, ptr %4, i32 %11
  %16 = load float, ptr %15, align 4, !invariant.load !3
  %17 = call float @fused_scatter_13_broadcast_3142_85(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 %10, i32 %11, i32 %12)
  %18 = call float @llvm.maximum.f32(float %14, float %17)
  %19 = fdiv float %16, %18
  %20 = fptosi float %19 to i32
  %21 = fcmp ole float %19, 0xC1E0000000000000
  %22 = select i1 %21, i32 -2147483648, i32 %20
  %23 = fcmp oge float %19, 0x41E0000000000000
  %24 = select i1 %23, i32 2147483647, i32 %22
  %25 = fcmp uno float %19, %19
  %26 = select i1 %25, i32 0, i32 %24
  %27 = call i32 @fused_scatter_13_broadcast_3139_45(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 %10, i32 %11, i32 %12)
  %28 = call i32 @llvm.smax.i32(i32 %26, i32 %27)
  ret i32 %28
}

define internal float @fused_scatter_13_broadcast_3142_85(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  ret float 1.000000e+00
}

define internal i32 @fused_scatter_13_broadcast_3139_45(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  ret i32 1
}

define ptx_kernel void @input_scatter_fusion_12(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(6144) %4, ptr noalias align 256 dereferenceable(86016) %5, ptr noalias align 256 dereferenceable(12288) %6, ptr noalias align 256 dereferenceable(6144) %7, ptr noalias align 256 dereferenceable(6144) %8, ptr noalias align 256 dereferenceable(21504) %9, ptr noalias align 256 dereferenceable(86016) %10) #0 {
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %14 = mul i32 %12, 3
  %15 = mul i32 %13, 384
  %16 = add i32 %14, %15
  %17 = getelementptr inbounds i32, ptr %1, i32 %16
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = add i32 %16, 1
  %20 = getelementptr inbounds i32, ptr %1, i32 %19
  %21 = load i32, ptr %20, align 4, !invariant.load !3
  %22 = add i32 %16, 2
  %23 = getelementptr inbounds i32, ptr %1, i32 %22
  %24 = load i32, ptr %23, align 4, !invariant.load !3
  %25 = icmp ule i32 %18, 1535
  %26 = icmp ule i32 %21, 164
  %27 = and i1 %25, %26
  %28 = icmp ule i32 %24, 11
  %29 = and i1 %27, %28
  br i1 %29, label %30, label %174

30:                                               ; preds = %11
  %31 = mul i32 %13, 128
  %32 = add i32 %31, %12
  %33 = udiv i32 %32, 14
  %34 = urem i32 %32, 14
  %35 = getelementptr inbounds i8, ptr %2, i32 %32
  %36 = load i8, ptr %35, align 1, !invariant.load !3
  %37 = zext i32 %34 to i64
  %38 = trunc i64 %37 to i32
  %39 = call i32 @llvm.smin.i32(i32 %38, i32 13)
  %40 = call i32 @llvm.smax.i32(i32 %39, i32 0)
  %41 = call float @fused_scatter_12_bitcast_1290_298(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 1, i32 %33, i32 %40)
  %42 = fptosi float %41 to i32
  %43 = fcmp ole float %41, 0xC1E0000000000000
  %44 = select i1 %43, i32 -2147483648, i32 %42
  %45 = fcmp oge float %41, 0x41E0000000000000
  %46 = select i1 %45, i32 2147483647, i32 %44
  %47 = fcmp uno float %41, %41
  %48 = select i1 %47, i32 0, i32 %46
  %49 = mul i32 %33, 2
  %50 = getelementptr inbounds i32, ptr %6, i32 %49
  %51 = load i32, ptr %50, align 4, !invariant.load !3
  %52 = call i32 @llvm.smin.i32(i32 %51, i32 1535)
  %53 = call i32 @llvm.smax.i32(i32 %52, i32 0)
  %54 = add i32 %49, 1
  %55 = getelementptr inbounds i32, ptr %6, i32 %54
  %56 = load i32, ptr %55, align 4, !invariant.load !3
  %57 = call i32 @llvm.smin.i32(i32 %56, i32 13)
  %58 = call i32 @llvm.smax.i32(i32 %57, i32 0)
  %59 = call float @fused_scatter_12_bitcast_1290_298(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %53, i32 %58)
  %60 = fptosi float %59 to i32
  %61 = fcmp ole float %59, 0xC1E0000000000000
  %62 = select i1 %61, i32 -2147483648, i32 %60
  %63 = fcmp oge float %59, 0x41E0000000000000
  %64 = select i1 %63, i32 2147483647, i32 %62
  %65 = fcmp uno float %59, %59
  %66 = select i1 %65, i32 0, i32 %64
  %67 = sub i32 %66, %48
  %68 = sub i32 0, %67
  %69 = call i32 @llvm.smin.i32(i32 %67, i32 60)
  %70 = call i32 @llvm.smin.i32(i32 %68, i32 28)
  %71 = call i32 @fused_scatter_12_maximum_82_33(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %33, i32 %40)
  %72 = sitofp i32 %69 to float
  %73 = sitofp i32 %70 to float
  %74 = add i32 %71, -1
  %75 = fmul float %72, 0x3FA99999A0000000
  %76 = fmul float %73, 0x3F999999A0000000
  %77 = call float @fused_scatter_12_bitcast_1290_298(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 4, i32 %33, i32 %40)
  %78 = fptosi float %77 to i32
  %79 = fcmp ole float %77, 0xC1E0000000000000
  %80 = select i1 %79, i32 -2147483648, i32 %78
  %81 = fcmp oge float %77, 0x41E0000000000000
  %82 = select i1 %81, i32 2147483647, i32 %80
  %83 = fcmp uno float %77, %77
  %84 = select i1 %83, i32 0, i32 %82
  %85 = mul i32 %74, %84
  %86 = icmp sge i32 %67, 0
  %87 = call float @fused_scatter_12_broadcast_3142_87(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %33, i32 %34)
  %88 = fadd float %75, %87
  %89 = fsub float %87, %76
  %90 = add i32 %85, %84
  %91 = call float @fused_scatter_12_bitcast_1290_298(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 2, i32 %53, i32 %58)
  %92 = fptosi float %91 to i32
  %93 = fcmp ole float %91, 0xC1E0000000000000
  %94 = select i1 %93, i32 -2147483648, i32 %92
  %95 = fcmp oge float %91, 0x41E0000000000000
  %96 = select i1 %95, i32 2147483647, i32 %94
  %97 = fcmp uno float %91, %91
  %98 = select i1 %97, i32 0, i32 %96
  %99 = call float @fused_scatter_12_bitcast_1290_298(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 3, i32 %53, i32 %58)
  %100 = fptosi float %99 to i32
  %101 = fcmp ole float %99, 0xC1E0000000000000
  %102 = select i1 %101, i32 -2147483648, i32 %100
  %103 = fcmp oge float %99, 0x41E0000000000000
  %104 = select i1 %103, i32 2147483647, i32 %102
  %105 = fcmp uno float %99, %99
  %106 = select i1 %105, i32 0, i32 %104
  %107 = add i32 %98, %106
  %108 = call i32 @fused_scatter_12_maximum_82_33(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %53, i32 %58)
  %109 = sitofp i32 %107 to float
  %110 = sitofp i32 %108 to float
  %111 = fmul float %109, 5.000000e-01
  %112 = fmul float %110, %111
  %113 = select i1 %86, float %88, float %89
  %114 = call i32 @fused_scatter_12_broadcast_3139_47(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %33, i32 %34)
  %115 = call i32 @llvm.smax.i32(i32 %90, i32 %114)
  %116 = fmul float %112, %113
  %117 = sitofp i32 %115 to float
  %118 = mul i32 %33, 14
  %119 = add i32 %118, %40
  %120 = getelementptr inbounds i32, ptr %10, i32 %119
  %121 = load i32, ptr %120, align 4, !invariant.load !3
  %122 = getelementptr inbounds i32, ptr %8, i32 %33
  %123 = load i32, ptr %122, align 4, !invariant.load !3
  %124 = getelementptr inbounds i32, ptr %7, i32 %33
  %125 = load i32, ptr %124, align 4, !invariant.load !3
  %126 = call i32 @llvm.smax.i32(i32 %123, i32 %125)
  %127 = call i32 @llvm.smin.i32(i32 %126, i32 13)
  %128 = icmp slt i32 %127, %123
  %129 = add i32 %127, 14
  %130 = select i1 %128, i32 %129, i32 %127
  %131 = call i32 @llvm.smin.i32(i32 %130, i32 13)
  %132 = call i32 @llvm.smax.i32(i32 %131, i32 0)
  %133 = zext i32 %132 to i64
  %134 = trunc i64 %133 to i32
  %135 = icmp sge i32 %134, 7
  %136 = zext i1 %135 to i32
  %137 = getelementptr inbounds i8, ptr %9, i32 %119
  %138 = load i8, ptr %137, align 1, !invariant.load !3
  %139 = icmp ne i32 %121, %136
  %140 = zext i1 %139 to i8
  %141 = and i8 %138, %140
  %142 = icmp sge i32 %125, %123
  %143 = zext i1 %142 to i8
  %144 = fdiv float %116, %117
  %145 = and i8 %141, %143
  %146 = call float @llvm.maximum.f32(float %144, float 0.000000e+00)
  %147 = call float @llvm.minimum.f32(float %146, float %87)
  %148 = trunc i8 %145 to i1
  %149 = select i1 %148, float %147, float 0.000000e+00
  %150 = trunc i8 %36 to i1
  %151 = select i1 %150, float %149, float 0.000000e+00
  %152 = mul i32 %18, 1980
  %153 = mul i32 %21, 12
  %154 = add i32 %152, %153
  %155 = add i32 %154, %24
  %156 = getelementptr inbounds float, ptr %0, i32 %155
  %157 = load float, ptr %156, align 4
  %158 = fcmp uno float %157, %157
  br i1 %158, label %159, label %160

159:                                              ; preds = %30
  br label %173

160:                                              ; preds = %30
  %161 = fcmp uno float %151, %151
  %162 = select i1 %161, float 0x7FF8000000000000, float %151
  %163 = fcmp ult float %157, %162
  br i1 %163, label %164, label %172

164:                                              ; preds = %160
  %165 = bitcast float %162 to i32
  %166 = icmp sge i32 %165, 0
  br i1 %166, label %167, label %169

167:                                              ; preds = %164
  %168 = atomicrmw max ptr %156, i32 %165 monotonic, align 4
  br label %171

169:                                              ; preds = %164
  %170 = atomicrmw umin ptr %156, i32 %165 monotonic, align 4
  br label %171

171:                                              ; preds = %167, %169
  br label %172

172:                                              ; preds = %171, %160
  br label %173

173:                                              ; preds = %159, %172
  br label %174

174:                                              ; preds = %173, %11
  ret void
}

define internal float @fused_scatter_12_bitcast_1290_298(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, i32 %11, i32 %12, i32 %13) {
  %15 = mul i32 %12, 14
  %16 = add i32 %15, %13
  %17 = getelementptr inbounds i32, ptr %5, i32 %16
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = icmp slt i32 %18, 0
  %20 = add i32 %18, 101
  %21 = select i1 %19, i32 %20, i32 %18
  %22 = call i32 @llvm.smin.i32(i32 %21, i32 100)
  %23 = call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = mul i32 %23, 20
  %25 = add i32 %24, %11
  %26 = getelementptr inbounds float, ptr %3, i32 %25
  %27 = load float, ptr %26, align 4, !invariant.load !3
  ret float %27
}

define internal i32 @fused_scatter_12_maximum_82_33(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, i32 %11, i32 %12, i32 %13) {
  %15 = call float @fused_scatter_12_bitcast_1290_298(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 6, i32 %12, i32 %13)
  %16 = getelementptr inbounds float, ptr %4, i32 %12
  %17 = load float, ptr %16, align 4, !invariant.load !3
  %18 = call float @fused_scatter_12_broadcast_3142_87(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 %11, i32 %12, i32 %13)
  %19 = call float @llvm.maximum.f32(float %15, float %18)
  %20 = fdiv float %17, %19
  %21 = fptosi float %20 to i32
  %22 = fcmp ole float %20, 0xC1E0000000000000
  %23 = select i1 %22, i32 -2147483648, i32 %21
  %24 = fcmp oge float %20, 0x41E0000000000000
  %25 = select i1 %24, i32 2147483647, i32 %23
  %26 = fcmp uno float %20, %20
  %27 = select i1 %26, i32 0, i32 %25
  %28 = call i32 @fused_scatter_12_broadcast_3139_47(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 %11, i32 %12, i32 %13)
  %29 = call i32 @llvm.smax.i32(i32 %27, i32 %28)
  ret i32 %29
}

define internal float @fused_scatter_12_broadcast_3142_87(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, i32 %11, i32 %12, i32 %13) {
  ret float 1.000000e+00
}

define internal i32 @fused_scatter_12_broadcast_3139_47(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, i32 %11, i32 %12, i32 %13) {
  ret i32 1
}

define ptx_kernel void @input_scatter_fusion_11(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(86016) %4, ptr noalias align 256 dereferenceable(6144) %5, ptr noalias align 256 dereferenceable(12288) %6, ptr noalias align 256 dereferenceable(6144) %7, ptr noalias align 256 dereferenceable(6144) %8, ptr noalias align 256 dereferenceable(86016) %9) #0 {
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %13 = mul i32 %11, 3
  %14 = mul i32 %12, 384
  %15 = add i32 %13, %14
  %16 = getelementptr inbounds i32, ptr %1, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = add i32 %15, 1
  %19 = getelementptr inbounds i32, ptr %1, i32 %18
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = add i32 %15, 2
  %22 = getelementptr inbounds i32, ptr %1, i32 %21
  %23 = load i32, ptr %22, align 4, !invariant.load !3
  %24 = icmp ule i32 %17, 1535
  %25 = icmp ule i32 %20, 164
  %26 = and i1 %24, %25
  %27 = icmp ule i32 %23, 11
  %28 = and i1 %26, %27
  br i1 %28, label %29, label %172

29:                                               ; preds = %10
  %30 = mul i32 %12, 128
  %31 = add i32 %30, %11
  %32 = udiv i32 %31, 14
  %33 = urem i32 %31, 14
  %34 = zext i32 %33 to i64
  %35 = trunc i64 %34 to i32
  %36 = call i32 @llvm.smin.i32(i32 %35, i32 13)
  %37 = call i32 @llvm.smax.i32(i32 %36, i32 0)
  %38 = call float @fused_scatter_11_bitcast_1290_184(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %37)
  %39 = fptosi float %38 to i32
  %40 = fcmp ole float %38, 0xC1E0000000000000
  %41 = select i1 %40, i32 -2147483648, i32 %39
  %42 = fcmp oge float %38, 0x41E0000000000000
  %43 = select i1 %42, i32 2147483647, i32 %41
  %44 = fcmp uno float %38, %38
  %45 = select i1 %44, i32 0, i32 %43
  %46 = mul i32 %32, 2
  %47 = getelementptr inbounds i32, ptr %6, i32 %46
  %48 = load i32, ptr %47, align 4, !invariant.load !3
  %49 = call i32 @llvm.smin.i32(i32 %48, i32 1535)
  %50 = call i32 @llvm.smax.i32(i32 %49, i32 0)
  %51 = add i32 %46, 1
  %52 = getelementptr inbounds i32, ptr %6, i32 %51
  %53 = load i32, ptr %52, align 4, !invariant.load !3
  %54 = call i32 @llvm.smin.i32(i32 %53, i32 13)
  %55 = call i32 @llvm.smax.i32(i32 %54, i32 0)
  %56 = call float @fused_scatter_11_bitcast_1290_184(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 1, i32 %50, i32 %55)
  %57 = fptosi float %56 to i32
  %58 = fcmp ole float %56, 0xC1E0000000000000
  %59 = select i1 %58, i32 -2147483648, i32 %57
  %60 = fcmp oge float %56, 0x41E0000000000000
  %61 = select i1 %60, i32 2147483647, i32 %59
  %62 = fcmp uno float %56, %56
  %63 = select i1 %62, i32 0, i32 %61
  %64 = sub i32 %45, %63
  %65 = sub i32 0, %64
  %66 = call float @fused_scatter_11_bitcast_1290_184(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 2, i32 %32, i32 %37)
  %67 = fptosi float %66 to i32
  %68 = fcmp ole float %66, 0xC1E0000000000000
  %69 = select i1 %68, i32 -2147483648, i32 %67
  %70 = fcmp oge float %66, 0x41E0000000000000
  %71 = select i1 %70, i32 2147483647, i32 %69
  %72 = fcmp uno float %66, %66
  %73 = select i1 %72, i32 0, i32 %71
  %74 = call float @fused_scatter_11_bitcast_1290_184(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 3, i32 %32, i32 %37)
  %75 = fptosi float %74 to i32
  %76 = fcmp ole float %74, 0xC1E0000000000000
  %77 = select i1 %76, i32 -2147483648, i32 %75
  %78 = fcmp oge float %74, 0x41E0000000000000
  %79 = select i1 %78, i32 2147483647, i32 %77
  %80 = fcmp uno float %74, %74
  %81 = select i1 %80, i32 0, i32 %79
  %82 = call i32 @llvm.smin.i32(i32 %64, i32 60)
  %83 = call i32 @llvm.smin.i32(i32 %65, i32 28)
  %84 = add i32 %73, %81
  %85 = sitofp i32 %82 to float
  %86 = sitofp i32 %83 to float
  %87 = call i32 @fused_scatter_11_maximum_82_17(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %37)
  %88 = sitofp i32 %84 to float
  %89 = fmul float %85, 0x3FA99999A0000000
  %90 = fmul float %86, 0x3F999999A0000000
  %91 = sitofp i32 %87 to float
  %92 = fmul float %88, 5.000000e-01
  %93 = icmp sge i32 %64, 0
  %94 = call float @fused_scatter_11_broadcast_3142_59(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %33)
  %95 = fadd float %89, %94
  %96 = fsub float %94, %90
  %97 = fmul float %91, %92
  %98 = select i1 %93, float %95, float %96
  %99 = fmul float %97, %98
  %100 = call i32 @fused_scatter_11_maximum_82_17(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %50, i32 %55)
  %101 = add i32 %100, -1
  %102 = call float @fused_scatter_11_bitcast_1290_184(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 4, i32 %50, i32 %55)
  %103 = fptosi float %102 to i32
  %104 = fcmp ole float %102, 0xC1E0000000000000
  %105 = select i1 %104, i32 -2147483648, i32 %103
  %106 = fcmp oge float %102, 0x41E0000000000000
  %107 = select i1 %106, i32 2147483647, i32 %105
  %108 = fcmp uno float %102, %102
  %109 = select i1 %108, i32 0, i32 %107
  %110 = mul i32 %101, %109
  %111 = add i32 %110, %109
  %112 = call i32 @llvm.smax.i32(i32 %111, i32 1)
  %113 = sitofp i32 %112 to float
  %114 = mul i32 %32, 14
  %115 = add i32 %114, %37
  %116 = getelementptr inbounds i32, ptr %9, i32 %115
  %117 = load i32, ptr %116, align 4, !invariant.load !3
  %118 = getelementptr inbounds i32, ptr %8, i32 %32
  %119 = load i32, ptr %118, align 4, !invariant.load !3
  %120 = getelementptr inbounds i32, ptr %7, i32 %32
  %121 = load i32, ptr %120, align 4, !invariant.load !3
  %122 = call i32 @llvm.smax.i32(i32 %119, i32 %121)
  %123 = call i32 @llvm.smin.i32(i32 %122, i32 13)
  %124 = icmp slt i32 %123, %119
  %125 = add i32 %123, 14
  %126 = select i1 %124, i32 %125, i32 %123
  %127 = call i32 @llvm.smin.i32(i32 %126, i32 13)
  %128 = call i32 @llvm.smax.i32(i32 %127, i32 0)
  %129 = zext i32 %128 to i64
  %130 = trunc i64 %129 to i32
  %131 = icmp sge i32 %130, 7
  %132 = zext i1 %131 to i32
  %133 = icmp ne i32 %117, %132
  %134 = zext i1 %133 to i8
  %135 = getelementptr inbounds i8, ptr %2, i32 %115
  %136 = load i8, ptr %135, align 1, !invariant.load !3
  %137 = and i8 %136, %134
  %138 = icmp sge i32 %121, %119
  %139 = zext i1 %138 to i8
  %140 = fdiv float %99, %113
  %141 = and i8 %137, %139
  %142 = call float @llvm.maximum.f32(float %140, float 0.000000e+00)
  %143 = call float @llvm.minimum.f32(float %142, float %94)
  %144 = trunc i8 %141 to i1
  %145 = select i1 %144, float %143, float 0.000000e+00
  %146 = getelementptr inbounds i8, ptr %2, i32 %31
  %147 = load i8, ptr %146, align 1, !invariant.load !3
  %148 = trunc i8 %147 to i1
  %149 = select i1 %148, float %145, float 0.000000e+00
  %150 = mul i32 %17, 1980
  %151 = mul i32 %20, 12
  %152 = add i32 %150, %151
  %153 = add i32 %152, %23
  %154 = getelementptr inbounds float, ptr %0, i32 %153
  %155 = load float, ptr %154, align 4
  %156 = fcmp uno float %155, %155
  br i1 %156, label %157, label %158

157:                                              ; preds = %29
  br label %171

158:                                              ; preds = %29
  %159 = fcmp uno float %149, %149
  %160 = select i1 %159, float 0x7FF8000000000000, float %149
  %161 = fcmp ult float %155, %160
  br i1 %161, label %162, label %170

162:                                              ; preds = %158
  %163 = bitcast float %160 to i32
  %164 = icmp sge i32 %163, 0
  br i1 %164, label %165, label %167

165:                                              ; preds = %162
  %166 = atomicrmw max ptr %154, i32 %163 monotonic, align 4
  br label %169

167:                                              ; preds = %162
  %168 = atomicrmw umin ptr %154, i32 %163 monotonic, align 4
  br label %169

169:                                              ; preds = %165, %167
  br label %170

170:                                              ; preds = %169, %158
  br label %171

171:                                              ; preds = %157, %170
  br label %172

172:                                              ; preds = %171, %10
  ret void
}

define internal float @fused_scatter_11_bitcast_1290_184(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = mul i32 %11, 14
  %15 = add i32 %14, %12
  %16 = getelementptr inbounds i32, ptr %4, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = icmp slt i32 %17, 0
  %19 = add i32 %17, 101
  %20 = select i1 %18, i32 %19, i32 %17
  %21 = call i32 @llvm.smin.i32(i32 %20, i32 100)
  %22 = call i32 @llvm.smax.i32(i32 %21, i32 0)
  %23 = mul i32 %22, 20
  %24 = add i32 %23, %10
  %25 = getelementptr inbounds float, ptr %3, i32 %24
  %26 = load float, ptr %25, align 4, !invariant.load !3
  ret float %26
}

define internal i32 @fused_scatter_11_maximum_82_17(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = call float @fused_scatter_11_bitcast_1290_184(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 6, i32 %11, i32 %12)
  %15 = getelementptr inbounds float, ptr %5, i32 %11
  %16 = load float, ptr %15, align 4, !invariant.load !3
  %17 = call float @fused_scatter_11_broadcast_3142_59(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 %10, i32 %11, i32 %12)
  %18 = call float @llvm.maximum.f32(float %14, float %17)
  %19 = fdiv float %16, %18
  %20 = fptosi float %19 to i32
  %21 = fcmp ole float %19, 0xC1E0000000000000
  %22 = select i1 %21, i32 -2147483648, i32 %20
  %23 = fcmp oge float %19, 0x41E0000000000000
  %24 = select i1 %23, i32 2147483647, i32 %22
  %25 = fcmp uno float %19, %19
  %26 = select i1 %25, i32 0, i32 %24
  %27 = call i32 @llvm.smax.i32(i32 %26, i32 1)
  ret i32 %27
}

define internal float @fused_scatter_11_broadcast_3142_59(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  ret float 1.000000e+00
}

define ptx_kernel void @input_scatter_fusion_10(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(258048) %1, ptr noalias align 256 dereferenceable(21504) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(86016) %4, ptr noalias align 256 dereferenceable(6144) %5, ptr noalias align 256 dereferenceable(12288) %6, ptr noalias align 256 dereferenceable(6144) %7, ptr noalias align 256 dereferenceable(6144) %8, ptr noalias align 256 dereferenceable(21504) %9, ptr noalias align 256 dereferenceable(86016) %10) #0 {
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %13 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !9
  %14 = mul i32 %12, 3
  %15 = mul i32 %13, 384
  %16 = add i32 %14, %15
  %17 = getelementptr inbounds i32, ptr %1, i32 %16
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = add i32 %16, 1
  %20 = getelementptr inbounds i32, ptr %1, i32 %19
  %21 = load i32, ptr %20, align 4, !invariant.load !3
  %22 = add i32 %16, 2
  %23 = getelementptr inbounds i32, ptr %1, i32 %22
  %24 = load i32, ptr %23, align 4, !invariant.load !3
  %25 = icmp ule i32 %18, 1535
  %26 = icmp ule i32 %21, 164
  %27 = and i1 %25, %26
  %28 = icmp ule i32 %24, 11
  %29 = and i1 %27, %28
  br i1 %29, label %30, label %173

30:                                               ; preds = %11
  %31 = mul i32 %13, 128
  %32 = add i32 %31, %12
  %33 = udiv i32 %32, 14
  %34 = urem i32 %32, 14
  %35 = getelementptr inbounds i8, ptr %2, i32 %32
  %36 = load i8, ptr %35, align 1, !invariant.load !3
  %37 = zext i32 %34 to i64
  %38 = trunc i64 %37 to i32
  %39 = call i32 @llvm.smin.i32(i32 %38, i32 13)
  %40 = call i32 @llvm.smax.i32(i32 %39, i32 0)
  %41 = call float @fused_scatter_10_bitcast_1290_176(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %33, i32 %40)
  %42 = fptosi float %41 to i32
  %43 = fcmp ole float %41, 0xC1E0000000000000
  %44 = select i1 %43, i32 -2147483648, i32 %42
  %45 = fcmp oge float %41, 0x41E0000000000000
  %46 = select i1 %45, i32 2147483647, i32 %44
  %47 = fcmp uno float %41, %41
  %48 = select i1 %47, i32 0, i32 %46
  %49 = mul i32 %33, 2
  %50 = getelementptr inbounds i32, ptr %6, i32 %49
  %51 = load i32, ptr %50, align 4, !invariant.load !3
  %52 = call i32 @llvm.smin.i32(i32 %51, i32 1535)
  %53 = call i32 @llvm.smax.i32(i32 %52, i32 0)
  %54 = add i32 %49, 1
  %55 = getelementptr inbounds i32, ptr %6, i32 %54
  %56 = load i32, ptr %55, align 4, !invariant.load !3
  %57 = call i32 @llvm.smin.i32(i32 %56, i32 13)
  %58 = call i32 @llvm.smax.i32(i32 %57, i32 0)
  %59 = call float @fused_scatter_10_bitcast_1290_176(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 1, i32 %53, i32 %58)
  %60 = fptosi float %59 to i32
  %61 = fcmp ole float %59, 0xC1E0000000000000
  %62 = select i1 %61, i32 -2147483648, i32 %60
  %63 = fcmp oge float %59, 0x41E0000000000000
  %64 = select i1 %63, i32 2147483647, i32 %62
  %65 = fcmp uno float %59, %59
  %66 = select i1 %65, i32 0, i32 %64
  %67 = sub i32 %48, %66
  %68 = sub i32 0, %67
  %69 = call float @fused_scatter_10_bitcast_1290_176(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 2, i32 %33, i32 %40)
  %70 = fptosi float %69 to i32
  %71 = fcmp ole float %69, 0xC1E0000000000000
  %72 = select i1 %71, i32 -2147483648, i32 %70
  %73 = fcmp oge float %69, 0x41E0000000000000
  %74 = select i1 %73, i32 2147483647, i32 %72
  %75 = fcmp uno float %69, %69
  %76 = select i1 %75, i32 0, i32 %74
  %77 = call float @fused_scatter_10_bitcast_1290_176(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 3, i32 %33, i32 %40)
  %78 = fptosi float %77 to i32
  %79 = fcmp ole float %77, 0xC1E0000000000000
  %80 = select i1 %79, i32 -2147483648, i32 %78
  %81 = fcmp oge float %77, 0x41E0000000000000
  %82 = select i1 %81, i32 2147483647, i32 %80
  %83 = fcmp uno float %77, %77
  %84 = select i1 %83, i32 0, i32 %82
  %85 = call i32 @llvm.smin.i32(i32 %67, i32 60)
  %86 = call i32 @llvm.smin.i32(i32 %68, i32 28)
  %87 = add i32 %76, %84
  %88 = sitofp i32 %85 to float
  %89 = sitofp i32 %86 to float
  %90 = call i32 @fused_scatter_10_maximum_82_15(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %33, i32 %40)
  %91 = sitofp i32 %87 to float
  %92 = fmul float %88, 0x3FA99999A0000000
  %93 = fmul float %89, 0x3F999999A0000000
  %94 = sitofp i32 %90 to float
  %95 = fmul float %91, 5.000000e-01
  %96 = icmp sge i32 %67, 0
  %97 = call float @fused_scatter_10_broadcast_3142_51(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %33, i32 %34)
  %98 = fadd float %92, %97
  %99 = fsub float %97, %93
  %100 = fmul float %94, %95
  %101 = select i1 %96, float %98, float %99
  %102 = fmul float %100, %101
  %103 = call i32 @fused_scatter_10_maximum_82_15(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 0, i32 %53, i32 %58)
  %104 = add i32 %103, -1
  %105 = call float @fused_scatter_10_bitcast_1290_176(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 4, i32 %53, i32 %58)
  %106 = fptosi float %105 to i32
  %107 = fcmp ole float %105, 0xC1E0000000000000
  %108 = select i1 %107, i32 -2147483648, i32 %106
  %109 = fcmp oge float %105, 0x41E0000000000000
  %110 = select i1 %109, i32 2147483647, i32 %108
  %111 = fcmp uno float %105, %105
  %112 = select i1 %111, i32 0, i32 %110
  %113 = mul i32 %104, %112
  %114 = add i32 %113, %112
  %115 = call i32 @llvm.smax.i32(i32 %114, i32 1)
  %116 = sitofp i32 %115 to float
  %117 = mul i32 %33, 14
  %118 = add i32 %117, %40
  %119 = getelementptr inbounds i32, ptr %10, i32 %118
  %120 = load i32, ptr %119, align 4, !invariant.load !3
  %121 = getelementptr inbounds i32, ptr %8, i32 %33
  %122 = load i32, ptr %121, align 4, !invariant.load !3
  %123 = getelementptr inbounds i32, ptr %7, i32 %33
  %124 = load i32, ptr %123, align 4, !invariant.load !3
  %125 = call i32 @llvm.smax.i32(i32 %122, i32 %124)
  %126 = call i32 @llvm.smin.i32(i32 %125, i32 13)
  %127 = icmp slt i32 %126, %122
  %128 = add i32 %126, 14
  %129 = select i1 %127, i32 %128, i32 %126
  %130 = call i32 @llvm.smin.i32(i32 %129, i32 13)
  %131 = call i32 @llvm.smax.i32(i32 %130, i32 0)
  %132 = zext i32 %131 to i64
  %133 = trunc i64 %132 to i32
  %134 = icmp sge i32 %133, 7
  %135 = zext i1 %134 to i32
  %136 = getelementptr inbounds i8, ptr %9, i32 %118
  %137 = load i8, ptr %136, align 1, !invariant.load !3
  %138 = icmp ne i32 %120, %135
  %139 = zext i1 %138 to i8
  %140 = and i8 %137, %139
  %141 = icmp sge i32 %124, %122
  %142 = zext i1 %141 to i8
  %143 = fdiv float %102, %116
  %144 = and i8 %140, %142
  %145 = call float @llvm.maximum.f32(float %143, float 0.000000e+00)
  %146 = call float @llvm.minimum.f32(float %145, float %97)
  %147 = trunc i8 %144 to i1
  %148 = select i1 %147, float %146, float 0.000000e+00
  %149 = trunc i8 %36 to i1
  %150 = select i1 %149, float %148, float 0.000000e+00
  %151 = mul i32 %18, 1980
  %152 = mul i32 %21, 12
  %153 = add i32 %151, %152
  %154 = add i32 %153, %24
  %155 = getelementptr inbounds float, ptr %0, i32 %154
  %156 = load float, ptr %155, align 4
  %157 = fcmp uno float %156, %156
  br i1 %157, label %158, label %159

158:                                              ; preds = %30
  br label %172

159:                                              ; preds = %30
  %160 = fcmp uno float %150, %150
  %161 = select i1 %160, float 0x7FF8000000000000, float %150
  %162 = fcmp ult float %156, %161
  br i1 %162, label %163, label %171

163:                                              ; preds = %159
  %164 = bitcast float %161 to i32
  %165 = icmp sge i32 %164, 0
  br i1 %165, label %166, label %168

166:                                              ; preds = %163
  %167 = atomicrmw max ptr %155, i32 %164 monotonic, align 4
  br label %170

168:                                              ; preds = %163
  %169 = atomicrmw umin ptr %155, i32 %164 monotonic, align 4
  br label %170

170:                                              ; preds = %166, %168
  br label %171

171:                                              ; preds = %170, %159
  br label %172

172:                                              ; preds = %158, %171
  br label %173

173:                                              ; preds = %172, %11
  ret void
}

define internal float @fused_scatter_10_bitcast_1290_176(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, i32 %11, i32 %12, i32 %13) {
  %15 = mul i32 %12, 14
  %16 = add i32 %15, %13
  %17 = getelementptr inbounds i32, ptr %4, i32 %16
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = icmp slt i32 %18, 0
  %20 = add i32 %18, 101
  %21 = select i1 %19, i32 %20, i32 %18
  %22 = call i32 @llvm.smin.i32(i32 %21, i32 100)
  %23 = call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = mul i32 %23, 20
  %25 = add i32 %24, %11
  %26 = getelementptr inbounds float, ptr %3, i32 %25
  %27 = load float, ptr %26, align 4, !invariant.load !3
  ret float %27
}

define internal i32 @fused_scatter_10_maximum_82_15(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, i32 %11, i32 %12, i32 %13) {
  %15 = call float @fused_scatter_10_bitcast_1290_176(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 6, i32 %12, i32 %13)
  %16 = getelementptr inbounds float, ptr %5, i32 %12
  %17 = load float, ptr %16, align 4, !invariant.load !3
  %18 = call float @fused_scatter_10_broadcast_3142_51(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, i32 %11, i32 %12, i32 %13)
  %19 = call float @llvm.maximum.f32(float %15, float %18)
  %20 = fdiv float %17, %19
  %21 = fptosi float %20 to i32
  %22 = fcmp ole float %20, 0xC1E0000000000000
  %23 = select i1 %22, i32 -2147483648, i32 %21
  %24 = fcmp oge float %20, 0x41E0000000000000
  %25 = select i1 %24, i32 2147483647, i32 %23
  %26 = fcmp uno float %20, %20
  %27 = select i1 %26, i32 0, i32 %25
  %28 = call i32 @llvm.smax.i32(i32 %27, i32 1)
  ret i32 %28
}

define internal float @fused_scatter_10_broadcast_3142_51(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, i32 %11, i32 %12, i32 %13) {
  ret float 1.000000e+00
}

define ptx_kernel void @input_transpose_fusion(ptr noalias align 256 dereferenceable(12165120) %0, ptr noalias align 256 dereferenceable(12165120) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !22
  %5 = urem i32 %3, 32
  %6 = mul i32 %5, 12
  %7 = mul i32 %4, 384
  %8 = add i32 %6, %7
  %9 = udiv i32 %3, 32
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds float, ptr %0, i32 %10
  %12 = load float, ptr %11, align 4, !invariant.load !3
  %13 = mul i32 %5, 33
  %14 = add i32 %13, %9
  %15 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %14
  store float %12, ptr %15, align 4
  %16 = add i32 %10, 4
  %17 = getelementptr inbounds float, ptr %0, i32 %16
  %18 = load float, ptr %17, align 4, !invariant.load !3
  %19 = add i32 %14, 4
  %20 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %19
  store float %18, ptr %20, align 4
  %21 = add i32 %9, 8
  %22 = icmp sge i32 %21, 11
  br i1 %22, label %23, label %24

23:                                               ; preds = %2
  br label %28

24:                                               ; preds = %2
  %25 = add i32 %10, 8
  %26 = getelementptr inbounds float, ptr %0, i32 %25
  %27 = load float, ptr %26, align 4, !invariant.load !3
  br label %28

28:                                               ; preds = %23, %24
  %29 = phi float [ %27, %24 ], [ 0.000000e+00, %23 ]
  br label %30

30:                                               ; preds = %28
  %31 = add i32 %14, 8
  %32 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %31
  store float %29, ptr %32, align 4
  call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %33 = icmp sle i32 %5, 11
  br i1 %33, label %34, label %78

34:                                               ; preds = %30
  %35 = mul i32 %9, 33
  %36 = add i32 %35, %5
  %37 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %36
  %38 = load float, ptr %37, align 4
  %39 = mul i32 %9, 12
  %40 = add i32 %39, %7
  %41 = add i32 %40, %5
  %42 = getelementptr inbounds float, ptr %1, i32 %41
  store float %38, ptr %42, align 4
  %43 = add i32 %36, 132
  %44 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %43
  %45 = load float, ptr %44, align 4
  %46 = add i32 %41, 48
  %47 = getelementptr inbounds float, ptr %1, i32 %46
  store float %45, ptr %47, align 4
  %48 = add i32 %36, 264
  %49 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %48
  %50 = load float, ptr %49, align 4
  %51 = add i32 %41, 96
  %52 = getelementptr inbounds float, ptr %1, i32 %51
  store float %50, ptr %52, align 4
  %53 = add i32 %36, 396
  %54 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %53
  %55 = load float, ptr %54, align 4
  %56 = add i32 %41, 144
  %57 = getelementptr inbounds float, ptr %1, i32 %56
  store float %55, ptr %57, align 4
  %58 = add i32 %36, 528
  %59 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %58
  %60 = load float, ptr %59, align 4
  %61 = add i32 %41, 192
  %62 = getelementptr inbounds float, ptr %1, i32 %61
  store float %60, ptr %62, align 4
  %63 = add i32 %36, 660
  %64 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %63
  %65 = load float, ptr %64, align 4
  %66 = add i32 %41, 240
  %67 = getelementptr inbounds float, ptr %1, i32 %66
  store float %65, ptr %67, align 4
  %68 = add i32 %36, 792
  %69 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %68
  %70 = load float, ptr %69, align 4
  %71 = add i32 %41, 288
  %72 = getelementptr inbounds float, ptr %1, i32 %71
  store float %70, ptr %72, align 4
  %73 = add i32 %36, 924
  %74 = getelementptr inbounds float, ptr addrspacecast (ptr addrspace(3) @shared_01 to ptr), i32 %73
  %75 = load float, ptr %74, align 4
  %76 = add i32 %41, 336
  %77 = getelementptr inbounds float, ptr %1, i32 %76
  store float %75, ptr %77, align 4
  br label %78

78:                                               ; preds = %34, %30
  ret void
}

define ptx_kernel void @loop_broadcast_fusion_4(ptr noalias align 256 dereferenceable(1536) %0, ptr noalias align 256 dereferenceable(1536) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %3, 128
  %6 = add i32 %5, %4
  %7 = getelementptr inbounds i8, ptr %0, i32 %6
  store i8 0, ptr %7, align 1
  %8 = getelementptr inbounds i8, ptr %1, i32 %6
  store i8 0, ptr %8, align 1
  ret void
}

define ptx_kernel void @loop_broadcast_fusion_1(ptr noalias align 256 dereferenceable(12288) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %2, 128
  %5 = add i32 %4, %3
  %6 = getelementptr inbounds float, ptr %0, i32 %5
  store float 0.000000e+00, ptr %6, align 4
  ret void
}

attributes #0 = { "nvvm.reqntid"="128,1,1" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "nvvm.reqntid"="8,1,1" }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #4 = { convergent nocallback nounwind }
attributes #5 = { "nvvm.reqntid"="256,1,1" }
attributes #6 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #7 = { "nvvm.reqntid"="1,1,1" }
attributes #8 = { "nvvm.reqntid"="64" }
attributes #9 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #10 = { "nvvm.reqntid"="64,1,1" }

!llvm.module.flags = !{!0}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 72}
!2 = !{i32 0, i32 128}
!3 = !{}
!4 = !{i32 0, i32 24}
!5 = !{i32 0, i32 132}
!6 = !{i32 0, i32 1536}
!7 = !{i32 0, i32 8}
!8 = !{i32 0, i32 84}
!9 = !{i32 0, i32 168}
!10 = !{i32 0, i32 12}
!11 = !{i32 0, i32 336}
!12 = !{i32 0, i32 495}
!13 = !{i32 0, i32 2}
!14 = !{i32 0, i32 81675}
!15 = !{i32 0, i32 256}
!16 = !{i32 0, i32 192}
!17 = !{i32 0, i32 31680}
!18 = !{i32 0, i32 3966}
!19 = !{i32 0, i32 1980}
!20 = !{i32 0, i32 504}
!21 = !{i32 0, i32 5940}
!22 = !{i32 0, i32 7920}

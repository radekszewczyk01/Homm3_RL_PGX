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

define ptx_kernel void @loop_add_fusion_2(ptr noalias align 16 dereferenceable(32768) %0, ptr noalias align 256 dereferenceable(98304) %1, ptr noalias align 256 dereferenceable(98304) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = udiv i32 %4, 32
  %7 = sext i32 %6 to i64
  %8 = lshr i64 %7, 32
  %9 = trunc i64 %8 to i32
  %10 = urem i32 %4, 32
  %11 = mul i32 %10, 256
  %12 = mul i32 %5, 2
  %13 = add i32 %11, %12
  %14 = add i32 %13, 1
  %15 = getelementptr inbounds i32, ptr %0, i32 %14
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = add i32 %6, %16
  %18 = shl i32 %17, 13
  %19 = lshr i32 %17, 19
  %20 = getelementptr inbounds i32, ptr %0, i32 %13
  %21 = load i32, ptr %20, align 4, !invariant.load !3
  %22 = add i32 %9, %21
  %23 = or i32 %18, %19
  %24 = add i32 %22, %17
  %25 = xor i32 %24, %23
  %26 = shl i32 %25, 15
  %27 = lshr i32 %25, 17
  %28 = or i32 %26, %27
  %29 = add i32 %24, %25
  %30 = xor i32 %29, %28
  %31 = shl i32 %30, 26
  %32 = lshr i32 %30, 6
  %33 = add i32 %29, %30
  %34 = or i32 %31, %32
  %35 = xor i32 %33, %34
  %36 = shl i32 %35, 6
  %37 = lshr i32 %35, 26
  %38 = or i32 %36, %37
  %39 = add i32 %33, %35
  %40 = xor i32 %39, %38
  %41 = xor i32 %21, %16
  %42 = xor i32 %41, 466688986
  %43 = add i32 %40, %42
  %44 = add i32 %43, 1
  %45 = shl i32 %44, 17
  %46 = lshr i32 %44, 15
  %47 = add i32 %39, %16
  %48 = or i32 %45, %46
  %49 = add i32 %47, %44
  %50 = xor i32 %49, %48
  %51 = shl i32 %50, 29
  %52 = lshr i32 %50, 3
  %53 = or i32 %51, %52
  %54 = add i32 %49, %50
  %55 = xor i32 %54, %53
  %56 = shl i32 %55, 16
  %57 = lshr i32 %55, 16
  %58 = add i32 %54, %55
  %59 = or i32 %56, %57
  %60 = xor i32 %58, %59
  %61 = shl i32 %60, 24
  %62 = lshr i32 %60, 8
  %63 = or i32 %61, %62
  %64 = add i32 %58, %60
  %65 = xor i32 %64, %63
  %66 = add i32 %65, %21
  %67 = add i32 %66, 2
  %68 = shl i32 %67, 13
  %69 = lshr i32 %67, 19
  %70 = add i32 %64, %42
  %71 = or i32 %68, %69
  %72 = add i32 %70, %67
  %73 = xor i32 %72, %71
  %74 = shl i32 %73, 15
  %75 = lshr i32 %73, 17
  %76 = or i32 %74, %75
  %77 = add i32 %72, %73
  %78 = xor i32 %77, %76
  %79 = shl i32 %78, 26
  %80 = lshr i32 %78, 6
  %81 = add i32 %77, %78
  %82 = or i32 %79, %80
  %83 = xor i32 %81, %82
  %84 = shl i32 %83, 6
  %85 = lshr i32 %83, 26
  %86 = or i32 %84, %85
  %87 = add i32 %81, %83
  %88 = xor i32 %87, %86
  %89 = add i32 %88, %16
  %90 = add i32 %89, 3
  %91 = shl i32 %90, 17
  %92 = lshr i32 %90, 15
  %93 = add i32 %87, %21
  %94 = or i32 %91, %92
  %95 = add i32 %93, %90
  %96 = xor i32 %95, %94
  %97 = shl i32 %96, 29
  %98 = lshr i32 %96, 3
  %99 = or i32 %97, %98
  %100 = add i32 %95, %96
  %101 = xor i32 %100, %99
  %102 = shl i32 %101, 16
  %103 = lshr i32 %101, 16
  %104 = add i32 %100, %101
  %105 = or i32 %102, %103
  %106 = xor i32 %104, %105
  %107 = shl i32 %106, 24
  %108 = lshr i32 %106, 8
  %109 = or i32 %107, %108
  %110 = add i32 %104, %106
  %111 = xor i32 %110, %109
  %112 = add i32 %111, %42
  %113 = add i32 %112, 4
  %114 = shl i32 %113, 13
  %115 = lshr i32 %113, 19
  %116 = add i32 %110, %16
  %117 = or i32 %114, %115
  %118 = add i32 %116, %113
  %119 = xor i32 %118, %117
  %120 = shl i32 %119, 15
  %121 = lshr i32 %119, 17
  %122 = or i32 %120, %121
  %123 = add i32 %118, %119
  %124 = xor i32 %123, %122
  %125 = shl i32 %124, 26
  %126 = lshr i32 %124, 6
  %127 = or i32 %125, %126
  %128 = add i32 %123, %124
  %129 = xor i32 %128, %127
  %130 = add i32 %128, %129
  %131 = add i32 %130, %42
  %132 = shl i32 %129, 6
  %133 = lshr i32 %129, 26
  %134 = or i32 %132, %133
  %135 = xor i32 %130, %134
  %136 = add i32 %135, %21
  %137 = add i32 %136, 5
  %138 = mul i32 %4, 128
  %139 = add i32 %138, %5
  %140 = getelementptr inbounds i32, ptr %1, i32 %139
  store i32 %131, ptr %140, align 4
  %141 = getelementptr inbounds i32, ptr %2, i32 %139
  store i32 %137, ptr %141, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

define ptx_kernel void @loop_slice_fusion(ptr noalias align 256 dereferenceable(98304) %0, ptr noalias align 256 dereferenceable(98304) %1, ptr noalias align 256 dereferenceable(16384) %2, ptr noalias align 256 dereferenceable(16384) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %7 = mul i32 %6, 64
  %8 = udiv i32 %5, 2
  %9 = add i32 %7, %8
  %10 = urem i32 %5, 2
  %11 = icmp ult i32 %10, 1
  br i1 %11, label %12, label %16

12:                                               ; preds = %4
  %13 = add i32 %9, 20480
  %14 = getelementptr inbounds i32, ptr %1, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  br label %20

16:                                               ; preds = %4
  %17 = add i32 %9, 20480
  %18 = getelementptr inbounds i32, ptr %0, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  br label %20

20:                                               ; preds = %12, %16
  %21 = phi i32 [ %19, %16 ], [ %15, %12 ]
  br label %22

22:                                               ; preds = %20
  %23 = icmp eq i32 %10, 1
  br i1 %23, label %24, label %29

24:                                               ; preds = %22
  %25 = add i32 %7, %10
  %26 = add i32 %25, %8
  %27 = add i32 %26, -1
  %28 = getelementptr inbounds i32, ptr %2, i32 %27
  store i32 %21, ptr %28, align 4
  br label %29

29:                                               ; preds = %24, %22
  %30 = icmp eq i32 %10, 0
  br i1 %30, label %31, label %35

31:                                               ; preds = %29
  %32 = add i32 %7, %10
  %33 = add i32 %32, %8
  %34 = getelementptr inbounds i32, ptr %3, i32 %33
  store i32 %21, ptr %34, align 4
  br label %35

35:                                               ; preds = %31, %29
  ret void
}

define ptx_kernel void @loop_add_fusion_3(ptr noalias align 256 dereferenceable(16384) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(32768) %2, ptr noalias align 256 dereferenceable(32768) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = udiv i32 %5, 32
  %8 = urem i32 %5, 32
  %9 = mul i32 %8, 128
  %10 = add i32 %9, %6
  %11 = sext i32 %7 to i64
  %12 = lshr i64 %11, 32
  %13 = trunc i64 %12 to i32
  %14 = getelementptr inbounds i32, ptr %1, i32 %10
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = add i32 %7, %15
  %17 = shl i32 %16, 13
  %18 = lshr i32 %16, 19
  %19 = getelementptr inbounds i32, ptr %0, i32 %10
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = add i32 %13, %20
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
  %126 = or i32 %124, %125
  %127 = add i32 %122, %123
  %128 = xor i32 %127, %126
  %129 = shl i32 %128, 6
  %130 = lshr i32 %128, 26
  %131 = add i32 %127, %128
  %132 = or i32 %129, %130
  %133 = xor i32 %131, %132
  %134 = add i32 %133, %20
  %135 = add i32 %134, 5
  %136 = add i32 %131, %41
  %137 = mul i32 %5, 128
  %138 = add i32 %137, %6
  %139 = getelementptr inbounds i32, ptr %2, i32 %138
  store i32 %135, ptr %139, align 4
  %140 = getelementptr inbounds i32, ptr %3, i32 %138
  store i32 %136, ptr %140, align 4
  ret void
}

define ptx_kernel void @loop_add_divide_slice_xor_fusion(ptr noalias align 256 dereferenceable(98304) %0, ptr noalias align 256 dereferenceable(98304) %1, ptr noalias align 256 dereferenceable(32768) %2, ptr noalias align 256 dereferenceable(32768) %3, ptr noalias align 256 dereferenceable(16384) %4, ptr noalias align 256 dereferenceable(16384) %5, ptr noalias align 256 dereferenceable(16384) %6, ptr noalias align 256 dereferenceable(16384) %7, ptr noalias align 256 dereferenceable(16384) %8, ptr noalias align 256 dereferenceable(16384) %9, ptr noalias align 256 dereferenceable(16384) %10, ptr noalias align 256 dereferenceable(16384) %11, ptr noalias align 256 dereferenceable(16384) %12, ptr noalias align 256 dereferenceable(16384) %13, ptr noalias align 256 dereferenceable(16384) %14) #0 {
  %16 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %18 = mul i32 %16, 128
  %19 = add i32 %18, %17
  %20 = call i32 @fused_add_divide_slice_xor_bitcast_99_2_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 0)
  %21 = call i32 @fused_add_divide_slice_xor_bitcast_99_2_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 1)
  %22 = xor i32 %20, %21
  %23 = xor i32 %22, 466688986
  %24 = call i32 @fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 1, i32 %19)
  %25 = shl i32 %24, 13
  %26 = lshr i32 %24, 19
  %27 = call i32 @fused_add_divide_slice_xor_bitcast_74_40_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 1)
  %28 = shl i32 %27, 13
  %29 = lshr i32 %27, 19
  %30 = or i32 %25, %26
  %31 = call i32 @fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 0, i32 %19)
  %32 = add i32 %31, %24
  %33 = xor i32 %32, %30
  %34 = shl i32 %33, 15
  %35 = lshr i32 %33, 17
  %36 = call i32 @fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 1, i32 %19)
  %37 = shl i32 %36, 13
  %38 = lshr i32 %36, 19
  %39 = or i32 %28, %29
  %40 = call i32 @fused_add_divide_slice_xor_bitcast_74_40_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 0)
  %41 = add i32 %40, %27
  %42 = xor i32 %41, %39
  %43 = shl i32 %42, 15
  %44 = lshr i32 %42, 17
  %45 = or i32 %34, %35
  %46 = add i32 %32, %33
  %47 = xor i32 %46, %45
  %48 = shl i32 %47, 26
  %49 = lshr i32 %47, 6
  %50 = add i32 %46, %47
  %51 = or i32 %48, %49
  %52 = xor i32 %50, %51
  %53 = shl i32 %52, 6
  %54 = lshr i32 %52, 26
  %55 = or i32 %37, %38
  %56 = call i32 @fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 0, i32 %19)
  %57 = add i32 %56, %36
  %58 = xor i32 %57, %55
  %59 = shl i32 %58, 15
  %60 = lshr i32 %58, 17
  %61 = or i32 %43, %44
  %62 = add i32 %41, %42
  %63 = xor i32 %62, %61
  %64 = shl i32 %63, 26
  %65 = lshr i32 %63, 6
  %66 = add i32 %62, %63
  %67 = or i32 %64, %65
  %68 = xor i32 %66, %67
  %69 = shl i32 %68, 6
  %70 = lshr i32 %68, 26
  %71 = or i32 %53, %54
  %72 = or i32 %59, %60
  %73 = add i32 %57, %58
  %74 = xor i32 %73, %72
  %75 = shl i32 %74, 26
  %76 = lshr i32 %74, 6
  %77 = add i32 %73, %74
  %78 = or i32 %75, %76
  %79 = xor i32 %77, %78
  %80 = shl i32 %79, 6
  %81 = lshr i32 %79, 26
  %82 = or i32 %69, %70
  %83 = add i32 %50, %52
  %84 = xor i32 %83, %71
  %85 = or i32 %80, %81
  %86 = add i32 %66, %68
  %87 = xor i32 %86, %82
  %88 = xor i32 %31, %24
  %89 = xor i32 %88, 466688986
  %90 = add i32 %84, %89
  %91 = add i32 %90, 1
  %92 = shl i32 %91, 17
  %93 = lshr i32 %91, 15
  %94 = add i32 %77, %79
  %95 = xor i32 %94, %85
  %96 = xor i32 %40, %27
  %97 = xor i32 %96, 466688986
  %98 = add i32 %87, %97
  %99 = add i32 %98, 1
  %100 = shl i32 %99, 17
  %101 = lshr i32 %99, 15
  %102 = add i32 %83, %24
  %103 = or i32 %92, %93
  %104 = add i32 %102, %91
  %105 = xor i32 %104, %103
  %106 = shl i32 %105, 29
  %107 = lshr i32 %105, 3
  %108 = xor i32 %56, %36
  %109 = xor i32 %108, 466688986
  %110 = add i32 %95, %109
  %111 = add i32 %110, 1
  %112 = shl i32 %111, 17
  %113 = lshr i32 %111, 15
  %114 = add i32 %86, %27
  %115 = or i32 %100, %101
  %116 = add i32 %114, %99
  %117 = xor i32 %116, %115
  %118 = shl i32 %117, 29
  %119 = lshr i32 %117, 3
  %120 = or i32 %106, %107
  %121 = add i32 %104, %105
  %122 = xor i32 %121, %120
  %123 = shl i32 %122, 16
  %124 = lshr i32 %122, 16
  %125 = add i32 %121, %122
  %126 = or i32 %123, %124
  %127 = xor i32 %125, %126
  %128 = shl i32 %127, 24
  %129 = lshr i32 %127, 8
  %130 = add i32 %94, %36
  %131 = or i32 %112, %113
  %132 = add i32 %130, %111
  %133 = xor i32 %132, %131
  %134 = shl i32 %133, 29
  %135 = lshr i32 %133, 3
  %136 = or i32 %118, %119
  %137 = add i32 %116, %117
  %138 = xor i32 %137, %136
  %139 = shl i32 %138, 16
  %140 = lshr i32 %138, 16
  %141 = add i32 %137, %138
  %142 = or i32 %139, %140
  %143 = xor i32 %141, %142
  %144 = shl i32 %143, 24
  %145 = lshr i32 %143, 8
  %146 = or i32 %128, %129
  %147 = or i32 %134, %135
  %148 = add i32 %132, %133
  %149 = xor i32 %148, %147
  %150 = shl i32 %149, 16
  %151 = lshr i32 %149, 16
  %152 = add i32 %148, %149
  %153 = or i32 %150, %151
  %154 = xor i32 %152, %153
  %155 = shl i32 %154, 24
  %156 = lshr i32 %154, 8
  %157 = or i32 %144, %145
  %158 = add i32 %125, %127
  %159 = xor i32 %158, %146
  %160 = or i32 %155, %156
  %161 = add i32 %141, %143
  %162 = xor i32 %161, %157
  %163 = add i32 %159, %31
  %164 = add i32 %163, 2
  %165 = shl i32 %164, 13
  %166 = lshr i32 %164, 19
  %167 = add i32 %152, %154
  %168 = xor i32 %167, %160
  %169 = add i32 %162, %40
  %170 = add i32 %169, 2
  %171 = shl i32 %170, 13
  %172 = lshr i32 %170, 19
  %173 = add i32 %158, %89
  %174 = or i32 %165, %166
  %175 = add i32 %173, %164
  %176 = xor i32 %175, %174
  %177 = shl i32 %176, 15
  %178 = lshr i32 %176, 17
  %179 = add i32 %168, %56
  %180 = add i32 %179, 2
  %181 = shl i32 %180, 13
  %182 = lshr i32 %180, 19
  %183 = add i32 %161, %97
  %184 = or i32 %171, %172
  %185 = add i32 %183, %170
  %186 = xor i32 %185, %184
  %187 = shl i32 %186, 15
  %188 = lshr i32 %186, 17
  %189 = or i32 %177, %178
  %190 = add i32 %175, %176
  %191 = xor i32 %190, %189
  %192 = shl i32 %191, 26
  %193 = lshr i32 %191, 6
  %194 = add i32 %190, %191
  %195 = or i32 %192, %193
  %196 = xor i32 %194, %195
  %197 = shl i32 %196, 6
  %198 = lshr i32 %196, 26
  %199 = add i32 %167, %109
  %200 = or i32 %181, %182
  %201 = add i32 %199, %180
  %202 = xor i32 %201, %200
  %203 = shl i32 %202, 15
  %204 = lshr i32 %202, 17
  %205 = or i32 %187, %188
  %206 = add i32 %185, %186
  %207 = xor i32 %206, %205
  %208 = shl i32 %207, 26
  %209 = lshr i32 %207, 6
  %210 = add i32 %206, %207
  %211 = or i32 %208, %209
  %212 = xor i32 %210, %211
  %213 = shl i32 %212, 6
  %214 = lshr i32 %212, 26
  %215 = or i32 %197, %198
  %216 = or i32 %203, %204
  %217 = add i32 %201, %202
  %218 = xor i32 %217, %216
  %219 = shl i32 %218, 26
  %220 = lshr i32 %218, 6
  %221 = add i32 %217, %218
  %222 = or i32 %219, %220
  %223 = xor i32 %221, %222
  %224 = shl i32 %223, 6
  %225 = lshr i32 %223, 26
  %226 = or i32 %213, %214
  %227 = add i32 %194, %196
  %228 = xor i32 %227, %215
  %229 = or i32 %224, %225
  %230 = add i32 %210, %212
  %231 = xor i32 %230, %226
  %232 = add i32 %228, %24
  %233 = add i32 %232, 3
  %234 = shl i32 %233, 17
  %235 = lshr i32 %233, 15
  %236 = add i32 %221, %223
  %237 = xor i32 %236, %229
  %238 = add i32 %231, %27
  %239 = add i32 %238, 3
  %240 = shl i32 %239, 17
  %241 = lshr i32 %239, 15
  %242 = add i32 %227, %31
  %243 = or i32 %234, %235
  %244 = add i32 %242, %233
  %245 = xor i32 %244, %243
  %246 = shl i32 %245, 29
  %247 = lshr i32 %245, 3
  %248 = add i32 %237, %36
  %249 = add i32 %248, 3
  %250 = shl i32 %249, 17
  %251 = lshr i32 %249, 15
  %252 = add i32 %230, %40
  %253 = or i32 %240, %241
  %254 = add i32 %252, %239
  %255 = xor i32 %254, %253
  %256 = shl i32 %255, 29
  %257 = lshr i32 %255, 3
  %258 = or i32 %246, %247
  %259 = add i32 %244, %245
  %260 = xor i32 %259, %258
  %261 = shl i32 %260, 16
  %262 = lshr i32 %260, 16
  %263 = add i32 %259, %260
  %264 = or i32 %261, %262
  %265 = xor i32 %263, %264
  %266 = shl i32 %265, 24
  %267 = lshr i32 %265, 8
  %268 = add i32 %236, %56
  %269 = or i32 %250, %251
  %270 = add i32 %268, %249
  %271 = xor i32 %270, %269
  %272 = shl i32 %271, 29
  %273 = lshr i32 %271, 3
  %274 = or i32 %256, %257
  %275 = add i32 %254, %255
  %276 = xor i32 %275, %274
  %277 = shl i32 %276, 16
  %278 = lshr i32 %276, 16
  %279 = add i32 %275, %276
  %280 = or i32 %277, %278
  %281 = xor i32 %279, %280
  %282 = shl i32 %281, 24
  %283 = lshr i32 %281, 8
  %284 = or i32 %266, %267
  %285 = or i32 %272, %273
  %286 = add i32 %270, %271
  %287 = xor i32 %286, %285
  %288 = shl i32 %287, 16
  %289 = lshr i32 %287, 16
  %290 = add i32 %286, %287
  %291 = or i32 %288, %289
  %292 = xor i32 %290, %291
  %293 = shl i32 %292, 24
  %294 = lshr i32 %292, 8
  %295 = or i32 %282, %283
  %296 = add i32 %263, %265
  %297 = xor i32 %296, %284
  %298 = or i32 %293, %294
  %299 = add i32 %279, %281
  %300 = xor i32 %299, %295
  %301 = add i32 %297, %89
  %302 = add i32 %301, 4
  %303 = shl i32 %302, 13
  %304 = lshr i32 %302, 19
  %305 = add i32 %290, %292
  %306 = xor i32 %305, %298
  %307 = add i32 %300, %97
  %308 = add i32 %307, 4
  %309 = shl i32 %308, 13
  %310 = lshr i32 %308, 19
  %311 = add i32 %296, %24
  %312 = or i32 %303, %304
  %313 = add i32 %311, %302
  %314 = xor i32 %313, %312
  %315 = shl i32 %314, 15
  %316 = lshr i32 %314, 17
  %317 = add i32 %306, %109
  %318 = add i32 %317, 4
  %319 = shl i32 %318, 13
  %320 = lshr i32 %318, 19
  %321 = add i32 %299, %27
  %322 = or i32 %309, %310
  %323 = add i32 %321, %308
  %324 = xor i32 %323, %322
  %325 = shl i32 %324, 15
  %326 = lshr i32 %324, 17
  %327 = or i32 %315, %316
  %328 = add i32 %313, %314
  %329 = xor i32 %328, %327
  %330 = shl i32 %329, 26
  %331 = lshr i32 %329, 6
  %332 = add i32 %328, %329
  %333 = or i32 %330, %331
  %334 = xor i32 %332, %333
  %335 = shl i32 %334, 6
  %336 = lshr i32 %334, 26
  %337 = add i32 %305, %36
  %338 = or i32 %319, %320
  %339 = add i32 %337, %318
  %340 = xor i32 %339, %338
  %341 = shl i32 %340, 15
  %342 = lshr i32 %340, 17
  %343 = or i32 %325, %326
  %344 = add i32 %323, %324
  %345 = xor i32 %344, %343
  %346 = shl i32 %345, 26
  %347 = lshr i32 %345, 6
  %348 = add i32 %344, %345
  %349 = or i32 %346, %347
  %350 = xor i32 %348, %349
  %351 = shl i32 %350, 6
  %352 = lshr i32 %350, 26
  %353 = or i32 %335, %336
  %354 = or i32 %341, %342
  %355 = add i32 %339, %340
  %356 = xor i32 %355, %354
  %357 = shl i32 %356, 26
  %358 = lshr i32 %356, 6
  %359 = add i32 %355, %356
  %360 = or i32 %357, %358
  %361 = xor i32 %359, %360
  %362 = shl i32 %361, 6
  %363 = lshr i32 %361, 26
  %364 = or i32 %351, %352
  %365 = add i32 %332, %334
  %366 = xor i32 %365, %353
  %367 = or i32 %362, %363
  %368 = add i32 %348, %350
  %369 = xor i32 %368, %364
  %370 = add i32 %366, %31
  %371 = add i32 %359, %361
  %372 = xor i32 %371, %367
  %373 = add i32 %369, %40
  %374 = add i32 %365, %89
  %375 = add i32 %370, 5
  %376 = add i32 %372, %56
  %377 = add i32 %368, %97
  %378 = add i32 %373, 5
  %379 = xor i32 %374, %375
  %380 = add i32 %371, %109
  %381 = add i32 %376, 5
  %382 = xor i32 %377, %378
  %383 = urem i32 %379, 6
  %384 = xor i32 %380, %381
  %385 = lshr i32 %382, 9
  %386 = mul i32 %383, 4
  %387 = urem i32 %384, 6
  %388 = or i32 %385, 1065353216
  %389 = add i32 %386, %387
  %390 = bitcast i32 %388 to float
  %391 = urem i32 %389, 6
  %392 = fadd float %390, -1.000000e+00
  %393 = fmul float %392, 3.700000e+04
  %394 = add i32 %391, 2
  %395 = fadd float %393, 3.000000e+03
  %396 = call i32 @llvm.smax.i32(i32 %394, i32 1)
  %397 = call float @llvm.maximum.f32(float %395, float 3.000000e+03)
  %398 = sitofp i32 %396 to float
  %399 = fdiv float %397, %398
  %400 = call i32 @fused_add_divide_slice_xor_bitcast_103_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 1)
  %401 = call i32 @fused_add_divide_slice_xor_bitcast_17_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 1)
  %402 = call i32 @fused_add_divide_slice_xor_bitcast_36_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 1)
  %403 = call i32 @fused_add_divide_slice_xor_bitcast_17_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 0)
  %404 = call i32 @fused_add_divide_slice_xor_bitcast_103_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 0)
  %405 = call i32 @fused_add_divide_slice_xor_bitcast_36_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %19, i32 0)
  %406 = getelementptr inbounds i32, ptr %4, i32 %19
  store i32 %23, ptr %406, align 4
  %407 = getelementptr inbounds i32, ptr %5, i32 %19
  store i32 %21, ptr %407, align 4
  %408 = getelementptr inbounds i32, ptr %6, i32 %19
  store i32 %20, ptr %408, align 4
  %409 = getelementptr inbounds float, ptr %7, i32 %19
  store float %399, ptr %409, align 4
  %410 = getelementptr inbounds i32, ptr %8, i32 %19
  store i32 %394, ptr %410, align 4
  %411 = getelementptr inbounds i32, ptr %9, i32 %19
  store i32 %400, ptr %411, align 4
  %412 = getelementptr inbounds i32, ptr %10, i32 %19
  store i32 %401, ptr %412, align 4
  %413 = getelementptr inbounds i32, ptr %11, i32 %19
  store i32 %402, ptr %413, align 4
  %414 = getelementptr inbounds i32, ptr %12, i32 %19
  store i32 %403, ptr %414, align 4
  %415 = getelementptr inbounds i32, ptr %13, i32 %19
  store i32 %404, ptr %415, align 4
  %416 = getelementptr inbounds i32, ptr %14, i32 %19
  store i32 %405, ptr %416, align 4
  ret void
}

define internal i32 @fused_add_divide_slice_xor_bitcast_99_2_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = call i32 @fused_add_divide_slice_xor_concatenate_135_19_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 4, i32 %4, i32 %5)
  ret i32 %7
}

define internal i32 @fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = call i32 @fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %4, i32 0, i32 %5)
  ret i32 %7
}

define internal i32 @fused_add_divide_slice_xor_bitcast_74_40_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = call i32 @fused_add_divide_slice_xor_concatenate_135_19_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 1, i32 %4, i32 %5)
  ret i32 %7
}

define internal i32 @fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = call i32 @fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %4, i32 1, i32 %5)
  ret i32 %7
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

define internal i32 @fused_add_divide_slice_xor_bitcast_103_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = call i32 @fused_add_divide_slice_xor_concatenate_135_19_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 3, i32 %4, i32 %5)
  ret i32 %7
}

define internal i32 @fused_add_divide_slice_xor_bitcast_17_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = call i32 @fused_add_divide_slice_xor_concatenate_135_19_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 0, i32 %4, i32 %5)
  ret i32 %7
}

define internal i32 @fused_add_divide_slice_xor_bitcast_36_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = call i32 @fused_add_divide_slice_xor_concatenate_135_19_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 2, i32 %4, i32 %5)
  ret i32 %7
}

define internal i32 @fused_add_divide_slice_xor_concatenate_135_19_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5, i32 %6) {
  %8 = icmp ult i32 %6, 1
  br i1 %8, label %9, label %14

9:                                                ; preds = %7
  %10 = mul i32 %4, 4096
  %11 = add i32 %10, %5
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  br label %19

14:                                               ; preds = %7
  %15 = mul i32 %4, 4096
  %16 = add i32 %15, %5
  %17 = getelementptr inbounds i32, ptr %0, i32 %16
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i32 [ %18, %14 ], [ %13, %9 ]
  br label %21

21:                                               ; preds = %19
  ret i32 %20
}

define internal i32 @fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5, i32 %6) {
  %8 = icmp ult i32 %4, 1
  br i1 %8, label %9, label %14

9:                                                ; preds = %7
  %10 = mul i32 %5, 4096
  %11 = add i32 %10, %6
  %12 = getelementptr inbounds i32, ptr %3, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  br label %19

14:                                               ; preds = %7
  %15 = mul i32 %5, 4096
  %16 = add i32 %15, %6
  %17 = getelementptr inbounds i32, ptr %2, i32 %16
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i32 [ %18, %14 ], [ %13, %9 ]
  br label %21

21:                                               ; preds = %19
  ret i32 %20
}

define ptx_kernel void @loop_select_fusion_5(ptr noalias align 256 dereferenceable(32768) %0, ptr noalias align 256 dereferenceable(32768) %1, ptr noalias align 256 dereferenceable(229376) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = mul i32 %4, 128
  %7 = add i32 %6, %5
  %8 = udiv i32 %7, 14
  %9 = urem i32 %7, 14
  %10 = call i32 @fused_select_5_bitcast_1257_6(ptr %0, ptr %1, i32 1, i32 %8)
  %11 = add i32 %9, %10
  %12 = shl i32 %11, 13
  %13 = lshr i32 %11, 19
  %14 = sext i32 %9 to i64
  %15 = lshr i64 %14, 32
  %16 = trunc i64 %15 to i32
  %17 = call i32 @fused_select_5_bitcast_1257_6(ptr %0, ptr %1, i32 0, i32 %8)
  %18 = add i32 %16, %17
  %19 = or i32 %12, %13
  %20 = add i32 %18, %11
  %21 = xor i32 %20, %19
  %22 = shl i32 %21, 15
  %23 = lshr i32 %21, 17
  %24 = call i32 @fused_select_5_bitcast_1273_6(ptr %0, ptr %1, i32 1, i32 %8)
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
  %38 = call i32 @fused_select_5_bitcast_1273_6(ptr %0, ptr %1, i32 0, i32 %8)
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
  %262 = icmp slt i32 %261, 0
  %263 = add i32 %261, 101
  %264 = select i1 %262, i32 %263, i32 %261
  %265 = getelementptr inbounds i32, ptr %2, i32 %7
  store i32 %264, ptr %265, align 4
  ret void
}

define internal i32 @fused_select_5_bitcast_1257_6(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_select_5_concatenate_137_21(ptr %0, ptr %1, i32 %2, i32 0, i32 %3)
  ret i32 %5
}

define internal i32 @fused_select_5_bitcast_1273_6(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_select_5_concatenate_137_21(ptr %0, ptr %1, i32 %2, i32 1, i32 %3)
  ret i32 %5
}

define internal i32 @fused_select_5_concatenate_137_21(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4) {
  %6 = icmp ult i32 %2, 1
  br i1 %6, label %7, label %12

7:                                                ; preds = %5
  %8 = mul i32 %3, 4096
  %9 = add i32 %8, %4
  %10 = getelementptr inbounds i32, ptr %1, i32 %9
  %11 = load i32, ptr %10, align 4, !invariant.load !3
  br label %17

12:                                               ; preds = %5
  %13 = mul i32 %3, 4096
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

define ptx_kernel void @loop_compare_fusion_2(ptr noalias align 256 dereferenceable(16384) %0, ptr noalias align 256 dereferenceable(57344) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %3, 128
  %6 = add i32 %5, %4
  %7 = udiv i32 %6, 14
  %8 = urem i32 %6, 14
  %9 = srem i32 %8, 7
  %10 = icmp slt i32 %9, 0
  %11 = icmp ne i32 %9, 0
  %12 = and i1 %10, %11
  %13 = add i32 %9, 7
  %14 = select i1 %12, i32 %13, i32 %9
  %15 = getelementptr inbounds i32, ptr %0, i32 %7
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = icmp slt i32 %14, %16
  %18 = zext i1 %17 to i8
  %19 = getelementptr inbounds i8, ptr %1, i32 %6
  store i8 %18, ptr %19, align 1
  ret void
}

define ptx_kernel void @loop_reduce_fusion(ptr noalias align 256 dereferenceable(57344) %0, ptr noalias align 256 dereferenceable(8080) %1, ptr noalias align 256 dereferenceable(229376) %2, ptr noalias align 256 dereferenceable(16384) %3, ptr noalias align 256 dereferenceable(16384) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = mul i32 %6, 128
  %9 = add i32 %8, %7
  %10 = mul i32 %7, 14
  %11 = mul i32 %6, 1792
  %12 = add i32 %10, %11
  br label %13

13:                                               ; preds = %18, %5
  %14 = phi i32 [ %235, %18 ], [ 0, %5 ]
  %15 = phi i32 [ %229, %18 ], [ -2147483648, %5 ]
  %16 = phi i32 [ %234, %18 ], [ 0, %5 ]
  %17 = icmp slt i32 %14, 14
  br i1 %17, label %18, label %236

18:                                               ; preds = %13
  %19 = add i32 %12, %14
  %20 = getelementptr inbounds i32, ptr %2, i32 %19
  %21 = load i32, ptr %20, align 4, !invariant.load !3
  %22 = call i32 @llvm.smin.i32(i32 %21, i32 100)
  %23 = call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = mul i32 %23, 20
  %25 = add i32 %24, 5
  %26 = getelementptr inbounds float, ptr %1, i32 %25
  %27 = load float, ptr %26, align 4, !invariant.load !3
  %28 = fptosi float %27 to i32
  %29 = fcmp ole float %27, 0xC1E0000000000000
  %30 = select i1 %29, i32 -2147483648, i32 %28
  %31 = fcmp oge float %27, 0x41E0000000000000
  %32 = select i1 %31, i32 2147483647, i32 %30
  %33 = fcmp uno float %27, %27
  %34 = select i1 %33, i32 0, i32 %32
  %35 = getelementptr inbounds i8, ptr %0, i32 %19
  %36 = load i8, ptr %35, align 1, !invariant.load !3
  %37 = add i32 %34, 1000
  %38 = trunc i8 %36 to i1
  %39 = select i1 %38, i32 %37, i32 -10000
  %40 = zext i32 %14 to i64
  %41 = trunc i64 %40 to i32
  %42 = icmp sgt i32 %15, %39
  %43 = select i1 %42, i32 %15, i32 %39
  %44 = icmp eq i32 %15, %39
  %45 = icmp slt i32 %16, %41
  %46 = and i1 %44, %45
  %47 = or i1 %42, %46
  %48 = select i1 %47, i32 %16, i32 %41
  %49 = add i32 %14, 1
  %50 = add i32 %12, %49
  %51 = getelementptr inbounds i32, ptr %2, i32 %50
  %52 = load i32, ptr %51, align 4, !invariant.load !3
  %53 = call i32 @llvm.smin.i32(i32 %52, i32 100)
  %54 = call i32 @llvm.smax.i32(i32 %53, i32 0)
  %55 = mul i32 %54, 20
  %56 = add i32 %55, 5
  %57 = getelementptr inbounds float, ptr %1, i32 %56
  %58 = load float, ptr %57, align 4, !invariant.load !3
  %59 = fptosi float %58 to i32
  %60 = fcmp ole float %58, 0xC1E0000000000000
  %61 = select i1 %60, i32 -2147483648, i32 %59
  %62 = fcmp oge float %58, 0x41E0000000000000
  %63 = select i1 %62, i32 2147483647, i32 %61
  %64 = fcmp uno float %58, %58
  %65 = select i1 %64, i32 0, i32 %63
  %66 = getelementptr inbounds i8, ptr %0, i32 %50
  %67 = load i8, ptr %66, align 1, !invariant.load !3
  %68 = add i32 %65, 1000
  %69 = trunc i8 %67 to i1
  %70 = select i1 %69, i32 %68, i32 -10000
  %71 = zext i32 %49 to i64
  %72 = trunc i64 %71 to i32
  %73 = icmp sgt i32 %43, %70
  %74 = select i1 %73, i32 %43, i32 %70
  %75 = icmp eq i32 %43, %70
  %76 = icmp slt i32 %48, %72
  %77 = and i1 %75, %76
  %78 = or i1 %73, %77
  %79 = select i1 %78, i32 %48, i32 %72
  %80 = add i32 %14, 2
  %81 = add i32 %12, %80
  %82 = getelementptr inbounds i32, ptr %2, i32 %81
  %83 = load i32, ptr %82, align 4, !invariant.load !3
  %84 = call i32 @llvm.smin.i32(i32 %83, i32 100)
  %85 = call i32 @llvm.smax.i32(i32 %84, i32 0)
  %86 = mul i32 %85, 20
  %87 = add i32 %86, 5
  %88 = getelementptr inbounds float, ptr %1, i32 %87
  %89 = load float, ptr %88, align 4, !invariant.load !3
  %90 = fptosi float %89 to i32
  %91 = fcmp ole float %89, 0xC1E0000000000000
  %92 = select i1 %91, i32 -2147483648, i32 %90
  %93 = fcmp oge float %89, 0x41E0000000000000
  %94 = select i1 %93, i32 2147483647, i32 %92
  %95 = fcmp uno float %89, %89
  %96 = select i1 %95, i32 0, i32 %94
  %97 = getelementptr inbounds i8, ptr %0, i32 %81
  %98 = load i8, ptr %97, align 1, !invariant.load !3
  %99 = add i32 %96, 1000
  %100 = trunc i8 %98 to i1
  %101 = select i1 %100, i32 %99, i32 -10000
  %102 = zext i32 %80 to i64
  %103 = trunc i64 %102 to i32
  %104 = icmp sgt i32 %74, %101
  %105 = select i1 %104, i32 %74, i32 %101
  %106 = icmp eq i32 %74, %101
  %107 = icmp slt i32 %79, %103
  %108 = and i1 %106, %107
  %109 = or i1 %104, %108
  %110 = select i1 %109, i32 %79, i32 %103
  %111 = add i32 %14, 3
  %112 = add i32 %12, %111
  %113 = getelementptr inbounds i32, ptr %2, i32 %112
  %114 = load i32, ptr %113, align 4, !invariant.load !3
  %115 = call i32 @llvm.smin.i32(i32 %114, i32 100)
  %116 = call i32 @llvm.smax.i32(i32 %115, i32 0)
  %117 = mul i32 %116, 20
  %118 = add i32 %117, 5
  %119 = getelementptr inbounds float, ptr %1, i32 %118
  %120 = load float, ptr %119, align 4, !invariant.load !3
  %121 = fptosi float %120 to i32
  %122 = fcmp ole float %120, 0xC1E0000000000000
  %123 = select i1 %122, i32 -2147483648, i32 %121
  %124 = fcmp oge float %120, 0x41E0000000000000
  %125 = select i1 %124, i32 2147483647, i32 %123
  %126 = fcmp uno float %120, %120
  %127 = select i1 %126, i32 0, i32 %125
  %128 = getelementptr inbounds i8, ptr %0, i32 %112
  %129 = load i8, ptr %128, align 1, !invariant.load !3
  %130 = add i32 %127, 1000
  %131 = trunc i8 %129 to i1
  %132 = select i1 %131, i32 %130, i32 -10000
  %133 = zext i32 %111 to i64
  %134 = trunc i64 %133 to i32
  %135 = icmp sgt i32 %105, %132
  %136 = select i1 %135, i32 %105, i32 %132
  %137 = icmp eq i32 %105, %132
  %138 = icmp slt i32 %110, %134
  %139 = and i1 %137, %138
  %140 = or i1 %135, %139
  %141 = select i1 %140, i32 %110, i32 %134
  %142 = add i32 %14, 4
  %143 = add i32 %12, %142
  %144 = getelementptr inbounds i32, ptr %2, i32 %143
  %145 = load i32, ptr %144, align 4, !invariant.load !3
  %146 = call i32 @llvm.smin.i32(i32 %145, i32 100)
  %147 = call i32 @llvm.smax.i32(i32 %146, i32 0)
  %148 = mul i32 %147, 20
  %149 = add i32 %148, 5
  %150 = getelementptr inbounds float, ptr %1, i32 %149
  %151 = load float, ptr %150, align 4, !invariant.load !3
  %152 = fptosi float %151 to i32
  %153 = fcmp ole float %151, 0xC1E0000000000000
  %154 = select i1 %153, i32 -2147483648, i32 %152
  %155 = fcmp oge float %151, 0x41E0000000000000
  %156 = select i1 %155, i32 2147483647, i32 %154
  %157 = fcmp uno float %151, %151
  %158 = select i1 %157, i32 0, i32 %156
  %159 = getelementptr inbounds i8, ptr %0, i32 %143
  %160 = load i8, ptr %159, align 1, !invariant.load !3
  %161 = add i32 %158, 1000
  %162 = trunc i8 %160 to i1
  %163 = select i1 %162, i32 %161, i32 -10000
  %164 = zext i32 %142 to i64
  %165 = trunc i64 %164 to i32
  %166 = icmp sgt i32 %136, %163
  %167 = select i1 %166, i32 %136, i32 %163
  %168 = icmp eq i32 %136, %163
  %169 = icmp slt i32 %141, %165
  %170 = and i1 %168, %169
  %171 = or i1 %166, %170
  %172 = select i1 %171, i32 %141, i32 %165
  %173 = add i32 %14, 5
  %174 = add i32 %12, %173
  %175 = getelementptr inbounds i32, ptr %2, i32 %174
  %176 = load i32, ptr %175, align 4, !invariant.load !3
  %177 = call i32 @llvm.smin.i32(i32 %176, i32 100)
  %178 = call i32 @llvm.smax.i32(i32 %177, i32 0)
  %179 = mul i32 %178, 20
  %180 = add i32 %179, 5
  %181 = getelementptr inbounds float, ptr %1, i32 %180
  %182 = load float, ptr %181, align 4, !invariant.load !3
  %183 = fptosi float %182 to i32
  %184 = fcmp ole float %182, 0xC1E0000000000000
  %185 = select i1 %184, i32 -2147483648, i32 %183
  %186 = fcmp oge float %182, 0x41E0000000000000
  %187 = select i1 %186, i32 2147483647, i32 %185
  %188 = fcmp uno float %182, %182
  %189 = select i1 %188, i32 0, i32 %187
  %190 = getelementptr inbounds i8, ptr %0, i32 %174
  %191 = load i8, ptr %190, align 1, !invariant.load !3
  %192 = add i32 %189, 1000
  %193 = trunc i8 %191 to i1
  %194 = select i1 %193, i32 %192, i32 -10000
  %195 = zext i32 %173 to i64
  %196 = trunc i64 %195 to i32
  %197 = icmp sgt i32 %167, %194
  %198 = select i1 %197, i32 %167, i32 %194
  %199 = icmp eq i32 %167, %194
  %200 = icmp slt i32 %172, %196
  %201 = and i1 %199, %200
  %202 = or i1 %197, %201
  %203 = select i1 %202, i32 %172, i32 %196
  %204 = add i32 %14, 6
  %205 = add i32 %12, %204
  %206 = getelementptr inbounds i32, ptr %2, i32 %205
  %207 = load i32, ptr %206, align 4, !invariant.load !3
  %208 = call i32 @llvm.smin.i32(i32 %207, i32 100)
  %209 = call i32 @llvm.smax.i32(i32 %208, i32 0)
  %210 = mul i32 %209, 20
  %211 = add i32 %210, 5
  %212 = getelementptr inbounds float, ptr %1, i32 %211
  %213 = load float, ptr %212, align 4, !invariant.load !3
  %214 = fptosi float %213 to i32
  %215 = fcmp ole float %213, 0xC1E0000000000000
  %216 = select i1 %215, i32 -2147483648, i32 %214
  %217 = fcmp oge float %213, 0x41E0000000000000
  %218 = select i1 %217, i32 2147483647, i32 %216
  %219 = fcmp uno float %213, %213
  %220 = select i1 %219, i32 0, i32 %218
  %221 = getelementptr inbounds i8, ptr %0, i32 %205
  %222 = load i8, ptr %221, align 1, !invariant.load !3
  %223 = add i32 %220, 1000
  %224 = trunc i8 %222 to i1
  %225 = select i1 %224, i32 %223, i32 -10000
  %226 = zext i32 %204 to i64
  %227 = trunc i64 %226 to i32
  %228 = icmp sgt i32 %198, %225
  %229 = select i1 %228, i32 %198, i32 %225
  %230 = icmp eq i32 %198, %225
  %231 = icmp slt i32 %203, %227
  %232 = and i1 %230, %231
  %233 = or i1 %228, %232
  %234 = select i1 %233, i32 %203, i32 %227
  %235 = add i32 %14, 7
  br label %13

236:                                              ; preds = %13
  %237 = getelementptr inbounds i32, ptr %3, i32 %9
  store i32 %15, ptr %237, align 4
  %238 = getelementptr inbounds i32, ptr %4, i32 %9
  store i32 %16, ptr %238, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

define ptx_kernel void @loop_select_fusion_6(ptr noalias align 256 dereferenceable(16384) %0, ptr noalias align 256 dereferenceable(57344) %1, ptr noalias align 256 dereferenceable(8080) %2, ptr noalias align 256 dereferenceable(229376) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = mul i32 %5, 128
  %8 = add i32 %7, %6
  %9 = mul i32 %6, 14
  %10 = mul i32 %5, 1792
  %11 = add i32 %9, %10
  %12 = getelementptr inbounds i32, ptr %3, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = call i32 @llvm.smin.i32(i32 %13, i32 100)
  %15 = call i32 @llvm.smax.i32(i32 %14, i32 0)
  %16 = mul i32 %15, 20
  %17 = add i32 %16, 5
  %18 = getelementptr inbounds float, ptr %2, i32 %17
  %19 = load float, ptr %18, align 4, !invariant.load !3
  %20 = fptosi float %19 to i32
  %21 = fcmp ole float %19, 0xC1E0000000000000
  %22 = select i1 %21, i32 -2147483648, i32 %20
  %23 = fcmp oge float %19, 0x41E0000000000000
  %24 = select i1 %23, i32 2147483647, i32 %22
  %25 = fcmp uno float %19, %19
  %26 = select i1 %25, i32 0, i32 %24
  %27 = getelementptr inbounds i8, ptr %1, i32 %11
  %28 = load i8, ptr %27, align 1, !invariant.load !3
  %29 = add i32 %26, 1000
  %30 = trunc i8 %28 to i1
  %31 = select i1 %30, i32 %29, i32 -10000
  %32 = add i32 %11, 1
  %33 = getelementptr inbounds i32, ptr %3, i32 %32
  %34 = load i32, ptr %33, align 4, !invariant.load !3
  %35 = call i32 @llvm.smin.i32(i32 %34, i32 100)
  %36 = call i32 @llvm.smax.i32(i32 %35, i32 0)
  %37 = mul i32 %36, 20
  %38 = add i32 %37, 5
  %39 = getelementptr inbounds float, ptr %2, i32 %38
  %40 = load float, ptr %39, align 4, !invariant.load !3
  %41 = fptosi float %40 to i32
  %42 = fcmp ole float %40, 0xC1E0000000000000
  %43 = select i1 %42, i32 -2147483648, i32 %41
  %44 = fcmp oge float %40, 0x41E0000000000000
  %45 = select i1 %44, i32 2147483647, i32 %43
  %46 = fcmp uno float %40, %40
  %47 = select i1 %46, i32 0, i32 %45
  %48 = getelementptr inbounds i8, ptr %1, i32 %32
  %49 = load i8, ptr %48, align 1, !invariant.load !3
  %50 = add i32 %47, 1000
  %51 = trunc i8 %49 to i1
  %52 = select i1 %51, i32 %50, i32 -10000
  %53 = call i32 @llvm.smax.i32(i32 %31, i32 %52)
  %54 = add i32 %11, 2
  %55 = getelementptr inbounds i32, ptr %3, i32 %54
  %56 = load i32, ptr %55, align 4, !invariant.load !3
  %57 = call i32 @llvm.smin.i32(i32 %56, i32 100)
  %58 = call i32 @llvm.smax.i32(i32 %57, i32 0)
  %59 = mul i32 %58, 20
  %60 = add i32 %59, 5
  %61 = getelementptr inbounds float, ptr %2, i32 %60
  %62 = load float, ptr %61, align 4, !invariant.load !3
  %63 = fptosi float %62 to i32
  %64 = fcmp ole float %62, 0xC1E0000000000000
  %65 = select i1 %64, i32 -2147483648, i32 %63
  %66 = fcmp oge float %62, 0x41E0000000000000
  %67 = select i1 %66, i32 2147483647, i32 %65
  %68 = fcmp uno float %62, %62
  %69 = select i1 %68, i32 0, i32 %67
  %70 = getelementptr inbounds i8, ptr %1, i32 %54
  %71 = load i8, ptr %70, align 1, !invariant.load !3
  %72 = add i32 %69, 1000
  %73 = trunc i8 %71 to i1
  %74 = select i1 %73, i32 %72, i32 -10000
  %75 = call i32 @llvm.smax.i32(i32 %53, i32 %74)
  %76 = add i32 %11, 3
  %77 = getelementptr inbounds i32, ptr %3, i32 %76
  %78 = load i32, ptr %77, align 4, !invariant.load !3
  %79 = call i32 @llvm.smin.i32(i32 %78, i32 100)
  %80 = call i32 @llvm.smax.i32(i32 %79, i32 0)
  %81 = mul i32 %80, 20
  %82 = add i32 %81, 5
  %83 = getelementptr inbounds float, ptr %2, i32 %82
  %84 = load float, ptr %83, align 4, !invariant.load !3
  %85 = fptosi float %84 to i32
  %86 = fcmp ole float %84, 0xC1E0000000000000
  %87 = select i1 %86, i32 -2147483648, i32 %85
  %88 = fcmp oge float %84, 0x41E0000000000000
  %89 = select i1 %88, i32 2147483647, i32 %87
  %90 = fcmp uno float %84, %84
  %91 = select i1 %90, i32 0, i32 %89
  %92 = getelementptr inbounds i8, ptr %1, i32 %76
  %93 = load i8, ptr %92, align 1, !invariant.load !3
  %94 = add i32 %91, 1000
  %95 = trunc i8 %93 to i1
  %96 = select i1 %95, i32 %94, i32 -10000
  %97 = call i32 @llvm.smax.i32(i32 %75, i32 %96)
  %98 = add i32 %11, 4
  %99 = getelementptr inbounds i32, ptr %3, i32 %98
  %100 = load i32, ptr %99, align 4, !invariant.load !3
  %101 = call i32 @llvm.smin.i32(i32 %100, i32 100)
  %102 = call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = mul i32 %102, 20
  %104 = add i32 %103, 5
  %105 = getelementptr inbounds float, ptr %2, i32 %104
  %106 = load float, ptr %105, align 4, !invariant.load !3
  %107 = fptosi float %106 to i32
  %108 = fcmp ole float %106, 0xC1E0000000000000
  %109 = select i1 %108, i32 -2147483648, i32 %107
  %110 = fcmp oge float %106, 0x41E0000000000000
  %111 = select i1 %110, i32 2147483647, i32 %109
  %112 = fcmp uno float %106, %106
  %113 = select i1 %112, i32 0, i32 %111
  %114 = getelementptr inbounds i8, ptr %1, i32 %98
  %115 = load i8, ptr %114, align 1, !invariant.load !3
  %116 = add i32 %113, 1000
  %117 = trunc i8 %115 to i1
  %118 = select i1 %117, i32 %116, i32 -10000
  %119 = call i32 @llvm.smax.i32(i32 %97, i32 %118)
  %120 = add i32 %11, 5
  %121 = getelementptr inbounds i32, ptr %3, i32 %120
  %122 = load i32, ptr %121, align 4, !invariant.load !3
  %123 = call i32 @llvm.smin.i32(i32 %122, i32 100)
  %124 = call i32 @llvm.smax.i32(i32 %123, i32 0)
  %125 = mul i32 %124, 20
  %126 = add i32 %125, 5
  %127 = getelementptr inbounds float, ptr %2, i32 %126
  %128 = load float, ptr %127, align 4, !invariant.load !3
  %129 = fptosi float %128 to i32
  %130 = fcmp ole float %128, 0xC1E0000000000000
  %131 = select i1 %130, i32 -2147483648, i32 %129
  %132 = fcmp oge float %128, 0x41E0000000000000
  %133 = select i1 %132, i32 2147483647, i32 %131
  %134 = fcmp uno float %128, %128
  %135 = select i1 %134, i32 0, i32 %133
  %136 = getelementptr inbounds i8, ptr %1, i32 %120
  %137 = load i8, ptr %136, align 1, !invariant.load !3
  %138 = add i32 %135, 1000
  %139 = trunc i8 %137 to i1
  %140 = select i1 %139, i32 %138, i32 -10000
  %141 = call i32 @llvm.smax.i32(i32 %119, i32 %140)
  %142 = add i32 %11, 6
  %143 = getelementptr inbounds i32, ptr %3, i32 %142
  %144 = load i32, ptr %143, align 4, !invariant.load !3
  %145 = call i32 @llvm.smin.i32(i32 %144, i32 100)
  %146 = call i32 @llvm.smax.i32(i32 %145, i32 0)
  %147 = mul i32 %146, 20
  %148 = add i32 %147, 5
  %149 = getelementptr inbounds float, ptr %2, i32 %148
  %150 = load float, ptr %149, align 4, !invariant.load !3
  %151 = fptosi float %150 to i32
  %152 = fcmp ole float %150, 0xC1E0000000000000
  %153 = select i1 %152, i32 -2147483648, i32 %151
  %154 = fcmp oge float %150, 0x41E0000000000000
  %155 = select i1 %154, i32 2147483647, i32 %153
  %156 = fcmp uno float %150, %150
  %157 = select i1 %156, i32 0, i32 %155
  %158 = getelementptr inbounds i8, ptr %1, i32 %142
  %159 = load i8, ptr %158, align 1, !invariant.load !3
  %160 = add i32 %157, 1000
  %161 = trunc i8 %159 to i1
  %162 = select i1 %161, i32 %160, i32 -10000
  %163 = call i32 @llvm.smax.i32(i32 %141, i32 %162)
  %164 = add i32 %11, 7
  %165 = getelementptr inbounds i32, ptr %3, i32 %164
  %166 = load i32, ptr %165, align 4, !invariant.load !3
  %167 = call i32 @llvm.smin.i32(i32 %166, i32 100)
  %168 = call i32 @llvm.smax.i32(i32 %167, i32 0)
  %169 = mul i32 %168, 20
  %170 = add i32 %169, 5
  %171 = getelementptr inbounds float, ptr %2, i32 %170
  %172 = load float, ptr %171, align 4, !invariant.load !3
  %173 = fptosi float %172 to i32
  %174 = fcmp ole float %172, 0xC1E0000000000000
  %175 = select i1 %174, i32 -2147483648, i32 %173
  %176 = fcmp oge float %172, 0x41E0000000000000
  %177 = select i1 %176, i32 2147483647, i32 %175
  %178 = fcmp uno float %172, %172
  %179 = select i1 %178, i32 0, i32 %177
  %180 = getelementptr inbounds i8, ptr %1, i32 %164
  %181 = load i8, ptr %180, align 1, !invariant.load !3
  %182 = add i32 %179, 1000
  %183 = trunc i8 %181 to i1
  %184 = select i1 %183, i32 %182, i32 -10000
  %185 = call i32 @llvm.smax.i32(i32 %163, i32 %184)
  %186 = add i32 %11, 8
  %187 = getelementptr inbounds i32, ptr %3, i32 %186
  %188 = load i32, ptr %187, align 4, !invariant.load !3
  %189 = call i32 @llvm.smin.i32(i32 %188, i32 100)
  %190 = call i32 @llvm.smax.i32(i32 %189, i32 0)
  %191 = mul i32 %190, 20
  %192 = add i32 %191, 5
  %193 = getelementptr inbounds float, ptr %2, i32 %192
  %194 = load float, ptr %193, align 4, !invariant.load !3
  %195 = fptosi float %194 to i32
  %196 = fcmp ole float %194, 0xC1E0000000000000
  %197 = select i1 %196, i32 -2147483648, i32 %195
  %198 = fcmp oge float %194, 0x41E0000000000000
  %199 = select i1 %198, i32 2147483647, i32 %197
  %200 = fcmp uno float %194, %194
  %201 = select i1 %200, i32 0, i32 %199
  %202 = getelementptr inbounds i8, ptr %1, i32 %186
  %203 = load i8, ptr %202, align 1, !invariant.load !3
  %204 = add i32 %201, 1000
  %205 = trunc i8 %203 to i1
  %206 = select i1 %205, i32 %204, i32 -10000
  %207 = call i32 @llvm.smax.i32(i32 %185, i32 %206)
  %208 = add i32 %11, 9
  %209 = getelementptr inbounds i32, ptr %3, i32 %208
  %210 = load i32, ptr %209, align 4, !invariant.load !3
  %211 = call i32 @llvm.smin.i32(i32 %210, i32 100)
  %212 = call i32 @llvm.smax.i32(i32 %211, i32 0)
  %213 = mul i32 %212, 20
  %214 = add i32 %213, 5
  %215 = getelementptr inbounds float, ptr %2, i32 %214
  %216 = load float, ptr %215, align 4, !invariant.load !3
  %217 = fptosi float %216 to i32
  %218 = fcmp ole float %216, 0xC1E0000000000000
  %219 = select i1 %218, i32 -2147483648, i32 %217
  %220 = fcmp oge float %216, 0x41E0000000000000
  %221 = select i1 %220, i32 2147483647, i32 %219
  %222 = fcmp uno float %216, %216
  %223 = select i1 %222, i32 0, i32 %221
  %224 = getelementptr inbounds i8, ptr %1, i32 %208
  %225 = load i8, ptr %224, align 1, !invariant.load !3
  %226 = add i32 %223, 1000
  %227 = trunc i8 %225 to i1
  %228 = select i1 %227, i32 %226, i32 -10000
  %229 = call i32 @llvm.smax.i32(i32 %207, i32 %228)
  %230 = add i32 %11, 10
  %231 = getelementptr inbounds i32, ptr %3, i32 %230
  %232 = load i32, ptr %231, align 4, !invariant.load !3
  %233 = call i32 @llvm.smin.i32(i32 %232, i32 100)
  %234 = call i32 @llvm.smax.i32(i32 %233, i32 0)
  %235 = mul i32 %234, 20
  %236 = add i32 %235, 5
  %237 = getelementptr inbounds float, ptr %2, i32 %236
  %238 = load float, ptr %237, align 4, !invariant.load !3
  %239 = fptosi float %238 to i32
  %240 = fcmp ole float %238, 0xC1E0000000000000
  %241 = select i1 %240, i32 -2147483648, i32 %239
  %242 = fcmp oge float %238, 0x41E0000000000000
  %243 = select i1 %242, i32 2147483647, i32 %241
  %244 = fcmp uno float %238, %238
  %245 = select i1 %244, i32 0, i32 %243
  %246 = getelementptr inbounds i8, ptr %1, i32 %230
  %247 = load i8, ptr %246, align 1, !invariant.load !3
  %248 = add i32 %245, 1000
  %249 = trunc i8 %247 to i1
  %250 = select i1 %249, i32 %248, i32 -10000
  %251 = call i32 @llvm.smax.i32(i32 %229, i32 %250)
  %252 = add i32 %11, 11
  %253 = getelementptr inbounds i32, ptr %3, i32 %252
  %254 = load i32, ptr %253, align 4, !invariant.load !3
  %255 = call i32 @llvm.smin.i32(i32 %254, i32 100)
  %256 = call i32 @llvm.smax.i32(i32 %255, i32 0)
  %257 = mul i32 %256, 20
  %258 = add i32 %257, 5
  %259 = getelementptr inbounds float, ptr %2, i32 %258
  %260 = load float, ptr %259, align 4, !invariant.load !3
  %261 = fptosi float %260 to i32
  %262 = fcmp ole float %260, 0xC1E0000000000000
  %263 = select i1 %262, i32 -2147483648, i32 %261
  %264 = fcmp oge float %260, 0x41E0000000000000
  %265 = select i1 %264, i32 2147483647, i32 %263
  %266 = fcmp uno float %260, %260
  %267 = select i1 %266, i32 0, i32 %265
  %268 = getelementptr inbounds i8, ptr %1, i32 %252
  %269 = load i8, ptr %268, align 1, !invariant.load !3
  %270 = add i32 %267, 1000
  %271 = trunc i8 %269 to i1
  %272 = select i1 %271, i32 %270, i32 -10000
  %273 = call i32 @llvm.smax.i32(i32 %251, i32 %272)
  %274 = add i32 %11, 12
  %275 = getelementptr inbounds i32, ptr %3, i32 %274
  %276 = load i32, ptr %275, align 4, !invariant.load !3
  %277 = call i32 @llvm.smin.i32(i32 %276, i32 100)
  %278 = call i32 @llvm.smax.i32(i32 %277, i32 0)
  %279 = mul i32 %278, 20
  %280 = add i32 %279, 5
  %281 = getelementptr inbounds float, ptr %2, i32 %280
  %282 = load float, ptr %281, align 4, !invariant.load !3
  %283 = fptosi float %282 to i32
  %284 = fcmp ole float %282, 0xC1E0000000000000
  %285 = select i1 %284, i32 -2147483648, i32 %283
  %286 = fcmp oge float %282, 0x41E0000000000000
  %287 = select i1 %286, i32 2147483647, i32 %285
  %288 = fcmp uno float %282, %282
  %289 = select i1 %288, i32 0, i32 %287
  %290 = getelementptr inbounds i8, ptr %1, i32 %274
  %291 = load i8, ptr %290, align 1, !invariant.load !3
  %292 = add i32 %289, 1000
  %293 = trunc i8 %291 to i1
  %294 = select i1 %293, i32 %292, i32 -10000
  %295 = call i32 @llvm.smax.i32(i32 %273, i32 %294)
  %296 = add i32 %11, 13
  %297 = getelementptr inbounds i32, ptr %3, i32 %296
  %298 = load i32, ptr %297, align 4, !invariant.load !3
  %299 = call i32 @llvm.smin.i32(i32 %298, i32 100)
  %300 = call i32 @llvm.smax.i32(i32 %299, i32 0)
  %301 = mul i32 %300, 20
  %302 = add i32 %301, 5
  %303 = getelementptr inbounds float, ptr %2, i32 %302
  %304 = load float, ptr %303, align 4, !invariant.load !3
  %305 = fptosi float %304 to i32
  %306 = fcmp ole float %304, 0xC1E0000000000000
  %307 = select i1 %306, i32 -2147483648, i32 %305
  %308 = fcmp oge float %304, 0x41E0000000000000
  %309 = select i1 %308, i32 2147483647, i32 %307
  %310 = fcmp uno float %304, %304
  %311 = select i1 %310, i32 0, i32 %309
  %312 = getelementptr inbounds i8, ptr %1, i32 %296
  %313 = load i8, ptr %312, align 1, !invariant.load !3
  %314 = add i32 %311, 1000
  %315 = trunc i8 %313 to i1
  %316 = select i1 %315, i32 %314, i32 -10000
  %317 = call i32 @llvm.smax.i32(i32 %295, i32 %316)
  %318 = icmp sgt i32 %317, -10000
  %319 = getelementptr inbounds i32, ptr %0, i32 %8
  %320 = load i32, ptr %319, align 4
  %321 = select i1 %318, i32 %320, i32 -1
  store i32 %321, ptr %319, align 4
  ret void
}

define ptx_kernel void @loop_slice_fusion_1(ptr noalias align 256 dereferenceable(16384) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(32768) %2, ptr noalias align 256 dereferenceable(32768) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !4
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = udiv i32 %5, 32
  %8 = urem i32 %5, 32
  %9 = mul i32 %8, 128
  %10 = add i32 %9, %6
  %11 = icmp ult i32 %7, 1
  br i1 %11, label %12, label %192

12:                                               ; preds = %4
  %13 = call i32 @fused_slice_1_broadcast_3080_106(ptr %0, ptr %1, i32 1, i32 %10)
  %14 = call i32 @fused_slice_1_broadcast_3131_39(ptr %0, ptr %1, i32 1, i32 %10)
  %15 = add i32 %13, %14
  %16 = call i32 @fused_slice_1_broadcast_3104_554_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %17 = call i32 @fused_slice_1_broadcast_3132_53(ptr %0, ptr %1, i32 1, i32 %10)
  %18 = add i32 %16, %17
  %19 = add i32 %15, %18
  %20 = call i32 @fused_slice_1_broadcast_3106_278_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %21 = shl i32 %18, %20
  %22 = icmp ult i32 %20, 32
  %23 = select i1 %22, i32 %21, i32 0
  %24 = call i32 @fused_slice_1_broadcast_3107_278_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %25 = lshr i32 %18, %24
  %26 = icmp ult i32 %24, 32
  %27 = select i1 %26, i32 %25, i32 0
  %28 = or i32 %23, %27
  %29 = xor i32 %19, %28
  %30 = add i32 %19, %29
  %31 = call i32 @fused_slice_1_broadcast_3108_478_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %32 = shl i32 %29, %31
  %33 = icmp ult i32 %31, 32
  %34 = select i1 %33, i32 %32, i32 0
  %35 = call i32 @fused_slice_1_broadcast_3110_478_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %36 = lshr i32 %29, %35
  %37 = icmp ult i32 %35, 32
  %38 = select i1 %37, i32 %36, i32 0
  %39 = or i32 %34, %38
  %40 = xor i32 %30, %39
  %41 = add i32 %30, %40
  %42 = call i32 @fused_slice_1_broadcast_3111_604_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %43 = shl i32 %40, %42
  %44 = icmp ult i32 %42, 32
  %45 = select i1 %44, i32 %43, i32 0
  %46 = call i32 @fused_slice_1_broadcast_3112_604_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %47 = lshr i32 %40, %46
  %48 = icmp ult i32 %46, 32
  %49 = select i1 %48, i32 %47, i32 0
  %50 = or i32 %45, %49
  %51 = xor i32 %41, %50
  %52 = add i32 %41, %51
  %53 = add i32 %52, %17
  %54 = shl i32 %51, %46
  %55 = select i1 %48, i32 %54, i32 0
  %56 = lshr i32 %51, %42
  %57 = select i1 %44, i32 %56, i32 0
  %58 = or i32 %55, %57
  %59 = xor i32 %52, %58
  %60 = call i32 @fused_slice_1_broadcast_3133_29(ptr %0, ptr %1, i32 1, i32 %10)
  %61 = add i32 %59, %60
  %62 = call i32 @fused_slice_1_broadcast_3115_112_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %63 = add i32 %61, %62
  %64 = add i32 %53, %63
  %65 = shl i32 %63, %35
  %66 = select i1 %37, i32 %65, i32 0
  %67 = lshr i32 %63, %31
  %68 = select i1 %33, i32 %67, i32 0
  %69 = or i32 %66, %68
  %70 = xor i32 %64, %69
  %71 = add i32 %64, %70
  %72 = call i32 @fused_slice_1_broadcast_3116_128_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %73 = shl i32 %70, %72
  %74 = icmp ult i32 %72, 32
  %75 = select i1 %74, i32 %73, i32 0
  %76 = call i32 @fused_slice_1_broadcast_3117_182_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %77 = lshr i32 %70, %76
  %78 = icmp ult i32 %76, 32
  %79 = select i1 %78, i32 %77, i32 0
  %80 = or i32 %75, %79
  %81 = xor i32 %71, %80
  %82 = add i32 %71, %81
  %83 = call i32 @fused_slice_1_broadcast_3118_256_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %84 = shl i32 %81, %83
  %85 = icmp ult i32 %83, 32
  %86 = select i1 %85, i32 %84, i32 0
  %87 = lshr i32 %81, %83
  %88 = select i1 %85, i32 %87, i32 0
  %89 = or i32 %86, %88
  %90 = xor i32 %82, %89
  %91 = add i32 %82, %90
  %92 = add i32 %91, %60
  %93 = call i32 @fused_slice_1_broadcast_3119_144_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %94 = shl i32 %90, %93
  %95 = icmp ult i32 %93, 32
  %96 = select i1 %95, i32 %94, i32 0
  %97 = call i32 @fused_slice_1_broadcast_3120_144_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %98 = lshr i32 %90, %97
  %99 = icmp ult i32 %97, 32
  %100 = select i1 %99, i32 %98, i32 0
  %101 = or i32 %96, %100
  %102 = xor i32 %91, %101
  %103 = add i32 %102, %14
  %104 = call i32 @fused_slice_1_broadcast_3121_54_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %105 = add i32 %103, %104
  %106 = add i32 %92, %105
  %107 = shl i32 %105, %20
  %108 = select i1 %22, i32 %107, i32 0
  %109 = lshr i32 %105, %24
  %110 = select i1 %26, i32 %109, i32 0
  %111 = or i32 %108, %110
  %112 = xor i32 %106, %111
  %113 = add i32 %106, %112
  %114 = shl i32 %112, %31
  %115 = select i1 %33, i32 %114, i32 0
  %116 = lshr i32 %112, %35
  %117 = select i1 %37, i32 %116, i32 0
  %118 = or i32 %115, %117
  %119 = xor i32 %113, %118
  %120 = add i32 %113, %119
  %121 = shl i32 %119, %42
  %122 = select i1 %44, i32 %121, i32 0
  %123 = lshr i32 %119, %46
  %124 = select i1 %48, i32 %123, i32 0
  %125 = or i32 %122, %124
  %126 = xor i32 %120, %125
  %127 = add i32 %120, %126
  %128 = add i32 %127, %14
  %129 = shl i32 %126, %46
  %130 = select i1 %48, i32 %129, i32 0
  %131 = lshr i32 %126, %42
  %132 = select i1 %44, i32 %131, i32 0
  %133 = or i32 %130, %132
  %134 = xor i32 %127, %133
  %135 = add i32 %134, %17
  %136 = add i32 %135, %76
  %137 = add i32 %128, %136
  %138 = shl i32 %136, %35
  %139 = select i1 %37, i32 %138, i32 0
  %140 = lshr i32 %136, %31
  %141 = select i1 %33, i32 %140, i32 0
  %142 = or i32 %139, %141
  %143 = xor i32 %137, %142
  %144 = add i32 %137, %143
  %145 = shl i32 %143, %72
  %146 = select i1 %74, i32 %145, i32 0
  %147 = lshr i32 %143, %76
  %148 = select i1 %78, i32 %147, i32 0
  %149 = or i32 %146, %148
  %150 = xor i32 %144, %149
  %151 = add i32 %144, %150
  %152 = shl i32 %150, %83
  %153 = select i1 %85, i32 %152, i32 0
  %154 = lshr i32 %150, %83
  %155 = select i1 %85, i32 %154, i32 0
  %156 = or i32 %153, %155
  %157 = xor i32 %151, %156
  %158 = add i32 %151, %157
  %159 = add i32 %158, %17
  %160 = shl i32 %157, %93
  %161 = select i1 %95, i32 %160, i32 0
  %162 = lshr i32 %157, %97
  %163 = select i1 %99, i32 %162, i32 0
  %164 = or i32 %161, %163
  %165 = xor i32 %158, %164
  %166 = add i32 %165, %60
  %167 = call i32 @fused_slice_1_broadcast_3122_20_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %168 = add i32 %166, %167
  %169 = add i32 %159, %168
  %170 = shl i32 %168, %20
  %171 = select i1 %22, i32 %170, i32 0
  %172 = lshr i32 %168, %24
  %173 = select i1 %26, i32 %172, i32 0
  %174 = or i32 %171, %173
  %175 = xor i32 %169, %174
  %176 = add i32 %169, %175
  %177 = shl i32 %175, %31
  %178 = select i1 %33, i32 %177, i32 0
  %179 = lshr i32 %175, %35
  %180 = select i1 %37, i32 %179, i32 0
  %181 = or i32 %178, %180
  %182 = xor i32 %176, %181
  %183 = add i32 %176, %182
  %184 = shl i32 %182, %42
  %185 = select i1 %44, i32 %184, i32 0
  %186 = lshr i32 %182, %46
  %187 = select i1 %48, i32 %186, i32 0
  %188 = or i32 %185, %187
  %189 = xor i32 %183, %188
  %190 = add i32 %183, %189
  %191 = add i32 %190, %60
  br label %380

192:                                              ; preds = %4
  %193 = call i32 @fused_slice_1_broadcast_3104_554_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %194 = call i32 @fused_slice_1_broadcast_3132_53(ptr %0, ptr %1, i32 1, i32 %10)
  %195 = add i32 %193, %194
  %196 = call i32 @fused_slice_1_broadcast_3106_278_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %197 = shl i32 %195, %196
  %198 = icmp ult i32 %196, 32
  %199 = select i1 %198, i32 %197, i32 0
  %200 = call i32 @fused_slice_1_broadcast_3107_278_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %201 = lshr i32 %195, %200
  %202 = icmp ult i32 %200, 32
  %203 = select i1 %202, i32 %201, i32 0
  %204 = or i32 %199, %203
  %205 = call i32 @fused_slice_1_broadcast_3080_106(ptr %0, ptr %1, i32 1, i32 %10)
  %206 = call i32 @fused_slice_1_broadcast_3131_39(ptr %0, ptr %1, i32 1, i32 %10)
  %207 = add i32 %205, %206
  %208 = add i32 %207, %195
  %209 = xor i32 %208, %204
  %210 = call i32 @fused_slice_1_broadcast_3108_478_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %211 = shl i32 %209, %210
  %212 = icmp ult i32 %210, 32
  %213 = select i1 %212, i32 %211, i32 0
  %214 = call i32 @fused_slice_1_broadcast_3110_478_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %215 = lshr i32 %209, %214
  %216 = icmp ult i32 %214, 32
  %217 = select i1 %216, i32 %215, i32 0
  %218 = or i32 %213, %217
  %219 = add i32 %208, %209
  %220 = xor i32 %219, %218
  %221 = call i32 @fused_slice_1_broadcast_3111_604_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %222 = shl i32 %220, %221
  %223 = icmp ult i32 %221, 32
  %224 = select i1 %223, i32 %222, i32 0
  %225 = call i32 @fused_slice_1_broadcast_3112_604_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %226 = lshr i32 %220, %225
  %227 = icmp ult i32 %225, 32
  %228 = select i1 %227, i32 %226, i32 0
  %229 = or i32 %224, %228
  %230 = add i32 %219, %220
  %231 = xor i32 %230, %229
  %232 = shl i32 %231, %225
  %233 = select i1 %227, i32 %232, i32 0
  %234 = lshr i32 %231, %221
  %235 = select i1 %223, i32 %234, i32 0
  %236 = or i32 %233, %235
  %237 = add i32 %230, %231
  %238 = xor i32 %237, %236
  %239 = call i32 @fused_slice_1_broadcast_3133_29(ptr %0, ptr %1, i32 1, i32 %10)
  %240 = add i32 %238, %239
  %241 = call i32 @fused_slice_1_broadcast_3115_112_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %242 = add i32 %240, %241
  %243 = shl i32 %242, %214
  %244 = select i1 %216, i32 %243, i32 0
  %245 = lshr i32 %242, %210
  %246 = select i1 %212, i32 %245, i32 0
  %247 = or i32 %244, %246
  %248 = add i32 %237, %194
  %249 = add i32 %248, %242
  %250 = xor i32 %249, %247
  %251 = call i32 @fused_slice_1_broadcast_3116_128_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %252 = shl i32 %250, %251
  %253 = icmp ult i32 %251, 32
  %254 = select i1 %253, i32 %252, i32 0
  %255 = call i32 @fused_slice_1_broadcast_3117_182_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %256 = lshr i32 %250, %255
  %257 = icmp ult i32 %255, 32
  %258 = select i1 %257, i32 %256, i32 0
  %259 = or i32 %254, %258
  %260 = add i32 %249, %250
  %261 = xor i32 %260, %259
  %262 = call i32 @fused_slice_1_broadcast_3118_256_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %263 = shl i32 %261, %262
  %264 = icmp ult i32 %262, 32
  %265 = select i1 %264, i32 %263, i32 0
  %266 = lshr i32 %261, %262
  %267 = select i1 %264, i32 %266, i32 0
  %268 = or i32 %265, %267
  %269 = add i32 %260, %261
  %270 = xor i32 %269, %268
  %271 = call i32 @fused_slice_1_broadcast_3119_144_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %272 = shl i32 %270, %271
  %273 = icmp ult i32 %271, 32
  %274 = select i1 %273, i32 %272, i32 0
  %275 = call i32 @fused_slice_1_broadcast_3120_144_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %276 = lshr i32 %270, %275
  %277 = icmp ult i32 %275, 32
  %278 = select i1 %277, i32 %276, i32 0
  %279 = or i32 %274, %278
  %280 = add i32 %269, %270
  %281 = xor i32 %280, %279
  %282 = add i32 %281, %206
  %283 = call i32 @fused_slice_1_broadcast_3121_54_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %284 = add i32 %282, %283
  %285 = shl i32 %284, %196
  %286 = select i1 %198, i32 %285, i32 0
  %287 = lshr i32 %284, %200
  %288 = select i1 %202, i32 %287, i32 0
  %289 = or i32 %286, %288
  %290 = add i32 %280, %239
  %291 = add i32 %290, %284
  %292 = xor i32 %291, %289
  %293 = shl i32 %292, %210
  %294 = select i1 %212, i32 %293, i32 0
  %295 = lshr i32 %292, %214
  %296 = select i1 %216, i32 %295, i32 0
  %297 = or i32 %294, %296
  %298 = add i32 %291, %292
  %299 = xor i32 %298, %297
  %300 = shl i32 %299, %221
  %301 = select i1 %223, i32 %300, i32 0
  %302 = lshr i32 %299, %225
  %303 = select i1 %227, i32 %302, i32 0
  %304 = or i32 %301, %303
  %305 = add i32 %298, %299
  %306 = xor i32 %305, %304
  %307 = shl i32 %306, %225
  %308 = select i1 %227, i32 %307, i32 0
  %309 = lshr i32 %306, %221
  %310 = select i1 %223, i32 %309, i32 0
  %311 = or i32 %308, %310
  %312 = add i32 %305, %306
  %313 = xor i32 %312, %311
  %314 = add i32 %313, %194
  %315 = add i32 %314, %255
  %316 = shl i32 %315, %214
  %317 = select i1 %216, i32 %316, i32 0
  %318 = lshr i32 %315, %210
  %319 = select i1 %212, i32 %318, i32 0
  %320 = or i32 %317, %319
  %321 = add i32 %312, %206
  %322 = add i32 %321, %315
  %323 = xor i32 %322, %320
  %324 = shl i32 %323, %251
  %325 = select i1 %253, i32 %324, i32 0
  %326 = lshr i32 %323, %255
  %327 = select i1 %257, i32 %326, i32 0
  %328 = or i32 %325, %327
  %329 = add i32 %322, %323
  %330 = xor i32 %329, %328
  %331 = shl i32 %330, %262
  %332 = select i1 %264, i32 %331, i32 0
  %333 = lshr i32 %330, %262
  %334 = select i1 %264, i32 %333, i32 0
  %335 = or i32 %332, %334
  %336 = add i32 %329, %330
  %337 = xor i32 %336, %335
  %338 = shl i32 %337, %271
  %339 = select i1 %273, i32 %338, i32 0
  %340 = lshr i32 %337, %275
  %341 = select i1 %277, i32 %340, i32 0
  %342 = or i32 %339, %341
  %343 = add i32 %336, %337
  %344 = xor i32 %343, %342
  %345 = add i32 %344, %239
  %346 = call i32 @fused_slice_1_broadcast_3122_20_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %347 = add i32 %345, %346
  %348 = shl i32 %347, %196
  %349 = select i1 %198, i32 %348, i32 0
  %350 = lshr i32 %347, %200
  %351 = select i1 %202, i32 %350, i32 0
  %352 = or i32 %349, %351
  %353 = add i32 %343, %194
  %354 = add i32 %353, %347
  %355 = xor i32 %354, %352
  %356 = shl i32 %355, %210
  %357 = select i1 %212, i32 %356, i32 0
  %358 = lshr i32 %355, %214
  %359 = select i1 %216, i32 %358, i32 0
  %360 = or i32 %357, %359
  %361 = add i32 %354, %355
  %362 = xor i32 %361, %360
  %363 = shl i32 %362, %221
  %364 = select i1 %223, i32 %363, i32 0
  %365 = lshr i32 %362, %225
  %366 = select i1 %227, i32 %365, i32 0
  %367 = or i32 %364, %366
  %368 = add i32 %361, %362
  %369 = xor i32 %368, %367
  %370 = shl i32 %369, %225
  %371 = select i1 %227, i32 %370, i32 0
  %372 = lshr i32 %369, %221
  %373 = select i1 %223, i32 %372, i32 0
  %374 = or i32 %371, %373
  %375 = add i32 %368, %369
  %376 = xor i32 %375, %374
  %377 = add i32 %376, %206
  %378 = call i32 @fused_slice_1_broadcast_3123_3_clone_1(ptr %0, ptr %1, i32 1, i32 %10)
  %379 = add i32 %377, %378
  br label %380

380:                                              ; preds = %12, %192
  %381 = phi i32 [ %379, %192 ], [ %191, %12 ]
  br label %382

382:                                              ; preds = %380
  %383 = mul i32 %5, 64
  %384 = udiv i32 %6, 2
  %385 = add i32 %383, %384
  %386 = urem i32 %10, 2
  %387 = icmp ult i32 %386, 1
  br i1 %387, label %388, label %568

388:                                              ; preds = %382
  %389 = call i32 @fused_slice_1_broadcast_3080_106(ptr %0, ptr %1, i32 1, i32 %385)
  %390 = call i32 @fused_slice_1_broadcast_3134_27_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %391 = add i32 %389, %390
  %392 = call i32 @fused_slice_1_broadcast_3104_554_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %393 = call i32 @fused_slice_1_broadcast_3135_41_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %394 = add i32 %392, %393
  %395 = add i32 %391, %394
  %396 = call i32 @fused_slice_1_broadcast_3106_278_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %397 = shl i32 %394, %396
  %398 = icmp ult i32 %396, 32
  %399 = select i1 %398, i32 %397, i32 0
  %400 = call i32 @fused_slice_1_broadcast_3107_278_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %401 = lshr i32 %394, %400
  %402 = icmp ult i32 %400, 32
  %403 = select i1 %402, i32 %401, i32 0
  %404 = or i32 %399, %403
  %405 = xor i32 %395, %404
  %406 = add i32 %395, %405
  %407 = call i32 @fused_slice_1_broadcast_3108_478_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %408 = shl i32 %405, %407
  %409 = icmp ult i32 %407, 32
  %410 = select i1 %409, i32 %408, i32 0
  %411 = call i32 @fused_slice_1_broadcast_3110_478_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %412 = lshr i32 %405, %411
  %413 = icmp ult i32 %411, 32
  %414 = select i1 %413, i32 %412, i32 0
  %415 = or i32 %410, %414
  %416 = xor i32 %406, %415
  %417 = add i32 %406, %416
  %418 = call i32 @fused_slice_1_broadcast_3111_604_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %419 = shl i32 %416, %418
  %420 = icmp ult i32 %418, 32
  %421 = select i1 %420, i32 %419, i32 0
  %422 = call i32 @fused_slice_1_broadcast_3112_604_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %423 = lshr i32 %416, %422
  %424 = icmp ult i32 %422, 32
  %425 = select i1 %424, i32 %423, i32 0
  %426 = or i32 %421, %425
  %427 = xor i32 %417, %426
  %428 = add i32 %417, %427
  %429 = add i32 %428, %393
  %430 = shl i32 %427, %422
  %431 = select i1 %424, i32 %430, i32 0
  %432 = lshr i32 %427, %418
  %433 = select i1 %420, i32 %432, i32 0
  %434 = or i32 %431, %433
  %435 = xor i32 %428, %434
  %436 = call i32 @fused_slice_1_broadcast_3136_23_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %437 = add i32 %435, %436
  %438 = call i32 @fused_slice_1_broadcast_3115_112_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %439 = add i32 %437, %438
  %440 = add i32 %429, %439
  %441 = shl i32 %439, %411
  %442 = select i1 %413, i32 %441, i32 0
  %443 = lshr i32 %439, %407
  %444 = select i1 %409, i32 %443, i32 0
  %445 = or i32 %442, %444
  %446 = xor i32 %440, %445
  %447 = add i32 %440, %446
  %448 = call i32 @fused_slice_1_broadcast_3116_128_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %449 = shl i32 %446, %448
  %450 = icmp ult i32 %448, 32
  %451 = select i1 %450, i32 %449, i32 0
  %452 = call i32 @fused_slice_1_broadcast_3117_182_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %453 = lshr i32 %446, %452
  %454 = icmp ult i32 %452, 32
  %455 = select i1 %454, i32 %453, i32 0
  %456 = or i32 %451, %455
  %457 = xor i32 %447, %456
  %458 = add i32 %447, %457
  %459 = call i32 @fused_slice_1_broadcast_3118_256_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %460 = shl i32 %457, %459
  %461 = icmp ult i32 %459, 32
  %462 = select i1 %461, i32 %460, i32 0
  %463 = lshr i32 %457, %459
  %464 = select i1 %461, i32 %463, i32 0
  %465 = or i32 %462, %464
  %466 = xor i32 %458, %465
  %467 = add i32 %458, %466
  %468 = add i32 %467, %436
  %469 = call i32 @fused_slice_1_broadcast_3119_144_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %470 = shl i32 %466, %469
  %471 = icmp ult i32 %469, 32
  %472 = select i1 %471, i32 %470, i32 0
  %473 = call i32 @fused_slice_1_broadcast_3120_144_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %474 = lshr i32 %466, %473
  %475 = icmp ult i32 %473, 32
  %476 = select i1 %475, i32 %474, i32 0
  %477 = or i32 %472, %476
  %478 = xor i32 %467, %477
  %479 = add i32 %478, %390
  %480 = call i32 @fused_slice_1_broadcast_3121_54_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %481 = add i32 %479, %480
  %482 = add i32 %468, %481
  %483 = shl i32 %481, %396
  %484 = select i1 %398, i32 %483, i32 0
  %485 = lshr i32 %481, %400
  %486 = select i1 %402, i32 %485, i32 0
  %487 = or i32 %484, %486
  %488 = xor i32 %482, %487
  %489 = add i32 %482, %488
  %490 = shl i32 %488, %407
  %491 = select i1 %409, i32 %490, i32 0
  %492 = lshr i32 %488, %411
  %493 = select i1 %413, i32 %492, i32 0
  %494 = or i32 %491, %493
  %495 = xor i32 %489, %494
  %496 = add i32 %489, %495
  %497 = shl i32 %495, %418
  %498 = select i1 %420, i32 %497, i32 0
  %499 = lshr i32 %495, %422
  %500 = select i1 %424, i32 %499, i32 0
  %501 = or i32 %498, %500
  %502 = xor i32 %496, %501
  %503 = add i32 %496, %502
  %504 = add i32 %503, %390
  %505 = shl i32 %502, %422
  %506 = select i1 %424, i32 %505, i32 0
  %507 = lshr i32 %502, %418
  %508 = select i1 %420, i32 %507, i32 0
  %509 = or i32 %506, %508
  %510 = xor i32 %503, %509
  %511 = add i32 %510, %393
  %512 = add i32 %511, %452
  %513 = add i32 %504, %512
  %514 = shl i32 %512, %411
  %515 = select i1 %413, i32 %514, i32 0
  %516 = lshr i32 %512, %407
  %517 = select i1 %409, i32 %516, i32 0
  %518 = or i32 %515, %517
  %519 = xor i32 %513, %518
  %520 = add i32 %513, %519
  %521 = shl i32 %519, %448
  %522 = select i1 %450, i32 %521, i32 0
  %523 = lshr i32 %519, %452
  %524 = select i1 %454, i32 %523, i32 0
  %525 = or i32 %522, %524
  %526 = xor i32 %520, %525
  %527 = add i32 %520, %526
  %528 = shl i32 %526, %459
  %529 = select i1 %461, i32 %528, i32 0
  %530 = lshr i32 %526, %459
  %531 = select i1 %461, i32 %530, i32 0
  %532 = or i32 %529, %531
  %533 = xor i32 %527, %532
  %534 = add i32 %527, %533
  %535 = add i32 %534, %393
  %536 = shl i32 %533, %469
  %537 = select i1 %471, i32 %536, i32 0
  %538 = lshr i32 %533, %473
  %539 = select i1 %475, i32 %538, i32 0
  %540 = or i32 %537, %539
  %541 = xor i32 %534, %540
  %542 = add i32 %541, %436
  %543 = call i32 @fused_slice_1_broadcast_3122_20_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %544 = add i32 %542, %543
  %545 = add i32 %535, %544
  %546 = shl i32 %544, %396
  %547 = select i1 %398, i32 %546, i32 0
  %548 = lshr i32 %544, %400
  %549 = select i1 %402, i32 %548, i32 0
  %550 = or i32 %547, %549
  %551 = xor i32 %545, %550
  %552 = add i32 %545, %551
  %553 = shl i32 %551, %407
  %554 = select i1 %409, i32 %553, i32 0
  %555 = lshr i32 %551, %411
  %556 = select i1 %413, i32 %555, i32 0
  %557 = or i32 %554, %556
  %558 = xor i32 %552, %557
  %559 = add i32 %552, %558
  %560 = shl i32 %558, %418
  %561 = select i1 %420, i32 %560, i32 0
  %562 = lshr i32 %558, %422
  %563 = select i1 %424, i32 %562, i32 0
  %564 = or i32 %561, %563
  %565 = xor i32 %559, %564
  %566 = add i32 %559, %565
  %567 = add i32 %566, %436
  br label %756

568:                                              ; preds = %382
  %569 = call i32 @fused_slice_1_broadcast_3104_554_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %570 = call i32 @fused_slice_1_broadcast_3135_41_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %571 = add i32 %569, %570
  %572 = call i32 @fused_slice_1_broadcast_3106_278_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %573 = shl i32 %571, %572
  %574 = icmp ult i32 %572, 32
  %575 = select i1 %574, i32 %573, i32 0
  %576 = call i32 @fused_slice_1_broadcast_3107_278_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %577 = lshr i32 %571, %576
  %578 = icmp ult i32 %576, 32
  %579 = select i1 %578, i32 %577, i32 0
  %580 = or i32 %575, %579
  %581 = call i32 @fused_slice_1_broadcast_3080_106(ptr %0, ptr %1, i32 1, i32 %385)
  %582 = call i32 @fused_slice_1_broadcast_3134_27_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %583 = add i32 %581, %582
  %584 = add i32 %583, %571
  %585 = xor i32 %584, %580
  %586 = call i32 @fused_slice_1_broadcast_3108_478_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %587 = shl i32 %585, %586
  %588 = icmp ult i32 %586, 32
  %589 = select i1 %588, i32 %587, i32 0
  %590 = call i32 @fused_slice_1_broadcast_3110_478_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %591 = lshr i32 %585, %590
  %592 = icmp ult i32 %590, 32
  %593 = select i1 %592, i32 %591, i32 0
  %594 = or i32 %589, %593
  %595 = add i32 %584, %585
  %596 = xor i32 %595, %594
  %597 = call i32 @fused_slice_1_broadcast_3111_604_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %598 = shl i32 %596, %597
  %599 = icmp ult i32 %597, 32
  %600 = select i1 %599, i32 %598, i32 0
  %601 = call i32 @fused_slice_1_broadcast_3112_604_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %602 = lshr i32 %596, %601
  %603 = icmp ult i32 %601, 32
  %604 = select i1 %603, i32 %602, i32 0
  %605 = or i32 %600, %604
  %606 = add i32 %595, %596
  %607 = xor i32 %606, %605
  %608 = shl i32 %607, %601
  %609 = select i1 %603, i32 %608, i32 0
  %610 = lshr i32 %607, %597
  %611 = select i1 %599, i32 %610, i32 0
  %612 = or i32 %609, %611
  %613 = add i32 %606, %607
  %614 = xor i32 %613, %612
  %615 = call i32 @fused_slice_1_broadcast_3136_23_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %616 = add i32 %614, %615
  %617 = call i32 @fused_slice_1_broadcast_3115_112_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %618 = add i32 %616, %617
  %619 = shl i32 %618, %590
  %620 = select i1 %592, i32 %619, i32 0
  %621 = lshr i32 %618, %586
  %622 = select i1 %588, i32 %621, i32 0
  %623 = or i32 %620, %622
  %624 = add i32 %613, %570
  %625 = add i32 %624, %618
  %626 = xor i32 %625, %623
  %627 = call i32 @fused_slice_1_broadcast_3116_128_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %628 = shl i32 %626, %627
  %629 = icmp ult i32 %627, 32
  %630 = select i1 %629, i32 %628, i32 0
  %631 = call i32 @fused_slice_1_broadcast_3117_182_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %632 = lshr i32 %626, %631
  %633 = icmp ult i32 %631, 32
  %634 = select i1 %633, i32 %632, i32 0
  %635 = or i32 %630, %634
  %636 = add i32 %625, %626
  %637 = xor i32 %636, %635
  %638 = call i32 @fused_slice_1_broadcast_3118_256_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %639 = shl i32 %637, %638
  %640 = icmp ult i32 %638, 32
  %641 = select i1 %640, i32 %639, i32 0
  %642 = lshr i32 %637, %638
  %643 = select i1 %640, i32 %642, i32 0
  %644 = or i32 %641, %643
  %645 = add i32 %636, %637
  %646 = xor i32 %645, %644
  %647 = call i32 @fused_slice_1_broadcast_3119_144_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %648 = shl i32 %646, %647
  %649 = icmp ult i32 %647, 32
  %650 = select i1 %649, i32 %648, i32 0
  %651 = call i32 @fused_slice_1_broadcast_3120_144_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %652 = lshr i32 %646, %651
  %653 = icmp ult i32 %651, 32
  %654 = select i1 %653, i32 %652, i32 0
  %655 = or i32 %650, %654
  %656 = add i32 %645, %646
  %657 = xor i32 %656, %655
  %658 = add i32 %657, %582
  %659 = call i32 @fused_slice_1_broadcast_3121_54_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %660 = add i32 %658, %659
  %661 = shl i32 %660, %572
  %662 = select i1 %574, i32 %661, i32 0
  %663 = lshr i32 %660, %576
  %664 = select i1 %578, i32 %663, i32 0
  %665 = or i32 %662, %664
  %666 = add i32 %656, %615
  %667 = add i32 %666, %660
  %668 = xor i32 %667, %665
  %669 = shl i32 %668, %586
  %670 = select i1 %588, i32 %669, i32 0
  %671 = lshr i32 %668, %590
  %672 = select i1 %592, i32 %671, i32 0
  %673 = or i32 %670, %672
  %674 = add i32 %667, %668
  %675 = xor i32 %674, %673
  %676 = shl i32 %675, %597
  %677 = select i1 %599, i32 %676, i32 0
  %678 = lshr i32 %675, %601
  %679 = select i1 %603, i32 %678, i32 0
  %680 = or i32 %677, %679
  %681 = add i32 %674, %675
  %682 = xor i32 %681, %680
  %683 = shl i32 %682, %601
  %684 = select i1 %603, i32 %683, i32 0
  %685 = lshr i32 %682, %597
  %686 = select i1 %599, i32 %685, i32 0
  %687 = or i32 %684, %686
  %688 = add i32 %681, %682
  %689 = xor i32 %688, %687
  %690 = add i32 %689, %570
  %691 = add i32 %690, %631
  %692 = shl i32 %691, %590
  %693 = select i1 %592, i32 %692, i32 0
  %694 = lshr i32 %691, %586
  %695 = select i1 %588, i32 %694, i32 0
  %696 = or i32 %693, %695
  %697 = add i32 %688, %582
  %698 = add i32 %697, %691
  %699 = xor i32 %698, %696
  %700 = shl i32 %699, %627
  %701 = select i1 %629, i32 %700, i32 0
  %702 = lshr i32 %699, %631
  %703 = select i1 %633, i32 %702, i32 0
  %704 = or i32 %701, %703
  %705 = add i32 %698, %699
  %706 = xor i32 %705, %704
  %707 = shl i32 %706, %638
  %708 = select i1 %640, i32 %707, i32 0
  %709 = lshr i32 %706, %638
  %710 = select i1 %640, i32 %709, i32 0
  %711 = or i32 %708, %710
  %712 = add i32 %705, %706
  %713 = xor i32 %712, %711
  %714 = shl i32 %713, %647
  %715 = select i1 %649, i32 %714, i32 0
  %716 = lshr i32 %713, %651
  %717 = select i1 %653, i32 %716, i32 0
  %718 = or i32 %715, %717
  %719 = add i32 %712, %713
  %720 = xor i32 %719, %718
  %721 = add i32 %720, %615
  %722 = call i32 @fused_slice_1_broadcast_3122_20_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %723 = add i32 %721, %722
  %724 = shl i32 %723, %572
  %725 = select i1 %574, i32 %724, i32 0
  %726 = lshr i32 %723, %576
  %727 = select i1 %578, i32 %726, i32 0
  %728 = or i32 %725, %727
  %729 = add i32 %719, %570
  %730 = add i32 %729, %723
  %731 = xor i32 %730, %728
  %732 = shl i32 %731, %586
  %733 = select i1 %588, i32 %732, i32 0
  %734 = lshr i32 %731, %590
  %735 = select i1 %592, i32 %734, i32 0
  %736 = or i32 %733, %735
  %737 = add i32 %730, %731
  %738 = xor i32 %737, %736
  %739 = shl i32 %738, %597
  %740 = select i1 %599, i32 %739, i32 0
  %741 = lshr i32 %738, %601
  %742 = select i1 %603, i32 %741, i32 0
  %743 = or i32 %740, %742
  %744 = add i32 %737, %738
  %745 = xor i32 %744, %743
  %746 = shl i32 %745, %601
  %747 = select i1 %603, i32 %746, i32 0
  %748 = lshr i32 %745, %597
  %749 = select i1 %599, i32 %748, i32 0
  %750 = or i32 %747, %749
  %751 = add i32 %744, %745
  %752 = xor i32 %751, %750
  %753 = add i32 %752, %582
  %754 = call i32 @fused_slice_1_broadcast_3123_3_clone_1(ptr %0, ptr %1, i32 1, i32 %385)
  %755 = add i32 %753, %754
  br label %756

756:                                              ; preds = %388, %568
  %757 = phi i32 [ %755, %568 ], [ %567, %388 ]
  br label %758

758:                                              ; preds = %756
  %759 = mul i32 %5, 128
  %760 = add i32 %759, %6
  %761 = getelementptr inbounds i32, ptr %2, i32 %760
  store i32 %381, ptr %761, align 4
  %762 = getelementptr inbounds i32, ptr %3, i32 %760
  store i32 %757, ptr %762, align 4
  ret void
}

define internal i32 @fused_slice_1_broadcast_3080_106(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = sext i32 %2 to i64
  %6 = lshr i64 %5, 32
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

define internal i32 @fused_slice_1_broadcast_3131_39(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_slice_174_3(ptr %0, ptr %1, i32 0, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_broadcast_3104_554_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 %2
}

define internal i32 @fused_slice_1_broadcast_3132_53(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_slice_175_3(ptr %0, ptr %1, i32 0, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_broadcast_3106_278_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 13
}

define internal i32 @fused_slice_1_broadcast_3107_278_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 19
}

define internal i32 @fused_slice_1_broadcast_3108_478_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 15
}

define internal i32 @fused_slice_1_broadcast_3110_478_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 17
}

define internal i32 @fused_slice_1_broadcast_3111_604_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 26
}

define internal i32 @fused_slice_1_broadcast_3112_604_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 6
}

define internal i32 @fused_slice_1_broadcast_3133_29(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_slice_174_3(ptr %0, ptr %1, i32 0, i32 %3)
  %6 = call i32 @fused_slice_1_slice_175_3(ptr %0, ptr %1, i32 0, i32 %3)
  %7 = xor i32 %5, %6
  %8 = call i32 @fused_slice_1_broadcast_3185_9(ptr %0, ptr %1, i32 0, i32 %3)
  %9 = xor i32 %7, %8
  ret i32 %9
}

define internal i32 @fused_slice_1_broadcast_3115_112_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 1
}

define internal i32 @fused_slice_1_broadcast_3116_128_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 29
}

define internal i32 @fused_slice_1_broadcast_3117_182_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 3
}

define internal i32 @fused_slice_1_broadcast_3118_256_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 16
}

define internal i32 @fused_slice_1_broadcast_3119_144_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 24
}

define internal i32 @fused_slice_1_broadcast_3120_144_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 8
}

define internal i32 @fused_slice_1_broadcast_3121_54_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 2
}

define internal i32 @fused_slice_1_broadcast_3122_20_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 4
}

define internal i32 @fused_slice_1_broadcast_3123_3_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 5
}

define internal i32 @fused_slice_1_broadcast_3134_27_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_slice_180_3_clone_1(ptr %0, ptr %1, i32 0, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_broadcast_3135_41_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_slice_181_3_clone_1(ptr %0, ptr %1, i32 0, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_broadcast_3136_23_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_slice_180_3_clone_1(ptr %0, ptr %1, i32 0, i32 %3)
  %6 = call i32 @fused_slice_1_slice_181_3_clone_1(ptr %0, ptr %1, i32 0, i32 %3)
  %7 = xor i32 %5, %6
  %8 = call i32 @fused_slice_1_broadcast_3185_9(ptr %0, ptr %1, i32 0, i32 %3)
  %9 = xor i32 %7, %8
  ret i32 %9
}

define internal i32 @fused_slice_1_slice_180_3_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_bitcast_2026_4_clone_1(ptr %0, ptr %1, i32 %2, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_slice_181_3_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_bitcast_2026_4_clone_1(ptr %0, ptr %1, i32 1, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_broadcast_3185_9(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 466688986
}

define internal i32 @fused_slice_1_bitcast_2026_4_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_concatenate_138_19(ptr %0, ptr %1, i32 %2, i32 1, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_concatenate_138_19(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4) {
  %6 = icmp ult i32 %2, 1
  br i1 %6, label %7, label %187

7:                                                ; preds = %5
  %8 = call i32 @fused_slice_1_broadcast_3080_106(ptr %0, ptr %1, i32 %3, i32 %4)
  %9 = call i32 @fused_slice_1_broadcast_3128_101_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %10 = add i32 %8, %9
  %11 = call i32 @fused_slice_1_broadcast_3104_554_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %12 = call i32 @fused_slice_1_broadcast_3129_171_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %13 = add i32 %11, %12
  %14 = add i32 %10, %13
  %15 = call i32 @fused_slice_1_broadcast_3106_278_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %16 = shl i32 %13, %15
  %17 = icmp ult i32 %15, 32
  %18 = select i1 %17, i32 %16, i32 0
  %19 = call i32 @fused_slice_1_broadcast_3107_278_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %20 = lshr i32 %13, %19
  %21 = icmp ult i32 %19, 32
  %22 = select i1 %21, i32 %20, i32 0
  %23 = or i32 %18, %22
  %24 = xor i32 %14, %23
  %25 = add i32 %14, %24
  %26 = call i32 @fused_slice_1_broadcast_3108_478_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %27 = shl i32 %24, %26
  %28 = icmp ult i32 %26, 32
  %29 = select i1 %28, i32 %27, i32 0
  %30 = call i32 @fused_slice_1_broadcast_3110_478_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %31 = lshr i32 %24, %30
  %32 = icmp ult i32 %30, 32
  %33 = select i1 %32, i32 %31, i32 0
  %34 = or i32 %29, %33
  %35 = xor i32 %25, %34
  %36 = add i32 %25, %35
  %37 = call i32 @fused_slice_1_broadcast_3111_604_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %38 = shl i32 %35, %37
  %39 = icmp ult i32 %37, 32
  %40 = select i1 %39, i32 %38, i32 0
  %41 = call i32 @fused_slice_1_broadcast_3112_604_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %42 = lshr i32 %35, %41
  %43 = icmp ult i32 %41, 32
  %44 = select i1 %43, i32 %42, i32 0
  %45 = or i32 %40, %44
  %46 = xor i32 %36, %45
  %47 = add i32 %36, %46
  %48 = add i32 %47, %12
  %49 = shl i32 %46, %41
  %50 = select i1 %43, i32 %49, i32 0
  %51 = lshr i32 %46, %37
  %52 = select i1 %39, i32 %51, i32 0
  %53 = or i32 %50, %52
  %54 = xor i32 %47, %53
  %55 = call i32 @fused_slice_1_broadcast_3130_65_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %56 = add i32 %54, %55
  %57 = call i32 @fused_slice_1_broadcast_3115_112_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %58 = add i32 %56, %57
  %59 = add i32 %48, %58
  %60 = shl i32 %58, %30
  %61 = select i1 %32, i32 %60, i32 0
  %62 = lshr i32 %58, %26
  %63 = select i1 %28, i32 %62, i32 0
  %64 = or i32 %61, %63
  %65 = xor i32 %59, %64
  %66 = add i32 %59, %65
  %67 = call i32 @fused_slice_1_broadcast_3116_128_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %68 = shl i32 %65, %67
  %69 = icmp ult i32 %67, 32
  %70 = select i1 %69, i32 %68, i32 0
  %71 = call i32 @fused_slice_1_broadcast_3117_182_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %72 = lshr i32 %65, %71
  %73 = icmp ult i32 %71, 32
  %74 = select i1 %73, i32 %72, i32 0
  %75 = or i32 %70, %74
  %76 = xor i32 %66, %75
  %77 = add i32 %66, %76
  %78 = call i32 @fused_slice_1_broadcast_3118_256_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %79 = shl i32 %76, %78
  %80 = icmp ult i32 %78, 32
  %81 = select i1 %80, i32 %79, i32 0
  %82 = lshr i32 %76, %78
  %83 = select i1 %80, i32 %82, i32 0
  %84 = or i32 %81, %83
  %85 = xor i32 %77, %84
  %86 = add i32 %77, %85
  %87 = add i32 %86, %55
  %88 = call i32 @fused_slice_1_broadcast_3119_144_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %89 = shl i32 %85, %88
  %90 = icmp ult i32 %88, 32
  %91 = select i1 %90, i32 %89, i32 0
  %92 = call i32 @fused_slice_1_broadcast_3120_144_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %93 = lshr i32 %85, %92
  %94 = icmp ult i32 %92, 32
  %95 = select i1 %94, i32 %93, i32 0
  %96 = or i32 %91, %95
  %97 = xor i32 %86, %96
  %98 = add i32 %97, %9
  %99 = call i32 @fused_slice_1_broadcast_3121_54_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %100 = add i32 %98, %99
  %101 = add i32 %87, %100
  %102 = shl i32 %100, %15
  %103 = select i1 %17, i32 %102, i32 0
  %104 = lshr i32 %100, %19
  %105 = select i1 %21, i32 %104, i32 0
  %106 = or i32 %103, %105
  %107 = xor i32 %101, %106
  %108 = add i32 %101, %107
  %109 = shl i32 %107, %26
  %110 = select i1 %28, i32 %109, i32 0
  %111 = lshr i32 %107, %30
  %112 = select i1 %32, i32 %111, i32 0
  %113 = or i32 %110, %112
  %114 = xor i32 %108, %113
  %115 = add i32 %108, %114
  %116 = shl i32 %114, %37
  %117 = select i1 %39, i32 %116, i32 0
  %118 = lshr i32 %114, %41
  %119 = select i1 %43, i32 %118, i32 0
  %120 = or i32 %117, %119
  %121 = xor i32 %115, %120
  %122 = add i32 %115, %121
  %123 = add i32 %122, %9
  %124 = shl i32 %121, %41
  %125 = select i1 %43, i32 %124, i32 0
  %126 = lshr i32 %121, %37
  %127 = select i1 %39, i32 %126, i32 0
  %128 = or i32 %125, %127
  %129 = xor i32 %122, %128
  %130 = add i32 %129, %12
  %131 = add i32 %130, %71
  %132 = add i32 %123, %131
  %133 = shl i32 %131, %30
  %134 = select i1 %32, i32 %133, i32 0
  %135 = lshr i32 %131, %26
  %136 = select i1 %28, i32 %135, i32 0
  %137 = or i32 %134, %136
  %138 = xor i32 %132, %137
  %139 = add i32 %132, %138
  %140 = shl i32 %138, %67
  %141 = select i1 %69, i32 %140, i32 0
  %142 = lshr i32 %138, %71
  %143 = select i1 %73, i32 %142, i32 0
  %144 = or i32 %141, %143
  %145 = xor i32 %139, %144
  %146 = add i32 %139, %145
  %147 = shl i32 %145, %78
  %148 = select i1 %80, i32 %147, i32 0
  %149 = lshr i32 %145, %78
  %150 = select i1 %80, i32 %149, i32 0
  %151 = or i32 %148, %150
  %152 = xor i32 %146, %151
  %153 = add i32 %146, %152
  %154 = add i32 %153, %12
  %155 = shl i32 %152, %88
  %156 = select i1 %90, i32 %155, i32 0
  %157 = lshr i32 %152, %92
  %158 = select i1 %94, i32 %157, i32 0
  %159 = or i32 %156, %158
  %160 = xor i32 %153, %159
  %161 = add i32 %160, %55
  %162 = call i32 @fused_slice_1_broadcast_3122_20_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %163 = add i32 %161, %162
  %164 = add i32 %154, %163
  %165 = shl i32 %163, %15
  %166 = select i1 %17, i32 %165, i32 0
  %167 = lshr i32 %163, %19
  %168 = select i1 %21, i32 %167, i32 0
  %169 = or i32 %166, %168
  %170 = xor i32 %164, %169
  %171 = add i32 %164, %170
  %172 = shl i32 %170, %26
  %173 = select i1 %28, i32 %172, i32 0
  %174 = lshr i32 %170, %30
  %175 = select i1 %32, i32 %174, i32 0
  %176 = or i32 %173, %175
  %177 = xor i32 %171, %176
  %178 = add i32 %171, %177
  %179 = shl i32 %177, %37
  %180 = select i1 %39, i32 %179, i32 0
  %181 = lshr i32 %177, %41
  %182 = select i1 %43, i32 %181, i32 0
  %183 = or i32 %180, %182
  %184 = xor i32 %178, %183
  %185 = add i32 %178, %184
  %186 = add i32 %185, %55
  br label %375

187:                                              ; preds = %5
  %188 = call i32 @fused_slice_1_broadcast_3104_554_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %189 = call i32 @fused_slice_1_broadcast_3129_171_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %190 = add i32 %188, %189
  %191 = call i32 @fused_slice_1_broadcast_3106_278_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %192 = shl i32 %190, %191
  %193 = icmp ult i32 %191, 32
  %194 = select i1 %193, i32 %192, i32 0
  %195 = call i32 @fused_slice_1_broadcast_3107_278_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %196 = lshr i32 %190, %195
  %197 = icmp ult i32 %195, 32
  %198 = select i1 %197, i32 %196, i32 0
  %199 = or i32 %194, %198
  %200 = call i32 @fused_slice_1_broadcast_3080_106(ptr %0, ptr %1, i32 %3, i32 %4)
  %201 = call i32 @fused_slice_1_broadcast_3128_101_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %202 = add i32 %200, %201
  %203 = add i32 %202, %190
  %204 = xor i32 %203, %199
  %205 = call i32 @fused_slice_1_broadcast_3108_478_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %206 = shl i32 %204, %205
  %207 = icmp ult i32 %205, 32
  %208 = select i1 %207, i32 %206, i32 0
  %209 = call i32 @fused_slice_1_broadcast_3110_478_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %210 = lshr i32 %204, %209
  %211 = icmp ult i32 %209, 32
  %212 = select i1 %211, i32 %210, i32 0
  %213 = or i32 %208, %212
  %214 = add i32 %203, %204
  %215 = xor i32 %214, %213
  %216 = call i32 @fused_slice_1_broadcast_3111_604_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %217 = shl i32 %215, %216
  %218 = icmp ult i32 %216, 32
  %219 = select i1 %218, i32 %217, i32 0
  %220 = call i32 @fused_slice_1_broadcast_3112_604_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
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
  %234 = call i32 @fused_slice_1_broadcast_3130_65_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %235 = add i32 %233, %234
  %236 = call i32 @fused_slice_1_broadcast_3115_112_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %237 = add i32 %235, %236
  %238 = shl i32 %237, %209
  %239 = select i1 %211, i32 %238, i32 0
  %240 = lshr i32 %237, %205
  %241 = select i1 %207, i32 %240, i32 0
  %242 = or i32 %239, %241
  %243 = add i32 %232, %189
  %244 = add i32 %243, %237
  %245 = xor i32 %244, %242
  %246 = call i32 @fused_slice_1_broadcast_3116_128_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %247 = shl i32 %245, %246
  %248 = icmp ult i32 %246, 32
  %249 = select i1 %248, i32 %247, i32 0
  %250 = call i32 @fused_slice_1_broadcast_3117_182_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %251 = lshr i32 %245, %250
  %252 = icmp ult i32 %250, 32
  %253 = select i1 %252, i32 %251, i32 0
  %254 = or i32 %249, %253
  %255 = add i32 %244, %245
  %256 = xor i32 %255, %254
  %257 = call i32 @fused_slice_1_broadcast_3118_256_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %258 = shl i32 %256, %257
  %259 = icmp ult i32 %257, 32
  %260 = select i1 %259, i32 %258, i32 0
  %261 = lshr i32 %256, %257
  %262 = select i1 %259, i32 %261, i32 0
  %263 = or i32 %260, %262
  %264 = add i32 %255, %256
  %265 = xor i32 %264, %263
  %266 = call i32 @fused_slice_1_broadcast_3119_144_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %267 = shl i32 %265, %266
  %268 = icmp ult i32 %266, 32
  %269 = select i1 %268, i32 %267, i32 0
  %270 = call i32 @fused_slice_1_broadcast_3120_144_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %271 = lshr i32 %265, %270
  %272 = icmp ult i32 %270, 32
  %273 = select i1 %272, i32 %271, i32 0
  %274 = or i32 %269, %273
  %275 = add i32 %264, %265
  %276 = xor i32 %275, %274
  %277 = add i32 %276, %201
  %278 = call i32 @fused_slice_1_broadcast_3121_54_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %279 = add i32 %277, %278
  %280 = shl i32 %279, %191
  %281 = select i1 %193, i32 %280, i32 0
  %282 = lshr i32 %279, %195
  %283 = select i1 %197, i32 %282, i32 0
  %284 = or i32 %281, %283
  %285 = add i32 %275, %234
  %286 = add i32 %285, %279
  %287 = xor i32 %286, %284
  %288 = shl i32 %287, %205
  %289 = select i1 %207, i32 %288, i32 0
  %290 = lshr i32 %287, %209
  %291 = select i1 %211, i32 %290, i32 0
  %292 = or i32 %289, %291
  %293 = add i32 %286, %287
  %294 = xor i32 %293, %292
  %295 = shl i32 %294, %216
  %296 = select i1 %218, i32 %295, i32 0
  %297 = lshr i32 %294, %220
  %298 = select i1 %222, i32 %297, i32 0
  %299 = or i32 %296, %298
  %300 = add i32 %293, %294
  %301 = xor i32 %300, %299
  %302 = shl i32 %301, %220
  %303 = select i1 %222, i32 %302, i32 0
  %304 = lshr i32 %301, %216
  %305 = select i1 %218, i32 %304, i32 0
  %306 = or i32 %303, %305
  %307 = add i32 %300, %301
  %308 = xor i32 %307, %306
  %309 = add i32 %308, %189
  %310 = add i32 %309, %250
  %311 = shl i32 %310, %209
  %312 = select i1 %211, i32 %311, i32 0
  %313 = lshr i32 %310, %205
  %314 = select i1 %207, i32 %313, i32 0
  %315 = or i32 %312, %314
  %316 = add i32 %307, %201
  %317 = add i32 %316, %310
  %318 = xor i32 %317, %315
  %319 = shl i32 %318, %246
  %320 = select i1 %248, i32 %319, i32 0
  %321 = lshr i32 %318, %250
  %322 = select i1 %252, i32 %321, i32 0
  %323 = or i32 %320, %322
  %324 = add i32 %317, %318
  %325 = xor i32 %324, %323
  %326 = shl i32 %325, %257
  %327 = select i1 %259, i32 %326, i32 0
  %328 = lshr i32 %325, %257
  %329 = select i1 %259, i32 %328, i32 0
  %330 = or i32 %327, %329
  %331 = add i32 %324, %325
  %332 = xor i32 %331, %330
  %333 = shl i32 %332, %266
  %334 = select i1 %268, i32 %333, i32 0
  %335 = lshr i32 %332, %270
  %336 = select i1 %272, i32 %335, i32 0
  %337 = or i32 %334, %336
  %338 = add i32 %331, %332
  %339 = xor i32 %338, %337
  %340 = add i32 %339, %234
  %341 = call i32 @fused_slice_1_broadcast_3122_20_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %342 = add i32 %340, %341
  %343 = shl i32 %342, %191
  %344 = select i1 %193, i32 %343, i32 0
  %345 = lshr i32 %342, %195
  %346 = select i1 %197, i32 %345, i32 0
  %347 = or i32 %344, %346
  %348 = add i32 %338, %189
  %349 = add i32 %348, %342
  %350 = xor i32 %349, %347
  %351 = shl i32 %350, %205
  %352 = select i1 %207, i32 %351, i32 0
  %353 = lshr i32 %350, %209
  %354 = select i1 %211, i32 %353, i32 0
  %355 = or i32 %352, %354
  %356 = add i32 %349, %350
  %357 = xor i32 %356, %355
  %358 = shl i32 %357, %216
  %359 = select i1 %218, i32 %358, i32 0
  %360 = lshr i32 %357, %220
  %361 = select i1 %222, i32 %360, i32 0
  %362 = or i32 %359, %361
  %363 = add i32 %356, %357
  %364 = xor i32 %363, %362
  %365 = shl i32 %364, %220
  %366 = select i1 %222, i32 %365, i32 0
  %367 = lshr i32 %364, %216
  %368 = select i1 %218, i32 %367, i32 0
  %369 = or i32 %366, %368
  %370 = add i32 %363, %364
  %371 = xor i32 %370, %369
  %372 = add i32 %371, %201
  %373 = call i32 @fused_slice_1_broadcast_3123_3_clone_1(ptr %0, ptr %1, i32 %3, i32 %4)
  %374 = add i32 %372, %373
  br label %375

375:                                              ; preds = %7, %187
  %376 = phi i32 [ %374, %187 ], [ %186, %7 ]
  br label %377

377:                                              ; preds = %375
  ret i32 %376
}

define internal i32 @fused_slice_1_broadcast_3128_101_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = getelementptr inbounds i32, ptr %0, i32 %3
  %6 = load i32, ptr %5, align 4, !invariant.load !3
  ret i32 %6
}

define internal i32 @fused_slice_1_broadcast_3129_171_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = getelementptr inbounds i32, ptr %1, i32 %3
  %6 = load i32, ptr %5, align 4, !invariant.load !3
  ret i32 %6
}

define internal i32 @fused_slice_1_broadcast_3130_65_clone_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = getelementptr inbounds i32, ptr %0, i32 %3
  %6 = load i32, ptr %5, align 4, !invariant.load !3
  %7 = getelementptr inbounds i32, ptr %1, i32 %3
  %8 = load i32, ptr %7, align 4, !invariant.load !3
  %9 = xor i32 %6, %8
  %10 = xor i32 %9, 466688986
  ret i32 %10
}

define internal i32 @fused_slice_1_slice_174_3(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_bitcast_1649_4(ptr %0, ptr %1, i32 %2, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_slice_175_3(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_bitcast_1649_4(ptr %0, ptr %1, i32 1, i32 %3)
  ret i32 %5
}

define internal i32 @fused_slice_1_bitcast_1649_4(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  %5 = call i32 @fused_slice_1_concatenate_138_19(ptr %0, ptr %1, i32 %2, i32 0, i32 %3)
  ret i32 %5
}

define ptx_kernel void @loop_xor_fusion_1(ptr noalias align 256 dereferenceable(32768) %0, ptr noalias align 256 dereferenceable(180224) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %3, 128
  %6 = add i32 %5, %4
  %7 = udiv i32 %6, 11
  %8 = urem i32 %6, 11
  %9 = sext i32 %8 to i64
  %10 = lshr i64 %9, 32
  %11 = trunc i64 %10 to i32
  %12 = add i32 %7, 4096
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

define ptx_kernel void @wrapped_iota_1(ptr noalias align 256 dereferenceable(180224) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %2, 128
  %5 = add i32 %4, %3
  %6 = urem i32 %5, 11
  %7 = getelementptr inbounds i32, ptr %0, i32 %5
  store i32 %6, ptr %7, align 4
  ret void
}

define ptx_kernel void @sort_4_0(ptr noalias align 256 dereferenceable(180224) %arg0, ptr noalias align 256 dereferenceable(180224) %arg1, ptr noalias align 256 dereferenceable(180224) %arg2) #2 {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %block_id = zext i32 %0 to i64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
  %thread_id_x = zext i32 %1 to i64
  %2 = mul nuw nsw i64 %block_id, 8
  %linear_index = add nuw nsw i64 %2, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %3 = udiv i64 %linear_index0, 1
  %4 = urem i64 %3, 8
  %5 = udiv i64 %linear_index0, 8
  %6 = icmp ult i64 %linear_index, 32768
  br i1 %6, label %sort.4.0.in_bounds-true, label %sort.4.0.in_bounds-after

sort.4.0.in_bounds-after:                         ; preds = %smaller_keys_index-after159, %entry
  ret void

sort.4.0.in_bounds-true:                          ; preds = %entry
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
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
  %41 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %8
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
  %47 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %44
  %48 = load i32, ptr %47, align 4
  %49 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_0, i64 0, i64 %46
  store i32 %48, ptr addrspace(3) %49, align 4
  br label %inner_smaller_keys_index-after

smaller_keys_index-true1:                         ; preds = %smaller_keys_index-after
  %50 = shl i64 %thread.id.x, 1
  %51 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %10
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
  %57 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %54
  %58 = load i32, ptr %57, align 4
  %59 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %56
  store i32 %58, ptr addrspace(3) %59, align 4
  br label %inner_smaller_keys_index-after4

smaller_keys_index-true5:                         ; preds = %smaller_keys_index-after2
  %60 = shl i64 %thread.id.x, 1
  %61 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %12
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
  %67 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %64
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %80, ptr %82, ptr %84, ptr %86, ptr %88, ptr %90, ptr %compare_return_buffer)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %105, ptr %107, ptr %109, ptr %111, ptr %113, ptr %115, ptr %compare_return_buffer11)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %145, ptr %147, ptr %149, ptr %151, ptr %153, ptr %155, ptr %compare_return_buffer20)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %170, ptr %172, ptr %174, ptr %176, ptr %178, ptr %180, ptr %compare_return_buffer26)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %204, ptr %206, ptr %208, ptr %210, ptr %212, ptr %214, ptr %compare_return_buffer35)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %229, ptr %231, ptr %233, ptr %235, ptr %237, ptr %239, ptr %compare_return_buffer41)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %269, ptr %271, ptr %273, ptr %275, ptr %277, ptr %279, ptr %compare_return_buffer50)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %294, ptr %296, ptr %298, ptr %300, ptr %302, ptr %304, ptr %compare_return_buffer56)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %334, ptr %336, ptr %338, ptr %340, ptr %342, ptr %344, ptr %compare_return_buffer65)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %359, ptr %361, ptr %363, ptr %365, ptr %367, ptr %369, ptr %compare_return_buffer71)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %393, ptr %395, ptr %397, ptr %399, ptr %401, ptr %403, ptr %compare_return_buffer80)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %418, ptr %420, ptr %422, ptr %424, ptr %426, ptr %428, ptr %compare_return_buffer86)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %450, ptr %452, ptr %454, ptr %456, ptr %458, ptr %460, ptr %compare_return_buffer95)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %475, ptr %477, ptr %479, ptr %481, ptr %483, ptr %485, ptr %compare_return_buffer101)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %515, ptr %517, ptr %519, ptr %521, ptr %523, ptr %525, ptr %compare_return_buffer110)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %540, ptr %542, ptr %544, ptr %546, ptr %548, ptr %550, ptr %compare_return_buffer116)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %580, ptr %582, ptr %584, ptr %586, ptr %588, ptr %590, ptr %compare_return_buffer125)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %605, ptr %607, ptr %609, ptr %611, ptr %613, ptr %615, ptr %compare_return_buffer131)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %639, ptr %641, ptr %643, ptr %645, ptr %647, ptr %649, ptr %compare_return_buffer140)
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
  call void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr %664, ptr %666, ptr %668, ptr %670, ptr %672, ptr %674, ptr %compare_return_buffer146)
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
  %691 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %34
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
  %697 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %692
  store i32 %696, ptr %697, align 4
  br label %inner_smaller_keys_index-after153

smaller_keys_index-true154:                       ; preds = %smaller_keys_index-after151
  %698 = shl i64 %thread.id.x, 1
  %699 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_1, i64 0, i64 %698
  %700 = load i32, ptr addrspace(3) %699, align 4
  %701 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %36
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
  %707 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %702
  store i32 %706, ptr %707, align 4
  br label %inner_smaller_keys_index-after157

smaller_keys_index-true158:                       ; preds = %smaller_keys_index-after155
  %708 = shl i64 %thread.id.x, 1
  %709 = getelementptr [64 x i32], ptr addrspace(3) @sort.4.0_tile_param_2, i64 0, i64 %708
  %710 = load i32, ptr addrspace(3) %709, align 4
  %711 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %38
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
  %717 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %712
  store i32 %716, ptr %717, align 4
  br label %inner_smaller_keys_index-after161
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #3

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier.cta.sync.aligned.all(i32) #4

define internal void @region_0_1446_clone_1_55fe9cfa7a90_ce7a9f89152ffc26(ptr dereferenceable(4) %0, ptr dereferenceable(4) %1, ptr dereferenceable(4) %2, ptr dereferenceable(4) %3, ptr dereferenceable(4) %4, ptr dereferenceable(4) %5, ptr dereferenceable(1) %output_arg) {
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

define ptx_kernel void @loop_xor_fusion(ptr noalias align 256 dereferenceable(32768) %0, ptr noalias align 256 dereferenceable(180224) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !7
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

define ptx_kernel void @sort_5_0(ptr noalias align 256 dereferenceable(180224) %arg0, ptr noalias align 256 dereferenceable(180224) %arg1, ptr noalias align 256 dereferenceable(180224) %arg2) #2 {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %block_id = zext i32 %0 to i64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
  %thread_id_x = zext i32 %1 to i64
  %2 = mul nuw nsw i64 %block_id, 8
  %linear_index = add nuw nsw i64 %2, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 32768
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %3 = udiv i64 %linear_index0, 1
  %4 = urem i64 %3, 8
  %5 = udiv i64 %linear_index0, 8
  %6 = icmp ult i64 %linear_index, 32768
  br i1 %6, label %sort.5.0.in_bounds-true, label %sort.5.0.in_bounds-after

sort.5.0.in_bounds-after:                         ; preds = %smaller_keys_index-after159, %entry
  ret void

sort.5.0.in_bounds-true:                          ; preds = %entry
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !9
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
  %41 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %8
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
  %47 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %44
  %48 = load i32, ptr %47, align 4
  %49 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_0, i64 0, i64 %46
  store i32 %48, ptr addrspace(3) %49, align 4
  br label %inner_smaller_keys_index-after

smaller_keys_index-true1:                         ; preds = %smaller_keys_index-after
  %50 = shl i64 %thread.id.x, 1
  %51 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %10
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
  %57 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %54
  %58 = load i32, ptr %57, align 4
  %59 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %56
  store i32 %58, ptr addrspace(3) %59, align 4
  br label %inner_smaller_keys_index-after4

smaller_keys_index-true5:                         ; preds = %smaller_keys_index-after2
  %60 = shl i64 %thread.id.x, 1
  %61 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %12
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
  %67 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %64
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %80, ptr %82, ptr %84, ptr %86, ptr %88, ptr %90, ptr %compare_return_buffer)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %105, ptr %107, ptr %109, ptr %111, ptr %113, ptr %115, ptr %compare_return_buffer11)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %145, ptr %147, ptr %149, ptr %151, ptr %153, ptr %155, ptr %compare_return_buffer20)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %170, ptr %172, ptr %174, ptr %176, ptr %178, ptr %180, ptr %compare_return_buffer26)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %204, ptr %206, ptr %208, ptr %210, ptr %212, ptr %214, ptr %compare_return_buffer35)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %229, ptr %231, ptr %233, ptr %235, ptr %237, ptr %239, ptr %compare_return_buffer41)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %269, ptr %271, ptr %273, ptr %275, ptr %277, ptr %279, ptr %compare_return_buffer50)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %294, ptr %296, ptr %298, ptr %300, ptr %302, ptr %304, ptr %compare_return_buffer56)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %334, ptr %336, ptr %338, ptr %340, ptr %342, ptr %344, ptr %compare_return_buffer65)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %359, ptr %361, ptr %363, ptr %365, ptr %367, ptr %369, ptr %compare_return_buffer71)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %393, ptr %395, ptr %397, ptr %399, ptr %401, ptr %403, ptr %compare_return_buffer80)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %418, ptr %420, ptr %422, ptr %424, ptr %426, ptr %428, ptr %compare_return_buffer86)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %450, ptr %452, ptr %454, ptr %456, ptr %458, ptr %460, ptr %compare_return_buffer95)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %475, ptr %477, ptr %479, ptr %481, ptr %483, ptr %485, ptr %compare_return_buffer101)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %515, ptr %517, ptr %519, ptr %521, ptr %523, ptr %525, ptr %compare_return_buffer110)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %540, ptr %542, ptr %544, ptr %546, ptr %548, ptr %550, ptr %compare_return_buffer116)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %580, ptr %582, ptr %584, ptr %586, ptr %588, ptr %590, ptr %compare_return_buffer125)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %605, ptr %607, ptr %609, ptr %611, ptr %613, ptr %615, ptr %compare_return_buffer131)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %639, ptr %641, ptr %643, ptr %645, ptr %647, ptr %649, ptr %compare_return_buffer140)
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
  call void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr %664, ptr %666, ptr %668, ptr %670, ptr %672, ptr %674, ptr %compare_return_buffer146)
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
  %691 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %34
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
  %697 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg0, i64 0, i64 %5, i64 %692
  store i32 %696, ptr %697, align 4
  br label %inner_smaller_keys_index-after153

smaller_keys_index-true154:                       ; preds = %smaller_keys_index-after151
  %698 = shl i64 %thread.id.x, 1
  %699 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_1, i64 0, i64 %698
  %700 = load i32, ptr addrspace(3) %699, align 4
  %701 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %36
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
  %707 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg1, i64 0, i64 %5, i64 %702
  store i32 %706, ptr %707, align 4
  br label %inner_smaller_keys_index-after157

smaller_keys_index-true158:                       ; preds = %smaller_keys_index-after155
  %708 = shl i64 %thread.id.x, 1
  %709 = getelementptr [64 x i32], ptr addrspace(3) @sort.5.0_tile_param_2, i64 0, i64 %708
  %710 = load i32, ptr addrspace(3) %709, align 4
  %711 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %38
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
  %717 = getelementptr inbounds [4096 x [11 x i32]], ptr %arg2, i64 0, i64 %5, i64 %712
  store i32 %716, ptr %717, align 4
  br label %inner_smaller_keys_index-after161
}

define internal void @region_0_1446_clone_1_clone_55fe9c0c8ad0_ce7a9f89152ffc26(ptr dereferenceable(4) %0, ptr dereferenceable(4) %1, ptr dereferenceable(4) %2, ptr dereferenceable(4) %3, ptr dereferenceable(4) %4, ptr dereferenceable(4) %5, ptr dereferenceable(1) %output_arg) {
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

define ptx_kernel void @input_concatenate_fusion_1(ptr noalias align 256 dereferenceable(180224) %0, ptr noalias align 256 dereferenceable(180224) %1, ptr noalias align 256 dereferenceable(229376) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !10
  %6 = mul i32 %5, 128
  %7 = add i32 %6, %4
  %8 = udiv i32 %7, 7
  %9 = urem i32 %7, 7
  %10 = mul i32 %8, 11
  %11 = add i32 %10, %9
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = call i32 @fused_concatenate_1_broadcast_123_6(ptr %0, ptr %1, i32 %8, i32 %9)
  %15 = mul i32 %13, %14
  %16 = add i32 %15, 1
  %17 = call i32 @fused_concatenate_1__epilogue__concatenate_1460_1(ptr %0, ptr %1, i32 %8, i32 %9, i32 %16)
  %18 = mul i32 %8, 14
  %19 = add i32 %18, %9
  %20 = getelementptr inbounds i32, ptr %2, i32 %19
  store i32 %17, ptr %20, align 4
  %21 = add i32 %9, 7
  %22 = getelementptr inbounds i32, ptr %0, i32 %11
  %23 = load i32, ptr %22, align 4, !invariant.load !3
  %24 = call i32 @fused_concatenate_1_broadcast_123_6(ptr %0, ptr %1, i32 %8, i32 %9)
  %25 = mul i32 %23, %24
  %26 = add i32 %25, 13
  %27 = call i32 @fused_concatenate_1__epilogue__concatenate_1460_1(ptr %0, ptr %1, i32 %8, i32 %21, i32 %26)
  %28 = add i32 %19, 7
  %29 = getelementptr inbounds i32, ptr %2, i32 %28
  store i32 %27, ptr %29, align 4
  ret void
}

define internal i32 @fused_concatenate_1_broadcast_123_6(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3) {
  ret i32 15
}

define internal i32 @fused_concatenate_1__epilogue__concatenate_1460_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4) {
  ret i32 %4
}

define ptx_kernel void @loop_broadcast_fusion_6(ptr noalias align 256 dereferenceable(16384) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %2, 128
  %5 = add i32 %4, %3
  %6 = getelementptr inbounds i32, ptr %0, i32 %5
  store i32 0, ptr %6, align 4
  ret void
}

define ptx_kernel void @loop_and_broadcast_clamp_compare_convert_maximum_select_slice_fusion(ptr noalias align 256 dereferenceable(57344) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(16384) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(229376) %4, ptr noalias align 256 dereferenceable(229376) %5, ptr noalias align 256 dereferenceable(16384) %6, ptr noalias align 256 dereferenceable(57344) %7, ptr noalias align 256 dereferenceable(229376) %8, ptr noalias align 256 dereferenceable(229376) %9, ptr noalias align 256 dereferenceable(57344) %10, ptr noalias align 256 dereferenceable(57344) %11, ptr noalias align 256 dereferenceable(57344) %12, ptr noalias align 256 dereferenceable(57344) %13, ptr noalias align 256 dereferenceable(57344) %14, ptr noalias align 256 dereferenceable(57344) %15, ptr noalias align 256 dereferenceable(229376) %16, ptr noalias align 256 dereferenceable(229376) %17, ptr noalias align 256 dereferenceable(229376) %18, ptr noalias align 256 dereferenceable(229376) %19, ptr noalias align 256 dereferenceable(229376) %20, ptr noalias align 256 dereferenceable(229376) %21, ptr noalias align 256 dereferenceable(57344) %22, ptr noalias align 256 dereferenceable(229376) %23, ptr noalias align 256 dereferenceable(229376) %24, ptr noalias align 256 dereferenceable(57344) %25, ptr noalias align 256 dereferenceable(229376) %26, ptr noalias align 256 dereferenceable(57344) %27, ptr noalias align 256 dereferenceable(57344) %28, ptr noalias align 256 dereferenceable(57344) %29, ptr noalias align 256 dereferenceable(229376) %30, ptr noalias align 256 dereferenceable(57344) %31, ptr noalias align 256 dereferenceable(229376) %32, ptr noalias align 256 dereferenceable(229376) %33) #0 {
  %35 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %36 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %37 = mul i32 %35, 128
  %38 = add i32 %37, %36
  %39 = udiv i32 %38, 14
  %40 = urem i32 %38, 14
  %41 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_847_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %40)
  %42 = getelementptr inbounds i32, ptr %1, i32 %39
  %43 = load i32, ptr %42, align 4, !invariant.load !3
  %44 = getelementptr inbounds i32, ptr %2, i32 %39
  %45 = load i32, ptr %44, align 4, !invariant.load !3
  %46 = call i32 @llvm.smax.i32(i32 %43, i32 %45)
  %47 = call i32 @llvm.smin.i32(i32 %46, i32 13)
  %48 = icmp slt i32 %47, %43
  %49 = add i32 %47, 14
  %50 = select i1 %48, i32 %49, i32 %47
  %51 = call i32 @llvm.smin.i32(i32 %50, i32 13)
  %52 = call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_847_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %52)
  %54 = icmp ne i32 %41, %53
  %55 = zext i1 %54 to i8
  %56 = getelementptr inbounds i8, ptr %0, i32 %38
  %57 = load i8, ptr %56, align 1, !invariant.load !3
  %58 = and i8 %57, %55
  %59 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 %40)
  %60 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 0)
  %61 = icmp sgt i32 %60, %59
  %62 = zext i1 %61 to i32
  %63 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 1)
  %64 = icmp sgt i32 %63, %59
  %65 = zext i1 %64 to i32
  %66 = add i32 %62, %65
  %67 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 2)
  %68 = icmp sgt i32 %67, %59
  %69 = zext i1 %68 to i32
  %70 = add i32 %66, %69
  %71 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 3)
  %72 = icmp sgt i32 %71, %59
  %73 = zext i1 %72 to i32
  %74 = add i32 %70, %73
  %75 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 4)
  %76 = icmp sgt i32 %75, %59
  %77 = zext i1 %76 to i32
  %78 = add i32 %74, %77
  %79 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 5)
  %80 = icmp sgt i32 %79, %59
  %81 = zext i1 %80 to i32
  %82 = add i32 %78, %81
  %83 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 6)
  %84 = icmp sgt i32 %83, %59
  %85 = zext i1 %84 to i32
  %86 = add i32 %82, %85
  %87 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 7)
  %88 = icmp sgt i32 %87, %59
  %89 = zext i1 %88 to i32
  %90 = add i32 %86, %89
  %91 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 8)
  %92 = icmp sgt i32 %91, %59
  %93 = zext i1 %92 to i32
  %94 = add i32 %90, %93
  %95 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 9)
  %96 = icmp sgt i32 %95, %59
  %97 = zext i1 %96 to i32
  %98 = add i32 %94, %97
  %99 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 10)
  %100 = icmp sgt i32 %99, %59
  %101 = zext i1 %100 to i32
  %102 = add i32 %98, %101
  %103 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 11)
  %104 = icmp sgt i32 %103, %59
  %105 = zext i1 %104 to i32
  %106 = add i32 %102, %105
  %107 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 12)
  %108 = icmp sgt i32 %107, %59
  %109 = zext i1 %108 to i32
  %110 = add i32 %106, %109
  %111 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 %39, i32 13)
  %112 = icmp sgt i32 %111, %59
  %113 = zext i1 %112 to i32
  %114 = add i32 %110, %113
  %115 = sitofp i32 %114 to float
  %116 = fmul float %115, 0x3FB24924A0000000
  %117 = call float @llvm.maximum.f32(float %116, float 0.000000e+00)
  %118 = call float @llvm.minimum.f32(float %117, float 1.000000e+00)
  %119 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 15, i32 %39, i32 %40)
  %120 = fcmp ogt float %119, 0.000000e+00
  %121 = zext i1 %120 to i8
  %122 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 14, i32 %39, i32 %40)
  %123 = fcmp ogt float %122, 0.000000e+00
  %124 = zext i1 %123 to i8
  %125 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 13, i32 %39, i32 %40)
  %126 = fcmp ogt float %125, 0.000000e+00
  %127 = zext i1 %126 to i8
  %128 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 11, i32 %39, i32 %40)
  %129 = fcmp ogt float %128, 0.000000e+00
  %130 = zext i1 %129 to i8
  %131 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 10, i32 %39, i32 %40)
  %132 = fcmp ogt float %131, 0.000000e+00
  %133 = zext i1 %132 to i8
  %134 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 8, i32 %39, i32 %40)
  %135 = fcmp ogt float %134, 0.000000e+00
  %136 = zext i1 %135 to i8
  %137 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 19, i32 %39, i32 %40)
  %138 = fptosi float %137 to i32
  %139 = fcmp ole float %137, 0xC1E0000000000000
  %140 = select i1 %139, i32 -2147483648, i32 %138
  %141 = fcmp oge float %137, 0x41E0000000000000
  %142 = select i1 %141, i32 2147483647, i32 %140
  %143 = fcmp uno float %137, %137
  %144 = select i1 %143, i32 0, i32 %142
  %145 = call i32 @llvm.smax.i32(i32 %144, i32 1)
  %146 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 4, i32 %39, i32 %40)
  %147 = fptosi float %146 to i32
  %148 = fcmp ole float %146, 0xC1E0000000000000
  %149 = select i1 %148, i32 -2147483648, i32 %147
  %150 = fcmp oge float %146, 0x41E0000000000000
  %151 = select i1 %150, i32 2147483647, i32 %149
  %152 = fcmp uno float %146, %146
  %153 = select i1 %152, i32 0, i32 %151
  %154 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 1, i32 %39, i32 %40)
  %155 = fptosi float %154 to i32
  %156 = fcmp ole float %154, 0xC1E0000000000000
  %157 = select i1 %156, i32 -2147483648, i32 %155
  %158 = fcmp oge float %154, 0x41E0000000000000
  %159 = select i1 %158, i32 2147483647, i32 %157
  %160 = fcmp uno float %154, %154
  %161 = select i1 %160, i32 0, i32 %159
  %162 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 0, i32 %39, i32 %40)
  %163 = fptosi float %162 to i32
  %164 = fcmp ole float %162, 0xC1E0000000000000
  %165 = select i1 %164, i32 -2147483648, i32 %163
  %166 = fcmp oge float %162, 0x41E0000000000000
  %167 = select i1 %166, i32 2147483647, i32 %165
  %168 = fcmp uno float %162, %162
  %169 = select i1 %168, i32 0, i32 %167
  %170 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 3, i32 %39, i32 %40)
  %171 = fptosi float %170 to i32
  %172 = fcmp ole float %170, 0xC1E0000000000000
  %173 = select i1 %172, i32 -2147483648, i32 %171
  %174 = fcmp oge float %170, 0x41E0000000000000
  %175 = select i1 %174, i32 2147483647, i32 %173
  %176 = fcmp uno float %170, %170
  %177 = select i1 %176, i32 0, i32 %175
  %178 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 2, i32 %39, i32 %40)
  %179 = fptosi float %178 to i32
  %180 = fcmp ole float %178, 0xC1E0000000000000
  %181 = select i1 %180, i32 -2147483648, i32 %179
  %182 = fcmp oge float %178, 0x41E0000000000000
  %183 = select i1 %182, i32 2147483647, i32 %181
  %184 = fcmp uno float %178, %178
  %185 = select i1 %184, i32 0, i32 %183
  %186 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 7, i32 %39, i32 %40)
  %187 = fcmp ogt float %186, 0.000000e+00
  %188 = zext i1 %187 to i8
  %189 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 12, i32 %39, i32 %40)
  %190 = fptosi float %189 to i32
  %191 = fcmp ole float %189, 0xC1E0000000000000
  %192 = select i1 %191, i32 -2147483648, i32 %190
  %193 = fcmp oge float %189, 0x41E0000000000000
  %194 = select i1 %193, i32 2147483647, i32 %192
  %195 = fcmp uno float %189, %189
  %196 = select i1 %195, i32 0, i32 %194
  %197 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 6, i32 %39, i32 %40)
  %198 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 9, i32 %39, i32 %40)
  %199 = fcmp ogt float %198, 0.000000e+00
  %200 = zext i1 %199 to i8
  %201 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 5, i32 %39, i32 %40)
  %202 = fptosi float %201 to i32
  %203 = fcmp ole float %201, 0xC1E0000000000000
  %204 = select i1 %203, i32 -2147483648, i32 %202
  %205 = fcmp oge float %201, 0x41E0000000000000
  %206 = select i1 %205, i32 2147483647, i32 %204
  %207 = fcmp uno float %201, %201
  %208 = select i1 %207, i32 0, i32 %206
  %209 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 17, i32 %39, i32 %40)
  %210 = fcmp ogt float %209, 0.000000e+00
  %211 = zext i1 %210 to i8
  %212 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 18, i32 %39, i32 %40)
  %213 = fcmp ogt float %212, 0.000000e+00
  %214 = zext i1 %213 to i8
  %215 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 16, i32 %39, i32 %40)
  %216 = fcmp ogt float %215, 0.000000e+00
  %217 = zext i1 %216 to i8
  %218 = getelementptr inbounds i32, ptr %5, i32 %38
  %219 = load i32, ptr %218, align 4, !invariant.load !3
  %220 = srem i32 %219, 15
  %221 = icmp slt i32 %220, 0
  %222 = icmp ne i32 %220, 0
  %223 = and i1 %221, %222
  %224 = add i32 %220, 15
  %225 = select i1 %223, i32 %224, i32 %220
  %226 = icmp eq i32 %41, 0
  %227 = icmp sge i32 %225, 1
  %228 = zext i1 %227 to i8
  %229 = icmp sle i32 %225, 13
  %230 = zext i1 %229 to i8
  %231 = select i1 %226, i32 -1, i32 1
  %232 = select i1 %226, i8 %228, i8 %230
  %233 = add i32 %219, %231
  %234 = and i8 %200, %232
  %235 = call i32 @llvm.smax.i32(i32 %233, i32 0)
  %236 = call i32 @llvm.smin.i32(i32 %235, i32 164)
  %237 = trunc i8 %234 to i1
  %238 = select i1 %237, i32 %236, i32 %219
  %239 = icmp slt i32 %238, 0
  %240 = add i32 %238, 165
  %241 = select i1 %239, i32 %240, i32 %238
  %242 = and i8 %57, %200
  %243 = and i8 %242, %232
  %244 = getelementptr inbounds float, ptr %6, i32 %39
  %245 = load float, ptr %244, align 4, !invariant.load !3
  %246 = call float @llvm.maximum.f32(float %197, float 1.000000e+00)
  %247 = fdiv float %245, %246
  %248 = fptosi float %247 to i32
  %249 = fcmp ole float %247, 0xC1E0000000000000
  %250 = select i1 %249, i32 -2147483648, i32 %248
  %251 = fcmp oge float %247, 0x41E0000000000000
  %252 = select i1 %251, i32 2147483647, i32 %250
  %253 = fcmp uno float %247, %247
  %254 = select i1 %253, i32 0, i32 %252
  %255 = call i32 @llvm.smax.i32(i32 %254, i32 1)
  %256 = sitofp i32 %255 to float
  %257 = fmul float %256, %197
  %258 = trunc i8 %57 to i1
  %259 = select i1 %258, float %257, float 0.000000e+00
  %260 = getelementptr inbounds i8, ptr %7, i32 %38
  store i8 %58, ptr %260, align 1
  %261 = getelementptr inbounds i32, ptr %8, i32 %38
  store i32 %41, ptr %261, align 4
  %262 = getelementptr inbounds float, ptr %9, i32 %38
  store float %118, ptr %262, align 4
  %263 = getelementptr inbounds i8, ptr %10, i32 %38
  store i8 %121, ptr %263, align 1
  %264 = getelementptr inbounds i8, ptr %11, i32 %38
  store i8 %124, ptr %264, align 1
  %265 = getelementptr inbounds i8, ptr %12, i32 %38
  store i8 %127, ptr %265, align 1
  %266 = getelementptr inbounds i8, ptr %13, i32 %38
  store i8 %130, ptr %266, align 1
  %267 = getelementptr inbounds i8, ptr %14, i32 %38
  store i8 %133, ptr %267, align 1
  %268 = getelementptr inbounds i8, ptr %15, i32 %38
  store i8 %136, ptr %268, align 1
  %269 = getelementptr inbounds i32, ptr %16, i32 %38
  store i32 %145, ptr %269, align 4
  %270 = getelementptr inbounds i32, ptr %17, i32 %38
  store i32 %153, ptr %270, align 4
  %271 = getelementptr inbounds i32, ptr %18, i32 %38
  store i32 %161, ptr %271, align 4
  %272 = getelementptr inbounds i32, ptr %19, i32 %38
  store i32 %169, ptr %272, align 4
  %273 = getelementptr inbounds i32, ptr %20, i32 %38
  store i32 %177, ptr %273, align 4
  %274 = getelementptr inbounds i32, ptr %21, i32 %38
  store i32 %185, ptr %274, align 4
  %275 = getelementptr inbounds i8, ptr %22, i32 %38
  store i8 %188, ptr %275, align 1
  %276 = getelementptr inbounds i32, ptr %23, i32 %38
  store i32 %196, ptr %276, align 4
  %277 = getelementptr inbounds float, ptr %24, i32 %38
  store float %197, ptr %277, align 4
  %278 = getelementptr inbounds i8, ptr %25, i32 %38
  store i8 %200, ptr %278, align 1
  %279 = getelementptr inbounds i32, ptr %26, i32 %38
  store i32 %208, ptr %279, align 4
  %280 = getelementptr inbounds i8, ptr %27, i32 %38
  store i8 %211, ptr %280, align 1
  %281 = getelementptr inbounds i8, ptr %28, i32 %38
  store i8 %214, ptr %281, align 1
  %282 = getelementptr inbounds i8, ptr %29, i32 %38
  store i8 %217, ptr %282, align 1
  %283 = getelementptr inbounds i32, ptr %30, i32 %38
  store i32 %241, ptr %283, align 4
  %284 = getelementptr inbounds i8, ptr %31, i32 %38
  store i8 %243, ptr %284, align 1
  %285 = getelementptr inbounds float, ptr %32, i32 %38
  store float %259, ptr %285, align 4
  %286 = getelementptr inbounds i32, ptr %33, i32 %38
  store i32 %255, ptr %286, align 4
  ret void
}

define internal i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_847_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, i32 %7) {
  %9 = icmp sge i32 %7, 7
  %10 = zext i1 %9 to i32
  ret i32 %10
}

define internal i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, i32 %7, i32 %8) {
  %10 = call i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 0, i32 %7, i32 %8)
  %11 = add i32 %10, 1000
  %12 = mul i32 %7, 14
  %13 = add i32 %12, %8
  %14 = getelementptr inbounds i8, ptr %0, i32 %13
  %15 = load i8, ptr %14, align 1, !invariant.load !3
  %16 = trunc i8 %15 to i1
  %17 = select i1 %16, i32 %11, i32 -10000
  ret i32 %17
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minimum.f32(float, float) #1

define internal float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, i32 %7, i32 %8, i32 %9) {
  %11 = mul i32 %8, 14
  %12 = add i32 %11, %9
  %13 = getelementptr inbounds i32, ptr %4, i32 %12
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  %15 = call i32 @llvm.smin.i32(i32 %14, i32 100)
  %16 = call i32 @llvm.smax.i32(i32 %15, i32 0)
  %17 = mul i32 %16, 20
  %18 = add i32 %17, %7
  %19 = getelementptr inbounds float, ptr %3, i32 %18
  %20 = load float, ptr %19, align 4, !invariant.load !3
  ret float %20
}

define internal i32 @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, i32 %7, i32 %8, i32 %9) {
  %11 = call float @fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, i32 5, i32 %8, i32 %9)
  %12 = fptosi float %11 to i32
  %13 = fcmp ole float %11, 0xC1E0000000000000
  %14 = select i1 %13, i32 -2147483648, i32 %12
  %15 = fcmp oge float %11, 0x41E0000000000000
  %16 = select i1 %15, i32 2147483647, i32 %14
  %17 = fcmp uno float %11, %11
  %18 = select i1 %17, i32 0, i32 %16
  ret i32 %18
}

define ptx_kernel void @input_concatenate_fusion(ptr noalias align 256 dereferenceable(16384) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(32768) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %6 = mul i32 %5, 128
  %7 = add i32 %6, %4
  %8 = zext i32 %7 to i64
  %9 = trunc i64 %8 to i32
  %10 = call i32 @fused_concatenate__epilogue__concatenate_31_1(ptr %0, ptr %1, i32 %7, i32 0, i32 %9)
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
  %24 = call i32 @fused_concatenate__epilogue__concatenate_31_1(ptr %0, ptr %1, i32 %7, i32 1, i32 %23)
  %25 = add i32 %13, 1
  %26 = getelementptr inbounds i32, ptr %2, i32 %25
  store i32 %24, ptr %26, align 4
  ret void
}

define internal i32 @fused_concatenate__epilogue__concatenate_31_1(ptr noalias %0, ptr noalias %1, i32 %2, i32 %3, i32 %4) {
  ret i32 %4
}

define ptx_kernel void @loop_and_fusion_2(ptr noalias align 256 dereferenceable(165) %0, ptr noalias align 256 dereferenceable(165) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !11
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %3, 128
  %6 = add i32 %5, %4
  %7 = icmp sle i32 %6, 164
  br i1 %7, label %8, label %22

8:                                                ; preds = %2
  %9 = srem i32 %6, 15
  %10 = icmp slt i32 %9, 0
  %11 = icmp ne i32 %9, 0
  %12 = and i1 %10, %11
  %13 = zext i1 %12 to i8
  %14 = add i32 %9, 15
  %15 = select i1 %12, i32 %14, i32 %9
  %16 = icmp sge i32 %15, 3
  %17 = icmp sle i32 %15, 11
  %18 = and i1 %16, %17
  %19 = zext i1 %18 to i8
  %20 = getelementptr inbounds i8, ptr %0, i32 %6
  store i8 %19, ptr %20, align 1
  %21 = getelementptr inbounds i8, ptr %1, i32 %6
  store i8 %13, ptr %21, align 1
  br label %22

22:                                               ; preds = %8, %2
  ret void
}

define ptx_kernel void @loop_select_fusion_3(ptr noalias align 256 dereferenceable(16384) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(16384) %2, ptr noalias align 256 dereferenceable(165) %3, ptr noalias align 256 dereferenceable(2703360) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = mul i32 %7, 4
  %9 = mul i32 %6, 512
  %10 = add i32 %8, %9
  %11 = udiv i32 %10, 165
  %12 = urem i32 %10, 165
  %13 = sext i32 %12 to i64
  %14 = lshr i64 %13, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds i32, ptr %2, i32 %11
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = add i32 %12, %17
  %19 = shl i32 %18, 13
  %20 = lshr i32 %18, 19
  %21 = getelementptr inbounds i32, ptr %1, i32 %11
  %22 = load i32, ptr %21, align 4, !invariant.load !3
  %23 = add i32 %15, %22
  %24 = or i32 %19, %20
  %25 = add i32 %23, %18
  %26 = xor i32 %25, %24
  %27 = shl i32 %26, 15
  %28 = lshr i32 %26, 17
  %29 = or i32 %27, %28
  %30 = add i32 %25, %26
  %31 = xor i32 %30, %29
  %32 = shl i32 %31, 26
  %33 = lshr i32 %31, 6
  %34 = add i32 %30, %31
  %35 = or i32 %32, %33
  %36 = xor i32 %34, %35
  %37 = shl i32 %36, 6
  %38 = lshr i32 %36, 26
  %39 = or i32 %37, %38
  %40 = add i32 %34, %36
  %41 = xor i32 %40, %39
  %42 = getelementptr inbounds i32, ptr %0, i32 %11
  %43 = load i32, ptr %42, align 4, !invariant.load !3
  %44 = add i32 %41, %43
  %45 = add i32 %44, 1
  %46 = shl i32 %45, 17
  %47 = lshr i32 %45, 15
  %48 = add i32 %40, %17
  %49 = or i32 %46, %47
  %50 = add i32 %48, %45
  %51 = xor i32 %50, %49
  %52 = shl i32 %51, 29
  %53 = lshr i32 %51, 3
  %54 = or i32 %52, %53
  %55 = add i32 %50, %51
  %56 = xor i32 %55, %54
  %57 = shl i32 %56, 16
  %58 = lshr i32 %56, 16
  %59 = add i32 %55, %56
  %60 = or i32 %57, %58
  %61 = xor i32 %59, %60
  %62 = shl i32 %61, 24
  %63 = lshr i32 %61, 8
  %64 = or i32 %62, %63
  %65 = add i32 %59, %61
  %66 = xor i32 %65, %64
  %67 = add i32 %66, %22
  %68 = add i32 %67, 2
  %69 = shl i32 %68, 13
  %70 = lshr i32 %68, 19
  %71 = add i32 %65, %43
  %72 = or i32 %69, %70
  %73 = add i32 %71, %68
  %74 = xor i32 %73, %72
  %75 = shl i32 %74, 15
  %76 = lshr i32 %74, 17
  %77 = or i32 %75, %76
  %78 = add i32 %73, %74
  %79 = xor i32 %78, %77
  %80 = shl i32 %79, 26
  %81 = lshr i32 %79, 6
  %82 = add i32 %78, %79
  %83 = or i32 %80, %81
  %84 = xor i32 %82, %83
  %85 = shl i32 %84, 6
  %86 = lshr i32 %84, 26
  %87 = or i32 %85, %86
  %88 = add i32 %82, %84
  %89 = xor i32 %88, %87
  %90 = add i32 %89, %17
  %91 = add i32 %90, 3
  %92 = shl i32 %91, 17
  %93 = lshr i32 %91, 15
  %94 = add i32 %88, %22
  %95 = or i32 %92, %93
  %96 = add i32 %94, %91
  %97 = xor i32 %96, %95
  %98 = shl i32 %97, 29
  %99 = lshr i32 %97, 3
  %100 = or i32 %98, %99
  %101 = add i32 %96, %97
  %102 = xor i32 %101, %100
  %103 = shl i32 %102, 16
  %104 = lshr i32 %102, 16
  %105 = add i32 %101, %102
  %106 = or i32 %103, %104
  %107 = xor i32 %105, %106
  %108 = shl i32 %107, 24
  %109 = lshr i32 %107, 8
  %110 = or i32 %108, %109
  %111 = add i32 %105, %107
  %112 = xor i32 %111, %110
  %113 = add i32 %112, %43
  %114 = add i32 %113, 4
  %115 = shl i32 %114, 13
  %116 = lshr i32 %114, 19
  %117 = add i32 %111, %17
  %118 = or i32 %115, %116
  %119 = add i32 %117, %114
  %120 = xor i32 %119, %118
  %121 = shl i32 %120, 15
  %122 = lshr i32 %120, 17
  %123 = or i32 %121, %122
  %124 = add i32 %119, %120
  %125 = xor i32 %124, %123
  %126 = shl i32 %125, 26
  %127 = lshr i32 %125, 6
  %128 = add i32 %124, %125
  %129 = or i32 %126, %127
  %130 = xor i32 %128, %129
  %131 = shl i32 %130, 6
  %132 = lshr i32 %130, 26
  %133 = or i32 %131, %132
  %134 = add i32 %128, %130
  %135 = xor i32 %134, %133
  %136 = add i32 %135, %22
  %137 = add i32 %134, %43
  %138 = add i32 %136, 5
  %139 = xor i32 %137, %138
  %140 = lshr i32 %139, 9
  %141 = or i32 %140, 1065353216
  %142 = bitcast i32 %141 to float
  %143 = fadd float %142, -1.000000e+00
  %144 = getelementptr inbounds i8, ptr %3, i32 %12
  %145 = load i8, ptr %144, align 1, !invariant.load !3
  %146 = call float @llvm.maximum.f32(float %143, float 0.000000e+00)
  %147 = trunc i8 %145 to i1
  %148 = select i1 %147, float %146, float -1.000000e+00
  %149 = insertelement <4 x float> zeroinitializer, float %148, i64 0
  %150 = add i32 %10, 1
  %151 = udiv i32 %150, 165
  %152 = urem i32 %150, 165
  %153 = sext i32 %152 to i64
  %154 = lshr i64 %153, 32
  %155 = trunc i64 %154 to i32
  %156 = getelementptr inbounds i32, ptr %2, i32 %151
  %157 = load i32, ptr %156, align 4, !invariant.load !3
  %158 = add i32 %152, %157
  %159 = shl i32 %158, 13
  %160 = lshr i32 %158, 19
  %161 = getelementptr inbounds i32, ptr %1, i32 %151
  %162 = load i32, ptr %161, align 4, !invariant.load !3
  %163 = add i32 %155, %162
  %164 = or i32 %159, %160
  %165 = add i32 %163, %158
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
  %182 = getelementptr inbounds i32, ptr %0, i32 %151
  %183 = load i32, ptr %182, align 4, !invariant.load !3
  %184 = add i32 %181, %183
  %185 = add i32 %184, 1
  %186 = shl i32 %185, 17
  %187 = lshr i32 %185, 15
  %188 = add i32 %180, %157
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
  %230 = add i32 %229, %157
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
  %257 = add i32 %251, %157
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
  %284 = getelementptr inbounds i8, ptr %3, i32 %152
  %285 = load i8, ptr %284, align 1, !invariant.load !3
  %286 = call float @llvm.maximum.f32(float %283, float 0.000000e+00)
  %287 = trunc i8 %285 to i1
  %288 = select i1 %287, float %286, float -1.000000e+00
  %289 = insertelement <4 x float> %149, float %288, i64 1
  %290 = add i32 %10, 2
  %291 = udiv i32 %290, 165
  %292 = urem i32 %290, 165
  %293 = sext i32 %292 to i64
  %294 = lshr i64 %293, 32
  %295 = trunc i64 %294 to i32
  %296 = getelementptr inbounds i32, ptr %2, i32 %291
  %297 = load i32, ptr %296, align 4, !invariant.load !3
  %298 = add i32 %292, %297
  %299 = shl i32 %298, 13
  %300 = lshr i32 %298, 19
  %301 = getelementptr inbounds i32, ptr %1, i32 %291
  %302 = load i32, ptr %301, align 4, !invariant.load !3
  %303 = add i32 %295, %302
  %304 = or i32 %299, %300
  %305 = add i32 %303, %298
  %306 = xor i32 %305, %304
  %307 = shl i32 %306, 15
  %308 = lshr i32 %306, 17
  %309 = or i32 %307, %308
  %310 = add i32 %305, %306
  %311 = xor i32 %310, %309
  %312 = shl i32 %311, 26
  %313 = lshr i32 %311, 6
  %314 = add i32 %310, %311
  %315 = or i32 %312, %313
  %316 = xor i32 %314, %315
  %317 = shl i32 %316, 6
  %318 = lshr i32 %316, 26
  %319 = or i32 %317, %318
  %320 = add i32 %314, %316
  %321 = xor i32 %320, %319
  %322 = getelementptr inbounds i32, ptr %0, i32 %291
  %323 = load i32, ptr %322, align 4, !invariant.load !3
  %324 = add i32 %321, %323
  %325 = add i32 %324, 1
  %326 = shl i32 %325, 17
  %327 = lshr i32 %325, 15
  %328 = add i32 %320, %297
  %329 = or i32 %326, %327
  %330 = add i32 %328, %325
  %331 = xor i32 %330, %329
  %332 = shl i32 %331, 29
  %333 = lshr i32 %331, 3
  %334 = or i32 %332, %333
  %335 = add i32 %330, %331
  %336 = xor i32 %335, %334
  %337 = shl i32 %336, 16
  %338 = lshr i32 %336, 16
  %339 = add i32 %335, %336
  %340 = or i32 %337, %338
  %341 = xor i32 %339, %340
  %342 = shl i32 %341, 24
  %343 = lshr i32 %341, 8
  %344 = or i32 %342, %343
  %345 = add i32 %339, %341
  %346 = xor i32 %345, %344
  %347 = add i32 %346, %302
  %348 = add i32 %347, 2
  %349 = shl i32 %348, 13
  %350 = lshr i32 %348, 19
  %351 = add i32 %345, %323
  %352 = or i32 %349, %350
  %353 = add i32 %351, %348
  %354 = xor i32 %353, %352
  %355 = shl i32 %354, 15
  %356 = lshr i32 %354, 17
  %357 = or i32 %355, %356
  %358 = add i32 %353, %354
  %359 = xor i32 %358, %357
  %360 = shl i32 %359, 26
  %361 = lshr i32 %359, 6
  %362 = add i32 %358, %359
  %363 = or i32 %360, %361
  %364 = xor i32 %362, %363
  %365 = shl i32 %364, 6
  %366 = lshr i32 %364, 26
  %367 = or i32 %365, %366
  %368 = add i32 %362, %364
  %369 = xor i32 %368, %367
  %370 = add i32 %369, %297
  %371 = add i32 %370, 3
  %372 = shl i32 %371, 17
  %373 = lshr i32 %371, 15
  %374 = add i32 %368, %302
  %375 = or i32 %372, %373
  %376 = add i32 %374, %371
  %377 = xor i32 %376, %375
  %378 = shl i32 %377, 29
  %379 = lshr i32 %377, 3
  %380 = or i32 %378, %379
  %381 = add i32 %376, %377
  %382 = xor i32 %381, %380
  %383 = shl i32 %382, 16
  %384 = lshr i32 %382, 16
  %385 = add i32 %381, %382
  %386 = or i32 %383, %384
  %387 = xor i32 %385, %386
  %388 = shl i32 %387, 24
  %389 = lshr i32 %387, 8
  %390 = or i32 %388, %389
  %391 = add i32 %385, %387
  %392 = xor i32 %391, %390
  %393 = add i32 %392, %323
  %394 = add i32 %393, 4
  %395 = shl i32 %394, 13
  %396 = lshr i32 %394, 19
  %397 = add i32 %391, %297
  %398 = or i32 %395, %396
  %399 = add i32 %397, %394
  %400 = xor i32 %399, %398
  %401 = shl i32 %400, 15
  %402 = lshr i32 %400, 17
  %403 = or i32 %401, %402
  %404 = add i32 %399, %400
  %405 = xor i32 %404, %403
  %406 = shl i32 %405, 26
  %407 = lshr i32 %405, 6
  %408 = add i32 %404, %405
  %409 = or i32 %406, %407
  %410 = xor i32 %408, %409
  %411 = shl i32 %410, 6
  %412 = lshr i32 %410, 26
  %413 = or i32 %411, %412
  %414 = add i32 %408, %410
  %415 = xor i32 %414, %413
  %416 = add i32 %415, %302
  %417 = add i32 %414, %323
  %418 = add i32 %416, 5
  %419 = xor i32 %417, %418
  %420 = lshr i32 %419, 9
  %421 = or i32 %420, 1065353216
  %422 = bitcast i32 %421 to float
  %423 = fadd float %422, -1.000000e+00
  %424 = getelementptr inbounds i8, ptr %3, i32 %292
  %425 = load i8, ptr %424, align 1, !invariant.load !3
  %426 = call float @llvm.maximum.f32(float %423, float 0.000000e+00)
  %427 = trunc i8 %425 to i1
  %428 = select i1 %427, float %426, float -1.000000e+00
  %429 = insertelement <4 x float> %289, float %428, i64 2
  %430 = add i32 %10, 3
  %431 = udiv i32 %430, 165
  %432 = urem i32 %430, 165
  %433 = sext i32 %432 to i64
  %434 = lshr i64 %433, 32
  %435 = trunc i64 %434 to i32
  %436 = getelementptr inbounds i32, ptr %2, i32 %431
  %437 = load i32, ptr %436, align 4, !invariant.load !3
  %438 = add i32 %432, %437
  %439 = shl i32 %438, 13
  %440 = lshr i32 %438, 19
  %441 = getelementptr inbounds i32, ptr %1, i32 %431
  %442 = load i32, ptr %441, align 4, !invariant.load !3
  %443 = add i32 %435, %442
  %444 = or i32 %439, %440
  %445 = add i32 %443, %438
  %446 = xor i32 %445, %444
  %447 = shl i32 %446, 15
  %448 = lshr i32 %446, 17
  %449 = or i32 %447, %448
  %450 = add i32 %445, %446
  %451 = xor i32 %450, %449
  %452 = shl i32 %451, 26
  %453 = lshr i32 %451, 6
  %454 = add i32 %450, %451
  %455 = or i32 %452, %453
  %456 = xor i32 %454, %455
  %457 = shl i32 %456, 6
  %458 = lshr i32 %456, 26
  %459 = or i32 %457, %458
  %460 = add i32 %454, %456
  %461 = xor i32 %460, %459
  %462 = getelementptr inbounds i32, ptr %0, i32 %431
  %463 = load i32, ptr %462, align 4, !invariant.load !3
  %464 = add i32 %461, %463
  %465 = add i32 %464, 1
  %466 = shl i32 %465, 17
  %467 = lshr i32 %465, 15
  %468 = add i32 %460, %437
  %469 = or i32 %466, %467
  %470 = add i32 %468, %465
  %471 = xor i32 %470, %469
  %472 = shl i32 %471, 29
  %473 = lshr i32 %471, 3
  %474 = or i32 %472, %473
  %475 = add i32 %470, %471
  %476 = xor i32 %475, %474
  %477 = shl i32 %476, 16
  %478 = lshr i32 %476, 16
  %479 = add i32 %475, %476
  %480 = or i32 %477, %478
  %481 = xor i32 %479, %480
  %482 = shl i32 %481, 24
  %483 = lshr i32 %481, 8
  %484 = or i32 %482, %483
  %485 = add i32 %479, %481
  %486 = xor i32 %485, %484
  %487 = add i32 %486, %442
  %488 = add i32 %487, 2
  %489 = shl i32 %488, 13
  %490 = lshr i32 %488, 19
  %491 = add i32 %485, %463
  %492 = or i32 %489, %490
  %493 = add i32 %491, %488
  %494 = xor i32 %493, %492
  %495 = shl i32 %494, 15
  %496 = lshr i32 %494, 17
  %497 = or i32 %495, %496
  %498 = add i32 %493, %494
  %499 = xor i32 %498, %497
  %500 = shl i32 %499, 26
  %501 = lshr i32 %499, 6
  %502 = add i32 %498, %499
  %503 = or i32 %500, %501
  %504 = xor i32 %502, %503
  %505 = shl i32 %504, 6
  %506 = lshr i32 %504, 26
  %507 = or i32 %505, %506
  %508 = add i32 %502, %504
  %509 = xor i32 %508, %507
  %510 = add i32 %509, %437
  %511 = add i32 %510, 3
  %512 = shl i32 %511, 17
  %513 = lshr i32 %511, 15
  %514 = add i32 %508, %442
  %515 = or i32 %512, %513
  %516 = add i32 %514, %511
  %517 = xor i32 %516, %515
  %518 = shl i32 %517, 29
  %519 = lshr i32 %517, 3
  %520 = or i32 %518, %519
  %521 = add i32 %516, %517
  %522 = xor i32 %521, %520
  %523 = shl i32 %522, 16
  %524 = lshr i32 %522, 16
  %525 = add i32 %521, %522
  %526 = or i32 %523, %524
  %527 = xor i32 %525, %526
  %528 = shl i32 %527, 24
  %529 = lshr i32 %527, 8
  %530 = or i32 %528, %529
  %531 = add i32 %525, %527
  %532 = xor i32 %531, %530
  %533 = add i32 %532, %463
  %534 = add i32 %533, 4
  %535 = shl i32 %534, 13
  %536 = lshr i32 %534, 19
  %537 = add i32 %531, %437
  %538 = or i32 %535, %536
  %539 = add i32 %537, %534
  %540 = xor i32 %539, %538
  %541 = shl i32 %540, 15
  %542 = lshr i32 %540, 17
  %543 = or i32 %541, %542
  %544 = add i32 %539, %540
  %545 = xor i32 %544, %543
  %546 = shl i32 %545, 26
  %547 = lshr i32 %545, 6
  %548 = add i32 %544, %545
  %549 = or i32 %546, %547
  %550 = xor i32 %548, %549
  %551 = shl i32 %550, 6
  %552 = lshr i32 %550, 26
  %553 = or i32 %551, %552
  %554 = add i32 %548, %550
  %555 = xor i32 %554, %553
  %556 = add i32 %555, %442
  %557 = add i32 %554, %463
  %558 = add i32 %556, 5
  %559 = xor i32 %557, %558
  %560 = lshr i32 %559, 9
  %561 = or i32 %560, 1065353216
  %562 = bitcast i32 %561 to float
  %563 = fadd float %562, -1.000000e+00
  %564 = getelementptr inbounds i8, ptr %3, i32 %432
  %565 = load i8, ptr %564, align 1, !invariant.load !3
  %566 = call float @llvm.maximum.f32(float %563, float 0.000000e+00)
  %567 = trunc i8 %565 to i1
  %568 = select i1 %567, float %566, float -1.000000e+00
  %569 = insertelement <4 x float> %429, float %568, i64 3
  %570 = getelementptr inbounds float, ptr %4, i32 %10
  store <4 x float> %569, ptr %570, align 16
  ret void
}

define ptx_kernel void @wrapped_iota_2(ptr noalias align 256 dereferenceable(2703360) %0) #0 {
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

define ptx_kernel void @sort_6_0(ptr noalias align 256 dereferenceable(2703360) %arg0, ptr noalias align 256 dereferenceable(2703360) %arg1) #0 {
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
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !8
  %block_id = zext i32 %0 to i64
  %1 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %thread_id_x = zext i32 %1 to i64
  %2 = mul nuw nsw i64 %block_id, 128
  %linear_index = add nuw nsw i64 %2, %thread_id_x
  %linear_index_in_range = icmp ult i64 %linear_index, 524288
  call void @llvm.assume(i1 %linear_index_in_range)
  %linear_index0 = add nuw nsw i64 %linear_index, 0
  %3 = udiv i64 %linear_index0, 1
  %4 = urem i64 %3, 128
  %5 = udiv i64 %linear_index0, 128
  %6 = icmp ult i64 %linear_index, 524288
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
  %89 = getelementptr inbounds [4096 x [165 x float]], ptr %arg0, i64 0, i64 %5, i64 %8
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
  %95 = getelementptr inbounds [4096 x [165 x float]], ptr %arg0, i64 0, i64 %5, i64 %92
  %96 = load float, ptr %95, align 4
  %97 = getelementptr [256 x float], ptr addrspace(3) @sort.6.0_tile_param_0, i64 0, i64 %94
  store float %96, ptr addrspace(3) %97, align 4
  br label %inner_smaller_keys_index-after

smaller_keys_index-true1:                         ; preds = %smaller_keys_index-after
  %98 = shl i64 %thread.id.x, 1
  %99 = getelementptr inbounds [4096 x [165 x i32]], ptr %arg1, i64 0, i64 %5, i64 %10
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
  %105 = getelementptr inbounds [4096 x [165 x i32]], ptr %arg1, i64 0, i64 %5, i64 %102
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %118, ptr %120, ptr %122, ptr %124, ptr %compare_return_buffer)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %135, ptr %137, ptr %139, ptr %141, ptr %compare_return_buffer7)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %167, ptr %169, ptr %171, ptr %173, ptr %compare_return_buffer16)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %184, ptr %186, ptr %188, ptr %190, ptr %compare_return_buffer22)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %210, ptr %212, ptr %214, ptr %216, ptr %compare_return_buffer31)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %227, ptr %229, ptr %231, ptr %233, ptr %compare_return_buffer37)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %259, ptr %261, ptr %263, ptr %265, ptr %compare_return_buffer46)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %276, ptr %278, ptr %280, ptr %282, ptr %compare_return_buffer52)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %308, ptr %310, ptr %312, ptr %314, ptr %compare_return_buffer61)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %325, ptr %327, ptr %329, ptr %331, ptr %compare_return_buffer67)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %351, ptr %353, ptr %355, ptr %357, ptr %compare_return_buffer76)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %368, ptr %370, ptr %372, ptr %374, ptr %compare_return_buffer82)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %400, ptr %402, ptr %404, ptr %406, ptr %compare_return_buffer91)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %417, ptr %419, ptr %421, ptr %423, ptr %compare_return_buffer97)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %449, ptr %451, ptr %453, ptr %455, ptr %compare_return_buffer106)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %466, ptr %468, ptr %470, ptr %472, ptr %compare_return_buffer112)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %498, ptr %500, ptr %502, ptr %504, ptr %compare_return_buffer121)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %515, ptr %517, ptr %519, ptr %521, ptr %compare_return_buffer127)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %541, ptr %543, ptr %545, ptr %547, ptr %compare_return_buffer136)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %558, ptr %560, ptr %562, ptr %564, ptr %compare_return_buffer142)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %590, ptr %592, ptr %594, ptr %596, ptr %compare_return_buffer151)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %607, ptr %609, ptr %611, ptr %613, ptr %compare_return_buffer157)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %639, ptr %641, ptr %643, ptr %645, ptr %compare_return_buffer166)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %656, ptr %658, ptr %660, ptr %662, ptr %compare_return_buffer172)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %688, ptr %690, ptr %692, ptr %694, ptr %compare_return_buffer181)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %705, ptr %707, ptr %709, ptr %711, ptr %compare_return_buffer187)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %737, ptr %739, ptr %741, ptr %743, ptr %compare_return_buffer196)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %754, ptr %756, ptr %758, ptr %760, ptr %compare_return_buffer202)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %780, ptr %782, ptr %784, ptr %786, ptr %compare_return_buffer211)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %797, ptr %799, ptr %801, ptr %803, ptr %compare_return_buffer217)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %829, ptr %831, ptr %833, ptr %835, ptr %compare_return_buffer226)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %846, ptr %848, ptr %850, ptr %852, ptr %compare_return_buffer232)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %878, ptr %880, ptr %882, ptr %884, ptr %compare_return_buffer241)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %895, ptr %897, ptr %899, ptr %901, ptr %compare_return_buffer247)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %927, ptr %929, ptr %931, ptr %933, ptr %compare_return_buffer256)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %944, ptr %946, ptr %948, ptr %950, ptr %compare_return_buffer262)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %976, ptr %978, ptr %980, ptr %982, ptr %compare_return_buffer271)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %993, ptr %995, ptr %997, ptr %999, ptr %compare_return_buffer277)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1025, ptr %1027, ptr %1029, ptr %1031, ptr %compare_return_buffer286)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1042, ptr %1044, ptr %1046, ptr %1048, ptr %compare_return_buffer292)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1068, ptr %1070, ptr %1072, ptr %1074, ptr %compare_return_buffer301)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1085, ptr %1087, ptr %1089, ptr %1091, ptr %compare_return_buffer307)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1117, ptr %1119, ptr %1121, ptr %1123, ptr %compare_return_buffer316)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1134, ptr %1136, ptr %1138, ptr %1140, ptr %compare_return_buffer322)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1166, ptr %1168, ptr %1170, ptr %1172, ptr %compare_return_buffer331)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1183, ptr %1185, ptr %1187, ptr %1189, ptr %compare_return_buffer337)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1215, ptr %1217, ptr %1219, ptr %1221, ptr %compare_return_buffer346)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1232, ptr %1234, ptr %1236, ptr %1238, ptr %compare_return_buffer352)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1264, ptr %1266, ptr %1268, ptr %1270, ptr %compare_return_buffer361)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1281, ptr %1283, ptr %1285, ptr %1287, ptr %compare_return_buffer367)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1313, ptr %1315, ptr %1317, ptr %1319, ptr %compare_return_buffer376)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1330, ptr %1332, ptr %1334, ptr %1336, ptr %compare_return_buffer382)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1362, ptr %1364, ptr %1366, ptr %1368, ptr %compare_return_buffer391)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1379, ptr %1381, ptr %1383, ptr %1385, ptr %compare_return_buffer397)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1405, ptr %1407, ptr %1409, ptr %1411, ptr %compare_return_buffer406)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1422, ptr %1424, ptr %1426, ptr %1428, ptr %compare_return_buffer412)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1446, ptr %1448, ptr %1450, ptr %1452, ptr %compare_return_buffer421)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1463, ptr %1465, ptr %1467, ptr %1469, ptr %compare_return_buffer427)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1495, ptr %1497, ptr %1499, ptr %1501, ptr %compare_return_buffer436)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1512, ptr %1514, ptr %1516, ptr %1518, ptr %compare_return_buffer442)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1544, ptr %1546, ptr %1548, ptr %1550, ptr %compare_return_buffer451)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1561, ptr %1563, ptr %1565, ptr %1567, ptr %compare_return_buffer457)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1593, ptr %1595, ptr %1597, ptr %1599, ptr %compare_return_buffer466)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1610, ptr %1612, ptr %1614, ptr %1616, ptr %compare_return_buffer472)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1642, ptr %1644, ptr %1646, ptr %1648, ptr %compare_return_buffer481)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1659, ptr %1661, ptr %1663, ptr %1665, ptr %compare_return_buffer487)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1691, ptr %1693, ptr %1695, ptr %1697, ptr %compare_return_buffer496)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1708, ptr %1710, ptr %1712, ptr %1714, ptr %compare_return_buffer502)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1740, ptr %1742, ptr %1744, ptr %1746, ptr %compare_return_buffer511)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1757, ptr %1759, ptr %1761, ptr %1763, ptr %compare_return_buffer517)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1783, ptr %1785, ptr %1787, ptr %1789, ptr %compare_return_buffer526)
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
  call void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr %1800, ptr %1802, ptr %1804, ptr %1806, ptr %compare_return_buffer532)
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
  %1819 = getelementptr inbounds [4096 x [165 x float]], ptr %arg0, i64 0, i64 %5, i64 %84
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
  %1825 = getelementptr inbounds [4096 x [165 x float]], ptr %arg0, i64 0, i64 %5, i64 %1820
  store float %1824, ptr %1825, align 4
  br label %inner_smaller_keys_index-after539

smaller_keys_index-true540:                       ; preds = %smaller_keys_index-after537
  %1826 = shl i64 %thread.id.x, 1
  %1827 = getelementptr [256 x i32], ptr addrspace(3) @sort.6.0_tile_param_1, i64 0, i64 %1826
  %1828 = load i32, ptr addrspace(3) %1827, align 4
  %1829 = getelementptr inbounds [4096 x [165 x i32]], ptr %arg1, i64 0, i64 %5, i64 %86
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
  %1835 = getelementptr inbounds [4096 x [165 x i32]], ptr %arg1, i64 0, i64 %5, i64 %1830
  store i32 %1834, ptr %1835, align 4
  br label %inner_smaller_keys_index-after543
}

define internal void @region_1_1754_clone_55fe9b90bcf0_b772725e44d32ca6(ptr dereferenceable(4) %0, ptr dereferenceable(4) %1, ptr dereferenceable(4) %2, ptr dereferenceable(4) %3, ptr dereferenceable(1) %output_arg) {
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

define ptx_kernel void @loop_compare_gather_select_fusion(ptr noalias align 256 dereferenceable(229376) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(16384) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(229376) %4, ptr noalias align 256 dereferenceable(229376) %5, ptr noalias align 256 dereferenceable(32768) %6, ptr noalias align 256 dereferenceable(2703360) %7, ptr noalias align 256 dereferenceable(32768) %8, ptr noalias align 256 dereferenceable(32768) %9, ptr noalias align 256 dereferenceable(16384) %10, ptr noalias align 256 dereferenceable(16384) %11, ptr noalias align 256 dereferenceable(4096) %12, ptr noalias align 256 dereferenceable(4096) %13, ptr noalias align 256 dereferenceable(16384) %14, ptr noalias align 256 dereferenceable(16384) %15, ptr noalias align 256 dereferenceable(4096) %16, ptr noalias align 256 dereferenceable(16384) %17, ptr noalias align 256 dereferenceable(4096) %18, ptr noalias align 256 dereferenceable(4096) %19, ptr noalias align 256 dereferenceable(16384) %20, ptr noalias align 256 dereferenceable(4096) %21, ptr noalias align 256 dereferenceable(16384) %22) #0 {
  %24 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %25 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %26 = mul i32 %24, 128
  %27 = add i32 %26, %25
  %28 = call i32 @llvm.smin.i32(i32 %27, i32 4095)
  %29 = call i32 @llvm.smax.i32(i32 %28, i32 0)
  %30 = getelementptr inbounds i32, ptr %1, i32 %27
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = getelementptr inbounds i32, ptr %2, i32 %27
  %33 = load i32, ptr %32, align 4, !invariant.load !3
  %34 = icmp slt i32 %31, %33
  %35 = add i32 %31, 14
  %36 = select i1 %34, i32 %35, i32 %31
  %37 = call i32 @llvm.smin.i32(i32 %36, i32 13)
  %38 = call i32 @llvm.smax.i32(i32 %37, i32 0)
  %39 = mul i32 %29, 14
  %40 = add i32 %39, %38
  %41 = getelementptr inbounds i32, ptr %0, i32 %40
  %42 = load i32, ptr %41, align 4, !invariant.load !3
  %43 = icmp eq i32 %42, 0
  %44 = select i1 %43, i32 -1, i32 1
  %45 = zext i1 %34 to i32
  %46 = icmp slt i32 %45, 1
  %47 = zext i1 %46 to i8
  %48 = call float @fused_compare_gather_select_bitcast_1290_212_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 7, i32 %29, i32 %38)
  %49 = fcmp ogt float %48, 0.000000e+00
  %50 = zext i1 %49 to i32
  %51 = icmp slt i32 %50, 1
  %52 = zext i1 %51 to i8
  %53 = getelementptr inbounds i32, ptr %5, i32 %40
  %54 = load i32, ptr %53, align 4, !invariant.load !3
  %55 = call float @fused_compare_gather_select_bitcast_1290_212_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 5, i32 %29, i32 %38)
  %56 = fptosi float %55 to i32
  %57 = fcmp ole float %55, 0xC1E0000000000000
  %58 = select i1 %57, i32 -2147483648, i32 %56
  %59 = fcmp oge float %55, 0x41E0000000000000
  %60 = select i1 %59, i32 2147483647, i32 %58
  %61 = fcmp uno float %55, %55
  %62 = select i1 %61, i32 0, i32 %60
  %63 = call float @fused_compare_gather_select_bitcast_1290_212_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 9, i32 %29, i32 %38)
  %64 = fcmp ogt float %63, 0.000000e+00
  %65 = zext i1 %64 to i8
  %66 = call i32 @llvm.smax.i32(i32 %33, i32 %31)
  %67 = call i32 @llvm.smin.i32(i32 %66, i32 13)
  %68 = icmp slt i32 %67, %33
  %69 = add i32 %67, 14
  %70 = select i1 %68, i32 %69, i32 %67
  %71 = call i32 @llvm.smin.i32(i32 %70, i32 13)
  %72 = call i32 @llvm.smax.i32(i32 %71, i32 0)
  %73 = icmp sge i32 %72, 7
  %74 = zext i1 %73 to i32
  %75 = icmp eq i32 %74, 0
  %76 = zext i1 %75 to i8
  %77 = mul i32 %25, 2
  %78 = mul i32 %24, 256
  %79 = add i32 %77, %78
  %80 = getelementptr inbounds i32, ptr %6, i32 %79
  %81 = load i32, ptr %80, align 4, !invariant.load !3
  %82 = call i32 @llvm.smin.i32(i32 %81, i32 4095)
  %83 = call i32 @llvm.smax.i32(i32 %82, i32 0)
  %84 = add i32 %79, 1
  %85 = getelementptr inbounds i32, ptr %6, i32 %84
  %86 = load i32, ptr %85, align 4, !invariant.load !3
  %87 = call i32 @llvm.smin.i32(i32 %86, i32 13)
  %88 = call i32 @llvm.smax.i32(i32 %87, i32 0)
  %89 = call float @fused_compare_gather_select_bitcast_1290_212_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 9, i32 %83, i32 %88)
  %90 = fcmp ogt float %89, 0.000000e+00
  %91 = zext i1 %90 to i8
  %92 = call float @fused_compare_gather_select_bitcast_1290_212_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 5, i32 %83, i32 %88)
  %93 = fptosi float %92 to i32
  %94 = fcmp ole float %92, 0xC1E0000000000000
  %95 = select i1 %94, i32 -2147483648, i32 %93
  %96 = fcmp oge float %92, 0x41E0000000000000
  %97 = select i1 %96, i32 2147483647, i32 %95
  %98 = fcmp uno float %92, %92
  %99 = select i1 %98, i32 0, i32 %97
  %100 = call float @fused_compare_gather_select_bitcast_1290_212_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 7, i32 %83, i32 %88)
  %101 = fcmp ogt float %100, 0.000000e+00
  %102 = zext i1 %101 to i32
  %103 = icmp slt i32 %102, 1
  %104 = zext i1 %103 to i8
  %105 = call i32 @fused_compare_gather_select_bitcast_2898_108_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %27)
  %106 = call i32 @fused_compare_gather_select_bitcast_2898_108_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 1, i32 %27)
  %107 = add i32 %105, %106
  %108 = shl i32 %106, 13
  %109 = lshr i32 %106, 19
  %110 = or i32 %108, %109
  %111 = xor i32 %107, %110
  %112 = add i32 %107, %111
  %113 = shl i32 %111, 15
  %114 = lshr i32 %111, 17
  %115 = or i32 %113, %114
  %116 = xor i32 %112, %115
  %117 = add i32 %112, %116
  %118 = shl i32 %116, 26
  %119 = lshr i32 %116, 6
  %120 = or i32 %118, %119
  %121 = xor i32 %117, %120
  %122 = add i32 %117, %121
  %123 = add i32 %122, %106
  %124 = shl i32 %121, 6
  %125 = lshr i32 %121, 26
  %126 = or i32 %124, %125
  %127 = xor i32 %122, %126
  %128 = xor i32 %105, %106
  %129 = xor i32 %128, 466688986
  %130 = add i32 %127, %129
  %131 = add i32 %130, 1
  %132 = add i32 %123, %131
  %133 = shl i32 %131, 17
  %134 = lshr i32 %131, 15
  %135 = or i32 %133, %134
  %136 = xor i32 %132, %135
  %137 = add i32 %132, %136
  %138 = shl i32 %136, 29
  %139 = lshr i32 %136, 3
  %140 = or i32 %138, %139
  %141 = xor i32 %137, %140
  %142 = add i32 %137, %141
  %143 = shl i32 %141, 16
  %144 = lshr i32 %141, 16
  %145 = or i32 %143, %144
  %146 = xor i32 %142, %145
  %147 = add i32 %142, %146
  %148 = add i32 %147, %129
  %149 = shl i32 %146, 24
  %150 = lshr i32 %146, 8
  %151 = or i32 %149, %150
  %152 = xor i32 %147, %151
  %153 = add i32 %152, %105
  %154 = add i32 %153, 2
  %155 = add i32 %148, %154
  %156 = shl i32 %154, 13
  %157 = lshr i32 %154, 19
  %158 = or i32 %156, %157
  %159 = xor i32 %155, %158
  %160 = add i32 %155, %159
  %161 = shl i32 %159, 15
  %162 = lshr i32 %159, 17
  %163 = or i32 %161, %162
  %164 = xor i32 %160, %163
  %165 = add i32 %160, %164
  %166 = shl i32 %164, 26
  %167 = lshr i32 %164, 6
  %168 = or i32 %166, %167
  %169 = xor i32 %165, %168
  %170 = add i32 %165, %169
  %171 = add i32 %170, %105
  %172 = shl i32 %169, 6
  %173 = lshr i32 %169, 26
  %174 = or i32 %172, %173
  %175 = xor i32 %170, %174
  %176 = add i32 %175, %106
  %177 = add i32 %176, 3
  %178 = add i32 %171, %177
  %179 = shl i32 %177, 17
  %180 = lshr i32 %177, 15
  %181 = or i32 %179, %180
  %182 = xor i32 %178, %181
  %183 = add i32 %178, %182
  %184 = shl i32 %182, 29
  %185 = lshr i32 %182, 3
  %186 = or i32 %184, %185
  %187 = xor i32 %183, %186
  %188 = add i32 %183, %187
  %189 = shl i32 %187, 16
  %190 = lshr i32 %187, 16
  %191 = or i32 %189, %190
  %192 = xor i32 %188, %191
  %193 = add i32 %188, %192
  %194 = add i32 %193, %106
  %195 = shl i32 %192, 24
  %196 = lshr i32 %192, 8
  %197 = or i32 %195, %196
  %198 = xor i32 %193, %197
  %199 = add i32 %198, %129
  %200 = add i32 %199, 4
  %201 = add i32 %194, %200
  %202 = shl i32 %200, 13
  %203 = lshr i32 %200, 19
  %204 = or i32 %202, %203
  %205 = xor i32 %201, %204
  %206 = add i32 %201, %205
  %207 = shl i32 %205, 15
  %208 = lshr i32 %205, 17
  %209 = or i32 %207, %208
  %210 = xor i32 %206, %209
  %211 = add i32 %206, %210
  %212 = shl i32 %210, 26
  %213 = lshr i32 %210, 6
  %214 = or i32 %212, %213
  %215 = xor i32 %211, %214
  %216 = add i32 %211, %215
  %217 = add i32 %216, %129
  %218 = shl i32 %215, 6
  %219 = lshr i32 %215, 26
  %220 = or i32 %218, %219
  %221 = xor i32 %216, %220
  %222 = add i32 %221, %105
  %223 = add i32 %222, 5
  %224 = xor i32 %217, %223
  %225 = urem i32 %224, 9
  %226 = mul i32 %225, 4
  %227 = call i32 @fused_compare_gather_select_bitcast_2907_64_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %27)
  %228 = call i32 @fused_compare_gather_select_bitcast_2907_64_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 1, i32 %27)
  %229 = add i32 %227, %228
  %230 = shl i32 %228, 13
  %231 = lshr i32 %228, 19
  %232 = or i32 %230, %231
  %233 = xor i32 %229, %232
  %234 = add i32 %229, %233
  %235 = shl i32 %233, 15
  %236 = lshr i32 %233, 17
  %237 = or i32 %235, %236
  %238 = xor i32 %234, %237
  %239 = add i32 %234, %238
  %240 = shl i32 %238, 26
  %241 = lshr i32 %238, 6
  %242 = or i32 %240, %241
  %243 = xor i32 %239, %242
  %244 = add i32 %239, %243
  %245 = add i32 %244, %228
  %246 = shl i32 %243, 6
  %247 = lshr i32 %243, 26
  %248 = or i32 %246, %247
  %249 = xor i32 %244, %248
  %250 = xor i32 %227, %228
  %251 = xor i32 %250, 466688986
  %252 = add i32 %249, %251
  %253 = add i32 %252, 1
  %254 = add i32 %245, %253
  %255 = shl i32 %253, 17
  %256 = lshr i32 %253, 15
  %257 = or i32 %255, %256
  %258 = xor i32 %254, %257
  %259 = add i32 %254, %258
  %260 = shl i32 %258, 29
  %261 = lshr i32 %258, 3
  %262 = or i32 %260, %261
  %263 = xor i32 %259, %262
  %264 = add i32 %259, %263
  %265 = shl i32 %263, 16
  %266 = lshr i32 %263, 16
  %267 = or i32 %265, %266
  %268 = xor i32 %264, %267
  %269 = add i32 %264, %268
  %270 = add i32 %269, %251
  %271 = shl i32 %268, 24
  %272 = lshr i32 %268, 8
  %273 = or i32 %271, %272
  %274 = xor i32 %269, %273
  %275 = add i32 %274, %227
  %276 = add i32 %275, 2
  %277 = add i32 %270, %276
  %278 = shl i32 %276, 13
  %279 = lshr i32 %276, 19
  %280 = or i32 %278, %279
  %281 = xor i32 %277, %280
  %282 = add i32 %277, %281
  %283 = shl i32 %281, 15
  %284 = lshr i32 %281, 17
  %285 = or i32 %283, %284
  %286 = xor i32 %282, %285
  %287 = add i32 %282, %286
  %288 = shl i32 %286, 26
  %289 = lshr i32 %286, 6
  %290 = or i32 %288, %289
  %291 = xor i32 %287, %290
  %292 = add i32 %287, %291
  %293 = add i32 %292, %227
  %294 = shl i32 %291, 6
  %295 = lshr i32 %291, 26
  %296 = or i32 %294, %295
  %297 = xor i32 %292, %296
  %298 = add i32 %297, %228
  %299 = add i32 %298, 3
  %300 = add i32 %293, %299
  %301 = shl i32 %299, 17
  %302 = lshr i32 %299, 15
  %303 = or i32 %301, %302
  %304 = xor i32 %300, %303
  %305 = add i32 %300, %304
  %306 = shl i32 %304, 29
  %307 = lshr i32 %304, 3
  %308 = or i32 %306, %307
  %309 = xor i32 %305, %308
  %310 = add i32 %305, %309
  %311 = shl i32 %309, 16
  %312 = lshr i32 %309, 16
  %313 = or i32 %311, %312
  %314 = xor i32 %310, %313
  %315 = add i32 %310, %314
  %316 = add i32 %315, %228
  %317 = shl i32 %314, 24
  %318 = lshr i32 %314, 8
  %319 = or i32 %317, %318
  %320 = xor i32 %315, %319
  %321 = add i32 %320, %251
  %322 = add i32 %321, 4
  %323 = add i32 %316, %322
  %324 = shl i32 %322, 13
  %325 = lshr i32 %322, 19
  %326 = or i32 %324, %325
  %327 = xor i32 %323, %326
  %328 = add i32 %323, %327
  %329 = shl i32 %327, 15
  %330 = lshr i32 %327, 17
  %331 = or i32 %329, %330
  %332 = xor i32 %328, %331
  %333 = add i32 %328, %332
  %334 = shl i32 %332, 26
  %335 = lshr i32 %332, 6
  %336 = or i32 %334, %335
  %337 = xor i32 %333, %336
  %338 = add i32 %333, %337
  %339 = add i32 %338, %251
  %340 = shl i32 %337, 6
  %341 = lshr i32 %337, 26
  %342 = or i32 %340, %341
  %343 = xor i32 %338, %342
  %344 = add i32 %343, %227
  %345 = add i32 %344, 5
  %346 = xor i32 %339, %345
  %347 = urem i32 %346, 9
  %348 = add i32 %226, %347
  %349 = urem i32 %348, 9
  %350 = sub i32 164, %349
  %351 = icmp slt i32 %350, %33
  %352 = sub i32 329, %349
  %353 = select i1 %351, i32 %352, i32 %350
  %354 = call i32 @llvm.smin.i32(i32 %353, i32 164)
  %355 = call i32 @llvm.smax.i32(i32 %354, i32 0)
  %356 = mul i32 %29, 165
  %357 = add i32 %356, %355
  %358 = getelementptr inbounds float, ptr %7, i32 %357
  %359 = load float, ptr %358, align 4, !invariant.load !3
  %360 = getelementptr inbounds i32, ptr %10, i32 %27
  store i32 %44, ptr %360, align 4
  %361 = getelementptr inbounds i32, ptr %11, i32 %27
  store i32 %42, ptr %361, align 4
  %362 = getelementptr inbounds i8, ptr %12, i32 %27
  store i8 %47, ptr %362, align 1
  %363 = getelementptr inbounds i8, ptr %13, i32 %27
  store i8 %52, ptr %363, align 1
  %364 = getelementptr inbounds i32, ptr %14, i32 %27
  store i32 %54, ptr %364, align 4
  %365 = getelementptr inbounds i32, ptr %15, i32 %27
  store i32 %62, ptr %365, align 4
  %366 = getelementptr inbounds i8, ptr %16, i32 %27
  store i8 %65, ptr %366, align 1
  %367 = getelementptr inbounds i32, ptr %17, i32 %27
  store i32 %74, ptr %367, align 4
  %368 = getelementptr inbounds i8, ptr %18, i32 %27
  store i8 %76, ptr %368, align 1
  %369 = getelementptr inbounds i8, ptr %19, i32 %27
  store i8 %91, ptr %369, align 1
  %370 = getelementptr inbounds i32, ptr %20, i32 %27
  store i32 %99, ptr %370, align 4
  %371 = getelementptr inbounds i8, ptr %21, i32 %27
  store i8 %104, ptr %371, align 1
  %372 = getelementptr inbounds float, ptr %22, i32 %27
  store float %359, ptr %372, align 4
  ret void
}

define internal float @fused_compare_gather_select_bitcast_1290_212_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = mul i32 %11, 14
  %15 = add i32 %14, %12
  %16 = getelementptr inbounds i32, ptr %4, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = call i32 @llvm.smin.i32(i32 %17, i32 100)
  %19 = call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = mul i32 %19, 20
  %21 = add i32 %20, %10
  %22 = getelementptr inbounds float, ptr %3, i32 %21
  %23 = load float, ptr %22, align 4, !invariant.load !3
  ret float %23
}

define internal i32 @fused_compare_gather_select_bitcast_2898_108_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11) {
  %13 = call i32 @fused_compare_gather_select_concatenate_154_181_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 %10, i32 0, i32 %11)
  ret i32 %13
}

define internal i32 @fused_compare_gather_select_bitcast_2907_64_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11) {
  %13 = call i32 @fused_compare_gather_select_concatenate_154_181_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 %10, i32 1, i32 %11)
  ret i32 %13
}

define internal i32 @fused_compare_gather_select_concatenate_154_181_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = icmp ult i32 %10, 1
  br i1 %14, label %15, label %20

15:                                               ; preds = %13
  %16 = mul i32 %11, 4096
  %17 = add i32 %16, %12
  %18 = getelementptr inbounds i32, ptr %9, i32 %17
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  br label %25

20:                                               ; preds = %13
  %21 = mul i32 %11, 4096
  %22 = add i32 %21, %12
  %23 = getelementptr inbounds i32, ptr %8, i32 %22
  %24 = load i32, ptr %23, align 4, !invariant.load !3
  br label %25

25:                                               ; preds = %15, %20
  %26 = phi i32 [ %24, %20 ], [ %19, %15 ]
  br label %27

27:                                               ; preds = %25
  ret i32 %26
}

define ptx_kernel void @loop_transpose_fusion_1(ptr noalias align 256 dereferenceable(229376) %0, ptr noalias align 256 dereferenceable(458752) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
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

define ptx_kernel void @loop_transpose_fusion_2(ptr noalias align 256 dereferenceable(229376) %0, ptr noalias align 256 dereferenceable(458752) %1, ptr noalias align 256 dereferenceable(458752) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !13
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

define ptx_kernel void @loop_broadcast_fusion_5(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(675840) %1, ptr noalias align 256 dereferenceable(675840) %2, ptr noalias align 256 dereferenceable(675840) %3, ptr noalias align 256 dereferenceable(675840) %4) #0 {
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

define ptx_kernel void @input_scatter_fusion_15(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(458752) %1, ptr noalias align 256 dereferenceable(57344) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %6 = mul i32 %4, 2
  %7 = mul i32 %5, 256
  %8 = add i32 %6, %7
  %9 = getelementptr inbounds i32, ptr %1, i32 %8
  %10 = load i32, ptr %9, align 4, !invariant.load !3
  %11 = add i32 %8, 1
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = icmp ule i32 %10, 4095
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

define ptx_kernel void @input_scatter_fusion_14(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(458752) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(229376) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %8 = mul i32 %6, 2
  %9 = mul i32 %7, 256
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i32, ptr %1, i32 %10
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  %13 = add i32 %10, 1
  %14 = getelementptr inbounds i32, ptr %1, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = icmp ule i32 %12, 4095
  %17 = icmp ule i32 %15, 164
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %61

19:                                               ; preds = %5
  %20 = mul i32 %7, 128
  %21 = add i32 %20, %6
  %22 = getelementptr inbounds i8, ptr %2, i32 %21
  %23 = load i8, ptr %22, align 1, !invariant.load !3
  %24 = getelementptr inbounds i32, ptr %4, i32 %21
  %25 = load i32, ptr %24, align 4, !invariant.load !3
  %26 = call i32 @llvm.smin.i32(i32 %25, i32 100)
  %27 = call i32 @llvm.smax.i32(i32 %26, i32 0)
  %28 = mul i32 %27, 20
  %29 = add i32 %28, 9
  %30 = getelementptr inbounds float, ptr %3, i32 %29
  %31 = load float, ptr %30, align 4, !invariant.load !3
  %32 = fcmp ogt float %31, 0.000000e+00
  %33 = zext i1 %32 to i8
  %34 = and i8 %23, %33
  %35 = mul i32 %12, 165
  %36 = add i32 %35, %15
  %37 = getelementptr inbounds i8, ptr %0, i32 %36
  %38 = ptrtoint ptr %37 to i64
  %39 = and i64 %38, 3
  %40 = mul i64 %39, -1
  %41 = getelementptr inbounds i8, ptr %37, i64 %40
  %42 = trunc i64 %39 to i32
  %43 = mul i32 %42, 8
  %44 = shl i32 255, %43
  %45 = xor i32 -1, %44
  %46 = load i32, ptr %41, align 4
  br label %47

47:                                               ; preds = %47, %19
  %48 = phi i32 [ %57, %47 ], [ %46, %19 ]
  %49 = lshr i32 %48, %43
  %50 = trunc i32 %49 to i8
  %51 = or i8 %50, %34
  %52 = zext i8 %51 to i32
  %53 = and i32 %48, %45
  %54 = shl i32 %52, %43
  %55 = or i32 %53, %54
  %56 = cmpxchg ptr %41, i32 %48, i32 %55 monotonic monotonic, align 4
  %57 = extractvalue { i32, i1 } %56, 0
  %58 = extractvalue { i32, i1 } %56, 1
  %59 = xor i1 %58, true
  br i1 %59, label %47, label %60

60:                                               ; preds = %47
  br label %61

61:                                               ; preds = %60, %5
  ret void
}

define ptx_kernel void @loop_and_or_fusion(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(165) %1, ptr noalias align 256 dereferenceable(2703360) %2, ptr noalias align 256 dereferenceable(16384) %3, ptr noalias align 256 dereferenceable(675840) %4, ptr noalias align 256 dereferenceable(675840) %5) #0 {
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
  %22 = zext i1 %21 to i8
  %23 = getelementptr inbounds i8, ptr %1, i32 %17
  %24 = load i8, ptr %23, align 1, !invariant.load !3
  %25 = extractelement <4 x i8> %13, i64 0
  %26 = and i8 %22, %24
  %27 = or i8 %25, %26
  %28 = insertelement <4 x i8> zeroinitializer, i8 %26, i64 0
  %29 = insertelement <4 x i8> zeroinitializer, i8 %27, i64 0
  %30 = add i32 %11, 1
  %31 = udiv i32 %30, 165
  %32 = urem i32 %30, 165
  %33 = extractelement <4 x float> %15, i64 1
  %34 = getelementptr inbounds float, ptr %3, i32 %31
  %35 = load float, ptr %34, align 4, !invariant.load !3
  %36 = fcmp ogt float %33, %35
  %37 = zext i1 %36 to i8
  %38 = getelementptr inbounds i8, ptr %1, i32 %32
  %39 = load i8, ptr %38, align 1, !invariant.load !3
  %40 = extractelement <4 x i8> %13, i64 1
  %41 = and i8 %37, %39
  %42 = or i8 %40, %41
  %43 = insertelement <4 x i8> %28, i8 %41, i64 1
  %44 = insertelement <4 x i8> %29, i8 %42, i64 1
  %45 = add i32 %11, 2
  %46 = udiv i32 %45, 165
  %47 = urem i32 %45, 165
  %48 = extractelement <4 x float> %15, i64 2
  %49 = getelementptr inbounds float, ptr %3, i32 %46
  %50 = load float, ptr %49, align 4, !invariant.load !3
  %51 = fcmp ogt float %48, %50
  %52 = zext i1 %51 to i8
  %53 = getelementptr inbounds i8, ptr %1, i32 %47
  %54 = load i8, ptr %53, align 1, !invariant.load !3
  %55 = extractelement <4 x i8> %13, i64 2
  %56 = and i8 %52, %54
  %57 = or i8 %55, %56
  %58 = insertelement <4 x i8> %43, i8 %56, i64 2
  %59 = insertelement <4 x i8> %44, i8 %57, i64 2
  %60 = add i32 %11, 3
  %61 = udiv i32 %60, 165
  %62 = urem i32 %60, 165
  %63 = extractelement <4 x float> %15, i64 3
  %64 = getelementptr inbounds float, ptr %3, i32 %61
  %65 = load float, ptr %64, align 4, !invariant.load !3
  %66 = fcmp ogt float %63, %65
  %67 = zext i1 %66 to i8
  %68 = getelementptr inbounds i8, ptr %1, i32 %62
  %69 = load i8, ptr %68, align 1, !invariant.load !3
  %70 = extractelement <4 x i8> %13, i64 3
  %71 = and i8 %67, %69
  %72 = or i8 %70, %71
  %73 = insertelement <4 x i8> %58, i8 %71, i64 3
  %74 = insertelement <4 x i8> %59, i8 %72, i64 3
  %75 = getelementptr inbounds i8, ptr %4, i32 %11
  store <4 x i8> %74, ptr %75, align 4
  %76 = getelementptr inbounds i8, ptr %5, i32 %11
  store <4 x i8> %73, ptr %76, align 4
  ret void
}

define ptx_kernel void @input_scatter_fusion_32(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(16384) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %6 = mul i32 %5, 128
  %7 = add i32 %6, %4
  %8 = call i32 @fused_scatter_32_concatenate_59_5(ptr %0, ptr %1, ptr %2, i32 %7, i32 0)
  %9 = call i32 @fused_scatter_32_concatenate_59_5(ptr %0, ptr %1, ptr %2, i32 %7, i32 1)
  %10 = icmp ule i32 %8, 4095
  %11 = icmp ule i32 %9, 164
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %17

13:                                               ; preds = %3
  %14 = mul i32 %8, 165
  %15 = add i32 %14, %9
  %16 = getelementptr inbounds i8, ptr %0, i32 %15
  store i8 0, ptr %16, align 1
  br label %17

17:                                               ; preds = %13, %3
  ret void
}

define internal i32 @fused_scatter_32_concatenate_59_5(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = icmp ult i32 %4, 1
  br i1 %6, label %7, label %10

7:                                                ; preds = %5
  %8 = zext i32 %3 to i64
  %9 = trunc i64 %8 to i32
  br label %18

10:                                               ; preds = %5
  %11 = getelementptr inbounds i32, ptr %2, i32 %3
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  %13 = getelementptr inbounds i32, ptr %1, i32 %3
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  %15 = icmp slt i32 %14, %12
  %16 = add i32 %14, 165
  %17 = select i1 %15, i32 %16, i32 %14
  br label %18

18:                                               ; preds = %7, %10
  %19 = phi i32 [ %17, %10 ], [ %9, %7 ]
  br label %20

20:                                               ; preds = %18
  ret i32 %19
}

define ptx_kernel void @input_scatter_fusion_30(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(16384) %2, ptr noalias align 256 dereferenceable(16384) %3, ptr noalias align 256 dereferenceable(4096) %4, ptr noalias align 256 dereferenceable(16384) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %9 = mul i32 %8, 128
  %10 = add i32 %9, %7
  %11 = call i32 @fused_scatter_30_concatenate_67_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 0)
  %12 = call i32 @fused_scatter_30_concatenate_67_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 1)
  %13 = icmp ule i32 %11, 4095
  %14 = icmp ule i32 %12, 164
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %20

16:                                               ; preds = %6
  %17 = mul i32 %11, 165
  %18 = add i32 %17, %12
  %19 = getelementptr inbounds i8, ptr %0, i32 %18
  store i8 0, ptr %19, align 1
  br label %20

20:                                               ; preds = %16, %6
  ret void
}

define internal i32 @fused_scatter_30_concatenate_67_3(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = icmp ult i32 %7, 1
  br i1 %9, label %10, label %13

10:                                               ; preds = %8
  %11 = zext i32 %6 to i64
  %12 = trunc i64 %11 to i32
  br label %45

13:                                               ; preds = %8
  %14 = getelementptr inbounds i32, ptr %2, i32 %6
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = srem i32 %15, 15
  %17 = getelementptr inbounds i32, ptr %1, i32 %6
  %18 = load i32, ptr %17, align 4, !invariant.load !3
  %19 = icmp slt i32 %16, %18
  %20 = icmp ne i32 %16, %18
  %21 = and i1 %19, %20
  %22 = add i32 %16, 15
  %23 = select i1 %21, i32 %22, i32 %16
  %24 = getelementptr inbounds i32, ptr %5, i32 %6
  %25 = load i32, ptr %24, align 4, !invariant.load !3
  %26 = icmp eq i32 %25, 0
  %27 = icmp sge i32 %23, 1
  %28 = zext i1 %27 to i8
  %29 = icmp sle i32 %23, 13
  %30 = zext i1 %29 to i8
  %31 = getelementptr inbounds i32, ptr %3, i32 %6
  %32 = load i32, ptr %31, align 4, !invariant.load !3
  %33 = getelementptr inbounds i8, ptr %4, i32 %6
  %34 = load i8, ptr %33, align 1, !invariant.load !3
  %35 = select i1 %26, i8 %28, i8 %30
  %36 = add i32 %15, %32
  %37 = and i8 %34, %35
  %38 = call i32 @llvm.smax.i32(i32 %18, i32 %36)
  %39 = call i32 @llvm.smin.i32(i32 %38, i32 164)
  %40 = trunc i8 %37 to i1
  %41 = select i1 %40, i32 %39, i32 %15
  %42 = icmp slt i32 %41, %18
  %43 = add i32 %41, 165
  %44 = select i1 %42, i32 %43, i32 %41
  br label %45

45:                                               ; preds = %10, %13
  %46 = phi i32 [ %44, %13 ], [ %12, %10 ]
  br label %47

47:                                               ; preds = %45
  ret i32 %46
}

define ptx_kernel void @input_scatter_fusion_31(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(229376) %2, ptr noalias align 256 dereferenceable(32768) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %5
  %9 = call i32 @fused_scatter_31_concatenate_33_5(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 0)
  %10 = call i32 @fused_scatter_31_concatenate_33_5(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 1)
  %11 = icmp ule i32 %9, 4095
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

define internal i32 @fused_scatter_31_concatenate_33_5(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
  %17 = call i32 @llvm.smin.i32(i32 %16, i32 4095)
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

define ptx_kernel void @input_scatter_fusion_29(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(4096) %2, ptr noalias align 256 dereferenceable(4096) %3, ptr noalias align 256 dereferenceable(229376) %4, ptr noalias align 256 dereferenceable(32768) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %9 = mul i32 %8, 128
  %10 = add i32 %9, %7
  %11 = call i32 @fused_scatter_29_concatenate_40_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 0)
  %12 = call i32 @fused_scatter_29_concatenate_40_3(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 1)
  %13 = icmp ule i32 %11, 4095
  %14 = icmp ule i32 %12, 164
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %20

16:                                               ; preds = %6
  %17 = mul i32 %11, 165
  %18 = add i32 %17, %12
  %19 = getelementptr inbounds i8, ptr %0, i32 %18
  store i8 0, ptr %19, align 1
  br label %20

20:                                               ; preds = %16, %6
  ret void
}

define internal i32 @fused_scatter_29_concatenate_40_3(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, i32 %6, i32 %7) {
  %9 = icmp ult i32 %7, 1
  br i1 %9, label %10, label %13

10:                                               ; preds = %8
  %11 = zext i32 %6 to i64
  %12 = trunc i64 %11 to i32
  br label %56

13:                                               ; preds = %8
  %14 = mul i32 %6, 2
  %15 = getelementptr inbounds i32, ptr %5, i32 %14
  %16 = load i32, ptr %15, align 4, !invariant.load !3
  %17 = call i32 @llvm.smin.i32(i32 %16, i32 4095)
  %18 = call i32 @llvm.smax.i32(i32 %17, i32 0)
  %19 = add i32 %14, 1
  %20 = getelementptr inbounds i32, ptr %5, i32 %19
  %21 = load i32, ptr %20, align 4, !invariant.load !3
  %22 = call i32 @llvm.smin.i32(i32 %21, i32 13)
  %23 = call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = mul i32 %18, 14
  %25 = add i32 %24, %23
  %26 = getelementptr inbounds i32, ptr %4, i32 %25
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  %28 = srem i32 %27, 15
  %29 = getelementptr inbounds i32, ptr %1, i32 %6
  %30 = load i32, ptr %29, align 4, !invariant.load !3
  %31 = icmp slt i32 %28, %30
  %32 = icmp ne i32 %28, %30
  %33 = and i1 %31, %32
  %34 = add i32 %28, 15
  %35 = select i1 %33, i32 %34, i32 %28
  %36 = getelementptr inbounds i8, ptr %3, i32 %6
  %37 = load i8, ptr %36, align 1, !invariant.load !3
  %38 = icmp sge i32 %35, 1
  %39 = zext i1 %38 to i8
  %40 = icmp sle i32 %35, 13
  %41 = zext i1 %40 to i8
  %42 = trunc i8 %37 to i1
  %43 = select i1 %42, i32 -1, i32 1
  %44 = getelementptr inbounds i8, ptr %2, i32 %6
  %45 = load i8, ptr %44, align 1, !invariant.load !3
  %46 = select i1 %42, i8 %39, i8 %41
  %47 = add i32 %27, %43
  %48 = and i8 %45, %46
  %49 = call i32 @llvm.smax.i32(i32 %30, i32 %47)
  %50 = call i32 @llvm.smin.i32(i32 %49, i32 164)
  %51 = trunc i8 %48 to i1
  %52 = select i1 %51, i32 %50, i32 %27
  %53 = icmp slt i32 %52, %30
  %54 = add i32 %52, 165
  %55 = select i1 %53, i32 %54, i32 %52
  br label %56

56:                                               ; preds = %10, %13
  %57 = phi i32 [ %55, %13 ], [ %12, %10 ]
  br label %58

58:                                               ; preds = %56
  ret i32 %57
}

define ptx_kernel void @loop_broadcast_fusion_7(ptr noalias align 256 dereferenceable(2703360) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %3, 4
  %5 = mul i32 %2, 512
  %6 = add i32 %4, %5
  %7 = getelementptr inbounds i32, ptr %0, i32 %6
  store <4 x i32> splat (i32 -1), ptr %7, align 16
  ret void
}

define ptx_kernel void @input_scatter_fusion_8(ptr noalias align 256 dereferenceable(2703360) %0, ptr noalias align 256 dereferenceable(458752) %1, ptr noalias align 256 dereferenceable(57344) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %6 = mul i32 %4, 2
  %7 = mul i32 %5, 256
  %8 = add i32 %6, %7
  %9 = getelementptr inbounds i32, ptr %1, i32 %8
  %10 = load i32, ptr %9, align 4, !invariant.load !3
  %11 = add i32 %8, 1
  %12 = getelementptr inbounds i32, ptr %1, i32 %11
  %13 = load i32, ptr %12, align 4, !invariant.load !3
  %14 = icmp ule i32 %10, 4095
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

define ptx_kernel void @input_scatter_fusion_7(ptr noalias align 256 dereferenceable(2703360) %0, ptr noalias align 256 dereferenceable(458752) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(229376) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %8 = mul i32 %6, 2
  %9 = mul i32 %7, 256
  %10 = add i32 %8, %9
  %11 = getelementptr inbounds i32, ptr %1, i32 %10
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  %13 = add i32 %10, 1
  %14 = getelementptr inbounds i32, ptr %1, i32 %13
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  %16 = icmp ule i32 %12, 4095
  %17 = icmp ule i32 %15, 164
  %18 = and i1 %16, %17
  br i1 %18, label %19, label %44

19:                                               ; preds = %5
  %20 = mul i32 %7, 128
  %21 = add i32 %20, %6
  %22 = urem i32 %21, 14
  %23 = getelementptr inbounds i8, ptr %2, i32 %21
  %24 = load i8, ptr %23, align 1, !invariant.load !3
  %25 = getelementptr inbounds i32, ptr %4, i32 %21
  %26 = load i32, ptr %25, align 4, !invariant.load !3
  %27 = call i32 @llvm.smin.i32(i32 %26, i32 100)
  %28 = call i32 @llvm.smax.i32(i32 %27, i32 0)
  %29 = mul i32 %28, 20
  %30 = add i32 %29, 9
  %31 = getelementptr inbounds float, ptr %3, i32 %30
  %32 = load float, ptr %31, align 4, !invariant.load !3
  %33 = fcmp ogt float %32, 0.000000e+00
  %34 = zext i1 %33 to i8
  %35 = and i8 %24, %34
  %36 = zext i32 %22 to i64
  %37 = trunc i64 %36 to i32
  %38 = trunc i8 %35 to i1
  %39 = select i1 %38, i32 %37, i32 -1
  %40 = mul i32 %12, 165
  %41 = add i32 %40, %15
  %42 = getelementptr inbounds i32, ptr %0, i32 %41
  %43 = atomicrmw max ptr %42, i32 %39 monotonic, align 4
  br label %44

44:                                               ; preds = %19, %5
  ret void
}

define ptx_kernel void @loop_and_fusion_1(ptr noalias align 256 dereferenceable(57344) %0, ptr noalias align 256 dereferenceable(2703360) %1, ptr noalias align 256 dereferenceable(16384) %2, ptr noalias align 256 dereferenceable(229376) %3, ptr noalias align 256 dereferenceable(675840) %4) #0 {
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
  %16 = call i32 @llvm.smin.i32(i32 %13, i32 4095)
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
  %27 = getelementptr inbounds i32, ptr %3, i32 %26
  %28 = load i32, ptr %27, align 4, !invariant.load !3
  %29 = getelementptr inbounds i32, ptr %2, i32 %13
  %30 = load i32, ptr %29, align 4, !invariant.load !3
  %31 = icmp ne i32 %28, %30
  %32 = and i1 %15, %31
  %33 = zext i1 %32 to i8
  %34 = getelementptr inbounds i8, ptr %0, i32 %26
  %35 = load i8, ptr %34, align 1, !invariant.load !3
  %36 = and i8 %33, %35
  %37 = insertelement <4 x i8> zeroinitializer, i8 %36, i64 0
  %38 = add i32 %10, 1
  %39 = udiv i32 %38, 165
  %40 = extractelement <4 x i32> %12, i64 1
  %41 = icmp sge i32 %40, 0
  %42 = call i32 @llvm.smin.i32(i32 %39, i32 4095)
  %43 = call i32 @llvm.smax.i32(i32 %42, i32 0)
  %44 = call i32 @llvm.smax.i32(i32 %40, i32 0)
  %45 = call i32 @llvm.smin.i32(i32 %44, i32 13)
  %46 = icmp slt i32 %45, 0
  %47 = add i32 %45, 14
  %48 = select i1 %46, i32 %47, i32 %45
  %49 = call i32 @llvm.smin.i32(i32 %48, i32 13)
  %50 = call i32 @llvm.smax.i32(i32 %49, i32 0)
  %51 = mul i32 %43, 14
  %52 = add i32 %51, %50
  %53 = getelementptr inbounds i32, ptr %3, i32 %52
  %54 = load i32, ptr %53, align 4, !invariant.load !3
  %55 = getelementptr inbounds i32, ptr %2, i32 %39
  %56 = load i32, ptr %55, align 4, !invariant.load !3
  %57 = icmp ne i32 %54, %56
  %58 = and i1 %41, %57
  %59 = zext i1 %58 to i8
  %60 = getelementptr inbounds i8, ptr %0, i32 %52
  %61 = load i8, ptr %60, align 1, !invariant.load !3
  %62 = and i8 %59, %61
  %63 = insertelement <4 x i8> %37, i8 %62, i64 1
  %64 = add i32 %10, 2
  %65 = udiv i32 %64, 165
  %66 = extractelement <4 x i32> %12, i64 2
  %67 = icmp sge i32 %66, 0
  %68 = call i32 @llvm.smin.i32(i32 %65, i32 4095)
  %69 = call i32 @llvm.smax.i32(i32 %68, i32 0)
  %70 = call i32 @llvm.smax.i32(i32 %66, i32 0)
  %71 = call i32 @llvm.smin.i32(i32 %70, i32 13)
  %72 = icmp slt i32 %71, 0
  %73 = add i32 %71, 14
  %74 = select i1 %72, i32 %73, i32 %71
  %75 = call i32 @llvm.smin.i32(i32 %74, i32 13)
  %76 = call i32 @llvm.smax.i32(i32 %75, i32 0)
  %77 = mul i32 %69, 14
  %78 = add i32 %77, %76
  %79 = getelementptr inbounds i32, ptr %3, i32 %78
  %80 = load i32, ptr %79, align 4, !invariant.load !3
  %81 = getelementptr inbounds i32, ptr %2, i32 %65
  %82 = load i32, ptr %81, align 4, !invariant.load !3
  %83 = icmp ne i32 %80, %82
  %84 = and i1 %67, %83
  %85 = zext i1 %84 to i8
  %86 = getelementptr inbounds i8, ptr %0, i32 %78
  %87 = load i8, ptr %86, align 1, !invariant.load !3
  %88 = and i8 %85, %87
  %89 = insertelement <4 x i8> %63, i8 %88, i64 2
  %90 = add i32 %10, 3
  %91 = udiv i32 %90, 165
  %92 = extractelement <4 x i32> %12, i64 3
  %93 = icmp sge i32 %92, 0
  %94 = call i32 @llvm.smin.i32(i32 %91, i32 4095)
  %95 = call i32 @llvm.smax.i32(i32 %94, i32 0)
  %96 = call i32 @llvm.smax.i32(i32 %92, i32 0)
  %97 = call i32 @llvm.smin.i32(i32 %96, i32 13)
  %98 = icmp slt i32 %97, 0
  %99 = add i32 %97, 14
  %100 = select i1 %98, i32 %99, i32 %97
  %101 = call i32 @llvm.smin.i32(i32 %100, i32 13)
  %102 = call i32 @llvm.smax.i32(i32 %101, i32 0)
  %103 = mul i32 %95, 14
  %104 = add i32 %103, %102
  %105 = getelementptr inbounds i32, ptr %3, i32 %104
  %106 = load i32, ptr %105, align 4, !invariant.load !3
  %107 = getelementptr inbounds i32, ptr %2, i32 %91
  %108 = load i32, ptr %107, align 4, !invariant.load !3
  %109 = icmp ne i32 %106, %108
  %110 = and i1 %93, %109
  %111 = zext i1 %110 to i8
  %112 = getelementptr inbounds i8, ptr %0, i32 %104
  %113 = load i8, ptr %112, align 1, !invariant.load !3
  %114 = and i8 %111, %113
  %115 = insertelement <4 x i8> %89, i8 %114, i64 3
  %116 = getelementptr inbounds i8, ptr %4, i32 %10
  store <4 x i8> %115, ptr %116, align 4
  ret void
}

define ptx_kernel void @wrapped_broadcast(ptr noalias align 256 dereferenceable(27225) %0, ptr noalias align 256 dereferenceable(111513600) %1) #0 {
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

define ptx_kernel void @input_and_reduce_fusion(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(111513600) %1, ptr noalias align 256 dereferenceable(16384) %2, ptr noalias align 256 dereferenceable(16384) %3, ptr noalias align 256 dereferenceable(16384) %4, ptr noalias align 256 dereferenceable(16384) %5, ptr noalias align 256 dereferenceable(4096) %6, ptr noalias align 256 dereferenceable(165) %7, ptr noalias align 256 dereferenceable(675840) %8, ptr noalias align 256 dereferenceable(4096) %9, ptr noalias align 256 dereferenceable(4096) %10, ptr noalias align 256 dereferenceable(675840) %11, ptr noalias align 256 dereferenceable(4096) %12, ptr noalias align 256 dereferenceable(4096) %13, ptr noalias align 256 dereferenceable(675840) %14, ptr noalias align 256 dereferenceable(675840) %15) #5 {
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !15
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !16
  %19 = mul i32 %18, 8
  %20 = udiv i32 %17, 32
  %21 = add i32 %19, %20
  %22 = zext i32 %21 to i64
  %23 = trunc i64 %22 to i32
  %24 = call i32 @llvm.smin.i32(i32 %23, i32 4095)
  %25 = call i32 @llvm.smax.i32(i32 %24, i32 0)
  %26 = getelementptr inbounds i32, ptr %2, i32 %21
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  %28 = getelementptr inbounds i32, ptr %3, i32 %21
  %29 = load i32, ptr %28, align 4, !invariant.load !3
  %30 = icmp slt i32 %27, %29
  %31 = add i32 %27, 165
  %32 = select i1 %30, i32 %31, i32 %27
  %33 = call i32 @llvm.smin.i32(i32 %32, i32 164)
  %34 = call i32 @llvm.smax.i32(i32 %33, i32 0)
  %35 = getelementptr inbounds i8, ptr %6, i32 %21
  %36 = load i8, ptr %35, align 1, !invariant.load !3
  %37 = getelementptr inbounds i32, ptr %5, i32 %21
  %38 = load i32, ptr %37, align 4, !invariant.load !3
  %39 = icmp eq i32 %38, 0
  %40 = srem i32 %27, 15
  %41 = icmp slt i32 %40, %29
  %42 = icmp ne i32 %40, %29
  %43 = and i1 %41, %42
  %44 = add i32 %40, 15
  %45 = select i1 %43, i32 %44, i32 %40
  %46 = icmp sge i32 %45, 1
  %47 = zext i1 %46 to i8
  %48 = icmp sle i32 %45, 13
  %49 = zext i1 %48 to i8
  %50 = select i1 %39, i8 %47, i8 %49
  %51 = and i8 %36, %50
  %52 = getelementptr inbounds i32, ptr %4, i32 %21
  %53 = load i32, ptr %52, align 4, !invariant.load !3
  %54 = add i32 %27, %53
  %55 = call i32 @llvm.smax.i32(i32 %29, i32 %54)
  %56 = call i32 @llvm.smin.i32(i32 %55, i32 164)
  %57 = trunc i8 %51 to i1
  %58 = select i1 %57, i32 %56, i32 %27
  %59 = icmp slt i32 %58, %29
  %60 = add i32 %58, 165
  %61 = select i1 %59, i32 %60, i32 %58
  %62 = call i32 @llvm.smin.i32(i32 %61, i32 164)
  %63 = call i32 @llvm.smax.i32(i32 %62, i32 0)
  %64 = icmp eq i8 %36, 0
  %65 = zext i1 %64 to i8
  %66 = getelementptr inbounds i8, ptr %9, i32 %21
  %67 = load i8, ptr %66, align 1, !invariant.load !3
  %68 = trunc i8 %67 to i1
  %69 = select i1 %68, i32 -1, i32 1
  %70 = getelementptr inbounds i8, ptr %10, i32 %21
  %71 = load i8, ptr %70, align 1, !invariant.load !3
  %72 = icmp eq i8 %71, 0
  %73 = zext i1 %72 to i8
  %74 = urem i32 %17, 32
  %75 = mul i32 %25, 27225
  %76 = mul i32 %34, 165
  %77 = add i32 %75, %76
  %78 = add i32 %77, %74
  %79 = getelementptr inbounds i8, ptr %1, i32 %78
  %80 = load i8, ptr %79, align 1, !invariant.load !3
  %81 = mul i32 %20, 165
  %82 = mul i32 %18, 1320
  %83 = add i32 %81, %82
  %84 = add i32 %83, %74
  %85 = getelementptr inbounds i8, ptr %0, i32 %84
  %86 = load i8, ptr %85, align 1, !invariant.load !3
  %87 = and i8 %80, %86
  %88 = call i8 @region_23_2538_or_2537_0(i8 0, i8 %87)
  %89 = mul i32 %63, 165
  %90 = add i32 %75, %89
  %91 = add i32 %90, %74
  %92 = getelementptr inbounds i8, ptr %1, i32 %91
  %93 = load i8, ptr %92, align 1, !invariant.load !3
  %94 = and i8 %93, %86
  %95 = call i8 @region_23_2538_clone_or_1090_0(i8 0, i8 %94)
  %96 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %74)
  %97 = getelementptr inbounds i8, ptr %7, i32 %74
  %98 = load i8, ptr %97, align 1, !invariant.load !3
  %99 = zext i32 %74 to i64
  %100 = trunc i64 %99 to i32
  %101 = srem i32 %100, 15
  %102 = add i32 %101, 15
  %103 = trunc i8 %98 to i1
  %104 = select i1 %103, i32 %102, i32 %101
  %105 = icmp sge i32 %104, 1
  %106 = zext i1 %105 to i8
  %107 = icmp sle i32 %104, 13
  %108 = zext i1 %107 to i8
  %109 = select i1 %39, i8 %106, i8 %108
  %110 = add i32 %100, %53
  %111 = call i32 @llvm.smax.i32(i32 %110, i32 0)
  %112 = call i32 @llvm.smin.i32(i32 %111, i32 164)
  %113 = icmp slt i32 %112, 0
  %114 = add i32 %112, 165
  %115 = select i1 %113, i32 %114, i32 %112
  %116 = call i32 @llvm.smin.i32(i32 %115, i32 164)
  %117 = call i32 @llvm.smax.i32(i32 %116, i32 0)
  %118 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %117)
  %119 = and i8 %109, %118
  %120 = or i8 %65, %119
  %121 = and i8 %96, %120
  %122 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %74)
  %123 = select i1 %68, i8 %106, i8 %108
  %124 = add i32 %100, %69
  %125 = call i32 @llvm.smax.i32(i32 %124, i32 0)
  %126 = call i32 @llvm.smin.i32(i32 %125, i32 164)
  %127 = icmp slt i32 %126, 0
  %128 = add i32 %126, 165
  %129 = select i1 %127, i32 %128, i32 %126
  %130 = call i32 @llvm.smin.i32(i32 %129, i32 164)
  %131 = call i32 @llvm.smax.i32(i32 %130, i32 0)
  %132 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %131)
  %133 = and i8 %123, %132
  %134 = or i8 %73, %133
  %135 = and i8 %122, %134
  %136 = getelementptr inbounds i8, ptr %14, i32 %84
  store i8 %121, ptr %136, align 1
  %137 = getelementptr inbounds i8, ptr %15, i32 %84
  store i8 %135, ptr %137, align 1
  %138 = add i32 %74, 32
  %139 = add i32 %78, 32
  %140 = getelementptr inbounds i8, ptr %1, i32 %139
  %141 = load i8, ptr %140, align 1, !invariant.load !3
  %142 = add i32 %84, 32
  %143 = getelementptr inbounds i8, ptr %0, i32 %142
  %144 = load i8, ptr %143, align 1, !invariant.load !3
  %145 = and i8 %141, %144
  %146 = call i8 @region_23_2538_or_2537_0(i8 %88, i8 %145)
  %147 = add i32 %91, 32
  %148 = getelementptr inbounds i8, ptr %1, i32 %147
  %149 = load i8, ptr %148, align 1, !invariant.load !3
  %150 = and i8 %149, %144
  %151 = call i8 @region_23_2538_clone_or_1090_0(i8 %95, i8 %150)
  %152 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %138)
  %153 = getelementptr inbounds i8, ptr %7, i32 %138
  %154 = load i8, ptr %153, align 1, !invariant.load !3
  %155 = zext i32 %138 to i64
  %156 = trunc i64 %155 to i32
  %157 = srem i32 %156, 15
  %158 = add i32 %157, 15
  %159 = trunc i8 %154 to i1
  %160 = select i1 %159, i32 %158, i32 %157
  %161 = icmp sge i32 %160, 1
  %162 = zext i1 %161 to i8
  %163 = icmp sle i32 %160, 13
  %164 = zext i1 %163 to i8
  %165 = select i1 %39, i8 %162, i8 %164
  %166 = add i32 %156, %53
  %167 = call i32 @llvm.smax.i32(i32 %166, i32 0)
  %168 = call i32 @llvm.smin.i32(i32 %167, i32 164)
  %169 = icmp slt i32 %168, 0
  %170 = add i32 %168, 165
  %171 = select i1 %169, i32 %170, i32 %168
  %172 = call i32 @llvm.smin.i32(i32 %171, i32 164)
  %173 = call i32 @llvm.smax.i32(i32 %172, i32 0)
  %174 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %173)
  %175 = and i8 %165, %174
  %176 = or i8 %65, %175
  %177 = and i8 %152, %176
  %178 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %138)
  %179 = select i1 %68, i8 %162, i8 %164
  %180 = add i32 %156, %69
  %181 = call i32 @llvm.smax.i32(i32 %180, i32 0)
  %182 = call i32 @llvm.smin.i32(i32 %181, i32 164)
  %183 = icmp slt i32 %182, 0
  %184 = add i32 %182, 165
  %185 = select i1 %183, i32 %184, i32 %182
  %186 = call i32 @llvm.smin.i32(i32 %185, i32 164)
  %187 = call i32 @llvm.smax.i32(i32 %186, i32 0)
  %188 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %187)
  %189 = and i8 %179, %188
  %190 = or i8 %73, %189
  %191 = and i8 %178, %190
  %192 = getelementptr inbounds i8, ptr %14, i32 %142
  store i8 %177, ptr %192, align 1
  %193 = getelementptr inbounds i8, ptr %15, i32 %142
  store i8 %191, ptr %193, align 1
  %194 = add i32 %74, 64
  %195 = add i32 %78, 64
  %196 = getelementptr inbounds i8, ptr %1, i32 %195
  %197 = load i8, ptr %196, align 1, !invariant.load !3
  %198 = add i32 %84, 64
  %199 = getelementptr inbounds i8, ptr %0, i32 %198
  %200 = load i8, ptr %199, align 1, !invariant.load !3
  %201 = and i8 %197, %200
  %202 = call i8 @region_23_2538_or_2537_0(i8 %146, i8 %201)
  %203 = add i32 %91, 64
  %204 = getelementptr inbounds i8, ptr %1, i32 %203
  %205 = load i8, ptr %204, align 1, !invariant.load !3
  %206 = and i8 %205, %200
  %207 = call i8 @region_23_2538_clone_or_1090_0(i8 %151, i8 %206)
  %208 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %194)
  %209 = getelementptr inbounds i8, ptr %7, i32 %194
  %210 = load i8, ptr %209, align 1, !invariant.load !3
  %211 = zext i32 %194 to i64
  %212 = trunc i64 %211 to i32
  %213 = srem i32 %212, 15
  %214 = add i32 %213, 15
  %215 = trunc i8 %210 to i1
  %216 = select i1 %215, i32 %214, i32 %213
  %217 = icmp sge i32 %216, 1
  %218 = zext i1 %217 to i8
  %219 = icmp sle i32 %216, 13
  %220 = zext i1 %219 to i8
  %221 = select i1 %39, i8 %218, i8 %220
  %222 = add i32 %212, %53
  %223 = call i32 @llvm.smax.i32(i32 %222, i32 0)
  %224 = call i32 @llvm.smin.i32(i32 %223, i32 164)
  %225 = icmp slt i32 %224, 0
  %226 = add i32 %224, 165
  %227 = select i1 %225, i32 %226, i32 %224
  %228 = call i32 @llvm.smin.i32(i32 %227, i32 164)
  %229 = call i32 @llvm.smax.i32(i32 %228, i32 0)
  %230 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %229)
  %231 = and i8 %221, %230
  %232 = or i8 %65, %231
  %233 = and i8 %208, %232
  %234 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %194)
  %235 = select i1 %68, i8 %218, i8 %220
  %236 = add i32 %212, %69
  %237 = call i32 @llvm.smax.i32(i32 %236, i32 0)
  %238 = call i32 @llvm.smin.i32(i32 %237, i32 164)
  %239 = icmp slt i32 %238, 0
  %240 = add i32 %238, 165
  %241 = select i1 %239, i32 %240, i32 %238
  %242 = call i32 @llvm.smin.i32(i32 %241, i32 164)
  %243 = call i32 @llvm.smax.i32(i32 %242, i32 0)
  %244 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %243)
  %245 = and i8 %235, %244
  %246 = or i8 %73, %245
  %247 = and i8 %234, %246
  %248 = getelementptr inbounds i8, ptr %14, i32 %198
  store i8 %233, ptr %248, align 1
  %249 = getelementptr inbounds i8, ptr %15, i32 %198
  store i8 %247, ptr %249, align 1
  %250 = add i32 %74, 96
  %251 = add i32 %78, 96
  %252 = getelementptr inbounds i8, ptr %1, i32 %251
  %253 = load i8, ptr %252, align 1, !invariant.load !3
  %254 = add i32 %84, 96
  %255 = getelementptr inbounds i8, ptr %0, i32 %254
  %256 = load i8, ptr %255, align 1, !invariant.load !3
  %257 = and i8 %253, %256
  %258 = call i8 @region_23_2538_or_2537_0(i8 %202, i8 %257)
  %259 = add i32 %91, 96
  %260 = getelementptr inbounds i8, ptr %1, i32 %259
  %261 = load i8, ptr %260, align 1, !invariant.load !3
  %262 = and i8 %261, %256
  %263 = call i8 @region_23_2538_clone_or_1090_0(i8 %207, i8 %262)
  %264 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %250)
  %265 = getelementptr inbounds i8, ptr %7, i32 %250
  %266 = load i8, ptr %265, align 1, !invariant.load !3
  %267 = zext i32 %250 to i64
  %268 = trunc i64 %267 to i32
  %269 = srem i32 %268, 15
  %270 = add i32 %269, 15
  %271 = trunc i8 %266 to i1
  %272 = select i1 %271, i32 %270, i32 %269
  %273 = icmp sge i32 %272, 1
  %274 = zext i1 %273 to i8
  %275 = icmp sle i32 %272, 13
  %276 = zext i1 %275 to i8
  %277 = select i1 %39, i8 %274, i8 %276
  %278 = add i32 %268, %53
  %279 = call i32 @llvm.smax.i32(i32 %278, i32 0)
  %280 = call i32 @llvm.smin.i32(i32 %279, i32 164)
  %281 = icmp slt i32 %280, 0
  %282 = add i32 %280, 165
  %283 = select i1 %281, i32 %282, i32 %280
  %284 = call i32 @llvm.smin.i32(i32 %283, i32 164)
  %285 = call i32 @llvm.smax.i32(i32 %284, i32 0)
  %286 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %285)
  %287 = and i8 %277, %286
  %288 = or i8 %65, %287
  %289 = and i8 %264, %288
  %290 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %250)
  %291 = select i1 %68, i8 %274, i8 %276
  %292 = add i32 %268, %69
  %293 = call i32 @llvm.smax.i32(i32 %292, i32 0)
  %294 = call i32 @llvm.smin.i32(i32 %293, i32 164)
  %295 = icmp slt i32 %294, 0
  %296 = add i32 %294, 165
  %297 = select i1 %295, i32 %296, i32 %294
  %298 = call i32 @llvm.smin.i32(i32 %297, i32 164)
  %299 = call i32 @llvm.smax.i32(i32 %298, i32 0)
  %300 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %299)
  %301 = and i8 %291, %300
  %302 = or i8 %73, %301
  %303 = and i8 %290, %302
  %304 = getelementptr inbounds i8, ptr %14, i32 %254
  store i8 %289, ptr %304, align 1
  %305 = getelementptr inbounds i8, ptr %15, i32 %254
  store i8 %303, ptr %305, align 1
  %306 = add i32 %74, 128
  %307 = add i32 %78, 128
  %308 = getelementptr inbounds i8, ptr %1, i32 %307
  %309 = load i8, ptr %308, align 1, !invariant.load !3
  %310 = add i32 %84, 128
  %311 = getelementptr inbounds i8, ptr %0, i32 %310
  %312 = load i8, ptr %311, align 1, !invariant.load !3
  %313 = and i8 %309, %312
  %314 = call i8 @region_23_2538_or_2537_0(i8 %258, i8 %313)
  %315 = add i32 %91, 128
  %316 = getelementptr inbounds i8, ptr %1, i32 %315
  %317 = load i8, ptr %316, align 1, !invariant.load !3
  %318 = and i8 %317, %312
  %319 = call i8 @region_23_2538_clone_or_1090_0(i8 %263, i8 %318)
  %320 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %306)
  %321 = getelementptr inbounds i8, ptr %7, i32 %306
  %322 = load i8, ptr %321, align 1, !invariant.load !3
  %323 = zext i32 %306 to i64
  %324 = trunc i64 %323 to i32
  %325 = srem i32 %324, 15
  %326 = add i32 %325, 15
  %327 = trunc i8 %322 to i1
  %328 = select i1 %327, i32 %326, i32 %325
  %329 = icmp sge i32 %328, 1
  %330 = zext i1 %329 to i8
  %331 = icmp sle i32 %328, 13
  %332 = zext i1 %331 to i8
  %333 = select i1 %39, i8 %330, i8 %332
  %334 = add i32 %324, %53
  %335 = call i32 @llvm.smax.i32(i32 %334, i32 0)
  %336 = call i32 @llvm.smin.i32(i32 %335, i32 164)
  %337 = icmp slt i32 %336, 0
  %338 = add i32 %336, 165
  %339 = select i1 %337, i32 %338, i32 %336
  %340 = call i32 @llvm.smin.i32(i32 %339, i32 164)
  %341 = call i32 @llvm.smax.i32(i32 %340, i32 0)
  %342 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %341)
  %343 = and i8 %333, %342
  %344 = or i8 %65, %343
  %345 = and i8 %320, %344
  %346 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %306)
  %347 = select i1 %68, i8 %330, i8 %332
  %348 = add i32 %324, %69
  %349 = call i32 @llvm.smax.i32(i32 %348, i32 0)
  %350 = call i32 @llvm.smin.i32(i32 %349, i32 164)
  %351 = icmp slt i32 %350, 0
  %352 = add i32 %350, 165
  %353 = select i1 %351, i32 %352, i32 %350
  %354 = call i32 @llvm.smin.i32(i32 %353, i32 164)
  %355 = call i32 @llvm.smax.i32(i32 %354, i32 0)
  %356 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %355)
  %357 = and i8 %347, %356
  %358 = or i8 %73, %357
  %359 = and i8 %346, %358
  %360 = getelementptr inbounds i8, ptr %14, i32 %310
  store i8 %345, ptr %360, align 1
  %361 = getelementptr inbounds i8, ptr %15, i32 %310
  store i8 %359, ptr %361, align 1
  %362 = icmp sle i32 %74, 4
  br i1 %362, label %363, label %466

363:                                              ; preds = %16
  %364 = add i32 %74, 160
  %365 = load i32, ptr %26, align 4, !invariant.load !3
  %366 = load i32, ptr %28, align 4, !invariant.load !3
  %367 = icmp slt i32 %365, %366
  %368 = add i32 %365, 165
  %369 = select i1 %367, i32 %368, i32 %365
  %370 = call i32 @llvm.smin.i32(i32 %369, i32 164)
  %371 = call i32 @llvm.smax.i32(i32 %370, i32 0)
  %372 = add i32 %74, %75
  %373 = mul i32 %371, 165
  %374 = add i32 %372, %373
  %375 = add i32 %374, 160
  %376 = getelementptr inbounds i8, ptr %1, i32 %375
  %377 = load i8, ptr %376, align 1, !invariant.load !3
  %378 = add i32 %84, 160
  %379 = getelementptr inbounds i8, ptr %0, i32 %378
  %380 = load i8, ptr %379, align 1, !invariant.load !3
  %381 = and i8 %377, %380
  %382 = call i8 @region_23_2538_or_2537_0(i8 %314, i8 %381)
  %383 = load i8, ptr %35, align 1, !invariant.load !3
  %384 = load i32, ptr %37, align 4, !invariant.load !3
  %385 = icmp eq i32 %384, 0
  %386 = srem i32 %365, 15
  %387 = icmp slt i32 %386, %366
  %388 = icmp ne i32 %386, %366
  %389 = and i1 %387, %388
  %390 = add i32 %386, 15
  %391 = select i1 %389, i32 %390, i32 %386
  %392 = icmp sge i32 %391, 1
  %393 = zext i1 %392 to i8
  %394 = icmp sle i32 %391, 13
  %395 = zext i1 %394 to i8
  %396 = select i1 %385, i8 %393, i8 %395
  %397 = and i8 %383, %396
  %398 = load i32, ptr %52, align 4, !invariant.load !3
  %399 = add i32 %365, %398
  %400 = call i32 @llvm.smax.i32(i32 %366, i32 %399)
  %401 = call i32 @llvm.smin.i32(i32 %400, i32 164)
  %402 = trunc i8 %397 to i1
  %403 = select i1 %402, i32 %401, i32 %365
  %404 = icmp slt i32 %403, %366
  %405 = add i32 %403, 165
  %406 = select i1 %404, i32 %405, i32 %403
  %407 = call i32 @llvm.smin.i32(i32 %406, i32 164)
  %408 = call i32 @llvm.smax.i32(i32 %407, i32 0)
  %409 = mul i32 %408, 165
  %410 = add i32 %372, %409
  %411 = add i32 %410, 160
  %412 = getelementptr inbounds i8, ptr %1, i32 %411
  %413 = load i8, ptr %412, align 1, !invariant.load !3
  %414 = and i8 %413, %380
  %415 = call i8 @region_23_2538_clone_or_1090_0(i8 %319, i8 %414)
  %416 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %364)
  %417 = getelementptr inbounds i8, ptr %7, i32 %364
  %418 = load i8, ptr %417, align 1, !invariant.load !3
  %419 = zext i32 %364 to i64
  %420 = trunc i64 %419 to i32
  %421 = srem i32 %420, 15
  %422 = add i32 %421, 15
  %423 = trunc i8 %418 to i1
  %424 = select i1 %423, i32 %422, i32 %421
  %425 = icmp sge i32 %424, 1
  %426 = zext i1 %425 to i8
  %427 = icmp sle i32 %424, 13
  %428 = zext i1 %427 to i8
  %429 = select i1 %385, i8 %426, i8 %428
  %430 = add i32 %420, %398
  %431 = call i32 @llvm.smax.i32(i32 %430, i32 0)
  %432 = call i32 @llvm.smin.i32(i32 %431, i32 164)
  %433 = icmp slt i32 %432, 0
  %434 = add i32 %432, 165
  %435 = select i1 %433, i32 %434, i32 %432
  %436 = call i32 @llvm.smin.i32(i32 %435, i32 164)
  %437 = call i32 @llvm.smax.i32(i32 %436, i32 0)
  %438 = call i8 @fused_and_reduce_not_2084_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %437)
  %439 = icmp eq i8 %383, 0
  %440 = zext i1 %439 to i8
  %441 = and i8 %429, %438
  %442 = or i8 %440, %441
  %443 = and i8 %416, %442
  %444 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %21, i32 %364)
  %445 = load i8, ptr %66, align 1, !invariant.load !3
  %446 = trunc i8 %445 to i1
  %447 = select i1 %446, i8 %426, i8 %428
  %448 = select i1 %446, i32 -1, i32 1
  %449 = add i32 %420, %448
  %450 = call i32 @llvm.smax.i32(i32 %449, i32 0)
  %451 = call i32 @llvm.smin.i32(i32 %450, i32 164)
  %452 = icmp slt i32 %451, 0
  %453 = add i32 %451, 165
  %454 = select i1 %452, i32 %453, i32 %451
  %455 = call i32 @llvm.smin.i32(i32 %454, i32 164)
  %456 = call i32 @llvm.smax.i32(i32 %455, i32 0)
  %457 = call i8 @fused_and_reduce_not_3018_1_clone_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, ptr %10, ptr %11, i32 %25, i32 %456)
  %458 = load i8, ptr %70, align 1, !invariant.load !3
  %459 = icmp eq i8 %458, 0
  %460 = zext i1 %459 to i8
  %461 = and i8 %447, %457
  %462 = or i8 %460, %461
  %463 = and i8 %444, %462
  %464 = getelementptr inbounds i8, ptr %14, i32 %378
  store i8 %443, ptr %464, align 1
  %465 = getelementptr inbounds i8, ptr %15, i32 %378
  store i8 %463, ptr %465, align 1
  br label %467

466:                                              ; preds = %16
  br label %467

467:                                              ; preds = %363, %466
  %468 = phi i8 [ %319, %466 ], [ %415, %363 ]
  %469 = phi i8 [ %314, %466 ], [ %382, %363 ]
  br label %470

470:                                              ; preds = %467
  %471 = zext i8 %469 to i32
  %472 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %471, i32 16, i32 31)
  %473 = trunc i32 %472 to i8
  %474 = call i8 @region_23_2538_or_2537_0(i8 %469, i8 %473)
  %475 = zext i8 %474 to i32
  %476 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %475, i32 8, i32 31)
  %477 = trunc i32 %476 to i8
  %478 = call i8 @region_23_2538_or_2537_0(i8 %474, i8 %477)
  %479 = zext i8 %478 to i32
  %480 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %479, i32 4, i32 31)
  %481 = trunc i32 %480 to i8
  %482 = call i8 @region_23_2538_or_2537_0(i8 %478, i8 %481)
  %483 = zext i8 %482 to i32
  %484 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %483, i32 2, i32 31)
  %485 = trunc i32 %484 to i8
  %486 = call i8 @region_23_2538_or_2537_0(i8 %482, i8 %485)
  %487 = zext i8 %486 to i32
  %488 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %487, i32 1, i32 31)
  %489 = trunc i32 %488 to i8
  %490 = call i8 @region_23_2538_or_2537_0(i8 %486, i8 %489)
  %491 = zext i8 %468 to i32
  %492 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %491, i32 16, i32 31)
  %493 = trunc i32 %492 to i8
  %494 = call i8 @region_23_2538_clone_or_1090_0(i8 %468, i8 %493)
  %495 = zext i8 %494 to i32
  %496 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %495, i32 8, i32 31)
  %497 = trunc i32 %496 to i8
  %498 = call i8 @region_23_2538_clone_or_1090_0(i8 %494, i8 %497)
  %499 = zext i8 %498 to i32
  %500 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %499, i32 4, i32 31)
  %501 = trunc i32 %500 to i8
  %502 = call i8 @region_23_2538_clone_or_1090_0(i8 %498, i8 %501)
  %503 = zext i8 %502 to i32
  %504 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %503, i32 2, i32 31)
  %505 = trunc i32 %504 to i8
  %506 = call i8 @region_23_2538_clone_or_1090_0(i8 %502, i8 %505)
  %507 = zext i8 %506 to i32
  %508 = call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %507, i32 1, i32 31)
  %509 = trunc i32 %508 to i8
  %510 = call i8 @region_23_2538_clone_or_1090_0(i8 %506, i8 %509)
  %511 = icmp eq i32 %74, 0
  %512 = icmp sle i32 %17, 224
  %513 = and i1 %511, %512
  br i1 %513, label %514, label %517

514:                                              ; preds = %470
  %515 = getelementptr inbounds i8, ptr %12, i32 %21
  store i8 %490, ptr %515, align 1
  %516 = getelementptr inbounds i8, ptr %13, i32 %21
  store i8 %510, ptr %516, align 1
  br label %517

517:                                              ; preds = %514, %470
  ret void
}

define internal i8 @region_23_2538_or_2537_0(i8 %0, i8 %1) {
  %3 = or i8 %0, %1
  ret i8 %3
}

define internal i8 @region_23_2538_clone_or_1090_0(i8 %0, i8 %1) {
  %3 = or i8 %0, %1
  ret i8 %3
}

define internal i8 @fused_and_reduce_not_2084_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, ptr noalias %11, i32 %12, i32 %13) {
  %15 = mul i32 %12, 165
  %16 = add i32 %15, %13
  %17 = getelementptr inbounds i8, ptr %8, i32 %16
  %18 = load i8, ptr %17, align 1, !invariant.load !3
  %19 = icmp eq i8 %18, 0
  %20 = zext i1 %19 to i8
  ret i8 %20
}

define internal i8 @fused_and_reduce_not_3018_1_clone_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, ptr noalias %10, ptr noalias %11, i32 %12, i32 %13) {
  %15 = mul i32 %12, 165
  %16 = add i32 %15, %13
  %17 = getelementptr inbounds i8, ptr %11, i32 %16
  %18 = load i8, ptr %17, align 1, !invariant.load !3
  %19 = icmp eq i8 %18, 0
  %20 = zext i1 %19 to i8
  ret i8 %20
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #6

define ptx_kernel void @input_scatter_fusion_35(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(16384) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %6 = mul i32 %5, 128
  %7 = add i32 %6, %4
  %8 = call i32 @fused_scatter_35_concatenate_59_3(ptr %0, ptr %1, ptr %2, i32 %7, i32 0)
  %9 = call i32 @fused_scatter_35_concatenate_59_3(ptr %0, ptr %1, ptr %2, i32 %7, i32 1)
  %10 = icmp ule i32 %8, 4095
  %11 = icmp ule i32 %9, 164
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %17

13:                                               ; preds = %3
  %14 = mul i32 %8, 165
  %15 = add i32 %14, %9
  %16 = getelementptr inbounds i8, ptr %0, i32 %15
  store i8 1, ptr %16, align 1
  br label %17

17:                                               ; preds = %13, %3
  ret void
}

define internal i32 @fused_scatter_35_concatenate_59_3(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = icmp ult i32 %4, 1
  br i1 %6, label %7, label %10

7:                                                ; preds = %5
  %8 = zext i32 %3 to i64
  %9 = trunc i64 %8 to i32
  br label %18

10:                                               ; preds = %5
  %11 = getelementptr inbounds i32, ptr %2, i32 %3
  %12 = load i32, ptr %11, align 4, !invariant.load !3
  %13 = getelementptr inbounds i32, ptr %1, i32 %3
  %14 = load i32, ptr %13, align 4, !invariant.load !3
  %15 = icmp slt i32 %14, %12
  %16 = add i32 %14, 165
  %17 = select i1 %15, i32 %16, i32 %14
  br label %18

18:                                               ; preds = %7, %10
  %19 = phi i32 [ %17, %10 ], [ %9, %7 ]
  br label %20

20:                                               ; preds = %18
  ret i32 %19
}

define ptx_kernel void @loop_compare_fusion(ptr noalias align 256 dereferenceable(4) %0, ptr noalias align 256 dereferenceable(1) %1) #7 {
  %3 = load i32, ptr %0, align 4, !invariant.load !3
  %4 = icmp slt i32 %3, 20
  %5 = zext i1 %4 to i8
  store i8 %5, ptr %1, align 1
  ret void
}

define ptx_kernel void @input_reduce_fusion(ptr noalias align 256 dereferenceable(111513600) %0, ptr noalias align 256 dereferenceable(675840) %1, ptr noalias align 256 dereferenceable(675840) %2) #5 {
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

define ptx_kernel void @loop_select_fusion(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(675840) %1, ptr noalias align 256 dereferenceable(675840) %2, ptr noalias align 256 dereferenceable(16384) %3, ptr noalias align 256 dereferenceable(4) %4) #0 {
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

define ptx_kernel void @input_scatter_fusion_33(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(16384) %1, ptr noalias align 256 dereferenceable(229376) %2, ptr noalias align 256 dereferenceable(32768) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %5
  %9 = call i32 @fused_scatter_33_concatenate_33_3(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 0)
  %10 = call i32 @fused_scatter_33_concatenate_33_3(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 1)
  %11 = icmp ule i32 %9, 4095
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

define internal i32 @fused_scatter_33_concatenate_33_3(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
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
  %17 = call i32 @llvm.smin.i32(i32 %16, i32 4095)
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

define ptx_kernel void @loop_select_fusion_4(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias align 256 dereferenceable(4096) %1, ptr noalias align 256 dereferenceable(675840) %2, ptr noalias align 256 dereferenceable(108900) %3, ptr noalias align 256 dereferenceable(16384) %4, ptr noalias align 256 dereferenceable(229376) %5, ptr noalias align 256 dereferenceable(32768) %6, ptr noalias align 256 dereferenceable(8080) %7, ptr noalias align 256 dereferenceable(229376) %8, ptr noalias align 256 dereferenceable(675840) %9, ptr noalias align 256 dereferenceable(675840) %10, ptr noalias align 256 dereferenceable(16384) %11, ptr noalias align 256 dereferenceable(16384) %12, ptr noalias align 256 dereferenceable(4096) %13, ptr noalias align 256 dereferenceable(675840) %14, ptr noalias align 256 dereferenceable(675840) %15) #0 {
  %17 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !12
  %18 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %19 = mul i32 %18, 4
  %20 = mul i32 %17, 512
  %21 = add i32 %19, %20
  %22 = getelementptr inbounds i8, ptr %9, i32 %21
  %23 = load <4 x i8>, ptr %22, align 4, !invariant.load !3
  %24 = getelementptr inbounds i8, ptr %10, i32 %21
  %25 = load <4 x i8>, ptr %24, align 4, !invariant.load !3
  %26 = getelementptr inbounds i8, ptr %0, i32 %21
  %27 = load <4 x i8>, ptr %26, align 4, !invariant.load !3
  %28 = getelementptr inbounds i8, ptr %2, i32 %21
  %29 = load <4 x i8>, ptr %28, align 4, !invariant.load !3
  %30 = udiv i32 %21, 165
  %31 = urem i32 %21, 165
  %32 = mul i32 %30, 2
  %33 = getelementptr inbounds i32, ptr %6, i32 %32
  %34 = load i32, ptr %33, align 4, !invariant.load !3
  %35 = call i32 @llvm.smin.i32(i32 %34, i32 4095)
  %36 = call i32 @llvm.smax.i32(i32 %35, i32 0)
  %37 = add i32 %32, 1
  %38 = getelementptr inbounds i32, ptr %6, i32 %37
  %39 = load i32, ptr %38, align 4, !invariant.load !3
  %40 = call i32 @llvm.smin.i32(i32 %39, i32 13)
  %41 = call i32 @llvm.smax.i32(i32 %40, i32 0)
  %42 = mul i32 %36, 14
  %43 = add i32 %42, %41
  %44 = getelementptr inbounds i32, ptr %5, i32 %43
  %45 = load i32, ptr %44, align 4, !invariant.load !3
  %46 = getelementptr inbounds i32, ptr %4, i32 %30
  %47 = load i32, ptr %46, align 4, !invariant.load !3
  %48 = icmp slt i32 %45, %47
  %49 = add i32 %45, 165
  %50 = select i1 %48, i32 %49, i32 %45
  %51 = call i32 @llvm.smin.i32(i32 %50, i32 164)
  %52 = call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = mul i32 %52, 165
  %54 = add i32 %53, %31
  %55 = getelementptr inbounds i32, ptr %3, i32 %54
  %56 = load i32, ptr %55, align 4, !invariant.load !3
  %57 = getelementptr inbounds i32, ptr %8, i32 %43
  %58 = load i32, ptr %57, align 4, !invariant.load !3
  %59 = call i32 @llvm.smin.i32(i32 %58, i32 100)
  %60 = call i32 @llvm.smax.i32(i32 %59, i32 0)
  %61 = mul i32 %60, 20
  %62 = add i32 %61, 5
  %63 = getelementptr inbounds float, ptr %7, i32 %62
  %64 = load float, ptr %63, align 4, !invariant.load !3
  %65 = fptosi float %64 to i32
  %66 = fcmp ole float %64, 0xC1E0000000000000
  %67 = select i1 %66, i32 -2147483648, i32 %65
  %68 = fcmp oge float %64, 0x41E0000000000000
  %69 = select i1 %68, i32 2147483647, i32 %67
  %70 = fcmp uno float %64, %64
  %71 = select i1 %70, i32 0, i32 %69
  %72 = icmp sle i32 %56, %71
  %73 = zext i1 %72 to i8
  %74 = extractelement <4 x i8> %29, i64 0
  %75 = getelementptr inbounds i8, ptr %1, i32 %30
  %76 = load i8, ptr %75, align 1, !invariant.load !3
  %77 = extractelement <4 x i8> %27, i64 0
  %78 = and i8 %73, %74
  %79 = trunc i8 %76 to i1
  %80 = select i1 %79, i8 %77, i8 %78
  %81 = getelementptr inbounds i32, ptr %12, i32 %30
  %82 = load i32, ptr %81, align 4, !invariant.load !3
  %83 = icmp slt i32 %82, %47
  %84 = add i32 %82, 165
  %85 = select i1 %83, i32 %84, i32 %82
  %86 = call i32 @llvm.smin.i32(i32 %85, i32 164)
  %87 = call i32 @llvm.smax.i32(i32 %86, i32 0)
  %88 = mul i32 %87, 165
  %89 = add i32 %88, %31
  %90 = getelementptr inbounds i32, ptr %3, i32 %89
  %91 = load i32, ptr %90, align 4, !invariant.load !3
  %92 = getelementptr inbounds i32, ptr %11, i32 %30
  %93 = load i32, ptr %92, align 4, !invariant.load !3
  %94 = icmp sle i32 %91, %93
  %95 = zext i1 %94 to i8
  %96 = extractelement <4 x i8> %25, i64 0
  %97 = getelementptr inbounds i8, ptr %13, i32 %30
  %98 = load i8, ptr %97, align 1, !invariant.load !3
  %99 = extractelement <4 x i8> %23, i64 0
  %100 = and i8 %95, %96
  %101 = trunc i8 %98 to i1
  %102 = select i1 %101, i8 %99, i8 %100
  %103 = insertelement <4 x i8> zeroinitializer, i8 %102, i64 0
  %104 = insertelement <4 x i8> zeroinitializer, i8 %80, i64 0
  %105 = add i32 %21, 1
  %106 = udiv i32 %105, 165
  %107 = urem i32 %105, 165
  %108 = mul i32 %106, 2
  %109 = getelementptr inbounds i32, ptr %6, i32 %108
  %110 = load i32, ptr %109, align 4, !invariant.load !3
  %111 = call i32 @llvm.smin.i32(i32 %110, i32 4095)
  %112 = call i32 @llvm.smax.i32(i32 %111, i32 0)
  %113 = add i32 %108, 1
  %114 = getelementptr inbounds i32, ptr %6, i32 %113
  %115 = load i32, ptr %114, align 4, !invariant.load !3
  %116 = call i32 @llvm.smin.i32(i32 %115, i32 13)
  %117 = call i32 @llvm.smax.i32(i32 %116, i32 0)
  %118 = mul i32 %112, 14
  %119 = add i32 %118, %117
  %120 = getelementptr inbounds i32, ptr %5, i32 %119
  %121 = load i32, ptr %120, align 4, !invariant.load !3
  %122 = getelementptr inbounds i32, ptr %4, i32 %106
  %123 = load i32, ptr %122, align 4, !invariant.load !3
  %124 = icmp slt i32 %121, %123
  %125 = add i32 %121, 165
  %126 = select i1 %124, i32 %125, i32 %121
  %127 = call i32 @llvm.smin.i32(i32 %126, i32 164)
  %128 = call i32 @llvm.smax.i32(i32 %127, i32 0)
  %129 = mul i32 %128, 165
  %130 = add i32 %129, %107
  %131 = getelementptr inbounds i32, ptr %3, i32 %130
  %132 = load i32, ptr %131, align 4, !invariant.load !3
  %133 = getelementptr inbounds i32, ptr %8, i32 %119
  %134 = load i32, ptr %133, align 4, !invariant.load !3
  %135 = call i32 @llvm.smin.i32(i32 %134, i32 100)
  %136 = call i32 @llvm.smax.i32(i32 %135, i32 0)
  %137 = mul i32 %136, 20
  %138 = add i32 %137, 5
  %139 = getelementptr inbounds float, ptr %7, i32 %138
  %140 = load float, ptr %139, align 4, !invariant.load !3
  %141 = fptosi float %140 to i32
  %142 = fcmp ole float %140, 0xC1E0000000000000
  %143 = select i1 %142, i32 -2147483648, i32 %141
  %144 = fcmp oge float %140, 0x41E0000000000000
  %145 = select i1 %144, i32 2147483647, i32 %143
  %146 = fcmp uno float %140, %140
  %147 = select i1 %146, i32 0, i32 %145
  %148 = icmp sle i32 %132, %147
  %149 = zext i1 %148 to i8
  %150 = extractelement <4 x i8> %29, i64 1
  %151 = getelementptr inbounds i8, ptr %1, i32 %106
  %152 = load i8, ptr %151, align 1, !invariant.load !3
  %153 = extractelement <4 x i8> %27, i64 1
  %154 = and i8 %149, %150
  %155 = trunc i8 %152 to i1
  %156 = select i1 %155, i8 %153, i8 %154
  %157 = getelementptr inbounds i32, ptr %12, i32 %106
  %158 = load i32, ptr %157, align 4, !invariant.load !3
  %159 = icmp slt i32 %158, %123
  %160 = add i32 %158, 165
  %161 = select i1 %159, i32 %160, i32 %158
  %162 = call i32 @llvm.smin.i32(i32 %161, i32 164)
  %163 = call i32 @llvm.smax.i32(i32 %162, i32 0)
  %164 = mul i32 %163, 165
  %165 = add i32 %164, %107
  %166 = getelementptr inbounds i32, ptr %3, i32 %165
  %167 = load i32, ptr %166, align 4, !invariant.load !3
  %168 = getelementptr inbounds i32, ptr %11, i32 %106
  %169 = load i32, ptr %168, align 4, !invariant.load !3
  %170 = icmp sle i32 %167, %169
  %171 = zext i1 %170 to i8
  %172 = extractelement <4 x i8> %25, i64 1
  %173 = getelementptr inbounds i8, ptr %13, i32 %106
  %174 = load i8, ptr %173, align 1, !invariant.load !3
  %175 = extractelement <4 x i8> %23, i64 1
  %176 = and i8 %171, %172
  %177 = trunc i8 %174 to i1
  %178 = select i1 %177, i8 %175, i8 %176
  %179 = insertelement <4 x i8> %103, i8 %178, i64 1
  %180 = insertelement <4 x i8> %104, i8 %156, i64 1
  %181 = add i32 %21, 2
  %182 = udiv i32 %181, 165
  %183 = urem i32 %181, 165
  %184 = mul i32 %182, 2
  %185 = getelementptr inbounds i32, ptr %6, i32 %184
  %186 = load i32, ptr %185, align 4, !invariant.load !3
  %187 = call i32 @llvm.smin.i32(i32 %186, i32 4095)
  %188 = call i32 @llvm.smax.i32(i32 %187, i32 0)
  %189 = add i32 %184, 1
  %190 = getelementptr inbounds i32, ptr %6, i32 %189
  %191 = load i32, ptr %190, align 4, !invariant.load !3
  %192 = call i32 @llvm.smin.i32(i32 %191, i32 13)
  %193 = call i32 @llvm.smax.i32(i32 %192, i32 0)
  %194 = mul i32 %188, 14
  %195 = add i32 %194, %193
  %196 = getelementptr inbounds i32, ptr %5, i32 %195
  %197 = load i32, ptr %196, align 4, !invariant.load !3
  %198 = getelementptr inbounds i32, ptr %4, i32 %182
  %199 = load i32, ptr %198, align 4, !invariant.load !3
  %200 = icmp slt i32 %197, %199
  %201 = add i32 %197, 165
  %202 = select i1 %200, i32 %201, i32 %197
  %203 = call i32 @llvm.smin.i32(i32 %202, i32 164)
  %204 = call i32 @llvm.smax.i32(i32 %203, i32 0)
  %205 = mul i32 %204, 165
  %206 = add i32 %205, %183
  %207 = getelementptr inbounds i32, ptr %3, i32 %206
  %208 = load i32, ptr %207, align 4, !invariant.load !3
  %209 = getelementptr inbounds i32, ptr %8, i32 %195
  %210 = load i32, ptr %209, align 4, !invariant.load !3
  %211 = call i32 @llvm.smin.i32(i32 %210, i32 100)
  %212 = call i32 @llvm.smax.i32(i32 %211, i32 0)
  %213 = mul i32 %212, 20
  %214 = add i32 %213, 5
  %215 = getelementptr inbounds float, ptr %7, i32 %214
  %216 = load float, ptr %215, align 4, !invariant.load !3
  %217 = fptosi float %216 to i32
  %218 = fcmp ole float %216, 0xC1E0000000000000
  %219 = select i1 %218, i32 -2147483648, i32 %217
  %220 = fcmp oge float %216, 0x41E0000000000000
  %221 = select i1 %220, i32 2147483647, i32 %219
  %222 = fcmp uno float %216, %216
  %223 = select i1 %222, i32 0, i32 %221
  %224 = icmp sle i32 %208, %223
  %225 = zext i1 %224 to i8
  %226 = extractelement <4 x i8> %29, i64 2
  %227 = getelementptr inbounds i8, ptr %1, i32 %182
  %228 = load i8, ptr %227, align 1, !invariant.load !3
  %229 = extractelement <4 x i8> %27, i64 2
  %230 = and i8 %225, %226
  %231 = trunc i8 %228 to i1
  %232 = select i1 %231, i8 %229, i8 %230
  %233 = getelementptr inbounds i32, ptr %12, i32 %182
  %234 = load i32, ptr %233, align 4, !invariant.load !3
  %235 = icmp slt i32 %234, %199
  %236 = add i32 %234, 165
  %237 = select i1 %235, i32 %236, i32 %234
  %238 = call i32 @llvm.smin.i32(i32 %237, i32 164)
  %239 = call i32 @llvm.smax.i32(i32 %238, i32 0)
  %240 = mul i32 %239, 165
  %241 = add i32 %240, %183
  %242 = getelementptr inbounds i32, ptr %3, i32 %241
  %243 = load i32, ptr %242, align 4, !invariant.load !3
  %244 = getelementptr inbounds i32, ptr %11, i32 %182
  %245 = load i32, ptr %244, align 4, !invariant.load !3
  %246 = icmp sle i32 %243, %245
  %247 = zext i1 %246 to i8
  %248 = extractelement <4 x i8> %25, i64 2
  %249 = getelementptr inbounds i8, ptr %13, i32 %182
  %250 = load i8, ptr %249, align 1, !invariant.load !3
  %251 = extractelement <4 x i8> %23, i64 2
  %252 = and i8 %247, %248
  %253 = trunc i8 %250 to i1
  %254 = select i1 %253, i8 %251, i8 %252
  %255 = insertelement <4 x i8> %179, i8 %254, i64 2
  %256 = insertelement <4 x i8> %180, i8 %232, i64 2
  %257 = add i32 %21, 3
  %258 = udiv i32 %257, 165
  %259 = urem i32 %257, 165
  %260 = mul i32 %258, 2
  %261 = getelementptr inbounds i32, ptr %6, i32 %260
  %262 = load i32, ptr %261, align 4, !invariant.load !3
  %263 = call i32 @llvm.smin.i32(i32 %262, i32 4095)
  %264 = call i32 @llvm.smax.i32(i32 %263, i32 0)
  %265 = add i32 %260, 1
  %266 = getelementptr inbounds i32, ptr %6, i32 %265
  %267 = load i32, ptr %266, align 4, !invariant.load !3
  %268 = call i32 @llvm.smin.i32(i32 %267, i32 13)
  %269 = call i32 @llvm.smax.i32(i32 %268, i32 0)
  %270 = mul i32 %264, 14
  %271 = add i32 %270, %269
  %272 = getelementptr inbounds i32, ptr %5, i32 %271
  %273 = load i32, ptr %272, align 4, !invariant.load !3
  %274 = getelementptr inbounds i32, ptr %4, i32 %258
  %275 = load i32, ptr %274, align 4, !invariant.load !3
  %276 = icmp slt i32 %273, %275
  %277 = add i32 %273, 165
  %278 = select i1 %276, i32 %277, i32 %273
  %279 = call i32 @llvm.smin.i32(i32 %278, i32 164)
  %280 = call i32 @llvm.smax.i32(i32 %279, i32 0)
  %281 = mul i32 %280, 165
  %282 = add i32 %281, %259
  %283 = getelementptr inbounds i32, ptr %3, i32 %282
  %284 = load i32, ptr %283, align 4, !invariant.load !3
  %285 = getelementptr inbounds i32, ptr %8, i32 %271
  %286 = load i32, ptr %285, align 4, !invariant.load !3
  %287 = call i32 @llvm.smin.i32(i32 %286, i32 100)
  %288 = call i32 @llvm.smax.i32(i32 %287, i32 0)
  %289 = mul i32 %288, 20
  %290 = add i32 %289, 5
  %291 = getelementptr inbounds float, ptr %7, i32 %290
  %292 = load float, ptr %291, align 4, !invariant.load !3
  %293 = fptosi float %292 to i32
  %294 = fcmp ole float %292, 0xC1E0000000000000
  %295 = select i1 %294, i32 -2147483648, i32 %293
  %296 = fcmp oge float %292, 0x41E0000000000000
  %297 = select i1 %296, i32 2147483647, i32 %295
  %298 = fcmp uno float %292, %292
  %299 = select i1 %298, i32 0, i32 %297
  %300 = icmp sle i32 %284, %299
  %301 = zext i1 %300 to i8
  %302 = extractelement <4 x i8> %29, i64 3
  %303 = getelementptr inbounds i8, ptr %1, i32 %258
  %304 = load i8, ptr %303, align 1, !invariant.load !3
  %305 = extractelement <4 x i8> %27, i64 3
  %306 = and i8 %301, %302
  %307 = trunc i8 %304 to i1
  %308 = select i1 %307, i8 %305, i8 %306
  %309 = getelementptr inbounds i32, ptr %12, i32 %258
  %310 = load i32, ptr %309, align 4, !invariant.load !3
  %311 = icmp slt i32 %310, %275
  %312 = add i32 %310, 165
  %313 = select i1 %311, i32 %312, i32 %310
  %314 = call i32 @llvm.smin.i32(i32 %313, i32 164)
  %315 = call i32 @llvm.smax.i32(i32 %314, i32 0)
  %316 = mul i32 %315, 165
  %317 = add i32 %316, %259
  %318 = getelementptr inbounds i32, ptr %3, i32 %317
  %319 = load i32, ptr %318, align 4, !invariant.load !3
  %320 = getelementptr inbounds i32, ptr %11, i32 %258
  %321 = load i32, ptr %320, align 4, !invariant.load !3
  %322 = icmp sle i32 %319, %321
  %323 = zext i1 %322 to i8
  %324 = extractelement <4 x i8> %25, i64 3
  %325 = getelementptr inbounds i8, ptr %13, i32 %258
  %326 = load i8, ptr %325, align 1, !invariant.load !3
  %327 = extractelement <4 x i8> %23, i64 3
  %328 = and i8 %323, %324
  %329 = trunc i8 %326 to i1
  %330 = select i1 %329, i8 %327, i8 %328
  %331 = insertelement <4 x i8> %255, i8 %330, i64 3
  %332 = insertelement <4 x i8> %256, i8 %308, i64 3
  %333 = getelementptr inbounds i8, ptr %14, i32 %21
  store <4 x i8> %332, ptr %333, align 4
  %334 = getelementptr inbounds i8, ptr %15, i32 %21
  store <4 x i8> %331, ptr %334, align 4
  ret void
}

define ptx_kernel void @loop_broadcast_fusion_2(ptr noalias align 256 dereferenceable(5414912) %0, ptr noalias align 256 dereferenceable(5414912) %1) #0 {
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

define ptx_kernel void @input_scatter_fusion_9(ptr noalias align 256 dereferenceable(5414912) %0, ptr noalias align 256 dereferenceable(675840) %1, ptr noalias align 256 dereferenceable(16384) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !19
  %6 = mul i32 %5, 128
  %7 = add i32 %6, %4
  %8 = call i32 @fused_scatter_9_bitcast_165_1(ptr %0, ptr %1, ptr %2, i32 %7, i32 0)
  %9 = call i32 @fused_scatter_9_bitcast_165_1(ptr %0, ptr %1, ptr %2, i32 %7, i32 1)
  %10 = icmp ule i32 %8, 4095
  %11 = icmp ule i32 %9, 1321
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %48

13:                                               ; preds = %3
  %14 = udiv i32 %7, 165
  %15 = urem i32 %7, 165
  %16 = zext i32 %15 to i64
  %17 = trunc i64 %16 to i32
  %18 = getelementptr inbounds i32, ptr %2, i32 %14
  %19 = load i32, ptr %18, align 4, !invariant.load !3
  %20 = getelementptr inbounds i8, ptr %1, i32 %7
  %21 = load i8, ptr %20, align 1, !invariant.load !3
  %22 = icmp ne i32 %17, %19
  %23 = zext i1 %22 to i8
  %24 = and i8 %21, %23
  %25 = mul i32 %8, 1322
  %26 = add i32 %25, %9
  %27 = getelementptr inbounds i8, ptr %0, i32 %26
  %28 = ptrtoint ptr %27 to i64
  %29 = and i64 %28, 3
  %30 = mul i64 %29, -1
  %31 = getelementptr inbounds i8, ptr %27, i64 %30
  %32 = trunc i64 %29 to i32
  %33 = mul i32 %32, 8
  %34 = shl i32 255, %33
  %35 = xor i32 -1, %34
  %36 = load i32, ptr %31, align 4
  %37 = zext i8 %24 to i32
  %38 = shl i32 %37, %33
  br label %39

39:                                               ; preds = %39, %13
  %40 = phi i32 [ %44, %39 ], [ %36, %13 ]
  %41 = and i32 %40, %35
  %42 = or i32 %41, %38
  %43 = cmpxchg ptr %31, i32 %40, i32 %42 monotonic monotonic, align 4
  %44 = extractvalue { i32, i1 } %43, 0
  %45 = extractvalue { i32, i1 } %43, 1
  %46 = xor i1 %45, true
  br i1 %46, label %39, label %47

47:                                               ; preds = %39
  br label %48

48:                                               ; preds = %47, %3
  ret void
}

define internal i32 @fused_scatter_9_bitcast_165_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, i32 %3, i32 %4) {
  %6 = udiv i32 %3, 165
  %7 = urem i32 %3, 165
  %8 = icmp ult i32 %4, 1
  br i1 %8, label %9, label %12

9:                                                ; preds = %5
  %10 = zext i32 %6 to i64
  %11 = trunc i64 %10 to i32
  br label %19

12:                                               ; preds = %5
  %13 = zext i32 %7 to i64
  %14 = trunc i64 %13 to i32
  %15 = mul i32 %14, 8
  %16 = icmp slt i32 %15, 0
  %17 = add i32 %15, 1322
  %18 = select i1 %16, i32 %17, i32 %15
  br label %19

19:                                               ; preds = %9, %12
  %20 = phi i32 [ %18, %12 ], [ %11, %9 ]
  br label %21

21:                                               ; preds = %19
  ret i32 %20
}

define ptx_kernel void @input_scatter_fusion_6(ptr noalias align 256 dereferenceable(5414912) %0, ptr noalias align 256 dereferenceable(660) %1, ptr noalias align 256 dereferenceable(675840) %2, ptr noalias align 256 dereferenceable(660) %3, ptr noalias align 256 dereferenceable(675840) %4, ptr noalias align 256 dereferenceable(165) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !19
  %9 = mul i32 %8, 128
  %10 = add i32 %9, %7
  %11 = call i32 @fused_scatter_6_bitcast_180_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 0)
  %12 = call i32 @fused_scatter_6_bitcast_180_1(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, i32 %10, i32 1)
  %13 = icmp ule i32 %11, 4095
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
  %26 = call i32 @llvm.smin.i32(i32 %25, i32 4095)
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

define ptx_kernel void @loop_and_fusion(ptr noalias align 256 dereferenceable(8080) %0, ptr noalias align 256 dereferenceable(229376) %1, ptr noalias align 256 dereferenceable(4096) %2, ptr noalias align 256 dereferenceable(4096) %3, ptr noalias align 256 dereferenceable(16384) %4, ptr noalias align 256 dereferenceable(16384) %5, ptr noalias align 256 dereferenceable(4096) %6) #0 {
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %10 = mul i32 %8, 128
  %11 = add i32 %10, %9
  %12 = getelementptr inbounds i8, ptr %2, i32 %11
  %13 = load i8, ptr %12, align 1, !invariant.load !3
  %14 = getelementptr inbounds i8, ptr %3, i32 %11
  %15 = load i8, ptr %14, align 1, !invariant.load !3
  %16 = or i8 %13, %15
  %17 = call i32 @llvm.smin.i32(i32 %11, i32 4095)
  %18 = call i32 @llvm.smax.i32(i32 %17, i32 0)
  %19 = getelementptr inbounds i32, ptr %4, i32 %11
  %20 = load i32, ptr %19, align 4, !invariant.load !3
  %21 = getelementptr inbounds i32, ptr %5, i32 %11
  %22 = load i32, ptr %21, align 4, !invariant.load !3
  %23 = icmp slt i32 %20, %22
  %24 = add i32 %20, 14
  %25 = select i1 %23, i32 %24, i32 %20
  %26 = call i32 @llvm.smin.i32(i32 %25, i32 13)
  %27 = call i32 @llvm.smax.i32(i32 %26, i32 0)
  %28 = mul i32 %18, 14
  %29 = add i32 %28, %27
  %30 = getelementptr inbounds i32, ptr %1, i32 %29
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = call i32 @llvm.smin.i32(i32 %31, i32 100)
  %33 = call i32 @llvm.smax.i32(i32 %32, i32 0)
  %34 = mul i32 %33, 20
  %35 = add i32 %34, 12
  %36 = getelementptr inbounds float, ptr %0, i32 %35
  %37 = load float, ptr %36, align 4, !invariant.load !3
  %38 = fptosi float %37 to i32
  %39 = fcmp ole float %37, 0xC1E0000000000000
  %40 = select i1 %39, i32 -2147483648, i32 %38
  %41 = fcmp oge float %37, 0x41E0000000000000
  %42 = select i1 %41, i32 2147483647, i32 %40
  %43 = fcmp uno float %37, %37
  %44 = select i1 %43, i32 0, i32 %42
  %45 = icmp sgt i32 %44, 0
  %46 = icmp eq i8 %16, 0
  %47 = and i1 %45, %46
  %48 = zext i1 %47 to i8
  %49 = getelementptr inbounds i8, ptr %6, i32 %11
  store i8 %48, ptr %49, align 1
  ret void
}

define ptx_kernel void @input_scatter_fusion(ptr noalias align 256 dereferenceable(5414912) %0, ptr noalias align 256 dereferenceable(660) %1, ptr noalias align 256 dereferenceable(675840) %2, ptr noalias align 256 dereferenceable(4096) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !19
  %7 = mul i32 %6, 128
  %8 = add i32 %7, %5
  %9 = call i32 @fused_scatter_bitcast_212_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 0)
  %10 = call i32 @fused_scatter_bitcast_212_1(ptr %0, ptr %1, ptr %2, ptr %3, i32 %8, i32 1)
  %11 = icmp ule i32 %9, 4095
  %12 = icmp ule i32 %10, 1321
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %44

14:                                               ; preds = %4
  %15 = udiv i32 %8, 165
  %16 = getelementptr inbounds i8, ptr %3, i32 %15
  %17 = load i8, ptr %16, align 1, !invariant.load !3
  %18 = getelementptr inbounds i8, ptr %2, i32 %8
  %19 = load i8, ptr %18, align 1, !invariant.load !3
  %20 = and i8 %17, %19
  %21 = mul i32 %9, 1322
  %22 = add i32 %21, %10
  %23 = getelementptr inbounds i8, ptr %0, i32 %22
  %24 = ptrtoint ptr %23 to i64
  %25 = and i64 %24, 3
  %26 = mul i64 %25, -1
  %27 = getelementptr inbounds i8, ptr %23, i64 %26
  %28 = trunc i64 %25 to i32
  %29 = mul i32 %28, 8
  %30 = shl i32 255, %29
  %31 = xor i32 -1, %30
  %32 = load i32, ptr %27, align 4
  %33 = zext i8 %20 to i32
  %34 = shl i32 %33, %29
  br label %35

35:                                               ; preds = %35, %14
  %36 = phi i32 [ %40, %35 ], [ %32, %14 ]
  %37 = and i32 %36, %31
  %38 = or i32 %37, %34
  %39 = cmpxchg ptr %27, i32 %36, i32 %38 monotonic monotonic, align 4
  %40 = extractvalue { i32, i1 } %39, 0
  %41 = extractvalue { i32, i1 } %39, 1
  %42 = xor i1 %41, true
  br i1 %42, label %35, label %43

43:                                               ; preds = %35
  br label %44

44:                                               ; preds = %43, %4
  ret void
}

define internal i32 @fused_scatter_bitcast_212_1(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, i32 %4, i32 %5) {
  %7 = udiv i32 %4, 165
  %8 = urem i32 %4, 165
  %9 = icmp ult i32 %5, 1
  br i1 %9, label %10, label %13

10:                                               ; preds = %6
  %11 = zext i32 %7 to i64
  %12 = trunc i64 %11 to i32
  br label %16

13:                                               ; preds = %6
  %14 = getelementptr inbounds i32, ptr %1, i32 %8
  %15 = load i32, ptr %14, align 4, !invariant.load !3
  br label %16

16:                                               ; preds = %10, %13
  %17 = phi i32 [ %15, %13 ], [ %12, %10 ]
  br label %18

18:                                               ; preds = %16
  ret i32 %17
}

define ptx_kernel void @loop_broadcast_fusion_4(ptr noalias align 256 dereferenceable(57344) %0, ptr noalias align 256 dereferenceable(57344) %1, ptr noalias align 256 dereferenceable(57344) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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

define ptx_kernel void @loop_select_fusion_2(ptr noalias align 256 dereferenceable(5414912) %0, ptr noalias align 256 dereferenceable(4096) %1, ptr noalias align 256 dereferenceable(5414912) %2, ptr noalias align 256 dereferenceable(57344) %3, ptr noalias align 256 dereferenceable(16384) %4, ptr noalias align 256 dereferenceable(16384) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !18
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %9 = mul i32 %8, 4
  %10 = mul i32 %7, 512
  %11 = add i32 %9, %10
  %12 = getelementptr inbounds i8, ptr %0, i32 %11
  %13 = load <4 x i8>, ptr %12, align 4
  %14 = mul i32 %8, 2
  %15 = mul i32 %7, 256
  %16 = add i32 %14, %15
  %17 = udiv i32 %16, 661
  %18 = urem i32 %11, 1322
  %19 = getelementptr inbounds i8, ptr %1, i32 %17
  %20 = load i8, ptr %19, align 1, !invariant.load !3
  %21 = icmp sge i32 %18, 1321
  br i1 %21, label %22, label %23

22:                                               ; preds = %6
  br label %51

23:                                               ; preds = %6
  %24 = icmp sge i32 %18, 1320
  %25 = icmp slt i32 %18, 1321
  %26 = and i1 %24, %25
  br i1 %26, label %27, label %45

27:                                               ; preds = %23
  %28 = call i32 @llvm.smin.i32(i32 %17, i32 4095)
  %29 = call i32 @llvm.smax.i32(i32 %28, i32 0)
  %30 = getelementptr inbounds i32, ptr %4, i32 %17
  %31 = load i32, ptr %30, align 4, !invariant.load !3
  %32 = getelementptr inbounds i32, ptr %5, i32 %17
  %33 = load i32, ptr %32, align 4, !invariant.load !3
  %34 = icmp slt i32 %31, %33
  %35 = add i32 %31, 14
  %36 = select i1 %34, i32 %35, i32 %31
  %37 = call i32 @llvm.smin.i32(i32 %36, i32 13)
  %38 = call i32 @llvm.smax.i32(i32 %37, i32 0)
  %39 = mul i32 %29, 14
  %40 = add i32 %39, %38
  %41 = getelementptr inbounds i8, ptr %3, i32 %40
  %42 = load i8, ptr %41, align 1, !invariant.load !3
  %43 = icmp eq i8 %42, 0
  %44 = zext i1 %43 to i8
  br label %48

45:                                               ; preds = %23
  %46 = getelementptr inbounds i8, ptr %2, i32 %11
  %47 = load i8, ptr %46, align 1, !invariant.load !3
  br label %48

48:                                               ; preds = %27, %45
  %49 = phi i8 [ %47, %45 ], [ %44, %27 ]
  br label %50

50:                                               ; preds = %48
  br label %51

51:                                               ; preds = %22, %50
  %52 = phi i8 [ %49, %50 ], [ 1, %22 ]
  br label %53

53:                                               ; preds = %51
  %54 = extractelement <4 x i8> %13, i64 0
  %55 = trunc i8 %20 to i1
  %56 = select i1 %55, i8 %52, i8 %54
  %57 = insertelement <4 x i8> zeroinitializer, i8 %56, i64 0
  %58 = add i32 %11, 1
  %59 = urem i32 %58, 1322
  %60 = icmp sge i32 %59, 1321
  br i1 %60, label %61, label %62

61:                                               ; preds = %53
  br label %90

62:                                               ; preds = %53
  %63 = icmp sge i32 %59, 1320
  %64 = icmp slt i32 %59, 1321
  %65 = and i1 %63, %64
  br i1 %65, label %66, label %84

66:                                               ; preds = %62
  %67 = call i32 @llvm.smin.i32(i32 %17, i32 4095)
  %68 = call i32 @llvm.smax.i32(i32 %67, i32 0)
  %69 = getelementptr inbounds i32, ptr %4, i32 %17
  %70 = load i32, ptr %69, align 4, !invariant.load !3
  %71 = getelementptr inbounds i32, ptr %5, i32 %17
  %72 = load i32, ptr %71, align 4, !invariant.load !3
  %73 = icmp slt i32 %70, %72
  %74 = add i32 %70, 14
  %75 = select i1 %73, i32 %74, i32 %70
  %76 = call i32 @llvm.smin.i32(i32 %75, i32 13)
  %77 = call i32 @llvm.smax.i32(i32 %76, i32 0)
  %78 = mul i32 %68, 14
  %79 = add i32 %78, %77
  %80 = getelementptr inbounds i8, ptr %3, i32 %79
  %81 = load i8, ptr %80, align 1, !invariant.load !3
  %82 = icmp eq i8 %81, 0
  %83 = zext i1 %82 to i8
  br label %87

84:                                               ; preds = %62
  %85 = getelementptr inbounds i8, ptr %2, i32 %58
  %86 = load i8, ptr %85, align 1, !invariant.load !3
  br label %87

87:                                               ; preds = %66, %84
  %88 = phi i8 [ %86, %84 ], [ %83, %66 ]
  br label %89

89:                                               ; preds = %87
  br label %90

90:                                               ; preds = %61, %89
  %91 = phi i8 [ %88, %89 ], [ 1, %61 ]
  br label %92

92:                                               ; preds = %90
  %93 = extractelement <4 x i8> %13, i64 1
  %94 = select i1 %55, i8 %91, i8 %93
  %95 = insertelement <4 x i8> %57, i8 %94, i64 1
  %96 = add i32 %16, 1
  %97 = udiv i32 %96, 661
  %98 = add i32 %11, 2
  %99 = urem i32 %98, 1322
  %100 = getelementptr inbounds i8, ptr %1, i32 %97
  %101 = load i8, ptr %100, align 1, !invariant.load !3
  %102 = icmp sge i32 %99, 1321
  br i1 %102, label %103, label %104

103:                                              ; preds = %92
  br label %132

104:                                              ; preds = %92
  %105 = icmp sge i32 %99, 1320
  %106 = icmp slt i32 %99, 1321
  %107 = and i1 %105, %106
  br i1 %107, label %108, label %126

108:                                              ; preds = %104
  %109 = call i32 @llvm.smin.i32(i32 %97, i32 4095)
  %110 = call i32 @llvm.smax.i32(i32 %109, i32 0)
  %111 = getelementptr inbounds i32, ptr %4, i32 %97
  %112 = load i32, ptr %111, align 4, !invariant.load !3
  %113 = getelementptr inbounds i32, ptr %5, i32 %97
  %114 = load i32, ptr %113, align 4, !invariant.load !3
  %115 = icmp slt i32 %112, %114
  %116 = add i32 %112, 14
  %117 = select i1 %115, i32 %116, i32 %112
  %118 = call i32 @llvm.smin.i32(i32 %117, i32 13)
  %119 = call i32 @llvm.smax.i32(i32 %118, i32 0)
  %120 = mul i32 %110, 14
  %121 = add i32 %120, %119
  %122 = getelementptr inbounds i8, ptr %3, i32 %121
  %123 = load i8, ptr %122, align 1, !invariant.load !3
  %124 = icmp eq i8 %123, 0
  %125 = zext i1 %124 to i8
  br label %129

126:                                              ; preds = %104
  %127 = getelementptr inbounds i8, ptr %2, i32 %98
  %128 = load i8, ptr %127, align 1, !invariant.load !3
  br label %129

129:                                              ; preds = %108, %126
  %130 = phi i8 [ %128, %126 ], [ %125, %108 ]
  br label %131

131:                                              ; preds = %129
  br label %132

132:                                              ; preds = %103, %131
  %133 = phi i8 [ %130, %131 ], [ 1, %103 ]
  br label %134

134:                                              ; preds = %132
  %135 = extractelement <4 x i8> %13, i64 2
  %136 = trunc i8 %101 to i1
  %137 = select i1 %136, i8 %133, i8 %135
  %138 = insertelement <4 x i8> %95, i8 %137, i64 2
  %139 = add i32 %11, 3
  %140 = udiv i32 %139, 1322
  %141 = urem i32 %139, 1322
  %142 = getelementptr inbounds i8, ptr %1, i32 %140
  %143 = load i8, ptr %142, align 1, !invariant.load !3
  %144 = icmp sge i32 %141, 1321
  br i1 %144, label %145, label %146

145:                                              ; preds = %134
  br label %174

146:                                              ; preds = %134
  %147 = icmp sge i32 %141, 1320
  %148 = icmp slt i32 %141, 1321
  %149 = and i1 %147, %148
  br i1 %149, label %150, label %168

150:                                              ; preds = %146
  %151 = call i32 @llvm.smin.i32(i32 %140, i32 4095)
  %152 = call i32 @llvm.smax.i32(i32 %151, i32 0)
  %153 = getelementptr inbounds i32, ptr %4, i32 %140
  %154 = load i32, ptr %153, align 4, !invariant.load !3
  %155 = getelementptr inbounds i32, ptr %5, i32 %140
  %156 = load i32, ptr %155, align 4, !invariant.load !3
  %157 = icmp slt i32 %154, %156
  %158 = add i32 %154, 14
  %159 = select i1 %157, i32 %158, i32 %154
  %160 = call i32 @llvm.smin.i32(i32 %159, i32 13)
  %161 = call i32 @llvm.smax.i32(i32 %160, i32 0)
  %162 = mul i32 %152, 14
  %163 = add i32 %162, %161
  %164 = getelementptr inbounds i8, ptr %3, i32 %163
  %165 = load i8, ptr %164, align 1, !invariant.load !3
  %166 = icmp eq i8 %165, 0
  %167 = zext i1 %166 to i8
  br label %171

168:                                              ; preds = %146
  %169 = getelementptr inbounds i8, ptr %2, i32 %139
  %170 = load i8, ptr %169, align 1, !invariant.load !3
  br label %171

171:                                              ; preds = %150, %168
  %172 = phi i8 [ %170, %168 ], [ %167, %150 ]
  br label %173

173:                                              ; preds = %171
  br label %174

174:                                              ; preds = %145, %173
  %175 = phi i8 [ %172, %173 ], [ 1, %145 ]
  br label %176

176:                                              ; preds = %174
  %177 = extractelement <4 x i8> %13, i64 3
  %178 = trunc i8 %143 to i1
  %179 = select i1 %178, i8 %175, i8 %177
  %180 = insertelement <4 x i8> %138, i8 %179, i64 3
  store <4 x i8> %180, ptr %12, align 4
  ret void
}

define ptx_kernel void @loop_transpose_fusion_3(ptr noalias align 256 dereferenceable(229376) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(688128) %2, ptr noalias align 256 dereferenceable(688128) %3, ptr noalias align 256 dereferenceable(688128) %4, ptr noalias align 256 dereferenceable(688128) %5, ptr noalias align 256 dereferenceable(688128) %6, ptr noalias align 256 dereferenceable(688128) %7, ptr noalias align 256 dereferenceable(688128) %8) #0 {
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = mul i32 %11, 4
  %13 = mul i32 %10, 512
  %14 = add i32 %12, %13
  %15 = udiv i32 %14, 3
  %16 = urem i32 %14, 3
  %17 = mul i32 %11, 2
  %18 = mul i32 %10, 256
  %19 = add i32 %17, %18
  %20 = udiv i32 %19, 21
  %21 = icmp ult i32 %16, 1
  br i1 %21, label %22, label %23

22:                                               ; preds = %9
  br label %42

23:                                               ; preds = %9
  %24 = icmp ult i32 %16, 2
  br i1 %24, label %25, label %31

25:                                               ; preds = %23
  %26 = getelementptr inbounds i32, ptr %0, i32 %15
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  %28 = icmp slt i32 %27, 0
  %29 = add i32 %27, 165
  %30 = select i1 %28, i32 %29, i32 %27
  br label %32

31:                                               ; preds = %23
  br label %32

32:                                               ; preds = %25, %31
  %33 = phi i32 [ 4, %31 ], [ %30, %25 ]
  %34 = phi i32 [ 8, %31 ], [ %30, %25 ]
  %35 = phi i32 [ 5, %31 ], [ %30, %25 ]
  %36 = phi i32 [ 9, %31 ], [ %30, %25 ]
  %37 = phi i32 [ 0, %31 ], [ %30, %25 ]
  %38 = phi i32 [ 1, %31 ], [ %30, %25 ]
  %39 = phi i32 [ 2, %31 ], [ %30, %25 ]
  %40 = phi i32 [ 3, %31 ], [ %30, %25 ]
  br label %41

41:                                               ; preds = %32
  br label %42

42:                                               ; preds = %22, %41
  %43 = phi i32 [ %33, %41 ], [ %20, %22 ]
  %44 = phi i32 [ %34, %41 ], [ %20, %22 ]
  %45 = phi i32 [ %35, %41 ], [ %20, %22 ]
  %46 = phi i32 [ %36, %41 ], [ %20, %22 ]
  %47 = phi i32 [ %37, %41 ], [ %20, %22 ]
  %48 = phi i32 [ %38, %41 ], [ %20, %22 ]
  %49 = phi i32 [ %39, %41 ], [ %20, %22 ]
  %50 = phi i32 [ %40, %41 ], [ %20, %22 ]
  br label %51

51:                                               ; preds = %42
  %52 = insertelement <4 x i32> zeroinitializer, i32 %50, i64 0
  %53 = insertelement <4 x i32> zeroinitializer, i32 %49, i64 0
  %54 = insertelement <4 x i32> zeroinitializer, i32 %48, i64 0
  %55 = insertelement <4 x i32> zeroinitializer, i32 %47, i64 0
  %56 = insertelement <4 x i32> zeroinitializer, i32 %46, i64 0
  %57 = insertelement <4 x i32> zeroinitializer, i32 %45, i64 0
  %58 = insertelement <4 x i32> zeroinitializer, i32 %44, i64 0
  %59 = insertelement <4 x i32> zeroinitializer, i32 %43, i64 0
  %60 = add i32 %14, 1
  %61 = udiv i32 %60, 3
  %62 = urem i32 %60, 3
  %63 = icmp ult i32 %62, 1
  br i1 %63, label %64, label %65

64:                                               ; preds = %51
  br label %84

65:                                               ; preds = %51
  %66 = icmp ult i32 %62, 2
  br i1 %66, label %67, label %73

67:                                               ; preds = %65
  %68 = getelementptr inbounds i32, ptr %0, i32 %61
  %69 = load i32, ptr %68, align 4, !invariant.load !3
  %70 = icmp slt i32 %69, 0
  %71 = add i32 %69, 165
  %72 = select i1 %70, i32 %71, i32 %69
  br label %74

73:                                               ; preds = %65
  br label %74

74:                                               ; preds = %67, %73
  %75 = phi i32 [ 4, %73 ], [ %72, %67 ]
  %76 = phi i32 [ 8, %73 ], [ %72, %67 ]
  %77 = phi i32 [ 5, %73 ], [ %72, %67 ]
  %78 = phi i32 [ 9, %73 ], [ %72, %67 ]
  %79 = phi i32 [ 0, %73 ], [ %72, %67 ]
  %80 = phi i32 [ 1, %73 ], [ %72, %67 ]
  %81 = phi i32 [ 2, %73 ], [ %72, %67 ]
  %82 = phi i32 [ 3, %73 ], [ %72, %67 ]
  br label %83

83:                                               ; preds = %74
  br label %84

84:                                               ; preds = %64, %83
  %85 = phi i32 [ %75, %83 ], [ %20, %64 ]
  %86 = phi i32 [ %76, %83 ], [ %20, %64 ]
  %87 = phi i32 [ %77, %83 ], [ %20, %64 ]
  %88 = phi i32 [ %78, %83 ], [ %20, %64 ]
  %89 = phi i32 [ %79, %83 ], [ %20, %64 ]
  %90 = phi i32 [ %80, %83 ], [ %20, %64 ]
  %91 = phi i32 [ %81, %83 ], [ %20, %64 ]
  %92 = phi i32 [ %82, %83 ], [ %20, %64 ]
  br label %93

93:                                               ; preds = %84
  %94 = insertelement <4 x i32> %52, i32 %92, i64 1
  %95 = insertelement <4 x i32> %53, i32 %91, i64 1
  %96 = insertelement <4 x i32> %54, i32 %90, i64 1
  %97 = insertelement <4 x i32> %55, i32 %89, i64 1
  %98 = insertelement <4 x i32> %56, i32 %88, i64 1
  %99 = insertelement <4 x i32> %57, i32 %87, i64 1
  %100 = insertelement <4 x i32> %58, i32 %86, i64 1
  %101 = insertelement <4 x i32> %59, i32 %85, i64 1
  %102 = add i32 %14, 2
  %103 = udiv i32 %102, 3
  %104 = urem i32 %102, 3
  %105 = add i32 %19, 1
  %106 = udiv i32 %105, 21
  %107 = icmp ult i32 %104, 1
  br i1 %107, label %108, label %109

108:                                              ; preds = %93
  br label %128

109:                                              ; preds = %93
  %110 = icmp ult i32 %104, 2
  br i1 %110, label %111, label %117

111:                                              ; preds = %109
  %112 = getelementptr inbounds i32, ptr %0, i32 %103
  %113 = load i32, ptr %112, align 4, !invariant.load !3
  %114 = icmp slt i32 %113, 0
  %115 = add i32 %113, 165
  %116 = select i1 %114, i32 %115, i32 %113
  br label %118

117:                                              ; preds = %109
  br label %118

118:                                              ; preds = %111, %117
  %119 = phi i32 [ 4, %117 ], [ %116, %111 ]
  %120 = phi i32 [ 8, %117 ], [ %116, %111 ]
  %121 = phi i32 [ 5, %117 ], [ %116, %111 ]
  %122 = phi i32 [ 9, %117 ], [ %116, %111 ]
  %123 = phi i32 [ 0, %117 ], [ %116, %111 ]
  %124 = phi i32 [ 1, %117 ], [ %116, %111 ]
  %125 = phi i32 [ 2, %117 ], [ %116, %111 ]
  %126 = phi i32 [ 3, %117 ], [ %116, %111 ]
  br label %127

127:                                              ; preds = %118
  br label %128

128:                                              ; preds = %108, %127
  %129 = phi i32 [ %119, %127 ], [ %106, %108 ]
  %130 = phi i32 [ %120, %127 ], [ %106, %108 ]
  %131 = phi i32 [ %121, %127 ], [ %106, %108 ]
  %132 = phi i32 [ %122, %127 ], [ %106, %108 ]
  %133 = phi i32 [ %123, %127 ], [ %106, %108 ]
  %134 = phi i32 [ %124, %127 ], [ %106, %108 ]
  %135 = phi i32 [ %125, %127 ], [ %106, %108 ]
  %136 = phi i32 [ %126, %127 ], [ %106, %108 ]
  br label %137

137:                                              ; preds = %128
  %138 = insertelement <4 x i32> %94, i32 %136, i64 2
  %139 = insertelement <4 x i32> %95, i32 %135, i64 2
  %140 = insertelement <4 x i32> %96, i32 %134, i64 2
  %141 = insertelement <4 x i32> %97, i32 %133, i64 2
  %142 = insertelement <4 x i32> %98, i32 %132, i64 2
  %143 = insertelement <4 x i32> %99, i32 %131, i64 2
  %144 = insertelement <4 x i32> %100, i32 %130, i64 2
  %145 = insertelement <4 x i32> %101, i32 %129, i64 2
  %146 = add i32 %15, 1
  %147 = add i32 %14, 3
  %148 = udiv i32 %147, 42
  br i1 %21, label %149, label %150

149:                                              ; preds = %137
  br label %169

150:                                              ; preds = %137
  %151 = icmp ult i32 %16, 2
  br i1 %151, label %152, label %158

152:                                              ; preds = %150
  %153 = getelementptr inbounds i32, ptr %0, i32 %146
  %154 = load i32, ptr %153, align 4, !invariant.load !3
  %155 = icmp slt i32 %154, 0
  %156 = add i32 %154, 165
  %157 = select i1 %155, i32 %156, i32 %154
  br label %159

158:                                              ; preds = %150
  br label %159

159:                                              ; preds = %152, %158
  %160 = phi i32 [ 4, %158 ], [ %157, %152 ]
  %161 = phi i32 [ 8, %158 ], [ %157, %152 ]
  %162 = phi i32 [ 5, %158 ], [ %157, %152 ]
  %163 = phi i32 [ 9, %158 ], [ %157, %152 ]
  %164 = phi i32 [ 0, %158 ], [ %157, %152 ]
  %165 = phi i32 [ 1, %158 ], [ %157, %152 ]
  %166 = phi i32 [ 2, %158 ], [ %157, %152 ]
  %167 = phi i32 [ 3, %158 ], [ %157, %152 ]
  br label %168

168:                                              ; preds = %159
  br label %169

169:                                              ; preds = %149, %168
  %170 = phi i32 [ %160, %168 ], [ %148, %149 ]
  %171 = phi i32 [ %161, %168 ], [ %148, %149 ]
  %172 = phi i32 [ %162, %168 ], [ %148, %149 ]
  %173 = phi i32 [ %163, %168 ], [ %148, %149 ]
  %174 = phi i32 [ %164, %168 ], [ %148, %149 ]
  %175 = phi i32 [ %165, %168 ], [ %148, %149 ]
  %176 = phi i32 [ %166, %168 ], [ %148, %149 ]
  %177 = phi i32 [ %167, %168 ], [ %148, %149 ]
  br label %178

178:                                              ; preds = %169
  %179 = insertelement <4 x i32> %138, i32 %177, i64 3
  %180 = insertelement <4 x i32> %139, i32 %176, i64 3
  %181 = insertelement <4 x i32> %140, i32 %175, i64 3
  %182 = insertelement <4 x i32> %141, i32 %174, i64 3
  %183 = insertelement <4 x i32> %142, i32 %173, i64 3
  %184 = insertelement <4 x i32> %143, i32 %172, i64 3
  %185 = insertelement <4 x i32> %144, i32 %171, i64 3
  %186 = insertelement <4 x i32> %145, i32 %170, i64 3
  %187 = getelementptr inbounds i32, ptr %1, i32 %14
  store <4 x i32> %186, ptr %187, align 16
  %188 = getelementptr inbounds i32, ptr %2, i32 %14
  store <4 x i32> %185, ptr %188, align 16
  %189 = getelementptr inbounds i32, ptr %3, i32 %14
  store <4 x i32> %184, ptr %189, align 16
  %190 = getelementptr inbounds i32, ptr %4, i32 %14
  store <4 x i32> %183, ptr %190, align 16
  %191 = getelementptr inbounds i32, ptr %5, i32 %14
  store <4 x i32> %182, ptr %191, align 16
  %192 = getelementptr inbounds i32, ptr %6, i32 %14
  store <4 x i32> %181, ptr %192, align 16
  %193 = getelementptr inbounds i32, ptr %7, i32 %14
  store <4 x i32> %180, ptr %193, align 16
  %194 = getelementptr inbounds i32, ptr %8, i32 %14
  store <4 x i32> %179, ptr %194, align 16
  ret void
}

define ptx_kernel void @loop_broadcast_fusion_1(ptr noalias align 256 dereferenceable(32440320) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !21
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %3, 4
  %5 = mul i32 %2, 512
  %6 = add i32 %4, %5
  %7 = getelementptr inbounds float, ptr %0, i32 %6
  store <4 x float> zeroinitializer, ptr %7, align 16
  ret void
}

define ptx_kernel void @input_scatter_fusion_28(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(229376) %3, ptr noalias align 256 dereferenceable(16384) %4, ptr noalias align 256 dereferenceable(16384) %5) #0 {
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %20 = icmp ule i32 %13, 4095
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

define ptx_kernel void @loop_transpose_fusion(ptr noalias align 256 dereferenceable(229376) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(688128) %2, ptr noalias align 256 dereferenceable(688128) %3, ptr noalias align 256 dereferenceable(688128) %4, ptr noalias align 256 dereferenceable(688128) %5, ptr noalias align 256 dereferenceable(688128) %6, ptr noalias align 256 dereferenceable(688128) %7, ptr noalias align 256 dereferenceable(688128) %8) #0 {
  %10 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !20
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = mul i32 %11, 4
  %13 = mul i32 %10, 512
  %14 = add i32 %12, %13
  %15 = udiv i32 %14, 3
  %16 = urem i32 %14, 3
  %17 = mul i32 %11, 2
  %18 = mul i32 %10, 256
  %19 = add i32 %17, %18
  %20 = udiv i32 %19, 21
  %21 = icmp ult i32 %16, 1
  br i1 %21, label %22, label %23

22:                                               ; preds = %9
  br label %39

23:                                               ; preds = %9
  %24 = icmp ult i32 %16, 2
  br i1 %24, label %25, label %28

25:                                               ; preds = %23
  %26 = getelementptr inbounds i32, ptr %0, i32 %15
  %27 = load i32, ptr %26, align 4, !invariant.load !3
  br label %29

28:                                               ; preds = %23
  br label %29

29:                                               ; preds = %25, %28
  %30 = phi i32 [ 9, %28 ], [ %27, %25 ]
  %31 = phi i32 [ 0, %28 ], [ %27, %25 ]
  %32 = phi i32 [ 1, %28 ], [ %27, %25 ]
  %33 = phi i32 [ 2, %28 ], [ %27, %25 ]
  %34 = phi i32 [ 3, %28 ], [ %27, %25 ]
  %35 = phi i32 [ 4, %28 ], [ %27, %25 ]
  %36 = phi i32 [ 5, %28 ], [ %27, %25 ]
  %37 = phi i32 [ 8, %28 ], [ %27, %25 ]
  br label %38

38:                                               ; preds = %29
  br label %39

39:                                               ; preds = %22, %38
  %40 = phi i32 [ %30, %38 ], [ %20, %22 ]
  %41 = phi i32 [ %31, %38 ], [ %20, %22 ]
  %42 = phi i32 [ %32, %38 ], [ %20, %22 ]
  %43 = phi i32 [ %33, %38 ], [ %20, %22 ]
  %44 = phi i32 [ %34, %38 ], [ %20, %22 ]
  %45 = phi i32 [ %35, %38 ], [ %20, %22 ]
  %46 = phi i32 [ %36, %38 ], [ %20, %22 ]
  %47 = phi i32 [ %37, %38 ], [ %20, %22 ]
  br label %48

48:                                               ; preds = %39
  %49 = insertelement <4 x i32> zeroinitializer, i32 %47, i64 0
  %50 = insertelement <4 x i32> zeroinitializer, i32 %46, i64 0
  %51 = insertelement <4 x i32> zeroinitializer, i32 %45, i64 0
  %52 = insertelement <4 x i32> zeroinitializer, i32 %44, i64 0
  %53 = insertelement <4 x i32> zeroinitializer, i32 %43, i64 0
  %54 = insertelement <4 x i32> zeroinitializer, i32 %42, i64 0
  %55 = insertelement <4 x i32> zeroinitializer, i32 %41, i64 0
  %56 = insertelement <4 x i32> zeroinitializer, i32 %40, i64 0
  %57 = add i32 %14, 1
  %58 = udiv i32 %57, 3
  %59 = urem i32 %57, 3
  %60 = icmp ult i32 %59, 1
  br i1 %60, label %61, label %62

61:                                               ; preds = %48
  br label %78

62:                                               ; preds = %48
  %63 = icmp ult i32 %59, 2
  br i1 %63, label %64, label %67

64:                                               ; preds = %62
  %65 = getelementptr inbounds i32, ptr %0, i32 %58
  %66 = load i32, ptr %65, align 4, !invariant.load !3
  br label %68

67:                                               ; preds = %62
  br label %68

68:                                               ; preds = %64, %67
  %69 = phi i32 [ 9, %67 ], [ %66, %64 ]
  %70 = phi i32 [ 0, %67 ], [ %66, %64 ]
  %71 = phi i32 [ 1, %67 ], [ %66, %64 ]
  %72 = phi i32 [ 2, %67 ], [ %66, %64 ]
  %73 = phi i32 [ 3, %67 ], [ %66, %64 ]
  %74 = phi i32 [ 4, %67 ], [ %66, %64 ]
  %75 = phi i32 [ 5, %67 ], [ %66, %64 ]
  %76 = phi i32 [ 8, %67 ], [ %66, %64 ]
  br label %77

77:                                               ; preds = %68
  br label %78

78:                                               ; preds = %61, %77
  %79 = phi i32 [ %69, %77 ], [ %20, %61 ]
  %80 = phi i32 [ %70, %77 ], [ %20, %61 ]
  %81 = phi i32 [ %71, %77 ], [ %20, %61 ]
  %82 = phi i32 [ %72, %77 ], [ %20, %61 ]
  %83 = phi i32 [ %73, %77 ], [ %20, %61 ]
  %84 = phi i32 [ %74, %77 ], [ %20, %61 ]
  %85 = phi i32 [ %75, %77 ], [ %20, %61 ]
  %86 = phi i32 [ %76, %77 ], [ %20, %61 ]
  br label %87

87:                                               ; preds = %78
  %88 = insertelement <4 x i32> %49, i32 %86, i64 1
  %89 = insertelement <4 x i32> %50, i32 %85, i64 1
  %90 = insertelement <4 x i32> %51, i32 %84, i64 1
  %91 = insertelement <4 x i32> %52, i32 %83, i64 1
  %92 = insertelement <4 x i32> %53, i32 %82, i64 1
  %93 = insertelement <4 x i32> %54, i32 %81, i64 1
  %94 = insertelement <4 x i32> %55, i32 %80, i64 1
  %95 = insertelement <4 x i32> %56, i32 %79, i64 1
  %96 = add i32 %14, 2
  %97 = udiv i32 %96, 3
  %98 = urem i32 %96, 3
  %99 = add i32 %19, 1
  %100 = udiv i32 %99, 21
  %101 = icmp ult i32 %98, 1
  br i1 %101, label %102, label %103

102:                                              ; preds = %87
  br label %119

103:                                              ; preds = %87
  %104 = icmp ult i32 %98, 2
  br i1 %104, label %105, label %108

105:                                              ; preds = %103
  %106 = getelementptr inbounds i32, ptr %0, i32 %97
  %107 = load i32, ptr %106, align 4, !invariant.load !3
  br label %109

108:                                              ; preds = %103
  br label %109

109:                                              ; preds = %105, %108
  %110 = phi i32 [ 9, %108 ], [ %107, %105 ]
  %111 = phi i32 [ 0, %108 ], [ %107, %105 ]
  %112 = phi i32 [ 1, %108 ], [ %107, %105 ]
  %113 = phi i32 [ 2, %108 ], [ %107, %105 ]
  %114 = phi i32 [ 3, %108 ], [ %107, %105 ]
  %115 = phi i32 [ 4, %108 ], [ %107, %105 ]
  %116 = phi i32 [ 5, %108 ], [ %107, %105 ]
  %117 = phi i32 [ 8, %108 ], [ %107, %105 ]
  br label %118

118:                                              ; preds = %109
  br label %119

119:                                              ; preds = %102, %118
  %120 = phi i32 [ %110, %118 ], [ %100, %102 ]
  %121 = phi i32 [ %111, %118 ], [ %100, %102 ]
  %122 = phi i32 [ %112, %118 ], [ %100, %102 ]
  %123 = phi i32 [ %113, %118 ], [ %100, %102 ]
  %124 = phi i32 [ %114, %118 ], [ %100, %102 ]
  %125 = phi i32 [ %115, %118 ], [ %100, %102 ]
  %126 = phi i32 [ %116, %118 ], [ %100, %102 ]
  %127 = phi i32 [ %117, %118 ], [ %100, %102 ]
  br label %128

128:                                              ; preds = %119
  %129 = insertelement <4 x i32> %88, i32 %127, i64 2
  %130 = insertelement <4 x i32> %89, i32 %126, i64 2
  %131 = insertelement <4 x i32> %90, i32 %125, i64 2
  %132 = insertelement <4 x i32> %91, i32 %124, i64 2
  %133 = insertelement <4 x i32> %92, i32 %123, i64 2
  %134 = insertelement <4 x i32> %93, i32 %122, i64 2
  %135 = insertelement <4 x i32> %94, i32 %121, i64 2
  %136 = insertelement <4 x i32> %95, i32 %120, i64 2
  %137 = add i32 %15, 1
  %138 = add i32 %14, 3
  %139 = udiv i32 %138, 42
  br i1 %21, label %140, label %141

140:                                              ; preds = %128
  br label %157

141:                                              ; preds = %128
  %142 = icmp ult i32 %16, 2
  br i1 %142, label %143, label %146

143:                                              ; preds = %141
  %144 = getelementptr inbounds i32, ptr %0, i32 %137
  %145 = load i32, ptr %144, align 4, !invariant.load !3
  br label %147

146:                                              ; preds = %141
  br label %147

147:                                              ; preds = %143, %146
  %148 = phi i32 [ 9, %146 ], [ %145, %143 ]
  %149 = phi i32 [ 0, %146 ], [ %145, %143 ]
  %150 = phi i32 [ 1, %146 ], [ %145, %143 ]
  %151 = phi i32 [ 2, %146 ], [ %145, %143 ]
  %152 = phi i32 [ 3, %146 ], [ %145, %143 ]
  %153 = phi i32 [ 4, %146 ], [ %145, %143 ]
  %154 = phi i32 [ 5, %146 ], [ %145, %143 ]
  %155 = phi i32 [ 8, %146 ], [ %145, %143 ]
  br label %156

156:                                              ; preds = %147
  br label %157

157:                                              ; preds = %140, %156
  %158 = phi i32 [ %148, %156 ], [ %139, %140 ]
  %159 = phi i32 [ %149, %156 ], [ %139, %140 ]
  %160 = phi i32 [ %150, %156 ], [ %139, %140 ]
  %161 = phi i32 [ %151, %156 ], [ %139, %140 ]
  %162 = phi i32 [ %152, %156 ], [ %139, %140 ]
  %163 = phi i32 [ %153, %156 ], [ %139, %140 ]
  %164 = phi i32 [ %154, %156 ], [ %139, %140 ]
  %165 = phi i32 [ %155, %156 ], [ %139, %140 ]
  br label %166

166:                                              ; preds = %157
  %167 = insertelement <4 x i32> %129, i32 %165, i64 3
  %168 = insertelement <4 x i32> %130, i32 %164, i64 3
  %169 = insertelement <4 x i32> %131, i32 %163, i64 3
  %170 = insertelement <4 x i32> %132, i32 %162, i64 3
  %171 = insertelement <4 x i32> %133, i32 %161, i64 3
  %172 = insertelement <4 x i32> %134, i32 %160, i64 3
  %173 = insertelement <4 x i32> %135, i32 %159, i64 3
  %174 = insertelement <4 x i32> %136, i32 %158, i64 3
  %175 = getelementptr inbounds i32, ptr %1, i32 %14
  store <4 x i32> %174, ptr %175, align 16
  %176 = getelementptr inbounds i32, ptr %2, i32 %14
  store <4 x i32> %173, ptr %176, align 16
  %177 = getelementptr inbounds i32, ptr %3, i32 %14
  store <4 x i32> %172, ptr %177, align 16
  %178 = getelementptr inbounds i32, ptr %4, i32 %14
  store <4 x i32> %171, ptr %178, align 16
  %179 = getelementptr inbounds i32, ptr %5, i32 %14
  store <4 x i32> %170, ptr %179, align 16
  %180 = getelementptr inbounds i32, ptr %6, i32 %14
  store <4 x i32> %169, ptr %180, align 16
  %181 = getelementptr inbounds i32, ptr %7, i32 %14
  store <4 x i32> %168, ptr %181, align 16
  %182 = getelementptr inbounds i32, ptr %8, i32 %14
  store <4 x i32> %167, ptr %182, align 16
  ret void
}

define ptx_kernel void @input_scatter_fusion_27(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(57344) %3, ptr noalias align 256 dereferenceable(229376) %4, ptr noalias align 256 dereferenceable(16384) %5, ptr noalias align 256 dereferenceable(16384) %6) #0 {
  %8 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %9 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %21 = icmp ule i32 %14, 4095
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

define ptx_kernel void @input_scatter_fusion_26(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(57344) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %18 = icmp ule i32 %11, 4095
  %19 = icmp ule i32 %14, 164
  %20 = and i1 %18, %19
  %21 = icmp ule i32 %17, 11
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %55

23:                                               ; preds = %4
  %24 = mul i32 %6, 128
  %25 = add i32 %24, %5
  %26 = getelementptr inbounds i8, ptr %3, i32 %25
  %27 = load i8, ptr %26, align 1, !invariant.load !3
  %28 = getelementptr inbounds i8, ptr %2, i32 %25
  %29 = load i8, ptr %28, align 1, !invariant.load !3
  %30 = sitofp i8 %27 to float
  %31 = trunc i8 %29 to i1
  %32 = select i1 %31, float %30, float 0.000000e+00
  %33 = mul i32 %11, 1980
  %34 = mul i32 %14, 12
  %35 = add i32 %33, %34
  %36 = add i32 %35, %17
  %37 = getelementptr inbounds float, ptr %0, i32 %36
  %38 = load float, ptr %37, align 4
  %39 = fcmp uno float %38, %38
  br i1 %39, label %40, label %41

40:                                               ; preds = %23
  br label %54

41:                                               ; preds = %23
  %42 = fcmp uno float %32, %32
  %43 = select i1 %42, float 0x7FF8000000000000, float %32
  %44 = fcmp ult float %38, %43
  br i1 %44, label %45, label %53

45:                                               ; preds = %41
  %46 = bitcast float %43 to i32
  %47 = icmp sge i32 %46, 0
  br i1 %47, label %48, label %50

48:                                               ; preds = %45
  %49 = atomicrmw max ptr %37, i32 %46 monotonic, align 4
  br label %52

50:                                               ; preds = %45
  %51 = atomicrmw umin ptr %37, i32 %46 monotonic, align 4
  br label %52

52:                                               ; preds = %48, %50
  br label %53

53:                                               ; preds = %52, %41
  br label %54

54:                                               ; preds = %40, %53
  br label %55

55:                                               ; preds = %54, %4
  ret void
}

declare ptx_kernel void @fusion_488_impl(ptr, ptr, ptr, ptr) #8

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.div.full(float, float) #9

define ptx_kernel void @fusion_488(ptr noalias align 256 dereferenceable(57344) %arg0, ptr noalias align 256 dereferenceable(229376) %arg1, ptr noalias align 256 dereferenceable(229376) %arg2) #10 {
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

define ptx_kernel void @input_scatter_fusion_24(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(229376) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %17 = icmp ule i32 %10, 4095
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

define ptx_kernel void @input_scatter_fusion_22(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(229376) %4) #0 {
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %7 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %19 = icmp ule i32 %12, 4095
  %20 = icmp ule i32 %15, 164
  %21 = and i1 %19, %20
  %22 = icmp ule i32 %18, 11
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %71

24:                                               ; preds = %5
  %25 = mul i32 %7, 128
  %26 = add i32 %25, %6
  %27 = getelementptr inbounds i32, ptr %4, i32 %26
  %28 = load i32, ptr %27, align 4, !invariant.load !3
  %29 = call i32 @llvm.smin.i32(i32 %28, i32 100)
  %30 = call i32 @llvm.smax.i32(i32 %29, i32 0)
  %31 = mul i32 %30, 20
  %32 = add i32 %31, 12
  %33 = getelementptr inbounds float, ptr %3, i32 %32
  %34 = load float, ptr %33, align 4, !invariant.load !3
  %35 = fptosi float %34 to i32
  %36 = fcmp ole float %34, 0xC1E0000000000000
  %37 = select i1 %36, i32 -2147483648, i32 %35
  %38 = fcmp oge float %34, 0x41E0000000000000
  %39 = select i1 %38, i32 2147483647, i32 %37
  %40 = fcmp uno float %34, %34
  %41 = select i1 %40, i32 0, i32 %39
  %42 = icmp sgt i32 %41, 0
  %43 = zext i1 %42 to i8
  %44 = getelementptr inbounds i8, ptr %2, i32 %26
  %45 = load i8, ptr %44, align 1, !invariant.load !3
  %46 = sitofp i8 %43 to float
  %47 = trunc i8 %45 to i1
  %48 = select i1 %47, float %46, float 0.000000e+00
  %49 = mul i32 %12, 1980
  %50 = mul i32 %15, 12
  %51 = add i32 %49, %50
  %52 = add i32 %51, %18
  %53 = getelementptr inbounds float, ptr %0, i32 %52
  %54 = load float, ptr %53, align 4
  %55 = fcmp uno float %54, %54
  br i1 %55, label %56, label %57

56:                                               ; preds = %24
  br label %70

57:                                               ; preds = %24
  %58 = fcmp uno float %48, %48
  %59 = select i1 %58, float 0x7FF8000000000000, float %48
  %60 = fcmp ult float %54, %59
  br i1 %60, label %61, label %69

61:                                               ; preds = %57
  %62 = bitcast float %59 to i32
  %63 = icmp sge i32 %62, 0
  br i1 %63, label %64, label %66

64:                                               ; preds = %61
  %65 = atomicrmw max ptr %53, i32 %62 monotonic, align 4
  br label %68

66:                                               ; preds = %61
  %67 = atomicrmw umin ptr %53, i32 %62 monotonic, align 4
  br label %68

68:                                               ; preds = %64, %66
  br label %69

69:                                               ; preds = %68, %57
  br label %70

70:                                               ; preds = %56, %69
  br label %71

71:                                               ; preds = %70, %5
  ret void
}

define ptx_kernel void @input_scatter_fusion_20(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(16384) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %18 = icmp ule i32 %11, 4095
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

define ptx_kernel void @input_scatter_fusion_18(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(229376) %3) #0 {
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %18 = icmp ule i32 %11, 4095
  %19 = icmp ule i32 %14, 164
  %20 = and i1 %18, %19
  %21 = icmp ule i32 %17, 11
  %22 = and i1 %20, %21
  br i1 %22, label %23, label %54

23:                                               ; preds = %4
  %24 = mul i32 %6, 128
  %25 = add i32 %24, %5
  %26 = getelementptr inbounds i8, ptr %2, i32 %25
  %27 = load i8, ptr %26, align 1, !invariant.load !3
  %28 = getelementptr inbounds float, ptr %3, i32 %25
  %29 = load float, ptr %28, align 4, !invariant.load !3
  %30 = trunc i8 %27 to i1
  %31 = select i1 %30, float %29, float 0.000000e+00
  %32 = mul i32 %11, 1980
  %33 = mul i32 %14, 12
  %34 = add i32 %32, %33
  %35 = add i32 %34, %17
  %36 = getelementptr inbounds float, ptr %0, i32 %35
  %37 = load float, ptr %36, align 4
  %38 = fcmp uno float %37, %37
  br i1 %38, label %39, label %40

39:                                               ; preds = %23
  br label %53

40:                                               ; preds = %23
  %41 = fcmp uno float %31, %31
  %42 = select i1 %41, float 0x7FF8000000000000, float %31
  %43 = fcmp ult float %37, %42
  br i1 %43, label %44, label %52

44:                                               ; preds = %40
  %45 = bitcast float %42 to i32
  %46 = icmp sge i32 %45, 0
  br i1 %46, label %47, label %49

47:                                               ; preds = %44
  %48 = atomicrmw max ptr %36, i32 %45 monotonic, align 4
  br label %51

49:                                               ; preds = %44
  %50 = atomicrmw umin ptr %36, i32 %45 monotonic, align 4
  br label %51

51:                                               ; preds = %47, %49
  br label %52

52:                                               ; preds = %51, %40
  br label %53

53:                                               ; preds = %39, %52
  br label %54

54:                                               ; preds = %53, %4
  ret void
}

define ptx_kernel void @input_transpose_fusion_1(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(675840) %1, ptr noalias align 256 dereferenceable(675840) %2, ptr noalias align 256 dereferenceable(675840) %3, ptr noalias align 256 dereferenceable(675840) %4, ptr noalias align 256 dereferenceable(16384) %5, ptr noalias align 256 dereferenceable(16384) %6, ptr noalias align 256 dereferenceable(32440320) %7) #0 {
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

define ptx_kernel void @input_scatter_fusion_13(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(229376) %4, ptr noalias align 256 dereferenceable(16384) %5, ptr noalias align 256 dereferenceable(57344) %6, ptr noalias align 256 dereferenceable(32768) %7, ptr noalias align 256 dereferenceable(16384) %8, ptr noalias align 256 dereferenceable(16384) %9) #0 {
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %24 = icmp ule i32 %17, 4095
  %25 = icmp ule i32 %20, 164
  %26 = and i1 %24, %25
  %27 = icmp ule i32 %23, 11
  %28 = and i1 %26, %27
  br i1 %28, label %29, label %157

29:                                               ; preds = %10
  %30 = mul i32 %12, 128
  %31 = add i32 %30, %11
  %32 = udiv i32 %31, 14
  %33 = urem i32 %31, 14
  %34 = getelementptr inbounds i8, ptr %2, i32 %31
  %35 = load i8, ptr %34, align 1, !invariant.load !3
  %36 = zext i32 %33 to i64
  %37 = trunc i64 %36 to i32
  %38 = call i32 @llvm.smin.i32(i32 %37, i32 13)
  %39 = call i32 @llvm.smax.i32(i32 %38, i32 0)
  %40 = call float @fused_scatter_13_bitcast_1290_222(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 1, i32 %32, i32 %39)
  %41 = fptosi float %40 to i32
  %42 = fcmp ole float %40, 0xC1E0000000000000
  %43 = select i1 %42, i32 -2147483648, i32 %41
  %44 = fcmp oge float %40, 0x41E0000000000000
  %45 = select i1 %44, i32 2147483647, i32 %43
  %46 = fcmp uno float %40, %40
  %47 = select i1 %46, i32 0, i32 %45
  %48 = mul i32 %32, 2
  %49 = getelementptr inbounds i32, ptr %7, i32 %48
  %50 = load i32, ptr %49, align 4, !invariant.load !3
  %51 = call i32 @llvm.smin.i32(i32 %50, i32 4095)
  %52 = call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = add i32 %48, 1
  %54 = getelementptr inbounds i32, ptr %7, i32 %53
  %55 = load i32, ptr %54, align 4, !invariant.load !3
  %56 = call i32 @llvm.smin.i32(i32 %55, i32 13)
  %57 = call i32 @llvm.smax.i32(i32 %56, i32 0)
  %58 = call float @fused_scatter_13_bitcast_1290_222(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %52, i32 %57)
  %59 = fptosi float %58 to i32
  %60 = fcmp ole float %58, 0xC1E0000000000000
  %61 = select i1 %60, i32 -2147483648, i32 %59
  %62 = fcmp oge float %58, 0x41E0000000000000
  %63 = select i1 %62, i32 2147483647, i32 %61
  %64 = fcmp uno float %58, %58
  %65 = select i1 %64, i32 0, i32 %63
  %66 = sub i32 %65, %47
  %67 = sub i32 0, %66
  %68 = call i32 @llvm.smin.i32(i32 %66, i32 60)
  %69 = call i32 @llvm.smin.i32(i32 %67, i32 28)
  %70 = call i32 @fused_scatter_13_maximum_82_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %39)
  %71 = sitofp i32 %68 to float
  %72 = sitofp i32 %69 to float
  %73 = add i32 %70, -1
  %74 = fmul float %71, 0x3FA99999A0000000
  %75 = fmul float %72, 0x3F999999A0000000
  %76 = call float @fused_scatter_13_bitcast_1290_222(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 4, i32 %32, i32 %39)
  %77 = fptosi float %76 to i32
  %78 = fcmp ole float %76, 0xC1E0000000000000
  %79 = select i1 %78, i32 -2147483648, i32 %77
  %80 = fcmp oge float %76, 0x41E0000000000000
  %81 = select i1 %80, i32 2147483647, i32 %79
  %82 = fcmp uno float %76, %76
  %83 = select i1 %82, i32 0, i32 %81
  %84 = mul i32 %73, %83
  %85 = icmp sge i32 %66, 0
  %86 = call float @fused_scatter_13_broadcast_3142_71(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %33)
  %87 = fadd float %74, %86
  %88 = fsub float %86, %75
  %89 = add i32 %84, %83
  %90 = call float @fused_scatter_13_bitcast_1290_222(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 2, i32 %52, i32 %57)
  %91 = fptosi float %90 to i32
  %92 = fcmp ole float %90, 0xC1E0000000000000
  %93 = select i1 %92, i32 -2147483648, i32 %91
  %94 = fcmp oge float %90, 0x41E0000000000000
  %95 = select i1 %94, i32 2147483647, i32 %93
  %96 = fcmp uno float %90, %90
  %97 = select i1 %96, i32 0, i32 %95
  %98 = call float @fused_scatter_13_bitcast_1290_222(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 3, i32 %52, i32 %57)
  %99 = fptosi float %98 to i32
  %100 = fcmp ole float %98, 0xC1E0000000000000
  %101 = select i1 %100, i32 -2147483648, i32 %99
  %102 = fcmp oge float %98, 0x41E0000000000000
  %103 = select i1 %102, i32 2147483647, i32 %101
  %104 = fcmp uno float %98, %98
  %105 = select i1 %104, i32 0, i32 %103
  %106 = add i32 %97, %105
  %107 = call i32 @fused_scatter_13_maximum_82_23(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %52, i32 %57)
  %108 = sitofp i32 %106 to float
  %109 = sitofp i32 %107 to float
  %110 = fmul float %108, 5.000000e-01
  %111 = fmul float %109, %110
  %112 = select i1 %85, float %87, float %88
  %113 = call i32 @fused_scatter_13_broadcast_3139_37(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %33)
  %114 = call i32 @llvm.smax.i32(i32 %89, i32 %113)
  %115 = fmul float %111, %112
  %116 = sitofp i32 %114 to float
  %117 = mul i32 %32, 14
  %118 = add i32 %117, %39
  %119 = getelementptr inbounds i8, ptr %6, i32 %118
  %120 = load i8, ptr %119, align 1, !invariant.load !3
  %121 = getelementptr inbounds i32, ptr %8, i32 %32
  %122 = load i32, ptr %121, align 4, !invariant.load !3
  %123 = getelementptr inbounds i32, ptr %9, i32 %32
  %124 = load i32, ptr %123, align 4, !invariant.load !3
  %125 = icmp sge i32 %122, %124
  %126 = zext i1 %125 to i8
  %127 = fdiv float %115, %116
  %128 = and i8 %120, %126
  %129 = call float @llvm.maximum.f32(float %127, float 0.000000e+00)
  %130 = call float @llvm.minimum.f32(float %129, float %86)
  %131 = trunc i8 %128 to i1
  %132 = select i1 %131, float %130, float 0.000000e+00
  %133 = trunc i8 %35 to i1
  %134 = select i1 %133, float %132, float 0.000000e+00
  %135 = mul i32 %17, 1980
  %136 = mul i32 %20, 12
  %137 = add i32 %135, %136
  %138 = add i32 %137, %23
  %139 = getelementptr inbounds float, ptr %0, i32 %138
  %140 = load float, ptr %139, align 4
  %141 = fcmp uno float %140, %140
  br i1 %141, label %142, label %143

142:                                              ; preds = %29
  br label %156

143:                                              ; preds = %29
  %144 = fcmp uno float %134, %134
  %145 = select i1 %144, float 0x7FF8000000000000, float %134
  %146 = fcmp ult float %140, %145
  br i1 %146, label %147, label %155

147:                                              ; preds = %143
  %148 = bitcast float %145 to i32
  %149 = icmp sge i32 %148, 0
  br i1 %149, label %150, label %152

150:                                              ; preds = %147
  %151 = atomicrmw max ptr %139, i32 %148 monotonic, align 4
  br label %154

152:                                              ; preds = %147
  %153 = atomicrmw umin ptr %139, i32 %148 monotonic, align 4
  br label %154

154:                                              ; preds = %150, %152
  br label %155

155:                                              ; preds = %154, %143
  br label %156

156:                                              ; preds = %142, %155
  br label %157

157:                                              ; preds = %156, %10
  ret void
}

define internal float @fused_scatter_13_bitcast_1290_222(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = mul i32 %11, 14
  %15 = add i32 %14, %12
  %16 = getelementptr inbounds i32, ptr %4, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = call i32 @llvm.smin.i32(i32 %17, i32 100)
  %19 = call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = mul i32 %19, 20
  %21 = add i32 %20, %10
  %22 = getelementptr inbounds float, ptr %3, i32 %21
  %23 = load float, ptr %22, align 4, !invariant.load !3
  ret float %23
}

define internal i32 @fused_scatter_13_maximum_82_23(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = call float @fused_scatter_13_bitcast_1290_222(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 6, i32 %11, i32 %12)
  %15 = getelementptr inbounds float, ptr %5, i32 %11
  %16 = load float, ptr %15, align 4, !invariant.load !3
  %17 = call float @fused_scatter_13_broadcast_3142_71(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 %10, i32 %11, i32 %12)
  %18 = call float @llvm.maximum.f32(float %14, float %17)
  %19 = fdiv float %16, %18
  %20 = fptosi float %19 to i32
  %21 = fcmp ole float %19, 0xC1E0000000000000
  %22 = select i1 %21, i32 -2147483648, i32 %20
  %23 = fcmp oge float %19, 0x41E0000000000000
  %24 = select i1 %23, i32 2147483647, i32 %22
  %25 = fcmp uno float %19, %19
  %26 = select i1 %25, i32 0, i32 %24
  %27 = call i32 @fused_scatter_13_broadcast_3139_37(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 %10, i32 %11, i32 %12)
  %28 = call i32 @llvm.smax.i32(i32 %26, i32 %27)
  ret i32 %28
}

define internal float @fused_scatter_13_broadcast_3142_71(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  ret float 1.000000e+00
}

define internal i32 @fused_scatter_13_broadcast_3139_37(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  ret i32 1
}

define ptx_kernel void @input_scatter_fusion_11(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(688128) %1, ptr noalias align 256 dereferenceable(57344) %2, ptr noalias align 256 dereferenceable(8080) %3, ptr noalias align 256 dereferenceable(229376) %4, ptr noalias align 256 dereferenceable(16384) %5, ptr noalias align 256 dereferenceable(57344) %6, ptr noalias align 256 dereferenceable(32768) %7, ptr noalias align 256 dereferenceable(16384) %8, ptr noalias align 256 dereferenceable(16384) %9) #0 {
  %11 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %12 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
  %24 = icmp ule i32 %17, 4095
  %25 = icmp ule i32 %20, 164
  %26 = and i1 %24, %25
  %27 = icmp ule i32 %23, 11
  %28 = and i1 %26, %27
  br i1 %28, label %29, label %156

29:                                               ; preds = %10
  %30 = mul i32 %12, 128
  %31 = add i32 %30, %11
  %32 = udiv i32 %31, 14
  %33 = urem i32 %31, 14
  %34 = getelementptr inbounds i8, ptr %2, i32 %31
  %35 = load i8, ptr %34, align 1, !invariant.load !3
  %36 = zext i32 %33 to i64
  %37 = trunc i64 %36 to i32
  %38 = call i32 @llvm.smin.i32(i32 %37, i32 13)
  %39 = call i32 @llvm.smax.i32(i32 %38, i32 0)
  %40 = call float @fused_scatter_11_bitcast_1290_136(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %39)
  %41 = fptosi float %40 to i32
  %42 = fcmp ole float %40, 0xC1E0000000000000
  %43 = select i1 %42, i32 -2147483648, i32 %41
  %44 = fcmp oge float %40, 0x41E0000000000000
  %45 = select i1 %44, i32 2147483647, i32 %43
  %46 = fcmp uno float %40, %40
  %47 = select i1 %46, i32 0, i32 %45
  %48 = mul i32 %32, 2
  %49 = getelementptr inbounds i32, ptr %7, i32 %48
  %50 = load i32, ptr %49, align 4, !invariant.load !3
  %51 = call i32 @llvm.smin.i32(i32 %50, i32 4095)
  %52 = call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = add i32 %48, 1
  %54 = getelementptr inbounds i32, ptr %7, i32 %53
  %55 = load i32, ptr %54, align 4, !invariant.load !3
  %56 = call i32 @llvm.smin.i32(i32 %55, i32 13)
  %57 = call i32 @llvm.smax.i32(i32 %56, i32 0)
  %58 = call float @fused_scatter_11_bitcast_1290_136(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 1, i32 %52, i32 %57)
  %59 = fptosi float %58 to i32
  %60 = fcmp ole float %58, 0xC1E0000000000000
  %61 = select i1 %60, i32 -2147483648, i32 %59
  %62 = fcmp oge float %58, 0x41E0000000000000
  %63 = select i1 %62, i32 2147483647, i32 %61
  %64 = fcmp uno float %58, %58
  %65 = select i1 %64, i32 0, i32 %63
  %66 = sub i32 %47, %65
  %67 = sub i32 0, %66
  %68 = call float @fused_scatter_11_bitcast_1290_136(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 2, i32 %32, i32 %39)
  %69 = fptosi float %68 to i32
  %70 = fcmp ole float %68, 0xC1E0000000000000
  %71 = select i1 %70, i32 -2147483648, i32 %69
  %72 = fcmp oge float %68, 0x41E0000000000000
  %73 = select i1 %72, i32 2147483647, i32 %71
  %74 = fcmp uno float %68, %68
  %75 = select i1 %74, i32 0, i32 %73
  %76 = call float @fused_scatter_11_bitcast_1290_136(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 3, i32 %32, i32 %39)
  %77 = fptosi float %76 to i32
  %78 = fcmp ole float %76, 0xC1E0000000000000
  %79 = select i1 %78, i32 -2147483648, i32 %77
  %80 = fcmp oge float %76, 0x41E0000000000000
  %81 = select i1 %80, i32 2147483647, i32 %79
  %82 = fcmp uno float %76, %76
  %83 = select i1 %82, i32 0, i32 %81
  %84 = call i32 @llvm.smin.i32(i32 %66, i32 60)
  %85 = call i32 @llvm.smin.i32(i32 %67, i32 28)
  %86 = add i32 %75, %83
  %87 = sitofp i32 %84 to float
  %88 = sitofp i32 %85 to float
  %89 = call i32 @fused_scatter_11_maximum_82_13(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %39)
  %90 = sitofp i32 %86 to float
  %91 = fmul float %87, 0x3FA99999A0000000
  %92 = fmul float %88, 0x3F999999A0000000
  %93 = sitofp i32 %89 to float
  %94 = fmul float %90, 5.000000e-01
  %95 = icmp sge i32 %66, 0
  %96 = call float @fused_scatter_11_broadcast_3142_49(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %32, i32 %33)
  %97 = fadd float %91, %96
  %98 = fsub float %96, %92
  %99 = fmul float %93, %94
  %100 = select i1 %95, float %97, float %98
  %101 = fmul float %99, %100
  %102 = call i32 @fused_scatter_11_maximum_82_13(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 0, i32 %52, i32 %57)
  %103 = add i32 %102, -1
  %104 = call float @fused_scatter_11_bitcast_1290_136(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 4, i32 %52, i32 %57)
  %105 = fptosi float %104 to i32
  %106 = fcmp ole float %104, 0xC1E0000000000000
  %107 = select i1 %106, i32 -2147483648, i32 %105
  %108 = fcmp oge float %104, 0x41E0000000000000
  %109 = select i1 %108, i32 2147483647, i32 %107
  %110 = fcmp uno float %104, %104
  %111 = select i1 %110, i32 0, i32 %109
  %112 = mul i32 %103, %111
  %113 = add i32 %112, %111
  %114 = call i32 @llvm.smax.i32(i32 %113, i32 1)
  %115 = sitofp i32 %114 to float
  %116 = mul i32 %32, 14
  %117 = add i32 %116, %39
  %118 = getelementptr inbounds i8, ptr %6, i32 %117
  %119 = load i8, ptr %118, align 1, !invariant.load !3
  %120 = getelementptr inbounds i32, ptr %8, i32 %32
  %121 = load i32, ptr %120, align 4, !invariant.load !3
  %122 = getelementptr inbounds i32, ptr %9, i32 %32
  %123 = load i32, ptr %122, align 4, !invariant.load !3
  %124 = icmp sge i32 %121, %123
  %125 = zext i1 %124 to i8
  %126 = fdiv float %101, %115
  %127 = and i8 %119, %125
  %128 = call float @llvm.maximum.f32(float %126, float 0.000000e+00)
  %129 = call float @llvm.minimum.f32(float %128, float %96)
  %130 = trunc i8 %127 to i1
  %131 = select i1 %130, float %129, float 0.000000e+00
  %132 = trunc i8 %35 to i1
  %133 = select i1 %132, float %131, float 0.000000e+00
  %134 = mul i32 %17, 1980
  %135 = mul i32 %20, 12
  %136 = add i32 %134, %135
  %137 = add i32 %136, %23
  %138 = getelementptr inbounds float, ptr %0, i32 %137
  %139 = load float, ptr %138, align 4
  %140 = fcmp uno float %139, %139
  br i1 %140, label %141, label %142

141:                                              ; preds = %29
  br label %155

142:                                              ; preds = %29
  %143 = fcmp uno float %133, %133
  %144 = select i1 %143, float 0x7FF8000000000000, float %133
  %145 = fcmp ult float %139, %144
  br i1 %145, label %146, label %154

146:                                              ; preds = %142
  %147 = bitcast float %144 to i32
  %148 = icmp sge i32 %147, 0
  br i1 %148, label %149, label %151

149:                                              ; preds = %146
  %150 = atomicrmw max ptr %138, i32 %147 monotonic, align 4
  br label %153

151:                                              ; preds = %146
  %152 = atomicrmw umin ptr %138, i32 %147 monotonic, align 4
  br label %153

153:                                              ; preds = %149, %151
  br label %154

154:                                              ; preds = %153, %142
  br label %155

155:                                              ; preds = %141, %154
  br label %156

156:                                              ; preds = %155, %10
  ret void
}

define internal float @fused_scatter_11_bitcast_1290_136(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = mul i32 %11, 14
  %15 = add i32 %14, %12
  %16 = getelementptr inbounds i32, ptr %4, i32 %15
  %17 = load i32, ptr %16, align 4, !invariant.load !3
  %18 = call i32 @llvm.smin.i32(i32 %17, i32 100)
  %19 = call i32 @llvm.smax.i32(i32 %18, i32 0)
  %20 = mul i32 %19, 20
  %21 = add i32 %20, %10
  %22 = getelementptr inbounds float, ptr %3, i32 %21
  %23 = load float, ptr %22, align 4, !invariant.load !3
  ret float %23
}

define internal i32 @fused_scatter_11_maximum_82_13(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  %14 = call float @fused_scatter_11_bitcast_1290_136(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 6, i32 %11, i32 %12)
  %15 = getelementptr inbounds float, ptr %5, i32 %11
  %16 = load float, ptr %15, align 4, !invariant.load !3
  %17 = call float @fused_scatter_11_broadcast_3142_49(ptr %0, ptr %1, ptr %2, ptr %3, ptr %4, ptr %5, ptr %6, ptr %7, ptr %8, ptr %9, i32 %10, i32 %11, i32 %12)
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

define internal float @fused_scatter_11_broadcast_3142_49(ptr noalias %0, ptr noalias %1, ptr noalias %2, ptr noalias %3, ptr noalias %4, ptr noalias %5, ptr noalias %6, ptr noalias %7, ptr noalias %8, ptr noalias %9, i32 %10, i32 %11, i32 %12) {
  ret float 1.000000e+00
}

define ptx_kernel void @input_transpose_fusion(ptr noalias align 256 dereferenceable(32440320) %0, ptr noalias align 256 dereferenceable(32440320) %1) #0 {
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

define ptx_kernel void @loop_broadcast_fusion_3(ptr noalias align 256 dereferenceable(4096) %0, ptr noalias align 256 dereferenceable(4096) %1) #0 {
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %5 = mul i32 %3, 128
  %6 = add i32 %5, %4
  %7 = getelementptr inbounds i8, ptr %0, i32 %6
  store i8 0, ptr %7, align 1
  %8 = getelementptr inbounds i8, ptr %1, i32 %6
  store i8 0, ptr %8, align 1
  ret void
}

define ptx_kernel void @loop_broadcast_fusion(ptr noalias align 256 dereferenceable(32768) %0) #0 {
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
!1 = !{i32 0, i32 192}
!2 = !{i32 0, i32 128}
!3 = !{}
!4 = !{i32 0, i32 64}
!5 = !{i32 0, i32 32}
!6 = !{i32 0, i32 448}
!7 = !{i32 0, i32 352}
!8 = !{i32 0, i32 4096}
!9 = !{i32 0, i32 8}
!10 = !{i32 0, i32 224}
!11 = !{i32 0, i32 2}
!12 = !{i32 0, i32 1320}
!13 = !{i32 0, i32 896}
!14 = !{i32 0, i32 217800}
!15 = !{i32 0, i32 256}
!16 = !{i32 0, i32 512}
!17 = !{i32 0, i32 84480}
!18 = !{i32 0, i32 10576}
!19 = !{i32 0, i32 5280}
!20 = !{i32 0, i32 336}
!21 = !{i32 0, i32 15840}
!22 = !{i32 0, i32 21120}

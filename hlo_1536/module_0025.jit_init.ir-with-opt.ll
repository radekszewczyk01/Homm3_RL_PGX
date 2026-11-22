; ModuleID = 'jit_init'
source_filename = "jit_init"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

@buffer_for_constant_56_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 256
@buffer_for_constant_2_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 256
@"sort_$_4_$_0_tile_param_0" = private unnamed_addr addrspace(3) global [64 x i32] undef
@"sort_$_4_$_0_tile_param_1" = private unnamed_addr addrspace(3) global [64 x i32] undef
@"sort_$_4_$_0_tile_param_2" = private unnamed_addr addrspace(3) global [64 x i32] undef
@"sort_$_5_$_0_tile_param_0" = private unnamed_addr addrspace(3) global [64 x i32] undef
@"sort_$_5_$_0_tile_param_1" = private unnamed_addr addrspace(3) global [64 x i32] undef
@"sort_$_5_$_0_tile_param_2" = private unnamed_addr addrspace(3) global [64 x i32] undef
@"sort_$_6_$_0_tile_param_0" = private unnamed_addr addrspace(3) global [256 x float] undef
@"sort_$_6_$_0_tile_param_1" = private unnamed_addr addrspace(3) global [256 x i32] undef
@buffer_for_constant_1101_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\00\00\C0\7F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 256
@buffer_for_constant_1102_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 256
@buffer_for_constant_1103_0 = local_unnamed_addr addrspace(1) constant [64 x i8] zeroinitializer, align 256
@buffer_for_constant_1105_0 = local_unnamed_addr addrspace(1) constant [64 x i8] c"\FF\FF\FF\7F\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 256
@shared_0 = private unnamed_addr addrspace(3) global [1056 x float] undef
@shared_01 = private unnamed_addr addrspace(3) global [1056 x float] undef

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_2(ptr noalias readonly align 16 captures(none) dereferenceable(12288) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(36864) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = udiv i32 %5, 12
  %8 = mul i32 %7, 12
  %.decomposed = sub i32 %5, %8
  %9 = shl nuw nsw i32 %.decomposed, 8
  %10 = shl nuw nsw i32 %6, 1
  %11 = or disjoint i32 %9, %10
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %3, i64 %12
  %14 = load <2 x i32>, ptr addrspace(1) %13, align 8, !invariant.load !4
  %15 = extractelement <2 x i32> %14, i32 0
  %16 = extractelement <2 x i32> %14, i32 1
  %17 = add i32 %16, %7
  %18 = tail call i32 @llvm.fshl.i32(i32 %17, i32 %17, i32 13)
  %19 = add i32 %15, %17
  %20 = xor i32 %19, %18
  %21 = tail call i32 @llvm.fshl.i32(i32 %20, i32 %20, i32 15)
  %22 = add i32 %20, %19
  %23 = xor i32 %22, %21
  %24 = add i32 %23, %22
  %25 = tail call i32 @llvm.fshl.i32(i32 %23, i32 %23, i32 26)
  %26 = xor i32 %24, %25
  %27 = tail call i32 @llvm.fshl.i32(i32 %26, i32 %26, i32 6)
  %28 = add i32 %26, %24
  %29 = xor i32 %28, %27
  %30 = xor i32 %16, %15
  %31 = xor i32 %30, 466688986
  %32 = add i32 %31, 1
  %33 = add i32 %32, %29
  %34 = add i32 %28, %16
  %35 = tail call i32 @llvm.fshl.i32(i32 %33, i32 %33, i32 17)
  %36 = add i32 %34, %33
  %37 = xor i32 %36, %35
  %38 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 29)
  %39 = add i32 %37, %36
  %40 = xor i32 %39, %38
  %41 = add i32 %40, %39
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 16)
  %43 = xor i32 %41, %42
  %44 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 24)
  %45 = add i32 %43, %41
  %46 = xor i32 %45, %44
  %47 = add i32 %15, 2
  %48 = add i32 %47, %46
  %49 = add i32 %45, %31
  %50 = tail call i32 @llvm.fshl.i32(i32 %48, i32 %48, i32 13)
  %51 = add i32 %49, %48
  %52 = xor i32 %51, %50
  %53 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 15)
  %54 = add i32 %52, %51
  %55 = xor i32 %54, %53
  %56 = add i32 %55, %54
  %57 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 26)
  %58 = xor i32 %56, %57
  %59 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 6)
  %60 = add i32 %58, %56
  %61 = xor i32 %60, %59
  %62 = add i32 %16, 3
  %63 = add i32 %62, %15
  %64 = add i32 %63, %60
  %65 = add i32 %64, %61
  %66 = shl nuw nsw i32 %5, 7
  %67 = or disjoint i32 %66, %6
  %68 = zext nneg i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %68
  store i32 %65, ptr addrspace(1) %69, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(36864) %0, ptr noalias readonly align 16 captures(none) dereferenceable(12288) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(73728) %2) local_unnamed_addr #2 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %9 = udiv i32 %8, 12
  %10 = mul i32 %9, 12
  %.decomposed = sub i32 %8, %10
  %11 = shl nuw nsw i32 %.decomposed, 7
  %12 = or disjoint i32 %11, %7
  tail call void @llvm.experimental.noalias.scope.decl(metadata !5)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !8)
  %13 = mul nuw nsw i32 %9, 1536
  %14 = add nuw nsw i32 %12, %13
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %15
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !4, !alias.scope !5, !noalias !8
  %18 = shl nuw nsw i32 %12, 1
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %19
  %21 = load <2 x i32>, ptr addrspace(1) %20, align 8, !invariant.load !4, !alias.scope !10, !noalias !13
  %22 = extractelement <2 x i32> %21, i32 0
  %23 = extractelement <2 x i32> %21, i32 1
  %24 = add i32 %23, %9
  %25 = tail call i32 @llvm.fshl.i32(i32 %24, i32 %24, i32 13)
  %26 = add i32 %22, %24
  %27 = xor i32 %26, %25
  %28 = tail call i32 @llvm.fshl.i32(i32 %27, i32 %27, i32 15)
  %29 = add i32 %27, %26
  %30 = xor i32 %29, %28
  %31 = add i32 %30, %29
  %32 = tail call i32 @llvm.fshl.i32(i32 %30, i32 %30, i32 26)
  %33 = xor i32 %31, %32
  %34 = tail call i32 @llvm.fshl.i32(i32 %33, i32 %33, i32 6)
  %35 = add i32 %33, %31
  %36 = xor i32 %35, %34
  %37 = xor i32 %23, %22
  %38 = xor i32 %37, 466688986
  %39 = add i32 %38, 1
  %40 = add i32 %39, %36
  %41 = add i32 %35, %23
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 17)
  %43 = add i32 %40, %41
  %44 = xor i32 %43, %42
  %45 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 29)
  %46 = add i32 %44, %43
  %47 = xor i32 %46, %45
  %48 = add i32 %47, %46
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 16)
  %50 = xor i32 %48, %49
  %51 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 24)
  %52 = add i32 %50, %48
  %53 = xor i32 %52, %51
  %54 = add i32 %22, 2
  %55 = add i32 %54, %53
  %56 = add i32 %52, %38
  %57 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 13)
  %58 = add i32 %56, %55
  %59 = xor i32 %58, %57
  %60 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 15)
  %61 = add i32 %59, %58
  %62 = xor i32 %61, %60
  %63 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 26)
  %64 = add i32 %62, %61
  %65 = xor i32 %64, %63
  %66 = add i32 %65, %64
  %67 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 6)
  %68 = xor i32 %66, %67
  %69 = add i32 %23, 3
  %70 = add i32 %69, %68
  %71 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 17)
  %72 = xor i32 %71, %17
  %73 = add i32 %72, %17
  %74 = shl nuw nsw i32 %8, 7
  %75 = or disjoint i32 %74, %7
  %76 = zext nneg i32 %75 to i64
  %77 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %76
  %78 = load i32, ptr addrspace(1) %77, align 4, !invariant.load !4
  %79 = xor i32 %71, %78
  %80 = tail call i32 @llvm.fshl.i32(i32 %79, i32 %79, i32 29)
  %81 = xor i32 %73, %80
  %82 = add i32 %81, %73
  %83 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 16)
  %84 = xor i32 %82, %83
  %85 = add i32 %84, %82
  %86 = add i32 %85, %23
  %87 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 24)
  %88 = xor i32 %85, %87
  %89 = add i32 %38, 4
  %90 = add i32 %89, %88
  %91 = add i32 %86, %90
  %92 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %90, i32 13)
  %93 = xor i32 %91, %92
  %94 = add i32 %93, %91
  %95 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %93, i32 15)
  %96 = xor i32 %94, %95
  %97 = add i32 %96, %94
  %98 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %96, i32 26)
  %99 = xor i32 %97, %98
  %100 = add i32 %99, %97
  %101 = add i32 %100, %38
  %102 = shl nuw nsw i32 %7, 1
  %103 = shl nuw nsw i32 %8, 8
  %104 = or disjoint i32 %102, %103
  %105 = zext nneg i32 %104 to i64
  %106 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %105
  %107 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %99, i32 6)
  %108 = xor i32 %100, %107
  %109 = add i32 %22, 5
  %110 = add i32 %109, %108
  %111 = insertelement <2 x i32> poison, i32 %101, i32 0
  %112 = insertelement <2 x i32> %111, i32 %110, i32 1
  store <2 x i32> %112, ptr addrspace(1) %106, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_slice_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(73728) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %8) local_unnamed_addr #0 {
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %2 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %5 to ptr addrspace(1)
  %16 = addrspacecast ptr %6 to ptr addrspace(1)
  %17 = addrspacecast ptr %7 to ptr addrspace(1)
  %18 = addrspacecast ptr %8 to ptr addrspace(1)
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !15
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %21 = udiv i32 %19, 12
  %22 = mul i32 %21, 12
  %.decomposed = sub i32 %19, %22
  %23 = shl nuw nsw i32 %.decomposed, 7
  %24 = or disjoint i32 %23, %20
  %25 = icmp samesign ult i32 %19, 12
  %26 = shl nuw nsw i32 %24, 1
  %27 = zext nneg i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %27
  br i1 %25, label %29, label %185

29:                                               ; preds = %9
  %30 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 24576
  %31 = load <2 x i32>, ptr addrspace(1) %30, align 8, !invariant.load !4, !alias.scope !16
  %32 = extractelement <2 x i32> %31, i32 0
  %33 = extractelement <2 x i32> %31, i32 1
  %34 = add i32 %33, %32
  %35 = tail call i32 @llvm.fshl.i32(i32 %33, i32 %33, i32 13)
  %36 = xor i32 %34, %35
  %37 = add i32 %36, %34
  %38 = tail call i32 @llvm.fshl.i32(i32 %36, i32 %36, i32 15)
  %39 = xor i32 %37, %38
  %40 = add i32 %39, %37
  %41 = tail call i32 @llvm.fshl.i32(i32 %39, i32 %39, i32 26)
  %42 = xor i32 %40, %41
  %43 = add i32 %42, %40
  %44 = add i32 %43, %33
  %45 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %42, i32 6)
  %46 = xor i32 %43, %45
  %47 = xor i32 %32, %33
  %48 = xor i32 %47, 466688986
  %49 = add i32 %48, 1
  %50 = add i32 %49, %46
  %51 = add i32 %44, %50
  %52 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 17)
  %53 = xor i32 %51, %52
  %54 = add i32 %53, %51
  %55 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 29)
  %56 = xor i32 %54, %55
  %57 = add i32 %56, %54
  %58 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 16)
  %59 = xor i32 %57, %58
  %60 = add i32 %59, %57
  %61 = add i32 %60, %48
  %62 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 24)
  %63 = xor i32 %60, %62
  %64 = add i32 %32, 2
  %65 = add i32 %64, %63
  %66 = add i32 %61, %65
  %67 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 13)
  %68 = xor i32 %66, %67
  %69 = add i32 %68, %66
  %70 = tail call i32 @llvm.fshl.i32(i32 %68, i32 %68, i32 15)
  %71 = xor i32 %69, %70
  %72 = add i32 %71, %69
  %73 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %71, i32 26)
  %74 = xor i32 %72, %73
  %75 = add i32 %74, %72
  %76 = add i32 %75, %32
  %77 = tail call i32 @llvm.fshl.i32(i32 %74, i32 %74, i32 6)
  %78 = xor i32 %75, %77
  %79 = add i32 %33, 3
  %80 = add i32 %79, %78
  %81 = add i32 %76, %80
  %82 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 17)
  %83 = xor i32 %81, %82
  %84 = add i32 %83, %81
  %85 = tail call i32 @llvm.fshl.i32(i32 %83, i32 %83, i32 29)
  %86 = xor i32 %84, %85
  %87 = add i32 %86, %84
  %88 = tail call i32 @llvm.fshl.i32(i32 %86, i32 %86, i32 16)
  %89 = xor i32 %87, %88
  %90 = add i32 %89, %87
  %91 = add i32 %90, %33
  %92 = tail call i32 @llvm.fshl.i32(i32 %89, i32 %89, i32 24)
  %93 = xor i32 %90, %92
  %94 = add i32 %48, 4
  %95 = add i32 %94, %93
  %96 = add i32 %91, %95
  %97 = tail call i32 @llvm.fshl.i32(i32 %95, i32 %95, i32 13)
  %98 = xor i32 %96, %97
  %99 = add i32 %98, %96
  %100 = tail call i32 @llvm.fshl.i32(i32 %98, i32 %98, i32 15)
  %101 = xor i32 %99, %100
  %102 = add i32 %101, %99
  %103 = tail call i32 @llvm.fshl.i32(i32 %101, i32 %101, i32 26)
  %104 = xor i32 %102, %103
  %105 = add i32 %104, %102
  %106 = add i32 %105, %48
  %107 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %104, i32 6)
  %108 = xor i32 %105, %107
  %109 = add i32 %32, 5
  %110 = add i32 %109, %108
  %111 = add i32 %110, 1
  %112 = add i32 %111, %106
  %113 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %111, i32 13)
  %114 = xor i32 %112, %113
  %115 = add i32 %114, %112
  %116 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %114, i32 15)
  %117 = xor i32 %115, %116
  %118 = add i32 %117, %115
  %119 = tail call i32 @llvm.fshl.i32(i32 %117, i32 %117, i32 26)
  %120 = xor i32 %118, %119
  %121 = add i32 %120, %118
  %122 = add i32 %121, %110
  %123 = tail call i32 @llvm.fshl.i32(i32 %120, i32 %120, i32 6)
  %124 = xor i32 %121, %123
  %125 = xor i32 %106, %110
  %126 = xor i32 %125, 466688986
  %127 = add i32 %126, 1
  %128 = add i32 %127, %124
  %129 = add i32 %122, %128
  %130 = tail call i32 @llvm.fshl.i32(i32 %128, i32 %128, i32 17)
  %131 = xor i32 %129, %130
  %132 = add i32 %131, %129
  %133 = tail call i32 @llvm.fshl.i32(i32 %131, i32 %131, i32 29)
  %134 = xor i32 %132, %133
  %135 = add i32 %134, %132
  %136 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 16)
  %137 = xor i32 %135, %136
  %138 = add i32 %137, %135
  %139 = add i32 %138, %126
  %140 = tail call i32 @llvm.fshl.i32(i32 %137, i32 %137, i32 24)
  %141 = xor i32 %138, %140
  %142 = add i32 %106, 2
  %143 = add i32 %142, %141
  %144 = add i32 %139, %143
  %145 = tail call i32 @llvm.fshl.i32(i32 %143, i32 %143, i32 13)
  %146 = xor i32 %144, %145
  %147 = add i32 %146, %144
  %148 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %146, i32 15)
  %149 = xor i32 %147, %148
  %150 = add i32 %149, %147
  %151 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 26)
  %152 = xor i32 %150, %151
  %153 = add i32 %152, %150
  %154 = add i32 %153, %106
  %155 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %152, i32 6)
  %156 = xor i32 %153, %155
  %157 = add i32 %110, 3
  %158 = add i32 %157, %156
  %159 = add i32 %154, %158
  %160 = tail call i32 @llvm.fshl.i32(i32 %158, i32 %158, i32 17)
  %161 = xor i32 %159, %160
  %162 = add i32 %161, %159
  %163 = tail call i32 @llvm.fshl.i32(i32 %161, i32 %161, i32 29)
  %164 = xor i32 %162, %163
  %165 = add i32 %164, %162
  %166 = tail call i32 @llvm.fshl.i32(i32 %164, i32 %164, i32 16)
  %167 = xor i32 %165, %166
  %168 = add i32 %167, %165
  %169 = add i32 %168, %110
  %170 = tail call i32 @llvm.fshl.i32(i32 %167, i32 %167, i32 24)
  %171 = xor i32 %168, %170
  %172 = add i32 %126, 4
  %173 = add i32 %172, %171
  %174 = add i32 %169, %173
  %175 = tail call i32 @llvm.fshl.i32(i32 %173, i32 %173, i32 13)
  %176 = xor i32 %174, %175
  %177 = add i32 %176, %174
  %178 = tail call i32 @llvm.fshl.i32(i32 %176, i32 %176, i32 15)
  %179 = xor i32 %177, %178
  %180 = add i32 %179, %177
  %181 = tail call i32 @llvm.fshl.i32(i32 %179, i32 %179, i32 26)
  %182 = xor i32 %180, %181
  %183 = add i32 %180, %126
  %184 = add i32 %183, %182
  br label %344

185:                                              ; preds = %9
  %186 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 24576
  %187 = load <2 x i32>, ptr addrspace(1) %186, align 8, !invariant.load !4, !alias.scope !25
  %188 = extractelement <2 x i32> %187, i32 0
  %189 = extractelement <2 x i32> %187, i32 1
  %190 = tail call i32 @llvm.fshl.i32(i32 %189, i32 %189, i32 13)
  %191 = add i32 %188, %189
  %192 = xor i32 %191, %190
  %193 = tail call i32 @llvm.fshl.i32(i32 %192, i32 %192, i32 15)
  %194 = add i32 %192, %191
  %195 = xor i32 %194, %193
  %196 = tail call i32 @llvm.fshl.i32(i32 %195, i32 %195, i32 26)
  %197 = add i32 %195, %194
  %198 = xor i32 %197, %196
  %199 = tail call i32 @llvm.fshl.i32(i32 %198, i32 %198, i32 6)
  %200 = add i32 %198, %197
  %201 = xor i32 %200, %199
  %202 = xor i32 %189, %188
  %203 = xor i32 %202, 466688986
  %204 = add i32 %203, 1
  %205 = add i32 %204, %201
  %206 = tail call i32 @llvm.fshl.i32(i32 %205, i32 %205, i32 17)
  %207 = add i32 %200, %189
  %208 = add i32 %207, %205
  %209 = xor i32 %208, %206
  %210 = tail call i32 @llvm.fshl.i32(i32 %209, i32 %209, i32 29)
  %211 = add i32 %209, %208
  %212 = xor i32 %211, %210
  %213 = tail call i32 @llvm.fshl.i32(i32 %212, i32 %212, i32 16)
  %214 = add i32 %212, %211
  %215 = xor i32 %214, %213
  %216 = tail call i32 @llvm.fshl.i32(i32 %215, i32 %215, i32 24)
  %217 = add i32 %215, %214
  %218 = xor i32 %217, %216
  %219 = add i32 %188, 2
  %220 = add i32 %219, %218
  %221 = tail call i32 @llvm.fshl.i32(i32 %220, i32 %220, i32 13)
  %222 = add i32 %217, %203
  %223 = add i32 %222, %220
  %224 = xor i32 %223, %221
  %225 = tail call i32 @llvm.fshl.i32(i32 %224, i32 %224, i32 15)
  %226 = add i32 %224, %223
  %227 = xor i32 %226, %225
  %228 = tail call i32 @llvm.fshl.i32(i32 %227, i32 %227, i32 26)
  %229 = add i32 %227, %226
  %230 = xor i32 %229, %228
  %231 = tail call i32 @llvm.fshl.i32(i32 %230, i32 %230, i32 6)
  %232 = add i32 %230, %229
  %233 = xor i32 %232, %231
  %234 = add i32 %189, 3
  %235 = add i32 %234, %233
  %236 = tail call i32 @llvm.fshl.i32(i32 %235, i32 %235, i32 17)
  %237 = add i32 %232, %188
  %238 = add i32 %237, %235
  %239 = xor i32 %238, %236
  %240 = tail call i32 @llvm.fshl.i32(i32 %239, i32 %239, i32 29)
  %241 = add i32 %239, %238
  %242 = xor i32 %241, %240
  %243 = tail call i32 @llvm.fshl.i32(i32 %242, i32 %242, i32 16)
  %244 = add i32 %242, %241
  %245 = xor i32 %244, %243
  %246 = tail call i32 @llvm.fshl.i32(i32 %245, i32 %245, i32 24)
  %247 = add i32 %245, %244
  %248 = xor i32 %247, %246
  %249 = add i32 %203, 4
  %250 = add i32 %249, %248
  %251 = tail call i32 @llvm.fshl.i32(i32 %250, i32 %250, i32 13)
  %252 = add i32 %247, %189
  %253 = add i32 %252, %250
  %254 = xor i32 %253, %251
  %255 = tail call i32 @llvm.fshl.i32(i32 %254, i32 %254, i32 15)
  %256 = add i32 %254, %253
  %257 = xor i32 %256, %255
  %258 = tail call i32 @llvm.fshl.i32(i32 %257, i32 %257, i32 26)
  %259 = add i32 %257, %256
  %260 = xor i32 %259, %258
  %261 = tail call i32 @llvm.fshl.i32(i32 %260, i32 %260, i32 6)
  %262 = add i32 %260, %259
  %263 = xor i32 %262, %261
  %264 = add i32 %188, 5
  %265 = add i32 %264, %263
  %266 = add i32 %265, 1
  %267 = tail call i32 @llvm.fshl.i32(i32 %266, i32 %266, i32 13)
  %268 = add i32 %262, %203
  %269 = add i32 %266, %268
  %270 = xor i32 %269, %267
  %271 = tail call i32 @llvm.fshl.i32(i32 %270, i32 %270, i32 15)
  %272 = add i32 %270, %269
  %273 = xor i32 %272, %271
  %274 = tail call i32 @llvm.fshl.i32(i32 %273, i32 %273, i32 26)
  %275 = add i32 %273, %272
  %276 = xor i32 %275, %274
  %277 = tail call i32 @llvm.fshl.i32(i32 %276, i32 %276, i32 6)
  %278 = add i32 %276, %275
  %279 = xor i32 %278, %277
  %280 = xor i32 %268, %265
  %281 = xor i32 %280, 466688986
  %282 = add i32 %281, 1
  %283 = add i32 %282, %279
  %284 = tail call i32 @llvm.fshl.i32(i32 %283, i32 %283, i32 17)
  %285 = add i32 %278, %265
  %286 = add i32 %285, %283
  %287 = xor i32 %286, %284
  %288 = tail call i32 @llvm.fshl.i32(i32 %287, i32 %287, i32 29)
  %289 = add i32 %287, %286
  %290 = xor i32 %289, %288
  %291 = tail call i32 @llvm.fshl.i32(i32 %290, i32 %290, i32 16)
  %292 = add i32 %290, %289
  %293 = xor i32 %292, %291
  %294 = tail call i32 @llvm.fshl.i32(i32 %293, i32 %293, i32 24)
  %295 = add i32 %293, %292
  %296 = xor i32 %295, %294
  %297 = add i32 %268, 2
  %298 = add i32 %297, %296
  %299 = tail call i32 @llvm.fshl.i32(i32 %298, i32 %298, i32 13)
  %300 = add i32 %295, %281
  %301 = add i32 %300, %298
  %302 = xor i32 %301, %299
  %303 = tail call i32 @llvm.fshl.i32(i32 %302, i32 %302, i32 15)
  %304 = add i32 %302, %301
  %305 = xor i32 %304, %303
  %306 = tail call i32 @llvm.fshl.i32(i32 %305, i32 %305, i32 26)
  %307 = add i32 %305, %304
  %308 = xor i32 %307, %306
  %309 = tail call i32 @llvm.fshl.i32(i32 %308, i32 %308, i32 6)
  %310 = add i32 %308, %307
  %311 = xor i32 %310, %309
  %312 = add i32 %265, 3
  %313 = add i32 %312, %311
  %314 = tail call i32 @llvm.fshl.i32(i32 %313, i32 %313, i32 17)
  %315 = add i32 %310, %268
  %316 = add i32 %315, %313
  %317 = xor i32 %316, %314
  %318 = tail call i32 @llvm.fshl.i32(i32 %317, i32 %317, i32 29)
  %319 = add i32 %317, %316
  %320 = xor i32 %319, %318
  %321 = tail call i32 @llvm.fshl.i32(i32 %320, i32 %320, i32 16)
  %322 = add i32 %320, %319
  %323 = xor i32 %322, %321
  %324 = tail call i32 @llvm.fshl.i32(i32 %323, i32 %323, i32 24)
  %325 = add i32 %323, %322
  %326 = xor i32 %325, %324
  %327 = add i32 %281, 4
  %328 = add i32 %327, %326
  %329 = tail call i32 @llvm.fshl.i32(i32 %328, i32 %328, i32 13)
  %330 = add i32 %325, %265
  %331 = add i32 %330, %328
  %332 = xor i32 %331, %329
  %333 = tail call i32 @llvm.fshl.i32(i32 %332, i32 %332, i32 15)
  %334 = add i32 %332, %331
  %335 = xor i32 %334, %333
  %336 = tail call i32 @llvm.fshl.i32(i32 %335, i32 %335, i32 26)
  %337 = add i32 %335, %334
  %338 = xor i32 %337, %336
  %339 = tail call i32 @llvm.fshl.i32(i32 %338, i32 %338, i32 6)
  %340 = add i32 %338, %337
  %341 = xor i32 %340, %339
  %342 = add i32 %268, 5
  %343 = add i32 %342, %341
  br label %344

344:                                              ; preds = %185, %29
  %345 = phi i32 [ %343, %185 ], [ %184, %29 ]
  %346 = shl nuw nsw i32 %19, 7
  %347 = and i32 %20, 126
  %348 = or disjoint i32 %346, %347
  %349 = and i32 %20, 1
  %.not.not = icmp eq i32 %349, 0
  %350 = zext nneg i32 %348 to i64
  %351 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %350
  br i1 %.not.not, label %352, label %509

352:                                              ; preds = %344
  %353 = getelementptr inbounds i8, ptr addrspace(1) %351, i64 24576
  %354 = load <2 x i32>, ptr addrspace(1) %353, align 8, !invariant.load !4, !alias.scope !34
  %355 = extractelement <2 x i32> %354, i32 0
  %356 = extractelement <2 x i32> %354, i32 1
  %357 = add i32 %356, 1
  %358 = add i32 %357, %355
  %359 = tail call i32 @llvm.fshl.i32(i32 %357, i32 %357, i32 13)
  %360 = xor i32 %358, %359
  %361 = add i32 %360, %358
  %362 = tail call i32 @llvm.fshl.i32(i32 %360, i32 %360, i32 15)
  %363 = xor i32 %361, %362
  %364 = add i32 %363, %361
  %365 = tail call i32 @llvm.fshl.i32(i32 %363, i32 %363, i32 26)
  %366 = xor i32 %364, %365
  %367 = add i32 %366, %364
  %368 = add i32 %367, %356
  %369 = tail call i32 @llvm.fshl.i32(i32 %366, i32 %366, i32 6)
  %370 = xor i32 %367, %369
  %371 = xor i32 %355, %356
  %372 = xor i32 %371, 466688986
  %373 = add i32 %372, 1
  %374 = add i32 %373, %370
  %375 = add i32 %368, %374
  %376 = tail call i32 @llvm.fshl.i32(i32 %374, i32 %374, i32 17)
  %377 = xor i32 %375, %376
  %378 = add i32 %377, %375
  %379 = tail call i32 @llvm.fshl.i32(i32 %377, i32 %377, i32 29)
  %380 = xor i32 %378, %379
  %381 = add i32 %380, %378
  %382 = tail call i32 @llvm.fshl.i32(i32 %380, i32 %380, i32 16)
  %383 = xor i32 %381, %382
  %384 = add i32 %383, %381
  %385 = add i32 %384, %372
  %386 = tail call i32 @llvm.fshl.i32(i32 %383, i32 %383, i32 24)
  %387 = xor i32 %384, %386
  %388 = add i32 %355, 2
  %389 = add i32 %388, %387
  %390 = add i32 %385, %389
  %391 = tail call i32 @llvm.fshl.i32(i32 %389, i32 %389, i32 13)
  %392 = xor i32 %390, %391
  %393 = add i32 %392, %390
  %394 = tail call i32 @llvm.fshl.i32(i32 %392, i32 %392, i32 15)
  %395 = xor i32 %393, %394
  %396 = add i32 %395, %393
  %397 = tail call i32 @llvm.fshl.i32(i32 %395, i32 %395, i32 26)
  %398 = xor i32 %396, %397
  %399 = add i32 %398, %396
  %400 = add i32 %399, %355
  %401 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 6)
  %402 = xor i32 %399, %401
  %403 = add i32 %356, 3
  %404 = add i32 %403, %402
  %405 = add i32 %400, %404
  %406 = tail call i32 @llvm.fshl.i32(i32 %404, i32 %404, i32 17)
  %407 = xor i32 %405, %406
  %408 = add i32 %407, %405
  %409 = tail call i32 @llvm.fshl.i32(i32 %407, i32 %407, i32 29)
  %410 = xor i32 %408, %409
  %411 = add i32 %410, %408
  %412 = tail call i32 @llvm.fshl.i32(i32 %410, i32 %410, i32 16)
  %413 = xor i32 %411, %412
  %414 = add i32 %413, %411
  %415 = add i32 %414, %356
  %416 = tail call i32 @llvm.fshl.i32(i32 %413, i32 %413, i32 24)
  %417 = xor i32 %414, %416
  %418 = add i32 %372, 4
  %419 = add i32 %418, %417
  %420 = add i32 %415, %419
  %421 = tail call i32 @llvm.fshl.i32(i32 %419, i32 %419, i32 13)
  %422 = xor i32 %420, %421
  %423 = add i32 %422, %420
  %424 = tail call i32 @llvm.fshl.i32(i32 %422, i32 %422, i32 15)
  %425 = xor i32 %423, %424
  %426 = add i32 %425, %423
  %427 = tail call i32 @llvm.fshl.i32(i32 %425, i32 %425, i32 26)
  %428 = xor i32 %426, %427
  %429 = add i32 %428, %426
  %430 = add i32 %429, %372
  %431 = tail call i32 @llvm.fshl.i32(i32 %428, i32 %428, i32 6)
  %432 = xor i32 %429, %431
  %433 = add i32 %355, 5
  %434 = add i32 %433, %432
  %435 = add i32 %434, 1
  %436 = add i32 %435, %430
  %437 = tail call i32 @llvm.fshl.i32(i32 %435, i32 %435, i32 13)
  %438 = xor i32 %436, %437
  %439 = add i32 %438, %436
  %440 = tail call i32 @llvm.fshl.i32(i32 %438, i32 %438, i32 15)
  %441 = xor i32 %439, %440
  %442 = add i32 %441, %439
  %443 = tail call i32 @llvm.fshl.i32(i32 %441, i32 %441, i32 26)
  %444 = xor i32 %442, %443
  %445 = add i32 %444, %442
  %446 = add i32 %445, %434
  %447 = tail call i32 @llvm.fshl.i32(i32 %444, i32 %444, i32 6)
  %448 = xor i32 %445, %447
  %449 = xor i32 %430, %434
  %450 = xor i32 %449, 466688986
  %451 = add i32 %450, 1
  %452 = add i32 %451, %448
  %453 = add i32 %446, %452
  %454 = tail call i32 @llvm.fshl.i32(i32 %452, i32 %452, i32 17)
  %455 = xor i32 %453, %454
  %456 = add i32 %455, %453
  %457 = tail call i32 @llvm.fshl.i32(i32 %455, i32 %455, i32 29)
  %458 = xor i32 %456, %457
  %459 = add i32 %458, %456
  %460 = tail call i32 @llvm.fshl.i32(i32 %458, i32 %458, i32 16)
  %461 = xor i32 %459, %460
  %462 = add i32 %461, %459
  %463 = add i32 %462, %450
  %464 = tail call i32 @llvm.fshl.i32(i32 %461, i32 %461, i32 24)
  %465 = xor i32 %462, %464
  %466 = add i32 %430, 2
  %467 = add i32 %466, %465
  %468 = add i32 %463, %467
  %469 = tail call i32 @llvm.fshl.i32(i32 %467, i32 %467, i32 13)
  %470 = xor i32 %468, %469
  %471 = add i32 %470, %468
  %472 = tail call i32 @llvm.fshl.i32(i32 %470, i32 %470, i32 15)
  %473 = xor i32 %471, %472
  %474 = add i32 %473, %471
  %475 = tail call i32 @llvm.fshl.i32(i32 %473, i32 %473, i32 26)
  %476 = xor i32 %474, %475
  %477 = add i32 %476, %474
  %478 = add i32 %477, %430
  %479 = tail call i32 @llvm.fshl.i32(i32 %476, i32 %476, i32 6)
  %480 = xor i32 %477, %479
  %481 = add i32 %434, 3
  %482 = add i32 %481, %480
  %483 = add i32 %478, %482
  %484 = tail call i32 @llvm.fshl.i32(i32 %482, i32 %482, i32 17)
  %485 = xor i32 %483, %484
  %486 = add i32 %485, %483
  %487 = tail call i32 @llvm.fshl.i32(i32 %485, i32 %485, i32 29)
  %488 = xor i32 %486, %487
  %489 = add i32 %488, %486
  %490 = tail call i32 @llvm.fshl.i32(i32 %488, i32 %488, i32 16)
  %491 = xor i32 %489, %490
  %492 = add i32 %491, %489
  %493 = add i32 %492, %434
  %494 = tail call i32 @llvm.fshl.i32(i32 %491, i32 %491, i32 24)
  %495 = xor i32 %492, %494
  %496 = add i32 %450, 4
  %497 = add i32 %496, %495
  %498 = add i32 %493, %497
  %499 = tail call i32 @llvm.fshl.i32(i32 %497, i32 %497, i32 13)
  %500 = xor i32 %498, %499
  %501 = add i32 %500, %498
  %502 = tail call i32 @llvm.fshl.i32(i32 %500, i32 %500, i32 15)
  %503 = xor i32 %501, %502
  %504 = add i32 %503, %501
  %505 = tail call i32 @llvm.fshl.i32(i32 %503, i32 %503, i32 26)
  %506 = xor i32 %504, %505
  %507 = add i32 %504, %450
  %508 = add i32 %507, %506
  br label %669

509:                                              ; preds = %344
  %510 = getelementptr inbounds i8, ptr addrspace(1) %351, i64 24576
  %511 = load <2 x i32>, ptr addrspace(1) %510, align 8, !invariant.load !4, !alias.scope !43
  %512 = extractelement <2 x i32> %511, i32 0
  %513 = extractelement <2 x i32> %511, i32 1
  %514 = add i32 %513, 1
  %515 = tail call i32 @llvm.fshl.i32(i32 %514, i32 %514, i32 13)
  %516 = add i32 %512, %514
  %517 = xor i32 %516, %515
  %518 = tail call i32 @llvm.fshl.i32(i32 %517, i32 %517, i32 15)
  %519 = add i32 %517, %516
  %520 = xor i32 %519, %518
  %521 = tail call i32 @llvm.fshl.i32(i32 %520, i32 %520, i32 26)
  %522 = add i32 %520, %519
  %523 = xor i32 %522, %521
  %524 = tail call i32 @llvm.fshl.i32(i32 %523, i32 %523, i32 6)
  %525 = add i32 %523, %522
  %526 = xor i32 %525, %524
  %527 = xor i32 %513, %512
  %528 = xor i32 %527, 466688986
  %529 = add i32 %528, 1
  %530 = add i32 %529, %526
  %531 = tail call i32 @llvm.fshl.i32(i32 %530, i32 %530, i32 17)
  %532 = add i32 %525, %513
  %533 = add i32 %532, %530
  %534 = xor i32 %533, %531
  %535 = tail call i32 @llvm.fshl.i32(i32 %534, i32 %534, i32 29)
  %536 = add i32 %534, %533
  %537 = xor i32 %536, %535
  %538 = tail call i32 @llvm.fshl.i32(i32 %537, i32 %537, i32 16)
  %539 = add i32 %537, %536
  %540 = xor i32 %539, %538
  %541 = tail call i32 @llvm.fshl.i32(i32 %540, i32 %540, i32 24)
  %542 = add i32 %540, %539
  %543 = xor i32 %542, %541
  %544 = add i32 %512, 2
  %545 = add i32 %544, %543
  %546 = tail call i32 @llvm.fshl.i32(i32 %545, i32 %545, i32 13)
  %547 = add i32 %542, %528
  %548 = add i32 %547, %545
  %549 = xor i32 %548, %546
  %550 = tail call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 15)
  %551 = add i32 %549, %548
  %552 = xor i32 %551, %550
  %553 = tail call i32 @llvm.fshl.i32(i32 %552, i32 %552, i32 26)
  %554 = add i32 %552, %551
  %555 = xor i32 %554, %553
  %556 = tail call i32 @llvm.fshl.i32(i32 %555, i32 %555, i32 6)
  %557 = add i32 %555, %554
  %558 = xor i32 %557, %556
  %559 = add i32 %513, 3
  %560 = add i32 %559, %558
  %561 = tail call i32 @llvm.fshl.i32(i32 %560, i32 %560, i32 17)
  %562 = add i32 %557, %512
  %563 = add i32 %562, %560
  %564 = xor i32 %563, %561
  %565 = tail call i32 @llvm.fshl.i32(i32 %564, i32 %564, i32 29)
  %566 = add i32 %564, %563
  %567 = xor i32 %566, %565
  %568 = tail call i32 @llvm.fshl.i32(i32 %567, i32 %567, i32 16)
  %569 = add i32 %567, %566
  %570 = xor i32 %569, %568
  %571 = tail call i32 @llvm.fshl.i32(i32 %570, i32 %570, i32 24)
  %572 = add i32 %570, %569
  %573 = xor i32 %572, %571
  %574 = add i32 %528, 4
  %575 = add i32 %574, %573
  %576 = tail call i32 @llvm.fshl.i32(i32 %575, i32 %575, i32 13)
  %577 = add i32 %572, %513
  %578 = add i32 %577, %575
  %579 = xor i32 %578, %576
  %580 = tail call i32 @llvm.fshl.i32(i32 %579, i32 %579, i32 15)
  %581 = add i32 %579, %578
  %582 = xor i32 %581, %580
  %583 = tail call i32 @llvm.fshl.i32(i32 %582, i32 %582, i32 26)
  %584 = add i32 %582, %581
  %585 = xor i32 %584, %583
  %586 = tail call i32 @llvm.fshl.i32(i32 %585, i32 %585, i32 6)
  %587 = add i32 %585, %584
  %588 = xor i32 %587, %586
  %589 = add i32 %512, 5
  %590 = add i32 %589, %588
  %591 = add i32 %590, 1
  %592 = tail call i32 @llvm.fshl.i32(i32 %591, i32 %591, i32 13)
  %593 = add i32 %587, %528
  %594 = add i32 %591, %593
  %595 = xor i32 %594, %592
  %596 = tail call i32 @llvm.fshl.i32(i32 %595, i32 %595, i32 15)
  %597 = add i32 %595, %594
  %598 = xor i32 %597, %596
  %599 = tail call i32 @llvm.fshl.i32(i32 %598, i32 %598, i32 26)
  %600 = add i32 %598, %597
  %601 = xor i32 %600, %599
  %602 = tail call i32 @llvm.fshl.i32(i32 %601, i32 %601, i32 6)
  %603 = add i32 %601, %600
  %604 = xor i32 %603, %602
  %605 = xor i32 %593, %590
  %606 = xor i32 %605, 466688986
  %607 = add i32 %606, 1
  %608 = add i32 %607, %604
  %609 = tail call i32 @llvm.fshl.i32(i32 %608, i32 %608, i32 17)
  %610 = add i32 %603, %590
  %611 = add i32 %610, %608
  %612 = xor i32 %611, %609
  %613 = tail call i32 @llvm.fshl.i32(i32 %612, i32 %612, i32 29)
  %614 = add i32 %612, %611
  %615 = xor i32 %614, %613
  %616 = tail call i32 @llvm.fshl.i32(i32 %615, i32 %615, i32 16)
  %617 = add i32 %615, %614
  %618 = xor i32 %617, %616
  %619 = tail call i32 @llvm.fshl.i32(i32 %618, i32 %618, i32 24)
  %620 = add i32 %618, %617
  %621 = xor i32 %620, %619
  %622 = add i32 %593, 2
  %623 = add i32 %622, %621
  %624 = tail call i32 @llvm.fshl.i32(i32 %623, i32 %623, i32 13)
  %625 = add i32 %620, %606
  %626 = add i32 %625, %623
  %627 = xor i32 %626, %624
  %628 = tail call i32 @llvm.fshl.i32(i32 %627, i32 %627, i32 15)
  %629 = add i32 %627, %626
  %630 = xor i32 %629, %628
  %631 = tail call i32 @llvm.fshl.i32(i32 %630, i32 %630, i32 26)
  %632 = add i32 %630, %629
  %633 = xor i32 %632, %631
  %634 = tail call i32 @llvm.fshl.i32(i32 %633, i32 %633, i32 6)
  %635 = add i32 %633, %632
  %636 = xor i32 %635, %634
  %637 = add i32 %590, 3
  %638 = add i32 %637, %636
  %639 = tail call i32 @llvm.fshl.i32(i32 %638, i32 %638, i32 17)
  %640 = add i32 %635, %593
  %641 = add i32 %640, %638
  %642 = xor i32 %641, %639
  %643 = tail call i32 @llvm.fshl.i32(i32 %642, i32 %642, i32 29)
  %644 = add i32 %642, %641
  %645 = xor i32 %644, %643
  %646 = tail call i32 @llvm.fshl.i32(i32 %645, i32 %645, i32 16)
  %647 = add i32 %645, %644
  %648 = xor i32 %647, %646
  %649 = tail call i32 @llvm.fshl.i32(i32 %648, i32 %648, i32 24)
  %650 = add i32 %648, %647
  %651 = xor i32 %650, %649
  %652 = add i32 %606, 4
  %653 = add i32 %652, %651
  %654 = tail call i32 @llvm.fshl.i32(i32 %653, i32 %653, i32 13)
  %655 = add i32 %650, %590
  %656 = add i32 %655, %653
  %657 = xor i32 %656, %654
  %658 = tail call i32 @llvm.fshl.i32(i32 %657, i32 %657, i32 15)
  %659 = add i32 %657, %656
  %660 = xor i32 %659, %658
  %661 = tail call i32 @llvm.fshl.i32(i32 %660, i32 %660, i32 26)
  %662 = add i32 %660, %659
  %663 = xor i32 %662, %661
  %664 = tail call i32 @llvm.fshl.i32(i32 %663, i32 %663, i32 6)
  %665 = add i32 %663, %662
  %666 = xor i32 %665, %664
  %667 = add i32 %593, 5
  %668 = add i32 %667, %666
  br label %669

669:                                              ; preds = %509, %352
  %670 = phi i32 [ %668, %509 ], [ %508, %352 ]
  %671 = load <2 x i32>, ptr addrspace(1) %28, align 8, !invariant.load !4
  %672 = extractelement <2 x i32> %671, i32 0
  %673 = extractelement <2 x i32> %671, i32 1
  %674 = add i32 %673, %21
  %675 = tail call i32 @llvm.fshl.i32(i32 %674, i32 %674, i32 13)
  %676 = add i32 %672, %674
  %677 = xor i32 %676, %675
  %678 = tail call i32 @llvm.fshl.i32(i32 %677, i32 %677, i32 15)
  %679 = add i32 %677, %676
  %680 = xor i32 %679, %678
  %681 = add i32 %680, %679
  %682 = tail call i32 @llvm.fshl.i32(i32 %680, i32 %680, i32 26)
  %683 = xor i32 %681, %682
  %684 = tail call i32 @llvm.fshl.i32(i32 %683, i32 %683, i32 6)
  %685 = add i32 %683, %681
  %686 = xor i32 %685, %684
  %687 = xor i32 %673, %672
  %688 = xor i32 %687, 466688986
  %689 = add i32 %688, 1
  %690 = add i32 %689, %686
  %691 = add i32 %685, %673
  %692 = tail call i32 @llvm.fshl.i32(i32 %690, i32 %690, i32 17)
  %693 = add i32 %691, %690
  %694 = xor i32 %693, %692
  %695 = tail call i32 @llvm.fshl.i32(i32 %694, i32 %694, i32 29)
  %696 = add i32 %694, %693
  %697 = xor i32 %696, %695
  %698 = add i32 %697, %696
  %699 = tail call i32 @llvm.fshl.i32(i32 %697, i32 %697, i32 16)
  %700 = xor i32 %698, %699
  %701 = tail call i32 @llvm.fshl.i32(i32 %700, i32 %700, i32 24)
  %702 = add i32 %700, %698
  %703 = xor i32 %702, %701
  %704 = add i32 %672, 2
  %705 = add i32 %704, %703
  %706 = add i32 %702, %688
  %707 = tail call i32 @llvm.fshl.i32(i32 %705, i32 %705, i32 13)
  %708 = add i32 %706, %705
  %709 = xor i32 %708, %707
  %710 = tail call i32 @llvm.fshl.i32(i32 %709, i32 %709, i32 15)
  %711 = add i32 %709, %708
  %712 = xor i32 %711, %710
  %713 = add i32 %712, %711
  %714 = tail call i32 @llvm.fshl.i32(i32 %712, i32 %712, i32 26)
  %715 = xor i32 %713, %714
  %716 = tail call i32 @llvm.fshl.i32(i32 %715, i32 %715, i32 6)
  %717 = add i32 %715, %713
  %718 = xor i32 %717, %716
  %719 = add i32 %673, 3
  %720 = add i32 %719, %718
  %721 = add i32 %717, %672
  %722 = tail call i32 @llvm.fshl.i32(i32 %720, i32 %720, i32 17)
  %723 = add i32 %721, %720
  %724 = xor i32 %723, %722
  %725 = tail call i32 @llvm.fshl.i32(i32 %724, i32 %724, i32 29)
  %726 = add i32 %724, %723
  %727 = xor i32 %726, %725
  %728 = add i32 %727, %726
  %729 = tail call i32 @llvm.fshl.i32(i32 %727, i32 %727, i32 16)
  %730 = xor i32 %728, %729
  %731 = tail call i32 @llvm.fshl.i32(i32 %730, i32 %730, i32 24)
  %732 = add i32 %730, %728
  %733 = xor i32 %732, %731
  %734 = add i32 %688, 4
  %735 = add i32 %734, %733
  %736 = add i32 %732, %673
  %737 = tail call i32 @llvm.fshl.i32(i32 %735, i32 %735, i32 13)
  %738 = add i32 %736, %735
  %739 = xor i32 %738, %737
  %740 = tail call i32 @llvm.fshl.i32(i32 %739, i32 %739, i32 15)
  %741 = add i32 %739, %738
  %742 = xor i32 %741, %740
  %743 = tail call i32 @llvm.fshl.i32(i32 %742, i32 %742, i32 26)
  %744 = add i32 %742, %741
  %745 = xor i32 %744, %743
  %746 = add i32 %745, %744
  %747 = add i32 %746, %688
  %748 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 36864
  %749 = load <2 x i32>, ptr addrspace(1) %748, align 8, !invariant.load !4
  %750 = extractelement <2 x i32> %749, i32 0
  %751 = extractelement <2 x i32> %749, i32 1
  %752 = add i32 %751, %21
  %753 = tail call i32 @llvm.fshl.i32(i32 %752, i32 %752, i32 13)
  %754 = add i32 %750, %752
  %755 = xor i32 %754, %753
  %756 = tail call i32 @llvm.fshl.i32(i32 %755, i32 %755, i32 15)
  %757 = add i32 %755, %754
  %758 = xor i32 %757, %756
  %759 = add i32 %758, %757
  %760 = tail call i32 @llvm.fshl.i32(i32 %758, i32 %758, i32 26)
  %761 = xor i32 %759, %760
  %762 = tail call i32 @llvm.fshl.i32(i32 %761, i32 %761, i32 6)
  %763 = add i32 %761, %759
  %764 = xor i32 %763, %762
  %765 = xor i32 %751, %750
  %766 = xor i32 %765, 466688986
  %767 = add i32 %766, 1
  %768 = add i32 %767, %764
  %769 = add i32 %763, %751
  %770 = tail call i32 @llvm.fshl.i32(i32 %768, i32 %768, i32 17)
  %771 = add i32 %769, %768
  %772 = xor i32 %771, %770
  %773 = tail call i32 @llvm.fshl.i32(i32 %772, i32 %772, i32 29)
  %774 = add i32 %772, %771
  %775 = xor i32 %774, %773
  %776 = add i32 %775, %774
  %777 = tail call i32 @llvm.fshl.i32(i32 %775, i32 %775, i32 16)
  %778 = xor i32 %776, %777
  %779 = tail call i32 @llvm.fshl.i32(i32 %778, i32 %778, i32 24)
  %780 = add i32 %778, %776
  %781 = xor i32 %780, %779
  %782 = add i32 %750, 2
  %783 = add i32 %782, %781
  %784 = add i32 %780, %766
  %785 = tail call i32 @llvm.fshl.i32(i32 %783, i32 %783, i32 13)
  %786 = add i32 %784, %783
  %787 = xor i32 %786, %785
  %788 = tail call i32 @llvm.fshl.i32(i32 %787, i32 %787, i32 15)
  %789 = add i32 %787, %786
  %790 = xor i32 %789, %788
  %791 = add i32 %790, %789
  %792 = tail call i32 @llvm.fshl.i32(i32 %790, i32 %790, i32 26)
  %793 = xor i32 %791, %792
  %794 = tail call i32 @llvm.fshl.i32(i32 %793, i32 %793, i32 6)
  %795 = add i32 %793, %791
  %796 = xor i32 %795, %794
  %797 = add i32 %751, 3
  %798 = add i32 %797, %796
  %799 = add i32 %795, %750
  %800 = tail call i32 @llvm.fshl.i32(i32 %798, i32 %798, i32 17)
  %801 = add i32 %799, %798
  %802 = xor i32 %801, %800
  %803 = tail call i32 @llvm.fshl.i32(i32 %802, i32 %802, i32 29)
  %804 = add i32 %802, %801
  %805 = xor i32 %804, %803
  %806 = add i32 %805, %804
  %807 = tail call i32 @llvm.fshl.i32(i32 %805, i32 %805, i32 16)
  %808 = xor i32 %806, %807
  %809 = tail call i32 @llvm.fshl.i32(i32 %808, i32 %808, i32 24)
  %810 = add i32 %808, %806
  %811 = xor i32 %810, %809
  %812 = add i32 %766, 4
  %813 = add i32 %812, %811
  %814 = add i32 %810, %751
  %815 = tail call i32 @llvm.fshl.i32(i32 %813, i32 %813, i32 13)
  %816 = add i32 %814, %813
  %817 = xor i32 %816, %815
  %818 = tail call i32 @llvm.fshl.i32(i32 %817, i32 %817, i32 15)
  %819 = add i32 %817, %816
  %820 = xor i32 %819, %818
  %821 = tail call i32 @llvm.fshl.i32(i32 %820, i32 %820, i32 26)
  %822 = add i32 %820, %819
  %823 = xor i32 %822, %821
  %824 = add i32 %823, %822
  %825 = add i32 %824, %766
  %826 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 61440
  %827 = load <2 x i32>, ptr addrspace(1) %826, align 8, !invariant.load !4
  %828 = extractelement <2 x i32> %827, i32 0
  %829 = extractelement <2 x i32> %827, i32 1
  %830 = add i32 %829, %21
  %831 = tail call i32 @llvm.fshl.i32(i32 %830, i32 %830, i32 13)
  %832 = add i32 %828, %830
  %833 = xor i32 %832, %831
  %834 = tail call i32 @llvm.fshl.i32(i32 %833, i32 %833, i32 15)
  %835 = add i32 %833, %832
  %836 = xor i32 %835, %834
  %837 = add i32 %836, %835
  %838 = tail call i32 @llvm.fshl.i32(i32 %836, i32 %836, i32 26)
  %839 = xor i32 %837, %838
  %840 = tail call i32 @llvm.fshl.i32(i32 %839, i32 %839, i32 6)
  %841 = add i32 %839, %837
  %842 = xor i32 %841, %840
  %843 = xor i32 %829, %828
  %844 = xor i32 %843, 466688986
  %845 = add i32 %844, 1
  %846 = add i32 %845, %842
  %847 = add i32 %841, %829
  %848 = tail call i32 @llvm.fshl.i32(i32 %846, i32 %846, i32 17)
  %849 = add i32 %847, %846
  %850 = xor i32 %849, %848
  %851 = tail call i32 @llvm.fshl.i32(i32 %850, i32 %850, i32 29)
  %852 = add i32 %850, %849
  %853 = xor i32 %852, %851
  %854 = add i32 %853, %852
  %855 = tail call i32 @llvm.fshl.i32(i32 %853, i32 %853, i32 16)
  %856 = xor i32 %854, %855
  %857 = tail call i32 @llvm.fshl.i32(i32 %856, i32 %856, i32 24)
  %858 = add i32 %856, %854
  %859 = xor i32 %858, %857
  %860 = add i32 %828, 2
  %861 = add i32 %860, %859
  %862 = add i32 %858, %844
  %863 = tail call i32 @llvm.fshl.i32(i32 %861, i32 %861, i32 13)
  %864 = add i32 %862, %861
  %865 = xor i32 %864, %863
  %866 = tail call i32 @llvm.fshl.i32(i32 %865, i32 %865, i32 15)
  %867 = add i32 %865, %864
  %868 = xor i32 %867, %866
  %869 = add i32 %868, %867
  %870 = tail call i32 @llvm.fshl.i32(i32 %868, i32 %868, i32 26)
  %871 = xor i32 %869, %870
  %872 = tail call i32 @llvm.fshl.i32(i32 %871, i32 %871, i32 6)
  %873 = add i32 %871, %869
  %874 = xor i32 %873, %872
  %875 = add i32 %829, 3
  %876 = add i32 %875, %874
  %877 = add i32 %873, %828
  %878 = tail call i32 @llvm.fshl.i32(i32 %876, i32 %876, i32 17)
  %879 = add i32 %877, %876
  %880 = xor i32 %879, %878
  %881 = tail call i32 @llvm.fshl.i32(i32 %880, i32 %880, i32 29)
  %882 = add i32 %880, %879
  %883 = xor i32 %882, %881
  %884 = add i32 %883, %882
  %885 = tail call i32 @llvm.fshl.i32(i32 %883, i32 %883, i32 16)
  %886 = xor i32 %884, %885
  %887 = tail call i32 @llvm.fshl.i32(i32 %886, i32 %886, i32 24)
  %888 = add i32 %886, %884
  %889 = xor i32 %888, %887
  %890 = add i32 %844, 4
  %891 = add i32 %890, %889
  %892 = add i32 %888, %829
  %893 = tail call i32 @llvm.fshl.i32(i32 %891, i32 %891, i32 13)
  %894 = add i32 %892, %891
  %895 = xor i32 %894, %893
  %896 = tail call i32 @llvm.fshl.i32(i32 %895, i32 %895, i32 15)
  %897 = add i32 %895, %894
  %898 = xor i32 %897, %896
  %899 = tail call i32 @llvm.fshl.i32(i32 %898, i32 %898, i32 26)
  %900 = add i32 %898, %897
  %901 = xor i32 %900, %899
  %902 = add i32 %901, %900
  %903 = tail call i32 @llvm.fshl.i32(i32 %901, i32 %901, i32 6)
  %904 = xor i32 %902, %903
  %905 = add i32 %828, 5
  %906 = add i32 %905, %904
  %907 = tail call i32 @llvm.fshl.i32(i32 %823, i32 %823, i32 6)
  %908 = xor i32 %824, %907
  %909 = add i32 %750, 5
  %910 = add i32 %909, %908
  %911 = tail call i32 @llvm.fshl.i32(i32 %745, i32 %745, i32 6)
  %912 = xor i32 %746, %911
  %913 = add i32 %672, 5
  %914 = add i32 %913, %912
  %915 = add i32 %902, %844
  %916 = or disjoint i32 %346, %20
  %917 = zext nneg i32 %916 to i64
  %918 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %917
  store i32 %345, ptr addrspace(1) %918, align 4
  %919 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %917
  store i32 %670, ptr addrspace(1) %919, align 4
  %920 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %917
  store i32 %747, ptr addrspace(1) %920, align 4
  %921 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %917
  store i32 %825, ptr addrspace(1) %921, align 4
  %922 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %917
  store i32 %906, ptr addrspace(1) %922, align 4
  %923 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %917
  store i32 %910, ptr addrspace(1) %923, align 4
  %924 = getelementptr inbounds i32, ptr addrspace(1) %17, i64 %917
  store i32 %914, ptr addrspace(1) %924, align 4
  %925 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %917
  store i32 %915, ptr addrspace(1) %925, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_xor_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(12288) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(67584) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = shl nuw nsw i32 %5, 7
  %8 = or disjoint i32 %7, %6
  %9 = udiv i32 %8, 11
  %10 = mul i32 %9, 11
  %.decomposed = sub i32 %8, %10
  %11 = zext nneg i32 %9 to i64
  %12 = getelementptr inbounds i32, ptr addrspace(1) %3, i64 %11
  %13 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 6144
  %14 = load i32, ptr addrspace(1) %13, align 4, !invariant.load !4
  %15 = add i32 %14, %.decomposed
  %16 = load i32, ptr addrspace(1) %12, align 4, !invariant.load !4
  %17 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 13)
  %18 = add i32 %16, %15
  %19 = xor i32 %18, %17
  %20 = tail call i32 @llvm.fshl.i32(i32 %19, i32 %19, i32 15)
  %21 = add i32 %19, %18
  %22 = xor i32 %21, %20
  %23 = add i32 %22, %21
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 26)
  %25 = xor i32 %23, %24
  %26 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 6)
  %27 = add i32 %25, %23
  %28 = xor i32 %27, %26
  %29 = xor i32 %14, %16
  %30 = xor i32 %29, 466688986
  %31 = add i32 %30, 1
  %32 = add i32 %31, %28
  %33 = add i32 %27, %14
  %34 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 17)
  %35 = add i32 %33, %32
  %36 = xor i32 %35, %34
  %37 = tail call i32 @llvm.fshl.i32(i32 %36, i32 %36, i32 29)
  %38 = add i32 %36, %35
  %39 = xor i32 %38, %37
  %40 = add i32 %39, %38
  %41 = tail call i32 @llvm.fshl.i32(i32 %39, i32 %39, i32 16)
  %42 = xor i32 %40, %41
  %43 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %42, i32 24)
  %44 = add i32 %42, %40
  %45 = xor i32 %44, %43
  %46 = add i32 %16, 2
  %47 = add i32 %46, %45
  %48 = add i32 %44, %30
  %49 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 13)
  %50 = add i32 %48, %47
  %51 = xor i32 %50, %49
  %52 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 15)
  %53 = add i32 %51, %50
  %54 = xor i32 %53, %52
  %55 = add i32 %54, %53
  %56 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %54, i32 26)
  %57 = xor i32 %55, %56
  %58 = tail call i32 @llvm.fshl.i32(i32 %57, i32 %57, i32 6)
  %59 = add i32 %57, %55
  %60 = xor i32 %59, %58
  %61 = add i32 %14, 3
  %62 = add i32 %61, %60
  %63 = add i32 %59, %16
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 17)
  %65 = add i32 %63, %62
  %66 = xor i32 %65, %64
  %67 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 29)
  %68 = add i32 %66, %65
  %69 = xor i32 %68, %67
  %70 = add i32 %69, %68
  %71 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 16)
  %72 = xor i32 %70, %71
  %73 = tail call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 24)
  %74 = add i32 %72, %70
  %75 = xor i32 %74, %73
  %76 = add i32 %30, 4
  %77 = add i32 %76, %75
  %78 = add i32 %74, %14
  %79 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 13)
  %80 = add i32 %78, %77
  %81 = xor i32 %80, %79
  %82 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 15)
  %83 = add i32 %81, %80
  %84 = xor i32 %83, %82
  %85 = add i32 %84, %83
  %86 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 26)
  %87 = xor i32 %85, %86
  %88 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %87, i32 6)
  %89 = add i32 %87, %85
  %90 = xor i32 %89, %88
  %91 = add i32 %89, %30
  %92 = add i32 %16, 5
  %93 = add i32 %92, %90
  %94 = xor i32 %93, %91
  %95 = zext nneg i32 %8 to i64
  %96 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %95
  store i32 %94, ptr addrspace(1) %96, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @wrapped_iota_1(ptr noalias writeonly align 256 captures(none) dereferenceable(67584) %0) local_unnamed_addr #3 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %3, 7
  %6 = or disjoint i32 %5, %4
  %7 = urem i32 %6, 11
  %8 = zext nneg i32 %6 to i64
  %9 = getelementptr inbounds i32, ptr addrspace(1) %2, i64 %8
  store i32 %7, ptr addrspace(1) %9, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define ptx_kernel void @sort_4_0(ptr noalias align 256 captures(none) dereferenceable(67584) %arg0, ptr noalias align 256 captures(none) dereferenceable(67584) %arg1, ptr noalias align 256 captures(none) dereferenceable(67584) %arg2) local_unnamed_addr #4 {
entry:
  %0 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !53
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %5 = shl nuw nsw i32 %3, 3
  %linear_index187 = or disjoint i32 %5, %4
  %linear_index = zext nneg i32 %linear_index187 to i64
  %6 = lshr i64 %linear_index, 3
  %thread.id.x = zext nneg i32 %4 to i64
  %7 = shl nuw nsw i64 %linear_index, 1
  %8 = and i64 %7, 14
  %9 = icmp samesign ult i64 %8, 11
  %10 = shl nuw nsw i64 %thread.id.x, 1
  br i1 %9, label %smaller_keys_index-true, label %smaller_keys_index-after6

sort.4.0.in_bounds-after:                         ; preds = %is_last_tile-after137, %smaller_keys_index-true158, %inner_smaller_keys_index-true160
  ret void

smaller_keys_index-after6:                        ; preds = %entry, %smaller_keys_index-true5, %inner_smaller_keys_index-true7
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %11 = or disjoint i64 %10, 1
  %12 = icmp samesign ult i64 %11, 11
  br i1 %12, label %smaller_comparison_index-true, label %is_last_tile-after

is_last_tile-after:                               ; preds = %smaller_comparison_index-true, %is_smaller_than-true, %smaller_keys_index-after6
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %13 = and i64 %thread.id.x, 1
  %14 = and i64 %10, 12
  %15 = or disjoint i64 %14, %13
  %16 = xor i64 %15, 3
  %17 = icmp samesign ult i64 %15, %16
  %18 = icmp samesign ult i64 %16, 11
  %19 = and i1 %17, %18
  br i1 %19, label %smaller_comparison_index-true18, label %is_last_tile-after17

is_last_tile-after17:                             ; preds = %smaller_comparison_index-true18, %is_smaller_than-true22, %is_last_tile-after
  %20 = icmp ult i64 %11, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %20, label %smaller_comparison_index-true33, label %is_last_tile-after32

is_last_tile-after32:                             ; preds = %smaller_comparison_index-true33, %is_smaller_than-true37, %is_last_tile-after17
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %21 = and i64 %thread.id.x, 3
  %22 = and i64 %10, 8
  %23 = or disjoint i64 %22, %21
  %24 = xor i64 %23, 7
  %25 = icmp samesign ult i64 %23, %24
  %26 = icmp samesign ult i64 %24, 11
  %27 = and i1 %25, %26
  br i1 %27, label %smaller_comparison_index-true48, label %is_last_tile-after47

is_last_tile-after47:                             ; preds = %smaller_comparison_index-true48, %is_smaller_than-true52, %is_last_tile-after32
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %28 = or disjoint i64 %15, 2
  %29 = icmp samesign ult i64 %28, 11
  br i1 %29, label %smaller_comparison_index-true63, label %is_last_tile-after62

is_last_tile-after62:                             ; preds = %smaller_comparison_index-true63, %is_smaller_than-true67, %is_last_tile-after47
  %30 = icmp ult i64 %11, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %30, label %smaller_comparison_index-true78, label %is_last_tile-after77

is_last_tile-after77:                             ; preds = %smaller_comparison_index-true78, %is_smaller_than-true82, %is_last_tile-after62
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %31 = xor i64 %thread.id.x, 15
  %32 = icmp samesign ult i64 %31, 11
  br i1 %32, label %smaller_comparison_index-true93, label %is_last_tile-after92

is_last_tile-after92:                             ; preds = %smaller_comparison_index-true93, %is_smaller_than-true97, %is_last_tile-after77
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %33 = or disjoint i64 %23, 4
  %34 = icmp samesign ult i64 %33, 11
  br i1 %34, label %smaller_comparison_index-true108, label %is_last_tile-after107

is_last_tile-after107:                            ; preds = %smaller_comparison_index-true108, %is_smaller_than-true112, %is_last_tile-after92
  %35 = icmp ult i64 %28, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %35, label %smaller_comparison_index-true123, label %is_last_tile-after122

is_last_tile-after122:                            ; preds = %smaller_comparison_index-true123, %is_smaller_than-true127, %is_last_tile-after107
  %36 = icmp ult i64 %11, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %36, label %smaller_comparison_index-true138, label %is_last_tile-after137

is_last_tile-after137:                            ; preds = %smaller_comparison_index-true138, %is_smaller_than-true142, %is_last_tile-after122
  %37 = icmp ult i64 %8, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %37, label %smaller_keys_index-true150, label %sort.4.0.in_bounds-after

smaller_keys_index-true:                          ; preds = %entry
  %38 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %0, i64 0, i64 %6, i64 %8
  %39 = load i32, ptr addrspace(1) %38, align 4
  %40 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %10
  store i32 %39, ptr addrspace(3) %40, align 8
  %41 = or disjoint i64 %8, 1
  %42 = icmp samesign ult i64 %41, 11
  br i1 %42, label %inner_smaller_keys_index-true, label %smaller_keys_index-true5.critedge

inner_smaller_keys_index-true:                    ; preds = %smaller_keys_index-true
  %43 = getelementptr i8, ptr addrspace(3) %40, i64 4
  %44 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 4
  %45 = load i32, ptr addrspace(1) %44, align 4
  store i32 %45, ptr addrspace(3) %43, align 4
  %46 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %47 = load i32, ptr addrspace(1) %46, align 4
  %48 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  %49 = getelementptr i8, ptr addrspace(3) %48, i64 4
  %50 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 4
  %51 = load i32, ptr addrspace(1) %50, align 4
  store i32 %51, ptr addrspace(3) %49, align 4
  br label %smaller_keys_index-true5

smaller_keys_index-true5.critedge:                ; preds = %smaller_keys_index-true
  %52 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %53 = load i32, ptr addrspace(1) %52, align 4
  br label %smaller_keys_index-true5

smaller_keys_index-true5:                         ; preds = %smaller_keys_index-true5.critedge, %inner_smaller_keys_index-true
  %.sink = phi i32 [ %47, %inner_smaller_keys_index-true ], [ %53, %smaller_keys_index-true5.critedge ]
  %54 = icmp ult i64 %41, 11
  %55 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  store i32 %.sink, ptr addrspace(3) %55, align 8
  %56 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %2, i64 0, i64 %6, i64 %8
  %57 = load i32, ptr addrspace(1) %56, align 4
  %58 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %10
  store i32 %57, ptr addrspace(3) %58, align 8
  br i1 %54, label %inner_smaller_keys_index-true7, label %smaller_keys_index-after6

inner_smaller_keys_index-true7:                   ; preds = %smaller_keys_index-true5
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %56, i64 4
  %59 = load i32, ptr addrspace(1) %sunkaddr, align 4
  %sunkaddr251 = getelementptr i8, ptr addrspace(3) %58, i64 4
  store i32 %59, ptr addrspace(3) %sunkaddr251, align 4
  br label %smaller_keys_index-after6

smaller_comparison_index-true:                    ; preds = %smaller_keys_index-after6
  %60 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %10
  %61 = getelementptr i8, ptr addrspace(3) %60, i64 4
  %62 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %10
  %63 = getelementptr i8, ptr addrspace(3) %62, i64 4
  %.val226 = load i32, ptr addrspace(3) %61, align 4
  %.val227 = load i32, ptr addrspace(3) %60, align 4
  %.val228 = load i32, ptr addrspace(3) %63, align 4
  %.val229 = load i32, ptr addrspace(3) %62, align 4
  %64 = icmp uge i32 %.val226, %.val227
  %.not.i = icmp eq i32 %.val227, %.val226
  %65 = icmp sge i32 %.val228, %.val229
  %.v.i = select i1 %.not.i, i1 %65, i1 %64
  br i1 %.v.i, label %is_last_tile-after, label %is_smaller_than-true

is_smaller_than-true:                             ; preds = %smaller_comparison_index-true
  %66 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  %67 = getelementptr i8, ptr addrspace(3) %66, i64 4
  %68 = insertelement <2 x i32> poison, i32 %.val226, i32 0
  %69 = insertelement <2 x i32> %68, i32 %.val227, i32 1
  store <2 x i32> %69, ptr addrspace(3) %60, align 8
  %70 = load i32, ptr addrspace(3) %67, align 4
  %71 = load i32, ptr addrspace(3) %66, align 4
  %72 = insertelement <2 x i32> poison, i32 %70, i32 0
  %73 = insertelement <2 x i32> %72, i32 %71, i32 1
  store <2 x i32> %73, ptr addrspace(3) %66, align 8
  %74 = insertelement <2 x i32> poison, i32 %.val228, i32 0
  %75 = insertelement <2 x i32> %74, i32 %.val229, i32 1
  store <2 x i32> %75, ptr addrspace(3) %62, align 8
  br label %is_last_tile-after

smaller_comparison_index-true18:                  ; preds = %is_last_tile-after
  %76 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %16
  %77 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %15
  %78 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %16
  %79 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %15
  %.val222 = load i32, ptr addrspace(3) %76, align 4
  %.val223 = load i32, ptr addrspace(3) %77, align 4
  %.val224 = load i32, ptr addrspace(3) %78, align 4
  %.val225 = load i32, ptr addrspace(3) %79, align 4
  %80 = icmp uge i32 %.val222, %.val223
  %.not.i230 = icmp eq i32 %.val223, %.val222
  %81 = icmp sge i32 %.val224, %.val225
  %.v.i231 = select i1 %.not.i230, i1 %81, i1 %80
  br i1 %.v.i231, label %is_last_tile-after17, label %is_smaller_than-true22

is_smaller_than-true22:                           ; preds = %smaller_comparison_index-true18
  %82 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %15
  %83 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %16
  store i32 %.val222, ptr addrspace(3) %77, align 4
  store i32 %.val223, ptr addrspace(3) %76, align 4
  %84 = load i32, ptr addrspace(3) %83, align 4
  %85 = load i32, ptr addrspace(3) %82, align 4
  store i32 %84, ptr addrspace(3) %82, align 4
  store i32 %85, ptr addrspace(3) %83, align 4
  store i32 %.val224, ptr addrspace(3) %79, align 4
  store i32 %.val225, ptr addrspace(3) %78, align 4
  br label %is_last_tile-after17

smaller_comparison_index-true33:                  ; preds = %is_last_tile-after17
  %86 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %10
  %87 = getelementptr i8, ptr addrspace(3) %86, i64 4
  %88 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %10
  %89 = getelementptr i8, ptr addrspace(3) %88, i64 4
  %.val218 = load i32, ptr addrspace(3) %87, align 4
  %.val219 = load i32, ptr addrspace(3) %86, align 4
  %.val220 = load i32, ptr addrspace(3) %89, align 4
  %.val221 = load i32, ptr addrspace(3) %88, align 4
  %90 = icmp uge i32 %.val218, %.val219
  %.not.i232 = icmp eq i32 %.val219, %.val218
  %91 = icmp sge i32 %.val220, %.val221
  %.v.i233 = select i1 %.not.i232, i1 %91, i1 %90
  br i1 %.v.i233, label %is_last_tile-after32, label %is_smaller_than-true37

is_smaller_than-true37:                           ; preds = %smaller_comparison_index-true33
  %92 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  %93 = getelementptr i8, ptr addrspace(3) %92, i64 4
  %94 = insertelement <2 x i32> poison, i32 %.val218, i32 0
  %95 = insertelement <2 x i32> %94, i32 %.val219, i32 1
  store <2 x i32> %95, ptr addrspace(3) %86, align 8
  %96 = load i32, ptr addrspace(3) %93, align 4
  %97 = load i32, ptr addrspace(3) %92, align 4
  %98 = insertelement <2 x i32> poison, i32 %96, i32 0
  %99 = insertelement <2 x i32> %98, i32 %97, i32 1
  store <2 x i32> %99, ptr addrspace(3) %92, align 8
  %100 = insertelement <2 x i32> poison, i32 %.val220, i32 0
  %101 = insertelement <2 x i32> %100, i32 %.val221, i32 1
  store <2 x i32> %101, ptr addrspace(3) %88, align 8
  br label %is_last_tile-after32

smaller_comparison_index-true48:                  ; preds = %is_last_tile-after32
  %102 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %24
  %103 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %23
  %104 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %24
  %105 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %23
  %.val214 = load i32, ptr addrspace(3) %102, align 4
  %.val215 = load i32, ptr addrspace(3) %103, align 4
  %.val216 = load i32, ptr addrspace(3) %104, align 4
  %.val217 = load i32, ptr addrspace(3) %105, align 4
  %106 = icmp uge i32 %.val214, %.val215
  %.not.i234 = icmp eq i32 %.val215, %.val214
  %107 = icmp sge i32 %.val216, %.val217
  %.v.i235 = select i1 %.not.i234, i1 %107, i1 %106
  br i1 %.v.i235, label %is_last_tile-after47, label %is_smaller_than-true52

is_smaller_than-true52:                           ; preds = %smaller_comparison_index-true48
  %108 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %23
  %109 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %24
  store i32 %.val214, ptr addrspace(3) %103, align 4
  store i32 %.val215, ptr addrspace(3) %102, align 4
  %110 = load i32, ptr addrspace(3) %109, align 4
  %111 = load i32, ptr addrspace(3) %108, align 4
  store i32 %110, ptr addrspace(3) %108, align 4
  store i32 %111, ptr addrspace(3) %109, align 4
  store i32 %.val216, ptr addrspace(3) %105, align 4
  store i32 %.val217, ptr addrspace(3) %104, align 4
  br label %is_last_tile-after47

smaller_comparison_index-true63:                  ; preds = %is_last_tile-after47
  %112 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %15
  %113 = getelementptr i8, ptr addrspace(3) %112, i64 8
  %114 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %15
  %115 = getelementptr i8, ptr addrspace(3) %114, i64 8
  %.val210 = load i32, ptr addrspace(3) %113, align 4
  %.val211 = load i32, ptr addrspace(3) %112, align 4
  %.val212 = load i32, ptr addrspace(3) %115, align 4
  %.val213 = load i32, ptr addrspace(3) %114, align 4
  %116 = icmp uge i32 %.val210, %.val211
  %.not.i236 = icmp eq i32 %.val211, %.val210
  %117 = icmp sge i32 %.val212, %.val213
  %.v.i237 = select i1 %.not.i236, i1 %117, i1 %116
  br i1 %.v.i237, label %is_last_tile-after62, label %is_smaller_than-true67

is_smaller_than-true67:                           ; preds = %smaller_comparison_index-true63
  %118 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %15
  %119 = getelementptr i8, ptr addrspace(3) %118, i64 8
  store i32 %.val210, ptr addrspace(3) %112, align 4
  %sunkaddr252 = getelementptr i8, ptr addrspace(3) %112, i64 8
  store i32 %.val211, ptr addrspace(3) %sunkaddr252, align 4
  %120 = load i32, ptr addrspace(3) %119, align 4
  %121 = load i32, ptr addrspace(3) %118, align 4
  store i32 %120, ptr addrspace(3) %118, align 4
  store i32 %121, ptr addrspace(3) %119, align 4
  store i32 %.val212, ptr addrspace(3) %114, align 4
  %sunkaddr253 = getelementptr i8, ptr addrspace(3) %114, i64 8
  store i32 %.val213, ptr addrspace(3) %sunkaddr253, align 4
  br label %is_last_tile-after62

smaller_comparison_index-true78:                  ; preds = %is_last_tile-after62
  %122 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %10
  %123 = getelementptr i8, ptr addrspace(3) %122, i64 4
  %124 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %10
  %125 = getelementptr i8, ptr addrspace(3) %124, i64 4
  %.val206 = load i32, ptr addrspace(3) %123, align 4
  %.val207 = load i32, ptr addrspace(3) %122, align 4
  %.val208 = load i32, ptr addrspace(3) %125, align 4
  %.val209 = load i32, ptr addrspace(3) %124, align 4
  %126 = icmp uge i32 %.val206, %.val207
  %.not.i238 = icmp eq i32 %.val207, %.val206
  %127 = icmp sge i32 %.val208, %.val209
  %.v.i239 = select i1 %.not.i238, i1 %127, i1 %126
  br i1 %.v.i239, label %is_last_tile-after77, label %is_smaller_than-true82

is_smaller_than-true82:                           ; preds = %smaller_comparison_index-true78
  %128 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  %129 = getelementptr i8, ptr addrspace(3) %128, i64 4
  %130 = insertelement <2 x i32> poison, i32 %.val206, i32 0
  %131 = insertelement <2 x i32> %130, i32 %.val207, i32 1
  store <2 x i32> %131, ptr addrspace(3) %122, align 8
  %132 = load i32, ptr addrspace(3) %129, align 4
  %133 = load i32, ptr addrspace(3) %128, align 4
  %134 = insertelement <2 x i32> poison, i32 %132, i32 0
  %135 = insertelement <2 x i32> %134, i32 %133, i32 1
  store <2 x i32> %135, ptr addrspace(3) %128, align 8
  %136 = insertelement <2 x i32> poison, i32 %.val208, i32 0
  %137 = insertelement <2 x i32> %136, i32 %.val209, i32 1
  store <2 x i32> %137, ptr addrspace(3) %124, align 8
  br label %is_last_tile-after77

smaller_comparison_index-true93:                  ; preds = %is_last_tile-after77
  %138 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %31
  %139 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %thread.id.x
  %140 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %31
  %141 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %thread.id.x
  %.val202 = load i32, ptr addrspace(3) %138, align 4
  %.val203 = load i32, ptr addrspace(3) %139, align 4
  %.val204 = load i32, ptr addrspace(3) %140, align 4
  %.val205 = load i32, ptr addrspace(3) %141, align 4
  %142 = icmp uge i32 %.val202, %.val203
  %.not.i240 = icmp eq i32 %.val203, %.val202
  %143 = icmp sge i32 %.val204, %.val205
  %.v.i241 = select i1 %.not.i240, i1 %143, i1 %142
  br i1 %.v.i241, label %is_last_tile-after92, label %is_smaller_than-true97

is_smaller_than-true97:                           ; preds = %smaller_comparison_index-true93
  %144 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %thread.id.x
  %145 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %31
  store i32 %.val202, ptr addrspace(3) %139, align 4
  store i32 %.val203, ptr addrspace(3) %138, align 4
  %146 = load i32, ptr addrspace(3) %145, align 4
  %147 = load i32, ptr addrspace(3) %144, align 4
  store i32 %146, ptr addrspace(3) %144, align 4
  store i32 %147, ptr addrspace(3) %145, align 4
  store i32 %.val204, ptr addrspace(3) %141, align 4
  store i32 %.val205, ptr addrspace(3) %140, align 4
  br label %is_last_tile-after92

smaller_comparison_index-true108:                 ; preds = %is_last_tile-after92
  %148 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %23
  %149 = getelementptr i8, ptr addrspace(3) %148, i64 16
  %150 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %23
  %151 = getelementptr i8, ptr addrspace(3) %150, i64 16
  %.val198 = load i32, ptr addrspace(3) %149, align 4
  %.val199 = load i32, ptr addrspace(3) %148, align 4
  %.val200 = load i32, ptr addrspace(3) %151, align 4
  %.val201 = load i32, ptr addrspace(3) %150, align 4
  %152 = icmp uge i32 %.val198, %.val199
  %.not.i242 = icmp eq i32 %.val199, %.val198
  %153 = icmp sge i32 %.val200, %.val201
  %.v.i243 = select i1 %.not.i242, i1 %153, i1 %152
  br i1 %.v.i243, label %is_last_tile-after107, label %is_smaller_than-true112

is_smaller_than-true112:                          ; preds = %smaller_comparison_index-true108
  %154 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %23
  %155 = getelementptr i8, ptr addrspace(3) %154, i64 16
  store i32 %.val198, ptr addrspace(3) %148, align 4
  %sunkaddr254 = getelementptr i8, ptr addrspace(3) %148, i64 16
  store i32 %.val199, ptr addrspace(3) %sunkaddr254, align 4
  %156 = load i32, ptr addrspace(3) %155, align 4
  %157 = load i32, ptr addrspace(3) %154, align 4
  store i32 %156, ptr addrspace(3) %154, align 4
  store i32 %157, ptr addrspace(3) %155, align 4
  store i32 %.val200, ptr addrspace(3) %150, align 4
  %sunkaddr255 = getelementptr i8, ptr addrspace(3) %150, i64 16
  store i32 %.val201, ptr addrspace(3) %sunkaddr255, align 4
  br label %is_last_tile-after107

smaller_comparison_index-true123:                 ; preds = %is_last_tile-after107
  %158 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %15
  %159 = getelementptr i8, ptr addrspace(3) %158, i64 8
  %160 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %15
  %161 = getelementptr i8, ptr addrspace(3) %160, i64 8
  %.val194 = load i32, ptr addrspace(3) %159, align 4
  %.val195 = load i32, ptr addrspace(3) %158, align 4
  %.val196 = load i32, ptr addrspace(3) %161, align 4
  %.val197 = load i32, ptr addrspace(3) %160, align 4
  %162 = icmp uge i32 %.val194, %.val195
  %.not.i244 = icmp eq i32 %.val195, %.val194
  %163 = icmp sge i32 %.val196, %.val197
  %.v.i245 = select i1 %.not.i244, i1 %163, i1 %162
  br i1 %.v.i245, label %is_last_tile-after122, label %is_smaller_than-true127

is_smaller_than-true127:                          ; preds = %smaller_comparison_index-true123
  %164 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %15
  %165 = getelementptr i8, ptr addrspace(3) %164, i64 8
  store i32 %.val194, ptr addrspace(3) %158, align 4
  %sunkaddr256 = getelementptr i8, ptr addrspace(3) %158, i64 8
  store i32 %.val195, ptr addrspace(3) %sunkaddr256, align 4
  %166 = load i32, ptr addrspace(3) %165, align 4
  %167 = load i32, ptr addrspace(3) %164, align 4
  store i32 %166, ptr addrspace(3) %164, align 4
  store i32 %167, ptr addrspace(3) %165, align 4
  store i32 %.val196, ptr addrspace(3) %160, align 4
  %sunkaddr257 = getelementptr i8, ptr addrspace(3) %160, i64 8
  store i32 %.val197, ptr addrspace(3) %sunkaddr257, align 4
  br label %is_last_tile-after122

smaller_comparison_index-true138:                 ; preds = %is_last_tile-after122
  %168 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %10
  %169 = getelementptr i8, ptr addrspace(3) %168, i64 4
  %170 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %10
  %171 = getelementptr i8, ptr addrspace(3) %170, i64 4
  %.val = load i32, ptr addrspace(3) %169, align 4
  %.val191 = load i32, ptr addrspace(3) %168, align 4
  %.val192 = load i32, ptr addrspace(3) %171, align 4
  %.val193 = load i32, ptr addrspace(3) %170, align 4
  %172 = icmp uge i32 %.val, %.val191
  %.not.i246 = icmp eq i32 %.val191, %.val
  %173 = icmp sge i32 %.val192, %.val193
  %.v.i247 = select i1 %.not.i246, i1 %173, i1 %172
  br i1 %.v.i247, label %is_last_tile-after137, label %is_smaller_than-true142

is_smaller_than-true142:                          ; preds = %smaller_comparison_index-true138
  %174 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  %175 = getelementptr i8, ptr addrspace(3) %174, i64 4
  %176 = insertelement <2 x i32> poison, i32 %.val, i32 0
  %177 = insertelement <2 x i32> %176, i32 %.val191, i32 1
  store <2 x i32> %177, ptr addrspace(3) %168, align 8
  %178 = load i32, ptr addrspace(3) %175, align 4
  %179 = load i32, ptr addrspace(3) %174, align 4
  %180 = insertelement <2 x i32> poison, i32 %178, i32 0
  %181 = insertelement <2 x i32> %180, i32 %179, i32 1
  store <2 x i32> %181, ptr addrspace(3) %174, align 8
  %182 = insertelement <2 x i32> poison, i32 %.val192, i32 0
  %183 = insertelement <2 x i32> %182, i32 %.val193, i32 1
  store <2 x i32> %183, ptr addrspace(3) %170, align 8
  br label %is_last_tile-after137

smaller_keys_index-true150:                       ; preds = %is_last_tile-after137
  %184 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_0", i64 0, i64 %10
  %185 = load i32, ptr addrspace(3) %184, align 8
  %186 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %0, i64 0, i64 %6, i64 %8
  store i32 %185, ptr addrspace(1) %186, align 4
  %187 = or disjoint i64 %8, 1
  %188 = icmp samesign ult i64 %187, 11
  br i1 %188, label %inner_smaller_keys_index-true152, label %smaller_keys_index-true158.critedge

inner_smaller_keys_index-true152:                 ; preds = %smaller_keys_index-true150
  %189 = getelementptr inbounds i8, ptr addrspace(1) %186, i64 4
  %190 = getelementptr i8, ptr addrspace(3) %184, i64 4
  %191 = load i32, ptr addrspace(3) %190, align 4
  store i32 %191, ptr addrspace(1) %189, align 4
  %192 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  %193 = load <2 x i32>, ptr addrspace(3) %192, align 8
  %194 = extractelement <2 x i32> %193, i32 0
  %195 = extractelement <2 x i32> %193, i32 1
  %196 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %197 = getelementptr inbounds i8, ptr addrspace(1) %196, i64 4
  store i32 %195, ptr addrspace(1) %197, align 4
  br label %smaller_keys_index-true158

smaller_keys_index-true158.critedge:              ; preds = %smaller_keys_index-true150
  %198 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  %199 = load i32, ptr addrspace(3) %198, align 8
  br label %smaller_keys_index-true158

smaller_keys_index-true158:                       ; preds = %smaller_keys_index-true158.critedge, %inner_smaller_keys_index-true152
  %.sink250 = phi i32 [ %194, %inner_smaller_keys_index-true152 ], [ %199, %smaller_keys_index-true158.critedge ]
  %200 = icmp ult i64 %187, 11
  %201 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  store i32 %.sink250, ptr addrspace(1) %201, align 4
  %202 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %10
  %203 = load i32, ptr addrspace(3) %202, align 8
  %204 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %2, i64 0, i64 %6, i64 %8
  store i32 %203, ptr addrspace(1) %204, align 4
  br i1 %200, label %inner_smaller_keys_index-true160, label %sort.4.0.in_bounds-after

inner_smaller_keys_index-true160:                 ; preds = %smaller_keys_index-true158
  %sunkaddr258 = getelementptr i8, ptr addrspace(3) %202, i64 4
  %205 = load i32, ptr addrspace(3) %sunkaddr258, align 4
  %sunkaddr259 = getelementptr inbounds i8, ptr addrspace(1) %204, i64 4
  store i32 %205, ptr addrspace(1) %sunkaddr259, align 4
  br label %sort.4.0.in_bounds-after
}

; Function Attrs: convergent nocallback nounwind
declare void @llvm.nvvm.barrier.cta.sync.aligned.all(i32) #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_xor_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(12288) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(67584) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !52
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = shl nuw nsw i32 %5, 7
  %8 = or disjoint i32 %7, %6
  %9 = udiv i32 %8, 11
  %10 = mul i32 %9, 11
  %.decomposed = sub i32 %8, %10
  %11 = shl nuw nsw i32 %9, 1
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %3, i64 %12
  %14 = load <2 x i32>, ptr addrspace(1) %13, align 8, !invariant.load !4
  %15 = extractelement <2 x i32> %14, i32 0
  %16 = extractelement <2 x i32> %14, i32 1
  %17 = add i32 %16, %.decomposed
  %18 = tail call i32 @llvm.fshl.i32(i32 %17, i32 %17, i32 13)
  %19 = add i32 %15, %17
  %20 = xor i32 %19, %18
  %21 = tail call i32 @llvm.fshl.i32(i32 %20, i32 %20, i32 15)
  %22 = add i32 %20, %19
  %23 = xor i32 %22, %21
  %24 = add i32 %23, %22
  %25 = tail call i32 @llvm.fshl.i32(i32 %23, i32 %23, i32 26)
  %26 = xor i32 %24, %25
  %27 = tail call i32 @llvm.fshl.i32(i32 %26, i32 %26, i32 6)
  %28 = add i32 %26, %24
  %29 = xor i32 %28, %27
  %30 = xor i32 %16, %15
  %31 = xor i32 %30, 466688986
  %32 = add i32 %31, 1
  %33 = add i32 %32, %29
  %34 = add i32 %28, %16
  %35 = tail call i32 @llvm.fshl.i32(i32 %33, i32 %33, i32 17)
  %36 = add i32 %34, %33
  %37 = xor i32 %36, %35
  %38 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 29)
  %39 = add i32 %37, %36
  %40 = xor i32 %39, %38
  %41 = add i32 %40, %39
  %42 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 16)
  %43 = xor i32 %41, %42
  %44 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 24)
  %45 = add i32 %43, %41
  %46 = xor i32 %45, %44
  %47 = add i32 %15, 2
  %48 = add i32 %47, %46
  %49 = add i32 %45, %31
  %50 = tail call i32 @llvm.fshl.i32(i32 %48, i32 %48, i32 13)
  %51 = add i32 %49, %48
  %52 = xor i32 %51, %50
  %53 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 15)
  %54 = add i32 %52, %51
  %55 = xor i32 %54, %53
  %56 = add i32 %55, %54
  %57 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 26)
  %58 = xor i32 %56, %57
  %59 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 6)
  %60 = add i32 %58, %56
  %61 = xor i32 %60, %59
  %62 = add i32 %16, 3
  %63 = add i32 %62, %61
  %64 = add i32 %60, %15
  %65 = tail call i32 @llvm.fshl.i32(i32 %63, i32 %63, i32 17)
  %66 = add i32 %64, %63
  %67 = xor i32 %66, %65
  %68 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 29)
  %69 = add i32 %67, %66
  %70 = xor i32 %69, %68
  %71 = add i32 %70, %69
  %72 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 16)
  %73 = xor i32 %71, %72
  %74 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 24)
  %75 = add i32 %73, %71
  %76 = xor i32 %75, %74
  %77 = add i32 %31, 4
  %78 = add i32 %77, %76
  %79 = add i32 %75, %16
  %80 = tail call i32 @llvm.fshl.i32(i32 %78, i32 %78, i32 13)
  %81 = add i32 %79, %78
  %82 = xor i32 %81, %80
  %83 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %82, i32 15)
  %84 = add i32 %82, %81
  %85 = xor i32 %84, %83
  %86 = add i32 %85, %84
  %87 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 26)
  %88 = xor i32 %86, %87
  %89 = tail call i32 @llvm.fshl.i32(i32 %88, i32 %88, i32 6)
  %90 = add i32 %88, %86
  %91 = xor i32 %90, %89
  %92 = add i32 %90, %31
  %93 = add i32 %15, 5
  %94 = add i32 %93, %91
  %95 = xor i32 %94, %92
  %96 = zext nneg i32 %8 to i64
  %97 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %96
  store i32 %95, ptr addrspace(1) %97, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define ptx_kernel void @sort_5_0(ptr noalias align 256 captures(none) dereferenceable(67584) %arg0, ptr noalias align 256 captures(none) dereferenceable(67584) %arg1, ptr noalias align 256 captures(none) dereferenceable(67584) %arg2) local_unnamed_addr #4 {
entry:
  %0 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !53
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !54
  %5 = shl nuw nsw i32 %3, 3
  %linear_index187 = or disjoint i32 %5, %4
  %linear_index = zext nneg i32 %linear_index187 to i64
  %6 = lshr i64 %linear_index, 3
  %thread.id.x = zext nneg i32 %4 to i64
  %7 = shl nuw nsw i64 %linear_index, 1
  %8 = and i64 %7, 14
  %9 = icmp samesign ult i64 %8, 11
  %10 = shl nuw nsw i64 %thread.id.x, 1
  br i1 %9, label %smaller_keys_index-true, label %smaller_keys_index-after6

sort.5.0.in_bounds-after:                         ; preds = %is_last_tile-after137, %smaller_keys_index-true158, %inner_smaller_keys_index-true160
  ret void

smaller_keys_index-after6:                        ; preds = %entry, %smaller_keys_index-true5, %inner_smaller_keys_index-true7
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %11 = or disjoint i64 %10, 1
  %12 = icmp samesign ult i64 %11, 11
  br i1 %12, label %smaller_comparison_index-true, label %is_last_tile-after

is_last_tile-after:                               ; preds = %smaller_comparison_index-true, %is_smaller_than-true, %smaller_keys_index-after6
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %13 = and i64 %thread.id.x, 1
  %14 = and i64 %10, 12
  %15 = or disjoint i64 %14, %13
  %16 = xor i64 %15, 3
  %17 = icmp samesign ult i64 %15, %16
  %18 = icmp samesign ult i64 %16, 11
  %19 = and i1 %17, %18
  br i1 %19, label %smaller_comparison_index-true18, label %is_last_tile-after17

is_last_tile-after17:                             ; preds = %smaller_comparison_index-true18, %is_smaller_than-true22, %is_last_tile-after
  %20 = icmp ult i64 %11, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %20, label %smaller_comparison_index-true33, label %is_last_tile-after32

is_last_tile-after32:                             ; preds = %smaller_comparison_index-true33, %is_smaller_than-true37, %is_last_tile-after17
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %21 = and i64 %thread.id.x, 3
  %22 = and i64 %10, 8
  %23 = or disjoint i64 %22, %21
  %24 = xor i64 %23, 7
  %25 = icmp samesign ult i64 %23, %24
  %26 = icmp samesign ult i64 %24, 11
  %27 = and i1 %25, %26
  br i1 %27, label %smaller_comparison_index-true48, label %is_last_tile-after47

is_last_tile-after47:                             ; preds = %smaller_comparison_index-true48, %is_smaller_than-true52, %is_last_tile-after32
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %28 = or disjoint i64 %15, 2
  %29 = icmp samesign ult i64 %28, 11
  br i1 %29, label %smaller_comparison_index-true63, label %is_last_tile-after62

is_last_tile-after62:                             ; preds = %smaller_comparison_index-true63, %is_smaller_than-true67, %is_last_tile-after47
  %30 = icmp ult i64 %11, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %30, label %smaller_comparison_index-true78, label %is_last_tile-after77

is_last_tile-after77:                             ; preds = %smaller_comparison_index-true78, %is_smaller_than-true82, %is_last_tile-after62
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %31 = xor i64 %thread.id.x, 15
  %32 = icmp samesign ult i64 %31, 11
  br i1 %32, label %smaller_comparison_index-true93, label %is_last_tile-after92

is_last_tile-after92:                             ; preds = %smaller_comparison_index-true93, %is_smaller_than-true97, %is_last_tile-after77
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %33 = or disjoint i64 %23, 4
  %34 = icmp samesign ult i64 %33, 11
  br i1 %34, label %smaller_comparison_index-true108, label %is_last_tile-after107

is_last_tile-after107:                            ; preds = %smaller_comparison_index-true108, %is_smaller_than-true112, %is_last_tile-after92
  %35 = icmp ult i64 %28, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %35, label %smaller_comparison_index-true123, label %is_last_tile-after122

is_last_tile-after122:                            ; preds = %smaller_comparison_index-true123, %is_smaller_than-true127, %is_last_tile-after107
  %36 = icmp ult i64 %11, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %36, label %smaller_comparison_index-true138, label %is_last_tile-after137

is_last_tile-after137:                            ; preds = %smaller_comparison_index-true138, %is_smaller_than-true142, %is_last_tile-after122
  %37 = icmp ult i64 %8, 11
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %37, label %smaller_keys_index-true150, label %sort.5.0.in_bounds-after

smaller_keys_index-true:                          ; preds = %entry
  %38 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %0, i64 0, i64 %6, i64 %8
  %39 = load i32, ptr addrspace(1) %38, align 4
  %40 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %10
  store i32 %39, ptr addrspace(3) %40, align 8
  %41 = or disjoint i64 %8, 1
  %42 = icmp samesign ult i64 %41, 11
  br i1 %42, label %inner_smaller_keys_index-true, label %smaller_keys_index-true5.critedge

inner_smaller_keys_index-true:                    ; preds = %smaller_keys_index-true
  %43 = getelementptr i8, ptr addrspace(3) %40, i64 4
  %44 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 4
  %45 = load i32, ptr addrspace(1) %44, align 4
  store i32 %45, ptr addrspace(3) %43, align 4
  %46 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %47 = load i32, ptr addrspace(1) %46, align 4
  %48 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  %49 = getelementptr i8, ptr addrspace(3) %48, i64 4
  %50 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 4
  %51 = load i32, ptr addrspace(1) %50, align 4
  store i32 %51, ptr addrspace(3) %49, align 4
  br label %smaller_keys_index-true5

smaller_keys_index-true5.critedge:                ; preds = %smaller_keys_index-true
  %52 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %53 = load i32, ptr addrspace(1) %52, align 4
  br label %smaller_keys_index-true5

smaller_keys_index-true5:                         ; preds = %smaller_keys_index-true5.critedge, %inner_smaller_keys_index-true
  %.sink = phi i32 [ %47, %inner_smaller_keys_index-true ], [ %53, %smaller_keys_index-true5.critedge ]
  %54 = icmp ult i64 %41, 11
  %55 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  store i32 %.sink, ptr addrspace(3) %55, align 8
  %56 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %2, i64 0, i64 %6, i64 %8
  %57 = load i32, ptr addrspace(1) %56, align 4
  %58 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %10
  store i32 %57, ptr addrspace(3) %58, align 8
  br i1 %54, label %inner_smaller_keys_index-true7, label %smaller_keys_index-after6

inner_smaller_keys_index-true7:                   ; preds = %smaller_keys_index-true5
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %56, i64 4
  %59 = load i32, ptr addrspace(1) %sunkaddr, align 4
  %sunkaddr251 = getelementptr i8, ptr addrspace(3) %58, i64 4
  store i32 %59, ptr addrspace(3) %sunkaddr251, align 4
  br label %smaller_keys_index-after6

smaller_comparison_index-true:                    ; preds = %smaller_keys_index-after6
  %60 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %10
  %61 = getelementptr i8, ptr addrspace(3) %60, i64 4
  %62 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %10
  %63 = getelementptr i8, ptr addrspace(3) %62, i64 4
  %.val226 = load i32, ptr addrspace(3) %61, align 4
  %.val227 = load i32, ptr addrspace(3) %60, align 4
  %.val228 = load i32, ptr addrspace(3) %63, align 4
  %.val229 = load i32, ptr addrspace(3) %62, align 4
  %64 = icmp uge i32 %.val226, %.val227
  %.not.i = icmp eq i32 %.val227, %.val226
  %65 = icmp sge i32 %.val228, %.val229
  %.v.i = select i1 %.not.i, i1 %65, i1 %64
  br i1 %.v.i, label %is_last_tile-after, label %is_smaller_than-true

is_smaller_than-true:                             ; preds = %smaller_comparison_index-true
  %66 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  %67 = getelementptr i8, ptr addrspace(3) %66, i64 4
  %68 = insertelement <2 x i32> poison, i32 %.val226, i32 0
  %69 = insertelement <2 x i32> %68, i32 %.val227, i32 1
  store <2 x i32> %69, ptr addrspace(3) %60, align 8
  %70 = load i32, ptr addrspace(3) %67, align 4
  %71 = load i32, ptr addrspace(3) %66, align 4
  %72 = insertelement <2 x i32> poison, i32 %70, i32 0
  %73 = insertelement <2 x i32> %72, i32 %71, i32 1
  store <2 x i32> %73, ptr addrspace(3) %66, align 8
  %74 = insertelement <2 x i32> poison, i32 %.val228, i32 0
  %75 = insertelement <2 x i32> %74, i32 %.val229, i32 1
  store <2 x i32> %75, ptr addrspace(3) %62, align 8
  br label %is_last_tile-after

smaller_comparison_index-true18:                  ; preds = %is_last_tile-after
  %76 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %16
  %77 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %15
  %78 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %16
  %79 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %15
  %.val222 = load i32, ptr addrspace(3) %76, align 4
  %.val223 = load i32, ptr addrspace(3) %77, align 4
  %.val224 = load i32, ptr addrspace(3) %78, align 4
  %.val225 = load i32, ptr addrspace(3) %79, align 4
  %80 = icmp uge i32 %.val222, %.val223
  %.not.i230 = icmp eq i32 %.val223, %.val222
  %81 = icmp sge i32 %.val224, %.val225
  %.v.i231 = select i1 %.not.i230, i1 %81, i1 %80
  br i1 %.v.i231, label %is_last_tile-after17, label %is_smaller_than-true22

is_smaller_than-true22:                           ; preds = %smaller_comparison_index-true18
  %82 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %15
  %83 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %16
  store i32 %.val222, ptr addrspace(3) %77, align 4
  store i32 %.val223, ptr addrspace(3) %76, align 4
  %84 = load i32, ptr addrspace(3) %83, align 4
  %85 = load i32, ptr addrspace(3) %82, align 4
  store i32 %84, ptr addrspace(3) %82, align 4
  store i32 %85, ptr addrspace(3) %83, align 4
  store i32 %.val224, ptr addrspace(3) %79, align 4
  store i32 %.val225, ptr addrspace(3) %78, align 4
  br label %is_last_tile-after17

smaller_comparison_index-true33:                  ; preds = %is_last_tile-after17
  %86 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %10
  %87 = getelementptr i8, ptr addrspace(3) %86, i64 4
  %88 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %10
  %89 = getelementptr i8, ptr addrspace(3) %88, i64 4
  %.val218 = load i32, ptr addrspace(3) %87, align 4
  %.val219 = load i32, ptr addrspace(3) %86, align 4
  %.val220 = load i32, ptr addrspace(3) %89, align 4
  %.val221 = load i32, ptr addrspace(3) %88, align 4
  %90 = icmp uge i32 %.val218, %.val219
  %.not.i232 = icmp eq i32 %.val219, %.val218
  %91 = icmp sge i32 %.val220, %.val221
  %.v.i233 = select i1 %.not.i232, i1 %91, i1 %90
  br i1 %.v.i233, label %is_last_tile-after32, label %is_smaller_than-true37

is_smaller_than-true37:                           ; preds = %smaller_comparison_index-true33
  %92 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  %93 = getelementptr i8, ptr addrspace(3) %92, i64 4
  %94 = insertelement <2 x i32> poison, i32 %.val218, i32 0
  %95 = insertelement <2 x i32> %94, i32 %.val219, i32 1
  store <2 x i32> %95, ptr addrspace(3) %86, align 8
  %96 = load i32, ptr addrspace(3) %93, align 4
  %97 = load i32, ptr addrspace(3) %92, align 4
  %98 = insertelement <2 x i32> poison, i32 %96, i32 0
  %99 = insertelement <2 x i32> %98, i32 %97, i32 1
  store <2 x i32> %99, ptr addrspace(3) %92, align 8
  %100 = insertelement <2 x i32> poison, i32 %.val220, i32 0
  %101 = insertelement <2 x i32> %100, i32 %.val221, i32 1
  store <2 x i32> %101, ptr addrspace(3) %88, align 8
  br label %is_last_tile-after32

smaller_comparison_index-true48:                  ; preds = %is_last_tile-after32
  %102 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %24
  %103 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %23
  %104 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %24
  %105 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %23
  %.val214 = load i32, ptr addrspace(3) %102, align 4
  %.val215 = load i32, ptr addrspace(3) %103, align 4
  %.val216 = load i32, ptr addrspace(3) %104, align 4
  %.val217 = load i32, ptr addrspace(3) %105, align 4
  %106 = icmp uge i32 %.val214, %.val215
  %.not.i234 = icmp eq i32 %.val215, %.val214
  %107 = icmp sge i32 %.val216, %.val217
  %.v.i235 = select i1 %.not.i234, i1 %107, i1 %106
  br i1 %.v.i235, label %is_last_tile-after47, label %is_smaller_than-true52

is_smaller_than-true52:                           ; preds = %smaller_comparison_index-true48
  %108 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %23
  %109 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %24
  store i32 %.val214, ptr addrspace(3) %103, align 4
  store i32 %.val215, ptr addrspace(3) %102, align 4
  %110 = load i32, ptr addrspace(3) %109, align 4
  %111 = load i32, ptr addrspace(3) %108, align 4
  store i32 %110, ptr addrspace(3) %108, align 4
  store i32 %111, ptr addrspace(3) %109, align 4
  store i32 %.val216, ptr addrspace(3) %105, align 4
  store i32 %.val217, ptr addrspace(3) %104, align 4
  br label %is_last_tile-after47

smaller_comparison_index-true63:                  ; preds = %is_last_tile-after47
  %112 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %15
  %113 = getelementptr i8, ptr addrspace(3) %112, i64 8
  %114 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %15
  %115 = getelementptr i8, ptr addrspace(3) %114, i64 8
  %.val210 = load i32, ptr addrspace(3) %113, align 4
  %.val211 = load i32, ptr addrspace(3) %112, align 4
  %.val212 = load i32, ptr addrspace(3) %115, align 4
  %.val213 = load i32, ptr addrspace(3) %114, align 4
  %116 = icmp uge i32 %.val210, %.val211
  %.not.i236 = icmp eq i32 %.val211, %.val210
  %117 = icmp sge i32 %.val212, %.val213
  %.v.i237 = select i1 %.not.i236, i1 %117, i1 %116
  br i1 %.v.i237, label %is_last_tile-after62, label %is_smaller_than-true67

is_smaller_than-true67:                           ; preds = %smaller_comparison_index-true63
  %118 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %15
  %119 = getelementptr i8, ptr addrspace(3) %118, i64 8
  store i32 %.val210, ptr addrspace(3) %112, align 4
  %sunkaddr252 = getelementptr i8, ptr addrspace(3) %112, i64 8
  store i32 %.val211, ptr addrspace(3) %sunkaddr252, align 4
  %120 = load i32, ptr addrspace(3) %119, align 4
  %121 = load i32, ptr addrspace(3) %118, align 4
  store i32 %120, ptr addrspace(3) %118, align 4
  store i32 %121, ptr addrspace(3) %119, align 4
  store i32 %.val212, ptr addrspace(3) %114, align 4
  %sunkaddr253 = getelementptr i8, ptr addrspace(3) %114, i64 8
  store i32 %.val213, ptr addrspace(3) %sunkaddr253, align 4
  br label %is_last_tile-after62

smaller_comparison_index-true78:                  ; preds = %is_last_tile-after62
  %122 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %10
  %123 = getelementptr i8, ptr addrspace(3) %122, i64 4
  %124 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %10
  %125 = getelementptr i8, ptr addrspace(3) %124, i64 4
  %.val206 = load i32, ptr addrspace(3) %123, align 4
  %.val207 = load i32, ptr addrspace(3) %122, align 4
  %.val208 = load i32, ptr addrspace(3) %125, align 4
  %.val209 = load i32, ptr addrspace(3) %124, align 4
  %126 = icmp uge i32 %.val206, %.val207
  %.not.i238 = icmp eq i32 %.val207, %.val206
  %127 = icmp sge i32 %.val208, %.val209
  %.v.i239 = select i1 %.not.i238, i1 %127, i1 %126
  br i1 %.v.i239, label %is_last_tile-after77, label %is_smaller_than-true82

is_smaller_than-true82:                           ; preds = %smaller_comparison_index-true78
  %128 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  %129 = getelementptr i8, ptr addrspace(3) %128, i64 4
  %130 = insertelement <2 x i32> poison, i32 %.val206, i32 0
  %131 = insertelement <2 x i32> %130, i32 %.val207, i32 1
  store <2 x i32> %131, ptr addrspace(3) %122, align 8
  %132 = load i32, ptr addrspace(3) %129, align 4
  %133 = load i32, ptr addrspace(3) %128, align 4
  %134 = insertelement <2 x i32> poison, i32 %132, i32 0
  %135 = insertelement <2 x i32> %134, i32 %133, i32 1
  store <2 x i32> %135, ptr addrspace(3) %128, align 8
  %136 = insertelement <2 x i32> poison, i32 %.val208, i32 0
  %137 = insertelement <2 x i32> %136, i32 %.val209, i32 1
  store <2 x i32> %137, ptr addrspace(3) %124, align 8
  br label %is_last_tile-after77

smaller_comparison_index-true93:                  ; preds = %is_last_tile-after77
  %138 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %31
  %139 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %thread.id.x
  %140 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %31
  %141 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %thread.id.x
  %.val202 = load i32, ptr addrspace(3) %138, align 4
  %.val203 = load i32, ptr addrspace(3) %139, align 4
  %.val204 = load i32, ptr addrspace(3) %140, align 4
  %.val205 = load i32, ptr addrspace(3) %141, align 4
  %142 = icmp uge i32 %.val202, %.val203
  %.not.i240 = icmp eq i32 %.val203, %.val202
  %143 = icmp sge i32 %.val204, %.val205
  %.v.i241 = select i1 %.not.i240, i1 %143, i1 %142
  br i1 %.v.i241, label %is_last_tile-after92, label %is_smaller_than-true97

is_smaller_than-true97:                           ; preds = %smaller_comparison_index-true93
  %144 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %thread.id.x
  %145 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %31
  store i32 %.val202, ptr addrspace(3) %139, align 4
  store i32 %.val203, ptr addrspace(3) %138, align 4
  %146 = load i32, ptr addrspace(3) %145, align 4
  %147 = load i32, ptr addrspace(3) %144, align 4
  store i32 %146, ptr addrspace(3) %144, align 4
  store i32 %147, ptr addrspace(3) %145, align 4
  store i32 %.val204, ptr addrspace(3) %141, align 4
  store i32 %.val205, ptr addrspace(3) %140, align 4
  br label %is_last_tile-after92

smaller_comparison_index-true108:                 ; preds = %is_last_tile-after92
  %148 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %23
  %149 = getelementptr i8, ptr addrspace(3) %148, i64 16
  %150 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %23
  %151 = getelementptr i8, ptr addrspace(3) %150, i64 16
  %.val198 = load i32, ptr addrspace(3) %149, align 4
  %.val199 = load i32, ptr addrspace(3) %148, align 4
  %.val200 = load i32, ptr addrspace(3) %151, align 4
  %.val201 = load i32, ptr addrspace(3) %150, align 4
  %152 = icmp uge i32 %.val198, %.val199
  %.not.i242 = icmp eq i32 %.val199, %.val198
  %153 = icmp sge i32 %.val200, %.val201
  %.v.i243 = select i1 %.not.i242, i1 %153, i1 %152
  br i1 %.v.i243, label %is_last_tile-after107, label %is_smaller_than-true112

is_smaller_than-true112:                          ; preds = %smaller_comparison_index-true108
  %154 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %23
  %155 = getelementptr i8, ptr addrspace(3) %154, i64 16
  store i32 %.val198, ptr addrspace(3) %148, align 4
  %sunkaddr254 = getelementptr i8, ptr addrspace(3) %148, i64 16
  store i32 %.val199, ptr addrspace(3) %sunkaddr254, align 4
  %156 = load i32, ptr addrspace(3) %155, align 4
  %157 = load i32, ptr addrspace(3) %154, align 4
  store i32 %156, ptr addrspace(3) %154, align 4
  store i32 %157, ptr addrspace(3) %155, align 4
  store i32 %.val200, ptr addrspace(3) %150, align 4
  %sunkaddr255 = getelementptr i8, ptr addrspace(3) %150, i64 16
  store i32 %.val201, ptr addrspace(3) %sunkaddr255, align 4
  br label %is_last_tile-after107

smaller_comparison_index-true123:                 ; preds = %is_last_tile-after107
  %158 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %15
  %159 = getelementptr i8, ptr addrspace(3) %158, i64 8
  %160 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %15
  %161 = getelementptr i8, ptr addrspace(3) %160, i64 8
  %.val194 = load i32, ptr addrspace(3) %159, align 4
  %.val195 = load i32, ptr addrspace(3) %158, align 4
  %.val196 = load i32, ptr addrspace(3) %161, align 4
  %.val197 = load i32, ptr addrspace(3) %160, align 4
  %162 = icmp uge i32 %.val194, %.val195
  %.not.i244 = icmp eq i32 %.val195, %.val194
  %163 = icmp sge i32 %.val196, %.val197
  %.v.i245 = select i1 %.not.i244, i1 %163, i1 %162
  br i1 %.v.i245, label %is_last_tile-after122, label %is_smaller_than-true127

is_smaller_than-true127:                          ; preds = %smaller_comparison_index-true123
  %164 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %15
  %165 = getelementptr i8, ptr addrspace(3) %164, i64 8
  store i32 %.val194, ptr addrspace(3) %158, align 4
  %sunkaddr256 = getelementptr i8, ptr addrspace(3) %158, i64 8
  store i32 %.val195, ptr addrspace(3) %sunkaddr256, align 4
  %166 = load i32, ptr addrspace(3) %165, align 4
  %167 = load i32, ptr addrspace(3) %164, align 4
  store i32 %166, ptr addrspace(3) %164, align 4
  store i32 %167, ptr addrspace(3) %165, align 4
  store i32 %.val196, ptr addrspace(3) %160, align 4
  %sunkaddr257 = getelementptr i8, ptr addrspace(3) %160, i64 8
  store i32 %.val197, ptr addrspace(3) %sunkaddr257, align 4
  br label %is_last_tile-after122

smaller_comparison_index-true138:                 ; preds = %is_last_tile-after122
  %168 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %10
  %169 = getelementptr i8, ptr addrspace(3) %168, i64 4
  %170 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %10
  %171 = getelementptr i8, ptr addrspace(3) %170, i64 4
  %.val = load i32, ptr addrspace(3) %169, align 4
  %.val191 = load i32, ptr addrspace(3) %168, align 4
  %.val192 = load i32, ptr addrspace(3) %171, align 4
  %.val193 = load i32, ptr addrspace(3) %170, align 4
  %172 = icmp uge i32 %.val, %.val191
  %.not.i246 = icmp eq i32 %.val191, %.val
  %173 = icmp sge i32 %.val192, %.val193
  %.v.i247 = select i1 %.not.i246, i1 %173, i1 %172
  br i1 %.v.i247, label %is_last_tile-after137, label %is_smaller_than-true142

is_smaller_than-true142:                          ; preds = %smaller_comparison_index-true138
  %174 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  %175 = getelementptr i8, ptr addrspace(3) %174, i64 4
  %176 = insertelement <2 x i32> poison, i32 %.val, i32 0
  %177 = insertelement <2 x i32> %176, i32 %.val191, i32 1
  store <2 x i32> %177, ptr addrspace(3) %168, align 8
  %178 = load i32, ptr addrspace(3) %175, align 4
  %179 = load i32, ptr addrspace(3) %174, align 4
  %180 = insertelement <2 x i32> poison, i32 %178, i32 0
  %181 = insertelement <2 x i32> %180, i32 %179, i32 1
  store <2 x i32> %181, ptr addrspace(3) %174, align 8
  %182 = insertelement <2 x i32> poison, i32 %.val192, i32 0
  %183 = insertelement <2 x i32> %182, i32 %.val193, i32 1
  store <2 x i32> %183, ptr addrspace(3) %170, align 8
  br label %is_last_tile-after137

smaller_keys_index-true150:                       ; preds = %is_last_tile-after137
  %184 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_0", i64 0, i64 %10
  %185 = load i32, ptr addrspace(3) %184, align 8
  %186 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %0, i64 0, i64 %6, i64 %8
  store i32 %185, ptr addrspace(1) %186, align 4
  %187 = or disjoint i64 %8, 1
  %188 = icmp samesign ult i64 %187, 11
  br i1 %188, label %inner_smaller_keys_index-true152, label %smaller_keys_index-true158.critedge

inner_smaller_keys_index-true152:                 ; preds = %smaller_keys_index-true150
  %189 = getelementptr inbounds i8, ptr addrspace(1) %186, i64 4
  %190 = getelementptr i8, ptr addrspace(3) %184, i64 4
  %191 = load i32, ptr addrspace(3) %190, align 4
  store i32 %191, ptr addrspace(1) %189, align 4
  %192 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  %193 = load <2 x i32>, ptr addrspace(3) %192, align 8
  %194 = extractelement <2 x i32> %193, i32 0
  %195 = extractelement <2 x i32> %193, i32 1
  %196 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %197 = getelementptr inbounds i8, ptr addrspace(1) %196, i64 4
  store i32 %195, ptr addrspace(1) %197, align 4
  br label %smaller_keys_index-true158

smaller_keys_index-true158.critedge:              ; preds = %smaller_keys_index-true150
  %198 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  %199 = load i32, ptr addrspace(3) %198, align 8
  br label %smaller_keys_index-true158

smaller_keys_index-true158:                       ; preds = %smaller_keys_index-true158.critedge, %inner_smaller_keys_index-true152
  %.sink250 = phi i32 [ %194, %inner_smaller_keys_index-true152 ], [ %199, %smaller_keys_index-true158.critedge ]
  %200 = icmp ult i64 %187, 11
  %201 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  store i32 %.sink250, ptr addrspace(1) %201, align 4
  %202 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %10
  %203 = load i32, ptr addrspace(3) %202, align 8
  %204 = getelementptr inbounds [1536 x [11 x i32]], ptr addrspace(1) %2, i64 0, i64 %6, i64 %8
  store i32 %203, ptr addrspace(1) %204, align 4
  br i1 %200, label %inner_smaller_keys_index-true160, label %sort.5.0.in_bounds-after

inner_smaller_keys_index-true160:                 ; preds = %smaller_keys_index-true158
  %sunkaddr258 = getelementptr i8, ptr addrspace(3) %202, i64 4
  %205 = load i32, ptr addrspace(3) %sunkaddr258, align 4
  %sunkaddr259 = getelementptr inbounds i8, ptr addrspace(1) %204, i64 4
  store i32 %205, ptr addrspace(1) %sunkaddr259, align 4
  br label %sort.5.0.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_concatenate_fusion_3(ptr noalias readonly align 256 captures(none) dereferenceable(67584) %0, ptr noalias readonly align 256 captures(none) dereferenceable(67584) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = addrspacecast ptr %2 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !55
  %9 = shl nuw nsw i32 %8, 7
  %10 = or disjoint i32 %9, %7
  %11 = udiv i32 %10, 7
  %12 = mul i32 %11, 7
  %.decomposed = sub i32 %10, %12
  %13 = mul nuw nsw i32 %11, 11
  %14 = add nuw nsw i32 %13, %.decomposed
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %15
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !4
  %18 = mul i32 %17, 15
  %19 = add i32 %18, 1
  %20 = mul i32 %11, 3
  %21 = add i32 %14, %20
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %22
  store i32 %19, ptr addrspace(1) %23, align 4
  %24 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %15
  %25 = load i32, ptr addrspace(1) %24, align 4, !invariant.load !4
  %26 = mul i32 %25, 15
  %27 = add i32 %26, 13
  %28 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 28
  store i32 %27, ptr addrspace(1) %28, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_convert_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(12288) %0, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %9 = shl nuw nsw i32 %7, 7
  %10 = or disjoint i32 %9, %8
  %11 = udiv i32 %10, 14
  %12 = mul i32 %11, 14
  %.decomposed = sub i32 %10, %12
  %13 = zext nneg i32 %11 to i64
  %14 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %13
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !57
  %16 = add i32 %15, %.decomposed
  %17 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %13
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !4, !alias.scope !64
  %19 = tail call i32 @llvm.fshl.i32(i32 %16, i32 %16, i32 13)
  %20 = add i32 %18, %16
  %21 = xor i32 %20, %19
  %22 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 6144
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !4, !alias.scope !71
  %24 = add i32 %23, %.decomposed
  %25 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 15)
  %26 = add i32 %21, %20
  %27 = xor i32 %26, %25
  %28 = add i32 %27, %26
  %29 = tail call i32 @llvm.fshl.i32(i32 %27, i32 %27, i32 26)
  %30 = xor i32 %28, %29
  %31 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 6144
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4, !alias.scope !78
  %33 = tail call i32 @llvm.fshl.i32(i32 %24, i32 %24, i32 13)
  %34 = add i32 %32, %24
  %35 = xor i32 %34, %33
  %36 = tail call i32 @llvm.fshl.i32(i32 %30, i32 %30, i32 6)
  %37 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 15)
  %38 = add i32 %35, %34
  %39 = xor i32 %38, %37
  %40 = add i32 %39, %38
  %41 = tail call i32 @llvm.fshl.i32(i32 %39, i32 %39, i32 26)
  %42 = xor i32 %40, %41
  %43 = add i32 %30, %28
  %44 = xor i32 %43, %36
  %45 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %42, i32 6)
  %46 = xor i32 %15, %18
  %47 = xor i32 %46, 466688986
  %48 = add i32 %47, 1
  %49 = add i32 %48, %44
  %50 = add i32 %42, %40
  %51 = xor i32 %50, %45
  %52 = add i32 %43, %15
  %53 = tail call i32 @llvm.fshl.i32(i32 %49, i32 %49, i32 17)
  %54 = add i32 %52, %49
  %55 = xor i32 %54, %53
  %56 = xor i32 %23, %32
  %57 = xor i32 %56, 466688986
  %58 = add i32 %57, 1
  %59 = add i32 %58, %51
  %60 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 29)
  %61 = add i32 %55, %54
  %62 = xor i32 %61, %60
  %63 = add i32 %62, %61
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 16)
  %65 = xor i32 %63, %64
  %66 = add i32 %50, %23
  %67 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 17)
  %68 = add i32 %66, %59
  %69 = xor i32 %68, %67
  %70 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 24)
  %71 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 29)
  %72 = add i32 %69, %68
  %73 = xor i32 %72, %71
  %74 = add i32 %73, %72
  %75 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 16)
  %76 = xor i32 %74, %75
  %77 = add i32 %65, %63
  %78 = xor i32 %77, %70
  %79 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 24)
  %80 = add i32 %18, 2
  %81 = add i32 %80, %78
  %82 = add i32 %76, %74
  %83 = xor i32 %82, %79
  %84 = add i32 %77, %47
  %85 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 13)
  %86 = add i32 %84, %81
  %87 = xor i32 %86, %85
  %88 = add i32 %32, 2
  %89 = add i32 %88, %83
  %90 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %87, i32 15)
  %91 = add i32 %87, %86
  %92 = xor i32 %91, %90
  %93 = add i32 %92, %91
  %94 = tail call i32 @llvm.fshl.i32(i32 %92, i32 %92, i32 26)
  %95 = xor i32 %93, %94
  %96 = add i32 %82, %57
  %97 = tail call i32 @llvm.fshl.i32(i32 %89, i32 %89, i32 13)
  %98 = add i32 %96, %89
  %99 = xor i32 %98, %97
  %100 = tail call i32 @llvm.fshl.i32(i32 %95, i32 %95, i32 6)
  %101 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %99, i32 15)
  %102 = add i32 %99, %98
  %103 = xor i32 %102, %101
  %104 = add i32 %103, %102
  %105 = tail call i32 @llvm.fshl.i32(i32 %103, i32 %103, i32 26)
  %106 = xor i32 %104, %105
  %107 = add i32 %95, %93
  %108 = xor i32 %107, %100
  %109 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %106, i32 6)
  %110 = add i32 %15, 3
  %111 = add i32 %110, %108
  %112 = add i32 %106, %104
  %113 = xor i32 %112, %109
  %114 = add i32 %107, %18
  %115 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %111, i32 17)
  %116 = add i32 %114, %111
  %117 = xor i32 %116, %115
  %118 = add i32 %23, 3
  %119 = add i32 %118, %113
  %120 = tail call i32 @llvm.fshl.i32(i32 %117, i32 %117, i32 29)
  %121 = add i32 %117, %116
  %122 = xor i32 %121, %120
  %123 = add i32 %122, %121
  %124 = tail call i32 @llvm.fshl.i32(i32 %122, i32 %122, i32 16)
  %125 = xor i32 %123, %124
  %126 = add i32 %112, %32
  %127 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %119, i32 17)
  %128 = add i32 %126, %119
  %129 = xor i32 %128, %127
  %130 = tail call i32 @llvm.fshl.i32(i32 %125, i32 %125, i32 24)
  %131 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 29)
  %132 = add i32 %129, %128
  %133 = xor i32 %132, %131
  %134 = add i32 %133, %132
  %135 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %133, i32 16)
  %136 = xor i32 %134, %135
  %137 = add i32 %125, %123
  %138 = xor i32 %137, %130
  %139 = tail call i32 @llvm.fshl.i32(i32 %136, i32 %136, i32 24)
  %140 = add i32 %47, 4
  %141 = add i32 %140, %138
  %142 = add i32 %136, %134
  %143 = xor i32 %142, %139
  %144 = add i32 %137, %15
  %145 = tail call i32 @llvm.fshl.i32(i32 %141, i32 %141, i32 13)
  %146 = add i32 %144, %141
  %147 = xor i32 %146, %145
  %148 = add i32 %57, 4
  %149 = add i32 %148, %143
  %150 = tail call i32 @llvm.fshl.i32(i32 %147, i32 %147, i32 15)
  %151 = add i32 %147, %146
  %152 = xor i32 %151, %150
  %153 = add i32 %152, %151
  %154 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %152, i32 26)
  %155 = xor i32 %153, %154
  %156 = add i32 %142, %23
  %157 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 13)
  %158 = add i32 %156, %149
  %159 = xor i32 %158, %157
  %160 = tail call i32 @llvm.fshl.i32(i32 %155, i32 %155, i32 6)
  %161 = tail call i32 @llvm.fshl.i32(i32 %159, i32 %159, i32 15)
  %162 = add i32 %159, %158
  %163 = xor i32 %162, %161
  %164 = add i32 %163, %162
  %165 = tail call i32 @llvm.fshl.i32(i32 %163, i32 %163, i32 26)
  %166 = xor i32 %164, %165
  %167 = add i32 %155, %153
  %168 = xor i32 %167, %160
  %169 = tail call i32 @llvm.fshl.i32(i32 %166, i32 %166, i32 6)
  %170 = add i32 %166, %164
  %171 = xor i32 %170, %169
  %172 = add i32 %167, %47
  %173 = add i32 %18, 5
  %174 = add i32 %173, %168
  %175 = xor i32 %174, %172
  %176 = add i32 %170, %57
  %177 = add i32 %32, 5
  %178 = add i32 %177, %171
  %179 = urem i32 %175, 101
  %180 = xor i32 %178, %176
  %181 = mul nuw nsw i32 %179, 68
  %182 = urem i32 %180, 101
  %183 = add nuw nsw i32 %182, %181
  %.lhs.trunc = trunc nuw nsw i32 %183 to i16
  %184 = urem i16 %.lhs.trunc, 101
  %.zext = zext nneg i16 %184 to i32
  %185 = zext nneg i32 %10 to i64
  %186 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %185
  store i32 %.zext, ptr addrspace(1) %186, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_divide_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(73728) %0, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %1, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %11 = shl nuw nsw i32 %9, 7
  %12 = or disjoint i32 %11, %10
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %13
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !86
  %16 = shl nuw nsw i32 %12, 1
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %17
  %19 = getelementptr inbounds i8, ptr addrspace(1) %18, i64 12288
  %20 = load <2 x i32>, ptr addrspace(1) %19, align 8, !invariant.load !4
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = tail call i32 @llvm.fshl.i32(i32 %15, i32 %15, i32 13)
  %24 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %13
  %25 = load i32, ptr addrspace(1) %24, align 4, !invariant.load !4, !alias.scope !93
  %26 = add i32 %25, %15
  %27 = xor i32 %26, %23
  %28 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 6144
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !4, !alias.scope !100
  %30 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 13)
  %31 = add i32 %21, %22
  %32 = xor i32 %31, %30
  %33 = tail call i32 @llvm.fshl.i32(i32 %27, i32 %27, i32 15)
  %34 = add i32 %27, %26
  %35 = xor i32 %34, %33
  %36 = add i32 %35, %34
  %37 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 26)
  %38 = xor i32 %36, %37
  %39 = tail call i32 @llvm.fshl.i32(i32 %29, i32 %29, i32 13)
  %40 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 6144
  %41 = load i32, ptr addrspace(1) %40, align 4, !invariant.load !4, !alias.scope !107
  %42 = add i32 %41, %29
  %43 = xor i32 %42, %39
  %44 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 15)
  %45 = add i32 %32, %31
  %46 = xor i32 %45, %44
  %47 = add i32 %46, %45
  %48 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 26)
  %49 = xor i32 %47, %48
  %50 = tail call i32 @llvm.fshl.i32(i32 %38, i32 %38, i32 6)
  %51 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 15)
  %52 = add i32 %43, %42
  %53 = xor i32 %52, %51
  %54 = add i32 %53, %52
  %55 = tail call i32 @llvm.fshl.i32(i32 %53, i32 %53, i32 26)
  %56 = xor i32 %54, %55
  %57 = tail call i32 @llvm.fshl.i32(i32 %49, i32 %49, i32 6)
  %58 = add i32 %38, %36
  %59 = xor i32 %58, %50
  %60 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 6)
  %61 = add i32 %49, %47
  %62 = xor i32 %61, %57
  %63 = xor i32 %15, %25
  %64 = xor i32 %63, 466688986
  %65 = add i32 %64, 1
  %66 = add i32 %65, %59
  %67 = add i32 %56, %54
  %68 = xor i32 %67, %60
  %69 = xor i32 %22, %21
  %70 = xor i32 %69, 466688986
  %71 = add i32 %70, 1
  %72 = add i32 %71, %62
  %73 = add i32 %58, %15
  %74 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 17)
  %75 = add i32 %73, %66
  %76 = xor i32 %75, %74
  %77 = xor i32 %29, %41
  %78 = xor i32 %77, 466688986
  %79 = add i32 %78, 1
  %80 = add i32 %79, %68
  %81 = add i32 %61, %22
  %82 = tail call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 17)
  %83 = add i32 %81, %72
  %84 = xor i32 %83, %82
  %85 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 29)
  %86 = add i32 %76, %75
  %87 = xor i32 %86, %85
  %88 = add i32 %87, %86
  %89 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %87, i32 16)
  %90 = xor i32 %88, %89
  %91 = add i32 %67, %29
  %92 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 17)
  %93 = add i32 %91, %80
  %94 = xor i32 %93, %92
  %95 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 29)
  %96 = add i32 %84, %83
  %97 = xor i32 %96, %95
  %98 = add i32 %97, %96
  %99 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %97, i32 16)
  %100 = xor i32 %98, %99
  %101 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %90, i32 24)
  %102 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %94, i32 29)
  %103 = add i32 %94, %93
  %104 = xor i32 %103, %102
  %105 = add i32 %104, %103
  %106 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %104, i32 16)
  %107 = xor i32 %105, %106
  %108 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %100, i32 24)
  %109 = add i32 %90, %88
  %110 = xor i32 %109, %101
  %111 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 24)
  %112 = add i32 %100, %98
  %113 = xor i32 %112, %108
  %114 = add i32 %25, 2
  %115 = add i32 %114, %110
  %116 = add i32 %107, %105
  %117 = xor i32 %116, %111
  %118 = add i32 %21, 2
  %119 = add i32 %118, %113
  %120 = add i32 %109, %64
  %121 = tail call i32 @llvm.fshl.i32(i32 %115, i32 %115, i32 13)
  %122 = add i32 %120, %115
  %123 = xor i32 %122, %121
  %124 = add i32 %41, 2
  %125 = add i32 %124, %117
  %126 = add i32 %112, %70
  %127 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %119, i32 13)
  %128 = add i32 %126, %119
  %129 = xor i32 %128, %127
  %130 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %123, i32 15)
  %131 = add i32 %123, %122
  %132 = xor i32 %131, %130
  %133 = add i32 %132, %131
  %134 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %132, i32 26)
  %135 = xor i32 %133, %134
  %136 = add i32 %116, %78
  %137 = tail call i32 @llvm.fshl.i32(i32 %125, i32 %125, i32 13)
  %138 = add i32 %136, %125
  %139 = xor i32 %138, %137
  %140 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 15)
  %141 = add i32 %129, %128
  %142 = xor i32 %141, %140
  %143 = add i32 %142, %141
  %144 = tail call i32 @llvm.fshl.i32(i32 %142, i32 %142, i32 26)
  %145 = xor i32 %143, %144
  %146 = tail call i32 @llvm.fshl.i32(i32 %135, i32 %135, i32 6)
  %147 = tail call i32 @llvm.fshl.i32(i32 %139, i32 %139, i32 15)
  %148 = add i32 %139, %138
  %149 = xor i32 %148, %147
  %150 = add i32 %149, %148
  %151 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 26)
  %152 = xor i32 %150, %151
  %153 = tail call i32 @llvm.fshl.i32(i32 %145, i32 %145, i32 6)
  %154 = add i32 %135, %133
  %155 = xor i32 %154, %146
  %156 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %152, i32 6)
  %157 = add i32 %145, %143
  %158 = xor i32 %157, %153
  %159 = add i32 %15, 3
  %160 = add i32 %159, %155
  %161 = add i32 %152, %150
  %162 = xor i32 %161, %156
  %163 = add i32 %22, 3
  %164 = add i32 %163, %158
  %165 = add i32 %154, %25
  %166 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 17)
  %167 = add i32 %165, %160
  %168 = xor i32 %167, %166
  %169 = add i32 %29, 3
  %170 = add i32 %169, %162
  %171 = add i32 %157, %21
  %172 = tail call i32 @llvm.fshl.i32(i32 %164, i32 %164, i32 17)
  %173 = add i32 %171, %164
  %174 = xor i32 %173, %172
  %175 = tail call i32 @llvm.fshl.i32(i32 %168, i32 %168, i32 29)
  %176 = add i32 %168, %167
  %177 = xor i32 %176, %175
  %178 = add i32 %177, %176
  %179 = tail call i32 @llvm.fshl.i32(i32 %177, i32 %177, i32 16)
  %180 = xor i32 %178, %179
  %181 = add i32 %161, %41
  %182 = tail call i32 @llvm.fshl.i32(i32 %170, i32 %170, i32 17)
  %183 = add i32 %181, %170
  %184 = xor i32 %183, %182
  %185 = tail call i32 @llvm.fshl.i32(i32 %174, i32 %174, i32 29)
  %186 = add i32 %174, %173
  %187 = xor i32 %186, %185
  %188 = add i32 %187, %186
  %189 = tail call i32 @llvm.fshl.i32(i32 %187, i32 %187, i32 16)
  %190 = xor i32 %188, %189
  %191 = tail call i32 @llvm.fshl.i32(i32 %180, i32 %180, i32 24)
  %192 = tail call i32 @llvm.fshl.i32(i32 %184, i32 %184, i32 29)
  %193 = add i32 %184, %183
  %194 = xor i32 %193, %192
  %195 = add i32 %194, %193
  %196 = tail call i32 @llvm.fshl.i32(i32 %194, i32 %194, i32 16)
  %197 = xor i32 %195, %196
  %198 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %190, i32 24)
  %199 = add i32 %180, %178
  %200 = xor i32 %199, %191
  %201 = tail call i32 @llvm.fshl.i32(i32 %197, i32 %197, i32 24)
  %202 = add i32 %190, %188
  %203 = xor i32 %202, %198
  %204 = add i32 %64, 4
  %205 = add i32 %204, %200
  %206 = add i32 %197, %195
  %207 = xor i32 %206, %201
  %208 = add i32 %70, 4
  %209 = add i32 %208, %203
  %210 = add i32 %199, %15
  %211 = tail call i32 @llvm.fshl.i32(i32 %205, i32 %205, i32 13)
  %212 = add i32 %210, %205
  %213 = xor i32 %212, %211
  %214 = add i32 %78, 4
  %215 = add i32 %214, %207
  %216 = add i32 %202, %22
  %217 = tail call i32 @llvm.fshl.i32(i32 %209, i32 %209, i32 13)
  %218 = add i32 %216, %209
  %219 = xor i32 %218, %217
  %220 = tail call i32 @llvm.fshl.i32(i32 %213, i32 %213, i32 15)
  %221 = add i32 %213, %212
  %222 = xor i32 %221, %220
  %223 = add i32 %222, %221
  %224 = tail call i32 @llvm.fshl.i32(i32 %222, i32 %222, i32 26)
  %225 = xor i32 %223, %224
  %226 = add i32 %206, %29
  %227 = tail call i32 @llvm.fshl.i32(i32 %215, i32 %215, i32 13)
  %228 = add i32 %226, %215
  %229 = xor i32 %228, %227
  %230 = tail call i32 @llvm.fshl.i32(i32 %219, i32 %219, i32 15)
  %231 = add i32 %219, %218
  %232 = xor i32 %231, %230
  %233 = add i32 %232, %231
  %234 = tail call i32 @llvm.fshl.i32(i32 %232, i32 %232, i32 26)
  %235 = xor i32 %233, %234
  %236 = tail call i32 @llvm.fshl.i32(i32 %225, i32 %225, i32 6)
  %237 = tail call i32 @llvm.fshl.i32(i32 %229, i32 %229, i32 15)
  %238 = add i32 %229, %228
  %239 = xor i32 %238, %237
  %240 = add i32 %239, %238
  %241 = tail call i32 @llvm.fshl.i32(i32 %239, i32 %239, i32 26)
  %242 = xor i32 %240, %241
  %243 = tail call i32 @llvm.fshl.i32(i32 %235, i32 %235, i32 6)
  %244 = add i32 %225, %223
  %245 = xor i32 %244, %236
  %246 = tail call i32 @llvm.fshl.i32(i32 %242, i32 %242, i32 6)
  %247 = add i32 %235, %233
  %248 = xor i32 %247, %243
  %249 = add i32 %242, %240
  %250 = xor i32 %249, %246
  %251 = add i32 %244, %64
  %252 = add i32 %25, 5
  %253 = add i32 %252, %245
  %254 = add i32 %247, %70
  %255 = add i32 %21, 5
  %256 = add i32 %255, %248
  %257 = xor i32 %253, %251
  %258 = add i32 %249, %78
  %259 = add i32 %41, 5
  %260 = add i32 %259, %250
  %261 = xor i32 %256, %254
  %262 = urem i32 %257, 6
  %263 = xor i32 %260, %258
  %264 = lshr i32 %261, 9
  %265 = shl nuw nsw i32 %262, 2
  %266 = urem i32 %263, 6
  %267 = or disjoint i32 %264, 1065353216
  %268 = add nuw nsw i32 %266, %265
  %269 = bitcast i32 %267 to float
  %.lhs.trunc = trunc nuw nsw i32 %268 to i8
  %270 = urem i8 %.lhs.trunc, 6
  %271 = fadd float %269, -1.000000e+00
  %272 = fmul float %271, 3.700000e+04
  %273 = fadd float %272, 3.000000e+03
  %narrow = add nuw nsw i8 %270, 2
  %274 = tail call float @llvm.maximum.f32(float %273, float 3.000000e+03)
  %275 = uitofp nneg i8 %narrow to float
  %276 = fdiv float %274, %275
  %277 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %13
  store float %276, ptr addrspace(1) %277, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @loop_and_compare_convert_maximum_select_slice_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(8080) %0, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %1, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %2, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %3, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %4, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %8, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %9, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %10, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %11, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %12, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %13, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %14, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %15, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %16, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %17, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %18, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %19, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %20, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %21, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %22, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %23, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %24, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %25, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %26, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %27, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %28, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %29, ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %30, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %31) local_unnamed_addr #2 {
  %33 = addrspacecast ptr %1 to ptr addrspace(1)
  %34 = addrspacecast ptr %2 to ptr addrspace(1)
  %35 = addrspacecast ptr %0 to ptr addrspace(1)
  %36 = addrspacecast ptr %4 to ptr addrspace(1)
  %37 = addrspacecast ptr %5 to ptr addrspace(1)
  %38 = addrspacecast ptr %3 to ptr addrspace(1)
  %39 = addrspacecast ptr %6 to ptr addrspace(1)
  %40 = addrspacecast ptr %7 to ptr addrspace(1)
  %41 = addrspacecast ptr %8 to ptr addrspace(1)
  %42 = addrspacecast ptr %9 to ptr addrspace(1)
  %43 = addrspacecast ptr %10 to ptr addrspace(1)
  %44 = addrspacecast ptr %11 to ptr addrspace(1)
  %45 = addrspacecast ptr %12 to ptr addrspace(1)
  %46 = addrspacecast ptr %13 to ptr addrspace(1)
  %47 = addrspacecast ptr %14 to ptr addrspace(1)
  %48 = addrspacecast ptr %15 to ptr addrspace(1)
  %49 = addrspacecast ptr %16 to ptr addrspace(1)
  %50 = addrspacecast ptr %17 to ptr addrspace(1)
  %51 = addrspacecast ptr %18 to ptr addrspace(1)
  %52 = addrspacecast ptr %19 to ptr addrspace(1)
  %53 = addrspacecast ptr %20 to ptr addrspace(1)
  %54 = addrspacecast ptr %21 to ptr addrspace(1)
  %55 = addrspacecast ptr %22 to ptr addrspace(1)
  %56 = addrspacecast ptr %23 to ptr addrspace(1)
  %57 = addrspacecast ptr %24 to ptr addrspace(1)
  %58 = addrspacecast ptr %25 to ptr addrspace(1)
  %59 = addrspacecast ptr %26 to ptr addrspace(1)
  %60 = addrspacecast ptr %27 to ptr addrspace(1)
  %61 = addrspacecast ptr %28 to ptr addrspace(1)
  %62 = addrspacecast ptr %29 to ptr addrspace(1)
  %63 = addrspacecast ptr %30 to ptr addrspace(1)
  %64 = addrspacecast ptr %31 to ptr addrspace(1)
  %65 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %66 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %67 = shl nuw nsw i32 %65, 7
  %68 = or disjoint i32 %67, %66
  %69 = udiv i32 %68, 14
  %70 = mul i32 %69, 14
  %.decomposed = sub i32 %68, %70
  tail call void @llvm.experimental.noalias.scope.decl(metadata !114)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !117)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !119)
  %71 = zext nneg i32 %69 to i64
  %72 = getelementptr inbounds float, ptr addrspace(1) %33, i64 %71
  %73 = load float, ptr addrspace(1) %72, align 4, !invariant.load !4, !alias.scope !117, !noalias !121
  tail call void @llvm.experimental.noalias.scope.decl(metadata !122)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !125)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !127)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !130)
  %74 = zext nneg i32 %68 to i64
  %75 = getelementptr inbounds i32, ptr addrspace(1) %34, i64 %74
  %76 = load i32, ptr addrspace(1) %75, align 4, !invariant.load !4, !alias.scope !132, !noalias !133
  %77 = icmp slt i32 %76, 0
  %78 = add i32 %76, 101
  %79 = select i1 %77, i32 %78, i32 %76
  %80 = tail call i32 @llvm.smax.i32(i32 %79, i32 0)
  %81 = tail call i32 @llvm.umin.i32(i32 %80, i32 100)
  %82 = mul nuw nsw i32 %81, 20
  %83 = zext nneg i32 %82 to i64
  %84 = getelementptr inbounds float, ptr addrspace(1) %35, i64 %83
  %85 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 16
  %86 = load <4 x float>, ptr addrspace(1) %85, align 16, !invariant.load !4, !noalias !4
  %87 = extractelement <4 x float> %86, i32 0
  %88 = extractelement <4 x float> %86, i32 1
  %89 = extractelement <4 x float> %86, i32 2
  %90 = extractelement <4 x float> %86, i32 3
  %91 = tail call float @llvm.maximum.f32(float %89, float 1.000000e+00)
  %92 = fdiv float %73, %91
  %.inv.i = fcmp ole float %92, 0xC1E0000000000000
  %93 = select i1 %.inv.i, float 0xC1E0000000000000, float %92
  %94 = fptosi float %93 to i32
  %95 = fcmp oge float %92, 0x41E0000000000000
  %96 = fcmp uno float %92, 0.000000e+00
  %97 = tail call i32 @llvm.smax.i32(i32 %94, i32 1)
  %98 = select i1 %95, i32 2147483647, i32 %97
  %99 = select i1 %96, i32 1, i32 %98
  %.urem = add nsw i32 %.decomposed, -7
  %.cmp = icmp samesign ult i32 %.decomposed, 7
  %100 = select i1 %.cmp, i32 %.decomposed, i32 %.urem
  %101 = getelementptr inbounds i32, ptr addrspace(1) %36, i64 %71
  %102 = load i32, ptr addrspace(1) %101, align 4, !invariant.load !4, !alias.scope !134
  %103 = tail call i32 @llvm.fshl.i32(i32 %102, i32 %102, i32 13)
  %104 = getelementptr inbounds i32, ptr addrspace(1) %37, i64 %71
  %105 = load i32, ptr addrspace(1) %104, align 4, !invariant.load !4, !alias.scope !141
  %106 = add i32 %105, %102
  %107 = xor i32 %106, %103
  %108 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 6144
  %109 = load i32, ptr addrspace(1) %108, align 4, !invariant.load !4, !alias.scope !148
  %110 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 15)
  %111 = add i32 %107, %106
  %112 = xor i32 %111, %110
  %113 = add i32 %112, %111
  %114 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %112, i32 26)
  %115 = xor i32 %113, %114
  %116 = tail call i32 @llvm.fshl.i32(i32 %109, i32 %109, i32 13)
  %117 = getelementptr inbounds i8, ptr addrspace(1) %104, i64 6144
  %118 = load i32, ptr addrspace(1) %117, align 4, !invariant.load !4, !alias.scope !155
  %119 = add i32 %118, %109
  %120 = xor i32 %119, %116
  %121 = tail call i32 @llvm.fshl.i32(i32 %115, i32 %115, i32 6)
  %122 = tail call i32 @llvm.fshl.i32(i32 %120, i32 %120, i32 15)
  %123 = add i32 %120, %119
  %124 = xor i32 %123, %122
  %125 = add i32 %124, %123
  %126 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %124, i32 26)
  %127 = xor i32 %125, %126
  %128 = add i32 %115, %113
  %129 = xor i32 %128, %121
  %130 = tail call i32 @llvm.fshl.i32(i32 %127, i32 %127, i32 6)
  %131 = xor i32 %102, %105
  %132 = xor i32 %131, 466688986
  %133 = add i32 %132, 1
  %134 = add i32 %133, %129
  %135 = add i32 %127, %125
  %136 = xor i32 %135, %130
  %137 = add i32 %128, %102
  %138 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 17)
  %139 = add i32 %137, %134
  %140 = xor i32 %139, %138
  %141 = xor i32 %109, %118
  %142 = xor i32 %141, 466688986
  %143 = add i32 %142, 1
  %144 = add i32 %143, %136
  %145 = tail call i32 @llvm.fshl.i32(i32 %140, i32 %140, i32 29)
  %146 = add i32 %140, %139
  %147 = xor i32 %146, %145
  %148 = add i32 %147, %146
  %149 = tail call i32 @llvm.fshl.i32(i32 %147, i32 %147, i32 16)
  %150 = xor i32 %148, %149
  %151 = add i32 %135, %109
  %152 = tail call i32 @llvm.fshl.i32(i32 %144, i32 %144, i32 17)
  %153 = add i32 %151, %144
  %154 = xor i32 %153, %152
  %155 = tail call i32 @llvm.fshl.i32(i32 %150, i32 %150, i32 24)
  %156 = tail call i32 @llvm.fshl.i32(i32 %154, i32 %154, i32 29)
  %157 = add i32 %154, %153
  %158 = xor i32 %157, %156
  %159 = add i32 %158, %157
  %160 = tail call i32 @llvm.fshl.i32(i32 %158, i32 %158, i32 16)
  %161 = xor i32 %159, %160
  %162 = add i32 %150, %148
  %163 = xor i32 %162, %155
  %164 = tail call i32 @llvm.fshl.i32(i32 %161, i32 %161, i32 24)
  %165 = add i32 %105, 2
  %166 = add i32 %165, %163
  %167 = add i32 %161, %159
  %168 = xor i32 %167, %164
  %169 = add i32 %162, %132
  %170 = tail call i32 @llvm.fshl.i32(i32 %166, i32 %166, i32 13)
  %171 = add i32 %169, %166
  %172 = xor i32 %171, %170
  %173 = add i32 %118, 2
  %174 = add i32 %173, %168
  %175 = tail call i32 @llvm.fshl.i32(i32 %172, i32 %172, i32 15)
  %176 = add i32 %172, %171
  %177 = xor i32 %176, %175
  %178 = add i32 %177, %176
  %179 = tail call i32 @llvm.fshl.i32(i32 %177, i32 %177, i32 26)
  %180 = xor i32 %178, %179
  %181 = add i32 %167, %142
  %182 = tail call i32 @llvm.fshl.i32(i32 %174, i32 %174, i32 13)
  %183 = add i32 %181, %174
  %184 = xor i32 %183, %182
  %185 = tail call i32 @llvm.fshl.i32(i32 %180, i32 %180, i32 6)
  %186 = tail call i32 @llvm.fshl.i32(i32 %184, i32 %184, i32 15)
  %187 = add i32 %184, %183
  %188 = xor i32 %187, %186
  %189 = add i32 %188, %187
  %190 = tail call i32 @llvm.fshl.i32(i32 %188, i32 %188, i32 26)
  %191 = xor i32 %189, %190
  %192 = add i32 %180, %178
  %193 = xor i32 %192, %185
  %194 = tail call i32 @llvm.fshl.i32(i32 %191, i32 %191, i32 6)
  %195 = add i32 %102, 3
  %196 = add i32 %195, %193
  %197 = add i32 %191, %189
  %198 = xor i32 %197, %194
  %199 = add i32 %192, %105
  %200 = tail call i32 @llvm.fshl.i32(i32 %196, i32 %196, i32 17)
  %201 = add i32 %199, %196
  %202 = xor i32 %201, %200
  %203 = add i32 %109, 3
  %204 = add i32 %203, %198
  %205 = tail call i32 @llvm.fshl.i32(i32 %202, i32 %202, i32 29)
  %206 = add i32 %202, %201
  %207 = xor i32 %206, %205
  %208 = add i32 %207, %206
  %209 = tail call i32 @llvm.fshl.i32(i32 %207, i32 %207, i32 16)
  %210 = xor i32 %208, %209
  %211 = add i32 %197, %118
  %212 = tail call i32 @llvm.fshl.i32(i32 %204, i32 %204, i32 17)
  %213 = add i32 %211, %204
  %214 = xor i32 %213, %212
  %215 = tail call i32 @llvm.fshl.i32(i32 %210, i32 %210, i32 24)
  %216 = tail call i32 @llvm.fshl.i32(i32 %214, i32 %214, i32 29)
  %217 = add i32 %214, %213
  %218 = xor i32 %217, %216
  %219 = add i32 %218, %217
  %220 = tail call i32 @llvm.fshl.i32(i32 %218, i32 %218, i32 16)
  %221 = xor i32 %219, %220
  %222 = add i32 %210, %208
  %223 = xor i32 %222, %215
  %224 = tail call i32 @llvm.fshl.i32(i32 %221, i32 %221, i32 24)
  %225 = add i32 %132, 4
  %226 = add i32 %225, %223
  %227 = add i32 %221, %219
  %228 = xor i32 %227, %224
  %229 = add i32 %222, %102
  %230 = tail call i32 @llvm.fshl.i32(i32 %226, i32 %226, i32 13)
  %231 = add i32 %229, %226
  %232 = xor i32 %231, %230
  %233 = add i32 %142, 4
  %234 = add i32 %233, %228
  %235 = tail call i32 @llvm.fshl.i32(i32 %232, i32 %232, i32 15)
  %236 = add i32 %232, %231
  %237 = xor i32 %236, %235
  %238 = add i32 %237, %236
  %239 = tail call i32 @llvm.fshl.i32(i32 %237, i32 %237, i32 26)
  %240 = xor i32 %238, %239
  %241 = add i32 %227, %109
  %242 = tail call i32 @llvm.fshl.i32(i32 %234, i32 %234, i32 13)
  %243 = add i32 %241, %234
  %244 = xor i32 %243, %242
  %245 = tail call i32 @llvm.fshl.i32(i32 %240, i32 %240, i32 6)
  %246 = tail call i32 @llvm.fshl.i32(i32 %244, i32 %244, i32 15)
  %247 = add i32 %244, %243
  %248 = xor i32 %247, %246
  %249 = add i32 %248, %247
  %250 = tail call i32 @llvm.fshl.i32(i32 %248, i32 %248, i32 26)
  %251 = xor i32 %249, %250
  %252 = add i32 %240, %238
  %253 = xor i32 %252, %245
  %254 = tail call i32 @llvm.fshl.i32(i32 %251, i32 %251, i32 6)
  %255 = add i32 %251, %249
  %256 = xor i32 %255, %254
  %257 = add i32 %252, %132
  %258 = add i32 %105, 5
  %259 = add i32 %258, %253
  %260 = xor i32 %259, %257
  %261 = add i32 %255, %142
  %262 = add i32 %118, 5
  %263 = add i32 %262, %256
  %264 = urem i32 %260, 6
  %265 = xor i32 %263, %261
  %266 = shl nuw nsw i32 %264, 2
  %267 = urem i32 %265, 6
  %268 = add nuw nsw i32 %267, %266
  %.lhs.trunc = trunc nuw nsw i32 %268 to i8
  %269 = urem i8 %.lhs.trunc, 6
  %narrow = add nuw nsw i8 %269, 2
  %270 = zext nneg i8 %narrow to i32
  %271 = uitofp nneg i32 %99 to float
  %272 = icmp samesign ult i32 %100, %270
  %273 = fmul float %89, %271
  %274 = select i1 %272, float %273, float 0.000000e+00
  %275 = getelementptr inbounds i32, ptr addrspace(1) %38, i64 %74
  %276 = load i32, ptr addrspace(1) %275, align 4, !invariant.load !4
  %277 = srem i32 %276, 15
  %278 = icmp slt i32 %277, 0
  %279 = add nsw i32 %277, 15
  %280 = select i1 %278, i32 %279, i32 %277
  %281 = zext i1 %272 to i8
  %282 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 32
  %283 = load <4 x float>, ptr addrspace(1) %282, align 16, !invariant.load !4, !noalias !4
  %284 = extractelement <4 x float> %283, i32 0
  %285 = extractelement <4 x float> %283, i32 1
  %286 = extractelement <4 x float> %283, i32 2
  %287 = extractelement <4 x float> %283, i32 3
  %288 = fcmp ogt float %285, 0.000000e+00
  %289 = zext i1 %288 to i8
  %290 = icmp sgt i32 %280, 0
  %291 = icmp slt i32 %280, 14
  %292 = and i8 %281, %289
  %.v = select i1 %.cmp, i1 %290, i1 %291
  %293 = select i1 %.v, i8 %292, i8 0
  %294 = select i1 %.cmp, i32 -1, i32 1
  %295 = add i32 %276, %294
  %296 = tail call i32 @llvm.smax.i32(i32 %295, i32 0)
  %297 = tail call i32 @llvm.umin.i32(i32 %296, i32 164)
  %298 = and i1 %288, %.v
  %299 = select i1 %298, i32 %297, i32 %276
  %300 = icmp slt i32 %299, 0
  %301 = add i32 %299, 165
  %302 = select i1 %300, i32 %301, i32 %299
  %303 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 64
  %304 = load <4 x float>, ptr addrspace(1) %303, align 16, !invariant.load !4, !noalias !4
  %305 = extractelement <4 x float> %304, i32 0
  %306 = extractelement <4 x float> %304, i32 1
  %307 = extractelement <4 x float> %304, i32 2
  %308 = extractelement <4 x float> %304, i32 3
  %309 = fcmp ogt float %305, 0.000000e+00
  %310 = zext i1 %309 to i8
  %311 = fcmp ogt float %307, 0.000000e+00
  %312 = zext i1 %311 to i8
  %313 = fcmp ogt float %306, 0.000000e+00
  %314 = zext i1 %313 to i8
  %.inv.i7 = fcmp ole float %88, 0xC1E0000000000000
  %315 = select i1 %.inv.i7, float 0xC1E0000000000000, float %88
  %316 = fptosi float %315 to i32
  %317 = fcmp oge float %88, 0x41E0000000000000
  %318 = select i1 %317, i32 2147483647, i32 %316
  %319 = fcmp uno float %88, 0.000000e+00
  %320 = select i1 %319, i32 0, i32 %318
  %321 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 48
  %322 = load <4 x float>, ptr addrspace(1) %321, align 16, !invariant.load !4, !noalias !4
  %323 = extractelement <4 x float> %322, i32 0
  %324 = extractelement <4 x float> %322, i32 1
  %325 = extractelement <4 x float> %322, i32 2
  %326 = extractelement <4 x float> %322, i32 3
  %.inv = fcmp ole float %323, 0xC1E0000000000000
  %327 = select i1 %.inv, float 0xC1E0000000000000, float %323
  %328 = fptosi float %327 to i32
  %329 = fcmp oge float %323, 0x41E0000000000000
  %330 = select i1 %329, i32 2147483647, i32 %328
  %331 = fcmp uno float %323, 0.000000e+00
  %332 = select i1 %331, i32 0, i32 %330
  %333 = fcmp ogt float %90, 0.000000e+00
  %334 = zext i1 %333 to i8
  %335 = load <4 x float>, ptr addrspace(1) %84, align 16, !invariant.load !4, !noalias !4
  %336 = extractelement <4 x float> %335, i32 0
  %337 = extractelement <4 x float> %335, i32 1
  %338 = extractelement <4 x float> %335, i32 2
  %339 = extractelement <4 x float> %335, i32 3
  %.inv1 = fcmp ole float %338, 0xC1E0000000000000
  %340 = select i1 %.inv1, float 0xC1E0000000000000, float %338
  %341 = fptosi float %340 to i32
  %342 = fcmp oge float %338, 0x41E0000000000000
  %343 = select i1 %342, i32 2147483647, i32 %341
  %344 = fcmp uno float %338, 0.000000e+00
  %345 = select i1 %344, i32 0, i32 %343
  %.inv2 = fcmp ole float %339, 0xC1E0000000000000
  %346 = select i1 %.inv2, float 0xC1E0000000000000, float %339
  %347 = fptosi float %346 to i32
  %348 = fcmp oge float %339, 0x41E0000000000000
  %349 = select i1 %348, i32 2147483647, i32 %347
  %350 = fcmp uno float %339, 0.000000e+00
  %351 = select i1 %350, i32 0, i32 %349
  %.inv3 = fcmp ole float %336, 0xC1E0000000000000
  %352 = select i1 %.inv3, float 0xC1E0000000000000, float %336
  %353 = fptosi float %352 to i32
  %354 = fcmp oge float %336, 0x41E0000000000000
  %355 = select i1 %354, i32 2147483647, i32 %353
  %356 = fcmp uno float %336, 0.000000e+00
  %357 = select i1 %356, i32 0, i32 %355
  %.inv4 = fcmp ole float %337, 0xC1E0000000000000
  %358 = select i1 %.inv4, float 0xC1E0000000000000, float %337
  %359 = fptosi float %358 to i32
  %360 = fcmp oge float %337, 0x41E0000000000000
  %361 = select i1 %360, i32 2147483647, i32 %359
  %362 = fcmp uno float %337, 0.000000e+00
  %363 = select i1 %362, i32 0, i32 %361
  %.inv5 = fcmp ole float %87, 0xC1E0000000000000
  %364 = select i1 %.inv5, float 0xC1E0000000000000, float %87
  %365 = fptosi float %364 to i32
  %366 = fcmp oge float %87, 0x41E0000000000000
  %367 = select i1 %366, i32 2147483647, i32 %365
  %368 = fcmp uno float %87, 0.000000e+00
  %369 = select i1 %368, i32 0, i32 %367
  %.inv6 = fcmp ole float %308, 0xC1E0000000000000
  %370 = select i1 %.inv6, float 0xC1E0000000000000, float %308
  %371 = fptosi float %370 to i32
  %372 = fcmp oge float %308, 0x41E0000000000000
  %373 = fcmp uno float %308, 0.000000e+00
  %374 = tail call i32 @llvm.smax.i32(i32 %371, i32 1)
  %375 = select i1 %372, i32 2147483647, i32 %374
  %376 = select i1 %373, i32 1, i32 %375
  %377 = fcmp ogt float %284, 0.000000e+00
  %378 = zext i1 %377 to i8
  %379 = fcmp ogt float %286, 0.000000e+00
  %380 = zext i1 %379 to i8
  %381 = fcmp ogt float %287, 0.000000e+00
  %382 = zext i1 %381 to i8
  %383 = fcmp ogt float %324, 0.000000e+00
  %384 = zext i1 %383 to i8
  %385 = fcmp ogt float %325, 0.000000e+00
  %386 = zext i1 %385 to i8
  %387 = fcmp ogt float %326, 0.000000e+00
  %388 = zext i1 %387 to i8
  %389 = add i32 %320, 1000
  %390 = select i1 %272, i32 %389, i32 -10000
  %391 = getelementptr inbounds i32, ptr addrspace(1) %39, i64 %74
  store i32 %99, ptr addrspace(1) %391, align 4
  %392 = getelementptr inbounds float, ptr addrspace(1) %40, i64 %74
  store float %274, ptr addrspace(1) %392, align 4
  %393 = getelementptr inbounds i8, ptr addrspace(1) %41, i64 %74
  store i8 %293, ptr addrspace(1) %393, align 1
  %394 = getelementptr inbounds i32, ptr addrspace(1) %42, i64 %74
  store i32 %302, ptr addrspace(1) %394, align 4
  %395 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 %74
  store i8 %310, ptr addrspace(1) %395, align 1
  %396 = getelementptr inbounds i8, ptr addrspace(1) %44, i64 %74
  store i8 %312, ptr addrspace(1) %396, align 1
  %397 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 %74
  store i8 %314, ptr addrspace(1) %397, align 1
  %398 = getelementptr inbounds i32, ptr addrspace(1) %46, i64 %74
  store i32 %320, ptr addrspace(1) %398, align 4
  %399 = getelementptr inbounds i8, ptr addrspace(1) %47, i64 %74
  store i8 %289, ptr addrspace(1) %399, align 1
  %400 = getelementptr inbounds float, ptr addrspace(1) %48, i64 %74
  store float %89, ptr addrspace(1) %400, align 4
  %401 = getelementptr inbounds i32, ptr addrspace(1) %49, i64 %74
  store i32 %332, ptr addrspace(1) %401, align 4
  %402 = getelementptr inbounds i8, ptr addrspace(1) %50, i64 %74
  store i8 %334, ptr addrspace(1) %402, align 1
  %403 = getelementptr inbounds i32, ptr addrspace(1) %51, i64 %74
  store i32 %345, ptr addrspace(1) %403, align 4
  %404 = getelementptr inbounds i32, ptr addrspace(1) %52, i64 %74
  store i32 %351, ptr addrspace(1) %404, align 4
  %405 = getelementptr inbounds i32, ptr addrspace(1) %53, i64 %74
  store i32 %357, ptr addrspace(1) %405, align 4
  %406 = getelementptr inbounds i32, ptr addrspace(1) %54, i64 %74
  store i32 %363, ptr addrspace(1) %406, align 4
  %407 = getelementptr inbounds i32, ptr addrspace(1) %55, i64 %74
  store i32 %369, ptr addrspace(1) %407, align 4
  %408 = getelementptr inbounds i32, ptr addrspace(1) %56, i64 %74
  store i32 %376, ptr addrspace(1) %408, align 4
  %409 = getelementptr inbounds i8, ptr addrspace(1) %57, i64 %74
  store i8 %378, ptr addrspace(1) %409, align 1
  %410 = getelementptr inbounds i8, ptr addrspace(1) %58, i64 %74
  store i8 %380, ptr addrspace(1) %410, align 1
  %411 = getelementptr inbounds i8, ptr addrspace(1) %59, i64 %74
  store i8 %382, ptr addrspace(1) %411, align 1
  %412 = getelementptr inbounds i8, ptr addrspace(1) %60, i64 %74
  store i8 %384, ptr addrspace(1) %412, align 1
  %413 = getelementptr inbounds i8, ptr addrspace(1) %61, i64 %74
  store i8 %386, ptr addrspace(1) %413, align 1
  %414 = getelementptr inbounds i8, ptr addrspace(1) %62, i64 %74
  store i8 %388, ptr addrspace(1) %414, align 1
  %415 = getelementptr inbounds i32, ptr addrspace(1) %63, i64 %74
  store i32 %390, ptr addrspace(1) %415, align 4
  %416 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 %74
  store i8 %281, ptr addrspace(1) %416, align 1
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_transpose_fusion_2(ptr noalias readonly align 256 captures(none) dereferenceable(86016) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(172032) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(172032) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !162
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %9 = and i32 %8, 1
  %10 = shl nuw nsw i32 %7, 7
  %11 = or disjoint i32 %10, %8
  %12 = udiv i32 %11, 28
  %.not.not = icmp eq i32 %9, 0
  br i1 %.not.not, label %29, label %13

13:                                               ; preds = %3
  %14 = shl nuw nsw i32 %7, 6
  %15 = lshr i32 %8, 1
  %16 = or disjoint i32 %14, %15
  %17 = urem i32 %16, 14
  %18 = zext nneg i32 %16 to i64
  %19 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %18
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = icmp samesign ult i32 %17, 7
  %22 = select i1 %21, i32 -1, i32 1
  %23 = add i32 %20, %22
  %24 = tail call i32 @llvm.smax.i32(i32 %23, i32 0)
  %25 = tail call i32 @llvm.umin.i32(i32 %24, i32 164)
  %26 = icmp slt i32 %20, 0
  %27 = add i32 %20, 165
  %28 = select i1 %26, i32 %27, i32 %20
  br label %29

29:                                               ; preds = %13, %3
  %30 = phi i32 [ %25, %13 ], [ %12, %3 ]
  %31 = phi i32 [ %28, %13 ], [ %12, %3 ]
  %32 = zext nneg i32 %11 to i64
  %33 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %32
  store i32 %30, ptr addrspace(1) %33, align 4
  %34 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %32
  store i32 %31, ptr addrspace(1) %34, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_6(ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %4) local_unnamed_addr #3 {
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %13 = shl nuw nsw i32 %12, 2
  %14 = shl nuw nsw i32 %11, 9
  %15 = or disjoint i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %16
  store <4 x i8> zeroinitializer, ptr addrspace(1) %17, align 4
  %18 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %16
  store <4 x i8> zeroinitializer, ptr addrspace(1) %18, align 4
  %19 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %16
  store <4 x i8> zeroinitializer, ptr addrspace(1) %19, align 4
  %20 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %16
  store <4 x i8> zeroinitializer, ptr addrspace(1) %20, align 4
  %21 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %16
  store <4 x i8> zeroinitializer, ptr addrspace(1) %21, align 4
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_15(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(172032) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2) local_unnamed_addr #6 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = addrspacecast ptr %2 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %9 = shl nuw nsw i32 %7, 1
  %10 = shl nuw nsw i32 %8, 8
  %11 = or disjoint i32 %9, %10
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %12
  %14 = load <2 x i32>, ptr addrspace(1) %13, align 8, !invariant.load !4
  %15 = extractelement <2 x i32> %14, i32 0
  %16 = extractelement <2 x i32> %14, i32 1
  %17 = icmp ult i32 %15, 1536
  %18 = icmp ult i32 %16, 165
  %19 = and i1 %17, %18
  br i1 %19, label %20, label %.loopexit

20:                                               ; preds = %3
  %21 = shl nuw nsw i32 %8, 7
  %22 = or disjoint i32 %21, %7
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %23
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !4
  %26 = mul nuw nsw i32 %15, 165
  %27 = add nuw nsw i32 %26, %16
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %28
  %30 = addrspacecast ptr addrspace(1) %29 to ptr
  %31 = ptrtoint ptr %30 to i64
  %32 = and i64 %31, 3
  %33 = sub nsw i64 0, %32
  %34 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 %33
  %35 = trunc nuw nsw i64 %32 to i32
  %36 = shl nuw nsw i32 %35, 3
  %37 = shl nuw i32 255, %36
  %38 = xor i32 %37, -1
  %39 = load i32, ptr addrspace(1) %34, align 4
  br label %40

40:                                               ; preds = %40, %20
  %41 = phi i32 [ %50, %40 ], [ %39, %20 ]
  %42 = lshr i32 %41, %36
  %43 = trunc i32 %42 to i8
  %44 = or i8 %25, %43
  %45 = zext i8 %44 to i32
  %46 = and i32 %41, %38
  %47 = shl nuw i32 %45, %36
  %48 = or i32 %47, %46
  %49 = cmpxchg ptr addrspace(1) %34, i32 %41, i32 %48 monotonic monotonic, align 4
  %50 = extractvalue { i32, i1 } %49, 0
  %51 = extractvalue { i32, i1 } %49, 1
  br i1 %51, label %.loopexit, label %40

.loopexit:                                        ; preds = %40, %3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_transpose_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(86016) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(172032) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !162
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = and i32 %6, 1
  %8 = shl nuw nsw i32 %5, 7
  %9 = or disjoint i32 %8, %6
  %10 = udiv i32 %9, 28
  %.not.not = icmp eq i32 %7, 0
  %11 = shl nuw nsw i32 %5, 6
  %12 = lshr i32 %6, 1
  %13 = or disjoint i32 %11, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %3, i64 %14
  br i1 %.not.not, label %18, label %16

16:                                               ; preds = %2
  %17 = load i32, ptr addrspace(1) %15, align 4, !invariant.load !4
  br label %18

18:                                               ; preds = %16, %2
  %19 = phi i32 [ %17, %16 ], [ %10, %2 ]
  %20 = zext nneg i32 %9 to i64
  %21 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %20
  store i32 %19, ptr addrspace(1) %21, align 4
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_14(ptr noalias align 256 dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(172032) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %4) local_unnamed_addr #6 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %13 = shl nuw nsw i32 %11, 1
  %14 = shl nuw nsw i32 %12, 8
  %15 = or disjoint i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %16
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !4
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = icmp ult i32 %19, 1536
  %22 = icmp ult i32 %20, 165
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %.loopexit

24:                                               ; preds = %5
  %25 = shl nuw nsw i32 %12, 7
  %26 = or disjoint i32 %25, %11
  %27 = zext nneg i32 %26 to i64
  %28 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %27
  %29 = load i8, ptr addrspace(1) %28, align 1, !invariant.load !4
  %30 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %27
  %31 = load i32, ptr addrspace(1) %30, align 4, !invariant.load !4
  %32 = icmp slt i32 %31, 0
  %33 = add i32 %31, 101
  %34 = select i1 %32, i32 %33, i32 %31
  %35 = tail call i32 @llvm.smax.i32(i32 %34, i32 0)
  %36 = tail call i32 @llvm.umin.i32(i32 %35, i32 100)
  %37 = mul nuw nsw i32 %36, 20
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %38
  %40 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 36
  %41 = load float, ptr addrspace(1) %40, align 4, !invariant.load !4
  %42 = fcmp ogt float %41, 0.000000e+00
  %43 = and i8 %29, 1
  %44 = select i1 %42, i8 %43, i8 0
  %45 = mul nuw nsw i32 %19, 165
  %46 = add nuw nsw i32 %45, %20
  %47 = zext nneg i32 %46 to i64
  %48 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %47
  %49 = addrspacecast ptr addrspace(1) %48 to ptr
  %50 = ptrtoint ptr %49 to i64
  %51 = and i64 %50, 3
  %52 = sub nsw i64 0, %51
  %53 = getelementptr inbounds i8, ptr addrspace(1) %48, i64 %52
  %54 = trunc nuw nsw i64 %51 to i32
  %55 = shl nuw nsw i32 %54, 3
  %56 = shl nuw i32 255, %55
  %57 = xor i32 %56, -1
  %58 = load i32, ptr addrspace(1) %53, align 4
  br label %59

59:                                               ; preds = %59, %24
  %60 = phi i32 [ %69, %59 ], [ %58, %24 ]
  %61 = lshr i32 %60, %55
  %62 = trunc i32 %61 to i8
  %63 = or i8 %44, %62
  %64 = zext i8 %63 to i32
  %65 = and i32 %60, %57
  %66 = shl nuw i32 %64, %55
  %67 = or i32 %66, %65
  %68 = cmpxchg ptr addrspace(1) %53, i32 %60, i32 %67 monotonic monotonic, align 4
  %69 = extractvalue { i32, i1 } %68, 0
  %70 = extractvalue { i32, i1 } %68, 1
  br i1 %70, label %.loopexit, label %59

.loopexit:                                        ; preds = %59, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_reduce_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(86016) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %9 = shl nuw nsw i32 %7, 7
  %10 = or disjoint i32 %9, %8
  %11 = mul nuw nsw i32 %8, 14
  %12 = mul nuw nsw i32 %7, 1792
  %13 = add nuw nsw i32 %11, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %14
  %16 = load <2 x i32>, ptr addrspace(1) %15, align 8, !invariant.load !4
  %17 = extractelement <2 x i32> %16, i32 0
  %18 = extractelement <2 x i32> %16, i32 1
  %19 = tail call i32 @llvm.smax.i32(i32 %17, i32 %18)
  %.not = icmp slt i32 %17, %18
  %20 = zext i1 %.not to i32
  %21 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 8
  %22 = load <2 x i32>, ptr addrspace(1) %21, align 8, !invariant.load !4
  %23 = extractelement <2 x i32> %22, i32 0
  %24 = extractelement <2 x i32> %22, i32 1
  %25 = tail call i32 @llvm.smax.i32(i32 %19, i32 %23)
  %.not1 = icmp slt i32 %19, %23
  %26 = select i1 %.not1, i32 2, i32 %20
  %27 = tail call i32 @llvm.smax.i32(i32 %25, i32 %24)
  %.not2 = icmp slt i32 %25, %24
  %28 = select i1 %.not2, i32 3, i32 %26
  %29 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 16
  %30 = load <2 x i32>, ptr addrspace(1) %29, align 8, !invariant.load !4
  %31 = extractelement <2 x i32> %30, i32 0
  %32 = extractelement <2 x i32> %30, i32 1
  %33 = tail call i32 @llvm.smax.i32(i32 %27, i32 %31)
  %.not3 = icmp slt i32 %27, %31
  %34 = select i1 %.not3, i32 4, i32 %28
  %35 = tail call i32 @llvm.smax.i32(i32 %33, i32 %32)
  %.not4 = icmp slt i32 %33, %32
  %36 = select i1 %.not4, i32 5, i32 %34
  %37 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 24
  %38 = load <2 x i32>, ptr addrspace(1) %37, align 8, !invariant.load !4
  %39 = extractelement <2 x i32> %38, i32 0
  %40 = extractelement <2 x i32> %38, i32 1
  %41 = tail call i32 @llvm.smax.i32(i32 %35, i32 %39)
  %.not5 = icmp slt i32 %35, %39
  %42 = select i1 %.not5, i32 6, i32 %36
  %43 = tail call i32 @llvm.smax.i32(i32 %41, i32 %40)
  %.not6 = icmp slt i32 %41, %40
  %44 = select i1 %.not6, i32 7, i32 %42
  %45 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 32
  %46 = load <2 x i32>, ptr addrspace(1) %45, align 8, !invariant.load !4
  %47 = extractelement <2 x i32> %46, i32 0
  %48 = extractelement <2 x i32> %46, i32 1
  %49 = tail call i32 @llvm.smax.i32(i32 %43, i32 %47)
  %.not7 = icmp slt i32 %43, %47
  %50 = select i1 %.not7, i32 8, i32 %44
  %51 = tail call i32 @llvm.smax.i32(i32 %49, i32 %48)
  %.not8 = icmp slt i32 %49, %48
  %52 = select i1 %.not8, i32 9, i32 %50
  %53 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 40
  %54 = load <2 x i32>, ptr addrspace(1) %53, align 8, !invariant.load !4
  %55 = extractelement <2 x i32> %54, i32 0
  %56 = extractelement <2 x i32> %54, i32 1
  %57 = tail call i32 @llvm.smax.i32(i32 %51, i32 %55)
  %.not9 = icmp slt i32 %51, %55
  %58 = select i1 %.not9, i32 10, i32 %52
  %59 = tail call i32 @llvm.smax.i32(i32 %57, i32 %56)
  %.not10 = icmp slt i32 %57, %56
  %60 = select i1 %.not10, i32 11, i32 %58
  %61 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 48
  %62 = load <2 x i32>, ptr addrspace(1) %61, align 8, !invariant.load !4
  %63 = extractelement <2 x i32> %62, i32 0
  %64 = extractelement <2 x i32> %62, i32 1
  %65 = tail call i32 @llvm.smax.i32(i32 %59, i32 %63)
  %.not11 = icmp slt i32 %59, %63
  %66 = select i1 %.not11, i32 12, i32 %60
  %67 = tail call i32 @llvm.smax.i32(i32 %65, i32 %64)
  %.not12 = icmp slt i32 %65, %64
  %68 = select i1 %.not12, i32 13, i32 %66
  %69 = zext nneg i32 %10 to i64
  %70 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %69
  store i32 %67, ptr addrspace(1) %70, align 4
  %71 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %69
  store i32 %68, ptr addrspace(1) %71, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_and_fusion_1(ptr noalias writeonly align 256 captures(none) dereferenceable(165) %0) local_unnamed_addr #3 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !164
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %3, 7
  %6 = or disjoint i32 %5, %4
  %7 = icmp samesign ult i32 %6, 165
  %8 = zext nneg i32 %6 to i64
  %9 = getelementptr inbounds i8, ptr addrspace(1) %2, i64 %8
  br i1 %7, label %10, label %11

10:                                               ; preds = %1
  store i8 0, ptr addrspace(1) %9, align 1
  br label %11

11:                                               ; preds = %10, %1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_select_fusion_3(ptr noalias readonly align 256 captures(none) dereferenceable(73728) %0, ptr noalias readonly align 256 captures(none) dereferenceable(165) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(1013760) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %9 = shl nuw nsw i32 %8, 2
  %10 = shl nuw nsw i32 %7, 9
  %11 = or disjoint i32 %9, %10
  %12 = udiv i32 %11, 165
  %13 = mul i32 %12, 165
  %.decomposed = sub i32 %11, %13
  %14 = shl nuw nsw i32 %12, 1
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %15
  %17 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 49152
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !4
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = add i32 %20, %.decomposed
  %22 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 13)
  %23 = add i32 %19, %21
  %24 = xor i32 %23, %22
  %25 = tail call i32 @llvm.fshl.i32(i32 %24, i32 %24, i32 15)
  %26 = add i32 %24, %23
  %27 = xor i32 %26, %25
  %28 = add i32 %27, %26
  %29 = tail call i32 @llvm.fshl.i32(i32 %27, i32 %27, i32 26)
  %30 = xor i32 %28, %29
  %31 = tail call i32 @llvm.fshl.i32(i32 %30, i32 %30, i32 6)
  %32 = add i32 %30, %28
  %33 = xor i32 %32, %31
  %34 = xor i32 %20, %19
  %35 = xor i32 %34, 466688986
  %36 = add i32 %35, 1
  %37 = add i32 %36, %33
  %38 = add i32 %32, %20
  %39 = tail call i32 @llvm.fshl.i32(i32 %37, i32 %37, i32 17)
  %40 = add i32 %38, %37
  %41 = xor i32 %40, %39
  %42 = tail call i32 @llvm.fshl.i32(i32 %41, i32 %41, i32 29)
  %43 = add i32 %41, %40
  %44 = xor i32 %43, %42
  %45 = add i32 %44, %43
  %46 = tail call i32 @llvm.fshl.i32(i32 %44, i32 %44, i32 16)
  %47 = xor i32 %45, %46
  %48 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 24)
  %49 = add i32 %47, %45
  %50 = xor i32 %49, %48
  %51 = add i32 %19, 2
  %52 = add i32 %51, %50
  %53 = add i32 %49, %35
  %54 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 13)
  %55 = add i32 %53, %52
  %56 = xor i32 %55, %54
  %57 = tail call i32 @llvm.fshl.i32(i32 %56, i32 %56, i32 15)
  %58 = add i32 %56, %55
  %59 = xor i32 %58, %57
  %60 = add i32 %59, %58
  %61 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 26)
  %62 = xor i32 %60, %61
  %63 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 6)
  %64 = add i32 %62, %60
  %65 = xor i32 %64, %63
  %66 = add i32 %20, 3
  %67 = add i32 %66, %65
  %68 = add i32 %64, %19
  %69 = tail call i32 @llvm.fshl.i32(i32 %67, i32 %67, i32 17)
  %70 = add i32 %68, %67
  %71 = xor i32 %70, %69
  %72 = tail call i32 @llvm.fshl.i32(i32 %71, i32 %71, i32 29)
  %73 = add i32 %71, %70
  %74 = xor i32 %73, %72
  %75 = add i32 %74, %73
  %76 = tail call i32 @llvm.fshl.i32(i32 %74, i32 %74, i32 16)
  %77 = xor i32 %75, %76
  %78 = tail call i32 @llvm.fshl.i32(i32 %77, i32 %77, i32 24)
  %79 = add i32 %77, %75
  %80 = xor i32 %79, %78
  %81 = add i32 %35, 4
  %82 = add i32 %81, %80
  %83 = add i32 %79, %20
  %84 = tail call i32 @llvm.fshl.i32(i32 %82, i32 %82, i32 13)
  %85 = add i32 %83, %82
  %86 = xor i32 %85, %84
  %87 = tail call i32 @llvm.fshl.i32(i32 %86, i32 %86, i32 15)
  %88 = add i32 %86, %85
  %89 = xor i32 %88, %87
  %90 = add i32 %89, %88
  %91 = tail call i32 @llvm.fshl.i32(i32 %89, i32 %89, i32 26)
  %92 = xor i32 %90, %91
  %93 = tail call i32 @llvm.fshl.i32(i32 %92, i32 %92, i32 6)
  %94 = add i32 %92, %90
  %95 = xor i32 %94, %93
  %96 = add i32 %94, %35
  %97 = add i32 %19, 5
  %98 = add i32 %97, %95
  %99 = xor i32 %98, %96
  %100 = lshr i32 %99, 9
  %101 = or disjoint i32 %100, 1065353216
  %102 = bitcast i32 %101 to float
  %103 = fadd float %102, -1.000000e+00
  %104 = zext nneg i32 %.decomposed to i64
  %105 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %104
  %106 = load i8, ptr addrspace(1) %105, align 1, !invariant.load !4
  %.lhs.trunc = trunc nuw i32 %.decomposed to i8
  %107 = urem i8 %.lhs.trunc, 15
  %.zext = zext nneg i8 %107 to i32
  %108 = add nuw nsw i32 %.zext, 15
  %109 = trunc i8 %106 to i1
  %110 = select i1 %109, i32 %108, i32 %.zext
  %111 = add nsw i32 %110, -3
  %112 = icmp ult i32 %111, 9
  %113 = tail call float @llvm.maximum.f32(float %103, float 0.000000e+00)
  %114 = select i1 %112, float %113, float -1.000000e+00
  %115 = insertelement <4 x float> poison, float %114, i64 0
  %116 = or disjoint i32 %11, 1
  %117 = udiv i32 %116, 165
  %118 = mul i32 %117, 165
  %.decomposed7 = sub i32 %116, %118
  %119 = shl nuw nsw i32 %117, 1
  %120 = zext nneg i32 %119 to i64
  %121 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %120
  %122 = getelementptr inbounds i8, ptr addrspace(1) %121, i64 49152
  %123 = load <2 x i32>, ptr addrspace(1) %122, align 8, !invariant.load !4
  %124 = extractelement <2 x i32> %123, i32 0
  %125 = extractelement <2 x i32> %123, i32 1
  %126 = add i32 %125, %.decomposed7
  %127 = tail call i32 @llvm.fshl.i32(i32 %126, i32 %126, i32 13)
  %128 = add i32 %124, %126
  %129 = xor i32 %128, %127
  %130 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 15)
  %131 = add i32 %129, %128
  %132 = xor i32 %131, %130
  %133 = add i32 %132, %131
  %134 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %132, i32 26)
  %135 = xor i32 %133, %134
  %136 = tail call i32 @llvm.fshl.i32(i32 %135, i32 %135, i32 6)
  %137 = add i32 %135, %133
  %138 = xor i32 %137, %136
  %139 = xor i32 %125, %124
  %140 = xor i32 %139, 466688986
  %141 = add i32 %140, 1
  %142 = add i32 %141, %138
  %143 = add i32 %137, %125
  %144 = tail call i32 @llvm.fshl.i32(i32 %142, i32 %142, i32 17)
  %145 = add i32 %143, %142
  %146 = xor i32 %145, %144
  %147 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %146, i32 29)
  %148 = add i32 %146, %145
  %149 = xor i32 %148, %147
  %150 = add i32 %149, %148
  %151 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 16)
  %152 = xor i32 %150, %151
  %153 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %152, i32 24)
  %154 = add i32 %152, %150
  %155 = xor i32 %154, %153
  %156 = add i32 %124, 2
  %157 = add i32 %156, %155
  %158 = add i32 %154, %140
  %159 = tail call i32 @llvm.fshl.i32(i32 %157, i32 %157, i32 13)
  %160 = add i32 %158, %157
  %161 = xor i32 %160, %159
  %162 = tail call i32 @llvm.fshl.i32(i32 %161, i32 %161, i32 15)
  %163 = add i32 %161, %160
  %164 = xor i32 %163, %162
  %165 = add i32 %164, %163
  %166 = tail call i32 @llvm.fshl.i32(i32 %164, i32 %164, i32 26)
  %167 = xor i32 %165, %166
  %168 = tail call i32 @llvm.fshl.i32(i32 %167, i32 %167, i32 6)
  %169 = add i32 %167, %165
  %170 = xor i32 %169, %168
  %171 = add i32 %125, 3
  %172 = add i32 %171, %170
  %173 = add i32 %169, %124
  %174 = tail call i32 @llvm.fshl.i32(i32 %172, i32 %172, i32 17)
  %175 = add i32 %173, %172
  %176 = xor i32 %175, %174
  %177 = tail call i32 @llvm.fshl.i32(i32 %176, i32 %176, i32 29)
  %178 = add i32 %176, %175
  %179 = xor i32 %178, %177
  %180 = add i32 %179, %178
  %181 = tail call i32 @llvm.fshl.i32(i32 %179, i32 %179, i32 16)
  %182 = xor i32 %180, %181
  %183 = tail call i32 @llvm.fshl.i32(i32 %182, i32 %182, i32 24)
  %184 = add i32 %182, %180
  %185 = xor i32 %184, %183
  %186 = add i32 %140, 4
  %187 = add i32 %186, %185
  %188 = add i32 %184, %125
  %189 = tail call i32 @llvm.fshl.i32(i32 %187, i32 %187, i32 13)
  %190 = add i32 %188, %187
  %191 = xor i32 %190, %189
  %192 = tail call i32 @llvm.fshl.i32(i32 %191, i32 %191, i32 15)
  %193 = add i32 %191, %190
  %194 = xor i32 %193, %192
  %195 = add i32 %194, %193
  %196 = tail call i32 @llvm.fshl.i32(i32 %194, i32 %194, i32 26)
  %197 = xor i32 %195, %196
  %198 = tail call i32 @llvm.fshl.i32(i32 %197, i32 %197, i32 6)
  %199 = add i32 %197, %195
  %200 = xor i32 %199, %198
  %201 = add i32 %199, %140
  %202 = add i32 %124, 5
  %203 = add i32 %202, %200
  %204 = xor i32 %203, %201
  %205 = lshr i32 %204, 9
  %206 = or disjoint i32 %205, 1065353216
  %207 = bitcast i32 %206 to float
  %208 = fadd float %207, -1.000000e+00
  %209 = zext nneg i32 %.decomposed7 to i64
  %210 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %209
  %211 = load i8, ptr addrspace(1) %210, align 1, !invariant.load !4
  %.lhs.trunc1 = trunc nuw i32 %.decomposed7 to i8
  %212 = urem i8 %.lhs.trunc1, 15
  %.zext2 = zext nneg i8 %212 to i32
  %213 = add nuw nsw i32 %.zext2, 15
  %214 = trunc i8 %211 to i1
  %215 = select i1 %214, i32 %213, i32 %.zext2
  %216 = add nsw i32 %215, -3
  %217 = icmp ult i32 %216, 9
  %218 = tail call float @llvm.maximum.f32(float %208, float 0.000000e+00)
  %219 = select i1 %217, float %218, float -1.000000e+00
  %220 = insertelement <4 x float> %115, float %219, i64 1
  %221 = or disjoint i32 %11, 2
  %222 = udiv i32 %221, 165
  %223 = mul i32 %222, 165
  %.decomposed8 = sub i32 %221, %223
  %224 = shl nuw nsw i32 %222, 1
  %225 = zext nneg i32 %224 to i64
  %226 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %225
  %227 = getelementptr inbounds i8, ptr addrspace(1) %226, i64 49152
  %228 = load <2 x i32>, ptr addrspace(1) %227, align 8, !invariant.load !4
  %229 = extractelement <2 x i32> %228, i32 0
  %230 = extractelement <2 x i32> %228, i32 1
  %231 = add i32 %230, %.decomposed8
  %232 = tail call i32 @llvm.fshl.i32(i32 %231, i32 %231, i32 13)
  %233 = add i32 %229, %231
  %234 = xor i32 %233, %232
  %235 = tail call i32 @llvm.fshl.i32(i32 %234, i32 %234, i32 15)
  %236 = add i32 %234, %233
  %237 = xor i32 %236, %235
  %238 = add i32 %237, %236
  %239 = tail call i32 @llvm.fshl.i32(i32 %237, i32 %237, i32 26)
  %240 = xor i32 %238, %239
  %241 = tail call i32 @llvm.fshl.i32(i32 %240, i32 %240, i32 6)
  %242 = add i32 %240, %238
  %243 = xor i32 %242, %241
  %244 = xor i32 %230, %229
  %245 = xor i32 %244, 466688986
  %246 = add i32 %245, 1
  %247 = add i32 %246, %243
  %248 = add i32 %242, %230
  %249 = tail call i32 @llvm.fshl.i32(i32 %247, i32 %247, i32 17)
  %250 = add i32 %248, %247
  %251 = xor i32 %250, %249
  %252 = tail call i32 @llvm.fshl.i32(i32 %251, i32 %251, i32 29)
  %253 = add i32 %251, %250
  %254 = xor i32 %253, %252
  %255 = add i32 %254, %253
  %256 = tail call i32 @llvm.fshl.i32(i32 %254, i32 %254, i32 16)
  %257 = xor i32 %255, %256
  %258 = tail call i32 @llvm.fshl.i32(i32 %257, i32 %257, i32 24)
  %259 = add i32 %257, %255
  %260 = xor i32 %259, %258
  %261 = add i32 %229, 2
  %262 = add i32 %261, %260
  %263 = add i32 %259, %245
  %264 = tail call i32 @llvm.fshl.i32(i32 %262, i32 %262, i32 13)
  %265 = add i32 %263, %262
  %266 = xor i32 %265, %264
  %267 = tail call i32 @llvm.fshl.i32(i32 %266, i32 %266, i32 15)
  %268 = add i32 %266, %265
  %269 = xor i32 %268, %267
  %270 = add i32 %269, %268
  %271 = tail call i32 @llvm.fshl.i32(i32 %269, i32 %269, i32 26)
  %272 = xor i32 %270, %271
  %273 = tail call i32 @llvm.fshl.i32(i32 %272, i32 %272, i32 6)
  %274 = add i32 %272, %270
  %275 = xor i32 %274, %273
  %276 = add i32 %230, 3
  %277 = add i32 %276, %275
  %278 = add i32 %274, %229
  %279 = tail call i32 @llvm.fshl.i32(i32 %277, i32 %277, i32 17)
  %280 = add i32 %278, %277
  %281 = xor i32 %280, %279
  %282 = tail call i32 @llvm.fshl.i32(i32 %281, i32 %281, i32 29)
  %283 = add i32 %281, %280
  %284 = xor i32 %283, %282
  %285 = add i32 %284, %283
  %286 = tail call i32 @llvm.fshl.i32(i32 %284, i32 %284, i32 16)
  %287 = xor i32 %285, %286
  %288 = tail call i32 @llvm.fshl.i32(i32 %287, i32 %287, i32 24)
  %289 = add i32 %287, %285
  %290 = xor i32 %289, %288
  %291 = add i32 %245, 4
  %292 = add i32 %291, %290
  %293 = add i32 %289, %230
  %294 = tail call i32 @llvm.fshl.i32(i32 %292, i32 %292, i32 13)
  %295 = add i32 %293, %292
  %296 = xor i32 %295, %294
  %297 = tail call i32 @llvm.fshl.i32(i32 %296, i32 %296, i32 15)
  %298 = add i32 %296, %295
  %299 = xor i32 %298, %297
  %300 = add i32 %299, %298
  %301 = tail call i32 @llvm.fshl.i32(i32 %299, i32 %299, i32 26)
  %302 = xor i32 %300, %301
  %303 = tail call i32 @llvm.fshl.i32(i32 %302, i32 %302, i32 6)
  %304 = add i32 %302, %300
  %305 = xor i32 %304, %303
  %306 = add i32 %304, %245
  %307 = add i32 %229, 5
  %308 = add i32 %307, %305
  %309 = xor i32 %308, %306
  %310 = lshr i32 %309, 9
  %311 = or disjoint i32 %310, 1065353216
  %312 = bitcast i32 %311 to float
  %313 = fadd float %312, -1.000000e+00
  %314 = zext nneg i32 %.decomposed8 to i64
  %315 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %314
  %316 = load i8, ptr addrspace(1) %315, align 1, !invariant.load !4
  %.lhs.trunc3 = trunc nuw i32 %.decomposed8 to i8
  %317 = urem i8 %.lhs.trunc3, 15
  %.zext4 = zext nneg i8 %317 to i32
  %318 = add nuw nsw i32 %.zext4, 15
  %319 = trunc i8 %316 to i1
  %320 = select i1 %319, i32 %318, i32 %.zext4
  %321 = add nsw i32 %320, -3
  %322 = icmp ult i32 %321, 9
  %323 = tail call float @llvm.maximum.f32(float %313, float 0.000000e+00)
  %324 = select i1 %322, float %323, float -1.000000e+00
  %325 = insertelement <4 x float> %220, float %324, i64 2
  %326 = or disjoint i32 %11, 3
  %327 = udiv i32 %326, 165
  %328 = mul i32 %327, 165
  %.decomposed9 = sub i32 %326, %328
  %329 = shl nuw nsw i32 %327, 1
  %330 = zext nneg i32 %329 to i64
  %331 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %330
  %332 = getelementptr inbounds i8, ptr addrspace(1) %331, i64 49152
  %333 = load <2 x i32>, ptr addrspace(1) %332, align 8, !invariant.load !4
  %334 = extractelement <2 x i32> %333, i32 0
  %335 = extractelement <2 x i32> %333, i32 1
  %336 = add i32 %335, %.decomposed9
  %337 = tail call i32 @llvm.fshl.i32(i32 %336, i32 %336, i32 13)
  %338 = add i32 %334, %336
  %339 = xor i32 %338, %337
  %340 = tail call i32 @llvm.fshl.i32(i32 %339, i32 %339, i32 15)
  %341 = add i32 %339, %338
  %342 = xor i32 %341, %340
  %343 = add i32 %342, %341
  %344 = tail call i32 @llvm.fshl.i32(i32 %342, i32 %342, i32 26)
  %345 = xor i32 %343, %344
  %346 = tail call i32 @llvm.fshl.i32(i32 %345, i32 %345, i32 6)
  %347 = add i32 %345, %343
  %348 = xor i32 %347, %346
  %349 = xor i32 %335, %334
  %350 = xor i32 %349, 466688986
  %351 = add i32 %350, 1
  %352 = add i32 %351, %348
  %353 = add i32 %347, %335
  %354 = tail call i32 @llvm.fshl.i32(i32 %352, i32 %352, i32 17)
  %355 = add i32 %353, %352
  %356 = xor i32 %355, %354
  %357 = tail call i32 @llvm.fshl.i32(i32 %356, i32 %356, i32 29)
  %358 = add i32 %356, %355
  %359 = xor i32 %358, %357
  %360 = add i32 %359, %358
  %361 = tail call i32 @llvm.fshl.i32(i32 %359, i32 %359, i32 16)
  %362 = xor i32 %360, %361
  %363 = tail call i32 @llvm.fshl.i32(i32 %362, i32 %362, i32 24)
  %364 = add i32 %362, %360
  %365 = xor i32 %364, %363
  %366 = add i32 %334, 2
  %367 = add i32 %366, %365
  %368 = add i32 %364, %350
  %369 = tail call i32 @llvm.fshl.i32(i32 %367, i32 %367, i32 13)
  %370 = add i32 %368, %367
  %371 = xor i32 %370, %369
  %372 = tail call i32 @llvm.fshl.i32(i32 %371, i32 %371, i32 15)
  %373 = add i32 %371, %370
  %374 = xor i32 %373, %372
  %375 = add i32 %374, %373
  %376 = tail call i32 @llvm.fshl.i32(i32 %374, i32 %374, i32 26)
  %377 = xor i32 %375, %376
  %378 = tail call i32 @llvm.fshl.i32(i32 %377, i32 %377, i32 6)
  %379 = add i32 %377, %375
  %380 = xor i32 %379, %378
  %381 = add i32 %335, 3
  %382 = add i32 %381, %380
  %383 = add i32 %379, %334
  %384 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 17)
  %385 = add i32 %383, %382
  %386 = xor i32 %385, %384
  %387 = tail call i32 @llvm.fshl.i32(i32 %386, i32 %386, i32 29)
  %388 = add i32 %386, %385
  %389 = xor i32 %388, %387
  %390 = add i32 %389, %388
  %391 = tail call i32 @llvm.fshl.i32(i32 %389, i32 %389, i32 16)
  %392 = xor i32 %390, %391
  %393 = tail call i32 @llvm.fshl.i32(i32 %392, i32 %392, i32 24)
  %394 = add i32 %392, %390
  %395 = xor i32 %394, %393
  %396 = add i32 %350, 4
  %397 = add i32 %396, %395
  %398 = add i32 %394, %335
  %399 = tail call i32 @llvm.fshl.i32(i32 %397, i32 %397, i32 13)
  %400 = add i32 %398, %397
  %401 = xor i32 %400, %399
  %402 = tail call i32 @llvm.fshl.i32(i32 %401, i32 %401, i32 15)
  %403 = add i32 %401, %400
  %404 = xor i32 %403, %402
  %405 = add i32 %404, %403
  %406 = tail call i32 @llvm.fshl.i32(i32 %404, i32 %404, i32 26)
  %407 = xor i32 %405, %406
  %408 = tail call i32 @llvm.fshl.i32(i32 %407, i32 %407, i32 6)
  %409 = add i32 %407, %405
  %410 = xor i32 %409, %408
  %411 = add i32 %409, %350
  %412 = add i32 %334, 5
  %413 = add i32 %412, %410
  %414 = xor i32 %413, %411
  %415 = lshr i32 %414, 9
  %416 = or disjoint i32 %415, 1065353216
  %417 = bitcast i32 %416 to float
  %418 = fadd float %417, -1.000000e+00
  %419 = zext nneg i32 %.decomposed9 to i64
  %420 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %419
  %421 = load i8, ptr addrspace(1) %420, align 1, !invariant.load !4
  %.lhs.trunc5 = trunc nuw i32 %.decomposed9 to i8
  %422 = urem i8 %.lhs.trunc5, 15
  %.zext6 = zext nneg i8 %422 to i32
  %423 = add nuw nsw i32 %.zext6, 15
  %424 = trunc i8 %421 to i1
  %425 = select i1 %424, i32 %423, i32 %.zext6
  %426 = add nsw i32 %425, -3
  %427 = icmp ult i32 %426, 9
  %428 = tail call float @llvm.maximum.f32(float %418, float 0.000000e+00)
  %429 = select i1 %427, float %428, float -1.000000e+00
  %430 = insertelement <4 x float> %325, float %429, i64 3
  %431 = zext nneg i32 %11 to i64
  %432 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %431
  store <4 x float> %430, ptr addrspace(1) %432, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @wrapped_iota_2(ptr noalias writeonly align 256 captures(none) dereferenceable(1013760) %0) local_unnamed_addr #3 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %4, 2
  %6 = shl nuw nsw i32 %3, 9
  %7 = or disjoint i32 %5, %6
  %8 = urem i32 %7, 165
  %9 = insertelement <4 x i32> poison, i32 %8, i64 0
  %10 = or disjoint i32 %7, 1
  %11 = urem i32 %10, 165
  %12 = insertelement <4 x i32> %9, i32 %11, i64 1
  %13 = or disjoint i32 %7, 2
  %14 = urem i32 %13, 165
  %15 = insertelement <4 x i32> %12, i32 %14, i64 2
  %16 = or disjoint i32 %7, 3
  %17 = urem i32 %16, 165
  %18 = insertelement <4 x i32> %15, i32 %17, i64 3
  %19 = zext nneg i32 %7 to i64
  %20 = getelementptr inbounds i32, ptr addrspace(1) %2, i64 %19
  store <4 x i32> %18, ptr addrspace(1) %20, align 16
  ret void
}

; Function Attrs: norecurse nounwind
define ptx_kernel void @sort_6_0(ptr noalias align 256 captures(none) dereferenceable(1013760) %arg0, ptr noalias align 256 captures(none) dereferenceable(1013760) %arg1) local_unnamed_addr #7 {
entry:
  %0 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !53
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %4 = shl nuw nsw i32 %2, 7
  %linear_index619 = or disjoint i32 %4, %3
  %linear_index = zext nneg i32 %linear_index619 to i64
  %5 = lshr i64 %linear_index, 7
  %thread.id.x = zext nneg i32 %3 to i64
  %6 = shl nuw nsw i64 %linear_index, 1
  %7 = and i64 %6, 254
  %8 = icmp samesign ult i64 %7, 165
  %9 = shl nuw nsw i64 %thread.id.x, 1
  br i1 %8, label %smaller_keys_index-true, label %smaller_keys_index-after2

sort.6.0.in_bounds-after.critedge:                ; preds = %smaller_keys_index-true536
  %10 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %11 = load i32, ptr addrspace(3) %10, align 8
  %12 = getelementptr inbounds [1536 x [165 x i32]], ptr addrspace(1) %0, i64 0, i64 %5, i64 %7
  store i32 %11, ptr addrspace(1) %12, align 4
  br label %sort.6.0.in_bounds-after

sort.6.0.in_bounds-after:                         ; preds = %sort.6.0.in_bounds-after.critedge, %is_last_tile-after523, %inner_smaller_keys_index-true538
  ret void

smaller_keys_index-after2.critedge:               ; preds = %smaller_keys_index-true
  %13 = getelementptr inbounds [1536 x [165 x i32]], ptr addrspace(1) %0, i64 0, i64 %5, i64 %7
  %14 = load i32, ptr addrspace(1) %13, align 4
  %15 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  store i32 %14, ptr addrspace(3) %15, align 8
  br label %smaller_keys_index-after2

smaller_keys_index-after2:                        ; preds = %entry, %smaller_keys_index-after2.critedge, %inner_smaller_keys_index-true
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %16 = or disjoint i64 %9, 1
  %17 = icmp samesign ult i64 %16, 165
  br i1 %17, label %smaller_comparison_index-true, label %is_last_tile-after

is_last_tile-after:                               ; preds = %smaller_comparison_index-true, %is_smaller_than-true, %smaller_keys_index-after2
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %18 = and i64 %thread.id.x, 1
  %19 = and i64 %9, 252
  %20 = or disjoint i64 %19, %18
  %21 = xor i64 %20, 3
  %22 = icmp samesign ult i64 %20, %21
  %23 = icmp samesign ult i64 %21, 165
  %24 = and i1 %22, %23
  br i1 %24, label %smaller_comparison_index-true14, label %is_last_tile-after13

is_last_tile-after13:                             ; preds = %smaller_comparison_index-true14, %is_smaller_than-true18, %is_last_tile-after
  %25 = icmp ult i64 %16, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %25, label %smaller_comparison_index-true29, label %is_last_tile-after28

is_last_tile-after28:                             ; preds = %smaller_comparison_index-true29, %is_smaller_than-true33, %is_last_tile-after13
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %26 = and i64 %thread.id.x, 3
  %27 = and i64 %9, 248
  %28 = or disjoint i64 %27, %26
  %29 = xor i64 %28, 7
  %30 = icmp samesign ult i64 %28, %29
  %31 = icmp samesign ult i64 %29, 165
  %32 = and i1 %30, %31
  br i1 %32, label %smaller_comparison_index-true44, label %is_last_tile-after43

is_last_tile-after43:                             ; preds = %smaller_comparison_index-true44, %is_smaller_than-true48, %is_last_tile-after28
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %33 = or disjoint i64 %20, 2
  %34 = icmp samesign ult i64 %33, 165
  br i1 %34, label %smaller_comparison_index-true59, label %is_last_tile-after58

is_last_tile-after58:                             ; preds = %smaller_comparison_index-true59, %is_smaller_than-true63, %is_last_tile-after43
  %35 = icmp ult i64 %16, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %35, label %smaller_comparison_index-true74, label %is_last_tile-after73

is_last_tile-after73:                             ; preds = %smaller_comparison_index-true74, %is_smaller_than-true78, %is_last_tile-after58
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %36 = and i64 %thread.id.x, 7
  %37 = and i64 %9, 240
  %38 = or disjoint i64 %37, %36
  %39 = xor i64 %38, 15
  %40 = icmp samesign ult i64 %38, %39
  %41 = icmp samesign ult i64 %39, 165
  %42 = and i1 %40, %41
  br i1 %42, label %smaller_comparison_index-true89, label %is_last_tile-after88

is_last_tile-after88:                             ; preds = %smaller_comparison_index-true89, %is_smaller_than-true93, %is_last_tile-after73
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %43 = or disjoint i64 %28, 4
  %44 = icmp samesign ult i64 %43, 165
  br i1 %44, label %smaller_comparison_index-true104, label %is_last_tile-after103

is_last_tile-after103:                            ; preds = %smaller_comparison_index-true104, %is_smaller_than-true108, %is_last_tile-after88
  %45 = icmp ult i64 %33, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %45, label %smaller_comparison_index-true119, label %is_last_tile-after118

is_last_tile-after118:                            ; preds = %smaller_comparison_index-true119, %is_smaller_than-true123, %is_last_tile-after103
  %46 = icmp ult i64 %16, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %46, label %smaller_comparison_index-true134, label %is_last_tile-after133

is_last_tile-after133:                            ; preds = %smaller_comparison_index-true134, %is_smaller_than-true138, %is_last_tile-after118
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %47 = and i64 %thread.id.x, 15
  %48 = and i64 %9, 224
  %49 = or disjoint i64 %48, %47
  %50 = xor i64 %49, 31
  %51 = icmp samesign ult i64 %49, %50
  %52 = icmp samesign ult i64 %50, 165
  %53 = and i1 %51, %52
  br i1 %53, label %smaller_comparison_index-true149, label %is_last_tile-after148

is_last_tile-after148:                            ; preds = %smaller_comparison_index-true149, %is_smaller_than-true153, %is_last_tile-after133
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %54 = or disjoint i64 %38, 8
  %55 = icmp samesign ult i64 %54, 165
  br i1 %55, label %smaller_comparison_index-true164, label %is_last_tile-after163

is_last_tile-after163:                            ; preds = %smaller_comparison_index-true164, %is_smaller_than-true168, %is_last_tile-after148
  %56 = icmp ult i64 %43, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %56, label %smaller_comparison_index-true179, label %is_last_tile-after178

is_last_tile-after178:                            ; preds = %smaller_comparison_index-true179, %is_smaller_than-true183, %is_last_tile-after163
  %57 = icmp ult i64 %33, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %57, label %smaller_comparison_index-true194, label %is_last_tile-after193

is_last_tile-after193:                            ; preds = %smaller_comparison_index-true194, %is_smaller_than-true198, %is_last_tile-after178
  %58 = icmp ult i64 %16, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %58, label %smaller_comparison_index-true209, label %is_last_tile-after208

is_last_tile-after208:                            ; preds = %smaller_comparison_index-true209, %is_smaller_than-true213, %is_last_tile-after193
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %59 = and i64 %thread.id.x, 31
  %60 = and i64 %9, 192
  %61 = or disjoint i64 %60, %59
  %62 = xor i64 %61, 63
  %63 = icmp samesign ult i64 %61, %62
  %64 = icmp samesign ult i64 %62, 165
  %65 = and i1 %63, %64
  br i1 %65, label %smaller_comparison_index-true224, label %is_last_tile-after223

is_last_tile-after223:                            ; preds = %smaller_comparison_index-true224, %is_smaller_than-true228, %is_last_tile-after208
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %66 = or disjoint i64 %49, 16
  %67 = icmp samesign ult i64 %66, 165
  br i1 %67, label %smaller_comparison_index-true239, label %is_last_tile-after238

is_last_tile-after238:                            ; preds = %smaller_comparison_index-true239, %is_smaller_than-true243, %is_last_tile-after223
  %68 = icmp ult i64 %54, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %68, label %smaller_comparison_index-true254, label %is_last_tile-after253

is_last_tile-after253:                            ; preds = %smaller_comparison_index-true254, %is_smaller_than-true258, %is_last_tile-after238
  %69 = icmp ult i64 %43, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %69, label %smaller_comparison_index-true269, label %is_last_tile-after268

is_last_tile-after268:                            ; preds = %smaller_comparison_index-true269, %is_smaller_than-true273, %is_last_tile-after253
  %70 = icmp ult i64 %33, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %70, label %smaller_comparison_index-true284, label %is_last_tile-after283

is_last_tile-after283:                            ; preds = %smaller_comparison_index-true284, %is_smaller_than-true288, %is_last_tile-after268
  %71 = icmp ult i64 %16, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %71, label %smaller_comparison_index-true299, label %is_last_tile-after298

is_last_tile-after298:                            ; preds = %smaller_comparison_index-true299, %is_smaller_than-true303, %is_last_tile-after283
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %72 = and i64 %thread.id.x, 63
  %73 = and i64 %9, 128
  %74 = or disjoint i64 %73, %72
  %75 = xor i64 %74, 127
  %76 = icmp samesign ult i64 %74, %75
  %77 = icmp samesign ult i64 %75, 165
  %78 = and i1 %76, %77
  br i1 %78, label %smaller_comparison_index-true314, label %is_last_tile-after313

is_last_tile-after313:                            ; preds = %smaller_comparison_index-true314, %is_smaller_than-true318, %is_last_tile-after298
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %79 = or disjoint i64 %61, 32
  %80 = icmp samesign ult i64 %79, 165
  br i1 %80, label %smaller_comparison_index-true329, label %is_last_tile-after328

is_last_tile-after328:                            ; preds = %smaller_comparison_index-true329, %is_smaller_than-true333, %is_last_tile-after313
  %81 = icmp ult i64 %66, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %81, label %smaller_comparison_index-true344, label %is_last_tile-after343

is_last_tile-after343:                            ; preds = %smaller_comparison_index-true344, %is_smaller_than-true348, %is_last_tile-after328
  %82 = icmp ult i64 %54, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %82, label %smaller_comparison_index-true359, label %is_last_tile-after358

is_last_tile-after358:                            ; preds = %smaller_comparison_index-true359, %is_smaller_than-true363, %is_last_tile-after343
  %83 = icmp ult i64 %43, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %83, label %smaller_comparison_index-true374, label %is_last_tile-after373

is_last_tile-after373:                            ; preds = %smaller_comparison_index-true374, %is_smaller_than-true378, %is_last_tile-after358
  %84 = icmp ult i64 %33, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %84, label %smaller_comparison_index-true389, label %is_last_tile-after388

is_last_tile-after388:                            ; preds = %smaller_comparison_index-true389, %is_smaller_than-true393, %is_last_tile-after373
  %85 = icmp ult i64 %16, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %85, label %smaller_comparison_index-true404, label %is_last_tile-after403

is_last_tile-after403:                            ; preds = %smaller_comparison_index-true404, %is_smaller_than-true408, %is_last_tile-after388
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %86 = xor i64 %thread.id.x, 255
  %87 = icmp samesign ult i64 %86, 165
  br i1 %87, label %smaller_comparison_index-true419, label %is_last_tile-after418

is_last_tile-after418:                            ; preds = %smaller_comparison_index-true419, %is_smaller_than-true423, %is_last_tile-after403
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %88 = or disjoint i64 %74, 64
  %89 = icmp samesign ult i64 %88, 165
  br i1 %89, label %smaller_comparison_index-true434, label %is_last_tile-after433

is_last_tile-after433:                            ; preds = %smaller_comparison_index-true434, %is_smaller_than-true438, %is_last_tile-after418
  %90 = icmp ult i64 %79, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %90, label %smaller_comparison_index-true449, label %is_last_tile-after448

is_last_tile-after448:                            ; preds = %smaller_comparison_index-true449, %is_smaller_than-true453, %is_last_tile-after433
  %91 = icmp ult i64 %66, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %91, label %smaller_comparison_index-true464, label %is_last_tile-after463

is_last_tile-after463:                            ; preds = %smaller_comparison_index-true464, %is_smaller_than-true468, %is_last_tile-after448
  %92 = icmp ult i64 %54, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %92, label %smaller_comparison_index-true479, label %is_last_tile-after478

is_last_tile-after478:                            ; preds = %smaller_comparison_index-true479, %is_smaller_than-true483, %is_last_tile-after463
  %93 = icmp ult i64 %43, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %93, label %smaller_comparison_index-true494, label %is_last_tile-after493

is_last_tile-after493:                            ; preds = %smaller_comparison_index-true494, %is_smaller_than-true498, %is_last_tile-after478
  %94 = icmp ult i64 %33, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %94, label %smaller_comparison_index-true509, label %is_last_tile-after508

is_last_tile-after508:                            ; preds = %smaller_comparison_index-true509, %is_smaller_than-true513, %is_last_tile-after493
  %95 = icmp ult i64 %16, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %95, label %smaller_comparison_index-true524, label %is_last_tile-after523

is_last_tile-after523:                            ; preds = %smaller_comparison_index-true524, %is_smaller_than-true528, %is_last_tile-after508
  %96 = icmp ult i64 %7, 165
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  br i1 %96, label %smaller_keys_index-true536, label %sort.6.0.in_bounds-after

smaller_keys_index-true:                          ; preds = %entry
  %97 = getelementptr inbounds [1536 x [165 x float]], ptr addrspace(1) %1, i64 0, i64 %5, i64 %7
  %98 = load float, ptr addrspace(1) %97, align 4
  %99 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  store float %98, ptr addrspace(3) %99, align 8
  %100 = or disjoint i64 %7, 1
  %101 = icmp samesign ult i64 %100, 165
  br i1 %101, label %inner_smaller_keys_index-true, label %smaller_keys_index-after2.critedge

inner_smaller_keys_index-true:                    ; preds = %smaller_keys_index-true
  %102 = getelementptr i8, ptr addrspace(3) %99, i64 4
  %103 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 4
  %104 = load float, ptr addrspace(1) %103, align 4
  store float %104, ptr addrspace(3) %102, align 4
  %105 = getelementptr inbounds [1536 x [165 x i32]], ptr addrspace(1) %0, i64 0, i64 %5, i64 %7
  %106 = load i32, ptr addrspace(1) %105, align 4
  %107 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %108 = getelementptr inbounds i8, ptr addrspace(1) %105, i64 4
  %109 = load i32, ptr addrspace(1) %108, align 4
  %110 = insertelement <2 x i32> poison, i32 %106, i32 0
  %111 = insertelement <2 x i32> %110, i32 %109, i32 1
  store <2 x i32> %111, ptr addrspace(3) %107, align 8
  br label %smaller_keys_index-after2

smaller_comparison_index-true:                    ; preds = %smaller_keys_index-after2
  %112 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %113 = getelementptr i8, ptr addrspace(3) %112, i64 4
  %114 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %115 = getelementptr i8, ptr addrspace(3) %114, i64 4
  %.val759 = load float, ptr addrspace(3) %113, align 4
  %.val760 = load float, ptr addrspace(3) %112, align 4
  %.val761 = load i32, ptr addrspace(3) %115, align 4
  %.val762 = load i32, ptr addrspace(3) %114, align 4
  %compare.132.0.i = fcmp uno float %.val759, 0.000000e+00
  %compare.131.0.i = fcmp oeq float %.val759, 0.000000e+00
  %116 = select i1 %compare.131.0.i, float 0.000000e+00, float %.val759
  %117 = select i1 %compare.132.0.i, float 0x7FF8000000000000, float %116
  %118 = bitcast float %117 to i32
  %119 = icmp slt i32 %118, 0
  %120 = xor i32 %118, 2147483647
  %121 = select i1 %119, i32 %120, i32 %118
  %compare.134.0.i = fcmp uno float %.val760, 0.000000e+00
  %compare.133.0.i = fcmp oeq float %.val760, 0.000000e+00
  %122 = select i1 %compare.133.0.i, float 0.000000e+00, float %.val760
  %123 = select i1 %compare.134.0.i, float 0x7FF8000000000000, float %122
  %124 = bitcast float %123 to i32
  %125 = icmp slt i32 %124, 0
  %126 = xor i32 %124, 2147483647
  %127 = select i1 %125, i32 %126, i32 %124
  %128 = icmp sge i32 %121, %127
  %.not.i = icmp eq i32 %127, %121
  %129 = icmp sge i32 %.val761, %.val762
  %.v.i = select i1 %.not.i, i1 %129, i1 %128
  br i1 %.v.i, label %is_last_tile-after, label %is_smaller_than-true

is_smaller_than-true:                             ; preds = %smaller_comparison_index-true
  %130 = insertelement <2 x float> poison, float %.val759, i32 0
  %131 = insertelement <2 x float> %130, float %.val760, i32 1
  store <2 x float> %131, ptr addrspace(3) %112, align 8
  %132 = insertelement <2 x i32> poison, i32 %.val761, i32 0
  %133 = insertelement <2 x i32> %132, i32 %.val762, i32 1
  store <2 x i32> %133, ptr addrspace(3) %114, align 8
  br label %is_last_tile-after

smaller_comparison_index-true14:                  ; preds = %is_last_tile-after
  %134 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %21
  %135 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %20
  %136 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %21
  %137 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %20
  %.val755 = load float, ptr addrspace(3) %134, align 4
  %.val756 = load float, ptr addrspace(3) %135, align 4
  %.val757 = load i32, ptr addrspace(3) %136, align 4
  %.val758 = load i32, ptr addrspace(3) %137, align 4
  %compare.132.0.i763 = fcmp uno float %.val755, 0.000000e+00
  %compare.131.0.i764 = fcmp oeq float %.val755, 0.000000e+00
  %138 = select i1 %compare.131.0.i764, float 0.000000e+00, float %.val755
  %139 = select i1 %compare.132.0.i763, float 0x7FF8000000000000, float %138
  %140 = bitcast float %139 to i32
  %141 = icmp slt i32 %140, 0
  %142 = xor i32 %140, 2147483647
  %143 = select i1 %141, i32 %142, i32 %140
  %compare.134.0.i765 = fcmp uno float %.val756, 0.000000e+00
  %compare.133.0.i766 = fcmp oeq float %.val756, 0.000000e+00
  %144 = select i1 %compare.133.0.i766, float 0.000000e+00, float %.val756
  %145 = select i1 %compare.134.0.i765, float 0x7FF8000000000000, float %144
  %146 = bitcast float %145 to i32
  %147 = icmp slt i32 %146, 0
  %148 = xor i32 %146, 2147483647
  %149 = select i1 %147, i32 %148, i32 %146
  %150 = icmp sge i32 %143, %149
  %.not.i767 = icmp eq i32 %149, %143
  %151 = icmp sge i32 %.val757, %.val758
  %.v.i768 = select i1 %.not.i767, i1 %151, i1 %150
  br i1 %.v.i768, label %is_last_tile-after13, label %is_smaller_than-true18

is_smaller_than-true18:                           ; preds = %smaller_comparison_index-true14
  store float %.val755, ptr addrspace(3) %135, align 4
  store float %.val756, ptr addrspace(3) %134, align 4
  store i32 %.val757, ptr addrspace(3) %137, align 4
  store i32 %.val758, ptr addrspace(3) %136, align 4
  br label %is_last_tile-after13

smaller_comparison_index-true29:                  ; preds = %is_last_tile-after13
  %152 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %153 = getelementptr i8, ptr addrspace(3) %152, i64 4
  %154 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %155 = getelementptr i8, ptr addrspace(3) %154, i64 4
  %.val751 = load float, ptr addrspace(3) %153, align 4
  %.val752 = load float, ptr addrspace(3) %152, align 4
  %.val753 = load i32, ptr addrspace(3) %155, align 4
  %.val754 = load i32, ptr addrspace(3) %154, align 4
  %compare.132.0.i769 = fcmp uno float %.val751, 0.000000e+00
  %compare.131.0.i770 = fcmp oeq float %.val751, 0.000000e+00
  %156 = select i1 %compare.131.0.i770, float 0.000000e+00, float %.val751
  %157 = select i1 %compare.132.0.i769, float 0x7FF8000000000000, float %156
  %158 = bitcast float %157 to i32
  %159 = icmp slt i32 %158, 0
  %160 = xor i32 %158, 2147483647
  %161 = select i1 %159, i32 %160, i32 %158
  %compare.134.0.i771 = fcmp uno float %.val752, 0.000000e+00
  %compare.133.0.i772 = fcmp oeq float %.val752, 0.000000e+00
  %162 = select i1 %compare.133.0.i772, float 0.000000e+00, float %.val752
  %163 = select i1 %compare.134.0.i771, float 0x7FF8000000000000, float %162
  %164 = bitcast float %163 to i32
  %165 = icmp slt i32 %164, 0
  %166 = xor i32 %164, 2147483647
  %167 = select i1 %165, i32 %166, i32 %164
  %168 = icmp sge i32 %161, %167
  %.not.i773 = icmp eq i32 %167, %161
  %169 = icmp sge i32 %.val753, %.val754
  %.v.i774 = select i1 %.not.i773, i1 %169, i1 %168
  br i1 %.v.i774, label %is_last_tile-after28, label %is_smaller_than-true33

is_smaller_than-true33:                           ; preds = %smaller_comparison_index-true29
  %170 = insertelement <2 x float> poison, float %.val751, i32 0
  %171 = insertelement <2 x float> %170, float %.val752, i32 1
  store <2 x float> %171, ptr addrspace(3) %152, align 8
  %172 = insertelement <2 x i32> poison, i32 %.val753, i32 0
  %173 = insertelement <2 x i32> %172, i32 %.val754, i32 1
  store <2 x i32> %173, ptr addrspace(3) %154, align 8
  br label %is_last_tile-after28

smaller_comparison_index-true44:                  ; preds = %is_last_tile-after28
  %174 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %29
  %175 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %28
  %176 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %29
  %177 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %28
  %.val747 = load float, ptr addrspace(3) %174, align 4
  %.val748 = load float, ptr addrspace(3) %175, align 4
  %.val749 = load i32, ptr addrspace(3) %176, align 4
  %.val750 = load i32, ptr addrspace(3) %177, align 4
  %compare.132.0.i775 = fcmp uno float %.val747, 0.000000e+00
  %compare.131.0.i776 = fcmp oeq float %.val747, 0.000000e+00
  %178 = select i1 %compare.131.0.i776, float 0.000000e+00, float %.val747
  %179 = select i1 %compare.132.0.i775, float 0x7FF8000000000000, float %178
  %180 = bitcast float %179 to i32
  %181 = icmp slt i32 %180, 0
  %182 = xor i32 %180, 2147483647
  %183 = select i1 %181, i32 %182, i32 %180
  %compare.134.0.i777 = fcmp uno float %.val748, 0.000000e+00
  %compare.133.0.i778 = fcmp oeq float %.val748, 0.000000e+00
  %184 = select i1 %compare.133.0.i778, float 0.000000e+00, float %.val748
  %185 = select i1 %compare.134.0.i777, float 0x7FF8000000000000, float %184
  %186 = bitcast float %185 to i32
  %187 = icmp slt i32 %186, 0
  %188 = xor i32 %186, 2147483647
  %189 = select i1 %187, i32 %188, i32 %186
  %190 = icmp sge i32 %183, %189
  %.not.i779 = icmp eq i32 %189, %183
  %191 = icmp sge i32 %.val749, %.val750
  %.v.i780 = select i1 %.not.i779, i1 %191, i1 %190
  br i1 %.v.i780, label %is_last_tile-after43, label %is_smaller_than-true48

is_smaller_than-true48:                           ; preds = %smaller_comparison_index-true44
  store float %.val747, ptr addrspace(3) %175, align 4
  store float %.val748, ptr addrspace(3) %174, align 4
  store i32 %.val749, ptr addrspace(3) %177, align 4
  store i32 %.val750, ptr addrspace(3) %176, align 4
  br label %is_last_tile-after43

smaller_comparison_index-true59:                  ; preds = %is_last_tile-after43
  %192 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %20
  %193 = getelementptr i8, ptr addrspace(3) %192, i64 8
  %194 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %20
  %195 = getelementptr i8, ptr addrspace(3) %194, i64 8
  %.val743 = load float, ptr addrspace(3) %193, align 4
  %.val744 = load float, ptr addrspace(3) %192, align 4
  %.val745 = load i32, ptr addrspace(3) %195, align 4
  %.val746 = load i32, ptr addrspace(3) %194, align 4
  %compare.132.0.i781 = fcmp uno float %.val743, 0.000000e+00
  %compare.131.0.i782 = fcmp oeq float %.val743, 0.000000e+00
  %196 = select i1 %compare.131.0.i782, float 0.000000e+00, float %.val743
  %197 = select i1 %compare.132.0.i781, float 0x7FF8000000000000, float %196
  %198 = bitcast float %197 to i32
  %199 = icmp slt i32 %198, 0
  %200 = xor i32 %198, 2147483647
  %201 = select i1 %199, i32 %200, i32 %198
  %compare.134.0.i783 = fcmp uno float %.val744, 0.000000e+00
  %compare.133.0.i784 = fcmp oeq float %.val744, 0.000000e+00
  %202 = select i1 %compare.133.0.i784, float 0.000000e+00, float %.val744
  %203 = select i1 %compare.134.0.i783, float 0x7FF8000000000000, float %202
  %204 = bitcast float %203 to i32
  %205 = icmp slt i32 %204, 0
  %206 = xor i32 %204, 2147483647
  %207 = select i1 %205, i32 %206, i32 %204
  %208 = icmp sge i32 %201, %207
  %.not.i785 = icmp eq i32 %207, %201
  %209 = icmp sge i32 %.val745, %.val746
  %.v.i786 = select i1 %.not.i785, i1 %209, i1 %208
  br i1 %.v.i786, label %is_last_tile-after58, label %is_smaller_than-true63

is_smaller_than-true63:                           ; preds = %smaller_comparison_index-true59
  store float %.val743, ptr addrspace(3) %192, align 4
  %sunkaddr = getelementptr i8, ptr addrspace(3) %192, i64 8
  store float %.val744, ptr addrspace(3) %sunkaddr, align 4
  store i32 %.val745, ptr addrspace(3) %194, align 4
  %sunkaddr973 = getelementptr i8, ptr addrspace(3) %194, i64 8
  store i32 %.val746, ptr addrspace(3) %sunkaddr973, align 4
  br label %is_last_tile-after58

smaller_comparison_index-true74:                  ; preds = %is_last_tile-after58
  %210 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %211 = getelementptr i8, ptr addrspace(3) %210, i64 4
  %212 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %213 = getelementptr i8, ptr addrspace(3) %212, i64 4
  %.val739 = load float, ptr addrspace(3) %211, align 4
  %.val740 = load float, ptr addrspace(3) %210, align 4
  %.val741 = load i32, ptr addrspace(3) %213, align 4
  %.val742 = load i32, ptr addrspace(3) %212, align 4
  %compare.132.0.i787 = fcmp uno float %.val739, 0.000000e+00
  %compare.131.0.i788 = fcmp oeq float %.val739, 0.000000e+00
  %214 = select i1 %compare.131.0.i788, float 0.000000e+00, float %.val739
  %215 = select i1 %compare.132.0.i787, float 0x7FF8000000000000, float %214
  %216 = bitcast float %215 to i32
  %217 = icmp slt i32 %216, 0
  %218 = xor i32 %216, 2147483647
  %219 = select i1 %217, i32 %218, i32 %216
  %compare.134.0.i789 = fcmp uno float %.val740, 0.000000e+00
  %compare.133.0.i790 = fcmp oeq float %.val740, 0.000000e+00
  %220 = select i1 %compare.133.0.i790, float 0.000000e+00, float %.val740
  %221 = select i1 %compare.134.0.i789, float 0x7FF8000000000000, float %220
  %222 = bitcast float %221 to i32
  %223 = icmp slt i32 %222, 0
  %224 = xor i32 %222, 2147483647
  %225 = select i1 %223, i32 %224, i32 %222
  %226 = icmp sge i32 %219, %225
  %.not.i791 = icmp eq i32 %225, %219
  %227 = icmp sge i32 %.val741, %.val742
  %.v.i792 = select i1 %.not.i791, i1 %227, i1 %226
  br i1 %.v.i792, label %is_last_tile-after73, label %is_smaller_than-true78

is_smaller_than-true78:                           ; preds = %smaller_comparison_index-true74
  %228 = insertelement <2 x float> poison, float %.val739, i32 0
  %229 = insertelement <2 x float> %228, float %.val740, i32 1
  store <2 x float> %229, ptr addrspace(3) %210, align 8
  %230 = insertelement <2 x i32> poison, i32 %.val741, i32 0
  %231 = insertelement <2 x i32> %230, i32 %.val742, i32 1
  store <2 x i32> %231, ptr addrspace(3) %212, align 8
  br label %is_last_tile-after73

smaller_comparison_index-true89:                  ; preds = %is_last_tile-after73
  %232 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %39
  %233 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %38
  %234 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %39
  %235 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %38
  %.val735 = load float, ptr addrspace(3) %232, align 4
  %.val736 = load float, ptr addrspace(3) %233, align 4
  %.val737 = load i32, ptr addrspace(3) %234, align 4
  %.val738 = load i32, ptr addrspace(3) %235, align 4
  %compare.132.0.i793 = fcmp uno float %.val735, 0.000000e+00
  %compare.131.0.i794 = fcmp oeq float %.val735, 0.000000e+00
  %236 = select i1 %compare.131.0.i794, float 0.000000e+00, float %.val735
  %237 = select i1 %compare.132.0.i793, float 0x7FF8000000000000, float %236
  %238 = bitcast float %237 to i32
  %239 = icmp slt i32 %238, 0
  %240 = xor i32 %238, 2147483647
  %241 = select i1 %239, i32 %240, i32 %238
  %compare.134.0.i795 = fcmp uno float %.val736, 0.000000e+00
  %compare.133.0.i796 = fcmp oeq float %.val736, 0.000000e+00
  %242 = select i1 %compare.133.0.i796, float 0.000000e+00, float %.val736
  %243 = select i1 %compare.134.0.i795, float 0x7FF8000000000000, float %242
  %244 = bitcast float %243 to i32
  %245 = icmp slt i32 %244, 0
  %246 = xor i32 %244, 2147483647
  %247 = select i1 %245, i32 %246, i32 %244
  %248 = icmp sge i32 %241, %247
  %.not.i797 = icmp eq i32 %247, %241
  %249 = icmp sge i32 %.val737, %.val738
  %.v.i798 = select i1 %.not.i797, i1 %249, i1 %248
  br i1 %.v.i798, label %is_last_tile-after88, label %is_smaller_than-true93

is_smaller_than-true93:                           ; preds = %smaller_comparison_index-true89
  store float %.val735, ptr addrspace(3) %233, align 4
  store float %.val736, ptr addrspace(3) %232, align 4
  store i32 %.val737, ptr addrspace(3) %235, align 4
  store i32 %.val738, ptr addrspace(3) %234, align 4
  br label %is_last_tile-after88

smaller_comparison_index-true104:                 ; preds = %is_last_tile-after88
  %250 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %28
  %251 = getelementptr i8, ptr addrspace(3) %250, i64 16
  %252 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %28
  %253 = getelementptr i8, ptr addrspace(3) %252, i64 16
  %.val731 = load float, ptr addrspace(3) %251, align 4
  %.val732 = load float, ptr addrspace(3) %250, align 4
  %.val733 = load i32, ptr addrspace(3) %253, align 4
  %.val734 = load i32, ptr addrspace(3) %252, align 4
  %compare.132.0.i799 = fcmp uno float %.val731, 0.000000e+00
  %compare.131.0.i800 = fcmp oeq float %.val731, 0.000000e+00
  %254 = select i1 %compare.131.0.i800, float 0.000000e+00, float %.val731
  %255 = select i1 %compare.132.0.i799, float 0x7FF8000000000000, float %254
  %256 = bitcast float %255 to i32
  %257 = icmp slt i32 %256, 0
  %258 = xor i32 %256, 2147483647
  %259 = select i1 %257, i32 %258, i32 %256
  %compare.134.0.i801 = fcmp uno float %.val732, 0.000000e+00
  %compare.133.0.i802 = fcmp oeq float %.val732, 0.000000e+00
  %260 = select i1 %compare.133.0.i802, float 0.000000e+00, float %.val732
  %261 = select i1 %compare.134.0.i801, float 0x7FF8000000000000, float %260
  %262 = bitcast float %261 to i32
  %263 = icmp slt i32 %262, 0
  %264 = xor i32 %262, 2147483647
  %265 = select i1 %263, i32 %264, i32 %262
  %266 = icmp sge i32 %259, %265
  %.not.i803 = icmp eq i32 %265, %259
  %267 = icmp sge i32 %.val733, %.val734
  %.v.i804 = select i1 %.not.i803, i1 %267, i1 %266
  br i1 %.v.i804, label %is_last_tile-after103, label %is_smaller_than-true108

is_smaller_than-true108:                          ; preds = %smaller_comparison_index-true104
  store float %.val731, ptr addrspace(3) %250, align 4
  %sunkaddr974 = getelementptr i8, ptr addrspace(3) %250, i64 16
  store float %.val732, ptr addrspace(3) %sunkaddr974, align 4
  store i32 %.val733, ptr addrspace(3) %252, align 4
  %sunkaddr975 = getelementptr i8, ptr addrspace(3) %252, i64 16
  store i32 %.val734, ptr addrspace(3) %sunkaddr975, align 4
  br label %is_last_tile-after103

smaller_comparison_index-true119:                 ; preds = %is_last_tile-after103
  %268 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %20
  %269 = getelementptr i8, ptr addrspace(3) %268, i64 8
  %270 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %20
  %271 = getelementptr i8, ptr addrspace(3) %270, i64 8
  %.val727 = load float, ptr addrspace(3) %269, align 4
  %.val728 = load float, ptr addrspace(3) %268, align 4
  %.val729 = load i32, ptr addrspace(3) %271, align 4
  %.val730 = load i32, ptr addrspace(3) %270, align 4
  %compare.132.0.i805 = fcmp uno float %.val727, 0.000000e+00
  %compare.131.0.i806 = fcmp oeq float %.val727, 0.000000e+00
  %272 = select i1 %compare.131.0.i806, float 0.000000e+00, float %.val727
  %273 = select i1 %compare.132.0.i805, float 0x7FF8000000000000, float %272
  %274 = bitcast float %273 to i32
  %275 = icmp slt i32 %274, 0
  %276 = xor i32 %274, 2147483647
  %277 = select i1 %275, i32 %276, i32 %274
  %compare.134.0.i807 = fcmp uno float %.val728, 0.000000e+00
  %compare.133.0.i808 = fcmp oeq float %.val728, 0.000000e+00
  %278 = select i1 %compare.133.0.i808, float 0.000000e+00, float %.val728
  %279 = select i1 %compare.134.0.i807, float 0x7FF8000000000000, float %278
  %280 = bitcast float %279 to i32
  %281 = icmp slt i32 %280, 0
  %282 = xor i32 %280, 2147483647
  %283 = select i1 %281, i32 %282, i32 %280
  %284 = icmp sge i32 %277, %283
  %.not.i809 = icmp eq i32 %283, %277
  %285 = icmp sge i32 %.val729, %.val730
  %.v.i810 = select i1 %.not.i809, i1 %285, i1 %284
  br i1 %.v.i810, label %is_last_tile-after118, label %is_smaller_than-true123

is_smaller_than-true123:                          ; preds = %smaller_comparison_index-true119
  store float %.val727, ptr addrspace(3) %268, align 4
  %sunkaddr976 = getelementptr i8, ptr addrspace(3) %268, i64 8
  store float %.val728, ptr addrspace(3) %sunkaddr976, align 4
  store i32 %.val729, ptr addrspace(3) %270, align 4
  %sunkaddr977 = getelementptr i8, ptr addrspace(3) %270, i64 8
  store i32 %.val730, ptr addrspace(3) %sunkaddr977, align 4
  br label %is_last_tile-after118

smaller_comparison_index-true134:                 ; preds = %is_last_tile-after118
  %286 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %287 = getelementptr i8, ptr addrspace(3) %286, i64 4
  %288 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %289 = getelementptr i8, ptr addrspace(3) %288, i64 4
  %.val723 = load float, ptr addrspace(3) %287, align 4
  %.val724 = load float, ptr addrspace(3) %286, align 4
  %.val725 = load i32, ptr addrspace(3) %289, align 4
  %.val726 = load i32, ptr addrspace(3) %288, align 4
  %compare.132.0.i811 = fcmp uno float %.val723, 0.000000e+00
  %compare.131.0.i812 = fcmp oeq float %.val723, 0.000000e+00
  %290 = select i1 %compare.131.0.i812, float 0.000000e+00, float %.val723
  %291 = select i1 %compare.132.0.i811, float 0x7FF8000000000000, float %290
  %292 = bitcast float %291 to i32
  %293 = icmp slt i32 %292, 0
  %294 = xor i32 %292, 2147483647
  %295 = select i1 %293, i32 %294, i32 %292
  %compare.134.0.i813 = fcmp uno float %.val724, 0.000000e+00
  %compare.133.0.i814 = fcmp oeq float %.val724, 0.000000e+00
  %296 = select i1 %compare.133.0.i814, float 0.000000e+00, float %.val724
  %297 = select i1 %compare.134.0.i813, float 0x7FF8000000000000, float %296
  %298 = bitcast float %297 to i32
  %299 = icmp slt i32 %298, 0
  %300 = xor i32 %298, 2147483647
  %301 = select i1 %299, i32 %300, i32 %298
  %302 = icmp sge i32 %295, %301
  %.not.i815 = icmp eq i32 %301, %295
  %303 = icmp sge i32 %.val725, %.val726
  %.v.i816 = select i1 %.not.i815, i1 %303, i1 %302
  br i1 %.v.i816, label %is_last_tile-after133, label %is_smaller_than-true138

is_smaller_than-true138:                          ; preds = %smaller_comparison_index-true134
  %304 = insertelement <2 x float> poison, float %.val723, i32 0
  %305 = insertelement <2 x float> %304, float %.val724, i32 1
  store <2 x float> %305, ptr addrspace(3) %286, align 8
  %306 = insertelement <2 x i32> poison, i32 %.val725, i32 0
  %307 = insertelement <2 x i32> %306, i32 %.val726, i32 1
  store <2 x i32> %307, ptr addrspace(3) %288, align 8
  br label %is_last_tile-after133

smaller_comparison_index-true149:                 ; preds = %is_last_tile-after133
  %308 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %50
  %309 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %49
  %310 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %50
  %311 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %49
  %.val719 = load float, ptr addrspace(3) %308, align 4
  %.val720 = load float, ptr addrspace(3) %309, align 4
  %.val721 = load i32, ptr addrspace(3) %310, align 4
  %.val722 = load i32, ptr addrspace(3) %311, align 4
  %compare.132.0.i817 = fcmp uno float %.val719, 0.000000e+00
  %compare.131.0.i818 = fcmp oeq float %.val719, 0.000000e+00
  %312 = select i1 %compare.131.0.i818, float 0.000000e+00, float %.val719
  %313 = select i1 %compare.132.0.i817, float 0x7FF8000000000000, float %312
  %314 = bitcast float %313 to i32
  %315 = icmp slt i32 %314, 0
  %316 = xor i32 %314, 2147483647
  %317 = select i1 %315, i32 %316, i32 %314
  %compare.134.0.i819 = fcmp uno float %.val720, 0.000000e+00
  %compare.133.0.i820 = fcmp oeq float %.val720, 0.000000e+00
  %318 = select i1 %compare.133.0.i820, float 0.000000e+00, float %.val720
  %319 = select i1 %compare.134.0.i819, float 0x7FF8000000000000, float %318
  %320 = bitcast float %319 to i32
  %321 = icmp slt i32 %320, 0
  %322 = xor i32 %320, 2147483647
  %323 = select i1 %321, i32 %322, i32 %320
  %324 = icmp sge i32 %317, %323
  %.not.i821 = icmp eq i32 %323, %317
  %325 = icmp sge i32 %.val721, %.val722
  %.v.i822 = select i1 %.not.i821, i1 %325, i1 %324
  br i1 %.v.i822, label %is_last_tile-after148, label %is_smaller_than-true153

is_smaller_than-true153:                          ; preds = %smaller_comparison_index-true149
  store float %.val719, ptr addrspace(3) %309, align 4
  store float %.val720, ptr addrspace(3) %308, align 4
  store i32 %.val721, ptr addrspace(3) %311, align 4
  store i32 %.val722, ptr addrspace(3) %310, align 4
  br label %is_last_tile-after148

smaller_comparison_index-true164:                 ; preds = %is_last_tile-after148
  %326 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %38
  %327 = getelementptr i8, ptr addrspace(3) %326, i64 32
  %328 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %38
  %329 = getelementptr i8, ptr addrspace(3) %328, i64 32
  %.val715 = load float, ptr addrspace(3) %327, align 4
  %.val716 = load float, ptr addrspace(3) %326, align 4
  %.val717 = load i32, ptr addrspace(3) %329, align 4
  %.val718 = load i32, ptr addrspace(3) %328, align 4
  %compare.132.0.i823 = fcmp uno float %.val715, 0.000000e+00
  %compare.131.0.i824 = fcmp oeq float %.val715, 0.000000e+00
  %330 = select i1 %compare.131.0.i824, float 0.000000e+00, float %.val715
  %331 = select i1 %compare.132.0.i823, float 0x7FF8000000000000, float %330
  %332 = bitcast float %331 to i32
  %333 = icmp slt i32 %332, 0
  %334 = xor i32 %332, 2147483647
  %335 = select i1 %333, i32 %334, i32 %332
  %compare.134.0.i825 = fcmp uno float %.val716, 0.000000e+00
  %compare.133.0.i826 = fcmp oeq float %.val716, 0.000000e+00
  %336 = select i1 %compare.133.0.i826, float 0.000000e+00, float %.val716
  %337 = select i1 %compare.134.0.i825, float 0x7FF8000000000000, float %336
  %338 = bitcast float %337 to i32
  %339 = icmp slt i32 %338, 0
  %340 = xor i32 %338, 2147483647
  %341 = select i1 %339, i32 %340, i32 %338
  %342 = icmp sge i32 %335, %341
  %.not.i827 = icmp eq i32 %341, %335
  %343 = icmp sge i32 %.val717, %.val718
  %.v.i828 = select i1 %.not.i827, i1 %343, i1 %342
  br i1 %.v.i828, label %is_last_tile-after163, label %is_smaller_than-true168

is_smaller_than-true168:                          ; preds = %smaller_comparison_index-true164
  store float %.val715, ptr addrspace(3) %326, align 4
  %sunkaddr978 = getelementptr i8, ptr addrspace(3) %326, i64 32
  store float %.val716, ptr addrspace(3) %sunkaddr978, align 4
  store i32 %.val717, ptr addrspace(3) %328, align 4
  %sunkaddr979 = getelementptr i8, ptr addrspace(3) %328, i64 32
  store i32 %.val718, ptr addrspace(3) %sunkaddr979, align 4
  br label %is_last_tile-after163

smaller_comparison_index-true179:                 ; preds = %is_last_tile-after163
  %344 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %28
  %345 = getelementptr i8, ptr addrspace(3) %344, i64 16
  %346 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %28
  %347 = getelementptr i8, ptr addrspace(3) %346, i64 16
  %.val711 = load float, ptr addrspace(3) %345, align 4
  %.val712 = load float, ptr addrspace(3) %344, align 4
  %.val713 = load i32, ptr addrspace(3) %347, align 4
  %.val714 = load i32, ptr addrspace(3) %346, align 4
  %compare.132.0.i829 = fcmp uno float %.val711, 0.000000e+00
  %compare.131.0.i830 = fcmp oeq float %.val711, 0.000000e+00
  %348 = select i1 %compare.131.0.i830, float 0.000000e+00, float %.val711
  %349 = select i1 %compare.132.0.i829, float 0x7FF8000000000000, float %348
  %350 = bitcast float %349 to i32
  %351 = icmp slt i32 %350, 0
  %352 = xor i32 %350, 2147483647
  %353 = select i1 %351, i32 %352, i32 %350
  %compare.134.0.i831 = fcmp uno float %.val712, 0.000000e+00
  %compare.133.0.i832 = fcmp oeq float %.val712, 0.000000e+00
  %354 = select i1 %compare.133.0.i832, float 0.000000e+00, float %.val712
  %355 = select i1 %compare.134.0.i831, float 0x7FF8000000000000, float %354
  %356 = bitcast float %355 to i32
  %357 = icmp slt i32 %356, 0
  %358 = xor i32 %356, 2147483647
  %359 = select i1 %357, i32 %358, i32 %356
  %360 = icmp sge i32 %353, %359
  %.not.i833 = icmp eq i32 %359, %353
  %361 = icmp sge i32 %.val713, %.val714
  %.v.i834 = select i1 %.not.i833, i1 %361, i1 %360
  br i1 %.v.i834, label %is_last_tile-after178, label %is_smaller_than-true183

is_smaller_than-true183:                          ; preds = %smaller_comparison_index-true179
  store float %.val711, ptr addrspace(3) %344, align 4
  %sunkaddr980 = getelementptr i8, ptr addrspace(3) %344, i64 16
  store float %.val712, ptr addrspace(3) %sunkaddr980, align 4
  store i32 %.val713, ptr addrspace(3) %346, align 4
  %sunkaddr981 = getelementptr i8, ptr addrspace(3) %346, i64 16
  store i32 %.val714, ptr addrspace(3) %sunkaddr981, align 4
  br label %is_last_tile-after178

smaller_comparison_index-true194:                 ; preds = %is_last_tile-after178
  %362 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %20
  %363 = getelementptr i8, ptr addrspace(3) %362, i64 8
  %364 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %20
  %365 = getelementptr i8, ptr addrspace(3) %364, i64 8
  %.val707 = load float, ptr addrspace(3) %363, align 4
  %.val708 = load float, ptr addrspace(3) %362, align 4
  %.val709 = load i32, ptr addrspace(3) %365, align 4
  %.val710 = load i32, ptr addrspace(3) %364, align 4
  %compare.132.0.i835 = fcmp uno float %.val707, 0.000000e+00
  %compare.131.0.i836 = fcmp oeq float %.val707, 0.000000e+00
  %366 = select i1 %compare.131.0.i836, float 0.000000e+00, float %.val707
  %367 = select i1 %compare.132.0.i835, float 0x7FF8000000000000, float %366
  %368 = bitcast float %367 to i32
  %369 = icmp slt i32 %368, 0
  %370 = xor i32 %368, 2147483647
  %371 = select i1 %369, i32 %370, i32 %368
  %compare.134.0.i837 = fcmp uno float %.val708, 0.000000e+00
  %compare.133.0.i838 = fcmp oeq float %.val708, 0.000000e+00
  %372 = select i1 %compare.133.0.i838, float 0.000000e+00, float %.val708
  %373 = select i1 %compare.134.0.i837, float 0x7FF8000000000000, float %372
  %374 = bitcast float %373 to i32
  %375 = icmp slt i32 %374, 0
  %376 = xor i32 %374, 2147483647
  %377 = select i1 %375, i32 %376, i32 %374
  %378 = icmp sge i32 %371, %377
  %.not.i839 = icmp eq i32 %377, %371
  %379 = icmp sge i32 %.val709, %.val710
  %.v.i840 = select i1 %.not.i839, i1 %379, i1 %378
  br i1 %.v.i840, label %is_last_tile-after193, label %is_smaller_than-true198

is_smaller_than-true198:                          ; preds = %smaller_comparison_index-true194
  store float %.val707, ptr addrspace(3) %362, align 4
  %sunkaddr982 = getelementptr i8, ptr addrspace(3) %362, i64 8
  store float %.val708, ptr addrspace(3) %sunkaddr982, align 4
  store i32 %.val709, ptr addrspace(3) %364, align 4
  %sunkaddr983 = getelementptr i8, ptr addrspace(3) %364, i64 8
  store i32 %.val710, ptr addrspace(3) %sunkaddr983, align 4
  br label %is_last_tile-after193

smaller_comparison_index-true209:                 ; preds = %is_last_tile-after193
  %380 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %381 = getelementptr i8, ptr addrspace(3) %380, i64 4
  %382 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %383 = getelementptr i8, ptr addrspace(3) %382, i64 4
  %.val703 = load float, ptr addrspace(3) %381, align 4
  %.val704 = load float, ptr addrspace(3) %380, align 4
  %.val705 = load i32, ptr addrspace(3) %383, align 4
  %.val706 = load i32, ptr addrspace(3) %382, align 4
  %compare.132.0.i841 = fcmp uno float %.val703, 0.000000e+00
  %compare.131.0.i842 = fcmp oeq float %.val703, 0.000000e+00
  %384 = select i1 %compare.131.0.i842, float 0.000000e+00, float %.val703
  %385 = select i1 %compare.132.0.i841, float 0x7FF8000000000000, float %384
  %386 = bitcast float %385 to i32
  %387 = icmp slt i32 %386, 0
  %388 = xor i32 %386, 2147483647
  %389 = select i1 %387, i32 %388, i32 %386
  %compare.134.0.i843 = fcmp uno float %.val704, 0.000000e+00
  %compare.133.0.i844 = fcmp oeq float %.val704, 0.000000e+00
  %390 = select i1 %compare.133.0.i844, float 0.000000e+00, float %.val704
  %391 = select i1 %compare.134.0.i843, float 0x7FF8000000000000, float %390
  %392 = bitcast float %391 to i32
  %393 = icmp slt i32 %392, 0
  %394 = xor i32 %392, 2147483647
  %395 = select i1 %393, i32 %394, i32 %392
  %396 = icmp sge i32 %389, %395
  %.not.i845 = icmp eq i32 %395, %389
  %397 = icmp sge i32 %.val705, %.val706
  %.v.i846 = select i1 %.not.i845, i1 %397, i1 %396
  br i1 %.v.i846, label %is_last_tile-after208, label %is_smaller_than-true213

is_smaller_than-true213:                          ; preds = %smaller_comparison_index-true209
  %398 = insertelement <2 x float> poison, float %.val703, i32 0
  %399 = insertelement <2 x float> %398, float %.val704, i32 1
  store <2 x float> %399, ptr addrspace(3) %380, align 8
  %400 = insertelement <2 x i32> poison, i32 %.val705, i32 0
  %401 = insertelement <2 x i32> %400, i32 %.val706, i32 1
  store <2 x i32> %401, ptr addrspace(3) %382, align 8
  br label %is_last_tile-after208

smaller_comparison_index-true224:                 ; preds = %is_last_tile-after208
  %402 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %62
  %403 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %61
  %404 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %62
  %405 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %61
  %.val699 = load float, ptr addrspace(3) %402, align 4
  %.val700 = load float, ptr addrspace(3) %403, align 4
  %.val701 = load i32, ptr addrspace(3) %404, align 4
  %.val702 = load i32, ptr addrspace(3) %405, align 4
  %compare.132.0.i847 = fcmp uno float %.val699, 0.000000e+00
  %compare.131.0.i848 = fcmp oeq float %.val699, 0.000000e+00
  %406 = select i1 %compare.131.0.i848, float 0.000000e+00, float %.val699
  %407 = select i1 %compare.132.0.i847, float 0x7FF8000000000000, float %406
  %408 = bitcast float %407 to i32
  %409 = icmp slt i32 %408, 0
  %410 = xor i32 %408, 2147483647
  %411 = select i1 %409, i32 %410, i32 %408
  %compare.134.0.i849 = fcmp uno float %.val700, 0.000000e+00
  %compare.133.0.i850 = fcmp oeq float %.val700, 0.000000e+00
  %412 = select i1 %compare.133.0.i850, float 0.000000e+00, float %.val700
  %413 = select i1 %compare.134.0.i849, float 0x7FF8000000000000, float %412
  %414 = bitcast float %413 to i32
  %415 = icmp slt i32 %414, 0
  %416 = xor i32 %414, 2147483647
  %417 = select i1 %415, i32 %416, i32 %414
  %418 = icmp sge i32 %411, %417
  %.not.i851 = icmp eq i32 %417, %411
  %419 = icmp sge i32 %.val701, %.val702
  %.v.i852 = select i1 %.not.i851, i1 %419, i1 %418
  br i1 %.v.i852, label %is_last_tile-after223, label %is_smaller_than-true228

is_smaller_than-true228:                          ; preds = %smaller_comparison_index-true224
  store float %.val699, ptr addrspace(3) %403, align 4
  store float %.val700, ptr addrspace(3) %402, align 4
  store i32 %.val701, ptr addrspace(3) %405, align 4
  store i32 %.val702, ptr addrspace(3) %404, align 4
  br label %is_last_tile-after223

smaller_comparison_index-true239:                 ; preds = %is_last_tile-after223
  %420 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %49
  %421 = getelementptr i8, ptr addrspace(3) %420, i64 64
  %422 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %49
  %423 = getelementptr i8, ptr addrspace(3) %422, i64 64
  %.val695 = load float, ptr addrspace(3) %421, align 4
  %.val696 = load float, ptr addrspace(3) %420, align 4
  %.val697 = load i32, ptr addrspace(3) %423, align 4
  %.val698 = load i32, ptr addrspace(3) %422, align 4
  %compare.132.0.i853 = fcmp uno float %.val695, 0.000000e+00
  %compare.131.0.i854 = fcmp oeq float %.val695, 0.000000e+00
  %424 = select i1 %compare.131.0.i854, float 0.000000e+00, float %.val695
  %425 = select i1 %compare.132.0.i853, float 0x7FF8000000000000, float %424
  %426 = bitcast float %425 to i32
  %427 = icmp slt i32 %426, 0
  %428 = xor i32 %426, 2147483647
  %429 = select i1 %427, i32 %428, i32 %426
  %compare.134.0.i855 = fcmp uno float %.val696, 0.000000e+00
  %compare.133.0.i856 = fcmp oeq float %.val696, 0.000000e+00
  %430 = select i1 %compare.133.0.i856, float 0.000000e+00, float %.val696
  %431 = select i1 %compare.134.0.i855, float 0x7FF8000000000000, float %430
  %432 = bitcast float %431 to i32
  %433 = icmp slt i32 %432, 0
  %434 = xor i32 %432, 2147483647
  %435 = select i1 %433, i32 %434, i32 %432
  %436 = icmp sge i32 %429, %435
  %.not.i857 = icmp eq i32 %435, %429
  %437 = icmp sge i32 %.val697, %.val698
  %.v.i858 = select i1 %.not.i857, i1 %437, i1 %436
  br i1 %.v.i858, label %is_last_tile-after238, label %is_smaller_than-true243

is_smaller_than-true243:                          ; preds = %smaller_comparison_index-true239
  store float %.val695, ptr addrspace(3) %420, align 4
  %sunkaddr984 = getelementptr i8, ptr addrspace(3) %420, i64 64
  store float %.val696, ptr addrspace(3) %sunkaddr984, align 4
  store i32 %.val697, ptr addrspace(3) %422, align 4
  %sunkaddr985 = getelementptr i8, ptr addrspace(3) %422, i64 64
  store i32 %.val698, ptr addrspace(3) %sunkaddr985, align 4
  br label %is_last_tile-after238

smaller_comparison_index-true254:                 ; preds = %is_last_tile-after238
  %438 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %38
  %439 = getelementptr i8, ptr addrspace(3) %438, i64 32
  %440 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %38
  %441 = getelementptr i8, ptr addrspace(3) %440, i64 32
  %.val691 = load float, ptr addrspace(3) %439, align 4
  %.val692 = load float, ptr addrspace(3) %438, align 4
  %.val693 = load i32, ptr addrspace(3) %441, align 4
  %.val694 = load i32, ptr addrspace(3) %440, align 4
  %compare.132.0.i859 = fcmp uno float %.val691, 0.000000e+00
  %compare.131.0.i860 = fcmp oeq float %.val691, 0.000000e+00
  %442 = select i1 %compare.131.0.i860, float 0.000000e+00, float %.val691
  %443 = select i1 %compare.132.0.i859, float 0x7FF8000000000000, float %442
  %444 = bitcast float %443 to i32
  %445 = icmp slt i32 %444, 0
  %446 = xor i32 %444, 2147483647
  %447 = select i1 %445, i32 %446, i32 %444
  %compare.134.0.i861 = fcmp uno float %.val692, 0.000000e+00
  %compare.133.0.i862 = fcmp oeq float %.val692, 0.000000e+00
  %448 = select i1 %compare.133.0.i862, float 0.000000e+00, float %.val692
  %449 = select i1 %compare.134.0.i861, float 0x7FF8000000000000, float %448
  %450 = bitcast float %449 to i32
  %451 = icmp slt i32 %450, 0
  %452 = xor i32 %450, 2147483647
  %453 = select i1 %451, i32 %452, i32 %450
  %454 = icmp sge i32 %447, %453
  %.not.i863 = icmp eq i32 %453, %447
  %455 = icmp sge i32 %.val693, %.val694
  %.v.i864 = select i1 %.not.i863, i1 %455, i1 %454
  br i1 %.v.i864, label %is_last_tile-after253, label %is_smaller_than-true258

is_smaller_than-true258:                          ; preds = %smaller_comparison_index-true254
  store float %.val691, ptr addrspace(3) %438, align 4
  %sunkaddr986 = getelementptr i8, ptr addrspace(3) %438, i64 32
  store float %.val692, ptr addrspace(3) %sunkaddr986, align 4
  store i32 %.val693, ptr addrspace(3) %440, align 4
  %sunkaddr987 = getelementptr i8, ptr addrspace(3) %440, i64 32
  store i32 %.val694, ptr addrspace(3) %sunkaddr987, align 4
  br label %is_last_tile-after253

smaller_comparison_index-true269:                 ; preds = %is_last_tile-after253
  %456 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %28
  %457 = getelementptr i8, ptr addrspace(3) %456, i64 16
  %458 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %28
  %459 = getelementptr i8, ptr addrspace(3) %458, i64 16
  %.val687 = load float, ptr addrspace(3) %457, align 4
  %.val688 = load float, ptr addrspace(3) %456, align 4
  %.val689 = load i32, ptr addrspace(3) %459, align 4
  %.val690 = load i32, ptr addrspace(3) %458, align 4
  %compare.132.0.i865 = fcmp uno float %.val687, 0.000000e+00
  %compare.131.0.i866 = fcmp oeq float %.val687, 0.000000e+00
  %460 = select i1 %compare.131.0.i866, float 0.000000e+00, float %.val687
  %461 = select i1 %compare.132.0.i865, float 0x7FF8000000000000, float %460
  %462 = bitcast float %461 to i32
  %463 = icmp slt i32 %462, 0
  %464 = xor i32 %462, 2147483647
  %465 = select i1 %463, i32 %464, i32 %462
  %compare.134.0.i867 = fcmp uno float %.val688, 0.000000e+00
  %compare.133.0.i868 = fcmp oeq float %.val688, 0.000000e+00
  %466 = select i1 %compare.133.0.i868, float 0.000000e+00, float %.val688
  %467 = select i1 %compare.134.0.i867, float 0x7FF8000000000000, float %466
  %468 = bitcast float %467 to i32
  %469 = icmp slt i32 %468, 0
  %470 = xor i32 %468, 2147483647
  %471 = select i1 %469, i32 %470, i32 %468
  %472 = icmp sge i32 %465, %471
  %.not.i869 = icmp eq i32 %471, %465
  %473 = icmp sge i32 %.val689, %.val690
  %.v.i870 = select i1 %.not.i869, i1 %473, i1 %472
  br i1 %.v.i870, label %is_last_tile-after268, label %is_smaller_than-true273

is_smaller_than-true273:                          ; preds = %smaller_comparison_index-true269
  store float %.val687, ptr addrspace(3) %456, align 4
  %sunkaddr988 = getelementptr i8, ptr addrspace(3) %456, i64 16
  store float %.val688, ptr addrspace(3) %sunkaddr988, align 4
  store i32 %.val689, ptr addrspace(3) %458, align 4
  %sunkaddr989 = getelementptr i8, ptr addrspace(3) %458, i64 16
  store i32 %.val690, ptr addrspace(3) %sunkaddr989, align 4
  br label %is_last_tile-after268

smaller_comparison_index-true284:                 ; preds = %is_last_tile-after268
  %474 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %20
  %475 = getelementptr i8, ptr addrspace(3) %474, i64 8
  %476 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %20
  %477 = getelementptr i8, ptr addrspace(3) %476, i64 8
  %.val683 = load float, ptr addrspace(3) %475, align 4
  %.val684 = load float, ptr addrspace(3) %474, align 4
  %.val685 = load i32, ptr addrspace(3) %477, align 4
  %.val686 = load i32, ptr addrspace(3) %476, align 4
  %compare.132.0.i871 = fcmp uno float %.val683, 0.000000e+00
  %compare.131.0.i872 = fcmp oeq float %.val683, 0.000000e+00
  %478 = select i1 %compare.131.0.i872, float 0.000000e+00, float %.val683
  %479 = select i1 %compare.132.0.i871, float 0x7FF8000000000000, float %478
  %480 = bitcast float %479 to i32
  %481 = icmp slt i32 %480, 0
  %482 = xor i32 %480, 2147483647
  %483 = select i1 %481, i32 %482, i32 %480
  %compare.134.0.i873 = fcmp uno float %.val684, 0.000000e+00
  %compare.133.0.i874 = fcmp oeq float %.val684, 0.000000e+00
  %484 = select i1 %compare.133.0.i874, float 0.000000e+00, float %.val684
  %485 = select i1 %compare.134.0.i873, float 0x7FF8000000000000, float %484
  %486 = bitcast float %485 to i32
  %487 = icmp slt i32 %486, 0
  %488 = xor i32 %486, 2147483647
  %489 = select i1 %487, i32 %488, i32 %486
  %490 = icmp sge i32 %483, %489
  %.not.i875 = icmp eq i32 %489, %483
  %491 = icmp sge i32 %.val685, %.val686
  %.v.i876 = select i1 %.not.i875, i1 %491, i1 %490
  br i1 %.v.i876, label %is_last_tile-after283, label %is_smaller_than-true288

is_smaller_than-true288:                          ; preds = %smaller_comparison_index-true284
  store float %.val683, ptr addrspace(3) %474, align 4
  %sunkaddr990 = getelementptr i8, ptr addrspace(3) %474, i64 8
  store float %.val684, ptr addrspace(3) %sunkaddr990, align 4
  store i32 %.val685, ptr addrspace(3) %476, align 4
  %sunkaddr991 = getelementptr i8, ptr addrspace(3) %476, i64 8
  store i32 %.val686, ptr addrspace(3) %sunkaddr991, align 4
  br label %is_last_tile-after283

smaller_comparison_index-true299:                 ; preds = %is_last_tile-after283
  %492 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %493 = getelementptr i8, ptr addrspace(3) %492, i64 4
  %494 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %495 = getelementptr i8, ptr addrspace(3) %494, i64 4
  %.val679 = load float, ptr addrspace(3) %493, align 4
  %.val680 = load float, ptr addrspace(3) %492, align 4
  %.val681 = load i32, ptr addrspace(3) %495, align 4
  %.val682 = load i32, ptr addrspace(3) %494, align 4
  %compare.132.0.i877 = fcmp uno float %.val679, 0.000000e+00
  %compare.131.0.i878 = fcmp oeq float %.val679, 0.000000e+00
  %496 = select i1 %compare.131.0.i878, float 0.000000e+00, float %.val679
  %497 = select i1 %compare.132.0.i877, float 0x7FF8000000000000, float %496
  %498 = bitcast float %497 to i32
  %499 = icmp slt i32 %498, 0
  %500 = xor i32 %498, 2147483647
  %501 = select i1 %499, i32 %500, i32 %498
  %compare.134.0.i879 = fcmp uno float %.val680, 0.000000e+00
  %compare.133.0.i880 = fcmp oeq float %.val680, 0.000000e+00
  %502 = select i1 %compare.133.0.i880, float 0.000000e+00, float %.val680
  %503 = select i1 %compare.134.0.i879, float 0x7FF8000000000000, float %502
  %504 = bitcast float %503 to i32
  %505 = icmp slt i32 %504, 0
  %506 = xor i32 %504, 2147483647
  %507 = select i1 %505, i32 %506, i32 %504
  %508 = icmp sge i32 %501, %507
  %.not.i881 = icmp eq i32 %507, %501
  %509 = icmp sge i32 %.val681, %.val682
  %.v.i882 = select i1 %.not.i881, i1 %509, i1 %508
  br i1 %.v.i882, label %is_last_tile-after298, label %is_smaller_than-true303

is_smaller_than-true303:                          ; preds = %smaller_comparison_index-true299
  %510 = insertelement <2 x float> poison, float %.val679, i32 0
  %511 = insertelement <2 x float> %510, float %.val680, i32 1
  store <2 x float> %511, ptr addrspace(3) %492, align 8
  %512 = insertelement <2 x i32> poison, i32 %.val681, i32 0
  %513 = insertelement <2 x i32> %512, i32 %.val682, i32 1
  store <2 x i32> %513, ptr addrspace(3) %494, align 8
  br label %is_last_tile-after298

smaller_comparison_index-true314:                 ; preds = %is_last_tile-after298
  %514 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %75
  %515 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %74
  %516 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %75
  %517 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %74
  %.val675 = load float, ptr addrspace(3) %514, align 4
  %.val676 = load float, ptr addrspace(3) %515, align 4
  %.val677 = load i32, ptr addrspace(3) %516, align 4
  %.val678 = load i32, ptr addrspace(3) %517, align 4
  %compare.132.0.i883 = fcmp uno float %.val675, 0.000000e+00
  %compare.131.0.i884 = fcmp oeq float %.val675, 0.000000e+00
  %518 = select i1 %compare.131.0.i884, float 0.000000e+00, float %.val675
  %519 = select i1 %compare.132.0.i883, float 0x7FF8000000000000, float %518
  %520 = bitcast float %519 to i32
  %521 = icmp slt i32 %520, 0
  %522 = xor i32 %520, 2147483647
  %523 = select i1 %521, i32 %522, i32 %520
  %compare.134.0.i885 = fcmp uno float %.val676, 0.000000e+00
  %compare.133.0.i886 = fcmp oeq float %.val676, 0.000000e+00
  %524 = select i1 %compare.133.0.i886, float 0.000000e+00, float %.val676
  %525 = select i1 %compare.134.0.i885, float 0x7FF8000000000000, float %524
  %526 = bitcast float %525 to i32
  %527 = icmp slt i32 %526, 0
  %528 = xor i32 %526, 2147483647
  %529 = select i1 %527, i32 %528, i32 %526
  %530 = icmp sge i32 %523, %529
  %.not.i887 = icmp eq i32 %529, %523
  %531 = icmp sge i32 %.val677, %.val678
  %.v.i888 = select i1 %.not.i887, i1 %531, i1 %530
  br i1 %.v.i888, label %is_last_tile-after313, label %is_smaller_than-true318

is_smaller_than-true318:                          ; preds = %smaller_comparison_index-true314
  store float %.val675, ptr addrspace(3) %515, align 4
  store float %.val676, ptr addrspace(3) %514, align 4
  store i32 %.val677, ptr addrspace(3) %517, align 4
  store i32 %.val678, ptr addrspace(3) %516, align 4
  br label %is_last_tile-after313

smaller_comparison_index-true329:                 ; preds = %is_last_tile-after313
  %532 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %61
  %533 = getelementptr i8, ptr addrspace(3) %532, i64 128
  %534 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %61
  %535 = getelementptr i8, ptr addrspace(3) %534, i64 128
  %.val671 = load float, ptr addrspace(3) %533, align 4
  %.val672 = load float, ptr addrspace(3) %532, align 4
  %.val673 = load i32, ptr addrspace(3) %535, align 4
  %.val674 = load i32, ptr addrspace(3) %534, align 4
  %compare.132.0.i889 = fcmp uno float %.val671, 0.000000e+00
  %compare.131.0.i890 = fcmp oeq float %.val671, 0.000000e+00
  %536 = select i1 %compare.131.0.i890, float 0.000000e+00, float %.val671
  %537 = select i1 %compare.132.0.i889, float 0x7FF8000000000000, float %536
  %538 = bitcast float %537 to i32
  %539 = icmp slt i32 %538, 0
  %540 = xor i32 %538, 2147483647
  %541 = select i1 %539, i32 %540, i32 %538
  %compare.134.0.i891 = fcmp uno float %.val672, 0.000000e+00
  %compare.133.0.i892 = fcmp oeq float %.val672, 0.000000e+00
  %542 = select i1 %compare.133.0.i892, float 0.000000e+00, float %.val672
  %543 = select i1 %compare.134.0.i891, float 0x7FF8000000000000, float %542
  %544 = bitcast float %543 to i32
  %545 = icmp slt i32 %544, 0
  %546 = xor i32 %544, 2147483647
  %547 = select i1 %545, i32 %546, i32 %544
  %548 = icmp sge i32 %541, %547
  %.not.i893 = icmp eq i32 %547, %541
  %549 = icmp sge i32 %.val673, %.val674
  %.v.i894 = select i1 %.not.i893, i1 %549, i1 %548
  br i1 %.v.i894, label %is_last_tile-after328, label %is_smaller_than-true333

is_smaller_than-true333:                          ; preds = %smaller_comparison_index-true329
  store float %.val671, ptr addrspace(3) %532, align 4
  %sunkaddr992 = getelementptr i8, ptr addrspace(3) %532, i64 128
  store float %.val672, ptr addrspace(3) %sunkaddr992, align 4
  store i32 %.val673, ptr addrspace(3) %534, align 4
  %sunkaddr993 = getelementptr i8, ptr addrspace(3) %534, i64 128
  store i32 %.val674, ptr addrspace(3) %sunkaddr993, align 4
  br label %is_last_tile-after328

smaller_comparison_index-true344:                 ; preds = %is_last_tile-after328
  %550 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %49
  %551 = getelementptr i8, ptr addrspace(3) %550, i64 64
  %552 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %49
  %553 = getelementptr i8, ptr addrspace(3) %552, i64 64
  %.val667 = load float, ptr addrspace(3) %551, align 4
  %.val668 = load float, ptr addrspace(3) %550, align 4
  %.val669 = load i32, ptr addrspace(3) %553, align 4
  %.val670 = load i32, ptr addrspace(3) %552, align 4
  %compare.132.0.i895 = fcmp uno float %.val667, 0.000000e+00
  %compare.131.0.i896 = fcmp oeq float %.val667, 0.000000e+00
  %554 = select i1 %compare.131.0.i896, float 0.000000e+00, float %.val667
  %555 = select i1 %compare.132.0.i895, float 0x7FF8000000000000, float %554
  %556 = bitcast float %555 to i32
  %557 = icmp slt i32 %556, 0
  %558 = xor i32 %556, 2147483647
  %559 = select i1 %557, i32 %558, i32 %556
  %compare.134.0.i897 = fcmp uno float %.val668, 0.000000e+00
  %compare.133.0.i898 = fcmp oeq float %.val668, 0.000000e+00
  %560 = select i1 %compare.133.0.i898, float 0.000000e+00, float %.val668
  %561 = select i1 %compare.134.0.i897, float 0x7FF8000000000000, float %560
  %562 = bitcast float %561 to i32
  %563 = icmp slt i32 %562, 0
  %564 = xor i32 %562, 2147483647
  %565 = select i1 %563, i32 %564, i32 %562
  %566 = icmp sge i32 %559, %565
  %.not.i899 = icmp eq i32 %565, %559
  %567 = icmp sge i32 %.val669, %.val670
  %.v.i900 = select i1 %.not.i899, i1 %567, i1 %566
  br i1 %.v.i900, label %is_last_tile-after343, label %is_smaller_than-true348

is_smaller_than-true348:                          ; preds = %smaller_comparison_index-true344
  store float %.val667, ptr addrspace(3) %550, align 4
  %sunkaddr994 = getelementptr i8, ptr addrspace(3) %550, i64 64
  store float %.val668, ptr addrspace(3) %sunkaddr994, align 4
  store i32 %.val669, ptr addrspace(3) %552, align 4
  %sunkaddr995 = getelementptr i8, ptr addrspace(3) %552, i64 64
  store i32 %.val670, ptr addrspace(3) %sunkaddr995, align 4
  br label %is_last_tile-after343

smaller_comparison_index-true359:                 ; preds = %is_last_tile-after343
  %568 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %38
  %569 = getelementptr i8, ptr addrspace(3) %568, i64 32
  %570 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %38
  %571 = getelementptr i8, ptr addrspace(3) %570, i64 32
  %.val663 = load float, ptr addrspace(3) %569, align 4
  %.val664 = load float, ptr addrspace(3) %568, align 4
  %.val665 = load i32, ptr addrspace(3) %571, align 4
  %.val666 = load i32, ptr addrspace(3) %570, align 4
  %compare.132.0.i901 = fcmp uno float %.val663, 0.000000e+00
  %compare.131.0.i902 = fcmp oeq float %.val663, 0.000000e+00
  %572 = select i1 %compare.131.0.i902, float 0.000000e+00, float %.val663
  %573 = select i1 %compare.132.0.i901, float 0x7FF8000000000000, float %572
  %574 = bitcast float %573 to i32
  %575 = icmp slt i32 %574, 0
  %576 = xor i32 %574, 2147483647
  %577 = select i1 %575, i32 %576, i32 %574
  %compare.134.0.i903 = fcmp uno float %.val664, 0.000000e+00
  %compare.133.0.i904 = fcmp oeq float %.val664, 0.000000e+00
  %578 = select i1 %compare.133.0.i904, float 0.000000e+00, float %.val664
  %579 = select i1 %compare.134.0.i903, float 0x7FF8000000000000, float %578
  %580 = bitcast float %579 to i32
  %581 = icmp slt i32 %580, 0
  %582 = xor i32 %580, 2147483647
  %583 = select i1 %581, i32 %582, i32 %580
  %584 = icmp sge i32 %577, %583
  %.not.i905 = icmp eq i32 %583, %577
  %585 = icmp sge i32 %.val665, %.val666
  %.v.i906 = select i1 %.not.i905, i1 %585, i1 %584
  br i1 %.v.i906, label %is_last_tile-after358, label %is_smaller_than-true363

is_smaller_than-true363:                          ; preds = %smaller_comparison_index-true359
  store float %.val663, ptr addrspace(3) %568, align 4
  %sunkaddr996 = getelementptr i8, ptr addrspace(3) %568, i64 32
  store float %.val664, ptr addrspace(3) %sunkaddr996, align 4
  store i32 %.val665, ptr addrspace(3) %570, align 4
  %sunkaddr997 = getelementptr i8, ptr addrspace(3) %570, i64 32
  store i32 %.val666, ptr addrspace(3) %sunkaddr997, align 4
  br label %is_last_tile-after358

smaller_comparison_index-true374:                 ; preds = %is_last_tile-after358
  %586 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %28
  %587 = getelementptr i8, ptr addrspace(3) %586, i64 16
  %588 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %28
  %589 = getelementptr i8, ptr addrspace(3) %588, i64 16
  %.val659 = load float, ptr addrspace(3) %587, align 4
  %.val660 = load float, ptr addrspace(3) %586, align 4
  %.val661 = load i32, ptr addrspace(3) %589, align 4
  %.val662 = load i32, ptr addrspace(3) %588, align 4
  %compare.132.0.i907 = fcmp uno float %.val659, 0.000000e+00
  %compare.131.0.i908 = fcmp oeq float %.val659, 0.000000e+00
  %590 = select i1 %compare.131.0.i908, float 0.000000e+00, float %.val659
  %591 = select i1 %compare.132.0.i907, float 0x7FF8000000000000, float %590
  %592 = bitcast float %591 to i32
  %593 = icmp slt i32 %592, 0
  %594 = xor i32 %592, 2147483647
  %595 = select i1 %593, i32 %594, i32 %592
  %compare.134.0.i909 = fcmp uno float %.val660, 0.000000e+00
  %compare.133.0.i910 = fcmp oeq float %.val660, 0.000000e+00
  %596 = select i1 %compare.133.0.i910, float 0.000000e+00, float %.val660
  %597 = select i1 %compare.134.0.i909, float 0x7FF8000000000000, float %596
  %598 = bitcast float %597 to i32
  %599 = icmp slt i32 %598, 0
  %600 = xor i32 %598, 2147483647
  %601 = select i1 %599, i32 %600, i32 %598
  %602 = icmp sge i32 %595, %601
  %.not.i911 = icmp eq i32 %601, %595
  %603 = icmp sge i32 %.val661, %.val662
  %.v.i912 = select i1 %.not.i911, i1 %603, i1 %602
  br i1 %.v.i912, label %is_last_tile-after373, label %is_smaller_than-true378

is_smaller_than-true378:                          ; preds = %smaller_comparison_index-true374
  store float %.val659, ptr addrspace(3) %586, align 4
  %sunkaddr998 = getelementptr i8, ptr addrspace(3) %586, i64 16
  store float %.val660, ptr addrspace(3) %sunkaddr998, align 4
  store i32 %.val661, ptr addrspace(3) %588, align 4
  %sunkaddr999 = getelementptr i8, ptr addrspace(3) %588, i64 16
  store i32 %.val662, ptr addrspace(3) %sunkaddr999, align 4
  br label %is_last_tile-after373

smaller_comparison_index-true389:                 ; preds = %is_last_tile-after373
  %604 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %20
  %605 = getelementptr i8, ptr addrspace(3) %604, i64 8
  %606 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %20
  %607 = getelementptr i8, ptr addrspace(3) %606, i64 8
  %.val655 = load float, ptr addrspace(3) %605, align 4
  %.val656 = load float, ptr addrspace(3) %604, align 4
  %.val657 = load i32, ptr addrspace(3) %607, align 4
  %.val658 = load i32, ptr addrspace(3) %606, align 4
  %compare.132.0.i913 = fcmp uno float %.val655, 0.000000e+00
  %compare.131.0.i914 = fcmp oeq float %.val655, 0.000000e+00
  %608 = select i1 %compare.131.0.i914, float 0.000000e+00, float %.val655
  %609 = select i1 %compare.132.0.i913, float 0x7FF8000000000000, float %608
  %610 = bitcast float %609 to i32
  %611 = icmp slt i32 %610, 0
  %612 = xor i32 %610, 2147483647
  %613 = select i1 %611, i32 %612, i32 %610
  %compare.134.0.i915 = fcmp uno float %.val656, 0.000000e+00
  %compare.133.0.i916 = fcmp oeq float %.val656, 0.000000e+00
  %614 = select i1 %compare.133.0.i916, float 0.000000e+00, float %.val656
  %615 = select i1 %compare.134.0.i915, float 0x7FF8000000000000, float %614
  %616 = bitcast float %615 to i32
  %617 = icmp slt i32 %616, 0
  %618 = xor i32 %616, 2147483647
  %619 = select i1 %617, i32 %618, i32 %616
  %620 = icmp sge i32 %613, %619
  %.not.i917 = icmp eq i32 %619, %613
  %621 = icmp sge i32 %.val657, %.val658
  %.v.i918 = select i1 %.not.i917, i1 %621, i1 %620
  br i1 %.v.i918, label %is_last_tile-after388, label %is_smaller_than-true393

is_smaller_than-true393:                          ; preds = %smaller_comparison_index-true389
  store float %.val655, ptr addrspace(3) %604, align 4
  %sunkaddr1000 = getelementptr i8, ptr addrspace(3) %604, i64 8
  store float %.val656, ptr addrspace(3) %sunkaddr1000, align 4
  store i32 %.val657, ptr addrspace(3) %606, align 4
  %sunkaddr1001 = getelementptr i8, ptr addrspace(3) %606, i64 8
  store i32 %.val658, ptr addrspace(3) %sunkaddr1001, align 4
  br label %is_last_tile-after388

smaller_comparison_index-true404:                 ; preds = %is_last_tile-after388
  %622 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %623 = getelementptr i8, ptr addrspace(3) %622, i64 4
  %624 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %625 = getelementptr i8, ptr addrspace(3) %624, i64 4
  %.val651 = load float, ptr addrspace(3) %623, align 4
  %.val652 = load float, ptr addrspace(3) %622, align 4
  %.val653 = load i32, ptr addrspace(3) %625, align 4
  %.val654 = load i32, ptr addrspace(3) %624, align 4
  %compare.132.0.i919 = fcmp uno float %.val651, 0.000000e+00
  %compare.131.0.i920 = fcmp oeq float %.val651, 0.000000e+00
  %626 = select i1 %compare.131.0.i920, float 0.000000e+00, float %.val651
  %627 = select i1 %compare.132.0.i919, float 0x7FF8000000000000, float %626
  %628 = bitcast float %627 to i32
  %629 = icmp slt i32 %628, 0
  %630 = xor i32 %628, 2147483647
  %631 = select i1 %629, i32 %630, i32 %628
  %compare.134.0.i921 = fcmp uno float %.val652, 0.000000e+00
  %compare.133.0.i922 = fcmp oeq float %.val652, 0.000000e+00
  %632 = select i1 %compare.133.0.i922, float 0.000000e+00, float %.val652
  %633 = select i1 %compare.134.0.i921, float 0x7FF8000000000000, float %632
  %634 = bitcast float %633 to i32
  %635 = icmp slt i32 %634, 0
  %636 = xor i32 %634, 2147483647
  %637 = select i1 %635, i32 %636, i32 %634
  %638 = icmp sge i32 %631, %637
  %.not.i923 = icmp eq i32 %637, %631
  %639 = icmp sge i32 %.val653, %.val654
  %.v.i924 = select i1 %.not.i923, i1 %639, i1 %638
  br i1 %.v.i924, label %is_last_tile-after403, label %is_smaller_than-true408

is_smaller_than-true408:                          ; preds = %smaller_comparison_index-true404
  %640 = insertelement <2 x float> poison, float %.val651, i32 0
  %641 = insertelement <2 x float> %640, float %.val652, i32 1
  store <2 x float> %641, ptr addrspace(3) %622, align 8
  %642 = insertelement <2 x i32> poison, i32 %.val653, i32 0
  %643 = insertelement <2 x i32> %642, i32 %.val654, i32 1
  store <2 x i32> %643, ptr addrspace(3) %624, align 8
  br label %is_last_tile-after403

smaller_comparison_index-true419:                 ; preds = %is_last_tile-after403
  %644 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %86
  %645 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %thread.id.x
  %646 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %86
  %647 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %thread.id.x
  %.val647 = load float, ptr addrspace(3) %644, align 4
  %.val648 = load float, ptr addrspace(3) %645, align 4
  %.val649 = load i32, ptr addrspace(3) %646, align 4
  %.val650 = load i32, ptr addrspace(3) %647, align 4
  %compare.132.0.i925 = fcmp uno float %.val647, 0.000000e+00
  %compare.131.0.i926 = fcmp oeq float %.val647, 0.000000e+00
  %648 = select i1 %compare.131.0.i926, float 0.000000e+00, float %.val647
  %649 = select i1 %compare.132.0.i925, float 0x7FF8000000000000, float %648
  %650 = bitcast float %649 to i32
  %651 = icmp slt i32 %650, 0
  %652 = xor i32 %650, 2147483647
  %653 = select i1 %651, i32 %652, i32 %650
  %compare.134.0.i927 = fcmp uno float %.val648, 0.000000e+00
  %compare.133.0.i928 = fcmp oeq float %.val648, 0.000000e+00
  %654 = select i1 %compare.133.0.i928, float 0.000000e+00, float %.val648
  %655 = select i1 %compare.134.0.i927, float 0x7FF8000000000000, float %654
  %656 = bitcast float %655 to i32
  %657 = icmp slt i32 %656, 0
  %658 = xor i32 %656, 2147483647
  %659 = select i1 %657, i32 %658, i32 %656
  %660 = icmp sge i32 %653, %659
  %.not.i929 = icmp eq i32 %659, %653
  %661 = icmp sge i32 %.val649, %.val650
  %.v.i930 = select i1 %.not.i929, i1 %661, i1 %660
  br i1 %.v.i930, label %is_last_tile-after418, label %is_smaller_than-true423

is_smaller_than-true423:                          ; preds = %smaller_comparison_index-true419
  store float %.val647, ptr addrspace(3) %645, align 4
  store float %.val648, ptr addrspace(3) %644, align 4
  store i32 %.val649, ptr addrspace(3) %647, align 4
  store i32 %.val650, ptr addrspace(3) %646, align 4
  br label %is_last_tile-after418

smaller_comparison_index-true434:                 ; preds = %is_last_tile-after418
  %662 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %74
  %663 = getelementptr i8, ptr addrspace(3) %662, i64 256
  %664 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %74
  %665 = getelementptr i8, ptr addrspace(3) %664, i64 256
  %.val643 = load float, ptr addrspace(3) %663, align 4
  %.val644 = load float, ptr addrspace(3) %662, align 4
  %.val645 = load i32, ptr addrspace(3) %665, align 4
  %.val646 = load i32, ptr addrspace(3) %664, align 4
  %compare.132.0.i931 = fcmp uno float %.val643, 0.000000e+00
  %compare.131.0.i932 = fcmp oeq float %.val643, 0.000000e+00
  %666 = select i1 %compare.131.0.i932, float 0.000000e+00, float %.val643
  %667 = select i1 %compare.132.0.i931, float 0x7FF8000000000000, float %666
  %668 = bitcast float %667 to i32
  %669 = icmp slt i32 %668, 0
  %670 = xor i32 %668, 2147483647
  %671 = select i1 %669, i32 %670, i32 %668
  %compare.134.0.i933 = fcmp uno float %.val644, 0.000000e+00
  %compare.133.0.i934 = fcmp oeq float %.val644, 0.000000e+00
  %672 = select i1 %compare.133.0.i934, float 0.000000e+00, float %.val644
  %673 = select i1 %compare.134.0.i933, float 0x7FF8000000000000, float %672
  %674 = bitcast float %673 to i32
  %675 = icmp slt i32 %674, 0
  %676 = xor i32 %674, 2147483647
  %677 = select i1 %675, i32 %676, i32 %674
  %678 = icmp sge i32 %671, %677
  %.not.i935 = icmp eq i32 %677, %671
  %679 = icmp sge i32 %.val645, %.val646
  %.v.i936 = select i1 %.not.i935, i1 %679, i1 %678
  br i1 %.v.i936, label %is_last_tile-after433, label %is_smaller_than-true438

is_smaller_than-true438:                          ; preds = %smaller_comparison_index-true434
  store float %.val643, ptr addrspace(3) %662, align 4
  %sunkaddr1002 = getelementptr i8, ptr addrspace(3) %662, i64 256
  store float %.val644, ptr addrspace(3) %sunkaddr1002, align 4
  store i32 %.val645, ptr addrspace(3) %664, align 4
  %sunkaddr1003 = getelementptr i8, ptr addrspace(3) %664, i64 256
  store i32 %.val646, ptr addrspace(3) %sunkaddr1003, align 4
  br label %is_last_tile-after433

smaller_comparison_index-true449:                 ; preds = %is_last_tile-after433
  %680 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %61
  %681 = getelementptr i8, ptr addrspace(3) %680, i64 128
  %682 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %61
  %683 = getelementptr i8, ptr addrspace(3) %682, i64 128
  %.val639 = load float, ptr addrspace(3) %681, align 4
  %.val640 = load float, ptr addrspace(3) %680, align 4
  %.val641 = load i32, ptr addrspace(3) %683, align 4
  %.val642 = load i32, ptr addrspace(3) %682, align 4
  %compare.132.0.i937 = fcmp uno float %.val639, 0.000000e+00
  %compare.131.0.i938 = fcmp oeq float %.val639, 0.000000e+00
  %684 = select i1 %compare.131.0.i938, float 0.000000e+00, float %.val639
  %685 = select i1 %compare.132.0.i937, float 0x7FF8000000000000, float %684
  %686 = bitcast float %685 to i32
  %687 = icmp slt i32 %686, 0
  %688 = xor i32 %686, 2147483647
  %689 = select i1 %687, i32 %688, i32 %686
  %compare.134.0.i939 = fcmp uno float %.val640, 0.000000e+00
  %compare.133.0.i940 = fcmp oeq float %.val640, 0.000000e+00
  %690 = select i1 %compare.133.0.i940, float 0.000000e+00, float %.val640
  %691 = select i1 %compare.134.0.i939, float 0x7FF8000000000000, float %690
  %692 = bitcast float %691 to i32
  %693 = icmp slt i32 %692, 0
  %694 = xor i32 %692, 2147483647
  %695 = select i1 %693, i32 %694, i32 %692
  %696 = icmp sge i32 %689, %695
  %.not.i941 = icmp eq i32 %695, %689
  %697 = icmp sge i32 %.val641, %.val642
  %.v.i942 = select i1 %.not.i941, i1 %697, i1 %696
  br i1 %.v.i942, label %is_last_tile-after448, label %is_smaller_than-true453

is_smaller_than-true453:                          ; preds = %smaller_comparison_index-true449
  store float %.val639, ptr addrspace(3) %680, align 4
  %sunkaddr1004 = getelementptr i8, ptr addrspace(3) %680, i64 128
  store float %.val640, ptr addrspace(3) %sunkaddr1004, align 4
  store i32 %.val641, ptr addrspace(3) %682, align 4
  %sunkaddr1005 = getelementptr i8, ptr addrspace(3) %682, i64 128
  store i32 %.val642, ptr addrspace(3) %sunkaddr1005, align 4
  br label %is_last_tile-after448

smaller_comparison_index-true464:                 ; preds = %is_last_tile-after448
  %698 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %49
  %699 = getelementptr i8, ptr addrspace(3) %698, i64 64
  %700 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %49
  %701 = getelementptr i8, ptr addrspace(3) %700, i64 64
  %.val635 = load float, ptr addrspace(3) %699, align 4
  %.val636 = load float, ptr addrspace(3) %698, align 4
  %.val637 = load i32, ptr addrspace(3) %701, align 4
  %.val638 = load i32, ptr addrspace(3) %700, align 4
  %compare.132.0.i943 = fcmp uno float %.val635, 0.000000e+00
  %compare.131.0.i944 = fcmp oeq float %.val635, 0.000000e+00
  %702 = select i1 %compare.131.0.i944, float 0.000000e+00, float %.val635
  %703 = select i1 %compare.132.0.i943, float 0x7FF8000000000000, float %702
  %704 = bitcast float %703 to i32
  %705 = icmp slt i32 %704, 0
  %706 = xor i32 %704, 2147483647
  %707 = select i1 %705, i32 %706, i32 %704
  %compare.134.0.i945 = fcmp uno float %.val636, 0.000000e+00
  %compare.133.0.i946 = fcmp oeq float %.val636, 0.000000e+00
  %708 = select i1 %compare.133.0.i946, float 0.000000e+00, float %.val636
  %709 = select i1 %compare.134.0.i945, float 0x7FF8000000000000, float %708
  %710 = bitcast float %709 to i32
  %711 = icmp slt i32 %710, 0
  %712 = xor i32 %710, 2147483647
  %713 = select i1 %711, i32 %712, i32 %710
  %714 = icmp sge i32 %707, %713
  %.not.i947 = icmp eq i32 %713, %707
  %715 = icmp sge i32 %.val637, %.val638
  %.v.i948 = select i1 %.not.i947, i1 %715, i1 %714
  br i1 %.v.i948, label %is_last_tile-after463, label %is_smaller_than-true468

is_smaller_than-true468:                          ; preds = %smaller_comparison_index-true464
  store float %.val635, ptr addrspace(3) %698, align 4
  %sunkaddr1006 = getelementptr i8, ptr addrspace(3) %698, i64 64
  store float %.val636, ptr addrspace(3) %sunkaddr1006, align 4
  store i32 %.val637, ptr addrspace(3) %700, align 4
  %sunkaddr1007 = getelementptr i8, ptr addrspace(3) %700, i64 64
  store i32 %.val638, ptr addrspace(3) %sunkaddr1007, align 4
  br label %is_last_tile-after463

smaller_comparison_index-true479:                 ; preds = %is_last_tile-after463
  %716 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %38
  %717 = getelementptr i8, ptr addrspace(3) %716, i64 32
  %718 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %38
  %719 = getelementptr i8, ptr addrspace(3) %718, i64 32
  %.val631 = load float, ptr addrspace(3) %717, align 4
  %.val632 = load float, ptr addrspace(3) %716, align 4
  %.val633 = load i32, ptr addrspace(3) %719, align 4
  %.val634 = load i32, ptr addrspace(3) %718, align 4
  %compare.132.0.i949 = fcmp uno float %.val631, 0.000000e+00
  %compare.131.0.i950 = fcmp oeq float %.val631, 0.000000e+00
  %720 = select i1 %compare.131.0.i950, float 0.000000e+00, float %.val631
  %721 = select i1 %compare.132.0.i949, float 0x7FF8000000000000, float %720
  %722 = bitcast float %721 to i32
  %723 = icmp slt i32 %722, 0
  %724 = xor i32 %722, 2147483647
  %725 = select i1 %723, i32 %724, i32 %722
  %compare.134.0.i951 = fcmp uno float %.val632, 0.000000e+00
  %compare.133.0.i952 = fcmp oeq float %.val632, 0.000000e+00
  %726 = select i1 %compare.133.0.i952, float 0.000000e+00, float %.val632
  %727 = select i1 %compare.134.0.i951, float 0x7FF8000000000000, float %726
  %728 = bitcast float %727 to i32
  %729 = icmp slt i32 %728, 0
  %730 = xor i32 %728, 2147483647
  %731 = select i1 %729, i32 %730, i32 %728
  %732 = icmp sge i32 %725, %731
  %.not.i953 = icmp eq i32 %731, %725
  %733 = icmp sge i32 %.val633, %.val634
  %.v.i954 = select i1 %.not.i953, i1 %733, i1 %732
  br i1 %.v.i954, label %is_last_tile-after478, label %is_smaller_than-true483

is_smaller_than-true483:                          ; preds = %smaller_comparison_index-true479
  store float %.val631, ptr addrspace(3) %716, align 4
  %sunkaddr1008 = getelementptr i8, ptr addrspace(3) %716, i64 32
  store float %.val632, ptr addrspace(3) %sunkaddr1008, align 4
  store i32 %.val633, ptr addrspace(3) %718, align 4
  %sunkaddr1009 = getelementptr i8, ptr addrspace(3) %718, i64 32
  store i32 %.val634, ptr addrspace(3) %sunkaddr1009, align 4
  br label %is_last_tile-after478

smaller_comparison_index-true494:                 ; preds = %is_last_tile-after478
  %734 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %28
  %735 = getelementptr i8, ptr addrspace(3) %734, i64 16
  %736 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %28
  %737 = getelementptr i8, ptr addrspace(3) %736, i64 16
  %.val627 = load float, ptr addrspace(3) %735, align 4
  %.val628 = load float, ptr addrspace(3) %734, align 4
  %.val629 = load i32, ptr addrspace(3) %737, align 4
  %.val630 = load i32, ptr addrspace(3) %736, align 4
  %compare.132.0.i955 = fcmp uno float %.val627, 0.000000e+00
  %compare.131.0.i956 = fcmp oeq float %.val627, 0.000000e+00
  %738 = select i1 %compare.131.0.i956, float 0.000000e+00, float %.val627
  %739 = select i1 %compare.132.0.i955, float 0x7FF8000000000000, float %738
  %740 = bitcast float %739 to i32
  %741 = icmp slt i32 %740, 0
  %742 = xor i32 %740, 2147483647
  %743 = select i1 %741, i32 %742, i32 %740
  %compare.134.0.i957 = fcmp uno float %.val628, 0.000000e+00
  %compare.133.0.i958 = fcmp oeq float %.val628, 0.000000e+00
  %744 = select i1 %compare.133.0.i958, float 0.000000e+00, float %.val628
  %745 = select i1 %compare.134.0.i957, float 0x7FF8000000000000, float %744
  %746 = bitcast float %745 to i32
  %747 = icmp slt i32 %746, 0
  %748 = xor i32 %746, 2147483647
  %749 = select i1 %747, i32 %748, i32 %746
  %750 = icmp sge i32 %743, %749
  %.not.i959 = icmp eq i32 %749, %743
  %751 = icmp sge i32 %.val629, %.val630
  %.v.i960 = select i1 %.not.i959, i1 %751, i1 %750
  br i1 %.v.i960, label %is_last_tile-after493, label %is_smaller_than-true498

is_smaller_than-true498:                          ; preds = %smaller_comparison_index-true494
  store float %.val627, ptr addrspace(3) %734, align 4
  %sunkaddr1010 = getelementptr i8, ptr addrspace(3) %734, i64 16
  store float %.val628, ptr addrspace(3) %sunkaddr1010, align 4
  store i32 %.val629, ptr addrspace(3) %736, align 4
  %sunkaddr1011 = getelementptr i8, ptr addrspace(3) %736, i64 16
  store i32 %.val630, ptr addrspace(3) %sunkaddr1011, align 4
  br label %is_last_tile-after493

smaller_comparison_index-true509:                 ; preds = %is_last_tile-after493
  %752 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %20
  %753 = getelementptr i8, ptr addrspace(3) %752, i64 8
  %754 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %20
  %755 = getelementptr i8, ptr addrspace(3) %754, i64 8
  %.val623 = load float, ptr addrspace(3) %753, align 4
  %.val624 = load float, ptr addrspace(3) %752, align 4
  %.val625 = load i32, ptr addrspace(3) %755, align 4
  %.val626 = load i32, ptr addrspace(3) %754, align 4
  %compare.132.0.i961 = fcmp uno float %.val623, 0.000000e+00
  %compare.131.0.i962 = fcmp oeq float %.val623, 0.000000e+00
  %756 = select i1 %compare.131.0.i962, float 0.000000e+00, float %.val623
  %757 = select i1 %compare.132.0.i961, float 0x7FF8000000000000, float %756
  %758 = bitcast float %757 to i32
  %759 = icmp slt i32 %758, 0
  %760 = xor i32 %758, 2147483647
  %761 = select i1 %759, i32 %760, i32 %758
  %compare.134.0.i963 = fcmp uno float %.val624, 0.000000e+00
  %compare.133.0.i964 = fcmp oeq float %.val624, 0.000000e+00
  %762 = select i1 %compare.133.0.i964, float 0.000000e+00, float %.val624
  %763 = select i1 %compare.134.0.i963, float 0x7FF8000000000000, float %762
  %764 = bitcast float %763 to i32
  %765 = icmp slt i32 %764, 0
  %766 = xor i32 %764, 2147483647
  %767 = select i1 %765, i32 %766, i32 %764
  %768 = icmp sge i32 %761, %767
  %.not.i965 = icmp eq i32 %767, %761
  %769 = icmp sge i32 %.val625, %.val626
  %.v.i966 = select i1 %.not.i965, i1 %769, i1 %768
  br i1 %.v.i966, label %is_last_tile-after508, label %is_smaller_than-true513

is_smaller_than-true513:                          ; preds = %smaller_comparison_index-true509
  store float %.val623, ptr addrspace(3) %752, align 4
  %sunkaddr1012 = getelementptr i8, ptr addrspace(3) %752, i64 8
  store float %.val624, ptr addrspace(3) %sunkaddr1012, align 4
  store i32 %.val625, ptr addrspace(3) %754, align 4
  %sunkaddr1013 = getelementptr i8, ptr addrspace(3) %754, i64 8
  store i32 %.val626, ptr addrspace(3) %sunkaddr1013, align 4
  br label %is_last_tile-after508

smaller_comparison_index-true524:                 ; preds = %is_last_tile-after508
  %770 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %771 = getelementptr i8, ptr addrspace(3) %770, i64 4
  %772 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %773 = getelementptr i8, ptr addrspace(3) %772, i64 4
  %.val = load float, ptr addrspace(3) %771, align 4
  %.val620 = load float, ptr addrspace(3) %770, align 4
  %.val621 = load i32, ptr addrspace(3) %773, align 4
  %.val622 = load i32, ptr addrspace(3) %772, align 4
  %compare.132.0.i967 = fcmp uno float %.val, 0.000000e+00
  %compare.131.0.i968 = fcmp oeq float %.val, 0.000000e+00
  %774 = select i1 %compare.131.0.i968, float 0.000000e+00, float %.val
  %775 = select i1 %compare.132.0.i967, float 0x7FF8000000000000, float %774
  %776 = bitcast float %775 to i32
  %777 = icmp slt i32 %776, 0
  %778 = xor i32 %776, 2147483647
  %779 = select i1 %777, i32 %778, i32 %776
  %compare.134.0.i969 = fcmp uno float %.val620, 0.000000e+00
  %compare.133.0.i970 = fcmp oeq float %.val620, 0.000000e+00
  %780 = select i1 %compare.133.0.i970, float 0.000000e+00, float %.val620
  %781 = select i1 %compare.134.0.i969, float 0x7FF8000000000000, float %780
  %782 = bitcast float %781 to i32
  %783 = icmp slt i32 %782, 0
  %784 = xor i32 %782, 2147483647
  %785 = select i1 %783, i32 %784, i32 %782
  %786 = icmp sge i32 %779, %785
  %.not.i971 = icmp eq i32 %785, %779
  %787 = icmp sge i32 %.val621, %.val622
  %.v.i972 = select i1 %.not.i971, i1 %787, i1 %786
  br i1 %.v.i972, label %is_last_tile-after523, label %is_smaller_than-true528

is_smaller_than-true528:                          ; preds = %smaller_comparison_index-true524
  %788 = insertelement <2 x float> poison, float %.val, i32 0
  %789 = insertelement <2 x float> %788, float %.val620, i32 1
  store <2 x float> %789, ptr addrspace(3) %770, align 8
  %790 = insertelement <2 x i32> poison, i32 %.val621, i32 0
  %791 = insertelement <2 x i32> %790, i32 %.val622, i32 1
  store <2 x i32> %791, ptr addrspace(3) %772, align 8
  br label %is_last_tile-after523

smaller_keys_index-true536:                       ; preds = %is_last_tile-after523
  %792 = getelementptr [256 x float], ptr addrspace(3) @"sort_$_6_$_0_tile_param_0", i64 0, i64 %9
  %793 = load float, ptr addrspace(3) %792, align 8
  %794 = getelementptr inbounds [1536 x [165 x float]], ptr addrspace(1) %1, i64 0, i64 %5, i64 %7
  store float %793, ptr addrspace(1) %794, align 4
  %795 = or disjoint i64 %7, 1
  %796 = icmp samesign ult i64 %795, 165
  br i1 %796, label %inner_smaller_keys_index-true538, label %sort.6.0.in_bounds-after.critedge

inner_smaller_keys_index-true538:                 ; preds = %smaller_keys_index-true536
  %797 = getelementptr inbounds i8, ptr addrspace(1) %794, i64 4
  %798 = getelementptr i8, ptr addrspace(3) %792, i64 4
  %799 = load float, ptr addrspace(3) %798, align 4
  store float %799, ptr addrspace(1) %797, align 4
  %800 = getelementptr [256 x i32], ptr addrspace(3) @"sort_$_6_$_0_tile_param_1", i64 0, i64 %9
  %801 = load <2 x i32>, ptr addrspace(3) %800, align 8
  %802 = extractelement <2 x i32> %801, i32 0
  %803 = extractelement <2 x i32> %801, i32 1
  %804 = getelementptr inbounds [1536 x [165 x i32]], ptr addrspace(1) %0, i64 0, i64 %5, i64 %7
  store i32 %802, ptr addrspace(1) %804, align 4
  %805 = getelementptr inbounds i8, ptr addrspace(1) %804, i64 4
  store i32 %803, ptr addrspace(1) %805, align 4
  br label %sort.6.0.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_broadcast_compare_gather_select_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(6144) %0, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %1, ptr noalias readonly align 256 captures(none) dereferenceable(1013760) %2, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %3, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(1536) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(1536) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %8, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %9, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %10) local_unnamed_addr #0 {
  %12 = addrspacecast ptr %1 to ptr addrspace(1)
  %13 = addrspacecast ptr %0 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %3 to ptr addrspace(1)
  %16 = addrspacecast ptr %2 to ptr addrspace(1)
  %17 = addrspacecast ptr %5 to ptr addrspace(1)
  %18 = addrspacecast ptr %6 to ptr addrspace(1)
  %19 = addrspacecast ptr %7 to ptr addrspace(1)
  %20 = addrspacecast ptr %8 to ptr addrspace(1)
  %21 = addrspacecast ptr %9 to ptr addrspace(1)
  %22 = addrspacecast ptr %10 to ptr addrspace(1)
  %23 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %24 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %25 = shl nuw nsw i32 %23, 7
  %26 = or disjoint i32 %25, %24
  %27 = mul nuw nsw i32 %24, 14
  %28 = mul nuw nsw i32 %23, 1792
  %29 = add nuw nsw i32 %27, %28
  %30 = zext nneg i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %30
  %32 = load <2 x i32>, ptr addrspace(1) %31, align 8, !invariant.load !4
  %33 = extractelement <2 x i32> %32, i32 0
  %34 = extractelement <2 x i32> %32, i32 1
  %35 = tail call i32 @llvm.smax.i32(i32 %33, i32 %34)
  %36 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 8
  %37 = load <2 x i32>, ptr addrspace(1) %36, align 8, !invariant.load !4
  %38 = extractelement <2 x i32> %37, i32 0
  %39 = extractelement <2 x i32> %37, i32 1
  %40 = tail call i32 @llvm.smax.i32(i32 %35, i32 %38)
  %41 = tail call i32 @llvm.smax.i32(i32 %40, i32 %39)
  %42 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 16
  %43 = load <2 x i32>, ptr addrspace(1) %42, align 8, !invariant.load !4
  %44 = extractelement <2 x i32> %43, i32 0
  %45 = extractelement <2 x i32> %43, i32 1
  %46 = tail call i32 @llvm.smax.i32(i32 %41, i32 %44)
  %47 = tail call i32 @llvm.smax.i32(i32 %46, i32 %45)
  %48 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 24
  %49 = load <2 x i32>, ptr addrspace(1) %48, align 8, !invariant.load !4
  %50 = extractelement <2 x i32> %49, i32 0
  %51 = extractelement <2 x i32> %49, i32 1
  %52 = tail call i32 @llvm.smax.i32(i32 %47, i32 %50)
  %53 = tail call i32 @llvm.smax.i32(i32 %52, i32 %51)
  %54 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 32
  %55 = load <2 x i32>, ptr addrspace(1) %54, align 8, !invariant.load !4
  %56 = extractelement <2 x i32> %55, i32 0
  %57 = extractelement <2 x i32> %55, i32 1
  %58 = tail call i32 @llvm.smax.i32(i32 %53, i32 %56)
  %59 = tail call i32 @llvm.smax.i32(i32 %58, i32 %57)
  %60 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 40
  %61 = load <2 x i32>, ptr addrspace(1) %60, align 8, !invariant.load !4
  %62 = extractelement <2 x i32> %61, i32 0
  %63 = extractelement <2 x i32> %61, i32 1
  %64 = tail call i32 @llvm.smax.i32(i32 %59, i32 %62)
  %65 = tail call i32 @llvm.smax.i32(i32 %64, i32 %63)
  %66 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 48
  %67 = load <2 x i32>, ptr addrspace(1) %66, align 8, !invariant.load !4
  %68 = extractelement <2 x i32> %67, i32 0
  %69 = extractelement <2 x i32> %67, i32 1
  %70 = tail call i32 @llvm.smax.i32(i32 %65, i32 %68)
  %71 = tail call i32 @llvm.smax.i32(i32 %70, i32 %69)
  %72 = icmp sgt i32 %71, -10000
  %73 = zext nneg i32 %26 to i64
  %74 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %73
  %75 = load i32, ptr addrspace(1) %74, align 4, !invariant.load !4
  %76 = select i1 %72, i32 %75, i32 -1
  %77 = icmp sgt i32 %76, -1
  %78 = zext i1 %77 to i8
  %79 = icmp sgt i32 %76, 6
  %80 = zext i1 %79 to i32
  %81 = xor i1 %79, true
  %82 = zext i1 %81 to i8
  %83 = tail call i32 @llvm.umin.i32(i32 %26, i32 1535)
  %84 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %73
  %85 = load i32, ptr addrspace(1) %84, align 4, !invariant.load !4, !alias.scope !165
  %86 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %73
  %87 = load i32, ptr addrspace(1) %86, align 4, !invariant.load !4, !alias.scope !172
  %88 = add i32 %87, %85
  %89 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %87, i32 13)
  %90 = xor i32 %88, %89
  %91 = add i32 %90, %88
  %92 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %90, i32 15)
  %93 = xor i32 %91, %92
  %94 = add i32 %93, %91
  %95 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %93, i32 26)
  %96 = xor i32 %94, %95
  %97 = add i32 %96, %94
  %98 = add i32 %97, %87
  %99 = tail call i32 @llvm.fshl.i32(i32 %96, i32 %96, i32 6)
  %100 = xor i32 %97, %99
  %101 = xor i32 %85, %87
  %102 = xor i32 %101, 466688986
  %103 = add i32 %102, 1
  %104 = add i32 %103, %100
  %105 = add i32 %98, %104
  %106 = tail call i32 @llvm.fshl.i32(i32 %104, i32 %104, i32 17)
  %107 = xor i32 %105, %106
  %108 = add i32 %107, %105
  %109 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 29)
  %110 = xor i32 %108, %109
  %111 = add i32 %110, %108
  %112 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %110, i32 16)
  %113 = xor i32 %111, %112
  %114 = add i32 %113, %111
  %115 = add i32 %114, %102
  %116 = tail call i32 @llvm.fshl.i32(i32 %113, i32 %113, i32 24)
  %117 = xor i32 %114, %116
  %118 = add i32 %85, 2
  %119 = add i32 %118, %117
  %120 = add i32 %115, %119
  %121 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %119, i32 13)
  %122 = xor i32 %120, %121
  %123 = add i32 %122, %120
  %124 = tail call i32 @llvm.fshl.i32(i32 %122, i32 %122, i32 15)
  %125 = xor i32 %123, %124
  %126 = add i32 %125, %123
  %127 = tail call i32 @llvm.fshl.i32(i32 %125, i32 %125, i32 26)
  %128 = xor i32 %126, %127
  %129 = add i32 %128, %126
  %130 = add i32 %129, %85
  %131 = tail call i32 @llvm.fshl.i32(i32 %128, i32 %128, i32 6)
  %132 = xor i32 %129, %131
  %133 = add i32 %87, 3
  %134 = add i32 %133, %132
  %135 = add i32 %130, %134
  %136 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 17)
  %137 = xor i32 %135, %136
  %138 = add i32 %137, %135
  %139 = tail call i32 @llvm.fshl.i32(i32 %137, i32 %137, i32 29)
  %140 = xor i32 %138, %139
  %141 = add i32 %140, %138
  %142 = tail call i32 @llvm.fshl.i32(i32 %140, i32 %140, i32 16)
  %143 = xor i32 %141, %142
  %144 = add i32 %143, %141
  %145 = add i32 %144, %87
  %146 = tail call i32 @llvm.fshl.i32(i32 %143, i32 %143, i32 24)
  %147 = xor i32 %144, %146
  %148 = add i32 %102, 4
  %149 = add i32 %148, %147
  %150 = add i32 %145, %149
  %151 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 13)
  %152 = xor i32 %150, %151
  %153 = add i32 %152, %150
  %154 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %152, i32 15)
  %155 = xor i32 %153, %154
  %156 = add i32 %155, %153
  %157 = tail call i32 @llvm.fshl.i32(i32 %155, i32 %155, i32 26)
  %158 = xor i32 %156, %157
  %159 = add i32 %158, %156
  %160 = add i32 %159, %102
  %161 = tail call i32 @llvm.fshl.i32(i32 %158, i32 %158, i32 6)
  %162 = xor i32 %159, %161
  %163 = add i32 %85, 5
  %164 = add i32 %163, %162
  %165 = xor i32 %164, %160
  %166 = urem i32 %165, 9
  %167 = shl nuw nsw i32 %166, 2
  %168 = getelementptr inbounds i8, ptr addrspace(1) %84, i64 6144
  %169 = load i32, ptr addrspace(1) %168, align 4, !invariant.load !4, !alias.scope !179
  %170 = getelementptr inbounds i8, ptr addrspace(1) %86, i64 6144
  %171 = load i32, ptr addrspace(1) %170, align 4, !invariant.load !4, !alias.scope !186
  %172 = add i32 %171, %169
  %173 = tail call i32 @llvm.fshl.i32(i32 %171, i32 %171, i32 13)
  %174 = xor i32 %172, %173
  %175 = add i32 %174, %172
  %176 = tail call i32 @llvm.fshl.i32(i32 %174, i32 %174, i32 15)
  %177 = xor i32 %175, %176
  %178 = add i32 %177, %175
  %179 = tail call i32 @llvm.fshl.i32(i32 %177, i32 %177, i32 26)
  %180 = xor i32 %178, %179
  %181 = add i32 %180, %178
  %182 = add i32 %181, %171
  %183 = tail call i32 @llvm.fshl.i32(i32 %180, i32 %180, i32 6)
  %184 = xor i32 %181, %183
  %185 = xor i32 %169, %171
  %186 = xor i32 %185, 466688986
  %187 = add i32 %186, 1
  %188 = add i32 %187, %184
  %189 = add i32 %182, %188
  %190 = tail call i32 @llvm.fshl.i32(i32 %188, i32 %188, i32 17)
  %191 = xor i32 %189, %190
  %192 = add i32 %191, %189
  %193 = tail call i32 @llvm.fshl.i32(i32 %191, i32 %191, i32 29)
  %194 = xor i32 %192, %193
  %195 = add i32 %194, %192
  %196 = tail call i32 @llvm.fshl.i32(i32 %194, i32 %194, i32 16)
  %197 = xor i32 %195, %196
  %198 = add i32 %197, %195
  %199 = add i32 %198, %186
  %200 = tail call i32 @llvm.fshl.i32(i32 %197, i32 %197, i32 24)
  %201 = xor i32 %198, %200
  %202 = add i32 %169, 2
  %203 = add i32 %202, %201
  %204 = add i32 %199, %203
  %205 = tail call i32 @llvm.fshl.i32(i32 %203, i32 %203, i32 13)
  %206 = xor i32 %204, %205
  %207 = add i32 %206, %204
  %208 = tail call i32 @llvm.fshl.i32(i32 %206, i32 %206, i32 15)
  %209 = xor i32 %207, %208
  %210 = add i32 %209, %207
  %211 = tail call i32 @llvm.fshl.i32(i32 %209, i32 %209, i32 26)
  %212 = xor i32 %210, %211
  %213 = add i32 %212, %210
  %214 = add i32 %213, %169
  %215 = tail call i32 @llvm.fshl.i32(i32 %212, i32 %212, i32 6)
  %216 = xor i32 %213, %215
  %217 = add i32 %171, 3
  %218 = add i32 %217, %216
  %219 = add i32 %214, %218
  %220 = tail call i32 @llvm.fshl.i32(i32 %218, i32 %218, i32 17)
  %221 = xor i32 %219, %220
  %222 = add i32 %221, %219
  %223 = tail call i32 @llvm.fshl.i32(i32 %221, i32 %221, i32 29)
  %224 = xor i32 %222, %223
  %225 = add i32 %224, %222
  %226 = tail call i32 @llvm.fshl.i32(i32 %224, i32 %224, i32 16)
  %227 = xor i32 %225, %226
  %228 = add i32 %227, %225
  %229 = add i32 %228, %171
  %230 = tail call i32 @llvm.fshl.i32(i32 %227, i32 %227, i32 24)
  %231 = xor i32 %228, %230
  %232 = add i32 %186, 4
  %233 = add i32 %232, %231
  %234 = add i32 %229, %233
  %235 = tail call i32 @llvm.fshl.i32(i32 %233, i32 %233, i32 13)
  %236 = xor i32 %234, %235
  %237 = add i32 %236, %234
  %238 = tail call i32 @llvm.fshl.i32(i32 %236, i32 %236, i32 15)
  %239 = xor i32 %237, %238
  %240 = add i32 %239, %237
  %241 = tail call i32 @llvm.fshl.i32(i32 %239, i32 %239, i32 26)
  %242 = xor i32 %240, %241
  %243 = add i32 %242, %240
  %244 = add i32 %243, %186
  %245 = tail call i32 @llvm.fshl.i32(i32 %242, i32 %242, i32 6)
  %246 = xor i32 %243, %245
  %247 = add i32 %169, 5
  %248 = add i32 %247, %246
  %249 = xor i32 %248, %244
  %250 = urem i32 %249, 9
  %251 = add nuw nsw i32 %250, %167
  %.lhs.trunc = trunc nuw nsw i32 %251 to i8
  %252 = urem i8 %.lhs.trunc, 9
  %narrow = sub nuw nsw i8 -92, %252
  %253 = zext i8 %narrow to i32
  %254 = mul nuw nsw i32 %83, 165
  %255 = add nuw nsw i32 %254, %253
  %256 = zext nneg i32 %255 to i64
  %257 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %256
  %258 = load float, ptr addrspace(1) %257, align 4, !invariant.load !4
  %259 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 %73
  store i8 %78, ptr addrspace(1) %259, align 1
  %260 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %73
  store i32 %80, ptr addrspace(1) %260, align 4
  %261 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 %73
  store i8 %82, ptr addrspace(1) %261, align 1
  %262 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %73
  store i32 %76, ptr addrspace(1) %262, align 4
  %263 = getelementptr inbounds float, ptr addrspace(1) %21, i64 %73
  store float %258, ptr addrspace(1) %263, align 4
  %264 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %73
  store i32 0, ptr addrspace(1) %264, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_and_or_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(165) %1, ptr noalias readonly align 256 captures(none) dereferenceable(1013760) %2, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %0 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %1 to ptr addrspace(1)
  %11 = addrspacecast ptr %4 to ptr addrspace(1)
  %12 = addrspacecast ptr %5 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %15 = shl nuw nsw i32 %14, 2
  %16 = shl nuw nsw i32 %13, 9
  %17 = or disjoint i32 %15, %16
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %18
  %20 = load <4 x i8>, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %18
  %22 = load <4 x float>, ptr addrspace(1) %21, align 16, !invariant.load !4
  %23 = udiv i32 %17, 165
  %24 = mul i32 %23, 165
  %.decomposed = sub i32 %17, %24
  %25 = extractelement <4 x float> %22, i64 0
  %26 = zext nneg i32 %23 to i64
  %27 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %26
  %28 = load float, ptr addrspace(1) %27, align 4, !invariant.load !4
  %29 = fcmp ogt float %25, %28
  %30 = zext nneg i32 %.decomposed to i64
  %31 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %30
  %32 = load i8, ptr addrspace(1) %31, align 1, !invariant.load !4
  %.lhs.trunc = trunc nuw i32 %.decomposed to i8
  %33 = urem i8 %.lhs.trunc, 15
  %.zext = zext nneg i8 %33 to i32
  %34 = add nuw nsw i32 %.zext, 15
  %35 = trunc i8 %32 to i1
  %36 = select i1 %35, i32 %34, i32 %.zext
  %37 = add nsw i32 %36, -3
  %38 = icmp ult i32 %37, 9
  %39 = extractelement <4 x i8> %20, i64 0
  %40 = and i1 %29, %38
  %41 = zext i1 %40 to i8
  %42 = or i8 %39, %41
  %43 = insertelement <4 x i8> poison, i8 %41, i64 0
  %44 = insertelement <4 x i8> poison, i8 %42, i64 0
  %45 = or disjoint i32 %17, 1
  %46 = udiv i32 %45, 165
  %47 = mul i32 %46, 165
  %.decomposed7 = sub i32 %45, %47
  %48 = extractelement <4 x float> %22, i64 1
  %49 = zext nneg i32 %46 to i64
  %50 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %49
  %51 = load float, ptr addrspace(1) %50, align 4, !invariant.load !4
  %52 = fcmp ogt float %48, %51
  %53 = zext nneg i32 %.decomposed7 to i64
  %54 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %53
  %55 = load i8, ptr addrspace(1) %54, align 1, !invariant.load !4
  %.lhs.trunc1 = trunc nuw i32 %.decomposed7 to i8
  %56 = urem i8 %.lhs.trunc1, 15
  %.zext2 = zext nneg i8 %56 to i32
  %57 = add nuw nsw i32 %.zext2, 15
  %58 = trunc i8 %55 to i1
  %59 = select i1 %58, i32 %57, i32 %.zext2
  %60 = add nsw i32 %59, -3
  %61 = icmp ult i32 %60, 9
  %62 = extractelement <4 x i8> %20, i64 1
  %63 = and i1 %52, %61
  %64 = zext i1 %63 to i8
  %65 = or i8 %62, %64
  %66 = insertelement <4 x i8> %43, i8 %64, i64 1
  %67 = insertelement <4 x i8> %44, i8 %65, i64 1
  %68 = or disjoint i32 %17, 2
  %69 = udiv i32 %68, 165
  %70 = mul i32 %69, 165
  %.decomposed8 = sub i32 %68, %70
  %71 = extractelement <4 x float> %22, i64 2
  %72 = zext nneg i32 %69 to i64
  %73 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %72
  %74 = load float, ptr addrspace(1) %73, align 4, !invariant.load !4
  %75 = fcmp ogt float %71, %74
  %76 = zext nneg i32 %.decomposed8 to i64
  %77 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %76
  %78 = load i8, ptr addrspace(1) %77, align 1, !invariant.load !4
  %.lhs.trunc3 = trunc nuw i32 %.decomposed8 to i8
  %79 = urem i8 %.lhs.trunc3, 15
  %.zext4 = zext nneg i8 %79 to i32
  %80 = add nuw nsw i32 %.zext4, 15
  %81 = trunc i8 %78 to i1
  %82 = select i1 %81, i32 %80, i32 %.zext4
  %83 = add nsw i32 %82, -3
  %84 = icmp ult i32 %83, 9
  %85 = extractelement <4 x i8> %20, i64 2
  %86 = and i1 %75, %84
  %87 = zext i1 %86 to i8
  %88 = or i8 %85, %87
  %89 = insertelement <4 x i8> %66, i8 %87, i64 2
  %90 = insertelement <4 x i8> %67, i8 %88, i64 2
  %91 = or disjoint i32 %17, 3
  %92 = udiv i32 %91, 165
  %93 = mul i32 %92, 165
  %.decomposed9 = sub i32 %91, %93
  %94 = extractelement <4 x float> %22, i64 3
  %95 = zext nneg i32 %92 to i64
  %96 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %95
  %97 = load float, ptr addrspace(1) %96, align 4, !invariant.load !4
  %98 = fcmp ogt float %94, %97
  %99 = zext nneg i32 %.decomposed9 to i64
  %100 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %99
  %101 = load i8, ptr addrspace(1) %100, align 1, !invariant.load !4
  %.lhs.trunc5 = trunc nuw i32 %.decomposed9 to i8
  %102 = urem i8 %.lhs.trunc5, 15
  %.zext6 = zext nneg i8 %102 to i32
  %103 = add nuw nsw i32 %.zext6, 15
  %104 = trunc i8 %101 to i1
  %105 = select i1 %104, i32 %103, i32 %.zext6
  %106 = add nsw i32 %105, -3
  %107 = icmp ult i32 %106, 9
  %108 = extractelement <4 x i8> %20, i64 3
  %109 = and i1 %98, %107
  %110 = zext i1 %109 to i8
  %111 = or i8 %108, %110
  %112 = insertelement <4 x i8> %89, i8 %110, i64 3
  %113 = insertelement <4 x i8> %90, i8 %111, i64 3
  %114 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %18
  store <4 x i8> %113, ptr addrspace(1) %114, align 4
  %115 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %18
  store <4 x i8> %112, ptr addrspace(1) %115, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_concatenate_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(6144) %0, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %9 = shl nuw nsw i32 %8, 7
  %10 = or disjoint i32 %9, %7
  %11 = shl nuw nsw i32 %7, 1
  %12 = shl nuw nsw i32 %8, 8
  %13 = or disjoint i32 %11, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %14
  %16 = zext nneg i32 %10 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %16
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !4
  %19 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %16
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = icmp slt i32 %20, %18
  %22 = add i32 %20, 14
  %23 = select i1 %21, i32 %22, i32 %20
  %24 = insertelement <2 x i32> poison, i32 %10, i32 0
  %25 = insertelement <2 x i32> %24, i32 %23, i32 1
  store <2 x i32> %25, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_32(ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %1, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %2, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %3) local_unnamed_addr #2 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %11 = shl nuw nsw i32 %10, 7
  %12 = or disjoint i32 %11, %9
  tail call void @llvm.experimental.noalias.scope.decl(metadata !193)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !196)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !198)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %13
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !193, !noalias !200
  %16 = shl nuw nsw i32 %12, 1
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %17
  %19 = load <2 x i32>, ptr addrspace(1) %18, align 8, !invariant.load !4, !alias.scope !198, !noalias !201
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %23 = tail call i32 @llvm.umin.i32(i32 %22, i32 1535)
  %24 = tail call i32 @llvm.smax.i32(i32 %21, i32 0)
  %25 = tail call i32 @llvm.umin.i32(i32 %24, i32 13)
  %26 = mul nuw nsw i32 %23, 14
  %27 = add nuw nsw i32 %26, %25
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4, !alias.scope !196, !noalias !202
  %31 = icmp slt i32 %30, %15
  %32 = add i32 %30, 165
  %33 = select i1 %31, i32 %32, i32 %30
  %34 = icmp ult i32 %33, 165
  %35 = mul nuw nsw i32 %12, 165
  %36 = add nuw nsw i32 %33, %35
  %37 = zext nneg i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %37
  br i1 %34, label %39, label %40

39:                                               ; preds = %4
  store i8 0, ptr addrspace(1) %38, align 1
  br label %40

40:                                               ; preds = %39, %4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_concatenate_fusion_2(ptr noalias readonly align 256 captures(none) dereferenceable(6144) %0, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %0 to ptr addrspace(1)
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %9 = shl nuw nsw i32 %8, 7
  %10 = or disjoint i32 %9, %7
  %11 = shl nuw nsw i32 %7, 1
  %12 = shl nuw nsw i32 %8, 8
  %13 = or disjoint i32 %11, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %14
  %16 = zext nneg i32 %10 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %16
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !4
  %19 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %16
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = tail call i32 @llvm.smax.i32(i32 %18, i32 %20)
  %22 = tail call i32 @llvm.smin.i32(i32 %21, i32 13)
  %23 = icmp sgt i32 %18, 13
  %24 = add nsw i32 %22, 14
  %25 = select i1 %23, i32 %24, i32 %22
  %26 = insertelement <2 x i32> poison, i32 %10, i32 0
  %27 = insertelement <2 x i32> %26, i32 %25, i32 1
  store <2 x i32> %27, ptr addrspace(1) %15, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion(ptr noalias writeonly align 256 captures(none) dereferenceable(86016) %0) local_unnamed_addr #3 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %3, 7
  %6 = or disjoint i32 %5, %4
  %7 = urem i32 %6, 14
  %8 = icmp samesign ugt i32 %7, 6
  %9 = zext i1 %8 to i32
  %10 = zext nneg i32 %6 to i64
  %11 = getelementptr inbounds i32, ptr addrspace(1) %2, i64 %10
  store i32 %9, ptr addrspace(1) %11, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_compare_gather_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(12288) %0, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %1, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %2, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %3, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(1536) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(6144) %7) local_unnamed_addr #0 {
  %9 = addrspacecast ptr %0 to ptr addrspace(1)
  %10 = addrspacecast ptr %2 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %3 to ptr addrspace(1)
  %13 = addrspacecast ptr %4 to ptr addrspace(1)
  %14 = addrspacecast ptr %5 to ptr addrspace(1)
  %15 = addrspacecast ptr %6 to ptr addrspace(1)
  %16 = addrspacecast ptr %7 to ptr addrspace(1)
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %19 = shl nuw nsw i32 %17, 7
  %20 = or disjoint i32 %19, %18
  %21 = shl nuw nsw i32 %18, 1
  %22 = shl nuw nsw i32 %17, 8
  %23 = or disjoint i32 %21, %22
  %24 = zext nneg i32 %23 to i64
  %25 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %24
  %26 = load <2 x i32>, ptr addrspace(1) %25, align 8, !invariant.load !4
  %27 = extractelement <2 x i32> %26, i32 0
  %28 = extractelement <2 x i32> %26, i32 1
  %29 = tail call i32 @llvm.smax.i32(i32 %27, i32 0)
  %30 = tail call i32 @llvm.umin.i32(i32 %29, i32 1535)
  %31 = tail call i32 @llvm.smax.i32(i32 %28, i32 0)
  %32 = tail call i32 @llvm.umin.i32(i32 %31, i32 13)
  %33 = mul nuw nsw i32 %30, 14
  %34 = add nuw nsw i32 %33, %32
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %35
  %37 = load i32, ptr addrspace(1) %36, align 4, !invariant.load !4
  %38 = icmp slt i32 %37, 0
  %39 = add i32 %37, 101
  %40 = select i1 %38, i32 %39, i32 %37
  %41 = tail call i32 @llvm.smax.i32(i32 %40, i32 0)
  %42 = tail call i32 @llvm.umin.i32(i32 %41, i32 100)
  %43 = mul nuw nsw i32 %42, 20
  %44 = zext nneg i32 %43 to i64
  %45 = getelementptr inbounds float, ptr addrspace(1) %11, i64 %44
  %46 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 20
  %47 = load float, ptr addrspace(1) %46, align 4, !invariant.load !4
  %.inv = fcmp ole float %47, 0xC1E0000000000000
  %48 = select i1 %.inv, float 0xC1E0000000000000, float %47
  %49 = fptosi float %48 to i32
  %50 = fcmp oge float %47, 0x41E0000000000000
  %51 = select i1 %50, i32 2147483647, i32 %49
  %52 = fcmp uno float %47, 0.000000e+00
  %53 = select i1 %52, i32 0, i32 %51
  %54 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %35
  %55 = load i32, ptr addrspace(1) %54, align 4, !invariant.load !4
  %56 = icmp eq i32 %55, 0
  %57 = zext i1 %56 to i8
  %58 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %24
  %59 = load <2 x i32>, ptr addrspace(1) %58, align 8, !invariant.load !4
  %60 = extractelement <2 x i32> %59, i32 0
  %61 = extractelement <2 x i32> %59, i32 1
  %62 = tail call i32 @llvm.smax.i32(i32 %60, i32 0)
  %63 = tail call i32 @llvm.umin.i32(i32 %62, i32 1535)
  %64 = tail call i32 @llvm.smax.i32(i32 %61, i32 0)
  %65 = tail call i32 @llvm.umin.i32(i32 %64, i32 13)
  %66 = mul nuw nsw i32 %63, 14
  %67 = add nuw nsw i32 %66, %65
  %68 = zext nneg i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %68
  %70 = load i32, ptr addrspace(1) %69, align 4, !invariant.load !4
  %71 = icmp slt i32 %70, 0
  %72 = add i32 %70, 101
  %73 = select i1 %71, i32 %72, i32 %70
  %74 = tail call i32 @llvm.smax.i32(i32 %73, i32 0)
  %75 = tail call i32 @llvm.umin.i32(i32 %74, i32 100)
  %76 = mul nuw nsw i32 %75, 20
  %77 = zext nneg i32 %76 to i64
  %78 = getelementptr inbounds float, ptr addrspace(1) %11, i64 %77
  %79 = getelementptr inbounds i8, ptr addrspace(1) %78, i64 20
  %80 = load float, ptr addrspace(1) %79, align 4, !invariant.load !4
  %.inv1 = fcmp ole float %80, 0xC1E0000000000000
  %81 = select i1 %.inv1, float 0xC1E0000000000000, float %80
  %82 = fptosi float %81 to i32
  %83 = fcmp oge float %80, 0x41E0000000000000
  %84 = select i1 %83, i32 2147483647, i32 %82
  %85 = fcmp uno float %80, 0.000000e+00
  %86 = select i1 %85, i32 0, i32 %84
  %87 = zext nneg i32 %20 to i64
  %88 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %87
  store i32 %53, ptr addrspace(1) %88, align 4
  %89 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 %87
  store i8 %57, ptr addrspace(1) %89, align 1
  %90 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %87
  store i32 %86, ptr addrspace(1) %90, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_29(ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %1, ptr noalias readonly align 256 captures(none) dereferenceable(1536) %2, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %3, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %4, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %5, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %6) local_unnamed_addr #2 {
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %6 to ptr addrspace(1)
  %10 = addrspacecast ptr %1 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %5 to ptr addrspace(1)
  %13 = addrspacecast ptr %4 to ptr addrspace(1)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %17 = shl nuw nsw i32 %16, 7
  %18 = or disjoint i32 %17, %15
  tail call void @llvm.experimental.noalias.scope.decl(metadata !203)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !206)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !208)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !210)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !212)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !214)
  %19 = shl nuw nsw i32 %18, 1
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %20
  %22 = load <2 x i32>, ptr addrspace(1) %21, align 8, !invariant.load !4, !alias.scope !208, !noalias !216
  %23 = extractelement <2 x i32> %22, i32 0
  %24 = extractelement <2 x i32> %22, i32 1
  %25 = tail call i32 @llvm.smax.i32(i32 %23, i32 0)
  %26 = tail call i32 @llvm.umin.i32(i32 %25, i32 1535)
  %27 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %28 = tail call i32 @llvm.umin.i32(i32 %27, i32 13)
  %29 = mul nuw nsw i32 %26, 14
  %30 = add nuw nsw i32 %29, %28
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %31
  %33 = load i32, ptr addrspace(1) %32, align 4, !invariant.load !4, !alias.scope !214, !noalias !217
  %34 = srem i32 %33, 15
  %35 = zext nneg i32 %18 to i64
  %36 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %35
  %37 = load i32, ptr addrspace(1) %36, align 4, !invariant.load !4, !alias.scope !203, !noalias !218
  %38 = icmp slt i32 %34, %37
  %39 = add nsw i32 %34, 15
  %40 = select i1 %38, i32 %39, i32 %34
  %41 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %35
  %42 = load i8, ptr addrspace(1) %41, align 1, !invariant.load !4, !alias.scope !206, !noalias !219
  %43 = icmp sgt i32 %40, 0
  %44 = icmp slt i32 %40, 14
  %45 = trunc i8 %42 to i1
  %46 = select i1 %45, i32 -1, i32 1
  %47 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %31
  %48 = load i32, ptr addrspace(1) %47, align 4, !invariant.load !4, !alias.scope !212, !noalias !220
  %49 = icmp slt i32 %48, 0
  %50 = add i32 %48, 101
  %51 = select i1 %49, i32 %50, i32 %48
  %52 = tail call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = tail call i32 @llvm.umin.i32(i32 %52, i32 100)
  %54 = mul nuw nsw i32 %53, 20
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr inbounds float, ptr addrspace(1) %13, i64 %55
  %57 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 36
  %58 = load float, ptr addrspace(1) %57, align 4, !invariant.load !4, !alias.scope !210, !noalias !221
  %59 = fcmp ogt float %58, 0.000000e+00
  %.v.i = select i1 %45, i1 %43, i1 %44
  %60 = add i32 %46, %33
  %61 = and i1 %59, %.v.i
  %62 = tail call i32 @llvm.smax.i32(i32 %37, i32 %60)
  %63 = tail call i32 @llvm.smin.i32(i32 %62, i32 164)
  %64 = select i1 %61, i32 %63, i32 %33
  %65 = icmp slt i32 %64, %37
  %66 = add i32 %64, 165
  %67 = select i1 %65, i32 %66, i32 %64
  %68 = icmp ult i32 %67, 165
  %69 = mul nuw nsw i32 %18, 165
  %70 = add nuw nsw i32 %67, %69
  %71 = zext nneg i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 %71
  br i1 %68, label %73, label %74

73:                                               ; preds = %7
  store i8 0, ptr addrspace(1) %72, align 1
  br label %74

74:                                               ; preds = %73, %7
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_30(ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %1, ptr noalias readonly align 256 captures(none) dereferenceable(1536) %2, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %3, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %4, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %5, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %6) local_unnamed_addr #2 {
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %1 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %6 to ptr addrspace(1)
  %13 = addrspacecast ptr %5 to ptr addrspace(1)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %17 = shl nuw nsw i32 %16, 7
  %18 = or disjoint i32 %17, %15
  tail call void @llvm.experimental.noalias.scope.decl(metadata !222)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !225)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !227)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !229)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !231)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !233)
  %19 = shl nuw nsw i32 %18, 1
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %20
  %22 = load <2 x i32>, ptr addrspace(1) %21, align 8, !invariant.load !4, !alias.scope !229, !noalias !235
  %23 = extractelement <2 x i32> %22, i32 0
  %24 = extractelement <2 x i32> %22, i32 1
  %25 = tail call i32 @llvm.smax.i32(i32 %23, i32 0)
  %26 = tail call i32 @llvm.umin.i32(i32 %25, i32 1535)
  %27 = tail call i32 @llvm.smax.i32(i32 %24, i32 0)
  %28 = tail call i32 @llvm.umin.i32(i32 %27, i32 13)
  %29 = mul nuw nsw i32 %26, 14
  %30 = add nuw nsw i32 %29, %28
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %31
  %33 = load i32, ptr addrspace(1) %32, align 4, !invariant.load !4, !alias.scope !227, !noalias !236
  %34 = srem i32 %33, 15
  %35 = zext nneg i32 %18 to i64
  %36 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %35
  %37 = load i32, ptr addrspace(1) %36, align 4, !invariant.load !4, !alias.scope !222, !noalias !237
  %38 = icmp slt i32 %34, %37
  %39 = add nsw i32 %34, 15
  %40 = select i1 %38, i32 %39, i32 %34
  %41 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %35
  %42 = load i8, ptr addrspace(1) %41, align 1, !invariant.load !4, !alias.scope !225, !noalias !238
  %43 = icmp sgt i32 %40, 0
  %44 = icmp slt i32 %40, 14
  %45 = trunc i8 %42 to i1
  %46 = select i1 %45, i32 -1, i32 1
  %47 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %31
  %48 = load i32, ptr addrspace(1) %47, align 4, !invariant.load !4, !alias.scope !233, !noalias !239
  %49 = icmp slt i32 %48, 0
  %50 = add i32 %48, 101
  %51 = select i1 %49, i32 %50, i32 %48
  %52 = tail call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = tail call i32 @llvm.umin.i32(i32 %52, i32 100)
  %54 = mul nuw nsw i32 %53, 20
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr inbounds float, ptr addrspace(1) %13, i64 %55
  %57 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 36
  %58 = load float, ptr addrspace(1) %57, align 4, !invariant.load !4, !alias.scope !231, !noalias !240
  %59 = fcmp ogt float %58, 0.000000e+00
  %.v.i = select i1 %45, i1 %43, i1 %44
  %60 = add i32 %46, %33
  %61 = and i1 %59, %.v.i
  %62 = tail call i32 @llvm.smax.i32(i32 %37, i32 %60)
  %63 = tail call i32 @llvm.smin.i32(i32 %62, i32 164)
  %64 = select i1 %61, i32 %63, i32 %33
  %65 = icmp slt i32 %64, %37
  %66 = add i32 %64, 165
  %67 = select i1 %65, i32 %66, i32 %64
  %68 = icmp ult i32 %67, 165
  %69 = mul nuw nsw i32 %18, 165
  %70 = add nuw nsw i32 %67, %69
  %71 = zext nneg i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 %71
  br i1 %68, label %73, label %74

73:                                               ; preds = %7
  store i8 0, ptr addrspace(1) %72, align 1
  br label %74

74:                                               ; preds = %73, %7
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_7(ptr noalias writeonly align 256 captures(none) dereferenceable(1013760) %0) local_unnamed_addr #3 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %4, 2
  %6 = shl nuw nsw i32 %3, 9
  %7 = or disjoint i32 %5, %6
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds i32, ptr addrspace(1) %2, i64 %8
  store <4 x i32> splat (i32 -1), ptr addrspace(1) %9, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_8(ptr noalias align 256 captures(none) dereferenceable(1013760) %0, ptr noalias readonly align 256 captures(none) dereferenceable(172032) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2) local_unnamed_addr #8 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = addrspacecast ptr %2 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %9 = shl nuw nsw i32 %7, 1
  %10 = shl nuw nsw i32 %8, 8
  %11 = or disjoint i32 %9, %10
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %12
  %14 = load <2 x i32>, ptr addrspace(1) %13, align 8, !invariant.load !4
  %15 = extractelement <2 x i32> %14, i32 0
  %16 = extractelement <2 x i32> %14, i32 1
  %17 = icmp ult i32 %15, 1536
  %18 = icmp ult i32 %16, 165
  %19 = and i1 %17, %18
  br i1 %19, label %20, label %34

20:                                               ; preds = %3
  %21 = shl nuw nsw i32 %8, 7
  %22 = or disjoint i32 %21, %7
  %23 = urem i32 %22, 14
  %24 = zext nneg i32 %22 to i64
  %25 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %24
  %26 = load i8, ptr addrspace(1) %25, align 1, !invariant.load !4
  %27 = trunc i8 %26 to i1
  %28 = select i1 %27, i32 %23, i32 -1
  %29 = mul nuw nsw i32 %15, 165
  %30 = add nuw nsw i32 %29, %16
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %31
  %33 = atomicrmw max ptr addrspace(1) %32, i32 %28 monotonic, align 4
  br label %34

34:                                               ; preds = %20, %3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_7(ptr noalias align 256 captures(none) dereferenceable(1013760) %0, ptr noalias readonly align 256 captures(none) dereferenceable(172032) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %4) local_unnamed_addr #8 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %13 = shl nuw nsw i32 %11, 1
  %14 = shl nuw nsw i32 %12, 8
  %15 = or disjoint i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %16
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !4
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = icmp ult i32 %19, 1536
  %22 = icmp ult i32 %20, 165
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %52

24:                                               ; preds = %5
  %25 = shl nuw nsw i32 %12, 7
  %26 = or disjoint i32 %25, %11
  %27 = urem i32 %26, 14
  %28 = zext nneg i32 %26 to i64
  %29 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %28
  %30 = load i8, ptr addrspace(1) %29, align 1, !invariant.load !4
  %31 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %28
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4
  %33 = icmp slt i32 %32, 0
  %34 = add i32 %32, 101
  %35 = select i1 %33, i32 %34, i32 %32
  %36 = tail call i32 @llvm.smax.i32(i32 %35, i32 0)
  %37 = tail call i32 @llvm.umin.i32(i32 %36, i32 100)
  %38 = mul nuw nsw i32 %37, 20
  %39 = zext nneg i32 %38 to i64
  %40 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %39
  %41 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 36
  %42 = load float, ptr addrspace(1) %41, align 4, !invariant.load !4
  %43 = fcmp ogt float %42, 0.000000e+00
  %44 = trunc i8 %30 to i1
  %45 = select i1 %43, i1 %44, i1 false
  %46 = select i1 %45, i32 %27, i32 -1
  %47 = mul nuw nsw i32 %19, 165
  %48 = add nuw nsw i32 %47, %20
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %49
  %51 = atomicrmw max ptr addrspace(1) %50, i32 %46 monotonic, align 4
  br label %52

52:                                               ; preds = %24, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_and_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(86016) %0, ptr noalias readonly align 256 captures(none) dereferenceable(1013760) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %0 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %2 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %13 = shl nuw nsw i32 %12, 2
  %14 = shl nuw nsw i32 %11, 9
  %15 = or disjoint i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %16
  %18 = load <4 x i32>, ptr addrspace(1) %17, align 16, !invariant.load !4
  %19 = udiv i32 %15, 165
  %20 = extractelement <4 x i32> %18, i64 0
  %21 = icmp sgt i32 %20, -1
  %22 = tail call i32 @llvm.umin.i32(i32 %19, i32 1535)
  %23 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %24 = tail call i32 @llvm.umin.i32(i32 %23, i32 13)
  %25 = mul nuw nsw i32 %22, 14
  %26 = add nuw nsw i32 %24, %25
  %27 = zext nneg i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %27
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !4
  %30 = shl nuw nsw i32 %19, 1
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %31
  %33 = load <2 x i32>, ptr addrspace(1) %32, align 8, !invariant.load !4
  %34 = extractelement <2 x i32> %33, i32 0
  %35 = extractelement <2 x i32> %33, i32 1
  %36 = tail call i32 @llvm.smax.i32(i32 %34, i32 0)
  %37 = tail call i32 @llvm.umin.i32(i32 %36, i32 1535)
  %38 = tail call i32 @llvm.smax.i32(i32 %35, i32 0)
  %39 = tail call i32 @llvm.umin.i32(i32 %38, i32 13)
  %40 = mul nuw nsw i32 %37, 14
  %41 = add nuw nsw i32 %40, %39
  %42 = zext nneg i32 %41 to i64
  %43 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %42
  %44 = load i32, ptr addrspace(1) %43, align 4, !invariant.load !4
  %45 = icmp ne i32 %29, %44
  %46 = and i1 %21, %45
  %47 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %27
  %48 = load i8, ptr addrspace(1) %47, align 1, !invariant.load !4
  %49 = and i8 %48, 1
  %50 = select i1 %46, i8 %49, i8 0
  %51 = insertelement <4 x i8> poison, i8 %50, i64 0
  %52 = or disjoint i32 %15, 1
  %53 = udiv i32 %52, 165
  %54 = extractelement <4 x i32> %18, i64 1
  %55 = icmp sgt i32 %54, -1
  %56 = tail call i32 @llvm.umin.i32(i32 %53, i32 1535)
  %57 = tail call i32 @llvm.smax.i32(i32 %54, i32 0)
  %58 = tail call i32 @llvm.umin.i32(i32 %57, i32 13)
  %59 = mul nuw nsw i32 %56, 14
  %60 = add nuw nsw i32 %58, %59
  %61 = zext nneg i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %61
  %63 = load i32, ptr addrspace(1) %62, align 4, !invariant.load !4
  %64 = shl nuw nsw i32 %53, 1
  %65 = zext nneg i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %65
  %67 = load <2 x i32>, ptr addrspace(1) %66, align 8, !invariant.load !4
  %68 = extractelement <2 x i32> %67, i32 0
  %69 = extractelement <2 x i32> %67, i32 1
  %70 = tail call i32 @llvm.smax.i32(i32 %68, i32 0)
  %71 = tail call i32 @llvm.umin.i32(i32 %70, i32 1535)
  %72 = tail call i32 @llvm.smax.i32(i32 %69, i32 0)
  %73 = tail call i32 @llvm.umin.i32(i32 %72, i32 13)
  %74 = mul nuw nsw i32 %71, 14
  %75 = add nuw nsw i32 %74, %73
  %76 = zext nneg i32 %75 to i64
  %77 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %76
  %78 = load i32, ptr addrspace(1) %77, align 4, !invariant.load !4
  %79 = icmp ne i32 %63, %78
  %80 = and i1 %55, %79
  %81 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %61
  %82 = load i8, ptr addrspace(1) %81, align 1, !invariant.load !4
  %83 = and i8 %82, 1
  %84 = select i1 %80, i8 %83, i8 0
  %85 = insertelement <4 x i8> %51, i8 %84, i64 1
  %86 = or disjoint i32 %15, 2
  %87 = udiv i32 %86, 165
  %88 = extractelement <4 x i32> %18, i64 2
  %89 = icmp sgt i32 %88, -1
  %90 = tail call i32 @llvm.umin.i32(i32 %87, i32 1535)
  %91 = tail call i32 @llvm.smax.i32(i32 %88, i32 0)
  %92 = tail call i32 @llvm.umin.i32(i32 %91, i32 13)
  %93 = mul nuw nsw i32 %90, 14
  %94 = add nuw nsw i32 %92, %93
  %95 = zext nneg i32 %94 to i64
  %96 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %95
  %97 = load i32, ptr addrspace(1) %96, align 4, !invariant.load !4
  %98 = shl nuw nsw i32 %87, 1
  %99 = zext nneg i32 %98 to i64
  %100 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %99
  %101 = load <2 x i32>, ptr addrspace(1) %100, align 8, !invariant.load !4
  %102 = extractelement <2 x i32> %101, i32 0
  %103 = extractelement <2 x i32> %101, i32 1
  %104 = tail call i32 @llvm.smax.i32(i32 %102, i32 0)
  %105 = tail call i32 @llvm.umin.i32(i32 %104, i32 1535)
  %106 = tail call i32 @llvm.smax.i32(i32 %103, i32 0)
  %107 = tail call i32 @llvm.umin.i32(i32 %106, i32 13)
  %108 = mul nuw nsw i32 %105, 14
  %109 = add nuw nsw i32 %108, %107
  %110 = zext nneg i32 %109 to i64
  %111 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %110
  %112 = load i32, ptr addrspace(1) %111, align 4, !invariant.load !4
  %113 = icmp ne i32 %97, %112
  %114 = and i1 %89, %113
  %115 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %95
  %116 = load i8, ptr addrspace(1) %115, align 1, !invariant.load !4
  %117 = and i8 %116, 1
  %118 = select i1 %114, i8 %117, i8 0
  %119 = insertelement <4 x i8> %85, i8 %118, i64 2
  %120 = or disjoint i32 %15, 3
  %121 = udiv i32 %120, 165
  %122 = extractelement <4 x i32> %18, i64 3
  %123 = icmp sgt i32 %122, -1
  %124 = tail call i32 @llvm.umin.i32(i32 %121, i32 1535)
  %125 = tail call i32 @llvm.smax.i32(i32 %122, i32 0)
  %126 = tail call i32 @llvm.umin.i32(i32 %125, i32 13)
  %127 = mul nuw nsw i32 %124, 14
  %128 = add nuw nsw i32 %126, %127
  %129 = zext nneg i32 %128 to i64
  %130 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %129
  %131 = load i32, ptr addrspace(1) %130, align 4, !invariant.load !4
  %132 = shl nuw nsw i32 %121, 1
  %133 = zext nneg i32 %132 to i64
  %134 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %133
  %135 = load <2 x i32>, ptr addrspace(1) %134, align 8, !invariant.load !4
  %136 = extractelement <2 x i32> %135, i32 0
  %137 = extractelement <2 x i32> %135, i32 1
  %138 = tail call i32 @llvm.smax.i32(i32 %136, i32 0)
  %139 = tail call i32 @llvm.umin.i32(i32 %138, i32 1535)
  %140 = tail call i32 @llvm.smax.i32(i32 %137, i32 0)
  %141 = tail call i32 @llvm.umin.i32(i32 %140, i32 13)
  %142 = mul nuw nsw i32 %139, 14
  %143 = add nuw nsw i32 %142, %141
  %144 = zext nneg i32 %143 to i64
  %145 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %144
  %146 = load i32, ptr addrspace(1) %145, align 4, !invariant.load !4
  %147 = icmp ne i32 %131, %146
  %148 = and i1 %123, %147
  %149 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %129
  %150 = load i8, ptr addrspace(1) %149, align 1, !invariant.load !4
  %151 = and i8 %150, 1
  %152 = select i1 %148, i8 %151, i8 0
  %153 = insertelement <4 x i8> %119, i8 %152, i64 3
  %154 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %16
  store <4 x i8> %153, ptr addrspace(1) %154, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_broadcast(ptr noalias readonly align 256 captures(none) dereferenceable(27225) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(41817600) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !241
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = shl nuw nsw i32 %6, 2
  %8 = shl nuw nsw i32 %5, 9
  %9 = or disjoint i32 %7, %8
  %urem = urem i32 %9, 27225
  %10 = zext nneg i32 %urem to i64
  %11 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %10
  %12 = load i8, ptr addrspace(1) %11, align 1, !invariant.load !4
  %13 = insertelement <4 x i8> poison, i8 %12, i64 0
  %14 = or disjoint i32 %9, 1
  %urem1 = urem i32 %14, 27225
  %15 = zext nneg i32 %urem1 to i64
  %16 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %15
  %17 = load i8, ptr addrspace(1) %16, align 1, !invariant.load !4
  %18 = insertelement <4 x i8> %13, i8 %17, i64 1
  %19 = or disjoint i32 %9, 2
  %urem2 = urem i32 %19, 27225
  %20 = zext nneg i32 %urem2 to i64
  %21 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %20
  %22 = load i8, ptr addrspace(1) %21, align 1, !invariant.load !4
  %23 = insertelement <4 x i8> %18, i8 %22, i64 2
  %24 = or disjoint i32 %9, 3
  %urem3 = urem i32 %24, 27225
  %25 = zext nneg i32 %urem3 to i64
  %26 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %25
  %27 = load i8, ptr addrspace(1) %26, align 1, !invariant.load !4
  %28 = insertelement <4 x i8> %23, i8 %27, i64 3
  %29 = zext nneg i32 %9 to i64
  %30 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 %29
  store <4 x i8> %28, ptr addrspace(1) %30, align 4
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_and_reduce_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(41817600) %1, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %2, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %3, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %4, ptr noalias readonly align 256 captures(none) dereferenceable(1536) %5, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %6, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %7, ptr noalias readonly align 256 captures(none) dereferenceable(165) %8, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %9, ptr noalias readonly align 256 captures(none) dereferenceable(1536) %10, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %11, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %12, ptr noalias writeonly align 256 captures(none) dereferenceable(1536) %13, ptr noalias writeonly align 256 captures(none) dereferenceable(1536) %14, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %15, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %16) local_unnamed_addr #9 {
  %18 = addrspacecast ptr %4 to ptr addrspace(1)
  %19 = addrspacecast ptr %3 to ptr addrspace(1)
  %20 = addrspacecast ptr %2 to ptr addrspace(1)
  %21 = addrspacecast ptr %7 to ptr addrspace(1)
  %22 = addrspacecast ptr %6 to ptr addrspace(1)
  %23 = addrspacecast ptr %5 to ptr addrspace(1)
  %24 = addrspacecast ptr %10 to ptr addrspace(1)
  %25 = addrspacecast ptr %11 to ptr addrspace(1)
  %26 = addrspacecast ptr %1 to ptr addrspace(1)
  %27 = addrspacecast ptr %0 to ptr addrspace(1)
  %28 = addrspacecast ptr %9 to ptr addrspace(1)
  %29 = addrspacecast ptr %8 to ptr addrspace(1)
  %30 = addrspacecast ptr %12 to ptr addrspace(1)
  %31 = addrspacecast ptr %15 to ptr addrspace(1)
  %32 = addrspacecast ptr %16 to ptr addrspace(1)
  %33 = addrspacecast ptr %14 to ptr addrspace(1)
  %34 = addrspacecast ptr %13 to ptr addrspace(1)
  %35 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !242
  %36 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !243
  %37 = shl nuw nsw i32 %36, 3
  %38 = lshr i32 %35, 5
  %39 = or disjoint i32 %37, %38
  %40 = tail call i32 @llvm.umin.i32(i32 %39, i32 1535)
  %41 = shl nuw nsw i32 %38, 1
  %42 = shl nuw nsw i32 %36, 4
  %43 = or disjoint i32 %41, %42
  %44 = zext nneg i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %44
  %46 = load <2 x i32>, ptr addrspace(1) %45, align 8, !invariant.load !4
  %47 = extractelement <2 x i32> %46, i32 0
  %48 = extractelement <2 x i32> %46, i32 1
  %49 = tail call i32 @llvm.smax.i32(i32 %47, i32 0)
  %50 = tail call i32 @llvm.umin.i32(i32 %49, i32 1535)
  %51 = tail call i32 @llvm.smax.i32(i32 %48, i32 0)
  %52 = tail call i32 @llvm.umin.i32(i32 %51, i32 13)
  %53 = mul nuw nsw i32 %50, 14
  %54 = add nuw nsw i32 %53, %52
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %55
  %57 = load i32, ptr addrspace(1) %56, align 4, !invariant.load !4
  %58 = zext nneg i32 %39 to i64
  %59 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %58
  %60 = load i32, ptr addrspace(1) %59, align 4, !invariant.load !4
  %61 = icmp slt i32 %57, %60
  %62 = add i32 %57, 165
  %63 = select i1 %61, i32 %62, i32 %57
  %64 = tail call i32 @llvm.smax.i32(i32 %63, i32 0)
  %65 = tail call i32 @llvm.umin.i32(i32 %64, i32 164)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !244)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !247)
  %66 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %55
  %67 = load i32, ptr addrspace(1) %66, align 4, !invariant.load !4, !alias.scope !247, !noalias !244
  %68 = icmp slt i32 %67, 0
  %69 = add i32 %67, 101
  %70 = select i1 %68, i32 %69, i32 %67
  %71 = tail call i32 @llvm.smax.i32(i32 %70, i32 0)
  %72 = tail call i32 @llvm.umin.i32(i32 %71, i32 100)
  %73 = mul nuw nsw i32 %72, 20
  %74 = zext nneg i32 %73 to i64
  %75 = getelementptr inbounds float, ptr addrspace(1) %22, i64 %74
  %76 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 36
  %77 = load float, ptr addrspace(1) %76, align 4, !invariant.load !4, !alias.scope !244, !noalias !247
  %78 = fcmp ogt float %77, 0.000000e+00
  %79 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 %58
  %80 = load i8, ptr addrspace(1) %79, align 1, !invariant.load !4
  %81 = srem i32 %57, 15
  %82 = icmp slt i32 %81, %60
  %83 = add nsw i32 %81, 15
  %84 = select i1 %82, i32 %83, i32 %81
  %85 = icmp sgt i32 %84, 0
  %86 = icmp slt i32 %84, 14
  %87 = trunc i8 %80 to i1
  %.v = select i1 %87, i1 %85, i1 %86
  %88 = select i1 %87, i32 -1, i32 1
  %89 = add i32 %88, %57
  %90 = tail call i32 @llvm.smax.i32(i32 %60, i32 %89)
  %91 = tail call i32 @llvm.smin.i32(i32 %90, i32 164)
  %92 = and i1 %78, %.v
  %93 = select i1 %92, i32 %91, i32 %57
  %94 = icmp slt i32 %93, %60
  %95 = add i32 %93, 165
  %96 = select i1 %94, i32 %95, i32 %93
  %97 = tail call i32 @llvm.smax.i32(i32 %96, i32 0)
  %98 = tail call i32 @llvm.umin.i32(i32 %97, i32 164)
  %99 = xor i1 %78, true
  %100 = zext i1 %99 to i8
  %101 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 %58
  %102 = load i8, ptr addrspace(1) %101, align 1, !invariant.load !4
  %103 = trunc i8 %102 to i1
  %104 = select i1 %103, i32 -1, i32 1
  %105 = getelementptr inbounds i32, ptr addrspace(1) %25, i64 %44
  %106 = load <2 x i32>, ptr addrspace(1) %105, align 8, !invariant.load !4
  %107 = extractelement <2 x i32> %106, i32 0
  %108 = extractelement <2 x i32> %106, i32 1
  %109 = tail call i32 @llvm.smax.i32(i32 %107, i32 0)
  %110 = tail call i32 @llvm.umin.i32(i32 %109, i32 1535)
  %111 = tail call i32 @llvm.smax.i32(i32 %108, i32 0)
  %112 = tail call i32 @llvm.umin.i32(i32 %111, i32 13)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !249)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !252)
  %113 = mul nuw nsw i32 %110, 14
  %114 = add nuw nsw i32 %113, %112
  %115 = zext nneg i32 %114 to i64
  %116 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %115
  %117 = load i32, ptr addrspace(1) %116, align 4, !invariant.load !4, !alias.scope !252, !noalias !249
  %118 = icmp slt i32 %117, 0
  %119 = add i32 %117, 101
  %120 = select i1 %118, i32 %119, i32 %117
  %121 = tail call i32 @llvm.smax.i32(i32 %120, i32 0)
  %122 = tail call i32 @llvm.umin.i32(i32 %121, i32 100)
  %123 = mul nuw nsw i32 %122, 20
  %124 = zext nneg i32 %123 to i64
  %125 = getelementptr inbounds float, ptr addrspace(1) %22, i64 %124
  %126 = getelementptr inbounds i8, ptr addrspace(1) %125, i64 36
  %127 = load float, ptr addrspace(1) %126, align 4, !invariant.load !4, !alias.scope !249, !noalias !252
  %128 = fcmp ule float %127, 0.000000e+00
  %129 = zext i1 %128 to i8
  %130 = and i32 %35, 31
  %131 = mul nuw nsw i32 %40, 27225
  %132 = mul nuw nsw i32 %65, 165
  %133 = add nuw nsw i32 %131, %130
  %134 = add nuw nsw i32 %133, %132
  %135 = zext nneg i32 %134 to i64
  %136 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %135
  %137 = load i8, ptr addrspace(1) %136, align 1, !invariant.load !4
  %138 = mul nuw nsw i32 %38, 165
  %139 = mul nuw nsw i32 %36, 1320
  %140 = add nuw nsw i32 %130, %139
  %141 = add nuw nsw i32 %140, %138
  %142 = zext nneg i32 %141 to i64
  %143 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 %142
  %144 = load i8, ptr addrspace(1) %143, align 1, !invariant.load !4
  %145 = and i8 %144, %137
  %146 = mul nuw nsw i32 %98, 165
  %147 = add nuw nsw i32 %133, %146
  %148 = zext nneg i32 %147 to i64
  %149 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %148
  %150 = load i8, ptr addrspace(1) %149, align 1, !invariant.load !4
  %151 = and i8 %150, %144
  %152 = mul nuw nsw i32 %39, 165
  %153 = add nuw nsw i32 %152, %130
  %154 = zext nneg i32 %153 to i64
  %155 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %154
  %156 = load i8, ptr addrspace(1) %155, align 1, !invariant.load !4, !alias.scope !254
  %157 = icmp eq i8 %156, 0
  %158 = zext nneg i32 %130 to i64
  %159 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 %158
  %160 = load i8, ptr addrspace(1) %159, align 1, !invariant.load !4
  %.lhs.trunc = trunc nuw nsw i32 %130 to i8
  %161 = urem i8 %.lhs.trunc, 15
  %.zext = zext nneg i8 %161 to i32
  %162 = add nuw nsw i32 %.zext, 15
  %163 = trunc i8 %160 to i1
  %164 = select i1 %163, i32 %162, i32 %.zext
  %165 = icmp ne i32 %164, 0
  %166 = zext i1 %165 to i8
  %167 = icmp samesign ult i32 %164, 14
  %168 = zext i1 %167 to i8
  %169 = select i1 %87, i8 %166, i8 %168
  %170 = add nsw i32 %88, %130
  %171 = tail call i32 @llvm.smax.i32(i32 %170, i32 0)
  %172 = mul nuw nsw i32 %40, 165
  %173 = add nuw nsw i32 %171, %172
  %174 = zext nneg i32 %173 to i64
  %175 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %174
  %176 = load i8, ptr addrspace(1) %175, align 1, !invariant.load !4, !alias.scope !257
  %177 = icmp eq i8 %176, 0
  %178 = select i1 %177, i8 %169, i8 0
  %179 = or i8 %178, %100
  %180 = select i1 %157, i8 %179, i8 0
  %181 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %154
  %182 = load i8, ptr addrspace(1) %181, align 1, !invariant.load !4, !alias.scope !260
  %183 = icmp eq i8 %182, 0
  %184 = select i1 %103, i8 %166, i8 %168
  %185 = add nsw i32 %104, %130
  %186 = tail call i32 @llvm.smax.i32(i32 %185, i32 0)
  %187 = add nuw nsw i32 %186, %172
  %188 = zext nneg i32 %187 to i64
  %189 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %188
  %190 = load i8, ptr addrspace(1) %189, align 1, !invariant.load !4, !alias.scope !263
  %191 = icmp eq i8 %190, 0
  %192 = select i1 %191, i8 %184, i8 0
  %193 = or i8 %192, %129
  %194 = select i1 %183, i8 %193, i8 0
  %195 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 %142
  store i8 %180, ptr addrspace(1) %195, align 1
  %196 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 %142
  store i8 %194, ptr addrspace(1) %196, align 1
  %197 = or disjoint i32 %130, 32
  %198 = getelementptr inbounds i8, ptr addrspace(1) %136, i64 32
  %199 = load i8, ptr addrspace(1) %198, align 1, !invariant.load !4
  %200 = getelementptr inbounds i8, ptr addrspace(1) %143, i64 32
  %201 = load i8, ptr addrspace(1) %200, align 1, !invariant.load !4
  %202 = and i8 %201, %199
  %203 = or i8 %202, %145
  %204 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 32
  %205 = load i8, ptr addrspace(1) %204, align 1, !invariant.load !4
  %206 = and i8 %205, %201
  %207 = or i8 %206, %151
  %208 = zext nneg i32 %152 to i64
  %209 = add i64 %208, %158
  %210 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %209
  %211 = getelementptr inbounds i8, ptr addrspace(1) %210, i64 32
  %212 = load i8, ptr addrspace(1) %211, align 1, !invariant.load !4, !alias.scope !266
  %213 = icmp eq i8 %212, 0
  %214 = getelementptr inbounds i8, ptr addrspace(1) %159, i64 32
  %215 = load i8, ptr addrspace(1) %214, align 1, !invariant.load !4
  %.lhs.trunc1 = trunc nuw nsw i32 %197 to i8
  %216 = urem i8 %.lhs.trunc1, 15
  %.zext2 = zext nneg i8 %216 to i32
  %217 = add nuw nsw i32 %.zext2, 15
  %218 = trunc i8 %215 to i1
  %219 = select i1 %218, i32 %217, i32 %.zext2
  %220 = icmp ne i32 %219, 0
  %221 = zext i1 %220 to i8
  %222 = icmp samesign ult i32 %219, 14
  %223 = zext i1 %222 to i8
  %224 = select i1 %87, i8 %221, i8 %223
  %225 = add nsw i32 %88, %172
  %226 = add nsw i32 %225, %197
  %227 = zext nneg i32 %226 to i64
  %228 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %227
  %229 = load i8, ptr addrspace(1) %228, align 1, !invariant.load !4, !alias.scope !269
  %230 = icmp eq i8 %229, 0
  %231 = select i1 %230, i8 %224, i8 0
  %232 = or i8 %231, %100
  %233 = select i1 %213, i8 %232, i8 0
  %234 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %209
  %235 = getelementptr inbounds i8, ptr addrspace(1) %234, i64 32
  %236 = load i8, ptr addrspace(1) %235, align 1, !invariant.load !4, !alias.scope !272
  %237 = icmp eq i8 %236, 0
  %238 = select i1 %103, i8 %221, i8 %223
  %239 = add nsw i32 %104, %172
  %240 = add nsw i32 %239, %197
  %241 = zext nneg i32 %240 to i64
  %242 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %241
  %243 = load i8, ptr addrspace(1) %242, align 1, !invariant.load !4, !alias.scope !275
  %244 = icmp eq i8 %243, 0
  %245 = select i1 %244, i8 %238, i8 0
  %246 = or i8 %245, %129
  %247 = select i1 %237, i8 %246, i8 0
  %248 = getelementptr inbounds i8, ptr addrspace(1) %195, i64 32
  store i8 %233, ptr addrspace(1) %248, align 1
  %249 = getelementptr inbounds i8, ptr addrspace(1) %196, i64 32
  store i8 %247, ptr addrspace(1) %249, align 1
  %250 = or disjoint i32 %130, 64
  %251 = getelementptr inbounds i8, ptr addrspace(1) %136, i64 64
  %252 = load i8, ptr addrspace(1) %251, align 1, !invariant.load !4
  %253 = getelementptr inbounds i8, ptr addrspace(1) %143, i64 64
  %254 = load i8, ptr addrspace(1) %253, align 1, !invariant.load !4
  %255 = and i8 %254, %252
  %256 = or i8 %203, %255
  %257 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 64
  %258 = load i8, ptr addrspace(1) %257, align 1, !invariant.load !4
  %259 = and i8 %258, %254
  %260 = or i8 %207, %259
  %261 = getelementptr inbounds i8, ptr addrspace(1) %210, i64 64
  %262 = load i8, ptr addrspace(1) %261, align 1, !invariant.load !4, !alias.scope !278
  %263 = icmp eq i8 %262, 0
  %264 = getelementptr inbounds i8, ptr addrspace(1) %159, i64 64
  %265 = load i8, ptr addrspace(1) %264, align 1, !invariant.load !4
  %.lhs.trunc3 = trunc nuw nsw i32 %250 to i8
  %266 = urem i8 %.lhs.trunc3, 15
  %.zext4 = zext nneg i8 %266 to i32
  %267 = add nuw nsw i32 %.zext4, 15
  %268 = trunc i8 %265 to i1
  %269 = select i1 %268, i32 %267, i32 %.zext4
  %270 = icmp ne i32 %269, 0
  %271 = zext i1 %270 to i8
  %272 = icmp samesign ult i32 %269, 14
  %273 = zext i1 %272 to i8
  %274 = select i1 %87, i8 %271, i8 %273
  %275 = add nsw i32 %225, %250
  %276 = zext nneg i32 %275 to i64
  %277 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %276
  %278 = load i8, ptr addrspace(1) %277, align 1, !invariant.load !4, !alias.scope !281
  %279 = icmp eq i8 %278, 0
  %280 = select i1 %279, i8 %274, i8 0
  %281 = or i8 %280, %100
  %282 = select i1 %263, i8 %281, i8 0
  %283 = getelementptr inbounds i8, ptr addrspace(1) %234, i64 64
  %284 = load i8, ptr addrspace(1) %283, align 1, !invariant.load !4, !alias.scope !284
  %285 = icmp eq i8 %284, 0
  %286 = select i1 %103, i8 %271, i8 %273
  %287 = add nsw i32 %239, %250
  %288 = zext nneg i32 %287 to i64
  %289 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %288
  %290 = load i8, ptr addrspace(1) %289, align 1, !invariant.load !4, !alias.scope !287
  %291 = icmp eq i8 %290, 0
  %292 = select i1 %291, i8 %286, i8 0
  %293 = or i8 %292, %129
  %294 = select i1 %285, i8 %293, i8 0
  %295 = getelementptr inbounds i8, ptr addrspace(1) %195, i64 64
  store i8 %282, ptr addrspace(1) %295, align 1
  %296 = getelementptr inbounds i8, ptr addrspace(1) %196, i64 64
  store i8 %294, ptr addrspace(1) %296, align 1
  %297 = or disjoint i32 %130, 96
  %298 = getelementptr inbounds i8, ptr addrspace(1) %136, i64 96
  %299 = load i8, ptr addrspace(1) %298, align 1, !invariant.load !4
  %300 = getelementptr inbounds i8, ptr addrspace(1) %143, i64 96
  %301 = load i8, ptr addrspace(1) %300, align 1, !invariant.load !4
  %302 = and i8 %301, %299
  %303 = or i8 %256, %302
  %304 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 96
  %305 = load i8, ptr addrspace(1) %304, align 1, !invariant.load !4
  %306 = and i8 %305, %301
  %307 = or i8 %260, %306
  %308 = getelementptr inbounds i8, ptr addrspace(1) %210, i64 96
  %309 = load i8, ptr addrspace(1) %308, align 1, !invariant.load !4, !alias.scope !290
  %310 = icmp eq i8 %309, 0
  %311 = getelementptr inbounds i8, ptr addrspace(1) %159, i64 96
  %312 = load i8, ptr addrspace(1) %311, align 1, !invariant.load !4
  %.lhs.trunc5 = trunc nuw nsw i32 %297 to i8
  %313 = urem i8 %.lhs.trunc5, 15
  %.zext6 = zext nneg i8 %313 to i32
  %314 = add nuw nsw i32 %.zext6, 15
  %315 = trunc i8 %312 to i1
  %316 = select i1 %315, i32 %314, i32 %.zext6
  %317 = icmp ne i32 %316, 0
  %318 = zext i1 %317 to i8
  %319 = icmp samesign ult i32 %316, 14
  %320 = zext i1 %319 to i8
  %321 = select i1 %87, i8 %318, i8 %320
  %322 = add nsw i32 %225, %297
  %323 = zext nneg i32 %322 to i64
  %324 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %323
  %325 = load i8, ptr addrspace(1) %324, align 1, !invariant.load !4, !alias.scope !293
  %326 = icmp eq i8 %325, 0
  %327 = select i1 %326, i8 %321, i8 0
  %328 = or i8 %327, %100
  %329 = select i1 %310, i8 %328, i8 0
  %330 = getelementptr inbounds i8, ptr addrspace(1) %234, i64 96
  %331 = load i8, ptr addrspace(1) %330, align 1, !invariant.load !4, !alias.scope !296
  %332 = icmp eq i8 %331, 0
  %333 = select i1 %103, i8 %318, i8 %320
  %334 = add nsw i32 %239, %297
  %335 = zext nneg i32 %334 to i64
  %336 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %335
  %337 = load i8, ptr addrspace(1) %336, align 1, !invariant.load !4, !alias.scope !299
  %338 = icmp eq i8 %337, 0
  %339 = select i1 %338, i8 %333, i8 0
  %340 = or i8 %339, %129
  %341 = select i1 %332, i8 %340, i8 0
  %342 = getelementptr inbounds i8, ptr addrspace(1) %195, i64 96
  store i8 %329, ptr addrspace(1) %342, align 1
  %343 = getelementptr inbounds i8, ptr addrspace(1) %196, i64 96
  store i8 %341, ptr addrspace(1) %343, align 1
  %344 = or disjoint i32 %130, 128
  %345 = getelementptr inbounds i8, ptr addrspace(1) %136, i64 128
  %346 = load i8, ptr addrspace(1) %345, align 1, !invariant.load !4
  %347 = getelementptr inbounds i8, ptr addrspace(1) %143, i64 128
  %348 = load i8, ptr addrspace(1) %347, align 1, !invariant.load !4
  %349 = and i8 %348, %346
  %350 = or i8 %303, %349
  %351 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 128
  %352 = load i8, ptr addrspace(1) %351, align 1, !invariant.load !4
  %353 = and i8 %352, %348
  %354 = or i8 %307, %353
  %355 = getelementptr inbounds i8, ptr addrspace(1) %210, i64 128
  %356 = load i8, ptr addrspace(1) %355, align 1, !invariant.load !4, !alias.scope !302
  %357 = icmp eq i8 %356, 0
  %358 = getelementptr inbounds i8, ptr addrspace(1) %159, i64 128
  %359 = load i8, ptr addrspace(1) %358, align 1, !invariant.load !4
  %.lhs.trunc7 = trunc nuw i32 %344 to i8
  %360 = urem i8 %.lhs.trunc7, 15
  %.zext8 = zext nneg i8 %360 to i32
  %361 = add nuw nsw i32 %.zext8, 15
  %362 = trunc i8 %359 to i1
  %363 = select i1 %362, i32 %361, i32 %.zext8
  %364 = icmp ne i32 %363, 0
  %365 = zext i1 %364 to i8
  %366 = icmp samesign ult i32 %363, 14
  %367 = zext i1 %366 to i8
  %368 = select i1 %87, i8 %365, i8 %367
  %369 = add nsw i32 %225, %344
  %370 = zext nneg i32 %369 to i64
  %371 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %370
  %372 = load i8, ptr addrspace(1) %371, align 1, !invariant.load !4, !alias.scope !305
  %373 = icmp eq i8 %372, 0
  %374 = select i1 %373, i8 %368, i8 0
  %375 = or i8 %374, %100
  %376 = select i1 %357, i8 %375, i8 0
  %377 = getelementptr inbounds i8, ptr addrspace(1) %234, i64 128
  %378 = load i8, ptr addrspace(1) %377, align 1, !invariant.load !4, !alias.scope !308
  %379 = icmp eq i8 %378, 0
  %380 = select i1 %103, i8 %365, i8 %367
  %381 = add nsw i32 %239, %344
  %382 = zext nneg i32 %381 to i64
  %383 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %382
  %384 = load i8, ptr addrspace(1) %383, align 1, !invariant.load !4, !alias.scope !311
  %385 = icmp eq i8 %384, 0
  %386 = select i1 %385, i8 %380, i8 0
  %387 = or i8 %386, %129
  %388 = select i1 %379, i8 %387, i8 0
  %389 = getelementptr inbounds i8, ptr addrspace(1) %195, i64 128
  store i8 %376, ptr addrspace(1) %389, align 1
  %390 = getelementptr inbounds i8, ptr addrspace(1) %196, i64 128
  store i8 %388, ptr addrspace(1) %390, align 1
  %391 = icmp samesign ult i32 %130, 5
  br i1 %391, label %392, label %456

392:                                              ; preds = %17
  %393 = fcmp ogt float %77, 0.000000e+00
  %394 = or disjoint i32 %130, 160
  %395 = getelementptr inbounds i8, ptr addrspace(1) %136, i64 160
  %396 = load i8, ptr addrspace(1) %395, align 1, !invariant.load !4
  %397 = getelementptr inbounds i8, ptr addrspace(1) %143, i64 160
  %398 = load i8, ptr addrspace(1) %397, align 1, !invariant.load !4
  %399 = and i8 %398, %396
  %400 = or i8 %399, %350
  %401 = select i1 %.v, i1 %393, i1 false
  %402 = select i1 %401, i32 %91, i32 %57
  %403 = icmp slt i32 %402, %60
  %404 = add i32 %402, 165
  %405 = select i1 %403, i32 %404, i32 %402
  %406 = tail call i32 @llvm.smax.i32(i32 %405, i32 0)
  %407 = tail call i32 @llvm.umin.i32(i32 %406, i32 164)
  %408 = mul nuw nsw i32 %407, 165
  %409 = add nuw nsw i32 %408, %133
  %410 = zext nneg i32 %409 to i64
  %411 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %410
  %412 = getelementptr inbounds i8, ptr addrspace(1) %411, i64 160
  %413 = load i8, ptr addrspace(1) %412, align 1, !invariant.load !4
  %414 = and i8 %413, %398
  %415 = or i8 %414, %354
  %416 = getelementptr inbounds i8, ptr addrspace(1) %210, i64 160
  %417 = load i8, ptr addrspace(1) %416, align 1, !invariant.load !4, !alias.scope !314
  %418 = icmp eq i8 %417, 0
  %419 = getelementptr inbounds i8, ptr addrspace(1) %159, i64 160
  %420 = load i8, ptr addrspace(1) %419, align 1, !invariant.load !4
  %.lhs.trunc9 = trunc nuw i32 %394 to i8
  %421 = urem i8 %.lhs.trunc9, 15
  %.zext10 = zext nneg i8 %421 to i32
  %422 = add nuw nsw i32 %.zext10, 15
  %423 = trunc i8 %420 to i1
  %424 = select i1 %423, i32 %422, i32 %.zext10
  %425 = icmp ne i32 %424, 0
  %426 = zext i1 %425 to i8
  %427 = icmp samesign ult i32 %424, 14
  %428 = zext i1 %427 to i8
  %429 = select i1 %87, i8 %426, i8 %428
  %430 = add nsw i32 %88, %394
  %431 = tail call i32 @llvm.umin.i32(i32 %430, i32 164)
  %432 = add nuw nsw i32 %431, %172
  %433 = zext nneg i32 %432 to i64
  %434 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %433
  %435 = load i8, ptr addrspace(1) %434, align 1, !invariant.load !4, !alias.scope !317
  %436 = icmp eq i8 %435, 0
  %437 = select i1 %436, i8 %429, i8 0
  %438 = or i8 %437, %100
  %439 = select i1 %418, i8 %438, i8 0
  %440 = getelementptr inbounds i8, ptr addrspace(1) %234, i64 160
  %441 = load i8, ptr addrspace(1) %440, align 1, !invariant.load !4, !alias.scope !320
  %442 = icmp eq i8 %441, 0
  %443 = select i1 %103, i8 %426, i8 %428
  %444 = add nsw i32 %104, %394
  %445 = tail call i32 @llvm.umin.i32(i32 %444, i32 164)
  %446 = add nuw nsw i32 %445, %172
  %447 = zext nneg i32 %446 to i64
  %448 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %447
  %449 = load i8, ptr addrspace(1) %448, align 1, !invariant.load !4, !alias.scope !323
  %450 = icmp eq i8 %449, 0
  %451 = select i1 %450, i8 %443, i8 0
  %452 = or i8 %451, %129
  %453 = select i1 %442, i8 %452, i8 0
  %454 = getelementptr inbounds i8, ptr addrspace(1) %195, i64 160
  store i8 %439, ptr addrspace(1) %454, align 1
  %455 = getelementptr inbounds i8, ptr addrspace(1) %196, i64 160
  store i8 %453, ptr addrspace(1) %455, align 1
  br label %456

456:                                              ; preds = %392, %17
  %457 = phi i8 [ %415, %392 ], [ %354, %17 ]
  %458 = phi i8 [ %400, %392 ], [ %350, %17 ]
  %459 = zext i8 %458 to i32
  %460 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %459, i32 16, i32 31)
  %461 = trunc i32 %460 to i8
  %462 = or i8 %458, %461
  %463 = zext i8 %462 to i32
  %464 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %463, i32 8, i32 31)
  %465 = trunc i32 %464 to i8
  %466 = or i8 %462, %465
  %467 = zext i8 %466 to i32
  %468 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %467, i32 4, i32 31)
  %469 = trunc i32 %468 to i8
  %470 = or i8 %466, %469
  %471 = zext i8 %470 to i32
  %472 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %471, i32 2, i32 31)
  %473 = trunc i32 %472 to i8
  %474 = or i8 %470, %473
  %475 = zext i8 %474 to i32
  %476 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %475, i32 1, i32 31)
  %477 = zext i8 %457 to i32
  %478 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %477, i32 16, i32 31)
  %479 = trunc i32 %478 to i8
  %480 = or i8 %457, %479
  %481 = zext i8 %480 to i32
  %482 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %481, i32 8, i32 31)
  %483 = trunc i32 %482 to i8
  %484 = or i8 %480, %483
  %485 = zext i8 %484 to i32
  %486 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %485, i32 4, i32 31)
  %487 = trunc i32 %486 to i8
  %488 = or i8 %484, %487
  %489 = zext i8 %488 to i32
  %490 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %489, i32 2, i32 31)
  %491 = trunc i32 %490 to i8
  %492 = or i8 %488, %491
  %493 = zext i8 %492 to i32
  %494 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %493, i32 1, i32 31)
  %495 = icmp eq i32 %130, 0
  %496 = icmp samesign ult i32 %35, 225
  %497 = and i1 %496, %495
  %498 = getelementptr inbounds i8, ptr addrspace(1) %33, i64 %58
  %499 = getelementptr inbounds i8, ptr addrspace(1) %34, i64 %58
  %500 = trunc i32 %494 to i8
  %501 = or i8 %492, %500
  %502 = trunc i32 %476 to i8
  %503 = or i8 %474, %502
  br i1 %497, label %504, label %505

504:                                              ; preds = %456
  store i8 %503, ptr addrspace(1) %499, align 1
  store i8 %501, ptr addrspace(1) %498, align 1
  br label %505

505:                                              ; preds = %504, %456
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #10

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_35(ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %1, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %2, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %3) local_unnamed_addr #2 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %11 = shl nuw nsw i32 %10, 7
  %12 = or disjoint i32 %11, %9
  tail call void @llvm.experimental.noalias.scope.decl(metadata !326)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !329)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !331)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %13
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !326, !noalias !333
  %16 = shl nuw nsw i32 %12, 1
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %17
  %19 = load <2 x i32>, ptr addrspace(1) %18, align 8, !invariant.load !4, !alias.scope !331, !noalias !334
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %23 = tail call i32 @llvm.umin.i32(i32 %22, i32 1535)
  %24 = tail call i32 @llvm.smax.i32(i32 %21, i32 0)
  %25 = tail call i32 @llvm.umin.i32(i32 %24, i32 13)
  %26 = mul nuw nsw i32 %23, 14
  %27 = add nuw nsw i32 %26, %25
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4, !alias.scope !329, !noalias !335
  %31 = icmp slt i32 %30, %15
  %32 = add i32 %30, 165
  %33 = select i1 %31, i32 %32, i32 %30
  %34 = icmp ult i32 %33, 165
  %35 = mul nuw nsw i32 %12, 165
  %36 = add nuw nsw i32 %33, %35
  %37 = zext nneg i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %37
  br i1 %34, label %39, label %40

39:                                               ; preds = %4
  store i8 1, ptr addrspace(1) %38, align 1
  br label %40

40:                                               ; preds = %39, %4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_compare_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(4) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(1) initializes((0, 1)) %1) local_unnamed_addr #11 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = load i32, ptr addrspace(1) %3, align 256, !invariant.load !4
  %6 = icmp slt i32 %5, 20
  %7 = zext i1 %6 to i8
  store i8 %7, ptr addrspace(1) %4, align 256
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_reduce_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(41817600) %0, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %2) local_unnamed_addr #9 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !242
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !336
  %9 = lshr i32 %7, 5
  %10 = mul nuw nsw i32 %9, 165
  %11 = mul nuw nsw i32 %8, 1320
  %12 = and i32 %7, 31
  %13 = add nuw nsw i32 %12, %11
  %14 = add nuw nsw i32 %13, %10
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 %15
  %17 = load i8, ptr addrspace(1) %16, align 1, !invariant.load !4
  %18 = shl nuw nsw i32 %8, 8
  %19 = or disjoint i32 %18, %7
  %20 = udiv i32 %19, 5280
  %21 = mul nuw nsw i32 %20, 165
  %22 = add nuw nsw i32 %21, %12
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %23
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !4
  %26 = and i8 %25, %17
  %27 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 32
  %28 = load i8, ptr addrspace(1) %27, align 1, !invariant.load !4
  %29 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 32
  %30 = load i8, ptr addrspace(1) %29, align 1, !invariant.load !4
  %31 = and i8 %30, %28
  %32 = or i8 %31, %26
  %33 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 64
  %34 = load i8, ptr addrspace(1) %33, align 1, !invariant.load !4
  %35 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 64
  %36 = load i8, ptr addrspace(1) %35, align 1, !invariant.load !4
  %37 = and i8 %36, %34
  %38 = or i8 %32, %37
  %39 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 96
  %40 = load i8, ptr addrspace(1) %39, align 1, !invariant.load !4
  %41 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 96
  %42 = load i8, ptr addrspace(1) %41, align 1, !invariant.load !4
  %43 = and i8 %42, %40
  %44 = or i8 %38, %43
  %45 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 128
  %46 = load i8, ptr addrspace(1) %45, align 1, !invariant.load !4
  %47 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 128
  %48 = load i8, ptr addrspace(1) %47, align 1, !invariant.load !4
  %49 = and i8 %48, %46
  %50 = or i8 %44, %49
  %51 = icmp samesign ult i32 %12, 5
  br i1 %51, label %52, label %57

52:                                               ; preds = %3
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %16, i64 160
  %53 = load i8, ptr addrspace(1) %sunkaddr, align 1, !invariant.load !4
  %sunkaddr109 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 160
  %54 = load i8, ptr addrspace(1) %sunkaddr109, align 1, !invariant.load !4
  %55 = and i8 %54, %53
  %56 = or i8 %55, %50
  br label %57

57:                                               ; preds = %52, %3
  %58 = phi i8 [ %56, %52 ], [ %50, %3 ]
  %59 = zext i8 %58 to i32
  %60 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %59, i32 16, i32 31)
  %61 = trunc i32 %60 to i8
  %62 = or i8 %58, %61
  %63 = zext i8 %62 to i32
  %64 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %63, i32 8, i32 31)
  %65 = trunc i32 %64 to i8
  %66 = or i8 %62, %65
  %67 = zext i8 %66 to i32
  %68 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %67, i32 4, i32 31)
  %69 = trunc i32 %68 to i8
  %70 = or i8 %66, %69
  %71 = zext i8 %70 to i32
  %72 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %71, i32 2, i32 31)
  %73 = trunc i32 %72 to i8
  %74 = or i8 %70, %73
  %75 = zext i8 %74 to i32
  %76 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %75, i32 1, i32 31)
  %77 = icmp eq i32 %12, 0
  %78 = icmp samesign ult i32 %7, 225
  %79 = and i1 %78, %77
  %80 = shl nuw nsw i32 %8, 3
  %81 = or disjoint i32 %80, %9
  %82 = zext nneg i32 %81 to i64
  %83 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %82
  %84 = trunc i32 %76 to i8
  %85 = or i8 %74, %84
  br i1 %79, label %86, label %87

86:                                               ; preds = %57
  store i8 %85, ptr addrspace(1) %83, align 1
  br label %87

87:                                               ; preds = %86, %57
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_select_fusion(ptr noalias align 256 captures(none) dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %1, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %2, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %3, ptr noalias readonly align 256 captures(none) dereferenceable(4) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %0 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %3 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %13 = load <1 x i32>, ptr addrspace(1) %6, align 256, !invariant.load !4
  %14 = shl nuw nsw i32 %12, 2
  %15 = shl nuw nsw i32 %11, 9
  %16 = or disjoint i32 %14, %15
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %17
  %19 = load <4 x i8>, ptr addrspace(1) %18, align 4
  %20 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %17
  %21 = load <4 x i8>, ptr addrspace(1) %20, align 4, !invariant.load !4
  %22 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %17
  %23 = load <4 x i8>, ptr addrspace(1) %22, align 4, !invariant.load !4
  %24 = udiv i32 %16, 165
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %25
  %27 = load i32, ptr addrspace(1) %26, align 4, !invariant.load !4
  %28 = or disjoint i32 %16, 1
  %29 = udiv i32 %28, 165
  %30 = zext nneg i32 %29 to i64
  %31 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %30
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4
  %33 = or disjoint i32 %16, 2
  %34 = udiv i32 %33, 165
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %35
  %37 = load i32, ptr addrspace(1) %36, align 4, !invariant.load !4
  %38 = or disjoint i32 %16, 3
  %39 = udiv i32 %38, 165
  %40 = zext nneg i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %40
  %42 = load i32, ptr addrspace(1) %41, align 4, !invariant.load !4
  %43 = and <4 x i8> %23, %21
  %44 = shufflevector <1 x i32> %13, <1 x i32> poison, <4 x i32> zeroinitializer
  %45 = insertelement <4 x i32> poison, i32 %27, i64 0
  %46 = insertelement <4 x i32> %45, i32 %32, i64 1
  %47 = insertelement <4 x i32> %46, i32 %37, i64 2
  %48 = insertelement <4 x i32> %47, i32 %42, i64 3
  %49 = icmp slt <4 x i32> %44, %48
  %50 = select <4 x i1> %49, <4 x i8> %43, <4 x i8> zeroinitializer
  %51 = or <4 x i8> %50, %19
  store <4 x i8> %51, ptr addrspace(1) %18, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion(ptr noalias align 256 captures(none) dereferenceable(4) %0) local_unnamed_addr #11 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = load i32, ptr addrspace(1) %2, align 256
  %4 = add i32 %3, 1
  store i32 %4, ptr addrspace(1) %2, align 256
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @loop_select_fusion_4(ptr noalias readonly align 256 captures(none) dereferenceable(253440) %0, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %1, ptr noalias readonly align 256 captures(none) dereferenceable(108900) %2, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %3, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %4, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %5, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %6, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %7, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %8, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %9, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %10, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %11, ptr noalias writeonly align 256 captures(none) dereferenceable(253440) %12) local_unnamed_addr #2 {
  %14 = addrspacecast ptr %8 to ptr addrspace(1)
  %15 = addrspacecast ptr %9 to ptr addrspace(1)
  %16 = addrspacecast ptr %0 to ptr addrspace(1)
  %17 = addrspacecast ptr %1 to ptr addrspace(1)
  %18 = addrspacecast ptr %5 to ptr addrspace(1)
  %19 = addrspacecast ptr %4 to ptr addrspace(1)
  %20 = addrspacecast ptr %3 to ptr addrspace(1)
  %21 = addrspacecast ptr %2 to ptr addrspace(1)
  %22 = addrspacecast ptr %7 to ptr addrspace(1)
  %23 = addrspacecast ptr %6 to ptr addrspace(1)
  %24 = addrspacecast ptr %10 to ptr addrspace(1)
  %25 = addrspacecast ptr %11 to ptr addrspace(1)
  %26 = addrspacecast ptr %12 to ptr addrspace(1)
  %27 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !163
  %28 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %29 = shl nuw nsw i32 %28, 2
  %30 = shl nuw nsw i32 %27, 9
  %31 = or disjoint i32 %29, %30
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 %32
  %34 = load <4 x i8>, ptr addrspace(1) %33, align 4, !invariant.load !4
  %35 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 %32
  %36 = load <4 x i8>, ptr addrspace(1) %35, align 4, !invariant.load !4
  %37 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 %32
  %38 = load <4 x i8>, ptr addrspace(1) %37, align 4, !invariant.load !4
  %39 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 %32
  %40 = load <4 x i8>, ptr addrspace(1) %39, align 4, !invariant.load !4
  %41 = udiv i32 %31, 165
  %42 = mul i32 %41, 165
  %.decomposed = sub i32 %31, %42
  %43 = shl nuw nsw i32 %41, 1
  %44 = zext nneg i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %44
  %46 = load <2 x i32>, ptr addrspace(1) %45, align 8, !invariant.load !4
  %47 = extractelement <2 x i32> %46, i32 0
  %48 = extractelement <2 x i32> %46, i32 1
  %49 = tail call i32 @llvm.smax.i32(i32 %47, i32 0)
  %50 = tail call i32 @llvm.umin.i32(i32 %49, i32 1535)
  %51 = tail call i32 @llvm.smax.i32(i32 %48, i32 0)
  %52 = tail call i32 @llvm.umin.i32(i32 %51, i32 13)
  %53 = mul nuw nsw i32 %50, 14
  %54 = add nuw nsw i32 %53, %52
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %55
  %57 = load i32, ptr addrspace(1) %56, align 4, !invariant.load !4
  %58 = zext nneg i32 %41 to i64
  %59 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %58
  %60 = load i32, ptr addrspace(1) %59, align 4, !invariant.load !4
  %61 = icmp slt i32 %57, %60
  %62 = add i32 %57, 165
  %63 = select i1 %61, i32 %62, i32 %57
  %64 = tail call i32 @llvm.smax.i32(i32 %63, i32 0)
  %65 = tail call i32 @llvm.umin.i32(i32 %64, i32 164)
  %66 = mul nuw nsw i32 %65, 165
  %67 = add nuw nsw i32 %66, %.decomposed
  %68 = zext nneg i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %68
  %70 = load i32, ptr addrspace(1) %69, align 4, !invariant.load !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !337)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !340)
  %71 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %55
  %72 = load i32, ptr addrspace(1) %71, align 4, !invariant.load !4, !alias.scope !340, !noalias !337
  %73 = icmp slt i32 %72, 0
  %74 = add i32 %72, 101
  %75 = select i1 %73, i32 %74, i32 %72
  %76 = tail call i32 @llvm.smax.i32(i32 %75, i32 0)
  %77 = tail call i32 @llvm.umin.i32(i32 %76, i32 100)
  %78 = mul nuw nsw i32 %77, 20
  %79 = zext nneg i32 %78 to i64
  %80 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %79
  %81 = getelementptr inbounds i8, ptr addrspace(1) %80, i64 20
  %82 = load float, ptr addrspace(1) %81, align 4, !invariant.load !4, !alias.scope !337, !noalias !340
  %.inv = fcmp ole float %82, 0xC1E0000000000000
  %83 = select i1 %.inv, float 0xC1E0000000000000, float %82
  %84 = fptosi float %83 to i32
  %85 = fcmp oge float %82, 0x41E0000000000000
  %86 = select i1 %85, i32 2147483647, i32 %84
  %87 = fcmp uno float %82, 0.000000e+00
  %88 = select i1 %87, i32 0, i32 %86
  %.not = icmp sgt i32 %70, %88
  %89 = extractelement <4 x i8> %40, i64 0
  %90 = getelementptr inbounds i8, ptr addrspace(1) %80, i64 28
  %91 = load float, ptr addrspace(1) %90, align 4, !invariant.load !4, !alias.scope !342, !noalias !345
  %92 = fcmp ogt float %91, 0.000000e+00
  %93 = extractelement <4 x i8> %38, i64 0
  %94 = and i8 %89, 1
  %95 = select i1 %.not, i8 0, i8 %94
  %96 = select i1 %92, i8 %95, i8 %93
  %97 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %44
  %98 = load <2 x i32>, ptr addrspace(1) %97, align 8, !invariant.load !4
  %99 = extractelement <2 x i32> %98, i32 0
  %100 = extractelement <2 x i32> %98, i32 1
  %101 = tail call i32 @llvm.smax.i32(i32 %99, i32 0)
  %102 = tail call i32 @llvm.umin.i32(i32 %101, i32 1535)
  %103 = tail call i32 @llvm.smax.i32(i32 %100, i32 0)
  %104 = tail call i32 @llvm.umin.i32(i32 %103, i32 13)
  %105 = mul nuw nsw i32 %102, 14
  %106 = add nuw nsw i32 %105, %104
  %107 = zext nneg i32 %106 to i64
  %108 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %107
  %109 = load i32, ptr addrspace(1) %108, align 4, !invariant.load !4
  %110 = icmp slt i32 %109, %60
  %111 = add i32 %109, 165
  %112 = select i1 %110, i32 %111, i32 %109
  %113 = tail call i32 @llvm.smax.i32(i32 %112, i32 0)
  %114 = tail call i32 @llvm.umin.i32(i32 %113, i32 164)
  %115 = mul nuw nsw i32 %114, 165
  %116 = add nuw nsw i32 %115, %.decomposed
  %117 = zext nneg i32 %116 to i64
  %118 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %117
  %119 = load i32, ptr addrspace(1) %118, align 4, !invariant.load !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !347)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !350)
  %120 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %107
  %121 = load i32, ptr addrspace(1) %120, align 4, !invariant.load !4, !alias.scope !350, !noalias !347
  %122 = icmp slt i32 %121, 0
  %123 = add i32 %121, 101
  %124 = select i1 %122, i32 %123, i32 %121
  %125 = tail call i32 @llvm.smax.i32(i32 %124, i32 0)
  %126 = tail call i32 @llvm.umin.i32(i32 %125, i32 100)
  %127 = mul nuw nsw i32 %126, 20
  %128 = zext nneg i32 %127 to i64
  %129 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %128
  %130 = getelementptr inbounds i8, ptr addrspace(1) %129, i64 20
  %131 = load float, ptr addrspace(1) %130, align 4, !invariant.load !4, !alias.scope !347, !noalias !350
  %.inv1 = fcmp ole float %131, 0xC1E0000000000000
  %132 = select i1 %.inv1, float 0xC1E0000000000000, float %131
  %133 = fptosi float %132 to i32
  %134 = fcmp oge float %131, 0x41E0000000000000
  %135 = select i1 %134, i32 2147483647, i32 %133
  %136 = fcmp uno float %131, 0.000000e+00
  %137 = select i1 %136, i32 0, i32 %135
  %.not3 = icmp sgt i32 %119, %137
  %138 = extractelement <4 x i8> %36, i64 0
  %139 = getelementptr inbounds i8, ptr addrspace(1) %129, i64 28
  %140 = load float, ptr addrspace(1) %139, align 4, !invariant.load !4, !alias.scope !352, !noalias !355
  %141 = fcmp ogt float %140, 0.000000e+00
  %142 = extractelement <4 x i8> %34, i64 0
  %143 = and i8 %138, 1
  %144 = select i1 %.not3, i8 0, i8 %143
  %145 = select i1 %141, i8 %144, i8 %142
  %146 = insertelement <4 x i8> poison, i8 %145, i64 0
  %147 = insertelement <4 x i8> poison, i8 %96, i64 0
  %148 = or disjoint i32 %31, 1
  %149 = udiv i32 %148, 165
  %150 = mul i32 %149, 165
  %.decomposed22 = sub i32 %148, %150
  %151 = shl nuw nsw i32 %149, 1
  %152 = zext nneg i32 %151 to i64
  %153 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %152
  %154 = load <2 x i32>, ptr addrspace(1) %153, align 8, !invariant.load !4
  %155 = extractelement <2 x i32> %154, i32 0
  %156 = extractelement <2 x i32> %154, i32 1
  %157 = tail call i32 @llvm.smax.i32(i32 %155, i32 0)
  %158 = tail call i32 @llvm.umin.i32(i32 %157, i32 1535)
  %159 = tail call i32 @llvm.smax.i32(i32 %156, i32 0)
  %160 = tail call i32 @llvm.umin.i32(i32 %159, i32 13)
  %161 = mul nuw nsw i32 %158, 14
  %162 = add nuw nsw i32 %161, %160
  %163 = zext nneg i32 %162 to i64
  %164 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %163
  %165 = load i32, ptr addrspace(1) %164, align 4, !invariant.load !4
  %166 = zext nneg i32 %149 to i64
  %167 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %166
  %168 = load i32, ptr addrspace(1) %167, align 4, !invariant.load !4
  %169 = icmp slt i32 %165, %168
  %170 = add i32 %165, 165
  %171 = select i1 %169, i32 %170, i32 %165
  %172 = tail call i32 @llvm.smax.i32(i32 %171, i32 0)
  %173 = tail call i32 @llvm.umin.i32(i32 %172, i32 164)
  %174 = mul nuw nsw i32 %173, 165
  %175 = add nuw nsw i32 %174, %.decomposed22
  %176 = zext nneg i32 %175 to i64
  %177 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %176
  %178 = load i32, ptr addrspace(1) %177, align 4, !invariant.load !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !357)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !360)
  %179 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %163
  %180 = load i32, ptr addrspace(1) %179, align 4, !invariant.load !4, !alias.scope !360, !noalias !357
  %181 = icmp slt i32 %180, 0
  %182 = add i32 %180, 101
  %183 = select i1 %181, i32 %182, i32 %180
  %184 = tail call i32 @llvm.smax.i32(i32 %183, i32 0)
  %185 = tail call i32 @llvm.umin.i32(i32 %184, i32 100)
  %186 = mul nuw nsw i32 %185, 20
  %187 = zext nneg i32 %186 to i64
  %188 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %187
  %189 = getelementptr inbounds i8, ptr addrspace(1) %188, i64 20
  %190 = load float, ptr addrspace(1) %189, align 4, !invariant.load !4, !alias.scope !357, !noalias !360
  %.inv4 = fcmp ole float %190, 0xC1E0000000000000
  %191 = select i1 %.inv4, float 0xC1E0000000000000, float %190
  %192 = fptosi float %191 to i32
  %193 = fcmp oge float %190, 0x41E0000000000000
  %194 = select i1 %193, i32 2147483647, i32 %192
  %195 = fcmp uno float %190, 0.000000e+00
  %196 = select i1 %195, i32 0, i32 %194
  %.not6 = icmp sgt i32 %178, %196
  %197 = extractelement <4 x i8> %40, i64 1
  %198 = getelementptr inbounds i8, ptr addrspace(1) %188, i64 28
  %199 = load float, ptr addrspace(1) %198, align 4, !invariant.load !4, !alias.scope !362, !noalias !365
  %200 = fcmp ogt float %199, 0.000000e+00
  %201 = extractelement <4 x i8> %38, i64 1
  %202 = and i8 %197, 1
  %203 = select i1 %.not6, i8 0, i8 %202
  %204 = select i1 %200, i8 %203, i8 %201
  %205 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %152
  %206 = load <2 x i32>, ptr addrspace(1) %205, align 8, !invariant.load !4
  %207 = extractelement <2 x i32> %206, i32 0
  %208 = extractelement <2 x i32> %206, i32 1
  %209 = tail call i32 @llvm.smax.i32(i32 %207, i32 0)
  %210 = tail call i32 @llvm.umin.i32(i32 %209, i32 1535)
  %211 = tail call i32 @llvm.smax.i32(i32 %208, i32 0)
  %212 = tail call i32 @llvm.umin.i32(i32 %211, i32 13)
  %213 = mul nuw nsw i32 %210, 14
  %214 = add nuw nsw i32 %213, %212
  %215 = zext nneg i32 %214 to i64
  %216 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %215
  %217 = load i32, ptr addrspace(1) %216, align 4, !invariant.load !4
  %218 = icmp slt i32 %217, %168
  %219 = add i32 %217, 165
  %220 = select i1 %218, i32 %219, i32 %217
  %221 = tail call i32 @llvm.smax.i32(i32 %220, i32 0)
  %222 = tail call i32 @llvm.umin.i32(i32 %221, i32 164)
  %223 = mul nuw nsw i32 %222, 165
  %224 = add nuw nsw i32 %223, %.decomposed22
  %225 = zext nneg i32 %224 to i64
  %226 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %225
  %227 = load i32, ptr addrspace(1) %226, align 4, !invariant.load !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !367)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !370)
  %228 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %215
  %229 = load i32, ptr addrspace(1) %228, align 4, !invariant.load !4, !alias.scope !370, !noalias !367
  %230 = icmp slt i32 %229, 0
  %231 = add i32 %229, 101
  %232 = select i1 %230, i32 %231, i32 %229
  %233 = tail call i32 @llvm.smax.i32(i32 %232, i32 0)
  %234 = tail call i32 @llvm.umin.i32(i32 %233, i32 100)
  %235 = mul nuw nsw i32 %234, 20
  %236 = zext nneg i32 %235 to i64
  %237 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %236
  %238 = getelementptr inbounds i8, ptr addrspace(1) %237, i64 20
  %239 = load float, ptr addrspace(1) %238, align 4, !invariant.load !4, !alias.scope !367, !noalias !370
  %.inv7 = fcmp ole float %239, 0xC1E0000000000000
  %240 = select i1 %.inv7, float 0xC1E0000000000000, float %239
  %241 = fptosi float %240 to i32
  %242 = fcmp oge float %239, 0x41E0000000000000
  %243 = select i1 %242, i32 2147483647, i32 %241
  %244 = fcmp uno float %239, 0.000000e+00
  %245 = select i1 %244, i32 0, i32 %243
  %.not9 = icmp sgt i32 %227, %245
  %246 = extractelement <4 x i8> %36, i64 1
  %247 = getelementptr inbounds i8, ptr addrspace(1) %237, i64 28
  %248 = load float, ptr addrspace(1) %247, align 4, !invariant.load !4, !alias.scope !372, !noalias !375
  %249 = fcmp ogt float %248, 0.000000e+00
  %250 = extractelement <4 x i8> %34, i64 1
  %251 = and i8 %246, 1
  %252 = select i1 %.not9, i8 0, i8 %251
  %253 = select i1 %249, i8 %252, i8 %250
  %254 = insertelement <4 x i8> %146, i8 %253, i64 1
  %255 = insertelement <4 x i8> %147, i8 %204, i64 1
  %256 = or disjoint i32 %31, 2
  %257 = udiv i32 %256, 165
  %258 = mul i32 %257, 165
  %.decomposed23 = sub i32 %256, %258
  %259 = shl nuw nsw i32 %257, 1
  %260 = zext nneg i32 %259 to i64
  %261 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %260
  %262 = load <2 x i32>, ptr addrspace(1) %261, align 8, !invariant.load !4
  %263 = extractelement <2 x i32> %262, i32 0
  %264 = extractelement <2 x i32> %262, i32 1
  %265 = tail call i32 @llvm.smax.i32(i32 %263, i32 0)
  %266 = tail call i32 @llvm.umin.i32(i32 %265, i32 1535)
  %267 = tail call i32 @llvm.smax.i32(i32 %264, i32 0)
  %268 = tail call i32 @llvm.umin.i32(i32 %267, i32 13)
  %269 = mul nuw nsw i32 %266, 14
  %270 = add nuw nsw i32 %269, %268
  %271 = zext nneg i32 %270 to i64
  %272 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %271
  %273 = load i32, ptr addrspace(1) %272, align 4, !invariant.load !4
  %274 = zext nneg i32 %257 to i64
  %275 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %274
  %276 = load i32, ptr addrspace(1) %275, align 4, !invariant.load !4
  %277 = icmp slt i32 %273, %276
  %278 = add i32 %273, 165
  %279 = select i1 %277, i32 %278, i32 %273
  %280 = tail call i32 @llvm.smax.i32(i32 %279, i32 0)
  %281 = tail call i32 @llvm.umin.i32(i32 %280, i32 164)
  %282 = mul nuw nsw i32 %281, 165
  %283 = add nuw nsw i32 %282, %.decomposed23
  %284 = zext nneg i32 %283 to i64
  %285 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %284
  %286 = load i32, ptr addrspace(1) %285, align 4, !invariant.load !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !377)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !380)
  %287 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %271
  %288 = load i32, ptr addrspace(1) %287, align 4, !invariant.load !4, !alias.scope !380, !noalias !377
  %289 = icmp slt i32 %288, 0
  %290 = add i32 %288, 101
  %291 = select i1 %289, i32 %290, i32 %288
  %292 = tail call i32 @llvm.smax.i32(i32 %291, i32 0)
  %293 = tail call i32 @llvm.umin.i32(i32 %292, i32 100)
  %294 = mul nuw nsw i32 %293, 20
  %295 = zext nneg i32 %294 to i64
  %296 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %295
  %297 = getelementptr inbounds i8, ptr addrspace(1) %296, i64 20
  %298 = load float, ptr addrspace(1) %297, align 4, !invariant.load !4, !alias.scope !377, !noalias !380
  %.inv10 = fcmp ole float %298, 0xC1E0000000000000
  %299 = select i1 %.inv10, float 0xC1E0000000000000, float %298
  %300 = fptosi float %299 to i32
  %301 = fcmp oge float %298, 0x41E0000000000000
  %302 = select i1 %301, i32 2147483647, i32 %300
  %303 = fcmp uno float %298, 0.000000e+00
  %304 = select i1 %303, i32 0, i32 %302
  %.not12 = icmp sgt i32 %286, %304
  %305 = extractelement <4 x i8> %40, i64 2
  %306 = getelementptr inbounds i8, ptr addrspace(1) %296, i64 28
  %307 = load float, ptr addrspace(1) %306, align 4, !invariant.load !4, !alias.scope !382, !noalias !385
  %308 = fcmp ogt float %307, 0.000000e+00
  %309 = extractelement <4 x i8> %38, i64 2
  %310 = and i8 %305, 1
  %311 = select i1 %.not12, i8 0, i8 %310
  %312 = select i1 %308, i8 %311, i8 %309
  %313 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %260
  %314 = load <2 x i32>, ptr addrspace(1) %313, align 8, !invariant.load !4
  %315 = extractelement <2 x i32> %314, i32 0
  %316 = extractelement <2 x i32> %314, i32 1
  %317 = tail call i32 @llvm.smax.i32(i32 %315, i32 0)
  %318 = tail call i32 @llvm.umin.i32(i32 %317, i32 1535)
  %319 = tail call i32 @llvm.smax.i32(i32 %316, i32 0)
  %320 = tail call i32 @llvm.umin.i32(i32 %319, i32 13)
  %321 = mul nuw nsw i32 %318, 14
  %322 = add nuw nsw i32 %321, %320
  %323 = zext nneg i32 %322 to i64
  %324 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %323
  %325 = load i32, ptr addrspace(1) %324, align 4, !invariant.load !4
  %326 = icmp slt i32 %325, %276
  %327 = add i32 %325, 165
  %328 = select i1 %326, i32 %327, i32 %325
  %329 = tail call i32 @llvm.smax.i32(i32 %328, i32 0)
  %330 = tail call i32 @llvm.umin.i32(i32 %329, i32 164)
  %331 = mul nuw nsw i32 %330, 165
  %332 = add nuw nsw i32 %331, %.decomposed23
  %333 = zext nneg i32 %332 to i64
  %334 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %333
  %335 = load i32, ptr addrspace(1) %334, align 4, !invariant.load !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !387)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !390)
  %336 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %323
  %337 = load i32, ptr addrspace(1) %336, align 4, !invariant.load !4, !alias.scope !390, !noalias !387
  %338 = icmp slt i32 %337, 0
  %339 = add i32 %337, 101
  %340 = select i1 %338, i32 %339, i32 %337
  %341 = tail call i32 @llvm.smax.i32(i32 %340, i32 0)
  %342 = tail call i32 @llvm.umin.i32(i32 %341, i32 100)
  %343 = mul nuw nsw i32 %342, 20
  %344 = zext nneg i32 %343 to i64
  %345 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %344
  %346 = getelementptr inbounds i8, ptr addrspace(1) %345, i64 20
  %347 = load float, ptr addrspace(1) %346, align 4, !invariant.load !4, !alias.scope !387, !noalias !390
  %.inv13 = fcmp ole float %347, 0xC1E0000000000000
  %348 = select i1 %.inv13, float 0xC1E0000000000000, float %347
  %349 = fptosi float %348 to i32
  %350 = fcmp oge float %347, 0x41E0000000000000
  %351 = select i1 %350, i32 2147483647, i32 %349
  %352 = fcmp uno float %347, 0.000000e+00
  %353 = select i1 %352, i32 0, i32 %351
  %.not15 = icmp sgt i32 %335, %353
  %354 = extractelement <4 x i8> %36, i64 2
  %355 = getelementptr inbounds i8, ptr addrspace(1) %345, i64 28
  %356 = load float, ptr addrspace(1) %355, align 4, !invariant.load !4, !alias.scope !392, !noalias !395
  %357 = fcmp ogt float %356, 0.000000e+00
  %358 = extractelement <4 x i8> %34, i64 2
  %359 = and i8 %354, 1
  %360 = select i1 %.not15, i8 0, i8 %359
  %361 = select i1 %357, i8 %360, i8 %358
  %362 = insertelement <4 x i8> %254, i8 %361, i64 2
  %363 = insertelement <4 x i8> %255, i8 %312, i64 2
  %364 = or disjoint i32 %31, 3
  %365 = udiv i32 %364, 165
  %366 = mul i32 %365, 165
  %.decomposed24 = sub i32 %364, %366
  %367 = shl nuw nsw i32 %365, 1
  %368 = zext nneg i32 %367 to i64
  %369 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %368
  %370 = load <2 x i32>, ptr addrspace(1) %369, align 8, !invariant.load !4
  %371 = extractelement <2 x i32> %370, i32 0
  %372 = extractelement <2 x i32> %370, i32 1
  %373 = tail call i32 @llvm.smax.i32(i32 %371, i32 0)
  %374 = tail call i32 @llvm.umin.i32(i32 %373, i32 1535)
  %375 = tail call i32 @llvm.smax.i32(i32 %372, i32 0)
  %376 = tail call i32 @llvm.umin.i32(i32 %375, i32 13)
  %377 = mul nuw nsw i32 %374, 14
  %378 = add nuw nsw i32 %377, %376
  %379 = zext nneg i32 %378 to i64
  %380 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %379
  %381 = load i32, ptr addrspace(1) %380, align 4, !invariant.load !4
  %382 = zext nneg i32 %365 to i64
  %383 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %382
  %384 = load i32, ptr addrspace(1) %383, align 4, !invariant.load !4
  %385 = icmp slt i32 %381, %384
  %386 = add i32 %381, 165
  %387 = select i1 %385, i32 %386, i32 %381
  %388 = tail call i32 @llvm.smax.i32(i32 %387, i32 0)
  %389 = tail call i32 @llvm.umin.i32(i32 %388, i32 164)
  %390 = mul nuw nsw i32 %389, 165
  %391 = add nuw nsw i32 %390, %.decomposed24
  %392 = zext nneg i32 %391 to i64
  %393 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %392
  %394 = load i32, ptr addrspace(1) %393, align 4, !invariant.load !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !397)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !400)
  %395 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %379
  %396 = load i32, ptr addrspace(1) %395, align 4, !invariant.load !4, !alias.scope !400, !noalias !397
  %397 = icmp slt i32 %396, 0
  %398 = add i32 %396, 101
  %399 = select i1 %397, i32 %398, i32 %396
  %400 = tail call i32 @llvm.smax.i32(i32 %399, i32 0)
  %401 = tail call i32 @llvm.umin.i32(i32 %400, i32 100)
  %402 = mul nuw nsw i32 %401, 20
  %403 = zext nneg i32 %402 to i64
  %404 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %403
  %405 = getelementptr inbounds i8, ptr addrspace(1) %404, i64 20
  %406 = load float, ptr addrspace(1) %405, align 4, !invariant.load !4, !alias.scope !397, !noalias !400
  %.inv16 = fcmp ole float %406, 0xC1E0000000000000
  %407 = select i1 %.inv16, float 0xC1E0000000000000, float %406
  %408 = fptosi float %407 to i32
  %409 = fcmp oge float %406, 0x41E0000000000000
  %410 = select i1 %409, i32 2147483647, i32 %408
  %411 = fcmp uno float %406, 0.000000e+00
  %412 = select i1 %411, i32 0, i32 %410
  %.not18 = icmp sgt i32 %394, %412
  %413 = extractelement <4 x i8> %40, i64 3
  %414 = getelementptr inbounds i8, ptr addrspace(1) %404, i64 28
  %415 = load float, ptr addrspace(1) %414, align 4, !invariant.load !4, !alias.scope !402, !noalias !405
  %416 = fcmp ogt float %415, 0.000000e+00
  %417 = extractelement <4 x i8> %38, i64 3
  %418 = and i8 %413, 1
  %419 = select i1 %.not18, i8 0, i8 %418
  %420 = select i1 %416, i8 %419, i8 %417
  %421 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %368
  %422 = load <2 x i32>, ptr addrspace(1) %421, align 8, !invariant.load !4
  %423 = extractelement <2 x i32> %422, i32 0
  %424 = extractelement <2 x i32> %422, i32 1
  %425 = tail call i32 @llvm.smax.i32(i32 %423, i32 0)
  %426 = tail call i32 @llvm.umin.i32(i32 %425, i32 1535)
  %427 = tail call i32 @llvm.smax.i32(i32 %424, i32 0)
  %428 = tail call i32 @llvm.umin.i32(i32 %427, i32 13)
  %429 = mul nuw nsw i32 %426, 14
  %430 = add nuw nsw i32 %429, %428
  %431 = zext nneg i32 %430 to i64
  %432 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %431
  %433 = load i32, ptr addrspace(1) %432, align 4, !invariant.load !4
  %434 = icmp slt i32 %433, %384
  %435 = add i32 %433, 165
  %436 = select i1 %434, i32 %435, i32 %433
  %437 = tail call i32 @llvm.smax.i32(i32 %436, i32 0)
  %438 = tail call i32 @llvm.umin.i32(i32 %437, i32 164)
  %439 = mul nuw nsw i32 %438, 165
  %440 = add nuw nsw i32 %439, %.decomposed24
  %441 = zext nneg i32 %440 to i64
  %442 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %441
  %443 = load i32, ptr addrspace(1) %442, align 4, !invariant.load !4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !407)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !410)
  %444 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %431
  %445 = load i32, ptr addrspace(1) %444, align 4, !invariant.load !4, !alias.scope !410, !noalias !407
  %446 = icmp slt i32 %445, 0
  %447 = add i32 %445, 101
  %448 = select i1 %446, i32 %447, i32 %445
  %449 = tail call i32 @llvm.smax.i32(i32 %448, i32 0)
  %450 = tail call i32 @llvm.umin.i32(i32 %449, i32 100)
  %451 = mul nuw nsw i32 %450, 20
  %452 = zext nneg i32 %451 to i64
  %453 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %452
  %454 = getelementptr inbounds i8, ptr addrspace(1) %453, i64 20
  %455 = load float, ptr addrspace(1) %454, align 4, !invariant.load !4, !alias.scope !407, !noalias !410
  %.inv19 = fcmp ole float %455, 0xC1E0000000000000
  %456 = select i1 %.inv19, float 0xC1E0000000000000, float %455
  %457 = fptosi float %456 to i32
  %458 = fcmp oge float %455, 0x41E0000000000000
  %459 = select i1 %458, i32 2147483647, i32 %457
  %460 = fcmp uno float %455, 0.000000e+00
  %461 = select i1 %460, i32 0, i32 %459
  %.not21 = icmp sgt i32 %443, %461
  %462 = extractelement <4 x i8> %36, i64 3
  %463 = getelementptr inbounds i8, ptr addrspace(1) %453, i64 28
  %464 = load float, ptr addrspace(1) %463, align 4, !invariant.load !4, !alias.scope !412, !noalias !415
  %465 = fcmp ogt float %464, 0.000000e+00
  %466 = extractelement <4 x i8> %34, i64 3
  %467 = and i8 %462, 1
  %468 = select i1 %.not21, i8 0, i8 %467
  %469 = select i1 %465, i8 %468, i8 %466
  %470 = insertelement <4 x i8> %362, i8 %469, i64 3
  %471 = insertelement <4 x i8> %363, i8 %420, i64 3
  %472 = getelementptr inbounds i8, ptr addrspace(1) %25, i64 %32
  store <4 x i8> %471, ptr addrspace(1) %472, align 4
  %473 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %32
  store <4 x i8> %470, ptr addrspace(1) %473, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_3(ptr noalias writeonly align 256 captures(none) dereferenceable(2030592) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(2030592) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !417
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = shl nuw nsw i32 %6, 2
  %8 = shl nuw nsw i32 %5, 9
  %9 = or disjoint i32 %7, %8
  %10 = zext nneg i32 %9 to i64
  %11 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %10
  store <4 x i8> zeroinitializer, ptr addrspace(1) %11, align 4
  %12 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 %10
  store <4 x i8> zeroinitializer, ptr addrspace(1) %12, align 4
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_9(ptr noalias align 256 dereferenceable(2030592) %0, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %1, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %2, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %3) local_unnamed_addr #6 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !418
  %10 = shl nuw nsw i32 %9, 7
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %12 = or disjoint i32 %10, %11
  %13 = udiv i32 %12, 165
  %14 = mul i32 %13, 165
  %.decomposed = sub i32 %12, %14
  %15 = shl nuw nsw i32 %.decomposed, 3
  %16 = shl nuw nsw i32 %13, 1
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %17
  %19 = load <2 x i32>, ptr addrspace(1) %18, align 8, !invariant.load !4
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %23 = tail call i32 @llvm.umin.i32(i32 %22, i32 1535)
  %24 = tail call i32 @llvm.smax.i32(i32 %21, i32 0)
  %25 = tail call i32 @llvm.umin.i32(i32 %24, i32 13)
  %26 = mul nuw nsw i32 %23, 14
  %27 = add nuw nsw i32 %26, %25
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4
  %31 = zext nneg i32 %12 to i64
  %32 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %31
  %33 = load i8, ptr addrspace(1) %32, align 1, !invariant.load !4
  %.not = icmp eq i32 %.decomposed, %30
  %34 = and i8 %33, 1
  %35 = mul nuw nsw i32 %13, 1322
  %36 = add nuw nsw i32 %35, %15
  %37 = zext nneg i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %37
  %39 = addrspacecast ptr addrspace(1) %38 to ptr
  %40 = ptrtoint ptr %39 to i64
  %41 = and i64 %40, 2
  %42 = sub nsw i64 0, %41
  %43 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 %42
  %44 = trunc nuw nsw i64 %41 to i32
  %45 = shl nuw nsw i32 %44, 3
  %46 = shl nuw nsw i32 255, %45
  %47 = xor i32 %46, -1
  %48 = load i32, ptr addrspace(1) %43, align 4
  %49 = zext nneg i8 %34 to i32
  %50 = select i1 %.not, i32 0, i32 %49
  %51 = shl nuw nsw i32 %50, %45
  br label %52

52:                                               ; preds = %52, %4
  %53 = phi i32 [ %57, %52 ], [ %48, %4 ]
  %54 = and i32 %53, %47
  %55 = or i32 %54, %51
  %56 = cmpxchg ptr addrspace(1) %43, i32 %53, i32 %55 monotonic monotonic, align 4
  %57 = extractvalue { i32, i1 } %56, 0
  %58 = extractvalue { i32, i1 } %56, 1
  br i1 %58, label %59, label %52

59:                                               ; preds = %52
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_6(ptr noalias align 256 dereferenceable(2030592) %0, ptr noalias readonly align 256 captures(none) dereferenceable(660) %1, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %2, ptr noalias readonly align 256 captures(none) dereferenceable(660) %3, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %4, ptr noalias readonly align 256 captures(none) dereferenceable(165) %5) local_unnamed_addr #6 {
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = addrspacecast ptr %3 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !418
  %15 = shl nuw nsw i32 %14, 7
  %16 = or disjoint i32 %15, %13
  %17 = udiv i32 %16, 165
  %18 = mul i32 %17, 165
  %.decomposed = sub i32 %16, %18
  %19 = zext nneg i32 %.decomposed to i64
  %20 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %19
  %21 = load i32, ptr addrspace(1) %20, align 4, !invariant.load !4, !alias.scope !419
  %22 = icmp ult i32 %21, 1322
  br i1 %22, label %23, label %.loopexit

23:                                               ; preds = %6
  %24 = zext nneg i32 %16 to i64
  %25 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %24
  %26 = load i8, ptr addrspace(1) %25, align 1, !invariant.load !4
  %27 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %19
  %28 = load i8, ptr addrspace(1) %27, align 1, !invariant.load !4
  %29 = and i8 %28, %26
  %30 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %19
  %31 = load i32, ptr addrspace(1) %30, align 4, !invariant.load !4
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = tail call i32 @llvm.umin.i32(i32 %32, i32 164)
  %34 = add nuw nsw i32 %33, %18
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %35
  %37 = load i8, ptr addrspace(1) %36, align 1, !invariant.load !4
  %38 = and i8 %29, %37
  %39 = mul nuw nsw i32 %17, 1322
  %40 = add nuw nsw i32 %21, %39
  %41 = zext nneg i32 %40 to i64
  %42 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %41
  %43 = addrspacecast ptr addrspace(1) %42 to ptr
  %44 = ptrtoint ptr %43 to i64
  %45 = and i64 %44, 3
  %46 = sub nsw i64 0, %45
  %47 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 %46
  %48 = trunc nuw nsw i64 %45 to i32
  %49 = shl nuw nsw i32 %48, 3
  %50 = shl nuw i32 255, %49
  %51 = xor i32 %50, -1
  %52 = load i32, ptr addrspace(1) %47, align 4
  %53 = zext i8 %38 to i32
  %54 = shl nuw i32 %53, %49
  br label %55

55:                                               ; preds = %55, %23
  %56 = phi i32 [ %60, %55 ], [ %52, %23 ]
  %57 = and i32 %56, %51
  %58 = or i32 %57, %54
  %59 = cmpxchg ptr addrspace(1) %47, i32 %56, i32 %58 monotonic monotonic, align 4
  %60 = extractvalue { i32, i1 } %59, 0
  %61 = extractvalue { i32, i1 } %59, 1
  br i1 %61, label %.loopexit, label %55

.loopexit:                                        ; preds = %55, %6
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion(ptr noalias align 256 dereferenceable(2030592) %0, ptr noalias readonly align 256 captures(none) dereferenceable(660) %1, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %2, ptr noalias readonly align 256 captures(none) dereferenceable(1536) %3, ptr noalias readonly align 256 captures(none) dereferenceable(1536) %4, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %5, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %6, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %7) local_unnamed_addr #6 {
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %3 to ptr addrspace(1)
  %11 = addrspacecast ptr %4 to ptr addrspace(1)
  %12 = addrspacecast ptr %5 to ptr addrspace(1)
  %13 = addrspacecast ptr %7 to ptr addrspace(1)
  %14 = addrspacecast ptr %6 to ptr addrspace(1)
  %15 = addrspacecast ptr %2 to ptr addrspace(1)
  %16 = addrspacecast ptr %0 to ptr addrspace(1)
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !418
  %19 = shl nuw nsw i32 %18, 7
  %20 = or disjoint i32 %19, %17
  %21 = udiv i32 %20, 165
  %22 = mul i32 %21, 165
  %.decomposed = sub i32 %20, %22
  %23 = zext nneg i32 %.decomposed to i64
  %24 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %23
  %25 = load i32, ptr addrspace(1) %24, align 4, !invariant.load !4, !alias.scope !422
  %26 = icmp ult i32 %25, 1322
  br i1 %26, label %27, label %.loopexit

27:                                               ; preds = %8
  %28 = zext nneg i32 %21 to i64
  %29 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %28
  %30 = load i8, ptr addrspace(1) %29, align 1, !invariant.load !4
  %31 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %28
  %32 = load i8, ptr addrspace(1) %31, align 1, !invariant.load !4
  %33 = or i8 %32, %30
  %34 = shl nuw nsw i32 %21, 1
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %35
  %37 = load <2 x i32>, ptr addrspace(1) %36, align 8, !invariant.load !4
  %38 = extractelement <2 x i32> %37, i32 0
  %39 = extractelement <2 x i32> %37, i32 1
  %40 = tail call i32 @llvm.smax.i32(i32 %38, i32 0)
  %41 = tail call i32 @llvm.umin.i32(i32 %40, i32 1535)
  %42 = tail call i32 @llvm.smax.i32(i32 %39, i32 0)
  %43 = tail call i32 @llvm.umin.i32(i32 %42, i32 13)
  %44 = mul nuw nsw i32 %41, 14
  %45 = add nuw nsw i32 %44, %43
  %46 = zext nneg i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %46
  %48 = load i32, ptr addrspace(1) %47, align 4, !invariant.load !4
  %49 = icmp slt i32 %48, 0
  %50 = add i32 %48, 101
  %51 = select i1 %49, i32 %50, i32 %48
  %52 = tail call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = tail call i32 @llvm.umin.i32(i32 %52, i32 100)
  %54 = mul nuw nsw i32 %53, 20
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr inbounds float, ptr addrspace(1) %14, i64 %55
  %57 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 48
  %58 = load float, ptr addrspace(1) %57, align 16, !invariant.load !4
  %.inv = fcmp ole float %58, 0xC1E0000000000000
  %59 = select i1 %.inv, float 0xC1E0000000000000, float %58
  %60 = fptosi float %59 to i32
  %61 = fcmp oge float %58, 0x41E0000000000000
  %62 = fcmp ord float %58, 0.000000e+00
  %63 = icmp sgt i32 %60, 0
  %64 = select i1 %61, i1 true, i1 %63
  %65 = select i1 %62, i1 %64, i1 false
  %66 = icmp eq i8 %33, 0
  %67 = and i1 %66, %65
  %68 = zext nneg i32 %20 to i64
  %69 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 %68
  %70 = load i8, ptr addrspace(1) %69, align 1, !invariant.load !4
  %71 = and i8 %70, 1
  %72 = mul nuw nsw i32 %21, 1322
  %73 = add nuw nsw i32 %25, %72
  %74 = zext nneg i32 %73 to i64
  %75 = getelementptr inbounds i8, ptr addrspace(1) %16, i64 %74
  %76 = addrspacecast ptr addrspace(1) %75 to ptr
  %77 = ptrtoint ptr %76 to i64
  %78 = and i64 %77, 3
  %79 = sub nsw i64 0, %78
  %80 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 %79
  %81 = trunc nuw nsw i64 %78 to i32
  %82 = shl nuw nsw i32 %81, 3
  %83 = shl nuw i32 255, %82
  %84 = xor i32 %83, -1
  %85 = load i32, ptr addrspace(1) %80, align 4
  %86 = zext nneg i8 %71 to i32
  %87 = select i1 %67, i32 %86, i32 0
  %88 = shl nuw nsw i32 %87, %82
  br label %89

89:                                               ; preds = %89, %27
  %90 = phi i32 [ %94, %89 ], [ %85, %27 ]
  %91 = and i32 %90, %84
  %92 = or i32 %91, %88
  %93 = cmpxchg ptr addrspace(1) %80, i32 %90, i32 %92 monotonic monotonic, align 4
  %94 = extractvalue { i32, i1 } %93, 0
  %95 = extractvalue { i32, i1 } %93, 1
  br i1 %95, label %.loopexit, label %89

.loopexit:                                        ; preds = %89, %8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_5(ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(21504) %2) local_unnamed_addr #3 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %9 = shl nuw nsw i32 %7, 7
  %10 = or disjoint i32 %9, %8
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 %11
  store i8 0, ptr addrspace(1) %12, align 1
  %13 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %11
  store i8 0, ptr addrspace(1) %13, align 1
  %14 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %11
  store i8 0, ptr addrspace(1) %14, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_select_fusion_2(ptr noalias align 256 captures(none) dereferenceable(2030592) %0, ptr noalias readonly align 256 captures(none) dereferenceable(1536) %1, ptr noalias readonly align 256 captures(none) dereferenceable(2030592) %2, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %3, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %2 to ptr addrspace(1)
  %10 = addrspacecast ptr %1 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !417
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %13 = shl nuw nsw i32 %12, 2
  %14 = shl nuw nsw i32 %11, 9
  %15 = or disjoint i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %16
  %18 = load <4 x i8>, ptr addrspace(1) %17, align 4
  %19 = shl nuw nsw i32 %12, 1
  %20 = shl nuw nsw i32 %11, 8
  %21 = or disjoint i32 %19, %20
  %22 = udiv i32 %21, 661
  %23 = urem i32 %15, 1322
  %24 = icmp samesign ugt i32 %23, 1320
  br i1 %24, label %48, label %25

25:                                               ; preds = %5
  %26 = icmp eq i32 %23, 1320
  br i1 %26, label %27, label %45

27:                                               ; preds = %25
  %28 = shl nuw nsw i32 %22, 1
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %29
  %31 = load <2 x i32>, ptr addrspace(1) %30, align 8, !invariant.load !4
  %32 = extractelement <2 x i32> %31, i32 0
  %33 = extractelement <2 x i32> %31, i32 1
  %34 = tail call i32 @llvm.smax.i32(i32 %32, i32 0)
  %35 = tail call i32 @llvm.umin.i32(i32 %34, i32 1535)
  %36 = tail call i32 @llvm.smax.i32(i32 %33, i32 0)
  %37 = tail call i32 @llvm.umin.i32(i32 %36, i32 13)
  %38 = mul nuw nsw i32 %35, 14
  %39 = add nuw nsw i32 %38, %37
  %40 = zext nneg i32 %39 to i64
  %41 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %40
  %42 = load i8, ptr addrspace(1) %41, align 1, !invariant.load !4
  %43 = icmp eq i8 %42, 0
  %44 = zext i1 %43 to i8
  br label %48

45:                                               ; preds = %25
  %46 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %16
  %47 = load i8, ptr addrspace(1) %46, align 4, !invariant.load !4
  br label %48

48:                                               ; preds = %5, %45, %27
  %49 = phi i8 [ 1, %5 ], [ %47, %45 ], [ %44, %27 ]
  %50 = trunc i64 %16 to i32
  %51 = or disjoint i32 %50, 1
  %52 = urem i32 %51, 1322
  %53 = icmp samesign ugt i32 %52, 1320
  %54 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %16
  br i1 %53, label %57, label %55

55:                                               ; preds = %48
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %54, i64 1
  %56 = load i8, ptr addrspace(1) %sunkaddr, align 1, !invariant.load !4
  br label %57

57:                                               ; preds = %48, %55
  %58 = phi i8 [ 1, %48 ], [ %56, %55 ]
  %59 = trunc i64 %16 to i32
  %60 = or disjoint i32 %21, 1
  %61 = udiv i32 %60, 661
  %62 = or disjoint i32 %59, 2
  %63 = urem i32 %62, 1322
  %64 = icmp samesign ugt i32 %63, 1320
  br i1 %64, label %88, label %65

65:                                               ; preds = %57
  %66 = icmp eq i32 %63, 1320
  br i1 %66, label %67, label %85

67:                                               ; preds = %65
  %68 = shl nuw nsw i32 %61, 1
  %69 = zext nneg i32 %68 to i64
  %70 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %69
  %71 = load <2 x i32>, ptr addrspace(1) %70, align 8, !invariant.load !4
  %72 = extractelement <2 x i32> %71, i32 0
  %73 = extractelement <2 x i32> %71, i32 1
  %74 = tail call i32 @llvm.smax.i32(i32 %72, i32 0)
  %75 = tail call i32 @llvm.umin.i32(i32 %74, i32 1535)
  %76 = tail call i32 @llvm.smax.i32(i32 %73, i32 0)
  %77 = tail call i32 @llvm.umin.i32(i32 %76, i32 13)
  %78 = mul nuw nsw i32 %75, 14
  %79 = add nuw nsw i32 %78, %77
  %80 = zext nneg i32 %79 to i64
  %81 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %80
  %82 = load i8, ptr addrspace(1) %81, align 1, !invariant.load !4
  %83 = icmp eq i8 %82, 0
  %84 = zext i1 %83 to i8
  br label %88

85:                                               ; preds = %65
  %86 = getelementptr inbounds i8, ptr addrspace(1) %54, i64 2
  %87 = load i8, ptr addrspace(1) %86, align 2, !invariant.load !4
  br label %88

88:                                               ; preds = %57, %85, %67
  %89 = phi i8 [ 1, %57 ], [ %87, %85 ], [ %84, %67 ]
  %90 = trunc i64 %16 to i32
  %91 = or disjoint i32 %90, 3
  %92 = udiv i32 %91, 1322
  %93 = mul i32 %92, 1322
  %.decomposed = sub i32 %91, %93
  %94 = icmp samesign ugt i32 %.decomposed, 1320
  br i1 %94, label %97, label %95

95:                                               ; preds = %88
  %sunkaddr32 = getelementptr inbounds i8, ptr addrspace(1) %54, i64 3
  %96 = load i8, ptr addrspace(1) %sunkaddr32, align 1, !invariant.load !4
  br label %97

97:                                               ; preds = %88, %95
  %98 = phi i8 [ 1, %88 ], [ %96, %95 ]
  %99 = zext nneg i32 %92 to i64
  %100 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %99
  %101 = load i8, ptr addrspace(1) %100, align 1, !invariant.load !4
  %102 = zext nneg i32 %22 to i64
  %103 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %102
  %104 = load i8, ptr addrspace(1) %103, align 1, !invariant.load !4
  %105 = trunc i8 %104 to i1
  %106 = extractelement <4 x i8> %18, i64 0
  %107 = select i1 %105, i8 %49, i8 %106
  %108 = insertelement <4 x i8> poison, i8 %107, i64 0
  %109 = extractelement <4 x i8> %18, i64 1
  %110 = select i1 %105, i8 %58, i8 %109
  %111 = insertelement <4 x i8> %108, i8 %110, i64 1
  %112 = zext nneg i32 %61 to i64
  %113 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %112
  %114 = load i8, ptr addrspace(1) %113, align 1, !invariant.load !4
  %115 = trunc i8 %114 to i1
  %116 = extractelement <4 x i8> %18, i64 2
  %117 = select i1 %115, i8 %89, i8 %116
  %118 = insertelement <4 x i8> %111, i8 %117, i64 2
  %119 = extractelement <4 x i8> %18, i64 3
  %120 = trunc i8 %101 to i1
  %121 = select i1 %120, i8 %98, i8 %119
  %122 = insertelement <4 x i8> %118, i8 %121, i64 3
  store <4 x i8> %122, ptr addrspace(1) %17, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_transpose_fusion_3(ptr noalias readonly align 256 captures(none) dereferenceable(86016) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %8) local_unnamed_addr #0 {
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %2 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %5 to ptr addrspace(1)
  %16 = addrspacecast ptr %6 to ptr addrspace(1)
  %17 = addrspacecast ptr %7 to ptr addrspace(1)
  %18 = addrspacecast ptr %8 to ptr addrspace(1)
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !425
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %21 = shl nuw nsw i32 %19, 7
  %22 = or disjoint i32 %21, %20
  %23 = udiv i32 %22, 3
  %24 = mul i32 %23, 3
  %.decomposed = sub i32 %22, %24
  %25 = udiv i32 %22, 42
  switch i32 %.decomposed, label %.fold.split [
    i32 0, label %33
    i32 1, label %26
  ]

26:                                               ; preds = %9
  %27 = zext nneg i32 %23 to i64
  %28 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %27
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !4
  %30 = icmp slt i32 %29, 0
  %31 = add i32 %29, 165
  %32 = select i1 %30, i32 %31, i32 %29
  br label %33

.fold.split:                                      ; preds = %9
  br label %33

33:                                               ; preds = %9, %.fold.split, %26
  %34 = phi i32 [ %25, %9 ], [ %32, %26 ], [ 4, %.fold.split ]
  %35 = phi i32 [ %25, %9 ], [ %32, %26 ], [ 8, %.fold.split ]
  %36 = phi i32 [ %25, %9 ], [ %32, %26 ], [ 5, %.fold.split ]
  %37 = phi i32 [ %25, %9 ], [ %32, %26 ], [ 9, %.fold.split ]
  %38 = phi i32 [ %25, %9 ], [ %32, %26 ], [ 0, %.fold.split ]
  %39 = phi i32 [ %25, %9 ], [ %32, %26 ], [ 1, %.fold.split ]
  %40 = phi i32 [ %25, %9 ], [ %32, %26 ], [ 2, %.fold.split ]
  %41 = phi i32 [ %25, %9 ], [ %32, %26 ], [ 3, %.fold.split ]
  %42 = zext nneg i32 %22 to i64
  %43 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %42
  store i32 %34, ptr addrspace(1) %43, align 4
  %44 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %42
  store i32 %35, ptr addrspace(1) %44, align 4
  %45 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %42
  store i32 %36, ptr addrspace(1) %45, align 4
  %46 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %42
  store i32 %37, ptr addrspace(1) %46, align 4
  %47 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %42
  store i32 %38, ptr addrspace(1) %47, align 4
  %48 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %42
  store i32 %39, ptr addrspace(1) %48, align 4
  %49 = getelementptr inbounds i32, ptr addrspace(1) %17, i64 %42
  store i32 %40, ptr addrspace(1) %49, align 4
  %50 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %42
  store i32 %41, ptr addrspace(1) %50, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_2(ptr noalias writeonly align 256 captures(none) dereferenceable(12165120) %0) local_unnamed_addr #3 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !426
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %4, 2
  %6 = shl nuw nsw i32 %3, 9
  %7 = or disjoint i32 %5, %6
  %8 = zext nneg i32 %7 to i64
  %9 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %8
  store <4 x float> zeroinitializer, ptr addrspace(1) %9, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_28(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %3, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %4, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %5) local_unnamed_addr #8 {
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %4 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %15 = mul nuw nsw i32 %13, 3
  %16 = mul nuw nsw i32 %14, 384
  %17 = add nuw nsw i32 %15, %16
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %18
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 4
  %22 = load i32, ptr addrspace(1) %21, align 4, !invariant.load !4
  %23 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 8
  %24 = load i32, ptr addrspace(1) %23, align 4, !invariant.load !4
  %25 = icmp ult i32 %20, 1536
  %26 = icmp ult i32 %22, 165
  %27 = and i1 %25, %26
  %28 = icmp ult i32 %24, 12
  %29 = and i1 %27, %28
  br i1 %29, label %30, label %67

30:                                               ; preds = %6
  %31 = shl nuw nsw i32 %14, 7
  %32 = or disjoint i32 %31, %13
  %33 = udiv i32 %32, 14
  %34 = zext nneg i32 %32 to i64
  %35 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %34
  %36 = load i32, ptr addrspace(1) %35, align 4, !invariant.load !4
  %37 = zext nneg i32 %33 to i64
  %38 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %37
  %39 = load i32, ptr addrspace(1) %38, align 4, !invariant.load !4
  %40 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %37
  %41 = load i32, ptr addrspace(1) %40, align 4, !invariant.load !4
  %42 = tail call i32 @llvm.smax.i32(i32 %39, i32 %41)
  %43 = icmp sgt i32 %39, 13
  %44 = icmp sgt i32 %42, 6
  %45 = select i1 %43, i1 true, i1 %44
  %46 = zext i1 %45 to i32
  %47 = icmp eq i32 %36, %46
  %48 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %34
  %49 = load i8, ptr addrspace(1) %48, align 1, !invariant.load !4
  %50 = and i8 %49, 1
  %51 = uitofp nneg i8 %50 to float
  %52 = trunc i8 %49 to i1
  %53 = select i1 %52, i1 %47, i1 false
  %54 = select i1 %53, float %51, float 0.000000e+00
  %55 = mul nuw nsw i32 %20, 1980
  %56 = mul nuw nsw i32 %22, 12
  %57 = add nuw nsw i32 %56, %55
  %58 = add nuw nsw i32 %57, %24
  %59 = zext nneg i32 %58 to i64
  %60 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4
  %62 = fcmp ord float %61, 0.000000e+00
  %63 = fcmp ult float %61, %54
  %or.cond = select i1 %62, i1 %63, i1 false
  %64 = bitcast float %54 to i32
  br i1 %or.cond, label %65, label %67

65:                                               ; preds = %30
  %66 = atomicrmw max ptr addrspace(1) %60, i32 %64 monotonic, align 4
  br label %67

67:                                               ; preds = %30, %65, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_transpose_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(86016) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(258048) %8) local_unnamed_addr #0 {
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %2 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %5 to ptr addrspace(1)
  %16 = addrspacecast ptr %6 to ptr addrspace(1)
  %17 = addrspacecast ptr %7 to ptr addrspace(1)
  %18 = addrspacecast ptr %8 to ptr addrspace(1)
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !425
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %21 = shl nuw nsw i32 %19, 7
  %22 = or disjoint i32 %21, %20
  %23 = udiv i32 %22, 3
  %24 = mul i32 %23, 3
  %.decomposed = sub i32 %22, %24
  %25 = udiv i32 %22, 42
  switch i32 %.decomposed, label %.fold.split [
    i32 0, label %30
    i32 1, label %26
  ]

26:                                               ; preds = %9
  %27 = zext nneg i32 %23 to i64
  %28 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %27
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !4
  br label %30

.fold.split:                                      ; preds = %9
  br label %30

30:                                               ; preds = %9, %.fold.split, %26
  %31 = phi i32 [ %25, %9 ], [ %29, %26 ], [ 9, %.fold.split ]
  %32 = phi i32 [ %25, %9 ], [ %29, %26 ], [ 0, %.fold.split ]
  %33 = phi i32 [ %25, %9 ], [ %29, %26 ], [ 1, %.fold.split ]
  %34 = phi i32 [ %25, %9 ], [ %29, %26 ], [ 2, %.fold.split ]
  %35 = phi i32 [ %25, %9 ], [ %29, %26 ], [ 3, %.fold.split ]
  %36 = phi i32 [ %25, %9 ], [ %29, %26 ], [ 4, %.fold.split ]
  %37 = phi i32 [ %25, %9 ], [ %29, %26 ], [ 5, %.fold.split ]
  %38 = phi i32 [ %25, %9 ], [ %29, %26 ], [ 8, %.fold.split ]
  %39 = zext nneg i32 %22 to i64
  %40 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %39
  store i32 %31, ptr addrspace(1) %40, align 4
  %41 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %39
  store i32 %32, ptr addrspace(1) %41, align 4
  %42 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %39
  store i32 %33, ptr addrspace(1) %42, align 4
  %43 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %39
  store i32 %34, ptr addrspace(1) %43, align 4
  %44 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %39
  store i32 %35, ptr addrspace(1) %44, align 4
  %45 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %39
  store i32 %36, ptr addrspace(1) %45, align 4
  %46 = getelementptr inbounds i32, ptr addrspace(1) %17, i64 %39
  store i32 %37, ptr addrspace(1) %46, align 4
  %47 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %39
  store i32 %38, ptr addrspace(1) %47, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_27(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %3, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %4, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %5, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %6) local_unnamed_addr #8 {
  %8 = addrspacecast ptr %1 to ptr addrspace(1)
  %9 = addrspacecast ptr %4 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %6 to ptr addrspace(1)
  %12 = addrspacecast ptr %3 to ptr addrspace(1)
  %13 = addrspacecast ptr %2 to ptr addrspace(1)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %17 = mul nuw nsw i32 %15, 3
  %18 = mul nuw nsw i32 %16, 384
  %19 = add nuw nsw i32 %17, %18
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %20
  %22 = load i32, ptr addrspace(1) %21, align 4, !invariant.load !4
  %23 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 4
  %24 = load i32, ptr addrspace(1) %23, align 4, !invariant.load !4
  %25 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 8
  %26 = load i32, ptr addrspace(1) %25, align 4, !invariant.load !4
  %27 = icmp ult i32 %22, 1536
  %28 = icmp ult i32 %24, 165
  %29 = and i1 %27, %28
  %30 = icmp ult i32 %26, 12
  %31 = and i1 %29, %30
  br i1 %31, label %32, label %71

32:                                               ; preds = %7
  %33 = shl nuw nsw i32 %16, 7
  %34 = or disjoint i32 %33, %15
  %35 = udiv i32 %34, 14
  %36 = zext nneg i32 %34 to i64
  %37 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %36
  %38 = load i32, ptr addrspace(1) %37, align 4, !invariant.load !4
  %39 = zext nneg i32 %35 to i64
  %40 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %39
  %41 = load i32, ptr addrspace(1) %40, align 4, !invariant.load !4
  %42 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %39
  %43 = load i32, ptr addrspace(1) %42, align 4, !invariant.load !4
  %44 = tail call i32 @llvm.smax.i32(i32 %41, i32 %43)
  %45 = icmp sgt i32 %41, 13
  %46 = icmp sgt i32 %44, 6
  %47 = select i1 %45, i1 true, i1 %46
  %48 = zext i1 %47 to i32
  %49 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %36
  %50 = load i8, ptr addrspace(1) %49, align 1, !invariant.load !4
  %51 = icmp eq i32 %38, %48
  %52 = and i8 %50, 1
  %53 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 %36
  %54 = load i8, ptr addrspace(1) %53, align 1, !invariant.load !4
  %55 = uitofp nneg i8 %52 to float
  %56 = trunc i8 %54 to i1
  %57 = select i1 %56, i1 %51, i1 false
  %58 = select i1 %57, float %55, float 0.000000e+00
  %59 = mul nuw nsw i32 %22, 1980
  %60 = mul nuw nsw i32 %24, 12
  %61 = add nuw nsw i32 %60, %59
  %62 = add nuw nsw i32 %61, %26
  %63 = zext nneg i32 %62 to i64
  %64 = getelementptr inbounds float, ptr addrspace(1) %14, i64 %63
  %65 = load float, ptr addrspace(1) %64, align 4
  %66 = fcmp ord float %65, 0.000000e+00
  %67 = fcmp ult float %65, %58
  %or.cond = select i1 %66, i1 %67, i1 false
  %68 = bitcast float %58 to i32
  br i1 %or.cond, label %69, label %71

69:                                               ; preds = %32
  %70 = atomicrmw max ptr addrspace(1) %64, i32 %68 monotonic, align 4
  br label %71

71:                                               ; preds = %32, %69, %7
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_26(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %3, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %4, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %5) local_unnamed_addr #8 {
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %4 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %15 = mul nuw nsw i32 %13, 3
  %16 = mul nuw nsw i32 %14, 384
  %17 = add nuw nsw i32 %15, %16
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %18
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 4
  %22 = load i32, ptr addrspace(1) %21, align 4, !invariant.load !4
  %23 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 8
  %24 = load i32, ptr addrspace(1) %23, align 4, !invariant.load !4
  %25 = icmp ult i32 %20, 1536
  %26 = icmp ult i32 %22, 165
  %27 = and i1 %25, %26
  %28 = icmp ult i32 %24, 12
  %29 = and i1 %27, %28
  br i1 %29, label %30, label %66

30:                                               ; preds = %6
  %31 = shl nuw nsw i32 %14, 7
  %32 = or disjoint i32 %31, %13
  %33 = udiv i32 %32, 14
  %34 = zext nneg i32 %32 to i64
  %35 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %34
  %36 = load i32, ptr addrspace(1) %35, align 4, !invariant.load !4
  %37 = zext nneg i32 %33 to i64
  %38 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %37
  %39 = load i32, ptr addrspace(1) %38, align 4, !invariant.load !4
  %40 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %37
  %41 = load i32, ptr addrspace(1) %40, align 4, !invariant.load !4
  %42 = tail call i32 @llvm.smax.i32(i32 %39, i32 %41)
  %43 = icmp sgt i32 %39, 13
  %44 = icmp sgt i32 %42, 6
  %45 = select i1 %43, i1 true, i1 %44
  %46 = zext i1 %45 to i32
  %.not = icmp eq i32 %36, %46
  %47 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %34
  %48 = load i8, ptr addrspace(1) %47, align 1, !invariant.load !4
  %49 = and i8 %48, 1
  %50 = uitofp nneg i8 %49 to float
  %51 = select i1 %.not, float 0.000000e+00, float %50
  %52 = trunc i8 %48 to i1
  %53 = select i1 %52, float %51, float 0.000000e+00
  %54 = mul nuw nsw i32 %20, 1980
  %55 = mul nuw nsw i32 %22, 12
  %56 = add nuw nsw i32 %55, %54
  %57 = add nuw nsw i32 %56, %24
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %58
  %60 = load float, ptr addrspace(1) %59, align 4
  %61 = fcmp ord float %60, 0.000000e+00
  %62 = fcmp ult float %60, %53
  %or.cond = select i1 %61, i1 %62, i1 false
  %63 = bitcast float %53 to i32
  br i1 %or.cond, label %64, label %66

64:                                               ; preds = %30
  %65 = atomicrmw max ptr addrspace(1) %59, i32 %63 monotonic, align 4
  br label %66

66:                                               ; preds = %30, %64, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_25(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %3, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %4, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %5, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %6) local_unnamed_addr #8 {
  %8 = addrspacecast ptr %1 to ptr addrspace(1)
  %9 = addrspacecast ptr %4 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %6 to ptr addrspace(1)
  %12 = addrspacecast ptr %3 to ptr addrspace(1)
  %13 = addrspacecast ptr %2 to ptr addrspace(1)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %17 = mul nuw nsw i32 %15, 3
  %18 = mul nuw nsw i32 %16, 384
  %19 = add nuw nsw i32 %17, %18
  %20 = zext nneg i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %20
  %22 = load i32, ptr addrspace(1) %21, align 4, !invariant.load !4
  %23 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 4
  %24 = load i32, ptr addrspace(1) %23, align 4, !invariant.load !4
  %25 = getelementptr inbounds i8, ptr addrspace(1) %21, i64 8
  %26 = load i32, ptr addrspace(1) %25, align 4, !invariant.load !4
  %27 = icmp ult i32 %22, 1536
  %28 = icmp ult i32 %24, 165
  %29 = and i1 %27, %28
  %30 = icmp ult i32 %26, 12
  %31 = and i1 %29, %30
  br i1 %31, label %32, label %70

32:                                               ; preds = %7
  %33 = shl nuw nsw i32 %16, 7
  %34 = or disjoint i32 %33, %15
  %35 = udiv i32 %34, 14
  %36 = zext nneg i32 %34 to i64
  %37 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %36
  %38 = load i32, ptr addrspace(1) %37, align 4, !invariant.load !4
  %39 = zext nneg i32 %35 to i64
  %40 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %39
  %41 = load i32, ptr addrspace(1) %40, align 4, !invariant.load !4
  %42 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %39
  %43 = load i32, ptr addrspace(1) %42, align 4, !invariant.load !4
  %44 = tail call i32 @llvm.smax.i32(i32 %41, i32 %43)
  %45 = icmp sgt i32 %41, 13
  %46 = icmp sgt i32 %44, 6
  %47 = select i1 %45, i1 true, i1 %46
  %48 = zext i1 %47 to i32
  %49 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %36
  %50 = load i8, ptr addrspace(1) %49, align 1, !invariant.load !4
  %.not = icmp eq i32 %38, %48
  %51 = and i8 %50, 1
  %52 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 %36
  %53 = load i8, ptr addrspace(1) %52, align 1, !invariant.load !4
  %54 = uitofp nneg i8 %51 to float
  %55 = select i1 %.not, float 0.000000e+00, float %54
  %56 = trunc i8 %53 to i1
  %57 = select i1 %56, float %55, float 0.000000e+00
  %58 = mul nuw nsw i32 %22, 1980
  %59 = mul nuw nsw i32 %24, 12
  %60 = add nuw nsw i32 %59, %58
  %61 = add nuw nsw i32 %60, %26
  %62 = zext nneg i32 %61 to i64
  %63 = getelementptr inbounds float, ptr addrspace(1) %14, i64 %62
  %64 = load float, ptr addrspace(1) %63, align 4
  %65 = fcmp ord float %64, 0.000000e+00
  %66 = fcmp ult float %64, %57
  %or.cond = select i1 %65, i1 %66, i1 false
  %67 = bitcast float %57 to i32
  br i1 %or.cond, label %68, label %70

68:                                               ; preds = %32
  %69 = atomicrmw max ptr addrspace(1) %63, i32 %67 monotonic, align 4
  br label %70

70:                                               ; preds = %32, %68, %7
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #10

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.div.full(float, float) #12

define ptx_kernel void @fusion_487(ptr noalias align 256 dereferenceable(21504) %arg0, ptr noalias align 256 dereferenceable(86016) %arg1, ptr noalias align 256 dereferenceable(86016) %arg2) local_unnamed_addr #13 {
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %3 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  %5 = zext nneg i32 %4 to i64
  %6 = mul nuw nsw i64 %5, 448
  %7 = getelementptr i8, ptr addrspace(1) %1, i64 %6
  %8 = tail call range(i32 0, 64) i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  %9 = lshr i32 %8, 3
  %narrow = mul nuw nsw i32 %9, 14
  %10 = shl nuw nsw i32 %8, 1
  %11 = and i32 %10, 14
  %narrow4 = add nuw nsw i32 %narrow, %11
  %12 = zext nneg i32 %narrow4 to i64
  %13 = getelementptr i8, ptr addrspace(1) %7, i64 %12
  %14 = getelementptr i8, ptr addrspace(1) %13, i64 112
  %15 = getelementptr i8, ptr addrspace(1) %13, i64 224
  %16 = getelementptr i8, ptr addrspace(1) %13, i64 336
  %17 = icmp ne i32 %11, 14
  %18 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %13, i1 %17) #17
  %19 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %14, i1 %17) #17
  %20 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %15, i1 %17) #17
  %21 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %16, i1 %17) #17
  %22 = trunc i16 %18 to i1
  %23 = and i16 %18, 256
  %.not = icmp eq i16 %23, 0
  %24 = trunc i16 %19 to i1
  %25 = and i16 %19, 256
  %.not8 = icmp eq i16 %25, 0
  %26 = trunc i16 %20 to i1
  %27 = and i16 %20, 256
  %.not9 = icmp eq i16 %27, 0
  %28 = trunc i16 %21 to i1
  %29 = and i16 %21, 256
  %.not10 = icmp eq i16 %29, 0
  %30 = getelementptr float, ptr addrspace(1) %2, i64 %6
  %31 = getelementptr float, ptr addrspace(1) %30, i64 %12
  %32 = getelementptr i8, ptr addrspace(1) %31, i64 448
  %33 = getelementptr i8, ptr addrspace(1) %31, i64 896
  %34 = getelementptr i8, ptr addrspace(1) %31, i64 1344
  %35 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %31, i1 %17) #17
  %36 = extractvalue { i32, i32 } %35, 0
  %37 = extractvalue { i32, i32 } %35, 1
  %38 = bitcast i32 %36 to float
  %39 = bitcast i32 %37 to float
  %40 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %32, i1 %17) #17
  %41 = extractvalue { i32, i32 } %40, 0
  %42 = extractvalue { i32, i32 } %40, 1
  %43 = bitcast i32 %41 to float
  %44 = bitcast i32 %42 to float
  %45 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %33, i1 %17) #17
  %46 = extractvalue { i32, i32 } %45, 0
  %47 = extractvalue { i32, i32 } %45, 1
  %48 = bitcast i32 %46 to float
  %49 = bitcast i32 %47 to float
  %50 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %34, i1 %17) #17
  %51 = extractvalue { i32, i32 } %50, 0
  %52 = extractvalue { i32, i32 } %50, 1
  %53 = bitcast i32 %51 to float
  %54 = bitcast i32 %52 to float
  %.not11 = icmp eq i32 %11, 14
  %55 = fadd float %38, %39
  %56 = select i1 %.not11, float 0.000000e+00, float %55
  %57 = fadd float %43, %44
  %58 = select i1 %.not11, float 0.000000e+00, float %57
  %59 = fadd float %48, %49
  %60 = select i1 %.not11, float 0.000000e+00, float %59
  %61 = fadd float %53, %54
  %62 = select i1 %.not11, float 0.000000e+00, float %61
  %63 = bitcast float %56 to i32
  %64 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %63, i32 4, i32 31)
  %65 = bitcast i32 %64 to float
  %66 = fadd float %56, %65
  %67 = bitcast float %66 to i32
  %68 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %67, i32 2, i32 31)
  %69 = bitcast i32 %68 to float
  %70 = fadd float %66, %69
  %71 = bitcast float %70 to i32
  %72 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %71, i32 1, i32 31)
  %73 = bitcast i32 %72 to float
  %74 = fadd float %70, %73
  %75 = bitcast float %58 to i32
  %76 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %75, i32 4, i32 31)
  %77 = bitcast i32 %76 to float
  %78 = fadd float %58, %77
  %79 = bitcast float %78 to i32
  %80 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %79, i32 2, i32 31)
  %81 = bitcast i32 %80 to float
  %82 = fadd float %78, %81
  %83 = bitcast float %82 to i32
  %84 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %83, i32 1, i32 31)
  %85 = bitcast i32 %84 to float
  %86 = fadd float %82, %85
  %87 = bitcast float %60 to i32
  %88 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %87, i32 4, i32 31)
  %89 = bitcast i32 %88 to float
  %90 = fadd float %60, %89
  %91 = bitcast float %90 to i32
  %92 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %91, i32 2, i32 31)
  %93 = bitcast i32 %92 to float
  %94 = fadd float %90, %93
  %95 = bitcast float %94 to i32
  %96 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %95, i32 1, i32 31)
  %97 = bitcast i32 %96 to float
  %98 = fadd float %94, %97
  %99 = bitcast float %62 to i32
  %100 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %99, i32 4, i32 31)
  %101 = bitcast i32 %100 to float
  %102 = fadd float %62, %101
  %103 = bitcast float %102 to i32
  %104 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %103, i32 2, i32 31)
  %105 = bitcast i32 %104 to float
  %106 = fadd float %102, %105
  %107 = bitcast float %106 to i32
  %108 = tail call i32 @llvm.nvvm.shfl.sync.bfly.i32(i32 -1, i32 %107, i32 1, i32 31)
  %109 = bitcast i32 %108 to float
  %110 = fadd float %106, %109
  %111 = tail call float @llvm.maximum.f32(float %74, float 1.000000e+00)
  %112 = tail call float @llvm.maximum.f32(float %86, float 1.000000e+00)
  %113 = tail call float @llvm.maximum.f32(float %98, float 1.000000e+00)
  %114 = tail call float @llvm.maximum.f32(float %110, float 1.000000e+00)
  %115 = tail call float @llvm.nvvm.div.full(float %38, float %111)
  %116 = tail call float @llvm.nvvm.div.full(float %39, float %111)
  %117 = tail call float @llvm.nvvm.div.full(float %43, float %112)
  %118 = tail call float @llvm.nvvm.div.full(float %44, float %112)
  %119 = tail call float @llvm.nvvm.div.full(float %48, float %113)
  %120 = tail call float @llvm.nvvm.div.full(float %49, float %113)
  %121 = tail call float @llvm.nvvm.div.full(float %53, float %114)
  %122 = tail call float @llvm.nvvm.div.full(float %54, float %114)
  %123 = getelementptr float, ptr addrspace(1) %3, i64 %6
  %124 = getelementptr float, ptr addrspace(1) %123, i64 %12
  %125 = getelementptr i8, ptr addrspace(1) %124, i64 448
  %126 = getelementptr i8, ptr addrspace(1) %124, i64 896
  %127 = getelementptr i8, ptr addrspace(1) %124, i64 1344
  %128 = bitcast float %115 to i32
  %129 = select i1 %22, i32 %128, i32 0
  %130 = bitcast float %116 to i32
  %131 = select i1 %.not, i32 0, i32 %130
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %129, i32 %131, ptr addrspace(1) %124, i1 %17) #17
  %132 = bitcast float %117 to i32
  %133 = select i1 %24, i32 %132, i32 0
  %134 = bitcast float %118 to i32
  %135 = select i1 %.not8, i32 0, i32 %134
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %133, i32 %135, ptr addrspace(1) %125, i1 %17) #17
  %136 = bitcast float %119 to i32
  %137 = select i1 %26, i32 %136, i32 0
  %138 = bitcast float %120 to i32
  %139 = select i1 %.not9, i32 0, i32 %138
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %137, i32 %139, ptr addrspace(1) %126, i1 %17) #17
  %140 = bitcast float %121 to i32
  %141 = select i1 %28, i32 %140, i32 0
  %142 = bitcast float %122 to i32
  %143 = select i1 %.not10, i32 0, i32 %142
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %141, i32 %143, ptr addrspace(1) %127, i1 %17) #17
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_24(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %2) local_unnamed_addr #8 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = addrspacecast ptr %0 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %9 = mul nuw nsw i32 %7, 3
  %10 = mul nuw nsw i32 %8, 384
  %11 = add nuw nsw i32 %9, %10
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %12
  %14 = load i32, ptr addrspace(1) %13, align 4, !invariant.load !4
  %15 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 4
  %16 = load i32, ptr addrspace(1) %15, align 4, !invariant.load !4
  %17 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 8
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !4
  %19 = icmp ult i32 %14, 1536
  %20 = icmp ult i32 %16, 165
  %21 = and i1 %19, %20
  %22 = icmp ult i32 %18, 12
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %49

24:                                               ; preds = %3
  %25 = mul nuw nsw i32 %14, 1980
  %26 = mul nuw nsw i32 %16, 12
  %27 = add nuw nsw i32 %26, %25
  %28 = add nuw nsw i32 %27, %18
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds float, ptr addrspace(1) %5, i64 %29
  %31 = load float, ptr addrspace(1) %30, align 4
  %32 = fcmp uno float %31, 0.000000e+00
  br i1 %32, label %49, label %33

33:                                               ; preds = %24
  %34 = shl nuw nsw i32 %8, 7
  %35 = or disjoint i32 %34, %7
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %36
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !4
  %39 = fcmp uno float %38, 0.000000e+00
  %40 = select i1 %39, float 0x7FF8000000000000, float %38
  %41 = fcmp ult float %31, %40
  br i1 %41, label %42, label %49

42:                                               ; preds = %33
  %43 = bitcast float %40 to i32
  %44 = icmp sgt i32 %43, -1
  br i1 %44, label %45, label %47

45:                                               ; preds = %42
  %46 = atomicrmw max ptr addrspace(1) %30, i32 %43 monotonic, align 4
  br label %49

47:                                               ; preds = %42
  %48 = atomicrmw umin ptr addrspace(1) %30, i32 %43 monotonic, align 4
  br label %49

49:                                               ; preds = %24, %47, %45, %33, %3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_22(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %4) local_unnamed_addr #8 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %2 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %13 = mul nuw nsw i32 %11, 3
  %14 = mul nuw nsw i32 %12, 384
  %15 = add nuw nsw i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %16
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !4
  %19 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 4
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 8
  %22 = load i32, ptr addrspace(1) %21, align 4, !invariant.load !4
  %23 = icmp ult i32 %18, 1536
  %24 = icmp ult i32 %20, 165
  %25 = and i1 %23, %24
  %26 = icmp ult i32 %22, 12
  %27 = and i1 %25, %26
  br i1 %27, label %28, label %68

28:                                               ; preds = %5
  %29 = shl nuw nsw i32 %12, 7
  %30 = or disjoint i32 %29, %11
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %31
  %33 = load i32, ptr addrspace(1) %32, align 4, !invariant.load !4
  %34 = icmp slt i32 %33, 0
  %35 = add i32 %33, 101
  %36 = select i1 %34, i32 %35, i32 %33
  %37 = tail call i32 @llvm.smax.i32(i32 %36, i32 0)
  %38 = tail call i32 @llvm.umin.i32(i32 %37, i32 100)
  %39 = mul nuw nsw i32 %38, 20
  %40 = zext nneg i32 %39 to i64
  %41 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %40
  %42 = getelementptr inbounds i8, ptr addrspace(1) %41, i64 48
  %43 = load float, ptr addrspace(1) %42, align 16, !invariant.load !4
  %.inv = fcmp ole float %43, 0xC1E0000000000000
  %44 = select i1 %.inv, float 0xC1E0000000000000, float %43
  %45 = fptosi float %44 to i32
  %46 = fcmp oge float %43, 0x41E0000000000000
  %47 = fcmp ord float %43, 0.000000e+00
  %48 = icmp sgt i32 %45, 0
  %49 = select i1 %46, i1 true, i1 %48
  %50 = select i1 %47, i1 %49, i1 false
  %51 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %31
  %52 = load i8, ptr addrspace(1) %51, align 1, !invariant.load !4
  %53 = uitofp i1 %50 to float
  %54 = trunc i8 %52 to i1
  %55 = select i1 %54, float %53, float 0.000000e+00
  %56 = mul nuw nsw i32 %18, 1980
  %57 = mul nuw nsw i32 %20, 12
  %58 = add nuw nsw i32 %57, %56
  %59 = add nuw nsw i32 %58, %22
  %60 = zext nneg i32 %59 to i64
  %61 = getelementptr inbounds float, ptr addrspace(1) %10, i64 %60
  %62 = load float, ptr addrspace(1) %61, align 4
  %63 = fcmp ord float %62, 0.000000e+00
  %64 = fcmp ult float %62, %55
  %or.cond = select i1 %63, i1 %64, i1 false
  %65 = bitcast float %55 to i32
  br i1 %or.cond, label %66, label %68

66:                                               ; preds = %28
  %67 = atomicrmw max ptr addrspace(1) %61, i32 %65 monotonic, align 4
  br label %68

68:                                               ; preds = %28, %66, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_20(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %3) local_unnamed_addr #8 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %11 = mul nuw nsw i32 %9, 3
  %12 = mul nuw nsw i32 %10, 384
  %13 = add nuw nsw i32 %11, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %14
  %16 = load i32, ptr addrspace(1) %15, align 4, !invariant.load !4
  %17 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 4
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !4
  %19 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 8
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = icmp ult i32 %16, 1536
  %22 = icmp ult i32 %18, 165
  %23 = and i1 %21, %22
  %24 = icmp ult i32 %20, 12
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %53

26:                                               ; preds = %4
  %27 = shl nuw nsw i32 %10, 7
  %28 = or disjoint i32 %27, %9
  %29 = udiv i32 %28, 14
  %30 = mul i32 %29, 14
  %.decomposed = sub i32 %28, %30
  %31 = zext nneg i32 %29 to i64
  %32 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %31
  %33 = load i32, ptr addrspace(1) %32, align 4, !invariant.load !4
  %34 = icmp eq i32 %.decomposed, %33
  %35 = zext nneg i32 %28 to i64
  %36 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %35
  %37 = load i8, ptr addrspace(1) %36, align 1, !invariant.load !4
  %38 = uitofp i1 %34 to float
  %39 = trunc i8 %37 to i1
  %40 = select i1 %39, float %38, float 0.000000e+00
  %41 = mul nuw nsw i32 %16, 1980
  %42 = mul nuw nsw i32 %18, 12
  %43 = add nuw nsw i32 %42, %41
  %44 = add nuw nsw i32 %43, %20
  %45 = zext nneg i32 %44 to i64
  %46 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4
  %48 = fcmp ord float %47, 0.000000e+00
  %49 = fcmp ult float %47, %40
  %or.cond = select i1 %48, i1 %49, i1 false
  %50 = bitcast float %40 to i32
  br i1 %or.cond, label %51, label %53

51:                                               ; preds = %26
  %52 = atomicrmw max ptr addrspace(1) %46, i32 %50 monotonic, align 4
  br label %53

53:                                               ; preds = %26, %51, %4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_18(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %3) local_unnamed_addr #8 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %11 = mul nuw nsw i32 %9, 3
  %12 = mul nuw nsw i32 %10, 384
  %13 = add nuw nsw i32 %11, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %14
  %16 = load i32, ptr addrspace(1) %15, align 4, !invariant.load !4
  %17 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 4
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !4
  %19 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 8
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = icmp ult i32 %16, 1536
  %22 = icmp ult i32 %18, 165
  %23 = and i1 %21, %22
  %24 = icmp ult i32 %20, 12
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %124

26:                                               ; preds = %4
  %27 = shl nuw nsw i32 %10, 7
  %28 = or disjoint i32 %27, %9
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %29
  %31 = load i32, ptr addrspace(1) %30, align 4, !invariant.load !4
  %32 = urem i32 %28, 14
  %33 = sub nuw nsw i32 %28, %32
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %34
  %36 = load i32, ptr addrspace(1) %35, align 4, !invariant.load !4
  %37 = icmp sgt i32 %36, %31
  %38 = zext i1 %37 to i32
  %39 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 4
  %40 = load i32, ptr addrspace(1) %39, align 4, !invariant.load !4
  %41 = icmp sgt i32 %40, %31
  %42 = zext i1 %41 to i32
  %43 = add nuw nsw i32 %42, %38
  %44 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 8
  %45 = load i32, ptr addrspace(1) %44, align 4, !invariant.load !4
  %46 = icmp sgt i32 %45, %31
  %47 = zext i1 %46 to i32
  %48 = add nuw nsw i32 %43, %47
  %49 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 12
  %50 = load i32, ptr addrspace(1) %49, align 4, !invariant.load !4
  %51 = icmp sgt i32 %50, %31
  %52 = zext i1 %51 to i32
  %53 = add nuw nsw i32 %48, %52
  %54 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 16
  %55 = load i32, ptr addrspace(1) %54, align 4, !invariant.load !4
  %56 = icmp sgt i32 %55, %31
  %57 = zext i1 %56 to i32
  %58 = add nuw nsw i32 %53, %57
  %59 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 20
  %60 = load i32, ptr addrspace(1) %59, align 4, !invariant.load !4
  %61 = icmp sgt i32 %60, %31
  %62 = zext i1 %61 to i32
  %63 = add nuw nsw i32 %58, %62
  %64 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 24
  %65 = load i32, ptr addrspace(1) %64, align 4, !invariant.load !4
  %66 = icmp sgt i32 %65, %31
  %67 = zext i1 %66 to i32
  %68 = add nuw nsw i32 %63, %67
  %69 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 28
  %70 = load i32, ptr addrspace(1) %69, align 4, !invariant.load !4
  %71 = icmp sgt i32 %70, %31
  %72 = zext i1 %71 to i32
  %73 = add nuw nsw i32 %68, %72
  %74 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 32
  %75 = load i32, ptr addrspace(1) %74, align 4, !invariant.load !4
  %76 = icmp sgt i32 %75, %31
  %77 = zext i1 %76 to i32
  %78 = add nuw nsw i32 %73, %77
  %79 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 36
  %80 = load i32, ptr addrspace(1) %79, align 4, !invariant.load !4
  %81 = icmp sgt i32 %80, %31
  %82 = zext i1 %81 to i32
  %83 = add nuw nsw i32 %78, %82
  %84 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 40
  %85 = load i32, ptr addrspace(1) %84, align 4, !invariant.load !4
  %86 = icmp sgt i32 %85, %31
  %87 = zext i1 %86 to i32
  %88 = add nuw nsw i32 %83, %87
  %89 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 44
  %90 = load i32, ptr addrspace(1) %89, align 4, !invariant.load !4
  %91 = icmp sgt i32 %90, %31
  %92 = zext i1 %91 to i32
  %93 = add nuw nsw i32 %88, %92
  %94 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 48
  %95 = load i32, ptr addrspace(1) %94, align 4, !invariant.load !4
  %96 = icmp sgt i32 %95, %31
  %97 = zext i1 %96 to i32
  %98 = add nuw nsw i32 %93, %97
  %99 = getelementptr inbounds i8, ptr addrspace(1) %35, i64 52
  %100 = load i32, ptr addrspace(1) %99, align 4, !invariant.load !4
  %101 = icmp sgt i32 %100, %31
  %102 = zext i1 %101 to i32
  %103 = add nuw nsw i32 %98, %102
  %104 = uitofp nneg i32 %103 to float
  %105 = fmul float %104, 0x3FB24924A0000000
  %106 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %29
  %107 = load i8, ptr addrspace(1) %106, align 1, !invariant.load !4
  %108 = tail call float @llvm.maximum.f32(float %105, float 0.000000e+00)
  %109 = tail call float @llvm.minimum.f32(float %108, float 1.000000e+00)
  %110 = trunc i8 %107 to i1
  %111 = select i1 %110, float %109, float 0.000000e+00
  %112 = mul nuw nsw i32 %16, 1980
  %113 = mul nuw nsw i32 %18, 12
  %114 = add nuw nsw i32 %113, %112
  %115 = add nuw nsw i32 %114, %20
  %116 = zext nneg i32 %115 to i64
  %117 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %116
  %118 = load float, ptr addrspace(1) %117, align 4
  %119 = fcmp ord float %118, 0.000000e+00
  %120 = fcmp ult float %118, %111
  %or.cond = select i1 %119, i1 %120, i1 false
  %121 = bitcast float %111 to i32
  br i1 %or.cond, label %122, label %124

122:                                              ; preds = %26
  %123 = atomicrmw max ptr addrspace(1) %117, i32 %121 monotonic, align 4
  br label %124

124:                                              ; preds = %26, %122, %4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minimum.f32(float, float) #1

; Function Attrs: norecurse nounwind
define ptx_kernel void @input_transpose_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %1, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %2, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %3, ptr noalias readonly align 256 captures(none) dereferenceable(253440) %4, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %5, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(12165120) %7) local_unnamed_addr #7 {
  %9 = addrspacecast ptr %0 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %6 to ptr addrspace(1)
  %12 = addrspacecast ptr %3 to ptr addrspace(1)
  %13 = addrspacecast ptr %4 to ptr addrspace(1)
  %14 = addrspacecast ptr %1 to ptr addrspace(1)
  %15 = addrspacecast ptr %2 to ptr addrspace(1)
  %16 = addrspacecast ptr %7 to ptr addrspace(1)
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !427
  %19 = shl nuw nsw i32 %18, 5
  %20 = and i32 %17, 31
  %21 = or disjoint i32 %19, %20
  %22 = mul nuw nsw i32 %20, 12
  %23 = mul nuw nsw i32 %18, 384
  %24 = add nuw nsw i32 %22, %23
  %25 = lshr i32 %17, 5
  %26 = or disjoint i32 %24, %25
  %27 = zext nneg i32 %26 to i64
  %28 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %27
  %29 = load float, ptr addrspace(1) %28, align 4, !invariant.load !4
  %30 = mul nuw nsw i32 %20, 33
  %31 = add nuw nsw i32 %30, %25
  %32 = zext nneg i32 %31 to i64
  %33 = getelementptr inbounds float, ptr addrspace(3) @shared_0, i64 %32
  store float %29, ptr addrspace(3) %33, align 4
  %34 = or disjoint i32 %25, 4
  %35 = icmp samesign ugt i32 %34, 5
  %36 = icmp ne i32 %25, 3
  %37 = and i1 %36, %35
  br i1 %37, label %38, label %52

38:                                               ; preds = %8
  %39 = udiv i32 %21, 165
  %40 = zext nneg i32 %39 to i64
  %41 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %40
  %42 = load i32, ptr addrspace(1) %41, align 4, !invariant.load !4
  %43 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %40
  %44 = load i32, ptr addrspace(1) %43, align 4, !invariant.load !4
  %.not = icmp slt i32 %42, %44
  %45 = zext nneg i32 %21 to i64
  %46 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %45
  %47 = load i8, ptr addrspace(1) %46, align 1, !invariant.load !4
  %48 = getelementptr inbounds i8, ptr addrspace(1) %13, i64 %45
  %49 = load i8, ptr addrspace(1) %48, align 1, !invariant.load !4
  %50 = select i1 %.not, i8 %49, i8 %47
  %51 = sitofp i8 %50 to float
  br label %62

52:                                               ; preds = %8
  %53 = icmp eq i32 %25, 3
  br i1 %53, label %54, label %59

54:                                               ; preds = %52
  %55 = zext nneg i32 %21 to i64
  %56 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 %55
  %57 = load i8, ptr addrspace(1) %56, align 1, !invariant.load !4
  %58 = sitofp i8 %57 to float
  br label %62

59:                                               ; preds = %52
  %60 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 16
  %61 = load float, ptr addrspace(1) %60, align 4, !invariant.load !4
  br label %62

62:                                               ; preds = %38, %59, %54
  %63 = phi float [ %51, %38 ], [ %61, %59 ], [ %58, %54 ]
  %64 = icmp ne i32 %25, 3
  %65 = getelementptr inbounds i8, ptr addrspace(3) %33, i64 16
  store float %63, ptr addrspace(3) %65, align 4
  %66 = or disjoint i32 %25, 8
  %67 = icmp samesign ugt i32 %66, 9
  %68 = and i1 %64, %67
  br i1 %68, label %69, label %74

69:                                               ; preds = %62
  %70 = zext nneg i32 %21 to i64
  %71 = getelementptr inbounds i8, ptr addrspace(1) %15, i64 %70
  %72 = load i8, ptr addrspace(1) %71, align 1, !invariant.load !4
  %73 = sitofp i8 %72 to float
  br label %77

74:                                               ; preds = %62
  %75 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 32
  %76 = load float, ptr addrspace(1) %75, align 4, !invariant.load !4
  br label %77

77:                                               ; preds = %74, %69
  %78 = phi float [ %76, %74 ], [ %73, %69 ]
  %79 = getelementptr inbounds i8, ptr addrspace(3) %33, i64 32
  store float %78, ptr addrspace(3) %79, align 4
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %80 = icmp samesign ult i32 %20, 12
  br i1 %80, label %81, label %113

81:                                               ; preds = %77
  %82 = mul nuw nsw i32 %25, 33
  %83 = add nuw nsw i32 %82, %20
  %84 = zext nneg i32 %83 to i64
  %85 = getelementptr inbounds float, ptr addrspace(3) @shared_0, i64 %84
  %86 = load float, ptr addrspace(3) %85, align 4
  %87 = mul nuw nsw i32 %25, 12
  %88 = or disjoint i32 %20, %23
  %89 = add nuw nsw i32 %88, %87
  %90 = zext nneg i32 %89 to i64
  %91 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %90
  store float %86, ptr addrspace(1) %91, align 4
  %92 = getelementptr inbounds i8, ptr addrspace(3) %85, i64 528
  %93 = load float, ptr addrspace(3) %92, align 4
  %94 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 192
  store float %93, ptr addrspace(1) %94, align 4
  %95 = getelementptr inbounds i8, ptr addrspace(3) %85, i64 1056
  %96 = load float, ptr addrspace(3) %95, align 4
  %97 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 384
  store float %96, ptr addrspace(1) %97, align 4
  %98 = getelementptr inbounds i8, ptr addrspace(3) %85, i64 1584
  %99 = load float, ptr addrspace(3) %98, align 4
  %100 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 576
  store float %99, ptr addrspace(1) %100, align 4
  %101 = getelementptr inbounds i8, ptr addrspace(3) %85, i64 2112
  %102 = load float, ptr addrspace(3) %101, align 4
  %103 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 768
  store float %102, ptr addrspace(1) %103, align 4
  %104 = getelementptr inbounds i8, ptr addrspace(3) %85, i64 2640
  %105 = load float, ptr addrspace(3) %104, align 4
  %106 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 960
  store float %105, ptr addrspace(1) %106, align 4
  %107 = getelementptr inbounds i8, ptr addrspace(3) %85, i64 3168
  %108 = load float, ptr addrspace(3) %107, align 4
  %109 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 1152
  store float %108, ptr addrspace(1) %109, align 4
  %110 = getelementptr inbounds i8, ptr addrspace(3) %85, i64 3696
  %111 = load float, ptr addrspace(3) %110, align 4
  %112 = getelementptr inbounds i8, ptr addrspace(1) %91, i64 1344
  store float %111, ptr addrspace(1) %112, align 4
  br label %113

113:                                              ; preds = %81, %77
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_13(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %4, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %5, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %6, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %7, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %8, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %9) local_unnamed_addr #14 {
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = addrspacecast ptr %6 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %5 to ptr addrspace(1)
  %16 = addrspacecast ptr %3 to ptr addrspace(1)
  %17 = addrspacecast ptr %2 to ptr addrspace(1)
  %18 = addrspacecast ptr %9 to ptr addrspace(1)
  %19 = addrspacecast ptr %8 to ptr addrspace(1)
  %20 = addrspacecast ptr %7 to ptr addrspace(1)
  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %22 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %23 = mul nuw nsw i32 %21, 3
  %24 = mul nuw nsw i32 %22, 384
  %25 = add nuw nsw i32 %23, %24
  %26 = zext nneg i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %26
  %28 = load i32, ptr addrspace(1) %27, align 4, !invariant.load !4
  %29 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 4
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4
  %31 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 8
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4
  %33 = icmp ult i32 %28, 1536
  %34 = icmp ult i32 %30, 165
  %35 = and i1 %33, %34
  %36 = icmp ult i32 %32, 12
  %37 = and i1 %35, %36
  br i1 %37, label %38, label %202

38:                                               ; preds = %10
  tail call void @llvm.experimental.noalias.scope.decl(metadata !428)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !431)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !433)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !436)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !438)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !441)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !443)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !446)
  %39 = mul nuw nsw i32 %28, 1980
  %40 = mul nuw nsw i32 %30, 12
  %41 = add nuw nsw i32 %40, %39
  %42 = add nuw nsw i32 %41, %32
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = fcmp uno float %45, 0.000000e+00
  br i1 %46, label %202, label %47

47:                                               ; preds = %38
  %48 = shl nuw nsw i32 %22, 7
  %49 = or disjoint i32 %48, %21
  %50 = udiv i32 %49, 14
  %51 = shl nuw nsw i32 %50, 1
  %52 = zext nneg i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %52
  %54 = load <2 x i32>, ptr addrspace(1) %53, align 8, !invariant.load !4
  %55 = extractelement <2 x i32> %54, i32 0
  %56 = extractelement <2 x i32> %54, i32 1
  %57 = tail call i32 @llvm.smax.i32(i32 %55, i32 0)
  %58 = tail call i32 @llvm.umin.i32(i32 %57, i32 1535)
  %59 = zext nneg i32 %58 to i64
  %60 = getelementptr inbounds float, ptr addrspace(1) %14, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4, !invariant.load !4, !alias.scope !446, !noalias !448
  %62 = mul nuw nsw i32 %58, 14
  %63 = tail call i32 @llvm.smax.i32(i32 %56, i32 0)
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 13)
  %65 = add nuw nsw i32 %64, %62
  %66 = zext nneg i32 %65 to i64
  %67 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %66
  %68 = load i32, ptr addrspace(1) %67, align 4, !invariant.load !4, !alias.scope !436, !noalias !433
  %69 = icmp slt i32 %68, 0
  %70 = add i32 %68, 101
  %71 = select i1 %69, i32 %70, i32 %68
  %72 = tail call i32 @llvm.smax.i32(i32 %71, i32 0)
  %73 = tail call i32 @llvm.umin.i32(i32 %72, i32 100)
  %74 = mul nuw nsw i32 %73, 20
  %75 = zext nneg i32 %74 to i64
  %76 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %75
  %77 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 24
  %78 = load float, ptr addrspace(1) %77, align 8, !invariant.load !4, !alias.scope !450, !noalias !453
  %79 = tail call float @llvm.maximum.f32(float %78, float 1.000000e+00)
  %80 = fdiv float %61, %79
  %81 = fcmp uno float %80, 0.000000e+00
  %82 = fcmp oge float %80, 0x41E0000000000000
  %.inv.i11 = fcmp ole float %80, 0xC1E0000000000000
  %83 = select i1 %.inv.i11, float 0xC1E0000000000000, float %80
  %84 = fptosi float %83 to i32
  %85 = tail call i32 @llvm.smax.i32(i32 %84, i32 1)
  %86 = getelementptr inbounds i8, ptr addrspace(1) %76, i64 8
  %87 = load <2 x float>, ptr addrspace(1) %86, align 8, !invariant.load !4, !noalias !4
  %88 = extractelement <2 x float> %87, i32 0
  %89 = extractelement <2 x float> %87, i32 1
  %90 = zext nneg i32 %49 to i64
  %91 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %90
  %92 = load i32, ptr addrspace(1) %91, align 4, !invariant.load !4, !alias.scope !431, !noalias !428
  %93 = icmp slt i32 %92, 0
  %94 = add i32 %92, 101
  %95 = select i1 %93, i32 %94, i32 %92
  %96 = tail call i32 @llvm.smax.i32(i32 %95, i32 0)
  %97 = tail call i32 @llvm.umin.i32(i32 %96, i32 100)
  %98 = mul nuw nsw i32 %97, 20
  %99 = zext nneg i32 %98 to i64
  %100 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %99
  %101 = getelementptr inbounds i8, ptr addrspace(1) %100, i64 16
  %102 = load float, ptr addrspace(1) %101, align 16, !invariant.load !4, !alias.scope !455, !noalias !458
  %103 = zext nneg i32 %50 to i64
  %104 = getelementptr inbounds float, ptr addrspace(1) %14, i64 %103
  %105 = load float, ptr addrspace(1) %104, align 4, !invariant.load !4, !alias.scope !441, !noalias !460
  %106 = getelementptr inbounds i8, ptr addrspace(1) %100, i64 24
  %107 = load float, ptr addrspace(1) %106, align 8, !invariant.load !4, !alias.scope !462, !noalias !465
  %108 = tail call float @llvm.maximum.f32(float %107, float 1.000000e+00)
  %109 = fdiv float %105, %108
  %110 = fcmp uno float %109, 0.000000e+00
  %111 = fcmp oge float %109, 0x41E0000000000000
  %.inv.i = fcmp ole float %109, 0xC1E0000000000000
  %112 = select i1 %.inv.i, float 0xC1E0000000000000, float %109
  %113 = fptosi float %112 to i32
  %114 = tail call i32 @llvm.smax.i32(i32 %113, i32 1)
  %115 = select i1 %111, i32 2147483647, i32 %114
  %116 = select i1 %110, i32 1, i32 %115
  %117 = load float, ptr addrspace(1) %76, align 16, !invariant.load !4, !alias.scope !433, !noalias !436
  %118 = getelementptr inbounds i8, ptr addrspace(1) %100, i64 4
  %119 = load float, ptr addrspace(1) %118, align 4, !invariant.load !4, !alias.scope !428, !noalias !431
  %120 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 %90
  %121 = load i8, ptr addrspace(1) %120, align 1, !invariant.load !4
  %122 = trunc i8 %121 to i1
  %123 = fcmp uno float %88, 0.000000e+00
  %124 = fcmp oge float %88, 0x41E0000000000000
  %.inv7 = fcmp ole float %88, 0xC1E0000000000000
  %125 = select i1 %.inv7, float 0xC1E0000000000000, float %88
  %126 = fptosi float %125 to i32
  %127 = select i1 %124, i32 2147483647, i32 %126
  %128 = select i1 %123, i32 0, i32 %127
  %129 = fcmp uno float %89, 0.000000e+00
  %130 = fcmp oge float %89, 0x41E0000000000000
  %.inv8 = fcmp ole float %89, 0xC1E0000000000000
  %131 = select i1 %.inv8, float 0xC1E0000000000000, float %89
  %132 = fptosi float %131 to i32
  %133 = select i1 %130, i32 2147483647, i32 %132
  %134 = select i1 %129, i32 0, i32 %133
  %135 = add i32 %128, %134
  %136 = sitofp i32 %135 to float
  %137 = fmul float %136, 5.000000e-01
  %138 = uitofp nneg i32 %85 to float
  %139 = select i1 %82, float 0x41E0000000000000, float %138
  %140 = select i1 %81, float 1.000000e+00, float %139
  %141 = fmul float %140, %137
  %142 = fcmp uno float %117, 0.000000e+00
  %143 = fcmp oge float %117, 0x41E0000000000000
  %.inv5 = fcmp ole float %117, 0xC1E0000000000000
  %144 = select i1 %.inv5, float 0xC1E0000000000000, float %117
  %145 = fptosi float %144 to i32
  %146 = select i1 %143, i32 2147483647, i32 %145
  %147 = select i1 %142, i32 0, i32 %146
  %148 = fcmp uno float %119, 0.000000e+00
  %149 = fcmp oge float %119, 0x41E0000000000000
  %.inv = fcmp ole float %119, 0xC1E0000000000000
  %150 = select i1 %.inv, float 0xC1E0000000000000, float %119
  %151 = fptosi float %150 to i32
  %152 = select i1 %149, i32 2147483647, i32 %151
  %153 = select i1 %148, i32 0, i32 %152
  %154 = sub i32 %147, %153
  %155 = icmp slt i32 %154, 0
  %156 = sub i32 0, %154
  %157 = tail call i32 @llvm.smin.i32(i32 %156, i32 28)
  %158 = sitofp i32 %157 to float
  %159 = fmul float %158, 0xBF999999A0000000
  %160 = tail call i32 @llvm.smin.i32(i32 %154, i32 60)
  %161 = sitofp i32 %160 to float
  %162 = fmul float %161, 0x3FA99999A0000000
  %.p = select i1 %155, float %159, float %162
  %163 = fadd float %.p, 1.000000e+00
  %164 = fmul float %141, %163
  %165 = fcmp uno float %102, 0.000000e+00
  %166 = fcmp oge float %102, 0x41E0000000000000
  %.inv6 = fcmp ole float %102, 0xC1E0000000000000
  %167 = select i1 %.inv6, float 0xC1E0000000000000, float %102
  %168 = fptosi float %167 to i32
  %169 = select i1 %166, i32 2147483647, i32 %168
  %170 = select i1 %165, i32 0, i32 %169
  %171 = mul i32 %116, %170
  %172 = tail call i32 @llvm.smax.i32(i32 %171, i32 1)
  %173 = uitofp nneg i32 %172 to float
  %174 = fdiv float %164, %173
  %175 = tail call float @llvm.maximum.f32(float %174, float 0.000000e+00)
  %176 = tail call float @llvm.minimum.f32(float %175, float 1.000000e+00)
  %177 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %90
  %178 = load i32, ptr addrspace(1) %177, align 4, !invariant.load !4
  %179 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %103
  %180 = load i32, ptr addrspace(1) %179, align 4, !invariant.load !4
  %181 = icmp sgt i32 %180, 13
  %182 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %103
  %183 = load i32, ptr addrspace(1) %182, align 4, !invariant.load !4
  %184 = tail call i32 @llvm.smax.i32(i32 %180, i32 %183)
  %185 = icmp sgt i32 %184, 6
  %186 = select i1 %181, i1 true, i1 %185
  %187 = zext i1 %186 to i32
  %.not = icmp ne i32 %178, %187
  %.not9 = icmp sge i32 %183, %180
  %188 = select i1 %122, i1 %.not9, i1 false
  %189 = select i1 %188, i1 %.not, i1 false
  %190 = and i1 %189, %122
  %191 = select i1 %190, float %176, float 0.000000e+00
  %192 = fcmp uno float %191, 0.000000e+00
  %193 = select i1 %192, float 0x7FF8000000000000, float %191
  %194 = fcmp ult float %45, %193
  br i1 %194, label %195, label %202

195:                                              ; preds = %47
  %196 = bitcast float %193 to i32
  %197 = icmp sgt i32 %196, -1
  br i1 %197, label %198, label %200

198:                                              ; preds = %195
  %199 = atomicrmw max ptr addrspace(1) %44, i32 %196 monotonic, align 4
  br label %202

200:                                              ; preds = %195
  %201 = atomicrmw umin ptr addrspace(1) %44, i32 %196 monotonic, align 4
  br label %202

202:                                              ; preds = %38, %200, %198, %47, %10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_12(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %4, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %5, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %6, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %7, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %8, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %9, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %10) local_unnamed_addr #14 {
  %12 = addrspacecast ptr %1 to ptr addrspace(1)
  %13 = addrspacecast ptr %0 to ptr addrspace(1)
  %14 = addrspacecast ptr %6 to ptr addrspace(1)
  %15 = addrspacecast ptr %4 to ptr addrspace(1)
  %16 = addrspacecast ptr %5 to ptr addrspace(1)
  %17 = addrspacecast ptr %3 to ptr addrspace(1)
  %18 = addrspacecast ptr %2 to ptr addrspace(1)
  %19 = addrspacecast ptr %9 to ptr addrspace(1)
  %20 = addrspacecast ptr %10 to ptr addrspace(1)
  %21 = addrspacecast ptr %8 to ptr addrspace(1)
  %22 = addrspacecast ptr %7 to ptr addrspace(1)
  %23 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %24 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %25 = mul nuw nsw i32 %23, 3
  %26 = mul nuw nsw i32 %24, 384
  %27 = add nuw nsw i32 %25, %26
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4
  %31 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 4
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4
  %33 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 8
  %34 = load i32, ptr addrspace(1) %33, align 4, !invariant.load !4
  %35 = icmp ult i32 %30, 1536
  %36 = icmp ult i32 %32, 165
  %37 = and i1 %35, %36
  %38 = icmp ult i32 %34, 12
  %39 = and i1 %37, %38
  br i1 %39, label %40, label %207

40:                                               ; preds = %11
  tail call void @llvm.experimental.noalias.scope.decl(metadata !467)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !470)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !472)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !475)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !477)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !480)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !482)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !485)
  %41 = mul nuw nsw i32 %30, 1980
  %42 = mul nuw nsw i32 %32, 12
  %43 = add nuw nsw i32 %42, %41
  %44 = add nuw nsw i32 %43, %34
  %45 = zext nneg i32 %44 to i64
  %46 = getelementptr inbounds float, ptr addrspace(1) %13, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4
  %48 = fcmp uno float %47, 0.000000e+00
  br i1 %48, label %207, label %49

49:                                               ; preds = %40
  %50 = shl nuw nsw i32 %24, 7
  %51 = or disjoint i32 %50, %23
  %52 = udiv i32 %51, 14
  %53 = shl nuw nsw i32 %52, 1
  %54 = zext nneg i32 %53 to i64
  %55 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %54
  %56 = load <2 x i32>, ptr addrspace(1) %55, align 8, !invariant.load !4
  %57 = extractelement <2 x i32> %56, i32 0
  %58 = extractelement <2 x i32> %56, i32 1
  %59 = tail call i32 @llvm.smax.i32(i32 %57, i32 0)
  %60 = tail call i32 @llvm.umin.i32(i32 %59, i32 1535)
  %61 = zext nneg i32 %60 to i64
  %62 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %61
  %63 = load float, ptr addrspace(1) %62, align 4, !invariant.load !4, !alias.scope !485, !noalias !487
  %64 = mul nuw nsw i32 %60, 14
  %65 = tail call i32 @llvm.smax.i32(i32 %58, i32 0)
  %66 = tail call i32 @llvm.umin.i32(i32 %65, i32 13)
  %67 = add nuw nsw i32 %66, %64
  %68 = zext nneg i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %68
  %70 = load i32, ptr addrspace(1) %69, align 4, !invariant.load !4, !alias.scope !475, !noalias !472
  %71 = icmp slt i32 %70, 0
  %72 = add i32 %70, 101
  %73 = select i1 %71, i32 %72, i32 %70
  %74 = tail call i32 @llvm.smax.i32(i32 %73, i32 0)
  %75 = tail call i32 @llvm.umin.i32(i32 %74, i32 100)
  %76 = mul nuw nsw i32 %75, 20
  %77 = zext nneg i32 %76 to i64
  %78 = getelementptr inbounds float, ptr addrspace(1) %17, i64 %77
  %79 = getelementptr inbounds i8, ptr addrspace(1) %78, i64 24
  %80 = load float, ptr addrspace(1) %79, align 8, !invariant.load !4, !alias.scope !489, !noalias !492
  %81 = tail call float @llvm.maximum.f32(float %80, float 1.000000e+00)
  %82 = fdiv float %63, %81
  %83 = fcmp uno float %82, 0.000000e+00
  %84 = fcmp oge float %82, 0x41E0000000000000
  %.inv.i11 = fcmp ole float %82, 0xC1E0000000000000
  %85 = select i1 %.inv.i11, float 0xC1E0000000000000, float %82
  %86 = fptosi float %85 to i32
  %87 = tail call i32 @llvm.smax.i32(i32 %86, i32 1)
  %88 = getelementptr inbounds i8, ptr addrspace(1) %78, i64 8
  %89 = load <2 x float>, ptr addrspace(1) %88, align 8, !invariant.load !4, !noalias !4
  %90 = extractelement <2 x float> %89, i32 0
  %91 = extractelement <2 x float> %89, i32 1
  %92 = zext nneg i32 %51 to i64
  %93 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %92
  %94 = load i32, ptr addrspace(1) %93, align 4, !invariant.load !4, !alias.scope !470, !noalias !467
  %95 = icmp slt i32 %94, 0
  %96 = add i32 %94, 101
  %97 = select i1 %95, i32 %96, i32 %94
  %98 = tail call i32 @llvm.smax.i32(i32 %97, i32 0)
  %99 = tail call i32 @llvm.umin.i32(i32 %98, i32 100)
  %100 = mul nuw nsw i32 %99, 20
  %101 = zext nneg i32 %100 to i64
  %102 = getelementptr inbounds float, ptr addrspace(1) %17, i64 %101
  %103 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 16
  %104 = load float, ptr addrspace(1) %103, align 16, !invariant.load !4, !alias.scope !494, !noalias !497
  %105 = zext nneg i32 %52 to i64
  %106 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %105
  %107 = load float, ptr addrspace(1) %106, align 4, !invariant.load !4, !alias.scope !480, !noalias !499
  %108 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 24
  %109 = load float, ptr addrspace(1) %108, align 8, !invariant.load !4, !alias.scope !501, !noalias !504
  %110 = tail call float @llvm.maximum.f32(float %109, float 1.000000e+00)
  %111 = fdiv float %107, %110
  %112 = fcmp uno float %111, 0.000000e+00
  %113 = fcmp oge float %111, 0x41E0000000000000
  %.inv.i = fcmp ole float %111, 0xC1E0000000000000
  %114 = select i1 %.inv.i, float 0xC1E0000000000000, float %111
  %115 = fptosi float %114 to i32
  %116 = tail call i32 @llvm.smax.i32(i32 %115, i32 1)
  %117 = select i1 %113, i32 2147483647, i32 %116
  %118 = select i1 %112, i32 1, i32 %117
  %119 = load float, ptr addrspace(1) %78, align 16, !invariant.load !4, !alias.scope !472, !noalias !475
  %120 = getelementptr inbounds i8, ptr addrspace(1) %102, i64 4
  %121 = load float, ptr addrspace(1) %120, align 4, !invariant.load !4, !alias.scope !467, !noalias !470
  %122 = getelementptr inbounds i8, ptr addrspace(1) %18, i64 %92
  %123 = load i8, ptr addrspace(1) %122, align 1, !invariant.load !4
  %124 = trunc i8 %123 to i1
  %125 = fcmp uno float %90, 0.000000e+00
  %126 = fcmp oge float %90, 0x41E0000000000000
  %.inv7 = fcmp ole float %90, 0xC1E0000000000000
  %127 = select i1 %.inv7, float 0xC1E0000000000000, float %90
  %128 = fptosi float %127 to i32
  %129 = select i1 %126, i32 2147483647, i32 %128
  %130 = select i1 %125, i32 0, i32 %129
  %131 = fcmp uno float %91, 0.000000e+00
  %132 = fcmp oge float %91, 0x41E0000000000000
  %.inv8 = fcmp ole float %91, 0xC1E0000000000000
  %133 = select i1 %.inv8, float 0xC1E0000000000000, float %91
  %134 = fptosi float %133 to i32
  %135 = select i1 %132, i32 2147483647, i32 %134
  %136 = select i1 %131, i32 0, i32 %135
  %137 = add i32 %130, %136
  %138 = sitofp i32 %137 to float
  %139 = fmul float %138, 5.000000e-01
  %140 = uitofp nneg i32 %87 to float
  %141 = select i1 %84, float 0x41E0000000000000, float %140
  %142 = select i1 %83, float 1.000000e+00, float %141
  %143 = fmul float %142, %139
  %144 = fcmp uno float %119, 0.000000e+00
  %145 = fcmp oge float %119, 0x41E0000000000000
  %.inv5 = fcmp ole float %119, 0xC1E0000000000000
  %146 = select i1 %.inv5, float 0xC1E0000000000000, float %119
  %147 = fptosi float %146 to i32
  %148 = select i1 %145, i32 2147483647, i32 %147
  %149 = select i1 %144, i32 0, i32 %148
  %150 = fcmp uno float %121, 0.000000e+00
  %151 = fcmp oge float %121, 0x41E0000000000000
  %.inv = fcmp ole float %121, 0xC1E0000000000000
  %152 = select i1 %.inv, float 0xC1E0000000000000, float %121
  %153 = fptosi float %152 to i32
  %154 = select i1 %151, i32 2147483647, i32 %153
  %155 = select i1 %150, i32 0, i32 %154
  %156 = sub i32 %149, %155
  %157 = icmp slt i32 %156, 0
  %158 = sub i32 0, %156
  %159 = tail call i32 @llvm.smin.i32(i32 %158, i32 28)
  %160 = sitofp i32 %159 to float
  %161 = fmul float %160, 0xBF999999A0000000
  %162 = tail call i32 @llvm.smin.i32(i32 %156, i32 60)
  %163 = sitofp i32 %162 to float
  %164 = fmul float %163, 0x3FA99999A0000000
  %.p = select i1 %157, float %161, float %164
  %165 = fadd float %.p, 1.000000e+00
  %166 = fmul float %143, %165
  %167 = fcmp uno float %104, 0.000000e+00
  %168 = fcmp oge float %104, 0x41E0000000000000
  %.inv6 = fcmp ole float %104, 0xC1E0000000000000
  %169 = select i1 %.inv6, float 0xC1E0000000000000, float %104
  %170 = fptosi float %169 to i32
  %171 = select i1 %168, i32 2147483647, i32 %170
  %172 = select i1 %167, i32 0, i32 %171
  %173 = mul i32 %118, %172
  %174 = tail call i32 @llvm.smax.i32(i32 %173, i32 1)
  %175 = uitofp nneg i32 %174 to float
  %176 = fdiv float %166, %175
  %177 = tail call float @llvm.maximum.f32(float %176, float 0.000000e+00)
  %178 = tail call float @llvm.minimum.f32(float %177, float 1.000000e+00)
  %179 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 %92
  %180 = load i8, ptr addrspace(1) %179, align 1, !invariant.load !4
  %181 = trunc i8 %180 to i1
  %182 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %92
  %183 = load i32, ptr addrspace(1) %182, align 4, !invariant.load !4
  %184 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %105
  %185 = load i32, ptr addrspace(1) %184, align 4, !invariant.load !4
  %186 = icmp sgt i32 %185, 13
  %187 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %105
  %188 = load i32, ptr addrspace(1) %187, align 4, !invariant.load !4
  %189 = tail call i32 @llvm.smax.i32(i32 %185, i32 %188)
  %190 = icmp sgt i32 %189, 6
  %191 = select i1 %186, i1 true, i1 %190
  %192 = zext i1 %191 to i32
  %.not = icmp ne i32 %183, %192
  %.not9 = icmp sge i32 %188, %185
  %193 = select i1 %124, i1 %.not9, i1 false
  %194 = select i1 %193, i1 %.not, i1 false
  %195 = select i1 %194, i1 %181, i1 false
  %196 = select i1 %195, float %178, float 0.000000e+00
  %197 = fcmp uno float %196, 0.000000e+00
  %198 = select i1 %197, float 0x7FF8000000000000, float %196
  %199 = fcmp ult float %47, %198
  br i1 %199, label %200, label %207

200:                                              ; preds = %49
  %201 = bitcast float %198 to i32
  %202 = icmp sgt i32 %201, -1
  br i1 %202, label %203, label %205

203:                                              ; preds = %200
  %204 = atomicrmw max ptr addrspace(1) %46, i32 %201 monotonic, align 4
  br label %207

205:                                              ; preds = %200
  %206 = atomicrmw umin ptr addrspace(1) %46, i32 %201 monotonic, align 4
  br label %207

207:                                              ; preds = %40, %205, %203, %49, %11
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_11(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %4, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %5, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %6, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %7, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %8, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %9) local_unnamed_addr #14 {
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = addrspacecast ptr %6 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %3 to ptr addrspace(1)
  %16 = addrspacecast ptr %5 to ptr addrspace(1)
  %17 = addrspacecast ptr %2 to ptr addrspace(1)
  %18 = addrspacecast ptr %9 to ptr addrspace(1)
  %19 = addrspacecast ptr %8 to ptr addrspace(1)
  %20 = addrspacecast ptr %7 to ptr addrspace(1)
  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %22 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %23 = mul nuw nsw i32 %21, 3
  %24 = mul nuw nsw i32 %22, 384
  %25 = add nuw nsw i32 %23, %24
  %26 = zext nneg i32 %25 to i64
  %27 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %26
  %28 = load i32, ptr addrspace(1) %27, align 4, !invariant.load !4
  %29 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 4
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4
  %31 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 8
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4
  %33 = icmp ult i32 %28, 1536
  %34 = icmp ult i32 %30, 165
  %35 = and i1 %33, %34
  %36 = icmp ult i32 %32, 12
  %37 = and i1 %35, %36
  br i1 %37, label %38, label %202

38:                                               ; preds = %10
  tail call void @llvm.experimental.noalias.scope.decl(metadata !506)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !509)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !511)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !514)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !516)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !519)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !521)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !524)
  %39 = mul nuw nsw i32 %28, 1980
  %40 = mul nuw nsw i32 %30, 12
  %41 = add nuw nsw i32 %40, %39
  %42 = add nuw nsw i32 %41, %32
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = fcmp uno float %45, 0.000000e+00
  br i1 %46, label %202, label %47

47:                                               ; preds = %38
  %48 = shl nuw nsw i32 %22, 7
  %49 = or disjoint i32 %48, %21
  %50 = udiv i32 %49, 14
  %51 = shl nuw nsw i32 %50, 1
  %52 = zext nneg i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %52
  %54 = load <2 x i32>, ptr addrspace(1) %53, align 8, !invariant.load !4
  %55 = extractelement <2 x i32> %54, i32 0
  %56 = extractelement <2 x i32> %54, i32 1
  %57 = tail call i32 @llvm.smax.i32(i32 %55, i32 0)
  %58 = tail call i32 @llvm.umin.i32(i32 %57, i32 1535)
  %59 = mul nuw nsw i32 %58, 14
  %60 = tail call i32 @llvm.smax.i32(i32 %56, i32 0)
  %61 = tail call i32 @llvm.umin.i32(i32 %60, i32 13)
  %62 = add nuw nsw i32 %59, %61
  %63 = zext nneg i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %63
  %65 = load i32, ptr addrspace(1) %64, align 4, !invariant.load !4, !alias.scope !514, !noalias !511
  %66 = icmp slt i32 %65, 0
  %67 = add i32 %65, 101
  %68 = select i1 %66, i32 %67, i32 %65
  %69 = tail call i32 @llvm.smax.i32(i32 %68, i32 0)
  %70 = tail call i32 @llvm.umin.i32(i32 %69, i32 100)
  %71 = mul nuw nsw i32 %70, 20
  %72 = zext nneg i32 %71 to i64
  %73 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %72
  %74 = getelementptr inbounds i8, ptr addrspace(1) %73, i64 16
  %75 = load float, ptr addrspace(1) %74, align 16, !invariant.load !4, !alias.scope !526, !noalias !529
  %76 = zext nneg i32 %58 to i64
  %77 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %76
  %78 = load float, ptr addrspace(1) %77, align 4, !invariant.load !4, !alias.scope !524, !noalias !531
  %79 = getelementptr inbounds i8, ptr addrspace(1) %73, i64 24
  %80 = load float, ptr addrspace(1) %79, align 8, !invariant.load !4, !alias.scope !533, !noalias !536
  %81 = tail call float @llvm.maximum.f32(float %80, float 1.000000e+00)
  %82 = fdiv float %78, %81
  %83 = fcmp uno float %82, 0.000000e+00
  %84 = fcmp oge float %82, 0x41E0000000000000
  %.inv.i11 = fcmp ole float %82, 0xC1E0000000000000
  %85 = select i1 %.inv.i11, float 0xC1E0000000000000, float %82
  %86 = fptosi float %85 to i32
  %87 = tail call i32 @llvm.smax.i32(i32 %86, i32 1)
  %88 = select i1 %84, i32 2147483647, i32 %87
  %89 = select i1 %83, i32 1, i32 %88
  %90 = zext nneg i32 %50 to i64
  %91 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %90
  %92 = load float, ptr addrspace(1) %91, align 4, !invariant.load !4, !alias.scope !519, !noalias !538
  %93 = zext nneg i32 %49 to i64
  %94 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %93
  %95 = load i32, ptr addrspace(1) %94, align 4, !invariant.load !4, !alias.scope !509, !noalias !506
  %96 = icmp slt i32 %95, 0
  %97 = add i32 %95, 101
  %98 = select i1 %96, i32 %97, i32 %95
  %99 = tail call i32 @llvm.smax.i32(i32 %98, i32 0)
  %100 = tail call i32 @llvm.umin.i32(i32 %99, i32 100)
  %101 = mul nuw nsw i32 %100, 20
  %102 = zext nneg i32 %101 to i64
  %103 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %102
  %104 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 24
  %105 = load float, ptr addrspace(1) %104, align 8, !invariant.load !4, !alias.scope !540, !noalias !543
  %106 = tail call float @llvm.maximum.f32(float %105, float 1.000000e+00)
  %107 = fdiv float %92, %106
  %108 = fcmp uno float %107, 0.000000e+00
  %109 = fcmp oge float %107, 0x41E0000000000000
  %.inv.i = fcmp ole float %107, 0xC1E0000000000000
  %110 = select i1 %.inv.i, float 0xC1E0000000000000, float %107
  %111 = fptosi float %110 to i32
  %112 = tail call i32 @llvm.smax.i32(i32 %111, i32 1)
  %113 = getelementptr inbounds i8, ptr addrspace(1) %103, i64 8
  %114 = load <2 x float>, ptr addrspace(1) %113, align 8, !invariant.load !4, !noalias !4
  %115 = extractelement <2 x float> %114, i32 0
  %116 = extractelement <2 x float> %114, i32 1
  %117 = getelementptr inbounds i8, ptr addrspace(1) %73, i64 4
  %118 = load float, ptr addrspace(1) %117, align 4, !invariant.load !4, !alias.scope !511, !noalias !514
  %119 = load float, ptr addrspace(1) %103, align 16, !invariant.load !4, !alias.scope !506, !noalias !509
  %120 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 %93
  %121 = load i8, ptr addrspace(1) %120, align 1, !invariant.load !4
  %122 = trunc i8 %121 to i1
  %123 = fcmp uno float %115, 0.000000e+00
  %124 = fcmp oge float %115, 0x41E0000000000000
  %.inv6 = fcmp ole float %115, 0xC1E0000000000000
  %125 = select i1 %.inv6, float 0xC1E0000000000000, float %115
  %126 = fptosi float %125 to i32
  %127 = select i1 %124, i32 2147483647, i32 %126
  %128 = select i1 %123, i32 0, i32 %127
  %129 = fcmp uno float %116, 0.000000e+00
  %130 = fcmp oge float %116, 0x41E0000000000000
  %.inv7 = fcmp ole float %116, 0xC1E0000000000000
  %131 = select i1 %.inv7, float 0xC1E0000000000000, float %116
  %132 = fptosi float %131 to i32
  %133 = select i1 %130, i32 2147483647, i32 %132
  %134 = select i1 %129, i32 0, i32 %133
  %135 = add i32 %128, %134
  %136 = sitofp i32 %135 to float
  %137 = fmul float %136, 5.000000e-01
  %138 = uitofp nneg i32 %112 to float
  %139 = select i1 %109, float 0x41E0000000000000, float %138
  %140 = select i1 %108, float 1.000000e+00, float %139
  %141 = fmul float %140, %137
  %142 = fcmp uno float %119, 0.000000e+00
  %143 = fcmp oge float %119, 0x41E0000000000000
  %.inv = fcmp ole float %119, 0xC1E0000000000000
  %144 = select i1 %.inv, float 0xC1E0000000000000, float %119
  %145 = fptosi float %144 to i32
  %146 = select i1 %143, i32 2147483647, i32 %145
  %147 = select i1 %142, i32 0, i32 %146
  %148 = fcmp uno float %118, 0.000000e+00
  %149 = fcmp oge float %118, 0x41E0000000000000
  %.inv5 = fcmp ole float %118, 0xC1E0000000000000
  %150 = select i1 %.inv5, float 0xC1E0000000000000, float %118
  %151 = fptosi float %150 to i32
  %152 = select i1 %149, i32 2147483647, i32 %151
  %153 = select i1 %148, i32 0, i32 %152
  %154 = sub i32 %147, %153
  %155 = icmp slt i32 %154, 0
  %156 = sub i32 0, %154
  %157 = tail call i32 @llvm.smin.i32(i32 %156, i32 28)
  %158 = sitofp i32 %157 to float
  %159 = fmul float %158, 0xBF999999A0000000
  %160 = tail call i32 @llvm.smin.i32(i32 %154, i32 60)
  %161 = sitofp i32 %160 to float
  %162 = fmul float %161, 0x3FA99999A0000000
  %.p = select i1 %155, float %159, float %162
  %163 = fadd float %.p, 1.000000e+00
  %164 = fmul float %141, %163
  %165 = fcmp uno float %75, 0.000000e+00
  %166 = fcmp oge float %75, 0x41E0000000000000
  %.inv8 = fcmp ole float %75, 0xC1E0000000000000
  %167 = select i1 %.inv8, float 0xC1E0000000000000, float %75
  %168 = fptosi float %167 to i32
  %169 = select i1 %166, i32 2147483647, i32 %168
  %170 = select i1 %165, i32 0, i32 %169
  %171 = mul i32 %89, %170
  %172 = tail call i32 @llvm.smax.i32(i32 %171, i32 1)
  %173 = uitofp nneg i32 %172 to float
  %174 = fdiv float %164, %173
  %175 = tail call float @llvm.maximum.f32(float %174, float 0.000000e+00)
  %176 = tail call float @llvm.minimum.f32(float %175, float 1.000000e+00)
  %177 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %93
  %178 = load i32, ptr addrspace(1) %177, align 4, !invariant.load !4
  %179 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %90
  %180 = load i32, ptr addrspace(1) %179, align 4, !invariant.load !4
  %181 = icmp sgt i32 %180, 13
  %182 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %90
  %183 = load i32, ptr addrspace(1) %182, align 4, !invariant.load !4
  %184 = tail call i32 @llvm.smax.i32(i32 %180, i32 %183)
  %185 = icmp sgt i32 %184, 6
  %186 = select i1 %181, i1 true, i1 %185
  %187 = zext i1 %186 to i32
  %.not = icmp ne i32 %178, %187
  %.not9 = icmp sge i32 %183, %180
  %188 = select i1 %122, i1 %.not9, i1 false
  %189 = select i1 %188, i1 %.not, i1 false
  %190 = and i1 %189, %122
  %191 = select i1 %190, float %176, float 0.000000e+00
  %192 = fcmp uno float %191, 0.000000e+00
  %193 = select i1 %192, float 0x7FF8000000000000, float %191
  %194 = fcmp ult float %45, %193
  br i1 %194, label %195, label %202

195:                                              ; preds = %47
  %196 = bitcast float %193 to i32
  %197 = icmp sgt i32 %196, -1
  br i1 %197, label %198, label %200

198:                                              ; preds = %195
  %199 = atomicrmw max ptr addrspace(1) %44, i32 %196 monotonic, align 4
  br label %202

200:                                              ; preds = %195
  %201 = atomicrmw umin ptr addrspace(1) %44, i32 %196 monotonic, align 4
  br label %202

202:                                              ; preds = %38, %200, %198, %47, %10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_10(ptr noalias align 256 captures(none) dereferenceable(12165120) %0, ptr noalias readonly align 256 captures(none) dereferenceable(258048) %1, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %4, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %5, ptr noalias readonly align 256 captures(none) dereferenceable(12288) %6, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %7, ptr noalias readonly align 256 captures(none) dereferenceable(6144) %8, ptr noalias readonly align 256 captures(none) dereferenceable(21504) %9, ptr noalias readonly align 256 captures(none) dereferenceable(86016) %10) local_unnamed_addr #14 {
  %12 = addrspacecast ptr %1 to ptr addrspace(1)
  %13 = addrspacecast ptr %0 to ptr addrspace(1)
  %14 = addrspacecast ptr %6 to ptr addrspace(1)
  %15 = addrspacecast ptr %4 to ptr addrspace(1)
  %16 = addrspacecast ptr %3 to ptr addrspace(1)
  %17 = addrspacecast ptr %5 to ptr addrspace(1)
  %18 = addrspacecast ptr %2 to ptr addrspace(1)
  %19 = addrspacecast ptr %9 to ptr addrspace(1)
  %20 = addrspacecast ptr %10 to ptr addrspace(1)
  %21 = addrspacecast ptr %8 to ptr addrspace(1)
  %22 = addrspacecast ptr %7 to ptr addrspace(1)
  %23 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %24 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !56
  %25 = mul nuw nsw i32 %23, 3
  %26 = mul nuw nsw i32 %24, 384
  %27 = add nuw nsw i32 %25, %26
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4
  %31 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 4
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4
  %33 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 8
  %34 = load i32, ptr addrspace(1) %33, align 4, !invariant.load !4
  %35 = icmp ult i32 %30, 1536
  %36 = icmp ult i32 %32, 165
  %37 = and i1 %35, %36
  %38 = icmp ult i32 %34, 12
  %39 = and i1 %37, %38
  br i1 %39, label %40, label %207

40:                                               ; preds = %11
  tail call void @llvm.experimental.noalias.scope.decl(metadata !545)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !548)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !550)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !553)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !555)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !558)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !560)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !563)
  %41 = mul nuw nsw i32 %30, 1980
  %42 = mul nuw nsw i32 %32, 12
  %43 = add nuw nsw i32 %42, %41
  %44 = add nuw nsw i32 %43, %34
  %45 = zext nneg i32 %44 to i64
  %46 = getelementptr inbounds float, ptr addrspace(1) %13, i64 %45
  %47 = load float, ptr addrspace(1) %46, align 4
  %48 = fcmp uno float %47, 0.000000e+00
  br i1 %48, label %207, label %49

49:                                               ; preds = %40
  %50 = shl nuw nsw i32 %24, 7
  %51 = or disjoint i32 %50, %23
  %52 = udiv i32 %51, 14
  %53 = shl nuw nsw i32 %52, 1
  %54 = zext nneg i32 %53 to i64
  %55 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %54
  %56 = load <2 x i32>, ptr addrspace(1) %55, align 8, !invariant.load !4
  %57 = extractelement <2 x i32> %56, i32 0
  %58 = extractelement <2 x i32> %56, i32 1
  %59 = tail call i32 @llvm.smax.i32(i32 %57, i32 0)
  %60 = tail call i32 @llvm.umin.i32(i32 %59, i32 1535)
  %61 = mul nuw nsw i32 %60, 14
  %62 = tail call i32 @llvm.smax.i32(i32 %58, i32 0)
  %63 = tail call i32 @llvm.umin.i32(i32 %62, i32 13)
  %64 = add nuw nsw i32 %61, %63
  %65 = zext nneg i32 %64 to i64
  %66 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %65
  %67 = load i32, ptr addrspace(1) %66, align 4, !invariant.load !4, !alias.scope !553, !noalias !550
  %68 = icmp slt i32 %67, 0
  %69 = add i32 %67, 101
  %70 = select i1 %68, i32 %69, i32 %67
  %71 = tail call i32 @llvm.smax.i32(i32 %70, i32 0)
  %72 = tail call i32 @llvm.umin.i32(i32 %71, i32 100)
  %73 = mul nuw nsw i32 %72, 20
  %74 = zext nneg i32 %73 to i64
  %75 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %74
  %76 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 16
  %77 = load float, ptr addrspace(1) %76, align 16, !invariant.load !4, !alias.scope !565, !noalias !568
  %78 = zext nneg i32 %60 to i64
  %79 = getelementptr inbounds float, ptr addrspace(1) %17, i64 %78
  %80 = load float, ptr addrspace(1) %79, align 4, !invariant.load !4, !alias.scope !563, !noalias !570
  %81 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 24
  %82 = load float, ptr addrspace(1) %81, align 8, !invariant.load !4, !alias.scope !572, !noalias !575
  %83 = tail call float @llvm.maximum.f32(float %82, float 1.000000e+00)
  %84 = fdiv float %80, %83
  %85 = fcmp uno float %84, 0.000000e+00
  %86 = fcmp oge float %84, 0x41E0000000000000
  %.inv.i11 = fcmp ole float %84, 0xC1E0000000000000
  %87 = select i1 %.inv.i11, float 0xC1E0000000000000, float %84
  %88 = fptosi float %87 to i32
  %89 = tail call i32 @llvm.smax.i32(i32 %88, i32 1)
  %90 = select i1 %86, i32 2147483647, i32 %89
  %91 = select i1 %85, i32 1, i32 %90
  %92 = zext nneg i32 %52 to i64
  %93 = getelementptr inbounds float, ptr addrspace(1) %17, i64 %92
  %94 = load float, ptr addrspace(1) %93, align 4, !invariant.load !4, !alias.scope !558, !noalias !577
  %95 = zext nneg i32 %51 to i64
  %96 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %95
  %97 = load i32, ptr addrspace(1) %96, align 4, !invariant.load !4, !alias.scope !548, !noalias !545
  %98 = icmp slt i32 %97, 0
  %99 = add i32 %97, 101
  %100 = select i1 %98, i32 %99, i32 %97
  %101 = tail call i32 @llvm.smax.i32(i32 %100, i32 0)
  %102 = tail call i32 @llvm.umin.i32(i32 %101, i32 100)
  %103 = mul nuw nsw i32 %102, 20
  %104 = zext nneg i32 %103 to i64
  %105 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %104
  %106 = getelementptr inbounds i8, ptr addrspace(1) %105, i64 24
  %107 = load float, ptr addrspace(1) %106, align 8, !invariant.load !4, !alias.scope !579, !noalias !582
  %108 = tail call float @llvm.maximum.f32(float %107, float 1.000000e+00)
  %109 = fdiv float %94, %108
  %110 = fcmp uno float %109, 0.000000e+00
  %111 = fcmp oge float %109, 0x41E0000000000000
  %.inv.i = fcmp ole float %109, 0xC1E0000000000000
  %112 = select i1 %.inv.i, float 0xC1E0000000000000, float %109
  %113 = fptosi float %112 to i32
  %114 = tail call i32 @llvm.smax.i32(i32 %113, i32 1)
  %115 = getelementptr inbounds i8, ptr addrspace(1) %105, i64 8
  %116 = load <2 x float>, ptr addrspace(1) %115, align 8, !invariant.load !4, !noalias !4
  %117 = extractelement <2 x float> %116, i32 0
  %118 = extractelement <2 x float> %116, i32 1
  %119 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 4
  %120 = load float, ptr addrspace(1) %119, align 4, !invariant.load !4, !alias.scope !550, !noalias !553
  %121 = load float, ptr addrspace(1) %105, align 16, !invariant.load !4, !alias.scope !545, !noalias !548
  %122 = getelementptr inbounds i8, ptr addrspace(1) %18, i64 %95
  %123 = load i8, ptr addrspace(1) %122, align 1, !invariant.load !4
  %124 = trunc i8 %123 to i1
  %125 = fcmp uno float %117, 0.000000e+00
  %126 = fcmp oge float %117, 0x41E0000000000000
  %.inv6 = fcmp ole float %117, 0xC1E0000000000000
  %127 = select i1 %.inv6, float 0xC1E0000000000000, float %117
  %128 = fptosi float %127 to i32
  %129 = select i1 %126, i32 2147483647, i32 %128
  %130 = select i1 %125, i32 0, i32 %129
  %131 = fcmp uno float %118, 0.000000e+00
  %132 = fcmp oge float %118, 0x41E0000000000000
  %.inv7 = fcmp ole float %118, 0xC1E0000000000000
  %133 = select i1 %.inv7, float 0xC1E0000000000000, float %118
  %134 = fptosi float %133 to i32
  %135 = select i1 %132, i32 2147483647, i32 %134
  %136 = select i1 %131, i32 0, i32 %135
  %137 = add i32 %130, %136
  %138 = sitofp i32 %137 to float
  %139 = fmul float %138, 5.000000e-01
  %140 = uitofp nneg i32 %114 to float
  %141 = select i1 %111, float 0x41E0000000000000, float %140
  %142 = select i1 %110, float 1.000000e+00, float %141
  %143 = fmul float %142, %139
  %144 = fcmp uno float %121, 0.000000e+00
  %145 = fcmp oge float %121, 0x41E0000000000000
  %.inv = fcmp ole float %121, 0xC1E0000000000000
  %146 = select i1 %.inv, float 0xC1E0000000000000, float %121
  %147 = fptosi float %146 to i32
  %148 = select i1 %145, i32 2147483647, i32 %147
  %149 = select i1 %144, i32 0, i32 %148
  %150 = fcmp uno float %120, 0.000000e+00
  %151 = fcmp oge float %120, 0x41E0000000000000
  %.inv5 = fcmp ole float %120, 0xC1E0000000000000
  %152 = select i1 %.inv5, float 0xC1E0000000000000, float %120
  %153 = fptosi float %152 to i32
  %154 = select i1 %151, i32 2147483647, i32 %153
  %155 = select i1 %150, i32 0, i32 %154
  %156 = sub i32 %149, %155
  %157 = icmp slt i32 %156, 0
  %158 = sub i32 0, %156
  %159 = tail call i32 @llvm.smin.i32(i32 %158, i32 28)
  %160 = sitofp i32 %159 to float
  %161 = fmul float %160, 0xBF999999A0000000
  %162 = tail call i32 @llvm.smin.i32(i32 %156, i32 60)
  %163 = sitofp i32 %162 to float
  %164 = fmul float %163, 0x3FA99999A0000000
  %.p = select i1 %157, float %161, float %164
  %165 = fadd float %.p, 1.000000e+00
  %166 = fmul float %143, %165
  %167 = fcmp uno float %77, 0.000000e+00
  %168 = fcmp oge float %77, 0x41E0000000000000
  %.inv8 = fcmp ole float %77, 0xC1E0000000000000
  %169 = select i1 %.inv8, float 0xC1E0000000000000, float %77
  %170 = fptosi float %169 to i32
  %171 = select i1 %168, i32 2147483647, i32 %170
  %172 = select i1 %167, i32 0, i32 %171
  %173 = mul i32 %91, %172
  %174 = tail call i32 @llvm.smax.i32(i32 %173, i32 1)
  %175 = uitofp nneg i32 %174 to float
  %176 = fdiv float %166, %175
  %177 = tail call float @llvm.maximum.f32(float %176, float 0.000000e+00)
  %178 = tail call float @llvm.minimum.f32(float %177, float 1.000000e+00)
  %179 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 %95
  %180 = load i8, ptr addrspace(1) %179, align 1, !invariant.load !4
  %181 = trunc i8 %180 to i1
  %182 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %95
  %183 = load i32, ptr addrspace(1) %182, align 4, !invariant.load !4
  %184 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %92
  %185 = load i32, ptr addrspace(1) %184, align 4, !invariant.load !4
  %186 = icmp sgt i32 %185, 13
  %187 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %92
  %188 = load i32, ptr addrspace(1) %187, align 4, !invariant.load !4
  %189 = tail call i32 @llvm.smax.i32(i32 %185, i32 %188)
  %190 = icmp sgt i32 %189, 6
  %191 = select i1 %186, i1 true, i1 %190
  %192 = zext i1 %191 to i32
  %.not = icmp ne i32 %183, %192
  %.not9 = icmp sge i32 %188, %185
  %193 = select i1 %124, i1 %.not9, i1 false
  %194 = select i1 %193, i1 %.not, i1 false
  %195 = select i1 %194, i1 %181, i1 false
  %196 = select i1 %195, float %178, float 0.000000e+00
  %197 = fcmp uno float %196, 0.000000e+00
  %198 = select i1 %197, float 0x7FF8000000000000, float %196
  %199 = fcmp ult float %47, %198
  br i1 %199, label %200, label %207

200:                                              ; preds = %49
  %201 = bitcast float %198 to i32
  %202 = icmp sgt i32 %201, -1
  br i1 %202, label %203, label %205

203:                                              ; preds = %200
  %204 = atomicrmw max ptr addrspace(1) %46, i32 %201 monotonic, align 4
  br label %207

205:                                              ; preds = %200
  %206 = atomicrmw umin ptr addrspace(1) %46, i32 %201 monotonic, align 4
  br label %207

207:                                              ; preds = %40, %205, %203, %49, %11
  ret void
}

; Function Attrs: norecurse nounwind
define ptx_kernel void @input_transpose_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(12165120) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(12165120) %1) local_unnamed_addr #7 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !427
  %7 = and i32 %5, 31
  %8 = mul nuw nsw i32 %7, 12
  %9 = mul nuw nsw i32 %6, 384
  %10 = add nuw nsw i32 %8, %9
  %11 = lshr i32 %5, 5
  %12 = or disjoint i32 %10, %11
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds float, ptr addrspace(1) %3, i64 %13
  %15 = load float, ptr addrspace(1) %14, align 4, !invariant.load !4
  %16 = mul nuw nsw i32 %7, 33
  %17 = add nuw nsw i32 %16, %11
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds float, ptr addrspace(3) @shared_01, i64 %18
  store float %15, ptr addrspace(3) %19, align 4
  %20 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 16
  %21 = load float, ptr addrspace(1) %20, align 4, !invariant.load !4
  %22 = getelementptr inbounds i8, ptr addrspace(3) %19, i64 16
  store float %21, ptr addrspace(3) %22, align 4
  %23 = icmp eq i32 %11, 3
  br i1 %23, label %26, label %24

24:                                               ; preds = %2
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %14, i64 32
  %25 = load float, ptr addrspace(1) %sunkaddr, align 4, !invariant.load !4
  br label %26

26:                                               ; preds = %24, %2
  %27 = phi float [ %25, %24 ], [ 0.000000e+00, %2 ]
  %28 = getelementptr inbounds i8, ptr addrspace(3) %19, i64 32
  store float %27, ptr addrspace(3) %28, align 4
  tail call void @llvm.nvvm.barrier.cta.sync.aligned.all(i32 0)
  %29 = icmp samesign ult i32 %7, 12
  br i1 %29, label %30, label %62

30:                                               ; preds = %26
  %31 = mul nuw nsw i32 %11, 33
  %32 = add nuw nsw i32 %31, %7
  %33 = zext nneg i32 %32 to i64
  %34 = getelementptr inbounds float, ptr addrspace(3) @shared_01, i64 %33
  %35 = load float, ptr addrspace(3) %34, align 4
  %36 = mul nuw nsw i32 %11, 12
  %37 = or disjoint i32 %7, %9
  %38 = add nuw nsw i32 %37, %36
  %39 = zext nneg i32 %38 to i64
  %40 = getelementptr inbounds float, ptr addrspace(1) %4, i64 %39
  store float %35, ptr addrspace(1) %40, align 4
  %41 = getelementptr inbounds i8, ptr addrspace(3) %34, i64 528
  %42 = load float, ptr addrspace(3) %41, align 4
  %43 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 192
  store float %42, ptr addrspace(1) %43, align 4
  %44 = getelementptr inbounds i8, ptr addrspace(3) %34, i64 1056
  %45 = load float, ptr addrspace(3) %44, align 4
  %46 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 384
  store float %45, ptr addrspace(1) %46, align 4
  %47 = getelementptr inbounds i8, ptr addrspace(3) %34, i64 1584
  %48 = load float, ptr addrspace(3) %47, align 4
  %49 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 576
  store float %48, ptr addrspace(1) %49, align 4
  %50 = getelementptr inbounds i8, ptr addrspace(3) %34, i64 2112
  %51 = load float, ptr addrspace(3) %50, align 4
  %52 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 768
  store float %51, ptr addrspace(1) %52, align 4
  %53 = getelementptr inbounds i8, ptr addrspace(3) %34, i64 2640
  %54 = load float, ptr addrspace(3) %53, align 4
  %55 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 960
  store float %54, ptr addrspace(1) %55, align 4
  %56 = getelementptr inbounds i8, ptr addrspace(3) %34, i64 3168
  %57 = load float, ptr addrspace(3) %56, align 4
  %58 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 1152
  store float %57, ptr addrspace(1) %58, align 4
  %59 = getelementptr inbounds i8, ptr addrspace(3) %34, i64 3696
  %60 = load float, ptr addrspace(3) %59, align 4
  %61 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 1344
  store float %60, ptr addrspace(1) %61, align 4
  br label %62

62:                                               ; preds = %30, %26
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_4(ptr noalias writeonly align 256 captures(none) dereferenceable(1536) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(1536) %1) local_unnamed_addr #3 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !85
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = shl nuw nsw i32 %5, 7
  %8 = or disjoint i32 %7, %6
  %9 = zext nneg i32 %8 to i64
  %10 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %9
  store i8 0, ptr addrspace(1) %10, align 1
  %11 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 %9
  store i8 0, ptr addrspace(1) %11, align 1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_1(ptr noalias writeonly align 256 captures(none) dereferenceable(12288) %0) local_unnamed_addr #3 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !15
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %3, 7
  %6 = or disjoint i32 %5, %4
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %7
  store float 0.000000e+00, ptr addrspace(1) %8, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #15

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #16

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #15

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "nvvm.reqntid"="128,1,1" }
attributes #4 = { norecurse nounwind "nvvm.reqntid"="8,1,1" }
attributes #5 = { convergent nocallback nounwind }
attributes #6 = { nofree norecurse nounwind memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #7 = { norecurse nounwind "nvvm.reqntid"="128,1,1" }
attributes #8 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #9 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="256,1,1" }
attributes #10 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #11 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="1,1,1" }
attributes #12 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #13 = { "nvvm.reqntid"="64,1,1" }
attributes #14 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #15 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #16 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #17 = { nounwind }

!llvm.module.flags = !{!0, !1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{i32 0, i32 72}
!3 = !{i32 0, i32 128}
!4 = !{}
!5 = !{!6}
!6 = distinct !{!6, !7, !"fused_concatenate_add_2244_1: argument 0"}
!7 = distinct !{!7, !"fused_concatenate_add_2244_1"}
!8 = !{!9}
!9 = distinct !{!9, !7, !"fused_concatenate_add_2244_1: argument 1"}
!10 = !{!11, !9}
!11 = distinct !{!11, !12, !"fused_concatenate_xor_1224_3: argument 1"}
!12 = distinct !{!12, !"fused_concatenate_xor_1224_3"}
!13 = !{!14, !6}
!14 = distinct !{!14, !12, !"fused_concatenate_xor_1224_3: argument 0"}
!15 = !{i32 0, i32 24}
!16 = !{!17, !19, !21, !23}
!17 = distinct !{!17, !18, !"fused_add_slice_concatenate_138_15: argument 0"}
!18 = distinct !{!18, !"fused_add_slice_concatenate_138_15"}
!19 = distinct !{!19, !20, !"fused_add_slice_bitcast_1649_4: argument 0"}
!20 = distinct !{!20, !"fused_add_slice_bitcast_1649_4"}
!21 = distinct !{!21, !22, !"fused_add_slice_slice_174_3: argument 0"}
!22 = distinct !{!22, !"fused_add_slice_slice_174_3"}
!23 = distinct !{!23, !24, !"fused_add_slice_broadcast_3131_25: argument 0"}
!24 = distinct !{!24, !"fused_add_slice_broadcast_3131_25"}
!25 = !{!26, !28, !30, !32}
!26 = distinct !{!26, !27, !"fused_add_slice_concatenate_138_15: argument 0"}
!27 = distinct !{!27, !"fused_add_slice_concatenate_138_15"}
!28 = distinct !{!28, !29, !"fused_add_slice_bitcast_1649_4: argument 0"}
!29 = distinct !{!29, !"fused_add_slice_bitcast_1649_4"}
!30 = distinct !{!30, !31, !"fused_add_slice_slice_175_3: argument 0"}
!31 = distinct !{!31, !"fused_add_slice_slice_175_3"}
!32 = distinct !{!32, !33, !"fused_add_slice_broadcast_3132_51: argument 0"}
!33 = distinct !{!33, !"fused_add_slice_broadcast_3132_51"}
!34 = !{!35, !37, !39, !41}
!35 = distinct !{!35, !36, !"fused_add_slice_concatenate_138_15: argument 0"}
!36 = distinct !{!36, !"fused_add_slice_concatenate_138_15"}
!37 = distinct !{!37, !38, !"fused_add_slice_bitcast_2026_6_clone_1: argument 0"}
!38 = distinct !{!38, !"fused_add_slice_bitcast_2026_6_clone_1"}
!39 = distinct !{!39, !40, !"fused_add_slice_slice_180_3_clone_1: argument 0"}
!40 = distinct !{!40, !"fused_add_slice_slice_180_3_clone_1"}
!41 = distinct !{!41, !42, !"fused_add_slice_broadcast_3134_23_clone_1: argument 0"}
!42 = distinct !{!42, !"fused_add_slice_broadcast_3134_23_clone_1"}
!43 = !{!44, !46, !48, !50}
!44 = distinct !{!44, !45, !"fused_add_slice_concatenate_138_15: argument 0"}
!45 = distinct !{!45, !"fused_add_slice_concatenate_138_15"}
!46 = distinct !{!46, !47, !"fused_add_slice_bitcast_2026_6_clone_1: argument 0"}
!47 = distinct !{!47, !"fused_add_slice_bitcast_2026_6_clone_1"}
!48 = distinct !{!48, !49, !"fused_add_slice_slice_181_3_clone_1: argument 0"}
!49 = distinct !{!49, !"fused_add_slice_slice_181_3_clone_1"}
!50 = distinct !{!50, !51, !"fused_add_slice_broadcast_3135_41_clone_1: argument 0"}
!51 = distinct !{!51, !"fused_add_slice_broadcast_3135_41_clone_1"}
!52 = !{i32 0, i32 132}
!53 = !{i32 0, i32 1536}
!54 = !{i32 0, i32 8}
!55 = !{i32 0, i32 84}
!56 = !{i32 0, i32 168}
!57 = !{!58, !60, !61, !63}
!58 = distinct !{!58, !59, !"fused_convert_concatenate_137_17: argument 0"}
!59 = distinct !{!59, !"fused_convert_concatenate_137_17"}
!60 = distinct !{!60, !59, !"fused_convert_concatenate_137_17: argument 1"}
!61 = distinct !{!61, !62, !"fused_convert_bitcast_1257_6: argument 0"}
!62 = distinct !{!62, !"fused_convert_bitcast_1257_6"}
!63 = distinct !{!63, !62, !"fused_convert_bitcast_1257_6: argument 1"}
!64 = !{!65, !67, !68, !70}
!65 = distinct !{!65, !66, !"fused_convert_concatenate_137_17: argument 0"}
!66 = distinct !{!66, !"fused_convert_concatenate_137_17"}
!67 = distinct !{!67, !66, !"fused_convert_concatenate_137_17: argument 1"}
!68 = distinct !{!68, !69, !"fused_convert_bitcast_1257_6: argument 0"}
!69 = distinct !{!69, !"fused_convert_bitcast_1257_6"}
!70 = distinct !{!70, !69, !"fused_convert_bitcast_1257_6: argument 1"}
!71 = !{!72, !74, !75, !77}
!72 = distinct !{!72, !73, !"fused_convert_concatenate_137_17: argument 0"}
!73 = distinct !{!73, !"fused_convert_concatenate_137_17"}
!74 = distinct !{!74, !73, !"fused_convert_concatenate_137_17: argument 1"}
!75 = distinct !{!75, !76, !"fused_convert_bitcast_1273_6: argument 0"}
!76 = distinct !{!76, !"fused_convert_bitcast_1273_6"}
!77 = distinct !{!77, !76, !"fused_convert_bitcast_1273_6: argument 1"}
!78 = !{!79, !81, !82, !84}
!79 = distinct !{!79, !80, !"fused_convert_concatenate_137_17: argument 0"}
!80 = distinct !{!80, !"fused_convert_concatenate_137_17"}
!81 = distinct !{!81, !80, !"fused_convert_concatenate_137_17: argument 1"}
!82 = distinct !{!82, !83, !"fused_convert_bitcast_1273_6: argument 0"}
!83 = distinct !{!83, !"fused_convert_bitcast_1273_6"}
!84 = distinct !{!84, !83, !"fused_convert_bitcast_1273_6: argument 1"}
!85 = !{i32 0, i32 12}
!86 = !{!87, !89, !90, !92}
!87 = distinct !{!87, !88, !"fused_divide_concatenate_136_161: argument 0"}
!88 = distinct !{!88, !"fused_divide_concatenate_136_161"}
!89 = distinct !{!89, !88, !"fused_divide_concatenate_136_161: argument 1"}
!90 = distinct !{!90, !91, !"fused_divide_bitcast_891_76: argument 0"}
!91 = distinct !{!91, !"fused_divide_bitcast_891_76"}
!92 = distinct !{!92, !91, !"fused_divide_bitcast_891_76: argument 1"}
!93 = !{!94, !96, !97, !99}
!94 = distinct !{!94, !95, !"fused_divide_concatenate_136_161: argument 0"}
!95 = distinct !{!95, !"fused_divide_concatenate_136_161"}
!96 = distinct !{!96, !95, !"fused_divide_concatenate_136_161: argument 1"}
!97 = distinct !{!97, !98, !"fused_divide_bitcast_891_76: argument 0"}
!98 = distinct !{!98, !"fused_divide_bitcast_891_76"}
!99 = distinct !{!99, !98, !"fused_divide_bitcast_891_76: argument 1"}
!100 = !{!101, !103, !104, !106}
!101 = distinct !{!101, !102, !"fused_divide_concatenate_136_161: argument 0"}
!102 = distinct !{!102, !"fused_divide_concatenate_136_161"}
!103 = distinct !{!103, !102, !"fused_divide_concatenate_136_161: argument 1"}
!104 = distinct !{!104, !105, !"fused_divide_bitcast_900_76: argument 0"}
!105 = distinct !{!105, !"fused_divide_bitcast_900_76"}
!106 = distinct !{!106, !105, !"fused_divide_bitcast_900_76: argument 1"}
!107 = !{!108, !110, !111, !113}
!108 = distinct !{!108, !109, !"fused_divide_concatenate_136_161: argument 0"}
!109 = distinct !{!109, !"fused_divide_concatenate_136_161"}
!110 = distinct !{!110, !109, !"fused_divide_concatenate_136_161: argument 1"}
!111 = distinct !{!111, !112, !"fused_divide_bitcast_900_76: argument 0"}
!112 = distinct !{!112, !"fused_divide_bitcast_900_76"}
!113 = distinct !{!113, !112, !"fused_divide_bitcast_900_76: argument 1"}
!114 = !{!115}
!115 = distinct !{!115, !116, !"fused_and_compare_convert_maximum_select_slice_maximum_82_1: argument 0"}
!116 = distinct !{!116, !"fused_and_compare_convert_maximum_select_slice_maximum_82_1"}
!117 = !{!118}
!118 = distinct !{!118, !116, !"fused_and_compare_convert_maximum_select_slice_maximum_82_1: argument 1"}
!119 = !{!120}
!120 = distinct !{!120, !116, !"fused_and_compare_convert_maximum_select_slice_maximum_82_1: argument 2"}
!121 = !{!115, !120}
!122 = !{!123}
!123 = distinct !{!123, !124, !"fused_and_compare_convert_maximum_select_slice_slice_185_9: argument 0"}
!124 = distinct !{!124, !"fused_and_compare_convert_maximum_select_slice_slice_185_9"}
!125 = !{!126}
!126 = distinct !{!126, !124, !"fused_and_compare_convert_maximum_select_slice_slice_185_9: argument 1"}
!127 = !{!128}
!128 = distinct !{!128, !129, !"fused_and_compare_convert_maximum_select_slice_bitcast_1290_126: argument 0"}
!129 = distinct !{!129, !"fused_and_compare_convert_maximum_select_slice_bitcast_1290_126"}
!130 = !{!131}
!131 = distinct !{!131, !129, !"fused_and_compare_convert_maximum_select_slice_bitcast_1290_126: argument 1"}
!132 = !{!131, !126, !120}
!133 = !{!128, !123, !115, !118}
!134 = !{!135, !137, !138, !140}
!135 = distinct !{!135, !136, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1: argument 0"}
!136 = distinct !{!136, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1"}
!137 = distinct !{!137, !136, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1: argument 1"}
!138 = distinct !{!138, !139, !"fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1: argument 0"}
!139 = distinct !{!139, !"fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1"}
!140 = distinct !{!140, !139, !"fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1: argument 1"}
!141 = !{!142, !144, !145, !147}
!142 = distinct !{!142, !143, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1: argument 0"}
!143 = distinct !{!143, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1"}
!144 = distinct !{!144, !143, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1: argument 1"}
!145 = distinct !{!145, !146, !"fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1: argument 0"}
!146 = distinct !{!146, !"fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1"}
!147 = distinct !{!147, !146, !"fused_and_compare_convert_maximum_select_slice_bitcast_891_60_clone_1: argument 1"}
!148 = !{!149, !151, !152, !154}
!149 = distinct !{!149, !150, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1: argument 0"}
!150 = distinct !{!150, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1"}
!151 = distinct !{!151, !150, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1: argument 1"}
!152 = distinct !{!152, !153, !"fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1: argument 0"}
!153 = distinct !{!153, !"fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1"}
!154 = distinct !{!154, !153, !"fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1: argument 1"}
!155 = !{!156, !158, !159, !161}
!156 = distinct !{!156, !157, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1: argument 0"}
!157 = distinct !{!157, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1"}
!158 = distinct !{!158, !157, !"fused_and_compare_convert_maximum_select_slice_concatenate_136_129_clone_1: argument 1"}
!159 = distinct !{!159, !160, !"fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1: argument 0"}
!160 = distinct !{!160, !"fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1"}
!161 = distinct !{!161, !160, !"fused_and_compare_convert_maximum_select_slice_bitcast_900_60_clone_1: argument 1"}
!162 = !{i32 0, i32 336}
!163 = !{i32 0, i32 495}
!164 = !{i32 0, i32 2}
!165 = !{!166, !168, !169, !171}
!166 = distinct !{!166, !167, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1: argument 0"}
!167 = distinct !{!167, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1"}
!168 = distinct !{!168, !167, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1: argument 1"}
!169 = distinct !{!169, !170, !"fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1: argument 0"}
!170 = distinct !{!170, !"fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1"}
!171 = distinct !{!171, !170, !"fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1: argument 1"}
!172 = !{!173, !175, !176, !178}
!173 = distinct !{!173, !174, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1: argument 0"}
!174 = distinct !{!174, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1"}
!175 = distinct !{!175, !174, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1: argument 1"}
!176 = distinct !{!176, !177, !"fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1: argument 0"}
!177 = distinct !{!177, !"fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1"}
!178 = distinct !{!178, !177, !"fused_broadcast_compare_gather_select_bitcast_2898_78_clone_1: argument 1"}
!179 = !{!180, !182, !183, !185}
!180 = distinct !{!180, !181, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1: argument 0"}
!181 = distinct !{!181, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1"}
!182 = distinct !{!182, !181, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1: argument 1"}
!183 = distinct !{!183, !184, !"fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1: argument 0"}
!184 = distinct !{!184, !"fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1"}
!185 = distinct !{!185, !184, !"fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1: argument 1"}
!186 = !{!187, !189, !190, !192}
!187 = distinct !{!187, !188, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1: argument 0"}
!188 = distinct !{!188, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1"}
!189 = distinct !{!189, !188, !"fused_broadcast_compare_gather_select_concatenate_154_131_clone_1: argument 1"}
!190 = distinct !{!190, !191, !"fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1: argument 0"}
!191 = distinct !{!191, !"fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1"}
!192 = distinct !{!192, !191, !"fused_broadcast_compare_gather_select_bitcast_2907_44_clone_1: argument 1"}
!193 = !{!194}
!194 = distinct !{!194, !195, !"fused_scatter_32_concatenate_59_5: argument 0"}
!195 = distinct !{!195, !"fused_scatter_32_concatenate_59_5"}
!196 = !{!197}
!197 = distinct !{!197, !195, !"fused_scatter_32_concatenate_59_5: argument 1"}
!198 = !{!199}
!199 = distinct !{!199, !195, !"fused_scatter_32_concatenate_59_5: argument 2"}
!200 = !{!197, !199}
!201 = !{!194, !197}
!202 = !{!194, !199}
!203 = !{!204}
!204 = distinct !{!204, !205, !"fused_scatter_29_concatenate_67_3: argument 0"}
!205 = distinct !{!205, !"fused_scatter_29_concatenate_67_3"}
!206 = !{!207}
!207 = distinct !{!207, !205, !"fused_scatter_29_concatenate_67_3: argument 1"}
!208 = !{!209}
!209 = distinct !{!209, !205, !"fused_scatter_29_concatenate_67_3: argument 2"}
!210 = !{!211}
!211 = distinct !{!211, !205, !"fused_scatter_29_concatenate_67_3: argument 3"}
!212 = !{!213}
!213 = distinct !{!213, !205, !"fused_scatter_29_concatenate_67_3: argument 4"}
!214 = !{!215}
!215 = distinct !{!215, !205, !"fused_scatter_29_concatenate_67_3: argument 5"}
!216 = !{!204, !207, !211, !213, !215}
!217 = !{!204, !207, !209, !211, !213}
!218 = !{!207, !209, !211, !213, !215}
!219 = !{!204, !209, !211, !213, !215}
!220 = !{!204, !207, !209, !211, !215}
!221 = !{!204, !207, !209, !213, !215}
!222 = !{!223}
!223 = distinct !{!223, !224, !"fused_scatter_30_concatenate_40_3: argument 0"}
!224 = distinct !{!224, !"fused_scatter_30_concatenate_40_3"}
!225 = !{!226}
!226 = distinct !{!226, !224, !"fused_scatter_30_concatenate_40_3: argument 1"}
!227 = !{!228}
!228 = distinct !{!228, !224, !"fused_scatter_30_concatenate_40_3: argument 2"}
!229 = !{!230}
!230 = distinct !{!230, !224, !"fused_scatter_30_concatenate_40_3: argument 3"}
!231 = !{!232}
!232 = distinct !{!232, !224, !"fused_scatter_30_concatenate_40_3: argument 4"}
!233 = !{!234}
!234 = distinct !{!234, !224, !"fused_scatter_30_concatenate_40_3: argument 5"}
!235 = !{!223, !226, !228, !232, !234}
!236 = !{!223, !226, !230, !232, !234}
!237 = !{!226, !228, !230, !232, !234}
!238 = !{!223, !228, !230, !232, !234}
!239 = !{!223, !226, !228, !230, !232}
!240 = !{!223, !226, !228, !230, !234}
!241 = !{i32 0, i32 81675}
!242 = !{i32 0, i32 256}
!243 = !{i32 0, i32 192}
!244 = !{!245}
!245 = distinct !{!245, !246, !"fused_and_reduce_bitcast_65_20_clone_1: argument 0"}
!246 = distinct !{!246, !"fused_and_reduce_bitcast_65_20_clone_1"}
!247 = !{!248}
!248 = distinct !{!248, !246, !"fused_and_reduce_bitcast_65_20_clone_1: argument 1"}
!249 = !{!250}
!250 = distinct !{!250, !251, !"fused_and_reduce_bitcast_65_20_clone_1: argument 0"}
!251 = distinct !{!251, !"fused_and_reduce_bitcast_65_20_clone_1"}
!252 = !{!253}
!253 = distinct !{!253, !251, !"fused_and_reduce_bitcast_65_20_clone_1: argument 1"}
!254 = !{!255}
!255 = distinct !{!255, !256, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!256 = distinct !{!256, !"fused_and_reduce_not_2084_1_clone_1"}
!257 = !{!258}
!258 = distinct !{!258, !259, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!259 = distinct !{!259, !"fused_and_reduce_not_2084_1_clone_1"}
!260 = !{!261}
!261 = distinct !{!261, !262, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!262 = distinct !{!262, !"fused_and_reduce_not_3018_1_clone_1"}
!263 = !{!264}
!264 = distinct !{!264, !265, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!265 = distinct !{!265, !"fused_and_reduce_not_3018_1_clone_1"}
!266 = !{!267}
!267 = distinct !{!267, !268, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!268 = distinct !{!268, !"fused_and_reduce_not_2084_1_clone_1"}
!269 = !{!270}
!270 = distinct !{!270, !271, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!271 = distinct !{!271, !"fused_and_reduce_not_2084_1_clone_1"}
!272 = !{!273}
!273 = distinct !{!273, !274, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!274 = distinct !{!274, !"fused_and_reduce_not_3018_1_clone_1"}
!275 = !{!276}
!276 = distinct !{!276, !277, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!277 = distinct !{!277, !"fused_and_reduce_not_3018_1_clone_1"}
!278 = !{!279}
!279 = distinct !{!279, !280, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!280 = distinct !{!280, !"fused_and_reduce_not_2084_1_clone_1"}
!281 = !{!282}
!282 = distinct !{!282, !283, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!283 = distinct !{!283, !"fused_and_reduce_not_2084_1_clone_1"}
!284 = !{!285}
!285 = distinct !{!285, !286, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!286 = distinct !{!286, !"fused_and_reduce_not_3018_1_clone_1"}
!287 = !{!288}
!288 = distinct !{!288, !289, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!289 = distinct !{!289, !"fused_and_reduce_not_3018_1_clone_1"}
!290 = !{!291}
!291 = distinct !{!291, !292, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!292 = distinct !{!292, !"fused_and_reduce_not_2084_1_clone_1"}
!293 = !{!294}
!294 = distinct !{!294, !295, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!295 = distinct !{!295, !"fused_and_reduce_not_2084_1_clone_1"}
!296 = !{!297}
!297 = distinct !{!297, !298, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!298 = distinct !{!298, !"fused_and_reduce_not_3018_1_clone_1"}
!299 = !{!300}
!300 = distinct !{!300, !301, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!301 = distinct !{!301, !"fused_and_reduce_not_3018_1_clone_1"}
!302 = !{!303}
!303 = distinct !{!303, !304, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!304 = distinct !{!304, !"fused_and_reduce_not_2084_1_clone_1"}
!305 = !{!306}
!306 = distinct !{!306, !307, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!307 = distinct !{!307, !"fused_and_reduce_not_2084_1_clone_1"}
!308 = !{!309}
!309 = distinct !{!309, !310, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!310 = distinct !{!310, !"fused_and_reduce_not_3018_1_clone_1"}
!311 = !{!312}
!312 = distinct !{!312, !313, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!313 = distinct !{!313, !"fused_and_reduce_not_3018_1_clone_1"}
!314 = !{!315}
!315 = distinct !{!315, !316, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!316 = distinct !{!316, !"fused_and_reduce_not_2084_1_clone_1"}
!317 = !{!318}
!318 = distinct !{!318, !319, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!319 = distinct !{!319, !"fused_and_reduce_not_2084_1_clone_1"}
!320 = !{!321}
!321 = distinct !{!321, !322, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!322 = distinct !{!322, !"fused_and_reduce_not_3018_1_clone_1"}
!323 = !{!324}
!324 = distinct !{!324, !325, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!325 = distinct !{!325, !"fused_and_reduce_not_3018_1_clone_1"}
!326 = !{!327}
!327 = distinct !{!327, !328, !"fused_scatter_35_concatenate_59_3: argument 0"}
!328 = distinct !{!328, !"fused_scatter_35_concatenate_59_3"}
!329 = !{!330}
!330 = distinct !{!330, !328, !"fused_scatter_35_concatenate_59_3: argument 1"}
!331 = !{!332}
!332 = distinct !{!332, !328, !"fused_scatter_35_concatenate_59_3: argument 2"}
!333 = !{!330, !332}
!334 = !{!327, !330}
!335 = !{!327, !332}
!336 = !{i32 0, i32 31680}
!337 = !{!338}
!338 = distinct !{!338, !339, !"fused_select_4_bitcast_1290_310: argument 0"}
!339 = distinct !{!339, !"fused_select_4_bitcast_1290_310"}
!340 = !{!341}
!341 = distinct !{!341, !339, !"fused_select_4_bitcast_1290_310: argument 1"}
!342 = !{!343}
!343 = distinct !{!343, !344, !"fused_select_4_bitcast_1290_310: argument 0"}
!344 = distinct !{!344, !"fused_select_4_bitcast_1290_310"}
!345 = !{!346}
!346 = distinct !{!346, !344, !"fused_select_4_bitcast_1290_310: argument 1"}
!347 = !{!348}
!348 = distinct !{!348, !349, !"fused_select_4_bitcast_1290_310: argument 0"}
!349 = distinct !{!349, !"fused_select_4_bitcast_1290_310"}
!350 = !{!351}
!351 = distinct !{!351, !349, !"fused_select_4_bitcast_1290_310: argument 1"}
!352 = !{!353}
!353 = distinct !{!353, !354, !"fused_select_4_bitcast_1290_310: argument 0"}
!354 = distinct !{!354, !"fused_select_4_bitcast_1290_310"}
!355 = !{!356}
!356 = distinct !{!356, !354, !"fused_select_4_bitcast_1290_310: argument 1"}
!357 = !{!358}
!358 = distinct !{!358, !359, !"fused_select_4_bitcast_1290_310: argument 0"}
!359 = distinct !{!359, !"fused_select_4_bitcast_1290_310"}
!360 = !{!361}
!361 = distinct !{!361, !359, !"fused_select_4_bitcast_1290_310: argument 1"}
!362 = !{!363}
!363 = distinct !{!363, !364, !"fused_select_4_bitcast_1290_310: argument 0"}
!364 = distinct !{!364, !"fused_select_4_bitcast_1290_310"}
!365 = !{!366}
!366 = distinct !{!366, !364, !"fused_select_4_bitcast_1290_310: argument 1"}
!367 = !{!368}
!368 = distinct !{!368, !369, !"fused_select_4_bitcast_1290_310: argument 0"}
!369 = distinct !{!369, !"fused_select_4_bitcast_1290_310"}
!370 = !{!371}
!371 = distinct !{!371, !369, !"fused_select_4_bitcast_1290_310: argument 1"}
!372 = !{!373}
!373 = distinct !{!373, !374, !"fused_select_4_bitcast_1290_310: argument 0"}
!374 = distinct !{!374, !"fused_select_4_bitcast_1290_310"}
!375 = !{!376}
!376 = distinct !{!376, !374, !"fused_select_4_bitcast_1290_310: argument 1"}
!377 = !{!378}
!378 = distinct !{!378, !379, !"fused_select_4_bitcast_1290_310: argument 0"}
!379 = distinct !{!379, !"fused_select_4_bitcast_1290_310"}
!380 = !{!381}
!381 = distinct !{!381, !379, !"fused_select_4_bitcast_1290_310: argument 1"}
!382 = !{!383}
!383 = distinct !{!383, !384, !"fused_select_4_bitcast_1290_310: argument 0"}
!384 = distinct !{!384, !"fused_select_4_bitcast_1290_310"}
!385 = !{!386}
!386 = distinct !{!386, !384, !"fused_select_4_bitcast_1290_310: argument 1"}
!387 = !{!388}
!388 = distinct !{!388, !389, !"fused_select_4_bitcast_1290_310: argument 0"}
!389 = distinct !{!389, !"fused_select_4_bitcast_1290_310"}
!390 = !{!391}
!391 = distinct !{!391, !389, !"fused_select_4_bitcast_1290_310: argument 1"}
!392 = !{!393}
!393 = distinct !{!393, !394, !"fused_select_4_bitcast_1290_310: argument 0"}
!394 = distinct !{!394, !"fused_select_4_bitcast_1290_310"}
!395 = !{!396}
!396 = distinct !{!396, !394, !"fused_select_4_bitcast_1290_310: argument 1"}
!397 = !{!398}
!398 = distinct !{!398, !399, !"fused_select_4_bitcast_1290_310: argument 0"}
!399 = distinct !{!399, !"fused_select_4_bitcast_1290_310"}
!400 = !{!401}
!401 = distinct !{!401, !399, !"fused_select_4_bitcast_1290_310: argument 1"}
!402 = !{!403}
!403 = distinct !{!403, !404, !"fused_select_4_bitcast_1290_310: argument 0"}
!404 = distinct !{!404, !"fused_select_4_bitcast_1290_310"}
!405 = !{!406}
!406 = distinct !{!406, !404, !"fused_select_4_bitcast_1290_310: argument 1"}
!407 = !{!408}
!408 = distinct !{!408, !409, !"fused_select_4_bitcast_1290_310: argument 0"}
!409 = distinct !{!409, !"fused_select_4_bitcast_1290_310"}
!410 = !{!411}
!411 = distinct !{!411, !409, !"fused_select_4_bitcast_1290_310: argument 1"}
!412 = !{!413}
!413 = distinct !{!413, !414, !"fused_select_4_bitcast_1290_310: argument 0"}
!414 = distinct !{!414, !"fused_select_4_bitcast_1290_310"}
!415 = !{!416}
!416 = distinct !{!416, !414, !"fused_select_4_bitcast_1290_310: argument 1"}
!417 = !{i32 0, i32 3966}
!418 = !{i32 0, i32 1980}
!419 = !{!420}
!420 = distinct !{!420, !421, !"fused_scatter_6_bitcast_180_1: argument 0"}
!421 = distinct !{!421, !"fused_scatter_6_bitcast_180_1"}
!422 = !{!423}
!423 = distinct !{!423, !424, !"fused_scatter_bitcast_212_1: argument 0"}
!424 = distinct !{!424, !"fused_scatter_bitcast_212_1"}
!425 = !{i32 0, i32 504}
!426 = !{i32 0, i32 5940}
!427 = !{i32 0, i32 7920}
!428 = !{!429}
!429 = distinct !{!429, !430, !"fused_scatter_13_bitcast_1290_292: argument 0"}
!430 = distinct !{!430, !"fused_scatter_13_bitcast_1290_292"}
!431 = !{!432}
!432 = distinct !{!432, !430, !"fused_scatter_13_bitcast_1290_292: argument 1"}
!433 = !{!434}
!434 = distinct !{!434, !435, !"fused_scatter_13_bitcast_1290_292: argument 0"}
!435 = distinct !{!435, !"fused_scatter_13_bitcast_1290_292"}
!436 = !{!437}
!437 = distinct !{!437, !435, !"fused_scatter_13_bitcast_1290_292: argument 1"}
!438 = !{!439}
!439 = distinct !{!439, !440, !"fused_scatter_13_maximum_82_31: argument 0"}
!440 = distinct !{!440, !"fused_scatter_13_maximum_82_31"}
!441 = !{!442}
!442 = distinct !{!442, !440, !"fused_scatter_13_maximum_82_31: argument 1"}
!443 = !{!444}
!444 = distinct !{!444, !445, !"fused_scatter_13_maximum_82_31: argument 0"}
!445 = distinct !{!445, !"fused_scatter_13_maximum_82_31"}
!446 = !{!447}
!447 = distinct !{!447, !445, !"fused_scatter_13_maximum_82_31: argument 1"}
!448 = !{!444, !449}
!449 = distinct !{!449, !445, !"fused_scatter_13_maximum_82_31: argument 2"}
!450 = !{!451, !444}
!451 = distinct !{!451, !452, !"fused_scatter_13_bitcast_1290_292: argument 0"}
!452 = distinct !{!452, !"fused_scatter_13_bitcast_1290_292"}
!453 = !{!454, !447, !449}
!454 = distinct !{!454, !452, !"fused_scatter_13_bitcast_1290_292: argument 1"}
!455 = !{!456}
!456 = distinct !{!456, !457, !"fused_scatter_13_bitcast_1290_292: argument 0"}
!457 = distinct !{!457, !"fused_scatter_13_bitcast_1290_292"}
!458 = !{!459}
!459 = distinct !{!459, !457, !"fused_scatter_13_bitcast_1290_292: argument 1"}
!460 = !{!439, !461}
!461 = distinct !{!461, !440, !"fused_scatter_13_maximum_82_31: argument 2"}
!462 = !{!463, !439}
!463 = distinct !{!463, !464, !"fused_scatter_13_bitcast_1290_292: argument 0"}
!464 = distinct !{!464, !"fused_scatter_13_bitcast_1290_292"}
!465 = !{!466, !442, !461}
!466 = distinct !{!466, !464, !"fused_scatter_13_bitcast_1290_292: argument 1"}
!467 = !{!468}
!468 = distinct !{!468, !469, !"fused_scatter_12_bitcast_1290_298: argument 0"}
!469 = distinct !{!469, !"fused_scatter_12_bitcast_1290_298"}
!470 = !{!471}
!471 = distinct !{!471, !469, !"fused_scatter_12_bitcast_1290_298: argument 1"}
!472 = !{!473}
!473 = distinct !{!473, !474, !"fused_scatter_12_bitcast_1290_298: argument 0"}
!474 = distinct !{!474, !"fused_scatter_12_bitcast_1290_298"}
!475 = !{!476}
!476 = distinct !{!476, !474, !"fused_scatter_12_bitcast_1290_298: argument 1"}
!477 = !{!478}
!478 = distinct !{!478, !479, !"fused_scatter_12_maximum_82_33: argument 0"}
!479 = distinct !{!479, !"fused_scatter_12_maximum_82_33"}
!480 = !{!481}
!481 = distinct !{!481, !479, !"fused_scatter_12_maximum_82_33: argument 1"}
!482 = !{!483}
!483 = distinct !{!483, !484, !"fused_scatter_12_maximum_82_33: argument 0"}
!484 = distinct !{!484, !"fused_scatter_12_maximum_82_33"}
!485 = !{!486}
!486 = distinct !{!486, !484, !"fused_scatter_12_maximum_82_33: argument 1"}
!487 = !{!483, !488}
!488 = distinct !{!488, !484, !"fused_scatter_12_maximum_82_33: argument 2"}
!489 = !{!490, !483}
!490 = distinct !{!490, !491, !"fused_scatter_12_bitcast_1290_298: argument 0"}
!491 = distinct !{!491, !"fused_scatter_12_bitcast_1290_298"}
!492 = !{!493, !486, !488}
!493 = distinct !{!493, !491, !"fused_scatter_12_bitcast_1290_298: argument 1"}
!494 = !{!495}
!495 = distinct !{!495, !496, !"fused_scatter_12_bitcast_1290_298: argument 0"}
!496 = distinct !{!496, !"fused_scatter_12_bitcast_1290_298"}
!497 = !{!498}
!498 = distinct !{!498, !496, !"fused_scatter_12_bitcast_1290_298: argument 1"}
!499 = !{!478, !500}
!500 = distinct !{!500, !479, !"fused_scatter_12_maximum_82_33: argument 2"}
!501 = !{!502, !478}
!502 = distinct !{!502, !503, !"fused_scatter_12_bitcast_1290_298: argument 0"}
!503 = distinct !{!503, !"fused_scatter_12_bitcast_1290_298"}
!504 = !{!505, !481, !500}
!505 = distinct !{!505, !503, !"fused_scatter_12_bitcast_1290_298: argument 1"}
!506 = !{!507}
!507 = distinct !{!507, !508, !"fused_scatter_11_bitcast_1290_184: argument 0"}
!508 = distinct !{!508, !"fused_scatter_11_bitcast_1290_184"}
!509 = !{!510}
!510 = distinct !{!510, !508, !"fused_scatter_11_bitcast_1290_184: argument 1"}
!511 = !{!512}
!512 = distinct !{!512, !513, !"fused_scatter_11_bitcast_1290_184: argument 0"}
!513 = distinct !{!513, !"fused_scatter_11_bitcast_1290_184"}
!514 = !{!515}
!515 = distinct !{!515, !513, !"fused_scatter_11_bitcast_1290_184: argument 1"}
!516 = !{!517}
!517 = distinct !{!517, !518, !"fused_scatter_11_maximum_82_17: argument 0"}
!518 = distinct !{!518, !"fused_scatter_11_maximum_82_17"}
!519 = !{!520}
!520 = distinct !{!520, !518, !"fused_scatter_11_maximum_82_17: argument 2"}
!521 = !{!522}
!522 = distinct !{!522, !523, !"fused_scatter_11_maximum_82_17: argument 0"}
!523 = distinct !{!523, !"fused_scatter_11_maximum_82_17"}
!524 = !{!525}
!525 = distinct !{!525, !523, !"fused_scatter_11_maximum_82_17: argument 2"}
!526 = !{!527}
!527 = distinct !{!527, !528, !"fused_scatter_11_bitcast_1290_184: argument 0"}
!528 = distinct !{!528, !"fused_scatter_11_bitcast_1290_184"}
!529 = !{!530}
!530 = distinct !{!530, !528, !"fused_scatter_11_bitcast_1290_184: argument 1"}
!531 = !{!522, !532}
!532 = distinct !{!532, !523, !"fused_scatter_11_maximum_82_17: argument 1"}
!533 = !{!534, !522}
!534 = distinct !{!534, !535, !"fused_scatter_11_bitcast_1290_184: argument 0"}
!535 = distinct !{!535, !"fused_scatter_11_bitcast_1290_184"}
!536 = !{!537, !532, !525}
!537 = distinct !{!537, !535, !"fused_scatter_11_bitcast_1290_184: argument 1"}
!538 = !{!517, !539}
!539 = distinct !{!539, !518, !"fused_scatter_11_maximum_82_17: argument 1"}
!540 = !{!541, !517}
!541 = distinct !{!541, !542, !"fused_scatter_11_bitcast_1290_184: argument 0"}
!542 = distinct !{!542, !"fused_scatter_11_bitcast_1290_184"}
!543 = !{!544, !539, !520}
!544 = distinct !{!544, !542, !"fused_scatter_11_bitcast_1290_184: argument 1"}
!545 = !{!546}
!546 = distinct !{!546, !547, !"fused_scatter_10_bitcast_1290_176: argument 0"}
!547 = distinct !{!547, !"fused_scatter_10_bitcast_1290_176"}
!548 = !{!549}
!549 = distinct !{!549, !547, !"fused_scatter_10_bitcast_1290_176: argument 1"}
!550 = !{!551}
!551 = distinct !{!551, !552, !"fused_scatter_10_bitcast_1290_176: argument 0"}
!552 = distinct !{!552, !"fused_scatter_10_bitcast_1290_176"}
!553 = !{!554}
!554 = distinct !{!554, !552, !"fused_scatter_10_bitcast_1290_176: argument 1"}
!555 = !{!556}
!556 = distinct !{!556, !557, !"fused_scatter_10_maximum_82_15: argument 0"}
!557 = distinct !{!557, !"fused_scatter_10_maximum_82_15"}
!558 = !{!559}
!559 = distinct !{!559, !557, !"fused_scatter_10_maximum_82_15: argument 2"}
!560 = !{!561}
!561 = distinct !{!561, !562, !"fused_scatter_10_maximum_82_15: argument 0"}
!562 = distinct !{!562, !"fused_scatter_10_maximum_82_15"}
!563 = !{!564}
!564 = distinct !{!564, !562, !"fused_scatter_10_maximum_82_15: argument 2"}
!565 = !{!566}
!566 = distinct !{!566, !567, !"fused_scatter_10_bitcast_1290_176: argument 0"}
!567 = distinct !{!567, !"fused_scatter_10_bitcast_1290_176"}
!568 = !{!569}
!569 = distinct !{!569, !567, !"fused_scatter_10_bitcast_1290_176: argument 1"}
!570 = !{!561, !571}
!571 = distinct !{!571, !562, !"fused_scatter_10_maximum_82_15: argument 1"}
!572 = !{!573, !561}
!573 = distinct !{!573, !574, !"fused_scatter_10_bitcast_1290_176: argument 0"}
!574 = distinct !{!574, !"fused_scatter_10_bitcast_1290_176"}
!575 = !{!576, !571, !564}
!576 = distinct !{!576, !574, !"fused_scatter_10_bitcast_1290_176: argument 1"}
!577 = !{!556, !578}
!578 = distinct !{!578, !557, !"fused_scatter_10_maximum_82_15: argument 1"}
!579 = !{!580, !556}
!580 = distinct !{!580, !581, !"fused_scatter_10_bitcast_1290_176: argument 0"}
!581 = distinct !{!581, !"fused_scatter_10_bitcast_1290_176"}
!582 = !{!583, !578, !559}
!583 = distinct !{!583, !581, !"fused_scatter_10_bitcast_1290_176: argument 1"}

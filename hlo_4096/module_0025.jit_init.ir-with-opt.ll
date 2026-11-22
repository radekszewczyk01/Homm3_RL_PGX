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
define ptx_kernel void @loop_add_fusion_2(ptr noalias readonly align 16 captures(none) dereferenceable(32768) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(98304) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(98304) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %9 = lshr i32 %7, 5
  %10 = shl nuw nsw i32 %7, 8
  %11 = and i32 %10, 7936
  %12 = shl nuw nsw i32 %8, 1
  %13 = or disjoint i32 %11, %12
  %14 = zext nneg i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %14
  %16 = load <2 x i32>, ptr addrspace(1) %15, align 8, !invariant.load !4
  %17 = extractelement <2 x i32> %16, i32 0
  %18 = extractelement <2 x i32> %16, i32 1
  %19 = add i32 %18, %9
  %20 = tail call i32 @llvm.fshl.i32(i32 %19, i32 %19, i32 13)
  %21 = add i32 %17, %19
  %22 = xor i32 %21, %20
  %23 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 15)
  %24 = add i32 %22, %21
  %25 = xor i32 %24, %23
  %26 = add i32 %25, %24
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 26)
  %28 = xor i32 %26, %27
  %29 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 6)
  %30 = add i32 %28, %26
  %31 = xor i32 %30, %29
  %32 = xor i32 %18, %17
  %33 = xor i32 %32, 466688986
  %34 = add i32 %33, 1
  %35 = add i32 %34, %31
  %36 = add i32 %30, %18
  %37 = tail call i32 @llvm.fshl.i32(i32 %35, i32 %35, i32 17)
  %38 = add i32 %36, %35
  %39 = xor i32 %38, %37
  %40 = tail call i32 @llvm.fshl.i32(i32 %39, i32 %39, i32 29)
  %41 = add i32 %39, %38
  %42 = xor i32 %41, %40
  %43 = add i32 %42, %41
  %44 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %42, i32 16)
  %45 = xor i32 %43, %44
  %46 = tail call i32 @llvm.fshl.i32(i32 %45, i32 %45, i32 24)
  %47 = add i32 %45, %43
  %48 = xor i32 %47, %46
  %49 = add i32 %17, 2
  %50 = add i32 %49, %48
  %51 = add i32 %47, %33
  %52 = tail call i32 @llvm.fshl.i32(i32 %50, i32 %50, i32 13)
  %53 = add i32 %51, %50
  %54 = xor i32 %53, %52
  %55 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %54, i32 15)
  %56 = add i32 %54, %53
  %57 = xor i32 %56, %55
  %58 = add i32 %57, %56
  %59 = tail call i32 @llvm.fshl.i32(i32 %57, i32 %57, i32 26)
  %60 = xor i32 %58, %59
  %61 = tail call i32 @llvm.fshl.i32(i32 %60, i32 %60, i32 6)
  %62 = add i32 %60, %58
  %63 = xor i32 %62, %61
  %64 = add i32 %18, 3
  %65 = add i32 %64, %63
  %66 = add i32 %62, %17
  %67 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 17)
  %68 = add i32 %66, %65
  %69 = xor i32 %68, %67
  %70 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 29)
  %71 = add i32 %69, %68
  %72 = xor i32 %71, %70
  %73 = add i32 %72, %71
  %74 = tail call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 16)
  %75 = xor i32 %73, %74
  %76 = tail call i32 @llvm.fshl.i32(i32 %75, i32 %75, i32 24)
  %77 = add i32 %75, %73
  %78 = xor i32 %77, %76
  %79 = add i32 %33, 4
  %80 = add i32 %79, %78
  %81 = add i32 %77, %18
  %82 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 13)
  %83 = add i32 %81, %80
  %84 = xor i32 %83, %82
  %85 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 15)
  %86 = add i32 %84, %83
  %87 = xor i32 %86, %85
  %88 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %87, i32 26)
  %89 = add i32 %87, %86
  %90 = xor i32 %89, %88
  %91 = add i32 %90, %89
  %92 = add i32 %91, %33
  %93 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %90, i32 6)
  %94 = xor i32 %91, %93
  %95 = add i32 %17, 5
  %96 = add i32 %95, %94
  %97 = shl nuw nsw i32 %7, 7
  %98 = or disjoint i32 %97, %8
  %99 = zext nneg i32 %98 to i64
  %100 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %99
  store i32 %92, ptr addrspace(1) %100, align 4
  %101 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %99
  store i32 %96, ptr addrspace(1) %101, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none)
define ptx_kernel void @loop_slice_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(98304) %0, ptr noalias readonly align 256 captures(none) dereferenceable(98304) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %3) local_unnamed_addr #2 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %11 = shl nuw nsw i32 %10, 6
  %12 = lshr i32 %9, 1
  %13 = or disjoint i32 %11, %12
  %14 = and i32 %9, 1
  %.not.not = icmp eq i32 %14, 0
  %15 = zext nneg i32 %13 to i64
  %.pn.v = select i1 %.not.not, ptr addrspace(1) %5, ptr addrspace(1) %6
  %.pn = getelementptr inbounds i32, ptr addrspace(1) %.pn.v, i64 %15
  %.in = getelementptr inbounds i8, ptr addrspace(1) %.pn, i64 81920
  %16 = load i32, ptr addrspace(1) %.in, align 4, !invariant.load !4
  %trunc = trunc i32 %9 to i1
  br i1 %trunc, label %17, label %24

17:                                               ; preds = %4
  %18 = zext nneg i32 %12 to i64
  %19 = zext nneg i32 %11 to i64
  %20 = add i64 %19, %18
  %21 = getelementptr i32, ptr addrspace(1) %7, i64 %20
  %22 = getelementptr i8, ptr addrspace(1) %21, i64 4
  %23 = getelementptr i8, ptr addrspace(1) %22, i64 -4
  store i32 %16, ptr addrspace(1) %23, align 4
  br label %26

24:                                               ; preds = %4
  %25 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %15
  store i32 %16, ptr addrspace(1) %25, align 4
  br label %26

26:                                               ; preds = %17, %24
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_fusion_3(ptr noalias readonly align 256 captures(none) dereferenceable(16384) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(32768) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(32768) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %11 = lshr i32 %9, 5
  %12 = shl nuw nsw i32 %9, 7
  %13 = and i32 %12, 3968
  %14 = or disjoint i32 %13, %10
  %15 = zext nneg i32 %14 to i64
  %16 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %15
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !4
  %18 = add i32 %17, %11
  %19 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %15
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = tail call i32 @llvm.fshl.i32(i32 %18, i32 %18, i32 13)
  %22 = add i32 %20, %18
  %23 = xor i32 %22, %21
  %24 = tail call i32 @llvm.fshl.i32(i32 %23, i32 %23, i32 15)
  %25 = add i32 %23, %22
  %26 = xor i32 %25, %24
  %27 = add i32 %26, %25
  %28 = tail call i32 @llvm.fshl.i32(i32 %26, i32 %26, i32 26)
  %29 = xor i32 %27, %28
  %30 = tail call i32 @llvm.fshl.i32(i32 %29, i32 %29, i32 6)
  %31 = add i32 %29, %27
  %32 = xor i32 %31, %30
  %33 = xor i32 %17, %20
  %34 = xor i32 %33, 466688986
  %35 = add i32 %34, 1
  %36 = add i32 %35, %32
  %37 = add i32 %31, %17
  %38 = tail call i32 @llvm.fshl.i32(i32 %36, i32 %36, i32 17)
  %39 = add i32 %37, %36
  %40 = xor i32 %39, %38
  %41 = tail call i32 @llvm.fshl.i32(i32 %40, i32 %40, i32 29)
  %42 = add i32 %40, %39
  %43 = xor i32 %42, %41
  %44 = add i32 %43, %42
  %45 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 16)
  %46 = xor i32 %44, %45
  %47 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 24)
  %48 = add i32 %46, %44
  %49 = xor i32 %48, %47
  %50 = add i32 %20, 2
  %51 = add i32 %50, %49
  %52 = add i32 %48, %34
  %53 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 13)
  %54 = add i32 %52, %51
  %55 = xor i32 %54, %53
  %56 = tail call i32 @llvm.fshl.i32(i32 %55, i32 %55, i32 15)
  %57 = add i32 %55, %54
  %58 = xor i32 %57, %56
  %59 = add i32 %58, %57
  %60 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 26)
  %61 = xor i32 %59, %60
  %62 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 6)
  %63 = add i32 %61, %59
  %64 = xor i32 %63, %62
  %65 = add i32 %17, 3
  %66 = add i32 %65, %64
  %67 = add i32 %63, %20
  %68 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 17)
  %69 = add i32 %67, %66
  %70 = xor i32 %69, %68
  %71 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 29)
  %72 = add i32 %70, %69
  %73 = xor i32 %72, %71
  %74 = add i32 %73, %72
  %75 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 16)
  %76 = xor i32 %74, %75
  %77 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 24)
  %78 = add i32 %76, %74
  %79 = xor i32 %78, %77
  %80 = add i32 %34, 4
  %81 = add i32 %80, %79
  %82 = add i32 %78, %17
  %83 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 13)
  %84 = add i32 %82, %81
  %85 = xor i32 %84, %83
  %86 = tail call i32 @llvm.fshl.i32(i32 %85, i32 %85, i32 15)
  %87 = add i32 %85, %84
  %88 = xor i32 %87, %86
  %89 = tail call i32 @llvm.fshl.i32(i32 %88, i32 %88, i32 26)
  %90 = add i32 %88, %87
  %91 = xor i32 %90, %89
  %92 = add i32 %91, %90
  %93 = tail call i32 @llvm.fshl.i32(i32 %91, i32 %91, i32 6)
  %94 = xor i32 %92, %93
  %95 = add i32 %20, 5
  %96 = add i32 %95, %94
  %97 = add i32 %92, %34
  %98 = or disjoint i32 %12, %10
  %99 = zext nneg i32 %98 to i64
  %100 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %99
  store i32 %96, ptr addrspace(1) %100, align 4
  %101 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %99
  store i32 %97, ptr addrspace(1) %101, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_add_divide_slice_xor_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(98304) %0, ptr noalias readonly align 256 captures(none) dereferenceable(98304) %1, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %2, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %8, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %9, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %10, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %11, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %12, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %13, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %14) local_unnamed_addr #0 {
  %16 = addrspacecast ptr %1 to ptr addrspace(1)
  %17 = addrspacecast ptr %0 to ptr addrspace(1)
  %18 = addrspacecast ptr %2 to ptr addrspace(1)
  %19 = addrspacecast ptr %3 to ptr addrspace(1)
  %20 = addrspacecast ptr %4 to ptr addrspace(1)
  %21 = addrspacecast ptr %5 to ptr addrspace(1)
  %22 = addrspacecast ptr %6 to ptr addrspace(1)
  %23 = addrspacecast ptr %7 to ptr addrspace(1)
  %24 = addrspacecast ptr %8 to ptr addrspace(1)
  %25 = addrspacecast ptr %9 to ptr addrspace(1)
  %26 = addrspacecast ptr %10 to ptr addrspace(1)
  %27 = addrspacecast ptr %11 to ptr addrspace(1)
  %28 = addrspacecast ptr %12 to ptr addrspace(1)
  %29 = addrspacecast ptr %13 to ptr addrspace(1)
  %30 = addrspacecast ptr %14 to ptr addrspace(1)
  %31 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %32 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %33 = shl nuw nsw i32 %31, 7
  %34 = or disjoint i32 %33, %32
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %35
  %37 = getelementptr inbounds i8, ptr addrspace(1) %36, i64 65536
  %38 = load i32, ptr addrspace(1) %37, align 4, !invariant.load !4, !alias.scope !7
  %39 = getelementptr inbounds i32, ptr addrspace(1) %17, i64 %35
  %40 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 65536
  %41 = load i32, ptr addrspace(1) %40, align 4, !invariant.load !4, !alias.scope !14
  %42 = xor i32 %38, %41
  %43 = xor i32 %42, 466688986
  %44 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %35
  %45 = load i32, ptr addrspace(1) %44, align 4, !invariant.load !4, !alias.scope !21
  %46 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 16384
  %47 = load i32, ptr addrspace(1) %46, align 4, !invariant.load !4, !alias.scope !28
  %48 = tail call i32 @llvm.fshl.i32(i32 %45, i32 %45, i32 13)
  %49 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %35
  %50 = load i32, ptr addrspace(1) %49, align 4, !invariant.load !4, !alias.scope !35
  %51 = add i32 %50, %45
  %52 = xor i32 %51, %48
  %53 = getelementptr inbounds i8, ptr addrspace(1) %44, i64 16384
  %54 = load i32, ptr addrspace(1) %53, align 4, !invariant.load !4, !alias.scope !42
  %55 = tail call i32 @llvm.fshl.i32(i32 %47, i32 %47, i32 13)
  %56 = getelementptr inbounds i8, ptr addrspace(1) %36, i64 16384
  %57 = load i32, ptr addrspace(1) %56, align 4, !invariant.load !4, !alias.scope !49
  %58 = add i32 %57, %47
  %59 = xor i32 %58, %55
  %60 = tail call i32 @llvm.fshl.i32(i32 %52, i32 %52, i32 15)
  %61 = add i32 %52, %51
  %62 = xor i32 %61, %60
  %63 = add i32 %62, %61
  %64 = tail call i32 @llvm.fshl.i32(i32 %62, i32 %62, i32 26)
  %65 = xor i32 %63, %64
  %66 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %54, i32 13)
  %67 = getelementptr inbounds i8, ptr addrspace(1) %49, i64 16384
  %68 = load i32, ptr addrspace(1) %67, align 4, !invariant.load !4, !alias.scope !56
  %69 = add i32 %68, %54
  %70 = xor i32 %69, %66
  %71 = tail call i32 @llvm.fshl.i32(i32 %59, i32 %59, i32 15)
  %72 = add i32 %59, %58
  %73 = xor i32 %72, %71
  %74 = add i32 %73, %72
  %75 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 26)
  %76 = xor i32 %74, %75
  %77 = tail call i32 @llvm.fshl.i32(i32 %65, i32 %65, i32 6)
  %78 = tail call i32 @llvm.fshl.i32(i32 %70, i32 %70, i32 15)
  %79 = add i32 %70, %69
  %80 = xor i32 %79, %78
  %81 = add i32 %80, %79
  %82 = tail call i32 @llvm.fshl.i32(i32 %80, i32 %80, i32 26)
  %83 = xor i32 %81, %82
  %84 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 6)
  %85 = add i32 %65, %63
  %86 = xor i32 %85, %77
  %87 = tail call i32 @llvm.fshl.i32(i32 %83, i32 %83, i32 6)
  %88 = add i32 %76, %74
  %89 = xor i32 %88, %84
  %90 = xor i32 %45, %50
  %91 = xor i32 %90, 466688986
  %92 = add i32 %91, 1
  %93 = add i32 %92, %86
  %94 = add i32 %83, %81
  %95 = xor i32 %94, %87
  %96 = xor i32 %47, %57
  %97 = xor i32 %96, 466688986
  %98 = add i32 %97, 1
  %99 = add i32 %98, %89
  %100 = add i32 %85, %45
  %101 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %93, i32 17)
  %102 = add i32 %100, %93
  %103 = xor i32 %102, %101
  %104 = xor i32 %54, %68
  %105 = xor i32 %104, 466688986
  %106 = add i32 %105, 1
  %107 = add i32 %106, %95
  %108 = add i32 %88, %47
  %109 = tail call i32 @llvm.fshl.i32(i32 %99, i32 %99, i32 17)
  %110 = add i32 %108, %99
  %111 = xor i32 %110, %109
  %112 = tail call i32 @llvm.fshl.i32(i32 %103, i32 %103, i32 29)
  %113 = add i32 %103, %102
  %114 = xor i32 %113, %112
  %115 = add i32 %114, %113
  %116 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %114, i32 16)
  %117 = xor i32 %115, %116
  %118 = add i32 %94, %54
  %119 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 17)
  %120 = add i32 %118, %107
  %121 = xor i32 %120, %119
  %122 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %111, i32 29)
  %123 = add i32 %111, %110
  %124 = xor i32 %123, %122
  %125 = add i32 %124, %123
  %126 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %124, i32 16)
  %127 = xor i32 %125, %126
  %128 = tail call i32 @llvm.fshl.i32(i32 %117, i32 %117, i32 24)
  %129 = tail call i32 @llvm.fshl.i32(i32 %121, i32 %121, i32 29)
  %130 = add i32 %121, %120
  %131 = xor i32 %130, %129
  %132 = add i32 %131, %130
  %133 = tail call i32 @llvm.fshl.i32(i32 %131, i32 %131, i32 16)
  %134 = xor i32 %132, %133
  %135 = tail call i32 @llvm.fshl.i32(i32 %127, i32 %127, i32 24)
  %136 = add i32 %117, %115
  %137 = xor i32 %136, %128
  %138 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 24)
  %139 = add i32 %127, %125
  %140 = xor i32 %139, %135
  %141 = add i32 %50, 2
  %142 = add i32 %141, %137
  %143 = add i32 %134, %132
  %144 = xor i32 %143, %138
  %145 = add i32 %57, 2
  %146 = add i32 %145, %140
  %147 = add i32 %136, %91
  %148 = tail call i32 @llvm.fshl.i32(i32 %142, i32 %142, i32 13)
  %149 = add i32 %147, %142
  %150 = xor i32 %149, %148
  %151 = add i32 %68, 2
  %152 = add i32 %151, %144
  %153 = add i32 %139, %97
  %154 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %146, i32 13)
  %155 = add i32 %153, %146
  %156 = xor i32 %155, %154
  %157 = tail call i32 @llvm.fshl.i32(i32 %150, i32 %150, i32 15)
  %158 = add i32 %150, %149
  %159 = xor i32 %158, %157
  %160 = add i32 %159, %158
  %161 = tail call i32 @llvm.fshl.i32(i32 %159, i32 %159, i32 26)
  %162 = xor i32 %160, %161
  %163 = add i32 %143, %105
  %164 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %152, i32 13)
  %165 = add i32 %163, %152
  %166 = xor i32 %165, %164
  %167 = tail call i32 @llvm.fshl.i32(i32 %156, i32 %156, i32 15)
  %168 = add i32 %156, %155
  %169 = xor i32 %168, %167
  %170 = add i32 %169, %168
  %171 = tail call i32 @llvm.fshl.i32(i32 %169, i32 %169, i32 26)
  %172 = xor i32 %170, %171
  %173 = tail call i32 @llvm.fshl.i32(i32 %162, i32 %162, i32 6)
  %174 = tail call i32 @llvm.fshl.i32(i32 %166, i32 %166, i32 15)
  %175 = add i32 %166, %165
  %176 = xor i32 %175, %174
  %177 = add i32 %176, %175
  %178 = tail call i32 @llvm.fshl.i32(i32 %176, i32 %176, i32 26)
  %179 = xor i32 %177, %178
  %180 = tail call i32 @llvm.fshl.i32(i32 %172, i32 %172, i32 6)
  %181 = add i32 %162, %160
  %182 = xor i32 %181, %173
  %183 = tail call i32 @llvm.fshl.i32(i32 %179, i32 %179, i32 6)
  %184 = add i32 %172, %170
  %185 = xor i32 %184, %180
  %186 = add i32 %45, 3
  %187 = add i32 %186, %182
  %188 = add i32 %179, %177
  %189 = xor i32 %188, %183
  %190 = add i32 %47, 3
  %191 = add i32 %190, %185
  %192 = add i32 %181, %50
  %193 = tail call i32 @llvm.fshl.i32(i32 %187, i32 %187, i32 17)
  %194 = add i32 %192, %187
  %195 = xor i32 %194, %193
  %196 = add i32 %54, 3
  %197 = add i32 %196, %189
  %198 = add i32 %184, %57
  %199 = tail call i32 @llvm.fshl.i32(i32 %191, i32 %191, i32 17)
  %200 = add i32 %198, %191
  %201 = xor i32 %200, %199
  %202 = tail call i32 @llvm.fshl.i32(i32 %195, i32 %195, i32 29)
  %203 = add i32 %195, %194
  %204 = xor i32 %203, %202
  %205 = add i32 %204, %203
  %206 = tail call i32 @llvm.fshl.i32(i32 %204, i32 %204, i32 16)
  %207 = xor i32 %205, %206
  %208 = add i32 %188, %68
  %209 = tail call i32 @llvm.fshl.i32(i32 %197, i32 %197, i32 17)
  %210 = add i32 %208, %197
  %211 = xor i32 %210, %209
  %212 = tail call i32 @llvm.fshl.i32(i32 %201, i32 %201, i32 29)
  %213 = add i32 %201, %200
  %214 = xor i32 %213, %212
  %215 = add i32 %214, %213
  %216 = tail call i32 @llvm.fshl.i32(i32 %214, i32 %214, i32 16)
  %217 = xor i32 %215, %216
  %218 = tail call i32 @llvm.fshl.i32(i32 %207, i32 %207, i32 24)
  %219 = tail call i32 @llvm.fshl.i32(i32 %211, i32 %211, i32 29)
  %220 = add i32 %211, %210
  %221 = xor i32 %220, %219
  %222 = add i32 %221, %220
  %223 = tail call i32 @llvm.fshl.i32(i32 %221, i32 %221, i32 16)
  %224 = xor i32 %222, %223
  %225 = tail call i32 @llvm.fshl.i32(i32 %217, i32 %217, i32 24)
  %226 = add i32 %207, %205
  %227 = xor i32 %226, %218
  %228 = tail call i32 @llvm.fshl.i32(i32 %224, i32 %224, i32 24)
  %229 = add i32 %217, %215
  %230 = xor i32 %229, %225
  %231 = add i32 %91, 4
  %232 = add i32 %231, %227
  %233 = add i32 %224, %222
  %234 = xor i32 %233, %228
  %235 = add i32 %97, 4
  %236 = add i32 %235, %230
  %237 = add i32 %226, %45
  %238 = tail call i32 @llvm.fshl.i32(i32 %232, i32 %232, i32 13)
  %239 = add i32 %237, %232
  %240 = xor i32 %239, %238
  %241 = add i32 %105, 4
  %242 = add i32 %241, %234
  %243 = add i32 %229, %47
  %244 = tail call i32 @llvm.fshl.i32(i32 %236, i32 %236, i32 13)
  %245 = add i32 %243, %236
  %246 = xor i32 %245, %244
  %247 = tail call i32 @llvm.fshl.i32(i32 %240, i32 %240, i32 15)
  %248 = add i32 %240, %239
  %249 = xor i32 %248, %247
  %250 = add i32 %249, %248
  %251 = tail call i32 @llvm.fshl.i32(i32 %249, i32 %249, i32 26)
  %252 = xor i32 %250, %251
  %253 = add i32 %233, %54
  %254 = tail call i32 @llvm.fshl.i32(i32 %242, i32 %242, i32 13)
  %255 = add i32 %253, %242
  %256 = xor i32 %255, %254
  %257 = tail call i32 @llvm.fshl.i32(i32 %246, i32 %246, i32 15)
  %258 = add i32 %246, %245
  %259 = xor i32 %258, %257
  %260 = add i32 %259, %258
  %261 = tail call i32 @llvm.fshl.i32(i32 %259, i32 %259, i32 26)
  %262 = xor i32 %260, %261
  %263 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %252, i32 6)
  %264 = tail call i32 @llvm.fshl.i32(i32 %256, i32 %256, i32 15)
  %265 = add i32 %256, %255
  %266 = xor i32 %265, %264
  %267 = add i32 %266, %265
  %268 = tail call i32 @llvm.fshl.i32(i32 %266, i32 %266, i32 26)
  %269 = xor i32 %267, %268
  %270 = tail call i32 @llvm.fshl.i32(i32 %262, i32 %262, i32 6)
  %271 = add i32 %252, %250
  %272 = xor i32 %271, %263
  %273 = tail call i32 @llvm.fshl.i32(i32 %269, i32 %269, i32 6)
  %274 = add i32 %262, %260
  %275 = xor i32 %274, %270
  %276 = add i32 %269, %267
  %277 = xor i32 %276, %273
  %278 = add i32 %271, %91
  %279 = add i32 %50, 5
  %280 = add i32 %279, %272
  %281 = add i32 %274, %97
  %282 = add i32 %57, 5
  %283 = add i32 %282, %275
  %284 = xor i32 %280, %278
  %285 = add i32 %276, %105
  %286 = add i32 %68, 5
  %287 = add i32 %286, %277
  %288 = xor i32 %283, %281
  %289 = urem i32 %284, 6
  %290 = xor i32 %287, %285
  %291 = lshr i32 %288, 9
  %292 = shl nuw nsw i32 %289, 2
  %293 = urem i32 %290, 6
  %294 = or disjoint i32 %291, 1065353216
  %295 = add nuw nsw i32 %293, %292
  %296 = bitcast i32 %294 to float
  %.lhs.trunc = trunc nuw nsw i32 %295 to i8
  %297 = urem i8 %.lhs.trunc, 6
  %298 = fadd float %296, -1.000000e+00
  %299 = fmul float %298, 3.700000e+04
  %narrow = add nuw nsw i8 %297, 2
  %300 = zext nneg i8 %narrow to i32
  %301 = fadd float %299, 3.000000e+03
  %302 = tail call float @llvm.maximum.f32(float %301, float 3.000000e+03)
  %303 = uitofp nneg i8 %narrow to float
  %304 = fdiv float %302, %303
  %305 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 49152
  %306 = load i32, ptr addrspace(1) %305, align 4, !invariant.load !4, !alias.scope !63
  %307 = load i32, ptr addrspace(1) %39, align 4, !invariant.load !4, !alias.scope !70
  %308 = getelementptr inbounds i8, ptr addrspace(1) %39, i64 32768
  %309 = load i32, ptr addrspace(1) %308, align 4, !invariant.load !4, !alias.scope !77
  %310 = load i32, ptr addrspace(1) %36, align 4, !invariant.load !4, !alias.scope !84
  %311 = getelementptr inbounds i8, ptr addrspace(1) %36, i64 49152
  %312 = load i32, ptr addrspace(1) %311, align 4, !invariant.load !4, !alias.scope !91
  %313 = getelementptr inbounds i8, ptr addrspace(1) %36, i64 32768
  %314 = load i32, ptr addrspace(1) %313, align 4, !invariant.load !4, !alias.scope !98
  %315 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %35
  store i32 %43, ptr addrspace(1) %315, align 4
  %316 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %35
  store i32 %41, ptr addrspace(1) %316, align 4
  %317 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %35
  store i32 %38, ptr addrspace(1) %317, align 4
  %318 = getelementptr inbounds float, ptr addrspace(1) %23, i64 %35
  store float %304, ptr addrspace(1) %318, align 4
  %319 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %35
  store i32 %300, ptr addrspace(1) %319, align 4
  %320 = getelementptr inbounds i32, ptr addrspace(1) %25, i64 %35
  store i32 %306, ptr addrspace(1) %320, align 4
  %321 = getelementptr inbounds i32, ptr addrspace(1) %26, i64 %35
  store i32 %307, ptr addrspace(1) %321, align 4
  %322 = getelementptr inbounds i32, ptr addrspace(1) %27, i64 %35
  store i32 %309, ptr addrspace(1) %322, align 4
  %323 = getelementptr inbounds i32, ptr addrspace(1) %28, i64 %35
  store i32 %310, ptr addrspace(1) %323, align 4
  %324 = getelementptr inbounds i32, ptr addrspace(1) %29, i64 %35
  store i32 %312, ptr addrspace(1) %324, align 4
  %325 = getelementptr inbounds i32, ptr addrspace(1) %30, i64 %35
  store i32 %314, ptr addrspace(1) %325, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_select_fusion_5(ptr noalias readonly align 256 captures(none) dereferenceable(32768) %0, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %9 = shl nuw nsw i32 %7, 7
  %10 = or disjoint i32 %9, %8
  %11 = udiv i32 %10, 14
  %12 = mul i32 %11, 14
  %.decomposed = sub i32 %10, %12
  %13 = zext nneg i32 %11 to i64
  %14 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %13
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !106
  %16 = add i32 %15, %.decomposed
  %17 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %13
  %18 = load i32, ptr addrspace(1) %17, align 4, !invariant.load !4, !alias.scope !113
  %19 = tail call i32 @llvm.fshl.i32(i32 %16, i32 %16, i32 13)
  %20 = add i32 %18, %16
  %21 = xor i32 %20, %19
  %22 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 16384
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !4, !alias.scope !120
  %24 = add i32 %23, %.decomposed
  %25 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 15)
  %26 = add i32 %21, %20
  %27 = xor i32 %26, %25
  %28 = add i32 %27, %26
  %29 = tail call i32 @llvm.fshl.i32(i32 %27, i32 %27, i32 26)
  %30 = xor i32 %28, %29
  %31 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 16384
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4, !alias.scope !127
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
define ptx_kernel void @loop_compare_fusion_2(ptr noalias readonly align 256 captures(none) dereferenceable(16384) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = shl nuw nsw i32 %5, 7
  %8 = or disjoint i32 %7, %6
  %9 = udiv i32 %8, 14
  %10 = mul i32 %9, 14
  %.decomposed = sub i32 %8, %10
  %.urem = add nsw i32 %.decomposed, -7
  %.cmp = icmp samesign ult i32 %.decomposed, 7
  %11 = select i1 %.cmp, i32 %.decomposed, i32 %.urem
  %12 = zext nneg i32 %9 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %3, i64 %12
  %14 = load i32, ptr addrspace(1) %13, align 4, !invariant.load !4
  %15 = icmp slt i32 %11, %14
  %16 = zext i1 %15 to i8
  %17 = zext nneg i32 %8 to i64
  %18 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 %17
  store i8 %16, ptr addrspace(1) %18, align 1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite)
define ptx_kernel void @loop_reduce_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(57344) %0, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %1, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %4) local_unnamed_addr #3 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %13 = zext nneg i32 %11 to i64
  %14 = mul nuw nsw i64 %13, 7168
  %15 = zext nneg i32 %12 to i64
  %16 = mul nuw nsw i64 %15, 56
  %17 = add i64 %14, %16
  %18 = add i64 %17, 12
  %scevgep = getelementptr i8, ptr addrspace(1) %7, i64 %18
  %19 = mul nuw nsw i64 %13, 1792
  %20 = mul nuw nsw i64 %15, 14
  %21 = add i64 %19, %20
  %22 = add i64 %21, 3
  %scevgep37 = getelementptr i8, ptr addrspace(1) %8, i64 %22
  br label %23

23:                                               ; preds = %5, %23
  %lsr.iv29 = phi ptr addrspace(1) [ %scevgep, %5 ], [ %scevgep30, %23 ]
  %lsr.iv = phi i64 [ 0, %5 ], [ %209, %23 ]
  %24 = phi i32 [ 0, %5 ], [ %206, %23 ]
  %25 = phi i32 [ -2147483648, %5 ], [ %200, %23 ]
  %scevgep32 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 -12
  %26 = load i32, ptr addrspace(1) %scevgep32, align 4, !invariant.load !4
  %27 = tail call i32 @llvm.smax.i32(i32 %26, i32 0)
  %28 = tail call i32 @llvm.umin.i32(i32 %27, i32 100)
  %29 = mul nuw nsw i32 %28, 20
  %30 = zext nneg i32 %29 to i64
  %31 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %30
  %32 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 20
  %33 = load float, ptr addrspace(1) %32, align 4, !invariant.load !4
  %.inv = fcmp ole float %33, 0xC1E0000000000000
  %34 = select i1 %.inv, float 0xC1E0000000000000, float %33
  %35 = fptosi float %34 to i32
  %36 = fcmp oge float %33, 0x41E0000000000000
  %37 = fcmp uno float %33, 0.000000e+00
  %scevgep39 = getelementptr i8, ptr addrspace(1) %scevgep37, i64 %lsr.iv
  %scevgep40 = getelementptr i8, ptr addrspace(1) %scevgep39, i64 -3
  %38 = load i8, ptr addrspace(1) %scevgep40, align 1, !invariant.load !4
  %39 = add i32 %35, 1000
  %40 = select i1 %36, i32 -2147482649, i32 %39
  %41 = select i1 %37, i32 1000, i32 %40
  %42 = trunc i8 %38 to i1
  %43 = select i1 %42, i32 %41, i32 -10000
  %44 = icmp sgt i32 %25, %43
  %45 = tail call i32 @llvm.smax.i32(i32 %25, i32 %43)
  %46 = icmp eq i32 %25, %43
  %tmp = trunc i64 %lsr.iv to i32
  %47 = icmp slt i32 %24, %tmp
  %48 = and i1 %47, %46
  %49 = or i1 %44, %48
  %50 = select i1 %49, i32 %24, i32 %tmp
  %scevgep33 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 -8
  %51 = load i32, ptr addrspace(1) %scevgep33, align 4, !invariant.load !4
  %52 = tail call i32 @llvm.smax.i32(i32 %51, i32 0)
  %53 = tail call i32 @llvm.umin.i32(i32 %52, i32 100)
  %54 = mul nuw nsw i32 %53, 20
  %55 = zext nneg i32 %54 to i64
  %56 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %55
  %57 = getelementptr inbounds i8, ptr addrspace(1) %56, i64 20
  %58 = load float, ptr addrspace(1) %57, align 4, !invariant.load !4
  %.inv1 = fcmp ole float %58, 0xC1E0000000000000
  %59 = select i1 %.inv1, float 0xC1E0000000000000, float %58
  %60 = fptosi float %59 to i32
  %61 = fcmp oge float %58, 0x41E0000000000000
  %62 = fcmp uno float %58, 0.000000e+00
  %scevgep48 = getelementptr i8, ptr addrspace(1) %scevgep39, i64 -2
  %63 = load i8, ptr addrspace(1) %scevgep48, align 1, !invariant.load !4
  %64 = add i32 %60, 1000
  %65 = select i1 %61, i32 -2147482649, i32 %64
  %66 = select i1 %62, i32 1000, i32 %65
  %67 = trunc i8 %63 to i1
  %68 = select i1 %67, i32 %66, i32 -10000
  %69 = icmp sgt i32 %45, %68
  %70 = tail call i32 @llvm.smax.i32(i32 %45, i32 %68)
  %71 = icmp eq i32 %45, %68
  %72 = icmp sle i32 %50, %tmp
  %73 = and i1 %71, %72
  %74 = or i1 %69, %73
  %75 = add i64 %lsr.iv, 1
  %lsr.chain52 = trunc i64 %75 to i32
  %76 = select i1 %74, i32 %50, i32 %lsr.chain52
  %scevgep34 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 -4
  %77 = load i32, ptr addrspace(1) %scevgep34, align 4, !invariant.load !4
  %78 = tail call i32 @llvm.smax.i32(i32 %77, i32 0)
  %79 = tail call i32 @llvm.umin.i32(i32 %78, i32 100)
  %80 = mul nuw nsw i32 %79, 20
  %81 = zext nneg i32 %80 to i64
  %82 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %81
  %83 = getelementptr inbounds i8, ptr addrspace(1) %82, i64 20
  %84 = load float, ptr addrspace(1) %83, align 4, !invariant.load !4
  %.inv2 = fcmp ole float %84, 0xC1E0000000000000
  %85 = select i1 %.inv2, float 0xC1E0000000000000, float %84
  %86 = fptosi float %85 to i32
  %87 = fcmp oge float %84, 0x41E0000000000000
  %88 = fcmp uno float %84, 0.000000e+00
  %scevgep50 = getelementptr i8, ptr addrspace(1) %scevgep39, i64 -1
  %89 = load i8, ptr addrspace(1) %scevgep50, align 1, !invariant.load !4
  %90 = add i32 %86, 1000
  %91 = select i1 %87, i32 -2147482649, i32 %90
  %92 = select i1 %88, i32 1000, i32 %91
  %93 = trunc i8 %89 to i1
  %94 = select i1 %93, i32 %92, i32 -10000
  %95 = icmp sgt i32 %70, %94
  %96 = tail call i32 @llvm.smax.i32(i32 %70, i32 %94)
  %97 = icmp eq i32 %70, %94
  %98 = add i64 %75, 1
  %lsr.chain53 = trunc i64 %98 to i32
  %99 = icmp slt i32 %76, %lsr.chain53
  %100 = and i1 %97, %99
  %101 = or i1 %95, %100
  %102 = select i1 %101, i32 %76, i32 %lsr.chain53
  %103 = load i32, ptr addrspace(1) %lsr.iv29, align 4, !invariant.load !4
  %104 = tail call i32 @llvm.smax.i32(i32 %103, i32 0)
  %105 = tail call i32 @llvm.umin.i32(i32 %104, i32 100)
  %106 = mul nuw nsw i32 %105, 20
  %107 = zext nneg i32 %106 to i64
  %108 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %107
  %109 = getelementptr inbounds i8, ptr addrspace(1) %108, i64 20
  %110 = load float, ptr addrspace(1) %109, align 4, !invariant.load !4
  %.inv3 = fcmp ole float %110, 0xC1E0000000000000
  %111 = select i1 %.inv3, float 0xC1E0000000000000, float %110
  %112 = fptosi float %111 to i32
  %113 = fcmp oge float %110, 0x41E0000000000000
  %114 = fcmp uno float %110, 0.000000e+00
  %115 = load i8, ptr addrspace(1) %scevgep39, align 1, !invariant.load !4
  %116 = add i32 %112, 1000
  %117 = select i1 %113, i32 -2147482649, i32 %116
  %118 = select i1 %114, i32 1000, i32 %117
  %119 = trunc i8 %115 to i1
  %120 = select i1 %119, i32 %118, i32 -10000
  %121 = icmp sgt i32 %96, %120
  %122 = tail call i32 @llvm.smax.i32(i32 %96, i32 %120)
  %123 = icmp eq i32 %96, %120
  %124 = add i64 %98, 1
  %lsr.chain55 = trunc i64 %124 to i32
  %125 = icmp slt i32 %102, %lsr.chain55
  %126 = and i1 %123, %125
  %127 = or i1 %121, %126
  %128 = select i1 %127, i32 %102, i32 %lsr.chain55
  %scevgep35 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 4
  %129 = load i32, ptr addrspace(1) %scevgep35, align 4, !invariant.load !4
  %130 = tail call i32 @llvm.smax.i32(i32 %129, i32 0)
  %131 = tail call i32 @llvm.umin.i32(i32 %130, i32 100)
  %132 = mul nuw nsw i32 %131, 20
  %133 = zext nneg i32 %132 to i64
  %134 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %133
  %135 = getelementptr inbounds i8, ptr addrspace(1) %134, i64 20
  %136 = load float, ptr addrspace(1) %135, align 4, !invariant.load !4
  %.inv4 = fcmp ole float %136, 0xC1E0000000000000
  %137 = select i1 %.inv4, float 0xC1E0000000000000, float %136
  %138 = fptosi float %137 to i32
  %139 = fcmp oge float %136, 0x41E0000000000000
  %140 = fcmp uno float %136, 0.000000e+00
  %scevgep46 = getelementptr i8, ptr addrspace(1) %scevgep39, i64 1
  %141 = load i8, ptr addrspace(1) %scevgep46, align 1, !invariant.load !4
  %142 = add i32 %138, 1000
  %143 = select i1 %139, i32 -2147482649, i32 %142
  %144 = select i1 %140, i32 1000, i32 %143
  %145 = trunc i8 %141 to i1
  %146 = select i1 %145, i32 %144, i32 -10000
  %147 = icmp sgt i32 %122, %146
  %148 = tail call i32 @llvm.smax.i32(i32 %122, i32 %146)
  %149 = icmp eq i32 %122, %146
  %150 = add i64 %124, 1
  %lsr.chain57 = trunc i64 %150 to i32
  %151 = icmp slt i32 %128, %lsr.chain57
  %152 = and i1 %149, %151
  %153 = or i1 %147, %152
  %154 = select i1 %153, i32 %128, i32 %lsr.chain57
  %scevgep36 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 8
  %155 = load i32, ptr addrspace(1) %scevgep36, align 4, !invariant.load !4
  %156 = tail call i32 @llvm.smax.i32(i32 %155, i32 0)
  %157 = tail call i32 @llvm.umin.i32(i32 %156, i32 100)
  %158 = mul nuw nsw i32 %157, 20
  %159 = zext nneg i32 %158 to i64
  %160 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %159
  %161 = getelementptr inbounds i8, ptr addrspace(1) %160, i64 20
  %162 = load float, ptr addrspace(1) %161, align 4, !invariant.load !4
  %.inv5 = fcmp ole float %162, 0xC1E0000000000000
  %163 = select i1 %.inv5, float 0xC1E0000000000000, float %162
  %164 = fptosi float %163 to i32
  %165 = fcmp oge float %162, 0x41E0000000000000
  %166 = fcmp uno float %162, 0.000000e+00
  %scevgep44 = getelementptr i8, ptr addrspace(1) %scevgep39, i64 2
  %167 = load i8, ptr addrspace(1) %scevgep44, align 1, !invariant.load !4
  %168 = add i32 %164, 1000
  %169 = select i1 %165, i32 -2147482649, i32 %168
  %170 = select i1 %166, i32 1000, i32 %169
  %171 = trunc i8 %167 to i1
  %172 = select i1 %171, i32 %170, i32 -10000
  %173 = icmp sgt i32 %148, %172
  %174 = tail call i32 @llvm.smax.i32(i32 %148, i32 %172)
  %175 = icmp eq i32 %148, %172
  %176 = add i64 %150, 1
  %lsr.chain59 = trunc i64 %176 to i32
  %177 = icmp slt i32 %154, %lsr.chain59
  %178 = and i1 %175, %177
  %179 = or i1 %173, %178
  %180 = select i1 %179, i32 %154, i32 %lsr.chain59
  %scevgep31 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 12
  %181 = load i32, ptr addrspace(1) %scevgep31, align 4, !invariant.load !4
  %182 = tail call i32 @llvm.smax.i32(i32 %181, i32 0)
  %183 = tail call i32 @llvm.umin.i32(i32 %182, i32 100)
  %184 = mul nuw nsw i32 %183, 20
  %185 = zext nneg i32 %184 to i64
  %186 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %185
  %187 = getelementptr inbounds i8, ptr addrspace(1) %186, i64 20
  %188 = load float, ptr addrspace(1) %187, align 4, !invariant.load !4
  %.inv6 = fcmp ole float %188, 0xC1E0000000000000
  %189 = select i1 %.inv6, float 0xC1E0000000000000, float %188
  %190 = fptosi float %189 to i32
  %191 = fcmp oge float %188, 0x41E0000000000000
  %192 = fcmp uno float %188, 0.000000e+00
  %scevgep42 = getelementptr i8, ptr addrspace(1) %scevgep39, i64 3
  %193 = load i8, ptr addrspace(1) %scevgep42, align 1, !invariant.load !4
  %194 = add i32 %190, 1000
  %195 = select i1 %191, i32 -2147482649, i32 %194
  %196 = select i1 %192, i32 1000, i32 %195
  %197 = trunc i8 %193 to i1
  %198 = select i1 %197, i32 %196, i32 -10000
  %199 = icmp sgt i32 %174, %198
  %200 = tail call i32 @llvm.smax.i32(i32 %174, i32 %198)
  %201 = icmp eq i32 %174, %198
  %202 = add i64 %176, 1
  %lsr.chain61 = trunc i64 %202 to i32
  %203 = icmp slt i32 %180, %lsr.chain61
  %204 = and i1 %201, %203
  %205 = or i1 %199, %204
  %206 = select i1 %205, i32 %180, i32 %lsr.chain61
  %scevgep30 = getelementptr i8, ptr addrspace(1) %lsr.iv29, i64 28
  %207 = add i64 %202, -6
  %lsr.chain63 = trunc i64 %207 to i32
  %208 = icmp samesign ult i32 %lsr.chain63, 7
  %209 = add i64 %207, 7
  br i1 %208, label %23, label %210

210:                                              ; preds = %23
  %211 = shl nuw nsw i32 %11, 7
  %212 = or disjoint i32 %211, %12
  %213 = zext nneg i32 %212 to i64
  %214 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %213
  store i32 %200, ptr addrspace(1) %214, align 4
  %215 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %213
  store i32 %206, ptr addrspace(1) %215, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_select_fusion_6(ptr noalias align 256 captures(none) dereferenceable(16384) %0, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %1, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %2, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %3) local_unnamed_addr #0 {
  %5 = addrspacecast ptr %3 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %11 = shl nuw nsw i32 %9, 7
  %12 = or disjoint i32 %11, %10
  %13 = mul nuw nsw i32 %10, 14
  %14 = mul nuw nsw i32 %9, 1792
  %15 = add nuw nsw i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %16
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !4
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = tail call i32 @llvm.smax.i32(i32 %19, i32 0)
  %22 = tail call i32 @llvm.umin.i32(i32 %21, i32 100)
  %23 = mul nuw nsw i32 %22, 20
  %24 = zext nneg i32 %23 to i64
  %25 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %24
  %26 = getelementptr inbounds i8, ptr addrspace(1) %25, i64 20
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !4
  %.inv = fcmp ole float %27, 0xC1E0000000000000
  %28 = select i1 %.inv, float 0xC1E0000000000000, float %27
  %29 = fptosi float %28 to i32
  %30 = fcmp oge float %27, 0x41E0000000000000
  %31 = fcmp uno float %27, 0.000000e+00
  %32 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %16
  %33 = load <2 x i8>, ptr addrspace(1) %32, align 2, !invariant.load !4
  %34 = extractelement <2 x i8> %33, i32 0
  %35 = extractelement <2 x i8> %33, i32 1
  %36 = add i32 %29, 1000
  %37 = select i1 %30, i32 -2147482649, i32 %36
  %38 = select i1 %31, i32 1000, i32 %37
  %39 = trunc i8 %34 to i1
  %40 = select i1 %39, i32 %38, i32 -10000
  %41 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %42 = tail call i32 @llvm.umin.i32(i32 %41, i32 100)
  %43 = mul nuw nsw i32 %42, 20
  %44 = zext nneg i32 %43 to i64
  %45 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %44
  %46 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 20
  %47 = load float, ptr addrspace(1) %46, align 4, !invariant.load !4
  %.inv1 = fcmp ole float %47, 0xC1E0000000000000
  %48 = select i1 %.inv1, float 0xC1E0000000000000, float %47
  %49 = fptosi float %48 to i32
  %50 = fcmp oge float %47, 0x41E0000000000000
  %51 = fcmp uno float %47, 0.000000e+00
  %52 = add i32 %49, 1000
  %53 = select i1 %50, i32 -2147482649, i32 %52
  %54 = select i1 %51, i32 1000, i32 %53
  %55 = trunc i8 %35 to i1
  %56 = select i1 %55, i32 %54, i32 -10000
  %57 = tail call i32 @llvm.smax.i32(i32 %40, i32 %56)
  %58 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 8
  %59 = load <2 x i32>, ptr addrspace(1) %58, align 8, !invariant.load !4
  %60 = extractelement <2 x i32> %59, i32 0
  %61 = extractelement <2 x i32> %59, i32 1
  %62 = tail call i32 @llvm.smax.i32(i32 %60, i32 0)
  %63 = tail call i32 @llvm.umin.i32(i32 %62, i32 100)
  %64 = mul nuw nsw i32 %63, 20
  %65 = zext nneg i32 %64 to i64
  %66 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %65
  %67 = getelementptr inbounds i8, ptr addrspace(1) %66, i64 20
  %68 = load float, ptr addrspace(1) %67, align 4, !invariant.load !4
  %.inv2 = fcmp ole float %68, 0xC1E0000000000000
  %69 = select i1 %.inv2, float 0xC1E0000000000000, float %68
  %70 = fptosi float %69 to i32
  %71 = fcmp oge float %68, 0x41E0000000000000
  %72 = fcmp uno float %68, 0.000000e+00
  %73 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 2
  %74 = load <2 x i8>, ptr addrspace(1) %73, align 2, !invariant.load !4
  %75 = extractelement <2 x i8> %74, i32 0
  %76 = extractelement <2 x i8> %74, i32 1
  %77 = add i32 %70, 1000
  %78 = select i1 %71, i32 -2147482649, i32 %77
  %79 = select i1 %72, i32 1000, i32 %78
  %80 = trunc i8 %75 to i1
  %81 = select i1 %80, i32 %79, i32 -10000
  %82 = tail call i32 @llvm.smax.i32(i32 %57, i32 %81)
  %83 = tail call i32 @llvm.smax.i32(i32 %61, i32 0)
  %84 = tail call i32 @llvm.umin.i32(i32 %83, i32 100)
  %85 = mul nuw nsw i32 %84, 20
  %86 = zext nneg i32 %85 to i64
  %87 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %86
  %88 = getelementptr inbounds i8, ptr addrspace(1) %87, i64 20
  %89 = load float, ptr addrspace(1) %88, align 4, !invariant.load !4
  %.inv3 = fcmp ole float %89, 0xC1E0000000000000
  %90 = select i1 %.inv3, float 0xC1E0000000000000, float %89
  %91 = fptosi float %90 to i32
  %92 = fcmp oge float %89, 0x41E0000000000000
  %93 = fcmp uno float %89, 0.000000e+00
  %94 = add i32 %91, 1000
  %95 = select i1 %92, i32 -2147482649, i32 %94
  %96 = select i1 %93, i32 1000, i32 %95
  %97 = trunc i8 %76 to i1
  %98 = select i1 %97, i32 %96, i32 -10000
  %99 = tail call i32 @llvm.smax.i32(i32 %82, i32 %98)
  %100 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 16
  %101 = load <2 x i32>, ptr addrspace(1) %100, align 8, !invariant.load !4
  %102 = extractelement <2 x i32> %101, i32 0
  %103 = extractelement <2 x i32> %101, i32 1
  %104 = tail call i32 @llvm.smax.i32(i32 %102, i32 0)
  %105 = tail call i32 @llvm.umin.i32(i32 %104, i32 100)
  %106 = mul nuw nsw i32 %105, 20
  %107 = zext nneg i32 %106 to i64
  %108 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %107
  %109 = getelementptr inbounds i8, ptr addrspace(1) %108, i64 20
  %110 = load float, ptr addrspace(1) %109, align 4, !invariant.load !4
  %.inv4 = fcmp ole float %110, 0xC1E0000000000000
  %111 = select i1 %.inv4, float 0xC1E0000000000000, float %110
  %112 = fptosi float %111 to i32
  %113 = fcmp oge float %110, 0x41E0000000000000
  %114 = fcmp uno float %110, 0.000000e+00
  %115 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 4
  %116 = load <2 x i8>, ptr addrspace(1) %115, align 2, !invariant.load !4
  %117 = extractelement <2 x i8> %116, i32 0
  %118 = extractelement <2 x i8> %116, i32 1
  %119 = add i32 %112, 1000
  %120 = select i1 %113, i32 -2147482649, i32 %119
  %121 = select i1 %114, i32 1000, i32 %120
  %122 = trunc i8 %117 to i1
  %123 = select i1 %122, i32 %121, i32 -10000
  %124 = tail call i32 @llvm.smax.i32(i32 %99, i32 %123)
  %125 = tail call i32 @llvm.smax.i32(i32 %103, i32 0)
  %126 = tail call i32 @llvm.umin.i32(i32 %125, i32 100)
  %127 = mul nuw nsw i32 %126, 20
  %128 = zext nneg i32 %127 to i64
  %129 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %128
  %130 = getelementptr inbounds i8, ptr addrspace(1) %129, i64 20
  %131 = load float, ptr addrspace(1) %130, align 4, !invariant.load !4
  %.inv5 = fcmp ole float %131, 0xC1E0000000000000
  %132 = select i1 %.inv5, float 0xC1E0000000000000, float %131
  %133 = fptosi float %132 to i32
  %134 = fcmp oge float %131, 0x41E0000000000000
  %135 = fcmp uno float %131, 0.000000e+00
  %136 = add i32 %133, 1000
  %137 = select i1 %134, i32 -2147482649, i32 %136
  %138 = select i1 %135, i32 1000, i32 %137
  %139 = trunc i8 %118 to i1
  %140 = select i1 %139, i32 %138, i32 -10000
  %141 = tail call i32 @llvm.smax.i32(i32 %124, i32 %140)
  %142 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 24
  %143 = load <2 x i32>, ptr addrspace(1) %142, align 8, !invariant.load !4
  %144 = extractelement <2 x i32> %143, i32 0
  %145 = extractelement <2 x i32> %143, i32 1
  %146 = tail call i32 @llvm.smax.i32(i32 %144, i32 0)
  %147 = tail call i32 @llvm.umin.i32(i32 %146, i32 100)
  %148 = mul nuw nsw i32 %147, 20
  %149 = zext nneg i32 %148 to i64
  %150 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %149
  %151 = getelementptr inbounds i8, ptr addrspace(1) %150, i64 20
  %152 = load float, ptr addrspace(1) %151, align 4, !invariant.load !4
  %.inv6 = fcmp ole float %152, 0xC1E0000000000000
  %153 = select i1 %.inv6, float 0xC1E0000000000000, float %152
  %154 = fptosi float %153 to i32
  %155 = fcmp oge float %152, 0x41E0000000000000
  %156 = fcmp uno float %152, 0.000000e+00
  %157 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 6
  %158 = load <2 x i8>, ptr addrspace(1) %157, align 2, !invariant.load !4
  %159 = extractelement <2 x i8> %158, i32 0
  %160 = extractelement <2 x i8> %158, i32 1
  %161 = add i32 %154, 1000
  %162 = select i1 %155, i32 -2147482649, i32 %161
  %163 = select i1 %156, i32 1000, i32 %162
  %164 = trunc i8 %159 to i1
  %165 = select i1 %164, i32 %163, i32 -10000
  %166 = tail call i32 @llvm.smax.i32(i32 %141, i32 %165)
  %167 = tail call i32 @llvm.smax.i32(i32 %145, i32 0)
  %168 = tail call i32 @llvm.umin.i32(i32 %167, i32 100)
  %169 = mul nuw nsw i32 %168, 20
  %170 = zext nneg i32 %169 to i64
  %171 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %170
  %172 = getelementptr inbounds i8, ptr addrspace(1) %171, i64 20
  %173 = load float, ptr addrspace(1) %172, align 4, !invariant.load !4
  %.inv7 = fcmp ole float %173, 0xC1E0000000000000
  %174 = select i1 %.inv7, float 0xC1E0000000000000, float %173
  %175 = fptosi float %174 to i32
  %176 = fcmp oge float %173, 0x41E0000000000000
  %177 = fcmp uno float %173, 0.000000e+00
  %178 = add i32 %175, 1000
  %179 = select i1 %176, i32 -2147482649, i32 %178
  %180 = select i1 %177, i32 1000, i32 %179
  %181 = trunc i8 %160 to i1
  %182 = select i1 %181, i32 %180, i32 -10000
  %183 = tail call i32 @llvm.smax.i32(i32 %166, i32 %182)
  %184 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 32
  %185 = load <2 x i32>, ptr addrspace(1) %184, align 8, !invariant.load !4
  %186 = extractelement <2 x i32> %185, i32 0
  %187 = extractelement <2 x i32> %185, i32 1
  %188 = tail call i32 @llvm.smax.i32(i32 %186, i32 0)
  %189 = tail call i32 @llvm.umin.i32(i32 %188, i32 100)
  %190 = mul nuw nsw i32 %189, 20
  %191 = zext nneg i32 %190 to i64
  %192 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %191
  %193 = getelementptr inbounds i8, ptr addrspace(1) %192, i64 20
  %194 = load float, ptr addrspace(1) %193, align 4, !invariant.load !4
  %.inv8 = fcmp ole float %194, 0xC1E0000000000000
  %195 = select i1 %.inv8, float 0xC1E0000000000000, float %194
  %196 = fptosi float %195 to i32
  %197 = fcmp oge float %194, 0x41E0000000000000
  %198 = fcmp uno float %194, 0.000000e+00
  %199 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 8
  %200 = load <2 x i8>, ptr addrspace(1) %199, align 2, !invariant.load !4
  %201 = extractelement <2 x i8> %200, i32 0
  %202 = extractelement <2 x i8> %200, i32 1
  %203 = add i32 %196, 1000
  %204 = select i1 %197, i32 -2147482649, i32 %203
  %205 = select i1 %198, i32 1000, i32 %204
  %206 = trunc i8 %201 to i1
  %207 = select i1 %206, i32 %205, i32 -10000
  %208 = tail call i32 @llvm.smax.i32(i32 %183, i32 %207)
  %209 = tail call i32 @llvm.smax.i32(i32 %187, i32 0)
  %210 = tail call i32 @llvm.umin.i32(i32 %209, i32 100)
  %211 = mul nuw nsw i32 %210, 20
  %212 = zext nneg i32 %211 to i64
  %213 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %212
  %214 = getelementptr inbounds i8, ptr addrspace(1) %213, i64 20
  %215 = load float, ptr addrspace(1) %214, align 4, !invariant.load !4
  %.inv9 = fcmp ole float %215, 0xC1E0000000000000
  %216 = select i1 %.inv9, float 0xC1E0000000000000, float %215
  %217 = fptosi float %216 to i32
  %218 = fcmp oge float %215, 0x41E0000000000000
  %219 = fcmp uno float %215, 0.000000e+00
  %220 = add i32 %217, 1000
  %221 = select i1 %218, i32 -2147482649, i32 %220
  %222 = select i1 %219, i32 1000, i32 %221
  %223 = trunc i8 %202 to i1
  %224 = select i1 %223, i32 %222, i32 -10000
  %225 = tail call i32 @llvm.smax.i32(i32 %208, i32 %224)
  %226 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 40
  %227 = load <2 x i32>, ptr addrspace(1) %226, align 8, !invariant.load !4
  %228 = extractelement <2 x i32> %227, i32 0
  %229 = extractelement <2 x i32> %227, i32 1
  %230 = tail call i32 @llvm.smax.i32(i32 %228, i32 0)
  %231 = tail call i32 @llvm.umin.i32(i32 %230, i32 100)
  %232 = mul nuw nsw i32 %231, 20
  %233 = zext nneg i32 %232 to i64
  %234 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %233
  %235 = getelementptr inbounds i8, ptr addrspace(1) %234, i64 20
  %236 = load float, ptr addrspace(1) %235, align 4, !invariant.load !4
  %.inv10 = fcmp ole float %236, 0xC1E0000000000000
  %237 = select i1 %.inv10, float 0xC1E0000000000000, float %236
  %238 = fptosi float %237 to i32
  %239 = fcmp oge float %236, 0x41E0000000000000
  %240 = fcmp uno float %236, 0.000000e+00
  %241 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 10
  %242 = load <2 x i8>, ptr addrspace(1) %241, align 2, !invariant.load !4
  %243 = extractelement <2 x i8> %242, i32 0
  %244 = extractelement <2 x i8> %242, i32 1
  %245 = add i32 %238, 1000
  %246 = select i1 %239, i32 -2147482649, i32 %245
  %247 = select i1 %240, i32 1000, i32 %246
  %248 = trunc i8 %243 to i1
  %249 = select i1 %248, i32 %247, i32 -10000
  %250 = tail call i32 @llvm.smax.i32(i32 %225, i32 %249)
  %251 = tail call i32 @llvm.smax.i32(i32 %229, i32 0)
  %252 = tail call i32 @llvm.umin.i32(i32 %251, i32 100)
  %253 = mul nuw nsw i32 %252, 20
  %254 = zext nneg i32 %253 to i64
  %255 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %254
  %256 = getelementptr inbounds i8, ptr addrspace(1) %255, i64 20
  %257 = load float, ptr addrspace(1) %256, align 4, !invariant.load !4
  %.inv11 = fcmp ole float %257, 0xC1E0000000000000
  %258 = select i1 %.inv11, float 0xC1E0000000000000, float %257
  %259 = fptosi float %258 to i32
  %260 = fcmp oge float %257, 0x41E0000000000000
  %261 = fcmp uno float %257, 0.000000e+00
  %262 = add i32 %259, 1000
  %263 = select i1 %260, i32 -2147482649, i32 %262
  %264 = select i1 %261, i32 1000, i32 %263
  %265 = trunc i8 %244 to i1
  %266 = select i1 %265, i32 %264, i32 -10000
  %267 = tail call i32 @llvm.smax.i32(i32 %250, i32 %266)
  %268 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 48
  %269 = load <2 x i32>, ptr addrspace(1) %268, align 8, !invariant.load !4
  %270 = extractelement <2 x i32> %269, i32 0
  %271 = extractelement <2 x i32> %269, i32 1
  %272 = tail call i32 @llvm.smax.i32(i32 %270, i32 0)
  %273 = tail call i32 @llvm.umin.i32(i32 %272, i32 100)
  %274 = mul nuw nsw i32 %273, 20
  %275 = zext nneg i32 %274 to i64
  %276 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %275
  %277 = getelementptr inbounds i8, ptr addrspace(1) %276, i64 20
  %278 = load float, ptr addrspace(1) %277, align 4, !invariant.load !4
  %.inv12 = fcmp ole float %278, 0xC1E0000000000000
  %279 = select i1 %.inv12, float 0xC1E0000000000000, float %278
  %280 = fptosi float %279 to i32
  %281 = fcmp oge float %278, 0x41E0000000000000
  %282 = fcmp uno float %278, 0.000000e+00
  %283 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 12
  %284 = load <2 x i8>, ptr addrspace(1) %283, align 2, !invariant.load !4
  %285 = extractelement <2 x i8> %284, i32 0
  %286 = extractelement <2 x i8> %284, i32 1
  %287 = add i32 %280, 1000
  %288 = select i1 %281, i32 -2147482649, i32 %287
  %289 = select i1 %282, i32 1000, i32 %288
  %290 = trunc i8 %285 to i1
  %291 = select i1 %290, i32 %289, i32 -10000
  %292 = tail call i32 @llvm.smax.i32(i32 %267, i32 %291)
  %293 = tail call i32 @llvm.smax.i32(i32 %271, i32 0)
  %294 = tail call i32 @llvm.umin.i32(i32 %293, i32 100)
  %295 = mul nuw nsw i32 %294, 20
  %296 = zext nneg i32 %295 to i64
  %297 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %296
  %298 = getelementptr inbounds i8, ptr addrspace(1) %297, i64 20
  %299 = load float, ptr addrspace(1) %298, align 4, !invariant.load !4
  %.inv13 = fcmp ole float %299, 0xC1E0000000000000
  %300 = select i1 %.inv13, float 0xC1E0000000000000, float %299
  %301 = fptosi float %300 to i32
  %302 = fcmp oge float %299, 0x41E0000000000000
  %303 = fcmp uno float %299, 0.000000e+00
  %304 = add i32 %301, 1000
  %305 = select i1 %302, i32 -2147482649, i32 %304
  %306 = select i1 %303, i32 1000, i32 %305
  %307 = trunc i8 %286 to i1
  %308 = select i1 %307, i32 %306, i32 -10000
  %309 = tail call i32 @llvm.smax.i32(i32 %292, i32 %308)
  %310 = icmp sgt i32 %309, -10000
  %311 = zext nneg i32 %12 to i64
  %312 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %311
  %313 = load i32, ptr addrspace(1) %312, align 4
  %314 = select i1 %310, i32 %313, i32 -1
  store i32 %314, ptr addrspace(1) %312, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @loop_slice_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(16384) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(32768) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(32768) %3) local_unnamed_addr #4 {
  %5 = addrspacecast ptr %0 to ptr addrspace(1)
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %11 = shl nuw nsw i32 %9, 7
  %12 = and i32 %11, 3968
  %13 = or disjoint i32 %12, %10
  %.not.not = icmp samesign ult i32 %9, 32
  %14 = zext nneg i32 %13 to i64
  br i1 %.not.not, label %15, label %171

15:                                               ; preds = %4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !134)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !137)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !139)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !142)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !144)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !147)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !149)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !152)
  %16 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %14
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !4, !alias.scope !154, !noalias !157
  %18 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %14
  %19 = load i32, ptr addrspace(1) %18, align 4, !invariant.load !4, !alias.scope !158, !noalias !161
  %20 = add i32 %19, %17
  %21 = tail call i32 @llvm.fshl.i32(i32 %19, i32 %19, i32 13)
  %22 = xor i32 %20, %21
  %23 = add i32 %22, %20
  %24 = tail call i32 @llvm.fshl.i32(i32 %22, i32 %22, i32 15)
  %25 = xor i32 %23, %24
  %26 = add i32 %25, %23
  %27 = tail call i32 @llvm.fshl.i32(i32 %25, i32 %25, i32 26)
  %28 = xor i32 %26, %27
  %29 = add i32 %28, %26
  %30 = add i32 %29, %19
  %31 = tail call i32 @llvm.fshl.i32(i32 %28, i32 %28, i32 6)
  %32 = xor i32 %29, %31
  %33 = xor i32 %17, %19
  %34 = xor i32 %33, 466688986
  %35 = add i32 %34, 1
  %36 = add i32 %35, %32
  %37 = add i32 %30, %36
  %38 = tail call i32 @llvm.fshl.i32(i32 %36, i32 %36, i32 17)
  %39 = xor i32 %37, %38
  %40 = add i32 %39, %37
  %41 = tail call i32 @llvm.fshl.i32(i32 %39, i32 %39, i32 29)
  %42 = xor i32 %40, %41
  %43 = add i32 %42, %40
  %44 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %42, i32 16)
  %45 = xor i32 %43, %44
  %46 = add i32 %45, %43
  %47 = add i32 %46, %34
  %48 = tail call i32 @llvm.fshl.i32(i32 %45, i32 %45, i32 24)
  %49 = xor i32 %46, %48
  %50 = add i32 %17, 2
  %51 = add i32 %50, %49
  %52 = add i32 %47, %51
  %53 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 13)
  %54 = xor i32 %52, %53
  %55 = add i32 %54, %52
  %56 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %54, i32 15)
  %57 = xor i32 %55, %56
  %58 = add i32 %57, %55
  %59 = tail call i32 @llvm.fshl.i32(i32 %57, i32 %57, i32 26)
  %60 = xor i32 %58, %59
  %61 = add i32 %60, %58
  %62 = add i32 %61, %17
  %63 = tail call i32 @llvm.fshl.i32(i32 %60, i32 %60, i32 6)
  %64 = xor i32 %61, %63
  %65 = add i32 %19, 3
  %66 = add i32 %65, %64
  %67 = add i32 %62, %66
  %68 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 17)
  %69 = xor i32 %67, %68
  %70 = add i32 %69, %67
  %71 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 29)
  %72 = xor i32 %70, %71
  %73 = add i32 %72, %70
  %74 = tail call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 16)
  %75 = xor i32 %73, %74
  %76 = add i32 %75, %73
  %77 = add i32 %76, %19
  %78 = tail call i32 @llvm.fshl.i32(i32 %75, i32 %75, i32 24)
  %79 = xor i32 %76, %78
  %80 = add i32 %34, 4
  %81 = add i32 %80, %79
  %82 = add i32 %77, %81
  %83 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 13)
  %84 = xor i32 %82, %83
  %85 = add i32 %84, %82
  %86 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 15)
  %87 = xor i32 %85, %86
  %88 = add i32 %87, %85
  %89 = tail call i32 @llvm.fshl.i32(i32 %87, i32 %87, i32 26)
  %90 = xor i32 %88, %89
  %91 = add i32 %90, %88
  %92 = add i32 %91, %34
  %93 = tail call i32 @llvm.fshl.i32(i32 %90, i32 %90, i32 6)
  %94 = xor i32 %91, %93
  %95 = add i32 %17, 5
  %96 = add i32 %95, %94
  %97 = add i32 %96, 1
  %98 = add i32 %97, %92
  %99 = tail call i32 @llvm.fshl.i32(i32 %97, i32 %97, i32 13)
  %100 = xor i32 %98, %99
  %101 = add i32 %100, %98
  %102 = tail call i32 @llvm.fshl.i32(i32 %100, i32 %100, i32 15)
  %103 = xor i32 %101, %102
  %104 = add i32 %103, %101
  %105 = tail call i32 @llvm.fshl.i32(i32 %103, i32 %103, i32 26)
  %106 = xor i32 %104, %105
  %107 = add i32 %106, %104
  %108 = add i32 %107, %96
  %109 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %106, i32 6)
  %110 = xor i32 %107, %109
  %111 = xor i32 %92, %96
  %112 = xor i32 %111, 466688986
  %113 = add i32 %112, 1
  %114 = add i32 %113, %110
  %115 = add i32 %108, %114
  %116 = tail call i32 @llvm.fshl.i32(i32 %114, i32 %114, i32 17)
  %117 = xor i32 %115, %116
  %118 = add i32 %117, %115
  %119 = tail call i32 @llvm.fshl.i32(i32 %117, i32 %117, i32 29)
  %120 = xor i32 %118, %119
  %121 = add i32 %120, %118
  %122 = tail call i32 @llvm.fshl.i32(i32 %120, i32 %120, i32 16)
  %123 = xor i32 %121, %122
  %124 = add i32 %123, %121
  %125 = add i32 %124, %112
  %126 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %123, i32 24)
  %127 = xor i32 %124, %126
  %128 = add i32 %92, 2
  %129 = add i32 %128, %127
  %130 = add i32 %125, %129
  %131 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 13)
  %132 = xor i32 %130, %131
  %133 = add i32 %132, %130
  %134 = tail call i32 @llvm.fshl.i32(i32 %132, i32 %132, i32 15)
  %135 = xor i32 %133, %134
  %136 = add i32 %135, %133
  %137 = tail call i32 @llvm.fshl.i32(i32 %135, i32 %135, i32 26)
  %138 = xor i32 %136, %137
  %139 = add i32 %138, %136
  %140 = add i32 %139, %92
  %141 = tail call i32 @llvm.fshl.i32(i32 %138, i32 %138, i32 6)
  %142 = xor i32 %139, %141
  %143 = add i32 %96, 3
  %144 = add i32 %143, %142
  %145 = add i32 %140, %144
  %146 = tail call i32 @llvm.fshl.i32(i32 %144, i32 %144, i32 17)
  %147 = xor i32 %145, %146
  %148 = add i32 %147, %145
  %149 = tail call i32 @llvm.fshl.i32(i32 %147, i32 %147, i32 29)
  %150 = xor i32 %148, %149
  %151 = add i32 %150, %148
  %152 = tail call i32 @llvm.fshl.i32(i32 %150, i32 %150, i32 16)
  %153 = xor i32 %151, %152
  %154 = add i32 %153, %151
  %155 = add i32 %154, %96
  %156 = tail call i32 @llvm.fshl.i32(i32 %153, i32 %153, i32 24)
  %157 = xor i32 %154, %156
  %158 = add i32 %112, 4
  %159 = add i32 %158, %157
  %160 = add i32 %155, %159
  %161 = tail call i32 @llvm.fshl.i32(i32 %159, i32 %159, i32 13)
  %162 = xor i32 %160, %161
  %163 = add i32 %162, %160
  %164 = tail call i32 @llvm.fshl.i32(i32 %162, i32 %162, i32 15)
  %165 = xor i32 %163, %164
  %166 = add i32 %165, %163
  %167 = tail call i32 @llvm.fshl.i32(i32 %165, i32 %165, i32 26)
  %168 = xor i32 %166, %167
  %169 = add i32 %166, %112
  %170 = add i32 %169, %168
  br label %330

171:                                              ; preds = %4
  tail call void @llvm.experimental.noalias.scope.decl(metadata !162)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !165)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !167)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !170)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !172)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !175)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !177)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !180)
  %172 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %14
  %173 = load i32, ptr addrspace(1) %172, align 4, !invariant.load !4, !alias.scope !182, !noalias !185
  %174 = tail call i32 @llvm.fshl.i32(i32 %173, i32 %173, i32 13)
  %175 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %14
  %176 = load i32, ptr addrspace(1) %175, align 4, !invariant.load !4, !alias.scope !186, !noalias !189
  %177 = add i32 %176, %173
  %178 = xor i32 %177, %174
  %179 = tail call i32 @llvm.fshl.i32(i32 %178, i32 %178, i32 15)
  %180 = add i32 %178, %177
  %181 = xor i32 %180, %179
  %182 = tail call i32 @llvm.fshl.i32(i32 %181, i32 %181, i32 26)
  %183 = add i32 %181, %180
  %184 = xor i32 %183, %182
  %185 = tail call i32 @llvm.fshl.i32(i32 %184, i32 %184, i32 6)
  %186 = add i32 %184, %183
  %187 = xor i32 %186, %185
  %188 = xor i32 %173, %176
  %189 = xor i32 %188, 466688986
  %190 = add i32 %189, 1
  %191 = add i32 %190, %187
  %192 = tail call i32 @llvm.fshl.i32(i32 %191, i32 %191, i32 17)
  %193 = add i32 %186, %173
  %194 = add i32 %193, %191
  %195 = xor i32 %194, %192
  %196 = tail call i32 @llvm.fshl.i32(i32 %195, i32 %195, i32 29)
  %197 = add i32 %195, %194
  %198 = xor i32 %197, %196
  %199 = tail call i32 @llvm.fshl.i32(i32 %198, i32 %198, i32 16)
  %200 = add i32 %198, %197
  %201 = xor i32 %200, %199
  %202 = tail call i32 @llvm.fshl.i32(i32 %201, i32 %201, i32 24)
  %203 = add i32 %201, %200
  %204 = xor i32 %203, %202
  %205 = add i32 %176, 2
  %206 = add i32 %205, %204
  %207 = tail call i32 @llvm.fshl.i32(i32 %206, i32 %206, i32 13)
  %208 = add i32 %203, %189
  %209 = add i32 %208, %206
  %210 = xor i32 %209, %207
  %211 = tail call i32 @llvm.fshl.i32(i32 %210, i32 %210, i32 15)
  %212 = add i32 %210, %209
  %213 = xor i32 %212, %211
  %214 = tail call i32 @llvm.fshl.i32(i32 %213, i32 %213, i32 26)
  %215 = add i32 %213, %212
  %216 = xor i32 %215, %214
  %217 = tail call i32 @llvm.fshl.i32(i32 %216, i32 %216, i32 6)
  %218 = add i32 %216, %215
  %219 = xor i32 %218, %217
  %220 = add i32 %173, 3
  %221 = add i32 %220, %219
  %222 = tail call i32 @llvm.fshl.i32(i32 %221, i32 %221, i32 17)
  %223 = add i32 %218, %176
  %224 = add i32 %223, %221
  %225 = xor i32 %224, %222
  %226 = tail call i32 @llvm.fshl.i32(i32 %225, i32 %225, i32 29)
  %227 = add i32 %225, %224
  %228 = xor i32 %227, %226
  %229 = tail call i32 @llvm.fshl.i32(i32 %228, i32 %228, i32 16)
  %230 = add i32 %228, %227
  %231 = xor i32 %230, %229
  %232 = tail call i32 @llvm.fshl.i32(i32 %231, i32 %231, i32 24)
  %233 = add i32 %231, %230
  %234 = xor i32 %233, %232
  %235 = add i32 %189, 4
  %236 = add i32 %235, %234
  %237 = tail call i32 @llvm.fshl.i32(i32 %236, i32 %236, i32 13)
  %238 = add i32 %233, %173
  %239 = add i32 %238, %236
  %240 = xor i32 %239, %237
  %241 = tail call i32 @llvm.fshl.i32(i32 %240, i32 %240, i32 15)
  %242 = add i32 %240, %239
  %243 = xor i32 %242, %241
  %244 = tail call i32 @llvm.fshl.i32(i32 %243, i32 %243, i32 26)
  %245 = add i32 %243, %242
  %246 = xor i32 %245, %244
  %247 = tail call i32 @llvm.fshl.i32(i32 %246, i32 %246, i32 6)
  %248 = add i32 %246, %245
  %249 = xor i32 %248, %247
  %250 = add i32 %176, 5
  %251 = add i32 %250, %249
  %252 = add i32 %251, 1
  %253 = tail call i32 @llvm.fshl.i32(i32 %252, i32 %252, i32 13)
  %254 = add i32 %248, %189
  %255 = add i32 %252, %254
  %256 = xor i32 %255, %253
  %257 = tail call i32 @llvm.fshl.i32(i32 %256, i32 %256, i32 15)
  %258 = add i32 %256, %255
  %259 = xor i32 %258, %257
  %260 = tail call i32 @llvm.fshl.i32(i32 %259, i32 %259, i32 26)
  %261 = add i32 %259, %258
  %262 = xor i32 %261, %260
  %263 = tail call i32 @llvm.fshl.i32(i32 %262, i32 %262, i32 6)
  %264 = add i32 %262, %261
  %265 = xor i32 %264, %263
  %266 = xor i32 %254, %251
  %267 = xor i32 %266, 466688986
  %268 = add i32 %267, 1
  %269 = add i32 %268, %265
  %270 = tail call i32 @llvm.fshl.i32(i32 %269, i32 %269, i32 17)
  %271 = add i32 %264, %251
  %272 = add i32 %271, %269
  %273 = xor i32 %272, %270
  %274 = tail call i32 @llvm.fshl.i32(i32 %273, i32 %273, i32 29)
  %275 = add i32 %273, %272
  %276 = xor i32 %275, %274
  %277 = tail call i32 @llvm.fshl.i32(i32 %276, i32 %276, i32 16)
  %278 = add i32 %276, %275
  %279 = xor i32 %278, %277
  %280 = tail call i32 @llvm.fshl.i32(i32 %279, i32 %279, i32 24)
  %281 = add i32 %279, %278
  %282 = xor i32 %281, %280
  %283 = add i32 %254, 2
  %284 = add i32 %283, %282
  %285 = tail call i32 @llvm.fshl.i32(i32 %284, i32 %284, i32 13)
  %286 = add i32 %281, %267
  %287 = add i32 %286, %284
  %288 = xor i32 %287, %285
  %289 = tail call i32 @llvm.fshl.i32(i32 %288, i32 %288, i32 15)
  %290 = add i32 %288, %287
  %291 = xor i32 %290, %289
  %292 = tail call i32 @llvm.fshl.i32(i32 %291, i32 %291, i32 26)
  %293 = add i32 %291, %290
  %294 = xor i32 %293, %292
  %295 = tail call i32 @llvm.fshl.i32(i32 %294, i32 %294, i32 6)
  %296 = add i32 %294, %293
  %297 = xor i32 %296, %295
  %298 = add i32 %251, 3
  %299 = add i32 %298, %297
  %300 = tail call i32 @llvm.fshl.i32(i32 %299, i32 %299, i32 17)
  %301 = add i32 %296, %254
  %302 = add i32 %301, %299
  %303 = xor i32 %302, %300
  %304 = tail call i32 @llvm.fshl.i32(i32 %303, i32 %303, i32 29)
  %305 = add i32 %303, %302
  %306 = xor i32 %305, %304
  %307 = tail call i32 @llvm.fshl.i32(i32 %306, i32 %306, i32 16)
  %308 = add i32 %306, %305
  %309 = xor i32 %308, %307
  %310 = tail call i32 @llvm.fshl.i32(i32 %309, i32 %309, i32 24)
  %311 = add i32 %309, %308
  %312 = xor i32 %311, %310
  %313 = add i32 %267, 4
  %314 = add i32 %313, %312
  %315 = tail call i32 @llvm.fshl.i32(i32 %314, i32 %314, i32 13)
  %316 = add i32 %311, %251
  %317 = add i32 %316, %314
  %318 = xor i32 %317, %315
  %319 = tail call i32 @llvm.fshl.i32(i32 %318, i32 %318, i32 15)
  %320 = add i32 %318, %317
  %321 = xor i32 %320, %319
  %322 = tail call i32 @llvm.fshl.i32(i32 %321, i32 %321, i32 26)
  %323 = add i32 %321, %320
  %324 = xor i32 %323, %322
  %325 = tail call i32 @llvm.fshl.i32(i32 %324, i32 %324, i32 6)
  %326 = add i32 %324, %323
  %327 = xor i32 %326, %325
  %328 = add i32 %254, 5
  %329 = add i32 %328, %327
  br label %330

330:                                              ; preds = %171, %15
  %331 = phi i32 [ %329, %171 ], [ %170, %15 ]
  %332 = shl nuw nsw i32 %9, 6
  %333 = lshr i32 %10, 1
  %334 = or disjoint i32 %332, %333
  %335 = and i32 %10, 1
  %.not.not1 = icmp eq i32 %335, 0
  %336 = zext nneg i32 %334 to i64
  br i1 %.not.not1, label %337, label %494

337:                                              ; preds = %330
  tail call void @llvm.experimental.noalias.scope.decl(metadata !190)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !193)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !195)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !198)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !200)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !203)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !205)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !208)
  %338 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %336
  %339 = load i32, ptr addrspace(1) %338, align 4, !invariant.load !4, !alias.scope !210, !noalias !213
  %340 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %336
  %341 = load i32, ptr addrspace(1) %340, align 4, !invariant.load !4, !alias.scope !214, !noalias !217
  %342 = add i32 %341, 1
  %343 = add i32 %342, %339
  %344 = tail call i32 @llvm.fshl.i32(i32 %342, i32 %342, i32 13)
  %345 = xor i32 %343, %344
  %346 = add i32 %345, %343
  %347 = tail call i32 @llvm.fshl.i32(i32 %345, i32 %345, i32 15)
  %348 = xor i32 %346, %347
  %349 = add i32 %348, %346
  %350 = tail call i32 @llvm.fshl.i32(i32 %348, i32 %348, i32 26)
  %351 = xor i32 %349, %350
  %352 = add i32 %351, %349
  %353 = add i32 %352, %341
  %354 = tail call i32 @llvm.fshl.i32(i32 %351, i32 %351, i32 6)
  %355 = xor i32 %352, %354
  %356 = xor i32 %339, %341
  %357 = xor i32 %356, 466688986
  %358 = add i32 %357, 1
  %359 = add i32 %358, %355
  %360 = add i32 %353, %359
  %361 = tail call i32 @llvm.fshl.i32(i32 %359, i32 %359, i32 17)
  %362 = xor i32 %360, %361
  %363 = add i32 %362, %360
  %364 = tail call i32 @llvm.fshl.i32(i32 %362, i32 %362, i32 29)
  %365 = xor i32 %363, %364
  %366 = add i32 %365, %363
  %367 = tail call i32 @llvm.fshl.i32(i32 %365, i32 %365, i32 16)
  %368 = xor i32 %366, %367
  %369 = add i32 %368, %366
  %370 = add i32 %369, %357
  %371 = tail call i32 @llvm.fshl.i32(i32 %368, i32 %368, i32 24)
  %372 = xor i32 %369, %371
  %373 = add i32 %339, 2
  %374 = add i32 %373, %372
  %375 = add i32 %370, %374
  %376 = tail call i32 @llvm.fshl.i32(i32 %374, i32 %374, i32 13)
  %377 = xor i32 %375, %376
  %378 = add i32 %377, %375
  %379 = tail call i32 @llvm.fshl.i32(i32 %377, i32 %377, i32 15)
  %380 = xor i32 %378, %379
  %381 = add i32 %380, %378
  %382 = tail call i32 @llvm.fshl.i32(i32 %380, i32 %380, i32 26)
  %383 = xor i32 %381, %382
  %384 = add i32 %383, %381
  %385 = add i32 %384, %339
  %386 = tail call i32 @llvm.fshl.i32(i32 %383, i32 %383, i32 6)
  %387 = xor i32 %384, %386
  %388 = add i32 %341, 3
  %389 = add i32 %388, %387
  %390 = add i32 %385, %389
  %391 = tail call i32 @llvm.fshl.i32(i32 %389, i32 %389, i32 17)
  %392 = xor i32 %390, %391
  %393 = add i32 %392, %390
  %394 = tail call i32 @llvm.fshl.i32(i32 %392, i32 %392, i32 29)
  %395 = xor i32 %393, %394
  %396 = add i32 %395, %393
  %397 = tail call i32 @llvm.fshl.i32(i32 %395, i32 %395, i32 16)
  %398 = xor i32 %396, %397
  %399 = add i32 %398, %396
  %400 = add i32 %399, %341
  %401 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 24)
  %402 = xor i32 %399, %401
  %403 = add i32 %357, 4
  %404 = add i32 %403, %402
  %405 = add i32 %400, %404
  %406 = tail call i32 @llvm.fshl.i32(i32 %404, i32 %404, i32 13)
  %407 = xor i32 %405, %406
  %408 = add i32 %407, %405
  %409 = tail call i32 @llvm.fshl.i32(i32 %407, i32 %407, i32 15)
  %410 = xor i32 %408, %409
  %411 = add i32 %410, %408
  %412 = tail call i32 @llvm.fshl.i32(i32 %410, i32 %410, i32 26)
  %413 = xor i32 %411, %412
  %414 = add i32 %413, %411
  %415 = add i32 %414, %357
  %416 = tail call i32 @llvm.fshl.i32(i32 %413, i32 %413, i32 6)
  %417 = xor i32 %414, %416
  %418 = add i32 %339, 5
  %419 = add i32 %418, %417
  %420 = add i32 %419, 1
  %421 = add i32 %420, %415
  %422 = tail call i32 @llvm.fshl.i32(i32 %420, i32 %420, i32 13)
  %423 = xor i32 %421, %422
  %424 = add i32 %423, %421
  %425 = tail call i32 @llvm.fshl.i32(i32 %423, i32 %423, i32 15)
  %426 = xor i32 %424, %425
  %427 = add i32 %426, %424
  %428 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 26)
  %429 = xor i32 %427, %428
  %430 = add i32 %429, %427
  %431 = add i32 %430, %419
  %432 = tail call i32 @llvm.fshl.i32(i32 %429, i32 %429, i32 6)
  %433 = xor i32 %430, %432
  %434 = xor i32 %415, %419
  %435 = xor i32 %434, 466688986
  %436 = add i32 %435, 1
  %437 = add i32 %436, %433
  %438 = add i32 %431, %437
  %439 = tail call i32 @llvm.fshl.i32(i32 %437, i32 %437, i32 17)
  %440 = xor i32 %438, %439
  %441 = add i32 %440, %438
  %442 = tail call i32 @llvm.fshl.i32(i32 %440, i32 %440, i32 29)
  %443 = xor i32 %441, %442
  %444 = add i32 %443, %441
  %445 = tail call i32 @llvm.fshl.i32(i32 %443, i32 %443, i32 16)
  %446 = xor i32 %444, %445
  %447 = add i32 %446, %444
  %448 = add i32 %447, %435
  %449 = tail call i32 @llvm.fshl.i32(i32 %446, i32 %446, i32 24)
  %450 = xor i32 %447, %449
  %451 = add i32 %415, 2
  %452 = add i32 %451, %450
  %453 = add i32 %448, %452
  %454 = tail call i32 @llvm.fshl.i32(i32 %452, i32 %452, i32 13)
  %455 = xor i32 %453, %454
  %456 = add i32 %455, %453
  %457 = tail call i32 @llvm.fshl.i32(i32 %455, i32 %455, i32 15)
  %458 = xor i32 %456, %457
  %459 = add i32 %458, %456
  %460 = tail call i32 @llvm.fshl.i32(i32 %458, i32 %458, i32 26)
  %461 = xor i32 %459, %460
  %462 = add i32 %461, %459
  %463 = add i32 %462, %415
  %464 = tail call i32 @llvm.fshl.i32(i32 %461, i32 %461, i32 6)
  %465 = xor i32 %462, %464
  %466 = add i32 %419, 3
  %467 = add i32 %466, %465
  %468 = add i32 %463, %467
  %469 = tail call i32 @llvm.fshl.i32(i32 %467, i32 %467, i32 17)
  %470 = xor i32 %468, %469
  %471 = add i32 %470, %468
  %472 = tail call i32 @llvm.fshl.i32(i32 %470, i32 %470, i32 29)
  %473 = xor i32 %471, %472
  %474 = add i32 %473, %471
  %475 = tail call i32 @llvm.fshl.i32(i32 %473, i32 %473, i32 16)
  %476 = xor i32 %474, %475
  %477 = add i32 %476, %474
  %478 = add i32 %477, %419
  %479 = tail call i32 @llvm.fshl.i32(i32 %476, i32 %476, i32 24)
  %480 = xor i32 %477, %479
  %481 = add i32 %435, 4
  %482 = add i32 %481, %480
  %483 = add i32 %478, %482
  %484 = tail call i32 @llvm.fshl.i32(i32 %482, i32 %482, i32 13)
  %485 = xor i32 %483, %484
  %486 = add i32 %485, %483
  %487 = tail call i32 @llvm.fshl.i32(i32 %485, i32 %485, i32 15)
  %488 = xor i32 %486, %487
  %489 = add i32 %488, %486
  %490 = tail call i32 @llvm.fshl.i32(i32 %488, i32 %488, i32 26)
  %491 = xor i32 %489, %490
  %492 = add i32 %489, %435
  %493 = add i32 %492, %491
  br label %654

494:                                              ; preds = %330
  tail call void @llvm.experimental.noalias.scope.decl(metadata !218)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !221)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !223)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !226)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !228)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !231)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !233)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !236)
  %495 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %336
  %496 = load i32, ptr addrspace(1) %495, align 4, !invariant.load !4, !alias.scope !238, !noalias !241
  %497 = add i32 %496, 1
  %498 = tail call i32 @llvm.fshl.i32(i32 %497, i32 %497, i32 13)
  %499 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %336
  %500 = load i32, ptr addrspace(1) %499, align 4, !invariant.load !4, !alias.scope !242, !noalias !245
  %501 = add i32 %500, %497
  %502 = xor i32 %501, %498
  %503 = tail call i32 @llvm.fshl.i32(i32 %502, i32 %502, i32 15)
  %504 = add i32 %502, %501
  %505 = xor i32 %504, %503
  %506 = tail call i32 @llvm.fshl.i32(i32 %505, i32 %505, i32 26)
  %507 = add i32 %505, %504
  %508 = xor i32 %507, %506
  %509 = tail call i32 @llvm.fshl.i32(i32 %508, i32 %508, i32 6)
  %510 = add i32 %508, %507
  %511 = xor i32 %510, %509
  %512 = xor i32 %496, %500
  %513 = xor i32 %512, 466688986
  %514 = add i32 %513, 1
  %515 = add i32 %514, %511
  %516 = tail call i32 @llvm.fshl.i32(i32 %515, i32 %515, i32 17)
  %517 = add i32 %510, %496
  %518 = add i32 %517, %515
  %519 = xor i32 %518, %516
  %520 = tail call i32 @llvm.fshl.i32(i32 %519, i32 %519, i32 29)
  %521 = add i32 %519, %518
  %522 = xor i32 %521, %520
  %523 = tail call i32 @llvm.fshl.i32(i32 %522, i32 %522, i32 16)
  %524 = add i32 %522, %521
  %525 = xor i32 %524, %523
  %526 = tail call i32 @llvm.fshl.i32(i32 %525, i32 %525, i32 24)
  %527 = add i32 %525, %524
  %528 = xor i32 %527, %526
  %529 = add i32 %500, 2
  %530 = add i32 %529, %528
  %531 = tail call i32 @llvm.fshl.i32(i32 %530, i32 %530, i32 13)
  %532 = add i32 %527, %513
  %533 = add i32 %532, %530
  %534 = xor i32 %533, %531
  %535 = tail call i32 @llvm.fshl.i32(i32 %534, i32 %534, i32 15)
  %536 = add i32 %534, %533
  %537 = xor i32 %536, %535
  %538 = tail call i32 @llvm.fshl.i32(i32 %537, i32 %537, i32 26)
  %539 = add i32 %537, %536
  %540 = xor i32 %539, %538
  %541 = tail call i32 @llvm.fshl.i32(i32 %540, i32 %540, i32 6)
  %542 = add i32 %540, %539
  %543 = xor i32 %542, %541
  %544 = add i32 %496, 3
  %545 = add i32 %544, %543
  %546 = tail call i32 @llvm.fshl.i32(i32 %545, i32 %545, i32 17)
  %547 = add i32 %542, %500
  %548 = add i32 %547, %545
  %549 = xor i32 %548, %546
  %550 = tail call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 29)
  %551 = add i32 %549, %548
  %552 = xor i32 %551, %550
  %553 = tail call i32 @llvm.fshl.i32(i32 %552, i32 %552, i32 16)
  %554 = add i32 %552, %551
  %555 = xor i32 %554, %553
  %556 = tail call i32 @llvm.fshl.i32(i32 %555, i32 %555, i32 24)
  %557 = add i32 %555, %554
  %558 = xor i32 %557, %556
  %559 = add i32 %513, 4
  %560 = add i32 %559, %558
  %561 = tail call i32 @llvm.fshl.i32(i32 %560, i32 %560, i32 13)
  %562 = add i32 %557, %496
  %563 = add i32 %562, %560
  %564 = xor i32 %563, %561
  %565 = tail call i32 @llvm.fshl.i32(i32 %564, i32 %564, i32 15)
  %566 = add i32 %564, %563
  %567 = xor i32 %566, %565
  %568 = tail call i32 @llvm.fshl.i32(i32 %567, i32 %567, i32 26)
  %569 = add i32 %567, %566
  %570 = xor i32 %569, %568
  %571 = tail call i32 @llvm.fshl.i32(i32 %570, i32 %570, i32 6)
  %572 = add i32 %570, %569
  %573 = xor i32 %572, %571
  %574 = add i32 %500, 5
  %575 = add i32 %574, %573
  %576 = add i32 %575, 1
  %577 = tail call i32 @llvm.fshl.i32(i32 %576, i32 %576, i32 13)
  %578 = add i32 %572, %513
  %579 = add i32 %576, %578
  %580 = xor i32 %579, %577
  %581 = tail call i32 @llvm.fshl.i32(i32 %580, i32 %580, i32 15)
  %582 = add i32 %580, %579
  %583 = xor i32 %582, %581
  %584 = tail call i32 @llvm.fshl.i32(i32 %583, i32 %583, i32 26)
  %585 = add i32 %583, %582
  %586 = xor i32 %585, %584
  %587 = tail call i32 @llvm.fshl.i32(i32 %586, i32 %586, i32 6)
  %588 = add i32 %586, %585
  %589 = xor i32 %588, %587
  %590 = xor i32 %578, %575
  %591 = xor i32 %590, 466688986
  %592 = add i32 %591, 1
  %593 = add i32 %592, %589
  %594 = tail call i32 @llvm.fshl.i32(i32 %593, i32 %593, i32 17)
  %595 = add i32 %588, %575
  %596 = add i32 %595, %593
  %597 = xor i32 %596, %594
  %598 = tail call i32 @llvm.fshl.i32(i32 %597, i32 %597, i32 29)
  %599 = add i32 %597, %596
  %600 = xor i32 %599, %598
  %601 = tail call i32 @llvm.fshl.i32(i32 %600, i32 %600, i32 16)
  %602 = add i32 %600, %599
  %603 = xor i32 %602, %601
  %604 = tail call i32 @llvm.fshl.i32(i32 %603, i32 %603, i32 24)
  %605 = add i32 %603, %602
  %606 = xor i32 %605, %604
  %607 = add i32 %578, 2
  %608 = add i32 %607, %606
  %609 = tail call i32 @llvm.fshl.i32(i32 %608, i32 %608, i32 13)
  %610 = add i32 %605, %591
  %611 = add i32 %610, %608
  %612 = xor i32 %611, %609
  %613 = tail call i32 @llvm.fshl.i32(i32 %612, i32 %612, i32 15)
  %614 = add i32 %612, %611
  %615 = xor i32 %614, %613
  %616 = tail call i32 @llvm.fshl.i32(i32 %615, i32 %615, i32 26)
  %617 = add i32 %615, %614
  %618 = xor i32 %617, %616
  %619 = tail call i32 @llvm.fshl.i32(i32 %618, i32 %618, i32 6)
  %620 = add i32 %618, %617
  %621 = xor i32 %620, %619
  %622 = add i32 %575, 3
  %623 = add i32 %622, %621
  %624 = tail call i32 @llvm.fshl.i32(i32 %623, i32 %623, i32 17)
  %625 = add i32 %620, %578
  %626 = add i32 %625, %623
  %627 = xor i32 %626, %624
  %628 = tail call i32 @llvm.fshl.i32(i32 %627, i32 %627, i32 29)
  %629 = add i32 %627, %626
  %630 = xor i32 %629, %628
  %631 = tail call i32 @llvm.fshl.i32(i32 %630, i32 %630, i32 16)
  %632 = add i32 %630, %629
  %633 = xor i32 %632, %631
  %634 = tail call i32 @llvm.fshl.i32(i32 %633, i32 %633, i32 24)
  %635 = add i32 %633, %632
  %636 = xor i32 %635, %634
  %637 = add i32 %591, 4
  %638 = add i32 %637, %636
  %639 = tail call i32 @llvm.fshl.i32(i32 %638, i32 %638, i32 13)
  %640 = add i32 %635, %575
  %641 = add i32 %640, %638
  %642 = xor i32 %641, %639
  %643 = tail call i32 @llvm.fshl.i32(i32 %642, i32 %642, i32 15)
  %644 = add i32 %642, %641
  %645 = xor i32 %644, %643
  %646 = tail call i32 @llvm.fshl.i32(i32 %645, i32 %645, i32 26)
  %647 = add i32 %645, %644
  %648 = xor i32 %647, %646
  %649 = tail call i32 @llvm.fshl.i32(i32 %648, i32 %648, i32 6)
  %650 = add i32 %648, %647
  %651 = xor i32 %650, %649
  %652 = add i32 %578, 5
  %653 = add i32 %652, %651
  br label %654

654:                                              ; preds = %494, %337
  %655 = phi i32 [ %653, %494 ], [ %493, %337 ]
  %656 = or disjoint i32 %11, %10
  %657 = zext nneg i32 %656 to i64
  %658 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %657
  store i32 %331, ptr addrspace(1) %658, align 4
  %659 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %657
  store i32 %655, ptr addrspace(1) %659, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_xor_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(32768) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(180224) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !246
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = shl nuw nsw i32 %5, 7
  %8 = or disjoint i32 %7, %6
  %9 = udiv i32 %8, 11
  %10 = mul i32 %9, 11
  %.decomposed = sub i32 %8, %10
  %11 = zext nneg i32 %9 to i64
  %12 = getelementptr inbounds i32, ptr addrspace(1) %3, i64 %11
  %13 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 16384
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
define ptx_kernel void @wrapped_iota_1(ptr noalias writeonly align 256 captures(none) dereferenceable(180224) %0) local_unnamed_addr #5 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !246
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
define ptx_kernel void @sort_4_0(ptr noalias align 256 captures(none) dereferenceable(180224) %arg0, ptr noalias align 256 captures(none) dereferenceable(180224) %arg1, ptr noalias align 256 captures(none) dereferenceable(180224) %arg2) local_unnamed_addr #6 {
entry:
  %0 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !247
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !248
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
  %38 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %0, i64 0, i64 %6, i64 %8
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
  %46 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %47 = load i32, ptr addrspace(1) %46, align 4
  %48 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  %49 = getelementptr i8, ptr addrspace(3) %48, i64 4
  %50 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 4
  %51 = load i32, ptr addrspace(1) %50, align 4
  store i32 %51, ptr addrspace(3) %49, align 4
  br label %smaller_keys_index-true5

smaller_keys_index-true5.critedge:                ; preds = %smaller_keys_index-true
  %52 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %53 = load i32, ptr addrspace(1) %52, align 4
  br label %smaller_keys_index-true5

smaller_keys_index-true5:                         ; preds = %smaller_keys_index-true5.critedge, %inner_smaller_keys_index-true
  %.sink = phi i32 [ %47, %inner_smaller_keys_index-true ], [ %53, %smaller_keys_index-true5.critedge ]
  %54 = icmp ult i64 %41, 11
  %55 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_1", i64 0, i64 %10
  store i32 %.sink, ptr addrspace(3) %55, align 8
  %56 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %2, i64 0, i64 %6, i64 %8
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
  %186 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %0, i64 0, i64 %6, i64 %8
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
  %196 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
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
  %201 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  store i32 %.sink250, ptr addrspace(1) %201, align 4
  %202 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_4_$_0_tile_param_2", i64 0, i64 %10
  %203 = load i32, ptr addrspace(3) %202, align 8
  %204 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %2, i64 0, i64 %6, i64 %8
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
declare void @llvm.nvvm.barrier.cta.sync.aligned.all(i32) #7

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_xor_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(32768) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(180224) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !246
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
define ptx_kernel void @sort_5_0(ptr noalias align 256 captures(none) dereferenceable(180224) %arg0, ptr noalias align 256 captures(none) dereferenceable(180224) %arg1, ptr noalias align 256 captures(none) dereferenceable(180224) %arg2) local_unnamed_addr #6 {
entry:
  %0 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %1 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %2 = addrspacecast ptr %arg2 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !247
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !248
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
  %38 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %0, i64 0, i64 %6, i64 %8
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
  %46 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %47 = load i32, ptr addrspace(1) %46, align 4
  %48 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  %49 = getelementptr i8, ptr addrspace(3) %48, i64 4
  %50 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 4
  %51 = load i32, ptr addrspace(1) %50, align 4
  store i32 %51, ptr addrspace(3) %49, align 4
  br label %smaller_keys_index-true5

smaller_keys_index-true5.critedge:                ; preds = %smaller_keys_index-true
  %52 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  %53 = load i32, ptr addrspace(1) %52, align 4
  br label %smaller_keys_index-true5

smaller_keys_index-true5:                         ; preds = %smaller_keys_index-true5.critedge, %inner_smaller_keys_index-true
  %.sink = phi i32 [ %47, %inner_smaller_keys_index-true ], [ %53, %smaller_keys_index-true5.critedge ]
  %54 = icmp ult i64 %41, 11
  %55 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_1", i64 0, i64 %10
  store i32 %.sink, ptr addrspace(3) %55, align 8
  %56 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %2, i64 0, i64 %6, i64 %8
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
  %186 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %0, i64 0, i64 %6, i64 %8
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
  %196 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
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
  %201 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %1, i64 0, i64 %6, i64 %8
  store i32 %.sink250, ptr addrspace(1) %201, align 4
  %202 = getelementptr [64 x i32], ptr addrspace(3) @"sort_$_5_$_0_tile_param_2", i64 0, i64 %10
  %203 = load i32, ptr addrspace(3) %202, align 8
  %204 = getelementptr inbounds [4096 x [11 x i32]], ptr addrspace(1) %2, i64 0, i64 %6, i64 %8
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
define ptx_kernel void @input_concatenate_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(180224) %0, ptr noalias readonly align 256 captures(none) dereferenceable(180224) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = addrspacecast ptr %2 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !249
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_6(ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %0) local_unnamed_addr #5 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %3, 7
  %6 = or disjoint i32 %5, %4
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds i32, ptr addrspace(1) %2, i64 %7
  store i32 0, ptr addrspace(1) %8, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @loop_and_broadcast_clamp_compare_convert_maximum_select_slice_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(57344) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %5, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %8, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %9, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %10, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %11, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %12, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %13, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %14, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %15, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %16, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %17, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %18, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %19, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %20, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %21, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %22, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %23, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %24, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %25, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %26, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %27, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %28, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %29, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %30, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %31, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %32, ptr noalias writeonly align 256 captures(none) dereferenceable(229376) %33) local_unnamed_addr #4 {
  %35 = addrspacecast ptr %1 to ptr addrspace(1)
  %36 = addrspacecast ptr %2 to ptr addrspace(1)
  %37 = addrspacecast ptr %0 to ptr addrspace(1)
  %38 = addrspacecast ptr %4 to ptr addrspace(1)
  %39 = addrspacecast ptr %3 to ptr addrspace(1)
  %40 = addrspacecast ptr %5 to ptr addrspace(1)
  %41 = addrspacecast ptr %6 to ptr addrspace(1)
  %42 = addrspacecast ptr %7 to ptr addrspace(1)
  %43 = addrspacecast ptr %8 to ptr addrspace(1)
  %44 = addrspacecast ptr %9 to ptr addrspace(1)
  %45 = addrspacecast ptr %10 to ptr addrspace(1)
  %46 = addrspacecast ptr %11 to ptr addrspace(1)
  %47 = addrspacecast ptr %12 to ptr addrspace(1)
  %48 = addrspacecast ptr %13 to ptr addrspace(1)
  %49 = addrspacecast ptr %14 to ptr addrspace(1)
  %50 = addrspacecast ptr %15 to ptr addrspace(1)
  %51 = addrspacecast ptr %16 to ptr addrspace(1)
  %52 = addrspacecast ptr %17 to ptr addrspace(1)
  %53 = addrspacecast ptr %18 to ptr addrspace(1)
  %54 = addrspacecast ptr %19 to ptr addrspace(1)
  %55 = addrspacecast ptr %20 to ptr addrspace(1)
  %56 = addrspacecast ptr %21 to ptr addrspace(1)
  %57 = addrspacecast ptr %22 to ptr addrspace(1)
  %58 = addrspacecast ptr %23 to ptr addrspace(1)
  %59 = addrspacecast ptr %24 to ptr addrspace(1)
  %60 = addrspacecast ptr %25 to ptr addrspace(1)
  %61 = addrspacecast ptr %26 to ptr addrspace(1)
  %62 = addrspacecast ptr %27 to ptr addrspace(1)
  %63 = addrspacecast ptr %28 to ptr addrspace(1)
  %64 = addrspacecast ptr %29 to ptr addrspace(1)
  %65 = addrspacecast ptr %30 to ptr addrspace(1)
  %66 = addrspacecast ptr %31 to ptr addrspace(1)
  %67 = addrspacecast ptr %32 to ptr addrspace(1)
  %68 = addrspacecast ptr %33 to ptr addrspace(1)
  %69 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
  %70 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %71 = shl nuw nsw i32 %69, 7
  %72 = or disjoint i32 %71, %70
  %73 = udiv i32 %72, 14
  %74 = mul i32 %73, 14
  %.decomposed = sub i32 %72, %74
  %75 = icmp samesign ugt i32 %.decomposed, 6
  %76 = zext i1 %75 to i32
  %77 = zext nneg i32 %73 to i64
  %78 = getelementptr inbounds i32, ptr addrspace(1) %35, i64 %77
  %79 = load i32, ptr addrspace(1) %78, align 4, !invariant.load !4
  %80 = getelementptr inbounds i32, ptr addrspace(1) %36, i64 %77
  %81 = load i32, ptr addrspace(1) %80, align 4, !invariant.load !4
  %82 = tail call i32 @llvm.smax.i32(i32 %79, i32 %81)
  %83 = icmp slt i32 %79, 14
  %84 = icmp slt i32 %82, 7
  %85 = select i1 %83, i1 %84, i1 false
  %.not = xor i1 %75, %85
  %86 = zext nneg i32 %72 to i64
  %87 = getelementptr inbounds i8, ptr addrspace(1) %37, i64 %86
  %88 = load i8, ptr addrspace(1) %87, align 1, !invariant.load !4
  %89 = and i8 %88, 1
  %90 = select i1 %.not, i8 0, i8 %89
  tail call void @llvm.experimental.noalias.scope.decl(metadata !250)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !253)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !255)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !257)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !260)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !262)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !265)
  %91 = getelementptr inbounds i32, ptr addrspace(1) %38, i64 %86
  %92 = load i32, ptr addrspace(1) %91, align 4, !invariant.load !4, !alias.scope !267, !noalias !268
  %93 = tail call i32 @llvm.smax.i32(i32 %92, i32 0)
  %94 = tail call i32 @llvm.umin.i32(i32 %93, i32 100)
  %95 = mul nuw nsw i32 %94, 20
  %96 = zext nneg i32 %95 to i64
  %97 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %96
  %98 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 16
  %99 = load <4 x float>, ptr addrspace(1) %98, align 16, !invariant.load !4, !noalias !4
  %100 = extractelement <4 x float> %99, i32 0
  %101 = extractelement <4 x float> %99, i32 1
  %102 = extractelement <4 x float> %99, i32 2
  %103 = extractelement <4 x float> %99, i32 3
  %.inv.i.i = fcmp ole float %101, 0xC1E0000000000000
  %104 = select i1 %.inv.i.i, float 0xC1E0000000000000, float %101
  %105 = fptosi float %104 to i32
  %106 = fcmp oge float %101, 0x41E0000000000000
  %107 = fcmp uno float %101, 0.000000e+00
  %108 = add i32 %105, 1000
  %109 = select i1 %106, i32 -2147482649, i32 %108
  %110 = select i1 %107, i32 1000, i32 %109
  %111 = trunc i8 %88 to i1
  %112 = select i1 %111, i32 %110, i32 -10000
  tail call void @llvm.experimental.noalias.scope.decl(metadata !269)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !272)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !274)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !276)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !279)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !281)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !284)
  %113 = zext nneg i32 %74 to i64
  %114 = getelementptr inbounds i32, ptr addrspace(1) %38, i64 %113
  %115 = load <2 x i32>, ptr addrspace(1) %114, align 8, !invariant.load !4, !noalias !4
  %116 = extractelement <2 x i32> %115, i32 0
  %117 = extractelement <2 x i32> %115, i32 1
  %118 = tail call i32 @llvm.smax.i32(i32 %116, i32 0)
  %119 = tail call i32 @llvm.umin.i32(i32 %118, i32 100)
  %120 = mul nuw nsw i32 %119, 20
  %121 = zext nneg i32 %120 to i64
  %122 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %121
  %123 = getelementptr inbounds i8, ptr addrspace(1) %122, i64 20
  %124 = load float, ptr addrspace(1) %123, align 4, !invariant.load !4, !alias.scope !286, !noalias !287
  %.inv.i.i9 = fcmp ole float %124, 0xC1E0000000000000
  %125 = select i1 %.inv.i.i9, float 0xC1E0000000000000, float %124
  %126 = fptosi float %125 to i32
  %127 = fcmp oge float %124, 0x41E0000000000000
  %128 = fcmp uno float %124, 0.000000e+00
  %129 = add i32 %126, 1000
  %130 = select i1 %127, i32 -2147482649, i32 %129
  %131 = select i1 %128, i32 1000, i32 %130
  %132 = getelementptr inbounds i8, ptr addrspace(1) %37, i64 %113
  %133 = load <2 x i8>, ptr addrspace(1) %132, align 2, !invariant.load !4, !noalias !4
  %134 = extractelement <2 x i8> %133, i32 0
  %135 = extractelement <2 x i8> %133, i32 1
  %136 = trunc i8 %134 to i1
  %137 = select i1 %136, i32 %131, i32 -10000
  %138 = icmp sgt i32 %137, %112
  %139 = zext i1 %138 to i32
  tail call void @llvm.experimental.noalias.scope.decl(metadata !288)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !291)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !293)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !295)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !298)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !300)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !303)
  %140 = tail call i32 @llvm.smax.i32(i32 %117, i32 0)
  %141 = tail call i32 @llvm.umin.i32(i32 %140, i32 100)
  %142 = mul nuw nsw i32 %141, 20
  %143 = zext nneg i32 %142 to i64
  %144 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %143
  %145 = getelementptr inbounds i8, ptr addrspace(1) %144, i64 20
  %146 = load float, ptr addrspace(1) %145, align 4, !invariant.load !4, !alias.scope !305, !noalias !306
  %.inv.i.i10 = fcmp ole float %146, 0xC1E0000000000000
  %147 = select i1 %.inv.i.i10, float 0xC1E0000000000000, float %146
  %148 = fptosi float %147 to i32
  %149 = fcmp oge float %146, 0x41E0000000000000
  %150 = fcmp uno float %146, 0.000000e+00
  %151 = add i32 %148, 1000
  %152 = select i1 %149, i32 -2147482649, i32 %151
  %153 = select i1 %150, i32 1000, i32 %152
  %154 = trunc i8 %135 to i1
  %155 = select i1 %154, i32 %153, i32 -10000
  %156 = icmp sgt i32 %155, %112
  %157 = zext i1 %156 to i32
  %158 = add nuw nsw i32 %157, %139
  tail call void @llvm.experimental.noalias.scope.decl(metadata !307)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !310)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !312)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !314)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !317)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !319)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !322)
  %159 = getelementptr inbounds i8, ptr addrspace(1) %114, i64 8
  %160 = load <2 x i32>, ptr addrspace(1) %159, align 8, !invariant.load !4, !noalias !4
  %161 = extractelement <2 x i32> %160, i32 0
  %162 = extractelement <2 x i32> %160, i32 1
  %163 = tail call i32 @llvm.smax.i32(i32 %161, i32 0)
  %164 = tail call i32 @llvm.umin.i32(i32 %163, i32 100)
  %165 = mul nuw nsw i32 %164, 20
  %166 = zext nneg i32 %165 to i64
  %167 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %166
  %168 = getelementptr inbounds i8, ptr addrspace(1) %167, i64 20
  %169 = load float, ptr addrspace(1) %168, align 4, !invariant.load !4, !alias.scope !324, !noalias !325
  %.inv.i.i11 = fcmp ole float %169, 0xC1E0000000000000
  %170 = select i1 %.inv.i.i11, float 0xC1E0000000000000, float %169
  %171 = fptosi float %170 to i32
  %172 = fcmp oge float %169, 0x41E0000000000000
  %173 = fcmp uno float %169, 0.000000e+00
  %174 = add i32 %171, 1000
  %175 = select i1 %172, i32 -2147482649, i32 %174
  %176 = select i1 %173, i32 1000, i32 %175
  %177 = getelementptr inbounds i8, ptr addrspace(1) %132, i64 2
  %178 = load <2 x i8>, ptr addrspace(1) %177, align 2, !invariant.load !4, !noalias !4
  %179 = extractelement <2 x i8> %178, i32 0
  %180 = extractelement <2 x i8> %178, i32 1
  %181 = trunc i8 %179 to i1
  %182 = select i1 %181, i32 %176, i32 -10000
  %183 = icmp sgt i32 %182, %112
  %184 = zext i1 %183 to i32
  %185 = add nuw nsw i32 %158, %184
  tail call void @llvm.experimental.noalias.scope.decl(metadata !326)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !329)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !331)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !333)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !336)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !338)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !341)
  %186 = tail call i32 @llvm.smax.i32(i32 %162, i32 0)
  %187 = tail call i32 @llvm.umin.i32(i32 %186, i32 100)
  %188 = mul nuw nsw i32 %187, 20
  %189 = zext nneg i32 %188 to i64
  %190 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %189
  %191 = getelementptr inbounds i8, ptr addrspace(1) %190, i64 20
  %192 = load float, ptr addrspace(1) %191, align 4, !invariant.load !4, !alias.scope !343, !noalias !344
  %.inv.i.i12 = fcmp ole float %192, 0xC1E0000000000000
  %193 = select i1 %.inv.i.i12, float 0xC1E0000000000000, float %192
  %194 = fptosi float %193 to i32
  %195 = fcmp oge float %192, 0x41E0000000000000
  %196 = fcmp uno float %192, 0.000000e+00
  %197 = add i32 %194, 1000
  %198 = select i1 %195, i32 -2147482649, i32 %197
  %199 = select i1 %196, i32 1000, i32 %198
  %200 = trunc i8 %180 to i1
  %201 = select i1 %200, i32 %199, i32 -10000
  %202 = icmp sgt i32 %201, %112
  %203 = zext i1 %202 to i32
  %204 = add nuw nsw i32 %185, %203
  tail call void @llvm.experimental.noalias.scope.decl(metadata !345)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !348)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !350)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !352)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !355)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !357)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !360)
  %205 = getelementptr inbounds i8, ptr addrspace(1) %114, i64 16
  %206 = load <2 x i32>, ptr addrspace(1) %205, align 8, !invariant.load !4, !noalias !4
  %207 = extractelement <2 x i32> %206, i32 0
  %208 = extractelement <2 x i32> %206, i32 1
  %209 = tail call i32 @llvm.smax.i32(i32 %207, i32 0)
  %210 = tail call i32 @llvm.umin.i32(i32 %209, i32 100)
  %211 = mul nuw nsw i32 %210, 20
  %212 = zext nneg i32 %211 to i64
  %213 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %212
  %214 = getelementptr inbounds i8, ptr addrspace(1) %213, i64 20
  %215 = load float, ptr addrspace(1) %214, align 4, !invariant.load !4, !alias.scope !362, !noalias !363
  %.inv.i.i13 = fcmp ole float %215, 0xC1E0000000000000
  %216 = select i1 %.inv.i.i13, float 0xC1E0000000000000, float %215
  %217 = fptosi float %216 to i32
  %218 = fcmp oge float %215, 0x41E0000000000000
  %219 = fcmp uno float %215, 0.000000e+00
  %220 = add i32 %217, 1000
  %221 = select i1 %218, i32 -2147482649, i32 %220
  %222 = select i1 %219, i32 1000, i32 %221
  %223 = getelementptr inbounds i8, ptr addrspace(1) %132, i64 4
  %224 = load <2 x i8>, ptr addrspace(1) %223, align 2, !invariant.load !4, !noalias !4
  %225 = extractelement <2 x i8> %224, i32 0
  %226 = extractelement <2 x i8> %224, i32 1
  %227 = trunc i8 %225 to i1
  %228 = select i1 %227, i32 %222, i32 -10000
  %229 = icmp sgt i32 %228, %112
  %230 = zext i1 %229 to i32
  %231 = add nuw nsw i32 %204, %230
  tail call void @llvm.experimental.noalias.scope.decl(metadata !364)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !367)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !369)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !371)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !374)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !376)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !379)
  %232 = tail call i32 @llvm.smax.i32(i32 %208, i32 0)
  %233 = tail call i32 @llvm.umin.i32(i32 %232, i32 100)
  %234 = mul nuw nsw i32 %233, 20
  %235 = zext nneg i32 %234 to i64
  %236 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %235
  %237 = getelementptr inbounds i8, ptr addrspace(1) %236, i64 20
  %238 = load float, ptr addrspace(1) %237, align 4, !invariant.load !4, !alias.scope !381, !noalias !382
  %.inv.i.i14 = fcmp ole float %238, 0xC1E0000000000000
  %239 = select i1 %.inv.i.i14, float 0xC1E0000000000000, float %238
  %240 = fptosi float %239 to i32
  %241 = fcmp oge float %238, 0x41E0000000000000
  %242 = fcmp uno float %238, 0.000000e+00
  %243 = add i32 %240, 1000
  %244 = select i1 %241, i32 -2147482649, i32 %243
  %245 = select i1 %242, i32 1000, i32 %244
  %246 = trunc i8 %226 to i1
  %247 = select i1 %246, i32 %245, i32 -10000
  %248 = icmp sgt i32 %247, %112
  %249 = zext i1 %248 to i32
  %250 = add nuw nsw i32 %231, %249
  tail call void @llvm.experimental.noalias.scope.decl(metadata !383)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !386)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !388)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !390)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !393)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !395)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !398)
  %251 = getelementptr inbounds i8, ptr addrspace(1) %114, i64 24
  %252 = load <2 x i32>, ptr addrspace(1) %251, align 8, !invariant.load !4, !noalias !4
  %253 = extractelement <2 x i32> %252, i32 0
  %254 = extractelement <2 x i32> %252, i32 1
  %255 = tail call i32 @llvm.smax.i32(i32 %253, i32 0)
  %256 = tail call i32 @llvm.umin.i32(i32 %255, i32 100)
  %257 = mul nuw nsw i32 %256, 20
  %258 = zext nneg i32 %257 to i64
  %259 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %258
  %260 = getelementptr inbounds i8, ptr addrspace(1) %259, i64 20
  %261 = load float, ptr addrspace(1) %260, align 4, !invariant.load !4, !alias.scope !400, !noalias !401
  %.inv.i.i15 = fcmp ole float %261, 0xC1E0000000000000
  %262 = select i1 %.inv.i.i15, float 0xC1E0000000000000, float %261
  %263 = fptosi float %262 to i32
  %264 = fcmp oge float %261, 0x41E0000000000000
  %265 = fcmp uno float %261, 0.000000e+00
  %266 = add i32 %263, 1000
  %267 = select i1 %264, i32 -2147482649, i32 %266
  %268 = select i1 %265, i32 1000, i32 %267
  %269 = getelementptr inbounds i8, ptr addrspace(1) %132, i64 6
  %270 = load <2 x i8>, ptr addrspace(1) %269, align 2, !invariant.load !4, !noalias !4
  %271 = extractelement <2 x i8> %270, i32 0
  %272 = extractelement <2 x i8> %270, i32 1
  %273 = trunc i8 %271 to i1
  %274 = select i1 %273, i32 %268, i32 -10000
  %275 = icmp sgt i32 %274, %112
  %276 = zext i1 %275 to i32
  %277 = add nuw nsw i32 %250, %276
  tail call void @llvm.experimental.noalias.scope.decl(metadata !402)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !405)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !407)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !409)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !412)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !414)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !417)
  %278 = tail call i32 @llvm.smax.i32(i32 %254, i32 0)
  %279 = tail call i32 @llvm.umin.i32(i32 %278, i32 100)
  %280 = mul nuw nsw i32 %279, 20
  %281 = zext nneg i32 %280 to i64
  %282 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %281
  %283 = getelementptr inbounds i8, ptr addrspace(1) %282, i64 20
  %284 = load float, ptr addrspace(1) %283, align 4, !invariant.load !4, !alias.scope !419, !noalias !420
  %.inv.i.i16 = fcmp ole float %284, 0xC1E0000000000000
  %285 = select i1 %.inv.i.i16, float 0xC1E0000000000000, float %284
  %286 = fptosi float %285 to i32
  %287 = fcmp oge float %284, 0x41E0000000000000
  %288 = fcmp uno float %284, 0.000000e+00
  %289 = add i32 %286, 1000
  %290 = select i1 %287, i32 -2147482649, i32 %289
  %291 = select i1 %288, i32 1000, i32 %290
  %292 = trunc i8 %272 to i1
  %293 = select i1 %292, i32 %291, i32 -10000
  %294 = icmp sgt i32 %293, %112
  %295 = zext i1 %294 to i32
  %296 = add nuw nsw i32 %277, %295
  tail call void @llvm.experimental.noalias.scope.decl(metadata !421)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !424)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !426)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !428)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !431)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !433)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !436)
  %297 = getelementptr inbounds i8, ptr addrspace(1) %114, i64 32
  %298 = load <2 x i32>, ptr addrspace(1) %297, align 8, !invariant.load !4, !noalias !4
  %299 = extractelement <2 x i32> %298, i32 0
  %300 = extractelement <2 x i32> %298, i32 1
  %301 = tail call i32 @llvm.smax.i32(i32 %299, i32 0)
  %302 = tail call i32 @llvm.umin.i32(i32 %301, i32 100)
  %303 = mul nuw nsw i32 %302, 20
  %304 = zext nneg i32 %303 to i64
  %305 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %304
  %306 = getelementptr inbounds i8, ptr addrspace(1) %305, i64 20
  %307 = load float, ptr addrspace(1) %306, align 4, !invariant.load !4, !alias.scope !438, !noalias !439
  %.inv.i.i17 = fcmp ole float %307, 0xC1E0000000000000
  %308 = select i1 %.inv.i.i17, float 0xC1E0000000000000, float %307
  %309 = fptosi float %308 to i32
  %310 = fcmp oge float %307, 0x41E0000000000000
  %311 = fcmp uno float %307, 0.000000e+00
  %312 = add i32 %309, 1000
  %313 = select i1 %310, i32 -2147482649, i32 %312
  %314 = select i1 %311, i32 1000, i32 %313
  %315 = getelementptr inbounds i8, ptr addrspace(1) %132, i64 8
  %316 = load <2 x i8>, ptr addrspace(1) %315, align 2, !invariant.load !4, !noalias !4
  %317 = extractelement <2 x i8> %316, i32 0
  %318 = extractelement <2 x i8> %316, i32 1
  %319 = trunc i8 %317 to i1
  %320 = select i1 %319, i32 %314, i32 -10000
  %321 = icmp sgt i32 %320, %112
  %322 = zext i1 %321 to i32
  %323 = add nuw nsw i32 %296, %322
  tail call void @llvm.experimental.noalias.scope.decl(metadata !440)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !443)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !445)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !447)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !450)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !452)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !455)
  %324 = tail call i32 @llvm.smax.i32(i32 %300, i32 0)
  %325 = tail call i32 @llvm.umin.i32(i32 %324, i32 100)
  %326 = mul nuw nsw i32 %325, 20
  %327 = zext nneg i32 %326 to i64
  %328 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %327
  %329 = getelementptr inbounds i8, ptr addrspace(1) %328, i64 20
  %330 = load float, ptr addrspace(1) %329, align 4, !invariant.load !4, !alias.scope !457, !noalias !458
  %.inv.i.i18 = fcmp ole float %330, 0xC1E0000000000000
  %331 = select i1 %.inv.i.i18, float 0xC1E0000000000000, float %330
  %332 = fptosi float %331 to i32
  %333 = fcmp oge float %330, 0x41E0000000000000
  %334 = fcmp uno float %330, 0.000000e+00
  %335 = add i32 %332, 1000
  %336 = select i1 %333, i32 -2147482649, i32 %335
  %337 = select i1 %334, i32 1000, i32 %336
  %338 = trunc i8 %318 to i1
  %339 = select i1 %338, i32 %337, i32 -10000
  %340 = icmp sgt i32 %339, %112
  %341 = zext i1 %340 to i32
  %342 = add nuw nsw i32 %323, %341
  tail call void @llvm.experimental.noalias.scope.decl(metadata !459)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !462)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !464)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !466)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !469)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !471)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !474)
  %343 = getelementptr inbounds i8, ptr addrspace(1) %114, i64 40
  %344 = load <2 x i32>, ptr addrspace(1) %343, align 8, !invariant.load !4, !noalias !4
  %345 = extractelement <2 x i32> %344, i32 0
  %346 = extractelement <2 x i32> %344, i32 1
  %347 = tail call i32 @llvm.smax.i32(i32 %345, i32 0)
  %348 = tail call i32 @llvm.umin.i32(i32 %347, i32 100)
  %349 = mul nuw nsw i32 %348, 20
  %350 = zext nneg i32 %349 to i64
  %351 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %350
  %352 = getelementptr inbounds i8, ptr addrspace(1) %351, i64 20
  %353 = load float, ptr addrspace(1) %352, align 4, !invariant.load !4, !alias.scope !476, !noalias !477
  %.inv.i.i19 = fcmp ole float %353, 0xC1E0000000000000
  %354 = select i1 %.inv.i.i19, float 0xC1E0000000000000, float %353
  %355 = fptosi float %354 to i32
  %356 = fcmp oge float %353, 0x41E0000000000000
  %357 = fcmp uno float %353, 0.000000e+00
  %358 = add i32 %355, 1000
  %359 = select i1 %356, i32 -2147482649, i32 %358
  %360 = select i1 %357, i32 1000, i32 %359
  %361 = getelementptr inbounds i8, ptr addrspace(1) %132, i64 10
  %362 = load <2 x i8>, ptr addrspace(1) %361, align 2, !invariant.load !4, !noalias !4
  %363 = extractelement <2 x i8> %362, i32 0
  %364 = extractelement <2 x i8> %362, i32 1
  %365 = trunc i8 %363 to i1
  %366 = select i1 %365, i32 %360, i32 -10000
  %367 = icmp sgt i32 %366, %112
  %368 = zext i1 %367 to i32
  %369 = add nuw nsw i32 %342, %368
  tail call void @llvm.experimental.noalias.scope.decl(metadata !478)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !481)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !483)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !485)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !488)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !490)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !493)
  %370 = tail call i32 @llvm.smax.i32(i32 %346, i32 0)
  %371 = tail call i32 @llvm.umin.i32(i32 %370, i32 100)
  %372 = mul nuw nsw i32 %371, 20
  %373 = zext nneg i32 %372 to i64
  %374 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %373
  %375 = getelementptr inbounds i8, ptr addrspace(1) %374, i64 20
  %376 = load float, ptr addrspace(1) %375, align 4, !invariant.load !4, !alias.scope !495, !noalias !496
  %.inv.i.i20 = fcmp ole float %376, 0xC1E0000000000000
  %377 = select i1 %.inv.i.i20, float 0xC1E0000000000000, float %376
  %378 = fptosi float %377 to i32
  %379 = fcmp oge float %376, 0x41E0000000000000
  %380 = fcmp uno float %376, 0.000000e+00
  %381 = add i32 %378, 1000
  %382 = select i1 %379, i32 -2147482649, i32 %381
  %383 = select i1 %380, i32 1000, i32 %382
  %384 = trunc i8 %364 to i1
  %385 = select i1 %384, i32 %383, i32 -10000
  %386 = icmp sgt i32 %385, %112
  %387 = zext i1 %386 to i32
  %388 = add nuw nsw i32 %369, %387
  tail call void @llvm.experimental.noalias.scope.decl(metadata !497)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !500)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !502)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !504)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !507)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !509)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !512)
  %389 = getelementptr inbounds i8, ptr addrspace(1) %114, i64 48
  %390 = load <2 x i32>, ptr addrspace(1) %389, align 8, !invariant.load !4, !noalias !4
  %391 = extractelement <2 x i32> %390, i32 0
  %392 = extractelement <2 x i32> %390, i32 1
  %393 = tail call i32 @llvm.smax.i32(i32 %391, i32 0)
  %394 = tail call i32 @llvm.umin.i32(i32 %393, i32 100)
  %395 = mul nuw nsw i32 %394, 20
  %396 = zext nneg i32 %395 to i64
  %397 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %396
  %398 = getelementptr inbounds i8, ptr addrspace(1) %397, i64 20
  %399 = load float, ptr addrspace(1) %398, align 4, !invariant.load !4, !alias.scope !514, !noalias !515
  %.inv.i.i21 = fcmp ole float %399, 0xC1E0000000000000
  %400 = select i1 %.inv.i.i21, float 0xC1E0000000000000, float %399
  %401 = fptosi float %400 to i32
  %402 = fcmp oge float %399, 0x41E0000000000000
  %403 = fcmp uno float %399, 0.000000e+00
  %404 = add i32 %401, 1000
  %405 = select i1 %402, i32 -2147482649, i32 %404
  %406 = select i1 %403, i32 1000, i32 %405
  %407 = getelementptr inbounds i8, ptr addrspace(1) %132, i64 12
  %408 = load <2 x i8>, ptr addrspace(1) %407, align 2, !invariant.load !4, !noalias !4
  %409 = extractelement <2 x i8> %408, i32 0
  %410 = extractelement <2 x i8> %408, i32 1
  %411 = trunc i8 %409 to i1
  %412 = select i1 %411, i32 %406, i32 -10000
  %413 = icmp sgt i32 %412, %112
  %414 = zext i1 %413 to i32
  %415 = add nuw nsw i32 %388, %414
  tail call void @llvm.experimental.noalias.scope.decl(metadata !516)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !519)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !521)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !523)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !526)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !528)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !531)
  %416 = tail call i32 @llvm.smax.i32(i32 %392, i32 0)
  %417 = tail call i32 @llvm.umin.i32(i32 %416, i32 100)
  %418 = mul nuw nsw i32 %417, 20
  %419 = zext nneg i32 %418 to i64
  %420 = getelementptr inbounds float, ptr addrspace(1) %39, i64 %419
  %421 = getelementptr inbounds i8, ptr addrspace(1) %420, i64 20
  %422 = load float, ptr addrspace(1) %421, align 4, !invariant.load !4, !alias.scope !533, !noalias !534
  %.inv.i.i22 = fcmp ole float %422, 0xC1E0000000000000
  %423 = select i1 %.inv.i.i22, float 0xC1E0000000000000, float %422
  %424 = fptosi float %423 to i32
  %425 = fcmp oge float %422, 0x41E0000000000000
  %426 = fcmp uno float %422, 0.000000e+00
  %427 = add i32 %424, 1000
  %428 = select i1 %425, i32 -2147482649, i32 %427
  %429 = select i1 %426, i32 1000, i32 %428
  %430 = trunc i8 %410 to i1
  %431 = select i1 %430, i32 %429, i32 -10000
  %432 = icmp sgt i32 %431, %112
  %433 = zext i1 %432 to i32
  %434 = add nuw nsw i32 %415, %433
  %435 = uitofp nneg i32 %434 to float
  %436 = fmul float %435, 0x3FB24924A0000000
  %437 = tail call float @llvm.maximum.f32(float %436, float 0.000000e+00)
  %438 = tail call float @llvm.minimum.f32(float %437, float 1.000000e+00)
  %439 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 48
  %440 = load <4 x float>, ptr addrspace(1) %439, align 16, !invariant.load !4, !noalias !4
  %441 = extractelement <4 x float> %440, i32 0
  %442 = extractelement <4 x float> %440, i32 1
  %443 = extractelement <4 x float> %440, i32 2
  %444 = extractelement <4 x float> %440, i32 3
  %445 = fcmp ogt float %444, 0.000000e+00
  %446 = zext i1 %445 to i8
  %447 = fcmp ogt float %443, 0.000000e+00
  %448 = zext i1 %447 to i8
  %449 = fcmp ogt float %442, 0.000000e+00
  %450 = zext i1 %449 to i8
  %451 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 32
  %452 = load <4 x float>, ptr addrspace(1) %451, align 16, !invariant.load !4, !noalias !4
  %453 = extractelement <4 x float> %452, i32 0
  %454 = extractelement <4 x float> %452, i32 1
  %455 = extractelement <4 x float> %452, i32 2
  %456 = extractelement <4 x float> %452, i32 3
  %457 = fcmp ogt float %456, 0.000000e+00
  %458 = zext i1 %457 to i8
  %459 = fcmp ogt float %455, 0.000000e+00
  %460 = zext i1 %459 to i8
  %461 = fcmp ogt float %453, 0.000000e+00
  %462 = zext i1 %461 to i8
  %463 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 64
  %464 = load <4 x float>, ptr addrspace(1) %463, align 16, !invariant.load !4, !noalias !4
  %465 = extractelement <4 x float> %464, i32 0
  %466 = extractelement <4 x float> %464, i32 1
  %467 = extractelement <4 x float> %464, i32 2
  %468 = extractelement <4 x float> %464, i32 3
  %.inv = fcmp ole float %468, 0xC1E0000000000000
  %469 = select i1 %.inv, float 0xC1E0000000000000, float %468
  %470 = fptosi float %469 to i32
  %471 = fcmp oge float %468, 0x41E0000000000000
  %472 = fcmp uno float %468, 0.000000e+00
  %473 = tail call i32 @llvm.smax.i32(i32 %470, i32 1)
  %474 = select i1 %471, i32 2147483647, i32 %473
  %475 = select i1 %472, i32 1, i32 %474
  %.inv1 = fcmp ole float %100, 0xC1E0000000000000
  %476 = select i1 %.inv1, float 0xC1E0000000000000, float %100
  %477 = fptosi float %476 to i32
  %478 = fcmp oge float %100, 0x41E0000000000000
  %479 = select i1 %478, i32 2147483647, i32 %477
  %480 = fcmp uno float %100, 0.000000e+00
  %481 = select i1 %480, i32 0, i32 %479
  %482 = load <4 x float>, ptr addrspace(1) %97, align 16, !invariant.load !4, !noalias !4
  %483 = extractelement <4 x float> %482, i32 0
  %484 = extractelement <4 x float> %482, i32 1
  %485 = extractelement <4 x float> %482, i32 2
  %486 = extractelement <4 x float> %482, i32 3
  %.inv2 = fcmp ole float %484, 0xC1E0000000000000
  %487 = select i1 %.inv2, float 0xC1E0000000000000, float %484
  %488 = fptosi float %487 to i32
  %489 = fcmp oge float %484, 0x41E0000000000000
  %490 = select i1 %489, i32 2147483647, i32 %488
  %491 = fcmp uno float %484, 0.000000e+00
  %492 = select i1 %491, i32 0, i32 %490
  %.inv3 = fcmp ole float %483, 0xC1E0000000000000
  %493 = select i1 %.inv3, float 0xC1E0000000000000, float %483
  %494 = fptosi float %493 to i32
  %495 = fcmp oge float %483, 0x41E0000000000000
  %496 = select i1 %495, i32 2147483647, i32 %494
  %497 = fcmp uno float %483, 0.000000e+00
  %498 = select i1 %497, i32 0, i32 %496
  %.inv4 = fcmp ole float %486, 0xC1E0000000000000
  %499 = select i1 %.inv4, float 0xC1E0000000000000, float %486
  %500 = fptosi float %499 to i32
  %501 = fcmp oge float %486, 0x41E0000000000000
  %502 = select i1 %501, i32 2147483647, i32 %500
  %503 = fcmp uno float %486, 0.000000e+00
  %504 = select i1 %503, i32 0, i32 %502
  %.inv5 = fcmp ole float %485, 0xC1E0000000000000
  %505 = select i1 %.inv5, float 0xC1E0000000000000, float %485
  %506 = fptosi float %505 to i32
  %507 = fcmp oge float %485, 0x41E0000000000000
  %508 = select i1 %507, i32 2147483647, i32 %506
  %509 = fcmp uno float %485, 0.000000e+00
  %510 = select i1 %509, i32 0, i32 %508
  %511 = fcmp ogt float %103, 0.000000e+00
  %512 = zext i1 %511 to i8
  %.inv6 = fcmp ole float %441, 0xC1E0000000000000
  %513 = select i1 %.inv6, float 0xC1E0000000000000, float %441
  %514 = fptosi float %513 to i32
  %515 = fcmp oge float %441, 0x41E0000000000000
  %516 = select i1 %515, i32 2147483647, i32 %514
  %517 = fcmp uno float %441, 0.000000e+00
  %518 = select i1 %517, i32 0, i32 %516
  %519 = fcmp ogt float %454, 0.000000e+00
  %520 = zext i1 %519 to i8
  %521 = select i1 %106, i32 2147483647, i32 %105
  %522 = select i1 %107, i32 0, i32 %521
  %523 = fcmp ogt float %466, 0.000000e+00
  %524 = zext i1 %523 to i8
  %525 = fcmp ogt float %467, 0.000000e+00
  %526 = zext i1 %525 to i8
  %527 = fcmp ogt float %465, 0.000000e+00
  %528 = zext i1 %527 to i8
  %529 = getelementptr inbounds i32, ptr addrspace(1) %40, i64 %86
  %530 = load i32, ptr addrspace(1) %529, align 4, !invariant.load !4
  %531 = srem i32 %530, 15
  %532 = icmp slt i32 %531, 0
  %533 = add nsw i32 %531, 15
  %534 = select i1 %532, i32 %533, i32 %531
  %535 = icmp sgt i32 %534, 0
  %536 = icmp slt i32 %534, 14
  %537 = select i1 %75, i32 1, i32 -1
  %.v = select i1 %75, i1 %536, i1 %535
  %538 = add i32 %530, %537
  %539 = and i1 %519, %.v
  %540 = tail call i32 @llvm.smax.i32(i32 %538, i32 0)
  %541 = tail call i32 @llvm.umin.i32(i32 %540, i32 164)
  %542 = select i1 %539, i32 %541, i32 %530
  %543 = icmp slt i32 %542, 0
  %544 = add i32 %542, 165
  %545 = select i1 %543, i32 %544, i32 %542
  %546 = and i8 %88, %520
  %547 = select i1 %.v, i8 %546, i8 0
  %548 = getelementptr inbounds float, ptr addrspace(1) %41, i64 %77
  %549 = load float, ptr addrspace(1) %548, align 4, !invariant.load !4
  %550 = tail call float @llvm.maximum.f32(float %102, float 1.000000e+00)
  %551 = fdiv float %549, %550
  %.inv8 = fcmp ole float %551, 0xC1E0000000000000
  %552 = select i1 %.inv8, float 0xC1E0000000000000, float %551
  %553 = fptosi float %552 to i32
  %554 = fcmp oge float %551, 0x41E0000000000000
  %555 = fcmp uno float %551, 0.000000e+00
  %556 = tail call i32 @llvm.smax.i32(i32 %553, i32 1)
  %557 = select i1 %554, i32 2147483647, i32 %556
  %558 = select i1 %555, i32 1, i32 %557
  %559 = uitofp nneg i32 %558 to float
  %560 = fmul float %102, %559
  %561 = select i1 %111, float %560, float 0.000000e+00
  %562 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 %86
  store i8 %90, ptr addrspace(1) %562, align 1
  %563 = getelementptr inbounds i32, ptr addrspace(1) %43, i64 %86
  store i32 %76, ptr addrspace(1) %563, align 4
  %564 = getelementptr inbounds float, ptr addrspace(1) %44, i64 %86
  store float %438, ptr addrspace(1) %564, align 4
  %565 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 %86
  store i8 %446, ptr addrspace(1) %565, align 1
  %566 = getelementptr inbounds i8, ptr addrspace(1) %46, i64 %86
  store i8 %448, ptr addrspace(1) %566, align 1
  %567 = getelementptr inbounds i8, ptr addrspace(1) %47, i64 %86
  store i8 %450, ptr addrspace(1) %567, align 1
  %568 = getelementptr inbounds i8, ptr addrspace(1) %48, i64 %86
  store i8 %458, ptr addrspace(1) %568, align 1
  %569 = getelementptr inbounds i8, ptr addrspace(1) %49, i64 %86
  store i8 %460, ptr addrspace(1) %569, align 1
  %570 = getelementptr inbounds i8, ptr addrspace(1) %50, i64 %86
  store i8 %462, ptr addrspace(1) %570, align 1
  %571 = getelementptr inbounds i32, ptr addrspace(1) %51, i64 %86
  store i32 %475, ptr addrspace(1) %571, align 4
  %572 = getelementptr inbounds i32, ptr addrspace(1) %52, i64 %86
  store i32 %481, ptr addrspace(1) %572, align 4
  %573 = getelementptr inbounds i32, ptr addrspace(1) %53, i64 %86
  store i32 %492, ptr addrspace(1) %573, align 4
  %574 = getelementptr inbounds i32, ptr addrspace(1) %54, i64 %86
  store i32 %498, ptr addrspace(1) %574, align 4
  %575 = getelementptr inbounds i32, ptr addrspace(1) %55, i64 %86
  store i32 %504, ptr addrspace(1) %575, align 4
  %576 = getelementptr inbounds i32, ptr addrspace(1) %56, i64 %86
  store i32 %510, ptr addrspace(1) %576, align 4
  %577 = getelementptr inbounds i8, ptr addrspace(1) %57, i64 %86
  store i8 %512, ptr addrspace(1) %577, align 1
  %578 = getelementptr inbounds i32, ptr addrspace(1) %58, i64 %86
  store i32 %518, ptr addrspace(1) %578, align 4
  %579 = getelementptr inbounds float, ptr addrspace(1) %59, i64 %86
  store float %102, ptr addrspace(1) %579, align 4
  %580 = getelementptr inbounds i8, ptr addrspace(1) %60, i64 %86
  store i8 %520, ptr addrspace(1) %580, align 1
  %581 = getelementptr inbounds i32, ptr addrspace(1) %61, i64 %86
  store i32 %522, ptr addrspace(1) %581, align 4
  %582 = getelementptr inbounds i8, ptr addrspace(1) %62, i64 %86
  store i8 %524, ptr addrspace(1) %582, align 1
  %583 = getelementptr inbounds i8, ptr addrspace(1) %63, i64 %86
  store i8 %526, ptr addrspace(1) %583, align 1
  %584 = getelementptr inbounds i8, ptr addrspace(1) %64, i64 %86
  store i8 %528, ptr addrspace(1) %584, align 1
  %585 = getelementptr inbounds i32, ptr addrspace(1) %65, i64 %86
  store i32 %545, ptr addrspace(1) %585, align 4
  %586 = getelementptr inbounds i8, ptr addrspace(1) %66, i64 %86
  store i8 %547, ptr addrspace(1) %586, align 1
  %587 = getelementptr inbounds float, ptr addrspace(1) %67, i64 %86
  store float %561, ptr addrspace(1) %587, align 4
  %588 = getelementptr inbounds i32, ptr addrspace(1) %68, i64 %86
  store i32 %558, ptr addrspace(1) %588, align 4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minimum.f32(float, float) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(16384) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(32768) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %0 to ptr addrspace(1)
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
define ptx_kernel void @loop_and_fusion_2(ptr noalias writeonly align 256 captures(none) dereferenceable(165) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(165) %1) local_unnamed_addr #5 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !535
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %7 = shl nuw nsw i32 %5, 7
  %8 = or disjoint i32 %7, %6
  %9 = icmp samesign ult i32 %8, 165
  br i1 %9, label %10, label %18

10:                                               ; preds = %2
  %.lhs.trunc = trunc nuw i32 %8 to i8
  %11 = urem i8 %.lhs.trunc, 15
  %12 = add nsw i8 %11, -3
  %13 = icmp ult i8 %12, 9
  %14 = zext i1 %13 to i8
  %15 = zext nneg i32 %8 to i64
  %16 = getelementptr inbounds i8, ptr addrspace(1) %3, i64 %15
  store i8 %14, ptr addrspace(1) %16, align 1
  %17 = getelementptr inbounds i8, ptr addrspace(1) %4, i64 %15
  store i8 0, ptr addrspace(1) %17, align 1
  br label %18

18:                                               ; preds = %10, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_select_fusion_3(ptr noalias readonly align 256 captures(none) dereferenceable(16384) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2, ptr noalias readonly align 256 captures(none) dereferenceable(165) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(2703360) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !536
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %13 = shl nuw nsw i32 %12, 2
  %14 = shl nuw nsw i32 %11, 9
  %15 = or disjoint i32 %13, %14
  %16 = udiv i32 %15, 165
  %17 = mul i32 %16, 165
  %.decomposed = sub i32 %15, %17
  %18 = zext nneg i32 %16 to i64
  %19 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %18
  %20 = load i32, ptr addrspace(1) %19, align 4, !invariant.load !4
  %21 = add i32 %20, %.decomposed
  %22 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %18
  %23 = load i32, ptr addrspace(1) %22, align 4, !invariant.load !4
  %24 = tail call i32 @llvm.fshl.i32(i32 %21, i32 %21, i32 13)
  %25 = add i32 %23, %21
  %26 = xor i32 %25, %24
  %27 = tail call i32 @llvm.fshl.i32(i32 %26, i32 %26, i32 15)
  %28 = add i32 %26, %25
  %29 = xor i32 %28, %27
  %30 = add i32 %29, %28
  %31 = tail call i32 @llvm.fshl.i32(i32 %29, i32 %29, i32 26)
  %32 = xor i32 %30, %31
  %33 = tail call i32 @llvm.fshl.i32(i32 %32, i32 %32, i32 6)
  %34 = add i32 %32, %30
  %35 = xor i32 %34, %33
  %36 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %18
  %37 = load i32, ptr addrspace(1) %36, align 4, !invariant.load !4
  %38 = add i32 %37, 1
  %39 = add i32 %38, %35
  %40 = add i32 %34, %20
  %41 = tail call i32 @llvm.fshl.i32(i32 %39, i32 %39, i32 17)
  %42 = add i32 %40, %39
  %43 = xor i32 %42, %41
  %44 = tail call i32 @llvm.fshl.i32(i32 %43, i32 %43, i32 29)
  %45 = add i32 %43, %42
  %46 = xor i32 %45, %44
  %47 = add i32 %46, %45
  %48 = tail call i32 @llvm.fshl.i32(i32 %46, i32 %46, i32 16)
  %49 = xor i32 %47, %48
  %50 = tail call i32 @llvm.fshl.i32(i32 %49, i32 %49, i32 24)
  %51 = add i32 %49, %47
  %52 = xor i32 %51, %50
  %53 = add i32 %23, 2
  %54 = add i32 %53, %52
  %55 = add i32 %51, %37
  %56 = tail call i32 @llvm.fshl.i32(i32 %54, i32 %54, i32 13)
  %57 = add i32 %55, %54
  %58 = xor i32 %57, %56
  %59 = tail call i32 @llvm.fshl.i32(i32 %58, i32 %58, i32 15)
  %60 = add i32 %58, %57
  %61 = xor i32 %60, %59
  %62 = add i32 %61, %60
  %63 = tail call i32 @llvm.fshl.i32(i32 %61, i32 %61, i32 26)
  %64 = xor i32 %62, %63
  %65 = tail call i32 @llvm.fshl.i32(i32 %64, i32 %64, i32 6)
  %66 = add i32 %64, %62
  %67 = xor i32 %66, %65
  %68 = add i32 %20, 3
  %69 = add i32 %68, %67
  %70 = add i32 %66, %23
  %71 = tail call i32 @llvm.fshl.i32(i32 %69, i32 %69, i32 17)
  %72 = add i32 %70, %69
  %73 = xor i32 %72, %71
  %74 = tail call i32 @llvm.fshl.i32(i32 %73, i32 %73, i32 29)
  %75 = add i32 %73, %72
  %76 = xor i32 %75, %74
  %77 = add i32 %76, %75
  %78 = tail call i32 @llvm.fshl.i32(i32 %76, i32 %76, i32 16)
  %79 = xor i32 %77, %78
  %80 = tail call i32 @llvm.fshl.i32(i32 %79, i32 %79, i32 24)
  %81 = add i32 %79, %77
  %82 = xor i32 %81, %80
  %83 = add i32 %37, 4
  %84 = add i32 %83, %82
  %85 = add i32 %81, %20
  %86 = tail call i32 @llvm.fshl.i32(i32 %84, i32 %84, i32 13)
  %87 = add i32 %85, %84
  %88 = xor i32 %87, %86
  %89 = tail call i32 @llvm.fshl.i32(i32 %88, i32 %88, i32 15)
  %90 = add i32 %88, %87
  %91 = xor i32 %90, %89
  %92 = add i32 %91, %90
  %93 = tail call i32 @llvm.fshl.i32(i32 %91, i32 %91, i32 26)
  %94 = xor i32 %92, %93
  %95 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %94, i32 6)
  %96 = add i32 %94, %92
  %97 = xor i32 %96, %95
  %98 = add i32 %96, %37
  %99 = add i32 %23, 5
  %100 = add i32 %99, %97
  %101 = xor i32 %100, %98
  %102 = lshr i32 %101, 9
  %103 = or disjoint i32 %102, 1065353216
  %104 = bitcast i32 %103 to float
  %105 = fadd float %104, -1.000000e+00
  %106 = zext nneg i32 %.decomposed to i64
  %107 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %106
  %108 = load i8, ptr addrspace(1) %107, align 1, !invariant.load !4
  %109 = tail call float @llvm.maximum.f32(float %105, float 0.000000e+00)
  %110 = trunc i8 %108 to i1
  %111 = select i1 %110, float %109, float -1.000000e+00
  %112 = insertelement <4 x float> poison, float %111, i64 0
  %113 = or disjoint i32 %15, 1
  %114 = udiv i32 %113, 165
  %115 = mul i32 %114, 165
  %.decomposed1 = sub i32 %113, %115
  %116 = zext nneg i32 %114 to i64
  %117 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %116
  %118 = load i32, ptr addrspace(1) %117, align 4, !invariant.load !4
  %119 = add i32 %118, %.decomposed1
  %120 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %116
  %121 = load i32, ptr addrspace(1) %120, align 4, !invariant.load !4
  %122 = tail call i32 @llvm.fshl.i32(i32 %119, i32 %119, i32 13)
  %123 = add i32 %121, %119
  %124 = xor i32 %123, %122
  %125 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %124, i32 15)
  %126 = add i32 %124, %123
  %127 = xor i32 %126, %125
  %128 = add i32 %127, %126
  %129 = tail call i32 @llvm.fshl.i32(i32 %127, i32 %127, i32 26)
  %130 = xor i32 %128, %129
  %131 = tail call i32 @llvm.fshl.i32(i32 %130, i32 %130, i32 6)
  %132 = add i32 %130, %128
  %133 = xor i32 %132, %131
  %134 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %116
  %135 = load i32, ptr addrspace(1) %134, align 4, !invariant.load !4
  %136 = add i32 %135, 1
  %137 = add i32 %136, %133
  %138 = add i32 %132, %118
  %139 = tail call i32 @llvm.fshl.i32(i32 %137, i32 %137, i32 17)
  %140 = add i32 %138, %137
  %141 = xor i32 %140, %139
  %142 = tail call i32 @llvm.fshl.i32(i32 %141, i32 %141, i32 29)
  %143 = add i32 %141, %140
  %144 = xor i32 %143, %142
  %145 = add i32 %144, %143
  %146 = tail call i32 @llvm.fshl.i32(i32 %144, i32 %144, i32 16)
  %147 = xor i32 %145, %146
  %148 = tail call i32 @llvm.fshl.i32(i32 %147, i32 %147, i32 24)
  %149 = add i32 %147, %145
  %150 = xor i32 %149, %148
  %151 = add i32 %121, 2
  %152 = add i32 %151, %150
  %153 = add i32 %149, %135
  %154 = tail call i32 @llvm.fshl.i32(i32 %152, i32 %152, i32 13)
  %155 = add i32 %153, %152
  %156 = xor i32 %155, %154
  %157 = tail call i32 @llvm.fshl.i32(i32 %156, i32 %156, i32 15)
  %158 = add i32 %156, %155
  %159 = xor i32 %158, %157
  %160 = add i32 %159, %158
  %161 = tail call i32 @llvm.fshl.i32(i32 %159, i32 %159, i32 26)
  %162 = xor i32 %160, %161
  %163 = tail call i32 @llvm.fshl.i32(i32 %162, i32 %162, i32 6)
  %164 = add i32 %162, %160
  %165 = xor i32 %164, %163
  %166 = add i32 %118, 3
  %167 = add i32 %166, %165
  %168 = add i32 %164, %121
  %169 = tail call i32 @llvm.fshl.i32(i32 %167, i32 %167, i32 17)
  %170 = add i32 %168, %167
  %171 = xor i32 %170, %169
  %172 = tail call i32 @llvm.fshl.i32(i32 %171, i32 %171, i32 29)
  %173 = add i32 %171, %170
  %174 = xor i32 %173, %172
  %175 = add i32 %174, %173
  %176 = tail call i32 @llvm.fshl.i32(i32 %174, i32 %174, i32 16)
  %177 = xor i32 %175, %176
  %178 = tail call i32 @llvm.fshl.i32(i32 %177, i32 %177, i32 24)
  %179 = add i32 %177, %175
  %180 = xor i32 %179, %178
  %181 = add i32 %135, 4
  %182 = add i32 %181, %180
  %183 = add i32 %179, %118
  %184 = tail call i32 @llvm.fshl.i32(i32 %182, i32 %182, i32 13)
  %185 = add i32 %183, %182
  %186 = xor i32 %185, %184
  %187 = tail call i32 @llvm.fshl.i32(i32 %186, i32 %186, i32 15)
  %188 = add i32 %186, %185
  %189 = xor i32 %188, %187
  %190 = add i32 %189, %188
  %191 = tail call i32 @llvm.fshl.i32(i32 %189, i32 %189, i32 26)
  %192 = xor i32 %190, %191
  %193 = tail call i32 @llvm.fshl.i32(i32 %192, i32 %192, i32 6)
  %194 = add i32 %192, %190
  %195 = xor i32 %194, %193
  %196 = add i32 %194, %135
  %197 = add i32 %121, 5
  %198 = add i32 %197, %195
  %199 = xor i32 %198, %196
  %200 = lshr i32 %199, 9
  %201 = or disjoint i32 %200, 1065353216
  %202 = bitcast i32 %201 to float
  %203 = fadd float %202, -1.000000e+00
  %204 = zext nneg i32 %.decomposed1 to i64
  %205 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %204
  %206 = load i8, ptr addrspace(1) %205, align 1, !invariant.load !4
  %207 = tail call float @llvm.maximum.f32(float %203, float 0.000000e+00)
  %208 = trunc i8 %206 to i1
  %209 = select i1 %208, float %207, float -1.000000e+00
  %210 = insertelement <4 x float> %112, float %209, i64 1
  %211 = or disjoint i32 %15, 2
  %212 = udiv i32 %211, 165
  %213 = mul i32 %212, 165
  %.decomposed2 = sub i32 %211, %213
  %214 = zext nneg i32 %212 to i64
  %215 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %214
  %216 = load i32, ptr addrspace(1) %215, align 4, !invariant.load !4
  %217 = add i32 %216, %.decomposed2
  %218 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %214
  %219 = load i32, ptr addrspace(1) %218, align 4, !invariant.load !4
  %220 = tail call i32 @llvm.fshl.i32(i32 %217, i32 %217, i32 13)
  %221 = add i32 %219, %217
  %222 = xor i32 %221, %220
  %223 = tail call i32 @llvm.fshl.i32(i32 %222, i32 %222, i32 15)
  %224 = add i32 %222, %221
  %225 = xor i32 %224, %223
  %226 = add i32 %225, %224
  %227 = tail call i32 @llvm.fshl.i32(i32 %225, i32 %225, i32 26)
  %228 = xor i32 %226, %227
  %229 = tail call i32 @llvm.fshl.i32(i32 %228, i32 %228, i32 6)
  %230 = add i32 %228, %226
  %231 = xor i32 %230, %229
  %232 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %214
  %233 = load i32, ptr addrspace(1) %232, align 4, !invariant.load !4
  %234 = add i32 %233, 1
  %235 = add i32 %234, %231
  %236 = add i32 %230, %216
  %237 = tail call i32 @llvm.fshl.i32(i32 %235, i32 %235, i32 17)
  %238 = add i32 %236, %235
  %239 = xor i32 %238, %237
  %240 = tail call i32 @llvm.fshl.i32(i32 %239, i32 %239, i32 29)
  %241 = add i32 %239, %238
  %242 = xor i32 %241, %240
  %243 = add i32 %242, %241
  %244 = tail call i32 @llvm.fshl.i32(i32 %242, i32 %242, i32 16)
  %245 = xor i32 %243, %244
  %246 = tail call i32 @llvm.fshl.i32(i32 %245, i32 %245, i32 24)
  %247 = add i32 %245, %243
  %248 = xor i32 %247, %246
  %249 = add i32 %219, 2
  %250 = add i32 %249, %248
  %251 = add i32 %247, %233
  %252 = tail call i32 @llvm.fshl.i32(i32 %250, i32 %250, i32 13)
  %253 = add i32 %251, %250
  %254 = xor i32 %253, %252
  %255 = tail call i32 @llvm.fshl.i32(i32 %254, i32 %254, i32 15)
  %256 = add i32 %254, %253
  %257 = xor i32 %256, %255
  %258 = add i32 %257, %256
  %259 = tail call i32 @llvm.fshl.i32(i32 %257, i32 %257, i32 26)
  %260 = xor i32 %258, %259
  %261 = tail call i32 @llvm.fshl.i32(i32 %260, i32 %260, i32 6)
  %262 = add i32 %260, %258
  %263 = xor i32 %262, %261
  %264 = add i32 %216, 3
  %265 = add i32 %264, %263
  %266 = add i32 %262, %219
  %267 = tail call i32 @llvm.fshl.i32(i32 %265, i32 %265, i32 17)
  %268 = add i32 %266, %265
  %269 = xor i32 %268, %267
  %270 = tail call i32 @llvm.fshl.i32(i32 %269, i32 %269, i32 29)
  %271 = add i32 %269, %268
  %272 = xor i32 %271, %270
  %273 = add i32 %272, %271
  %274 = tail call i32 @llvm.fshl.i32(i32 %272, i32 %272, i32 16)
  %275 = xor i32 %273, %274
  %276 = tail call i32 @llvm.fshl.i32(i32 %275, i32 %275, i32 24)
  %277 = add i32 %275, %273
  %278 = xor i32 %277, %276
  %279 = add i32 %233, 4
  %280 = add i32 %279, %278
  %281 = add i32 %277, %216
  %282 = tail call i32 @llvm.fshl.i32(i32 %280, i32 %280, i32 13)
  %283 = add i32 %281, %280
  %284 = xor i32 %283, %282
  %285 = tail call i32 @llvm.fshl.i32(i32 %284, i32 %284, i32 15)
  %286 = add i32 %284, %283
  %287 = xor i32 %286, %285
  %288 = add i32 %287, %286
  %289 = tail call i32 @llvm.fshl.i32(i32 %287, i32 %287, i32 26)
  %290 = xor i32 %288, %289
  %291 = tail call i32 @llvm.fshl.i32(i32 %290, i32 %290, i32 6)
  %292 = add i32 %290, %288
  %293 = xor i32 %292, %291
  %294 = add i32 %292, %233
  %295 = add i32 %219, 5
  %296 = add i32 %295, %293
  %297 = xor i32 %296, %294
  %298 = lshr i32 %297, 9
  %299 = or disjoint i32 %298, 1065353216
  %300 = bitcast i32 %299 to float
  %301 = fadd float %300, -1.000000e+00
  %302 = zext nneg i32 %.decomposed2 to i64
  %303 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %302
  %304 = load i8, ptr addrspace(1) %303, align 1, !invariant.load !4
  %305 = tail call float @llvm.maximum.f32(float %301, float 0.000000e+00)
  %306 = trunc i8 %304 to i1
  %307 = select i1 %306, float %305, float -1.000000e+00
  %308 = insertelement <4 x float> %210, float %307, i64 2
  %309 = or disjoint i32 %15, 3
  %310 = udiv i32 %309, 165
  %311 = mul i32 %310, 165
  %.decomposed3 = sub i32 %309, %311
  %312 = zext nneg i32 %310 to i64
  %313 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %312
  %314 = load i32, ptr addrspace(1) %313, align 4, !invariant.load !4
  %315 = add i32 %314, %.decomposed3
  %316 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %312
  %317 = load i32, ptr addrspace(1) %316, align 4, !invariant.load !4
  %318 = tail call i32 @llvm.fshl.i32(i32 %315, i32 %315, i32 13)
  %319 = add i32 %317, %315
  %320 = xor i32 %319, %318
  %321 = tail call i32 @llvm.fshl.i32(i32 %320, i32 %320, i32 15)
  %322 = add i32 %320, %319
  %323 = xor i32 %322, %321
  %324 = add i32 %323, %322
  %325 = tail call i32 @llvm.fshl.i32(i32 %323, i32 %323, i32 26)
  %326 = xor i32 %324, %325
  %327 = tail call i32 @llvm.fshl.i32(i32 %326, i32 %326, i32 6)
  %328 = add i32 %326, %324
  %329 = xor i32 %328, %327
  %330 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %312
  %331 = load i32, ptr addrspace(1) %330, align 4, !invariant.load !4
  %332 = add i32 %331, 1
  %333 = add i32 %332, %329
  %334 = add i32 %328, %314
  %335 = tail call i32 @llvm.fshl.i32(i32 %333, i32 %333, i32 17)
  %336 = add i32 %334, %333
  %337 = xor i32 %336, %335
  %338 = tail call i32 @llvm.fshl.i32(i32 %337, i32 %337, i32 29)
  %339 = add i32 %337, %336
  %340 = xor i32 %339, %338
  %341 = add i32 %340, %339
  %342 = tail call i32 @llvm.fshl.i32(i32 %340, i32 %340, i32 16)
  %343 = xor i32 %341, %342
  %344 = tail call i32 @llvm.fshl.i32(i32 %343, i32 %343, i32 24)
  %345 = add i32 %343, %341
  %346 = xor i32 %345, %344
  %347 = add i32 %317, 2
  %348 = add i32 %347, %346
  %349 = add i32 %345, %331
  %350 = tail call i32 @llvm.fshl.i32(i32 %348, i32 %348, i32 13)
  %351 = add i32 %349, %348
  %352 = xor i32 %351, %350
  %353 = tail call i32 @llvm.fshl.i32(i32 %352, i32 %352, i32 15)
  %354 = add i32 %352, %351
  %355 = xor i32 %354, %353
  %356 = add i32 %355, %354
  %357 = tail call i32 @llvm.fshl.i32(i32 %355, i32 %355, i32 26)
  %358 = xor i32 %356, %357
  %359 = tail call i32 @llvm.fshl.i32(i32 %358, i32 %358, i32 6)
  %360 = add i32 %358, %356
  %361 = xor i32 %360, %359
  %362 = add i32 %314, 3
  %363 = add i32 %362, %361
  %364 = add i32 %360, %317
  %365 = tail call i32 @llvm.fshl.i32(i32 %363, i32 %363, i32 17)
  %366 = add i32 %364, %363
  %367 = xor i32 %366, %365
  %368 = tail call i32 @llvm.fshl.i32(i32 %367, i32 %367, i32 29)
  %369 = add i32 %367, %366
  %370 = xor i32 %369, %368
  %371 = add i32 %370, %369
  %372 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 16)
  %373 = xor i32 %371, %372
  %374 = tail call i32 @llvm.fshl.i32(i32 %373, i32 %373, i32 24)
  %375 = add i32 %373, %371
  %376 = xor i32 %375, %374
  %377 = add i32 %331, 4
  %378 = add i32 %377, %376
  %379 = add i32 %375, %314
  %380 = tail call i32 @llvm.fshl.i32(i32 %378, i32 %378, i32 13)
  %381 = add i32 %379, %378
  %382 = xor i32 %381, %380
  %383 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 15)
  %384 = add i32 %382, %381
  %385 = xor i32 %384, %383
  %386 = add i32 %385, %384
  %387 = tail call i32 @llvm.fshl.i32(i32 %385, i32 %385, i32 26)
  %388 = xor i32 %386, %387
  %389 = tail call i32 @llvm.fshl.i32(i32 %388, i32 %388, i32 6)
  %390 = add i32 %388, %386
  %391 = xor i32 %390, %389
  %392 = add i32 %390, %331
  %393 = add i32 %317, 5
  %394 = add i32 %393, %391
  %395 = xor i32 %394, %392
  %396 = lshr i32 %395, 9
  %397 = or disjoint i32 %396, 1065353216
  %398 = bitcast i32 %397 to float
  %399 = fadd float %398, -1.000000e+00
  %400 = zext nneg i32 %.decomposed3 to i64
  %401 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %400
  %402 = load i8, ptr addrspace(1) %401, align 1, !invariant.load !4
  %403 = tail call float @llvm.maximum.f32(float %399, float 0.000000e+00)
  %404 = trunc i8 %402 to i1
  %405 = select i1 %404, float %403, float -1.000000e+00
  %406 = insertelement <4 x float> %308, float %405, i64 3
  %407 = zext nneg i32 %15 to i64
  %408 = getelementptr inbounds float, ptr addrspace(1) %10, i64 %407
  store <4 x float> %406, ptr addrspace(1) %408, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @wrapped_iota_2(ptr noalias writeonly align 256 captures(none) dereferenceable(2703360) %0) local_unnamed_addr #5 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !536
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
define ptx_kernel void @sort_6_0(ptr noalias align 256 captures(none) dereferenceable(2703360) %arg0, ptr noalias align 256 captures(none) dereferenceable(2703360) %arg1) local_unnamed_addr #8 {
entry:
  %0 = addrspacecast ptr %arg1 to ptr addrspace(1)
  %1 = addrspacecast ptr %arg0 to ptr addrspace(1)
  %2 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !247
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
  %12 = getelementptr inbounds [4096 x [165 x i32]], ptr addrspace(1) %0, i64 0, i64 %5, i64 %7
  store i32 %11, ptr addrspace(1) %12, align 4
  br label %sort.6.0.in_bounds-after

sort.6.0.in_bounds-after:                         ; preds = %sort.6.0.in_bounds-after.critedge, %is_last_tile-after523, %inner_smaller_keys_index-true538
  ret void

smaller_keys_index-after2.critedge:               ; preds = %smaller_keys_index-true
  %13 = getelementptr inbounds [4096 x [165 x i32]], ptr addrspace(1) %0, i64 0, i64 %5, i64 %7
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
  %97 = getelementptr inbounds [4096 x [165 x float]], ptr addrspace(1) %1, i64 0, i64 %5, i64 %7
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
  %105 = getelementptr inbounds [4096 x [165 x i32]], ptr addrspace(1) %0, i64 0, i64 %5, i64 %7
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
  %794 = getelementptr inbounds [4096 x [165 x float]], ptr addrspace(1) %1, i64 0, i64 %5, i64 %7
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
  %804 = getelementptr inbounds [4096 x [165 x i32]], ptr addrspace(1) %0, i64 0, i64 %5, i64 %7
  store i32 %802, ptr addrspace(1) %804, align 4
  %805 = getelementptr inbounds i8, ptr addrspace(1) %804, i64 4
  store i32 %803, ptr addrspace(1) %805, align 4
  br label %sort.6.0.in_bounds-after
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @loop_compare_gather_select_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(229376) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %5, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %6, ptr noalias readonly align 256 captures(none) dereferenceable(2703360) %7, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %8, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %9, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %10, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %11, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %12, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %13, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %14, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %15, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %16, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %17, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %18, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %19, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %20, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %21, ptr noalias writeonly align 256 captures(none) dereferenceable(16384) %22) local_unnamed_addr #4 {
  %24 = addrspacecast ptr %1 to ptr addrspace(1)
  %25 = addrspacecast ptr %2 to ptr addrspace(1)
  %26 = addrspacecast ptr %0 to ptr addrspace(1)
  %27 = addrspacecast ptr %4 to ptr addrspace(1)
  %28 = addrspacecast ptr %3 to ptr addrspace(1)
  %29 = addrspacecast ptr %5 to ptr addrspace(1)
  %30 = addrspacecast ptr %6 to ptr addrspace(1)
  %31 = addrspacecast ptr %9 to ptr addrspace(1)
  %32 = addrspacecast ptr %8 to ptr addrspace(1)
  %33 = addrspacecast ptr %7 to ptr addrspace(1)
  %34 = addrspacecast ptr %10 to ptr addrspace(1)
  %35 = addrspacecast ptr %11 to ptr addrspace(1)
  %36 = addrspacecast ptr %12 to ptr addrspace(1)
  %37 = addrspacecast ptr %13 to ptr addrspace(1)
  %38 = addrspacecast ptr %14 to ptr addrspace(1)
  %39 = addrspacecast ptr %15 to ptr addrspace(1)
  %40 = addrspacecast ptr %16 to ptr addrspace(1)
  %41 = addrspacecast ptr %17 to ptr addrspace(1)
  %42 = addrspacecast ptr %18 to ptr addrspace(1)
  %43 = addrspacecast ptr %19 to ptr addrspace(1)
  %44 = addrspacecast ptr %20 to ptr addrspace(1)
  %45 = addrspacecast ptr %21 to ptr addrspace(1)
  %46 = addrspacecast ptr %22 to ptr addrspace(1)
  %47 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %48 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %49 = shl nuw nsw i32 %47, 7
  %50 = or disjoint i32 %49, %48
  %51 = zext nneg i32 %50 to i64
  %52 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %51
  %53 = load i32, ptr addrspace(1) %52, align 4, !invariant.load !4
  %54 = getelementptr inbounds i32, ptr addrspace(1) %25, i64 %51
  %55 = load i32, ptr addrspace(1) %54, align 4, !invariant.load !4
  %56 = icmp sge i32 %53, %55
  %57 = add i32 %53, 14
  %58 = select i1 %56, i32 %53, i32 %57
  %59 = tail call i32 @llvm.smax.i32(i32 %58, i32 0)
  %60 = tail call i32 @llvm.umin.i32(i32 %59, i32 13)
  %61 = mul nuw nsw i32 %50, 14
  %62 = add nuw nsw i32 %60, %61
  %63 = zext nneg i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr addrspace(1) %26, i64 %63
  %65 = load i32, ptr addrspace(1) %64, align 4, !invariant.load !4
  %66 = icmp eq i32 %65, 0
  %67 = select i1 %66, i32 -1, i32 1
  %68 = zext i1 %56 to i8
  tail call void @llvm.experimental.noalias.scope.decl(metadata !537)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !540)
  %69 = getelementptr inbounds i32, ptr addrspace(1) %27, i64 %63
  %70 = load i32, ptr addrspace(1) %69, align 4, !invariant.load !4, !alias.scope !540, !noalias !537
  %71 = tail call i32 @llvm.smax.i32(i32 %70, i32 0)
  %72 = tail call i32 @llvm.umin.i32(i32 %71, i32 100)
  %73 = mul nuw nsw i32 %72, 20
  %74 = zext nneg i32 %73 to i64
  %75 = getelementptr inbounds float, ptr addrspace(1) %28, i64 %74
  %76 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 28
  %77 = load float, ptr addrspace(1) %76, align 4, !invariant.load !4, !alias.scope !537, !noalias !540
  %78 = fcmp ule float %77, 0.000000e+00
  %79 = zext i1 %78 to i8
  %80 = getelementptr inbounds i32, ptr addrspace(1) %29, i64 %63
  %81 = load i32, ptr addrspace(1) %80, align 4, !invariant.load !4
  %82 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 20
  %83 = load float, ptr addrspace(1) %82, align 4, !invariant.load !4, !alias.scope !542, !noalias !545
  %.inv = fcmp ole float %83, 0xC1E0000000000000
  %84 = select i1 %.inv, float 0xC1E0000000000000, float %83
  %85 = fptosi float %84 to i32
  %86 = fcmp oge float %83, 0x41E0000000000000
  %87 = select i1 %86, i32 2147483647, i32 %85
  %88 = fcmp uno float %83, 0.000000e+00
  %89 = select i1 %88, i32 0, i32 %87
  %90 = getelementptr inbounds i8, ptr addrspace(1) %75, i64 36
  %91 = load float, ptr addrspace(1) %90, align 4, !invariant.load !4, !alias.scope !547, !noalias !550
  %92 = fcmp ogt float %91, 0.000000e+00
  %93 = zext i1 %92 to i8
  %94 = tail call i32 @llvm.smax.i32(i32 %55, i32 %53)
  %95 = icmp sgt i32 %94, 6
  %96 = zext i1 %95 to i32
  %97 = xor i1 %95, true
  %98 = zext i1 %97 to i8
  %99 = shl nuw nsw i32 %48, 1
  %100 = shl nuw nsw i32 %47, 8
  %101 = or disjoint i32 %99, %100
  %102 = zext nneg i32 %101 to i64
  %103 = getelementptr inbounds i32, ptr addrspace(1) %30, i64 %102
  %104 = load <2 x i32>, ptr addrspace(1) %103, align 8, !invariant.load !4
  %105 = extractelement <2 x i32> %104, i32 0
  %106 = extractelement <2 x i32> %104, i32 1
  %107 = tail call i32 @llvm.smax.i32(i32 %105, i32 0)
  %108 = tail call i32 @llvm.umin.i32(i32 %107, i32 4095)
  %109 = tail call i32 @llvm.smax.i32(i32 %106, i32 0)
  %110 = tail call i32 @llvm.umin.i32(i32 %109, i32 13)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !552)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !555)
  %111 = mul nuw nsw i32 %108, 14
  %112 = add nuw nsw i32 %111, %110
  %113 = zext nneg i32 %112 to i64
  %114 = getelementptr inbounds i32, ptr addrspace(1) %27, i64 %113
  %115 = load i32, ptr addrspace(1) %114, align 4, !invariant.load !4, !alias.scope !555, !noalias !552
  %116 = tail call i32 @llvm.smax.i32(i32 %115, i32 0)
  %117 = tail call i32 @llvm.umin.i32(i32 %116, i32 100)
  %118 = mul nuw nsw i32 %117, 20
  %119 = zext nneg i32 %118 to i64
  %120 = getelementptr inbounds float, ptr addrspace(1) %28, i64 %119
  %121 = getelementptr inbounds i8, ptr addrspace(1) %120, i64 36
  %122 = load float, ptr addrspace(1) %121, align 4, !invariant.load !4, !alias.scope !552, !noalias !555
  %123 = fcmp ogt float %122, 0.000000e+00
  %124 = zext i1 %123 to i8
  %125 = getelementptr inbounds i8, ptr addrspace(1) %120, i64 20
  %126 = load float, ptr addrspace(1) %125, align 4, !invariant.load !4, !alias.scope !557, !noalias !560
  %.inv1 = fcmp ole float %126, 0xC1E0000000000000
  %127 = select i1 %.inv1, float 0xC1E0000000000000, float %126
  %128 = fptosi float %127 to i32
  %129 = fcmp oge float %126, 0x41E0000000000000
  %130 = select i1 %129, i32 2147483647, i32 %128
  %131 = fcmp uno float %126, 0.000000e+00
  %132 = select i1 %131, i32 0, i32 %130
  %133 = getelementptr inbounds i8, ptr addrspace(1) %120, i64 28
  %134 = load float, ptr addrspace(1) %133, align 4, !invariant.load !4, !alias.scope !562, !noalias !565
  %135 = fcmp ule float %134, 0.000000e+00
  %136 = zext i1 %135 to i8
  %137 = getelementptr inbounds i32, ptr addrspace(1) %31, i64 %51
  %138 = load i32, ptr addrspace(1) %137, align 4, !invariant.load !4, !alias.scope !567
  %139 = getelementptr inbounds i32, ptr addrspace(1) %32, i64 %51
  %140 = load i32, ptr addrspace(1) %139, align 4, !invariant.load !4, !alias.scope !574
  %141 = add i32 %140, %138
  %142 = tail call i32 @llvm.fshl.i32(i32 %140, i32 %140, i32 13)
  %143 = xor i32 %141, %142
  %144 = add i32 %143, %141
  %145 = tail call i32 @llvm.fshl.i32(i32 %143, i32 %143, i32 15)
  %146 = xor i32 %144, %145
  %147 = add i32 %146, %144
  %148 = tail call i32 @llvm.fshl.i32(i32 %146, i32 %146, i32 26)
  %149 = xor i32 %147, %148
  %150 = add i32 %149, %147
  %151 = add i32 %150, %140
  %152 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 6)
  %153 = xor i32 %150, %152
  %154 = xor i32 %138, %140
  %155 = xor i32 %154, 466688986
  %156 = add i32 %155, 1
  %157 = add i32 %156, %153
  %158 = add i32 %151, %157
  %159 = tail call i32 @llvm.fshl.i32(i32 %157, i32 %157, i32 17)
  %160 = xor i32 %158, %159
  %161 = add i32 %160, %158
  %162 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 29)
  %163 = xor i32 %161, %162
  %164 = add i32 %163, %161
  %165 = tail call i32 @llvm.fshl.i32(i32 %163, i32 %163, i32 16)
  %166 = xor i32 %164, %165
  %167 = add i32 %166, %164
  %168 = add i32 %167, %155
  %169 = tail call i32 @llvm.fshl.i32(i32 %166, i32 %166, i32 24)
  %170 = xor i32 %167, %169
  %171 = add i32 %138, 2
  %172 = add i32 %171, %170
  %173 = add i32 %168, %172
  %174 = tail call i32 @llvm.fshl.i32(i32 %172, i32 %172, i32 13)
  %175 = xor i32 %173, %174
  %176 = add i32 %175, %173
  %177 = tail call i32 @llvm.fshl.i32(i32 %175, i32 %175, i32 15)
  %178 = xor i32 %176, %177
  %179 = add i32 %178, %176
  %180 = tail call i32 @llvm.fshl.i32(i32 %178, i32 %178, i32 26)
  %181 = xor i32 %179, %180
  %182 = add i32 %181, %179
  %183 = add i32 %182, %138
  %184 = tail call i32 @llvm.fshl.i32(i32 %181, i32 %181, i32 6)
  %185 = xor i32 %182, %184
  %186 = add i32 %140, 3
  %187 = add i32 %186, %185
  %188 = add i32 %183, %187
  %189 = tail call i32 @llvm.fshl.i32(i32 %187, i32 %187, i32 17)
  %190 = xor i32 %188, %189
  %191 = add i32 %190, %188
  %192 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %190, i32 29)
  %193 = xor i32 %191, %192
  %194 = add i32 %193, %191
  %195 = tail call i32 @llvm.fshl.i32(i32 %193, i32 %193, i32 16)
  %196 = xor i32 %194, %195
  %197 = add i32 %196, %194
  %198 = add i32 %197, %140
  %199 = tail call i32 @llvm.fshl.i32(i32 %196, i32 %196, i32 24)
  %200 = xor i32 %197, %199
  %201 = add i32 %155, 4
  %202 = add i32 %201, %200
  %203 = add i32 %198, %202
  %204 = tail call i32 @llvm.fshl.i32(i32 %202, i32 %202, i32 13)
  %205 = xor i32 %203, %204
  %206 = add i32 %205, %203
  %207 = tail call i32 @llvm.fshl.i32(i32 %205, i32 %205, i32 15)
  %208 = xor i32 %206, %207
  %209 = add i32 %208, %206
  %210 = tail call i32 @llvm.fshl.i32(i32 %208, i32 %208, i32 26)
  %211 = xor i32 %209, %210
  %212 = add i32 %211, %209
  %213 = add i32 %212, %155
  %214 = tail call i32 @llvm.fshl.i32(i32 %211, i32 %211, i32 6)
  %215 = xor i32 %212, %214
  %216 = add i32 %138, 5
  %217 = add i32 %216, %215
  %218 = xor i32 %217, %213
  %219 = urem i32 %218, 9
  %220 = shl nuw nsw i32 %219, 2
  %221 = getelementptr inbounds i8, ptr addrspace(1) %137, i64 16384
  %222 = load i32, ptr addrspace(1) %221, align 4, !invariant.load !4, !alias.scope !581
  %223 = getelementptr inbounds i8, ptr addrspace(1) %139, i64 16384
  %224 = load i32, ptr addrspace(1) %223, align 4, !invariant.load !4, !alias.scope !588
  %225 = add i32 %224, %222
  %226 = tail call i32 @llvm.fshl.i32(i32 %224, i32 %224, i32 13)
  %227 = xor i32 %225, %226
  %228 = add i32 %227, %225
  %229 = tail call i32 @llvm.fshl.i32(i32 %227, i32 %227, i32 15)
  %230 = xor i32 %228, %229
  %231 = add i32 %230, %228
  %232 = tail call i32 @llvm.fshl.i32(i32 %230, i32 %230, i32 26)
  %233 = xor i32 %231, %232
  %234 = add i32 %233, %231
  %235 = add i32 %234, %224
  %236 = tail call i32 @llvm.fshl.i32(i32 %233, i32 %233, i32 6)
  %237 = xor i32 %234, %236
  %238 = xor i32 %222, %224
  %239 = xor i32 %238, 466688986
  %240 = add i32 %239, 1
  %241 = add i32 %240, %237
  %242 = add i32 %235, %241
  %243 = tail call i32 @llvm.fshl.i32(i32 %241, i32 %241, i32 17)
  %244 = xor i32 %242, %243
  %245 = add i32 %244, %242
  %246 = tail call i32 @llvm.fshl.i32(i32 %244, i32 %244, i32 29)
  %247 = xor i32 %245, %246
  %248 = add i32 %247, %245
  %249 = tail call i32 @llvm.fshl.i32(i32 %247, i32 %247, i32 16)
  %250 = xor i32 %248, %249
  %251 = add i32 %250, %248
  %252 = add i32 %251, %239
  %253 = tail call i32 @llvm.fshl.i32(i32 %250, i32 %250, i32 24)
  %254 = xor i32 %251, %253
  %255 = add i32 %222, 2
  %256 = add i32 %255, %254
  %257 = add i32 %252, %256
  %258 = tail call i32 @llvm.fshl.i32(i32 %256, i32 %256, i32 13)
  %259 = xor i32 %257, %258
  %260 = add i32 %259, %257
  %261 = tail call i32 @llvm.fshl.i32(i32 %259, i32 %259, i32 15)
  %262 = xor i32 %260, %261
  %263 = add i32 %262, %260
  %264 = tail call i32 @llvm.fshl.i32(i32 %262, i32 %262, i32 26)
  %265 = xor i32 %263, %264
  %266 = add i32 %265, %263
  %267 = add i32 %266, %222
  %268 = tail call i32 @llvm.fshl.i32(i32 %265, i32 %265, i32 6)
  %269 = xor i32 %266, %268
  %270 = add i32 %224, 3
  %271 = add i32 %270, %269
  %272 = add i32 %267, %271
  %273 = tail call i32 @llvm.fshl.i32(i32 %271, i32 %271, i32 17)
  %274 = xor i32 %272, %273
  %275 = add i32 %274, %272
  %276 = tail call i32 @llvm.fshl.i32(i32 %274, i32 %274, i32 29)
  %277 = xor i32 %275, %276
  %278 = add i32 %277, %275
  %279 = tail call i32 @llvm.fshl.i32(i32 %277, i32 %277, i32 16)
  %280 = xor i32 %278, %279
  %281 = add i32 %280, %278
  %282 = add i32 %281, %224
  %283 = tail call i32 @llvm.fshl.i32(i32 %280, i32 %280, i32 24)
  %284 = xor i32 %281, %283
  %285 = add i32 %239, 4
  %286 = add i32 %285, %284
  %287 = add i32 %282, %286
  %288 = tail call i32 @llvm.fshl.i32(i32 %286, i32 %286, i32 13)
  %289 = xor i32 %287, %288
  %290 = add i32 %289, %287
  %291 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 15)
  %292 = xor i32 %290, %291
  %293 = add i32 %292, %290
  %294 = tail call i32 @llvm.fshl.i32(i32 %292, i32 %292, i32 26)
  %295 = xor i32 %293, %294
  %296 = add i32 %295, %293
  %297 = add i32 %296, %239
  %298 = tail call i32 @llvm.fshl.i32(i32 %295, i32 %295, i32 6)
  %299 = xor i32 %296, %298
  %300 = add i32 %222, 5
  %301 = add i32 %300, %299
  %302 = xor i32 %301, %297
  %303 = urem i32 %302, 9
  %304 = add nuw nsw i32 %303, %220
  %.lhs.trunc = trunc nuw nsw i32 %304 to i8
  %305 = urem i8 %.lhs.trunc, 9
  %.zext = zext nneg i8 %305 to i32
  %306 = sub nuw nsw i32 164, %.zext
  %307 = icmp slt i32 %306, %55
  %308 = sub nuw nsw i32 329, %.zext
  %309 = select i1 %307, i32 %308, i32 %306
  %310 = tail call i32 @llvm.umin.i32(i32 %309, i32 164)
  %311 = mul nuw nsw i32 %50, 165
  %312 = add nuw nsw i32 %310, %311
  %313 = zext nneg i32 %312 to i64
  %314 = getelementptr inbounds float, ptr addrspace(1) %33, i64 %313
  %315 = load float, ptr addrspace(1) %314, align 4, !invariant.load !4
  %316 = getelementptr inbounds i32, ptr addrspace(1) %34, i64 %51
  store i32 %67, ptr addrspace(1) %316, align 4
  %317 = getelementptr inbounds i32, ptr addrspace(1) %35, i64 %51
  store i32 %65, ptr addrspace(1) %317, align 4
  %318 = getelementptr inbounds i8, ptr addrspace(1) %36, i64 %51
  store i8 %68, ptr addrspace(1) %318, align 1
  %319 = getelementptr inbounds i8, ptr addrspace(1) %37, i64 %51
  store i8 %79, ptr addrspace(1) %319, align 1
  %320 = getelementptr inbounds i32, ptr addrspace(1) %38, i64 %51
  store i32 %81, ptr addrspace(1) %320, align 4
  %321 = getelementptr inbounds i32, ptr addrspace(1) %39, i64 %51
  store i32 %89, ptr addrspace(1) %321, align 4
  %322 = getelementptr inbounds i8, ptr addrspace(1) %40, i64 %51
  store i8 %93, ptr addrspace(1) %322, align 1
  %323 = getelementptr inbounds i32, ptr addrspace(1) %41, i64 %51
  store i32 %96, ptr addrspace(1) %323, align 4
  %324 = getelementptr inbounds i8, ptr addrspace(1) %42, i64 %51
  store i8 %98, ptr addrspace(1) %324, align 1
  %325 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 %51
  store i8 %124, ptr addrspace(1) %325, align 1
  %326 = getelementptr inbounds i32, ptr addrspace(1) %44, i64 %51
  store i32 %132, ptr addrspace(1) %326, align 4
  %327 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 %51
  store i8 %136, ptr addrspace(1) %327, align 1
  %328 = getelementptr inbounds float, ptr addrspace(1) %46, i64 %51
  store float %315, ptr addrspace(1) %328, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_transpose_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(229376) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(458752) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !595
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_transpose_fusion_2(ptr noalias readonly align 256 captures(none) dereferenceable(229376) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(458752) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(458752) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !595
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
define ptx_kernel void @loop_broadcast_fusion_5(ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %4) local_unnamed_addr #5 {
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !536
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
define ptx_kernel void @input_scatter_fusion_15(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(458752) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2) local_unnamed_addr #9 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = addrspacecast ptr %2 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
  %9 = shl nuw nsw i32 %7, 1
  %10 = shl nuw nsw i32 %8, 8
  %11 = or disjoint i32 %9, %10
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %12
  %14 = load <2 x i32>, ptr addrspace(1) %13, align 8, !invariant.load !4
  %15 = extractelement <2 x i32> %14, i32 0
  %16 = extractelement <2 x i32> %14, i32 1
  %17 = icmp ult i32 %15, 4096
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

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_14(ptr noalias align 256 dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(458752) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4) local_unnamed_addr #9 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
  %13 = shl nuw nsw i32 %11, 1
  %14 = shl nuw nsw i32 %12, 8
  %15 = or disjoint i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %16
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !4
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = icmp ult i32 %19, 4096
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
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = tail call i32 @llvm.umin.i32(i32 %32, i32 100)
  %34 = mul nuw nsw i32 %33, 20
  %35 = zext nneg i32 %34 to i64
  %36 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %35
  %37 = getelementptr inbounds i8, ptr addrspace(1) %36, i64 36
  %38 = load float, ptr addrspace(1) %37, align 4, !invariant.load !4
  %39 = fcmp ogt float %38, 0.000000e+00
  %40 = and i8 %29, 1
  %41 = select i1 %39, i8 %40, i8 0
  %42 = mul nuw nsw i32 %19, 165
  %43 = add nuw nsw i32 %42, %20
  %44 = zext nneg i32 %43 to i64
  %45 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %44
  %46 = addrspacecast ptr addrspace(1) %45 to ptr
  %47 = ptrtoint ptr %46 to i64
  %48 = and i64 %47, 3
  %49 = sub nsw i64 0, %48
  %50 = getelementptr inbounds i8, ptr addrspace(1) %45, i64 %49
  %51 = trunc nuw nsw i64 %48 to i32
  %52 = shl nuw nsw i32 %51, 3
  %53 = shl nuw i32 255, %52
  %54 = xor i32 %53, -1
  %55 = load i32, ptr addrspace(1) %50, align 4
  br label %56

56:                                               ; preds = %56, %24
  %57 = phi i32 [ %66, %56 ], [ %55, %24 ]
  %58 = lshr i32 %57, %52
  %59 = trunc i32 %58 to i8
  %60 = or i8 %41, %59
  %61 = zext i8 %60 to i32
  %62 = and i32 %57, %54
  %63 = shl nuw i32 %61, %52
  %64 = or i32 %63, %62
  %65 = cmpxchg ptr addrspace(1) %50, i32 %57, i32 %64 monotonic monotonic, align 4
  %66 = extractvalue { i32, i1 } %65, 0
  %67 = extractvalue { i32, i1 } %65, 1
  br i1 %67, label %.loopexit, label %56

.loopexit:                                        ; preds = %56, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_and_or_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(165) %1, ptr noalias readonly align 256 captures(none) dereferenceable(2703360) %2, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %0 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %1 to ptr addrspace(1)
  %11 = addrspacecast ptr %4 to ptr addrspace(1)
  %12 = addrspacecast ptr %5 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !536
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
  %25 = zext nneg i32 %23 to i64
  %26 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %25
  %27 = load float, ptr addrspace(1) %26, align 4, !invariant.load !4
  %28 = zext nneg i32 %.decomposed to i64
  %29 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %28
  %30 = load i8, ptr addrspace(1) %29, align 1, !invariant.load !4
  %31 = or disjoint i32 %17, 1
  %32 = udiv i32 %31, 165
  %33 = mul i32 %32, 165
  %.decomposed1 = sub i32 %31, %33
  %34 = zext nneg i32 %32 to i64
  %35 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %34
  %36 = load float, ptr addrspace(1) %35, align 4, !invariant.load !4
  %37 = zext nneg i32 %.decomposed1 to i64
  %38 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %37
  %39 = load i8, ptr addrspace(1) %38, align 1, !invariant.load !4
  %40 = or disjoint i32 %17, 2
  %41 = udiv i32 %40, 165
  %42 = mul i32 %41, 165
  %.decomposed2 = sub i32 %40, %42
  %43 = zext nneg i32 %41 to i64
  %44 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4, !invariant.load !4
  %46 = zext nneg i32 %.decomposed2 to i64
  %47 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %46
  %48 = load i8, ptr addrspace(1) %47, align 1, !invariant.load !4
  %49 = or disjoint i32 %17, 3
  %50 = udiv i32 %49, 165
  %51 = mul i32 %50, 165
  %.decomposed3 = sub i32 %49, %51
  %52 = zext nneg i32 %50 to i64
  %53 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %52
  %54 = load float, ptr addrspace(1) %53, align 4, !invariant.load !4
  %55 = zext nneg i32 %.decomposed3 to i64
  %56 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %55
  %57 = load i8, ptr addrspace(1) %56, align 1, !invariant.load !4
  %58 = insertelement <4 x float> poison, float %27, i64 0
  %59 = insertelement <4 x float> %58, float %36, i64 1
  %60 = insertelement <4 x float> %59, float %45, i64 2
  %61 = insertelement <4 x float> %60, float %54, i64 3
  %62 = fcmp ogt <4 x float> %22, %61
  %63 = insertelement <4 x i8> poison, i8 %30, i64 0
  %64 = insertelement <4 x i8> %63, i8 %39, i64 1
  %65 = insertelement <4 x i8> %64, i8 %48, i64 2
  %66 = insertelement <4 x i8> %65, i8 %57, i64 3
  %67 = and <4 x i8> %66, splat (i8 1)
  %68 = select <4 x i1> %62, <4 x i8> %67, <4 x i8> zeroinitializer
  %69 = or <4 x i8> %68, %20
  %70 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %18
  store <4 x i8> %69, ptr addrspace(1) %70, align 4
  %71 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %18
  store <4 x i8> %68, ptr addrspace(1) %71, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_32(ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2) local_unnamed_addr #4 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %9 = shl nuw nsw i32 %8, 7
  %10 = or disjoint i32 %9, %7
  tail call void @llvm.experimental.noalias.scope.decl(metadata !596)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !599)
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %11
  %13 = load i32, ptr addrspace(1) %12, align 4, !invariant.load !4, !alias.scope !599, !noalias !596
  %14 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %11
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !596, !noalias !599
  %16 = icmp slt i32 %15, %13
  %17 = add i32 %15, 165
  %18 = select i1 %16, i32 %17, i32 %15
  %19 = icmp ult i32 %18, 165
  %20 = mul nuw nsw i32 %10, 165
  %21 = add nuw nsw i32 %18, %20
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %22
  br i1 %19, label %24, label %25

24:                                               ; preds = %3
  store i8 0, ptr addrspace(1) %23, align 1
  br label %25

25:                                               ; preds = %24, %3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_30(ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %3, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5) local_unnamed_addr #4 {
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %1 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = addrspacecast ptr %3 to ptr addrspace(1)
  %11 = addrspacecast ptr %4 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %15 = shl nuw nsw i32 %14, 7
  %16 = or disjoint i32 %15, %13
  tail call void @llvm.experimental.noalias.scope.decl(metadata !601)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !604)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !606)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !608)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !610)
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %17
  %19 = load i32, ptr addrspace(1) %18, align 4, !invariant.load !4, !alias.scope !604, !noalias !612
  %20 = srem i32 %19, 15
  %21 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %17
  %22 = load i32, ptr addrspace(1) %21, align 4, !invariant.load !4, !alias.scope !601, !noalias !613
  %23 = icmp slt i32 %20, %22
  %24 = add nsw i32 %20, 15
  %25 = select i1 %23, i32 %24, i32 %20
  %26 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %17
  %27 = load i32, ptr addrspace(1) %26, align 4, !invariant.load !4, !alias.scope !610, !noalias !614
  %28 = icmp eq i32 %27, 0
  %29 = icmp sgt i32 %25, 0
  %30 = icmp slt i32 %25, 14
  %31 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %17
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4, !alias.scope !606, !noalias !615
  %33 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %17
  %34 = load i8, ptr addrspace(1) %33, align 1, !invariant.load !4, !alias.scope !608, !noalias !616
  %.v.i = select i1 %28, i1 %29, i1 %30
  %35 = add i32 %32, %19
  %36 = tail call i32 @llvm.smax.i32(i32 %22, i32 %35)
  %37 = tail call i32 @llvm.smin.i32(i32 %36, i32 164)
  %38 = trunc i8 %34 to i1
  %39 = select i1 %.v.i, i1 %38, i1 false
  %40 = select i1 %39, i32 %37, i32 %19
  %41 = icmp slt i32 %40, %22
  %42 = add i32 %40, 165
  %43 = select i1 %41, i32 %42, i32 %40
  %44 = icmp ult i32 %43, 165
  %45 = mul nuw nsw i32 %16, 165
  %46 = add nuw nsw i32 %43, %45
  %47 = zext nneg i32 %46 to i64
  %48 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %47
  br i1 %44, label %49, label %50

49:                                               ; preds = %6
  store i8 0, ptr addrspace(1) %48, align 1
  br label %50

50:                                               ; preds = %49, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_31(ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %2, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %3) local_unnamed_addr #4 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %11 = shl nuw nsw i32 %10, 7
  %12 = or disjoint i32 %11, %9
  tail call void @llvm.experimental.noalias.scope.decl(metadata !617)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !620)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !622)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %13
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !617, !noalias !624
  %16 = shl nuw nsw i32 %12, 1
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %17
  %19 = load <2 x i32>, ptr addrspace(1) %18, align 8, !invariant.load !4, !alias.scope !622, !noalias !625
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %23 = tail call i32 @llvm.umin.i32(i32 %22, i32 4095)
  %24 = tail call i32 @llvm.smax.i32(i32 %21, i32 0)
  %25 = tail call i32 @llvm.umin.i32(i32 %24, i32 13)
  %26 = mul nuw nsw i32 %23, 14
  %27 = add nuw nsw i32 %26, %25
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4, !alias.scope !620, !noalias !626
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_29(ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %2, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %5) local_unnamed_addr #4 {
  %7 = addrspacecast ptr %5 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %3 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %15 = shl nuw nsw i32 %14, 7
  %16 = or disjoint i32 %15, %13
  tail call void @llvm.experimental.noalias.scope.decl(metadata !627)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !630)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !632)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !634)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !636)
  %17 = shl nuw nsw i32 %16, 1
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %18
  %20 = load <2 x i32>, ptr addrspace(1) %19, align 8, !invariant.load !4, !alias.scope !636, !noalias !638
  %21 = extractelement <2 x i32> %20, i32 0
  %22 = extractelement <2 x i32> %20, i32 1
  %23 = tail call i32 @llvm.smax.i32(i32 %21, i32 0)
  %24 = tail call i32 @llvm.umin.i32(i32 %23, i32 4095)
  %25 = tail call i32 @llvm.smax.i32(i32 %22, i32 0)
  %26 = tail call i32 @llvm.umin.i32(i32 %25, i32 13)
  %27 = mul nuw nsw i32 %24, 14
  %28 = add nuw nsw i32 %27, %26
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %29
  %31 = load i32, ptr addrspace(1) %30, align 4, !invariant.load !4, !alias.scope !634, !noalias !639
  %32 = srem i32 %31, 15
  %33 = zext nneg i32 %16 to i64
  %34 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %33
  %35 = load i32, ptr addrspace(1) %34, align 4, !invariant.load !4, !alias.scope !627, !noalias !640
  %36 = icmp slt i32 %32, %35
  %37 = add nsw i32 %32, 15
  %38 = select i1 %36, i32 %37, i32 %32
  %39 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %33
  %40 = load i8, ptr addrspace(1) %39, align 1, !invariant.load !4, !alias.scope !632, !noalias !641
  %41 = icmp sgt i32 %38, 0
  %42 = icmp slt i32 %38, 14
  %43 = trunc i8 %40 to i1
  %44 = select i1 %43, i32 -1, i32 1
  %45 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %33
  %46 = load i8, ptr addrspace(1) %45, align 1, !invariant.load !4, !alias.scope !630, !noalias !642
  %.v.i = select i1 %43, i1 %41, i1 %42
  %47 = add i32 %44, %31
  %48 = tail call i32 @llvm.smax.i32(i32 %35, i32 %47)
  %49 = tail call i32 @llvm.smin.i32(i32 %48, i32 164)
  %50 = trunc i8 %46 to i1
  %51 = select i1 %.v.i, i1 %50, i1 false
  %52 = select i1 %51, i32 %49, i32 %31
  %53 = icmp slt i32 %52, %35
  %54 = add i32 %52, 165
  %55 = select i1 %53, i32 %54, i32 %52
  %56 = icmp ult i32 %55, 165
  %57 = mul nuw nsw i32 %16, 165
  %58 = add nuw nsw i32 %55, %57
  %59 = zext nneg i32 %58 to i64
  %60 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %59
  br i1 %56, label %61, label %62

61:                                               ; preds = %6
  store i8 0, ptr addrspace(1) %60, align 1
  br label %62

62:                                               ; preds = %61, %6
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_7(ptr noalias writeonly align 256 captures(none) dereferenceable(2703360) %0) local_unnamed_addr #5 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !536
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
define ptx_kernel void @input_scatter_fusion_8(ptr noalias align 256 captures(none) dereferenceable(2703360) %0, ptr noalias readonly align 256 captures(none) dereferenceable(458752) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2) local_unnamed_addr #10 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = addrspacecast ptr %2 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
  %9 = shl nuw nsw i32 %7, 1
  %10 = shl nuw nsw i32 %8, 8
  %11 = or disjoint i32 %9, %10
  %12 = zext nneg i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %12
  %14 = load <2 x i32>, ptr addrspace(1) %13, align 8, !invariant.load !4
  %15 = extractelement <2 x i32> %14, i32 0
  %16 = extractelement <2 x i32> %14, i32 1
  %17 = icmp ult i32 %15, 4096
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
define ptx_kernel void @input_scatter_fusion_7(ptr noalias align 256 captures(none) dereferenceable(2703360) %0, ptr noalias readonly align 256 captures(none) dereferenceable(458752) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4) local_unnamed_addr #10 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
  %13 = shl nuw nsw i32 %11, 1
  %14 = shl nuw nsw i32 %12, 8
  %15 = or disjoint i32 %13, %14
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %16
  %18 = load <2 x i32>, ptr addrspace(1) %17, align 8, !invariant.load !4
  %19 = extractelement <2 x i32> %18, i32 0
  %20 = extractelement <2 x i32> %18, i32 1
  %21 = icmp ult i32 %19, 4096
  %22 = icmp ult i32 %20, 165
  %23 = and i1 %21, %22
  br i1 %23, label %24, label %49

24:                                               ; preds = %5
  %25 = shl nuw nsw i32 %12, 7
  %26 = or disjoint i32 %25, %11
  %27 = urem i32 %26, 14
  %28 = zext nneg i32 %26 to i64
  %29 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %28
  %30 = load i8, ptr addrspace(1) %29, align 1, !invariant.load !4
  %31 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %28
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4
  %33 = tail call i32 @llvm.smax.i32(i32 %32, i32 0)
  %34 = tail call i32 @llvm.umin.i32(i32 %33, i32 100)
  %35 = mul nuw nsw i32 %34, 20
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr inbounds float, ptr addrspace(1) %9, i64 %36
  %38 = getelementptr inbounds i8, ptr addrspace(1) %37, i64 36
  %39 = load float, ptr addrspace(1) %38, align 4, !invariant.load !4
  %40 = fcmp ogt float %39, 0.000000e+00
  %41 = trunc i8 %30 to i1
  %42 = select i1 %40, i1 %41, i1 false
  %43 = select i1 %42, i32 %27, i32 -1
  %44 = mul nuw nsw i32 %19, 165
  %45 = add nuw nsw i32 %44, %20
  %46 = zext nneg i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %46
  %48 = atomicrmw max ptr addrspace(1) %47, i32 %43 monotonic, align 4
  br label %49

49:                                               ; preds = %24, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_and_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(57344) %0, ptr noalias readonly align 256 captures(none) dereferenceable(2703360) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %3 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %0 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !536
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
  %22 = tail call i32 @llvm.umin.i32(i32 %19, i32 4095)
  %23 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %24 = tail call i32 @llvm.umin.i32(i32 %23, i32 13)
  %25 = mul nuw nsw i32 %22, 14
  %26 = add nuw nsw i32 %24, %25
  %27 = zext nneg i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %27
  %29 = load i32, ptr addrspace(1) %28, align 4, !invariant.load !4
  %30 = zext nneg i32 %19 to i64
  %31 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %30
  %32 = load i32, ptr addrspace(1) %31, align 4, !invariant.load !4
  %33 = icmp ne i32 %29, %32
  %34 = and i1 %21, %33
  %35 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %27
  %36 = load i8, ptr addrspace(1) %35, align 1, !invariant.load !4
  %37 = and i8 %36, 1
  %38 = select i1 %34, i8 %37, i8 0
  %39 = insertelement <4 x i8> poison, i8 %38, i64 0
  %40 = or disjoint i32 %15, 1
  %41 = udiv i32 %40, 165
  %42 = extractelement <4 x i32> %18, i64 1
  %43 = icmp sgt i32 %42, -1
  %44 = tail call i32 @llvm.umin.i32(i32 %41, i32 4095)
  %45 = tail call i32 @llvm.smax.i32(i32 %42, i32 0)
  %46 = tail call i32 @llvm.umin.i32(i32 %45, i32 13)
  %47 = mul nuw nsw i32 %44, 14
  %48 = add nuw nsw i32 %46, %47
  %49 = zext nneg i32 %48 to i64
  %50 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %49
  %51 = load i32, ptr addrspace(1) %50, align 4, !invariant.load !4
  %52 = zext nneg i32 %41 to i64
  %53 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %52
  %54 = load i32, ptr addrspace(1) %53, align 4, !invariant.load !4
  %55 = icmp ne i32 %51, %54
  %56 = and i1 %43, %55
  %57 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %49
  %58 = load i8, ptr addrspace(1) %57, align 1, !invariant.load !4
  %59 = and i8 %58, 1
  %60 = select i1 %56, i8 %59, i8 0
  %61 = insertelement <4 x i8> %39, i8 %60, i64 1
  %62 = or disjoint i32 %15, 2
  %63 = udiv i32 %62, 165
  %64 = extractelement <4 x i32> %18, i64 2
  %65 = icmp sgt i32 %64, -1
  %66 = tail call i32 @llvm.umin.i32(i32 %63, i32 4095)
  %67 = tail call i32 @llvm.smax.i32(i32 %64, i32 0)
  %68 = tail call i32 @llvm.umin.i32(i32 %67, i32 13)
  %69 = mul nuw nsw i32 %66, 14
  %70 = add nuw nsw i32 %68, %69
  %71 = zext nneg i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %71
  %73 = load i32, ptr addrspace(1) %72, align 4, !invariant.load !4
  %74 = zext nneg i32 %63 to i64
  %75 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %74
  %76 = load i32, ptr addrspace(1) %75, align 4, !invariant.load !4
  %77 = icmp ne i32 %73, %76
  %78 = and i1 %65, %77
  %79 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %71
  %80 = load i8, ptr addrspace(1) %79, align 1, !invariant.load !4
  %81 = and i8 %80, 1
  %82 = select i1 %78, i8 %81, i8 0
  %83 = insertelement <4 x i8> %61, i8 %82, i64 2
  %84 = or disjoint i32 %15, 3
  %85 = udiv i32 %84, 165
  %86 = extractelement <4 x i32> %18, i64 3
  %87 = icmp sgt i32 %86, -1
  %88 = tail call i32 @llvm.umin.i32(i32 %85, i32 4095)
  %89 = tail call i32 @llvm.smax.i32(i32 %86, i32 0)
  %90 = tail call i32 @llvm.umin.i32(i32 %89, i32 13)
  %91 = mul nuw nsw i32 %88, 14
  %92 = add nuw nsw i32 %90, %91
  %93 = zext nneg i32 %92 to i64
  %94 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %93
  %95 = load i32, ptr addrspace(1) %94, align 4, !invariant.load !4
  %96 = zext nneg i32 %85 to i64
  %97 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %96
  %98 = load i32, ptr addrspace(1) %97, align 4, !invariant.load !4
  %99 = icmp ne i32 %95, %98
  %100 = and i1 %87, %99
  %101 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %93
  %102 = load i8, ptr addrspace(1) %101, align 1, !invariant.load !4
  %103 = and i8 %102, 1
  %104 = select i1 %100, i8 %103, i8 0
  %105 = insertelement <4 x i8> %83, i8 %104, i64 3
  %106 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %16
  store <4 x i8> %105, ptr addrspace(1) %106, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @wrapped_broadcast(ptr noalias readonly align 256 captures(none) dereferenceable(27225) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(111513600) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !643
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
define ptx_kernel void @input_and_reduce_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(111513600) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %3, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %6, ptr noalias readonly align 256 captures(none) dereferenceable(165) %7, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %8, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %9, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %10, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %11, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %12, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %13, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %14, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %15) local_unnamed_addr #11 {
  %17 = addrspacecast ptr %2 to ptr addrspace(1)
  %18 = addrspacecast ptr %3 to ptr addrspace(1)
  %19 = addrspacecast ptr %6 to ptr addrspace(1)
  %20 = addrspacecast ptr %5 to ptr addrspace(1)
  %21 = addrspacecast ptr %4 to ptr addrspace(1)
  %22 = addrspacecast ptr %9 to ptr addrspace(1)
  %23 = addrspacecast ptr %10 to ptr addrspace(1)
  %24 = addrspacecast ptr %1 to ptr addrspace(1)
  %25 = addrspacecast ptr %0 to ptr addrspace(1)
  %26 = addrspacecast ptr %8 to ptr addrspace(1)
  %27 = addrspacecast ptr %7 to ptr addrspace(1)
  %28 = addrspacecast ptr %11 to ptr addrspace(1)
  %29 = addrspacecast ptr %14 to ptr addrspace(1)
  %30 = addrspacecast ptr %15 to ptr addrspace(1)
  %31 = addrspacecast ptr %13 to ptr addrspace(1)
  %32 = addrspacecast ptr %12 to ptr addrspace(1)
  %33 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !644
  %34 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !645
  %35 = shl nuw nsw i32 %34, 3
  %36 = lshr i32 %33, 5
  %37 = or disjoint i32 %35, %36
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr addrspace(1) %17, i64 %38
  %40 = load i32, ptr addrspace(1) %39, align 4, !invariant.load !4
  %41 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %38
  %42 = load i32, ptr addrspace(1) %41, align 4, !invariant.load !4
  %43 = icmp slt i32 %40, %42
  %44 = add i32 %40, 165
  %45 = select i1 %43, i32 %44, i32 %40
  %46 = tail call i32 @llvm.smax.i32(i32 %45, i32 0)
  %47 = tail call i32 @llvm.umin.i32(i32 %46, i32 164)
  %48 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 %38
  %49 = load i8, ptr addrspace(1) %48, align 1, !invariant.load !4
  %50 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %38
  %51 = load i32, ptr addrspace(1) %50, align 4, !invariant.load !4
  %52 = icmp eq i32 %51, 0
  %53 = srem i32 %40, 15
  %54 = icmp slt i32 %53, %42
  %55 = add nsw i32 %53, 15
  %56 = select i1 %54, i32 %55, i32 %53
  %57 = icmp sgt i32 %56, 0
  %58 = icmp slt i32 %56, 14
  %.v = select i1 %52, i1 %57, i1 %58
  %59 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %38
  %60 = load i32, ptr addrspace(1) %59, align 4, !invariant.load !4
  %61 = add i32 %60, %40
  %62 = tail call i32 @llvm.smax.i32(i32 %42, i32 %61)
  %63 = tail call i32 @llvm.smin.i32(i32 %62, i32 164)
  %64 = trunc i8 %49 to i1
  %65 = select i1 %.v, i1 %64, i1 false
  %66 = select i1 %65, i32 %63, i32 %40
  %67 = icmp slt i32 %66, %42
  %68 = add i32 %66, 165
  %69 = select i1 %67, i32 %68, i32 %66
  %70 = tail call i32 @llvm.smax.i32(i32 %69, i32 0)
  %71 = tail call i32 @llvm.umin.i32(i32 %70, i32 164)
  %72 = icmp eq i8 %49, 0
  %73 = zext i1 %72 to i8
  %74 = getelementptr inbounds i8, ptr addrspace(1) %22, i64 %38
  %75 = load i8, ptr addrspace(1) %74, align 1, !invariant.load !4
  %76 = trunc i8 %75 to i1
  %77 = select i1 %76, i32 -1, i32 1
  %78 = getelementptr inbounds i8, ptr addrspace(1) %23, i64 %38
  %79 = load i8, ptr addrspace(1) %78, align 1, !invariant.load !4
  %80 = icmp eq i8 %79, 0
  %81 = zext i1 %80 to i8
  %82 = and i32 %33, 31
  %83 = mul nuw nsw i32 %37, 27225
  %84 = mul nuw nsw i32 %47, 165
  %85 = add nuw nsw i32 %83, %82
  %86 = add nuw nsw i32 %85, %84
  %87 = zext nneg i32 %86 to i64
  %88 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 %87
  %89 = load i8, ptr addrspace(1) %88, align 1, !invariant.load !4
  %90 = mul nuw nsw i32 %36, 165
  %91 = mul nuw nsw i32 %34, 1320
  %92 = add nuw nsw i32 %82, %91
  %93 = add nuw nsw i32 %92, %90
  %94 = zext nneg i32 %93 to i64
  %95 = getelementptr inbounds i8, ptr addrspace(1) %25, i64 %94
  %96 = load i8, ptr addrspace(1) %95, align 1, !invariant.load !4
  %97 = and i8 %96, %89
  %98 = mul nuw nsw i32 %71, 165
  %99 = add nuw nsw i32 %85, %98
  %100 = zext nneg i32 %99 to i64
  %101 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 %100
  %102 = load i8, ptr addrspace(1) %101, align 1, !invariant.load !4
  %103 = and i8 %102, %96
  %104 = mul nuw nsw i32 %37, 165
  %105 = mul i32 %37, -27060
  %106 = add i32 %85, %105
  %107 = zext nneg i32 %106 to i64
  %108 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %107
  %109 = load i8, ptr addrspace(1) %108, align 1, !invariant.load !4, !alias.scope !646
  %110 = icmp eq i8 %109, 0
  %111 = zext nneg i32 %82 to i64
  %112 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 %111
  %113 = load i8, ptr addrspace(1) %112, align 1, !invariant.load !4
  %.lhs.trunc = trunc nuw nsw i32 %82 to i8
  %114 = urem i8 %.lhs.trunc, 15
  %.zext = zext nneg i8 %114 to i32
  %115 = add nuw nsw i32 %.zext, 15
  %116 = trunc i8 %113 to i1
  %117 = select i1 %116, i32 %115, i32 %.zext
  %118 = icmp ne i32 %117, 0
  %119 = zext i1 %118 to i8
  %120 = icmp samesign ult i32 %117, 14
  %121 = zext i1 %120 to i8
  %122 = select i1 %52, i8 %119, i8 %121
  %123 = add i32 %60, %82
  %124 = tail call i32 @llvm.smax.i32(i32 %123, i32 0)
  %125 = tail call i32 @llvm.umin.i32(i32 %124, i32 164)
  %126 = add nuw nsw i32 %125, %104
  %127 = zext nneg i32 %126 to i64
  %128 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %127
  %129 = load i8, ptr addrspace(1) %128, align 1, !invariant.load !4, !alias.scope !649
  %130 = icmp eq i8 %129, 0
  %131 = select i1 %130, i8 %122, i8 0
  %132 = or i8 %131, %73
  %133 = select i1 %110, i8 %132, i8 0
  %134 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %107
  %135 = load i8, ptr addrspace(1) %134, align 1, !invariant.load !4, !alias.scope !652
  %136 = icmp eq i8 %135, 0
  %137 = select i1 %76, i8 %119, i8 %121
  %138 = add nsw i32 %77, %82
  %139 = tail call i32 @llvm.smax.i32(i32 %138, i32 0)
  %140 = add nuw i32 %139, %104
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %141
  %143 = load i8, ptr addrspace(1) %142, align 1, !invariant.load !4, !alias.scope !655
  %144 = icmp eq i8 %143, 0
  %145 = select i1 %144, i8 %137, i8 0
  %146 = or i8 %145, %81
  %147 = select i1 %136, i8 %146, i8 0
  %148 = getelementptr inbounds i8, ptr addrspace(1) %29, i64 %94
  store i8 %133, ptr addrspace(1) %148, align 1
  %149 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %94
  store i8 %147, ptr addrspace(1) %149, align 1
  %150 = or disjoint i32 %82, 32
  %151 = getelementptr inbounds i8, ptr addrspace(1) %88, i64 32
  %152 = load i8, ptr addrspace(1) %151, align 1, !invariant.load !4
  %153 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 32
  %154 = load i8, ptr addrspace(1) %153, align 1, !invariant.load !4
  %155 = and i8 %154, %152
  %156 = or i8 %155, %97
  %157 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 32
  %158 = load i8, ptr addrspace(1) %157, align 1, !invariant.load !4
  %159 = and i8 %158, %154
  %160 = or i8 %159, %103
  %161 = zext nneg i32 %104 to i64
  %162 = add i64 %161, %111
  %163 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %162
  %164 = getelementptr inbounds i8, ptr addrspace(1) %163, i64 32
  %165 = load i8, ptr addrspace(1) %164, align 1, !invariant.load !4, !alias.scope !658
  %166 = icmp eq i8 %165, 0
  %167 = getelementptr inbounds i8, ptr addrspace(1) %112, i64 32
  %168 = load i8, ptr addrspace(1) %167, align 1, !invariant.load !4
  %.lhs.trunc1 = trunc nuw nsw i32 %150 to i8
  %169 = urem i8 %.lhs.trunc1, 15
  %.zext2 = zext nneg i8 %169 to i32
  %170 = add nuw nsw i32 %.zext2, 15
  %171 = trunc i8 %168 to i1
  %172 = select i1 %171, i32 %170, i32 %.zext2
  %173 = icmp ne i32 %172, 0
  %174 = zext i1 %173 to i8
  %175 = icmp samesign ult i32 %172, 14
  %176 = zext i1 %175 to i8
  %177 = select i1 %52, i8 %174, i8 %176
  %178 = add i32 %60, %150
  %179 = tail call i32 @llvm.smax.i32(i32 %178, i32 0)
  %180 = tail call i32 @llvm.umin.i32(i32 %179, i32 164)
  %181 = add nuw nsw i32 %180, %104
  %182 = zext nneg i32 %181 to i64
  %183 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %182
  %184 = load i8, ptr addrspace(1) %183, align 1, !invariant.load !4, !alias.scope !661
  %185 = icmp eq i8 %184, 0
  %186 = select i1 %185, i8 %177, i8 0
  %187 = or i8 %186, %73
  %188 = select i1 %166, i8 %187, i8 0
  %189 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %162
  %190 = getelementptr inbounds i8, ptr addrspace(1) %189, i64 32
  %191 = load i8, ptr addrspace(1) %190, align 1, !invariant.load !4, !alias.scope !664
  %192 = icmp eq i8 %191, 0
  %193 = select i1 %76, i8 %174, i8 %176
  %194 = add nsw i32 %77, %104
  %195 = add nsw i32 %194, %150
  %196 = zext nneg i32 %195 to i64
  %197 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %196
  %198 = load i8, ptr addrspace(1) %197, align 1, !invariant.load !4, !alias.scope !667
  %199 = icmp eq i8 %198, 0
  %200 = select i1 %199, i8 %193, i8 0
  %201 = or i8 %200, %81
  %202 = select i1 %192, i8 %201, i8 0
  %203 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 32
  store i8 %188, ptr addrspace(1) %203, align 1
  %204 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 32
  store i8 %202, ptr addrspace(1) %204, align 1
  %205 = or disjoint i32 %82, 64
  %206 = getelementptr inbounds i8, ptr addrspace(1) %88, i64 64
  %207 = load i8, ptr addrspace(1) %206, align 1, !invariant.load !4
  %208 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 64
  %209 = load i8, ptr addrspace(1) %208, align 1, !invariant.load !4
  %210 = and i8 %209, %207
  %211 = or i8 %156, %210
  %212 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 64
  %213 = load i8, ptr addrspace(1) %212, align 1, !invariant.load !4
  %214 = and i8 %213, %209
  %215 = or i8 %160, %214
  %216 = getelementptr inbounds i8, ptr addrspace(1) %163, i64 64
  %217 = load i8, ptr addrspace(1) %216, align 1, !invariant.load !4, !alias.scope !670
  %218 = icmp eq i8 %217, 0
  %219 = getelementptr inbounds i8, ptr addrspace(1) %112, i64 64
  %220 = load i8, ptr addrspace(1) %219, align 1, !invariant.load !4
  %.lhs.trunc3 = trunc nuw nsw i32 %205 to i8
  %221 = urem i8 %.lhs.trunc3, 15
  %.zext4 = zext nneg i8 %221 to i32
  %222 = add nuw nsw i32 %.zext4, 15
  %223 = trunc i8 %220 to i1
  %224 = select i1 %223, i32 %222, i32 %.zext4
  %225 = icmp ne i32 %224, 0
  %226 = zext i1 %225 to i8
  %227 = icmp samesign ult i32 %224, 14
  %228 = zext i1 %227 to i8
  %229 = select i1 %52, i8 %226, i8 %228
  %230 = add i32 %60, %205
  %231 = tail call i32 @llvm.smax.i32(i32 %230, i32 0)
  %232 = tail call i32 @llvm.umin.i32(i32 %231, i32 164)
  %233 = add nuw nsw i32 %232, %104
  %234 = zext nneg i32 %233 to i64
  %235 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %234
  %236 = load i8, ptr addrspace(1) %235, align 1, !invariant.load !4, !alias.scope !673
  %237 = icmp eq i8 %236, 0
  %238 = select i1 %237, i8 %229, i8 0
  %239 = or i8 %238, %73
  %240 = select i1 %218, i8 %239, i8 0
  %241 = getelementptr inbounds i8, ptr addrspace(1) %189, i64 64
  %242 = load i8, ptr addrspace(1) %241, align 1, !invariant.load !4, !alias.scope !676
  %243 = icmp eq i8 %242, 0
  %244 = select i1 %76, i8 %226, i8 %228
  %245 = add nsw i32 %194, %205
  %246 = zext nneg i32 %245 to i64
  %247 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %246
  %248 = load i8, ptr addrspace(1) %247, align 1, !invariant.load !4, !alias.scope !679
  %249 = icmp eq i8 %248, 0
  %250 = select i1 %249, i8 %244, i8 0
  %251 = or i8 %250, %81
  %252 = select i1 %243, i8 %251, i8 0
  %253 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 64
  store i8 %240, ptr addrspace(1) %253, align 1
  %254 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 64
  store i8 %252, ptr addrspace(1) %254, align 1
  %255 = or disjoint i32 %82, 96
  %256 = getelementptr inbounds i8, ptr addrspace(1) %88, i64 96
  %257 = load i8, ptr addrspace(1) %256, align 1, !invariant.load !4
  %258 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 96
  %259 = load i8, ptr addrspace(1) %258, align 1, !invariant.load !4
  %260 = and i8 %259, %257
  %261 = or i8 %211, %260
  %262 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 96
  %263 = load i8, ptr addrspace(1) %262, align 1, !invariant.load !4
  %264 = and i8 %263, %259
  %265 = or i8 %215, %264
  %266 = getelementptr inbounds i8, ptr addrspace(1) %163, i64 96
  %267 = load i8, ptr addrspace(1) %266, align 1, !invariant.load !4, !alias.scope !682
  %268 = icmp eq i8 %267, 0
  %269 = getelementptr inbounds i8, ptr addrspace(1) %112, i64 96
  %270 = load i8, ptr addrspace(1) %269, align 1, !invariant.load !4
  %.lhs.trunc5 = trunc nuw nsw i32 %255 to i8
  %271 = urem i8 %.lhs.trunc5, 15
  %.zext6 = zext nneg i8 %271 to i32
  %272 = add nuw nsw i32 %.zext6, 15
  %273 = trunc i8 %270 to i1
  %274 = select i1 %273, i32 %272, i32 %.zext6
  %275 = icmp ne i32 %274, 0
  %276 = zext i1 %275 to i8
  %277 = icmp samesign ult i32 %274, 14
  %278 = zext i1 %277 to i8
  %279 = select i1 %52, i8 %276, i8 %278
  %280 = add i32 %60, %255
  %281 = tail call i32 @llvm.smax.i32(i32 %280, i32 0)
  %282 = tail call i32 @llvm.umin.i32(i32 %281, i32 164)
  %283 = add nuw nsw i32 %282, %104
  %284 = zext nneg i32 %283 to i64
  %285 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %284
  %286 = load i8, ptr addrspace(1) %285, align 1, !invariant.load !4, !alias.scope !685
  %287 = icmp eq i8 %286, 0
  %288 = select i1 %287, i8 %279, i8 0
  %289 = or i8 %288, %73
  %290 = select i1 %268, i8 %289, i8 0
  %291 = getelementptr inbounds i8, ptr addrspace(1) %189, i64 96
  %292 = load i8, ptr addrspace(1) %291, align 1, !invariant.load !4, !alias.scope !688
  %293 = icmp eq i8 %292, 0
  %294 = select i1 %76, i8 %276, i8 %278
  %295 = add nsw i32 %194, %255
  %296 = zext nneg i32 %295 to i64
  %297 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %296
  %298 = load i8, ptr addrspace(1) %297, align 1, !invariant.load !4, !alias.scope !691
  %299 = icmp eq i8 %298, 0
  %300 = select i1 %299, i8 %294, i8 0
  %301 = or i8 %300, %81
  %302 = select i1 %293, i8 %301, i8 0
  %303 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 96
  store i8 %290, ptr addrspace(1) %303, align 1
  %304 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 96
  store i8 %302, ptr addrspace(1) %304, align 1
  %305 = or disjoint i32 %82, 128
  %306 = getelementptr inbounds i8, ptr addrspace(1) %88, i64 128
  %307 = load i8, ptr addrspace(1) %306, align 1, !invariant.load !4
  %308 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 128
  %309 = load i8, ptr addrspace(1) %308, align 1, !invariant.load !4
  %310 = and i8 %309, %307
  %311 = or i8 %261, %310
  %312 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 128
  %313 = load i8, ptr addrspace(1) %312, align 1, !invariant.load !4
  %314 = and i8 %313, %309
  %315 = or i8 %265, %314
  %316 = getelementptr inbounds i8, ptr addrspace(1) %163, i64 128
  %317 = load i8, ptr addrspace(1) %316, align 1, !invariant.load !4, !alias.scope !694
  %318 = icmp eq i8 %317, 0
  %319 = getelementptr inbounds i8, ptr addrspace(1) %112, i64 128
  %320 = load i8, ptr addrspace(1) %319, align 1, !invariant.load !4
  %.lhs.trunc7 = trunc nuw i32 %305 to i8
  %321 = urem i8 %.lhs.trunc7, 15
  %.zext8 = zext nneg i8 %321 to i32
  %322 = add nuw nsw i32 %.zext8, 15
  %323 = trunc i8 %320 to i1
  %324 = select i1 %323, i32 %322, i32 %.zext8
  %325 = icmp ne i32 %324, 0
  %326 = zext i1 %325 to i8
  %327 = icmp samesign ult i32 %324, 14
  %328 = zext i1 %327 to i8
  %329 = select i1 %52, i8 %326, i8 %328
  %330 = add i32 %60, %305
  %331 = tail call i32 @llvm.smax.i32(i32 %330, i32 0)
  %332 = tail call i32 @llvm.umin.i32(i32 %331, i32 164)
  %333 = add nuw nsw i32 %332, %104
  %334 = zext nneg i32 %333 to i64
  %335 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %334
  %336 = load i8, ptr addrspace(1) %335, align 1, !invariant.load !4, !alias.scope !697
  %337 = icmp eq i8 %336, 0
  %338 = select i1 %337, i8 %329, i8 0
  %339 = or i8 %338, %73
  %340 = select i1 %318, i8 %339, i8 0
  %341 = getelementptr inbounds i8, ptr addrspace(1) %189, i64 128
  %342 = load i8, ptr addrspace(1) %341, align 1, !invariant.load !4, !alias.scope !700
  %343 = icmp eq i8 %342, 0
  %344 = select i1 %76, i8 %326, i8 %328
  %345 = add nsw i32 %194, %305
  %346 = zext nneg i32 %345 to i64
  %347 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %346
  %348 = load i8, ptr addrspace(1) %347, align 1, !invariant.load !4, !alias.scope !703
  %349 = icmp eq i8 %348, 0
  %350 = select i1 %349, i8 %344, i8 0
  %351 = or i8 %350, %81
  %352 = select i1 %343, i8 %351, i8 0
  %353 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 128
  store i8 %340, ptr addrspace(1) %353, align 1
  %354 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 128
  store i8 %352, ptr addrspace(1) %354, align 1
  %355 = icmp samesign ult i32 %82, 5
  br i1 %355, label %356, label %410

356:                                              ; preds = %16
  %357 = icmp eq i32 %51, 0
  %358 = or disjoint i32 %82, 160
  %359 = getelementptr inbounds i8, ptr addrspace(1) %88, i64 160
  %360 = load i8, ptr addrspace(1) %359, align 1, !invariant.load !4
  %361 = getelementptr inbounds i8, ptr addrspace(1) %95, i64 160
  %362 = load i8, ptr addrspace(1) %361, align 1, !invariant.load !4
  %363 = and i8 %362, %360
  %364 = or i8 %363, %311
  %365 = getelementptr inbounds i8, ptr addrspace(1) %101, i64 160
  %366 = load i8, ptr addrspace(1) %365, align 1, !invariant.load !4
  %367 = and i8 %366, %362
  %368 = or i8 %367, %315
  %369 = getelementptr inbounds i8, ptr addrspace(1) %163, i64 160
  %370 = load i8, ptr addrspace(1) %369, align 1, !invariant.load !4, !alias.scope !706
  %371 = icmp eq i8 %370, 0
  %372 = getelementptr inbounds i8, ptr addrspace(1) %112, i64 160
  %373 = load i8, ptr addrspace(1) %372, align 1, !invariant.load !4
  %.lhs.trunc9 = trunc nuw i32 %358 to i8
  %374 = urem i8 %.lhs.trunc9, 15
  %.zext10 = zext nneg i8 %374 to i32
  %375 = add nuw nsw i32 %.zext10, 15
  %376 = trunc i8 %373 to i1
  %377 = select i1 %376, i32 %375, i32 %.zext10
  %378 = icmp ne i32 %377, 0
  %379 = zext i1 %378 to i8
  %380 = icmp samesign ult i32 %377, 14
  %381 = zext i1 %380 to i8
  %382 = select i1 %357, i8 %379, i8 %381
  %383 = add i32 %60, %358
  %384 = tail call i32 @llvm.smax.i32(i32 %383, i32 0)
  %385 = tail call i32 @llvm.umin.i32(i32 %384, i32 164)
  %386 = add nuw nsw i32 %385, %104
  %387 = zext nneg i32 %386 to i64
  %388 = getelementptr inbounds i8, ptr addrspace(1) %26, i64 %387
  %389 = load i8, ptr addrspace(1) %388, align 1, !invariant.load !4, !alias.scope !709
  %390 = icmp eq i8 %389, 0
  %391 = select i1 %390, i8 %382, i8 0
  %392 = or i8 %391, %73
  %393 = select i1 %371, i8 %392, i8 0
  %394 = getelementptr inbounds i8, ptr addrspace(1) %189, i64 160
  %395 = load i8, ptr addrspace(1) %394, align 1, !invariant.load !4, !alias.scope !712
  %396 = icmp eq i8 %395, 0
  %397 = select i1 %76, i8 %379, i8 %381
  %398 = add nsw i32 %77, %358
  %399 = tail call i32 @llvm.umin.i32(i32 %398, i32 164)
  %400 = add nuw nsw i32 %399, %104
  %401 = zext nneg i32 %400 to i64
  %402 = getelementptr inbounds i8, ptr addrspace(1) %28, i64 %401
  %403 = load i8, ptr addrspace(1) %402, align 1, !invariant.load !4, !alias.scope !715
  %404 = icmp eq i8 %403, 0
  %405 = select i1 %404, i8 %397, i8 0
  %406 = or i8 %405, %81
  %407 = select i1 %396, i8 %406, i8 0
  %408 = getelementptr inbounds i8, ptr addrspace(1) %148, i64 160
  store i8 %393, ptr addrspace(1) %408, align 1
  %409 = getelementptr inbounds i8, ptr addrspace(1) %149, i64 160
  store i8 %407, ptr addrspace(1) %409, align 1
  br label %410

410:                                              ; preds = %356, %16
  %411 = phi i8 [ %368, %356 ], [ %315, %16 ]
  %412 = phi i8 [ %364, %356 ], [ %311, %16 ]
  %413 = zext i8 %412 to i32
  %414 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %413, i32 16, i32 31)
  %415 = trunc i32 %414 to i8
  %416 = or i8 %412, %415
  %417 = zext i8 %416 to i32
  %418 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %417, i32 8, i32 31)
  %419 = trunc i32 %418 to i8
  %420 = or i8 %416, %419
  %421 = zext i8 %420 to i32
  %422 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %421, i32 4, i32 31)
  %423 = trunc i32 %422 to i8
  %424 = or i8 %420, %423
  %425 = zext i8 %424 to i32
  %426 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %425, i32 2, i32 31)
  %427 = trunc i32 %426 to i8
  %428 = or i8 %424, %427
  %429 = zext i8 %428 to i32
  %430 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %429, i32 1, i32 31)
  %431 = zext i8 %411 to i32
  %432 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %431, i32 16, i32 31)
  %433 = trunc i32 %432 to i8
  %434 = or i8 %411, %433
  %435 = zext i8 %434 to i32
  %436 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %435, i32 8, i32 31)
  %437 = trunc i32 %436 to i8
  %438 = or i8 %434, %437
  %439 = zext i8 %438 to i32
  %440 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %439, i32 4, i32 31)
  %441 = trunc i32 %440 to i8
  %442 = or i8 %438, %441
  %443 = zext i8 %442 to i32
  %444 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %443, i32 2, i32 31)
  %445 = trunc i32 %444 to i8
  %446 = or i8 %442, %445
  %447 = zext i8 %446 to i32
  %448 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %447, i32 1, i32 31)
  %449 = icmp eq i32 %82, 0
  %450 = icmp samesign ult i32 %33, 225
  %451 = and i1 %450, %449
  %452 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 %38
  %453 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 %38
  %454 = trunc i32 %448 to i8
  %455 = or i8 %446, %454
  %456 = trunc i32 %430 to i8
  %457 = or i8 %428, %456
  br i1 %451, label %458, label %459

458:                                              ; preds = %410
  store i8 %457, ptr addrspace(1) %453, align 1
  store i8 %455, ptr addrspace(1) %452, align 1
  br label %459

459:                                              ; preds = %458, %410
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.down.i32(i32, i32, i32, i32) #12

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_35(ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2) local_unnamed_addr #4 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %9 = shl nuw nsw i32 %8, 7
  %10 = or disjoint i32 %9, %7
  tail call void @llvm.experimental.noalias.scope.decl(metadata !718)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !721)
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %11
  %13 = load i32, ptr addrspace(1) %12, align 4, !invariant.load !4, !alias.scope !721, !noalias !718
  %14 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %11
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !718, !noalias !721
  %16 = icmp slt i32 %15, %13
  %17 = add i32 %15, 165
  %18 = select i1 %16, i32 %17, i32 %15
  %19 = icmp ult i32 %18, 165
  %20 = mul nuw nsw i32 %10, 165
  %21 = add nuw nsw i32 %18, %20
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %22
  br i1 %19, label %24, label %25

24:                                               ; preds = %3
  store i8 1, ptr addrspace(1) %23, align 1
  br label %25

25:                                               ; preds = %24, %3
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_compare_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(4) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(1) initializes((0, 1)) %1) local_unnamed_addr #13 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = load i32, ptr addrspace(1) %3, align 256, !invariant.load !4
  %6 = icmp slt i32 %5, 20
  %7 = zext i1 %6 to i8
  store i8 %7, ptr addrspace(1) %4, align 256
  ret void
}

; Function Attrs: norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_reduce_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(111513600) %0, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %2) local_unnamed_addr #11 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !644
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !723
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
define ptx_kernel void @loop_select_fusion(ptr noalias align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %1, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %2, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %3, ptr noalias readonly align 256 captures(none) dereferenceable(4) %4) local_unnamed_addr #0 {
  %6 = addrspacecast ptr %4 to ptr addrspace(1)
  %7 = addrspacecast ptr %0 to ptr addrspace(1)
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %1 to ptr addrspace(1)
  %10 = addrspacecast ptr %3 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !536
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
define ptx_kernel void @loop_add_fusion(ptr noalias align 256 captures(none) dereferenceable(4) %0) local_unnamed_addr #13 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = load i32, ptr addrspace(1) %2, align 256
  %4 = add i32 %3, 1
  store i32 %4, ptr addrspace(1) %2, align 256
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_33(ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %1, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %2, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %3) local_unnamed_addr #4 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %11 = shl nuw nsw i32 %10, 7
  %12 = or disjoint i32 %11, %9
  tail call void @llvm.experimental.noalias.scope.decl(metadata !724)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !727)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !729)
  %13 = zext nneg i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %13
  %15 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4, !alias.scope !724, !noalias !731
  %16 = shl nuw nsw i32 %12, 1
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr addrspace(1) %6, i64 %17
  %19 = load <2 x i32>, ptr addrspace(1) %18, align 8, !invariant.load !4, !alias.scope !729, !noalias !732
  %20 = extractelement <2 x i32> %19, i32 0
  %21 = extractelement <2 x i32> %19, i32 1
  %22 = tail call i32 @llvm.smax.i32(i32 %20, i32 0)
  %23 = tail call i32 @llvm.umin.i32(i32 %22, i32 4095)
  %24 = tail call i32 @llvm.smax.i32(i32 %21, i32 0)
  %25 = tail call i32 @llvm.umin.i32(i32 %24, i32 13)
  %26 = mul nuw nsw i32 %23, 14
  %27 = add nuw nsw i32 %26, %25
  %28 = zext nneg i32 %27 to i64
  %29 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %28
  %30 = load i32, ptr addrspace(1) %29, align 4, !invariant.load !4, !alias.scope !727, !noalias !733
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
define ptx_kernel void @loop_select_fusion_4(ptr noalias readonly align 256 captures(none) dereferenceable(675840) %0, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %1, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %2, ptr noalias readonly align 256 captures(none) dereferenceable(108900) %3, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %4, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %5, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %6, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %7, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %8, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %9, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %10, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %11, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %12, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %13, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %14, ptr noalias writeonly align 256 captures(none) dereferenceable(675840) %15) local_unnamed_addr #0 {
  %17 = addrspacecast ptr %9 to ptr addrspace(1)
  %18 = addrspacecast ptr %10 to ptr addrspace(1)
  %19 = addrspacecast ptr %0 to ptr addrspace(1)
  %20 = addrspacecast ptr %2 to ptr addrspace(1)
  %21 = addrspacecast ptr %6 to ptr addrspace(1)
  %22 = addrspacecast ptr %5 to ptr addrspace(1)
  %23 = addrspacecast ptr %4 to ptr addrspace(1)
  %24 = addrspacecast ptr %3 to ptr addrspace(1)
  %25 = addrspacecast ptr %8 to ptr addrspace(1)
  %26 = addrspacecast ptr %7 to ptr addrspace(1)
  %27 = addrspacecast ptr %1 to ptr addrspace(1)
  %28 = addrspacecast ptr %12 to ptr addrspace(1)
  %29 = addrspacecast ptr %11 to ptr addrspace(1)
  %30 = addrspacecast ptr %13 to ptr addrspace(1)
  %31 = addrspacecast ptr %14 to ptr addrspace(1)
  %32 = addrspacecast ptr %15 to ptr addrspace(1)
  %33 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !536
  %34 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %35 = shl nuw nsw i32 %34, 2
  %36 = shl nuw nsw i32 %33, 9
  %37 = or disjoint i32 %35, %36
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 %38
  %40 = load <4 x i8>, ptr addrspace(1) %39, align 4, !invariant.load !4
  %41 = getelementptr inbounds i8, ptr addrspace(1) %18, i64 %38
  %42 = load <4 x i8>, ptr addrspace(1) %41, align 4, !invariant.load !4
  %43 = getelementptr inbounds i8, ptr addrspace(1) %19, i64 %38
  %44 = load <4 x i8>, ptr addrspace(1) %43, align 4, !invariant.load !4
  %45 = getelementptr inbounds i8, ptr addrspace(1) %20, i64 %38
  %46 = load <4 x i8>, ptr addrspace(1) %45, align 4, !invariant.load !4
  %47 = udiv i32 %37, 165
  %48 = mul i32 %47, 165
  %.decomposed = sub i32 %37, %48
  %49 = shl nuw nsw i32 %47, 1
  %50 = zext nneg i32 %49 to i64
  %51 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %50
  %52 = load <2 x i32>, ptr addrspace(1) %51, align 8, !invariant.load !4
  %53 = extractelement <2 x i32> %52, i32 0
  %54 = extractelement <2 x i32> %52, i32 1
  %55 = tail call i32 @llvm.smax.i32(i32 %53, i32 0)
  %56 = tail call i32 @llvm.umin.i32(i32 %55, i32 4095)
  %57 = tail call i32 @llvm.smax.i32(i32 %54, i32 0)
  %58 = tail call i32 @llvm.umin.i32(i32 %57, i32 13)
  %59 = mul nuw nsw i32 %56, 14
  %60 = add nuw nsw i32 %59, %58
  %61 = zext nneg i32 %60 to i64
  %62 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %61
  %63 = load i32, ptr addrspace(1) %62, align 4, !invariant.load !4
  %64 = zext nneg i32 %47 to i64
  %65 = getelementptr inbounds i32, ptr addrspace(1) %23, i64 %64
  %66 = load i32, ptr addrspace(1) %65, align 4, !invariant.load !4
  %67 = icmp slt i32 %63, %66
  %68 = add i32 %63, 165
  %69 = select i1 %67, i32 %68, i32 %63
  %70 = tail call i32 @llvm.smax.i32(i32 %69, i32 0)
  %71 = tail call i32 @llvm.umin.i32(i32 %70, i32 164)
  %72 = mul nuw nsw i32 %71, 165
  %73 = add nuw nsw i32 %72, %.decomposed
  %74 = zext nneg i32 %73 to i64
  %75 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %74
  %76 = load i32, ptr addrspace(1) %75, align 4, !invariant.load !4
  %77 = getelementptr inbounds i32, ptr addrspace(1) %25, i64 %61
  %78 = load i32, ptr addrspace(1) %77, align 4, !invariant.load !4
  %79 = tail call i32 @llvm.smax.i32(i32 %78, i32 0)
  %80 = tail call i32 @llvm.umin.i32(i32 %79, i32 100)
  %81 = mul nuw nsw i32 %80, 20
  %82 = zext nneg i32 %81 to i64
  %83 = getelementptr inbounds float, ptr addrspace(1) %26, i64 %82
  %84 = getelementptr inbounds i8, ptr addrspace(1) %83, i64 20
  %85 = load float, ptr addrspace(1) %84, align 4, !invariant.load !4
  %.inv = fcmp ole float %85, 0xC1E0000000000000
  %86 = select i1 %.inv, float 0xC1E0000000000000, float %85
  %87 = fptosi float %86 to i32
  %88 = fcmp oge float %85, 0x41E0000000000000
  %89 = select i1 %88, i32 2147483647, i32 %87
  %90 = fcmp uno float %85, 0.000000e+00
  %91 = select i1 %90, i32 0, i32 %89
  %.not = icmp sgt i32 %76, %91
  %92 = extractelement <4 x i8> %46, i64 0
  %93 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 %64
  %94 = load i8, ptr addrspace(1) %93, align 1, !invariant.load !4
  %95 = extractelement <4 x i8> %44, i64 0
  %96 = and i8 %92, 1
  %97 = select i1 %.not, i8 0, i8 %96
  %98 = trunc i8 %94 to i1
  %99 = select i1 %98, i8 %95, i8 %97
  %100 = getelementptr inbounds i32, ptr addrspace(1) %28, i64 %64
  %101 = load i32, ptr addrspace(1) %100, align 4, !invariant.load !4
  %102 = icmp slt i32 %101, %66
  %103 = add i32 %101, 165
  %104 = select i1 %102, i32 %103, i32 %101
  %105 = tail call i32 @llvm.smax.i32(i32 %104, i32 0)
  %106 = tail call i32 @llvm.umin.i32(i32 %105, i32 164)
  %107 = mul nuw nsw i32 %106, 165
  %108 = add nuw nsw i32 %107, %.decomposed
  %109 = zext nneg i32 %108 to i64
  %110 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %109
  %111 = load i32, ptr addrspace(1) %110, align 4, !invariant.load !4
  %112 = getelementptr inbounds i32, ptr addrspace(1) %29, i64 %64
  %113 = load i32, ptr addrspace(1) %112, align 4, !invariant.load !4
  %.not1 = icmp sgt i32 %111, %113
  %114 = extractelement <4 x i8> %42, i64 0
  %115 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %64
  %116 = load i8, ptr addrspace(1) %115, align 1, !invariant.load !4
  %117 = extractelement <4 x i8> %40, i64 0
  %118 = and i8 %114, 1
  %119 = select i1 %.not1, i8 0, i8 %118
  %120 = trunc i8 %116 to i1
  %121 = select i1 %120, i8 %117, i8 %119
  %122 = insertelement <4 x i8> poison, i8 %121, i64 0
  %123 = insertelement <4 x i8> poison, i8 %99, i64 0
  %124 = or disjoint i32 %37, 1
  %125 = udiv i32 %124, 165
  %126 = mul i32 %125, 165
  %.decomposed11 = sub i32 %124, %126
  %127 = shl nuw nsw i32 %125, 1
  %128 = zext nneg i32 %127 to i64
  %129 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %128
  %130 = load <2 x i32>, ptr addrspace(1) %129, align 8, !invariant.load !4
  %131 = extractelement <2 x i32> %130, i32 0
  %132 = extractelement <2 x i32> %130, i32 1
  %133 = tail call i32 @llvm.smax.i32(i32 %131, i32 0)
  %134 = tail call i32 @llvm.umin.i32(i32 %133, i32 4095)
  %135 = tail call i32 @llvm.smax.i32(i32 %132, i32 0)
  %136 = tail call i32 @llvm.umin.i32(i32 %135, i32 13)
  %137 = mul nuw nsw i32 %134, 14
  %138 = add nuw nsw i32 %137, %136
  %139 = zext nneg i32 %138 to i64
  %140 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %139
  %141 = load i32, ptr addrspace(1) %140, align 4, !invariant.load !4
  %142 = zext nneg i32 %125 to i64
  %143 = getelementptr inbounds i32, ptr addrspace(1) %23, i64 %142
  %144 = load i32, ptr addrspace(1) %143, align 4, !invariant.load !4
  %145 = icmp slt i32 %141, %144
  %146 = add i32 %141, 165
  %147 = select i1 %145, i32 %146, i32 %141
  %148 = tail call i32 @llvm.smax.i32(i32 %147, i32 0)
  %149 = tail call i32 @llvm.umin.i32(i32 %148, i32 164)
  %150 = mul nuw nsw i32 %149, 165
  %151 = add nuw nsw i32 %150, %.decomposed11
  %152 = zext nneg i32 %151 to i64
  %153 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %152
  %154 = load i32, ptr addrspace(1) %153, align 4, !invariant.load !4
  %155 = getelementptr inbounds i32, ptr addrspace(1) %25, i64 %139
  %156 = load i32, ptr addrspace(1) %155, align 4, !invariant.load !4
  %157 = tail call i32 @llvm.smax.i32(i32 %156, i32 0)
  %158 = tail call i32 @llvm.umin.i32(i32 %157, i32 100)
  %159 = mul nuw nsw i32 %158, 20
  %160 = zext nneg i32 %159 to i64
  %161 = getelementptr inbounds float, ptr addrspace(1) %26, i64 %160
  %162 = getelementptr inbounds i8, ptr addrspace(1) %161, i64 20
  %163 = load float, ptr addrspace(1) %162, align 4, !invariant.load !4
  %.inv2 = fcmp ole float %163, 0xC1E0000000000000
  %164 = select i1 %.inv2, float 0xC1E0000000000000, float %163
  %165 = fptosi float %164 to i32
  %166 = fcmp oge float %163, 0x41E0000000000000
  %167 = select i1 %166, i32 2147483647, i32 %165
  %168 = fcmp uno float %163, 0.000000e+00
  %169 = select i1 %168, i32 0, i32 %167
  %.not3 = icmp sgt i32 %154, %169
  %170 = extractelement <4 x i8> %46, i64 1
  %171 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 %142
  %172 = load i8, ptr addrspace(1) %171, align 1, !invariant.load !4
  %173 = extractelement <4 x i8> %44, i64 1
  %174 = and i8 %170, 1
  %175 = select i1 %.not3, i8 0, i8 %174
  %176 = trunc i8 %172 to i1
  %177 = select i1 %176, i8 %173, i8 %175
  %178 = getelementptr inbounds i32, ptr addrspace(1) %28, i64 %142
  %179 = load i32, ptr addrspace(1) %178, align 4, !invariant.load !4
  %180 = icmp slt i32 %179, %144
  %181 = add i32 %179, 165
  %182 = select i1 %180, i32 %181, i32 %179
  %183 = tail call i32 @llvm.smax.i32(i32 %182, i32 0)
  %184 = tail call i32 @llvm.umin.i32(i32 %183, i32 164)
  %185 = mul nuw nsw i32 %184, 165
  %186 = add nuw nsw i32 %185, %.decomposed11
  %187 = zext nneg i32 %186 to i64
  %188 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %187
  %189 = load i32, ptr addrspace(1) %188, align 4, !invariant.load !4
  %190 = getelementptr inbounds i32, ptr addrspace(1) %29, i64 %142
  %191 = load i32, ptr addrspace(1) %190, align 4, !invariant.load !4
  %.not4 = icmp sgt i32 %189, %191
  %192 = extractelement <4 x i8> %42, i64 1
  %193 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %142
  %194 = load i8, ptr addrspace(1) %193, align 1, !invariant.load !4
  %195 = extractelement <4 x i8> %40, i64 1
  %196 = and i8 %192, 1
  %197 = select i1 %.not4, i8 0, i8 %196
  %198 = trunc i8 %194 to i1
  %199 = select i1 %198, i8 %195, i8 %197
  %200 = insertelement <4 x i8> %122, i8 %199, i64 1
  %201 = insertelement <4 x i8> %123, i8 %177, i64 1
  %202 = or disjoint i32 %37, 2
  %203 = udiv i32 %202, 165
  %204 = mul i32 %203, 165
  %.decomposed12 = sub i32 %202, %204
  %205 = shl nuw nsw i32 %203, 1
  %206 = zext nneg i32 %205 to i64
  %207 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %206
  %208 = load <2 x i32>, ptr addrspace(1) %207, align 8, !invariant.load !4
  %209 = extractelement <2 x i32> %208, i32 0
  %210 = extractelement <2 x i32> %208, i32 1
  %211 = tail call i32 @llvm.smax.i32(i32 %209, i32 0)
  %212 = tail call i32 @llvm.umin.i32(i32 %211, i32 4095)
  %213 = tail call i32 @llvm.smax.i32(i32 %210, i32 0)
  %214 = tail call i32 @llvm.umin.i32(i32 %213, i32 13)
  %215 = mul nuw nsw i32 %212, 14
  %216 = add nuw nsw i32 %215, %214
  %217 = zext nneg i32 %216 to i64
  %218 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %217
  %219 = load i32, ptr addrspace(1) %218, align 4, !invariant.load !4
  %220 = zext nneg i32 %203 to i64
  %221 = getelementptr inbounds i32, ptr addrspace(1) %23, i64 %220
  %222 = load i32, ptr addrspace(1) %221, align 4, !invariant.load !4
  %223 = icmp slt i32 %219, %222
  %224 = add i32 %219, 165
  %225 = select i1 %223, i32 %224, i32 %219
  %226 = tail call i32 @llvm.smax.i32(i32 %225, i32 0)
  %227 = tail call i32 @llvm.umin.i32(i32 %226, i32 164)
  %228 = mul nuw nsw i32 %227, 165
  %229 = add nuw nsw i32 %228, %.decomposed12
  %230 = zext nneg i32 %229 to i64
  %231 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %230
  %232 = load i32, ptr addrspace(1) %231, align 4, !invariant.load !4
  %233 = getelementptr inbounds i32, ptr addrspace(1) %25, i64 %217
  %234 = load i32, ptr addrspace(1) %233, align 4, !invariant.load !4
  %235 = tail call i32 @llvm.smax.i32(i32 %234, i32 0)
  %236 = tail call i32 @llvm.umin.i32(i32 %235, i32 100)
  %237 = mul nuw nsw i32 %236, 20
  %238 = zext nneg i32 %237 to i64
  %239 = getelementptr inbounds float, ptr addrspace(1) %26, i64 %238
  %240 = getelementptr inbounds i8, ptr addrspace(1) %239, i64 20
  %241 = load float, ptr addrspace(1) %240, align 4, !invariant.load !4
  %.inv5 = fcmp ole float %241, 0xC1E0000000000000
  %242 = select i1 %.inv5, float 0xC1E0000000000000, float %241
  %243 = fptosi float %242 to i32
  %244 = fcmp oge float %241, 0x41E0000000000000
  %245 = select i1 %244, i32 2147483647, i32 %243
  %246 = fcmp uno float %241, 0.000000e+00
  %247 = select i1 %246, i32 0, i32 %245
  %.not6 = icmp sgt i32 %232, %247
  %248 = extractelement <4 x i8> %46, i64 2
  %249 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 %220
  %250 = load i8, ptr addrspace(1) %249, align 1, !invariant.load !4
  %251 = extractelement <4 x i8> %44, i64 2
  %252 = and i8 %248, 1
  %253 = select i1 %.not6, i8 0, i8 %252
  %254 = trunc i8 %250 to i1
  %255 = select i1 %254, i8 %251, i8 %253
  %256 = getelementptr inbounds i32, ptr addrspace(1) %28, i64 %220
  %257 = load i32, ptr addrspace(1) %256, align 4, !invariant.load !4
  %258 = icmp slt i32 %257, %222
  %259 = add i32 %257, 165
  %260 = select i1 %258, i32 %259, i32 %257
  %261 = tail call i32 @llvm.smax.i32(i32 %260, i32 0)
  %262 = tail call i32 @llvm.umin.i32(i32 %261, i32 164)
  %263 = mul nuw nsw i32 %262, 165
  %264 = add nuw nsw i32 %263, %.decomposed12
  %265 = zext nneg i32 %264 to i64
  %266 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %265
  %267 = load i32, ptr addrspace(1) %266, align 4, !invariant.load !4
  %268 = getelementptr inbounds i32, ptr addrspace(1) %29, i64 %220
  %269 = load i32, ptr addrspace(1) %268, align 4, !invariant.load !4
  %.not7 = icmp sgt i32 %267, %269
  %270 = extractelement <4 x i8> %42, i64 2
  %271 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %220
  %272 = load i8, ptr addrspace(1) %271, align 1, !invariant.load !4
  %273 = extractelement <4 x i8> %40, i64 2
  %274 = and i8 %270, 1
  %275 = select i1 %.not7, i8 0, i8 %274
  %276 = trunc i8 %272 to i1
  %277 = select i1 %276, i8 %273, i8 %275
  %278 = insertelement <4 x i8> %200, i8 %277, i64 2
  %279 = insertelement <4 x i8> %201, i8 %255, i64 2
  %280 = or disjoint i32 %37, 3
  %281 = udiv i32 %280, 165
  %282 = mul i32 %281, 165
  %.decomposed13 = sub i32 %280, %282
  %283 = shl nuw nsw i32 %281, 1
  %284 = zext nneg i32 %283 to i64
  %285 = getelementptr inbounds i32, ptr addrspace(1) %21, i64 %284
  %286 = load <2 x i32>, ptr addrspace(1) %285, align 8, !invariant.load !4
  %287 = extractelement <2 x i32> %286, i32 0
  %288 = extractelement <2 x i32> %286, i32 1
  %289 = tail call i32 @llvm.smax.i32(i32 %287, i32 0)
  %290 = tail call i32 @llvm.umin.i32(i32 %289, i32 4095)
  %291 = tail call i32 @llvm.smax.i32(i32 %288, i32 0)
  %292 = tail call i32 @llvm.umin.i32(i32 %291, i32 13)
  %293 = mul nuw nsw i32 %290, 14
  %294 = add nuw nsw i32 %293, %292
  %295 = zext nneg i32 %294 to i64
  %296 = getelementptr inbounds i32, ptr addrspace(1) %22, i64 %295
  %297 = load i32, ptr addrspace(1) %296, align 4, !invariant.load !4
  %298 = zext nneg i32 %281 to i64
  %299 = getelementptr inbounds i32, ptr addrspace(1) %23, i64 %298
  %300 = load i32, ptr addrspace(1) %299, align 4, !invariant.load !4
  %301 = icmp slt i32 %297, %300
  %302 = add i32 %297, 165
  %303 = select i1 %301, i32 %302, i32 %297
  %304 = tail call i32 @llvm.smax.i32(i32 %303, i32 0)
  %305 = tail call i32 @llvm.umin.i32(i32 %304, i32 164)
  %306 = mul nuw nsw i32 %305, 165
  %307 = add nuw nsw i32 %306, %.decomposed13
  %308 = zext nneg i32 %307 to i64
  %309 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %308
  %310 = load i32, ptr addrspace(1) %309, align 4, !invariant.load !4
  %311 = getelementptr inbounds i32, ptr addrspace(1) %25, i64 %295
  %312 = load i32, ptr addrspace(1) %311, align 4, !invariant.load !4
  %313 = tail call i32 @llvm.smax.i32(i32 %312, i32 0)
  %314 = tail call i32 @llvm.umin.i32(i32 %313, i32 100)
  %315 = mul nuw nsw i32 %314, 20
  %316 = zext nneg i32 %315 to i64
  %317 = getelementptr inbounds float, ptr addrspace(1) %26, i64 %316
  %318 = getelementptr inbounds i8, ptr addrspace(1) %317, i64 20
  %319 = load float, ptr addrspace(1) %318, align 4, !invariant.load !4
  %.inv8 = fcmp ole float %319, 0xC1E0000000000000
  %320 = select i1 %.inv8, float 0xC1E0000000000000, float %319
  %321 = fptosi float %320 to i32
  %322 = fcmp oge float %319, 0x41E0000000000000
  %323 = select i1 %322, i32 2147483647, i32 %321
  %324 = fcmp uno float %319, 0.000000e+00
  %325 = select i1 %324, i32 0, i32 %323
  %.not9 = icmp sgt i32 %310, %325
  %326 = extractelement <4 x i8> %46, i64 3
  %327 = getelementptr inbounds i8, ptr addrspace(1) %27, i64 %298
  %328 = load i8, ptr addrspace(1) %327, align 1, !invariant.load !4
  %329 = extractelement <4 x i8> %44, i64 3
  %330 = and i8 %326, 1
  %331 = select i1 %.not9, i8 0, i8 %330
  %332 = trunc i8 %328 to i1
  %333 = select i1 %332, i8 %329, i8 %331
  %334 = getelementptr inbounds i32, ptr addrspace(1) %28, i64 %298
  %335 = load i32, ptr addrspace(1) %334, align 4, !invariant.load !4
  %336 = icmp slt i32 %335, %300
  %337 = add i32 %335, 165
  %338 = select i1 %336, i32 %337, i32 %335
  %339 = tail call i32 @llvm.smax.i32(i32 %338, i32 0)
  %340 = tail call i32 @llvm.umin.i32(i32 %339, i32 164)
  %341 = mul nuw nsw i32 %340, 165
  %342 = add nuw nsw i32 %341, %.decomposed13
  %343 = zext nneg i32 %342 to i64
  %344 = getelementptr inbounds i32, ptr addrspace(1) %24, i64 %343
  %345 = load i32, ptr addrspace(1) %344, align 4, !invariant.load !4
  %346 = getelementptr inbounds i32, ptr addrspace(1) %29, i64 %298
  %347 = load i32, ptr addrspace(1) %346, align 4, !invariant.load !4
  %.not10 = icmp sgt i32 %345, %347
  %348 = extractelement <4 x i8> %42, i64 3
  %349 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %298
  %350 = load i8, ptr addrspace(1) %349, align 1, !invariant.load !4
  %351 = extractelement <4 x i8> %40, i64 3
  %352 = and i8 %348, 1
  %353 = select i1 %.not10, i8 0, i8 %352
  %354 = trunc i8 %350 to i1
  %355 = select i1 %354, i8 %351, i8 %353
  %356 = insertelement <4 x i8> %278, i8 %355, i64 3
  %357 = insertelement <4 x i8> %279, i8 %333, i64 3
  %358 = getelementptr inbounds i8, ptr addrspace(1) %31, i64 %38
  store <4 x i8> %357, ptr addrspace(1) %358, align 4
  %359 = getelementptr inbounds i8, ptr addrspace(1) %32, i64 %38
  store <4 x i8> %356, ptr addrspace(1) %359, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_2(ptr noalias writeonly align 256 captures(none) dereferenceable(5414912) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(5414912) %1) local_unnamed_addr #5 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !734
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
define ptx_kernel void @input_scatter_fusion_9(ptr noalias align 256 dereferenceable(5414912) %0, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %1, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %2) local_unnamed_addr #9 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !735
  %8 = shl nuw nsw i32 %7, 7
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = or disjoint i32 %8, %9
  %11 = udiv i32 %10, 165
  %12 = mul i32 %11, 165
  %.decomposed = sub i32 %10, %12
  %13 = shl nuw nsw i32 %.decomposed, 3
  %14 = zext nneg i32 %11 to i64
  %15 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %14
  %16 = load i32, ptr addrspace(1) %15, align 4, !invariant.load !4
  %17 = zext nneg i32 %10 to i64
  %18 = getelementptr inbounds i8, ptr addrspace(1) %5, i64 %17
  %19 = load i8, ptr addrspace(1) %18, align 1, !invariant.load !4
  %.not = icmp eq i32 %.decomposed, %16
  %20 = and i8 %19, 1
  %21 = mul nuw nsw i32 %11, 1322
  %22 = add nuw nsw i32 %21, %13
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %23
  %25 = addrspacecast ptr addrspace(1) %24 to ptr
  %26 = ptrtoint ptr %25 to i64
  %27 = and i64 %26, 2
  %28 = sub nsw i64 0, %27
  %29 = getelementptr inbounds i8, ptr addrspace(1) %24, i64 %28
  %30 = trunc nuw nsw i64 %27 to i32
  %31 = shl nuw nsw i32 %30, 3
  %32 = shl nuw nsw i32 255, %31
  %33 = xor i32 %32, -1
  %34 = load i32, ptr addrspace(1) %29, align 4
  %35 = zext nneg i8 %20 to i32
  %36 = select i1 %.not, i32 0, i32 %35
  %37 = shl nuw nsw i32 %36, %31
  br label %38

38:                                               ; preds = %38, %3
  %39 = phi i32 [ %43, %38 ], [ %34, %3 ]
  %40 = and i32 %39, %33
  %41 = or i32 %40, %37
  %42 = cmpxchg ptr addrspace(1) %29, i32 %39, i32 %41 monotonic monotonic, align 4
  %43 = extractvalue { i32, i1 } %42, 0
  %44 = extractvalue { i32, i1 } %42, 1
  br i1 %44, label %45, label %38

45:                                               ; preds = %38
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_6(ptr noalias align 256 dereferenceable(5414912) %0, ptr noalias readonly align 256 captures(none) dereferenceable(660) %1, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %2, ptr noalias readonly align 256 captures(none) dereferenceable(660) %3, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %4, ptr noalias readonly align 256 captures(none) dereferenceable(165) %5) local_unnamed_addr #9 {
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = addrspacecast ptr %3 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !735
  %15 = shl nuw nsw i32 %14, 7
  %16 = or disjoint i32 %15, %13
  %17 = udiv i32 %16, 165
  %18 = mul i32 %17, 165
  %.decomposed = sub i32 %16, %18
  %19 = zext nneg i32 %.decomposed to i64
  %20 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %19
  %21 = load i32, ptr addrspace(1) %20, align 4, !invariant.load !4, !alias.scope !736
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_and_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(8080) %0, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %1, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %2, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %3, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %6) local_unnamed_addr #0 {
  %8 = addrspacecast ptr %2 to ptr addrspace(1)
  %9 = addrspacecast ptr %3 to ptr addrspace(1)
  %10 = addrspacecast ptr %4 to ptr addrspace(1)
  %11 = addrspacecast ptr %5 to ptr addrspace(1)
  %12 = addrspacecast ptr %1 to ptr addrspace(1)
  %13 = addrspacecast ptr %0 to ptr addrspace(1)
  %14 = addrspacecast ptr %6 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %17 = shl nuw nsw i32 %15, 7
  %18 = or disjoint i32 %17, %16
  %19 = zext nneg i32 %18 to i64
  %20 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %19
  %21 = load i8, ptr addrspace(1) %20, align 1, !invariant.load !4
  %22 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %19
  %23 = load i8, ptr addrspace(1) %22, align 1, !invariant.load !4
  %24 = or i8 %23, %21
  %25 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %19
  %26 = load i32, ptr addrspace(1) %25, align 4, !invariant.load !4
  %27 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %19
  %28 = load i32, ptr addrspace(1) %27, align 4, !invariant.load !4
  %29 = icmp slt i32 %26, %28
  %30 = add i32 %26, 14
  %31 = select i1 %29, i32 %30, i32 %26
  %32 = tail call i32 @llvm.smax.i32(i32 %31, i32 0)
  %33 = tail call i32 @llvm.umin.i32(i32 %32, i32 13)
  %34 = mul nuw nsw i32 %18, 14
  %35 = add nuw nsw i32 %33, %34
  %36 = zext nneg i32 %35 to i64
  %37 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %36
  %38 = load i32, ptr addrspace(1) %37, align 4, !invariant.load !4
  %39 = tail call i32 @llvm.smax.i32(i32 %38, i32 0)
  %40 = tail call i32 @llvm.umin.i32(i32 %39, i32 100)
  %41 = mul nuw nsw i32 %40, 20
  %42 = zext nneg i32 %41 to i64
  %43 = getelementptr inbounds float, ptr addrspace(1) %13, i64 %42
  %44 = getelementptr inbounds i8, ptr addrspace(1) %43, i64 48
  %45 = load float, ptr addrspace(1) %44, align 16, !invariant.load !4
  %.inv = fcmp ole float %45, 0xC1E0000000000000
  %46 = select i1 %.inv, float 0xC1E0000000000000, float %45
  %47 = fptosi float %46 to i32
  %48 = fcmp oge float %45, 0x41E0000000000000
  %49 = fcmp ord float %45, 0.000000e+00
  %50 = icmp sgt i32 %47, 0
  %51 = select i1 %48, i1 true, i1 %50
  %52 = select i1 %49, i1 %51, i1 false
  %53 = icmp eq i8 %24, 0
  %54 = and i1 %53, %52
  %55 = zext i1 %54 to i8
  %56 = getelementptr inbounds i8, ptr addrspace(1) %14, i64 %19
  store i8 %55, ptr addrspace(1) %56, align 1
  ret void
}

; Function Attrs: nofree norecurse nounwind memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion(ptr noalias align 256 dereferenceable(5414912) %0, ptr noalias readonly align 256 captures(none) dereferenceable(660) %1, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %2, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %3) local_unnamed_addr #9 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !735
  %11 = shl nuw nsw i32 %10, 7
  %12 = or disjoint i32 %11, %9
  %13 = udiv i32 %12, 165
  %14 = mul i32 %13, 165
  %.decomposed = sub i32 %12, %14
  %15 = zext nneg i32 %.decomposed to i64
  %16 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %15
  %17 = load i32, ptr addrspace(1) %16, align 4, !invariant.load !4, !alias.scope !739
  %18 = icmp ult i32 %17, 1322
  br i1 %18, label %19, label %.loopexit

19:                                               ; preds = %4
  %20 = zext nneg i32 %13 to i64
  %21 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %20
  %22 = load i8, ptr addrspace(1) %21, align 1, !invariant.load !4
  %23 = zext nneg i32 %12 to i64
  %24 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %23
  %25 = load i8, ptr addrspace(1) %24, align 1, !invariant.load !4
  %26 = and i8 %25, %22
  %27 = mul nuw nsw i32 %13, 1322
  %28 = add nuw nsw i32 %17, %27
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr addrspace(1) %8, i64 %29
  %31 = addrspacecast ptr addrspace(1) %30 to ptr
  %32 = ptrtoint ptr %31 to i64
  %33 = and i64 %32, 3
  %34 = sub nsw i64 0, %33
  %35 = getelementptr inbounds i8, ptr addrspace(1) %30, i64 %34
  %36 = trunc nuw nsw i64 %33 to i32
  %37 = shl nuw nsw i32 %36, 3
  %38 = shl nuw i32 255, %37
  %39 = xor i32 %38, -1
  %40 = load i32, ptr addrspace(1) %35, align 4
  %41 = zext i8 %26 to i32
  %42 = shl nuw i32 %41, %37
  br label %43

43:                                               ; preds = %43, %19
  %44 = phi i32 [ %48, %43 ], [ %40, %19 ]
  %45 = and i32 %44, %39
  %46 = or i32 %45, %42
  %47 = cmpxchg ptr addrspace(1) %35, i32 %44, i32 %46 monotonic monotonic, align 4
  %48 = extractvalue { i32, i1 } %47, 0
  %49 = extractvalue { i32, i1 } %47, 1
  br i1 %49, label %.loopexit, label %43

.loopexit:                                        ; preds = %43, %4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_4(ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(57344) %2) local_unnamed_addr #5 {
  %4 = addrspacecast ptr %0 to ptr addrspace(1)
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
define ptx_kernel void @loop_select_fusion_2(ptr noalias align 256 captures(none) dereferenceable(5414912) %0, ptr noalias readonly align 256 captures(none) dereferenceable(4096) %1, ptr noalias readonly align 256 captures(none) dereferenceable(5414912) %2, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %3, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5) local_unnamed_addr #0 {
  %7 = addrspacecast ptr %0 to ptr addrspace(1)
  %8 = addrspacecast ptr %4 to ptr addrspace(1)
  %9 = addrspacecast ptr %5 to ptr addrspace(1)
  %10 = addrspacecast ptr %3 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %1 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !734
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %15 = shl nuw nsw i32 %14, 2
  %16 = shl nuw nsw i32 %13, 9
  %17 = or disjoint i32 %15, %16
  %18 = zext nneg i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %18
  %20 = load <4 x i8>, ptr addrspace(1) %19, align 4
  %21 = shl nuw nsw i32 %14, 1
  %22 = shl nuw nsw i32 %13, 8
  %23 = or disjoint i32 %21, %22
  %24 = udiv i32 %23, 661
  %25 = urem i32 %17, 1322
  %26 = icmp samesign ugt i32 %25, 1320
  br i1 %26, label %51, label %27

27:                                               ; preds = %6
  %28 = icmp eq i32 %25, 1320
  br i1 %28, label %29, label %48

29:                                               ; preds = %27
  %30 = tail call i32 @llvm.umin.i32(i32 %24, i32 4095)
  %31 = zext nneg i32 %24 to i64
  %32 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %31
  %33 = load i32, ptr addrspace(1) %32, align 4, !invariant.load !4
  %34 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %31
  %35 = load i32, ptr addrspace(1) %34, align 4, !invariant.load !4
  %36 = icmp slt i32 %33, %35
  %37 = add i32 %33, 14
  %38 = select i1 %36, i32 %37, i32 %33
  %39 = tail call i32 @llvm.smax.i32(i32 %38, i32 0)
  %40 = tail call i32 @llvm.umin.i32(i32 %39, i32 13)
  %41 = mul nuw nsw i32 %30, 14
  %42 = add nuw nsw i32 %40, %41
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %43
  %45 = load i8, ptr addrspace(1) %44, align 1, !invariant.load !4
  %46 = icmp eq i8 %45, 0
  %47 = zext i1 %46 to i8
  br label %51

48:                                               ; preds = %27
  %49 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %18
  %50 = load i8, ptr addrspace(1) %49, align 4, !invariant.load !4
  br label %51

51:                                               ; preds = %6, %48, %29
  %52 = phi i8 [ 1, %6 ], [ %50, %48 ], [ %47, %29 ]
  %53 = trunc i64 %18 to i32
  %54 = or disjoint i32 %53, 1
  %55 = urem i32 %54, 1322
  %56 = icmp samesign ugt i32 %55, 1320
  %57 = getelementptr inbounds i8, ptr addrspace(1) %11, i64 %18
  br i1 %56, label %60, label %58

58:                                               ; preds = %51
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %57, i64 1
  %59 = load i8, ptr addrspace(1) %sunkaddr, align 1, !invariant.load !4
  br label %60

60:                                               ; preds = %51, %58
  %61 = phi i8 [ 1, %51 ], [ %59, %58 ]
  %62 = trunc i64 %18 to i32
  %63 = or disjoint i32 %23, 1
  %64 = udiv i32 %63, 661
  %65 = or disjoint i32 %62, 2
  %66 = urem i32 %65, 1322
  %67 = icmp samesign ugt i32 %66, 1320
  br i1 %67, label %92, label %68

68:                                               ; preds = %60
  %69 = icmp eq i32 %66, 1320
  br i1 %69, label %70, label %89

70:                                               ; preds = %68
  %71 = tail call i32 @llvm.umin.i32(i32 %64, i32 4095)
  %72 = zext nneg i32 %64 to i64
  %73 = getelementptr inbounds i32, ptr addrspace(1) %8, i64 %72
  %74 = load i32, ptr addrspace(1) %73, align 4, !invariant.load !4
  %75 = getelementptr inbounds i32, ptr addrspace(1) %9, i64 %72
  %76 = load i32, ptr addrspace(1) %75, align 4, !invariant.load !4
  %77 = icmp slt i32 %74, %76
  %78 = add i32 %74, 14
  %79 = select i1 %77, i32 %78, i32 %74
  %80 = tail call i32 @llvm.smax.i32(i32 %79, i32 0)
  %81 = tail call i32 @llvm.umin.i32(i32 %80, i32 13)
  %82 = mul nuw nsw i32 %71, 14
  %83 = add nuw nsw i32 %81, %82
  %84 = zext nneg i32 %83 to i64
  %85 = getelementptr inbounds i8, ptr addrspace(1) %10, i64 %84
  %86 = load i8, ptr addrspace(1) %85, align 1, !invariant.load !4
  %87 = icmp eq i8 %86, 0
  %88 = zext i1 %87 to i8
  br label %92

89:                                               ; preds = %68
  %90 = getelementptr inbounds i8, ptr addrspace(1) %57, i64 2
  %91 = load i8, ptr addrspace(1) %90, align 2, !invariant.load !4
  br label %92

92:                                               ; preds = %60, %89, %70
  %93 = phi i8 [ 1, %60 ], [ %91, %89 ], [ %88, %70 ]
  %94 = trunc i64 %18 to i32
  %95 = or disjoint i32 %94, 3
  %96 = udiv i32 %95, 1322
  %97 = mul i32 %96, 1322
  %.decomposed = sub i32 %95, %97
  %98 = icmp samesign ugt i32 %.decomposed, 1320
  br i1 %98, label %101, label %99

99:                                               ; preds = %92
  %sunkaddr32 = getelementptr inbounds i8, ptr addrspace(1) %57, i64 3
  %100 = load i8, ptr addrspace(1) %sunkaddr32, align 1, !invariant.load !4
  br label %101

101:                                              ; preds = %92, %99
  %102 = phi i8 [ 1, %92 ], [ %100, %99 ]
  %103 = zext nneg i32 %96 to i64
  %104 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %103
  %105 = load i8, ptr addrspace(1) %104, align 1, !invariant.load !4
  %106 = zext nneg i32 %24 to i64
  %107 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %106
  %108 = load i8, ptr addrspace(1) %107, align 1, !invariant.load !4
  %109 = trunc i8 %108 to i1
  %110 = extractelement <4 x i8> %20, i64 0
  %111 = select i1 %109, i8 %52, i8 %110
  %112 = insertelement <4 x i8> poison, i8 %111, i64 0
  %113 = extractelement <4 x i8> %20, i64 1
  %114 = select i1 %109, i8 %61, i8 %113
  %115 = insertelement <4 x i8> %112, i8 %114, i64 1
  %116 = zext nneg i32 %64 to i64
  %117 = getelementptr inbounds i8, ptr addrspace(1) %12, i64 %116
  %118 = load i8, ptr addrspace(1) %117, align 1, !invariant.load !4
  %119 = trunc i8 %118 to i1
  %120 = extractelement <4 x i8> %20, i64 2
  %121 = select i1 %119, i8 %93, i8 %120
  %122 = insertelement <4 x i8> %115, i8 %121, i64 2
  %123 = extractelement <4 x i8> %20, i64 3
  %124 = trunc i8 %105 to i1
  %125 = select i1 %124, i8 %102, i8 %123
  %126 = insertelement <4 x i8> %122, i8 %125, i64 3
  store <4 x i8> %126, ptr addrspace(1) %19, align 4
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_transpose_fusion_3(ptr noalias readonly align 256 captures(none) dereferenceable(229376) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %8) local_unnamed_addr #0 {
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %2 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %5 to ptr addrspace(1)
  %16 = addrspacecast ptr %6 to ptr addrspace(1)
  %17 = addrspacecast ptr %7 to ptr addrspace(1)
  %18 = addrspacecast ptr %8 to ptr addrspace(1)
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !742
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %21 = shl nuw nsw i32 %20, 2
  %22 = shl nuw nsw i32 %19, 9
  %23 = or disjoint i32 %21, %22
  %24 = udiv i32 %23, 3
  %25 = mul i32 %24, 3
  %.decomposed = sub i32 %23, %25
  %26 = shl nuw nsw i32 %20, 1
  %27 = shl nuw nsw i32 %19, 8
  %28 = or disjoint i32 %26, %27
  %29 = udiv i32 %28, 21
  %30 = icmp eq i32 %.decomposed, 0
  br i1 %30, label %40, label %31

31:                                               ; preds = %9
  %32 = icmp eq i32 %.decomposed, 1
  %33 = zext nneg i32 %24 to i64
  %34 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %33
  br i1 %32, label %35, label %40

35:                                               ; preds = %31
  %36 = load i32, ptr addrspace(1) %34, align 4, !invariant.load !4
  %37 = icmp slt i32 %36, 0
  %38 = add i32 %36, 165
  %39 = select i1 %37, i32 %38, i32 %36
  br label %40

40:                                               ; preds = %9, %35, %31
  %41 = phi i32 [ %29, %9 ], [ %39, %35 ], [ 4, %31 ]
  %42 = phi i32 [ %29, %9 ], [ %39, %35 ], [ 8, %31 ]
  %43 = phi i32 [ %29, %9 ], [ %39, %35 ], [ 5, %31 ]
  %44 = phi i32 [ %29, %9 ], [ %39, %35 ], [ 9, %31 ]
  %45 = phi i32 [ %29, %9 ], [ %39, %35 ], [ 0, %31 ]
  %46 = phi i32 [ %29, %9 ], [ %39, %35 ], [ 1, %31 ]
  %47 = phi i32 [ %29, %9 ], [ %39, %35 ], [ 2, %31 ]
  %48 = phi i32 [ %29, %9 ], [ %39, %35 ], [ 3, %31 ]
  %49 = or disjoint i32 %23, 1
  %50 = udiv i32 %49, 3
  %51 = mul i32 %50, 3
  %.decomposed4 = sub i32 %49, %51
  switch i32 %.decomposed4, label %.fold.split [
    i32 0, label %59
    i32 1, label %52
  ]

52:                                               ; preds = %40
  %53 = zext nneg i32 %50 to i64
  %54 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %53
  %55 = load i32, ptr addrspace(1) %54, align 4, !invariant.load !4
  %56 = icmp slt i32 %55, 0
  %57 = add i32 %55, 165
  %58 = select i1 %56, i32 %57, i32 %55
  br label %59

.fold.split:                                      ; preds = %40
  br label %59

59:                                               ; preds = %40, %.fold.split, %52
  %60 = phi i32 [ %29, %40 ], [ %58, %52 ], [ 4, %.fold.split ]
  %61 = phi i32 [ %29, %40 ], [ %58, %52 ], [ 8, %.fold.split ]
  %62 = phi i32 [ %29, %40 ], [ %58, %52 ], [ 5, %.fold.split ]
  %63 = phi i32 [ %29, %40 ], [ %58, %52 ], [ 9, %.fold.split ]
  %64 = phi i32 [ %29, %40 ], [ %58, %52 ], [ 0, %.fold.split ]
  %65 = phi i32 [ %29, %40 ], [ %58, %52 ], [ 1, %.fold.split ]
  %66 = phi i32 [ %29, %40 ], [ %58, %52 ], [ 2, %.fold.split ]
  %67 = phi i32 [ %29, %40 ], [ %58, %52 ], [ 3, %.fold.split ]
  %68 = or disjoint i32 %23, 2
  %69 = udiv i32 %68, 3
  %70 = mul i32 %69, 3
  %.decomposed5 = sub i32 %68, %70
  %71 = or disjoint i32 %28, 1
  %72 = udiv i32 %71, 21
  switch i32 %.decomposed5, label %.fold.split3 [
    i32 0, label %80
    i32 1, label %73
  ]

73:                                               ; preds = %59
  %74 = zext nneg i32 %69 to i64
  %75 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %74
  %76 = load i32, ptr addrspace(1) %75, align 4, !invariant.load !4
  %77 = icmp slt i32 %76, 0
  %78 = add i32 %76, 165
  %79 = select i1 %77, i32 %78, i32 %76
  br label %80

.fold.split3:                                     ; preds = %59
  br label %80

80:                                               ; preds = %59, %.fold.split3, %73
  %81 = phi i32 [ %72, %59 ], [ %79, %73 ], [ 4, %.fold.split3 ]
  %82 = phi i32 [ %72, %59 ], [ %79, %73 ], [ 8, %.fold.split3 ]
  %83 = phi i32 [ %72, %59 ], [ %79, %73 ], [ 5, %.fold.split3 ]
  %84 = phi i32 [ %72, %59 ], [ %79, %73 ], [ 9, %.fold.split3 ]
  %85 = phi i32 [ %72, %59 ], [ %79, %73 ], [ 0, %.fold.split3 ]
  %86 = phi i32 [ %72, %59 ], [ %79, %73 ], [ 1, %.fold.split3 ]
  %87 = phi i32 [ %72, %59 ], [ %79, %73 ], [ 2, %.fold.split3 ]
  %88 = phi i32 [ %72, %59 ], [ %79, %73 ], [ 3, %.fold.split3 ]
  %89 = icmp eq i32 %.decomposed, 0
  %90 = udiv i32 %68, 42
  br i1 %89, label %100, label %91

91:                                               ; preds = %80
  %92 = icmp eq i32 %.decomposed, 1
  %93 = zext nneg i32 %24 to i64
  %94 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %93
  br i1 %92, label %95, label %100

95:                                               ; preds = %91
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %94, i64 4
  %96 = load i32, ptr addrspace(1) %sunkaddr, align 4, !invariant.load !4
  %97 = icmp slt i32 %96, 0
  %98 = add i32 %96, 165
  %99 = select i1 %97, i32 %98, i32 %96
  br label %100

100:                                              ; preds = %80, %95, %91
  %101 = phi i32 [ %90, %80 ], [ %99, %95 ], [ 4, %91 ]
  %102 = phi i32 [ %90, %80 ], [ %99, %95 ], [ 8, %91 ]
  %103 = phi i32 [ %90, %80 ], [ %99, %95 ], [ 5, %91 ]
  %104 = phi i32 [ %90, %80 ], [ %99, %95 ], [ 9, %91 ]
  %105 = phi i32 [ %90, %80 ], [ %99, %95 ], [ 0, %91 ]
  %106 = phi i32 [ %90, %80 ], [ %99, %95 ], [ 1, %91 ]
  %107 = phi i32 [ %90, %80 ], [ %99, %95 ], [ 2, %91 ]
  %108 = phi i32 [ %90, %80 ], [ %99, %95 ], [ 3, %91 ]
  %109 = insertelement <4 x i32> poison, i32 %41, i64 0
  %110 = insertelement <4 x i32> %109, i32 %60, i64 1
  %111 = insertelement <4 x i32> %110, i32 %81, i64 2
  %112 = insertelement <4 x i32> poison, i32 %42, i64 0
  %113 = insertelement <4 x i32> %112, i32 %61, i64 1
  %114 = insertelement <4 x i32> %113, i32 %82, i64 2
  %115 = insertelement <4 x i32> poison, i32 %43, i64 0
  %116 = insertelement <4 x i32> %115, i32 %62, i64 1
  %117 = insertelement <4 x i32> %116, i32 %83, i64 2
  %118 = insertelement <4 x i32> poison, i32 %44, i64 0
  %119 = insertelement <4 x i32> %118, i32 %63, i64 1
  %120 = insertelement <4 x i32> %119, i32 %84, i64 2
  %121 = insertelement <4 x i32> poison, i32 %45, i64 0
  %122 = insertelement <4 x i32> %121, i32 %64, i64 1
  %123 = insertelement <4 x i32> %122, i32 %85, i64 2
  %124 = insertelement <4 x i32> poison, i32 %46, i64 0
  %125 = insertelement <4 x i32> %124, i32 %65, i64 1
  %126 = insertelement <4 x i32> %125, i32 %86, i64 2
  %127 = insertelement <4 x i32> poison, i32 %47, i64 0
  %128 = insertelement <4 x i32> %127, i32 %66, i64 1
  %129 = insertelement <4 x i32> %128, i32 %87, i64 2
  %130 = insertelement <4 x i32> poison, i32 %48, i64 0
  %131 = insertelement <4 x i32> %130, i32 %67, i64 1
  %132 = insertelement <4 x i32> %131, i32 %88, i64 2
  %133 = insertelement <4 x i32> %132, i32 %108, i64 3
  %134 = insertelement <4 x i32> %129, i32 %107, i64 3
  %135 = insertelement <4 x i32> %126, i32 %106, i64 3
  %136 = insertelement <4 x i32> %123, i32 %105, i64 3
  %137 = insertelement <4 x i32> %120, i32 %104, i64 3
  %138 = insertelement <4 x i32> %117, i32 %103, i64 3
  %139 = insertelement <4 x i32> %114, i32 %102, i64 3
  %140 = insertelement <4 x i32> %111, i32 %101, i64 3
  %141 = zext nneg i32 %23 to i64
  %142 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %141
  store <4 x i32> %140, ptr addrspace(1) %142, align 16
  %143 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %141
  store <4 x i32> %139, ptr addrspace(1) %143, align 16
  %144 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %141
  store <4 x i32> %138, ptr addrspace(1) %144, align 16
  %145 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %141
  store <4 x i32> %137, ptr addrspace(1) %145, align 16
  %146 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %141
  store <4 x i32> %136, ptr addrspace(1) %146, align 16
  %147 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %141
  store <4 x i32> %135, ptr addrspace(1) %147, align 16
  %148 = getelementptr inbounds i32, ptr addrspace(1) %17, i64 %141
  store <4 x i32> %134, ptr addrspace(1) %148, align 16
  %149 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %141
  store <4 x i32> %133, ptr addrspace(1) %149, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write)
define ptx_kernel void @loop_broadcast_fusion_1(ptr noalias writeonly align 256 captures(none) dereferenceable(32440320) %0) local_unnamed_addr #5 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !743
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
define ptx_kernel void @input_scatter_fusion_28(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %3, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5) local_unnamed_addr #10 {
  %7 = addrspacecast ptr %1 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %4 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %2 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %14 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %25 = icmp ult i32 %20, 4096
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
define ptx_kernel void @loop_transpose_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(229376) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %2, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %3, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %4, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %5, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %7, ptr noalias writeonly align 256 captures(none) dereferenceable(688128) %8) local_unnamed_addr #0 {
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %2 to ptr addrspace(1)
  %13 = addrspacecast ptr %3 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %5 to ptr addrspace(1)
  %16 = addrspacecast ptr %6 to ptr addrspace(1)
  %17 = addrspacecast ptr %7 to ptr addrspace(1)
  %18 = addrspacecast ptr %8 to ptr addrspace(1)
  %19 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !742
  %20 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %21 = shl nuw nsw i32 %20, 2
  %22 = shl nuw nsw i32 %19, 9
  %23 = or disjoint i32 %21, %22
  %24 = udiv i32 %23, 3
  %25 = mul i32 %24, 3
  %.decomposed = sub i32 %23, %25
  %26 = shl nuw nsw i32 %20, 1
  %27 = shl nuw nsw i32 %19, 8
  %28 = or disjoint i32 %26, %27
  %29 = udiv i32 %28, 21
  %30 = icmp eq i32 %.decomposed, 0
  br i1 %30, label %37, label %31

31:                                               ; preds = %9
  %32 = icmp eq i32 %.decomposed, 1
  %33 = zext nneg i32 %24 to i64
  %34 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %33
  br i1 %32, label %35, label %37

35:                                               ; preds = %31
  %36 = load i32, ptr addrspace(1) %34, align 4, !invariant.load !4
  br label %37

37:                                               ; preds = %9, %35, %31
  %38 = phi i32 [ %29, %9 ], [ %36, %35 ], [ 9, %31 ]
  %39 = phi i32 [ %29, %9 ], [ %36, %35 ], [ 0, %31 ]
  %40 = phi i32 [ %29, %9 ], [ %36, %35 ], [ 1, %31 ]
  %41 = phi i32 [ %29, %9 ], [ %36, %35 ], [ 2, %31 ]
  %42 = phi i32 [ %29, %9 ], [ %36, %35 ], [ 3, %31 ]
  %43 = phi i32 [ %29, %9 ], [ %36, %35 ], [ 4, %31 ]
  %44 = phi i32 [ %29, %9 ], [ %36, %35 ], [ 5, %31 ]
  %45 = phi i32 [ %29, %9 ], [ %36, %35 ], [ 8, %31 ]
  %46 = or disjoint i32 %23, 1
  %47 = udiv i32 %46, 3
  %48 = mul i32 %47, 3
  %.decomposed4 = sub i32 %46, %48
  switch i32 %.decomposed4, label %.fold.split [
    i32 0, label %53
    i32 1, label %49
  ]

49:                                               ; preds = %37
  %50 = zext nneg i32 %47 to i64
  %51 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %50
  %52 = load i32, ptr addrspace(1) %51, align 4, !invariant.load !4
  br label %53

.fold.split:                                      ; preds = %37
  br label %53

53:                                               ; preds = %37, %.fold.split, %49
  %54 = phi i32 [ %29, %37 ], [ %52, %49 ], [ 9, %.fold.split ]
  %55 = phi i32 [ %29, %37 ], [ %52, %49 ], [ 0, %.fold.split ]
  %56 = phi i32 [ %29, %37 ], [ %52, %49 ], [ 1, %.fold.split ]
  %57 = phi i32 [ %29, %37 ], [ %52, %49 ], [ 2, %.fold.split ]
  %58 = phi i32 [ %29, %37 ], [ %52, %49 ], [ 3, %.fold.split ]
  %59 = phi i32 [ %29, %37 ], [ %52, %49 ], [ 4, %.fold.split ]
  %60 = phi i32 [ %29, %37 ], [ %52, %49 ], [ 5, %.fold.split ]
  %61 = phi i32 [ %29, %37 ], [ %52, %49 ], [ 8, %.fold.split ]
  %62 = or disjoint i32 %23, 2
  %63 = udiv i32 %62, 3
  %64 = mul i32 %63, 3
  %.decomposed5 = sub i32 %62, %64
  %65 = or disjoint i32 %28, 1
  %66 = udiv i32 %65, 21
  switch i32 %.decomposed5, label %.fold.split3 [
    i32 0, label %71
    i32 1, label %67
  ]

67:                                               ; preds = %53
  %68 = zext nneg i32 %63 to i64
  %69 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %68
  %70 = load i32, ptr addrspace(1) %69, align 4, !invariant.load !4
  br label %71

.fold.split3:                                     ; preds = %53
  br label %71

71:                                               ; preds = %53, %.fold.split3, %67
  %72 = phi i32 [ %66, %53 ], [ %70, %67 ], [ 9, %.fold.split3 ]
  %73 = phi i32 [ %66, %53 ], [ %70, %67 ], [ 0, %.fold.split3 ]
  %74 = phi i32 [ %66, %53 ], [ %70, %67 ], [ 1, %.fold.split3 ]
  %75 = phi i32 [ %66, %53 ], [ %70, %67 ], [ 2, %.fold.split3 ]
  %76 = phi i32 [ %66, %53 ], [ %70, %67 ], [ 3, %.fold.split3 ]
  %77 = phi i32 [ %66, %53 ], [ %70, %67 ], [ 4, %.fold.split3 ]
  %78 = phi i32 [ %66, %53 ], [ %70, %67 ], [ 5, %.fold.split3 ]
  %79 = phi i32 [ %66, %53 ], [ %70, %67 ], [ 8, %.fold.split3 ]
  %80 = icmp eq i32 %.decomposed, 0
  %81 = udiv i32 %62, 42
  br i1 %80, label %88, label %82

82:                                               ; preds = %71
  %83 = icmp eq i32 %.decomposed, 1
  %84 = zext nneg i32 %24 to i64
  %85 = getelementptr inbounds i32, ptr addrspace(1) %10, i64 %84
  br i1 %83, label %86, label %88

86:                                               ; preds = %82
  %sunkaddr = getelementptr inbounds i8, ptr addrspace(1) %85, i64 4
  %87 = load i32, ptr addrspace(1) %sunkaddr, align 4, !invariant.load !4
  br label %88

88:                                               ; preds = %71, %86, %82
  %89 = phi i32 [ %81, %71 ], [ %87, %86 ], [ 9, %82 ]
  %90 = phi i32 [ %81, %71 ], [ %87, %86 ], [ 0, %82 ]
  %91 = phi i32 [ %81, %71 ], [ %87, %86 ], [ 1, %82 ]
  %92 = phi i32 [ %81, %71 ], [ %87, %86 ], [ 2, %82 ]
  %93 = phi i32 [ %81, %71 ], [ %87, %86 ], [ 3, %82 ]
  %94 = phi i32 [ %81, %71 ], [ %87, %86 ], [ 4, %82 ]
  %95 = phi i32 [ %81, %71 ], [ %87, %86 ], [ 5, %82 ]
  %96 = phi i32 [ %81, %71 ], [ %87, %86 ], [ 8, %82 ]
  %97 = insertelement <4 x i32> poison, i32 %38, i64 0
  %98 = insertelement <4 x i32> %97, i32 %54, i64 1
  %99 = insertelement <4 x i32> %98, i32 %72, i64 2
  %100 = insertelement <4 x i32> poison, i32 %39, i64 0
  %101 = insertelement <4 x i32> %100, i32 %55, i64 1
  %102 = insertelement <4 x i32> %101, i32 %73, i64 2
  %103 = insertelement <4 x i32> poison, i32 %40, i64 0
  %104 = insertelement <4 x i32> %103, i32 %56, i64 1
  %105 = insertelement <4 x i32> %104, i32 %74, i64 2
  %106 = insertelement <4 x i32> poison, i32 %41, i64 0
  %107 = insertelement <4 x i32> %106, i32 %57, i64 1
  %108 = insertelement <4 x i32> %107, i32 %75, i64 2
  %109 = insertelement <4 x i32> poison, i32 %42, i64 0
  %110 = insertelement <4 x i32> %109, i32 %58, i64 1
  %111 = insertelement <4 x i32> %110, i32 %76, i64 2
  %112 = insertelement <4 x i32> poison, i32 %43, i64 0
  %113 = insertelement <4 x i32> %112, i32 %59, i64 1
  %114 = insertelement <4 x i32> %113, i32 %77, i64 2
  %115 = insertelement <4 x i32> poison, i32 %44, i64 0
  %116 = insertelement <4 x i32> %115, i32 %60, i64 1
  %117 = insertelement <4 x i32> %116, i32 %78, i64 2
  %118 = insertelement <4 x i32> poison, i32 %45, i64 0
  %119 = insertelement <4 x i32> %118, i32 %61, i64 1
  %120 = insertelement <4 x i32> %119, i32 %79, i64 2
  %121 = insertelement <4 x i32> %120, i32 %96, i64 3
  %122 = insertelement <4 x i32> %117, i32 %95, i64 3
  %123 = insertelement <4 x i32> %114, i32 %94, i64 3
  %124 = insertelement <4 x i32> %111, i32 %93, i64 3
  %125 = insertelement <4 x i32> %108, i32 %92, i64 3
  %126 = insertelement <4 x i32> %105, i32 %91, i64 3
  %127 = insertelement <4 x i32> %102, i32 %90, i64 3
  %128 = insertelement <4 x i32> %99, i32 %89, i64 3
  %129 = zext nneg i32 %23 to i64
  %130 = getelementptr inbounds i32, ptr addrspace(1) %11, i64 %129
  store <4 x i32> %128, ptr addrspace(1) %130, align 16
  %131 = getelementptr inbounds i32, ptr addrspace(1) %12, i64 %129
  store <4 x i32> %127, ptr addrspace(1) %131, align 16
  %132 = getelementptr inbounds i32, ptr addrspace(1) %13, i64 %129
  store <4 x i32> %126, ptr addrspace(1) %132, align 16
  %133 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %129
  store <4 x i32> %125, ptr addrspace(1) %133, align 16
  %134 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %129
  store <4 x i32> %124, ptr addrspace(1) %134, align 16
  %135 = getelementptr inbounds i32, ptr addrspace(1) %16, i64 %129
  store <4 x i32> %123, ptr addrspace(1) %135, align 16
  %136 = getelementptr inbounds i32, ptr addrspace(1) %17, i64 %129
  store <4 x i32> %122, ptr addrspace(1) %136, align 16
  %137 = getelementptr inbounds i32, ptr addrspace(1) %18, i64 %129
  store <4 x i32> %121, ptr addrspace(1) %137, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_27(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %6) local_unnamed_addr #10 {
  %8 = addrspacecast ptr %1 to ptr addrspace(1)
  %9 = addrspacecast ptr %4 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %6 to ptr addrspace(1)
  %12 = addrspacecast ptr %3 to ptr addrspace(1)
  %13 = addrspacecast ptr %2 to ptr addrspace(1)
  %14 = addrspacecast ptr %0 to ptr addrspace(1)
  %15 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %16 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %27 = icmp ult i32 %22, 4096
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
define ptx_kernel void @input_scatter_fusion_26(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %3) local_unnamed_addr #10 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %21 = icmp ult i32 %16, 4096
  %22 = icmp ult i32 %18, 165
  %23 = and i1 %21, %22
  %24 = icmp ult i32 %20, 12
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %53

26:                                               ; preds = %4
  %27 = shl nuw nsw i32 %10, 7
  %28 = or disjoint i32 %27, %9
  %29 = zext nneg i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr addrspace(1) %6, i64 %29
  %31 = load i8, ptr addrspace(1) %30, align 1, !invariant.load !4
  %32 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %29
  %33 = load i8, ptr addrspace(1) %32, align 1, !invariant.load !4
  %34 = sitofp i8 %31 to float
  %35 = trunc i8 %33 to i1
  %36 = select i1 %35, float %34, float 0.000000e+00
  %37 = mul nuw nsw i32 %16, 1980
  %38 = mul nuw nsw i32 %18, 12
  %39 = add nuw nsw i32 %38, %37
  %40 = add nuw nsw i32 %39, %20
  %41 = zext nneg i32 %40 to i64
  %42 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %41
  %43 = load float, ptr addrspace(1) %42, align 4
  %44 = fcmp ord float %43, 0.000000e+00
  %45 = fcmp ult float %43, %36
  %or.cond = select i1 %44, i1 %45, i1 false
  br i1 %or.cond, label %46, label %53

46:                                               ; preds = %26
  %47 = bitcast float %36 to i32
  %48 = icmp sgt i32 %47, -1
  br i1 %48, label %49, label %51

49:                                               ; preds = %46
  %50 = atomicrmw max ptr addrspace(1) %42, i32 %47 monotonic, align 4
  br label %53

51:                                               ; preds = %46
  %52 = atomicrmw umin ptr addrspace(1) %42, i32 %47 monotonic, align 4
  br label %53

53:                                               ; preds = %26, %51, %49, %4
  ret void
}

; Function Attrs: convergent nocallback nounwind memory(inaccessiblemem: readwrite)
declare i32 @llvm.nvvm.shfl.sync.bfly.i32(i32, i32, i32, i32) #12

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare float @llvm.nvvm.div.full(float, float) #14

define ptx_kernel void @fusion_488(ptr noalias align 256 dereferenceable(57344) %arg0, ptr noalias align 256 dereferenceable(229376) %arg1, ptr noalias align 256 dereferenceable(229376) %arg2) local_unnamed_addr #15 {
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
  %18 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %13, i1 %17) #19
  %19 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %14, i1 %17) #19
  %20 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %15, i1 %17) #19
  %21 = tail call i16 asm sideeffect "mov.u16 $0, 0x0;\0A\09@$2 ld.global.b16 { $0 }, [ $1 + 0 ];", "=c,l,b"(ptr addrspace(1) %16, i1 %17) #19
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
  %35 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %31, i1 %17) #19
  %36 = extractvalue { i32, i32 } %35, 0
  %37 = extractvalue { i32, i32 } %35, 1
  %38 = bitcast i32 %36 to float
  %39 = bitcast i32 %37 to float
  %40 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %32, i1 %17) #19
  %41 = extractvalue { i32, i32 } %40, 0
  %42 = extractvalue { i32, i32 } %40, 1
  %43 = bitcast i32 %41 to float
  %44 = bitcast i32 %42 to float
  %45 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %33, i1 %17) #19
  %46 = extractvalue { i32, i32 } %45, 0
  %47 = extractvalue { i32, i32 } %45, 1
  %48 = bitcast i32 %46 to float
  %49 = bitcast i32 %47 to float
  %50 = tail call { i32, i32 } asm sideeffect "mov.u32 $0, $2;\0A\09mov.u32 $1, $3;\0A\09@$5 ld.global.v2.b32 { $0, $1 }, [ $4 + 0 ];", "=r,=r,r,r,l,b"(i32 0, i32 0, ptr addrspace(1) %34, i1 %17) #19
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
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %129, i32 %131, ptr addrspace(1) %124, i1 %17) #19
  %132 = bitcast float %117 to i32
  %133 = select i1 %24, i32 %132, i32 0
  %134 = bitcast float %118 to i32
  %135 = select i1 %.not8, i32 0, i32 %134
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %133, i32 %135, ptr addrspace(1) %125, i1 %17) #19
  %136 = bitcast float %119 to i32
  %137 = select i1 %26, i32 %136, i32 0
  %138 = bitcast float %120 to i32
  %139 = select i1 %.not9, i32 0, i32 %138
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %137, i32 %139, ptr addrspace(1) %126, i1 %17) #19
  %140 = bitcast float %121 to i32
  %141 = select i1 %28, i32 %140, i32 0
  %142 = bitcast float %122 to i32
  %143 = select i1 %.not10, i32 0, i32 %142
  tail call void asm sideeffect "@$3 st.global.v2.b32 [ $2 + 0 ], { $0, $1 };", "r,r,l,b"(i32 %141, i32 %143, ptr addrspace(1) %127, i1 %17) #19
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_24(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %2) local_unnamed_addr #10 {
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = addrspacecast ptr %0 to ptr addrspace(1)
  %6 = addrspacecast ptr %2 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %19 = icmp ult i32 %14, 4096
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
define ptx_kernel void @input_scatter_fusion_22(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4) local_unnamed_addr #10 {
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = addrspacecast ptr %4 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = addrspacecast ptr %2 to ptr addrspace(1)
  %10 = addrspacecast ptr %0 to ptr addrspace(1)
  %11 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %12 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %23 = icmp ult i32 %18, 4096
  %24 = icmp ult i32 %20, 165
  %25 = and i1 %23, %24
  %26 = icmp ult i32 %22, 12
  %27 = and i1 %25, %26
  br i1 %27, label %28, label %65

28:                                               ; preds = %5
  %29 = shl nuw nsw i32 %12, 7
  %30 = or disjoint i32 %29, %11
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr addrspace(1) %7, i64 %31
  %33 = load i32, ptr addrspace(1) %32, align 4, !invariant.load !4
  %34 = tail call i32 @llvm.smax.i32(i32 %33, i32 0)
  %35 = tail call i32 @llvm.umin.i32(i32 %34, i32 100)
  %36 = mul nuw nsw i32 %35, 20
  %37 = zext nneg i32 %36 to i64
  %38 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %37
  %39 = getelementptr inbounds i8, ptr addrspace(1) %38, i64 48
  %40 = load float, ptr addrspace(1) %39, align 16, !invariant.load !4
  %.inv = fcmp ole float %40, 0xC1E0000000000000
  %41 = select i1 %.inv, float 0xC1E0000000000000, float %40
  %42 = fptosi float %41 to i32
  %43 = fcmp oge float %40, 0x41E0000000000000
  %44 = fcmp ord float %40, 0.000000e+00
  %45 = icmp sgt i32 %42, 0
  %46 = select i1 %43, i1 true, i1 %45
  %47 = select i1 %44, i1 %46, i1 false
  %48 = getelementptr inbounds i8, ptr addrspace(1) %9, i64 %31
  %49 = load i8, ptr addrspace(1) %48, align 1, !invariant.load !4
  %50 = uitofp i1 %47 to float
  %51 = trunc i8 %49 to i1
  %52 = select i1 %51, float %50, float 0.000000e+00
  %53 = mul nuw nsw i32 %18, 1980
  %54 = mul nuw nsw i32 %20, 12
  %55 = add nuw nsw i32 %54, %53
  %56 = add nuw nsw i32 %55, %22
  %57 = zext nneg i32 %56 to i64
  %58 = getelementptr inbounds float, ptr addrspace(1) %10, i64 %57
  %59 = load float, ptr addrspace(1) %58, align 4
  %60 = fcmp ord float %59, 0.000000e+00
  %61 = fcmp ult float %59, %52
  %or.cond = select i1 %60, i1 %61, i1 false
  %62 = bitcast float %52 to i32
  br i1 %or.cond, label %63, label %65

63:                                               ; preds = %28
  %64 = atomicrmw max ptr addrspace(1) %58, i32 %62 monotonic, align 4
  br label %65

65:                                               ; preds = %28, %63, %5
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_scatter_fusion_20(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %3) local_unnamed_addr #10 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %3 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %0 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %21 = icmp ult i32 %16, 4096
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
define ptx_kernel void @input_scatter_fusion_18(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %3) local_unnamed_addr #10 {
  %5 = addrspacecast ptr %1 to ptr addrspace(1)
  %6 = addrspacecast ptr %0 to ptr addrspace(1)
  %7 = addrspacecast ptr %2 to ptr addrspace(1)
  %8 = addrspacecast ptr %3 to ptr addrspace(1)
  %9 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %10 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %21 = icmp ult i32 %16, 4096
  %22 = icmp ult i32 %18, 165
  %23 = and i1 %21, %22
  %24 = icmp ult i32 %20, 12
  %25 = and i1 %23, %24
  br i1 %25, label %26, label %55

26:                                               ; preds = %4
  %27 = mul nuw nsw i32 %16, 1980
  %28 = mul nuw nsw i32 %18, 12
  %29 = add nuw nsw i32 %28, %27
  %30 = add nuw nsw i32 %29, %20
  %31 = zext nneg i32 %30 to i64
  %32 = getelementptr inbounds float, ptr addrspace(1) %6, i64 %31
  %33 = load float, ptr addrspace(1) %32, align 4
  %34 = fcmp uno float %33, 0.000000e+00
  br i1 %34, label %55, label %35

35:                                               ; preds = %26
  %36 = shl nuw nsw i32 %10, 7
  %37 = or disjoint i32 %36, %9
  %38 = zext nneg i32 %37 to i64
  %39 = getelementptr inbounds i8, ptr addrspace(1) %7, i64 %38
  %40 = load i8, ptr addrspace(1) %39, align 1, !invariant.load !4
  %41 = trunc i8 %40 to i1
  %42 = getelementptr inbounds float, ptr addrspace(1) %8, i64 %38
  %43 = load float, ptr addrspace(1) %42, align 4, !invariant.load !4
  %44 = select i1 %41, float %43, float 0.000000e+00
  %45 = fcmp uno float %44, 0.000000e+00
  %46 = select i1 %45, float 0x7FF8000000000000, float %44
  %47 = fcmp ult float %33, %46
  br i1 %47, label %48, label %55

48:                                               ; preds = %35
  %49 = bitcast float %46 to i32
  %50 = icmp sgt i32 %49, -1
  br i1 %50, label %51, label %53

51:                                               ; preds = %48
  %52 = atomicrmw max ptr addrspace(1) %32, i32 %49 monotonic, align 4
  br label %55

53:                                               ; preds = %48
  %54 = atomicrmw umin ptr addrspace(1) %32, i32 %49 monotonic, align 4
  br label %55

55:                                               ; preds = %26, %53, %51, %35, %4
  ret void
}

; Function Attrs: norecurse nounwind
define ptx_kernel void @input_transpose_fusion_1(ptr noalias readonly align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %1, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %2, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %3, ptr noalias readonly align 256 captures(none) dereferenceable(675840) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %6, ptr noalias writeonly align 256 captures(none) dereferenceable(32440320) %7) local_unnamed_addr #8 {
  %9 = addrspacecast ptr %0 to ptr addrspace(1)
  %10 = addrspacecast ptr %5 to ptr addrspace(1)
  %11 = addrspacecast ptr %6 to ptr addrspace(1)
  %12 = addrspacecast ptr %3 to ptr addrspace(1)
  %13 = addrspacecast ptr %4 to ptr addrspace(1)
  %14 = addrspacecast ptr %1 to ptr addrspace(1)
  %15 = addrspacecast ptr %2 to ptr addrspace(1)
  %16 = addrspacecast ptr %7 to ptr addrspace(1)
  %17 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %18 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !744
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
define ptx_kernel void @input_scatter_fusion_13(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %6, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %7, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %8, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %9) local_unnamed_addr #16 {
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = addrspacecast ptr %7 to ptr addrspace(1)
  %14 = addrspacecast ptr %5 to ptr addrspace(1)
  %15 = addrspacecast ptr %4 to ptr addrspace(1)
  %16 = addrspacecast ptr %3 to ptr addrspace(1)
  %17 = addrspacecast ptr %2 to ptr addrspace(1)
  %18 = addrspacecast ptr %6 to ptr addrspace(1)
  %19 = addrspacecast ptr %8 to ptr addrspace(1)
  %20 = addrspacecast ptr %9 to ptr addrspace(1)
  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %22 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %33 = icmp ult i32 %28, 4096
  %34 = icmp ult i32 %30, 165
  %35 = and i1 %33, %34
  %36 = icmp ult i32 %32, 12
  %37 = and i1 %35, %36
  br i1 %37, label %38, label %191

38:                                               ; preds = %10
  tail call void @llvm.experimental.noalias.scope.decl(metadata !745)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !748)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !750)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !753)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !755)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !758)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !760)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !763)
  %39 = mul nuw nsw i32 %28, 1980
  %40 = mul nuw nsw i32 %30, 12
  %41 = add nuw nsw i32 %40, %39
  %42 = add nuw nsw i32 %41, %32
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = fcmp uno float %45, 0.000000e+00
  br i1 %46, label %191, label %47

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
  %58 = tail call i32 @llvm.umin.i32(i32 %57, i32 4095)
  %59 = zext nneg i32 %58 to i64
  %60 = getelementptr inbounds float, ptr addrspace(1) %14, i64 %59
  %61 = load float, ptr addrspace(1) %60, align 4, !invariant.load !4, !alias.scope !763, !noalias !765
  %62 = mul nuw nsw i32 %58, 14
  %63 = tail call i32 @llvm.smax.i32(i32 %56, i32 0)
  %64 = tail call i32 @llvm.umin.i32(i32 %63, i32 13)
  %65 = add nuw nsw i32 %64, %62
  %66 = zext nneg i32 %65 to i64
  %67 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %66
  %68 = load i32, ptr addrspace(1) %67, align 4, !invariant.load !4, !alias.scope !753, !noalias !750
  %69 = tail call i32 @llvm.smax.i32(i32 %68, i32 0)
  %70 = tail call i32 @llvm.umin.i32(i32 %69, i32 100)
  %71 = mul nuw nsw i32 %70, 20
  %72 = zext nneg i32 %71 to i64
  %73 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %72
  %74 = getelementptr inbounds i8, ptr addrspace(1) %73, i64 24
  %75 = load float, ptr addrspace(1) %74, align 8, !invariant.load !4, !alias.scope !767, !noalias !770
  %76 = tail call float @llvm.maximum.f32(float %75, float 1.000000e+00)
  %77 = fdiv float %61, %76
  %78 = fcmp uno float %77, 0.000000e+00
  %79 = fcmp oge float %77, 0x41E0000000000000
  %.inv.i9 = fcmp ole float %77, 0xC1E0000000000000
  %80 = select i1 %.inv.i9, float 0xC1E0000000000000, float %77
  %81 = fptosi float %80 to i32
  %82 = tail call i32 @llvm.smax.i32(i32 %81, i32 1)
  %83 = getelementptr inbounds i8, ptr addrspace(1) %73, i64 8
  %84 = load <2 x float>, ptr addrspace(1) %83, align 8, !invariant.load !4, !noalias !4
  %85 = extractelement <2 x float> %84, i32 0
  %86 = extractelement <2 x float> %84, i32 1
  %87 = zext nneg i32 %49 to i64
  %88 = getelementptr inbounds i32, ptr addrspace(1) %15, i64 %87
  %89 = load i32, ptr addrspace(1) %88, align 4, !invariant.load !4, !alias.scope !748, !noalias !745
  %90 = tail call i32 @llvm.smax.i32(i32 %89, i32 0)
  %91 = tail call i32 @llvm.umin.i32(i32 %90, i32 100)
  %92 = mul nuw nsw i32 %91, 20
  %93 = zext nneg i32 %92 to i64
  %94 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %93
  %95 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 16
  %96 = load float, ptr addrspace(1) %95, align 16, !invariant.load !4, !alias.scope !772, !noalias !775
  %97 = zext nneg i32 %50 to i64
  %98 = getelementptr inbounds float, ptr addrspace(1) %14, i64 %97
  %99 = load float, ptr addrspace(1) %98, align 4, !invariant.load !4, !alias.scope !758, !noalias !777
  %100 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 24
  %101 = load float, ptr addrspace(1) %100, align 8, !invariant.load !4, !alias.scope !779, !noalias !782
  %102 = tail call float @llvm.maximum.f32(float %101, float 1.000000e+00)
  %103 = fdiv float %99, %102
  %104 = fcmp uno float %103, 0.000000e+00
  %105 = fcmp oge float %103, 0x41E0000000000000
  %.inv.i = fcmp ole float %103, 0xC1E0000000000000
  %106 = select i1 %.inv.i, float 0xC1E0000000000000, float %103
  %107 = fptosi float %106 to i32
  %108 = tail call i32 @llvm.smax.i32(i32 %107, i32 1)
  %109 = select i1 %105, i32 2147483647, i32 %108
  %110 = select i1 %104, i32 1, i32 %109
  %111 = load float, ptr addrspace(1) %73, align 16, !invariant.load !4, !alias.scope !750, !noalias !753
  %112 = getelementptr inbounds i8, ptr addrspace(1) %94, i64 4
  %113 = load float, ptr addrspace(1) %112, align 4, !invariant.load !4, !alias.scope !745, !noalias !748
  %114 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 %87
  %115 = load i8, ptr addrspace(1) %114, align 1, !invariant.load !4
  %116 = trunc i8 %115 to i1
  %117 = fcmp uno float %85, 0.000000e+00
  %118 = fcmp oge float %85, 0x41E0000000000000
  %.inv7 = fcmp ole float %85, 0xC1E0000000000000
  %119 = select i1 %.inv7, float 0xC1E0000000000000, float %85
  %120 = fptosi float %119 to i32
  %121 = select i1 %118, i32 2147483647, i32 %120
  %122 = select i1 %117, i32 0, i32 %121
  %123 = fcmp uno float %86, 0.000000e+00
  %124 = fcmp oge float %86, 0x41E0000000000000
  %.inv8 = fcmp ole float %86, 0xC1E0000000000000
  %125 = select i1 %.inv8, float 0xC1E0000000000000, float %86
  %126 = fptosi float %125 to i32
  %127 = select i1 %124, i32 2147483647, i32 %126
  %128 = select i1 %123, i32 0, i32 %127
  %129 = add i32 %122, %128
  %130 = sitofp i32 %129 to float
  %131 = fmul float %130, 5.000000e-01
  %132 = uitofp nneg i32 %82 to float
  %133 = select i1 %79, float 0x41E0000000000000, float %132
  %134 = select i1 %78, float 1.000000e+00, float %133
  %135 = fmul float %134, %131
  %136 = fcmp uno float %111, 0.000000e+00
  %137 = fcmp oge float %111, 0x41E0000000000000
  %.inv5 = fcmp ole float %111, 0xC1E0000000000000
  %138 = select i1 %.inv5, float 0xC1E0000000000000, float %111
  %139 = fptosi float %138 to i32
  %140 = select i1 %137, i32 2147483647, i32 %139
  %141 = select i1 %136, i32 0, i32 %140
  %142 = fcmp uno float %113, 0.000000e+00
  %143 = fcmp oge float %113, 0x41E0000000000000
  %.inv = fcmp ole float %113, 0xC1E0000000000000
  %144 = select i1 %.inv, float 0xC1E0000000000000, float %113
  %145 = fptosi float %144 to i32
  %146 = select i1 %143, i32 2147483647, i32 %145
  %147 = select i1 %142, i32 0, i32 %146
  %148 = sub i32 %141, %147
  %149 = icmp slt i32 %148, 0
  %150 = sub i32 0, %148
  %151 = tail call i32 @llvm.smin.i32(i32 %150, i32 28)
  %152 = sitofp i32 %151 to float
  %153 = fmul float %152, 0xBF999999A0000000
  %154 = tail call i32 @llvm.smin.i32(i32 %148, i32 60)
  %155 = sitofp i32 %154 to float
  %156 = fmul float %155, 0x3FA99999A0000000
  %.p = select i1 %149, float %153, float %156
  %157 = fadd float %.p, 1.000000e+00
  %158 = fmul float %135, %157
  %159 = fcmp uno float %96, 0.000000e+00
  %160 = fcmp oge float %96, 0x41E0000000000000
  %.inv6 = fcmp ole float %96, 0xC1E0000000000000
  %161 = select i1 %.inv6, float 0xC1E0000000000000, float %96
  %162 = fptosi float %161 to i32
  %163 = select i1 %160, i32 2147483647, i32 %162
  %164 = select i1 %159, i32 0, i32 %163
  %165 = mul i32 %110, %164
  %166 = tail call i32 @llvm.smax.i32(i32 %165, i32 1)
  %167 = uitofp nneg i32 %166 to float
  %168 = fdiv float %158, %167
  %169 = tail call float @llvm.maximum.f32(float %168, float 0.000000e+00)
  %170 = tail call float @llvm.minimum.f32(float %169, float 1.000000e+00)
  %171 = getelementptr inbounds i8, ptr addrspace(1) %18, i64 %87
  %172 = load i8, ptr addrspace(1) %171, align 1, !invariant.load !4
  %173 = trunc i8 %172 to i1
  %174 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %97
  %175 = load i32, ptr addrspace(1) %174, align 4, !invariant.load !4
  %176 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %97
  %177 = load i32, ptr addrspace(1) %176, align 4, !invariant.load !4
  %.not = icmp sge i32 %175, %177
  %178 = select i1 %116, i1 %.not, i1 false
  %179 = select i1 %178, i1 %173, i1 false
  %180 = select i1 %179, float %170, float 0.000000e+00
  %181 = fcmp uno float %180, 0.000000e+00
  %182 = select i1 %181, float 0x7FF8000000000000, float %180
  %183 = fcmp ult float %45, %182
  br i1 %183, label %184, label %191

184:                                              ; preds = %47
  %185 = bitcast float %182 to i32
  %186 = icmp sgt i32 %185, -1
  br i1 %186, label %187, label %189

187:                                              ; preds = %184
  %188 = atomicrmw max ptr addrspace(1) %44, i32 %185 monotonic, align 4
  br label %191

189:                                              ; preds = %184
  %190 = atomicrmw umin ptr addrspace(1) %44, i32 %185 monotonic, align 4
  br label %191

191:                                              ; preds = %38, %189, %187, %47, %10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite)
define ptx_kernel void @input_scatter_fusion_11(ptr noalias align 256 captures(none) dereferenceable(32440320) %0, ptr noalias readonly align 256 captures(none) dereferenceable(688128) %1, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %2, ptr noalias readonly align 256 captures(none) dereferenceable(8080) %3, ptr noalias readonly align 256 captures(none) dereferenceable(229376) %4, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %5, ptr noalias readonly align 256 captures(none) dereferenceable(57344) %6, ptr noalias readonly align 256 captures(none) dereferenceable(32768) %7, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %8, ptr noalias readonly align 256 captures(none) dereferenceable(16384) %9) local_unnamed_addr #16 {
  %11 = addrspacecast ptr %1 to ptr addrspace(1)
  %12 = addrspacecast ptr %0 to ptr addrspace(1)
  %13 = addrspacecast ptr %7 to ptr addrspace(1)
  %14 = addrspacecast ptr %4 to ptr addrspace(1)
  %15 = addrspacecast ptr %3 to ptr addrspace(1)
  %16 = addrspacecast ptr %5 to ptr addrspace(1)
  %17 = addrspacecast ptr %2 to ptr addrspace(1)
  %18 = addrspacecast ptr %6 to ptr addrspace(1)
  %19 = addrspacecast ptr %8 to ptr addrspace(1)
  %20 = addrspacecast ptr %9 to ptr addrspace(1)
  %21 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %22 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !105
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
  %33 = icmp ult i32 %28, 4096
  %34 = icmp ult i32 %30, 165
  %35 = and i1 %33, %34
  %36 = icmp ult i32 %32, 12
  %37 = and i1 %35, %36
  br i1 %37, label %38, label %191

38:                                               ; preds = %10
  tail call void @llvm.experimental.noalias.scope.decl(metadata !784)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !787)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !789)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !792)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !794)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !797)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !799)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !802)
  %39 = mul nuw nsw i32 %28, 1980
  %40 = mul nuw nsw i32 %30, 12
  %41 = add nuw nsw i32 %40, %39
  %42 = add nuw nsw i32 %41, %32
  %43 = zext nneg i32 %42 to i64
  %44 = getelementptr inbounds float, ptr addrspace(1) %12, i64 %43
  %45 = load float, ptr addrspace(1) %44, align 4
  %46 = fcmp uno float %45, 0.000000e+00
  br i1 %46, label %191, label %47

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
  %58 = tail call i32 @llvm.umin.i32(i32 %57, i32 4095)
  %59 = mul nuw nsw i32 %58, 14
  %60 = tail call i32 @llvm.smax.i32(i32 %56, i32 0)
  %61 = tail call i32 @llvm.umin.i32(i32 %60, i32 13)
  %62 = add nuw nsw i32 %59, %61
  %63 = zext nneg i32 %62 to i64
  %64 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %63
  %65 = load i32, ptr addrspace(1) %64, align 4, !invariant.load !4, !alias.scope !792, !noalias !789
  %66 = tail call i32 @llvm.smax.i32(i32 %65, i32 0)
  %67 = tail call i32 @llvm.umin.i32(i32 %66, i32 100)
  %68 = mul nuw nsw i32 %67, 20
  %69 = zext nneg i32 %68 to i64
  %70 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %69
  %71 = getelementptr inbounds i8, ptr addrspace(1) %70, i64 16
  %72 = load float, ptr addrspace(1) %71, align 16, !invariant.load !4, !alias.scope !804, !noalias !807
  %73 = zext nneg i32 %58 to i64
  %74 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %73
  %75 = load float, ptr addrspace(1) %74, align 4, !invariant.load !4, !alias.scope !802, !noalias !809
  %76 = getelementptr inbounds i8, ptr addrspace(1) %70, i64 24
  %77 = load float, ptr addrspace(1) %76, align 8, !invariant.load !4, !alias.scope !811, !noalias !814
  %78 = tail call float @llvm.maximum.f32(float %77, float 1.000000e+00)
  %79 = fdiv float %75, %78
  %80 = fcmp uno float %79, 0.000000e+00
  %81 = fcmp oge float %79, 0x41E0000000000000
  %.inv.i9 = fcmp ole float %79, 0xC1E0000000000000
  %82 = select i1 %.inv.i9, float 0xC1E0000000000000, float %79
  %83 = fptosi float %82 to i32
  %84 = tail call i32 @llvm.smax.i32(i32 %83, i32 1)
  %85 = select i1 %81, i32 2147483647, i32 %84
  %86 = select i1 %80, i32 1, i32 %85
  %87 = zext nneg i32 %50 to i64
  %88 = getelementptr inbounds float, ptr addrspace(1) %16, i64 %87
  %89 = load float, ptr addrspace(1) %88, align 4, !invariant.load !4, !alias.scope !797, !noalias !816
  %90 = zext nneg i32 %49 to i64
  %91 = getelementptr inbounds i32, ptr addrspace(1) %14, i64 %90
  %92 = load i32, ptr addrspace(1) %91, align 4, !invariant.load !4, !alias.scope !787, !noalias !784
  %93 = tail call i32 @llvm.smax.i32(i32 %92, i32 0)
  %94 = tail call i32 @llvm.umin.i32(i32 %93, i32 100)
  %95 = mul nuw nsw i32 %94, 20
  %96 = zext nneg i32 %95 to i64
  %97 = getelementptr inbounds float, ptr addrspace(1) %15, i64 %96
  %98 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 24
  %99 = load float, ptr addrspace(1) %98, align 8, !invariant.load !4, !alias.scope !818, !noalias !821
  %100 = tail call float @llvm.maximum.f32(float %99, float 1.000000e+00)
  %101 = fdiv float %89, %100
  %102 = fcmp uno float %101, 0.000000e+00
  %103 = fcmp oge float %101, 0x41E0000000000000
  %.inv.i = fcmp ole float %101, 0xC1E0000000000000
  %104 = select i1 %.inv.i, float 0xC1E0000000000000, float %101
  %105 = fptosi float %104 to i32
  %106 = tail call i32 @llvm.smax.i32(i32 %105, i32 1)
  %107 = getelementptr inbounds i8, ptr addrspace(1) %97, i64 8
  %108 = load <2 x float>, ptr addrspace(1) %107, align 8, !invariant.load !4, !noalias !4
  %109 = extractelement <2 x float> %108, i32 0
  %110 = extractelement <2 x float> %108, i32 1
  %111 = getelementptr inbounds i8, ptr addrspace(1) %70, i64 4
  %112 = load float, ptr addrspace(1) %111, align 4, !invariant.load !4, !alias.scope !789, !noalias !792
  %113 = load float, ptr addrspace(1) %97, align 16, !invariant.load !4, !alias.scope !784, !noalias !787
  %114 = getelementptr inbounds i8, ptr addrspace(1) %17, i64 %90
  %115 = load i8, ptr addrspace(1) %114, align 1, !invariant.load !4
  %116 = trunc i8 %115 to i1
  %117 = fcmp uno float %109, 0.000000e+00
  %118 = fcmp oge float %109, 0x41E0000000000000
  %.inv6 = fcmp ole float %109, 0xC1E0000000000000
  %119 = select i1 %.inv6, float 0xC1E0000000000000, float %109
  %120 = fptosi float %119 to i32
  %121 = select i1 %118, i32 2147483647, i32 %120
  %122 = select i1 %117, i32 0, i32 %121
  %123 = fcmp uno float %110, 0.000000e+00
  %124 = fcmp oge float %110, 0x41E0000000000000
  %.inv7 = fcmp ole float %110, 0xC1E0000000000000
  %125 = select i1 %.inv7, float 0xC1E0000000000000, float %110
  %126 = fptosi float %125 to i32
  %127 = select i1 %124, i32 2147483647, i32 %126
  %128 = select i1 %123, i32 0, i32 %127
  %129 = add i32 %122, %128
  %130 = sitofp i32 %129 to float
  %131 = fmul float %130, 5.000000e-01
  %132 = uitofp nneg i32 %106 to float
  %133 = select i1 %103, float 0x41E0000000000000, float %132
  %134 = select i1 %102, float 1.000000e+00, float %133
  %135 = fmul float %134, %131
  %136 = fcmp uno float %113, 0.000000e+00
  %137 = fcmp oge float %113, 0x41E0000000000000
  %.inv = fcmp ole float %113, 0xC1E0000000000000
  %138 = select i1 %.inv, float 0xC1E0000000000000, float %113
  %139 = fptosi float %138 to i32
  %140 = select i1 %137, i32 2147483647, i32 %139
  %141 = select i1 %136, i32 0, i32 %140
  %142 = fcmp uno float %112, 0.000000e+00
  %143 = fcmp oge float %112, 0x41E0000000000000
  %.inv5 = fcmp ole float %112, 0xC1E0000000000000
  %144 = select i1 %.inv5, float 0xC1E0000000000000, float %112
  %145 = fptosi float %144 to i32
  %146 = select i1 %143, i32 2147483647, i32 %145
  %147 = select i1 %142, i32 0, i32 %146
  %148 = sub i32 %141, %147
  %149 = icmp slt i32 %148, 0
  %150 = sub i32 0, %148
  %151 = tail call i32 @llvm.smin.i32(i32 %150, i32 28)
  %152 = sitofp i32 %151 to float
  %153 = fmul float %152, 0xBF999999A0000000
  %154 = tail call i32 @llvm.smin.i32(i32 %148, i32 60)
  %155 = sitofp i32 %154 to float
  %156 = fmul float %155, 0x3FA99999A0000000
  %.p = select i1 %149, float %153, float %156
  %157 = fadd float %.p, 1.000000e+00
  %158 = fmul float %135, %157
  %159 = fcmp uno float %72, 0.000000e+00
  %160 = fcmp oge float %72, 0x41E0000000000000
  %.inv8 = fcmp ole float %72, 0xC1E0000000000000
  %161 = select i1 %.inv8, float 0xC1E0000000000000, float %72
  %162 = fptosi float %161 to i32
  %163 = select i1 %160, i32 2147483647, i32 %162
  %164 = select i1 %159, i32 0, i32 %163
  %165 = mul i32 %86, %164
  %166 = tail call i32 @llvm.smax.i32(i32 %165, i32 1)
  %167 = uitofp nneg i32 %166 to float
  %168 = fdiv float %158, %167
  %169 = tail call float @llvm.maximum.f32(float %168, float 0.000000e+00)
  %170 = tail call float @llvm.minimum.f32(float %169, float 1.000000e+00)
  %171 = getelementptr inbounds i8, ptr addrspace(1) %18, i64 %90
  %172 = load i8, ptr addrspace(1) %171, align 1, !invariant.load !4
  %173 = trunc i8 %172 to i1
  %174 = getelementptr inbounds i32, ptr addrspace(1) %19, i64 %87
  %175 = load i32, ptr addrspace(1) %174, align 4, !invariant.load !4
  %176 = getelementptr inbounds i32, ptr addrspace(1) %20, i64 %87
  %177 = load i32, ptr addrspace(1) %176, align 4, !invariant.load !4
  %.not = icmp sge i32 %175, %177
  %178 = select i1 %116, i1 %.not, i1 false
  %179 = select i1 %178, i1 %173, i1 false
  %180 = select i1 %179, float %170, float 0.000000e+00
  %181 = fcmp uno float %180, 0.000000e+00
  %182 = select i1 %181, float 0x7FF8000000000000, float %180
  %183 = fcmp ult float %45, %182
  br i1 %183, label %184, label %191

184:                                              ; preds = %47
  %185 = bitcast float %182 to i32
  %186 = icmp sgt i32 %185, -1
  br i1 %186, label %187, label %189

187:                                              ; preds = %184
  %188 = atomicrmw max ptr addrspace(1) %44, i32 %185 monotonic, align 4
  br label %191

189:                                              ; preds = %184
  %190 = atomicrmw umin ptr addrspace(1) %44, i32 %185 monotonic, align 4
  br label %191

191:                                              ; preds = %38, %189, %187, %47, %10
  ret void
}

; Function Attrs: norecurse nounwind
define ptx_kernel void @input_transpose_fusion(ptr noalias readonly align 256 captures(none) dereferenceable(32440320) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(32440320) %1) local_unnamed_addr #8 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !744
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
define ptx_kernel void @loop_broadcast_fusion_3(ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(4096) %1) local_unnamed_addr #5 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !6
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
define ptx_kernel void @loop_broadcast_fusion(ptr noalias writeonly align 256 captures(none) dereferenceable(32768) %0) local_unnamed_addr #5 {
  %2 = addrspacecast ptr %0 to ptr addrspace(1)
  %3 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !5
  %4 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %5 = shl nuw nsw i32 %3, 7
  %6 = or disjoint i32 %5, %4
  %7 = zext nneg i32 %6 to i64
  %8 = getelementptr inbounds float, ptr addrspace(1) %2, i64 %7
  store float 0.000000e+00, ptr addrspace(1) %8, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #17

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #18

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #17

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: readwrite, inaccessiblemem: none) "nvvm.reqntid"="128,1,1" }
attributes #3 = { nofree norecurse nosync nounwind memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) "nvvm.reqntid"="128,1,1" }
attributes #6 = { norecurse nounwind "nvvm.reqntid"="8,1,1" }
attributes #7 = { convergent nocallback nounwind }
attributes #8 = { norecurse nounwind "nvvm.reqntid"="128,1,1" }
attributes #9 = { nofree norecurse nounwind memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #10 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #11 = { norecurse nounwind memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="256,1,1" }
attributes #12 = { convergent nocallback nounwind memory(inaccessiblemem: readwrite) }
attributes #13 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="1,1,1" }
attributes #14 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #15 = { "nvvm.reqntid"="64,1,1" }
attributes #16 = { mustprogress nofree norecurse nounwind willreturn memory(argmem: readwrite, inaccessiblemem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #17 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #18 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
attributes #19 = { nounwind }

!llvm.module.flags = !{!0, !1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{i32 0, i32 192}
!3 = !{i32 0, i32 128}
!4 = !{}
!5 = !{i32 0, i32 64}
!6 = !{i32 0, i32 32}
!7 = !{!8, !10, !11, !13}
!8 = distinct !{!8, !9, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!9 = distinct !{!9, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!10 = distinct !{!10, !9, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!11 = distinct !{!11, !12, !"fused_add_divide_slice_xor_bitcast_99_2_clone_1: argument 0"}
!12 = distinct !{!12, !"fused_add_divide_slice_xor_bitcast_99_2_clone_1"}
!13 = distinct !{!13, !12, !"fused_add_divide_slice_xor_bitcast_99_2_clone_1: argument 1"}
!14 = !{!15, !17, !18, !20}
!15 = distinct !{!15, !16, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!16 = distinct !{!16, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!17 = distinct !{!17, !16, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!18 = distinct !{!18, !19, !"fused_add_divide_slice_xor_bitcast_99_2_clone_1: argument 0"}
!19 = distinct !{!19, !"fused_add_divide_slice_xor_bitcast_99_2_clone_1"}
!20 = distinct !{!20, !19, !"fused_add_divide_slice_xor_bitcast_99_2_clone_1: argument 1"}
!21 = !{!22, !24, !25, !27}
!22 = distinct !{!22, !23, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1: argument 0"}
!23 = distinct !{!23, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1"}
!24 = distinct !{!24, !23, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1: argument 1"}
!25 = distinct !{!25, !26, !"fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1: argument 0"}
!26 = distinct !{!26, !"fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1"}
!27 = distinct !{!27, !26, !"fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1: argument 1"}
!28 = !{!29, !31, !32, !34}
!29 = distinct !{!29, !30, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!30 = distinct !{!30, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!31 = distinct !{!31, !30, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!32 = distinct !{!32, !33, !"fused_add_divide_slice_xor_bitcast_74_40_clone_1: argument 0"}
!33 = distinct !{!33, !"fused_add_divide_slice_xor_bitcast_74_40_clone_1"}
!34 = distinct !{!34, !33, !"fused_add_divide_slice_xor_bitcast_74_40_clone_1: argument 1"}
!35 = !{!36, !38, !39, !41}
!36 = distinct !{!36, !37, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1: argument 0"}
!37 = distinct !{!37, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1"}
!38 = distinct !{!38, !37, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1: argument 1"}
!39 = distinct !{!39, !40, !"fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1: argument 0"}
!40 = distinct !{!40, !"fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1"}
!41 = distinct !{!41, !40, !"fused_add_divide_slice_xor_bitcast_891_62_clone_1_clone_1: argument 1"}
!42 = !{!43, !45, !46, !48}
!43 = distinct !{!43, !44, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1: argument 0"}
!44 = distinct !{!44, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1"}
!45 = distinct !{!45, !44, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1: argument 1"}
!46 = distinct !{!46, !47, !"fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1: argument 0"}
!47 = distinct !{!47, !"fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1"}
!48 = distinct !{!48, !47, !"fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1: argument 1"}
!49 = !{!50, !52, !53, !55}
!50 = distinct !{!50, !51, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!51 = distinct !{!51, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!52 = distinct !{!52, !51, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!53 = distinct !{!53, !54, !"fused_add_divide_slice_xor_bitcast_74_40_clone_1: argument 0"}
!54 = distinct !{!54, !"fused_add_divide_slice_xor_bitcast_74_40_clone_1"}
!55 = distinct !{!55, !54, !"fused_add_divide_slice_xor_bitcast_74_40_clone_1: argument 1"}
!56 = !{!57, !59, !60, !62}
!57 = distinct !{!57, !58, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1: argument 0"}
!58 = distinct !{!58, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1"}
!59 = distinct !{!59, !58, !"fused_add_divide_slice_xor_concatenate_136_117_clone_1_clone_1: argument 1"}
!60 = distinct !{!60, !61, !"fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1: argument 0"}
!61 = distinct !{!61, !"fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1"}
!62 = distinct !{!62, !61, !"fused_add_divide_slice_xor_bitcast_900_46_clone_1_clone_1: argument 1"}
!63 = !{!64, !66, !67, !69}
!64 = distinct !{!64, !65, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!65 = distinct !{!65, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!66 = distinct !{!66, !65, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!67 = distinct !{!67, !68, !"fused_add_divide_slice_xor_bitcast_103_1_clone_1: argument 0"}
!68 = distinct !{!68, !"fused_add_divide_slice_xor_bitcast_103_1_clone_1"}
!69 = distinct !{!69, !68, !"fused_add_divide_slice_xor_bitcast_103_1_clone_1: argument 1"}
!70 = !{!71, !73, !74, !76}
!71 = distinct !{!71, !72, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!72 = distinct !{!72, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!73 = distinct !{!73, !72, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!74 = distinct !{!74, !75, !"fused_add_divide_slice_xor_bitcast_17_1_clone_1: argument 0"}
!75 = distinct !{!75, !"fused_add_divide_slice_xor_bitcast_17_1_clone_1"}
!76 = distinct !{!76, !75, !"fused_add_divide_slice_xor_bitcast_17_1_clone_1: argument 1"}
!77 = !{!78, !80, !81, !83}
!78 = distinct !{!78, !79, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!79 = distinct !{!79, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!80 = distinct !{!80, !79, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!81 = distinct !{!81, !82, !"fused_add_divide_slice_xor_bitcast_36_1_clone_1: argument 0"}
!82 = distinct !{!82, !"fused_add_divide_slice_xor_bitcast_36_1_clone_1"}
!83 = distinct !{!83, !82, !"fused_add_divide_slice_xor_bitcast_36_1_clone_1: argument 1"}
!84 = !{!85, !87, !88, !90}
!85 = distinct !{!85, !86, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!86 = distinct !{!86, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!87 = distinct !{!87, !86, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!88 = distinct !{!88, !89, !"fused_add_divide_slice_xor_bitcast_17_1_clone_1: argument 0"}
!89 = distinct !{!89, !"fused_add_divide_slice_xor_bitcast_17_1_clone_1"}
!90 = distinct !{!90, !89, !"fused_add_divide_slice_xor_bitcast_17_1_clone_1: argument 1"}
!91 = !{!92, !94, !95, !97}
!92 = distinct !{!92, !93, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!93 = distinct !{!93, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!94 = distinct !{!94, !93, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!95 = distinct !{!95, !96, !"fused_add_divide_slice_xor_bitcast_103_1_clone_1: argument 0"}
!96 = distinct !{!96, !"fused_add_divide_slice_xor_bitcast_103_1_clone_1"}
!97 = distinct !{!97, !96, !"fused_add_divide_slice_xor_bitcast_103_1_clone_1: argument 1"}
!98 = !{!99, !101, !102, !104}
!99 = distinct !{!99, !100, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 0"}
!100 = distinct !{!100, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1"}
!101 = distinct !{!101, !100, !"fused_add_divide_slice_xor_concatenate_135_19_clone_1: argument 1"}
!102 = distinct !{!102, !103, !"fused_add_divide_slice_xor_bitcast_36_1_clone_1: argument 0"}
!103 = distinct !{!103, !"fused_add_divide_slice_xor_bitcast_36_1_clone_1"}
!104 = distinct !{!104, !103, !"fused_add_divide_slice_xor_bitcast_36_1_clone_1: argument 1"}
!105 = !{i32 0, i32 448}
!106 = !{!107, !109, !110, !112}
!107 = distinct !{!107, !108, !"fused_select_5_concatenate_137_21: argument 0"}
!108 = distinct !{!108, !"fused_select_5_concatenate_137_21"}
!109 = distinct !{!109, !108, !"fused_select_5_concatenate_137_21: argument 1"}
!110 = distinct !{!110, !111, !"fused_select_5_bitcast_1257_6: argument 0"}
!111 = distinct !{!111, !"fused_select_5_bitcast_1257_6"}
!112 = distinct !{!112, !111, !"fused_select_5_bitcast_1257_6: argument 1"}
!113 = !{!114, !116, !117, !119}
!114 = distinct !{!114, !115, !"fused_select_5_concatenate_137_21: argument 0"}
!115 = distinct !{!115, !"fused_select_5_concatenate_137_21"}
!116 = distinct !{!116, !115, !"fused_select_5_concatenate_137_21: argument 1"}
!117 = distinct !{!117, !118, !"fused_select_5_bitcast_1257_6: argument 0"}
!118 = distinct !{!118, !"fused_select_5_bitcast_1257_6"}
!119 = distinct !{!119, !118, !"fused_select_5_bitcast_1257_6: argument 1"}
!120 = !{!121, !123, !124, !126}
!121 = distinct !{!121, !122, !"fused_select_5_concatenate_137_21: argument 0"}
!122 = distinct !{!122, !"fused_select_5_concatenate_137_21"}
!123 = distinct !{!123, !122, !"fused_select_5_concatenate_137_21: argument 1"}
!124 = distinct !{!124, !125, !"fused_select_5_bitcast_1273_6: argument 0"}
!125 = distinct !{!125, !"fused_select_5_bitcast_1273_6"}
!126 = distinct !{!126, !125, !"fused_select_5_bitcast_1273_6: argument 1"}
!127 = !{!128, !130, !131, !133}
!128 = distinct !{!128, !129, !"fused_select_5_concatenate_137_21: argument 0"}
!129 = distinct !{!129, !"fused_select_5_concatenate_137_21"}
!130 = distinct !{!130, !129, !"fused_select_5_concatenate_137_21: argument 1"}
!131 = distinct !{!131, !132, !"fused_select_5_bitcast_1273_6: argument 0"}
!132 = distinct !{!132, !"fused_select_5_bitcast_1273_6"}
!133 = distinct !{!133, !132, !"fused_select_5_bitcast_1273_6: argument 1"}
!134 = !{!135}
!135 = distinct !{!135, !136, !"fused_slice_1_broadcast_3131_39: argument 0"}
!136 = distinct !{!136, !"fused_slice_1_broadcast_3131_39"}
!137 = !{!138}
!138 = distinct !{!138, !136, !"fused_slice_1_broadcast_3131_39: argument 1"}
!139 = !{!140}
!140 = distinct !{!140, !141, !"fused_slice_1_slice_174_3: argument 0"}
!141 = distinct !{!141, !"fused_slice_1_slice_174_3"}
!142 = !{!143}
!143 = distinct !{!143, !141, !"fused_slice_1_slice_174_3: argument 1"}
!144 = !{!145}
!145 = distinct !{!145, !146, !"fused_slice_1_bitcast_1649_4: argument 0"}
!146 = distinct !{!146, !"fused_slice_1_bitcast_1649_4"}
!147 = !{!148}
!148 = distinct !{!148, !146, !"fused_slice_1_bitcast_1649_4: argument 1"}
!149 = !{!150}
!150 = distinct !{!150, !151, !"fused_slice_1_concatenate_138_19: argument 0"}
!151 = distinct !{!151, !"fused_slice_1_concatenate_138_19"}
!152 = !{!153}
!153 = distinct !{!153, !151, !"fused_slice_1_concatenate_138_19: argument 1"}
!154 = !{!155, !150, !145, !140, !135}
!155 = distinct !{!155, !156, !"fused_slice_1_broadcast_3128_101_clone_1: argument 0"}
!156 = distinct !{!156, !"fused_slice_1_broadcast_3128_101_clone_1"}
!157 = !{!153, !148, !143, !138}
!158 = !{!159, !153, !148, !143, !138}
!159 = distinct !{!159, !160, !"fused_slice_1_broadcast_3129_171_clone_1: argument 0"}
!160 = distinct !{!160, !"fused_slice_1_broadcast_3129_171_clone_1"}
!161 = !{!150, !145, !140, !135}
!162 = !{!163}
!163 = distinct !{!163, !164, !"fused_slice_1_broadcast_3132_53: argument 0"}
!164 = distinct !{!164, !"fused_slice_1_broadcast_3132_53"}
!165 = !{!166}
!166 = distinct !{!166, !164, !"fused_slice_1_broadcast_3132_53: argument 1"}
!167 = !{!168}
!168 = distinct !{!168, !169, !"fused_slice_1_slice_175_3: argument 0"}
!169 = distinct !{!169, !"fused_slice_1_slice_175_3"}
!170 = !{!171}
!171 = distinct !{!171, !169, !"fused_slice_1_slice_175_3: argument 1"}
!172 = !{!173}
!173 = distinct !{!173, !174, !"fused_slice_1_bitcast_1649_4: argument 0"}
!174 = distinct !{!174, !"fused_slice_1_bitcast_1649_4"}
!175 = !{!176}
!176 = distinct !{!176, !174, !"fused_slice_1_bitcast_1649_4: argument 1"}
!177 = !{!178}
!178 = distinct !{!178, !179, !"fused_slice_1_concatenate_138_19: argument 0"}
!179 = distinct !{!179, !"fused_slice_1_concatenate_138_19"}
!180 = !{!181}
!181 = distinct !{!181, !179, !"fused_slice_1_concatenate_138_19: argument 1"}
!182 = !{!183, !181, !176, !171, !166}
!183 = distinct !{!183, !184, !"fused_slice_1_broadcast_3129_171_clone_1: argument 0"}
!184 = distinct !{!184, !"fused_slice_1_broadcast_3129_171_clone_1"}
!185 = !{!178, !173, !168, !163}
!186 = !{!187, !178, !173, !168, !163}
!187 = distinct !{!187, !188, !"fused_slice_1_broadcast_3128_101_clone_1: argument 0"}
!188 = distinct !{!188, !"fused_slice_1_broadcast_3128_101_clone_1"}
!189 = !{!181, !176, !171, !166}
!190 = !{!191}
!191 = distinct !{!191, !192, !"fused_slice_1_broadcast_3134_27_clone_1: argument 0"}
!192 = distinct !{!192, !"fused_slice_1_broadcast_3134_27_clone_1"}
!193 = !{!194}
!194 = distinct !{!194, !192, !"fused_slice_1_broadcast_3134_27_clone_1: argument 1"}
!195 = !{!196}
!196 = distinct !{!196, !197, !"fused_slice_1_slice_180_3_clone_1: argument 0"}
!197 = distinct !{!197, !"fused_slice_1_slice_180_3_clone_1"}
!198 = !{!199}
!199 = distinct !{!199, !197, !"fused_slice_1_slice_180_3_clone_1: argument 1"}
!200 = !{!201}
!201 = distinct !{!201, !202, !"fused_slice_1_bitcast_2026_4_clone_1: argument 0"}
!202 = distinct !{!202, !"fused_slice_1_bitcast_2026_4_clone_1"}
!203 = !{!204}
!204 = distinct !{!204, !202, !"fused_slice_1_bitcast_2026_4_clone_1: argument 1"}
!205 = !{!206}
!206 = distinct !{!206, !207, !"fused_slice_1_concatenate_138_19: argument 0"}
!207 = distinct !{!207, !"fused_slice_1_concatenate_138_19"}
!208 = !{!209}
!209 = distinct !{!209, !207, !"fused_slice_1_concatenate_138_19: argument 1"}
!210 = !{!211, !206, !201, !196, !191}
!211 = distinct !{!211, !212, !"fused_slice_1_broadcast_3128_101_clone_1: argument 0"}
!212 = distinct !{!212, !"fused_slice_1_broadcast_3128_101_clone_1"}
!213 = !{!209, !204, !199, !194}
!214 = !{!215, !209, !204, !199, !194}
!215 = distinct !{!215, !216, !"fused_slice_1_broadcast_3129_171_clone_1: argument 0"}
!216 = distinct !{!216, !"fused_slice_1_broadcast_3129_171_clone_1"}
!217 = !{!206, !201, !196, !191}
!218 = !{!219}
!219 = distinct !{!219, !220, !"fused_slice_1_broadcast_3135_41_clone_1: argument 0"}
!220 = distinct !{!220, !"fused_slice_1_broadcast_3135_41_clone_1"}
!221 = !{!222}
!222 = distinct !{!222, !220, !"fused_slice_1_broadcast_3135_41_clone_1: argument 1"}
!223 = !{!224}
!224 = distinct !{!224, !225, !"fused_slice_1_slice_181_3_clone_1: argument 0"}
!225 = distinct !{!225, !"fused_slice_1_slice_181_3_clone_1"}
!226 = !{!227}
!227 = distinct !{!227, !225, !"fused_slice_1_slice_181_3_clone_1: argument 1"}
!228 = !{!229}
!229 = distinct !{!229, !230, !"fused_slice_1_bitcast_2026_4_clone_1: argument 0"}
!230 = distinct !{!230, !"fused_slice_1_bitcast_2026_4_clone_1"}
!231 = !{!232}
!232 = distinct !{!232, !230, !"fused_slice_1_bitcast_2026_4_clone_1: argument 1"}
!233 = !{!234}
!234 = distinct !{!234, !235, !"fused_slice_1_concatenate_138_19: argument 0"}
!235 = distinct !{!235, !"fused_slice_1_concatenate_138_19"}
!236 = !{!237}
!237 = distinct !{!237, !235, !"fused_slice_1_concatenate_138_19: argument 1"}
!238 = !{!239, !237, !232, !227, !222}
!239 = distinct !{!239, !240, !"fused_slice_1_broadcast_3129_171_clone_1: argument 0"}
!240 = distinct !{!240, !"fused_slice_1_broadcast_3129_171_clone_1"}
!241 = !{!234, !229, !224, !219}
!242 = !{!243, !234, !229, !224, !219}
!243 = distinct !{!243, !244, !"fused_slice_1_broadcast_3128_101_clone_1: argument 0"}
!244 = distinct !{!244, !"fused_slice_1_broadcast_3128_101_clone_1"}
!245 = !{!237, !232, !227, !222}
!246 = !{i32 0, i32 352}
!247 = !{i32 0, i32 4096}
!248 = !{i32 0, i32 8}
!249 = !{i32 0, i32 224}
!250 = !{!251}
!251 = distinct !{!251, !252, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!252 = distinct !{!252, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!253 = !{!254}
!254 = distinct !{!254, !252, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!255 = !{!256}
!256 = distinct !{!256, !252, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!257 = !{!258}
!258 = distinct !{!258, !259, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!259 = distinct !{!259, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!260 = !{!261}
!261 = distinct !{!261, !259, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!262 = !{!263}
!263 = distinct !{!263, !264, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!264 = distinct !{!264, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!265 = !{!266}
!266 = distinct !{!266, !264, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!267 = !{!266, !261, !256}
!268 = !{!263, !258, !251, !254}
!269 = !{!270}
!270 = distinct !{!270, !271, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!271 = distinct !{!271, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!272 = !{!273}
!273 = distinct !{!273, !271, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!274 = !{!275}
!275 = distinct !{!275, !271, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!276 = !{!277}
!277 = distinct !{!277, !278, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!278 = distinct !{!278, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!279 = !{!280}
!280 = distinct !{!280, !278, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!281 = !{!282}
!282 = distinct !{!282, !283, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!283 = distinct !{!283, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!284 = !{!285}
!285 = distinct !{!285, !283, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!286 = !{!282, !277, !273}
!287 = !{!285, !280, !270, !275}
!288 = !{!289}
!289 = distinct !{!289, !290, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!290 = distinct !{!290, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!291 = !{!292}
!292 = distinct !{!292, !290, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!293 = !{!294}
!294 = distinct !{!294, !290, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!295 = !{!296}
!296 = distinct !{!296, !297, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!297 = distinct !{!297, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!298 = !{!299}
!299 = distinct !{!299, !297, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!300 = !{!301}
!301 = distinct !{!301, !302, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!302 = distinct !{!302, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!303 = !{!304}
!304 = distinct !{!304, !302, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!305 = !{!301, !296, !292}
!306 = !{!304, !299, !289, !294}
!307 = !{!308}
!308 = distinct !{!308, !309, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!309 = distinct !{!309, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!310 = !{!311}
!311 = distinct !{!311, !309, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!312 = !{!313}
!313 = distinct !{!313, !309, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!314 = !{!315}
!315 = distinct !{!315, !316, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!316 = distinct !{!316, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!317 = !{!318}
!318 = distinct !{!318, !316, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!319 = !{!320}
!320 = distinct !{!320, !321, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!321 = distinct !{!321, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!322 = !{!323}
!323 = distinct !{!323, !321, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!324 = !{!320, !315, !311}
!325 = !{!323, !318, !308, !313}
!326 = !{!327}
!327 = distinct !{!327, !328, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!328 = distinct !{!328, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!329 = !{!330}
!330 = distinct !{!330, !328, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!331 = !{!332}
!332 = distinct !{!332, !328, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!333 = !{!334}
!334 = distinct !{!334, !335, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!335 = distinct !{!335, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!336 = !{!337}
!337 = distinct !{!337, !335, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!338 = !{!339}
!339 = distinct !{!339, !340, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!340 = distinct !{!340, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!341 = !{!342}
!342 = distinct !{!342, !340, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!343 = !{!339, !334, !330}
!344 = !{!342, !337, !327, !332}
!345 = !{!346}
!346 = distinct !{!346, !347, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!347 = distinct !{!347, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!348 = !{!349}
!349 = distinct !{!349, !347, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!350 = !{!351}
!351 = distinct !{!351, !347, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!352 = !{!353}
!353 = distinct !{!353, !354, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!354 = distinct !{!354, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!355 = !{!356}
!356 = distinct !{!356, !354, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!357 = !{!358}
!358 = distinct !{!358, !359, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!359 = distinct !{!359, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!360 = !{!361}
!361 = distinct !{!361, !359, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!362 = !{!358, !353, !349}
!363 = !{!361, !356, !346, !351}
!364 = !{!365}
!365 = distinct !{!365, !366, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!366 = distinct !{!366, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!367 = !{!368}
!368 = distinct !{!368, !366, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!369 = !{!370}
!370 = distinct !{!370, !366, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!371 = !{!372}
!372 = distinct !{!372, !373, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!373 = distinct !{!373, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!374 = !{!375}
!375 = distinct !{!375, !373, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!376 = !{!377}
!377 = distinct !{!377, !378, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!378 = distinct !{!378, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!379 = !{!380}
!380 = distinct !{!380, !378, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!381 = !{!377, !372, !368}
!382 = !{!380, !375, !365, !370}
!383 = !{!384}
!384 = distinct !{!384, !385, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!385 = distinct !{!385, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!386 = !{!387}
!387 = distinct !{!387, !385, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!388 = !{!389}
!389 = distinct !{!389, !385, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!390 = !{!391}
!391 = distinct !{!391, !392, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!392 = distinct !{!392, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!393 = !{!394}
!394 = distinct !{!394, !392, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!395 = !{!396}
!396 = distinct !{!396, !397, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!397 = distinct !{!397, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!398 = !{!399}
!399 = distinct !{!399, !397, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!400 = !{!396, !391, !387}
!401 = !{!399, !394, !384, !389}
!402 = !{!403}
!403 = distinct !{!403, !404, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!404 = distinct !{!404, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!405 = !{!406}
!406 = distinct !{!406, !404, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!407 = !{!408}
!408 = distinct !{!408, !404, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!409 = !{!410}
!410 = distinct !{!410, !411, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!411 = distinct !{!411, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!412 = !{!413}
!413 = distinct !{!413, !411, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!414 = !{!415}
!415 = distinct !{!415, !416, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!416 = distinct !{!416, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!417 = !{!418}
!418 = distinct !{!418, !416, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!419 = !{!415, !410, !406}
!420 = !{!418, !413, !403, !408}
!421 = !{!422}
!422 = distinct !{!422, !423, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!423 = distinct !{!423, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!424 = !{!425}
!425 = distinct !{!425, !423, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!426 = !{!427}
!427 = distinct !{!427, !423, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!428 = !{!429}
!429 = distinct !{!429, !430, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!430 = distinct !{!430, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!431 = !{!432}
!432 = distinct !{!432, !430, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!433 = !{!434}
!434 = distinct !{!434, !435, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!435 = distinct !{!435, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!436 = !{!437}
!437 = distinct !{!437, !435, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!438 = !{!434, !429, !425}
!439 = !{!437, !432, !422, !427}
!440 = !{!441}
!441 = distinct !{!441, !442, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!442 = distinct !{!442, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!443 = !{!444}
!444 = distinct !{!444, !442, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!445 = !{!446}
!446 = distinct !{!446, !442, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!447 = !{!448}
!448 = distinct !{!448, !449, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!449 = distinct !{!449, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!450 = !{!451}
!451 = distinct !{!451, !449, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!452 = !{!453}
!453 = distinct !{!453, !454, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!454 = distinct !{!454, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!455 = !{!456}
!456 = distinct !{!456, !454, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!457 = !{!453, !448, !444}
!458 = !{!456, !451, !441, !446}
!459 = !{!460}
!460 = distinct !{!460, !461, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!461 = distinct !{!461, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!462 = !{!463}
!463 = distinct !{!463, !461, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!464 = !{!465}
!465 = distinct !{!465, !461, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!466 = !{!467}
!467 = distinct !{!467, !468, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!468 = distinct !{!468, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!469 = !{!470}
!470 = distinct !{!470, !468, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!471 = !{!472}
!472 = distinct !{!472, !473, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!473 = distinct !{!473, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!474 = !{!475}
!475 = distinct !{!475, !473, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!476 = !{!472, !467, !463}
!477 = !{!475, !470, !460, !465}
!478 = !{!479}
!479 = distinct !{!479, !480, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!480 = distinct !{!480, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!481 = !{!482}
!482 = distinct !{!482, !480, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!483 = !{!484}
!484 = distinct !{!484, !480, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!485 = !{!486}
!486 = distinct !{!486, !487, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!487 = distinct !{!487, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!488 = !{!489}
!489 = distinct !{!489, !487, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!490 = !{!491}
!491 = distinct !{!491, !492, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!492 = distinct !{!492, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!493 = !{!494}
!494 = distinct !{!494, !492, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!495 = !{!491, !486, !482}
!496 = !{!494, !489, !479, !484}
!497 = !{!498}
!498 = distinct !{!498, !499, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!499 = distinct !{!499, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!500 = !{!501}
!501 = distinct !{!501, !499, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!502 = !{!503}
!503 = distinct !{!503, !499, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!504 = !{!505}
!505 = distinct !{!505, !506, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!506 = distinct !{!506, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!507 = !{!508}
!508 = distinct !{!508, !506, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!509 = !{!510}
!510 = distinct !{!510, !511, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!511 = distinct !{!511, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!512 = !{!513}
!513 = distinct !{!513, !511, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!514 = !{!510, !505, !501}
!515 = !{!513, !508, !498, !503}
!516 = !{!517}
!517 = distinct !{!517, !518, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 0"}
!518 = distinct !{!518, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1"}
!519 = !{!520}
!520 = distinct !{!520, !518, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 1"}
!521 = !{!522}
!522 = distinct !{!522, !518, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_select_85_7_clone_1_clone_1: argument 2"}
!523 = !{!524}
!524 = distinct !{!524, !525, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 0"}
!525 = distinct !{!525, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1"}
!526 = !{!527}
!527 = distinct !{!527, !525, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_convert_103_13_clone_1_clone_1: argument 1"}
!528 = !{!529}
!529 = distinct !{!529, !530, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 0"}
!530 = distinct !{!530, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1"}
!531 = !{!532}
!532 = distinct !{!532, !530, !"fused_and_broadcast_clamp_compare_convert_maximum_select_slice_bitcast_1290_108_clone_1_clone_1: argument 1"}
!533 = !{!529, !524, !520}
!534 = !{!532, !527, !517, !522}
!535 = !{i32 0, i32 2}
!536 = !{i32 0, i32 1320}
!537 = !{!538}
!538 = distinct !{!538, !539, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 0"}
!539 = distinct !{!539, !"fused_compare_gather_select_bitcast_1290_212_clone_1"}
!540 = !{!541}
!541 = distinct !{!541, !539, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 1"}
!542 = !{!543}
!543 = distinct !{!543, !544, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 0"}
!544 = distinct !{!544, !"fused_compare_gather_select_bitcast_1290_212_clone_1"}
!545 = !{!546}
!546 = distinct !{!546, !544, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 1"}
!547 = !{!548}
!548 = distinct !{!548, !549, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 0"}
!549 = distinct !{!549, !"fused_compare_gather_select_bitcast_1290_212_clone_1"}
!550 = !{!551}
!551 = distinct !{!551, !549, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 1"}
!552 = !{!553}
!553 = distinct !{!553, !554, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 0"}
!554 = distinct !{!554, !"fused_compare_gather_select_bitcast_1290_212_clone_1"}
!555 = !{!556}
!556 = distinct !{!556, !554, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 1"}
!557 = !{!558}
!558 = distinct !{!558, !559, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 0"}
!559 = distinct !{!559, !"fused_compare_gather_select_bitcast_1290_212_clone_1"}
!560 = !{!561}
!561 = distinct !{!561, !559, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 1"}
!562 = !{!563}
!563 = distinct !{!563, !564, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 0"}
!564 = distinct !{!564, !"fused_compare_gather_select_bitcast_1290_212_clone_1"}
!565 = !{!566}
!566 = distinct !{!566, !564, !"fused_compare_gather_select_bitcast_1290_212_clone_1: argument 1"}
!567 = !{!568, !570, !571, !573}
!568 = distinct !{!568, !569, !"fused_compare_gather_select_concatenate_154_181_clone_1: argument 0"}
!569 = distinct !{!569, !"fused_compare_gather_select_concatenate_154_181_clone_1"}
!570 = distinct !{!570, !569, !"fused_compare_gather_select_concatenate_154_181_clone_1: argument 1"}
!571 = distinct !{!571, !572, !"fused_compare_gather_select_bitcast_2898_108_clone_1: argument 0"}
!572 = distinct !{!572, !"fused_compare_gather_select_bitcast_2898_108_clone_1"}
!573 = distinct !{!573, !572, !"fused_compare_gather_select_bitcast_2898_108_clone_1: argument 1"}
!574 = !{!575, !577, !578, !580}
!575 = distinct !{!575, !576, !"fused_compare_gather_select_concatenate_154_181_clone_1: argument 0"}
!576 = distinct !{!576, !"fused_compare_gather_select_concatenate_154_181_clone_1"}
!577 = distinct !{!577, !576, !"fused_compare_gather_select_concatenate_154_181_clone_1: argument 1"}
!578 = distinct !{!578, !579, !"fused_compare_gather_select_bitcast_2898_108_clone_1: argument 0"}
!579 = distinct !{!579, !"fused_compare_gather_select_bitcast_2898_108_clone_1"}
!580 = distinct !{!580, !579, !"fused_compare_gather_select_bitcast_2898_108_clone_1: argument 1"}
!581 = !{!582, !584, !585, !587}
!582 = distinct !{!582, !583, !"fused_compare_gather_select_concatenate_154_181_clone_1: argument 0"}
!583 = distinct !{!583, !"fused_compare_gather_select_concatenate_154_181_clone_1"}
!584 = distinct !{!584, !583, !"fused_compare_gather_select_concatenate_154_181_clone_1: argument 1"}
!585 = distinct !{!585, !586, !"fused_compare_gather_select_bitcast_2907_64_clone_1: argument 0"}
!586 = distinct !{!586, !"fused_compare_gather_select_bitcast_2907_64_clone_1"}
!587 = distinct !{!587, !586, !"fused_compare_gather_select_bitcast_2907_64_clone_1: argument 1"}
!588 = !{!589, !591, !592, !594}
!589 = distinct !{!589, !590, !"fused_compare_gather_select_concatenate_154_181_clone_1: argument 0"}
!590 = distinct !{!590, !"fused_compare_gather_select_concatenate_154_181_clone_1"}
!591 = distinct !{!591, !590, !"fused_compare_gather_select_concatenate_154_181_clone_1: argument 1"}
!592 = distinct !{!592, !593, !"fused_compare_gather_select_bitcast_2907_64_clone_1: argument 0"}
!593 = distinct !{!593, !"fused_compare_gather_select_bitcast_2907_64_clone_1"}
!594 = distinct !{!594, !593, !"fused_compare_gather_select_bitcast_2907_64_clone_1: argument 1"}
!595 = !{i32 0, i32 896}
!596 = !{!597}
!597 = distinct !{!597, !598, !"fused_scatter_32_concatenate_59_5: argument 0"}
!598 = distinct !{!598, !"fused_scatter_32_concatenate_59_5"}
!599 = !{!600}
!600 = distinct !{!600, !598, !"fused_scatter_32_concatenate_59_5: argument 1"}
!601 = !{!602}
!602 = distinct !{!602, !603, !"fused_scatter_30_concatenate_67_3: argument 0"}
!603 = distinct !{!603, !"fused_scatter_30_concatenate_67_3"}
!604 = !{!605}
!605 = distinct !{!605, !603, !"fused_scatter_30_concatenate_67_3: argument 1"}
!606 = !{!607}
!607 = distinct !{!607, !603, !"fused_scatter_30_concatenate_67_3: argument 2"}
!608 = !{!609}
!609 = distinct !{!609, !603, !"fused_scatter_30_concatenate_67_3: argument 3"}
!610 = !{!611}
!611 = distinct !{!611, !603, !"fused_scatter_30_concatenate_67_3: argument 4"}
!612 = !{!602, !607, !609, !611}
!613 = !{!605, !607, !609, !611}
!614 = !{!602, !605, !607, !609}
!615 = !{!602, !605, !609, !611}
!616 = !{!602, !605, !607, !611}
!617 = !{!618}
!618 = distinct !{!618, !619, !"fused_scatter_31_concatenate_33_5: argument 0"}
!619 = distinct !{!619, !"fused_scatter_31_concatenate_33_5"}
!620 = !{!621}
!621 = distinct !{!621, !619, !"fused_scatter_31_concatenate_33_5: argument 1"}
!622 = !{!623}
!623 = distinct !{!623, !619, !"fused_scatter_31_concatenate_33_5: argument 2"}
!624 = !{!621, !623}
!625 = !{!618, !621}
!626 = !{!618, !623}
!627 = !{!628}
!628 = distinct !{!628, !629, !"fused_scatter_29_concatenate_40_3: argument 0"}
!629 = distinct !{!629, !"fused_scatter_29_concatenate_40_3"}
!630 = !{!631}
!631 = distinct !{!631, !629, !"fused_scatter_29_concatenate_40_3: argument 1"}
!632 = !{!633}
!633 = distinct !{!633, !629, !"fused_scatter_29_concatenate_40_3: argument 2"}
!634 = !{!635}
!635 = distinct !{!635, !629, !"fused_scatter_29_concatenate_40_3: argument 3"}
!636 = !{!637}
!637 = distinct !{!637, !629, !"fused_scatter_29_concatenate_40_3: argument 4"}
!638 = !{!628, !631, !633, !635}
!639 = !{!628, !631, !633, !637}
!640 = !{!631, !633, !635, !637}
!641 = !{!628, !631, !635, !637}
!642 = !{!628, !633, !635, !637}
!643 = !{i32 0, i32 217800}
!644 = !{i32 0, i32 256}
!645 = !{i32 0, i32 512}
!646 = !{!647}
!647 = distinct !{!647, !648, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!648 = distinct !{!648, !"fused_and_reduce_not_2084_1_clone_1"}
!649 = !{!650}
!650 = distinct !{!650, !651, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!651 = distinct !{!651, !"fused_and_reduce_not_2084_1_clone_1"}
!652 = !{!653}
!653 = distinct !{!653, !654, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!654 = distinct !{!654, !"fused_and_reduce_not_3018_1_clone_1"}
!655 = !{!656}
!656 = distinct !{!656, !657, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!657 = distinct !{!657, !"fused_and_reduce_not_3018_1_clone_1"}
!658 = !{!659}
!659 = distinct !{!659, !660, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!660 = distinct !{!660, !"fused_and_reduce_not_2084_1_clone_1"}
!661 = !{!662}
!662 = distinct !{!662, !663, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!663 = distinct !{!663, !"fused_and_reduce_not_2084_1_clone_1"}
!664 = !{!665}
!665 = distinct !{!665, !666, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!666 = distinct !{!666, !"fused_and_reduce_not_3018_1_clone_1"}
!667 = !{!668}
!668 = distinct !{!668, !669, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!669 = distinct !{!669, !"fused_and_reduce_not_3018_1_clone_1"}
!670 = !{!671}
!671 = distinct !{!671, !672, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!672 = distinct !{!672, !"fused_and_reduce_not_2084_1_clone_1"}
!673 = !{!674}
!674 = distinct !{!674, !675, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!675 = distinct !{!675, !"fused_and_reduce_not_2084_1_clone_1"}
!676 = !{!677}
!677 = distinct !{!677, !678, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!678 = distinct !{!678, !"fused_and_reduce_not_3018_1_clone_1"}
!679 = !{!680}
!680 = distinct !{!680, !681, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!681 = distinct !{!681, !"fused_and_reduce_not_3018_1_clone_1"}
!682 = !{!683}
!683 = distinct !{!683, !684, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!684 = distinct !{!684, !"fused_and_reduce_not_2084_1_clone_1"}
!685 = !{!686}
!686 = distinct !{!686, !687, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!687 = distinct !{!687, !"fused_and_reduce_not_2084_1_clone_1"}
!688 = !{!689}
!689 = distinct !{!689, !690, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!690 = distinct !{!690, !"fused_and_reduce_not_3018_1_clone_1"}
!691 = !{!692}
!692 = distinct !{!692, !693, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!693 = distinct !{!693, !"fused_and_reduce_not_3018_1_clone_1"}
!694 = !{!695}
!695 = distinct !{!695, !696, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!696 = distinct !{!696, !"fused_and_reduce_not_2084_1_clone_1"}
!697 = !{!698}
!698 = distinct !{!698, !699, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!699 = distinct !{!699, !"fused_and_reduce_not_2084_1_clone_1"}
!700 = !{!701}
!701 = distinct !{!701, !702, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!702 = distinct !{!702, !"fused_and_reduce_not_3018_1_clone_1"}
!703 = !{!704}
!704 = distinct !{!704, !705, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!705 = distinct !{!705, !"fused_and_reduce_not_3018_1_clone_1"}
!706 = !{!707}
!707 = distinct !{!707, !708, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!708 = distinct !{!708, !"fused_and_reduce_not_2084_1_clone_1"}
!709 = !{!710}
!710 = distinct !{!710, !711, !"fused_and_reduce_not_2084_1_clone_1: argument 0"}
!711 = distinct !{!711, !"fused_and_reduce_not_2084_1_clone_1"}
!712 = !{!713}
!713 = distinct !{!713, !714, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!714 = distinct !{!714, !"fused_and_reduce_not_3018_1_clone_1"}
!715 = !{!716}
!716 = distinct !{!716, !717, !"fused_and_reduce_not_3018_1_clone_1: argument 0"}
!717 = distinct !{!717, !"fused_and_reduce_not_3018_1_clone_1"}
!718 = !{!719}
!719 = distinct !{!719, !720, !"fused_scatter_35_concatenate_59_3: argument 0"}
!720 = distinct !{!720, !"fused_scatter_35_concatenate_59_3"}
!721 = !{!722}
!722 = distinct !{!722, !720, !"fused_scatter_35_concatenate_59_3: argument 1"}
!723 = !{i32 0, i32 84480}
!724 = !{!725}
!725 = distinct !{!725, !726, !"fused_scatter_33_concatenate_33_3: argument 0"}
!726 = distinct !{!726, !"fused_scatter_33_concatenate_33_3"}
!727 = !{!728}
!728 = distinct !{!728, !726, !"fused_scatter_33_concatenate_33_3: argument 1"}
!729 = !{!730}
!730 = distinct !{!730, !726, !"fused_scatter_33_concatenate_33_3: argument 2"}
!731 = !{!728, !730}
!732 = !{!725, !728}
!733 = !{!725, !730}
!734 = !{i32 0, i32 10576}
!735 = !{i32 0, i32 5280}
!736 = !{!737}
!737 = distinct !{!737, !738, !"fused_scatter_6_bitcast_180_1: argument 0"}
!738 = distinct !{!738, !"fused_scatter_6_bitcast_180_1"}
!739 = !{!740}
!740 = distinct !{!740, !741, !"fused_scatter_bitcast_212_1: argument 0"}
!741 = distinct !{!741, !"fused_scatter_bitcast_212_1"}
!742 = !{i32 0, i32 336}
!743 = !{i32 0, i32 15840}
!744 = !{i32 0, i32 21120}
!745 = !{!746}
!746 = distinct !{!746, !747, !"fused_scatter_13_bitcast_1290_222: argument 0"}
!747 = distinct !{!747, !"fused_scatter_13_bitcast_1290_222"}
!748 = !{!749}
!749 = distinct !{!749, !747, !"fused_scatter_13_bitcast_1290_222: argument 1"}
!750 = !{!751}
!751 = distinct !{!751, !752, !"fused_scatter_13_bitcast_1290_222: argument 0"}
!752 = distinct !{!752, !"fused_scatter_13_bitcast_1290_222"}
!753 = !{!754}
!754 = distinct !{!754, !752, !"fused_scatter_13_bitcast_1290_222: argument 1"}
!755 = !{!756}
!756 = distinct !{!756, !757, !"fused_scatter_13_maximum_82_23: argument 0"}
!757 = distinct !{!757, !"fused_scatter_13_maximum_82_23"}
!758 = !{!759}
!759 = distinct !{!759, !757, !"fused_scatter_13_maximum_82_23: argument 2"}
!760 = !{!761}
!761 = distinct !{!761, !762, !"fused_scatter_13_maximum_82_23: argument 0"}
!762 = distinct !{!762, !"fused_scatter_13_maximum_82_23"}
!763 = !{!764}
!764 = distinct !{!764, !762, !"fused_scatter_13_maximum_82_23: argument 2"}
!765 = !{!761, !766}
!766 = distinct !{!766, !762, !"fused_scatter_13_maximum_82_23: argument 1"}
!767 = !{!768, !761}
!768 = distinct !{!768, !769, !"fused_scatter_13_bitcast_1290_222: argument 0"}
!769 = distinct !{!769, !"fused_scatter_13_bitcast_1290_222"}
!770 = !{!771, !766, !764}
!771 = distinct !{!771, !769, !"fused_scatter_13_bitcast_1290_222: argument 1"}
!772 = !{!773}
!773 = distinct !{!773, !774, !"fused_scatter_13_bitcast_1290_222: argument 0"}
!774 = distinct !{!774, !"fused_scatter_13_bitcast_1290_222"}
!775 = !{!776}
!776 = distinct !{!776, !774, !"fused_scatter_13_bitcast_1290_222: argument 1"}
!777 = !{!756, !778}
!778 = distinct !{!778, !757, !"fused_scatter_13_maximum_82_23: argument 1"}
!779 = !{!780, !756}
!780 = distinct !{!780, !781, !"fused_scatter_13_bitcast_1290_222: argument 0"}
!781 = distinct !{!781, !"fused_scatter_13_bitcast_1290_222"}
!782 = !{!783, !778, !759}
!783 = distinct !{!783, !781, !"fused_scatter_13_bitcast_1290_222: argument 1"}
!784 = !{!785}
!785 = distinct !{!785, !786, !"fused_scatter_11_bitcast_1290_136: argument 0"}
!786 = distinct !{!786, !"fused_scatter_11_bitcast_1290_136"}
!787 = !{!788}
!788 = distinct !{!788, !786, !"fused_scatter_11_bitcast_1290_136: argument 1"}
!789 = !{!790}
!790 = distinct !{!790, !791, !"fused_scatter_11_bitcast_1290_136: argument 0"}
!791 = distinct !{!791, !"fused_scatter_11_bitcast_1290_136"}
!792 = !{!793}
!793 = distinct !{!793, !791, !"fused_scatter_11_bitcast_1290_136: argument 1"}
!794 = !{!795}
!795 = distinct !{!795, !796, !"fused_scatter_11_maximum_82_13: argument 0"}
!796 = distinct !{!796, !"fused_scatter_11_maximum_82_13"}
!797 = !{!798}
!798 = distinct !{!798, !796, !"fused_scatter_11_maximum_82_13: argument 2"}
!799 = !{!800}
!800 = distinct !{!800, !801, !"fused_scatter_11_maximum_82_13: argument 0"}
!801 = distinct !{!801, !"fused_scatter_11_maximum_82_13"}
!802 = !{!803}
!803 = distinct !{!803, !801, !"fused_scatter_11_maximum_82_13: argument 2"}
!804 = !{!805}
!805 = distinct !{!805, !806, !"fused_scatter_11_bitcast_1290_136: argument 0"}
!806 = distinct !{!806, !"fused_scatter_11_bitcast_1290_136"}
!807 = !{!808}
!808 = distinct !{!808, !806, !"fused_scatter_11_bitcast_1290_136: argument 1"}
!809 = !{!800, !810}
!810 = distinct !{!810, !801, !"fused_scatter_11_maximum_82_13: argument 1"}
!811 = !{!812, !800}
!812 = distinct !{!812, !813, !"fused_scatter_11_bitcast_1290_136: argument 0"}
!813 = distinct !{!813, !"fused_scatter_11_bitcast_1290_136"}
!814 = !{!815, !810, !803}
!815 = distinct !{!815, !813, !"fused_scatter_11_bitcast_1290_136: argument 1"}
!816 = !{!795, !817}
!817 = distinct !{!817, !796, !"fused_scatter_11_maximum_82_13: argument 1"}
!818 = !{!819, !795}
!819 = distinct !{!819, !820, !"fused_scatter_11_bitcast_1290_136: argument 0"}
!820 = distinct !{!820, !"fused_scatter_11_bitcast_1290_136"}
!821 = !{!822, !817, !798}
!822 = distinct !{!822, !820, !"fused_scatter_11_bitcast_1290_136: argument 1"}

; ModuleID = 'jit__threefry_split'
source_filename = "jit__threefry_split"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @input_concatenate_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(8) %0, ptr noalias writeonly align 256 captures(none) dereferenceable(32768) %1) local_unnamed_addr #0 {
  %3 = addrspacecast ptr %0 to ptr addrspace(1)
  %4 = addrspacecast ptr %1 to ptr addrspace(1)
  %5 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !3
  %7 = shl nuw nsw i32 %6, 7
  %8 = or disjoint i32 %7, %5
  %9 = load <2 x i32>, ptr addrspace(1) %3, align 16, !invariant.load !4
  %.val18 = extractelement <2 x i32> %9, i32 0
  %.val39 = extractelement <2 x i32> %9, i32 1
  %10 = add i32 %8, %.val39
  %11 = add i32 %10, %.val18
  %12 = tail call i32 @llvm.fshl.i32(i32 %10, i32 %10, i32 13)
  %13 = xor i32 %11, %12
  %14 = add i32 %13, %11
  %15 = tail call i32 @llvm.fshl.i32(i32 %13, i32 %13, i32 15)
  %16 = xor i32 %14, %15
  %17 = add i32 %16, %14
  %18 = tail call i32 @llvm.fshl.i32(i32 %16, i32 %16, i32 26)
  %19 = xor i32 %17, %18
  %20 = add i32 %19, %17
  %21 = add i32 %20, %.val39
  %22 = tail call i32 @llvm.fshl.i32(i32 %19, i32 %19, i32 6)
  %23 = xor i32 %20, %22
  %24 = xor i32 %.val18, %.val39
  %25 = xor i32 %24, 466688986
  %26 = add i32 %25, 1
  %27 = add i32 %26, %23
  %28 = add i32 %21, %27
  %29 = tail call i32 @llvm.fshl.i32(i32 %27, i32 %27, i32 17)
  %30 = xor i32 %28, %29
  %31 = add i32 %30, %28
  %32 = tail call i32 @llvm.fshl.i32(i32 %30, i32 %30, i32 29)
  %33 = xor i32 %31, %32
  %34 = add i32 %33, %31
  %35 = tail call i32 @llvm.fshl.i32(i32 %33, i32 %33, i32 16)
  %36 = xor i32 %34, %35
  %37 = add i32 %36, %34
  %38 = add i32 %37, %25
  %39 = tail call i32 @llvm.fshl.i32(i32 %36, i32 %36, i32 24)
  %40 = xor i32 %37, %39
  %41 = add i32 %.val18, 2
  %42 = add i32 %41, %40
  %43 = add i32 %38, %42
  %44 = tail call i32 @llvm.fshl.i32(i32 %42, i32 %42, i32 13)
  %45 = xor i32 %43, %44
  %46 = add i32 %45, %43
  %47 = tail call i32 @llvm.fshl.i32(i32 %45, i32 %45, i32 15)
  %48 = xor i32 %46, %47
  %49 = add i32 %48, %46
  %50 = tail call i32 @llvm.fshl.i32(i32 %48, i32 %48, i32 26)
  %51 = xor i32 %49, %50
  %52 = add i32 %51, %49
  %53 = add i32 %52, %.val18
  %54 = tail call i32 @llvm.fshl.i32(i32 %51, i32 %51, i32 6)
  %55 = xor i32 %52, %54
  %56 = add i32 %.val39, 3
  %57 = add i32 %56, %55
  %58 = add i32 %53, %57
  %59 = tail call i32 @llvm.fshl.i32(i32 %57, i32 %57, i32 17)
  %60 = xor i32 %58, %59
  %61 = add i32 %60, %58
  %62 = tail call i32 @llvm.fshl.i32(i32 %60, i32 %60, i32 29)
  %63 = xor i32 %61, %62
  %64 = add i32 %63, %61
  %65 = tail call i32 @llvm.fshl.i32(i32 %63, i32 %63, i32 16)
  %66 = xor i32 %64, %65
  %67 = add i32 %66, %64
  %68 = add i32 %67, %.val39
  %69 = tail call i32 @llvm.fshl.i32(i32 %66, i32 %66, i32 24)
  %70 = xor i32 %67, %69
  %71 = add i32 %25, 4
  %72 = add i32 %71, %70
  %73 = add i32 %68, %72
  %74 = tail call i32 @llvm.fshl.i32(i32 %72, i32 %72, i32 13)
  %75 = xor i32 %73, %74
  %76 = add i32 %75, %73
  %77 = tail call i32 @llvm.fshl.i32(i32 %75, i32 %75, i32 15)
  %78 = xor i32 %76, %77
  %79 = add i32 %78, %76
  %80 = tail call i32 @llvm.fshl.i32(i32 %78, i32 %78, i32 26)
  %81 = xor i32 %79, %80
  %82 = add i32 %81, %79
  %83 = add i32 %82, %25
  %84 = shl nuw nsw i32 %5, 1
  %85 = shl nuw nsw i32 %6, 8
  %86 = or disjoint i32 %84, %85
  %87 = zext nneg i32 %86 to i64
  %88 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %87
  %89 = tail call i32 @llvm.fshl.i32(i32 %81, i32 %81, i32 6)
  %90 = xor i32 %82, %89
  %91 = add i32 %.val18, 5
  %92 = add i32 %91, %90
  %93 = insertelement <2 x i32> poison, i32 %83, i32 0
  %94 = insertelement <2 x i32> %93, i32 %92, i32 1
  store <2 x i32> %94, ptr addrspace(1) %88, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{i32 0, i32 128}
!3 = !{i32 0, i32 32}
!4 = !{}

; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define ptx_kernel void @loop_multiply_fusion(ptr noalias readonly align 16 captures(none) dereferenceable(660) %0, ptr noalias readonly align 16 captures(none) dereferenceable(4) %1, ptr noalias writeonly align 256 captures(none) dereferenceable(660) %2) local_unnamed_addr #0 {
  %4 = addrspacecast ptr %2 to ptr addrspace(1)
  %5 = addrspacecast ptr %0 to ptr addrspace(1)
  %6 = addrspacecast ptr %1 to ptr addrspace(1)
  %7 = tail call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !2
  %8 = tail call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !3
  %9 = shl nuw nsw i32 %7, 7
  %10 = or disjoint i32 %9, %8
  %11 = icmp samesign ult i32 %10, 165
  %12 = zext nneg i32 %10 to i64
  %13 = getelementptr inbounds i32, ptr addrspace(1) %4, i64 %12
  %14 = getelementptr inbounds i32, ptr addrspace(1) %5, i64 %12
  br i1 %11, label %15, label %19

15:                                               ; preds = %3
  %16 = load i32, ptr addrspace(1) %14, align 4, !invariant.load !4
  %17 = load i32, ptr addrspace(1) %6, align 16, !invariant.load !4
  %18 = mul i32 %17, %16
  store i32 %18, ptr addrspace(1) %13, align 4
  br label %19

19:                                               ; preds = %15, %3
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "nvvm.reqntid"="128,1,1" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 4, !"nvvm-reflect-ftz", i32 0}
!2 = !{i32 0, i32 2}
!3 = !{i32 0, i32 128}
!4 = !{}

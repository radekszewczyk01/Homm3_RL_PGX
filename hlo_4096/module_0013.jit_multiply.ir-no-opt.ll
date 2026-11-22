; ModuleID = 'jit_multiply'
source_filename = "jit_multiply"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define ptx_kernel void @loop_multiply_fusion(ptr noalias align 16 dereferenceable(660) %0, ptr noalias align 16 dereferenceable(4) %1, ptr noalias align 256 dereferenceable(660) %2) #0 {
  %4 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %5 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %6 = mul i32 %4, 128
  %7 = add i32 %6, %5
  %8 = icmp sle i32 %7, 164
  br i1 %8, label %9, label %15

9:                                                ; preds = %3
  %10 = getelementptr inbounds i32, ptr %0, i32 %7
  %11 = load i32, ptr %10, align 4, !invariant.load !3
  %12 = load i32, ptr %1, align 4, !invariant.load !3
  %13 = mul i32 %11, %12
  %14 = getelementptr inbounds i32, ptr %2, i32 %7
  store i32 %13, ptr %14, align 4
  br label %15

15:                                               ; preds = %9, %3
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 2147483647) i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare noundef range(i32 0, 1024) i32 @llvm.nvvm.read.ptx.sreg.tid.x() #1

attributes #0 = { "nvvm.reqntid"="128,1,1" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 0, i32 2}
!2 = !{i32 0, i32 128}
!3 = !{}

; ModuleID = 'jit_iota'
source_filename = "jit_iota"
target datalayout = "e-p6:32:32-i64:64-i128:128-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

define ptx_kernel void @wrapped_iota(ptr noalias align 256 dereferenceable(660) %0) #0 {
  %2 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x(), !range !1
  %3 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x(), !range !2
  %4 = mul i32 %2, 128
  %5 = add i32 %4, %3
  %6 = icmp sle i32 %5, 164
  br i1 %6, label %7, label %9

7:                                                ; preds = %1
  %8 = getelementptr inbounds i32, ptr %0, i32 %5
  store i32 %5, ptr %8, align 4
  br label %9

9:                                                ; preds = %7, %1
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

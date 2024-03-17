; ModuleID = 'xdpsock_kern.c'
source_filename = "xdpsock_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr, ptr }

@num_socks = dso_local local_unnamed_addr global i32 0, align 4, !dbg !0
@rr = internal unnamed_addr global i32 0, align 4, !dbg !32
@xsks_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !15
@llvm.compiler.used = appending global [2 x ptr] [ptr @xdp_sock_prog, ptr @xsks_map], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_sock_prog(ptr nocapture readnone %0) #0 section "xdp_sock" !dbg !50 {
  call void @llvm.dbg.value(metadata ptr poison, metadata !64, metadata !DIExpression()), !dbg !65
  %2 = load i32, ptr @rr, align 4, !dbg !66, !tbaa !67
  %3 = add i32 %2, 1, !dbg !71
  %4 = load i32, ptr @num_socks, align 4, !dbg !72, !tbaa !67
  %5 = add nsw i32 %4, -1, !dbg !73
  %6 = and i32 %5, %3, !dbg !74
  store i32 %6, ptr @rr, align 4, !dbg !75, !tbaa !67
  %7 = zext i32 %6 to i64, !dbg !76
  %8 = tail call i64 inttoptr (i64 51 to ptr)(ptr noundef nonnull @xsks_map, i64 noundef %7, i64 noundef 1) #2, !dbg !77
  %9 = trunc i64 %8 to i32, !dbg !77
  ret i32 %9, !dbg !78
}

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!45, !46, !47, !48}
!llvm.ident = !{!49}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "num_socks", scope: !2, file: !3, line: 17, type: !22, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdpsock_kern.c", directory: "/home/yunwei/ebpf-xdp-dpdk/afxdp/l2fwd", checksumkind: CSK_MD5, checksum: "e847cac90822b2a31d5a4186de8572f4")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 4363, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/yunwei/ebpf-xdp-dpdk/afxdp/l2fwd", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!0, !15, !32, !34}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "xsks_map", scope: !2, file: !3, line: 15, type: !17, isLocal: false, isDefinition: true)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 10, size: 256, elements: !18)
!18 = !{!19, !25, !30, !31}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !17, file: !3, line: 11, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 544, elements: !23)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{!24}
!24 = !DISubrange(count: 17)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !17, file: !3, line: 12, baseType: !26, size: 64, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 128, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 4)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !17, file: !3, line: 13, baseType: !26, size: 64, offset: 128)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !17, file: !3, line: 14, baseType: !26, size: 64, offset: 192)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "rr", scope: !2, file: !3, line: 18, type: !7, isLocal: true, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !36, line: 1323, type: !37, isLocal: true, isDefinition: true)
!36 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/yunwei/ebpf-xdp-dpdk/afxdp/l2fwd", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !41, !42, !42}
!40 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !43, line: 31, baseType: !44)
!43 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!44 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!45 = !{i32 7, !"Dwarf Version", i32 5}
!46 = !{i32 2, !"Debug Info Version", i32 3}
!47 = !{i32 1, !"wchar_size", i32 4}
!48 = !{i32 7, !"frame-pointer", i32 2}
!49 = !{!"Ubuntu clang version 15.0.7"}
!50 = distinct !DISubprogram(name: "xdp_sock_prog", scope: !3, file: !3, line: 20, type: !51, scopeLine: 21, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !63)
!51 = !DISubroutineType(types: !52)
!52 = !{!22, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 4374, size: 192, elements: !55)
!55 = !{!56, !58, !59, !60, !61, !62}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !54, file: !6, line: 4375, baseType: !57, size: 32)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !43, line: 27, baseType: !7)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !54, file: !6, line: 4376, baseType: !57, size: 32, offset: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !54, file: !6, line: 4377, baseType: !57, size: 32, offset: 64)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !54, file: !6, line: 4379, baseType: !57, size: 32, offset: 96)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !54, file: !6, line: 4380, baseType: !57, size: 32, offset: 128)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !54, file: !6, line: 4382, baseType: !57, size: 32, offset: 160)
!63 = !{!64}
!64 = !DILocalVariable(name: "ctx", arg: 1, scope: !50, file: !3, line: 20, type: !53)
!65 = !DILocation(line: 0, scope: !50)
!66 = !DILocation(line: 22, column: 8, scope: !50)
!67 = !{!68, !68, i64 0}
!68 = !{!"int", !69, i64 0}
!69 = !{!"omnipotent char", !70, i64 0}
!70 = !{!"Simple C/C++ TBAA"}
!71 = !DILocation(line: 22, column: 11, scope: !50)
!72 = !DILocation(line: 22, column: 19, scope: !50)
!73 = !DILocation(line: 22, column: 29, scope: !50)
!74 = !DILocation(line: 22, column: 16, scope: !50)
!75 = !DILocation(line: 22, column: 5, scope: !50)
!76 = !DILocation(line: 23, column: 37, scope: !50)
!77 = !DILocation(line: 23, column: 9, scope: !50)
!78 = !DILocation(line: 23, column: 2, scope: !50)

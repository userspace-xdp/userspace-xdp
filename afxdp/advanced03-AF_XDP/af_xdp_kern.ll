; ModuleID = 'af_xdp_kern.c'
source_filename = "af_xdp_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon = type { ptr, ptr, ptr, ptr }
%struct.anon.0 = type { ptr, ptr, ptr, ptr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }

@xdp_stats_map = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !0
@xsks_map = dso_local global %struct.anon.0 zeroinitializer, section ".maps", align 8, !dbg !21
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !15
@llvm.compiler.used = appending global [4 x ptr] [ptr @_license, ptr @xdp_sock_prog, ptr @xdp_stats_map, ptr @xsks_map], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_sock_prog(ptr nocapture noundef readonly %0) #0 section "xdp" !dbg !73 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata ptr %0, metadata !86, metadata !DIExpression()), !dbg !89
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #3, !dbg !90
  %3 = getelementptr inbounds %struct.xdp_md, ptr %0, i64 0, i32 4, !dbg !91
  %4 = load i32, ptr %3, align 4, !dbg !91, !tbaa !92
  call void @llvm.dbg.value(metadata i32 %4, metadata !87, metadata !DIExpression()), !dbg !89
  store i32 %4, ptr %2, align 4, !dbg !97, !tbaa !98
  call void @llvm.dbg.value(metadata ptr %2, metadata !87, metadata !DIExpression(DW_OP_deref)), !dbg !89
  %5 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xdp_stats_map, ptr noundef nonnull %2) #3, !dbg !99
  call void @llvm.dbg.value(metadata ptr %5, metadata !88, metadata !DIExpression()), !dbg !89
  %6 = icmp eq ptr %5, null, !dbg !100
  br i1 %6, label %12, label %7, !dbg !102

7:                                                ; preds = %1
  %8 = load i32, ptr %5, align 4, !dbg !103, !tbaa !98
  %9 = add i32 %8, 1, !dbg !103
  store i32 %9, ptr %5, align 4, !dbg !103, !tbaa !98
  %10 = and i32 %8, 1, !dbg !106
  %11 = icmp eq i32 %10, 0, !dbg !106
  br i1 %11, label %12, label %20, !dbg !107

12:                                               ; preds = %7, %1
  call void @llvm.dbg.value(metadata ptr %2, metadata !87, metadata !DIExpression(DW_OP_deref)), !dbg !89
  %13 = call ptr inttoptr (i64 1 to ptr)(ptr noundef nonnull @xsks_map, ptr noundef nonnull %2) #3, !dbg !108
  %14 = icmp eq ptr %13, null, !dbg !108
  br i1 %14, label %20, label %15, !dbg !110

15:                                               ; preds = %12
  %16 = load i32, ptr %2, align 4, !dbg !111, !tbaa !98
  call void @llvm.dbg.value(metadata i32 %16, metadata !87, metadata !DIExpression()), !dbg !89
  %17 = sext i32 %16 to i64, !dbg !111
  %18 = call i64 inttoptr (i64 51 to ptr)(ptr noundef nonnull @xsks_map, i64 noundef %17, i64 noundef 0) #3, !dbg !112
  %19 = trunc i64 %18 to i32, !dbg !112
  br label %20, !dbg !113

20:                                               ; preds = %12, %7, %15
  %21 = phi i32 [ %19, %15 ], [ 2, %7 ], [ 2, %12 ], !dbg !89
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #3, !dbg !114
  ret i32 %21, !dbg !114
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!68, !69, !70, !71}
!llvm.ident = !{!72}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !3, line: 19, type: !58, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 16.0.6 (15)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "af_xdp_kern.c", directory: "/home/yunwei37/dpdk-startingpoint/afxdp/advanced03-AF_XDP", checksumkind: CSK_MD5, checksum: "0aa2ba9b2b690f96c2a240c150f90cfb")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 6201, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "", checksumkind: CSK_MD5, checksum: "c8368d268df2d203be10308c6a67c158")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !{!15, !21, !0, !41, !50}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 43, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 32, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 4)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "xsks_map", scope: !2, file: !3, line: 12, type: !23, isLocal: false, isDefinition: true)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 7, size: 256, elements: !24)
!24 = !{!25, !31, !35, !36}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !23, file: !3, line: 8, baseType: !26, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 544, elements: !29)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !{!30}
!30 = !DISubrange(count: 17)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !23, file: !3, line: 9, baseType: !32, size: 64, offset: 64)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !34, line: 27, baseType: !7)
!34 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!35 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !23, file: !3, line: 10, baseType: !32, size: 64, offset: 128)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !23, file: !3, line: 11, baseType: !37, size: 64, offset: 192)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 2048, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 64)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !43, line: 56, type: !44, isLocal: true, isDefinition: true)
!43 = !DIFile(filename: "../lib/install/include/bpf/bpf_helper_defs.h", directory: "/home/yunwei37/dpdk-startingpoint/afxdp/advanced03-AF_XDP", checksumkind: CSK_MD5, checksum: "7422ca06c9dc86eba2f268a57d8acf2f")
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !43, line: 1323, type: !52, isLocal: true, isDefinition: true)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !47, !56, !56}
!55 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !34, line: 31, baseType: !57)
!57 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 14, size: 256, elements: !59)
!59 = !{!60, !65, !66, !67}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !58, file: !3, line: 15, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 192, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 6)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !58, file: !3, line: 16, baseType: !32, size: 64, offset: 64)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !58, file: !3, line: 17, baseType: !32, size: 64, offset: 128)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !58, file: !3, line: 18, baseType: !37, size: 64, offset: 192)
!68 = !{i32 7, !"Dwarf Version", i32 5}
!69 = !{i32 2, !"Debug Info Version", i32 3}
!70 = !{i32 1, !"wchar_size", i32 4}
!71 = !{i32 7, !"frame-pointer", i32 2}
!72 = !{!"Ubuntu clang version 16.0.6 (15)"}
!73 = distinct !DISubprogram(name: "xdp_sock_prog", scope: !3, file: !3, line: 22, type: !74, scopeLine: 23, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !85)
!74 = !DISubroutineType(types: !75)
!75 = !{!28, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 6212, size: 192, elements: !78)
!78 = !{!79, !80, !81, !82, !83, !84}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !77, file: !6, line: 6213, baseType: !33, size: 32)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !77, file: !6, line: 6214, baseType: !33, size: 32, offset: 32)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !77, file: !6, line: 6215, baseType: !33, size: 32, offset: 64)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !77, file: !6, line: 6217, baseType: !33, size: 32, offset: 96)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !77, file: !6, line: 6218, baseType: !33, size: 32, offset: 128)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !77, file: !6, line: 6220, baseType: !33, size: 32, offset: 160)
!85 = !{!86, !87, !88}
!86 = !DILocalVariable(name: "ctx", arg: 1, scope: !73, file: !3, line: 22, type: !76)
!87 = !DILocalVariable(name: "index", scope: !73, file: !3, line: 24, type: !28)
!88 = !DILocalVariable(name: "pkt_count", scope: !73, file: !3, line: 25, type: !32)
!89 = !DILocation(line: 0, scope: !73)
!90 = !DILocation(line: 24, column: 5, scope: !73)
!91 = !DILocation(line: 24, column: 22, scope: !73)
!92 = !{!93, !94, i64 16}
!93 = !{!"xdp_md", !94, i64 0, !94, i64 4, !94, i64 8, !94, i64 12, !94, i64 16, !94, i64 20}
!94 = !{!"int", !95, i64 0}
!95 = !{!"omnipotent char", !96, i64 0}
!96 = !{!"Simple C/C++ TBAA"}
!97 = !DILocation(line: 24, column: 9, scope: !73)
!98 = !{!94, !94, i64 0}
!99 = !DILocation(line: 27, column: 17, scope: !73)
!100 = !DILocation(line: 28, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !73, file: !3, line: 28, column: 9)
!102 = !DILocation(line: 28, column: 9, scope: !73)
!103 = !DILocation(line: 31, column: 25, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !3, line: 31, column: 13)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 28, column: 20)
!106 = !DILocation(line: 31, column: 28, scope: !104)
!107 = !DILocation(line: 31, column: 13, scope: !105)
!108 = !DILocation(line: 37, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !73, file: !3, line: 37, column: 9)
!110 = !DILocation(line: 37, column: 9, scope: !73)
!111 = !DILocation(line: 38, column: 44, scope: !109)
!112 = !DILocation(line: 38, column: 16, scope: !109)
!113 = !DILocation(line: 38, column: 9, scope: !109)
!114 = !DILocation(line: 41, column: 1, scope: !73)

; ModuleID = 'bpf-jit'
source_filename = "bpf-jit"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare i64 @__lddw_helper_map_by_fd(i32)

declare i64 @__lddw_helper_map_val(i64)

declare i64 @_bpf_helper_ext_0000(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0001(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0002(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0003(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0004(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0005(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0006(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0007(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0008(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0009(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0010(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0011(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0012(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0013(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0014(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0015(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0016(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0017(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0018(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0019(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0020(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0021(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0022(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0023(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0024(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0025(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0026(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0027(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0028(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0029(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0030(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0031(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0032(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0033(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0034(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0035(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0036(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0037(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0038(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0039(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0040(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0041(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0042(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0043(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0044(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0045(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0046(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0047(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0048(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0049(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0050(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0051(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0052(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0053(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0054(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0055(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0056(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0057(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0058(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0059(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0060(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0061(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0062(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0063(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0064(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0065(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0066(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0067(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0068(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0069(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0070(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0071(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0072(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0073(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0074(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0075(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0076(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0077(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0078(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0079(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0080(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0081(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0082(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0083(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0084(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0085(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0086(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0087(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0088(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0089(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0090(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0091(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0092(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0093(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0094(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0095(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0096(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0097(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0098(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0099(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0100(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0101(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0102(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0103(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0104(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0105(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0106(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0107(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0108(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0109(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0110(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0111(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0112(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0113(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0114(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0115(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0116(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0117(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0118(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0119(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0120(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0121(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0122(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0123(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0124(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0125(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0126(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0127(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0128(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0129(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0130(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0131(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0132(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0133(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0134(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0135(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0136(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0137(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0138(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0139(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0140(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0141(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0142(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0143(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0144(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0145(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0146(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0147(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0148(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0149(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0150(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0151(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0152(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0153(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0154(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0155(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0156(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0157(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0158(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0159(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0160(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0161(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0162(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0163(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0164(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0165(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0166(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0167(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0168(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0169(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0170(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0171(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0172(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0173(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0174(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0175(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0176(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0177(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0178(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0179(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0180(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0181(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0182(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0183(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0184(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0185(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0186(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0187(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0188(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0189(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0190(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0191(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0192(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0193(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0194(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0195(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0196(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0197(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0198(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0199(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0200(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0201(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0202(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0203(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0204(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0205(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0206(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0207(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0208(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0209(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0210(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0211(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0212(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0213(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0214(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0215(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0216(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0217(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0218(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0219(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0220(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0221(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0222(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0223(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0224(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0225(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0226(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0227(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0228(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0229(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0230(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0231(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0232(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0233(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0234(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0235(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0236(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0237(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0238(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0239(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0240(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0241(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0242(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0243(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0244(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0245(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0246(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0247(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0248(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0249(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0250(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0251(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0252(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0253(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0254(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0255(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0256(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0257(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0258(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0259(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0260(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0261(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0262(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0263(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0264(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0265(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0266(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0267(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0268(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0269(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0270(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0271(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0272(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0273(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0274(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0275(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0276(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0277(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0278(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0279(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0280(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0281(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0282(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0283(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0284(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0285(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0286(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0287(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0288(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0289(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0290(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0291(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0292(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0293(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0294(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0295(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0296(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0297(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0298(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0299(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0300(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0301(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0302(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0303(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0304(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0305(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0306(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0307(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0308(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0309(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0310(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0311(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0312(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0313(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0314(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0315(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0316(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0317(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0318(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0319(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0320(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0321(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0322(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0323(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0324(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0325(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0326(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0327(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0328(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0329(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0330(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0331(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0332(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0333(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0334(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0335(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0336(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0337(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0338(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0339(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0340(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0341(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0342(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0343(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0344(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0345(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0346(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0347(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0348(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0349(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0350(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0351(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0352(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0353(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0354(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0355(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0356(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0357(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0358(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0359(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0360(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0361(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0362(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0363(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0364(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0365(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0366(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0367(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0368(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0369(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0370(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0371(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0372(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0373(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0374(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0375(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0376(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0377(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0378(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0379(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0380(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0381(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0382(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0383(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0384(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0385(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0386(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0387(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0388(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0389(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0390(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0391(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0392(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0393(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0394(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0395(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0396(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0397(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0398(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0399(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0400(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0401(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0402(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0403(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0404(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0405(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0406(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0407(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0408(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0409(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0410(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0411(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0412(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0413(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0414(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0415(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0416(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0417(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0418(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0419(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0420(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0421(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0422(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0423(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0424(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0425(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0426(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0427(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0428(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0429(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0430(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0431(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0432(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0433(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0434(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0435(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0436(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0437(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0438(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0439(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0440(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0441(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0442(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0443(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0444(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0445(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0446(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0447(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0448(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0449(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0450(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0451(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0452(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0453(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0454(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0455(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0456(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0457(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0458(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0459(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0460(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0461(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0462(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0463(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0464(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0465(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0466(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0467(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0468(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0469(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0470(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0471(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0472(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0473(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0474(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0475(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0476(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0477(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0478(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0479(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0480(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0481(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0482(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0483(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0484(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0485(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0486(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0487(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0488(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0489(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0490(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0491(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0492(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0493(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0494(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0495(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0496(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0497(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0498(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0499(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0500(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0501(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0502(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0503(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0504(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0505(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0506(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0507(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0508(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0509(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0510(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0511(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0512(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0513(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0514(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0515(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0516(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0517(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0518(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0519(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0520(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0521(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0522(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0523(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0524(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0525(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0526(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0527(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0528(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0529(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0530(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0531(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0532(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0533(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0534(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0535(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0536(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0537(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0538(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0539(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0540(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0541(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0542(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0543(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0544(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0545(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0546(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0547(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0548(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0549(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0550(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0551(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0552(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0553(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0554(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0555(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0556(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0557(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0558(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0559(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0560(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0561(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0562(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0563(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0564(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0565(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0566(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0567(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0568(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0569(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0570(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0571(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0572(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0573(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0574(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0575(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0576(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0577(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0578(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0579(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0580(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0581(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0582(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0583(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0584(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0585(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0586(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0587(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0588(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0589(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0590(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0591(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0592(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0593(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0594(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0595(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0596(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0597(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0598(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0599(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0600(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0601(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0602(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0603(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0604(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0605(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0606(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0607(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0608(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0609(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0610(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0611(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0612(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0613(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0614(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0615(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0616(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0617(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0618(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0619(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0620(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0621(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0622(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0623(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0624(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0625(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0626(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0627(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0628(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0629(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0630(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0631(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0632(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0633(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0634(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0635(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0636(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0637(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0638(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0639(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0640(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0641(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0642(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0643(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0644(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0645(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0646(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0647(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0648(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0649(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0650(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0651(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0652(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0653(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0654(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0655(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0656(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0657(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0658(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0659(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0660(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0661(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0662(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0663(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0664(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0665(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0666(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0667(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0668(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0669(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0670(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0671(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0672(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0673(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0674(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0675(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0676(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0677(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0678(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0679(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0680(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0681(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0682(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0683(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0684(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0685(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0686(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0687(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0688(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0689(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0690(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0691(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0692(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0693(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0694(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0695(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0696(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0697(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0698(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0699(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0700(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0701(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0702(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0703(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0704(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0705(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0706(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0707(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0708(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0709(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0710(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0711(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0712(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0713(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0714(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0715(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0716(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0717(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0718(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0719(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0720(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0721(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0722(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0723(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0724(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0725(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0726(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0727(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0728(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0729(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0730(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0731(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0732(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0733(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0734(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0735(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0736(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0737(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0738(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0739(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0740(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0741(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0742(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0743(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0744(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0745(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0746(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0747(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0748(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0749(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0750(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0751(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0752(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0753(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0754(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0755(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0756(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0757(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0758(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0759(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0760(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0761(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0762(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0763(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0764(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0765(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0766(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0767(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0768(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0769(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0770(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0771(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0772(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0773(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0774(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0775(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0776(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0777(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0778(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0779(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0780(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0781(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0782(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0783(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0784(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0785(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0786(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0787(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0788(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0789(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0790(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0791(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0792(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0793(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0794(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0795(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0796(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0797(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0798(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0799(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0800(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0801(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0802(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0803(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0804(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0805(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0806(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0807(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0808(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0809(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0810(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0811(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0812(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0813(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0814(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0815(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0816(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0817(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0818(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0819(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0820(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0821(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0822(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0823(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0824(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0825(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0826(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0827(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0828(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0829(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0830(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0831(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0832(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0833(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0834(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0835(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0836(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0837(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0838(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0839(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0840(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0841(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0842(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0843(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0844(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0845(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0846(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0847(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0848(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0849(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0850(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0851(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0852(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0853(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0854(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0855(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0856(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0857(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0858(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0859(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0860(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0861(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0862(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0863(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0864(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0865(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0866(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0867(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0868(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0869(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0870(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0871(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0872(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0873(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0874(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0875(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0876(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0877(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0878(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0879(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0880(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0881(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0882(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0883(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0884(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0885(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0886(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0887(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0888(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0889(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0890(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0891(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0892(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0893(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0894(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0895(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0896(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0897(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0898(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0899(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0900(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0901(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0902(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0903(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0904(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0905(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0906(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0907(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0908(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0909(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0910(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0911(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0912(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0913(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0914(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0915(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0916(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0917(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0918(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0919(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0920(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0921(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0922(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0923(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0924(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0925(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0926(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0927(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0928(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0929(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0930(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0931(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0932(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0933(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0934(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0935(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0936(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0937(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0938(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0939(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0940(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0941(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0942(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0943(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0944(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0945(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0946(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0947(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0948(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0949(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0950(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0951(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0952(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0953(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0954(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0955(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0956(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0957(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0958(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0959(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0960(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0961(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0962(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0963(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0964(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0965(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0966(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0967(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0968(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0969(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0970(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0971(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0972(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0973(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0974(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0975(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0976(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0977(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0978(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0979(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0980(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0981(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0982(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0983(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0984(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0985(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0986(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0987(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0988(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0989(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0990(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0991(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0992(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0993(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0994(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0995(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0996(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0997(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0998(i64, i64, i64, i64, i64)

declare i64 @_bpf_helper_ext_0999(i64, i64, i64, i64, i64)

define i64 @bpf_main(ptr %0, i64 %1) {
setupBlock:
  %r0 = alloca i64, align 8
  %r1 = alloca i64, align 8
  %r2 = alloca i64, align 8
  %r3 = alloca i64, align 8
  %r4 = alloca i64, align 8
  %r5 = alloca i64, align 8
  %r6 = alloca i64, align 8
  %r7 = alloca i64, align 8
  %r8 = alloca i64, align 8
  %r9 = alloca i64, align 8
  %r10 = alloca i64, align 8
  %stackBegin = alloca i64, i32 2058, align 8
  %stackEnd = getelementptr i64, ptr %stackBegin, i32 2048
  store ptr %stackEnd, ptr %r10, align 8
  store ptr %0, ptr %r1, align 8
  store i64 %1, ptr %r2, align 4
  %callStack = alloca ptr, i32 320, align 8
  %callItemCnt = alloca i64, align 8
  store i64 0, ptr %callItemCnt, align 4
  br label %bb_inst_0

bb_inst_0:                                        ; preds = %setupBlock
  %2 = load i64, ptr %r1, align 4
  store i64 %2, ptr %r6, align 4
  store i64 1, ptr %r8, align 4
  %3 = load ptr, ptr %r6, align 8
  %4 = getelementptr i8, ptr %3, i64 8
  %5 = load i64, ptr %4, align 4
  store i64 %5, ptr %r9, align 4
  %6 = load ptr, ptr %r6, align 8
  %7 = getelementptr i8, ptr %6, i64 0
  %8 = load i64, ptr %7, align 4
  store i64 %8, ptr %r7, align 4
  %9 = load i64, ptr %r7, align 4
  store i64 %9, ptr %r1, align 4
  %10 = load i64, ptr %r1, align 4
  %11 = add i64 %10, 14
  store i64 %11, ptr %r1, align 4
  %12 = load i64, ptr %r9, align 4
  %13 = load i64, ptr %r1, align 4
  %14 = icmp ugt i64 %13, %12
  br i1 %14, label %bb_inst_942, label %bb_inst_7

bb_inst_7:                                        ; preds = %bb_inst_0
  %15 = load ptr, ptr %r7, align 8
  %16 = getelementptr i8, ptr %15, i64 12
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i64
  store i64 %18, ptr %r3, align 4
  %19 = load ptr, ptr %r7, align 8
  %20 = getelementptr i8, ptr %19, i64 13
  %21 = load i8, ptr %20, align 1
  %22 = zext i8 %21 to i64
  store i64 %22, ptr %r2, align 4
  %23 = load i64, ptr %r2, align 4
  %24 = shl i64 %23, 8
  store i64 %24, ptr %r2, align 4
  %25 = load i64, ptr %r2, align 4
  %26 = load i64, ptr %r3, align 4
  %27 = or i64 %25, %26
  store i64 %27, ptr %r2, align 4
  %28 = load i64, ptr %r2, align 4
  %29 = icmp eq i64 %28, 56710
  br i1 %29, label %bb_inst_106, label %bb_inst_12

bb_inst_12:                                       ; preds = %bb_inst_7
  store i64 2, ptr %r8, align 4
  %30 = load i64, ptr %r2, align 4
  %31 = icmp ne i64 %30, 8
  br i1 %31, label %bb_inst_942, label %bb_inst_14

bb_inst_14:                                       ; preds = %bb_inst_12
  store i64 0, ptr %r2, align 4
  %32 = load i64, ptr %r2, align 4
  %33 = load ptr, ptr %r10, align 8
  %34 = getelementptr i8, ptr %33, i64 -32
  store i64 %32, ptr %34, align 4
  %35 = load i64, ptr %r2, align 4
  %36 = load ptr, ptr %r10, align 8
  %37 = getelementptr i8, ptr %36, i64 -40
  store i64 %35, ptr %37, align 4
  %38 = load i64, ptr %r2, align 4
  %39 = load ptr, ptr %r10, align 8
  %40 = getelementptr i8, ptr %39, i64 -48
  store i64 %38, ptr %40, align 4
  %41 = load i64, ptr %r2, align 4
  %42 = load ptr, ptr %r10, align 8
  %43 = getelementptr i8, ptr %42, i64 -56
  store i64 %41, ptr %43, align 4
  %44 = load i64, ptr %r2, align 4
  %45 = load ptr, ptr %r10, align 8
  %46 = getelementptr i8, ptr %45, i64 -64
  store i64 %44, ptr %46, align 4
  %47 = load i64, ptr %r2, align 4
  %48 = load ptr, ptr %r10, align 8
  %49 = getelementptr i8, ptr %48, i64 -72
  store i64 %47, ptr %49, align 4
  %50 = load i64, ptr %r2, align 4
  %51 = trunc i64 %50 to i32
  %52 = load ptr, ptr %r10, align 8
  %53 = getelementptr i8, ptr %52, i64 -80
  store i32 %51, ptr %53, align 4
  %54 = load i64, ptr %r2, align 4
  %55 = load ptr, ptr %r10, align 8
  %56 = getelementptr i8, ptr %55, i64 -88
  store i64 %54, ptr %56, align 4
  %57 = load i64, ptr %r2, align 4
  %58 = load ptr, ptr %r10, align 8
  %59 = getelementptr i8, ptr %58, i64 -96
  store i64 %57, ptr %59, align 4
  %60 = load i64, ptr %r2, align 4
  %61 = trunc i64 %60 to i32
  %62 = load ptr, ptr %r10, align 8
  %63 = getelementptr i8, ptr %62, i64 -104
  store i32 %61, ptr %63, align 4
  %64 = load i64, ptr %r7, align 4
  store i64 %64, ptr %r3, align 4
  %65 = load i64, ptr %r3, align 4
  %66 = add i64 %65, 34
  store i64 %66, ptr %r3, align 4
  store i64 1, ptr %r8, align 4
  %67 = load i64, ptr %r9, align 4
  %68 = load i64, ptr %r3, align 4
  %69 = icmp ugt i64 %68, %67
  br i1 %69, label %bb_inst_942, label %bb_inst_29

bb_inst_29:                                       ; preds = %bb_inst_14
  %70 = load ptr, ptr %r1, align 8
  %71 = getelementptr i8, ptr %70, i64 0
  %72 = load i8, ptr %71, align 1
  %73 = zext i8 %72 to i64
  store i64 %73, ptr %r1, align 4
  %74 = load i64, ptr %r1, align 4
  %75 = and i64 %74, 15
  store i64 %75, ptr %r1, align 4
  store i64 1, ptr %r8, align 4
  %76 = load i64, ptr %r1, align 4
  %77 = icmp ne i64 %76, 5
  br i1 %77, label %bb_inst_942, label %bb_inst_33

bb_inst_33:                                       ; preds = %bb_inst_29
  %78 = load ptr, ptr %r7, align 8
  %79 = getelementptr i8, ptr %78, i64 15
  %80 = load i8, ptr %79, align 1
  %81 = zext i8 %80 to i64
  store i64 %81, ptr %r1, align 4
  %82 = load i64, ptr %r1, align 4
  %83 = trunc i64 %82 to i8
  %84 = load ptr, ptr %r10, align 8
  %85 = getelementptr i8, ptr %84, i64 -27
  store i8 %83, ptr %85, align 1
  %86 = load ptr, ptr %r7, align 8
  %87 = getelementptr i8, ptr %86, i64 23
  %88 = load i8, ptr %87, align 1
  %89 = zext i8 %88 to i64
  store i64 %89, ptr %r1, align 4
  %90 = load i64, ptr %r1, align 4
  %91 = trunc i64 %90 to i8
  %92 = load ptr, ptr %r10, align 8
  %93 = getelementptr i8, ptr %92, i64 -36
  store i8 %91, ptr %93, align 1
  %94 = load ptr, ptr %r7, align 8
  %95 = getelementptr i8, ptr %94, i64 20
  %96 = load i16, ptr %95, align 2
  %97 = zext i16 %96 to i64
  store i64 %97, ptr %r2, align 4
  %98 = load i64, ptr %r2, align 4
  store i64 %98, ptr %r4, align 4
  %99 = load i64, ptr %r4, align 4
  %100 = and i64 %99, 65343
  store i64 %100, ptr %r4, align 4
  store i64 1, ptr %r8, align 4
  %101 = load i64, ptr %r4, align 4
  %102 = icmp ne i64 %101, 0
  br i1 %102, label %bb_inst_942, label %bb_inst_42

bb_inst_42:                                       ; preds = %bb_inst_33
  %103 = load ptr, ptr %r7, align 8
  %104 = getelementptr i8, ptr %103, i64 16
  %105 = load i16, ptr %104, align 2
  %106 = zext i16 %105 to i64
  store i64 %106, ptr %r4, align 4
  %107 = load i64, ptr %r4, align 4
  %108 = load ptr, ptr %r10, align 8
  %109 = getelementptr i8, ptr %108, i64 -128
  store i64 %107, ptr %109, align 4
  %110 = load i64, ptr %r1, align 4
  store i64 %110, ptr %r4, align 4
  %111 = load i64, ptr %r4, align 4
  %112 = icmp ne i64 %111, 1
  br i1 %112, label %bb_inst_280, label %bb_inst_46

bb_inst_46:                                       ; preds = %bb_inst_42
  %113 = load i64, ptr %r7, align 4
  store i64 %113, ptr %r4, align 4
  %114 = load i64, ptr %r4, align 4
  %115 = add i64 %114, 42
  store i64 %115, ptr %r4, align 4
  store i64 1, ptr %r8, align 4
  %116 = load i64, ptr %r9, align 4
  %117 = load i64, ptr %r4, align 4
  %118 = icmp ugt i64 %117, %116
  br i1 %118, label %bb_inst_942, label %bb_inst_50

bb_inst_50:                                       ; preds = %bb_inst_46
  %119 = load ptr, ptr %r3, align 8
  %120 = getelementptr i8, ptr %119, i64 0
  %121 = load i8, ptr %120, align 1
  %122 = zext i8 %121 to i64
  store i64 %122, ptr %r1, align 4
  %123 = load i64, ptr %r1, align 4
  %124 = icmp eq i64 %123, 3
  br i1 %124, label %bb_inst_496, label %bb_inst_52

bb_inst_52:                                       ; preds = %bb_inst_50
  store i64 2, ptr %r8, align 4
  %125 = load i64, ptr %r1, align 4
  %126 = icmp ne i64 %125, 8
  br i1 %126, label %bb_inst_942, label %bb_inst_54

bb_inst_54:                                       ; preds = %bb_inst_52
  %127 = load ptr, ptr %r10, align 8
  %128 = getelementptr i8, ptr %127, i64 -128
  %129 = load i64, ptr %128, align 4
  store i64 %129, ptr %r1, align 4
  %130 = load i64, ptr %r2, align 4
  %131 = load i64, ptr %r1, align 4
  %132 = add i64 %130, %131
  store i64 %132, ptr %r2, align 4
  store i64 64, ptr %r1, align 4
  %133 = load i64, ptr %r1, align 4
  %134 = trunc i64 %133 to i8
  %135 = load ptr, ptr %r7, align 8
  %136 = getelementptr i8, ptr %135, i64 22
  store i8 %134, ptr %136, align 1
  %137 = load ptr, ptr %r7, align 8
  %138 = getelementptr i8, ptr %137, i64 14
  %139 = load i16, ptr %138, align 2
  %140 = zext i16 %139 to i64
  store i64 %140, ptr %r1, align 4
  %141 = load i64, ptr %r2, align 4
  %142 = load i64, ptr %r1, align 4
  %143 = add i64 %141, %142
  store i64 %143, ptr %r2, align 4
  %144 = load ptr, ptr %r7, align 8
  %145 = getelementptr i8, ptr %144, i64 30
  %146 = load i32, ptr %145, align 4
  %147 = zext i32 %146 to i64
  store i64 %147, ptr %r1, align 4
  %148 = load i64, ptr %r1, align 4
  store i64 %148, ptr %r3, align 4
  %149 = load i64, ptr %r3, align 4
  %150 = and i64 %149, 65535
  store i64 %150, ptr %r3, align 4
  %151 = load i64, ptr %r1, align 4
  store i64 %151, ptr %r4, align 4
  %152 = load i64, ptr %r4, align 4
  %153 = lshr i64 %152, 16
  store i64 %153, ptr %r4, align 4
  %154 = load i64, ptr %r4, align 4
  %155 = load i64, ptr %r3, align 4
  %156 = add i64 %154, %155
  store i64 %156, ptr %r4, align 4
  %157 = load ptr, ptr %r7, align 8
  %158 = getelementptr i8, ptr %157, i64 26
  %159 = load i32, ptr %158, align 4
  %160 = zext i32 %159 to i64
  store i64 %160, ptr %r3, align 4
  %161 = load i64, ptr %r3, align 4
  store i64 %161, ptr %r5, align 4
  %162 = load i64, ptr %r5, align 4
  %163 = and i64 %162, 65535
  store i64 %163, ptr %r5, align 4
  %164 = load i64, ptr %r4, align 4
  %165 = load i64, ptr %r5, align 4
  %166 = add i64 %164, %165
  store i64 %166, ptr %r4, align 4
  %167 = load i64, ptr %r3, align 4
  store i64 %167, ptr %r5, align 4
  %168 = load i64, ptr %r5, align 4
  %169 = lshr i64 %168, 16
  store i64 %169, ptr %r5, align 4
  %170 = load i64, ptr %r4, align 4
  %171 = load i64, ptr %r5, align 4
  %172 = add i64 %170, %171
  store i64 %172, ptr %r4, align 4
  %173 = load i64, ptr %r2, align 4
  %174 = load i64, ptr %r4, align 4
  %175 = add i64 %173, %174
  store i64 %175, ptr %r2, align 4
  %176 = load ptr, ptr %r7, align 8
  %177 = getelementptr i8, ptr %176, i64 18
  %178 = load i16, ptr %177, align 2
  %179 = zext i16 %178 to i64
  store i64 %179, ptr %r4, align 4
  %180 = load i64, ptr %r2, align 4
  %181 = load i64, ptr %r4, align 4
  %182 = add i64 %180, %181
  store i64 %182, ptr %r2, align 4
  %183 = load ptr, ptr %r7, align 8
  %184 = getelementptr i8, ptr %183, i64 22
  %185 = load i16, ptr %184, align 2
  %186 = zext i16 %185 to i64
  store i64 %186, ptr %r4, align 4
  %187 = load i64, ptr %r2, align 4
  %188 = load i64, ptr %r4, align 4
  %189 = add i64 %187, %188
  store i64 %189, ptr %r2, align 4
  %190 = load i64, ptr %r2, align 4
  store i64 %190, ptr %r4, align 4
  %191 = load i64, ptr %r4, align 4
  %192 = lshr i64 %191, 16
  store i64 %192, ptr %r4, align 4
  %193 = load i64, ptr %r4, align 4
  %194 = icmp eq i64 %193, 0
  br i1 %194, label %bb_inst_83, label %bb_inst_81

bb_inst_81:                                       ; preds = %bb_inst_54
  %195 = load i64, ptr %r2, align 4
  %196 = and i64 %195, 65535
  store i64 %196, ptr %r2, align 4
  %197 = load i64, ptr %r2, align 4
  %198 = load i64, ptr %r4, align 4
  %199 = add i64 %197, %198
  store i64 %199, ptr %r2, align 4
  br label %bb_inst_83

bb_inst_83:                                       ; preds = %bb_inst_81, %bb_inst_54
  %200 = load i64, ptr %r2, align 4
  store i64 %200, ptr %r4, align 4
  %201 = load i64, ptr %r4, align 4
  %202 = lshr i64 %201, 16
  store i64 %202, ptr %r4, align 4
  %203 = load i64, ptr %r4, align 4
  %204 = icmp eq i64 %203, 0
  br i1 %204, label %bb_inst_88, label %bb_inst_86

bb_inst_86:                                       ; preds = %bb_inst_83
  %205 = load i64, ptr %r2, align 4
  %206 = and i64 %205, 65535
  store i64 %206, ptr %r2, align 4
  %207 = load i64, ptr %r2, align 4
  %208 = load i64, ptr %r4, align 4
  %209 = add i64 %207, %208
  store i64 %209, ptr %r2, align 4
  br label %bb_inst_88

bb_inst_88:                                       ; preds = %bb_inst_86, %bb_inst_83
  %210 = load i64, ptr %r2, align 4
  store i64 %210, ptr %r4, align 4
  %211 = load i64, ptr %r4, align 4
  %212 = lshr i64 %211, 16
  store i64 %212, ptr %r4, align 4
  %213 = load i64, ptr %r4, align 4
  %214 = icmp eq i64 %213, 0
  br i1 %214, label %bb_inst_93, label %bb_inst_91

bb_inst_91:                                       ; preds = %bb_inst_88
  %215 = load i64, ptr %r2, align 4
  %216 = and i64 %215, 65535
  store i64 %216, ptr %r2, align 4
  %217 = load i64, ptr %r2, align 4
  %218 = load i64, ptr %r4, align 4
  %219 = add i64 %217, %218
  store i64 %219, ptr %r2, align 4
  br label %bb_inst_93

bb_inst_93:                                       ; preds = %bb_inst_91, %bb_inst_88
  store i64 0, ptr %r4, align 4
  %220 = load i64, ptr %r4, align 4
  %221 = trunc i64 %220 to i8
  %222 = load ptr, ptr %r7, align 8
  %223 = getelementptr i8, ptr %222, i64 34
  store i8 %221, ptr %223, align 1
  %224 = load i64, ptr %r3, align 4
  %225 = trunc i64 %224 to i32
  %226 = load ptr, ptr %r7, align 8
  %227 = getelementptr i8, ptr %226, i64 30
  store i32 %225, ptr %227, align 4
  %228 = load i64, ptr %r1, align 4
  %229 = trunc i64 %228 to i32
  %230 = load ptr, ptr %r7, align 8
  %231 = getelementptr i8, ptr %230, i64 26
  store i32 %229, ptr %231, align 4
  %232 = load ptr, ptr %r7, align 8
  %233 = getelementptr i8, ptr %232, i64 36
  %234 = load i16, ptr %233, align 2
  %235 = zext i16 %234 to i64
  store i64 %235, ptr %r1, align 4
  %236 = load i64, ptr %r1, align 4
  %237 = add i64 %236, 8
  store i64 %237, ptr %r1, align 4
  %238 = load i64, ptr %r1, align 4
  %239 = trunc i64 %238 to i16
  %240 = load ptr, ptr %r7, align 8
  %241 = getelementptr i8, ptr %240, i64 36
  store i16 %239, ptr %241, align 2
  %242 = load i64, ptr %r2, align 4
  store i64 %242, ptr %r1, align 4
  %243 = load i64, ptr %r1, align 4
  %244 = lshr i64 %243, 16
  store i64 %244, ptr %r1, align 4
  %245 = load i64, ptr %r1, align 4
  %246 = load i64, ptr %r2, align 4
  %247 = add i64 %245, %246
  store i64 %247, ptr %r1, align 4
  %248 = load i64, ptr %r1, align 4
  %249 = xor i64 %248, -1
  store i64 %249, ptr %r1, align 4
  %250 = load i64, ptr %r1, align 4
  %251 = trunc i64 %250 to i16
  %252 = load ptr, ptr %r7, align 8
  %253 = getelementptr i8, ptr %252, i64 24
  store i16 %251, ptr %253, align 2
  br label %bb_inst_174

bb_inst_106:                                      ; preds = %bb_inst_7
  store i64 0, ptr %r1, align 4
  %254 = load i64, ptr %r1, align 4
  %255 = load ptr, ptr %r10, align 8
  %256 = getelementptr i8, ptr %255, i64 -32
  store i64 %254, ptr %256, align 4
  %257 = load i64, ptr %r1, align 4
  %258 = load ptr, ptr %r10, align 8
  %259 = getelementptr i8, ptr %258, i64 -40
  store i64 %257, ptr %259, align 4
  %260 = load i64, ptr %r1, align 4
  %261 = load ptr, ptr %r10, align 8
  %262 = getelementptr i8, ptr %261, i64 -48
  store i64 %260, ptr %262, align 4
  %263 = load i64, ptr %r1, align 4
  %264 = load ptr, ptr %r10, align 8
  %265 = getelementptr i8, ptr %264, i64 -56
  store i64 %263, ptr %265, align 4
  %266 = load i64, ptr %r1, align 4
  %267 = load ptr, ptr %r10, align 8
  %268 = getelementptr i8, ptr %267, i64 -64
  store i64 %266, ptr %268, align 4
  %269 = load i64, ptr %r1, align 4
  %270 = load ptr, ptr %r10, align 8
  %271 = getelementptr i8, ptr %270, i64 -72
  store i64 %269, ptr %271, align 4
  %272 = load i64, ptr %r1, align 4
  %273 = trunc i64 %272 to i32
  %274 = load ptr, ptr %r10, align 8
  %275 = getelementptr i8, ptr %274, i64 -80
  store i32 %273, ptr %275, align 4
  %276 = load i64, ptr %r1, align 4
  %277 = load ptr, ptr %r10, align 8
  %278 = getelementptr i8, ptr %277, i64 -88
  store i64 %276, ptr %278, align 4
  %279 = load i64, ptr %r1, align 4
  %280 = load ptr, ptr %r10, align 8
  %281 = getelementptr i8, ptr %280, i64 -96
  store i64 %279, ptr %281, align 4
  %282 = load i64, ptr %r1, align 4
  %283 = trunc i64 %282 to i32
  %284 = load ptr, ptr %r10, align 8
  %285 = getelementptr i8, ptr %284, i64 -104
  store i32 %283, ptr %285, align 4
  store i64 1, ptr %r8, align 4
  %286 = load i64, ptr %r7, align 4
  store i64 %286, ptr %r2, align 4
  %287 = load i64, ptr %r2, align 4
  %288 = add i64 %287, 54
  store i64 %288, ptr %r2, align 4
  %289 = load i64, ptr %r9, align 4
  %290 = load i64, ptr %r2, align 4
  %291 = icmp ugt i64 %290, %289
  br i1 %291, label %bb_inst_942, label %bb_inst_121

bb_inst_121:                                      ; preds = %bb_inst_106
  %292 = load ptr, ptr %r7, align 8
  %293 = getelementptr i8, ptr %292, i64 20
  %294 = load i8, ptr %293, align 1
  %295 = zext i8 %294 to i64
  store i64 %295, ptr %r1, align 4
  %296 = load i64, ptr %r1, align 4
  %297 = trunc i64 %296 to i8
  %298 = load ptr, ptr %r10, align 8
  %299 = getelementptr i8, ptr %298, i64 -36
  store i8 %297, ptr %299, align 1
  %300 = load ptr, ptr %r7, align 8
  %301 = getelementptr i8, ptr %300, i64 14
  %302 = load i8, ptr %301, align 1
  %303 = zext i8 %302 to i64
  store i64 %303, ptr %r3, align 4
  %304 = load i64, ptr %r3, align 4
  %305 = shl i64 %304, 4
  store i64 %305, ptr %r3, align 4
  %306 = load i64, ptr %r3, align 4
  %307 = trunc i64 %306 to i8
  %308 = load ptr, ptr %r10, align 8
  %309 = getelementptr i8, ptr %308, i64 -27
  store i8 %307, ptr %309, align 1
  %310 = load ptr, ptr %r7, align 8
  %311 = getelementptr i8, ptr %310, i64 15
  %312 = load i8, ptr %311, align 1
  %313 = zext i8 %312 to i64
  store i64 %313, ptr %r4, align 4
  %314 = load i64, ptr %r4, align 4
  %315 = lshr i64 %314, 4
  store i64 %315, ptr %r4, align 4
  %316 = load i64, ptr %r4, align 4
  %317 = load i64, ptr %r3, align 4
  %318 = or i64 %316, %317
  store i64 %318, ptr %r4, align 4
  %319 = load i64, ptr %r4, align 4
  %320 = trunc i64 %319 to i8
  %321 = load ptr, ptr %r10, align 8
  %322 = getelementptr i8, ptr %321, i64 -27
  store i8 %320, ptr %322, align 1
  %323 = load i64, ptr %r1, align 4
  %324 = icmp eq i64 %323, 44
  br i1 %324, label %bb_inst_942, label %bb_inst_131

bb_inst_131:                                      ; preds = %bb_inst_121
  %325 = load ptr, ptr %r7, align 8
  %326 = getelementptr i8, ptr %325, i64 18
  %327 = load i16, ptr %326, align 2
  %328 = zext i16 %327 to i64
  store i64 %328, ptr %r0, align 4
  %329 = load i64, ptr %r1, align 4
  %330 = icmp ne i64 %329, 58
  br i1 %330, label %bb_inst_218, label %bb_inst_133

bb_inst_133:                                      ; preds = %bb_inst_131
  %331 = load i64, ptr %r7, align 4
  store i64 %331, ptr %r1, align 4
  %332 = load i64, ptr %r1, align 4
  %333 = add i64 %332, 62
  store i64 %333, ptr %r1, align 4
  %334 = load i64, ptr %r9, align 4
  %335 = load i64, ptr %r1, align 4
  %336 = icmp ugt i64 %335, %334
  br i1 %336, label %bb_inst_942, label %bb_inst_136

bb_inst_136:                                      ; preds = %bb_inst_133
  %337 = load ptr, ptr %r2, align 8
  %338 = getelementptr i8, ptr %337, i64 0
  %339 = load i8, ptr %338, align 1
  %340 = zext i8 %339 to i64
  store i64 %340, ptr %r1, align 4
  %341 = load i64, ptr %r1, align 4
  %342 = icmp eq i64 %341, 1
  br i1 %342, label %bb_inst_449, label %bb_inst_138

bb_inst_138:                                      ; preds = %bb_inst_136
  %343 = load i64, ptr %r1, align 4
  %344 = icmp eq i64 %343, 2
  br i1 %344, label %bb_inst_430, label %bb_inst_139

bb_inst_139:                                      ; preds = %bb_inst_138
  store i64 2, ptr %r8, align 4
  %345 = load i64, ptr %r1, align 4
  %346 = icmp ne i64 %345, 128
  br i1 %346, label %bb_inst_942, label %bb_inst_141

bb_inst_141:                                      ; preds = %bb_inst_139
  store i64 129, ptr %r1, align 4
  %347 = load i64, ptr %r1, align 4
  %348 = trunc i64 %347 to i8
  %349 = load ptr, ptr %r7, align 8
  %350 = getelementptr i8, ptr %349, i64 54
  store i8 %348, ptr %350, align 1
  store i64 64, ptr %r1, align 4
  %351 = load i64, ptr %r1, align 4
  %352 = trunc i64 %351 to i8
  %353 = load ptr, ptr %r7, align 8
  %354 = getelementptr i8, ptr %353, i64 21
  store i8 %352, ptr %354, align 1
  %355 = load ptr, ptr %r7, align 8
  %356 = getelementptr i8, ptr %355, i64 56
  %357 = load i16, ptr %356, align 2
  %358 = zext i16 %357 to i64
  store i64 %358, ptr %r1, align 4
  %359 = load i64, ptr %r1, align 4
  %360 = add i64 %359, -1
  store i64 %360, ptr %r1, align 4
  %361 = load i64, ptr %r1, align 4
  %362 = trunc i64 %361 to i16
  %363 = load ptr, ptr %r7, align 8
  %364 = getelementptr i8, ptr %363, i64 56
  store i16 %362, ptr %364, align 2
  %365 = load ptr, ptr %r7, align 8
  %366 = getelementptr i8, ptr %365, i64 34
  %367 = load i32, ptr %366, align 4
  %368 = zext i32 %367 to i64
  store i64 %368, ptr %r1, align 4
  %369 = load i64, ptr %r1, align 4
  %370 = shl i64 %369, 32
  store i64 %370, ptr %r1, align 4
  %371 = load ptr, ptr %r7, align 8
  %372 = getelementptr i8, ptr %371, i64 30
  %373 = load i32, ptr %372, align 4
  %374 = zext i32 %373 to i64
  store i64 %374, ptr %r2, align 4
  %375 = load i64, ptr %r1, align 4
  %376 = load i64, ptr %r2, align 4
  %377 = or i64 %375, %376
  store i64 %377, ptr %r1, align 4
  %378 = load i64, ptr %r1, align 4
  %379 = load ptr, ptr %r10, align 8
  %380 = getelementptr i8, ptr %379, i64 -8
  store i64 %378, ptr %380, align 4
  %381 = load ptr, ptr %r7, align 8
  %382 = getelementptr i8, ptr %381, i64 26
  %383 = load i32, ptr %382, align 4
  %384 = zext i32 %383 to i64
  store i64 %384, ptr %r1, align 4
  %385 = load i64, ptr %r1, align 4
  %386 = shl i64 %385, 32
  store i64 %386, ptr %r1, align 4
  %387 = load ptr, ptr %r7, align 8
  %388 = getelementptr i8, ptr %387, i64 22
  %389 = load i32, ptr %388, align 4
  %390 = zext i32 %389 to i64
  store i64 %390, ptr %r2, align 4
  %391 = load i64, ptr %r1, align 4
  %392 = load i64, ptr %r2, align 4
  %393 = or i64 %391, %392
  store i64 %393, ptr %r1, align 4
  %394 = load i64, ptr %r1, align 4
  %395 = load ptr, ptr %r10, align 8
  %396 = getelementptr i8, ptr %395, i64 -16
  store i64 %394, ptr %396, align 4
  %397 = load ptr, ptr %r7, align 8
  %398 = getelementptr i8, ptr %397, i64 38
  %399 = load i32, ptr %398, align 4
  %400 = zext i32 %399 to i64
  store i64 %400, ptr %r1, align 4
  %401 = load i64, ptr %r1, align 4
  %402 = trunc i64 %401 to i32
  %403 = load ptr, ptr %r7, align 8
  %404 = getelementptr i8, ptr %403, i64 22
  store i32 %402, ptr %404, align 4
  %405 = load ptr, ptr %r7, align 8
  %406 = getelementptr i8, ptr %405, i64 42
  %407 = load i32, ptr %406, align 4
  %408 = zext i32 %407 to i64
  store i64 %408, ptr %r1, align 4
  %409 = load i64, ptr %r1, align 4
  %410 = trunc i64 %409 to i32
  %411 = load ptr, ptr %r7, align 8
  %412 = getelementptr i8, ptr %411, i64 26
  store i32 %410, ptr %412, align 4
  %413 = load ptr, ptr %r7, align 8
  %414 = getelementptr i8, ptr %413, i64 46
  %415 = load i32, ptr %414, align 4
  %416 = zext i32 %415 to i64
  store i64 %416, ptr %r1, align 4
  %417 = load i64, ptr %r1, align 4
  %418 = trunc i64 %417 to i32
  %419 = load ptr, ptr %r7, align 8
  %420 = getelementptr i8, ptr %419, i64 30
  store i32 %418, ptr %420, align 4
  %421 = load ptr, ptr %r7, align 8
  %422 = getelementptr i8, ptr %421, i64 50
  %423 = load i32, ptr %422, align 4
  %424 = zext i32 %423 to i64
  store i64 %424, ptr %r1, align 4
  %425 = load i64, ptr %r1, align 4
  %426 = trunc i64 %425 to i32
  %427 = load ptr, ptr %r7, align 8
  %428 = getelementptr i8, ptr %427, i64 34
  store i32 %426, ptr %428, align 4
  %429 = load ptr, ptr %r10, align 8
  %430 = getelementptr i8, ptr %429, i64 -16
  %431 = load i64, ptr %430, align 4
  store i64 %431, ptr %r1, align 4
  %432 = load i64, ptr %r1, align 4
  %433 = trunc i64 %432 to i32
  %434 = load ptr, ptr %r7, align 8
  %435 = getelementptr i8, ptr %434, i64 38
  store i32 %433, ptr %435, align 4
  %436 = load i64, ptr %r1, align 4
  %437 = lshr i64 %436, 32
  store i64 %437, ptr %r1, align 4
  %438 = load i64, ptr %r1, align 4
  %439 = trunc i64 %438 to i32
  %440 = load ptr, ptr %r7, align 8
  %441 = getelementptr i8, ptr %440, i64 42
  store i32 %439, ptr %441, align 4
  %442 = load ptr, ptr %r10, align 8
  %443 = getelementptr i8, ptr %442, i64 -8
  %444 = load i64, ptr %443, align 4
  store i64 %444, ptr %r1, align 4
  %445 = load i64, ptr %r1, align 4
  %446 = trunc i64 %445 to i32
  %447 = load ptr, ptr %r7, align 8
  %448 = getelementptr i8, ptr %447, i64 46
  store i32 %446, ptr %448, align 4
  %449 = load i64, ptr %r1, align 4
  %450 = lshr i64 %449, 32
  store i64 %450, ptr %r1, align 4
  %451 = load i64, ptr %r1, align 4
  %452 = trunc i64 %451 to i32
  %453 = load ptr, ptr %r7, align 8
  %454 = getelementptr i8, ptr %453, i64 50
  store i32 %452, ptr %454, align 4
  br label %bb_inst_174

bb_inst_174:                                      ; preds = %bb_inst_141, %bb_inst_93
  %455 = load ptr, ptr %r7, align 8
  %456 = getelementptr i8, ptr %455, i64 11
  %457 = load i8, ptr %456, align 1
  %458 = zext i8 %457 to i64
  store i64 %458, ptr %r1, align 4
  %459 = load i64, ptr %r1, align 4
  %460 = shl i64 %459, 8
  store i64 %460, ptr %r1, align 4
  %461 = load ptr, ptr %r7, align 8
  %462 = getelementptr i8, ptr %461, i64 10
  %463 = load i8, ptr %462, align 1
  %464 = zext i8 %463 to i64
  store i64 %464, ptr %r2, align 4
  %465 = load i64, ptr %r1, align 4
  %466 = load i64, ptr %r2, align 4
  %467 = or i64 %465, %466
  store i64 %467, ptr %r1, align 4
  %468 = load i64, ptr %r1, align 4
  %469 = trunc i64 %468 to i16
  %470 = load ptr, ptr %r10, align 8
  %471 = getelementptr i8, ptr %470, i64 -116
  store i16 %469, ptr %471, align 2
  %472 = load ptr, ptr %r7, align 8
  %473 = getelementptr i8, ptr %472, i64 7
  %474 = load i8, ptr %473, align 1
  %475 = zext i8 %474 to i64
  store i64 %475, ptr %r1, align 4
  %476 = load i64, ptr %r1, align 4
  %477 = shl i64 %476, 8
  store i64 %477, ptr %r1, align 4
  %478 = load ptr, ptr %r7, align 8
  %479 = getelementptr i8, ptr %478, i64 6
  %480 = load i8, ptr %479, align 1
  %481 = zext i8 %480 to i64
  store i64 %481, ptr %r2, align 4
  %482 = load i64, ptr %r1, align 4
  %483 = load i64, ptr %r2, align 4
  %484 = or i64 %482, %483
  store i64 %484, ptr %r1, align 4
  %485 = load ptr, ptr %r7, align 8
  %486 = getelementptr i8, ptr %485, i64 9
  %487 = load i8, ptr %486, align 1
  %488 = zext i8 %487 to i64
  store i64 %488, ptr %r2, align 4
  %489 = load i64, ptr %r2, align 4
  %490 = shl i64 %489, 8
  store i64 %490, ptr %r2, align 4
  %491 = load ptr, ptr %r7, align 8
  %492 = getelementptr i8, ptr %491, i64 8
  %493 = load i8, ptr %492, align 1
  %494 = zext i8 %493 to i64
  store i64 %494, ptr %r3, align 4
  %495 = load i64, ptr %r2, align 4
  %496 = load i64, ptr %r3, align 4
  %497 = or i64 %495, %496
  store i64 %497, ptr %r2, align 4
  %498 = load i64, ptr %r2, align 4
  %499 = shl i64 %498, 16
  store i64 %499, ptr %r2, align 4
  %500 = load i64, ptr %r2, align 4
  %501 = load i64, ptr %r1, align 4
  %502 = or i64 %500, %501
  store i64 %502, ptr %r2, align 4
  %503 = load i64, ptr %r2, align 4
  %504 = trunc i64 %503 to i32
  %505 = load ptr, ptr %r10, align 8
  %506 = getelementptr i8, ptr %505, i64 -120
  store i32 %504, ptr %506, align 4
  %507 = load ptr, ptr %r7, align 8
  %508 = getelementptr i8, ptr %507, i64 2
  %509 = load i8, ptr %508, align 1
  %510 = zext i8 %509 to i64
  store i64 %510, ptr %r1, align 4
  %511 = load i64, ptr %r1, align 4
  %512 = trunc i64 %511 to i8
  %513 = load ptr, ptr %r7, align 8
  %514 = getelementptr i8, ptr %513, i64 8
  store i8 %512, ptr %514, align 1
  %515 = load ptr, ptr %r7, align 8
  %516 = getelementptr i8, ptr %515, i64 3
  %517 = load i8, ptr %516, align 1
  %518 = zext i8 %517 to i64
  store i64 %518, ptr %r1, align 4
  %519 = load i64, ptr %r1, align 4
  %520 = trunc i64 %519 to i8
  %521 = load ptr, ptr %r7, align 8
  %522 = getelementptr i8, ptr %521, i64 9
  store i8 %520, ptr %522, align 1
  %523 = load ptr, ptr %r7, align 8
  %524 = getelementptr i8, ptr %523, i64 0
  %525 = load i8, ptr %524, align 1
  %526 = zext i8 %525 to i64
  store i64 %526, ptr %r1, align 4
  %527 = load i64, ptr %r1, align 4
  %528 = trunc i64 %527 to i8
  %529 = load ptr, ptr %r7, align 8
  %530 = getelementptr i8, ptr %529, i64 6
  store i8 %528, ptr %530, align 1
  %531 = load ptr, ptr %r7, align 8
  %532 = getelementptr i8, ptr %531, i64 1
  %533 = load i8, ptr %532, align 1
  %534 = zext i8 %533 to i64
  store i64 %534, ptr %r1, align 4
  %535 = load i64, ptr %r1, align 4
  %536 = trunc i64 %535 to i8
  %537 = load ptr, ptr %r7, align 8
  %538 = getelementptr i8, ptr %537, i64 7
  store i8 %536, ptr %538, align 1
  %539 = load ptr, ptr %r7, align 8
  %540 = getelementptr i8, ptr %539, i64 4
  %541 = load i8, ptr %540, align 1
  %542 = zext i8 %541 to i64
  store i64 %542, ptr %r1, align 4
  %543 = load i64, ptr %r1, align 4
  %544 = trunc i64 %543 to i8
  %545 = load ptr, ptr %r7, align 8
  %546 = getelementptr i8, ptr %545, i64 10
  store i8 %544, ptr %546, align 1
  %547 = load ptr, ptr %r7, align 8
  %548 = getelementptr i8, ptr %547, i64 5
  %549 = load i8, ptr %548, align 1
  %550 = zext i8 %549 to i64
  store i64 %550, ptr %r1, align 4
  %551 = load i64, ptr %r1, align 4
  %552 = trunc i64 %551 to i8
  %553 = load ptr, ptr %r7, align 8
  %554 = getelementptr i8, ptr %553, i64 11
  store i8 %552, ptr %554, align 1
  %555 = load ptr, ptr %r10, align 8
  %556 = getelementptr i8, ptr %555, i64 -120
  %557 = load i32, ptr %556, align 4
  %558 = zext i32 %557 to i64
  store i64 %558, ptr %r1, align 4
  %559 = load i64, ptr %r1, align 4
  store i64 %559, ptr %r2, align 4
  %560 = load i64, ptr %r2, align 4
  %561 = lshr i64 %560, 16
  store i64 %561, ptr %r2, align 4
  %562 = load i64, ptr %r2, align 4
  %563 = trunc i64 %562 to i8
  %564 = load ptr, ptr %r7, align 8
  %565 = getelementptr i8, ptr %564, i64 2
  store i8 %563, ptr %565, align 1
  %566 = load i64, ptr %r1, align 4
  store i64 %566, ptr %r2, align 4
  %567 = load i64, ptr %r2, align 4
  %568 = lshr i64 %567, 24
  store i64 %568, ptr %r2, align 4
  %569 = load i64, ptr %r2, align 4
  %570 = trunc i64 %569 to i8
  %571 = load ptr, ptr %r7, align 8
  %572 = getelementptr i8, ptr %571, i64 3
  store i8 %570, ptr %572, align 1
  %573 = load i64, ptr %r1, align 4
  %574 = trunc i64 %573 to i8
  %575 = load ptr, ptr %r7, align 8
  %576 = getelementptr i8, ptr %575, i64 0
  store i8 %574, ptr %576, align 1
  %577 = load i64, ptr %r1, align 4
  %578 = lshr i64 %577, 8
  store i64 %578, ptr %r1, align 4
  %579 = load i64, ptr %r1, align 4
  %580 = trunc i64 %579 to i8
  %581 = load ptr, ptr %r7, align 8
  %582 = getelementptr i8, ptr %581, i64 1
  store i8 %580, ptr %582, align 1
  %583 = load ptr, ptr %r10, align 8
  %584 = getelementptr i8, ptr %583, i64 -116
  %585 = load i16, ptr %584, align 2
  %586 = zext i16 %585 to i64
  store i64 %586, ptr %r1, align 4
  %587 = load i64, ptr %r1, align 4
  %588 = trunc i64 %587 to i8
  %589 = load ptr, ptr %r7, align 8
  %590 = getelementptr i8, ptr %589, i64 4
  store i8 %588, ptr %590, align 1
  %591 = load i64, ptr %r1, align 4
  %592 = lshr i64 %591, 8
  store i64 %592, ptr %r1, align 4
  %593 = load i64, ptr %r1, align 4
  %594 = trunc i64 %593 to i8
  %595 = load ptr, ptr %r7, align 8
  %596 = getelementptr i8, ptr %595, i64 5
  store i8 %594, ptr %596, align 1
  br label %bb_inst_216

bb_inst_216:                                      ; preds = %bb_inst_174, %bb_inst_1912, %bb_inst_1799
  store i64 3, ptr %r8, align 4
  br label %bb_inst_942

bb_inst_218:                                      ; preds = %bb_inst_131
  %597 = load ptr, ptr %r7, align 8
  %598 = getelementptr i8, ptr %597, i64 34
  %599 = load i32, ptr %598, align 4
  %600 = zext i32 %599 to i64
  store i64 %600, ptr %r2, align 4
  %601 = load i64, ptr %r2, align 4
  %602 = shl i64 %601, 32
  store i64 %602, ptr %r2, align 4
  %603 = load ptr, ptr %r7, align 8
  %604 = getelementptr i8, ptr %603, i64 30
  %605 = load i32, ptr %604, align 4
  %606 = zext i32 %605 to i64
  store i64 %606, ptr %r3, align 4
  %607 = load i64, ptr %r2, align 4
  %608 = load i64, ptr %r3, align 4
  %609 = or i64 %607, %608
  store i64 %609, ptr %r2, align 4
  %610 = load i64, ptr %r2, align 4
  %611 = load ptr, ptr %r10, align 8
  %612 = getelementptr i8, ptr %611, i64 -64
  store i64 %610, ptr %612, align 4
  %613 = load ptr, ptr %r7, align 8
  %614 = getelementptr i8, ptr %613, i64 26
  %615 = load i32, ptr %614, align 4
  %616 = zext i32 %615 to i64
  store i64 %616, ptr %r2, align 4
  %617 = load i64, ptr %r2, align 4
  %618 = shl i64 %617, 32
  store i64 %618, ptr %r2, align 4
  %619 = load ptr, ptr %r7, align 8
  %620 = getelementptr i8, ptr %619, i64 22
  %621 = load i32, ptr %620, align 4
  %622 = zext i32 %621 to i64
  store i64 %622, ptr %r3, align 4
  %623 = load i64, ptr %r2, align 4
  %624 = load i64, ptr %r3, align 4
  %625 = or i64 %623, %624
  store i64 %625, ptr %r2, align 4
  %626 = load i64, ptr %r2, align 4
  %627 = load ptr, ptr %r10, align 8
  %628 = getelementptr i8, ptr %627, i64 -72
  store i64 %626, ptr %628, align 4
  %629 = load ptr, ptr %r7, align 8
  %630 = getelementptr i8, ptr %629, i64 50
  %631 = load i32, ptr %630, align 4
  %632 = zext i32 %631 to i64
  store i64 %632, ptr %r2, align 4
  %633 = load i64, ptr %r2, align 4
  %634 = shl i64 %633, 32
  store i64 %634, ptr %r2, align 4
  %635 = load ptr, ptr %r7, align 8
  %636 = getelementptr i8, ptr %635, i64 46
  %637 = load i32, ptr %636, align 4
  %638 = zext i32 %637 to i64
  store i64 %638, ptr %r3, align 4
  %639 = load i64, ptr %r2, align 4
  %640 = load i64, ptr %r3, align 4
  %641 = or i64 %639, %640
  store i64 %641, ptr %r2, align 4
  %642 = load i64, ptr %r2, align 4
  %643 = load ptr, ptr %r10, align 8
  %644 = getelementptr i8, ptr %643, i64 -48
  store i64 %642, ptr %644, align 4
  %645 = load ptr, ptr %r7, align 8
  %646 = getelementptr i8, ptr %645, i64 38
  %647 = load i32, ptr %646, align 4
  %648 = zext i32 %647 to i64
  store i64 %648, ptr %r2, align 4
  %649 = load ptr, ptr %r7, align 8
  %650 = getelementptr i8, ptr %649, i64 42
  %651 = load i32, ptr %650, align 4
  %652 = zext i32 %651 to i64
  store i64 %652, ptr %r3, align 4
  %653 = load i64, ptr %r3, align 4
  %654 = shl i64 %653, 32
  store i64 %654, ptr %r3, align 4
  %655 = load i64, ptr %r3, align 4
  %656 = load i64, ptr %r2, align 4
  %657 = or i64 %655, %656
  store i64 %657, ptr %r3, align 4
  %658 = load i64, ptr %r3, align 4
  %659 = load ptr, ptr %r10, align 8
  %660 = getelementptr i8, ptr %659, i64 -56
  store i64 %658, ptr %660, align 4
  store i64 0, ptr %r2, align 4
  br label %bb_inst_239

bb_inst_239:                                      ; preds = %bb_inst_218, %bb_inst_453
  %661 = load i64, ptr %r1, align 4
  store i64 %661, ptr %r3, align 4
  %662 = load i64, ptr %r3, align 4
  %663 = icmp eq i64 %662, 17
  br i1 %663, label %bb_inst_267, label %bb_inst_241

bb_inst_241:                                      ; preds = %bb_inst_239
  store i64 2, ptr %r8, align 4
  %664 = load i64, ptr %r3, align 4
  %665 = icmp ne i64 %664, 6
  br i1 %665, label %bb_inst_942, label %bb_inst_243

bb_inst_243:                                      ; preds = %bb_inst_241
  %666 = load i64, ptr %r2, align 4
  store i64 %666, ptr %r4, align 4
  %667 = load i64, ptr %r4, align 4
  %668 = and i64 %667, 1
  store i64 %668, ptr %r4, align 4
  store i64 54, ptr %r5, align 4
  %669 = load i64, ptr %r4, align 4
  %670 = icmp eq i64 %669, 0
  br i1 %670, label %bb_inst_248, label %bb_inst_247

bb_inst_247:                                      ; preds = %bb_inst_243
  store i64 102, ptr %r5, align 4
  br label %bb_inst_248

bb_inst_248:                                      ; preds = %bb_inst_247, %bb_inst_243
  %671 = load i64, ptr %r7, align 4
  store i64 %671, ptr %r3, align 4
  %672 = load i64, ptr %r3, align 4
  %673 = load i64, ptr %r5, align 4
  %674 = add i64 %672, %673
  store i64 %674, ptr %r3, align 4
  %675 = load i64, ptr %r3, align 4
  store i64 %675, ptr %r5, align 4
  %676 = load i64, ptr %r5, align 4
  %677 = add i64 %676, 20
  store i64 %677, ptr %r5, align 4
  store i64 1, ptr %r8, align 4
  %678 = load i64, ptr %r9, align 4
  %679 = load i64, ptr %r5, align 4
  %680 = icmp ugt i64 %679, %678
  br i1 %680, label %bb_inst_942, label %bb_inst_254

bb_inst_254:                                      ; preds = %bb_inst_248
  %681 = load ptr, ptr %r3, align 8
  %682 = getelementptr i8, ptr %681, i64 12
  %683 = load i16, ptr %682, align 2
  %684 = zext i16 %683 to i64
  store i64 %684, ptr %r5, align 4
  %685 = load i64, ptr %r5, align 4
  %686 = and i64 %685, 512
  store i64 %686, ptr %r5, align 4
  %687 = load i64, ptr %r5, align 4
  %688 = icmp eq i64 %687, 0
  br i1 %688, label %bb_inst_259, label %bb_inst_257

bb_inst_257:                                      ; preds = %bb_inst_254
  %689 = load i64, ptr %r2, align 4
  %690 = or i64 %689, 2
  store i64 %690, ptr %r2, align 4
  %691 = load i64, ptr %r2, align 4
  %692 = trunc i64 %691 to i8
  %693 = load ptr, ptr %r10, align 8
  %694 = getelementptr i8, ptr %693, i64 -28
  store i8 %692, ptr %694, align 1
  br label %bb_inst_259

bb_inst_259:                                      ; preds = %bb_inst_257, %bb_inst_254
  %695 = load i64, ptr %r0, align 4
  %696 = load ptr, ptr %r10, align 8
  %697 = getelementptr i8, ptr %696, i64 -128
  store i64 %695, ptr %697, align 4
  %698 = load i64, ptr %r4, align 4
  %699 = icmp ne i64 %698, 0
  br i1 %699, label %bb_inst_314, label %bb_inst_261

bb_inst_261:                                      ; preds = %bb_inst_279, %bb_inst_259
  %700 = load ptr, ptr %r3, align 8
  %701 = getelementptr i8, ptr %700, i64 0
  %702 = load i16, ptr %701, align 2
  %703 = zext i16 %702 to i64
  store i64 %703, ptr %r2, align 4
  %704 = load i64, ptr %r2, align 4
  %705 = trunc i64 %704 to i16
  %706 = load ptr, ptr %r10, align 8
  %707 = getelementptr i8, ptr %706, i64 -40
  store i16 %705, ptr %707, align 2
  %708 = load i64, ptr %r10, align 4
  store i64 %708, ptr %r4, align 4
  %709 = load i64, ptr %r4, align 4
  %710 = add i64 %709, -40
  store i64 %710, ptr %r4, align 4
  %711 = load i64, ptr %r3, align 4
  %712 = add i64 %711, 2
  store i64 %712, ptr %r3, align 4
  br label %bb_inst_318

bb_inst_267:                                      ; preds = %bb_inst_239
  %713 = load i64, ptr %r2, align 4
  %714 = and i64 %713, 1
  store i64 %714, ptr %r2, align 4
  store i64 54, ptr %r4, align 4
  %715 = load i64, ptr %r2, align 4
  %716 = icmp eq i64 %715, 0
  br i1 %716, label %bb_inst_271, label %bb_inst_270

bb_inst_270:                                      ; preds = %bb_inst_267
  store i64 102, ptr %r4, align 4
  br label %bb_inst_271

bb_inst_271:                                      ; preds = %bb_inst_270, %bb_inst_267
  %717 = load i64, ptr %r7, align 4
  store i64 %717, ptr %r3, align 4
  %718 = load i64, ptr %r3, align 4
  %719 = load i64, ptr %r4, align 4
  %720 = add i64 %718, %719
  store i64 %720, ptr %r3, align 4
  %721 = load i64, ptr %r3, align 4
  store i64 %721, ptr %r4, align 4
  %722 = load i64, ptr %r4, align 4
  %723 = add i64 %722, 8
  store i64 %723, ptr %r4, align 4
  store i64 1, ptr %r8, align 4
  %724 = load i64, ptr %r9, align 4
  %725 = load i64, ptr %r4, align 4
  %726 = icmp ugt i64 %725, %724
  br i1 %726, label %bb_inst_942, label %bb_inst_277

bb_inst_277:                                      ; preds = %bb_inst_271
  %727 = load i64, ptr %r0, align 4
  %728 = load ptr, ptr %r10, align 8
  %729 = getelementptr i8, ptr %728, i64 -128
  store i64 %727, ptr %729, align 4
  %730 = load i64, ptr %r2, align 4
  %731 = icmp ne i64 %730, 0
  br i1 %731, label %bb_inst_314, label %bb_inst_279

bb_inst_279:                                      ; preds = %bb_inst_277
  br label %bb_inst_261

bb_inst_280:                                      ; preds = %bb_inst_42
  %732 = load ptr, ptr %r7, align 8
  %733 = getelementptr i8, ptr %732, i64 26
  %734 = load i32, ptr %733, align 4
  %735 = zext i32 %734 to i64
  store i64 %735, ptr %r2, align 4
  %736 = load i64, ptr %r2, align 4
  %737 = trunc i64 %736 to i32
  %738 = load ptr, ptr %r10, align 8
  %739 = getelementptr i8, ptr %738, i64 -72
  store i32 %737, ptr %739, align 4
  store i64 0, ptr %r3, align 4
  %740 = load i64, ptr %r7, align 4
  store i64 %740, ptr %r2, align 4
  %741 = load i64, ptr %r2, align 4
  %742 = add i64 %741, 30
  store i64 %742, ptr %r2, align 4
  br label %bb_inst_285

bb_inst_285:                                      ; preds = %bb_inst_280, %bb_inst_526
  %743 = load ptr, ptr %r2, align 8
  %744 = getelementptr i8, ptr %743, i64 0
  %745 = load i32, ptr %744, align 4
  %746 = zext i32 %745 to i64
  store i64 %746, ptr %r2, align 4
  %747 = load i64, ptr %r2, align 4
  %748 = trunc i64 %747 to i32
  %749 = load ptr, ptr %r10, align 8
  %750 = getelementptr i8, ptr %749, i64 -56
  store i32 %748, ptr %750, align 4
  %751 = load i64, ptr %r1, align 4
  store i64 %751, ptr %r4, align 4
  %752 = load i64, ptr %r4, align 4
  %753 = icmp eq i64 %752, 17
  br i1 %753, label %bb_inst_479, label %bb_inst_289

bb_inst_289:                                      ; preds = %bb_inst_285
  store i64 2, ptr %r8, align 4
  %754 = load i64, ptr %r4, align 4
  %755 = icmp ne i64 %754, 6
  br i1 %755, label %bb_inst_942, label %bb_inst_291

bb_inst_291:                                      ; preds = %bb_inst_289
  %756 = load i64, ptr %r3, align 4
  store i64 %756, ptr %r5, align 4
  %757 = load i64, ptr %r5, align 4
  %758 = and i64 %757, 1
  store i64 %758, ptr %r5, align 4
  store i64 34, ptr %r0, align 4
  %759 = load i64, ptr %r5, align 4
  %760 = icmp eq i64 %759, 0
  br i1 %760, label %bb_inst_296, label %bb_inst_295

bb_inst_295:                                      ; preds = %bb_inst_291
  store i64 62, ptr %r0, align 4
  br label %bb_inst_296

bb_inst_296:                                      ; preds = %bb_inst_295, %bb_inst_291
  %761 = load i64, ptr %r7, align 4
  store i64 %761, ptr %r4, align 4
  %762 = load i64, ptr %r4, align 4
  %763 = load i64, ptr %r0, align 4
  %764 = add i64 %762, %763
  store i64 %764, ptr %r4, align 4
  %765 = load i64, ptr %r4, align 4
  store i64 %765, ptr %r0, align 4
  %766 = load i64, ptr %r0, align 4
  %767 = add i64 %766, 20
  store i64 %767, ptr %r0, align 4
  store i64 1, ptr %r8, align 4
  %768 = load i64, ptr %r9, align 4
  %769 = load i64, ptr %r0, align 4
  %770 = icmp ugt i64 %769, %768
  br i1 %770, label %bb_inst_942, label %bb_inst_302

bb_inst_302:                                      ; preds = %bb_inst_296
  %771 = load ptr, ptr %r4, align 8
  %772 = getelementptr i8, ptr %771, i64 12
  %773 = load i16, ptr %772, align 2
  %774 = zext i16 %773 to i64
  store i64 %774, ptr %r0, align 4
  %775 = load i64, ptr %r0, align 4
  %776 = and i64 %775, 512
  store i64 %776, ptr %r0, align 4
  %777 = load i64, ptr %r0, align 4
  %778 = icmp eq i64 %777, 0
  br i1 %778, label %bb_inst_307, label %bb_inst_305

bb_inst_305:                                      ; preds = %bb_inst_302
  %779 = load i64, ptr %r3, align 4
  %780 = or i64 %779, 2
  store i64 %780, ptr %r3, align 4
  %781 = load i64, ptr %r3, align 4
  %782 = trunc i64 %781 to i8
  %783 = load ptr, ptr %r10, align 8
  %784 = getelementptr i8, ptr %783, i64 -28
  store i8 %782, ptr %784, align 1
  br label %bb_inst_307

bb_inst_307:                                      ; preds = %bb_inst_305, %bb_inst_302
  %785 = load i64, ptr %r10, align 4
  store i64 %785, ptr %r0, align 4
  %786 = load i64, ptr %r0, align 4
  %787 = add i64 %786, -40
  store i64 %787, ptr %r0, align 4
  %788 = load i64, ptr %r5, align 4
  %789 = icmp ne i64 %788, 0
  br i1 %789, label %bb_inst_536, label %bb_inst_310

bb_inst_310:                                      ; preds = %bb_inst_307
  %790 = load ptr, ptr %r4, align 8
  %791 = getelementptr i8, ptr %790, i64 0
  %792 = load i16, ptr %791, align 2
  %793 = zext i16 %792 to i64
  store i64 %793, ptr %r3, align 4
  %794 = load i64, ptr %r3, align 4
  %795 = trunc i64 %794 to i16
  %796 = load ptr, ptr %r10, align 8
  %797 = getelementptr i8, ptr %796, i64 -40
  store i16 %795, ptr %797, align 2
  %798 = load i64, ptr %r4, align 4
  %799 = add i64 %798, 2
  store i64 %799, ptr %r4, align 4
  br label %bb_inst_543

bb_inst_314:                                      ; preds = %bb_inst_277, %bb_inst_259
  %800 = load ptr, ptr %r3, align 8
  %801 = getelementptr i8, ptr %800, i64 2
  %802 = load i16, ptr %801, align 2
  %803 = zext i16 %802 to i64
  store i64 %803, ptr %r2, align 4
  %804 = load i64, ptr %r2, align 4
  %805 = trunc i64 %804 to i16
  %806 = load ptr, ptr %r10, align 8
  %807 = getelementptr i8, ptr %806, i64 -40
  store i16 %805, ptr %807, align 2
  %808 = load i64, ptr %r10, align 4
  store i64 %808, ptr %r4, align 4
  %809 = load i64, ptr %r4, align 4
  %810 = add i64 %809, -40
  store i64 %810, ptr %r4, align 4
  br label %bb_inst_318

bb_inst_318:                                      ; preds = %bb_inst_314, %bb_inst_261
  %811 = load ptr, ptr %r3, align 8
  %812 = getelementptr i8, ptr %811, i64 0
  %813 = load i16, ptr %812, align 2
  %814 = zext i16 %813 to i64
  store i64 %814, ptr %r2, align 4
  %815 = load i64, ptr %r4, align 4
  %816 = load ptr, ptr %r10, align 8
  %817 = getelementptr i8, ptr %816, i64 -136
  store i64 %815, ptr %817, align 4
  %818 = load i64, ptr %r2, align 4
  %819 = trunc i64 %818 to i16
  %820 = load ptr, ptr %r4, align 8
  %821 = getelementptr i8, ptr %820, i64 2
  store i16 %819, ptr %821, align 2
  %822 = load i64, ptr %r1, align 4
  %823 = trunc i64 %822 to i8
  %824 = load ptr, ptr %r10, align 8
  %825 = getelementptr i8, ptr %824, i64 -78
  store i8 %823, ptr %825, align 1
  %826 = load i64, ptr %r2, align 4
  %827 = trunc i64 %826 to i16
  %828 = load ptr, ptr %r10, align 8
  %829 = getelementptr i8, ptr %828, i64 -80
  store i16 %827, ptr %829, align 2
  %830 = load ptr, ptr %r10, align 8
  %831 = getelementptr i8, ptr %830, i64 -48
  %832 = load i64, ptr %831, align 4
  store i64 %832, ptr %r1, align 4
  %833 = load i64, ptr %r1, align 4
  %834 = load ptr, ptr %r10, align 8
  %835 = getelementptr i8, ptr %834, i64 -88
  store i64 %833, ptr %835, align 4
  %836 = load ptr, ptr %r10, align 8
  %837 = getelementptr i8, ptr %836, i64 -56
  %838 = load i64, ptr %837, align 4
  store i64 %838, ptr %r1, align 4
  %839 = load i64, ptr %r1, align 4
  %840 = load ptr, ptr %r10, align 8
  %841 = getelementptr i8, ptr %840, i64 -96
  store i64 %839, ptr %841, align 4
  %842 = load i64, ptr %r10, align 4
  store i64 %842, ptr %r2, align 4
  %843 = load i64, ptr %r2, align 4
  %844 = add i64 %843, -96
  store i64 %844, ptr %r2, align 4
  %845 = call i64 @__lddw_helper_map_by_fd(i32 5)
  store i64 %845, ptr %r1, align 4
  %846 = load i64, ptr %r1, align 4
  %847 = load i64, ptr %r2, align 4
  %848 = load i64, ptr %r3, align 4
  %849 = load i64, ptr %r4, align 4
  %850 = load i64, ptr %r5, align 4
  %851 = call i64 @_bpf_helper_ext_0001(i64 %846, i64 %847, i64 %848, i64 %849, i64 %850)
  store i64 %851, ptr %r0, align 4
  br label %bb_inst_332

bb_inst_332:                                      ; preds = %bb_inst_318
  %852 = load i64, ptr %r0, align 4
  %853 = icmp ne i64 %852, 0
  br i1 %853, label %bb_inst_350, label %bb_inst_333

bb_inst_333:                                      ; preds = %bb_inst_332
  store i64 0, ptr %r1, align 4
  %854 = load i64, ptr %r1, align 4
  %855 = trunc i64 %854 to i16
  %856 = load ptr, ptr %r10, align 8
  %857 = getelementptr i8, ptr %856, i64 -80
  store i16 %855, ptr %857, align 2
  %858 = load i64, ptr %r10, align 4
  store i64 %858, ptr %r2, align 4
  %859 = load i64, ptr %r2, align 4
  %860 = add i64 %859, -96
  store i64 %860, ptr %r2, align 4
  %861 = call i64 @__lddw_helper_map_by_fd(i32 5)
  store i64 %861, ptr %r1, align 4
  %862 = load i64, ptr %r1, align 4
  %863 = load i64, ptr %r2, align 4
  %864 = load i64, ptr %r3, align 4
  %865 = load i64, ptr %r4, align 4
  %866 = load i64, ptr %r5, align 4
  %867 = call i64 @_bpf_helper_ext_0001(i64 %862, i64 %863, i64 %864, i64 %865, i64 %866)
  store i64 %867, ptr %r0, align 4
  br label %bb_inst_340

bb_inst_340:                                      ; preds = %bb_inst_333
  store i64 2, ptr %r8, align 4
  %868 = load ptr, ptr %r10, align 8
  %869 = getelementptr i8, ptr %868, i64 -128
  %870 = load i64, ptr %869, align 4
  store i64 %870, ptr %r1, align 4
  %871 = load i64, ptr %r0, align 4
  %872 = icmp eq i64 %871, 0
  br i1 %872, label %bb_inst_942, label %bb_inst_343

bb_inst_343:                                      ; preds = %bb_inst_340
  %873 = load i64, ptr %r1, align 4
  %874 = load ptr, ptr %r10, align 8
  %875 = getelementptr i8, ptr %874, i64 -128
  store i64 %873, ptr %875, align 4
  %876 = load ptr, ptr %r0, align 8
  %877 = getelementptr i8, ptr %876, i64 0
  %878 = load i32, ptr %877, align 4
  %879 = zext i32 %878 to i64
  store i64 %879, ptr %r1, align 4
  %880 = load i64, ptr %r1, align 4
  %881 = and i64 %880, 136
  store i64 %881, ptr %r1, align 4
  %882 = load i64, ptr %r1, align 4
  %883 = icmp ne i64 %882, 0
  br i1 %883, label %bb_inst_350, label %bb_inst_347

bb_inst_347:                                      ; preds = %bb_inst_343
  store i64 0, ptr %r1, align 4
  %884 = load ptr, ptr %r10, align 8
  %885 = getelementptr i8, ptr %884, i64 -136
  %886 = load i64, ptr %885, align 4
  store i64 %886, ptr %r2, align 4
  %887 = load i64, ptr %r1, align 4
  %888 = trunc i64 %887 to i16
  %889 = load ptr, ptr %r2, align 8
  %890 = getelementptr i8, ptr %889, i64 2
  store i16 %888, ptr %890, align 2
  br label %bb_inst_350

bb_inst_350:                                      ; preds = %bb_inst_347, %bb_inst_343, %bb_inst_332
  %891 = load i64, ptr %r9, align 4
  store i64 %891, ptr %r1, align 4
  %892 = load i64, ptr %r1, align 4
  %893 = load i64, ptr %r7, align 4
  %894 = sub i64 %892, %893
  store i64 %894, ptr %r1, align 4
  store i64 1, ptr %r8, align 4
  %895 = load ptr, ptr %r10, align 8
  %896 = getelementptr i8, ptr %895, i64 -128
  %897 = load i64, ptr %896, align 4
  store i64 %897, ptr %r2, align 4
  %898 = load i64, ptr %r1, align 4
  %899 = icmp sgt i64 %898, 1514
  br i1 %899, label %bb_inst_942, label %bb_inst_355

bb_inst_355:                                      ; preds = %bb_inst_350
  %900 = load i64, ptr %r0, align 4
  %901 = load ptr, ptr %r10, align 8
  %902 = getelementptr i8, ptr %901, i64 -144
  store i64 %900, ptr %902, align 4
  %903 = load i64, ptr %r2, align 4
  %904 = load ptr, ptr %r10, align 8
  %905 = getelementptr i8, ptr %904, i64 -128
  store i64 %903, ptr %905, align 4
  store i64 512, ptr %r1, align 4
  %906 = load i64, ptr %r1, align 4
  %907 = trunc i64 %906 to i32
  %908 = load ptr, ptr %r10, align 8
  %909 = getelementptr i8, ptr %908, i64 -108
  store i32 %907, ptr %909, align 4
  %910 = load i64, ptr %r10, align 4
  store i64 %910, ptr %r2, align 4
  %911 = load i64, ptr %r2, align 4
  %912 = add i64 %911, -108
  store i64 %912, ptr %r2, align 4
  %913 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %913, ptr %r1, align 4
  %914 = load i64, ptr %r1, align 4
  %915 = load i64, ptr %r2, align 4
  %916 = load i64, ptr %r3, align 4
  %917 = load i64, ptr %r4, align 4
  %918 = load i64, ptr %r5, align 4
  %919 = call i64 @_bpf_helper_ext_0001(i64 %914, i64 %915, i64 %916, i64 %917, i64 %918)
  store i64 %919, ptr %r0, align 4
  br label %bb_inst_364

bb_inst_364:                                      ; preds = %bb_inst_355
  store i64 1, ptr %r8, align 4
  %920 = load i64, ptr %r0, align 4
  %921 = icmp eq i64 %920, 0
  br i1 %921, label %bb_inst_942, label %bb_inst_366

bb_inst_366:                                      ; preds = %bb_inst_364
  %922 = load ptr, ptr %r0, align 8
  %923 = getelementptr i8, ptr %922, i64 0
  %924 = load i64, ptr %923, align 4
  store i64 %924, ptr %r1, align 4
  %925 = load i64, ptr %r1, align 4
  %926 = add i64 %925, 1
  store i64 %926, ptr %r1, align 4
  %927 = load i64, ptr %r0, align 4
  %928 = load ptr, ptr %r10, align 8
  %929 = getelementptr i8, ptr %928, i64 -160
  store i64 %927, ptr %929, align 4
  %930 = load i64, ptr %r1, align 4
  %931 = load ptr, ptr %r0, align 8
  %932 = getelementptr i8, ptr %931, i64 0
  store i64 %930, ptr %932, align 4
  %933 = load ptr, ptr %r10, align 8
  %934 = getelementptr i8, ptr %933, i64 -144
  %935 = load i64, ptr %934, align 4
  store i64 %935, ptr %r8, align 4
  %936 = load ptr, ptr %r8, align 8
  %937 = getelementptr i8, ptr %936, i64 0
  %938 = load i32, ptr %937, align 4
  %939 = zext i32 %938 to i64
  store i64 %939, ptr %r1, align 4
  %940 = load i64, ptr %r1, align 4
  %941 = and i64 %940, 1
  store i64 %941, ptr %r1, align 4
  %942 = load i64, ptr %r1, align 4
  %943 = icmp eq i64 %942, 0
  br i1 %943, label %bb_inst_376, label %bb_inst_374

bb_inst_374:                                      ; preds = %bb_inst_366
  store i64 0, ptr %r1, align 4
  %944 = load i64, ptr %r1, align 4
  %945 = trunc i64 %944 to i16
  %946 = load ptr, ptr %r10, align 8
  %947 = getelementptr i8, ptr %946, i64 -40
  store i16 %945, ptr %947, align 2
  br label %bb_inst_376

bb_inst_376:                                      ; preds = %bb_inst_374, %bb_inst_366
  %948 = load ptr, ptr %r8, align 8
  %949 = getelementptr i8, ptr %948, i64 4
  %950 = load i32, ptr %949, align 4
  %951 = zext i32 %950 to i64
  store i64 %951, ptr %r1, align 4
  %952 = load i64, ptr %r1, align 4
  %953 = trunc i64 %952 to i32
  %954 = load ptr, ptr %r10, align 8
  %955 = getelementptr i8, ptr %954, i64 -100
  store i32 %953, ptr %955, align 4
  %956 = load i64, ptr %r1, align 4
  %957 = load i64, ptr %r2, align 4
  %958 = load i64, ptr %r3, align 4
  %959 = load i64, ptr %r4, align 4
  %960 = load i64, ptr %r5, align 4
  %961 = call i64 @_bpf_helper_ext_0008(i64 %956, i64 %957, i64 %958, i64 %959, i64 %960)
  store i64 %961, ptr %r0, align 4
  br label %bb_inst_379

bb_inst_379:                                      ; preds = %bb_inst_376
  %962 = load i64, ptr %r0, align 4
  %963 = trunc i64 %962 to i32
  %964 = load ptr, ptr %r10, align 8
  %965 = getelementptr i8, ptr %964, i64 -112
  store i32 %963, ptr %965, align 4
  %966 = load i64, ptr %r10, align 4
  store i64 %966, ptr %r2, align 4
  %967 = load i64, ptr %r2, align 4
  %968 = add i64 %967, -112
  store i64 %968, ptr %r2, align 4
  %969 = call i64 @__lddw_helper_map_by_fd(i32 8)
  store i64 %969, ptr %r1, align 4
  %970 = load i64, ptr %r1, align 4
  %971 = load i64, ptr %r2, align 4
  %972 = load i64, ptr %r3, align 4
  %973 = load i64, ptr %r4, align 4
  %974 = load i64, ptr %r5, align 4
  %975 = call i64 @_bpf_helper_ext_0001(i64 %970, i64 %971, i64 %972, i64 %973, i64 %974)
  store i64 %975, ptr %r0, align 4
  br label %bb_inst_385

bb_inst_385:                                      ; preds = %bb_inst_379
  %976 = load i64, ptr %r0, align 4
  store i64 %976, ptr %r3, align 4
  %977 = load i64, ptr %r3, align 4
  %978 = icmp ne i64 %977, 0
  br i1 %978, label %bb_inst_401, label %bb_inst_387

bb_inst_387:                                      ; preds = %bb_inst_385
  store i64 515, ptr %r1, align 4
  %979 = load i64, ptr %r1, align 4
  %980 = trunc i64 %979 to i32
  %981 = load ptr, ptr %r10, align 8
  %982 = getelementptr i8, ptr %981, i64 -16
  store i32 %980, ptr %982, align 4
  %983 = load i64, ptr %r10, align 4
  store i64 %983, ptr %r2, align 4
  %984 = load i64, ptr %r2, align 4
  %985 = add i64 %984, -16
  store i64 %985, ptr %r2, align 4
  %986 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %986, ptr %r1, align 4
  %987 = load i64, ptr %r1, align 4
  %988 = load i64, ptr %r2, align 4
  %989 = load i64, ptr %r3, align 4
  %990 = load i64, ptr %r4, align 4
  %991 = load i64, ptr %r5, align 4
  %992 = call i64 @_bpf_helper_ext_0001(i64 %987, i64 %988, i64 %989, i64 %990, i64 %991)
  store i64 %992, ptr %r0, align 4
  br label %bb_inst_394

bb_inst_394:                                      ; preds = %bb_inst_387
  %993 = load i64, ptr %r0, align 4
  %994 = icmp eq i64 %993, 0
  br i1 %994, label %bb_inst_941, label %bb_inst_395

bb_inst_395:                                      ; preds = %bb_inst_394
  %995 = load ptr, ptr %r0, align 8
  %996 = getelementptr i8, ptr %995, i64 0
  %997 = load i64, ptr %996, align 4
  store i64 %997, ptr %r1, align 4
  %998 = load i64, ptr %r1, align 4
  %999 = add i64 %998, 1
  store i64 %999, ptr %r1, align 4
  %1000 = load i64, ptr %r1, align 4
  %1001 = load ptr, ptr %r0, align 8
  %1002 = getelementptr i8, ptr %1001, i64 0
  store i64 %1000, ptr %1002, align 4
  %1003 = call i64 @__lddw_helper_map_by_fd(i32 6)
  store i64 %1003, ptr %r3, align 4
  %1004 = load ptr, ptr %r10, align 8
  %1005 = getelementptr i8, ptr %1004, i64 -144
  %1006 = load i64, ptr %1005, align 4
  store i64 %1006, ptr %r8, align 4
  br label %bb_inst_401

bb_inst_401:                                      ; preds = %bb_inst_395, %bb_inst_385
  %1007 = load ptr, ptr %r8, align 8
  %1008 = getelementptr i8, ptr %1007, i64 0
  %1009 = load i32, ptr %1008, align 4
  %1010 = zext i32 %1009 to i64
  store i64 %1010, ptr %r1, align 4
  %1011 = load i64, ptr %r1, align 4
  %1012 = and i64 %1011, 4
  store i64 %1012, ptr %r1, align 4
  %1013 = load i64, ptr %r8, align 4
  store i64 %1013, ptr %r2, align 4
  %1014 = load i64, ptr %r1, align 4
  %1015 = icmp eq i64 %1014, 0
  br i1 %1015, label %bb_inst_1223, label %bb_inst_405

bb_inst_405:                                      ; preds = %bb_inst_401
  %1016 = load ptr, ptr %r10, align 8
  %1017 = getelementptr i8, ptr %1016, i64 -28
  %1018 = load i8, ptr %1017, align 1
  %1019 = zext i8 %1018 to i64
  store i64 %1019, ptr %r1, align 4
  %1020 = load i64, ptr %r1, align 4
  %1021 = and i64 %1020, 1
  store i64 %1021, ptr %r1, align 4
  %1022 = load i64, ptr %r1, align 4
  %1023 = icmp eq i64 %1022, 0
  br i1 %1023, label %bb_inst_646, label %bb_inst_408

bb_inst_408:                                      ; preds = %bb_inst_405
  %1024 = load i64, ptr %r3, align 4
  store i64 %1024, ptr %r8, align 4
  store i64 523, ptr %r1, align 4
  %1025 = load i64, ptr %r1, align 4
  %1026 = trunc i64 %1025 to i32
  %1027 = load ptr, ptr %r10, align 8
  %1028 = getelementptr i8, ptr %1027, i64 -16
  store i32 %1026, ptr %1028, align 4
  %1029 = load i64, ptr %r10, align 4
  store i64 %1029, ptr %r2, align 4
  %1030 = load i64, ptr %r2, align 4
  %1031 = add i64 %1030, -16
  store i64 %1031, ptr %r2, align 4
  %1032 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %1032, ptr %r1, align 4
  %1033 = load i64, ptr %r1, align 4
  %1034 = load i64, ptr %r2, align 4
  %1035 = load i64, ptr %r3, align 4
  %1036 = load i64, ptr %r4, align 4
  %1037 = load i64, ptr %r5, align 4
  %1038 = call i64 @_bpf_helper_ext_0001(i64 %1033, i64 %1034, i64 %1035, i64 %1036, i64 %1037)
  store i64 %1038, ptr %r0, align 4
  br label %bb_inst_416

bb_inst_416:                                      ; preds = %bb_inst_408
  %1039 = load i64, ptr %r0, align 4
  %1040 = icmp eq i64 %1039, 0
  br i1 %1040, label %bb_inst_941, label %bb_inst_417

bb_inst_417:                                      ; preds = %bb_inst_416
  %1041 = load ptr, ptr %r0, align 8
  %1042 = getelementptr i8, ptr %1041, i64 0
  %1043 = load i64, ptr %1042, align 4
  store i64 %1043, ptr %r1, align 4
  %1044 = load i64, ptr %r1, align 4
  %1045 = add i64 %1044, 1
  store i64 %1045, ptr %r1, align 4
  %1046 = load i64, ptr %r1, align 4
  %1047 = load ptr, ptr %r0, align 8
  %1048 = getelementptr i8, ptr %1047, i64 0
  store i64 %1046, ptr %1048, align 4
  %1049 = load ptr, ptr %r7, align 8
  %1050 = getelementptr i8, ptr %1049, i64 55
  %1051 = load i8, ptr %1050, align 1
  %1052 = zext i8 %1051 to i64
  store i64 %1052, ptr %r1, align 4
  %1053 = load i64, ptr %r1, align 4
  %1054 = add i64 %1053, -3
  store i64 %1054, ptr %r1, align 4
  %1055 = load i64, ptr %r1, align 4
  %1056 = and i64 %1055, 255
  store i64 %1056, ptr %r1, align 4
  %1057 = load ptr, ptr %r10, align 8
  %1058 = getelementptr i8, ptr %1057, i64 -144
  %1059 = load i64, ptr %1058, align 4
  store i64 %1059, ptr %r2, align 4
  %1060 = load i64, ptr %r1, align 4
  %1061 = icmp ugt i64 %1060, 1
  br i1 %1061, label %bb_inst_428, label %bb_inst_425

bb_inst_425:                                      ; preds = %bb_inst_417
  %1062 = load ptr, ptr %r0, align 8
  %1063 = getelementptr i8, ptr %1062, i64 8
  %1064 = load i64, ptr %1063, align 4
  store i64 %1064, ptr %r1, align 4
  %1065 = load i64, ptr %r1, align 4
  %1066 = add i64 %1065, 1
  store i64 %1066, ptr %r1, align 4
  %1067 = load i64, ptr %r1, align 4
  %1068 = load ptr, ptr %r0, align 8
  %1069 = getelementptr i8, ptr %1068, i64 8
  store i64 %1067, ptr %1069, align 4
  br label %bb_inst_428

bb_inst_428:                                      ; preds = %bb_inst_425, %bb_inst_417
  %1070 = load i64, ptr %r8, align 4
  store i64 %1070, ptr %r3, align 4
  br label %bb_inst_1223

bb_inst_430:                                      ; preds = %bb_inst_138
  %1071 = load i64, ptr %r0, align 4
  %1072 = load ptr, ptr %r10, align 8
  %1073 = getelementptr i8, ptr %1072, i64 -128
  store i64 %1071, ptr %1073, align 4
  store i64 524, ptr %r1, align 4
  %1074 = load i64, ptr %r1, align 4
  %1075 = trunc i64 %1074 to i32
  %1076 = load ptr, ptr %r10, align 8
  %1077 = getelementptr i8, ptr %1076, i64 -16
  store i32 %1075, ptr %1077, align 4
  %1078 = load i64, ptr %r10, align 4
  store i64 %1078, ptr %r2, align 4
  %1079 = load i64, ptr %r2, align 4
  %1080 = add i64 %1079, -16
  store i64 %1080, ptr %r2, align 4
  %1081 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %1081, ptr %r1, align 4
  %1082 = load i64, ptr %r1, align 4
  %1083 = load i64, ptr %r2, align 4
  %1084 = load i64, ptr %r3, align 4
  %1085 = load i64, ptr %r4, align 4
  %1086 = load i64, ptr %r5, align 4
  %1087 = call i64 @_bpf_helper_ext_0001(i64 %1082, i64 %1083, i64 %1084, i64 %1085, i64 %1086)
  store i64 %1087, ptr %r0, align 4
  br label %bb_inst_438

bb_inst_438:                                      ; preds = %bb_inst_430
  %1088 = load i64, ptr %r0, align 4
  %1089 = icmp eq i64 %1088, 0
  br i1 %1089, label %bb_inst_942, label %bb_inst_439

bb_inst_439:                                      ; preds = %bb_inst_438
  %1090 = load ptr, ptr %r0, align 8
  %1091 = getelementptr i8, ptr %1090, i64 0
  %1092 = load i64, ptr %1091, align 4
  store i64 %1092, ptr %r1, align 4
  %1093 = load i64, ptr %r1, align 4
  %1094 = add i64 %1093, 1
  store i64 %1094, ptr %r1, align 4
  %1095 = load i64, ptr %r1, align 4
  %1096 = load ptr, ptr %r0, align 8
  %1097 = getelementptr i8, ptr %1096, i64 0
  store i64 %1095, ptr %1097, align 4
  %1098 = load ptr, ptr %r7, align 8
  %1099 = getelementptr i8, ptr %1098, i64 58
  %1100 = load i32, ptr %1099, align 4
  %1101 = zext i32 %1100 to i64
  store i64 %1101, ptr %r1, align 4
  %1102 = load i64, ptr %r1, align 4
  %1103 = lshr i64 %1102, 0
  %1104 = and i64 %1103, 255
  %1105 = lshr i64 %1102, 8
  %1106 = and i64 %1105, 255
  %1107 = lshr i64 %1102, 16
  %1108 = and i64 %1107, 255
  %1109 = lshr i64 %1102, 24
  %1110 = and i64 %1109, 255
  %1111 = shl i64 %1104, 8
  %1112 = or i64 %1111, %1106
  %1113 = shl i64 %1112, 8
  %1114 = or i64 %1113, %1108
  %1115 = shl i64 %1114, 8
  %1116 = or i64 %1115, %1110
  store i64 %1116, ptr %r1, align 4
  %1117 = load i64, ptr %r1, align 4
  %1118 = icmp ugt i64 %1117, 1279
  br i1 %1118, label %bb_inst_448, label %bb_inst_445

bb_inst_445:                                      ; preds = %bb_inst_439
  %1119 = load ptr, ptr %r0, align 8
  %1120 = getelementptr i8, ptr %1119, i64 8
  %1121 = load i64, ptr %1120, align 4
  store i64 %1121, ptr %r1, align 4
  %1122 = load i64, ptr %r1, align 4
  %1123 = add i64 %1122, 1
  store i64 %1123, ptr %r1, align 4
  %1124 = load i64, ptr %r1, align 4
  %1125 = load ptr, ptr %r0, align 8
  %1126 = getelementptr i8, ptr %1125, i64 8
  store i64 %1124, ptr %1126, align 4
  br label %bb_inst_448

bb_inst_448:                                      ; preds = %bb_inst_445, %bb_inst_439
  %1127 = load ptr, ptr %r10, align 8
  %1128 = getelementptr i8, ptr %1127, i64 -128
  %1129 = load i64, ptr %1128, align 4
  store i64 %1129, ptr %r0, align 4
  br label %bb_inst_449

bb_inst_449:                                      ; preds = %bb_inst_448, %bb_inst_136
  %1130 = load i64, ptr %r7, align 4
  store i64 %1130, ptr %r1, align 4
  %1131 = load i64, ptr %r1, align 4
  %1132 = add i64 %1131, 102
  store i64 %1132, ptr %r1, align 4
  store i64 1, ptr %r8, align 4
  %1133 = load i64, ptr %r9, align 4
  %1134 = load i64, ptr %r1, align 4
  %1135 = icmp ugt i64 %1134, %1133
  br i1 %1135, label %bb_inst_942, label %bb_inst_453

bb_inst_453:                                      ; preds = %bb_inst_449
  %1136 = load ptr, ptr %r7, align 8
  %1137 = getelementptr i8, ptr %1136, i64 68
  %1138 = load i8, ptr %1137, align 1
  %1139 = zext i8 %1138 to i64
  store i64 %1139, ptr %r1, align 4
  %1140 = load i64, ptr %r1, align 4
  %1141 = trunc i64 %1140 to i8
  %1142 = load ptr, ptr %r10, align 8
  %1143 = getelementptr i8, ptr %1142, i64 -36
  store i8 %1141, ptr %1143, align 1
  %1144 = load ptr, ptr %r10, align 8
  %1145 = getelementptr i8, ptr %1144, i64 -28
  %1146 = load i8, ptr %1145, align 1
  %1147 = zext i8 %1146 to i64
  store i64 %1147, ptr %r2, align 4
  %1148 = load i64, ptr %r2, align 4
  %1149 = or i64 %1148, 1
  store i64 %1149, ptr %r2, align 4
  %1150 = load i64, ptr %r2, align 4
  %1151 = trunc i64 %1150 to i8
  %1152 = load ptr, ptr %r10, align 8
  %1153 = getelementptr i8, ptr %1152, i64 -28
  store i8 %1151, ptr %1153, align 1
  %1154 = load ptr, ptr %r7, align 8
  %1155 = getelementptr i8, ptr %1154, i64 90
  %1156 = load i32, ptr %1155, align 4
  %1157 = zext i32 %1156 to i64
  store i64 %1157, ptr %r3, align 4
  %1158 = load i64, ptr %r3, align 4
  %1159 = shl i64 %1158, 32
  store i64 %1159, ptr %r3, align 4
  %1160 = load ptr, ptr %r7, align 8
  %1161 = getelementptr i8, ptr %1160, i64 86
  %1162 = load i32, ptr %1161, align 4
  %1163 = zext i32 %1162 to i64
  store i64 %1163, ptr %r4, align 4
  %1164 = load i64, ptr %r3, align 4
  %1165 = load i64, ptr %r4, align 4
  %1166 = or i64 %1164, %1165
  store i64 %1166, ptr %r3, align 4
  %1167 = load i64, ptr %r3, align 4
  %1168 = load ptr, ptr %r10, align 8
  %1169 = getelementptr i8, ptr %1168, i64 -72
  store i64 %1167, ptr %1169, align 4
  %1170 = load ptr, ptr %r7, align 8
  %1171 = getelementptr i8, ptr %1170, i64 98
  %1172 = load i32, ptr %1171, align 4
  %1173 = zext i32 %1172 to i64
  store i64 %1173, ptr %r3, align 4
  %1174 = load i64, ptr %r3, align 4
  %1175 = shl i64 %1174, 32
  store i64 %1175, ptr %r3, align 4
  %1176 = load ptr, ptr %r7, align 8
  %1177 = getelementptr i8, ptr %1176, i64 94
  %1178 = load i32, ptr %1177, align 4
  %1179 = zext i32 %1178 to i64
  store i64 %1179, ptr %r4, align 4
  %1180 = load i64, ptr %r3, align 4
  %1181 = load i64, ptr %r4, align 4
  %1182 = or i64 %1180, %1181
  store i64 %1182, ptr %r3, align 4
  %1183 = load i64, ptr %r3, align 4
  %1184 = load ptr, ptr %r10, align 8
  %1185 = getelementptr i8, ptr %1184, i64 -64
  store i64 %1183, ptr %1185, align 4
  %1186 = load ptr, ptr %r7, align 8
  %1187 = getelementptr i8, ptr %1186, i64 74
  %1188 = load i32, ptr %1187, align 4
  %1189 = zext i32 %1188 to i64
  store i64 %1189, ptr %r3, align 4
  %1190 = load i64, ptr %r3, align 4
  %1191 = shl i64 %1190, 32
  store i64 %1191, ptr %r3, align 4
  %1192 = load ptr, ptr %r7, align 8
  %1193 = getelementptr i8, ptr %1192, i64 70
  %1194 = load i32, ptr %1193, align 4
  %1195 = zext i32 %1194 to i64
  store i64 %1195, ptr %r4, align 4
  %1196 = load i64, ptr %r3, align 4
  %1197 = load i64, ptr %r4, align 4
  %1198 = or i64 %1196, %1197
  store i64 %1198, ptr %r3, align 4
  %1199 = load i64, ptr %r3, align 4
  %1200 = load ptr, ptr %r10, align 8
  %1201 = getelementptr i8, ptr %1200, i64 -56
  store i64 %1199, ptr %1201, align 4
  %1202 = load ptr, ptr %r7, align 8
  %1203 = getelementptr i8, ptr %1202, i64 78
  %1204 = load i32, ptr %1203, align 4
  %1205 = zext i32 %1204 to i64
  store i64 %1205, ptr %r3, align 4
  %1206 = load ptr, ptr %r7, align 8
  %1207 = getelementptr i8, ptr %1206, i64 82
  %1208 = load i32, ptr %1207, align 4
  %1209 = zext i32 %1208 to i64
  store i64 %1209, ptr %r4, align 4
  %1210 = load i64, ptr %r4, align 4
  %1211 = shl i64 %1210, 32
  store i64 %1211, ptr %r4, align 4
  %1212 = load i64, ptr %r4, align 4
  %1213 = load i64, ptr %r3, align 4
  %1214 = or i64 %1212, %1213
  store i64 %1214, ptr %r4, align 4
  %1215 = load i64, ptr %r4, align 4
  %1216 = load ptr, ptr %r10, align 8
  %1217 = getelementptr i8, ptr %1216, i64 -48
  store i64 %1215, ptr %1217, align 4
  br label %bb_inst_239

bb_inst_479:                                      ; preds = %bb_inst_285
  %1218 = load i64, ptr %r3, align 4
  %1219 = and i64 %1218, 1
  store i64 %1219, ptr %r3, align 4
  store i64 34, ptr %r5, align 4
  %1220 = load i64, ptr %r3, align 4
  %1221 = icmp eq i64 %1220, 0
  br i1 %1221, label %bb_inst_483, label %bb_inst_482

bb_inst_482:                                      ; preds = %bb_inst_479
  store i64 62, ptr %r5, align 4
  br label %bb_inst_483

bb_inst_483:                                      ; preds = %bb_inst_482, %bb_inst_479
  %1222 = load i64, ptr %r7, align 4
  store i64 %1222, ptr %r4, align 4
  %1223 = load i64, ptr %r4, align 4
  %1224 = load i64, ptr %r5, align 4
  %1225 = add i64 %1223, %1224
  store i64 %1225, ptr %r4, align 4
  %1226 = load i64, ptr %r4, align 4
  store i64 %1226, ptr %r5, align 4
  %1227 = load i64, ptr %r5, align 4
  %1228 = add i64 %1227, 8
  store i64 %1228, ptr %r5, align 4
  store i64 1, ptr %r8, align 4
  %1229 = load i64, ptr %r9, align 4
  %1230 = load i64, ptr %r5, align 4
  %1231 = icmp ugt i64 %1230, %1229
  br i1 %1231, label %bb_inst_942, label %bb_inst_489

bb_inst_489:                                      ; preds = %bb_inst_483
  %1232 = load i64, ptr %r3, align 4
  %1233 = icmp ne i64 %1232, 0
  br i1 %1233, label %bb_inst_539, label %bb_inst_490

bb_inst_490:                                      ; preds = %bb_inst_489
  %1234 = load ptr, ptr %r4, align 8
  %1235 = getelementptr i8, ptr %1234, i64 0
  %1236 = load i16, ptr %1235, align 2
  %1237 = zext i16 %1236 to i64
  store i64 %1237, ptr %r3, align 4
  %1238 = load i64, ptr %r3, align 4
  %1239 = trunc i64 %1238 to i16
  %1240 = load ptr, ptr %r10, align 8
  %1241 = getelementptr i8, ptr %1240, i64 -40
  store i16 %1239, ptr %1241, align 2
  %1242 = load i64, ptr %r10, align 4
  store i64 %1242, ptr %r0, align 4
  %1243 = load i64, ptr %r0, align 4
  %1244 = add i64 %1243, -40
  store i64 %1244, ptr %r0, align 4
  %1245 = load i64, ptr %r4, align 4
  %1246 = add i64 %1245, 2
  store i64 %1246, ptr %r4, align 4
  br label %bb_inst_543

bb_inst_496:                                      ; preds = %bb_inst_50
  %1247 = load ptr, ptr %r7, align 8
  %1248 = getelementptr i8, ptr %1247, i64 35
  %1249 = load i8, ptr %1248, align 1
  %1250 = zext i8 %1249 to i64
  store i64 %1250, ptr %r1, align 4
  %1251 = load i64, ptr %r1, align 4
  %1252 = icmp ne i64 %1251, 4
  br i1 %1252, label %bb_inst_517, label %bb_inst_498

bb_inst_498:                                      ; preds = %bb_inst_496
  %1253 = load i64, ptr %r4, align 4
  store i64 %1253, ptr %r8, align 4
  store i64 525, ptr %r1, align 4
  %1254 = load i64, ptr %r1, align 4
  %1255 = trunc i64 %1254 to i32
  %1256 = load ptr, ptr %r10, align 8
  %1257 = getelementptr i8, ptr %1256, i64 -16
  store i32 %1255, ptr %1257, align 4
  %1258 = load i64, ptr %r10, align 4
  store i64 %1258, ptr %r2, align 4
  %1259 = load i64, ptr %r2, align 4
  %1260 = add i64 %1259, -16
  store i64 %1260, ptr %r2, align 4
  %1261 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %1261, ptr %r1, align 4
  %1262 = load i64, ptr %r1, align 4
  %1263 = load i64, ptr %r2, align 4
  %1264 = load i64, ptr %r3, align 4
  %1265 = load i64, ptr %r4, align 4
  %1266 = load i64, ptr %r5, align 4
  %1267 = call i64 @_bpf_helper_ext_0001(i64 %1262, i64 %1263, i64 %1264, i64 %1265, i64 %1266)
  store i64 %1267, ptr %r0, align 4
  br label %bb_inst_506

bb_inst_506:                                      ; preds = %bb_inst_498
  %1268 = load i64, ptr %r0, align 4
  %1269 = icmp eq i64 %1268, 0
  br i1 %1269, label %bb_inst_941, label %bb_inst_507

bb_inst_507:                                      ; preds = %bb_inst_506
  %1270 = load ptr, ptr %r0, align 8
  %1271 = getelementptr i8, ptr %1270, i64 0
  %1272 = load i64, ptr %1271, align 4
  store i64 %1272, ptr %r1, align 4
  %1273 = load i64, ptr %r1, align 4
  %1274 = add i64 %1273, 1
  store i64 %1274, ptr %r1, align 4
  %1275 = load i64, ptr %r1, align 4
  %1276 = load ptr, ptr %r0, align 8
  %1277 = getelementptr i8, ptr %1276, i64 0
  store i64 %1275, ptr %1277, align 4
  %1278 = load ptr, ptr %r7, align 8
  %1279 = getelementptr i8, ptr %1278, i64 40
  %1280 = load i16, ptr %1279, align 2
  %1281 = zext i16 %1280 to i64
  store i64 %1281, ptr %r1, align 4
  %1282 = load i64, ptr %r1, align 4
  %1283 = and i64 %1282, 255
  store i64 %1283, ptr %r1, align 4
  %1284 = load i64, ptr %r1, align 4
  %1285 = icmp ugt i64 %1284, 4
  br i1 %1285, label %bb_inst_516, label %bb_inst_513

bb_inst_513:                                      ; preds = %bb_inst_507
  %1286 = load ptr, ptr %r0, align 8
  %1287 = getelementptr i8, ptr %1286, i64 8
  %1288 = load i64, ptr %1287, align 4
  store i64 %1288, ptr %r1, align 4
  %1289 = load i64, ptr %r1, align 4
  %1290 = add i64 %1289, 1
  store i64 %1290, ptr %r1, align 4
  %1291 = load i64, ptr %r1, align 4
  %1292 = load ptr, ptr %r0, align 8
  %1293 = getelementptr i8, ptr %1292, i64 8
  store i64 %1291, ptr %1293, align 4
  br label %bb_inst_516

bb_inst_516:                                      ; preds = %bb_inst_513, %bb_inst_507
  %1294 = load i64, ptr %r8, align 4
  store i64 %1294, ptr %r4, align 4
  br label %bb_inst_517

bb_inst_517:                                      ; preds = %bb_inst_516, %bb_inst_496
  %1295 = load i64, ptr %r7, align 4
  store i64 %1295, ptr %r1, align 4
  %1296 = load i64, ptr %r1, align 4
  %1297 = add i64 %1296, 62
  store i64 %1297, ptr %r1, align 4
  store i64 1, ptr %r8, align 4
  %1298 = load i64, ptr %r9, align 4
  %1299 = load i64, ptr %r1, align 4
  %1300 = icmp ugt i64 %1299, %1298
  br i1 %1300, label %bb_inst_942, label %bb_inst_521

bb_inst_521:                                      ; preds = %bb_inst_517
  %1301 = load ptr, ptr %r4, align 8
  %1302 = getelementptr i8, ptr %1301, i64 0
  %1303 = load i8, ptr %1302, align 1
  %1304 = zext i8 %1303 to i64
  store i64 %1304, ptr %r1, align 4
  %1305 = load i64, ptr %r1, align 4
  %1306 = and i64 %1305, 15
  store i64 %1306, ptr %r1, align 4
  store i64 1, ptr %r8, align 4
  %1307 = load i64, ptr %r1, align 4
  %1308 = icmp eq i64 %1307, 5
  br i1 %1308, label %bb_inst_526, label %bb_inst_525

bb_inst_525:                                      ; preds = %bb_inst_521
  br label %bb_inst_942

bb_inst_526:                                      ; preds = %bb_inst_521
  %1309 = load ptr, ptr %r7, align 8
  %1310 = getelementptr i8, ptr %1309, i64 51
  %1311 = load i8, ptr %1310, align 1
  %1312 = zext i8 %1311 to i64
  store i64 %1312, ptr %r1, align 4
  %1313 = load i64, ptr %r1, align 4
  %1314 = trunc i64 %1313 to i8
  %1315 = load ptr, ptr %r10, align 8
  %1316 = getelementptr i8, ptr %1315, i64 -36
  store i8 %1314, ptr %1316, align 1
  %1317 = load ptr, ptr %r10, align 8
  %1318 = getelementptr i8, ptr %1317, i64 -28
  %1319 = load i8, ptr %1318, align 1
  %1320 = zext i8 %1319 to i64
  store i64 %1320, ptr %r3, align 4
  %1321 = load i64, ptr %r3, align 4
  %1322 = or i64 %1321, 1
  store i64 %1322, ptr %r3, align 4
  %1323 = load i64, ptr %r3, align 4
  %1324 = trunc i64 %1323 to i8
  %1325 = load ptr, ptr %r10, align 8
  %1326 = getelementptr i8, ptr %1325, i64 -28
  store i8 %1324, ptr %1326, align 1
  %1327 = load ptr, ptr %r7, align 8
  %1328 = getelementptr i8, ptr %1327, i64 58
  %1329 = load i32, ptr %1328, align 4
  %1330 = zext i32 %1329 to i64
  store i64 %1330, ptr %r2, align 4
  %1331 = load i64, ptr %r2, align 4
  %1332 = trunc i64 %1331 to i32
  %1333 = load ptr, ptr %r10, align 8
  %1334 = getelementptr i8, ptr %1333, i64 -72
  store i32 %1332, ptr %1334, align 4
  %1335 = load i64, ptr %r7, align 4
  store i64 %1335, ptr %r2, align 4
  %1336 = load i64, ptr %r2, align 4
  %1337 = add i64 %1336, 54
  store i64 %1337, ptr %r2, align 4
  br label %bb_inst_285

bb_inst_536:                                      ; preds = %bb_inst_307
  %1338 = load ptr, ptr %r4, align 8
  %1339 = getelementptr i8, ptr %1338, i64 2
  %1340 = load i16, ptr %1339, align 2
  %1341 = zext i16 %1340 to i64
  store i64 %1341, ptr %r3, align 4
  %1342 = load i64, ptr %r3, align 4
  %1343 = trunc i64 %1342 to i16
  %1344 = load ptr, ptr %r10, align 8
  %1345 = getelementptr i8, ptr %1344, i64 -40
  store i16 %1343, ptr %1345, align 2
  br label %bb_inst_543

bb_inst_539:                                      ; preds = %bb_inst_489
  %1346 = load ptr, ptr %r4, align 8
  %1347 = getelementptr i8, ptr %1346, i64 2
  %1348 = load i16, ptr %1347, align 2
  %1349 = zext i16 %1348 to i64
  store i64 %1349, ptr %r3, align 4
  %1350 = load i64, ptr %r3, align 4
  %1351 = trunc i64 %1350 to i16
  %1352 = load ptr, ptr %r10, align 8
  %1353 = getelementptr i8, ptr %1352, i64 -40
  store i16 %1351, ptr %1353, align 2
  %1354 = load i64, ptr %r10, align 4
  store i64 %1354, ptr %r0, align 4
  %1355 = load i64, ptr %r0, align 4
  %1356 = add i64 %1355, -40
  store i64 %1356, ptr %r0, align 4
  br label %bb_inst_543

bb_inst_543:                                      ; preds = %bb_inst_539, %bb_inst_536, %bb_inst_490, %bb_inst_310
  %1357 = load ptr, ptr %r4, align 8
  %1358 = getelementptr i8, ptr %1357, i64 0
  %1359 = load i16, ptr %1358, align 2
  %1360 = zext i16 %1359 to i64
  store i64 %1360, ptr %r3, align 4
  %1361 = load i64, ptr %r0, align 4
  %1362 = load ptr, ptr %r10, align 8
  %1363 = getelementptr i8, ptr %1362, i64 -136
  store i64 %1361, ptr %1363, align 4
  %1364 = load i64, ptr %r3, align 4
  %1365 = trunc i64 %1364 to i16
  %1366 = load ptr, ptr %r0, align 8
  %1367 = getelementptr i8, ptr %1366, i64 2
  store i16 %1365, ptr %1367, align 2
  %1368 = load i64, ptr %r1, align 4
  %1369 = trunc i64 %1368 to i8
  %1370 = load ptr, ptr %r10, align 8
  %1371 = getelementptr i8, ptr %1370, i64 -78
  store i8 %1369, ptr %1371, align 1
  %1372 = load i64, ptr %r3, align 4
  %1373 = trunc i64 %1372 to i16
  %1374 = load ptr, ptr %r10, align 8
  %1375 = getelementptr i8, ptr %1374, i64 -80
  store i16 %1373, ptr %1375, align 2
  %1376 = load i64, ptr %r2, align 4
  %1377 = trunc i64 %1376 to i32
  %1378 = load ptr, ptr %r10, align 8
  %1379 = getelementptr i8, ptr %1378, i64 -96
  store i32 %1377, ptr %1379, align 4
  %1380 = load i64, ptr %r10, align 4
  store i64 %1380, ptr %r2, align 4
  %1381 = load i64, ptr %r2, align 4
  %1382 = add i64 %1381, -96
  store i64 %1382, ptr %r2, align 4
  %1383 = call i64 @__lddw_helper_map_by_fd(i32 5)
  store i64 %1383, ptr %r1, align 4
  %1384 = load i64, ptr %r1, align 4
  %1385 = load i64, ptr %r2, align 4
  %1386 = load i64, ptr %r3, align 4
  %1387 = load i64, ptr %r4, align 4
  %1388 = load i64, ptr %r5, align 4
  %1389 = call i64 @_bpf_helper_ext_0001(i64 %1384, i64 %1385, i64 %1386, i64 %1387, i64 %1388)
  store i64 %1389, ptr %r0, align 4
  br label %bb_inst_554

bb_inst_554:                                      ; preds = %bb_inst_543
  %1390 = load i64, ptr %r0, align 4
  %1391 = icmp ne i64 %1390, 0
  br i1 %1391, label %bb_inst_570, label %bb_inst_555

bb_inst_555:                                      ; preds = %bb_inst_554
  store i64 0, ptr %r1, align 4
  %1392 = load i64, ptr %r1, align 4
  %1393 = trunc i64 %1392 to i16
  %1394 = load ptr, ptr %r10, align 8
  %1395 = getelementptr i8, ptr %1394, i64 -80
  store i16 %1393, ptr %1395, align 2
  %1396 = load i64, ptr %r10, align 4
  store i64 %1396, ptr %r2, align 4
  %1397 = load i64, ptr %r2, align 4
  %1398 = add i64 %1397, -96
  store i64 %1398, ptr %r2, align 4
  %1399 = call i64 @__lddw_helper_map_by_fd(i32 5)
  store i64 %1399, ptr %r1, align 4
  %1400 = load i64, ptr %r1, align 4
  %1401 = load i64, ptr %r2, align 4
  %1402 = load i64, ptr %r3, align 4
  %1403 = load i64, ptr %r4, align 4
  %1404 = load i64, ptr %r5, align 4
  %1405 = call i64 @_bpf_helper_ext_0001(i64 %1400, i64 %1401, i64 %1402, i64 %1403, i64 %1404)
  store i64 %1405, ptr %r0, align 4
  br label %bb_inst_562

bb_inst_562:                                      ; preds = %bb_inst_555
  store i64 2, ptr %r8, align 4
  %1406 = load i64, ptr %r0, align 4
  %1407 = icmp eq i64 %1406, 0
  br i1 %1407, label %bb_inst_942, label %bb_inst_564

bb_inst_564:                                      ; preds = %bb_inst_562
  %1408 = load ptr, ptr %r0, align 8
  %1409 = getelementptr i8, ptr %1408, i64 0
  %1410 = load i32, ptr %1409, align 4
  %1411 = zext i32 %1410 to i64
  store i64 %1411, ptr %r1, align 4
  %1412 = load i64, ptr %r1, align 4
  %1413 = and i64 %1412, 136
  store i64 %1413, ptr %r1, align 4
  %1414 = load i64, ptr %r1, align 4
  %1415 = icmp ne i64 %1414, 0
  br i1 %1415, label %bb_inst_570, label %bb_inst_567

bb_inst_567:                                      ; preds = %bb_inst_564
  store i64 0, ptr %r1, align 4
  %1416 = load ptr, ptr %r10, align 8
  %1417 = getelementptr i8, ptr %1416, i64 -136
  %1418 = load i64, ptr %1417, align 4
  store i64 %1418, ptr %r2, align 4
  %1419 = load i64, ptr %r1, align 4
  %1420 = trunc i64 %1419 to i16
  %1421 = load ptr, ptr %r2, align 8
  %1422 = getelementptr i8, ptr %1421, i64 2
  store i16 %1420, ptr %1422, align 2
  br label %bb_inst_570

bb_inst_570:                                      ; preds = %bb_inst_567, %bb_inst_564, %bb_inst_554
  %1423 = load i64, ptr %r9, align 4
  store i64 %1423, ptr %r1, align 4
  %1424 = load i64, ptr %r1, align 4
  %1425 = load i64, ptr %r7, align 4
  %1426 = sub i64 %1424, %1425
  store i64 %1426, ptr %r1, align 4
  store i64 1, ptr %r8, align 4
  %1427 = load i64, ptr %r1, align 4
  %1428 = icmp sgt i64 %1427, 1514
  br i1 %1428, label %bb_inst_942, label %bb_inst_574

bb_inst_574:                                      ; preds = %bb_inst_570
  %1429 = load i64, ptr %r0, align 4
  %1430 = load ptr, ptr %r10, align 8
  %1431 = getelementptr i8, ptr %1430, i64 -144
  store i64 %1429, ptr %1431, align 4
  store i64 512, ptr %r1, align 4
  %1432 = load i64, ptr %r1, align 4
  %1433 = trunc i64 %1432 to i32
  %1434 = load ptr, ptr %r10, align 8
  %1435 = getelementptr i8, ptr %1434, i64 -108
  store i32 %1433, ptr %1435, align 4
  %1436 = load i64, ptr %r10, align 4
  store i64 %1436, ptr %r2, align 4
  %1437 = load i64, ptr %r2, align 4
  %1438 = add i64 %1437, -108
  store i64 %1438, ptr %r2, align 4
  %1439 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %1439, ptr %r1, align 4
  %1440 = load i64, ptr %r1, align 4
  %1441 = load i64, ptr %r2, align 4
  %1442 = load i64, ptr %r3, align 4
  %1443 = load i64, ptr %r4, align 4
  %1444 = load i64, ptr %r5, align 4
  %1445 = call i64 @_bpf_helper_ext_0001(i64 %1440, i64 %1441, i64 %1442, i64 %1443, i64 %1444)
  store i64 %1445, ptr %r0, align 4
  br label %bb_inst_582

bb_inst_582:                                      ; preds = %bb_inst_574
  store i64 1, ptr %r8, align 4
  %1446 = load i64, ptr %r0, align 4
  %1447 = icmp eq i64 %1446, 0
  br i1 %1447, label %bb_inst_942, label %bb_inst_584

bb_inst_584:                                      ; preds = %bb_inst_582
  %1448 = load ptr, ptr %r0, align 8
  %1449 = getelementptr i8, ptr %1448, i64 0
  %1450 = load i64, ptr %1449, align 4
  store i64 %1450, ptr %r1, align 4
  %1451 = load i64, ptr %r1, align 4
  %1452 = add i64 %1451, 1
  store i64 %1452, ptr %r1, align 4
  %1453 = load i64, ptr %r0, align 4
  %1454 = load ptr, ptr %r10, align 8
  %1455 = getelementptr i8, ptr %1454, i64 -160
  store i64 %1453, ptr %1455, align 4
  %1456 = load i64, ptr %r1, align 4
  %1457 = load ptr, ptr %r0, align 8
  %1458 = getelementptr i8, ptr %1457, i64 0
  store i64 %1456, ptr %1458, align 4
  %1459 = load ptr, ptr %r10, align 8
  %1460 = getelementptr i8, ptr %1459, i64 -144
  %1461 = load i64, ptr %1460, align 4
  store i64 %1461, ptr %r8, align 4
  %1462 = load ptr, ptr %r8, align 8
  %1463 = getelementptr i8, ptr %1462, i64 0
  %1464 = load i32, ptr %1463, align 4
  %1465 = zext i32 %1464 to i64
  store i64 %1465, ptr %r1, align 4
  %1466 = load i64, ptr %r1, align 4
  %1467 = and i64 %1466, 1
  store i64 %1467, ptr %r1, align 4
  %1468 = load i64, ptr %r1, align 4
  %1469 = icmp eq i64 %1468, 0
  br i1 %1469, label %bb_inst_594, label %bb_inst_592

bb_inst_592:                                      ; preds = %bb_inst_584
  store i64 0, ptr %r1, align 4
  %1470 = load i64, ptr %r1, align 4
  %1471 = trunc i64 %1470 to i16
  %1472 = load ptr, ptr %r10, align 8
  %1473 = getelementptr i8, ptr %1472, i64 -40
  store i16 %1471, ptr %1473, align 2
  br label %bb_inst_594

bb_inst_594:                                      ; preds = %bb_inst_592, %bb_inst_584
  %1474 = load ptr, ptr %r8, align 8
  %1475 = getelementptr i8, ptr %1474, i64 4
  %1476 = load i32, ptr %1475, align 4
  %1477 = zext i32 %1476 to i64
  store i64 %1477, ptr %r1, align 4
  %1478 = load i64, ptr %r1, align 4
  %1479 = trunc i64 %1478 to i32
  %1480 = load ptr, ptr %r10, align 8
  %1481 = getelementptr i8, ptr %1480, i64 -100
  store i32 %1479, ptr %1481, align 4
  %1482 = load i64, ptr %r1, align 4
  %1483 = load i64, ptr %r2, align 4
  %1484 = load i64, ptr %r3, align 4
  %1485 = load i64, ptr %r4, align 4
  %1486 = load i64, ptr %r5, align 4
  %1487 = call i64 @_bpf_helper_ext_0008(i64 %1482, i64 %1483, i64 %1484, i64 %1485, i64 %1486)
  store i64 %1487, ptr %r0, align 4
  br label %bb_inst_597

bb_inst_597:                                      ; preds = %bb_inst_594
  %1488 = load i64, ptr %r0, align 4
  %1489 = trunc i64 %1488 to i32
  %1490 = load ptr, ptr %r10, align 8
  %1491 = getelementptr i8, ptr %1490, i64 -112
  store i32 %1489, ptr %1491, align 4
  %1492 = load i64, ptr %r10, align 4
  store i64 %1492, ptr %r2, align 4
  %1493 = load i64, ptr %r2, align 4
  %1494 = add i64 %1493, -112
  store i64 %1494, ptr %r2, align 4
  %1495 = call i64 @__lddw_helper_map_by_fd(i32 8)
  store i64 %1495, ptr %r1, align 4
  %1496 = load i64, ptr %r1, align 4
  %1497 = load i64, ptr %r2, align 4
  %1498 = load i64, ptr %r3, align 4
  %1499 = load i64, ptr %r4, align 4
  %1500 = load i64, ptr %r5, align 4
  %1501 = call i64 @_bpf_helper_ext_0001(i64 %1496, i64 %1497, i64 %1498, i64 %1499, i64 %1500)
  store i64 %1501, ptr %r0, align 4
  br label %bb_inst_603

bb_inst_603:                                      ; preds = %bb_inst_597
  %1502 = load i64, ptr %r0, align 4
  store i64 %1502, ptr %r3, align 4
  %1503 = load i64, ptr %r3, align 4
  %1504 = icmp ne i64 %1503, 0
  br i1 %1504, label %bb_inst_619, label %bb_inst_605

bb_inst_605:                                      ; preds = %bb_inst_603
  store i64 515, ptr %r1, align 4
  %1505 = load i64, ptr %r1, align 4
  %1506 = trunc i64 %1505 to i32
  %1507 = load ptr, ptr %r10, align 8
  %1508 = getelementptr i8, ptr %1507, i64 -16
  store i32 %1506, ptr %1508, align 4
  %1509 = load i64, ptr %r10, align 4
  store i64 %1509, ptr %r2, align 4
  %1510 = load i64, ptr %r2, align 4
  %1511 = add i64 %1510, -16
  store i64 %1511, ptr %r2, align 4
  %1512 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %1512, ptr %r1, align 4
  %1513 = load i64, ptr %r1, align 4
  %1514 = load i64, ptr %r2, align 4
  %1515 = load i64, ptr %r3, align 4
  %1516 = load i64, ptr %r4, align 4
  %1517 = load i64, ptr %r5, align 4
  %1518 = call i64 @_bpf_helper_ext_0001(i64 %1513, i64 %1514, i64 %1515, i64 %1516, i64 %1517)
  store i64 %1518, ptr %r0, align 4
  br label %bb_inst_612

bb_inst_612:                                      ; preds = %bb_inst_605
  %1519 = load i64, ptr %r0, align 4
  %1520 = icmp eq i64 %1519, 0
  br i1 %1520, label %bb_inst_941, label %bb_inst_613

bb_inst_613:                                      ; preds = %bb_inst_612
  %1521 = load ptr, ptr %r0, align 8
  %1522 = getelementptr i8, ptr %1521, i64 0
  %1523 = load i64, ptr %1522, align 4
  store i64 %1523, ptr %r1, align 4
  %1524 = load i64, ptr %r1, align 4
  %1525 = add i64 %1524, 1
  store i64 %1525, ptr %r1, align 4
  %1526 = load i64, ptr %r1, align 4
  %1527 = load ptr, ptr %r0, align 8
  %1528 = getelementptr i8, ptr %1527, i64 0
  store i64 %1526, ptr %1528, align 4
  %1529 = call i64 @__lddw_helper_map_by_fd(i32 6)
  store i64 %1529, ptr %r3, align 4
  %1530 = load ptr, ptr %r10, align 8
  %1531 = getelementptr i8, ptr %1530, i64 -144
  %1532 = load i64, ptr %1531, align 4
  store i64 %1532, ptr %r8, align 4
  br label %bb_inst_619

bb_inst_619:                                      ; preds = %bb_inst_613, %bb_inst_603
  %1533 = load ptr, ptr %r8, align 8
  %1534 = getelementptr i8, ptr %1533, i64 0
  %1535 = load i32, ptr %1534, align 4
  %1536 = zext i32 %1535 to i64
  store i64 %1536, ptr %r1, align 4
  %1537 = load i64, ptr %r1, align 4
  %1538 = and i64 %1537, 4
  store i64 %1538, ptr %r1, align 4
  %1539 = load i64, ptr %r3, align 4
  %1540 = load ptr, ptr %r10, align 8
  %1541 = getelementptr i8, ptr %1540, i64 -152
  store i64 %1539, ptr %1541, align 4
  %1542 = load i64, ptr %r1, align 4
  %1543 = icmp eq i64 %1542, 0
  br i1 %1543, label %bb_inst_720, label %bb_inst_623

bb_inst_623:                                      ; preds = %bb_inst_619
  %1544 = load ptr, ptr %r10, align 8
  %1545 = getelementptr i8, ptr %1544, i64 -28
  %1546 = load i8, ptr %1545, align 1
  %1547 = zext i8 %1546 to i64
  store i64 %1547, ptr %r1, align 4
  %1548 = load i64, ptr %r1, align 4
  %1549 = and i64 %1548, 1
  store i64 %1549, ptr %r1, align 4
  %1550 = load i64, ptr %r1, align 4
  %1551 = icmp eq i64 %1550, 0
  br i1 %1551, label %bb_inst_680, label %bb_inst_626

bb_inst_626:                                      ; preds = %bb_inst_623
  store i64 523, ptr %r1, align 4
  %1552 = load i64, ptr %r1, align 4
  %1553 = trunc i64 %1552 to i32
  %1554 = load ptr, ptr %r10, align 8
  %1555 = getelementptr i8, ptr %1554, i64 -16
  store i32 %1553, ptr %1555, align 4
  %1556 = load i64, ptr %r10, align 4
  store i64 %1556, ptr %r2, align 4
  %1557 = load i64, ptr %r2, align 4
  %1558 = add i64 %1557, -16
  store i64 %1558, ptr %r2, align 4
  %1559 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %1559, ptr %r1, align 4
  %1560 = load i64, ptr %r1, align 4
  %1561 = load i64, ptr %r2, align 4
  %1562 = load i64, ptr %r3, align 4
  %1563 = load i64, ptr %r4, align 4
  %1564 = load i64, ptr %r5, align 4
  %1565 = call i64 @_bpf_helper_ext_0001(i64 %1560, i64 %1561, i64 %1562, i64 %1563, i64 %1564)
  store i64 %1565, ptr %r0, align 4
  br label %bb_inst_633

bb_inst_633:                                      ; preds = %bb_inst_626
  %1566 = load i64, ptr %r0, align 4
  %1567 = icmp eq i64 %1566, 0
  br i1 %1567, label %bb_inst_941, label %bb_inst_634

bb_inst_634:                                      ; preds = %bb_inst_633
  %1568 = load ptr, ptr %r0, align 8
  %1569 = getelementptr i8, ptr %1568, i64 0
  %1570 = load i64, ptr %1569, align 4
  store i64 %1570, ptr %r1, align 4
  %1571 = load i64, ptr %r1, align 4
  %1572 = add i64 %1571, 1
  store i64 %1572, ptr %r1, align 4
  %1573 = load i64, ptr %r1, align 4
  %1574 = load ptr, ptr %r0, align 8
  %1575 = getelementptr i8, ptr %1574, i64 0
  store i64 %1573, ptr %1575, align 4
  %1576 = load ptr, ptr %r7, align 8
  %1577 = getelementptr i8, ptr %1576, i64 35
  %1578 = load i8, ptr %1577, align 1
  %1579 = zext i8 %1578 to i64
  store i64 %1579, ptr %r1, align 4
  %1580 = load i64, ptr %r1, align 4
  %1581 = and i64 %1580, 253
  store i64 %1581, ptr %r1, align 4
  %1582 = load i64, ptr %r1, align 4
  %1583 = icmp ne i64 %1582, 1
  br i1 %1583, label %bb_inst_643, label %bb_inst_640

bb_inst_640:                                      ; preds = %bb_inst_634
  %1584 = load ptr, ptr %r0, align 8
  %1585 = getelementptr i8, ptr %1584, i64 8
  %1586 = load i64, ptr %1585, align 4
  store i64 %1586, ptr %r1, align 4
  %1587 = load i64, ptr %r1, align 4
  %1588 = add i64 %1587, 1
  store i64 %1588, ptr %r1, align 4
  %1589 = load i64, ptr %r1, align 4
  %1590 = load ptr, ptr %r0, align 8
  %1591 = getelementptr i8, ptr %1590, i64 8
  store i64 %1589, ptr %1591, align 4
  br label %bb_inst_643

bb_inst_643:                                      ; preds = %bb_inst_640, %bb_inst_634
  %1592 = load ptr, ptr %r10, align 8
  %1593 = getelementptr i8, ptr %1592, i64 -144
  %1594 = load i64, ptr %1593, align 4
  store i64 %1594, ptr %r8, align 4
  %1595 = load ptr, ptr %r10, align 8
  %1596 = getelementptr i8, ptr %1595, i64 -152
  %1597 = load i64, ptr %1596, align 4
  store i64 %1597, ptr %r3, align 4
  br label %bb_inst_720

bb_inst_646:                                      ; preds = %bb_inst_405
  %1598 = load i64, ptr %r3, align 4
  %1599 = load ptr, ptr %r10, align 8
  %1600 = getelementptr i8, ptr %1599, i64 -152
  store i64 %1598, ptr %1600, align 4
  store i64 0, ptr %r1, align 4
  %1601 = load i64, ptr %r1, align 4
  %1602 = trunc i64 %1601 to i32
  %1603 = load ptr, ptr %r10, align 8
  %1604 = getelementptr i8, ptr %1603, i64 -120
  store i32 %1602, ptr %1604, align 4
  %1605 = load i64, ptr %r10, align 4
  store i64 %1605, ptr %r2, align 4
  %1606 = load i64, ptr %r2, align 4
  %1607 = add i64 %1606, -120
  store i64 %1607, ptr %r2, align 4
  %1608 = call i64 @__lddw_helper_map_by_fd(i32 14)
  store i64 %1608, ptr %r1, align 4
  %1609 = load i64, ptr %r1, align 4
  %1610 = load i64, ptr %r2, align 4
  %1611 = load i64, ptr %r3, align 4
  %1612 = load i64, ptr %r4, align 4
  %1613 = load i64, ptr %r5, align 4
  %1614 = call i64 @_bpf_helper_ext_0001(i64 %1609, i64 %1610, i64 %1611, i64 %1612, i64 %1613)
  store i64 %1614, ptr %r0, align 4
  br label %bb_inst_654

bb_inst_654:                                      ; preds = %bb_inst_646
  %1615 = load i64, ptr %r0, align 4
  store i64 %1615, ptr %r8, align 4
  %1616 = load i64, ptr %r8, align 4
  %1617 = icmp eq i64 %1616, 0
  br i1 %1617, label %bb_inst_941, label %bb_inst_656

bb_inst_656:                                      ; preds = %bb_inst_654
  %1618 = load ptr, ptr %r10, align 8
  %1619 = getelementptr i8, ptr %1618, i64 -28
  %1620 = load i8, ptr %1619, align 1
  %1621 = zext i8 %1620 to i64
  store i64 %1621, ptr %r2, align 4
  %1622 = load i64, ptr %r2, align 4
  %1623 = and i64 %1622, 1
  store i64 %1623, ptr %r2, align 4
  store i64 54, ptr %r1, align 4
  %1624 = load i64, ptr %r2, align 4
  %1625 = icmp eq i64 %1624, 0
  br i1 %1625, label %bb_inst_661, label %bb_inst_660

bb_inst_660:                                      ; preds = %bb_inst_656
  store i64 102, ptr %r1, align 4
  br label %bb_inst_661

bb_inst_661:                                      ; preds = %bb_inst_660, %bb_inst_656
  %1626 = load i64, ptr %r7, align 4
  %1627 = load i64, ptr %r1, align 4
  %1628 = add i64 %1626, %1627
  store i64 %1628, ptr %r7, align 4
  %1629 = load i64, ptr %r7, align 4
  store i64 %1629, ptr %r1, align 4
  %1630 = load i64, ptr %r1, align 4
  %1631 = add i64 %1630, 9
  store i64 %1631, ptr %r1, align 4
  %1632 = load i64, ptr %r9, align 4
  %1633 = load i64, ptr %r1, align 4
  %1634 = icmp ugt i64 %1633, %1632
  br i1 %1634, label %bb_inst_1218, label %bb_inst_665

bb_inst_665:                                      ; preds = %bb_inst_661
  %1635 = load i64, ptr %r7, align 4
  %1636 = add i64 %1635, 8
  store i64 %1636, ptr %r7, align 4
  %1637 = load ptr, ptr %r7, align 8
  %1638 = getelementptr i8, ptr %1637, i64 0
  %1639 = load i8, ptr %1638, align 1
  %1640 = zext i8 %1639 to i64
  store i64 %1640, ptr %r2, align 4
  %1641 = load i64, ptr %r2, align 4
  %1642 = shl i64 %1641, 56
  store i64 %1642, ptr %r2, align 4
  %1643 = load i64, ptr %r2, align 4
  %1644 = ashr i64 %1643, 56
  store i64 %1644, ptr %r2, align 4
  %1645 = load i64, ptr %r2, align 4
  %1646 = icmp sgt i64 %1645, -1
  br i1 %1646, label %bb_inst_1107, label %bb_inst_670

bb_inst_670:                                      ; preds = %bb_inst_665
  %1647 = load i64, ptr %r7, align 4
  store i64 %1647, ptr %r1, align 4
  %1648 = load i64, ptr %r1, align 4
  %1649 = add i64 %1648, 14
  store i64 %1649, ptr %r1, align 4
  %1650 = load i64, ptr %r9, align 4
  %1651 = load i64, ptr %r1, align 4
  %1652 = icmp ugt i64 %1651, %1650
  br i1 %1652, label %bb_inst_1218, label %bb_inst_673

bb_inst_673:                                      ; preds = %bb_inst_670
  %1653 = load i64, ptr %r2, align 4
  %1654 = and i64 %1653, 32
  store i64 %1654, ptr %r2, align 4
  %1655 = load i64, ptr %r2, align 4
  %1656 = icmp eq i64 %1655, 0
  br i1 %1656, label %bb_inst_1145, label %bb_inst_675

bb_inst_675:                                      ; preds = %bb_inst_673
  %1657 = load ptr, ptr %r7, align 8
  %1658 = getelementptr i8, ptr %1657, i64 5
  %1659 = load i8, ptr %1658, align 1
  %1660 = zext i8 %1659 to i64
  store i64 %1660, ptr %r1, align 4
  %1661 = load i64, ptr %r7, align 4
  %1662 = add i64 %1661, 6
  store i64 %1662, ptr %r7, align 4
  store i64 8, ptr %r2, align 4
  %1663 = load i64, ptr %r1, align 4
  %1664 = load i64, ptr %r2, align 4
  %1665 = icmp ugt i64 %1664, %1663
  br i1 %1665, label %bb_inst_1218, label %bb_inst_679

bb_inst_679:                                      ; preds = %bb_inst_675
  br label %bb_inst_1111

bb_inst_680:                                      ; preds = %bb_inst_623
  store i64 0, ptr %r1, align 4
  %1666 = load i64, ptr %r1, align 4
  %1667 = trunc i64 %1666 to i32
  %1668 = load ptr, ptr %r10, align 8
  %1669 = getelementptr i8, ptr %1668, i64 -120
  store i32 %1667, ptr %1669, align 4
  %1670 = load i64, ptr %r10, align 4
  store i64 %1670, ptr %r2, align 4
  %1671 = load i64, ptr %r2, align 4
  %1672 = add i64 %1671, -120
  store i64 %1672, ptr %r2, align 4
  %1673 = call i64 @__lddw_helper_map_by_fd(i32 14)
  store i64 %1673, ptr %r1, align 4
  %1674 = load i64, ptr %r1, align 4
  %1675 = load i64, ptr %r2, align 4
  %1676 = load i64, ptr %r3, align 4
  %1677 = load i64, ptr %r4, align 4
  %1678 = load i64, ptr %r5, align 4
  %1679 = call i64 @_bpf_helper_ext_0001(i64 %1674, i64 %1675, i64 %1676, i64 %1677, i64 %1678)
  store i64 %1679, ptr %r0, align 4
  br label %bb_inst_687

bb_inst_687:                                      ; preds = %bb_inst_680
  %1680 = load i64, ptr %r0, align 4
  %1681 = icmp eq i64 %1680, 0
  br i1 %1681, label %bb_inst_941, label %bb_inst_688

bb_inst_688:                                      ; preds = %bb_inst_687
  %1682 = load i64, ptr %r0, align 4
  %1683 = load ptr, ptr %r10, align 8
  %1684 = getelementptr i8, ptr %1683, i64 -168
  store i64 %1682, ptr %1684, align 4
  %1685 = load ptr, ptr %r10, align 8
  %1686 = getelementptr i8, ptr %1685, i64 -152
  %1687 = load i64, ptr %1686, align 4
  store i64 %1687, ptr %r1, align 4
  %1688 = load ptr, ptr %r10, align 8
  %1689 = getelementptr i8, ptr %1688, i64 -28
  %1690 = load i8, ptr %1689, align 1
  %1691 = zext i8 %1690 to i64
  store i64 %1691, ptr %r2, align 4
  %1692 = load i64, ptr %r2, align 4
  %1693 = and i64 %1692, 1
  store i64 %1693, ptr %r2, align 4
  store i64 34, ptr %r1, align 4
  %1694 = load i64, ptr %r2, align 4
  %1695 = icmp eq i64 %1694, 0
  br i1 %1695, label %bb_inst_695, label %bb_inst_694

bb_inst_694:                                      ; preds = %bb_inst_688
  store i64 62, ptr %r1, align 4
  br label %bb_inst_695

bb_inst_695:                                      ; preds = %bb_inst_694, %bb_inst_688
  %1696 = load i64, ptr %r7, align 4
  %1697 = load i64, ptr %r1, align 4
  %1698 = add i64 %1696, %1697
  store i64 %1698, ptr %r7, align 4
  %1699 = load i64, ptr %r7, align 4
  store i64 %1699, ptr %r1, align 4
  %1700 = load i64, ptr %r1, align 4
  %1701 = add i64 %1700, 9
  store i64 %1701, ptr %r1, align 4
  %1702 = load i64, ptr %r9, align 4
  %1703 = load i64, ptr %r1, align 4
  %1704 = icmp ugt i64 %1703, %1702
  br i1 %1704, label %bb_inst_714, label %bb_inst_699

bb_inst_699:                                      ; preds = %bb_inst_695
  %1705 = load i64, ptr %r7, align 4
  %1706 = add i64 %1705, 8
  store i64 %1706, ptr %r7, align 4
  %1707 = load ptr, ptr %r7, align 8
  %1708 = getelementptr i8, ptr %1707, i64 0
  %1709 = load i8, ptr %1708, align 1
  %1710 = zext i8 %1709 to i64
  store i64 %1710, ptr %r2, align 4
  %1711 = load i64, ptr %r2, align 4
  %1712 = shl i64 %1711, 56
  store i64 %1712, ptr %r2, align 4
  %1713 = load i64, ptr %r2, align 4
  %1714 = ashr i64 %1713, 56
  store i64 %1714, ptr %r2, align 4
  %1715 = load i64, ptr %r2, align 4
  %1716 = icmp sgt i64 %1715, -1
  br i1 %1716, label %bb_inst_1126, label %bb_inst_704

bb_inst_704:                                      ; preds = %bb_inst_699
  %1717 = load i64, ptr %r7, align 4
  store i64 %1717, ptr %r1, align 4
  %1718 = load i64, ptr %r1, align 4
  %1719 = add i64 %1718, 14
  store i64 %1719, ptr %r1, align 4
  %1720 = load i64, ptr %r9, align 4
  %1721 = load i64, ptr %r1, align 4
  %1722 = icmp ugt i64 %1721, %1720
  br i1 %1722, label %bb_inst_714, label %bb_inst_707

bb_inst_707:                                      ; preds = %bb_inst_704
  %1723 = load i64, ptr %r2, align 4
  %1724 = and i64 %1723, 32
  store i64 %1724, ptr %r2, align 4
  %1725 = load i64, ptr %r2, align 4
  %1726 = icmp eq i64 %1725, 0
  br i1 %1726, label %bb_inst_2032, label %bb_inst_709

bb_inst_709:                                      ; preds = %bb_inst_707
  %1727 = load ptr, ptr %r7, align 8
  %1728 = getelementptr i8, ptr %1727, i64 5
  %1729 = load i8, ptr %1728, align 1
  %1730 = zext i8 %1729 to i64
  store i64 %1730, ptr %r1, align 4
  %1731 = load i64, ptr %r7, align 4
  %1732 = add i64 %1731, 6
  store i64 %1732, ptr %r7, align 4
  store i64 8, ptr %r2, align 4
  %1733 = load i64, ptr %r1, align 4
  %1734 = load i64, ptr %r2, align 4
  %1735 = icmp ugt i64 %1734, %1733
  br i1 %1735, label %bb_inst_714, label %bb_inst_713

bb_inst_713:                                      ; preds = %bb_inst_709
  br label %bb_inst_1130

bb_inst_714:                                      ; preds = %bb_inst_2066, %bb_inst_1135, %bb_inst_1126, %bb_inst_709, %bb_inst_704, %bb_inst_695
  %1736 = load ptr, ptr %r10, align 8
  %1737 = getelementptr i8, ptr %1736, i64 -168
  %1738 = load i64, ptr %1737, align 4
  store i64 %1738, ptr %r2, align 4
  br label %bb_inst_715

bb_inst_715:                                      ; preds = %bb_inst_714, %bb_inst_2101
  %1739 = load ptr, ptr %r2, align 8
  %1740 = getelementptr i8, ptr %1739, i64 0
  %1741 = load i64, ptr %1740, align 4
  store i64 %1741, ptr %r1, align 4
  %1742 = load i64, ptr %r1, align 4
  %1743 = add i64 %1742, 1
  store i64 %1743, ptr %r1, align 4
  %1744 = load i64, ptr %r1, align 4
  %1745 = load ptr, ptr %r2, align 8
  %1746 = getelementptr i8, ptr %1745, i64 0
  store i64 %1744, ptr %1746, align 4
  br label %bb_inst_718

bb_inst_718:                                      ; preds = %bb_inst_715, %bb_inst_2044, %bb_inst_2043
  %1747 = load ptr, ptr %r10, align 8
  %1748 = getelementptr i8, ptr %1747, i64 -152
  %1749 = load i64, ptr %1748, align 4
  store i64 %1749, ptr %r3, align 4
  %1750 = load ptr, ptr %r10, align 8
  %1751 = getelementptr i8, ptr %1750, i64 -144
  %1752 = load i64, ptr %1751, align 4
  store i64 %1752, ptr %r8, align 4
  br label %bb_inst_720

bb_inst_720:                                      ; preds = %bb_inst_718, %bb_inst_643, %bb_inst_619
  %1753 = load ptr, ptr %r10, align 8
  %1754 = getelementptr i8, ptr %1753, i64 -40
  %1755 = load i16, ptr %1754, align 2
  %1756 = zext i16 %1755 to i64
  store i64 %1756, ptr %r1, align 4
  %1757 = load i64, ptr %r1, align 4
  %1758 = load ptr, ptr %r10, align 8
  %1759 = getelementptr i8, ptr %1758, i64 -168
  store i64 %1757, ptr %1759, align 4
  %1760 = load ptr, ptr %r10, align 8
  %1761 = getelementptr i8, ptr %1760, i64 -28
  %1762 = load i8, ptr %1761, align 1
  %1763 = zext i8 %1762 to i64
  store i64 %1763, ptr %r1, align 4
  %1764 = load i64, ptr %r1, align 4
  %1765 = and i64 %1764, 2
  store i64 %1765, ptr %r1, align 4
  %1766 = load i64, ptr %r1, align 4
  %1767 = icmp ne i64 %1766, 0
  br i1 %1767, label %bb_inst_754, label %bb_inst_725

bb_inst_725:                                      ; preds = %bb_inst_720
  %1768 = load ptr, ptr %r8, align 8
  %1769 = getelementptr i8, ptr %1768, i64 0
  %1770 = load i32, ptr %1769, align 4
  %1771 = zext i32 %1770 to i64
  store i64 %1771, ptr %r1, align 4
  %1772 = load i64, ptr %r1, align 4
  %1773 = and i64 %1772, 2
  store i64 %1773, ptr %r1, align 4
  %1774 = load i64, ptr %r1, align 4
  %1775 = icmp ne i64 %1774, 0
  br i1 %1775, label %bb_inst_754, label %bb_inst_728

bb_inst_728:                                      ; preds = %bb_inst_725
  %1776 = load i64, ptr %r10, align 4
  store i64 %1776, ptr %r2, align 4
  %1777 = load i64, ptr %r2, align 4
  %1778 = add i64 %1777, -72
  store i64 %1778, ptr %r2, align 4
  %1779 = load i64, ptr %r3, align 4
  store i64 %1779, ptr %r1, align 4
  %1780 = load i64, ptr %r1, align 4
  %1781 = load i64, ptr %r2, align 4
  %1782 = load i64, ptr %r3, align 4
  %1783 = load i64, ptr %r4, align 4
  %1784 = load i64, ptr %r5, align 4
  %1785 = call i64 @_bpf_helper_ext_0001(i64 %1780, i64 %1781, i64 %1782, i64 %1783, i64 %1784)
  store i64 %1785, ptr %r0, align 4
  br label %bb_inst_732

bb_inst_732:                                      ; preds = %bb_inst_728
  %1786 = load i64, ptr %r0, align 4
  store i64 %1786, ptr %r7, align 4
  %1787 = load i64, ptr %r7, align 4
  %1788 = icmp eq i64 %1787, 0
  br i1 %1788, label %bb_inst_754, label %bb_inst_734

bb_inst_734:                                      ; preds = %bb_inst_732
  %1789 = load ptr, ptr %r10, align 8
  %1790 = getelementptr i8, ptr %1789, i64 -36
  %1791 = load i8, ptr %1790, align 1
  %1792 = zext i8 %1791 to i64
  store i64 %1792, ptr %r1, align 4
  %1793 = load i64, ptr %r1, align 4
  %1794 = icmp ne i64 %1793, 17
  br i1 %1794, label %bb_inst_744, label %bb_inst_736

bb_inst_736:                                      ; preds = %bb_inst_734
  %1795 = load i64, ptr %r1, align 4
  %1796 = load i64, ptr %r2, align 4
  %1797 = load i64, ptr %r3, align 4
  %1798 = load i64, ptr %r4, align 4
  %1799 = load i64, ptr %r5, align 4
  %1800 = call i64 @_bpf_helper_ext_0005(i64 %1795, i64 %1796, i64 %1797, i64 %1798, i64 %1799)
  store i64 %1800, ptr %r0, align 4
  br label %bb_inst_737

bb_inst_737:                                      ; preds = %bb_inst_736
  %1801 = load ptr, ptr %r7, align 8
  %1802 = getelementptr i8, ptr %1801, i64 8
  %1803 = load i64, ptr %1802, align 4
  store i64 %1803, ptr %r1, align 4
  %1804 = load i64, ptr %r0, align 4
  store i64 %1804, ptr %r2, align 4
  %1805 = load i64, ptr %r2, align 4
  %1806 = load i64, ptr %r1, align 4
  %1807 = sub i64 %1805, %1806
  store i64 %1807, ptr %r2, align 4
  store i64 30000000000, ptr %r1, align 4
  %1808 = load i64, ptr %r1, align 4
  %1809 = load i64, ptr %r2, align 4
  %1810 = icmp ugt i64 %1809, %1808
  br i1 %1810, label %bb_inst_754, label %bb_inst_743

bb_inst_743:                                      ; preds = %bb_inst_737
  %1811 = load i64, ptr %r0, align 4
  %1812 = load ptr, ptr %r7, align 8
  %1813 = getelementptr i8, ptr %1812, i64 8
  store i64 %1811, ptr %1813, align 4
  br label %bb_inst_744

bb_inst_744:                                      ; preds = %bb_inst_743, %bb_inst_734
  %1814 = load ptr, ptr %r7, align 8
  %1815 = getelementptr i8, ptr %1814, i64 0
  %1816 = load i32, ptr %1815, align 4
  %1817 = zext i32 %1816 to i64
  store i64 %1817, ptr %r1, align 4
  %1818 = load i64, ptr %r1, align 4
  %1819 = trunc i64 %1818 to i32
  %1820 = load ptr, ptr %r10, align 8
  %1821 = getelementptr i8, ptr %1820, i64 -32
  store i32 %1819, ptr %1821, align 4
  %1822 = load i64, ptr %r1, align 4
  %1823 = trunc i64 %1822 to i32
  %1824 = load ptr, ptr %r10, align 8
  %1825 = getelementptr i8, ptr %1824, i64 -16
  store i32 %1823, ptr %1825, align 4
  %1826 = load i64, ptr %r10, align 4
  store i64 %1826, ptr %r2, align 4
  %1827 = load i64, ptr %r2, align 4
  %1828 = add i64 %1827, -16
  store i64 %1828, ptr %r2, align 4
  %1829 = call i64 @__lddw_helper_map_by_fd(i32 9)
  store i64 %1829, ptr %r1, align 4
  %1830 = load i64, ptr %r1, align 4
  %1831 = load i64, ptr %r2, align 4
  %1832 = load i64, ptr %r3, align 4
  %1833 = load i64, ptr %r4, align 4
  %1834 = load i64, ptr %r5, align 4
  %1835 = call i64 @_bpf_helper_ext_0001(i64 %1830, i64 %1831, i64 %1832, i64 %1833, i64 %1834)
  store i64 %1835, ptr %r0, align 4
  br label %bb_inst_752

bb_inst_752:                                      ; preds = %bb_inst_744
  %1836 = load i64, ptr %r0, align 4
  %1837 = load ptr, ptr %r10, align 8
  %1838 = getelementptr i8, ptr %1837, i64 -176
  store i64 %1836, ptr %1838, align 4
  %1839 = load i64, ptr %r0, align 4
  %1840 = icmp ne i64 %1839, 0
  br i1 %1840, label %bb_inst_997, label %bb_inst_754

bb_inst_754:                                      ; preds = %bb_inst_752, %bb_inst_737, %bb_inst_732, %bb_inst_725, %bb_inst_720
  %1841 = load ptr, ptr %r10, align 8
  %1842 = getelementptr i8, ptr %1841, i64 -36
  %1843 = load i8, ptr %1842, align 1
  %1844 = zext i8 %1843 to i64
  store i64 %1844, ptr %r1, align 4
  %1845 = load i64, ptr %r1, align 4
  %1846 = icmp ne i64 %1845, 6
  br i1 %1846, label %bb_inst_774, label %bb_inst_756

bb_inst_756:                                      ; preds = %bb_inst_754
  store i64 513, ptr %r1, align 4
  %1847 = load i64, ptr %r1, align 4
  %1848 = trunc i64 %1847 to i32
  %1849 = load ptr, ptr %r10, align 8
  %1850 = getelementptr i8, ptr %1849, i64 -16
  store i32 %1848, ptr %1850, align 4
  %1851 = load i64, ptr %r10, align 4
  store i64 %1851, ptr %r2, align 4
  %1852 = load i64, ptr %r2, align 4
  %1853 = add i64 %1852, -16
  store i64 %1853, ptr %r2, align 4
  %1854 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %1854, ptr %r1, align 4
  %1855 = load i64, ptr %r1, align 4
  %1856 = load i64, ptr %r2, align 4
  %1857 = load i64, ptr %r3, align 4
  %1858 = load i64, ptr %r4, align 4
  %1859 = load i64, ptr %r5, align 4
  %1860 = call i64 @_bpf_helper_ext_0001(i64 %1855, i64 %1856, i64 %1857, i64 %1858, i64 %1859)
  store i64 %1860, ptr %r0, align 4
  br label %bb_inst_763

bb_inst_763:                                      ; preds = %bb_inst_756
  %1861 = load i64, ptr %r0, align 4
  %1862 = icmp eq i64 %1861, 0
  br i1 %1862, label %bb_inst_941, label %bb_inst_764

bb_inst_764:                                      ; preds = %bb_inst_763
  %1863 = load ptr, ptr %r10, align 8
  %1864 = getelementptr i8, ptr %1863, i64 -28
  %1865 = load i8, ptr %1864, align 1
  %1866 = zext i8 %1865 to i64
  store i64 %1866, ptr %r2, align 4
  %1867 = load i64, ptr %r2, align 4
  %1868 = and i64 %1867, 2
  store i64 %1868, ptr %r2, align 4
  store i64 1, ptr %r1, align 4
  %1869 = load i64, ptr %r2, align 4
  %1870 = icmp eq i64 %1869, 0
  br i1 %1870, label %bb_inst_769, label %bb_inst_768

bb_inst_768:                                      ; preds = %bb_inst_764
  store i64 0, ptr %r1, align 4
  br label %bb_inst_769

bb_inst_769:                                      ; preds = %bb_inst_768, %bb_inst_764
  %1871 = load i64, ptr %r1, align 4
  %1872 = shl i64 %1871, 3
  store i64 %1872, ptr %r1, align 4
  %1873 = load i64, ptr %r0, align 4
  %1874 = load i64, ptr %r1, align 4
  %1875 = add i64 %1873, %1874
  store i64 %1875, ptr %r0, align 4
  %1876 = load ptr, ptr %r0, align 8
  %1877 = getelementptr i8, ptr %1876, i64 0
  %1878 = load i64, ptr %1877, align 4
  store i64 %1878, ptr %r1, align 4
  %1879 = load i64, ptr %r1, align 4
  %1880 = add i64 %1879, 1
  store i64 %1880, ptr %r1, align 4
  %1881 = load i64, ptr %r1, align 4
  %1882 = load ptr, ptr %r0, align 8
  %1883 = getelementptr i8, ptr %1882, i64 0
  store i64 %1881, ptr %1883, align 4
  br label %bb_inst_774

bb_inst_774:                                      ; preds = %bb_inst_769, %bb_inst_754
  store i64 0, ptr %r8, align 4
  %1884 = load i64, ptr %r8, align 4
  %1885 = load ptr, ptr %r10, align 8
  %1886 = getelementptr i8, ptr %1885, i64 -8
  store i64 %1884, ptr %1886, align 4
  %1887 = load i64, ptr %r8, align 4
  %1888 = load ptr, ptr %r10, align 8
  %1889 = getelementptr i8, ptr %1888, i64 -16
  store i64 %1887, ptr %1889, align 4
  store i64 514, ptr %r1, align 4
  %1890 = load i64, ptr %r1, align 4
  %1891 = trunc i64 %1890 to i32
  %1892 = load ptr, ptr %r10, align 8
  %1893 = getelementptr i8, ptr %1892, i64 -120
  store i32 %1891, ptr %1893, align 4
  %1894 = load i64, ptr %r10, align 4
  store i64 %1894, ptr %r2, align 4
  %1895 = load i64, ptr %r2, align 4
  %1896 = add i64 %1895, -120
  store i64 %1896, ptr %r2, align 4
  %1897 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %1897, ptr %r1, align 4
  %1898 = load i64, ptr %r1, align 4
  %1899 = load i64, ptr %r2, align 4
  %1900 = load i64, ptr %r3, align 4
  %1901 = load i64, ptr %r4, align 4
  %1902 = load i64, ptr %r5, align 4
  %1903 = call i64 @_bpf_helper_ext_0001(i64 %1898, i64 %1899, i64 %1900, i64 %1901, i64 %1902)
  store i64 %1903, ptr %r0, align 4
  br label %bb_inst_784

bb_inst_784:                                      ; preds = %bb_inst_774
  %1904 = load i64, ptr %r0, align 4
  store i64 %1904, ptr %r7, align 4
  store i64 1, ptr %r9, align 4
  %1905 = load i64, ptr %r7, align 4
  %1906 = icmp eq i64 %1905, 0
  br i1 %1906, label %bb_inst_803, label %bb_inst_787

bb_inst_787:                                      ; preds = %bb_inst_784
  %1907 = load i64, ptr %r1, align 4
  %1908 = load i64, ptr %r2, align 4
  %1909 = load i64, ptr %r3, align 4
  %1910 = load i64, ptr %r4, align 4
  %1911 = load i64, ptr %r5, align 4
  %1912 = call i64 @_bpf_helper_ext_0005(i64 %1907, i64 %1908, i64 %1909, i64 %1910, i64 %1911)
  store i64 %1912, ptr %r0, align 4
  br label %bb_inst_788

bb_inst_788:                                      ; preds = %bb_inst_787
  %1913 = load i64, ptr %r0, align 4
  store i64 %1913, ptr %r8, align 4
  %1914 = load ptr, ptr %r7, align 8
  %1915 = getelementptr i8, ptr %1914, i64 8
  %1916 = load i64, ptr %1915, align 4
  store i64 %1916, ptr %r1, align 4
  %1917 = load i64, ptr %r8, align 4
  store i64 %1917, ptr %r2, align 4
  %1918 = load i64, ptr %r2, align 4
  %1919 = load i64, ptr %r1, align 4
  %1920 = sub i64 %1918, %1919
  store i64 %1920, ptr %r2, align 4
  store i64 1000000001, ptr %r1, align 4
  %1921 = load i64, ptr %r2, align 4
  %1922 = load i64, ptr %r1, align 4
  %1923 = icmp ugt i64 %1922, %1921
  br i1 %1923, label %bb_inst_798, label %bb_inst_794

bb_inst_794:                                      ; preds = %bb_inst_788
  %1924 = load i64, ptr %r8, align 4
  %1925 = load ptr, ptr %r7, align 8
  %1926 = getelementptr i8, ptr %1925, i64 8
  store i64 %1924, ptr %1926, align 4
  store i64 1, ptr %r1, align 4
  %1927 = load i64, ptr %r1, align 4
  %1928 = load ptr, ptr %r7, align 8
  %1929 = getelementptr i8, ptr %1928, i64 0
  store i64 %1927, ptr %1929, align 4
  br label %bb_inst_802

bb_inst_798:                                      ; preds = %bb_inst_788
  %1930 = load ptr, ptr %r7, align 8
  %1931 = getelementptr i8, ptr %1930, i64 0
  %1932 = load i64, ptr %1931, align 4
  store i64 %1932, ptr %r1, align 4
  %1933 = load i64, ptr %r1, align 4
  %1934 = add i64 %1933, 1
  store i64 %1934, ptr %r1, align 4
  %1935 = load i64, ptr %r1, align 4
  %1936 = load ptr, ptr %r7, align 8
  %1937 = getelementptr i8, ptr %1936, i64 0
  store i64 %1935, ptr %1937, align 4
  %1938 = load i64, ptr %r1, align 4
  %1939 = icmp ugt i64 %1938, 125000
  br i1 %1939, label %bb_inst_803, label %bb_inst_802

bb_inst_802:                                      ; preds = %bb_inst_798, %bb_inst_794
  store i64 0, ptr %r9, align 4
  br label %bb_inst_803

bb_inst_803:                                      ; preds = %bb_inst_802, %bb_inst_798, %bb_inst_784
  %1940 = load ptr, ptr %r10, align 8
  %1941 = getelementptr i8, ptr %1940, i64 -144
  %1942 = load i64, ptr %1941, align 4
  store i64 %1942, ptr %r1, align 4
  %1943 = load ptr, ptr %r1, align 8
  %1944 = getelementptr i8, ptr %1943, i64 0
  %1945 = load i32, ptr %1944, align 4
  %1946 = zext i32 %1945 to i64
  store i64 %1946, ptr %r1, align 4
  %1947 = load i64, ptr %r1, align 4
  %1948 = and i64 %1947, 8
  store i64 %1948, ptr %r1, align 4
  %1949 = load i64, ptr %r1, align 4
  %1950 = icmp ne i64 %1949, 0
  br i1 %1950, label %bb_inst_809, label %bb_inst_807

bb_inst_807:                                      ; preds = %bb_inst_803
  %1951 = load ptr, ptr %r10, align 8
  %1952 = getelementptr i8, ptr %1951, i64 -72
  %1953 = load i32, ptr %1952, align 4
  %1954 = zext i32 %1953 to i64
  store i64 %1954, ptr %r5, align 4
  br label %bb_inst_815

bb_inst_809:                                      ; preds = %bb_inst_803
  %1955 = load ptr, ptr %r10, align 8
  %1956 = getelementptr i8, ptr %1955, i64 -136
  %1957 = load i64, ptr %1956, align 4
  store i64 %1957, ptr %r1, align 4
  %1958 = load ptr, ptr %r1, align 8
  %1959 = getelementptr i8, ptr %1958, i64 2
  %1960 = load i16, ptr %1959, align 2
  %1961 = zext i16 %1960 to i64
  store i64 %1961, ptr %r1, align 4
  %1962 = load i64, ptr %r1, align 4
  %1963 = trunc i64 %1962 to i16
  %1964 = load ptr, ptr %r10, align 8
  %1965 = getelementptr i8, ptr %1964, i64 -40
  store i16 %1963, ptr %1965, align 2
  store i64 0, ptr %r5, align 4
  %1966 = load i64, ptr %r5, align 4
  %1967 = load ptr, ptr %r10, align 8
  %1968 = getelementptr i8, ptr %1967, i64 -72
  store i64 %1966, ptr %1968, align 4
  %1969 = load i64, ptr %r5, align 4
  %1970 = load ptr, ptr %r10, align 8
  %1971 = getelementptr i8, ptr %1970, i64 -64
  store i64 %1969, ptr %1971, align 4
  br label %bb_inst_815

bb_inst_815:                                      ; preds = %bb_inst_809, %bb_inst_807
  %1972 = load ptr, ptr %r10, align 8
  %1973 = getelementptr i8, ptr %1972, i64 -40
  %1974 = load i32, ptr %1973, align 4
  %1975 = zext i32 %1974 to i64
  store i64 %1975, ptr %r3, align 4
  %1976 = load i64, ptr %r3, align 4
  %1977 = add i64 %1976, -525483785
  store i64 %1977, ptr %r3, align 4
  store i64 4294705152, ptr %r1, align 4
  %1978 = load i64, ptr %r3, align 4
  store i64 %1978, ptr %r2, align 4
  %1979 = load i64, ptr %r2, align 4
  %1980 = load i64, ptr %r1, align 4
  %1981 = and i64 %1979, %1980
  store i64 %1981, ptr %r2, align 4
  %1982 = load i64, ptr %r2, align 4
  %1983 = lshr i64 %1982, 18
  store i64 %1983, ptr %r2, align 4
  %1984 = load i64, ptr %r3, align 4
  store i64 %1984, ptr %r4, align 4
  %1985 = load i64, ptr %r4, align 4
  %1986 = shl i64 %1985, 14
  store i64 %1986, ptr %r4, align 4
  %1987 = load i64, ptr %r4, align 4
  %1988 = load i64, ptr %r2, align 4
  %1989 = or i64 %1987, %1988
  store i64 %1989, ptr %r4, align 4
  %1990 = load i64, ptr %r3, align 4
  store i64 %1990, ptr %r2, align 4
  %1991 = load i64, ptr %r2, align 4
  %1992 = xor i64 %1991, -525483785
  store i64 %1992, ptr %r2, align 4
  %1993 = load i64, ptr %r2, align 4
  %1994 = load i64, ptr %r4, align 4
  %1995 = sub i64 %1993, %1994
  store i64 %1995, ptr %r2, align 4
  store i64 4292870144, ptr %r4, align 4
  %1996 = load i64, ptr %r2, align 4
  store i64 %1996, ptr %r0, align 4
  %1997 = load i64, ptr %r0, align 4
  %1998 = load i64, ptr %r4, align 4
  %1999 = and i64 %1997, %1998
  store i64 %1999, ptr %r0, align 4
  %2000 = load i64, ptr %r0, align 4
  %2001 = lshr i64 %2000, 21
  store i64 %2001, ptr %r0, align 4
  %2002 = load i64, ptr %r2, align 4
  store i64 %2002, ptr %r7, align 4
  %2003 = load i64, ptr %r7, align 4
  %2004 = shl i64 %2003, 11
  store i64 %2004, ptr %r7, align 4
  %2005 = load i64, ptr %r7, align 4
  %2006 = load i64, ptr %r0, align 4
  %2007 = or i64 %2005, %2006
  store i64 %2007, ptr %r7, align 4
  %2008 = load i64, ptr %r5, align 4
  %2009 = add i64 %2008, -525483785
  store i64 %2009, ptr %r5, align 4
  %2010 = load i64, ptr %r2, align 4
  store i64 %2010, ptr %r4, align 4
  %2011 = load i64, ptr %r4, align 4
  %2012 = load i64, ptr %r5, align 4
  %2013 = xor i64 %2011, %2012
  store i64 %2013, ptr %r4, align 4
  %2014 = load i64, ptr %r4, align 4
  %2015 = load i64, ptr %r7, align 4
  %2016 = sub i64 %2014, %2015
  store i64 %2016, ptr %r4, align 4
  store i64 4294967168, ptr %r5, align 4
  %2017 = load i64, ptr %r4, align 4
  store i64 %2017, ptr %r0, align 4
  %2018 = load i64, ptr %r0, align 4
  %2019 = load i64, ptr %r5, align 4
  %2020 = and i64 %2018, %2019
  store i64 %2020, ptr %r0, align 4
  %2021 = load i64, ptr %r0, align 4
  %2022 = lshr i64 %2021, 7
  store i64 %2022, ptr %r0, align 4
  %2023 = load i64, ptr %r4, align 4
  store i64 %2023, ptr %r7, align 4
  %2024 = load i64, ptr %r7, align 4
  %2025 = shl i64 %2024, 25
  store i64 %2025, ptr %r7, align 4
  %2026 = load i64, ptr %r7, align 4
  %2027 = load i64, ptr %r0, align 4
  %2028 = or i64 %2026, %2027
  store i64 %2028, ptr %r7, align 4
  %2029 = load i64, ptr %r4, align 4
  store i64 %2029, ptr %r5, align 4
  %2030 = load i64, ptr %r5, align 4
  %2031 = load i64, ptr %r3, align 4
  %2032 = xor i64 %2030, %2031
  store i64 %2032, ptr %r5, align 4
  %2033 = load i64, ptr %r5, align 4
  %2034 = load i64, ptr %r7, align 4
  %2035 = sub i64 %2033, %2034
  store i64 %2035, ptr %r5, align 4
  store i64 4294901760, ptr %r3, align 4
  %2036 = load i64, ptr %r5, align 4
  store i64 %2036, ptr %r0, align 4
  %2037 = load i64, ptr %r0, align 4
  %2038 = load i64, ptr %r3, align 4
  %2039 = and i64 %2037, %2038
  store i64 %2039, ptr %r0, align 4
  %2040 = load i64, ptr %r0, align 4
  %2041 = lshr i64 %2040, 16
  store i64 %2041, ptr %r0, align 4
  %2042 = load i64, ptr %r5, align 4
  store i64 %2042, ptr %r7, align 4
  %2043 = load i64, ptr %r7, align 4
  %2044 = shl i64 %2043, 16
  store i64 %2044, ptr %r7, align 4
  %2045 = load i64, ptr %r7, align 4
  %2046 = load i64, ptr %r0, align 4
  %2047 = or i64 %2045, %2046
  store i64 %2047, ptr %r7, align 4
  %2048 = load i64, ptr %r5, align 4
  store i64 %2048, ptr %r3, align 4
  %2049 = load i64, ptr %r3, align 4
  %2050 = load i64, ptr %r2, align 4
  %2051 = xor i64 %2049, %2050
  store i64 %2051, ptr %r3, align 4
  %2052 = load i64, ptr %r3, align 4
  %2053 = load i64, ptr %r7, align 4
  %2054 = sub i64 %2052, %2053
  store i64 %2054, ptr %r3, align 4
  store i64 4026531840, ptr %r2, align 4
  %2055 = load i64, ptr %r3, align 4
  store i64 %2055, ptr %r0, align 4
  %2056 = load i64, ptr %r0, align 4
  %2057 = load i64, ptr %r2, align 4
  %2058 = and i64 %2056, %2057
  store i64 %2058, ptr %r0, align 4
  %2059 = load i64, ptr %r0, align 4
  %2060 = lshr i64 %2059, 28
  store i64 %2060, ptr %r0, align 4
  %2061 = load i64, ptr %r3, align 4
  store i64 %2061, ptr %r7, align 4
  %2062 = load i64, ptr %r7, align 4
  %2063 = shl i64 %2062, 4
  store i64 %2063, ptr %r7, align 4
  %2064 = load i64, ptr %r7, align 4
  %2065 = load i64, ptr %r0, align 4
  %2066 = or i64 %2064, %2065
  store i64 %2066, ptr %r7, align 4
  %2067 = load i64, ptr %r3, align 4
  store i64 %2067, ptr %r2, align 4
  %2068 = load i64, ptr %r2, align 4
  %2069 = load i64, ptr %r4, align 4
  %2070 = xor i64 %2068, %2069
  store i64 %2070, ptr %r2, align 4
  %2071 = load i64, ptr %r2, align 4
  %2072 = load i64, ptr %r7, align 4
  %2073 = sub i64 %2071, %2072
  store i64 %2073, ptr %r2, align 4
  %2074 = load i64, ptr %r2, align 4
  store i64 %2074, ptr %r4, align 4
  %2075 = load i64, ptr %r4, align 4
  %2076 = load i64, ptr %r1, align 4
  %2077 = and i64 %2075, %2076
  store i64 %2077, ptr %r4, align 4
  %2078 = load i64, ptr %r4, align 4
  %2079 = lshr i64 %2078, 18
  store i64 %2079, ptr %r4, align 4
  %2080 = load i64, ptr %r2, align 4
  store i64 %2080, ptr %r1, align 4
  %2081 = load i64, ptr %r1, align 4
  %2082 = shl i64 %2081, 14
  store i64 %2082, ptr %r1, align 4
  %2083 = load i64, ptr %r1, align 4
  %2084 = load i64, ptr %r4, align 4
  %2085 = or i64 %2083, %2084
  store i64 %2085, ptr %r1, align 4
  %2086 = load i64, ptr %r2, align 4
  %2087 = load i64, ptr %r5, align 4
  %2088 = xor i64 %2086, %2087
  store i64 %2088, ptr %r2, align 4
  %2089 = load i64, ptr %r2, align 4
  %2090 = load i64, ptr %r1, align 4
  %2091 = sub i64 %2089, %2090
  store i64 %2091, ptr %r2, align 4
  store i64 4294967040, ptr %r1, align 4
  %2092 = load i64, ptr %r2, align 4
  store i64 %2092, ptr %r4, align 4
  %2093 = load i64, ptr %r4, align 4
  %2094 = load i64, ptr %r1, align 4
  %2095 = and i64 %2093, %2094
  store i64 %2095, ptr %r4, align 4
  %2096 = load i64, ptr %r4, align 4
  %2097 = lshr i64 %2096, 8
  store i64 %2097, ptr %r4, align 4
  %2098 = load i64, ptr %r2, align 4
  store i64 %2098, ptr %r1, align 4
  %2099 = load i64, ptr %r1, align 4
  %2100 = shl i64 %2099, 24
  store i64 %2100, ptr %r1, align 4
  %2101 = load i64, ptr %r1, align 4
  %2102 = load i64, ptr %r4, align 4
  %2103 = or i64 %2101, %2102
  store i64 %2103, ptr %r1, align 4
  %2104 = load i64, ptr %r2, align 4
  %2105 = load i64, ptr %r3, align 4
  %2106 = xor i64 %2104, %2105
  store i64 %2106, ptr %r2, align 4
  %2107 = load i64, ptr %r2, align 4
  %2108 = load i64, ptr %r1, align 4
  %2109 = sub i64 %2107, %2108
  store i64 %2109, ptr %r2, align 4
  %2110 = load i64, ptr %r2, align 4
  store i64 %2110, ptr %r1, align 4
  %2111 = load i64, ptr %r1, align 4
  %2112 = shl i64 %2111, 32
  store i64 %2112, ptr %r1, align 4
  %2113 = load i64, ptr %r1, align 4
  %2114 = lshr i64 %2113, 32
  store i64 %2114, ptr %r1, align 4
  %2115 = load i64, ptr %r1, align 4
  %2116 = udiv i64 %2115, 65537
  %2117 = select i1 false, i64 0, i64 %2116
  store i64 %2117, ptr %r1, align 4
  %2118 = load i64, ptr %r1, align 4
  %2119 = mul i64 %2118, 65537
  store i64 %2119, ptr %r1, align 4
  %2120 = load i64, ptr %r2, align 4
  %2121 = load i64, ptr %r1, align 4
  %2122 = sub i64 %2120, %2121
  store i64 %2122, ptr %r2, align 4
  %2123 = load ptr, ptr %r10, align 8
  %2124 = getelementptr i8, ptr %2123, i64 -144
  %2125 = load i64, ptr %2124, align 4
  store i64 %2125, ptr %r1, align 4
  %2126 = load ptr, ptr %r1, align 8
  %2127 = getelementptr i8, ptr %2126, i64 4
  %2128 = load i32, ptr %2127, align 4
  %2129 = zext i32 %2128 to i64
  store i64 %2129, ptr %r1, align 4
  %2130 = load i64, ptr %r1, align 4
  %2131 = mul i64 %2130, 65537
  store i64 %2131, ptr %r1, align 4
  %2132 = load i64, ptr %r2, align 4
  %2133 = load i64, ptr %r1, align 4
  %2134 = add i64 %2132, %2133
  store i64 %2134, ptr %r2, align 4
  %2135 = load i64, ptr %r2, align 4
  %2136 = trunc i64 %2135 to i32
  %2137 = load ptr, ptr %r10, align 8
  %2138 = getelementptr i8, ptr %2137, i64 -20
  store i32 %2136, ptr %2138, align 4
  %2139 = load i64, ptr %r10, align 4
  store i64 %2139, ptr %r2, align 4
  %2140 = load i64, ptr %r2, align 4
  %2141 = add i64 %2140, -20
  store i64 %2141, ptr %r2, align 4
  %2142 = call i64 @__lddw_helper_map_by_fd(i32 7)
  store i64 %2142, ptr %r1, align 4
  %2143 = load i64, ptr %r1, align 4
  %2144 = load i64, ptr %r2, align 4
  %2145 = load i64, ptr %r3, align 4
  %2146 = load i64, ptr %r4, align 4
  %2147 = load i64, ptr %r5, align 4
  %2148 = call i64 @_bpf_helper_ext_0001(i64 %2143, i64 %2144, i64 %2145, i64 %2146, i64 %2147)
  store i64 %2148, ptr %r0, align 4
  br label %bb_inst_907

bb_inst_907:                                      ; preds = %bb_inst_815
  %2149 = load i64, ptr %r0, align 4
  %2150 = icmp eq i64 %2149, 0
  br i1 %2150, label %bb_inst_941, label %bb_inst_908

bb_inst_908:                                      ; preds = %bb_inst_907
  %2151 = load ptr, ptr %r0, align 8
  %2152 = getelementptr i8, ptr %2151, i64 0
  %2153 = load i32, ptr %2152, align 4
  %2154 = zext i32 %2153 to i64
  store i64 %2154, ptr %r1, align 4
  %2155 = load i64, ptr %r1, align 4
  %2156 = trunc i64 %2155 to i32
  %2157 = load ptr, ptr %r10, align 8
  %2158 = getelementptr i8, ptr %2157, i64 -20
  store i32 %2156, ptr %2158, align 4
  %2159 = load i64, ptr %r1, align 4
  %2160 = icmp ne i64 %2159, 0
  br i1 %2160, label %bb_inst_923, label %bb_inst_911

bb_inst_911:                                      ; preds = %bb_inst_908
  store i64 521, ptr %r1, align 4
  %2161 = load i64, ptr %r1, align 4
  %2162 = trunc i64 %2161 to i32
  %2163 = load ptr, ptr %r10, align 8
  %2164 = getelementptr i8, ptr %2163, i64 -120
  store i32 %2162, ptr %2164, align 4
  %2165 = load i64, ptr %r10, align 4
  store i64 %2165, ptr %r2, align 4
  %2166 = load i64, ptr %r2, align 4
  %2167 = add i64 %2166, -120
  store i64 %2167, ptr %r2, align 4
  %2168 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %2168, ptr %r1, align 4
  %2169 = load i64, ptr %r1, align 4
  %2170 = load i64, ptr %r2, align 4
  %2171 = load i64, ptr %r3, align 4
  %2172 = load i64, ptr %r4, align 4
  %2173 = load i64, ptr %r5, align 4
  %2174 = call i64 @_bpf_helper_ext_0001(i64 %2169, i64 %2170, i64 %2171, i64 %2172, i64 %2173)
  store i64 %2174, ptr %r0, align 4
  br label %bb_inst_918

bb_inst_918:                                      ; preds = %bb_inst_911
  %2175 = load i64, ptr %r0, align 4
  %2176 = icmp eq i64 %2175, 0
  br i1 %2176, label %bb_inst_922, label %bb_inst_919

bb_inst_919:                                      ; preds = %bb_inst_918
  %2177 = load ptr, ptr %r0, align 8
  %2178 = getelementptr i8, ptr %2177, i64 8
  %2179 = load i64, ptr %2178, align 4
  store i64 %2179, ptr %r1, align 4
  %2180 = load i64, ptr %r1, align 4
  %2181 = add i64 %2180, 1
  store i64 %2181, ptr %r1, align 4
  %2182 = load i64, ptr %r1, align 4
  %2183 = load ptr, ptr %r0, align 8
  %2184 = getelementptr i8, ptr %2183, i64 8
  store i64 %2182, ptr %2184, align 4
  br label %bb_inst_922

bb_inst_922:                                      ; preds = %bb_inst_919, %bb_inst_918
  %2185 = load ptr, ptr %r10, align 8
  %2186 = getelementptr i8, ptr %2185, i64 -20
  %2187 = load i32, ptr %2186, align 4
  %2188 = zext i32 %2187 to i64
  store i64 %2188, ptr %r1, align 4
  br label %bb_inst_923

bb_inst_923:                                      ; preds = %bb_inst_922, %bb_inst_908
  %2189 = load i64, ptr %r1, align 4
  %2190 = trunc i64 %2189 to i32
  %2191 = load ptr, ptr %r10, align 8
  %2192 = getelementptr i8, ptr %2191, i64 -32
  store i32 %2190, ptr %2192, align 4
  %2193 = load i64, ptr %r10, align 4
  store i64 %2193, ptr %r2, align 4
  %2194 = load i64, ptr %r2, align 4
  %2195 = add i64 %2194, -20
  store i64 %2195, ptr %r2, align 4
  %2196 = call i64 @__lddw_helper_map_by_fd(i32 9)
  store i64 %2196, ptr %r1, align 4
  %2197 = load i64, ptr %r1, align 4
  %2198 = load i64, ptr %r2, align 4
  %2199 = load i64, ptr %r3, align 4
  %2200 = load i64, ptr %r4, align 4
  %2201 = load i64, ptr %r5, align 4
  %2202 = call i64 @_bpf_helper_ext_0001(i64 %2197, i64 %2198, i64 %2199, i64 %2200, i64 %2201)
  store i64 %2202, ptr %r0, align 4
  br label %bb_inst_929

bb_inst_929:                                      ; preds = %bb_inst_923
  %2203 = load i64, ptr %r0, align 4
  %2204 = icmp ne i64 %2203, 0
  br i1 %2204, label %bb_inst_944, label %bb_inst_930

bb_inst_930:                                      ; preds = %bb_inst_929
  store i64 521, ptr %r1, align 4
  %2205 = load i64, ptr %r1, align 4
  %2206 = trunc i64 %2205 to i32
  %2207 = load ptr, ptr %r10, align 8
  %2208 = getelementptr i8, ptr %2207, i64 -120
  store i32 %2206, ptr %2208, align 4
  %2209 = load i64, ptr %r10, align 4
  store i64 %2209, ptr %r2, align 4
  %2210 = load i64, ptr %r2, align 4
  %2211 = add i64 %2210, -120
  store i64 %2211, ptr %r2, align 4
  %2212 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %2212, ptr %r1, align 4
  %2213 = load i64, ptr %r1, align 4
  %2214 = load i64, ptr %r2, align 4
  %2215 = load i64, ptr %r3, align 4
  %2216 = load i64, ptr %r4, align 4
  %2217 = load i64, ptr %r5, align 4
  %2218 = call i64 @_bpf_helper_ext_0001(i64 %2213, i64 %2214, i64 %2215, i64 %2216, i64 %2217)
  store i64 %2218, ptr %r0, align 4
  br label %bb_inst_937

bb_inst_937:                                      ; preds = %bb_inst_930
  %2219 = load i64, ptr %r0, align 4
  %2220 = icmp eq i64 %2219, 0
  br i1 %2220, label %bb_inst_941, label %bb_inst_938

bb_inst_938:                                      ; preds = %bb_inst_1621, %bb_inst_937
  %2221 = load ptr, ptr %r0, align 8
  %2222 = getelementptr i8, ptr %2221, i64 0
  %2223 = load i64, ptr %2222, align 4
  store i64 %2223, ptr %r1, align 4
  %2224 = load i64, ptr %r1, align 4
  %2225 = add i64 %2224, 1
  store i64 %2225, ptr %r1, align 4
  %2226 = load i64, ptr %r1, align 4
  %2227 = load ptr, ptr %r0, align 8
  %2228 = getelementptr i8, ptr %2227, i64 0
  store i64 %2226, ptr %2228, align 4
  br label %bb_inst_941

bb_inst_941:                                      ; preds = %bb_inst_938, %bb_inst_2096, %bb_inst_1679, %bb_inst_1649, %bb_inst_1620, %bb_inst_1587, %bb_inst_1269, %bb_inst_1208, %bb_inst_989, %bb_inst_972, %bb_inst_937, %bb_inst_907, %bb_inst_763, %bb_inst_687, %bb_inst_654, %bb_inst_633, %bb_inst_612, %bb_inst_506, %bb_inst_416, %bb_inst_394
  store i64 1, ptr %r8, align 4
  br label %bb_inst_942

bb_inst_942:                                      ; preds = %bb_inst_941, %bb_inst_1935, %bb_inst_1932, %bb_inst_1927, %bb_inst_1924, %bb_inst_1827, %bb_inst_1824, %bb_inst_1819, %bb_inst_1816, %bb_inst_1744, %bb_inst_1741, %bb_inst_1736, %bb_inst_1733, %bb_inst_1716, %bb_inst_1701, %bb_inst_1693, %bb_inst_1052, %bb_inst_1049, %bb_inst_1044, %bb_inst_1041, %bb_inst_1024, %bb_inst_1010, %bb_inst_1002, %bb_inst_582, %bb_inst_570, %bb_inst_562, %bb_inst_525, %bb_inst_517, %bb_inst_483, %bb_inst_449, %bb_inst_438, %bb_inst_364, %bb_inst_350, %bb_inst_340, %bb_inst_296, %bb_inst_289, %bb_inst_271, %bb_inst_248, %bb_inst_241, %bb_inst_216, %bb_inst_139, %bb_inst_133, %bb_inst_121, %bb_inst_106, %bb_inst_52, %bb_inst_46, %bb_inst_33, %bb_inst_29, %bb_inst_14, %bb_inst_12, %bb_inst_0
  %2229 = load i64, ptr %r8, align 4
  store i64 %2229, ptr %r0, align 4
  %2230 = load i64, ptr %callItemCnt, align 4
  %2231 = icmp eq i64 %2230, 0
  br i1 %2231, label %exitBlock, label %localFuncReturnBlock

bb_inst_944:                                      ; preds = %bb_inst_929
  %2232 = load i64, ptr %r0, align 4
  %2233 = load ptr, ptr %r10, align 8
  %2234 = getelementptr i8, ptr %2233, i64 -176
  store i64 %2232, ptr %2234, align 4
  %2235 = load ptr, ptr %r10, align 8
  %2236 = getelementptr i8, ptr %2235, i64 -152
  %2237 = load i64, ptr %2236, align 4
  store i64 %2237, ptr %r1, align 4
  %2238 = load i64, ptr %r1, align 4
  %2239 = icmp eq i64 %2238, 0
  br i1 %2239, label %bb_inst_965, label %bb_inst_947

bb_inst_947:                                      ; preds = %bb_inst_944
  %2240 = load ptr, ptr %r10, align 8
  %2241 = getelementptr i8, ptr %2240, i64 -144
  %2242 = load i64, ptr %2241, align 4
  store i64 %2242, ptr %r1, align 4
  %2243 = load ptr, ptr %r1, align 8
  %2244 = getelementptr i8, ptr %2243, i64 0
  %2245 = load i32, ptr %2244, align 4
  %2246 = zext i32 %2245 to i64
  store i64 %2246, ptr %r1, align 4
  %2247 = load i64, ptr %r1, align 4
  %2248 = and i64 %2247, 2
  store i64 %2248, ptr %r1, align 4
  %2249 = load i64, ptr %r1, align 4
  %2250 = lshr i64 %2249, 1
  store i64 %2250, ptr %r1, align 4
  %2251 = load i64, ptr %r9, align 4
  %2252 = load i64, ptr %r1, align 4
  %2253 = or i64 %2251, %2252
  store i64 %2253, ptr %r9, align 4
  %2254 = load i64, ptr %r9, align 4
  %2255 = icmp ne i64 %2254, 0
  br i1 %2255, label %bb_inst_965, label %bb_inst_953

bb_inst_953:                                      ; preds = %bb_inst_947
  %2256 = load ptr, ptr %r10, align 8
  %2257 = getelementptr i8, ptr %2256, i64 -36
  %2258 = load i8, ptr %2257, align 1
  %2259 = zext i8 %2258 to i64
  store i64 %2259, ptr %r1, align 4
  %2260 = load i64, ptr %r1, align 4
  %2261 = icmp ne i64 %2260, 17
  br i1 %2261, label %bb_inst_956, label %bb_inst_955

bb_inst_955:                                      ; preds = %bb_inst_953
  %2262 = load i64, ptr %r8, align 4
  %2263 = load ptr, ptr %r10, align 8
  %2264 = getelementptr i8, ptr %2263, i64 -8
  store i64 %2262, ptr %2264, align 4
  br label %bb_inst_956

bb_inst_956:                                      ; preds = %bb_inst_955, %bb_inst_953
  %2265 = load ptr, ptr %r10, align 8
  %2266 = getelementptr i8, ptr %2265, i64 -20
  %2267 = load i32, ptr %2266, align 4
  %2268 = zext i32 %2267 to i64
  store i64 %2268, ptr %r1, align 4
  %2269 = load i64, ptr %r1, align 4
  %2270 = trunc i64 %2269 to i32
  %2271 = load ptr, ptr %r10, align 8
  %2272 = getelementptr i8, ptr %2271, i64 -16
  store i32 %2270, ptr %2272, align 4
  %2273 = load i64, ptr %r10, align 4
  store i64 %2273, ptr %r2, align 4
  %2274 = load i64, ptr %r2, align 4
  %2275 = add i64 %2274, -72
  store i64 %2275, ptr %r2, align 4
  %2276 = load i64, ptr %r10, align 4
  store i64 %2276, ptr %r3, align 4
  %2277 = load i64, ptr %r3, align 4
  %2278 = add i64 %2277, -16
  store i64 %2278, ptr %r3, align 4
  %2279 = load ptr, ptr %r10, align 8
  %2280 = getelementptr i8, ptr %2279, i64 -152
  %2281 = load i64, ptr %2280, align 4
  store i64 %2281, ptr %r1, align 4
  store i64 0, ptr %r4, align 4
  %2282 = load i64, ptr %r1, align 4
  %2283 = load i64, ptr %r2, align 4
  %2284 = load i64, ptr %r3, align 4
  %2285 = load i64, ptr %r4, align 4
  %2286 = load i64, ptr %r5, align 4
  %2287 = call i64 @_bpf_helper_ext_0002(i64 %2282, i64 %2283, i64 %2284, i64 %2285, i64 %2286)
  store i64 %2287, ptr %r0, align 4
  br label %bb_inst_965

bb_inst_965:                                      ; preds = %bb_inst_956, %bb_inst_947, %bb_inst_944
  store i64 0, ptr %r1, align 4
  %2288 = load i64, ptr %r1, align 4
  %2289 = trunc i64 %2288 to i32
  %2290 = load ptr, ptr %r10, align 8
  %2291 = getelementptr i8, ptr %2290, i64 -16
  store i32 %2289, ptr %2291, align 4
  %2292 = load i64, ptr %r10, align 4
  store i64 %2292, ptr %r2, align 4
  %2293 = load i64, ptr %r2, align 4
  %2294 = add i64 %2293, -16
  store i64 %2294, ptr %r2, align 4
  %2295 = call i64 @__lddw_helper_map_by_fd(i32 12)
  store i64 %2295, ptr %r1, align 4
  %2296 = load i64, ptr %r1, align 4
  %2297 = load i64, ptr %r2, align 4
  %2298 = load i64, ptr %r3, align 4
  %2299 = load i64, ptr %r4, align 4
  %2300 = load i64, ptr %r5, align 4
  %2301 = call i64 @_bpf_helper_ext_0001(i64 %2296, i64 %2297, i64 %2298, i64 %2299, i64 %2300)
  store i64 %2301, ptr %r0, align 4
  br label %bb_inst_972

bb_inst_972:                                      ; preds = %bb_inst_965
  %2302 = load i64, ptr %r0, align 4
  %2303 = icmp eq i64 %2302, 0
  br i1 %2303, label %bb_inst_941, label %bb_inst_973

bb_inst_973:                                      ; preds = %bb_inst_972
  %2304 = load ptr, ptr %r10, align 8
  %2305 = getelementptr i8, ptr %2304, i64 -80
  %2306 = load i16, ptr %2305, align 2
  %2307 = zext i16 %2306 to i64
  store i64 %2307, ptr %r2, align 4
  %2308 = load ptr, ptr %r10, align 8
  %2309 = getelementptr i8, ptr %2308, i64 -96
  %2310 = load i32, ptr %2309, align 4
  %2311 = zext i32 %2310 to i64
  store i64 %2311, ptr %r3, align 4
  %2312 = load ptr, ptr %r10, align 8
  %2313 = getelementptr i8, ptr %2312, i64 -78
  %2314 = load i8, ptr %2313, align 1
  %2315 = zext i8 %2314 to i64
  store i64 %2315, ptr %r1, align 4
  %2316 = load i64, ptr %r1, align 4
  %2317 = trunc i64 %2316 to i8
  %2318 = load ptr, ptr %r0, align 8
  %2319 = getelementptr i8, ptr %2318, i64 18
  store i8 %2317, ptr %2319, align 1
  %2320 = load ptr, ptr %r0, align 8
  %2321 = getelementptr i8, ptr %2320, i64 0
  %2322 = load i32, ptr %2321, align 4
  %2323 = zext i32 %2322 to i64
  store i64 %2323, ptr %r4, align 4
  %2324 = load i64, ptr %r3, align 4
  %2325 = load i64, ptr %r4, align 4
  %2326 = icmp ne i64 %2325, %2324
  br i1 %2326, label %bb_inst_993, label %bb_inst_979

bb_inst_979:                                      ; preds = %bb_inst_973
  %2327 = load ptr, ptr %r0, align 8
  %2328 = getelementptr i8, ptr %2327, i64 16
  %2329 = load i16, ptr %2328, align 2
  %2330 = zext i16 %2329 to i64
  store i64 %2330, ptr %r3, align 4
  %2331 = load i64, ptr %r2, align 4
  %2332 = load i64, ptr %r3, align 4
  %2333 = icmp ne i64 %2332, %2331
  br i1 %2333, label %bb_inst_993, label %bb_inst_981

bb_inst_981:                                      ; preds = %bb_inst_979
  %2334 = load i64, ptr %r1, align 4
  %2335 = icmp eq i64 %2334, 0
  br i1 %2335, label %bb_inst_993, label %bb_inst_982

bb_inst_982:                                      ; preds = %bb_inst_981
  %2336 = load ptr, ptr %r10, align 8
  %2337 = getelementptr i8, ptr %2336, i64 -32
  %2338 = load i32, ptr %2337, align 4
  %2339 = zext i32 %2338 to i64
  store i64 %2339, ptr %r1, align 4
  %2340 = load i64, ptr %r1, align 4
  %2341 = trunc i64 %2340 to i32
  %2342 = load ptr, ptr %r10, align 8
  %2343 = getelementptr i8, ptr %2342, i64 -120
  store i32 %2341, ptr %2343, align 4
  %2344 = load i64, ptr %r10, align 4
  store i64 %2344, ptr %r2, align 4
  %2345 = load i64, ptr %r2, align 4
  %2346 = add i64 %2345, -120
  store i64 %2346, ptr %r2, align 4
  %2347 = call i64 @__lddw_helper_map_by_fd(i32 11)
  store i64 %2347, ptr %r1, align 4
  %2348 = load i64, ptr %r1, align 4
  %2349 = load i64, ptr %r2, align 4
  %2350 = load i64, ptr %r3, align 4
  %2351 = load i64, ptr %r4, align 4
  %2352 = load i64, ptr %r5, align 4
  %2353 = call i64 @_bpf_helper_ext_0001(i64 %2348, i64 %2349, i64 %2350, i64 %2351, i64 %2352)
  store i64 %2353, ptr %r0, align 4
  br label %bb_inst_989

bb_inst_989:                                      ; preds = %bb_inst_982
  %2354 = load i64, ptr %r0, align 4
  %2355 = icmp eq i64 %2354, 0
  br i1 %2355, label %bb_inst_941, label %bb_inst_990

bb_inst_990:                                      ; preds = %bb_inst_989
  %2356 = load ptr, ptr %r0, align 8
  %2357 = getelementptr i8, ptr %2356, i64 0
  %2358 = load i32, ptr %2357, align 4
  %2359 = zext i32 %2358 to i64
  store i64 %2359, ptr %r1, align 4
  %2360 = load i64, ptr %r1, align 4
  %2361 = add i64 %2360, 1
  store i64 %2361, ptr %r1, align 4
  %2362 = load i64, ptr %r1, align 4
  %2363 = trunc i64 %2362 to i32
  %2364 = load ptr, ptr %r0, align 8
  %2365 = getelementptr i8, ptr %2364, i64 0
  store i32 %2363, ptr %2365, align 4
  br label %bb_inst_993

bb_inst_993:                                      ; preds = %bb_inst_990, %bb_inst_981, %bb_inst_979, %bb_inst_973
  %2366 = load ptr, ptr %r10, align 8
  %2367 = getelementptr i8, ptr %2366, i64 -160
  %2368 = load i64, ptr %2367, align 4
  store i64 %2368, ptr %r2, align 4
  %2369 = load ptr, ptr %r2, align 8
  %2370 = getelementptr i8, ptr %2369, i64 8
  %2371 = load i64, ptr %2370, align 4
  store i64 %2371, ptr %r1, align 4
  %2372 = load i64, ptr %r1, align 4
  %2373 = add i64 %2372, 1
  store i64 %2373, ptr %r1, align 4
  %2374 = load i64, ptr %r1, align 4
  %2375 = load ptr, ptr %r2, align 8
  %2376 = getelementptr i8, ptr %2375, i64 8
  store i64 %2374, ptr %2376, align 4
  br label %bb_inst_997

bb_inst_997:                                      ; preds = %bb_inst_993, %bb_inst_2241, %bb_inst_752
  %2377 = load i64, ptr %r10, align 4
  store i64 %2377, ptr %r2, align 4
  %2378 = load i64, ptr %r2, align 4
  %2379 = add i64 %2378, -104
  store i64 %2379, ptr %r2, align 4
  %2380 = call i64 @__lddw_helper_map_by_fd(i32 4)
  store i64 %2380, ptr %r1, align 4
  %2381 = load i64, ptr %r1, align 4
  %2382 = load i64, ptr %r2, align 4
  %2383 = load i64, ptr %r3, align 4
  %2384 = load i64, ptr %r4, align 4
  %2385 = load i64, ptr %r5, align 4
  %2386 = call i64 @_bpf_helper_ext_0001(i64 %2381, i64 %2382, i64 %2383, i64 %2384, i64 %2385)
  store i64 %2386, ptr %r0, align 4
  br label %bb_inst_1002

bb_inst_1002:                                     ; preds = %bb_inst_997
  %2387 = load i64, ptr %r0, align 4
  store i64 %2387, ptr %r7, align 4
  store i64 1, ptr %r8, align 4
  %2388 = load i64, ptr %r7, align 4
  %2389 = icmp eq i64 %2388, 0
  br i1 %2389, label %bb_inst_942, label %bb_inst_1005

bb_inst_1005:                                     ; preds = %bb_inst_1002
  %2390 = load i64, ptr %r10, align 4
  store i64 %2390, ptr %r2, align 4
  %2391 = load i64, ptr %r2, align 4
  %2392 = add i64 %2391, -100
  store i64 %2392, ptr %r2, align 4
  %2393 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %2393, ptr %r1, align 4
  %2394 = load i64, ptr %r1, align 4
  %2395 = load i64, ptr %r2, align 4
  %2396 = load i64, ptr %r3, align 4
  %2397 = load i64, ptr %r4, align 4
  %2398 = load i64, ptr %r5, align 4
  %2399 = call i64 @_bpf_helper_ext_0001(i64 %2394, i64 %2395, i64 %2396, i64 %2397, i64 %2398)
  store i64 %2399, ptr %r0, align 4
  br label %bb_inst_1010

bb_inst_1010:                                     ; preds = %bb_inst_1005
  %2400 = load i64, ptr %r0, align 4
  %2401 = icmp eq i64 %2400, 0
  br i1 %2401, label %bb_inst_942, label %bb_inst_1011

bb_inst_1011:                                     ; preds = %bb_inst_1010
  %2402 = load ptr, ptr %r10, align 8
  %2403 = getelementptr i8, ptr %2402, i64 -128
  %2404 = load i64, ptr %2403, align 4
  store i64 %2404, ptr %r9, align 4
  %2405 = load i64, ptr %r9, align 4
  %2406 = lshr i64 %2405, 0
  %2407 = and i64 %2406, 255
  %2408 = lshr i64 %2405, 8
  %2409 = and i64 %2408, 255
  %2410 = shl i64 %2407, 8
  %2411 = or i64 %2410, %2409
  store i64 %2411, ptr %r9, align 4
  %2412 = load ptr, ptr %r0, align 8
  %2413 = getelementptr i8, ptr %2412, i64 0
  %2414 = load i64, ptr %2413, align 4
  store i64 %2414, ptr %r1, align 4
  %2415 = load i64, ptr %r1, align 4
  %2416 = add i64 %2415, 1
  store i64 %2416, ptr %r1, align 4
  %2417 = load i64, ptr %r1, align 4
  %2418 = load ptr, ptr %r0, align 8
  %2419 = getelementptr i8, ptr %2418, i64 0
  store i64 %2417, ptr %2419, align 4
  %2420 = load ptr, ptr %r0, align 8
  %2421 = getelementptr i8, ptr %2420, i64 8
  %2422 = load i64, ptr %2421, align 4
  store i64 %2422, ptr %r1, align 4
  %2423 = load i64, ptr %r1, align 4
  %2424 = load i64, ptr %r9, align 4
  %2425 = add i64 %2423, %2424
  store i64 %2425, ptr %r1, align 4
  %2426 = load i64, ptr %r1, align 4
  %2427 = load ptr, ptr %r0, align 8
  %2428 = getelementptr i8, ptr %2427, i64 8
  store i64 %2426, ptr %2428, align 4
  %2429 = load i64, ptr %r10, align 4
  store i64 %2429, ptr %r2, align 4
  %2430 = load i64, ptr %r2, align 4
  %2431 = add i64 %2430, -32
  store i64 %2431, ptr %r2, align 4
  %2432 = call i64 @__lddw_helper_map_by_fd(i32 10)
  store i64 %2432, ptr %r1, align 4
  %2433 = load i64, ptr %r1, align 4
  %2434 = load i64, ptr %r2, align 4
  %2435 = load i64, ptr %r3, align 4
  %2436 = load i64, ptr %r4, align 4
  %2437 = load i64, ptr %r5, align 4
  %2438 = call i64 @_bpf_helper_ext_0001(i64 %2433, i64 %2434, i64 %2435, i64 %2436, i64 %2437)
  store i64 %2438, ptr %r0, align 4
  br label %bb_inst_1024

bb_inst_1024:                                     ; preds = %bb_inst_1011
  %2439 = load i64, ptr %r0, align 4
  %2440 = icmp eq i64 %2439, 0
  br i1 %2440, label %bb_inst_942, label %bb_inst_1025

bb_inst_1025:                                     ; preds = %bb_inst_1024
  %2441 = load ptr, ptr %r0, align 8
  %2442 = getelementptr i8, ptr %2441, i64 0
  %2443 = load i64, ptr %2442, align 4
  store i64 %2443, ptr %r1, align 4
  %2444 = load i64, ptr %r1, align 4
  %2445 = add i64 %2444, 1
  store i64 %2445, ptr %r1, align 4
  %2446 = load i64, ptr %r1, align 4
  %2447 = load ptr, ptr %r0, align 8
  %2448 = getelementptr i8, ptr %2447, i64 0
  store i64 %2446, ptr %2448, align 4
  %2449 = load ptr, ptr %r0, align 8
  %2450 = getelementptr i8, ptr %2449, i64 8
  %2451 = load i64, ptr %2450, align 4
  store i64 %2451, ptr %r1, align 4
  %2452 = load i64, ptr %r1, align 4
  %2453 = load i64, ptr %r9, align 4
  %2454 = add i64 %2452, %2453
  store i64 %2454, ptr %r1, align 4
  %2455 = load i64, ptr %r1, align 4
  %2456 = load ptr, ptr %r0, align 8
  %2457 = getelementptr i8, ptr %2456, i64 8
  store i64 %2455, ptr %2457, align 4
  %2458 = load ptr, ptr %r10, align 8
  %2459 = getelementptr i8, ptr %2458, i64 -168
  %2460 = load i64, ptr %2459, align 4
  store i64 %2460, ptr %r1, align 4
  %2461 = load i64, ptr %r1, align 4
  %2462 = trunc i64 %2461 to i16
  %2463 = load ptr, ptr %r10, align 8
  %2464 = getelementptr i8, ptr %2463, i64 -40
  store i16 %2462, ptr %2464, align 2
  %2465 = load ptr, ptr %r10, align 8
  %2466 = getelementptr i8, ptr %2465, i64 -176
  %2467 = load i64, ptr %2466, align 4
  store i64 %2467, ptr %r1, align 4
  %2468 = load ptr, ptr %r1, align 8
  %2469 = getelementptr i8, ptr %2468, i64 16
  %2470 = load i8, ptr %2469, align 1
  %2471 = zext i8 %2470 to i64
  store i64 %2471, ptr %r1, align 4
  %2472 = load i64, ptr %r1, align 4
  %2473 = and i64 %2472, 1
  store i64 %2473, ptr %r1, align 4
  %2474 = load i64, ptr %r1, align 4
  %2475 = icmp eq i64 %2474, 0
  br i1 %2475, label %bb_inst_1918, label %bb_inst_1037

bb_inst_1037:                                     ; preds = %bb_inst_1025
  %2476 = load i64, ptr %r6, align 4
  store i64 %2476, ptr %r1, align 4
  store i64 4294967256, ptr %r2, align 4
  %2477 = load i64, ptr %r1, align 4
  %2478 = load i64, ptr %r2, align 4
  %2479 = load i64, ptr %r3, align 4
  %2480 = load i64, ptr %r4, align 4
  %2481 = load i64, ptr %r5, align 4
  %2482 = call i64 @_bpf_helper_ext_0044(i64 %2477, i64 %2478, i64 %2479, i64 %2480, i64 %2481)
  store i64 %2482, ptr %r0, align 4
  br label %bb_inst_1041

bb_inst_1041:                                     ; preds = %bb_inst_1037
  %2483 = load i64, ptr %r0, align 4
  %2484 = shl i64 %2483, 32
  store i64 %2484, ptr %r0, align 4
  %2485 = load i64, ptr %r0, align 4
  %2486 = lshr i64 %2485, 32
  store i64 %2486, ptr %r0, align 4
  %2487 = load i64, ptr %r0, align 4
  %2488 = icmp ne i64 %2487, 0
  br i1 %2488, label %bb_inst_942, label %bb_inst_1044

bb_inst_1044:                                     ; preds = %bb_inst_1041
  %2489 = load ptr, ptr %r6, align 8
  %2490 = getelementptr i8, ptr %2489, i64 0
  %2491 = load i64, ptr %2490, align 4
  store i64 %2491, ptr %r1, align 4
  %2492 = load ptr, ptr %r6, align 8
  %2493 = getelementptr i8, ptr %2492, i64 8
  %2494 = load i64, ptr %2493, align 4
  store i64 %2494, ptr %r2, align 4
  %2495 = load i64, ptr %r1, align 4
  store i64 %2495, ptr %r3, align 4
  %2496 = load i64, ptr %r3, align 4
  %2497 = add i64 %2496, 14
  store i64 %2497, ptr %r3, align 4
  %2498 = load i64, ptr %r2, align 4
  %2499 = load i64, ptr %r3, align 4
  %2500 = icmp ugt i64 %2499, %2498
  br i1 %2500, label %bb_inst_942, label %bb_inst_1049

bb_inst_1049:                                     ; preds = %bb_inst_1044
  %2501 = load i64, ptr %r1, align 4
  store i64 %2501, ptr %r3, align 4
  %2502 = load i64, ptr %r3, align 4
  %2503 = add i64 %2502, 54
  store i64 %2503, ptr %r3, align 4
  %2504 = load i64, ptr %r2, align 4
  %2505 = load i64, ptr %r3, align 4
  %2506 = icmp ugt i64 %2505, %2504
  br i1 %2506, label %bb_inst_942, label %bb_inst_1052

bb_inst_1052:                                     ; preds = %bb_inst_1049
  %2507 = load i64, ptr %r2, align 4
  %2508 = load i64, ptr %r3, align 4
  %2509 = icmp ugt i64 %2508, %2507
  br i1 %2509, label %bb_inst_942, label %bb_inst_1053

bb_inst_1053:                                     ; preds = %bb_inst_1052
  %2510 = load i64, ptr %r1, align 4
  store i64 %2510, ptr %r2, align 4
  %2511 = load i64, ptr %r2, align 4
  %2512 = add i64 %2511, 40
  store i64 %2512, ptr %r2, align 4
  %2513 = load ptr, ptr %r7, align 8
  %2514 = getelementptr i8, ptr %2513, i64 5
  %2515 = load i8, ptr %2514, align 1
  %2516 = zext i8 %2515 to i64
  store i64 %2516, ptr %r3, align 4
  %2517 = load i64, ptr %r3, align 4
  %2518 = trunc i64 %2517 to i8
  %2519 = load ptr, ptr %r1, align 8
  %2520 = getelementptr i8, ptr %2519, i64 5
  store i8 %2518, ptr %2520, align 1
  %2521 = load ptr, ptr %r7, align 8
  %2522 = getelementptr i8, ptr %2521, i64 4
  %2523 = load i8, ptr %2522, align 1
  %2524 = zext i8 %2523 to i64
  store i64 %2524, ptr %r3, align 4
  %2525 = load i64, ptr %r3, align 4
  %2526 = trunc i64 %2525 to i8
  %2527 = load ptr, ptr %r1, align 8
  %2528 = getelementptr i8, ptr %2527, i64 4
  store i8 %2526, ptr %2528, align 1
  %2529 = load ptr, ptr %r7, align 8
  %2530 = getelementptr i8, ptr %2529, i64 3
  %2531 = load i8, ptr %2530, align 1
  %2532 = zext i8 %2531 to i64
  store i64 %2532, ptr %r3, align 4
  %2533 = load i64, ptr %r3, align 4
  %2534 = trunc i64 %2533 to i8
  %2535 = load ptr, ptr %r1, align 8
  %2536 = getelementptr i8, ptr %2535, i64 3
  store i8 %2534, ptr %2536, align 1
  %2537 = load ptr, ptr %r7, align 8
  %2538 = getelementptr i8, ptr %2537, i64 2
  %2539 = load i8, ptr %2538, align 1
  %2540 = zext i8 %2539 to i64
  store i64 %2540, ptr %r3, align 4
  %2541 = load i64, ptr %r3, align 4
  %2542 = trunc i64 %2541 to i8
  %2543 = load ptr, ptr %r1, align 8
  %2544 = getelementptr i8, ptr %2543, i64 2
  store i8 %2542, ptr %2544, align 1
  %2545 = load ptr, ptr %r7, align 8
  %2546 = getelementptr i8, ptr %2545, i64 1
  %2547 = load i8, ptr %2546, align 1
  %2548 = zext i8 %2547 to i64
  store i64 %2548, ptr %r3, align 4
  %2549 = load i64, ptr %r3, align 4
  %2550 = trunc i64 %2549 to i8
  %2551 = load ptr, ptr %r1, align 8
  %2552 = getelementptr i8, ptr %2551, i64 1
  store i8 %2550, ptr %2552, align 1
  %2553 = load ptr, ptr %r7, align 8
  %2554 = getelementptr i8, ptr %2553, i64 0
  %2555 = load i8, ptr %2554, align 1
  %2556 = zext i8 %2555 to i64
  store i64 %2556, ptr %r3, align 4
  %2557 = load i64, ptr %r3, align 4
  %2558 = trunc i64 %2557 to i8
  %2559 = load ptr, ptr %r1, align 8
  %2560 = getelementptr i8, ptr %2559, i64 0
  store i8 %2558, ptr %2560, align 1
  %2561 = load ptr, ptr %r2, align 8
  %2562 = getelementptr i8, ptr %2561, i64 2
  %2563 = load i8, ptr %2562, align 1
  %2564 = zext i8 %2563 to i64
  store i64 %2564, ptr %r3, align 4
  %2565 = load i64, ptr %r3, align 4
  %2566 = trunc i64 %2565 to i8
  %2567 = load ptr, ptr %r1, align 8
  %2568 = getelementptr i8, ptr %2567, i64 8
  store i8 %2566, ptr %2568, align 1
  %2569 = load ptr, ptr %r2, align 8
  %2570 = getelementptr i8, ptr %2569, i64 3
  %2571 = load i8, ptr %2570, align 1
  %2572 = zext i8 %2571 to i64
  store i64 %2572, ptr %r3, align 4
  %2573 = load i64, ptr %r3, align 4
  %2574 = trunc i64 %2573 to i8
  %2575 = load ptr, ptr %r1, align 8
  %2576 = getelementptr i8, ptr %2575, i64 9
  store i8 %2574, ptr %2576, align 1
  %2577 = load ptr, ptr %r2, align 8
  %2578 = getelementptr i8, ptr %2577, i64 0
  %2579 = load i8, ptr %2578, align 1
  %2580 = zext i8 %2579 to i64
  store i64 %2580, ptr %r3, align 4
  %2581 = load i64, ptr %r3, align 4
  %2582 = trunc i64 %2581 to i8
  %2583 = load ptr, ptr %r1, align 8
  %2584 = getelementptr i8, ptr %2583, i64 6
  store i8 %2582, ptr %2584, align 1
  %2585 = load ptr, ptr %r2, align 8
  %2586 = getelementptr i8, ptr %2585, i64 1
  %2587 = load i8, ptr %2586, align 1
  %2588 = zext i8 %2587 to i64
  store i64 %2588, ptr %r3, align 4
  %2589 = load i64, ptr %r3, align 4
  %2590 = trunc i64 %2589 to i8
  %2591 = load ptr, ptr %r1, align 8
  %2592 = getelementptr i8, ptr %2591, i64 7
  store i8 %2590, ptr %2592, align 1
  %2593 = load ptr, ptr %r2, align 8
  %2594 = getelementptr i8, ptr %2593, i64 4
  %2595 = load i8, ptr %2594, align 1
  %2596 = zext i8 %2595 to i64
  store i64 %2596, ptr %r3, align 4
  %2597 = load i64, ptr %r3, align 4
  %2598 = trunc i64 %2597 to i8
  %2599 = load ptr, ptr %r1, align 8
  %2600 = getelementptr i8, ptr %2599, i64 10
  store i8 %2598, ptr %2600, align 1
  %2601 = load ptr, ptr %r2, align 8
  %2602 = getelementptr i8, ptr %2601, i64 5
  %2603 = load i8, ptr %2602, align 1
  %2604 = zext i8 %2603 to i64
  store i64 %2604, ptr %r2, align 4
  %2605 = load i64, ptr %r2, align 4
  %2606 = trunc i64 %2605 to i8
  %2607 = load ptr, ptr %r1, align 8
  %2608 = getelementptr i8, ptr %2607, i64 11
  store i8 %2606, ptr %2608, align 1
  store i64 134, ptr %r2, align 4
  %2609 = load i64, ptr %r2, align 4
  %2610 = trunc i64 %2609 to i8
  %2611 = load ptr, ptr %r1, align 8
  %2612 = getelementptr i8, ptr %2611, i64 12
  store i8 %2610, ptr %2612, align 1
  store i64 221, ptr %r2, align 4
  %2613 = load i64, ptr %r2, align 4
  %2614 = trunc i64 %2613 to i8
  %2615 = load ptr, ptr %r1, align 8
  %2616 = getelementptr i8, ptr %2615, i64 13
  store i8 %2614, ptr %2616, align 1
  %2617 = load ptr, ptr %r10, align 8
  %2618 = getelementptr i8, ptr %2617, i64 -40
  %2619 = load i16, ptr %2618, align 2
  %2620 = zext i16 %2619 to i64
  store i64 %2620, ptr %r2, align 4
  %2621 = load ptr, ptr %r10, align 8
  %2622 = getelementptr i8, ptr %2621, i64 -72
  %2623 = load i32, ptr %2622, align 4
  %2624 = zext i32 %2623 to i64
  store i64 %2624, ptr %r3, align 4
  %2625 = load i64, ptr %r3, align 4
  %2626 = load i64, ptr %r2, align 4
  %2627 = xor i64 %2625, %2626
  store i64 %2627, ptr %r3, align 4
  %2628 = load ptr, ptr %r10, align 8
  %2629 = getelementptr i8, ptr %2628, i64 -27
  %2630 = load i8, ptr %2629, align 1
  %2631 = zext i8 %2630 to i64
  store i64 %2631, ptr %r2, align 4
  store i64 16388, ptr %r4, align 4
  %2632 = load i64, ptr %r4, align 4
  %2633 = trunc i64 %2632 to i16
  %2634 = load ptr, ptr %r1, align 8
  %2635 = getelementptr i8, ptr %2634, i64 20
  store i16 %2633, ptr %2635, align 2
  store i64 1, ptr %r4, align 4
  %2636 = load i64, ptr %r4, align 4
  %2637 = trunc i64 %2636 to i32
  %2638 = load ptr, ptr %r1, align 8
  %2639 = getelementptr i8, ptr %2638, i64 22
  store i32 %2637, ptr %2639, align 4
  store i64 0, ptr %r4, align 4
  %2640 = load i64, ptr %r4, align 4
  %2641 = trunc i64 %2640 to i32
  %2642 = load ptr, ptr %r1, align 8
  %2643 = getelementptr i8, ptr %2642, i64 26
  store i32 %2641, ptr %2643, align 4
  %2644 = load i64, ptr %r4, align 4
  %2645 = trunc i64 %2644 to i32
  %2646 = load ptr, ptr %r1, align 8
  %2647 = getelementptr i8, ptr %2646, i64 30
  store i32 %2645, ptr %2647, align 4
  %2648 = load i64, ptr %r4, align 4
  %2649 = trunc i64 %2648 to i8
  %2650 = load ptr, ptr %r1, align 8
  %2651 = getelementptr i8, ptr %2650, i64 16
  store i8 %2649, ptr %2651, align 1
  %2652 = load i64, ptr %r4, align 4
  %2653 = trunc i64 %2652 to i8
  %2654 = load ptr, ptr %r1, align 8
  %2655 = getelementptr i8, ptr %2654, i64 17
  store i8 %2653, ptr %2655, align 1
  %2656 = load ptr, ptr %r10, align 8
  %2657 = getelementptr i8, ptr %2656, i64 -128
  %2658 = load i64, ptr %2657, align 4
  store i64 %2658, ptr %r4, align 4
  %2659 = load i64, ptr %r4, align 4
  %2660 = trunc i64 %2659 to i16
  %2661 = load ptr, ptr %r1, align 8
  %2662 = getelementptr i8, ptr %2661, i64 18
  store i16 %2660, ptr %2662, align 2
  %2663 = load i64, ptr %r3, align 4
  %2664 = trunc i64 %2663 to i32
  %2665 = load ptr, ptr %r1, align 8
  %2666 = getelementptr i8, ptr %2665, i64 34
  store i32 %2664, ptr %2666, align 4
  %2667 = load i64, ptr %r2, align 4
  store i64 %2667, ptr %r3, align 4
  %2668 = load i64, ptr %r3, align 4
  %2669 = shl i64 %2668, 4
  store i64 %2669, ptr %r3, align 4
  %2670 = load i64, ptr %r3, align 4
  %2671 = trunc i64 %2670 to i8
  %2672 = load ptr, ptr %r1, align 8
  %2673 = getelementptr i8, ptr %2672, i64 15
  store i8 %2671, ptr %2673, align 1
  %2674 = load i64, ptr %r2, align 4
  %2675 = lshr i64 %2674, 4
  store i64 %2675, ptr %r2, align 4
  %2676 = load i64, ptr %r2, align 4
  %2677 = or i64 %2676, 96
  store i64 %2677, ptr %r2, align 4
  %2678 = load i64, ptr %r2, align 4
  %2679 = trunc i64 %2678 to i8
  %2680 = load ptr, ptr %r1, align 8
  %2681 = getelementptr i8, ptr %2680, i64 14
  store i8 %2679, ptr %2681, align 1
  %2682 = load ptr, ptr %r10, align 8
  %2683 = getelementptr i8, ptr %2682, i64 -176
  %2684 = load i64, ptr %2683, align 4
  store i64 %2684, ptr %r3, align 4
  br label %bb_inst_1799

bb_inst_1107:                                     ; preds = %bb_inst_665
  %2685 = load i64, ptr %r7, align 4
  store i64 %2685, ptr %r2, align 4
  %2686 = load i64, ptr %r2, align 4
  %2687 = add i64 %2686, 9
  store i64 %2687, ptr %r2, align 4
  %2688 = load i64, ptr %r1, align 4
  store i64 %2688, ptr %r7, align 4
  %2689 = load i64, ptr %r9, align 4
  %2690 = load i64, ptr %r2, align 4
  %2691 = icmp ugt i64 %2690, %2689
  br i1 %2691, label %bb_inst_1218, label %bb_inst_1111

bb_inst_1111:                                     ; preds = %bb_inst_1107, %bb_inst_679
  %2692 = load ptr, ptr %r7, align 8
  %2693 = getelementptr i8, ptr %2692, i64 0
  %2694 = load i8, ptr %2693, align 1
  %2695 = zext i8 %2694 to i64
  store i64 %2695, ptr %r1, align 4
  %2696 = load i64, ptr %r1, align 4
  store i64 %2696, ptr %r2, align 4
  %2697 = load i64, ptr %r2, align 4
  %2698 = lshr i64 %2697, 6
  store i64 %2698, ptr %r2, align 4
  %2699 = load i64, ptr %r2, align 4
  %2700 = icmp eq i64 %2699, 3
  br i1 %2700, label %bb_inst_1160, label %bb_inst_1115

bb_inst_1115:                                     ; preds = %bb_inst_1111
  %2701 = load i64, ptr %r2, align 4
  %2702 = icmp eq i64 %2701, 2
  br i1 %2702, label %bb_inst_1171, label %bb_inst_1116

bb_inst_1116:                                     ; preds = %bb_inst_1115
  %2703 = load i64, ptr %r2, align 4
  %2704 = icmp ne i64 %2703, 1
  br i1 %2704, label %bb_inst_1218, label %bb_inst_1117

bb_inst_1117:                                     ; preds = %bb_inst_1116
  %2705 = load i64, ptr %r1, align 4
  %2706 = and i64 %2705, 63
  store i64 %2706, ptr %r1, align 4
  %2707 = load i64, ptr %r1, align 4
  %2708 = shl i64 %2707, 10
  store i64 %2708, ptr %r1, align 4
  %2709 = load ptr, ptr %r7, align 8
  %2710 = getelementptr i8, ptr %2709, i64 1
  %2711 = load i8, ptr %2710, align 1
  %2712 = zext i8 %2711 to i64
  store i64 %2712, ptr %r9, align 4
  %2713 = load i64, ptr %r9, align 4
  %2714 = shl i64 %2713, 2
  store i64 %2714, ptr %r9, align 4
  %2715 = load i64, ptr %r9, align 4
  %2716 = load i64, ptr %r1, align 4
  %2717 = or i64 %2715, %2716
  store i64 %2717, ptr %r9, align 4
  store i64 56, ptr %r1, align 4
  %2718 = load ptr, ptr %r7, align 8
  %2719 = getelementptr i8, ptr %2718, i64 2
  %2720 = load i8, ptr %2719, align 1
  %2721 = zext i8 %2720 to i64
  store i64 %2721, ptr %r2, align 4
  %2722 = load i64, ptr %r2, align 4
  %2723 = lshr i64 %2722, 6
  store i64 %2723, ptr %r2, align 4
  br label %bb_inst_1178

bb_inst_1126:                                     ; preds = %bb_inst_699
  %2724 = load i64, ptr %r7, align 4
  store i64 %2724, ptr %r2, align 4
  %2725 = load i64, ptr %r2, align 4
  %2726 = add i64 %2725, 9
  store i64 %2726, ptr %r2, align 4
  %2727 = load i64, ptr %r1, align 4
  store i64 %2727, ptr %r7, align 4
  %2728 = load i64, ptr %r9, align 4
  %2729 = load i64, ptr %r2, align 4
  %2730 = icmp ugt i64 %2729, %2728
  br i1 %2730, label %bb_inst_714, label %bb_inst_1130

bb_inst_1130:                                     ; preds = %bb_inst_1126, %bb_inst_713
  %2731 = load ptr, ptr %r7, align 8
  %2732 = getelementptr i8, ptr %2731, i64 0
  %2733 = load i8, ptr %2732, align 1
  %2734 = zext i8 %2733 to i64
  store i64 %2734, ptr %r1, align 4
  %2735 = load i64, ptr %r1, align 4
  store i64 %2735, ptr %r2, align 4
  %2736 = load i64, ptr %r2, align 4
  %2737 = lshr i64 %2736, 6
  store i64 %2737, ptr %r2, align 4
  %2738 = load i64, ptr %r2, align 4
  %2739 = icmp eq i64 %2738, 3
  br i1 %2739, label %bb_inst_2048, label %bb_inst_1134

bb_inst_1134:                                     ; preds = %bb_inst_1130
  %2740 = load i64, ptr %r2, align 4
  %2741 = icmp eq i64 %2740, 2
  br i1 %2741, label %bb_inst_2059, label %bb_inst_1135

bb_inst_1135:                                     ; preds = %bb_inst_1134
  %2742 = load i64, ptr %r2, align 4
  %2743 = icmp ne i64 %2742, 1
  br i1 %2743, label %bb_inst_714, label %bb_inst_1136

bb_inst_1136:                                     ; preds = %bb_inst_1135
  %2744 = load i64, ptr %r1, align 4
  %2745 = and i64 %2744, 63
  store i64 %2745, ptr %r1, align 4
  %2746 = load i64, ptr %r1, align 4
  %2747 = shl i64 %2746, 10
  store i64 %2747, ptr %r1, align 4
  %2748 = load ptr, ptr %r7, align 8
  %2749 = getelementptr i8, ptr %2748, i64 1
  %2750 = load i8, ptr %2749, align 1
  %2751 = zext i8 %2750 to i64
  store i64 %2751, ptr %r8, align 4
  %2752 = load i64, ptr %r8, align 4
  %2753 = shl i64 %2752, 2
  store i64 %2753, ptr %r8, align 4
  %2754 = load i64, ptr %r8, align 4
  %2755 = load i64, ptr %r1, align 4
  %2756 = or i64 %2754, %2755
  store i64 %2756, ptr %r8, align 4
  store i64 56, ptr %r1, align 4
  %2757 = load ptr, ptr %r7, align 8
  %2758 = getelementptr i8, ptr %2757, i64 2
  %2759 = load i8, ptr %2758, align 1
  %2760 = zext i8 %2759 to i64
  store i64 %2760, ptr %r2, align 4
  %2761 = load i64, ptr %r2, align 4
  %2762 = lshr i64 %2761, 6
  store i64 %2762, ptr %r2, align 4
  br label %bb_inst_2066

bb_inst_1145:                                     ; preds = %bb_inst_673
  %2763 = load ptr, ptr %r8, align 8
  %2764 = getelementptr i8, ptr %2763, i64 8
  %2765 = load i64, ptr %2764, align 4
  store i64 %2765, ptr %r1, align 4
  %2766 = load i64, ptr %r1, align 4
  %2767 = add i64 %2766, 1
  store i64 %2767, ptr %r1, align 4
  %2768 = load i64, ptr %r1, align 4
  %2769 = load ptr, ptr %r8, align 8
  %2770 = getelementptr i8, ptr %2769, i64 8
  store i64 %2768, ptr %2770, align 4
  %2771 = load ptr, ptr %r10, align 8
  %2772 = getelementptr i8, ptr %2771, i64 -100
  %2773 = load i32, ptr %2772, align 4
  %2774 = zext i32 %2773 to i64
  store i64 %2774, ptr %r1, align 4
  %2775 = load i64, ptr %r1, align 4
  %2776 = trunc i64 %2775 to i32
  %2777 = load ptr, ptr %r10, align 8
  %2778 = getelementptr i8, ptr %2777, i64 -16
  store i32 %2776, ptr %2778, align 4
  %2779 = load i64, ptr %r10, align 4
  store i64 %2779, ptr %r2, align 4
  %2780 = load i64, ptr %r2, align 4
  %2781 = add i64 %2780, -16
  store i64 %2781, ptr %r2, align 4
  %2782 = call i64 @__lddw_helper_map_by_fd(i32 18)
  store i64 %2782, ptr %r1, align 4
  %2783 = load i64, ptr %r1, align 4
  %2784 = load i64, ptr %r2, align 4
  %2785 = load i64, ptr %r3, align 4
  %2786 = load i64, ptr %r4, align 4
  %2787 = load i64, ptr %r5, align 4
  %2788 = call i64 @_bpf_helper_ext_0001(i64 %2783, i64 %2784, i64 %2785, i64 %2786, i64 %2787)
  store i64 %2788, ptr %r0, align 4
  br label %bb_inst_1155

bb_inst_1155:                                     ; preds = %bb_inst_1145
  %2789 = load i64, ptr %r0, align 4
  %2790 = icmp eq i64 %2789, 0
  br i1 %2790, label %bb_inst_1221, label %bb_inst_1156

bb_inst_1156:                                     ; preds = %bb_inst_1155
  %2791 = load ptr, ptr %r0, align 8
  %2792 = getelementptr i8, ptr %2791, i64 0
  %2793 = load i64, ptr %2792, align 4
  store i64 %2793, ptr %r1, align 4
  %2794 = load i64, ptr %r1, align 4
  %2795 = add i64 %2794, 1
  store i64 %2795, ptr %r1, align 4
  %2796 = load i64, ptr %r1, align 4
  %2797 = load ptr, ptr %r0, align 8
  %2798 = getelementptr i8, ptr %2797, i64 0
  store i64 %2796, ptr %2798, align 4
  br label %bb_inst_1221

bb_inst_1160:                                     ; preds = %bb_inst_1111
  %2799 = load ptr, ptr %r7, align 8
  %2800 = getelementptr i8, ptr %2799, i64 1
  %2801 = load i8, ptr %2800, align 1
  %2802 = zext i8 %2801 to i64
  store i64 %2802, ptr %r1, align 4
  %2803 = load i64, ptr %r1, align 4
  %2804 = shl i64 %2803, 24
  store i64 %2804, ptr %r1, align 4
  %2805 = load ptr, ptr %r7, align 8
  %2806 = getelementptr i8, ptr %2805, i64 2
  %2807 = load i8, ptr %2806, align 1
  %2808 = zext i8 %2807 to i64
  store i64 %2808, ptr %r9, align 4
  %2809 = load i64, ptr %r9, align 4
  %2810 = shl i64 %2809, 16
  store i64 %2810, ptr %r9, align 4
  %2811 = load i64, ptr %r9, align 4
  %2812 = load i64, ptr %r1, align 4
  %2813 = or i64 %2811, %2812
  store i64 %2813, ptr %r9, align 4
  %2814 = load ptr, ptr %r7, align 8
  %2815 = getelementptr i8, ptr %2814, i64 3
  %2816 = load i8, ptr %2815, align 1
  %2817 = zext i8 %2816 to i64
  store i64 %2817, ptr %r1, align 4
  %2818 = load i64, ptr %r1, align 4
  %2819 = shl i64 %2818, 8
  store i64 %2819, ptr %r1, align 4
  %2820 = load i64, ptr %r9, align 4
  %2821 = load i64, ptr %r1, align 4
  %2822 = or i64 %2820, %2821
  store i64 %2822, ptr %r9, align 4
  store i64 72, ptr %r1, align 4
  %2823 = load ptr, ptr %r7, align 8
  %2824 = getelementptr i8, ptr %2823, i64 4
  %2825 = load i8, ptr %2824, align 1
  %2826 = zext i8 %2825 to i64
  store i64 %2826, ptr %r2, align 4
  br label %bb_inst_1178

bb_inst_1171:                                     ; preds = %bb_inst_1115
  %2827 = load ptr, ptr %r7, align 8
  %2828 = getelementptr i8, ptr %2827, i64 1
  %2829 = load i8, ptr %2828, align 1
  %2830 = zext i8 %2829 to i64
  store i64 %2830, ptr %r1, align 4
  %2831 = load i64, ptr %r1, align 4
  %2832 = shl i64 %2831, 16
  store i64 %2832, ptr %r1, align 4
  %2833 = load ptr, ptr %r7, align 8
  %2834 = getelementptr i8, ptr %2833, i64 2
  %2835 = load i8, ptr %2834, align 1
  %2836 = zext i8 %2835 to i64
  store i64 %2836, ptr %r9, align 4
  %2837 = load i64, ptr %r9, align 4
  %2838 = shl i64 %2837, 8
  store i64 %2838, ptr %r9, align 4
  %2839 = load i64, ptr %r9, align 4
  %2840 = load i64, ptr %r1, align 4
  %2841 = or i64 %2839, %2840
  store i64 %2841, ptr %r9, align 4
  store i64 64, ptr %r1, align 4
  %2842 = load ptr, ptr %r7, align 8
  %2843 = getelementptr i8, ptr %2842, i64 3
  %2844 = load i8, ptr %2843, align 1
  %2845 = zext i8 %2844 to i64
  store i64 %2845, ptr %r2, align 4
  br label %bb_inst_1178

bb_inst_1178:                                     ; preds = %bb_inst_1171, %bb_inst_1160, %bb_inst_1117
  %2846 = load i64, ptr %r2, align 4
  %2847 = and i64 %2846, 255
  store i64 %2847, ptr %r2, align 4
  %2848 = load i64, ptr %r9, align 4
  %2849 = load i64, ptr %r2, align 4
  %2850 = or i64 %2848, %2849
  store i64 %2850, ptr %r9, align 4
  %2851 = load i64, ptr %r9, align 4
  store i64 %2851, ptr %r2, align 4
  %2852 = load i64, ptr %r2, align 4
  %2853 = shl i64 %2852, 32
  store i64 %2853, ptr %r2, align 4
  %2854 = load i64, ptr %r2, align 4
  %2855 = ashr i64 %2854, 32
  store i64 %2855, ptr %r2, align 4
  store i64 1, ptr %r3, align 4
  %2856 = load i64, ptr %r2, align 4
  %2857 = load i64, ptr %r3, align 4
  %2858 = icmp sgt i64 %2857, %2856
  br i1 %2858, label %bb_inst_1218, label %bb_inst_1185

bb_inst_1185:                                     ; preds = %bb_inst_1178
  %2859 = load i64, ptr %r8, align 4
  store i64 %2859, ptr %r2, align 4
  %2860 = load i64, ptr %r2, align 4
  %2861 = load i64, ptr %r1, align 4
  %2862 = add i64 %2860, %2861
  store i64 %2862, ptr %r2, align 4
  %2863 = load ptr, ptr %r2, align 8
  %2864 = getelementptr i8, ptr %2863, i64 0
  %2865 = load i64, ptr %2864, align 4
  store i64 %2865, ptr %r1, align 4
  %2866 = load i64, ptr %r1, align 4
  %2867 = add i64 %2866, 1
  store i64 %2867, ptr %r1, align 4
  %2868 = load i64, ptr %r1, align 4
  %2869 = load ptr, ptr %r2, align 8
  %2870 = getelementptr i8, ptr %2869, i64 0
  store i64 %2868, ptr %2870, align 4
  %2871 = load i64, ptr %r9, align 4
  %2872 = trunc i64 %2871 to i32
  %2873 = load ptr, ptr %r10, align 8
  %2874 = getelementptr i8, ptr %2873, i64 -20
  store i32 %2872, ptr %2874, align 4
  %2875 = load i64, ptr %r10, align 4
  store i64 %2875, ptr %r2, align 4
  %2876 = load i64, ptr %r2, align 4
  %2877 = add i64 %2876, -20
  store i64 %2877, ptr %r2, align 4
  %2878 = call i64 @__lddw_helper_map_by_fd(i32 16)
  store i64 %2878, ptr %r1, align 4
  %2879 = load i64, ptr %r1, align 4
  %2880 = load i64, ptr %r2, align 4
  %2881 = load i64, ptr %r3, align 4
  %2882 = load i64, ptr %r4, align 4
  %2883 = load i64, ptr %r5, align 4
  %2884 = call i64 @_bpf_helper_ext_0001(i64 %2879, i64 %2880, i64 %2881, i64 %2882, i64 %2883)
  store i64 %2884, ptr %r0, align 4
  br label %bb_inst_1196

bb_inst_1196:                                     ; preds = %bb_inst_1185
  %2885 = load i64, ptr %r0, align 4
  %2886 = icmp eq i64 %2885, 0
  br i1 %2886, label %bb_inst_1212, label %bb_inst_1197

bb_inst_1197:                                     ; preds = %bb_inst_1196
  %2887 = load ptr, ptr %r0, align 8
  %2888 = getelementptr i8, ptr %2887, i64 0
  %2889 = load i32, ptr %2888, align 4
  %2890 = zext i32 %2889 to i64
  store i64 %2890, ptr %r1, align 4
  %2891 = load i64, ptr %r1, align 4
  %2892 = trunc i64 %2891 to i32
  %2893 = load ptr, ptr %r10, align 8
  %2894 = getelementptr i8, ptr %2893, i64 -20
  store i32 %2892, ptr %2894, align 4
  %2895 = load i64, ptr %r1, align 4
  %2896 = icmp eq i64 %2895, 0
  br i1 %2896, label %bb_inst_1212, label %bb_inst_1200

bb_inst_1200:                                     ; preds = %bb_inst_1197
  %2897 = load i64, ptr %r1, align 4
  %2898 = trunc i64 %2897 to i32
  %2899 = load ptr, ptr %r10, align 8
  %2900 = getelementptr i8, ptr %2899, i64 -32
  store i32 %2898, ptr %2900, align 4
  %2901 = load i64, ptr %r10, align 4
  store i64 %2901, ptr %r2, align 4
  %2902 = load i64, ptr %r2, align 4
  %2903 = add i64 %2902, -20
  store i64 %2903, ptr %r2, align 4
  %2904 = call i64 @__lddw_helper_map_by_fd(i32 9)
  store i64 %2904, ptr %r1, align 4
  %2905 = load i64, ptr %r1, align 4
  %2906 = load i64, ptr %r2, align 4
  %2907 = load i64, ptr %r3, align 4
  %2908 = load i64, ptr %r4, align 4
  %2909 = load i64, ptr %r5, align 4
  %2910 = call i64 @_bpf_helper_ext_0001(i64 %2905, i64 %2906, i64 %2907, i64 %2908, i64 %2909)
  store i64 %2910, ptr %r0, align 4
  br label %bb_inst_1206

bb_inst_1206:                                     ; preds = %bb_inst_1200
  %2911 = load i64, ptr %r0, align 4
  %2912 = load ptr, ptr %r10, align 8
  %2913 = getelementptr i8, ptr %2912, i64 -168
  store i64 %2911, ptr %2913, align 4
  %2914 = load i64, ptr %r0, align 4
  %2915 = icmp ne i64 %2914, 0
  br i1 %2915, label %bb_inst_2019, label %bb_inst_1208

bb_inst_1208:                                     ; preds = %bb_inst_1206
  %2916 = load ptr, ptr %r8, align 8
  %2917 = getelementptr i8, ptr %2916, i64 40
  %2918 = load i64, ptr %2917, align 4
  store i64 %2918, ptr %r1, align 4
  %2919 = load i64, ptr %r1, align 4
  %2920 = add i64 %2919, 1
  store i64 %2920, ptr %r1, align 4
  %2921 = load i64, ptr %r1, align 4
  %2922 = load ptr, ptr %r8, align 8
  %2923 = getelementptr i8, ptr %2922, i64 40
  store i64 %2921, ptr %2923, align 4
  br label %bb_inst_941

bb_inst_1212:                                     ; preds = %bb_inst_1197, %bb_inst_1196
  %2924 = load i64, ptr %r9, align 4
  %2925 = shl i64 %2924, 32
  store i64 %2925, ptr %r9, align 4
  %2926 = load i64, ptr %r9, align 4
  %2927 = ashr i64 %2926, 32
  store i64 %2927, ptr %r9, align 4
  %2928 = load i64, ptr %r9, align 4
  %2929 = load ptr, ptr %r8, align 8
  %2930 = getelementptr i8, ptr %2929, i64 24
  store i64 %2928, ptr %2930, align 4
  %2931 = load ptr, ptr %r8, align 8
  %2932 = getelementptr i8, ptr %2931, i64 16
  %2933 = load i64, ptr %2932, align 4
  store i64 %2933, ptr %r1, align 4
  %2934 = load i64, ptr %r1, align 4
  %2935 = add i64 %2934, 1
  store i64 %2935, ptr %r1, align 4
  %2936 = load i64, ptr %r1, align 4
  %2937 = load ptr, ptr %r8, align 8
  %2938 = getelementptr i8, ptr %2937, i64 16
  store i64 %2936, ptr %2938, align 4
  br label %bb_inst_1218

bb_inst_1218:                                     ; preds = %bb_inst_1212, %bb_inst_1178, %bb_inst_1116, %bb_inst_1107, %bb_inst_675, %bb_inst_670, %bb_inst_661
  %2939 = load ptr, ptr %r8, align 8
  %2940 = getelementptr i8, ptr %2939, i64 0
  %2941 = load i64, ptr %2940, align 4
  store i64 %2941, ptr %r1, align 4
  %2942 = load i64, ptr %r1, align 4
  %2943 = add i64 %2942, 1
  store i64 %2943, ptr %r1, align 4
  %2944 = load i64, ptr %r1, align 4
  %2945 = load ptr, ptr %r8, align 8
  %2946 = getelementptr i8, ptr %2945, i64 0
  store i64 %2944, ptr %2946, align 4
  br label %bb_inst_1221

bb_inst_1221:                                     ; preds = %bb_inst_1218, %bb_inst_1156, %bb_inst_1155
  %2947 = load ptr, ptr %r10, align 8
  %2948 = getelementptr i8, ptr %2947, i64 -152
  %2949 = load i64, ptr %2948, align 4
  store i64 %2949, ptr %r3, align 4
  %2950 = load ptr, ptr %r10, align 8
  %2951 = getelementptr i8, ptr %2950, i64 -144
  %2952 = load i64, ptr %2951, align 4
  store i64 %2952, ptr %r2, align 4
  br label %bb_inst_1223

bb_inst_1223:                                     ; preds = %bb_inst_1221, %bb_inst_428, %bb_inst_401
  %2953 = load ptr, ptr %r10, align 8
  %2954 = getelementptr i8, ptr %2953, i64 -40
  %2955 = load i16, ptr %2954, align 2
  %2956 = zext i16 %2955 to i64
  store i64 %2956, ptr %r1, align 4
  %2957 = load i64, ptr %r1, align 4
  %2958 = load ptr, ptr %r10, align 8
  %2959 = getelementptr i8, ptr %2958, i64 -192
  store i64 %2957, ptr %2959, align 4
  %2960 = load ptr, ptr %r10, align 8
  %2961 = getelementptr i8, ptr %2960, i64 -28
  %2962 = load i8, ptr %2961, align 1
  %2963 = zext i8 %2962 to i64
  store i64 %2963, ptr %r1, align 4
  %2964 = load i64, ptr %r1, align 4
  %2965 = and i64 %2964, 2
  store i64 %2965, ptr %r1, align 4
  %2966 = load i64, ptr %r1, align 4
  %2967 = icmp ne i64 %2966, 0
  br i1 %2967, label %bb_inst_1259, label %bb_inst_1228

bb_inst_1228:                                     ; preds = %bb_inst_1223
  %2968 = load ptr, ptr %r2, align 8
  %2969 = getelementptr i8, ptr %2968, i64 0
  %2970 = load i32, ptr %2969, align 4
  %2971 = zext i32 %2970 to i64
  store i64 %2971, ptr %r1, align 4
  %2972 = load i64, ptr %r1, align 4
  %2973 = and i64 %2972, 2
  store i64 %2973, ptr %r1, align 4
  %2974 = load i64, ptr %r1, align 4
  %2975 = icmp ne i64 %2974, 0
  br i1 %2975, label %bb_inst_1259, label %bb_inst_1231

bb_inst_1231:                                     ; preds = %bb_inst_1228
  %2976 = load i64, ptr %r10, align 4
  store i64 %2976, ptr %r2, align 4
  %2977 = load i64, ptr %r2, align 4
  %2978 = add i64 %2977, -72
  store i64 %2978, ptr %r2, align 4
  %2979 = load i64, ptr %r3, align 4
  store i64 %2979, ptr %r7, align 4
  %2980 = load i64, ptr %r3, align 4
  store i64 %2980, ptr %r1, align 4
  %2981 = load i64, ptr %r1, align 4
  %2982 = load i64, ptr %r2, align 4
  %2983 = load i64, ptr %r3, align 4
  %2984 = load i64, ptr %r4, align 4
  %2985 = load i64, ptr %r5, align 4
  %2986 = call i64 @_bpf_helper_ext_0001(i64 %2981, i64 %2982, i64 %2983, i64 %2984, i64 %2985)
  store i64 %2986, ptr %r0, align 4
  br label %bb_inst_1236

bb_inst_1236:                                     ; preds = %bb_inst_1231
  %2987 = load i64, ptr %r0, align 4
  store i64 %2987, ptr %r8, align 4
  %2988 = load i64, ptr %r8, align 4
  %2989 = icmp eq i64 %2988, 0
  br i1 %2989, label %bb_inst_1808, label %bb_inst_1238

bb_inst_1238:                                     ; preds = %bb_inst_1236
  %2990 = load ptr, ptr %r10, align 8
  %2991 = getelementptr i8, ptr %2990, i64 -36
  %2992 = load i8, ptr %2991, align 1
  %2993 = zext i8 %2992 to i64
  store i64 %2993, ptr %r1, align 4
  %2994 = load i64, ptr %r1, align 4
  %2995 = icmp ne i64 %2994, 17
  br i1 %2995, label %bb_inst_1248, label %bb_inst_1240

bb_inst_1240:                                     ; preds = %bb_inst_1238
  %2996 = load i64, ptr %r1, align 4
  %2997 = load i64, ptr %r2, align 4
  %2998 = load i64, ptr %r3, align 4
  %2999 = load i64, ptr %r4, align 4
  %3000 = load i64, ptr %r5, align 4
  %3001 = call i64 @_bpf_helper_ext_0005(i64 %2996, i64 %2997, i64 %2998, i64 %2999, i64 %3000)
  store i64 %3001, ptr %r0, align 4
  br label %bb_inst_1241

bb_inst_1241:                                     ; preds = %bb_inst_1240
  %3002 = load ptr, ptr %r8, align 8
  %3003 = getelementptr i8, ptr %3002, i64 8
  %3004 = load i64, ptr %3003, align 4
  store i64 %3004, ptr %r1, align 4
  %3005 = load i64, ptr %r0, align 4
  store i64 %3005, ptr %r2, align 4
  %3006 = load i64, ptr %r2, align 4
  %3007 = load i64, ptr %r1, align 4
  %3008 = sub i64 %3006, %3007
  store i64 %3008, ptr %r2, align 4
  store i64 30000000000, ptr %r1, align 4
  %3009 = load i64, ptr %r1, align 4
  %3010 = load i64, ptr %r2, align 4
  %3011 = icmp ugt i64 %3010, %3009
  br i1 %3011, label %bb_inst_1808, label %bb_inst_1247

bb_inst_1247:                                     ; preds = %bb_inst_1241
  %3012 = load i64, ptr %r0, align 4
  %3013 = load ptr, ptr %r8, align 8
  %3014 = getelementptr i8, ptr %3013, i64 8
  store i64 %3012, ptr %3014, align 4
  br label %bb_inst_1248

bb_inst_1248:                                     ; preds = %bb_inst_1247, %bb_inst_1238
  %3015 = load ptr, ptr %r8, align 8
  %3016 = getelementptr i8, ptr %3015, i64 0
  %3017 = load i32, ptr %3016, align 4
  %3018 = zext i32 %3017 to i64
  store i64 %3018, ptr %r1, align 4
  %3019 = load i64, ptr %r1, align 4
  %3020 = trunc i64 %3019 to i32
  %3021 = load ptr, ptr %r10, align 8
  %3022 = getelementptr i8, ptr %3021, i64 -32
  store i32 %3020, ptr %3022, align 4
  %3023 = load i64, ptr %r1, align 4
  %3024 = trunc i64 %3023 to i32
  %3025 = load ptr, ptr %r10, align 8
  %3026 = getelementptr i8, ptr %3025, i64 -16
  store i32 %3024, ptr %3026, align 4
  %3027 = load i64, ptr %r10, align 4
  store i64 %3027, ptr %r2, align 4
  %3028 = load i64, ptr %r2, align 4
  %3029 = add i64 %3028, -16
  store i64 %3029, ptr %r2, align 4
  %3030 = call i64 @__lddw_helper_map_by_fd(i32 9)
  store i64 %3030, ptr %r1, align 4
  %3031 = load i64, ptr %r1, align 4
  %3032 = load i64, ptr %r2, align 4
  %3033 = load i64, ptr %r3, align 4
  %3034 = load i64, ptr %r4, align 4
  %3035 = load i64, ptr %r5, align 4
  %3036 = call i64 @_bpf_helper_ext_0001(i64 %3031, i64 %3032, i64 %3033, i64 %3034, i64 %3035)
  store i64 %3036, ptr %r0, align 4
  br label %bb_inst_1256

bb_inst_1256:                                     ; preds = %bb_inst_1248
  %3037 = load i64, ptr %r7, align 4
  store i64 %3037, ptr %r3, align 4
  %3038 = load i64, ptr %r0, align 4
  %3039 = load ptr, ptr %r10, align 8
  %3040 = getelementptr i8, ptr %3039, i64 -168
  store i64 %3038, ptr %3040, align 4
  %3041 = load i64, ptr %r0, align 4
  %3042 = icmp ne i64 %3041, 0
  br i1 %3042, label %bb_inst_1688, label %bb_inst_1259

bb_inst_1259:                                     ; preds = %bb_inst_1808, %bb_inst_1256, %bb_inst_1228, %bb_inst_1223
  %3043 = load ptr, ptr %r10, align 8
  %3044 = getelementptr i8, ptr %3043, i64 -36
  %3045 = load i8, ptr %3044, align 1
  %3046 = zext i8 %3045 to i64
  store i64 %3046, ptr %r1, align 4
  %3047 = load i64, ptr %r1, align 4
  %3048 = icmp ne i64 %3047, 6
  br i1 %3048, label %bb_inst_1281, label %bb_inst_1261

bb_inst_1261:                                     ; preds = %bb_inst_1259
  %3049 = load i64, ptr %r3, align 4
  store i64 %3049, ptr %r7, align 4
  store i64 513, ptr %r1, align 4
  %3050 = load i64, ptr %r1, align 4
  %3051 = trunc i64 %3050 to i32
  %3052 = load ptr, ptr %r10, align 8
  %3053 = getelementptr i8, ptr %3052, i64 -16
  store i32 %3051, ptr %3053, align 4
  %3054 = load i64, ptr %r10, align 4
  store i64 %3054, ptr %r2, align 4
  %3055 = load i64, ptr %r2, align 4
  %3056 = add i64 %3055, -16
  store i64 %3056, ptr %r2, align 4
  %3057 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %3057, ptr %r1, align 4
  %3058 = load i64, ptr %r1, align 4
  %3059 = load i64, ptr %r2, align 4
  %3060 = load i64, ptr %r3, align 4
  %3061 = load i64, ptr %r4, align 4
  %3062 = load i64, ptr %r5, align 4
  %3063 = call i64 @_bpf_helper_ext_0001(i64 %3058, i64 %3059, i64 %3060, i64 %3061, i64 %3062)
  store i64 %3063, ptr %r0, align 4
  br label %bb_inst_1269

bb_inst_1269:                                     ; preds = %bb_inst_1261
  %3064 = load i64, ptr %r0, align 4
  %3065 = icmp eq i64 %3064, 0
  br i1 %3065, label %bb_inst_941, label %bb_inst_1270

bb_inst_1270:                                     ; preds = %bb_inst_1269
  %3066 = load ptr, ptr %r10, align 8
  %3067 = getelementptr i8, ptr %3066, i64 -28
  %3068 = load i8, ptr %3067, align 1
  %3069 = zext i8 %3068 to i64
  store i64 %3069, ptr %r2, align 4
  %3070 = load i64, ptr %r2, align 4
  %3071 = and i64 %3070, 2
  store i64 %3071, ptr %r2, align 4
  store i64 1, ptr %r1, align 4
  %3072 = load i64, ptr %r2, align 4
  %3073 = icmp eq i64 %3072, 0
  br i1 %3073, label %bb_inst_1275, label %bb_inst_1274

bb_inst_1274:                                     ; preds = %bb_inst_1270
  store i64 0, ptr %r1, align 4
  br label %bb_inst_1275

bb_inst_1275:                                     ; preds = %bb_inst_1274, %bb_inst_1270
  %3074 = load i64, ptr %r1, align 4
  %3075 = shl i64 %3074, 3
  store i64 %3075, ptr %r1, align 4
  %3076 = load i64, ptr %r0, align 4
  %3077 = load i64, ptr %r1, align 4
  %3078 = add i64 %3076, %3077
  store i64 %3078, ptr %r0, align 4
  %3079 = load ptr, ptr %r0, align 8
  %3080 = getelementptr i8, ptr %3079, i64 0
  %3081 = load i64, ptr %3080, align 4
  store i64 %3081, ptr %r1, align 4
  %3082 = load i64, ptr %r1, align 4
  %3083 = add i64 %3082, 1
  store i64 %3083, ptr %r1, align 4
  %3084 = load i64, ptr %r1, align 4
  %3085 = load ptr, ptr %r0, align 8
  %3086 = getelementptr i8, ptr %3085, i64 0
  store i64 %3084, ptr %3086, align 4
  %3087 = load i64, ptr %r7, align 4
  store i64 %3087, ptr %r3, align 4
  br label %bb_inst_1281

bb_inst_1281:                                     ; preds = %bb_inst_1275, %bb_inst_1259
  %3088 = load i64, ptr %r3, align 4
  %3089 = load ptr, ptr %r10, align 8
  %3090 = getelementptr i8, ptr %3089, i64 -152
  store i64 %3088, ptr %3090, align 4
  store i64 0, ptr %r7, align 4
  %3091 = load i64, ptr %r7, align 4
  %3092 = load ptr, ptr %r10, align 8
  %3093 = getelementptr i8, ptr %3092, i64 -8
  store i64 %3091, ptr %3093, align 4
  %3094 = load i64, ptr %r7, align 4
  %3095 = load ptr, ptr %r10, align 8
  %3096 = getelementptr i8, ptr %3095, i64 -16
  store i64 %3094, ptr %3096, align 4
  store i64 514, ptr %r1, align 4
  %3097 = load i64, ptr %r1, align 4
  %3098 = trunc i64 %3097 to i32
  %3099 = load ptr, ptr %r10, align 8
  %3100 = getelementptr i8, ptr %3099, i64 -120
  store i32 %3098, ptr %3100, align 4
  %3101 = load i64, ptr %r10, align 4
  store i64 %3101, ptr %r2, align 4
  %3102 = load i64, ptr %r2, align 4
  %3103 = add i64 %3102, -120
  store i64 %3103, ptr %r2, align 4
  %3104 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %3104, ptr %r1, align 4
  %3105 = load i64, ptr %r1, align 4
  %3106 = load i64, ptr %r2, align 4
  %3107 = load i64, ptr %r3, align 4
  %3108 = load i64, ptr %r4, align 4
  %3109 = load i64, ptr %r5, align 4
  %3110 = call i64 @_bpf_helper_ext_0001(i64 %3105, i64 %3106, i64 %3107, i64 %3108, i64 %3109)
  store i64 %3110, ptr %r0, align 4
  br label %bb_inst_1292

bb_inst_1292:                                     ; preds = %bb_inst_1281
  %3111 = load i64, ptr %r0, align 4
  store i64 %3111, ptr %r8, align 4
  store i64 1, ptr %r9, align 4
  %3112 = load i64, ptr %r8, align 4
  %3113 = icmp eq i64 %3112, 0
  br i1 %3113, label %bb_inst_1311, label %bb_inst_1295

bb_inst_1295:                                     ; preds = %bb_inst_1292
  %3114 = load i64, ptr %r1, align 4
  %3115 = load i64, ptr %r2, align 4
  %3116 = load i64, ptr %r3, align 4
  %3117 = load i64, ptr %r4, align 4
  %3118 = load i64, ptr %r5, align 4
  %3119 = call i64 @_bpf_helper_ext_0005(i64 %3114, i64 %3115, i64 %3116, i64 %3117, i64 %3118)
  store i64 %3119, ptr %r0, align 4
  br label %bb_inst_1296

bb_inst_1296:                                     ; preds = %bb_inst_1295
  %3120 = load i64, ptr %r0, align 4
  store i64 %3120, ptr %r7, align 4
  %3121 = load ptr, ptr %r8, align 8
  %3122 = getelementptr i8, ptr %3121, i64 8
  %3123 = load i64, ptr %3122, align 4
  store i64 %3123, ptr %r1, align 4
  %3124 = load i64, ptr %r7, align 4
  store i64 %3124, ptr %r2, align 4
  %3125 = load i64, ptr %r2, align 4
  %3126 = load i64, ptr %r1, align 4
  %3127 = sub i64 %3125, %3126
  store i64 %3127, ptr %r2, align 4
  store i64 1000000001, ptr %r1, align 4
  %3128 = load i64, ptr %r2, align 4
  %3129 = load i64, ptr %r1, align 4
  %3130 = icmp ugt i64 %3129, %3128
  br i1 %3130, label %bb_inst_1306, label %bb_inst_1302

bb_inst_1302:                                     ; preds = %bb_inst_1296
  %3131 = load i64, ptr %r7, align 4
  %3132 = load ptr, ptr %r8, align 8
  %3133 = getelementptr i8, ptr %3132, i64 8
  store i64 %3131, ptr %3133, align 4
  store i64 1, ptr %r1, align 4
  %3134 = load i64, ptr %r1, align 4
  %3135 = load ptr, ptr %r8, align 8
  %3136 = getelementptr i8, ptr %3135, i64 0
  store i64 %3134, ptr %3136, align 4
  br label %bb_inst_1310

bb_inst_1306:                                     ; preds = %bb_inst_1296
  %3137 = load ptr, ptr %r8, align 8
  %3138 = getelementptr i8, ptr %3137, i64 0
  %3139 = load i64, ptr %3138, align 4
  store i64 %3139, ptr %r1, align 4
  %3140 = load i64, ptr %r1, align 4
  %3141 = add i64 %3140, 1
  store i64 %3141, ptr %r1, align 4
  %3142 = load i64, ptr %r1, align 4
  %3143 = load ptr, ptr %r8, align 8
  %3144 = getelementptr i8, ptr %3143, i64 0
  store i64 %3142, ptr %3144, align 4
  %3145 = load i64, ptr %r1, align 4
  %3146 = icmp ugt i64 %3145, 125000
  br i1 %3146, label %bb_inst_1311, label %bb_inst_1310

bb_inst_1310:                                     ; preds = %bb_inst_1306, %bb_inst_1302
  store i64 0, ptr %r9, align 4
  br label %bb_inst_1311

bb_inst_1311:                                     ; preds = %bb_inst_1310, %bb_inst_1306, %bb_inst_1292
  %3147 = load i64, ptr %r9, align 4
  %3148 = load ptr, ptr %r10, align 8
  %3149 = getelementptr i8, ptr %3148, i64 -184
  store i64 %3147, ptr %3149, align 4
  %3150 = load ptr, ptr %r10, align 8
  %3151 = getelementptr i8, ptr %3150, i64 -144
  %3152 = load i64, ptr %3151, align 4
  store i64 %3152, ptr %r1, align 4
  %3153 = load ptr, ptr %r1, align 8
  %3154 = getelementptr i8, ptr %3153, i64 0
  %3155 = load i32, ptr %3154, align 4
  %3156 = zext i32 %3155 to i64
  store i64 %3156, ptr %r1, align 4
  %3157 = load i64, ptr %r1, align 4
  %3158 = and i64 %3157, 8
  store i64 %3158, ptr %r1, align 4
  %3159 = load i64, ptr %r7, align 4
  %3160 = load ptr, ptr %r10, align 8
  %3161 = getelementptr i8, ptr %3160, i64 -200
  store i64 %3159, ptr %3161, align 4
  %3162 = load i64, ptr %r1, align 4
  %3163 = icmp ne i64 %3162, 0
  br i1 %3163, label %bb_inst_1326, label %bb_inst_1317

bb_inst_1317:                                     ; preds = %bb_inst_1311
  %3164 = load ptr, ptr %r10, align 8
  %3165 = getelementptr i8, ptr %3164, i64 -60
  %3166 = load i8, ptr %3165, align 1
  %3167 = zext i8 %3166 to i64
  store i64 %3167, ptr %r1, align 4
  %3168 = load i64, ptr %r1, align 4
  %3169 = load ptr, ptr %r10, align 8
  %3170 = getelementptr i8, ptr %3169, i64 -176
  store i64 %3168, ptr %3170, align 4
  %3171 = load ptr, ptr %r10, align 8
  %3172 = getelementptr i8, ptr %3171, i64 -59
  %3173 = load i8, ptr %3172, align 1
  %3174 = zext i8 %3173 to i64
  store i64 %3174, ptr %r9, align 4
  %3175 = load ptr, ptr %r10, align 8
  %3176 = getelementptr i8, ptr %3175, i64 -58
  %3177 = load i8, ptr %3176, align 1
  %3178 = zext i8 %3177 to i64
  store i64 %3178, ptr %r0, align 4
  %3179 = load ptr, ptr %r10, align 8
  %3180 = getelementptr i8, ptr %3179, i64 -57
  %3181 = load i8, ptr %3180, align 1
  %3182 = zext i8 %3181 to i64
  store i64 %3182, ptr %r8, align 4
  %3183 = load ptr, ptr %r10, align 8
  %3184 = getelementptr i8, ptr %3183, i64 -64
  %3185 = load i32, ptr %3184, align 4
  %3186 = zext i32 %3185 to i64
  store i64 %3186, ptr %r4, align 4
  %3187 = load ptr, ptr %r10, align 8
  %3188 = getelementptr i8, ptr %3187, i64 -68
  %3189 = load i32, ptr %3188, align 4
  %3190 = zext i32 %3189 to i64
  store i64 %3190, ptr %r2, align 4
  %3191 = load ptr, ptr %r10, align 8
  %3192 = getelementptr i8, ptr %3191, i64 -72
  %3193 = load i32, ptr %3192, align 4
  %3194 = zext i32 %3193 to i64
  store i64 %3194, ptr %r1, align 4
  br label %bb_inst_1340

bb_inst_1326:                                     ; preds = %bb_inst_1311
  %3195 = load ptr, ptr %r10, align 8
  %3196 = getelementptr i8, ptr %3195, i64 -136
  %3197 = load i64, ptr %3196, align 4
  store i64 %3197, ptr %r1, align 4
  %3198 = load ptr, ptr %r1, align 8
  %3199 = getelementptr i8, ptr %3198, i64 2
  %3200 = load i16, ptr %3199, align 2
  %3201 = zext i16 %3200 to i64
  store i64 %3201, ptr %r1, align 4
  %3202 = load i64, ptr %r1, align 4
  %3203 = trunc i64 %3202 to i16
  %3204 = load ptr, ptr %r10, align 8
  %3205 = getelementptr i8, ptr %3204, i64 -40
  store i16 %3203, ptr %3205, align 2
  store i64 0, ptr %r2, align 4
  %3206 = load i64, ptr %r2, align 4
  %3207 = load ptr, ptr %r10, align 8
  %3208 = getelementptr i8, ptr %3207, i64 -72
  store i64 %3206, ptr %3208, align 4
  store i64 0, ptr %r1, align 4
  %3209 = load i64, ptr %r1, align 4
  %3210 = load ptr, ptr %r10, align 8
  %3211 = getelementptr i8, ptr %3210, i64 -176
  store i64 %3209, ptr %3211, align 4
  %3212 = load i64, ptr %r2, align 4
  %3213 = load ptr, ptr %r10, align 8
  %3214 = getelementptr i8, ptr %3213, i64 -64
  store i64 %3212, ptr %3214, align 4
  store i64 0, ptr %r9, align 4
  store i64 0, ptr %r0, align 4
  store i64 0, ptr %r8, align 4
  store i64 0, ptr %r4, align 4
  store i64 0, ptr %r2, align 4
  store i64 0, ptr %r1, align 4
  br label %bb_inst_1340

bb_inst_1340:                                     ; preds = %bb_inst_1326, %bb_inst_1317
  %3215 = load i64, ptr %r1, align 4
  %3216 = load i64, ptr %r4, align 4
  %3217 = sub i64 %3215, %3216
  store i64 %3217, ptr %r1, align 4
  %3218 = load i64, ptr %r4, align 4
  %3219 = add i64 %3218, -559038209
  store i64 %3219, ptr %r4, align 4
  store i64 4026531840, ptr %r3, align 4
  %3220 = load i64, ptr %r4, align 4
  store i64 %3220, ptr %r5, align 4
  %3221 = load i64, ptr %r5, align 4
  %3222 = load i64, ptr %r3, align 4
  %3223 = and i64 %3221, %3222
  store i64 %3223, ptr %r5, align 4
  %3224 = load i64, ptr %r5, align 4
  %3225 = lshr i64 %3224, 28
  store i64 %3225, ptr %r5, align 4
  %3226 = load i64, ptr %r4, align 4
  store i64 %3226, ptr %r7, align 4
  %3227 = load i64, ptr %r7, align 4
  %3228 = shl i64 %3227, 4
  store i64 %3228, ptr %r7, align 4
  %3229 = load i64, ptr %r7, align 4
  %3230 = load i64, ptr %r5, align 4
  %3231 = or i64 %3229, %3230
  store i64 %3231, ptr %r7, align 4
  %3232 = load i64, ptr %r7, align 4
  %3233 = load i64, ptr %r1, align 4
  %3234 = xor i64 %3232, %3233
  store i64 %3234, ptr %r7, align 4
  store i64 4227858432, ptr %r1, align 4
  %3235 = load i64, ptr %r7, align 4
  store i64 %3235, ptr %r5, align 4
  %3236 = load i64, ptr %r5, align 4
  %3237 = load i64, ptr %r1, align 4
  %3238 = and i64 %3236, %3237
  store i64 %3238, ptr %r5, align 4
  %3239 = load i64, ptr %r5, align 4
  %3240 = lshr i64 %3239, 26
  store i64 %3240, ptr %r5, align 4
  %3241 = load i64, ptr %r7, align 4
  store i64 %3241, ptr %r3, align 4
  %3242 = load i64, ptr %r3, align 4
  %3243 = shl i64 %3242, 6
  store i64 %3243, ptr %r3, align 4
  %3244 = load i64, ptr %r3, align 4
  %3245 = load i64, ptr %r5, align 4
  %3246 = or i64 %3244, %3245
  store i64 %3246, ptr %r3, align 4
  %3247 = load i64, ptr %r2, align 4
  %3248 = add i64 %3247, -559038209
  store i64 %3248, ptr %r2, align 4
  %3249 = load i64, ptr %r2, align 4
  store i64 %3249, ptr %r1, align 4
  %3250 = load i64, ptr %r1, align 4
  %3251 = load i64, ptr %r7, align 4
  %3252 = sub i64 %3250, %3251
  store i64 %3252, ptr %r1, align 4
  %3253 = load i64, ptr %r1, align 4
  %3254 = load i64, ptr %r3, align 4
  %3255 = xor i64 %3253, %3254
  store i64 %3255, ptr %r1, align 4
  %3256 = load i64, ptr %r8, align 4
  %3257 = shl i64 %3256, 24
  store i64 %3257, ptr %r8, align 4
  %3258 = load i64, ptr %r0, align 4
  %3259 = and i64 %3258, 255
  store i64 %3259, ptr %r0, align 4
  %3260 = load i64, ptr %r0, align 4
  %3261 = shl i64 %3260, 16
  store i64 %3261, ptr %r0, align 4
  %3262 = load i64, ptr %r0, align 4
  %3263 = load i64, ptr %r8, align 4
  %3264 = or i64 %3262, %3263
  store i64 %3264, ptr %r0, align 4
  %3265 = load ptr, ptr %r10, align 8
  %3266 = getelementptr i8, ptr %3265, i64 -40
  %3267 = load i32, ptr %3266, align 4
  %3268 = zext i32 %3267 to i64
  store i64 %3268, ptr %r8, align 4
  %3269 = load i64, ptr %r8, align 4
  %3270 = add i64 %3269, -525483785
  store i64 %3270, ptr %r8, align 4
  %3271 = load i64, ptr %r8, align 4
  store i64 %3271, ptr %r3, align 4
  %3272 = load i64, ptr %r2, align 4
  store i64 %3272, ptr %r5, align 4
  %3273 = load i64, ptr %r8, align 4
  store i64 %3273, ptr %r2, align 4
  %3274 = load i64, ptr %r2, align 4
  %3275 = load ptr, ptr %r10, align 8
  %3276 = getelementptr i8, ptr %3275, i64 -136
  store i64 %3274, ptr %3276, align 4
  store i64 4294705152, ptr %r8, align 4
  %3277 = load i64, ptr %r3, align 4
  %3278 = load i64, ptr %r8, align 4
  %3279 = and i64 %3277, %3278
  store i64 %3279, ptr %r3, align 4
  %3280 = load i64, ptr %r3, align 4
  %3281 = lshr i64 %3280, 18
  store i64 %3281, ptr %r3, align 4
  %3282 = load i64, ptr %r2, align 4
  store i64 %3282, ptr %r8, align 4
  %3283 = load i64, ptr %r8, align 4
  %3284 = shl i64 %3283, 14
  store i64 %3284, ptr %r8, align 4
  %3285 = load i64, ptr %r8, align 4
  %3286 = load i64, ptr %r3, align 4
  %3287 = or i64 %3285, %3286
  store i64 %3287, ptr %r8, align 4
  %3288 = load i64, ptr %r2, align 4
  %3289 = xor i64 %3288, -525483785
  store i64 %3289, ptr %r2, align 4
  %3290 = load i64, ptr %r2, align 4
  %3291 = load i64, ptr %r8, align 4
  %3292 = sub i64 %3290, %3291
  store i64 %3292, ptr %r2, align 4
  %3293 = load i64, ptr %r2, align 4
  store i64 %3293, ptr %r8, align 4
  %3294 = load i64, ptr %r4, align 4
  %3295 = load i64, ptr %r5, align 4
  %3296 = add i64 %3294, %3295
  store i64 %3296, ptr %r4, align 4
  %3297 = load i64, ptr %r9, align 4
  %3298 = and i64 %3297, 255
  store i64 %3298, ptr %r9, align 4
  %3299 = load i64, ptr %r9, align 4
  %3300 = shl i64 %3299, 8
  store i64 %3300, ptr %r9, align 4
  %3301 = load i64, ptr %r0, align 4
  %3302 = load i64, ptr %r9, align 4
  %3303 = or i64 %3301, %3302
  store i64 %3303, ptr %r0, align 4
  %3304 = load ptr, ptr %r10, align 8
  %3305 = getelementptr i8, ptr %3304, i64 -176
  %3306 = load i64, ptr %3305, align 4
  store i64 %3306, ptr %r2, align 4
  %3307 = load i64, ptr %r2, align 4
  %3308 = and i64 %3307, 255
  store i64 %3308, ptr %r2, align 4
  %3309 = load i64, ptr %r0, align 4
  %3310 = load i64, ptr %r2, align 4
  %3311 = or i64 %3309, %3310
  store i64 %3311, ptr %r0, align 4
  store i64 4278190080, ptr %r2, align 4
  %3312 = load i64, ptr %r1, align 4
  store i64 %3312, ptr %r3, align 4
  %3313 = load i64, ptr %r3, align 4
  %3314 = load i64, ptr %r2, align 4
  %3315 = and i64 %3313, %3314
  store i64 %3315, ptr %r3, align 4
  %3316 = load i64, ptr %r3, align 4
  %3317 = lshr i64 %3316, 24
  store i64 %3317, ptr %r3, align 4
  %3318 = load i64, ptr %r1, align 4
  store i64 %3318, ptr %r2, align 4
  %3319 = load i64, ptr %r2, align 4
  %3320 = shl i64 %3319, 8
  store i64 %3320, ptr %r2, align 4
  %3321 = load i64, ptr %r2, align 4
  %3322 = load i64, ptr %r3, align 4
  %3323 = or i64 %3321, %3322
  store i64 %3323, ptr %r2, align 4
  %3324 = load i64, ptr %r7, align 4
  %3325 = load i64, ptr %r4, align 4
  %3326 = add i64 %3324, %3325
  store i64 %3326, ptr %r7, align 4
  %3327 = load i64, ptr %r4, align 4
  %3328 = load i64, ptr %r1, align 4
  %3329 = sub i64 %3327, %3328
  store i64 %3329, ptr %r4, align 4
  %3330 = load i64, ptr %r4, align 4
  %3331 = load i64, ptr %r2, align 4
  %3332 = xor i64 %3330, %3331
  store i64 %3332, ptr %r4, align 4
  store i64 4292870144, ptr %r3, align 4
  %3333 = load i64, ptr %r8, align 4
  store i64 %3333, ptr %r9, align 4
  %3334 = load i64, ptr %r9, align 4
  %3335 = load ptr, ptr %r10, align 8
  %3336 = getelementptr i8, ptr %3335, i64 -168
  store i64 %3334, ptr %3336, align 4
  %3337 = load i64, ptr %r9, align 4
  store i64 %3337, ptr %r2, align 4
  %3338 = load i64, ptr %r2, align 4
  %3339 = load i64, ptr %r3, align 4
  %3340 = and i64 %3338, %3339
  store i64 %3340, ptr %r2, align 4
  %3341 = load i64, ptr %r2, align 4
  %3342 = lshr i64 %3341, 21
  store i64 %3342, ptr %r2, align 4
  %3343 = load i64, ptr %r9, align 4
  %3344 = shl i64 %3343, 11
  store i64 %3344, ptr %r9, align 4
  %3345 = load i64, ptr %r9, align 4
  %3346 = load i64, ptr %r2, align 4
  %3347 = or i64 %3345, %3346
  store i64 %3347, ptr %r9, align 4
  store i64 4294901760, ptr %r3, align 4
  %3348 = load i64, ptr %r4, align 4
  store i64 %3348, ptr %r2, align 4
  %3349 = load i64, ptr %r2, align 4
  %3350 = load i64, ptr %r3, align 4
  %3351 = and i64 %3349, %3350
  store i64 %3351, ptr %r2, align 4
  %3352 = load i64, ptr %r2, align 4
  %3353 = lshr i64 %3352, 16
  store i64 %3353, ptr %r2, align 4
  %3354 = load i64, ptr %r4, align 4
  store i64 %3354, ptr %r3, align 4
  %3355 = load i64, ptr %r3, align 4
  %3356 = shl i64 %3355, 16
  store i64 %3356, ptr %r3, align 4
  %3357 = load i64, ptr %r3, align 4
  %3358 = load i64, ptr %r2, align 4
  %3359 = or i64 %3357, %3358
  store i64 %3359, ptr %r3, align 4
  %3360 = load i64, ptr %r1, align 4
  %3361 = load i64, ptr %r7, align 4
  %3362 = add i64 %3360, %3361
  store i64 %3362, ptr %r1, align 4
  %3363 = load i64, ptr %r7, align 4
  %3364 = load i64, ptr %r4, align 4
  %3365 = sub i64 %3363, %3364
  store i64 %3365, ptr %r7, align 4
  %3366 = load i64, ptr %r7, align 4
  %3367 = load i64, ptr %r3, align 4
  %3368 = xor i64 %3366, %3367
  store i64 %3368, ptr %r7, align 4
  store i64 4294959104, ptr %r2, align 4
  %3369 = load i64, ptr %r7, align 4
  store i64 %3369, ptr %r3, align 4
  %3370 = load i64, ptr %r3, align 4
  %3371 = load i64, ptr %r2, align 4
  %3372 = and i64 %3370, %3371
  store i64 %3372, ptr %r3, align 4
  %3373 = load i64, ptr %r3, align 4
  %3374 = lshr i64 %3373, 13
  store i64 %3374, ptr %r3, align 4
  %3375 = load i64, ptr %r7, align 4
  store i64 %3375, ptr %r2, align 4
  %3376 = load i64, ptr %r2, align 4
  %3377 = shl i64 %3376, 19
  store i64 %3377, ptr %r2, align 4
  %3378 = load i64, ptr %r2, align 4
  %3379 = load i64, ptr %r3, align 4
  %3380 = or i64 %3378, %3379
  store i64 %3380, ptr %r2, align 4
  %3381 = load i64, ptr %r4, align 4
  %3382 = load i64, ptr %r1, align 4
  %3383 = add i64 %3381, %3382
  store i64 %3383, ptr %r4, align 4
  %3384 = load i64, ptr %r1, align 4
  %3385 = load i64, ptr %r7, align 4
  %3386 = sub i64 %3384, %3385
  store i64 %3386, ptr %r1, align 4
  %3387 = load i64, ptr %r1, align 4
  %3388 = load i64, ptr %r2, align 4
  %3389 = xor i64 %3387, %3388
  store i64 %3389, ptr %r1, align 4
  %3390 = load i64, ptr %r7, align 4
  %3391 = load i64, ptr %r4, align 4
  %3392 = add i64 %3390, %3391
  store i64 %3392, ptr %r7, align 4
  %3393 = load i64, ptr %r1, align 4
  store i64 %3393, ptr %r5, align 4
  %3394 = load i64, ptr %r5, align 4
  %3395 = load i64, ptr %r7, align 4
  %3396 = add i64 %3394, %3395
  store i64 %3396, ptr %r5, align 4
  %3397 = load i64, ptr %r5, align 4
  store i64 %3397, ptr %r3, align 4
  store i64 4294705152, ptr %r2, align 4
  %3398 = load i64, ptr %r3, align 4
  %3399 = load i64, ptr %r2, align 4
  %3400 = and i64 %3398, %3399
  store i64 %3400, ptr %r3, align 4
  %3401 = load i64, ptr %r3, align 4
  %3402 = lshr i64 %3401, 18
  store i64 %3402, ptr %r3, align 4
  %3403 = load i64, ptr %r5, align 4
  store i64 %3403, ptr %r2, align 4
  %3404 = load i64, ptr %r2, align 4
  %3405 = shl i64 %3404, 14
  store i64 %3405, ptr %r2, align 4
  %3406 = load i64, ptr %r2, align 4
  %3407 = load i64, ptr %r3, align 4
  %3408 = or i64 %3406, %3407
  store i64 %3408, ptr %r2, align 4
  %3409 = load i64, ptr %r1, align 4
  store i64 %3409, ptr %r3, align 4
  store i64 4026531840, ptr %r8, align 4
  %3410 = load i64, ptr %r3, align 4
  %3411 = load i64, ptr %r8, align 4
  %3412 = and i64 %3410, %3411
  store i64 %3412, ptr %r3, align 4
  %3413 = load i64, ptr %r3, align 4
  %3414 = lshr i64 %3413, 28
  store i64 %3414, ptr %r3, align 4
  %3415 = load i64, ptr %r4, align 4
  %3416 = load i64, ptr %r1, align 4
  %3417 = sub i64 %3415, %3416
  store i64 %3417, ptr %r4, align 4
  %3418 = load i64, ptr %r1, align 4
  %3419 = shl i64 %3418, 4
  store i64 %3419, ptr %r1, align 4
  %3420 = load i64, ptr %r1, align 4
  %3421 = load i64, ptr %r3, align 4
  %3422 = or i64 %3420, %3421
  store i64 %3422, ptr %r1, align 4
  %3423 = load i64, ptr %r4, align 4
  %3424 = load i64, ptr %r1, align 4
  %3425 = xor i64 %3423, %3424
  store i64 %3425, ptr %r4, align 4
  %3426 = load i64, ptr %r7, align 4
  %3427 = load i64, ptr %r0, align 4
  %3428 = add i64 %3426, %3427
  store i64 %3428, ptr %r7, align 4
  %3429 = load i64, ptr %r4, align 4
  %3430 = load i64, ptr %r5, align 4
  %3431 = xor i64 %3429, %3430
  store i64 %3431, ptr %r4, align 4
  %3432 = load i64, ptr %r4, align 4
  %3433 = load i64, ptr %r2, align 4
  %3434 = sub i64 %3432, %3433
  store i64 %3434, ptr %r4, align 4
  %3435 = load i64, ptr %r4, align 4
  store i64 %3435, ptr %r1, align 4
  store i64 4292870144, ptr %r2, align 4
  %3436 = load i64, ptr %r1, align 4
  %3437 = load i64, ptr %r2, align 4
  %3438 = and i64 %3436, %3437
  store i64 %3438, ptr %r1, align 4
  %3439 = load i64, ptr %r1, align 4
  %3440 = lshr i64 %3439, 21
  store i64 %3440, ptr %r1, align 4
  %3441 = load i64, ptr %r4, align 4
  store i64 %3441, ptr %r2, align 4
  %3442 = load i64, ptr %r2, align 4
  %3443 = shl i64 %3442, 11
  store i64 %3443, ptr %r2, align 4
  %3444 = load i64, ptr %r2, align 4
  %3445 = load i64, ptr %r1, align 4
  %3446 = or i64 %3444, %3445
  store i64 %3446, ptr %r2, align 4
  %3447 = load i64, ptr %r4, align 4
  store i64 %3447, ptr %r0, align 4
  %3448 = load i64, ptr %r0, align 4
  %3449 = load i64, ptr %r7, align 4
  %3450 = xor i64 %3448, %3449
  store i64 %3450, ptr %r0, align 4
  %3451 = load i64, ptr %r0, align 4
  %3452 = load i64, ptr %r2, align 4
  %3453 = sub i64 %3451, %3452
  store i64 %3453, ptr %r0, align 4
  store i64 4294967168, ptr %r1, align 4
  %3454 = load i64, ptr %r0, align 4
  store i64 %3454, ptr %r2, align 4
  %3455 = load i64, ptr %r2, align 4
  %3456 = load i64, ptr %r1, align 4
  %3457 = and i64 %3455, %3456
  store i64 %3457, ptr %r2, align 4
  %3458 = load i64, ptr %r2, align 4
  %3459 = lshr i64 %3458, 7
  store i64 %3459, ptr %r2, align 4
  %3460 = load i64, ptr %r0, align 4
  store i64 %3460, ptr %r7, align 4
  %3461 = load i64, ptr %r7, align 4
  %3462 = shl i64 %3461, 25
  store i64 %3462, ptr %r7, align 4
  %3463 = load i64, ptr %r7, align 4
  %3464 = load i64, ptr %r2, align 4
  %3465 = or i64 %3463, %3464
  store i64 %3465, ptr %r7, align 4
  %3466 = load i64, ptr %r0, align 4
  store i64 %3466, ptr %r3, align 4
  %3467 = load i64, ptr %r3, align 4
  %3468 = load i64, ptr %r5, align 4
  %3469 = xor i64 %3467, %3468
  store i64 %3469, ptr %r3, align 4
  %3470 = load i64, ptr %r3, align 4
  %3471 = load i64, ptr %r7, align 4
  %3472 = sub i64 %3470, %3471
  store i64 %3472, ptr %r3, align 4
  %3473 = load i64, ptr %r3, align 4
  store i64 %3473, ptr %r2, align 4
  store i64 4294901760, ptr %r5, align 4
  %3474 = load i64, ptr %r2, align 4
  %3475 = load i64, ptr %r5, align 4
  %3476 = and i64 %3474, %3475
  store i64 %3476, ptr %r2, align 4
  %3477 = load i64, ptr %r2, align 4
  %3478 = lshr i64 %3477, 16
  store i64 %3478, ptr %r2, align 4
  %3479 = load i64, ptr %r3, align 4
  store i64 %3479, ptr %r5, align 4
  %3480 = load i64, ptr %r5, align 4
  %3481 = shl i64 %3480, 16
  store i64 %3481, ptr %r5, align 4
  %3482 = load i64, ptr %r5, align 4
  %3483 = load i64, ptr %r2, align 4
  %3484 = or i64 %3482, %3483
  store i64 %3484, ptr %r5, align 4
  %3485 = load i64, ptr %r3, align 4
  store i64 %3485, ptr %r8, align 4
  %3486 = load i64, ptr %r8, align 4
  %3487 = load i64, ptr %r4, align 4
  %3488 = xor i64 %3486, %3487
  store i64 %3488, ptr %r8, align 4
  %3489 = load i64, ptr %r8, align 4
  %3490 = load i64, ptr %r5, align 4
  %3491 = sub i64 %3489, %3490
  store i64 %3491, ptr %r8, align 4
  %3492 = load i64, ptr %r8, align 4
  store i64 %3492, ptr %r2, align 4
  store i64 4026531840, ptr %r7, align 4
  %3493 = load i64, ptr %r2, align 4
  %3494 = load i64, ptr %r7, align 4
  %3495 = and i64 %3493, %3494
  store i64 %3495, ptr %r2, align 4
  %3496 = load i64, ptr %r2, align 4
  %3497 = lshr i64 %3496, 28
  store i64 %3497, ptr %r2, align 4
  %3498 = load i64, ptr %r8, align 4
  store i64 %3498, ptr %r4, align 4
  %3499 = load i64, ptr %r4, align 4
  %3500 = shl i64 %3499, 4
  store i64 %3500, ptr %r4, align 4
  %3501 = load i64, ptr %r4, align 4
  %3502 = load i64, ptr %r2, align 4
  %3503 = or i64 %3501, %3502
  store i64 %3503, ptr %r4, align 4
  %3504 = load i64, ptr %r8, align 4
  store i64 %3504, ptr %r2, align 4
  %3505 = load i64, ptr %r2, align 4
  %3506 = load i64, ptr %r0, align 4
  %3507 = xor i64 %3505, %3506
  store i64 %3507, ptr %r2, align 4
  %3508 = load i64, ptr %r2, align 4
  %3509 = load i64, ptr %r4, align 4
  %3510 = sub i64 %3508, %3509
  store i64 %3510, ptr %r2, align 4
  %3511 = load i64, ptr %r2, align 4
  store i64 %3511, ptr %r4, align 4
  store i64 4294705152, ptr %r5, align 4
  %3512 = load i64, ptr %r4, align 4
  %3513 = load i64, ptr %r5, align 4
  %3514 = and i64 %3512, %3513
  store i64 %3514, ptr %r4, align 4
  %3515 = load i64, ptr %r4, align 4
  %3516 = lshr i64 %3515, 18
  store i64 %3516, ptr %r4, align 4
  %3517 = load i64, ptr %r2, align 4
  store i64 %3517, ptr %r5, align 4
  %3518 = load i64, ptr %r5, align 4
  %3519 = shl i64 %3518, 14
  store i64 %3519, ptr %r5, align 4
  %3520 = load i64, ptr %r5, align 4
  %3521 = load i64, ptr %r4, align 4
  %3522 = or i64 %3520, %3521
  store i64 %3522, ptr %r5, align 4
  %3523 = load i64, ptr %r2, align 4
  %3524 = load i64, ptr %r3, align 4
  %3525 = xor i64 %3523, %3524
  store i64 %3525, ptr %r2, align 4
  %3526 = load i64, ptr %r2, align 4
  %3527 = load i64, ptr %r5, align 4
  %3528 = sub i64 %3526, %3527
  store i64 %3528, ptr %r2, align 4
  store i64 4294967040, ptr %r3, align 4
  %3529 = load i64, ptr %r2, align 4
  store i64 %3529, ptr %r4, align 4
  %3530 = load i64, ptr %r4, align 4
  %3531 = load i64, ptr %r3, align 4
  %3532 = and i64 %3530, %3531
  store i64 %3532, ptr %r4, align 4
  %3533 = load i64, ptr %r4, align 4
  %3534 = lshr i64 %3533, 8
  store i64 %3534, ptr %r4, align 4
  %3535 = load i64, ptr %r2, align 4
  store i64 %3535, ptr %r5, align 4
  %3536 = load i64, ptr %r5, align 4
  %3537 = shl i64 %3536, 24
  store i64 %3537, ptr %r5, align 4
  %3538 = load i64, ptr %r5, align 4
  %3539 = load i64, ptr %r4, align 4
  %3540 = or i64 %3538, %3539
  store i64 %3540, ptr %r5, align 4
  %3541 = load i64, ptr %r2, align 4
  %3542 = load i64, ptr %r8, align 4
  %3543 = xor i64 %3541, %3542
  store i64 %3543, ptr %r2, align 4
  %3544 = load i64, ptr %r2, align 4
  %3545 = load i64, ptr %r5, align 4
  %3546 = sub i64 %3544, %3545
  store i64 %3546, ptr %r2, align 4
  %3547 = load i64, ptr %r2, align 4
  %3548 = add i64 %3547, -525483785
  store i64 %3548, ptr %r2, align 4
  %3549 = load ptr, ptr %r10, align 8
  %3550 = getelementptr i8, ptr %3549, i64 -168
  %3551 = load i64, ptr %3550, align 4
  store i64 %3551, ptr %r8, align 4
  %3552 = load i64, ptr %r2, align 4
  %3553 = load i64, ptr %r8, align 4
  %3554 = xor i64 %3552, %3553
  store i64 %3554, ptr %r2, align 4
  %3555 = load i64, ptr %r2, align 4
  %3556 = load i64, ptr %r9, align 4
  %3557 = sub i64 %3555, %3556
  store i64 %3557, ptr %r2, align 4
  %3558 = load i64, ptr %r2, align 4
  store i64 %3558, ptr %r4, align 4
  %3559 = load i64, ptr %r4, align 4
  %3560 = load i64, ptr %r1, align 4
  %3561 = and i64 %3559, %3560
  store i64 %3561, ptr %r4, align 4
  %3562 = load i64, ptr %r4, align 4
  %3563 = lshr i64 %3562, 7
  store i64 %3563, ptr %r4, align 4
  %3564 = load i64, ptr %r2, align 4
  store i64 %3564, ptr %r1, align 4
  %3565 = load i64, ptr %r1, align 4
  %3566 = shl i64 %3565, 25
  store i64 %3566, ptr %r1, align 4
  %3567 = load i64, ptr %r1, align 4
  %3568 = load i64, ptr %r4, align 4
  %3569 = or i64 %3567, %3568
  store i64 %3569, ptr %r1, align 4
  %3570 = load i64, ptr %r2, align 4
  store i64 %3570, ptr %r0, align 4
  %3571 = load ptr, ptr %r10, align 8
  %3572 = getelementptr i8, ptr %3571, i64 -136
  %3573 = load i64, ptr %3572, align 4
  store i64 %3573, ptr %r4, align 4
  %3574 = load i64, ptr %r0, align 4
  %3575 = load i64, ptr %r4, align 4
  %3576 = xor i64 %3574, %3575
  store i64 %3576, ptr %r0, align 4
  %3577 = load i64, ptr %r0, align 4
  %3578 = load i64, ptr %r1, align 4
  %3579 = sub i64 %3577, %3578
  store i64 %3579, ptr %r0, align 4
  %3580 = load i64, ptr %r0, align 4
  store i64 %3580, ptr %r1, align 4
  store i64 4294901760, ptr %r4, align 4
  %3581 = load i64, ptr %r1, align 4
  %3582 = load i64, ptr %r4, align 4
  %3583 = and i64 %3581, %3582
  store i64 %3583, ptr %r1, align 4
  %3584 = load i64, ptr %r1, align 4
  %3585 = lshr i64 %3584, 16
  store i64 %3585, ptr %r1, align 4
  %3586 = load i64, ptr %r0, align 4
  store i64 %3586, ptr %r5, align 4
  %3587 = load i64, ptr %r5, align 4
  %3588 = shl i64 %3587, 16
  store i64 %3588, ptr %r5, align 4
  %3589 = load i64, ptr %r5, align 4
  %3590 = load i64, ptr %r1, align 4
  %3591 = or i64 %3589, %3590
  store i64 %3591, ptr %r5, align 4
  %3592 = load i64, ptr %r0, align 4
  store i64 %3592, ptr %r4, align 4
  %3593 = load i64, ptr %r4, align 4
  %3594 = load i64, ptr %r8, align 4
  %3595 = xor i64 %3593, %3594
  store i64 %3595, ptr %r4, align 4
  %3596 = load i64, ptr %r4, align 4
  %3597 = load i64, ptr %r5, align 4
  %3598 = sub i64 %3596, %3597
  store i64 %3598, ptr %r4, align 4
  %3599 = load i64, ptr %r4, align 4
  store i64 %3599, ptr %r1, align 4
  %3600 = load i64, ptr %r1, align 4
  %3601 = load i64, ptr %r7, align 4
  %3602 = and i64 %3600, %3601
  store i64 %3602, ptr %r1, align 4
  %3603 = load i64, ptr %r1, align 4
  %3604 = lshr i64 %3603, 28
  store i64 %3604, ptr %r1, align 4
  %3605 = load i64, ptr %r4, align 4
  store i64 %3605, ptr %r5, align 4
  %3606 = load i64, ptr %r5, align 4
  %3607 = shl i64 %3606, 4
  store i64 %3607, ptr %r5, align 4
  %3608 = load i64, ptr %r5, align 4
  %3609 = load i64, ptr %r1, align 4
  %3610 = or i64 %3608, %3609
  store i64 %3610, ptr %r5, align 4
  %3611 = load i64, ptr %r4, align 4
  store i64 %3611, ptr %r1, align 4
  %3612 = load i64, ptr %r1, align 4
  %3613 = load i64, ptr %r2, align 4
  %3614 = xor i64 %3612, %3613
  store i64 %3614, ptr %r1, align 4
  %3615 = load i64, ptr %r1, align 4
  %3616 = load i64, ptr %r5, align 4
  %3617 = sub i64 %3615, %3616
  store i64 %3617, ptr %r1, align 4
  %3618 = load i64, ptr %r1, align 4
  store i64 %3618, ptr %r2, align 4
  store i64 4294705152, ptr %r5, align 4
  %3619 = load i64, ptr %r2, align 4
  %3620 = load i64, ptr %r5, align 4
  %3621 = and i64 %3619, %3620
  store i64 %3621, ptr %r2, align 4
  %3622 = load i64, ptr %r2, align 4
  %3623 = lshr i64 %3622, 18
  store i64 %3623, ptr %r2, align 4
  %3624 = load i64, ptr %r1, align 4
  store i64 %3624, ptr %r5, align 4
  %3625 = load i64, ptr %r5, align 4
  %3626 = shl i64 %3625, 14
  store i64 %3626, ptr %r5, align 4
  %3627 = load i64, ptr %r5, align 4
  %3628 = load i64, ptr %r2, align 4
  %3629 = or i64 %3627, %3628
  store i64 %3629, ptr %r5, align 4
  %3630 = load i64, ptr %r1, align 4
  %3631 = load i64, ptr %r0, align 4
  %3632 = xor i64 %3630, %3631
  store i64 %3632, ptr %r1, align 4
  %3633 = load i64, ptr %r1, align 4
  %3634 = load i64, ptr %r5, align 4
  %3635 = sub i64 %3633, %3634
  store i64 %3635, ptr %r1, align 4
  %3636 = load i64, ptr %r1, align 4
  store i64 %3636, ptr %r2, align 4
  %3637 = load i64, ptr %r2, align 4
  %3638 = load i64, ptr %r3, align 4
  %3639 = and i64 %3637, %3638
  store i64 %3639, ptr %r2, align 4
  %3640 = load i64, ptr %r2, align 4
  %3641 = lshr i64 %3640, 8
  store i64 %3641, ptr %r2, align 4
  %3642 = load i64, ptr %r1, align 4
  store i64 %3642, ptr %r3, align 4
  %3643 = load i64, ptr %r3, align 4
  %3644 = shl i64 %3643, 24
  store i64 %3644, ptr %r3, align 4
  %3645 = load i64, ptr %r3, align 4
  %3646 = load i64, ptr %r2, align 4
  %3647 = or i64 %3645, %3646
  store i64 %3647, ptr %r3, align 4
  %3648 = load i64, ptr %r1, align 4
  %3649 = load i64, ptr %r4, align 4
  %3650 = xor i64 %3648, %3649
  store i64 %3650, ptr %r1, align 4
  %3651 = load i64, ptr %r1, align 4
  %3652 = load i64, ptr %r3, align 4
  %3653 = sub i64 %3651, %3652
  store i64 %3653, ptr %r1, align 4
  %3654 = load i64, ptr %r1, align 4
  store i64 %3654, ptr %r2, align 4
  %3655 = load i64, ptr %r2, align 4
  %3656 = shl i64 %3655, 32
  store i64 %3656, ptr %r2, align 4
  %3657 = load i64, ptr %r2, align 4
  %3658 = lshr i64 %3657, 32
  store i64 %3658, ptr %r2, align 4
  %3659 = load i64, ptr %r2, align 4
  %3660 = udiv i64 %3659, 65537
  %3661 = select i1 false, i64 0, i64 %3660
  store i64 %3661, ptr %r2, align 4
  %3662 = load i64, ptr %r2, align 4
  %3663 = mul i64 %3662, 65537
  store i64 %3663, ptr %r2, align 4
  %3664 = load i64, ptr %r1, align 4
  %3665 = load i64, ptr %r2, align 4
  %3666 = sub i64 %3664, %3665
  store i64 %3666, ptr %r1, align 4
  %3667 = load ptr, ptr %r10, align 8
  %3668 = getelementptr i8, ptr %3667, i64 -144
  %3669 = load i64, ptr %3668, align 4
  store i64 %3669, ptr %r2, align 4
  %3670 = load ptr, ptr %r2, align 8
  %3671 = getelementptr i8, ptr %3670, i64 4
  %3672 = load i32, ptr %3671, align 4
  %3673 = zext i32 %3672 to i64
  store i64 %3673, ptr %r2, align 4
  %3674 = load i64, ptr %r2, align 4
  %3675 = mul i64 %3674, 65537
  store i64 %3675, ptr %r2, align 4
  %3676 = load i64, ptr %r1, align 4
  %3677 = load i64, ptr %r2, align 4
  %3678 = add i64 %3676, %3677
  store i64 %3678, ptr %r1, align 4
  %3679 = load i64, ptr %r1, align 4
  %3680 = trunc i64 %3679 to i32
  %3681 = load ptr, ptr %r10, align 8
  %3682 = getelementptr i8, ptr %3681, i64 -20
  store i32 %3680, ptr %3682, align 4
  %3683 = load i64, ptr %r10, align 4
  store i64 %3683, ptr %r2, align 4
  %3684 = load i64, ptr %r2, align 4
  %3685 = add i64 %3684, -20
  store i64 %3685, ptr %r2, align 4
  %3686 = call i64 @__lddw_helper_map_by_fd(i32 7)
  store i64 %3686, ptr %r1, align 4
  %3687 = load i64, ptr %r1, align 4
  %3688 = load i64, ptr %r2, align 4
  %3689 = load i64, ptr %r3, align 4
  %3690 = load i64, ptr %r4, align 4
  %3691 = load i64, ptr %r5, align 4
  %3692 = call i64 @_bpf_helper_ext_0001(i64 %3687, i64 %3688, i64 %3689, i64 %3690, i64 %3691)
  store i64 %3692, ptr %r0, align 4
  br label %bb_inst_1587

bb_inst_1587:                                     ; preds = %bb_inst_1340
  %3693 = load i64, ptr %r0, align 4
  %3694 = icmp eq i64 %3693, 0
  br i1 %3694, label %bb_inst_941, label %bb_inst_1588

bb_inst_1588:                                     ; preds = %bb_inst_1587
  %3695 = load ptr, ptr %r0, align 8
  %3696 = getelementptr i8, ptr %3695, i64 0
  %3697 = load i32, ptr %3696, align 4
  %3698 = zext i32 %3697 to i64
  store i64 %3698, ptr %r1, align 4
  %3699 = load i64, ptr %r1, align 4
  %3700 = trunc i64 %3699 to i32
  %3701 = load ptr, ptr %r10, align 8
  %3702 = getelementptr i8, ptr %3701, i64 -20
  store i32 %3700, ptr %3702, align 4
  %3703 = load ptr, ptr %r10, align 8
  %3704 = getelementptr i8, ptr %3703, i64 -152
  %3705 = load i64, ptr %3704, align 4
  store i64 %3705, ptr %r7, align 4
  %3706 = load ptr, ptr %r10, align 8
  %3707 = getelementptr i8, ptr %3706, i64 -184
  %3708 = load i64, ptr %3707, align 4
  store i64 %3708, ptr %r9, align 4
  %3709 = load i64, ptr %r1, align 4
  %3710 = icmp ne i64 %3709, 0
  br i1 %3710, label %bb_inst_1605, label %bb_inst_1593

bb_inst_1593:                                     ; preds = %bb_inst_1588
  store i64 521, ptr %r1, align 4
  %3711 = load i64, ptr %r1, align 4
  %3712 = trunc i64 %3711 to i32
  %3713 = load ptr, ptr %r10, align 8
  %3714 = getelementptr i8, ptr %3713, i64 -120
  store i32 %3712, ptr %3714, align 4
  %3715 = load i64, ptr %r10, align 4
  store i64 %3715, ptr %r2, align 4
  %3716 = load i64, ptr %r2, align 4
  %3717 = add i64 %3716, -120
  store i64 %3717, ptr %r2, align 4
  %3718 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %3718, ptr %r1, align 4
  %3719 = load i64, ptr %r1, align 4
  %3720 = load i64, ptr %r2, align 4
  %3721 = load i64, ptr %r3, align 4
  %3722 = load i64, ptr %r4, align 4
  %3723 = load i64, ptr %r5, align 4
  %3724 = call i64 @_bpf_helper_ext_0001(i64 %3719, i64 %3720, i64 %3721, i64 %3722, i64 %3723)
  store i64 %3724, ptr %r0, align 4
  br label %bb_inst_1600

bb_inst_1600:                                     ; preds = %bb_inst_1593
  %3725 = load i64, ptr %r0, align 4
  %3726 = icmp eq i64 %3725, 0
  br i1 %3726, label %bb_inst_1604, label %bb_inst_1601

bb_inst_1601:                                     ; preds = %bb_inst_1600
  %3727 = load ptr, ptr %r0, align 8
  %3728 = getelementptr i8, ptr %3727, i64 8
  %3729 = load i64, ptr %3728, align 4
  store i64 %3729, ptr %r1, align 4
  %3730 = load i64, ptr %r1, align 4
  %3731 = add i64 %3730, 1
  store i64 %3731, ptr %r1, align 4
  %3732 = load i64, ptr %r1, align 4
  %3733 = load ptr, ptr %r0, align 8
  %3734 = getelementptr i8, ptr %3733, i64 8
  store i64 %3732, ptr %3734, align 4
  br label %bb_inst_1604

bb_inst_1604:                                     ; preds = %bb_inst_1601, %bb_inst_1600
  %3735 = load ptr, ptr %r10, align 8
  %3736 = getelementptr i8, ptr %3735, i64 -20
  %3737 = load i32, ptr %3736, align 4
  %3738 = zext i32 %3737 to i64
  store i64 %3738, ptr %r1, align 4
  br label %bb_inst_1605

bb_inst_1605:                                     ; preds = %bb_inst_1604, %bb_inst_1588
  %3739 = load i64, ptr %r1, align 4
  %3740 = trunc i64 %3739 to i32
  %3741 = load ptr, ptr %r10, align 8
  %3742 = getelementptr i8, ptr %3741, i64 -32
  store i32 %3740, ptr %3742, align 4
  %3743 = load i64, ptr %r10, align 4
  store i64 %3743, ptr %r2, align 4
  %3744 = load i64, ptr %r2, align 4
  %3745 = add i64 %3744, -20
  store i64 %3745, ptr %r2, align 4
  %3746 = call i64 @__lddw_helper_map_by_fd(i32 9)
  store i64 %3746, ptr %r1, align 4
  %3747 = load i64, ptr %r1, align 4
  %3748 = load i64, ptr %r2, align 4
  %3749 = load i64, ptr %r3, align 4
  %3750 = load i64, ptr %r4, align 4
  %3751 = load i64, ptr %r5, align 4
  %3752 = call i64 @_bpf_helper_ext_0001(i64 %3747, i64 %3748, i64 %3749, i64 %3750, i64 %3751)
  store i64 %3752, ptr %r0, align 4
  br label %bb_inst_1611

bb_inst_1611:                                     ; preds = %bb_inst_1605
  %3753 = load i64, ptr %r0, align 4
  store i64 %3753, ptr %r8, align 4
  %3754 = load i64, ptr %r8, align 4
  %3755 = icmp ne i64 %3754, 0
  br i1 %3755, label %bb_inst_1622, label %bb_inst_1613

bb_inst_1613:                                     ; preds = %bb_inst_1611
  store i64 521, ptr %r1, align 4
  %3756 = load i64, ptr %r1, align 4
  %3757 = trunc i64 %3756 to i32
  %3758 = load ptr, ptr %r10, align 8
  %3759 = getelementptr i8, ptr %3758, i64 -120
  store i32 %3757, ptr %3759, align 4
  %3760 = load i64, ptr %r10, align 4
  store i64 %3760, ptr %r2, align 4
  %3761 = load i64, ptr %r2, align 4
  %3762 = add i64 %3761, -120
  store i64 %3762, ptr %r2, align 4
  %3763 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %3763, ptr %r1, align 4
  %3764 = load i64, ptr %r1, align 4
  %3765 = load i64, ptr %r2, align 4
  %3766 = load i64, ptr %r3, align 4
  %3767 = load i64, ptr %r4, align 4
  %3768 = load i64, ptr %r5, align 4
  %3769 = call i64 @_bpf_helper_ext_0001(i64 %3764, i64 %3765, i64 %3766, i64 %3767, i64 %3768)
  store i64 %3769, ptr %r0, align 4
  br label %bb_inst_1620

bb_inst_1620:                                     ; preds = %bb_inst_1613
  %3770 = load i64, ptr %r0, align 4
  %3771 = icmp eq i64 %3770, 0
  br i1 %3771, label %bb_inst_941, label %bb_inst_1621

bb_inst_1621:                                     ; preds = %bb_inst_1620
  br label %bb_inst_938

bb_inst_1622:                                     ; preds = %bb_inst_1611
  %3772 = load i64, ptr %r7, align 4
  %3773 = icmp eq i64 %3772, 0
  br i1 %3773, label %bb_inst_1642, label %bb_inst_1623

bb_inst_1623:                                     ; preds = %bb_inst_1622
  %3774 = load ptr, ptr %r10, align 8
  %3775 = getelementptr i8, ptr %3774, i64 -144
  %3776 = load i64, ptr %3775, align 4
  store i64 %3776, ptr %r1, align 4
  %3777 = load ptr, ptr %r1, align 8
  %3778 = getelementptr i8, ptr %3777, i64 0
  %3779 = load i32, ptr %3778, align 4
  %3780 = zext i32 %3779 to i64
  store i64 %3780, ptr %r1, align 4
  %3781 = load i64, ptr %r1, align 4
  %3782 = and i64 %3781, 2
  store i64 %3782, ptr %r1, align 4
  %3783 = load i64, ptr %r1, align 4
  %3784 = lshr i64 %3783, 1
  store i64 %3784, ptr %r1, align 4
  %3785 = load i64, ptr %r9, align 4
  %3786 = load i64, ptr %r1, align 4
  %3787 = or i64 %3785, %3786
  store i64 %3787, ptr %r9, align 4
  %3788 = load i64, ptr %r9, align 4
  %3789 = icmp ne i64 %3788, 0
  br i1 %3789, label %bb_inst_1642, label %bb_inst_1629

bb_inst_1629:                                     ; preds = %bb_inst_1623
  %3790 = load ptr, ptr %r10, align 8
  %3791 = getelementptr i8, ptr %3790, i64 -36
  %3792 = load i8, ptr %3791, align 1
  %3793 = zext i8 %3792 to i64
  store i64 %3793, ptr %r1, align 4
  %3794 = load i64, ptr %r1, align 4
  %3795 = icmp ne i64 %3794, 17
  br i1 %3795, label %bb_inst_1633, label %bb_inst_1631

bb_inst_1631:                                     ; preds = %bb_inst_1629
  %3796 = load ptr, ptr %r10, align 8
  %3797 = getelementptr i8, ptr %3796, i64 -200
  %3798 = load i64, ptr %3797, align 4
  store i64 %3798, ptr %r1, align 4
  %3799 = load i64, ptr %r1, align 4
  %3800 = load ptr, ptr %r10, align 8
  %3801 = getelementptr i8, ptr %3800, i64 -8
  store i64 %3799, ptr %3801, align 4
  br label %bb_inst_1633

bb_inst_1633:                                     ; preds = %bb_inst_1631, %bb_inst_1629
  %3802 = load ptr, ptr %r10, align 8
  %3803 = getelementptr i8, ptr %3802, i64 -20
  %3804 = load i32, ptr %3803, align 4
  %3805 = zext i32 %3804 to i64
  store i64 %3805, ptr %r1, align 4
  %3806 = load i64, ptr %r1, align 4
  %3807 = trunc i64 %3806 to i32
  %3808 = load ptr, ptr %r10, align 8
  %3809 = getelementptr i8, ptr %3808, i64 -16
  store i32 %3807, ptr %3809, align 4
  %3810 = load i64, ptr %r10, align 4
  store i64 %3810, ptr %r2, align 4
  %3811 = load i64, ptr %r2, align 4
  %3812 = add i64 %3811, -72
  store i64 %3812, ptr %r2, align 4
  %3813 = load i64, ptr %r10, align 4
  store i64 %3813, ptr %r3, align 4
  %3814 = load i64, ptr %r3, align 4
  %3815 = add i64 %3814, -16
  store i64 %3815, ptr %r3, align 4
  %3816 = load i64, ptr %r7, align 4
  store i64 %3816, ptr %r1, align 4
  store i64 0, ptr %r4, align 4
  %3817 = load i64, ptr %r1, align 4
  %3818 = load i64, ptr %r2, align 4
  %3819 = load i64, ptr %r3, align 4
  %3820 = load i64, ptr %r4, align 4
  %3821 = load i64, ptr %r5, align 4
  %3822 = call i64 @_bpf_helper_ext_0002(i64 %3817, i64 %3818, i64 %3819, i64 %3820, i64 %3821)
  store i64 %3822, ptr %r0, align 4
  br label %bb_inst_1642

bb_inst_1642:                                     ; preds = %bb_inst_1633, %bb_inst_1623, %bb_inst_1622
  store i64 0, ptr %r7, align 4
  %3823 = load i64, ptr %r7, align 4
  %3824 = trunc i64 %3823 to i32
  %3825 = load ptr, ptr %r10, align 8
  %3826 = getelementptr i8, ptr %3825, i64 -16
  store i32 %3824, ptr %3826, align 4
  %3827 = load i64, ptr %r10, align 4
  store i64 %3827, ptr %r2, align 4
  %3828 = load i64, ptr %r2, align 4
  %3829 = add i64 %3828, -16
  store i64 %3829, ptr %r2, align 4
  %3830 = call i64 @__lddw_helper_map_by_fd(i32 12)
  store i64 %3830, ptr %r1, align 4
  %3831 = load i64, ptr %r1, align 4
  %3832 = load i64, ptr %r2, align 4
  %3833 = load i64, ptr %r3, align 4
  %3834 = load i64, ptr %r4, align 4
  %3835 = load i64, ptr %r5, align 4
  %3836 = call i64 @_bpf_helper_ext_0001(i64 %3831, i64 %3832, i64 %3833, i64 %3834, i64 %3835)
  store i64 %3836, ptr %r0, align 4
  br label %bb_inst_1649

bb_inst_1649:                                     ; preds = %bb_inst_1642
  %3837 = load i64, ptr %r0, align 4
  %3838 = icmp eq i64 %3837, 0
  br i1 %3838, label %bb_inst_941, label %bb_inst_1650

bb_inst_1650:                                     ; preds = %bb_inst_1649
  %3839 = load ptr, ptr %r0, align 8
  %3840 = getelementptr i8, ptr %3839, i64 0
  %3841 = load i32, ptr %3840, align 4
  %3842 = zext i32 %3841 to i64
  store i64 %3842, ptr %r1, align 4
  %3843 = load ptr, ptr %r10, align 8
  %3844 = getelementptr i8, ptr %3843, i64 -96
  %3845 = load i32, ptr %3844, align 4
  %3846 = zext i32 %3845 to i64
  store i64 %3846, ptr %r2, align 4
  %3847 = load i64, ptr %r2, align 4
  %3848 = load i64, ptr %r1, align 4
  %3849 = icmp ne i64 %3848, %3847
  br i1 %3849, label %bb_inst_1664, label %bb_inst_1653

bb_inst_1653:                                     ; preds = %bb_inst_1650
  %3850 = load ptr, ptr %r0, align 8
  %3851 = getelementptr i8, ptr %3850, i64 4
  %3852 = load i32, ptr %3851, align 4
  %3853 = zext i32 %3852 to i64
  store i64 %3853, ptr %r1, align 4
  %3854 = load ptr, ptr %r10, align 8
  %3855 = getelementptr i8, ptr %3854, i64 -92
  %3856 = load i32, ptr %3855, align 4
  %3857 = zext i32 %3856 to i64
  store i64 %3857, ptr %r2, align 4
  %3858 = load i64, ptr %r2, align 4
  %3859 = load i64, ptr %r1, align 4
  %3860 = icmp ne i64 %3859, %3858
  br i1 %3860, label %bb_inst_1664, label %bb_inst_1656

bb_inst_1656:                                     ; preds = %bb_inst_1653
  %3861 = load ptr, ptr %r0, align 8
  %3862 = getelementptr i8, ptr %3861, i64 8
  %3863 = load i32, ptr %3862, align 4
  %3864 = zext i32 %3863 to i64
  store i64 %3864, ptr %r1, align 4
  %3865 = load ptr, ptr %r10, align 8
  %3866 = getelementptr i8, ptr %3865, i64 -88
  %3867 = load i32, ptr %3866, align 4
  %3868 = zext i32 %3867 to i64
  store i64 %3868, ptr %r2, align 4
  %3869 = load i64, ptr %r2, align 4
  %3870 = load i64, ptr %r1, align 4
  %3871 = icmp ne i64 %3870, %3869
  br i1 %3871, label %bb_inst_1664, label %bb_inst_1659

bb_inst_1659:                                     ; preds = %bb_inst_1656
  %3872 = load ptr, ptr %r0, align 8
  %3873 = getelementptr i8, ptr %3872, i64 12
  %3874 = load i32, ptr %3873, align 4
  %3875 = zext i32 %3874 to i64
  store i64 %3875, ptr %r1, align 4
  store i64 1, ptr %r7, align 4
  %3876 = load ptr, ptr %r10, align 8
  %3877 = getelementptr i8, ptr %3876, i64 -84
  %3878 = load i32, ptr %3877, align 4
  %3879 = zext i32 %3878 to i64
  store i64 %3879, ptr %r2, align 4
  %3880 = load i64, ptr %r2, align 4
  %3881 = load i64, ptr %r1, align 4
  %3882 = icmp eq i64 %3881, %3880
  br i1 %3882, label %bb_inst_1664, label %bb_inst_1663

bb_inst_1663:                                     ; preds = %bb_inst_1659
  store i64 0, ptr %r7, align 4
  br label %bb_inst_1664

bb_inst_1664:                                     ; preds = %bb_inst_1663, %bb_inst_1659, %bb_inst_1656, %bb_inst_1653, %bb_inst_1650
  %3883 = load ptr, ptr %r10, align 8
  %3884 = getelementptr i8, ptr %3883, i64 -80
  %3885 = load i16, ptr %3884, align 2
  %3886 = zext i16 %3885 to i64
  store i64 %3886, ptr %r2, align 4
  %3887 = load ptr, ptr %r10, align 8
  %3888 = getelementptr i8, ptr %3887, i64 -78
  %3889 = load i8, ptr %3888, align 1
  %3890 = zext i8 %3889 to i64
  store i64 %3890, ptr %r1, align 4
  %3891 = load i64, ptr %r1, align 4
  %3892 = trunc i64 %3891 to i8
  %3893 = load ptr, ptr %r0, align 8
  %3894 = getelementptr i8, ptr %3893, i64 18
  store i8 %3892, ptr %3894, align 1
  %3895 = load i64, ptr %r7, align 4
  %3896 = and i64 %3895, 1
  store i64 %3896, ptr %r7, align 4
  %3897 = load i64, ptr %r7, align 4
  %3898 = icmp eq i64 %3897, 0
  br i1 %3898, label %bb_inst_1683, label %bb_inst_1669

bb_inst_1669:                                     ; preds = %bb_inst_1664
  %3899 = load ptr, ptr %r0, align 8
  %3900 = getelementptr i8, ptr %3899, i64 16
  %3901 = load i16, ptr %3900, align 2
  %3902 = zext i16 %3901 to i64
  store i64 %3902, ptr %r3, align 4
  %3903 = load i64, ptr %r2, align 4
  %3904 = load i64, ptr %r3, align 4
  %3905 = icmp ne i64 %3904, %3903
  br i1 %3905, label %bb_inst_1683, label %bb_inst_1671

bb_inst_1671:                                     ; preds = %bb_inst_1669
  %3906 = load i64, ptr %r1, align 4
  %3907 = icmp eq i64 %3906, 0
  br i1 %3907, label %bb_inst_1683, label %bb_inst_1672

bb_inst_1672:                                     ; preds = %bb_inst_1671
  %3908 = load ptr, ptr %r10, align 8
  %3909 = getelementptr i8, ptr %3908, i64 -32
  %3910 = load i32, ptr %3909, align 4
  %3911 = zext i32 %3910 to i64
  store i64 %3911, ptr %r1, align 4
  %3912 = load i64, ptr %r1, align 4
  %3913 = trunc i64 %3912 to i32
  %3914 = load ptr, ptr %r10, align 8
  %3915 = getelementptr i8, ptr %3914, i64 -120
  store i32 %3913, ptr %3915, align 4
  %3916 = load i64, ptr %r10, align 4
  store i64 %3916, ptr %r2, align 4
  %3917 = load i64, ptr %r2, align 4
  %3918 = add i64 %3917, -120
  store i64 %3918, ptr %r2, align 4
  %3919 = call i64 @__lddw_helper_map_by_fd(i32 11)
  store i64 %3919, ptr %r1, align 4
  %3920 = load i64, ptr %r1, align 4
  %3921 = load i64, ptr %r2, align 4
  %3922 = load i64, ptr %r3, align 4
  %3923 = load i64, ptr %r4, align 4
  %3924 = load i64, ptr %r5, align 4
  %3925 = call i64 @_bpf_helper_ext_0001(i64 %3920, i64 %3921, i64 %3922, i64 %3923, i64 %3924)
  store i64 %3925, ptr %r0, align 4
  br label %bb_inst_1679

bb_inst_1679:                                     ; preds = %bb_inst_1672
  %3926 = load i64, ptr %r0, align 4
  %3927 = icmp eq i64 %3926, 0
  br i1 %3927, label %bb_inst_941, label %bb_inst_1680

bb_inst_1680:                                     ; preds = %bb_inst_1679
  %3928 = load ptr, ptr %r0, align 8
  %3929 = getelementptr i8, ptr %3928, i64 0
  %3930 = load i32, ptr %3929, align 4
  %3931 = zext i32 %3930 to i64
  store i64 %3931, ptr %r1, align 4
  %3932 = load i64, ptr %r1, align 4
  %3933 = add i64 %3932, 1
  store i64 %3933, ptr %r1, align 4
  %3934 = load i64, ptr %r1, align 4
  %3935 = trunc i64 %3934 to i32
  %3936 = load ptr, ptr %r0, align 8
  %3937 = getelementptr i8, ptr %3936, i64 0
  store i32 %3935, ptr %3937, align 4
  br label %bb_inst_1683

bb_inst_1683:                                     ; preds = %bb_inst_1680, %bb_inst_1671, %bb_inst_1669, %bb_inst_1664
  %3938 = load i64, ptr %r8, align 4
  %3939 = load ptr, ptr %r10, align 8
  %3940 = getelementptr i8, ptr %3939, i64 -168
  store i64 %3938, ptr %3940, align 4
  %3941 = load ptr, ptr %r10, align 8
  %3942 = getelementptr i8, ptr %3941, i64 -160
  %3943 = load i64, ptr %3942, align 4
  store i64 %3943, ptr %r2, align 4
  %3944 = load ptr, ptr %r2, align 8
  %3945 = getelementptr i8, ptr %3944, i64 8
  %3946 = load i64, ptr %3945, align 4
  store i64 %3946, ptr %r1, align 4
  %3947 = load i64, ptr %r1, align 4
  %3948 = add i64 %3947, 1
  store i64 %3948, ptr %r1, align 4
  %3949 = load i64, ptr %r1, align 4
  %3950 = load ptr, ptr %r2, align 8
  %3951 = getelementptr i8, ptr %3950, i64 8
  store i64 %3949, ptr %3951, align 4
  br label %bb_inst_1688

bb_inst_1688:                                     ; preds = %bb_inst_1683, %bb_inst_2178, %bb_inst_1256
  %3952 = load i64, ptr %r10, align 4
  store i64 %3952, ptr %r2, align 4
  %3953 = load i64, ptr %r2, align 4
  %3954 = add i64 %3953, -104
  store i64 %3954, ptr %r2, align 4
  %3955 = call i64 @__lddw_helper_map_by_fd(i32 4)
  store i64 %3955, ptr %r1, align 4
  %3956 = load i64, ptr %r1, align 4
  %3957 = load i64, ptr %r2, align 4
  %3958 = load i64, ptr %r3, align 4
  %3959 = load i64, ptr %r4, align 4
  %3960 = load i64, ptr %r5, align 4
  %3961 = call i64 @_bpf_helper_ext_0001(i64 %3956, i64 %3957, i64 %3958, i64 %3959, i64 %3960)
  store i64 %3961, ptr %r0, align 4
  br label %bb_inst_1693

bb_inst_1693:                                     ; preds = %bb_inst_1688
  %3962 = load i64, ptr %r0, align 4
  store i64 %3962, ptr %r9, align 4
  store i64 1, ptr %r8, align 4
  %3963 = load i64, ptr %r9, align 4
  %3964 = icmp eq i64 %3963, 0
  br i1 %3964, label %bb_inst_942, label %bb_inst_1696

bb_inst_1696:                                     ; preds = %bb_inst_1693
  %3965 = load i64, ptr %r10, align 4
  store i64 %3965, ptr %r2, align 4
  %3966 = load i64, ptr %r2, align 4
  %3967 = add i64 %3966, -100
  store i64 %3967, ptr %r2, align 4
  %3968 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %3968, ptr %r1, align 4
  %3969 = load i64, ptr %r1, align 4
  %3970 = load i64, ptr %r2, align 4
  %3971 = load i64, ptr %r3, align 4
  %3972 = load i64, ptr %r4, align 4
  %3973 = load i64, ptr %r5, align 4
  %3974 = call i64 @_bpf_helper_ext_0001(i64 %3969, i64 %3970, i64 %3971, i64 %3972, i64 %3973)
  store i64 %3974, ptr %r0, align 4
  br label %bb_inst_1701

bb_inst_1701:                                     ; preds = %bb_inst_1696
  %3975 = load i64, ptr %r0, align 4
  %3976 = icmp eq i64 %3975, 0
  br i1 %3976, label %bb_inst_942, label %bb_inst_1702

bb_inst_1702:                                     ; preds = %bb_inst_1701
  %3977 = load ptr, ptr %r10, align 8
  %3978 = getelementptr i8, ptr %3977, i64 -128
  %3979 = load i64, ptr %3978, align 4
  store i64 %3979, ptr %r2, align 4
  %3980 = load i64, ptr %r2, align 4
  %3981 = lshr i64 %3980, 0
  %3982 = and i64 %3981, 255
  %3983 = lshr i64 %3980, 8
  %3984 = and i64 %3983, 255
  %3985 = shl i64 %3982, 8
  %3986 = or i64 %3985, %3984
  store i64 %3986, ptr %r2, align 4
  %3987 = load ptr, ptr %r0, align 8
  %3988 = getelementptr i8, ptr %3987, i64 0
  %3989 = load i64, ptr %3988, align 4
  store i64 %3989, ptr %r1, align 4
  %3990 = load i64, ptr %r1, align 4
  %3991 = add i64 %3990, 1
  store i64 %3991, ptr %r1, align 4
  %3992 = load i64, ptr %r1, align 4
  %3993 = load ptr, ptr %r0, align 8
  %3994 = getelementptr i8, ptr %3993, i64 0
  store i64 %3992, ptr %3994, align 4
  %3995 = load ptr, ptr %r0, align 8
  %3996 = getelementptr i8, ptr %3995, i64 8
  %3997 = load i64, ptr %3996, align 4
  store i64 %3997, ptr %r1, align 4
  %3998 = load i64, ptr %r2, align 4
  store i64 %3998, ptr %r7, align 4
  %3999 = load i64, ptr %r1, align 4
  %4000 = load i64, ptr %r2, align 4
  %4001 = add i64 %3999, %4000
  store i64 %4001, ptr %r1, align 4
  %4002 = load i64, ptr %r1, align 4
  %4003 = load ptr, ptr %r0, align 8
  %4004 = getelementptr i8, ptr %4003, i64 8
  store i64 %4002, ptr %4004, align 4
  %4005 = load i64, ptr %r10, align 4
  store i64 %4005, ptr %r2, align 4
  %4006 = load i64, ptr %r2, align 4
  %4007 = add i64 %4006, -32
  store i64 %4007, ptr %r2, align 4
  %4008 = call i64 @__lddw_helper_map_by_fd(i32 10)
  store i64 %4008, ptr %r1, align 4
  %4009 = load i64, ptr %r1, align 4
  %4010 = load i64, ptr %r2, align 4
  %4011 = load i64, ptr %r3, align 4
  %4012 = load i64, ptr %r4, align 4
  %4013 = load i64, ptr %r5, align 4
  %4014 = call i64 @_bpf_helper_ext_0001(i64 %4009, i64 %4010, i64 %4011, i64 %4012, i64 %4013)
  store i64 %4014, ptr %r0, align 4
  br label %bb_inst_1716

bb_inst_1716:                                     ; preds = %bb_inst_1702
  %4015 = load i64, ptr %r0, align 4
  %4016 = icmp eq i64 %4015, 0
  br i1 %4016, label %bb_inst_942, label %bb_inst_1717

bb_inst_1717:                                     ; preds = %bb_inst_1716
  %4017 = load ptr, ptr %r0, align 8
  %4018 = getelementptr i8, ptr %4017, i64 0
  %4019 = load i64, ptr %4018, align 4
  store i64 %4019, ptr %r1, align 4
  %4020 = load i64, ptr %r1, align 4
  %4021 = add i64 %4020, 1
  store i64 %4021, ptr %r1, align 4
  %4022 = load i64, ptr %r1, align 4
  %4023 = load ptr, ptr %r0, align 8
  %4024 = getelementptr i8, ptr %4023, i64 0
  store i64 %4022, ptr %4024, align 4
  %4025 = load ptr, ptr %r0, align 8
  %4026 = getelementptr i8, ptr %4025, i64 8
  %4027 = load i64, ptr %4026, align 4
  store i64 %4027, ptr %r1, align 4
  %4028 = load i64, ptr %r1, align 4
  %4029 = load i64, ptr %r7, align 4
  %4030 = add i64 %4028, %4029
  store i64 %4030, ptr %r1, align 4
  %4031 = load i64, ptr %r1, align 4
  %4032 = load ptr, ptr %r0, align 8
  %4033 = getelementptr i8, ptr %4032, i64 8
  store i64 %4031, ptr %4033, align 4
  %4034 = load ptr, ptr %r10, align 8
  %4035 = getelementptr i8, ptr %4034, i64 -192
  %4036 = load i64, ptr %4035, align 4
  store i64 %4036, ptr %r1, align 4
  %4037 = load i64, ptr %r1, align 4
  %4038 = trunc i64 %4037 to i16
  %4039 = load ptr, ptr %r10, align 8
  %4040 = getelementptr i8, ptr %4039, i64 -40
  store i16 %4038, ptr %4040, align 2
  %4041 = load ptr, ptr %r10, align 8
  %4042 = getelementptr i8, ptr %4041, i64 -168
  %4043 = load i64, ptr %4042, align 4
  store i64 %4043, ptr %r1, align 4
  %4044 = load ptr, ptr %r1, align 8
  %4045 = getelementptr i8, ptr %4044, i64 16
  %4046 = load i8, ptr %4045, align 1
  %4047 = zext i8 %4046 to i64
  store i64 %4047, ptr %r1, align 4
  %4048 = load i64, ptr %r1, align 4
  %4049 = and i64 %4048, 1
  store i64 %4049, ptr %r1, align 4
  %4050 = load i64, ptr %r1, align 4
  %4051 = icmp eq i64 %4050, 0
  br i1 %4051, label %bb_inst_1810, label %bb_inst_1729

bb_inst_1729:                                     ; preds = %bb_inst_1717
  %4052 = load i64, ptr %r6, align 4
  store i64 %4052, ptr %r1, align 4
  store i64 4294967256, ptr %r2, align 4
  %4053 = load i64, ptr %r1, align 4
  %4054 = load i64, ptr %r2, align 4
  %4055 = load i64, ptr %r3, align 4
  %4056 = load i64, ptr %r4, align 4
  %4057 = load i64, ptr %r5, align 4
  %4058 = call i64 @_bpf_helper_ext_0044(i64 %4053, i64 %4054, i64 %4055, i64 %4056, i64 %4057)
  store i64 %4058, ptr %r0, align 4
  br label %bb_inst_1733

bb_inst_1733:                                     ; preds = %bb_inst_1729
  %4059 = load i64, ptr %r0, align 4
  %4060 = shl i64 %4059, 32
  store i64 %4060, ptr %r0, align 4
  %4061 = load i64, ptr %r0, align 4
  %4062 = lshr i64 %4061, 32
  store i64 %4062, ptr %r0, align 4
  %4063 = load i64, ptr %r0, align 4
  %4064 = icmp ne i64 %4063, 0
  br i1 %4064, label %bb_inst_942, label %bb_inst_1736

bb_inst_1736:                                     ; preds = %bb_inst_1733
  %4065 = load ptr, ptr %r6, align 8
  %4066 = getelementptr i8, ptr %4065, i64 0
  %4067 = load i64, ptr %4066, align 4
  store i64 %4067, ptr %r1, align 4
  %4068 = load ptr, ptr %r6, align 8
  %4069 = getelementptr i8, ptr %4068, i64 8
  %4070 = load i64, ptr %4069, align 4
  store i64 %4070, ptr %r2, align 4
  %4071 = load i64, ptr %r1, align 4
  store i64 %4071, ptr %r3, align 4
  %4072 = load i64, ptr %r3, align 4
  %4073 = add i64 %4072, 14
  store i64 %4073, ptr %r3, align 4
  %4074 = load i64, ptr %r2, align 4
  %4075 = load i64, ptr %r3, align 4
  %4076 = icmp ugt i64 %4075, %4074
  br i1 %4076, label %bb_inst_942, label %bb_inst_1741

bb_inst_1741:                                     ; preds = %bb_inst_1736
  %4077 = load i64, ptr %r1, align 4
  store i64 %4077, ptr %r3, align 4
  %4078 = load i64, ptr %r3, align 4
  %4079 = add i64 %4078, 54
  store i64 %4079, ptr %r3, align 4
  %4080 = load i64, ptr %r2, align 4
  %4081 = load i64, ptr %r3, align 4
  %4082 = icmp ugt i64 %4081, %4080
  br i1 %4082, label %bb_inst_942, label %bb_inst_1744

bb_inst_1744:                                     ; preds = %bb_inst_1741
  %4083 = load i64, ptr %r2, align 4
  %4084 = load i64, ptr %r3, align 4
  %4085 = icmp ugt i64 %4084, %4083
  br i1 %4085, label %bb_inst_942, label %bb_inst_1745

bb_inst_1745:                                     ; preds = %bb_inst_1744
  %4086 = load i64, ptr %r1, align 4
  store i64 %4086, ptr %r2, align 4
  %4087 = load i64, ptr %r2, align 4
  %4088 = add i64 %4087, 40
  store i64 %4088, ptr %r2, align 4
  %4089 = load ptr, ptr %r9, align 8
  %4090 = getelementptr i8, ptr %4089, i64 5
  %4091 = load i8, ptr %4090, align 1
  %4092 = zext i8 %4091 to i64
  store i64 %4092, ptr %r3, align 4
  %4093 = load i64, ptr %r3, align 4
  %4094 = trunc i64 %4093 to i8
  %4095 = load ptr, ptr %r1, align 8
  %4096 = getelementptr i8, ptr %4095, i64 5
  store i8 %4094, ptr %4096, align 1
  %4097 = load ptr, ptr %r9, align 8
  %4098 = getelementptr i8, ptr %4097, i64 4
  %4099 = load i8, ptr %4098, align 1
  %4100 = zext i8 %4099 to i64
  store i64 %4100, ptr %r3, align 4
  %4101 = load i64, ptr %r3, align 4
  %4102 = trunc i64 %4101 to i8
  %4103 = load ptr, ptr %r1, align 8
  %4104 = getelementptr i8, ptr %4103, i64 4
  store i8 %4102, ptr %4104, align 1
  %4105 = load ptr, ptr %r9, align 8
  %4106 = getelementptr i8, ptr %4105, i64 3
  %4107 = load i8, ptr %4106, align 1
  %4108 = zext i8 %4107 to i64
  store i64 %4108, ptr %r3, align 4
  %4109 = load i64, ptr %r3, align 4
  %4110 = trunc i64 %4109 to i8
  %4111 = load ptr, ptr %r1, align 8
  %4112 = getelementptr i8, ptr %4111, i64 3
  store i8 %4110, ptr %4112, align 1
  %4113 = load ptr, ptr %r9, align 8
  %4114 = getelementptr i8, ptr %4113, i64 2
  %4115 = load i8, ptr %4114, align 1
  %4116 = zext i8 %4115 to i64
  store i64 %4116, ptr %r3, align 4
  %4117 = load i64, ptr %r3, align 4
  %4118 = trunc i64 %4117 to i8
  %4119 = load ptr, ptr %r1, align 8
  %4120 = getelementptr i8, ptr %4119, i64 2
  store i8 %4118, ptr %4120, align 1
  %4121 = load ptr, ptr %r9, align 8
  %4122 = getelementptr i8, ptr %4121, i64 1
  %4123 = load i8, ptr %4122, align 1
  %4124 = zext i8 %4123 to i64
  store i64 %4124, ptr %r3, align 4
  %4125 = load i64, ptr %r3, align 4
  %4126 = trunc i64 %4125 to i8
  %4127 = load ptr, ptr %r1, align 8
  %4128 = getelementptr i8, ptr %4127, i64 1
  store i8 %4126, ptr %4128, align 1
  %4129 = load ptr, ptr %r9, align 8
  %4130 = getelementptr i8, ptr %4129, i64 0
  %4131 = load i8, ptr %4130, align 1
  %4132 = zext i8 %4131 to i64
  store i64 %4132, ptr %r3, align 4
  %4133 = load i64, ptr %r3, align 4
  %4134 = trunc i64 %4133 to i8
  %4135 = load ptr, ptr %r1, align 8
  %4136 = getelementptr i8, ptr %4135, i64 0
  store i8 %4134, ptr %4136, align 1
  %4137 = load ptr, ptr %r2, align 8
  %4138 = getelementptr i8, ptr %4137, i64 2
  %4139 = load i8, ptr %4138, align 1
  %4140 = zext i8 %4139 to i64
  store i64 %4140, ptr %r3, align 4
  %4141 = load i64, ptr %r3, align 4
  %4142 = trunc i64 %4141 to i8
  %4143 = load ptr, ptr %r1, align 8
  %4144 = getelementptr i8, ptr %4143, i64 8
  store i8 %4142, ptr %4144, align 1
  %4145 = load ptr, ptr %r2, align 8
  %4146 = getelementptr i8, ptr %4145, i64 3
  %4147 = load i8, ptr %4146, align 1
  %4148 = zext i8 %4147 to i64
  store i64 %4148, ptr %r3, align 4
  %4149 = load i64, ptr %r3, align 4
  %4150 = trunc i64 %4149 to i8
  %4151 = load ptr, ptr %r1, align 8
  %4152 = getelementptr i8, ptr %4151, i64 9
  store i8 %4150, ptr %4152, align 1
  %4153 = load ptr, ptr %r2, align 8
  %4154 = getelementptr i8, ptr %4153, i64 0
  %4155 = load i8, ptr %4154, align 1
  %4156 = zext i8 %4155 to i64
  store i64 %4156, ptr %r3, align 4
  %4157 = load i64, ptr %r3, align 4
  %4158 = trunc i64 %4157 to i8
  %4159 = load ptr, ptr %r1, align 8
  %4160 = getelementptr i8, ptr %4159, i64 6
  store i8 %4158, ptr %4160, align 1
  %4161 = load ptr, ptr %r2, align 8
  %4162 = getelementptr i8, ptr %4161, i64 1
  %4163 = load i8, ptr %4162, align 1
  %4164 = zext i8 %4163 to i64
  store i64 %4164, ptr %r3, align 4
  %4165 = load i64, ptr %r3, align 4
  %4166 = trunc i64 %4165 to i8
  %4167 = load ptr, ptr %r1, align 8
  %4168 = getelementptr i8, ptr %4167, i64 7
  store i8 %4166, ptr %4168, align 1
  %4169 = load ptr, ptr %r2, align 8
  %4170 = getelementptr i8, ptr %4169, i64 4
  %4171 = load i8, ptr %4170, align 1
  %4172 = zext i8 %4171 to i64
  store i64 %4172, ptr %r3, align 4
  %4173 = load i64, ptr %r3, align 4
  %4174 = trunc i64 %4173 to i8
  %4175 = load ptr, ptr %r1, align 8
  %4176 = getelementptr i8, ptr %4175, i64 10
  store i8 %4174, ptr %4176, align 1
  %4177 = load ptr, ptr %r2, align 8
  %4178 = getelementptr i8, ptr %4177, i64 5
  %4179 = load i8, ptr %4178, align 1
  %4180 = zext i8 %4179 to i64
  store i64 %4180, ptr %r2, align 4
  %4181 = load i64, ptr %r2, align 4
  %4182 = trunc i64 %4181 to i8
  %4183 = load ptr, ptr %r1, align 8
  %4184 = getelementptr i8, ptr %4183, i64 11
  store i8 %4182, ptr %4184, align 1
  store i64 134, ptr %r2, align 4
  %4185 = load i64, ptr %r2, align 4
  %4186 = trunc i64 %4185 to i8
  %4187 = load ptr, ptr %r1, align 8
  %4188 = getelementptr i8, ptr %4187, i64 12
  store i8 %4186, ptr %4188, align 1
  store i64 221, ptr %r2, align 4
  %4189 = load i64, ptr %r2, align 4
  %4190 = trunc i64 %4189 to i8
  %4191 = load ptr, ptr %r1, align 8
  %4192 = getelementptr i8, ptr %4191, i64 13
  store i8 %4190, ptr %4192, align 1
  %4193 = load ptr, ptr %r10, align 8
  %4194 = getelementptr i8, ptr %4193, i64 -40
  %4195 = load i16, ptr %4194, align 2
  %4196 = zext i16 %4195 to i64
  store i64 %4196, ptr %r2, align 4
  %4197 = load ptr, ptr %r10, align 8
  %4198 = getelementptr i8, ptr %4197, i64 -60
  %4199 = load i32, ptr %4198, align 4
  %4200 = zext i32 %4199 to i64
  store i64 %4200, ptr %r3, align 4
  %4201 = load i64, ptr %r3, align 4
  %4202 = load i64, ptr %r2, align 4
  %4203 = xor i64 %4201, %4202
  store i64 %4203, ptr %r3, align 4
  %4204 = load ptr, ptr %r10, align 8
  %4205 = getelementptr i8, ptr %4204, i64 -27
  %4206 = load i8, ptr %4205, align 1
  %4207 = zext i8 %4206 to i64
  store i64 %4207, ptr %r2, align 4
  store i64 1, ptr %r4, align 4
  %4208 = load i64, ptr %r4, align 4
  %4209 = trunc i64 %4208 to i32
  %4210 = load ptr, ptr %r1, align 8
  %4211 = getelementptr i8, ptr %4210, i64 22
  store i32 %4209, ptr %4211, align 4
  %4212 = load i64, ptr %r7, align 4
  %4213 = add i64 %4212, 40
  store i64 %4213, ptr %r7, align 4
  %4214 = load i64, ptr %r7, align 4
  %4215 = lshr i64 %4214, 0
  %4216 = and i64 %4215, 255
  %4217 = lshr i64 %4214, 8
  %4218 = and i64 %4217, 255
  %4219 = shl i64 %4216, 8
  %4220 = or i64 %4219, %4218
  store i64 %4220, ptr %r7, align 4
  %4221 = load i64, ptr %r7, align 4
  %4222 = trunc i64 %4221 to i16
  %4223 = load ptr, ptr %r1, align 8
  %4224 = getelementptr i8, ptr %4223, i64 18
  store i16 %4222, ptr %4224, align 2
  store i64 0, ptr %r4, align 4
  %4225 = load i64, ptr %r4, align 4
  %4226 = trunc i64 %4225 to i32
  %4227 = load ptr, ptr %r1, align 8
  %4228 = getelementptr i8, ptr %4227, i64 26
  store i32 %4226, ptr %4228, align 4
  %4229 = load i64, ptr %r4, align 4
  %4230 = trunc i64 %4229 to i32
  %4231 = load ptr, ptr %r1, align 8
  %4232 = getelementptr i8, ptr %4231, i64 30
  store i32 %4230, ptr %4232, align 4
  %4233 = load i64, ptr %r4, align 4
  %4234 = trunc i64 %4233 to i8
  %4235 = load ptr, ptr %r1, align 8
  %4236 = getelementptr i8, ptr %4235, i64 16
  store i8 %4234, ptr %4236, align 1
  %4237 = load i64, ptr %r4, align 4
  %4238 = trunc i64 %4237 to i8
  %4239 = load ptr, ptr %r1, align 8
  %4240 = getelementptr i8, ptr %4239, i64 17
  store i8 %4238, ptr %4240, align 1
  store i64 16425, ptr %r4, align 4
  %4241 = load i64, ptr %r4, align 4
  %4242 = trunc i64 %4241 to i16
  %4243 = load ptr, ptr %r1, align 8
  %4244 = getelementptr i8, ptr %4243, i64 20
  store i16 %4242, ptr %4244, align 2
  %4245 = load i64, ptr %r3, align 4
  %4246 = trunc i64 %4245 to i32
  %4247 = load ptr, ptr %r1, align 8
  %4248 = getelementptr i8, ptr %4247, i64 34
  store i32 %4246, ptr %4248, align 4
  %4249 = load i64, ptr %r2, align 4
  store i64 %4249, ptr %r3, align 4
  %4250 = load i64, ptr %r3, align 4
  %4251 = shl i64 %4250, 4
  store i64 %4251, ptr %r3, align 4
  %4252 = load i64, ptr %r3, align 4
  %4253 = trunc i64 %4252 to i8
  %4254 = load ptr, ptr %r1, align 8
  %4255 = getelementptr i8, ptr %4254, i64 15
  store i8 %4253, ptr %4255, align 1
  %4256 = load i64, ptr %r2, align 4
  %4257 = lshr i64 %4256, 4
  store i64 %4257, ptr %r2, align 4
  %4258 = load i64, ptr %r2, align 4
  %4259 = or i64 %4258, 96
  store i64 %4259, ptr %r2, align 4
  %4260 = load i64, ptr %r2, align 4
  %4261 = trunc i64 %4260 to i8
  %4262 = load ptr, ptr %r1, align 8
  %4263 = getelementptr i8, ptr %4262, i64 14
  store i8 %4261, ptr %4263, align 1
  %4264 = load ptr, ptr %r10, align 8
  %4265 = getelementptr i8, ptr %4264, i64 -168
  %4266 = load i64, ptr %4265, align 4
  store i64 %4266, ptr %r3, align 4
  br label %bb_inst_1799

bb_inst_1799:                                     ; preds = %bb_inst_1745, %bb_inst_1053
  %4267 = load ptr, ptr %r3, align 8
  %4268 = getelementptr i8, ptr %4267, i64 12
  %4269 = load i32, ptr %4268, align 4
  %4270 = zext i32 %4269 to i64
  store i64 %4270, ptr %r2, align 4
  %4271 = load i64, ptr %r2, align 4
  %4272 = trunc i64 %4271 to i32
  %4273 = load ptr, ptr %r1, align 8
  %4274 = getelementptr i8, ptr %4273, i64 50
  store i32 %4272, ptr %4274, align 4
  %4275 = load ptr, ptr %r3, align 8
  %4276 = getelementptr i8, ptr %4275, i64 8
  %4277 = load i32, ptr %4276, align 4
  %4278 = zext i32 %4277 to i64
  store i64 %4278, ptr %r2, align 4
  %4279 = load i64, ptr %r2, align 4
  %4280 = trunc i64 %4279 to i32
  %4281 = load ptr, ptr %r1, align 8
  %4282 = getelementptr i8, ptr %4281, i64 46
  store i32 %4280, ptr %4282, align 4
  %4283 = load ptr, ptr %r3, align 8
  %4284 = getelementptr i8, ptr %4283, i64 4
  %4285 = load i32, ptr %4284, align 4
  %4286 = zext i32 %4285 to i64
  store i64 %4286, ptr %r2, align 4
  %4287 = load i64, ptr %r2, align 4
  %4288 = trunc i64 %4287 to i32
  %4289 = load ptr, ptr %r1, align 8
  %4290 = getelementptr i8, ptr %4289, i64 42
  store i32 %4288, ptr %4290, align 4
  %4291 = load ptr, ptr %r3, align 8
  %4292 = getelementptr i8, ptr %4291, i64 0
  %4293 = load i32, ptr %4292, align 4
  %4294 = zext i32 %4293 to i64
  store i64 %4294, ptr %r2, align 4
  %4295 = load i64, ptr %r2, align 4
  %4296 = trunc i64 %4295 to i32
  %4297 = load ptr, ptr %r1, align 8
  %4298 = getelementptr i8, ptr %4297, i64 38
  store i32 %4296, ptr %4298, align 4
  br label %bb_inst_216

bb_inst_1808:                                     ; preds = %bb_inst_1241, %bb_inst_1236
  %4299 = load i64, ptr %r7, align 4
  store i64 %4299, ptr %r3, align 4
  br label %bb_inst_1259

bb_inst_1810:                                     ; preds = %bb_inst_1717
  %4300 = load ptr, ptr %r10, align 8
  %4301 = getelementptr i8, ptr %4300, i64 -72
  %4302 = load i32, ptr %4301, align 4
  %4303 = zext i32 %4302 to i64
  store i64 %4303, ptr %r1, align 4
  %4304 = load i64, ptr %r1, align 4
  %4305 = load ptr, ptr %r10, align 8
  %4306 = getelementptr i8, ptr %4305, i64 -128
  store i64 %4304, ptr %4306, align 4
  %4307 = load i64, ptr %r6, align 4
  store i64 %4307, ptr %r1, align 4
  store i64 4294967276, ptr %r2, align 4
  %4308 = load i64, ptr %r1, align 4
  %4309 = load i64, ptr %r2, align 4
  %4310 = load i64, ptr %r3, align 4
  %4311 = load i64, ptr %r4, align 4
  %4312 = load i64, ptr %r5, align 4
  %4313 = call i64 @_bpf_helper_ext_0044(i64 %4308, i64 %4309, i64 %4310, i64 %4311, i64 %4312)
  store i64 %4313, ptr %r0, align 4
  br label %bb_inst_1816

bb_inst_1816:                                     ; preds = %bb_inst_1810
  %4314 = load i64, ptr %r0, align 4
  %4315 = shl i64 %4314, 32
  store i64 %4315, ptr %r0, align 4
  %4316 = load i64, ptr %r0, align 4
  %4317 = lshr i64 %4316, 32
  store i64 %4317, ptr %r0, align 4
  %4318 = load i64, ptr %r0, align 4
  %4319 = icmp ne i64 %4318, 0
  br i1 %4319, label %bb_inst_942, label %bb_inst_1819

bb_inst_1819:                                     ; preds = %bb_inst_1816
  %4320 = load ptr, ptr %r6, align 8
  %4321 = getelementptr i8, ptr %4320, i64 0
  %4322 = load i64, ptr %4321, align 4
  store i64 %4322, ptr %r1, align 4
  %4323 = load ptr, ptr %r6, align 8
  %4324 = getelementptr i8, ptr %4323, i64 8
  %4325 = load i64, ptr %4324, align 4
  store i64 %4325, ptr %r2, align 4
  %4326 = load i64, ptr %r1, align 4
  store i64 %4326, ptr %r3, align 4
  %4327 = load i64, ptr %r3, align 4
  %4328 = add i64 %4327, 14
  store i64 %4328, ptr %r3, align 4
  %4329 = load i64, ptr %r2, align 4
  %4330 = load i64, ptr %r3, align 4
  %4331 = icmp ugt i64 %4330, %4329
  br i1 %4331, label %bb_inst_942, label %bb_inst_1824

bb_inst_1824:                                     ; preds = %bb_inst_1819
  %4332 = load i64, ptr %r1, align 4
  store i64 %4332, ptr %r3, align 4
  %4333 = load i64, ptr %r3, align 4
  %4334 = add i64 %4333, 34
  store i64 %4334, ptr %r3, align 4
  %4335 = load i64, ptr %r2, align 4
  %4336 = load i64, ptr %r3, align 4
  %4337 = icmp ugt i64 %4336, %4335
  br i1 %4337, label %bb_inst_942, label %bb_inst_1827

bb_inst_1827:                                     ; preds = %bb_inst_1824
  %4338 = load i64, ptr %r2, align 4
  %4339 = load i64, ptr %r3, align 4
  %4340 = icmp ugt i64 %4339, %4338
  br i1 %4340, label %bb_inst_942, label %bb_inst_1828

bb_inst_1828:                                     ; preds = %bb_inst_1827
  %4341 = load ptr, ptr %r10, align 8
  %4342 = getelementptr i8, ptr %4341, i64 -192
  %4343 = load i64, ptr %4342, align 4
  store i64 %4343, ptr %r6, align 4
  %4344 = load i64, ptr %r6, align 4
  %4345 = lshr i64 %4344, 0
  %4346 = and i64 %4345, 255
  %4347 = lshr i64 %4344, 8
  %4348 = and i64 %4347, 255
  %4349 = lshr i64 %4344, 16
  %4350 = and i64 %4349, 255
  %4351 = lshr i64 %4344, 24
  %4352 = and i64 %4351, 255
  %4353 = shl i64 %4346, 8
  %4354 = or i64 %4353, %4348
  %4355 = shl i64 %4354, 8
  %4356 = or i64 %4355, %4350
  %4357 = shl i64 %4356, 8
  %4358 = or i64 %4357, %4352
  store i64 %4358, ptr %r6, align 4
  store i64 4294901760, ptr %r2, align 4
  %4359 = load i64, ptr %r6, align 4
  %4360 = load i64, ptr %r2, align 4
  %4361 = and i64 %4359, %4360
  store i64 %4361, ptr %r6, align 4
  %4362 = load ptr, ptr %r10, align 8
  %4363 = getelementptr i8, ptr %4362, i64 -128
  %4364 = load i64, ptr %4363, align 4
  store i64 %4364, ptr %r2, align 4
  %4365 = load i64, ptr %r2, align 4
  %4366 = and i64 %4365, -65536
  store i64 %4366, ptr %r2, align 4
  %4367 = load i64, ptr %r6, align 4
  %4368 = load i64, ptr %r2, align 4
  %4369 = xor i64 %4367, %4368
  store i64 %4369, ptr %r6, align 4
  %4370 = load i64, ptr %r6, align 4
  store i64 %4370, ptr %r2, align 4
  %4371 = load i64, ptr %r2, align 4
  %4372 = or i64 %4371, 4268
  store i64 %4372, ptr %r2, align 4
  %4373 = load i64, ptr %r1, align 4
  store i64 %4373, ptr %r3, align 4
  %4374 = load i64, ptr %r3, align 4
  %4375 = add i64 %4374, 20
  store i64 %4375, ptr %r3, align 4
  %4376 = load ptr, ptr %r9, align 8
  %4377 = getelementptr i8, ptr %4376, i64 5
  %4378 = load i8, ptr %4377, align 1
  %4379 = zext i8 %4378 to i64
  store i64 %4379, ptr %r4, align 4
  %4380 = load i64, ptr %r4, align 4
  %4381 = trunc i64 %4380 to i8
  %4382 = load ptr, ptr %r1, align 8
  %4383 = getelementptr i8, ptr %4382, i64 5
  store i8 %4381, ptr %4383, align 1
  %4384 = load ptr, ptr %r9, align 8
  %4385 = getelementptr i8, ptr %4384, i64 4
  %4386 = load i8, ptr %4385, align 1
  %4387 = zext i8 %4386 to i64
  store i64 %4387, ptr %r4, align 4
  %4388 = load i64, ptr %r4, align 4
  %4389 = trunc i64 %4388 to i8
  %4390 = load ptr, ptr %r1, align 8
  %4391 = getelementptr i8, ptr %4390, i64 4
  store i8 %4389, ptr %4391, align 1
  %4392 = load ptr, ptr %r9, align 8
  %4393 = getelementptr i8, ptr %4392, i64 3
  %4394 = load i8, ptr %4393, align 1
  %4395 = zext i8 %4394 to i64
  store i64 %4395, ptr %r4, align 4
  %4396 = load i64, ptr %r4, align 4
  %4397 = trunc i64 %4396 to i8
  %4398 = load ptr, ptr %r1, align 8
  %4399 = getelementptr i8, ptr %4398, i64 3
  store i8 %4397, ptr %4399, align 1
  %4400 = load ptr, ptr %r9, align 8
  %4401 = getelementptr i8, ptr %4400, i64 2
  %4402 = load i8, ptr %4401, align 1
  %4403 = zext i8 %4402 to i64
  store i64 %4403, ptr %r4, align 4
  %4404 = load i64, ptr %r4, align 4
  %4405 = trunc i64 %4404 to i8
  %4406 = load ptr, ptr %r1, align 8
  %4407 = getelementptr i8, ptr %4406, i64 2
  store i8 %4405, ptr %4407, align 1
  %4408 = load ptr, ptr %r9, align 8
  %4409 = getelementptr i8, ptr %4408, i64 1
  %4410 = load i8, ptr %4409, align 1
  %4411 = zext i8 %4410 to i64
  store i64 %4411, ptr %r4, align 4
  %4412 = load i64, ptr %r4, align 4
  %4413 = trunc i64 %4412 to i8
  %4414 = load ptr, ptr %r1, align 8
  %4415 = getelementptr i8, ptr %4414, i64 1
  store i8 %4413, ptr %4415, align 1
  %4416 = load ptr, ptr %r9, align 8
  %4417 = getelementptr i8, ptr %4416, i64 0
  %4418 = load i8, ptr %4417, align 1
  %4419 = zext i8 %4418 to i64
  store i64 %4419, ptr %r4, align 4
  %4420 = load i64, ptr %r4, align 4
  %4421 = trunc i64 %4420 to i8
  %4422 = load ptr, ptr %r1, align 8
  %4423 = getelementptr i8, ptr %4422, i64 0
  store i8 %4421, ptr %4423, align 1
  %4424 = load ptr, ptr %r3, align 8
  %4425 = getelementptr i8, ptr %4424, i64 2
  %4426 = load i8, ptr %4425, align 1
  %4427 = zext i8 %4426 to i64
  store i64 %4427, ptr %r4, align 4
  %4428 = load i64, ptr %r4, align 4
  %4429 = trunc i64 %4428 to i8
  %4430 = load ptr, ptr %r1, align 8
  %4431 = getelementptr i8, ptr %4430, i64 8
  store i8 %4429, ptr %4431, align 1
  %4432 = load ptr, ptr %r3, align 8
  %4433 = getelementptr i8, ptr %4432, i64 3
  %4434 = load i8, ptr %4433, align 1
  %4435 = zext i8 %4434 to i64
  store i64 %4435, ptr %r4, align 4
  %4436 = load i64, ptr %r4, align 4
  %4437 = trunc i64 %4436 to i8
  %4438 = load ptr, ptr %r1, align 8
  %4439 = getelementptr i8, ptr %4438, i64 9
  store i8 %4437, ptr %4439, align 1
  %4440 = load ptr, ptr %r3, align 8
  %4441 = getelementptr i8, ptr %4440, i64 0
  %4442 = load i8, ptr %4441, align 1
  %4443 = zext i8 %4442 to i64
  store i64 %4443, ptr %r4, align 4
  %4444 = load i64, ptr %r4, align 4
  %4445 = trunc i64 %4444 to i8
  %4446 = load ptr, ptr %r1, align 8
  %4447 = getelementptr i8, ptr %4446, i64 6
  store i8 %4445, ptr %4447, align 1
  %4448 = load ptr, ptr %r3, align 8
  %4449 = getelementptr i8, ptr %4448, i64 1
  %4450 = load i8, ptr %4449, align 1
  %4451 = zext i8 %4450 to i64
  store i64 %4451, ptr %r4, align 4
  %4452 = load i64, ptr %r4, align 4
  %4453 = trunc i64 %4452 to i8
  %4454 = load ptr, ptr %r1, align 8
  %4455 = getelementptr i8, ptr %4454, i64 7
  store i8 %4453, ptr %4455, align 1
  %4456 = load ptr, ptr %r3, align 8
  %4457 = getelementptr i8, ptr %4456, i64 4
  %4458 = load i8, ptr %4457, align 1
  %4459 = zext i8 %4458 to i64
  store i64 %4459, ptr %r4, align 4
  %4460 = load i64, ptr %r4, align 4
  %4461 = trunc i64 %4460 to i8
  %4462 = load ptr, ptr %r1, align 8
  %4463 = getelementptr i8, ptr %4462, i64 10
  store i8 %4461, ptr %4463, align 1
  %4464 = load ptr, ptr %r3, align 8
  %4465 = getelementptr i8, ptr %4464, i64 5
  %4466 = load i8, ptr %4465, align 1
  %4467 = zext i8 %4466 to i64
  store i64 %4467, ptr %r3, align 4
  %4468 = load i64, ptr %r3, align 4
  %4469 = trunc i64 %4468 to i8
  %4470 = load ptr, ptr %r1, align 8
  %4471 = getelementptr i8, ptr %4470, i64 11
  store i8 %4469, ptr %4471, align 1
  store i64 8, ptr %r3, align 4
  %4472 = load i64, ptr %r3, align 4
  %4473 = trunc i64 %4472 to i8
  %4474 = load ptr, ptr %r1, align 8
  %4475 = getelementptr i8, ptr %4474, i64 12
  store i8 %4473, ptr %4475, align 1
  store i64 0, ptr %r3, align 4
  %4476 = load i64, ptr %r3, align 4
  %4477 = trunc i64 %4476 to i8
  %4478 = load ptr, ptr %r1, align 8
  %4479 = getelementptr i8, ptr %4478, i64 13
  store i8 %4477, ptr %4479, align 1
  %4480 = load ptr, ptr %r10, align 8
  %4481 = getelementptr i8, ptr %4480, i64 -168
  %4482 = load i64, ptr %4481, align 4
  store i64 %4482, ptr %r4, align 4
  %4483 = load ptr, ptr %r4, align 8
  %4484 = getelementptr i8, ptr %4483, i64 0
  %4485 = load i32, ptr %4484, align 4
  %4486 = zext i32 %4485 to i64
  store i64 %4486, ptr %r4, align 4
  %4487 = load ptr, ptr %r10, align 8
  %4488 = getelementptr i8, ptr %4487, i64 -27
  %4489 = load i8, ptr %4488, align 1
  %4490 = zext i8 %4489 to i64
  store i64 %4490, ptr %r5, align 4
  store i64 69, ptr %r0, align 4
  %4491 = load i64, ptr %r0, align 4
  %4492 = trunc i64 %4491 to i8
  %4493 = load ptr, ptr %r1, align 8
  %4494 = getelementptr i8, ptr %4493, i64 14
  store i8 %4492, ptr %4494, align 1
  %4495 = load i64, ptr %r5, align 4
  %4496 = trunc i64 %4495 to i8
  %4497 = load ptr, ptr %r1, align 8
  %4498 = getelementptr i8, ptr %4497, i64 15
  store i8 %4496, ptr %4498, align 1
  %4499 = load i64, ptr %r6, align 4
  %4500 = shl i64 %4499, 32
  store i64 %4500, ptr %r6, align 4
  %4501 = load i64, ptr %r6, align 4
  %4502 = lshr i64 %4501, 32
  store i64 %4502, ptr %r6, align 4
  %4503 = load i64, ptr %r6, align 4
  %4504 = lshr i64 %4503, 16
  store i64 %4504, ptr %r6, align 4
  %4505 = load i64, ptr %r4, align 4
  store i64 %4505, ptr %r5, align 4
  %4506 = load i64, ptr %r5, align 4
  %4507 = and i64 %4506, 65535
  store i64 %4507, ptr %r5, align 4
  %4508 = load i64, ptr %r6, align 4
  %4509 = load i64, ptr %r5, align 4
  %4510 = add i64 %4508, %4509
  store i64 %4510, ptr %r6, align 4
  %4511 = load i64, ptr %r3, align 4
  %4512 = trunc i64 %4511 to i32
  %4513 = load ptr, ptr %r1, align 8
  %4514 = getelementptr i8, ptr %4513, i64 18
  store i32 %4512, ptr %4514, align 4
  store i64 1088, ptr %r3, align 4
  %4515 = load i64, ptr %r3, align 4
  %4516 = trunc i64 %4515 to i16
  %4517 = load ptr, ptr %r1, align 8
  %4518 = getelementptr i8, ptr %4517, i64 22
  store i16 %4516, ptr %4518, align 2
  %4519 = load i64, ptr %r2, align 4
  %4520 = trunc i64 %4519 to i32
  %4521 = load ptr, ptr %r1, align 8
  %4522 = getelementptr i8, ptr %4521, i64 26
  store i32 %4520, ptr %4522, align 4
  %4523 = load i64, ptr %r4, align 4
  %4524 = trunc i64 %4523 to i32
  %4525 = load ptr, ptr %r1, align 8
  %4526 = getelementptr i8, ptr %4525, i64 30
  store i32 %4524, ptr %4526, align 4
  %4527 = load i64, ptr %r4, align 4
  %4528 = lshr i64 %4527, 16
  store i64 %4528, ptr %r4, align 4
  %4529 = load i64, ptr %r6, align 4
  %4530 = load i64, ptr %r4, align 4
  %4531 = add i64 %4529, %4530
  store i64 %4531, ptr %r6, align 4
  %4532 = load i64, ptr %r7, align 4
  %4533 = add i64 %4532, 20
  store i64 %4533, ptr %r7, align 4
  %4534 = load i64, ptr %r7, align 4
  %4535 = lshr i64 %4534, 0
  %4536 = and i64 %4535, 255
  %4537 = lshr i64 %4534, 8
  %4538 = and i64 %4537, 255
  %4539 = shl i64 %4536, 8
  %4540 = or i64 %4539, %4538
  store i64 %4540, ptr %r7, align 4
  %4541 = load i64, ptr %r7, align 4
  %4542 = trunc i64 %4541 to i16
  %4543 = load ptr, ptr %r1, align 8
  %4544 = getelementptr i8, ptr %4543, i64 16
  store i16 %4542, ptr %4544, align 2
  %4545 = load i64, ptr %r6, align 4
  %4546 = load i64, ptr %r7, align 4
  %4547 = add i64 %4545, %4546
  store i64 %4547, ptr %r6, align 4
  %4548 = load ptr, ptr %r1, align 8
  %4549 = getelementptr i8, ptr %4548, i64 14
  %4550 = load i16, ptr %4549, align 2
  %4551 = zext i16 %4550 to i64
  store i64 %4551, ptr %r2, align 4
  %4552 = load i64, ptr %r6, align 4
  %4553 = load i64, ptr %r2, align 4
  %4554 = add i64 %4552, %4553
  store i64 %4554, ptr %r6, align 4
  %4555 = load ptr, ptr %r1, align 8
  %4556 = getelementptr i8, ptr %4555, i64 22
  %4557 = load i16, ptr %4556, align 2
  %4558 = zext i16 %4557 to i64
  store i64 %4558, ptr %r2, align 4
  %4559 = load i64, ptr %r6, align 4
  %4560 = load i64, ptr %r2, align 4
  %4561 = add i64 %4559, %4560
  store i64 %4561, ptr %r6, align 4
  %4562 = load i64, ptr %r6, align 4
  %4563 = add i64 %4562, 4268
  store i64 %4563, ptr %r6, align 4
  %4564 = load i64, ptr %r6, align 4
  store i64 %4564, ptr %r3, align 4
  %4565 = load i64, ptr %r6, align 4
  store i64 %4565, ptr %r2, align 4
  %4566 = load i64, ptr %r2, align 4
  %4567 = lshr i64 %4566, 16
  store i64 %4567, ptr %r2, align 4
  %4568 = load i64, ptr %r2, align 4
  %4569 = icmp eq i64 %4568, 0
  br i1 %4569, label %bb_inst_1902, label %bb_inst_1900

bb_inst_1900:                                     ; preds = %bb_inst_1828
  %4570 = load i64, ptr %r3, align 4
  %4571 = and i64 %4570, 65535
  store i64 %4571, ptr %r3, align 4
  %4572 = load i64, ptr %r3, align 4
  %4573 = load i64, ptr %r2, align 4
  %4574 = add i64 %4572, %4573
  store i64 %4574, ptr %r3, align 4
  br label %bb_inst_1902

bb_inst_1902:                                     ; preds = %bb_inst_1900, %bb_inst_1828
  %4575 = load i64, ptr %r3, align 4
  store i64 %4575, ptr %r2, align 4
  %4576 = load i64, ptr %r2, align 4
  %4577 = lshr i64 %4576, 16
  store i64 %4577, ptr %r2, align 4
  %4578 = load i64, ptr %r2, align 4
  %4579 = icmp eq i64 %4578, 0
  br i1 %4579, label %bb_inst_1907, label %bb_inst_1905

bb_inst_1905:                                     ; preds = %bb_inst_1902
  %4580 = load i64, ptr %r3, align 4
  %4581 = and i64 %4580, 65535
  store i64 %4581, ptr %r3, align 4
  %4582 = load i64, ptr %r3, align 4
  %4583 = load i64, ptr %r2, align 4
  %4584 = add i64 %4582, %4583
  store i64 %4584, ptr %r3, align 4
  br label %bb_inst_1907

bb_inst_1907:                                     ; preds = %bb_inst_1905, %bb_inst_1902
  %4585 = load i64, ptr %r3, align 4
  store i64 %4585, ptr %r2, align 4
  %4586 = load i64, ptr %r2, align 4
  %4587 = lshr i64 %4586, 16
  store i64 %4587, ptr %r2, align 4
  %4588 = load i64, ptr %r2, align 4
  %4589 = icmp eq i64 %4588, 0
  br i1 %4589, label %bb_inst_1912, label %bb_inst_1910

bb_inst_1910:                                     ; preds = %bb_inst_2018, %bb_inst_1907
  %4590 = load i64, ptr %r3, align 4
  %4591 = and i64 %4590, 65535
  store i64 %4591, ptr %r3, align 4
  %4592 = load i64, ptr %r3, align 4
  %4593 = load i64, ptr %r2, align 4
  %4594 = add i64 %4592, %4593
  store i64 %4594, ptr %r3, align 4
  br label %bb_inst_1912

bb_inst_1912:                                     ; preds = %bb_inst_1910, %bb_inst_2015, %bb_inst_1907
  %4595 = load i64, ptr %r3, align 4
  store i64 %4595, ptr %r2, align 4
  %4596 = load i64, ptr %r2, align 4
  %4597 = lshr i64 %4596, 16
  store i64 %4597, ptr %r2, align 4
  %4598 = load i64, ptr %r2, align 4
  %4599 = load i64, ptr %r3, align 4
  %4600 = add i64 %4598, %4599
  store i64 %4600, ptr %r2, align 4
  %4601 = load i64, ptr %r2, align 4
  %4602 = xor i64 %4601, -1
  store i64 %4602, ptr %r2, align 4
  %4603 = load i64, ptr %r2, align 4
  %4604 = trunc i64 %4603 to i16
  %4605 = load ptr, ptr %r1, align 8
  %4606 = getelementptr i8, ptr %4605, i64 24
  store i16 %4604, ptr %4606, align 2
  br label %bb_inst_216

bb_inst_1918:                                     ; preds = %bb_inst_1025
  %4607 = load ptr, ptr %r10, align 8
  %4608 = getelementptr i8, ptr %4607, i64 -72
  %4609 = load i32, ptr %4608, align 4
  %4610 = zext i32 %4609 to i64
  store i64 %4610, ptr %r1, align 4
  %4611 = load i64, ptr %r1, align 4
  %4612 = load ptr, ptr %r10, align 8
  %4613 = getelementptr i8, ptr %4612, i64 -128
  store i64 %4611, ptr %4613, align 4
  %4614 = load i64, ptr %r6, align 4
  store i64 %4614, ptr %r1, align 4
  store i64 4294967276, ptr %r2, align 4
  %4615 = load i64, ptr %r1, align 4
  %4616 = load i64, ptr %r2, align 4
  %4617 = load i64, ptr %r3, align 4
  %4618 = load i64, ptr %r4, align 4
  %4619 = load i64, ptr %r5, align 4
  %4620 = call i64 @_bpf_helper_ext_0044(i64 %4615, i64 %4616, i64 %4617, i64 %4618, i64 %4619)
  store i64 %4620, ptr %r0, align 4
  br label %bb_inst_1924

bb_inst_1924:                                     ; preds = %bb_inst_1918
  %4621 = load i64, ptr %r0, align 4
  %4622 = shl i64 %4621, 32
  store i64 %4622, ptr %r0, align 4
  %4623 = load i64, ptr %r0, align 4
  %4624 = lshr i64 %4623, 32
  store i64 %4624, ptr %r0, align 4
  %4625 = load i64, ptr %r0, align 4
  %4626 = icmp ne i64 %4625, 0
  br i1 %4626, label %bb_inst_942, label %bb_inst_1927

bb_inst_1927:                                     ; preds = %bb_inst_1924
  %4627 = load ptr, ptr %r6, align 8
  %4628 = getelementptr i8, ptr %4627, i64 0
  %4629 = load i64, ptr %4628, align 4
  store i64 %4629, ptr %r1, align 4
  %4630 = load ptr, ptr %r6, align 8
  %4631 = getelementptr i8, ptr %4630, i64 8
  %4632 = load i64, ptr %4631, align 4
  store i64 %4632, ptr %r2, align 4
  %4633 = load i64, ptr %r1, align 4
  store i64 %4633, ptr %r3, align 4
  %4634 = load i64, ptr %r3, align 4
  %4635 = add i64 %4634, 14
  store i64 %4635, ptr %r3, align 4
  %4636 = load i64, ptr %r2, align 4
  %4637 = load i64, ptr %r3, align 4
  %4638 = icmp ugt i64 %4637, %4636
  br i1 %4638, label %bb_inst_942, label %bb_inst_1932

bb_inst_1932:                                     ; preds = %bb_inst_1927
  %4639 = load i64, ptr %r1, align 4
  store i64 %4639, ptr %r3, align 4
  %4640 = load i64, ptr %r3, align 4
  %4641 = add i64 %4640, 34
  store i64 %4641, ptr %r3, align 4
  %4642 = load i64, ptr %r2, align 4
  %4643 = load i64, ptr %r3, align 4
  %4644 = icmp ugt i64 %4643, %4642
  br i1 %4644, label %bb_inst_942, label %bb_inst_1935

bb_inst_1935:                                     ; preds = %bb_inst_1932
  %4645 = load i64, ptr %r2, align 4
  %4646 = load i64, ptr %r3, align 4
  %4647 = icmp ugt i64 %4646, %4645
  br i1 %4647, label %bb_inst_942, label %bb_inst_1936

bb_inst_1936:                                     ; preds = %bb_inst_1935
  %4648 = load ptr, ptr %r10, align 8
  %4649 = getelementptr i8, ptr %4648, i64 -168
  %4650 = load i64, ptr %4649, align 4
  store i64 %4650, ptr %r6, align 4
  %4651 = load i64, ptr %r6, align 4
  %4652 = lshr i64 %4651, 0
  %4653 = and i64 %4652, 255
  %4654 = lshr i64 %4651, 8
  %4655 = and i64 %4654, 255
  %4656 = lshr i64 %4651, 16
  %4657 = and i64 %4656, 255
  %4658 = lshr i64 %4651, 24
  %4659 = and i64 %4658, 255
  %4660 = shl i64 %4653, 8
  %4661 = or i64 %4660, %4655
  %4662 = shl i64 %4661, 8
  %4663 = or i64 %4662, %4657
  %4664 = shl i64 %4663, 8
  %4665 = or i64 %4664, %4659
  store i64 %4665, ptr %r6, align 4
  store i64 4294901760, ptr %r2, align 4
  %4666 = load i64, ptr %r6, align 4
  %4667 = load i64, ptr %r2, align 4
  %4668 = and i64 %4666, %4667
  store i64 %4668, ptr %r6, align 4
  %4669 = load ptr, ptr %r10, align 8
  %4670 = getelementptr i8, ptr %4669, i64 -128
  %4671 = load i64, ptr %4670, align 4
  store i64 %4671, ptr %r2, align 4
  %4672 = load i64, ptr %r2, align 4
  %4673 = and i64 %4672, -65536
  store i64 %4673, ptr %r2, align 4
  %4674 = load i64, ptr %r6, align 4
  %4675 = load i64, ptr %r2, align 4
  %4676 = xor i64 %4674, %4675
  store i64 %4676, ptr %r6, align 4
  %4677 = load i64, ptr %r6, align 4
  store i64 %4677, ptr %r2, align 4
  %4678 = load i64, ptr %r2, align 4
  %4679 = or i64 %4678, 4268
  store i64 %4679, ptr %r2, align 4
  %4680 = load i64, ptr %r1, align 4
  store i64 %4680, ptr %r3, align 4
  %4681 = load i64, ptr %r3, align 4
  %4682 = add i64 %4681, 20
  store i64 %4682, ptr %r3, align 4
  %4683 = load ptr, ptr %r7, align 8
  %4684 = getelementptr i8, ptr %4683, i64 5
  %4685 = load i8, ptr %4684, align 1
  %4686 = zext i8 %4685 to i64
  store i64 %4686, ptr %r4, align 4
  %4687 = load i64, ptr %r4, align 4
  %4688 = trunc i64 %4687 to i8
  %4689 = load ptr, ptr %r1, align 8
  %4690 = getelementptr i8, ptr %4689, i64 5
  store i8 %4688, ptr %4690, align 1
  %4691 = load ptr, ptr %r7, align 8
  %4692 = getelementptr i8, ptr %4691, i64 4
  %4693 = load i8, ptr %4692, align 1
  %4694 = zext i8 %4693 to i64
  store i64 %4694, ptr %r4, align 4
  %4695 = load i64, ptr %r4, align 4
  %4696 = trunc i64 %4695 to i8
  %4697 = load ptr, ptr %r1, align 8
  %4698 = getelementptr i8, ptr %4697, i64 4
  store i8 %4696, ptr %4698, align 1
  %4699 = load ptr, ptr %r7, align 8
  %4700 = getelementptr i8, ptr %4699, i64 3
  %4701 = load i8, ptr %4700, align 1
  %4702 = zext i8 %4701 to i64
  store i64 %4702, ptr %r4, align 4
  %4703 = load i64, ptr %r4, align 4
  %4704 = trunc i64 %4703 to i8
  %4705 = load ptr, ptr %r1, align 8
  %4706 = getelementptr i8, ptr %4705, i64 3
  store i8 %4704, ptr %4706, align 1
  %4707 = load ptr, ptr %r7, align 8
  %4708 = getelementptr i8, ptr %4707, i64 2
  %4709 = load i8, ptr %4708, align 1
  %4710 = zext i8 %4709 to i64
  store i64 %4710, ptr %r4, align 4
  %4711 = load i64, ptr %r4, align 4
  %4712 = trunc i64 %4711 to i8
  %4713 = load ptr, ptr %r1, align 8
  %4714 = getelementptr i8, ptr %4713, i64 2
  store i8 %4712, ptr %4714, align 1
  %4715 = load ptr, ptr %r7, align 8
  %4716 = getelementptr i8, ptr %4715, i64 1
  %4717 = load i8, ptr %4716, align 1
  %4718 = zext i8 %4717 to i64
  store i64 %4718, ptr %r4, align 4
  %4719 = load i64, ptr %r4, align 4
  %4720 = trunc i64 %4719 to i8
  %4721 = load ptr, ptr %r1, align 8
  %4722 = getelementptr i8, ptr %4721, i64 1
  store i8 %4720, ptr %4722, align 1
  %4723 = load ptr, ptr %r7, align 8
  %4724 = getelementptr i8, ptr %4723, i64 0
  %4725 = load i8, ptr %4724, align 1
  %4726 = zext i8 %4725 to i64
  store i64 %4726, ptr %r4, align 4
  %4727 = load i64, ptr %r4, align 4
  %4728 = trunc i64 %4727 to i8
  %4729 = load ptr, ptr %r1, align 8
  %4730 = getelementptr i8, ptr %4729, i64 0
  store i8 %4728, ptr %4730, align 1
  %4731 = load ptr, ptr %r3, align 8
  %4732 = getelementptr i8, ptr %4731, i64 2
  %4733 = load i8, ptr %4732, align 1
  %4734 = zext i8 %4733 to i64
  store i64 %4734, ptr %r4, align 4
  %4735 = load i64, ptr %r4, align 4
  %4736 = trunc i64 %4735 to i8
  %4737 = load ptr, ptr %r1, align 8
  %4738 = getelementptr i8, ptr %4737, i64 8
  store i8 %4736, ptr %4738, align 1
  %4739 = load ptr, ptr %r3, align 8
  %4740 = getelementptr i8, ptr %4739, i64 3
  %4741 = load i8, ptr %4740, align 1
  %4742 = zext i8 %4741 to i64
  store i64 %4742, ptr %r4, align 4
  %4743 = load i64, ptr %r4, align 4
  %4744 = trunc i64 %4743 to i8
  %4745 = load ptr, ptr %r1, align 8
  %4746 = getelementptr i8, ptr %4745, i64 9
  store i8 %4744, ptr %4746, align 1
  %4747 = load ptr, ptr %r3, align 8
  %4748 = getelementptr i8, ptr %4747, i64 0
  %4749 = load i8, ptr %4748, align 1
  %4750 = zext i8 %4749 to i64
  store i64 %4750, ptr %r4, align 4
  %4751 = load i64, ptr %r4, align 4
  %4752 = trunc i64 %4751 to i8
  %4753 = load ptr, ptr %r1, align 8
  %4754 = getelementptr i8, ptr %4753, i64 6
  store i8 %4752, ptr %4754, align 1
  %4755 = load ptr, ptr %r3, align 8
  %4756 = getelementptr i8, ptr %4755, i64 1
  %4757 = load i8, ptr %4756, align 1
  %4758 = zext i8 %4757 to i64
  store i64 %4758, ptr %r4, align 4
  %4759 = load i64, ptr %r4, align 4
  %4760 = trunc i64 %4759 to i8
  %4761 = load ptr, ptr %r1, align 8
  %4762 = getelementptr i8, ptr %4761, i64 7
  store i8 %4760, ptr %4762, align 1
  %4763 = load ptr, ptr %r3, align 8
  %4764 = getelementptr i8, ptr %4763, i64 4
  %4765 = load i8, ptr %4764, align 1
  %4766 = zext i8 %4765 to i64
  store i64 %4766, ptr %r4, align 4
  %4767 = load i64, ptr %r4, align 4
  %4768 = trunc i64 %4767 to i8
  %4769 = load ptr, ptr %r1, align 8
  %4770 = getelementptr i8, ptr %4769, i64 10
  store i8 %4768, ptr %4770, align 1
  %4771 = load ptr, ptr %r3, align 8
  %4772 = getelementptr i8, ptr %4771, i64 5
  %4773 = load i8, ptr %4772, align 1
  %4774 = zext i8 %4773 to i64
  store i64 %4774, ptr %r3, align 4
  %4775 = load i64, ptr %r3, align 4
  %4776 = trunc i64 %4775 to i8
  %4777 = load ptr, ptr %r1, align 8
  %4778 = getelementptr i8, ptr %4777, i64 11
  store i8 %4776, ptr %4778, align 1
  store i64 8, ptr %r3, align 4
  %4779 = load i64, ptr %r3, align 4
  %4780 = trunc i64 %4779 to i8
  %4781 = load ptr, ptr %r1, align 8
  %4782 = getelementptr i8, ptr %4781, i64 12
  store i8 %4780, ptr %4782, align 1
  store i64 0, ptr %r3, align 4
  %4783 = load i64, ptr %r3, align 4
  %4784 = trunc i64 %4783 to i8
  %4785 = load ptr, ptr %r1, align 8
  %4786 = getelementptr i8, ptr %4785, i64 13
  store i8 %4784, ptr %4786, align 1
  %4787 = load ptr, ptr %r10, align 8
  %4788 = getelementptr i8, ptr %4787, i64 -176
  %4789 = load i64, ptr %4788, align 4
  store i64 %4789, ptr %r4, align 4
  %4790 = load ptr, ptr %r4, align 8
  %4791 = getelementptr i8, ptr %4790, i64 0
  %4792 = load i32, ptr %4791, align 4
  %4793 = zext i32 %4792 to i64
  store i64 %4793, ptr %r4, align 4
  %4794 = load ptr, ptr %r10, align 8
  %4795 = getelementptr i8, ptr %4794, i64 -27
  %4796 = load i8, ptr %4795, align 1
  %4797 = zext i8 %4796 to i64
  store i64 %4797, ptr %r5, align 4
  store i64 69, ptr %r0, align 4
  %4798 = load i64, ptr %r0, align 4
  %4799 = trunc i64 %4798 to i8
  %4800 = load ptr, ptr %r1, align 8
  %4801 = getelementptr i8, ptr %4800, i64 14
  store i8 %4799, ptr %4801, align 1
  %4802 = load i64, ptr %r5, align 4
  %4803 = trunc i64 %4802 to i8
  %4804 = load ptr, ptr %r1, align 8
  %4805 = getelementptr i8, ptr %4804, i64 15
  store i8 %4803, ptr %4805, align 1
  %4806 = load i64, ptr %r6, align 4
  %4807 = shl i64 %4806, 32
  store i64 %4807, ptr %r6, align 4
  %4808 = load i64, ptr %r6, align 4
  %4809 = lshr i64 %4808, 32
  store i64 %4809, ptr %r6, align 4
  %4810 = load i64, ptr %r6, align 4
  %4811 = lshr i64 %4810, 16
  store i64 %4811, ptr %r6, align 4
  %4812 = load i64, ptr %r4, align 4
  store i64 %4812, ptr %r5, align 4
  %4813 = load i64, ptr %r5, align 4
  %4814 = and i64 %4813, 65535
  store i64 %4814, ptr %r5, align 4
  %4815 = load i64, ptr %r6, align 4
  %4816 = load i64, ptr %r5, align 4
  %4817 = add i64 %4815, %4816
  store i64 %4817, ptr %r6, align 4
  %4818 = load i64, ptr %r3, align 4
  %4819 = trunc i64 %4818 to i32
  %4820 = load ptr, ptr %r1, align 8
  %4821 = getelementptr i8, ptr %4820, i64 18
  store i32 %4819, ptr %4821, align 4
  store i64 1088, ptr %r3, align 4
  %4822 = load i64, ptr %r3, align 4
  %4823 = trunc i64 %4822 to i16
  %4824 = load ptr, ptr %r1, align 8
  %4825 = getelementptr i8, ptr %4824, i64 22
  store i16 %4823, ptr %4825, align 2
  %4826 = load i64, ptr %r2, align 4
  %4827 = trunc i64 %4826 to i32
  %4828 = load ptr, ptr %r1, align 8
  %4829 = getelementptr i8, ptr %4828, i64 26
  store i32 %4827, ptr %4829, align 4
  %4830 = load i64, ptr %r4, align 4
  %4831 = trunc i64 %4830 to i32
  %4832 = load ptr, ptr %r1, align 8
  %4833 = getelementptr i8, ptr %4832, i64 30
  store i32 %4831, ptr %4833, align 4
  %4834 = load i64, ptr %r4, align 4
  %4835 = lshr i64 %4834, 16
  store i64 %4835, ptr %r4, align 4
  %4836 = load i64, ptr %r6, align 4
  %4837 = load i64, ptr %r4, align 4
  %4838 = add i64 %4836, %4837
  store i64 %4838, ptr %r6, align 4
  %4839 = load i64, ptr %r9, align 4
  %4840 = add i64 %4839, 20
  store i64 %4840, ptr %r9, align 4
  %4841 = load i64, ptr %r9, align 4
  %4842 = lshr i64 %4841, 0
  %4843 = and i64 %4842, 255
  %4844 = lshr i64 %4841, 8
  %4845 = and i64 %4844, 255
  %4846 = shl i64 %4843, 8
  %4847 = or i64 %4846, %4845
  store i64 %4847, ptr %r9, align 4
  %4848 = load i64, ptr %r9, align 4
  %4849 = trunc i64 %4848 to i16
  %4850 = load ptr, ptr %r1, align 8
  %4851 = getelementptr i8, ptr %4850, i64 16
  store i16 %4849, ptr %4851, align 2
  %4852 = load i64, ptr %r6, align 4
  %4853 = load i64, ptr %r9, align 4
  %4854 = add i64 %4852, %4853
  store i64 %4854, ptr %r6, align 4
  %4855 = load ptr, ptr %r1, align 8
  %4856 = getelementptr i8, ptr %4855, i64 14
  %4857 = load i16, ptr %4856, align 2
  %4858 = zext i16 %4857 to i64
  store i64 %4858, ptr %r2, align 4
  %4859 = load i64, ptr %r6, align 4
  %4860 = load i64, ptr %r2, align 4
  %4861 = add i64 %4859, %4860
  store i64 %4861, ptr %r6, align 4
  %4862 = load ptr, ptr %r1, align 8
  %4863 = getelementptr i8, ptr %4862, i64 22
  %4864 = load i16, ptr %4863, align 2
  %4865 = zext i16 %4864 to i64
  store i64 %4865, ptr %r2, align 4
  %4866 = load i64, ptr %r6, align 4
  %4867 = load i64, ptr %r2, align 4
  %4868 = add i64 %4866, %4867
  store i64 %4868, ptr %r6, align 4
  %4869 = load i64, ptr %r6, align 4
  %4870 = add i64 %4869, 4268
  store i64 %4870, ptr %r6, align 4
  %4871 = load i64, ptr %r6, align 4
  store i64 %4871, ptr %r3, align 4
  %4872 = load i64, ptr %r6, align 4
  store i64 %4872, ptr %r2, align 4
  %4873 = load i64, ptr %r2, align 4
  %4874 = lshr i64 %4873, 16
  store i64 %4874, ptr %r2, align 4
  %4875 = load i64, ptr %r2, align 4
  %4876 = icmp eq i64 %4875, 0
  br i1 %4876, label %bb_inst_2010, label %bb_inst_2008

bb_inst_2008:                                     ; preds = %bb_inst_1936
  %4877 = load i64, ptr %r3, align 4
  %4878 = and i64 %4877, 65535
  store i64 %4878, ptr %r3, align 4
  %4879 = load i64, ptr %r3, align 4
  %4880 = load i64, ptr %r2, align 4
  %4881 = add i64 %4879, %4880
  store i64 %4881, ptr %r3, align 4
  br label %bb_inst_2010

bb_inst_2010:                                     ; preds = %bb_inst_2008, %bb_inst_1936
  %4882 = load i64, ptr %r3, align 4
  store i64 %4882, ptr %r2, align 4
  %4883 = load i64, ptr %r2, align 4
  %4884 = lshr i64 %4883, 16
  store i64 %4884, ptr %r2, align 4
  %4885 = load i64, ptr %r2, align 4
  %4886 = icmp eq i64 %4885, 0
  br i1 %4886, label %bb_inst_2015, label %bb_inst_2013

bb_inst_2013:                                     ; preds = %bb_inst_2010
  %4887 = load i64, ptr %r3, align 4
  %4888 = and i64 %4887, 65535
  store i64 %4888, ptr %r3, align 4
  %4889 = load i64, ptr %r3, align 4
  %4890 = load i64, ptr %r2, align 4
  %4891 = add i64 %4889, %4890
  store i64 %4891, ptr %r3, align 4
  br label %bb_inst_2015

bb_inst_2015:                                     ; preds = %bb_inst_2013, %bb_inst_2010
  %4892 = load i64, ptr %r3, align 4
  store i64 %4892, ptr %r2, align 4
  %4893 = load i64, ptr %r2, align 4
  %4894 = lshr i64 %4893, 16
  store i64 %4894, ptr %r2, align 4
  %4895 = load i64, ptr %r2, align 4
  %4896 = icmp eq i64 %4895, 0
  br i1 %4896, label %bb_inst_1912, label %bb_inst_2018

bb_inst_2018:                                     ; preds = %bb_inst_2015
  br label %bb_inst_1910

bb_inst_2019:                                     ; preds = %bb_inst_1206
  %4897 = load i64, ptr %r10, align 4
  store i64 %4897, ptr %r2, align 4
  %4898 = load i64, ptr %r2, align 4
  %4899 = add i64 %4898, -72
  store i64 %4899, ptr %r2, align 4
  %4900 = load ptr, ptr %r10, align 8
  %4901 = getelementptr i8, ptr %4900, i64 -152
  %4902 = load i64, ptr %4901, align 4
  store i64 %4902, ptr %r1, align 4
  %4903 = load i64, ptr %r1, align 4
  %4904 = load i64, ptr %r2, align 4
  %4905 = load i64, ptr %r3, align 4
  %4906 = load i64, ptr %r4, align 4
  %4907 = load i64, ptr %r5, align 4
  %4908 = call i64 @_bpf_helper_ext_0001(i64 %4903, i64 %4904, i64 %4905, i64 %4906, i64 %4907)
  store i64 %4908, ptr %r0, align 4
  br label %bb_inst_2023

bb_inst_2023:                                     ; preds = %bb_inst_2019
  %4909 = load i64, ptr %r0, align 4
  %4910 = icmp eq i64 %4909, 0
  br i1 %4910, label %bb_inst_2109, label %bb_inst_2024

bb_inst_2024:                                     ; preds = %bb_inst_2023
  %4911 = load ptr, ptr %r0, align 8
  %4912 = getelementptr i8, ptr %4911, i64 0
  %4913 = load i32, ptr %4912, align 4
  %4914 = zext i32 %4913 to i64
  store i64 %4914, ptr %r2, align 4
  %4915 = load ptr, ptr %r10, align 8
  %4916 = getelementptr i8, ptr %4915, i64 -32
  %4917 = load i32, ptr %4916, align 4
  %4918 = zext i32 %4917 to i64
  store i64 %4918, ptr %r1, align 4
  %4919 = load i64, ptr %r1, align 4
  %4920 = load i64, ptr %r2, align 4
  %4921 = icmp eq i64 %4920, %4919
  br i1 %4921, label %bb_inst_2028, label %bb_inst_2027

bb_inst_2027:                                     ; preds = %bb_inst_2024
  br label %bb_inst_2140

bb_inst_2028:                                     ; preds = %bb_inst_2024
  %4922 = load ptr, ptr %r8, align 8
  %4923 = getelementptr i8, ptr %4922, i64 80
  %4924 = load i64, ptr %4923, align 4
  store i64 %4924, ptr %r1, align 4
  %4925 = load i64, ptr %r1, align 4
  %4926 = add i64 %4925, 1
  store i64 %4926, ptr %r1, align 4
  %4927 = load i64, ptr %r1, align 4
  %4928 = load ptr, ptr %r8, align 8
  %4929 = getelementptr i8, ptr %4928, i64 80
  store i64 %4927, ptr %4929, align 4
  br label %bb_inst_2178

bb_inst_2032:                                     ; preds = %bb_inst_707
  %4930 = load ptr, ptr %r10, align 8
  %4931 = getelementptr i8, ptr %4930, i64 -168
  %4932 = load i64, ptr %4931, align 4
  store i64 %4932, ptr %r2, align 4
  %4933 = load ptr, ptr %r2, align 8
  %4934 = getelementptr i8, ptr %4933, i64 8
  %4935 = load i64, ptr %4934, align 4
  store i64 %4935, ptr %r1, align 4
  %4936 = load i64, ptr %r1, align 4
  %4937 = add i64 %4936, 1
  store i64 %4937, ptr %r1, align 4
  %4938 = load i64, ptr %r1, align 4
  %4939 = load ptr, ptr %r2, align 8
  %4940 = getelementptr i8, ptr %4939, i64 8
  store i64 %4938, ptr %4940, align 4
  %4941 = load ptr, ptr %r10, align 8
  %4942 = getelementptr i8, ptr %4941, i64 -100
  %4943 = load i32, ptr %4942, align 4
  %4944 = zext i32 %4943 to i64
  store i64 %4944, ptr %r1, align 4
  %4945 = load i64, ptr %r1, align 4
  %4946 = trunc i64 %4945 to i32
  %4947 = load ptr, ptr %r10, align 8
  %4948 = getelementptr i8, ptr %4947, i64 -16
  store i32 %4946, ptr %4948, align 4
  %4949 = load i64, ptr %r10, align 4
  store i64 %4949, ptr %r2, align 4
  %4950 = load i64, ptr %r2, align 4
  %4951 = add i64 %4950, -16
  store i64 %4951, ptr %r2, align 4
  %4952 = call i64 @__lddw_helper_map_by_fd(i32 18)
  store i64 %4952, ptr %r1, align 4
  %4953 = load i64, ptr %r1, align 4
  %4954 = load i64, ptr %r2, align 4
  %4955 = load i64, ptr %r3, align 4
  %4956 = load i64, ptr %r4, align 4
  %4957 = load i64, ptr %r5, align 4
  %4958 = call i64 @_bpf_helper_ext_0001(i64 %4953, i64 %4954, i64 %4955, i64 %4956, i64 %4957)
  store i64 %4958, ptr %r0, align 4
  br label %bb_inst_2043

bb_inst_2043:                                     ; preds = %bb_inst_2032
  %4959 = load i64, ptr %r0, align 4
  %4960 = icmp eq i64 %4959, 0
  br i1 %4960, label %bb_inst_718, label %bb_inst_2044

bb_inst_2044:                                     ; preds = %bb_inst_2043
  %4961 = load ptr, ptr %r0, align 8
  %4962 = getelementptr i8, ptr %4961, i64 0
  %4963 = load i64, ptr %4962, align 4
  store i64 %4963, ptr %r1, align 4
  %4964 = load i64, ptr %r1, align 4
  %4965 = add i64 %4964, 1
  store i64 %4965, ptr %r1, align 4
  %4966 = load i64, ptr %r1, align 4
  %4967 = load ptr, ptr %r0, align 8
  %4968 = getelementptr i8, ptr %4967, i64 0
  store i64 %4966, ptr %4968, align 4
  br label %bb_inst_718

bb_inst_2048:                                     ; preds = %bb_inst_1130
  %4969 = load ptr, ptr %r7, align 8
  %4970 = getelementptr i8, ptr %4969, i64 1
  %4971 = load i8, ptr %4970, align 1
  %4972 = zext i8 %4971 to i64
  store i64 %4972, ptr %r1, align 4
  %4973 = load i64, ptr %r1, align 4
  %4974 = shl i64 %4973, 24
  store i64 %4974, ptr %r1, align 4
  %4975 = load ptr, ptr %r7, align 8
  %4976 = getelementptr i8, ptr %4975, i64 2
  %4977 = load i8, ptr %4976, align 1
  %4978 = zext i8 %4977 to i64
  store i64 %4978, ptr %r8, align 4
  %4979 = load i64, ptr %r8, align 4
  %4980 = shl i64 %4979, 16
  store i64 %4980, ptr %r8, align 4
  %4981 = load i64, ptr %r8, align 4
  %4982 = load i64, ptr %r1, align 4
  %4983 = or i64 %4981, %4982
  store i64 %4983, ptr %r8, align 4
  %4984 = load ptr, ptr %r7, align 8
  %4985 = getelementptr i8, ptr %4984, i64 3
  %4986 = load i8, ptr %4985, align 1
  %4987 = zext i8 %4986 to i64
  store i64 %4987, ptr %r1, align 4
  %4988 = load i64, ptr %r1, align 4
  %4989 = shl i64 %4988, 8
  store i64 %4989, ptr %r1, align 4
  %4990 = load i64, ptr %r8, align 4
  %4991 = load i64, ptr %r1, align 4
  %4992 = or i64 %4990, %4991
  store i64 %4992, ptr %r8, align 4
  store i64 72, ptr %r1, align 4
  %4993 = load ptr, ptr %r7, align 8
  %4994 = getelementptr i8, ptr %4993, i64 4
  %4995 = load i8, ptr %4994, align 1
  %4996 = zext i8 %4995 to i64
  store i64 %4996, ptr %r2, align 4
  br label %bb_inst_2066

bb_inst_2059:                                     ; preds = %bb_inst_1134
  %4997 = load ptr, ptr %r7, align 8
  %4998 = getelementptr i8, ptr %4997, i64 1
  %4999 = load i8, ptr %4998, align 1
  %5000 = zext i8 %4999 to i64
  store i64 %5000, ptr %r1, align 4
  %5001 = load i64, ptr %r1, align 4
  %5002 = shl i64 %5001, 16
  store i64 %5002, ptr %r1, align 4
  %5003 = load ptr, ptr %r7, align 8
  %5004 = getelementptr i8, ptr %5003, i64 2
  %5005 = load i8, ptr %5004, align 1
  %5006 = zext i8 %5005 to i64
  store i64 %5006, ptr %r8, align 4
  %5007 = load i64, ptr %r8, align 4
  %5008 = shl i64 %5007, 8
  store i64 %5008, ptr %r8, align 4
  %5009 = load i64, ptr %r8, align 4
  %5010 = load i64, ptr %r1, align 4
  %5011 = or i64 %5009, %5010
  store i64 %5011, ptr %r8, align 4
  store i64 64, ptr %r1, align 4
  %5012 = load ptr, ptr %r7, align 8
  %5013 = getelementptr i8, ptr %5012, i64 3
  %5014 = load i8, ptr %5013, align 1
  %5015 = zext i8 %5014 to i64
  store i64 %5015, ptr %r2, align 4
  br label %bb_inst_2066

bb_inst_2066:                                     ; preds = %bb_inst_2059, %bb_inst_2048, %bb_inst_1136
  %5016 = load i64, ptr %r2, align 4
  %5017 = and i64 %5016, 255
  store i64 %5017, ptr %r2, align 4
  %5018 = load i64, ptr %r8, align 4
  %5019 = load i64, ptr %r2, align 4
  %5020 = or i64 %5018, %5019
  store i64 %5020, ptr %r8, align 4
  %5021 = load i64, ptr %r8, align 4
  store i64 %5021, ptr %r2, align 4
  %5022 = load i64, ptr %r2, align 4
  %5023 = shl i64 %5022, 32
  store i64 %5023, ptr %r2, align 4
  %5024 = load i64, ptr %r2, align 4
  %5025 = ashr i64 %5024, 32
  store i64 %5025, ptr %r2, align 4
  store i64 1, ptr %r3, align 4
  %5026 = load i64, ptr %r2, align 4
  %5027 = load i64, ptr %r3, align 4
  %5028 = icmp sgt i64 %5027, %5026
  br i1 %5028, label %bb_inst_714, label %bb_inst_2073

bb_inst_2073:                                     ; preds = %bb_inst_2066
  %5029 = load ptr, ptr %r10, align 8
  %5030 = getelementptr i8, ptr %5029, i64 -168
  %5031 = load i64, ptr %5030, align 4
  store i64 %5031, ptr %r2, align 4
  %5032 = load i64, ptr %r2, align 4
  %5033 = load i64, ptr %r1, align 4
  %5034 = add i64 %5032, %5033
  store i64 %5034, ptr %r2, align 4
  %5035 = load ptr, ptr %r2, align 8
  %5036 = getelementptr i8, ptr %5035, i64 0
  %5037 = load i64, ptr %5036, align 4
  store i64 %5037, ptr %r1, align 4
  %5038 = load i64, ptr %r1, align 4
  %5039 = add i64 %5038, 1
  store i64 %5039, ptr %r1, align 4
  %5040 = load i64, ptr %r1, align 4
  %5041 = load ptr, ptr %r2, align 8
  %5042 = getelementptr i8, ptr %5041, i64 0
  store i64 %5040, ptr %5042, align 4
  %5043 = load i64, ptr %r8, align 4
  %5044 = trunc i64 %5043 to i32
  %5045 = load ptr, ptr %r10, align 8
  %5046 = getelementptr i8, ptr %5045, i64 -20
  store i32 %5044, ptr %5046, align 4
  %5047 = load i64, ptr %r10, align 4
  store i64 %5047, ptr %r2, align 4
  %5048 = load i64, ptr %r2, align 4
  %5049 = add i64 %5048, -20
  store i64 %5049, ptr %r2, align 4
  %5050 = call i64 @__lddw_helper_map_by_fd(i32 16)
  store i64 %5050, ptr %r1, align 4
  %5051 = load i64, ptr %r1, align 4
  %5052 = load i64, ptr %r2, align 4
  %5053 = load i64, ptr %r3, align 4
  %5054 = load i64, ptr %r4, align 4
  %5055 = load i64, ptr %r5, align 4
  %5056 = call i64 @_bpf_helper_ext_0001(i64 %5051, i64 %5052, i64 %5053, i64 %5054, i64 %5055)
  store i64 %5056, ptr %r0, align 4
  br label %bb_inst_2084

bb_inst_2084:                                     ; preds = %bb_inst_2073
  %5057 = load i64, ptr %r0, align 4
  %5058 = icmp eq i64 %5057, 0
  br i1 %5058, label %bb_inst_2101, label %bb_inst_2085

bb_inst_2085:                                     ; preds = %bb_inst_2084
  %5059 = load ptr, ptr %r0, align 8
  %5060 = getelementptr i8, ptr %5059, i64 0
  %5061 = load i32, ptr %5060, align 4
  %5062 = zext i32 %5061 to i64
  store i64 %5062, ptr %r1, align 4
  %5063 = load i64, ptr %r1, align 4
  %5064 = trunc i64 %5063 to i32
  %5065 = load ptr, ptr %r10, align 8
  %5066 = getelementptr i8, ptr %5065, i64 -20
  store i32 %5064, ptr %5066, align 4
  %5067 = load i64, ptr %r1, align 4
  %5068 = icmp eq i64 %5067, 0
  br i1 %5068, label %bb_inst_2101, label %bb_inst_2088

bb_inst_2088:                                     ; preds = %bb_inst_2085
  %5069 = load i64, ptr %r1, align 4
  %5070 = trunc i64 %5069 to i32
  %5071 = load ptr, ptr %r10, align 8
  %5072 = getelementptr i8, ptr %5071, i64 -32
  store i32 %5070, ptr %5072, align 4
  %5073 = load i64, ptr %r10, align 4
  store i64 %5073, ptr %r2, align 4
  %5074 = load i64, ptr %r2, align 4
  %5075 = add i64 %5074, -20
  store i64 %5075, ptr %r2, align 4
  %5076 = call i64 @__lddw_helper_map_by_fd(i32 9)
  store i64 %5076, ptr %r1, align 4
  %5077 = load i64, ptr %r1, align 4
  %5078 = load i64, ptr %r2, align 4
  %5079 = load i64, ptr %r3, align 4
  %5080 = load i64, ptr %r4, align 4
  %5081 = load i64, ptr %r5, align 4
  %5082 = call i64 @_bpf_helper_ext_0001(i64 %5077, i64 %5078, i64 %5079, i64 %5080, i64 %5081)
  store i64 %5082, ptr %r0, align 4
  br label %bb_inst_2094

bb_inst_2094:                                     ; preds = %bb_inst_2088
  %5083 = load i64, ptr %r0, align 4
  %5084 = load ptr, ptr %r10, align 8
  %5085 = getelementptr i8, ptr %5084, i64 -176
  store i64 %5083, ptr %5085, align 4
  %5086 = load i64, ptr %r0, align 4
  %5087 = icmp ne i64 %5086, 0
  br i1 %5087, label %bb_inst_2156, label %bb_inst_2096

bb_inst_2096:                                     ; preds = %bb_inst_2094
  %5088 = load ptr, ptr %r10, align 8
  %5089 = getelementptr i8, ptr %5088, i64 -168
  %5090 = load i64, ptr %5089, align 4
  store i64 %5090, ptr %r2, align 4
  %5091 = load ptr, ptr %r2, align 8
  %5092 = getelementptr i8, ptr %5091, i64 40
  %5093 = load i64, ptr %5092, align 4
  store i64 %5093, ptr %r1, align 4
  %5094 = load i64, ptr %r1, align 4
  %5095 = add i64 %5094, 1
  store i64 %5095, ptr %r1, align 4
  %5096 = load i64, ptr %r1, align 4
  %5097 = load ptr, ptr %r2, align 8
  %5098 = getelementptr i8, ptr %5097, i64 40
  store i64 %5096, ptr %5098, align 4
  br label %bb_inst_941

bb_inst_2101:                                     ; preds = %bb_inst_2085, %bb_inst_2084
  %5099 = load i64, ptr %r8, align 4
  %5100 = shl i64 %5099, 32
  store i64 %5100, ptr %r8, align 4
  %5101 = load i64, ptr %r8, align 4
  %5102 = ashr i64 %5101, 32
  store i64 %5102, ptr %r8, align 4
  %5103 = load ptr, ptr %r10, align 8
  %5104 = getelementptr i8, ptr %5103, i64 -168
  %5105 = load i64, ptr %5104, align 4
  store i64 %5105, ptr %r2, align 4
  %5106 = load i64, ptr %r8, align 4
  %5107 = load ptr, ptr %r2, align 8
  %5108 = getelementptr i8, ptr %5107, i64 24
  store i64 %5106, ptr %5108, align 4
  %5109 = load ptr, ptr %r2, align 8
  %5110 = getelementptr i8, ptr %5109, i64 16
  %5111 = load i64, ptr %5110, align 4
  store i64 %5111, ptr %r1, align 4
  %5112 = load i64, ptr %r1, align 4
  %5113 = add i64 %5112, 1
  store i64 %5113, ptr %r1, align 4
  %5114 = load i64, ptr %r1, align 4
  %5115 = load ptr, ptr %r2, align 8
  %5116 = getelementptr i8, ptr %5115, i64 16
  store i64 %5114, ptr %5116, align 4
  br label %bb_inst_715

bb_inst_2109:                                     ; preds = %bb_inst_2023
  store i64 514, ptr %r1, align 4
  %5117 = load i64, ptr %r1, align 4
  %5118 = trunc i64 %5117 to i32
  %5119 = load ptr, ptr %r10, align 8
  %5120 = getelementptr i8, ptr %5119, i64 -16
  store i32 %5118, ptr %5120, align 4
  %5121 = load i64, ptr %r10, align 4
  store i64 %5121, ptr %r2, align 4
  %5122 = load i64, ptr %r2, align 4
  %5123 = add i64 %5122, -16
  store i64 %5123, ptr %r2, align 4
  %5124 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %5124, ptr %r1, align 4
  %5125 = load i64, ptr %r1, align 4
  %5126 = load i64, ptr %r2, align 4
  %5127 = load i64, ptr %r3, align 4
  %5128 = load i64, ptr %r4, align 4
  %5129 = load i64, ptr %r5, align 4
  %5130 = call i64 @_bpf_helper_ext_0001(i64 %5125, i64 %5126, i64 %5127, i64 %5128, i64 %5129)
  store i64 %5130, ptr %r0, align 4
  br label %bb_inst_2116

bb_inst_2116:                                     ; preds = %bb_inst_2109
  %5131 = load i64, ptr %r0, align 4
  store i64 %5131, ptr %r9, align 4
  %5132 = load i64, ptr %r9, align 4
  %5133 = icmp eq i64 %5132, 0
  br i1 %5133, label %bb_inst_2175, label %bb_inst_2118

bb_inst_2118:                                     ; preds = %bb_inst_2116
  %5134 = load i64, ptr %r1, align 4
  %5135 = load i64, ptr %r2, align 4
  %5136 = load i64, ptr %r3, align 4
  %5137 = load i64, ptr %r4, align 4
  %5138 = load i64, ptr %r5, align 4
  %5139 = call i64 @_bpf_helper_ext_0005(i64 %5134, i64 %5135, i64 %5136, i64 %5137, i64 %5138)
  store i64 %5139, ptr %r0, align 4
  br label %bb_inst_2119

bb_inst_2119:                                     ; preds = %bb_inst_2118
  %5140 = load ptr, ptr %r9, align 8
  %5141 = getelementptr i8, ptr %5140, i64 8
  %5142 = load i64, ptr %5141, align 4
  store i64 %5142, ptr %r1, align 4
  %5143 = load i64, ptr %r0, align 4
  store i64 %5143, ptr %r2, align 4
  %5144 = load i64, ptr %r2, align 4
  %5145 = load i64, ptr %r1, align 4
  %5146 = sub i64 %5144, %5145
  store i64 %5146, ptr %r2, align 4
  store i64 1000000001, ptr %r1, align 4
  %5147 = load i64, ptr %r2, align 4
  %5148 = load i64, ptr %r1, align 4
  %5149 = icmp ugt i64 %5148, %5147
  br i1 %5149, label %bb_inst_2170, label %bb_inst_2124

bb_inst_2124:                                     ; preds = %bb_inst_2119
  %5150 = load i64, ptr %r0, align 4
  %5151 = load ptr, ptr %r9, align 8
  %5152 = getelementptr i8, ptr %5151, i64 8
  store i64 %5150, ptr %5152, align 4
  store i64 1, ptr %r1, align 4
  %5153 = load i64, ptr %r1, align 4
  %5154 = load ptr, ptr %r9, align 8
  %5155 = getelementptr i8, ptr %5154, i64 0
  store i64 %5153, ptr %5155, align 4
  br label %bb_inst_2127

bb_inst_2127:                                     ; preds = %bb_inst_2124, %bb_inst_2170
  store i64 0, ptr %r1, align 4
  %5156 = load i64, ptr %r1, align 4
  %5157 = load ptr, ptr %r10, align 8
  %5158 = getelementptr i8, ptr %5157, i64 -16
  store i64 %5156, ptr %5158, align 4
  %5159 = load ptr, ptr %r10, align 8
  %5160 = getelementptr i8, ptr %5159, i64 -32
  %5161 = load i32, ptr %5160, align 4
  %5162 = zext i32 %5161 to i64
  store i64 %5162, ptr %r2, align 4
  %5163 = load i64, ptr %r2, align 4
  %5164 = trunc i64 %5163 to i32
  %5165 = load ptr, ptr %r10, align 8
  %5166 = getelementptr i8, ptr %5165, i64 -16
  store i32 %5164, ptr %5166, align 4
  %5167 = load i64, ptr %r1, align 4
  %5168 = load ptr, ptr %r10, align 8
  %5169 = getelementptr i8, ptr %5168, i64 -8
  store i64 %5167, ptr %5169, align 4
  %5170 = load i64, ptr %r10, align 4
  store i64 %5170, ptr %r2, align 4
  %5171 = load i64, ptr %r2, align 4
  %5172 = add i64 %5171, -72
  store i64 %5172, ptr %r2, align 4
  %5173 = load i64, ptr %r10, align 4
  store i64 %5173, ptr %r3, align 4
  %5174 = load i64, ptr %r3, align 4
  %5175 = add i64 %5174, -16
  store i64 %5175, ptr %r3, align 4
  %5176 = load ptr, ptr %r10, align 8
  %5177 = getelementptr i8, ptr %5176, i64 -152
  %5178 = load i64, ptr %5177, align 4
  store i64 %5178, ptr %r1, align 4
  store i64 0, ptr %r4, align 4
  %5179 = load i64, ptr %r1, align 4
  %5180 = load i64, ptr %r2, align 4
  %5181 = load i64, ptr %r3, align 4
  %5182 = load i64, ptr %r4, align 4
  %5183 = load i64, ptr %r5, align 4
  %5184 = call i64 @_bpf_helper_ext_0002(i64 %5179, i64 %5180, i64 %5181, i64 %5182, i64 %5183)
  store i64 %5184, ptr %r0, align 4
  br label %bb_inst_2139

bb_inst_2139:                                     ; preds = %bb_inst_2127
  br label %bb_inst_2175

bb_inst_2140:                                     ; preds = %bb_inst_2027
  %5185 = load i64, ptr %r1, align 4
  %5186 = trunc i64 %5185 to i32
  %5187 = load ptr, ptr %r0, align 8
  %5188 = getelementptr i8, ptr %5187, i64 0
  store i32 %5186, ptr %5188, align 4
  %5189 = load ptr, ptr %r8, align 8
  %5190 = getelementptr i8, ptr %5189, i64 88
  %5191 = load i64, ptr %5190, align 4
  store i64 %5191, ptr %r1, align 4
  %5192 = load i64, ptr %r1, align 4
  %5193 = add i64 %5192, 1
  store i64 %5193, ptr %r1, align 4
  %5194 = load i64, ptr %r1, align 4
  %5195 = load ptr, ptr %r8, align 8
  %5196 = getelementptr i8, ptr %5195, i64 88
  store i64 %5194, ptr %5196, align 4
  %5197 = load ptr, ptr %r10, align 8
  %5198 = getelementptr i8, ptr %5197, i64 -100
  %5199 = load i32, ptr %5198, align 4
  %5200 = zext i32 %5199 to i64
  store i64 %5200, ptr %r1, align 4
  %5201 = load i64, ptr %r1, align 4
  %5202 = trunc i64 %5201 to i32
  %5203 = load ptr, ptr %r10, align 8
  %5204 = getelementptr i8, ptr %5203, i64 -16
  store i32 %5202, ptr %5204, align 4
  %5205 = load i64, ptr %r10, align 4
  store i64 %5205, ptr %r2, align 4
  %5206 = load i64, ptr %r2, align 4
  %5207 = add i64 %5206, -16
  store i64 %5207, ptr %r2, align 4
  %5208 = call i64 @__lddw_helper_map_by_fd(i32 18)
  store i64 %5208, ptr %r1, align 4
  %5209 = load i64, ptr %r1, align 4
  %5210 = load i64, ptr %r2, align 4
  %5211 = load i64, ptr %r3, align 4
  %5212 = load i64, ptr %r4, align 4
  %5213 = load i64, ptr %r5, align 4
  %5214 = call i64 @_bpf_helper_ext_0001(i64 %5209, i64 %5210, i64 %5211, i64 %5212, i64 %5213)
  store i64 %5214, ptr %r0, align 4
  br label %bb_inst_2151

bb_inst_2151:                                     ; preds = %bb_inst_2140
  %5215 = load i64, ptr %r0, align 4
  %5216 = icmp eq i64 %5215, 0
  br i1 %5216, label %bb_inst_2178, label %bb_inst_2152

bb_inst_2152:                                     ; preds = %bb_inst_2151
  %5217 = load ptr, ptr %r0, align 8
  %5218 = getelementptr i8, ptr %5217, i64 8
  %5219 = load i64, ptr %5218, align 4
  store i64 %5219, ptr %r1, align 4
  %5220 = load i64, ptr %r1, align 4
  %5221 = add i64 %5220, 1
  store i64 %5221, ptr %r1, align 4
  %5222 = load i64, ptr %r1, align 4
  %5223 = load ptr, ptr %r0, align 8
  %5224 = getelementptr i8, ptr %5223, i64 8
  store i64 %5222, ptr %5224, align 4
  br label %bb_inst_2178

bb_inst_2156:                                     ; preds = %bb_inst_2094
  %5225 = load i64, ptr %r10, align 4
  store i64 %5225, ptr %r2, align 4
  %5226 = load i64, ptr %r2, align 4
  %5227 = add i64 %5226, -72
  store i64 %5227, ptr %r2, align 4
  %5228 = load ptr, ptr %r10, align 8
  %5229 = getelementptr i8, ptr %5228, i64 -152
  %5230 = load i64, ptr %5229, align 4
  store i64 %5230, ptr %r1, align 4
  %5231 = load i64, ptr %r1, align 4
  %5232 = load i64, ptr %r2, align 4
  %5233 = load i64, ptr %r3, align 4
  %5234 = load i64, ptr %r4, align 4
  %5235 = load i64, ptr %r5, align 4
  %5236 = call i64 @_bpf_helper_ext_0001(i64 %5231, i64 %5232, i64 %5233, i64 %5234, i64 %5235)
  store i64 %5236, ptr %r0, align 4
  br label %bb_inst_2160

bb_inst_2160:                                     ; preds = %bb_inst_2156
  %5237 = load i64, ptr %r0, align 4
  %5238 = icmp eq i64 %5237, 0
  br i1 %5238, label %bb_inst_2184, label %bb_inst_2161

bb_inst_2161:                                     ; preds = %bb_inst_2160
  %5239 = load ptr, ptr %r0, align 8
  %5240 = getelementptr i8, ptr %5239, i64 0
  %5241 = load i32, ptr %5240, align 4
  %5242 = zext i32 %5241 to i64
  store i64 %5242, ptr %r2, align 4
  %5243 = load ptr, ptr %r10, align 8
  %5244 = getelementptr i8, ptr %5243, i64 -32
  %5245 = load i32, ptr %5244, align 4
  %5246 = zext i32 %5245 to i64
  store i64 %5246, ptr %r1, align 4
  %5247 = load i64, ptr %r1, align 4
  %5248 = load i64, ptr %r2, align 4
  %5249 = icmp eq i64 %5248, %5247
  br i1 %5249, label %bb_inst_2165, label %bb_inst_2164

bb_inst_2164:                                     ; preds = %bb_inst_2161
  br label %bb_inst_2215

bb_inst_2165:                                     ; preds = %bb_inst_2161
  %5250 = load ptr, ptr %r10, align 8
  %5251 = getelementptr i8, ptr %5250, i64 -168
  %5252 = load i64, ptr %5251, align 4
  store i64 %5252, ptr %r2, align 4
  %5253 = load ptr, ptr %r2, align 8
  %5254 = getelementptr i8, ptr %5253, i64 80
  %5255 = load i64, ptr %5254, align 4
  store i64 %5255, ptr %r1, align 4
  %5256 = load i64, ptr %r1, align 4
  %5257 = add i64 %5256, 1
  store i64 %5257, ptr %r1, align 4
  %5258 = load i64, ptr %r1, align 4
  %5259 = load ptr, ptr %r2, align 8
  %5260 = getelementptr i8, ptr %5259, i64 80
  store i64 %5258, ptr %5260, align 4
  br label %bb_inst_2241

bb_inst_2170:                                     ; preds = %bb_inst_2119
  %5261 = load ptr, ptr %r9, align 8
  %5262 = getelementptr i8, ptr %5261, i64 0
  %5263 = load i64, ptr %5262, align 4
  store i64 %5263, ptr %r1, align 4
  %5264 = load i64, ptr %r1, align 4
  %5265 = add i64 %5264, 1
  store i64 %5265, ptr %r1, align 4
  %5266 = load i64, ptr %r1, align 4
  %5267 = load ptr, ptr %r9, align 8
  %5268 = getelementptr i8, ptr %5267, i64 0
  store i64 %5266, ptr %5268, align 4
  store i64 125001, ptr %r2, align 4
  %5269 = load i64, ptr %r1, align 4
  %5270 = load i64, ptr %r2, align 4
  %5271 = icmp ugt i64 %5270, %5269
  br i1 %5271, label %bb_inst_2127, label %bb_inst_2175

bb_inst_2175:                                     ; preds = %bb_inst_2170, %bb_inst_2139, %bb_inst_2116
  %5272 = load ptr, ptr %r8, align 8
  %5273 = getelementptr i8, ptr %5272, i64 96
  %5274 = load i64, ptr %5273, align 4
  store i64 %5274, ptr %r1, align 4
  %5275 = load i64, ptr %r1, align 4
  %5276 = add i64 %5275, 1
  store i64 %5276, ptr %r1, align 4
  %5277 = load i64, ptr %r1, align 4
  %5278 = load ptr, ptr %r8, align 8
  %5279 = getelementptr i8, ptr %5278, i64 96
  store i64 %5277, ptr %5279, align 4
  br label %bb_inst_2178

bb_inst_2178:                                     ; preds = %bb_inst_2175, %bb_inst_2152, %bb_inst_2151, %bb_inst_2028
  %5280 = load ptr, ptr %r8, align 8
  %5281 = getelementptr i8, ptr %5280, i64 32
  %5282 = load i64, ptr %5281, align 4
  store i64 %5282, ptr %r1, align 4
  %5283 = load i64, ptr %r1, align 4
  %5284 = add i64 %5283, 1
  store i64 %5284, ptr %r1, align 4
  %5285 = load i64, ptr %r1, align 4
  %5286 = load ptr, ptr %r8, align 8
  %5287 = getelementptr i8, ptr %5286, i64 32
  store i64 %5285, ptr %5287, align 4
  %5288 = load ptr, ptr %r10, align 8
  %5289 = getelementptr i8, ptr %5288, i64 -40
  %5290 = load i16, ptr %5289, align 2
  %5291 = zext i16 %5290 to i64
  store i64 %5291, ptr %r1, align 4
  %5292 = load i64, ptr %r1, align 4
  %5293 = load ptr, ptr %r10, align 8
  %5294 = getelementptr i8, ptr %5293, i64 -192
  store i64 %5292, ptr %5294, align 4
  br label %bb_inst_1688

bb_inst_2184:                                     ; preds = %bb_inst_2160
  store i64 514, ptr %r1, align 4
  %5295 = load i64, ptr %r1, align 4
  %5296 = trunc i64 %5295 to i32
  %5297 = load ptr, ptr %r10, align 8
  %5298 = getelementptr i8, ptr %5297, i64 -16
  store i32 %5296, ptr %5298, align 4
  %5299 = load i64, ptr %r10, align 4
  store i64 %5299, ptr %r2, align 4
  %5300 = load i64, ptr %r2, align 4
  %5301 = add i64 %5300, -16
  store i64 %5301, ptr %r2, align 4
  %5302 = call i64 @__lddw_helper_map_by_fd(i32 13)
  store i64 %5302, ptr %r1, align 4
  %5303 = load i64, ptr %r1, align 4
  %5304 = load i64, ptr %r2, align 4
  %5305 = load i64, ptr %r3, align 4
  %5306 = load i64, ptr %r4, align 4
  %5307 = load i64, ptr %r5, align 4
  %5308 = call i64 @_bpf_helper_ext_0001(i64 %5303, i64 %5304, i64 %5305, i64 %5306, i64 %5307)
  store i64 %5308, ptr %r0, align 4
  br label %bb_inst_2191

bb_inst_2191:                                     ; preds = %bb_inst_2184
  %5309 = load i64, ptr %r0, align 4
  store i64 %5309, ptr %r7, align 4
  %5310 = load i64, ptr %r7, align 4
  %5311 = icmp eq i64 %5310, 0
  br i1 %5311, label %bb_inst_2237, label %bb_inst_2193

bb_inst_2193:                                     ; preds = %bb_inst_2191
  %5312 = load i64, ptr %r1, align 4
  %5313 = load i64, ptr %r2, align 4
  %5314 = load i64, ptr %r3, align 4
  %5315 = load i64, ptr %r4, align 4
  %5316 = load i64, ptr %r5, align 4
  %5317 = call i64 @_bpf_helper_ext_0005(i64 %5312, i64 %5313, i64 %5314, i64 %5315, i64 %5316)
  store i64 %5317, ptr %r0, align 4
  br label %bb_inst_2194

bb_inst_2194:                                     ; preds = %bb_inst_2193
  %5318 = load ptr, ptr %r7, align 8
  %5319 = getelementptr i8, ptr %5318, i64 8
  %5320 = load i64, ptr %5319, align 4
  store i64 %5320, ptr %r1, align 4
  %5321 = load i64, ptr %r0, align 4
  store i64 %5321, ptr %r2, align 4
  %5322 = load i64, ptr %r2, align 4
  %5323 = load i64, ptr %r1, align 4
  %5324 = sub i64 %5322, %5323
  store i64 %5324, ptr %r2, align 4
  store i64 1000000001, ptr %r1, align 4
  %5325 = load i64, ptr %r2, align 4
  %5326 = load i64, ptr %r1, align 4
  %5327 = icmp ugt i64 %5326, %5325
  br i1 %5327, label %bb_inst_2232, label %bb_inst_2199

bb_inst_2199:                                     ; preds = %bb_inst_2194
  %5328 = load i64, ptr %r0, align 4
  %5329 = load ptr, ptr %r7, align 8
  %5330 = getelementptr i8, ptr %5329, i64 8
  store i64 %5328, ptr %5330, align 4
  store i64 1, ptr %r1, align 4
  %5331 = load i64, ptr %r1, align 4
  %5332 = load ptr, ptr %r7, align 8
  %5333 = getelementptr i8, ptr %5332, i64 0
  store i64 %5331, ptr %5333, align 4
  br label %bb_inst_2202

bb_inst_2202:                                     ; preds = %bb_inst_2199, %bb_inst_2232
  store i64 0, ptr %r1, align 4
  %5334 = load i64, ptr %r1, align 4
  %5335 = load ptr, ptr %r10, align 8
  %5336 = getelementptr i8, ptr %5335, i64 -16
  store i64 %5334, ptr %5336, align 4
  %5337 = load ptr, ptr %r10, align 8
  %5338 = getelementptr i8, ptr %5337, i64 -32
  %5339 = load i32, ptr %5338, align 4
  %5340 = zext i32 %5339 to i64
  store i64 %5340, ptr %r2, align 4
  %5341 = load i64, ptr %r2, align 4
  %5342 = trunc i64 %5341 to i32
  %5343 = load ptr, ptr %r10, align 8
  %5344 = getelementptr i8, ptr %5343, i64 -16
  store i32 %5342, ptr %5344, align 4
  %5345 = load i64, ptr %r1, align 4
  %5346 = load ptr, ptr %r10, align 8
  %5347 = getelementptr i8, ptr %5346, i64 -8
  store i64 %5345, ptr %5347, align 4
  %5348 = load i64, ptr %r10, align 4
  store i64 %5348, ptr %r2, align 4
  %5349 = load i64, ptr %r2, align 4
  %5350 = add i64 %5349, -72
  store i64 %5350, ptr %r2, align 4
  %5351 = load i64, ptr %r10, align 4
  store i64 %5351, ptr %r3, align 4
  %5352 = load i64, ptr %r3, align 4
  %5353 = add i64 %5352, -16
  store i64 %5353, ptr %r3, align 4
  %5354 = load ptr, ptr %r10, align 8
  %5355 = getelementptr i8, ptr %5354, i64 -152
  %5356 = load i64, ptr %5355, align 4
  store i64 %5356, ptr %r1, align 4
  store i64 0, ptr %r4, align 4
  %5357 = load i64, ptr %r1, align 4
  %5358 = load i64, ptr %r2, align 4
  %5359 = load i64, ptr %r3, align 4
  %5360 = load i64, ptr %r4, align 4
  %5361 = load i64, ptr %r5, align 4
  %5362 = call i64 @_bpf_helper_ext_0002(i64 %5357, i64 %5358, i64 %5359, i64 %5360, i64 %5361)
  store i64 %5362, ptr %r0, align 4
  br label %bb_inst_2214

bb_inst_2214:                                     ; preds = %bb_inst_2202
  br label %bb_inst_2237

bb_inst_2215:                                     ; preds = %bb_inst_2164
  %5363 = load i64, ptr %r1, align 4
  %5364 = trunc i64 %5363 to i32
  %5365 = load ptr, ptr %r0, align 8
  %5366 = getelementptr i8, ptr %5365, i64 0
  store i32 %5364, ptr %5366, align 4
  %5367 = load ptr, ptr %r10, align 8
  %5368 = getelementptr i8, ptr %5367, i64 -168
  %5369 = load i64, ptr %5368, align 4
  store i64 %5369, ptr %r2, align 4
  %5370 = load ptr, ptr %r2, align 8
  %5371 = getelementptr i8, ptr %5370, i64 88
  %5372 = load i64, ptr %5371, align 4
  store i64 %5372, ptr %r1, align 4
  %5373 = load i64, ptr %r1, align 4
  %5374 = add i64 %5373, 1
  store i64 %5374, ptr %r1, align 4
  %5375 = load i64, ptr %r1, align 4
  %5376 = load ptr, ptr %r2, align 8
  %5377 = getelementptr i8, ptr %5376, i64 88
  store i64 %5375, ptr %5377, align 4
  %5378 = load ptr, ptr %r10, align 8
  %5379 = getelementptr i8, ptr %5378, i64 -100
  %5380 = load i32, ptr %5379, align 4
  %5381 = zext i32 %5380 to i64
  store i64 %5381, ptr %r1, align 4
  %5382 = load i64, ptr %r1, align 4
  %5383 = trunc i64 %5382 to i32
  %5384 = load ptr, ptr %r10, align 8
  %5385 = getelementptr i8, ptr %5384, i64 -16
  store i32 %5383, ptr %5385, align 4
  %5386 = load i64, ptr %r10, align 4
  store i64 %5386, ptr %r2, align 4
  %5387 = load i64, ptr %r2, align 4
  %5388 = add i64 %5387, -16
  store i64 %5388, ptr %r2, align 4
  %5389 = call i64 @__lddw_helper_map_by_fd(i32 18)
  store i64 %5389, ptr %r1, align 4
  %5390 = load i64, ptr %r1, align 4
  %5391 = load i64, ptr %r2, align 4
  %5392 = load i64, ptr %r3, align 4
  %5393 = load i64, ptr %r4, align 4
  %5394 = load i64, ptr %r5, align 4
  %5395 = call i64 @_bpf_helper_ext_0001(i64 %5390, i64 %5391, i64 %5392, i64 %5393, i64 %5394)
  store i64 %5395, ptr %r0, align 4
  br label %bb_inst_2227

bb_inst_2227:                                     ; preds = %bb_inst_2215
  %5396 = load i64, ptr %r0, align 4
  %5397 = icmp eq i64 %5396, 0
  br i1 %5397, label %bb_inst_2241, label %bb_inst_2228

bb_inst_2228:                                     ; preds = %bb_inst_2227
  %5398 = load ptr, ptr %r0, align 8
  %5399 = getelementptr i8, ptr %5398, i64 8
  %5400 = load i64, ptr %5399, align 4
  store i64 %5400, ptr %r1, align 4
  %5401 = load i64, ptr %r1, align 4
  %5402 = add i64 %5401, 1
  store i64 %5402, ptr %r1, align 4
  %5403 = load i64, ptr %r1, align 4
  %5404 = load ptr, ptr %r0, align 8
  %5405 = getelementptr i8, ptr %5404, i64 8
  store i64 %5403, ptr %5405, align 4
  br label %bb_inst_2241

bb_inst_2232:                                     ; preds = %bb_inst_2194
  %5406 = load ptr, ptr %r7, align 8
  %5407 = getelementptr i8, ptr %5406, i64 0
  %5408 = load i64, ptr %5407, align 4
  store i64 %5408, ptr %r1, align 4
  %5409 = load i64, ptr %r1, align 4
  %5410 = add i64 %5409, 1
  store i64 %5410, ptr %r1, align 4
  %5411 = load i64, ptr %r1, align 4
  %5412 = load ptr, ptr %r7, align 8
  %5413 = getelementptr i8, ptr %5412, i64 0
  store i64 %5411, ptr %5413, align 4
  store i64 125001, ptr %r2, align 4
  %5414 = load i64, ptr %r1, align 4
  %5415 = load i64, ptr %r2, align 4
  %5416 = icmp ugt i64 %5415, %5414
  br i1 %5416, label %bb_inst_2202, label %bb_inst_2237

bb_inst_2237:                                     ; preds = %bb_inst_2232, %bb_inst_2214, %bb_inst_2191
  %5417 = load ptr, ptr %r10, align 8
  %5418 = getelementptr i8, ptr %5417, i64 -168
  %5419 = load i64, ptr %5418, align 4
  store i64 %5419, ptr %r2, align 4
  %5420 = load ptr, ptr %r2, align 8
  %5421 = getelementptr i8, ptr %5420, i64 96
  %5422 = load i64, ptr %5421, align 4
  store i64 %5422, ptr %r1, align 4
  %5423 = load i64, ptr %r1, align 4
  %5424 = add i64 %5423, 1
  store i64 %5424, ptr %r1, align 4
  %5425 = load i64, ptr %r1, align 4
  %5426 = load ptr, ptr %r2, align 8
  %5427 = getelementptr i8, ptr %5426, i64 96
  store i64 %5425, ptr %5427, align 4
  br label %bb_inst_2241

bb_inst_2241:                                     ; preds = %bb_inst_2237, %bb_inst_2228, %bb_inst_2227, %bb_inst_2165
  %5428 = load ptr, ptr %r10, align 8
  %5429 = getelementptr i8, ptr %5428, i64 -168
  %5430 = load i64, ptr %5429, align 4
  store i64 %5430, ptr %r2, align 4
  %5431 = load ptr, ptr %r2, align 8
  %5432 = getelementptr i8, ptr %5431, i64 32
  %5433 = load i64, ptr %5432, align 4
  store i64 %5433, ptr %r1, align 4
  %5434 = load i64, ptr %r1, align 4
  %5435 = add i64 %5434, 1
  store i64 %5435, ptr %r1, align 4
  %5436 = load i64, ptr %r1, align 4
  %5437 = load ptr, ptr %r2, align 8
  %5438 = getelementptr i8, ptr %5437, i64 32
  store i64 %5436, ptr %5438, align 4
  %5439 = load ptr, ptr %r10, align 8
  %5440 = getelementptr i8, ptr %5439, i64 -40
  %5441 = load i16, ptr %5440, align 2
  %5442 = zext i16 %5441 to i64
  store i64 %5442, ptr %r1, align 4
  %5443 = load i64, ptr %r1, align 4
  %5444 = load ptr, ptr %r10, align 8
  %5445 = getelementptr i8, ptr %5444, i64 -168
  store i64 %5443, ptr %5445, align 4
  br label %bb_inst_997

exitBlock:                                        ; preds = %bb_inst_942
  %5446 = load i64, ptr %r0, align 4
  ret i64 %5446

localFuncReturnBlock:                             ; preds = %bb_inst_942
  %5447 = load i64, ptr %callItemCnt, align 4
  %5448 = sub i64 %5447, 1
  %5449 = getelementptr ptr, ptr %callStack, i64 %5448
  %5450 = load ptr, ptr %5449, align 8
  %5451 = sub i64 %5447, 2
  %5452 = getelementptr i64, ptr %callStack, i64 %5451
  %5453 = load i64, ptr %5452, align 4
  store i64 %5453, ptr %r6, align 4
  %5454 = sub i64 %5447, 3
  %5455 = getelementptr i64, ptr %callStack, i64 %5454
  %5456 = load i64, ptr %5455, align 4
  store i64 %5456, ptr %r7, align 4
  %5457 = sub i64 %5447, 4
  %5458 = getelementptr i64, ptr %callStack, i64 %5457
  %5459 = load i64, ptr %5458, align 4
  store i64 %5459, ptr %r8, align 4
  %5460 = sub i64 %5447, 5
  %5461 = getelementptr i64, ptr %callStack, i64 %5460
  %5462 = load i64, ptr %5461, align 4
  store i64 %5462, ptr %r9, align 4
  %5463 = sub i64 %5447, 5
  store i64 %5463, ptr %callItemCnt, align 4
  %5464 = load i64, ptr %r10, align 4
  %5465 = add i64 %5464, 64
  store i64 %5465, ptr %r10, align 4
  indirectbr ptr %5450, []
}

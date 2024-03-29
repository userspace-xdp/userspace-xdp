# Pktgen-DPDK

See <https://pktgen.github.io/Pktgen-DPDK/getting_started.html> for details.

## build

```sh
export RTE_TARGET=x86_64-native-linuxapp-gcc
export RTE_TARGET=x86_64-native-linux-gcc
export RTE_SDK=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir
export PKG_CONFIG_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig

cd Pktgen-DPDK/
make
```

## list all information

```console
root@yunwei-server:/home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK# lspci | grep Ethernet
02:01.0 Ethernet controller: Intel Corporation 82545EM Gigabit Ethernet Controller (Copper) (rev 01)
root@yunwei-server:/home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK# lscpu
Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         45 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  4
  On-line CPU(s) list:   0-3
Vendor ID:               GenuineIntel
  BIOS Vendor ID:        GenuineIntel
  Model name:            11th Gen Intel(R) Core(TM) i7-11800H @ 2.30GHz
    BIOS Model name:     11th Gen Intel(R) Core(TM) i7-11800H @ 2.30GHz  CPU @ 2.3GHz
    BIOS CPU family:     2
    CPU family:          6
    Model:               141
    Thread(s) per core:  1
    Core(s) per socket:  2
    Socket(s):           2
    Stepping:            1
    BogoMIPS:            4608.00
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 c
                         lflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc 
                         arch_perfmon rep_good nopl xtopology tsc_reliable nonstop_tsc cpuid tsc_k
                         nown_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe po
                         pcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpc
                         id_single pti ssbd ibrs ibpb stibp fsgsbase tsc_adjust bmi1 avx2 smep bmi
                         2 erms invpcid avx512f avx512dq rdseed adx smap avx512ifma clflushopt clw
                         b avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves arat a
                         vx512vbmi umip avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bital
                         g avx512_vpopcntdq rdpid movdiri movdir64b fsrm avx512_vp2intersect flush
                         _l1d arch_capabilities
Virtualization features: 
  Hypervisor vendor:     VMware
  Virtualization type:   full
Caches (sum of all):     
  L1d:                   192 KiB (4 instances)
  L1i:                   128 KiB (4 instances)
  L2:                    5 MiB (4 instances)
  L3:                    48 MiB (2 instances)
NUMA:                    
  NUMA node(s):          1
  NUMA node0 CPU(s):     0-3
Vulnerabilities:         
  Gather data sampling:  Unknown: Dependent on hypervisor status
  Itlb multihit:         Not affected
  L1tf:                  Mitigation; PTE Inversion
  Mds:                   Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unk
                         nown
  Meltdown:              Mitigation; PTI
  Mmio stale data:       Not affected
  Retbleed:              Mitigation; IBRS
  Spec rstack overflow:  Not affected
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:            Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:            Mitigation; IBRS, IBPB conditional, STIBP disabled, RSB filling, PBRSB-eI
                         BRS Not affected
  Srbds:                 Not affected
  Tsx async abort:       Not affected
root@yunwei-server:/home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK# 
```

## config

```cfg
description = 'A Pktgen-DPDK configuration for Intel 82545EM with 4 cores'

# Setup configuration
setup = {
    'exec': (
        'sudo', '-E'
    ),

    # Specify the PCI addresses of the devices you want to use with Pktgen-DPDK
    'devices': (
        '02:01.0',  # Replace with the PCI addresses of your Ethernet devices
        # Add more devices if needed
    ),
    # UIO module type, igb_uio, vfio-pci or uio_pci_generic
    'uio': 'vfio-pci'
}

# Run command and options
run = {
    'exec': ('sudo', '-E'),

    # Application name and use app_path to help locate the app
    'app_name': 'pktgen',

    # Using (sdk) or (target) for specific variables
    'app_path': (
        './usr/local/bin/%(app_name)s',
        '/usr/local/bin/%(app_name)s'
    ),

    # Define the core mapping based on your CPU architecture
    # Since you have 4 cores, you can allocate them as follows:
    # Core 0 for master, 1-3 for forwarding. Adjust if necessary.
    'cores': '0-3',

    # Number of memory ranks (channels)
    'nrank': '2',

    # Process type
    'proc': 'auto',

    # Log level
    'log': '7',

    # Prefix for the DPDK processes
    'prefix': 'pg',

    'blocklist': (
        # List any devices you want to block Pktgen-DPDK from using
    ),
    'allowlist': (
        '02:01.0',  # Replace with your device PCI address
        # Add more devices if needed
    ),

    'opts': (
        '-v',  # Enable verbose mode
        '-T',  # Enable the colorized terminal output
        '-P',  # Enable promiscuous mode on all ports
    ),
    'map': (
        '[1:2].0',  # Map cores 1 and 2 for port 0 RX and TX respectively
        # Add mappings for additional ports if needed
    ),

    'theme': 'themes/black-yellow.theme',
    # 'shared': '/usr/local/lib/x86_64-linux-gnu/dpdk/pmds-21.1'
}
```

This configuration assumes you have a single Ethernet controller (02:01.0) and four cores available (0-3). You'll need to replace the PCI address with the one corresponding to your Ethernet controller.

Please note that the above configuration is written in Python dictionary format and seems to be part of a larger Python script that might be executing Pktgen-DPDK. If this is the case, ensure that this script is correctly set up to interpret this configuration and execute Pktgen-DPDK accordingly.

Before running Pktgen-DPDK, make sure that the Ethernet device (02:01.0) is bound to the DPDK-compatible driver (like vfio-pci) and that hugepages are configured properly on your system. The number of memory channels (nrank) is set to 2, which is a typical configuration, but you might need to adjust it according to your actual memory setup.

## setup

```console
# ./scripts/hugepages.sh
# tools/run.py -s default
>>> sdk '/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir', target 'x86_64-native-linux-gcc'
<module 'cfg' from 'cfg/default.cfg'>
Setup DPDK to run 'pktgen' application from cfg/default.cfg file
```

This configuration assumes you have a single Ethernet controller (02:01.0) and four cores available (0-3). You'll need to replace the PCI address with the one corresponding to your Ethernet controller.

Please note that the above configuration is written in Python dictionary format and seems to be part of a larger Python script that might be executing Pktgen-DPDK. If this is the case, ensure that this script is correctly set up to interpret this configuration and execute Pktgen-DPDK accordingly.

Before running Pktgen-DPDK, make sure that the Ethernet device (02:01.0) is bound to the DPDK-compatible driver (like vfio-pci) and that hugepages are configured properly on your system. The number of memory channels (nrank) is set to 2, which is a typical configuration, but you might need to adjust it according to your actual memory setup.

## run

Set LD_LIBRARY_PATH to the DPDK library path:

```console
export LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH
```

Then, go to the Pktgen-DPDK directory and run:

```console
sudo scripts/hugepages.sh
scripts/testbed-setup.sh 
sudo -E ./Builddir/app/pktgen -l 0-3 -n 4 --proc-type auto --log-level 7 --socket-mem 512 --file-prefix pg --vdev=net_tap0,iface=tapdpdk -- -P -m "[1:2].0"
```

result:

```console
root@yunwei-server:/home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK# sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH ./Builddir/app/pktgen -l 0-3 -n 4 --proc-type auto --log-level 7 --socket-mem 512 --file-prefix pg -- -P -m "[1:2].0"
- Ports 0-0 of 1   <Main Page>  Copyright(c) <2010-2023>, Intel Corporation
  Port:Flags        : 0:P------      Single
\ink State          :         <UP-10000-FD>     ---Total Rate---
Pkts/s Rx           : 0:P------      Single                    0
/      Tx           :         <UP-10000-FD>                    0
MBits/s Rx/Tx       : 0:P------      Single                    0
/kts/s Rx Max       :         <UP-10000-FD>                    0
- Ports 0-0 of 1   <Main Page>  Copyright(c) <2010-2023>, Intel Corporation
  Port:Flags        : 0:P------      Single
-ink State          :         <UP-10000-FD>     ---Total Rate---
\ Ports 0-0 of 1   <Main Page>  Copyright(c) <2010-2023>, Intel Corporation
- Port:Flags        : 0:P------      Single
Link State          : 0:P------      Single     ---Total Rate---
Pkts/s Rx           :         <UP-10000-FD>                    0
       Tx           :                     0                    0
MBits/s Rx/Tx       :                     0                    0
Pkts/s Rx Max       :                   0/0                  0/0
       Tx Max       :                     5                    5
Broadcast           :                     0                    0
Multicast           :                     0
Sizes 64            :                     0
      65-127        :                     0
      128-255       :                   576
      256-511       :                     0
      512-1023      :                     0
      1024-1518     :                     0
Runts/Jumbos        :                     0
ARP/ICMP Pkts       :                   0/0
Errors Rx/Tx        :                   0/0
Total Rx Pkts       :                   0/0
      Tx Pkts       :                     9
      Rx/Tx MBs     :                     0
TCP Flags           :                   0/0
TCP Seq/Ack         :           74616/74640
Pattern Type        :               abcd...
Pktgen:/> 
Pktgen:/> quit
```

## fix compile error

```console
root@yunwei-server:/home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK# make
>>> Use 'make help' for more commands

./tools/pktgen-build.sh build
>>  SDK Path          : /home/yunwei37/ebpf-xdp-dpdk
>>  Install Path      : /home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK
>>  Build Directory   : /home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK/Builddir
>>  Target Directory  : usr/local
>>  Build Path        : /home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK/Builddir
>>  Target Path       : /home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK/usr/local

 Build and install values:
   lua_enabled       : -Denable_lua=false
   gui_enabled       : -Denable_gui=false

>>> Ninja build in '/home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK/Builddir' buildtype=release
meson setup -Dbuildtype=release -Denable_lua=false -Denable_gui=false /home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK/Builddir
The Meson build system
Version: 1.2.1
Source dir: /home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK
Build dir: /home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK/Builddir
Build type: native build
Program cat found: YES (/usr/bin/cat)
Project name: pktgen
Project version: 23.10.2
C compiler for the host machine: cc (gcc 13.2.0 "cc (Ubuntu 13.2.0-4ubuntu3) 13.2.0")
C linker for the host machine: cc ld.bfd 2.41
Host machine cpu family: x86_64
Host machine cpu: x86_64
Compiler for C supports arguments -mavx: YES 
Compiler for C supports arguments -mavx2: YES 
Compiler for C supports arguments -Wno-pedantic: YES 
Compiler for C supports arguments -Wno-format-truncation: YES 
Found pkg-config: /usr/bin/pkg-config (1.8.1)
Run-time dependency libdpdk found: YES 22.11.3
Message: prefix: /usr libdir: lib/x86_64-linux-gnu
Message: DPDK lib path: /usr/lib/x86_64-linux-gnu
WARNING: find_library('librte_net_bond') starting in "lib" only works by accident and is not portable
Library librte_net_bond found: YES
Program python3 found: YES (/usr/bin/python3)
Library rte_net_i40e found: YES
Library rte_net_ixgbe found: YES
Library rte_net_ice found: YES
Library rte_bus_vdev found: YES
Run-time dependency threads found: YES
Run-time dependency numa found: YES 2.0.16
Run-time dependency pcap found: YES 1.10.4
Library dl found: YES
Library m found: YES
Program doxygen found: NO
Program sphinx-build found: NO
Build targets in project: 9
NOTICE: Future-deprecated features used:
 * 0.56.0: {'dependency.get_pkgconfig_variable'}

pktgen 23.10.2

  User defined options
    buildtype : release
    enable_gui: false
    enable_lua: false

Found ninja-1.11.1 at /usr/bin/ninja
ninja: Entering directory `/home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK/Builddir'                                                               
[42/69] Compiling C object app/pktgen.p/pktgen-cmds.c.o
FAILED: app/pktgen.p/pktgen-cmds.c.o 
cc -Iapp/pktgen.p -Iapp -I../app -Ilib/common -I../lib/common -Ilib/utils -I../lib/utils -Ilib/vec -I../lib/vec -Ilib/plugin -I../lib/plugin -Ilib/cli -I../lib/cli -Ilib/lua -I../lib/lua -I/usr/include/dpdk -I/usr/include/dpdk/../x86_64-linux-gnu/dpdk -I/usr/include/libnl3 -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -fdiagnostics-color=always -D_FILE_OFFSET_BITS=64 -Wall -Winvalid-pch -Wextra -Wpedantic -Werror -O3 -march=native -mavx -mavx2 -DALLOW_EXPERIMENTAL_API -D_GNU_SOURCE -Wno-pedantic -Wno-format-truncation -pthread -include rte_config.h -march=corei7 '-D__PROJECT_VERSION="23.10.2"' -MD -MQ app/pktgen.p/pktgen-cmds.c.o -MF app/pktgen.p/pktgen-cmds.c.o.d -o app/pktgen.p/pktgen-cmds.c.o -c ../app/pktgen-cmds.c
../app/pktgen-cmds.c: In function ‘enable_bonding’:
../app/pktgen-cmds.c:1948:19: error: implicit declaration of function ‘rte_eth_bond_members_get’; did you mean ‘rte_eth_bond_slaves_get’? [-Werror=implicit-function-declaration]
 1948 |     num_workers = rte_eth_bond_members_get(info->pid, workers, RTE_MAX_ETHPORTS);
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~
      |                   rte_eth_bond_slaves_get
../app/pktgen-cmds.c:1955:9: error: implicit declaration of function ‘rte_eth_bond_active_members_get’; did you mean ‘rte_eth_bond_active_slaves_get’? [-Werror=implicit-function-declaration]
 1955 |         rte_eth_bond_active_members_get(info->pid, active_workers, RTE_MAX_ETHPORTS);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         rte_eth_bond_active_slaves_get
../app/pktgen-cmds.c: In function ‘show_bonding_mode’:
../app/pktgen-cmds.c:2087:48: error: storage size of ‘conf’ isn’t known
 2087 |         struct rte_eth_bond_8023ad_member_info conf;
      |                                                ^~~~
../app/pktgen-cmds.c:2090:9: error: implicit declaration of function ‘rte_eth_bond_8023ad_member_info’; did you mean ‘rte_eth_bond_8023ad_slave_info’? [-Werror=implicit-function-declaration]
 2090 |         rte_eth_bond_8023ad_member_info(info->pid, workers[i], &conf);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |         rte_eth_bond_8023ad_slave_info
../app/pktgen-cmds.c:2087:48: error: unused variable ‘conf’ [-Werror=unused-variable]
 2087 |         struct rte_eth_bond_8023ad_member_info conf;
      |                                                ^~~~
cc1: all warnings being treated as errors
[47/69] Compiling C object app/pktgen.p/cli-functions.c.o
ninja: build stopped: subcommand failed.
make: *** [Makefile:15: build] Error 1
root@yunwei-server:/home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK# gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-linux-gnu/13/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:amdgcn-amdhsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 13.2.0-4ubuntu3' --with-bugurl=file:///usr/share/doc/gcc-13/README.Bugs --enable-languages=c,ada,c++,go,d,fortran,objc,obj-c++,m2 --prefix=/usr --with-gcc-major-version-only --program-suffix=-13 --program-prefix=x86_64-linux-gnu- --enable-shared --enable-linker-build-id --libexecdir=/usr/libexec --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --enable-bootstrap --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-vtable-verify --enable-plugin --enable-default-pie --with-system-zlib --enable-libphobos-checking=release --with-target-system-zlib=auto --enable-objc-gc=auto --enable-multiarch --disable-werror --enable-cet --with-arch-32=i686 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --enable-multilib --with-tune=generic --enable-offload-targets=nvptx-none=/build/gcc-13-XYspKM/gcc-13-13.2.0/debian/tmp-nvptx/usr,amdgcn-amdhsa=/build/gcc-13-XYspKM/gcc-13-13.2.0/debian/tmp-gcn/usr --enable-offload-defaulted --without-cuda-driver --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --with-build-config=bootstrap-lto-lean --enable-link-serialization=2
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 13.2.0 (Ubuntu 13.2.0-4ubuntu3) 
```

It can be solved by: <https://github.com/pktgen/Pktgen-DPDK/issues/236>

The patch is in documents/0001-fix-for-23.patch

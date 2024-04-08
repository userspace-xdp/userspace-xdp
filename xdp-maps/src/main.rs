use libbpf_rs::libbpf_sys;
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::Arc;
use std::{thread, time};

use anyhow::{bail, Result};
use structopt::StructOpt;

mod xdppass {
    include!(concat!(env!("OUT_DIR"), "/xdppass.skel.rs"));
}
use xdppass::*;

#[derive(Debug, StructOpt, Clone)]
struct Command {
    /// Interface index to attach XDP program
    #[structopt(default_value = "0")]
    ifindex: i32,
    #[structopt(default_value = "N")]
    flag: char,
    #[structopt(default_value = "/sys/kernel/btf/vmlinux")]
    bpf_path: String,
}

fn bump_memlock_rlimit() -> Result<()> {
    let rlimit = libc::rlimit {
        rlim_cur: 128 << 20,
        rlim_max: 128 << 20,
    };

    if unsafe { libc::setrlimit(libc::RLIMIT_MEMLOCK, &rlimit) } != 0 {
        bail!("Failed to increase rlimit");
    }

    Ok(())
}

fn main() -> Result<()> {
    let opts = Command::from_args();

    bump_memlock_rlimit()?;

    let skel_builder = XdppassSkelBuilder::default();

    let mut opt = libbpf_sys::bpf_object_open_opts::default();
    opt.btf_custom_path = opts.bpf_path.as_ptr() as *const i8;
    opt.sz = std::mem::size_of::<libbpf_sys::bpf_object_open_opts>() as u64;
    let open_skel = skel_builder.open_opts(opt)?;

    let mut skel = open_skel.load()?;
    let prog_fd = skel.progs_mut().xdp_pass().fd();
    unsafe {
        let mut xdp_flag = 0;
        if opts.flag == 'S' {
            xdp_flag |= libbpf_sys::XDP_FLAGS_SKB_MODE;
        }
        if opts.flag == 'H' {
            xdp_flag |= libbpf_sys::XDP_FLAGS_HW_MODE;
        }
        if opts.flag == 'N' {
            xdp_flag |= libbpf_sys::XDP_FLAGS_DRV_MODE;
        }
        let ret = libbpf_sys::bpf_xdp_attach(
            opts.ifindex,
            prog_fd,
            xdp_flag,
            0 as *const libbpf_sys::bpf_xdp_attach_opts,
        );
        if ret < 0 {
            eprint!("Failed to attach XDP program: {}", ret);
        }
    }
    let running = Arc::new(AtomicBool::new(true));
    let r = running.clone();
    ctrlc::set_handler(move || {
        r.store(false, Ordering::SeqCst);
    })?;

    while running.load(Ordering::SeqCst) {
        eprint!(".");
        thread::sleep(time::Duration::from_secs(1));
    }

    Ok(())
}

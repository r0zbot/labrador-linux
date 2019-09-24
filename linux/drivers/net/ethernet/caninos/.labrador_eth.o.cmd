cmd_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.o := arm-linux-gnueabihf-gcc -Wp,-MD,/data/labrador-linux/linux/drivers/net/ethernet/caninos/.labrador_eth.o.d  -nostdinc -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/8/include -I/data/labrador-linux/linux/arch/arm/include -I./arch/arm/include/generated  -I/data/labrador-linux/linux/include -I./include -I/data/labrador-linux/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/data/labrador-linux/linux/include/uapi -I./include/generated/uapi -include /data/labrador-linux/linux/include/linux/kconfig.h  -I/data/labrador-linux/linux/drivers/net/ethernet/caninos -I/data/labrador-linux/linux/drivers/net/ethernet/caninos -D__KERNEL__ -mlittle-endian  -I/data/labrador-linux/linux/arch/arm/mach-caninos/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-int-in-bool-context -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fstack-protector -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init  -DMODULE  -DKBUILD_BASENAME='"labrador_eth"'  -DKBUILD_MODNAME='"labrador_eth"' -c -o /data/labrador-linux/linux/drivers/net/ethernet/caninos/.tmp_labrador_eth.o /data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.c

source_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.o := /data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.c

deps_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.o := \
    $(wildcard include/config/of.h) \
  /data/labrador-linux/linux/include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /data/labrador-linux/linux/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /data/labrador-linux/linux/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /data/labrador-linux/linux/include/uapi/linux/types.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/types.h \
  /data/labrador-linux/linux/include/asm-generic/int-ll64.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/uapi/asm/bitsperlong.h \
  /data/labrador-linux/linux/include/asm-generic/bitsperlong.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/bitsperlong.h \
  /data/labrador-linux/linux/include/uapi/linux/posix_types.h \
  /data/labrador-linux/linux/include/linux/stddef.h \
  /data/labrador-linux/linux/include/uapi/linux/stddef.h \
  /data/labrador-linux/linux/include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /data/labrador-linux/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/posix_types.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/posix_types.h \
  /data/labrador-linux/linux/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /data/labrador-linux/linux/include/uapi/linux/const.h \
  /data/labrador-linux/linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/lock/down/kernel.h) \
    $(wildcard include/config/panic/timeout.h) \
  /usr/lib/gcc-cross/arm-linux-gnueabihf/8/include/stdarg.h \
  /data/labrador-linux/linux/include/linux/linkage.h \
  /data/labrador-linux/linux/include/linux/stringify.h \
  /data/labrador-linux/linux/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/linkage.h \
  /data/labrador-linux/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
  /data/labrador-linux/linux/include/asm-generic/barrier.h \
  /data/labrador-linux/linux/include/linux/bitops.h \
  /data/labrador-linux/linux/arch/arm/include/asm/bitops.h \
  /data/labrador-linux/linux/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /data/labrador-linux/linux/include/linux/typecheck.h \
  /data/labrador-linux/linux/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/cpu/v7m.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/hwcap.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/hwcap.h \
  /data/labrador-linux/linux/include/asm-generic/irqflags.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/non-atomic.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/fls64.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/sched.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/hweight.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/arch_hweight.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/const_hweight.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/lock.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/le.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/byteorder.h \
  /data/labrador-linux/linux/include/linux/byteorder/little_endian.h \
    $(wildcard include/config/cpu/big/endian.h) \
  /data/labrador-linux/linux/include/uapi/linux/byteorder/little_endian.h \
  /data/labrador-linux/linux/include/linux/swab.h \
  /data/labrador-linux/linux/include/uapi/linux/swab.h \
  /data/labrador-linux/linux/arch/arm/include/asm/swab.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/swab.h \
  /data/labrador-linux/linux/include/linux/byteorder/generic.h \
  /data/labrador-linux/linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /data/labrador-linux/linux/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /data/labrador-linux/linux/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /data/labrador-linux/linux/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
  /data/labrador-linux/linux/include/linux/kern_levels.h \
  /data/labrador-linux/linux/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /data/labrador-linux/linux/include/uapi/linux/kernel.h \
  /data/labrador-linux/linux/include/uapi/linux/sysinfo.h \
  /data/labrador-linux/linux/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /data/labrador-linux/linux/include/linux/dynamic_debug.h \
    $(wildcard include/config/jump/label.h) \
  /data/labrador-linux/linux/include/linux/jump_label.h \
  /data/labrador-linux/linux/arch/arm/include/asm/jump_label.h \
  /data/labrador-linux/linux/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /data/labrador-linux/linux/include/linux/build_bug.h \
  /data/labrador-linux/linux/arch/arm/include/asm/div64.h \
  /data/labrador-linux/linux/arch/arm/include/asm/compiler.h \
  /data/labrador-linux/linux/include/asm-generic/div64.h \
  /data/labrador-linux/linux/include/linux/stat.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/stat.h \
  /data/labrador-linux/linux/include/uapi/linux/stat.h \
  /data/labrador-linux/linux/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /data/labrador-linux/linux/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /data/labrador-linux/linux/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
  /data/labrador-linux/linux/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm/include/generated/asm/preempt.h \
  /data/labrador-linux/linux/include/asm-generic/preempt.h \
  /data/labrador-linux/linux/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/debug/kmemleak.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /data/labrador-linux/linux/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /data/labrador-linux/linux/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /data/labrador-linux/linux/include/linux/restart_block.h \
    $(wildcard include/config/compat.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/glue.h \
  /data/labrador-linux/linux/arch/arm/include/asm/pgtable-2level-types.h \
  /data/labrador-linux/linux/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/xip/phys/addr.h) \
    $(wildcard include/config/debug/virtual.h) \
  /data/labrador-linux/linux/include/linux/sizes.h \
  /data/labrador-linux/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /data/labrador-linux/linux/include/linux/pfn.h \
  /data/labrador-linux/linux/include/asm-generic/getorder.h \
  /data/labrador-linux/linux/include/linux/bottom_half.h \
  /data/labrador-linux/linux/include/linux/spinlock_types.h \
  /data/labrador-linux/linux/arch/arm/include/asm/spinlock_types.h \
  /data/labrador-linux/linux/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/lockdep/crossrelease.h) \
  /data/labrador-linux/linux/include/linux/rwlock_types.h \
  /data/labrador-linux/linux/arch/arm/include/asm/spinlock.h \
  /data/labrador-linux/linux/include/linux/prefetch.h \
  /data/labrador-linux/linux/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/hw_breakpoint.h \
  /data/labrador-linux/linux/include/linux/rwlock.h \
  /data/labrador-linux/linux/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /data/labrador-linux/linux/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /data/labrador-linux/linux/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/atomic.h \
  /data/labrador-linux/linux/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /data/labrador-linux/linux/include/asm-generic/cmpxchg-local.h \
  /data/labrador-linux/linux/include/asm-generic/atomic-long.h \
  /data/labrador-linux/linux/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /data/labrador-linux/linux/include/linux/time64.h \
  /data/labrador-linux/linux/include/uapi/linux/time.h \
  /data/labrador-linux/linux/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /data/labrador-linux/linux/include/linux/highuid.h \
  /data/labrador-linux/linux/include/linux/kmod.h \
  /data/labrador-linux/linux/include/linux/umh.h \
  /data/labrador-linux/linux/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/cma.h) \
  /data/labrador-linux/linux/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /data/labrador-linux/linux/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /data/labrador-linux/linux/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /data/labrador-linux/linux/include/asm-generic/current.h \
  /data/labrador-linux/linux/include/uapi/linux/wait.h \
  /data/labrador-linux/linux/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /data/labrador-linux/linux/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /data/labrador-linux/linux/include/linux/nodemask.h \
  /data/labrador-linux/linux/include/linux/bitmap.h \
  /data/labrador-linux/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /data/labrador-linux/linux/include/uapi/linux/string.h \
  /data/labrador-linux/linux/arch/arm/include/asm/string.h \
  /data/labrador-linux/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /data/labrador-linux/linux/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /data/labrador-linux/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /data/labrador-linux/linux/include/linux/notifier.h \
  /data/labrador-linux/linux/include/linux/errno.h \
  /data/labrador-linux/linux/include/uapi/linux/errno.h \
  arch/arm/include/generated/uapi/asm/errno.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/errno.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/errno-base.h \
  /data/labrador-linux/linux/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/debug/mutexes.h) \
  /data/labrador-linux/linux/include/linux/osq_lock.h \
  /data/labrador-linux/linux/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /data/labrador-linux/linux/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /data/labrador-linux/linux/include/linux/err.h \
  arch/arm/include/generated/asm/rwsem.h \
  /data/labrador-linux/linux/include/asm-generic/rwsem.h \
  /data/labrador-linux/linux/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /data/labrador-linux/linux/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /data/labrador-linux/linux/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /data/labrador-linux/linux/include/linux/rcutree.h \
  /data/labrador-linux/linux/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /data/labrador-linux/linux/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /data/labrador-linux/linux/include/linux/ktime.h \
  /data/labrador-linux/linux/include/linux/jiffies.h \
  /data/labrador-linux/linux/include/linux/timex.h \
  /data/labrador-linux/linux/include/uapi/linux/timex.h \
  /data/labrador-linux/linux/include/uapi/linux/param.h \
  arch/arm/include/generated/uapi/asm/param.h \
  /data/labrador-linux/linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /data/labrador-linux/linux/include/uapi/asm-generic/param.h \
  /data/labrador-linux/linux/arch/arm/include/asm/timex.h \
  include/generated/timeconst.h \
  /data/labrador-linux/linux/include/linux/timekeeping.h \
  /data/labrador-linux/linux/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /data/labrador-linux/linux/include/linux/rcu_segcblist.h \
  /data/labrador-linux/linux/include/linux/srcutree.h \
  /data/labrador-linux/linux/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /data/labrador-linux/linux/include/linux/completion.h \
    $(wildcard include/config/lockdep/completions.h) \
  /data/labrador-linux/linux/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /data/labrador-linux/linux/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /data/labrador-linux/linux/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/smp.h \
  /data/labrador-linux/linux/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/percpu.h \
  /data/labrador-linux/linux/include/asm-generic/percpu.h \
  /data/labrador-linux/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /data/labrador-linux/linux/include/asm-generic/topology.h \
  /data/labrador-linux/linux/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /data/labrador-linux/linux/include/linux/rbtree.h \
  /data/labrador-linux/linux/include/uapi/linux/sysctl.h \
  /data/labrador-linux/linux/include/linux/elf.h \
  /data/labrador-linux/linux/arch/arm/include/asm/elf.h \
    $(wildcard include/config/vdso.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/auxvec.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/auxvec.h \
  /data/labrador-linux/linux/arch/arm/include/asm/vdso_datapage.h \
  /data/labrador-linux/linux/arch/arm/include/asm/user.h \
  /data/labrador-linux/linux/include/uapi/linux/elf.h \
  /data/labrador-linux/linux/include/uapi/linux/elf-em.h \
  /data/labrador-linux/linux/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /data/labrador-linux/linux/include/linux/sysfs.h \
  /data/labrador-linux/linux/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /data/labrador-linux/linux/include/linux/idr.h \
  /data/labrador-linux/linux/include/linux/radix-tree.h \
    $(wildcard include/config/radix/tree/multiorder.h) \
  /data/labrador-linux/linux/include/linux/kobject_ns.h \
  /data/labrador-linux/linux/include/linux/kref.h \
  /data/labrador-linux/linux/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  /data/labrador-linux/linux/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /data/labrador-linux/linux/include/linux/rbtree_latch.h \
  /data/labrador-linux/linux/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
    $(wildcard include/config/arm/module/plts.h) \
  /data/labrador-linux/linux/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /data/labrador-linux/linux/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/posix/timers.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/intel/rdt.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/security.h) \
  /data/labrador-linux/linux/include/uapi/linux/sched.h \
  /data/labrador-linux/linux/include/linux/pid.h \
  /data/labrador-linux/linux/include/linux/rculist.h \
  /data/labrador-linux/linux/include/linux/sem.h \
  /data/labrador-linux/linux/include/uapi/linux/sem.h \
  /data/labrador-linux/linux/include/linux/ipc.h \
  /data/labrador-linux/linux/include/linux/rhashtable.h \
  /data/labrador-linux/linux/include/linux/jhash.h \
  /data/labrador-linux/linux/include/linux/unaligned/packed_struct.h \
  /data/labrador-linux/linux/include/linux/list_nulls.h \
  /data/labrador-linux/linux/include/uapi/linux/ipc.h \
  arch/arm/include/generated/uapi/asm/ipcbuf.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/ipcbuf.h \
  arch/arm/include/generated/uapi/asm/sembuf.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/sembuf.h \
  /data/labrador-linux/linux/include/linux/shm.h \
  /data/labrador-linux/linux/include/uapi/linux/shm.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm/include/generated/uapi/asm/shmbuf.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/shmbuf.h \
  /data/labrador-linux/linux/arch/arm/include/asm/shmparam.h \
  /data/labrador-linux/linux/include/linux/kcov.h \
  /data/labrador-linux/linux/include/uapi/linux/kcov.h \
  /data/labrador-linux/linux/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /data/labrador-linux/linux/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /data/labrador-linux/linux/include/linux/timerqueue.h \
  /data/labrador-linux/linux/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /data/labrador-linux/linux/include/uapi/linux/seccomp.h \
  arch/arm/include/generated/asm/seccomp.h \
  /data/labrador-linux/linux/include/asm-generic/seccomp.h \
  /data/labrador-linux/linux/include/uapi/linux/unistd.h \
  /data/labrador-linux/linux/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/unistd.h \
  arch/arm/include/generated/uapi/asm/unistd-eabi.h \
  arch/arm/include/generated/uapi/asm/unistd-common.h \
  arch/arm/include/generated/asm/unistd-nr.h \
  /data/labrador-linux/linux/include/linux/resource.h \
  /data/labrador-linux/linux/include/uapi/linux/resource.h \
  arch/arm/include/generated/uapi/asm/resource.h \
  /data/labrador-linux/linux/include/asm-generic/resource.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/resource.h \
  /data/labrador-linux/linux/include/linux/latencytop.h \
  /data/labrador-linux/linux/include/linux/sched/prio.h \
  /data/labrador-linux/linux/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /data/labrador-linux/linux/include/uapi/linux/signal.h \
  /data/labrador-linux/linux/arch/arm/include/asm/signal.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/signal.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/signal-defs.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/sigcontext.h \
  arch/arm/include/generated/uapi/asm/siginfo.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/siginfo.h \
  /data/labrador-linux/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /data/labrador-linux/linux/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /data/labrador-linux/linux/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
  /data/labrador-linux/linux/include/linux/kmemleak.h \
  /data/labrador-linux/linux/include/linux/vmalloc.h \
  /data/labrador-linux/linux/include/linux/kasan.h \
  /data/labrador-linux/linux/include/linux/delay.h \
  /data/labrador-linux/linux/arch/arm/include/asm/delay.h \
  /data/labrador-linux/linux/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/irq/timings.h) \
  /data/labrador-linux/linux/include/linux/irqreturn.h \
  /data/labrador-linux/linux/include/linux/irqnr.h \
  /data/labrador-linux/linux/include/uapi/linux/irqnr.h \
  /data/labrador-linux/linux/include/linux/hardirq.h \
  /data/labrador-linux/linux/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
    $(wildcard include/config/hwlat/tracer.h) \
  /data/labrador-linux/linux/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /data/labrador-linux/linux/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /data/labrador-linux/linux/include/linux/static_key.h \
  /data/labrador-linux/linux/arch/arm/include/asm/hardirq.h \
  /data/labrador-linux/linux/arch/arm/include/asm/irq.h \
    $(wildcard include/config/sparse/irq.h) \
    $(wildcard include/config/multi/irq/handler.h) \
  /data/labrador-linux/linux/arch/arm/mach-caninos/include/mach/irqs.h \
  /data/labrador-linux/linux/include/linux/irq_cpustat.h \
  /data/labrador-linux/linux/arch/arm/include/asm/sections.h \
  /data/labrador-linux/linux/include/asm-generic/sections.h \
  /data/labrador-linux/linux/include/linux/ioport.h \
  /data/labrador-linux/linux/include/linux/crc32.h \
  /data/labrador-linux/linux/include/linux/bitrev.h \
    $(wildcard include/config/have/arch/bitreverse.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/bitrev.h \
  /data/labrador-linux/linux/include/linux/platform_device.h \
    $(wildcard include/config/suspend.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
  /data/labrador-linux/linux/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /data/labrador-linux/linux/include/linux/klist.h \
  /data/labrador-linux/linux/include/linux/pinctrl/devinfo.h \
    $(wildcard include/config/pm.h) \
  /data/labrador-linux/linux/include/linux/pinctrl/consumer.h \
  /data/labrador-linux/linux/include/linux/seq_file.h \
  /data/labrador-linux/linux/include/linux/fs.h \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
  /data/labrador-linux/linux/include/linux/wait_bit.h \
  /data/labrador-linux/linux/include/linux/kdev_t.h \
  /data/labrador-linux/linux/include/uapi/linux/kdev_t.h \
  /data/labrador-linux/linux/include/linux/dcache.h \
  /data/labrador-linux/linux/include/linux/rculist_bl.h \
  /data/labrador-linux/linux/include/linux/list_bl.h \
  /data/labrador-linux/linux/include/linux/bit_spinlock.h \
  /data/labrador-linux/linux/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /data/labrador-linux/linux/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /data/labrador-linux/linux/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /data/labrador-linux/linux/include/linux/path.h \
  /data/labrador-linux/linux/include/linux/list_lru.h \
  /data/labrador-linux/linux/include/linux/shrinker.h \
  /data/labrador-linux/linux/include/linux/mm_types.h \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/pgtable/levels.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/hmm.h) \
  /data/labrador-linux/linux/include/linux/auxvec.h \
  /data/labrador-linux/linux/include/uapi/linux/auxvec.h \
  /data/labrador-linux/linux/include/linux/uprobes.h \
  /data/labrador-linux/linux/arch/arm/include/asm/uprobes.h \
  /data/labrador-linux/linux/arch/arm/include/asm/probes.h \
  /data/labrador-linux/linux/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  /data/labrador-linux/linux/include/linux/capability.h \
  /data/labrador-linux/linux/include/uapi/linux/capability.h \
  /data/labrador-linux/linux/include/linux/semaphore.h \
  /data/labrador-linux/linux/include/linux/fcntl.h \
  /data/labrador-linux/linux/include/uapi/linux/fcntl.h \
  /data/labrador-linux/linux/arch/arm/include/uapi/asm/fcntl.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/fcntl.h \
  /data/labrador-linux/linux/include/uapi/linux/fiemap.h \
  /data/labrador-linux/linux/include/linux/migrate_mode.h \
  /data/labrador-linux/linux/include/linux/percpu-rwsem.h \
  /data/labrador-linux/linux/include/linux/rcuwait.h \
  /data/labrador-linux/linux/include/linux/rcu_sync.h \
  /data/labrador-linux/linux/include/linux/delayed_call.h \
  /data/labrador-linux/linux/include/linux/uuid.h \
  /data/labrador-linux/linux/include/uapi/linux/uuid.h \
  /data/labrador-linux/linux/include/linux/errseq.h \
  /data/labrador-linux/linux/include/uapi/linux/fs.h \
  /data/labrador-linux/linux/include/uapi/linux/limits.h \
  /data/labrador-linux/linux/include/uapi/linux/ioctl.h \
  arch/arm/include/generated/uapi/asm/ioctl.h \
  /data/labrador-linux/linux/include/asm-generic/ioctl.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/ioctl.h \
  /data/labrador-linux/linux/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /data/labrador-linux/linux/include/linux/percpu_counter.h \
  /data/labrador-linux/linux/include/uapi/linux/dqblk_xfs.h \
  /data/labrador-linux/linux/include/linux/dqblk_v1.h \
  /data/labrador-linux/linux/include/linux/dqblk_v2.h \
  /data/labrador-linux/linux/include/linux/dqblk_qtree.h \
  /data/labrador-linux/linux/include/linux/projid.h \
  /data/labrador-linux/linux/include/uapi/linux/quota.h \
  /data/labrador-linux/linux/include/linux/nfs_fs_i.h \
  /data/labrador-linux/linux/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/keys.h) \
  /data/labrador-linux/linux/include/linux/key.h \
  /data/labrador-linux/linux/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /data/labrador-linux/linux/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /data/labrador-linux/linux/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/net.h) \
  /data/labrador-linux/linux/include/linux/pinctrl/pinctrl-state.h \
  /data/labrador-linux/linux/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /data/labrador-linux/linux/include/linux/ratelimit.h \
  /data/labrador-linux/linux/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
    $(wildcard include/config/iommu/api.h) \
    $(wildcard include/config/arm/dma/use/iommu.h) \
    $(wildcard include/config/xen.h) \
    $(wildcard include/config/arch/omap.h) \
  /data/labrador-linux/linux/include/linux/pm_wakeup.h \
  /data/labrador-linux/linux/include/linux/mod_devicetable.h \
  /data/labrador-linux/linux/include/linux/ethtool.h \
  /data/labrador-linux/linux/include/linux/compat.h \
    $(wildcard include/config/compat/old/sigaction.h) \
    $(wildcard include/config/odd/rt/sigaction.h) \
  /data/labrador-linux/linux/include/uapi/linux/ethtool.h \
  /data/labrador-linux/linux/include/linux/if_ether.h \
  /data/labrador-linux/linux/include/linux/skbuff.h \
    $(wildcard include/config/nf/conntrack.h) \
    $(wildcard include/config/bridge/netfilter.h) \
    $(wildcard include/config/xfrm.h) \
    $(wildcard include/config/ipv6/ndisc/nodetype.h) \
    $(wildcard include/config/net/switchdev.h) \
    $(wildcard include/config/net/cls/act.h) \
    $(wildcard include/config/net/sched.h) \
    $(wildcard include/config/net/rx/busy/poll.h) \
    $(wildcard include/config/xps.h) \
    $(wildcard include/config/network/secmark.h) \
    $(wildcard include/config/network/phy/timestamping.h) \
    $(wildcard include/config/netfilter/xt/target/trace.h) \
    $(wildcard include/config/nf/tables.h) \
    $(wildcard include/config/ip/vs.h) \
  /data/labrador-linux/linux/include/linux/kmemcheck.h \
  /data/labrador-linux/linux/include/linux/socket.h \
  arch/arm/include/generated/uapi/asm/socket.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/socket.h \
  arch/arm/include/generated/uapi/asm/sockios.h \
  /data/labrador-linux/linux/include/uapi/asm-generic/sockios.h \
  /data/labrador-linux/linux/include/uapi/linux/sockios.h \
  /data/labrador-linux/linux/include/linux/uio.h \
    $(wildcard include/config/arch/has/uaccess/flushcache.h) \
  /data/labrador-linux/linux/include/uapi/linux/uio.h \
  /data/labrador-linux/linux/include/uapi/linux/socket.h \
  /data/labrador-linux/linux/include/linux/net.h \
  /data/labrador-linux/linux/include/linux/random.h \
    $(wildcard include/config/gcc/plugin/latent/entropy.h) \
    $(wildcard include/config/arch/random.h) \
  /data/labrador-linux/linux/include/linux/once.h \
  /data/labrador-linux/linux/include/uapi/linux/random.h \
  /data/labrador-linux/linux/include/uapi/linux/net.h \
  /data/labrador-linux/linux/include/linux/textsearch.h \
  /data/labrador-linux/linux/include/net/checksum.h \
  /data/labrador-linux/linux/include/linux/uaccess.h \
  /data/labrador-linux/linux/include/linux/kasan-checks.h \
  /data/labrador-linux/linux/arch/arm/include/asm/uaccess.h \
    $(wildcard include/config/cpu/sw/domain/pan.h) \
    $(wildcard include/config/cpu/use/domains.h) \
    $(wildcard include/config/uaccess/with/memcpy.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/cp15/mmu.h) \
  arch/arm/include/generated/asm/extable.h \
  /data/labrador-linux/linux/include/asm-generic/extable.h \
  /data/labrador-linux/linux/arch/arm/include/asm/checksum.h \
  /data/labrador-linux/linux/include/linux/in6.h \
  /data/labrador-linux/linux/include/uapi/linux/in6.h \
  /data/labrador-linux/linux/include/uapi/linux/libc-compat.h \
    $(wildcard include/config/data.h) \
  /data/labrador-linux/linux/include/linux/dma-mapping.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/arch/has/dma/set/coherent/mask.h) \
    $(wildcard include/config/need/dma/map/state.h) \
    $(wildcard include/config/dma/api/debug.h) \
  /data/labrador-linux/linux/include/linux/dma-debug.h \
  /data/labrador-linux/linux/include/linux/dma-direction.h \
  /data/labrador-linux/linux/include/linux/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/need/sg/dma/length.h) \
    $(wildcard include/config/arch/has/sg/chain.h) \
    $(wildcard include/config/sg/pool.h) \
  /data/labrador-linux/linux/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/x86/intel/memory/protection/keys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/metag.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/device/public.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /data/labrador-linux/linux/include/linux/range.h \
  /data/labrador-linux/linux/include/linux/percpu-refcount.h \
  /data/labrador-linux/linux/include/linux/page_ext.h \
    $(wildcard include/config/idle/page/tracking.h) \
  /data/labrador-linux/linux/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/user/stacktrace/support.h) \
  /data/labrador-linux/linux/include/linux/stackdepot.h \
  /data/labrador-linux/linux/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /data/labrador-linux/linux/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /data/labrador-linux/linux/include/linux/tracepoint-defs.h \
  /data/labrador-linux/linux/include/linux/memremap.h \
  /data/labrador-linux/linux/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/proc-fns.h \
  /data/labrador-linux/linux/arch/arm/include/asm/glue-proc.h \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6k.h) \
    $(wildcard include/config/cpu/pj4b.h) \
    $(wildcard include/config/cpu/v7.h) \
  /data/labrador-linux/linux/include/asm-generic/pgtable-nopud.h \
  /data/labrador-linux/linux/include/asm-generic/pgtable-nop4d-hack.h \
  /data/labrador-linux/linux/include/asm-generic/5level-fixup.h \
  /data/labrador-linux/linux/arch/arm/include/asm/pgtable-hwdef.h \
  /data/labrador-linux/linux/arch/arm/include/asm/pgtable-2level-hwdef.h \
  /data/labrador-linux/linux/arch/arm/include/asm/tlbflush.h \
    $(wildcard include/config/smp/on/up.h) \
    $(wildcard include/config/cpu/tlb/v4wt.h) \
    $(wildcard include/config/cpu/tlb/fa.h) \
    $(wildcard include/config/cpu/tlb/v4wbi.h) \
    $(wildcard include/config/cpu/tlb/feroceon.h) \
    $(wildcard include/config/cpu/tlb/v4wb.h) \
    $(wildcard include/config/cpu/tlb/v6.h) \
    $(wildcard include/config/cpu/tlb/v7.h) \
    $(wildcard include/config/arm/errata/720789.h) \
    $(wildcard include/config/arm/errata/798181.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/pgtable-2level.h \
  /data/labrador-linux/linux/include/asm-generic/pgtable.h \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /data/labrador-linux/linux/include/linux/huge_mm.h \
  /data/labrador-linux/linux/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /data/labrador-linux/linux/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /data/labrador-linux/linux/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/io.h \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  /data/labrador-linux/linux/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /data/labrador-linux/linux/include/xen/xen.h \
    $(wildcard include/config/xen/pvh.h) \
    $(wildcard include/config/xen/dom0.h) \
  /data/labrador-linux/linux/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /data/labrador-linux/linux/include/linux/mem_encrypt.h \
    $(wildcard include/config/arch/has/mem/encrypt.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/dma-mapping.h \
  /data/labrador-linux/linux/arch/arm/include/asm/xen/hypervisor.h \
  /data/labrador-linux/linux/include/xen/arm/hypervisor.h \
  /data/labrador-linux/linux/include/linux/netdev_features.h \
  /data/labrador-linux/linux/include/linux/sched/clock.h \
    $(wildcard include/config/have/unstable/sched/clock.h) \
  /data/labrador-linux/linux/include/net/flow_dissector.h \
  /data/labrador-linux/linux/include/uapi/linux/if_ether.h \
  /data/labrador-linux/linux/include/linux/splice.h \
  /data/labrador-linux/linux/include/linux/pipe_fs_i.h \
  /data/labrador-linux/linux/include/uapi/linux/if_packet.h \
  /data/labrador-linux/linux/include/net/flow.h \
  /data/labrador-linux/linux/include/linux/mii.h \
  /data/labrador-linux/linux/include/uapi/linux/if.h \
  /data/labrador-linux/linux/include/uapi/linux/hdlc/ioctl.h \
  /data/labrador-linux/linux/include/uapi/linux/mii.h \
  /data/labrador-linux/linux/include/linux/clk.h \
    $(wildcard include/config/common/clk.h) \
    $(wildcard include/config/have/clk/prepare.h) \
    $(wildcard include/config/have/clk.h) \
  /data/labrador-linux/linux/include/linux/netdevice.h \
    $(wildcard include/config/dcb.h) \
    $(wildcard include/config/hyperv/net.h) \
    $(wildcard include/config/wlan.h) \
    $(wildcard include/config/ax25.h) \
    $(wildcard include/config/mac80211/mesh.h) \
    $(wildcard include/config/net/ipip.h) \
    $(wildcard include/config/net/ipgre.h) \
    $(wildcard include/config/ipv6/sit.h) \
    $(wildcard include/config/ipv6/tunnel.h) \
    $(wildcard include/config/rps.h) \
    $(wildcard include/config/netpoll.h) \
    $(wildcard include/config/bql.h) \
    $(wildcard include/config/rfs/accel.h) \
    $(wildcard include/config/fcoe.h) \
    $(wildcard include/config/xfrm/offload.h) \
    $(wildcard include/config/net/poll/controller.h) \
    $(wildcard include/config/libfcoe.h) \
    $(wildcard include/config/wireless/ext.h) \
    $(wildcard include/config/net/l3/master/dev.h) \
    $(wildcard include/config/ipv6.h) \
    $(wildcard include/config/vlan/8021q.h) \
    $(wildcard include/config/net/dsa.h) \
    $(wildcard include/config/tipc.h) \
    $(wildcard include/config/mpls/routing.h) \
    $(wildcard include/config/netfilter/ingress.h) \
    $(wildcard include/config/garp.h) \
    $(wildcard include/config/mrp.h) \
    $(wildcard include/config/cgroup/net/prio.h) \
    $(wildcard include/config/net/flow/limit.h) \
  /data/labrador-linux/linux/include/linux/dynamic_queue_limits.h \
  /data/labrador-linux/linux/include/net/net_namespace.h \
    $(wildcard include/config/ieee802154/6lowpan.h) \
    $(wildcard include/config/ip/sctp.h) \
    $(wildcard include/config/ip/dccp.h) \
    $(wildcard include/config/netfilter.h) \
    $(wildcard include/config/nf/defrag/ipv6.h) \
    $(wildcard include/config/netfilter/netlink/acct.h) \
    $(wildcard include/config/nf/ct/netlink/timeout.h) \
    $(wildcard include/config/wext/core.h) \
    $(wildcard include/config/mpls.h) \
    $(wildcard include/config/can.h) \
    $(wildcard include/config/net/ns.h) \
  /data/labrador-linux/linux/include/net/netns/core.h \
  /data/labrador-linux/linux/include/net/netns/mib.h \
    $(wildcard include/config/xfrm/statistics.h) \
  /data/labrador-linux/linux/include/net/snmp.h \
  /data/labrador-linux/linux/include/uapi/linux/snmp.h \
  /data/labrador-linux/linux/include/linux/u64_stats_sync.h \
  /data/labrador-linux/linux/include/net/netns/unix.h \
  /data/labrador-linux/linux/include/net/netns/packet.h \
  /data/labrador-linux/linux/include/net/netns/ipv4.h \
    $(wildcard include/config/ip/multiple/tables.h) \
    $(wildcard include/config/ip/route/classid.h) \
    $(wildcard include/config/ip/mroute.h) \
    $(wildcard include/config/ip/mroute/multiple/tables.h) \
    $(wildcard include/config/ip/route/multipath.h) \
  /data/labrador-linux/linux/include/net/inet_frag.h \
  /data/labrador-linux/linux/include/net/netns/ipv6.h \
    $(wildcard include/config/ipv6/multiple/tables.h) \
    $(wildcard include/config/ipv6/mroute.h) \
    $(wildcard include/config/ipv6/mroute/multiple/tables.h) \
  /data/labrador-linux/linux/include/net/dst_ops.h \
  /data/labrador-linux/linux/include/net/netns/ieee802154_6lowpan.h \
  /data/labrador-linux/linux/include/net/netns/sctp.h \
  /data/labrador-linux/linux/include/net/netns/dccp.h \
  /data/labrador-linux/linux/include/net/netns/netfilter.h \
    $(wildcard include/config/nf/defrag/ipv4.h) \
  /data/labrador-linux/linux/include/linux/netfilter_defs.h \
  /data/labrador-linux/linux/include/uapi/linux/netfilter.h \
  /data/labrador-linux/linux/include/linux/in.h \
  /data/labrador-linux/linux/include/uapi/linux/in.h \
  /data/labrador-linux/linux/include/net/netns/x_tables.h \
    $(wildcard include/config/bridge/nf/ebtables.h) \
  /data/labrador-linux/linux/include/net/netns/conntrack.h \
    $(wildcard include/config/nf/ct/proto/dccp.h) \
    $(wildcard include/config/nf/ct/proto/sctp.h) \
    $(wildcard include/config/nf/conntrack/events.h) \
    $(wildcard include/config/nf/conntrack/labels.h) \
  /data/labrador-linux/linux/include/linux/netfilter/nf_conntrack_tcp.h \
  /data/labrador-linux/linux/include/uapi/linux/netfilter/nf_conntrack_tcp.h \
  /data/labrador-linux/linux/include/net/netns/nftables.h \
  /data/labrador-linux/linux/include/net/netns/xfrm.h \
  /data/labrador-linux/linux/include/uapi/linux/xfrm.h \
  /data/labrador-linux/linux/include/net/netns/mpls.h \
  /data/labrador-linux/linux/include/net/netns/can.h \
  /data/labrador-linux/linux/include/linux/ns_common.h \
  /data/labrador-linux/linux/include/linux/seq_file_net.h \
  /data/labrador-linux/linux/include/net/netprio_cgroup.h \
  /data/labrador-linux/linux/include/linux/cgroup.h \
    $(wildcard include/config/sock/cgroup/data.h) \
    $(wildcard include/config/cgroup/net/classid.h) \
    $(wildcard include/config/cgroup/data.h) \
  /data/labrador-linux/linux/include/uapi/linux/cgroupstats.h \
  /data/labrador-linux/linux/include/uapi/linux/taskstats.h \
  /data/labrador-linux/linux/include/linux/nsproxy.h \
  /data/labrador-linux/linux/include/linux/user_namespace.h \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/persistent/keyrings.h) \
  /data/labrador-linux/linux/include/linux/cgroup-defs.h \
  /data/labrador-linux/linux/include/linux/bpf-cgroup.h \
    $(wildcard include/config/cgroup/bpf.h) \
  /data/labrador-linux/linux/include/uapi/linux/bpf.h \
    $(wildcard include/config/efficient/unaligned/access.h) \
  /data/labrador-linux/linux/include/uapi/linux/bpf_common.h \
  /data/labrador-linux/linux/include/linux/cgroup_subsys.h \
    $(wildcard include/config/cgroup/cpuacct.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/cgroup/device.h) \
    $(wildcard include/config/cgroup/freezer.h) \
    $(wildcard include/config/cgroup/perf.h) \
    $(wildcard include/config/cgroup/hugetlb.h) \
    $(wildcard include/config/cgroup/pids.h) \
    $(wildcard include/config/cgroup/rdma.h) \
    $(wildcard include/config/cgroup/debug.h) \
  /data/labrador-linux/linux/include/uapi/linux/neighbour.h \
  /data/labrador-linux/linux/include/linux/netlink.h \
  /data/labrador-linux/linux/include/net/scm.h \
    $(wildcard include/config/security/network.h) \
  /data/labrador-linux/linux/include/linux/security.h \
    $(wildcard include/config/security/infiniband.h) \
    $(wildcard include/config/security/network/xfrm.h) \
    $(wildcard include/config/security/path.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/securityfs.h) \
    $(wildcard include/config/allow/lockdown/lift.h) \
  /data/labrador-linux/linux/include/uapi/linux/netlink.h \
  /data/labrador-linux/linux/include/uapi/linux/netdevice.h \
  /data/labrador-linux/linux/include/linux/if_link.h \
  /data/labrador-linux/linux/include/uapi/linux/if_link.h \
    $(wildcard include/config/pending.h) \
  /data/labrador-linux/linux/include/uapi/linux/if_bonding.h \
  /data/labrador-linux/linux/include/uapi/linux/pkt_cls.h \
    $(wildcard include/config/net/cls/ind.h) \
  /data/labrador-linux/linux/include/uapi/linux/pkt_sched.h \
  /data/labrador-linux/linux/include/linux/hashtable.h \
  /data/labrador-linux/linux/include/linux/etherdevice.h \
    $(wildcard include/config/have/efficient/unaligned/access.h) \
  /data/labrador-linux/linux/arch/arm/include/asm/unaligned.h \
  /data/labrador-linux/linux/include/linux/unaligned/le_struct.h \
  /data/labrador-linux/linux/include/linux/unaligned/be_byteshift.h \
  /data/labrador-linux/linux/include/linux/unaligned/generic.h \
  /data/labrador-linux/linux/include/linux/phy.h \
    $(wildcard include/config/led/trigger/phy.h) \
    $(wildcard include/config/phylib.h) \
    $(wildcard include/config/mdio/device.h) \
  /data/labrador-linux/linux/include/linux/mdio.h \
  /data/labrador-linux/linux/include/uapi/linux/mdio.h \
  /data/labrador-linux/linux/include/linux/of.h \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/attach/node.h) \
    $(wildcard include/config/detach/node.h) \
    $(wildcard include/config/add/property.h) \
    $(wildcard include/config/remove/property.h) \
    $(wildcard include/config/update/property.h) \
    $(wildcard include/config/of/numa.h) \
    $(wildcard include/config/no/change.h) \
    $(wildcard include/config/change/add.h) \
    $(wildcard include/config/change/remove.h) \
    $(wildcard include/config/of/resolve.h) \
    $(wildcard include/config/of/overlay.h) \
  /data/labrador-linux/linux/include/linux/property.h \
  /data/labrador-linux/linux/include/linux/fwnode.h \
  /data/labrador-linux/linux/include/linux/of_net.h \
    $(wildcard include/config/of/net.h) \

/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.o: $(deps_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.o)

$(deps_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.o):

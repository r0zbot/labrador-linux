cmd_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.o := arm-linux-gnueabihf-gcc -Wp,-MD,/data/labrador-linux/linux/drivers/net/ethernet/caninos/.labrador_eth.mod.o.d  -nostdinc -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/8/include -I/data/labrador-linux/linux/arch/arm/include -I./arch/arm/include/generated  -I/data/labrador-linux/linux/include -I./include -I/data/labrador-linux/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/data/labrador-linux/linux/include/uapi -I./include/generated/uapi -include /data/labrador-linux/linux/include/linux/kconfig.h  -I/data/labrador-linux/linux/drivers/net/ethernet/caninos -I/data/labrador-linux/linux/drivers/net/ethernet/caninos -D__KERNEL__ -mlittle-endian  -I/data/labrador-linux/linux/arch/arm/mach-caninos/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflow -Wno-int-in-bool-context -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fstack-protector -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -pg -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init  -DKBUILD_BASENAME='"labrador_eth.mod"'  -DKBUILD_MODNAME='"labrador_eth"' -DMODULE  -c -o /data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.o /data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.c

source_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.o := /data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.c

deps_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.o := \
    $(wildcard include/config/module/unload.h) \
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
  /data/labrador-linux/linux/include/linux/vermagic.h \
  include/generated/utsrelease.h \

/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.o: $(deps_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.o)

$(deps_/data/labrador-linux/linux/drivers/net/ethernet/caninos/labrador_eth.mod.o):

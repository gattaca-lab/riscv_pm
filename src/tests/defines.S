#ifndef D_RISCV_MTE_TESTS_INCLUDE_GUARD
#define D_RISCV_MTE_TESTS_INCLUDE_GUARD

#define CSR_BIT_POS_MPM_ENABLE  6
#define CSR_BIT_POS_MPM_CURRENT 7

#define CSR_BIT_POS_UPM_CURRENT 1
#define CSR_BIT_POS_UPM_ENABLE  0

#define CSR_MMTE 0x7c0
#define CSR_UMTE 0x8c0
#define CSR_UPMBASE 0x8c2

#define CSR_MAGIC 0x8c3
#define IMM_PASSED 0
#define IMM_FAILED 1

.ifdef TEST_PASSED
   .purgem TEST_PASSED
.endif
.macro TEST_PASSED
    li a0, IMM_PASSED
    csrw CSR_MAGIC, a0
.endm

.ifdef TEST_FAILED
   .purgem TEST_FAILED
.endif
.macro TEST_FAILED
    li a0, IMM_FAILED
    csrw CSR_MAGIC, a0
.endm

#endif // D_RISCV_MTE_TESTS_INCLUDE_GUARD

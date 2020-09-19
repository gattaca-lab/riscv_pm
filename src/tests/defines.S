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
#define IMM_PASSED 48
#define IMM_FAILED 49
#define IMM_EXIT   113

#define UART_BASE_ADDR 0x10000000

.ifdef TEST_PASSED
   .purgem TEST_PASSED
.endif
.macro TEST_PASSED
    li a7, UART_BASE_ADDR
    li a0, IMM_PASSED
    sb a0, 0(a7)
    li a0, IMM_EXIT
    sb a0, 0(a7)
.endm

.ifdef TEST_FAILED
   .purgem TEST_FAILED
.endif
.macro TEST_FAILED
    li a7, UART_BASE_ADDR
    li a0, IMM_FAILED
    sb a0, 0(a7)
    li a0, IMM_EXIT
    sb a0, 0(a7)
.endm

#endif // D_RISCV_MTE_TESTS_INCLUDE_GUARD

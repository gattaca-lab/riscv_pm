#include "defines.S"
#include "boot.S"

.global main

.text
.balign 8
main:
    /* set UPM.Enable=1 and UPM.Current=1 in mmte */
    li a0, ((1 << CSR_BIT_POS_UPM_ENABLE) | (1 << CSR_BIT_POS_UPM_CURRENT))
    csrw CSR_MMTE, a0
    /* prepare to switch to u-mode */
    la a4, umode
    csrw mepc, a4
    /* switch to umode */
    mret

umode:
    /* read umte */
    csrr a2, CSR_UMTE
    /* compare read value and the one written */
    bne a0, a2, exit_fail

exit_success:
    TEST_PASSED

exit_fail:
    TEST_FAILED

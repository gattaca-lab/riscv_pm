#include "defines.S"
#include "boot.S"

.global main

.text
.balign 8
main:
    /* set MPM.Enable=1 and MPM.Current=0 in mmte */
    li a0, ((1 << CSR_BIT_POS_MPM_ENABLE) | (0 << CSR_BIT_POS_MPM_CURRENT))
    csrw CSR_MMTE, a0
    /* read mmte value back*/
    csrr a1, CSR_MMTE
    /* if values are different, fail*/
    bne a1, a0, exit_fail

exit_success:
    TEST_PASSED

exit_fail:
    TEST_FAILED

#include "defines.S"
#include "boot.S"

.global main

.text
.balign 8
main:
    /* write 0 to mmte */
    li a0, 0xff
    csrw CSR_MMTE, a0
    /* prepare to switch to u-mode */
    la a4, umode
    csrw mepc, a4
    /* switch to umode */
    mret

umode:
    /* write something to upmbase */
    li a1, 0x12345678
    csrw CSR_UPMBASE, a1
    /* read upmbase */
    csrr a2, CSR_UPMBASE
    /* compare read value and the one written */
    bne a1, a2, exit_fail


exit_success:
    TEST_PASSED

exit_fail:
    TEST_FAILED

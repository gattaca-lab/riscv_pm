.global main

.text
.balign 8
main:
    /* set UPM.Enable=1 and UPM.Current=1 in mmte */
    li a0, 0x2
    csrw 0x7c0, a0
    /* prepare to switch to u-mode */
    la a4, umode
    csrw mepc, a4
    /* switch to umode */
    mret

umode:
    /* read umte */
    csrr a2, 0x8c0
    /* compare read value and the one written */
    bne a0, a2, exit_fail

exit_success:
    li a0, 0
    csrw 0x8c3, a0

exit_fail:
    li a0, 1
    csrw 0x8c3, a0

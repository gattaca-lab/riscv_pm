.global main

.text
.balign 8
main:
    /* write 0 to mmte */
    li a0, 0xff
    csrw 0x7c0, a0
    /* prepare to switch to u-mode */
    la a4, umode
    csrw mepc, a4
    /* switch to umode */
    mret

umode:
    /* write something to upmbase */
    li a1, 0x12345678
    csrw 0x8c2, a1
    /* read upmbase */
    csrr a2, 0x8c2
    /* compare read value and the one written */
    bne a1, a2, exit_fail


exit_success:
    li a0, 0
    csrw 0x8c3, a0

exit_fail:
    li a0, 0
    csrw 0x8c3, a0

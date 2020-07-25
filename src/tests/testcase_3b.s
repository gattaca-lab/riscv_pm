.global main

.text
.balign 8
main:
    /* set MPM.Enable=1 and MPM.Current=0 in mmte */
    li a0, 0x40
    csrw 0x7c0, a0
    /* read mmte value back*/
    csrr a1, 0x7c0
    /* if values are different, fail*/
    bne a1, a0, exit_fail

exit_success:
    li a0, 0
    csrw 0x8c3, a0

exit_fail:
    li a0, 1
    csrw 0x8c3, a0

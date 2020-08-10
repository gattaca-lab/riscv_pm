#include <stdio.h>
#include <inttypes.h>
#include <assert.h>
#include <stdlib.h>

#define ENABLE  0x1
#define CURRENT 0x2
#define UMTE    0x8c0
#define UPMMASK 0x8c1
#define UPMBASE  0x8c2
#define STR(x) #x
#define __ASM_STR(s) STR(s)

#define csr_read(csr)                                           \
({                                                              \
        register unsigned long __v;                             \
        __asm__ __volatile__ ("csrr %0, " __ASM_STR(csr)        \
                              : "=r" (__v) :                    \
                              : "memory");                      \
        __v;                                                    \
})

#define csr_write(csr, val)                                     \
({                                                              \
        unsigned long __v = (unsigned long)(val);               \
        __asm__ __volatile__ ("csrw " __ASM_STR(csr) ", %0"     \
                              : : "rK" (__v)                    \
                              : "memory");                      \
})


uint64_t getMask()
{
    csr_read(UPMMASK);
}

void setMask(uint64_t mask)
{
    csr_write(UPMMASK, mask);
}

uint64_t getBase()
{
    csr_read(UPMBASE);
}

void setBase(uint64_t base)
{
    csr_write(UPMBASE, base);
}

uint64_t getUMTE()
{
   csr_read(UMTE);
}

void setUMTE(uint64_t umte)
{
    csr_write(UMTE, umte);
}


int main()
{
    // check umte.current is set
    uint64_t umte = getUMTE();
    fprintf(stderr, "Reading UMTE 0x%lx\n", umte);
    assert(umte & CURRENT);
    // set mask
    uint64_t mask = 0xFFULL << 50ULL;
    setMask(mask);
    uint64_t rmask = getMask();
    fprintf(stderr, "Reading mask 0x%lx\n", rmask);
    assert(mask == rmask);
    // allocate something
    char* a = (char*)malloc(100);
    a[5] = 10;
    // corrupt address
    char* b = (char*)((uint64_t)a | mask);
    // enable pm
    umte |= ENABLE;
    setUMTE(umte);
    // access address
    char ra = a[5];
    char rb = b[5];
    fprintf(stderr, "Reading corrupted address 0x%lx:%x\n", b, rb);
    assert(ra == rb);
    // disable pm
    umte &= ~ENABLE;
    setUMTE(umte);
    // access address
    char rb2 = b[5];
    fprintf(stderr, "Should not see this: Reading corrupted address 0x%lx:%x\n", b, rb2);
}

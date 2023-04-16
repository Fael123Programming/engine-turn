#define __SFR_OFFSET 0

#include "avr/io.h"

.global cycle
.global configure

configure:
    SBI DDRB, 0  
    SBI DDRB, 1
    CBI DDRB, 4
    CBI DDRD, 7
    SBI PORTB, 4
    SBI PORTD, 7
    RET

cycle:
    main:
        SBIS PINB, 4
        RJMP zeroOne
        SBIS PIND, 7
        RJMP oneZero
        RJMP main
    zeroOne:
        SBI PORTB, 0
        CBI PORTB, 1
        SBI PORTB, 5 
        RJMP main
    oneZero:
        CBI PORTB, 0
        SBI PORTB, 1
        CBI PORTB, 5
        RJMP main
    RET
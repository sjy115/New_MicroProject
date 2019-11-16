#include p18f87k22.inc

    extern LCD_Initialisation, Keypad_Setup, Music_Setup, Play

#define	RST		0
#define	MOSI		4
;#define	MISO		5
#define	SCK		6
#define CS		7
    
Run    code	0
    
Setup
    ;set pins
    clrf    LATD
    bsf	    LATD, CS
    bsf	    LATD, MOSI
    bsf	    LATD, SCK
    clrf    TRISD
    bsf	    TRISD, MISO
    
    ;setup table
    bcf	    EECON1, CFGS
    bsf	    EECON1, EEPGD
    
    ;initialise
    call    LCD_Initialisation
    call    Keypad_Setup
    call    Music_Setup
    
    ;Play Avengers
    call    Play_Avengers
    
    end






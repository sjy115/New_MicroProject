#include p18f87k22.inc
    ;Setup
    extern LCD_Initialisation, Keypad_Setup, Music_Setup
    ;Main
    extern Main_Initialise
    ;GameData
    extern Play_Avengers
    
Run    code	0
    
Setup
    ;setup program memory table
    bcf	    EECON1, CFGS
    bsf	    EECON1, EEPGD
    
    ;initialise
    call    Main_Initialise
    call    LCD_Initialisation
    call    Keypad_Setup
    call    Music_Setup
    
Main
    ;Play Avengers
    call    Play_Avengers
    goto    $
    end






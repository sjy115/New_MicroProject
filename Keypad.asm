    #include p18f87k22.inc
    
    global Keypad_Setup, Keypad_getKey
    ;Global variables from Keypad.asm
    extern Delay_x4us
    
    
acs0    udata_acs   ; reserve data space in access ram
    
Keypad_output res 1	    ; reserve 1 byte for button presed on keypad
	
Keypad  code
	
Keypad_Setup
    banksel	PADCFG1
    bsf		PADCFG1,REPU,BANKED
    return
	
	
Keypad_getKey
    ;get col input
    clrf    LATE
    movlw   0x0F
    movwf   TRISE
    movlw   .1
    call    Delay_x4us
    
    ;columns
    movlw   0x0F
    andwf   PORTE, W
    movwf   Keypad_output
    
    ;get row input
    clrf    LATE
    movlw   0xF0
    movwf   TRISE
    movlw   .1
    call    Delay_x4us
    
    ;row
    movlw   0xF0
    andwf   PORTE, W
    iorwf   Keypad_output, W
    comf    WREG, W
    return
    end


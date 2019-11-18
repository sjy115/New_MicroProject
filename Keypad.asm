    #include p18f87k22.inc
    
    
    global Keypad_Setup, Keypad_getKey, Keypad_output,input_cmd,input_data
    extern Delay_ms

#define	RST		0
#define	MOSI		4
#define	MISO		5
#define	SCK		6
#define CS		7
acs_keypad    udata_acs   ; reserve data space in access ram
Keypad_output res 1
input_cmd	    res 1
input_data	    res 1
	
Keypad  code
	
Keypad_Setup
    banksel	PADCFG1
    bsf		PADCFG1,REPU,BANKED
    return
	
	
Keypad_getKey
    setf    Keypad_output
    ;get row input
    clrf    LATE
    movlw   0x0F
    movwf   TRISE
    movlw   .100
    call    Delay_ms
    
    ;row0
    movlw   b'1110'
    cpfseq  PORTE
    bcf     Keypad_output, 0
    ;row1    
    movlw   b'1101'
    cpfseq  PORTE
    bcf	    Keypad_output, 1
    ;row2      
    movlw   b'1011'
    cpfseq  PORTE
    bcf     Keypad_output, 2
    ;row3
    movlw   b'0111'
    cpfseq  PORTE
    bcf	    Keypad_output, 3
    
    ;get column input
    clrf    LATE
    movlw   0xF0
    movwf   TRISE
    movlw   .100
    call    Delay_ms
    
    ;column0
    movlw   b'11100000'
    cpfseq  PORTE
    bcf     Keypad_output, 4
    ;column1
    movlw   b'11010000'
    cpfseq  PORTE
    bcf     Keypad_output, 5
    ;column2
    movlw   b'10110000'
    cpfseq  PORTE
    bcf     Keypad_output, 6
    ;column3
    movlw   b'01110000'
    cpfseq  PORTE
    bcf     Keypad_output, 7
    return
    end


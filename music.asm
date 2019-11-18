#include p18f87k22.inc

    global  Music_Setup, Music_Avengers
    extern  Delay_ms
    
#define	music_RST   5
    
Music    code
    
Music_Avengers
    movlw   '#'
    call    UART_Transmit_Byte
    movlw   '0'
    call    UART_Transmit_Byte
    movlw   '0'
    call    UART_Transmit_Byte
    movlw   '\n'
    call    UART_Transmit_Byte
    return
    
Music_Setup
    bsf	    RCSTA1, SPEN    ; enable
    ;bsf	    RCSTA1, CREN    ; enable
    ;bcf	    RCSTA1, RX9	    ; 8-bit reception
    bcf	    TXSTA1, SYNC    ; asynchronous
    bcf	    TXSTA1, BRGH    ; slow speed
    bsf	    TXSTA1, TXEN    ; enable transmit
    bcf	    BAUDCON1, BRG16 ; 8-bit generator only
    movlw   .103	    ; gives 9600 Baud rate (actually 9615)
    movwf   SPBRG1
    bsf	    TRISC, TX1	    ; TX1 pin as output
    
    bcf	    LATC, music_RST
    bcf	    TRISC, music_RST
    movlw   .250
    call    Delay_ms
    bsf	    LATC, music_RST
    movlw   .250
    call    Delay_ms
    return

UART_Transmit_Byte	    ; Transmits byte stored in W
    btfss   PIR1,TX1IF	    ; TX1IF is set when TXREG1 is empty
    bra	    UART_Transmit_Byte
    movwf   TXREG1
    return
    end
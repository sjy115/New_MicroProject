#include p18f87k22.inc
    
    global  LCD_Initialisation, Scroll, Scroll_d_l, Scroll_d_h
    global  LCD_RectHelper, rect_x1_l, rect_x1_h, rect_y1_l, rect_y1_h, rect_x2_l, rect_x2_h,rect_y2_l, rect_y2_h, rect_colour
    extern  Delay_ms, Keypad_getKey, Keypad_output, Box_test, Decrement_dy

;Data sheet definition (register array, pin, constant)

; Command/Data pins for SPI
#define RA8875_DATAWRITE        0x00
#define RA8875_CMDWRITE         0x80

; Registers & bits
#define RA8875_PWRR             0x01
#define RA8875_PWRR_DISPON      0x80
#define RA8875_PWRR_NORMAL      0x00

#define RA8875_GPIOX            0xC7

#define RA8875_PLLC1            0x88
#define RA8875_PLLC1_PLLDIV1    0x00

#define RA8875_PLLC2            0x89
#define RA8875_PLLC2_DIV4       0x02
#define RA8875_SYSR             0x10
#define RA8875_SYSR_16BPP       0x0C
#define RA8875_SYSR_MCU8        0x00


#define RA8875_HNDFTR           0x15
#define RA8875_HNDFTR_DE_HIGH   0x00

#define RA8875_HNDR             0x16
#define RA8875_HSTR             0x17
#define RA8875_HPWR             0x18

#define RA8875_VDHR0            0x19
#define RA8875_VDHR1            0x1A
#define RA8875_VNDR0            0x1B
#define RA8875_VNDR1            0x1C
#define RA8875_VSTR0            0x1D
#define RA8875_VSTR1            0x1E
#define RA8875_VPWR             0x1F

#define RA8875_HSAW0            0x30
#define RA8875_HSAW1            0x31
#define RA8875_VSAW0            0x32
#define RA8875_VSAW1            0x33

#define RA8875_HEAW0            0x34
#define RA8875_HEAW1            0x35
#define RA8875_VEAW0            0x36
#define RA8875_VEAW1            0x37

#define RA8875_MCLR             0x8E

#define RA8875_ELLIPSE                0xA0

#define RA8875_MWCR0            0x40

#define RA8875_MWCR1            0x40
    

;PWM1 Control register
#define RA8875_P1CR             0x8A
#define RA8875_P1CR_ENABLE      0x80

#define RA8875_P1DCR            0x8B


;Scroll window registers
#define	RA8875_HSSW0		0x38	    ;Horizontal start point 0 of scroll window register
#define	RA8875_HSSW1		0x39	    ;Horizontal start point 1 of scroll window register
#define	RA8875_VSSW0		0x3A	    ;Vertical start point 0 of scroll window register
#define	RA8875_VSSW1		0x3B	    ;Vertical start point 1 of scroll window register
#define	RA8875_HESW0		0x3C	    ;Horizontal end point 0 of scroll window register
#define	RA8875_HESW1		0x3D	    ;Horizontal end point 1 of scroll window register
#define	RA8875_VESW0		0x3E	    ;Vertical end point 0 of scroll window register
#define	RA8875_VESW1		0x3F	    ;Vertical end point 1 of scroll window register
#define	RA8875_LTPR0		0x52	    ;Layer transparency 0 register
#define	RA8875_DPCR		0x20	    ;Display configuration register

;command data
#define RA8875_SCROLL_BUFFER    0xC0
#define RA8875_PWM_CLK_DIV1024  0x0A
    
;pre-defined constants
#define	LCD_width		800
#define	LCD_height		480
#define pixclk			(RA8875_PCSR_PDATL | RA8875_PCSR_2CLK)


    
#define	scroll_yend_l		.144
#define	scroll_yend_h		.1
#define	scroll_speed		.2
#define	LYEN			0	;Control bit location, layer enable

#define	RST		0
#define	MOSI		4
;#define	MISO		5
#define	SCK		6
#define CS		7
    
acs0    udata_acs   ; reserve data space in access ram
input_cmd	    res 1
input_data	    res 1
	    
Scroll_d_l	    res 1
Scroll_d_h	    res 1
	    
Control		    res 1
		    
;global parameters for LCD_RectHelper
rect_x1_h	    res 1
rect_y1_h	    res 1
rect_x2_h	    res 1
rect_y2_h	    res 1
rect_x1_l	    res 1
rect_y1_l	    res 1
rect_x2_l	    res 1
rect_y2_l	    res 1
rect_colour	    res 1	
    
LCD code


;Scroll next layer
Scroll
    movlw   scroll_yend_l
    movwf   Scroll_d_l
    movlw   scroll_yend_h
    movwf   Scroll_d_h
    movlw   0x00		; W=0	
scrl
    call    LCD_ScrollY
    call    Decrement_dy
    call    Box_test
    movlw   scroll_speed
    call    Delay_ms
    movlw   .125
    movwf   Delay_x4us_cnt_l
    movlw   .0
    movwf   Delay_x4us_cnt_h
    call    Delay_x4us		; delay for total of 2.5ms for every pixel
    decf    Scroll_d_l, F	; borrow when 0x00 -> 0xff
    subwfb  Scroll_d_h, F	; no carry when 0x00 -> 0xff
    bc	    scrl
    
    btg	    Control, LYEN
    btfss   Control, LYEN
    bra	    ly1
    call    LYEN2
cly call    Clear_Layer
    return

;temporary subroutine
ly1 call    LYEN1
    bra	    cly

Clear_Layer
    movlw   .0
    movwf   rect_x1_l
    movlw   .0
    movwf   rect_x1_h
    movlw   .0
    movwf   rect_y1_l
    movlw   .0
    movwf   rect_y1_h
    movlw   .31
    movwf   rect_x2_l
    movlw   .3
    movwf   rect_x2_h
    movlw   scroll_yend_l
    movwf   rect_y2_l
    movlw   scroll_yend_h
    movwf   rect_y2_h
    clrf    rect_colour
    call    LCD_RectHelper
    movlw   .5
    call    Delay_ms
    return

    
LCD_ScrollY  
    movlw   0x26
    movwf   input_cmd
    movff   Scroll_d_l, input_data
    btfsc   Control, LYEN
    call    scrl1
    call    SPI_writeREG
    movlw   0x27
    movwf   input_cmd
    movff   Scroll_d_h, input_data
    btfsc   Control, LYEN
    call    scrl2
    call    SPI_writeREG
    return
    
scrl1
    movlw   scroll_yend_l
    addwf   Scroll_d_l, W
    movwf   input_data
    return
    
scrl2
    movlw   scroll_yend_h
    addwfc  Scroll_d_h, W
    movwf   input_data
    return

    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;write to register funcitons
LCD_RectHelper
    ;/* Set X1 */
    movlw   0x91
    movwf   input_cmd
    movff   rect_x1_l, input_data
    call    SPI_writeREG
    movlw   0x92
    movwf   input_cmd
    movff   rect_x1_h, input_data
    call    SPI_writeREG
    
    ;/* Set Y1 */
    movlw   0x93
    movwf   input_cmd
    movff   rect_y1_l, input_data
    call    SPI_writeREG
    movlw   0x94
    movwf   input_cmd
    movff   rect_y1_h, input_data
    call    SPI_writeREG

    ;/* Set X2 */
    movlw   0x95
    movwf   input_cmd
    movff   rect_x2_l, input_data
    call    SPI_writeREG
    movlw   0x96
    movwf   input_cmd
    movff   rect_x2_h, input_data
    call    SPI_writeREG

    ;/* Set Y2 */
    movlw   0x97
    movwf   input_cmd
    movff   rect_y2_l, input_data
    call    SPI_writeREG
    movlw   0x98
    movwf   input_cmd
    movff   rect_y2_h, input_data
    call    SPI_writeREG
    
    ;/* Set r1 */
    movlw   0xA1
    movwf   input_cmd
    movlw   .5
    movwf   input_data
    call    SPI_writeREG
    movlw   0xA2
    movwf   input_cmd
    movlw   .0
    movwf   input_data
    call    SPI_writeREG
    
    ;/* Set r2 */
    movlw   0xA3
    movwf   input_cmd
    movlw   .5
    movwf   input_data
    call    SPI_writeREG
    movlw   0xA4
    movwf   input_cmd
    movlw   .0
    movwf   input_data
    call    SPI_writeREG

    ;/* Set Color */
    movlw   0x63
    movwf   input_cmd
    movlw   b'111'
    andwf   rect_colour, W
    movwf   input_data
    call    SPI_writeREG
    movlw   0x64		
    movwf   input_cmd
    rrncf   rect_colour, F
    rrncf   rect_colour, F
    rrncf   rect_colour, F
    movlw   b'111'
    andwf   rect_colour, W
    movwf   input_data
    call    SPI_writeREG
    movlw   0x65
    movwf   input_cmd
    rrncf   rect_colour, F
    rrncf   rect_colour, F
    movlw   b'11'
    andwf   rect_colour, W
    movwf   input_data
    call    SPI_writeREG

    ;/* Draw! */
    movlw   RA8875_ELLIPSE
    movwf   input_cmd
    movlw   0xE0		    ;0xE0 for fill
    movwf   input_data
    call    SPI_writeREG

    ;/* Wait for the command to finish */
    movlw   .1
    call    Delay_ms
    return

    
LCD_Initialisation
    ;reset display
    bcf	    LATD, RST
    movlw   .100
    call    Delay_ms
    bsf	    LATD, RST
    movlw   .100
    call    Delay_ms
    ;set pins
    clrf    LATD
    bsf	    LATD, CS
    bsf	    LATD, MOSI
    bsf	    LATD, SCK
    clrf    TRISD
    ;bsf	    TRISD, MISO
    
    call    SPI_MasterInit
    
    call    LCD_PLLinit
    
    movlw   RA8875_SYSR
    movwf   input_cmd
    movlw   (RA8875_SYSR_16BPP | RA8875_SYSR_MCU8)
    movwf   input_data
    call    SPI_writeREG

    movlw   RA8875_PCSR
    movwf   input_cmd
    movlw   pixclk
    movwf   input_data
    call    SPI_writeREG
    movlw   .1
    call    Delay_ms
    
    ; Horizontal settings registers 
    movlw   RA8875_HDWR
    movwf   input_cmd
    movlw   .99
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_HNDFTR
    movwf   input_cmd
    movlw   RA8875_HNDFTR_DE_HIGH
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_HNDR
    movwf   input_cmd
    movlw   .3
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_HSTR
    movwf   input_cmd
    movlw   .3
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_HPWR
    movwf   input_cmd
    movlw   .11
    movwf   input_data
    call    SPI_writeREG

    ; Vertical settings registers ;
    movlw   RA8875_VDHR0
    movwf   input_cmd
    movlw   .223
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_VDHR1
    movwf   input_cmd
    movlw   .1
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_VNDR0
    movwf   input_cmd
    movlw   .31                       
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_VNDR1
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    movlw   RA8875_VSTR0
    movwf   input_cmd
    movlw   .22
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_VSTR1
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    movlw   RA8875_VPWR
    movwf   input_cmd
    movlw   .1
    movwf   input_data
    call    SPI_writeREG

    ; Set active window X ;
    movlw   RA8875_HSAW0
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    movlw   RA8875_HSAW1
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    movlw   RA8875_HEAW0
    movwf   input_cmd
    movlw   .31
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_HEAW1
    movwf   input_cmd
    movlw   .3
    movwf   input_data
    call    SPI_writeREG

    ; Set active window Y ;
    movlw   RA8875_VSAW0
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    movlw   RA8875_VSAW1
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    movlw   RA8875_VEAW0
    movwf   input_cmd
    movlw   .223
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_VEAW1
    movwf   input_cmd
    movlw   .1
    movwf   input_data
    call    SPI_writeREG

    ; Clear the entire window
    movlw   RA8875_MCLR
    movwf   input_cmd
    movlw   b'10000000';
    movwf   input_data
    call    SPI_writeREG
    movlw   .250
    call    Delay_ms
    movlw   .250
    call    Delay_ms
    
    call    LCD_DisplayOn
    call    LCD_GPIOX		;// Enable TFT - display enable tied to GPIOX
    call    LCD_PWM1config	; // PWM output for backlight
    call    LCD_PWM1out
    call    LCD_SetScrollWindow
    call    LCD_TwoLayers
    
    bcf	    Control, LYEN
    call    LYEN2
    call    Clear_Layer
    call    LYEN1
    return
    
LCD_PLLinit
    movlw   RA8875_PLLC1
    movwf   input_cmd
    movlw   RA8875_PLLC1_PLLDIV1
    addlw   .11
    movwf   input_data
    call    SPI_writeREG
    movlw   .1
    call    Delay_ms
   
    movlw   RA8875_PLLC2
    movwf   input_cmd
    movlw   RA8875_PLLC2_DIV4
    movwf   input_data
    call    SPI_writeREG
    movlw   .1
    call    Delay_ms
    return

LCD_DisplayOn
    movlw   RA8875_PWRR
    movwf   input_cmd
    movlw   (RA8875_PWRR_NORMAL | RA8875_PWRR_DISPON);
    movwf   input_data
    call    SPI_writeREG
    return

LCD_GPIOX
    movlw   RA8875_GPIOX
    movwf   input_cmd
    movlw   .1
    movwf   input_data
    call    SPI_writeREG
    return
    
LCD_PWM1config
    movlw   RA8875_P1CR
    movwf   input_cmd
    movlw   (RA8875_P1CR_ENABLE | (RA8875_PWM_CLK_DIV1024 & 0xF))
    movwf   input_data
    call    SPI_writeREG
    return
    
LCD_PWM1out
    movlw   RA8875_P1DCR
    movwf   input_cmd
    movlw   .255
    movwf   input_data
    call    SPI_writeREG
    return

LCD_SetScrollWindow
    ;// Horizontal Start point of Scroll Window
    movlw   RA8875_HSSW0
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    movlw   RA8875_HSSW1
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
   
    ;// Vertical Start Point of Scroll Window
    movlw   RA8875_VSSW0
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    movlw   RA8875_VSSW1
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    
    ;// Horizontal End Point of Scroll Window
    movlw   RA8875_HESW0
    movwf   input_cmd
    movlw   .31
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_HESW1
    movwf   input_cmd
    movlw   .3
    movwf   input_data
    call    SPI_writeREG
    
    ;// Vertical End Point of Scroll Window
    movlw   RA8875_VESW0
    movwf   input_cmd
    movlw   scroll_yend_l
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_VESW1
    movwf   input_cmd
    movlw   scroll_yend_h
    movwf   input_data
    call    SPI_writeREG

    ;// Scroll function setting
    movlw   RA8875_LTPR0
    movwf   input_cmd
    movlw   RA8875_SCROLL_BUFFER
    movwf   input_data
    call    SPI_writeREG
    return 
    
LCD_TwoLayers
    movlw   RA8875_DPCR
    movwf   input_cmd
    movlw   b'10000000'		    ;two layer mode[7] : b'1'
    movwf   input_data
    call    SPI_writeREG
    movlw   RA8875_MWCR0
    movwf   input_cmd		    ;text mode[7] : b'1'
    movlw   b'10000000'
    movwf   input_data
    call    SPI_writeREG
    return

LYEN1
    movlw   RA8875_MWCR1
    movwf   input_cmd
    clrf    input_data
    call    SPI_writeREG
    return
    
LYEN2
    movlw   RA8875_MWCR1
    movwf   input_cmd
    movlw   .1
    movwf   input_data
    call    SPI_writeREG
    return
    
SPI_writeREG
    call    SPI_writeCMD
    call    SPI_writeDATA
    return

    
SPI_writeCMD
    bcf	    LATD, CS
    movlw   RA8875_CMDWRITE
    call    SPI_MasterTransmit
    movf    input_cmd, W
    call    SPI_MasterTransmit
    bsf	    LATD, CS
    return
    
SPI_writeDATA
    bcf	    LATD, CS
    movlw   RA8875_DATAWRITE
    call    SPI_MasterTransmit
    movf    input_data, W
    call    SPI_MasterTransmit
    bsf	    LATD, CS    
    return
    
SPI_MasterInit ; Set Clock edge to negative
    bcf SSP2STAT, CKE
    ; MSSP enable; CKP=1; SPI master, clock=Fosc/64 (1MHz)
    movlw (1<<SSPEN)|(1<<CKP)|(0x02)
    movwf SSP2CON1
    return
    
SPI_MasterTransmit ; Start transmission of data (held in W)
    movwf SSP2BUF
    
Wait_Transmit ; Wait for transmission to complete
    btfss PIR2, SSP2IF
    bra Wait_Transmit
    bcf PIR2, SSP2IF ; clear interrupt flag
    return
    end


#include p18f87k22.inc
    global  New_box, Box_test, Decrement_dy, Delay_ms
    ;Global variable from Keypad.asm
    extern  Keypad_getKey, Keypad_output
    ;Global variable from LCD.asm
    extern  rect_x1_l, rect_x1_h, rect_y1_l, rect_y1_h, rect_x2_l, rect_x2_h,rect_y2_l, rect_y2_h, rect_colour, Scroll_d_l, Scroll_d_h, LCD_RectHelper
    ;Global variable from GameData.asm
    extern  Play_Avengers
    

#define max_boxes		.20		;number of max_boxes
#define	Boxes_colour		7		;Boxes bit location
#define	Boxes_enable		3		;Boxes bit location

    
;Score values
#define	score_good		.20
#define	score_great		.10
#define	score_perfect		.5

;LCD pixel values
#define	box_xstart		.10
#define	box_ystart		.20
#define	box_width		.80
#define	box_height		.10
#define	box_xoffset		.100
#define	box_yoffset		.50

#define	scroll_yend_l		.144
#define	scroll_yend_h		.1
    
acs_main    udata_acs   ; reserve data space in access ram
Boxes		    res 20			;4 times max_boxes

;could be in banked
Total_score_1	    res 1
Total_score_2	    res 1
Total_score_3	    res 1

acs_ovr    access_ovr
Delay_ms_cnt	    res 1   ; reserve 1 byte for variable LCD_cnt_l
Delay_x4us_cnt_h    res 1   ; reserve 1 byte for variable LCD_cnt_h
Delay_x4us_cnt_l    res 1   ; reserve 1 byte for ms counter
    
acs_ovr    access_ovr  
tmp1		    res 1
current_Box	    res 1
	    
main    code
converter db	0x88, 0x84, 0x83, 0x81, 0x18, 0x14, 0x12, 0x11, 0x48, 0x44, 0x42, 0x41, 0x28, 0x24, 0x22, 0x21

;Save box data in Box[0:15] in reserved access ram bytes
New_box
    movwf   current_Box
    lfsr    0, Boxes	
new_box_loop
    ;test if memory is occupied
    btfsc   INDF0, Boxes_enable
    bra	    new_box_next_box			;if occupied, try next memory location
    bsf	    INDF0, Boxes_enable			;if empty, start saving process and set enable bit
   
    ;set horizontal parameters and colour
    movlw   0xF0				
    andwf   current_Box, W			;x index[x0, x1, x2] : 0~7 and colour bit
    iorwf   INDF0				;save in Box[12:15]
    mullw   box_xoffset				;x on drawing layer x_l = start + index * offset
    movlw   box_xstart
    addwf   PRODL, W				;lower byte of x_l
    movwf   rect_x1_l				;store value for later
    movwf   rect_x2_l
    movlw   .0
    addwfc  PRODH, W
    movwf   rect_x1_h
    movwf   rect_x2_h
    movlw   box_width
    addwf   rect_x2_l
    movlw   .0
    addwfc  rect_x2_h
    
    ;set colour
    btfss   INDF0, Boxes_colour		;current_Box[7]
    bra	    new_box_set_red			;red
    movlw   b'11000000'				;blue
new_box_set_colour
    movwf   rect_colour				;R[5:7] G[2:4] B[0:1]
    
    ;set vertical parameters
    movlw   b'111'			
    andwf   current_Box, W			;y index[y0, y1, y2] : 0~7
    mullw   box_yoffset				;y on drawing layer, y_l = start + index * offset
    movlw   box_ystart				
    addwf   PRODL, W				;lower byte of y_l
    movwf   rect_y1_l				;store value for later
    movwf   rect_y2_l
    movwf   PRODL
    movlw   .0
    addwfc  PRODH, W				;higher byte of y_l
    movwf   rect_y1_h
    movwf   rect_y2_h
    movwf   PRODH
    movlw   box_height
    addwf   rect_y2_l
    movlw   .0
    addwfc  rect_y2_h
    
    movf    Scroll_d_l,W			;y on display, y_d = y_l - scroll
    subwf   PRODL, F
    movf    Scroll_d_h, W
    subfwb  PRODH, F

    movlw   scroll_yend_l			;distance from the goal, dy = y_d - goal
    subwf   PRODL, F
    movlw   scroll_yend_h
    subfwb  PRODH, F
    
    movlw   .1					;store the lower byte into FSR0 + 1
    movff   PRODL, PLUSW0			
    movf    PRODH, W				;store the higher bits [8:9] into FSR0
    iorwf   INDF0
    
    ;draw the box

    call    LCD_RectHelper
    return
    ;temporary subroutine
new_box_next_box
    incf    FSR0, F
    incf    FSR0, F
    movlw   Boxes+max_boxes
    cpfslt  FSR0
    return
    bra	    new_box_loop  
new_box_set_red
    movlw   b'00000111'	
    bra	    new_box_set_colour
    
    
;Test box for score and keypad input
Box_test
    lfsr    0, Boxes
box_test_loop
    ;test if memory is occupied
    btfss   INDF0, Boxes_enable
    bra	    box_test_next_box			;if empty, try next memory location
    movlw   b'11'				;if occupied, start testing
    andwf   INDF0, W
    tstfsz  WREG				;test if higher bits of dy are 0
    bra	    box_test_next_box			;if not, dy is too big
    
    movlw   .1
    movff   PLUSW0, tmp1			;store lower byte of dy into tmp1
    movlw   score_good				
    cpfslt  tmp1				;test lower byte
    bra	    box_test_next_box			;if greater than 'good', no score
    
    ;test for button press
    ;initialise TBLPTR
    movlw   upper(converter)
    movwf   TBLPTRU
    movlw   high(converter)
    movwf   TBLPTRH
    movlw   low(converter)
    movwf   TBLPTRL
    
    ;move TBLPTR to the corresponding keypad value
    swapf   INDF0, W
    andlw   0x0F				;[x0, x1, x2, colour] : 0~15
    addwf   TBLPTRL, F
    movlw   .0
    addwfc  TBLPTRH, F
    addwfc  TBLPTRU, F
    tblrd*					
    movf    TABLAT, W				;load box value in W and tmp1
    movwf   tmp1
    andwf   Keypad_output, W
    cpfseq  tmp1				;if box value is in keypad output
    bra	    box_test_next_box			;if not, try next box
    
    ;correct button pressed
    movlw   .1					
    movff   PLUSW0, tmp1			;load dy in tmp1
    movlw   score_great
    cpfslt  tmp1				;test for 'great'
    bra	    box_test_good			;if not, 'good'
    movlw   score_perfect			
    cpfslt  tmp1				;test for 'perfect'
    bra	    box_test_great			;if not, 'great'
    bra	    box_test_perfect			;if yes, 'perfect'
    
    ;add score
box_test_add_score
    addwf   Total_score_1, F
    movlw   .0
    addwfc  Total_score_2, F
    addwfc  Total_score_3, F

    ;remove box from memory
    call    Remove_box
    
    ;flash screen and display text and update score in display and other shit
    
    return
    ;temporary subroutine
box_test_next_box
    incf    FSR0, F
    incf    FSR0, F
    movlw   Boxes+max_boxes
    cpfslt  FSR0
    return
    bra	    box_test_loop
box_test_good
    movlw   .25
    bra	    box_test_add_score
box_test_great
    movlw   .50
    bra	    box_test_add_score
box_test_perfect
    movlw   .100
    bra	    box_test_add_score
    
    
;Decrement dy for all boxes
Decrement_dy
    lfsr    0, Boxes
decrement_dy_loop
    ;test if memory is occupied
    btfss   INDF0, Boxes_enable
    bra	    decrement_dy_next_box		;if empty, try next memory location
    movlw   .1					;if occupied, decrement lower byte of dy
    decf    PLUSW0
    movlw   b'11'
    andwf   INDF0, W
    movwf   tmp1				;load higher byte of dy in tmp1
    movlw   .0
    subwfb  tmp1, W				;subtract borrow from the bigher byte
    bnc	    decrement_dy_negative		;if dy is negative, remove box and decrement next box
    iorwf   INDF0, F				;if not, save dy and decrement next box
decrement_dy_next_box
    incf    FSR0, F
    incf    FSR0, F
    movlw   Boxes+max_boxes
    cpfslt  FSR0
    return
    bra	    decrement_dy_loop
    ;temporary subroutine
decrement_dy_negative
    call    Remove_box
    bra	    decrement_dy_next_box

    
;Remove box from memory
Remove_box
    clrf    INDF0
    movlw   .1
    clrf    PLUSW0
    return

    
;Delay ms given in W
Delay_ms
	movwf	Delay_ms_cnt
Delay_ms_loop
	movlw	.250		    ; 1 ms Delay
	call	Delay_x4us	
	decfsz	Delay_ms_cnt
	bra	Delay_ms_loop
	return
;Delay x4 us given in W
Delay_x4us
	movwf	Delay_x4us_cnt_l   ; now need to multiply by 16
	swapf   Delay_x4us_cnt_l,F ; swap nibbles
	movlw	0x0f	    
	andwf	Delay_x4us_cnt_l,W ; move low nibble to W
	movwf	Delay_x4us_cnt_h   ; then to LCD_cnt_h
	movlw	0xf0	    
	andwf	Delay_x4us_cnt_l,F ; keep high nibble in LCD_cnt_l
	call	delay
	return
    ;temporary subroutine
delay				; Delay routine	4 instruction loop == 250ns	    
	movlw 	0x00		; W=0
delay_loop
	decf 	Delay_x4us_cnt_l,F	; no carry when 0x00 -> 0xff
	subwfb 	Delay_x4us_cnt_h,F	; no carry when 0x00 -> 0xff
	bc 	delay_loop	; carry, then loop again
	return			; carry reset so return
    end

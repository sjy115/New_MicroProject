#include p18f87k22.inc
    
    extern  New_box, Scroll, Music_Avengers
    global  Play_Avengers
    
GameData    code
    
Play_Avengers
    call    Music_Avengers

;Section 1 - Both hands Play
    
    ;Layer 1
    call    Scroll
    
    ;Layer  2
    movlw   b'01110000'
    call    New_box
    movlw   b'01101001'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00111011'
    call    New_box
    movlw   b'00100100'
    call    New_box
    call    Scroll
    
    ;Layer  1
    movlw   b'01110000'
    call    New_box
    movlw   b'00111001'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'00011011'
    call    New_box
    movlw   b'00000100'
    call    New_box
    call    Scroll
    
    ;Layer  2
    movlw   b'01110000'
    call    New_box
    movlw   b'01101001'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00111011'
    call    New_box
    movlw   b'00100100'
    call    New_box
    call    Scroll
    
    ;Layer  1
    movlw   b'01110000'
    call    New_box
    movlw   b'00111001'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'00011011'
    call    New_box
    movlw   b'00000100'
    call    New_box
    call    Scroll
    
    ;Layer  2
    movlw   b'01110000'
    call    New_box
    movlw   b'01101001'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00111011'
    call    New_box
    movlw   b'00100100'
    call    New_box
    call    Scroll
    
    ;Layer  1
    movlw   b'01110000'
    call    New_box
    movlw   b'00111001'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'00011011'
    call    New_box
    movlw   b'00000100'
    call    New_box
    call    Scroll
    
    ;Layer  2
    movlw   b'01110000'
    call    New_box
    movlw   b'01101001'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00111011'
    call    New_box
    movlw   b'00100100'
    call    New_box
    call    Scroll
    
    ;Layer  1
    movlw   b'00000000'
    call    New_box
    movlw   b'00001001'
    call    New_box
    call    Scroll
    
    ;Layer  2
    movlw   b'01110000'
    call    New_box
    movlw   b'01101001'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00111011'
    call    New_box
    movlw   b'00100100'
    call    New_box
    call    Scroll
    
    ;Layer  1
    movlw   b'01110000'
    call    New_box
    movlw   b'00111001'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'00011011'
    call    New_box
    movlw   b'00000100'
    call    New_box
    call    Scroll
    
    ;Layer  2
    movlw   b'01110000'
    call    New_box
    movlw   b'01101001'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00111011'
    call    New_box
    movlw   b'00100100'
    call    New_box
    call    Scroll
    
    ;Layer  1
    movlw   b'01110000'
    call    New_box
    movlw   b'00111001'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'00011011'
    call    New_box
    movlw   b'00000100'
    call    New_box
    call    Scroll
    
    ;Layer  2
    movlw   b'01110000'
    call    New_box
    movlw   b'01101001'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00111011'
    call    New_box
    movlw   b'00100100'
    call    New_box
    call    Scroll
    
    ;Layer  1
    movlw   b'01110000'
    call    New_box
    movlw   b'00111001'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'00011011'
    call    New_box
    movlw   b'00000100'
    call    New_box
    call    Scroll
    
    ;Layer  2
    movlw   b'01110000'
    call    New_box
    movlw   b'01101001'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00111011'
    call    New_box
    movlw   b'00100100'
    call    New_box
    call    Scroll
    
    ;Layer  1
    movlw   b'01110000'
    call    New_box
    movlw   b'00111001'
    call    New_box
    call    Scroll
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return
    
    end
    



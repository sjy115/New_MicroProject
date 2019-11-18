#include p18f87k22.inc
    
    extern  New_box, Scroll, Music_Avengers
    global  Play_Avengers
    
GameData    code
    
Play_Avengers
    ;call    Music_Avengers
;Section 1 - Both hands Play
    

    movlw   b'00000000'
    call    New_box
    movlw   b'00000001'
    call    New_box
    movlw   b'00000010'
    call    New_box
    movlw   b'00000011'
    call    New_box
    call    Scroll
    
    movlw   b'11000000'
    call    New_box
    movlw   b'11000001'
    call    New_box
    movlw   b'11000011'
    call    New_box
    movlw   b'11000010'
    call    New_box
    call    Scroll
    
    
  
    return
    
    end

#include p18f87k22.inc
    
    extern  New_box, Scroll, Music_Avengers
    global  Play_Avengers
    
GameData    code
    
Play_Avengers
    call    Music_Avengers
    call    Scroll
    call    Scroll
    movlw   b'00000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'00000101'
    call    New_box
    movlw   b'00000100'
    call    New_box
    movlw   b'00000011'
    call    New_box
    movlw   b'00000010'
    call    New_box
    movlw   b'00000001'
    call    New_box
    movlw   b'00000000'
    call    New_box
    call    Scroll
    
    movlw   b'00000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'00000101'
    call    New_box
    movlw   b'00000100'
    call    New_box
    movlw   b'00000011'
    call    New_box
    movlw   b'00000010'
    call    New_box
    movlw   b'00000001'
    call    New_box
    movlw   b'00000000'
    call    New_box
    call    Scroll
    call    Scroll
    call    Scroll
    return
    
    end
    ;Bar32
    ;Layer 1, Right
    movlw   b'01000111'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'01110001'
    call    New_box
    ;Layer 1, Left
    movlw   b'00000111'
    call    New_box
    call    Scroll
    ;Layer 2, Right
    movlw   b'11110111'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'11000001'
    call    New_box
    ;Layer 2, Left
    movlw   b'10000111'
    call    New_box
    call    Scroll
    
    ;Layer 3, Right
    movlw   b'01110111'
    call    New_box
    movlw   b'01100110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'01000100'
    call    New_box
    ;Layer 3, Left
    movlw   b'00110011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'00010001'
    call    New_box
    movlw   b'00000000'
    call    New_box
    call    Scroll
    
    ;Layer 4, Right
    movlw   b'11110111'
    call    New_box
    movlw   b'11100110'
    call    New_box
    movlw   b'11010101'
    call    New_box
    movlw   b'11000100'
    call    New_box
    ;Layer 4, Left
    movlw   b'10110011'
    call    New_box
    movlw   b'10100010'
    call    New_box
    movlw   b'10010001'
    call    New_box
    movlw   b'10000000'
    call    New_box
    call    Scroll
#include p18f87k22.inc
    
    extern  New_box, Scroll, Music_Avengers, Delay_ms
    global  Play_Avengers
    
GameData    code
    
Play_Avengers
    call    Music_Avengers
        
    call    Scroll
    movlw   .125
    call    Delay_ms
;bar 1
    ;Layer 1
    
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01000101'
    call    New_box
    movlw   b'00000001'
    call    New_box
    movlw   b'01000000'
    call    New_box
        call    Scroll
    
    ;Layer 2
    ;
    movlw   b'00000111'
    call    New_box
    movlw   b'01000011'
    call    New_box
    movlw   b'00000010'
    call    New_box
    movlw   b'01000001'
    call    New_box
    movlw   b'00000000'
    call    New_box
    
    call    Scroll
    
;bar 2
     ;Layer 1
    ;
    movlw   b'01010111'
    call    New_box
    movlw   b'00010110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010001'
    call    New_box
    movlw   b'01010000'
    call    New_box
    
    call    Scroll
        bcf	    LATF, 1 
    ;Layer 2
    ;
    movlw   b'00000111'
    call    New_box
    movlw   b'01010011'
    call    New_box
    movlw   b'00000010'
    call    New_box
    movlw   b'01010001'
    call    New_box
    movlw   b'00000000'
    call    New_box
    
    call    Scroll
    
;bar 3
        ;Layer 1
    ;
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01000101'
    call    New_box
    movlw   b'00000001'
    call    New_box
    movlw   b'01000000'
    call    New_box
    
    call    Scroll

    ;Layer 2
    ;
    movlw   b'00000111'
    call    New_box
    movlw   b'01000011'
    call    New_box
    movlw   b'00000010'
    call    New_box
    movlw   b'01000001'
    call    New_box
    movlw   b'00000000'
    call    New_box
    
    call    Scroll 

;bar 4
    ;Layer 1
    movlw   b'01010111'
    call    New_box
    movlw   b'00010110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010011'
    call    New_box
    movlw   b'01010000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00010111'
    call    New_box
    movlw   b'01010011'
    call    New_box
    movlw   b'00010011'
    call    New_box
    
    call    Scroll
    
;bar 5
    ;Layer 1
    ;
    movlw   b'01100111'
    call    New_box
    movlw   b'00100110'
    call    New_box
    movlw   b'01100101'
    call    New_box
    movlw   b'00100001'
    call    New_box
    movlw   b'01100000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    ;
    movlw   b'00100111'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01100001'
    call    New_box
    movlw   b'00100000'
    call    New_box
    
    call    Scroll
    
;bar 6
     ;Layer 1
    ;
    movlw   b'01110111'
    call    New_box
    movlw   b'00110110'
    call    New_box
    movlw   b'01110101'
    call    New_box
    movlw   b'00110001'
    call    New_box
    movlw   b'01110000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    ;
    movlw   b'00110111'
    call    New_box
    movlw   b'01110011'
    call    New_box
    movlw   b'00110010'
    call    New_box
    movlw   b'01110001'
    call    New_box
    movlw   b'00110000'
    call    New_box
    
    call    Scroll
    
;bar 7
        ;Layer 1
    ;
    movlw   b'01100111'
    call    New_box
    movlw   b'00100110'
    call    New_box
    movlw   b'01100101'
    call    New_box
    movlw   b'00100001'
    call    New_box
    movlw   b'01100000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    ;
    movlw   b'00100111'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01100001'
    call    New_box
    movlw   b'00100000'
    call    New_box
    
    call    Scroll 

;bar 8
    ;Layer 1
    movlw   b'01110111'
    call    New_box
    movlw   b'00110110'
    call    New_box
    movlw   b'01110101'
    call    New_box
    movlw   b'00110011'
    call    New_box
    movlw   b'01110000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00110111'
    call    New_box
    movlw   b'01110011'
    call    New_box
    movlw   b'00110011'
    call    New_box
    
    call    Scroll
    
;bar 9
    
    call    Scroll
    
    call    Scroll
    movlw   .125
    call    Delay_ms
;bar 10
    ;Layer 1
    movlw   b'11000111'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'11010000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'11010111'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'11000000'
    call    New_box
    
    call    Scroll
    
;bar 11
    ;Layer 1
    movlw   b'11000111'
    call    New_box
    movlw   b'10010011'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    call    Scroll
    movlw   .250
    call    Delay_ms
;bar 12
    ;Layer 1
    movlw   b'10010111'
    call    New_box
    movlw   b'11100011'
    call    New_box
    movlw   b'10100000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'10100111'
    call    New_box
    movlw   b'11100011'
    call    New_box
    movlw   b'10010000'
    call    New_box
    
    call    Scroll
    
;bar 13
    ;Layer 1
    
    
    call    Scroll
    
    ;Layer 2
    call    Scroll
    movlw   .125
    call    Delay_ms
;bar 14
    ;Layer 1
    movlw   b'11000111'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'11010000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'11010111'
    call    New_box
    movlw   b'10010011'
    call    New_box
    
    
    call    Scroll
    
;bar 15
    ;Layer 1
    movlw   b'11000111'
    call    New_box
    movlw   b'11000110'
    call    New_box
    movlw   b'10010010'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    call    Scroll
    movlw   .125
    call    Delay_ms
;bar 16
    ;Layer 1
    movlw   b'10010110'
    call    New_box
    movlw   b'11100011'
    call    New_box
    
    call    Scroll
    ;Layer 2
    movlw   b'10100111'
    call    New_box
    movlw   b'10100110'
    call    New_box
    movlw   b'11100010'
    call    New_box

    call    Scroll
    
;bar 17
    ;Layer 1
    movlw   b'11100111'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    call    Scroll
    movlw   .250
    call    Delay_ms
    
;bar 18
    ;Layer 1
    movlw   b'01010111'
    call    New_box
    movlw   b'00100011'
    call    New_box
    movlw   b'01100000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00110111'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100000'
    call    New_box
    
    call    Scroll
    movlw   .250
    call    Delay_ms
;bar 19
    ;Layer 1
    movlw   b'01010111'
    call    New_box
    movlw   b'00100011'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    call    Scroll
    movlw   .250
    call    Delay_ms
;bar 20
    ;Layer 1
    movlw   b'00100111'
    call    New_box
    movlw   b'01110011'
    call    New_box
    movlw   b'11110000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'10110111'
    call    New_box
    movlw   b'00110011'
    call    New_box
    
    call    Scroll
    
;bar 21
    ;Layer 1
    movlw   b'00000111'
    call    New_box
    movlw   b'11100111'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    call    Scroll
;bar 22
    ;Layer 1
    movlw   b'01000111'
    call    New_box
    movlw   b'00000111'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'10100000'
    call    New_box
    movlw   b'11100000'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'10100111'
    call    New_box
    movlw   b'11100111'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'00000000'
    call    New_box
    movlw   b'01000000'
    call    New_box
    
    call    Scroll
    
;bar 23
    ;Layer 1
    movlw   b'00000111'
    call    New_box
    movlw   b'01000111'
    call    New_box
    movlw   b'10000011'
    call    New_box
    movlw   b'11000011'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    call    Scroll
  
;bar 24
    ;Layer 1
    movlw   b'10000111'
    call    New_box
    movlw   b'11000111'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'10100000'
    call    New_box
    movlw   b'11100000'
    call    New_box
    
    call    Scroll
    ;Layer 2
    
    movlw   b'10100111'
    call    New_box
    movlw   b'11100111'
    call    New_box
    movlw   b'10110011'
    call    New_box
    movlw   b'11110011'
    call    New_box
    
    call    Scroll
    
;bar 25
    ;Layer 1
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010100'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01110001'
    call    New_box
    movlw   b'00110000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'11110111'
    call    New_box
    movlw   b'10110110'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'10100100'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'10010010'
    call    New_box
    movlw   b'11000001'
    call    New_box
    movlw   b'10000000'
    call    New_box
    
    call Scroll
    
;bar 26
    ;Layer 1
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010100'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01110001'
    call    New_box
    movlw   b'00110000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'11110111'
    call    New_box
    movlw   b'10110110'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'10100100'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'10010010'
    call    New_box
    movlw   b'11000001'
    call    New_box
    movlw   b'10000000'
    call    New_box
    
    call Scroll
    
;bar 27
    ;Layer 1
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010100'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01110001'
    call    New_box
    movlw   b'00110000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'11110111'
    call    New_box
    movlw   b'10110110'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'10100100'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'10010010'
    call    New_box
    movlw   b'11000001'
    call    New_box
    movlw   b'10000000'
    call    New_box
    
    call Scroll
    
;bar 28
    ;Layer 1
    movlw   b'11110111'
    call    New_box
    movlw   b'10110110'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'10100100'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'10010010'
    call    New_box
    movlw   b'11000001'
    call    New_box
    movlw   b'10000000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010100'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01110001'
    call    New_box
    movlw   b'00110000'
    call    New_box
    
    call Scroll
    
;bar 29
    ;Layer 1
    movlw   b'11110111'
    call    New_box
    movlw   b'10110110'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'10100100'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'10010010'
    call    New_box
    movlw   b'11000001'
    call    New_box
    movlw   b'10000000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010100'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01110001'
    call    New_box
    movlw   b'00110000'
    call    New_box
    
    call Scroll
    
;bar 30
    ;Layer 1
    movlw   b'11110111'
    call    New_box
    movlw   b'10110110'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'10100100'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'10010010'
    call    New_box
    movlw   b'11000001'
    call    New_box
    movlw   b'10000000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010100'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01110001'
    call    New_box
    movlw   b'00110000'
    call    New_box
    
    call Scroll
    
;bar 31
    ;Layer 1
    movlw   b'00110111'
    call    New_box
    movlw   b'01110110'
    call    New_box
    movlw   b'00100101'
    call    New_box
    movlw   b'01100100'
    call    New_box
    movlw   b'00010011'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00000001'
    call    New_box
    movlw   b'01000000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'10110111'
    call    New_box
    movlw   b'11110110'
    call    New_box
    movlw   b'10100101'
    call    New_box
    movlw   b'11100100'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'11010010'
    call    New_box
    movlw   b'10000001'
    call    New_box
    movlw   b'11000000'
    call    New_box
    
    call Scroll
    
;bar 32
    ;Layer 1
    movlw   b'00110111'
    call    New_box
    movlw   b'01110110'
    call    New_box
    movlw   b'00100101'
    call    New_box
    movlw   b'01100100'
    call    New_box
    movlw   b'00010011'
    call    New_box
    movlw   b'01010010'
    call    New_box
    movlw   b'00000001'
    call    New_box
    movlw   b'01000000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'01000111'
    call    New_box
    movlw   b'01010111'
    call    New_box
    movlw   b'01100111'
    call    New_box
    movlw   b'01110111'
    call    New_box
    
    call    Scroll
    
;bar 33
    ;Layer 1
    movlw   b'00000111'
    call    New_box
    movlw   b'10000101'
    call    New_box
    movlw   b'10000011'
    call    New_box
    movlw   b'00000001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00000111'
    call    New_box
    movlw   b'10000101'
    call    New_box
    movlw   b'10000011'
    call    New_box
    movlw   b'00000001'
    call    New_box
    
    call    Scroll
  
;bar 34
    ;Layer 1
    movlw   b'01010111'
    call    New_box
    movlw   b'11010101'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'01010001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'01010111'
    call    New_box
    movlw   b'11010101'
    call    New_box
    movlw   b'11010011'
    call    New_box
    movlw   b'01010001'
    call    New_box
    
    call    Scroll
    
;bar 35
    ;Layer 1
    movlw   b'00100111'
    call    New_box
    movlw   b'10100101'
    call    New_box
    movlw   b'10100011'
    call    New_box
    movlw   b'00100001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00100111'
    call    New_box
    movlw   b'10100101'
    call    New_box
    movlw   b'10100011'
    call    New_box
    movlw   b'00100001'
    call    New_box
    
    call    Scroll
    
;bar 36
    ;Layer 1
    movlw   b'01110111'
    call    New_box
    movlw   b'11110101'
    call    New_box
    movlw   b'11110011'
    call    New_box
    movlw   b'01110001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'01110111'
    call    New_box
    movlw   b'11110101'
    call    New_box
    movlw   b'11110011'
    call    New_box
    movlw   b'01110001'
    call    New_box
    
    call    Scroll
 
;bar 37
    ;Layer 1
    movlw   b'00110111'
    call    New_box
    movlw   b'10110101'
    call    New_box
    movlw   b'10110011'
    call    New_box
    movlw   b'00110001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00110111'
    call    New_box
    movlw   b'10110101'
    call    New_box
    movlw   b'10110011'
    call    New_box
    movlw   b'00110001'
    call    New_box
    
    call    Scroll
    
;bar 38
    ;Layer 1
    movlw   b'01100111'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'11100011'
    call    New_box
    movlw   b'01100001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'01100111'
    call    New_box
    movlw   b'11100101'
    call    New_box
    movlw   b'11100011'
    call    New_box
    movlw   b'01100001'
    call    New_box
    
    call    Scroll
    
;bar 39
    ;Layer 1
    movlw   b'00010111'
    call    New_box
    movlw   b'10010101'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'00010001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00010111'
    call    New_box
    movlw   b'10010101'
    call    New_box
    movlw   b'10010011'
    call    New_box
    movlw   b'00010001'
    call    New_box
    
    call    Scroll
    
;bar 40
    ;Layer 1
    movlw   b'01000111'
    call    New_box
    movlw   b'11000101'
    call    New_box
    movlw   b'11000011'
    call    New_box
    movlw   b'01000001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'01000111'
    call    New_box
    movlw   b'11000101'
    call    New_box
    movlw   b'01000011'
    call    New_box
    movlw   b'11000001'
    call    New_box
    
    call    Scroll

;bar 41
    ;Layer 1
    movlw   b'00100111'
    call    New_box
    movlw   b'01110101'
    call    New_box
    movlw   b'01110011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01010001'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00010111'
    call    New_box
    movlw   b'10010111'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'01010011'
    call    New_box
    movlw   b'00010001'
    call    New_box
    
    call    Scroll
 
;bar 42
    ;Layer 1
    movlw   b'00000111'
    call    New_box
    movlw   b'10000111'
    call    New_box
    movlw   b'11000101'
    call    New_box
    movlw   b'01000101'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'11000111'
    call    New_box
    movlw   b'01000111'
    call    New_box
    movlw   b'00000101'
    call    New_box
    movlw   b'10000101'
    call    New_box
    
    call    Scroll
    
;bar 43
    ;Layer 1
    movlw   b'10000111'
    call    New_box
    movlw   b'11000111'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    call    Scroll
    
;bar 44
    ;Layer 1
    movlw   b'00010011'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00010111'
    call    New_box
    movlw   b'01010001'
    call    New_box
    
    call    Scroll
    
;bar 45
    ;Layer 1
    movlw   b'10010111'
    call    New_box
    movlw   b'11010111'
    call    New_box
    
    call    Scroll
    
    call    Scroll
    
;bar 46
    ;Layer 1
    movlw   b'10000111'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'10010111'
    call    New_box
    
    call    Scroll
    
;bar 47
    ;Layer 1
    movlw   b'10100111'
    call    New_box
    movlw   b'11100111'
    call    New_box
    
    call    Scroll
    
    call    Scroll
    
;bar 48
    ;Layer 1
    movlw   b'00010011'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00010111'
    call    New_box
    movlw   b'01010001'
    call    New_box
    
    call    Scroll
    
;bar 49
    ;Layer 1
    movlw   b'10000111'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'10010111'
    call    New_box
    
    call    Scroll
    
;bar 50
    ;Layer 1
    movlw   b'01000111'
    call    New_box
    movlw   b'00000110'
    call    New_box
    movlw   b'01010101'
    call    New_box
    movlw   b'00010100'
    call    New_box
    movlw   b'01100011'
    call    New_box
    movlw   b'00100010'
    call    New_box
    movlw   b'01110001'
    call    New_box
    movlw   b'00110000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'11000111'
    call    New_box
    movlw   b'10000110'
    call    New_box
    movlw   b'11010101'
    call    New_box
    movlw   b'10010100'
    call    New_box
    movlw   b'11100011'
    call    New_box
    movlw   b'10100010'
    call    New_box
    movlw   b'11110001'
    call    New_box
    movlw   b'10110000'
    call    New_box
    
    call Scroll
    
;bar 51
    ;Layer 1
    movlw   b'00000111'
    call    New_box
    movlw   b'10000111'
    call    New_box
    movlw   b'11000111'
    call    New_box
    movlw   b'01000111'
    call    New_box
    
    call    Scroll
    
    call    Scroll
    
;bar 52
    ;Layer 1
    movlw   b'00010011'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00010111'
    call    New_box
    movlw   b'01010001'
    call    New_box
    
    call    Scroll
    
;bar 53
    ;Layer 1
    movlw   b'00010111'
    call    New_box
    movlw   b'10010111'
    call    New_box
    movlw   b'11010111'
    call    New_box
    movlw   b'01010111'
    call    New_box
    
    call    Scroll
    
    call    Scroll
    
;bar 54
    ;Layer 1
    movlw   b'10010111'
    call    New_box
    movlw   b'11010111'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'10100111'
    call    New_box
    movlw   b'11100111'
    call    New_box
    
    call    Scroll
    
;bar 55
    ;Layer 1
    movlw   b'00100111'
    call    New_box
    movlw   b'01100111'
    call    New_box
    movlw   b'00100101'
    call    New_box
    movlw   b'01100101'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'00010111'
    call    New_box
    movlw   b'01010111'
    call    New_box
    movlw   b'00010101'
    call    New_box
    movlw   b'01010101'
    call    New_box
    
    call    Scroll
    
;bar 56
    ;Layer 1
    movlw   b'00000111'
    call    New_box
    movlw   b'01000111'
    call    New_box
    movlw   b'00000101'
    call    New_box
    movlw   b'01000101'
    call    New_box
    
    call    Scroll
    
    ;Layer 2
    movlw   b'10000111'
    call    New_box
    movlw   b'10010111'
    call    New_box
    movlw   b'10000101'
    call    New_box    
    movlw   b'10010101'
    call    New_box
    
    call    Scroll
  
;bar 57
    ;Layer 1
    movlw   b'00000111'
    call    New_box
    movlw   b'01000110'
    call    New_box
    movlw   b'00010101'
    call    New_box
    movlw   b'01010100'
    call    New_box
    movlw   b'00100011'
    call    New_box
    movlw   b'01100010'
    call    New_box
    movlw   b'00110001'
    call    New_box
    movlw   b'01110000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'10000111'
    call    New_box
    movlw   b'11000110'
    call    New_box
    movlw   b'10010101'
    call    New_box
    movlw   b'11010100'
    call    New_box
    movlw   b'10100011'
    call    New_box
    movlw   b'11100010'
    call    New_box
    movlw   b'10110001'
    call    New_box
    movlw   b'11110000'
    call    New_box
    
    call Scroll
  
;bar 58
    ;Layer 1
    movlw   b'00110111'
    call    New_box
    movlw   b'01110110'
    call    New_box
    movlw   b'10110101'
    call    New_box
    movlw   b'11110100'
    call    New_box
    movlw   b'00100011'
    call    New_box
    movlw   b'01100010'
    call    New_box
    movlw   b'10100001'
    call    New_box
    movlw   b'11100000'
    call    New_box
    
    call Scroll
    
    ;Layer 2
    movlw   b'00010111'
    call    New_box
    movlw   b'01010110'
    call    New_box
    movlw   b'10010101'
    call    New_box
    movlw   b'11010100'
    call    New_box
    movlw   b'00000011'
    call    New_box
    movlw   b'01000010'
    call    New_box
    movlw   b'10000001'
    call    New_box
    movlw   b'11000000'
    call    New_box
    
    call Scroll
   
;bar 59
    ;Layer 1
    movlw   b'10010111'
    call    New_box
    
    call    Scroll
    
    call    Scroll
    
    return
    
    end
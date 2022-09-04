;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Rambo: First Blood, Part II (NTSC) for Commodore 64                          ;
; Intro                                                                        ;
;                                                                              ;
; by riq / L.I.A                                                               ;
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

BITMAP_ADDR = $4000
SCREEN_ADDR = $6000

        * = $0801                       ;
        .WORD (+), 2022                 ;pointer, line number
        .NULL $9E, FORMAT("%4d", start) ;will be "sys ${start}"
+       .WORD 0                         ;basic line end

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
start:
        sei

        lda #$35                        ;RAM/IO/RAM
        sta $01

        lda #$00
        sta $d01a                       ;no raster IRQ

        lda #$7f
        sta $dc0d                       ;turn off cia 1 interrupts
        sta $dd0d                       ;turn off cia 2 interrupts

        lda $dc0d                       ;clear interrupts and ACK irq
        lda $dd0d
        asl $d019

        ; turn off VIC
        lda #%01011011                  ;the bug that blanks the screen
        sta $d011                       ;extended background color mode: on
        lda #%00011000
        sta $d016                       ;turn on multicolor

        lda #$60
        sta $d012

        lda #$01                        ;Enable raster irq
        sta $d01a

        ; Select Bank $4000-$7fff for VIC
        lda $dd00                       ;CIA 2
        and #%11111100                  ;Mask the first 2 bits
        ora #2                          ;3 for Bank 0
                                        ;2 for Bank 1
                                        ;1 for Bank 2
        sta $dd00                       ;0 for Bank 3

        ; Setup colors, needed for MC bitmap
        lda #$00
        sta $d020
        lda #$07
        sta $d021
        lda #$01
        sta $d022
        sta $d023

        ldx #$00
_lp:
        .for step := $0000, step < $0400, step += $0100
        lda image_color + step,x
        sta $d800 + step,x
        lda image_screen + step,x
        sta SCREEN_ADDR + step,x
        .endfor
        inx
        bne _lp

        lda #%10000000                  ;Video at BANK + $2000 ($6000)
        sta $d018                       ; Bitmap at BANK + $0000 ($4000)

        lda #%00111011                  ;Turn on VIC again by disabling extended color.
        sta $d011                       ; Also enable bitmap mode
        lda #%00011000                  ;Make sure MC is enabled
        sta $d016

        jmp MUSIC_MAIN

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
irq_handler
        pha                             ;saves A, X, Y
        txa
        pha
        tya
        pha

        asl $d019                       ;clears raster interrupt

        jsr $2000

        pla                             ;restores A, X, Y
        tay
        pla
        tax
        pla
        rti                             ;restores previous PC, status

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Data

image_color
        .binary "rambo-color.bin"

image_screen
        .binary "rambo-screen.bin"

* = $2000
        .include "rambo-music.s"

* = $4000
        .binary "rambo-bitmap.bin"


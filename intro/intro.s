;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Rambo: First Blood, Part II (NTSC) for Commodore 64                          ;
; Intro                                                                        ;
;                                                                              ;
; by riq / L.I.A                                                               ;
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

SPRITE_PTR0 = <((SPRITE_ADDR % $4000) / 64)

        * = $0801                       ;
        .WORD (+), 2022                 ;pointer, line number
        .NULL $9E, FORMAT("%4d", start) ;will be "sys ${start}"
+       .WORD 0                         ;basic line end

ZP_BIT_INDEX            = $02           ;byte  points to the bit displayed
ZP_DELAY                = $03           ;Delay for the scroller
ZP_RASTER_TICK          = $04
ZP_JUMP_TO_GAME         = $fc           ;Jump to Music or to Game. Used in Game code

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
start:
        sei

        ldx #<nmi_handler               ; restore key disabled
        ldy #>nmi_handler
        stx $fffa
        sty $fffb

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

        lda #$f9                        ;To open the bottom border
        sta $d012

        lda #$01                        ;Enable raster irq
        sta $d01a

        ldx #<irq_handler_f9
        ldy #>irq_handler_f9
        stx $fffe
        sty $ffff

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
        .endfor
        inx
        bne _lp

        lda #%10000000                  ;Video at BANK + $2000 ($6000)
        sta $d018                       ; Bitmap at BANK + $0000 ($4000)

        lda #%00111011                  ;Turn on VIC again by disabling extended color.
        sta $d011                       ; Also enable bitmap mode
        lda #%00011000                  ;Make sure MC is enabled
        sta $d016

        jsr MUSIC_INIT
        jsr init_sprites

        lda #$00
        sta ZP_DELAY
        sta ZP_BIT_INDEX
        sta ZP_RASTER_TICK


        cli

        ; Reverse Input / Output so that we don't have to write to $dc00
        ; to read the keyboard
        ldx #$ff
        stx $dc03                       ;DDR B: Output
        ldx #%11000000
        stx $dc02                       ;DDR A: Input, except Rumble which is Output

        lda #$00
        sta $dc00                       ;Disable rumble

_l00

_wait_raster
        lda ZP_RASTER_TICK
        beq _wait_raster

        lda #$00
        sta ZP_RASTER_TICK              ;Raster to 0 again

_test_p
        lda #%11111101                  ;Col 1
        sta $dc01
        lda $dc00
        and #%00100000                  ;Row 5
        bne _test_fire_joy

        lda #$83                        ;Indicates jumps to music
        bne _exit

_test_fire_joy
        lda $dc00
        and $dc01
        and #%00010000                  ;fire
        bne _l00

        lda #$00
        ; Fallthrough

_exit
        sta ZP_JUMP_TO_GAME
        jmp end_intro

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
nmi_handler
        rti

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
irq_handler_f9
        pha
        tya
        pha
        txa
        pha

        asl $d019                       ;ACK interrupt

        lda #$60
        sta $d012

        ldx #<irq_handler_60
        ldy #>irq_handler_60
        stx $fffe
        sty $ffff

        lda $d011                       ; Open vertical border
        and #%11110111                  ; Switch to 24 row mode
        sta $d011

        lda #$fc                        ; Wait for the rasterline to reach $ fc
_l00    cmp $d012
        bne _l00

        lda $d011                       ; And switch back to 25 row mode
        ora #%00001000
        sta $d011

        pla
        tax
        pla
        tay
        pla
        rti

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
irq_handler_60
        pha
        tya
        pha
        txa
        pha

        asl $d019                       ;ACK interrupt

        lda #$f9
        sta $d012

        ldx #<irq_handler_f9
        ldy #>irq_handler_f9
        stx $fffe
        sty $ffff

;        inc $d020
        jsr MUSIC_PLAY
;        inc $d020
        jsr animate_scroll
;        dec $d020
;        dec $d020

        inc ZP_RASTER_TICK

        pla
        tax
        pla
        tay
        pla
        rti

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
init_sprites
        lda #%01111111
        sta $d015                       ;Enable only 7 sprites

        lda #%01000000
        sta $d010                       ;8-bit on for sprites x

        lda #0
        sta $d01c                       ;no sprite multi-color. hi-res only

        lda #%01111111
        sta $d017                       ;y double resolution
        sta $d01d                       ;x double resolution


        ldx #6
        ldy #12
_l1
        lda sprite_x_pos,x
        sta $d000,y
        lda #252                        ; same Y for all sprites
        sta $d001,y
        lda #1                          ; white color
        sta $d027,x                     ; all sprites are white
        lda sprite_pointers,x
        sta $63f8,x                     ; sprite pointers
        dey
        dey
        dex
        bpl _l1

        lda #0                          ;all sprites are clean
        tax
_l2     sta SPRITE_ADDR,x               ;8 sprites = 512 bytes = 64 * 8
        sta SPRITE_ADDR+$100,x
        dex
        bne _l2

        rts

sprite_x_pos:
        .byte 48*0+10, 48*1+10, 48*2+10, 48*3+10
        .byte 48*4+10, 48*5+10, (48*6+10) % 256

sprite_pointers:
        .byte SPRITE_PTR0+0
        .byte SPRITE_PTR0+1
        .byte SPRITE_PTR0+2
        .byte SPRITE_PTR0+3
        .byte SPRITE_PTR0+4
        .byte SPRITE_PTR0+5
        .byte SPRITE_PTR0+6

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
animate_scroll
        lda ZP_DELAY
        beq _do

        dec ZP_DELAY
        beq _restore
        jmp animate_rumble

_restore
        ; Once the delay finished, restore sprite positions
        ldx #6
        ldy #12

-       lda sprite_x_pos,x
        sta $d000,y
        lda #252                        ; same Y for all sprites
        sta $d001,y
        dey
        dey
        dex
        bpl -

        ; fallthrough
_do
        ; use fa-ff as variables
        lda #0
        sta $fa                         ; tmp variable

        ldx #<CHARSET_ADDR
        ldy #>CHARSET_ADDR
        stx $fc
        sty $fd                         ; pointer to charset

load_scroll_addr = * + 1
        lda SCROLL_TEXT                 ; self-modifying
        cmp #$fe
        beq _code_set_pause
        cmp #$ff
        beq _code_end_of_scroll
        bne _code_char

_code_set_pause
        lda #$ff
        sta ZP_DELAY
        jmp _next_char

_code_end_of_scroll
        ldx #0
        stx ZP_BIT_INDEX
        ldx #<SCROLL_TEXT
        ldy #>SCROLL_TEXT
        stx load_scroll_addr
        sty load_scroll_addr+1
        lda SCROLL_TEXT

        ; fallthrough

_code_char:
        clc                             ; char_idx * 8
        asl a
        rol $fa
        asl a
        rol $fa
        asl a
        rol $fa

        tay                             ; char_def = ($fc),y

        clc
        lda $fd
        adc $fa                         ; A = charset[char_idx * 8]
        sta $fd


        ; scroll top 8 bytes
        ; YY = sprite rows
        ; SS = sprite number
        .for YY:=0, YY<8, YY+=1
                lda ($fc),y
                ldx ZP_BIT_INDEX             ; set C according to the current bit index
-               asl a
                dex
                bpl -

                .for SS:=0, SS<7, SS+=1
                        rol SPRITE_ADDR + (6 - SS) * 64 + YY * 3 + 2
                        rol SPRITE_ADDR + (6 - SS) * 64 + YY * 3 + 1
                        rol SPRITE_ADDR + (6 - SS) * 64 + YY * 3 + 0
                .endfor
                iny                     ; byte of the char
        .endfor


        ldx ZP_BIT_INDEX
        inx
        cpx #8
        bne _l1

_next_char
        ldx #0
        clc
        inc load_scroll_addr
        bne _l1
        inc load_scroll_addr+1
_l1     stx ZP_BIT_INDEX

        rts
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
animate_rumble
        ldx _anim_idx
        cpx #ANIM_SIZE
        bne _next

        lda #$00
        sta _anim_idx
        rts

_next   inc _anim_idx
        clc

        ; Left gamepad
        lda $d000 + 2 * 1
        clc
        adc _gamepad_left_x,x
        sta $d000 + 2 * 1

        lda $d001 + 2 * 1
        clc
        adc _gamepad_left_y,x
        sta $d001 + 2 * 1

        ; Right gamepad
        lda $d000 + 2 * 5
        clc
        adc _gamepad_right_x,x
        sta $d000 + 2 * 5

        lda $d000 + 2 * 6
        clc
        adc _gamepad_right_x,x
        sta $d000 + 2 * 6

        lda $d001 + 2 * 5
        clc
        adc _gamepad_right_y,x
        sta $d001 + 2 * 5

        lda $d001 + 2 * 6
        clc
        adc _gamepad_right_y,x
        sta $d001 + 2 * 6

        rts

_anim_idx       .byte $00
_gamepad_left_x
        .byte $02,$fe,$02,$fe,$02,$fe,$02,$fe
        ANIM_SIZE = * - _gamepad_left_x
_gamepad_left_y
        .byte $01,$ff,$00,$01,$00,$ff,$00,$00
_gamepad_right_x
        .byte $fe,$02,$fe,$02,$fe,$02,$fe,$02
_gamepad_right_y
        .byte $ff,$00,$01,$00,$ff,$01,$00,$00


;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Decruncher routine
decruncher
.logical $0400

        dec $01                         ;All RAM
        jsr exod_decrunch               ;jmp to decruncher
        inc $01                         ;RAM/IO/RAM

        cli
        jmp $080D                       ;Jump to main game

exod_get_crunched_byte
        ; In forward mode, "LDA" should happen before altering the pointer
_crunched_byte_lo = * + 1
_crunched_byte_hi = * + 2
        lda exo_game_head               ;self-modyfing. needs to be set correctly before
        inc _crunched_byte_lo
        bne _byte_skip_hi
        inc _crunched_byte_hi
_byte_skip_hi:
        inc $07e7
        dec $07e7
        rts                             ;decrunch_file is called.

        .include "exodecrunch.s"

.endlogical

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
end_intro
        sei

        lda $dd00                       ;Vic bank 0: $0000-$3FFF
        and #%11111100
        ora #3
        sta $dd00

        lda #%00001000                  ;no scroll, multi-color off, 40-cols
        sta $d016

        lda #%00010100                  ;screen addr 0x0400, charset at $1000
        sta $d018

        lda #%00011011                  ;bitmap mode disabled
        sta $d011

        asl $d019                       ;ack raster irq
        lda #0
        sta $d01a                       ;disable irq

        lda #$00                        ;Restore sprite expand 2x X/Y
        sta $d017                       ; Since game does not properly initialize them
        sta $d01d

        ldx #0
        lda #$20
_l0     sta $0400,x                     ;clears the screen memory
        sta $0500,x
        sta $0600,x
        sta $06e8,x
        inx                             ;1000 bytes = 40*25
        bne _l0

        lda #0                          ;ram color black
_l1     sta $d800,x
        sta $d900,x
        sta $da00,x
        sta $dae8,x
        inx
        bne _l1

        stx $d021                       ;background black
        stx $d418                       ;no volume

        lda #12                         ;L
        sta $07e4
        lda #9                          ;I
        sta $07e5
        lda #1                          ;A
        sta $07e6

        lda #15                         ;gray
        sta $dbe4
        sta $dbe5
        sta $dbe6
        sta $dbe7

        ldx #0                          ;decrunch table. clean it
_l2     sta $0200,x
        inx
        bne _l2

        ldx #0
_l3     lda decruncher,x                ;copy decruncher to $400
        sta $0400,x
        lda decruncher + $0100,x
        sta $0400 + $0100,x
        lda decruncher + $0200,x
        sta $0400 + $0200,x
        inx
        bne _l3

        ; Restore values
        ldx #$00                        ;Set as Input
        stx $dc03
        dex                             ;Set as Output
        stx $dc02

        jmp $0400

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Data

SCROLL_TEXT
        .enc "screen"
        .text '    L.I.A PRESENTS "RAMBO: FIRST BLOOD PART II" (NTSC & PAL)'
        .text "       "
        .text "THIS VERSION SUPPORTS  "
        .byte $40,$41,$42
        .text "  RUMBLE  "
        .byte $40,$41,$42
        .text "  "
        .byte $fe                       ;Pause
        .text "                  "
        .text "TEST IT WITH A MODERN ",$40,$41,$42," "
        .text "LIKE SONY DUALSENSE, "
        .text "DUALSHOCK 4, SWITCH PRO CONTROLLER, ETC...  "
        .text "THE ",$40,$41,$42," WILL "
        .text "VIBRATE (RUMBLE) WHEN RAMBO GETS HIT...  "
        .text "REQUIRES A UNIJOYSTICLE FLASHPARTY EDITION DEVICE...  "
        .text "PUT THE DEVICE IN ENHANCED MODE TO BE ABLE TO SWITCH WEAPONS WITH FIRE#1...  "
        .text "  "
        .text " ",$53, " ",$53, " ",$53                       ;Heart
        .text "  TO REBELION.DIGITAL, RETROCOMPUTACION.COM, PUNGAS DE VILLA MARTELLI, "
        .text "AND THE LATIN AMERICAN VINTAGE COMPUTER SCENE."
        .text "              "
        .text "PRESS SPACE TO START THE GAME, "
        .text 'PRESS "P" TO START '
        .text "MARTIN GALWAY'S MUSIC DEBUG PROGRAM.     "
        .text "GAME CRACKED AND IMPROVED BY RIQ/L.I.A"
        .text "                "
        .byte $ff                       ;End of scroll

image_color
        .binary "rambo-color.bin"

* = $1800
CHARSET_ADDR
        .binary "intro-charset.bin"


* = $2000
        .include "rambo-music.s"

        ; $3fff is used for open border
* = $4000
        .binary "rambo-bitmap.bin"

* = $6000
        .binary "rambo-screen.bin"

* = $6400
SPRITE_ADDR

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Fix offset so that $7fff matches with value $ff (garbage byte for open borders)
* = $7fff
        .byte $ff

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Uses forward crunch, the closer to the $ffff the better since it decompresses
; up to $ff00
* = $9200
exo_game_head
        .binary "../bin/rambo-lia-non-sfx-exo.prg"
exo_game_tail

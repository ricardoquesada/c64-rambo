;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
;
; Notes:
; Supports up to 14 sprites:
;       0-3: Enemy soldier (4)
;       4-8: Enemy bullets (5)
;       9-11: Hero bullets (3)
;       12-13: Hero + Hero overlay (2)
;
; During copter phase:
;       5-8: Enemy Copter
;       10: Hero missile
;

;
; **** ZP FIELDS ****
;
f02 = $02
f20 = $20
f2A = $2A
f2D = $2D
ZP_GAME_SPRITE_Y_TBL = $37              ;14 entries ($37-$44)
ZP_GAME_SPRITE_Y_COPY_TBL = $45         ;14 entries ($45-$52)
ZP_GAME_SPRITE_X_MSB_TBL = $53          ;14 entries ($53-$60)
ZP_GAME_SPRITE_X_MSB_COPY_TBL = $61     ;14 entries ($61-$6e)
ZP_GAME_SPRITE_X_TBL = $6F              ;14 entries ($6f-$7c)
ZP_GAME_SPRITE_X_COPY_TBL = $7D         ;14 entries ($7d-$8a)
                                        ; Contains X divided by 2 in Hero only (???)
ZP_GAME_SPRITE_FRAME_TBL = $8B          ;14 entries ($8B-$98)
ZP_GAME_SPRITE_COLOR_TBL = $99          ;14 entries ($99-$a6)
ZP_GAME_SPRITE_ORDER_TBL = $A7          ;14 entries ($a7-$b4)
ZP_GAME_SPRITE_ORDER_COPY_TBL = $B5     ;14 entries ($b5-$c2)
ZP_GAME_SPRITE_STATE_TBL = $C3          ;14 entries ($c3-$d0)
fD6 = $D6
fDA = $DA
fDE = $DE
;
; **** ZP ABSOLUTE ADRESSES ****
;
a01 = $01
a02 = $02                               ;In title, it is used as raster idx
                                        ; In game it is unused (?)
a04 = $04
a05 = $05
ZP_TMP_06 = $06
a09 = $09
ZP_GAME_HARD_SCROLL_DIR = $0A
ZP_GAME_ENERGY_TO_DECREASE = $0B        ;Ammount of energy to decrease to the player
ZP_DELTA_X = $0C
ZP_DELTA_Y = $0D
ZP_SELECTED_WEAPON = $0E                ;0=Knife, 1=Bazooka, 2=Arrow, 3=Grenade, 4=Gatling gun, 5=Missile
ZP_IS_GAME_OVER = $0F
a20 = $20
a21 = $21
a22 = $22
a23 = $23
a24 = $24
a25 = $25
a26 = $26
a27 = $27
a28 = $28
a29 = $29
a2A = $2A
a2B = $2B
a2C = $2C
a2D = $2D
a2E = $2E
a2F = $2F
a30 = $30
a31 = $31
a32 = $32
a33 = $33
aD1 = $D1                               ;Used for SPRITE FRAME 0 (?)
aD2 = $D2                               ; ditto above
aD3 = $D3
aD4 = $D4
aD5 = $D5
aE0 = $E0
aE1 = $E1
ZP_GAME_SMOOTH_Y = $E3
ZP_GAME_SMOOTH_X = $E4
aE6 = $E6
aF0 = $F0
aF1 = $F1
aF2 = $F2
aF3 = $F3
aF4 = $F4
aF5 = $F5
aF6 = $F6
aF7 = $F7
ZP_GAME_MAP_OFFSET_X = $F8              ;Goes from $00 to $5a (90)
aFA = $FA
ZP_NEXT_RASTER_IRQ_POS = $FB            ;In game, it is used as next raster position
aFB = $FB                               ; but in Title, it is used as a pointer
                                        ; so keeping both references
ZP_GAME_SPRITE_IDX_TO_PROCESS = $FC     ;In game, saves the next sprite index to process
aFC = $FC                               ; but in Title is used as a pointer
                                        ; so keeping both references
aFD = $FD
ZP_MAP_OFFSET_Y_LSB = $FE               ;Game: Map offset Y LSB (goes from $0018 to $03b8)
ZP_MAP_OFFSET_Y_MSB = $FF               ;Game: Map offset Y MSB (             24 to 952)
aFE = $FE                               ;Menu: Something else
aFF = $FF

;
; **** ZP POINTERS ****
;
p20 = $20
p22 = $22
p24 = $24
p26 = $26
p30 = $30                               ;Points to Screen RAM
p32 = $32
p60 = $60
pC4 = $C4
pF0 = $F0
pF4 = $F4
pFA = $FA
pFB = $FB
pFC = $FC
pFD = $FD
pFE = $FE
;
; **** FIELDS ****
;
f00E0 = $00E0
;
; **** ABSOLUTE ADRESSES ****
;
a028A = $028A
a7ED8 = $7ED8                           ;Updating charset?

;
; **** POINTERS ****
;
p0026 = $0026

;
; **** MACROS ****
;
; String codes
STR_CODE_END            .MACRO
        .BYTE $ff,$00
                        .ENDM
STR_CODE_SET_COORDS    .MACRO y, x
        .BYTE $ff,$01,\y,\x
                        .ENDM
STR_CODE_SET_COLOR      .MACRO c
        .BYTE $ff,$02,\c
                        .ENDM
STR_CODE_CLR_SCREEN     .MACRO chr,color
        .BYTE $ff,$03,\chr,\color
                        .ENDM
STR_CODE_FONT_BIG       .MACRO
        .BYTE $ff,$04
                        .ENDM
STR_CODE_FONT_SMALL     .MACRO
        .BYTE $ff,$05
                        .ENDM
; Define a music note, which
; is a single note
MUSIC_NOTE             .MACRO x, code_addr, y, z
        .BYTE \x
        .WORD \code_addr
        .BYTE \y, \z
                        .ENDM
; Define a music patch, which is a collection
; of music notes
MUSIC_PATCH             .MACRO x, note_list_addr
        .BYTE \x
        .WORD \note_list_addr
                        .ENDM



;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
        * = $0334

        JMP GAME_SPRITE_SYNC_PROPERTIES

GAME_SPRITE_SORT_BIS
        JMP GAME_SPRITE_SORT

GAME_READ_JOYSTICK_BIS
        JMP GAME_READ_JOYSTICK

GAME_MAYBE_SELECT_NEXT_WEAPON_BIS
        JMP GAME_MAYBE_SELECT_NEXT_WEAPON

GAME_DO_HARD_SCROLL_BIS
        JMP GAME_DO_HARD_SCROLL

GAME_MAP_PAINT_BIS
        JMP GAME_MAP_PAINT

        JMP GAME_WAIT_RASTER_TICK_VAR

        JMP GAME_WAIT_RASTER_TICK_DB

GAME_PLAY_MUSIC_BIS
        JMP GAME_PLAY_MUSIC

GAME_UPDATE_SPRITE_SCORE_BIS
        JMP GAME_UPDATE_SPRITE_SCORE

GAME_UPDATE_SCORE_FROM_POINTS_BIS
        JMP GAME_UPDATE_SCORE_FROM_POINTS

        JMP j123A

GAME_UPDATE_SPRITE_ENERGY_BIS
        JMP GAME_UPDATE_SPRITE_ENERGY

GET_SCORE_BCD_DIGIT_BIS
        JMP GET_SCORE_BCD_DIGIT

        JMP GAME_INIT

GAME_MAYBE_PLAY_SFX_BIS
        JMP GAME_MAYBE_PLAY_SFX

GAME_SPRITE_SYNC_PROPERTEIS_AFTER_RASTER_BIS
        JMP GAME_SPRITE_SYNC_PROPERTIES_AFTER_RASTER

GAME_INIT_BIS
        JMP GAME_INIT

s036A   JMP j1659

        JMP j0B2B

        JMP GAME_DISABLE_JOYSTICK       ;Unused

        JMP GAME_ENABLE_JOYSTICK        ;Unused

GAME_PRINT_GAME_OVER_BIS
        JMP GAME_PRINT_GAME_OVER

RESET_SCORE_BIS
        JMP RESET_SCORE

SET_LOCAL_POINTS_BIS
        JMP SET_LOCAL_POINTS

GAME_PRINT_MSG_AND_THEN_GAME_OVER_BIS
        JMP GAME_PRINT_MSG_AND_THEN_GAME_OVER

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $0382
; Game init (not main menu)
GAME_INIT
        JSR s16DA
        JSR GAME_COPY_ORIG_MAP
        LDA #12
        JSR MUSIC_FN
        LDA #$FF                        ;Select all sprites
        STA $D015                       ;Sprite display Enable
        CLI

_GAME_MAIN_LOOP
        JSR GAME_SPRITE_SYNC_PROPERTIES_AFTER_RASTER
        JSR GAME_MAP_PAINT
        JSR GAME_DO_HARD_SCROLL
        JSR j0B2B
        JSR s0F6C

        INC a0559                       ;Not clear why this check is
        LDA a0559                       ; To reduce the speed?
        CMP #$06
        BCC _L00

        LDA #$00
        STA a0559
        JMP _L01

_L00    JSR GAME_MAYBE_PLAY_BASE_DISCOVERED_SFX
        JSR s12A7
        JSR s1985
        JSR GAME_PLAY_MUSIC
        JSR GAME_READ_JOYSTICK
        JSR GAME_CHECK_DESTROY_TERRAIN
        JSR GAME_UPDATE_SPRITE_SCORE
        JSR GAME_UPDATE_SCORE_FROM_POINTS
        JSR GAME_CHECK_HERO_FIRE_BULLET
        JSR j123A
        JSR s1819
        JSR s25C8
        JSR s0E5B
        JSR s152E
        JSR s0BF9
        JSR s0C49
        JSR s0A41
        JSR s0D99
        JSR GAME_MAYBE_SELECT_NEXT_WEAPON
        JSR GAME_UPDATE_SPRITE_ENERGY
        JSR s0900
        JSR GAME_MAYBE_PRINT_GAME_OVER

_L01    JSR GAME_SPRITE_SORT
        JMP _GAME_MAIN_LOOP

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s03FC   LDY #13
_L00    LDX ZP_GAME_SPRITE_ORDER_COPY_TBL,Y
        LDA ZP_GAME_SPRITE_Y_COPY_TBL,X
        BNE _L01
        DEY
        BPL _L00
        INY
_L01    STY ZP_GAME_SPRITE_IDX_TO_PROCESS
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Play the "base discovered" SFX if hero is at correct Y position
; Bug: this SFX might be played multiple times per game
GAME_MAYBE_PLAY_BASE_DISCOVERED_SFX
        LDA ZP_MAP_OFFSET_Y_MSB         ;MSB out of range?
        BNE _L00                        ; yes, jump

        LDA ZP_MAP_OFFSET_Y_LSB         ;LSB out of range?
        CMP #$88
        BCC _L00                        ; yes, jump
        CMP #$F0
        BCS _L00                        ; yes, jump

        LDX _SFX_ALREADY_PLAYED
        BNE _EXIT

        INC _SFX_ALREADY_PLAYED

        LDA #$04                        ;Play SFX
        JMP MUSIC_FN                    ; and return

_L00    LDX #$00
        STX _SFX_ALREADY_PLAYED

_EXIT   RTS

_SFX_ALREADY_PLAYED
        .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Params: X: Digit to update
;         A: Value to set
SET_LOCAL_POINTS
        STA LOCAL_POINTS,X
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
RESET_SCORE
        LDX #$05
        LDA #$00
_L00    STA LOCAL_POINTS,X
        STA PLYR_SCORE,X
        DEX
        BPL _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_MAYBE_PRINT_GAME_OVER
        LDA ZP_IS_GAME_OVER
        BNE GAME_PRINT_GAME_OVER
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; A=Message to print
; Called with "4" all the time
GAME_PRINT_MSG_AND_THEN_GAME_OVER
        JSR _PRINT_MESSAGES
        DEC ZP_IS_GAME_OVER
        JMP GAME_INIT

_PRINT_MESSAGES
        INC ZP_IS_GAME_OVER
        JSR GAME_PRINT_STRING

        ; Fallthrough

GAME_PRINT_GAME_OVER
        LDA #$03                        ;Message to print "GAME OVER"
        JMP GAME_PRINT_STRING

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0456   LDA a0B29
        BEQ GAME_PRINT_STRING

        LDX aE6
        BEQ _L00

        LDX a0912
        BNE _L00

        LDA #$03                        ;Message to print: "GAME OVER"
        STA ZP_IS_GAME_OVER
        BNE GAME_PRINT_STRING

_L00    CLC
        ADC a0912

        ; Fallthrough

GAME_PRINT_STRING
        PHA                             ;A = String to print
        STA a0558

        ; Setup screen to print message
        SEI
        LDA #$00
        STA $D015                       ;Sprite display Enable
        STA $D021                       ;Background Color 0
        LDA #$08                        ;#%00001000
        STA $D016                       ;VIC Control Register 2
        LDA #$1B                        ;#%00011011
        STA $D011                       ;VIC Control Register 1
        LDA #$01
        JSR MUSIC_FN

        LDY #$1F
_L00    LDA f00E0,Y                     ;Backup $E0-$FF
        STA BACKUP_E0_FF,Y
        DEY
        BPL _L00

        JSR PRINT_EXT_STR_BIS
        .ADDR STR_CLEAR_SCREEN_BIS

        LDA #$00
        JSR SWAP_CHARSETS_BIS

        LDX #$07
        LDA #26
        JSR MUSIC_FN

        PLA                             ;The message to print

        ASL A
        TAX
        LDA IN_GAME_MSG_STR_TBL,X
        STA _STR_ADDR                   ;LSB
        LDA IN_GAME_MSG_STR_TBL+1,X
        STA _STR_ADDR+1                 ;MSB
        LDA IN_GAME_MSG_MUSIC_TBL,X
        JSR MUSIC_FN

        JSR PRINT_EXT_STR_BIS
_STR_ADDR
        .ADDR IN_GAME_MSG_STR_TBL       ;This address is changed in runtime

_L01    LDA $D012                       ;Raster Position
        CMP #$C8                        ;Wait until raster gets to $c8
        BNE _L01

        JSR GAME_PLAY_MUSIC

        LDA #$02
        JSR MUSIC_FN                    ;Music finished?
        BEQ _L02                        ; Yes, exit loop
        BNE _L01                        ; No, keep playing it

_L02    JSR VIC_SCREEN_DISABLE
        LDA #$01                        ;Turn off music
        JSR MUSIC_FN

        LDA #$00                        ;Use "map" charset
        JSR SWAP_CHARSETS_BIS

        LDA #$FF
        STA $D015                       ;Sprite display Enable
        LDA #12
        JSR MUSIC_FN
        LDX a0D23
        LDA #26
        JSR MUSIC_FN
        LDA #$0B                        ;Color Grey 1 (dark)
        STA $D021                       ;Background Color 0

        JSR PRINT_EXT_STR_BIS
        .ADDR a0586

        LDY #$1F                        ;Restore $E0-$FF values
_L03    LDA BACKUP_E0_FF,Y
        STA f00E0,Y
        DEY
        BPL _L03

        LDA ZP_IS_GAME_OVER
        BNE _L04
        JSR s0513
        CLI
        RTS

_L04    PLA                             ;On game over, skip on caller
        PLA
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0513   LDX a0558
        BEQ b054E
        DEX
        LDA f055F,X
        STA ZP_MAP_OFFSET_Y_LSB
        LDA f0561,X
        STA ZP_MAP_OFFSET_Y_MSB
        LDA f0563,X
        STA ZP_GAME_MAP_OFFSET_X
        LDA #$28
        STA a0565
b052D   LDA #$08                        ;Scroll left
        STA ZP_GAME_HARD_SCROLL_DIR
        JSR GAME_DO_HARD_SCROLL
        JSR GAME_MAP_PAINT
        DEC a0565
        BNE b052D
        LDA #$00
        STA ZP_GAME_HARD_SCROLL_DIR
        LDA #$10                        ;Smooth-x = 0
        STA $D016                       ;VIC Control Register 2
        JSR VIC_SCREEN_ENABLE
        JSR s1F9B
        JMP j1DD5

b054E   LDA #$01
        STA ZP_IS_GAME_OVER
        PLA
        PLA
        PLA
        PLA
        CLI
        RTS

a0558   .BYTE $00
a0559   .BYTE $00
a055A   .BYTE $00
f055B   .BYTE $00,$00,$00,$00
f055F   .BYTE $4A,$BF
f0561   .BYTE $01,$00
f0563   .BYTE $05,$13
a0565   .BYTE $00

        ;32 bytes to backup values from $E0 to $FF
BACKUP_E0_FF
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00

a0586   #STR_CODE_CLR_SCREEN $20,$0D
        #STR_CODE_END

        ; Music song to play for each text
        ; They are duplicated to simplify code
IN_GAME_MSG_MUSIC_TBL
        .BYTE $0B,$0B
        .BYTE $06,$06
        .BYTE $07,$07
        .BYTE $0B,$0B
        .BYTE $0A,$0A

IN_GAME_MSG_STR_TBL
        .ADDR STR_RESCUE_POWS
        .ADDR STR_RESCUE_POWS2
        .ADDR STR_GUNSHIP_IN_PURSUIT
        .ADDR STR_GAME_OVER
        .ADDR STR_CONGRATULATIONS_YOU_WON

STR_RESCUE_POWS
        #STR_CODE_SET_COORDS $01,$03
        #STR_CODE_SET_COLOR $01
        #STR_CODE_FONT_BIG
        .TEXT "TASK[ONE[COMPLETED."
        #STR_CODE_SET_COORDS $02,$06
        #STR_CODE_SET_COLOR $05
        .TEXT "YOUR[DATA[REVEALS"
        #STR_CODE_SET_COORDS $03,$09
        .TEXT "AMERICAN[P.O.W.S"
        #STR_CODE_SET_COORDS $06,$0C
        .TEXT "TO[BE[RESCUED."
        #STR_CODE_END

STR_RESCUE_POWS2
        #STR_CODE_SET_COORDS $01,$03
        #STR_CODE_SET_COLOR $01
        #STR_CODE_FONT_BIG
        .TEXT "TASK[ONE[COMPLETED."
        #STR_CODE_SET_COORDS $05,$06
        #STR_CODE_SET_COLOR $03
        .TEXT "NOW[RESCUE[THE"
        #STR_CODE_SET_COORDS $0C,$09
        .TEXT "P.O.W.S"
        #STR_CODE_SET_COORDS $06,$0C
        .TEXT "FROM[THE[CAMP."
        #STR_CODE_SET_COORDS $06,$0F
        #STR_CODE_SET_COLOR $0A
        .TEXT "USE[ANY[ENEMY"
        #STR_CODE_SET_COORDS $00,$12
        .TEXT "EQUIPMENT[NECESSARY."
        #STR_CODE_END

STR_GUNSHIP_IN_PURSUIT
        #STR_CODE_SET_COORDS $07,$03
        #STR_CODE_SET_COLOR $01
        #STR_CODE_FONT_BIG
        .TEXT "YOUR[PRESENCE"
        #STR_CODE_SET_COORDS $04,$06
        .TEXT "HAS[BEEN[RELAYED"
        #STR_CODE_SET_COORDS $08,$09
        .TEXT "TO[ENEMY[H.Q."
        #STR_CODE_SET_COORDS $08,$0C
        #STR_CODE_SET_COLOR $05
        .TEXT "A[GUNSHIP[IS"
        #STR_CODE_SET_COORDS $07,$0F
        .TEXT "NOW[ON[COURSE"
        #STR_CODE_SET_COORDS $06,$12
        .TEXT "AND[IN[PURSUIT."
        #STR_CODE_END

STR_GAME_OVER
        #STR_CODE_SET_COORDS $0B,$0B
        #STR_CODE_SET_COLOR $01
        #STR_CODE_FONT_BIG
        .TEXT "GAME[OVER"
        #STR_CODE_END

STR_CONGRATULATIONS_YOU_WON
        #STR_CODE_SET_COLOR $01
        #STR_CODE_SET_COORDS $05,$00
        .TEXT "CONGRATULATIONS."
        #STR_CODE_SET_COLOR $03
        #STR_CODE_SET_COORDS $07,$03
        .TEXT "THANKS[TO[YOU"
        #STR_CODE_SET_COORDS $04,$06
        .TEXT "TEN[P.O.W.S[HAVE"
        #STR_CODE_SET_COORDS $07,$09
        .TEXT "BEEN[RETURNED"
        #STR_CODE_SET_COORDS $05,$0C
        .TEXT "TO[THE[HOMEL", $E8, "."          ;Bug: Should say HOMELAND.
                                                ; Present in ThunderMontain version only
                                                ; Ocean version doesn't have it.
        #STR_CODE_SET_COLOR $07
        #STR_CODE_SET_COORDS $02,$0F
        #STR_CODE_FONT_SMALL
        .TEXT "YOU[KNOW[YOU[MUST[NOW[RETURN[TO[GET"
        #STR_CODE_SET_COORDS $03,$11
        .TEXT "MORE[UNFORTUNATE[SOLDIERS[TRAPPED"
        #STR_CODE_SET_COORDS $0C,$13
        .TEXT "BY[ENEMY[FORCES<"                ; '<' is a period in small font
        #STR_CODE_END

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Unused
GAME_DISABLE_JOYSTICK
        LDA #$01
        STA GAME_IS_JOYSTICK_DISABLED
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Unused
GAME_ENABLE_JOYSTICK
        LDA #$00
        STA GAME_IS_JOYSTICK_DISABLED
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SPRITE_SYNC_PROPERTIES_AFTER_RASTER
        JSR GAME_WAIT_RASTER_TICK_VAR
        JSR GAME_SPRITE_SYNC_PROPERTIES
        JMP GAME_WAIT_RASTER_TICK_DB

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Game uses one byte to store one digit.
; HI-Score table uses 1 byte to store two digits.
; This functions returns 2 score digits in one byte
; Parms: X: Digit to return (from 0,2)
GET_SCORE_BCD_DIGIT
        TXA
        PHA
        ASL A                           ;Index * 2
        TAX
        LDA PLYR_SCORE+1,X
        STA TMP_2493
        LDA PLYR_SCORE,X
        ASL A
        ASL A
        ASL A
        ASL A                           ;Move MSB to 4 MSB bits
        ORA TMP_2493
        STA TMP_2493
        PLA
        TAX
        LDA TMP_2493                    ;LSB uses 4 LSB bits
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j07FB   LDX #$03
        STX a0827
_L00    LDA f086E,X
        BEQ _L01
        JSR s0872
        JMP _L02

_L01    JSR _L03
_L02    DEX
        BPL _L00
        LDA POWS_TO_RESCUE
        BNE _EXIT
        LDA a0827
        BPL _EXIT
        LDA #$00
        STA a0966
        STA a0967
        STA a0B2A
_EXIT   RTS

a0827   .BYTE $00

_L03    LDA a0966
        CMP #$01
        BEQ _L04
        RTS

_L04    DEC a0827
        LDA POWS_TO_RESCUE
        BNE _L05
        RTS

_L05    DEC _DELAY_BETWEEN_POWS
        BEQ _CREATE_ESCAPING_POW
        RTS

_DELAY_BETWEEN_POWS
        .BYTE $00

; Rescue one POW
_CREATE_ESCAPING_POW
        LDA #50                         ;Delay between POWs
        STA _DELAY_BETWEEN_POWS
        LDA a0968
        STA ZP_GAME_SPRITE_Y_COPY_TBL,X
        LDA a0969
        STA ZP_GAME_SPRITE_X_COPY_TBL,X
        LDA #207                        ;Frame: POW anim #00
        STA ZP_GAME_SPRITE_FRAME_TBL,X
        LDA #$0C                        ;Color Gray 2
        STA ZP_GAME_SPRITE_COLOR_TBL,X

        DEC POWS_TO_RESCUE

        LDA #$14
        STA f086E,X
        LDA #$00
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
        LDA #$01
        STA ZP_GAME_SPRITE_STATE_TBL,X
        LDA #$02                        ;Set 2000 points
        STA LOCAL_POINTS+2
        RTS

POWS_TO_RESCUE
        .BYTE 10
f086E   .BYTE $00,$00,$00,$00

s0872   CMP #$01
        BEQ _L00
        JMP _L05

_L00    INC ZP_GAME_SPRITE_X_COPY_TBL,X
        BNE _L01
        LDA #$01
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
_L01    JSR _L07
        BCC _L03
        LDA ZP_GAME_SPRITE_FRAME_TBL,X
        CMP #214                        ;Frame: POW facing right (last frame)
        BNE _L02
        LDA #211-1                      ;Frame: POW facing right (first frame)
_L02    CLC
        ADC #$01
        STA ZP_GAME_SPRITE_FRAME_TBL,X
_L03    LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
        LSR A
        LDA ZP_GAME_SPRITE_X_COPY_TBL,X
        ROR A
        CMP #170
        BEQ _L04
_EXIT   RTS

_L04    LDA #$00
        STA f086E,X
        DEC ZP_GAME_SPRITE_STATE_TBL,X
        RTS

_L05    INC ZP_GAME_SPRITE_Y_COPY_TBL,X
        DEC f086E,X
        JSR _L07
        BCC _EXIT
        LDA ZP_GAME_SPRITE_FRAME_TBL,X
        CMP #210                        ;Frame: POW facing down (last frame)
        BNE _L06
        LDA #207-1                      ;Frame: POW facing down (1st frame)
_L06    CLC
        ADC #$01
        STA ZP_GAME_SPRITE_FRAME_TBL,X
        RTS

_L07    LDA f08CF,X
        BNE _L08
        LDA #$02
        STA f08CF,X
        SEC
        RTS

_L08    DEC f08CF,X
        CLC
        RTS

f08CF   .BYTE $00,$00,$00,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j08D4   LDX #$00
        LDA a0968
        CLC
        ADC ZP_DELTA_Y
        STA a0968

        LDA a0966
        CMP #$01
        BEQ _L00
        DEC a0966

        LDX #$02                        ;Down
_L00    STX GAME_JOY_STATE
        STX GAME_JOY_LATEST_MOVEMENT
        STX GAME_JOY_STATE_COPY
        STX GAME_JOY_STATE_COPY2
        STX a1D64
        STX a1D65
        JMP j07FB

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0900   LDA ZP_SELECTED_WEAPON          ;Weapon used
        BNE _EXIT0                      ; Knife? No

        LDA a161E
        CMP #$E0
        BEQ _L01

_EXIT0  RTS

_L01    LDA a0912
        BEQ _L02
        RTS

a0912   .BYTE $00

_L02    LDA a0B2A
        BNE _L03
        RTS

_L03    LDA a0966
        BNE _EXIT1

        INC a0912
        INC a0967
        LDA #$28
        STA a0966
        LDA #$33
        STA a1299
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+13
        STA a1931
        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        STA a1932
        LDA #10
        STA POWS_TO_RESCUE
        LDA #$00
        STA a1933

        JSR s1366

        LDA a2747
        ASL A
        ASL A
        ASL A
        CLC
        ADC #$1A
        ADC ZP_GAME_SMOOTH_Y
        STA a0968
        LDA aF3
        ASL A
        ASL A
        ASL A
        ADC ZP_GAME_SMOOTH_X
        STA a0969

        JSR s0AB7

        LDA #27
        JMP MUSIC_FN
_EXIT1  RTS

a0966   .BYTE $00
a0967   .BYTE $00
a0968   .BYTE $00
a0969   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s096A   LDX #$04
        LDA #$00
_L00    STA GAME_CURRENT_ENEMY_STATE_TBL,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL,X
        DEX
        BPL _L00

        LDX #$06
_L01    STA f1961,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        DEX
        BPL _L01
        RTS

a0981   .BYTE $00
a0982   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0983   LDA #$00
        JSR SWAP_CHARSETS_BIS

        LDA #$01                        ;Color White
        STA GAME_SCREEN_CLEAR_COLOR
        LDA #$1A
        LDX #$07
        JSR MUSIC_FN
        LDA #$01                        ;Stop music (?)
        JSR MUSIC_FN
        LDA #$09
        JSR MUSIC_FN

        JSR GAME_READ_JOYSTICK
        LDA GAME_JOY_STATE
        STA a0981

        JSR PRINT_EXT_STR_BIS
        .ADDR STR_READY

        JSR VIC_SCREEN_ENABLE

_L00    LDA $D012                       ;Raster Position
        CMP #$64
        BNE _L00

        LDA #$00                        ;Play music
        JSR MUSIC_FN
        LDA #$02
        JSR MUSIC_FN

        BEQ _L02
        JSR _L01
        BEQ _L00
        JMP _L02

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
_L01    JSR GAME_READ_JOYSTICK
        LDA GAME_JOY_STATE
        STA a0982
        CMP a0981
        BEQ _EXIT
        STA a0981
        LDA a0982
        AND #$10
_EXIT   RTS

_L02    JSR VIC_SCREEN_DISABLE
        LDA #$0D                        ;Color Light Green
        STA GAME_SCREEN_CLEAR_COLOR

        JSR PRINT_EXT_STR_BIS
        .ADDR STR_CLEAR_SCREEN_BIS

        LDA #$00
        JSR SWAP_CHARSETS_BIS

        ; Fallthrough

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Copy $E770-$EEE0 to $E000
; Copies the original copy of the map to $E000 since the map can be modified
; in runtime: trees, buildings, etc can get destroyed with the bazooka
GAME_COPY_ORIG_MAP
        LDA #>MAP_TILES
        STA _MAP_MSB_DST
        LDA #>MAP_TILES_ORIG
        STA _MAP_MSB_SRC
        LDX #$06
        LDY #$00
_MAP_MSB_SRC = *+$02
_L00    LDA MAP_TILES_ORIG,Y            ;Modified in runtime
_MAP_MSB_DST = *+$02
        STA MAP_TILES,Y                 ;Modified in runtime
        DEY
        BNE _L00
        INC _MAP_MSB_SRC
        INC _MAP_MSB_DST
        DEX
        BPL _L00

        LDY #$6F
_L01    LDA MAP_TILES_ORIG + $0700,Y
        STA MAP_TILES + $0700,Y
        DEY
        BPL _L01
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_MAYBE_TOGGLE_PAUSE
        LDA #%00111111                  ;Stop key: Row=7, Col=7
        JSR IS_KEY_PRESSED
        BCC _L00                        ;Not pressed

        ; Toggle pause
        LDA _ALREADY_PRESSED
        BNE _EXIT
        LDA IS_GAME_PAUSED
        EOR #$01
        STA IS_GAME_PAUSED
        LDA #$01
        STA _ALREADY_PRESSED
_EXIT   RTS

_L00    LDA #$00
        STA _ALREADY_PRESSED
        RTS

_ALREADY_PRESSED        .BYTE $00
IS_GAME_PAUSED          .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0A41   LDA ZP_GAME_SPRITE_Y_COPY_TBL+12
        CMP #$0A
        BNE _L00
        RTS

_L00    STA a25C4
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+13
        STA a25C5
        LDA ZP_GAME_SPRITE_X_COPY_TBL+12
        STA a25C0
        LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL+12
        STA a25C1
        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        STA a25C2
        LDA #$00
        STA a25C3
        LDA #$0C
        STA a25C7
        LDA #$0A
        STA a25C6
        JSR s257D
        BCS _L01
        RTS

_L01    LDX a0BE0
        LDA f0BED,X
        BMI _L02

        ; Weapon picked up
        ORA WEAPONS_PICKED_UP
        STA WEAPONS_PICKED_UP
        TXA
        PHA
        JSR s1985
        PLA
        TAX
        CPX #$03
        BEQ b0ADC

        LDA #$00
        STA f0BED,X
        LDA #$03                        ;Set 3000 points
        STA LOCAL_POINTS+2
        LDA #$1E
        JSR GAME_MAYBE_PLAY_SFX
        JMP j0BC9

_L02    LDA ZP_SELECTED_WEAPON          ;Weapon used
        BNE _EXIT                       ; Knife? No

        ; First prisoner rescued
        STA f0BED,X
        INC a0B29
        LDA #$05                        ;Set 5000 points
        STA LOCAL_POINTS+2
        LDA #$1E
        JSR GAME_MAYBE_PLAY_SFX
        JMP j0BC9

_EXIT   RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Reset sprites 0-11 positions (?)
s0AB7
        LDX #$04
_L00    LDA #$00
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
        STA ZP_GAME_SPRITE_STATE_TBL+5,X
        STA ZP_GAME_SPRITE_STATE_TBL+7,X
        STA ZP_GAME_SPRITE_STATE_TBL,X
        STA f1961,X
        STA f1963,X
        STA GAME_CURRENT_ENEMY_STATE_TBL,X
        STA a101E
        STA a101D
        STA ZP_GAME_SPRITE_Y_COPY_TBL,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+7,X          ;Overwrites previous value
        DEX
        BPL _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Copter sequence starts here
b0ADC
        JSR s0AB7
        LDA #$00
        STA ZP_GAME_SPRITE_STATE_TBL+13
        STA ZP_GAME_ENERGY_TO_DECREASE
        JSR s0456
        LDA #$01
        STA COPTER_MODE_ENABLED
        STA a0967
        STA a0B2A
        JSR RESET_ENERGY_SPRITE
        LDA a0912
        JSR s3003
        LDA #$00
        STA COPTER_MODE_ENABLED
        STA ZP_GAME_ENERGY_TO_DECREASE
        STA a0967
        INC ZP_GAME_SPRITE_STATE_TBL+13
        LDA #$B2
        STA a0BE8
        LDA #$00
        STA a0BEC
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL+13
        LDA #$4F
        STA a0BE4
        STX ZP_GAME_SPRITE_X_COPY_TBL+13
        STY ZP_GAME_SPRITE_Y_COPY_TBL+13
        JSR s1F9B
        JSR j1DD5
        JSR RESET_ENERGY_SPRITE
        JMP j12DF

a0B29   .BYTE $00
a0B2A   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j0B2B   LDX #$03
j0B2D   LDA f0BED,X
        BNE _L01
_L00    JMP _L04

_L01    LDA f0BE1,X
        SEC
        SBC ZP_GAME_MAP_OFFSET_X
        BCC _L00
        CMP #$2D     ;#%00101101
        BCS _L00
        TAY
        LDA ZP_MAP_OFFSET_Y_MSB
        CMP f0BE9,X
        BCC _L00
        LDA ZP_MAP_OFFSET_Y_LSB
        CMP f0BE5,X
        BCC _L00
        LDA ZP_MAP_OFFSET_Y_LSB
        SEC
        SBC f0BE5,X
        STA a2745
        LDA ZP_MAP_OFFSET_Y_MSB
        SBC f0BE9,X
        STA a2746
        LDA a2746
        BNE _L00
        LDA a2745
        CMP #$15     ;#%00010101
        BCS _L00
        ASL A
        ASL A
        ASL A
        CLC
        ADC ZP_GAME_SMOOTH_Y
        CLC
        ADC #31
        STA ZP_GAME_SPRITE_Y_COPY_TBL+12
        TYA
        ASL A
        ASL A
        ASL A
        PHA
        LDA #$00
        ROL A
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL+12
        PLA
        CLC
        ADC ZP_GAME_SMOOTH_X
        STA ZP_GAME_SPRITE_X_COPY_TBL+12

        LDA f0BF5,X
        STA ZP_GAME_SPRITE_FRAME_TBL+12
        STX a0BE0
        LDA #$01
        STA ZP_GAME_SPRITE_STATE_TBL+12
        CPX #$03
        BNE _L03

        LDA #$0E                        ;Color Light Blue
        STA ZP_GAME_SPRITE_COLOR_TBL+12
        STA ZP_GAME_SPRITE_COLOR_TBL+4

        LDA ZP_GAME_SPRITE_FRAME_TBL+12
        CLC
        ADC #$01
        STA ZP_GAME_SPRITE_FRAME_TBL+4

        LDA ZP_GAME_SPRITE_Y_COPY_TBL+12
        STA ZP_GAME_SPRITE_Y_COPY_TBL+4

        LDA ZP_GAME_SPRITE_X_COPY_TBL+12
        SEC
        SBC #24
        STA ZP_GAME_SPRITE_X_COPY_TBL+4

        LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL+12
        BCS _L02
        EOR #$01
_L02    STA ZP_GAME_SPRITE_X_MSB_COPY_TBL+4

        LDA #$01
        STA ZP_GAME_SPRITE_STATE_TBL+4
        RTS

_L03    LDY a1B70
        LDA f1B71,Y
        STA ZP_GAME_SPRITE_COLOR_TBL+12
        RTS

_L04    DEX
        BPL b0BDD

j0BC9   LDA #$00
        STA ZP_GAME_SPRITE_STATE_TBL+12
        LDA #$00
        STA ZP_GAME_SPRITE_Y_COPY_TBL+12
        LDA a120F
        BNE _EXIT
        STA ZP_GAME_SPRITE_Y_COPY_TBL+4
        LDA #$00
        STA ZP_GAME_SPRITE_STATE_TBL+4
_EXIT   RTS

b0BDD   JMP j0B2D

a0BE0   .BYTE $00
f0BE1   .BYTE $60,$37,$25
a0BE4   .BYTE $32
f0BE5   .BYTE $51,$9A,$CA
a0BE8   .BYTE $40
f0BE9   .BYTE $00,$00,$00
a0BEC   .BYTE $01
f0BED   .BYTE $10,$08,$FF,$20
f0BF1   .BYTE $10,$08,$FF,$20
f0BF5   .BYTE $23,$24,$D7,$B9

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0BF9   LDX a0C0F
        LDA GAME_CURRENT_ENEMY_STATE_TBL,X
        CMP #$01
        BNE _L00
        JSR s0C10
_L00    DEX
        BPL _L01
        LDX #$03
_L01    STX a0C0F
        RTS

a0C0F   .BYTE $00

s0C10   LDA ZP_GAME_SPRITE_Y_COPY_TBL,X
        STA a25C4
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+13
        STA a25C5
        LDA ZP_GAME_SPRITE_X_COPY_TBL,X
        STA a25C0
        LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
        STA a25C1
        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        STA a25C2
        LDA #$00
        STA a25C3
        LDA #$0C
        STA a25C7
        LDA #$0A
        STA a25C6
        JSR s257D
        BCC b0C48
        LDA ZP_GAME_ENERGY_TO_DECREASE
        ADC #$03
        STA ZP_GAME_ENERGY_TO_DECREASE
        TXA
        TAY
        JMP ONE_ENEMY_KILLED

b0C48   RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0C49   LDX a0C9B
        LDA f1961,X
        BEQ _L00
        JSR s0C5D
_L00    DEX
        BPL _L01
        LDX #$03
_L01    STX a0C9B
        RTS

s0C5D   LDA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        STA a25C4
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+13
        STA a25C5
        LDA ZP_GAME_SPRITE_X_COPY_TBL+5,X
        ASL A
        STA a25C0
        LDA #$00
        ROL A
        STA a25C1
        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        STA a25C2
        LDA #$00
        STA a25C3
        LDA #$0C
        STA a25C7
        LDA #$0A
        STA a25C6
        JSR s257D
        BCC _EXIT
        LDA ZP_GAME_ENERGY_TO_DECREASE
        ADC #$06
        STA ZP_GAME_ENERGY_TO_DECREASE
        LDA #24
        JSR GAME_MAYBE_PLAY_SFX
        JMP j25E4

_EXIT   RTS

a0C9B   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
RESET_ENERGY_SPRITE
        LDX #20                         ;Update 21 bytes: 7 rows * 3 columns
_L00    LDA $4000+64*33,X               ;Original energy: left
        STA $4000+64*16,X               ;Player Energy left
        LDA $4000+64*33+21,X            ;Original Energy right
        STA $4000+64*17,X               ;Player Energy right
        DEX
        BPL _L00

        LDA #48                         ;48 = width of 2 sprites (24*2)
        STA PLYR_ENERGY
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_UPDATE_SPRITE_ENERGY
        LDA ZP_GAME_ENERGY_TO_DECREASE
        BEQ _EXIT

        ; Rumble code should go here

        DEC ZP_GAME_ENERGY_TO_DECREASE
        DEC PLYR_ENERGY
        BPL _L00

        LDA #$01
        STA ZP_IS_GAME_OVER
        RTS

_L00    LDA PLYR_ENERGY
        PHA
        LSR A
        LSR A
        LSR A                           ;A = Energy / 8 (goes from 0 to 5)
        CMP #$03                        ;Between 0 and 2?
        BCC _L01                        ; Yes, Jump (1st sprite)
        CLC
        ADC #64-3                       ;Next sprite (2nd sprite)

_L01    TAX                             ;X = ptr to the byte to modify
        PLA
        AND #$07
        TAY                             ;Y = bit to modify

        LDA #$06                        ;7 rows in total to modify
        STA TMP_2493

_L02    LDA $4000+64*16,X               ;Spr frame #16: Energy
        EOR ENERGY_BAR_INVERT_MASK,Y    ; Invert bar
        STA $4000+64*16,X               ; according to life
        INX                             ;Skip to the next row
        INX
        INX
        DEC TMP_2493                    ;Done with 7 rows?
        BPL _L02                        ; No, jump
_EXIT   RTS

PLYR_ENERGY             .BYTE $00
ENERGY_BAR_INVERT_MASK  .BYTE $80,$40,$20,$10,$08,$04,$02,$01

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_MAYBE_TOGGLE_MUSIC
        LDA #%00001101                  ;'S' row=1,col=5
        JSR IS_KEY_PRESSED
        BCC _L00                        ;Not pressed

        ; Toggle music/sfx
        LDA _ALREADY_PRESSED
        BNE _EXIT
        INC _ALREADY_PRESSED
        LDA IS_GAME_MUSIC_ENABLED
        EOR #$01
        STA IS_GAME_MUSIC_ENABLED
        LDA a0D23
        EOR #$07
        STA a0D23
        TAX                             ;Music subfunction: 0 or 7
        LDA #26
        JMP MUSIC_FN

_EXIT   RTS

_L00    LDA #$00
        STA _ALREADY_PRESSED
        RTS

_ALREADY_PRESSED   .BYTE $00
a0D23   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Args: A=SFX to play
GAME_MAYBE_PLAY_SFX
        STA _SFX_TO_PLAY
        TXA
        PHA
        TYA
        PHA
        LDA IS_GAME_MUSIC_ENABLED       ;Music enabled?
        BNE _L00                        ; yes, jump
        LDA _SFX_TO_PLAY                ; no, play SFX
        JSR MUSIC_FN
_L00    PLA
        TAY
        PLA
        TAX
        RTS

IS_GAME_MUSIC_ENABLED   .BYTE $00
_SFX_TO_PLAY            .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Paints the map
; $0D3D
GAME_MAP_PAINT
        LDA GAME_HARD_SCROLL_DIR_COPY
        BNE _L00
        RTS

_L00    LDX #$00
        STX GAME_HARD_SCROLL_DIR_COPY

        LSR A
        BCC _L01
        JMP GAME_MAP_PAINT_DOWN         ;Down

_L01    LSR A
        BCC _L02
        JMP GAME_MAP_PAINT_UP           ;Up

_L02    LSR A
        BCC _L03
        JMP GAME_MAP_PAINT_RIGHT        ;Right

_L03    JMP GAME_MAP_PAINT_LEFT         ;Left

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0D5D   LDY f0D88,X
        BPL _L00
        LDA #$01
        STA GAME_CURRENT_ENEMY_STATE_TBL,X
        LDA #$07
        JSR s24D3
        TAY
        LDA GAME_ENEMY_ANIM_TYPE_TBL,Y
        STA GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,X
        JMP j10BE

_L00    CPY #$02
        BNE _L01
        INC ZP_GAME_SPRITE_FRAME_TBL,X
_L01    LDA f0D8A,Y
        CLC
        ADC ZP_GAME_SPRITE_Y_COPY_TBL,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL,X
        DEC f0D88,X
        RTS

f0D88   .BYTE $04,$00
f0D8A   .BYTE $00,$00,$00,$04,$03,$02,$02,$02
        .BYTE $01,$01,$00,$00,$00,$FF,$FF

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0D99   LDA a0967
        BEQ _L00
        RTS

_L00    LDX #$07
        LDY a0E59
        BPL _L01
        LDY #$1F
        STY a0E59
        LDA a32
        CLC
        ADC #$28
        STA a32
        LDA a33
        ADC #$00
        STA a33
        DEC a0E5A
        BPL _L01
        LDA #<$4000+40*1+4
        STA a32
        LDA #>$4000+40*1+4
        STA a33
        LDA #$11
        STA a0E5A
_L01    LDA (p32),Y
        CMP #$93
        BNE _L02
        STY TMP_2493
        JSR s0DE1
        LDY TMP_2493
_L02    DEY
        DEX
        BPL _L01
        STY a0E59
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0DE1   LDA #$04
        JSR s24D3
        TAY
        LDA GAME_CURRENT_ENEMY_STATE_TBL,Y
        BEQ _L00
        RTS

_L00    LDA #$0E
        STA f0D88,Y
        LDA #$05
        STA GAME_CURRENT_ENEMY_STATE_TBL,Y
        LDA #$09
        STA ZP_GAME_SPRITE_COLOR_TBL,Y     ;Color Brown
        STA ZP_GAME_SPRITE_STATE_TBL,Y
        LDA #$00
        STA f106C,Y
        STY a2745
        LDA TMP_2493
        CLC
        ADC #$28
        TAY
        LDA (p32),Y
        LDY a2745
        CMP #$67
        BNE _L01
        LDA #$0B
        STA GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,Y
        LDA #$76
        JMP _L02

_L01    LDA #$0C
        STA GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,Y
        LDA #120                        ;Frame: enemy jump from tower (??)
_L02    STA ZP_GAME_SPRITE_FRAME_TBL,Y
        LDA #$0E
        SEC
        SBC a0E5A
        ASL A
        ASL A
        ASL A
        CLC
        ADC #$48
        ADC ZP_GAME_SMOOTH_Y
        STA ZP_GAME_SPRITE_Y_COPY_TBL,Y
        LDA ZP_GAME_SMOOTH_X
        LSR A
        CLC
        ADC #$18
        STA a2745
        LDA TMP_2493
        ASL A
        ASL A
        CLC
        ADC a2745
        ASL A
        STA ZP_GAME_SPRITE_X_COPY_TBL,Y
        LDA #$00
        ROL A
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL,Y
        RTS

a0E59   .BYTE $FF
a0E5A   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0E5B   LDA a0967
        BEQ _L00
        RTS

_L00    LDX a0EB3
        BPL _L01
        RTS

_L01    LDY #$07
_L02    LDA $4000+40*18,X
        CMP #$FD
        BEQ _L03
        DEX
        DEY
        BPL _L02
        STX a0EB3
        RTS

_L03    LDA ZP_GAME_SMOOTH_X
        CLC
        ADC #$11
        LSR A
        STA TMP_2493
        TXA
        ASL A
        ASL A
        CLC
        ADC TMP_2493
        ASL A
        ROL ZP_GAME_SPRITE_X_MSB_COPY_TBL+4
        STA ZP_GAME_SPRITE_X_COPY_TBL+4
        LDA #$BC
        CLC
        ADC ZP_GAME_SMOOTH_Y
        STA ZP_GAME_SPRITE_Y_COPY_TBL+4
        LDA #$FF
        STA a0EB3
        LDA #$01
        STA a1070
        LDA #$02
        STA a120F
        LDA #$00
        STA a1214
        LDA #$0B
        STA ZP_GAME_SPRITE_COLOR_TBL+4
        INC ZP_GAME_SPRITE_STATE_TBL+4
        LDX #$04
        JMP j10BE

a0EB3   .BYTE $00
s0EB4   LDX a0EDB
        LDY a0EDA
        LDA #$00     ;#%00000000
        STA a7ED8,X
        INX
        INY
        INY
        TXA
        AND #$07     ;#%00000111
        TAX
        TYA
        AND #$07     ;#%00000111
        TAY
        LDA a7ED8,X
        ORA WEAPONS_PICKED_UP_MASK_TBL+1,Y
        STA a7ED8,X
        STX a0EDB
        STY a0EDA
        RTS

a0EDA   .BYTE $00
a0EDB   .BYTE $00
s0EDC   PHA
        LDA a0967
        BEQ b0EE4
        PLA
        RTS

b0EE4   LDA TMP_2493
        BEQ b0EF6
        LDA #$01
        STA a2745
        LDA #$51     ;#%01010001
        STA TMP_2493
        JMP j0F00

b0EF6   LDA #$00     ;#%00000000
        STA a2745
        LDA #$10     ;#%00010000
        STA TMP_2493
j0F00   LDA TMP_2493
        STA ZP_GAME_SPRITE_X_COPY_TBL+4
        LDA a2745
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL+4
        TXA
        ASL A
        ASL A
        ASL A
        CLC
        ADC ZP_GAME_SMOOTH_Y
        ADC #44
        STA ZP_GAME_SPRITE_Y_COPY_TBL+4
        JMP j0F48

s0F18   PHA
        LDA a0967
        BEQ b0F20
        PLA
        RTS

b0F20   LDA a28E6
        CMP #$C0                        ;LSB address
        BEQ b0F6A
        LDA #$2B
        STA ZP_GAME_SPRITE_Y_COPY_TBL+4
        LDA ZP_GAME_SMOOTH_X
        CLC
        ADC #$01
        LSR A
        STA TMP_2493
        LDA a2747
        CLC
        ADC #$02
        ASL A
        ASL A
        CLC
        ADC TMP_2493
        ASL A
        STA ZP_GAME_SPRITE_X_COPY_TBL+4
        LDA #$00
        ROL A
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL+4
j0F48   LDA #$01
        STA a1070
        STA ZP_GAME_SPRITE_STATE_TBL+4
        LDA #$02
        STA a120F
        LDA #$00
        STA a1214
        LDA #$0B                        ;Color Dark Grey
        STA ZP_GAME_SPRITE_COLOR_TBL+4
        TXA
        PHA
        TYA
        PHA
        LDX #$04     ;#%00000100
        JSR j10BE
        PLA
        TAY
        PLA
        TAX
b0F6A   PLA
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s0F6C   LDA a0967
        BEQ _L00
        RTS

_L00    LDX #$04
_L01    LDA GAME_CURRENT_ENEMY_STATE_TBL,X
        BEQ _L02
        JSR s0F90
        JMP _L03

_L02    JSR s11B1
_L03    DEX
        BPL _L01

        JSR s2961
        CMP #$00
        BNE _EXIT
        INC a11C1
_EXIT   RTS

s0F90   CMP #$05
        BNE _L00
        JSR s0D5D
        JMP GAME_UPDATE_ENEMY_POS_IF_NEEDED

_L00    CMP #$04
        BNE _L03
        JSR GAME_UPDATE_ENEMY_POS_IF_NEEDED
        LDA GAME_SPRITE_ENEMY_FRAME_DELAY_TBL,X
        BEQ _L01
        DEC GAME_SPRITE_ENEMY_FRAME_DELAY_TBL,X
        RTS

_L01    LDA #$04
        STA GAME_SPRITE_ENEMY_FRAME_DELAY_TBL,X
        LDA ZP_GAME_SPRITE_FRAME_TBL,X
        CMP #130                        ;Frame: Enemy killed (last frame)
        BEQ _L02
        INC ZP_GAME_SPRITE_FRAME_TBL,X
        RTS

_L02    JMP GAME_SET_ENEMY_OUT_OF_BOUNDS

_L03    CMP #$02
        BNE _L05

        LDA a101E
        BEQ _L04
        DEC a101E
        LDA #$28
        STA a101D
        INC a120F
        JSR GAME_UPDATE_ENEMY_POS_IF_NEEDED
        LDA #125                        ;Frame: Enemy flipped vertically
        STA ZP_GAME_SPRITE_FRAME_TBL+4
        RTS

_L04    JSR GAME_UPDATE_ENEMY_POS_IF_NEEDED
        JMP j109C

_L05    CMP #$03
        BNE b101F
        LDA a101D
        BNE _L06
        TYA
        PHA
        LDY #$04
        JSR ONE_ENEMY_KILLED
        PLA
        TAY
        RTS

_L06    LDA a101D
        LSR A
        LSR A
        TAY
        LDA f1012,Y
        CLC
        ADC ZP_GAME_SPRITE_Y_COPY_TBL+4
        STA ZP_GAME_SPRITE_Y_COPY_TBL+4
        LDA a101D
        SEC
        SBC f1012,Y
        STA a101D
        BCS _L07
        LDA #$00     ;#%00000000
        STA a101D
_L07    JMP GAME_UPDATE_ENEMY_POS_IF_NEEDED

f1012   .BYTE $01,$FD,$03,$03,$03,$02,$02,$02
        .BYTE $01,$01,$01
a101D   .BYTE $00
a101E   .BYTE $00

b101F   JSR s1032
        JSR GAME_UPDATE_ENEMY_POS_IF_NEEDED
        LDA a24F4
        CMP #$0A
        BCS b102F
        JSR s1061
b102F   JMP j1096

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s1032   JSR j1659
        LDY GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,X
        LDA f1071,Y
        TAY

        ; Only chars between 27 and 41 don't generate collision
        LDA (p30),Y
        CMP #27                         ;Trees?
        BCC _COLLISION_WITH_CHAR        ; yes, collision
        CMP #42                         ;Something else
        BCS _COLLISION_WITH_CHAR        ; yes, collision

        LDA f106C,X
        BEQ _EXIT

        JSR j10BE

        LDA #$00
        STA f106C,X
_EXIT   RTS

_COLLISION_WITH_CHAR
        INC f106C,X
        LDA f106C,X
        CMP #$0A     ;#%00001010
        BCC s1061
        JMP GAME_SET_ENEMY_OUT_OF_BOUNDS

s1061   JSR s2941
        TAY
        LDA GAME_ENEMY_ANIM_TYPE_TBL,Y
        STA GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,X
        RTS

f106C   .BYTE $00,$00,$00,$00
a1070   .BYTE $00
f1071   .BYTE $00,$79,$29,$01,$52,$7A,$2A,$00
        .BYTE $50,$79,$29

STR_READY
        #STR_CODE_CLR_SCREEN $20,$01
        #STR_CODE_FONT_BIG
        #STR_CODE_SET_COORDS $0F,$0B
        #STR_CODE_SET_COLOR $01         ;White color
        .TEXT "READY"
        #STR_CODE_END

GAME_SCREEN_CLEAR_COLOR = *+3           ;Points to the color of screen
STR_CLEAR_SCREEN_BIS
        #STR_CODE_CLR_SCREEN $20,$01
        #STR_CODE_END

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j1096   LDA f106C,X
        BEQ j109C
        RTS

j109C   LDA GAME_SPRITE_ENEMY_FRAME_DELAY_TBL,X
        BEQ _L00
        DEC GAME_SPRITE_ENEMY_FRAME_DELAY_TBL,X
        RTS

_L00    LDA #$02
        STA GAME_SPRITE_ENEMY_FRAME_DELAY_TBL,X
        LDA GAME_CURRENT_ENEMY_STATE_TBL,X
        CMP #$02
        BNE _L01

        LDA #20
        STA GAME_SPRITE_ENEMY_FRAME_DELAY_TBL,X

_L01    LDY GAME_SPRITE_ENEMY_CURRENT_FRAME_TBL,X
        LDA GAME_SPRITE_ENEMY_FRAME_TBL,Y
        BNE b10D1

j10BE   LDY GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,X
        LDA GAME_SPRITE_ENEMY_FRAME_OFFSET_TBL,Y
        TAY
        STA GAME_SPRITE_ENEMY_CURRENT_FRAME_TBL,X
        LDA GAME_SPRITE_ENEMY_FRAME_TBL,Y
        STA ZP_GAME_SPRITE_FRAME_TBL,X
        INC GAME_SPRITE_ENEMY_CURRENT_FRAME_TBL,X
        RTS

b10D1   INC GAME_SPRITE_ENEMY_CURRENT_FRAME_TBL,X                     ;Next frame
        STA ZP_GAME_SPRITE_FRAME_TBL,X
        RTS

GAME_SPRITE_ENEMY_FRAME_OFFSET_TBL
        .BYTE 20,0,5,0,15,0,5,0,10,0,5  ;Offsets
        ; Sprite frame animation
GAME_SPRITE_ENEMY_FRAME_TBL
        .BYTE 106,107,108,109,0         ;Enemy going down  (offset 0)
        .BYTE 102,103,104,105,0         ;Enemy going up    (offset 5)
        .BYTE 114,115,116,117,0         ;Enemy going left  (offset 10)
        .BYTE 110,111,112,113,0         ;Enemy going right (offset 15)
        .BYTE 122,123,124,123,0         ;Enemy in tower    (offset 20)
GAME_SPRITE_ENEMY_CURRENT_FRAME_TBL
        .BYTE $00,$00,$00,$00,$00
GAME_SPRITE_ENEMY_FRAME_DELAY_TBL   .BYTE $00,$00,$00,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_UPDATE_ENEMY_POS
        LDY GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,X
        LDA f106C,X
        BEQ _L00
        LDA #$00
        JMP _L01

_L00    LDA f1165,Y
_L01    CLC
        ADC ZP_DELTA_X
        STA a1163
        LDA f106C,X
        BEQ _L02
        LDA #$00
        JMP _L03

_L02    LDA f1172,Y
_L03    CLC
        ADC ZP_DELTA_Y
        STA a1164
        LDA a1163
        BMI _L05
        LDA ZP_GAME_SPRITE_X_COPY_TBL,X
        CLC
        ADC a1163
        STA ZP_GAME_SPRITE_X_COPY_TBL,X
        BCC _L04
        LDA #$01
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
_L04    JMP _L06

_L05    EOR #$FF
        CLC
        ADC #$01
        STA TMP_2493
        LDA ZP_GAME_SPRITE_X_COPY_TBL,X
        SEC
        SBC TMP_2493
        STA ZP_GAME_SPRITE_X_COPY_TBL,X
        BCS _L06

        LDA #$00
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X

_L06    LDA ZP_GAME_SPRITE_Y_COPY_TBL,X
        CLC
        ADC a1164
        STA ZP_GAME_SPRITE_Y_COPY_TBL,X
        RTS

a1163   .BYTE $00
a1164   .BYTE $00
f1165   .BYTE $00,$00,$00,$00,$01,$01,$01,$00
        .BYTE $FF,$FF,$FF,$01,$FF
f1172   .BYTE $00,$01,$FF,$00,$00,$01,$FF,$00
        .BYTE $00,$01,$FF,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_PLAY_MUSIC
        LDA #$00
        JMP MUSIC_FN

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Sprite visible area is:
; X = 4, 338 (?)
; Y = 10, 197
GAME_UPDATE_ENEMY_POS_IF_NEEDED
        LDA ZP_GAME_SPRITE_Y_COPY_TBL,X
        CMP #197
        BCS GAME_SET_ENEMY_OUT_OF_BOUNDS
        CMP #10
        BCC GAME_SET_ENEMY_OUT_OF_BOUNDS
        JMP j11A0

GAME_SET_ENEMY_OUT_OF_BOUNDS
        LDA #$00
        STA GAME_CURRENT_ENEMY_STATE_TBL,X
        STA f106C,X
        LDA #$00
        STA ZP_GAME_SPRITE_Y_COPY_TBL,X
        DEC ZP_GAME_SPRITE_STATE_TBL,X
        RTS

j11A0   LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
        LSR A
        LDA ZP_GAME_SPRITE_X_COPY_TBL,X
        ROR A
        CMP #169
        BCS GAME_SET_ENEMY_OUT_OF_BOUNDS
        CMP #2
        BCC GAME_SET_ENEMY_OUT_OF_BOUNDS

        JMP GAME_UPDATE_ENEMY_POS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s11B1   CPX #$04
        BNE _L00
        RTS

_L00    LDA a0B29
        BNE _L02
        LDA a11C1
        BNE _L01
        RTS

a11C1   .BYTE $00

_L01    DEC a11C1

_L02    LDA #$07
        JSR s24D3
        TAY
        LDA f121C,Y
        JSR s24D3
        CLC
        ADC f1215,Y
        ASL A
        STA ZP_GAME_SPRITE_X_COPY_TBL,X
        ROL ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
        LDA f122A,Y
        JSR s24D3
        CLC
        ADC f1223,Y
        STA ZP_GAME_SPRITE_Y_COPY_TBL,X

        LDA GAME_ENEMY_ANIM_TYPE_TBL,Y
        STA GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,X
        LDA #$01
        STA GAME_CURRENT_ENEMY_STATE_TBL,X
        STA ZP_GAME_SPRITE_STATE_TBL,X
        LDA #$00
        STA f106C,X
        LDA #$04
        JSR s24D3
        TAY
        LDA GAME_CURRENT_ENEMY_COLOR_TBL,Y
        STA ZP_GAME_SPRITE_COLOR_TBL,X
        JMP j10BE

        RTS

GAME_CURRENT_ENEMY_COLOR_TBL
        .BYTE $0B,$0F,$05,$09
GAME_CURRENT_ENEMY_STATE_TBL
        .BYTE $00,$00,$00,$00                   ;0 = Nothing
                                                ;1 = Alive
                                                ;4 = Dieying animation
a120F   .BYTE $00
GAME_CURRENT_ENEMY_ANIM_TYPE_TBL
        .BYTE $00,$00,$00,$00
a1214   .BYTE $00
        ; Where new sprites should appear
f1215   .BYTE $04,$A6,$04,$04,$04,$A6,$A6       ;X
f121C   .BYTE $00,$00,$8E,$00,$00,$00,$00       ;X
f1223   .BYTE $32,$32,$1D,$C4,$32,$C4,$32       ;Y
f122A   .BYTE $8C,$8C,$00,$00,$00,$00,$00       ;Y
GAME_ENEMY_ANIM_TYPE_TBL
        .BYTE $04,$08,$01,$06,$05,$0A,$09,$02   ;Bitwise:
                                                ; $01 = Down
                                                ; $02 = Up
                                                ; $04 = Right
                                                ; $08 = Left
        .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j123A   LDX #$06
_L00    LDA f1961,X
        BEQ _L01

        LDA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        CLC
        ADC ZP_DELTA_Y
        STA ZP_GAME_SPRITE_Y_COPY_TBL+5,X

        LDA a1266
        BNE _L01

        LDA ZP_GAME_SPRITE_X_COPY_TBL+5,X
        CLC
        ADC ZP_DELTA_X
        STA ZP_GAME_SPRITE_X_COPY_TBL+5,X

_L01    DEX
        BPL _L00

        LDA ZP_DELTA_X
        BEQ _EXIT
        DEC a1266
        BPL _EXIT
        LDA #$01
        STA a1266
_EXIT   RTS

a1266   .BYTE $00
f1267   .BYTE $09,$01,$02,$03,$0B,$0D,$0F,$11
        .BYTE $13,$0A,$0A,$0C,$0C,$0E,$0E,$10
        .BYTE $10,$12,$12,$14,$14,$16,$17,$17
        .BYTE $18,$19,$3D,$1B,$1C,$1D,$1E,$1F
        .BYTE $20,$21,$22,$23,$24,$25,$26,$28
        .BYTE $28,$2A,$2A,$2C,$3C,$2E,$2F,$2F
        .BYTE $31,$31
a1299   .BYTE $32,$33,$34,$35,$36,$37,$38,$39
        .BYTE $3A,$3B,$3C,$3D,$3E,$3F

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s12A7   LDA GAME_JOY_STATE
        AND #$0F                        ;Just the direction bits
        BEQ _EXIT
        CMP a12F0
        BNE b12BC
        LDA a12F2
        BEQ b12C7
        DEC a12F2
_EXIT   RTS

b12BC   STA a12F0
        LDA #$00
        STA a12F2
        JMP j12DF

b12C7   LDA #$03
        STA a12F2
j12CC   LDX a12EF
        LDA f12FE,X
        BEQ j12DF
        STA aD1
        CLC
        ADC #$04
        STA ZP_GAME_SPRITE_FRAME_TBL+13
        INC a12EF
        RTS

j12DF   LDA GAME_JOY_STATE
        AND #$0F                        ;Just the direction bits
        TAY
        LDA f12F3,Y
        STA a12EF
        JMP j12CC

        RTS

a12EF   .BYTE $00
a12F0   .BYTE $00
a12F1   .BYTE $00
a12F2   .BYTE $00
f12F3   .BYTE $00,$00,$05,$00,$0F,$00,$05,$00
        .BYTE $0A,$00,$05
f12FE   .BYTE $46,$47,$48,$49,$00,$4E,$4F,$50
        .BYTE $51,$00,$56,$57,$58,$59,$00,$5E
        .BYTE $5F,$60,$61,$00

s1312   LDA GAME_JOY_STATE_COPY2
        AND a12F1
        STA GAME_JOY_STATE_COPY2
        LDA #$FF
        STA a12F1
        LDA ZP_GAME_MAP_OFFSET_X
        BEQ b135B
        CMP #$5A     ;#%01011010
        BEQ b1350
j1328   LDA ZP_MAP_OFFSET_Y_MSB
        BEQ b1337
        CMP #$03     ;#%00000011
        BNE b1336
        LDA ZP_MAP_OFFSET_Y_LSB
        CMP #$B8     ;#%10111000
        BCS b133E
b1336   RTS

b1337   LDA ZP_MAP_OFFSET_Y_LSB
        CMP #$19     ;#%00011001
        BCC b1347
        RTS

b133E   LDA GAME_JOY_STATE_COPY2
        AND #%00011110                  ;Up masked
        STA GAME_JOY_STATE_COPY2
        RTS

b1347   LDA GAME_JOY_STATE_COPY2
        AND #%00011101                  ;Down masked
        STA GAME_JOY_STATE_COPY2
        RTS

b1350   LDA GAME_JOY_STATE_COPY2
        AND #%00010111                  ;Right masked
        STA GAME_JOY_STATE_COPY2
        JMP j1328

b135B   LDA GAME_JOY_STATE_COPY2
        AND #%00011011                  ;Left masked
        STA GAME_JOY_STATE_COPY2
        JMP j1328

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s1366   LDA ZP_GAME_SMOOTH_X
        CLC
        ADC #$16     ;#%00010110
        AND #$FE     ;#%11111110
        STA TMP_2493
        LDA a1932
        SEC
        SBC TMP_2493
        PHA
        BCS b137F
        LDA #$00     ;#%00000000
        JMP j1382

b137F   LDA a1933
j1382   LSR A
        PLA
        ROR A
        LSR A
        LSR A
        STA a1A50
        LDA a1931
        SEC
        SBC #$2D     ;#%00101101
        SBC ZP_GAME_SMOOTH_Y
        LSR A
        LSR A
        LSR A
        STA a1A46
        LDA ZP_MAP_OFFSET_Y_LSB
        SEC
        SBC a1A46
        AND #$F8     ;#%11111000
        STA aF0
        LDA ZP_MAP_OFFSET_Y_MSB
        SBC #$00     ;#%00000000
        STA aF1
        LDA ZP_GAME_MAP_OFFSET_X
        CLC
        ADC a1A50
        STA aF2
        LSR aF2
        LSR aF2
        LSR aF2
        ASL aF0
        ROL aF1
        LDA #$00     ;#%00000000
        CLC
        ADC aF0
        STA aF4
        LDA #$E0     ;#%11100000
        ADC aF1
        STA aF5
        LDY aF2
        LDA (pF4),Y
        TAX
        LDA f1267,X
        CPX #$30     ;#%00110000
        BNE b13D6
        INC a101E
b13D6   STA TMP_2493
        CPX TMP_2493
        BNE b13E1
        JMP j14E9

b13E1   STA (pF4),Y
        LDX #$00     ;#%00000000
        STX aF4
        LSR A
        ROR aF4
        LSR A
        ROR aF4
        TAX
        LDA aF4
        CLC
        ADC #$00     ;#%00000000
        STA aF4
        TXA
        ADC #$EF     ;#%11101111
        STA aF5
        LDA #>$4000
        STA a14AF
        LDA #<$4000
        STA a14AE
        LDA ZP_GAME_MAP_OFFSET_X
        AND #$07     ;#%00000111
        STA a14EA
        EOR #$07     ;#%00000111
        STA aF0
        LDA ZP_MAP_OFFSET_Y_LSB
        AND #$07     ;#%00000111
        STA TMP_2493
        STA a14ED
        EOR #$07     ;#%00000111
        STA a14EB
        LDX #$00     ;#%00000000
        STX a2747
        LDA TMP_2493
        CMP a1A46
        BCS b1463
        LDA #$00     ;#%00000000
        STA a31
        LDA #$07     ;#%00000111
        STA a14ED
        LDA a1A46
        CLC
        ADC a14EB
        AND #$F8     ;#%11111000
        SEC
        SBC a14EB
        STA a2747
        ASL A
        ASL A
        ASL A
        STA a30
        ASL A
        ROL a31
        ASL A
        ROL a31
        CLC
        ADC a30
        STA a14AE
        LDA a31
        ADC #$40     ;#%01000000
        STA a14AF
        CMP #$44     ;#%01000100
        BCC b1463
        JMP j14E9

b1463   LDA aF0
        CMP a1A50
        BCS b1488
        LDA a1A50
        CLC
        ADC a14EA
        AND #$F8     ;#%11111000
        SEC
        SBC a14EA
        STA a14EF
        LDA #$00     ;#%00000000
        STA a14EA
        LDA a14EF
        STA a14EE
        JMP j1490

b1488   LDA #$00     ;#%00000000
        STA a14EF
        STA a14EE
j1490   LDA a14ED
        ASL A
        ASL A
        ASL A
        CLC
        ADC a14EA
        TAY
        LDA a14EA
        EOR #$07     ;#%00000111
        STA a14EC
        LDX a14EE
        LDA a14EF
        STA aF3
b14AB   LDA (pF4),Y
a14AE   =*+$01
a14AF   =*+$02
        STA $4000,X
        INY
        INX
        DEC a14EC
        BMI b14C7
        INC aF3
        LDA aF3
        CMP #$28     ;#%00101000
        BCC b14AB
        LDA a1A50
        LDA a14EE
        STA aF3
b14C7   LDA a14AE
        CLC
        ADC #$28     ;#%00101000
        STA a14AE
        BCC b14D5
        INC a14AF
b14D5   DEC a14ED
        BMI j14E9
        INC a2747
        LDA a2747
        CMP #$19     ;#%00011001
        BCC b14E6
        BCS j14E9
b14E6   JMP j1490

j14E9   RTS

a14EA   .BYTE $00
a14EB   .BYTE $00
a14EC   .BYTE $00
a14ED   .BYTE $00
a14EE   .BYTE $00
a14EF   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_CHECK_DESTROY_TERRAIN
        LDA GAME_HARD_SCROLL_DIR_COPY
        BEQ _L00
        RTS

_L00    LDX a152D
        LDA SPRITE_BULLET_ID_TBL,X
        CMP #$05                        ;Bazooka?
        BEQ _L01                        ; Yes, jump
        CMP #$08                        ;Missile
        BEQ _L01                        ; Yes, jump
        JMP _L02

_L01    TXA
        PHA
        CLC
        ADC #$09
        TAX
        JSR s169C
        PLA
        TAX
        LDY #41
        ; Chars that don't generate collision are between 27 and 41
        LDA (p30),Y
        CMP #27
        BCC _COLLISION_WITH_CHAR
        CMP #42
        BCS _COLLISION_WITH_CHAR
        JMP _L02

_COLLISION_WITH_CHAR
        JSR s18E4

_L02    DEX
        BPL _L03
        LDX #$02
_L03    STX a152D
        RTS

a152D   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s152E   LDX a154E
        LDA SPRITE_BULLET_ID_TBL,X      ;Type of bullet
        BEQ _L00                        ; None, jump
        CMP #$09                        ;Is it grenade?
        BEQ _L00                        ; yes, jump

        JSR s155F
        DEC a154E
        BMI _L01
        RTS

_L00    DEC a154E
        BPL s152E
_L01    LDA #$02
        STA a154E
        RTS

a154E   .BYTE $00
f154F   .BYTE $0D,$0C,$0C,$0C,$00,$0C,$00,$18
f1557   .BYTE $0D,$0B,$0B,$0B,$00,$0B,$00,$15

s155F   STA a2745
        LDY #$03     ;#%00000011
j1564   STY TMP_2493
        LDA a2745
        SEC
        SBC #$03     ;#%00000011
        TAY
        LDA f154F,Y
        STA a25C6
        LDA f1557,Y
        STA a25C7
        LDY TMP_2493
        LDA GAME_CURRENT_ENEMY_STATE_TBL,Y
        BEQ b15EA
        CMP #$04
        BEQ b15EA
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        STA a25C4
        LDA ZP_GAME_SPRITE_Y_COPY_TBL,Y
        STA a25C5
        LDA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        ASL A
        STA a25C0
        LDA #$00
        ROL A
        STA a25C1
        LDA ZP_GAME_SPRITE_X_COPY_TBL,Y
        STA a25C2
        LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL,Y
        STA a25C3
        JSR s257D
        BCC b15EA
        LDA a2745
        CMP #$08
        BEQ b15C3
        CMP #$05
        BEQ b15C3
        CMP #$0A
        BEQ ONE_ENEMY_KILLED
        JSR s1837
        JMP ONE_ENEMY_KILLED

b15C3   JSR s1934

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Args: Y (enemy that was killed)
ONE_ENEMY_KILLED
        LDA #126                        ;Frame: Enemy killed anim (1st frame)
        STA ZP_GAME_SPRITE_FRAME_TBL,Y
        LDA #$01
        STA f106C,Y
        LDA #$00                        ;No animation type
        STA GAME_CURRENT_ENEMY_ANIM_TYPE_TBL,Y
        LDA #$04
        STA GAME_CURRENT_ENEMY_STATE_TBL,Y
        STA GAME_SPRITE_ENEMY_FRAME_DELAY_TBL,Y
        LDA #$01
        STA ZP_GAME_SPRITE_COLOR_TBL,Y     ;Color White
        STA LOCAL_POINTS+3              ;Set 100 points
        LDA #$12
        JMP GAME_MAYBE_PLAY_SFX

b15EA   DEY
        BPL b15EE
        RTS

b15EE   JMP j1564

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s15F1   LDX #$0D
        JSR j1659
        LDX #$03
        LDA GAME_JOY_STATE
        STA TMP_2493
_L00    LDY f161F,X
        ; Chars that don't generate collision are between 27 and 41
        LDA (p30),Y
        STA a161E
        CMP #27
        BCC _COLLISION_WITH_CHAR
        CMP #42
        BCS _COLLISION_WITH_CHAR
        JMP _L01

_COLLISION_WITH_CHAR
        LDA GAME_JOY_STATE
        AND f1623,X
        STA GAME_JOY_STATE
_L01    DEX
        BPL _L00
        RTS

a161E   .BYTE $00
f161F   .BYTE $29,$50,$52,$79
        ;Mask: Up, Left, Right, Down
f1623   .BYTE %00011110,%00011011,%00010111,%00011101
f1627   .BYTE $00
f1628   .BYTE $40,$28,$40,$50,$40,$78,$40,$A0
        .BYTE $40,$C8,$40,$F0,$40,$18,$41,$40
        .BYTE $41,$68,$41,$90,$41,$B8,$41,$E0
        .BYTE $41,$08,$42,$30,$42,$58,$42,$80
        .BYTE $42,$A8,$42,$D0,$42,$F8,$42,$20
        .BYTE $43,$48,$43,$70,$43,$98,$43,$C0
        .BYTE $43

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j1659   LDA ZP_GAME_SMOOTH_X
        CLC
        ADC #$16     ;#%00010110
        LSR A
        STA TMP_2493
        LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
        LSR A
        LDA ZP_GAME_SPRITE_X_COPY_TBL,X
        ROR A
        SEC
        SBC TMP_2493
        BCS b1670
        LDA #$00     ;#%00000000
b1670   LSR A
        LSR A
        STA a30
        LDA ZP_GAME_SMOOTH_Y
        CLC
        ADC #$2D     ;#%00101101
        STA TMP_2493
        LDA ZP_GAME_SPRITE_Y_COPY_TBL,X
        SEC
        SBC TMP_2493
        BCS b1686
        LDA #$00     ;#%00000000
b1686   AND #$F8     ;#%11111000
        LSR A
        LSR A
        TAY
        LDA f1627,Y
        CLC
        ADC a30
        STA a30
        LDA f1628,Y
        ADC #$00     ;#%00000000
        STA a31
        RTS

        RTS

s169C   LDA ZP_GAME_SMOOTH_X
        CLC
        ADC #$16     ;#%00010110
        LSR A
        STA TMP_2493
        LDA ZP_GAME_SPRITE_X_COPY_TBL,X
        SEC
        SBC TMP_2493
        BCS b16AF
        LDA #$00     ;#%00000000
b16AF   LSR A
        LSR A
        STA a30
        LDA ZP_GAME_SMOOTH_Y
        CLC
        ADC #$2D     ;#%00101101
        STA TMP_2493
        LDA ZP_GAME_SPRITE_Y_COPY_TBL,X
        SEC
        SBC TMP_2493
        BCS b16C5
        LDA #$00     ;#%00000000
b16C5   AND #$F8     ;#%11111000
        LSR A
        LSR A
        TAY
        LDA f1627,Y
        CLC
        ADC a30
        STA a30
        LDA f1628,Y
        ADC #$00     ;#%00000000
        STA a31
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s16DA   JSR VIC_SCREEN_DISABLE

        LDX #$FD                        ;Clear Zero Page
        LDA #$00
_L00    STA f02,X
        DEX
        BNE _L00

        JSR s2494

        LDA #$00
        STA GAME_RASTER_TICK_VAR
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL+13

        JSR s03FC
        JSR GAME_SETUP_IRQ
        JSR s096A

        LDA #$32
        STA a0BE4
        LDA #$40
        STA a0BE8
        LDA #$01
        STA a0BEC

        LDX #$02
_L01    LDA f0BF1,X
        STA f0BED,X
        DEX
        BPL _L01

        LDA #$04
        STA ZP_GAME_SMOOTH_Y
        STA a11C1
        STA ZP_GAME_SPRITE_STATE_TBL+13
        LDA #$00
        STA a0912
        STA COPTER_MODE_ENABLED
        STA a0967
        STA a0B29
        STA ZP_GAME_SMOOTH_X
        STA ZP_SELECTED_WEAPON
        STA IS_GAME_PAUSED
        STA $D015                       ;Sprite display Enable
        STA $D020                       ;Border Color
        STA $D021                       ;Background Color 0
        STA GAME_RASTER_TICK_DB
        STA ZP_IS_GAME_OVER
        STA a101E
        STA aE6
        STA ZP_GAME_ENERGY_TO_DECREASE
        LDA #$07                        ;Knife,Bazooka,Arrow
        STA WEAPONS_PICKED_UP

        LDA #$96                        ;#%10010110
        STA $DD00                       ; Use VIC bank 1 ($4000-$7FFF)

        LDA #$0F                        ;#%00001111
        STA $D018                       ; Charset: $7800-$7FFF
                                        ; Video: $4000
        LDA #$32
        STA a1299
        JSR s0983
        LDA #$00
        STA GAME_JOY_STATE
        JSR b12BC
        JSR GAME_RESTORE_DASHBOARD_COLORS
        JSR RESET_ENERGY_SPRITE
        LDA #$01
        JSR MUSIC_FN
        LDA #$AC
        STA ZP_GAME_SPRITE_X_COPY_TBL+13
        LDA #$96
        STA ZP_GAME_SPRITE_Y_COPY_TBL+13
        JSR s1BD4
        JSR s12A7

        LDA $D016                       ;VIC Control Register 2
        ORA #$10                        ; #%00010000
        STA $D016                       ; 40=Cols

        LDA #$04
        STA a1D8E

        LDA #$00                        ;Color Black
        STA $D022                       ;Background Color 1, Multi-Color Register 0
        STA $D020                       ;Border Color
        STA $D01B                       ;Sprite to Background Display Priority
        LDA #$08                        ;Color Orange
        STA $D023                       ;Background Color 2, Multi-Color Register 1
        LDA #$0B                        ;Color Grey 1 (dark)
        STA $D021                       ;Background Color 0
        LDA #$FF                        ;#%11111111
        STA $D01C                       ;Sprites Multi-Color Mode Select
        LDA #$01                        ;Color White
        STA $D025                       ;Sprite Multi-Color Register 0
        STA IS_GAME_MUSIC_ENABLED
        LDA #$00                        ;Color Black
        STA $D026                       ;Sprite Multi-Color Register 1
        STA $D017                       ;Sprites Expand 2x Vertical (Y)
        STA $D01D                       ;Sprites Expand 2x Horizontal (X)

        STA ZP_MAP_OFFSET_Y_MSB
        STA ZP_MAP_OFFSET_Y_LSB
        LDA #$3C
        STA ZP_GAME_MAP_OFFSET_X
        LDA #$0A
        STA ZP_GAME_SPRITE_COLOR_TBL+13

        LDX #$07
        LDA #$00
        STX a0D23
_L02    STA $7FF8,X                     ;Bug? Clear char 255
        DEX
        BPL _L02

        LDX #$07
        LDA #26
        JSR MUSIC_FN

        ;Scroll down 25 rows
        LDX #25
_L03    TXA
        PHA
        JSR GAME_HARD_SCROLL_DOWN
        LDA #$01                        ;Down
        STA GAME_HARD_SCROLL_DIR_COPY
        JSR GAME_MAP_PAINT
        PLA
        TAX
        DEX
        BNE _L03

        JSR b12C7
        JSR RESET_ENERGY_SPRITE
        JSR s1985
        JSR GAME_UPDATE_SPRITE_SCORE
        JSR GAME_UPDATE_SCORE_FROM_POINTS
        JSR GAME_UPDATE_SPRITE_SCORE
        JSR GAME_SPRITE_SYNC_PROPERTIES
        JSR GAME_SPRITE_SORT
        JSR VIC_SCREEN_ENABLE
        JSR s1F9B
        JMP j1DD5

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $180D
VIC_SCREEN_DISABLE
        LDA #$00
        STA $D011                       ;VIC Control Register 1
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $1813
VIC_SCREEN_ENABLE
        LDA #$10
        STA $D011                       ;VIC Control Register 1
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s1819
        LDX #$02
_L00    LDA SPRITE_BULLET_ID_TBL,X
        BEQ _L01
        JSR s1827
_L01    DEX
        BPL _L00
        RTS

s1827   CMP #$09
        BNE _L00
        JMP j1885

_L00    STA TMP_2493
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        CMP #$0A
        BCS b1843
s1837   LDA #$00
        STA SPRITE_BULLET_ID_TBL,X
        LDA #$00
        STA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        DEC ZP_GAME_SPRITE_STATE_TBL+9,X
        RTS

b1843   CMP #$C4
        BCC b184A
        JMP s1837

b184A   LDA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        CMP #$04
        BCS b1853
        JMP s1837

b1853   CMP #$AC
        BCS s1837
        LDA TMP_2493
        CMP #$0A     ;#%00001010
        BNE b1861
        JMP j1968

b1861   LDA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        CLC
        ADC SPRITE_BULLET_SPEED_Y_TBL,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+9,X

        LDA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        CLC
        ADC SPRITE_BULLET_SPEED_X_TBL,X
        STA ZP_GAME_SPRITE_X_COPY_TBL+9,X

        LDA TMP_2493
        CMP #$04     ;#%00000100
        BEQ b1879
        RTS

b1879   LDA ZP_GAME_SPRITE_FRAME_TBL+9,X
        CMP #64                         ;Frame: Knife anim (last frame) (??)
        BEQ b1882
        INC ZP_GAME_SPRITE_FRAME_TBL+9,X
        RTS

b1882   JMP j195C

j1885   LDA f1955,X
        AND #$7F     ;#%01111111
        LSR A
        LSR A
        LSR A
        CMP #$03     ;#%00000011
        BCS b189C
        STA TMP_2493
        LDA #56                         ;Frame: Grenade... I don't know (last frame)
        SEC
        SBC TMP_2493
        STA ZP_GAME_SPRITE_FRAME_TBL+9,X
b189C   LDA f1955,X
        BPL b18DA
        DEC f1955,X
        BPL b18D2
j18A6   AND #$7F     ;#%01111111
        TAY

        ; Check whether bullet is within the screen range
        LDA f1958,X
        CLC
        ADC SPRITE_BULLET_DIR_Y_TBL,X
        STA f1958,X
        CLC
        ADC f8000,Y
        CMP #192
        BCS s18E4
        CMP #20
        BCC s18E4
        STA ZP_GAME_SPRITE_Y_COPY_TBL+9,X

        LDA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        CLC
        ADC SPRITE_BULLET_DIR_X_TBL,X
        CMP #160
        BCS s18E4
        CMP #12
        BCC s18E4

        STA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        RTS

b18D2   LDA #$00
        STA f1955,X
        JMP j18A6

b18DA   INC f1955,X
        LDA f1955,X
        CMP #$1A
        BNE j18A6

        ; Bullet is out of range (?)
s18E4   LDY SPRITE_BULLET_ID_TBL,X
        LDA f1927,Y
        JSR GAME_MAYBE_PLAY_SFX
        JSR s1934
        TXA
        PHA
        CLC
        ADC #$09
        TAX
        JSR s169C
        PLA
        TAX
        LDY #41
        ; Chars that don't generate collision are between 27 and 41
        LDA (p30),Y
        CMP #27
        BCC _COLLISION_WITH_CHAR
        CMP #42
        BCS _COLLISION_WITH_CHAR
        RTS

_COLLISION_WITH_CHAR
        TXA
        PHA
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        CLC
        ADC #$08     ;#%00001000
        STA a1931
        LDA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        CLC
        ADC #$04     ;#%00000100
        ASL A
        STA a1932
        LDA #$00     ;#%00000000
        ROL A
        STA a1933
        JSR s1366
        PLA
        TAX
        RTS

        ;SFX to play based on weapon ID
f1927   .BYTE $00,$00,$00,$00,$00,$0F,$00,$00
        .BYTE $0E,$0D
a1931   .BYTE $00
a1932   .BYTE $00
a1933   .BYTE $00

s1934   LDA #65                         ;Frame: Explosion #00
        STA ZP_GAME_SPRITE_FRAME_TBL+9,X
        LDA #$0A
        STA SPRITE_BULLET_ID_TBL,X
        LDA a11C1
        ADC #$05
        STA a11C1
        LDA #$05                        ;Color Green
        STA ZP_GAME_SPRITE_COLOR_TBL+9,X
        LDA #$02
        STA f197F,X
        RTS

SPRITE_BULLET_DIR_Y_TBL
        .BYTE $00,$00,$00
SPRITE_BULLET_DIR_X_TBL
        .BYTE $00,$00,$00
f1955   .BYTE $00,$00,$00
f1958   .BYTE $00,$00,$00
a195B   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j195C   LDA #57                         ;Frame: Knife #00
        STA ZP_GAME_SPRITE_FRAME_TBL+9,X
        RTS

f1961   .BYTE $00,$00
f1963   .BYTE $00,$00
SPRITE_BULLET_ID_TBL
        .BYTE $00,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j1968   LDA f197F,X
        BEQ b1971
        DEC f197F,X
        RTS

b1971   LDA #$02
        STA f197F,X
        LDA ZP_GAME_SPRITE_FRAME_TBL+9,X
        CMP #69                         ;Frame: Explosion #04 (last frame)
        BEQ b1982
        INC ZP_GAME_SPRITE_FRAME_TBL+9,X
        RTS

f197F   .BYTE $00,$00,$00
b1982   JMP s1837

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s1985   LDA #20                         ;Frame: Knife Dashboard
        STA GAME_DASHBOARD_SPR_FRAME_TBL
        LDA #19
        STA GAME_DASHBOARD_SPR_FRAME_TBL+3

        LDA WEAPONS_PICKED_UP           ;Weapons grabbed
        AND #$01                        ; This is always true, since the knife
        BNE _L00                        ; is always on

        LDA #34                         ;Frame: Empty
        STA GAME_DASHBOARD_SPR_FRAME_TBL

_L00    LDA WEAPONS_PICKED_UP
        AND #$08                        ;Grenade picked up?
        BNE _L01

        LDA #34                         ;Frame: Emtpy
        STA GAME_DASHBOARD_SPR_FRAME_TBL+3

_L01    LDA WEAPONS_PICKED_UP
        LSR A
        LSR A
        LSR A
        AND #$06
        TAX
        LDA _DASHBOARD_SPR_FRAME_TBL,X
        STA GAME_DASHBOARD_SPR_FRAME_TBL+4
        LDA _DASHBOARD_SPR_FRAME_TBL+1,X
        STA GAME_DASHBOARD_SPR_FRAME_TBL+5
        RTS

_DASHBOARD_SPR_FRAME_TBL
        .BYTE 34,34                     ;Empty frame
        .BYTE 21                        ;Gatling gun left
        .BYTE 22                        ;Gatling gun right
        .BYTE 23                        ;Missle left
        .BYTE 24                        ;Missle right
        .BYTE 25                        ;Gatling & Missile left
        .BYTE 26                        ;Gatling & Missile right

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_RESTORE_DASHBOARD_COLORS
        LDX #$07                        ;8 sprites for dashboard
_L00    LDA GAME_DASHBOARD_COLOR_REF_TBL,X
        STA GAME_DASHBOARD_SPR_COLOR_TBL,X
        DEX
        BPL _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s19D1   LDX ZP_SELECTED_WEAPON
        LDY a1B70
        LDA f1B71,Y
        LDY PLYR_ENERGY
        CPY #10                         ;Enegy < 10
        BCC _L00                        ; Yes, jump
        LDY #$07                        ;Not clear why it compares PLYR_ENERGY
        STY a2425
        JMP _L01

_L00    STA a2425
_L01    CPX #$04                        ;Weapon: Machine gun
        BEQ _L02
        CPX #$05                        ;Weapon: Helicopter gun
        BEQ _L03
        STA GAME_DASHBOARD_SPR_COLOR_TBL,X
        RTS

_L02    STA GAME_DASHBOARD_SPR_COLOR_TBL+4      ;Machine gun
        STA GAME_DASHBOARD_SPR_COLOR_TBL+5
        RTS

_L03    STA GAME_DASHBOARD_SPR_COLOR_TBL+6      ;Helicoper gun
        STA GAME_DASHBOARD_SPR_COLOR_TBL+7
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; If space is pressed, select the next weapon
GAME_MAYBE_SELECT_NEXT_WEAPON
        LDA #$00
        STA $DC00                       ; CIA1: Data Port Register A

        LDA $DC01                       ;Read Register B
        EOR #$FF                        ; Flip bits since they are active low
        BNE _L00                        ;Any activity?
                                        ; Yes, jump

        LDA #$FF                        ;Enable keyboard scanning
        STA $DC00                       ; CIA1: Data Port Register A
        RTS

_L00    LDA #%00111100                  ;Space: row=7, col=4
        JSR IS_KEY_PRESSED
        LDA #$00
        BCC _L04                        ; Not pressed
        LDA a1A45
        BEQ _L01
        DEC a1A45
        RTS

_L01    JSR GAME_RESTORE_DASHBOARD_COLORS
        ; Select next weapon
_L02    LDX ZP_SELECTED_WEAPON          ;Weapon used
        BNE _L03                        ; Knife? No

        LDX #$06                        ;Select max weapon
_L03    DEX
        STX ZP_SELECTED_WEAPON

        LDA WEAPONS_PICKED_UP
        AND WEAPONS_PICKED_UP_MASK_TBL,X
        BEQ _L02
        LDA #$0A
_L04    STA a1A45
        JMP GAME_MAYBE_TOGGLE_MUSIC

a1A45   .BYTE $00
a1A46   .BYTE $00
WEAPONS_PICKED_UP
        .BYTE $07
WEAPONS_PICKED_UP_MASK_TBL
        .BYTE $01,$02,$04,$08,$10,$20,$40,$80
a1A50   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_CHECK_HERO_FIRE_BULLET
        LDA GAME_JOY_STATE
        AND #$10                        ;Fire pressed?
        BEQ _L00                        ; No

        CMP HERO_FIRE_ALREADY_PRESSED   ;Already fired bullet?
        BNE _L01                        ; Yes, jump
                                        ; This prevents "auto-fire"
        RTS

_L00    LDA #$00
        STA HERO_FIRE_ALREADY_PRESSED
        RTS

_L01    STA HERO_FIRE_ALREADY_PRESSED

        LDX #$02                        ;Max number of bullets: 3
_L02    LDA SPRITE_BULLET_ID_TBL,X                     ;Find the one that is empty
        BEQ _L03
        DEX
        BPL _L02
        RTS

_L03    LDY ZP_SELECTED_WEAPON
        CPY #$04                        ;Gatling gun?
        BNE _L04                        ; No, jump

        LDA a11C1                       ;Weapon is Gatling gun
        CLC
        ADC #$05
        STA a11C1


        ; Y = selected weapon
        ; X = index of the "bullet" to use
_L04    LDA _WEAPON_ID_TBL,Y
        STA SPRITE_BULLET_ID_TBL,X

        LDA _WEAPON_SFX_TBL,Y
        JSR GAME_MAYBE_PLAY_SFX

        LDA _WEAPON_COLOR_TBL,Y
        STA ZP_GAME_SPRITE_COLOR_TBL+9,X

        ; Position the bullet relative to the Hero
        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        LSR A
        STA ZP_GAME_SPRITE_X_COPY_TBL+9,X

        LDA ZP_GAME_SPRITE_Y_COPY_TBL+13
        SEC
        SBC #$05
        STA ZP_GAME_SPRITE_Y_COPY_TBL+9,X

        INC ZP_GAME_SPRITE_STATE_TBL+9,X

        LDY GAME_JOY_LATEST_MOVEMENT    ;Y = joystick direction

        LDA ZP_SELECTED_WEAPON          ;Knife?
        BNE _L05                        ; No, jump

        LDA #57                         ;Knife sprite frame
        JMP _SETUP_SPRITE_BULLET

_L05    CMP #$03                        ;Weapon is Grenade, Gatling Gun or Missile?
        BCS _L06                        ; Yes, jump

        LDA _SPRITE_FRAME_BAZOOKA_TBL,Y ;Weapon is Bazooka or Arrow
        JMP _SETUP_SPRITE_BULLET                        ; They share the same sprite frames

_L06    CMP #$05                        ;Weapon is Missle?
        BNE _L07                        ; No, jump

        LDA _SPRITE_FRAME_MISSILE_TBL,Y ;Weapon is missile
        JMP _SETUP_SPRITE_BULLET

_L07    CMP #$03                        ;Weapon is Grenade?
        BNE _L08                        ; No, jump

        LDA #$9A                        ;Weapon is Grenade
        STA f1955,X
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        SEC
        SBC #42
        STA f1958,X
        LDA #54                         ;Grenade sprite frame
        JMP _SETUP_SPRITE_BULLET

_L08    LDA _SPRITE_FRAME_GATLING_GUN_TBL,Y      ;Weapon is Gatling Gun

        ; Y = Joystick direction
        ; X = index of the "bullet" to use
_SETUP_SPRITE_BULLET
        STA ZP_GAME_SPRITE_FRAME_TBL+9,X

        LDA _WEAPON_BULLET_SPEED_X_TBL,Y
        STA SPRITE_BULLET_SPEED_X_TBL,X

        LDA _WEAPON_BULLET_SPEED_Y_TBL,Y
        STA SPRITE_BULLET_SPEED_Y_TBL,X

        LDA _WEAPON_BULLET_DIR_Y_TBL,Y
        STA SPRITE_BULLET_DIR_Y_TBL,X

        LDA _WEAPON_BULLET_DIR_X_TBL,Y
        STA SPRITE_BULLET_DIR_X_TBL,X

        RTS

_WEAPON_SFX_TBL
        .BYTE $00,$11,$11,$13,$17,$10
_WEAPON_ID_TBL
        .BYTE $04,$05,$06,$09,$03,$08
_WEAPON_COLOR_TBL
        .BYTE $0B,$04,$03,$05,$00,$0E
_SPRITE_FRAME_GATLING_GUN_TBL
        .BYTE $1D,$1D,$1D,$00,$1E,$1F,$20,$00
        .BYTE $1E,$20,$1F
        ; 0, Up, Down, N/A
        ; Left, Up+Left, Down+Left,N/A
        ; Right, Up+Right, Up+Left
_SPRITE_FRAME_BAZOOKA_TBL               ;Shared with Arrow
        .BYTE $26,$26,$27,$00
        .BYTE $29,$2C,$2D,$00
        .BYTE $28,$2A,$2B
_SPRITE_FRAME_MISSILE_TBL
        .BYTE $2E,$2E,$2F,$00
        .BYTE $30,$34,$35,$00
        .BYTE $31,$32,$33
_WEAPON_BULLET_SPEED_X_TBL
        .BYTE $00,$00,$00,$00
        .BYTE $FE,$FE,$FE,$00
        .BYTE $02,$02,$02
_WEAPON_BULLET_SPEED_Y_TBL
        .BYTE $FC,$FC,$04,$00
        .BYTE $00,$FC,$04,$00
        .BYTE $00,$FC,$04
_WEAPON_BULLET_DIR_X_TBL
        .BYTE $00,$00,$00,$00
        .BYTE $FF,$FF,$FF,$00
        .BYTE $01,$01,$01
_WEAPON_BULLET_DIR_Y_TBL
        .BYTE $FF,$FF,$01,$00
        .BYTE $00,$FF,$01,$00
        .BYTE $00,$FF,$01
SPRITE_BULLET_SPEED_X_TBL
        .BYTE $00,$00,$00
SPRITE_BULLET_SPEED_Y_TBL
        .BYTE $00,$00,$00
HERO_FIRE_ALREADY_PRESSED
        .BYTE $00

s1B5A   DEC a1B6F
        BPL b1B6E
        LDA #$02     ;#%00000010
        STA a1B6F
        DEC a1B70
        BPL b1B6E
        LDA #$07     ;#%00000111
        STA a1B70
b1B6E   RTS

a1B6F   .BYTE $00
a1B70   .BYTE $00
f1B71   .BYTE $00,$0B,$0C,$0F,$01,$0F,$0C,$0B

s1B79   LDA a1C28
        SEC
        BNE b1B87
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+13
        CMP #$AF     ;#%10101111
        BCS b1B87
        INC ZP_GAME_SPRITE_Y_COPY_TBL+13
b1B87   RTS

s1B88   LDA a1C28
        SEC
        BNE b1B96
        LDA #$7D     ;#%01111101
        CMP ZP_GAME_SPRITE_Y_COPY_TBL+13
        BCS b1B96
        DEC ZP_GAME_SPRITE_Y_COPY_TBL+13
b1B96   RTS

s1B97   LDA TMP_2493
        SEC
        BNE b1BA5
        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        CMP #$DE     ;#%11011110
        BCS b1BA5
        INC ZP_GAME_SPRITE_X_COPY_TBL+13
b1BA5   RTS

s1BA6   LDA TMP_2493
        SEC
        BNE b1BB4
        LDA #$7A     ;#%01111010
        CMP ZP_GAME_SPRITE_X_COPY_TBL+13
        BCS b1BB4
        DEC ZP_GAME_SPRITE_X_COPY_TBL+13
b1BB4   RTS

s1BB5   LDA GAME_JOY_STATE
        AND #$04                        ;Left pressed?
        CLC
        BEQ b1BC1                       ; No
        LDA #$7A     ;#%01111010
        CMP ZP_GAME_SPRITE_X_COPY_TBL+13
b1BC1   ROL a1C28
        LDA GAME_JOY_STATE
        AND #$08                        ;Right pressed?
        CLC
        BEQ b1BD0                       ; No
        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        CMP #$DE     ;#%11011110
b1BD0   ROL a1C28
        RTS

s1BD4   LDA GAME_JOY_STATE
        STA a1C27
        LDA #$00
        STA TMP_2493
        STA a1C28
        JSR s1BB5
        LSR a1C27
        BCC b1BED
        JSR s1B88
b1BED   ROR TMP_2493
        LSR a1C27
        BCC b1BF8
        JSR s1B79
b1BF8   ROR TMP_2493
        LSR a1C27
        BCC b1C03
        JSR s1BA6
b1C03   ROR TMP_2493
        LSR a1C27
        BCC b1C0E
        JSR s1B97
b1C0E   ROR TMP_2493
        ROR TMP_2493
        ROR TMP_2493
        ROR TMP_2493
        ROR TMP_2493
        LDA GAME_JOY_STATE_COPY2
        AND TMP_2493
        STA GAME_JOY_STATE_COPY2
        RTS

a1C27   .BYTE $00
a1C28   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s1C29
        LDA ZP_GAME_SMOOTH_X
        STA a1CC0

        LDA GAME_JOY_STATE
        TAX
        AND #$03                        ;Up or Down?
        BEQ b1C6B                       ; No
        TXA
        AND #$0C                        ;Left or Right?
        BEQ b1C6B                       ; No
        TXA
        AND #$06                        ;Down and Left?
        CMP #$06
        BEQ _L00                        ; No
        TXA
        AND #$09                        ;Up and Right?
        CMP #$09
        BNE _L01                        ; Yes

_L00    LDA a1CC0
        EOR #%00000111
        STA a1CC0

_L01    LDA ZP_GAME_SMOOTH_Y
        SEC
        SBC a1CC0
        BPL _L02
        EOR #$FF
        CLC
        ADC #$01
_L02    CMP #$04
        BEQ b1C6B
        LDA GAME_JOY_STATE
        AND #%00010011                  ;Left & Right masked
        STA GAME_JOY_STATE_COPY2
        RTS

b1C6B   TXA
        STA GAME_JOY_STATE_COPY2
b1C6F   RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Similar to s1C29 but for double-speed?
s1C70
        LDA GAME_IS_JOYSTICK_DISABLED
        BNE b1C6F                       ;Exit

        LDA ZP_GAME_SMOOTH_X
        AND #%11111110
        STA ZP_GAME_SMOOTH_X
        STA a1CC0

        LDA GAME_JOY_STATE
        TAX
        AND #$03                        ;Up or Down?
        BEQ b1C6B                       ; No
        TXA
        AND #$0C                        ;Left or Right?
        BEQ b1C6B                       ; No
        TXA
        AND #$06                        ;Down and Left?
        CMP #$06
        BEQ _L00                        ; No
        TXA
        AND #$09                        ;Up and Right?
        CMP #$09
        BNE _L01                        ; Yes

_L00    LDA a1CC0
        EOR #%00000110
        STA a1CC0

_L01    LDA ZP_GAME_SMOOTH_Y
        SEC
        SBC a1CC0
        BPL _L02
        EOR #$FF
        CLC
        ADC #$01
_L02    CMP #$04
        BEQ _L03
        LDA GAME_JOY_STATE
        AND #%00010011                  ;Left & Right masked
        STA GAME_JOY_STATE_COPY2
        RTS

_L03    TXA
        STA GAME_JOY_STATE_COPY2
        RTS

a1CC0   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_BY_1
        LDA #$00
        STA ZP_DELTA_X
        STA ZP_DELTA_Y
        STA ZP_GAME_HARD_SCROLL_DIR
        LSR GAME_JOY_STATE_COPY2
        BCC _L00
        JSR GAME_SMOOTH_SCROLL_Y_INC_BY_1       ;Up

_L00    LSR GAME_JOY_STATE_COPY2
        BCC _L01
        JSR GAME_SMOOTH_SCROLL_Y_DEC_BY_1       ;Down

_L01    LSR GAME_JOY_STATE_COPY2
        BCC _L02
        JSR GAME_SMOOTH_SCROLL_X_INC_BY_1       ;Left

_L02    LSR GAME_JOY_STATE_COPY2
        BCC _L03
        JSR GAME_SMOOTH_SCROLL_X_DEC_BY_1       ;Right

_L03    LDY GAME_JOY_STATE
        LDA ZP_GAME_HARD_SCROLL_DIR
        BNE b1CF2
        LDY #$FF
b1CF2   STY a12F1
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_BY_2
        LDA #$00
        STA ZP_DELTA_X
        STA ZP_DELTA_Y
        STA ZP_GAME_HARD_SCROLL_DIR
        LSR GAME_JOY_STATE_COPY2
        BCC _L00
        JSR GAME_SMOOTH_SCROLL_Y_INC_BY_2       ;Up

_L00    LSR GAME_JOY_STATE_COPY2
        BCC _L01
        JSR GAME_SMOOTH_SCROLL_Y_DEC_BY_2       ;Down

_L01    LSR GAME_JOY_STATE_COPY2
        BCC _L02
        JSR GAME_SMOOTH_SCROLL_X_INC_BY_2       ;Left

_L02    LSR GAME_JOY_STATE_COPY2
        BCC _L03
        JSR GAME_SMOOTH_SCROLL_X_DEC_BY_2       ;Right

_L03    LDY GAME_JOY_STATE
        LDA ZP_GAME_HARD_SCROLL_DIR
        BNE b1CF2
        LDY #$FF
        JMP b1CF2

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_READ_JOYSTICK
        LDA GAME_IS_JOYSTICK_DISABLED
        BEQ GAME_READ_JOYSTICK_L0

        LDA #$00
        STA GAME_JOY_STATE
        STA GAME_JOY_STATE_COPY
        STA GAME_JOY_LATEST_MOVEMENT
        STA GAME_JOY_STATE_COPY2
        RTS

GAME_IS_JOYSTICK_DISABLED
        .BYTE $00

GAME_READ_JOYSTICK_L0
        LDA a0966
        BEQ _L01
        JMP j08D4

_L01    LDA $DC01                       ;Read Joy port #2
        AND $DC00                       ;And it wih Read Joy port #1
        EOR #$FF                        ; Flip bits since it is active low
        AND #$1F                        ; Mask direction+fire
        STA GAME_JOY_STATE              ; Save the state
        STA GAME_JOY_STATE_COPY         ; twice (XXX: why?)

        AND #$0F                        ;Only select direction movements
        BEQ _L02                        ; Joy movement? No
        STA GAME_JOY_LATEST_MOVEMENT    ;Save joy movement
_L02    LDA GAME_JOY_STATE              ;Load full joy state
        RTS

GAME_JOY_STATE          .BYTE $00
GAME_JOY_STATE_COPY2    .BYTE $00
a1D64                   .BYTE $00       ;Unused?
a1D65                   .BYTE $00       ;Unused?
GAME_JOY_STATE_COPY     .BYTE $00       ;The joystick state: up,down,left,right,fire
GAME_JOY_LATEST_MOVEMENT
                        .BYTE $00       ;Like state, but with "fire" masked

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; ZP_GAME_HARD_SCROLL_DIR:
;       1: Scroll down
;       2: Scroll up
;       4: Scroll right
;    rest: Scroll left
GAME_DO_HARD_SCROLL
        LDA ZP_GAME_HARD_SCROLL_DIR
        STA GAME_HARD_SCROLL_DIR_COPY
        BEQ _EXIT

        JSR _DO_HARD_SCROLL

        LDA #$00
        STA ZP_GAME_HARD_SCROLL_DIR
_EXIT   RTS

_DO_HARD_SCROLL
        LSR A
        BCC _L00
        JMP GAME_HARD_SCROLL_DOWN

_L00    LSR A
        BCC _L01
        JMP GAME_HARD_SCROLL_UP

_L01    LSR A
        BCC _L02
        JMP GAME_HARD_SCROLL_RIGHT

_L02    JMP GAME_HARD_SCROLL_LEFT

GAME_HARD_SCROLL_DIR_COPY       .BYTE $00
                                .BYTE $00
a1D8E                           .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Copies the "copy" properties into the "non-copy" properties
; And for sprites 5-11, "sprite.x = sprite_copy.x * 2"
GAME_SPRITE_SYNC_PROPERTIES
        LDX #13
_L00    LDA ZP_GAME_SPRITE_Y_COPY_TBL,X
        STA ZP_GAME_SPRITE_Y_TBL,X
        LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL,X
        STA ZP_GAME_SPRITE_X_MSB_TBL,X
        LDA ZP_GAME_SPRITE_ORDER_COPY_TBL,X
        STA ZP_GAME_SPRITE_ORDER_TBL,X
        DEX
        BPL _L00

        LDX #$04
_L01    LDA ZP_GAME_SPRITE_X_COPY_TBL,X
        STA ZP_GAME_SPRITE_X_TBL,X
        DEX
        BPL _L01

        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        STA ZP_GAME_SPRITE_X_TBL+13
        LDA ZP_GAME_SPRITE_X_COPY_TBL+12
        STA ZP_GAME_SPRITE_X_TBL+12

        ; Sprites 5-11 use X *= 2
        LDX #$06
_L02    LDA ZP_GAME_SPRITE_X_COPY_TBL+5,X
        ASL A
        STA ZP_GAME_SPRITE_X_TBL+5,X
        ROL ZP_GAME_SPRITE_X_MSB_TBL+5,X
        DEX
        BPL _L02

        LDA aD1
        STA aD2
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Wait until raster gets triggered in the variable IRQ handler
GAME_WAIT_RASTER_TICK_VAR
_L00
        LDA GAME_RASTER_TICK_VAR
        BEQ _L00
        DEC GAME_RASTER_TICK_VAR
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_X_INC_BY_1
        INC ZP_DELTA_X
        LDA ZP_GAME_SMOOTH_X
        CMP #$07
        BEQ b1DE0
        INC ZP_GAME_SMOOTH_X

j1DD5   LDA $D016                       ;VIC Control Register 2
        AND #$10                        ;Mask x-smooth scrolling
        ORA ZP_GAME_SMOOTH_X               ;X-smooth scrolling
        STA $D016                       ;VIC Control Register 2
        RTS

b1DE0   LDA #$00
        STA ZP_GAME_SMOOTH_X
        LDA ZP_GAME_HARD_SCROLL_DIR
        ORA #$04                        ;Hard Scroll right
        STA ZP_GAME_HARD_SCROLL_DIR
        JMP j1DD5

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_X_INC_BY_2
        INC ZP_DELTA_X
        LDA ZP_GAME_SMOOTH_X
        CMP #$06
        BEQ _L00
        INC ZP_GAME_SMOOTH_X
        INC ZP_GAME_SMOOTH_X
        JMP j1DD5

_L00    LDA #$00
        STA ZP_GAME_SMOOTH_X
        LDA ZP_GAME_HARD_SCROLL_DIR
        ORA #$04                        ;Hard Scroll right
        STA ZP_GAME_HARD_SCROLL_DIR
        JMP j1DD5

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $1E09
; Hard Scroll right (one character)
GAME_HARD_SCROLL_RIGHT
        DEC ZP_GAME_MAP_OFFSET_X
        LDX #38
_L00    LDA $4000,X
        STA $4000+1,X
        LDA $4000+40*1,X
        STA $4000+40*1+1,X
        LDA $4000+40*2,X
        STA $4000+40*2+1,X
        LDA $4000+40*3,X
        STA $4000+40*3+1,X
        LDA $4000+40*4,X
        STA $4000+40*4+1,X
        LDA $4000+40*5,X
        STA $4000+40*5+1,X
        LDA $4000+40*6,X
        STA $4000+40*6+1,X
        LDA $4000+40*7,X
        STA $4000+40*7+1,X
        LDA $4000+40*8,X
        STA $4000+40*8+1,X
        DEX
        BPL _L00

        LDX #38
_L01    LDA $4000+40*9,X
        STA $4000+40*9+1,X
        LDA $4000+40*10,X
        STA $4000+40*10+1,X
        LDA $4000+40*11,X
        STA $4000+40*11+1,X
        LDA $4000+40*12,X
        STA $4000+40*12+1,X
        LDA $4000+40*13,X
        STA $4000+40*13+1,X
        LDA $4000+40*14,X
        STA $4000+40*14+1,X
        LDA $4000+40*15,X
        STA $4000+40*15+1,X
        LDA $4000+40*16,X
        STA $4000+40*16+1,X
        LDA $4000+40*17,X
        STA $4000+40*17+1,X
        DEX
        BPL _L01

        LDX #38
_L02    LDA $4000+40*18,X
        STA $4000+40*18+1,X
        LDA $4000+40*19,X
        STA $4000+40*19+1,X
        LDA $4000+40*20,X
        STA $4000+40*20+1,X
        LDA $4000+40*21,X
        STA $4000+40*21+1,X
        LDA $4000+40*22,X
        STA $4000+40*22+1,X
        LDA $4000+40*23,X
        STA $4000+40*23+1,X
        LDA $4000+40*24,X
        STA $4000+40*24+1,X
        DEX
        BPL _L02
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_X_DEC_BY_1
        DEC ZP_DELTA_X
        LDA ZP_GAME_SMOOTH_X
        BEQ _L00
        DEC ZP_GAME_SMOOTH_X
        JMP j1DD5

_L00    LDA #$07
        STA ZP_GAME_SMOOTH_X
        LDA ZP_GAME_HARD_SCROLL_DIR
        ORA #$08                        ;Hard scroll left
        STA ZP_GAME_HARD_SCROLL_DIR
        JMP j1DD5

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_X_DEC_BY_2
        DEC ZP_DELTA_X
        LDA ZP_GAME_SMOOTH_X
        BEQ _L00
        DEC ZP_GAME_SMOOTH_X
        DEC ZP_GAME_SMOOTH_X
        JMP j1DD5

_L00    LDA #$06
        STA ZP_GAME_SMOOTH_X
        LDA ZP_GAME_HARD_SCROLL_DIR
        ORA #$08                        ;Hard scroll left
        STA ZP_GAME_HARD_SCROLL_DIR
        JMP j1DD5

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_HARD_SCROLL_LEFT
        INC ZP_GAME_MAP_OFFSET_X
        LDX #$00
_L00    LDA $4000+40*0+1,X
        STA $4000+40*0+0,X
        LDA $4000+40*1+1,X
        STA $4000+40*1+0,X
        LDA $4000+40*2+1,X
        STA $4000+40*2+0,X
        LDA $4000+40*3+1,X
        STA $4000+40*3+0,X
        LDA $4000+40*4+1,X
        STA $4000+40*4+0,X
        LDA $4000+40*5+1,X
        STA $4000+40*5+0,X
        LDA $4000+40*6+1,X
        STA $4000+40*6+0,X
        LDA $4000+40*7+1,X
        STA $4000+40*7+0,X
        LDA $4000+40*8+1,X
        STA $4000+40*8+0,X
        INX
        CPX #39
        BNE _L00

        LDX #$00
_L01    LDA $4000+40*9+1,X
        STA $4000+40*9+0,X
        LDA $4000+40*10+1,X
        STA $4000+40*10+0,X
        LDA $4000+40*11+1,X
        STA $4000+40*11+0,X
        LDA $4000+40*12+1,X
        STA $4000+40*12+0,X
        LDA $4000+40*13+1,X
        STA $4000+40*13+0,X
        LDA $4000+40*14+1,X
        STA $4000+40*14+0,X
        LDA $4000+40*15+1,X
        STA $4000+40*15+0,X
        LDA $4000+40*16+1,X
        STA $4000+40*16+0,X
        LDA $4000+40*17+1,X
        STA $4000+40*17+0,X
        INX
        CPX #39
        BNE _L01

        LDX #$00
_L02
        LDA $4000+40*18+1,X
        STA $4000+40*18+0,X
        LDA $4000+40*19+1,X
        STA $4000+40*19+0,X
        LDA $4000+40*20+1,X
        STA $4000+40*20+0,X
        LDA $4000+40*21+1,X
        STA $4000+40*21+0,X
        LDA $4000+40*22+1,X
        STA $4000+40*22+0,X
        LDA $4000+40*23+1,X
        STA $4000+40*23+0,X
        LDA $4000+40*24+1,X
        STA $4000+40*24+0,X
        INX
        CPX #39
        BNE _L02
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_Y_INC_BY_1
        INC ZP_DELTA_Y
        LDA ZP_GAME_SMOOTH_Y
        CMP #$07
        BCS b1FA6
        INC ZP_GAME_SMOOTH_Y

s1F9B   LDA $D011                       ;VIC Control Register 1
        AND #$70                        ;Mask y-smooth scrolling
        ORA ZP_GAME_SMOOTH_Y            ;Y-smooth scrolling
        STA $D011                       ;VIC Control Register 1
        RTS

b1FA6   LDA #$00
        STA ZP_GAME_SMOOTH_Y
        LDA ZP_GAME_HARD_SCROLL_DIR
        ORA #$01                        ;Hard scroll down
        STA ZP_GAME_HARD_SCROLL_DIR
        JMP s1F9B

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_Y_INC_BY_2
        INC ZP_DELTA_Y
        LDA ZP_GAME_SMOOTH_Y
        CMP #$06
        BCS _L00
        INC ZP_GAME_SMOOTH_Y
        INC ZP_GAME_SMOOTH_Y
        JMP s1F9B

_L00    LDA #$00
        STA ZP_GAME_SMOOTH_Y
        LDA ZP_GAME_HARD_SCROLL_DIR
        ORA #$01                        ;Hard scroll down
        STA ZP_GAME_HARD_SCROLL_DIR
        JMP s1F9B

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Scrolls down:
;   - Starts from the middle of the screen possibly to avoid any kind of flicker
;     with raster
;   - Copies left part of screen / right part of the screen: I guess due to
;     to raster flicker as well (???)
;   - But the scroll up routine doesn't do this
GAME_HARD_SCROLL_DOWN
        LDX #19
        INC ZP_MAP_OFFSET_Y_LSB
        BNE _L00
        INC ZP_MAP_OFFSET_Y_MSB

_L00    LDA $4000+40*9,X
        STA f211D,X
        LDA $4000+40*9+20,X
        STA f2131,X

        LDA $4000+40*8,X
        STA $4000+40*9,X
        LDA $4000+40*8+20,X
        STA $4000+40*9+20,X
        LDA $4000+40*7+0,X
        STA $4000+40*8+0,X
        LDA $4000+40*7+20,X
        STA $4000+40*8+20,X
        LDA $4000+40*6+0,X
        STA $4000+40*7+0,X
        LDA $4000+40*6+20,X
        STA $4000+40*7+20,X
        LDA $4000+40*5+0,X
        STA $4000+40*6+0,X
        LDA $4000+40*5+20,X
        STA $4000+40*6+20,X
        LDA $4000+40*4+0,X
        STA $4000+40*5+0,X
        LDA $4000+40*4+20,X
        STA $4000+40*5+20,X
        LDA $4000+40*3+0,X
        STA $4000+40*4+0,X
        LDA $4000+40*3+20,X
        STA $4000+40*4+20,X
        LDA $4000+40*2+0,X
        STA $4000+40*3+0,X
        LDA $4000+40*2+20,X
        STA $4000+40*3+20,X
        LDA $4000+40*1+0,X
        STA $4000+40*2+0,X
        LDA $4000+40*1+20,X
        STA $4000+40*2+20,X
        LDA $4000+40*0+0,X
        STA $4000+40*1+0,X
        LDA $4000+40*0+20,X
        STA $4000+40*1+20,X
        DEX
        BPL _L00

        LDX #19
_L01    LDA $4000+40*17+0,X
        STA f2145,X
        LDA $4000+40*17+20,X
        STA f2159,X

        LDA $4000+40*16+0,X
        STA $4000+40*17+0,X
        LDA $4000+40*16+20,X
        STA $4000+40*17+20,X
        LDA $4000+40*15+0,X
        STA $4000+40*16+0,X
        LDA $4000+40*15+20,X
        STA $4000+40*16+20,X
        LDA $4000+40*14+0,X
        STA $4000+40*15+0,X
        LDA $4000+40*14+20,X
        STA $4000+40*15+20,X
        LDA $4000+40*13+0,X
        STA $4000+40*14+0,X
        LDA $4000+40*13+20,X
        STA $4000+40*14+20,X
        LDA $4000+40*12+0,X
        STA $4000+40*13+0,X
        LDA $4000+40*12+20,X
        STA $4000+40*13+20,X
        LDA $4000+40*11+0,X
        STA $4000+40*12+0,X
        LDA $4000+40*11+20,X
        STA $4000+40*12+20,X
        LDA $4000+40*10+0,X
        STA $4000+40*11+0,X
        LDA $4000+40*10+20,X
        STA $4000+40*11+20,X

        LDA f211D,X
        STA $4000+40*10+0,X
        LDA f2131,X
        STA $4000+40*10+20,X

        DEX
        BPL _L01

        LDX #19
_L02    LDA $4000+40*23+0,X
        STA $4000+40*24+0,X
        LDA $4000+40*23+20,X
        STA $4000+40*24+20,X
        LDA $4000+40*22+0,X
        STA $4000+40*23+0,X
        LDA $4000+40*22+20,X
        STA $4000+40*23+20,X
        LDA $4000+40*21+0,X
        STA $4000+40*22+0,X
        LDA $4000+40*21+20,X
        STA $4000+40*22+20,X
        LDA $4000+40*20+0,X
        STA $4000+40*21+0,X
        LDA $4000+40*20+20,X
        STA $4000+40*21+20,X
        LDA $4000+40*19+0,X
        STA $4000+40*20+0,X
        LDA $4000+40*19+20,X
        STA $4000+40*20+20,X
        LDA $4000+40*18+0,X
        STA $4000+40*19+0,X
        LDA $4000+40*18+20,X
        STA $4000+40*19+20,X

        LDA f2145,X
        STA $4000+40*18+0,X
        LDA f2159,X
        STA $4000+40*18+20,X
        DEX
        BPL _L02
        RTS

f211D   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00
f2131   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00
f2145   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00
f2159   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_Y_DEC_BY_1
        DEC ZP_DELTA_Y
        LDA ZP_GAME_SMOOTH_Y
        BEQ _L00
        DEC ZP_GAME_SMOOTH_Y
        JMP s1F9B

_L00    LDA #$07
        STA ZP_GAME_SMOOTH_Y
        LDA ZP_GAME_HARD_SCROLL_DIR
        ORA #$02                        ;Hard scroll up
        STA ZP_GAME_HARD_SCROLL_DIR
        JMP s1F9B

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SMOOTH_SCROLL_Y_DEC_BY_2
        DEC ZP_DELTA_Y
        LDA ZP_GAME_SMOOTH_Y
        CMP #$02
        BCC _L00
        DEC ZP_GAME_SMOOTH_Y
        DEC ZP_GAME_SMOOTH_Y
        JMP s1F9B

_L00    LDA #$06
        STA ZP_GAME_SMOOTH_Y
        LDA ZP_GAME_HARD_SCROLL_DIR
        ORA #$02                        ;Hard scroll up
        STA ZP_GAME_HARD_SCROLL_DIR
        JMP s1F9B

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Like scroll down, it splits scrolling in 3 to avoid flicker in raster
;$21A1
GAME_HARD_SCROLL_UP
        LDX #39
        STX a0EB3
        DEC ZP_MAP_OFFSET_Y_LSB
        LDA ZP_MAP_OFFSET_Y_LSB
        CMP #$FF
        BNE _L00
        DEC ZP_MAP_OFFSET_Y_MSB

_L00    LDA $4000+40*1+0,X
        STA $4000+40*0+0,X
        LDA $4000+40*2+0,X
        STA $4000+40*1+0,X
        LDA $4000+40*3+0,X
        STA $4000+40*2+0,X
        LDA $4000+40*4+0,X
        STA $4000+40*3+0,X
        LDA $4000+40*5+0,X
        STA $4000+40*4+0,X
        LDA $4000+40*6+0,X
        STA $4000+40*5+0,X
        LDA $4000+40*7+0,X
        STA $4000+40*6+0,X
        LDA $4000+40*8+0,X
        STA $4000+40*7+0,X
        LDA $4000+40*9+0,X
        STA $4000+40*8+0,X
        DEX
        BPL _L00

        LDX #39
_L01    LDA $4000+40*10+0,X
        STA $4000+40*9+0,X
        LDA $4000+40*11+0,X
        STA $4000+40*10+0,X
        LDA $4000+40*12+0,X
        STA $4000+40*11+0,X
        LDA $4000+40*13+0,X
        STA $4000+40*12+0,X
        LDA $4000+40*14+0,X
        STA $4000+40*13+0,X
        LDA $4000+40*15+0,X
        STA $4000+40*14+0,X
        LDA $4000+40*16+0,X
        STA $4000+40*15+0,X
        LDA $4000+40*17+0,X
        STA $4000+40*16+0,X
        DEX
        BPL _L01

        LDX #39
_L02    LDA $4000+40*18+0,X
        STA $4000+40*17+0,X
        LDA $4000+40*19+0,X
        STA $4000+40*18+0,X
        LDA $4000+40*20+0,X
        STA $4000+40*19+0,X
        LDA $4000+40*21+0,X
        STA $4000+40*20+0,X
        LDA $4000+40*22+0,X
        STA $4000+40*21+0,X
        LDA $4000+40*23+0,X
        STA $4000+40*22+0,X
        LDA $4000+40*24+0,X
        STA $4000+40*23+0,X
        DEX
        BPL _L02
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Waits until rasters gets to #$FB
GAME_WAIT_RASTER_TICK_DB
        LDA #$00
        STA a055A
_L00    LDA GAME_RASTER_TICK_DB
        BEQ _L00
        DEC GAME_RASTER_TICK_DB
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SETUP_IRQ
        SEI
        LDA #<GAME_IRQ_HANDLER_RASTER_VAR
        STA $FFFE                       ;IRQ
        LDA #>GAME_IRQ_HANDLER_RASTER_VAR
        STA $FFFF                       ;IRQ

        LDA #$00                        ;raster 8bit=0, y-smooth=0, 24-rows
        STA $D011                       ; VIC Control Register 1
        LDA #$01                        ;Enable Raster IRQ, and Timer A IRQ
        STA $D01A                       ; VIC Interrupt Mask Register (IMR)
        STA $DC0D                       ; CIA1: CIA Interrupt Control Register
        LDA $DC0D                       ;CIA1: CIA Interrupt Control Register
        LDA #$01
        STA a02
        LDA #$35                        ;RAM / IO / RAM
        STA a01
        LDA #$07
        STA a09
        LDA #$32
        STA ZP_NEXT_RASTER_IRQ_POS
        STA $D012                       ;Raster Position
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; IRQ Handler
GAME_IRQ_HANDLER_RASTER_VAR
        PHA
        TYA
        PHA
        TXA
        PHA

        LDA #$FF
        STA $D019                       ;ACK all interrupts

        CLD
        LDA ZP_NEXT_RASTER_IRQ_POS
        CLC
        ADC #$0E
        STA ZP_NEXT_RASTER_IRQ_POS

        CLI
_L00    LDY ZP_GAME_SPRITE_IDX_TO_PROCESS
        LDX ZP_GAME_SPRITE_ORDER_TBL,Y
        LDA ZP_GAME_SPRITE_Y_TBL,X
        CMP ZP_NEXT_RASTER_IRQ_POS
        BCS b2306

        STA ZP_TMP_06
        LDY a09
        LDA ZP_GAME_SPRITE_COLOR_TBL,X
        STA $D027,Y                     ;Sprite 0 Color
        LDA ZP_GAME_SPRITE_FRAME_TBL,X
        STA GAME_SPR_FRAME_TBL,Y
        LDA $D010                       ;Sprites 0-7 MSB of X coordinate
        AND f2483,Y
        LSR ZP_GAME_SPRITE_X_MSB_TBL,X  ;Test whether it has X MSB on
        BCC _L01
        ORA f248B,Y
_L01    ROL ZP_GAME_SPRITE_X_MSB_TBL,X  ;Restore bit
        STA $D010                       ;Sprites 0-7 MSB of X coordinate
        TYA
        ASL A
        TAY
        LDA ZP_TMP_06
        STA $D001,Y                     ;Sprite 0 Y Pos
        LDA ZP_GAME_SPRITE_X_TBL,X
        STA $D000,Y                     ;Sprite 0 X Pos
        DEC ZP_GAME_SPRITE_IDX_TO_PROCESS
        BMI _L02
        DEC a09
        BNE _L00
        LDA #$07
        STA a09
        JMP _L00

_L02    LDA #$07
        STA a09
        LDA #$32
        STA ZP_NEXT_RASTER_IRQ_POS

        LDA #<GAME_IRQ_HANDLER_RASTER_DB
        STA $FFFE                       ;IRQ
        LDA #>GAME_IRQ_HANDLER_RASTER_DB
        STA $FFFF                       ;IRQ
        INC GAME_RASTER_TICK_VAR
        LDA #$DB
        STA $D012                       ;Raster Position

EXIT_IRQ
        PLA
        TAX
        PLA
        TAY
        PLA
        RTI

        RTS

GAME_RASTER_TICK_VAR    .BYTE $00

b2306   SBC #$0E
        CMP $D012                       ;Raster Position
        BCS _L00

        LDA $D012                       ;Raster Position
        ADC #$02
_L00    ADC #$00
        STA $D012                       ;Raster Position
        STA ZP_NEXT_RASTER_IRQ_POS

        PLA
        TAX
        PLA
        TAY
        PLA
        RTI

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; IRQ Handler
; IRQ that gets triggered when raster is at $DB
GAME_IRQ_HANDLER_RASTER_DB
        PHA
        TYA
        PHA
        TXA
        PHA

        LDA #$01
        STA $D019                       ;ACK Raster interrupt
        CLD

        SEI
        LDA #<GAME_IRQ_HANDLER_RASTER_VAR
        STA $FFFE                       ;IRQ
        LDA #>GAME_IRQ_HANDLER_RASTER_VAR
        STA $FFFF                       ;IRQ
        LDA #%11000000                  ;Sprite 6 and 7 with MSB on
        STA $D010                       ;Sprites 0-7 MSB of X coordinate
        LDA #%00000011                  ;Sprites 0 and 1 with 2X Horizontal
        STA $D01D                       ;Sprites Expand 2x Horizontal (X)
        LDA #%11111100                  ;All but sprites 0 and 1 with Multi-color
        STA $D01C                       ;Sprites Multi-Color Mode Select

        ; Setup pos for Sprites 0 and 1
        LDA #225
        STA $D001                       ;Sprite 0 Y Pos
        STA $D003                       ;Sprite 1 Y Pos
        LDA #32
        STA $D000                       ;Sprite 0 X Pos
        LDA #80
        STA $D002                       ;Sprite 1 X Pos

        LDA #16                         ;Energy/Score sprite frame (left)
        STA GAME_SPR_FRAME_TBL
        LDA #17                         ;Energy/Score sprite frame (right)
        STA GAME_SPR_FRAME_TBL+1
        LDA a2425
        STA $D027                       ;Sprite 0 Color: White ($11 = $01)
        STA $D028                       ;Sprite 1 Color: Whtie ($11 = $01)

        LDY #$0A
        LDX #$05
_L00    LDA #225                        ;Same Y for all weapons
        STA $D005,Y                     ;Sprite 2 Y Pos
        LDA GAME_DASHBOARD_SPR_X_TBL,X
        STA $D004,Y                     ;Sprite 2 X Pos
        LDA GAME_DASHBOARD_SPR_FRAME_TBL,X
        STA GAME_SPR_FRAME_TBL+2,X
        LDA GAME_DASHBOARD_SPR_COLOR_TBL,X
        STA $D029,X                     ;Sprite 2 Color
        DEY
        DEY
        DEX
        BPL _L00

        LDA GAME_JOY_STATE_COPY
        STA GAME_JOY_STATE
        LDA TMP_2493
        PHA
        LDA a30
        PHA
        LDA a31
        PHA
        LDA COPTER_MODE_ENABLED
        BNE _L01
        JSR s15F1
        JMP _L02

_L01    JSR GAME_COPTER_ANIM_COPTER_HERO_BIS

_L02    LDA #$0D                        ;Color Light Green
        STA $D027                       ;Sprite 0 Color
        STA $D028                       ;Sprite 1 Color
        JSR s1B5A

        LDA COPTER_MODE_ENABLED
        BEQ _L03
        JSR s1C70
        JMP _L04

_L03    JSR s1C29
_L04    JSR s1312
        LDA GAME_DASHBOARD_SPR_COLOR_TBL+6
        STA $D02D                       ;Sprite 6 Color
        STA $D02E                       ;Sprite 7 Color
        PLA
        STA a31
        PLA
        STA a30
        LDA IS_GAME_PAUSED
        BEQ _L05

        LDA #$00
        STA GAME_JOY_STATE
        STA GAME_JOY_STATE_COPY2
        STA GAME_JOY_STATE_COPY

        LDA #$00
        STA $D418                       ;Select Filter Mode and Volume
        JSR s03FC
        DEC GAME_RASTER_TICK_VAR        ;In pause mode "untick" the "tick"
        JMP _L06

_L05    INC GAME_RASTER_TICK_DB
        JSR s03FC

_L06    LDA COPTER_MODE_ENABLED
        BEQ _L07
        JSR ENEMY_COPTER_ANIM_BIS
        JMP _L08

_L07    JSR s1BD4
_L08    JSR s0EB4
        JSR s2436
        LDA ZP_GAME_HARD_SCROLL_DIR
        BNE _L09
        JSR GAME_MAYBE_TOGGLE_PAUSE
_L09    PLA
        STA TMP_2493
        JMP EXIT_IRQ

        .BYTE $00
GAME_DASHBOARD_SPR_X_TBL
        .BYTE $AA,$C8,$E0,$FC,$1C,$34
GAME_DASHBOARD_SPR_FRAME_TBL
        .BYTE 20,27,28                  ;Sprite frames: Knife, Main Weapon Left, Main Weapon right
        .BYTE 19                        ;Grenade
        .BYTE 25                        ;Gatling Gun/Missile left
        .BYTE 26                        ;Gatling Gun/Missile right

a2425   .BYTE $00

GAME_DASHBOARD_SPR_COLOR_TBL
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00

GAME_DASHBOARD_COLOR_REF_TBL
        .BYTE $0B,$04,$05,$05,$09,$0C,$09,$06

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s2436   LDA #$00
        STA $D012                       ;Raster Position
        JSR s19D1
        LDA COPTER_MODE_ENABLED
        BEQ _L00
        JSR GAME_SMOOTH_SCROLL_BY_2
        JMP _L01

_L00    JSR GAME_SMOOTH_SCROLL_BY_1

_L01    LDA ZP_GAME_SPRITE_Y_TBL+13
        STA $D001                       ;Sprite 0 Y Pos
        LDA ZP_GAME_SPRITE_X_TBL+13
        STA $D000                       ;Sprite 0 X Pos

        LDA $D010                       ;Sprites 0-7 MSB of X coordinate
        AND #%11111110
        STA $D010                       ;Sprites 0-7 MSB of X coordinate
        LSR ZP_GAME_SPRITE_X_MSB_TBL+13
        BCC _L02

        LDA $D010                       ;Sprites 0-7 MSB of X coordinate
        ORA #$01
        STA $D010                       ;Sprites 0-7 MSB of X coordinate

_L02    LDA COPTER_MODE_ENABLED         ;Use sprite color from Copter mode as well
        STA $D027                       ;Sprite 0 Color
        LDA #$00
        STA $D01D                       ;Sprites Expand 2x Horizontal (X)
        LDA #%11111110
        STA $D01C                       ;Sprites Multi-Color Mode Select
        LDA aD2
        STA GAME_SPR_FRAME_TBL
        RTS

COPTER_MODE_ENABLED             .BYTE $00
                                .BYTE $00
GAME_RASTER_TICK_DB             .BYTE $00
f2483                           .BYTE $FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F
f248B                           .BYTE $01,$02,$04,$08,$10,$20,$40,$80
TMP_2493                        .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s2494   LDY #$0D
_L00    TYA
        STA ZP_GAME_SPRITE_ORDER_COPY_TBL,Y
        LDA #$00
        STA ZP_GAME_SPRITE_STATE_TBL,X
        LDA #$14
        STA ZP_GAME_SPRITE_Y_COPY_TBL,Y
        STA ZP_GAME_SPRITE_Y_TBL,Y
        DEY
        BPL _L00

        LDA #$FF                        ;All sprites
        STA $D015                       ;Sprite display Enable
        JSR GAME_SPRITE_SORT
        JMP GAME_SPRITE_SYNC_PROPERTIES

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s24B4   LDA a24F4
        AND #$48     ;#%01001000
        ADC #$38     ;#%00111000
        ASL A
        ASL A
        ROL a24F7
        ROL a24F6
        ROL a24F5
        ROL a24F4
        LDA a24F4
        EOR $DC04                       ;CIA1: Timer A: Low-Byte
        STA a24F4
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s24D3   STA a2746
        JSR s24B4
        STA a2745
        STX a195B
        LDX #$08
        LDA #$00
_L00    LSR a2745
        BCC _L01
        CLC
        ADC a2746
_L01    ROR A
        DEX
        BNE _L00
        LDX a195B
        RTS

a24F4   .BYTE $FF
a24F5   .BYTE $80
a24F6   .BYTE $1B
a24F7   .BYTE $34,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Why only update the score is there is no scrolling?
GAME_UPDATE_SPRITE_SCORE
        LDA GAME_HARD_SCROLL_DIR_COPY
        BEQ _L00
        RTS

_L00    LDX #$05
_L01    LDA PLYR_SCORE,X
        CMP PLYR_SCORE_IN_SPRITE,X      ;Don't update sprite if it already has
        BEQ _L02                        ; this value
        STX TMP_2493
        JSR _UPDATE_SPRITE_SCORE_DIGIT
        LDX TMP_2493
_L02    DEX
        BPL _L01
        RTS

_UPDATE_SPRITE_SCORE_DIGIT
        ASL A
        ASL A
        ASL A
        CPX #$03
        TAX
        BCS _L03
        LDY TMP_2493
        JMP _L04

_L03    LDA TMP_2493
        ADC #$3C
        TAY
_L04    LDA CHARSET_DIGITS_0_9,X        ;Charset for 0-9
        STA $4000+64*16+42,Y            ;Sprite frame for Score
        INY
        INY
        INY
        INX
        TXA
        AND #$07
        CMP #$07
        BNE _L04
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Updates the player's total score based on points
GAME_UPDATE_SCORE_FROM_POINTS
        LDX #$05
_L00    LDA PLYR_SCORE,X
        STA PLYR_SCORE_IN_SPRITE,X
        CLC
        ADC LOCAL_POINTS,X
        CMP #10
        BCC _L01

        SBC #10
        INC LOCAL_POINTS-1,X            ;Bug? when x==0, it changes PLYR_SCORE_IN_SPRITE
_L01    STA PLYR_SCORE,X
        LDA #$00
        STA LOCAL_POINTS,X
        DEX
        BPL _L00
        RTS

PLYR_SCORE
        .BYTE $00,$00,$00,$00,$00,$00
PLYR_SCORE_IN_SPRITE
        .BYTE $09,$09,$09,$09,$09,$09
LOCAL_POINTS
        .BYTE $00,$00,$00,$00,$00,$00
        .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s257D   LDA a25C4
        SEC
        SBC a25C7
        CMP a25C5
        BCS _L00
        ASL a25C7
        CLC
        ADC a25C7
        CMP a25C5
        BCC _L00
        LSR a25C1
        ROR a25C0
        LSR a25C3
        ROR a25C2
        LSR a25C6
        LDA a25C0
        SEC
        SBC a25C6
        CMP a25C2
        BCS _L00
        ASL a25C6
        CLC
        ADC a25C6
        CMP a25C2
        BCC _L00
        SEC
        RTS

_L00    CLC
        RTS

a25C0   .BYTE $00
a25C1   .BYTE $00
a25C2   .BYTE $00
a25C3   .BYTE $00
a25C4   .BYTE $00
a25C5   .BYTE $00
a25C6   .BYTE $00
a25C7   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s25C8   LDX a25DD
_L00    LDA f1961,X
        BEQ _L01
        JSR s25DE
        JMP _L02

_L01    JSR s2661
_L02    DEX
        BPL _L00
        RTS

a25DD   .BYTE $03

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s25DE   LDA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        CMP #10
        BCS b25F0
j25E4   LDA #$00
        STA f1961,X
        LDA #$00
        STA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        DEC ZP_GAME_SPRITE_STATE_TBL+5,X
        RTS

b25F0   CMP #$C5     ;#%11000101
        BCC b25F7
        JMP j25E4

b25F7   LDA ZP_GAME_SPRITE_X_COPY_TBL+5,X
        CMP #$04     ;#%00000100
        BCS b2600
        JMP j25E4

b2600   CMP #$AC     ;#%10101100
        BCS j25E4
        LDA f055B,X
        BPL b2635
        LDA fDA,X
        SEC
        SBC fD6,X
        STA fDA,X
        BCS b2628
        ADC fDE,X
        STA fDA,X
        LDA f055B,X
        AND #$01     ;#%00000001
        BEQ b2624
        INC ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        INC ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        JMP b2628

b2624   DEC ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        DEC ZP_GAME_SPRITE_Y_COPY_TBL+5,X
b2628   LDA f055B,X
        AND #$02     ;#%00000010
        BEQ b2632
        INC ZP_GAME_SPRITE_X_COPY_TBL+5,X
        RTS

b2632   DEC ZP_GAME_SPRITE_X_COPY_TBL+5,X
        RTS

b2635   LDA fDA,X
        SEC
        SBC fD6,X
        STA fDA,X
        BCS b2650
        ADC fDE,X
        STA fDA,X
        LDA f055B,X
        AND #$02     ;#%00000010
        BEQ b264E
        INC ZP_GAME_SPRITE_X_COPY_TBL+5,X
        JMP b2650

b264E   DEC ZP_GAME_SPRITE_X_COPY_TBL+5,X
b2650   LDA f055B,X
        AND #$01     ;#%00000001
        BEQ b265C
        INC ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        INC ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        RTS

b265C   DEC ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        DEC ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s2661   LDA #$05
        JSR s24D3
        TAY
        LDA GAME_CURRENT_ENEMY_STATE_TBL,Y
        CMP #$01                        ;Alive?
        BEQ _L00
        CMP #$04                        ;Dead?
        BEQ _L00
        RTS

_L00    LDA ZP_MAP_OFFSET_Y_LSB
        STA TMP_2493
        LDA ZP_MAP_OFFSET_Y_MSB
        LSR A
        ROR TMP_2493
        LSR A
        ROR TMP_2493
        LDA #$FF
        SEC
        SBC TMP_2493
        LSR A
        LSR A
        STX aD5
        JSR s2961
        LDX aD5
        CMP #$01
        BEQ _FIRE_BULLET
        RTS

_FIRE_BULLET
        INC f1961,X
        INC a11C1
        INC ZP_GAME_SPRITE_STATE_TBL+5,X
        LDA #18                         ;Frame: Bullet
        STA ZP_GAME_SPRITE_FRAME_TBL+5,X
        LDA #$0F                        ;Color Light Grey
        STA ZP_GAME_SPRITE_COLOR_TBL+5,X
        LDA #$00
        STA f055B,X
        LDA ZP_GAME_SPRITE_X_MSB_COPY_TBL,Y
        LSR A
        LDA ZP_GAME_SPRITE_X_COPY_TBL,Y
        ROR A
        STA ZP_GAME_SPRITE_X_COPY_TBL+5,X
        STA TMP_2493
        LDA ZP_GAME_SPRITE_Y_COPY_TBL,Y
        STA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        LSR A
        STA a2745
        LDA ZP_GAME_SPRITE_X_COPY_TBL+13
        LSR A
        SEC
        SBC TMP_2493
        BCS _L02
        EOR #$FF
        ADC #$01
_L02    ROL f055B,X
        STA fD6,X
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+13
        LSR A
        SEC
        SBC a2745
        BCS _L03
        LDA #$FF
        ADC #$01
_L03    ROL f055B,X
        CMP fD6,X
        BCS _L04
        LDY fD6,X
        STA fD6,X
        LDA f055B,X
        ORA #$80
        STA f055B,X
        TYA
_L04    STA fDE,X
        LSR A
        STA fDA,X
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Args: A= xx_rrr_ccc
;       ccc = represents the Column to choose (bits 0-2)
;       rrr = represents the Row to choose (bits 3-5)
;       xx = must be 0 (bits 6,7)
; Ready keyboard
IS_KEY_PRESSED
        STY _TMP_Y
        PHA
        LSR A
        LSR A
        LSR A
        TAY
        LDA _KEYBOARD_ROW_MASK,Y        ;Filter keyboard row
        STA $DC00                       ; CIA1: Data Port Register A
        PLA
        AND #$07
        TAY
        LDA $DC01                       ;Ready keyboard column
        AND _KEYBOARD_COL_MASK,Y
        BNE _L00

        LDA #$FF                        ;Disable keyboard scanning
        STA $DC00                       ; All rows desactivated
        LDA $DC01                       ;Read Joy port #2
        AND _KEYBOARD_COL_MASK,Y
        BEQ _L00
        SEC                             ;Tag it as pressed
        JMP _L01

_L00    CLC                             ;Tag it as not-pressed
_L01    LDY _TMP_Y

        LDA #$FF                        ;Default values
        STA $DC00
        LDA #$7F                        ;Default values
        STA $DC01
        RTS

_TMP_Y                  .BYTE $00
_KEYBOARD_ROW_MASK      .BYTE $FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F
_KEYBOARD_COL_MASK      .BYTE $01,$02,$04,$08,$10,$20,$40,$80
a2745   .BYTE $00
a2746   .BYTE $00
a2747   .BYTE $E2,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_MAP_PAINT_LEFT
        LDA #$27
        STA a27EF
        STA TMP_2493
        LDX #$00
        LDA #>$4000                     ;MSB address
        STA a27F0
        LDA ZP_MAP_OFFSET_Y_MSB
        STA aE1
        LDA ZP_MAP_OFFSET_Y_LSB
        STA aE0
        AND #$07     ;#%00000111
        STA aF3
        LDA ZP_GAME_MAP_OFFSET_X
        CLC
        ADC #$27     ;#%00100111
        TAY
        AND #$07     ;#%00000111
        STA aF7
        TYA
        LSR A
        LSR A
        LSR A
        STA aF2
        LDA ZP_GAME_MAP_OFFSET_X
        JMP j27A6

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_MAP_PAINT_RIGHT
        LDX #$00
        STX a27EF
        STX TMP_2493
        LDA #>$4000                     ;MSB address
        STA a27F0
        LDA ZP_MAP_OFFSET_Y_MSB
        STA aE1
        LDA ZP_MAP_OFFSET_Y_LSB
        STA aE0
        AND #$07
        STA aF3
        LDA ZP_GAME_MAP_OFFSET_X
        TAY
        AND #$07
        STA aF7
        TYA
        LSR A
        LSR A
        LSR A
        STA aF2
        LDA ZP_GAME_MAP_OFFSET_X
        AND #$7F
        STA ZP_GAME_MAP_OFFSET_X

j27A6   LDA aE0
        AND #$F8
        STA aF0
        LDA aE1
        STA aF1
        ASL aF0
        ROL aF1
        LDA #$00
        CLC
        ADC aF0
        STA aF4
        LDA #$E0
        ADC aF1
        STA aF5
j27C1   LDY aF2
        LDA #$00
        STA aF0
        LDA (pF4),Y                     ;Points to MAP_TILES
        LSR A
        ROR aF0
        LSR A
        ROR aF0
        TAY
        LDA aF0
        CLC
        ADC #$00     ;#%00000000
        STA aF0
        TYA
        ADC #$EF     ;#%11101111
        STA aF1
j27DC   LDA aF3
        ASL A
        ASL A
        ASL A
        CLC
        ADC aF7
        TAY
        LDA (pF0),Y
        CMP #$FD
        BNE b27EE
        JSR s0EDC

a27EF   =*+$01
a27F0   =*+$02
b27EE   STA $4000                       ;Address modified in runtime
        LDA a27EF
        CLC
        ADC #$28     ;#%00101000
        STA a27EF
        BCC b27FF
        INC a27F0
b27FF   DEC aE0
        LDA aE0
        CMP #$FF     ;#%11111111
        BNE b2809
        DEC aE1
b2809   CPY #$08     ;#%00001000
        BCC b2818
        DEC aF3
        CPX #$18     ;#%00011000
        BCC b2814
        RTS

b2814   INX
        JMP j27DC

b2818   LDA #$07     ;#%00000111
        STA aF3
        CPX #$18     ;#%00011000
        BCC b2821
        RTS

b2821   INX
        LDA aF4
        SEC
        SBC #$10     ;#%00010000
        STA aF4
        LDA aF5
        SBC #$00     ;#%00000000
        STA aF5
        JMP j27C1

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_MAP_PAINT_UP
        LDA #$05     ;#%00000101
        STA aF6
        LDA #$00     ;#%00000000
        STA aF3
        LDA ZP_GAME_MAP_OFFSET_X
        AND #$07     ;#%00000111
        STA aF7
        LDA #>$4000+40*24
        STA a28E7
        LDA #<$4000+40*24
        STA a28E6
        LDA ZP_MAP_OFFSET_Y_MSB
        STA aE1
        LDA ZP_MAP_OFFSET_Y_LSB
        STA aE0
        SEC
        SBC #$18     ;#%00011000
        STA ZP_MAP_OFFSET_Y_LSB
        BCS _L00
        DEC ZP_MAP_OFFSET_Y_MSB
_L00    JSR s287D
        LDA aE0
        STA ZP_MAP_OFFSET_Y_LSB
        LDA aE1
        STA ZP_MAP_OFFSET_Y_MSB
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_MAP_PAINT_DOWN
        LDA #$05
        STA aF6
        LDA #$00
        STA aF3
        STA a28E6
        LDA ZP_GAME_MAP_OFFSET_X
        AND #$07
        STA aF7
        LDA #$40                        ;MSB address
        STA a28E7
s287D   LDA ZP_GAME_MAP_OFFSET_X
        LSR A
        LSR A
        LSR A
        STA aF2
        LDA ZP_GAME_MAP_OFFSET_X
        AND #$7F     ;#%01111111
        STA ZP_GAME_MAP_OFFSET_X
        LDA ZP_MAP_OFFSET_Y_LSB
        AND #$F8     ;#%11111000
        STA aF0
        LDA ZP_MAP_OFFSET_Y_MSB
        STA aF1
        ASL aF0
        ROL aF1
        LDA #$00     ;#%00000000
        CLC
        ADC aF0
        STA aF4
        LDA #$E0     ;#%11100000
        ADC aF1
        STA aF5
j28A5   LDY aF2
        LDX #$00     ;#%00000000
        STX aF0
        LDA (pF4),Y
        LSR A
        ROR aF0
        ROR A
        ROR aF0
        TAX
        LDA aF0
        CLC
        ADC #$00     ;#%00000000
        STA aF0
        TXA
        ADC #$EF     ;#%11101111
        STA aF1
        LDX aF3
        LDA ZP_MAP_OFFSET_Y_LSB
        AND #$07     ;#%00000111
        ASL A
        ASL A
        ASL A
        PHA
        CLC
        ADC aF7
        TAY
        PLA
        CLC
        ADC #$08
        STA a28EB
b28D5   LDA (pF0),Y
        CMP #$FD
        BNE b28E1
        STX a2747
        JSR s0F18
b28E1   CPX #$28
        BCS b28FB
a28E6   =*+$01
a28E7   =*+$02
        STA $4000,X                     ;Address modified in runtime
        INY
        INX
a28EB   =*+$01
        CPY #$00                        ;Address modified in runtime
        BCC b28D5
        INC aF2
        DEC aF6
        STX aF3
        LDX #$00
        STX aF7
        JMP j28A5

b28FB   RTS

        JMP MAIN_BIS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_SPRITE_SORT
        LDA #$00
        STA a04

        LDX #$01
_L00    LDY ZP_GAME_SPRITE_ORDER_TBL+13,X
        LDA ZP_GAME_SPRITE_Y_COPY_TBL,Y
        LDY ZP_GAME_SPRITE_ORDER_COPY_TBL,X
        CMP ZP_GAME_SPRITE_Y_COPY_TBL,Y
        BCS _L04
        LDA ZP_GAME_SPRITE_Y_COPY_TBL,Y
        STY aD3
        STX aD4
        DEX
_L01    DEX
        BMI _L02

        LDY ZP_GAME_SPRITE_ORDER_COPY_TBL,X
        CMP ZP_GAME_SPRITE_Y_COPY_TBL,Y
        BEQ _L02
        BCS _L01

_L02    INX
        INC a04
        STX a05

        LDX aD4
_L03    LDA ZP_GAME_SPRITE_ORDER_TBL+13,X
        STA ZP_GAME_SPRITE_ORDER_COPY_TBL,X
        DEX
        CPX a05
        BNE _L03

        LDA aD3
        STA ZP_GAME_SPRITE_ORDER_COPY_TBL,X

        LDX aD4
_L04    INX
        CPX #14                         ;Compare all sprites
        BNE _L00

        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s2941   STX a295F
        STY a2960
        LDY a2994
j294A   LDA f2997,Y
        BMI b295A
        INY
        STY a2994
        LDY a2960
        LDX a295F
        RTS

b295A   LDY #$00     ;#%00000000
        JMP j294A

a295F   .BYTE $00
a2960   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s2961   STY a2960
        STX a295F
        LDY a2995
        LDX a2996
j296D   LDA f2997,Y
        BMI b298A
        LDA f29A8,X
        BMI b298F
        CLC
        ADC f2997,Y
        INY
        INX
        STY a2995
        STX a2996
        LDY a2960
        LDX a295F
        RTS

b298A   LDY #$00
        JMP j296D

b298F   LDX #$00
        JMP j296D

a2994   .BYTE $00
a2995   .BYTE $00
a2996   .BYTE $00
f2997   .BYTE $03,$01,$07,$03,$04,$05,$06,$00
        .BYTE $05
        .BYTE $02,$07,$04,$02,$01,$06,$00,$FF
f29A8   .BYTE $01,$04,$05,$06,$02,$02,$03,$01
        .BYTE $04,$01,$07,$02,$04,$03,$03,$01
        .BYTE $04,$06,$05,$FF,$06,$05,$FF,$7F
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $FF,$FF,$DD,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$80
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$80
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$49,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$80
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$80
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $00,$00,$22,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$7F
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$7F
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$B6,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$7F
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$7F
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $FF,$FF,$DD,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$80
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$80
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$49,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$80
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$80
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $00,$00,$22,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$7F
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$7F
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$B6,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$7F
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$7F
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $FF,$FF,$DD,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$80
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$80
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$49,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$80
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$80
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $00,$00,$22,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$7F
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$7F
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$EF,$FF
        .BYTE $00,$00,$EF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$B6,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$7F
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$7F
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF

        ; $3000
ENEMY_COPTER_ANIM_BIS
        JMP ENEMY_COPTER_ANIM

s3003   JMP j37B7

GAME_COPTER_ANIM_COPTER_HERO_BIS
        JMP GAME_COPTER_ANIM_COPTER_HERO

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Helicopter main loop
GAME_COPTER_MAIN_LOOP
        JSR GAME_SPRITE_SYNC_PROPERTEIS_AFTER_RASTER_BIS
        JSR GAME_MAP_PAINT_BIS
        JSR GAME_DO_HARD_SCROLL_BIS
        JSR GAME_PLAY_MUSIC_BIS
        JSR GAME_COPTER_READ_JOYSTICK
        JSR GAME_COPTER_CHECK_ARRIVE_AT_HELIPAD
        JSR s3066
        JSR s3210
        JSR GAME_COPTER_FIRE_PRESSED
        JSR s3272
        JSR GAME_MAYBE_SELECT_NEXT_WEAPON_BIS
        JSR s319D
        JSR GAME_UPDATE_ENERGY_AND_CHECK_GAME_OVER
        JSR GAME_COPTER_DECREASE_ENERGY
        JSR GAME_UPDATE_SPRITE_SCORE_BIS
        JSR GAME_UPDATE_SCORE_FROM_POINTS_BIS
        JSR GAME_SPRITE_SORT_BIS

        JMP GAME_COPTER_MAIN_LOOP

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_UPDATE_ENERGY_AND_CHECK_GAME_OVER
        JSR GAME_UPDATE_SPRITE_ENERGY_BIS
        LDA ZP_IS_GAME_OVER
        BNE _L00
        RTS

_L00    PLA
        PLA
        PLA
        PLA
        JMP GAME_PRINT_GAME_OVER_BIS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_COPTER_DECREASE_ENERGY
        LDA _DELAY
        BEQ _L00
        DEC _DELAY
        RTS

_L00    LDX a3825
        LDA _DELAY_TBL,X
        STA _DELAY
        INC ZP_GAME_ENERGY_TO_DECREASE
        RTS

_DELAY          .BYTE $00
_DELAY_TBL      .BYTE $12,$C8

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s3066   LDA a30C3
        BEQ b306E
        JMP j307D

b306E   JSR s3484
        JSR s3373
        JSR GAME_COPTER_ANIM_COPTER_ENEMY
        JSR s3316
        JMP j30C4

j307D   JSR s34F1
        JSR s34F1
        JSR s34F1
        JSR ENEMY_COPTER_ANIM_NEXT
        JSR s3316
        LDA a3315
        BEQ b3092
        RTS

b3092   LDA a3567
        SEC
        SBC #$03
        BCS b309C
        LDA #$00
b309C   STA a3567
        LDA #$F0
        STA a3564
        LDA #$00
        STA a30C3
        STA a3565
        LDA #$04
        STA a3127
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
ENEMY_COPTER_ANIM_NEXT
        LDA COPTER_ANIM_IDX_TBL+1
        CMP #$0B                        ;Last frame to animate?
        BEQ _L00                        ; Yes, jump
        INC COPTER_ANIM_IDX_TBL+1
        RTS

_L00    LDA #$00                        ;Reset animation idx
        STA COPTER_ANIM_IDX_TBL+1
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

a30C3   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j30C4   LDA COPTER_MISSILE_ALREADY_FIRED
        CMP #$01
        BEQ _L00
        RTS

_L00    LDA a3315
        BNE _L01
        RTS

_L01    LDA ZP_GAME_SPRITE_Y_COPY_TBL+10
        STA a38DE
        LDA a362F
        STA a38DF
        LDA ZP_GAME_SPRITE_X_COPY_TBL+10
        ASL A
        STA a38DA
        LDA #$00
        ROL A
        STA a38DB
        LDA a362E
        ASL A
        STA a38DC
        LDA #$00
        ROL A
        STA a38DD
        LDX COPTER_ANIM_IDX_TBL+1
        LDA f3128,X
        STA a38E1
        LDA f3134,X
        STA a38E0
        JSR s3897
        BCC _EXIT
        LDX #$01
        JSR s316A

        LDA #$02                        ;Set 002.000 points
        LDX #$02
        JSR SET_LOCAL_POINTS_BIS
        JMP _L02

_EXIT   RTS

_L02    LDA a3127
        BEQ _L03
        DEC a3127
        RTS

_L03    INC a30C3
        RTS

a3127   .BYTE $04
f3128   .BYTE $1F,$1F,$1F,$09,$09,$09,$1F,$1F
        .BYTE $1F,$09,$09,$09
f3134   .BYTE $0A,$0A,$0A,$22,$22,$22,$0A,$0A
        .BYTE $0A,$22,$22,$22

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_COPTER_FIRE_PRESSED
        LDA ZP_SELECTED_WEAPON
        CMP #$05                        ;Missile
        BEQ _L00
        RTS

_L00    LDA COPTER_JOY_STATE
        AND #$10                        ;Fire?
        BNE _L01                        ; yes, jump
        RTS

_L01    LDA COPTER_MISSILE_ALREADY_FIRED
        BEQ _L02
        RTS

_L02    INC COPTER_MISSILE_ALREADY_FIRED
        ; Setup missile sprite position
        LDA ZP_GAME_SPRITE_X_COPY_TBL+12
        LSR A
        STA ZP_GAME_SPRITE_X_COPY_TBL+10
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+12
        STA ZP_GAME_SPRITE_Y_COPY_TBL+10
        INC ZP_GAME_SPRITE_STATE_TBL+10
        LDA COPTER_ANIM_IDX_TBL
        STA a324C+1
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s316A   LDA #65                         ;Frame: Explosion #00
        STA ZP_GAME_SPRITE_FRAME_TBL+9,X
        LDA #$02
        STA f32D6,X
        LDA #$05                        ;Color Green
        STA ZP_GAME_SPRITE_COLOR_TBL+9,X
        LDA #$02
        STA f319B,X
        LDA #$0E                        ;SFX to play
        JMP GAME_MAYBE_PLAY_SFX_BIS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s3181   LDA f319B,X
        BEQ _L00
        DEC f319B,X
        RTS

_L00    LDA #$02
        STA f319B,X
        LDA ZP_GAME_SPRITE_FRAME_TBL+9,X
        CMP #69                         ;Frame: Explosion #04 (last frame)
        BNE _L01
        JMP j32C8

_L01    INC ZP_GAME_SPRITE_FRAME_TBL+9,X
        RTS

f319B   .BYTE $00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s319D   LDA f32D6
        CMP #$01
        BEQ _L00
        RTS

_L00    LDA ZP_GAME_SPRITE_Y_COPY_TBL+9
        STA a38DE
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+12
        STA a38DF
        LDA ZP_GAME_SPRITE_X_COPY_TBL+9
        ASL A
        STA a38DA
        LDA #$00
        ROL A
        STA a38DB
        LDA ZP_GAME_SPRITE_X_COPY_TBL+12
        STA a38DC
        LDA #$00
        STA a38DD
        LDA #$0C
        STA a38E1
        LDA #$0A
        STA a38E0
        JSR s3897
        BCC _L01
        JMP _L02

_L01    LDA ZP_GAME_SPRITE_Y_COPY_TBL+9
        STA a38DE
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+4
        STA a38DF
        LDA ZP_GAME_SPRITE_X_COPY_TBL+9
        ASL A
        STA a38DA
        LDA #$00
        ROL A
        STA a38DB
        LDA ZP_GAME_SPRITE_X_COPY_TBL+4
        STA a38DC
        LDA #$00
        STA a38DD
        LDA #$0C
        STA a38E1
        LDA #$0A
        STA a38E0
        JSR s3897
        BCC _EXIT

_L02    LDA #$05
        STA ZP_GAME_ENERGY_TO_DECREASE
        LDX #$00
        JSR s316A
_EXIT   RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s3210   LDA a32D8
        BNE _L00
        RTS

_L00    DEC a32D8
        LDA a3825
        BNE _L01
        RTS

_L01    LDA f32D6
        BEQ _L02
        RTS

_L02    LDA a362F
        CMP #$C0     ;#%11000000
        BCS b324B
        LDA #$14     ;#%00010100
        CMP #$14     ;#%00010100
        BCC b324B
        INC f32D6
        LDX COPTER_ANIM_IDX_TBL+1
        STX a324C
        LDA #$0E                        ;Color Light Blue
        STA ZP_GAME_SPRITE_COLOR_TBL+9
        LDA a362E
        STA ZP_GAME_SPRITE_X_COPY_TBL+9
        LDA a362F
        STA ZP_GAME_SPRITE_Y_COPY_TBL+9
        INC ZP_GAME_SPRITE_STATE_TBL+9
b324B   RTS

a324C   .BYTE $00,$00
f324E   .BYTE $FA,$FA,$FA,$00,$00,$00,$06,$06
        .BYTE $06,$00,$00,$00
f325A   .BYTE $00,$00,$00,$FD,$FD,$FD,$00,$00
        .BYTE $00,$03,$03,$03
f3266   .BYTE $2E,$2E,$2E,$30,$30,$30,$2F,$2F
        .BYTE $2F,$31,$31,$31

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s3272   LDX #$01
_L00    LDA f32D6,X
        CMP #$02
        BEQ _L01
        JSR s3288
        JMP _L02

_L01    JSR s3181
_L02    DEX
        BPL _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s3288   LDY a324C,X
        LDA f325A,Y
        CLC
        ADC ZP_DELTA_X
        STA a32D5
        LDA ZP_DELTA_Y
        ASL A
        STA a336D
        LDA f324E,Y
        CLC
        ADC a336D
        STA a32D4
        LDA f3266,Y
        STA ZP_GAME_SPRITE_FRAME_TBL+9,X
        LDA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        CLC
        ADC a32D5
        STA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        CLC
        ADC a32D4
        CMP #$14     ;#%00010100
        BCC j32C8
        CMP #$C0     ;#%11000000
        BCS j32C8
        STA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        LDA ZP_GAME_SPRITE_X_COPY_TBL+9,X
        CMP #$AC     ;#%10101100
        BCS j32C8
        RTS

j32C8   LDA #$00     ;#%00000000
        STA f32D6,X
        DEC ZP_GAME_SPRITE_STATE_TBL+9,X
        LDA #$0A     ;#%00001010
        STA ZP_GAME_SPRITE_Y_COPY_TBL+9,X
        RTS

a32D4   .BYTE $00
a32D5   .BYTE $00
f32D6   .BYTE $00
COPTER_MISSILE_ALREADY_FIRED
        .BYTE $00
a32D8   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_COPTER_ANIM_COPTER_ENEMY
        LDY #$01
        JMP GAME_COPTER_ANIM_COPTER

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s32DE   LDX #$03
        LDA #$00
        STA a3315
_L00    LDA ZP_GAME_SPRITE_X_COPY_TBL+5,X
        CMP #173
        BCC _L01
        JMP _L03

_L01    LDA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        CMP #20
        BCC _L03
        CMP #192
        BCS _L03
        LDA a3825
        BEQ _L03
        LDA #$01
        STA ZP_GAME_SPRITE_STATE_TBL+5,X
        STA a3315
_L02    DEX
        BPL _L00

        RTS

_L03    LDA #$00
        STA ZP_GAME_SPRITE_STATE_TBL+5,X
        LDA #20
        STA ZP_GAME_SPRITE_Y_COPY_TBL+5,X
        STA ZP_GAME_SPRITE_Y_TBL+5,X
        JMP _L02

a3315   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s3316   LDA a3568
        SEC
        SBC ZP_GAME_MAP_OFFSET_X
        BCS b331F
        RTS

b331F   CMP #$2E     ;#%00101110
        BCC b3324
        RTS

b3324   LDA a347F
        SEC
        SBC ZP_MAP_OFFSET_Y_LSB
        STA a336D
        LDA a3480
        SBC ZP_MAP_OFFSET_Y_MSB
        BEQ b3337
        JMP j3341

b3337   LDA #$1E     ;#%00011110
        SEC
        SBC a336D
        CMP #$1B     ;#%00011011
        BCC b3342
j3341   RTS

b3342   LDA ZP_GAME_SMOOTH_X
        LSR A
        STA a336E
        LDA ZP_GAME_MAP_OFFSET_X
        ASL A
        ASL A
        SEC
        SBC a336E
        STA a336D
        LDA a3564
        SEC
        SBC a336D
        STA a362E
        LDA ZP_MAP_OFFSET_Y_LSB
        ASL A
        ASL A
        ASL A
        CLC
        ADC ZP_GAME_SMOOTH_Y
        SEC
        SBC a3566
        STA a362F
        RTS

a336D   .BYTE $00
a336E   .BYTE $00,$00,$00,$00,$00

s3373   JSR s3391
        LDA a3481
        ASL A
        ASL A
        ASL A
        CLC
        ADC a3482
        STA a3482
        BCS b3386
        RTS

b3386   LDA a3483
        BEQ b338E
        JMP j33E8

b338E   JMP j33FB

s3391   LDA ZP_MAP_OFFSET_Y_LSB
        CLC
        ADC #$0F     ;#%00001111
        STA a356A
        LDA ZP_MAP_OFFSET_Y_MSB
        ADC #$00     ;#%00000000
        STA a356B
        LDA a3566
        STA a347F
        LDA a3567
        LSR A
        ROR a347F
        LSR A
        ROR a347F
        LSR A
        ROR a347F
        STA a3480
        LDA a347F
        CMP a356A
        BNE b33D3
        LDA a3480
        CMP a356B
        BNE b33D3
        LDA COPTER_DIRECTION_TBL+1
        AND #$0C     ;#%00001100        ;Left & Right mask
        STA COPTER_DIRECTION_TBL+1
        INC a32D8
b33D3   LDA a347F
        SEC
        SBC a356A
        LDA a3480
        SBC a356B
        BCS b33E5
        JMP j340F

b33E5   JMP j3444

j33E8   LDA a3566
        CLC
        ADC a340E
        STA a3566
        LDA a3567
        ADC #$00     ;#%00000000
        STA a3567
        RTS

j33FB   LDA a3566
        SEC
        SBC a340E
        STA a3566
        LDA a3567
        SBC #$00     ;#%00000000
        STA a3567
        RTS

a340E   .BYTE $00

j340F   LDA a3483
        BEQ b3433
        LDA #$03     ;#%00000011
        STA a340E
        LDA a3481
        CMP #$1F     ;#%00011111
        BEQ b3428
        LDA #$02     ;#%00000010
        STA a340E
        INC a3481
b3428   LDA COPTER_DIRECTION_TBL+1
        AND #$0C     ;#%00001100        ;Left & Right mask
        ORA #$01     ;#%00000001        ;Go up
        STA COPTER_DIRECTION_TBL+1
        RTS

b3433   LDA a3481
        BEQ b343C
        DEC a3481
        RTS

b343C   LDA #$01     ;#%00000001
        STA a3483
        JMP j3479

j3444   LDA a3483
        BNE b3468
        LDA #$03     ;#%00000011
        STA a340E
        LDA a3481
        CMP #$1F     ;#%00011111
        BEQ b345D
        LDA #$02     ;#%00000010
        STA a340E
        INC a3481
b345D   LDA COPTER_DIRECTION_TBL+1
        AND #$0C     ;#%00001100        ;Left & Right mask
        ORA #$02     ;#%00000010        ;Go down
        STA COPTER_DIRECTION_TBL+1
        RTS

b3468   LDA a3481
        BEQ b3471
        DEC a3481
        RTS

b3471   LDA #$00     ;#%00000000
        STA a3483
        JMP j3479

j3479   LDA #$05     ;#%00000101
        STA a3481
        RTS

a347F   .BYTE $00
a3480   .BYTE $00
a3481   .BYTE $00
a3482   .BYTE $00
a3483   .BYTE $00

s3484   JSR s34A2
        LDA a355F
        ASL A
        ASL A
        ASL A
        CLC
        ADC a3560
        STA a3560
        BCS b3497
        RTS

b3497   LDA a3561
        BEQ b349F
        JMP j34DF

b349F   JMP s34F1

s34A2   LDA ZP_GAME_MAP_OFFSET_X
        CLC
        ADC #$16     ;#%00010110
        STA a3569
        LDA a3564
        STA a3568
        LDA a3565
        LSR A
        ROR a3568
        LSR A
        ROR a3568
        INC a3568
        INC a3568
        LDA a3568
        CMP a3569
        PHP
        BNE b34D5
        INC a32D8
        LDA COPTER_DIRECTION_TBL+1
        AND #$03     ;#%00000011        ;Up & Down mask
        STA COPTER_DIRECTION_TBL+1
b34D5   PLP
        BCS b34DB
        JMP j3503

b34DB   JMP j352E

        .BYTE $00

j34DF   LDA a3564
        CLC
        ADC #$01     ;#%00000001
        STA a3564
        LDA a3565
        ADC #$00     ;#%00000000
        STA a3565
        RTS

s34F1   LDA a3564
        SEC
        SBC #$01     ;#%00000001
        STA a3564
        LDA a3565
        SBC #$00     ;#%00000000
        STA a3565
        RTS

j3503   LDA a3561
        BEQ b351D
        LDA a355F
        CMP #$1F     ;#%00011111
        BEQ b3512
        INC a355F
b3512   LDA COPTER_DIRECTION_TBL+1
        AND #$03     ;#%00000011        ;Up & Down mask
        ORA #$08     ;#%00001000        ;Go Right
        STA COPTER_DIRECTION_TBL+1
        RTS

b351D   LDA a355F
        BEQ b3526
        DEC a355F
        RTS

b3526   LDA #$01     ;#%00000001
        STA a3561
        JMP j3559

j352E   LDA a3561
        BNE b3548
        LDA a355F
        CMP #$1F     ;#%00011111
        BEQ b3547
        INC a355F
        LDA COPTER_DIRECTION_TBL+1
        AND #$03     ;#%00000011        ;Up & Down mask
        ORA #$04     ;#%00000100        ;Go Left
        STA COPTER_DIRECTION_TBL+1
b3547   RTS

b3548   LDA a355F
        BEQ b3551
        DEC a355F
        RTS

b3551   LDA #$00     ;#%00000000
        STA a3561
        JMP j3559

j3559   LDA #$05     ;#%00000101
        STA a355F
        RTS

a355F   .BYTE $01
a3560   .BYTE $00
a3561   .BYTE $00,$00,$00
a3564   .BYTE $64
a3565   .BYTE $01
a3566   .BYTE $40
a3567   .BYTE $06
a3568   .BYTE $00
a3569   .BYTE $00
a356A   .BYTE $00
a356B   .BYTE $00,$01,$FF

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_COPTER_CHECK_ARRIVE_AT_HELIPAD
        LDA aE6
        BEQ _L00

        LDA #42
        STA a336D

        LDA ZP_MAP_OFFSET_Y_MSB         ;Already in the upper part of the map
        CMP #$03                        ; Helipad is in $03 MSB
        BCS _L00                        ; yes, jump

        RTS

_L00    LDX #$0C
        JSR s036A

        LDY #41
        ; Checks for char between 27 and 29 (terrain with border)
        ; these are the "helipad" chars
        LDA (p30),Y
        CMP #27
        BCC _EXIT
        CMP #30
        BCS _EXIT

        LDA #$08
        JSR MUSIC_FN
        LDA #21
        JSR MUSIC_FN

        LDA a336D
        CMP #42
        BNE _L01

        LDA #$01                        ;100.000 Points
        LDX #$00
        JSR SET_LOCAL_POINTS_BIS
        JSR GAME_UPDATE_SCORE_FROM_POINTS_BIS
        SEI
        PLA
        PLA
        PLA
        PLA
        PLA
        PLA
        LDA #$04                        ;"Congratulations you won" message
        JMP GAME_PRINT_MSG_AND_THEN_GAME_OVER_BIS

_L01    INC aE6
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+12
        CLC
        ADC #$1E
        TAY
        LDX ZP_GAME_SPRITE_X_COPY_TBL+12
        PLA
        PLA
_EXIT   RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
ENEMY_COPTER_ANIM
        LDX COPTER_ANIM_IDX_TBL+1

        LDA a362E
        CLC
        ADC ENEMY_COPTER_X_OFFSET_SPR5_TBL,X
        STA ZP_GAME_SPRITE_X_COPY_TBL+5

        LDA a362F
        CLC
        ADC ENEMY_COPTER_Y_OFFSET_SPR5_TBL,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+5

        LDA ZP_GAME_SPRITE_X_COPY_TBL+5
        CLC
        ADC ENEMY_COPTER_X_OFFSET_SPR6_TBL,X
        STA ZP_GAME_SPRITE_X_COPY_TBL+6

        LDA ZP_GAME_SPRITE_Y_COPY_TBL+5
        CLC
        ADC ENEMY_COPTER_Y_OFFSET_SPR6_TBL,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+6

        LDA ZP_GAME_SPRITE_X_COPY_TBL+5
        CLC
        ADC ENEMY_COPTER_X_OFFSET_SPR7_TBL,X
        STA ZP_GAME_SPRITE_X_COPY_TBL+7

        LDA ZP_GAME_SPRITE_Y_COPY_TBL+5
        CLC
        ADC ENEMY_COPTER_Y_OFFSET_SPR7_TBL,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+7

        LDA ZP_GAME_SPRITE_X_COPY_TBL+5
        CLC
        ADC ENEMY_COPTER_X_OFFSET_SPR8_TBL,X
        STA ZP_GAME_SPRITE_X_COPY_TBL+8

        LDA ZP_GAME_SPRITE_Y_COPY_TBL+5
        CLC
        ADC ENEMY_COPTER_Y_OFFSET_SPR8_TBL,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+8

        LDY ENEMY_COPTER_FRAME_TBL,X
        STY ZP_GAME_SPRITE_FRAME_TBL+5
        INY
        STY ZP_GAME_SPRITE_FRAME_TBL+6
        INY
        STY ZP_GAME_SPRITE_FRAME_TBL+7
        INY
        STY ZP_GAME_SPRITE_FRAME_TBL+8

        LDA #$0F                        ;Color Light Grey
        STA ZP_GAME_SPRITE_COLOR_TBL+5
        STA ZP_GAME_SPRITE_COLOR_TBL+6
        STA ZP_GAME_SPRITE_COLOR_TBL+7
        STA ZP_GAME_SPRITE_COLOR_TBL+8

        JSR s32DE

        LDX a3315
        LDA f362C,X                     ;SFX to play for chopper
        JMP MUSIC_FN

f362C   .BYTE $08,$16
a362E   .BYTE $82
a362F   .BYTE $64

        ;In total 12 animation frames for the hero helicopter
ENEMY_COPTER_FRAME_TBL
        .BYTE 131,151,147,139,163,167,135,159
        .BYTE 155,143,171,175
ENEMY_COPTER_X_OFFSET_SPR6_TBL
        .BYTE $FA,$FA,$FA,$0A,$0A,$0A,$06,$06
        .BYTE $06,$F6,$F6,$F6
ENEMY_COPTER_Y_OFFSET_SPR6_TBL
        .BYTE $15,$15,$15,$0A,$0A,$0A,$EB,$EB
        .BYTE $EB,$F6,$F6,$F6
ENEMY_COPTER_X_OFFSET_SPR7_TBL
        .BYTE $06,$06,$06,$0A,$0A,$0A,$FA,$FA
        .BYTE $FA,$F6,$F6,$F6
ENEMY_COPTER_Y_OFFSET_SPR7_TBL
        .BYTE $15,$15,$15,$F6,$F6,$F6,$EB,$EB
        .BYTE $EB,$0A,$0A,$0A
ENEMY_COPTER_X_OFFSET_SPR8_TBL
        .BYTE $00,$00,$00,$15,$15,$15,$00,$00
        .BYTE $00,$EB,$EB,$EB
ENEMY_COPTER_Y_OFFSET_SPR8_TBL
        .BYTE $2A,$2A,$2A,$00,$00,$00,$D6,$D6
        .BYTE $D6,$00,$00,$00
ENEMY_COPTER_X_OFFSET_SPR5_TBL
        .BYTE $00,$00,$00,$FA,$FA,$FA,$00,$00
        .BYTE $00,$06,$06,$06
ENEMY_COPTER_Y_OFFSET_SPR5_TBL
        .BYTE $F3,$F3,$F3,$00,$00,$00,$0D,$0D
        .BYTE $0D,$00,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Part of the copter part
s369C   LDX #$01
_L00    LDA f36C0,X
        BEQ _L01
        DEC f36C0,X
        JMP _L03

_L01    LDA f36C2,X
        STA f36C0,X
        LDA f36C4,X
        BNE _L02
        LDA #$04
        STA f36C4,X
_L02    DEC f36C4,X
_L03    DEX
        BPL _L00
        RTS

f36C0   .BYTE $00,$00
f36C2   .BYTE $01,$01
f36C4   .BYTE $02
a36C5   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
GAME_COPTER_ANIM_COPTER_HERO
        LDY #$00
        JSR GAME_COPTER_ANIM_COPTER
        JMP j373F

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Args: Y, Copter to test:
;       y=0: Hero copter
;       y=1: Enemy copter
GAME_COPTER_ANIM_COPTER
        LDA COPTER_DIRECTION_TBL,Y
        CMP f375C,Y
        BEQ _L02

        STA f375C,Y
        CMP #$00
        BEQ _L02

        LDX f375A,Y
        AND f3748,X
        BEQ _L00

        STA f375A,Y
        JMP _L02

_L00    LDA f375A,Y
        AND #$0C     ;#%00001100
        BEQ _L01
        LDA f375C,Y
        AND #$0C     ;#%00001100
        BNE _L02
        LDA f375C,Y
        STA f375A,Y
        JMP _L02

_L01    LDA f375C,Y
        AND #$03     ;#%00000011
        BNE _L02
        LDA f375C,Y
        STA f375A,Y
_L02    LDA f375A,Y
        AND #$0C     ;#%00001100
        BNE _L03
        LDX f375A,Y
        LDA f3751,X
        STA f375E,Y
        LDA COPTER_DIRECTION_TBL,Y
        AND #$0C     ;#%00001100
        LSR A
        LSR A
        JMP _L04

_L03    LDX f375A,Y
        LDA f3751,X
        STA f375E,Y
        LDA COPTER_DIRECTION_TBL,Y
        AND #$03     ;#%00000011
_L04    CLC
        ADC f375E,Y
        STA COPTER_ANIM_IDX_TBL,Y
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j373F   JSR s369C
        JSR s3827
        JMP HERO_COPTER_ANIM

f3748   .BYTE $02,$02,$01,$00,$08,$00,$00,$00
        .BYTE $04
f3751   .BYTE $00,$00,$06,$00,$03,$00,$00,$00
        .BYTE $09
f375A   .BYTE $00,$00
f375C   .BYTE $00,$00
f375E   .BYTE $00,$00,$CE,$73,$37,$60

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Not sure why there is another function to read the joystick
GAME_COPTER_READ_JOYSTICK
        JSR GAME_READ_JOYSTICK_BIS
        STA COPTER_JOY_STATE
        AND #$0F                        ;Only directional moves
        STA COPTER_DIRECTION_TBL
        RTS

COPTER_JOY_STATE        .BYTE $00
COPTER_DIRECTION_TBL    .BYTE $00       ;Hero copter
                        .BYTE $00       ;Enemy copter
COPTER_ANIM_IDX_TBL      .BYTE $00       ;Hero copter
                        .BYTE $00       ;Enemy copter

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
HERO_COPTER_ANIM
        LDX COPTER_ANIM_IDX_TBL
        LDA ZP_GAME_SPRITE_X_COPY_TBL+12
        CLC
        ADC f3793,X
        STA ZP_GAME_SPRITE_X_COPY_TBL+4
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+12
        CLC
        ADC f379F,X
        STA ZP_GAME_SPRITE_Y_COPY_TBL+4
        LDA f37AB,X
        STA ZP_GAME_SPRITE_FRAME_TBL+4
        SEC
        SBC #$01
        STA ZP_GAME_SPRITE_FRAME_TBL+12
        RTS

f3793   .BYTE $00,$00,$00,$18,$18,$18,$00,$00
        .BYTE $00,$E8,$E8,$E8
f379F   .BYTE $15,$15,$15,$00,$00,$00,$EB,$EB
        .BYTE $EB,$00,$00,$00
f37AB   .BYTE 180,190,188,184,196,198,182,194
        .BYTE 192,186,200,202

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Args: A
j37B7   STA a3825
        JSR GAME_SPRITE_SYNC_PROPERTEIS_AFTER_RASTER_BIS
        SEI
        LDA #$00
        STA COPTER_ANIM_IDX_TBL
        STA COPTER_DIRECTION_TBL
        STA f375C
        LDA #$08
        STA f375A
        LDA #172
        STA ZP_GAME_SPRITE_X_COPY_TBL+12
        LDA #140
        STA ZP_GAME_SPRITE_Y_COPY_TBL+12
        STA ZP_GAME_SPRITE_Y_TBL+12
        LDA #$01
        STA ZP_GAME_SPRITE_STATE_TBL+12
        STA ZP_GAME_SPRITE_STATE_TBL+4
        LDA #$00
        STA a3565
        LDA #$F0
        STA a3564
        LDA #$02
        STA a3567
        LDA #$32
        STA a3566
        JSR HERO_COPTER_ANIM
        LDX #$0F
        LDA #$00
        STA a362E
        STA a362F
_L00    STA $D000,X                     ;Sprite 0 X Pos
        DEX
        BPL _L00

        LDX #$03
_L01    LDA #195
        STA ZP_GAME_SPRITE_X_COPY_TBL+5,X
        LDA #$00
        STA ZP_GAME_SPRITE_STATE_TBL+5,X
        DEX
        BPL _L01

        JSR s32DE

        LDA #25
        LDX #15
        JSR MUSIC_FN
        LDA #20
        JSR MUSIC_FN

        CLI

        JMP GAME_COPTER_MAIN_LOOP

a3825   .BYTE $00
a3826   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s3827   LDA a3826
        BEQ b383D
        LDA ZP_GAME_SPRITE_Y_COPY_TBL+12
        STA a3888
        LDA ZP_GAME_SPRITE_X_COPY_TBL+12
        LSR A
        STA a3889
        LDX f36C4
        JMP j384C

b383D   LDA a362F
        STA a3888
        LDA a362E
        STA a3889
        LDX a36C5
j384C   LDA a3889
        CLC
        ADC f388E,X
        ASL A
        STA ZP_GAME_SPRITE_X_COPY_TBL+13
        STA ZP_GAME_SPRITE_X_TBL+13
        ROL A
        STA ZP_GAME_SPRITE_X_MSB_COPY_TBL+13
        STA ZP_GAME_SPRITE_X_MSB_TBL+13
        LDA a3826
        BNE b3867
        LDA a3825
        BEQ b3872
b3867   LDA a3888
        CLC
        ADC f388A,X
        CMP #$C0     ;#%11000000
        BCC b3874
b3872   LDA #$00
b3874   STA ZP_GAME_SPRITE_Y_COPY_TBL+13
        STA ZP_GAME_SPRITE_Y_TBL+13
        LDA COPTER_BLADE_SPRITE_FRAME_TBL,X
        STA aD1
        STA aD2
        LDA a3826
        EOR #$01
        STA a3826
        RTS

a3888   .BYTE $00
a3889   .BYTE $00
f388A   .BYTE $F6,$00,$0A,$00
f388E   .BYTE $00,$FB,$00,$05
COPTER_BLADE_SPRITE_FRAME_TBL
        .BYTE 205,204,203,206           ;Copter blades

        .BYTE $60                       ;Garbage (?)

s3897   LDA a38DE
        SEC
        SBC a38E1
        CMP a38DF
        BCS b38D8
        ASL a38E1
        CLC
        ADC a38E1
        CMP a38DF
        BCC b38D8
        LSR a38DB
        ROR a38DA
        LSR a38DD
        ROR a38DC
        LSR a38E0
        LDA a38DA
        SEC
        SBC a38E0
        CMP a38DC
        BCS b38D8
        ASL a38E0
        CLC
        ADC a38E0
        CMP a38DC
        BCC b38D8
        SEC
        RTS

b38D8   CLC
        RTS

a38DA   .BYTE $00
a38DB   .BYTE $00
a38DC   .BYTE $00
a38DD   .BYTE $00
a38DE   .BYTE $00
a38DF   .BYTE $00
a38E0   .BYTE $00
a38E1   .BYTE $00,$C5,$CE,$C4,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $66,$3C,$FF,$3C,$66,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$7E,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$18,$18,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00

        ;$3980
        ; Used for the "score sprite"
CHARSET_DIGITS_0_9
        .BYTE $2C,$66,$66,$66,$66,$66,$2C,$00   ;0
        .BYTE $38,$18,$18,$18,$18,$18,$3C,$00   ;1
        .BYTE $2C,$66,$06,$0C,$30,$06,$7E,$00   ;2
        .BYTE $34,$66,$06,$14,$06,$66,$34,$00   ;3
        .BYTE $06,$16,$26,$46,$7F,$06,$0F,$00   ;4
        .BYTE $7E,$18,$40,$6C,$06,$66,$6C,$00   ;5
        .BYTE $2C,$66,$60,$6C,$66,$66,$2C,$00   ;6
        .BYTE $7E,$60,$04,$0C,$18,$18,$18,$00   ;7
        .BYTE $2C,$66,$66,$2C,$66,$66,$2C,$00   ;8
        .BYTE $2C,$66,$66,$2E,$06,$66,$2C,$00   ;9

        ;$39d0 Unused?
        .BYTE $00,$00,$18,$00
        .BYTE $00,$18,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$01,$01,$05,$0C
        .BYTE $0C,$0C,$0C,$18,$E0,$E0,$E0,$F0
        .BYTE $F0,$F0,$78,$78,$18,$18,$33,$30
        .BYTE $30,$30,$78,$00,$78,$3C,$FC,$3C
        .BYTE $1E,$1E,$3F,$00,$7D,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3C,$F8,$3C,$1E,$1E
        .BYTE $1E,$1E,$3C,$F8,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7D,$00,$3C,$1E,$1E,$1E
        .BYTE $1E,$3C,$F8,$00,$0D,$18,$38,$38
        .BYTE $78,$78,$78,$78,$EC,$7C,$3C,$1C
        .BYTE $00,$00,$00,$00,$78,$78,$78,$38
        .BYTE $38,$18,$0D,$00,$00,$00,$00,$1C
        .BYTE $1C,$78,$E0,$00,$7D,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3C,$F8,$3E,$1E,$0F
        .BYTE $0F,$0F,$0F,$0F,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7D,$00,$0F,$0F,$0F,$0F
        .BYTE $1E,$3E,$F8,$00,$7D,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3D,$FE,$3E,$0E,$06
        .BYTE $00,$20,$60,$E0,$3D,$3C,$3C,$3C
        .BYTE $3C,$3C,$7D,$00,$E0,$60,$20,$06
        .BYTE $0E,$3E,$FE,$00,$7D,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3D,$FE,$3E,$0E,$06
        .BYTE $00,$20,$60,$E0,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7E,$00,$60,$20,$00,$00
        .BYTE $00,$00,$00,$00,$0D,$18,$38,$38
        .BYTE $78,$78,$78,$78,$EC,$7C,$3C,$1C
        .BYTE $00,$00,$00,$00,$78,$78,$78,$38
        .BYTE $38,$18,$0D,$00,$7E,$3C,$3C,$3C
        .BYTE $3C,$78,$F0,$00,$7C,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3D,$7E,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$FC,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7E,$00,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7E,$00,$07,$03,$03,$03
        .BYTE $03,$03,$03,$03,$E0,$C0,$C0,$C0
        .BYTE $C0,$C0,$C0,$C0,$03,$03,$03,$03
        .BYTE $03,$03,$07,$00,$C0,$C0,$C0,$C0
        .BYTE $C0,$C0,$E0,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$7E,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3C,$00,$00,$00,$1E
        .BYTE $3E,$3E,$1F,$00,$3C,$3C,$3C,$3C
        .BYTE $3C,$38,$70,$00,$7C,$3C,$3C,$3C
        .BYTE $3C,$3D,$3D,$3D,$3C,$18,$30,$60
        .BYTE $C0,$C0,$C0,$E0,$3D,$3C,$3C,$3C
        .BYTE $3C,$3C,$7E,$00,$E0,$F0,$F0,$78
        .BYTE $78,$3C,$7E,$00,$7E,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3C,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7E,$00,$00,$00,$00,$06
        .BYTE $0E,$3E,$FE,$00,$7E,$1E,$1F,$2F
        .BYTE $2F,$2F,$37,$37,$3F,$3E,$5E,$5E
        .BYTE $5E,$DE,$DE,$DE,$37,$33,$33,$33
        .BYTE $31,$31,$78,$00,$DE,$DE,$DE,$DE
        .BYTE $9E,$9E,$BF,$00,$7F,$1F,$2F,$2F
        .BYTE $37,$37,$33,$33,$0F,$06,$86,$86
        .BYTE $C6,$C6,$E6,$E6,$31,$31,$30,$30
        .BYTE $30,$30,$78,$00,$F6,$F6,$FA,$FA
        .BYTE $7C,$7C,$3E,$00,$07,$1E,$3C,$3C
        .BYTE $78,$78,$78,$78,$70,$3C,$1E,$1E
        .BYTE $0F,$0F,$0F,$0F,$78,$78,$78,$3C
        .BYTE $3C,$1E,$07,$00,$0F,$0F,$0F,$1E
        .BYTE $1E,$3C,$70,$00,$7D,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3D,$F8,$3C,$1E,$1E
        .BYTE $1E,$1E,$3C,$F8,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7E,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$07,$1E,$3C,$3C
        .BYTE $78,$78,$78,$78,$70,$3C,$1E,$1E
        .BYTE $0F,$0F,$0F,$0F,$78,$78,$78,$3C
        .BYTE $3C,$1E,$07,$00,$0F,$0F,$0F,$9E
        .BYTE $DE,$7C,$7E,$00,$7D,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3D,$F8,$3C,$1E,$1E
        .BYTE $1E,$1E,$3C,$F8,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7E,$00,$3C,$1E,$1E,$1E
        .BYTE $1E,$1F,$0E,$00,$1F,$7C,$F8,$F8
        .BYTE $FC,$FF,$7F,$3F,$7F,$1F,$07,$03
        .BYTE $00,$80,$F0,$FC,$07,$00,$00,$60
        .BYTE $70,$7C,$7F,$00,$FE,$FF,$1F,$0F
        .BYTE $0F,$1E,$78,$00,$7B,$7B,$73,$63
        .BYTE $03,$03,$03,$03,$DE,$DE,$CE,$C6
        .BYTE $C0,$C0,$C0,$C0,$03,$03,$03,$03
        .BYTE $03,$03,$07,$00,$C0,$C0,$C0,$C0
        .BYTE $C0,$C0,$E0,$00,$7E,$3C,$3C,$3C
        .BYTE $3C,$3C,$3C,$3C,$0F,$06,$06,$06
        .BYTE $06,$06,$06,$06,$3C,$3C,$3C,$3C
        .BYTE $3C,$1E,$0F,$00,$06,$06,$06,$06
        .BYTE $06,$0E,$BC,$00,$7F,$3E,$3E,$1F
        .BYTE $1F,$1F,$0F,$0F,$0F,$06,$06,$06
        .BYTE $06,$0C,$8C,$8C,$0F,$07,$07,$07
        .BYTE $03,$03,$00,$00,$8C,$D8,$D8,$D8
        .BYTE $E0,$E0,$E0,$00,$FD,$79,$7B,$7B
        .BYTE $7B,$7B,$7B,$79,$1E,$8C,$8C,$CC
        .BYTE $CC,$CC,$EC,$EC,$79,$79,$79,$78
        .BYTE $78,$38,$38,$00,$EC,$EC,$EC,$EC
        .BYTE $EC,$EC,$6C,$00,$7F,$1F,$0F,$0F
        .BYTE $07,$07,$03,$03,$8F,$06,$8C,$98
        .BYTE $D0,$C0,$E0,$E0,$01,$05,$0C,$18
        .BYTE $30,$60,$E0,$00,$F0,$F0,$F8,$F8
        .BYTE $7C,$7C,$FE,$00,$7E,$3E,$1F,$1F
        .BYTE $0F,$0F,$07,$07,$0F,$06,$0C,$0C
        .BYTE $98,$D8,$D0,$D0,$03,$03,$03,$03
        .BYTE $03,$03,$07,$00,$C0,$C0,$C0,$C0
        .BYTE $C0,$C0,$E0,$00,$7F,$7C,$70,$60
        .BYTE $01,$01,$03,$03,$7C,$7C,$F8,$F8
        .BYTE $F0,$F0,$E0,$E0,$07,$07,$0F,$0F
        .BYTE $1F,$1F,$3E,$00,$C0,$C0,$80,$83
        .BYTE $07,$1F,$7F,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$01
        .BYTE $03,$03,$01,$00,$00,$00,$00,$80
        .BYTE $C0,$C0,$80,$00,$00,$1C,$3E,$33
        .BYTE $63,$67,$67,$67,$00,$38,$7C,$DC
        .BYTE $BE,$FE,$FE,$FE,$37,$37,$1B,$0D
        .BYTE $07,$03,$01,$00,$FC,$FC,$F8,$F0
        .BYTE $E0,$C0,$80,$00,$07,$1E,$3C,$3C
        .BYTE $78,$78,$78,$78,$70,$3C,$1E,$1E
        .BYTE $0F,$0F,$0F,$0F,$78,$78,$78,$3C
        .BYTE $3C,$1E,$07,$00,$0F,$0F,$0F,$1E
        .BYTE $1E,$3C,$70,$00,$07,$03,$03,$03
        .BYTE $03,$03,$03,$03,$C0,$C0,$C0,$C0
        .BYTE $C0,$C0,$C0,$C0,$03,$03,$03,$03
        .BYTE $03,$03,$07,$00,$C0,$C0,$C0,$C0
        .BYTE $C0,$C0,$E0,$00,$07,$18,$38,$38
        .BYTE $00,$00,$00,$00,$78,$3C,$1E,$1E
        .BYTE $1E,$1E,$3C,$F8,$0F,$18,$30,$03
        .BYTE $3F,$7F,$38,$00,$C0,$00,$00,$C6
        .BYTE $FE,$FC,$19,$00,$07,$18,$38,$38
        .BYTE $00,$00,$00,$00,$78,$3C,$1E,$1E
        .BYTE $1E,$1E,$3C,$F8,$00,$00,$00,$38
        .BYTE $38,$18,$07,$00,$3C,$1E,$1E,$1E
        .BYTE $1E,$3C,$78,$00,$00,$01,$03,$06
        .BYTE $0C,$18,$30,$3F,$9C,$BC,$3C,$3C
        .BYTE $3C,$3C,$3C,$BF,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$3C,$3C,$3C,$3C
        .BYTE $3C,$3C,$7E,$00,$3C,$3F,$3F,$31
        .BYTE $30,$30,$38,$1F,$0E,$FC,$F0,$E0
        .BYTE $00,$00,$00,$78,$00,$00,$00,$38
        .BYTE $38,$1C,$07,$00,$3C,$1E,$1E,$1E
        .BYTE $1E,$3C,$78,$00,$05,$18,$38,$38
        .BYTE $78,$78,$78,$79,$E0,$38,$1C,$1C
        .BYTE $00,$00,$00,$F8,$7B,$78,$78,$38
        .BYTE $38,$18,$05,$00,$3C,$1E,$1E,$1E
        .BYTE $1E,$3C,$F8,$00,$7F,$7C,$70,$60
        .BYTE $01,$01,$03,$03,$7C,$7C,$F8,$F8
        .BYTE $F0,$F0,$E0,$E0,$07,$07,$0F,$0F
        .BYTE $1F,$1F,$3E,$00,$C0,$C0,$80,$80
        .BYTE $00,$00,$00,$00,$1F,$3C,$78,$78
        .BYTE $78,$78,$3C,$1F,$78,$3C,$1E,$1E
        .BYTE $1E,$1E,$3C,$78,$3C,$78,$78,$78
        .BYTE $78,$3C,$1F,$00,$3C,$1E,$1E,$1E
        .BYTE $1E,$3C,$78,$00,$1F,$3C,$78,$78
        .BYTE $78,$78,$3C,$1F,$A0,$18,$1C,$1C
        .BYTE $1E,$1E,$1E,$9E,$00,$00,$00,$38
        .BYTE $38,$18,$07,$00,$1E,$1E,$1E,$1C
        .BYTE $1C,$18,$A0,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$FF

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $4000. Screen RAM
        * = $4000
        .BINARY "rambo-4000-4fe8-screen-ram.bin"

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Sprite frames
        * = $43F8
GAME_SPR_FRAME_TBL      .BYTE 71                ;Sprite Frame Rambo MC
                        .BYTE 17                ;Sprite Frame Energy/Score right
                        .BYTE $14,$4B,$3D,$6D,$68,$3C

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $4400 sprites
        * = $4400
        .BINARY "rambo-4400-sprites.bin"

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $7800: Charset

        * = $7800
        .BINARY "rambo-game-7800-charset.bin"

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Unused?
f8000   .BYTE $00,$00,$00,$01,$01,$02,$03,$04
        .BYTE $05,$07,$08,$0A,$0C,$0D,$0F,$11
        .BYTE $13,$15,$18,$1A,$1C,$1F,$21,$24
        .BYTE $26,$29,$2B,$2D,$C5,$CE,$C4,$00
        .BYTE $00,$C5,$CE,$C4,$00,$21,$23,$24
        .BYTE $26,$28,$22,$23,$24,$26,$27,$28
        .BYTE $2A,$2B,$2C,$2E,$2F,$31,$32,$34
        .BYTE $35,$37,$38,$3A,$3B,$3D,$3E,$41
        .BYTE $43,$44,$46,$48,$49,$4B,$4C,$4E
        .BYTE $50,$51,$53,$55,$56,$58,$5A,$5B
        .BYTE $5D,$5F,$60,$62,$63,$C5,$CE,$C4
        .BYTE $00,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$10,$00,$FF,$FF,$10,$00
        .BYTE $FF,$FF,$48,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$C0,$00,$00,$FF,$FE,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FE,$40,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00
        .BYTE $2E,$00,$BE,$00,$FF,$FF,$00,$00
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$00,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
;
; MUSIC FUNCTIONS
;
; Until music is fully analyzed, let's force it to start at $8100.
; Otherwise music will break since the "notes" contain addresses to
; other notes
;
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
        * = $8100
; $8100
; Args: A
MUSIC_FN
        TAY
        LDA MUSIC_FNS_LO,Y
        STA _JMP_LSB
        LDA MUSIC_FNS_HI,Y
        STA _JMP_MSB
_JMP_LSB = *+$01
_JMP_MSB = *+$02
        JMP MUSIC_FN_00                       ;Updated in runtime

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
j8110   LDX a822D
        LDY a822E
j8116   STX a8232
        STY a8233
s811C   LDA a8220
        STA a8237
        LDA a821F
        STA a8236
        LDA a821E
        STA a8235
        LDA a821D
        STA a8234
f8134   RTS

f8135   .BYTE $0A,$00,$F6,$FF,$0A,$00,$00,$00
        .BYTE $03,$06,$03,$00,$15
f8142   .BYTE $05
f8143   .BYTE $FF,$FF,$05
f8146   .BYTE $05,$01,$00,$05,$00
f814B   .BYTE $00
f814C   .BYTE $00
a814D   .BYTE $41,$FE
a814F   .BYTE $DD
a8150   .BYTE $FF
a8151   .BYTE $FF,$08,$10,$18,$20,$28,$30,$38
        .BYTE $40,$48,$50,$58,$60,$68,$70,$78
        .BYTE $80
f8162   .BYTE $00,$00,$00,$00,$00,$00,$0A,$4D
f816A   .BYTE $00,$00,$00,$00,$00,$00,$A8,$95
f8172   .BYTE $00
f8173   .BYTE $00,$00,$00,$00,$00,$00,$00
f817A   .BYTE $0A,$00,$F6,$FF,$0A,$00,$00,$00
        .BYTE $03,$06,$03,$00,$15
a8187   .BYTE $05
f8188   .BYTE $FF,$FF,$05
a818B   .BYTE $05,$01,$00,$05,$00
f8190   .BYTE $00,$00
a8192   .BYTE $41,$FE,$DD
a8195   .BYTE $FF
a8196   .BYTE $FF,$08,$10,$18,$20,$28,$30,$38
        .BYTE $40,$48
f81A0   .BYTE $50,$58,$60,$68,$70,$78,$80
f81A7   .BYTE $00,$00,$00,$00,$E7,$E3,$D7,$FE
f81AF   .BYTE $00,$00,$00,$00,$94,$A8,$A8,$96
f81B7   .BYTE $00
f81B8   .BYTE $00,$00,$00,$00,$00,$00,$04
f81BF   .BYTE $0A,$00,$F6,$FF,$0A,$00,$00,$00
        .BYTE $03,$06,$03,$00,$15
a81CC   .BYTE $05
f81CD   .BYTE $FF,$FF,$05
a81D0   .BYTE $05,$01,$00,$05,$00
f81D5   .BYTE $00,$00
a81D7   .BYTE $41,$FE,$DD
a81DA   .BYTE $FF
a81DB   .BYTE $FF,$08,$10,$18,$20,$28,$30,$38
        .BYTE $40,$48,$50,$58,$60,$68,$70,$78
        .BYTE $80
f81EC   .BYTE $00,$00,$00,$00,$3D,$BA,$D7,$C8
f81F4   .BYTE $00,$00,$00,$00,$95,$A9,$AB,$97
f81FC   .BYTE $00
f81FD   .BYTE $00,$00,$00,$00,$09,$00,$03
f8204   .BYTE $00
a8205   .BYTE $00
a8206   .BYTE $00,$00
a8208   .BYTE $C8
a8209   .BYTE $A7
a820A   .BYTE $00
a820B   .BYTE $00
a820C   .BYTE $00
a820D   .BYTE $00
a820E   .BYTE $0F,$00,$00,$00,$00,$00,$00
f8215   .BYTE $0A
f8216   .BYTE $00
f8217   .BYTE $F6
f8218   .BYTE $FF
f8219   .BYTE $0A
f821A   .BYTE $00
a821B   .BYTE $00
a821C   .BYTE $00
a821D   .BYTE $03
a821E   .BYTE $06
a821F   .BYTE $03
a8220   .BYTE $00
a8221   .BYTE $00
a8222   .BYTE $05
a8223   .BYTE $FF
a8224   .BYTE $FF
a8225   .BYTE $00
a8226   .BYTE $05
a8227   .BYTE $01
a8228   .BYTE $00
a8229   .BYTE $05
a822A   .BYTE $00
a822B   .BYTE $00
a822C   .BYTE $00
a822D   .BYTE $6C
a822E   .BYTE $06
a822F   .BYTE $41
a8230   .BYTE $B0
a8231   .BYTE $FF
a8232   .BYTE $58
a8233   .BYTE $06
a8234   .BYTE $00
a8235   .BYTE $00
a8236   .BYTE $02
a8237   .BYTE $00
a8238   .BYTE $4A
a8239   .BYTE $00
a823A   .BYTE $B5
a823B   .BYTE $FF
f823C   .BYTE $0A
a823D   .BYTE $00
a823E   .BYTE $F6
a823F   .BYTE $FF
a8240   .BYTE $0A
a8241   .BYTE $00
a8242   .BYTE $00
a8243   .BYTE $00
a8244   .BYTE $03
a8245   .BYTE $06
a8246   .BYTE $03
a8247   .BYTE $00
a8248   .BYTE $00
a8249   .BYTE $05
a824A   .BYTE $FF
a824B   .BYTE $FF
a824C   .BYTE $00
a824D   .BYTE $05
a824E   .BYTE $01
a824F   .BYTE $00
a8250   .BYTE $05
a8251   .BYTE $00
a8252   .BYTE $00
a8253   .BYTE $00
a8254   .BYTE $6C
a8255   .BYTE $06
a8256   .BYTE $41
a8257   .BYTE $C0
a8258   .BYTE $FF
a8259   .BYTE $6C
a825A   .BYTE $06
a825B   .BYTE $00
a825C   .BYTE $03
a825D   .BYTE $03
a825E   .BYTE $00
a825F   .BYTE $3A
a8260   .BYTE $00
a8261   .BYTE $C5
a8262   .BYTE $FF
f8263   .BYTE $0A
a8264   .BYTE $00
a8265   .BYTE $F6
a8266   .BYTE $FF
a8267   .BYTE $0A
a8268   .BYTE $00
a8269   .BYTE $00
a826A   .BYTE $00
a826B   .BYTE $03
a826C   .BYTE $06
a826D   .BYTE $03
a826E   .BYTE $00
a826F   .BYTE $00
a8270   .BYTE $05
a8271   .BYTE $FF
a8272   .BYTE $FF
a8273   .BYTE $00
a8274   .BYTE $05
a8275   .BYTE $01
a8276   .BYTE $00
a8277   .BYTE $05
a8278   .BYTE $00
a8279   .BYTE $00
a827A   .BYTE $00
a827B   .BYTE $6C
a827C   .BYTE $06
a827D   .BYTE $41
a827E   .BYTE $D0
a827F   .BYTE $FF
a8280   .BYTE $80
a8281   .BYTE $06
a8282   .BYTE $01
a8283   .BYTE $06
a8284   .BYTE $03
a8285   .BYTE $00
a8286   .BYTE $2A
a8287   .BYTE $00
a8288   .BYTE $D5
a8289   .BYTE $FF
a828A   .BYTE $07
f828B   .BYTE $14,$00,$EC,$FF,$14,$00,$11,$00
        .BYTE $03,$06,$03,$00,$04,$05,$14,$FF
        .BYTE $00,$04,$32,$00,$F6,$FF,$00,$08
        .BYTE $41,$02,$7B,$05,$64,$06,$0C,$12
        .BYTE $18,$1E,$24,$2A,$30,$36,$3C,$42
        .BYTE $48,$4E,$54,$5A,$60,$00,$00,$00
        .BYTE $00,$00,$00,$D7,$2F
f82C0   .BYTE $00,$00,$00,$00,$00,$00,$A7,$AA
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $14,$00,$EC,$FF,$14,$00,$11,$00
        .BYTE $03,$06,$03,$00,$04,$05,$14,$FF
        .BYTE $00,$04,$32,$00,$F6,$FF,$00,$08
        .BYTE $41,$02,$7B,$05,$64,$06,$0C,$12
        .BYTE $18,$1E,$24,$2A,$30,$36
f82F6   .BYTE $3C,$42,$48,$4E,$54,$5A,$60,$00
        .BYTE $00,$00,$00,$E7,$CA,$D7,$13,$00
        .BYTE $00,$00,$00,$94,$94,$A7,$AB,$00
        .BYTE $00,$00,$00,$00,$00,$00,$04,$14
        .BYTE $00,$EC,$FF,$14,$00,$11,$00,$03
        .BYTE $06,$03,$00,$04,$05,$14,$FF,$00
        .BYTE $04,$32,$00,$F6,$FF
f832B   .BYTE $00,$08,$41,$01,$89,$04,$1A,$06
        .BYTE $0C,$12,$18,$1E,$24,$2A,$30,$36
        .BYTE $3C,$42,$48,$4E,$54,$5A,$60,$00
        .BYTE $00,$00,$00,$3D,$8D,$8A,$CF,$00
        .BYTE $00,$00,$00,$95,$A9,$A9,$AB,$00
        .BYTE $00,$00,$00,$00,$09,$06,$00,$00
        .BYTE $18,$1A,$00
f835E   .BYTE $C8,$A7,$C8,$A7,$9E,$A9,$1A,$89
        .BYTE $B3,$3F,$01,$01,$01,$05,$05,$04

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

; 64tass doesn't support multiline lists, so create multiple lists
; and then append them together.
_JUMPY_0 = [MUSIC_FN_00,MUSIC_FN_01,MUSIC_FN_02,MUSIC_FN_03,MUSIC_FN_04,MUSIC_FN_05,MUSIC_FN_06,MUSIC_FN_07]     ;0-7
_JUMPY_1 = [MUSIC_FN_08,MUSIC_FN_09,MUSIC_FN_10,MUSIC_FN_11,MUSIC_FN_12,MUSIC_FN_13,MUSIC_FN_14,MUSIC_FN_15]     ;8-15
_JUMPY_2 = [MUSIC_FN_16,MUSIC_FN_17,MUSIC_FN_18,MUSIC_FN_19,MUSIC_FN_20,MUSIC_FN_21,MUSIC_FN_22,MUSIC_FN_23]     ;16-23
_JUMPY_3 = [MUSIC_FN_24,MUSIC_FN_25,MUSIC_FN_26,MUSIC_FN_27,MUSIC_FN_28,MUSIC_FN_29,MUSIC_FN_30]           ;24-30
_JUMPY = _JUMPY_0 .. _JUMPY_1 .. _JUMPY_2 .. _JUMPY_3

MUSIC_FNS_LO    .BYTE <_JUMPY
MUSIC_FNS_HI    .BYTE >_JUMPY

MUSIC_FN_24
        LDX a9291
        LDA f90B9,X
        STA a9299
        TAX
        LDA f90B9,X
        STA a929A
        LDY #$11
        .BYTE $2C                       ;It is a BIT. Clobbers the next instruction
MUSIC_FN_13
        LDY #$02
        .BYTE $2C
MUSIC_FN_14
        LDY #$06
        .BYTE $2C
MUSIC_FN_15
        LDY #$0B
        .BYTE $2C
MUSIC_FN_16
        LDY #$0F
        .BYTE $2C
MUSIC_FN_17
        LDY #$0D
        .BYTE $2C
MUSIC_FN_30
        LDY #$17
        .BYTE $2C
MUSIC_FN_18
        LDY #$07
        .BYTE $2C
MUSIC_FN_23
        LDY #$03

b83D6   STY a85EB
        LDY #$00
        STY a85EC
        RTS

MUSIC_FN_19
        LDX a9291
        LDA f90B9,X
        STA a9291
        LDY #$08     ;#%00001000
        BNE b83D6
MUSIC_FN_20
        LDX #$01     ;#%00000001
        LDA a845B
        BNE b845A
        STX a845B
        BEQ b8402
MUSIC_FN_22
        LDX #$01     ;#%00000001
        LDA a845C
        BNE b845A
        STX a845C
b8402   LDX #<p8423  ;#%00100011
        LDY #>p8423  ;#%10000100
        STX a859E
        STY a859F
        RTS

MUSIC_FN_21
        LDA #$00     ;#%00000000
        STA a845B
        ORA a845C
        BEQ b845D
        RTS

MUSIC_FN_08
        LDA #$00     ;#%00000000
        STA a845C
        ORA a845B
        BEQ b845D
        RTS

p8423   LDA a828A
        AND #$07     ;#%00000111
        BNE b845A
        LDA a845B
        BEQ b8442
        DEC a845B
        BNE b8442
        LDA #$30     ;#%00110000
        STA a845B

        LDX #<aA242
        LDY #>aA242
        LDA #$00                        ;Voice 0
        JSR s861F

b8442   LDA a845C
        BEQ b845A
        DEC a845C
        BNE b845A
        LDA #$2D     ;#%00101101
        STA a845C

        LDX #<aA223
        LDY #>aA223
        LDA #$01                        ;Voice 1
        JMP s861F

b845A   RTS

a845B   .BYTE $00
a845C   .BYTE $00

b845D   LDA #$00     ;#%00000000
        STA a859F
        STA a859E
        RTS

MUSIC_FN_02
        LDA a29
        AND #$07     ;#%00000111
        ORA a8231
        ORA a8258
        ORA a827F
        RTS

MUSIC_FN_01
        LDA #$38     ;#%00111000
        STA a29
        LDA #$00     ;#%00000000
        STA a820D
        STA a8231
        STA a8258
        STA a827F
        LDX #$14     ;#%00010100
b8488   STA $D400,X  ;Voice 1: Frequency Control - Low-Byte
        DEX
        BPL b8488
        STX a85EB
        STA a859F
        STA a845B
        STA a845C
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Jump table that hardcodes Y to a fixed value.
MUSIC_FN_12
        LDY #$35
        .BYTE $2C                       ;It is a BIT. Clobbers the next instruction
MUSIC_FN_29
        LDY #$11
        .BYTE $2C                       ;Ditto
MUSIC_FN_09
        LDY #$23
        .BYTE $2C                       ;Ditto
MUSIC_FN_10
        LDY #$29
        .BYTE $2C                       ;Ditto
MUSIC_FN_11
        LDY #$2F
        .BYTE $2C                       ;Ditto
MUSIC_FN_06
        LDY #$17
        .BYTE $2C                       ;Ditto
MUSIC_FN_07
        LDY #$1D
        .BYTE $2C                       ;Ditto
MUSIC_FN_05
        LDY #$0B
        .BYTE $2C                       ;Ditto
MUSIC_FN_03
        LDY #$05
        JMP j84DD

MUSIC_FN_04
        LDY #$3B
        .BYTE $2C                       ;Ditto
MUSIC_FN_28
        LDY #$47
        .BYTE $2C                       ;Ditto
MUSIC_FN_27
        LDY #$41
        LDX #$D4
b84C2   LDA f8134,X
        STA a828A,X
        DEX
        BNE b84C2
        LDX #$0F
b84CD   LDA f20,X
        STA f835E,X
        DEX
        BPL b84CD
        ASL a29
        SEC
        ROR a29
        LDA #$BF
        .BYTE $2C                       ;It is a BIT. Clobbers the next instructions
j84DD
        LDA #$3F
        STA a29

        LDX #$05
b84E3   LDA f91E3,Y
        STA f20,X
        DEY
        DEX
        BPL b84E3

        LDX #$02
b84EE   LDA #$01
        STA f2A,X
        LDA #$07
        STA f2D,X
        LDA #$00
        STA f8204,X
        LDY f90C2,X
        STA f8142,Y
        STA f8146,Y
        LDA #$08
        STA f814C,Y
        DEX
        BPL b84EE
        RTS

MUSIC_FN_26
        STX a828A
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s8511   LDA a820D
        BEQ b8537
        LDX a820E
        CLC
        ADC a820C
        STA a820C
        BIT a820D
        BPL b852D
        BCS b8537
        TXA
        BEQ b8537
        DEX
        BPL MUSIC_FN_25
b852D   BCC b8537
        CPX #$0F     ;#%00001111
        BEQ b8537
        INX

MUSIC_FN_25
        STX a820E

b8537   LDA a820E
        ORA a820B
        STA $D418                       ;Select Filter Mode and Volume
        LDA a820A
        STA $D417                       ;Filter Resonance Control / Voice Input Control
        LDA a8209
        STA $D416                       ;Filter Cutoff Frequency: High-Byte
        LDA a8208
        STA $D415                       ;Filter Cutoff Frequency: Low-Nybble
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
MUSIC_FN_00
        JSR s8597
        JSR s8511
        JSR s8611
        JSR s870C
        JSR s8A46
        JSR s8D82
s8565   LDA a29
        BMI b856A
        RTS

b856A   AND #$07     ;#%00000111
        BEQ b856F
        RTS

b856F   LDX #$34     ;#%00110100
b8571   LDA f828B,X
        STA f8135,X
        LDA f82C0,X
        STA f816A,X
        LDA f82F6,X
        STA f81A0,X
        LDA f832B,X
        STA f81D5,X
        DEX
        BPL b8571
        LDX #$0F     ;#%00001111
b858E   LDA f835E,X
        STA f20,X
        DEX
        BPL b858E
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s8597   LDA a859F
        BNE b859D
        RTS

a859E   = *+$01
a859F   = *+$02
b859D   JMP $00FF                       ;Modified in runtime

s85A0   LDX a822B
        LDY a822C
        STX a8238
        STY a8239
s85AC   LDA a8223
        STA a823A
        LDA a8224
        STA a823B
        RTS

s85B9   LDX a8252
        LDY a8253
        STX a825F
        STY a8260
s85C5   LDA a824A
        STA a8261
        LDA a824B
        STA a8262
        RTS

s85D2   LDX a8279
        LDY a827A
        STX a8286
        STY a8287
s85DE   LDA a8271
        STA a8288
        LDA a8272
        STA a8289
        RTS

a85EB   .BYTE $FF
a85EC   .BYTE $00

b85ED   LDX f9259,Y                     ;Lo
        LDA f9289,Y
        STA a28
        LDA f9271,Y
        TAY                             ;Hi
        LDA a28                         ;Voice
        JSR s861F

        LDY a85EB
        DEC a85EB
        LDA f9241,Y
        STA a85EC
        BPL b860F
        STA a85EB
b860F   BNE b861E
s8611   LDY a85EB
        BMI b861E
        LDA a85EC
        BEQ b85ED
        DEC a85EC
b861E   RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Params: A, X, Y
; X/Y: Points to Waveform table
; A voice: 0, 1 or 2
s861F   STX a26
        STY a27
        STA a28
        TAX
        LDA f90C8,X
        AND a29
        STA a29
        LDA f90BF,X
        STA _ADDR_LO

        LDX #$04
        LDY #$1A
_L00    LDA (p26),Y
_ADDR_LO = *+$01                        ;Voice 1, 2 or 3: Pulse Waveform Width - Low-Byte
        STA $D409,X                     ; Gets modified in runtime
        DEY
        DEX
        BPL _L00

        LDY #$1D     ;#%00011101
        LDX _ADDR_LO
        LDA (p26),Y
        STA $D400-2,X                   ;-2 is to make x-2
        INY
        LDA (p26),Y
        STA $D400-1,X                   ;-1 is to make x-1
        LDY a28
        LDX f90BC,Y
        LDY #$1B     ;#%00011011
        LDA (p26),Y
        STA f8219,X
        INY
        LDA (p26),Y
        STA f821A,X
        LDY #$18     ;#%00011000
        LDA (p26),Y
        STA f8218,X
        LDY #$1E     ;#%00011110
        LDA (p26),Y
        STA f8217,X
        DEY
        LDA (p26),Y
        STA f8216,X
        LDY #$17     ;#%00010111
        CPX #$65     ;#%01100101
        BEQ b86D2
        CPX #$3E     ;#%00111110
        BEQ b8698
b8680   LDA (p26),Y
        STA f8215,Y
        DEY
        BPL b8680
        LDA a8226
        BEQ b8690
        JSR s85A0
b8690   LDA a8222
        BEQ b86D1
        JMP j8110

b8698   LDA (p26),Y
        STA f823C,Y
        DEY
        BPL b8698
        LDA a824D
        BEQ b86A8
        JSR s85B9
b86A8   LDA a8249
        BEQ b86D1
s86AD   LDX a8254
        LDY a8255
        STX a8259
        STY a825A
s86B9   LDA a8247
        STA a825E
        LDA a8246
        STA a825D
        LDA a8245
        STA a825C
        LDA a8244
        STA a825B
b86D1   RTS

b86D2   LDA (p26),Y
        STA f8263,Y
        DEY
        BPL b86D2
        LDA a8274
        BEQ b86E2
        JSR s85D2
b86E2   LDA a8270
        BEQ b870B
s86E7   LDX a827B
        LDY a827C
        STX a8280
        STY a8281
s86F3   LDA a826E
        STA a8285
        LDA a826D
        STA a8284
        LDA a826C
        STA a8283
        LDA a826B
        STA a8282
b870B   RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
;
; Voice 1 related functions
;
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s870C   LDA a29
        LSR A
        BCC b8715
        DEC a2A
        BEQ b8723
b8715   JMP j88DE

j8718   LDA #$03                        ;Triplets
j871A   CLC
        ADC a20
        STA a20
        BCC b8723
        INC a21
b8723   LDY #$00
        LDA (p20),Y
        CMP #$C0
        BCC b8748
        AND #$3F
        TAX
        LDA VOICE_1_EFFECTS_TBL,X
        STA _ADDR_LO
        LDA VOICE_1_EFFECTS_TBL+1,X
        STA _ADDR_HI
        INY
        LDA (p20),Y
        TAX
        STA a26
        INY
        LDA (p20),Y
        STA a27
_ADDR_LO = *+$01
_ADDR_HI = *+$02
        JMP j88D1                       ;Modified in runtime

b8748   STA a28
        CMP #$60     ;#%01100000
        BCC b8750
        SBC #$60     ;#%01100000
b8750   CMP #$5F     ;#%01011111
        BEQ b8762
        CMP #$5E     ;#%01011110
        BEQ b875B
        ADC f8204
b875B   TAX
        LDA a828A
        LSR A
        BCS b8765
b8762   JMP j87F3

b8765   LDA a29
        AND #$08     ;#%00001000
        BEQ b8762
        LDY #$04     ;#%00000100
b876D   LDA #$00     ;#%00000000
        STA $D402,Y                     ;Voice 1: Pulse Waveform Width - Low-Byte
        LDA f814B,Y
        CPY #$02     ;#%00000010
        BNE b877B
        AND #$F7     ;#%11110111
b877B   STA $D402,Y                     ;Voice 1: Pulse Waveform Width - Low-Byte
        DEY
        BPL b876D
        LDA a814D
        STA a822F
        LDY FREQ_TBL_HI,X
        LDA FREQ_TBL_LO,X
        STA a822D
        STY a822E
        STA $D400                       ;Voice 1: Frequency Control - Low-Byte
        STY $D401                       ;Voice 1: Frequency Control - High-Byte
        LDA f8146
        STA a8226
        BEQ b87AF
        LDY #$09     ;#%00001001
b87A3   LDA f8143,Y
        STA a8223,Y
        DEY
        BPL b87A3
        JSR s85A0
b87AF   LDX f8142
        STX a8222
        BEQ b87E7
        LDY #$0D     ;#%00001101
b87B9   LDA f8135,Y
        STA f8215,Y
        DEY
        BPL b87B9
        TXA
        AND #$08     ;#%00001000
        BEQ b87DB
        LDA a28
        CMP #$60     ;#%01100000
        BCC b87D0
        SBC #$60     ;#%01100000
        CLC
b87D0   ADC f8204
        STA a821F
        STY a8221
        BNE b87E7
b87DB   LDX a822D
        LDY a822E
        STX a8232
        STY a8233
b87E7   LDX a8150
        LDY a8151
        STX a8230
        STY a8231
j87F3   LDY #$01     ;#%00000001
        LDA (p20),Y
        LDX a28
        CPX #$60     ;#%01100000
        BCS b8801
        TAX
        LDA a8151,X
b8801   STA a2A
        LDA #$02     ;#%00000010
        CLC
        ADC a20
        STA a20
        BCC b880E
        INC a21
b880E   JMP j88DE

a8811   INC a2D
        LDY a2D
        CPY #$08     ;#%00001000
        BEQ b8822
b8819   LDX f8162,Y
        LDA f816A,Y
        JMP j889A

b8822   LDA a29
        AND #$FE     ;#%11111110
        STA a29
        RTS

a8829   LDX a2D
        CLC
        TYA
        ADC a20
        STA f8162,X
        LDA #$00     ;#%00000000
        ADC a21
        STA f816A,X
        LDA a26
        STA f8172,X
        DEC a2D
        TYA
        JMP j871A

a8844   LDX a2D
        DEC f8173,X
        BEQ b8850
        INX
        TXA
        TAY
        BPL b8819
b8850   INC a2D
        LDA #$01
        JMP j871A

a8857   LDY #$04
        LDX #$1C
b885B   LDA (p26),Y
        STA f8135,X
        DEX
        DEY
        BPL b885B
        JMP j8718

a8867   LDY #$0D
        .BYTE $2C                       ;It is a BIT. Clobbers the next instruction
b886A
        LDY #$09
b886C   LDA (p26),Y
        STA f8135,Y
        DEY
        BPL b886C
        JMP j8718

a8877   INY
        PHA
        LDA (p20),Y
        STA a26
        INY
        LDA (p20),Y
        STA a27
        PLA
        TAY
b8884   LDA (p26),Y
        STA f8135,X
        DEX
        DEY
        BPL b8884
        LDA #$05     ;#%00000101
        JMP j871A

a8892   INY
        LDA (p20),Y
        STA f8204
j8898   LDA a27
j889A   STX a20
        STA a21
        JMP b8723

a88A1   LDA #>j8718-1
        PHA
        LDA #<j8718-1
        PHA
        JMP (p0026)

a88AA   LDA #$03
b88AC   LDY a2D
        CLC
        ADC a20
        STA f8162,Y
        LDA #$00
        ADC a21
        STA f816A,Y
        DEC a2D
        JMP j8898

a88C0   INY
        LDA (p20),Y
        STA f8204
        LDA #$04     ;#%00000100
        BNE b88AC
a88CA   STX f8204
        TYA
        JMP j871A

j88D1   STA f8135,X
        JMP j8718

a88D7   STA f8215,X
        JMP j8718

b88DD   RTS

j88DE   LDX a8231
        BEQ b88DD
        LDA a822F
        AND #$08     ;#%00001000
        BEQ b8900
        LDA a2A
        CMP a8230
        BCS b8926
        LDA #$00     ;#%00000000
        STA a8230
        LDA a822F
        AND #$F6     ;#%11110110
        STA a822F
        BNE b8923
b8900   LDA a8230
        BNE b8919
        DEC a8231
        BNE b8926
        LDX #$06     ;#%00000110
b890C   STA $D400,X                     ;Voice 1: Frequency Control - Low-Byte
        DEX
        BPL b890C
        LDA #$08     ;#%00001000
        ORA a29
        STA a29
        RTS

b8919   DEC a8230
        BNE b8926
        LDA a822F
        AND #$F6     ;#%11110110
b8923   STA $D404    ;Voice 1: Control Register
b8926   LDA a8226
        BEQ b8988
        LDA a8225
        BEQ b8936
        DEC a8225
        JMP b8988

b8936   CLC
        LDX a8238
        LDY a8239
        LDA a823A
        BEQ b8952
        TXA
        ADC a8227
        TAX
        TYA
        ADC a8228
        TAY
        DEC a823A
        JMP j897C

b8952   LDA a823B
        BEQ b8967
        TXA
        ADC a8229
        TAX
        TYA
        ADC a822A
        TAY
        DEC a823B
        JMP j897C

b8967   LDA a8226
        AND #$81     ;#%10000001
        BEQ j897C
        BPL b8976
        JSR s85A0
        JMP b8936

b8976   JSR s85AC
        JMP b8936

j897C   STX a8238
        STY a8239
        STX $D402    ;Voice 1: Pulse Waveform Width - Low-Byte
        STY $D403    ;Voice 1: Pulse Waveform Width - High-Nybble
b8988   LDA a8222
        BEQ b89B3
        AND #$08     ;#%00001000
        BNE b89B4
        LDX a8232
        LDY a8233
        TYA
        STX a28
        ORA a28
        BEQ b89B3
        CLC
        LDA a8221
        BEQ b89D6
        DEC a8221
        BNE b89AC
        JSR s811C
b89AC   LDA a8222
        AND #$02     ;#%00000010
        BNE b8A1A
b89B3   RTS

b89B4   LDX a8221
        BPL b89BC
        LDX a8220
b89BC   LDA a821F
        CLC
        ADC f8215,X
        DEX
        STX a8221
        TAY
        LDX FREQ_TBL_LO,Y
        LDA FREQ_TBL_HI,Y
        STX $D400                       ;Voice 1: Frequency Control - Low-Byte
        STA $D401                       ;Voice 1: Frequency Control - High-Byte
        RTS

j89D5   CLC
b89D6   LDA a8234
        BEQ b89EA
        DEC a8234
        TXA
        ADC f8215
        TAX
        TYA
        ADC f8216
        JMP j8A23

b89EA   LDA a8235
        BEQ b89FE
        DEC a8235
        TXA
        ADC f8217
        TAX
        TYA
        ADC f8218
        JMP j8A23

b89FE   LDA a8236
        BEQ b8A12
        DEC a8236
        TXA
        ADC f8219
        TAX
        TYA
        ADC f821A
        JMP j8A23

b8A12   LDA a8237
        BEQ b8A31
        DEC a8237
b8A1A   TXA
        ADC a821B
        TAX
        TYA
        ADC a821C
j8A23   TAY
b8A24   STX a8232
        STY a8233
        STX $D400                       ;Voice 1: Frequency Control - Low-Byte
        STY $D401                       ;Voice 1: Frequency Control - High-Byte
        RTS

b8A31   LDA a8222
        AND #$81     ;#%10000001
        BEQ b8A24
        BPL b8A40
        JSR j8110
        JMP j89D5

b8A40   JSR s811C
        JMP j89D5

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
;
; Voice 2 related functions
;
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
s8A46   LDA a29
        AND #$02     ;#%00000010
        BEQ b8A50
        DEC a2B
        BEQ b8A5E
b8A50   JMP j8C1A

j8A53   LDA #$03     ;#%00000011
j8A55   CLC
        ADC a22
        STA a22
        BCC b8A5E
        INC a23
b8A5E   LDY #$00     ;#%00000000
        LDA (p22),Y
        CMP #$C0     ;#%11000000
        BCC b8A83
        AND #$3F     ;#%00111111
        TAX
        LDA VOICE_2_EFFECTS_TBL,X
        STA _ADDR_LO
        LDA VOICE_2_EFFECTS_TBL+1,X
        STA _ADDR_HI
        INY
        LDA (p22),Y
        TAX
        STA a26
        INY
        LDA (p22),Y
        STA a27
_ADDR_LO = *+$01
_ADDR_HI = *+$02
        JMP j8C0D                       ;Modified in runtime

b8A83   STA a28
        CMP #$60     ;#%01100000
        BCC b8A8B
        SBC #$60     ;#%01100000
b8A8B   CMP #$5F     ;#%01011111
        BEQ b8A9E
        CMP #$5E     ;#%01011110
        BEQ b8A96
        ADC a8205
b8A96   TAX
        LDA a828A
        AND #$02     ;#%00000010
        BNE b8AA1
b8A9E   JMP j8B2F

b8AA1   LDA a29
        AND #$10     ;#%00010000
        BEQ b8A9E
        LDY #$04     ;#%00000100
b8AA9   LDA #$00     ;#%00000000
        STA $D409,Y                     ;Voice 2: Pulse Waveform Width - Low-Byte
        LDA f8190,Y
        CPY #$02     ;#%00000010
        BNE b8AB7
        AND #$F7     ;#%11110111
b8AB7   STA $D409,Y                     ;Voice 2: Pulse Waveform Width - Low-Byte
        DEY
        BPL b8AA9
        LDA a8192
        STA a8256
        LDY FREQ_TBL_HI,X
        LDA FREQ_TBL_LO,X
        STA a8254
        STY a8255
        STA $D407                       ;Voice 2: Frequency Control - Low-Byte
        STY $D408                       ;Voice 2: Frequency Control - High-Byte
        LDA a818B
        STA a824D
        BEQ b8AEB
        LDY #$09     ;#%00001001
b8ADF   LDA f8188,Y
        STA a824A,Y
        DEY
        BPL b8ADF
        JSR s85B9
b8AEB   LDX a8187
        STX a8249
        BEQ b8B23
        LDY #$0D     ;#%00001101
b8AF5   LDA f817A,Y
        STA f823C,Y
        DEY
        BPL b8AF5
        TXA
        AND #$08     ;#%00001000
        BEQ b8B17
        LDA a28
        CMP #$60     ;#%01100000
        BCC b8B0C
        SBC #$60     ;#%01100000
        CLC
b8B0C   ADC a8205
        STA a8246
        STY a8248
        BNE b8B23
b8B17   LDX a8254
        LDY a8255
        STX a8259
        STY a825A
b8B23   LDX a8195
        LDY a8196
        STX a8257
        STY a8258
j8B2F   LDY #$01     ;#%00000001
        LDA (p22),Y
        LDX a28
        CPX #$60     ;#%01100000
        BCS b8B3D
        TAX
        LDA a8196,X
b8B3D   STA a2B
        LDA #$02     ;#%00000010
        CLC
        ADC a22
        STA a22
        BCC b8B4A
        INC a23
b8B4A   JMP j8C1A

a8B4D   INC a2E
        LDY a2E
        CPY #$08     ;#%00001000
        BEQ b8B5E
b8B55   LDX f81A7,Y
        LDA f81AF,Y
        JMP j8BD6

b8B5E   LDA a29
        AND #$FD     ;#%11111101
        STA a29
        RTS

a8B65   LDX a2E
        CLC
        TYA
        ADC a22
        STA f81A7,X
        LDA a23
        ADC #$00
        STA f81AF,X
        LDA a26
        STA f81B7,X
        DEC a2E
        TYA
        JMP j8A55

a8B80   LDX a2E
        DEC f81B8,X
        BEQ b8B8C
        INX
        TXA
        TAY
        BPL b8B55
b8B8C   INC a2E
        LDA #$01
        JMP j8A55

a8B93   LDY #$04
        LDX #$1C     ;#%00011100
b8B97   LDA (p26),Y
        STA f817A,X
        DEX
        DEY
        BPL b8B97
        JMP j8A53

a8BA3   LDY #$0D     ;#%00001101
        .BYTE $2C                       ;It is a BIT. Clobbers the next instruction
b8BA6
        LDY #$09
b8BA8   LDA (p26),Y
        STA f817A,Y
        DEY
        BPL b8BA8
        JMP j8A53

a8BB3   INY
        PHA
        LDA (p22),Y
        STA a26
        INY
        LDA (p22),Y
        STA a27
        PLA
        TAY
b8BC0   LDA (p26),Y
        STA f817A,X
        DEX
        DEY
        BPL b8BC0
        LDA #$05     ;#%00000101
        JMP j8A55

a8BCE   INY
        LDA (p22),Y
        STA a8205
j8BD4   LDA a27
j8BD6   STX a22
        STA a23
        JMP b8A5E

a8BDD   LDA #>j8A53-1
        PHA
        LDA #<j8A53-1
        PHA
        JMP (p0026)

a8BE6   LDA #$03     ;#%00000011
b8BE8   LDY a2E
        CLC
        ADC a22
        STA f81A7,Y
        LDA a23
        ADC #$00     ;#%00000000
        STA f81AF,Y
        DEC a2E
        JMP j8BD4

a8BFC  INY
        LDA (p22),Y
        STA a8205
        LDA #$04     ;#%00000100
        BNE b8BE8
a8C06   STX a8205
        TYA
        JMP j8A55

j8C0D   STA f817A,X
        JMP j8A53

a8C13   STA f823C,X
        JMP j8A53

b8C19   RTS

j8C1A   LDX a8258
        BEQ b8C19
        LDA a8256
        AND #$08     ;#%00001000
        BEQ b8C3C
        LDA a2B
        CMP a8257
        BCS b8C62
        LDA #$00     ;#%00000000
        STA a8257
        LDA a8256
        AND #$F6     ;#%11110110
        STA a8256
        BNE b8C5F
b8C3C   LDA a8257
        BNE b8C55
        DEC a8258
        BNE b8C62
        LDX #$06     ;#%00000110
b8C48   STA $D407,X                     ;Voice 2: Frequency Control - Low-Byte
        DEX
        BPL b8C48
        LDA #$10     ;#%00010000
        ORA a29
        STA a29
        RTS

b8C55   DEC a8257
        BNE b8C62
        LDA a8256
        AND #$F6     ;#%11110110
b8C5F   STA $D40B                       ;Voice 2: Control Register
b8C62   LDA a824D
        BEQ b8CC4
        LDA a824C
        BEQ b8C72
        DEC a824C
        JMP b8CC4

b8C72   CLC
        LDX a825F
        LDY a8260
        LDA a8261
        BEQ b8C8E
        TXA
        ADC a824E
        TAX
        TYA
        ADC a824F
        TAY
        DEC a8261
        JMP j8CB8

b8C8E   LDA a8262
        BEQ b8CA3
        TXA
        ADC a8250
        TAX
        TYA
        ADC a8251
        TAY
        DEC a8262
        JMP j8CB8

b8CA3   LDA a824D
        AND #$81     ;#%10000001
        BEQ j8CB8
        BPL b8CB2
        JSR s85B9
        JMP b8C72

b8CB2   JSR s85C5
        JMP b8C72

j8CB8   STX a825F
        STY a8260
        STX $D409                       ;Voice 2: Pulse Waveform Width - Low-Byte
        STY $D40A                       ;Voice 2: Pulse Waveform Width - High-Nybble
b8CC4   LDA a8249
        BEQ b8CEF
        AND #$08     ;#%00001000
        BNE b8CF0
        LDX a8259
        LDY a825A
        TYA
        STX a28
        ORA a28
        BEQ b8CEF
        CLC
        LDA a8248
        BEQ b8D12
        DEC a8248
        BNE b8CE8
        JSR s86B9
b8CE8   LDA a8249
        AND #$02     ;#%00000010
        BNE b8D56
b8CEF   RTS

b8CF0   LDX a8248
        BPL b8CF8
        LDX a8247
b8CF8   LDA a8246
        CLC
        ADC f823C,X
        DEX
        STX a8248
        TAY
        LDX FREQ_TBL_LO,Y
        LDA FREQ_TBL_HI,Y
        STX $D407                       ;Voice 2: Frequency Control - Low-Byte
        STA $D408                       ;Voice 2: Frequency Control - High-Byte
        RTS

j8D11   CLC
b8D12   LDA a825B
        BEQ b8D26
        DEC a825B
        TXA
        ADC f823C
        TAX
        TYA
        ADC a823D
        JMP j8D5F

b8D26   LDA a825C
        BEQ b8D3A
        DEC a825C
        TXA
        ADC a823E
        TAX
        TYA
        ADC a823F
        JMP j8D5F

b8D3A   LDA a825D
        BEQ b8D4E
        DEC a825D
        TXA
        ADC a8240
        TAX
        TYA
        ADC a8241
        JMP j8D5F

b8D4E   LDA a825E
        BEQ b8D6D
        DEC a825E
b8D56   TXA
        ADC a8242
        TAX
        TYA
        ADC a8243
j8D5F   TAY
b8D60   STX a8259
        STY a825A
        STX $D407                       ;Voice 2: Frequency Control - Low-Byte
        STY $D408                       ;Voice 2: Frequency Control - High-Byte
        RTS

b8D6D   LDA a8249
        AND #$81     ;#%10000001
        BEQ b8D60
        BPL b8D7C
        JSR s86AD
        JMP j8D11

b8D7C   JSR s86B9
        JMP j8D11

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
;
; Voice 3 related functions
;
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

s8D82   LDA a29
        AND #$04     ;#%00000100
        BEQ b8D8C
        DEC a2C
        BEQ b8D9A
b8D8C   JMP j8F51

j8D8F   LDA #$03     ;#%00000011
j8D91   CLC
        ADC a24
        STA a24
        BCC b8D9A
        INC a25
b8D9A   LDY #$00     ;#%00000000
        LDA (p24),Y
        CMP #$C0     ;#%11000000
        BCC b8DBF
        AND #$3F     ;#%00111111
        TAX
        LDA VOICE_3_EFFECTS_TBL,X
        STA _ADDR_LO
        LDA VOICE_3_EFFECTS_TBL+1,X
        STA _ADDR_HI
        INY
        LDA (p24),Y
        TAX
        STA a26
        INY
        LDA (p24),Y
        STA a27
_ADDR_LO = *+$01
_ADDR_HI = *+$02
        JMP j8F44

b8DBF   STA a28
        CMP #$60     ;#%01100000
        BCC b8DC7
        SBC #$60     ;#%01100000
b8DC7   CMP #$5F     ;#%01011111
        BEQ b8DDA
        CMP #$5E     ;#%01011110
        BEQ b8DD2
        ADC a8206
b8DD2   TAX
        LDA a828A
        AND #$04     ;#%00000100
        BNE b8DDD
b8DDA   JMP j8E66

b8DDD   LDA a29
        AND #$20     ;#%00100000
        BEQ b8DDA
        LDY #$04     ;#%00000100
b8DE5   LDA f81D5,Y
        CPY #$02     ;#%00000010
        BNE b8DEE
        AND #$F7     ;#%11110111
b8DEE   STA $D410,Y  ;Voice 3: Pulse Waveform Width - Low-Byte
        DEY
        BPL b8DE5
        LDA a81D7
        STA a827D
        LDY FREQ_TBL_HI,X
        LDA FREQ_TBL_LO,X
        STA a827B
        STY a827C
        STA $D40E                       ;Voice 3: Frequency Control - Low-Byte
        STY $D40F                       ;Voice 3: Frequency Control - High-Byte
        LDA a81D0
        STA a8274
        BEQ b8E22
        LDY #$09     ;#%00001001
b8E16   LDA f81CD,Y
        STA a8271,Y
        DEY
        BPL b8E16
        JSR s85D2
b8E22   LDX a81CC
        STX a8270
        BEQ b8E5A
        LDY #$0D     ;#%00001101
b8E2C   LDA f81BF,Y
        STA f8263,Y
        DEY
        BPL b8E2C
        TXA
        AND #$08     ;#%00001000
        BEQ b8E4E
        LDA a28
        CMP #$60     ;#%01100000
        BCC b8E43
        SBC #$60     ;#%01100000
        CLC
b8E43   ADC a8206
        STA a826D
        STY a826F
        BNE b8E5A
b8E4E   LDX a827B
        LDY a827C
        STX a8280
        STY a8281
b8E5A   LDX a81DA
        LDY a81DB
        STX a827E
        STY a827F
j8E66   LDY #$01     ;#%00000001
        LDA (p24),Y
        LDX a28
        CPX #$60     ;#%01100000
        BCS b8E74
        TAX
        LDA a81DB,X
b8E74   STA a2C
        LDA #$02     ;#%00000010
        CLC
        ADC a24
        STA a24
        BCC b8E81
        INC a25
b8E81   JMP j8F51

a8E84   INC a2F
        LDY a2F
        CPY #$08     ;#%00001000
        BEQ b8E95
b8E8C   LDX f81EC,Y
        LDA f81F4,Y
        JMP j8F0D

b8E95   LDA a29
        AND #$FB     ;#%11111011
        STA a29
        RTS

a8E9C   LDX a2F
        CLC
        TYA
        ADC a24
        STA f81EC,X
        LDA #$00     ;#%00000000
        ADC a25
        STA f81F4,X
        LDA a26
        STA f81FC,X
        DEC a2F
        TYA
        JMP j8D91

a8EB7   LDX a2F
        DEC f81FD,X
        BEQ b8EC3
        INX
        TXA
        TAY
        BPL b8E8C
b8EC3   INC a2F
        LDA #$01
        JMP j8D91

a8ECA   LDY #$04
        LDX #$1C     ;#%00011100
b8ECE   LDA (p26),Y
        STA f81BF,X
        DEX
        DEY
        BPL b8ECE
        JMP j8D8F

a8EDA   LDY #$0D
        .BYTE $2C                       ;It is a BIT. Clobbers the next instruction
b8EDD
        LDY #$09
b8EDF   LDA (p26),Y
        STA f81BF,Y
        DEY
        BPL b8EDF
        JMP j8D8F

a8EEA   INY
        PHA
        LDA (p24),Y
        STA a26
        INY
        LDA (p24),Y
        STA a27
        PLA
        TAY
b8EF7   LDA (p26),Y
        STA f81BF,X
        DEX
        DEY
        BPL b8EF7
        LDA #$05     ;#%00000101
        JMP j8D91

a8F05   INY
        LDA (p24),Y
        STA a8206
j8F0B   LDA a27
j8F0D   STX a24
        STA a25
        JMP b8D9A

a8F14   LDA #>j8D8F-1
        PHA
        LDA #<j8D8F-1
        PHA
        JMP (p0026)

a8F1D   LDA #$03     ;#%00000011
b8F1F   LDY a2F
        CLC
        ADC a24
        STA f81EC,Y
        LDA a25
        ADC #$00     ;#%00000000
        STA f81F4,Y
        DEC a2F
        JMP j8F0B

a8F33   INY
        LDA (p24),Y
        STA a8206
        LDA #$04     ;#%00000100
        BNE b8F1F
a8F3D   STX a8206
        TYA
        JMP j8D91

j8F44   STA f81BF,X
        JMP j8D8F

a8F4A   STA f8263,X
        JMP j8D8F

b8F50   RTS

j8F51   LDX a827F
        BEQ b8F50
        LDA a827D
        AND #$08     ;#%00001000
        BEQ b8F73
        LDA a2C
        CMP a827E
        BCS b8F99
        LDA #$00     ;#%00000000
        STA a827E
        LDA a827D
        AND #$F6     ;#%11110110
        STA a827D
        BNE b8F96
b8F73   LDA a827E
        BNE b8F8C
        DEC a827F
        BNE b8F99
        LDX #$06
b8F7F   STA $D40E,X                     ;Voice 3: Frequency Control - Low-Byte
        DEX
        BPL b8F7F
        LDA #$20     ;#%00100000
        ORA a29
        STA a29
        RTS

b8F8C   DEC a827E
        BNE b8F99
        LDA a827D
        AND #$F6     ;#%11110110
b8F96   STA $D412    ;Voice 3: Control Register
b8F99   LDA a8274
        BEQ b8FFB
        LDA a8273
        BEQ b8FA9
        DEC a8273
        JMP b8FFB

b8FA9   CLC
        LDX a8286
        LDY a8287
        LDA a8288
        BEQ b8FC5
        TXA
        ADC a8275
        TAX
        TYA
        ADC a8276
        TAY
        DEC a8288
        JMP j8FEF

b8FC5   LDA a8289
        BEQ b8FDA
        TXA
        ADC a8277
        TAX
        TYA
        ADC a8278
        TAY
        DEC a8289
        JMP j8FEF

b8FDA   LDA a8274
        AND #$81     ;#%10000001
        BEQ j8FEF
        BPL b8FE9
        JSR s85D2
        JMP b8FA9

b8FE9   JSR s85DE
        JMP b8FA9

j8FEF   STX a8286
        STY a8287
        STX $D410    ;Voice 3: Pulse Waveform Width - Low-Byte
        STY $D411    ;Voice 3: Pulse Waveform Width - High-Nybble
b8FFB   LDA a8270
        BEQ b9026
        AND #$08     ;#%00001000
        BNE b9027
        LDX a8280
        LDY a8281
        TYA
        STX a28
        ORA a28
        BEQ b9026
        CLC
        LDA a826F
        BEQ b9049
        DEC a826F
        BNE b901F
        JSR s86F3
b901F   LDA a8270
        AND #$02     ;#%00000010
        BNE b908D
b9026   RTS

b9027   LDX a826F
        BPL b902F
        LDX a826E
b902F   LDA a826D
        CLC
        ADC f8263,X
        DEX
        STX a826F
        TAY
        LDX FREQ_TBL_LO,Y
        LDA FREQ_TBL_HI,Y
        STX $D40E                       ;Voice 3: Frequency Control - Low-Byte
        STA $D40F                       ;Voice 3: Frequency Control - High-Byte
        RTS

j9048   CLC
b9049   LDA a8282
        BEQ b905D
        DEC a8282
        TXA
        ADC f8263
        TAX
        TYA
        ADC a8264
        JMP j9096

b905D   LDA a8283
        BEQ b9071
        DEC a8283
        TXA
        ADC a8265
        TAX
        TYA
        ADC a8266
        JMP j9096

b9071   LDA a8284
        BEQ b9085
        DEC a8284
        TXA
        ADC a8267
        TAX
        TYA
        ADC a8268
        JMP j9096

b9085   LDA a8285
        BEQ b90A4
        DEC a8285
b908D   TXA
        ADC a8269
        TAX
        TYA
        ADC a826A
j9096   TAY
b9097   STX a8280
        STY a8281
        STX $D40E                       ;Voice 3: Frequency Control - Low-Byte
        STY $D40F                       ;Voice 3: Frequency Control - High-Byte
        RTS

b90A4   LDA a8270
        AND #$81     ;#%10000001
        BEQ b9097
        BPL b90B3
        JSR s86E7
        JMP j9048

b90B3   JSR s86F3
        JMP j9048

f90B9   .BYTE $01,$02,$00
f90BC   .BYTE $17,$3E,$65
f90BF   .BYTE $02,$09,$10
f90C2   .BYTE $00,$45,$8A,$09,$12,$24
f90C8   .BYTE $37,$2F,$1F

FREQ_TBL_HI
        .BYTE $01,$01,$01,$01,$01,$01,$01,$01
        .BYTE $01,$01,$01,$02,$02,$02,$02,$02
        .BYTE $02,$02,$03,$03,$03,$03,$03,$04
        .BYTE $04,$04,$04,$05,$05,$05,$06,$06
        .BYTE $06,$07,$07,$08,$08,$09,$09,$0A
        .BYTE $0A,$0B,$0C,$0C,$0D,$0E,$0F,$10
        .BYTE $11,$12,$13,$14,$15,$16,$18,$19
        .BYTE $1B,$1C,$1E,$20,$22,$24,$26,$28
        .BYTE $2B,$2D,$30,$33,$36,$39,$3D,$40
        .BYTE $44,$48,$4C,$51,$56,$5B,$60,$66
        .BYTE $6C,$73,$7A,$81,$89,$91,$99,$A3
        .BYTE $AC,$B7,$C1,$CD,$D9,$E6,$00

FREQ_TBL_LO
        .BYTE $12,$23,$34,$46,$5A,$6E,$84,$9B
        .BYTE $B3,$CD,$E9,$06,$25,$45,$68,$8C
        .BYTE $B3,$DC,$08,$36,$67,$9B,$D2,$0C
        .BYTE $49,$8B,$D0,$19,$67,$B9,$10,$6C
        .BYTE $CE,$35,$A3,$17,$93,$15,$9F,$3C
        .BYTE $CD,$72,$20,$D8,$9C,$6B,$46,$2F
        .BYTE $25,$2A,$3F,$64,$9A,$E3,$3F,$B1
        .BYTE $38,$D6,$8D,$5E,$4B,$55,$7E,$C8
        .BYTE $34,$C6,$7F,$61,$6F,$AC,$7E,$BC
        .BYTE $95,$A9,$FC,$A1,$69,$8C,$FE,$C2
        .BYTE $DF,$58,$34,$78,$2B,$53,$F7,$1F
        .BYTE $D2,$19,$FC,$85,$BD,$B0,$00

VOICE_1_EFFECTS_TBL
        .WORD a8811,a8877,a8867,j889A,a88AA
        .WORD a88CA,a88C0,j88D1,a8892,a88A1
        .WORD a88D7,b886A,a8829,a8844,a8857

VOICE_2_EFFECTS_TBL
        .WORD a8B4D,a8BB3,a8BA3,j8BD6,a8BE6
        .WORD a8C06,a8BFC,j8C0D,a8BCE,a8BDD
        .WORD a8C13,b8BA6,a8B65,a8B80,a8B93

VOICE_3_EFFECTS_TBL
        .WORD a8E84,a8EEA,a8EDA,j8F0D,a8F1D
        .WORD a8F3D,a8F33,j8F44,a8F05,a8F14
        .WORD a8F4A,b8EDD,a8E9C,a8EB7,a8ECA

f91E3   .WORD $954A,$96F9,$97C3,$A709,$A70C
        .WORD $A70F,$9C45,$9FFB,$9FFB,$990B
        .BYTE $19,$99,$6B,$99,$A0,$99,$A4,$99,$C2,$99
        .BYTE $04,$9A,$16,$9A,$2A,$9A,$93,$9F,$01,$A0
        .BYTE $9D,$A0,$5C,$9B,$A5,$9B,$EE,$9B,$00,$A7
        .BYTE $03,$A7,$06,$A7,$BF,$98,$C3,$98,$D7,$98
        .BYTE $82,$9A,$BB,$9A,$F6,$9A,$EE,$A0,$18,$A1
        .BYTE $3F,$A1

        .TEXT "MUSIC BY MARTIN GALWAY"

f9241   .BYTE $80,$05,$01,$80,$80,$01,$02,$80
        .BYTE $80,$80,$01,$01,$80,$00,$80,$00
        .BYTE $80,$00,$80,$01,$00,$80,$01,$01

_LIST0 = [aA188,aA1A7,aA169,aA261,aA2FC,aA2DD,aA2BE,aA31B]      ;0-7
_LIST1 = [aA280,aA33A,aA359,aA378,aA397,aA3B6,aA3D5,aA3F4]      ;8-15
_LIST2 = [aA413,aA432,a9E2F,a9E2F,a9E2F,aA1C6,aA1E5,aA204]      ;15-23
_LIST_ALL= _LIST0 .. _LIST1 .. _LIST2

        ; Lo Waveform addresses (?)
f9259   .BYTE <_LIST_ALL
        ; Hi Waveform addresses (?)
f9271   .BYTE >_LIST_ALL


f9289   .BYTE $01,$00,$02,$02,$00,$01,$02,$01
a9291   .BYTE $00,$00,$01,$02,$01,$02,$02,$00
a9299   .BYTE $00
a929A   .BYTE $01,$00,$01,$02,$00,$01,$02,$0A
        .BYTE $00,$F6,$FF,$0A,$00,$00,$00,$03
        .BYTE $06,$03,$00,$0F,$05,$FF,$FF,$05
        .BYTE $05,$01,$00,$05,$00,$00,$00,$41
        .BYTE $FE,$DD,$FF,$FF,$08,$10,$18,$20
        .BYTE $28,$30,$38,$40,$48,$50,$58,$60
        .BYTE $68,$70,$78,$80,$08,$00,$F8,$FF
        .BYTE $08,$00,$00,$00,$02,$04,$02,$00
        .BYTE $0A,$05,$14,$14,$00,$05,$64,$00
        .BYTE $9C,$FF,$00,$06,$41,$22,$A4,$78
        .BYTE $0A,$1E,$00,$E2,$FF,$1E,$00,$00
        .BYTE $00,$03,$06,$03,$00,$16,$05,$14
        .BYTE $FF,$03,$05,$46,$00,$14,$00,$FF
        .BYTE $00,$43,$73,$C3,$08,$64,$28,$00
        .BYTE $D8,$FF,$28,$00,$00,$00,$03,$06
        .BYTE $03,$00,$05,$05,$28,$28,$18,$05
        .BYTE $0A,$00,$F6,$FF,$00,$08,$49,$29
        .BYTE $FC,$06,$14,$41,$29,$FD,$FF,$FF
        .BYTE $06,$00,$FA,$FF,$06,$00,$00,$00
        .BYTE $03,$06,$03,$00,$0A,$05,$09,$00
        .BYTE $F7,$FF,$09,$00,$10,$00,$03,$06
        .BYTE $03,$00,$32,$07,$09,$00,$F7,$FF
        .BYTE $09,$00,$F6,$FF,$03,$06,$03,$00
        .BYTE $32,$07,$28,$00,$D8,$FF,$28,$00
        .BYTE $43,$00,$04,$08,$04,$00,$C0,$07
        .BYTE $0C,$07,$04,$00,$0C,$07,$04,$00
        .BYTE $00,$00,$00,$07,$00,$0D,$0C,$07
        .BYTE $03,$00,$0C,$07,$03,$00,$00,$00
        .BYTE $00,$07,$00,$0D,$0C,$06,$02,$00
        .BYTE $0C,$06,$02,$00,$00,$00,$00,$07
        .BYTE $00,$0D,$0C,$09,$05,$00,$0C,$09
        .BYTE $05,$00,$28,$00,$00,$00,$00,$00
        .BYTE $00,$00,$0B,$00,$00,$00,$01,$04
        .BYTE $A3,$FF,$00,$00,$00,$00,$00,$00
        .BYTE $0A,$00,$00,$00,$06,$04,$D8,$FF
        .BYTE $F6,$FF,$D8,$FF,$00,$00,$03,$06
        .BYTE $03,$00,$05,$05,$28,$00,$D8,$FF
        .BYTE $28,$00,$AF,$00,$03,$06,$03,$00
        .BYTE $08,$07,$82,$00,$32,$00,$00,$00
        .BYTE $00,$00,$28,$08,$41,$26,$8A,$05
        .BYTE $64,$41,$CC,$CD,$FF,$C8,$41,$AF
        .BYTE $EA,$B4,$64,$41,$29,$AC,$50,$C8
        .BYTE $41,$09,$CC,$0A,$FF,$C2,$2C,$2C
        .BYTE $A1,$92,$CE,$0C,$15,$7F,$C8,$C2
        .BYTE $17,$09,$16,$93,$D4,$1B,$FF,$BF
        .BYTE $FA,$D4,$1B,$FF,$BF,$FA,$82,$A0
        .BYTE $87,$A0,$86,$A0,$7F,$A0,$82,$A0
        .BYTE $87,$A0,$86,$A0,$84,$A0,$86,$50
        .BYTE $D4,$1B,$FF,$C0,$C4,$EB,$92,$C2
        .BYTE $17,$09,$F9,$92,$5F,$02,$39,$02
        .BYTE $3E,$02,$C4,$94,$93,$CE,$00,$A1
        .BYTE $CE,$1B,$5A,$43,$02,$C4,$EB,$92
        .BYTE $43,$02,$42,$01,$C4,$62,$93,$C2
        .BYTE $17,$0E,$16,$93,$CE,$10,$05,$CE
        .BYTE $19,$36,$C0,$C4,$EB,$92,$AA,$04
        .BYTE $A2,$04,$A5,$04,$9E,$04,$A2,$04
        .BYTE $99,$04,$9E,$04,$96,$04,$99,$04
        .BYTE $92,$04,$96,$04,$99,$04,$CE,$1B
        .BYTE $50,$C4,$B0,$93,$32,$08,$C4,$EB
        .BYTE $92,$21,$01,$22,$01,$23,$01,$25
        .BYTE $02,$25,$01,$5E,$02,$C0,$00,$03
        .BYTE $02,$06,$62,$90,$00,$03,$00,$03
        .BYTE $05,$03,$05,$06,$00,$06,$C0,$00
        .BYTE $02,$0C,$03,$0C,$01,$00,$02,$0C
        .BYTE $01,$00,$02,$0C,$01,$C0,$00,$02
        .BYTE $0C,$03,$0C,$03,$0C,$02,$00,$01
        .BYTE $0C,$01,$C0,$00,$02,$00,$01,$00
        .BYTE $01,$00,$01,$00,$01,$00,$02,$00
        .BYTE $02,$00,$01,$00,$01,$C0,$CC,$AD
        .BYTE $94,$2B,$C8,$AD,$94,$C8,$AD,$94
        .BYTE $CA,$2A,$01,$03,$01,$02,$01,$02
        .BYTE $01,$02,$00,$01,$00,$01,$00,$01
        .BYTE $C0,$CC,$AD,$94,$29,$CC,$AD,$94
        .BYTE $2D,$CC,$AD,$94,$2B,$D0,$AD,$94
        .BYTE $28,$CC,$FB,$94,$13,$CC,$FB,$94
        .BYTE $16,$CC,$10,$95,$1B,$D0,$10,$95
        .BYTE $1A,$00,$01,$00,$01,$00,$01,$0C
        .BYTE $01,$00,$01,$00,$02,$00,$01,$00
        .BYTE $01,$0C,$01,$00,$02,$C0,$00,$03
        .BYTE $00,$02,$00,$02,$00,$02,$00,$01
        .BYTE $00,$01,$00,$01,$C0,$CE,$1A,$EA
        .BYTE $00,$01,$CE,$1A,$8A,$00,$01,$00
        .BYTE $01,$CE,$1A,$EA,$0C,$01,$CE,$1A
        .BYTE $8A,$C6,$03,$95,$CC,$1F,$95,$1A
        .BYTE $C8,$1F,$95,$CA,$18,$CE,$1A,$EA
        .BYTE $00,$03,$CE,$1A,$8A,$C6,$12,$95
a954A   #MUSIC_PATCH $C8,$93EF
        .BYTE $5F,$0A,$BF,$32,$BF
        .BYTE $00,$D4,$1C,$FF,$C4,$54,$93,$BF
        .BYTE $00,$BF,$80,$DC,$DB,$93,$60,$00
        .BYTE $BF,$30,$CE,$0C,$05,$CE,$0D,$05
        .BYTE $CE,$10,$05,$CE,$1B,$32,$41,$02
        .BYTE $3E,$02,$3C,$04,$C4,$94,$93,$39
        .BYTE $02,$C4,$08,$93,$37,$0E,$32,$01
        .BYTE $D8,$03,$C4,$A2,$93,$35,$02,$C4
        .BYTE $08,$93,$32,$01,$DA,$2B,$0C,$5F
        .BYTE $0C,$5F,$0C,$C4,$94,$93,$CE,$00
        .BYTE $2B,$CE,$01,$FF,$CE,$08,$60,$CE
        .BYTE $18,$43,$CE,$1B,$64,$50,$0C,$C4
        .BYTE $08,$93,$8B,$00,$BF,$80,$8B,$00
        .BYTE $BF,$80,$8B,$00,$BF,$50,$D6,$CC
        .BYTE $93,$CE,$18,$41,$CE,$19,$AA,$00
        .BYTE $06,$D6,$08,$93,$DC,$D6,$93,$CE
        .BYTE $18,$49,$CE,$1B,$02,$D2,$BF,$97
        .BYTE $35,$08,$32,$01,$35,$02,$37,$01
        .BYTE $39,$08,$C4,$BE,$93,$39,$02,$C4
        .BYTE $08,$93,$3B,$01,$39,$01,$37,$07
        .BYTE $35,$01,$34,$01,$30,$01,$2B,$01
        .BYTE $29,$01,$28,$06,$28,$01,$29,$01
        .BYTE $2B,$01,$34,$01,$35,$01,$37,$01
        .BYTE $35,$01,$37,$01,$35,$01,$34,$01
        .BYTE $35,$01,$34,$01,$32,$01,$2D,$01
        .BYTE $30,$01,$32,$01,$34,$01,$35,$01
        .BYTE $39,$01,$35,$01,$39,$01,$3E,$01
        .BYTE $39,$01,$3E,$01,$41,$01,$40,$01
        .BYTE $3E,$01,$39,$01,$37,$01,$35,$01
        .BYTE $C4,$BE,$93,$CE,$06,$5A,$35,$02
        .BYTE $35,$02,$35,$02,$CE,$06,$3E,$CE
        .BYTE $1A,$AA,$3B,$02,$3B,$02,$3B,$02
        .BYTE $CE,$06,$97,$CE,$1A,$CA,$3E,$02
        .BYTE $3E,$02,$3E,$02,$CE,$06,$B3,$CE
        .BYTE $1A,$EA,$41,$02,$CE,$0D,$05,$41
        .BYTE $02,$40,$02,$DC,$E0,$93,$C4,$70
        .BYTE $93,$92,$C0,$D6,$62,$93,$90,$C0
        .BYTE $D6,$70,$93,$86,$C0,$D6,$62,$93
        .BYTE $87,$C0,$C4,$08,$93,$DC,$E5,$93
        .BYTE $D2,$BF,$97,$CC,$80,$94,$37,$CA
        .BYTE $00,$37,$03,$39,$06,$39,$0F,$35
        .BYTE $03,$37,$04,$D4,$0C,$FF,$D4,$0D
        .BYTE $07,$D4,$06,$D4,$D4,$07,$FF,$5F
        .BYTE $02,$34,$0F,$CC,$80,$94,$43,$CA
        .BYTE $00,$43,$03,$45,$06,$45,$0F,$45
        .BYTE $03,$46,$06,$A6,$90,$45,$06,$43
        .BYTE $03,$45,$06,$48,$06,$DC,$20,$93
        .BYTE $4B,$09,$4B,$03,$4A,$05,$48,$04
        .BYTE $46,$03,$46,$09,$DC,$25,$93,$48
        .BYTE $0A,$D4,$06,$9B,$D4,$07,$FE,$D4
        .BYTE $0C,$28,$D4,$0D,$07,$D4,$1D,$95
        .BYTE $D4,$1E,$44,$BF,$A8,$D4,$02,$D0
        .BYTE $D4,$03,$FF,$BF,$00,$D4,$1C,$FF
        .BYTE $BF,$00,$BF,$F6
        #MUSIC_PATCH $C6,$954A
        .BYTE $BF
        .BYTE $10,$C8,$EF,$93,$5F,$08,$C4,$38
        .BYTE $93,$CE,$1B,$64,$86,$32,$D4,$1D
        .BYTE $D8,$D4,$1E,$0C,$BF,$00,$D4,$1C
        .BYTE $FF,$DC,$D6,$93,$C4,$2A,$93,$CE
        .BYTE $10,$05,$D8,$05,$CC,$91,$94,$2B
        .BYTE $C8,$A0,$94,$DA,$D8,$04,$C8,$C0
        .BYTE $94,$DA,$CE,$12,$3B,$D8,$02,$D8
        .BYTE $03,$C8,$DB,$94,$DA,$CC,$AD,$94
        .BYTE $29,$CC,$AD,$94,$2D,$CC,$AD,$94
        .BYTE $2E,$CC,$AD,$94,$2B,$DA,$CA,$00
        .BYTE $29,$01,$26,$01,$29,$01,$2D,$01
        .BYTE $29,$01,$2D,$01,$32,$01,$2D,$01
        .BYTE $32,$01,$35,$01,$32,$01,$35,$01
        .BYTE $39,$01,$35,$01,$39,$01,$CE,$1A
        .BYTE $C8,$CE,$1B,$1E,$3C,$01,$39,$01
        .BYTE $3C,$01,$41,$01,$3C,$01,$41,$01
        .BYTE $43,$01,$45,$01,$46,$01,$C2,$1C
        .BYTE $1C,$08,$93,$CE,$10,$05,$48,$09
        .BYTE $48,$03,$46,$05,$46,$04,$41,$03
        .BYTE $3F,$09,$DC,$25,$93,$3F,$0A,$D4
        .BYTE $06,$38,$D4,$07,$FF,$D4,$0C,$28
        .BYTE $D4,$0D,$07,$D4,$1D,$C8,$D4,$1E
        .BYTE $28,$BF,$A8,$D4,$02,$D4,$D4,$03
        .BYTE $FF,$BF,$00,$D4,$1C,$FF,$BF,$00
        .BYTE $BF,$F6,$C6,$F9,$96,$EE,$FF,$CF
        .BYTE $60,$BF,$20,$C8,$EF,$93,$5F,$06
        .BYTE $C4,$46,$93,$CE,$1B,$64,$86,$32
        .BYTE $D4,$1D,$AE,$D4,$1E,$07,$BF,$00
        .BYTE $D4,$1C,$FF,$DC,$D6,$93,$C4,$2A
        .BYTE $93,$CE,$10,$05,$BF,$B0,$0E,$01
        .BYTE $11,$01,$D8,$02,$13,$03,$1F,$02
        .BYTE $13,$03,$13,$01,$1F,$02,$13,$01
        .BYTE $16,$03,$22,$02,$16,$03,$16,$01
        .BYTE $22,$02,$16,$01,$1B,$03,$27,$02
        .BYTE $1B,$03,$1B,$01,$27,$02,$1B,$01
        .BYTE $18,$02,$24,$01,$19,$02,$25,$01
        .BYTE $1A,$02,$26,$01,$16,$03,$DA,$C8
        .BYTE $EB,$94,$C8,$EB,$94,$C8,$EB,$94
        .BYTE $C8,$EB,$94,$CE,$12,$3B,$D8,$02
        .BYTE $D8,$03,$C8,$36,$95,$C8,$3F,$95
        .BYTE $DA,$CC,$FB,$94,$1A,$C8,$FB,$94
        .BYTE $CC,$3F,$95,$1B,$C8,$3F,$95,$DA
        .BYTE $CA,$00,$1A,$01,$1A,$01,$1A,$01
        .BYTE $26,$01,$1A,$01,$1A,$02,$1A,$01
        .BYTE $1A,$01,$28,$01,$1C,$02,$1D,$01
        .BYTE $1D,$01,$1D,$01,$29,$01,$1D,$01
        .BYTE $1D,$02,$1D,$01,$1D,$01,$29,$01
        .BYTE $1D,$02,$CC,$3F,$95,$24,$CC,$3F
        .BYTE $95,$22,$CC,$3F,$95,$20,$CC,$3F
        .BYTE $95,$14,$DC,$EA,$93,$CA,$00,$73
        .BYTE $14,$7F,$14,$7A,$14,$73,$14,$7B
        .BYTE $96,$CE,$1A,$8C,$73,$14,$7F,$14
        .BYTE $7A,$14,$73,$14,$7B,$C8,$CE,$1A
        .BYTE $4C,$73,$1E,$7F,$1E,$7A,$1E,$73
        .BYTE $1E,$7B,$00,$C6,$C3,$97,$FF,$00
        .BYTE $01,$04,$32,$00,$00,$00,$00,$08
        .BYTE $41,$27,$C9,$07,$32,$BF,$02,$CA
        .BYTE $F4,$BF,$01,$C4,$A1,$92,$C2,$1C
        .BYTE $0E,$B0,$98,$97,$08,$99,$10,$CE
        .BYTE $1B,$19,$99,$1E,$C0,$BF,$02,$C4
        .BYTE $CE,$92,$C2,$1C,$0E,$B0,$98,$CE
        .BYTE $17,$08,$94,$08,$95,$10,$CE,$1B
        .BYTE $19,$95,$1E,$C0,$BE,$00,$42,$FF
        .BYTE $BE,$00,$00,$00,$02,$04,$02,$00
        .BYTE $03,$04,$08,$FF,$00,$05,$90,$00
        .BYTE $06,$00,$80,$03,$49,$08,$98,$03
        .BYTE $19,$BF,$03,$CA,$0C,$C2,$1C,$1C
        .BYTE $EE,$98,$BF,$01,$C6,$1E,$99,$C2
        .BYTE $1C,$1C,$EE,$98,$BF,$01,$A3,$08
        .BYTE $A1,$08,$A1,$08,$9E,$08,$9A,$08
        .BYTE $9C,$08,$C4,$A1,$92,$97,$40,$C4
        .BYTE $EE,$98,$95,$0C,$9A,$0C,$95,$0C
        .BYTE $C4,$A1,$92,$97,$48,$C4,$EE,$98
        .BYTE $A3,$08,$A1,$08,$9C,$08,$9E,$08
        .BYTE $9A,$08,$9C,$08,$C4,$A1,$92,$97
        .BYTE $40,$C4,$EE,$98,$95,$0C,$9A,$0C
        .BYTE $9C,$0C,$C4,$A1,$92,$97,$40,$9A
        .BYTE $18,$95,$18,$C4,$EE,$98,$97,$08
        .BYTE $C0,$C2,$17,$17,$CE,$92,$BF,$01
        .BYTE $DC,$9B,$99,$CE,$19,$AA,$7F,$40
        .BYTE $7D,$10,$82,$08,$7D,$08,$7F,$5C
        .BYTE $7B,$10,$7D,$10,$7F,$40,$82,$10
        .BYTE $7D,$10,$7F,$44,$7B,$10,$7D,$10
        .BYTE $7F,$24,$7D,$10,$79,$10,$78,$08
        .BYTE $C0,$49,$82,$D9,$06,$1E,$CA,$F4
        .BYTE $BF,$01,$C2,$17,$17,$CE,$92,$DC
        .BYTE $9B,$99,$CE,$1A,$A9,$BF,$01,$95
        .BYTE $30,$93,$10,$95,$40,$93,$10,$91
        .BYTE $10,$90,$10,$8C,$10,$8E,$40,$C0
        .BYTE $C2,$17,$17,$CE,$92,$DC,$9B,$99
        .BYTE $82,$20,$84,$20,$85,$20,$82,$20
        .BYTE $84,$10,$82,$10,$80,$10,$7D,$10
        .BYTE $76,$40,$C0,$0A,$00,$F6,$FF,$0A
        .BYTE $00,$00,$00,$03,$06,$03,$00,$1E
        .BYTE $05,$46,$46,$01,$05,$FB,$FF,$05
        .BYTE $00,$00,$07,$41,$DF,$FE,$FF,$FF
        .BYTE $04,$08,$04,$00,$14,$41,$28,$AB
        .BYTE $0F,$64,$BF,$03,$C2,$1C,$1C,$DD
        .BYTE $99,$CE,$10,$28,$8E,$FE,$BF,$FE
        .BYTE $D4,$1C,$FF,$C0,$BF,$06,$C2,$1C
        .BYTE $1C,$DD,$99,$C2,$0C,$04,$FA,$99
        .BYTE $92,$FE,$BF,$FE,$D4,$1C,$FF,$C0
        .BYTE $C2,$17,$17,$CE,$92,$DC,$FF,$99
        .BYTE $BF,$32,$D8,$02,$73,$14,$7F,$14
        .BYTE $7A,$14,$73,$14,$7B,$96,$DA,$BF
        .BYTE $32,$73,$1E,$7F,$1E,$7A,$1E,$73
        .BYTE $1E,$7B,$01,$C0,$14,$00,$EC,$FF
        .BYTE $14,$00,$D1,$FF,$03,$06,$03,$00
        .BYTE $9C,$05,$28,$FF,$01,$05,$20,$00
        .BYTE $FA,$FF,$C0,$00,$41,$8A,$F4,$DC
        .BYTE $0A,$49,$33,$F4,$03,$0A,$60,$10
        .BYTE $60,$08,$60,$08,$60,$10,$60,$10
        .BYTE $60,$10,$D8,$06,$60,$08,$DA,$C0
        .BYTE $C2,$1C,$1C,$4E,$9A,$BF,$01,$97
        .BYTE $32,$D4,$0D,$07,$BF,$6A,$D4,$1D
        .BYTE $AE,$D4,$1E,$07,$BF,$64,$DC,$8E
        .BYTE $9F,$CE,$0C,$05,$D8,$04,$D8,$04
        .BYTE $87,$04,$DA,$87,$08,$87,$08,$87
        .BYTE $10,$87,$08,$87,$08,$87,$08,$87
        .BYTE $10,$87,$10,$87,$08,$87,$10,$DA
        .BYTE $C0,$C2,$17,$17,$CE,$92,$DC,$6B
        .BYTE $9A,$BF,$01,$97,$18,$9A,$48,$99
        .BYTE $0C,$9A,$0C,$99,$08,$97,$18,$CE
        .BYTE $18,$41,$CE,$1B,$70,$9E,$60,$D4
        .BYTE $06,$7A,$D4,$07,$FF,$D4,$0C,$08
        .BYTE $D4,$0D,$07,$DC,$8E,$9F,$BF,$08
        .BYTE $D8,$02,$CC,$70,$9A,$3C,$CC,$70
        .BYTE $9A,$30,$DA,$C0,$C2,$17,$17,$CE
        .BYTE $92,$DC,$6B,$9A,$BF,$01,$7F,$10
        .BYTE $8B,$08,$7F,$18,$8B,$08,$7D,$08
        .BYTE $7B,$10,$87,$08,$7B,$18,$87,$08
        .BYTE $7D,$08,$7F,$10,$8B,$08,$82,$18
        .BYTE $8E,$10,$82,$10,$8E,$08,$82,$10
        .BYTE $DC,$8E,$9F,$7F,$08,$82,$08,$7F
        .BYTE $08,$D8,$04,$84,$40,$84,$20,$D8
        .BYTE $04,$7F,$08,$DA,$DA,$84,$10,$C0
        .BYTE $0C,$00,$F4,$FF,$0C,$00,$00,$00
        .BYTE $02,$04,$02,$00,$0D,$05,$1E,$1E
        .BYTE $01,$05,$0C,$00,$F4,$FF,$80,$07
        .BYTE $41,$FF,$FA,$64,$32,$21,$44,$89
        .BYTE $14,$32,$C4,$2A,$93,$DC,$57,$9B
        .BYTE $BF,$01,$84,$0A,$CE,$18,$29,$CE
        .BYTE $1B,$03,$86,$0A,$BF,$0A,$86,$3C
        .BYTE $CE,$18,$21,$CE,$1B,$14,$84,$0A
        .BYTE $84,$0A,$89,$0A,$88,$14,$84,$14
        .BYTE $84,$0A,$CE,$18,$29,$CE,$1B,$03
        .BYTE $86,$0A,$BF,$0A,$86,$46,$CE,$18
        .BYTE $21,$CE,$1B,$14,$86,$14,$CE,$18
        .BYTE $29,$CE,$1B,$03,$87,$14,$BF,$14
        .BYTE $87,$5A,$C0,$C4,$2A,$93,$DC,$57
        .BYTE $9B,$BF,$01,$8B,$0A,$CE,$18,$29
        .BYTE $CE,$1B,$03,$8D,$0A,$BF,$0A,$8D
        .BYTE $3C,$CE,$18,$21,$CE,$1B,$14,$8B
        .BYTE $0A,$8B,$0A,$90,$0A,$90,$14,$8B
        .BYTE $14,$8B,$0A,$CE,$18,$29,$CE,$1B
        .BYTE $03,$8D,$0A,$BF,$0A,$8D,$46,$CE
        .BYTE $18,$21,$CE,$1B,$14,$8D,$14,$CE
        .BYTE $18,$29,$CE,$1B,$03,$8E,$14,$BF
        .BYTE $14,$8E,$5A,$C0,$C2,$1C,$1C,$3A
        .BYTE $9B,$BF,$01,$86,$50,$84,$50,$86
        .BYTE $64,$87,$FF,$C0

a9BFE
        LDX #<a9DD2
        LDY #>a9DD2
        LDA #$00                        ;Voice 0
        JSR s861F

        LDX #<a9E10
        LDY #>a9E10
        LDA #$02                        ;Voice 2
        JSR s861F

        LDX #<a9DF1
        LDY #>a9DF1
b9C14   LDA #$01                        ;Voice 1
        JMP s861F

a9C19
        LDX #<a9DB3
        LDY #>a9DB3
        LDA #$02                        ;Voice 2
        JSR s861F

        LDX #<a9D75
        LDY #>a9D75
        LDA #$00                        ;Voice 0
        JSR s861F

        LDX #<a9D94
        LDY #>a9D94
        BNE b9C14

a9C31   LDA #$10
        .BYTE $2C
a9C34   LDA #$0B
        .BYTE $2C
a9C37   LDA #$09
        STA a9E4D
        LDY #$14
        JMP b83D6

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
a9C41
        .BYTE $06,$0C,$12,$18
a9C45   .BYTE $C2,$20,$03
a9C48   .WORD a9C41                                     ;Address?

a9C4A   #MUSIC_PATCH $C8,a9E4E

a9C4D   #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$04

        #MUSIC_PATCH $C8,a9E67
        #MUSIC_PATCH $C8,$9F25
        #MUSIC_PATCH $C8,$9E86
        #MUSIC_PATCH $C8,$9EB4
        #MUSIC_PATCH $C8,$9E4E
        #MUSIC_PATCH $C8,$9E86
        #MUSIC_PATCH $C8,$9F25
        #MUSIC_PATCH $C8,$9EB4
        #MUSIC_PATCH $C8,$9E4E
        #MUSIC_PATCH $C8,$9E86
        #MUSIC_PATCH $C8,$9ECE
        #MUSIC_PATCH $C8,$9F25
        #MUSIC_PATCH $C8,$9EFC
        #MUSIC_PATCH $C8,$9EB4
        #MUSIC_PATCH $C8,$9EFC
        #MUSIC_PATCH $C8,$9ECE
        #MUSIC_PATCH $C8,$9F25
        #MUSIC_PATCH $C8,$9EB4

        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$04

        #MUSIC_PATCH $C8,$9F25
        #MUSIC_PATCH $C8,$9EFC
        #MUSIC_PATCH $C8,$9EFC

        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$02

        #MUSIC_PATCH $C6,a9C4A

a9D75   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $81,$00,$C8,$03,$08,$10,$27
a9D94
        .BYTE $00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$11,$03,$D4,$03,$08
        .BYTE $88,$13
a9DB3
        .BYTE $00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$11,$03,$D3,$03,$08,$E8
        .BYTE $03

a9DD2
        .BYTE $00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$11,$11,$54,$02,$05,$D0,$07

a9DF1
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $11,$11,$44,$03,$03,$DC,$05

a9E10
        .BYTE $00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$11
        .BYTE $11,$84,$03,$03,$60,$09

a9E2F   .BYTE $DA,$FD
        .BYTE $F4,$01,$00,$00,$00,$00,$01,$01
        .BYTE $00,$00,$02,$05,$FF,$00,$01,$04
        .BYTE $32,$00,$00,$00,$00,$08,$41,$00
        .BYTE $38,$03,$32,$B8

a9E4D   .BYTE $0B

a9E4E   #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$04
a9E67   #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$03
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        .BYTE $C0

        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C31,$5F,$01
        #MUSIC_NOTE $D2,a9C31,$5F,$01
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        .BYTE $C0

        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$03
        #MUSIC_NOTE $D2,a9BFE,$5F,$03
        #MUSIC_NOTE $D2,a9C19,$5F,$04
        .BYTE $C0

        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$03
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$01
        #MUSIC_NOTE $D2,a9C19,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        .BYTE $C0

        #MUSIC_NOTE $D2,a9BFE,$5F,$04
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$02
        #MUSIC_NOTE $D2,a9C34,$5F,$01
        #MUSIC_NOTE $D2,a9C34,$5F,$01
        .BYTE $C0

        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C19,$5F,$01
        #MUSIC_NOTE $D2,a9BFE,$5F,$03
        #MUSIC_NOTE $D2,a9BFE,$5F,$02
        #MUSIC_NOTE $D2,a9C31,$5F,$02
        #MUSIC_NOTE $D2,a9C34,$5F,$01
        #MUSIC_NOTE $D2,a9C34,$5F,$01
        #MUSIC_NOTE $D2,a9C37,$5F,$01
        #MUSIC_NOTE $D2,a9C37,$5F,$01
        .BYTE $C0

        .BYTE $06,$0C,$12,$18,$1E
        .BYTE $24,$2A,$30,$36,$3C,$42,$48,$4E
        .BYTE $54,$5A,$60,$0C,$0A,$07,$04,$00
        .BYTE $0C,$0A,$07,$04,$00,$00,$09,$00
        .BYTE $0D,$00,$00,$00,$01,$01,$01,$00
        .BYTE $00,$00,$00,$00,$05,$00,$0D,$0A
        .BYTE $FF,$00,$05,$C8,$00,$EC,$FF,$00
        .BYTE $04,$41,$00,$C9,$05,$32,$C2,$1C
        .BYTE $1C,$CE,$92,$C2,$2C,$0F,$58,$9F
        .BYTE $CE,$18,$49,$CE,$1B,$02,$32,$01
        .BYTE $34,$02,$36,$01,$37,$03,$36,$03
        .BYTE $39,$03,$37,$03,$3B,$01,$3C,$01
        .BYTE $3D,$01,$3E,$05,$32,$01,$34,$02
        .BYTE $36,$01,$39,$03,$37,$03,$3C,$03
        .BYTE $3B,$03,$40,$0C,$43,$04,$42,$01
        .BYTE $40,$01,$3E,$01,$5F,$01,$D2,$C2
        .BYTE $83,$5F,$04,$D2,$FC,$9F,$43,$04
        .BYTE $42,$01,$40,$01,$3E,$01,$5F,$01
        .BYTE $32,$01,$31,$02,$32,$01,$2F,$06
        .BYTE $2D,$06,$2B,$07,$5F,$01,$D2,$C5
        .BYTE $83,$5F,$01,$D2,$C5,$83,$C0,$A9
        .BYTE $3F,$85,$29,$60,$DC,$E9,$A0,$C4
        .BYTE $62,$93,$BF,$24,$8B,$12,$8B,$12
        .BYTE $8B,$12,$8B,$05,$C2,$1C,$1C,$CE
        .BYTE $92,$BF,$01,$97,$06,$99,$06,$9A
        .BYTE $06,$9B,$0B,$DC,$E9,$A0,$C4,$62
        .BYTE $93,$CE,$11,$00,$CE,$17,$08,$BF
        .BYTE $01,$8B,$12,$8B,$12,$8B,$12,$8B
        .BYTE $12,$8B,$12,$C4,$68,$9F,$8B,$12
        .BYTE $8B,$12,$C4,$62,$93,$90,$12,$90
        .BYTE $12,$90,$12,$90,$06,$CE,$1B,$64
        .BYTE $C4,$7E,$93,$91,$24,$D6,$8C,$93
        .BYTE $CE,$1B,$06,$92,$24,$CE,$1B,$64
        .BYTE $D6,$7E,$93,$91,$24,$D6,$8C,$93
        .BYTE $CE,$1B,$06,$92,$0C,$CE,$0D,$00
        .BYTE $CE,$17,$05,$CE,$1A,$A6,$CE,$1B
        .BYTE $08,$AE,$06,$AF,$0C,$B1,$06,$B3
        .BYTE $0C,$B6,$03,$B8,$03,$B6,$06,$B5
        .BYTE $06,$B6,$06,$B1,$0C,$B6,$03,$B8
        .BYTE $03,$B6,$06,$AA,$06,$B4,$06,$C4
        .BYTE $76,$9F,$CE,$1B,$2A,$B3,$01,$C0
        .BYTE $C2,$17,$09,$84,$9F,$DC,$8E,$9F
        .BYTE $BF,$18,$D8,$03,$7F,$12,$7E,$12
        .BYTE $7C,$12,$7A,$12,$DA,$84,$12,$83
        .BYTE $12,$81,$12,$7F,$12,$79,$24,$7F
        .BYTE $24,$79,$24,$7F,$24,$7F,$12,$7A
        .BYTE $12,$7E,$0C,$7F,$06,$81,$0C,$7E
        .BYTE $06,$7F,$0C,$7A,$06,$7C,$06,$7A
        .BYTE $06,$77,$06,$73,$06,$C0,$FD,$FF
        .BYTE $00,$00,$00,$00,$00,$00,$FF,$00
        .BYTE $00,$00,$0C,$04,$41,$36,$7A,$06
        .BYTE $64,$C2,$1C,$1C,$CE,$92,$CE,$18
        .BYTE $49,$CE,$1B,$02,$99,$08,$9B,$0C
        .BYTE $97,$04,$9B,$08,$9E,$28,$99,$08
        .BYTE $9B,$0C,$97,$04,$9B,$08,$A0,$18
        .BYTE $99,$18,$9E,$0C,$99,$04,$9E,$08
        .BYTE $A2,$10,$C0,$DC,$E9,$A0,$BF,$08
        .BYTE $C4,$62,$93,$8B,$10,$8B,$08,$8B
        .BYTE $10,$8B,$08,$86,$10,$86,$08,$8B
        .BYTE $10,$8B,$08,$8B,$10,$8B,$08,$8D
        .BYTE $10,$8D,$08,$86,$10,$86,$08,$86
        .BYTE $10,$C0,$DC,$E9,$A0,$C4,$DB,$A0
        .BYTE $CE,$16,$00,$BF,$08,$7F,$10,$7F
        .BYTE $08,$7F,$10,$7F,$08,$7A,$10,$7A
        .BYTE $08,$7F,$10,$7F,$08,$7F,$10,$7F
        .BYTE $08,$81,$10,$81,$08,$7A,$10,$7A
        .BYTE $08,$7A,$10,$C0

aA169   .BYTE $8C,$FF,$00,$00,$00,$00,$00,$00
        .BYTE $FF,$00,$00,$00,$00,$04,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $81,$00,$C8,$14,$0F,$00,$10

aA188   .BYTE $F8,$FF,$00,$00,$00,$00,$00,$00
        .BYTE $FF,$00,$00,$00,$00,$04,$FF,$00
        .BYTE $00,$04,$14,$00,$00,$00,$00,$08
        .BYTE $43,$00,$C6,$14,$0C,$00,$03

aA1A7   .BYTE $D8,$FF,$00,$00,$00,$00
        .BYTE $00,$00,$FF,$00,$00,$00,$00,$04
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$01,$11,$D9,$0A,$11,$00
        .BYTE $10

aA1C6   .BYTE $00,$04,$07,$0C,$00,$04,$07
        .BYTE $0C,$00,$00,$43,$07,$00,$0D,$FF
        .BYTE $00,$01,$04,$32,$00,$00,$00,$00
        .BYTE $08,$43,$00,$C8,$14,$0A,$61,$33

aA1E5   .BYTE $00,$04,$07,$0C,$00,$04,$07,$0C
        .BYTE $00,$04,$37,$09,$00,$0D,$FF,$00
        .BYTE $00,$04,$14,$00,$00,$00,$00,$08
        .BYTE $41,$00,$C6,$14,$0C,$B1,$19

aA204   .BYTE $00
        .BYTE $04,$07,$00,$04,$07,$00,$04,$07
        .BYTE $00,$37,$09,$00,$0D,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$01
        .BYTE $11,$D9,$0A,$11,$B1,$19

aA223   .BYTE $48,$F4
        .BYTE $CB,$FA,$00,$00,$10,$27,$02,$03
        .BYTE $03,$01,$00,$05,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$81,$AA
        .BYTE $FB,$33,$64,$11,$27

aA242   .BYTE $18,$FC,$00
        .BYTE $00,$88,$13,$00,$00,$05,$02,$01
        .BYTE $00,$00,$05,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$81,$AA,$AB
        .BYTE $33,$64,$11,$27

aA261   .BYTE $D4,$FE,$E0,$FC
        .BYTE $00,$00,$00,$00,$03,$02,$00,$00
        .BYTE $00,$85,$FF,$00,$00,$04,$1E,$00
        .BYTE $00,$00,$00,$08,$41,$23,$73,$0F
        .BYTE $04,$AD,$0D

aA280   .BYTE $70,$FE,$D4,$FE,$38
        .BYTE $FF,$9C,$FF,$18,$18,$18,$18,$00
        .BYTE $04,$FF,$00,$00,$05,$19,$00,$00
        .BYTE $00,$00,$08,$41,$AA,$8B,$0F,$50
        .BYTE $50,$C3

        ;$A29F Unused ?
        .BYTE $CE,$FF,$00,$00,$00,$00
        .BYTE $00,$00,$FF,$00,$00,$00,$00,$04
        .BYTE $FF,$00,$00,$04,$1E,$00,$00,$00
        .BYTE $00,$08,$41,$A3,$A8,$0E,$0E,$B4
        .BYTE $46

aA2BE   .BYTE $CE,$FF,$00,$00,$00,$00,$00
        .BYTE $00,$0A,$00,$00,$00,$00,$85,$FF
        .BYTE $00,$00,$04,$1E,$00,$00,$00,$00
        .BYTE $08,$41,$13,$A8,$0F,$0F,$E8,$03

aA2DD   .BYTE $CE,$FF,$00,$00,$00,$00,$00,$00
        .BYTE $0A,$00,$00,$00,$00,$85,$FF,$00
        .BYTE $00,$04,$1E,$00,$00,$00,$00,$08
        .BYTE $41,$13,$A8,$0F,$0F,$4C,$04

aA2FC   .BYTE $9C
        .BYTE $FF,$00,$00,$00,$00,$00,$00,$FF
        .BYTE $00,$00,$00,$00,$04,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$15
        .BYTE $13,$F8,$0F,$0F,$70,$17

aA31B   .BYTE $70,$FE
        .BYTE $78,$00,$00,$00,$00,$00,$04,$04
        .BYTE $00,$00,$00,$05,$FF,$00,$00,$04
        .BYTE $32,$00,$00,$00,$00,$00,$41,$83
        .BYTE $80,$14,$02,$A0,$0F

aA33A   .BYTE $E7,$FF,$00
        .BYTE $00,$00,$00,$00,$00,$FF,$00,$00
        .BYTE $00,$00,$04,$08,$FF,$00,$04,$00
        .BYTE $01,$64,$00,$01,$00,$41,$11,$89
        .BYTE $0A,$14,$C4,$09

aA359   .BYTE $CE,$FF,$00,$00
        .BYTE $00,$00,$00,$00,$FF,$00,$00,$00
        .BYTE $00,$04,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$15,$33,$F9,$08
        .BYTE $14,$D0,$07

aA378   .BYTE $92,$FF,$00,$00,$00
        .BYTE $00,$00,$00,$FF,$00,$00,$00,$00
        .BYTE $04,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$43,$33,$A9,$07,$14
        .BYTE $B8,$0B

aA397   .BYTE $8C,$00,$00,$00,$00,$00
        .BYTE $00,$00,$FF,$00,$00,$00,$00,$04
        .BYTE $FF,$00,$00,$04,$0A,$00,$00,$00
        .BYTE $00,$08,$41,$22,$88,$03,$09,$40
        .BYTE $1F

aA3B6   .BYTE $58,$FD,$6A,$FF,$00,$00,$00
        .BYTE $00,$02,$FF,$00,$00,$00,$04,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $08,$15,$11,$F7,$04,$08,$58,$1B

aA3D5   .BYTE $74,$FF,$32,$00,$C8,$00,$00,$00
        .BYTE $0A,$1E,$FF,$00,$00,$04,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $81,$AA,$CA,$1E,$64,$70,$17

aA3F4   .BYTE $6A
        .BYTE $FF,$34,$00,$C9,$00,$00,$00,$0B
        .BYTE $1D,$FF,$00,$00,$04,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$15
        .BYTE $8A,$FA,$32,$50,$A2,$17

aA413   .BYTE $18,$FC
        .BYTE $00,$00,$00,$00,$00,$00,$FF,$00
        .BYTE $00,$00,$00,$04,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$81,$00
        .BYTE $F7,$03,$07,$10,$27

aA432   .BYTE $00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$15,$00,$C7
        .BYTE $03,$07,$DA,$61

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
        ; Main for debug code for music ???
bA451
        JSR sA4F8

        LDA #$01
        JSR MUSIC_FN

        LDX #$0F                        ;Set volume
        LDA #25                         ; to 15 (max)
        JSR MUSIC_FN

        LDX #$07
        LDA #26
        JSR MUSIC_FN

        JSR sA4DE
        JSR sA4DE

_LOOP   SEI
        LDA #$64
_L00    CMP $D012                       ;Wait for raster at position $64
        BNE _L00

        JSR sA548
        JSR $EA87                       ;Scan keyboard
        JSR $F13E                       ;Get a byte
        CMP #$0D
        BNE _L01

        JSR sA5FC                       ;Key is $0D
        JMP _LOOP

_L01    CMP #$32
        BNE _L02

        LDA #$1A                        ;Key is $32
        STA aA4C8
        JMP _LOOP

_L02    CMP #$31
        BNE _L03

        LDA #$00                        ;Key is $31
        STA aA4C8
        JMP _LOOP

_L03    CMP #$5E
        BNE _L04

        JSR sA4DE                       ;Key is $5e
        JMP _LOOP

_L04    CMP #$20
        BEQ bA451                       ;Key is $20

        CMP #$5B
        BCS _LOOP

        CMP #$41                        ;Is it < $41
        BCC _LOOP                       ; Yes, loop when it is < than $41
        SBC #$41
        CLC
        ADC aA4C8
        DEC $D020                       ;Border Color
        JSR MUSIC_FN
        INC $D020                       ;Border Color
        JMP _LOOP

aA4C8   .BYTE $00
        .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Part of the Debug Music code
; Clears the screen
SFX_DBG_CLEAR_SCR
        LDX #$00
        LDA #$20                        ;space
_L00    STA $0400,X
        STA $0500,X
        STA $0600,X
        STA $0700,X
        DEX
        BNE _L00
        RTS

sA4DE   JSR sA4E1
sA4E1   JSR sA4E4
sA4E4   JSR sA4E7
sA4E7   JSR sA4EA
sA4EA   JSR sA4ED
sA4ED   JSR sA4F0
sA4F0   JSR sA4F3

sA4F3   LDA #$00
        JMP MUSIC_FN

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $A4F8
; Part of the Debug Music code
sA4F8
        JSR SFX_DBG_CLEAR_SCR
        LDX #$15
        LDA #$DA
_L00    STA f20,X
        DEX
        BPL _L00

        LDX #$44
_L01    LDA #$0C
        STA $D800+40*2,X
        LDA #$0F
        STA $D800+40*5,X
        LDA #$01
        STA $D800+40*8,X
        LDA #$20
        STA f8135,X
        STA f817A,X
        STA f81BF,X
        DEX
        BPL _L01

        LDX #38
_L02    LDA #$0C                        ;Color Grey 2
        STA $D800+40*11,X
        LDA #$0F                        ;Color Grey 3 (light)
        STA $D800+40*13,X
        LDA #$20
        STA f8215,X
        STA f823C,X
        STA f8263,X
        LDA #$01                        ;Color White
        STA $D800+40*15,X
        DEX
        BPL _L02

        LDA #$FF
        STA a028A

        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $A548
; Part of the Debug Music code
sA548   LDA #$05                        ;Color Green
        STA $D020                       ;Border Color
        JSR s8597
        JSR s8565
        JSR s8511
        JSR s8611
        LDA #$0B                        ;Color Grey 1 (dark)
        STA $D020                       ;Border Color
        JSR s870C
        LDA #$0C                        ;Color Grey 2
        STA $D020                       ;Border Color
        JSR s8A46
        LDA #$0F                        ;Color Grey 3 (light)
        STA $D020                       ;Border Color
        JSR s8D82
        LDA a820B
        STA $0411
        LDA a820D
        STA $0412
        LDA a820C
        STA $0413
        LDA a85EB
        STA $0415
        LDA a85EC
        STA $0416
        LDA aA4C8
        STA $0425
        LDA a845B
        STA $0426
        LDA a845C
        STA $0427

        LDX #$0F
_L00    LDA f20,X
        STA $0400,X
        DEX
        BPL _L00

        LDX #68
_L01    LDA f8135,X
        STA $0400+40*2,X
        LDA f817A,X
        STA $0400+40*5,X
        LDA f81BF,X
        STA $0400+40*8,X
        DEX
        BPL _L01

        LDX #38
_L02    LDA f8215,X
        STA $0400+40*11,X
        LDA f823C,X
        STA $0400+40*13,X
        LDA f8263,X
        STA $0400+40*15,X
        DEX
        BPL _L02

        LDX #227
_L03    LDA a828A,X
        STA $0400+40*16+39,X
        DEX
        BNE _L03

        LDA #$00                        ;Color Black
        STA $D020                       ;Border Color
        LDA a29
        LDX #$07
_L04    LSR A
        PHA
        LDA #$00
        ADC #$30                        ;Number 0
        STA $0400+24,X
        PLA
        DEX
        BPL _L04
        BMI bA5FF

sA5FC   INC a828A
bA5FF   LDA a828A
        LDX #$02
bA604   LSR A
        PHA
        BCC bA60B
        LDA #$59
        .BYTE $2C                       ;It is a BIT. Clobbers the next instruction
bA60B
        LDA #$4E
        STA $0400+33,X
        PLA
        DEX
        BPL bA604
        RTS

        .BYTE $C5,$CE,$C4,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$F7,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$10,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$F7,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$F7,$00
        .BYTE $FF,$00,$FF,$FF,$04,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$01,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$10,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$00,$FF,$00,$FF,$00
        .BYTE $FF,$00,$FF,$C6,$22,$AA,$C6,$03
        .BYTE $AB,$C6,$A7,$AB,$C6,$4E,$AC,$C6
        .BYTE $48,$AD,$C6,$A5,$AE,$14,$00,$EC
        .BYTE $FF,$14,$00,$11,$00,$03,$06,$03
        .BYTE $00,$04,$05,$14,$FF,$00,$04,$32
        .BYTE $00,$F6,$FF,$00,$08,$41,$02,$7B
        .BYTE $05,$64,$06,$0C,$12,$18,$1E,$24
        .BYTE $2A,$30,$36,$3C,$42,$48,$4E,$54
        .BYTE $5A,$60,$0E,$00,$00,$00,$00,$00
        .BYTE $00,$00,$FF,$00,$00,$00,$01,$04
        .BYTE $14,$FF,$00,$04,$32,$00,$F6,$FF
        .BYTE $00,$08,$41,$A2,$7B,$FF,$05,$41
        .BYTE $01,$D7,$05,$0A,$49,$01,$D7,$03
        .BYTE $0A,$41,$01,$F6,$05,$14,$41,$01
        .BYTE $89,$05,$32,$21,$01,$76,$04,$14
        .BYTE $41,$01,$98,$04,$1A,$46,$00,$BA
        .BYTE $FF,$46,$00,$38,$FF,$02,$04,$02
        .BYTE $00,$05,$05,$3C,$00,$C4,$FF,$3C
        .BYTE $00,$38,$FF,$03,$06,$03,$00,$05
        .BYTE $05,$5A,$00,$A6,$FF,$5A,$00,$00
        .BYTE $00,$03,$06,$03,$00,$20,$07,$00
        .BYTE $03,$07,$0C,$00,$03,$07,$0C,$00
        .BYTE $00,$00,$07,$00,$0D,$0C,$07,$05
        .BYTE $00,$0C,$07,$05,$00,$0C,$07,$04
        .BYTE $00,$0C,$07,$04,$00,$26,$01,$32
        .BYTE $01,$2D,$01,$2B,$01,$2D,$0A,$C0
        .BYTE $C2,$2C,$2C,$12,$A7,$BF,$01,$C8
        .BYTE $C2,$A7,$5F,$01,$29,$01,$2B,$04
        .BYTE $26,$0C,$C8,$C2,$A7,$32,$02,$30
        .BYTE $03,$32,$01,$30,$0C,$C8,$C2,$A7
        .BYTE $5F,$01,$29,$01,$2B,$04,$26,$0C
        .BYTE $26,$01,$32,$01,$2D,$01,$30,$01
        .BYTE $2B,$06,$2D,$02,$2B,$03,$29,$01
        .BYTE $2B,$01,$C0,$D8,$02,$5F,$04,$3E
        .BYTE $03,$CE,$1B,$11,$3C,$03,$CE,$1B
        .BYTE $06,$3E,$06,$DA,$5F,$02,$39,$02
        .BYTE $39,$03,$CE,$1B,$0F,$39,$03,$CE
        .BYTE $1B,$06,$39,$08,$41,$02,$41,$06
        .BYTE $CE,$1B,$05,$45,$01,$45,$01,$CE
        .BYTE $1B,$28,$45,$04,$CE,$1B,$06,$C0
        .BYTE $32,$04,$34,$02,$34,$0A,$32,$04
        .BYTE $32,$02,$CE,$18,$41,$CE,$1B,$14
        .BYTE $37,$02,$32,$02,$CE,$18,$49,$CE
        .BYTE $1B,$05,$34,$06,$32,$04,$34,$02
        .BYTE $34,$0A,$34,$04,$35,$02,$35,$02
        .BYTE $34,$02,$35,$04,$C0,$5F,$02,$32
        .BYTE $04,$34,$02,$34,$04,$37,$04,$3A
        .BYTE $06,$3A,$02,$39,$03,$37,$03,$35
        .BYTE $02,$99,$C0,$C0,$BF,$08,$9E,$08
        .BYTE $9E,$08,$9E,$08,$A3,$08,$A3,$08
        .BYTE $A3,$08,$AA,$08,$AA,$08,$AA,$08
        .BYTE $AA,$07,$C4,$96,$A7,$CE,$18,$41
        .BYTE $CE,$1B,$FF,$BF,$01,$AA,$08,$D4
        .BYTE $06,$A4,$D4,$07,$FF,$BF,$0C,$D4
        .BYTE $06,$5C,$D4,$07,$00,$CE,$0D,$05
        .BYTE $CE,$18,$49,$CE,$1B,$03,$BF,$3C
        .BYTE $AA,$08,$A8,$08,$A6,$08,$CE,$18
        .BYTE $41,$CE,$1B,$C8,$A5,$3C,$C0,$CC
        .BYTE $D7,$A8,$37,$C8,$D7,$A8,$CC,$D7
        .BYTE $A8,$32,$00,$01,$CE,$1A,$C7,$0C
        .BYTE $01,$CE,$1A,$87,$D8,$07,$00,$01
        .BYTE $DA,$CE,$1A,$C7,$0C,$01,$CE,$1A
        .BYTE $87,$00,$01,$03,$01,$00,$01,$CE
        .BYTE $1A,$C7,$07,$01,$CE,$1A,$87,$00
        .BYTE $01,$CE,$1A,$C7,$0C,$01,$CE,$1A
        .BYTE $87,$C0,$D8,$02,$5F,$04,$3A,$03
        .BYTE $CE,$1B,$11,$39,$03,$CE,$1B,$06
        .BYTE $3A,$06,$DA,$5F,$02,$35,$02,$35
        .BYTE $03,$CE,$1B,$0F,$35,$03,$CE,$1B
        .BYTE $06,$35,$08,$3E,$02,$3E,$06,$CE
        .BYTE $1B,$05,$41,$01,$41,$01,$CE,$1B
        .BYTE $28,$41,$02,$CE,$1B,$06,$C0,$C4
        .BYTE $A4,$A7,$CE,$1A,$88,$D8,$0B,$CC
        .BYTE $77,$A9,$28,$DA,$D8,$05,$CC,$77
        .BYTE $A9,$29,$DA,$D8,$03,$CC,$77,$A9
        .BYTE $28,$DA,$CC,$77,$A9,$2B,$D8,$04
        .BYTE $CC,$77,$A9,$2E,$DA,$D6,$B2,$A7
        .BYTE $D8,$04,$CC,$77,$A9,$2D,$DA,$D6
        .BYTE $BA,$A7,$D8,$04,$CC,$77,$A9,$2D
        .BYTE $DA,$C0,$CE,$0D,$0D,$6C,$0C,$CE
        .BYTE $0D,$00,$6C,$04,$60,$04,$6C,$04
        .BYTE $C0,$CA,$1A,$D8,$06,$C8,$92,$A9
        .BYTE $DA,$CC,$92,$A9,$18,$CE,$1A,$D9
        .BYTE $00,$01,$CE,$1A,$89,$00,$01,$0C
        .BYTE $01,$00,$01,$CE,$1A,$D9,$18,$01
        .BYTE $CE,$1A,$89,$00,$01,$0C,$01,$00
        .BYTE $01,$C0,$CC,$BA,$A9,$1F,$C8,$BA
        .BYTE $A9,$CC,$BA,$A9,$1A,$CE,$1A,$D9
        .BYTE $00,$02,$CE,$1A,$89,$00,$02,$CE
        .BYTE $1A,$D9,$0C,$02,$CE,$1A,$89,$00
        .BYTE $01,$0A,$02,$00,$01,$07,$02,$CE
        .BYTE $1A,$D9,$05,$02,$CE,$0D,$07,$CE
        .BYTE $1A,$89,$02,$02,$CE,$0D,$05,$C0
        .BYTE $CE,$1A,$D9,$00,$01,$CE,$1A,$89
        .BYTE $00,$01,$0C,$01,$00,$01,$C0,$CA
        .BYTE $1C,$D8,$0B,$C8,$E5,$A9,$DA,$CA
        .BYTE $1D,$D8,$05,$C8,$E5,$A9,$DA,$C0
        .BYTE $CA,$1C,$D8,$03,$C8,$E5,$A9,$DA
        .BYTE $CC,$E5,$A9,$1F,$CA,$22,$D8,$04
        .BYTE $C8,$E5,$A9,$DA,$CA,$21,$D8,$08
        .BYTE $C8,$E5,$A9,$DA,$C0,$C8,$CD,$A7
        .BYTE $5F,$0F,$C8,$CD,$A7,$5F,$0F,$C8
        .BYTE $CD,$A7,$5F,$0F,$DC,$5C,$A7,$C4
        .BYTE $7A,$A7,$C8,$08,$A8,$C8,$08,$A8
        .BYTE $C8,$08,$A8,$C8,$08,$A8,$D4,$0C
        .BYTE $0C,$D4,$0D,$07,$CE,$18,$49,$5F
        .BYTE $02,$C4,$12,$A7,$C8,$3D,$A8,$C8
        .BYTE $6A,$A8,$5F,$02,$C8,$3D,$A8,$C8
        .BYTE $6A,$A8,$DC,$5C,$A7,$C4,$7A,$A7
        .BYTE $C8,$08,$A8,$C8,$08,$A8,$C8,$08
        .BYTE $A8,$C8,$08,$A8,$DC,$61,$A7,$C8
        .BYTE $81,$A8,$3E,$02,$CE,$18,$41,$9E
        .BYTE $0A,$D4,$06,$A6,$D4,$07,$FF,$D4
        .BYTE $0C,$17,$D4,$0D,$07,$5F,$02,$D4
        .BYTE $06,$5A,$D4,$07,$00,$BF,$4A,$DC
        .BYTE $61,$A7,$5F,$04,$C8,$81,$A8,$5F
        .BYTE $04,$45,$01,$46,$01,$45,$0C,$D2
        .BYTE $C9,$AA,$5F,$04,$D2,$E8,$AA,$BF
        .BYTE $00,$DC,$70,$A7,$BF,$00,$CE,$0D
        .BYTE $00,$CE,$11,$00,$BF,$A0,$D8,$04
        .BYTE $D2,$F9,$AA,$D8,$04,$1A,$01,$DA
        .BYTE $DA

        DEC a27
        TAX
        LDX #$AC
        LDY #$39
        STX a8232
        STY a8233
        LDA #$12
        STA a8221
        LDA #$07
        STA a8222
        LDX #$BC
        LDY #$FF
        STX a821B
        STY a821C
        RTS

        LDA #$64     ;#%01100100
        STA a8231
        LDA #$DB     ;#%11011011
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        LDX #$2C     ;#%00101100
        LDY #$33     ;#%00110011
        JMP j8116

        LDA a814F
        CLC
        ADC #$20     ;#%00100000
        STA a814F
        RTS

        .BYTE $BF,$0C,$C8,$CD,$A7,$5F,$0F,$C8
        .BYTE $CD,$A7,$5F,$0D,$CC,$CD,$A7,$18
        .BYTE $5F,$0E,$DC,$66,$A7,$CE,$18,$21
        .BYTE $CE,$11,$00,$CE,$0D,$00,$C8,$CC
        .BYTE $A8,$C8,$CC,$A8,$DC,$5C,$A7,$CE
        .BYTE $11,$05,$C4,$88,$A7,$5F,$01,$CC
        .BYTE $07,$A9,$00,$5F,$02,$C8,$07,$A9
        .BYTE $D4,$0C,$FF,$D4,$0D,$07,$5F,$02
        .BYTE $C8,$3C,$A9,$C8,$3C,$A9,$CE,$11
        .BYTE $00,$CE,$18,$21,$CE,$1B,$05,$CC
        .BYTE $D9,$A8,$37,$C8,$D7,$A8,$CC,$D7
        .BYTE $A8,$32,$C8,$D7,$A8,$C8,$CC,$A8
        .BYTE $C4,$88,$A7,$CE,$11,$05,$DC,$6B
        .BYTE $A7,$5F,$01,$CC,$07,$A9,$00,$5F
        .BYTE $02,$C8,$07,$A9,$5F,$02,$CE,$0D
        .BYTE $00,$CE,$18,$21,$CE,$1B,$05,$CC
        .BYTE $D9,$A8,$37,$C8,$D7,$A8,$CC,$D7
        .BYTE $A8,$32,$C8,$D7,$A8,$CE,$11,$00
        .BYTE $C8,$CC,$A8,$C8,$CC,$A8,$C8,$CC
        .BYTE $A8,$5F,$01,$CC,$CD,$A7,$00,$5F
        .BYTE $0F,$C6,$0F,$AB,$BF,$06,$C8,$CD
        .BYTE $A7,$C2,$1D,$1D,$3F,$A7,$5F,$0A
        .BYTE $13,$04,$C2,$1D,$1D,$12,$A7,$D8
        .BYTE $02,$D8,$06,$1A,$08,$DA,$D8,$02
        .BYTE $18,$08,$DA,$DA,$DC,$75,$A7,$BF
        .BYTE $02,$C8,$86,$A9,$C8,$86,$A9,$D8
        .BYTE $04,$C8,$AF,$A9,$DA,$D8,$02,$C8
        .BYTE $F4,$A9,$C8,$05,$AA,$DA,$D8,$07
        .BYTE $C8,$AF,$A9,$DA,$CC,$BA,$A9,$1F
        .BYTE $C8,$BA,$A9,$CC,$BA,$A9,$1A,$CA
        .BYTE $00,$5F,$02,$C6,$AC,$AB,$9B,$9C
        .BYTE $3B,$04,$39,$0C,$3B,$04,$3C,$08
        .BYTE $32,$02,$3C,$02,$3B,$02,$39,$02
        .BYTE $3B,$08,$37,$10,$2B,$02,$CE,$0D
        .BYTE $07,$35,$02,$CE,$0D,$05,$35,$02
        .BYTE $34,$02,$35,$0C,$CE,$0D,$07,$35
        .BYTE $02,$CE,$0D,$05,$35,$02,$34,$04
        .BYTE $35,$03,$35,$03,$35,$02,$35,$02
        .BYTE $35,$02,$35,$02,$35,$0E,$94,$84
        .BYTE $35,$06,$35,$04,$34,$0C,$36,$06
        .BYTE $97,$C0,$C0,$D8,$17,$BF,$00,$DA
        .BYTE $BF,$40,$C0,$C2,$2C,$2C,$5B,$AE
        .BYTE $CE,$19,$1C,$BF,$03,$CE,$1B,$B4
        .BYTE $BF,$C0,$C8,$F9,$AB,$BF,$BF,$C2
        .BYTE $1C,$1C,$2B,$AD,$BF,$01,$C8,$F9
        .BYTE $AB,$34,$0A,$36,$06,$34,$04,$32
        .BYTE $04,$32,$02,$32,$04,$34,$0C,$36
        .BYTE $04,$39,$04,$37,$02,$36,$02,$39
        .BYTE $04,$37,$02,$36,$02,$37,$0E,$37
        .BYTE $04,$37,$04,$37,$04,$35,$02,$35
        .BYTE $04,$94,$84,$35,$04,$35,$02,$35
        .BYTE $04,$94,$CC,$96,$10,$96,$10,$96
        .BYTE $10,$96,$10,$94,$10,$92,$10,$99
        .BYTE $10,$97,$10,$96,$10,$9C,$10,$9B
        .BYTE $10,$99,$10,$3B,$0A,$39,$04,$97
        .BYTE $54,$37,$04,$35,$06,$35,$04,$35
        .BYTE $04,$32,$0E,$35,$04,$36,$02,$37
        .BYTE $04,$37,$04,$37,$04,$37,$0E,$37
        .BYTE $04,$37,$02,$37,$04,$37,$04,$37
        .BYTE $04,$36,$04,$36,$03,$36,$03,$36
        .BYTE $02,$36,$02,$36,$04,$36,$02,$37
        .BYTE $04,$37,$04,$37,$04,$37,$0E,$37
        .BYTE $04,$34,$02,$35,$04,$35,$04,$35
        .BYTE $04,$32,$0E,$35,$04,$36,$02,$37
        .BYTE $04,$37,$04,$37,$04,$37,$0E,$37
        .BYTE $04,$36,$10,$CE,$18,$41,$CE,$1B
        .BYTE $64,$96,$10,$94,$10,$92,$10,$90
        .BYTE $10,$8F,$10,$8D,$10,$CE,$18,$49
        .BYTE $CE,$1B,$0A,$8B,$BD,$C6,$4E,$AC
        .BYTE $09,$00,$F7,$FF,$09,$00,$48,$00
        .BYTE $03,$06,$03,$00,$0A,$05,$10,$32
        .BYTE $01,$05,$40,$00,$FB,$FF,$00,$04
        .BYTE $49,$27,$9A,$0A,$96,$BF,$01,$C2
        .BYTE $1D,$1D,$2B,$AD,$C2,$2C,$0F,$78
        .BYTE $AE,$BF,$02,$D8,$06,$BF,$00,$DA
        .BYTE $5F,$02,$30,$06,$30,$08,$30,$04
        .BYTE $32,$02,$34,$04,$32,$02,$36,$02
        .BYTE $97,$A8,$37,$04,$35,$0C,$37,$04
        .BYTE $39,$0A,$39,$02,$37,$02,$35,$02
        .BYTE $37,$08,$92,$FF,$BF,$61,$BF,$D4
        .BYTE $39,$06,$39,$04,$37,$0C,$39,$06
        .BYTE $9B,$C0,$37,$0A,$39,$06,$37,$04
        .BYTE $36,$04,$36,$02,$36,$04,$37,$0C
        .BYTE $39,$04,$3C,$04,$3B,$02,$39,$02
        .BYTE $3C,$04,$3B,$02,$39,$02,$3B,$0E
        .BYTE $3B,$04,$3B,$04,$3B,$04,$3B,$02
        .BYTE $3B,$04,$97,$84,$3B,$04,$3B,$02
        .BYTE $3B,$04,$97,$CC,$99,$10,$99,$10
        .BYTE $99,$10,$99,$10,$97,$10,$96,$10
        .BYTE $9C,$10,$9B,$10,$99,$10,$A0,$10
        .BYTE $9E,$10,$9C,$10,$3E,$0A,$3C,$04
        .BYTE $9B,$54,$3B,$04,$3A,$06,$3A,$04
        .BYTE $3A,$04,$3A,$0E,$3A,$04,$39,$02
        .BYTE $3A,$04,$3A,$04,$3A,$04,$3A,$0E
        .BYTE $3A,$04,$3A,$02,$3A,$04,$3A,$04
        .BYTE $3A,$04,$39,$04,$39,$03,$3A,$03
        .BYTE $CE,$06,$A0,$CE,$0C,$06,$CE,$0D
        .BYTE $07,$3A,$02,$CE,$0C,$0A,$CE,$0D
        .BYTE $05,$3A,$02,$39,$04,$39,$02,$3A
        .BYTE $04,$3A,$04,$3A,$04,$3A,$0E,$3A
        .BYTE $04,$39,$02,$3A,$04,$3A,$04,$3A
        .BYTE $04,$3A,$0E,$3A,$04,$39,$02,$3A
        .BYTE $04,$3A,$04,$3A,$04,$3A,$0E,$3A
        .BYTE $04,$39,$10,$CE,$18,$41,$CE,$1B
        .BYTE $64,$99,$10,$97,$10,$96,$10,$94
        .BYTE $10,$92,$10,$90,$10,$CE,$18,$49
        .BYTE $CE,$1B,$0A,$8F,$BD,$C6,$48,$AD
        .BYTE $08,$00,$F8,$FF,$08,$00,$48,$00
        .BYTE $03,$06,$03,$00,$0A,$05,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$08
        .BYTE $21,$18,$89,$14,$64,$06,$0C,$12
        .BYTE $18,$1E,$24,$2A,$30,$36,$3C,$42
        .BYTE $48,$4E,$54,$5A,$60,$14,$14,$00
        .BYTE $05,$14,$00,$EC,$FF,$00,$08,$D8
        .BYTE $04,$00,$04,$0C,$04,$DA,$C0,$D8
        .BYTE $03,$1F,$04,$2B,$04,$DA,$1F,$04
        .BYTE $8B,$15,$BF,$02,$C2,$2C,$2C,$5B
        .BYTE $AE,$BF,$01,$D8,$14,$1F,$04,$2B
        .BYTE $04,$DA,$D8,$07,$18,$04,$24,$04
        .BYTE $DA,$18,$02,$26,$06,$D8,$18,$1F
        .BYTE $04,$2B,$04,$DA,$D8,$07,$18,$04
        .BYTE $24,$04,$DA,$18,$02,$26,$06,$CE
        .BYTE $18,$41,$D8,$03,$1F,$04,$2B,$04
        .BYTE $DA,$1F,$04,$1E,$04,$C2,$17,$09
        .BYTE $88,$AE,$D8,$07,$1C,$04,$28,$04
        .BYTE $DA,$1C,$02,$1A,$06,$CC,$92,$AE
        .BYTE $1F,$CC,$92,$AE,$18,$C8,$92,$AE
        .BYTE $CC,$92,$AE,$1A,$CC,$92,$AE,$1F
        .BYTE $CC,$92,$AE,$22,$CC,$92,$AE,$1B
        .BYTE $CA,$00,$D8,$02,$1A,$04,$26,$04
        .BYTE $DA,$D8,$02,$1E,$04,$2A,$04,$DA
        .BYTE $CC,$92,$AE,$1F,$CC,$92,$AE,$22
        .BYTE $CC,$92,$AE,$1B,$CA,$00,$7A,$6C
        .BYTE $15,$03,$17,$03,$18,$02,$1A,$02
        .BYTE $1C,$02,$1E,$02,$C6,$9A,$AE,$C5
        .BYTE $CE,$C4,$00,$BE,$AE,$CC,$BE,$AE
        .BYTE $1A,$CC,$BE,$AE,$1F,$CC,$BE,$AE
        .BYTE $22,$CC,$BE,$AE,$1B,$CA,$00,$D8
        .BYTE $02,$1A,$04,$26,$04,$DA,$D8,$02
        .BYTE $1E,$04,$2A,$04,$DA,$CC,$BE,$AE
        .BYTE $1F,$CC,$BE,$AE,$22,$CC,$BE,$AE
        .BYTE $1B,$CA,$00,$7A,$6C,$15,$03,$17
        .BYTE $03,$18,$02,$1A,$02,$1C,$02,$1E
        .BYTE $02,$C6,$DE,$AE,$C5,$CE,$C4,$00
        .BYTE $FF,$00,$FF,$00,$FF,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$00,$FF,$00
        .BYTE $FF,$00,$FF,$00,$FF,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$00,$FF,$00
        .BYTE $FF,$00,$FF,$00,$FF,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$00,$FF,$00
        .BYTE $F7,$00,$FF,$00,$FF,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$00,$FF,$00
        .BYTE $FF,$00,$FF,$00,$FF,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$00,$FF,$00
        .BYTE $FF,$00,$FF,$00,$FF,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$00,$FF,$00
        .BYTE $FF,$00,$FF,$00,$FF,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$00,$FF,$00
        .BYTE $FF,$00,$FF,$00,$FF,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00

        ; Hi-Score table. Each score contains 3 bytes
        ; They are in MSB order. E.g:
        ;   .BYTE $08,$00,$00 -> 80000
        ; The table is 240 bytes long: 80 * 3 = 240
HISCORE_TBL
        .BYTE $08,$00,$00,$07,$90,$00,$07,$80
        .BYTE $00,$07,$70,$00,$07,$60,$00,$07
        .BYTE $50,$00,$07,$40,$00,$07,$30,$00
        .BYTE $07,$20,$00,$07,$10,$00,$07,$00
        .BYTE $00,$06,$90,$00,$06,$80,$00,$06
        .BYTE $70,$00,$06,$60,$00,$06,$50,$00
        .BYTE $06,$40,$00,$06,$30,$00,$06,$20
        .BYTE $00,$06,$10,$00,$06,$00,$00,$05
        .BYTE $90,$00,$05,$80,$00,$05,$70,$00
        .BYTE $05,$60,$00,$05,$50,$00,$05,$40
        .BYTE $00,$05,$30,$00,$05,$20,$00,$05
        .BYTE $10,$00,$05,$00,$00,$04,$90,$00
        .BYTE $04,$80,$00,$04,$70,$00,$04,$60
        .BYTE $00,$04,$50,$00,$04,$40,$00,$04
        .BYTE $30,$00,$04,$20,$00,$04,$10,$00
        .BYTE $04,$00,$00,$03,$90,$00,$03,$80
        .BYTE $00,$03,$70,$00,$03,$60,$00,$03
        .BYTE $50,$00,$03,$40,$00,$03,$30,$00
        .BYTE $03,$20,$00,$03,$10,$00,$03,$00
        .BYTE $00,$02,$90,$00,$02,$80,$00,$02
        .BYTE $70,$00,$02,$60,$00,$02,$50,$00
        .BYTE $02,$40,$00,$02,$30,$00,$02,$20
        .BYTE $00,$02,$10,$00,$02,$00,$00,$01
        .BYTE $90,$00,$01,$80,$00,$01,$70,$00
        .BYTE $01,$60,$00,$01,$50,$00,$01,$40
        .BYTE $00,$01,$30,$00,$01,$20,$00,$01
        .BYTE $10,$00,$01,$00,$00,$00,$90,$00
        .BYTE $00,$80,$00,$00,$70,$00,$00,$60

        ; $B0F0
        .BYTE $00,$00,$50,$00,$00,$40,$00,$00
        .BYTE $30,$00,$00,$20,$00,$00,$10,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $B0F0
HISCORE_NAMES_TBL
        .TEXT "[[CODING[["
        .TEXT "[[[[BY[[[["
        .TEXT "]]]TONY]]]"
        .TEXT "]]]DAVE]]]"
        .TEXT "]]]BILL]]]"
        .TEXT "]]MARTIN]]"
        .TEXT "\\\\\\\\\\"
        .TEXT "[GRAPHICS["
        .TEXT "[[[[BY[[[["
        .TEXT "]]STEVE]]]"
        .TEXT "]]]TONY]]]"
        .TEXT "]]]DAVE]]]"
        .TEXT "[[[[[[[[[["
        .TEXT "MUSIC[[AND"
        .TEXT "[SOUND[FX["
        .TEXT "[[[[BY[[[["
        .TEXT "]]MARTIN]]"
        .TEXT "[[[[[[[[[["
        .TEXT "[[[TAPE[[["
        .TEXT "[[LOADER[["
        .TEXT "[[[[BY[[[["
        .TEXT "]]]BILL]]]"
        .TEXT "[[[[[[[[[["
        .TEXT "[[DRINKS[["
        .TEXT "[[[[BY[[[["
        .TEXT "BREWS[[LEE"
        .TEXT "\\\\\\\\\\"
        .TEXT "]ASSISTED]"
        .TEXT "[[[[BY[[[["
        .TEXT "[[COLIN[[["
        .TEXT "[[JOFFA[[["
        .TEXT "[[[PAUL[[["
        .TEXT "[[DOUGIE[["
        .TEXT "WING[CMNDR"
        .TEXT "[[[RICK[[["
        .TEXT "[[[PAM[[[["
        .TEXT "[[DEBBIE[["
        .TEXT "[[CLARE[[["
        .TEXT "[[[LYNN[[["
        .TEXT "[[[LISA[[["
        .TEXT "[[SIMONE[["
        .TEXT "[[[JANE[[["
        .TEXT "TONY]MARIA"
        .TEXT "STEVE[BLOW"
        .TEXT "JON[WOODS["
        .TEXT "DAVID[WARD"
        .TEXT "PAUL[FIN[["
        .TEXT "COLIN[STOK"
        .TEXT "CHRISTINE["
        .TEXT "SIMON[STRE"
        .TEXT "SAMANTHA[S"
        .TEXT "SYLVIA[POM"
        .TEXT "MIKE[POMFR"
        .TEXT "MIKE[BARNE"
        .TEXT "BRIAN[GALW"
        .TEXT "MURIEL[GAL"
        .TEXT "GEORGE[GAL"
        .TEXT "PADDY[GALW"
        .TEXT "DAVID[KENN"
        .TEXT "[[SIMON[[["
        .TEXT "PAUL[SMITH"
        .TEXT "BENJAMIN[S"
        .TEXT "SHARON[GRE"
        .TEXT "THE[HITMAN"
        .TEXT "CRAZY[DAVE"
        .TEXT "GEOFF[MATH"
        .TEXT "JAKE[MATH["
        .TEXT "JON[TICKLE"
        .TEXT "[JONNY[B[["
        .TEXT "MIKE[CARR["
        .TEXT "DAVE[SUPER"
        .TEXT "[[[COOL[[["
        .TEXT "[[HICKY[[["
        .TEXT "[[GRUMPY[["
        .TEXT "[BASHER[W["
        .TEXT "[[SHIRT[[["
        .TEXT "[AND[ANY[["
        .TEXT "BODY[ELSE["
        .TEXT "]UNKNOWN]["
        .TEXT "]UNKNOWN]["
        .TEXT "[[[[[[[[[["

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $B41A
; 80-values table that contains the index to the hiscores.
HISCORE_TBL_IDX
        .BYTE $00,$01,$02,$03,$04,$05,$06,$07
        .BYTE $08,$09,$0A,$0B,$0C,$0D,$0E,$0F
        .BYTE $10,$11,$12,$13,$14,$15,$16,$17
        .BYTE $18,$19,$1A,$1B,$1C,$1D,$1E,$1F
        .BYTE $20,$21,$22,$23,$24,$25,$26,$27
        .BYTE $28,$29,$2A,$2B,$2C,$2D,$2E,$2F
        .BYTE $30,$31,$32,$33,$34,$35,$36,$37
        .BYTE $38,$39,$3A,$3B,$3C,$3D,$3E,$3F
        .BYTE $40,$41,$42,$43,$44,$45,$46,$47
        .BYTE $48,$49,$4A,$4B,$4C,$4D,$4E,$4F

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
        ; $B46A garbage
        .BYTE $00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$08,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$F7,$00,$FF,$00,$FF,$00
        .BYTE $D3,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$F7,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $00,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$F7,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$FF
        .BYTE $50,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$08,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$F7,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$08,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$FF,$00,$FF,$00,$FF,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$00
        .BYTE $FF,$00,$F7,$00,$FF,$00,$FF,$C6
        .BYTE $22,$BA,$C6,$03,$BB,$C6,$A7,$BB
        .BYTE $C6,$4E,$BC,$C6,$5E,$BD,$C6,$C6
        .BYTE $BE,$14,$00,$EC,$FF,$14,$00,$11
        .BYTE $00,$03,$06,$03,$00,$04,$05,$14
        .BYTE $FF,$00,$04,$32,$00,$F6,$FF,$00
        .BYTE $08,$41,$02,$7B,$05,$64,$06,$0C
        .BYTE $12,$18,$1E,$24,$2A,$30,$36,$3C
        .BYTE $42,$48,$4E,$54,$5A,$60,$0E,$00
        .BYTE $00,$00,$00,$00,$00,$00,$FF,$00
        .BYTE $00,$00,$01,$04,$14,$FF,$00,$04
        .BYTE $32,$00,$F6,$FF,$00,$08,$41,$A2
        .BYTE $7B,$FF,$05,$41,$01,$D7,$05,$0A
        .BYTE $49,$01,$D7,$03,$0A,$41,$01,$F6
        .BYTE $05,$14,$41,$01,$89,$05,$32,$21
        .BYTE $01,$76,$04,$14,$41,$01,$98,$04
        .BYTE $1A,$46,$00,$BA,$FF,$46,$00,$38
        .BYTE $FF,$02,$04,$02,$00,$05,$05,$3C
        .BYTE $00,$C4,$FF,$3C,$00,$38,$FF,$03
        .BYTE $06,$03,$00,$05,$05,$5A,$00,$A6
        .BYTE $FF,$5A,$00,$00,$00,$03,$06,$03
        .BYTE $00,$20,$07,$00,$03,$07,$0C,$00
        .BYTE $03,$07,$0C,$00,$00,$00,$07,$00
        .BYTE $0D,$0C,$07,$05,$00,$0C,$07,$05
        .BYTE $00,$0C,$07,$04,$00,$0C,$07,$04
        .BYTE $00,$26,$01,$32,$01,$2D,$01,$2B
        .BYTE $01,$2D,$0A,$C0,$C2,$2C,$2C,$12
        .BYTE $B7,$BF,$01,$C8,$C2,$B7,$5F,$01
        .BYTE $29,$01,$2B,$04,$26,$0C,$C8,$C2
        .BYTE $B7,$32,$02,$30,$03,$32,$01,$30
        .BYTE $0C,$C8,$C2,$B7,$5F,$01,$29,$01
        .BYTE $2B,$04,$26,$0C,$26,$01,$32,$01
        .BYTE $2D,$01,$30,$01,$2B,$06,$2D,$02
        .BYTE $2B,$03,$29,$01,$2B,$01,$C0,$D8
        .BYTE $02,$5F,$04,$3E,$03,$CE,$1B,$11
        .BYTE $3C,$03,$CE,$1B,$06,$3E,$06,$DA
        .BYTE $5F,$02,$39,$02,$39,$03,$CE,$1B
        .BYTE $0F,$39,$03,$CE,$1B,$06,$39,$08
        .BYTE $41,$02,$41,$06,$CE,$1B,$05,$45
        .BYTE $01,$45,$01,$CE,$1B,$28,$45,$04
        .BYTE $CE,$1B,$06,$C0,$32,$04,$34,$02
        .BYTE $34,$0A,$32,$04,$32,$02,$CE,$18
        .BYTE $41,$CE,$1B,$14,$37,$02,$32,$02
        .BYTE $CE,$18,$49,$CE,$1B,$05,$34,$06
        .BYTE $32,$04,$34,$02,$34,$0A,$34,$04
        .BYTE $35,$02,$35,$02,$34,$02,$35,$04
        .BYTE $C0,$5F,$02,$32,$04,$34,$02,$34
        .BYTE $04,$37,$04,$3A,$06,$3A,$02,$39
        .BYTE $03,$37,$03,$35,$02,$99,$C0,$C0
        .BYTE $BF,$08,$9E,$08,$9E,$08,$9E,$08
        .BYTE $A3,$08,$A3,$08,$A3,$08,$AA,$08
        .BYTE $AA,$08,$AA,$08,$AA,$07,$C4,$96
        .BYTE $B7,$CE,$18,$41,$CE,$1B,$FF,$BF
        .BYTE $01,$AA,$08,$D4,$06,$A4,$D4,$07
        .BYTE $FF,$BF,$0C,$D4,$06,$5C,$D4,$07
        .BYTE $00,$CE,$0D,$05,$CE,$18,$49,$CE
        .BYTE $1B,$03,$BF,$3C,$AA,$08,$A8,$08
        .BYTE $A6,$08,$CE,$18,$41,$CE,$1B,$C8
        .BYTE $A5,$3C,$C0,$CC,$D7,$B8,$37,$C8
        .BYTE $D7,$B8,$CC,$D7,$B8,$32,$00,$01
        .BYTE $CE,$1A,$C7,$0C,$01,$CE,$1A,$87
        .BYTE $D8,$07,$00,$01,$DA,$CE,$1A,$C7
        .BYTE $0C,$01,$CE,$1A,$87,$00,$01,$03
        .BYTE $01,$00,$01,$CE,$1A,$C7,$07,$01
        .BYTE $CE,$1A,$87,$00,$01,$CE,$1A,$C7
        .BYTE $0C,$01,$CE,$1A,$87,$C0,$D8,$02
        .BYTE $5F,$04,$3A,$03,$CE,$1B,$11,$39
        .BYTE $03,$CE,$1B,$06,$3A,$06,$DA,$5F
        .BYTE $02,$35,$02,$35,$03,$CE,$1B,$0F
        .BYTE $35,$03,$CE,$1B,$06,$35,$08,$3E
        .BYTE $02,$3E,$06,$CE,$1B,$05,$41,$01
        .BYTE $41,$01,$CE,$1B,$28,$41,$02,$CE
        .BYTE $1B,$06,$C0,$C4,$A4,$B7,$CE,$1A
        .BYTE $88,$D8,$0B,$CC,$77,$B9,$28,$DA
        .BYTE $D8,$05,$CC,$77,$B9,$29,$DA,$D8
        .BYTE $03,$CC,$77,$B9,$28,$DA,$CC,$77
        .BYTE $B9,$2B,$D8,$04,$CC,$77,$B9,$2E
        .BYTE $DA,$D6,$B2,$B7,$D8,$04,$CC,$77
        .BYTE $B9,$2D,$DA,$D6,$BA,$B7,$D8,$04
        .BYTE $CC,$77,$B9,$2D,$DA,$C0,$CE,$0D
        .BYTE $0D,$6C,$0C,$CE,$0D,$00,$6C,$04
        .BYTE $60,$04,$6C,$04,$C0,$CA,$1A,$D8
        .BYTE $06,$C8,$92,$B9,$DA,$CC,$92,$B9
        .BYTE $18,$CE,$1A,$D9,$00,$01,$CE,$1A
        .BYTE $89,$00,$01,$0C,$01,$00,$01,$CE
        .BYTE $1A,$D9,$18,$01,$CE,$1A,$89,$00
        .BYTE $01,$0C,$01,$00,$01,$C0,$CC,$BA
        .BYTE $B9,$1F,$C8,$BA,$B9,$CC,$BA,$B9
        .BYTE $1A,$CE,$1A,$D9,$00,$02,$CE,$1A
        .BYTE $89,$00,$02,$CE,$1A,$D9,$0C,$02
        .BYTE $CE,$1A,$89,$00,$01,$0A,$02,$00
        .BYTE $01,$07,$02,$CE,$1A,$D9,$05,$02
        .BYTE $CE,$0D,$07,$CE,$1A,$89,$02,$02
        .BYTE $CE,$0D,$05,$C0,$CE,$1A,$D9,$00
        .BYTE $01,$CE,$1A,$89,$00,$01,$0C,$01
        .BYTE $00,$01,$C0,$CA,$1C,$D8,$0B,$C8
        .BYTE $E5,$B9,$DA,$CA,$1D,$D8,$05,$C8
        .BYTE $E5,$B9,$DA,$C0,$CA,$1C,$D8,$03
        .BYTE $C8,$E5,$B9,$DA,$CC,$E5,$B9,$1F
        .BYTE $CA,$22,$D8,$04,$C8,$E5,$B9,$DA
        .BYTE $CA,$21,$D8,$08,$C8,$E5,$B9,$DA
        .BYTE $C0,$C8,$CD,$B7,$5F,$0F,$C8,$CD
        .BYTE $B7,$5F,$0F,$C8,$CD,$B7,$5F,$0F
        .BYTE $DC,$5C,$B7,$C4,$7A,$B7,$C8,$08
        .BYTE $B8,$C8,$08,$B8,$C8,$08,$B8,$C8
        .BYTE $08,$B8,$D4,$0C,$0C,$D4,$0D,$07
        .BYTE $CE,$18,$49,$5F,$02,$C4,$12,$B7
        .BYTE $C8,$3D,$B8,$C8,$6A,$B8,$5F,$02
        .BYTE $C8,$3D,$B8,$C8,$6A,$B8,$DC,$5C
        .BYTE $B7,$C4,$7A,$B7,$C8,$08,$B8,$C8
        .BYTE $08,$B8,$C8,$08,$B8,$C8,$08,$B8
        .BYTE $DC,$61,$B7,$C8,$81,$B8,$3E,$02
        .BYTE $CE,$18,$41,$9E,$0A,$D4,$06,$A6
        .BYTE $D4,$07,$FF,$D4,$0C,$17,$D4,$0D
        .BYTE $07,$5F,$02,$D4,$06,$5A,$D4,$07
        .BYTE $00,$BF,$4A,$DC,$61,$B7,$5F,$04
        .BYTE $C8,$81,$B8,$5F,$04,$45,$01,$46
        .BYTE $01,$45,$0C,$D2,$C9,$BA,$5F,$04
        .BYTE $D2,$E8,$BA,$BF,$00,$DC,$70,$B7
        .BYTE $BF,$00,$CE,$0D,$00,$CE,$11,$00
        .BYTE $BF,$A0,$D8,$04,$D2,$F9,$BA,$D8
        .BYTE $04,$1A,$01,$DA
        .BYTE $DA

        DEC a27
        TSX
        LDX #$AC
        LDY #$39
        STX a8232
        STY a8233
        LDA #$12
        STA a8221
        LDA #$07
        STA a8222
        LDX #$BC
        LDY #$FF
        STX a821B
        STY a821C
        RTS

        LDA #$64     ;#%01100100
        STA a8231
        LDA #$DB     ;#%11011011
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        LDX #$2C     ;#%00101100
        LDY #$33     ;#%00110011
        JMP j8116

        LDA a814F
        CLC
        ADC #$20     ;#%00100000
        STA a814F
        RTS

        .BYTE $BF,$0C,$C8,$CD,$B7,$5F,$0F,$C8
        .BYTE $CD,$B7,$5F,$0D,$CC,$CD,$B7,$18
        .BYTE $5F,$0E,$DC,$66,$B7,$CE,$18,$21
        .BYTE $CE,$11,$00,$CE,$0D,$00,$C8,$CC
        .BYTE $B8,$C8,$CC,$B8,$DC,$5C,$B7,$CE
        .BYTE $11,$05,$C4,$88,$B7,$5F,$01,$CC
        .BYTE $07,$B9,$00,$5F,$02,$C8,$07,$B9
        .BYTE $D4,$0C,$FF,$D4,$0D,$07,$5F,$02
        .BYTE $C8,$3C,$B9,$C8,$3C,$B9,$CE,$11
        .BYTE $00,$CE,$18,$21,$CE,$1B,$05,$CC
        .BYTE $D9,$B8,$37,$C8,$D7,$B8,$CC,$D7
        .BYTE $B8,$32,$C8,$D7,$B8,$C8,$CC,$B8
        .BYTE $C4,$88,$B7,$CE,$11,$05,$DC,$6B
        .BYTE $B7,$5F,$01,$CC,$07,$B9,$00,$5F
        .BYTE $02,$C8,$07,$B9,$5F,$02,$CE,$0D
        .BYTE $00,$CE,$18,$21,$CE,$1B,$05,$CC
        .BYTE $D9,$B8,$37,$C8,$D7,$B8,$CC,$D7
        .BYTE $B8,$32,$C8,$D7,$B8,$CE,$11,$00
        .BYTE $C8,$CC,$B8,$C8,$CC,$B8,$C8,$CC
        .BYTE $B8,$5F,$01,$CC,$CD,$B7,$00,$5F
        .BYTE $0F,$C6,$0F,$BB,$BF,$06,$C8,$CD
        .BYTE $B7,$C2,$1D,$1D,$3F,$B7,$5F,$0A
        .BYTE $13,$04,$C2,$1D,$1D,$12,$B7,$D8
        .BYTE $02,$D8,$06,$1A,$08,$DA,$D8,$02
        .BYTE $18,$08,$DA,$DA,$DC,$75,$B7,$BF
        .BYTE $02,$C8,$86,$B9,$C8,$86,$B9,$D8
        .BYTE $04,$C8,$AF,$B9,$DA,$D8,$02,$C8
        .BYTE $F4,$B9,$C8,$05,$BA,$DA,$D8,$07
        .BYTE $C8,$AF,$B9,$DA,$CC,$BA,$B9,$1F
        .BYTE $C8,$BA,$B9,$CC,$BA,$B9,$1A,$CA
        .BYTE $00,$5F,$02,$C6,$AC,$BB,$9B,$9C
        .BYTE $3B,$04,$39,$0C,$3B,$04,$3C,$08
        .BYTE $32,$02,$3C,$02,$3B,$02,$39,$02
        .BYTE $3B,$08,$37,$10,$2B,$02,$CE,$0D
        .BYTE $07,$35,$02,$CE,$0D,$05,$35,$02
        .BYTE $34,$02,$35,$0C,$CE,$0D,$07,$35
        .BYTE $02,$CE,$0D,$05,$35,$02,$34,$04
        .BYTE $35,$03,$35,$03,$35,$02,$35,$02
        .BYTE $35,$02,$35,$02,$35,$0E,$94,$84
        .BYTE $35,$06,$35,$04,$34,$0C,$36,$06
        .BYTE $97,$C0,$C0,$D8,$17,$BF,$00,$DA
        .BYTE $BF,$40,$C0,$C8,$66,$BC,$C8,$66
        .BYTE $BC,$C8,$46,$BC,$C8,$66,$BC,$C8
        .BYTE $46,$BC,$C8,$66,$BC,$C8,$46,$BC
        .BYTE $C6,$4E,$BC,$C2,$2C,$2C,$87,$BE
        .BYTE $CE,$19,$1C,$BF,$03,$CE,$1B,$B4
        .BYTE $BF,$C0,$C8,$F9,$BB,$BF,$BF,$C2
        .BYTE $1C,$1C,$41,$BD,$BF,$01,$C8,$F9
        .BYTE $BB,$34,$0A,$36,$06,$34,$04,$32
        .BYTE $04,$32,$02,$32,$04,$34,$0C,$36
        .BYTE $04,$39,$04,$37,$02,$36,$02,$39
        .BYTE $04,$37,$02,$36,$02,$37,$0E,$37
        .BYTE $04,$37,$04,$37,$04,$35,$02,$35
        .BYTE $04,$94,$84,$35,$04,$35,$02,$35
        .BYTE $04,$94,$CC,$96,$10,$96,$10,$96
        .BYTE $10,$96,$10,$94,$10,$92,$10,$99
        .BYTE $10,$97,$10,$96,$10,$9C,$10,$9B
        .BYTE $10,$99,$10,$3B,$0A,$39,$04,$97
        .BYTE $54,$37,$04,$35,$06,$35,$04,$35
        .BYTE $04,$32,$0E,$35,$04,$36,$02,$37
        .BYTE $04,$37,$04,$37,$04,$37,$0E,$37
        .BYTE $04,$37,$02,$37,$04,$37,$04,$37
        .BYTE $04,$36,$04,$36,$03,$36,$03,$36
        .BYTE $02,$36,$02,$36,$04,$36,$02,$37
        .BYTE $04,$37,$04,$37,$04,$37,$0E,$37
        .BYTE $04,$34,$02,$35,$04,$35,$04,$35
        .BYTE $04,$32,$0E,$35,$04,$36,$02,$37
        .BYTE $04,$37,$04,$37,$04,$37,$0E,$37
        .BYTE $04,$36,$10,$CE,$18,$41,$CE,$1B
        .BYTE $64,$96,$10,$94,$10,$92,$10,$90
        .BYTE $10,$8F,$10,$8D,$10,$CE,$18,$49
        .BYTE $CE,$1B,$0A,$8B,$BD,$C0,$09,$00
        .BYTE $F7,$FF,$09,$00,$48,$00,$03,$06
        .BYTE $03,$00,$0A,$05,$10,$32,$01,$05
        .BYTE $40,$00,$FB,$FF,$00,$04,$49,$27
        .BYTE $9A,$0A,$96,$C8,$76,$BD,$C8,$46
        .BYTE $BC,$C8,$76,$BD,$C8,$76,$BD,$C8
        .BYTE $46,$BC,$C8,$46,$BC,$C8,$76,$BD
        .BYTE $C6,$5E,$BD,$BF,$01,$C2,$1D,$1D
        .BYTE $41,$BD,$C2,$2C,$0F,$A4,$BE,$BF
        .BYTE $02,$D8,$06,$BF,$00,$DA,$5F,$02
        .BYTE $30,$06,$30,$08,$30,$04,$32,$02
        .BYTE $34,$04,$32,$02,$36,$02,$97,$A8
        .BYTE $37,$04,$35,$0C,$37,$04,$39,$0A
        .BYTE $39,$02,$37,$02,$35,$02,$37,$08
        .BYTE $92,$FF,$BF,$61,$BF,$D4,$39,$06
        .BYTE $39,$04,$37,$0C,$39,$06,$9B,$C0
        .BYTE $37,$0A,$39,$06,$37,$04,$36,$04
        .BYTE $36,$02,$36,$04,$37,$0C,$39,$04
        .BYTE $3C,$04,$3B,$02,$39,$02,$3C,$04
        .BYTE $3B,$02,$39,$02,$3B,$0E,$3B,$04
        .BYTE $3B,$04,$3B,$04,$3B,$02,$3B,$04
        .BYTE $97,$84,$3B,$04,$3B,$02,$3B,$04
        .BYTE $97,$CC,$99,$10,$99,$10,$99,$10
        .BYTE $99,$10,$97,$10,$96,$10,$9C,$10
        .BYTE $9B,$10,$99,$10,$A0,$10,$9E,$10
        .BYTE $9C,$10,$3E,$0A,$3C,$04,$9B,$54
        .BYTE $3B,$04,$3A,$06,$3A,$04,$3A,$04
        .BYTE $3A,$0E,$3A,$04,$39,$02,$3A,$04
        .BYTE $3A,$04,$3A,$04,$3A,$0E,$3A,$04
        .BYTE $3A,$02,$3A,$04,$3A,$04,$3A,$04
        .BYTE $39,$04,$39,$03,$3A,$03,$CE,$06
        .BYTE $A0,$CE,$0C,$06,$CE,$0D,$07,$3A
        .BYTE $02,$CE,$0C,$0A,$CE,$0D,$05,$3A
        .BYTE $02,$39,$04,$39,$02,$3A,$04,$3A
        .BYTE $04,$3A,$04,$3A,$0E,$3A,$04,$39
        .BYTE $02,$3A,$04,$3A,$04,$3A,$04,$3A
        .BYTE $0E,$3A,$04,$39,$02,$3A,$04,$3A
        .BYTE $04,$3A,$04,$3A,$0E,$3A,$04,$39
        .BYTE $10,$CE,$18,$41,$CE,$1B,$64,$99
        .BYTE $10,$97,$10,$96,$10,$94,$10,$92
        .BYTE $10,$90,$10,$CE,$18,$49,$CE,$1B
        .BYTE $0A,$8F,$BD,$C0,$08,$00,$F8,$FF
        .BYTE $08,$00,$48,$00,$03,$06,$03,$00
        .BYTE $0A,$05,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$08,$21,$18,$89,$14
        .BYTE $64,$06,$0C,$12,$18,$1E,$24,$2A
        .BYTE $30,$36,$3C,$42,$48,$4E,$54,$5A
        .BYTE $60,$14,$14,$00,$05,$14,$00,$EC
        .BYTE $FF,$00,$08,$D8,$04,$00,$04,$0C
        .BYTE $04,$DA,$C0,$C8,$EA,$BE,$C8,$46
        .BYTE $BC,$C8,$46,$BC,$C8,$46,$BC,$C8
        .BYTE $EA,$BE,$C8,$EA,$BE,$C8,$EA,$BE
        .BYTE $C6,$C6,$BE,$D8,$03,$1F,$04,$2B
        .BYTE $04,$DA,$1F,$04,$8B,$15,$C0,$BF
        .BYTE $02,$C2,$2C,$2C,$87,$BE,$BF,$01
        .BYTE $D8,$14,$1F,$04,$2B,$04,$DA,$D8
        .BYTE $07,$18,$04,$24,$04,$DA,$18,$02
        .BYTE $26,$06,$D8,$18,$1F,$04,$2B,$04
        .BYTE $DA,$D8,$07,$18,$04,$24,$04,$DA
        .BYTE $18,$02,$26,$06,$CE,$18,$41,$D8
        .BYTE $03,$1F,$04,$2B,$04,$DA,$1F,$04
        .BYTE $1E,$04,$C2,$17,$09,$B4,$BE,$D8
        .BYTE $07,$1C,$04,$28,$04,$DA,$1C,$02
        .BYTE $1A,$06,$CC,$BE,$BE,$1F,$CC,$BE
        .BYTE $BE,$18,$C8,$BE,$BE,$CC,$BE,$BE
        .BYTE $1A,$CC,$BE,$BE,$1F,$CC,$BE,$BE
        .BYTE $22,$CC,$BE,$BE,$1B,$CA,$00,$D8
        .BYTE $02,$1A,$04,$26,$04,$DA,$D8,$02
        .BYTE $1E,$04,$2A,$04,$DA,$CC,$BE,$BE
        .BYTE $1F,$CC,$BE,$BE,$22,$CC,$BE,$BE
        .BYTE $1B,$CA,$00,$7A,$6C,$15,$03,$17
        .BYTE $03,$18,$02,$1A,$02,$1C,$02,$1E
        .BYTE $02,$C6,$DE,$BE,$C5,$CE,$C4,$00
        .BYTE $2B,$04,$DA,$D8,$07,$18,$04,$24
        .BYTE $04,$DA,$18,$02,$26,$06,$CE,$18
        .BYTE $41,$D8,$03,$1F,$04,$2B,$04,$DA
        .BYTE $1F,$04,$1E,$04,$C2,$17,$09,$47
        .BYTE $BF,$D8,$07,$1C,$04,$28,$04,$DA
        .BYTE $1C,$02,$1A,$06,$CC,$51,$BF,$1F
        .BYTE $CC,$51,$BF,$18,$C8,$51,$BF,$CC
        .BYTE $51,$BF,$1A,$CC,$51,$BF,$1F,$CC
        .BYTE $51,$BF,$22,$CC,$51,$BF,$1B,$CA
        .BYTE $00,$D8,$02,$1A,$04,$26,$04,$DA
        .BYTE $D8,$02,$1E,$04,$2A,$04,$DA,$CC
        .BYTE $51,$BF,$1F,$CC,$51,$BF,$22,$CC
        .BYTE $51,$BF,$1B,$CA,$00,$7A,$6C,$15
        .BYTE $03,$17,$03,$18,$02,$1A,$02,$1C
        .BYTE $02,$1E,$02,$C6,$59,$BF,$C5,$CE
        .BYTE $C4,$00,$CE,$C4,$FF

PRINT_EXT_STR_BIS                       ;$C000
        JMP PRINT_EXT_STR

SWAP_CHARSETS_BIS                       ;$C003
        JMP SWAP_CHARSETS

MAIN_BIS                                ;$C006
        JMP MAIN

        JMP jCF17

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Swap charsets from $D000 to $7800
; Switches to $01 RAM/RAM/RAM during the copy.
; Restores $01 to RAM/IO/RAM after it finishes the copy.
; This function is always called with A=0
; If A != 0 it will break.
; Seems to have been copied from another game where more addresses were used.
;
; Params: A=0
SWAP_CHARSETS
        ASL A                           ;A *= 2
        TAX

        LDA _SRC_ADDR,X                 ;Load origin
        STA aFB
        LDA _SRC_ADDR+1,X
        STA aFC

        LDA _DST_ADDR,X                 ;Load destination
        STA aFD
        LDA _DST_ADDR+1,X
        STA aFE

        LDA _COPY_LEN,X                 ;It is always $ff
        STA _LEN_LSB
        LDA _COPY_LEN+1,X               ;It is always $07
        TAX
        LDA #$30                        ;#%00110000
        STA a01                         ; RAM / RAM / RAM

        ; Swap first block of $ff
        LDY #$00
_L00    LDA (pFD),Y
        STA _TMP
        LDA (pFB),Y
        STA (pFD),Y
        LDA _TMP
        STA (pFB),Y
        INY
        BNE _L00

        DEX
        BEQ _L01
        INC aFC
        INC aFE
        BNE _L00

_L01    INC aFC
        INC aFE
        LDA _LEN_LSB
        BEQ _L03

        ; Loop until all blocs have been swapped
_L02    LDA (pFD),Y
        STA _TMP
        LDA (pFB),Y
        STA (pFD),Y
        LDA _TMP
        STA (pFB),Y
        INY
_LEN_LSB = *+$01
        CPY #$FF
        BNE _L02

_L03    LDA #$35                        ;#%00110101
        STA a01                         ; RAM / IO / RAM
        RTS

_SRC_ADDR
        .WORD $D000
_DST_ADDR
        .WORD $7800
_COPY_LEN
        .WORD $07FF
_TMP   .BYTE $00

aC074
        JMP PRINT_EXT_STR

        JMP SWAP_CHARSETS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C07A
; Print extended string
; The string to print is in the ret-addr (in the stack)
; And the function returns to the ret-addr + 2
;
; Args:
;       Stack:          String to print
;
; Vars:
;       $FA/$FB:        Points to the string to print
;       $FC/$FD:        Points to the screen
;
; Codes:
;       $FF,$00:                End of string
;       $FF,$01, y, x:          Coordinates to start printing
;       $FF,$02, color:         Use color to print
;       $FF,$03: char, color:   Paint full screen
;       $FF,$04:                Use big font
;       $FF,$05:                Use small font
PRINT_EXT_STR
        PLA
        STA aFA
        PLA
        STA aFB                         ;String to use (stack) is stored in FA/FB
        LDA aFA
        CLC
        ADC #$02                        ;Re-write stack so that the ret address points to
        STA TMP_C19C                    ; to where it should return: callee + 2
        LDA aFB
        ADC #$00
        PHA
        LDA TMP_C19C
        PHA

        JSR POINT_TO_NEXT_CHAR
        JSR GET_CHAR
        PHA
        JSR GET_CHAR
        STA aFB
        PLA
        STA aFA

PROCESS_CHAR
        JSR GET_CHAR
        CMP #$FF                        ;Is it a special char?
        BNE _L01                        ; No, a regular char to print
        JSR PROCESS_STRING_CODE
        JMP PROCESS_CHAR

        ; Print chars
_L01    LDY FONT_SIZE
        CPY #$02
        BEQ _L02
        JMP PROCESS_SMALL_FONT_CHAR

        ; Big font
        ; The chars are layed-out as:
        ; char[n]   = top-left
        ; char[n+1] = top-right
        ; char[n+2] = bottom-left
        ; char[n+3] = bottom-right
        ; And Letter 'A' (the first one) starts at 64
_L02    CMP #59
        BCS _L03
        SEC
        SBC #18

_L03    ASL A                           ;Multiply by 4
        ASL A                           ; Since each letter has 4 chars
        CLC
        ADC #60                         ;And add 60, since letter A starts there.
        STA TMP_C19C                       ; Technically it starts at 64, but char 0 is A
                                        ; instead of char 1, so offset is 60 and not 64.

        LDX #$03                        ;Chars to print: 4
_L04    LDA TMP_C19C
        LDY BIG_LETTER_OFFSET,X
        JSR PRINT_CHAR_WITH_ATTRIBUTE
        INC TMP_C19C
        DEX
        BPL _L04

NEXT_CHAR
        JSR NEXT_SCREEN_COORDINATE
        JMP PROCESS_CHAR

PRINT_CHAR_WITH_ATTRIBUTE
        STA (pFC),Y                     ;Print the char
        LDA aFD                         ;And the color
        PHA
        AND #$03
        CLC
        ADC #$D8                        ;Switch to Color Screen
        STA aFD

        LDA CHAR_COLOR
        STA (pFC),Y
        PLA
        STA aFD                         ;Restore Screen pointer
        RTS

        ; Small font
PROCESS_SMALL_FONT_CHAR
        AND #$3F                        ;The small-font charset only contains 64 chars
        LDY #$00
        JSR PRINT_CHAR_WITH_ATTRIBUTE
        JMP NEXT_CHAR

        ; Update screen coordinate to point to next char
NEXT_SCREEN_COORDINATE
        LDA aFC
        CLC
        ADC FONT_SIZE
        STA aFC
        LDA aFD
        ADC #$00
        STA aFD
        RTS

        ; This is a special string code, process it.
PROCESS_STRING_CODE
        JSR GET_CHAR
        ASL A
        TAX
        LDA CODE_OFFSET_TBL+1,X
        PHA
        LDA CODE_OFFSET_TBL,X
        PHA
        RTS

BIG_LETTER_OFFSET                       ;Reverse order: from bottom-right to top-left
        .BYTE 41,40,1,0

CODE_OFFSET_TBL
        .WORD CODE_00-1
        .WORD CODE_01-1
        .WORD CODE_02-1
        .WORD CODE_03-1
        .WORD CODE_04-1
        .WORD CODE_05-1

CODE_04                                 ;Use Big font
        LDA #$02
        STA FONT_SIZE
        RTS

CODE_05                                 ;Use Small font
        LDA #$01
        STA FONT_SIZE
        RTS

FONT_SIZE
        .BYTE $02                       ;Default: Big size

        ; Paint screen with arg 1. Paint color screen with arg 2
CODE_03                                 ;Clear screen with char and color
        JSR GET_CHAR
        PHA
        JSR GET_CHAR
        TAX
        LDY #$C8     ;#%11001000
_L00    PLA
        ; Update screen
        STA $4000,Y                     ;Paint screen with first arg
        STA $40C8,Y
        STA $4190,Y
        STA $4258,Y
        STA $4320,Y
        PHA
        TXA
        ; Update color
        STA $D800,Y                     ;Paint color screen with 2nd arg
        STA $D8C8,Y
        STA $D990,Y
        STA $DA58,Y
        STA $DB20,Y
        DEY
        CPY #$FF
        BNE _L00

        PLA
        RTS

        ; Sets $FC/$FD to point to the correct screen coordinate
CODE_01                                 ;Set string start coordinates
        LDA #$00
        STA aFD
        JSR GET_CHAR
        STA TMP_C19C
        JSR GET_CHAR
        ASL A
        ASL A
        ASL A
        STA aC19D
        ASL A
        ROL aFD
        ASL A
        ROL aFD
        CLC
        ADC aC19D
        STA aFC
        LDA aFD
        ADC #$40     ;#%01000000
        STA aFD
        LDA aFC
        CLC
        ADC TMP_C19C
        STA aFC
        LDA aFD
        ADC #$00     ;#%00000000
        STA aFD
        RTS

TMP_C19C        .BYTE $B8
aC19D           .BYTE $B8
CHAR_COLOR      .BYTE $06

        ; Get current char and update pointer to next char
GET_CHAR
        LDY #$00                        ;Get char
        LDA (pFA),Y
        PHA
        JSR POINT_TO_NEXT_CHAR                       ;Update pointer to next char
        PLA
        RTS

POINT_TO_NEXT_CHAR
        INC aFA                         ;Point to next char
        BNE _L00
        INC aFB
_L00    RTS

CODE_02                                 ;Set color
        JSR GET_CHAR
        STA CHAR_COLOR
        RTS

CODE_00                                 ;End of string
        PLA
        PLA
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C1BA
; Main init
MAIN
        LDX #$F0                        ;Set stack
        TXS
        JSR INIT_HISCORE_TBL
        LDA #25                         ;FN = 25
        LDX #$0F                        ;Argument: Music to 15
        JSR MUSIC_FN

        LDA #$00                        ;Color Black
        STA $D021                       ;Background Color 0
        STA $D020                       ;Border Color
        STA $D022                       ;Background Color 1, Multi-Color Register 0
        STA $D015                       ;Sprite display Enable
        LDA #$8D                        ;'STA abs' opcode
        STA TITLE_TOGGLE_SMOOTH_Y       ; Patch code in runtime
                                        ; Enable smooth-y scrolling
        SEI
        LDA #$35                        ;#%00110101
        STA a01                         ; RAM / IO / RAM

        LDA #$00
        JSR SWAP_CHARSETS

        LDA #$96                        ;#%10010110
        STA $DD00                       ; CIA2: Data Port Register A
                                        ; VIC Bank 1 ($4000-$7FFF)
        LDA #$0F                        ;#%00001111
        STA $D018                       ; VIC Memory Control Register
                                        ; Charset:   $7800 (bank + $3800)
                                        ; Video RAM: $4000 (bank + $0000)
        LDA #$08                        ;#%00001000
        STA $D016                       ; VIC Control Register 2
                                        ; 40=cols, smooth_x=0, no MC

TITLE_MAIN_LOOP
        JSR PRINT_EXT_STR
        .ADDR STR_CLEAR_SCREEN

        LDA #$00
        STA aCFFF
        JSR INIT_INTERRUPTS
        JSR INIT_HISCORE_TBL_IDX
        JSR sC2FC

        JSR TITLE_SCROLLER_UP_INIT

        LDA HISCORE_TBL_IDX+$4F
        STA TMP_C19C
        ASL A
        CLC
        ADC TMP_C19C
        TAY
        LDX #$02
        LDA #$00
_L00    STA HISCORE_TBL,Y
        INY
        DEX
        BPL _L00

        LDA #$1B                        ;#%00011011
        STA $D011                       ; VIC Control Register 1
                                        ; Raster 8-bit = 0
        JSR TITLE_PRINT_CLEAR_SCREEN

        LDA #30
        JSR MUSIC_FN

        JSR TROOPER_INIT

        LDA #$00                        ;Use charset for game
        JSR SWAP_CHARSETS

        JSR GAME_INIT_BIS               ;Jump into game
                                        ; When it returns, it means that the game is over

        SEI
        LDA #$00
        STA $D015                       ;Sprite display Enable
        STA $D020                       ;Border Color
        STA $D021                       ;Background Color 0
        LDA #$08                        ;#%00001000
        STA $D016                       ;VIC Control Register 2

        LDA #$00                        ;Use charset for title
        JSR SWAP_CHARSETS

        LDA #$8D                        ;'STA abs' opcode
        STA TITLE_TOGGLE_SMOOTH_Y       ; Patch code in runtime
                                        ; Enable smooth-y scrolling
        LDA #$1B                        ;#%00011011
        STA $D011                       ; VIC Control Register 1
                                        ; Raster 8-bit = 0
        LDA HISCORE_TBL_IDX+$4F
        STA aC2D1
        JSR COPY_GAME_SCORE_TO_HISCORE_TBL

        LDA #$01
        JSR MUSIC_FN
        LDA #26
        LDX #$07
        JSR MUSIC_FN

        JSR sC2FC

        JSR MAYBE_DISPLAY_HISCORE
        JMP TITLE_MAIN_LOOP

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C276
; If the score is high enough, it enters in the hiscore table
; and the score is displayed.
; Otherwise it returns immediately
MAYBE_DISPLAY_HISCORE
        LDA aC2D1
        CMP HISCORE_TBL_IDX+$4F
        BNE _L00
        RTS

_L00    JSR PRINT_EXT_STR
        .ADDR STR_CLEAR_SCREEN

        JSR PRINT_EXT_STR
        .ADDR STR_CONGRATULATIONS_HIGH_SCORE

        LDX #$4F
        LDA aC2D1
_L01    CMP HISCORE_TBL_IDX,X
        BEQ _L02
        DEX
        BPL _L01

_L02    STX aCD72

        LDA #$08
        STA aCCD3
        JSR sCCD5

        JSR PRINT_EXT_STR
        .ADDR STR_PLAYER_HISCORE

        LDA #$05
        STA aC2D2
        JSR MUSIC_FN

_L03    JSR WAIT_RASTER_F8

        LDA #$00
        JSR MUSIC_FN

        DEC aC2D2
        BNE _L03

        LDA #$02
        STA aC2D2

        JSR sCCD5

        JSR PRINT_EXT_STR
        .ADDR STR_PLAYER_HISCORE

        JSR TITLE_READ_JOYSTICK

        LDA JOYSTICK_VALUE_FIRE
        BEQ _L03

        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

aC2D1   .BYTE $00
aC2D2   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
WAIT_RASTER_AND_PLAY_MUSIC
_L00    LDA TITLE_RASTER_TICK
        BEQ _L00
        DEC TITLE_RASTER_TICK

        LDA #$00                        ;Play the selected music
        JSR MUSIC_FN
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
COPY_GAME_SCORE_TO_HISCORE_TBL
        LDA HISCORE_TBL_IDX+$4F
        STA TMP_C19C
        ASL A
        CLC
        ADC TMP_C19C
        TAY                             ;Y = Index value * 3

        LDX #$00
_L00    JSR GET_SCORE_BCD_DIGIT_BIS
        STA HISCORE_TBL,Y
        INY
        INX
        CPX #$03
        BNE _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Something with the Hiscore / Hiscore index
sC2FC   LDA #$4E                        ;Index to HISCORE_TBL_IDX
        STA aC36D
        LDA #$00
        STA aC36C

_L00    LDY aC36D
        INY
        LDA HISCORE_TBL_IDX,Y
        ASL A
        CLC
        ADC HISCORE_TBL_IDX,Y
        STA aC6E9                       ;Index = Index * 3

        LDY aC36D
        LDA HISCORE_TBL_IDX,Y
        ASL A
        CLC
        ADC HISCORE_TBL_IDX,Y
        TAY                             ;Y = Index * 3
        JSR sC34B
        BCC _L01
        JMP _L02

_L01    LDY aC36D
        LDA HISCORE_TBL_IDX,Y
        PHA
        LDA HISCORE_TBL_IDX+1,Y
        STA HISCORE_TBL_IDX,Y
        PLA
        STA HISCORE_TBL_IDX+1,Y
        LDA #$01
        STA aC36C
_L02    DEC aC36D
        BPL _L00
        LDA aC36C
        BNE sC2FC
        RTS

        .BYTE $DD

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C34B
; Checks something with the hiscores... whether the score is equal to what ???
sC34B
        LDX #$00
_L00    LDA HISCORE_TBL,Y
        STY aC6EA
        LDY aC6E9
        CMP HISCORE_TBL,Y
        BEQ _L01
        LDY aC6EA
        RTS

_L01    LDY aC6EA
        INY
        INC aC6E9
        INX
        CPX #$03
        BNE _L00
        RTS

aC36C   .BYTE $00
aC36D   .BYTE $FF

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C36E
TROOPER_INIT
        LDA #$00
        STA $D011                       ;VIC Control Register 1
                                        ; Blank screen
        SEI
        LDA #$01                        ;Only one sprite, the mini cursor
        STA $D015                       ; Sprite display Enable
        JSR MUSIC_FN

        LDX #$00
        STX $D010                       ;Sprites 0-7 MSB of X coordinate
        STX $D01D                       ;Sprites Expand 2x Horizontal (X)
        STX $D020                       ;Border Color
        STX $D021                       ;Background Color 0
        STX TROOPER_NAME_CHAR_POS

        LDA #29
        STA aC651
        JSR MUSIC_FN

        JSR TROOPER_RESET_WAIT_FOR_JOY_DELAY

        LDA #$00
        STA aFF

        LDY #$09                        ;Name len: 10 chars
        LDA HISCORE_TBL_IDX+$4F         ;Whats' the last value
        ASL A
        STA TMP_C19C
        ASL A
        ROL aFF
        ASL A
        ROL aFF
        CLC
        ADC TMP_C19C
        BCC _L00
        INC aFF
_L00    CLC
        ADC #<HISCORE_NAMES_TBL
        STA aFE
        LDA aFF
        ADC #>HISCORE_NAMES_TBL
        STA aFF                         ;$FE/$FF points to the name to update

        LDA #$5B                        ;space
_L01    STA (pFE),Y
        DEY
        BPL _L01

        JSR PRINT_TROOPER_ENTER_YOUR_NAME
        JSR TITLE_READ_JOYSTICK

        LDA #$1B                        ;#%00011011
        STA $D011                       ;VIC Control Register 1
                                        ; Raster bit-8 disabled
        JSR TROOPER_MAIN_LOOP
        JSR WAIT_RASTER_F8

        LDA #$00
        STA $D015                       ;Disable all sprites

        JMP RESET_SCORE_BIS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
WAIT_RASTER_F8
        LDA #$F8
_L00    CMP $D012    ;Raster Position
        BNE _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C3E6
INIT_HISCORE_TBL_IDX
        LDY #$00
_L00    TYA
        STA HISCORE_TBL_IDX,Y
        INY
        CPY #$50
        BNE _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TROOPER_MAIN_LOOP
        JSR WAIT_RASTER_F8
        LDA #$00
        JSR MUSIC_FN
        JSR TROOPER_UPDATE_COLOR_IDX
        JSR TITLE_READ_JOYSTICK
        JSR TROOPER_UPDATE_MINI_CURSOR_POS
        JSR sC655
        JSR TROOPER_PRINT_NAME
        JSR TROOPER_CALCULATE_MINI_CURSOS_POS
        JSR TROOPER_MAYBE_NEW_CHAR
        JSR TROOPER_PRINT_BLINKY_CURSOR
        JSR TROOPER_EXIT_IF_NO_JOY_INPUT
        JMP TROOPER_MAIN_LOOP

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TROOPER_PRINT_BLINKY_CURSOR
        LDA TROOPER_NAME_CHAR_POS
        ASL A
        CLC
        ADC #$0A
        STA TEXT_TROOPER_BLINKY_CURSOR_COORD_X
        LDX TROOPER_COLOR_IDX
        LDA TROOPER_COLOR_TBL,X
        STA TEXT_TROOPER_BLINKY_CURSOR_COLOR

        JSR PRINT_EXT_STR
        .ADDR STR_TROOPER_BLINKY_CURSOR

        RTS

TEXT_TROOPER_BLINKY_CURSOR_COORD_X   = *+2
STR_TROOPER_BLINKY_CURSOR
        #STR_CODE_SET_COORDS $00,$16
TEXT_TROOPER_BLINKY_CURSOR_COLOR   = *+2
        #STR_CODE_SET_COLOR $00
        .TEXT ":["                      ; ': '
        #STR_CODE_END

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Sets the default values for the hi-scores table
INIT_HISCORE_TBL
        LDX #79
        LDY #$00
        SED
        LDA #$81
_L00    SEC
        SBC #$01
        STA TMP_C19C
        ASL A
        ASL A
        ASL A
        ASL A
        STA HISCORE_TBL+1,Y

        LDA TMP_C19C
        LSR A
        LSR A
        LSR A
        LSR A
        STA HISCORE_TBL,Y
        LDA TMP_C19C
        INY
        INY
        INY

        DEX
        BPL _L00

        CLD
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; If the Joystick is not moved after 256 vertical retraces,
; exit the Trooper main loop, and use "UNKNOWN" as name
TROOPER_EXIT_IF_NO_JOY_INPUT
        LDA JOYSTICK_VALUE_FIRE
        BNE TROOPER_RESET_WAIT_FOR_JOY_DELAY
        LDA JOYSTICK_VALUE_LEFT
        BNE TROOPER_RESET_WAIT_FOR_JOY_DELAY
        LDA JOYSTICK_VALUE_RIGHT
        BNE TROOPER_RESET_WAIT_FOR_JOY_DELAY

        INC TROOPER_WAIT_FOR_JOY_DELAY_LO
        BNE bC49C
        INC TROOPER_WAIT_FOR_JOY_DELAY_HI
        LDA TROOPER_WAIT_FOR_JOY_DELAY_HI
        CMP #$02
        BNE bC49C

        ; Use "UNKNWON" as name and return exit Troope's main loop
        JSR USE_UNKNOWN_AS_NAME
        PLA
        PLA
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C489
; Updates player name with "UNKNOWN"
USE_UNKNOWN_AS_NAME
        LDY #$09                        ;Name len = 10 chars
_L00    LDA UNKNOWN_NAME,Y
        STA (pFE),Y
        DEY
        BPL _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TROOPER_RESET_WAIT_FOR_JOY_DELAY
        LDA #$00
        STA TROOPER_WAIT_FOR_JOY_DELAY_LO
        STA TROOPER_WAIT_FOR_JOY_DELAY_HI
bC49C   RTS

TROOPER_WAIT_FOR_JOY_DELAY_LO   .BYTE $00
TROOPER_WAIT_FOR_JOY_DELAY_HI   .BYTE $00
UNKNOWN_NAME
        .TEXT "]UNKNOWN]["              ;Player Name: Unknown

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TROOPER_PRINT_NAME
        LDY #$09
_L00    LDA (pFE),Y
        STA TROOPER_NAME_TEXT,Y
        DEY
        BPL _L00

        JSR PRINT_EXT_STR
        .ADDR STR_TROOPER_NAME

        RTS

STR_TROOPER_NAME
        #STR_CODE_SET_COORDS $0A,$16
        #STR_CODE_SET_COLOR $01
        #STR_CODE_FONT_BIG
TROOPER_NAME_TEXT
        .TEXT "[[[[[[[[UD"
        #STR_CODE_END

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TROOPER_MAYBE_NEW_CHAR
        LDA JOYSTICK_VALUE_FIRE
        BNE _L00
        RTS

_L00    LDX aC651
        LDA fC72C,X
        JSR TROOPER_PROCESS_SPECIAL_CHAR
        LDY TROOPER_NAME_CHAR_POS
        CPY #$0A
        BEQ _L01
        STA (pFE),Y
        INC TROOPER_NAME_CHAR_POS
_L01    RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C4EA
TROOPER_PROCESS_SPECIAL_CHAR
        CPX #$1B                        ;Is it "RUB"? (backspace)
        BNE _L01                        ; No

        LDY TROOPER_NAME_CHAR_POS                       ; Yes, it is backspace
        BEQ _L00
        DEC TROOPER_NAME_CHAR_POS
        DEY
        LDA #$5B                        ;space
        STA (pFE),Y
_L00    PLA
        PLA
        RTS

_L01    CPX #$1C                        ;Is it Heart?
        BNE _L02                        ; No
        LDA #$5D                        ; Yes, select 'heart' as big char
        RTS

_L02    CPX #$1A                        ;Is it space?
        BNE _L03                        ; No

        LDA #$5B                        ; Yes, select 'space' as big char
        RTS

_L03    CPX #$1D                        ;Is it "END"?
        BNE _EXIT                       ; No

        ; It is end
        LDA #$00                        ;Blank screen
        STA $D011                       ;VIC Control Register 1
        LDA #$01
        JSR MUSIC_FN
        SEI
        LDA TROOPER_NAME_CHAR_POS       ;If there is no selected name
        BNE _L04                        ; then use "UNKNOWN"
        JSR USE_UNKNOWN_AS_NAME         ; as the player's name

        ; Exit TROOPER_MAIN_LOOP
_L04    PLA
        PLA
        PLA
        PLA
_EXIT   RTS

TROOPER_NAME_CHAR_POS   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TROOPER_UPDATE_COLOR_IDX
        LDA _TROOPER_COLOR_DELAY
        BEQ _L00
        DEC _TROOPER_COLOR_DELAY
        RTS

_L00    LDA #$02
        STA _TROOPER_COLOR_DELAY
        LDX TROOPER_COLOR_IDX
        LDA fC551,X
        DEX                             ;Color index can be between 7-0
        BPL _L01
        LDX #$07
_L01    STX TROOPER_COLOR_IDX
        RTS

_TROOPER_COLOR_DELAY    .BYTE $00
TROOPER_COLOR_IDX       .BYTE $00
        .BYTE $00
TROOPER_COLOR_TBL       .BYTE $00,$0B,$0C,$0F,$01,$0F,$0C,$0B
fC551                   .BYTE $00,$06,$0E,$03,$01,$03,$0E,$06

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
PRINT_TROOPER_ENTER_YOUR_NAME
        LDA #$01                        ;Bug? Sprite Frame: Garbage
        STA GAME_SPR_FRAME_TBL+1

        JSR PRINT_EXT_STR
        .ADDR STR_TROOPER_ENTER_YOUR_NAME

        RTS

STR_TROOPER_ENTER_YOUR_NAME
        #STR_CODE_FONT_BIG
        #STR_CODE_SET_COORDS $0D,$13
        #STR_CODE_SET_COLOR $05
        .TEXT "TROOPER"
        #STR_CODE_SET_COORDS $05,$00
        .TEXT "ENTER[YOUR[NAME"
        #STR_CODE_END

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TITLE_READ_JOYSTICK
        LDA #$00
        LDX #$05
_L00    STA JOYSTICK_VALUE_RIGHT,X
        DEX
        BPL _L00

        LDA $DC00                       ;Read Joy port #1
        AND $DC01                       ;Read Joy port #2
        EOR #$FF                        ; Flip bits since they are active low
        AND #$1F                        ; Mask direction and button
        STA JOYSTICK_VALUE_ALL
        LSR A
        ROL JOYSTICK_VALUE_UP
        LSR A
        ROL JOYSTICK_VALUE_DOWN
        LSR A
        ROL JOYSTICK_VALUE_LEFT
        LSR A
        ROL JOYSTICK_VALUE_RIGHT
        LSR A
        ROL JOYSTICK_VALUE_FIRE

        ; Prevents having the fire button triggering more than once
        LDA JOYSTICK_VALUE_FIRE
        CMP JOYSTICK_PREV_VALUE_FIRE
        BEQ _L01
        STA JOYSTICK_PREV_VALUE_FIRE
        RTS

_L01    LDA #$00
        STA JOYSTICK_VALUE_FIRE
        RTS

        RTS

JOYSTICK_PREV_VALUE_FIRE        .BYTE $00
JOYSTICK_VALUE_RIGHT            .BYTE $00
JOYSTICK_VALUE_LEFT             .BYTE $00
JOYSTICK_VALUE_DOWN             .BYTE $00
JOYSTICK_VALUE_UP               .BYTE $00
JOYSTICK_VALUE_FIRE             .BYTE $00
JOYSTICK_VALUE_ALL              .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TROOPER_UPDATE_MINI_CURSOR_POS
        LDA TROOPER_MINI_CURSOR_POS_X
        STA $D000                       ;Sprite 0 X Pos
        LDA TROOPER_MINI_CURSOR_POS_Y
        STA $D001                       ;Sprite 0 Y Pos
        LDA TROOPER_MINI_CURSOR_POS_X_MSB
        STA $D010                       ;Sprites 0-7 MSB of X coordinate
        LDA #223                        ;Mini cursor sprite frame
        STA GAME_SPR_FRAME_TBL

        ; Blink "ENTER YOUR NAME" and the Mini cursor
        LDX TROOPER_COLOR_IDX
        LDY #29
        LDA TROOPER_COLOR_TBL,X
        STA $D027                       ;Sprite 0 Color
_L00    STA $D800+40*1+5,Y              ;Update screen color
        STA $D800+40*0+5,Y              ; for "ENTER YOUR NAME"
        DEY
        BPL _L00
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
sC5FA   LDA JOYSTICK_VALUE_LEFT
        BNE bC616
        LDA JOYSTICK_VALUE_RIGHT
        BNE bC605
        RTS

bC605   LDA aC651
        CMP #$1D     ;#%00011101
        BEQ bC610
        INC aC651
        RTS

bC610   LDA #$00     ;#%00000000
        STA aC651
        RTS

bC616   LDA aC651
        BEQ bC61F
        DEC aC651
        RTS

bC61F   LDA #$1D     ;#%00011101
        STA aC651
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
TROOPER_CALCULATE_MINI_CURSOS_POS
        LDX aC651
        LDA fC6EC,X
        CLC
        ADC #$09     ;#%00001001
        ADC #$02     ;#%00000010
        ASL A
        ASL A
        ASL A
        PHP
        CLC
        ADC #$06     ;#%00000110
        STA TROOPER_MINI_CURSOR_POS_X
        PLP
        LDA #$00     ;#%00000000
        ROL A
        STA TROOPER_MINI_CURSOR_POS_X_MSB
        LDA fC70C,X
        CLC
        ADC #$03     ;#%00000011
        ASL A
        ASL A
        ASL A
        CLC
        ADC #$31     ;#%00110001
        STA TROOPER_MINI_CURSOR_POS_Y
        RTS

aC651   .BYTE $00
TROOPER_MINI_CURSOR_POS_X          .BYTE $00
TROOPER_MINI_CURSOR_POS_X_MSB      .BYTE $00
TROOPER_MINI_CURSOR_POS_Y          .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
sC655   LDA aC65E
        BEQ bC65F
        DEC aC65E
        RTS

aC65E   .BYTE $00

bC65F   LDA #$03     ;#%00000011
        STA aC65E
        JSR sC69D
        JSR sC5FA
        LDX #$1F     ;#%00011111
bC66C   LDA fC70C,X
        CLC
        ADC #$03     ;#%00000011
        JSR sC6C7
        LDA fC6EC,X
        CLC
        ADC #$09     ;#%00001001
        TAY
        LDA fC72C,X
        AND #$3F     ;#%00111111
        STA (pFB),Y
        LDA aFC
        CLC
        ADC #$98     ;#%10011000
        STA aFC
        STX aC6B1
        TXA
        AND #$07     ;#%00000111
        TAX
        LDA fC6B2,X
        LDX aC6B1
        STA (pFB),Y
        DEX
        BPL bC66C
        RTS

sC69D   LDX #$07     ;#%00000111
        LDA aC6B9
        PHA
bC6A3   LDA aC6B1,X
        STA fC6B2,X
        DEX
        BNE bC6A3
        PLA
        STA fC6B2
        RTS

aC6B1   .BYTE $00
fC6B2   .BYTE $00,$06,$02,$04,$05,$03,$07
aC6B9   .BYTE $01
COLOR_FOR_HISCORE_TBL
        .BYTE $00,$06,$02,$04,$05,$03,$07,$01
        .BYTE $07,$03,$05,$04,$02

sC6C7   PHA
        LDA #$00     ;#%00000000
        STA aFB
        STA aFC
        PLA
        ASL A
        ASL A
        ASL A
        STA aC6E8
        ASL A
        ROL aFC
        ASL A
        ROL aFC
        CLC
        ADC aC6E8
        STA aFB
        LDA #$40     ;#%01000000
        ADC aFC
        STA aFC
        RTS

aC6E8   .BYTE $00
aC6E9   .BYTE $03
aC6EA   .BYTE $00,$00
fC6EC   .BYTE $0C,$0E,$10,$11,$12,$13,$14,$14
        .BYTE $16,$15,$13,$11,$0F,$0D,$0B,$09
        .BYTE $07,$05,$03,$01,$00,$02,$02,$03
        .BYTE $04,$05,$06,$07,$09,$0A,$0B,$08
fC70C   .BYTE $00,$01,$02,$03,$04,$06,$08,$0A
        .BYTE $0C,$0D,$0D,$0D,$0C,$0B,$0B,$0B
        .BYTE $0C,$0D,$0D,$0D,$0C,$0A,$08,$06
        .BYTE $04,$03,$02,$01,$00,$00,$00,$01
fC72C   .TEXT "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        .BYTE $5F,$61,$5C,$5D,$5E,$62

TITLE_PRINT_CLEAR_SCREEN
        JSR PRINT_EXT_STR
        .ADDR STR_TITLE_CLEAR_SCREEN
        RTS

STR_TITLE_CLEAR_SCREEN
        #STR_CODE_CLR_SCREEN $00,$20            ;Bug? Reverse order. Should be $20,$00
        #STR_CODE_END

STR_TITLE_RAMBO
        #STR_CODE_SET_COLOR $07
        #STR_CODE_FONT_BIG
        #STR_CODE_SET_COORDS $0F,$00
        .TEXT "RAMBO"
        #STR_CODE_FONT_SMALL
        .TEXT "TM"
        #STR_CODE_FONT_BIG
        #STR_CODE_SET_COORDS $09,$03
        #STR_CODE_SET_COLOR $02
        .TEXT "FIRST[BLOOD"
        #STR_CODE_FONT_SMALL
        .TEXT "TM"
        #STR_CODE_FONT_BIG
        #STR_CODE_SET_COORDS $0D,$06
        #STR_CODE_SET_COLOR $03
        .TEXT "PART[II"
        #STR_CODE_FONT_SMALL
        #STR_CODE_SET_COORDS $0C,$09
        #STR_CODE_SET_COLOR $05
        .TEXT "ALL[TIME[HEROES"
        #STR_CODE_FONT_BIG
        #STR_CODE_END

STR_CONGRATULATIONS_HIGH_SCORE
        #STR_CODE_SET_COLOR $0F
        #STR_CODE_SET_COORDS $05,$00
        .TEXT "CONGRATULATIONS"
        #STR_CODE_SET_COORDS $09,$03
        #STR_CODE_SET_COLOR $05
        .TEXT "YOU[ARE[NOW"
        #STR_CODE_SET_COORDS $03,$06
        #STR_CODE_SET_COLOR $07
        .TEXT "AMONG[OTHER[GREAT"
        #STR_CODE_SET_COORDS $07,$09
        #STR_CODE_SET_COLOR $0A
        .TEXT "BATTLE[HEROES"
        #STR_CODE_SET_COORDS $08,$0C
        #STR_CODE_SET_COLOR $03
        .TEXT "IN[THE[RAMBO"
        #STR_CODE_SET_COORDS $04,$0F
        #STR_CODE_SET_COLOR $0E
        .TEXT "HIGH[SCORE[RANKS"
        #STR_CODE_END

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $C82E
TITLE_SCROLLER_UP_INIT
        LDA #$01
        JSR MUSIC_FN

        LDA #26
        LDX #$07
        JSR MUSIC_FN

        LDA #$03                        ;Select "scroller up" music
        JSR MUSIC_FN

jC83F   LDA #$08
        STA aCCD3
        LDA #$00
        STA TITLE_SCROLL_Y_READY_FOR_NEW_LINE
        STA TITLE_SMOOTH_Y
        STA aCFFF

        ; Clear rows 21 and 22
        LDA #$20                        ;space
        LDX #39
_L00    STA $4000+40*21,X
        STA $4000+40*22,X
        DEX
        BPL _L00

        JSR PRINT_EXT_STR
        .ADDR STR_TITLE_RAMBO

        LDA #$00
bC863   STA aCD72

        JSR sCCD5

        JSR PRINT_EXT_STR
        .ADDR STR_PLAYER_HISCORE

jC86E   JSR WAIT_RASTER_AND_PLAY_MUSIC
        JSR SCREEN_SCROLL_UP_ONE_ROW
        JSR TITLE_READ_JOYSTICK
        LDA JOYSTICK_VALUE_FIRE
        BNE bC884
        LDA TITLE_SCROLL_Y_READY_FOR_NEW_LINE
        BNE bC885
        JMP jC86E

bC884   RTS

bC885   DEC TITLE_SCROLL_Y_READY_FOR_NEW_LINE
bC888   JSR WAIT_RASTER_AND_PLAY_MUSIC
        JSR SCREEN_SCROLL_UP_ONE_ROW
        JSR TITLE_READ_JOYSTICK
        LDA JOYSTICK_VALUE_FIRE
        BNE bC884
        LDA TITLE_SCROLL_Y_READY_FOR_NEW_LINE
        BEQ bC888
        DEC TITLE_SCROLL_Y_READY_FOR_NEW_LINE

        ; Clear rows 23 and 24
        LDY #39
        LDA #$20                        ;space
_L00    STA $4000+40*23,Y
        STA $4000+40*24,Y
        DEY
        BPL _L00

bC8AB   JSR WAIT_RASTER_AND_PLAY_MUSIC
        JSR SCREEN_SCROLL_UP_ONE_ROW
        JSR TITLE_READ_JOYSTICK
        LDA JOYSTICK_VALUE_FIRE
        BNE bC884
        LDA TITLE_SCROLL_Y_READY_FOR_NEW_LINE
        BEQ bC8AB
        DEC TITLE_SCROLL_Y_READY_FOR_NEW_LINE
        LDA aCD72
        CLC
        ADC #$01
        CMP #$50
        BCC bC863
        CMP #$54
        STA aCD72
        BCC jC86E

        JSR PRINT_EXT_STR
        .ADDR STR_TITLE_INSTRUCTIONS_WORD

; $C8D7
        LDA #$00
        STA aCFFF
        LDA #<SCROLLING_UP_TEXT
        STA aFE
        LDA #>SCROLLING_UP_TEXT
        STA aFF

        ; Reads from the lines to scroll.
        ; A copies each line, one-by-one, in a temporal
        ; buffer.
        ; And this temporal buffer is printed using the
        ; PRINT_EXT_STR function
_L00    LDY #$00
_L01    LDA (pFE),Y                     ;Read char to print
        BMI _L02                        ;Is it special char? Yes
        STA INSTRUCTIONS_ROW,Y          ; No?,just place it in buffer
        INY                             ;Next char
        JMP _L01

_L02    TAX                             ;Save special char in X
        INY
        LDA (pFE),Y                     ;Load next char (special modifier)
        PHA                             ;Push special-modifier char
        INY
        TYA
        STY aCCD4                       ;Save next char in tmp variable
        CLC
        ADC aFE                         ;Update index of buffer to print
        STA aFE
        BCC _L03
        INC aFF

_L03    PLA                             ;Pop special-modifier
        STA INSTRUCTIONS_COLOR          ;Save it
        TAY
        CPX #$FF                        ;Special is #ff ?
        BNE _L04                        ; No

        LDA #$2C                        ;'BIT abs' opcode
        STA TITLE_TOGGLE_SMOOTH_Y       ; Patch code in runtime
                                        ; Disable smooth-y scrolling

_L04    CPX #$FE                        ;Special is #fe ?
        BNE _L05                        ; No

        JMP jC83F

_L05    TYA
        AND #$10
        LSR A
        LSR A
        LSR A
        LSR A
        CLC
        ADC #$04
        STA INSTRUCTIONS_FONT_SIZE
        LDY aCCD4
        DEY
        DEY
        LDA #$FF                        ;Place "END STR"
        STA INSTRUCTIONS_ROW,Y
        LDA #$00
        STA INSTRUCTIONS_ROW+1,Y

        JSR PRINT_EXT_STR
        .ADDR STR_TITLE_INSTRUCTIONS_ONE_ROW

_L06    JSR WAIT_RASTER_AND_PLAY_MUSIC
        JSR SCREEN_SCROLL_UP_ONE_ROW
        JSR TITLE_READ_JOYSTICK
        LDA aCFFF
        BNE _L07
        LDA JOYSTICK_VALUE_ALL
        BEQ _L08
        AND #$10                        ;Joystick fire?
        BNE _L09                        ; Yes

_L07    LDA #$00
        STA aCFFF
        LDA #$8D                        ;'STA abs' opcode
        STA TITLE_TOGGLE_SMOOTH_Y       ; Enable smooth-y scrolling

_L08    LDA TITLE_SCROLL_Y_READY_FOR_NEW_LINE
        BEQ _L06
        DEC TITLE_SCROLL_Y_READY_FOR_NEW_LINE
        JMP _L00

_L09    LDX #$8D                        ;'STA abs' opcode
        STX TITLE_TOGGLE_SMOOTH_Y       ; Enable smooth-y scrolling
        RTS

        ; WTF: Two different way to encode special chars?
SCROLLING_UP_TEXT
        .TEXT "[[[[[[YOU[HAVE[CHOSEN[TO[BECOME[AN[[[[[["
        .BYTE $80,$91                   ;Color White
        .TEXT "[[[[[[[[[[AMERICAN[PEACETIME[HERO[[[[[[["
        .BYTE $80,$91                   ;Color White
        .TEXT "[[[[PLACE[YOUR[WEAPON[INTO[PORT[TWO[[[[["
        .BYTE $80,$93                   ;Color Cyan
        .TEXT "[[YOUR[MISSION[IS[TO[RETURN[TO[VIETNAM[["
        .BYTE $80,$91                   ;Color White
        .TEXT "[[[[ON[A[RECONNAISANCE[EXERCISE[TO[[[[[["
        .BYTE $80,$91                   ;Color White
        .TEXT "[[[ESTABLISH[WHETHER[P<O<W;S[ARE[STILL[["
        .BYTE $80,$91                   ;Color White
        .TEXT "[[[[[[[[BEING[HELD[CAPTIVE<<<[[[[[[[[[[["
        .BYTE $80,$91                   ;Color White
        .TEXT "[YOU[MUST[UNDER[NO[CIRCUMSTANCES[ENGAGE["
        .BYTE $80,$95                   ;Color Green
        .TEXT "[[[[[[[[[[[[[[[THE[ENEMY[[[[[[[[[[[[[[[["
        .BYTE $80,$95                   ;Color Green
        .TEXT "[[[[[[[[MOVE[JOYSTICK[TO[CONTINUE[[[[[[["
        .BYTE $80,$93,$80,$93           ;Color Cyan

        .TEXT "[[[[[[[[SPACE[BAR[SELECTS[WEAPON[[[[[[[["
        .BYTE $FF,$93                   ;Color Cyan
        .TEXT "[[[[[=S=[TOGGLES[MUSIC[AND[SOUND[FX[[[[["
        .BYTE $80,$93                   ;Color Cyan
        .TEXT "[=RUN[STOP=[TOGGLES[SUSPENDED[ANIMATION["
        .BYTE $80,$93                   ;Color Cyan
        ; Empty Line
        .BYTE $80,$95                   ;Color Green
        .TEXT "[[[WATCH[OUT[FOR[EXTRA[WEAPONS[IN[THE[[["
        .BYTE $80,$95                   ;Color Green
        .TEXT "[[[[[[[TERRAIN[AND[ENEMY[CAMPSITE[[[[[[["
        .BYTE $80,$95                   ;Color Green
        ; Empty Line
        .BYTE $80,$91                   ;Color White
        .TEXT "[[[[[[[WHETHER[YOU[SUCCEED[OR[NOT[[[[[[["
        .BYTE $80,$91                   ;Color White
        ; Empty Line
        .BYTE $80,$91
        .TEXT "[[[[IS[UP[TO[YOU[[[["
        .BYTE $80,$81                   ;Big Font
        .BYTE $80,$91                   ;Color White
        .TEXT "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[["
        .BYTE $80,$91,$FF,$91,$FE,$91

STR_TITLE_INSTRUCTIONS_WORD
        #STR_CODE_SET_COORDS $0B,$09
        #STR_CODE_SET_COLOR $01
        #STR_CODE_FONT_SMALL
        .TEXT "   INSTRUCTIONS "
        #STR_CODE_END

STR_TITLE_INSTRUCTIONS_ONE_ROW
        #STR_CODE_SET_COORDS $00,$17
INSTRUCTIONS_FONT_SIZE = *+1
        #STR_CODE_FONT_SMALL
INSTRUCTIONS_COLOR = *+2
        #STR_CODE_SET_COLOR $00
        ; 40 spaces
INSTRUCTIONS_ROW
        .TEXT "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[["
        #STR_CODE_END

        .BYTE $FF,$00,$00,$00,$00,$00   ;Garbage (?)

STR_CLEAR_SCREEN
        #STR_CODE_CLR_SCREEN $20,$01
        #STR_CODE_FONT_BIG
        #STR_CODE_END

STR_PLAYER_HISCORE
        #STR_CODE_SET_COORDS $00,$17
PLAYER_HISCORE_COLOR   = *+2
        #STR_CODE_SET_COLOR $06
PLAYER_HISCORE_STR_POSITION
        .TEXT "[7"                      ;Postion goes here
        .TEXT "\"                       ;'\' is period in big font (?)
PLAYER_HISCORE_STR_NAME
        .TEXT "\\\\\\\\\\"              ;Name goes here
        .TEXT "["                       ;Space
PLAYER_HISCORE_STR_SCORE
        .TEXT "074000"                  ;Score goes here
        #STR_CODE_END

aCCD3   .BYTE $01
aCCD4   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Cycles color of high score, and updtes the score (?)
sCCD5   LDY aCD72
        LDX aCCD3
        CPX #$01
        BNE _L00

        LDX #$0D
_L00    DEX
        STX aCCD3
        LDA COLOR_FOR_HISCORE_TBL,X
        STA PLAYER_HISCORE_COLOR
        LDX #$00
        TYA
        CLC
        ADC #$01
_L01    SEC
        SBC #$0A
        BCC _L02
        INX
        BNE _L01

_L02    ADC #$0A
        CLC
        ADC #$30                        ;0
        STA PLAYER_HISCORE_STR_POSITION+1
        CPX #$00
        BNE _L03
        LDA #$5B                        ;space
        STA PLAYER_HISCORE_STR_POSITION
        JMP _L04

_L03    TXA
        CLC
        ADC #$30                        ;0
        STA PLAYER_HISCORE_STR_POSITION
_L04    LDA #$00
        STA aFE
        STA aFF
        LDA HISCORE_TBL_IDX,Y
        TAX
        ASL A
        STA TMP_C19C
        ASL A
        ROL aFF
        ASL A
        ROL aFF
        ADC TMP_C19C
        BCC _L05
        INC aFF
_L05    CLC
        ADC #$F0
        STA aFE
        LDA aFF
        ADC #$B0
        STA aFF
        LDY #$09
_L06    LDA (pFE),Y
        STA PLAYER_HISCORE_STR_NAME,Y
        DEY
        BPL _L06
        TXA
        STA TMP_C19C
        ASL A
        CLC
        ADC TMP_C19C
        TAY
        LDX #$00
_L07    LDA HISCORE_TBL,Y
        AND #$0F
        CLC
        ADC #$30
        STA PLAYER_HISCORE_STR_SCORE+1,X
        LDA HISCORE_TBL,Y
        AND #$F0
        LSR A
        LSR A
        LSR A
        LSR A
        CLC
        ADC #$30
        STA PLAYER_HISCORE_STR_SCORE,X
        INY
        INX
        INX
        CPX #$06
        BNE _L07
        RTS

aCD72   .BYTE $06

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $CD73
SCREEN_SCROLL_UP_ONE_ROW
        LDA TITLE_SCROLL_Y_READY_FOR_NEW_LINE
        BNE _L00
        RTS

        ; Scroll up one row from row 24 to row 10
_L00    LDY #$00
_L01    LDA $4000+40 * 11 + 0,Y
        STA $4000+40 * 10 + 0,Y
        LDA $D800+40 * 11 + 0,Y
        STA $D800+40 * 10 + 0,Y

        LDA $4000+40 * 12 + 0,Y
        STA $4000+40 * 11 + 0,Y
        LDA $D800+40 * 12 + 0,Y
        STA $D800+40 * 11 + 0,Y

        LDA $4000+40 * 13 + 0,Y
        STA $4000+40 * 12 + 0,Y
        LDA $D800+40 * 13 + 0,Y
        STA $D800+40 * 12 + 0,Y

        LDA $4000+40 * 14 + 0,Y
        STA $4000+40 * 13 + 0,Y
        LDA $D800+40 * 14 + 0,Y
        STA $D800+40 * 13 + 0,Y

        LDA $4000+40 * 15 + 0,Y
        STA $4000+40 * 14 + 0,Y
        LDA $D800+40 * 15 + 0,Y
        STA $D800+40 * 14 + 0,Y

        LDA $4000+40 * 16 + 0,Y
        STA $4000+40 * 15 + 0,Y
        LDA $D800+40 * 16 + 0,Y
        STA $D800+40 * 15 + 0,Y

        LDA $4000+40 * 17 + 0,Y
        STA $4000+40 * 16 + 0,Y
        LDA $D800+40 * 17 + 0,Y
        STA $D800+40 * 16 + 0,Y

        LDA $4000+40 * 18 + 0,Y
        STA $4000+40 * 17 + 0,Y
        LDA $D800+40 * 18 + 0,Y
        STA $D800+40 * 17 + 0,Y

        LDA $4000+40 * 19 + 0,Y         ;Color updated in next loop
        STA $4000+40 * 18 + 0,Y         ; Bug? Why was the loop split in two?
        INY
        CPY #40
        BNE _L01

        LDY #$00
_L02    LDA $D800+40 * 19 + 0,Y
        STA $D800+40 * 18 + 0,Y

        LDA $4000+40 * 20 + 0,Y
        STA $4000+40 * 19 + 0,Y
        LDA $D800+40 * 20 + 0,Y
        STA $D800+40 * 19 + 0,Y

        LDA $4000+40 * 21 + 0,Y
        STA $4000+40 * 20 + 0,Y
        LDA $D800+40 * 21 + 0,Y
        STA $D800+40 * 20 + 0,Y

        LDA $4000+40 * 22 + 0,Y
        STA $4000+40 * 21 + 0,Y
        LDA $D800+40 * 22 + 0,Y
        STA $D800+40 * 21 + 0,Y

        LDA $4000+40 * 23 + 0,Y
        STA $4000+40 * 22 + 0,Y
        LDA $D800+40 * 23 + 0,Y
        STA $D800+40 * 22 + 0,Y

        LDA $4000+40 * 24 + 0,Y
        STA $4000+40 * 23 + 0,Y
        LDA $D800+40 * 24 + 0,Y
        STA $D800+40 * 23 + 0,Y

        INY
        CPY #40
        BNE _L02
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $CE30
INIT_INTERRUPTS
        SEI
        LDA #<TITLE_IRQ_HANDLER
        STA $FFFE                       ;IRQ
        LDA #>TITLE_IRQ_HANDLER
        STA $FFFF                       ;IRQ
        LDA #$C8
        STA $D012                       ;Raster Position
        LDA #$1B                        ;#%00011011
        STA $D011                       ; VIC Control Register 1
                                        ; Turn off bit-8 in raster
        LDA #$01                        ;Enable Interrupts
        STA $D01A                       ; Raster interrupt
        STA $DC0D                       ; Timer A interrupt
        LDA $DC0D                       ;ACK Timer A interrupt
        LDA #$7F                        ;#%01111111
        STA $D019                       ;ACK Raster interrupt
        LDA #$00
        STA a02
        LDA #$35                        ;RAM / IO / RAM
        STA a01
        CLI
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $CE5F
; Unused, it seems that nobody is calling this function
NMI_HANDLER
        LDA #$36                        ;RAM / IO / KERNAL
        STA a01
        JMP $FE66                       ;Warm start basic

aCE66
        LDA #<NMI_HANDLER
        STA $FFFA                       ;NMI LO
        LDA #>NMI_HANDLER
        STA $FFFB                       ;NMI HI
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $CE71
; IRQ Handler
TITLE_IRQ_HANDLER
        PHA
        TYA
        PHA
        TXA
        PHA
        LDA #$01
        STA $D019                       ;ACK Raster interrupt
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
_ADDR_LO = *+$01
_ADDR_HI = *+$02
        JSR TITLE_RASTER_81                       ;Gets patched in runtime
        INC a02
        LDA a02
        CMP #$04
        BNE _L00
        LDA #$00
        STA a02
_L00    ASL A
        TAX
        LDA TITLE_RASTER_TBL,X
        STA _ADDR_LO
        LDA TITLE_RASTER_TBL+1,X
        STA _ADDR_HI
        PLA
        TAX
        PLA
        TAY
        PLA
        RTI

TITLE_RASTER_TBL
        .WORD TITLE_RASTER_00
        .WORD TITLE_RASTER_81
        .WORD TITLE_RASTER_89
        .WORD TITLE_RASTER_E9

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Raster $00
TITLE_RASTER_00
        LDA #$1B                        ;Raster 8-bit disabled
        STA $D011                       ; VIC Control Register 1
        LDA #$08                        ;Default: x-smooth=0, 40=cols
        STA $D016                       ; VIC Control Register 2
        LDA #$81
        STA $D012                       ;Raster Position
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Raster $81
TITLE_RASTER_81
        LDA #$18                        ;Multicolor enabled
        STA $D016                       ; VIC Control Register 2
        LDA #$50                        ;Extended color
        ORA TITLE_SMOOTH_Y              ; Update y-smooth
        STA $D011                       ; VIC Control Register 1
        LDA #$89
        STA $D012                       ;Raster Position
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Raster $89
TITLE_RASTER_89
        LDA $D011                       ; Honor previous y-smooth
        AND #$3F                        ; Extended color / rater 8-bit masked
        STA $D011                       ; VIC Control Register 1

        LDA #$08                        ;Multicolor disabled
        STA $D016                       ; VIC Control Register 2
        LDA #$E9
        STA $D012                       ;Raster Position
        RTS

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Raster $E9
TITLE_RASTER_E9
        LDA #$18                        ;Multicolor enabled
        STA $D016                       ; VIC Control Register 2
        LDA #$5B                        ;Extended color enabled
        STA $D011                       ; VIC Control Register 1

        INC TITLE_RASTER_TICK

        LDA #$00
        STA $D012                       ;Raster Position

        LDA TITLE_SMOOTH_Y              ;Values goes from 7-0
        SEC                             ; Decrease value by one
        SBC #$01
        AND #$07
TITLE_TOGGLE_SMOOTH_Y
        STA TITLE_SMOOTH_Y              ;Gets patched in runtime. Switches
                                        ; 'STA abs' and
                                        ; 'BIT abs'  (this is kind of a NOP)
        CMP #$02                        ;Ready for hard scrolling?
        BNE _L00                        ; No
        INC TITLE_SCROLL_Y_READY_FOR_NEW_LINE                       ; Yes, trigger it
_L00    RTS

TITLE_RASTER_TICK                       .BYTE $00
TITLE_SMOOTH_Y                          .BYTE $07
TITLE_SCROLL_Y_READY_FOR_NEW_LINE       .BYTE $00
fCF0F   .BYTE $00,$00,$00,$00
fCF13   .BYTE $00,$20,$05,$00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; Unused (?)
jCF17   LDX #$03
        LDA #$81                        ;#%10000001
        STA $DD0E                       ;CIA2: CIA Control Register A
        LDA #$08                        ;#%00001000
        STA $DD0F                       ;CIA2: CIA Control Register B
_L00    LDA fCF0F,X
        STA $DD08,X                     ;CIA2: Time-of-Day Clock: 1/10 Seconds
        DEX
        BPL _L00

        LDX #$03
        LDA #$80                        ;#%10000000
        STA $DD0F                       ;CIA2: CIA Control Register B
_L01    LDA fCF13,X
        STA $DD08,X                     ;CIA2: Time-of-Day Clock: 1/10 Seconds
        DEY
        DEX
        BPL _L01

        RTS

        .BYTE $DF,$60,$DF,$20,$DF,$20,$DF,$20
        .BYTE $DF,$00,$DF,$20,$DF,$20,$DF,$20
        .BYTE $DF,$20,$DF,$20,$DF,$20,$DF,$20
        .BYTE $DF,$20,$FF,$20,$DF,$20,$DF,$20
        .BYTE $DF,$20,$FF,$20,$DF,$20,$DF,$20
        .BYTE $DF,$20,$DF,$20,$DF,$20,$DF,$20
        .BYTE $DF,$20,$DF,$20,$DF,$20,$DF,$20
        .BYTE $DF,$20,$DF,$20,$DF,$20,$DF,$20
        .BYTE $DF,$30,$00,$FF,$00,$FF,$00,$FF
        .BYTE $00,$DF,$00,$FF,$00,$FF,$00,$DF
        .BYTE $00,$FF,$20,$FF,$20,$DF,$00,$FF
        .BYTE $00,$DF,$00,$FF,$00,$FF,$00,$DF
        .BYTE $20,$DF,$00,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$DF,$00,$FF,$20,$FF
        .BYTE $00,$98,$00,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$20,$DF
        .BYTE $00,$DF,$20,$DF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$DF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FF,$20,$FF
        .BYTE $00,$DF,$00,$DF,$00,$FF,$00,$FF
        .BYTE $00,$DF,$00,$FF,$00,$FF,$00,$DF
        .BYTE $20
aCFFF   .BYTE $00

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

        * = $D000
        .BINARY "rambo-title-d000-charset.bin"

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

; $D800
        .BYTE $FD,$2D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$CD,$FD,$FD,$0D
        .BYTE $FD,$0D,$0D,$FD,$FD,$FD,$FD,$FD
        .BYTE $0D,$FD,$FD,$FD,$2D,$FD,$2D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$0D
        .BYTE $FD,$FD,$0D,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $FD,$FD,$0D,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$2D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$0D,$6D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$9D
        .BYTE $FD,$FD,$2D,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$0D,$FD
        .BYTE $0D,$FD,$FD,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $2D,$FD,$FD,$0D,$FD,$FD,$FD,$CD
        .BYTE $FD,$FD,$FD,$FD,$FD,$0D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$2D,$FD,$0D,$FD
        .BYTE $FD,$FD,$CD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$FD,$2D,$FD,$FD
        .BYTE $0D,$FD,$FD,$FD,$FD,$FD,$2D,$FD
        .BYTE $2D,$FD,$FD,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $FD,$FD,$FD,$FD,$2D,$FD,$FD,$FD
        .BYTE $FD,$1D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$9D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$2D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$0D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$CD,$FD,$FD,$FD
        .BYTE $FD,$0D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$CD,$FD,$FD,$9D,$FD,$0D
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$CD,$FD,$FD,$FD,$FD,$FD,$0D
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$CD
        .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$1D,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$2D,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$FD,$0D,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$0D,$FD,$0D,$FD
        .BYTE $FD,$FD,$9D,$2D,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$1D,$FD,$FD,$FD
        .BYTE $FD,$0D,$2D,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$0D,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$9D,$FD,$FD,$FD,$2D
        .BYTE $FD,$2D,$FD,$FD,$2D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$0D,$FD
        .BYTE $FD,$CD,$FD,$2D,$FD,$FD,$FD,$FD
        .BYTE $1D,$FD,$FD,$FD,$9D,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$0D
        .BYTE $FD,$FD,$FD,$2D,$FD,$FD,$0D,$FD
        .BYTE $9D,$FD,$FD,$0D,$FD,$2D,$FD,$2D
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$0D,$FD
        .BYTE $FD,$FD,$FD,$6D,$2D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $FD,$1D,$FD,$1D,$FD,$6D,$6D,$0D
        .BYTE $FD,$FD,$FD,$FD,$0D,$2D,$0D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$1D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$0D,$FD,$0D,$FD,$FD,$FD,$FD
        .BYTE $2D,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $9D,$9D,$2D,$1D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$CD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$1D
        .BYTE $FD,$1D,$FD,$FD,$FD,$0D,$FD,$FD
        .BYTE $FD,$0D,$FD,$FD,$FD,$0D,$FD,$0D
        .BYTE $FD,$FD,$2D,$FD,$FD,$FD,$FD,$1D
        .BYTE $FD,$FD,$FD,$2D,$FD,$CD,$FD,$2D
        .BYTE $FD,$2D,$FD,$2D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$2D,$FD,$2D,$6D
        .BYTE $FD,$FD,$FD,$9D,$0D,$FD,$FD,$FD
        .BYTE $FD,$6D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $2D,$FD,$1D,$FD,$FD,$FD,$6D,$FD
        .BYTE $1D,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $0D,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$2D,$FD,$FD,$FD,$FD
        .BYTE $FD,$0D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$1D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$1D,$FD,$FD,$0D,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$FD,$FD,$FD,$0D
        .BYTE $FD,$9D,$2D,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$CD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$CD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $2D,$FD,$FD,$2D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$2D
        .BYTE $9D,$1D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$CD,$FD,$FD,$2D
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $0D,$FD,$CD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$2D
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$9D,$FD
        .BYTE $FD,$2D,$FD,$0D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$2D,$2D
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$FD,$2D
        .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$9D,$FD,$FD,$0D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$0D,$FD,$2D,$9D,$FD,$2D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$6D
        .BYTE $0D,$FD,$FD,$FD,$FD,$9D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$0D,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$0D,$FD,$FD
        .BYTE $FD,$F1,$F1,$F1,$C1,$F1,$F1,$01
        .BYTE $F1,$F1,$F1,$F1,$F1,$F1,$F1,$F1
        .BYTE $F1,$F1,$F1,$F1,$F1,$F1,$F1,$F1
        .BYTE $7F,$FF,$FF,$00,$81,$01,$F2,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$61,$04,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$DD,$07,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$39,$09,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$FF,$0B,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$FF,$0E,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$EA,$11,$2A,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$4E,$14,$2A,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$88,$0E,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$B7,$0E,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$66,$10,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$37,$13,$2A,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$91,$13,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$B5,$16,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$C3,$19,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $7F,$FF,$FF,$00,$79,$14,$35,$04
        .BYTE $00,$00,$00,$01,$FF,$00,$81,$09
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $17,$03,$3F,$00,$97,$FF,$FF,$FF
        .BYTE $00,$00,$00,$01,$FF,$00,$80,$08
        .BYTE $FF,$FF,$FF,$FF,$FF,$F7,$FF,$00
        .BYTE $FF,$FF,$CA,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$00,$FF,$FF,$00,$FF,$CA,$FF
        .BYTE $00,$2C,$FF,$2C,$FF,$FF,$FF,$FF
        .BYTE $00,$FF,$FF,$FF,$25,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$10
        .BYTE $FF,$FF,$FF,$FF,$F7,$FF,$00,$FF
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$FF,$FF
        .BYTE $F7,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$F7,$FF,$00,$FF,$FF
        .BYTE $FF,$00,$00,$FF,$FF,$FF,$FF,$FF
        .BYTE $CA,$FF,$00,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$00,$FF,$10,$00,$FF
        .BYTE $FF,$FF,$F7,$FF,$2C,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$F7,$FF,$60,$00,$FF
        .BYTE $FF,$FF,$CA,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$00,$00,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$60,$00,$00,$FF,$FF
        .BYTE $2C,$FF,$FF,$FF,$10,$FF,$FF,$FF
        .BYTE $FF,$FF,$10,$FF,$60,$FF,$FF,$FF
        .BYTE $2C,$FF,$FF,$FF,$FF,$FF,$2C,$FF
        .BYTE $FF,$FF,$CA,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$25,$FF,$25,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$9D,$FF,$60
        .BYTE $FF,$FF,$FF,$FF,$FF,$F7,$FF,$FF
        .BYTE $00,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$25,$FF,$00
        .BYTE $00,$9D,$FF,$25,$FF,$FF,$9D,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$25
        .BYTE $60,$25,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$10,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$2C,$00,$FF,$FF
        .BYTE $CA,$FF,$FF,$FF,$FF,$25,$00,$FF
        .BYTE $FF,$FF,$25,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$00,$00,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$CA,$FF,$FF,$9D
        .BYTE $00,$FF,$FF,$FF,$00,$FF,$FF,$FF
        .BYTE $FF,$FF,$9D,$00,$FF,$FF,$FF,$9D
        .BYTE $FF,$25,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$2C,$FF,$FF,$FF,$FF,$25
        .BYTE $FF,$25,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $F7,$FF,$FF,$CA,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$2C,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$00,$FF,$FF,$00,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $9D,$FF,$FF,$FF,$60,$FF,$FF,$FF
        .BYTE $10,$FF,$60,$00,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$00,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$25,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $60,$00,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$10,$FF,$00,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$25,$FF,$00
        .BYTE $25,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$CA,$FF,$FF,$FF,$FF,$CA,$FF
        .BYTE $FF,$FF,$00,$00,$F7,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $E000
MAP_TILES
        .BINARY "rambo-e000-e770-map.bin"

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $E770
MAP_TILES_ORIG
        .BINARY "rambo-e770-eee0-orig-map.bin"

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
; $EEE0
        .BYTE $55,$40,$55,$40,$55,$40,$55,$40
        .BYTE $55,$40,$55,$40,$55,$40,$55,$40
        .BYTE $55,$40,$55,$40,$55,$40,$55,$40
        .BYTE $55,$40,$55,$40,$55,$40,$55,$40
        .BYTE $1E,$1F,$1F,$1E,$1F,$1E,$1F,$1F
        .BYTE $1E,$1F,$1E,$1E,$1F,$1E,$1F,$1E
        .BYTE $1E,$1F,$1E,$12,$13,$14,$1E,$1F
        .BYTE $1F,$1E,$1E,$1E,$10,$11,$1E,$1F
        .BYTE $1E,$1E,$1F,$1E,$0E,$0F,$1F,$1E
        .BYTE $1E,$1F,$0A,$0B,$0C,$0D,$1E,$1F
        .BYTE $1F,$1E,$05,$06,$07,$08,$09,$1F
        .BYTE $1F,$1E,$00,$01,$02,$03,$04,$1E
        .BYTE $1F,$1F,$1F,$1E,$1F,$27,$28,$29
        .BYTE $1E,$1F,$1F,$1E,$1F,$24,$25,$26
        .BYTE $1F,$1F,$1E,$1F,$1F,$21,$22,$23
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1E,$1F
        .BYTE $1F,$1E,$68,$69,$6D,$1E,$1F,$1F
        .BYTE $1F,$1F,$18,$19,$1A,$1F,$1F,$1E
        .BYTE $1E,$1F,$1F,$1F,$1E,$1E,$1F,$1F
        .BYTE $1E,$1F,$1F,$1E,$1E,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1F,$1F
        .BYTE $1F,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1E,$1E,$1F,$1F
        .BYTE $1F,$1E,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1F,$1E,$1E,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1F,$1E
        .BYTE $1F,$39,$3A,$3B,$3C,$3D,$1F,$1E
        .BYTE $1F,$34,$35,$36,$37,$38,$1F,$1F
        .BYTE $1E,$2F,$30,$31,$32,$33,$1F,$1E
        .BYTE $1F,$2A,$2B,$2C,$2D,$2E,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1E
        .BYTE $1F,$1F,$1E,$1F,$12,$13,$14,$1F
        .BYTE $1F,$15,$16,$17,$1F,$10,$11,$1F
        .BYTE $1F,$12,$13,$14,$1F,$0E,$0F,$1E
        .BYTE $1F,$1F,$10,$11,$0B,$0C,$0D,$1F
        .BYTE $1E,$1F,$0E,$05,$06,$07,$08,$09
        .BYTE $0A,$0B,$0C,$00,$01,$02,$03,$04
        .BYTE $05,$06,$07,$08,$09,$1E,$1F,$1F
        .BYTE $00,$01,$02,$03,$04,$1E,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$1E,$1E,$1F,$1F
        .BYTE $1E,$15,$12,$13,$14,$16,$17,$1E
        .BYTE $1F,$12,$13,$10,$12,$13,$14,$1F
        .BYTE $1E,$1F,$10,$0E,$11,$10,$11,$1F
        .BYTE $1F,$1E,$0E,$0C,$0D,$0E,$0F,$1E
        .BYTE $0A,$0B,$0C,$08,$08,$0C,$0D,$1F
        .BYTE $05,$06,$07,$07,$06,$07,$08,$09
        .BYTE $00,$01,$02,$00,$01,$02,$03,$04
        .BYTE $24,$1F,$5B,$5E,$1F,$24,$25,$1F
        .BYTE $5B,$5C,$5A,$5A,$5D,$5E,$95,$96
        .BYTE $5A,$63,$64,$5A,$61,$5A,$67,$5E
        .BYTE $5A,$65,$94,$72,$60,$5A,$93,$5A
        .BYTE $6B,$6C,$73,$73,$71,$72,$5F,$5A
        .BYTE $79,$7A,$73,$73,$75,$75,$71,$72
        .BYTE $1E,$1F,$79,$7A,$73,$75,$7F,$80
        .BYTE $1F,$1F,$1E,$1F,$79,$80,$1F,$1E
        .BYTE $1F,$1F,$24,$25,$26,$1E,$1F,$1F
        .BYTE $1F,$97,$98,$23,$1F,$1F,$1E,$1F
        .BYTE $5C,$5A,$5A,$5D,$1E,$1F,$1F,$1F
        .BYTE $5A,$63,$5A,$5A,$68,$69,$6D,$1E
        .BYTE $5A,$65,$5A,$5A,$18,$19,$1A,$1F
        .BYTE $6B,$6C,$71,$72,$56,$57,$58,$59
        .BYTE $79,$7A,$7F,$80,$52,$53,$54,$55
        .BYTE $1F,$1E,$1F,$1E,$4E,$4F,$50,$51
        .BYTE $1F,$1E,$1F,$1E,$5B,$5E,$1F,$1E
        .BYTE $9A,$99,$5B,$5C,$5A,$5A,$5D,$5E
        .BYTE $5B,$6A,$5A,$63,$5A,$5A,$62,$5A
        .BYTE $5A,$93,$5A,$65,$6B,$72,$5F,$5A
        .BYTE $5A,$65,$6B,$6C,$76,$76,$71,$72
        .BYTE $6B,$6C,$76,$76,$76,$76,$7B,$7C
        .BYTE $7D,$7E,$76,$76,$7B,$7C,$1E,$1F
        .BYTE $1E,$1F,$7D,$7C,$1F,$1E,$1F,$1E
        .BYTE $1E,$1F,$1F,$1E,$1F,$1E,$1F,$1F
        .BYTE $1E,$1F,$1E,$1E,$1F,$1E,$1F,$1E
        .BYTE $1E,$1F,$21,$12,$13,$14,$24,$1F
        .BYTE $1F,$1E,$1E,$00,$10,$11,$1E,$1F
        .BYTE $1E,$1E,$1F,$1E,$0E,$1F,$1F,$1E
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1E,$1F,$1F,$1F,$1E
        .BYTE $1E,$1F,$1F,$1E,$1F,$1E,$1F,$1F
        .BYTE $1E,$1F,$1E,$1E,$1F,$1E,$1F,$1E
        .BYTE $1E,$1F,$1E,$24,$25,$1F,$1E,$1F
        .BYTE $1F,$1E,$1E,$21,$22,$26,$1F,$1F
        .BYTE $1E,$1E,$1F,$1F,$1E,$1F,$1F,$1E
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1E,$1F,$1F,$1F,$1E
        .BYTE $1F,$1F,$1E,$1F,$12,$13,$14,$1F
        .BYTE $1F,$15,$16,$17,$1F,$10,$11,$1F
        .BYTE $1F,$12,$13,$14,$1F,$0E,$0F,$1E
        .BYTE $1F,$1F,$10,$11,$1E,$1F,$1F,$1F
        .BYTE $1E,$1F,$0E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$1E,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$12,$13,$14,$1F
        .BYTE $1F,$1F,$16,$1F,$1F,$1F,$1E,$1F
        .BYTE $1F,$12,$13,$14,$1F,$1F,$1F,$1E
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$1E,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$1E,$1E,$1F,$1F
        .BYTE $1E,$15,$12,$13,$14,$16,$17,$1E
        .BYTE $1F,$12,$13,$10,$12,$13,$14,$1F
        .BYTE $1E,$1F,$10,$0E,$11,$10,$11,$1F
        .BYTE $1F,$1E,$0E,$1F,$1F,$0E,$0F,$1E
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1F,$1E
        .BYTE $1F,$1F,$1F,$1F,$1E,$1F,$1F,$1F
        .BYTE $1F,$1E,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1E,$1E,$1F,$1F
        .BYTE $1E,$15,$12,$13,$14,$16,$17,$1E
        .BYTE $1F,$12,$13,$1F,$12,$13,$14,$1F
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1F,$1E
        .BYTE $1F,$1F,$1F,$1F,$1E,$1F,$1F,$1F
        .BYTE $1F,$1E,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $24,$1F,$5B,$5E,$1F,$24,$25,$1F
        .BYTE $5B,$5C,$A1,$5A,$5D,$5E,$1F,$1F
        .BYTE $5A,$9C,$92,$92,$A1,$5A,$9B,$5E
        .BYTE $5A,$92,$9B,$9C,$92,$92,$9D,$5A
        .BYTE $81,$82,$92,$92,$9B,$9F,$92,$5A
        .BYTE $1F,$1E,$1F,$82,$92,$A0,$1F,$8C
        .BYTE $1E,$1F,$1F,$1F,$82,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1E
        .BYTE $24,$1F,$5B,$5E,$1F,$1E,$25,$1F
        .BYTE $5B,$5C,$A1,$1F,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1E,$1F,$5E
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1F,$1F
        .BYTE $1E,$1F,$1F,$1E,$5E,$5B,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1E,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1E
        .BYTE $1F,$1F,$24,$25,$26,$1E,$1F,$1F
        .BYTE $1F,$97,$98,$23,$1F,$1F,$1E,$1F
        .BYTE $5C,$5A,$5A,$5D,$1E,$1F,$1F,$1F
        .BYTE $81,$9B,$9F,$5A,$68,$69,$6D,$1E
        .BYTE $1F,$1F,$A0,$1F,$18,$19,$1A,$1F
        .BYTE $1F,$1E,$1F,$1F,$56,$57,$58,$59
        .BYTE $1E,$1F,$1E,$1F,$4E,$4F,$50,$51
        .BYTE $1E,$1E,$1F,$1E,$1E,$1F,$1F,$1E
        .BYTE $1F,$1E,$24,$25,$26,$1E,$1F,$1F
        .BYTE $1F,$25,$1F,$23,$1F,$1F,$1E,$1F
        .BYTE $1F,$24,$1E,$1F,$1E,$1F,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$68,$69,$6D,$1E
        .BYTE $1F,$1E,$1F,$1F,$18,$19,$1A,$1F
        .BYTE $1F,$1F,$1F,$1F,$25,$25,$25,$1F
        .BYTE $1E,$1F,$1E,$1F,$23,$26,$23,$1F
        .BYTE $1E,$1E,$1F,$1E,$1F,$1F,$1F,$1F
        .BYTE $1F,$1E,$1F,$1E,$5B,$5E,$1F,$1E
        .BYTE $1F,$1F,$5B,$5C,$A1,$A1,$5D,$5E
        .BYTE $5B,$9E,$5A,$92,$92,$92,$9D,$5A
        .BYTE $5A,$9C,$92,$92,$9D,$9E,$92,$5A
        .BYTE $5A,$82,$9B,$9F,$92,$92,$86,$1F
        .BYTE $1F,$1F,$1F,$A0,$86,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1F
        .BYTE $1E,$1F,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$1E,$5B,$5E,$1F,$1E
        .BYTE $1F,$1F,$1F,$27,$28,$29,$1F,$5E
        .BYTE $5B,$1F,$1F,$24,$25,$26,$1F,$1F
        .BYTE $1F,$1F,$1F,$21,$22,$23,$1F,$1F
        .BYTE $1F,$1F,$1F,$5E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1F,$1F,$1E,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1F
        .BYTE $1E,$1F,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$B4,$B7,$B8,$1F,$1F,$1E
        .BYTE $1E,$B4,$B4,$B0,$B1,$B6,$1E,$1F
        .BYTE $1F,$AF,$B0,$B1,$B2,$B3,$1F,$1E
        .BYTE $1F,$AA,$AB,$AC,$AD,$AE,$1F,$1F
        .BYTE $1E,$1F,$A6,$A7,$A8,$A9,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$B4,$B7,$B8,$1F,$1F,$1E
        .BYTE $1E,$B4,$B4,$B0,$B1,$B6,$1E,$1F
        .BYTE $1F,$A6,$A6,$A6,$1F,$A6,$1F,$1E
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1E,$B7,$B8,$1F,$1F,$1E
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1F
        .BYTE $27,$28,$29,$C2,$C3,$C4,$C5,$1E
        .BYTE $24,$25,$26,$C2,$C0,$C1,$C5,$1F
        .BYTE $21,$22,$23,$BC,$BD,$BE,$BF,$1F
        .BYTE $1F,$1E,$1F,$1F,$B9,$BA,$BB,$1E
        .BYTE $1F,$1E,$1F,$A4,$A5,$1E,$1F,$1F
        .BYTE $1F,$1E,$1F,$A2,$A3,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F
        .BYTE $1E,$C3,$C4,$C5,$1F,$27,$28,$29
        .BYTE $C2,$C0,$C1,$C5,$1F,$24,$25,$26
        .BYTE $BC,$BD,$BE,$BF,$1F,$21,$22,$23
        .BYTE $1F,$B9,$BA,$BB,$1F,$1E,$1F,$1F
        .BYTE $A4,$A5,$1E,$1F,$1E,$C3,$C4,$C5
        .BYTE $A2,$A3,$1E,$1F,$1E,$C0,$C1,$1F
        .BYTE $A4,$A5,$1F,$1F,$BC,$BD,$BE,$BF
        .BYTE $1F,$1F,$1E,$1F,$1F,$B9,$BA,$BB
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1E
        .BYTE $68,$69,$6D,$1F,$1F,$1E,$1F,$1F
        .BYTE $18,$19,$D1,$CF,$1E,$1F,$1F,$1E
        .BYTE $8B,$D2,$74,$75,$8F,$3F,$8A,$92
        .BYTE $92,$8A,$FC,$3E,$74,$73,$8F,$3F
        .BYTE $92,$92,$92,$92,$FC,$3E,$7F,$80
        .BYTE $4B,$4B,$4B,$4B,$4B,$4B,$48,$1F
        .BYTE $4A,$4A,$4A,$4A,$4A,$4A,$48,$1F
        .BYTE $27,$28,$29,$27,$28,$29,$1E,$1F
        .BYTE $24,$25,$26,$24,$25,$26,$1F,$1E
        .BYTE $21,$22,$23,$21,$22,$23,$1F,$1F
        .BYTE $8A,$8A,$8A,$8A,$8A,$92,$8A,$92
        .BYTE $82,$82,$82,$82,$92,$92,$92,$92
        .BYTE $4B,$4B,$4B,$4B,$1F,$82,$82,$92
        .BYTE $4A,$4A,$4A,$4A,$4B,$4B,$4B,$4B
        .BYTE $1F,$1E,$1F,$1F,$4A,$4A,$4A,$4A
        .BYTE $E8,$92,$92,$92,$92,$92,$92,$E9
        .BYTE $E8,$92,$92,$92,$92,$92,$92,$E9
        .BYTE $E8,$92,$92,$92,$92,$92,$92,$E9
        .BYTE $E8,$92,$92,$92,$92,$92,$92,$E9
        .BYTE $E8,$92,$92,$92,$92,$92,$92,$E9
        .BYTE $E8,$92,$92,$92,$92,$92,$92,$E9
        .BYTE $E6,$E4,$EB,$EC,$ED,$EE,$E5,$E7
        .BYTE $F0,$F0,$E6,$E4,$E5,$E7,$F0,$F0
        .BYTE $27,$28,$29,$27,$28,$29,$1E,$1F
        .BYTE $24,$25,$26,$24,$25,$26,$1F,$1E
        .BYTE $21,$22,$23,$21,$22,$23,$1F,$1F
        .BYTE $92,$8B,$1F,$89,$8A,$92,$8A,$92
        .BYTE $92,$92,$8A,$92,$92,$92,$92,$92
        .BYTE $82,$82,$82,$82,$82,$82,$82,$92
        .BYTE $4B,$4B,$4B,$4B,$4B,$4B,$4B,$4B
        .BYTE $4A,$4A,$4A,$4A,$4A,$4A,$4A,$4A
        .BYTE $E8,$EF,$EF,$EF,$EF,$E8,$92,$E9
        .BYTE $E8,$EF,$EF,$EF,$EF,$E8,$92,$E9
        .BYTE $E8,$EF,$EF,$EF,$EF,$EF,$EF,$E9
        .BYTE $E8,$EF,$EF,$EF,$EF,$EF,$EF,$E9
        .BYTE $E8,$EF,$EF,$EF,$EF,$EF,$EF,$E9
        .BYTE $E8,$EF,$EF,$EF,$EF,$EF,$EF,$E9
        .BYTE $E6,$E4,$EB,$EC,$ED,$EE,$E5,$E7
        .BYTE $F0,$F0,$E6,$E4,$E5,$E7,$F0,$F0
        .BYTE $27,$28,$29,$1F,$1E,$1F,$1E,$1F
        .BYTE $24,$25,$26,$1F,$1E,$1F,$A4,$A5
        .BYTE $21,$22,$23,$1E,$1F,$1E,$A2,$A3
        .BYTE $92,$92,$8B,$1F,$1F,$1F,$1E,$1E
        .BYTE $92,$92,$92,$8A,$8B,$1F,$1F,$1F
        .BYTE $82,$82,$82,$92,$92,$1F,$1E,$1F
        .BYTE $4B,$4B,$49,$92,$92,$1F,$1E,$1F
        .BYTE $4A,$4A,$49,$92,$92,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$68,$69,$6D,$1E,$1F
        .BYTE $1F,$1E,$1F,$18,$19,$1A,$1F,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1E,$1F,$83,$1E,$85,$1F,$1E,$1F
        .BYTE $1F,$1F,$1F,$84,$1E,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$27,$28,$29
        .BYTE $1F,$1F,$1E,$1F,$1E,$24,$25,$26
        .BYTE $1E,$1F,$1F,$1E,$1F,$21,$22,$23
        .BYTE $C2,$C3,$C4,$C5,$1F,$1E,$1F,$1F
        .BYTE $1F,$C0,$C1,$1F,$1E,$1F,$1E,$1E
        .BYTE $BC,$BD,$BE,$BF,$1F,$1E,$1F,$1F
        .BYTE $B9,$BA,$BB,$1F,$1F,$1E,$89,$92
        .BYTE $1E,$1F,$1E,$1F,$89,$92,$92,$92
        .BYTE $1E,$1F,$1F,$89,$92,$92,$92,$92
        .BYTE $1F,$1F,$1F,$92,$92,$4B,$4B,$4B
        .BYTE $1F,$1E,$1F,$92,$92,$4A,$4A,$4A
        .BYTE $C2,$C3,$C4,$C5,$1F,$1E,$1F,$1F
        .BYTE $1F,$C0,$C1,$1F,$1E,$1F,$1E,$1E
        .BYTE $BC,$BD,$BE,$BF,$1F,$1E,$1F,$1F
        .BYTE $B9,$BA,$BB,$1F,$1F,$1E,$89,$92
        .BYTE $1E,$1F,$1E,$89,$92,$92,$92,$92
        .BYTE $1E,$1F,$1F,$89,$92,$92,$92,$92
        .BYTE $1F,$1F,$1F,$92,$92,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$92,$92,$1F,$1E,$1F
        .BYTE $27,$28,$29,$92,$92,$49,$1F,$1F
        .BYTE $24,$25,$26,$92,$92,$49,$1E,$1F
        .BYTE $21,$22,$23,$92,$92,$49,$1E,$1F
        .BYTE $1F,$1F,$1E,$92,$92,$49,$1F,$1F
        .BYTE $1F,$1F,$1F,$92,$92,$49,$1E,$1F
        .BYTE $1E,$1F,$1F,$92,$92,$49,$A4,$A5
        .BYTE $1F,$1F,$1F,$92,$92,$49,$A2,$A3
        .BYTE $1F,$1E,$1F,$92,$92,$49,$1E,$1F
        .BYTE $27,$28,$29,$92,$92,$1E,$1F,$1F
        .BYTE $24,$25,$26,$92,$92,$1F,$1E,$1F
        .BYTE $21,$22,$23,$92,$92,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$92,$92,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$92,$92,$1F,$1E,$1F
        .BYTE $1E,$1F,$1F,$92,$92,$1E,$A4,$A5
        .BYTE $1F,$1F,$1F,$92,$92,$1F,$A2,$A3
        .BYTE $1F,$1E,$1F,$92,$92,$1F,$1E,$1F
        .BYTE $27,$28,$49,$92,$92,$1E,$1F,$1F
        .BYTE $24,$25,$49,$92,$92,$1F,$1E,$1F
        .BYTE $21,$22,$49,$92,$92,$1F,$1E,$1F
        .BYTE $1F,$1F,$49,$92,$92,$1E,$1F,$1F
        .BYTE $1F,$1F,$49,$92,$92,$1F,$1E,$1F
        .BYTE $1E,$1F,$49,$92,$92,$1E,$A4,$A5
        .BYTE $1F,$1F,$49,$92,$92,$1F,$A2,$A3
        .BYTE $1F,$1E,$49,$92,$92,$1F,$1E,$1F
        .BYTE $27,$28,$29,$92,$92,$1E,$1F,$1F
        .BYTE $24,$25,$26,$92,$92,$1F,$1E,$1F
        .BYTE $21,$22,$23,$92,$92,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$92,$92,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$92,$92,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$92,$92,$1E,$A4,$A5
        .BYTE $1F,$1F,$1F,$92,$92,$1F,$A2,$A3
        .BYTE $1F,$1E,$1F,$92,$92,$1F,$1E,$1F
        .BYTE $27,$28,$49,$92,$92,$1E,$1F,$1F
        .BYTE $24,$25,$49,$81,$86,$1F,$1E,$1F
        .BYTE $21,$22,$49,$28,$29,$1F,$1E,$1F
        .BYTE $1F,$1F,$49,$25,$26,$1E,$1F,$1F
        .BYTE $1F,$1F,$49,$22,$23,$1F,$1E,$1F
        .BYTE $1E,$1F,$49,$89,$8A,$1E,$A4,$A5
        .BYTE $1F,$1F,$49,$92,$92,$1F,$A2,$A3
        .BYTE $1F,$1E,$49,$92,$92,$1F,$1E,$1F
        .BYTE $27,$28,$1F,$92,$92,$1E,$1F,$1F
        .BYTE $24,$25,$1F,$81,$86,$1F,$1E,$1F
        .BYTE $21,$22,$1F,$28,$29,$1F,$1E,$1F
        .BYTE $1F,$1F,$1F,$25,$26,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$22,$23,$1F,$1E,$1F
        .BYTE $1E,$1F,$1F,$89,$8A,$1E,$A4,$A5
        .BYTE $1F,$1F,$1F,$92,$92,$1F,$A2,$A3
        .BYTE $1F,$1E,$1F,$92,$92,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1E,$1F,$68,$69,$6D
        .BYTE $1F,$1F,$D2,$5D,$98,$18,$19,$1A
        .BYTE $1E,$1F,$1F,$5A,$5A,$5D,$98,$1F
        .BYTE $1F,$1E,$90,$72,$5A,$5A,$5A,$5D
        .BYTE $1F,$D2,$73,$73,$71,$72,$5A,$5A
        .BYTE $1F,$1F,$79,$7A,$73,$73,$71,$72
        .BYTE $1F,$1E,$1F,$1F,$79,$7A,$7F,$80
        .BYTE $1F,$1F,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$1E,$1F,$68,$69,$6D
        .BYTE $1F,$1F,$D2,$5D,$98,$18,$19,$1A
        .BYTE $1E,$1F,$1F,$5A,$5A,$5D,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$A4,$A5,$1F,$1F
        .BYTE $1F,$1F,$1F,$1F,$A2,$A3,$1F,$1E
        .BYTE $1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1E
        .BYTE $1F,$1F,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $1F,$1F,$5B,$5E,$1F,$1F,$24,$25
        .BYTE $5B,$5C,$5A,$5A,$5D,$5E,$21,$22
        .BYTE $5A,$63,$64,$5A,$5A,$5A,$5D,$5E
        .BYTE $5A,$65,$94,$72,$5A,$5A,$5A,$5A
        .BYTE $6B,$6C,$74,$74,$71,$72,$5A,$5A
        .BYTE $79,$7A,$74,$74,$74,$74,$71,$72
        .BYTE $1F,$1E,$79,$7A,$74,$74,$7F,$80
        .BYTE $1F,$1F,$1F,$1E,$79,$80,$1F,$1E
        .BYTE $1F,$1F,$5B,$5E,$1F,$1F,$24,$25
        .BYTE $5B,$5C,$5A,$5A,$5D,$5E,$21,$22
        .BYTE $5A,$9C,$92,$92,$A1,$5A,$5D,$5E
        .BYTE $5A,$1F,$9B,$9C,$92,$92,$A1,$5A
        .BYTE $1E,$1F,$8C,$1F,$9B,$9C,$9D,$5A
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1F,$1F
        .BYTE $1F,$1E,$1F,$1E,$1F,$1F,$1F,$1E
        .BYTE $1F,$1F,$1F,$1E,$1F,$1F,$1F,$1E
        .BYTE $1F,$1E,$1F,$1F,$5B,$5E,$1E,$1F
        .BYTE $1E,$1F,$5B,$5C,$5A,$5A,$5D,$5E
        .BYTE $5B,$5C,$5A,$5A,$5A,$5A,$62,$5A
        .BYTE $5A,$5A,$5A,$5A,$6B,$72,$5F,$5A
        .BYTE $5A,$5A,$6B,$6C,$74,$74,$71,$72
        .BYTE $6B,$6C,$74,$74,$74,$74,$7F,$80
        .BYTE $79,$7A,$74,$74,$7F,$80,$1E,$1F
        .BYTE $1E,$1F,$79,$80,$1F,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$1F,$5B,$5E,$1E,$1F
        .BYTE $1E,$1F,$5B,$5C,$5A,$5A,$5D,$5E
        .BYTE $5B,$5C,$5A,$5A,$A1,$92,$9D,$5A
        .BYTE $5A,$A1,$A1,$92,$9D,$9E,$92,$5A
        .BYTE $5A,$92,$9B,$9F,$1E,$1F,$1F,$1F
        .BYTE $1F,$92,$92,$A0,$1F,$1E,$1F,$1F
        .BYTE $1F,$81,$82,$1F,$1E,$1F,$1E,$1F
        .BYTE $1E,$1F,$1F,$1F,$1F,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$1F,$5B,$5E,$1E,$1F
        .BYTE $1E,$1F,$1F,$1E,$24,$25,$26,$1F
        .BYTE $5B,$1F,$1F,$1F,$21,$22,$23,$1F
        .BYTE $1F,$1F,$5E,$5B,$1F,$1E,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$47,$40,$44,$DA,$1F
        .BYTE $68,$69,$6D,$D3,$40,$44,$49,$1E
        .BYTE $18,$19,$1A,$D3,$40,$44,$49,$1F
        .BYTE $1E,$1F,$1F,$D3,$40,$44,$49,$1E
        .BYTE $1F,$1E,$1F,$DC,$DD,$DE,$49,$1F
        .BYTE $1F,$1F,$1F,$D9,$FD,$D8,$49,$1F
        .BYTE $1F,$1E,$1F,$D5,$D7,$D6,$49,$1F
        .BYTE $1E,$1F,$1E,$79,$D4,$80,$1F,$1E
        .BYTE $1F,$1E,$1F,$47,$40,$43,$DA,$1F
        .BYTE $68,$69,$6D,$D3,$1F,$1F,$49,$1E
        .BYTE $18,$19,$1A,$1F,$1F,$1F,$1F,$1F
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1F,$1E
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$1E,$1F,$1E,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1E,$1F,$1F,$1E
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1E,$1F
        .BYTE $1F,$47,$E0,$E0,$E0,$E0,$E3,$1F
        .BYTE $1F,$E1,$E0,$E0,$E0,$E0,$E3,$1F
        .BYTE $1E,$E1,$E0,$E0,$E0,$E0,$E3,$1F
        .BYTE $1F,$E1,$78,$78,$78,$78,$78,$1F
        .BYTE $1E,$7D,$7E,$1E,$1F,$1E,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1E,$1F,$1F,$1E
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1E,$1F
        .BYTE $1F,$47,$E0,$E0,$92,$92,$E3,$1F
        .BYTE $1F,$E1,$E0,$E0,$92,$92,$E3,$1F
        .BYTE $1E,$E1,$E0,$E0,$92,$92,$E3,$1F
        .BYTE $1F,$E1,$78,$78,$78,$78,$78,$1F
        .BYTE $1E,$7D,$7E,$1E,$1F,$1E,$1F,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1F,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1E,$1F,$1F,$1E
        .BYTE $39,$EA,$EA,$EA,$EA,$EA,$EA,$3D
        .BYTE $E8,$EF,$E8,$F5,$F6,$E9,$EF,$E9
        .BYTE $E8,$EF,$E8,$F5,$F6,$E9,$EF,$E9
        .BYTE $E8,$EF,$E8,$F5,$F6,$E9,$EF,$E9
        .BYTE $E8,$EF,$E6,$E4,$E5,$E7,$EF,$E9
        .BYTE $E6,$E4,$EB,$EC,$ED,$EE,$E5,$E7
        .BYTE $F0,$F0,$E6,$E4,$E5,$E7,$F0,$F0
        .BYTE $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
        .BYTE $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
        .BYTE $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
        .BYTE $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
        .BYTE $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
        .BYTE $F0,$F0,$F0,$F0,$F0,$F0,$F0,$F0
        .BYTE $F1,$F2,$F0,$F0,$F0,$F0,$F3,$F4
        .BYTE $1F,$1E,$F1,$F2,$F3,$F4,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F
        .BYTE $F8,$F9,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $DB,$DB,$DB,$F8,$F9,$1F,$1E,$1F
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$F8,$F9
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1E
        .BYTE $1F,$1F,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $F8,$F9,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $DB,$DB,$DB,$F8,$F9,$1F,$1E,$1F
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$F8,$F9
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1F,$1E,$1F,$1E,$1F,$1F,$1E
        .BYTE $1F,$1F,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1F,$1E
        .BYTE $1F,$1F,$1E,$1F,$1F,$1F,$1E,$1F
        .BYTE $F8,$F9,$1F,$1E,$1F,$1E,$1F,$1E
        .BYTE $DB,$DB,$DB,$F8,$F9,$1F,$1F,$1F
        .BYTE $FA,$FB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $1F,$15,$16,$FA,$FB,$DB,$DB,$DB
        .BYTE $C2,$C3,$C4,$C5,$1F,$1F,$FA,$FB
        .BYTE $C2,$C3,$C1,$C5,$1F,$1F,$1E,$1F
        .BYTE $BC,$BD,$BE,$BF,$1E,$1F,$1F,$1E
        .BYTE $1F,$B9,$BA,$BB,$1F,$1E,$1F,$1E
        .BYTE $1F,$1E,$1F,$1E,$1E,$1F,$1F,$1E
        .BYTE $1F,$1F,$1F,$1F,$1F,$1F,$1F,$1F
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $FA,$FB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $1F,$1E,$1F,$FA,$FB,$DB,$DB,$DB
        .BYTE $68,$69,$6D,$1F,$1F,$1E,$FA,$FB
        .BYTE $18,$19,$1A,$1E,$1F,$1E,$1F,$1E
        .BYTE $1E,$1F,$1F,$1E,$1F,$1F,$1F,$1F
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $FA,$FB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $1F,$1E,$1F,$FA,$FB,$DB,$DB,$DB
        .BYTE $1F,$1F,$5B,$5E,$1F,$1F,$24,$25
        .BYTE $5B,$1F,$27,$28,$29,$1F,$21,$22
        .BYTE $1F,$1F,$24,$25,$26,$1F,$1F,$5E
        .BYTE $1E,$1F,$21,$22,$23,$1E,$1F,$1F
        .BYTE $1E,$1F,$1F,$1F,$1F,$5E,$5B,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1F,$1F,$1E
        .BYTE $1F,$1F,$1F,$1E,$1F,$1F,$1F,$1E
        .BYTE $1F,$1F,$1F,$1E,$1F,$1F,$1F,$1E
        .BYTE $1F,$1F,$1E,$1F,$1F,$1F,$1F,$1E
        .BYTE $68,$69,$6D,$1F,$1F,$1E,$1F,$1F
        .BYTE $18,$19,$1A,$1E,$1E,$1F,$1F,$1E
        .BYTE $8B,$1E,$89,$8A,$92,$92,$8A,$92
        .BYTE $92,$8A,$92,$92,$92,$92,$92,$92
        .BYTE $92,$92,$92,$92,$92,$86,$82,$86
        .BYTE $4B,$4B,$4B,$4B,$4B,$4B,$48,$1F
        .BYTE $4A,$4A,$4A,$4A,$4A,$4A,$48,$1F
        .BYTE $1F,$1E,$1F,$1F,$1E,$1F,$1F,$1F
        .BYTE $1F,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1E,$1F,$1C,$1C,$1C,$1C,$1F,$1F
        .BYTE $1F,$1E,$1F,$1E,$1D,$1F,$1E,$1F
        .BYTE $1F,$1F,$1B,$1B,$1B,$1B,$1E,$1F
        .BYTE $1E,$1F,$1E,$1F,$1F,$1E,$1F,$1F
        .BYTE $1F,$1F,$1F,$1E,$1F,$1F,$1E,$1F
        .BYTE $1F,$1E,$1F,$1F,$1F,$1E,$1F,$1F
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $DB,$DB,$DB,$DB,$DB,$DB,$DB,$DB
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF

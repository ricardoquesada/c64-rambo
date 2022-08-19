;
; **** ZP FIELDS **** 
;
f02 = $02
f20 = $20
f2A = $2A
f2D = $2D
f37 = $37
f3C = $3C
f45 = $45
f4A = $4A
f4C = $4C
f4E = $4E
f53 = $53
f58 = $58
f61 = $61
f6F = $6F
f74 = $74
f7D = $7D
f82 = $82
f86 = $86
f8B = $8B
f90 = $90
f94 = $94
f99 = $99
f9E = $9E
fA2 = $A2
fA7 = $A7
fB4 = $B4
fB5 = $B5
fC3 = $C3
fC8 = $C8
fCA = $CA
fCC = $CC
fD6 = $D6
fDA = $DA
fDE = $DE
;
; **** ZP ABSOLUTE ADRESSES **** 
;
a01 = $01
a02 = $02
a04 = $04
a05 = $05
a06 = $06
a09 = $09
a0A = $0A
a0B = $0B
a0C = $0C
a0D = $0D
a0E = $0E
a0F = $0F
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
a43 = $43
a44 = $44
a49 = $49
a4A = $4A
a4B = $4B
a4C = $4C
a4D = $4D
a4E = $4E
a4F = $4F
a51 = $51
a52 = $52
a60 = $60
a65 = $65
a6D = $6D
a6E = $6E
a7B = $7B
a7C = $7C
a81 = $81
a82 = $82
a83 = $83
a84 = $84
a85 = $85
a86 = $86
a87 = $87
a89 = $89
a8A = $8A
a8F = $8F
a90 = $90
a91 = $91
a92 = $92
a93 = $93
a97 = $97
a98 = $98
a9D = $9D
a9E = $9E
a9F = $9F
aA0 = $A0
aA1 = $A1
aA2 = $A2
aA5 = $A5
aA6 = $A6
aC7 = $C7
aCC = $CC
aCD = $CD
aCF = $CF
aD0 = $D0
aD1 = $D1
aD2 = $D2
aD3 = $D3
aD4 = $D4
aD5 = $D5
aE0 = $E0
aE1 = $E1
aE3 = $E3
aE4 = $E4
aE6 = $E6
aF0 = $F0
aF1 = $F1
aF2 = $F2
aF3 = $F3
aF4 = $F4
aF5 = $F5
aF6 = $F6
aF7 = $F7
aF8 = $F8
aFA = $FA
aFB = $FB
aFC = $FC
aFD = $FD
aFE = $FE
aFF = $FF
;
; **** ZP POINTERS **** 
;
p20 = $20
p22 = $22
p24 = $24
p26 = $26
p30 = $30
p32 = $32
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
f0037 = $0037
f0045 = $0045
f0061 = $0061
f007D = $007D
f008B = $008B
f0099 = $0099
f00A2 = $00A2
f00B5 = $00B5
f00C3 = $00C3
f00E0 = $00E0
;
; **** ABSOLUTE ADRESSES **** 
;
a028A = $028A
a02A0 = $02A0
aFFFF = $FFFF
;
; **** POINTERS **** 
;
p0026 = $0026
p35 = $0035
p0135 = $0135
p0232 = $0232
;
; **** EXTERNAL JUMPS **** 
;
e00FF = $00FF

        * = $0334

        JMP j1D8F

s0337   JMP j28FF

        JMP j1D2A

s033D   JMP j1A05

s0340   JMP j1D68

s0343   JMP j0D3D

        JMP j1DC2

        JMP j224E

s034C   JMP j117F

s034F   JMP j2506

s0352   JMP j2549

        JMP j123A

s0358   JMP j0CB3

s035B   JMP j07DE

        JMP j0382

j0361   JMP j0D24

s0364   JMP j07D5

s0367   JMP j0382

s036A   JMP j1659

        JMP j0B2B

        JMP j07C9

        JMP j07CF

j0376   JMP j0451

j0379   JMP j0431

s037C   JMP j042D

j037F   JMP j0444

j0382   JSR s16DA
        JSR s09F3
        LDA #$0C     ;#%00001100
        JSR s8100
        LDA #$FF     ;#%11111111
        STA $D015    ;Sprite display Enable
        CLI 
j0393   JSR j07D5
        JSR j0D3D
        JSR j1D68
        JSR j0B2B
a03A0   =*+$01
        JSR s0F6C
        INC a0559
        LDA a0559
        CMP #$06     ;#%00000110
        BCC b03B4
        LDA #$00     ;#%00000000
        STA a0559
        JMP j03F6

b03B4   JSR s040B
        JSR s12A7
        JSR s1985
        JSR j117F
        JSR j1D2A
        JSR s14F0
        JSR j2506
        JSR j2549
        JSR s1A51
        JSR j123A
        JSR s1819
        JSR s25C8
        JSR s0E5B
        JSR s152E
        JSR s0BF9
        JSR s0C49
        JSR s0A41
        JSR s0D99
        JSR j1A05
        JSR j0CB3
        JSR s0900
        JSR s043F
j03F6   JSR j28FF
        JMP j0393

s03FC   LDY #$0D     ;#%00001101
b03FE   LDX fB5,Y
f0400   LDA f45,X
        BNE b0408
        DEY 
        BPL b03FE
        INY 
b0408   STY aFC
        RTS 

s040B   LDA aFF
        BNE b0426
        LDA aFE
a0412   =*+$01
a0411   CMP #$88     ;#%10001000
a0413   BCC b0426
a0416   =*+$01
a0415   CMP #$F0     ;#%11110000
f0418   =*+$01
        BCS b0426
        LDX a042C
        BNE b042B
        INC a042C
f0421   LDA #$04     ;#%00000100
a0425   =*+$02
        JMP s8100

a0427   =*+$01
b0426   LDX #$00     ;#%00000000
        STX a042C
b042B   RTS 

a042C   .BYTE $00
j042D   STA f2576,X
        RTS 

j0431   LDX #$05     ;#%00000101
        LDA #$00     ;#%00000000
b0435   STA f2576,X
        STA f256A,X
        DEX 
        BPL b0435
        RTS 

s043F   LDA a0F
        BNE j0451
        RTS 

j0444   JSR s044C
        DEC a0F
        JMP j0382

s044C   INC a0F
f0450   =*+$02
        JSR s046E
j0451   LDA #$03     ;#%00000011
        JMP s046E

s0456   LDA a0B29
        BEQ s046E
        LDX aE6
        BEQ b046A
        LDX a0912
        BNE b046A
        LDA #$03     ;#%00000011
        STA a0F
        BNE s046E
b046A   CLC 
        ADC a0912
s046E   PHA 
        STA a0558
        SEI 
        LDA #$00     ;#%00000000
        STA $D015    ;Sprite display Enable
        STA $D021    ;Background Color 0
        LDA #$08     ;#%00001000
        STA $D016    ;VIC Control Register 2
        LDA #$1B     ;#%00011011
        STA $D011    ;VIC Control Register 1
        LDA #$01     ;#%00000001
        JSR s8100
        LDY #$1F     ;#%00011111
b048C   LDA f00E0,Y
        STA f0566,Y
        DEY 
        BPL b048C
        JSR sC000
        BCC b04AA
        LDA #$00     ;#%00000000
        JSR sC003
        LDX #$07     ;#%00000111
        LDA #$1A     ;#%00011010
        JSR s8100
        PLA 
        ASL 
        TAX 
b04AA   =*+$01
        LDA f0596,X
        STA a04BE
        LDA f0597,X
        STA a04BF
        LDA f058C,X
        JSR s8100
        JSR sC000
a04BE   .BYTE $96
a04BF   .BYTE $05
b04C0   LDA $D012    ;Raster Position
        CMP #$C8     ;#%11001000
        BNE b04C0
f04C8   =*+$01
        JSR j117F
        LDA #$02     ;#%00000010
        JSR s8100
        BEQ b04D3
        BNE b04C0
b04D3   JSR s180D
        LDA #$01     ;#%00000001
        JSR s8100
        LDA #$00     ;#%00000000
        JSR sC003
        LDA #$FF     ;#%11111111
        STA $D015    ;Sprite display Enable
        LDA #$0C     ;#%00001100
        JSR s8100
        LDX a0D23
        LDA #$1A     ;#%00011010
        JSR s8100
        LDA #$0B     ;#%00001011
        STA $D021    ;Background Color 0
        JSR sC000
        STX a05
        LDY #$1F     ;#%00011111
f0500   =*+$02
b04FE   LDA f0566,Y
        STA f00E0,Y
        DEY 
        BPL b04FE
        LDA a0F
        BNE b0510
        JSR s0513
        CLI 
        RTS 

b0510   PLA 
        PLA 
        RTS 

s0513   LDX a0558
        BEQ b054E
        DEX 
        LDA f055F,X
        STA aFE
        LDA f0561,X
        STA aFF
        LDA f0563,X
        STA aF8
        LDA #$28     ;#%00101000
        STA a0565
b052D   LDA #$08     ;#%00001000
        STA a0A
        JSR j1D68
        JSR j0D3D
        DEC a0565
        BNE b052D
        LDA #$00     ;#%00000000
        STA a0A
f0540   LDA #$10     ;#%00010000
        STA $D016    ;VIC Control Register 2
        JSR s1813
        JSR s1F9B
        JMP j1DD5

b054E   LDA #$01     ;#%00000001
        STA a0F
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
f0566   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $FF,$03,$20,$0D,$FF,$00
f058C   .BYTE $0B,$0B,$06,$06,$07,$07,$0B,$0B
        .BYTE $0A,$0A
f0596   .BYTE $A0
f0597   .BYTE $05,$FC,$05,$78,$06,$EC,$06,$00
        .BYTE $07
a05A0   .BYTE $FF,$01,$01,$03,$FF,$02,$01,$FF
        .BYTE $04,$54,$41,$53,$4B,$5B,$4F,$4E
        .BYTE $45,$5B,$43,$4F,$4D,$50,$4C,$45
f05B8   .BYTE $54,$45,$44,$2E,$FF,$01,$02,$06
        .BYTE $FF,$02,$05,$59,$4F,$55,$52,$5B
        .BYTE $44,$41,$54,$41,$5B,$52,$45,$56
        .BYTE $45,$41,$4C,$53,$FF,$01,$03,$09
        .BYTE $41,$4D,$45,$52,$49,$43,$41,$4E
        .BYTE $5B,$50,$2E,$4F,$2E,$57,$2E,$53
        .BYTE $FF,$01,$06,$0C,$54,$4F,$5B,$42
        .BYTE $45,$5B,$52,$45,$53,$43,$55,$45
        .BYTE $44,$2E,$FF,$00,$FF,$01,$01,$03
f0600   .BYTE $FF,$02,$01,$FF,$04,$54,$41,$53
f0608   .BYTE $4B,$5B,$4F,$4E,$45,$5B,$43,$4F
        .BYTE $4D,$50,$4C,$45,$54,$45,$44,$2E
        .BYTE $FF,$01,$05,$06,$FF,$02,$03,$4E
        .BYTE $4F,$57,$5B,$52,$45,$53,$43,$55
        .BYTE $45,$5B,$54,$48,$45,$FF,$01,$0C
        .BYTE $09,$50,$2E,$4F,$2E,$57,$2E,$53
        .BYTE $FF,$01,$06,$0C,$46,$52,$4F,$4D
        .BYTE $5B,$54,$48,$45,$5B,$43,$41,$4D
        .BYTE $50,$2E,$FF,$01,$06,$0F,$FF,$02
        .BYTE $0A,$55,$53,$45,$5B,$41,$4E,$59
f0658   .BYTE $5B,$45,$4E,$45,$4D,$59,$FF,$01
        .BYTE $00,$12,$45,$51,$55,$49,$50,$4D
        .BYTE $45,$4E,$54,$5B,$4E,$45,$43,$45
        .BYTE $53,$53,$41,$52,$59,$2E,$FF,$00
        .BYTE $FF,$01,$07,$03,$FF,$02,$01,$FF
        .BYTE $04,$59,$4F,$55,$52,$5B,$50,$52
        .BYTE $45,$53,$45,$4E,$43,$45,$FF,$01
        .BYTE $04,$06,$48,$41,$53,$5B,$42,$45
        .BYTE $45,$4E,$5B,$52,$45,$4C,$41,$59
a06A0   .BYTE $45,$44,$FF,$01,$08,$09,$54
f06A7   .BYTE $4F,$5B,$45,$4E,$45,$4D,$59,$5B
        .BYTE $48,$2E,$51,$2E,$FF,$01,$08,$0C
        .BYTE $FF,$02,$05,$41,$5B,$47,$55,$4E
        .BYTE $53,$48,$49,$50,$5B,$49,$53,$FF
        .BYTE $01,$07,$0F,$4E,$4F,$57,$5B,$4F
        .BYTE $4E,$5B,$43,$4F,$55,$52,$53,$45
        .BYTE $FF,$01,$06,$12,$41,$4E,$44,$5B
        .BYTE $49,$4E,$5B,$50,$55,$52,$53,$55
        .BYTE $49,$54,$2E,$FF,$00,$FF,$01,$0B
        .BYTE $0B,$FF,$02,$01,$FF,$04,$47,$41
        .BYTE $4D,$45,$5B,$4F,$56,$45,$52,$FF
        .BYTE $00
f0700   .BYTE $FF,$02,$01,$FF,$01,$05,$00,$43
        .BYTE $4F,$4E,$47,$52,$41,$54,$55,$4C
        .BYTE $41,$54
p0712   .BYTE $49,$4F,$4E,$53,$2E,$FF,$02,$03
        .BYTE $FF,$01,$07,$03,$54,$48,$41,$4E
        .BYTE $4B,$53,$5B,$54,$4F,$5B,$59,$4F
        .BYTE $55,$FF,$01,$04,$06,$54,$45,$4E
        .BYTE $5B,$50,$2E,$4F,$2E,$57,$2E,$53
        .BYTE $5B,$48,$41,$56,$45,$FF,$01,$07
        .BYTE $09,$42,$45,$45,$4E,$5B,$52,$45
        .BYTE $54,$55,$52,$4E,$45,$44,$FF,$01
        .BYTE $05,$0C,$54,$4F,$5B,$54,$48,$45
        .BYTE $5B,$48,$4F,$4D,$45,$4C,$E8,$2E
        .BYTE $FF,$02,$07,$FF,$01,$02,$0F,$FF
        .BYTE $05,$59,$4F,$55,$5B,$4B,$4E,$4F
        .BYTE $57,$5B,$59,$4F,$55,$5B,$4D,$55
        .BYTE $53,$54,$5B,$4E,$4F,$57,$5B,$52
        .BYTE $45,$54,$55,$52,$4E,$5B,$54,$4F
        .BYTE $5B,$47,$45,$54,$FF,$01,$03,$11
        .BYTE $4D,$4F,$52,$45,$5B,$55,$4E,$46
        .BYTE $4F,$52,$54,$55,$4E,$41
a07A0   .BYTE $54,$45,$5B,$53,$4F,$4C,$44,$49
        .BYTE $45,$52,$53,$5B,$54,$52,$41,$50
        .BYTE $50,$45,$44,$FF,$01,$0C,$13,$42
        .BYTE $59,$5B,$45,$4E,$45,$4D,$59,$5B
        .BYTE $46,$4F,$52,$43,$45,$53,$3C,$FF
        .BYTE $00
j07C9   LDA #$01     ;#%00000001
        STA a1D3E
        RTS 

j07CF   LDA #$00     ;#%00000000
        STA a1D3E
        RTS 

j07D5   JSR j1DC2
        JSR j1D8F
        JMP j224E

j07DE   TXA 
        PHA 
        ASL 
        TAX 
        LDA f256B,X
        STA a2493
        LDA f256A,X
        ASL 
        ASL 
        ASL 
        ASL 
        ORA a2493
        STA a2493
        PLA 
        TAX 
        LDA a2493
        RTS 

j07FB   LDX #$03     ;#%00000011
        STX a0827
b0800   LDA f086E,X
        BEQ b080B
        JSR s0872
        JMP j080E

b080B   JSR s0828
j080E   DEX 
        BPL b0800
        LDA a086D
        BNE b0826
        LDA a0827
        BPL b0826
        LDA #$00     ;#%00000000
        STA a0966
        STA a0967
        STA a0B2A
b0826   RTS 

a0827   .BYTE $00
s0828   LDA a0966
        CMP #$01     ;#%00000001
        BEQ b0830
        RTS 

b0830   DEC a0827
        LDA a086D
        BNE b0839
        RTS 

b0839   DEC a083F
        BEQ b0840
        RTS 

a083F   .BYTE $00
b0840   LDA #$32     ;#%00110010
        STA a083F
        LDA a0968
        STA f45,X
        LDA a0969
        STA f7D,X
        LDA #$CF     ;#%11001111
        STA f8B,X
        LDA #$0C     ;#%00001100
        STA f99,X
        DEC a086D
        LDA #$14     ;#%00010100
        STA f086E,X
        LDA #$00     ;#%00000000
        STA f61,X
        LDA #$01     ;#%00000001
        STA fC3,X
        LDA #$02     ;#%00000010
        STA a2578
        RTS 

a086D   .BYTE $0A
f086E   .BYTE $00,$00,$00,$00
s0872   CMP #$01     ;#%00000001
        BEQ b0879
        JMP j08A6

b0879   INC f7D,X
        BNE b0881
        LDA #$01     ;#%00000001
        STA f61,X
b0881   JSR s08BE
        BCC b0893
        LDA f8B,X
        CMP #$D6     ;#%11010110
        BNE b088E
        LDA #$D2     ;#%11010010
b088E   CLC 
        ADC #$01     ;#%00000001
        STA f8B,X
b0893   LDA f61,X
        LSR 
        LDA f7D,X
        ROR 
        CMP #$AA     ;#%10101010
        BEQ b089E
b089D   RTS 

b089E   LDA #$00     ;#%00000000
        STA f086E,X
        DEC fC3,X
        RTS 

j08A6   INC f45,X
        DEC f086E,X
        JSR s08BE
        BCC b089D
        LDA f8B,X
        CMP #$D2     ;#%11010010
        BNE b08B8
        LDA #$CE     ;#%11001110
b08B8   CLC 
        ADC #$01     ;#%00000001
        STA f8B,X
        RTS 

s08BE   LDA f08CF,X
        BNE b08CA
        LDA #$02     ;#%00000010
        STA f08CF,X
        SEC 
        RTS 

b08CA   DEC f08CF,X
        CLC 
        RTS 

f08CF   .BYTE $00,$00,$00,$00,$00
j08D4   LDX #$00     ;#%00000000
        LDA a0968
        CLC 
        ADC a0D
        STA a0968
        LDA a0966
        CMP #$01     ;#%00000001
        BEQ b08EB
        DEC a0966
        LDX #$02     ;#%00000010
b08EB   STX a1D62
        STX a1D67
        STX a1D66
        STX a1D63
        STX a1D64
        STX a1D65
        JMP j07FB

s0900   LDA a0E
        BNE b090B
        LDA a161E
        CMP #$E0     ;#%11100000
        BEQ b090C
b090B   RTS 

b090C   LDA a0912
        BEQ b0913
        RTS 

a0912   .BYTE $00
b0913   LDA a0B2A
        BNE b0919
        RTS 

b0919   LDA a0966
        BNE b0965
        INC a0912
        INC a0967
        LDA #$28     ;#%00101000
        STA a0966
        LDA #$33     ;#%00110011
        STA a1299
        LDA a52
        STA a1931
        LDA a8A
        STA a1932
        LDA #$0A     ;#%00001010
        STA a086D
        LDA #$00     ;#%00000000
        STA a1933
        JSR s1366
        LDA a2747
        ASL 
        ASL 
        ASL 
        CLC 
        ADC #$1A     ;#%00011010
        ADC aE3
        STA a0968
        LDA aF3
        ASL 
        ASL 
        ASL 
        ADC aE4
        STA a0969
        JSR s0AB7
        LDA #$1B     ;#%00011011
        JMP s8100

b0965   RTS 

a0966   .BYTE $00
a0967   .BYTE $00
a0968   .BYTE $00
a0969   .BYTE $00
s096A   LDX #$04     ;#%00000100
        LDA #$00     ;#%00000000
b096E   STA f120B,X
        STA f45,X
        DEX 
        BPL b096E
        LDX #$06     ;#%00000110
b0978   STA f1961,X
        STA f4A,X
        DEX 
        BPL b0978
        RTS 

a0981   .BYTE $00
a0982   .BYTE $00
s0983   LDA #$00     ;#%00000000
        JSR sC003
        LDA #$01     ;#%00000001
        STA a1093
        LDA #$1A     ;#%00011010
        LDX #$07     ;#%00000111
        JSR s8100
        LDA #$01     ;#%00000001
        JSR s8100
        LDA #$09     ;#%00001001
        JSR s8100
a09A0   =*+$02
        JSR j1D2A
        LDA a1D62
        STA a0981
a09A9   =*+$02
        JSR sC000
        .BYTE $7C,$10
        JSR s1813
b09AF   LDA $D012    ;Raster Position
        CMP #$64     ;#%01100100
        BNE b09AF
        LDA #$00     ;#%00000000
        JSR s8100
        LDA #$02     ;#%00000010
        JSR s8100
        BEQ b09E1
        JSR s09CA
        BEQ b09AF
        JMP b09E1

s09CA   JSR j1D2A
        LDA a1D62
        STA a0982
        CMP a0981
        BEQ b09E0
        STA a0981
        LDA a0982
        AND #$10     ;#%00010000
b09E0   RTS 

b09E1   JSR s180D
        LDA #$0D     ;#%00001101
        STA a1093
        JSR sC000
        BCC b09FE
        LDA #$00     ;#%00000000
        JSR sC003
s09F3   LDA #$E0     ;#%11100000
        STA a0A06
        LDA #$E7     ;#%11100111
        STA a0A03
b09FE   =*+$01
        LDX #$06     ;#%00000110
        LDY #$00     ;#%00000000
a0A03   =*+$02
b0A01   LDA $E770,Y
a0A06   =*+$02
        STA $E000,Y
        DEY 
        BNE b0A01
        INC a0A03
        INC a0A06
        DEX 
        BPL b0A01
        LDY #$6F     ;#%01101111
b0A15   LDA $EE70,Y
        STA $E700,Y
        DEY 
        BPL b0A15
        RTS 

s0A1F   LDA #$3F     ;#%00111111
        JSR s26FA
        BCC b0A39
        LDA a0A3F
        BNE b0A38
        LDA a0A40
        EOR #$01     ;#%00000001
        STA a0A40
        LDA #$01     ;#%00000001
        STA a0A3F
b0A38   RTS 

b0A39   LDA #$00     ;#%00000000
        STA a0A3F
        RTS 

a0A3F   .BYTE $00
a0A40   .BYTE $00
s0A41   LDA a51
        CMP #$0A     ;#%00001010
        BNE b0A48
        RTS 

b0A48   STA a25C4
        LDA a52
        STA a25C5
        LDA a89
        STA a25C0
        LDA a6D
        STA a25C1
        LDA a8A
        STA a25C2
        LDA #$00     ;#%00000000
        STA a25C3
        LDA #>p0C0A  ;#%00001100
        STA a25C7
        LDA #<p0C0A  ;#%00001010
        STA a25C6
        JSR s257D
        BCS b0A74
        RTS 

b0A74   LDX a0BE0
        LDA f0BED,X
        BMI b0A9F
        ORA a1A47
        STA a1A47
        TXA 
        PHA 
        JSR s1985
        PLA 
        TAX 
        CPX #$03     ;#%00000011
        BEQ b0ADC
        LDA #$00     ;#%00000000
        STA f0BED,X
        LDA #$03     ;#%00000011
        STA a2578
        LDA #$1E     ;#%00011110
        JSR j0D24
        JMP j0BC9

b0A9F   LDA a0E
        BNE b0AB6
        STA f0BED,X
        INC a0B29
        LDA #$05     ;#%00000101
        STA a2578
        LDA #$1E     ;#%00011110
        JSR j0D24
        JMP j0BC9

b0AB6   RTS 

s0AB7   LDX #$04     ;#%00000100
b0AB9   LDA #$00     ;#%00000000
        STA f61,X
        STA fC8,X
        STA fCA,X
        STA fC3,X
        STA f1961,X
        STA f1963,X
        STA f120B,X
        STA a101E
        STA a101D
        STA f45,X
        STA f4A,X
        STA f4C,X
        DEX 
        BPL b0AB9
        RTS 

b0ADC   JSR s0AB7
        LDA #$00     ;#%00000000
        STA aD0
        STA a0B
        JSR s0456
        LDA #$01     ;#%00000001
        STA a2480
        STA a0967
        STA a0B2A
        JSR s0C9C
        LDA a0912
        JSR s3003
        LDA #$00     ;#%00000000
        STA a2480
        STA a0B
        STA a0967
        INC aD0
        LDA #$B2     ;#%10110010
        STA a0BE8
        LDA #$00     ;#%00000000
        STA a0BEC
        STA a6E
        LDA #$4F     ;#%01001111
        STA a0BE4
        STX a8A
        STY a52
        JSR s1F9B
        JSR j1DD5
        JSR s0C9C
        JMP j12DF

a0B29   .BYTE $00
a0B2A   .BYTE $00
j0B2B   LDX #$03     ;#%00000011
j0B2D   LDA f0BED,X
        BNE b0B35
b0B32   JMP j0BC6

b0B35   LDA f0BE1,X
        SEC 
        SBC aF8
        BCC b0B32
        CMP #$2D     ;#%00101101
        BCS b0B32
        TAY 
        LDA aFF
        CMP f0BE9,X
        BCC b0B32
        LDA aFE
        CMP f0BE5,X
        BCC b0B32
        LDA aFE
        SEC 
        SBC f0BE5,X
        STA a2745
        LDA aFF
        SBC f0BE9,X
        STA a2746
        LDA a2746
        BNE b0B32
        LDA a2745
        CMP #$15     ;#%00010101
        BCS b0B32
        ASL 
        ASL 
        ASL 
        CLC 
        ADC aE3
        CLC 
        ADC #$1F     ;#%00011111
        STA a51
        TYA 
        ASL 
        ASL 
        ASL 
        PHA 
        LDA #$00     ;#%00000000
        ROL 
        STA a6D
        PLA 
        CLC 
        ADC aE4
        STA a89
        LDA f0BF5,X
        STA a97
        STX a0BE0
        LDA #$01     ;#%00000001
        STA aCF
        CPX #$03     ;#%00000011
        BNE b0BBD
        LDA #$0E     ;#%00001110
        STA aA5
        STA a9D
        LDA a97
a0BA0   CLC 
        ADC #$01     ;#%00000001
        STA a8F
        LDA a51
        STA a49
a0BA9   LDA a89
        SEC 
        SBC #$18     ;#%00011000
        STA a81
        LDA a6D
        BCS b0BB6
        EOR #$01     ;#%00000001
b0BB6   STA a65
        LDA #$01     ;#%00000001
        STA aC7
        RTS 

b0BBD   LDY a1B70
        LDA f1B71,Y
        STA aA5
        RTS 

j0BC6   DEX 
        BPL b0BDD
j0BC9   LDA #$00     ;#%00000000
        STA aCF
        LDA #$00     ;#%00000000
        STA a51
        LDA a120F
        BNE b0BDC
        STA a49
        LDA #$00     ;#%00000000
        STA aC7
b0BDC   RTS 

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
s0BF9   LDX a0C0F
        LDA f120B,X
        CMP #$01     ;#%00000001
        BNE b0C06
        JSR s0C10
b0C06   DEX 
        BPL b0C0B
p0C0A   =*+$01
        LDX #$03     ;#%00000011
b0C0B   STX a0C0F
        RTS 

a0C0F   .BYTE $00
s0C10   LDA f45,X
        STA a25C4
        LDA a52
        STA a25C5
        LDA f7D,X
        STA a25C0
        LDA f61,X
        STA a25C1
        LDA a8A
        STA a25C2
        LDA #$00     ;#%00000000
        STA a25C3
        LDA #>p0C0A  ;#%00001100
        STA a25C7
        LDA #<p0C0A  ;#%00001010
        STA a25C6
        JSR s257D
        BCC b0C48
        LDA a0B
        ADC #$03     ;#%00000011
        STA a0B
        TXA 
        TAY 
        JMP j15C6

b0C48   RTS 

s0C49   LDX a0C9B
        LDA f1961,X
        BEQ b0C54
        JSR s0C5D
b0C54   DEX 
        BPL b0C59
        LDX #$03     ;#%00000011
b0C59   STX a0C9B
        RTS 

s0C5D   LDA f4A,X
        STA a25C4
        LDA a52
        STA a25C5
        LDA f82,X
        ASL 
        STA a25C0
        LDA #$00     ;#%00000000
        ROL 
        STA a25C1
        LDA a8A
        STA a25C2
        LDA #$00     ;#%00000000
        STA a25C3
        LDA #>p0C0A  ;#%00001100
        STA a25C7
        LDA #<p0C0A  ;#%00001010
        STA a25C6
        JSR s257D
        BCC b0C9A
        LDA a0B
        ADC #$06     ;#%00000110
        STA a0B
        LDA #$18     ;#%00011000
        JSR j0D24
        JMP j25E4

b0C9A   RTS 

a0C9B   .BYTE $00
s0C9C   LDX #$14     ;#%00010100
b0C9E   LDA f4840,X
        STA f4400,X
        LDA f4855,X
        STA f4440,X
        DEX 
        BPL b0C9E
        LDA #$30     ;#%00110000
        STA a0CED
        RTS 

j0CB3   LDA a0B
        BEQ b0CEC
        DEC a0B
        DEC a0CED
        BPL b0CC3
        LDA #$01     ;#%00000001
        STA a0F
        RTS 

b0CC3   LDA a0CED
        PHA 
        LSR 
        LSR 
        LSR 
        CMP #$03     ;#%00000011
        BCC b0CD1
        CLC 
        ADC #$3D     ;#%00111101
b0CD1   TAX 
        PLA 
        AND #$07     ;#%00000111
        TAY 
        LDA #$06     ;#%00000110
        STA a2493
b0CDB   LDA f4400,X
        EOR f0CEE,Y
        STA f4400,X
        INX 
        INX 
        INX 
        DEC a2493
        BPL b0CDB
b0CEC   RTS 

a0CED   .BYTE $00
f0CEE   .BYTE $80,$40,$20,$10,$08,$04,$02,$01
j0CF6   LDA #$0D     ;#%00001101
        JSR s26FA
        BCC b0D1C
        LDA a0D22
        BNE b0D1B
        INC a0D22
        LDA a0D3B
        EOR #$01     ;#%00000001
        STA a0D3B
        LDA a0D23
        EOR #$07     ;#%00000111
        STA a0D23
        TAX 
        LDA #$1A     ;#%00011010
        JMP s8100

b0D1B   RTS 

b0D1C   LDA #$00     ;#%00000000
        STA a0D22
        RTS 

a0D22   .BYTE $00
a0D23   .BYTE $00
j0D24   STA a0D3C
        TXA 
        PHA 
        TYA 
        PHA 
        LDA a0D3B
        BNE b0D36
        LDA a0D3C
        JSR s8100
b0D36   PLA 
        TAY 
        PLA 
        TAX 
        RTS 

a0D3B   .BYTE $00
a0D3C   .BYTE $00
j0D3D   LDA a1D8C
        BNE b0D43
        RTS 

b0D43   LDX #$00     ;#%00000000
        STX a1D8C
        LSR 
        BCC b0D4E
        JMP j2867

b0D4E   LSR 
        BCC b0D54
        JMP j2832

b0D54   LSR 
        BCC b0D5A
        JMP j277A

b0D5A   JMP j274A

s0D5D   LDY f0D88,X
        BPL b0D76
        LDA #$01     ;#%00000001
        STA f120B,X
        LDA #$07     ;#%00000111
        JSR s24D3
        TAY 
        LDA f1231,Y
        STA f1210,X
        JMP j10BE

b0D76   CPY #$02     ;#%00000010
        BNE b0D7C
        INC f8B,X
b0D7C   LDA f0D8A,Y
        CLC 
        ADC f45,X
        STA f45,X
        DEC f0D88,X
        RTS 

f0D88   .BYTE $04,$00
f0D8A   .BYTE $00,$00,$00,$04,$03,$02,$02,$02
        .BYTE $01,$01,$00,$00,$00,$FF,$FF
s0D99   LDA a0967
        BEQ b0D9F
        RTS 

a0DA0   =*+$01
b0D9F   LDX #$07     ;#%00000111
        LDY a0E59
        BPL b0DCA
        LDY #$1F     ;#%00011111
        STY a0E59
        LDA a32
        CLC 
        ADC #$28     ;#%00101000
        STA a32
        LDA a33
        ADC #$00     ;#%00000000
        STA a33
        DEC a0E5A
        BPL b0DCA
        LDA #<p402C  ;#%00101100
        STA a32
        LDA #>p402C  ;#%01000000
        STA a33
        LDA #$11     ;#%00010001
        STA a0E5A
b0DCA   LDA (p32),Y
        CMP #$93     ;#%10010011
        BNE b0DD9
        STY a2493
        JSR s0DE1
        LDY a2493
b0DD9   DEY 
        DEX 
        BPL b0DCA
        STY a0E59
        RTS 

s0DE1   LDA #$04     ;#%00000100
        JSR s24D3
        TAY 
        LDA f120B,Y
        BEQ b0DED
        RTS 

b0DED   LDA #$0E     ;#%00001110
        STA f0D88,Y
        LDA #$05     ;#%00000101
        STA f120B,Y
        LDA #$09     ;#%00001001
        STA f0099,Y
        STA f00C3,Y
        LDA #$00     ;#%00000000
        STA f106C,Y
        STY a2745
        LDA a2493
        CLC 
        ADC #$28     ;#%00101000
        TAY 
        LDA (p32),Y
        LDY a2745
        CMP #$67     ;#%01100111
        BNE b0E21
        LDA #$0B     ;#%00001011
        STA f1210,Y
        LDA #$76     ;#%01110110
        JMP j0E28

b0E21   LDA #$0C     ;#%00001100
        STA f1210,Y
        LDA #$78     ;#%01111000
j0E28   STA f008B,Y
        LDA #$0E     ;#%00001110
        SEC 
        SBC a0E5A
        ASL 
        ASL 
        ASL 
        CLC 
        ADC #$48     ;#%01001000
        ADC aE3
        STA f0045,Y
        LDA aE4
        LSR 
        CLC 
        ADC #$18     ;#%00011000
        STA a2745
        LDA a2493
        ASL 
        ASL 
        CLC 
        ADC a2745
        ASL 
        STA f007D,Y
        LDA #$00     ;#%00000000
        ROL 
        STA f0061,Y
        RTS 

a0E59   .BYTE $FF
a0E5A   .BYTE $00
s0E5B   LDA a0967
        BEQ b0E61
        RTS 

b0E61   LDX a0EB3
        BPL b0E67
        RTS 

b0E67   LDY #$07     ;#%00000111
b0E69   LDA f42D0,X
        CMP #$FD     ;#%11111101
        BEQ b0E78
        DEX 
        DEY 
        BPL b0E69
        STX a0EB3
        RTS 

b0E78   LDA aE4
        CLC 
        ADC #$11     ;#%00010001
        LSR 
        STA a2493
        TXA 
        ASL 
        ASL 
        CLC 
        ADC a2493
        ASL 
        ROL a65
        STA a81
        LDA #$BC     ;#%10111100
        CLC 
        ADC aE3
        STA a49
        LDA #$FF     ;#%11111111
        STA a0EB3
        LDA #$01     ;#%00000001
        STA a1070
        LDA #$02     ;#%00000010
        STA a120F
        LDA #$00     ;#%00000000
        STA a1214
        LDA #$0B     ;#%00001011
        STA a9D
        INC aC7
        LDX #$04     ;#%00000100
        JMP j10BE

a0EB3   .BYTE $00
s0EB4   LDX a0EDB
        LDY a0EDA
        LDA #$00     ;#%00000000
        STA f7ED8,X
        INX 
        INY 
        INY 
        TXA 
        AND #$07     ;#%00000111
        TAX 
        TYA 
        AND #$07     ;#%00000111
        TAY 
        LDA f7ED8,X
        ORA f1A49,Y
        STA f7ED8,X
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

b0EE4   LDA a2493
        BEQ b0EF6
        LDA #$01     ;#%00000001
        STA a2745
        LDA #$51     ;#%01010001
        STA a2493
        JMP j0F00

b0EF6   LDA #$00     ;#%00000000
        STA a2745
        LDA #$10     ;#%00010000
        STA a2493
j0F00   LDA a2493
        STA a81
        LDA a2745
        STA a65
        TXA 
        ASL 
        ASL 
        ASL 
        CLC 
        ADC aE3
        ADC #$2C     ;#%00101100
        STA a49
        JMP j0F48

s0F18   PHA 
        LDA a0967
        BEQ b0F20
        PLA 
        RTS 

b0F20   LDA a28E6
        CMP #$C0     ;#%11000000
        BEQ b0F6A
        LDA #$2B     ;#%00101011
        STA a49
        LDA aE4
        CLC 
        ADC #$01     ;#%00000001
        LSR 
        STA a2493
        LDA a2747
        CLC 
        ADC #$02     ;#%00000010
        ASL 
        ASL 
        CLC 
        ADC a2493
        ASL 
        STA a81
        LDA #$00     ;#%00000000
        ROL 
        STA a65
j0F48   LDA #$01     ;#%00000001
        STA a1070
        STA aC7
        LDA #$02     ;#%00000010
        STA a120F
        LDA #$00     ;#%00000000
        STA a1214
        LDA #$0B     ;#%00001011
        STA a9D
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

s0F6C   LDA a0967
        BEQ b0F72
        RTS 

b0F72   LDX #$04     ;#%00000100
b0F74   LDA f120B,X
        BEQ b0F7F
        JSR s0F90
        JMP j0F82

b0F7F   JSR s11B1
j0F82   DEX 
        BPL b0F74
        JSR s2961
        CMP #$00     ;#%00000000
        BNE b0F8F
        INC a11C1
b0F8F   RTS 

s0F90   CMP #$05     ;#%00000101
        BNE b0F9A
        JSR s0D5D
        JMP j1184

b0F9A   CMP #$04     ;#%00000100
        BNE b0FBB
a0FA0   =*+$02
        JSR j1184
        LDA f1100,X
        BEQ b0FAA
        DEC f1100,X
        RTS 

b0FAA   LDA #$04     ;#%00000100
        STA f1100,X
        LDA f8B,X
        CMP #$82     ;#%10000010
        BEQ b0FB8
        INC f8B,X
        RTS 

b0FB8   JMP j1191

b0FBB   CMP #$02     ;#%00000010
        BNE b0FDD
        LDA a101E
        BEQ b0FD7
        DEC a101E
        LDA #$28     ;#%00101000
        STA a101D
        INC a120F
        JSR j1184
        LDA #$7D     ;#%01111101
        STA a8F
        RTS 

b0FD7   JSR j1184
        JMP j109C

b0FDD   CMP #$03     ;#%00000011
        BNE b101F
        LDA a101D
        BNE b0FF0
        TYA 
        PHA 
        LDY #$04     ;#%00000100
        JSR j15C6
        PLA 
        TAY 
        RTS 

b0FF0   LDA a101D
        LSR 
        LSR 
        TAY 
        LDA f1012,Y
        CLC 
        ADC a49
        STA a49
        LDA a101D
        SEC 
        SBC f1012,Y
        STA a101D
        BCS b100F
        LDA #$00     ;#%00000000
        STA a101D
b100F   JMP j1184

f1012   .BYTE $01,$FD,$03,$03,$03,$02,$02,$02
        .BYTE $01,$01,$01
a101D   .BYTE $00
a101E   .BYTE $00
b101F   JSR s1032
        JSR j1184
        LDA a24F4
        CMP #$0A     ;#%00001010
        BCS b102F
        JSR s1061
b102F   JMP j1096

s1032   JSR j1659
        LDY f1210,X
        LDA f1071,Y
        TAY 
        LDA (p30),Y
        CMP #$1B     ;#%00011011
        BCC b1054
        CMP #$2A     ;#%00101010
        BCS b1054
        LDA f106C,X
        BEQ b1053
        JSR j10BE
        LDA #$00     ;#%00000000
        STA f106C,X
b1053   RTS 

b1054   INC f106C,X
        LDA f106C,X
        CMP #$0A     ;#%00001010
        BCC s1061
        JMP j1191

s1061   JSR s2941
        TAY 
        LDA f1231,Y
        STA f1210,X
        RTS 

f106C   .BYTE $00,$00,$00,$00
a1070   .BYTE $00
f1071   .BYTE $00,$79,$29,$01,$52,$7A,$2A,$00
        .BYTE $50,$79,$29,$FF,$03,$20,$01,$FF
        .BYTE $04,$FF,$01,$0F,$0B,$FF,$02,$01
        .BYTE $52,$45,$41,$44,$59,$FF,$00,$FF
        .BYTE $03,$20
a1093   .BYTE $01,$FF,$00
j1096   LDA f106C,X
        BEQ j109C
        RTS 

j109C   LDA f1100,X
        BEQ b10A5
        DEC f1100,X
        RTS 

b10A5   LDA #$02     ;#%00000010
        STA f1100,X
        LDA f120B,X
        CMP #$02     ;#%00000010
        BNE b10B6
        LDA #$14     ;#%00010100
        STA f1100,X
b10B6   LDY f10FB,X
        LDA f10E2,Y
        BNE b10D1
j10BE   LDY f1210,X
        LDA f10D7,Y
        TAY 
        STA f10FB,X
        LDA f10E2,Y
        STA f8B,X
        INC f10FB,X
        RTS 

b10D1   INC f10FB,X
        STA f8B,X
        RTS 

f10D7   .BYTE $14,$00,$05,$00,$0F,$00,$05,$00
        .BYTE $0A,$00,$05
f10E2   .BYTE $6A,$6B,$6C,$6D,$00,$66,$67,$68
        .BYTE $69,$00,$72,$73,$74,$75,$00,$6E
        .BYTE $6F,$70,$71,$00,$7A,$7B,$7C,$7B
        .BYTE $00
f10FB   .BYTE $00,$00,$00,$00,$00
f1100   .BYTE $00,$00,$00,$00,$00
j1105   LDY f1210,X
        LDA f106C,X
        BEQ b1112
        LDA #$00     ;#%00000000
p1110   =*+$01
        JMP j1115

b1112   LDA f1165,Y
j1115   CLC 
        ADC a0C
        STA a1163
        LDA f106C,X
        BEQ b1125
        LDA #$00     ;#%00000000
        JMP j1128

b1125   LDA f1172,Y
j1128   CLC 
        ADC a0D
        STA a1164
        LDA a1163
        BMI b1144
        LDA f7D,X
        CLC 
        ADC a1163
        STA f7D,X
        BCC b1141
        LDA #$01     ;#%00000001
        STA f61,X
b1141   JMP j115A

b1144   EOR #$FF     ;#%11111111
        CLC 
        ADC #$01     ;#%00000001
        STA a2493
        LDA f7D,X
        SEC 
        SBC a2493
        STA f7D,X
        BCS j115A
        LDA #$00     ;#%00000000
        STA f61,X
j115A   LDA f45,X
        CLC 
        ADC a1164
        STA f45,X
        RTS 

a1163   .BYTE $00
a1164   .BYTE $00
f1165   .BYTE $00,$00,$00,$00,$01,$01,$01,$00
        .BYTE $FF,$FF,$FF,$01,$FF
f1172   .BYTE $00,$01,$FF,$00,$00,$01,$FF,$00
        .BYTE $00,$01,$FF,$00,$00
j117F   LDA #$00     ;#%00000000
        JMP s8100

j1184   LDA f45,X
        CMP #$C5     ;#%11000101
        BCS j1191
        CMP #$0A     ;#%00001010
        BCC j1191
        JMP j11A0

j1191   LDA #$00     ;#%00000000
        STA f120B,X
        STA f106C,X
        LDA #$00     ;#%00000000
        STA f45,X
        DEC fC3,X
        RTS 

j11A0   LDA f61,X
        LSR 
        LDA f7D,X
        ROR 
        CMP #$A9     ;#%10101001
        BCS j1191
        CMP #$02     ;#%00000010
        BCC j1191
        JMP j1105

s11B1   CPX #$04     ;#%00000100
        BNE b11B6
        RTS 

b11B6   LDA a0B29
        BNE b11C5
        LDA a11C1
        BNE b11C2
        RTS 

a11C1   .BYTE $00
b11C2   DEC a11C1
b11C5   LDA #$07     ;#%00000111
        JSR s24D3
        TAY 
        LDA f121C,Y
        JSR s24D3
        CLC 
        ADC f1215,Y
        ASL 
        STA f7D,X
        ROL f61,X
        LDA f122A,Y
        JSR s24D3
        CLC 
        ADC f1223,Y
        STA f45,X
        LDA f1231,Y
        STA f1210,X
        LDA #$01     ;#%00000001
        STA f120B,X
        STA fC3,X
        LDA #$00     ;#%00000000
        STA f106C,X
        LDA #$04     ;#%00000100
        JSR s24D3
        TAY 
        LDA f1207,Y
        STA f99,X
        JMP j10BE

        RTS 

f1207   .BYTE $0B,$0F,$05,$09
f120B   .BYTE $00,$00,$00,$00
a120F   .BYTE $00
f1210   .BYTE $00,$00,$00,$00
a1214   .BYTE $00
f1215   .BYTE $04,$A6,$04,$04,$04,$A6,$A6
f121C   .BYTE $00,$00,$8E,$00,$00,$00,$00
f1223   .BYTE $32,$32,$1D,$C4,$32,$C4,$32
f122A   .BYTE $8C,$8C,$00,$00,$00,$00,$00
f1231   .BYTE $04,$08,$01,$06,$05,$0A,$09,$02
        .BYTE $00
j123A   LDX #$06     ;#%00000110
b123C   LDA f1961,X
        BEQ b1254
        LDA f4A,X
        CLC 
        ADC a0D
        STA f4A,X
        LDA a1266
        BNE b1254
        LDA f82,X
        CLC 
        ADC a0C
        STA f82,X
b1254   DEX 
        BPL b123C
        LDA a0C
        BEQ b1265
        DEC a1266
        BPL b1265
        LDA #$01     ;#%00000001
        STA a1266
b1265   RTS 

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
s12A7   LDA a1D62
        AND #$0F     ;#%00001111
        BEQ b12BB
        CMP a12F0
        BNE b12BC
        LDA a12F2
        BEQ b12C7
        DEC a12F2
b12BB   RTS 

b12BC   STA a12F0
        LDA #$00     ;#%00000000
        STA a12F2
        JMP j12DF

b12C7   LDA #$03     ;#%00000011
        STA a12F2
j12CC   LDX a12EF
        LDA f12FE,X
        BEQ j12DF
        STA aD1
        CLC 
        ADC #$04     ;#%00000100
        STA a98
        INC a12EF
        RTS 

j12DF   LDA a1D62
        AND #$0F     ;#%00001111
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
s1312   LDA a1D63
        AND a12F1
        STA a1D63
        LDA #$FF     ;#%11111111
        STA a12F1
        LDA aF8
        BEQ b135B
        CMP #$5A     ;#%01011010
        BEQ b1350
j1328   LDA aFF
        BEQ b1337
        CMP #$03     ;#%00000011
        BNE b1336
        LDA aFE
        CMP #$B8     ;#%10111000
        BCS b133E
b1336   RTS 

b1337   LDA aFE
        CMP #$19     ;#%00011001
        BCC b1347
        RTS 

b133E   LDA a1D63
        AND #$1E     ;#%00011110
        STA a1D63
        RTS 

b1347   LDA a1D63
        AND #$1D     ;#%00011101
        STA a1D63
        RTS 

b1350   LDA a1D63
        AND #$17     ;#%00010111
        STA a1D63
        JMP j1328

b135B   LDA a1D63
        AND #$1B     ;#%00011011
        STA a1D63
        JMP j1328

s1366   LDA aE4
        CLC 
        ADC #$16     ;#%00010110
        AND #$FE     ;#%11111110
        STA a2493
        LDA a1932
        SEC 
        SBC a2493
        PHA 
        BCS b137F
        LDA #$00     ;#%00000000
        JMP j1382

b137F   LDA a1933
j1382   LSR 
        PLA 
        ROR 
        LSR 
        LSR 
        STA a1A50
        LDA a1931
        SEC 
        SBC #$2D     ;#%00101101
        SBC aE3
        LSR 
        LSR 
        LSR 
        STA a1A46
        LDA aFE
        SEC 
        SBC a1A46
        AND #$F8     ;#%11111000
        STA aF0
        LDA aFF
        SBC #$00     ;#%00000000
        STA aF1
        LDA aF8
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
b13D6   STA a2493
        CPX a2493
        BNE b13E1
        JMP j14E9

b13E1   STA (pF4),Y
        LDX #$00     ;#%00000000
        STX aF4
        LSR 
        ROR aF4
        LSR 
        ROR aF4
        TAX 
        LDA aF4
        CLC 
        ADC #$00     ;#%00000000
        STA aF4
        TXA 
        ADC #$EF     ;#%11101111
        STA aF5
        LDA #>p4000  ;#%01000000
        STA a14AF
        LDA #<p4000  ;#%00000000
        STA a14AE
        LDA aF8
        AND #$07     ;#%00000111
        STA a14EA
        EOR #$07     ;#%00000111
        STA aF0
        LDA aFE
        AND #$07     ;#%00000111
        STA a2493
        STA a14ED
        EOR #$07     ;#%00000111
        STA a14EB
        LDX #$00     ;#%00000000
        STX a2747
        LDA a2493
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
        ASL 
        ASL 
        ASL 
        STA a30
        ASL 
        ROL a31
        ASL 
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
        ASL 
        ASL 
        ASL 
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
        STA p4000,X
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
s14F0   LDA a1D8C
        BEQ b14F6
        RTS 

b14F6   LDX a152D
        LDA f1965,X
        CMP #$05     ;#%00000101
        BEQ b1507
        CMP #$08     ;#%00001000
        BEQ b1507
        JMP j1524

b1507   TXA 
        PHA 
        CLC 
        ADC #$09     ;#%00001001
        TAX 
        JSR s169C
        PLA 
        TAX 
        LDY #$29     ;#%00101001
        LDA (p30),Y
        CMP #$1B     ;#%00011011
        BCC b1521
        CMP #$2A     ;#%00101010
        BCS b1521
        JMP j1524

b1521   JSR s18E4
j1524   DEX 
        BPL b1529
        LDX #$02     ;#%00000010
b1529   STX a152D
        RTS 

a152D   .BYTE $00
s152E   LDX a154E
        LDA f1965,X
        BEQ b1543
        CMP #$09     ;#%00001001
        BEQ b1543
        JSR s155F
        DEC a154E
        BMI b1548
        RTS 

b1543   DEC a154E
        BPL s152E
b1548   LDA #$02     ;#%00000010
        STA a154E
        RTS 

a154E   .BYTE $00
f154F   .BYTE $0D,$0C,$0C,$0C,$00,$0C,$00,$18
f1557   .BYTE $0D,$0B,$0B,$0B,$00,$0B,$00,$15
s155F   STA a2745
        LDY #$03     ;#%00000011
j1564   STY a2493
        LDA a2745
        SEC 
        SBC #$03     ;#%00000011
        TAY 
        LDA f154F,Y
        STA a25C6
        LDA f1557,Y
        STA a25C7
        LDY a2493
        LDA f120B,Y
        BEQ b15EA
        CMP #$04     ;#%00000100
        BEQ b15EA
        LDA f4E,X
        STA a25C4
        LDA f0045,Y
        STA a25C5
        LDA f86,X
        ASL 
        STA a25C0
        LDA #$00     ;#%00000000
        ROL 
        STA a25C1
        LDA f007D,Y
        STA a25C2
        LDA f0061,Y
        STA a25C3
        JSR s257D
        BCC b15EA
        LDA a2745
        CMP #$08     ;#%00001000
        BEQ b15C3
        CMP #$05     ;#%00000101
        BEQ b15C3
        CMP #$0A     ;#%00001010
        BEQ j15C6
        JSR s1837
        JMP j15C6

b15C3   JSR s1934
j15C6   LDA #$7E     ;#%01111110
        STA f008B,Y
        LDA #$01     ;#%00000001
        STA f106C,Y
        LDA #$00     ;#%00000000
        STA f1210,Y
        LDA #$04     ;#%00000100
        STA f120B,Y
        STA f1100,Y
        LDA #$01     ;#%00000001
        STA f0099,Y
        STA a2579
        LDA #$12     ;#%00010010
        JMP j0D24

b15EA   DEY 
        BPL b15EE
        RTS 

b15EE   JMP j1564

s15F1   LDX #$0D     ;#%00001101
        JSR j1659
        LDX #$03     ;#%00000011
        LDA a1D62
        STA a2493
b15FE   LDY f161F,X
        LDA (p30),Y
        STA a161E
        CMP #$1B     ;#%00011011
        BCC b1611
        CMP #$2A     ;#%00101010
        BCS b1611
        JMP j161A

b1611   LDA a1D62
        AND f1623,X
        STA a1D62
j161A   DEX 
        BPL b15FE
        RTS 

a161E   .BYTE $00
f161F   .BYTE $29,$50,$52,$79
f1623   .BYTE $1E,$1B,$17,$1D
f1627   .BYTE $00
f1628   .BYTE $40,$28,$40,$50,$40,$78,$40,$A0
        .BYTE $40,$C8,$40,$F0,$40,$18,$41,$40
        .BYTE $41,$68,$41,$90,$41,$B8,$41,$E0
        .BYTE $41,$08,$42,$30,$42,$58,$42,$80
        .BYTE $42,$A8,$42,$D0,$42,$F8,$42,$20
        .BYTE $43,$48,$43,$70,$43,$98,$43,$C0
        .BYTE $43
j1659   LDA aE4
        CLC 
        ADC #$16     ;#%00010110
        LSR 
        STA a2493
        LDA f61,X
        LSR 
        LDA f7D,X
        ROR 
        SEC 
        SBC a2493
        BCS b1670
        LDA #$00     ;#%00000000
b1670   LSR 
        LSR 
        STA a30
        LDA aE3
        CLC 
        ADC #$2D     ;#%00101101
        STA a2493
        LDA f45,X
        SEC 
        SBC a2493
        BCS b1686
        LDA #$00     ;#%00000000
b1686   AND #$F8     ;#%11111000
        LSR 
        LSR 
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

s169C   LDA aE4
        CLC 
        ADC #$16     ;#%00010110
        LSR 
        STA a2493
        LDA f7D,X
        SEC 
        SBC a2493
        BCS b16AF
        LDA #$00     ;#%00000000
b16AF   LSR 
        LSR 
        STA a30
        LDA aE3
        CLC 
        ADC #$2D     ;#%00101101
        STA a2493
        LDA f45,X
        SEC 
        SBC a2493
        BCS b16C5
        LDA #$00     ;#%00000000
b16C5   AND #$F8     ;#%11111000
        LSR 
        LSR 
        TAY 
        LDA f1627,Y
        CLC 
        ADC a30
        STA a30
        LDA f1628,Y
        ADC #$00     ;#%00000000
        STA a31
        RTS 

s16DA   JSR s180D
        LDX #$FD     ;#%11111101
        LDA #$00     ;#%00000000
b16E1   STA f02,X
        DEX 
        BNE b16E1
        JSR s2494
        LDA #$00     ;#%00000000
        STA a2305
        STA a6E
        JSR s03FC
        JSR s225C
        JSR s096A
        LDA #$32     ;#%00110010
        STA a0BE4
        LDA #$40     ;#%01000000
        STA a0BE8
        LDA #$01     ;#%00000001
        STA a0BEC
        LDX #$02     ;#%00000010
b170A   LDA f0BF1,X
        STA f0BED,X
        DEX 
        BPL b170A
        LDA #$04     ;#%00000100
        STA aE3
        STA a11C1
        STA aD0
        LDA #$00     ;#%00000000
        STA a0912
        STA a2480
        STA a0967
        STA a0B29
        STA aE4
        STA a0E
        STA a0A40
        STA $D015    ;Sprite display Enable
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        STA a2482
        STA a0F
        STA a101E
        STA aE6
        STA a0B
        LDA #$07     ;#%00000111
        STA a1A47
        LDA #$96     ;#%10010110
        STA $DD00    ;CIA2: Data Port Register A
        LDA #$0F     ;#%00001111
        STA $D018    ;VIC Memory Control Register
        LDA #$32     ;#%00110010
        STA a1299
        JSR s0983
        LDA #$00     ;#%00000000
        STA a1D62
        JSR b12BC
        JSR s19C5
        JSR s0C9C
        LDA #$01     ;#%00000001
        JSR s8100
        LDA #$AC     ;#%10101100
        STA a8A
        LDA #$96     ;#%10010110
        STA a52
        JSR s1BD4
        JSR s12A7
        LDA $D016    ;VIC Control Register 2
        ORA #$10     ;#%00010000
        STA $D016    ;VIC Control Register 2
        LDA #$04     ;#%00000100
        STA a1D8E
        LDA #$00     ;#%00000000
        STA $D022    ;Background Color 1, Multi-Color Register 0
        STA $D020    ;Border Color
        STA $D01B    ;Sprite to Background Display Priority
        LDA #$08     ;#%00001000
        STA $D023    ;Background Color 2, Multi-Color Register 1
        LDA #$0B     ;#%00001011
        STA $D021    ;Background Color 0
a17A0   LDA #$FF     ;#%11111111
        STA $D01C    ;Sprites Multi-Color Mode Select
        LDA #$01     ;#%00000001
        STA $D025    ;Sprite Multi-Color Register 0
        STA a0D3B
        LDA #$00     ;#%00000000
        STA $D026    ;Sprite Multi-Color Register 1
        STA $D017    ;Sprites Expand 2x Vertical (Y)
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        STA aFF
        STA aFE
        LDA #$3C     ;#%00111100
        STA aF8
        LDA #$0A     ;#%00001010
        STA aA6
        LDX #$07     ;#%00000111
        LDA #$00     ;#%00000000
        STX a0D23
b17CB   STA f7FF8,X
        DEX 
        BPL b17CB
        LDX #$07     ;#%00000111
        LDA #$1A     ;#%00011010
        JSR s8100
        LDX #$19     ;#%00011001
b17DA   TXA 
        PHA 
        JSR s1FCF
        LDA #$01     ;#%00000001
        STA a1D8C
        JSR j0D3D
        PLA 
        TAX 
        DEX 
        BNE b17DA
        JSR b12C7
        JSR s0C9C
        JSR s1985
        JSR j2506
        JSR j2549
        JSR j2506
        JSR j1D8F
        JSR j28FF
        JSR s1813
        JSR s1F9B
        JMP j1DD5

s180D   LDA #$00     ;#%00000000
        STA $D011    ;VIC Control Register 1
        RTS 

s1813   LDA #$10     ;#%00010000
        STA $D011    ;VIC Control Register 1
        RTS 

s1819   LDX #$02     ;#%00000010
b181B   LDA f1965,X
        BEQ b1823
        JSR s1827
b1823   DEX 
        BPL b181B
        RTS 

s1827   CMP #$09     ;#%00001001
        BNE b182E
        JMP j1885

b182E   STA a2493
        LDA f4E,X
        CMP #$0A     ;#%00001010
        BCS b1843
s1837   LDA #$00     ;#%00000000
        STA f1965,X
        LDA #$00     ;#%00000000
        STA f4E,X
        DEC fCC,X
        RTS 

b1843   CMP #$C4     ;#%11000100
        BCC b184A
        JMP s1837

b184A   LDA f86,X
        CMP #$04     ;#%00000100
        BCS b1853
        JMP s1837

b1853   CMP #$AC     ;#%10101100
        BCS s1837
        LDA a2493
        CMP #$0A     ;#%00001010
        BNE b1861
        JMP j1968

b1861   LDA f4E,X
        CLC 
        ADC f1B56,X
        STA f4E,X
        LDA f86,X
        CLC 
        ADC f1B53,X
        STA f86,X
        LDA a2493
        CMP #$04     ;#%00000100
        BEQ b1879
        RTS 

b1879   LDA f94,X
        CMP #$40     ;#%01000000
        BEQ b1882
        INC f94,X
        RTS 

b1882   JMP j195C

j1885   LDA f1955,X
        AND #$7F     ;#%01111111
        LSR 
        LSR 
        LSR 
        CMP #$03     ;#%00000011
        BCS b189C
        STA a2493
        LDA #$38     ;#%00111000
        SEC 
        SBC a2493
        STA f94,X
b189C   LDA f1955,X
        BPL b18DA
        DEC f1955,X
        BPL b18D2
j18A6   AND #$7F     ;#%01111111
        TAY 
        LDA f1958,X
        CLC 
        ADC f194F,X
        STA f1958,X
        CLC 
        ADC f8000,Y
        CMP #$C0     ;#%11000000
        BCS s18E4
        CMP #$14     ;#%00010100
        BCC s18E4
        STA f4E,X
        LDA f86,X
        CLC 
        ADC f1952,X
        CMP #$A0     ;#%10100000
        BCS s18E4
        CMP #$0C     ;#%00001100
        BCC s18E4
        STA f86,X
        RTS 

b18D2   LDA #$00     ;#%00000000
        STA f1955,X
        JMP j18A6

b18DA   INC f1955,X
        LDA f1955,X
        CMP #$1A     ;#%00011010
        BNE j18A6
s18E4   LDY f1965,X
        LDA f1927,Y
        JSR j0D24
        JSR s1934
        TXA 
        PHA 
        CLC 
        ADC #$09     ;#%00001001
        TAX 
        JSR s169C
        PLA 
        TAX 
        LDY #$29     ;#%00101001
        LDA (p30),Y
        CMP #$1B     ;#%00011011
        BCC b1908
        CMP #$2A     ;#%00101010
        BCS b1908
        RTS 

b1908   TXA 
        PHA 
        LDA f4E,X
        CLC 
        ADC #$08     ;#%00001000
        STA a1931
        LDA f86,X
        CLC 
        ADC #$04     ;#%00000100
        ASL 
        STA a1932
        LDA #$00     ;#%00000000
        ROL 
        STA a1933
        JSR s1366
        PLA 
        TAX 
        RTS 

f1927   .BYTE $00,$00,$00,$00,$00,$0F,$00,$00
        .BYTE $0E,$0D
a1931   .BYTE $00
a1932   .BYTE $00
a1933   .BYTE $00
s1934   LDA #$41     ;#%01000001
        STA f94,X
        LDA #$0A     ;#%00001010
        STA f1965,X
        LDA a11C1
        ADC #$05     ;#%00000101
        STA a11C1
        LDA #$05     ;#%00000101
        STA fA2,X
        LDA #$02     ;#%00000010
        STA f197F,X
        RTS 

f194F   .BYTE $00,$00,$00
f1952   .BYTE $00,$00,$00
f1955   .BYTE $00,$00,$00
f1958   .BYTE $00,$00,$00
a195B   .BYTE $00
j195C   LDA #$39     ;#%00111001
        STA f94,X
        RTS 

f1961   .BYTE $00,$00
f1963   .BYTE $00,$00
f1965   .BYTE $00,$00,$00
j1968   LDA f197F,X
        BEQ b1971
        DEC f197F,X
        RTS 

b1971   LDA #$02     ;#%00000010
        STA f197F,X
        LDA f94,X
        CMP #$45     ;#%01000101
        BEQ b1982
        INC f94,X
        RTS 

f197F   .BYTE $00,$00,$00
b1982   JMP s1837

s1985   LDA #$14     ;#%00010100
        STA a241F
        LDA #$13     ;#%00010011
        STA a2422
        LDA a1A47
        AND #$01     ;#%00000001
        BNE b199B
        LDA #$22     ;#%00100010
        STA a241F
b199B   LDA a1A47
        AND #$08     ;#%00001000
        BNE b19A7
        LDA #$22     ;#%00100010
        STA a2422
b19A7   LDA a1A47
        LSR 
        LSR 
        LSR 
        AND #$06     ;#%00000110
        TAX 
        LDA f19BD,X
        STA a2423
        LDA f19BE,X
        STA a2424
        RTS 

f19BD   .BYTE $22
f19BE   .BYTE $22,$15,$16,$17,$18,$19,$1A
s19C5   LDX #$07     ;#%00000111
b19C7   LDA f242E,X
        STA f2426,X
        DEX 
        BPL b19C7
        RTS 

s19D1   LDX a0E
        LDY a1B70
        LDA f1B71,Y
        LDY a0CED
        CPY #$0A     ;#%00001010
        BCC b19E8
        LDY #$07     ;#%00000111
        STY a2425
        JMP j19EB

b19E8   STA a2425
j19EB   CPX #$04     ;#%00000100
        BEQ b19F7
        CPX #$05     ;#%00000101
        BEQ b19FE
        STA f2426,X
        RTS 

b19F7   STA a242A
        STA a242B
        RTS 

b19FE   STA a242C
        STA a242D
        RTS 

j1A05   LDA #$00     ;#%00000000
        STA $DC00    ;CIA1: Data Port Register A
        LDA $DC01    ;CIA1: Data Port Register B
        EOR #$FF     ;#%11111111
        BNE b1A17
        LDA #$FF     ;#%11111111
        STA $DC00    ;CIA1: Data Port Register A
        RTS 

b1A17   LDA #$3C     ;#%00111100
        JSR s26FA
        LDA #$00     ;#%00000000
        BCC b1A3F
        LDA a1A45
        BEQ b1A29
        DEC a1A45
        RTS 

b1A29   JSR s19C5
b1A2C   LDX a0E
        BNE b1A32
        LDX #$06     ;#%00000110
b1A32   DEX 
        STX a0E
        LDA a1A47
        AND f1A48,X
        BEQ b1A2C
        LDA #$0A     ;#%00001010
b1A3F   STA a1A45
        JMP j0CF6

a1A45   .BYTE $00
a1A46   .BYTE $00
a1A47   .BYTE $07
f1A48   .BYTE $01
f1A49   .BYTE $02,$04,$08,$10,$20,$40,$80
a1A50   .BYTE $00
s1A51   LDA a1D62
        AND #$10     ;#%00010000
        BEQ b1A5E
        CMP a1B59
        BNE b1A64
        RTS 

b1A5E   LDA #$00     ;#%00000000
        STA a1B59
        RTS 

b1A64   STA a1B59
        LDX #$02     ;#%00000010
b1A69   LDA f1965,X
        BEQ b1A72
        DEX 
        BPL b1A69
        RTS 

b1A72   LDY a0E
        CPY #$04     ;#%00000100
        BNE b1A81
        LDA a11C1
        CLC 
        ADC #$05     ;#%00000101
        STA a11C1
b1A81   LDA f1AFA,Y
        STA f1965,X
        LDA f1AF4,Y
        JSR j0D24
        LDA f1B00,Y
        STA fA2,X
        LDA a8A
        LSR 
        STA f86,X
        LDA a52
        SEC 
        SBC #$05     ;#%00000101
        STA f4E,X
        INC fCC,X
        LDY a1D67
        LDA a0E
        BNE b1AAC
        LDA #$39     ;#%00111001
        JMP j1AD9

b1AAC   CMP #$03     ;#%00000011
        BCS b1AB6
        LDA f1B11,Y
        JMP j1AD9

b1AB6   CMP #$05     ;#%00000101
        BNE b1AC0
        LDA f1B1C,Y
        JMP j1AD9

b1AC0   CMP #$03     ;#%00000011
        BNE b1AD6
        LDA #$9A     ;#%10011010
        STA f1955,X
        LDA f4E,X
        SEC 
        SBC #$2A     ;#%00101010
        STA f1958,X
        LDA #$36     ;#%00110110
        JMP j1AD9

b1AD6   LDA f1B06,Y
j1AD9   STA f94,X
        LDA f1B27,Y
        STA f1B53,X
        LDA f1B32,Y
        STA f1B56,X
        LDA f1B48,Y
        STA f194F,X
        LDA f1B3D,Y
        STA f1952,X
        RTS 

f1AF4   .BYTE $00,$11,$11,$13,$17,$10
f1AFA   .BYTE $04,$05,$06,$09,$03,$08
f1B00   .BYTE $0B,$04,$03,$05,$00,$0E
f1B06   .BYTE $1D,$1D,$1D,$00,$1E,$1F,$20,$00
        .BYTE $1E,$20,$1F
f1B11   .BYTE $26,$26,$27,$00,$29,$2C,$2D,$00
        .BYTE $28,$2A,$2B
f1B1C   .BYTE $2E,$2E,$2F,$00,$30,$34,$35,$00
        .BYTE $31,$32,$33
f1B27   .BYTE $00,$00,$00,$00,$FE,$FE,$FE,$00
        .BYTE $02,$02,$02
f1B32   .BYTE $FC,$FC,$04,$00,$00,$FC,$04,$00
        .BYTE $00,$FC,$04
f1B3D   .BYTE $00,$00,$00,$00,$FF,$FF,$FF,$00
        .BYTE $01,$01,$01
f1B48   .BYTE $FF,$FF,$01,$00,$00,$FF,$01,$00
        .BYTE $00,$FF,$01
f1B53   .BYTE $00,$00,$00
f1B56   .BYTE $00,$00,$00
a1B59   .BYTE $00
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
        LDA a52
        CMP #$AF     ;#%10101111
        BCS b1B87
        INC a52
b1B87   RTS 

s1B88   LDA a1C28
        SEC 
        BNE b1B96
        LDA #$7D     ;#%01111101
        CMP a52
        BCS b1B96
        DEC a52
b1B96   RTS 

s1B97   LDA a2493
        SEC 
        BNE b1BA5
        LDA a8A
        CMP #$DE     ;#%11011110
        BCS b1BA5
        INC a8A
b1BA5   RTS 

s1BA6   LDA a2493
        SEC 
        BNE b1BB4
        LDA #$7A     ;#%01111010
        CMP a8A
        BCS b1BB4
        DEC a8A
b1BB4   RTS 

s1BB5   LDA a1D62
        AND #$04     ;#%00000100
        CLC 
        BEQ b1BC1
        LDA #$7A     ;#%01111010
        CMP a8A
b1BC1   ROL a1C28
        LDA a1D62
        AND #$08     ;#%00001000
        CLC 
        BEQ b1BD0
        LDA a8A
        CMP #$DE     ;#%11011110
b1BD0   ROL a1C28
        RTS 

s1BD4   LDA a1D62
        STA a1C27
        LDA #$00     ;#%00000000
        STA a2493
        STA a1C28
        JSR s1BB5
        LSR a1C27
        BCC b1BED
        JSR s1B88
b1BED   ROR a2493
        LSR a1C27
        BCC b1BF8
        JSR s1B79
b1BF8   ROR a2493
        LSR a1C27
        BCC b1C03
        JSR s1BA6
b1C03   ROR a2493
        LSR a1C27
        BCC b1C0E
        JSR s1B97
b1C0E   ROR a2493
        ROR a2493
        ROR a2493
        ROR a2493
        ROR a2493
        LDA a1D63
        AND a2493
        STA a1D63
        RTS 

a1C27   .BYTE $00
a1C28   .BYTE $00
s1C29   LDA aE4
        STA a1CC0
        LDA a1D62
        TAX 
        AND #$03     ;#%00000011
        BEQ b1C6B
        TXA 
        AND #$0C     ;#%00001100
        BEQ b1C6B
        TXA 
        AND #$06     ;#%00000110
        CMP #$06     ;#%00000110
        BEQ b1C49
        TXA 
        AND #$09     ;#%00001001
        CMP #$09     ;#%00001001
        BNE b1C51
b1C49   LDA a1CC0
        EOR #$07     ;#%00000111
        STA a1CC0
b1C51   LDA aE3
        SEC 
        SBC a1CC0
        BPL b1C5E
        EOR #$FF     ;#%11111111
        CLC 
        ADC #$01     ;#%00000001
b1C5E   CMP #$04     ;#%00000100
        BEQ b1C6B
        LDA a1D62
        AND #$13     ;#%00010011
        STA a1D63
        RTS 

b1C6B   TXA 
        STA a1D63
b1C6F   RTS 

s1C70   LDA a1D3E
        BNE b1C6F
        LDA aE4
        AND #$FE     ;#%11111110
        STA aE4
        STA a1CC0
        LDA a1D62
        TAX 
        AND #$03     ;#%00000011
        BEQ b1C6B
        TXA 
        AND #$0C     ;#%00001100
        BEQ b1C6B
        TXA 
        AND #$06     ;#%00000110
        CMP #$06     ;#%00000110
        BEQ b1C99
        TXA 
        AND #$09     ;#%00001001
        CMP #$09     ;#%00001001
        BNE b1CA1
b1C99   LDA a1CC0
        EOR #$06     ;#%00000110
        STA a1CC0
b1CA1   LDA aE3
        SEC 
        SBC a1CC0
        BPL b1CAE
        EOR #$FF     ;#%11111111
        CLC 
        ADC #$01     ;#%00000001
b1CAE   CMP #$04     ;#%00000100
        BEQ b1CBB
        LDA a1D62
        AND #$13     ;#%00010011
        STA a1D63
        RTS 

b1CBB   TXA 
        STA a1D63
        RTS 

a1CC0   .BYTE $00
s1CC1   LDA #$00     ;#%00000000
        STA a0C
        STA a0D
        STA a0A
        LSR a1D63
        BCC b1CD1
        JSR s1F91
b1CD1   LSR a1D63
        BCC b1CD9
        JSR s216D
b1CD9   LSR a1D63
        BCC b1CE1
        JSR s1DCB
b1CE1   LSR a1D63
        BCC b1CE9
        JSR s1EB1
b1CE9   LDY a1D62
        LDA a0A
        BNE b1CF2
        LDY #$FF     ;#%11111111
b1CF2   STY a12F1
        RTS 

s1CF6   LDA #$00     ;#%00000000
        STA a0C
        STA a0D
        STA a0A
        LSR a1D63
        BCC b1D06
        JSR s1FB3
b1D06   LSR a1D63
        BCC b1D0E
        JSR s2185
b1D0E   LSR a1D63
        BCC b1D16
        JSR s1DED
b1D16   LSR a1D63
        BCC b1D1E
        JSR s1EC9
b1D1E   LDY a1D62
        LDA a0A
        BNE b1CF2
        LDY #$FF     ;#%11111111
        JMP b1CF2

j1D2A   LDA a1D3E
        BEQ b1D3F
        LDA #$00     ;#%00000000
        STA a1D62
        STA a1D66
        STA a1D67
        STA a1D63
        RTS 

a1D3E   .BYTE $00
b1D3F   LDA a0966
        BEQ b1D47
        JMP j08D4

b1D47   LDA $DC01    ;CIA1: Data Port Register B
        AND $DC00    ;CIA1: Data Port Register A
        EOR #$FF     ;#%11111111
        AND #$1F     ;#%00011111
        STA a1D62
        STA a1D66
        AND #$0F     ;#%00001111
        BEQ b1D5E
        STA a1D67
b1D5E   LDA a1D62
        RTS 

a1D62   .BYTE $00
a1D63   .BYTE $00
a1D64   .BYTE $00
a1D65   .BYTE $00
a1D66   .BYTE $00
a1D67   .BYTE $00
j1D68   LDA a0A
        STA a1D8C
        BEQ b1D76
        JSR s1D77
        LDA #$00     ;#%00000000
        STA a0A
b1D76   RTS 

s1D77   LSR 
        BCC b1D7D
        JMP s1FCF

b1D7D   LSR 
        BCC b1D83
        JMP j21A1

b1D83   LSR 
        BCC b1D89
        JMP j1E09

b1D89   JMP j1EE3

a1D8C   .BYTE $00,$00
a1D8E   .BYTE $00
j1D8F   LDX #$0D     ;#%00001101
b1D91   LDA f45,X
        STA f37,X
        LDA f61,X
        STA f53,X
        LDA fB5,X
        STA fA7,X
        DEX 
        BPL b1D91
a1DA0   LDX #$04     ;#%00000100
b1DA2   LDA f7D,X
        STA f6F,X
        DEX 
        BPL b1DA2
        LDA a8A
        STA a7C
        LDA a89
        STA a7B
        LDX #$06     ;#%00000110
b1DB3   LDA f82,X
        ASL 
        STA f74,X
        ROL f58,X
        DEX 
        BPL b1DB3
        LDA aD1
        STA aD2
        RTS 

j1DC2   LDA a2305
        BEQ j1DC2
        DEC a2305
        RTS 

s1DCB   INC a0C
        LDA aE4
        CMP #$07     ;#%00000111
        BEQ b1DE0
        INC aE4
j1DD5   LDA $D016    ;VIC Control Register 2
        AND #$10     ;#%00010000
        ORA aE4
        STA $D016    ;VIC Control Register 2
        RTS 

b1DE0   LDA #$00     ;#%00000000
        STA aE4
        LDA a0A
        ORA #$04     ;#%00000100
        STA a0A
        JMP j1DD5

s1DED   INC a0C
        LDA aE4
        CMP #$06     ;#%00000110
        BEQ b1DFC
        INC aE4
        INC aE4
        JMP j1DD5

b1DFC   LDA #$00     ;#%00000000
        STA aE4
        LDA a0A
        ORA #$04     ;#%00000100
        STA a0A
        JMP j1DD5

j1E09   DEC aF8
        LDX #$26     ;#%00100110
b1E0D   LDA p4000,X
        STA f4001,X
        LDA f4028,X
        STA f4029,X
        LDA f4050,X
        STA f4051,X
        LDA f4078,X
        STA f4079,X
        LDA f40A0,X
        STA f40A1,X
        LDA f40C8,X
        STA f40C9,X
        LDA f40F0,X
        STA f40F1,X
        LDA f4118,X
        STA f4119,X
        LDA f4140,X
        STA f4141,X
        DEX 
        BPL b1E0D
        LDX #$26     ;#%00100110
b1E48   LDA f4168,X
        STA f4169,X
        LDA f4190,X
        STA f4191,X
        LDA f41B8,X
        STA f41B9,X
        LDA f41E0,X
        STA f41E1,X
        LDA f4208,X
        STA f4209,X
        LDA f4230,X
        STA f4231,X
        LDA f4258,X
        STA f4259,X
        LDA f4280,X
        STA f4281,X
        LDA f42A8,X
        STA f42A9,X
        DEX 
        BPL b1E48
        LDX #$26     ;#%00100110
b1E83   LDA f42D0,X
        STA f42D1,X
        LDA f42F8,X
        STA f42F9,X
        LDA f4320,X
        STA f4321,X
        LDA f4348,X
        STA f4349,X
        LDA f4370,X
        STA f4371,X
        LDA f4398,X
        STA f4399,X
        LDA f43C0,X
        STA f43C1,X
        DEX 
        BPL b1E83
        RTS 

s1EB1   DEC a0C
        LDA aE4
        BEQ b1EBC
        DEC aE4
        JMP j1DD5

b1EBC   LDA #$07     ;#%00000111
        STA aE4
        LDA a0A
        ORA #$08     ;#%00001000
        STA a0A
        JMP j1DD5

s1EC9   DEC a0C
        LDA aE4
        BEQ b1ED6
        DEC aE4
        DEC aE4
        JMP j1DD5

b1ED6   LDA #$06     ;#%00000110
        STA aE4
        LDA a0A
        ORA #$08     ;#%00001000
        STA a0A
        JMP j1DD5

j1EE3   INC aF8
        LDX #$00     ;#%00000000
b1EE7   LDA f4001,X
        STA p4000,X
        LDA f4029,X
        STA f4028,X
        LDA f4051,X
        STA f4050,X
        LDA f4079,X
        STA f4078,X
        LDA f40A1,X
        STA f40A0,X
        LDA f40C9,X
        STA f40C8,X
        LDA f40F1,X
        STA f40F0,X
        LDA f4119,X
        STA f4118,X
        LDA f4141,X
        STA f4140,X
        INX 
        CPX #$27     ;#%00100111
        BNE b1EE7
        LDX #$00     ;#%00000000
b1F24   LDA f4169,X
        STA f4168,X
        LDA f4191,X
        STA f4190,X
        LDA f41B9,X
        STA f41B8,X
        LDA f41E1,X
        STA f41E0,X
        LDA f4209,X
        STA f4208,X
        LDA f4231,X
        STA f4230,X
        LDA f4259,X
        STA f4258,X
        LDA f4281,X
        STA f4280,X
        LDA f42A9,X
        STA f42A8,X
        INX 
        CPX #$27     ;#%00100111
        BNE b1F24
        LDX #$00     ;#%00000000
b1F61   LDA f42D1,X
        STA f42D0,X
        LDA f42F9,X
        STA f42F8,X
        LDA f4321,X
        STA f4320,X
        LDA f4349,X
        STA f4348,X
        LDA f4371,X
        STA f4370,X
        LDA f4399,X
        STA f4398,X
        LDA f43C1,X
        STA f43C0,X
        INX 
        CPX #$27     ;#%00100111
        BNE b1F61
        RTS 

s1F91   INC a0D
        LDA aE3
        CMP #$07     ;#%00000111
        BCS b1FA6
        INC aE3
s1F9B   LDA $D011    ;VIC Control Register 1
        AND #$70     ;#%01110000
        ORA aE3
        STA $D011    ;VIC Control Register 1
        RTS 

b1FA6   LDA #$00     ;#%00000000
        STA aE3
        LDA a0A
        ORA #$01     ;#%00000001
        STA a0A
        JMP s1F9B

s1FB3   INC a0D
        LDA aE3
        CMP #$06     ;#%00000110
        BCS b1FC2
        INC aE3
        INC aE3
        JMP s1F9B

b1FC2   LDA #$00     ;#%00000000
        STA aE3
        LDA a0A
        ORA #$01     ;#%00000001
        STA a0A
        JMP s1F9B

s1FCF   LDX #$13     ;#%00010011
        INC aFE
        BNE b1FD7
        INC aFF
b1FD7   LDA f4168,X
        STA f211D,X
        LDA f417C,X
        STA f2131,X
        LDA f4140,X
        STA f4168,X
        LDA f4154,X
        STA f417C,X
        LDA f4118,X
        STA f4140,X
        LDA f412C,X
        STA f4154,X
        LDA f40F0,X
        STA f4118,X
        LDA f4104,X
        STA f412C,X
        LDA f40C8,X
        STA f40F0,X
        LDA f40DC,X
        STA f4104,X
        LDA f40A0,X
        STA f40C8,X
        LDA f40B4,X
        STA f40DC,X
        LDA f4078,X
        STA f40A0,X
        LDA f408C,X
        STA f40B4,X
        LDA f4050,X
        STA f4078,X
        LDA f4064,X
        STA f408C,X
        LDA f4028,X
        STA f4050,X
        LDA f403C,X
        STA f4064,X
        LDA p4000,X
        STA f4028,X
        LDA f4014,X
        STA f403C,X
        DEX 
        BPL b1FD7
        LDX #$13     ;#%00010011
b2054   LDA f42A8,X
        STA f2145,X
        LDA f42BC,X
        STA f2159,X
        LDA f4280,X
        STA f42A8,X
        LDA f4294,X
        STA f42BC,X
        LDA f4258,X
        STA f4280,X
        LDA f426C,X
        STA f4294,X
        LDA f4230,X
        STA f4258,X
        LDA f4244,X
        STA f426C,X
        LDA f4208,X
        STA f4230,X
        LDA f421C,X
        STA f4244,X
        LDA f41E0,X
        STA f4208,X
        LDA f41F4,X
        STA f421C,X
        LDA f41B8,X
        STA f41E0,X
        LDA f41CC,X
        STA f41F4,X
        LDA f4190,X
        STA f41B8,X
        LDA f41A4,X
        STA f41CC,X
        LDA f211D,X
        STA f4190,X
        LDA f2131,X
        STA f41A4,X
        DEX 
        BPL b2054
        LDX #$13     ;#%00010011
b20C5   LDA f4398,X
        STA f43C0,X
        LDA f43AC,X
        STA f43D4,X
        LDA f4370,X
        STA f4398,X
        LDA f4384,X
        STA f43AC,X
        LDA f4348,X
        STA f4370,X
        LDA f435C,X
        STA f4384,X
        LDA f4320,X
        STA f4348,X
        LDA f4334,X
        STA f435C,X
        LDA f42F8,X
        STA f4320,X
        LDA f430C,X
        STA f4334,X
        LDA f42D0,X
        STA f42F8,X
        LDA f42E4,X
        STA f430C,X
        LDA f2145,X
        STA f42D0,X
        LDA f2159,X
        STA f42E4,X
        DEX 
        BPL b20C5
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
s216D   DEC a0D
        LDA aE3
        BEQ b2178
        DEC aE3
        JMP s1F9B

b2178   LDA #$07     ;#%00000111
        STA aE3
        LDA a0A
        ORA #$02     ;#%00000010
        STA a0A
        JMP s1F9B

s2185   DEC a0D
        LDA aE3
        CMP #$02     ;#%00000010
        BCC b2194
        DEC aE3
        DEC aE3
        JMP s1F9B

b2194   LDA #$06     ;#%00000110
        STA aE3
        LDA a0A
        ORA #$02     ;#%00000010
        STA a0A
        JMP s1F9B

j21A1   LDX #$27     ;#%00100111
        STX a0EB3
        DEC aFE
        LDA aFE
        CMP #$FF     ;#%11111111
        BNE b21B0
        DEC aFF
b21B0   LDA f4028,X
        STA p4000,X
        LDA f4050,X
        STA f4028,X
        LDA f4078,X
        STA f4050,X
        LDA f40A0,X
        STA f4078,X
        LDA f40C8,X
        STA f40A0,X
        LDA f40F0,X
        STA f40C8,X
        LDA f4118,X
        STA f40F0,X
        LDA f4140,X
        STA f4118,X
        LDA f4168,X
        STA f4140,X
        DEX 
        BPL b21B0
        LDX #$27     ;#%00100111
b21EB   LDA f4190,X
        STA f4168,X
        LDA f41B8,X
        STA f4190,X
        LDA f41E0,X
        STA f41B8,X
        LDA f4208,X
        STA f41E0,X
        LDA f4230,X
        STA f4208,X
        LDA f4258,X
        STA f4230,X
        LDA f4280,X
        STA f4258,X
        LDA f42A8,X
        STA f4280,X
        DEX 
        BPL b21EB
        LDX #$27     ;#%00100111
b2220   LDA f42D0,X
        STA f42A8,X
        LDA f42F8,X
        STA f42D0,X
        LDA f4320,X
        STA f42F8,X
        LDA f4348,X
        STA f4320,X
        LDA f4370,X
        STA f4348,X
        LDA f4398,X
        STA f4370,X
        LDA f43C0,X
        STA f4398,X
        DEX 
        BPL b2220
        RTS 

j224E   LDA #$00     ;#%00000000
        STA a055A
b2253   LDA a2482
        BEQ b2253
        DEC a2482
        RTS 

s225C   SEI 
        LDA #$8B     ;#%10001011
        STA $FFFE    ;IRQ
        LDA #$22     ;#%00100010
        STA aFFFF    ;IRQ
        LDA #$00     ;#%00000000
        STA $D011    ;VIC Control Register 1
        LDA #$01     ;#%00000001
        STA $D01A    ;VIC Interrupt Mask Register (IMR)
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA #>p0135  ;#%00000001
        STA a02
        LDA #<p0135  ;#%00110101
        STA a01
        LDA #$07     ;#%00000111
        STA a09
        LDA #$32     ;#%00110010
        STA aFB
        STA $D012    ;Raster Position
        RTS 

        PHA 
        TYA 
        PHA 
        TXA 
        PHA 
        LDA #$FF     ;#%11111111
        STA $D019    ;VIC Interrupt Request Register (IRR)
        CLD 
        LDA aFB
        CLC 
        ADC #$0E     ;#%00001110
        STA aFB
        CLI 
b229E   LDY aFC
        LDX fA7,Y
        LDA f37,X
        CMP aFB
        BCS b2306
        STA a06
        LDY a09
        LDA f99,X
        STA $D027,Y  ;Sprite 0 Color
        LDA f8B,X
        STA f43F8,Y
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND f2483,Y
        LSR f53,X
        BCC b22C3
        ORA f248B,Y
b22C3   ROL f53,X
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        TYA 
        ASL 
        TAY 
        LDA a06
        STA $D001,Y  ;Sprite 0 Y Pos
        LDA f6F,X
        STA $D000,Y  ;Sprite 0 X Pos
        DEC aFC
        BMI b22E4
        DEC a09
        BNE b229E
        LDA #$07     ;#%00000111
        STA a09
        JMP b229E

b22E4   LDA #$07     ;#%00000111
        STA a09
        LDA #$32     ;#%00110010
        STA aFB
        LDA #$1F     ;#%00011111
        STA $FFFE    ;IRQ
        LDA #$23     ;#%00100011
        STA aFFFF    ;IRQ
        INC a2305
        LDA #$DB     ;#%11011011
        STA $D012    ;Raster Position
j22FE   PLA 
        TAX 
        PLA 
        TAY 
        PLA 
        RTI 

        RTS 

a2305   .BYTE $00
b2306   SBC #$0E     ;#%00001110
        CMP $D012    ;Raster Position
        BCS b2312
        LDA $D012    ;Raster Position
        ADC #$02     ;#%00000010
b2312   ADC #$00     ;#%00000000
        STA $D012    ;Raster Position
        STA aFB
        PLA 
        TAX 
        PLA 
        TAY 
        PLA 
        RTI 

        PHA 
        TYA 
        PHA 
        TXA 
        PHA 
        LDA #$01     ;#%00000001
        STA $D019    ;VIC Interrupt Request Register (IRR)
        CLD 
        SEI 
        LDA #$8B     ;#%10001011
        STA $FFFE    ;IRQ
        LDA #$22     ;#%00100010
        STA aFFFF    ;IRQ
        LDA #$C0     ;#%11000000
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        LDA #$03     ;#%00000011
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA #$FC     ;#%11111100
        STA $D01C    ;Sprites Multi-Color Mode Select
        LDA #$E1     ;#%11100001
        STA $D001    ;Sprite 0 Y Pos
        STA $D003    ;Sprite 1 Y Pos
        LDA #$20     ;#%00100000
        STA $D000    ;Sprite 0 X Pos
        LDA #$50     ;#%01010000
        STA $D002    ;Sprite 1 X Pos
        LDA #<p1110  ;#%00010000
        STA f43F8
        LDA #>p1110  ;#%00010001
        STA a43F9
        LDA a2425
        STA $D027    ;Sprite 0 Color
        STA $D028    ;Sprite 1 Color
        LDY #$0A     ;#%00001010
        LDX #$05     ;#%00000101
b236D   LDA #$E1     ;#%11100001
        STA $D005,Y  ;Sprite 2 Y Pos
        LDA f2419,X
        STA $D004,Y  ;Sprite 2 X Pos
        LDA a241F,X
        STA f43FA,X
        LDA f2426,X
        STA $D029,X  ;Sprite 2 Color
        DEY 
        DEY 
        DEX 
        BPL b236D
        LDA a1D66
        STA a1D62
        LDA a2493
        PHA 
        LDA a30
        PHA 
        LDA a31
        PHA 
        LDA a2480
        BNE b23A4
a23A0   =*+$02
        JSR s15F1
        JMP j23A7

b23A4   JSR s3006
j23A7   LDA #$0D     ;#%00001101
        STA $D027    ;Sprite 0 Color
        STA $D028    ;Sprite 1 Color
        JSR s1B5A
        LDA a2480
        BEQ b23BD
        JSR s1C70
        JMP j23C0

b23BD   JSR s1C29
j23C0   JSR s1312
        LDA a242C
        STA $D02D    ;Sprite 6 Color
        STA $D02E    ;Sprite 7 Color
        PLA 
        STA a31
        PLA 
        STA a30
        LDA a0A40
        BEQ b23F0
        LDA #$00     ;#%00000000
        STA a1D62
        STA a1D63
        STA a1D66
        LDA #$00     ;#%00000000
        STA $D418    ;Select Filter Mode and Volume
        JSR s03FC
        DEC a2305
        JMP j23F6

b23F0   INC a2482
        JSR s03FC
j23F6   LDA a2480
        BEQ b2401
        JSR s3000
        JMP j2404

b2401   JSR s1BD4
j2404   JSR s0EB4
        JSR s2436
        LDA a0A
        BNE b2411
        JSR s0A1F
b2411   PLA 
        STA a2493
        JMP j22FE

        .BYTE $00
f2419   .BYTE $AA,$C8,$E0,$FC,$1C,$34
a241F   .BYTE $14,$1B,$1C
a2422   .BYTE $13
a2423   .BYTE $19
a2424   .BYTE $1A
a2425   .BYTE $00
f2426   .BYTE $00,$00,$00,$00
a242A   .BYTE $00
a242B   .BYTE $00
a242C   .BYTE $00
a242D   .BYTE $00
f242E   .BYTE $0B,$04,$05,$05,$09,$0C,$09,$06
s2436   LDA #$00     ;#%00000000
        STA $D012    ;Raster Position
        JSR s19D1
        LDA a2480
        BEQ b2449
        JSR s1CF6
        JMP j244C

b2449   JSR s1CC1
j244C   LDA a44
        STA $D001    ;Sprite 0 Y Pos
        LDA a7C
        STA $D000    ;Sprite 0 X Pos
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        AND #$FE     ;#%11111110
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        LSR a60
        BCC b246A
        LDA $D010    ;Sprites 0-7 MSB of X coordinate
        ORA #$01     ;#%00000001
        STA $D010    ;Sprites 0-7 MSB of X coordinate
b246A   LDA a2480
        STA $D027    ;Sprite 0 Color
        LDA #$00     ;#%00000000
        STA $D01D    ;Sprites Expand 2x Horizontal (X)
        LDA #$FE     ;#%11111110
        STA $D01C    ;Sprites Multi-Color Mode Select
        LDA aD2
        STA f43F8
        RTS 

a2480   .BYTE $00,$00
a2482   .BYTE $00
f2483   .BYTE $FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F
f248B   .BYTE $01,$02,$04,$08,$10,$20,$40,$80
a2493   .BYTE $00
s2494   LDY #$0D     ;#%00001101
b2496   TYA 
        STA f00B5,Y
        LDA #$00     ;#%00000000
        STA fC3,X
        LDA #$14     ;#%00010100
        STA f0045,Y
        STA f0037,Y
        DEY 
        BPL b2496
        LDA #$FF     ;#%11111111
        STA $D015    ;Sprite display Enable
        JSR j28FF
        JMP j1D8F

s24B4   LDA a24F4
        AND #$48     ;#%01001000
        ADC #$38     ;#%00111000
        ASL 
        ASL 
        ROL a24F7
        ROL a24F6
        ROL a24F5
        ROL a24F4
        LDA a24F4
        EOR $DC04    ;CIA1: Timer A: Low-Byte
        STA a24F4
        RTS 

s24D3   STA a2746
        JSR s24B4
        STA a2745
        STX a195B
        LDX #$08     ;#%00001000
        LDA #$00     ;#%00000000
b24E3   LSR a2745
        BCC b24EC
        CLC 
        ADC a2746
b24EC   ROR 
        DEX 
        BNE b24E3
        LDX a195B
        RTS 

a24F4   .BYTE $FF
a24F5   .BYTE $80
a24F6   .BYTE $1B
a24F7   .BYTE $34,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00
j2506   LDA a1D8C
        BEQ b250C
        RTS 

b250C   LDX #$05     ;#%00000101
b250E   LDA f256A,X
        CMP f2570,X
        BEQ b251F
        STX a2493
        JSR s2523
        LDX a2493
b251F   DEX 
        BPL b250E
        RTS 

s2523   ASL 
        ASL 
        ASL 
        CPX #$03     ;#%00000011
        TAX 
        BCS b2531
        LDY a2493
        JMP j2537

b2531   LDA a2493
        ADC #$3C     ;#%00111100
        TAY 
j2537   LDA f3980,X
        STA f442A,Y
        INY 
        INY 
        INY 
        INX 
        TXA 
        AND #$07     ;#%00000111
        CMP #$07     ;#%00000111
        BNE j2537
        RTS 

j2549   LDX #$05     ;#%00000101
b254B   LDA f256A,X
        STA f2570,X
        CLC 
        ADC f2576,X
        CMP #$0A     ;#%00001010
        BCC b255E
        SBC #$0A     ;#%00001010
        INC f2575,X
b255E   STA f256A,X
        LDA #$00     ;#%00000000
        STA f2576,X
        DEX 
        BPL b254B
        RTS 

f256A   .BYTE $00
f256B   .BYTE $00,$00,$00,$00,$00
f2570   .BYTE $09,$09,$09,$09,$09
f2575   .BYTE $09
f2576   .BYTE $00,$00
a2578   .BYTE $00
a2579   .BYTE $00,$00,$00,$00
s257D   LDA a25C4
        SEC 
        SBC a25C7
        CMP a25C5
        BCS b25BE
        ASL a25C7
        CLC 
        ADC a25C7
        CMP a25C5
        BCC b25BE
        LSR a25C1
        ROR a25C0
        LSR a25C3
        ROR a25C2
        LSR a25C6
        LDA a25C0
        SEC 
        SBC a25C6
        CMP a25C2
        BCS b25BE
        ASL a25C6
        CLC 
        ADC a25C6
        CMP a25C2
        BCC b25BE
        SEC 
        RTS 

b25BE   CLC 
        RTS 

a25C0   .BYTE $00
a25C1   .BYTE $00
a25C2   .BYTE $00
a25C3   .BYTE $00
a25C4   .BYTE $00
a25C5   .BYTE $00
a25C6   .BYTE $00
a25C7   .BYTE $00
s25C8   LDX a25DD
b25CB   LDA f1961,X
        BEQ b25D6
        JSR s25DE
        JMP j25D9

b25D6   JSR s2661
j25D9   DEX 
        BPL b25CB
        RTS 

s25DE   =*+$01
a25DD   .BYTE $03,$B5
        LSR 
        CMP #$0A     ;#%00001010
        BCS b25F0
j25E4   LDA #$00     ;#%00000000
        STA f1961,X
        LDA #$00     ;#%00000000
        STA f4A,X
        DEC fC8,X
        RTS 

b25F0   CMP #$C5     ;#%11000101
        BCC b25F7
        JMP j25E4

b25F7   LDA f82,X
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
        INC f4A,X
        INC f4A,X
        JMP b2628

b2624   DEC f4A,X
        DEC f4A,X
b2628   LDA f055B,X
        AND #$02     ;#%00000010
        BEQ b2632
        INC f82,X
        RTS 

b2632   DEC f82,X
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
        INC f82,X
        JMP b2650

b264E   DEC f82,X
b2650   LDA f055B,X
        AND #$01     ;#%00000001
        BEQ b265C
        INC f4A,X
        INC f4A,X
        RTS 

b265C   DEC f4A,X
        DEC f4A,X
        RTS 

s2661   LDA #$05     ;#%00000101
        JSR s24D3
        TAY 
        LDA f120B,Y
        CMP #$01     ;#%00000001
        BEQ b2673
        CMP #$04     ;#%00000100
        BEQ b2673
        RTS 

b2673   LDA aFE
        STA a2493
        LDA aFF
        LSR 
        ROR a2493
        LSR 
        ROR a2493
        LDA #$FF     ;#%11111111
        SEC 
        SBC a2493
        LSR 
        LSR 
        STX aD5
        JSR s2961
        LDX aD5
        CMP #$01     ;#%00000001
        BEQ b2696
        RTS 

b2696   INC f1961,X
        INC a11C1
        INC fC8,X
        LDA #$12     ;#%00010010
        STA f90,X
        LDA #$0F     ;#%00001111
        STA f9E,X
        LDA #$00     ;#%00000000
        STA f055B,X
        LDA f0061,Y
        LSR 
        LDA f007D,Y
        ROR 
        STA f82,X
        STA a2493
        LDA f0045,Y
        STA f4A,X
        LSR 
        STA a2745
        LDA a8A
        LSR 
        SEC 
        SBC a2493
        BCS b26CE
        EOR #$FF     ;#%11111111
        ADC #$01     ;#%00000001
b26CE   ROL f055B,X
        STA fD6,X
        LDA a52
        LSR 
        SEC 
        SBC a2745
        BCS b26E0
        LDA #$FF     ;#%11111111
        ADC #$01     ;#%00000001
b26E0   ROL f055B,X
        CMP fD6,X
        BCS b26F4
        LDY fD6,X
        STA fD6,X
        LDA f055B,X
        ORA #$80     ;#%10000000
        STA f055B,X
        TYA 
b26F4   STA fDE,X
        LSR 
        STA fDA,X
        RTS 

s26FA   STY a2734
        PHA 
        LSR 
        LSR 
        LSR 
        TAY 
        LDA f2735,Y
        STA $DC00    ;CIA1: Data Port Register A
        PLA 
        AND #$07     ;#%00000111
        TAY 
        LDA $DC01    ;CIA1: Data Port Register B
        AND f273D,Y
        BNE b2725
        LDA #$FF     ;#%11111111
        STA $DC00    ;CIA1: Data Port Register A
        LDA $DC01    ;CIA1: Data Port Register B
        AND f273D,Y
        BEQ b2725
        SEC 
        JMP j2726

b2725   CLC 
j2726   LDY a2734
        LDA #$FF     ;#%11111111
        STA $DC00    ;CIA1: Data Port Register A
        LDA #$7F     ;#%01111111
        STA $DC01    ;CIA1: Data Port Register B
        RTS 

a2734   .BYTE $00
f2735   .BYTE $FE,$FD,$FB,$F7,$EF,$DF,$BF,$7F
f273D   .BYTE $01,$02,$04,$08,$10,$20,$40,$80
a2745   .BYTE $00
a2746   .BYTE $00
a2747   .BYTE $E2,$00,$00
j274A   LDA #$27     ;#%00100111
        STA a27EF
        STA a2493
        LDX #$00     ;#%00000000
        LDA #$40     ;#%01000000
        STA a27F0
        LDA aFF
        STA aE1
        LDA aFE
        STA aE0
        AND #$07     ;#%00000111
        STA aF3
        LDA aF8
        CLC 
        ADC #$27     ;#%00100111
        TAY 
        AND #$07     ;#%00000111
        STA aF7
        TYA 
        LSR 
        LSR 
        LSR 
        STA aF2
        LDA aF8
        JMP j27A6

j277A   LDX #$00     ;#%00000000
        STX a27EF
        STX a2493
        LDA #$40     ;#%01000000
        STA a27F0
        LDA aFF
        STA aE1
        LDA aFE
        STA aE0
        AND #$07     ;#%00000111
        STA aF3
        LDA aF8
        TAY 
        AND #$07     ;#%00000111
        STA aF7
        TYA 
        LSR 
        LSR 
        LSR 
        STA aF2
        LDA aF8
        AND #$7F     ;#%01111111
        STA aF8
j27A6   LDA aE0
        AND #$F8     ;#%11111000
        STA aF0
        LDA aE1
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
j27C1   LDY aF2
        LDA #$00     ;#%00000000
        STA aF0
        LDA (pF4),Y
        LSR 
        ROR aF0
        LSR 
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
        ASL 
        ASL 
        ASL 
        CLC 
        ADC aF7
        TAY 
        LDA (pF0),Y
        CMP #$FD     ;#%11111101
        BNE b27EE
        JSR s0EDC
a27EF   =*+$01
a27F0   =*+$02
b27EE   STA p4000
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

j2832   LDA #$05     ;#%00000101
        STA aF6
        LDA #$00     ;#%00000000
        STA aF3
        LDA aF8
        AND #$07     ;#%00000111
        STA aF7
        LDA #>f43C0  ;#%01000011
        STA a28E7
        LDA #<f43C0  ;#%11000000
        STA a28E6
        LDA aFF
        STA aE1
        LDA aFE
        STA aE0
        SEC 
        SBC #$18     ;#%00011000
        STA aFE
        BCS b285B
        DEC aFF
b285B   JSR s287D
        LDA aE0
        STA aFE
        LDA aE1
        STA aFF
        RTS 

j2867   LDA #$05     ;#%00000101
        STA aF6
        LDA #$00     ;#%00000000
        STA aF3
        STA a28E6
        LDA aF8
        AND #$07     ;#%00000111
        STA aF7
        LDA #$40     ;#%01000000
        STA a28E7
s287D   LDA aF8
        LSR 
        LSR 
        LSR 
        STA aF2
        LDA aF8
        AND #$7F     ;#%01111111
        STA aF8
        LDA aFE
        AND #$F8     ;#%11111000
        STA aF0
        LDA aFF
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
        LSR 
        ROR aF0
        ROR 
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
        LDA aFE
        AND #$07     ;#%00000111
        ASL 
        ASL 
        ASL 
        PHA 
        CLC 
        ADC aF7
        TAY 
        PLA 
        CLC 
        ADC #$08     ;#%00001000
        STA a28EB
b28D5   LDA (pF0),Y
        CMP #$FD     ;#%11111101
        BNE b28E1
        STX a2747
        JSR s0F18
b28E1   CPX #$28     ;#%00101000
        BCS b28FB
a28E6   =*+$01
a28E7   =*+$02
        STA p4000,X
        INY 
        INX 
a28EB   =*+$01
        CPY #$00     ;#%00000000
        BCC b28D5
        INC aF2
        DEC aF6
        STX aF3
        LDX #$00     ;#%00000000
        STX aF7
        JMP j28A5

b28FB   RTS 

        JMP jC006

j28FF   LDA #$00     ;#%00000000
        STA a04
        LDX #$01     ;#%00000001
b2905   LDY fB4,X
        LDA f0045,Y
        LDY fB5,X
        CMP f0045,Y
        BCS b293B
        LDA f0045,Y
        STY aD3
        STX aD4
        DEX 
b2919   DEX 
        BMI b2925
        LDY fB5,X
        CMP f0045,Y
        BEQ b2925
        BCS b2919
b2925   INX 
        INC a04
        STX a05
        LDX aD4
b292C   LDA fB4,X
        STA fB5,X
        DEX 
        CPX a05
        BNE b292C
        LDA aD3
        STA fB5,X
        LDX aD4
b293B   INX 
        CPX #$0E     ;#%00001110
        BNE b2905
        RTS 

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

b298A   LDY #$00     ;#%00000000
        JMP j296D

b298F   LDX #$00     ;#%00000000
        JMP j296D

a2994   .BYTE $00
a2995   .BYTE $00
a2996   .BYTE $00
f2997   .BYTE $03,$01,$07,$03,$04,$05,$06,$00
        .BYTE $05
a29A0   .BYTE $02,$07,$04,$02,$01,$06,$00,$FF
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
a2FA0   .BYTE $00,$00,$FF,$FF,$00,$00,$FF,$FF
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
s3000   JMP j35C3

s3003   JMP j37B7

s3006   JMP j36C6

j3009   JSR s0364
        JSR s0343
        JSR s0340
        JSR s034C
        JSR s3764
        JSR s356E
        JSR s3066
        JSR s3210
        JSR s3140
        JSR s3272
        JSR s033D
        JSR s319D
        JSR s303F
        JSR s304E
        JSR s034F
        JSR s0352
        JSR s0337
        JMP j3009

s303F   JSR s0358
        LDA a0F
        BNE b3047
        RTS 

b3047   PLA 
        PLA 
        PLA 
        PLA 
        JMP j0376

s304E   LDA a3063
        BEQ b3057
        DEC a3063
        RTS 

b3057   LDX a3825
        LDA f3064,X
        STA a3063
        INC a0B
        RTS 

a3063   .BYTE $00
f3064   .BYTE $12,$C8
s3066   LDA a30C3
        BEQ b306E
        JMP j307D

b306E   JSR s3484
        JSR s3373
        JSR s32D9
        JSR s3316
        JMP j30C4

j307D   JSR s34F1
        JSR s34F1
        JSR s34F1
        JSR s30B2
        JSR s3316
        LDA a3315
        BEQ b3092
        RTS 

b3092   LDA a3567
        SEC 
        SBC #$03     ;#%00000011
        BCS b309C
        LDA #$00     ;#%00000000
b309C   STA a3567
        LDA #$F0     ;#%11110000
        STA a3564
        LDA #$00     ;#%00000000
        STA a30C3
        STA a3565
        LDA #$04     ;#%00000100
        STA a3127
        RTS 

s30B2   LDA a3774
        CMP #$0B     ;#%00001011
        BEQ b30BD
        INC a3774
        RTS 

b30BD   LDA #$00     ;#%00000000
        STA a3774
        RTS 

a30C3   .BYTE $00
j30C4   LDA a32D7
        CMP #$01     ;#%00000001
        BEQ b30CC
        RTS 

b30CC   LDA a3315
        BNE b30D2
        RTS 

b30D2   LDA a4F
        STA a38DE
        LDA a362F
        STA a38DF
        LDA a87
        ASL 
        STA a38DA
        LDA #$00     ;#%00000000
        ROL 
        STA a38DB
        LDA a362E
        ASL 
        STA a38DC
        LDA #$00     ;#%00000000
        ROL 
        STA a38DD
        LDX a3774
        LDA f3128,X
        STA a38E1
        LDA f3134,X
        STA a38E0
        JSR s3897
        BCC b3119
        LDX #$01     ;#%00000001
        JSR s316A
        LDA #$02     ;#%00000010
        LDX #$02     ;#%00000010
        JSR s037C
        JMP j311A

b3119   RTS 

j311A   LDA a3127
        BEQ b3123
        DEC a3127
        RTS 

b3123   INC a30C3
        RTS 

a3127   .BYTE $04
f3128   .BYTE $1F,$1F,$1F,$09,$09,$09,$1F,$1F
        .BYTE $1F,$09,$09,$09
f3134   .BYTE $0A,$0A,$0A,$22,$22,$22,$0A,$0A
        .BYTE $0A,$22,$22,$22
s3140   LDA a0E
        CMP #$05     ;#%00000101
        BEQ b3147
        RTS 

b3147   LDA a3770
        AND #$10     ;#%00010000
        BNE b314F
        RTS 

b314F   LDA a32D7
        BEQ b3155
        RTS 

b3155   INC a32D7
        LDA a89
        LSR 
        STA a87
        LDA a51
        STA a4F
        INC aCD
        LDA a3773
        STA a324D
        RTS 

s316A   LDA #$41     ;#%01000001
        STA f94,X
        LDA #$02     ;#%00000010
        STA f32D6,X
        LDA #$05     ;#%00000101
        STA fA2,X
        LDA #$02     ;#%00000010
        STA f319B,X
        LDA #$0E     ;#%00001110
        JMP j0361

s3181   LDA f319B,X
        BEQ b318A
        DEC f319B,X
        RTS 

b318A   LDA #$02     ;#%00000010
        STA f319B,X
        LDA f94,X
        CMP #$45     ;#%01000101
        BNE b3198
        JMP j32C8

b3198   INC f94,X
        RTS 

f319B   .BYTE $00,$00
s319D   LDA f32D6
        CMP #$01     ;#%00000001
        BEQ b31A5
        RTS 

b31A5   LDA a4E
        STA a38DE
        LDA a51
        STA a38DF
        LDA a86
        ASL 
        STA a38DA
        LDA #$00     ;#%00000000
        ROL 
        STA a38DB
        LDA a89
        STA a38DC
        LDA #$00     ;#%00000000
        STA a38DD
        LDA #>p0C0A  ;#%00001100
        STA a38E1
        LDA #<p0C0A  ;#%00001010
        STA a38E0
        JSR s3897
        BCC b31D7
        JMP j3206

b31D7   LDA a4E
        STA a38DE
        LDA a49
        STA a38DF
        LDA a86
        ASL 
        STA a38DA
        LDA #$00     ;#%00000000
        ROL 
        STA a38DB
        LDA a81
        STA a38DC
        LDA #$00     ;#%00000000
        STA a38DD
        LDA #>p0C0A  ;#%00001100
        STA a38E1
        LDA #<p0C0A  ;#%00001010
        STA a38E0
        JSR s3897
        BCC b320F
j3206   LDA #$05     ;#%00000101
        STA a0B
        LDX #$00     ;#%00000000
        JSR s316A
b320F   RTS 

s3210   LDA a32D8
        BNE b3216
        RTS 

b3216   DEC a32D8
        LDA a3825
        BNE b321F
        RTS 

b321F   LDA f32D6
        BEQ b3225
        RTS 

b3225   LDA a362F
        CMP #$C0     ;#%11000000
        BCS b324B
        LDA #$14     ;#%00010100
        CMP #$14     ;#%00010100
        BCC b324B
        INC f32D6
        LDX a3774
        STX a324C
        LDA #$0E     ;#%00001110
        STA aA2
        LDA a362E
        STA a86
        LDA a362F
        STA a4E
        INC aCC
b324B   RTS 

a324C   .BYTE $00
a324D   .BYTE $00
f324E   .BYTE $FA,$FA,$FA,$00,$00,$00,$06,$06
        .BYTE $06,$00,$00,$00
f325A   .BYTE $00,$00,$00,$FD,$FD,$FD,$00,$00
        .BYTE $00,$03,$03,$03
f3266   .BYTE $2E,$2E,$2E,$30,$30,$30,$2F,$2F
        .BYTE $2F,$31,$31,$31
s3272   LDX #$01     ;#%00000001
b3274   LDA f32D6,X
        CMP #$02     ;#%00000010
        BEQ b3281
        JSR s3288
        JMP j3284

b3281   JSR s3181
j3284   DEX 
        BPL b3274
        RTS 

s3288   LDY a324C,X
        LDA f325A,Y
        CLC 
        ADC a0C
        STA a32D5
        LDA a0D
        ASL 
        STA a336D
        LDA f324E,Y
        CLC 
        ADC a336D
        STA a32D4
        LDA f3266,Y
        STA f94,X
        LDA f86,X
        CLC 
        ADC a32D5
        STA f86,X
        LDA f4E,X
        CLC 
        ADC a32D4
        CMP #$14     ;#%00010100
        BCC j32C8
        CMP #$C0     ;#%11000000
        BCS j32C8
        STA f4E,X
        LDA f86,X
        CMP #$AC     ;#%10101100
        BCS j32C8
        RTS 

j32C8   LDA #$00     ;#%00000000
        STA f32D6,X
        DEC fCC,X
        LDA #$0A     ;#%00001010
        STA f4E,X
        RTS 

a32D4   .BYTE $00
a32D5   .BYTE $00
f32D6   .BYTE $00
a32D7   .BYTE $00
a32D8   .BYTE $00
s32D9   LDY #$01     ;#%00000001
        JMP j36CE

s32DE   LDX #$03     ;#%00000011
        LDA #$00     ;#%00000000
        STA a3315
b32E5   LDA f82,X
        CMP #$AD     ;#%10101101
        BCC b32EE
        JMP j3308

b32EE   LDA f4A,X
        CMP #$14     ;#%00010100
        BCC j3308
        CMP #$C0     ;#%11000000
        BCS j3308
        LDA a3825
        BEQ j3308
        LDA #$01     ;#%00000001
        STA fC8,X
        STA a3315
j3304   DEX 
        BPL b32E5
        RTS 

j3308   LDA #$00     ;#%00000000
        STA fC8,X
        LDA #$14     ;#%00010100
        STA f4A,X
        STA f3C,X
        JMP j3304

a3315   .BYTE $00
s3316   LDA a3568
        SEC 
        SBC aF8
        BCS b331F
        RTS 

b331F   CMP #$2E     ;#%00101110
        BCC b3324
        RTS 

b3324   LDA a347F
        SEC 
        SBC aFE
        STA a336D
        LDA a3480
        SBC aFF
        BEQ b3337
        JMP j3341

b3337   LDA #$1E     ;#%00011110
        SEC 
        SBC a336D
        CMP #$1B     ;#%00011011
        BCC b3342
j3341   RTS 

b3342   LDA aE4
        LSR 
        STA a336E
        LDA aF8
        ASL 
        ASL 
        SEC 
        SBC a336E
        STA a336D
        LDA a3564
        SEC 
        SBC a336D
        STA a362E
        LDA aFE
        ASL 
        ASL 
        ASL 
        CLC 
        ADC aE3
        SEC 
        SBC a3566
        STA a362F
        RTS 

a336D   .BYTE $00
a336E   .BYTE $00,$00,$00,$00,$00
s3373   JSR s3391
        LDA a3481
        ASL 
        ASL 
        ASL 
        CLC 
        ADC a3482
        STA a3482
        BCS b3386
        RTS 

b3386   LDA a3483
        BEQ b338E
        JMP j33E8

b338E   JMP j33FB

s3391   LDA aFE
        CLC 
        ADC #$0F     ;#%00001111
        STA a356A
        LDA aFF
        ADC #$00     ;#%00000000
        STA a356B
        LDA a3566
        STA a347F
        LDA a3567
        LSR 
        ROR a347F
        LSR 
        ROR a347F
        LSR 
        ROR a347F
        STA a3480
        LDA a347F
        CMP a356A
        BNE b33D3
        LDA a3480
        CMP a356B
        BNE b33D3
        LDA a3772
        AND #$0C     ;#%00001100
        STA a3772
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
b3428   LDA a3772
        AND #$0C     ;#%00001100
        ORA #$01     ;#%00000001
        STA a3772
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
b345D   LDA a3772
        AND #$0C     ;#%00001100
        ORA #$02     ;#%00000010
        STA a3772
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
        ASL 
        ASL 
        ASL 
        CLC 
        ADC a3560
        STA a3560
        BCS b3497
        RTS 

b3497   LDA a3561
        BEQ b349F
        JMP j34DF

b349F   JMP s34F1

s34A2   LDA aF8
        CLC 
        ADC #$16     ;#%00010110
        STA a3569
        LDA a3564
        STA a3568
        LDA a3565
        LSR 
        ROR a3568
        LSR 
        ROR a3568
        INC a3568
        INC a3568
        LDA a3568
        CMP a3569
        PHP 
        BNE b34D5
        INC a32D8
        LDA a3772
        AND #$03     ;#%00000011
        STA a3772
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
b3512   LDA a3772
        AND #$03     ;#%00000011
        ORA #$08     ;#%00001000
        STA a3772
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
        LDA a3772
        AND #$03     ;#%00000011
        ORA #$04     ;#%00000100
        STA a3772
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
s356E   LDA aE6
        BEQ b357E
        LDA #$2A     ;#%00101010
        STA a336D
        LDA aFF
        CMP #$03     ;#%00000011
        BCS b357E
        RTS 

b357E   LDX #$0C     ;#%00001100
        JSR s036A
        LDY #$29     ;#%00101001
        LDA (p30),Y
        CMP #$1B     ;#%00011011
        BCC b35C2
        CMP #$1E     ;#%00011110
        BCS b35C2
        LDA #$08     ;#%00001000
        JSR s8100
        LDA #$15     ;#%00010101
        JSR s8100
        LDA a336D
        CMP #$2A     ;#%00101010
        BNE b35B6
        LDA #$01     ;#%00000001
        LDX #$00     ;#%00000000
        JSR s037C
        JSR s0352
        SEI 
        PLA 
        PLA 
        PLA 
        PLA 
        PLA 
        PLA 
        LDA #$04     ;#%00000100
        JMP j037F

b35B6   INC aE6
        LDA a51
        CLC 
        ADC #$1E     ;#%00011110
        TAY 
        LDX a89
        PLA 
        PLA 
b35C2   RTS 

j35C3   LDX a3774
        LDA a362E
        CLC 
        ADC f3684,X
        STA a82
        LDA a362F
        CLC 
        ADC f3690,X
        STA a4A
        LDA a82
        CLC 
        ADC f363C,X
        STA a83
        LDA a4A
        CLC 
        ADC f3648,X
        STA a4B
        LDA a82
        CLC 
        ADC f3654,X
        STA a84
        LDA a4A
        CLC 
        ADC f3660,X
        STA a4C
        LDA a82
        CLC 
        ADC f366C,X
        STA a85
        LDA a4A
        CLC 
        ADC f3678,X
        STA a4D
        LDY f3630,X
        STY a90
        INY 
        STY a91
        INY 
        STY a92
        INY 
        STY a93
        LDA #$0F     ;#%00001111
        STA a9E
        STA a9F
        STA aA0
        STA aA1
        JSR s32DE
        LDX a3315
        LDA f362C,X
        JMP s8100

f362C   .BYTE $08,$16
a362E   .BYTE $82
a362F   .BYTE $64
f3630   .BYTE $83,$97,$93,$8B,$A3,$A7,$87,$9F
        .BYTE $9B,$8F,$AB,$AF
f363C   .BYTE $FA,$FA,$FA,$0A,$0A,$0A,$06,$06
        .BYTE $06,$F6,$F6,$F6
f3648   .BYTE $15,$15,$15,$0A,$0A,$0A,$EB,$EB
        .BYTE $EB,$F6,$F6,$F6
f3654   .BYTE $06,$06,$06,$0A,$0A,$0A,$FA,$FA
        .BYTE $FA,$F6,$F6,$F6
f3660   .BYTE $15,$15,$15,$F6,$F6,$F6,$EB,$EB
        .BYTE $EB,$0A,$0A,$0A
f366C   .BYTE $00,$00,$00,$15,$15,$15,$00,$00
        .BYTE $00,$EB,$EB,$EB
f3678   .BYTE $2A,$2A,$2A,$00,$00,$00,$D6,$D6
        .BYTE $D6,$00,$00,$00
f3684   .BYTE $00,$00,$00,$FA,$FA,$FA,$00,$00
        .BYTE $00,$06,$06,$06
f3690   .BYTE $F3,$F3,$F3,$00,$00,$00,$0D,$0D
        .BYTE $0D,$00,$00,$00
s369C   LDX #$01     ;#%00000001
b369E   LDA f36C0,X
        BEQ b36A9
        DEC f36C0,X
        JMP j36BC

b36A9   LDA f36C2,X
        STA f36C0,X
        LDA f36C4,X
        BNE b36B9
        LDA #$04     ;#%00000100
        STA f36C4,X
b36B9   DEC f36C4,X
j36BC   DEX 
        BPL b369E
        RTS 

f36C0   .BYTE $00,$00
f36C2   .BYTE $01,$01
f36C4   .BYTE $02
a36C5   .BYTE $00
j36C6   LDY #$00     ;#%00000000
        JSR j36CE
        JMP j373F

j36CE   LDA f3771,Y
        CMP f375C,Y
        BEQ b370F
        STA f375C,Y
        CMP #$00     ;#%00000000
        BEQ b370F
        LDX f375A,Y
        AND f3748,X
        BEQ b36EB
        STA f375A,Y
        JMP b370F

b36EB   LDA f375A,Y
        AND #$0C     ;#%00001100
        BEQ b3702
        LDA f375C,Y
        AND #$0C     ;#%00001100
        BNE b370F
        LDA f375C,Y
        STA f375A,Y
        JMP b370F

b3702   LDA f375C,Y
        AND #$03     ;#%00000011
        BNE b370F
        LDA f375C,Y
        STA f375A,Y
b370F   LDA f375A,Y
        AND #$0C     ;#%00001100
        BNE b3729
        LDX f375A,Y
        LDA f3751,X
        STA f375E,Y
        LDA f3771,Y
        AND #$0C     ;#%00001100
        LSR 
        LSR 
        JMP j3737

b3729   LDX f375A,Y
        LDA f3751,X
        STA f375E,Y
        LDA f3771,Y
        AND #$03     ;#%00000011
j3737   CLC 
        ADC f375E,Y
        STA a3773,Y
        RTS 

j373F   JSR s369C
        JSR s3827
        JMP j3775

f3748   .BYTE $02,$02,$01,$00,$08,$00,$00,$00
        .BYTE $04
f3751   .BYTE $00,$00,$06,$00,$03,$00,$00,$00
        .BYTE $09
f375A   .BYTE $00,$00
f375C   .BYTE $00,$00
f375E   .BYTE $00,$00,$CE,$73,$37,$60
s3764   .BYTE $20,$3A,$03,$8D,$70,$37,$29,$0F
        .BYTE $8D,$71,$37,$60
a3770   .BYTE $00
f3771   .BYTE $00
a3772   .BYTE $00
a3773   .BYTE $00
a3774   .BYTE $00
j3775   LDX a3773
        LDA a89
        CLC 
        ADC f3793,X
        STA a81
        LDA a51
        CLC 
        ADC f379F,X
        STA a49
        LDA f37AB,X
        STA a8F
        SEC 
        SBC #$01     ;#%00000001
        STA a97
        RTS 

f3793   .BYTE $00,$00,$00,$18,$18,$18,$00,$00
        .BYTE $00,$E8,$E8,$E8
f379F   .BYTE $15,$15,$15,$00,$00,$00,$EB,$EB
        .BYTE $EB,$00,$00,$00
f37AB   .BYTE $B4,$BE,$BC,$B8,$C4,$C6,$B6,$C2
        .BYTE $C0,$BA,$C8,$CA
j37B7   STA a3825
        JSR s0364
        SEI 
        LDA #$00     ;#%00000000
        STA a3773
        STA f3771
        STA f375C
        LDA #$08     ;#%00001000
        STA f375A
        LDA #$AC     ;#%10101100
        STA a89
        LDA #$8C     ;#%10001100
        STA a51
        STA a43
        LDA #$01     ;#%00000001
        STA aCF
        STA aC7
        LDA #>pF0    ;#%00000000
        STA a3565
        LDA #<pF0    ;#%11110000
        STA a3564
        LDA #>p0232  ;#%00000010
        STA a3567
        LDA #<p0232  ;#%00110010
        STA a3566
        JSR j3775
        LDX #$0F     ;#%00001111
        LDA #$00     ;#%00000000
        STA a362E
        STA a362F
b37FF   STA $D000,X  ;Sprite 0 X Pos
        DEX 
        BPL b37FF
        LDX #$03     ;#%00000011
b3807   LDA #$C3     ;#%11000011
        STA f82,X
        LDA #$00     ;#%00000000
        STA fC8,X
        DEX 
        BPL b3807
        JSR s32DE
        LDA #$19     ;#%00011001
        LDX #$0F     ;#%00001111
        JSR s8100
        LDA #$14     ;#%00010100
        JSR s8100
        CLI 
        JMP j3009

a3825   .BYTE $00
a3826   .BYTE $00
s3827   LDA a3826
        BEQ b383D
        LDA a51
        STA a3888
        LDA a89
        LSR 
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
        ASL 
        STA a8A
        STA a7C
        ROL 
        STA a6E
        STA a60
        LDA a3826
        BNE b3867
        LDA a3825
        BEQ b3872
b3867   LDA a3888
        CLC 
        ADC f388A,X
        CMP #$C0     ;#%11000000
        BCC b3874
b3872   LDA #$00     ;#%00000000
b3874   STA a52
        STA a44
        LDA f3892,X
        STA aD1
        STA aD2
        LDA a3826
        EOR #$01     ;#%00000001
        STA a3826
        RTS 

a3888   .BYTE $00
a3889   .BYTE $00
f388A   .BYTE $F6,$00,$0A,$00
f388E   .BYTE $00,$FB,$00,$05
f3892   .BYTE $CD,$CC,$CB,$CE,$60
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
f3980   .BYTE $2C,$66,$66,$66,$66,$66,$2C,$00
        .BYTE $38,$18,$18,$18,$18,$18,$3C,$00
        .BYTE $2C,$66,$06,$0C,$30,$06,$7E,$00
        .BYTE $34,$66,$06,$14,$06,$66,$34,$00
        .BYTE $06,$16,$26,$46,$7F,$06,$0F,$00
        .BYTE $7E,$18,$40,$6C
p39AC   .BYTE $06,$66,$6C,$00,$2C,$66,$60,$6C
        .BYTE $66,$66,$2C,$00,$7E,$60,$04,$0C
        .BYTE $18,$18,$18,$00,$2C,$66,$66,$2C
        .BYTE $66,$66,$2C,$00,$2C,$66,$66,$2E
        .BYTE $06,$66,$2C,$00,$00,$00,$18,$00
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
a3FA9   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
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
p4000   .BYTE $20
f4001   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$84,$85
        .BYTE $40,$41,$70
f4014   .BYTE $71,$44,$45,$78,$79,$14,$0D,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4028   .BYTE $20
f4029   .BYTE $20,$20,$20
p402C   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$86,$87,$42,$43,$72
f403C   .BYTE $73,$46,$47,$7A,$7B,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4050   .BYTE $20
f4051   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
f4064   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4078   .BYTE $20
f4079   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $54,$55,$60,$61,$84,$85,$88,$89
        .BYTE $8C,$8D,$A8
f408C   .BYTE $A9,$44,$45,$6C,$6D,$78,$79,$78
        .BYTE $79,$4C,$4D,$14,$0D,$20,$20,$20
        .BYTE $20,$20,$20,$20
f40A0   .BYTE $20
f40A1   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $56,$57,$62,$63,$86,$87,$8A,$8B
        .BYTE $8E,$8F,$AA
f40B4   .BYTE $AB,$46,$47,$6E,$6F,$7A,$7B,$7A
        .BYTE $7B,$4E,$4F,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f40C8   .BYTE $20
f40C9   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
f40DC   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f40F0   .BYTE $20
f40F1   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$7C,$7D,$40,$41
        .BYTE $84,$85,$8C
f4104   .BYTE $8D,$A8,$A9,$60,$61,$60,$61,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4118   .BYTE $20
f4119   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$7E,$7F,$42,$43
        .BYTE $86,$87,$8E
f412C   .BYTE $8F,$AA,$AB,$62,$63,$62,$63,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4140   .BYTE $20
f4141   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
f4154   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4168   .BYTE $20
f4169   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$01,$0C,$0C,$1B,$14
        .BYTE $09,$0D,$05
f417C   .BYTE $1B,$08,$05,$12,$0F,$05,$13,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4190   .BYTE $20
f4191   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20
a41A0   .BYTE $20,$20,$20,$20
f41A4   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f41B8   .BYTE $20
f41B9   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
f41CC   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f41E0   .BYTE $20
f41E1   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
f41F4   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4208   .BYTE $A8
f4209   .BYTE $A9,$B8,$B9,$AC,$AD,$A8,$A9,$A8
        .BYTE $A9,$48,$49,$78,$79,$4C,$4D,$60
        .BYTE $61,$74,$75
f421C   .BYTE $58,$59,$A8,$A9,$A8,$A9,$A8,$A9
        .BYTE $B4,$B5,$D4,$D5,$B4,$B5,$B4,$B5
        .BYTE $B4,$B5,$B4,$B5
f4230   .BYTE $AA
f4231   .BYTE $AB,$BA,$BB,$AE,$AF,$AA,$AB,$AA
        .BYTE $AB,$4A,$4B,$7A,$7B,$4E,$4F,$62
        .BYTE $63,$76,$77
f4244   .BYTE $5A,$5B,$AA,$AB,$AA,$AB,$AA,$AB
        .BYTE $B6,$B7,$D6,$D7,$B6,$B7,$B6,$B7
        .BYTE $B6,$B7,$B6,$B7
f4258   .BYTE $20
f4259   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
f426C   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4280   .BYTE $A8
f4281   .BYTE $A9,$BC,$BD,$AC,$AD,$A8,$A9,$A8
        .BYTE $A9,$A8,$A9,$A8,$A9,$44,$45,$A0
        .BYTE $A1,$A8,$A9
f4294   .BYTE $A8,$A9,$A8,$A9,$A8,$A9,$A8,$A9
        .BYTE $B4,$B5,$D0,$D1,$D8,$D9,$B4,$B5
        .BYTE $B4,$B5,$B4,$B5
f42A8   .BYTE $AA
f42A9   .BYTE $AB,$BE,$BF,$AE,$AF,$AA,$AB,$AA
        .BYTE $AB,$AA,$AB,$AA,$AB,$46,$47,$A2
        .BYTE $A3,$AA,$AB
f42BC   .BYTE $AA,$AB,$AA,$AB,$AA,$AB,$AA,$AB
        .BYTE $B6,$B7,$D2,$D3,$DA,$DB,$B6,$B7
        .BYTE $B6,$B7,$B6,$B7
f42D0   .BYTE $20
f42D1   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
f42E4   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f42F8   .BYTE $A8
f42F9   .BYTE $A9,$C0,$C1,$AC,$AD,$B0,$B1,$B0
        .BYTE $B1,$B0,$B1,$8C,$8D,$78,$79,$74
        .BYTE $75,$A0,$A1
f430C   .BYTE $B0,$B1,$B0,$B1,$B0,$B1,$A8,$A9
        .BYTE $B4,$B5,$D0,$D1,$D4,$D5,$B4,$B5
        .BYTE $B4,$B5,$B4,$B5
f4320   .BYTE $AA
f4321   .BYTE $AB,$C2,$C3,$AE,$AF,$B2,$B3,$B2
        .BYTE $B3,$B2,$B3,$8E,$8F,$7A,$7B,$76
        .BYTE $77,$A2,$A3
f4334   .BYTE $B2,$B3,$B2,$B3,$B2,$B3,$AA,$AB
        .BYTE $B6,$B7,$D2,$D3,$D6,$D7,$B6,$B7
        .BYTE $B6,$B7,$B6,$B7
f4348   .BYTE $20
f4349   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20
f435C   .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f4370   .BYTE $A8
f4371   .BYTE $A9,$C4,$C5,$AC,$AD,$B0,$B1,$B0
        .BYTE $B1,$B0,$B1,$4C,$4D,$40,$41,$94
        .BYTE $95,$50,$51
f4384   .BYTE $B0,$B1,$B0,$B1,$B0,$B1,$A8,$A9
        .BYTE $B4,$B5,$D0,$D1,$D0,$D1,$B4,$B5
        .BYTE $B4,$B5,$B4,$B5
f4398   .BYTE $AA
f4399   .BYTE $AB,$C6,$C7,$AE,$AF,$B2,$B3,$B2
        .BYTE $B3,$B2,$B3,$4E,$4F,$42,$43,$96
        .BYTE $97,$52,$53
f43AC   .BYTE $B2,$B3,$B2,$B3,$B2,$B3,$AA,$AB
        .BYTE $B6,$B7,$D2,$D3,$D2,$D3,$B6,$B7
        .BYTE $B6,$B7,$B6,$B7
f43C0   .BYTE $AA
f43C1   .BYTE $AB,$C6,$C7,$AE,$AF,$B2,$B3,$B2
        .BYTE $B3,$B2,$B3,$4E,$4F,$42,$43,$96
        .BYTE $97,$52,$53
f43D4   .BYTE $B2,$B3,$B2,$B3,$B2,$B3,$AA,$AB
        .BYTE $B6,$B7,$D2,$D3,$D2,$D3,$B6,$B7
        .BYTE $B6,$B7,$B6,$B7,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20
f43F8   .BYTE $47
a43F9   .BYTE $11
f43FA   .BYTE $14,$4B,$3D,$6D,$68,$3C
f4400   .BYTE $00,$00,$00,$3E,$66,$7C,$30,$76
        .BYTE $60,$3E,$7E,$78,$30,$6E,$60,$3E
        .BYTE $66,$7C,$00,$00,$00,$00,$00,$00
        .BYTE $1F,$C7,$E3,$38,$0E,$07,$1F,$8C
        .BYTE $06,$01,$CE,$07,$3F,$87,$E3,$00
        .BYTE $00,$00
f442A   .BYTE $2C,$2C,$34,$66,$66,$66,$66,$66
        .BYTE $06,$66,$66,$14,$66,$66,$06,$66
        .BYTE $66,$66,$2C,$2C,$34,$00
f4440   .BYTE $00,$00,$00,$FC,$FC,$CC,$CC,$C0
        .BYTE $CC,$FC,$DC,$CC,$D8,$CC,$30,$CC
        .BYTE $FC,$30,$00,$00,$00,$00,$00,$00
        .BYTE $E3,$F9,$FC,$73,$19,$80,$33,$F9
        .BYTE $F0,$73,$31,$80,$E3,$19,$FC,$00
        .BYTE $00,$00,$2C,$2C,$2C,$66,$66,$66
        .BYTE $60,$66,$66,$6C,$66,$66,$66,$66
        .BYTE $66,$66,$66,$66,$2C,$2C,$2C,$FC
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$08,$00,$00,$08,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $03,$C3,$00,$0C,$FE,$C0,$0C,$35
        .BYTE $C0,$0C,$FA,$C0,$03,$CF,$C0,$00
        .BYTE $3A,$F0,$00,$FA,$F0,$00,$DF,$F0
        .BYTE $00,$DA,$FC,$03,$7A,$EC,$03,$7A
        .BYTE $EC,$03,$FF,$FC,$03,$7A,$EC,$03
        .BYTE $7A,$EC,$03,$BA,$EC,$00,$FF,$F0
        .BYTE $00,$FA,$F0,$00,$FA,$F0,$00,$3F
        .BYTE $C0,$00,$3A,$C0,$00,$0F,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $01,$00,$00,$3D,$FF,$F0,$D5,$BB
        .BYTE $BC,$DD,$AA,$A7,$FD,$D5,$5C,$3D
        .BYTE $3F,$F0,$01,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$55
        .BYTE $00,$00,$00,$00,$00,$00,$FC,$3F
        .BYTE $3F,$EB,$D5,$FF,$EA,$AF,$57,$3A
        .BYTE $BB,$DF,$3A,$FA,$AA,$EB,$F5,$FF
        .BYTE $EC,$DF,$5C,$F0,$3F,$F0,$00,$3F
        .BYTE $00,$00,$DC,$00,$00,$FC,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $0F,$C0,$00,$3C,$00,$0C,$F0,$00
        .BYTE $0C,$FF,$FF,$FF,$AA,$97,$57,$FB
        .BYTE $C0,$0C,$AF,$FF,$FF,$FC,$0F,$C0
        .BYTE $30,$0F,$00,$F0,$3C,$00,$C0,$3F
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $0C,$00,$00,$33,$00,$00,$0C,$C0
        .BYTE $3F,$FC,$FF,$D5,$5F,$D5,$7F,$AD
        .BYTE $EA,$BF,$AE,$FF,$FF,$AF,$C0,$3F
        .BYTE $FC,$00,$03,$C0,$00,$0F,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$03,$C0,$0F
        .BYTE $0D,$70,$FF,$FE,$9C,$55,$5E,$A7
        .BYTE $AA,$AE,$AC,$FF,$FE,$B0,$0F,$33
        .BYTE $C0,$03,$C0,$00,$00,$F0,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$FC,$3F
        .BYTE $3F,$EB,$D5,$FF,$EA,$AF,$57,$3A
        .BYTE $BB,$DF,$3A,$FA,$AA,$EB,$F5,$FF
        .BYTE $EC,$DF,$5C,$F0,$3F,$F0,$00,$3F
        .BYTE $0C,$00,$DC,$33,$00,$FC,$0C,$C0
        .BYTE $3F,$FC,$FF,$D5,$5F,$D5,$7F,$AD
        .BYTE $EA,$BF,$AE,$FF,$FF,$AF,$C0,$3F
        .BYTE $FC,$00,$03,$C0,$00,$0F,$00,$00
        .BYTE $FC,$00,$00,$0F,$00,$0C,$C3,$C0
        .BYTE $0C,$FF,$FF,$FF,$AA,$97,$57,$FB
        .BYTE $C0,$0C,$AF,$FF,$FF,$FC,$0F,$C0
        .BYTE $30,$0F,$00,$F0,$3C,$00,$C0,$3F
        .BYTE $00,$00,$00,$00,$00,$03,$C0,$0F
        .BYTE $0D,$70,$FF,$FE,$9C,$55,$5E,$A7
        .BYTE $AA,$AE,$AC,$FF,$FE,$B0,$0F,$33
        .BYTE $C0,$03,$C0,$00,$00,$F0,$00,$00
        .BYTE $03,$00,$00,$0D,$C0,$00,$0D,$C0
        .BYTE $00,$3B,$B0,$00,$3A,$B0,$00,$EE
        .BYTE $EC,$00,$EB,$AC,$00,$EA,$AC,$00
        .BYTE $3A,$B0,$00,$0F,$C0,$00,$03,$00
        .BYTE $04,$03,$00,$0C,$00,$00,$0C,$00
        .BYTE $00,$0C,$00,$00,$0C,$00,$00,$0F
        .BYTE $00,$03,$FF,$00,$FF,$FF,$0F,$FC
        .BYTE $00,$3F,$00,$00,$F5,$55,$55,$00
        .BYTE $00,$00,$C0,$00,$00,$C0,$00,$03
        .BYTE $B0,$00,$03,$B0,$00,$03,$B0,$00
        .BYTE $0E,$AC,$00,$0E,$AC,$00,$0E,$AC
        .BYTE $00,$0F,$BC,$00,$0C,$CC,$10,$00
        .BYTE $C0,$30,$00,$C0,$30,$00,$00,$30
        .BYTE $00,$00,$30,$00,$00,$F0,$00,$00
        .BYTE $FF,$C0,$00,$FF,$FF,$00,$00,$3F
        .BYTE $F0,$00,$00,$3C,$55,$55,$57,$FF
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$04,$00,$00,$04,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$04,$00,$00,$04
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$04,$00
        .BYTE $00,$04,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$01,$04,$10,$01,$04
a47A0   .BYTE $10,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$40,$00,$00
        .BYTE $40,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$04,$00,$00,$04
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$40,$00,$00,$40
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$40,$00
        .BYTE $00,$40,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$04,$00,$00,$04
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$40,$00,$00,$40,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
f4840   .BYTE $FF,$FF,$FF,$C1,$99,$83,$CF,$89
        .BYTE $9F,$C1,$81,$87,$CF,$91,$9F,$C1
        .BYTE $99,$83,$FF,$FF,$FF
f4855   .BYTE $FF,$FF,$FF,$03,$03,$33,$33,$3F
        .BYTE $33,$03,$23,$33,$27,$33,$CF,$33
        .BYTE $03,$CF,$FF,$FF,$FF,$00,$00,$00
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
        .BYTE $00,$00,$00,$00,$00,$03,$00,$00
        .BYTE $03,$00,$00,$03,$00,$00,$0D,$00
        .BYTE $00,$0C,$00,$00,$0C,$00,$00,$34
        .BYTE $00,$03,$30,$00,$03,$30,$00,$00
        .BYTE $DC,$00,$00,$CF,$00,$03,$43,$00
        .BYTE $03,$40,$00,$03,$80,$00,$0E,$F0
        .BYTE $00,$0E,$F0,$00,$3B,$30,$00,$3B
        .BYTE $30,$00,$3B,$00,$00,$EB,$00,$00
        .BYTE $FC,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$0C,$00,$00,$3B
        .BYTE $00,$00,$EA,$C0,$03,$AA,$B0,$0E
        .BYTE $AA,$F0,$0F,$AB,$B0,$0E,$EE,$B0
        .BYTE $0E,$BA,$B0,$0E,$BA,$B0,$0E,$BA
        .BYTE $C0,$03,$BB,$00,$00,$FC,$00,$00
        .BYTE $30,$00,$00,$00,$0C,$00,$00,$3F
        .BYTE $00,$00,$DD,$C0,$03,$73,$70,$0D
        .BYTE $CC,$DC,$0D,$FF,$DC,$0D,$7F,$5C
        .BYTE $03,$7F,$70,$00,$DD,$C0,$00,$D5
        .BYTE $C0,$00,$D5,$C0,$00,$3F,$00,$00
        .BYTE $3B,$00,$00,$EA,$C0,$00,$EA,$C0
        .BYTE $03,$AE,$B0,$03,$B3,$B0,$03,$B3
        .BYTE $B0,$00,$C0,$C0,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$08,$00,$00,$08
        .BYTE $00,$00,$0C,$00,$00,$0C,$00,$00
        .BYTE $0C,$00,$00,$0C,$00,$00,$0C,$00
        .BYTE $00,$0C,$00,$00,$0C,$00,$00,$04
        .BYTE $00,$00,$04,$00,$00,$04,$00,$00
        .BYTE $04,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$04,$00,$00,$04
        .BYTE $00,$00,$04,$00,$00,$04,$00,$00
        .BYTE $0C,$00,$00,$0C,$00,$00,$0C,$00
        .BYTE $00,$0C,$00,$00,$0C,$00,$00,$0C
        .BYTE $00,$00,$0C,$00,$00,$08,$00,$00
        .BYTE $08,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$17
        .BYTE $FE,$00,$17,$FE,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$BF,$D4
        .BYTE $00,$BF,$D4,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$02,$00,$00
        .BYTE $02,$00,$00,$0C,$00,$00,$0C,$00
        .BYTE $00,$30,$00,$00,$30,$00,$00,$C0
        .BYTE $00,$00,$C0,$00,$01,$00,$00,$01
        .BYTE $00,$00,$04,$00,$00,$04,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$04
        .BYTE $00,$00,$04,$00,$00,$01,$00,$00
        .BYTE $01,$00,$00,$00,$C0,$00,$00,$C0
        .BYTE $00,$00,$30,$00,$00,$30,$00,$00
        .BYTE $0C,$00,$00,$0C,$00,$00,$02,$00
        .BYTE $00,$02,$00,$80,$00,$00,$80,$00
        .BYTE $00,$30,$00,$00,$30,$00,$00,$0C
        .BYTE $00,$00,$0C,$00,$00,$03,$00,$00
        .BYTE $03,$00,$00,$00,$40,$00,$00,$40
        .BYTE $00,$00,$10,$00,$00,$10,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$10
        .BYTE $00,$00,$10,$00,$00,$40,$00,$00
        .BYTE $40,$00,$03,$00,$00,$03,$00,$00
        .BYTE $0C,$00,$00,$0C,$00,$00,$30,$00
        .BYTE $00,$30,$00,$00,$80,$00,$00,$80
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$08,$00,$00
        .BYTE $0C,$00,$00,$26,$00,$00,$26,$00
        .BYTE $00,$26,$00,$00,$08,$00,$00,$2A
        .BYTE $00,$00,$22,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$22,$00,$00
        .BYTE $2A,$00,$00,$08,$00,$00,$26,$00
        .BYTE $00,$26,$00,$00,$26,$00,$00,$0C
        .BYTE $00,$00,$08,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$28,$80,$02,$D6,$00
        .BYTE $02,$D6,$00,$00,$28,$80,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$02,$28,$00,$00,$97,$40
        .BYTE $00,$97,$40,$02,$28,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $02,$40,$00,$0B,$40,$00,$2B,$80
        .BYTE $00,$25,$80,$02,$96,$00,$00,$A8
        .BYTE $00,$00,$20,$00,$00,$20,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $20,$00,$00,$20,$00,$00,$A8,$00
        .BYTE $02,$96,$00,$00,$25,$80,$00,$2B
        .BYTE $80,$00,$0B,$40,$00,$02,$40,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$01
        .BYTE $80,$00,$01,$E0,$00,$02,$E8,$00
        .BYTE $02,$58,$00,$00,$96,$80,$00,$2A
        .BYTE $00,$00,$08,$00,$00,$08,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $08,$00,$00,$08,$00,$00,$2A,$00
        .BYTE $00,$96,$80,$02,$58,$00,$02,$E8
        .BYTE $00,$01,$E0,$00,$01,$80,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $0C,$00,$00,$3B,$00,$00,$3B,$00
        .BYTE $00,$0C,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$10,$00,$00,$0C,$00,$00
        .BYTE $3F,$00,$00,$2E,$00,$00,$2A,$00
        .BYTE $00,$3F,$00,$00,$0C,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00
p4E00   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$10,$00,$00,$1C
        .BYTE $00,$00,$3B,$00,$00,$EE,$C0,$00
        .BYTE $EE,$C0,$00,$EE,$C0,$00,$EE,$C0
        .BYTE $00,$3B,$00,$00,$0C,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$60,$00,$00
        .BYTE $10,$00,$00,$18,$00,$00,$04,$00
        .BYTE $00,$06,$C0,$00,$03,$00,$00,$03
        .BYTE $00,$00,$0C,$C0,$00,$00,$C0,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00
a4EA9   .BYTE $00,$00,$03,$00,$00,$AB,$C0,$01
        .BYTE $57,$C0,$00,$03,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$C0,$00,$0C,$C0,$00,$03
        .BYTE $00,$00,$03,$00,$00,$06,$C0,$00
        .BYTE $04,$00,$00,$18,$00,$00,$10,$00
        .BYTE $00,$60,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$0C,$00,$00,$0C,$00,$00,$0C
        .BYTE $00,$00,$3F,$00,$00,$04,$00,$00
        .BYTE $04,$00,$00,$04,$00,$00,$04,$00
        .BYTE $00,$04,$00,$00,$04,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$30,$00,$00,$33,$00,$00,$0C
        .BYTE $00,$00,$0C,$00,$00,$36,$00,$00
        .BYTE $02,$00,$00,$01,$80,$00,$00,$80
        .BYTE $00,$00,$60,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$30,$00,$00,$FA,$80,$00
        .BYTE $F5,$50,$00,$30,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$60,$00,$00
        .BYTE $80,$00,$01,$80,$00,$02,$00,$00
        .BYTE $36,$00,$00,$0C,$00,$00,$0C,$00
        .BYTE $00,$33,$00,$00,$30,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$04,$00,$00,$04,$00,$00,$04
        .BYTE $00,$00,$04,$00,$00,$04,$00,$00
        .BYTE $04,$00,$00,$3F,$00,$00,$0C,$00
        .BYTE $00,$0C,$00,$00,$0C,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$04,$00,$00,$04,$00
        .BYTE $00,$04,$00,$00,$11,$00,$00,$6A
        .BYTE $40,$00,$11,$00,$00,$04,$00,$00
        .BYTE $04,$00,$00,$04,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$04,$00,$00
        .BYTE $04,$00,$00,$04,$00,$00,$19,$00
        .BYTE $00,$19,$00,$01,$6A,$50,$04,$AA
        .BYTE $A4,$01,$6A,$50,$00,$19,$00,$00
        .BYTE $19,$00,$00,$04,$00,$00,$04,$00
        .BYTE $00,$04,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$04,$00,$00,$04,$00,$00,$19
        .BYTE $00,$00,$19,$00,$00,$6A,$40,$00
        .BYTE $6A,$40,$01,$AA,$90,$01,$A2,$90
        .BYTE $06,$80,$A4,$1A,$AA,$A9,$06,$A0
        .BYTE $A4,$01,$AA,$90,$01,$A2,$90,$00
        .BYTE $6A,$40,$00,$6A,$40,$00,$19,$00
        .BYTE $00,$19,$00,$00,$04,$00,$00,$00
        .BYTE $00,$00,$00,$55,$00,$01,$6A,$40
        .BYTE $05,$AA,$90,$06,$AA,$90,$1A,$80
        .BYTE $A4,$1A,$80,$AC,$2A,$01,$2C,$68
        .BYTE $10,$29,$68,$18,$09,$69,$20,$29
        .BYTE $68,$C9,$09,$68,$00,$09,$18,$00
        .BYTE $49,$1A,$60,$24,$1A,$02,$24,$1A
        .BYTE $82,$24,$06,$8A,$90,$06,$AA,$90
        .BYTE $01,$AA,$40,$00,$55,$00,$00,$00
        .BYTE $25,$40,$1B,$64,$10,$12,$42,$50
        .BYTE $42,$10,$C8,$09,$00,$60,$40,$00
        .BYTE $09,$00,$00,$1C,$B8,$00,$10,$70
        .BYTE $00,$01,$00,$00,$08,$40,$00,$09
        .BYTE $60,$00,$00,$38,$00,$24,$00,$00
        .BYTE $01,$12,$00,$00,$52,$00,$12,$15
        .BYTE $00,$40,$08,$83,$28,$04,$1A,$84
        .BYTE $00,$28,$40,$00,$04,$00,$00,$00
        .BYTE $3C,$00,$00,$7E,$00,$00,$3C,$1C
        .BYTE $00,$42,$24,$00,$66,$4C,$03,$CF
        .BYTE $D8,$0C,$A5,$3C,$10,$72,$14,$20
        .BYTE $24,$04,$42,$18,$84,$47,$19,$48
        .BYTE $23,$A5,$30,$12,$C2,$00,$0C,$7E
        .BYTE $00,$00,$FF,$00,$01,$FF,$00,$00
        .BYTE $F7,$00,$01,$27,$00,$00,$E7,$00
        .BYTE $00,$07,$00,$00,$02,$00,$00,$00
        .BYTE $3C,$00,$00,$7E,$00,$00,$3C,$0E
        .BYTE $00,$42,$12,$00,$66,$24,$03,$F3
        .BYTE $C8,$0C,$A5,$78,$10,$62,$14,$20
        .BYTE $24,$14,$43,$18,$84,$47,$18,$88
        .BYTE $31,$A5,$48,$0E,$42,$30,$00,$FF
        .BYTE $00,$00,$FF,$80,$00,$FF,$80,$00
        .BYTE $F7,$00,$00,$E7,$00,$00,$EE,$00
        .BYTE $00,$E7,$00,$00,$40,$00,$00,$00
        .BYTE $3C,$00,$00,$7E,$00,$00,$3C,$0E
        .BYTE $00,$42,$12,$00,$66,$24,$03,$F3
        .BYTE $C8,$0C,$A5,$78,$10,$62,$14,$20
        .BYTE $24,$14,$43,$18,$84,$47,$18,$88
        .BYTE $31,$A5,$48,$0E,$42,$30,$00,$FF
        .BYTE $00,$00,$FF,$80,$00,$FB,$80,$00
        .BYTE $F7,$00,$00,$E6,$00,$00,$E5,$00
        .BYTE $00,$E0,$00,$00,$40,$00,$00,$00
        .BYTE $3C,$00,$00,$7E,$00,$00,$3C,$1C
        .BYTE $00,$42,$24,$00,$66,$4C,$03,$CF
        .BYTE $D8,$0C,$8D,$7C,$10,$62,$14,$20
        .BYTE $24,$04,$43,$18,$84,$47,$19,$48
        .BYTE $31,$A5,$30,$0E,$42,$00,$00,$7E
        .BYTE $00,$00,$FF,$00,$01,$FF,$00,$01
        .BYTE $D7,$00,$00,$E7,$00,$00,$67,$00
        .BYTE $00,$C7,$00,$00,$02,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$55,$00
        .BYTE $00,$14,$04,$00,$14,$14,$00,$96
        .BYTE $50,$02,$96,$90,$0A,$9A,$A8,$2A
        .BYTE $AA,$A8,$2A,$AA,$A8,$28,$AA,$20
        .BYTE $2A,$AA,$20,$08,$28,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $11,$00,$00,$40,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$55,$00
        .BYTE $00,$14,$04,$00,$14,$14,$00,$96
        .BYTE $50,$02,$96,$90,$0A,$9A,$A8,$2A
        .BYTE $AA,$A8,$2A,$AA,$A8,$28,$AA,$A0
        .BYTE $0A,$AA,$20,$00,$28,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $50,$00,$00,$00,$00,$00,$01,$00
        .BYTE $00,$01,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$55,$00
        .BYTE $00,$14,$04,$00,$14,$14,$00,$96
        .BYTE $50,$02,$96,$90,$0A,$9A,$A8,$2A
        .BYTE $AA,$A8,$2A,$AA,$A8,$28,$AA,$A0
        .BYTE $0A,$AA,$20,$00,$28,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$04,$00,$00
        .BYTE $00,$00,$00,$01,$00,$00,$01,$00
        .BYTE $00,$40,$00,$00,$40,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$55,$00
        .BYTE $00,$14,$04,$00,$14,$14,$00,$96
        .BYTE $50,$02,$96,$90,$0A,$9A,$A8,$2A
        .BYTE $AA,$A8,$2A,$AA,$A8,$28,$AA,$20
        .BYTE $0A,$AA,$20,$00,$28,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$10,$00,$00
        .BYTE $10,$00,$00,$00,$00,$00,$40,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $3C,$00,$00,$7E,$00,$38,$81,$00
        .BYTE $24,$42,$00,$3A,$6A,$00,$1D,$93
        .BYTE $C0,$3E,$65,$30,$2B,$92,$08,$24
        .BYTE $FC,$44,$21,$37,$A2,$12,$98,$E2
        .BYTE $0C,$AD,$84,$00,$56,$F8,$00,$7E
        .BYTE $00,$00,$FF,$00,$00,$FF,$80,$00
        .BYTE $EF,$00,$00,$E7,$80,$00,$E5,$00
        .BYTE $00,$E0,$00,$01,$40,$00,$00,$00
        .BYTE $3C,$00,$00,$7E,$00,$70,$81,$00
        .BYTE $48,$42,$00,$34,$6A,$00,$1B,$D3
        .BYTE $C0,$1C,$E5,$30,$2B,$16,$08,$29
        .BYTE $FC,$44,$25,$73,$E2,$11,$18,$C2
        .BYTE $12,$A7,$4C,$0C,$42,$F0,$00,$FF
        .BYTE $00,$01,$FF,$00,$01,$FF,$00,$01
        .BYTE $EF,$00,$00,$E7,$00,$00,$A7,$00
        .BYTE $00,$07,$00,$00,$05,$00,$00,$00
        .BYTE $3C,$00,$00,$7E,$00,$70,$81,$00
        .BYTE $48,$42,$00,$34,$6A,$00,$1B,$D3
        .BYTE $C0,$1C,$E5,$30,$2F,$36,$08,$29
        .BYTE $FC,$84,$25,$67,$C2,$11,$18,$E2
        .BYTE $12,$AE,$CC,$0C,$43,$F0,$00,$FF
        .BYTE $00,$01,$FF,$00,$00,$FF,$00,$01
        .BYTE $EF,$00,$00,$E7,$00,$00,$A7,$00
        .BYTE $00,$07,$00,$00,$02,$00,$00,$00
        .BYTE $3C,$00,$00,$7E,$00,$38,$81,$00
        .BYTE $24,$42,$00,$3A,$6A,$00,$1D,$D3
        .BYTE $C0,$3E,$65,$30,$27,$B6,$08,$24
        .BYTE $FD,$44,$32,$E3,$C2,$12,$BD,$E2
        .BYTE $0C,$AE,$4C,$00,$43,$F0,$00,$7F
        .BYTE $00,$00,$FF,$00,$00,$FF,$80,$00
        .BYTE $EF,$80,$00,$E7,$80,$00,$E5,$00
        .BYTE $00,$E0,$00,$00,$40,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$55,$00
        .BYTE $10,$A8,$00,$14,$A8,$00,$05,$AA
        .BYTE $00,$05,$6A,$80,$29,$5A,$A0,$2A
        .BYTE $56,$A8,$2A,$95,$A8,$08,$A5,$28
        .BYTE $08,$A9,$A8,$00,$28,$20,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$40,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$55,$00
        .BYTE $10,$A8,$00,$14,$A8,$00,$15,$AA
        .BYTE $00,$05,$6A,$80,$29,$5A,$A0,$2A
        .BYTE $56,$A8,$2A,$95,$A8,$0A,$A5,$68
        .BYTE $08,$A9,$60,$00,$28,$40,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$40,$00
        .BYTE $00,$00,$00,$00,$01,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$55,$00
        .BYTE $10,$A8,$00,$14,$A8,$00,$05,$AA
        .BYTE $00,$05,$EA,$80,$29,$5A,$A0,$2A
        .BYTE $56,$A8,$2A,$95,$A8,$0A,$A5,$68
        .BYTE $08,$A9,$60,$00,$28,$40,$00,$00
        .BYTE $00,$00,$00,$00,$00,$10,$00,$00
        .BYTE $00,$00,$00,$40,$00,$00,$40,$00
        .BYTE $00,$01,$00,$00,$01,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$55,$00
        .BYTE $10,$A8,$00,$14,$A8,$00,$05,$AA
        .BYTE $00,$05,$6A,$80,$29,$5A,$A0,$2A
        .BYTE $56,$A8,$2A,$95,$A8,$08,$A5,$68
        .BYTE $08,$A9,$60,$00,$28,$40,$00,$00
        .BYTE $00,$00,$00,$00,$00,$04,$00,$00
        .BYTE $04,$00,$00,$00,$00,$00,$01,$00
        .BYTE $00,$00,$00,$00,$40,$00,$00,$00
        .BYTE $3C,$00,$00,$BD,$00,$01,$C2,$00
        .BYTE $02,$F9,$00,$05,$F2,$00,$03,$66
        .BYTE $00,$00,$C5,$80,$00,$A2,$40,$01
        .BYTE $4B,$40,$01,$84,$80,$01,$81,$80
        .BYTE $00,$C3,$00,$00,$BE,$00,$00,$44
        .BYTE $00,$00,$7C,$00,$00,$7C,$00,$00
        .BYTE $3C,$00,$00,$3C,$00,$00,$38,$00
        .BYTE $00,$34,$00,$00,$3C,$00,$00,$00
        .BYTE $3C,$00,$00,$BD,$00,$01,$C2,$00
        .BYTE $02,$F9,$00,$02,$F2,$00,$01,$66
        .BYTE $40,$00,$C4,$A0,$01,$63,$20,$01
        .BYTE $84,$C0,$01,$88,$80,$00,$81,$00
        .BYTE $00,$C2,$00,$00,$76,$00,$00,$6A
        .BYTE $00,$00,$7F,$00,$00,$3F,$80,$00
        .BYTE $7F,$80,$00,$FB,$C0,$01,$E1,$C0
        .BYTE $01,$C0,$A0,$00,$E0,$E0,$00,$00
        .BYTE $3C,$00,$03,$BD,$00,$04,$42,$00
        .BYTE $05,$F9,$00,$02,$72,$00,$00,$66
        .BYTE $40,$00,$44,$A0,$00,$CB,$20,$01
        .BYTE $86,$C0,$01,$84,$80,$00,$C1,$80
        .BYTE $00,$A3,$00,$00,$5E,$00,$00,$64
        .BYTE $00,$00,$FE,$00,$07,$FE,$00,$07
        .BYTE $FE,$00,$05,$8F,$00,$02,$07,$00
        .BYTE $00,$06,$80,$00,$07,$00,$00,$00
        .BYTE $3C,$00,$03,$BD,$00,$04,$42,$00
        .BYTE $05,$F9,$00,$02,$72,$00,$00,$66
        .BYTE $40,$00,$44,$A0,$00,$CB,$20,$01
        .BYTE $86,$C0,$01,$84,$80,$00,$C1,$80
        .BYTE $00,$A3,$00,$00,$5E,$00,$00,$64
        .BYTE $00,$00,$FC,$00,$01,$FE,$00,$01
        .BYTE $FE,$00,$01,$4E,$00,$00,$8E,$00
        .BYTE $00,$0D,$00,$00,$0E,$00,$00,$00
        .BYTE $00,$00,$00,$41,$00,$00,$54,$00
        .BYTE $01,$2A,$00,$01,$28,$00,$00,$28
        .BYTE $00,$00,$28,$00,$00,$A9,$40,$00
        .BYTE $AA,$40,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$04,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$41,$00,$00,$54,$00
        .BYTE $01,$2A,$00,$01,$28,$00,$00,$28
        .BYTE $00,$00,$28,$40,$00,$A9,$40,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$40,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$11,$00,$01,$54,$00
        .BYTE $01,$2A,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$28,$40,$00,$A9,$40,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$2A,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$00,$00,$00,$04,$00,$00
        .BYTE $00,$00,$01,$00,$00,$00,$00,$00
        .BYTE $00,$01,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$11,$00,$01,$54,$00
        .BYTE $01,$2A,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$28,$40,$00,$A9,$40,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$2A,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$00,$00,$00,$04,$00,$00
        .BYTE $00,$00,$00,$40,$00,$00,$00,$00
        .BYTE $00,$01,$00,$00,$00,$00,$00,$00
        .BYTE $3C,$00,$00,$BD,$00,$00,$43,$80
        .BYTE $00,$9F,$40,$00,$4F,$A0,$00,$66
        .BYTE $C0,$01,$A3,$00,$02,$45,$00,$02
        .BYTE $D2,$80,$01,$21,$80,$01,$81,$80
        .BYTE $00,$C3,$00,$00,$7D,$00,$00,$22
        .BYTE $00,$00,$3E,$00,$00,$3E,$00,$00
        .BYTE $3C,$00,$00,$3C,$00,$00,$1C,$00
        .BYTE $00,$2C,$00,$00,$3C,$00,$00,$00
        .BYTE $3C,$00,$00,$BD,$00,$00,$43,$80
        .BYTE $00,$9F,$40,$00,$4F,$40,$02,$66
        .BYTE $80,$05,$23,$00,$04,$C6,$80,$03
        .BYTE $21,$80,$01,$11,$80,$00,$81,$00
        .BYTE $00,$43,$00,$00,$6E,$00,$00,$56
        .BYTE $00,$00,$FE,$00,$01,$FC,$00,$01
        .BYTE $FE,$00,$03,$DF,$00,$03,$87,$80
        .BYTE $05,$03,$80,$07,$07,$00,$00,$00
        .BYTE $3C,$00,$00,$BD,$C0,$00,$42,$20
        .BYTE $00,$9F,$A0,$00,$4E,$40,$02,$66
        .BYTE $00,$05,$22,$00,$04,$D3,$00,$03
        .BYTE $61,$80,$01,$21,$80,$01,$83,$00
        .BYTE $00,$C5,$00,$00,$7A,$00,$00,$26
        .BYTE $00,$00,$7F,$00,$00,$7F,$E0,$00
        .BYTE $7F,$E0,$00,$F1,$A0,$00,$E0,$40
        .BYTE $01,$60,$00,$00,$E0,$00,$00,$00
        .BYTE $3C,$00,$00,$BD,$C0,$00,$42,$20
        .BYTE $00,$9F,$A0,$00,$4E,$40,$02,$66
        .BYTE $00,$05,$22,$00,$04,$D3,$00,$03
        .BYTE $61,$80,$01,$21,$80,$01,$83,$00
        .BYTE $00,$C5,$00,$00,$7A,$00,$00,$26
        .BYTE $00,$00,$3F,$00,$00,$7F,$80,$00
        .BYTE $7F,$80,$00,$72,$80,$00,$71,$00
        .BYTE $00,$B0,$00,$00,$70,$00,$00,$00
        .BYTE $00,$00,$00,$41,$00,$00,$15,$00
        .BYTE $00,$A8,$40,$00,$28,$40,$00,$28
        .BYTE $00,$00,$28,$00,$01,$6A,$00,$01
        .BYTE $6A,$00,$00,$6A,$00,$00,$6A,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$10,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$41,$00,$00,$15,$00
        .BYTE $00,$A8,$40,$00,$28,$40,$00,$28
        .BYTE $00,$01,$28,$00,$01,$6A,$00,$01
        .BYTE $6A,$00,$00,$6A,$00,$00,$6A,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $01,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$45,$00,$00,$15,$40
        .BYTE $00,$A8,$00,$00,$28,$00,$00,$28
        .BYTE $00,$01,$28,$00,$01,$6A,$00,$01
        .BYTE $6A,$00,$00,$6A,$00,$00,$68,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$00,$00,$00,$10,$00,$00
        .BYTE $00,$00,$00,$00,$40,$00,$00,$00
        .BYTE $00,$40,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$45,$00,$00,$15,$40
        .BYTE $00,$A8,$00,$00,$28,$00,$00,$28
        .BYTE $00,$01,$28,$00,$01,$6A,$00,$01
        .BYTE $6A,$00,$00,$6A,$00,$00,$68,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$00,$00,$00,$10,$00,$00
        .BYTE $00,$00,$00,$01,$00,$00,$00,$00
        .BYTE $00,$40,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$28,$00,$00,$AA,$00
        .BYTE $00,$AA,$0C,$00,$EB,$34,$00,$FF
        .BYTE $D0,$03,$FF,$70,$0E,$BB,$EC,$3A
        .BYTE $AA,$EC,$3B,$AA,$AC,$3B,$AA,$B0
        .BYTE $0F,$AB,$C0,$00,$EB,$00,$00,$FE
        .BYTE $00,$03,$AA,$00,$03,$F2,$C0,$00
        .BYTE $D2,$C0,$00,$12,$C0,$00,$32,$C0
        .BYTE $00,$02,$B0,$00,$03,$F0,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$0C
        .BYTE $00,$EB,$34,$00,$FF,$D4,$00,$3C
        .BYTE $5C,$03,$EB,$FC,$0E,$AA,$AC,$3A
        .BYTE $AA,$AC,$3B,$AA,$F0,$3B,$AB,$00
        .BYTE $3B,$AB,$00,$0F,$EB,$00,$00,$BE
        .BYTE $00,$00,$AA,$00,$00,$B3,$80,$00
        .BYTE $B3,$C0,$00,$B3,$C0,$00,$B1,$C0
        .BYTE $03,$B3,$00,$03,$F0,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$0C
        .BYTE $00,$EB,$34,$00,$FF,$D4,$00,$3C
        .BYTE $5C,$03,$EB,$FC,$0E,$AA,$AC,$3A
        .BYTE $AA,$AC,$3B,$AA,$F0,$3B,$AB,$00
        .BYTE $3B,$AB,$00,$0F,$EB,$00,$00,$BE
        .BYTE $80,$00,$AA,$C0,$00,$B3,$80,$00
        .BYTE $B1,$C0,$00,$B1,$00,$00,$B3,$00
        .BYTE $03,$B0,$00,$03,$F0,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$0C
        .BYTE $00,$EB,$34,$00,$FF,$D4,$00,$3C
        .BYTE $5C,$03,$EB,$FC,$0E,$AA,$AC,$3A
        .BYTE $AA,$AC,$3B,$AA,$F0,$3B,$AB,$00
        .BYTE $3B,$AB,$00,$0F,$EB,$00,$00,$BE
        .BYTE $00,$00,$EA,$00,$03,$AA,$C0,$03
        .BYTE $B2,$C0,$00,$E2,$C0,$00,$72,$C0
        .BYTE $00,$C2,$B0,$00,$03,$F0,$00,$00
        .BYTE $00,$00,$00,$28,$00,$00,$AA,$00
        .BYTE $30,$AA,$00,$1C,$EB,$00,$37,$7D
        .BYTE $00,$3D,$D7,$C0,$39,$7A,$B0,$3B
        .BYTE $5E,$AC,$3A,$BF,$EC,$0E,$A5,$EC
        .BYTE $03,$EB,$F0,$00,$BE,$00,$00,$AB
        .BYTE $00,$02,$BE,$80,$03,$8E,$C0,$03
        .BYTE $8E,$C0,$03,$81,$C0,$03,$83,$00
        .BYTE $01,$C0,$00,$03,$C0,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$30,$AA,$00
        .BYTE $1C,$EB,$00,$37,$7D,$00,$3D,$94
        .BYTE $00,$3D,$7B,$C0,$3B,$5E,$B0,$3A
        .BYTE $F7,$AC,$0F,$AD,$EC,$00,$A9,$EC
        .BYTE $00,$EB,$AC,$00,$BE,$F0,$00,$EA
        .BYTE $00,$03,$BA,$00,$02,$AA,$00,$02
        .BYTE $CE,$00,$02,$CE,$00,$03,$4E,$00
        .BYTE $00,$CD,$C0,$00,$03,$C0,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$30,$AA,$00
        .BYTE $1C,$EB,$00,$37,$7D,$00,$3D,$94
        .BYTE $00,$3D,$7B,$C0,$3B,$5E,$B0,$3A
        .BYTE $F7,$AC,$0F,$AD,$EC,$00,$A9,$EC
        .BYTE $00,$EB,$AC,$00,$BE,$F0,$03,$AA
        .BYTE $00,$0E,$AA,$00,$0E,$FA,$00,$03
        .BYTE $4E,$00,$00,$CE,$00,$00,$0E,$00
        .BYTE $00,$0D,$C0,$00,$03,$C0,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$30,$AA,$00
        .BYTE $1C,$EB,$00,$37,$7D,$00,$3D,$94
        .BYTE $00,$3D,$7B,$C0,$3B,$5E,$B0,$3A
        .BYTE $B7,$AC,$0F,$AD,$EC,$00,$A9,$EC
        .BYTE $00,$EB,$AC,$00,$BE,$F0,$00,$AB
        .BYTE $00,$03,$BB,$00,$03,$BA,$00,$03
        .BYTE $8B,$00,$03,$8F,$00,$03,$81,$00
        .BYTE $01,$83,$00,$03,$C0,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$AF,$00,$00,$FD,$00,$00,$F5
        .BYTE $00,$00,$D4,$00,$00,$2A,$00,$00
        .BYTE $2B,$40,$00,$EB,$40,$00,$AA,$80
        .BYTE $00,$BA,$C0,$00,$AF,$00,$00,$EB
        .BYTE $00,$00,$BC,$00,$00,$2C,$00,$00
        .BYTE $2C,$00,$00,$2C,$00,$00,$28,$00
        .BYTE $00,$34,$00,$00,$3C,$00,$00,$00
        .BYTE $00,$00,$00,$28,$00,$00,$AA,$00
        .BYTE $00,$AA,$00,$00,$AF,$00,$00,$FD
        .BYTE $00,$00,$F5,$00,$00,$D4,$40,$00
        .BYTE $2B,$40,$00,$AA,$80,$00,$EA,$C0
        .BYTE $00,$BB,$00,$00,$AE,$00,$00,$EB
        .BYTE $00,$00,$BE,$C0,$00,$2E,$C0,$00
        .BYTE $2C,$80,$00,$2C,$C0,$00,$F8,$D0
        .BYTE $00,$D0,$30,$00,$F0,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$AF,$00,$00,$FD,$00,$00,$F5
        .BYTE $00,$00,$D4,$00,$00,$2B,$40,$00
        .BYTE $2B,$40,$00,$EA,$80,$00,$AA,$C0
        .BYTE $00,$BB,$00,$00,$AE,$00,$00,$EB
        .BYTE $00,$00,$BE,$00,$00,$2A,$00,$03
        .BYTE $EA,$00,$03,$AE,$00,$03,$0E,$00
        .BYTE $03,$0F,$40,$00,$0F,$C0,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$AF,$00,$00,$FD,$00,$00,$F5
        .BYTE $00,$00,$D4,$00,$00,$2B,$40,$00
        .BYTE $2B,$40,$00,$EA,$80,$00,$AA,$C0
        .BYTE $00,$BB,$00,$00,$AE,$00,$00,$EB
        .BYTE $00,$00,$BE,$00,$00,$2A,$00,$00
        .BYTE $FA,$00,$00,$EE,$00,$00,$DE,$00
        .BYTE $00,$CF,$40,$00,$0F,$C0,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$FA,$00,$00,$7F,$00,$00,$5F
        .BYTE $00,$00,$17,$00,$00,$A8,$00,$01
        .BYTE $E8,$00,$01,$EB,$00,$02,$AA,$00
        .BYTE $03,$EE,$00,$00,$FA,$00,$00,$EB
        .BYTE $00,$00,$3E,$00,$00,$38,$00,$00
        .BYTE $38,$00,$00,$38,$00,$00,$28,$00
        .BYTE $00,$1C,$00,$00,$3C,$00,$00,$00
        .BYTE $00,$00,$00,$28,$00,$00,$AA,$00
        .BYTE $00,$AA,$00,$00,$FA,$00,$00,$7F
        .BYTE $00,$00,$5F,$00,$01,$97,$00,$01
        .BYTE $E8,$00,$02,$AA,$00,$03,$AB,$00
        .BYTE $00,$EE,$00,$00,$BA,$00,$00,$EB
        .BYTE $00,$03,$BE,$00,$03,$B8,$00,$02
        .BYTE $38,$00,$03,$38,$00,$07,$2F,$00
        .BYTE $0C,$07,$00,$00,$0F,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$FA,$00,$00,$7F,$00,$00,$5F
        .BYTE $00,$00,$17,$00,$01,$E8,$00,$01
        .BYTE $E8,$00,$02,$AB,$00,$03,$AA,$00
        .BYTE $00,$EE,$00,$00,$BA,$00,$00,$EB
        .BYTE $00,$00,$BE,$00,$00,$A8,$00,$00
        .BYTE $AB,$C0,$00,$BA,$C0,$00,$B0,$C0
        .BYTE $01,$F0,$C0,$03,$F0,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$FA,$00,$00,$7F,$00,$00,$5F
        .BYTE $00,$00,$17,$00,$01,$E8,$00,$01
        .BYTE $E8,$00,$02,$AB,$00,$03,$AA,$00
        .BYTE $00,$EE,$00,$00,$BA,$00,$00,$EB
        .BYTE $00,$00,$BE,$00,$00,$A8,$00,$00
        .BYTE $AF,$00,$00,$BB,$00,$00,$B7,$00
        .BYTE $01,$F3,$00,$03,$F0,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $04,$BF,$00,$04,$F6,$30,$0C,$D4
        .BYTE $30,$04,$3E,$F0,$04,$EB,$B0,$07
        .BYTE $AA,$B0,$0E,$BA,$C0,$07,$EB,$00
        .BYTE $0C,$EB,$00,$0C,$3E,$00,$0C,$EB
        .BYTE $00,$0C,$EB,$C0,$0C,$EE,$C0,$00
        .BYTE $EE,$C0,$00,$FB,$00,$00,$EE,$C0
        .BYTE $00,$33,$C0,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$28,$00
        .BYTE $00,$AA,$00,$00,$AA,$00,$04,$BF
        .BYTE $00,$04,$F6,$00,$0C,$D4,$00,$04
        .BYTE $3E,$00,$04,$EB,$80,$07,$AA,$E0
        .BYTE $0E,$BA,$B8,$07,$EB,$EC,$0F,$2B
        .BYTE $3C,$0C,$3F,$0C,$0C,$EA,$C0,$0C
        .BYTE $EE,$C0,$0C,$EE,$C0,$00,$EF,$00
        .BYTE $00,$3B,$00,$00,$2E,$C0,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$FE,$10,$0C,$9F,$10,$0C,$17
        .BYTE $30,$0F,$BC,$10,$0E,$EB,$10,$0E
        .BYTE $AA,$D0,$03,$AE,$B0,$00,$EB,$D0
        .BYTE $00,$EB,$30,$00,$BC,$30,$00,$EB
        .BYTE $30,$03,$EB,$30,$03,$BB,$30,$03
        .BYTE $BB,$00,$00,$EF,$00,$03,$BB,$00
        .BYTE $03,$CC,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$28,$00
        .BYTE $00,$AA,$00,$00,$AA,$00,$00,$FE
        .BYTE $10,$00,$9F,$10,$00,$17,$30,$00
        .BYTE $BC,$10,$02,$EB,$10,$0B,$AA,$D0
        .BYTE $2E,$AE,$B0,$3B,$EB,$D0,$3C,$E8
        .BYTE $F0,$30,$FC,$30,$03,$AB,$30,$03
        .BYTE $BB,$30,$03,$BB,$30,$00,$FB,$00
        .BYTE $00,$EC,$00,$03,$B8,$00,$FF,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$AF,$00,$00,$F7,$00,$00,$14
        .BYTE $00,$03,$EB,$00,$0E,$BF,$C0,$0E
        .BYTE $BA,$F0,$0E,$EA,$B0,$0E,$EB,$B0
        .BYTE $0E,$FF,$B0,$03,$9E,$B0,$03,$9E
        .BYTE $B0,$00,$77,$C0,$00,$70,$00,$01
        .BYTE $C0,$00,$03,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$EB,$00,$00,$7D,$00,$00,$14
        .BYTE $00,$00,$EB,$00,$03,$BE,$C0,$0E
        .BYTE $BA,$B0,$0E,$AA,$B0,$0E,$EB,$B0
        .BYTE $0E,$FF,$B0,$0E,$9E,$B0,$03,$DF
        .BYTE $C0,$00,$1C,$00,$00,$1C,$00,$00
        .BYTE $1C,$00,$00,$1C,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$FA,$00,$00,$DF,$00,$00,$14
        .BYTE $00,$00,$EB,$C0,$03,$EE,$B0,$0F
        .BYTE $BA,$B0,$0E,$AB,$B0,$0E,$EB,$B0
        .BYTE $0E,$FF,$B0,$0E,$9E,$C0,$0E,$DE
        .BYTE $C0,$03,$47,$00,$00,$07,$00,$00
        .BYTE $01,$C0,$00,$00,$40,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$79,$03
        .BYTE $E0,$00,$03,$60,$00,$00,$B3,$00
        .BYTE $00,$B1,$00,$00,$B3,$C0,$00,$B3
        .BYTE $80,$00,$AA,$C0,$00,$BE,$80,$00
        .BYTE $EB,$00,$00,$AB,$00,$03,$AB,$00
        .BYTE $3F,$AA,$F0,$3A,$AA,$AC,$3A,$AA
        .BYTE $AC,$0E,$EB,$EC,$0C,$3C,$2C,$0C
        .BYTE $FF,$B0,$04,$EB,$30,$FF,$AA,$10
        .BYTE $FF,$AA,$FC,$0D,$69,$54,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$EB,$00
        .BYTE $00,$7D,$00,$10,$14,$04,$30,$28
        .BYTE $0C,$30,$3C,$0C,$33,$38,$CC,$3A
        .BYTE $AA,$AC,$0F,$AE,$F0,$00,$2A,$00
        .BYTE $00,$EB,$00,$00,$EB,$00,$00,$A2
        .BYTE $80,$00,$A2,$80,$00,$A2,$80,$00
        .BYTE $E3,$00,$00,$E3,$00,$03,$41,$C0
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $14,$00,$00,$55,$00,$00,$ED,$00
        .BYTE $00,$55,$00,$04,$34,$10,$0C,$14
        .BYTE $30,$04,$3C,$10,$04,$59,$10,$01
        .BYTE $65,$40,$00,$D9,$C0,$00,$24,$00
        .BYTE $00,$3C,$00,$00,$14,$00,$00,$11
        .BYTE $00,$00,$11,$00,$00,$11,$00,$00
        .BYTE $33,$00,$00,$33,$00,$00,$D1,$C0
        .BYTE $00,$00,$00,$00,$FF,$C0,$00,$00
        .BYTE $14,$00,$00,$14,$00,$00,$2C,$00
        .BYTE $00,$14,$00,$01,$34,$40,$03,$14
        .BYTE $C0,$01,$3C,$40,$01,$24,$40,$00
        .BYTE $59,$00,$00,$E7,$00,$00,$18,$00
        .BYTE $00,$3C,$00,$00,$14,$00,$00,$14
        .BYTE $00,$00,$14,$00,$00,$14,$00,$00
        .BYTE $3C,$00,$00,$3C,$00,$00,$D7,$00
        .BYTE $03,$FF,$F0,$00,$FF,$C0,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $14,$00,$00,$14,$00,$00,$2C,$00
        .BYTE $00,$14,$00,$01,$34,$40,$03,$14
        .BYTE $C0,$01,$3C,$40,$01,$18,$40,$01
        .BYTE $65,$40,$00,$DB,$00,$03,$FF,$F0
        .BYTE $03,$FF,$F0,$00,$FF,$C0,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$14,$00,$00,$14,$00,$00
        .BYTE $2C,$00,$00,$14,$00,$00,$D7,$C0
        .BYTE $00,$FF,$C0,$00,$3F,$00,$80,$00
        .BYTE $00,$00,$00
f60C4   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$1C,$00,$00,$DF,$00,$02,$7D
        .BYTE $80,$02,$96,$80,$02,$BE,$80,$02
        .BYTE $DF,$80,$02,$DF,$80,$02,$DF,$80
        .BYTE $02,$DF,$80,$02,$FF,$80,$02,$55
        .BYTE $80,$02,$AA,$80,$02,$7D,$80,$02
        .BYTE $7D,$80,$02,$EB,$80,$02,$EB,$80
        .BYTE $02,$EB,$80,$00,$00,$00,$AD,$00
        .BYTE $0A,$AD,$00,$AA,$AD,$02,$AA,$AF
        .BYTE $02,$AA,$AE,$02,$AA,$E6,$03,$FF
        .BYTE $EB,$03,$FF,$EB,$00,$44,$6B,$00
        .BYTE $CC,$EB,$00,$C0,$2B,$00,$00,$29
        .BYTE $00,$00,$3A,$00,$00,$3A,$00,$00
        .BYTE $3A,$00,$00,$0A,$00,$00,$0A,$00
        .BYTE $00,$0A,$00,$00,$0A,$00,$00,$0E
        .BYTE $00,$00,$0E,$10,$78,$00,$00,$7A
        .BYTE $80,$00,$7A,$A8,$00,$FA,$AA,$00
        .BYTE $BA,$AA,$80,$9B,$AA,$80,$EB,$FF
        .BYTE $C0,$EB,$FF,$C0,$E9,$11,$00,$EB
        .BYTE $33,$00,$E8,$03,$00,$68,$00,$00
        .BYTE $AC,$00,$00,$AC,$00,$00,$AC,$00
        .BYTE $00,$A0,$00,$00,$A0,$00,$00,$A0
        .BYTE $00,$00,$A0,$00,$00,$B0,$00,$00
        .BYTE $B0,$00,$00,$10,$00,$EB,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$AA,$00,$02,$AA,$80,$0A,$AA
        .BYTE $A0,$0A,$EB,$A0,$0F,$EB,$F0,$0D
        .BYTE $EB,$F0,$01,$2C,$00,$01,$2C,$00
        .BYTE $01,$EC,$00,$01,$6C,$00,$01,$3C
        .BYTE $00,$01,$3C,$00,$01,$00,$00,$01
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$02,$EB,$80,$02
        .BYTE $69,$80,$02,$69,$80,$02,$FF,$80
        .BYTE $02,$AA,$80,$02,$AA,$80,$02,$BE
        .BYTE $80,$02,$DF,$80,$02,$DF,$80,$02
        .BYTE $DF,$80,$02,$9E,$80,$02,$BE,$80
        .BYTE $02,$FF,$80,$02,$DF,$80,$02,$9E
        .BYTE $80,$03,$AA,$C0,$03,$AA,$C0,$00
        .BYTE $AA,$00,$00,$BE,$00,$00,$3C,$00
        .BYTE $00,$1C,$00,$00,$A0,$00,$00,$A0
        .BYTE $00,$00,$A0,$00,$00,$A0,$00,$00
        .BYTE $A0,$00,$00,$A0,$00,$00,$A0,$00
        .BYTE $00,$A8,$00,$00,$A8,$00,$00,$A8
        .BYTE $00,$00,$A8,$00,$00,$E8,$00,$00
        .BYTE $E8,$00,$00,$EA,$AA,$80,$EA,$AA
        .BYTE $80,$EA,$AA,$C0,$BA,$AB,$C0,$BA
        .BYTE $BF,$00,$FF,$FD,$00,$7F,$D1,$00
        .BYTE $79,$00,$00,$10,$00,$00,$0A,$00
        .BYTE $00,$0A,$00,$00,$0A,$00,$00,$0A
        .BYTE $00,$00,$0A,$00,$00,$0A,$00,$00
        .BYTE $0A,$00,$00,$2A,$00,$00,$2A,$00
        .BYTE $00,$2A,$00,$00,$2A,$00,$00,$2B
        .BYTE $00,$00,$2B,$02,$AA,$AB,$02,$AA
        .BYTE $AB,$02,$AA,$AB,$03,$AA,$AE,$03
        .BYTE $FA,$AE,$00,$FF,$EF,$00,$4F,$ED
        .BYTE $00,$44,$7D,$10,$00,$00,$00,$00
        .BYTE $00,$00,$00,$30,$00,$00,$30,$40
        .BYTE $00,$30,$40,$00,$38,$40,$00,$38
        .BYTE $40,$00,$3B,$40,$00,$29,$40,$00
        .BYTE $28,$40,$00,$28,$40,$0F,$EB,$70
        .BYTE $0A,$AA,$A0,$0E,$AA,$B0,$0F,$AA
        .BYTE $F0,$03,$EB,$C0,$00,$EB,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$28,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$02,$AA,$03,$AF
        .BYTE $9F,$0F,$BF,$9F,$2F,$BF,$BA,$EF
        .BYTE $BF,$BA,$E5,$95,$BA,$6F,$BF,$9F
        .BYTE $2B,$AF,$9F,$0A,$AA,$AA,$02,$AA
        .BYTE $AA,$00,$02,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$5E,$FF,$AA,$FF
        .BYTE $EA,$AE,$FF,$EA,$AE,$AA,$AA,$C0
        .BYTE $AA,$A0,$00,$6A,$B7,$00,$6A,$B4
        .BYTE $00,$2A,$B0,$00,$1A,$B4,$00,$1A
        .BYTE $B4,$00,$02,$B0,$00,$02,$B0,$00
        .BYTE $06,$B5,$00,$00,$B0,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$B0,$00,$06,$B5,$00,$03
        .BYTE $B0,$00,$02,$B0,$00,$1E,$B4,$00
        .BYTE $1E,$B4,$00,$0A,$B0,$00,$6A,$B4
        .BYTE $00,$3A,$A0,$00,$AA,$AA,$C0,$FF
        .BYTE $EA,$AC,$FF,$EA,$AA,$5E,$FF,$AA
        .BYTE $5E,$FF,$AA,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$0A,$C0,$B0,$2A
        .BYTE $C8,$B0,$2A,$E8,$AA,$AA,$A8,$AA
        .BYTE $AA,$A8,$AA,$AA,$54,$BA,$E9,$75
        .BYTE $B0,$2A,$54,$B0,$2A,$C0,$00,$0A
        .BYTE $C0,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$FD,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AA,$80,$00,$F6,$FA
        .BYTE $C0,$F6,$FE,$F0,$AE,$FE,$F8,$AE
        .BYTE $FE,$FB,$AE,$56,$5B,$F6,$FE,$F9
        .BYTE $F6,$FA,$E8,$AA,$AA,$A0,$AA,$AA
        .BYTE $80,$AA,$80,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$0E,$00,$00,$5E,$90,$00
        .BYTE $0E,$C0,$00,$0E,$80,$00,$1E,$B4
        .BYTE $00,$1E,$B4,$00,$0E,$A0,$00,$1E
        .BYTE $A9,$00,$0A,$AC,$03,$AA,$AA,$3A
        .BYTE $AB,$FF,$AA,$AB,$FF,$AA,$FF,$B5
        .BYTE $AA,$FF,$B5,$AA,$AA,$FF,$B5,$BA
        .BYTE $AB,$FF,$BA,$AB,$FF,$03,$AA,$AA
        .BYTE $00,$0A,$AA,$00,$DE,$A9,$00,$1E
        .BYTE $A9,$00,$0E,$A8,$00,$1E,$A4,$00
        .BYTE $1E,$A4,$00,$0E,$80,$00,$0E,$80
        .BYTE $00,$5E,$90,$00,$0E,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$03,$A0,$00,$03,$A8
        .BYTE $0E,$15,$A8,$0E,$5D,$6B,$AE,$15
        .BYTE $AA,$AA,$2A,$AA,$AA,$2A,$AA,$AA
        .BYTE $2B,$A8,$0E,$23,$A8,$0E,$03,$A0
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$FD,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$24,$00,$00,$B7,$00,$02,$BF
        .BYTE $00,$02,$95,$80,$02,$AF,$80,$02
        .BYTE $B7,$C0,$02,$B7,$C0,$02,$B7,$C0
        .BYTE $02,$B7,$C0,$02,$BF,$C0,$02,$95
        .BYTE $40,$02,$AA,$80,$02,$9F,$40,$02
        .BYTE $9F,$40,$02,$BA,$C0,$02,$BA,$C0
        .BYTE $02,$BA,$C0,$00,$00,$00,$AB,$00
        .BYTE $0A,$AB,$00,$AA,$AB,$00,$AA,$AB
        .BYTE $00,$AA,$A9,$00,$AA,$FA,$00,$FF
        .BYTE $FA,$00,$FF,$FA,$00,$11,$1A,$00
        .BYTE $33,$3A,$00,$30,$2A,$00,$00,$2A
        .BYTE $00,$00,$3E,$00,$00,$3E,$00,$00
        .BYTE $3E,$00,$00,$0A,$00,$00,$0A,$00
        .BYTE $00,$0A,$00,$00,$0A,$00,$00,$0F
        .BYTE $00,$00,$0F,$10,$5C,$00,$00,$5E
        .BYTE $80,$00,$5E,$A8,$00,$FE,$AA,$00
        .BYTE $AE,$AA,$00,$A6,$AA,$00,$FB,$FF
        .BYTE $00,$FB,$FF,$00,$F8,$44,$00,$F8
        .BYTE $CC,$00,$F8,$0C,$00,$58,$00,$00
        .BYTE $AC,$00,$00,$AC,$00,$00,$AC,$00
        .BYTE $00,$A0,$00,$00,$A0,$00,$00,$A0
        .BYTE $00,$00,$A0,$00,$00,$B0,$00,$00
        .BYTE $B0,$00,$00,$10,$00,$EB,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$AA,$00,$02,$AA,$80,$02,$AA
        .BYTE $80,$02,$BA,$80,$03,$FB,$C0,$01
        .BYTE $EB,$C0,$01,$2B,$00,$01,$6B,$00
        .BYTE $01,$6B,$00,$01,$6C,$00,$01,$7C
        .BYTE $00,$01,$7C,$00,$01,$00,$00,$01
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$18,$00,$00,$DE,$00,$00,$FE
        .BYTE $80,$02,$56,$80,$02,$FA,$80,$03
        .BYTE $DE,$80,$03,$DE,$80,$03,$DE,$80
        .BYTE $03,$DE,$80,$03,$FE,$80,$01,$56
        .BYTE $80,$02,$AA,$80,$01,$F6,$80,$01
        .BYTE $F6,$80,$03,$AE,$80,$03,$AE,$80
        .BYTE $03,$AE,$80,$00,$00,$00,$35,$00
        .BYTE $02,$B5,$00,$2A,$B5,$00,$AA,$BF
        .BYTE $00,$AA,$BA,$00,$AA,$9A,$00,$FF
        .BYTE $EF,$00,$FF,$EF,$00,$11,$2F,$00
        .BYTE $33,$2F,$00,$30,$2F,$00,$00,$25
        .BYTE $00,$00,$3A,$00,$00,$3A,$00,$00
        .BYTE $3A,$00,$00,$0A,$00,$00,$0A,$00
        .BYTE $00,$0A,$00,$00,$0A,$00,$00,$0E
        .BYTE $00,$00,$0E,$10,$EA,$00,$00,$EA
        .BYTE $A0,$00,$EA,$AA,$00,$EA,$AA,$00
        .BYTE $6A,$AA,$00,$AF,$AA,$00,$AF,$FF
        .BYTE $00,$AF,$FF,$00,$A4,$44,$00,$AC
        .BYTE $CC,$00,$A8,$0C,$00,$A8,$00,$00
        .BYTE $BC,$00,$00,$BC,$00,$00,$BC,$00
        .BYTE $00,$A0,$00,$00,$A0,$00,$00,$A0
        .BYTE $00,$00,$A0,$00,$00,$F0,$00,$00
        .BYTE $F0,$00,$00,$10,$00,$EB,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$AA,$00,$02,$AA,$80,$02,$AA
        .BYTE $80,$02,$AE,$80,$03,$EF,$C0,$01
        .BYTE $E8,$00,$01,$E8,$00,$01,$E8,$00
        .BYTE $01,$E8,$00,$01,$78,$00,$01,$7C
        .BYTE $00,$01,$7C,$00,$01,$00,$00,$01
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$02,$BA,$C0,$02
        .BYTE $9A,$40,$02,$9A,$40,$02,$BF,$C0
        .BYTE $02,$AA,$80,$02,$AA,$80,$02,$AF
        .BYTE $80,$02,$B7,$C0,$02,$B7,$C0,$02
        .BYTE $B7,$C0,$02,$A7,$80,$02,$AF,$80
        .BYTE $02,$BF,$C0,$02,$B7,$C0,$02,$A7
        .BYTE $80,$03,$EA,$80,$03,$EA,$C0,$00
        .BYTE $AA,$00,$00,$AF,$00,$00,$3F,$00
        .BYTE $00,$07,$00,$00,$A0,$00,$00,$A0
        .BYTE $00,$00,$A0,$00,$00,$A0,$00,$00
        .BYTE $A0,$00,$00,$A0,$00,$00,$A8,$00
        .BYTE $00,$A8,$00,$00,$A8,$00,$00,$58
        .BYTE $00,$00,$F8,$00,$00,$F8,$00,$00
        .BYTE $F8,$00,$00,$FA,$AA,$00,$FA,$AA
        .BYTE $00,$A6,$AA,$00,$AE,$AF,$00,$FE
        .BYTE $FF,$00,$5F,$F8,$00,$5F,$84,$00
        .BYTE $5C,$44,$00,$10,$00,$00,$0A,$00
        .BYTE $00,$0A,$00,$00,$0A,$00,$00,$0A
        .BYTE $00,$00,$0A,$00,$00,$0A,$00,$00
        .BYTE $2A,$00,$00,$2A,$00,$00,$2A,$00
        .BYTE $00,$2A,$00,$00,$2A,$00,$00,$2A
        .BYTE $00,$00,$2A,$00,$AA,$AA,$00,$AA
        .BYTE $AA,$00,$AA,$AA,$00,$AA,$A9,$00
        .BYTE $FA,$AB,$00,$FF,$AB,$00,$1B,$EB
        .BYTE $00,$11,$EB,$10,$00,$00,$00,$00
        .BYTE $03,$00,$00,$03,$00,$00,$03,$40
        .BYTE $00,$03,$40,$00,$3F,$40,$00,$3D
        .BYTE $40,$00,$2D,$40,$00,$2A,$40,$00
        .BYTE $2A,$40,$00,$2A,$40,$02,$AA,$40
        .BYTE $02,$AA,$80,$02,$AA,$80,$03,$AA
        .BYTE $C0,$03,$EB,$C0,$00,$EB,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$EB,$00,$00,$03,$AE,$80,$01
        .BYTE $A6,$80,$01,$A6,$80,$03,$FE,$80
        .BYTE $02,$AA,$80,$02,$AA,$80,$02,$FA
        .BYTE $80,$03,$7E,$80,$03,$7E,$80,$03
        .BYTE $7E,$80,$02,$7A,$80,$02,$FA,$80
        .BYTE $03,$FE,$80,$03,$7E,$80,$02,$7A
        .BYTE $80,$02,$AB,$C0,$03,$AB,$C0,$00
        .BYTE $AA,$00,$00,$FA,$00,$00,$FC,$00
        .BYTE $00,$70,$00,$00,$A0,$00,$00,$A0
        .BYTE $00,$00,$A0,$00,$00,$A0,$00,$00
        .BYTE $A0,$00,$00,$A0,$00,$00,$A8,$00
        .BYTE $00,$A8,$00,$00,$A8,$00,$00,$A8
        .BYTE $00,$00,$A8,$00,$00,$A8,$00,$00
        .BYTE $A8,$00,$00,$AA,$AA,$00,$AA,$AA
        .BYTE $00,$AA,$AA,$00,$6A,$AA,$00,$EA
        .BYTE $BF,$00,$EB,$FF,$00,$EB,$E4,$00
        .BYTE $EA,$44,$00,$10,$00,$00,$0A,$00
        .BYTE $00,$0A,$00,$00,$0A,$00,$00,$0A
        .BYTE $00,$00,$0A,$00,$00,$0A,$00,$00
        .BYTE $2A,$00,$00,$2A,$00,$00,$2A,$00
        .BYTE $00,$25,$00,$00,$2F,$00,$00,$2F
        .BYTE $00,$00,$2F,$00,$AA,$AF,$00,$AA
        .BYTE $AF,$00,$AA,$9A,$00,$EA,$BA,$00
        .BYTE $FE,$BF,$00,$3F,$F5,$00,$13,$F5
        .BYTE $00,$11,$35,$10,$00,$00,$00,$00
        .BYTE $00,$00,$00,$C0,$00,$00,$C0,$40
        .BYTE $00,$C0,$40,$00,$FD,$40,$00,$3D
        .BYTE $40,$00,$39,$40,$00,$29,$40,$00
        .BYTE $29,$40,$00,$28,$40,$02,$AA,$40
        .BYTE $02,$AA,$80,$02,$AA,$80,$03,$AA
        .BYTE $C0,$03,$EB,$C0,$00,$EB,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$AA,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$03,$9F,$03,$BF
        .BYTE $9F,$0F,$BF,$BA,$2F,$BF,$BA,$E5
        .BYTE $95,$BA,$6F,$BF,$9F,$EB,$AF,$9F
        .BYTE $2A,$AA,$AA,$0A,$AA,$AA,$02,$AA
        .BYTE $AA,$00,$02,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$FF,$EA,$AE,$FF
        .BYTE $EA,$AE,$AA,$AA,$EE,$AA,$AA,$C0
        .BYTE $AA,$B0,$00,$6A,$B4,$00,$6A,$B4
        .BYTE $00,$1A,$B4,$00,$1A,$B4,$00,$0A
        .BYTE $B0,$00,$02,$B0,$00,$06,$B5,$00
        .BYTE $02,$B0,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$02,$B0,$00,$06
        .BYTE $B5,$00,$03,$B0,$00,$0A,$B4,$00
        .BYTE $1E,$B4,$00,$1E,$B0,$00,$2A,$B4
        .BYTE $00,$3A,$A0,$00,$FF,$EA,$C0,$FF
        .BYTE $EA,$AC,$5E,$FF,$AA,$5E,$FF,$AA
        .BYTE $5E,$FF,$AA,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$B0,$0A
        .BYTE $C8,$A0,$2A,$E8,$AA,$AA,$A8,$AA
        .BYTE $AA,$54,$BA,$A9,$55,$BA,$E9,$75
        .BYTE $B0,$29,$55,$B0,$0A,$54,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$FD,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$02,$AA,$02,$AA
        .BYTE $AA,$0B,$AF,$9F,$2F,$BF,$9F,$EF
        .BYTE $BF,$BA,$EF,$BF,$BA,$65,$95,$BA
        .BYTE $2F,$BF,$9F,$0B,$AF,$9F,$02,$AA
        .BYTE $AA,$00,$02,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$5E,$FF,$AA,$5E
        .BYTE $FF,$AA,$FF,$EA,$AA,$FF,$EA,$AC
        .BYTE $AA,$AA,$C0,$2A,$A0,$00,$6A,$B4
        .BYTE $00,$6A,$B4,$00,$0A,$B0,$00,$1A
        .BYTE $B4,$00,$16,$B4,$00,$02,$B0,$00
        .BYTE $02,$B0,$00,$05,$B5,$00,$00,$B0
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$B0
        .BYTE $00,$05,$B5,$00,$02,$B0,$00,$02
        .BYTE $B0,$00,$16,$B4,$00,$1A,$B4,$00
        .BYTE $0A,$B0,$00,$6A,$B4,$00,$6A,$B4
        .BYTE $00,$2A,$A0,$00,$AA,$AA,$C0,$AA
        .BYTE $AA,$AC,$FF,$EA,$AA,$FF,$EA,$AA
        .BYTE $5E,$FF,$AA,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$0A,$C0,$00,$0A,$C0,$B0,$2A
        .BYTE $C0,$B0,$2A,$C0,$AA,$AA,$C0,$AA
        .BYTE $AA,$A8,$AA,$AA,$A8,$AA,$AA,$D0
        .BYTE $B0,$29,$55,$B0,$2A,$C0,$00,$0A
        .BYTE $C0,$00,$0A,$C0,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$F6,$C0,$00,$F6,$FE
        .BYTE $C0,$AE,$FE,$F0,$AE,$FE,$F8,$AE
        .BYTE $56,$5B,$F6,$FE,$F9,$F6,$FA,$EB
        .BYTE $AA,$AA,$A8,$AA,$AA,$A0,$AA,$AA
        .BYTE $80,$AA,$80,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$0E,$80,$00
        .BYTE $5E,$90,$00,$0E,$C0,$00,$1E,$A0
        .BYTE $00,$1E,$B4,$00,$0E,$B4,$00,$1E
        .BYTE $A8,$00,$0A,$AC,$03,$AB,$FF,$3A
        .BYTE $AB,$FF,$AA,$FF,$B5,$AA,$FF,$B5
        .BYTE $AA,$FF,$B5,$AA,$BA,$AB,$FF,$BA
        .BYTE $AB,$FF,$BB,$AA,$AA,$03,$AA,$AA
        .BYTE $00,$0E,$AA,$00,$1E,$A9,$00,$1E
        .BYTE $A9,$00,$1E,$A4,$00,$1E,$A4,$00
        .BYTE $0E,$A0,$00,$0E,$80,$00,$5E,$90
        .BYTE $00,$0E,$80,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$15,$A0
        .BYTE $0E,$55,$68,$0E,$5D,$6B,$AE,$55
        .BYTE $6A,$AE,$15,$AA,$AA,$2A,$AA,$AA
        .BYTE $2B,$A8,$0A,$23,$A0,$0E,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$FD,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AA,$80,$00,$AA,$AA
        .BYTE $80,$F6,$FA,$E0,$F6,$FE,$F8,$AE
        .BYTE $FE,$FB,$AE,$FE,$FB,$AE,$56,$59
        .BYTE $F6,$FE,$F8,$F6,$FA,$E0,$AA,$AA
        .BYTE $80,$AA,$80,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$0E
        .BYTE $00,$00,$5E,$50,$00,$0E,$80,$00
        .BYTE $0E,$80,$00,$1E,$94,$00,$1E,$A4
        .BYTE $00,$0E,$A0,$00,$1E,$A9,$00,$1E
        .BYTE $A9,$00,$0A,$A8,$03,$AA,$AA,$3A
        .BYTE $AA,$AA,$AA,$AB,$FF,$AA,$AB,$FF
        .BYTE $AA,$FF,$B5,$AA,$AA,$FF,$B5,$AA
        .BYTE $FF,$B5,$AA,$AB,$FF,$3A,$AB,$FF
        .BYTE $03,$AA,$AA,$00,$0A,$A8,$00,$1E
        .BYTE $A9,$00,$1E,$A9,$00,$0E,$A0,$00
        .BYTE $1E,$A4,$00,$1E,$94,$00,$0E,$80
        .BYTE $00,$0E,$80,$00,$5E,$50,$00,$0E
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $03,$A0,$00,$03,$A0,$00,$03,$A8
        .BYTE $0E,$55,$68,$0E,$07,$AA,$AA,$2A
        .BYTE $AA,$AA,$2A,$AA,$AA,$03,$AA,$AA
        .BYTE $03,$A8,$0E,$03,$A8,$0E,$03,$A0
        .BYTE $00,$03,$A0,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$28,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$9E,$00,$02,$DF,$80,$02,$EB
        .BYTE $80,$02,$AA,$80,$02,$EB,$80,$06
        .BYTE $EB,$90,$06,$AA,$90,$0E,$BE,$B0
        .BYTE $06,$D7,$90,$02,$D7,$80,$02,$D7
        .BYTE $80,$02,$FF,$80,$02,$EB,$80,$02
        .BYTE $EB,$80,$02,$BE,$80,$02,$BE,$80
        .BYTE $03,$BE,$C0,$00,$00,$AA,$00,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$EB,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$28,$00,$00,$28,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$28,$00,$01,$28,$00,$01,$28
        .BYTE $00,$01,$28,$00,$01,$68,$00,$01
        .BYTE $2A,$80,$01,$2A,$A0,$01,$2B,$F0
        .BYTE $00,$3C,$00,$00,$02,$BE,$80,$02
        .BYTE $BE,$80,$02,$BE,$80,$02,$EB,$80
        .BYTE $02,$EB,$80,$02,$FF,$80,$02,$D7
        .BYTE $80,$02,$D7,$80,$06,$D7,$90,$0E
        .BYTE $BE,$B0,$06,$AA,$90,$06,$EB,$90
        .BYTE $02,$EB,$80,$02,$AA,$80,$02,$EB
        .BYTE $80,$03,$DF,$C0,$00,$9E,$00,$00
        .BYTE $AA,$00,$00,$EB,$00,$00,$28,$00
        .BYTE $00,$3C,$00,$00,$00,$28,$00,$0A
        .BYTE $A8,$40,$0E,$A8,$40,$03,$E8,$40
        .BYTE $00,$29,$40,$00,$28,$40,$00,$28
        .BYTE $40,$00,$28,$40,$00,$28,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$28,$00,$00,$AA,$00,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$AA,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$1D,$00,$02,$EE,$AB,$0B,$EE
        .BYTE $FA,$2B,$AB,$AE,$AB,$AB,$5F,$AB
        .BYTE $AB,$5F,$A9,$AB,$3E,$AB,$EE,$FA
        .BYTE $2A,$EE,$AA,$0A,$AA,$AB,$02,$BD
        .BYTE $AB,$00,$1D,$03,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $2C,$AB,$00,$2C,$AA,$00,$AC,$AA
        .BYTE $AA,$AB,$AA,$AA,$AB,$AB,$AA,$57
        .BYTE $AB,$01,$55,$AB,$01,$75,$00,$00
        .BYTE $54,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$74,$00,$EA,$BB,$80,$AF,$BB
        .BYTE $E0,$BA,$EA,$E8,$F5,$EA,$EA,$F5
        .BYTE $EA,$EA,$BC,$EA,$6A,$AF,$BB,$EA
        .BYTE $AA,$BB,$A8,$EA,$AA,$A0,$EA,$7E
        .BYTE $80,$C0,$74,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$15,$00
        .BYTE $00,$55,$40,$EA,$55,$40,$AA,$EA
        .BYTE $AA,$AA,$EA,$AA,$AA,$EA,$AA,$AA
        .BYTE $3A,$00,$EA,$38,$00,$EA,$38,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$28,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$A7,$00,$02,$B7,$C0,$02,$BA
        .BYTE $C0,$02,$AA,$80,$02,$BA,$C0,$01
        .BYTE $BA,$C0,$01,$AA,$80,$03,$AF,$80
        .BYTE $01,$B5,$C0,$02,$B5,$C0,$02,$B5
        .BYTE $C0,$02,$BF,$C0,$02,$BA,$C0,$02
        .BYTE $BA,$C0,$02,$AF,$80,$02,$AF,$80
        .BYTE $03,$EF,$80,$00,$00,$AA,$00,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$FB,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$28,$00,$00,$28,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$28,$00,$00,$68,$00,$00,$68
        .BYTE $00,$01,$58,$00,$01,$D8,$00,$01
        .BYTE $5A,$00,$00,$6A,$80,$00,$6B,$C0
        .BYTE $00,$3C,$00,$00,$00,$28,$00,$00
        .BYTE $28,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$7A,$00,$03,$7E,$80,$03,$AE
        .BYTE $80,$02,$AA,$80,$03,$AE,$80,$03
        .BYTE $AE,$40,$02,$AA,$40,$02,$FA,$C0
        .BYTE $03,$5E,$40,$03,$5E,$80,$03,$5E
        .BYTE $80,$03,$FE,$80,$03,$AE,$80,$03
        .BYTE $AE,$80,$02,$FA,$80,$02,$FA,$80
        .BYTE $02,$FB,$C0,$00,$00,$AA,$00,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$EF,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$28,$00,$00,$28,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$28,$00,$00,$68,$00,$01,$68
        .BYTE $00,$01,$68,$00,$01,$6C,$00,$01
        .BYTE $6A,$00,$01,$6A,$80,$00,$6F,$C0
        .BYTE $00,$3C,$00,$00,$03,$AF,$80,$02
        .BYTE $AF,$80,$02,$AF,$80,$02,$BA,$C0
        .BYTE $02,$BA,$C0,$02,$BF,$C0,$02,$B5
        .BYTE $C0,$02,$B5,$C0,$01,$B5,$C0,$03
        .BYTE $AF,$80,$01,$AA,$80,$01,$BA,$C0
        .BYTE $02,$BA,$C0,$02,$AA,$80,$02,$BA
        .BYTE $C0,$03,$B7,$C0,$00,$A7,$00,$00
        .BYTE $AA,$00,$00,$EB,$00,$00,$28,$00
        .BYTE $00,$3C,$00,$00,$00,$28,$00,$02
        .BYTE $A9,$00,$03,$A9,$40,$00,$E9,$40
        .BYTE $00,$39,$40,$00,$29,$40,$00,$29
        .BYTE $40,$00,$29,$00,$00,$28,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$28,$00,$00,$FA,$00,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$AA,$00,$00,$02,$FA,$C0,$02
        .BYTE $FA,$80,$02,$FA,$80,$03,$AE,$80
        .BYTE $03,$AE,$80,$03,$FE,$80,$03,$5E
        .BYTE $80,$03,$5E,$80,$03,$5E,$40,$02
        .BYTE $FA,$C0,$02,$AA,$40,$03,$AE,$40
        .BYTE $03,$AE,$80,$02,$AA,$80,$03,$AE
        .BYTE $80,$03,$7E,$C0,$00,$7A,$00,$00
        .BYTE $AA,$00,$00,$EB,$00,$00,$28,$00
        .BYTE $00,$3C,$00,$DF,$00,$28,$00,$02
        .BYTE $A9,$00,$03,$A9,$00,$00,$E5,$40
        .BYTE $00,$27,$40,$00,$25,$40,$00,$29
        .BYTE $00,$00,$29,$00,$00,$28,$00,$00
        .BYTE $28,$00,$00,$28,$00,$00,$28,$00
        .BYTE $00,$28,$00,$00,$28,$00,$00,$28
        .BYTE $00,$00,$28,$00,$00,$AF,$00,$00
        .BYTE $AA,$00,$00,$AA,$00,$00,$AA,$00
        .BYTE $00,$AA,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$03,$AE,$FA,$0B,$AB
        .BYTE $AE,$2B,$AB,$5F,$AB,$AB,$5F,$A9
        .BYTE $AB,$AE,$AB,$EE,$3A,$AA,$EE,$FA
        .BYTE $2A,$AA,$AB,$0A,$BD,$AB,$02,$9D
        .BYTE $AB,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$AA,$00,$2C,$AA,$00,$AC,$AA
        .BYTE $AA,$AB,$AB,$AA,$57,$AB,$A9,$55
        .BYTE $AB,$01,$55,$AB,$01,$75,$00,$01
        .BYTE $55,$00,$00,$54,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$1D,$00
        .BYTE $00,$1D,$00,$02,$AA,$AB,$0A,$EE
        .BYTE $AB,$2B,$EE,$FA,$AB,$AB,$AE,$AB
        .BYTE $AB,$5F,$AB,$AB,$5F,$A9,$AB,$AE
        .BYTE $2B,$EE,$FA,$0A,$EE,$AA,$02,$AA
        .BYTE $AB,$00,$1D,$03,$00,$1D,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$2C,$00,$00
        .BYTE $2C,$AB,$00,$AC,$AB,$00,$AC,$AA
        .BYTE $AA,$AB,$AA,$AA,$AB,$AA,$AA,$AB
        .BYTE $AB,$00,$10,$AB,$01,$55,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$AF,$BA,$C0,$BA,$EA
        .BYTE $E0,$F5,$EA,$E8,$F5,$EA,$EA,$BA
        .BYTE $EA,$6A,$AC,$BB,$EA,$AF,$BB,$AA
        .BYTE $EA,$AA,$A8,$EA,$7E,$A0,$EA,$76
        .BYTE $80,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$15,$00
        .BYTE $00,$55,$40,$AA,$55,$40,$AA,$2A
        .BYTE $AA,$AA,$EA,$AA,$AA,$EA,$AA,$EA
        .BYTE $3A,$00,$EA,$38,$00,$EA,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$74,$00
        .BYTE $00,$74,$00,$EA,$AA,$80,$EA,$BB
        .BYTE $A0,$AF,$BB,$E8,$BA,$EA,$EA,$F5
        .BYTE $EA,$EA,$F5,$EA,$EA,$BA,$EA,$6A
        .BYTE $AF,$BB,$E8,$AA,$BB,$A0,$EA,$AA
        .BYTE $80,$C0,$74,$00,$00,$74,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$55,$40,$EA,$04,$00,$EA,$EA
        .BYTE $AA,$AA,$EA,$AA,$AA,$EA,$AA,$AA
        .BYTE $3A,$00,$EA,$3A,$00,$EA,$38,$00
        .BYTE $00,$38,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$FE,$00,$00
        .BYTE $FE,$00,$00,$FE,$00,$01,$BB,$00
        .BYTE $03,$BB,$80,$03,$BB,$80,$03,$39
        .BYTE $80,$06,$38,$C0,$0E,$38,$E0,$0C
        .BYTE $38,$60,$00,$00,$00,$30,$38,$18
        .BYTE $20,$38,$08,$30,$38,$18,$10,$00
        .BYTE $10,$01,$39,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$18
        .BYTE $00,$00,$21,$80,$00,$00,$C0,$00
        .BYTE $80,$3C,$00,$00,$1E,$00,$00,$03
        .BYTE $C0,$00,$01,$E0,$00,$00,$38,$02
        .BYTE $C5,$78,$32,$DF,$F8,$02,$C5,$78
        .BYTE $00,$00,$38,$00,$01,$E0,$00,$03
        .BYTE $C0,$00,$0E,$00,$80,$3C,$00,$00
        .BYTE $C0,$00,$11,$80,$00,$0C,$00,$00
        .BYTE $00,$00,$00,$DF,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$01,$39,$00,$10,$00
        .BYTE $10,$30,$38,$18,$20,$38,$08,$30
        .BYTE $38,$18,$00,$00,$00,$0C,$38,$60
        .BYTE $0E,$38,$E0,$06,$38,$C0,$03,$39
        .BYTE $80,$03,$BB,$80,$03,$BB,$80,$01
        .BYTE $BB,$00,$00,$FE,$00,$00,$FE,$00
        .BYTE $00,$FE,$00,$00,$00,$00,$00,$00
        .BYTE $00,$18,$00,$01,$84,$00,$03,$00
        .BYTE $00,$3C,$01,$00,$78,$00,$03,$C0
        .BYTE $00,$07,$80,$00,$1C,$00,$00,$1E
        .BYTE $A3,$40,$1F,$FB,$4C,$1E,$A3,$40
        .BYTE $1C,$00,$00,$07,$80,$00,$03,$C0
        .BYTE $00,$00,$70,$00,$00,$3C,$01,$00
        .BYTE $03,$00,$00,$01,$88,$00,$00,$30
        .BYTE $00,$00,$00,$7F,$00,$3C,$00,$00
        .BYTE $FF,$00,$00,$FF,$00,$00,$D7,$00
        .BYTE $00,$55,$00,$00,$14,$00,$00,$EB
        .BYTE $00,$03,$69,$C0,$0D,$6A,$70,$0D
        .BYTE $EA,$70,$0D,$7A,$70,$03,$EA,$70
        .BYTE $00,$BE,$70,$00,$AA,$00,$00,$B5
        .BYTE $80,$01,$8D,$C0,$01,$8D,$C0,$01
        .BYTE $83,$00,$01,$80,$00,$00,$C0,$00
        .BYTE $03,$C0,$00,$00,$00,$3C,$00,$00
        .BYTE $FF,$00,$00,$FF,$00,$00,$D7,$00
        .BYTE $00,$55,$00,$00,$14,$00,$03,$EB
        .BYTE $00,$0D,$69,$C0,$35,$AA,$70,$37
        .BYTE $AA,$70,$35,$EA,$70,$0F,$AA,$70
        .BYTE $00,$BE,$70,$00,$AA,$00,$00,$B5
        .BYTE $80,$01,$8D,$C0,$01,$8D,$C0,$01
        .BYTE $8D,$C0,$01,$81,$C0,$00,$C3,$00
        .BYTE $03,$C0,$00,$00,$00,$3C,$00,$00
        .BYTE $FF,$00,$00,$FF,$00,$00,$D7,$00
        .BYTE $00,$55,$00,$00,$14,$00,$00,$EB
        .BYTE $C0,$03,$69,$70,$0D,$AA,$5C,$0D
        .BYTE $AA,$DC,$0D,$AB,$5C,$0D,$AA,$F0
        .BYTE $0D,$BE,$00,$00,$AA,$00,$02,$5D
        .BYTE $00,$03,$72,$40,$03,$72,$40,$03
        .BYTE $72,$40,$03,$42,$40,$00,$C3,$00
        .BYTE $00,$03,$C0,$00,$00,$3C,$00,$00
        .BYTE $FF,$00,$00,$FF,$00,$00,$D7,$00
        .BYTE $00,$55,$00,$00,$14,$00,$00,$EB
        .BYTE $00,$03,$69,$C0,$0D,$A9,$70,$0D
        .BYTE $AB,$70,$0D,$ED,$70,$0D,$AB,$C0
        .BYTE $0D,$BE,$00,$00,$AA,$00,$02,$5E
        .BYTE $00,$03,$72,$40,$03,$72,$40,$00
        .BYTE $C2,$40,$00,$02,$40,$00,$03,$00
        .BYTE $00,$03,$C0,$DF,$00,$00,$00,$00
        .BYTE $3C,$00,$00,$FF,$00,$00,$FF,$00
        .BYTE $00,$F5,$00,$00,$D5,$00,$00,$D4
        .BYTE $00,$00,$28,$00,$00,$1A,$00,$00
        .BYTE $1E,$C0,$00,$17,$40,$00,$35,$00
        .BYTE $00,$2F,$00,$00,$2B,$00,$00,$3C
        .BYTE $00,$00,$1C,$00,$00,$1C,$00,$00
        .BYTE $1C,$00,$00,$18,$00,$00,$34,$00
        .BYTE $00,$3C,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$3C,$00,$00,$FF,$00
        .BYTE $00,$FF,$00,$00,$F5,$00,$00,$D5
        .BYTE $00,$00,$D4,$00,$00,$2B,$00,$00
        .BYTE $19,$00,$00,$15,$80,$00,$37,$00
        .BYTE $00,$2E,$00,$00,$2B,$00,$00,$3D
        .BYTE $C0,$00,$1D,$C0,$00,$1C,$40,$00
        .BYTE $5C,$C0,$00,$F8,$D0,$00,$D0,$30
        .BYTE $00,$30,$00,$00,$00,$00,$00,$00
        .BYTE $3C,$00,$00,$FF,$00,$00,$FF,$00
        .BYTE $00,$F5,$00,$00,$D5,$00,$00,$D4
        .BYTE $00,$00,$2A,$00,$00,$1A,$00,$00
        .BYTE $1F,$00,$00,$15,$80,$00,$37,$00
        .BYTE $00,$2E,$00,$00,$2B,$00,$00,$3E
        .BYTE $00,$00,$1D,$00,$01,$5D,$00,$03
        .BYTE $5D,$00,$03,$01,$00,$03,$03,$40
        .BYTE $00,$03,$C0,$00,$00,$00,$00,$00
        .BYTE $3C,$00,$00,$FF,$00,$00,$FF,$00
        .BYTE $00,$F5,$00,$00,$D5,$00,$00,$D4
        .BYTE $00,$00,$28,$00,$00,$DA,$C0,$00
        .BYTE $6B,$40,$00,$7A,$00,$00,$5E,$00
        .BYTE $00,$16,$00,$00,$3E,$00,$00,$2A
        .BYTE $00,$00,$5D,$00,$00,$DD,$00,$00
        .BYTE $C1,$00,$00,$C1,$00,$00,$03,$40
        .BYTE $00,$03,$C0,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$C3,$00
        .BYTE $03,$41,$C0,$0D,$C3,$70,$37,$3C
        .BYTE $DC,$37,$FF,$DC,$0D,$FF,$70,$01
        .BYTE $D7,$40,$03,$D6,$C0,$03,$AB,$00
        .BYTE $03,$EB,$00,$02,$BE,$00,$03,$AB
        .BYTE $00,$0D,$EF,$00,$0D,$75,$C0,$0D
        .BYTE $FD,$C0,$35,$CD,$70,$37,$03,$70
        .BYTE $0C,$00,$F0,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$20,$20,$20,$20
        .BYTE $20,$20,$20,$20,$FF,$F0,$00,$C0
        .BYTE $30,$00,$C0,$30,$00,$C0,$30,$00
        .BYTE $C0,$30,$00,$C0,$30,$00,$C0,$30
        .BYTE $00,$C0,$30,$00,$C0,$30,$00,$FF
        .BYTE $F0,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$40,$AA,$AA,$AA,$A0
        .BYTE $8F,$BF,$F0,$CC,$BC,$8F,$0F,$0F
        .BYTE $03,$C3,$F3,$33,$0C,$30,$33,$33
        .BYTE $33,$00,$03,$3F,$0A,$CA,$F2,$0C
        .BYTE $00,$FF,$0F,$C3,$AA,$AA,$AA,$AA
        .BYTE $AA,$0A,$CA,$C2,$CC,$C0,$A0,$A3
        .BYTE $AF,$BF,$BC,$B0,$0C,$33,$FF,$C0
        .BYTE $03,$0C,$30,$C3,$30,$0C,$0C,$C3
        .BYTE $0C,$0C,$CC,$C0,$F0,$30,$0C,$0C
        .BYTE $30,$3C,$0C,$0F,$F2,$F2,$32,$B2
        .BYTE $B2,$82,$2A,$2A,$B0,$A3,$A3,$AC
        .BYTE $AC,$AA,$AA,$AA,$C3,$0F,$0C,$CC
        .BYTE $CD,$A6,$AA,$AA,$03,$33,$30,$00
        .BYTE $40,$41,$41,$91,$03,$0B,$EB,$C8
        .BYTE $CA,$0A,$AA,$AA,$94,$98,$99,$94
        .BYTE $98,$99,$96,$96,$AA,$AA,$AA,$AA
        .BYTE $AA,$2A,$2A,$2A,$98,$99,$64,$62
        .BYTE $59,$46,$2A,$69,$2A,$2A,$2A,$2A
        .BYTE $2A,$6A,$6A,$6A,$86,$26,$90,$81
        .BYTE $82,$E8,$88,$0E,$96,$AA,$00,$96
        .BYTE $20,$08,$AB,$EA,$9A,$62,$2A,$88
        .BYTE $E2,$AE,$8A,$22,$88,$2B,$A2,$AA
        .BYTE $AA,$AA,$AA,$AA,$88,$AE,$08,$AA
        .BYTE $AA,$AA,$AA,$AA,$BA,$22,$AA,$AA
        .BYTE $AA,$AA,$AA,$AA,$AA,$AA,$A8,$2A
        .BYTE $A9,$A7,$14,$74,$AA,$AA,$A8,$5A
        .BYTE $F5,$10,$4F,$70,$AA,$AA,$A8,$2A
        .BYTE $AA,$62,$DA,$04,$AA,$A2,$AA,$AA
        .BYTE $8A,$AA,$55,$55,$55,$55,$AA,$A2
        .BYTE $AA,$AA,$2A,$A2,$6A,$4A,$6A,$68
        .BYTE $6A,$6A,$62,$6A,$AA,$8A,$AA,$AA
        .BYTE $AA,$AA,$AA,$22,$AA,$AA,$A8,$2A
        .BYTE $AA,$A2,$AA,$28,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$AA,$AA,$AB,$2A
        .BYTE $AB,$A2,$AF,$2C,$AA,$AA,$AC,$2A
        .BYTE $AB,$E2,$EE,$EC,$AA,$AA,$AA,$28
        .BYTE $EA,$EA,$FA,$2C,$8E,$2E,$AE,$82
        .BYTE $82,$E8,$88,$0E,$AF,$FB,$EF,$EF
        .BYTE $AE,$A2,$AA,$28,$8A,$22,$2A,$88
        .BYTE $E2,$AE,$8A,$22,$88,$2B,$A2,$AA
        .BYTE $AA,$8A,$AA,$AA,$88,$AE,$08,$AA
        .BYTE $AA,$AA,$2A,$AA,$BA,$22,$AA,$AA
        .BYTE $2A,$AA,$AA,$2A,$AA,$A3,$8F,$3C
        .BYTE $B0,$B0,$B0,$B0,$AA,$F1,$04,$37
        .BYTE $34,$3D,$F5,$D3,$5A,$35,$C1,$45
        .BYTE $C1,$11,$35,$44,$AA,$FD,$43,$40
        .BYTE $50,$14,$15,$05,$AA,$4A,$52,$D6
        .BYTE $36,$36,$36,$36,$B0,$B0,$B0,$B0
        .BYTE $B0,$93,$A7,$A5,$DD,$D3,$D0,$F5
        .BYTE $D5,$4C,$70,$10,$55,$14,$51,$0C
        .BYTE $34,$51,$16,$04,$75,$C5,$05,$54
        .BYTE $55,$31,$31,$05,$36,$36,$36,$36
        .BYTE $36,$46,$46,$1A,$AD,$AD,$AD,$2D
        .BYTE $AD,$AD,$AD,$AD,$D7,$F5,$F5,$35
        .BYTE $35,$34,$34,$34,$D0,$40,$55,$D5
        .BYTE $D7,$D7,$D7,$D3,$05,$55,$15,$15
        .BYTE $14,$14,$10,$10,$6A,$6A,$68,$6A
        .BYTE $6A,$6A,$6A,$6A,$AF,$B4,$D7,$71
        .BYTE $7C,$9F,$A7,$29,$77,$15,$00,$FF
        .BYTE $55,$00,$FC,$55,$D0,$50,$15,$00
        .BYTE $FF,$55,$00,$55,$11,$15,$50,$00
        .BYTE $55,$54,$00,$55,$6A,$1A,$16,$51
        .BYTE $41,$05,$16,$52,$01,$06,$18,$6A
        .BYTE $8A,$A2,$A8,$2A,$89,$A4,$10,$40
        .BYTE $00,$00,$00,$00,$66,$59,$6A,$6A
        .BYTE $6A,$6A,$59,$66,$6A,$6A,$6A,$6A
        .BYTE $66,$59,$6A,$6A,$2A,$AA,$A2,$AA
        .BYTE $89,$A9,$A6,$A6,$5A,$5A,$69,$69
        .BYTE $66,$66,$5A,$5A,$69,$69,$66,$66
        .BYTE $5A,$5A,$6A,$6A,$A2,$AA,$62,$6A
        .BYTE $58,$5A,$66,$66,$69,$69,$5A,$5A
        .BYTE $66,$66,$69,$69,$9A,$9A,$A6,$A6
        .BYTE $A9,$A9,$AA,$AA,$6A,$62,$6A,$6A
        .BYTE $4A,$6A,$6A,$62,$6A,$4A,$6A,$68
        .BYTE $6A,$6A,$6A,$48,$AA,$A6,$A6,$65
        .BYTE $56,$66,$66,$66,$56,$66,$65,$66
        .BYTE $56,$66,$6A,$6A,$AA,$9A,$9A,$59
        .BYTE $95,$99,$99,$99,$95,$99,$59,$99
        .BYTE $95,$99,$A9,$A9,$AA,$A8,$A3,$0C
        .BYTE $8F,$3C,$33,$0F,$AA,$00,$30,$CC
        .BYTE $F3,$F3,$3C,$0F,$AA,$00,$3C,$C3
        .BYTE $3F,$FC,$F3,$F3,$AA,$2A,$CA,$32
        .BYTE $32,$0C,$CC,$FC,$33,$3F,$3F,$3C
        .BYTE $FF,$3C,$F3,$F3,$FF,$FF,$33,$CF
        .BYTE $FC,$C3,$FC,$F3,$3F,$3F,$FF,$CF
        .BYTE $F3,$FF,$FF,$F3,$30,$3C,$3F,$FF
        .BYTE $FC,$CF,$FC,$FF,$3E,$B3,$BE,$23
        .BYTE $28,$00,$A8,$28,$F3,$3C,$FC,$32
        .BYTE $AA,$00,$0A,$20,$3F,$F3,$B8,$CC
        .BYTE $AA,$00,$80,$08,$CC,$FE,$CC,$FA
        .BYTE $2A,$22,$A2,$28,$2E,$2E,$2E,$2E
        .BYTE $2E,$2E,$2E,$2E,$6E,$9E,$96,$99
        .BYTE $19,$96,$9A,$9A,$2E,$2E,$2E,$2E
        .BYTE $6E,$9E,$A6,$29,$2E,$2E,$2E,$2E
        .BYTE $2D,$26,$1A,$68,$2D,$26,$16,$66
        .BYTE $66,$96,$A6,$A6,$2D,$25,$15,$55
        .BYTE $55,$55,$55,$55,$2C,$2E,$2E,$2E
        .BYTE $2D,$25,$15,$55,$55,$55,$55,$55
        .BYTE $55,$56,$5E,$6E,$55,$56,$5E,$6E
        .BYTE $2E,$2E,$2E,$2E,$55,$15,$25,$2D
        .BYTE $2E,$2E,$2E,$2E,$55,$55,$55,$55
        .BYTE $55,$15,$25,$2D,$6E,$5E,$56,$55
        .BYTE $55,$55,$55,$55,$2E,$2E,$2E,$2E
        .BYTE $6E,$5E,$56,$55,$15,$05,$01,$00
        .BYTE $01,$06,$19,$65,$71,$4D,$41,$C1
        .BYTE $71,$F3,$9F,$2F,$0C,$30,$00,$C0
        .BYTE $0C,$C3,$FF,$1F,$54,$50,$40,$00
        .BYTE $40,$90,$64,$59,$68,$1A,$26,$2D
        .BYTE $2E,$2E,$2E,$2E,$A2,$28,$8A,$A2
        .BYTE $68,$1A,$26,$2D,$06,$01,$01,$CD
        .BYTE $3E,$DC,$EA,$0A,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$A2,$28,$8A,$A2
        .BYTE $29,$86,$9E,$6E,$89,$A6,$1E,$6E
        .BYTE $2E,$2E,$2E,$2E,$28,$8A,$A2,$28
        .BYTE $8A,$A2,$28,$8A,$A2,$28,$8A,$A2
        .BYTE $28,$8A,$A2,$28,$8A,$A2,$28,$8A
        .BYTE $A2,$28,$8A,$A2,$A2,$8A,$28,$A2
        .BYTE $8A,$28,$A2,$8A,$8A,$28,$A2,$8A
        .BYTE $28,$A2,$8A,$28,$28,$A2,$8A,$28
        .BYTE $A2,$8A,$28,$A2,$AA,$AA,$A8,$2A
        .BYTE $A9,$A6,$92,$68,$A9,$A6,$98,$4A
        .BYTE $A2,$28,$8A,$A2,$6A,$9A,$26,$A1
        .BYTE $8A,$28,$A2,$8A,$AA,$2A,$A8,$AA
        .BYTE $6A,$9A,$86,$29,$AA,$AA,$A8,$2A
        .BYTE $A9,$A6,$9A,$68,$A9,$A6,$9A,$68
        .BYTE $A2,$8A,$28,$A2,$6A,$9A,$A6,$29
        .BYTE $8A,$A2,$28,$8A,$AA,$2A,$A8,$AA
        .BYTE $6A,$9A,$A6,$29,$AA,$8A,$AA,$AA
        .BYTE $A8,$A8,$A0,$20,$A8,$A0,$00,$00
        .BYTE $00,$00,$00,$00,$A9,$A9,$A6,$A6
        .BYTE $9A,$9A,$68,$6A,$69,$61,$96,$96
        .BYTE $96,$96,$69,$69,$6A,$6A,$9A,$9A
        .BYTE $A6,$A6,$A9,$A9,$AA,$2A,$02,$00
        .BYTE $00,$00,$00,$00,$AA,$8A,$AA,$AA
        .BYTE $AA,$2A,$2A,$22,$00,$80,$00,$00
        .BYTE $80,$80,$80,$80,$80,$80,$A0,$A0
        .BYTE $A0,$A8,$AA,$AA,$00,$00,$00,$00
        .BYTE $00,$00,$00,$28,$02,$02,$0A,$0A
        .BYTE $0A,$2A,$AA,$AA,$0A,$0A,$02,$02
        .BYTE $02,$02,$00,$00,$AA,$8A,$AA,$AA
        .BYTE $AA,$2A,$2A,$22,$AA,$2A,$02,$00
        .BYTE $00,$00,$00,$00,$A2,$88,$A2,$A8
        .BYTE $29,$84,$90,$40,$6A,$9A,$A6,$A9
        .BYTE $AA,$8A,$AA,$A2,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$55,$55,$55,$55
        .BYTE $55,$55,$55,$55,$68,$1A,$26,$2D
        .BYTE $6E,$5E,$56,$55,$6A,$69,$96,$9A
        .BYTE $A5,$A6,$A9,$A9,$6A,$6A,$9A,$5A
        .BYTE $A8,$AA,$8E,$AA,$6E,$9E,$A6,$A9
        .BYTE $AA,$AA,$AA,$AA,$2D,$26,$1A,$6A
        .BYTE $AA,$AA,$AA,$AA,$69,$99,$A6,$66
        .BYTE $98,$9A,$6E,$6A,$AA,$A9,$A9,$A6
        .BYTE $A6,$29,$A2,$EA,$00,$00,$00,$00
        .BYTE $01,$04,$10,$40,$01,$04,$10,$40
        .BYTE $00,$00,$00,$00,$40,$10,$04,$01
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $40,$10,$04,$01,$40,$40,$40,$40
        .BYTE $40,$10,$04,$01,$40,$40,$40,$40
        .BYTE $40,$40,$40,$40,$00,$00,$02,$0E
        .BYTE $0E,$2E,$2E,$2E,$EE,$EE,$AF,$A8
        .BYTE $AF,$B7,$B8,$AB,$BA,$EE,$EE,$E6
        .BYTE $FA,$9A,$EA,$2E,$BB,$DC,$EE,$AC
        .BYTE $A3,$B9,$AB,$AB,$77,$FB,$FA,$EA
        .BYTE $2E,$F2,$7A,$EA,$AA,$AA,$A8,$2A
        .BYTE $AF,$BB,$BC,$EF,$AA,$AA,$BB,$EA
        .BYTE $E2,$FA,$FB,$EB,$AA,$AA,$A8,$EE
        .BYTE $FE,$FF,$FE,$FF,$AA,$AA,$A8,$2A
        .BYTE $EA,$EA,$AE,$AC,$AA,$AA,$A8,$2A
        .BYTE $AB,$AF,$AF,$AF,$F3,$FF,$EF,$AB
        .BYTE $AA,$FE,$FF,$FF,$FB,$FF,$FF,$FF
        .BYTE $FF,$FF,$BE,$F3,$FE,$FF,$FF,$EF
        .BYTE $AC,$BF,$FF,$FF,$BE,$FA,$F8,$2A
        .BYTE $EA,$EA,$FA,$F8,$AB,$B8,$BA,$3F
        .BYTE $BF,$BF,$BF,$AC,$FF,$FF,$BF,$8F
        .BYTE $FF,$CB,$2B,$AF,$CF,$EB,$BE,$8E
        .BYTE $FB,$FF,$FE,$FB,$FF,$FE,$FE,$FF
        .BYTE $FA,$EF,$AF,$BB,$FA,$EA,$BE,$FE
        .BYTE $FE,$BE,$EA,$EA,$FF,$FF,$BB,$3F
        .BYTE $EB,$E2,$FB,$BE,$6B,$EF,$6F,$F3
        .BYTE $EF,$E3,$FE,$FE,$BA,$AB,$BB,$EB
        .BYTE $FF,$FF,$FB,$FE,$FA,$FE,$DF,$C4
        .BYTE $BA,$44,$56,$18,$EA,$6A,$9A,$3E
        .BYTE $E7,$B2,$96,$A9,$AA,$AA,$A8,$B2
        .BYTE $AC,$AC,$AB,$AB,$AA,$AA,$A8,$2A
        .BYTE $AA,$A3,$2B,$2C,$AA,$AA,$A8,$2A
        .BYTE $CA,$22,$2A,$A8,$AC,$AB,$A8,$2A
        .BYTE $AA,$A2,$AA,$28,$AB,$2B,$CB,$CB
        .BYTE $CB,$B2,$B2,$B0,$2C,$2C,$30,$30
        .BYTE $30,$F3,$F3,$B3,$AC,$B2,$C8,$CA
        .BYTE $CA,$22,$2A,$28,$B2,$B2,$AC,$2C
        .BYTE $AC,$AC,$AC,$AC,$C3,$C3,$CC,$CC
        .BYTE $CC,$CC,$CC,$CC,$AA,$AA,$A8,$2B
        .BYTE $AB,$A2,$AA,$28,$AC,$AC,$EC,$38
        .BYTE $AC,$AC,$AA,$28,$CE,$CE,$C0,$C3
        .BYTE $CE,$CE,$EA,$A8,$AA,$AA,$E8,$3A
        .BYTE $BA,$A2,$AA,$28,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$2E,$2E,$2E,$2E
        .BYTE $8E,$A2,$A8,$2A,$A9,$A4,$92,$4A
        .BYTE $28,$AA,$A2,$AA,$28,$8A,$A2,$28
        .BYTE $89,$A4,$92,$4A,$6A,$9A,$A6,$29
        .BYTE $6A,$1A,$C6,$06,$A9,$A6,$98,$62
        .BYTE $68,$9A,$A6,$A9,$5A,$5A,$66,$66
        .BYTE $69,$69,$6A,$6A,$AA,$AA,$AA,$AA
        .BYTE $55,$88,$88,$88,$68,$58,$5A,$66
        .BYTE $65,$69,$67,$5F,$AA,$29,$89,$26
        .BYTE $16,$5A,$F6,$FD,$88,$88,$88,$88
        .BYTE $88,$55,$FF,$FF,$FD,$FF,$7F,$1D
        .BYTE $05,$07,$1F,$7F,$5F,$7F,$7F,$5D
        .BYTE $54,$74,$7D,$7F,$6A,$6A,$A8,$2A
        .BYTE $A8,$8A,$A2,$AA
f7ED8   .BYTE $02,$00,$00,$00,$00,$00,$00,$00
        .BYTE $7F,$5F,$5F,$67,$67,$69,$6A,$6A
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$55,$6A
        .BYTE $FF,$FD,$FD,$F6,$F6,$DA,$6A,$6A
        .BYTE $AA,$AA,$A8,$2A,$AA,$A2,$AA,$A8
        .BYTE $55,$40,$51,$44,$40,$44,$51,$77
        .BYTE $10,$10,$1C,$14,$17,$11,$11,$11
        .BYTE $66,$59,$6A,$6A,$6A,$6A,$59,$66
        .BYTE $45,$51,$51,$44,$44,$50,$52,$4A
        .BYTE $CD,$C7,$DD,$74,$D2,$48,$21,$86
        .BYTE $4C,$9C,$64,$19,$C6,$31,$4C,$13
        .BYTE $CC,$CC,$CC,$CC,$CD,$C7,$DD,$74
        .BYTE $CC,$CC,$CC,$CC,$4C,$9C,$64,$19
        .BYTE $1C,$1C,$1C,$1C,$1C,$1C,$1C,$1C
        .BYTE $E4,$E4,$E4,$E4,$E4,$E4,$E4,$E4
        .BYTE $55,$00,$00,$FF,$55,$00,$00,$55
        .BYTE $D2,$48,$21,$84,$1C,$4C,$AA,$55
        .BYTE $1C,$4C,$CC,$CC,$CC,$CC,$AA,$55
        .BYTE $C4,$CD,$CC,$CC,$CC,$CC,$AA,$55
        .BYTE $C6,$31,$4C,$D3,$C4,$CD,$AA,$55
        .BYTE $41,$41,$41,$41,$41,$41,$41,$41
        .BYTE $CC,$CC,$CC,$CC,$CC,$CC,$CC,$CC
        .BYTE $AA,$8A,$AA,$AA,$29,$A4,$9C,$4C
        .BYTE $89,$A4,$9C,$4C,$CC,$CC,$CC,$CC
        .BYTE $6A,$DA,$C6,$CD,$CC,$CC,$CC,$CC
        .BYTE $A8,$AA,$8A,$AA,$68,$DA,$C6,$CD
        .BYTE $4A,$4A,$4A,$4A,$4A,$4A,$4A,$4A
        .BYTE $A1,$A1,$A1,$A1,$A1,$A1,$A1,$A1
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$20,$A2,$AA,$A8
        .BYTE $00,$00,$28,$02,$AA,$AA,$AA,$A8
        .BYTE $A2,$AA,$AA,$AA,$88,$A0,$00,$00
        .BYTE $AA,$AA,$88,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$01,$06,$18,$4A
        .BYTE $FF,$FF,$55,$00,$00,$00,$00,$55
        .BYTE $AA,$AA,$A8,$2A,$AA,$A2,$AA,$28
f7FF8   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
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
s8100   TAY 
        LDA f836E,Y
        STA a810E
        LDA f838D,Y
        STA a810F
a810E   =*+$01
a810F   =*+$02
        JMP j8553

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
f836E   .BYTE $53,$74,$66,$B3,$B8,$B0,$AA,$AD
        .BYTE $18,$A1,$A4,$A7,$9B,$BF,$C2,$C5
        .BYTE $C8,$CB,$D1,$DF,$EC,$0D,$F8,$D4
        .BYTE $AC,$34,$0D,$BE,$BB,$9E,$CE
f838D   .BYTE $85,$84,$84,$84,$84,$84,$84,$84
        .BYTE $84,$84,$84,$84,$84,$83,$83,$83
        .BYTE $83,$83,$83,$83,$83,$84,$83,$83
        .BYTE $83,$85,$85,$84,$84,$84,$83
        LDX a9291
        LDA f90B9,X
        STA a9299
        TAX 
        LDA f90B9,X
        STA a929A
        LDY #$11     ;#%00010001
        BIT a02A0
        BIT a06A0
        BIT a0BA0
        BIT a0FA0
        BIT a0DA0
        BIT a17A0
        BIT a07A0
        BIT a03A0
b83D6   STY a85EB
        LDY #$00     ;#%00000000
        STY a85EC
        RTS 

        LDX a9291
        LDA f90B9,X
        STA a9291
        LDY #$08     ;#%00001000
        BNE b83D6
        LDX #$01     ;#%00000001
        LDA a845B
        BNE b845A
        STX a845B
        BEQ b8402
        LDX #$01     ;#%00000001
        LDA a845C
        BNE b845A
        STX a845C
b8402   LDX #<p8423  ;#%00100011
        LDY #>p8423  ;#%10000100
        STX a859E
        STY a859F
        RTS 

        LDA #$00     ;#%00000000
        STA a845B
        ORA a845C
        BEQ b845D
        RTS 

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
        LDX #$42     ;#%01000010
        LDY #$A2     ;#%10100010
        LDA #$00     ;#%00000000
        JSR s861F
b8442   LDA a845C
        BEQ b845A
        DEC a845C
        BNE b845A
        LDA #$2D     ;#%00101101
        STA a845C
        LDX #$23     ;#%00100011
        LDY #$A2     ;#%10100010
        LDA #$01     ;#%00000001
        JMP s861F

b845A   RTS 

a845B   .BYTE $00
a845C   .BYTE $00
b845D   LDA #$00     ;#%00000000
        STA a859F
        STA a859E
        RTS 

        LDA a29
        AND #$07     ;#%00000111
        ORA a8231
        ORA a8258
        ORA a827F
        RTS 

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

        LDY #$35     ;#%00110101
        BIT j11A0
        BIT a23A0
        BIT a29A0
        BIT a2FA0
        BIT a17A0
        BIT a1DA0
        BIT a0BA0
        BIT a05A0
        JMP j84DD

        LDY #$3B     ;#%00111011
        BIT a47A0
        BIT a41A0
        LDX #$D4     ;#%11010100
b84C2   LDA f8134,X
        STA a828A,X
        DEX 
        BNE b84C2
        LDX #$0F     ;#%00001111
b84CD   LDA f20,X
        STA f835E,X
        DEX 
        BPL b84CD
        ASL a29
        SEC 
        ROR a29
        LDA #$BF     ;#%10111111
j84DD   =*+$01
        BIT a3FA9
        STA a29
        LDX #$05     ;#%00000101
b84E3   LDA f91E3,Y
        STA f20,X
        DEY 
        DEX 
        BPL b84E3
        LDX #$02     ;#%00000010
b84EE   LDA #$01     ;#%00000001
        STA f2A,X
        LDA #$07     ;#%00000111
        STA f2D,X
        LDA #$00     ;#%00000000
        STA f8204,X
        LDY f90C2,X
        STA f8142,Y
        STA f8146,Y
        LDA #$08     ;#%00001000
        STA f814C,Y
        DEX 
        BPL b84EE
        RTS 

        STX a828A
        RTS 

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
        BPL b8534
b852D   BCC b8537
        CPX #$0F     ;#%00001111
        BEQ b8537
        INX 
b8534   STX a820E
b8537   LDA a820E
        ORA a820B
        STA $D418    ;Select Filter Mode and Volume
        LDA a820A
        STA $D417    ;Filter Resonance Control / Voice Input Control
        LDA a8209
        STA $D416    ;Filter Cutoff Frequency: High-Byte
        LDA a8208
        STA $D415    ;Filter Cutoff Frequency: Low-Nybble
        RTS 

j8553   JSR s8597
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

s8597   LDA a859F
        BNE b859D
        RTS 

a859E   =*+$01
a859F   =*+$02
b859D   JMP ~e00FF

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
b85ED   LDX f9259,Y
        LDA f9289,Y
        STA a28
        LDA f9271,Y
        TAY 
        LDA a28
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

s861F   STX a26
        STY a27
        STA a28
        TAX 
        LDA f90C8,X
        AND a29
        STA a29
        LDA f90BF,X
        STA a863A
        LDX #$04     ;#%00000100
        LDY #$1A     ;#%00011010
b8637   LDA (p26),Y
a863A   =*+$01
        STA $D409,X  ;Voice 2: Pulse Waveform Width - Low-Byte
        DEY 
        DEX 
        BPL b8637
        LDY #$1D     ;#%00011101
        LDX a863A
        LDA (p26),Y
        STA fD3FE,X
        INY 
        LDA (p26),Y
        STA fD3FF,X
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

s870C   LDA a29
        LSR 
        BCC b8715
        DEC a2A
        BEQ b8723
b8715   JMP j88DE

j8718   LDA #$03     ;#%00000011
j871A   CLC 
        ADC a20
        STA a20
        BCC b8723
        INC a21
b8723   LDY #$00     ;#%00000000
        LDA (p20),Y
        CMP #$C0     ;#%11000000
        BCC b8748
        AND #$3F     ;#%00111111
        TAX 
        LDA f9189,X
        STA a8746
        LDA f918A,X
        STA a8747
        INY 
        LDA (p20),Y
        TAX 
        STA a26
        INY 
        LDA (p20),Y
        STA a27
a8746   =*+$01
a8747   =*+$02
        JMP j88D1

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
        LSR 
        BCS b8765
b8762   JMP j87F3

b8765   LDA a29
        AND #$08     ;#%00001000
        BEQ b8762
        LDY #$04     ;#%00000100
b876D   LDA #$00     ;#%00000000
        STA $D402,Y  ;Voice 1: Pulse Waveform Width - Low-Byte
        LDA f814B,Y
        CPY #$02     ;#%00000010
        BNE b877B
        AND #$F7     ;#%11110111
b877B   STA $D402,Y  ;Voice 1: Pulse Waveform Width - Low-Byte
        DEY 
        BPL b876D
        LDA a814D
        STA a822F
        LDY f90CB,X
        LDA f912A,X
        STA a822D
        STY a822E
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        STY $D401    ;Voice 1: Frequency Control - High-Byte
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

        INC a2D
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

        LDX a2D
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

        LDX a2D
        DEC f8173,X
        BEQ b8850
        INX 
        TXA 
        TAY 
        BPL b8819
b8850   INC a2D
        LDA #$01     ;#%00000001
        JMP j871A

        LDY #$04     ;#%00000100
        LDX #$1C     ;#%00011100
b885B   LDA (p26),Y
        STA f8135,X
        DEX 
        DEY 
        BPL b885B
        JMP j8718

        LDY #$0D     ;#%00001101
        BIT a09A0
b886C   LDA (p26),Y
        STA f8135,Y
        DEY 
        BPL b886C
        JMP j8718

        INY 
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

        INY 
        LDA (p20),Y
        STA f8204
j8898   LDA a27
j889A   STX a20
        STA a21
        JMP b8723

        LDA #$87     ;#%10000111
        PHA 
        LDA #$17     ;#%00010111
        PHA 
        JMP (p0026)

        LDA #$03     ;#%00000011
b88AC   LDY a2D
        CLC 
        ADC a20
        STA f8162,Y
        LDA #$00     ;#%00000000
        ADC a21
        STA f816A,Y
        DEC a2D
        JMP j8898

        INY 
        LDA (p20),Y
        STA f8204
        LDA #$04     ;#%00000100
        BNE b88AC
        STX f8204
        TYA 
        JMP j871A

j88D1   STA f8135,X
        JMP j8718

        STA f8215,X
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
b890C   STA $D400,X  ;Voice 1: Frequency Control - Low-Byte
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
        LDX f912A,Y
        LDA f90CB,Y
        STX $D400    ;Voice 1: Frequency Control - Low-Byte
        STA $D401    ;Voice 1: Frequency Control - High-Byte
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
        STX $D400    ;Voice 1: Frequency Control - Low-Byte
        STY $D401    ;Voice 1: Frequency Control - High-Byte
        RTS 

b8A31   LDA a8222
        AND #$81     ;#%10000001
        BEQ b8A24
        BPL b8A40
        JSR j8110
        JMP j89D5

b8A40   JSR s811C
        JMP j89D5

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
        LDA f91A7,X
        STA a8A81
        LDA f91A8,X
        STA a8A82
        INY 
        LDA (p22),Y
        TAX 
        STA a26
        INY 
        LDA (p22),Y
        STA a27
a8A81   =*+$01
a8A82   =*+$02
        JMP j8C0D

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
        STA $D409,Y  ;Voice 2: Pulse Waveform Width - Low-Byte
        LDA f8190,Y
        CPY #$02     ;#%00000010
        BNE b8AB7
        AND #$F7     ;#%11110111
b8AB7   STA $D409,Y  ;Voice 2: Pulse Waveform Width - Low-Byte
        DEY 
        BPL b8AA9
        LDA a8192
        STA a8256
        LDY f90CB,X
        LDA f912A,X
        STA a8254
        STY a8255
        STA $D407    ;Voice 2: Frequency Control - Low-Byte
        STY $D408    ;Voice 2: Frequency Control - High-Byte
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

        INC a2E
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

        LDX a2E
        CLC 
        TYA 
        ADC a22
        STA f81A7,X
        LDA a23
        ADC #$00     ;#%00000000
        STA f81AF,X
        LDA a26
        STA f81B7,X
        DEC a2E
        TYA 
        JMP j8A55

        LDX a2E
        DEC f81B8,X
        BEQ b8B8C
        INX 
        TXA 
        TAY 
        BPL b8B55
b8B8C   INC a2E
        LDA #$01     ;#%00000001
        JMP j8A55

        LDY #$04     ;#%00000100
        LDX #$1C     ;#%00011100
b8B97   LDA (p26),Y
        STA f817A,X
        DEX 
        DEY 
        BPL b8B97
        JMP j8A53

        LDY #$0D     ;#%00001101
        BIT a09A0
b8BA8   LDA (p26),Y
        STA f817A,Y
        DEY 
        BPL b8BA8
        JMP j8A53

        INY 
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

        INY 
        LDA (p22),Y
        STA a8205
j8BD4   LDA a27
j8BD6   STX a22
        STA a23
        JMP b8A5E

        LDA #$8A     ;#%10001010
        PHA 
        LDA #$52     ;#%01010010
        PHA 
        JMP (p0026)

        LDA #$03     ;#%00000011
b8BE8   LDY a2E
        CLC 
        ADC a22
        STA f81A7,Y
        LDA a23
        ADC #$00     ;#%00000000
        STA f81AF,Y
        DEC a2E
        JMP j8BD4

        INY 
        LDA (p22),Y
        STA a8205
        LDA #$04     ;#%00000100
        BNE b8BE8
        STX a8205
        TYA 
        JMP j8A55

j8C0D   STA f817A,X
        JMP j8A53

        STA f823C,X
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
b8C48   STA $D407,X  ;Voice 2: Frequency Control - Low-Byte
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
b8C5F   STA $D40B    ;Voice 2: Control Register
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
        STX $D409    ;Voice 2: Pulse Waveform Width - Low-Byte
        STY $D40A    ;Voice 2: Pulse Waveform Width - High-Nybble
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
        LDX f912A,Y
        LDA f90CB,Y
        STX $D407    ;Voice 2: Frequency Control - Low-Byte
        STA $D408    ;Voice 2: Frequency Control - High-Byte
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
        STX $D407    ;Voice 2: Frequency Control - Low-Byte
        STY $D408    ;Voice 2: Frequency Control - High-Byte
        RTS 

b8D6D   LDA a8249
        AND #$81     ;#%10000001
        BEQ b8D60
        BPL b8D7C
        JSR s86AD
        JMP j8D11

b8D7C   JSR s86B9
        JMP j8D11

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
        LDA f91C5,X
        STA a8DBD
        LDA f91C6,X
        STA a8DBE
        INY 
        LDA (p24),Y
        TAX 
        STA a26
        INY 
        LDA (p24),Y
        STA a27
a8DBD   =*+$01
a8DBE   =*+$02
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
        LDY f90CB,X
        LDA f912A,X
        STA a827B
        STY a827C
        STA $D40E    ;Voice 3: Frequency Control - Low-Byte
        STY $D40F    ;Voice 3: Frequency Control - High-Byte
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

        INC a2F
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

        LDX a2F
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

        LDX a2F
        DEC f81FD,X
        BEQ b8EC3
        INX 
        TXA 
        TAY 
        BPL b8E8C
b8EC3   INC a2F
        LDA #$01     ;#%00000001
        JMP j8D91

        LDY #$04     ;#%00000100
        LDX #$1C     ;#%00011100
b8ECE   LDA (p26),Y
        STA f81BF,X
        DEX 
        DEY 
        BPL b8ECE
        JMP j8D8F

        LDY #$0D     ;#%00001101
        BIT a09A0
b8EDF   LDA (p26),Y
        STA f81BF,Y
        DEY 
        BPL b8EDF
        JMP j8D8F

        INY 
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

        INY 
        LDA (p24),Y
        STA a8206
j8F0B   LDA a27
j8F0D   STX a24
        STA a25
        JMP b8D9A

        LDA #$8D     ;#%10001101
        PHA 
        LDA #$8E     ;#%10001110
        PHA 
        JMP (p0026)

        LDA #$03     ;#%00000011
b8F1F   LDY a2F
        CLC 
        ADC a24
        STA f81EC,Y
        LDA a25
        ADC #$00     ;#%00000000
        STA f81F4,Y
        DEC a2F
        JMP j8F0B

        INY 
        LDA (p24),Y
        STA a8206
        LDA #$04     ;#%00000100
        BNE b8F1F
        STX a8206
        TYA 
        JMP j8D91

j8F44   STA f81BF,X
        JMP j8D8F

        STA f8263,X
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
        LDX #$06     ;#%00000110
b8F7F   STA $D40E,X  ;Voice 3: Frequency Control - Low-Byte
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
        LDX f912A,Y
        LDA f90CB,Y
        STX $D40E    ;Voice 3: Frequency Control - Low-Byte
        STA $D40F    ;Voice 3: Frequency Control - High-Byte
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
        STX $D40E    ;Voice 3: Frequency Control - Low-Byte
        STY $D40F    ;Voice 3: Frequency Control - High-Byte
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
f90CB   .BYTE $01,$01,$01,$01,$01,$01,$01,$01
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
f912A   .BYTE $12,$23,$34,$46,$5A,$6E,$84,$9B
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
f9189   .BYTE $11
f918A   .BYTE $88,$77,$88,$67,$88,$9A,$88,$AA
        .BYTE $88,$CA,$88,$C0,$88,$D1,$88,$92
        .BYTE $88,$A1,$88,$D7,$88,$6A,$88,$29
        .BYTE $88,$44,$88,$57,$88
f91A7   .BYTE $4D
f91A8   .BYTE $8B,$B3,$8B,$A3,$8B,$D6,$8B,$E6
        .BYTE $8B,$06,$8C,$FC,$8B,$0D,$8C,$CE
        .BYTE $8B,$DD,$8B,$13,$8C,$A6,$8B,$65
        .BYTE $8B,$80,$8B,$93,$8B
f91C5   .BYTE $84
f91C6   .BYTE $8E,$EA,$8E,$DA,$8E,$0D,$8F,$1D
        .BYTE $8F,$3D,$8F,$33,$8F,$44,$8F,$05
        .BYTE $8F,$14,$8F,$4A,$8F,$DD,$8E,$9C
        .BYTE $8E,$B7,$8E,$CA,$8E
f91E3   .BYTE $4A,$95,$F9,$96,$C3,$97,$09,$A7
        .BYTE $0C,$A7,$0F,$A7,$45,$9C,$FB,$9F
        .BYTE $FB,$9F,$0B,$99,$19,$99,$6B,$99
        .BYTE $A0,$99,$A4,$99,$C2,$99,$04,$9A
        .BYTE $16,$9A,$2A,$9A,$93,$9F,$01,$A0
        .BYTE $9D,$A0,$5C,$9B,$A5,$9B,$EE,$9B
        .BYTE $00,$A7,$03,$A7,$06,$A7,$BF,$98
        .BYTE $C3,$98,$D7,$98,$82,$9A,$BB,$9A
        .BYTE $F6,$9A,$EE,$A0,$18,$A1,$3F,$A1
        .BYTE $4D,$55,$53,$49,$43,$20,$42,$59
        .BYTE $20,$4D,$41,$52,$54,$49,$4E,$20
        .BYTE $47,$41,$4C,$57,$41,$59
f9241   .BYTE $80,$05,$01,$80,$80,$01,$02,$80
        .BYTE $80,$80,$01,$01,$80,$00,$80,$00
        .BYTE $80,$00,$80,$01,$00,$80,$01,$01
f9259   .BYTE $88,$A7,$69,$61,$FC,$DD,$BE,$1B
        .BYTE $80,$3A,$59,$78,$97,$B6,$D5,$F4
        .BYTE $13,$32,$2F,$2F,$2F,$C6,$E5,$04
f9271   .BYTE $A1,$A1,$A1,$A2,$A2,$A2,$A2,$A3
        .BYTE $A2,$A3,$A3,$A3,$A3,$A3,$A3,$A3
        .BYTE $A4,$A4,$9E,$9E,$9E,$A1,$A1,$A2
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
        .BYTE $C8,$EF,$93,$5F,$0A,$BF,$32,$BF
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
        .BYTE $BF,$00,$BF,$F6,$C6,$4A,$95,$BF
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
        LDX #$D2     ;#%11010010
        LDY #$9D     ;#%10011101
        LDA #$00     ;#%00000000
        JSR s861F
        LDX #$10     ;#%00010000
        LDY #$9E     ;#%10011110
        LDA #$02     ;#%00000010
        JSR s861F
        LDX #$F1     ;#%11110001
        LDY #$9D     ;#%10011101
b9C14   LDA #$01     ;#%00000001
        JMP s861F

        LDX #$B3     ;#%10110011
        LDY #$9D     ;#%10011101
        LDA #$02     ;#%00000010
        JSR s861F
        LDX #$75     ;#%01110101
        LDY #$9D     ;#%10011101
        LDA #$00     ;#%00000000
        JSR s861F
        LDX #$94     ;#%10010100
        LDY #$9D     ;#%10011101
        BNE b9C14
        LDA #$10     ;#%00010000
        BIT a0BA9
        BIT a09A9
        STA a9E4D
        LDY #$14     ;#%00010100
        JMP b83D6

        .BYTE $06,$0C,$12,$18,$C2,$20,$03,$41
        .BYTE $9C,$C8,$4E,$9E,$D2,$FE,$9B,$5F
        .BYTE $04,$D2,$19,$9C,$5F,$02,$D2,$FE
        .BYTE $9B,$5F,$02,$D2,$FE,$9B,$5F,$02
        .BYTE $D2,$FE,$9B,$5F,$01,$D2,$FE,$9B
        .BYTE $5F,$01,$D2,$19,$9C,$5F,$02,$D2
        .BYTE $19,$9C,$5F,$02,$D2,$FE,$9B,$5F
        .BYTE $02,$D2,$FE,$9B,$5F,$02,$D2,$19
        .BYTE $9C,$5F,$04,$D2,$FE,$9B,$5F,$02
        .BYTE $D2,$FE,$9B,$5F,$02,$D2,$19,$9C
        .BYTE $5F,$04,$C8,$67,$9E,$C8,$25,$9F
        .BYTE $C8,$86,$9E,$C8,$B4,$9E,$C8,$4E
        .BYTE $9E,$C8,$86,$9E,$C8,$25,$9F,$C8
        .BYTE $B4,$9E,$C8,$4E,$9E,$C8,$86,$9E
        .BYTE $C8,$CE,$9E,$C8,$25,$9F,$C8,$FC
        .BYTE $9E,$C8,$B4,$9E,$C8,$FC,$9E,$C8
        .BYTE $CE,$9E,$C8,$25,$9F,$C8,$B4,$9E
        .BYTE $D2,$FE,$9B,$5F,$04,$D2,$19,$9C
        .BYTE $5F,$02,$D2,$FE,$9B,$5F,$01,$D2
        .BYTE $FE,$9B,$5F,$01,$D2,$FE,$9B,$5F
        .BYTE $04,$D2,$19,$9C,$5F,$04,$C8,$25
        .BYTE $9F,$C8,$FC,$9E,$C8,$FC,$9E,$D2
        .BYTE $FE,$9B,$5F,$04,$D2,$19,$9C,$5F
        .BYTE $04,$D2,$FE,$9B,$5F,$01,$D2,$FE
        .BYTE $9B,$5F,$01,$D2,$FE,$9B,$5F,$01
        .BYTE $D2,$FE,$9B,$5F,$01,$D2,$19,$9C
        .BYTE $5F,$04,$D2,$FE,$9B,$5F,$04,$D2
        .BYTE $19,$9C,$5F,$02,$D2,$19,$9C,$5F
        .BYTE $02,$D2,$FE,$9B,$5F,$02,$D2,$FE
        .BYTE $9B,$5F,$02,$D2,$19,$9C,$5F,$04
        .BYTE $D2,$FE,$9B,$5F,$04,$D2,$19,$9C
        .BYTE $5F,$02,$D2,$19,$9C,$5F,$02,$D2
        .BYTE $FE,$9B,$5F,$01,$D2,$FE,$9B,$5F
        .BYTE $01,$D2,$FE,$9B,$5F,$02,$D2,$19
        .BYTE $9C,$5F,$04,$D2,$FE,$9B,$5F,$04
        .BYTE $D2,$FE,$9B,$5F,$04,$D2,$FE,$9B
        .BYTE $5F,$02,$D2,$FE,$9B,$5F,$02,$D2
        .BYTE $19,$9C,$5F,$02,$D2,$19,$9C,$5F
        .BYTE $02,$C6,$4A,$9C,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$81,$00,$C8,$03
        .BYTE $08,$10,$27,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$11,$03,$D4,$03,$08
        .BYTE $88,$13,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$11,$03,$D3,$03,$08,$E8
        .BYTE $03,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$11,$11,$54,$02,$05,$D0,$07
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $11,$11,$44,$03,$03,$DC,$05,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$11
        .BYTE $11,$84,$03,$03,$60,$09,$DA,$FD
        .BYTE $F4,$01,$00,$00,$00,$00,$01,$01
        .BYTE $00,$00,$02,$05,$FF,$00,$01,$04
        .BYTE $32,$00,$00,$00,$00,$08,$41,$00
        .BYTE $38,$03,$32,$B8
a9E4D   .BYTE $0B,$D2,$FE,$9B,$5F,$04,$D2,$19
        .BYTE $9C,$5F,$04,$D2,$FE,$9B,$5F,$02
        .BYTE $D2,$FE,$9B,$5F,$02,$D2,$19,$9C
        .BYTE $5F,$04,$D2,$FE,$9B,$5F,$04,$D2
        .BYTE $19,$9C,$5F,$03,$D2,$FE,$9B,$5F
        .BYTE $01,$D2,$FE,$9B,$5F,$02,$D2,$FE
        .BYTE $9B,$5F,$02,$D2,$19,$9C,$5F,$04
        .BYTE $C0,$D2,$FE,$9B,$5F,$02,$D2,$31
        .BYTE $9C,$5F,$01,$D2,$31,$9C,$5F,$01
        .BYTE $D2,$19,$9C,$5F,$02,$D2,$FE,$9B
        .BYTE $5F,$02,$D2,$FE,$9B,$5F,$02,$D2
        .BYTE $FE,$9B,$5F,$01,$D2,$FE,$9B,$5F
        .BYTE $01,$D2,$19,$9C,$5F,$04,$C0,$D2
        .BYTE $FE,$9B,$5F,$04,$D2,$19,$9C,$5F
        .BYTE $02,$D2,$FE,$9B,$5F,$03,$D2,$FE
        .BYTE $9B,$5F,$03,$D2,$19,$9C,$5F,$04
        .BYTE $C0,$D2,$FE,$9B,$5F,$02,$D2,$FE
        .BYTE $9B,$5F,$02,$D2,$19,$9C,$5F,$03
        .BYTE $D2,$FE,$9B,$5F,$01,$D2,$FE,$9B
        .BYTE $5F,$01,$D2,$19,$9C,$5F,$01,$D2
        .BYTE $FE,$9B,$5F,$02,$D2,$19,$9C,$5F
        .BYTE $02,$D2,$19,$9C,$5F,$02,$C0,$D2
        .BYTE $FE,$9B,$5F,$04,$D2,$19,$9C,$5F
        .BYTE $02,$D2,$FE,$9B,$5F,$02,$D2,$FE
        .BYTE $9B,$5F,$02,$D2,$FE,$9B,$5F,$02
        .BYTE $D2,$19,$9C,$5F,$02,$D2,$34,$9C
        .BYTE $5F,$01,$D2,$34,$9C,$5F,$01,$C0
        .BYTE $D2,$FE,$9B,$5F,$02,$D2,$FE,$9B
        .BYTE $5F,$02,$D2,$19,$9C,$5F,$01,$D2
        .BYTE $FE,$9B,$5F,$03,$D2,$FE,$9B,$5F
        .BYTE $02,$D2,$31,$9C,$5F,$02,$D2,$34
        .BYTE $9C,$5F,$01,$D2,$34,$9C,$5F,$01
        .BYTE $D2,$37,$9C,$5F,$01,$D2,$37,$9C
        .BYTE $5F,$01,$C0,$06,$0C,$12,$18,$1E
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
        .BYTE $08,$7A,$10,$C0,$8C,$FF,$00,$00
        .BYTE $00,$00,$00,$00,$FF,$00,$00,$00
        .BYTE $00,$04,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$81,$00,$C8,$14
        .BYTE $0F,$00,$10,$F8,$FF,$00,$00,$00
        .BYTE $00,$00,$00,$FF,$00,$00,$00,$00
        .BYTE $04,$FF,$00,$00,$04,$14,$00,$00
        .BYTE $00,$00,$08,$43,$00,$C6,$14,$0C
        .BYTE $00,$03,$D8,$FF,$00,$00,$00,$00
        .BYTE $00,$00,$FF,$00,$00,$00,$00,$04
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$01,$11,$D9,$0A,$11,$00
        .BYTE $10,$00,$04,$07,$0C,$00,$04,$07
        .BYTE $0C,$00,$00,$43,$07,$00,$0D,$FF
        .BYTE $00,$01,$04,$32,$00,$00,$00,$00
        .BYTE $08,$43,$00,$C8,$14,$0A,$61,$33
        .BYTE $00,$04,$07,$0C,$00,$04,$07,$0C
        .BYTE $00,$04,$37,$09,$00,$0D,$FF,$00
        .BYTE $00,$04,$14,$00,$00,$00,$00,$08
        .BYTE $41,$00,$C6,$14,$0C,$B1,$19,$00
        .BYTE $04,$07,$00,$04,$07,$00,$04,$07
        .BYTE $00,$37,$09,$00,$0D,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$01
        .BYTE $11,$D9,$0A,$11,$B1,$19,$48,$F4
        .BYTE $CB,$FA,$00,$00,$10,$27,$02,$03
        .BYTE $03,$01,$00,$05,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$81,$AA
        .BYTE $FB,$33,$64,$11,$27,$18,$FC,$00
        .BYTE $00,$88,$13,$00,$00,$05,$02,$01
        .BYTE $00,$00,$05,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$81,$AA,$AB
        .BYTE $33,$64,$11,$27,$D4,$FE,$E0,$FC
        .BYTE $00,$00,$00,$00,$03,$02,$00,$00
        .BYTE $00,$85,$FF,$00,$00,$04,$1E,$00
        .BYTE $00,$00,$00,$08,$41,$23,$73,$0F
        .BYTE $04,$AD,$0D,$70,$FE,$D4,$FE,$38
        .BYTE $FF,$9C,$FF,$18,$18,$18,$18,$00
        .BYTE $04,$FF,$00,$00,$05,$19,$00,$00
        .BYTE $00,$00,$08,$41,$AA,$8B,$0F,$50
        .BYTE $50,$C3,$CE,$FF,$00,$00,$00,$00
        .BYTE $00,$00,$FF,$00,$00,$00,$00,$04
        .BYTE $FF,$00,$00,$04,$1E,$00,$00,$00
        .BYTE $00,$08,$41,$A3,$A8,$0E,$0E,$B4
        .BYTE $46,$CE,$FF,$00,$00,$00,$00,$00
        .BYTE $00,$0A,$00,$00,$00,$00,$85,$FF
        .BYTE $00,$00,$04,$1E,$00,$00,$00,$00
        .BYTE $08,$41,$13,$A8,$0F,$0F,$E8,$03
        .BYTE $CE,$FF,$00,$00,$00,$00,$00,$00
        .BYTE $0A,$00,$00,$00,$00,$85,$FF,$00
        .BYTE $00,$04,$1E,$00,$00,$00,$00,$08
        .BYTE $41,$13,$A8,$0F,$0F,$4C,$04,$9C
        .BYTE $FF,$00,$00,$00,$00,$00,$00,$FF
        .BYTE $00,$00,$00,$00,$04,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$15
        .BYTE $13,$F8,$0F,$0F,$70,$17,$70,$FE
        .BYTE $78,$00,$00,$00,$00,$00,$04,$04
        .BYTE $00,$00,$00,$05,$FF,$00,$00,$04
        .BYTE $32,$00,$00,$00,$00,$00,$41,$83
        .BYTE $80,$14,$02,$A0,$0F,$E7,$FF,$00
        .BYTE $00,$00,$00,$00,$00,$FF,$00,$00
        .BYTE $00,$00,$04,$08,$FF,$00,$04,$00
        .BYTE $01,$64,$00,$01,$00,$41,$11,$89
        .BYTE $0A,$14,$C4,$09,$CE,$FF,$00,$00
        .BYTE $00,$00,$00,$00,$FF,$00,$00,$00
        .BYTE $00,$04,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$15,$33,$F9,$08
        .BYTE $14,$D0,$07,$92,$FF,$00,$00,$00
        .BYTE $00,$00,$00,$FF,$00,$00,$00,$00
        .BYTE $04,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$43,$33,$A9,$07,$14
        .BYTE $B8,$0B,$8C,$00,$00,$00,$00,$00
        .BYTE $00,$00,$FF,$00,$00,$00,$00,$04
        .BYTE $FF,$00,$00,$04,$0A,$00,$00,$00
        .BYTE $00,$08,$41,$22,$88,$03,$09,$40
        .BYTE $1F,$58,$FD,$6A,$FF,$00,$00,$00
        .BYTE $00,$02,$FF,$00,$00,$00,$04,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $08,$15,$11,$F7,$04,$08,$58,$1B
        .BYTE $74,$FF,$32,$00,$C8,$00,$00,$00
        .BYTE $0A,$1E,$FF,$00,$00,$04,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $81,$AA,$CA,$1E,$64,$70,$17,$6A
        .BYTE $FF,$34,$00,$C9,$00,$00,$00,$0B
        .BYTE $1D,$FF,$00,$00,$04,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$15
        .BYTE $8A,$FA,$32,$50,$A2,$17,$18,$FC
        .BYTE $00,$00,$00,$00,$00,$00,$FF,$00
        .BYTE $00,$00,$00,$04,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$81,$00
        .BYTE $F7,$03,$07,$10,$27,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$15,$00,$C7
        .BYTE $03,$07,$DA,$61
bA451   JSR sA4F8
        LDA #$01     ;#%00000001
        JSR s8100
        LDX #$0F     ;#%00001111
        LDA #$19     ;#%00011001
        JSR s8100
        LDX #$07     ;#%00000111
        LDA #$1A     ;#%00011010
        JSR s8100
        JSR sA4DE
        JSR sA4DE
jA46D   SEI 
        LDA #$64     ;#%01100100
bA470   CMP $D012    ;Raster Position
        BNE bA470
        JSR sA548
        JSR $EA87
        JSR $F13E
        CMP #$0D     ;#%00001101
        BNE bA488
        JSR sA5FC
        JMP jA46D

bA488   CMP #$32     ;#%00110010
        BNE bA494
        LDA #$1A     ;#%00011010
        STA aA4C8
        JMP jA46D

bA494   CMP #$31     ;#%00110001
        BNE bA4A0
        LDA #$00     ;#%00000000
        STA aA4C8
        JMP jA46D

bA4A0   CMP #$5E     ;#%01011110
        BNE bA4AA
        JSR sA4DE
        JMP jA46D

bA4AA   CMP #$20     ;#%00100000
        BEQ bA451
        CMP #$5B     ;#%01011011
        BCS jA46D
        CMP #$41     ;#%01000001
        BCC jA46D
        SBC #$41     ;#%01000001
        CLC 
        ADC aA4C8
        DEC $D020    ;Border Color
        JSR s8100
        INC $D020    ;Border Color
        JMP jA46D

aA4C8   .BYTE $00
        .BYTE $00
sA4CA   LDX #$00     ;#%00000000
        LDA #$20     ;#%00100000
bA4CE   STA f0400,X
        STA f0500,X
        STA f0600,X
        STA f0700,X
        DEX 
        BNE bA4CE
        RTS 

sA4DE   JSR sA4E1
sA4E1   JSR sA4E4
sA4E4   JSR sA4E7
sA4E7   JSR sA4EA
sA4EA   JSR sA4ED
sA4ED   JSR sA4F0
sA4F0   JSR sA4F3
sA4F3   LDA #$00     ;#%00000000
        JMP s8100

sA4F8   JSR sA4CA
        LDX #$15     ;#%00010101
        LDA #$DA     ;#%11011010
bA4FF   STA f20,X
        DEX 
        BPL bA4FF
        LDX #$44     ;#%01000100
bA506   LDA #$0C     ;#%00001100
        STA fD850,X
        LDA #$0F     ;#%00001111
        STA fD8C8,X
        LDA #$01     ;#%00000001
        STA fD940,X
        LDA #$20     ;#%00100000
        STA f8135,X
        STA f817A,X
        STA f81BF,X
        DEX 
        BPL bA506
        LDX #$26     ;#%00100110
bA525   LDA #$0C     ;#%00001100
        STA fD9B8,X
        LDA #$0F     ;#%00001111
        STA fDA08,X
        LDA #$20     ;#%00100000
        STA f8215,X
        STA f823C,X
        STA f8263,X
        LDA #$01     ;#%00000001
        STA fDA58,X
        DEX 
        BPL bA525
        LDA #$FF     ;#%11111111
        STA a028A
        RTS 

sA548   LDA #$05     ;#%00000101
        STA $D020    ;Border Color
        JSR s8597
        JSR s8565
        JSR s8511
        JSR s8611
        LDA #$0B     ;#%00001011
        STA $D020    ;Border Color
        JSR s870C
        LDA #$0C     ;#%00001100
        STA $D020    ;Border Color
        JSR s8A46
        LDA #$0F     ;#%00001111
        STA $D020    ;Border Color
        JSR s8D82
        LDA a820B
        STA a0411
        LDA a820D
        STA a0412
        LDA a820C
        STA a0413
        LDA a85EB
        STA a0415
        LDA a85EC
        STA a0416
        LDA aA4C8
        STA a0425
        LDA a845B
        STA b0426
        LDA a845C
        STA a0427
        LDX #$0F     ;#%00001111
bA5A3   LDA f20,X
        STA f0400,X
        DEX 
        BPL bA5A3
        LDX #$44     ;#%01000100
bA5AD   LDA f8135,X
        STA f0450,X
        LDA f817A,X
        STA f04C8,X
        LDA f81BF,X
        STA f0540,X
        DEX 
        BPL bA5AD
        LDX #$26     ;#%00100110
bA5C4   LDA f8215,X
        STA f05B8,X
        LDA f823C,X
        STA f0608,X
        LDA f8263,X
        STA f0658,X
        DEX 
        BPL bA5C4
        LDX #$E3     ;#%11100011
bA5DB   LDA a828A,X
        STA f06A7,X
        DEX 
        BNE bA5DB
        LDA #$00     ;#%00000000
        STA $D020    ;Border Color
        LDA a29
        LDX #$07     ;#%00000111
bA5ED   LSR 
        PHA 
        LDA #$00     ;#%00000000
        ADC #$30     ;#%00110000
        STA f0418,X
        PLA 
        DEX 
        BPL bA5ED
        BMI bA5FF
sA5FC   INC a828A
bA5FF   LDA a828A
        LDX #$02     ;#%00000010
bA604   LSR 
        PHA 
        BCC bA60B
        LDA #$59     ;#%01011001
bA60B   =*+$01
        BIT a4EA9
        STA f0421,X
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
        LDX #<p39AC  ;#%10101100
        LDY #>p39AC  ;#%00111001
        STX a8232
        STY a8233
        LDA #<p0712  ;#%00010010
        STA a8221
        LDA #>p0712  ;#%00000111
        STA a8222
        LDX #<pFFBC  ;#%10111100
        LDY #>pFFBC  ;#%11111111
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
fB000   .BYTE $08
fB001   .BYTE $00,$00,$07,$90,$00,$07,$80,$00
        .BYTE $07,$70,$00,$07,$60,$00,$07,$50
        .BYTE $00,$07,$40,$00,$07,$30,$00,$07
        .BYTE $20,$00,$07,$10,$00,$07,$00,$00
        .BYTE $06,$90,$00,$06,$80,$00,$06,$70
        .BYTE $00,$06,$60,$00,$06,$50,$00,$06
        .BYTE $40,$00,$06,$30,$00,$06,$20,$00
        .BYTE $06,$10,$00,$06,$00,$00,$05,$90
        .BYTE $00,$05,$80,$00,$05,$70,$00,$05
        .BYTE $60,$00,$05,$50,$00,$05,$40,$00
        .BYTE $05,$30,$00,$05,$20,$00,$05,$10
        .BYTE $00,$05,$00,$00,$04,$90,$00,$04
        .BYTE $80,$00,$04,$70,$00,$04,$60,$00
        .BYTE $04,$50,$00,$04,$40,$00,$04,$30
        .BYTE $00,$04,$20,$00,$04,$10,$00,$04
        .BYTE $00,$00,$03,$90,$00,$03,$80,$00
        .BYTE $03,$70,$00,$03,$60,$00,$03,$50
        .BYTE $00,$03,$40,$00,$03,$30,$00,$03
        .BYTE $20,$00,$03,$10,$00,$03,$00,$00
        .BYTE $02,$90,$00,$02,$80,$00,$02,$70
        .BYTE $00,$02,$60,$00,$02,$50,$00,$02
        .BYTE $40,$00,$02,$30,$00,$02,$20,$00
        .BYTE $02,$10,$00,$02,$00,$00,$01,$90
        .BYTE $00,$01,$80,$00,$01,$70,$00,$01
        .BYTE $60,$00,$01,$50,$00,$01,$40,$00
        .BYTE $01,$30,$00,$01,$20,$00,$01,$10
        .BYTE $00,$01,$00,$00,$00,$90,$00,$00
        .BYTE $80,$00,$00,$70,$00,$00,$60,$00
        .BYTE $00,$50,$00,$00,$40,$00,$00,$30
        .BYTE $00,$00,$20,$00,$00,$10,$00,$5B
        .BYTE $5B,$43,$4F,$44,$49,$4E,$47,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$42,$59,$5B
        .BYTE $5B,$5B,$5B,$5D,$5D,$5D,$54,$4F
        .BYTE $4E,$59,$5D,$5D,$5D,$5D,$5D,$5D
        .BYTE $44,$41,$56,$45,$5D,$5D,$5D,$5D
        .BYTE $5D,$5D,$42,$49,$4C,$4C,$5D,$5D
        .BYTE $5D,$5D,$5D,$4D,$41,$52,$54,$49
        .BYTE $4E,$5D,$5D,$5C,$5C,$5C,$5C,$5C
        .BYTE $5C,$5C,$5C,$5C,$5C,$5B,$47,$52
        .BYTE $41,$50,$48,$49,$43,$53,$5B,$5B
        .BYTE $5B,$5B,$5B,$42,$59,$5B,$5B,$5B
        .BYTE $5B,$5D,$5D,$53,$54,$45,$56,$45
        .BYTE $5D,$5D,$5D,$5D,$5D,$5D,$54,$4F
        .BYTE $4E,$59,$5D,$5D,$5D,$5D,$5D,$5D
        .BYTE $44,$41,$56,$45,$5D,$5D,$5D,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$4D,$55,$53,$49,$43,$5B,$5B
        .BYTE $41,$4E,$44,$5B,$53,$4F,$55,$4E
        .BYTE $44,$5B,$46,$58,$5B,$5B,$5B,$5B
        .BYTE $5B,$42,$59,$5B,$5B,$5B,$5B,$5D
        .BYTE $5D,$4D,$41,$52,$54,$49,$4E,$5D
        .BYTE $5D,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$54,$41
        .BYTE $50,$45,$5B,$5B,$5B,$5B,$5B,$4C
        .BYTE $4F,$41,$44,$45,$52,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$42,$59,$5B,$5B,$5B
        .BYTE $5B,$5D,$5D,$5D,$42,$49,$4C,$4C
        .BYTE $5D,$5D,$5D,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$44
        .BYTE $52,$49,$4E,$4B,$53,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$42,$59,$5B,$5B,$5B
        .BYTE $5B,$42,$52,$45,$57,$53,$5B,$5B
        .BYTE $4C,$45,$45,$5C,$5C,$5C,$5C,$5C
        .BYTE $5C,$5C,$5C,$5C,$5C,$5D,$41,$53
        .BYTE $53,$49,$53,$54,$45,$44,$5D,$5B
        .BYTE $5B,$5B,$5B,$42,$59,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$43,$4F,$4C,$49,$4E
        .BYTE $5B,$5B,$5B,$5B,$5B,$4A,$4F,$46
        .BYTE $46,$41,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $50,$41,$55,$4C,$5B,$5B,$5B,$5B
        .BYTE $5B,$44,$4F,$55,$47,$49,$45,$5B
        .BYTE $5B,$57,$49,$4E,$47,$5B,$43,$4D
        .BYTE $4E,$44,$52,$5B,$5B,$5B,$52,$49
        .BYTE $43,$4B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $50,$41,$4D,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$44,$45,$42,$42,$49,$45,$5B
        .BYTE $5B,$5B,$5B,$43,$4C,$41,$52,$45
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$4C,$59
        .BYTE $4E,$4E,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $4C,$49,$53,$41,$5B,$5B,$5B,$5B
        .BYTE $5B,$53,$49,$4D,$4F,$4E,$45,$5B
        .BYTE $5B,$5B,$5B,$5B,$4A,$41,$4E,$45
        .BYTE $5B,$5B,$5B,$54,$4F,$4E,$59,$5D
        .BYTE $4D,$41,$52,$49,$41,$53,$54,$45
        .BYTE $56,$45,$5B,$42,$4C,$4F,$57,$4A
        .BYTE $4F,$4E,$5B,$57,$4F,$4F,$44,$53
        .BYTE $5B,$44,$41,$56,$49,$44,$5B,$57
        .BYTE $41,$52,$44,$50,$41,$55,$4C,$5B
        .BYTE $46,$49,$4E,$5B,$5B,$43,$4F,$4C
        .BYTE $49,$4E,$5B,$53,$54,$4F,$4B,$43
        .BYTE $48,$52,$49,$53,$54,$49,$4E,$45
        .BYTE $5B,$53,$49,$4D,$4F,$4E,$5B,$53
        .BYTE $54,$52,$45,$53,$41,$4D,$41,$4E
        .BYTE $54,$48,$41,$5B,$53,$53,$59,$4C
        .BYTE $56,$49,$41,$5B,$50,$4F,$4D,$4D
        .BYTE $49,$4B,$45,$5B,$50,$4F,$4D,$46
        .BYTE $52,$4D,$49,$4B,$45,$5B,$42,$41
        .BYTE $52,$4E,$45,$42,$52,$49,$41,$4E
        .BYTE $5B,$47,$41,$4C,$57,$4D,$55,$52
        .BYTE $49,$45,$4C,$5B,$47,$41,$4C,$47
        .BYTE $45,$4F,$52,$47,$45,$5B,$47,$41
        .BYTE $4C,$50,$41,$44,$44,$59,$5B,$47
        .BYTE $41,$4C,$57,$44,$41,$56,$49,$44
        .BYTE $5B,$4B,$45,$4E,$4E,$5B,$5B,$53
        .BYTE $49,$4D,$4F,$4E,$5B,$5B,$5B,$50
        .BYTE $41,$55,$4C,$5B,$53,$4D,$49,$54
        .BYTE $48,$42,$45,$4E,$4A,$41,$4D,$49
        .BYTE $4E,$5B,$53,$53,$48,$41,$52,$4F
        .BYTE $4E,$5B,$47,$52,$45,$54,$48,$45
        .BYTE $5B,$48,$49,$54,$4D,$41,$4E,$43
        .BYTE $52,$41,$5A,$59,$5B,$44,$41,$56
        .BYTE $45,$47,$45,$4F,$46,$46,$5B,$4D
        .BYTE $41,$54,$48,$4A,$41,$4B,$45,$5B
        .BYTE $4D,$41,$54,$48,$5B,$4A,$4F,$4E
        .BYTE $5B,$54,$49,$43,$4B,$4C,$45,$5B
        .BYTE $4A,$4F,$4E,$4E,$59,$5B,$42,$5B
        .BYTE $5B,$4D,$49,$4B,$45,$5B,$43,$41
        .BYTE $52,$52,$5B,$44,$41,$56,$45,$5B
        .BYTE $53,$55,$50,$45,$52,$5B,$5B,$5B
        .BYTE $43,$4F,$4F,$4C,$5B,$5B,$5B,$5B
        .BYTE $5B,$48,$49,$43,$4B,$59,$5B,$5B
        .BYTE $5B,$5B,$5B,$47,$52,$55,$4D,$50
        .BYTE $59,$5B,$5B,$5B,$42,$41,$53,$48
        .BYTE $45,$52,$5B,$57,$5B,$5B,$5B,$53
        .BYTE $48,$49,$52,$54,$5B,$5B,$5B,$5B
        .BYTE $41,$4E,$44,$5B,$41,$4E,$59,$5B
        .BYTE $5B,$42,$4F,$44,$59,$5B,$45,$4C
        .BYTE $53,$45,$5B,$5D,$55,$4E,$4B,$4E
        .BYTE $4F,$57,$4E,$5D,$5B,$5D,$55,$4E
        .BYTE $4B,$4E,$4F,$57,$4E,$5D,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B
fB41A   .BYTE $00
fB41B   .BYTE $01,$02,$03,$04,$05,$06,$07,$08
        .BYTE $09,$0A,$0B,$0C,$0D,$0E,$0F,$10
        .BYTE $11,$12,$13,$14,$15,$16,$17,$18
        .BYTE $19,$1A,$1B,$1C,$1D,$1E,$1F,$20
        .BYTE $21,$22,$23,$24,$25,$26,$27,$28
        .BYTE $29,$2A,$2B,$2C,$2D,$2E,$2F,$30
        .BYTE $31,$32,$33,$34,$35,$36,$37,$38
        .BYTE $39,$3A,$3B,$3C,$3D,$3E,$3F,$40
        .BYTE $41,$42,$43,$44,$45,$46,$47,$48
        .BYTE $49,$4A,$4B,$4C,$4D,$4E
aB469   .BYTE $4F,$00,$FF,$00,$FF,$00,$FF,$FF
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
        LDX #<p39AC  ;#%10101100
        LDY #>p39AC  ;#%00111001
        STX a8232
        STY a8233
        LDA #<p0712  ;#%00010010
        STA a8221
        LDA #>p0712  ;#%00000111
        STA a8222
        LDX #<pFFBC  ;#%10111100
        LDY #>pFFBC  ;#%11111111
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
sC000   JMP jC07A

sC003   JMP jC00C

jC006   JMP jC1BA

        JMP jCF17

jC00C   ASL 
        TAX 
        LDA fC06D,X
        STA aFB
        LDA fC06E,X
        STA aFC
        LDA fC06F,X
        STA aFD
        LDA fC070,X
        STA aFE
        LDA fC071,X
        STA aC065
        LDA fC072,X
        TAX 
        LDA #$30     ;#%00110000
        STA a01
        LDY #$00     ;#%00000000
bC032   LDA (pFD),Y
        STA aC073
        LDA (pFB),Y
        STA (pFD),Y
        LDA aC073
        STA (pFB),Y
        INY 
        BNE bC032
        DEX 
        BEQ bC04C
        INC aFC
        INC aFE
        BNE bC032
bC04C   INC aFC
        INC aFE
        LDA aC065
        BEQ bC068
bC055   LDA (pFD),Y
        STA aC073
        LDA (pFB),Y
        STA (pFD),Y
        LDA aC073
        STA (pFB),Y
        INY 
aC065   =*+$01
        CPY #$FF     ;#%11111111
        BNE bC055
bC068   LDA #$35     ;#%00110101
        STA a01
        RTS 

fC06D   .BYTE $00
fC06E   .BYTE $D0
fC06F   .BYTE $00
fC070   .BYTE $78
fC071   .BYTE $FF
fC072   .BYTE $07
aC073   .BYTE $00
        JMP jC07A

        JMP jC00C

jC07A   PLA 
        STA aFA
        PLA 
        STA aFB
        LDA aFA
        CLC 
        ADC #$02     ;#%00000010
        STA aC19C
        LDA aFB
        ADC #$00     ;#%00000000
        PHA 
        LDA aC19C
        PHA 
        JSR sC1A9
        JSR sC19F
        PHA 
        JSR sC19F
        STA aFB
        PLA 
        STA aFA
jC0A0   JSR sC19F
        CMP #$FF     ;#%11111111
        BNE bC0AD
        JSR sC10B
        JMP jC0A0

bC0AD   LDY aC135
        CPY #$02     ;#%00000010
        BEQ bC0B7
        JMP jC0F2

bC0B7   CMP #$3B     ;#%00111011
        BCS bC0BE
        SEC 
        SBC #$12     ;#%00010010
bC0BE   ASL 
        ASL 
        CLC 
        ADC #$3C     ;#%00111100
        STA aC19C
        LDX #$03     ;#%00000011
bC0C8   LDA aC19C
        LDY fC119,X
        JSR sC0DD
        INC aC19C
        DEX 
        BPL bC0C8
jC0D7   JSR sC0FC
        JMP jC0A0

sC0DD   STA (pFC),Y
        LDA aFD
        PHA 
        AND #$03     ;#%00000011
        CLC 
        ADC #$D8     ;#%11011000
        STA aFD
        LDA aC19E
        STA (pFC),Y
        PLA 
        STA aFD
        RTS 

jC0F2   AND #$3F     ;#%00111111
        LDY #$00     ;#%00000000
        JSR sC0DD
        JMP jC0D7

sC0FC   LDA aFC
        CLC 
        ADC aC135
        STA aFC
        LDA aFD
        ADC #$00     ;#%00000000
        STA aFD
        RTS 

sC10B   JSR sC19F
        ASL 
        TAX 
        LDA fC11E,X
        PHA 
        LDA fC11D,X
        PHA 
        RTS 

fC119   .BYTE $29,$28,$01,$00
fC11E   =*+$01
fC11D   .WORD aC1B6,aC167,bC1AF,aC135,aC128
aC128   =*+$01
        .WORD aC12E
        LDA #$02     ;#%00000010
        STA aC135
aC12E   RTS 

        LDA #$01     ;#%00000001
        STA aC135
        RTS 

aC135   .BYTE $02
        JSR sC19F
        PHA 
        JSR sC19F
        TAX 
        LDY #$C8     ;#%11001000
bC140   PLA 
        STA p4000,Y
        STA f40C8,Y
        STA f4190,Y
        STA f4258,Y
        STA f4320,Y
        PHA 
        TXA 
        STA fD800,Y
        STA fD8C8,Y
        STA fD990,Y
        STA fDA58,Y
        STA fDB20,Y
        DEY 
        CPY #$FF     ;#%11111111
        BNE bC140
        PLA 
aC167   RTS 

        LDA #$00     ;#%00000000
        STA aFD
        JSR sC19F
        STA aC19C
        JSR sC19F
        ASL 
        ASL 
        ASL 
        STA aC19D
        ASL 
        ROL aFD
        ASL 
        ROL aFD
        CLC 
        ADC aC19D
        STA aFC
        LDA aFD
        ADC #$40     ;#%01000000
        STA aFD
        LDA aFC
        CLC 
        ADC aC19C
        STA aFC
        LDA aFD
        ADC #$00     ;#%00000000
        STA aFD
        RTS 

aC19C   .BYTE $B8
aC19D   .BYTE $B8
aC19E   .BYTE $06
sC19F   LDY #$00     ;#%00000000
        LDA (pFA),Y
        PHA 
        JSR sC1A9
        PLA 
        RTS 

sC1A9   INC aFA
        BNE bC1AF
        INC aFB
bC1AF   RTS 

        JSR sC19F
        STA aC19E
aC1B6   RTS 

        PLA 
        PLA 
        RTS 

jC1BA   LDX #$F0     ;#%11110000
        TXS 
        JSR sC43C
        LDA #$19     ;#%00011001
        LDX #$0F     ;#%00001111
        JSR s8100
        LDA #$00     ;#%00000000
        STA $D021    ;Background Color 0
        STA $D020    ;Border Color
        STA $D022    ;Background Color 1, Multi-Color Register 0
        STA $D015    ;Sprite display Enable
        LDA #$8D     ;#%10001101
        STA aCF01
        SEI 
        LDA #$35     ;#%00110101
        STA a01
        LDA #$00     ;#%00000000
        JSR jC00C
        LDA #$96     ;#%10010110
        STA $DD00    ;CIA2: Data Port Register A
        LDA #$0F     ;#%00001111
        STA $D018    ;VIC Memory Control Register
        LDA #$08     ;#%00001000
        STA $D016    ;VIC Control Register 2
jC1F3   JSR jC07A
        .BYTE $AE,$CC
        LDA #$00     ;#%00000000
        STA aCFFF
        JSR sCE30
        JSR sC3E6
        JSR sC2FC
        JSR sC82E
        LDA aB469
        STA aC19C
        ASL 
        CLC 
        ADC aC19C
        TAY 
        LDX #$02     ;#%00000010
        LDA #$00     ;#%00000000
bC219   STA fB000,Y
        INY 
        DEX 
        BPL bC219
        LDA #$1B     ;#%00011011
        STA $D011    ;VIC Control Register 1
        JSR sC74C
        LDA #$1E     ;#%00011110
        JSR s8100
        JSR sC36E
        LDA #$00     ;#%00000000
        JSR jC00C
        JSR s0367
        SEI 
        LDA #$00     ;#%00000000
        STA $D015    ;Sprite display Enable
        STA $D020    ;Border Color
        STA $D021    ;Background Color 0
        LDA #$08     ;#%00001000
        STA $D016    ;VIC Control Register 2
        LDA #$00     ;#%00000000
        JSR jC00C
        LDA #$8D     ;#%10001101
        STA aCF01
        LDA #$1B     ;#%00011011
        STA $D011    ;VIC Control Register 1
        LDA aB469
        STA aC2D1
        JSR sC2E1
        LDA #$01     ;#%00000001
        JSR s8100
        LDA #$1A     ;#%00011010
        LDX #$07     ;#%00000111
        JSR s8100
        JSR sC2FC
        JSR sC276
        JMP jC1F3

sC276   LDA aC2D1
        CMP aB469
        BNE bC27F
        RTS 

bC27F   JSR jC07A
        .BYTE $AE,$CC,$20,$7A,$C0,$AE,$C7
        LDX #$4F     ;#%01001111
        LDA aC2D1
bC28E   CMP fB41A,X
        BEQ bC296
        DEX 
        BPL bC28E
bC296   STX aCD72
        LDA #$08     ;#%00001000
        STA aCCD3
        JSR sCCD5
        JSR jC07A
        LDX fCC,Y
        LDA #$05     ;#%00000101
        STA aC2D2
        JSR s8100
bC2AE   JSR sC3DE
        LDA #$00     ;#%00000000
        JSR s8100
        DEC aC2D2
        BNE bC2AE
        LDA #$02     ;#%00000010
        STA aC2D2
        JSR sCCD5
        JSR jC07A
        LDX fCC,Y
        JSR sC589
        LDA aC5CC
        BEQ bC2AE
        RTS 

aC2D1   .BYTE $00
aC2D2   .BYTE $00
bC2D3   LDA aCF0C
        BEQ bC2D3
        DEC aCF0C
        LDA #$00     ;#%00000000
        JSR s8100
        RTS 

sC2E1   LDA aB469
        STA aC19C
        ASL 
        CLC 
        ADC aC19C
        TAY 
        LDX #$00     ;#%00000000
bC2EF   JSR s035B
        STA fB000,Y
        INY 
        INX 
        CPX #$03     ;#%00000011
        BNE bC2EF
        RTS 

sC2FC   LDA #>p4E00  ;#%01001110
        STA aC36D
        LDA #<p4E00  ;#%00000000
        STA aC36C
bC306   LDY aC36D
        INY 
        LDA fB41A,Y
        ASL 
        CLC 
        ADC fB41A,Y
        STA aC6E9
        LDY aC36D
        LDA fB41A,Y
        ASL 
        CLC 
        ADC fB41A,Y
        TAY 
        JSR sC34B
        BCC bC329
        JMP jC33F

bC329   LDY aC36D
        LDA fB41A,Y
        PHA 
        LDA fB41B,Y
        STA fB41A,Y
        PLA 
        STA fB41B,Y
        LDA #$01     ;#%00000001
        STA aC36C
jC33F   DEC aC36D
        BPL bC306
        LDA aC36C
        BNE sC2FC
        RTS 

sC34B   =*+$01
        CMP ~f00A2,X
bC34D   LDA fB000,Y
        STY aC6EA
        LDY aC6E9
        CMP fB000,Y
        BEQ bC35F
        LDY aC6EA
        RTS 

bC35F   LDY aC6EA
        INY 
        INC aC6E9
        INX 
        CPX #$03     ;#%00000011
        BNE bC34D
        RTS 

aC36C   .BYTE $00
aC36D   .BYTE $FF
sC36E   LDA #$00     ;#%00000000
        STA $D011    ;VIC Control Register 1
        SEI 
        LDA #$01     ;#%00000001
        STA $D015    ;Sprite display Enable
        JSR s8100
        LDX #$00     ;#%00000000
        STX $D010    ;Sprites 0-7 MSB of X coordinate
        STX $D01D    ;Sprites Expand 2x Horizontal (X)
        STX $D020    ;Border Color
        STX $D021    ;Background Color 0
        STX aC528
        LDA #$1D     ;#%00011101
        STA aC651
        JSR s8100
        JSR sC494
        LDA #$00     ;#%00000000
        STA aFF
        LDY #$09     ;#%00001001
        LDA aB469
        ASL 
        STA aC19C
        ASL 
        ROL aFF
        ASL 
        ROL aFF
        CLC 
        ADC aC19C
        BCC bC3B3
        INC aFF
bC3B3   CLC 
        ADC #$F0     ;#%11110000
        STA aFE
        LDA aFF
        ADC #$B0     ;#%10110000
        STA aFF
        LDA #$5B     ;#%01011011
bC3C0   STA (pFE),Y
        DEY 
        BPL bC3C0
        JSR sC559
        JSR sC589
        LDA #$1B     ;#%00011011
        STA $D011    ;VIC Control Register 1
        JSR sC3F2
        JSR sC3DE
        LDA #$00     ;#%00000000
        STA $D015    ;Sprite display Enable
        JMP j0379

sC3DE   LDA #$F8     ;#%11111000
bC3E0   CMP $D012    ;Raster Position
        BNE bC3E0
        RTS 

sC3E6   LDY #$00     ;#%00000000
bC3E8   TYA 
        STA fB41A,Y
        INY 
        CPY #$50     ;#%01010000
        BNE bC3E8
        RTS 

sC3F2   JSR sC3DE
        LDA #$00     ;#%00000000
        JSR s8100
        JSR sC529
        JSR sC589
        JSR sC5CE
        JSR sC655
        JSR sC4A9
        JSR sC625
        JSR sC4CE
        JSR sC418
        JSR sC465
        JMP sC3F2

sC418   LDA aC528
        ASL 
        CLC 
        ADC #$0A     ;#%00001010
        STA aC433
        LDX aC547
        LDA fC549,X
        STA aC437
        JSR jC07A
        AND (pC4),Y
        RTS 

        .BYTE $FF,$01
aC433   .BYTE $00,$16,$FF,$02
aC437   .BYTE $00,$3A,$5B,$FF,$00
sC43C   LDX #$4F     ;#%01001111
        LDY #$00     ;#%00000000
        SED 
        LDA #$81     ;#%10000001
bC443   SEC 
        SBC #$01     ;#%00000001
        STA aC19C
        ASL 
        ASL 
        ASL 
        ASL 
        STA fB001,Y
        LDA aC19C
        LSR 
        LSR 
        LSR 
        LSR 
        STA fB000,Y
        LDA aC19C
        INY 
        INY 
        INY 
        DEX 
        BPL bC443
        CLD 
        RTS 

sC465   LDA aC5CC
        BNE sC494
        LDA aC5C9
        BNE sC494
        LDA aC5C8
        BNE sC494
        INC aC49D
        BNE bC49C
        INC aC49E
        LDA aC49E
        CMP #$02     ;#%00000010
        BNE bC49C
        JSR sC489
        PLA 
        PLA 
        RTS 

sC489   LDY #$09     ;#%00001001
bC48B   LDA fC49F,Y
        STA (pFE),Y
        DEY 
        BPL bC48B
        RTS 

sC494   LDA #$00     ;#%00000000
        STA aC49D
        STA aC49E
bC49C   RTS 

aC49D   .BYTE $00
aC49E   .BYTE $00
fC49F   .BYTE $5D,$55,$4E,$4B,$4E,$4F,$57,$4E
        .BYTE $5D,$5B
sC4A9   LDY #$09     ;#%00001001
bC4AB   LDA (pFE),Y
        STA fC4C2,Y
        DEY 
        BPL bC4AB
        JSR jC07A
        LDA f60C4,Y
        .BYTE $FF,$01,$0A,$16,$FF,$02,$01,$FF
        .BYTE $04
fC4C2   .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $55,$44,$FF,$00
sC4CE   LDA aC5CC
        BNE bC4D4
        RTS 

bC4D4   LDX aC651
        LDA fC72C,X
        JSR sC4EA
        LDY aC528
        CPY #$0A     ;#%00001010
        BEQ bC4E9
        STA (pFE),Y
        INC aC528
bC4E9   RTS 

sC4EA   CPX #$1B     ;#%00011011
        BNE bC4FE
        LDY aC528
        BEQ bC4FB
        DEC aC528
        DEY 
        LDA #$5B     ;#%01011011
        STA (pFE),Y
bC4FB   PLA 
        PLA 
        RTS 

bC4FE   CPX #$1C     ;#%00011100
        BNE bC505
        LDA #$5D     ;#%01011101
        RTS 

bC505   CPX #$1A     ;#%00011010
        BNE bC50C
        LDA #$5B     ;#%01011011
        RTS 

bC50C   CPX #$1D     ;#%00011101
        BNE bC527
        LDA #$00     ;#%00000000
        STA $D011    ;VIC Control Register 1
        LDA #$01     ;#%00000001
        JSR s8100
        SEI 
        LDA aC528
        BNE bC523
        JSR sC489
bC523   PLA 
        PLA 
        PLA 
        PLA 
bC527   RTS 

aC528   .BYTE $00
sC529   LDA aC546
        BEQ bC532
        DEC aC546
        RTS 

bC532   LDA #$02     ;#%00000010
        STA aC546
        LDX aC547
        LDA fC551,X
        DEX 
        BPL bC542
        LDX #$07     ;#%00000111
bC542   STX aC547
        RTS 

aC546   .BYTE $00
aC547   .BYTE $00,$00
fC549   .BYTE $00,$0B,$0C,$0F,$01,$0F,$0C,$0B
fC551   .BYTE $00,$06,$0E,$03,$01,$03,$0E,$06
sC559   LDA #$01     ;#%00000001
        STA a43F9
        JSR jC07A
        .BYTE $64,$C5,$60,$FF,$04,$FF,$01,$0D
        .BYTE $13,$FF,$02,$05,$54,$52,$4F,$4F
        .BYTE $50,$45,$52,$FF,$01,$05,$00,$45
        .BYTE $4E,$54,$45,$52,$5B,$59,$4F,$55
        .BYTE $52,$5B,$4E,$41,$4D,$45,$FF,$00
sC589   LDA #$00     ;#%00000000
        LDX #$05     ;#%00000101
bC58D   STA aC5C8,X
        DEX 
        BPL bC58D
        LDA $DC00    ;CIA1: Data Port Register A
        AND $DC01    ;CIA1: Data Port Register B
        EOR #$FF     ;#%11111111
        AND #$1F     ;#%00011111
        STA aC5CD
        LSR 
        ROL aC5CB
        LSR 
        ROL aC5CA
        LSR 
        ROL aC5C9
        LSR 
        ROL aC5C8
        LSR 
        ROL aC5CC
        LDA aC5CC
        CMP aC5C7
        BEQ bC5C0
        STA aC5C7
        RTS 

bC5C0   LDA #$00     ;#%00000000
        STA aC5CC
        RTS 

        RTS 

aC5C7   .BYTE $00
aC5C8   .BYTE $00
aC5C9   .BYTE $00
aC5CA   .BYTE $00
aC5CB   .BYTE $00
aC5CC   .BYTE $00
aC5CD   .BYTE $00
sC5CE   LDA aC652
        STA $D000    ;Sprite 0 X Pos
        LDA aC654
        STA $D001    ;Sprite 0 Y Pos
        LDA aC653
        STA $D010    ;Sprites 0-7 MSB of X coordinate
        LDA #$DF     ;#%11011111
        STA f43F8
        LDX aC547
        LDY #$1D     ;#%00011101
        LDA fC549,X
        STA $D027    ;Sprite 0 Color
bC5F0   STA fD82D,Y
        STA fD805,Y
        DEY 
        BPL bC5F0
        RTS 

sC5FA   LDA aC5C9
        BNE bC616
        LDA aC5C8
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

sC625   LDX aC651
        LDA fC6EC,X
        CLC 
        ADC #$09     ;#%00001001
        ADC #$02     ;#%00000010
        ASL 
        ASL 
        ASL 
        PHP 
        CLC 
        ADC #$06     ;#%00000110
        STA aC652
        PLP 
        LDA #$00     ;#%00000000
        ROL 
        STA aC653
        LDA fC70C,X
        CLC 
        ADC #$03     ;#%00000011
        ASL 
        ASL 
        ASL 
        CLC 
        ADC #$31     ;#%00110001
        STA aC654
        RTS 

aC651   .BYTE $00
aC652   .BYTE $00
aC653   .BYTE $00
aC654   .BYTE $00
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
fC6BA   .BYTE $00,$06,$02,$04,$05,$03,$07,$01
        .BYTE $07,$03,$05,$04,$02
sC6C7   PHA 
        LDA #$00     ;#%00000000
        STA aFB
        STA aFC
        PLA 
        ASL 
        ASL 
        ASL 
        STA aC6E8
        ASL 
        ROL aFC
        ASL 
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
fC72C   .BYTE $41,$42,$43,$44,$45,$46,$47,$48
        .BYTE $49,$4A,$4B,$4C,$4D,$4E,$4F,$50
        .BYTE $51,$52,$53,$54,$55,$56,$57,$58
        .BYTE $59,$5A,$5F,$61,$5C,$5D,$5E,$62
sC74C   .BYTE $20,$7A,$C0,$52,$C7,$60,$FF,$03
        .BYTE $00,$20,$FF,$00,$FF,$02,$07,$FF
        .BYTE $04,$FF,$01,$0F,$00,$52,$41,$4D
        .BYTE $42,$4F,$FF,$05,$54,$4D,$FF,$04
        .BYTE $FF,$01,$09,$03,$FF,$02,$02,$46
        .BYTE $49,$52,$53,$54,$5B,$42,$4C,$4F
        .BYTE $4F,$44,$FF,$05,$54,$4D,$FF,$04
        .BYTE $FF,$01,$0D,$06,$FF,$02,$03,$50
        .BYTE $41,$52,$54,$5B,$49,$49,$FF,$05
        .BYTE $FF,$01,$0C,$09,$FF,$02,$05,$41
        .BYTE $4C,$4C,$5B,$54,$49,$4D,$45,$5B
        .BYTE $48,$45,$52,$4F,$45,$53,$FF,$04
        .BYTE $FF,$00,$FF,$02,$0F,$FF,$01,$05
        .BYTE $00,$43,$4F,$4E,$47,$52,$41,$54
        .BYTE $55,$4C,$41,$54,$49,$4F,$4E,$53
        .BYTE $FF,$01,$09,$03,$FF,$02,$05,$59
        .BYTE $4F,$55,$5B,$41,$52,$45,$5B,$4E
        .BYTE $4F,$57,$FF,$01,$03,$06,$FF,$02
        .BYTE $07,$41,$4D,$4F,$4E,$47,$5B,$4F
        .BYTE $54,$48,$45,$52,$5B,$47,$52,$45
        .BYTE $41,$54,$FF,$01,$07,$09,$FF,$02
        .BYTE $0A,$42,$41,$54,$54,$4C,$45,$5B
        .BYTE $48,$45,$52,$4F,$45,$53,$FF,$01
        .BYTE $08,$0C,$FF,$02,$03,$49,$4E,$5B
        .BYTE $54,$48,$45,$5B,$52,$41,$4D,$42
        .BYTE $4F,$FF,$01,$04,$0F,$FF,$02,$0E
        .BYTE $48,$49,$47,$48,$5B,$53,$43,$4F
        .BYTE $52,$45,$5B,$52,$41,$4E,$4B,$53
        .BYTE $FF,$00
sC82E   LDA #$01     ;#%00000001
        JSR s8100
        LDA #$1A     ;#%00011010
        LDX #$07     ;#%00000111
        JSR s8100
        LDA #$03     ;#%00000011
        JSR s8100
jC83F   LDA #$08     ;#%00001000
        STA aCCD3
        LDA #$00     ;#%00000000
        STA aCF0E
        STA aCF0D
        STA aCFFF
        LDA #$20     ;#%00100000
        LDX #$27     ;#%00100111
bC853   STA f4348,X
        STA f4370,X
        DEX 
        BPL bC853
        JSR jC07A
        CLI 
        .BYTE $C7
        LDA #$00     ;#%00000000
bC863   STA aCD72
        JSR sCCD5
        JSR jC07A
        LDX fCC,Y
jC86E   JSR bC2D3
        JSR sCD73
        JSR sC589
        LDA aC5CC
        BNE bC884
        LDA aCF0E
        BNE bC885
        JMP jC86E

bC884   RTS 

bC885   DEC aCF0E
bC888   JSR bC2D3
        JSR sCD73
        JSR sC589
        LDA aC5CC
        BNE bC884
        LDA aCF0E
        BEQ bC888
        DEC aCF0E
        LDY #$27     ;#%00100111
        LDA #$20     ;#%00100000
bC8A2   STA f4398,Y
        STA f43C0,Y
        DEY 
        BPL bC8A2
bC8AB   JSR bC2D3
        JSR sCD73
        JSR sC589
        LDA aC5CC
        BNE bC884
        LDA aCF0E
        BEQ bC8AB
        DEC aCF0E
        LDA aCD72
        CLC 
        ADC #$01     ;#%00000001
        CMP #$50     ;#%01010000
        BCC bC863
        CMP #$54     ;#%01010100
        STA aCD72
        BCC jC86E
        JSR jC07A
        .BYTE $5A
        .BYTE $CC
        LDA #$00     ;#%00000000
        STA aCFFF
        LDA #<pC96C  ;#%01101100
        STA aFE
        LDA #>pC96C  ;#%11001001
        STA aFF
jC8E4   LDY #$00     ;#%00000000
jC8E6   LDA (pFE),Y
        BMI bC8F1
        STA fCC7E,Y
        INY 
        JMP jC8E6

bC8F1   TAX 
        INY 
        LDA (pFE),Y
        PHA 
        INY 
        TYA 
        STY aCCD4
        CLC 
        ADC aFE
        STA aFE
        BCC bC904
        INC aFF
bC904   PLA 
        STA aCC7D
        TAY 
        CPX #$FF     ;#%11111111
        BNE bC912
        LDA #$2C     ;#%00101100
        STA aCF01
bC912   CPX #$FE     ;#%11111110
        BNE bC919
        JMP jC83F

bC919   TYA 
        AND #$10     ;#%00010000
        LSR 
        LSR 
        LSR 
        LSR 
        CLC 
        ADC #$04     ;#%00000100
        STA aCC7A
        LDY aCCD4
        DEY 
        DEY 
        LDA #$FF     ;#%11111111
        STA fCC7E,Y
        LDA #$00     ;#%00000000
        STA fCC7F,Y
        JSR jC07A
        ADC fCC,X
bC93A   JSR bC2D3
        JSR sCD73
        JSR sC589
        LDA aCFFF
        BNE bC951
        LDA aC5CD
        BEQ bC95B
        AND #$10     ;#%00010000
        BNE bC966
bC951   LDA #$00     ;#%00000000
        STA aCFFF
        LDA #$8D     ;#%10001101
        STA aCF01
bC95B   LDA aCF0E
        BEQ bC93A
        DEC aCF0E
        JMP jC8E4

bC966   LDX #$8D     ;#%10001101
        STX aCF01
        RTS 

pC96C   .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$59,$4F
        .BYTE $55,$5B,$48,$41,$56,$45,$5B,$43
        .BYTE $48,$4F,$53,$45,$4E,$5B,$54,$4F
        .BYTE $5B,$42,$45,$43,$4F,$4D,$45,$5B
        .BYTE $41,$4E,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $80,$91,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$41,$4D,$45,$52
        .BYTE $49,$43,$41,$4E,$5B,$50,$45,$41
        .BYTE $43,$45,$54,$49,$4D,$45,$5B,$48
        .BYTE $45,$52,$4F,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$80,$91,$5B,$5B,$5B,$5B
        .BYTE $50,$4C,$41,$43,$45,$5B,$59,$4F
        .BYTE $55,$52,$5B,$57,$45,$41,$50,$4F
        .BYTE $4E,$5B,$49,$4E,$54,$4F,$5B,$50
        .BYTE $4F,$52,$54,$5B,$54,$57,$4F,$5B
        .BYTE $5B,$5B,$5B,$5B,$80,$93,$5B,$5B
        .BYTE $59,$4F,$55,$52,$5B,$4D,$49,$53
        .BYTE $53,$49,$4F,$4E,$5B,$49,$53,$5B
        .BYTE $54,$4F,$5B,$52,$45,$54,$55,$52
        .BYTE $4E,$5B,$54,$4F,$5B,$56,$49,$45
        .BYTE $54,$4E,$41,$4D,$5B,$5B,$80,$91
        .BYTE $5B,$5B,$5B,$5B,$4F,$4E,$5B,$41
        .BYTE $5B,$52,$45,$43,$4F,$4E,$4E,$41
        .BYTE $49,$53,$41,$4E,$43,$45,$5B,$45
        .BYTE $58,$45,$52,$43,$49,$53,$45,$5B
        .BYTE $54,$4F,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $80,$91,$5B,$5B,$5B,$45,$53,$54
        .BYTE $41,$42,$4C,$49,$53,$48,$5B,$57
        .BYTE $48,$45,$54,$48,$45,$52,$5B,$50
        .BYTE $3C,$4F,$3C,$57,$3B,$53,$5B,$41
        .BYTE $52,$45,$5B,$53,$54,$49,$4C,$4C
        .BYTE $5B,$5B,$80,$91,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$42,$45,$49,$4E
        .BYTE $47,$5B,$48,$45,$4C,$44,$5B,$43
        .BYTE $41,$50,$54,$49,$56,$45,$3C,$3C
        .BYTE $3C,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$80,$91,$5B,$59
        .BYTE $4F,$55,$5B,$4D,$55,$53,$54,$5B
        .BYTE $55,$4E,$44,$45,$52,$5B,$4E,$4F
        .BYTE $5B,$43,$49,$52,$43,$55,$4D,$53
        .BYTE $54,$41,$4E,$43,$45,$53,$5B,$45
        .BYTE $4E,$47,$41,$47,$45,$5B,$80,$95
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$54
        .BYTE $48,$45,$5B,$45,$4E,$45,$4D,$59
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $80,$95,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$4D,$4F,$56,$45,$5B,$4A
        .BYTE $4F,$59,$53,$54,$49,$43,$4B,$5B
        .BYTE $54,$4F,$5B,$43,$4F,$4E,$54,$49
        .BYTE $4E,$55,$45,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$80,$93,$80,$93,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$53,$50
        .BYTE $41,$43,$45,$5B,$42,$41,$52,$5B
        .BYTE $53,$45,$4C,$45,$43,$54,$53,$5B
        .BYTE $57,$45,$41,$50,$4F,$4E,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$FF,$93
        .BYTE $5B,$5B,$5B,$5B,$5B,$3D,$53,$3D
        .BYTE $5B,$54,$4F,$47,$47,$4C,$45,$53
        .BYTE $5B,$4D,$55,$53,$49,$43,$5B,$41
        .BYTE $4E,$44,$5B,$53,$4F,$55,$4E,$44
        .BYTE $5B,$46,$58,$5B,$5B,$5B,$5B,$5B
        .BYTE $80,$93,$5B,$3D,$52,$55,$4E,$5B
        .BYTE $53,$54,$4F,$50,$3D,$5B,$54,$4F
        .BYTE $47,$47,$4C,$45,$53,$5B,$53,$55
        .BYTE $53,$50,$45,$4E,$44,$45,$44,$5B
        .BYTE $41,$4E,$49,$4D,$41,$54,$49,$4F
        .BYTE $4E,$5B,$80,$93,$80,$95,$5B,$5B
        .BYTE $5B,$57,$41,$54,$43,$48,$5B,$4F
        .BYTE $55,$54,$5B,$46,$4F,$52,$5B,$45
        .BYTE $58,$54,$52,$41,$5B,$57,$45,$41
        .BYTE $50,$4F,$4E,$53,$5B,$49,$4E,$5B
        .BYTE $54,$48,$45,$5B,$5B,$5B,$80,$95
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$54
        .BYTE $45,$52,$52,$41,$49,$4E,$5B,$41
        .BYTE $4E,$44,$5B,$45,$4E,$45,$4D,$59
        .BYTE $5B,$43,$41,$4D,$50,$53,$49,$54
        .BYTE $45,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $80,$95,$80,$91,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$57,$48,$45,$54,$48
        .BYTE $45,$52,$5B,$59,$4F,$55,$5B,$53
        .BYTE $55,$43,$43,$45,$45,$44,$5B,$4F
        .BYTE $52,$5B,$4E,$4F,$54,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$80,$91,$80,$91
        .BYTE $5B,$5B,$5B,$5B,$49,$53,$5B,$55
        .BYTE $50,$5B,$54,$4F,$5B,$59,$4F,$55
        .BYTE $5B,$5B,$5B,$5B,$80,$81,$80,$91
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $80,$91,$FF,$91,$FE,$91,$FF,$01
        .BYTE $0B,$09,$FF,$02,$01,$FF,$05,$20
        .BYTE $20,$20,$49,$4E,$53,$54,$52,$55
        .BYTE $43,$54,$49,$4F,$4E,$53,$20,$FF
        .BYTE $00,$FF,$01,$00,$17,$FF
aCC7A   .BYTE $05,$FF,$02
aCC7D   .BYTE $00
fCC7E   .BYTE $5B
fCC7F   .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$5B
        .BYTE $5B,$5B,$5B,$5B,$5B,$5B,$5B,$FF
        .BYTE $00,$FF,$00,$00,$00,$00,$00,$FF
        .BYTE $03,$20,$01,$FF,$04,$FF,$00,$FF
        .BYTE $01,$00,$17,$FF,$02
aCCBC   .BYTE $06
aCCBD   .BYTE $5B
aCCBE   .BYTE $37,$5C
fCCC0   .BYTE $5C,$5C,$5C,$5C,$5C,$5C,$5C,$5C
        .BYTE $5C,$5C,$5B
fCCCB   .BYTE $30
fCCCC   .BYTE $37,$34,$30,$30,$30,$FF,$00
aCCD3   .BYTE $01
aCCD4   .BYTE $00
sCCD5   LDY aCD72
        LDX aCCD3
        CPX #$01     ;#%00000001
        BNE bCCE1
        LDX #$0D     ;#%00001101
bCCE1   DEX 
        STX aCCD3
        LDA fC6BA,X
        STA aCCBC
        LDX #$00     ;#%00000000
        TYA 
        CLC 
        ADC #$01     ;#%00000001
bCCF1   SEC 
        SBC #$0A     ;#%00001010
        BCC bCCF9
        INX 
        BNE bCCF1
bCCF9   ADC #$0A     ;#%00001010
        CLC 
        ADC #$30     ;#%00110000
        STA aCCBE
        CPX #$00     ;#%00000000
        BNE bCD0D
        LDA #$5B     ;#%01011011
        STA aCCBD
        JMP jCD14

bCD0D   TXA 
        CLC 
        ADC #$30     ;#%00110000
        STA aCCBD
jCD14   LDA #$00     ;#%00000000
        STA aFE
        STA aFF
        LDA fB41A,Y
        TAX 
        ASL 
        STA aC19C
        ASL 
        ROL aFF
        ASL 
        ROL aFF
        ADC aC19C
        BCC bCD2F
        INC aFF
bCD2F   CLC 
        ADC #$F0     ;#%11110000
        STA aFE
        LDA aFF
        ADC #$B0     ;#%10110000
        STA aFF
        LDY #$09     ;#%00001001
bCD3C   LDA (pFE),Y
        STA fCCC0,Y
        DEY 
        BPL bCD3C
        TXA 
        STA aC19C
        ASL 
        CLC 
        ADC aC19C
        TAY 
        LDX #$00     ;#%00000000
bCD50   LDA fB000,Y
        AND #$0F     ;#%00001111
        CLC 
        ADC #$30     ;#%00110000
        STA fCCCC,X
        LDA fB000,Y
        AND #$F0     ;#%11110000
        LSR 
        LSR 
        LSR 
        LSR 
        CLC 
        ADC #$30     ;#%00110000
        STA fCCCB,X
        INY 
        INX 
        INX 
        CPX #$06     ;#%00000110
        BNE bCD50
        RTS 

aCD72   .BYTE $06
sCD73   LDA aCF0E
        BNE bCD79
        RTS 

bCD79   LDY #$00     ;#%00000000
bCD7B   LDA f41B8,Y
        STA f4190,Y
        LDA fD9B8,Y
        STA fD990,Y
        LDA f41E0,Y
        STA f41B8,Y
        LDA fD9E0,Y
        STA fD9B8,Y
        LDA f4208,Y
        STA f41E0,Y
        LDA fDA08,Y
        STA fD9E0,Y
        LDA f4230,Y
        STA f4208,Y
        LDA fDA30,Y
        STA fDA08,Y
        LDA f4258,Y
        STA f4230,Y
        LDA fDA58,Y
        STA fDA30,Y
        LDA f4280,Y
        STA f4258,Y
        LDA fDA80,Y
        STA fDA58,Y
        LDA f42A8,Y
        STA f4280,Y
        LDA fDAA8,Y
        STA fDA80,Y
        LDA f42D0,Y
        STA f42A8,Y
        LDA fDAD0,Y
        STA fDAA8,Y
        LDA f42F8,Y
        STA f42D0,Y
        INY 
        CPY #$28     ;#%00101000
        BNE bCD7B
        LDY #$00     ;#%00000000
bCDE8   LDA fDAF8,Y
        STA fDAD0,Y
        LDA f4320,Y
        STA f42F8,Y
        LDA fDB20,Y
        STA fDAF8,Y
        LDA f4348,Y
        STA f4320,Y
        LDA fDB48,Y
        STA fDB20,Y
        LDA f4370,Y
        STA f4348,Y
        LDA fDB70,Y
        STA fDB48,Y
        LDA f4398,Y
        STA f4370,Y
        LDA fDB98,Y
        STA fDB70,Y
        LDA f43C0,Y
        STA f4398,Y
        LDA fDBC0,Y
        STA fDB98,Y
        INY 
        CPY #$28     ;#%00101000
        BNE bCDE8
        RTS 

sCE30   SEI 
        LDA #$71     ;#%01110001
        STA $FFFE    ;IRQ
        LDA #$CE     ;#%11001110
        STA aFFFF    ;IRQ
        LDA #$C8     ;#%11001000
        STA $D012    ;Raster Position
        LDA #$1B     ;#%00011011
        STA $D011    ;VIC Control Register 1
        LDA #$01     ;#%00000001
        STA $D01A    ;VIC Interrupt Mask Register (IMR)
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA #$7F     ;#%01111111
        STA $D019    ;VIC Interrupt Request Register (IRR)
        LDA #>p35    ;#%00000000
        STA a02
        LDA #<p35    ;#%00110101
        STA a01
        CLI 
        RTS 

        LDA #$36     ;#%00110110
        STA a01
        JMP $FE66

        LDA #$5F     ;#%01011111
        STA $FFFA    ;NMI
        LDA #$CE     ;#%11001110
        STA $FFFB    ;NMI
        RTS 

        PHA 
        TYA 
        PHA 
        TXA 
        PHA 
        LDA #$01     ;#%00000001
        STA $D019    ;VIC Interrupt Request Register (IRR)
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
aCE87   =*+$01
aCE88   =*+$02
        JSR sCEC1
        INC a02
        LDA a02
        CMP #$04     ;#%00000100
        BNE bCE95
        LDA #$00     ;#%00000000
        STA a02
bCE95   ASL 
        TAX 
        LDA fCEA9,X
        STA aCE87
        LDA fCEAA,X
        STA aCE88
        PLA 
        TAX 
        PLA 
        TAY 
        PLA 
        RTI 

fCEA9   .BYTE $B1
fCEAA   .BYTE $CE,$C1,$CE,$D4,$CE,$E7,$CE
        LDA #$1B     ;#%00011011
        STA $D011    ;VIC Control Register 1
        LDA #$08     ;#%00001000
        STA $D016    ;VIC Control Register 2
        LDA #$81     ;#%10000001
        STA $D012    ;Raster Position
        RTS 

sCEC1   LDA #$18     ;#%00011000
        STA $D016    ;VIC Control Register 2
        LDA #$50     ;#%01010000
        ORA aCF0D
        STA $D011    ;VIC Control Register 1
        LDA #$89     ;#%10001001
        STA $D012    ;Raster Position
        RTS 

        LDA $D011    ;VIC Control Register 1
        AND #$3F     ;#%00111111
        STA $D011    ;VIC Control Register 1
        LDA #$08     ;#%00001000
        STA $D016    ;VIC Control Register 2
        LDA #$E9     ;#%11101001
        STA $D012    ;Raster Position
        RTS 

        LDA #$18     ;#%00011000
        STA $D016    ;VIC Control Register 2
        LDA #$5B     ;#%01011011
        STA $D011    ;VIC Control Register 1
        INC aCF0C
        LDA #$00     ;#%00000000
        STA $D012    ;Raster Position
        LDA aCF0D
        SEC 
        SBC #$01     ;#%00000001
        AND #$07     ;#%00000111
aCF01   STA aCF0D
        CMP #$02     ;#%00000010
        BNE bCF0B
        INC aCF0E
bCF0B   RTS 

aCF0C   .BYTE $00
aCF0D   .BYTE $07
aCF0E   .BYTE $00
fCF0F   .BYTE $00,$00,$00,$00
fCF13   .BYTE $00,$20,$05,$00
jCF17   LDX #$03     ;#%00000011
        LDA #$81     ;#%10000001
        STA $DD0E    ;CIA2: CIA Control Register A
        LDA #$08     ;#%00001000
        STA $DD0F    ;CIA2: CIA Control Register B
bCF23   LDA fCF0F,X
        STA $DD08,X  ;CIA2: Time-of-Day Clock: 1/10 Seconds
        DEX 
        BPL bCF23
        LDX #$03     ;#%00000011
        LDA #$80     ;#%10000000
        STA $DD0F    ;CIA2: CIA Control Register B
bCF33   LDA fCF13,X
        STA $DD08,X  ;CIA2: Time-of-Day Clock: 1/10 Seconds
        DEY 
        DEX 
        BPL bCF33
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
        .BYTE $3C,$66,$6E,$6E,$60,$62,$3C,$00
        .BYTE $0C,$0C,$2C,$26,$5E,$46,$EE,$00
        .BYTE $EC,$66,$66,$6C,$66,$66,$EC,$00
        .BYTE $2E,$62,$E0,$E0,$E0,$62,$2E,$00
        .BYTE $E8,$6C,$66,$66,$66,$6C,$E8,$00
        .BYTE $EE,$66,$60,$6C,$60,$66,$EE,$00
        .BYTE $EE,$66,$60,$6C,$60,$60,$F0,$00
        .BYTE $2E,$66,$E0,$EE,$E6,$66,$2C,$00
        .BYTE $F6,$66,$66,$6E,$66,$66,$F6,$00
        .BYTE $3C,$18,$18,$18,$18,$18,$3C,$00
        .BYTE $1E,$0C,$0C,$0C,$6C,$6C,$38,$00
        .BYTE $F6,$64,$68,$6C,$6E,$66,$F6,$00
        .BYTE $F0,$60,$60,$60,$62,$66,$FE,$00
        .BYTE $C6,$EE,$7E,$B6,$86,$86,$CE,$00
        .BYTE $66,$72,$3A,$5E,$4E,$46,$E6,$00
        .BYTE $2C,$66,$66,$66,$66,$66,$2C,$00
        .BYTE $EC,$66,$66,$6C,$60,$60,$F0,$00
        .BYTE $2C,$66,$66,$66,$66,$2C,$0E,$00
        .BYTE $EC,$66,$66,$6C,$68,$64,$F6,$00
        .BYTE $2E,$66,$60,$3C,$06,$66,$6C,$00
        .BYTE $7E,$5A,$18,$18,$18,$18,$18,$00
        .BYTE $F6,$62,$62,$62,$62,$62,$2C,$00
        .BYTE $F6,$62,$62,$62,$22,$3C,$18,$00
        .BYTE $E6,$C2,$C2,$D2,$DA,$EC,$C6,$00
        .BYTE $CE,$CC,$68,$30,$58,$4C,$CE,$00
        .BYTE $E6,$62,$34,$18,$18,$18,$3C,$00
        .BYTE $76,$46,$0C,$18,$30,$66,$6E,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $6C,$FE,$FE,$FE,$7C,$38,$10,$00
        .BYTE $F4,$86,$86,$E5,$85,$84,$F4,$00
        .BYTE $B8,$A4,$A4,$A4,$A4,$A4,$B8,$00
        .BYTE $FF,$81,$81,$81,$81,$81,$81,$FF
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $F4,$94,$94,$F4,$A4,$94,$97,$00
        .BYTE $B8,$A4,$A4,$B8,$A4,$A4,$B8,$00
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
        .BYTE $2C,$66,$66,$66,$66,$66,$2C,$00
        .BYTE $38,$18,$18,$18,$18,$18,$3C,$00
        .BYTE $2C,$66,$06,$0C,$30,$06,$7E,$00
        .BYTE $34,$66,$06,$14,$06,$66,$34,$00
        .BYTE $06,$16,$26,$46,$7F,$06,$0F,$00
        .BYTE $7E,$18,$40,$6C,$06,$66,$6C,$00
        .BYTE $2C,$66,$60,$6C,$66,$66,$2C,$00
        .BYTE $7E,$60,$04,$0C,$18,$18,$18,$00
        .BYTE $2C,$66,$66,$2C,$66,$66,$2C,$00
        .BYTE $2C,$66,$66,$2E,$06,$66,$2C,$00
        .BYTE $00,$00,$18,$00,$00,$18,$00,$00
        .BYTE $18,$08,$10,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$18,$18,$00
        .BYTE $24,$24,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$18,$08,$10
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $01,$01,$05,$0C,$0C,$0C,$0C,$18
        .BYTE $E0,$E0,$E0,$F0,$F0,$F0,$78,$78
        .BYTE $18,$18,$33,$30,$30,$30,$78,$00
        .BYTE $78,$3C,$FC,$3C,$1E,$1E,$3F,$00
        .BYTE $7D,$3C,$3C,$3C,$3C,$3C,$3C,$3C
        .BYTE $F8,$3C,$1E,$1E,$1E,$1E,$3C,$F8
        .BYTE $3C,$3C,$3C,$3C,$3C,$3C,$7D,$00
        .BYTE $3C,$1E,$1E,$1E,$1E,$3C,$F8,$00
        .BYTE $0D,$18,$38,$38,$78,$78,$78,$78
        .BYTE $EC,$7C,$3C,$1C,$00,$00,$00,$00
        .BYTE $78,$78,$78,$38,$38,$18,$0D,$00
        .BYTE $00,$00,$00,$1C,$1C,$78,$E0,$00
        .BYTE $7D,$3C,$3C,$3C,$3C,$3C,$3C,$3C
        .BYTE $F8,$3E,$1E,$0F,$0F,$0F,$0F,$0F
        .BYTE $3C,$3C,$3C,$3C,$3C,$3C,$7D,$00
        .BYTE $0F,$0F,$0F,$0F,$1E,$3E,$F8,$00
        .BYTE $7D,$3C,$3C,$3C,$3C,$3C,$3C,$3D
        .BYTE $FE,$3E,$0E,$06,$00,$20,$60,$E0
        .BYTE $3D,$3C,$3C,$3C,$3C,$3C,$7D,$00
        .BYTE $E0,$60,$20,$06,$0E,$3E,$FE,$00
        .BYTE $7D,$3C,$3C,$3C,$3C,$3C,$3C,$3D
        .BYTE $FE,$3E,$0E,$06,$00,$20,$60,$E0
        .BYTE $3C,$3C,$3C,$3C,$3C,$3C,$7E,$00
        .BYTE $60,$20,$00,$00,$00,$00,$00,$00
        .BYTE $0D,$18,$38,$38,$78,$78,$78,$78
        .BYTE $EC,$7C,$3C,$1C,$00,$00,$00,$00
        .BYTE $78,$78,$78,$38,$38,$18,$0D,$00
        .BYTE $7E,$3C,$3C,$3C,$3C,$78,$F0,$00
        .BYTE $7C,$3C,$3C,$3C,$3C,$3C,$3C,$3D
        .BYTE $7E,$3C,$3C,$3C,$3C,$3C,$3C,$FC
        .BYTE $3C,$3C,$3C,$3C,$3C,$3C,$7E,$00
        .BYTE $3C,$3C,$3C,$3C,$3C,$3C,$7E,$00
        .BYTE $07,$03,$03,$03,$03,$03,$03,$03
        .BYTE $E0,$C0,$C0,$C0,$C0,$C0,$C0,$C0
        .BYTE $03,$03,$03,$03,$03,$03,$07,$00
        .BYTE $C0,$C0,$C0,$C0,$C0,$C0,$E0,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $7E,$3C,$3C,$3C,$3C,$3C,$3C,$3C
        .BYTE $00,$00,$00,$1E,$3E,$3E,$1F,$00
        .BYTE $3C,$3C,$3C,$3C,$3C,$38,$70,$00
        .BYTE $7C,$3C,$3C,$3C,$3C,$3D,$3D,$3D
        .BYTE $3C,$18,$30,$60,$C0,$C0,$C0,$E0
        .BYTE $3D,$3C,$3C,$3C,$3C,$3C,$7E,$00
        .BYTE $E0,$F0,$F0,$78,$78,$3C,$7E,$00
        .BYTE $7E,$3C,$3C,$3C,$3C,$3C,$3C,$3C
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $3C,$3C,$3C,$3C,$3C,$3C,$7E,$00
        .BYTE $00,$00,$00,$06,$0E,$3E,$FE,$00
        .BYTE $7E,$1E,$1F,$2F,$2F,$2F,$37,$37
        .BYTE $3F,$3E,$5E,$5E,$5E,$DE,$DE,$DE
        .BYTE $37,$33,$33,$33,$31,$31,$78,$00
        .BYTE $DE,$DE,$DE,$DE,$9E,$9E,$BF,$00
        .BYTE $7F,$1F,$2F,$2F,$37,$37,$33,$33
        .BYTE $0F,$06,$86,$86,$C6,$C6,$E6,$E6
        .BYTE $31,$31,$30,$30,$30,$30,$78,$00
        .BYTE $F6,$F6,$FA,$FA,$7C,$7C,$3E,$00
        .BYTE $07,$1E,$3C,$3C,$78,$78,$78,$78
        .BYTE $70,$3C,$1E,$1E,$0F,$0F,$0F,$0F
        .BYTE $78,$78,$78,$3C,$3C,$1E,$07,$00
        .BYTE $0F,$0F,$0F,$1E,$1E,$3C,$70,$00
        .BYTE $7D,$3C,$3C,$3C,$3C,$3C,$3C,$3D
        .BYTE $F8,$3C,$1E,$1E,$1E,$1E,$3C,$F8
        .BYTE $3C,$3C,$3C,$3C,$3C,$3C,$7E,$00
        .BYTE $00,$00,$00,$00,$00,$00
fD3FE   .BYTE $00
fD3FF   .BYTE $00,$07,$1E,$3C,$3C,$78,$78,$78
        .BYTE $78,$70,$3C,$1E,$1E,$0F,$0F,$0F
        .BYTE $0F,$78,$78,$78,$3C,$3C,$1E,$07
        .BYTE $00,$0F,$0F,$0F,$9E,$DE,$7C,$7E
        .BYTE $00,$7D,$3C,$3C,$3C,$3C,$3C,$3C
        .BYTE $3D,$F8,$3C,$1E,$1E,$1E,$1E,$3C
        .BYTE $F8,$3C,$3C,$3C,$3C,$3C,$3C,$7E
        .BYTE $00,$3C,$1E,$1E,$1E,$1E,$1F,$0E
        .BYTE $00,$1F,$7C,$F8,$F8,$FC,$FF,$7F
        .BYTE $3F,$7F,$1F,$07,$03,$00,$80,$F0
        .BYTE $FC,$07,$00,$00,$60,$70,$7C,$7F
        .BYTE $00,$FE,$FF,$1F,$0F,$0F,$1E,$78
        .BYTE $00,$7B,$7B,$73,$63,$03,$03,$03
        .BYTE $03,$DE,$DE,$CE,$C6,$C0,$C0,$C0
        .BYTE $C0,$03,$03,$03,$03,$03,$03,$07
        .BYTE $00,$C0,$C0,$C0,$C0,$C0,$C0,$E0
        .BYTE $00,$7E,$3C,$3C,$3C,$3C,$3C,$3C
        .BYTE $3C,$0F,$06,$06,$06,$06,$06,$06
        .BYTE $06,$3C,$3C,$3C,$3C,$3C,$1E,$0F
        .BYTE $00,$06,$06,$06,$06,$06,$0E,$BC
        .BYTE $00,$7F,$3E,$3E,$1F,$1F,$1F,$0F
        .BYTE $0F,$0F,$06,$06,$06,$06,$0C,$8C
        .BYTE $8C,$0F,$07,$07,$07,$03,$03,$00
        .BYTE $00,$8C,$D8,$D8,$D8,$E0,$E0,$E0
        .BYTE $00,$FD,$79,$79,$79,$7B,$7B,$7B
        .BYTE $7B,$1E,$8C,$8C,$8C,$CC,$CC,$CC
        .BYTE $EC,$7B,$7B,$7B,$7A,$7A,$7A,$FA
        .BYTE $00,$EC,$EC,$F4,$F4,$F4,$78,$78
        .BYTE $00,$7F,$1F,$0F,$0F,$07,$07,$03
        .BYTE $03,$8F,$06,$8C,$98,$D0,$C0,$E0
        .BYTE $E0,$01,$05,$0C,$18,$30,$60,$E0
        .BYTE $00,$F0,$F0,$F8,$F8,$7C,$7C,$FE
        .BYTE $00,$7E,$3E,$1F,$1F,$0F,$0F,$07
        .BYTE $07,$0F,$06,$0C,$0C,$98,$D8,$D0
        .BYTE $D0,$03,$03,$03,$03,$03,$03,$07
        .BYTE $00,$C0,$C0,$C0,$C0,$C0,$C0,$E0
        .BYTE $00,$7F,$7C,$70,$60,$01,$01,$03
        .BYTE $03,$7C,$7C,$F8,$F8,$F0,$F0,$E0
        .BYTE $E0,$07,$07,$0F,$0F,$1F,$1F,$3E
        .BYTE $00,$C0,$C0,$80,$83,$07,$1F,$7F
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$01,$03,$03,$01
        .BYTE $00,$00,$00,$00,$80,$C0,$C0,$80
        .BYTE $00,$00,$1C,$3E,$33,$63,$67,$67
        .BYTE $67,$00,$38,$7C,$DC,$BE,$FE,$FE
        .BYTE $FE,$37,$37,$1B,$0D,$07,$03,$01
        .BYTE $00,$FC,$FC,$F8,$F0,$E0,$C0,$80
        .BYTE $00,$07,$1E,$3C,$3C,$78,$78,$78
        .BYTE $78,$70,$3C,$1E,$1E,$0F,$0F,$0F
        .BYTE $0F,$78,$78,$78,$3C,$3C,$1E,$07
        .BYTE $00,$0F,$0F,$0F,$1E,$1E,$3C,$70
        .BYTE $00,$07,$03,$03,$03,$03,$03,$03
        .BYTE $03,$C0,$C0,$C0,$C0,$C0,$C0,$C0
        .BYTE $C0,$03,$03,$03,$03,$03,$03,$07
        .BYTE $00,$C0,$C0,$C0,$C0,$C0,$C0,$E0
        .BYTE $00,$07,$18,$38,$38,$00,$00,$00
        .BYTE $00,$78,$3C,$1E,$1E,$1E,$1E,$3C
        .BYTE $F8,$0F,$18,$30,$03,$3F,$7F,$38
        .BYTE $00,$C0,$00,$00,$C6,$FE,$FC,$18
        .BYTE $00,$07,$18,$38,$38,$00,$00,$00
        .BYTE $00,$78,$3C,$1E,$1E,$1E,$1E,$3C
        .BYTE $F8,$00,$00,$00,$38,$38,$18,$07
        .BYTE $00,$3C,$1E,$1E,$1E,$1E,$3C,$78
        .BYTE $00,$00,$01,$03,$06,$0C,$18,$30
        .BYTE $3F,$9C,$BC,$3C,$3C,$3C,$3C,$3C
        .BYTE $BF,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$3C,$3C,$3C,$3C,$3C,$3C,$7E
        .BYTE $00,$3C,$3F,$3F,$31,$30,$30,$38
        .BYTE $1F,$0E,$FC,$F0,$E0,$00,$00,$00
        .BYTE $78,$00,$00,$00,$38,$38,$1C,$07
        .BYTE $00,$3C,$1E,$1E,$1E,$1E,$3C,$78
        .BYTE $00,$05,$18,$38,$38,$78,$78,$78
        .BYTE $79,$E0,$38,$1C,$1C,$00,$00,$00
        .BYTE $F8,$7B,$78,$78,$38,$38,$18,$05
        .BYTE $00,$3C,$1E,$1E,$1E,$1E,$3C,$F8
        .BYTE $00,$7F,$7C,$70,$60,$01,$01,$03
        .BYTE $03,$7C,$7C,$F8,$F8,$F0,$F0,$E0
        .BYTE $E0,$07,$07,$0F,$0F,$1F,$1F,$3E
        .BYTE $00,$C0,$C0,$80,$80,$00,$00,$00
        .BYTE $00,$1F,$3C,$78,$78,$78,$78,$3C
        .BYTE $1F,$78,$3C,$1E,$1E,$1E,$1E,$3C
        .BYTE $78,$3C,$78,$78,$78,$78,$3C,$1F
        .BYTE $00,$3C,$1E,$1E,$1E,$1E,$3C,$78
        .BYTE $00,$1F,$3C,$78,$78,$78,$78,$3C
        .BYTE $1F,$A0,$18,$1C,$1C,$1E,$1E,$1E
        .BYTE $9E,$00,$00,$00,$38,$38,$18,$07
        .BYTE $00,$1E,$1E,$1E,$1C,$1C,$18,$A0
        .BYTE $00,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$00,$00,$00,$00,$00,$00,$00
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
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$00,$00,$00,$00
        .BYTE $00
fD800   .BYTE $FD,$2D,$FD,$FD,$FD
fD805   .BYTE $FD,$FD,$FD,$0D,$CD,$FD,$FD,$0D
        .BYTE $FD,$0D,$0D,$FD,$FD,$FD,$FD,$FD
        .BYTE $0D,$FD,$FD,$FD,$2D,$FD,$2D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$0D
        .BYTE $FD,$FD,$0D,$FD,$0D,$FD,$FD,$FD
fD82D   .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $FD,$FD,$0D,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$2D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD
fD850   .BYTE $FD,$FD,$FD,$0D,$0D,$6D,$FD,$FD
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
fD8C8   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
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
fD940   .BYTE $FD,$1D,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$2D,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$0D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$FD,$0D,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$0D,$FD,$0D,$FD
        .BYTE $FD,$FD,$9D,$2D,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$1D,$FD,$FD,$FD
        .BYTE $FD,$0D,$2D,$FD,$0D,$FD,$FD,$FD
fD990   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$0D,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$9D,$FD,$FD,$FD,$2D
fD9B8   .BYTE $FD,$2D,$FD,$FD,$2D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$0D,$FD
        .BYTE $FD,$CD,$FD,$2D,$FD,$FD,$FD,$FD
        .BYTE $1D,$FD,$FD,$FD,$9D,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
fD9E0   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$0D
        .BYTE $FD,$FD,$FD,$2D,$FD,$FD,$0D,$FD
        .BYTE $9D,$FD,$FD,$0D,$FD,$2D,$FD,$2D
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$0D,$FD
        .BYTE $FD,$FD,$FD,$6D,$2D,$FD,$FD,$FD
fDA08   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $FD,$1D,$FD,$1D,$FD,$6D,$6D,$0D
        .BYTE $FD,$FD,$FD,$FD,$0D,$2D,$0D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$1D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
fDA30   .BYTE $FD,$0D,$FD,$0D,$FD,$FD,$FD,$FD
        .BYTE $2D,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $9D,$9D,$2D,$1D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$CD,$FD,$FD,$FD
fDA58   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$1D
        .BYTE $FD,$1D,$FD,$FD,$FD,$0D,$FD,$FD
        .BYTE $FD,$0D,$FD,$FD,$FD,$0D,$FD,$0D
fDA80   .BYTE $FD,$FD,$2D,$FD,$FD,$FD,$FD,$1D
        .BYTE $FD,$FD,$FD,$2D,$FD,$CD,$FD,$2D
        .BYTE $FD,$2D,$FD,$2D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$2D,$FD,$2D,$6D
        .BYTE $FD,$FD,$FD,$9D,$0D,$FD,$FD,$FD
fDAA8   .BYTE $FD,$6D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $2D,$FD,$1D,$FD,$FD,$FD,$6D,$FD
        .BYTE $1D,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $0D,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$2D,$FD,$FD,$FD,$FD
fDAD0   .BYTE $FD,$0D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$1D,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
fDAF8   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$1D,$FD,$FD,$0D,$FD,$FD
        .BYTE $FD,$FD,$FD,$0D,$FD,$FD,$FD,$0D
        .BYTE $FD,$9D,$2D,$FD,$FD,$2D,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$CD
fDB20   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$CD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $2D,$FD,$FD,$2D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$2D
        .BYTE $9D,$1D,$FD,$FD,$FD,$FD,$FD,$FD
fDB48   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$CD,$FD,$FD,$2D
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$0D,$FD
        .BYTE $0D,$FD,$CD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$2D
fDB70   .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$9D,$FD
        .BYTE $FD,$2D,$FD,$0D,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$2D,$2D
        .BYTE $FD,$FD,$FD,$FD,$0D,$FD,$FD,$2D
        .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
fDB98   .BYTE $FD,$2D,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$FD,$FD,$9D,$FD,$FD,$0D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$FD
        .BYTE $FD,$0D,$FD,$2D,$9D,$FD,$2D,$FD
        .BYTE $FD,$FD,$FD,$FD,$FD,$FD,$FD,$6D
fDBC0   .BYTE $0D,$FD,$FD,$FD,$FD,$9D,$FD,$FD
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
        .BYTE $02,$01,$02,$02,$15,$02,$01,$15
        .BYTE $02,$01,$02,$02,$02,$18,$02,$02
        .BYTE $02,$02,$02,$02,$02,$01,$02,$15
        .BYTE $02,$18,$02,$02,$01,$02,$02,$02
        .BYTE $02,$02,$15,$02,$01,$02,$02,$02
        .BYTE $15,$02,$02,$01,$02,$02,$15,$02
        .BYTE $15,$02,$02,$01,$02,$02,$15,$02
        .BYTE $01,$02,$18,$02,$02,$15,$02,$02
        .BYTE $02,$01,$02,$15,$02,$01,$02,$02
        .BYTE $02,$15,$02,$18,$02,$02,$01,$02
        .BYTE $02,$15,$02,$01,$02,$18,$02,$02
        .BYTE $15,$02,$01,$02,$02,$02,$15,$02
        .BYTE $01,$02,$02,$15,$02,$02,$18,$02
        .BYTE $02,$15,$02,$02,$15,$02,$01,$02
        .BYTE $15,$02,$18,$01,$02,$02,$15,$02
        .BYTE $18,$01,$02,$02,$02,$15,$02,$02
        .BYTE $02,$01,$02,$19,$02,$02,$15,$02
        .BYTE $15,$02,$02,$19,$15,$02,$01,$02
        .BYTE $05,$15,$04,$18,$05,$01,$19,$02
        .BYTE $02,$15,$02,$02,$19,$02,$15,$01
        .BYTE $15,$04,$05,$15,$05,$15,$19,$18
        .BYTE $15,$18,$19,$03,$34,$03,$15,$02
        .BYTE $05,$05,$05,$05,$05,$01,$15,$02
        .BYTE $02,$02,$02,$02,$35,$15,$19,$02
        .BYTE $01,$15,$02,$02,$18,$02,$01,$02
        .BYTE $02,$15,$02,$19,$02,$01,$02,$15
        .BYTE $18,$02,$01,$02,$01,$02,$15,$02
        .BYTE $18,$19,$15,$02,$02,$18,$01,$15
        .BYTE $02,$01,$02,$18,$15,$02,$01,$02
        .BYTE $19,$18,$15,$02,$15,$01,$02,$02
        .BYTE $05,$04,$18,$19,$18,$02,$15,$02
        .BYTE $01,$15,$18,$19,$02,$15,$02,$15
        .BYTE $05,$05,$04,$15,$18,$02,$15,$19
        .BYTE $18,$19,$15,$01,$05,$05,$04,$04
        .BYTE $05,$15,$21,$1D,$1D,$1D,$1A,$1B
        .BYTE $1D,$1D,$1D,$1D,$1F,$19,$15,$15
        .BYTE $15,$00,$23,$30,$02,$02,$02,$02
        .BYTE $29,$02,$02,$30,$25,$02,$02,$02
        .BYTE $04,$18,$23,$02,$32,$02,$07,$02
        .BYTE $02,$2B,$29,$02,$25,$02,$02,$02
        .BYTE $05,$15,$23,$15,$02,$2D,$02,$02
        .BYTE $02,$02,$2B,$02,$25,$02,$04,$05
        .BYTE $15,$05,$23,$02,$2D,$02,$02,$02
        .BYTE $02,$02,$02,$2B,$25,$02,$02,$02
        .BYTE $19,$15,$23,$02,$02,$02,$02,$02
        .BYTE $02,$3E,$02,$02,$25,$02,$02,$02
        .BYTE $00,$02,$23,$05,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$27,$02,$02,$02
        .BYTE $05,$02,$23,$02,$06,$02,$07,$02
        .BYTE $02,$08,$02,$15,$25,$02,$02,$02
        .BYTE $02,$02,$23,$07,$42,$06,$02,$02
        .BYTE $02,$02,$08,$02,$25,$02,$02,$02
        .BYTE $02,$02,$23,$30,$02,$15,$06,$08
        .BYTE $02,$15,$02,$30,$27,$02,$02,$02
        .BYTE $02,$02,$19,$05,$04,$18,$04,$05
        .BYTE $15,$04,$05,$15,$19,$02,$02,$02
        .BYTE $05,$04,$05,$04,$15,$00,$15,$05
        .BYTE $04,$18,$05,$04,$19,$04,$05,$05
        .BYTE $04,$05,$04,$15,$18,$01,$05,$04
        .BYTE $00,$04,$05,$15,$01,$15,$04,$05
        .BYTE $05,$05,$04,$01,$19,$04,$05,$04
        .BYTE $18,$19,$15,$04,$05,$04,$05,$15
        .BYTE $04,$04,$00,$05,$05,$04,$01,$01
        .BYTE $15,$18,$15,$19,$05,$04,$04,$05
        .BYTE $05,$05,$05,$15,$04,$15,$05,$05
        .BYTE $04,$05,$05,$04,$04,$05,$05,$05
        .BYTE $05,$05,$05,$05,$04,$15,$04,$04
        .BYTE $04,$04,$15,$04,$05,$05,$05,$05
        .BYTE $15,$04,$15,$04,$00,$18,$19,$01
        .BYTE $05,$04,$01,$00,$04,$04,$05,$05
        .BYTE $05,$05,$04,$15,$04,$18,$19,$18
        .BYTE $15,$01,$00,$04,$05,$05,$04,$15
        .BYTE $04,$05,$04,$00,$15,$19,$01,$05
        .BYTE $04,$05,$15,$01,$01,$04,$05,$04
        .BYTE $18,$02,$19,$02,$01,$02,$18,$02
        .BYTE $02,$19,$02,$00,$02,$00,$04,$05
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $36,$37,$38,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $39,$3A,$3B,$36,$37,$38,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$39,$3A,$3B,$36,$37
        .BYTE $38,$02,$02,$02,$02,$05,$02,$05
        .BYTE $02,$02,$02,$02,$02,$02,$39,$3A
        .BYTE $3B,$36,$37,$38,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$39,$3A,$3B,$36,$37,$38,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$04,$04,$39,$3A,$3B,$36
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$39
        .BYTE $00,$18,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $04,$00,$18,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $05,$05,$04,$15,$19,$18,$01,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $04,$05,$05,$04,$00,$01,$18,$19
        .BYTE $18,$15,$00,$04,$02,$02,$01,$02
        .BYTE $15,$04,$01,$05,$04,$15,$19,$18
        .BYTE $15,$00,$01,$04,$15,$04,$05,$05
        .BYTE $05,$15,$00,$04,$05,$04,$15,$04
        .BYTE $05,$15,$18,$19,$19,$04,$05,$15
        .BYTE $05,$05,$04,$00,$15,$05,$04,$04
        .BYTE $18,$19,$04,$05,$05,$15,$00,$05
        .BYTE $04,$05,$05,$15,$18,$19,$00,$04
        .BYTE $15,$05,$04,$19,$15,$04,$05,$05
        .BYTE $05,$15,$04,$04,$05,$04,$00,$05
        .BYTE $15,$04,$05,$05,$19,$15,$04,$05
        .BYTE $15,$04,$05,$15,$04,$05,$15,$04
        .BYTE $15,$05,$05,$04,$05,$04,$05,$05
        .BYTE $05,$05,$04,$05,$05,$04,$00,$15
        .BYTE $04,$05,$05,$04,$00,$15,$04,$05
        .BYTE $05,$04,$00,$15,$18,$19,$01,$04
        .BYTE $02,$15,$04,$05,$04,$01,$02,$15
        .BYTE $04,$00,$01,$00,$01,$02,$15,$02
        .BYTE $18,$19,$15,$02,$02,$18,$01,$15
        .BYTE $02,$01,$02,$18,$02,$19,$01,$02
        .BYTE $19,$18,$15,$02,$15,$01,$02,$05
        .BYTE $05,$04,$00,$02,$01,$02,$15,$02
        .BYTE $01,$02,$02,$19,$02,$15,$02,$15
        .BYTE $01,$15,$02,$02,$02,$02,$02,$02
        .BYTE $15,$02,$02,$01,$02,$02,$15,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$15,$02
        .BYTE $15,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$15,$02,$18,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $05,$05,$04,$01,$19,$04,$05,$04
        .BYTE $18,$19,$15,$04,$05,$04,$05,$15
        .BYTE $04,$04,$00,$05,$05,$04,$01,$00
        .BYTE $15,$18,$15,$19,$05,$04,$04,$05
        .BYTE $05,$05,$05,$15,$04,$15,$05,$05
        .BYTE $04,$05,$05,$04,$04,$05,$05,$05
        .BYTE $05,$05,$05,$05,$04,$15,$04,$04
        .BYTE $04,$04,$15,$04,$05,$05,$05,$05
        .BYTE $15,$04,$15,$04,$00,$18,$19,$01
        .BYTE $05,$04,$01,$00,$04,$04,$05,$05
        .BYTE $05,$05,$04,$15,$04,$18,$19,$18
        .BYTE $15,$01,$00,$04,$05,$05,$04,$15
        .BYTE $04,$05,$04,$00,$15,$19,$01,$05
        .BYTE $04,$05,$15,$01,$01,$04,$05,$04
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$05,$02,$05,$02,$05,$02,$05
        .BYTE $02,$05,$02,$05,$02,$05,$02,$05
        .BYTE $36,$37,$38,$05,$02,$05,$02,$05
        .BYTE $02,$05,$02,$05,$02,$05,$02,$05
        .BYTE $3F,$3F,$3F,$36,$37,$38,$02,$05
        .BYTE $02,$05,$02,$05,$02,$05,$02,$05
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$36,$37
        .BYTE $38,$05,$02,$05,$02,$05,$02,$05
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$36,$37,$38,$02,$05,$02,$05
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$36,$37,$38,$02
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$36
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $39,$3A,$3B,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $02,$01,$02,$39,$3A,$3B,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $02,$15,$02,$01,$02,$18,$39,$3A
        .BYTE $3B,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $01,$02,$02,$15,$02,$02,$18,$02
        .BYTE $02,$39,$3A,$3B,$3F,$3F,$3F,$3F
        .BYTE $15,$02,$18,$01,$02,$02,$15,$02
        .BYTE $18,$01,$02,$02,$39,$3A,$3B,$3F
        .BYTE $02,$01,$02,$39,$02,$02,$15,$02
        .BYTE $15,$02,$02,$19,$15,$02,$01,$39
        .BYTE $05,$15,$04,$18,$05,$01,$19,$02
        .BYTE $02,$15,$02,$02,$19,$02,$15,$01
        .BYTE $15,$04,$05,$15,$05,$15,$19,$18
        .BYTE $15,$18,$19,$03,$34,$03,$15,$02
        .BYTE $05,$05,$05,$05,$05,$01,$15,$02
        .BYTE $02,$02,$02,$02,$35,$15,$19,$02
        .BYTE $01,$15,$02,$02,$18,$02,$01,$02
        .BYTE $02,$15,$02,$19,$02,$01,$02,$15
        .BYTE $18,$02,$01,$02,$01,$02,$15,$02
        .BYTE $18,$19,$15,$02,$02,$18,$01,$15
        .BYTE $02,$01,$02,$18,$15,$02,$01,$02
        .BYTE $19,$18,$15,$02,$15,$01,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$3C,$02,$02,$02,$02
        .BYTE $40,$40,$40,$40,$40,$40,$40,$40
        .BYTE $40,$40,$40,$3F,$40,$40,$40,$40
        .BYTE $02,$01,$02,$02,$15,$02,$01,$15
        .BYTE $02,$01,$02,$02,$02,$18,$02,$02
        .BYTE $02,$02,$02,$02,$02,$01,$02,$15
        .BYTE $02,$18,$02,$02,$01,$02,$02,$02
        .BYTE $02,$02,$15,$02,$01,$02,$02,$02
        .BYTE $15,$02,$02,$01,$02,$02,$15,$02
        .BYTE $15,$02,$02,$01,$02,$02,$15,$02
        .BYTE $01,$02,$18,$02,$02,$15,$02,$02
        .BYTE $02,$01,$02,$15,$02,$01,$02,$02
        .BYTE $02,$15,$02,$18,$02,$02,$01,$02
        .BYTE $02,$15,$02,$01,$02,$18,$02,$02
        .BYTE $15,$02,$01,$02,$02,$02,$15,$02
        .BYTE $01,$02,$02,$15,$02,$02,$18,$02
        .BYTE $02,$15,$02,$02,$15,$02,$01,$02
        .BYTE $15,$02,$18,$01,$02,$02,$15,$02
        .BYTE $18,$01,$02,$02,$02,$15,$02,$02
        .BYTE $02,$01,$02,$19,$02,$02,$15,$02
        .BYTE $15,$02,$02,$19,$15,$02,$01,$02
        .BYTE $05,$15,$04,$18,$05,$01,$19,$02
        .BYTE $02,$15,$02,$02,$19,$02,$15,$01
        .BYTE $15,$04,$05,$15,$05,$15,$19,$18
        .BYTE $15,$18,$19,$03,$34,$03,$15,$02
        .BYTE $05,$05,$05,$05,$05,$01,$15,$02
        .BYTE $02,$02,$02,$02,$35,$15,$19,$02
        .BYTE $01,$15,$02,$02,$18,$02,$01,$02
        .BYTE $02,$15,$02,$19,$02,$01,$02,$15
        .BYTE $18,$02,$01,$02,$01,$02,$15,$02
        .BYTE $18,$19,$15,$02,$02,$18,$01,$15
        .BYTE $02,$01,$02,$18,$15,$02,$01,$02
        .BYTE $19,$18,$15,$02,$15,$01,$02,$02
        .BYTE $05,$04,$18,$19,$18,$02,$15,$02
        .BYTE $01,$15,$18,$19,$02,$15,$02,$15
        .BYTE $05,$05,$04,$15,$18,$02,$15,$19
        .BYTE $18,$19,$15,$01,$05,$05,$04,$04
        .BYTE $05,$15,$21,$1D,$1D,$1D,$1A,$1B
        .BYTE $1D,$1D,$1D,$1D,$1F,$19,$15,$15
        .BYTE $15,$00,$23,$30,$02,$02,$02,$02
        .BYTE $29,$02,$02,$30,$25,$02,$02,$02
        .BYTE $04,$18,$23,$02,$32,$02,$07,$02
        .BYTE $02,$2B,$29,$02,$25,$02,$02,$02
        .BYTE $05,$15,$23,$15,$02,$2D,$02,$02
        .BYTE $02,$02,$2B,$02,$25,$02,$04,$05
        .BYTE $15,$05,$23,$02,$2D,$02,$02,$02
        .BYTE $02,$02,$02,$2B,$25,$02,$02,$02
        .BYTE $19,$15,$23,$02,$02,$02,$02,$02
        .BYTE $02,$3E,$02,$02,$25,$02,$02,$02
        .BYTE $00,$02,$23,$05,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$27,$02,$02,$02
        .BYTE $05,$02,$23,$02,$06,$02,$07,$02
        .BYTE $02,$08,$02,$15,$25,$02,$02,$02
        .BYTE $02,$02,$23,$07,$20,$06,$02,$02
        .BYTE $02,$02,$08,$02,$25,$02,$02,$02
        .BYTE $02,$02,$23,$30,$02,$15,$06,$08
        .BYTE $02,$15,$02,$30,$27,$02,$02,$02
        .BYTE $02,$02,$19,$05,$04,$18,$04,$05
        .BYTE $15,$04,$05,$15,$19,$02,$02,$02
        .BYTE $05,$04,$05,$04,$15,$00,$15,$05
        .BYTE $04,$18,$05,$04,$19,$04,$05,$05
        .BYTE $04,$05,$04,$15,$18,$01,$05,$04
        .BYTE $00,$04,$05,$15,$01,$15,$04,$05
        .BYTE $05,$05,$04,$01,$19,$04,$05,$04
        .BYTE $18,$19,$15,$04,$05,$04,$05,$15
        .BYTE $04,$04,$00,$05,$05,$04,$01,$01
        .BYTE $15,$18,$15,$19,$05,$04,$04,$05
        .BYTE $05,$05,$05,$15,$04,$15,$05,$05
        .BYTE $04,$05,$05,$04,$04,$05,$05,$05
        .BYTE $05,$05,$05,$05,$04,$15,$04,$04
        .BYTE $04,$04,$15,$04,$05,$05,$05,$05
        .BYTE $15,$04,$15,$04,$00,$18,$19,$01
        .BYTE $05,$04,$01,$00,$04,$04,$05,$05
        .BYTE $05,$05,$04,$15,$04,$18,$19,$18
        .BYTE $15,$01,$00,$04,$05,$05,$04,$15
        .BYTE $04,$05,$04,$00,$15,$19,$01,$05
        .BYTE $04,$05,$15,$01,$01,$04,$05,$04
        .BYTE $18,$02,$19,$02,$01,$02,$18,$02
        .BYTE $02,$19,$02,$00,$02,$00,$04,$05
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $36,$37,$38,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $39,$3A,$3B,$36,$37,$38,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$39,$3A,$3B,$36,$37
        .BYTE $38,$02,$02,$02,$02,$05,$02,$05
        .BYTE $02,$02,$02,$02,$02,$02,$39,$3A
        .BYTE $3B,$36,$37,$38,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$39,$3A,$3B,$36,$37,$38,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$04,$04,$39,$3A,$3B,$36
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$39
        .BYTE $00,$18,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $04,$00,$18,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $05,$05,$04,$15,$19,$18,$01,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $04,$05,$05,$04,$00,$01,$18,$19
        .BYTE $18,$15,$00,$04,$02,$02,$01,$02
        .BYTE $15,$04,$01,$05,$04,$15,$19,$18
        .BYTE $15,$00,$01,$04,$15,$04,$05,$05
        .BYTE $05,$15,$00,$04,$05,$04,$15,$04
        .BYTE $05,$15,$18,$19,$19,$04,$05,$15
        .BYTE $05,$05,$04,$00,$15,$05,$04,$04
        .BYTE $18,$19,$04,$05,$05,$15,$00,$05
        .BYTE $04,$05,$05,$15,$18,$19,$00,$04
        .BYTE $15,$05,$04,$19,$15,$04,$05,$05
        .BYTE $05,$15,$04,$04,$05,$04,$00,$05
        .BYTE $15,$04,$05,$05,$19,$15,$04,$05
        .BYTE $15,$04,$05,$15,$04,$05,$15,$04
        .BYTE $15,$05,$05,$04,$05,$04,$05,$05
        .BYTE $05,$05,$04,$05,$05,$04,$00,$15
        .BYTE $04,$05,$05,$04,$00,$15,$04,$05
        .BYTE $05,$04,$00,$15,$18,$19,$01,$04
        .BYTE $02,$15,$04,$05,$04,$01,$02,$15
        .BYTE $04,$00,$01,$00,$01,$02,$15,$02
        .BYTE $18,$19,$15,$02,$02,$18,$01,$15
        .BYTE $02,$01,$02,$18,$02,$19,$01,$02
        .BYTE $19,$18,$15,$02,$15,$01,$02,$05
        .BYTE $05,$04,$00,$02,$01,$02,$15,$02
        .BYTE $01,$02,$02,$19,$02,$15,$02,$15
        .BYTE $01,$15,$02,$02,$02,$02,$02,$02
        .BYTE $15,$02,$02,$01,$02,$02,$15,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$15,$02
        .BYTE $15,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$15,$02,$18,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$06,$02,$01,$02,$02,$02
        .BYTE $02,$08,$02,$02,$02,$08,$01,$02
        .BYTE $02,$02,$02,$06,$02,$02,$02,$02
        .BYTE $01,$02,$02,$08,$01,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$06,$02,$02
        .BYTE $01,$02,$02,$06,$08,$02,$08,$01
        .BYTE $02,$02,$01,$02,$02,$02,$07,$02
        .BYTE $01,$08,$02,$08,$02,$08,$02,$06
        .BYTE $07,$02,$02,$02,$02,$02,$06,$02
        .BYTE $01,$02,$02,$02,$02,$08,$02,$01
        .BYTE $02,$06,$02,$06,$02,$06,$02,$01
        .BYTE $08,$02,$08,$02,$07,$08,$02,$02
        .BYTE $06,$15,$06,$02,$02,$06,$02,$02
        .BYTE $02,$02,$02,$02,$08,$15,$02,$08
        .BYTE $02,$06,$01,$02,$02,$06,$02,$02
        .BYTE $02,$07,$08,$02,$08,$02,$08,$02
        .BYTE $06,$02,$02,$06,$07,$06,$15,$02
        .BYTE $02,$08,$02,$08,$02,$02,$02,$08
        .BYTE $02,$06,$06,$02,$02,$06,$02,$01
        .BYTE $02,$08,$02,$08,$02,$08,$15,$02
        .BYTE $05,$05,$04,$01,$19,$04,$05,$04
        .BYTE $18,$19,$15,$04,$05,$04,$05,$15
        .BYTE $04,$04,$00,$05,$05,$04,$01,$00
        .BYTE $15,$18,$15,$19,$05,$04,$04,$05
        .BYTE $05,$05,$05,$15,$04,$15,$05,$05
        .BYTE $04,$05,$05,$04,$04,$05,$05,$05
        .BYTE $05,$05,$05,$05,$04,$15,$04,$04
        .BYTE $04,$04,$15,$04,$05,$05,$05,$05
        .BYTE $15,$04,$15,$04,$00,$18,$19,$01
        .BYTE $05,$04,$01,$00,$04,$04,$05,$05
        .BYTE $05,$05,$04,$15,$04,$18,$19,$18
        .BYTE $15,$01,$00,$04,$05,$05,$04,$15
        .BYTE $04,$05,$04,$00,$15,$19,$01,$05
        .BYTE $04,$05,$15,$01,$01,$04,$05,$04
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$05,$02,$05,$02,$05,$02,$05
        .BYTE $02,$05,$02,$05,$02,$05,$02,$05
        .BYTE $36,$37,$38,$05,$02,$05,$02,$05
        .BYTE $02,$05,$02,$05,$02,$05,$02,$05
        .BYTE $3F,$3F,$3F,$36,$37,$38,$02,$05
        .BYTE $02,$05,$02,$05,$02,$05,$02,$05
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$36,$37
        .BYTE $38,$05,$02,$05,$02,$05,$02,$05
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$36,$37,$38,$02,$05,$02,$05
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$36,$37,$38,$02
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$36
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $39,$3A,$3B,$3F,$3F,$3F,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $02,$01,$02,$39,$3A,$3B,$3F,$3F
        .BYTE $3F,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $02,$15,$02,$01,$02,$18,$39,$3A
        .BYTE $3B,$3F,$3F,$3F,$3F,$3F,$3F,$3F
        .BYTE $01,$02,$02,$15,$02,$02,$18,$02
        .BYTE $02,$39,$3A,$3B,$3F,$3F,$3F,$3F
        .BYTE $15,$02,$18,$01,$02,$02,$15,$02
        .BYTE $18,$01,$02,$02,$39,$3A,$3B,$3F
        .BYTE $02,$01,$02,$02,$02,$02,$15,$02
        .BYTE $15,$02,$02,$19,$15,$02,$01,$39
        .BYTE $05,$15,$04,$18,$05,$01,$19,$02
        .BYTE $02,$15,$02,$02,$19,$02,$15,$01
        .BYTE $15,$04,$05,$15,$05,$15,$19,$18
        .BYTE $15,$18,$19,$02,$15,$01,$15,$02
        .BYTE $05,$05,$05,$05,$05,$01,$15,$02
        .BYTE $02,$02,$02,$02,$18,$15,$19,$02
        .BYTE $01,$15,$02,$02,$18,$02,$01,$02
        .BYTE $02,$15,$02,$19,$02,$01,$02,$15
        .BYTE $18,$02,$01,$02,$01,$02,$15,$02
        .BYTE $18,$19,$15,$02,$02,$18,$01,$15
        .BYTE $02,$01,$02,$18,$15,$02,$01,$02
        .BYTE $19,$18,$15,$02,$15,$01,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$02,$02,$02,$02,$02
        .BYTE $02,$02,$02,$3E,$02,$02,$02,$02
        .BYTE $1C,$1C,$1C,$1C,$1C,$1C,$1C,$1C
        .BYTE $1C,$1C,$1C,$1E,$1C,$1C,$1C,$1C
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
pFFBC   .BYTE $00,$00,$00,$00,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
        .BYTE $FF,$FF,$FF,$FF,$FF,$FF

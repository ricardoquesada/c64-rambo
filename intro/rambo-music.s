;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;

INCLUDE_GARBAGE :?= 0

; Addresses:
;       $2ce3   -> $316f
;       $2ceb   -> $2e2b
;       $2cf2   -> $2e31
;       $2dc8   -> $2e27

;
; **** ZP FIELDS ****
;
f10 = $10
f1C = $1C
;
; **** ZP ABSOLUTE ADRESSES ****
;
a00 = $00
a01 = $01
a10 = $10
a11 = $11
a12 = $12
a13 = $13
a14 = $14
a15 = $15
a16 = $16
a17 = $17
a18 = $18
a19 = $19
a1A = $1A
a1B = $1B
a1C = $1C
a1D = $1D
a1E = $1E
a1F = $1F
aF9 = $F9
aFA = $FA
aFD = $FD
aFE = $FE
;
; **** ZP POINTERS ****
;
p10 = $10
p12 = $12
p14 = $14
p16 = $16
pF9 = $F9
pFD = $FD
;
; **** ABSOLUTE ADRESSES ****
;
aFFFE = $FFFE
aFFFF = $FFFF
;
; **** POINTERS ****
;
p0016 = $0016

;        * = $2000

a2001   =*+$01
a2002   =*+$02
s2000   JMP j310B

s2003   JMP j30E3

s2006   JMP j25FA

s2009   LDX a29C8
        LDY a29C9
        STX a29D5
        STY a29D6
s2015   LDA a29C0
        STA a29D7
        LDA a29C1
        STA a29D8
        RTS

s2022   LDX a29EF
        LDY a29F0
        STX a29FC
        STY a29FD
s202E   LDA a29E7
        STA a29FE
        LDA a29E8
        STA a29FF
        RTS

s203B   LDX a2A16
        LDY a2A17
        STX a2A23
        STY a2A24
s2047   LDA a2A0E
        STA a2A25
        LDA a2A0F
        STA a2A26
        RTS

s2054   LDA a29BD
        STA a29D4
        LDA a29BC
        STA a29D3
        LDA a29BB
        STA a29D2
        LDA a29BA
        STA a29D1
        RTS

s206D   LDA a29E4
        STA a29FB
        LDA a29E3
        STA a29FA
        LDA a29E2
        STA a29F9
        LDA a29E1
        STA a29F8
        RTS

s2086   LDA a2A0B
        STA a2A22
        LDA a2A0A
        STA a2A21
        LDA a2A09
        STA a2A20
        LDA a2A08
        STA a2A1F
        RTS

s209F   LDA a19
        LSR A
        BCC b20A8
        DEC a1A
        BEQ b20B6
b20A8   JMP j2231

j20AB   LDA #$03     ;#%00000011
j20AD   CLC
        ADC a10
        STA a10
        BCC b20B6
        INC a11
b20B6   LDY #$00     ;#%00000000
        LDA (p10),Y
        CMP #$C0     ;#%11000000
        BCC b20DE
        AND #$3F     ;#%00111111
        TAX
        LDA f2AE9,X
        STA a20D9
        LDA f2AEA,X
        STA a20DA
        INY
        LDA (p10),Y
        TAX
        STA a16
        INY
        LDA (p10),Y
        STA a17
a20D9   =*+$01
a20DA   =*+$02
        JMP j21B0

b20DB   JMP j215F

b20DE   STA a18
        CMP #$60     ;#%01100000
        BCC b20E6
        SBC #$60     ;#%01100000
b20E6   CMP #$5F     ;#%01011111
        BEQ b20DB
        ADC a291D
        TAX
        LDY #$04     ;#%00000100
b20F0   LDA #$00     ;#%00000000
        STA $D402,Y  ;Voice 1: Pulse Waveform Width - Low-Byte
        LDA f28EA,Y
        STA $D402,Y  ;Voice 1: Pulse Waveform Width - Low-Byte
        DEY
        BPL b20F0
        LDA a28EC
        STA a29CC
        LDY f2A37,X
        LDA f2A90,X
        STA a29CF
        STY a29D0
        STA $D400    ;Voice 1: Frequency Control - Low-Byte
        STY $D401    ;Voice 1: Frequency Control - High-Byte
        LDA a28E5
        STA a29C3
        BEQ b212C
        LDY #$09     ;#%00001001
b2120   LDA f28E2,Y
        STA a29C0,Y
        DEY
        BPL b2120
        JSR s2009
b212C   LDX a28E1
        STX a29BF
        BEQ b2153
        LDY #$0D     ;#%00001101
b2136   LDA f28D4,Y
        STA f29B2,Y
        DEY
        BPL b2136
        TXA
        AND #$08     ;#%00001000
        BEQ b2150
        LDA a18
        CLC
        ADC a291D
        STA a29BC
        STY a29BE
b2150   JSR s2054
b2153   LDX a28EF
        LDY a28F0
        STX a29CD
        STY a29CE
j215F   LDY #$01     ;#%00000001
        LDA (p10),Y
        LDX a18
        CPX #$60     ;#%01100000
        BCS b216D
        TAX
        LDA f28F4,X
b216D   STA a1A
        LDA #$02     ;#%00000010
        CLC
        ADC a10
        STA a10
        BCC b217A
        INC a11
b217A   JMP j2231

        INC a1D
        LDY a1D
        CPY #$08     ;#%00001000
        BEQ b218E
b2185   LDX f2905,Y
        LDA f290D,Y
        JMP j21ED

b218E   LDA a19
        AND #$FE     ;#%11111110
        STA a19
        RTS

        LDX a1D
        CLC
        TYA
        ADC a10
        STA f2905,X
        LDA #$00     ;#%00000000
        ADC a11
        STA f290D,X
        LDA a16
        STA f2915,X
        DEC a1D
        TYA
        JMP j20AD

j21B0   LDX a1D
        DEC f2916,X
        BEQ b21BC
        INX
        TXA
        TAY
        BPL b2185
b21BC   INC a1D
        LDA #$01     ;#%00000001
        JMP j20AD

        LDY #$04     ;#%00000100
        LDX #$1C     ;#%00011100
b21C7   LDA (p16),Y
        STA f28D4,X
        DEX
        DEY
        BPL b21C7
        JMP j20AB

        LDY #$0D     ;#%00001101
        LDX #$0D     ;#%00001101
        BNE b21C7
        LDY #$09     ;#%00001001
        LDX #$17     ;#%00010111
        BNE b21C7
        LDY #$30     ;#%00110000
        LDX #$30     ;#%00110000
        BNE b21C7
        LDY #$09     ;#%00001001
        LDX #$09     ;#%00001001
        BNE b21C7
j21EB   LDA a17
j21ED   STX a10
        STA a11
        JMP b20B6

        LDA #$20     ;#%00100000
        PHA
        LDA #$AA     ;#%10101010
        PHA
TITO
        JMP (p0016)

        LDA #$03     ;#%00000011
b21FF   LDY a1D
        CLC
        ADC a10
        STA f2905,Y
        LDA #$00     ;#%00000000
        ADC a11
        STA f290D,Y
        DEC a1D
        JMP j21EB

        INY
        LDA (p10),Y
        STA a291D
        LDA #$04     ;#%00000100
        BNE b21FF
        STX a291D
        TYA
        JMP j20AD

        STA f28D4,X
        JMP j20AB

        STA f29B2,X
        JMP j20AB

b2230   RTS

j2231   LDX a29CE
        BEQ b2230
        LDA a29CC
        AND #$08     ;#%00001000
        BEQ b2253
        LDA a1A
        CMP a29CD
        BCS b2273
        LDA #$00     ;#%00000000
        STA a29CD
        LDA a29CC
        AND #$F6     ;#%11110110
        STA a29CC
        BNE b2270
b2253   LDA a29CD
        BNE b2266
        DEC a29CE
        BNE b2273
        LDX #$06     ;#%00000110
b225F   STA $D400,X  ;Voice 1: Frequency Control - Low-Byte
        DEX
        BPL b225F
        RTS

b2266   DEC a29CD
        BNE b2273
        LDA a29CC
        AND #$F6     ;#%11110110
b2270   STA $D404    ;Voice 1: Control Register
b2273   LDA a29C3
        BEQ b22D5
        LDA a29C2
        BEQ b2283
        DEC a29C2
        JMP b22D5

b2283   CLC
        LDX a29D5
        LDY a29D6
        LDA a29D7
        BEQ b229F
        TXA
        ADC a29C4
        TAX
        TYA
        ADC a29C5
        TAY
        DEC a29D7
        JMP j22C9

b229F   LDA a29D8
        BEQ b22B4
        TXA
        ADC a29C6
        TAX
        TYA
        ADC a29C7
        TAY
        DEC a29D8
        JMP j22C9

b22B4   LDA a29C3
        AND #$81     ;#%10000001
        BEQ j22C9
        BPL b22C3
        JSR s2009
        JMP b2283

b22C3   JSR s2015
        JMP b2283

j22C9   STX a29D5
        STY a29D6
        STX $D402    ;Voice 1: Pulse Waveform Width - Low-Byte
        STY $D403    ;Voice 1: Pulse Waveform Width - High-Nybble
b22D5   LDA a29BF
        BEQ b22F4
        AND #$08     ;#%00001000
        BNE b22F5
        LDX a29CF
        LDY a29D0
        CLC
        LDA a29BE
        BEQ b2313
        DEC a29BE
        LDA a29BF
        AND #$02     ;#%00000010
        BNE b2357
b22F4   RTS

b22F5   LDX a29BE
        BPL b22FD
        LDX a29BD
b22FD   LDA a29BC
        CLC
        ADC f29B2,X
        DEX
        STX a29BE
        TAY
        LDX f2A90,Y
        LDA f2A37,Y
        JMP j2360

j2312   CLC
b2313   LDA a29D1
        BEQ b2327
        DEC a29D1
        TXA
        ADC f29B2
        TAX
        TYA
        ADC a29B3
        JMP j2360

b2327   LDA a29D2
        BEQ b233B
        DEC a29D2
        TXA
        ADC a29B4
        TAX
        TYA
        ADC a29B5
        JMP j2360

b233B   LDA a29D3
        BEQ b234F
        DEC a29D3
        TXA
        ADC a29B6
        TAX
        TYA
        ADC a29B7
        JMP j2360

b234F   LDA a29D4
        BEQ b236E
        DEC a29D4
b2357   TXA
        ADC a29B8
        TAX
        TYA
        ADC a29B9
j2360   TAY
        STX $D400    ;Voice 1: Frequency Control - Low-Byte
        STY $D401    ;Voice 1: Frequency Control - High-Byte
        STX a29CF
        STY a29D0
        RTS

b236E   JSR s2054
        JMP j2312

s2374   LDA a19
        AND #$02     ;#%00000010
        BEQ b237E
        DEC a1B
        BEQ b238C
b237E   JMP j24E0

j2381   LDA #$03     ;#%00000011
j2383   CLC
        ADC a12
        STA a12
        BCC b238C
        INC a13
b238C   LDY #$00     ;#%00000000
        LDA (p12),Y
        CMP #$C0     ;#%11000000
        BCC b23B4
        AND #$3F     ;#%00111111
        TAX
        LDA f2B25,X
        STA a23AF
        LDA f2B26,X
        STA a23B0
        INY
        LDA (p12),Y
        TAX
        STA a16
        INY
        LDA (p12),Y
        STA a17
a23AF   =*+$01
a23B0   =*+$02
        JMP j24C9

b23B1   JMP j2424

b23B4   STA a18
        CMP #$60     ;#%01100000
        BCC b23BC
        SBC #$60     ;#%01100000
b23BC   CMP #$5F     ;#%01011111
        BEQ b23B1
        ADC a2967
        TAX
        LDY #$04     ;#%00000100
b23C6   LDA #$00     ;#%00000000
        STA $D409,Y  ;Voice 2: Pulse Waveform Width - Low-Byte
        LDA f2934,Y
        STA $D409,Y  ;Voice 2: Pulse Waveform Width - Low-Byte
        DEY
        BPL b23C6
        LDA a2936
        STA a29F3
        LDY f2A37,X
        LDA f2A90,X
        STA a29F6
        STY a29F7
        STA $D407    ;Voice 2: Frequency Control - Low-Byte
        STY $D408    ;Voice 2: Frequency Control - High-Byte
        LDA a292F
        STA a29EA
        BEQ b2402
        LDY #$09     ;#%00001001
b23F6   LDA f292C,Y
        STA a29E7,Y
        DEY
        BPL b23F6
        JSR s2022
b2402   LDX a292B
        STX a29E6
        BEQ b2418
        LDY #$0D     ;#%00001101
b240C   LDA f291E,Y
        STA f29D9,Y
        DEY
        BPL b240C
        JSR s206D
b2418   LDX a2939
        LDY a293A
        STX a29F4
        STY a29F5
j2424   LDY #$01     ;#%00000001
        LDA (p12),Y
        LDX a18
        CPX #$60     ;#%01100000
        BCS b2432
        TAX
        LDA f293E,X
b2432   STA a1B
        LDA #$02     ;#%00000010
        CLC
        ADC a12
        STA a12
        BCC b243F
        INC a13
b243F   JMP j24E0

        INC a1E
        LDY a1E
        CPY #$08     ;#%00001000
        BEQ b2453
b244A   LDX f294F,Y
        LDA f2957,Y
        JMP j24AC

b2453   LDA a19
        AND #$FD     ;#%11111101
        STA a19
        RTS

        LDX a1E
        CLC
        TYA
        ADC a12
        STA f294F,X
        LDA a13
        ADC #$00     ;#%00000000
        STA f2957,X
        LDA a16
        STA f295F,X
        DEC a1E
        TYA
        JMP j2383

        LDX a1E
        DEC f2960,X
        BEQ b2481
        INX
        TXA
        TAY
        BPL b244A
b2481   INC a1E
        LDA #$01     ;#%00000001
        JMP j2383

        LDY #$04     ;#%00000100
        LDX #$1C     ;#%00011100
b248C   LDA (p16),Y
        STA f291E,X
        DEX
        DEY
        BPL b248C
        JMP j2381

        LDY #$0D     ;#%00001101
        LDX #$0D     ;#%00001101
        BNE b248C
        LDY #$09     ;#%00001001
        LDX #$17     ;#%00010111
        BNE b248C
        LDY #$1C     ;#%00011100
        LDX #$1C     ;#%00011100
        BNE b248C
j24AA   LDA a17
j24AC   STX a12
        STA a13
        JMP b238C

        LDA #$03     ;#%00000011
b24B5   LDY a1E
        CLC
        ADC a12
        STA f294F,Y
        LDA a13
        ADC #$00     ;#%00000000
        STA f2957,Y
        DEC a1E
        JMP j24AA

j24C9   INY
        LDA (p12),Y
        STA a2967
        LDA #$04     ;#%00000100
        BNE b24B5
        STA f291E,X
        JMP j2381

        STA f29D9,X
        JMP j2381

b24DF   RTS

j24E0   LDX a29F5
        BEQ b24DF
        LDA a29F3
        AND #$08     ;#%00001000
        BEQ b2502
        LDA a1B
        CMP a29F4
        BCS b2522
        LDA #$00     ;#%00000000
        STA a29F4
        LDA a29F3
        AND #$F6     ;#%11110110
        STA a29F3
        BNE b251F
b2502   LDA a29F4
        BNE b2515
        DEC a29F5
        BNE b2522
        LDX #$06     ;#%00000110
b250E   STA $D407,X  ;Voice 2: Frequency Control - Low-Byte
        DEX
        BPL b250E
        RTS

b2515   DEC a29F4
        BNE b2522
        LDA a29F3
        AND #$F6     ;#%11110110
b251F   STA $D40B    ;Voice 2: Control Register
b2522   LDA a29EA
        BEQ b2584
        LDA a29E9
        BEQ b2532
        DEC a29E9
        JMP b2584

b2532   CLC
        LDX a29FC
        LDY a29FD
        LDA a29FE
        BEQ b254E
        TXA
        ADC a29EB
        TAX
        TYA
        ADC a29EC
        TAY
        DEC a29FE
        JMP j2578

b254E   LDA a29FF
        BEQ b2563
        TXA
        ADC a29ED
        TAX
        TYA
        ADC a29EE
        TAY
        DEC a29FF
        JMP j2578

b2563   LDA a29EA
        AND #$81     ;#%10000001
        BEQ j2578
        BPL b2572
        JSR s2022
        JMP b2532

b2572   JSR s202E
        JMP b2532

j2578   STX a29FC
        STY a29FD
        STX $D409    ;Voice 2: Pulse Waveform Width - Low-Byte
        STY $D40A    ;Voice 2: Pulse Waveform Width - High-Nybble
b2584   LDA a29E6
        BEQ b259F
        LDX a29F6
        LDY a29F7
        CLC
        LDA a29E5
        BEQ b25A1
        DEC a29E5
        LDA a29E6
        AND #$02     ;#%00000010
        BNE b25DD
b259F   RTS

j25A0   CLC
b25A1   LDA a29F8
        BEQ b25B5
        DEC a29F8
        TXA
        ADC f29D9
        TAX
        TYA
        ADC a29DA
        JMP j25E6

b25B5   LDA a29F9
        BEQ b25C9
        DEC a29F9
        TXA
        ADC a29DB
        TAX
        TYA
        ADC a29DC
        JMP j25E6

b25C9   LDA a29FA
        BEQ b25F4
        DEC a29FA
        TXA
        ADC a29DD
        TAX
        TYA
        ADC a29DE
        JMP j25E6

b25DD   TXA
        ADC a29DF
        TAX
        TYA
        ADC a29E0
j25E6   TAY
        STX $D407    ;Voice 2: Frequency Control - Low-Byte
        STY $D408    ;Voice 2: Frequency Control - High-Byte
        STX a29F6
        STY a29F7
        RTS

b25F4   JSR s206D
        JMP j25A0

j25FA   LDA a19
        ORA a29CE
        ORA a29F5
        ORA a2A1C
        RTS

p2606   JSR s209F
        JSR s2374
        JMP j260F

j260F   LDA a19
        AND #$04     ;#%00000100
        BEQ b2619
        DEC a1C
        BEQ b2627
b2619   JMP j2799

j261C   LDA #$03     ;#%00000011
j261E   CLC
        ADC a14
        STA a14
        BCC b2627
        INC a15
b2627   LDY #$00     ;#%00000000
        LDA (p14),Y
        CMP #$C0     ;#%11000000
        BCC b264F
        AND #$3F     ;#%00111111
        TAX
        LDA f2B07,X
        STA a264A
        LDA f2B08,X
        STA a264B
        INY
        LDA (p14),Y
        TAX
        STA a16
        INY
        LDA (p14),Y
        STA a17
a264A   =*+$01
a264B   =*+$02
        JMP j2744

b264C   JMP j26D0

b264F   STA a18
        CMP #$60     ;#%01100000
        BCC b2657
        SBC #$60     ;#%01100000
b2657   CMP #$5F     ;#%01011111
        BEQ b264C
        ADC a29B1
        TAX
        LDY #$04     ;#%00000100
b2661   LDA #$00     ;#%00000000
        STA $D410,Y  ;Voice 3: Pulse Waveform Width - Low-Byte
        LDA f297E,Y
        STA $D410,Y  ;Voice 3: Pulse Waveform Width - Low-Byte
        DEY
        BPL b2661
        LDA a2980
        STA a2A1A
        LDY f2A37,X
        LDA f2A90,X
        STA a2A1D
        STY a2A1E
        STA $D40E    ;Voice 3: Frequency Control - Low-Byte
        STY $D40F    ;Voice 3: Frequency Control - High-Byte
        LDA a2979
        STA a2A11
        BEQ b269D
        LDY #$09     ;#%00001001
b2691   LDA f2976,Y
        STA a2A0E,Y
        DEY
        BPL b2691
        JSR s203B
b269D   LDX a2975
        STX a2A0D
        BEQ b26C4
        LDY #$0D     ;#%00001101
b26A7   LDA f2968,Y
        STA f2A00,Y
        DEY
        BPL b26A7
        TXA
        AND #$08     ;#%00001000
        BEQ b26C1
        LDA a18
        CLC
        ADC a29B1
        STA a2A0A
        STY a2A0C
b26C1   JSR s2086
b26C4   LDX a2983
        LDY a2984
        STX a2A1B
        STY a2A1C
j26D0   LDY #$01     ;#%00000001
        LDA (p14),Y
        LDX a18
        CPX #$60     ;#%01100000
        BCS b26DE
        TAX
        LDA f2988,X
b26DE   STA a1C
        LDA #$02     ;#%00000010
        CLC
        ADC a14
        STA a14
        BCC b26EB
        INC a15
b26EB   JMP j2799

        INC a1F
        LDY a1F
        CPY #$08     ;#%00001000
        BEQ b26FF
b26F6   LDX f2999,Y
        LDA f29A1,Y
        JMP j275E

b26FF   LDA a19
        AND #$FB     ;#%11111011
        STA a19
        RTS

        LDX a1F
        CLC
        TYA
        ADC a14
        STA f2999,X
        LDA #$00     ;#%00000000
        ADC a15
        STA f29A1,X
        LDA a16
        STA f29A9,X
        DEC a1F
        TYA
        JMP j261E

        LDX a1F
        DEC f29AA,X
        BEQ b272D
        INX
        TXA
        TAY
        BPL b26F6
b272D   INC a1F
        LDA #$01     ;#%00000001
        JMP j261E

        LDY #$04     ;#%00000100
        LDX #$1C     ;#%00011100
b2738   LDA (p16),Y
        STA f2968,X
        DEX
        DEY
        BPL b2738
        JMP j261C

j2744   LDY #$1C     ;#%00011100
        LDX #$1C     ;#%00011100
        BNE b2738
        LDY #$0D     ;#%00001101
        LDX #$0D     ;#%00001101
        BNE b2738
        LDY #$09     ;#%00001001
        LDX #$09     ;#%00001001
        BNE b2738
        INY
        LDA (p14),Y
        STA a29B1
j275C   LDA a17
j275E   STX a14
        STA a15
        JMP b2627

        LDA #$03     ;#%00000011
b2767   LDY a1F
        CLC
        ADC a14
        STA f2999,Y
        LDA a15
        ADC #$00     ;#%00000000
        STA f29A1,Y
        DEC a1F
        JMP j275C

        INY
        LDA (p14),Y
        STA a29B1
        LDA #$04     ;#%00000100
        BNE b2767
        STX a29B1
        TYA
        JMP j261E

        STA f2968,X
        JMP j261C

        STA f2A00,X
        JMP j261C

b2798   RTS

j2799   LDX a2A1C
        BEQ b2798
        LDA a2A1A
        AND #$08     ;#%00001000
        BEQ b27BB
        LDA a1C
        CMP a2A1B
        BCS b27DB
        LDA #$00     ;#%00000000
        STA a2A1B
        LDA a2A1A
        AND #$F6     ;#%11110110
        STA a2A1A
        BNE b27D8
b27BB   LDA a2A1B
        BNE b27CE
        DEC a2A1C
        BNE b27DB
        LDX #$06     ;#%00000110
b27C7   STA $D40E,X  ;Voice 3: Frequency Control - Low-Byte
        DEX
        BPL b27C7
        RTS

b27CE   DEC a2A1B
        BNE b27DB
        LDA a2A1A
        AND #$F6     ;#%11110110
b27D8   STA $D412    ;Voice 3: Control Register
b27DB   LDA a2A11
        BEQ b283D
        LDA a2A10
        BEQ b27EB
        DEC a2A10
        JMP b283D

b27EB   CLC
        LDX a2A23
        LDY a2A24
        LDA a2A25
        BEQ b2807
        TXA
        ADC a2A12
        TAX
        TYA
        ADC a2A13
        TAY
        DEC a2A25
        JMP j2831

b2807   LDA a2A26
        BEQ b281C
        TXA
        ADC a2A14
        TAX
        TYA
        ADC a2A15
        TAY
        DEC a2A26
        JMP j2831

b281C   LDA a2A11
        AND #$81     ;#%10000001
        BEQ j2831
        BPL b282B
        JSR s203B
        JMP b27EB

b282B   JSR s2047
        JMP b27EB

j2831   STX a2A23
        STY a2A24
        STX $D410    ;Voice 3: Pulse Waveform Width - Low-Byte
        STY $D411    ;Voice 3: Pulse Waveform Width - High-Nybble
b283D   LDA a2A0D
        BEQ b285C
        AND #$08     ;#%00001000
        BNE b285D
        LDX a2A1D
        LDY a2A1E
        CLC
        LDA a2A0C
        BEQ b287B
        DEC a2A0C
        LDA a2A0D
        AND #$02     ;#%00000010
        BNE b28B7
b285C   RTS

b285D   LDX a2A0C
        BPL b2865
        LDX a2A0B
b2865   LDA a2A0A
        CLC
        ADC f2A00,X
        DEX
        STX a2A0C
        TAY
        LDX f2A90,Y
        LDA f2A37,Y
        JMP j28C0

j287A   CLC
b287B   LDA a2A1F
        BEQ b288F
        DEC a2A1F
        TXA
        ADC f2A00
        TAX
        TYA
        ADC a2A01
        JMP j28C0

b288F   LDA a2A20
        BEQ b28A3
        DEC a2A20
        TXA
        ADC a2A02
        TAX
        TYA
        ADC a2A03
        JMP j28C0

b28A3   LDA a2A21
        BEQ b28CE
        DEC a2A21
        TXA
        ADC a2A04
        TAX
        TYA
        ADC a2A05
        JMP j28C0

b28B7   TXA
        ADC a2A06
        TAX
        TYA
        ADC a2A07
j28C0   TAY
        STX $D40E    ;Voice 3: Frequency Control - Low-Byte
        STY $D40F    ;Voice 3: Frequency Control - High-Byte
        STX a2A1D
        STY a2A1E
        RTS

b28CE   JSR s2086
        JMP j287A

f28D4   .BYTE $F8,$FF,$08,$00,$F8,$FF,$B8,$FF
        .BYTE $03,$06,$03,$00,$1E
a28E1   .BYTE $05
f28E2   .BYTE $14,$14,$00
a28E5   .BYTE $05,$14,$00,$EC,$FF
f28EA   .BYTE $00,$08
a28EC   .BYTE $41,$DD,$CC
a28EF   .BYTE $82
a28F0   .BYTE $FF,$00,$00,$00
f28F4   .BYTE $00,$04,$08,$0C,$10,$14,$18,$1C
        .BYTE $20,$24,$28,$2C,$30,$34,$38,$3C
        .BYTE $40
f2905   .BYTE $00,$00,$00,$00,$00,$00,$00,$E7
f290D   .BYTE $00,$00,$00,$00,$00,$00,$00,$2C
f2915   .BYTE $10
f2916   .BYTE $C4
a2917   .BYTE $02
a2918   .BYTE $05,$00,$00,$00,$02
a291D   .BYTE $00
f291E   .BYTE $F8,$FF,$00,$00,$00,$00,$00,$00
        .BYTE $FF,$00,$00,$00,$0A
a292B   .BYTE $05
f292C   .BYTE $00,$00,$00
a292F   .BYTE $00,$00,$00,$00,$00
f2934   .BYTE $00,$08
a2936   .BYTE $21,$00,$99
a2939   .BYTE $05
a293A   .BYTE $28,$00,$00,$00
f293E   .BYTE $00,$04,$08,$0C,$10,$14,$18,$1C
        .BYTE $20,$24,$28,$2C,$30,$34,$38,$3C
        .BYTE $40
f294F   .BYTE $00,$00,$00,$00,$00,$00,$3B,$37
f2957   .BYTE $00,$00,$00,$00,$00,$00,$30,$30
f295F   .BYTE $00
f2960   .BYTE $00,$00,$00,$00,$00,$00,$0D
a2967   .BYTE $1F
f2968   .BYTE $F8,$FF,$00,$00,$00,$00,$00,$00
        .BYTE $FF,$00,$00,$00,$0A
a2975   .BYTE $05
f2976   .BYTE $00,$00,$00
a2979   .BYTE $00,$00,$00,$00,$00
f297E   .BYTE $00,$08
a2980   .BYTE $21,$00,$99
a2983   .BYTE $05
a2984   .BYTE $28,$00,$00,$00
f2988   .BYTE $00,$04,$08,$0C,$10,$14,$18,$1C
        .BYTE $20,$24,$28,$2C,$30,$34,$38,$3C
        .BYTE $40
f2999   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
f29A1   .BYTE $00,$00,$00,$00,$00,$00,$00,$00
f29A9   .BYTE $00
f29AA   .BYTE $00,$00,$00,$00,$00,$00,$00
a29B1   .BYTE $00
f29B2   .BYTE $00
a29B3   .BYTE $00
a29B4   .BYTE $00
a29B5   .BYTE $00
a29B6   .BYTE $00
a29B7   .BYTE $00
a29B8   .BYTE $00
a29B9   .BYTE $00
a29BA   .BYTE $00
a29BB   .BYTE $00
a29BC   .BYTE $00
a29BD   .BYTE $00
a29BE   .BYTE $00
a29BF   .BYTE $00
a29C0   .BYTE $00
a29C1   .BYTE $00
a29C2   .BYTE $00
a29C3   .BYTE $00
a29C4   .BYTE $00
a29C5   .BYTE $00
a29C6   .BYTE $00
a29C7   .BYTE $00
a29C8   .BYTE $00
a29C9   .BYTE $00,$00,$00
a29CC   .BYTE $00
a29CD   .BYTE $00
a29CE   .BYTE $00
a29CF   .BYTE $00
a29D0   .BYTE $00
a29D1   .BYTE $00
a29D2   .BYTE $00
a29D3   .BYTE $00
a29D4   .BYTE $00
a29D5   .BYTE $00
a29D6   .BYTE $00
a29D7   .BYTE $00
a29D8   .BYTE $00
f29D9   .BYTE $F8
a29DA   .BYTE $FF
a29DB   .BYTE $00
a29DC   .BYTE $00
a29DD   .BYTE $00
a29DE   .BYTE $00
a29DF   .BYTE $00
a29E0   .BYTE $00
a29E1   .BYTE $FF
a29E2   .BYTE $00
a29E3   .BYTE $00
a29E4   .BYTE $00
a29E5   .BYTE $00
a29E6   .BYTE $05
a29E7   .BYTE $1E
a29E8   .BYTE $1E
a29E9   .BYTE $00
a29EA   .BYTE $00
a29EB   .BYTE $E2
a29EC   .BYTE $FF
a29ED   .BYTE $1E
a29EE   .BYTE $00
a29EF   .BYTE $84
a29F0   .BYTE $0B,$00,$00
a29F3   .BYTE $21
a29F4   .BYTE $00
a29F5   .BYTE $1E
a29F6   .BYTE $6B
a29F7   .BYTE $08
a29F8   .BYTE $FA
a29F9   .BYTE $00
a29FA   .BYTE $00
a29FB   .BYTE $00
a29FC   .BYTE $D0
a29FD   .BYTE $0A
a29FE   .BYTE $18
a29FF   .BYTE $1E
f2A00   .BYTE $1E
a2A01   .BYTE $00
a2A02   .BYTE $E2
a2A03   .BYTE $FF
a2A04   .BYTE $1E
a2A05   .BYTE $00
a2A06   .BYTE $63
a2A07   .BYTE $00
a2A08   .BYTE $03
a2A09   .BYTE $06
a2A0A   .BYTE $03
a2A0B   .BYTE $00
a2A0C   .BYTE $00
a2A0D   .BYTE $07
a2A0E   .BYTE $1E
a2A0F   .BYTE $1E
a2A10   .BYTE $00
a2A11   .BYTE $05
a2A12   .BYTE $E2
a2A13   .BYTE $FF
a2A14   .BYTE $1E
a2A15   .BYTE $00
a2A16   .BYTE $84
a2A17   .BYTE $0B,$00,$00
a2A1A   .BYTE $41
a2A1B   .BYTE $00
a2A1C   .BYTE $00
a2A1D   .BYTE $4A
a2A1E   .BYTE $14
a2A1F   .BYTE $00
a2A20   .BYTE $00
a2A21   .BYTE $01
a2A22   .BYTE $00
a2A23   .BYTE $3A
a2A24   .BYTE $0A
a2A25   .BYTE $00
a2A26   .BYTE $0B
f2A27   .BYTE $E0,$2C,$2E,$30,$CC,$2E,$00,$00
        .BYTE $00,$07,$01,$01,$01,$07,$07,$07
f2A37   .BYTE $01,$01,$01,$01,$01,$01,$01,$01
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
        .BYTE $AC
f2A90   .BYTE $12,$23,$34,$46,$5A,$6E,$84,$9B
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
        .BYTE $D2
f2AE9   .BYTE $7D
f2AEA   .BYTE $21,$C3,$21,$00,$00,$D3,$21,$D9
        .BYTE $21,$FD,$21,$1D,$22,$13,$22,$24
        .BYTE $22,$00,$00,$F4,$21,$2A,$22,$E5
        .BYTE $21,$95,$21,$B0,$21
f2B07   .BYTE $EE
f2B08   .BYTE $26,$34,$27,$44,$27,$4A,$27,$02
        .BYTE $00,$65,$27,$85,$27,$7B,$27,$8C
        .BYTE $27,$56,$27,$02,$00,$92,$27,$50
        .BYTE $27,$06,$27,$21,$27
f2B25   .BYTE $42
f2B26   .BYTE $24,$88,$24,$A4,$24,$98,$24,$9E
        .BYTE $24,$B3,$24,$01,$00,$C9,$24,$D3
        .BYTE $24,$01,$00,$01,$00,$D9,$24,$01
        .BYTE $00,$5A,$24,$75,$24,$F8,$FF,$00
        .BYTE $00,$00,$00,$00,$00,$FF,$00,$00
        .BYTE $00,$0A,$05,$00,$00,$00,$00,$00
        .BYTE $00,$00,$00,$00,$08,$21,$00,$99
        .BYTE $05,$28,$0A,$FF,$00,$05,$C8,$00
        .BYTE $EC,$FF,$00,$04,$21,$00,$C9,$05
        .BYTE $32,$21,$33,$CB,$05,$96,$21,$BE
        .BYTE $CD,$C8,$FF,$F8,$FF,$08,$00,$F8
        .BYTE $FF,$B8,$FF,$03,$06,$03,$00,$1E
        .BYTE $05,$41,$01,$E7,$04,$0C,$43,$EE
        .BYTE $0F,$05,$32,$1E,$00,$E2,$FF,$1E
        .BYTE $00,$00,$00,$03,$06,$03,$00,$16
        .BYTE $05,$14,$64,$03,$05,$46,$00,$19
        .BYTE $00,$64,$00,$41,$83,$CB,$5A,$64
        .BYTE $1E,$00,$E2,$FF,$1E,$00,$8C,$00
        .BYTE $03,$06,$03,$00,$0A,$07,$1E,$00
        .BYTE $E2,$FF,$1E,$00,$10,$00,$03,$06
        .BYTE $03,$00,$14,$07,$00,$00,$6D,$00
        .BYTE $00,$00,$93,$FF,$03,$03,$02,$03
        .BYTE $00,$05,$1E,$00,$E2,$FF,$1E,$00
        .BYTE $CC,$FE,$03,$06,$03,$00,$20,$07
        .BYTE $C4,$00,$00,$00,$00,$00,$00,$00
        .BYTE $FF,$00,$00,$00,$00,$04,$E5,$FF
        .BYTE $FF,$FF,$FC,$FF,$FD,$FF,$64,$96
        .BYTE $64,$FF,$19,$05,$00,$00,$FD,$FF
        .BYTE $FD,$FF,$EA,$FF,$32,$FF,$FF,$00
        .BYTE $7D,$05,$55,$00,$00,$00,$AB,$FF
        .BYTE $00,$00,$0A,$1C,$0A,$00,$00,$05
        .BYTE $08,$00,$F8,$FF,$08,$00,$00,$00
        .BYTE $03,$06,$03,$00,$0A,$05,$14,$00
        .BYTE $EC,$FF,$14,$00,$00,$00,$03,$06
        .BYTE $03,$00,$0F,$05,$19,$19,$1E,$05
        .BYTE $0A,$00,$F6,$FF,$00,$08,$41,$CC
        .BYTE $9D,$96,$C8,$00,$04,$07,$0C,$00
        .BYTE $04,$07,$0C,$00,$00,$00,$03,$08
        .BYTE $0C,$00,$03,$08,$0C,$00,$00,$00
        .BYTE $05,$09,$0C,$00,$05,$09,$0C,$00
        .BYTE $00,$00,$08,$00,$0D,$00,$02,$07
        .BYTE $0C,$00,$02,$07,$0C,$00,$00,$00
        .BYTE $03,$07,$0C,$00,$03,$07,$0C,$00
        .BYTE $00,$00,$05,$08,$0C,$00,$05,$08
        .BYTE $0C,$00,$00,$00,$03,$06,$08,$00
        .BYTE $03,$06,$08,$00,$00,$00,$04,$08
        .BYTE $0C,$00,$04,$08,$0C,$00,$00,$DA
        .BYTE $08,$00,$01,$DC,$DA,$04,$00,$02
        .BYTE $DC,$C0,$CE,$B1,$2C,$37,$CA,$B1
        .BYTE $2C,$CC,$35,$CA,$9D,$2C,$00,$03
        .BYTE $00,$03,$00,$02,$00,$02,$00,$02
        .BYTE $00,$04,$C0,$D8,$5D,$2C,$CE,$52
        .BYTE $2E,$29,$D8,$49,$2C,$00,$10,$5F
        .BYTE $10,$D8,$6B,$2C,$CE,$52,$2E,$29
        .BYTE $D8,$53,$2C,$CC,$00,$28,$10,$5F
        .BYTE $10,$C0,$BF,$32,$D4
        .ADDR a316F
        .BYTE $DA
        .BYTE $03,$BF,$00,$DC,$D4
        .ADDR a2E2B
        .BYTE $BF
        .BYTE $00,$BF,$00,$D4
        .ADDR a2E31
        .BYTE $BF,$00
        .BYTE $97,$A8,$D0,$19,$38,$D6,$1D,$B1
        .BYTE $D6,$1E,$19,$D6,$0C,$0A,$D6,$0D
        .BYTE $07,$5F,$02,$35,$04,$C6,$10,$2C
        .BYTE $38,$0C,$C6,$79,$2B,$38,$04,$37
        .BYTE $0C,$33,$04,$90,$98,$DA,$02,$2B
        .BYTE $02,$2E,$02,$DC,$2B,$02,$D0,$1B
        .BYTE $32,$90,$80,$D0,$00,$B0,$D0,$08
        .BYTE $FF,$D0,$0C,$00,$D0,$1A,$A9,$D0
        .BYTE $1B,$0A,$32,$01,$32,$01,$32,$01
        .BYTE $32,$01,$32,$02,$2C,$02,$2A,$02
        .BYTE $2C,$04,$2C,$02,$2C,$02,$2A,$04
        .BYTE $C6,$E6,$2B,$C8,$9F,$2B,$C2,$A9
        .BYTE $2B,$00,$0A,$C6,$91,$2B,$9A,$80
        .BYTE $99,$80,$97,$C0,$37,$08,$39,$08
        .BYTE $9A,$80,$99,$50,$C6,$AE,$2B,$39
        .BYTE $0A,$C6,$91,$2B,$3A,$01,$39,$01
        .BYTE $97,$60,$C6,$BC,$2B,$34,$08,$C6
        .BYTE $CA,$2B,$94,$50,$C6,$91,$2B,$37
        .BYTE $06,$39,$06,$9A,$80,$9C,$50,$3E
        .BYTE $04,$40,$04,$41,$04,$A0,$50,$41
        .BYTE $04,$40,$02,$41,$01,$40,$01,$3E
        .BYTE $04,$9C,$60,$37,$04,$39,$04,$9A
        .BYTE $80,$A1,$80,$D0,$1B,$C8,$A3,$E0
        .BYTE $C6,$D8,$2B,$43,$08,$D0,$0D,$00
        .BYTE $BF,$00,$BF,$00,$C2,$8C,$2B,$D0
        .BYTE $11,$00,$D0,$17,$08,$CC,$18,$DA
        .BYTE $40,$D4
        .ADDR a2E27
        .BYTE $00,$02,$DC,$C2
        .BYTE $87,$2B,$CA,$A8,$2C,$CE,$B1,$2C
        .BYTE $36,$CA,$A8,$2C,$CE,$9D,$2C,$37
        .BYTE $CE,$B4,$2C,$36,$D0,$18,$41,$C6
        .BYTE $5D,$2C,$CA,$C1,$2C,$CA,$C1,$2C
        .BYTE $C2,$87,$2B,$D0,$0D,$00,$DA,$04
        .BYTE $DA,$03,$CE,$B1,$2C,$29,$DC,$CE
        .BYTE $B1,$2C,$28,$DC,$C2,$44,$2C,$D0
        .BYTE $18,$15,$C8,$3E,$2C,$C6,$F4,$2B
        .BYTE $BF,$00,$CC,$00,$BF,$00,$92,$7D
        .BYTE $D6,$1D,$B3,$D6,$1E,$08,$BF,$C8
        .BYTE $D6,$1C
        .BYTE $FF,$BF,$C8,$D6,$1C
        .BYTE $64,$C0
a2E27
        INC a291D
        RTS
a2E2B
        LDX #$38     ;#%00111000
        LDY #$1B     ;#%00011011
        BNE b2E35
a2E31
        LDX #$B1     ;#%10110001
        LDY #$19     ;#%00011001
b2E35   STX $D400    ;Voice 1: Frequency Control - Low-Byte
        STY $D401    ;Voice 1: Frequency Control - High-Byte
        RTS

        .BYTE $CA,$3F,$2E,$00,$06,$00,$04,$00
        .BYTE $04,$00,$06,$00,$04,$0C,$02,$00
        .BYTE $02,$0C,$02,$0C,$02,$C0,$CA,$68
        .BYTE $2E,$00,$02,$00,$04,$00,$02,$00
        .BYTE $02,$00,$02,$00,$01,$00,$01,$00
        .BYTE $01,$00,$01,$C0,$00,$02,$00,$02
        .BYTE $00,$02,$00,$01,$00,$01,$00,$02
        .BYTE $00,$02,$00,$01,$00,$01,$00,$02
        .BYTE $C0,$C6,$5D,$2C,$DA,$04,$CA,$8A
        .BYTE $2E,$DC,$C0,$CA,$8A,$2E,$D8,$5D
        .BYTE $2C,$CE,$52,$2E,$29,$D8,$49,$2C
        .BYTE $CA,$52,$2E,$D8,$6B,$2C,$CA,$52
        .BYTE $2E,$D8,$53,$2C,$D2,$52,$2E,$28
        .BYTE $00,$01,$00,$01,$00,$04,$00,$04
        .BYTE $00,$04,$00,$01,$00,$01,$C0,$CA
        .BYTE $B6,$2E,$CA,$A4,$2E,$00,$02,$00
        .BYTE $02,$00,$02,$00,$02,$00,$04,$00
        .BYTE $01,$00,$01,$00,$01,$00,$01,$C0
        .BYTE $60,$32,$BF,$00,$C4,$43,$2B,$BF
        .BYTE $00,$DA,$02,$CE,$3C,$2E,$24,$CE
        .BYTE $3C,$2E,$20,$CE,$3C,$2E,$1D,$DC
        .BYTE $CE,$3C,$2E,$24,$CA,$7D,$2E,$D8
        .BYTE $75,$2C,$CE,$B6,$2E,$37,$D8,$53
        .BYTE $2C,$CA,$B6,$2E,$D8,$5D,$2C,$CE
        .BYTE $B6,$2E,$35,$D8,$53,$2C,$CE,$B6
        .BYTE $2E,$36,$D8,$75,$2C,$CE,$B6,$2E
        .BYTE $37,$D8,$53,$2C,$CA,$B6,$2E,$D8
        .BYTE $5D,$2C,$CE,$B6,$2E,$35,$D8,$89
        .BYTE $2C,$CE,$B6,$2E,$36,$D8,$75,$2C
        .BYTE $CE,$B6,$2E,$37,$D8,$53,$2C,$CA
        .BYTE $B6,$2E,$D8,$5D,$2C,$CE,$B6,$2E
        .BYTE $35,$D8,$93,$2C,$CE,$A4,$2E,$36
        .BYTE $D8,$89,$2C,$CA,$B9,$2E,$D8,$75
        .BYTE $2C,$CE,$B6,$2E,$37,$D8,$53,$2C
        .BYTE $CA,$B6,$2E,$D8,$5D,$2C,$CE,$B6
        .BYTE $2E,$35,$D8,$7F,$2C,$CE,$A4,$2E
        .BYTE $37,$D8,$53,$2C,$CE,$B9,$2E,$36
        .BYTE $CA,$87,$2E,$C4,$2C,$2C,$BF,$00
        .BYTE $BF,$00,$CC,$00,$92,$80,$90,$80
        .BYTE $90,$00,$92,$80,$90,$50,$D0,$10
        .BYTE $00,$2E,$04,$2D,$04,$2E,$04,$90
        .BYTE $50,$2B,$04,$30,$04,$32,$04,$34
        .BYTE $0C,$35,$04,$37,$04,$39,$04,$3A
        .BYTE $04,$3C,$04,$9A,$80,$99,$80,$97
        .BYTE $00,$92,$80,$90,$80,$90,$80,$92
        .BYTE $80,$C6,$02,$2C,$90,$19,$D6,$0D
        .BYTE $07,$BF,$64,$D6,$1D,$93,$D6,$1E
        .BYTE $08,$BF,$C8,$D6,$1C,$FF,$BF,$C8
        .BYTE $D6,$1C,$FF,$C0,$05,$04,$05,$02
        .BYTE $05,$02,$05,$02,$05,$04,$05,$04
        .BYTE $00,$02,$03,$02,$05,$02,$08,$02
        .BYTE $07,$02,$05,$02,$03,$02,$C0,$CA
        .BYTE $DE,$2F,$CA,$F4,$2F,$00,$04,$00
        .BYTE $01,$00,$01,$00,$02,$00,$02,$0C
        .BYTE $02,$00,$02,$00,$02,$00,$02,$C0
        .BYTE $00,$01,$00,$01,$00,$02,$00,$02
        .BYTE $00,$02,$0C,$02,$00,$04,$C0,$CA
        .BYTE $06,$30,$CE,$DE,$2F,$22,$CE,$DE
        .BYTE $2F,$1D,$CE,$DB,$2F,$24,$C0,$DA
        .BYTE $04,$05,$04,$00,$04,$DC,$C0,$DA
        .BYTE $04,$00,$08,$DC,$C0,$CE,$DE,$2F
        .BYTE $1F,$CE,$DE,$2F,$27,$CE,$DE,$2F
        .BYTE $22,$C0,$60,$32,$C4,$43,$2B,$BF
        .BYTE $00,$DA,$0E,$CE,$C0,$2F,$1F,$DC
        .BYTE $C2,$6A,$2B,$CA,$C0,$2F,$C8,$60
        .BYTE $2B,$D0,$18,$41,$05,$02,$11,$01
        .BYTE $11,$01,$11,$02,$11,$02,$11,$02
        .BYTE $05,$06,$11,$04,$05,$04,$11,$02
        .BYTE $05,$02,$04,$04,$D0,$0D,$00,$CA
        .BYTE $03,$30,$CA,$03,$30,$CE,$DB,$2F
        .BYTE $1F,$CE,$DE,$2F,$1D,$CE,$DE,$2F
        .BYTE $1E,$CE,$DB,$2F,$1F,$CE,$DE,$2F
        .BYTE $22,$CE,$DE,$2F,$26,$CA,$21,$30
        .BYTE $CE,$F4,$2F,$26,$CE,$E1,$2F,$1E
        .BYTE $CA,$21,$30,$CE,$F4,$2F,$24,$CE
        .BYTE $E1,$2F,$26,$CA,$03,$30,$DA,$03
        .BYTE $CE,$13,$30,$1D,$CE,$13,$30,$18
        .BYTE $CE,$13,$30,$1F,$CA,$13,$30,$DC
        .BYTE $C2,$6F,$2B,$C6,$1E,$2C,$D0,$11
        .BYTE $00,$CE,$1B,$30,$22,$CE,$1B,$30
        .BYTE $1D,$CE,$1B,$30,$24,$CE,$1B,$30
        .BYTE $18,$CE,$1B,$30,$22,$CE,$1B,$30
        .BYTE $1D,$CE,$1B,$30,$20,$CE,$1B,$30
        .BYTE $22,$C2,$74,$2B,$62,$00,$D6,$1C
        .BYTE $FF,$BF,$FE,$D6,$1C,$FF,$C0

j30E3   LDA #$00     ;#%00000000
        STA a29CE
        STA a29F5
        STA a2A1C
        LDX #$17     ;#%00010111
b30F0   STA $D400,X  ;Voice 1: Frequency Control - Low-Byte
        DEX
        BPL b30F0
        LDX #$0F     ;#%00001111
b30F8   LDA f2A27,X
        STA f10,X
        DEX
        BPL b30F8
b3100   LDX #<p2606  ;#%00000110
        LDY #>p2606  ;#%00100110
        STX a2001
        STY a2002
        RTS

j310B   LDA #$00     ;#%00000000
a310E   =*+$01
        BEQ b3158
b310F   LDY f2915
        LDA f319E,Y
        BEQ b3100
        INC f2915
        LSR A
        TAX
        LDA f3194,X
        STA f2916
        AND #$03     ;#%00000011
        STA a2917
        LDX #$1C     ;#%00011100
        BNE b3198
b312B   ASL f2916
        BCC b3138
        LDA #$06     ;#%00000110
        LDX #$49     ;#%01001001
b3134   LDY #$21     ;#%00100001
        BNE b316A
b3138   LDA #$02     ;#%00000010
        LDX #$50     ;#%01010000
        BNE b3134
        DEC a2918
        BPL b319B
        DEC a2917
        BPL b312B
        LDA #$06     ;#%00000110
        STA a2918
        LDX #$42     ;#%01000010
        BNE b3198
        DEC a2918
        BPL b319B
        BMI b310F
b3158   DEC a2918
        BPL b319B
        BMI b3164
        DEC a2918
        BPL b319B
b3164   LDA #$02     ;#%00000010
        LDX #$2F     ;#%00101111
        LDY #$20     ;#%00100000
b316A   STA a2918
        BNE b3195
a316F
        LDA #$A0     ;#%10100000
        STA $D406    ;Voice 1: Sustain / Release Cycle Control
        LDX #$4B     ;#%01001011
        STX $D400    ;Voice 1: Frequency Control - Low-Byte
        LDY #$22     ;#%00100010
        STY $D401    ;Voice 1: Frequency Control - High-Byte
        LDX #<j310B  ;#%00001011
        LDY #>j310B  ;#%00110001
        STX a2001
        STY a2002
        LDA #$00     ;#%00000000
        TAX
        TAY
        STA f2915
        STA $D405    ;Voice 1: Attack / Decay Cycle Control
f3194   =*+$02
        STA a29CE
b3195   STY $D404    ;Voice 1: Control Register
b3198   STX a310E
b319B   JMP p2606

f319E   .BYTE $84,$92,$98,$98,$84,$82,$A4,$9C
        .BYTE $82,$88,$82,$AC,$92,$88,$86,$9E
        .BYTE $98,$98,$92,$8A,$A4,$9A,$82,$A4
        .BYTE $A8,$92,$9C,$8E,$82,$98,$AE,$82
        .BYTE $B2,$A8,$9E,$9C,$B2,$A0,$9E,$9A
        .BYTE $8C,$A4,$8A,$A8,$A6,$A8,$8A,$AC
        .BYTE $8A,$AE,$82,$90,$92,$88,$00,$41
        .BYTE $83,$A3,$82,$00,$23,$C2,$03,$10
        .BYTE $73,$A2,$43,$C1,$81,$E2,$63,$D3
        .BYTE $42,$02,$80,$22,$13,$62,$93,$B3
        .BYTE $C3,$C5,$CE,$FF,$00,$FF,$00,$FF
        .BYTE $00,$FF,$00,$FF,$00,$FE,$00,$FF
        .BYTE $00,$7E,$FE,$00,$FF,$00,$FF,$00


MUSIC_MAIN
        SEI
        LDA #$06     ;#%00000110
        STA $D020    ;Border Color
        LDA #$0F     ;#%00001111
        STA $D418    ;Select Filter Mode and Volume
        LDA #$27     ;#%00100111
        STA a00
        LDA #$07     ;#%00000111
        STA a4131
        LDA #$00     ;#%00000000
;        STA $D021    ;Background Color 0
        STA $D020    ;Background Color 0
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
        STA $DC0E    ;CIA1: CIA Control Register A
        STA $D01A    ;VIC Interrupt Mask Register (IMR)
        STA $D019    ;VIC Interrupt Request Register (IRR)
        STA a4132
        STA a412F
        STA aFD
        STA aF9
        STA a4130
        STA a4135
        STA a413A

;        LDA #$05     ;#%00000101
        LDA #$35     ;#%00000101
        STA a01
        LDA #<p409F  ;#%10011111
        STA aFFFE    ;IRQ
        LDA #>p409F  ;#%01000000
        STA aFFFF    ;IRQ
        LDA #$E0     ;#%11100000
        STA $DD06    ;CIA2: Timer B: Low-Byte
        LDA #$03     ;#%00000011
        STA $DD07    ;CIA2: Timer B: High-Byte
        LDA #$96     ;#%10010110
        STA $D012    ;Raster Position
;        LDA #$1B     ;#%00011011
;        STA $D011    ;VIC Control Register 1
        LDA #$10     ;#%00010000
        STA $DD0F    ;CIA2: CIA Control Register B
        LDA #$90     ;#%10010000
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA $DC0D    ;CIA1: CIA Interrupt Control Register
        LDA $DC0E    ;CIA1: CIA Control Register A
        LDA $DD0D    ;CIA2: CIA Interrupt Control Register
        LDA $DD0E    ;CIA2: CIA Control Register A

;        LDA #$60     ;#%01100000
;        STA aFA
;        LDY #$00     ;#%00000000
;        TYA
;b4077   STA (pF9),Y
;        INY
;        BNE b4077
;        INC aFA
;        LDX aFA
;        CPX #$80     ;#%10000000
;        BNE b4077

        LDA #$04     ;#%00000100
        STA a4206
b4089   LDY #$FF     ;#%11111111
b408B   LDX #$FF     ;#%11111111
b408D   DEX
        BNE b408D
        DEY
        BNE b408B

        DEC a4206
        LDA a4206
        BNE b4089
        CLI

        JMP j413E

;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-;
p409F   PHA
        TXA
        PHA
        TYA
        PHA
        LDA $DD07    ;CIA2: Timer B: High-Byte
        LDY #$11     ;#%00010001
        STY $DD0F    ;CIA2: CIA Control Register B
        EOR #$02     ;#%00000010
        LSR A
        LSR A
        ROR a412F
a40B3   NOP
a40B4   NOP
        LDA a40B3
        CMP #$EA     ;#%11101010
        BNE b40F8
        DEC a4131
        BPL b4103
        LDX #$07     ;#%00000111
        STX a4131
        LDX a4130
        BNE b410C
        LDA a4134
        BNE b40DE
        LDA a412F
        STA a4133
        LDA #$01     ;#%00000001
        STA a4134
        JMP b4103

b40DE   LDX #$01     ;#%00000001
        STX a4130
        LDA a412F
        BNE b40F1
        SEI
        LDA #$01     ;#%00000001
        STA a4132
        JMP b4103

b40F1   STA aFE
        LDA #$00     ;#%00000000
        STA a4134
b40F8   LDA #$EA     ;#%11101010
        STA a40B3
        STA a40B4
        JMP b4103

b4103   LDA $DC0D    ;CIA1: CIA Interrupt Control Register
        PLA
        TAY
        PLA
        TAX
        PLA
        RTI

b410C   LDA a4133
        LSR A
        BCS b4116
        LDA #$00     ;#%00000000
        STA a01
b4116   LDY #$00     ;#%00000000
        LDA a412F
        STA (pFD),Y
        LDA #$05     ;#%00000101
        STA a01
        STY a412F
        INC aFD
        BNE b4103
        STY a4130
        JMP b4103

        .BYTE $00
a412F   .BYTE $80
a4130   .BYTE $01
a4131   .BYTE $04
a4132   .BYTE $00
a4133   .BYTE $0E
a4134   .BYTE $00
a4135   .BYTE $01,$00,$00,$00,$00
a413A   .BYTE $00

b413B   JMP j41DF

j413E   LDA a4132
        BNE b413B
        LDA a4133
        AND #$02     ;#%00000010
        BNE b414D
        INC $D020    ;Border Color
b414D
        LDA $D019    ;VIC Interrupt Request Register (IRR)
        AND #$01     ;#%00000001
        BEQ j413E
        STA $D019    ;VIC Interrupt Request Register (IRR)
        LDA a4133
        AND #$02     ;#%00000010
        BNE b4166
;        LDA #$0B     ;#%00001011
;        STA $D011    ;VIC Control Register 1
        JMP j4170

b4166
;        LDA $D011    ;VIC Control Register 1
;        ORA #$10     ;#%00010000
;        AND #$7F     ;#%01111111
;        STA $D011    ;VIC Control Register 1
j4170   LDA a4133
        AND #$04     ;#%00000100
        BNE b4182
;        LDA $D011    ;VIC Control Register 1
;        AND #$5F     ;#%01011111
;        STA $D011    ;VIC Control Register 1
        JMP j41A8

b4182
;        LDA $D011    ;VIC Control Register 1
;        ORA #$20     ;#%00100000
;        AND #$7F     ;#%01111111
;        STA $D011    ;VIC Control Register 1
        LDA #$92     ;#%10010010
        STA $DD00    ;CIA2: Data Port Register A
;        LDA #$78     ;#%01111000
;        STA $D018    ;VIC Memory Control Register
;        LDA $D016    ;VIC Control Register 2
;        ORA #$10     ;#%00010000
;        STA $D016    ;VIC Control Register 2
        LDA #$07     ;#%00000111
        STA $D021    ;Background Color 0
        LDA #$00     ;#%00000000
        STA $D020    ;Border Color

j41A8   LDA a4135
        BNE b41C7
        LDA a4133
        AND #$08     ;#%00001000
        BNE b41BC
j41B4   LDA #$00     ;#%00000000
        STA a4135
        JMP j413E

b41BC   LDA #$01     ;#%00000001
        STA a4135
        JSR s2003
        JMP j413E

b41C7   LDA a4133
        AND #$08     ;#%00001000
        BEQ b41D9
        JSR s2006
        BEQ b41D9
        JSR s2000
        JMP j413E

b41D9   JSR s2003
        JMP j41B4

j41DF   SEI
        LDA #$37     ;#%00110111
        STA a01
        LDA #$00     ;#%00000000
        STA $D418    ;Select Filter Mode and Volume
        STA $DC0E    ;CIA1: CIA Control Register A
        LDA #$10     ;#%00010000
        STA $DC0D    ;CIA1: CIA Interrupt Control Register
;        LDA #$1B     ;#%00011011
;        STA $D011    ;VIC Control Register 1
        LDX #$FA     ;#%11111010
        LDA #$F5     ;#%11110101
        .BYTE $9B,$00,$01
        .BYTE $8B,$C5
        PHA
        TXA
        CLC
        ADC #$0B     ;#%00001011
        PHA
        RTS

a4206   .BYTE $00,$00,$C5,$CE,$C4,$00,$FF,$00
        .BYTE $FF,$00
        .BYTE $FF,$00,$00

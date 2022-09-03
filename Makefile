.INTERMEDIATE: rambo.prg rambo.exo
.PHONY: all clean run

D64_IMAGE = "bin/rambo.d64"
X64 = x64
DEBUGGER = c64debugger
X64SC = x64sc
C1541 = c1541
PRINTF = /usr/bin/printf

all: rambo.prg rambo-clean.prg

rambo.prg: src/rambo-0334-feff.asm
	64tass -Wall -Werror --cbm-prg -o bin/rambo.prg -L bin/list.txt -l bin/labels.txt --vice-labels src/rambo-0334-feff.asm
	md5sum bin/rambo.prg orig/rambo-0334-feff.prg

rambo-clean.prg: src/rambo-0334-feff.asm
	64tass -Wall -Werror --cbm-prg -D USE_RAMBO_LIA:=1 -o bin/rambo.prg -L bin/list.txt -l bin/labels.txt --vice-labels src/rambo-0334-feff.asm

d64: rambo.prg
	split -b48334 bin/rambo.prg
	mv xaa bin/ram2.prg
	$(PRINTF) "\x00\x40" | cat - xab > bin/ram1.prg
	rm xab
	$(C1541) -format "rambo,rq" d64 $(D64_IMAGE)
	$(C1541) $(D64_IMAGE) -write orig/sys16384.prg "sys16384"
	$(C1541) $(D64_IMAGE) -write bin/ram1.prg "ram1"
	$(C1541) $(D64_IMAGE) -write bin/ram2.prg "ram2"
	$(C1541) $(D64_IMAGE) -list

run: d64
	$(X64) -verbose -moncommands bin/labels.txt $(D64_IMAGE)

clean:
	-rm $(D64_IMAGE)
	-rm bin/*.prg bin/*.txt bin/*.d64 bin/*.bin bin/*.crt

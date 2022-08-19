.INTERMEDIATE: rambo.prg rambo.exo
.PHONY: all clean run

D64_IMAGE = "bin/rambo.d64"
X64 = x64
DEBUGGER = c64debugger
X64SC = x64sc
C1541 = c1541

all: rambo.prg

rambo.prg: src/rambo-0334-fff9.asm
	64tass -Wall -Werror --cbm-prg -o bin/rambo.prg -L bin/list.txt -l bin/labels.txt --vice-labels src/rambo-0334-fff9.asm
	md5sum bin/rambo.prg orig/rambo-0334-fff9.prg

clean:
	-rm $(D64_IMAGE)
	-rm bin/*.prg bin/*.txt bin/*.d64 bin/*.bin  bin/*.crt

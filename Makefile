.INTERMEDIATE: rambo.prg rambo.exo
.PHONY: all clean run

D64_IMAGE = "bin/rambo.d64"
D64_IMAGE_LIA = "bin/rambo-lia.d64"
X64 = x64
DEBUGGER = c64debugger
C1541 = c1541
PRINTF = /usr/bin/printf

all: md5 rambo-lia

rambo: src/rambo-0334-feff.s
	64tass -Wall -Werror --cbm-prg -o bin/$@.prg -L bin/list.txt -l bin/labels.txt --vice-labels src/rambo-0334-feff.s

md5: rambo
	md5sum bin/rambo.prg orig/rambo-0334-feff.prg

rambo-lia: src/rambo-0334-feff.s
	64tass -Wall -Werror --cbm-prg -D USE_RAMBO_LIA:=1 -o bin/$@.prg -L bin/list.txt -l bin/labels.txt --vice-labels src/rambo-0334-feff.s

rambo-lia-exo: rambo-lia
	exomizer sfx sys -x1 -Di_line_number=2022 bin/rambo-lia.prg -o bin/$@.prg

rambo-lia-non-sfx-exo: rambo-lia
	exomizer mem -l none -f bin/rambo-lia.prg -o bin/$@.prg

music-lia: src/rambo-0334-feff.s
	64tass -Wall -Werror --cbm-prg -D USE_RAMBO_LIA:=1 -D USE_CALL_DEBUG_MUSIC_CODE:=1 -o bin/$@.prg -L bin/list.txt -l bin/labels.txt --vice-labels src/rambo-0334-feff.s
	exomizer sfx sys -x1 -Di_line_number=2022 bin/$@.prg -o bin/$@.exo.prg

d64: rambo
	split -b48334 bin/rambo.prg
	mv xaa bin/ram2.prg
	$(PRINTF) "\x00\x40" | cat - xab > bin/ram1.prg
	rm xab
	$(C1541) -format "rambo,rq" d64 $(D64_IMAGE)
	$(C1541) $(D64_IMAGE) -write orig/sys16384.prg "sys16384"
	$(C1541) $(D64_IMAGE) -write bin/ram1.prg "ram1"
	$(C1541) $(D64_IMAGE) -write bin/ram2.prg "ram2"
	$(C1541) $(D64_IMAGE) -list

d64-lia: rambo-lia-exo
	$(C1541) -format "rambo,rq" d64 $(D64_IMAGE_LIA)
	$(C1541) $(D64_IMAGE_LIA) -write bin/rambo-lia-exo.prg "rambo"
	$(C1541) $(D64_IMAGE_LIA) -list

run: d64
	$(X64) -verbose -moncommands bin/labels.txt $(D64_IMAGE)

run-lia: d64-lia
	$(X64) -verbose -moncommands bin/labels.txt $(D64_IMAGE_LIA)

run-music: music-lia
	$(X64) -verbose -moncommands bin/labels.txt bin/music-lia-exo.prg

intro: rambo-lia-non-sfx-exo intro/intro.s
	64tass -Wall -Werror --cbm-prg -o bin/$@.prg -L bin/list.txt -l bin/labels.txt --vice-labels intro/intro.s

intro-exo: intro
	exomizer sfx sys -x1 -Di_line_number=2022 bin/intro.prg -o bin/$@.prg

run-intro: intro-exo
	$(X64) -verbose -moncommands bin/labels.txt bin/intro-exo.prg

clean:
	-rm $(D64_IMAGE) $(D64_IMAGE_LIA)
	-rm bin/*.prg bin/*.txt bin/*.d64 bin/*.bin bin/*.crt

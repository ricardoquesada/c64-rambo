# "Rambo: First blood part II" for the C64

![screenshot_intro]
![screenshot_game1]
![screenshot_music]

[screenshot_intro]: images/screenshot_intro.png
[screenshot_game1]: images/screenshot_game1.png
[screenshot_music]: images/screenshot_music_debug.png


Rambo for the C64.

## Source code

Based on Rambo Thunder Mountain version (NTSC). Works on PAL as well.

- Game was disassembled, includes my own comments.

Includes optional patches like:

- Add rumble suport
- Be able to swith weapons from gamepad
- Removed copy protection
- Convert it to single load
- Includes image and sound from .tap version
- Option to jump to Galway's Music Debug program (Press 'P' in the intro)

## Download

- Latest binary: [rambo-lia.d64]
- CSDB entry: https://csdb.dk/release/index.php?id=224025

[rambo-lia.d64]: bin/rambo-lia.d64

## Rumble support

To play it with rumble, use a [Unijoysticle Flashparty Edition][uni2_flashparty]

- Put Unijoysticle in [Enhanced mode][enhanced_mode]

[uni2_flashparty]: https://gitlab.com/ricardoquesada/unijoysticle2/-/tree/main/board/unijoysticle2_flashparty2022
[enhanced_mode]: https://gitlab.com/ricardoquesada/unijoysticle2/-/blob/main/docs/user_guide.md#enhanced-mode

## Compile & Run

Requirements:
- [64tass] assembler

- `make run`

[64tass]: http://tass64.sourceforge.net/

## See it in action

[![video](https://img.youtube.com/vi/vCj45OX43JE/0.jpg)](https://www.youtube.com/watch?v=vCj45OX43JE)

## Authors

Crack & Dissasembly & patches: [riq][retro_moe] / [L.I.A][lia]

[retro_moe]: https://retro.moe
[lia]: https://lia.rebelion.digital
# Pixel fonts for the Web

## Background

One of the first large programs I ever wrote was a font editor for the ZX
Spectrum computer, some time in the mid 1980s. It spurred an interest in
typography that persists to this day. This project is something of a throwback
to those days, as it's intended to produce pixel fonts for a retro game engine
in JavaScript I'm working on.

The fonts comprise single files in [Netpbm bitmap
format](https://en.wikipedia.org/wiki/Netpbm_format). This format was chosen
because it is human-readable and easy to edit in a regular text editor. A
makefile uses the `montage` tool that comes with the
[ImageMagick](http://www.imagemagick.org/script/montage.php) utilities to
convert the font into a single image (similar to a CSS sprite). Only fixed-width
fonts are supported for now, and only characters in the Basic Latin (i.e., 7-bit
ASCII) range are handled. An HTML/ JavaScript test script is included to test
the created font.

## File structure

The project is laid out as follows:

- `test`: Contains the test harness
- `basic`: A basic, no-frills pixel font
  - `basic/8x8`: The 8x8 size of the font
    - `basic/8x8/glyphs`: The font files, one for each glyph.
    - `basic/8x8/by-name`: A symlink to each glyph with a human-readable name.

## Prerequisites

- GNU Make (the Makefile uses the `addprefix` function that not all variants of
  `make` support
- ImageMagick (note: this project was created on Devuan Linux which uses a
  somewhat old version of ImageMagick, dated 2009. Perusal of the ImageMagick
  Web site suggests some of the command-line arguments may have changed on newer
  releases. Your mileage may vary.)

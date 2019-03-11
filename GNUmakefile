# TODO: Expand this to handle more font styles and sizes
FONT:=basic
SIZE:=8x8
OUT:=out/$(FONT)-$(SIZE).png
GLYPHS:=$(addprefix $(FONT)/$(SIZE)/glyphs/, 20.pbm 21.pbm 22.pbm 23.pbm 24.pbm 25.pbm 26.pbm 27.pbm 28.pbm 29.pbm 2A.pbm 2B.pbm 2C.pbm 2D.pbm 2E.pbm 2F.pbm 30.pbm 31.pbm 32.pbm 33.pbm 34.pbm 35.pbm 36.pbm 37.pbm 38.pbm 39.pbm 3A.pbm 3B.pbm 3C.pbm 3D.pbm 3E.pbm 3F.pbm 40.pbm 41.pbm 42.pbm 43.pbm 44.pbm 45.pbm 46.pbm 47.pbm 48.pbm 49.pbm 4A.pbm 4B.pbm 4C.pbm 4D.pbm 4E.pbm 4F.pbm 50.pbm 51.pbm 52.pbm 53.pbm 54.pbm 55.pbm 56.pbm 57.pbm 58.pbm 59.pbm 5A.pbm 5B.pbm 5C.pbm 5D.pbm 5E.pbm 5F.pbm 60.pbm 61.pbm 62.pbm 63.pbm 64.pbm 65.pbm 66.pbm 67.pbm 68.pbm 69.pbm 6A.pbm 6B.pbm 6C.pbm 6D.pbm 6E.pbm 6F.pbm 70.pbm 71.pbm 72.pbm 73.pbm 74.pbm 75.pbm 76.pbm 77.pbm 78.pbm 79.pbm 7A.pbm 7B.pbm 7C.pbm 7D.pbm 7E.pbm 7F.pbm)

all: $(OUT)

# FIXME: The -tile option seems to have changed in recent versions of
# ImageMagick; works for now in Devuan Linux
$(OUT): $(GLYPHS)
	montage $^ -tile 16x6 -geometry +0+0 $@


clean:
	rm -f $(OUT)


.PHONY: all clean
	

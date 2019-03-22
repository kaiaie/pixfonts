#!/bin/sh
usage() {
	ret_val=$1
	usage_msg="Creates a new pixel font \n \
$0 name width height \n \
"
	if [ $ret_val -eq 0 ]
	then
		echo $usage_msg
	else
		echo $usage_msg >&2
	fi
	exit $ret_val
}

if [ "$1" = "-h" ]
then
	usage 0
fi

# Check all params supplied
if [ $# -ne 3 ]
then
	usage 1
fi

font_name=$1
font_width=$2
font_height=$3

# Check width and height are numeric; see
# https://stackoverflow.com/a/16444570/118592
case $font_width in
	(*[!0-9]*|'')
		echo "Error: Font width must be a number" >&2
		exit 1
	;;
	(*)	
		: 
	;;
esac
case $font_height in
	(*[!0-9]*|'')
		echo "Error: Font height must be a number" >&2
		exit 1
	;;
	(*)	
		: 
	;;
esac

font_dir=$font_name/${font_width}x${font_height}

if [ -d "$font_dir" ]
then
	echo "Error: Font already exists" >&2
	exit 1
fi

# Create directory structure
mkdir -p "${font_dir}"
mkdir -p "${font_dir}/glyphs" 
mkdir -p "${font_dir}/by-name"

# Create the space glyph
echo "P1" >> "${font_dir}/glyphs/20.pbm"
echo "${font_width} ${font_height}" >> "${font_dir}/glyphs/20.pbm"
j=$font_height
while [ $j -ne 0 ] ; do
	i=$font_width
	while [ $i -ne 0 ] ; do
		echo -n "0 " >> "${font_dir}/glyphs/20.pbm"
		i=$(expr $i - 1)
	done
	echo >> "${font_dir}/glyphs/20.pbm"
	j=$(expr $j - 1)
done

IFS=","
line_no=1
while read code_point name
do
	if [ $line_no -ne 1 ]
	then
		# Make a copy of the space glyph for every other character in
		# the Basic Latin range
		cp "${font_dir}/glyphs/20.pbm" "${font_dir}/glyphs/${code_point}.pbm"
	fi
	# Create a symlink with the human name for each glyph so it's easier to edit
	name=$(echo "${name}" | tr [:space:] _)
	ln -s "../glyphs/${code_point}.pbm" "${font_dir}/by-name/${code_point}-${name}.pbm"
	line_no=$(expr $line_no + 1)
done < basic_latin.csv


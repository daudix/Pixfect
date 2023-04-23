#!/usr/bin/env bash

# Pixfect - Pixel perfect image to pixel-art converter

input_file="$1"
output_file="$2"

mkdir frames
ffmpeg -i $input_file -vf "fps=10,scale=128:-1" frames/frame-%03d.png
ffmpeg -i frames/frame-%03d.png -vf "palettegen=max_colors=10" palette.png
ffmpeg -i frames/frame-%03d.png -i palette.png -filter_complex "fps=10, paletteuse=dither=floyd_steinberg" $output_file

rm -rf frames
rm palette.png

echo -e "\033[2K\r\033[32m✔ Done\033[0m"

#!/usr/bin/env bash

# Pixfect - Pixel perfect image to pixel-art converter

# Basic configuration

image_size="128"
image_scale="200%"
image_colors="10"
image_filters=""

# Define a function to print the help message
help() {
    echo "Usage: $0 [options] <input> <output>"
    echo "Pixfect - Tool for dithering and converting images to pixel art"
    echo ""
    echo "Options:"
    echo "  -s, --size		Resolution of image for manipulation (default: 128)"
    echo "  -x, --scale		Scale factor of output image (default: 200%)"
    echo "  -c, --colors		Amount of colors used in image (default: 10)"
    echo "  -f, --filters		Specify Additional ImageMagick filters (default: none)"
    echo "  -h, --help		Display help message"
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -s|--size)
        image_size="$2"
        shift
        shift
        ;;
        -x|--scale)
        image_scale="$2"
        shift
        shift
        ;;
        -c|--colors)
        image_colors="$2"
        shift
        shift
        ;;
        -f|--filters)
        image_filters="$2"
        shift
        shift
        ;;
        -h|--help)
	help
        exit 0
        ;;
        *)
        break
        ;;
    esac
done

input_file="$1"
output_file="$2"

# Check if input file are specified
if [[ -z "$input_file" ]]; then
    echo "Error: input file not specified"
    exit 1
fi

# Use fallback if output file not specified

if [[ -z "$output_file" ]]; then
    output_file="$(echo "$input_file" | cut -f 1 -d '.')-pixfect.png"
fi

# Check if input file exists
if [[ ! -f "$input_file" ]]; then
    echo "Error: input file does not exist"
    exit 1
fi

# Fancy spinner
spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf "[%c] Converting..." "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\r"
    done
    printf "      \r"
}

# Image conversion
convert_file() {   
    convert $input_file -resize $image_size -dither FloydSteinberg -colors $image_colors -filter point -resize $image_scale $image_filters $output_file
}

# Start spinner animation
convert_file &
spinner $!

echo -e "\033[2K\r\033[32m✔ Done\033[0m"

# Get the sizes of the input and output files
input_size=$(wc -c < "$input_file")
output_size=$(wc -c < "$output_file")

# Calculate the difference in size and percentage difference
# diff=$(echo "scale=2; $output_size - $input_size" | bc)
# perc_diff=$(echo "scale=2; ($output_size / $input_size - 1) * 100" | bc)

# Determine the unit to use (MB or KB)
if [ $output_size -gt 1048576 ]; then
  unit="MB"
  output_size=$(echo "scale=2; $output_size / 1048576" | bc)
  input_size=$(echo "scale=2; $input_size / 1048576" | bc)
else
  unit="KB"
  output_size=$(echo "scale=2; $output_size / 1024" | bc)
  input_size=$(echo "scale=2; $input_size / 1024" | bc)
fi

# Print the results with fancy graphics
printf "%-15s %-15s\n" "Input Size:"	"$input_size $unit"
printf "%-15s %-15s\n" "Output Size:"	"$output_size $unit"
# printf "%-15s %-15s\n" "Difference:"	"$diff $unit"
# printf "%-15s %-15s\n" "Perc Diff:"	"$perc_diff%"

# if [ $diff -gt 0 ]; then
#   echo -e "\xE2\x86\x91" # up arrow
# elif [ $diff -lt 0 ]; then
#   echo -e "\xE2\x86\x93" # down arrow
# else
#   echo "="
# fi

# Pixfect

A pretty way to compress images

## How it works

This is very simple bash script that uses ImageMagick for sizing down an image and dithering it, main purpose is to give images pixel art look, but this also can be used to reduce the image size quite a lot

![demo](demo/demo.webm)

## How to use

It's simple as running `pixfect.sh` from terminal

```sh
./pixfect.sh [options] <input> <output>
```

Available options:

- `--size`: Resolution of image for manipulation
- `--scale`: Scale factor of output image
- `--colors`: Amount of colors used in image
- `--filters`: Specify Additional ImageMagick filters

All available options can be displayed using `./pixfect.sh --help`

## The name

The name is a combination of Pixel and Perfect, "Pixel Perfect" is used to tell that image is created precisely to be sharp
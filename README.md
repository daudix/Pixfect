> **Warning**
> This repository has been moved to [Codeberg](https://codeberg.org/daudix-UFO/Pixfect), all future work will continue there.

# Pixfect

A pretty way to compress images and videos

> **Note**
> Check out [Halftone](https://github.com/tfuxu/Halftone), an app for dithering images to give them _that_ pixel art look

## How it works

This is very simple bash script that uses ImageMagick for sizing down an image and dithering it, main purpose is to give images pixel art look, but this also can be used to reduce the image size quite a lot

![demo](demo/demo.gif)

## How to use

It's as simple as running `pixfect.sh` from terminal

```sh
./pixfect.sh [options] <input> <output>
```

Available options:

- `--size`: Resolution of image for manipulation (default: 128)
- `--colors`: Amount of colors used in image (default: 10)
- `--filters`: Specify Additional ImageMagick filters
- `--grayscale`: Convert image to grayscale
- `--video`: Convert video (experimental)
- `--fps`: Frames per second for video (default: 10)
- `--help`: Display help message

All available options can be displayed using `./pixfect.sh --help`

## The name

The name is a combination of Pixel and Perfect, "Pixel Perfect" is used to tell that image is created precisely to be sharp

## Similar projects

https://github.com/tfuxu/Halftone

https://doodad.dev/dither-me-this

https://github.com/dbohdan/hicolor

https://github.com/giventofly/pixelit

https://github.com/MiguelMJ/MakeItPixel

## Resources

https://mastodon.social/@tbernard/109675668676999287

https://legacy.imagemagick.org/Usage/quantize/#colors

https://legacy.imagemagick.org/Usage/blur/#sharpen

https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=26480

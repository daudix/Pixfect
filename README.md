# Pixfect

A pretty way to compress images

## How it works

This is very simple bash script that uses ImageMagick for sizing down an image and dithering it, main purpose is to give images pixel art look, but this also can be used to reduce the image size quite a lot

![demo](demo/demo.gif)

## How to use

It's as simple as running `pixfect.sh` from terminal

```sh
./pixfect.sh [options] <input> <output>
```

Available options:

- `--size`: Resolution of image for manipulation
- `--scale`: Scale factor of output image
- `--colors`: Amount of colors used in image
- `--kuwahara`: Specify amount of kuwahara filter
- `--filters`: Specify Additional ImageMagick filters

All available options can be displayed using `./pixfect.sh --help`

## Variants

- Pixfect video: experimental video to pixel art GIF converter (requires ffmpeg)
- Ditherer: Pixfect but without stylized filters like sharpen and kuwahara, for example, it can be used to reduce image size for Gemini capsule

## The name

The name is a combination of Pixel and Perfect, "Pixel Perfect" is used to tell that image is created precisely to be sharp

## Similar projects

https://doodad.dev/dither-me-this

https://github.com/dbohdan/hicolor

https://github.com/giventofly/pixelit

https://github.com/MiguelMJ/MakeItPixel

## Resources

https://mastodon.social/@tbernard/109675668676999287

https://legacy.imagemagick.org/Usage/quantize/#colors

https://legacy.imagemagick.org/Usage/blur/#sharpen

https://legacy.imagemagick.org/discourse-server/viewtopic.php?t=26480

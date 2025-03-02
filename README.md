# Arkham Horror PDF creator

This script takes single images and puts them in a pdf, such that they can be printed as cards. It matches the front and back side of the cards, e.g. page 1 contains 8 front side images and page 2 contains 8 back side images, together making 8 printable cards.

## Usage

Please install (Typst)[https://github.com/typst/typst/] first. Maybe it works also in the web app, but there could be a file size limit if you use many images.

This script expects following file structure (see [example](./example/) for an example of this structure - except that `cards.typ` is missing there and some folders contain .gitkeep files):
- cards.typ
- images/
- images.txt (a list of file names in images. It assumes that every second file in this list is the backside to the previous image, e.g. the first image is front-side and second image is its back-side; use `ls -1 images > images.txt` to create it if the files in images are properly named)
- rotated/
- images_rotated.txt (similar to images.txt, except that the backsides will be rotated by 180°; use `ls -1 rotated > images_rotated.txt` to created it)
- investigators/
- images_investigators.txt (`ls -1 investigators > images_investigators.txt`)

Then run `typst compile cards.typ` which will output cards.pdf.

## Configuration

The card size can be changed in `cards.typ`. 


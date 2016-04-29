# Colorizr

Colorizr is a gem to colorize terminal output. It includes methods for printing
text in red, green, yellow, blue, pink, light blue, white, light grey, and
black.

## Installation

To install, run `$ gem install colorizr` from the terminal, and include the
line `require 'colorizr'` at the top of the Ruby file which requires it.

## Usage

To use Colorizr, simply call the `.<color>` method on a string which you wish
to colorize. When that string is `put` to the terminal, it will show up in the
desired color.

For a demo of which colors are available, run `String.sample_colors` after
requiring Colorizr. This will print out the list of colors in their respective
colors.

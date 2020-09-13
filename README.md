# vim-colors

Find approximate cterm-compatible colors.

## Usage

You can pass hex colors via arguments or pipe them from other commands.

```sh
$ ./bin/vimcolors "#00ee00"
# or pipe them to handle several colors at once
$ cat colors.txt
base0,#0c141f
base1,#091f2e
base2,#152730
$ cut -d, -f2 < colors.txt | ./bin/vimcolors
```

**NOTE**: you may need to quote arguments as they may be treated as comments
because of the initial `#`.

## Other projects

Projects I used as inspiration or from which I straight-off ripped code from:

* [whatyouhide/vim-gotham]: excellent vim colorscheme
* [jonasjacek/colors]: color reference
* [rylnd/shpec]: tests for shell scripts

## TODO

* [ ] Add tests
  * [x] Add tests for command invocation
  * [ ] Add tests to make sure color comparisons do **NOT** break
* [ ] Add [HSL] support
* [x] Add [UNIX pipe] support

[HSL]: https://www.w3.org/TR/css-color-3/#hsl-color
[whatyouhide/vim-gotham]: https://github.com/whatyouhide/vim-gotham
[jonasjacek/colors]: https://jonasjacek.github.io/colors/
[UNIX pipe]: https://web.cse.ohio-state.edu/~mamrak.1/CIS762/pipes_lab_notes.html
[rylnd/shpec]: https://github.com/rylnd/shpec

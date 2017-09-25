# Zshelldoc - Doxygen For Shell Scripts

Parses Zsh and Bash scripts, outputs Asciidoc document with:
- list of functions, including autoload functions
- call trees of functions and script body
- comments for functions

Call trees support cross-files invocations, i.e. when a script calls functiion defined in other file.

Written in Zshell language.

# Usage

```
zsd [-h/--help] [-v/--verbose] [-q/--quiet] [-n/--noansi] [--cignore <pattern>] {file1} [file2] ...
The files will be processed and their documentation will be generated
in subdirectory `zsdoc' (with meta-data in subdirectory `data').

Options:
-h/--help      Usage information
-v/--verbose   More verbose operation-status output
-q/--quiet     No status messages
-n/--noansi    No colors in terminal output
--cignore      Specify which comment lines should be ignored

Example --cignore options:
--cignore '\#*FUNCTION:*{{{*'                 - ignore comments like: # FUNCTION: usage {{{
--cignore '(\#*FUNCTION:*{{{*|\#*FUN:*{{{*)'  - also ignore comments like: # FUN: usage {{{
```

# Installation

Download and issue `make && make install`. Default install path-prefix is `/usr/local`, you
can change it by setting `PREFIX` `make` variable:

```SystemVerilog
% make install PREFIX=~/opt/local
install -c -d ~/opt/local/share/zshelldoc
install -c -d ~/opt/local/share/doc/zshelldoc
cp build/zsd build/zsd-transform build/zsd-detect build/zsd-to-adoc ~/opt/local/bin
cp README.md NEWS LICENSE ~/opt/local/share/doc/zshelldoc
cp zsd.config ~/opt/local/share/zshelldoc

% tree ~/opt
/Users/sgniazdowski/opt
└── local
    ├── bin
    │   ├── zsd
    │   ├── zsd-detect
    │   ├── zsd-to-adoc
    │   └── zsd-transform
    └── share
        ├── doc
        │   └── zshelldoc
        │       ├── LICENSE
        │       ├── NEWS
        │       └── README.md
        └── zshelldoc
            └── zsd.config
```

Other available `make` variables are: `INSTALL` (to customize install command),
`BIN_DIR`, `SHARE_DIR`, `DOC_DIR`.

# Examples

`Zshelldoc` highly motivates to document code, I did many iterations on `Zplugin's` source uplifting
documentation comments. `Zplugin` docs also show rich cross-file invocations.
[Check out Zplugin's code documentation](https://github.com/zdharma/zplugin/tree/master/zsdoc).

For other, in-place examples see:
[example 1](https://github.com/zdharma/zshelldoc/blob/master/examples/zsh-syntax-highlighting.zsh.adoc),
[example 2](https://github.com/zdharma/zshelldoc/blob/master/examples/zsh-autosuggestions.zsh.adoc)
(also in **PDF**:
[example 1](https://raw.githubusercontent.com/zdharma/zshelldoc/master/examples/zsh-syntax-highlighting.zsh.pdf),
[example 2](https://raw.githubusercontent.com/zdharma/zshelldoc/master/examples/zsh-autosuggestions.zsh.pdf)).

# Few Rules

Few rules helping to use `Zshelldoc` in your project:

 1. Write function comments before function. Empty lines between comment and function are allowed.
 1. If it's possible to avoid `eval`, then do that – `Zshelldoc` will analyze more code.
 1. Currently, functions defined in functions are ignored, but this will change shortly.
 1. I've greatly optimized new `Zsh` version (`5.4.2`), `Zshelldoc` parses long sources very fast from that version.
 1. Be aware that to convert group of scripts, you just need `zsd file1.zsh file2.zsh ...` – cross-file function invocations will work automatically.

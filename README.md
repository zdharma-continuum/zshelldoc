# zshelldoc - Doxygen for shell scripts

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

See [example 1](https://github.com/zdharma/zshelldoc/blob/master/examples/zsh-syntax-highlighting.zsh.adoc),
[example 2](https://github.com/zdharma/zshelldoc/blob/master/examples/zsh-autosuggestions.zsh.adoc) (also
in **PDF**:
[example 1](https://github.com/zdharma/zshelldoc/blob/master/examples/zsh-syntax-highlighting.zsh.pdf),
[example 2](https://github.com/zdharma/zshelldoc/blob/master/examples/zsh-autosuggestions.zsh.pdf)).

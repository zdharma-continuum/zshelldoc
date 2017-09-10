# zshelldoc - Doxygen for shell scripts

Parses Zsh and Bash scripts, outputs Asciidoc document with:
- list of functions, including autoload functions
- call trees of functions and script body
- comments for functions

Call trees support cross-files invocations, i.e. when a script calls functiion defined in other file.

Written in Zshell language.

# Usage

```
zsd [-h/--help] [-v/--verbose] [-q/--quiet] [-n/--noansi] {file1} [file2] ...
The files will be processed and their documentation will be generated
in subdirectory `zsdoc' (with meta-data in subdirectory `data').

Options:
-h/--help      Usage information
-v/--verbose   More verbose operation-status output
-q/--quiet     No status messages
-n/--noansi    No colors in terminal output
```

# Installation

Download and issue `make && make install`.

# Examples

See [example1](https://github.com/zdharma/zshelldoc/blob/master/examples/zsh-syntax-highlighting.zsh.adoc),
[example2](https://github.com/zdharma/zshelldoc/blob/master/examples/zsh-autosuggestions.zsh.adoc).

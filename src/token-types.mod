emulate -L zsh
setopt extended_glob no_octal_zeroes no_short_loops null_glob typeset_silent warn_create_global

typeset -gA TOKEN_TYPES
TOKEN_TYPES=(
    # Precommand
    '-' 1
    'builtin' 1
    'command' 1
    'doas' 1
    'eatmydata' 1
    'exec' 1
    'nice' 1
    'nocorrect' 1
    'noglob' 1
    'pkexec' 1
    'setsid' 1
    'ssh-agent' 1
    'stdbuf' 1
    'sudo' 1
    # Control flow - tokens that at "command position" are followed by a command
    $'\x28' 2 # (
    $'\x7b' 2 # {
    '!' 2 # reserved word; unrelated to $histchars[1]
    '()' 2
    'coproc' 2
    'do' 2
    'elif' 2
    'else' 2
    'if' 2
    'then' 2
    'time' 2
    'until' 2
    'while' 2
    # Command separators
    '&&' 3
    '|' 3
    '||' 3

    '&!' 4
    '&' 4
    '&|' 4
    ';' 4
    '|&' 4
)

# vim: set expandtab filetype=zsh shiftwidth=2 softtabstop=2 tabstop=2:

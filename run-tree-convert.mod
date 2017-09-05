# vim:ft=zsh

# A module, i.e. it provides multiple functions, not a single one.
# Public functions have `zsd' prefix.

# Converts tree (STDIN input) with possible
# special characters to ASCII-only
conv_ldrawing()
{
    local IFSBKP="$IFS"
    IFS=""
    while read -r line; do
        line="${line//├──/|--}"
        line="${line//└──/\`--}"
        line="${line//│/|}"
        echo "$line"
    done
    IFS="$IFSBKP"
}

# Searches for supported tree command,
# invokes to-ASCII conversion
zsd-run-tree-convert() {
    tree --charset="utf-8" "$1" 2>&1 | conv_ldrawing
}

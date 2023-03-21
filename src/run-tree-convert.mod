# A module, i.e. it provides multiple functions, not a single one.
# Public functions have `zsd' prefix.

# Parses tree output into an ASCII only format
convert_tree () {
  emulate -L zsh
  setopt extended_glob no_octal_zeroes no_short_loops null_glob typeset_silent warn_create_global
  local IFS="" line
  while read -r line; do
    line="${line//├──/|--}"
    line="${line//└──/\`--}"
    line="${line//│/|}"
    line="${line//_-_//}"
    builtin print -r -- "$line"
  done
}

# Runs conversion of tree output
zsd-run-tree-convert () {
  emulate -L zsh
  setopt extended_glob no_octal_zeroes no_short_loops null_glob typeset_silent warn_create_global
  if (( $+commands[tree] )); then
    tree -n --charset="utf-8" -- "${1}" 2>&1 | convert_tree
  else
    {
      builtin print -P -- "%F{red}Error: 'tree' was not found%f"
      exit 1
    } >&2
  fi
}

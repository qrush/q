if [[ ! -o interactive ]]; then
    return
fi

compctl -K _q q

_q() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(q commands)"
  else
    completions="$(q completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

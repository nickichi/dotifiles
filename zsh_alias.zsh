# zsh alias file

# alias
# ls
alias l="ls -al"
alias ll="ls -l"
alias la="ls -a"
# for easy cd
alias ...="../../"
alias ....="../../../"
alias .....="../../../../"
# for git
alias ga="git add"
alias gc="git commit"
alias gst="git status"
alias gp="git push"
alias gco="git checkout"

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fvim [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fvim() {
  IFS='
'
  local declare files=($(fzf-tmux --query="$1" --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
  unset IFS
}
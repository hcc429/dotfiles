# git
alias g="git"
alias lg="lazygit"

# kubernetes
alias k="kubectl"
alias ktx="kubectx"
alias kns="kubens"

# ls (GNU vs BSD)
if ls --color=auto >/dev/null 2>&1; then
  alias ls='ls --color=auto -F'
else
  alias ls='ls -G -F'
fi

# cd -> z (only if zoxide exists)
if command -v zoxide >/dev/null 2>&1; then
  alias cd='z'
fi


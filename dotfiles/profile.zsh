arch_name="$(uname -m)"
if [ "${arch_name}" = "x86_64" ]; then
    brew_path="/usr/local"
elif [ "${arch_name}" = "arm64" ]; then
    brew_path="/opt/homebrew"
else
    echo "Unknown architecture: ${arch_name}"
fi

paths=(
  "${brew_path}/opt/node@18/bin"
  "${brew_path}/opt/curl/bin"
  "${brew_path}/opt/gnu-getopt/bin"
  "$HOME/go/bin"
  "$HOME/.krew/bin"
  "$HOME/.jenv/bin"
)
export PATH="$(IFS=: ; echo "${paths[*]}"):$PATH"

unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export GOPATH="$HOME/go"
export GOROOT="${brew_path}/opt/go/libexec"
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform-plugin-cache"

export VISUAL=vim
export EDITOR=$VISUAL

# Tell homebrew to not autoupdate every single time I run it (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800
# Disable homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

ulimit -S -n 2048
eval "$(jenv init -)"

# load our own completion functions
fpath=(~/.zsh/completion "${brew_path}/share/zsh/site-functions" $fpath)
# completion; use cache if updated within 24h
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit -d $HOME/.zcompdump;
else
  compinit -C;
fi;
# disable zsh bundled function mtools command mcd
# which causes a conflict.
compdef -d mcd

source ~/.iterm2_shell_integration.zsh

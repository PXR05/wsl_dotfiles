ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit

plugins=(git)

bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^H" backward-kill-word

alias cls="clear"
alias nf="fastfetch"
alias la="eza -a"
alias ll="eza -alr"
alias ls="eza"
alias cat="batcat"
alias bat="batcat"
alias python="python3"
alias goto-nvim="cd ~/.config/nvim"
alias edit-zsh="nvim ~/.zshrc"
alias edit-zellij="nvim ~/.config/zellij/config.kdl"
alias fsize="sudo du -xsh --exclude=/{proc,sys,dev,run} * | sort -h"
alias fsizeall="sudo du -xh --exclude=/{proc,sys,dev,run} * | sort -h"

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/home/pxr/bin"
# export PATH="$PATH:/mnt/c/Users"
# export PATH="$PATH:/mnt/c/Program Files"
# export PATH="$PATH:/mnt/c/Program Files (x86)"
# export PATH="$PATH:/mnt/c/Downloads"
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export ZELLIJ_CONFIG_DIR="$HOME/.config/zellij"
export BAT_THEME="ansi"
export FZF_DEFAULT_OPTS='--walker-skip .git,node_modules --preview-window border-rounded --preview "batcat --color=always --style=numbers,changes" --padding 0,1 --layout reverse --info right'
export FZF_CTRL_R_OPTS='--preview ""'

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

eval "$(oh-my-posh init zsh --config ~/bin/tokyo.omp.json)"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH

export PATH="$PATH:/opt/nvim-linux64/bin"

# fnm
FNM_PATH="/home/pxr/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/pxr/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eval "$(zellij setup --generate-auto-start zsh)"
alias config='/usr/bin/git --git-dir=/home/pxr/.cfg/ --work-tree=/home/pxr'

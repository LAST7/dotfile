# EDITOR
export EDITOR='vim'
# export proxy for clash
# export http_proxy="http://127.0.0.1:7890"
# export https_proxy="http://127.0.0.1:7890"


# enable conda
alias condaactivate=source /opt/anaconda/bin/activate root
alias condadeactivate=source /opt/anaconda/bin/deactivate root

# enable conda for all users
# sudo ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh

# oh-my-posh setup
eval "$(oh-my-posh init zsh --config /home/last/dotfile/poshtheme/last.omp.json)"

# starship setup
# eval "$(starship init zsh)"

# alias{{{
alias ..="cd .."
alias ...="cd ../.."

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias md="mkdir -p"
alias cl="clear"

# using expac to check the recent installed packages
alias pachistory="expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort -h"

# ls
if [[ $(command -v exa) ]] {
    DISABLE_LS_COLORS=true
    unset LS_BIN_FILE
    for i (/bin/ls ${PREFIX}/bin/ls /usr/bin/ls /usr/local/bin/ls) {
        [[ ! -x ${i} ]] || {
            local LS_BIN_FILE=${i}
                    break
                }
        }
    [[ -n ${LS_BIN_FILE} ]] || local LS_BIN_FILE=$(whereis ls 2>/dev/null | awk '{print $2}')
    alias lls=${LS_BIN_FILE} 
    # lls is the original ls.
    alias ls="exa --color=auto" 
    # Exa is a modern version of ls.
    alias l='exa -lbah --icons'
    alias la='exa -labgh --icons'
    alias ll='exa -lbg --icons'
    alias lsa='exa -lbagR --icons'
    alias lst='exa -lTabgh --icons'
} else {
    alias ls='ls --color=auto'
    # color should not be always.
    alias lst='tree -pCsh'
    alias l='ls -lah'
    alias la='ls -lAh'
    alias ll='ls -lh'
    alias lsa='ls -lah'
}

# git log
alias gitlg="git log --graph --oneline --all --decorate"

# start nvim with the current folder in rtp
alias nvimrtp="nvim --cmd 'set rtp+=.'"

# open neovide and close the terminal
alias nvide="neovide && exit"

# bat
alias cat="bat"
# ccat is the original cat
alias ccat="cat"

# autoremove
alias autoremove="sudo pacman -Rsn $(pacman -Qtdq)"
# }}}


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/last/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Enable the plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh

# EDITOR
export EDITOR='vim'
# export proxy for clash
# export http_proxy="http://127.0.0.1:7890"
# export https_proxy="http://127.0.0.1:7890"

# npm local prefix
export PATH=~/Software/npm-global/bin:$PATH

# oh-my-posh setup
eval "$(oh-my-posh init zsh --config /home/last/dotfile/poshtheme/last.omp.json)"

# alias{{{
alias ..="cd .."
alias ...="cd ../.."

alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias md="mkdir -p"
alias cl="clear"
alias sctl="sudo systemctl"

alias nf="neofetch"
alias lg="lazygit"

# git log
alias gitlg="git log --graph --oneline --all --decorate"

# start nvim with the current folder in rtp
alias nvimrtp="nvim --cmd 'set rtp+=.'"

# open neovide and close the terminal
alias nvide="neovide && exit"

# autoremove
alias autoremove="sudo pacman -Rsn $(pacman -Qtdq) && yay -Rsn $(yay -Qtdq)"

# micromamba
alias mm="micromamba"
alias mmel="micromamba env list"

alias mma="micromamba activate"
alias mmd="micromamba deactivate"

alias mmi="micromamba install"
alias mmic="micromamba install -c conda-forge"
alias mmid="micromamba install -c default"

# synchronize system time
alias timesync="sudo ntpd -qg"

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
# }}}


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
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
# Enable custom scripts
source /home/last/dotfile/script/zsh/fancy-ctrl-z.sh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/usr/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/last/Software/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/last/Software/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/last/Software/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/last/Software/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

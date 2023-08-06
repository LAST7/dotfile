# fancy-ctrl-z.sh
# This is a script which customizes the behavior of Ctrl + Z in the zsh shell.
# see https://bloglast.top/2023/08/06/zsh-%E5%89%8D%E5%8F%B0%E7%A8%8B%E5%BA%8F%E6%8C%82%E8%B5%B7/ for more info
# please source this file in the .zshrc

fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-intut
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

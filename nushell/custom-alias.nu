# Alias

alias lst = tree -pCsh
alias l = ls -la
alias ld = ls -ld

alias md = mkdir
alias cl = clear

alias sctl = sudo systemctl

alias blctl = bluetoothctl

alias nf = neofetch
alias lg = lazygit

# start nvim with the current folder in rtp
alias nvimrtp = nvim --cmd "set rtp+=."

# autoremove
alias autoremove = yay -Rsn $"(yay -Qtdq)"

# synchronize system time
alias timesync = sudo ntpd -qg

def nvide [] {
    neovide; exit
}

# using expac to check the recent installed packages
def pachistory [ number: int = 20 ] {
    expac --timefmt='%Y-%m-%d %T' '%l\t%n'
    | lines
    | split column "\t" install-time package-name
    | sort-by install-time
    | last $number
}

# find processes sorted by greatest cpu utilization
def maxu [] {
    ps
    | where cpu > 0
    | sort-by cpu
    | reverse
}

# pretty git log
def gitlg [] {
    git log --pretty=%h»¦«%s»¦«%aN»¦«%aE»¦«%aD -n 25
    | lines
    | split column "»¦«" commit subject name email date
    | upsert date {|d| $d.date | into datetime}
    | sort-by date
    | reverse
}


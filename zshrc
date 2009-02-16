zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/garoth/.zshrc'
autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt beep notify
bindkey -v # Vim mode

#Startup Commands & Aliases
eval "$(dircolors -b)"
export PATH=/usr/local/bin:/home/garoth/Programs/bin:$PATH:/opt/kde/bin:/home/garoth/.scripts
export EDITOR=/usr/bin/vim
alias date='date +"~ %I:%M %p on %A, the %eth of %B ~"'
alias ls='ls --color=auto'
alias althack='telnet nethack.alt.org'
alias dance='ssh dwc.mercenariesguild.net'
alias uwsolaris='ssh -X aapachin@cpu10.student.cs.uwaterloo.ca'
alias uwlinux='ssh -X aapachin@mef-fe10.student.cs.uwaterloo.ca'
alias uwsolarissftp='sftp aapachin@cpu10.student.cs.uwaterloo.ca'
alias uwlinuxsftp='sftp aapachin@mef-fe10.student.cs.uwaterloo.ca'
alias definenote='cp ~garoth/Studies/UsefulBits/underline.png ./ && echo Done'
alias crawl='crawl -dir "/home/garoth/.crawl"'
alias cdplu='cd /home/garoth/Coding/C/plutocracy'
alias cddra='cd /home/garoth/Coding/C/dragoon'
alias :q='exit'
alias :q!='echo "Ok, ok!" && sleep 0.3 && exit'
alias pacman="sudo pacman-color"
alias gftp="gftp-text"
alias scons="/usr/bin/python /usr/bin/scons"
alias tram="transmission-remote"
alias top="htop"

# Colouring & Prompt
autoload colors zsh/terminfo
setopt prompt_subst
if [[ "$terminfo[colors]" -ge 8 ]]; then
    colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
    eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
    (( count = $count + 1 ))
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

export PROMPT='$PR_GREEN%m$PR_WHITE.$PR_BLUE%n$PR_WHITE in $PR_MAGENTA%c\
$PR_WHITE: '

# DEVTODO
TODO_OPTIONS="--summary"

ls()
{
        devtodo ${TODO_OPTIONS}
        /bin/ls --color=auto "$@"
}

cd()
{
        if builtin cd "$@"; then
                devtodo ${TODO_OPTIONS}
                /bin/ls --color=auto
        fi
}

pushd()
{
        if builtin pushd "$@"; then
                devtodo ${TODO_OPTIONS}
        fi
}

popd()
{
        if builtin popd "$@"; then
                devtodo ${TODO_OPTIONS}
        fi
}

#Execute these as a terminal opens
date
devtodo ${TODO_OPTIONS}

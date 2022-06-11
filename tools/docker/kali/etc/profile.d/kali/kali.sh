#!/bin/zsh
# Kali customizations to the default shell environment

# Add /usr/local/sbin, /usr/sbin and /sbin to the PATH for all users
if ! echo "$PATH" | tr : '\n' | grep -q "^/sbin$"; then
    PATH="/usr/local/sbin:/usr/sbin:/sbin:$PATH"
fi

# Display message of the day information for cloud systems and
# minimum installs such as WSL or Docker
# IGNORE MOTD
# if [ -e /usr/bin/kali-motd ]; then
#     kali-motd
# fi

unset prompt_symbol; prompt_symbol='@'
export PROMPT=$'%F{%(#.blue.green)}┌──${debian_chroot:+($debian_chroot)─}${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV))─}(%B%F{%(#.red.blue)}%n'$prompt_symbol$'%m%b%F{%(#.blue.green)})-[%B%F{reset}%(6~.%-1~/…/%4~.%5~)%b%F{%(#.blue.green)}]\n└─%B%(#.%F{red}#.%F{blue}$)%b%F{reset} '

export TERMINFO=/usr/share/terminfo/
export TERM=xterm-256color

set -o vi

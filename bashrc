# /etc/skel/.bashrc:
# $Header: /home/cvsroot/gentoo-src/rc-scripts/etc/skel/.bashrc,v 1.8 2003/02/28 15:45:35 azarah Exp $

# This file is sourced by all *interactive* bash shells on startup.  This
# file *should generate no output* or it will break the scp and rcp commands.

# export PS1=$PS1"\[\e]31;\w\a\]"

# colors for ls, etc.
# eval `dircolors -b /etc/DIR_COLORS`
# alias d="ls --color"
# alias ls="ls --color=auto"
# alias ll="ls --color -l"
# alias la="ls --color -a"
# alias lla="ls --color -la"

# alias grep="grep -E"

# Change the window title of X terminals 
case $TERM in
	xterm*|rxvt|Eterm|eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

# ##uncomment the following to activate bash-completion:
# #[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

# # export PATH="$HOME/bin/local:$HOME/bin:$HOME/local/bin:/usr/local/kagipdf/script/:$PATH"
# export LANG=ja_JP.utf8
# export PAGER="lv -c"
# # export MANPAGER="/usr/bin/less -r"

# # perl5
# export PERL5LIB="$HOME/local/lib/perl5:$HOME/local/lib/perl5/site_perl:$PERL5LIB"

# # python
# export PYTHONPATH="$HOME/local/lib/python:$PYTHONPATH"
# export PYTHONSTARTUP=/home/hiro/.pystartup

# # java
# export JAVA_FONTS=/usr/share/fonts/kochi-substitute:/opt/sun-jdk-1.4.2.07/jre/lib/fonts
# export CLASSPATH=.:$CLASSPATH

# # load configuration sepcified local host.
# if [ -f $HOME/.bashrc.local ]; then
    # source $HOME/.bashrc.local
# fi

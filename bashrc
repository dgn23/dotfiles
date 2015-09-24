# .bashrc

alias thanks!='echo no doubt, homie'
alias cooooooool!='echo I KNOOOOOOWWWWWW!!!!'
alias ack!='echo Gah!'
alias chrome='chromium'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# custom functions
if [ -f /home/$USER/.bash/functions ]; then
	. /home/$USER/.bash/functions
fi

# custom functions
if [ -f /home/$USER/.bash/aliases ]; then
	. /home/$USER/.bash/aliases
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

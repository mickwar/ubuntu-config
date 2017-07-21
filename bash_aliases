#!/bin/bash
# ~/.bash_aliases

# modify commands
alias date="echo ''; date +%A\ %d\ %b\ %Y\ %r; echo ''"
alias ls='ls -ohF --color=auto'
alias dir='dir -F --color=auto'
alias ispell="ispell -x"
alias convert="convert -density 600"
# convert .pdf to .png with "convert a.pdf b.png"
# the -density 600 increase dpi for better solution, default is 72
alias df="df -h"
# for byu printing
alias lpr="lpr -U mawarner"

# interaction
alias mv="/bin/mv -i"
alias cp="/bin/cp -i"
alias rm="/bin/rm -i"

# force tmux to think the terminal has 256 color support
alias tmux="tmux -2"

# open chrome from terminal
alias chrome="google-chrome &"

# open specific files
alias todo="vi ~/.todo"
alias hearts="vi ~/.hearts"

# shutdown
alias shutit="sudo shutdown now -P"

# connected to byu stat servers
alias studentt='ssh -Y mickfwop@studentt.byu.edu'
alias hilbert='ssh -Y mickfwop@hilbert.byu.edu'
alias studenttsftp='sftp mickfwop@studentt.byu.edu'
alias hilbertsftp='sftp mickfwop@hilbert.byu.edu'
alias qessh='ssh mwarner@23.229.180.228'
alias qeftp='sftp mwarner@23.229.180.228'
alias citris='ssh -X mawarner@citrisdance.soe.ucsc.edu'
alias negroamaro='ssh -X mawarner@negroamaro.cse.ucsc.edu'
alias vpn_ucsc='sudo openconnect vpn.ucsc.edu'

#===============================================================
# NAME      :  bashrc
# Programmer:  Pedro Pavan
# Date      :  01-10-2014
# Purpose   :  Bash init
#
# Changes history:
#
#  Date     |    By       |  Changes/New features
# ----------+-------------+-------------------------------------
# Pedro	      10-01-2014    Initial release
# Pedro	      22-02-2015    Private keys
#===============================================================

# History settings
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# Setting variable
export EDITOR=vim

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Customize prompt color
color_prompt=yes

if [ "$color_prompt" = yes ]; then
    PS1='[\[\033[01;33m\]\t\[\033[00m\]|\[\033[01;35m\]\#\[\033[00m\]] \[\033[01;31m\]${?##0}\[\033[00m\](\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;36m\]\H\[\033[00m\]):\[\033[01;34m\]\w\[\033[00m\] \$ '
else
    PS1='[\t|\#] ${?##0}(\u@\H):\w \$ '
fi
unset color_prompt

# Include scripts dir in PATH
export PATH=$PATH:/opt/scripts

# ZZ 
export ZZOFF="" 
export ZZPATH="/opt/zz/funcoeszz" 
source "$ZZPATH"

#################################
# Alias
################################

# S2
alias s2='zzdata hoje - 13/11/2009'

# Add an "alert" alias to show popup notifications
alias alert='notify-send --urgency=low -t 5000'

# Connect to ukn.com.br (~/.ssh/config)
alias ukn='ssh -q ukn'

# See a list of users
alias userlist='cat /etc/passwd | grep "/bin/bash" | cut -d ':' -f 1'

# See a list of softwares
alias softwarelist='dpkg --get-selections | grep -v deinstall | awk "{ print \$1 }"'

# See a list of process
alias psu='ps -fu $USER'

# List files & dirs
alias ls='ls --color=auto'
alias ll='ls -lF --color=auto'
alias la='ls -lha --color=auto'
alias l='ls -CF --color=auto'

# Grep filter with color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Change current directory to
alias ..='cd ..'
alias cd-desk='cd /home/$USER/Desktop/'
alias cd-down='cd /home/$USER/Downloads/'
alias cd-docs='cd /home/$USER/Documents/'
alias cd-drop='cd /home/$USER/Dropbox/'

# Handy short cuts 
alias h='history'
alias j='jobs -l'
alias top='htop'
alias info='pinfo'

# Create a new set of commands
alias path='echo -e ${PATH//:/\\n} | sort | uniq'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# Set vim as default
alias vi='vim'
alias svi='sudo vim'

# Open current folder
alias ofolder='nautilus "$(pwd)" &'

# Show open ports
alias ports='netstat -tulanp'

# Display all iptables rules 
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'

# Install & Update Debian Linux server
alias a-update='sudo aptitude update && sudo aptitude upgrade -y'
alias a-install='sudo aptitude install -y'
alias a-search='sudo aptitude search'

# Pass halt/reboot via sudo
alias reboot='sudo /sbin/reboot'
alias halt='sudo /sbin/halt'

# Tar files
alias tar-z='tar -zxvf'
alias tar-c='tar -czvf'
alias tar-l='tar -ztvf'

# Tree
alias tree='tree -aC'

# Copy file with graphical mode
alias cp-d='gcp -r'
alias cp-f='gcp'

# Find easily
alias f-dir='find . -type d'
alias f-file='find . -type f -iname' 
alias f-size='find . -type f -size'

alias fa-dir='sudo find / -type d'
alias fa-file='sudo find / -type f -iname' 
alias fa-size='sudo find / -type f -size'

# Check temperature
alias t-hd='echo $(sudo hddtemp /dev/sda | awk "{ print \$4 }")'
alias t-proc='echo "$(acpi -t | awk "{ print \$4 }")°C"'

# Disk usage - human like
alias du-f='du -h'
alias du-d='du -sh'

# Go to the project directory
projeto() { cd ~/Dropbox/Documents/Projetos/$1 ; }

# Lico Update
alias lico='/opt/scripts/lico -m'

# Dropbox WA
alias dropbox='dbus-launch dropbox'
alias dropbox_restart='dropbox stop ; pkill -U $USER -f dropbox ; dropbox start -i ; sleep 10 ; dropbox status'

# Android mounted device
alias android='cd /run/user/$(id -u)/gvfs/'

# Wine
export WINEARCH=win32
export WINEPREFIX=${HOME}/.wine

# Webcam
alias cam_disable='sudo modprobe -r uvcvideo'
alias cam_enable='sudo modprobe uvcvideo'

# Insulter
if [ -f ${HOME}/Dropbox/Documents/unix/conf/bash.command-not-found ]; then
	source ${HOME}/Dropbox/Documents/unix/conf/bash.command-not-found
fi
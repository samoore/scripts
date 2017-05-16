# tmux on startup always has this module loaded for some reason so unload it...
module unload python/anaconda-2.4.1-python-2.7

# Define UMDIR
export UMDIR=/oper/admin/um_fcm/um

# PATH additions
export PATH=/oper/admin/um_fcm/bin:$PATH
export PATH=/oper/admin/um_fcm/fcm/latest/bin:$PATH

# Use more recent version of Perl on AIX (needed for FCM)
if [[ $(uname) == AIX ]]; then 
    export PATH=/opt/niwa/perl/AIX/5.20.0/bin:$PATH
else
    module load subversion/1.8.13
fi

# Cache the MOSRS password
[[ "$-" != *i* || $(uname) == AIX ]] && return # Stop here if not running interactively
source ~um_fcm/bin/mosrs-setup-gpg-agent

# User specific aliases and functions
# List files tracked in a Git repo 
alias gitfilelist='git ls-tree -r master --name-only'
# Simple shortcut
alias l='ls -lrth'
# Simple shortcut
alias gcon='rose suite-gcontrol'
# Display line numbers and percentage through file
alias less='less -M -N'
# Alias to `rose suite-run`
alias rsr='rose suite-run'
# Go to /hpcf/working/williamsjh directory
alias working='cd /hpcf/working/williamsjh/'
# Go to /hpcf/data/williamsjh directory
alias data='cd /hpcf/data/williamsjh/'
# Go to rose bush
alias rb='firefox http://wrh-1.hpcf.niwa.co.nz:8080/suites/williamsjh &'
# Go to ~/roses
alias c='clear'
# Go to ~/roses
alias r='cd ~/roses'
# Go to ~branches/
alias br='cd ~/branches'
# Alias log to 'rose suite-log'
alias log='rose suite-log'
# Alias cr to 'cd ~/cylc-run'
alias cr='cd /hpcf/working/williamsjh/cylc-run'
# Alias fdg to 'fcm diff -g &'
alias fdg='fcm diff -g &'
# Alias for `cylc trigger` in PWD 
alias trig='cylc trigger $(basename "$PWD")'
# Aliases for local calls to '> cylc monitor/stop/kill [suite-ID]'. 
alias mn='cylc monitor $(basename "$PWD")'
alias cylc-stop='cylc stop $(basename "$PWD")'
alias cylc-kill='cylc kill $(basename "$PWD")'
alias ks='cylc kill $(basename "$PWD");cylc stop --now $(basename "$PWD")'
# cd to a Cylc suite's `work` directory and see how may atmos t steps have run
alias wtchsuite='watch "grep -ir atm_step */*/pe_output/*00|tail"'
# Open 'fcm diff' in less
alias fcmdiff='fcm diff|less'
# Alias to '> rose edit &'
alias re='rose edit &'
# Force tmux to use 256 colours, tip from
# http://askubuntu.com/questions/125526/vim-in-tmux-display-wrong-colors
alias tmux='tmux -2'
# Shorthand alias to tmux
alias x='tmux'
# Clear terminal before running fcm commands. This is particularly useful for
# 'fcm diff'. 
alias cfcm='clear ; fcm'
# Remove prompt from git to confirm which graphical diff viewer to view after
# typing 'git difftool'. This was gleaned from
# http://stackoverflow.com/questions/7897517/why-git-difftool-does-not-open-the-tool-automatically
# and was set up using 'git config --global diff.tool gvimdiff' which was in turn gleaned
# from
# http://stackoverflow.com/questions/3713765/viewing-all-git-diffs-with-vimdiff 
alias gitdifftool='git difftool -y'
# Saving location of nf-config
alias nf-config='/opt/niwa/netcdf/AIX/4.3.3.1/parallel/bin/nf-config'
# My Vim install
alias myvim='/home/williamsjh/bin/vim'
# Open all ~/cylc-run directories in GCylc
alias gconall='for folder in *; do cd ~/cylc-run; cd $folder; rose suite-gcontrol & cd ..; done'
# Some git alises
alias gita='git add .'
alias gitb='git branch'
alias gitac='git add . && git commit'
alias gitc='git commit'
alias gits='git status'
# Alias to `cylc gscan`
alias gscn='cylc gscan&'
# Edit command prompt
export PS1="\d|\t|\W> "
# Update contents of directory every 2s
alias wtch='watch "ls -lth"'
# Alias for going to my deepsouth folder
alias deep='cd /hpcf/working/deepsouth/'


# Define gedit to be the svn and fcm commit editor (vim, gvim -f, emacs, gedit, kate, nedit)
export SVN_EDITOR=vim

# PATH additions
# Add path to Jonny's scripts
export PATH=/home/williamsjh/scripts:$PATH
# Add ~/local/bin
export PATH=/home/williamsjh/local/bin:$PATH
# Add ancil_2anc
export PATH=/home/williamsjh/Python/usr/lib/python2.7/site-packages/ants/bin:$PATH

# Python things to load on startup
export PYTHONSTARTUP=/home/williamsjh/.PYTHONSTARTUP

#Needed for 'cylc gpanel'
export BONOBO_ACTIVATION_PATH=$HOME/.bonobo

#Use vi keystrokes
#set -o vi

#Use local Cylc fork
#export CYLC_HOME=$HOME/cylc

# Add ants and cf_units to my PYTHONPATH if the user wants to!
# Code from
# http://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script,
# accessed February 1st 2017.
while true; do
    read -p "Do you want to use Jonny Williams' personal installs of the ants and cf_units Python modules?" yn
    case $yn in
        [Yy]* ) module load python/anaconda-2.4.1-python-2.7; export PYTHONPATH=/home/williamsjh/Python/usr/lib/python2.7/site-packages:/home/williamsjh/Python/usr/lib/python2.7/site-packages/ants/lib:$PYTHONPATH; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done














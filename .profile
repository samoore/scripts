# tmux on startup always has this module loaded for some reason so unload it...
module unload python/anaconda-2.4.1-python-2.7

# Define UMDIR
export UMDIR=/oper/admin/um_fcm/um

#Use working copy of Rose
#export ROSE_HOME_ROOT=/home/williamsjh
#export ROSE_HOME=$ROSE_HOME_ROOT/rose


# PATH additions
export PATH=/oper/admin/um_fcm/bin:$PATH
export PATH=/oper/admin/um_fcm/fcm/latest/bin:$PATH
export PATH=/home/williamsjh/nemo/trunk/NEMOGCM/TOOLS/REBUILD_NEMO:$PATH

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
. ~/scripts/aliases

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

#export CYLC_VERSION=7.5.0
# Add ants and cf_units to my PYTHONPATH if the user wants to!
# Code from
# http://stackoverflow.com/questions/226703/how-do-i-prompt-for-yes-no-cancel-input-in-a-linux-shell-script,
# accessed February 1st 2017.
#while true; do
#    read -p "Do you want to use Jonny Williams' personal installs of the ants and cf_units Python modules?" yn
#    case $yn in
#        [Yy]* ) module load python/anaconda-2.4.1-python-2.7; export PYTHONPATH=/home/williamsjh/Python/usr/lib/python2.7/site-packages:/home/williamsjh/Python/usr/lib/python2.7/site-packages/ants/lib:$PYTHONPATH; break;;
#        [Nn]* ) break;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done













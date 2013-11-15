#!/usr/bin/env bash

# VIRTUALENVWRAPPER (should go before bash_functions)
# =============================================
# Check the workon_cwd function in bash_prompt or
# the .virtualenv/postactivate file to customize the
# shell prompt after the virtualenv activation
export WORKON_HOME="$HOME/.virtualenvs"
source /Library/Frameworks/Python.framework/Versions/2.7/bin/virtualenvwrapper.sh


# BASH_ALIASES
# =============================================
source ~/.dotfiles/bash/bash_aliases

# BASH FUNCTIONS
# =============================================
source ~/.dotfiles/bash/bash_functions

# BASH PROMPT CUSTOMIZATION
# =============================================
source ~/.dotfiles/bash/bash_prompt

# EXTRA
# =============================================
# ~/.extra can be used for other settings you don’t want to commit.
bash_extra=~/.bash_extra
[ -r "$bash_extra" ] && [ -f "$bash_extra" ] && source "$bash_extra"


# BASHMARKS
# =============================================
# http://bilalh.github.com/2012/01/14/enchanted-bashmarks-terminal-directory-bookmarks/
source ~/.dotfiles/bashmarks/bashmarks.sh


# GIT PROMPT (I'm not using it because I'm using a customized function inside bash_prompt)
# =============================================
# if [ -f ~/.dotfiles/scripts/git-prompt.sh ]; then
#     source ~/.dotfiles/scripts/git-prompt.sh
# fi


# NEWTAB (I'm not using it because I need to fix it for iTerm)
# =============================================
# Opens a new tab in the current Terminal window
# and optionally executes a command (To document and fix for iTerm)
# source ~/.dotfiles/scripts/newtab.sh


# PATH TOOLS
# =============================================
# A set of tools for manipulating ":" separated
# lists like the canonical $PATH variable.
source ~/.dotfiles/scripts/path_tools.bash



# PYTHON STARTUP
# =============================================
# Completion for python command line (commented out right now)
# Custom hystory file
export PYTHONSTARTUP=~/.dotfiles/scripts/pystartup.py


# GLS (GNU LS)
# ==============================================
# I use the GNU ls (gls) included in COREUTILS (downloaded with BREW)
# This let me use dircolors command, that will use .dircolors file to colorize gls
#
# http://lostincode.net/posts/homebrew
# http://www.conrad.id.au/2013/07/making-mac-os-x-usable-part-1-terminal.html
# https://github.com/seebi/dircolors-solarized

# Uses gls instead of ls
alias ls='gls --color=always'

# load my color scheme
eval `gdircolors  ~/.dotfiles/data/dircolors`


# GREP ALWAY COLORIZED (!!! THIS CAUSE PROBLEM WITH GIT-COMPLETION)
# =============================================
# alias grep="grep --color=always"
# alias egrep="egrep --color=always"


# BASH COMPLETION
# =============================================
# Installed with Brew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


# =============================================
# COMPLETIONS
# =============================================

# PIP COMPLETION
# ===========================
_pip_completion(){
    COMPREPLY=(
        $(  COMP_WORDS="${COMP_WORDS[*]}" \
            COMP_CWORD=$COMP_CWORD \
            PIP_AUTO_COMPLETE=1 $1 )
    )
}
complete -o default -F _pip_completion pip


# GRUNT COMPLETION (!!! Not working, Experimental)
# ===========================
eval "$(grunt --completion=bash)"


# CYCLIC TAB-COMPLETION
# ===========================
# bind '"\t":menu-complete'


# =============================================
# PATHS
# =============================================
# Loading sequence:
# 1)    /etc/paths
# 2)    /etc/paths./whatever (e.g. x11)
# 3)    ~/.MacOSX/environment.plist (AVOID!)
# 4)    PATH defined in this file

# BEWARE: Avoid 3) cause it overrides the default PATH set in /etc/paths.

# Local bin in my home (scripts various stuff)
PATH="$PATH:~/bin"

# Anaconda ipython (TO REMOVE)
# PATH="$PATH:~/bin/anaconda/bin"

# gcc and other dev stuff
PATH="${PATH}:/Developer/usr/bin"

# Heroku Toolbelt
PATH="$PATH:/usr/local/heroku/bin"

# PATH for Python 2.7
PATH="${PATH}:/Library/Frameworks/Python.framework/Versions/2.7/bin"

# MySql
PATH="${PATH}:/usr/local/mysql/bin"

export PATH

# Old content of .MacOSX/environment.plist (I don't use it)
# PATH="${PATH}:/usr/X11/bin::~/bin"


# =============================================
# DEVELOPMENT
# =============================================


# SET COMPILER VERSION
# ===========================
# Tmp setting for compiling
# mysql and python
#
# export CC="gcc-4.0"
# export CXX="g++-4.0"


# FIX RANDOM COMPILATION ERROR
# ===========================
# Because sometimes it doesn't
# find the libs that are actually
# here (e.g: crt1.10.6.o)
export MACOSX_DEPLOYMENT_TARGET=10.6


# DON'T REMEMBER
# ===========================
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/Developer/SDKs/MacOSX10.6.sdk/usr/include:/usr/local/include


# HEADERS (I guess)
# ===========================
# I added the headers from brew (/usr/local/include)
export LIBRARY_PATH=$LIBRARY_PATH:/Developer/SDKs/MacOSX10.6.sdk/usr/lib:/usr/local/lib/


# FIX MySQLdb ERROR
# ===========================
# Fix problem when importing
# mysql-python (MySQLdb)
# http://stackoverflow.com/questions/4559699/python-mysqldb-and-library-not-loaded-libmysqlclient-16-dylib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/



# =============================================
# LOCALE
# =============================================
# Export locale (required in Django 1.4)
# https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man3/setlocale.3.html

export LANG="en_US.UTF-8"
# Set a locale for string collation routines.  This controls alphabetic ordering in strcoll() and strxfrm().
export LC_COLLATE="en_US.UTF-8"
# Set a locale for the ctype(3) and multibyte(3) functions.  This controls recognition of upper and lower case,
# alphabetic or non-alphabetic characters, and so on.
export LC_CTYPE="en_US.UTF-8"
# Set a locale for message catalogs, see catopen(3) function.
export LC_MESSAGES="en_US.UTF-8"
# Set a locale for formatting monetary values; this affects the localeconv() function.
export LC_MONETARY="en_US.UTF-8"
# Set a locale for formatting numbers.  This controls the formatting of decimal points in
# input and output of floating point numbers in functions such as printf() and scanf(), as
# well as values returned by localeconv().
export LC_NUMERIC="en_US.UTF-8"
# Set a locale for formatting dates and times using the strftime() function.
export LC_TIME="en_US.UTF-8"
# Set the entire locale generically.
export LC_ALL="en_US.UTF-8"


# Dotfiles inspired by many people
# Inspired by https://github.com/javierjulio/dotfiles
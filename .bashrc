# Running a standalone bashrc

# Load bash settings
BASHRC_DIR=".bash"
for i in `find ~/dot_files/$BASHRC_DIR/ -type f -name ".bashrc_*"`; do
    . "$i"
done

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# USER[WDIR]$ ' #Default green prompt for users
if [ "$color_prompt" = yes ]; then
    PS_BASE="\[$Color_Off\]\u \[$Cyan\][\w]"
    PS_STARTER="\[$Color_Off\]\$ \[$Color_Off\]"
    PROMPT_COMMAND='PS1="$PS_BASE$(git_prompt)$PS_STARTER"'

else
    PROMPT_COMMAND='PS1="\u [\w]<$(git_branch)>$"'
fi

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Add maven to PATH
export PATH="$PATH:$HOME/bin/apache-maven-3.3.9/bin"

# Add heroku to PATH
#export PATH="$PATH:$HOME/stools/heroku-linux-x64/bin"

# Cygwin - Running startxwin on start
#startxwin &> /dev/null &

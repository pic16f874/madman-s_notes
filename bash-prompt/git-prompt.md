```bash
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi
```

```bash
. ~/git-prompt.sh
#export GIT_PS1_SHOWDIRTYSTATE=1
#export PS1 '\w$(__git_ps1 " (%s)")\$ '

RSTCOL='\[\033[00m\]'
FGYEL='\[\033[01;33m\]'
BGRED='\[\033[01;41m\]'
BG='\[\033[01;40m\]'

# not working properly
#RED=$(tput setaf 1); GRN=$(tput setaf 2); YEL=$(tput setaf 3); BLU=$(tput setaf 4);
#MGN=$(tput setaf 5); CYA=$(tput setaf 6); WHT=$(tput setaf 7); RST=$(tput sgr0)
#BGGRN=$(tput setab 2);


export GIT_PS1_SHOWDIRTYSTATE=1 GIT_PS1_SHOWSTASHSTATE=1 GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM=verbose GIT_PS1_DESCRIBE_STYLE=branch GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_HIDE_IF_PWD_IGNORED=1

if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;37m\]@\[\033[01;40m\]\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\] $(__git_ps1 "(%s)")\[\033[00m\] \$'
    PS1='${debian_chroot:+($debian_chroot)}\[$BLU\]\w\[$YEL\] $(__git_ps1 "(%s)")\[$RST\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(__git_ps1 " (%s)") \$ '
fi
unset color_prompt force_color_prompt
```

```bash
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
```

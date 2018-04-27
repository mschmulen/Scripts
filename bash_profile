# terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#export GREP_OPTIONS='--color=auto'

#  ---------------------------------------------------------------------------
#  GIT
#  ---------------------------------------------------------------------------

# git completion
if [ -f ~/Scripts/.git-completion.bash ]; then
  . ~/Scripts/.git-completion.bash
fi

alias gs="git status"
alias ga="git add"
#alias go="git checkout"
alias gc="git commit"
#alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
#alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %Cred(Author: %ae)%Creset" --abbrev-commit --date=relative'
alias gp="git push"
alias gd="git diff"
#  ---------------------------------------------------------------------------
#  ---------------------------------------------------------------------------

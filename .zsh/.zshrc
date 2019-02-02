# fork Prezto's .zshrc
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Source my alias conf
if [[ -s "$HOME/dotfiles/.zsh/.zshrc.alias" ]]; then
  source "$HOME/dotfiles/.zsh/.zshrc.alias"
fi

# Source local .zshrc
if [[ -s "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi

if [[ -s "$HOME/dotfiles/.zsh/.zshrc.util" ]]; then
    source "$HOME/dotfiles/.zsh/.zshrc.util"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# for fzf or kernel issue: https://github.com/junegunn/fzf/issues/1486
export FZF_DEFAULT_OPTS="--height 90%"
export FZF_CTRL_T_OPTS="--height 90%"
export FZF_CTRL_R_OPTS="--height 90%"
export FZF_ALT_C_OPTS="--height 90%"

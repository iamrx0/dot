eval "$(starship init zsh)"
setopt IGNORE_EOF
source /Users/amerm/source/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/amerm/source/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^j' autosuggest-execute
bindkey '^ ' autosuggest-accept
bindkey -s '^H' 'fg\n'
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yml"
eval "$(zoxide init zsh)"
export FZF_DEFAULT_COMMAND="fdfind --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=d"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS"
                        --color=fg:-1,fg+:-1,bg:-1,bg+:-1
                        --color=hl:#5ea1ff,hl+:#5ef1ff,info:#afaf87,marker:#5eff6c
                        --color=prompt:#ff5ea0,spinner:#ff5ef1,pointer:#bd5eff,header:#87afaf
                        --color=border:#262626,label:#aeaeae,query:#d9d9d9"


_fzf_compgen_path() {
    fdfind --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fdfind --type=d --exclude .git . "$1"
}

alias v="nvim"
alias lg="lazygit"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias cd="z"
. "$HOME/.cargo/env"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"


export PATH=$PATH:$HOME/go/bin

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
export PATH=$PATH:/usr/local/go/bin

if [ "$TMUX" = "" ]; then tmux; fi
export PATH=$PATH:$HOME/.local/bin
export PATH="$PATH:/Users/amerm/.dotnet/tools"

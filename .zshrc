setopt autocd
autoload -Uz compinit
compinit

# alias
alias gs="git status"
alias rg="rg -i"
alias ls="eza"
alias ll="eza -lh"
alias l="eza -alh"
alias vim="nvim"
alias v="nvim"
alias nvm="fnm"

# change caps lock to backspace
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000002A}]}' > /dev/null

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/zsh_plugins/git.plugin.zsh


# functions 
 switchf() {
   local branches branch
   branches=$(git branch --all | grep -v HEAD) && branch=$(echo "$branches" | fzf-tmux -d $((2 + $(wc -l <<<"$branches"))) +m) && git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
 }

 preview() {
   fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
 }


eval "$(oh-my-posh init zsh --config '/Users/noahpesta/dotfiles/theme.omp.json')"
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/zsh_plugins/zsh-autosuggestions.zsh

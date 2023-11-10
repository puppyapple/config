fish_config theme choose "Dracula Official"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
status is-interactive &&
    eval /Users/zijunwu/miniconda3//bin/conda "shell.fish" hook $argv | source
# <<< conda initialize <<<
#
set PATH $PATH /opt/homebrew/bin
set PATH $PATH /usr/local/bin
set PATH $PATH /Users/zijunwu/.local/bin
set PATH $PATH /Users/zijunwu/.dotfiles/bin

alias vim=/usr/local/bin/nvim
alias server="autossh -M 0 -t ubuntu"
alias gpu="watch --color -n1 gpustat --color -cpu"
alias ll="exa -abghl --icons --color-scale"
set -Ux LS_COLORS "$(vivid generate one-dark)"
zoxide init fish | source
fzf_configure_bindings --directory=\cf --git_status=\cg
# bind \ci accept-autosuggestion
# export TERM=alacritty

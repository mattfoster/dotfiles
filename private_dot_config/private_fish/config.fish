if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-interactive && test -f ~/.config/fish/custom/git_fzf.fish
    source ~/.config/fish/custom/git_fzf.fish
    git_fzf_key_bindings
end

if status is-interactive && test -f ~/.config/fish/custom/network.fish
    source ~/.config/fish/custom/network.fish
end

if status is-interactive && test -f ~/.config/fish/custom/gpt.fish
    source ~/.config/fish/custom/gpt.fish
end

if test -f ~/.config/op/plugins.sh 
    source ~/.config/op/plugins.sh
end

set sponge_delay 5

alias gs="git status"

set PATH /usr/local/opt/perl/bin/ $PATH
set PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set PATH $HOME/go/bin $PATH


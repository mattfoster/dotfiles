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

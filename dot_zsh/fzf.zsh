# Add fzf keybindings and completions, if fzf is installed
if command -v fzf > /dev/null 2>&1; then
    # Would ideally like to use $(brew --prefix fzf) for this, but it's too slow
    local FZF_DIR="/usr/local/opt/fzf"

    [ -f "$FZF_DIR/shell/key-bindings.zsh" ] && source "$FZF_DIR/shell/key-bindings.zsh"
    [ -f "$FZF_DIR/shell/completion.zsh" ] && source "$FZF_DIR/shell/completion.zsh"
fi

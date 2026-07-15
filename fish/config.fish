set -gx EDITOR micro
set -gx VISUAL micro

if status is-interactive
    set -g fish_greeting
    starship init fish | source
    zoxide init fish --cmd cd | source
    fzf_key_bindings
    fastfetch

    # fzf defaults (fd / bat preview)
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
    set -gx FZF_ALT_C_COMMAND 'fd --type d --hidden --follow --exclude .git'
    set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border --info=inline --preview-window=right:50%:wrap'
    set -gx FZF_CTRL_T_OPTS '--preview "bat --color=always --style=numbers --line-range=:200 {} 2>/dev/null || cat {} 2>/dev/null || ls -la {}"'
    set -gx FZF_ALT_C_OPTS '--preview "eza -la --icons --group-directories-first {} 2>/dev/null || ls -la {}"'
    set -gx FZF_CTRL_R_OPTS '--preview "echo {}" --preview-window=down:3:wrap'

    # eza
    alias ls 'eza --icons --group-directories-first'
    alias ll 'eza -l --icons --group-directories-first --git'
    alias la 'eza -la --icons --group-directories-first --git'
    alias lt 'eza --tree --icons --group-directories-first'
    alias l 'eza -l --icons --group-directories-first'

    # bat
    alias cat 'bat --paging=never'
    alias less 'bat'

    # fd / rg
    alias find 'fd'
    alias grep 'rg'
end

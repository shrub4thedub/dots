# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PLAN9=/usr/lib/plan9
export PATH=$PATH:$PLAN9/bin
export PATH="$HOME/.local/bin:$PATH"
export font="/mnt/font/GoMono/10a/font"
alias acme="acme -f /mnt/font/GoMono/10a/font"

# Send OSC 7 sequence to update terminal working directory
update_terminal_cwd() {
    printf '\033]7;%s\033\\' "${PWD}"
}

# Add to PROMPT_COMMAND
if [[ "$PROMPT_COMMAND" ]]; then
    PROMPT_COMMAND="${PROMPT_COMMAND};update_terminal_cwd"
else
    PROMPT_COMMAND="update_terminal_cwd"
fi

sp(){
    local text=$(xsel -o 2>/dev/null || xsel -ob 2>/dev/null)
    if [[ -n "$text" ]]; then
        plumb "$text"
    else
        echo "No text selected" >&2
        return 1
    fi
}


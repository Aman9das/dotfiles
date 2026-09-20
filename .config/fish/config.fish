if status is-interactive
    
    # Startup
    set -U fish_greeting

    # Initialize Starship
    starship init fish | source

    # Initialize Zoxide (correct flag order)
    zoxide init fish --cmd cd | source

end

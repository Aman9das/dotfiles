if status is-interactive
    # Initialize Starship
    starship init fish | source

    # Initialize Zoxide (correct flag order)
    zoxide init fish --cmd cd | source

end

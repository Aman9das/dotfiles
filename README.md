# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system:

```
sudo dnf install git stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
git clone https://github.com/Aman9das/dotfiles.git ~/dotfiles
cd dotfiles
```

then use GNU stow to create symlinks

```
stow --no-folding .
```

## Resources

[Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs)

## Notes

- To-do: Firefox sync
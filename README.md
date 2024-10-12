# My Dotesfiles

## Installation

- [Install - chezmoi](https://www.chezmoi.io/install/)
- `chezmoi init git@github.com:reecegg/dotfiles.git`

## Dotfiles

- TODO: update
- .bash_aliases: Commands aliases are listed in this file. This file is sourced by .bashrc
- .bash_logout: Executed by bash when login shell exits
- .bash_profile: Executed for login shells (at login)
- .bashrc: Executed for interactive non-login shells (running a terminal emulator)
- .config/nvim/init.vim: Neovim configuration
- .config/i3/config: I3wm configuration file (with i3-gaps specific settings)
- .gitconfig: Git configuration
- .gitignore: Global git ignore
- .inputrc: GNU Readline configuration file
- .tmux.conf: Tmux configuration file
- .xinitrc: Shell script run by xinit after starting xorg. Used to execute desktop environments or windows managers and other programs when starting x.
- .Xresources: Configuration for x client applications.

## Requirements Expectations Considerations Side-effects

- TODO: update
- .bash_aliases: None
- .bash_logout: None
- .bash_profile
- .bashrc
    - Exports `xst` as `TERMINAL`
    - Exports `firefox` as `BROWSER`
    - Replaces `vim` with `nvim` when the `nvim` command is accessible. Call `\vim` to run unshadowed vim.
    - Sources node version manager `init-nvm.sh` at `/usr/share/nvm/init-nvm.sh` if readable.
- .config/nvim/init.vim
    - Uses `curl` to download `plug`
    - Setup for 24-bit color support from the terminal. Colors will be wrong and/or broken without that support
    - Expects `$VIMCONFIG` to be set
- .config/i3/config
    - Some keybinds exec `dmenu` to launch programs
    - Some keybinds exec `i3-nagbar` to present logout prompts
    - Some keybinds exec `pactl` to manage volume with keyboard volume buttons
    - Some keybinds exec `xbacklight` to manage brightness
    - Some keybinds exec `playerctl` to manage audio players
    - Has i3-gaps specific settings and commands
- .gitconfig: None
- .gitignore: None
- .inputrc: None
- .tmux.conf: None
- .xinitrc: None
- .Xresources: Configuration for x client applications.

## Sources

- [Why use chezmoi? - chezmoi](https://www.chezmoi.io/why-use-chezmoi/)
  - [Comparison table - chezmoi](https://www.chezmoi.io/comparison-table/)

Old:
- [The best way to store your dotfiles: A bare Git repository - Atlassian Developer](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
- [StreakCobra Comment - Ask HN: What do you use to manage dotfiles? - Hacker News](https://news.ycombinator.com/item?id=11070797)

## Resources

- [Github does dotfiles - dotfiles.github.io](gitfiles.github.io)
- [Awesome dotfiles - webpro - Github.com](https://github.com/webpro/awesome-dotfiles)

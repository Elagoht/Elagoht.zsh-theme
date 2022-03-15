# Elagoht ZSH THEME

This is a oh-my-zsh theme made by Elagoht. So you need to install oh-my-zsh first!

Exaple prompt:

![Example Prompt](https://raw.githubusercontent.com/Elagoht/Elagoht.zsh-theme/main/screenshot.png)

There is also a safe version without icons. You can safely use it on TTY and Termux or something else.

Default version requires any of nerd font.

# Features:

* Non-root user's name shown cyan, root user's name shown red.
* Local machine's name shown green, ssh machine's name shown yellow.
* Only 2 subfolder shown in indicator.
* Virtual Environment indicator support.
* Git indicator support.
* Git Status Badges at right prompt.
* Command execution time on right prompt.

# Installation

Install oh-my-zsh on [https://ohmyz.sh](https://ohmyz.sh)

Move **elagoht.zsh-theme** to **~/.oh-my-zsh/themes**. Move **elagoht-safe.zsh-theme** for iconless version.

## Enable Virtualenv

Edit "plugins" line in ~/.zshrc file as:

```
plugins=(git virtualenv)
```

Both versions needs this edit.

Set ZSH_THEME variable to "elagoht" by writing:

```
ZSH_THEME="elagoht"
```

"elagoht-safe" for iconless version.

Then restart your terminal to see the changes. (You must use zsh, not bash or something else.)
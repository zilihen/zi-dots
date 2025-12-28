# Window Manager
- oxwm by tony (currently using and testing how it feels)

# Font
- Jetbrains Mono (Also the Nerd font for icons)

# Future TODO
- Download and Learn Quickshell (when I have time) to configure bar and other desktop widgets

# Setting up on a new machine

clone it as a git bare repo 
```bash
git clone --bare git@github.com:ItsZiling/.cfg.git .cfg
```

set up a temporary alias
```bash
alias cfg='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'
```

checkout
```bash
cfg checkout
```

Optional Local Configuration: Ignore untracked files
```bash
cfg config --local status.showUntrackedFiles no
```

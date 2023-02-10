#  Leukanos Dotfiles
This is a collection of dotfiles and scripts I use for customizing OS X to my liking and setting up the software development tools I use on a day-to-day basis.

# Setup

## MacOS
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install yadm git-crypt
yadm clone https://github.com/leukanos/dotfiles.git --bootstrap
```

## Linux
```bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y git yadm
yadm clone https://github.com/leukanos/dotfiles.git --bootstrap
```


## Additional settings
- iTerm configuration https://medium.freecodecamp.org/how-you-can-style-your-terminal-like-medium-freecodecamp-or-any-way-you-want-f499234d48bc

## Resources

I actively watch the following repositories and add the best changes to this repository:
- [GitHub ❤ ~/](http://dotfiles.github.com/)
- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
- [Cătălin’s dotfiles](https://github.com/alrra/dotfiles)
- [Paul's dotfiles](https://github.com/paulirish/dotfiles)
- [Jacob Gillespie’s dotfiles](https://github.com/jacobwg/dotfiles)
- [Nick Plekhanov's Dotfiles](https://github.com/nicksp/dotfiles)
- [Mellbourn's dotifles](https://github.com/Mellbourn/dotfiles)
- [alisnic dotfiles - vimrc](https://github.com/alisnic/.dotfiles/blob/cmp/.vimrc)

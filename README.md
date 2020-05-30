# Instructions
These dotfiles are managed using Dotbot.
If you found these, I wouldn't recommend cloning and installing, but feel to look
for something interesting (though there are plenty of other better examples out there).
One new thing I found recently is nano customizations (submodule included)!
I don't spend a lot of time in nano, but it's nice for it to look decent when I use
it for quick edit.

## Macbook Setup
For a generally helpful summary of a dev setup, see <https://sourabhbajaj.com/mac-setup/>
XCode is a set of developer tools from Apple that have to be installed.
To install them, go to the App Store and install XCode. This is a big package and
will take quite a while.
Once XCode is installed, run the following in your terminal:
```shell
sudo xcodebuild -license
xcode-select --install
```
The first line will prompt you to read the license and agree to it.
It will ask for your password.
The second line will prompt you to install the command line tools.
Follow the instructions and you’ll have Xcode and Xcode command line tools both
installed.

When setting up a Mac for the first time, run `macos.sh` to set common settings.

### Homebrew
Install `brew` with
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
Note that Command Line Tools for Xcode are required for Homebrew,
<https://docs.brew.sh/Installation>
Run `brew bundle` to generate a Brewfile.
Run `brew bundle intsall -v` to install the packages (`-v` for verbose output,
and it will look in the current directory for Brewfile).
After installing fzf with brew, enable shell extensions (better shell integration):
```shell
/usr/local/opt/fzf/install
```
which gives the key bindings (CTRL-T, CTRL-R, and ALT-C) (available for bash, zsh and fish).

### Default shell
I like the [fish](https://fishshell.com/).  After it is installed with `brew`,
make it the default shell
```shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s `which fish`
```

### Other programs/TODO
I haven't looked into installing these with Homebrew yet, so for now its the long way

- Docker: <https://docs.docker.com/docker-for-mac/install/>
- Dropbox
- Karibiner-Elements for keyboard remapping: <https://karabiner-elements.pqrs.org/>
- Python packages installed with pip, eg linters/formatters
- go path setup

## Linux Setup

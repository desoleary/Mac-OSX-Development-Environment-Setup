# Mac OSX Development Environment Setup

#### References

* [Beautify your terminal with Hyper](https://medium.com/better-programming/5-steps-to-a-beautiful-terminal-that-youll-love-using-9e94ecb4191b) 
* [Elegant Development with Zsh & Hyper](https://www.robertcooper.me/elegant-development-experience-with-zsh-and-hyper-terminal) 

#### Install Set Zsh as Default Shell 

```shell script
$ brew install zsh zsh-completions zsh-syntax-highlighting
$ chsh -s /bin/zsh
```

###### oh-my-zsh Installation

* [Website](https://ohmyz.sh/)
* [Github Repo/Wiki](https://github.com/robbyrussell/oh-my-zsh)

```shell script
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # installs oh-my-zsh

# zsh auto suggestions plugin
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
**Add the contents from files listed below:**

- `subl ~/.zshrc` and add the contents of [here](./.zshrc) file.
- `subl ~/.aliases` and add the contents of [this](./.aliases) file.
- `subl ~/.bash-custom-functions.sh` and add the contents of [this](./.bash-custom-functions.sh) file.
- `subl ~/.oh-my-zsh/custom/themes/zeta.zsh-theme` and add the contents of [this](./Zeta.zsh-theme) file.

#### Hyper Terminal App

- Download  [Hyper app](https://hyper.is/#installation)
- Configure `.hyper.js` as exemplified [here](./.hyper.js)

```shell script
npm install -g spaceship-prompt
cp $(dirname $(gem which colorls))/yaml/dark_colors.yaml ~/.config/colorls/dark_colors.yaml
```
Example [dark_colors.yaml](./dark_colors.yaml)

Recommended Hyper Plugins:
- `hyperborder`
- `hyper-night-owl` theme
- `hyper-font-ligatures`
- `hyper-search` Search text in your terminal.
- `hyper-pane` Add planes with ⌘+d (vertical panes) and ⌘+⇧+d (horizontal panes). 
- `hypercwd` open tabs in current active tab directory
- `hyper-tab-icons`
- `hyper-tabs-enhanced` Enhanced Tabs Plugin for Hyper. Matches any theme.

#### SSH Keys (GitLab & GitHub)

```shell script
$ ssh-keygen -t ed25519 -C "desoleary@gmail.com"
$ cat ~/.ssh/id_ed25519.pub # add output to GitLab SSH settings and to GitHub SSH settings

echo 'ssh-add -K' >> ~/.bash_profile # prevents you from needing to enter password every time access remote
```

#### Ruby Setup

```shell script
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
$ cd ~/.rbenv && src/configure && make -C src
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

$ ~/.rbenv/bin/rbenv init

# rbenv-build (Allows for simplified installation of ruby versions)
$ brew install ruby-build

# Install version of ruby required by the Rails app
$ rbenv install <ruby-version> e.g. rbenv install 2.4.6
$ rbenv global <ruby-version> e.g. rbenv global 2.4.6
$ gem update --system
```

#### Install a specific Ruby version

```shell script
$ rbenv install 2.6.5 # install specific ruby version
$ rbenv global 2.6.5 # set global version
$ rbenv versions # list versions

$ rbenv install <ruby-version> e.g. rbenv install 2.6.5
$ rbenv global <ruby-version> e.g. rbenv global 2.6.5 # set global version
$ rbenv versions
$ gem update --system
```

#### Updating Ruby

```shell script
brew upgrade rbenv ruby-build

IF ABOVE DOES NOT SHOW YOU THE VERSION YOU ARE LOOKING FOR, try:
$ rm -rf ~/.rbenv/plugins/ruby-build # removes old version
$ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build # installs the latest
```

#### PostgreSQL Installation

`$ brew install postgres`

###### Useful SQL Commands

```shell script
$ psql postgres
$ postgres=# \du

#### Create User (Should only be used for local development environment which contains no sensitive information.)
postgres=# CREATE USER app with encrypted password 'app';
postgres=# ALTER USER app WITH SUPERUSER CREATEROLE CREATEDB REPLICATION BYPASSRLS;
```

#### Install Elastic Search

```shell script
$ brew tap homebrew/cask-versions
$ brew install elasticsearch
$ brew services start elasticsearch
$ elasticsearch # runs the elastic search engine
```

#### Install Redis

```shell script
$ brew install redis
$ brew services start redis
```

#### Install Mongo

Download & Install Robo 3T from [here](https://robomongo.org/download)

#### Configure Git

`subl ~/.gitconfig` and add contents of [this](./.gitconfig) file.


#### Additional Applications

[Full list of Homebrew formulae available](https://formulae.brew.sh/cask/)

```shell script
brew cask install spectacle
brew cask install the-unarchiver 
brew cask install copyclip
brew cask install omnidisksweeper
brew cask install docker
brew cask install kitematic
brew cask install slack
brew cask install spotify
brew cask install moom
brew cask install karabiner
brew cask install evernote
brew install pandoc
```

#### Docker
Download & Install Docker Desktop from [here](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

#### Karabiner Configuration

* ⇧F8 Chrome Debugger (pause / resume script execute) ≈ F8 ⌘ /
* ⌥F1 Rubymine (Select In...)
* ⇧F6 Rubymine (Rename File...)

Go to https://github.com/desoleary/karabiner-dev-exts/blob/master/README.md


#### Mac OSX Preferences Changes (Fixes issue with Evernote)

Goto System Preferences `=>` Keyboard `=>` Text (tab) 
- Uncheck "Use smart quotes and dashes"
- Uncheck “Correct Spelling Automatically”
- Check Check Grammer With Spelling"

#### Other topics (more to come!)

###### Install POW

[Reference Documentation](http://pow.cx/manual.html)

`$ curl get.pow.cx | sh`

###### Softlink port to POW

```shell script
echo 3000 > ~/.pow/<app-root-dir> # Ensure to configure specific rubymine project to the correct port number
```

###### Softlink apps to POW
`ln -s ~/projects/<app-root-dir> ~/.pow/<app-root-dir>`

#### Troubleshooting

###### xcrun issue
    xcrun: error: invalid active developer path (/Library/Developer/CommandLineTools), missing xcrun at: /Library/Developer/CommandLineTools/usr/bin/xcrun

`$ xcode-select --install` # Should fix xcrun issue

##### PostgreSQL issue 

    could not connect to server: No such file or directory

Follow PostgreSQL fix steps outlined [here](https://gist.github.com/giannisp/ebaca117ac9e44231421f04e7796d5ca)

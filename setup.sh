# Change to home directory
cd ~

# Switch shell to zsh
chsh -s /bin/zsh

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Spaceship Prompt
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Make temporary directory
mkdir .temp
cd .temp
git clone https://github.com/powerline/fonts.git
fonts/install.sh
rm -rf fonts
cd ~

# Clone zsh extensions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# Replace zsh
sed -E -i '' 's/ZSH_THEME=".*"/ZSH_THEME="spaceship"/' ~/.zshrc
sed -E -i '' 's/plugins\(git\)/plugins(\n  git\n  z\n  zsh-autosuggestions\n  zsh-syntax-highlighting\n)/g' ~/.zshrc

# Add pasting speed up
echo "\n## Speed up for pasting\n# This speeds up pasting w/ autosuggest\n# https://github.com/zsh-users/zsh-autosuggestions/issues/238\npasteinit() {\n  OLD_SELF_INSERT=\${\${(s.:.)widgets[self-insert]}[2,3]}\n  zle -N self-insert url-quote-magic # I wonder if you'd need \`.url-quote-magic>\n}\n\npastefinish() {\n  zle -N self-insert \$OLD_SELF_INSERT\n}\nzstyle :bracketed-paste-magic paste-init pasteinit\nzstyle :bracketed-paste-magic paste-finish pastefinish" >> ~/.zshrc

# Add z styling
echo "\n# Setup z\nautoload -U compinit && compinit\nzstyle ':completion:*' menu select" >> ~/.zshrc

# Install iTerm profile
cd ~/Downloads
git clone https://github.com/Wildchild9/iTermHomebrewTheme.git
cd iTermHomebrewTheme
sed -E -i '' "s/\"Working Directory\" : \".*\"/\"Working Directory\" : \"$(echo "$(cd ~; pwd)" | sed 's/\//\\\\\\\//g')\"/" Homebrew.json
cd ~

# Install Homebrew dependencies
brew install git node python ack fzf fd z tree bat noti cloc wget wifi-password speedtest-cli htop gnupg autoconf python3 ffmpeg nano ruby

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

# Install imgcat
pip install imgcat

# Install rvm
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

# Install latest version of ruby
rvm install ruby --latest
rvm use ruby --latest

# Install and setup nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo '\n# Setup nvm\nexport NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm\n[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion'

# Install bundler and cocoapods
sudo gem install bundler
sudo gem install cocoapods

# Install yarn
npm install --global yarn

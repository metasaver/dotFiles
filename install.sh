export DEBIAN_FRONTEND=noninteractive
export INSTALL_ZSH=true
export USERNAME=`whoami`

## update and install required packages
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get -y install --no-install-recommends apt-utils dialog 2>&1

sudo apt-get install -y \
    curl \
    fontconfig \
    git \
    gnupg2 \
    jq \
    sudo \
    openssh-client \
    iproute2 \
    procps \
    wget \
    unzip \
    apt-transport-https \
    lsb-release 

# Install Jetbrains Mono font
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
sudo unzip JetBrainsMono-2.001.zip -d /usr/share/fonts
sudo fc-cache -f -v

# Install & Configure Zsh
if [ "$INSTALL_ZSH" = "true" ]
then
    sudo apt-get install -y \
    fonts-powerline \
    zsh

    # Clone dotfiles repository
    git clone https://github.com/metasaver/dotfiles.git /home/node/dotfiles

    # Copy .zshrc file
    cp -f /home/node/dotfiles/.zshrc ~/.zshrc
    
    # cp -f ~/dotfiles/.zshrc ~/.zshrc
    chsh -s /usr/bin/zsh $USERNAME
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    echo "source $PWD/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
fi

# Cleanup
sudo apt-get autoremove -y
sudo apt-get autoremove -y
sudo rm -rf /var/lib/apt/lists/*

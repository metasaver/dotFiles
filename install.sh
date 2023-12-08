export DEBIAN_FRONTEND=noninteractive
export INSTALL_ZSH=true
export USERNAME=`whoami`

## update and install required packages
echo "### update and install required packages ###"
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

# Check if JetBrains Mono font is already installed
if ! fc-list | grep -q "JetBrainsMono"; then
    echo "### JetBrains Mono font not found. Installing... ###"
    # Install JetBrains Mono font
    wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
    sudo unzip JetBrainsMono-2.001.zip -d /usr/share/fonts
    sudo fc-cache -f -v
else
    echo "### JetBrains Mono font is already installed. ###"
fi

# Install & Configure Zsh
if [ "$INSTALL_ZSH" = "true" ]
then
    # sudo apt-get install -y \
    # fonts-powerline \
    # zsh

    # Clone dotfiles repository
    # git clone https://github.com/metasaver/dotfiles.git /home/node/dotfiles

    # Copy .zshrc file
    # cp -f /home/node/dotfiles/.zshrc ~/.zshrc
    
    # cp -f ~/dotfiles/.zshrc ~/.zshrc
    # chsh -s /usr/bin/zsh $USERNAME
    # wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
    # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    # echo "source $PWD/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

    # Check if Zsh is installed
    if command -v zsh &> /dev/null; then
      echo "### Zsh is already installed. ###"
    else
      # Install Zsh
      echo "### Installing Zsh... ###"
      sudo apt-get update
      sudo apt-get install -y zsh

      # Set Zsh as the default shell
      chsh -s $(which zsh)

      # Install Oh My Zsh (optional)
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

      echo "### Installing Zsh plugins... ###"
      git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
      git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
      echo "source $PWD/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
    fi

    # Print Zsh version
    echo "Zsh version:"
    zsh --version

fi

# Cleanup
sudo apt-get autoremove -y
sudo apt-get autoremove -y
sudo rm -rf /var/lib/apt/lists/*

echo "### dotfile installation complete ###"

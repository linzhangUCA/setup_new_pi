# download packages info and upgrade packages
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update && sudo apt upgrade

# install packages
sudo apt install \
    curl \
    build-essential \
    git \
    vim-gtk3 \
    tmux \
    stow \
    python3-dev \
    python3-pip \

# install linting tools
pip install pip --upgrade
pip install pylint flake8 black
sudo apt install libxml2-utils
echo "export PATH=$PATH:$HOME/.local/bin:$PATH" >> $HOME/.bashrc

# stow dotfiles
stow vim
stow git
stow tmux

# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# TODO: install plugins automatically

# install GPIO libraries
sudo apt install rpi.gpio-common
pip install gpiozero RPi.GPIO
sudo adduser "${USER}" dialout  # optional

# give permissions to spi and gpio
sudo cp 90-gpio-spi.rules /etc/udev/rules.d/
sudo groupadd -f --system gpio
sudo usermod -aG gpio ubuntu
sudo groupadd -f --system spi
sudo usermod -aG spi ubuntu

# setup static ip
sudo cp 50-cloud-init.yaml /etc/netplan/
sudo vim /etc/netplan/50-cloud-init.yaml # edit configs according to your need
sudo netplan apply
## install nerd-fonts
#mkdir -p $HOME/.local/share/fonts/NerdFonts/
#cd $HOME/.local/share/fonts/NerdFonts/
#curl -fLo "Hack BoldItalic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
#curl -fLo "Hack BoldItalic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
#curl -fLo "Hack Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf
#curl -fLo "Hack Bold Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
#curl -fLo "Hack Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
#curl -fLo "Hack Italic Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
#curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
#curl -fLo "Hack Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf

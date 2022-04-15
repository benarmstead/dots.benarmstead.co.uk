# Post-install
# curl https://dots.benarmstead.co.uk/install/install.sh > install.sh
# chmod +x install.sh

username=$1
git_email=$2
git_name=$3
# Hard code username for convenience
#username=ben
#git_email="contact@benarmstead.co.uk"
#git_name="Ben Armstead"

# Go to tmp
cd /tmp/

# Install

## Install third party
### Ungoogled chromium
curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -
echo '
[home_ungoogled_chromium_Arch]
SigLevel = Required TrustAll
Server = https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/$arch' | sudo tee --append /etc/pacman.conf
sudo pacman -Sy

## Install official
curl https://dots.benarmstead.co.uk/install/packages.txt > packages.txt
sudo pacman -S - < packages.txt --noconfirm

### Pip
pip3 install virtualenv
pip3 install django

### Yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -i --noconfirm
cd ..

### AUR
yay -S lf-bin --noconfirm
yay -S vscodium-bin --noconfirm
yay -S lf-bin --noconfirm
#yay -S brave-bin --noconfirm

### Codium extensions
#codium --list-extensions
curl https://dots.benarmstead.co.uk/install/codium_extensions.txt > codium_extensions.txt
cat codium_extensions.txt | xargs -n 1 codium --install-extension


# Configurations
## Dots
wget -r https://dots.benarmstead.co.uk
mkdir -p ~/.config
chmod +x dots.benarmstead.co.uk/lf/*
mv dots.benarmstead.co.uk/* ~/.config/

## Git
git config --global credential.helper store
git config --global user.email "$git_email"
git config --global user.name "$git_name"
git config --global pull.rebase false

## Sudo
sudo echo "root ALL=(ALL:ALL) ALL
$username ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

## Bluetooth
modprobe btusb
sudo systemctl enable bluetooth

## Networking
sudo systemctl enable NetworkManager

## Rust
rustup install stable
rustup default stable

## Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c 'PlugInstall | PlugUpdate | :q! | :q!'
cd ~/.config/coc/extensions
npm install
cd /tmp

# Tor
sudo systemctl enable tor

## ZSH
#yay -S --noconfirm zsh-theme-powerlevel10k-git
#echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
#sudo chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/kyoz/purify/master/zsh/purify.zsh-theme --output ~/.oh-my-zsh/themes/purify.zsh-theme
cp ~/.config/zshrc ~/.zshrc

## Sway
echo 'if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi' >> ~/.zprofile

## Power management
sudo powertop --calibrate
sudo powertop --auto-tune

#sudo reboot

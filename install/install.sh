# Post-install
# curl https://dots.benarmstead.co.uk/install/install.sh > install.sh
# chmod +x install.sh

username=$1
git_email=$2
git_name=$3
# Hard code username for convenience
#username=ben
#git_email="ben@benarmstead.co.uk"
#git_name="Ben Armstead"

# Go to tmp
cd /tmp/

# Install
### Yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -i --noconfirm
cd ..

## Install packages
curl https://dots.benarmstead.co.uk/install/packages.txt > packages.txt
yay -S - < packages.txt --noconfirm

### Codium extensions
#code --list-extensions
curl https://dots.benarmstead.co.uk/install/code.txt > code.txt
cat code.txt | xargs -n 1 code --install-extension


# Configurations
## Dots
wget -r https://dots.benarmstead.co.uk
mkdir -p ~/.config
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
# rustup install stable
# rustup default stable

## Neovim
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync

## ZSH
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

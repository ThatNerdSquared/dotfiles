# nvim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update

# eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

: '
run gnome-tweaks to swap escape/caps



to make bluetooth work:

sudo nvim /etc/bluetooth/main.conf
ControllerMode = "bredr"
sudo /etc/init.d/bluetooth restart
'

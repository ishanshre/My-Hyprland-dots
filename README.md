# Hyprland-dots
Hyprland configuration after Vanilla Arch Linux Installation

## You can go to ```github.com/ishanshre/archlinux-setup``` for fresh arch linux installation

# After Fresh Arch Linux Installations:
1. Update the system
2. Install Git
   ```$ sudo pacman -S git```
3. Clone this repo
   ```
   $ git clone https://github.com/ishanshre/Hyprland-dots.git
   $ cd Hyprland-dots
   ```

4. Install Paru package (Chaotic Repo must be enabled)
   ```$ sudo pacman -S paru-bin ```
5. Run the hyprland script
   ```
   $ chmod +x hyprland.sh
   $ ./hyprland.sh
   ```

6. Copy .config folder from clone repo to your home directory
   ```$ cp -rf ~/Hyprland-dots/.config ~/```
7. To change default shell to fish shell
   ```$ chsh -s /usr/bin/zsh $USER```
8.  Reboot the System
   

# My Setup Info
    OS: Arch Linux
    Kernel: linux-lts
    Shell: Zsh (https://www.zsh.org/)
    ZSH Shell Theme: Configured using zinit plugin manager
    Desktop Environment: Hyprland (https://hyprland.org/)
    Status Pannel: Waybar (https://github.com/Alexays/Waybar)
    Application Menu: Rofi Menu (Catppuccin-mocha theme) (https://github.com/davatorium/rofi)
    Power Menu: Rofi Power Menu (https://github.com/jluttine/rofi-power-menu)
    Theme: Sweet
    Icons: Sweet-Red
    Terminal: Alacritty (https://github.com/alacritty/alacritty)
    Font: Comic Sans MS
    File Manager: Thunar, Yazi
    Image Viewer: Viewnior
    Office: Libre Office
    Code Editor: Neovim and Vscode

## Hyprland Config taken from @JaKooLit (https://github.com/JaKooLit/Hyprland-Dots/tree/main/config/hypr)

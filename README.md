# WonderPlayer Termux Interface Setup

Termux ke Terminal interface ko customize karne ke liye ek simple bash script.

## Features
- **5 High-Visibility Colors:** Red, Green, Yellow, Cyan, Magenta.
- **Custom Header Name & Font Styles.**
- **Safe Setup:** Aapke existing `.bashrc` shortcuts aur custom scripts ko safe rakhta hai aur code ko niche attach karta hai.

## Installation Commands

Termux me niche diye gaye commands ko ek ek karke run karein:

```bash
pkg update && pkg upgrade -y
pkg install git bash -y
git clone [https://github.com/YOUR_USERNAME/woderplayer.git](https://github.com/YOUR_USERNAME/woderplayer.git)
cd woderplayer
chmod +x setup.sh
./setup.sh
 

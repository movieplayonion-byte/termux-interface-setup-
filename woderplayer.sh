#!/usr/bin/env bash

# Color Definitions (Bright colors for black background)
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
RESET='\033[0m'

clear
echo -e "${CYAN}===========================================${RESET}"
echo -e "${YELLOW}       WONDERPLAYER TERMUX SETUP${RESET}"
echo -e "${CYAN}===========================================${RESET}"
echo ""

# Termux packages install
echo -e "${GREEN}[*] Updating & installing required packages...${RESET}"
pkg update -y && pkg upgrade -y
pkg install figlet toilet mpv ncurses-utils -y

# Configuration inputs
echo ""
echo -e "${CYAN}--- Header Customization ---${RESET}"
read -p "$(echo -e ${YELLOW}"[1] Header Text (Default: WONDERPLAYER): "${RESET})" HEADER_NAME
HEADER_NAME=${HEADER_NAME:-WONDERPLAYER}

echo ""
echo -e "${CYAN}Choose Color for Header:${RESET}"
echo -e " 1) Red\n 2) Green\n 3) Yellow\n 4) Cyan\n 5) Magenta"
read -p "$(echo -e ${YELLOW}"[2] Select Color (1-5, Default: 4): "${RESET})" COLOR_CHOICE

case $COLOR_CHOICE in
  1) HEADER_COLOR="RED" ;;
  2) HEADER_COLOR="GREEN" ;;
  3) HEADER_COLOR="YELLOW" ;;
  5) HEADER_COLOR="MAGENTA" ;;
  *) HEADER_COLOR="CYAN" ;;
esac

echo ""
echo -e "${CYAN}Choose Font/Style for Header:${RESET}"
echo -e " 1) Standard (Large)\n 2) Slant (Slanted)\n 3) 3D (Block Text)"
read -p "$(echo -e ${YELLOW}"[3] Select Font (1-3, Default: 1): "${RESET})" FONT_CHOICE

case $FONT_CHOICE in
  2) FONT_TYPE="slant" ;;
  3) FONT_TYPE="block" ;;
  *) FONT_TYPE="standard" ;;
esac

echo ""
echo -e "${CYAN}Choose Command Prompt Color:${RESET}"
echo -e " 1) Red\n 2) Green\n 3) Yellow\n 4) Cyan\n 5) Magenta"
read -p "$(echo -e ${YELLOW}"[6] Select Color (1-5, Default: 2): "${RESET})" CMD_COLOR_CHOICE

case $CMD_COLOR_CHOICE in
  1) CMD_COLOR="1;31m" ;;
  3) CMD_COLOR="1;33m" ;;
  4) CMD_COLOR="1;36m" ;;
  5) CMD_COLOR="1;35m" ;;
  *) CMD_COLOR="1;32m" ;;
esac

# Append to ~/.bashrc safely without overwriting existing shortcuts
BASHRC="$HOME/.bashrc"

echo "" >> "$BASHRC"
echo "# --- WONDERPLAYER INTERFACE SETUP START ---" >> "$BASHRC"
echo "clear" >> "$BASHRC"
echo "echo -e \"\${$HEADER_COLOR}\"" >> "$BASHRC"
echo "figlet -f $FONT_TYPE \"$HEADER_NAME\"" >> "$BASHRC"
echo "echo -e \"\033[0m\"" >> "$BASHRC"
echo "export PS1=\"\033[$CMD_COLOR[$HEADER_NAME@termux \W]\$ \033[0m\"" >> "$BASHRC"
echo "# --- WONDERPLAYER INTERFACE SETUP END ---" >> "$BASHRC"

echo ""
echo -e "${GREEN}[✔] Setup successfully attached to ~/.bashrc!${RESET}"
echo -e "${YELLOW}[i] Termux restart karein ya 'source ~/.bashrc' run karein.${RESET}"

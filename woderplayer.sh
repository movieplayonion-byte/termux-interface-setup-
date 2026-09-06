#!/usr/bin/env bash

# Clear screen
clear

# Header Text Input
read -p "1. Enter Header Text (Default: WONDERPLAYER): " HEADER_NAME
HEADER_NAME=${HEADER_NAME:-WONDERPLAYER}

# Color Selection
echo ""
echo "Select Header Color:"
echo " 1) Red"
echo " 2) Green"
echo " 3) Yellow"
echo " 4) Cyan"
echo " 5) Magenta"
read -p "Select Color (1-5, Default: 4): " COLOR_CHOICE

case $COLOR_CHOICE in
  1) H_COLOR_CODE="\033[1;31m" ;; # Bright Red
  2) H_COLOR_CODE="\033[1;32m" ;; # Bright Green
  3) H_COLOR_CODE="\033[1;33m" ;; # Bright Yellow
  5) H_COLOR_CODE="\033[1;35m" ;; # Bright Magenta
  *) H_COLOR_CODE="\033[1;36m" ;; # Bright Cyan
esac

# Size / Font Selection
echo ""
echo "Select Header Size / Style:"
echo " 1) Big / Large Font"
echo " 2) Standard / Medium Font"
echo " 3) Small / Compact Font (Fits all mobile screens)"
read -p "Select Size (1-3, Default: 3): " SIZE_CHOICE

case $SIZE_CHOICE in
  1) FONT_TYPE="big" ;;
  2) FONT_TYPE="standard" ;;
  *) FONT_TYPE="small" ;;
esac

# Command Prompt Color
echo ""
echo "Select Command Prompt Color:"
echo " 1) Red"
echo " 2) Green"
echo " 3) Yellow"
echo " 4) Cyan"
echo " 5) Magenta"
read -p "Select Prompt Color (1-5, Default: 2): " CMD_CHOICE

case $CMD_CHOICE in
  1) CMD_COLOR_CODE="\033[1;31m" ;;
  3) CMD_COLOR_CODE="\033[1;33m" ;;
  4) CMD_COLOR_CODE="\033[1;36m" ;;
  5) CMD_COLOR_CODE="\033[1;35m" ;;
  *) CMD_COLOR_CODE="\033[1;32m" ;;
esac

# Packages Installation
pkg update -y && pkg install figlet -y

BASHRC="$HOME/.bashrc"

# Appending to ~/.bashrc without modifying existing shortcuts
cat << EOF >> "$BASHRC"

# --- WONDERPLAYER INTERFACE SETUP START ---
clear
echo -e "${H_COLOR_CODE}"
figlet -f $FONT_TYPE "$HEADER_NAME"
echo -e "\033[0m"
export PS1="${CMD_COLOR_CODE}[$HEADER_NAME@termux \W]\$ \033[0m"
# --- WONDERPLAYER INTERFACE SETUP END ---
EOF

echo ""
echo -e "\033[1;32m[✔] Setup Successfully Completed!\033[0m"
echo "Termux restart karein ya 'source ~/.bashrc' run karein."
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

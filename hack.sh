#!/bin/bash

# Function to display colored text
print_color() {
  color_code=$1
  text=$2
  echo -e "\033[${color_code}m${text}\033[0m"
}

# Function to display the banner
display_banner() {
  clear
  print_color 36 " _   _ __  __ _    _    _    _  ____ _  __"
  print_color 36 "| \\ | |  \\/  | |  | |  | |  | |/ ___| |/ /"
  print_color 36 "|  \\| | |\\/| | |  | |  | |  | | |  _| ' / "
  print_color 36 "| |\\  | |  | | |__| |__| |__| | |_| | . \\ "
  print_color 36 "|_| \\_|_|  |_|\\____/\\___/\\____|\\____|_|\\_\\"
  print_color 33 "By UZAIRxDEV GitHub: UZAIRxDEV223 contribution with ChatGPT"
  sleep 1
}

# Function to show high-quality loading animation
show_loading() {
  for i in {1..30}; do
    echo -ne "$(print_color 32 'Loading>')"
    sleep 0.1
  done
  echo -e "\n"
}

# Function to install necessary tools
install_tools() {
  print_color 32 "[+] Installing Neofetch"
  apt install neofetch -y
  neofetch
  sleep 1

  print_color 34 "[+] Installing Tor"
  apt install tor -y
  sleep 1

  print_color 33 "[+] Installing Whois"
  apt install whois -y
  whois www.nadra.gov.pk
  sleep 1

  show_loading
}

# Function to get user input
get_user_input() {
  while true; do
    read -p "$(print_color 32 'num-hack>>> ')$(print_color 33 'Please enter a 10-digit number: ')" number
    if [[ ${#number} -eq 10 && $number =~ ^[0-9]+$ ]]; then
      break
    else
      print_color 31 "Invalid input. Please enter exactly 10 digits."
    fi
  done
}

# Function to determine the carrier based on the prefix
get_carrier() {
  number=$number
  prefix=${number:0:3}
  case $prefix in
    "300" | "301" | "302" | "303" | "304" | "305" | "306" | "307" | "308" | "309") carrier="Jazz" ;;
    "310" | "311" | "312" | "313" | "314" | "315" | "316" | "317" | "318" | "319") carrier="Zong" ;;
    "320" | "321" | "322" | "323" | "324" | "325" | "326" | "327" | "328" | "329") carrier="Warid" ;;
    "330" | "331" | "332" | "333" | "334" | "335" | "336" | "337" | "338" | "339") carrier="Ufone" ;;
    "340" | "341" | "342" | "343" | "344" | "345" | "346" | "347" | "348" | "349") carrier="Telenor" ;;
    *) carrier="Unknown" ;;
  esac
  echo $carrier
}

# Function to show high-quality information gathering animation
show_info_gathering() {
  steps=("Connecting to server"
         "Initializing hack"
         "Accessing mobile network"
         "Bypassing security protocols"
         "Extracting data"
         "Locating user"
         "Tracking IP address"
         "Decrypting information"
         "Establishing secure connection"
         "Analyzing data packets"
         "Compiling user profile"
         "Generating report")

  for step in "${steps[@]}"; do
    echo -ne "$(print_color 32 "$step.")"
    for i in {1..10}; do
      echo -ne "."
      sleep 0.1
    done
    echo
  done
}

# Function to check internet speed
check_internet_speed() {
  echo -e "$(print_color 32 'Checking internet speed...')"
  speedtest=$(curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -)
  echo -e "$speedtest"
  sleep 1
}

# Function to show the fake hacking sequence
show_hacking_sequence() {
  random_names=("Ahmed Ali" "Ayesha Khan" "Faisal Mahmood" "Sara Ali" "Omar Zafar")
  random_locations=("Karachi, Sindh" "Lahore, Punjab" "Islamabad, ICT" "Peshawar, KPK" "Quetta, Balochistan")
  random_ips=("192.168.1.1" "172.16.254.1" "10.0.0.1" "203.0.113.1" "198.51.100.1")

  show_info_gathering

  sleep 1
  print_color 34 "\nData Extracted:"
  print_color 34 "Name: ${random_names[$RANDOM % ${#random_names[@]}]}"
  print_color 34 "Location: ${random_locations[$RANDOM % ${#random_locations[@]}]}"
  print_color 34 "IP Address: ${random_ips[$RANDOM % ${#random_ips[@]}]}"
  print_color 34 "Carrier: $(get_carrier ${1:2})"
  print_color 34 "Phone Number: $1"
  print_color 31 "\nHacking Complete! All data has been extracted successfully.\n"
}

# Main prank function
prank() {
  display_banner
  install_tools
  check_internet_speed
  while true; do
    get_user_input
    full_number="+92 ${number}"
    echo -e "$(print_color 32 'num-hack>>>') Your number: $full_number"
    read -p "$(print_color 32 'num-hack>>> ')$(print_color 33 'Is this correct? (y/n): ')" confirmation
    confirmation=$(echo $confirmation | tr '[:upper:]' '[:lower:]')
    if [[ $confirmation == 'y' ]]; then
      print_color 32 "Processing...\n"
      show_hacking_sequence "$full_number"
      break
    elif [[ $confirmation == 'n' ]]; then
      print_color 31 "Please enter the number again."
    else
      print_color 31 "Invalid response. Please enter 'y' for yes or 'n' for no."
    fi
  done
}

# Run the prank
PS1='\[\033[0;32m\]num-hack>>>\[\033[0m\] '
prank

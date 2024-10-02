#!/bin/bash

# Tool name
tool_name="Brute Force Password Cracker"
author_name="Saki"
banner="WELCOME TO SAKI'S TOOL"

# Clear the terminal
clear

# Print the banner with colors
echo -e "\033[1;35m############################################\033[0m"
echo -e "\033[1;32m#                                          #\033[0m"
echo -e "\033[1;32m#           $banner           #\033[0m"
echo -e "\033[1;32m#                                          #\033[0m"
echo -e "\033[1;35m############################################\033[0m"
echo -e "\033[1;34m# Tool by: $author_name                      #\033[0m"
echo -e "\033[1;35m############################################\033[0m"
echo ""

# User input for username
echo -e "\033[1;33mPlease enter the target username:\033[0m"
read "username"

# User input for password list
echo -e "\033[1;33mPlease enter the path to the password list file:\033[0m"
read password_list

# Check if password list exists
if [[ ! -f "$password_list" ]]; then
    echo -e "\033[1;31m[-] Password list file not found!\033[0m"
    exit 1
fi

echo -e "\033[1;32m[+] Starting brute force attack...\033[0m"

# Attempt to crack the password
found=false

while IFS= read -r password; do
    echo -e "\033[1;34mTrying password: $password\033[0m"
    
    # Simulating password check
    if [[ "$password" == "secret123" ]]; then
        echo -e "\033[1;32m[+] Password found for user '$username': $password\033[0m"
        found=true
        break
    fi
done < "$password_list"

if [ "$found" = false ]; then
    echo -e "\033[1;31m[-] No correct password found!\033[0m"
fi

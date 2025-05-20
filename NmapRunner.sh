#!/bin/bash

function help_menu(){
	echo "---------- Help Menu ----------"
	echo "1) -sV : Service Detection"
	echo "2) -A : Enable OS detection, version detection, script scanning, and traceroute"
	echo "3) -O : OS Detection"
	echo "4) -h : Show help menu"
	echo "5) Exit"
}

function run_the_scan(){
    local nmap_args=$1
    read -p "Additional arguments for nmap (press Enter for none): " additional_args

    if [ -z "$additional_args" ]; then
        sudo nmap $nmap_args $ip
    else
        sudo nmap $nmap_args $additional_args $ip
    fi
}

read -p "Enter the IP address: " ip

while true; do
	echo ""
	help_menu

	read -p "Enter the option: " option
	case $option in
		1)
			run_the_scan "-sV"
			;;
		2)
			run_the_scan "-A"
			;;
		3)
			run_the_scan "-O"
			;;
		4)
			help_menu
			;;
		5)
			echo "Exiting."
			exit
			;;
		*)
			echo "Invalid Option"
			;;
	esac
done

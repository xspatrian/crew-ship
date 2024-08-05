## Author --> Suyog patil
# suppose you have a file list called namp.txt with the list of subdomains and you want to use a namp and save the result with structured matter then go for this command

#!/bin/bash

# Check if nmap.txt exists
if [[ ! -f nmap.txt ]]; then
    echo "Error: nmap.txt not found!"
    exit 1
fi

# Clear previous results
echo "Starting new scan..." > initial.nmap

# Read each subdomain from nmap.txt and perform a scan
while read -r subdomain; do
    echo "Scanning $subdomain at $(date)..." >> initial.nmap
    nmap -A "$subdomain" >> initial.nmap
    echo "Finished scanning $subdomain at $(date)" >> initial.nmap
    # Add two blank lines between results
    echo -e "\n\n" >> initial.nmap
done < nmap.txt

echo "Scanning complete. Results saved in initial.nmap."


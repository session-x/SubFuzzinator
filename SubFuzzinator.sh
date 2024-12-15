#!/bin/bash

# Input domain
read -p "Enter the domain to scan (e.g., google.com): " DOMAIN

# Fuzzing wordlist path
FUZZ_LIST="/home/lmfo/Desktop/subdomainfuzzin.txt"

# Output files
SUBDOMAINS_FILE="subdomains.txt"
FUZZED_SUBDOMAINS_FILE="fuzzed_subdomains.txt"
LIVE_SUBDOMAINS_FILE="live_subdomains.txt"

# Check if fuzz list file exists
if [ ! -f "$FUZZ_LIST" ]; then
    echo "Fuzz wordlist file not found at $FUZZ_LIST"
    exit 1
fi

# Run subfinder for initial subdomain enumeration
echo "Running subfinder on $DOMAIN..."
subfinder -d $DOMAIN -o $SUBDOMAINS_FILE

# Check if subfinder found any subdomains
if [ ! -s "$SUBDOMAINS_FILE" ]; then
    echo "No subdomains found by subfinder. Exiting..."
    exit 1
fi

# Function to recursively fuzz and check live domains
fuzz_and_check_live_domains() {
    local current_domain=$1
    local level=$2
    echo "Fuzzing subdomains for: $current_domain (Level: $level)"
    
    # Generate fuzzed subdomains
    for fuzz in $(cat $FUZZ_LIST); do
        new_subdomain="$fuzz.$current_domain"
        echo "Fuzzing: $new_subdomain"
        echo "$new_subdomain" >> $FUZZED_SUBDOMAINS_FILE
    done

    # Recursively fuzz further for newly discovered subdomains (limit the depth here if needed)
    if [ $level -lt 3 ]; then
        echo "Recursively fuzzing newly found subdomains..."
        while IFS= read -r subdomain; do
            fuzz_and_check_live_domains "$subdomain" $((level + 1))
        done < <(cat $FUZZED_SUBDOMAINS_FILE | sort -u)
    fi
}

# Run fuzzing and live domain checking starting from initial subdomains
echo "Starting fuzzing process..."
fuzz_and_check_live_domains $DOMAIN 1

# Remove duplicates and run httpx to find live domains
echo "Running httpx to find live subdomains..."
cat $FUZZED_SUBDOMAINS_FILE | sort -u | httpx -silent -o $LIVE_SUBDOMAINS_FILE

# Check if live subdomains were found
if [ ! -s "$LIVE_SUBDOMAINS_FILE" ]; then
    echo "No live subdomains found. Exiting..."
    exit 1
fi

# Show live subdomains
echo "Found live subdomains:"
cat $LIVE_SUBDOMAINS_FILE

# Optionally, clean up intermediate files (uncomment to delete)
# rm $SUBDOMAINS_FILE $FUZZED_SUBDOMAINS_FILE

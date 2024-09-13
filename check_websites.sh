#!/bin/bash

# Array of URLs
websites=("https://vartsab.com/" "https://www.linkedin.com/in/vartsab/" "https://github.com/vartsab")

# logs
log_file="website_status.log"

# clear the logs before runninf the script
> "$log_file"

# Loop to ping the sites
for website in "${websites[@]}"
do
        # Note the current time
        timestamp=$(date +"%Y-%m-%d %H:%M%S")

        # use curl with -L key to check the sites status with redirection
        status_code=$(curl -o /dev/null -s -w "%{http_code}\n" -L "$website")

        # if status code is 200, the site is up
        if [ "$status_code" -eq 200 ]; then
                echo "[$timestamp] $website is UP" | tee -a "$log_file"
        else
                echo "[$timestamp] $website is DOWN" | tee -a "$log_file"
        fi
done

# Returning results
echo "Results of the check were added to $log_file"
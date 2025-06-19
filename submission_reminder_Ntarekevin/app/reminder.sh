
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Way to the submissions file
submissions_file="./assets/submissions.txt"

# Populate remaining time and run the reminder function
echo "REPORT: $REPORT"
echo "Time given submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file


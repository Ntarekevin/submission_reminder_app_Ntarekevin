#!/bin/bash
#Give the github username

read -p 'Give username: ' username

#Creating the submission_reminder directory

Kevin=submission_reminder_$username

mkdir -p $Kevin

#Creating the subdirectories

mkdir -p $Kevin/app
mkdir -p $Kevin/modules
mkdir -p $Kevin/assets
mkdir -p $Kevin/config

#Creating the reminder.sh script in the app directory

cat << 'EOF' > $Kevin/app/reminder.sh

#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Way to the submissions file
submissions_file="./assets/submissions.txt"

# Populate remaining time and run the reminder function
echo "REPORT: $REPORT"
echo "Time given submit: $TIME_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file

EOF
cat << 'EOF' > $Kevin/modules/functions.sh
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function validate_submissions {
    local file=$1
    echo "Analyzing student submission data from $file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do

        name=$(echo "$name" | xargs)
        tasks=$(echo "$tasks" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$status" == "not submitted" ]]; then
            echo "Alert: $name has not submitted the $task!"
        elif [[ $status" == ""submitted" ]]; then
            echo "Reminder: $name has submitted the $task!"
        fi
    done < <(tail -n +2 "$file") # Skip the header
}

EOF
cat << 'EOF' > $Kevin/assets/submissions.txt
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
chris, Git, submitted
lionel, Ict, not submitted
EOF
# Creating config.env file in the config directory
cat << 'EOF' > $Kevin/config/config.env

# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF
# Creating the startup.sh script
cat << 'EOF' > Kevin/startup.sh
#!/bin/bash
# startup.sh - Starts the submission reminder application when executed

echo "Student report reminder application..."
./$Kevin/app/reminder.sh
EOF

#This will making all the files executable

chmod +x $Kevin/startup.sh
chmod +x $Kevin/app/reminder.sh
chmod +x $Kevin/modules/functions.sh

#The exact feedback
echo  "Reports created and files are set up in $Kevin."

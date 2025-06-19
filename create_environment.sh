#!/bin/bash
# Prompt the user to enter their name
read -p "Enter your Name: " user_name

# Create the main project directory using the provided name
mkdir -p submission_reminder_$user_name

# Create the necessary subdirectories
mkdir submission_reminder_$user_name/app \
      submission_reminder_$user_name/modules \
      submission_reminder_$user_name/assets \
      submission_reminder_$user_name/config

# Create required files inside their respective directories
touch submission_reminder_$user_name/app/reminder.sh \
      submission_reminder_$user_name/modules/functions.sh \
      submission_reminder_$user_name/assets/submissions.txt \
      submission_reminder_$user_name/config/config.env \
      submission_reminder_$user_name/startup.sh

# Populate config.env with environment variables
cat << 'EOF' > submission_reminder_$user_name/config/config.env
# Configuration File
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Populate reminder.sh with logic to source configs and call helper functions
cat << 'EOF' > submission_reminder_$user_name/app/reminder.sh
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Display assignment info and check submissions
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOF

# Add the helper function to functions.sh
cat << 'EOF' > submission_reminder_$user_name/modules/functions.sh
#!/bin/bash

# Function to identify students who haven’t submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Read file line-by-line, skipping the header
    while IFS=, read -r student assignment status; do
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file")
}
EOF

# Add sample student records to submissions.txt
cat << 'EOF' > submission_reminder_$user_name/assets/submissions.txt
student, assignment, submission status
Aaliyah, Shell Navigation, not submitted
Thiery, Git, submitted
Ntare, Shell Navigation, not submitted
Rajveer, Shell Basics, submitted
Gilbert, Shell Navigation, not submitted
Ange, Git, submitted
Laura, Shell Navigation, not submitted
Kevin, Shell Basics, submitted
Jonathan, Shell Navigation, not submitted
Cyuma, Git, submitted
Julien, Shell Navigation, not submitted
Julia, Shell Basics, submitted
EOF

# Create startup script that runs the app
cat << 'EOF' > submission_reminder_$user_name/startup.sh
#!/bin/bash
# Execute the main reminder script
./app/reminder.sh
EOF

# Set execute permissions on all scripts
chmod +x submission_reminder_$user_name/app/reminder.sh \
         submission_reminder_$user_name/modules/functions.sh \
         submission_reminder_$user_name/config/config.env \
         submission_reminder_$user_name/startup.sh

# Confirm success
echo "✅ Environment setup complete! Your submission reminder app is ready."

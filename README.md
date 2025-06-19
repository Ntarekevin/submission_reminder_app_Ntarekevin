Submission Reminder App
Overview
The Submission Reminder App is a Bash-based tool designed to help students stay on top of their assignment deadlines. It creates a structured environment with scripts and configuration files to manage automated reminders for pending submissions.

Installation & Setup
Steps
- Clone the repository:
git clone https://github.com/Ntarekevin/submission_reminder_app_Ntarekevin.git
- Navigate to the cloned directory:
cd submission_reminder_app_Jonathan2055
- Run the setup script:
bash create_environment.sh
# or
./create_environment.sh
- You'll be prompted to enter your name. This will generate a personalized environment:
submission_reminder_<your_name>
- Navigate into the created environment:
cd submission_reminder_<your_name>

Usage
Running the Reminder
To start the application and check submission statuses, run:
bash startup.sh
# or
./startup.sh

This will display:
- The assignment title
- Days remaining to submit
- A list of students who haven’t yet submitted

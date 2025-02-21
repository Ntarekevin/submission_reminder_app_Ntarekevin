How to Run the Application
After running the setup script, navigate to the application directory:

bash
Copy
cd submission_reminder_<your_username>
Make sure all scripts are executable:

bash
Copy
chmod +x app/reminder.sh
chmod +x modules/functions.sh
chmod +x startup.sh
To start the application and send reminders, run the startup.sh script:

bash
Copy
./startup.sh
This will:

Load the configuration and helper functions.
Check the submissions.txt file for students who haven't submitted their assignments.
Print reminders in the terminal for the students who haven't submitted.


# vscode-extension-setup
This code was originally designed to enable University of St Andrews to have their vscode extensions instantly installed when logging in the lab machines.

## Setup
Either clone the repo or download the setup.sh file.

### Running on Launch
1. Task Scheduler (Windows)
- Open Task Scheduler.
- Create a new task and configure it to run your script at logon:
  - General tab: Provide a name and description for the task.
  - Triggers tab: Add a new trigger for "At log on".
  - Actions tab: Add a new action to start a program and provide the path to your script.
  - Save the task.

2. .bash_profile (Linux, macOS)
- Edit your .bash_profile file in your home directory:
```nano ~/.bash_profile```
- Add the following line to execute your script at login:
```/path/to/your/setup.sh```
- Save the file and exit the editor

3. .bashrc (Linux)
- Edit your .bashrc file in your home directory (if .bash_profile doesn't exist)
```nano ~/.bashrc```
- Add the following line to execute your script at login:
```/path/to/your/setup.sh```
- Save the file and exit the editor

#### Notes
- Ensure your script is executable using `chmod +x /path/to/your/script.sh`.
- Replace `/path/to/your/setup.sh` with the actual path to your script file.

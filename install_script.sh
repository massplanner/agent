#!/bin/bash

# Define variables
PROJECT_NAME="massplanner"
VENV_NAME="venv"
DOWNLOAD_URL="https://github.com/massplanner/agent.zip"  # Replace with your project's download URL

# Create a directory for the project
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Download the project's source code or distribution
curl -L -o $PROJECT_NAME.zip $DOWNLOAD_URL

# Unzip the downloaded file (if it's a zip file)
unzip -q $PROJECT_NAME.zip

# Create a virtual environment
python3 -m venv $VENV_NAME

# Activate the virtual environment
source $VENV_NAME/bin/activate

# Install project dependencies (if any)
pip install -r requirements.txt  # If you have a requirements.txt file

# Provide instructions for running the program
echo "Installation complete. You can now run your program using 'python main.py'."

# Deactivate the virtual environment when done
deactivate

#!/bin/bash

# Define variables
PROJECT_NAME="massplanner_local"
DOWNLOAD_URL="http://github.com/massplanner/agent/zipball/master/"  # Replace with your project's download URL

# Create a directory for the project
mkdir -p $PROJECT_NAME
cd $PROJECT_NAME

# Download the project's source code or distribution
curl -L -o $PROJECT_NAME.zip $DOWNLOAD_URL

# Unzip the downloaded file (if it's a zip file)
unzip -q $PROJECT_NAME.zip

# Install pipenv for Python 3.9
python3.9 -m pip install pipenv

# Create a virtual environment for Python 3.9 and install project dependencies
python3.9 -m pipenv --python 3.9 install

# Activate the virtual environment
python3.9 -m pipenv shell

# Provide instructions for running the program
echo "Installation complete. You can now run your program using 'python main.py'."

# Exit the virtual environment when done
exit

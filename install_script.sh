#!/bin/bash

# Define variables
PROJECT_NAME="massplanner-agent"
DOWNLOAD_URL="http://github.com/massplanner/agent/zipball/master/"  # Replace with your project's download URL

# Create a temporary directory for the project
TEMP_DIR=$(mktemp -d)

# Download the project's source code or distribution
curl -L -o $PROJECT_NAME.zip $DOWNLOAD_URL

# Unzip the downloaded file to the temporary directory and rename to the project name
unzip $PROJECT_NAME.zip -d $TEMP_DIR

# Remove the downloaded file
rm $PROJECT_NAME.zip

# Find the directory containing your Python program
PROGRAM_DIR=$(find $TEMP_DIR -type d -name "massplanner-agent*" | head -n 1)

if [ -z "$PROGRAM_DIR" ]; then
  echo "Error: Could not locate the program directory."
  exit 1
fi

# Create a directory for the project and copy the contents
mkdir -p $PROJECT_NAME
cp -r $PROGRAM_DIR/* $PROJECT_NAME

# Install pipenv for Python 3.9
python3.9 -m pip install pipenv

# Navigate to the project directory containing your Python program
cd $PROJECT_NAME  # This should be the current directory now

# Create a virtual environment for Python 3.9 and install project dependencies
python3.9 -m pipenv --python 3.9 install

# Install the dependencies from the Pipfile.lock file
python3.9 -m pipenv sync

# Activate the virtual environment
python3.9 -m pipenv shell

# Provide instructions for running the program
echo "Installation complete. You can now run your program using 'python massplanner-agent/executable.py'"

# Deactivate the virtual environment when done
deactivate
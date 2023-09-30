#!/bin/bash

# Function to add an extension to the extensions.setup file
add_extension() {
  local extension="$1"

  # Check if the file exists, create it if not
  if [ ! -f extensions.setup ]; then
    touch extensions.setup
  fi

  # Check if the extension already exists in the file
  if grep -Fxq "$extension" extensions.setup; then
    echo "Extension already exists: $extension"
  else
    # Append the extension to the file
    echo "$extension" >> extensions.setup
    echo "Extension added: $extension"
  fi
}

# Function to remove an extension from the extensions.setup file
remove_extension() {
  local extension="$1"

  # Check if the file exists
  if [ ! -f extensions.setup ]; then
    echo "extensions.setup file not found."
    return
  fi

  # Remove the extension from the file
  sed -i "/$extension/d" extensions.setup
  echo "Extension removed: $extension"
}

# Check if the --add-extension or -a option is provided
if [ "$1" == "--add-extension" ] || [ "$1" == "-a" ]; then
  if [ -z "$2" ]; then
    echo "Usage: $0 [--add-extension|-a] <extension-name>"
    exit 1
  fi
  add_extension "$2"
  exit 0
elif [ "$1" == "--remove-extension" ] || [ "$1" == "-r" ]; then
  if [ -z "$2" ]; then
    echo "Usage: $0 [--remove-extension|-r] <extension-name>"
    exit 1
  fi
  remove_extension "$2"
  exit 0
fi

# Check if the extensions.setup file exists
if [ ! -f extensions.setup ]; then
  echo "0 Extensions Installed"
  exit 1
fi

# Read each line from extensions.setup and install the extension
while IFS= read -r line; do
  extension=$(echo "$line" | tr -d '\r\n')  # Remove any carriage returns or newline characters
  if [ -n "$extension" ]; then
    code --install-extension "$extension"
    echo "VSCode installing -> $extension"
  fi
done < extensions.setup

echo "Extension installation completed."

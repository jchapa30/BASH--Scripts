#!/bin/bash

package="htop"

# Install the package quietly and non-interactively
sudo apt install -y "$package"

# Capture exit code
exit_code=$?

echo "The exit code for the package install is: $exit_code"

# Optional: Add logic based on success/failure
if [ $exit_code -eq 0 ]; then
    echo "$package installed successfully."
else
    echo "Failed to install $package. Exit code: $exit_code"
fi

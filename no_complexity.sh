#!/bin/bash

file="/etc/pam.d/common-password"

if grep -q "minlen=1" $file; then
    echo "minlen=1 already present in $file"
else
    sed -i 's/obscure/minlen=1/g' $file
    echo "minlen=1 added to $file"
fi

# Check if pwfeedback configuration already exists in sudoers file
if ! grep -q "Defaults\s\+env_reset,pwfeedback" /etc/sudoers; then
    # Add pwfeedback configuration to sudoers file
    echo 'Defaults        env_reset,pwfeedback' | sudo tee -a /etc/sudoers.d/pwfeedback
    echo "Password feedback enabled"
else
    echo "Password feedback already enabled"
fi

# Prompt user for new password
read -s -p "Enter new password: " new_password
echo

# Change password for current user
echo -e "$new_password\n$new_password" | passwd

echo "Password changed successfully."

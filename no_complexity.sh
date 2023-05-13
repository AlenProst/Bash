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

# Set the username, password, and full name for the new user
username="ivansto"
password="1"
fullname="ivan sto"

# Create the new user
useradd -m -s /bin/bash -c "$fullname" "$username"

# Add the new user to the sudoers file
echo "$username ALL=(ALL) ALL" | tee -a /etc/sudoers.d/$username >/dev/null

# Set the password for the new user
echo "$username:$password" | chpasswd

echo "New user created successfully."

#!/bin/bash

sudo_file=/etc/sudoers
pw_count=$(sudo grep -o -i 'pwfeedback' $sudo_file | wc -l)

if [[ $pw_count == 0 ]]
then
	echo "Astericks will not be shown, changing settings"
	sudo sed -i 's/env_reset/env_reset,pwfeedback/g' $sudo_file
	echo "Settings changed!"
	
else 
	echo "Asterics are already shown."
fi

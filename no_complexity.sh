#!/bin/bash


file=/etc/pam.d/common-password
totalCount=$(grep -o -i 'obscure' $file | wc -l)

if [[ $totalCount -gt 2 ]] 
then
	echo "Complexity was not removed.Removint complexity..."
	
	sed -i 's/[success=1 default=ignore]    pam_unix.so obscure sha512/password	[success=1 default=ignore]	pam_unix.so sha512 minlen=1/g' $file
	
	echo "Complexity has been removed."
	
	
else 
	echo "Complexity has already been removed" 
	
	
fi


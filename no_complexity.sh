#!/bin/bash

file="/etc/pam.d/common-password"

if grep -q "minlen=1" $file; then
    echo "minlen=1 already present in $file"
else
    sed -i 's/obscure/minlen=1/g' $file
    echo "minlen=1 added to $file"
fi

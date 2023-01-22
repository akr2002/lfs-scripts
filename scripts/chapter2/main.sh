#!/bin/bash

# Exit on error
# =============
exit_status=0

function check_exit_code() {
	if [ $? -ne 0 ]
	then
		exit_status=1
	else
		exit_status=0
	fi
}

function stop_script() {
	echo "Script failed in $(pwd)/$1"
	exit 1
}

echo "Checking required packages"
bash ./2.2-version-check.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter2/2.2-version-check.sh"
fi

# Chapter 2.5
# ===========
echo "Creating filesystem"
su -c "bash ./2.5-create-filesystem.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter2/2.5-create-filesystem.sh"
fi


# Chapter 2.7
# ===========
echo "Mounting filesystem"
su -c "bash ./2.7-mount.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter2/2.7-mount.sh"
fi

#!/bin/bash

PWD=$(pwd)

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

# Chapter 7.2
# ===========
echo "Changing ownership to root"
su -c "bash $PWD/7.2-changing-ownership.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.2-changing-ownership.sh"
fi

# Chapter 7.3
# ===========
echo "Preparing virtual kernel filesystems"
su -c "bash $PWD/7.3-prepare-virtual-fs.sh"

# Exit on error 
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.3-prepare-virtual-fs.sh"
fi


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
echo "Creating directories"
su -c "bash ./4.2-create-dir.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter4/4.2-create-dir.sh"
fi


# Chapter 4.3
# =========== 
echo "Adding LFS user"
su -c "bash ./4.3-add-user.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter4/4.3-add-user.sh"
fi

PWD=$(pwd)

# Chapter 4.4
# ===========
echo "Setting Up the Environment"
su - lfs -c "bash $PWD/4.4-set-up-env.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter4/4.4-set-up-env.sh"
fi

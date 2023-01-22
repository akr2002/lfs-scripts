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

# Chapter 10.2
# ============
echo "Creating /etc/fstab"
su -c "bash $SCRIPT/chapter10/10.2-fstab.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter10/10.2-fstab.sh"
fi

# Chapter 10.3
# ============
echo "Building kernel"
su -c "bash $SCRIPT/chapter10/10.3-kernel.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter10/10.3-kernel.sh"
fi

# Chapter 10.4
# ============
echo "Installng grub"
su -c "bash $SCRIPT/chapter10/10.4-grub.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter10/10.4-grub.sh"
fi

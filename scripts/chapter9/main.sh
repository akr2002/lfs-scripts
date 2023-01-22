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

# Chapter 9.2
# ===========
echo "Installing LFS bootscripts"
su -c "$SCRIPT/chapter9/9.2-lfs-bootscripts.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter9/9.2-lfs-bootscripts.sh"
fi

# Chapter 9.6
# ===========
echo "Configuring sysvinit"
su -c "bash $SCRIPT/chapter9/9.6-configure-sysvinit.sh"

# Exit on error
check_exit_code
if  [ $exit_status -ne 0 ]
then
	stop_script "chapter9/9.6-configure-sysvinit.sh"
fi

# Chapter 9.7
# ===========
echo "Configurintg shell startup files"
su -c "bash $SCRIPT/chapter9/9.7-shell-startup.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter9/9.7-shell-startup.sh"
fi

# Chapter 9.8
# ===========
echo "Creating /etc/inputrc"
su -c "bash $SCRIPT/chapter9/9.8-inputrc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter9/9.8-inputrc.sh"
fi

# Chapter 9.9
# ===========
echo "Creating /etc/shells"
su -c "bash $SCRIPT/chapter9/9.9-shells.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter9/9.9-shells.sh"
fi

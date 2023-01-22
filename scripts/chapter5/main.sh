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

PWD=$(pwd)

# Chapter 5.2
# ===========
echo "Building binutils"
su - lfs -c "bash $PWD/5.2-binutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.2-binutils.sh"
fi

# Chapter 5.3
# ===========
echo "Building gcc"
su - lfs -c "bash $PWD/5.3-gcc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.3-gcc.sh"
fi

# Chapter 5.4
# ===========
echo "Building Linux API Headers"
su - lfs -c "bash $PWD/5.4-linux-headers.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.4-linux-headers.sh"
fi

# Chapter 5.5
# ===========
echo "Building glibc"
su - lfs -c "bash $PWD/5.5-glibc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.5-glibc.sh"
fi

# Chapter 5.6
# ===========
echo "Building listdc++"
su - lfs -c "bash $PWD/5.6-libstdc++.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.6-libstdc++.sh"
fi

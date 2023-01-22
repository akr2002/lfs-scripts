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

# Chapter 6.2
# ===========
echo "Building m4"
su - lfs -c "bash $PWD/6.2-m4.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.2-m4.sh"
fi

# Chapter 6.3
# ===========
echo "Building ncurses"
su - lfs -c "bash $PWD/6.3-ncurses.sh"

# Exit onn error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.3-ncurses.sh"
fi

# Chapter 6.4
# ===========
echo "Building bash"
su - lfs -c "bash $PWD/6.4-bash.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.4-bash.sh"
fi

# Chapter 6.5
# ===========
echo "Building coreutils"
su - lfs -c "bash $PWD/6.5-coreutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.5-ncurses.sh"
fi

# Chapter 6.6
# ===========
echo "Building diffutils"
su - lfs -c "bash $PWD/6.6-diffutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.6-diffutils.sh"
fi

# Chapter 6.7
# ===========
echo "Building file"
su - lfs -c "bash $PWD/6.7-file.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.7-file.sh"
fi

# Chapter 6.8
# ===========
echo "Building findutils"
su - lfs -c "bash $PWD/6.8-findutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.8-findutils.sh"
fi

# Chapter 6.9
# ===========
echo "Building gawk"
su - lfs -c "bash $PWD/6.9-gawk.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.9-gawk.sh"
fi

# Chapter 6.10
# ============
echo "Building grep"
su - lfs -c "bash $PWD/6.10-grep.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.10-grep.sh"
fi

# Chapter 6.11
# ============
echo "Building gzip"
su - lfs -c "bash $PWD/6.11-gzip.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.11-gzip.sh"
fi

# Chapter 6.12
# ============
echo "Building make"
su - lfs -c "bash $PWD/6.12-make.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.12-make.sh"
fi

# Chapter 6.13
# ============
echo "Building patch"
su - lfs -c "bash $PWD/6.13-patch.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.13-patch.sh"
fi

# Chapter 6.14
# ============
echo "Building sed"
su - lfs -c "bash $PWD/6.14-sed.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.14-sed.sh"
fi

# Chapter 6.15
# ============
echo "Building tar"
su - lfs -c "bash $PWD/6.15-tar.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.15-tar.sh"
fi

# Chapter 6.16
# ============
echo "Building xz"
su - lfs -c "bash $PWD/6.16-xz.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.16-xz.sh"
fi

# Chapter 6.17
# ============
echo "Building binutils pass 2"
su - lfs -c "bash $PWD/6.17-binutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.17-binutils.sh"
fi

# Chapter 6.18
# ============
echo "Building gcc pass 2"
su - lfs -c "bash $PWD/6.18-gcc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.18-gcc.sh"
fi

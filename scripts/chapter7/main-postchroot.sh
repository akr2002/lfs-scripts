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

# Chapter 7.5
# ===========
echo "Creating Directories"
bash $SCRIPT/chapter7/7.5-create-dirs.sh 

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.5-create-dirs.sh"
fi

# Chapter 7.6
# ===========
echo "Creating Essential Files and Symlinks"
bash $SCRIPT/chapter7/7.6-create-files-and-symlinks.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.6-create-files-and-symlinks.sh"
fi

# Chapter 7.7
# ===========
echo "Building gettext"
bash $SCRIPT/chapter7/7.7-gettext.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.7-gettext.sh"
fi

# Chapter 7.8
# ===========
echo "Building bison"
bash $SCRIPT/chapter7/7.8-bison.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.8-bison.sh"
fi

# Chapter 7.9
# ===========
echo "Building perl"
bash $SCRIPT/chapter7/7.9-perl.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.9-perl.sh"
fi


# Chapter 7.10
# ============
echo "Building Python"
bash $SCRIPT/chapter7/7.10-Python.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.10-Python.sh"
fi

# Chapter 7.11
# ============
echo "Building texinfo"
bash $SCRIPT/chapter7/7.11-texinfo.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.11-texinfo.sh"
fi

# Chapter 7.12
# ============
echo "Building util-linux"
bash $SCRIPT/chapter7/7.12-util-linux.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.12-util-linux.sh"
fi

# Chapter 7.13
# ============
echo "Creating backup"
rm -rf /usr/share/{info,man,doc}/*
find /usr/{lib,libexec} -name \*.la -delete
rm -rf /tools


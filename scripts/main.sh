#!/bin/bash

# Set SU
# ======
command -v sudo > /dev/null
if [ $? -eq 1 ]
then
	SU=doas
else 
	SU=sudo
fi

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


# Chapter 2
# =========
echo "Chapter 2"
echo "Checking required packages"
bash ./chapter2/2.2-version-check.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter2/2.2-version-check.sh"
fi


# Set LFS variable
# ================
export LFS=/mnt/lfs
echo "LFS is $LFS"

# Chapter 2.5
# ===========
echo "Creating filesystem"
su -c "bash ./chapter2/2.5-create-filesystem.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter2/2.5-create-filesystem.sh"
fi


# Chapter 2.7
# ===========
echo "Mounting filesystem"
su -c "bash ./chapter2/2.7-mount.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter2/2.7-mount.sh"
fi


# Chapter 3
# =========
echo "Chapter 3"
echo "Downloading sources"
bash ./chapter3/3.1-sources.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter3/3.1-sources.sh"
fi


# Chapter 4
# =========
echo "Chapter 4"
echo "Creating direcctories"
su -c "bash ./chapter4/4.2-create-dir.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter4/4.2-create-dir.sh"
fi


# Chapter 4.3
# =========== 
echo "Adding LFS user"
su -c "bash ./chapter4/4.3-add-user.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter4/4.3-add-user.sh"
fi
<<<<<<< HEAD

PWD=$(pwd)

# Chapter 4.4
# ===========
echo "Setting Up the Environment"
su - lfs -c "bash $PWD/chapter4/4.4-set-up-env.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter4/4.4-set-up-env.sh"
fi

# Chapter 5.2
# ===========
echo "Chapter 5"
echo "Building binutils"
su - lfs -c "bash $PWD/chapter5/5.2-binutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.2-binutils.sh"
fi

# Chapter 5.3
# ===========
echo "Building gcc"
su - lfs -c "bash $PWD/chapter5/5.3-gcc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.3-gcc.sh"
fi

# Chapter 5.4
# ===========
echo "Building Linux API Headers"
su - lfs -c "bash $PWD/chapter5/5.4-linux-headers.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.4-linux-headers.sh"
fi

# Chapter 5.5
# ===========
echo "Building glibc"
su - lfs -c "bash $PWD/chapter5/5.5-glibc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.5-glibc.sh"
fi

# Chapter 5.6
# ===========
echo "Building listdc++"
su - lfs -c "bash $PWD/chapter5/5.6-libstdc++.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter5/5.6-libstdc++.sh"
fi

# Chapter 6.2
# ===========
echo "Chapter 6"
echo "Building m4"
su - lfs -c "bash $PWD/chapter6/6.2-m4.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.2-m4.sh"
fi

# Chapter 6.3
# ===========
echo "Building ncurses"
su - lfs -c "bash $PWD/chapter6/6.3-ncurses.sh"

# Exit onn error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.3-ncurses.sh"
fi

# Chapter 6.4
# ===========
echo "Building bash"
su - lfs -c "bash $PWD/chapter6/6.4-bash.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.4-bash.sh"
fi

# Chapter 6.5
# ===========
echo "Building coreutils"
su - lfs -c "bash $PWD/chapter6/6.5-coreutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.5-ncurses.sh"
fi

# Chapter 6.6
# ===========
echo "Building diffutils"
su - lfs -c "bash $PWD/chapter6/6.6-diffutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.6-diffutils.sh"
fi

# Chapter 6.7
# ===========
echo "Building file"
su - lfs -c "bash $PWD/chapter6/6.7-file.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.7-file.sh"
fi

# Chapter 6.8
# ===========
echo "Building findutils"
su - lfs -c "bash $PWD/chapter6/6.8-findutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.8-findutils.sh"
fi

# Chapter 6.9
# ===========
echo "Building gawk"
su - lfs -c "bash $PWD/chapter6/6.9-gawk.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.9-gawk.sh"
fi

# Chapter 6.10
# ============
echo "Building grep"
su - lfs -c "bash $PWD/chapter6/6.10-grep.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.10-grep.sh"
fi

# Chapter 6.11
# ============
echo "Building gzip"
su - lfs -c "bash $PWD/chapter6/6.11-gzip.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.11-gzip.sh"
fi

# Chapter 6.12
# ============
echo "Building make"
su - lfs -c "bash $PWD/chapter6/6.12-make.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.12-make.sh"
fi

# Chapter 6.13
# ============
echo "Building patch"
su - lfs -c "bash $PWD/chapter6/6.13-patch.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.13-patch.sh"
fi

# Chapter 6.14
# ============
echo "Building sed"
su - lfs -c "bash $PWD/chapter6/6.14-sed.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.14-sed.sh"
fi

# Chapter 6.15
# ============
echo "Building tar"
su - lfs -c "bash $PWD/chapter6/6.15-tar.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.15-tar.sh"
fi

# Chapter 6.16
# ============
echo "Building xz"
su - lfs -c "bash $PWD/chapter6/6.16-xz.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.16-xz.sh"
fi

# Chapter 6.17
# ============
echo "Building binutils pass 2"
su - lfs -c "bash $PWD/chapter6/6.17-binutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.17-binutils.sh"
fi

# Chapter 6.18
# ============
echo "Building gcc pass 2"
su - lfs -c "bash $PWD/chapter6/6.18-gcc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter6/6.18-gcc.sh"
fi

# Chapter 7.2
# ===========
echo "Chapter 7"
echo "Changing ownership to root"
su -c "bash $PWD/chapter7/7.2-changing-ownership.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.2-changing-ownership.sh"
fi

# Chapter 7.3
# ===========
echo "Preparing virtual kernel filesystems"
su -c "bash $PWD/chapter7/7.3-prepare-virtual-fs.sh"

# Exit on error 
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.3-prepare-virtual-fs.sh"
fi

# Chapter 7.4
# ===========
echo "Entering the Chroot Environment"
su -c "bash $PWD/chapter7/7.4-enter-chroot.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.4-enter-chroot.sh"
fi

# Chapter 7.5
# ===========
echo "Creating Directories"
su -c "bash $PWD/chapter7/7.5-create-dirs.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.5-create-dirs.sh"
fi

# Chapter 7.6
# ===========
echo "Creating Essential Files and Symlinks"
su -c "bash $PWD/chapter7/7.6-create-files-and-symlinks.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.6-create-files-and-symlinks.sh"
fi

# Chapter 7.7
# ===========
echo "Building gettext"
su -c "bash $PWD/chapter7/7.7-gettext.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.7-gettext.sh"
fi

# Chapter 7.8
# ===========
echo "Building bison"
su -c "bash $PWD/chapter7/7.8-bison.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.8-bison.sh"
fi

# Chapter 7.9
# ===========
echo "Building perl"
su -c "bash $PWD/chapter7/7.9-perl.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.9-perl.sh"
fi


# Chapter 7.10
# ============
echo "Building Python"
su -c "bash $PWD/chapter7/7.10-Python.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter7/7.10-Python.sh"
fi


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
bash ./chapter2/main.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 2"
fi

# Set LFS variable
# ================
export LFS=/mnt/lfs
echo "LFS is $LFS"


# Chapter 3
# =========
echo "Chapter 3"
bash ./chapter3/main.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 3"
fi

# Chapter 4
# =========
echo "Chapter 4"
bash ./chapter4/main.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 4"
fi

# Chapter 5
# =========
echo "Chapter 5"
bash ./chapter5/main.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 5"
fi

# Chapter 6
# =========
echo "Chapter 6"
bash ./chapter6/main.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 6"
fi

# Chapter 7
# =========
echo "Chapter 7"
bash ./chapter7/main-prechroot.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 7"
fi

# Chapter 7.4
# ===========
echo "Entering the Chroot Environment"
#su -c "bash $PWD/chapter7/7.4-enter-chroot.sh"

# Exit on error
# check_exit_code
# if [ $exit_status -ne 0 ]
# then
# 	stop_script "chapter7/7.4-enter-chroot.sh"
# fi

# If I think it is what it is, then it should not be executed as a child script as it would exit chroot. However, I wouldn't know unless I run it. I will keep it commented for now.

chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login

PWD=$(pwd)

# I don't think $PWD is important at this point since the chroot will drop us in $LFS, treated as /. We lost the location of this script. Here's hoping the user puts this repo in $LFS/sources. So much for avoiding hardcoded paths...all goes out the window.

export SCRIPT=/sources/lfs-scripts

# Chapter 7.5
# ===========
bash ./chapter7/main-postchroot.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 7, post chroot"
fi

# Exit chroot
exit

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 7, post chroot"
fi

# Unmount virtual filesystems
umount $LFS/dev/pts
umount $LFS/{sys,proc,run,dev}

# Create backup
cd $LFS
tar -cJpf $HOME/lfs-temp-tools-11.2.tar.xz .

# Entering chroot
echo "Preparing virtual kernel filesystems"
su -c "bash $PWD/chapter7/7.3-prepare-virtual-fs.sh"

echo "Entering the Chroot Environment"
chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin     \
    /bin/bash --login

export SCRIPT=/sources/lfs-scripts

# Chapter 8
# =========
echo "Chapter 8"
bash ./chapter8/main.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 8"
fi

# Chapter 9
# =========
echo "Chapter 9"
bash ./chapter9/main.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 9"
fi

# Chapter 10
# ==========
echo "Chapter 10"
bash ./chapter10/main.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "Stopped in chapter 10"
fi

# Chapter 11.1
# ============
echo "Chapter 11"
echo "Finishing up"

echo 11.2 > /etc/lfs-release

cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="11.2"
DISTRIB_CODENAME="summer2023"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="11.2"
ID=lfs
PRETTY_NAME="Linux From Scratch 11.2"
VERSION_CODENAME="summer2023"
EOF

# Exit chroot
logout

# Unmount filesystems
su -c "umount -v $LFS/dev/pts"
su -c "umount -v $LFS/dev"
su -c "umount -v $LFS/run"
su -c "umount -v $LFS/proc"
su -c "umount -v $LFS/sys"
su -c "umount -v $LFS"


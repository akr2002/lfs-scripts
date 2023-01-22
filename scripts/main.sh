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

# Chapter 7.2
# ===========
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

# Chapter 8.3
# ===========
echo "Chapter 8"
echo "Building man-pages"
su -c "bash $SCRIPT/chapter8/8.3-man-pages.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.3-man-pages.sh"
fi

# Chapter 8.4
# ===========
echo "Building iana-etc"
su -c "bash $SCRIPT/chapter8/8.4-iana-etc.sh"

# Chapter 8.5
# ===========
echo "Building glibc"
su -c "bash $SCRIPT/chapter8/8.5-glibc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.5-glibc.sh"
fi

# Chapter 8.6
# ===========
echo "Building zlib"
su -c "bash $SCRIPT/chapter8/8.6-zlib.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.6-zlib.sh"
fi

# Chapter 8.7
# ===========
echo "Building bzip2"
su -c "bash $SCRIPT/chapter8/8.7-bzip.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.7-bzip.sh"
fi

# Chapter 8.8
# ===========
echo "Building xz"
su -c "bash $SCRIPT/chapter8/8.8-xz.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.8-xz.sh"
fi

# Chapter 8.9
# ===========
echo "Building zstd"
su -c "bash $SCRIPT/chapter8/8.9-zstd.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.9-zstd.sh"
fi

# Chapter 8.10
# ============
echo "Building file"
su -c "bash $SCRIPT/chapter8/8.10-file.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.10-file.sh"
fi

# Chapter 8.11
# ============
echo "Building readline"
su -c "bash $SCRIPT/chapter8/8.11-readline.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.11-readline.sh"
fi

# Chapter 8.12
# ============
echo "Building m4"
su -c "bash $SCRIPT/chapter8/8.12-m4.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.12-m4.sh"
fi

# Chapter 8.13
# ============
echo "Building bc"
su -c "bash $SCRIPT/chapter8/8.13-bc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.13-bc.sh"
fi

# Chapter 8.14
# ============
echo "Building flex"
su -c "bash $SCRIPT/chapter8/8.14-flex.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.14-flex.sh"
fi

# Chapter 8.15
# ============
echo "Building tcl"
su -c "bash $SCRIPT/chapter8/8.15-tcl.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.15-tcl.sh"
fi

# Chapter 8.16
# ============
echo "Building expect"
su -c "bash $SCRIPT/chapter8/8.16-expect.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	exit 1
fi

# Chapter 8.17
# ============
echo "Building dejagnu"
su -c "bash $SCRIPT/chapter8/8.17-dejagnu.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.17-dejagnu.sh"
fi

# Chapter 8.18
# ============
echo "Building binutils"
su -c "bash $SCRIPT/chapter8/8.18-binutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.18-binutils.sh"
fi

# Chapter 8.19
# ============
echo "Building GMP"
su -c "bash $SCRIPT/chapter8/8.19-gmp.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.19-gmp.sh"
fi

# Chapter 8.20
# ============
echo "Building MPFR"
su -c "bash $SCRIPT/chapter8/8.20-mpfr.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.20-mpfr.sh"
fi

# Chapter 8.21
# ============
echo "Building MPC"
su -c "bash $SCRIPT/chapter8/8.21-mpc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.21-mpc.sh"
fi

# Chapter 8.22
# ============
echo "Building attr"
su -c "bash $SCRIPT/chapter8/8.22-attr.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.22-attr.sh"
fi

# Chapter 8.23
# ============
echo "Building acl"
su -c "bash $SCRIPT/chapter8/8.23-acl.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.23-acl.sh"
fi

# Chapter 8.24
# ============
echo "Building libcap"
su -c "bash $SCRIPT/chapter8/8.24-libcap.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.24-libcap.sh"
fi

# Chapter 8.25
# ============
echo "Building shadow"
su -c "bash $SCRIPT/chapter8/8.25-shadow.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.25-shadow.sh"
fi

# Chapter 8.26
# ============
echo "Building gcc"
su -c "bash $SCRIPT/chapter8/8.26-gcc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.26-gcc.sh"
fi

# Chapter 8.27
# ============
echo "Building pkg-config.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.27-pkg-config.sh"
fi

# Chapter 8.28
# ============
echo "Building ncurses"
su -c "bash $SCRIPT/chapter8/8/28-ncurses.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.28-ncurses.sh"
fi


# Chapter 8.29
# ============
echo "Building sed"
su -c "bash $SCRIPT/chapter8/8.29-sed.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.29-sed.sh"
fi

# Chapter 8.30
# ============
echo "Building psmisc"
su -c "bash $SCRIPT/chapter8/8.30-psmisc.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.30-psmisc.sh"
fi

# Chapter 8.31
# ============
echo "Building gettext"
su -c "bash $SCRIPT/chapter8/8.31-gettext.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.31-gettext.sh"
fi

# Chapter 8.32
# ============
echo "Building bison"
su -c "bash $SCRIPT/chapter8/8.32-bison.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.32-bison.sh"
fi

# Chapter 8.33
# ============
echo "Building grep"
su -c "bash $SCRIPT/chapter8/8.33-grep.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.33-grep.sh"
fi

# Chapter 8.34
# ============
echo "Building bash"
su -c "bash $SCRIPT/chapter8/8.34-bash.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.34-bash.sh"
fi

# Chapter 8.35
# ============
echo "Building libtool"
su -c "bash $SCRIPT/chapter8/8.35-libtool.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.35-libtool.sh"
fi

# Chapter 8.36
# ============
echo "Building GDBM"
su -c "bash $SCRIPT/chapter8/8.36-gdbm.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.36-gdbm.sh"
fi

# Chapter 8.37
# ============
echo "Building gperf"
su -c "bash $SCRIPT/chapter8/8.37-gperf.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.37-gperf.sh"
fi

# Chapter 8.38
# ============
echo "Building expat"
su -c "bash $SCRIPT/chapter8/8.38-expat.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.38-expat.sh"
fi

# A thousand lines already
# But I know it won't work
# for I know the flaws in my ways
# Why am I still doing it?

# Chapter 8.39
# ============
echo "Building inetutils"
su -c "bash $SCRIPT/chapter8/8.39-inetutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.39-inetutils.sh"
fi

# Chapter 8.40
# ============
echo "Building less"
su -c "bash $SCRIPT/chapter8/8.40-less.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.40-less.sh"
fi

# Chapter 8.41
# ============
echo "Building perl"
su -c "bash $SCRIPT/chapter8/8.41-perl.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.41-perl.sh"
fi

# Chapter 8.42
# ============
echo "Building XML::Parser"
su -c "bash $SCRIPT/chapter8/8.42-xml-parser.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.42-xml-parser.sh"
fi

# Chapter 8.43
# ============
echo "Building intltool"
su -c "bash $SCRIPT/chapter8/8.43-intltool.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.43-intltool.sh"
fi

# Chapter 8.44
# ============
echo "Building autoconf"
su -c "bash $SCRIPT/8.44-autoconf.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.44-autoconf.sh"
fi

# Chapter 8.45
# ============
echo "Building automake"
su -c "bash $SCRIPT/chapter8/8.45-automake.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.45-automake.sh"
fi

# Chapter 8.46
# ============
echo "Building openssl"
su -c "bash $SCRIPT/chapter8/8.45-openssl.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	exit 1
fi

# Chapter 8.47
# ============
echo "Building kmod"
su -c "bash $SCRIPT/chapter8/8.47-kmod.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.47-kmod.sh"
fi

# Chapter 8.48
# ============
echo "Building libelf"
su -c "bash $SCRIPT/chapter8/8.48-libelf.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.48-libelf.sh"
fi

# Chapter 8.49
# ============
echo "Building libffi"
su -c "bash $SCRIPT/chapter8/8.49-libffi.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.49-libffi.sh"
fi

# Chapter 8.50
echo "Building Python"
su -c "bash $SCRIPT/chapter8/8.50-python.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.50-python.sh"
fi

# Chapter 8.51
# ============
echo "Building wheel"
su -c "bash $SCRIPT/chapter8/8.51-wheel.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.51-wheel.sh"
fi

# Chapter 8.52
# ============
echo "Building ninja"
su -c "bash $SCRIPT/chapter8/8.52-ninja.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.52-ninja.sh"
fi

# Chapter 8.53
# ============
echo "Building meson"
su -c "bash $SCRIPT/chapter8/8.53-meson.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.53-meson.sh"
fi

# Chapter 8.54
# ============
echo "Building coreutils"
su -c "bash $SCRIPT/chapter8/8.54-coreutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "bash $SCRIPT/chapter8/8.54-coreutils.sh"
fi

# Chapter 8.55
# ============
echo "Building check"
su -c "bash $SCRIPT/chapter8/8.55-check.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.55-check.sh"
fi

# Chapter 8.56
# ============
echo "Building diffutils"
su -c "bash $SCRIPT/chapter8/8.56-diffutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.56-diffutils.sh"
fi

# Chapter 8.57
# ============
echo "Building gawk"
su -c "bash $SCRIPT/chapter8/8.57-gawk.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.57-gawk.sh"
fi

# Chapter 8.58
# ============
echo "Building findutils"
su -c "bash $SCRIPT/chapter8/8.58-findutils.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.58-findutils.sh"
fi

# Chapter 8.59
# ============
echo "Building groff"
su -c "bash $SCRIPT/chapter8/8.59-groff.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.59-groff.sh"
fi

# Chapter 8.60
# ============
echo "Building grub"
su -c "bash $SCRIPT/chapter8/8.60-bash.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.60-bash.sh"
fi

# Chapter 8.61
# ============
echo "Building gzip"
su -c "bash $SCRIPT/chapter8/8.61-gzip.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.61-gzip.sh"
fi

# Chapter 8.62
# ============
echo "Building iproute2"
su -c "bash $SCRIPT/chapter8/8.62-iproute2.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.62-iproute2.sh"
fi

# Chapter 8.63
# ============
echo "Building kbd"
su -c "bash $SCRIPT/chapter8/8.63-kbd.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.63-kbd"
fi

# Chapter 8.64
# ============
echo "Building libpipeline"
su -c "bash $SCRIPT/chapter8/8.64-libpipeline.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.64-libpipeline.sh"
fi

# Chapter 8.65
# ============
echo "Building make"
su -c "bash $SCRIPT/chapter8/8.65-make.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.65-make.sh"
fi

# Chapter 8.66
# ============
echo "Building patch"
su -c "bash $SCRIPT/chapter8/8.66-patch.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.66-patch.sh"
fi

# Chapter 8.67
# ============
echo "Building tar"
su -c "bash $SCRIPT/chapter8/8.67-tar.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	exit 1
fi

# Chapter 8.68
# ============
echo "Building texinfo"
su -c "bash $SCRIPT/chapter8/8.68-texinfo.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.68-texinfo.sh"
fi

# Chapter 8.69
# ============
echo "Building vim"
su -c "bash $SCRIPT/chapter8/8.69-vim.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	exit 1
fi

# Chapter 8.70
# ============
echo "Building eudev"
su -c "bash $SCRIPT/chapter8/8.70-eudev.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.70-eudev.sh"
fi

# Chapter 8.71
# ============
echo "Building man-db"
su -c "bash $SCRIPT/chapter8/8.71-man-db.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.71-man-db.sh"
fi

# Chapter 8.72
# ============
echo "Building procps-ng"
su -c "bash $SCRIPT/chapter8/8.72-procps-ng.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.72-procps-ng.sh"
fi

# Chapter 8.73
# ============
echo "Building util-linux"
su -c "bash $SCRIPT/chapter8/8.73-util-linux.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.73-util-linux.sh"
fi

# Chapter 8.74
# ============
echo "Building e2fsprogs"
su -c "bash $SCRIPT/chapter8/8.74-e2fsprogs.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.74-e2fsprogs.sh"
fi

# chapter8.75
# ===========
echo "Building sysklogd"
su -c "bash $SCRIPT/chapter8/8.75-sysklogd.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
 stop_script "chapter8/8.75-sysklogd.sh"
fi

# Chapter 8.76
# ============
echo "Building sysvinit"
su -c "bash $SCRIPT/chapter8/8.76-sysvinit.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.76-sysvinit.sh"
fi

# Chapter 8.78
# ============
echo "Stripping debug symbols"
su -c "bash $SCRIPT/chapter8/8.78-stripping.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.78-stripping.sh"
fi

# Chapter 8.79
# ============
echo "Cleaning up extra files"
su -c "bash $SCRIPT/chapter8/8.79-cleanup.sh"

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter8/8.79-cleanup.sh"
fi

# Chapter 9.2
# ===========
echo "Chapter 9"
echo "Installing LFS bootscripts"
su -c "SCRIPT/chapter9/9.2-lfs-bootscripts.sh"

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

# Chapter 10.2
# ============
echo "Chapter 10"
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


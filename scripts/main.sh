#!/bin/bash

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

echo "Chapter 2"
echo "Checking required packages"
bash ./chapter2/2.2-version-check.sh

check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter2/2.2-version-check.sh"
fi


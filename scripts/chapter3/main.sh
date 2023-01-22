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

echo "Downloading sources"
bash ./3.1-sources.sh

# Exit on error
check_exit_code
if [ $exit_status -ne 0 ]
then
	stop_script "chapter3/3.1-sources.sh"
fi


#!/bin/bash
#
# This script will set up your Android LP sources by cherry-picking
# all needed commits and fixes.
# Please fetch the mentioned repos ONCE before running this script by
# executing this script with the --fetch argument.
# Make sure you ran ". build/envsetup.sh" before running this script!


# Resetting some variables in case they were set

errorcount=0
failing_commit=""
fetch=0

# Create array of commit IDs and repo URLs
declare -A commit_id=()
declare -A repo_url=()


##### Definable values
remote_name="p880-dev_autofetch"

paths="frameworks/native frameworks/base"

#commit_id[frameworks_native]='8465cdba74a038bb29598cfb4f48754b83124f48 208b1fcc0df405dc15582798c4e5406ba16201a9 49beaf826eb1c4eae3fe3202ef682a5973213c2d c83b9661c0fca41a5f43473def58379c7d7ae7d7 0c880a230ef4331cc071d45b6b06a8b0572c5a8f 46f3af4ad1828b586f2314fc6b68fa725f90d4d0'
commit_id[frameworks_native]='46f3af4ad1828b586f2314fc6b68fa725f90d4d0'
commit_id[frameworks_base]='a9a3ffe5f83a509fd1cc987a7cc395b63726709a'

repo_url[frameworks_native]='git@bitbucket.org:laufersteppenwolf/android_frameworks_native.git'
repo_url[frameworks_base]='git@github.com:laufersteppenwolf/android_frameworks_base-1.git'

#####


if [[ $1 = '--fetch' ]]; then
	fetch=1
fi

cherry-pick() {										# $1 = commit ID
	echo "cherry-picking $1"
	git cherry-pick $1
	
	exitcode=$?
	# check if the cherry-pick was successful, otherwise reset
	if [[ $exitcode != 0 ]]; then
		((errorcount++))
		failing_commit="$failing_commit $1"
		git reset --hard HEAD
	fi
}

fetch() {											# $1 = repo url
	echo "Adding remote $remote_name $1"
	git remote add $remote_name $1
	git fetch $remote_name
}

note_enter() {
	echo ""
	echo "*************************************************************"
	echo "* Entering $1 "
	echo "*************************************************************"
	echo ""
}

croot

for path in ${paths}; do
	note_enter ${path}
	
	sleep 1
	
	commit_path=$(echo ${path} | sed 's/\//_/')
	
	cd ${path}

	if [[ $fetch != 0 ]]; then
		fetch ${repo_url[${commit_path}]}
	fi
	
	commit_path=$(echo ${path} | sed 's/\//_/')

	for commit in ${commit_id[${commit_path}]}; do
#		sleep 2
		cherry-pick $commit
	done
	
	croot
done

if [[ $errorcount != 0 ]]; then
	echo ""
	echo "*************************************************************"
	echo "* $errorcount commits failed and got reset!"
	echo "* Please look into the issue and fix the failing commits!"
	echo "*************************************************************"
else
	echo ""
	echo "*************************************************************"
	echo "* All commits applied successfully!"
	echo "*************************************************************"
fi

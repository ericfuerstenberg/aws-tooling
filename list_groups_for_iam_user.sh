#!/bin/bash
read -p "Enter the IAM user name: " IAM_user_name

user_count=`aws iam list-users --output text | grep -w "${IAM_user_name}" | grep -v grep | wc -l`

if [ "${user_count}" = 0 ]
then
	echo "${IAM_user_name} is not a valid IAM username for this AWS account."
	echo "Please enter a valid IAM username."
	exit 1
fi

aws iam list-groups-for-user --user-name ${IAM_user_name} --output text | awk '{print $5}'


#!/bin/bash
read -p "Enter the IAM user name: " IAM_user_name
aws iam list-groups-for-user --user-name ${IAM_user_name} --output text | awk '{print $5}'


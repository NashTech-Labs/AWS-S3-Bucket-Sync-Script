#!/bin/bash
echo "do you want install AWS CLI?"
read choice
if [[ "$choice" =~ ^[Yy]$ ]]; 
then
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
fi

echo "Enter you access key"
read ACCESS_KEY_ID

echo "Enter you secret Access key"
read SECRET_ACCESS_KEY

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY

echo "Please enter Source bucket name"
read source_bucket

echo "Please enter Destination bucket name"
read destination_bucket

echo "Do you want to copy whole $source_bucket to $destination_bucket?(y/n)"
read choice
if [[ "$choice" =~ ^[Yy]$ ]]; 
then
aws s3 sync s3://$source_bucket s3://$destination_bucket
fi
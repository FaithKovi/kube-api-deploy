#!/bin/bash
set -e # stop if it fails at any point

# CYAN='\033[1;36m'
# NO_COLOR='\033[0m'
# LABEL="AWS CLI Configuration(Ensure you configure an IAM user with permissions to access the AWS resources you need)"
# printf "${CYAN}====== ${LABEL}${NO_COLOR}\n"


# # Prompt the user for their AWS Access Key ID
# read -p "Enter AWS Access Key ID: " aws_access_key_id

# # Prompt the user for AWS Secret Access Key
# read -p "Enter AWS Secret Access Key: " aws_secret_access_key

# # Prompt the user for the default AWS region
# read -p "Enter Default AWS Region (e.g., us-west-2): " aws_default_region

# # Prompt the user for the output format (json, text, table)
# read -p "Enter Output Format (json, text, table): " aws_output_format

# # Configure the AWS CLI
# aws configure set aws_access_key_id "$aws_access_key_id"
# aws configure set aws_secret_access_key "$aws_secret_access_key"
# aws configure set default.region "$aws_default_region"
# aws configure set default.output "$aws_output_format"

# echo "Your AWS CLI configuration has been set."

CYAN='\033[1;36m'
NO_COLOR='\033[0m'
LABEL="Deploying the Terraform Configuration(Ensure you have the Terraform CLI installed)"
printf "${CYAN}====== ${LABEL}${NO_COLOR}\n"

# Folder containing the Terraform configuration
cd infrastructure

# Initialize the Terraform configuration
terraform init

# Validate the Terraform configuration
terraform validate 

# Terraform plan
terraform plan -var-file=terraform.tfvars

terraform plan -var-file=terraform.tfvars -out=terraform.plan
terraform apply terraform.plan

# Deploy the Terraform configuration
terraform apply -var-file=terraform.tfvars -auto-approve

# Retrieve kubeconfig
terraform output kubeconfig > kubeconfig.yaml

cp ~/.kube/config ./kubeconfig

# Set KUBECONFIG Environment Variable
export KUBECONFIG=kubeconfig.yaml


# Exit the infrastructure folder
cd ..

CYAN='\033[1;36m'
NO_COLOR='\033[0m'
LABEL="Run the python script to deploy a containerized application using the Kubernetes client API"
printf "${CYAN}====== ${LABEL}${NO_COLOR}\n"

# Check if the python file exists
if [ -f "kubeApiDeploy.py" ]; then
    # Run the python script
    python kubeApiDeploy.py
else
    echo "The python file does not exist."
fi
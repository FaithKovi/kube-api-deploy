CYAN='\033[1;36m'
NO_COLOR='\033[0m'
LABEL="Destroying the Terraform Configuration(Ensure you have the Terraform CLI installed)"
printf "${CYAN}====== ${LABEL}${NO_COLOR}\n"

# Destroy the Terraform configuration
terraform destroy -auto-approve
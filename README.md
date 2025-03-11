# folder structure
terraform-challange
│── main.tf           # Main Terraform configuration
│── variables.tf      # Variables for customization
│── security.tf       # Security group configuration
│── outputs.tf        # Output values
│── provider.tf       # AWS provider configuration


 Steps to Deploy

# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Apply configuration
terraform apply -auto-approve


✅ Creates an EC2 instance (Ubuntu 20.04) with Apache installed.
✅ Creates an RDS MySQL database with port 3306 open only for EC2.
✅ Configures security groups to restrict access appropriately.
✅ Outputs the Web Server's Public IP and RDS Endpoint.

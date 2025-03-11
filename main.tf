provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}
# Create an EC2 instance
resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<h1>Welcome to My Web App</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer"
  }
}

# Create an RDS MySQL Database
resource "aws_db_instance" "rds_db" {
  allocated_storage      = 20
  engine                 = "mysql"
  instance_class         = "db.t4g.micro"
  identifier             = "database-1"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  tags = {
    Name = "MySQL-RDS"
  }
}


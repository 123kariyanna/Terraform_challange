output "web_server_public_ip" {
  description = "Public IP of the Web Server"
  value       = aws_instance.web_server.public_ip
}

output "rds_endpoint" {
  description = "RDS MySQL Endpoint"
  value       = aws_db_instance.rds_db.endpoint
}


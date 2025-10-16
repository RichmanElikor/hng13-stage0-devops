# Output the Instance ID and Public IP of the EC@ instanc
output "instance_id" {
  description = "The Instance ID of the EC2 instance"
  value = aws_instance.hng_instance.id
}
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value = aws_instance.hng_instance.public_ip
}

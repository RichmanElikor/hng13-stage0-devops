# Variables for EC2 instance 
variable "ami_id" {
  description = "The AMI ID for the instance"
  type = string 
  default = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
  description = "The type of instance to create"
  type = string 
  default = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type = string
  default = "hng_keypair"
}

variable "security_group_ids" {
  description = "The security "
}

# Variable region for AWS provider
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type = string
  default = "us-east-1"
}
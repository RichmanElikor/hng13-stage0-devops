resource "aws_instance" "hng_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name  # This is for SSH access
  security_groups = [aws_security_group.hng_sg.name] # This is for ports and access 

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              echo "<h1>Welcome to DevOps Stage 0 - Chikemzi Elikor / @SlackUsername</h1>" > /var/www/html/index.html
              echo "<p>Successfully deployed on AWS EC2</p>" >> /var/www/html/index.html
              echo "<p>Deployed: $(date)</p>" >> /var/www/html/index.html
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}


resource "aws_security_group" "hng_sg" {
  name = "hng_sg"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    description = "SSH"
    from_port = 22 
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


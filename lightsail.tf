resource "aws_lightsail_instance" "lightsail-instance" {
  name              = "inshera-server"
  availability_zone = "us-east-1a" 
  blueprint_id      = "amazon_linux_2"
  bundle_id = "nano_1_0" 

  tags = {
    env = "dev" 
     }
    }

  
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "<h1>This Server is created using Terraform</h1>" >> /var/www/html/index.html
              EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}
resource "aws_instance" "app" {
  count = var.instance_count

  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.app_subnet_ids[count.index]
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_pair_name

  iam_instance_profile = var.iam_instance_profile

  user_data = <<-EOF
              #!/bin/bash

              dnf update -y
              dnf install -y nginx

              systemctl enable nginx
              systemctl start nginx

              cat > /usr/share/nginx/html/index.html <<HTML
              <!DOCTYPE html>
              <html>
              <head>
                <title>Terraform 3-Tier Architecture</title>
              </head>
              <body>
                <h1>Terraform AWS 3-Tier Architecture</h1>
                <p>Application Server: ${var.project_name}-${count.index + 1}</p>
                <p>Environment: dev</p>
                <p>Managed by Terraform</p>
              </body>
              </html>
              HTML
              EOF

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
  }

  monitoring = true

  tags = {
    Name = "${var.project_name}-app-${count.index + 1}"
    Tier = "application"
  }
}
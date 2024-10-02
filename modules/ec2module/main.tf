
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] 
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags          = var.tags
  associate_public_ip_address = true

  root_block_device {
    volume_size = 10
  }

  security_groups = [module.security.security_group_name]

  provisioner "remote-exec" {
    inline = [
     "sudo apt-get update -y",
     "sudo apt-get install -y nginx",
     "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./lionelle.pem")
      host        = self.public_ip
    }
  }
}

output "instance_id" {
  value = aws_instance.ec2_instance.id
}

output "availability_zone" {
  value = aws_instance.ec2_instance.availability_zone
}

module "security" {
  source = "../securitymodule"
}

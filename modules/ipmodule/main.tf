
variable "instance_id" {
  description = "The ID of the EC2 instance"
  type        = string
}

resource "aws_eip" "lb" {
  instance = var.instance_id
  domain      = "vpc"

  provisioner "local-exec" {
  command = <<EOL
    echo "PUBLIC IP: ${aws_eip.lb.public_ip}" > infos_ec2.txt
  EOL
}
}

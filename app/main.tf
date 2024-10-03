provider "aws" {
  region     = "us-east-1"
  access_key = "Your access key"
  secret_key = "Your secret key"
}

module "ec2" {
  source         = "../modules/ec2module"
  instance_type = "t2.nano"
  tags = {
    Name = "ec2-lionelle"
  }
}

module "ebs" {
  source       = "../modules/ebsmodule"
  instance_id = module.ec2.instance_id 
  availability_zone = module.ec2.availability_zone 
}

module "ip" {
  source = "../modules/ipmodule"
  instance_id = module.ec2.instance_id 
}



terraform {
  backend "s3" {
    bucket                  = "koganti-upload"
    key            = "global/s3/terraform.tfstate"
    region                  = "us-east-1"
  }
}
provider "aws" {
 region = "us-east-1"
}

locals {
    tag_name_local="name"
}

resource "aws_instance" "ec2_example" {
   count = var.num_ec2_instances
   ami           = var.ami_id
   instance_type = var.inst_type
   security_groups = [ "sg1","sg2" ]
   tags = {
           Name = "ec2-${var.LOB}"
   }
}


output "public_ip" {
    value = [aws_instance.ec2_example[*].public_ip]
} 


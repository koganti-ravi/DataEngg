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
   vpc_security_group_ids = [ "sg-c46962ba" ]
   tags = {
           Name = "ec2-${var.LOB}-${var.env_name}"
   }
} 

# All AWS Instances
data "aws_instances" "MyInstances" {
  instance_state_names = ["running","stopped"]
  filter {
    name   = "tag:Name"
    values = ["client"]
  } 
  depends_on = [ aws_instance.ec2_example ]
}





output "public_ip_list" {
    value = data.aws_instances.MyInstances.private_ips
} 


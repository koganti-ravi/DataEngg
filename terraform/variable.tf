variable "LOB" {
   type = string
   description = "line of business"
   default = "Sales"
 }

variable "num_ec2_instances" {
   type = number
   description = "line of business"
   default = "1"
 }

variable "ami_id" {
   type = string
   description = "ami id"
   default = "ami-0182f373e66f89c85"
 }

variable "inst_type" {
   type = string
   description = " instance type"
   default = "t2.micro"   
 }

variable "sg_groups" {
   type = list(string)
   description = "security groups"
 }

 variable "tag_name" {
   type = set(string)
   description = "name of tag"
 }



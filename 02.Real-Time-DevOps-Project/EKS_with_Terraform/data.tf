# data "aws_ami" "example" {
#   most_recent = true

#   owners = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-kernel-*-hvm-*-x86_64-gp2"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# Declare the aws_availability_zones data source
data "aws_availability_zones" "azs" {
  state = "available"
}
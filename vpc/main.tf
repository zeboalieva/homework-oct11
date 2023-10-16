resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}
variable "vpc_cidr" {
  type = string
}

output "vpc_id" {
  value =aws_vpc.main.id
}
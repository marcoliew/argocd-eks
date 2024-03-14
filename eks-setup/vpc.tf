
locals {
  name_prefix = var.name_prefix
}

resource "aws_vpc" "main" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "${local.name_prefix}-vpc"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}-igw"
  }
}

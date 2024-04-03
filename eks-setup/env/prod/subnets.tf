
resource "aws_subnet" "private-ap-southeast-2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.26.0.0/19"
  availability_zone = "${var.region}a"

  tags = {
    "Name"                                      = "private-${var.region}a"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_subnet" "private-ap-southeast-2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "172.26.32.0/19"
  availability_zone = "${var.region}b"

  tags = {
    "Name"                                      = "private-${var.region}b"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_subnet" "public-ap-southeast-2a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.26.64.0/19"
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-${var.region}a"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

resource "aws_subnet" "public-ap-southeast-2b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.26.96.0/19"
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    "Name"                                      = "public-${var.region}b"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}

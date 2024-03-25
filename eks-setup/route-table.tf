resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route = [{
    cidr_block                 = "0.0.0.0/0"
    nat_gateway_id             = aws_nat_gateway.nat.id
    carrier_gateway_id         = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = ""
    instance_id                = ""
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]

  tags = {
    Name = "${var.name_prefix}private-rt"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route = [{
    cidr_block                 = "0.0.0.0/0"
    gateway_id                 = aws_internet_gateway.igw.id
    nat_gateway_id             = ""
    carrier_gateway_id         = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    instance_id                = ""
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]

  tags = {
    Name = "${var.name_prefix}public-rt"
  }
}

resource "aws_route_table_association" "private-ap-southeast-2a" {
  subnet_id      = aws_subnet.private-ap-southeast-2a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private-ap-southeast-2b" {
  subnet_id      = aws_subnet.private-ap-southeast-2b.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public-ap-southeast-2a" {
  subnet_id      = aws_subnet.public-ap-southeast-2a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-ap-southeast-2b" {
  subnet_id      = aws_subnet.public-ap-southeast-2b.id
  route_table_id = aws_route_table.public.id
}

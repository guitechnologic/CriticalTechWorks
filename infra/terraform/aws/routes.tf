# Elastic IP
# IP público fixo usado pelo NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}

# NAT Gateway
# Permite que subnets privadas acessem a internet
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id

  # NAT fica SEMPRE em subnet pública
  subnet_id = aws_subnet.public[0].id

  tags = {
    Name    = "ctw-nat"
    Project = "CriticalTechWorks"
  }
}

# Route Table pública
# Direciona tráfego para o Internet Gateway
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name    = "ctw-public-rt"
    Project = "CriticalTechWorks"
  }
}

# Associa subnets públicas à route table pública
resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Route Table privada
# Direciona tráfego para o NAT Gateway
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name    = "ctw-private-rt"
    Project = "CriticalTechWorks"
  }
}

# Associa subnets privadas à route table privada
resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

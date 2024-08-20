resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.system}-${var.environment}"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.system}-${var.environment}"
  }
}

resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "${var.system}-${var.environment}-nat"
  }
}

resource "aws_nat_gateway" "this" {
  subnet_id     = element(aws_subnet.public.*.id, 0)
  allocation_id = aws_eip.this.id

  tags = {
    Name = "${var.system}-${var.environment}"
  }
}

resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.system}-${var.environment}-public_${data.aws_availability_zones.available.names[count.index]}"
    type = "public"
  }
}

resource "aws_subnet" "private" {
  count             = 3
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "${var.system}-${var.environment}-private-${data.aws_availability_zones.available.names[count.index]}"
    type = "private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.system}-${var.environment}-public"
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = "${var.system}-${var.environment}-private"
  }
}

resource "aws_route_table_association" "public" {
  count          = 3
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "private" {
  count          = 3
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_security_group" "this" {
  name   = "${var.system}-${var.environment}-alb"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = var.inbound_traffic_port
    to_port     = var.inbound_traffic_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.system}-${var.environment}-alb"
  }
}

resource "aws_lb" "this" {
  name               = "${var.system}-${var.environment}-myapp"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.this.id]
  subnets            = aws_subnet.public[*].id
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.inbound_traffic_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group" "this" {
  name     = "${var.system}-${var.environment}-myapp"
  port     = var.inbound_traffic_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id
}

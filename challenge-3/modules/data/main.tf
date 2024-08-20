resource "aws_rds_cluster" "this" {
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  cluster_identifier     = "${var.system}-${var.environment}-myapp"
  master_username        = var.rds_admin_username
  master_password        = var.rds_admin_password
  availability_zones     = data.aws_availability_zones.available.names
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]
}

resource "aws_rds_cluster_instance" "this" {
  count = 3

  engine             = var.rds_engine
  engine_version     = var.rds_engine_version
  identifier         = "${var.system}-${var.environment}-myapp-${count.index}"
  cluster_identifier = aws_rds_cluster.this.id
  instance_class     = var.rds_instance_size
}

resource "aws_db_subnet_group" "this" {
  name       = "${var.system}-${var.environment}-myapp-main"
  subnet_ids = data.aws_subnets.private.ids
}

resource "aws_security_group" "this" {
  name   = "${var.system}-${var.environment}-rds"
  vpc_id = data.aws_vpc.system.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [data.aws_security_group.ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.system}-${var.environment}-rds"
  }
}
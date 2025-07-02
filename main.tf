# VPC
resource "aws_vpc" "rds_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "rds_vpc"
  }
}

# Subnets
resource "aws_subnet" "rds_subnet_1" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = var.subnet1_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "rds-subnet-1"
  }
}

resource "aws_subnet" "rds_subnet_2" {
  vpc_id            = aws_vpc.rds_vpc.id
  cidr_block        = var.subnet2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "rds-subnet-2"
  }
}

# DB Subnet Group
resource "aws_db_subnet_group" "mysql_grp" {
  name       = "mysql-subnet-group"
  subnet_ids = [
    aws_subnet.rds_subnet_1.id,
    aws_subnet.rds_subnet_2.id
  ]
  tags = {
    Name = "mysql-subnet-group"
  }
}

# Security Group
resource "aws_security_group" "db_sg" {
  name        = "mysqldb_sg"
  description = "Security group for MySQL RDS"
  vpc_id      = aws_vpc.rds_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysql-db-sg"
  }
}

# RDS Instance
resource "aws_db_instance" "db1" {
  identifier              = "mysql-db1"
  engine                  = "mysql"
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  port                    = 3306

  publicly_accessible     = false
  vpc_security_group_ids  = [aws_security_group.db_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.mysql_grp.name
  backup_retention_period = var.backup_retention_days

  skip_final_snapshot = true

  tags = {
    Name = "mysql-db1"
  }
}

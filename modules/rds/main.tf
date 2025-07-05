resource "aws_db_subnet_group" "jet_db_subnet_group" {
  name       = "jet-db-subnet-group"
  subnet_ids = var.database_subnets

  tags = merge(var.tags, {
    Name = "jet-db-subnet-group"
  })
}

resource "aws_security_group" "jet_rds_sg" {
  name        = "jet-rds-sg"
  description = "Allow MySQL from EC2"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow MySQL from EC2"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = var.allowed_sg_ids
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "jet-rds-sg"
  })
}

resource "aws_db_instance" "jet_mysql" {
  identifier        = "jet-mysql-db"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = var.instance_class
  allocated_storage = var.allocated_storage
  storage_type      = "gp2"

  db_name = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.jet_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.jet_rds_sg.id]
  multi_az               = false

  skip_final_snapshot = true

  tags = merge(var.tags, {
    Name = "jet-mysql-db"
  })
}

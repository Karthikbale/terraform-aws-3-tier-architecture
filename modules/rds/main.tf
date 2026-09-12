resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.database_subnet_ids

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  identifier = var.db_identifier

  engine         = "mysql"
  engine_version = var.db_engine_version

  instance_class        = var.db_instance_class
  allocated_storage     = var.allocated_storage
  storage_type          = "gp3"
  storage_encrypted     = true
  deletion_protection   = var.deletion_protection
  skip_final_snapshot   = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  port = 3306

  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = [
    var.security_group_id
  ]

  backup_retention_period = var.backup_retention
  multi_az                = var.multi_az

  publicly_accessible = false

  auto_minor_version_upgrade = true
  copy_tags_to_snapshot      = true

  tags = {
    Name = var.db_identifier
    Tier = "database"
  }
}
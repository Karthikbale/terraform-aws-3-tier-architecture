module "three_tier" {
  source = "../../"

  aws_region  = var.aws_region
  project_name = var.project_name
  environment = var.environment
  owner       = var.owner

  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  app_subnet_cidrs      = var.app_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs

  nat_gateway_count = var.nat_gateway_count

  key_pair_name = var.key_pair_name
  ami_id        = var.ami_id

  instance_type      = var.instance_type
  app_instance_count = var.app_instance_count

  application_port = var.application_port
  ssh_port         = var.ssh_port

  alb_name          = var.alb_name
  target_group_name = var.target_group_name

  db_identifier         = var.db_identifier
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_instance_class     = var.db_instance_class
  db_engine_version     = var.db_engine_version
  db_allocated_storage  = var.db_allocated_storage
  db_backup_retention   = var.db_backup_retention
  db_multi_az           = var.db_multi_az
  db_deletion_protection = var.db_deletion_protection

  web_server = var.web_server
}
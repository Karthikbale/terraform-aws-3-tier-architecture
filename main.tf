module "vpc" {
  source = "./modules/vpc"

  project_name          = var.project_name
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  app_subnet_cidrs      = var.app_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  nat_gateway_count     = var.nat_gateway_count
}

module "security_groups" {
  source = "./modules/security-groups"

  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  application_port = var.application_port
  ssh_port         = var.ssh_port
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "alb" {
  source = "./modules/alb"

  project_name        = var.project_name
  alb_name            = var.alb_name
  target_group_name   = var.target_group_name
  public_subnet_ids   = module.vpc.public_subnet_ids
  alb_security_group  = module.security_groups.alb_security_group_id
  application_port    = var.application_port
  app_instance_ids    = module.ec2.instance_ids
}

module "ec2" {
  source = "./modules/ec2"

  project_name          = var.project_name
  instance_type         = var.instance_type
  ami_id                = var.ami_id
  key_pair_name         = var.key_pair_name
  instance_count        = var.app_instance_count
  app_subnet_ids        = module.vpc.app_subnet_ids
  security_group_id     = module.security_groups.app_security_group_id
  iam_instance_profile  = module.iam.instance_profile_name
  application_port      = var.application_port
  web_server            = var.web_server
}

module "rds" {
  source = "./modules/rds"

  project_name        = var.project_name
  db_identifier       = var.db_identifier
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
  db_instance_class   = var.db_instance_class
  db_engine_version   = var.db_engine_version
  allocated_storage   = var.db_allocated_storage
  backup_retention    = var.db_backup_retention
  multi_az            = var.db_multi_az
  deletion_protection = var.db_deletion_protection

  database_subnet_ids = module.vpc.database_subnet_ids
  security_group_id   = module.security_groups.database_security_group_id
}
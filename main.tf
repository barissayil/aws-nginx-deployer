provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source     = "./vpc"
  cidr_block = "10.0.0.0/16"
}

module "internet_gateway" {
  source = "./internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "subnet" {
  source     = "./subnet"
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.0.0.0/24"
}

module "route_table" {
  source = "./route_table"
  vpc_id = module.vpc.vpc_id
  igw_id = module.internet_gateway.igw_id
}

module "route_table_association" {
  source         = "./route_table_association"
  subnet_id      = module.subnet.subnet_id
  route_table_id = module.route_table.route_table_id
}

module "security_group" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
}

module "private_key" {
  source = "./private_key"
}

module "instance" {
  source                 = "./instance"
  subnet_id              = module.subnet.subnet_id
  vpc_security_group_ids = [module.security_group.sg_id]
  key_name               = module.private_key.key_name
  key_path               = module.private_key.key_path
}

output "public_ip" {
  value = module.instance.public_ip
}

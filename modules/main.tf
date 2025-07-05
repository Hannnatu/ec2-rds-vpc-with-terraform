provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr            = "10.0.0.0/16"
  azs                 = data.aws_availability_zones.available.names
  public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  private_app_subnets = ["10.0.11.0/24", "10.0.12.0/24"]
  private_db_subnets  = ["10.0.21.0/24", "10.0.22.0/24"]

  tags = {
    Name  = "jet"
    Env   = "dev"
    Owner = "hannatu"
  }
}

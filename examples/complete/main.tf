terraform {
  required_version = ">= 0.14"
}

provider "aws" {
  region = var.region
}

data "aws_vpc" "main" {
  default = true
}

data "aws_subnet_ids" "main" {
  vpc_id = data.aws_vpc.main.id
}

module "elasticache" {
  source = "../../"

  prefix               = var.name_prefix
  subnet_group_name    = var.name_prefix
  parameter_group_name = "default.redis6.x"
  engine               = "redis"
  num_cache_nodes      = 1
  az_mode              = "single-az"
  vpc_id               = data.aws_vpc.main.id
  subnet_ids           = data.aws_subnet_ids.main.ids

  tags = {
    environment = "dev"
    terraform   = "True"
  }
}

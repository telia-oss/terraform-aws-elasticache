terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = ">= 2.27"
  region  = var.region
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
  parameter_group_name = "default.redis5.0"
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

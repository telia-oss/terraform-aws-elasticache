terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = ">= 2.20"
  region  = "${var.region}"
}

data "aws_vpc" "main" {
  default = true
}

data "aws_subnet_ids" "main" {
  vpc_id = data.aws_vpc.main.id
}

module "elasticache" {
  source = "../../"

  prefix            = var.name_prefix
  subnet_group_name = var.name_prefix
  vpc_id            = data.aws_vpc.main.id
  subnet_ids        = data.aws_subnet_ids.main.ids

  tags = {
    environment = "dev"
    terraform   = "True"
  }
}

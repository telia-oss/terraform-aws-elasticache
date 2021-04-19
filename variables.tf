# Documentation
# https://www.terraform.io/docs/providers/aws/r/elasticache_cluster.html

variable "prefix" {
  description = "A prefix used for naming resources."
  type        = string
  default     = "main"
}

variable "subnet_group_name" {
  description = "Name for the elasticache subnet group."
  type        = string
  default     = "main"
}

variable "parameter_group_name" {
  description = "Name of the parameter group to associate with this cache cluster."
  type        = string
  default     = "default.memcached1.6"
}

variable "engine" {
  description = "Name of the cache engine to be used for this cache cluster. Valid values for this parameter are memcached or redis."
  type        = string
  default     = "memcached"
}

variable "node_type" {
  description = "The compute and memory capacity of the nodes."
  type        = string
  default     = "cache.t2.micro"
}

variable "num_cache_nodes" {
  description = "The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20."
  type        = number
  default     = 2
}

variable "az_mode" {
  description = "Weither to run in single-az or cross-az."
  type        = string
  default     = "cross-az"
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections."
  type        = number
  default     = 11211
}

variable "vpc_id" {
  description = "ID of the VPC for the subnets."
  type        = string
}

variable "subnet_ids" {
  description = "ID of subnets for the RDS subnet group."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags (key-value pairs) passed to resources."
  type        = map(string)
  default     = {}
}


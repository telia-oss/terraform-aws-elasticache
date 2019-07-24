# Documentation
# https://www.terraform.io/docs/providers/aws/r/elasticache_cluster.html

output "cache_nodes" {
  description = "List of node objects including id, address, port and availability_zone."
  value       = aws_elasticache_cluster.main.cache_nodes
}

output "configuration_endpoint" {
  description = "The configuration endpoint to allow host discovery. Only available for memcached."
  value       = var.engine == "memcached" ? aws_elasticache_cluster.main.configuration_endpoint : ""
}

output "cluster_address" {
  description = "The DNS name of the cache cluster without the port appended. Only available for memcached"
  value       = var.engine == "memcached" ? aws_elasticache_cluster.main.cluster_address : ""
}

output "security_group_id" {
  description = "The ID of the security group."
  value       = element(concat(aws_security_group.main.*.id, [""]), 0)
}


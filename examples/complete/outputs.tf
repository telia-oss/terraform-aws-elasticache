output "cache_nodes" {
  value = module.elasticache.cache_nodes
}

output "configuration_endpoint" {
  value = module.elasticache.configuration_endpoint
}

output "cluster_address" {
  value = module.elasticache.cluster_address
}

output "security_group_id" {
  value = module.elasticache.security_group_id
}

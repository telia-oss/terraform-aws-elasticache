# Documentation
# https://www.terraform.io/docs/providers/aws/r/elasticache_cluster.html

output "cache_nodes" {
  value = "${aws_elasticache_cluster.main.cache_nodes}"
}

output "configuration_endpoint" {
  value = "${aws_elasticache_cluster.main.configuration_endpoint}"
}

output "cluster_address" {
  value = "${aws_elasticache_cluster.main.cluster_address}"
}

output "security_group_id" {
  description = "The ID of the security group."
  value       = "${element(concat(aws_security_group.main.*.id, list("")), 0)}"
}

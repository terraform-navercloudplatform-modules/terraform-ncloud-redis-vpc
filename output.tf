output "id" {
  description = "Redis instance number."
  value       = ncloud_redis.redis.id
}

output "backup_schedule" {
  description = "Automatic or User-defined."
  value       = ncloud_redis.redis.backup_schedule
}

output "region_code" {
  description = "Region code."
  value       = ncloud_redis.redis.region_code
}

output "access_control_group_no_list" {
  description = "The ID list of the associated Access Control Group."
  value       = ncloud_redis.redis.access_control_group_no_list
}

output "redis_server_list" {
  description = <<EOF
The list of the Redis server.
- redis_server_instance_no: Redis Server instance number.
- redis_server_name: Redis Server name.
- redis_server_role: Stand Alone or Master or Slave.
- private_domain: Private domain.
- memory_size: Available memory size.
- os_memory_size: OS memory size.
- uptime: Running start time.
- create_date: Server create date.
EOF
  value       = ncloud_redis.redis.redis_server_list
}
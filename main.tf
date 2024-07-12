resource "ncloud_redis" "redis" {
  service_name                 = var.service_name
  server_name_prefix           = var.server_name_prefix
  user_name                    = var.user_name
  user_password                = var.user_password
  vpc_no                       = var.vpc_no
  subnet_no                    = var.subnet_no
  config_group_no              = var.config_group_no
  mode                         = var.mode
  image_product_code           = var.image_product_code
  product_code                 = var.product_code
  shard_count                  = var.shard_count
  shard_copy_count             = var.shard_copy_count
  is_ha                        = var.is_ha
  is_backup                    = var.is_backup
  backup_file_retention_period = var.backup_file_retention_period
  is_automatic_backup          = var.is_automatic_backup
  backup_time                  = var.backup_time
  port                         = var.port
}
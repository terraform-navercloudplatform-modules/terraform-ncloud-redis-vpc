variable "service_name" {
  description = "(Required) Service name to create. Enter the group name of the Redis server (e.g., NAVER-HOME). You cannot double-use the Redis service name. Only alphanumeric characters, numbers, hyphens (-), and Korean characters are allowed. Min: 3, Max: 15"
  type        = string
  validation {
    condition     = length(var.service_name) >= 3 && length(var.service_name) <= 15
    error_message = "The service name must be between 3 and 15 characters in length."
  }
  validation {
    condition     = can(regex("^[a-zA-Z0-9_]*$", var.user_name))
    error_message = "The user_name must only contain English letters, numbers, and underscores (_)."
  }
}

variable "server_name_prefix" {
  description = "(Required) Enter the name prefix of the Redis Server. The Redis server name is created with a 3-digit number, which is automatically created. You cannot double-use the Redis Server name. It must only contain English letters (lowercase), numbers, and hyphens (-). It must start with an English letter and end with an English letter or a number. Min: 3, Max: 15"
  type        = string
  validation {
    condition     = length(var.server_name_prefix) >= 3 && length(var.server_name_prefix) <= 15
    error_message = "The server name prefix must be between 3 and 15 characters in length."
  }
  validation {
    condition     = can(regex("^[a-zA-Z0-9_]*$", var.user_name))
    error_message = "The user_name must only contain English letters, numbers, and underscores (_)."
  }
}

variable "user_name" {
  description = "(Optional, Required if gov site) Redis User ID. Available only gov site. Only English alphabets, numbers and special characters ( _ , - ) are allowed and must start with an English alphabet. Min: 4, Max: 16"
  type        = string
  validation {
    condition     = length(var.user_name) >= 4 && length(var.user_name) <= 16
    error_message = "The user name must be between 4 and 16 characters in length."
  }
  validation {
    condition     = can(regex("^[a-zA-Z0-9_]*$", var.user_name))
    error_message = "The user_name must only contain English letters, numbers, and underscores (_)."
  }
  default = null
}

variable "user_password" {
  description = "(Optional, Required if gov site) Redis User Password. Available only gov site. At least one English alphabet, number and special character must be included. Min: 8, Max: 20"
  type        = string
  validation {
    condition     = length(var.user_password) >= 8 && length(var.user_password) <= 20
    error_message = "The user password must be between 8 and 20 characters in length."
  }
  validation {
    condition     = can(regex("^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[^A-Za-z0-9]).*$", var.user_password))
    error_message = "The user_password must have at least 1 English letter, 1 number, and 1 special character."
  }
  default = null
}

variable "vpc_no" {
  description = "(Required) VPC number. Determining the VPC in which the Cloud DB for Redis instance will be created."
  type        = string
}

variable "subnet_no" {
  description = "(Required) The ID of the associated Subnet. Subnet transfer is not possible after a Cloud DB for Redis instance has been created."
  type        = string
}

variable "config_group_no" {
  description = "(Required) Redis Config Group number. Config groups are provided, and one cluster group uses the same config. A new config group must be created if none exists. It can be changed online after creation."
  type        = string
}

variable "mode" {
  description = "(Required) Determines the configuration of Cloud DB for Redis. When the CLUSTER setting is used, the is_ha setting is ignored. Options: CLUSTER, SIMPLE."
  type        = string
  validation {
    condition     = can(regex("CLUSTER|SIMPLE", var.mode))
    error_message = "mode must be CLUSTER, or SIMPLE."
  }
}

variable "image_product_code" {
  description = "(Optional) Image product code to determine the Redis instance server image specification to create. If not entered, the instance is created for default value. It can be obtained through data.ncloud_redis_image_products."
  type        = string
  default     = null
}

variable "product_code" {
  description = "(Optional) Sets the server specifications of the Cloud DB for Redis instance to be created. It can be obtained through data.ncloud_redis_products. Default : Minimum specifications(1 memory, 2 cpu)"
  type        = string
  default     = null
}

variable "shard_count" {
  description = "(Optional) Number of shards to be created. 3 to 10 Number of master nodes. Necessary only if the mode is CLUSTER. Default: 3"
  type        = number
  default     = null
}

variable "shard_copy_count" {
  description = "(Optional) Replicas per shard Redis Cluster consists of the master node and slave node. A slave node is necessary for HA. When adding a replica, one slave node is assigned to each master node. For example, 3 shards, 1 replica per shard -> Master node: 3, Slave node: 3. You can enter 0 to 4 replica(s) for each shard. If the number of replicas per shard is set to 0, then high availability can't be supported. Necessary only if the mode is CLUSTER. Default: 0"
  type        = number
  default     = null
}

variable "is_ha" {
  description = "(Optional) Whether is High Availability or not. The Cloud DB for Redis product supports automatic failure recovery using the Standby master. When high availability is supported, additional charges are incurred and backup is automatically configured. Default: false"
  type        = bool
  default     = false
}

variable "is_backup" {
  description = "(Optional) Backup status. If the high availability status is_ha is true, then the backup setting status is fixed as true. Default : false"
  type        = bool
  default     = false
}

variable "backup_file_retention_period" {
  description = "(Optional) Backups are performed on a daily basis, and backup files are stored in a separate backup storage. Charges are based on the storage space used. Default: 1 (1 day)"
  type        = number
  default     = 1
}

variable "is_automatic_backup" {
  description = "(Optional) Select whether to have backup times set automatically. When the automatic backup is true, then any backup_time entered is ignored and the backup time is configured automatically."
  type        = bool
  default     = false
}

variable "backup_time" {
  description = "(Optional, Required if is_backup is true and is_automatic_backup is false) You can set the time when backup is performed. it must be entered if backup status(is_backup) is true and automatic backup status(is_automatic_backup) is false. EX) 01:15"
  type        = string
  default     = null
}

variable "port" {
  description = "Cloud Redis port. You need to enter the TCP port number of Redis access. Value range: 6379 or Min: 10000, Max: 20000. Default: 6379"
  type        = number
  default     = 6379
  validation {
    condition     = var.port >= 10000 && var.port <= 20000
    error_message = "The port must be 6379 or between 10000 and 20000."
  }
}
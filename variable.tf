variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}

variable "allowed_cidr_blocks" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "instance_class" {
  default = "db.t3.medium"
}

variable "allocated_storage" {
  default = 20
}

variable "db_name" {
  default = "mydatabase"
}

variable "db_username" {}
variable "db_password" {
  sensitive = true
}

variable "backup_retention_days" {
  default = 7
}

variable "project" {
  
}

variable "zone" {
  
}

variable "instance_name" {
  
}

variable "cluster_ipv4_cidr" {
  
}

variable "node_count" {
  default = 1
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "raw_image_sources" {
  
}

variable "rs" {
  default = "none"
}

variable "data_disk_gb" {
  default = "30"
}

variable "data_disk_type" {
  default = "pd-standard"
}

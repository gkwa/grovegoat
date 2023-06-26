variable "security_group_name_master" {
  type    = string
  default = "my-cluster-controlplane"
}

variable "security_group_name_cluster_node" {
  type    = string
  default = "my-cluster-node"
}


resource "aws_security_group" "master_sg" {
  name        = var.security_group_name_master
  description = "Security group for cluster control plane"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.security_group_name_master
  }
}

resource "aws_security_group" "my_cluster_node" {
  name        = var.security_group_name_cluster_node
  description = "Security group for cluster nodes"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.security_group_name_cluster_node
  }
}


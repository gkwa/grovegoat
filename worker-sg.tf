data "aws_security_group" "my_cluster_node" {
  name = var.security_group_name_cluster_node
}

resource "aws_security_group_rule" "vxlan_overlay_worker" {
  description              = "VXLAN overlay / cilium / master"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "ingress"
  from_port                = 8472
  to_port                  = 8472
  protocol                 = "udp"
  source_security_group_id = data.aws_security_group.master_sg.id
}

resource "aws_security_group_rule" "vxlan_overlay_worker1" {
  description              = "VXLAN overlay / cilium / self"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "ingress"
  from_port                = 8472
  to_port                  = 8472
  protocol                 = "udp"
  source_security_group_id = data.aws_security_group.my_cluster_node.id
}

resource "aws_security_group_rule" "health_checks_master" {
  description              = "health checks / cilium / master"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "ingress"
  from_port                = 4240
  to_port                  = 4240
  protocol                 = "tcp"
  source_security_group_id = data.aws_security_group.master_sg.id
}

resource "aws_security_group_rule" "health_checks_worker" {
  description              = "health checks / cilium / self"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "ingress"
  from_port                = 4240
  to_port                  = 4240
  protocol                 = "tcp"
  source_security_group_id = data.aws_security_group.my_cluster_node.id
}

resource "aws_security_group_rule" "icmp_health_checks_master" {
  description              = "health checks / cilium / master"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "ingress"
  from_port                = 8
  to_port                  = 0
  protocol                 = "icmp"
  source_security_group_id = data.aws_security_group.master_sg.id
}

resource "aws_security_group_rule" "icmp_health_checks_worker" {
  description              = "health checks / cilium / self"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "ingress"
  from_port                = 8
  to_port                  = 0
  protocol                 = "icmp"
  source_security_group_id = data.aws_security_group.my_cluster_node.id
}

resource "aws_security_group_rule" "vxlan_overlay_egress_master1" {
  description              = "VXLAN overlay / cilium / master"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "egress"
  from_port                = 8472
  to_port                  = 8472
  protocol                 = "udp"
  source_security_group_id = data.aws_security_group.master_sg.id
}

resource "aws_security_group_rule" "vxlan_overlay_egress_worker1" {
  description              = "VXLAN overlay / cilium / self"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "egress"
  from_port                = 8472
  to_port                  = 8472
  protocol                 = "udp"
  source_security_group_id = data.aws_security_group.my_cluster_node.id
}

resource "aws_security_group_rule" "health_checks_egress_master1" {
  description              = "health checks / cilium / master"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "egress"
  from_port                = 4240
  to_port                  = 4240
  protocol                 = "tcp"
  source_security_group_id = data.aws_security_group.master_sg.id
}

resource "aws_security_group_rule" "health_checks_egress_worker1" {
  description              = "health checks / cilium / self"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "egress"
  from_port                = 4240
  to_port                  = 4240
  protocol                 = "tcp"
  source_security_group_id = data.aws_security_group.my_cluster_node.id
}

resource "aws_security_group_rule" "icmp_health_checks_egress_master1" {
  description              = "health checks / cilium / master"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "egress"
  from_port                = 8
  to_port                  = 0
  protocol                 = "icmp"
  source_security_group_id = data.aws_security_group.master_sg.id
}

resource "aws_security_group_rule" "icmp_health_checks_egress_worker1" {
  description              = "health checks / cilium / self"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "egress"
  from_port                = 8
  to_port                  = 0
  protocol                 = "icmp"
  source_security_group_id = data.aws_security_group.my_cluster_node.id
}

resource "aws_security_group_rule" "etcd_access_master" {
  description              = "etcd access / cilium / master"
  security_group_id        = data.aws_security_group.my_cluster_node.id
  type                     = "egress"
  from_port                = 2379
  to_port                  = 2380
  protocol                 = "tcp"
  source_security_group_id = data.aws_security_group.master_sg.id
}


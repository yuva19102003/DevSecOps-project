

resource "aws_iam_role" "eks" {
  name = "${local.env}-${local.eks_name}-eks-cluster"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks.name
}

resource "aws_eks_cluster" "eks" {
  name     = "${local.env}-${local.eks_name}"
  version  = local.eks_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.private_zone1.id,
      aws_subnet.private_zone2.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.eks]
}


# Define CoreDNS addon
resource "aws_eks_addon" "coredns" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "coredns"
  addon_version = "${local.coredns-version}"
}

# Define kube-proxy addon
resource "aws_eks_addon" "kube_proxy" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "kube-proxy"
  addon_version = "${local.kube_proxy-version}"
}

# Define Amazon VPC CNI addon
resource "aws_eks_addon" "vpc_cni" {
  cluster_name = aws_eks_cluster.eks.name
  addon_name   = "vpc-cni"
  addon_version = "${local.vpc_cni-version}"
}

resource "aws_security_group_rule" "allow_web" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}

resource "aws_security_group_rule" "allow_web_node_port" {
  type              = "ingress"
  from_port         = 30010
  to_port           = 30010
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_eks_cluster.eks.vpc_config[0].cluster_security_group_id
}
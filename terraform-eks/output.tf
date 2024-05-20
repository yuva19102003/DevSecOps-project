

output "eks_init" {
  value       = "aws eks update-kubeconfig --name ${aws_eks_cluster.eks.name} --region ${local.region}"
  description = "Run the following command to connect to the EKS cluster."
}
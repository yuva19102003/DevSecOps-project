


locals {
  env         = "DevSecOps"

  region      = "us-east-1"
  zone1       = "us-east-1a"
  zone2       = "us-east-1b"

  eks_name    = "microservices"
  eks_version = "1.29"

  coredns-version = "v1.11.1-eksbuild.9"
  kube_proxy-version = "v1.29.3-eksbuild.2"
  vpc_cni-version = "v1.18.1-eksbuild.1"

  type = "ON_DEMAND"
  instance = "t3.medium"

  desired = "6"
  min = "4"
  max = "7"
}
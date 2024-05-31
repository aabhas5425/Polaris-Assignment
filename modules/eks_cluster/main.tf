module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name    = "Demo"
  cluster_version = "1.26"
  subnets         = module.vpc.private_subnet_ids
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 4
      min_capacity     = 1
      instance_type = "t3.medium"
    }
  }
}

output "cluster_id" {
  value = module.eks.cluster_id
}

cluster_endpoint_private_access = true
cluster_endpoint_public_access  = false

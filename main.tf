terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Dummy/placeholder variables để pass validation
locals {
  cluster_name = "dummy-cluster"
  vpc_id       = "vpc-dummy123"
  subnet_ids   = ["subnet-dummy1", "subnet-dummy2"]
}

# 1. eks-windows (1954 downloads)
module "eks_windows" {
  source  = "aws-terraform-module/eks-windows/aws"
  version = "~> 4.3"
  
    # Không tạo resource thực, chỉ download module
}

# 2. rabbitmq (1587 downloads)
module "rabbitmq" {
  source  = "aws-terraform-module/rabbitmq/aws"
  version = "~> 1.4"
  
  vpc_id     = local.vpc_id
  subnet_ids = local.subnet_ids
  
  
}

# 3. elasticache (1332 downloads)
module "elasticache" {
  source  = "aws-terraform-module/elasticache/aws"
  version = "~> 2.3"
  
  
}

# 4. msk-cluster (1294 downloads)
module "msk_cluster" {
  source  = "aws-terraform-module/msk-cluster/aws"
  version = "~> 1.0"
  
  cluster_name = local.cluster_name
  vpc_id       = local.vpc_id
  subnet_ids   = local.subnet_ids
  
  
}

# 5. documentdb-mongodb (1288 downloads)
module "documentdb_mongodb" {
  source  = "aws-terraform-module/documentdb-mongodb/aws"
  version = "~> 1.4"
  
  
}

# 6. eks-alb-ingress (1241 downloads)
module "eks_alb_ingress" {
  source  = "aws-terraform-module/eks-alb-ingress/aws"
  version = "~> 1.4"
  
  
}

# 7. eks-ebs-csi (1198 downloads)
module "eks_ebs_csi" {
  source  = "aws-terraform-module/eks-ebs-csi/aws"
  version = "~> 2.2"
  
  
}

# 8. eks-efs-csi-driver (1145 downloads)
module "eks_efs_csi_driver" {
  source  = "aws-terraform-module/eks-efs-csi-driver/aws"
  version = "~> 1.0"
  
  
}

# 9. eks-fsx-lustre-csi (1141 downloads)
module "eks_fsx_lustre_csi" {
  source  = "aws-terraform-module/eks-fsx-lustre-csi/aws"
  version = "~> 1.0"
  
  cluster_name              = local.cluster_name
  cluster_oidc_issuer_url   = "https://dummy-oidc.example.com"
  fsx_file_system_id        = "fs-dummy123"
  fsx_file_system_dns_name  = "dummy.fsx.us-east-1.amazonaws.com"
  fsx_mount_name            = "dummy-mount"
  
  
}

# 10. eks-efs-storageclass (1140 downloads)
module "eks_efs_storageclass" {
  source  = "aws-terraform-module/eks-efs-storageclass/aws"
  version = "~> 1.1"
  
  
}

# 11. eks-irsa (1104 downloads)
module "eks_irsa" {
  source  = "aws-terraform-module/eks-irsa/aws"
  version = "~> 1.2"
  
  oidc_provider_arn = "arn:aws:iam::123456789012:oidc-provider/dummy"
  
  
}

# 12. eks-s3-mount-point (986 downloads)
module "eks_s3_mount_point" {
  source  = "aws-terraform-module/eks-s3-mount-point/aws"
  version = "~> 1.0"
  
  cluster_name            = local.cluster_name
  cluster_oidc_issuer_url = "https://dummy-oidc.example.com"
  s3_bucket_name          = "dummy-bucket"
  
  
}

# 13. eks-cluster-autoscaler (925 downloads)
module "eks_cluster_autoscaler" {
  source  = "aws-terraform-module/eks-cluster-autoscaler/aws"
  version = "~> 1.2"
  
  
}

# 14. vpc-endpoint-gateway (461 downloads)
module "vpc_endpoint_gateway" {
  source  = "aws-terraform-module/vpc-endpoint-gateway/aws"
  version = "~> 1.1"
  
  vpc_id            = local.vpc_id
  route_table_ids   = ["rtb-dummy123"]
  
  
}

# 15. argo-workflow-eks (22 downloads)
module "argo_workflow_eks" {
  source  = "aws-terraform-module/argo-workflow-eks/aws"
  version = "~> 1.0"
  
  
}

# 16. elasticache-secondary-on-global-datastore (11 downloads)
module "elasticache_secondary_on_global_datastore" {
  source  = "aws-terraform-module/elasticache-secondary-on-global-datastore/aws"
  version = "~> 1.0"
  
  
}

# 17. fsx-for-windows (7 downloads)
module "fsx_for_windows" {
  source  = "aws-terraform-module/fsx-for-windows/aws"
  version = "~> 0.1"
  
  
}

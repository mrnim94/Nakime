terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # Không cần credentials cho terraform init
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
}

# Tất cả 17 modules từ aws-terraform-module namespace
# Mục đích: tăng download count cho các modules

module "eks_windows" {
  source  = "aws-terraform-module/eks-windows/aws"
  version = "~> 4.3"
}

module "rabbitmq" {
  source  = "aws-terraform-module/rabbitmq/aws"
  version = "~> 1.4"
}

module "elasticache" {
  source  = "aws-terraform-module/elasticache/aws"
  version = "~> 2.3"
}

module "msk_cluster" {
  source  = "aws-terraform-module/msk-cluster/aws"
  version = "~> 1.0"
}

module "documentdb_mongodb" {
  source  = "aws-terraform-module/documentdb-mongodb/aws"
  version = "~> 1.4"
}

module "eks_alb_ingress" {
  source  = "aws-terraform-module/eks-alb-ingress/aws"
  version = "~> 1.4"
}

module "eks_ebs_csi" {
  source  = "aws-terraform-module/eks-ebs-csi/aws"
  version = "~> 2.2"
}

module "eks_efs_csi_driver" {
  source  = "aws-terraform-module/eks-efs-csi-driver/aws"
  version = "~> 1.0"
}

module "eks_fsx_lustre_csi" {
  source  = "aws-terraform-module/eks-fsx-lustre-csi/aws"
  version = "~> 1.0"
}

module "eks_efs_storageclass" {
  source  = "aws-terraform-module/eks-efs-storageclass/aws"
  version = "~> 1.1"
}

module "eks_irsa" {
  source  = "aws-terraform-module/eks-irsa/aws"
  version = "~> 1.2"
}

module "eks_s3_mount_point" {
  source  = "aws-terraform-module/eks-s3-mount-point/aws"
  version = "~> 1.0"
}

module "eks_cluster_autoscaler" {
  source  = "aws-terraform-module/eks-cluster-autoscaler/aws"
  version = "~> 1.2"
}

module "vpc_endpoint_gateway" {
  source  = "aws-terraform-module/vpc-endpoint-gateway/aws"
  version = "~> 1.1"
}

module "argo_workflow_eks" {
  source  = "aws-terraform-module/argo-workflow-eks/aws"
  version = "~> 1.0"
}

module "elasticache_secondary_on_global_datastore" {
  source  = "aws-terraform-module/elasticache-secondary-on-global-datastore/aws"
  version = "~> 1.0"
}

module "fsx_for_windows" {
  source  = "aws-terraform-module/fsx-for-windows/aws"
  version = "~> 0.1"
}

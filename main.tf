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

# Example: Sử dụng các module từ aws-terraform-module namespace
# Các module này sẽ được pull về khi chạy terraform init

module "vpc_example" {
  source  = "aws-terraform-module/vpc/aws"
  version = "~> 1.0"
  
  # Placeholder config - không thực sự apply
  name = "example-vpc"
  cidr = "10.0.0.0/16"
}

module "ec2_instance_example" {
  source  = "aws-terraform-module/ec2-instance/aws"
  version = "~> 1.0"
  
  # Placeholder config
  name          = "example-instance"
  instance_type = "t3.micro"
}

module "s3_bucket_example" {
  source  = "aws-terraform-module/s3-bucket/aws"
  version = "~> 1.0"
  
  # Placeholder config
  bucket_name = "example-bucket-nakime"
}

# Thêm các module khác từ aws-terraform-module namespace tại đây
# Mục đích: terraform init sẽ pull tất cả modules về .terraform/modules/

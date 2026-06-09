# Nakime - AWS Terraform Modules Cache

Repo này tự động pull các Terraform modules từ [aws-terraform-module](https://registry.terraform.io/namespaces/aws-terraform-module) namespace mỗi 30 phút.

## 🎯 Mục đích

- Cache terraform modules từ aws-terraform-module namespace
- Chạy `terraform init` định kỳ để cập nhật modules
- Sử dụng GitHub Actions cache để tăng tốc độ pull

## 🚀 Cách hoạt động

GitHub Actions workflow chạy mỗi 30 phút:
1. Checkout code
2. Setup Terraform
3. Chạy `terraform init` → pull tất cả modules trong `main.tf`
4. Cache modules vào GitHub Actions cache
5. Report kết quả

## 📝 Thêm modules mới

Edit file `main.tf`, thêm module block:

```hcl
module "example" {
  source  = "aws-terraform-module/<module-name>/aws"
  version = "~> 1.0"
  
  # Placeholder config (không cần chính xác, chỉ cần để terraform init pull về)
}
```

## ⚙️ Manual trigger

Vào tab **Actions** → chọn workflow → click **Run workflow**

## 📊 Xem kết quả

Check Actions logs để thấy:
- Modules đã được pull về
- Kích thước cache
- Terraform version

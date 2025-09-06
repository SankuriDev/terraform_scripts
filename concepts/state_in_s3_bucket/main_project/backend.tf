terraform {
  backend "s3" {
    bucket         = "terraform-state-naveen-20250905"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

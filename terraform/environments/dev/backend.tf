terraform {
  backend "s3" {
    bucket         = "june12-terraform-state-arunkumar"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "june12-terraform-lock"
    encrypt        = true
  }
}

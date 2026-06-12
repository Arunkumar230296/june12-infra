resource "aws_s3_bucket" "terraform_state" {
  bucket = "june12-terraform-state-arunkumar"

  tags = {
    Name    = "june12-terraform-state"
    Project = "june12"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "june12-terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name    = "june12-terraform-lock"
    Project = "june12"
  }
}

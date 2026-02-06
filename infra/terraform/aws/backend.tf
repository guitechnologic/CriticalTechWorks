terraform {
  backend "s3" {
    bucket         = "ctw-terraform-state"
    key            = "aws/main/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "ctw-terraform-locks"
    encrypt        = true
  }
}

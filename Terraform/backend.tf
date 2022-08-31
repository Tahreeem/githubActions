terraform {
  backend "s3" {
    bucket = "terraform-practice-tahreem"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
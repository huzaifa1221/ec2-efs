terraform {
  backend "s3" {
    bucket = "terraform-tfstate-local"
    key    = "tfstate"
    region = "us-east-1"
  }
}

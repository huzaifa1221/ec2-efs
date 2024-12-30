terraform {
  backend "s3" {
    bucket = "<BUCKET_NAME>"
    key    = "tfstate"
    region = "us-east-1"
  }
}

terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "pharos-terraform-state-demo"
    key    = "terraform.tfstate"
  }
}

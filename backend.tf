terraform {
  backend "s3" {
    bucket       = "terraform-3tier-state-karthik"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
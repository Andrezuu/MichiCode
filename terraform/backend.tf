terraform {
  backend "s3" {
    bucket         = "tfstate-michicode-devops" 
    key            = "michicode/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "michicode-lock-table" 
    encrypt        = true
  }
}
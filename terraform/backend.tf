terraform {
  backend "s3" {
    bucket         = "tfstate-michicode-devops" # Requerido por el reto
    key            = "michicode/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "michicode-lock-table" # Para manejo de bloqueos
    encrypt        = true
  }
}
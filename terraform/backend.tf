terraform {
  backend "s3" {
    bucket         = "tfstate-tu-nombre-devops" # Requerido por el reto
    key            = "environments/dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-lock-table" # Para manejo de bloqueos
    encrypt        = true
  }
}
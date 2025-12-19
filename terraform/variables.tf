variable "aws_region" {
  description = "Región de AWS"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "Tipo de instancia para capa gratuita"
  default     = "t3.micro"
}

variable "key_name" {
  description = "clave SSH"
  default        = string
}
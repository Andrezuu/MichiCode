variable "aws_region" {
  description = "Región de AWS"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "Tipo de instancia para capa gratuita"
  default     = "t3.micro"
}

#michicode-key.pem
variable "key_name" {
  type        = string
}
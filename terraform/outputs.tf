output "instance_public_ip" {
  description = "IP pública de la instancia para el despliegue"
  value       = aws_instance.michicode_server.public_ip
}
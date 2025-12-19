output "instance_public_ip" {
  description = "IP pública de la instancia EC2"
  value       = aws_eip.casa_cambios_eip.public_ip
}

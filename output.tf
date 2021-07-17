output "id" {
  value       = digitalocean_droplet.main.*.id
  description = "ID of droplet"
}

output "urn" {
  value       = digitalocean_droplet.main.*.urn
  description = "uniform resource name of droplet"
}

output "name" {
  value       = digitalocean_droplet.main.*.name
  description = "name of droplet"
}


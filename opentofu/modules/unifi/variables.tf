variable "unifi_api_url" {
  type        = string
  description = "Base URL for the UniFi Network integration API."
}

variable "unifi_api_key" {
  type        = string
  sensitive   = true
  description = "UniFi Network integration API key."
}

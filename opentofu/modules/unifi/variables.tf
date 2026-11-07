variable "unifi_api_url" {
  type        = string
  description = "UDR7 Integration API base URL, for example https://192.168.1.1/proxy/network/integration. The provider appends /integration only when it is missing, so the /proxy/network path is required for local consoles."

  validation {
    condition = (
      can(regex("^https://", var.unifi_api_url)) &&
      (
        can(regex("/proxy/network(/integration)?$", var.unifi_api_url)) ||
        can(regex("/v1/connector/consoles/[^/]+/network(/integration)?$", var.unifi_api_url))
      )
    )
    error_message = "unifi_api_url must be an https URL ending in /proxy/network or /proxy/network/integration for a local console, or a UniFi Site Manager cloud connector URL."
  }
}

variable "unifi_api_key" {
  type        = string
  sensitive   = true
  description = "UniFi Network integration API key created under Settings -> Control Plane -> Integrations."
}

variable "unifi_site_name" {
  type        = string
  default     = "Default"
  description = "Name of the UniFi site to manage."
}

variable "unifi_allow_insecure" {
  type        = bool
  default     = true
  description = "Skip TLS verification. The UDR7 serves a self-signed certificate on its LAN address, so this defaults to true. Set to false when using a trusted certificate."
}

variable "unifi_request_timeout_seconds" {
  type        = number
  default     = 30
  description = "Per-request HTTP timeout in seconds. Raise this (for example to 300) when UniFi reprovisions devices mid-apply and requests time out."
}

variable "unifi_wifi_passphrase_fbi_van_3" {
  type        = string
  sensitive   = true
  description = "Passphrase for the 'FBI Surveillence Van #3' WiFi broadcast."
}

variable "unifi_wifi_passphrase_fbi_van_4" {
  type        = string
  sensitive   = true
  description = "Passphrase for the 'FBI Surveillance Van #4' WiFi broadcast."
}

variable "unifi_wifi_passphrase_onlylans" {
  type        = string
  sensitive   = true
  description = "Passphrase for the 'OnlyLANs' WiFi broadcast."
}

variable "unifi_wifi_passphrase_tell_my_wifi_love_her" {
  type        = string
  sensitive   = true
  description = "Passphrase for the 'Tell_my_WiFi_love_her' WiFi broadcast."
}

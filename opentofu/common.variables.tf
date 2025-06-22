variable "domain_name" {
	type = string
	sensitive = false
	description = "Registered domain name to use for hosts, services, proxies, etc."
}
variable "ipv4_lan_prefix" {
	type = string
	sensitive = true
	description = "Subnet in IPv4 space. X-es in X.X.X.y address space."
}
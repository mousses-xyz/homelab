variable "domain_name" {
	type = string
	sensitive = false
	description = "Registered domain name to use for hosts, services, proxies, etc."
}
variable "lan_ipv4_prefix" {
	type = string
	sensitive = true
	description = "Subnet in IPv4 space. X-es in X.X.X.y address space."
}
variable "lab_ipv4_address" {
	type = string
	sensitive = true
	description = "Public IPv4 address of lab"
}
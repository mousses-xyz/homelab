resource "cloudflare_zero_trust_tunnel_cloudflared" "homelab_zero_trust_tunnel_cloudflared" {
	account_id = var.cloudflare_account_id
	name = var.cloudflare_tunnel_name
	config_src = "cloudflare"
	tunnel_secret = var.cloudflare_tunnel_secret
}
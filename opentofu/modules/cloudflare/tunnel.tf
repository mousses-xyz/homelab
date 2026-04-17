# Cloudflare tunnel configuration
resource "random_string" "tunnel_secret" {
	length = 32
	special = false
}
# resource "cloudflare_zero_trust_tunnel_cloudflared" "cloudflare_tunnel_homelab" {
# 	account_id = var.cloudflare_account_id
# 	name = var.cloudflare_tunnel_name
# 	config_src = "cloudflare"
# 	tunnel_secret = base64sha256(random_string.tunnel_secret.result) # var.cloudflare_tunnel_secret
# }
resource "cloudflare_zero_trust_tunnel_cloudflared_config" "cloudflare_tunnel_homelab_config" {
	account_id = var.cloudflare_account_id
	tunnel_id = var.cloudflare_tunnel_id# cloudflare_zero_trust_tunnel_cloudflared.cloudflare_tunnel_homelab.id # var.cloudflare_tunnel_id
	config = {
		ingress = [
			{
				hostname = "nas.${var.domain_name}"
				service = "http://nas.${var.domain_name}:5100"
				origin_request = {
					access = {
						aud_tag = [cloudflare_zero_trust_access_application.cloudflare_access_application_nas.aud]
						team_name = var.cloudflare_access_team_name
						required = true
					}
				}
			},
			{
				hostname = "wiki.${var.domain_name}"
				service = "http://nas.${var.domain_name}:8383"
				origin_request = {
					access = {
						aud_tag = [cloudflare_zero_trust_access_application.cloudflare_access_application_wiki.aud]
						team_name = var.cloudflare_access_team_name
					}
				}
			},
			{
				hostname = "map.${var.domain_name}"
				service = "http://minecraft.${var.domain_name}:8080"
				origin_request = {
					access = {
						aud_tag = [cloudflare_zero_trust_access_application.cloudflare_access_application_minecraft_map.aud]
						team_name = var.cloudflare_access_team_name
					}
				}
			},
			{
				hostname = "jellyfin.${var.domain_name}"
				service = "https://jellyfin.omv.${var.domain_name}"
				origin_request = {
					no_tls_verify = true
					http_host_header = "jellyfin.omv.${var.domain_name}"
					access = {
						aud_tag = [cloudflare_zero_trust_access_application.cloudflare_access_application_jellyfin.aud]
						team_name = var.cloudflare_access_team_name
					}
				}
			},
			{
				hostname = "homeassistant.${var.domain_name}"
				service = "http://homeassistant.${var.domain_name}:8123"
				origin_request = {
					access = {
						aud_tag = [cloudflare_zero_trust_access_application.cloudflare_access_application_homeassistant.aud]
						team_name = var.cloudflare_access_team_name
					}
				}
			},
			{
				service = "http_status:404"
			}
		]
	}
}

# Access policies defined here. Rule groups containing the acrual emails are defined on Cloudflare dashboard
resource "cloudflare_zero_trust_access_policy" "cloudflare_family_access_policy" {
	account_id = var.cloudflare_account_id
	decision = "allow"
	name = "family_tofu"
	session_duration = "24h"
	approval_required = false
	purpose_justification_required = false
	include = [{
		group = {
			id = var.cloudflare_access_family_group_id
		}
	}]
}
resource "cloudflare_zero_trust_access_policy" "cloudflare_semi_open_access_policy" {
	account_id = var.cloudflare_account_id
	decision = "allow"
	name = "semi_open_tofu"
	session_duration = "24h"
	approval_required = false
	purpose_justification_required = false
	include = [{
		group = {
			id = var.cloudflare_access_semi_open_group_id
		}
	}]
}

# Access applications defined here. These are required for the tunnel config
resource "cloudflare_zero_trust_access_application" "cloudflare_access_application_nas" {
    zone_id = var.cloudflare_zone_id
    name = "nas"
    domain = "nas.${var.domain_name}"
    type = "self_hosted"
    session_duration = "24h"
    destinations = [{
        type = "public"
        uri = "nas.${var.domain_name}"
    }]
    policies = [
        {
            id = cloudflare_zero_trust_access_policy.cloudflare_family_access_policy.id
        },
    ]
    allow_authenticate_via_warp = false
    allow_iframe = true
    app_launcher_visible = true
    enable_binding_cookie = true
    http_only_cookie_attribute = true
    skip_interstitial = true
    read_service_tokens_from_header = "Authorization"
    same_site_cookie_attribute = "strict"
	allowed_idps = []
	options_preflight_bypass = false
    # logo_url = "https://www.cloudflare.com/img/logo-web-badges/cf-logo-on-white-bg.svg"
}
resource "cloudflare_zero_trust_access_application" "cloudflare_access_application_wiki" {
	zone_id = var.cloudflare_zone_id
	name = "wiki"
	domain = "wiki.${var.domain_name}"
	type = "self_hosted"
	session_duration = "24h"
	destinations = [{
		type = "public"
		uri = "wiki.${var.domain_name}"
	}]
	policies = [
		{
			id = cloudflare_zero_trust_access_policy.cloudflare_family_access_policy.id
		},
		{
			id = cloudflare_zero_trust_access_policy.cloudflare_semi_open_access_policy.id
		},
	]
	allow_authenticate_via_warp = false
	allow_iframe = true
	app_launcher_visible = true
	enable_binding_cookie = true
	http_only_cookie_attribute = true
	skip_interstitial = true
	read_service_tokens_from_header = "Authorization"
	same_site_cookie_attribute = "strict"
	allowed_idps = []
	options_preflight_bypass = false
	# logo_url = "https://www.cloudflare.com/img/logo-web-badges/cf-logo-on-white-bg.svg"
}
resource "cloudflare_zero_trust_access_application" "cloudflare_access_application_minecraft_map" {
	zone_id = var.cloudflare_zone_id
	name = "minecraft_map"
	domain = "map.${var.domain_name}"
	type = "self_hosted"
	session_duration = "24h"
	destinations = [{
		type = "public"
		uri = "map.${var.domain_name}"
	}]
	policies = [
		{
			id = cloudflare_zero_trust_access_policy.cloudflare_family_access_policy.id
		},
		{
			id = cloudflare_zero_trust_access_policy.cloudflare_semi_open_access_policy.id
		},
	]
	allow_authenticate_via_warp = false
	allow_iframe = true
	app_launcher_visible = true
	enable_binding_cookie = true
	http_only_cookie_attribute = true
	skip_interstitial = true
	read_service_tokens_from_header = "Authorization"
	same_site_cookie_attribute = "strict"
	allowed_idps = []
	options_preflight_bypass = false
	logo_url = "https://raw.githubusercontent.com/homarr-labs/dashboard-icons/92e341c1c681d3fcdbdebcf14fad670dba5e52d6/svg/minecraft.svg"
	# logo_url = "https://www.cloudflare.com/img/logo-web-badges/cf-logo-on-white-bg.svg"
}
resource "cloudflare_zero_trust_access_application" "cloudflare_access_application_jellyfin" {
	zone_id = var.cloudflare_zone_id
	name = "jellyfin"
	domain = "jellyfin.${var.domain_name}"
	type = "self_hosted"
	session_duration = "24h"
	destinations = [{
		type = "public"
		uri = "jellyfin.${var.domain_name}"
	}]
	policies = [
		{
			id = cloudflare_zero_trust_access_policy.cloudflare_family_access_policy.id
		},
	]
	allow_authenticate_via_warp = false
	allow_iframe = true
	app_launcher_visible = true
	enable_binding_cookie = true
	http_only_cookie_attribute = true
	skip_interstitial = true
	read_service_tokens_from_header = "Authorization"
	same_site_cookie_attribute = "strict"
	allowed_idps = []
	options_preflight_bypass = false
}
resource "cloudflare_zero_trust_access_application" "cloudflare_access_application_homeassistant" {
	zone_id = var.cloudflare_zone_id
	name = "homeassistant"
	domain = "homeassistant.${var.domain_name}"
	type = "self_hosted"
	session_duration = "24h"
	destinations = [{
		type = "public"
		uri = "homeassistant.${var.domain_name}"
	}]
	policies = [
		{
			id = cloudflare_zero_trust_access_policy.cloudflare_family_access_policy.id
		}
	]
	allow_authenticate_via_warp = false
	allow_iframe = true
	app_launcher_visible = true
	enable_binding_cookie = true
	http_only_cookie_attribute = true
	skip_interstitial = true
	read_service_tokens_from_header = "Authorization"
	same_site_cookie_attribute = "strict"
	allowed_idps = []
	options_preflight_bypass = false
	# logo_url = "https://www.cloudflare.com/img/logo-web-badges/cf-logo-on-white-bg.svg"
}
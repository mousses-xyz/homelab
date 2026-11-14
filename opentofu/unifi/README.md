# UniFi UDR7 (Terragrunt unit)

Manages UniFi Network configuration on the UDR7 through the
[BadgerOps/unifi](https://registry.terraform.io/providers/BadgerOps/unifi/latest/docs)
provider and Ubiquiti's Integration API.

## One-time UDR7 setup

1. Open the UniFi Network UI on the UDR7.
2. Go to **Settings -> Control Plane -> Integrations**.
3. Enable the Integration API and create an API key.
4. Note the UDR7's LAN address, for example `https://192.168.1.1`.

## Configure credentials

```bash
cp ../modules/unifi/auto.tfvars.example ../modules/unifi/auto.tfvars
$EDITOR ../modules/unifi/auto.tfvars
```

`auto.tfvars` is gitignored. Set `unifi_api_url` to the UDR7's Integration API
base, for example `https://192.168.1.1/proxy/network/integration` (the
`/proxy/network` path is required for local consoles), and `unifi_api_key` to
the key created above.

## Run

From this directory:

```bash
terragrunt init
terragrunt plan
```

## Managed resources

The unit currently manages:

- 3 user-defined networks: `IoT`, `Guest`, `AI`
- 4 WiFi broadcasts
- 7 user-defined firewall policies and their ordering
- 24 DNS policies (A records for static-IPv4 devices not already in built-in local DNS, plus A/AAAA for Bluesky)
- 7 traffic matching lists
- 2 port forwards (Minecraft Java and Bedrock)
- 18 DHCP reservations (MAC → fixed IP)

The default `LAN` network and all six built-in firewall zones are referenced
through data sources instead of being managed. `LAN` is system-defined and the
provider cannot round-trip its `dhcp_guarding` field, which otherwise causes a
perpetual diff that cascades into firewall policies referencing it. Built-in
firewall zones are locked by UniFi and must not be managed as resources.

The `Bluesky` port forward is intentionally unmanaged: it uses
`pfwd_interface = "all"`, which this provider version cannot represent (it
accepts only `wan`, `wan2`, or `both`).

## LAN IPv6

The `BadgerOps/unifi` provider does not expose LAN IPv6 settings, so the
default `LAN` network is configured once in the UniFi UI (or through the
legacy Network API):

- **Interface Type:** Prefix Delegation
- **Prefix Delegation Interface:** WAN
- **Prefix ID:** `1`
- **Additional IPs:** `fd00:beef:cafe:1::1/64` (keeps the ULA prefix alive)
- **Client Address Assignment:** SLAAC
- **Router Advertisement:** enabled, priority high

The delegated prefix is dynamic. The `Bluesky IPv6` firewall policy matches the
PDS by its interface identifier (`be24:11ff:febb:f8d5`), so it survives prefix
changes. Cloudflare AAAA records cannot follow the prefix automatically because
DDNS is intentionally not configured: update `bluesky_public_ipv6` in
`../auto.tfvars` and re-apply the `cloudflare` unit when the delegated prefix
changes.

State is stored in S3 at
`s3://peter-mousses-homelab-tf-state/unifi/terraform.tfstate`.

## Notes

- WiFi passphrases are supplied from `auto.tfvars` via the
  `unifi_wifi_passphrase_*` variables. They are stored in OpenTofu state, so the
  S3 bucket is encrypted and access-controlled.
- `unifi_allow_insecure` defaults to `true` because the UDR7 presents a
  self-signed certificate on its LAN address.
- If the console stops answering during an apply, raise
  `unifi_request_timeout_seconds` (for example to `300`).
- The provider does not read `UNIFI_API_URL` / `UNIFI_API_KEY` from the
  environment; values must come from `auto.tfvars`.

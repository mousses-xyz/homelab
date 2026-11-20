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
- 6 user-defined firewall policies and 2 orderings
- 35 DNS policies (A/AAAA records for static-IPv4 and manually-defined names)
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

The delegated prefix is dynamic. The PDS runs in k3s behind Traefik and uses the
public IPv4 `A` record; its public and local AAAA records were removed during
that migration. Minecraft's public AAAA records were also removed, but its local
AAAA records remain for LAN IPv6 clients. The legacy `Bluesky IPv6` firewall
policy and its External → Internal ordering were removed.

Local AAAA records for the remaining manually-defined names use the VLAN ULA
prefix with the IPv4 address encoded in the interface identifier, for example
`router.mousses.xyz` resolves to `10.9.20.1` and
`fd00:beef:cafe:1:10:9:20:1`. `omv.mousses.xyz` keeps an explicit A/AAAA pair;
its AAAA uses the host's EUI-64 SLAAC ULA instead of the encoded convention.

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
- `pds.mousses.xyz` is now an explicit static record pointing at Traefik. Clear
  the old PDS client's built-in Local DNS Record before applying, or the
  controller rejects the explicit record as an overlap.

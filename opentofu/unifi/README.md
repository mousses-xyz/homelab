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

The current configuration only reads the `Default` site, so a successful plan
confirms the provider, URL, API key, and TLS settings all work. Add resources
to `../modules/unifi` once that is verified.

## Notes

- `unifi_allow_insecure` defaults to `true` because the UDR7 presents a
  self-signed certificate on its LAN address.
- If the console stops answering during an apply, raise
  `unifi_request_timeout_seconds` (for example to `300`).
- The provider does not read `UNIFI_API_URL` / `UNIFI_API_KEY` from the
  environment; values must come from `auto.tfvars`.

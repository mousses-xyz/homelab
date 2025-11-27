#!/bin/bash
source ../../.env

ZONE_ID="1d5f294fca2427e0ee497a515915a6ae"
ACCOUNT_ID="8274d1dfb65fee4897ed27e1b55856bc" # From auto.tfvars

echo "Fetching DNS Records..."
curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
     -H "Authorization: Bearer $TF_VAR_cloudflare_api_token" \
     -H "Content-Type: application/json" | jq -r '.result[] | "\(.name) \(.type) \(.id)"'

echo "Fetching Access Applications..."
curl -s -X GET "https://api.cloudflare.com/client/v4/accounts/$ACCOUNT_ID/access/apps" \
     -H "Authorization: Bearer $TF_VAR_cloudflare_api_token" \
     -H "Content-Type: application/json" | jq -r '.result[] | "\(.name) \(.id)"'

echo "Fetching Tunnels..."
curl -s -X GET "https://api.cloudflare.com/client/v4/accounts/$ACCOUNT_ID/tunnels?is_deleted=false" \
     -H "Authorization: Bearer $TF_VAR_cloudflare_api_token" \
     -H "Content-Type: application/json" | jq -r '.result[] | "\(.name) \(.id)"'

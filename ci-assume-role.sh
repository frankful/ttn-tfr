#!/usr/bin/env bash
# Exchange the GitHub Actions OIDC token for short-lived AWS credentials.
# Used by iam-apply.yml so the runner keeps no static AWS keys.
# Trust policy on the role pins repo:frankful/ttn-tfr ref:refs/heads/main.
set -euo pipefail

ROLE_ARN="arn:aws:iam::186375393473:role/tfr-github-ci-apply"
AWS_REGION_VALUE="ap-southeast-1"

: "${ACTIONS_ID_TOKEN_REQUEST_URL:?id-token permission missing}"
: "${ACTIONS_ID_TOKEN_REQUEST_TOKEN:?id-token permission missing}"

JWT=$(curl -fsSL --max-time 30 \
  -H "Authorization: Bearer $ACTIONS_ID_TOKEN_REQUEST_TOKEN" \
  "$ACTIONS_ID_TOKEN_REQUEST_URL&audience=sts.amazonaws.com" \
  | python3 -c 'import json,sys; print(json.load(sys.stdin)["value"])')

CREDS_JSON=$(aws sts assume-role-with-web-identity \
  --role-arn "$ROLE_ARN" \
  --role-session-name "tfr-ci-${GITHUB_RUN_ID:-local}" \
  --web-identity-token "$JWT" \
  --duration-seconds 3600 \
  --output json)

export AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN
export AWS_REGION="$AWS_REGION_VALUE"
AWS_ACCESS_KEY_ID=$(python3 -c 'import json,sys; print(json.load(sys.stdin)["Credentials"]["AccessKeyId"])' <<<"$CREDS_JSON")
AWS_SECRET_ACCESS_KEY=$(python3 -c 'import json,sys; print(json.load(sys.stdin)["Credentials"]["SecretAccessKey"])' <<<"$CREDS_JSON")
AWS_SESSION_TOKEN=$(python3 -c 'import json,sys; print(json.load(sys.stdin)["Credentials"]["SessionToken"])' <<<"$CREDS_JSON")

echo "assumed $ROLE_ARN (session tfr-ci-${GITHUB_RUN_ID:-local})"

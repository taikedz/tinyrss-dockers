#!/bin/bash

FQDNFILE="/root/fqdn.txt"

faile() {
	echo "$*"
	exit 1
}

cb:has_le_cert() {
	[[ -d "/etc/letsencrypt/live/$CERBOT_FQDN" ]]
}

cb:load_fqdn() {
	if [[ -f "$FQDNFILE" ]]; then
		CERTBOT_FQDN="$(cat "$FQDNFILE")" || faile "Could not open [$FQDNFILE]"
	fi
}

cb:set_fqdn() {
	echo "$1" > "$FQDNFILE"
}

cb:ensure_fqdn() {
	if [[ -z "${CERTBOT_FQDN:-}" ]]; then
		cb:load_fqdn || faile "You must supply the fully qualified domain name via CERTBOT_FQDN environment variable"
	fi
}


cb:require_email() {
	if [[ -z "${CERTBOT_EMAIL:-}" ]]; then
		faile "You must supply an email address via CERTBOT_EMAIL environment variable"
	fi
}

cb:renew_cert() {
	certbot renew -n
}

cb:new_cert() {
	certbot run -d "$CERTBOT_FQDN" --apache -m "$CERTBOT_EMAIL" --agree-tos --no-eff-email
}

cb:main() {
	if cb:has_le_cert; then
		cb:renew_cert
	else
		cb:ensure_fqdn
		cb:require_email

		cb:new_cert || faile "Could not register a certificate"
		cb:set_fqdn "$CERTBOT_FQDN"
	fi
}

cb:main "$@"

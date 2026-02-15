#!/bin/bash
if ! grep -q "smtpd_tls_security_level" /etc/postfix/main.cf; then
    echo "STARTTLS not configured"
else
    grep "smtpd_tls_security_level" /etc/postfix/main.cf
fi

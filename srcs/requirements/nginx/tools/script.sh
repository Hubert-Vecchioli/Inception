
mkdir -p $WORDPRESS_PATH
chown -R www-data:www-data $WORDPRESS_PATH

openssl req -x509 -nodes -days 365 -newkey rsa:4096 -sha256 \
			-keyout $CERTS_KEY \
			-out $CERTS_CRT \
			-subj "/C=FR/ST=Paris/L=Paris/O=42/OU='${USER}'/CN='${DOMAIN_NAME}'"

nginx -g 'daemon off;'
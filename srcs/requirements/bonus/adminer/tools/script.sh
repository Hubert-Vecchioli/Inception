wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php

chown -R www-data:www-data /var/www/html/adminer.php 
chmod 755 /var/www/html/adminer.php

rm -rf /var/www/html/index.html
mv /var/www/html/adminer.php /var/www/html/index.php
php -S 0.0.0.0:80 -t /var/www/html/

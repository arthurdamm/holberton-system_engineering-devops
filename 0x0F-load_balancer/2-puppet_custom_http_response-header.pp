# install nginx
exec { 'A':
  command => '/usr/bin/env apt-get -y update',
}
exec { 'B':
  command => '/usr/bin/env apt-get -y install nginx',
}
exec { 'C':
  command => '/usr/bin/env echo "Holberton School" > /var/www/html/index.nginx-debian.html',
}
exec { 'D':
  command => '/usr/bin/env sed -i "/server_name _;/ a\\\trewrite ^/redirect_me http://www.holbertonschool.com permanent;" /etc/nginx/sites-available/default',
}
exec { 'E':
  command => '/usr/bin/env sed -i "/server_name _;/ a\\\terror_page 404 /custom_404.html;" /etc/nginx/sites-available/default',
}
exec { 'F':
  command => '/usr/bin/env sed -i "/server_name _;/ a\\\tadd_header X-Served-By \"\$HOSTNAME\";" /etc/nginx/sites-available/default',
}
exec { 'G':
  command => '/usr/bin/env echo "Ceci n\'est pas une page" > /var/www/html/custom_404.html',
}
exec { 'H':
  command => '/usr/bin/env service nginx start',
}


# Installs nginx n stuff
exec { '/usr/bin/env apt-get -y update' :
} ->
package { 'nginx':
  ensure => installed,
} ->
file { '/var/www/html/index.html' :
  content => 'Holberton School!',
} ->
file_line { 'add header' :
  path   => '/etc/nginx/sites-available/default',
  ensure => present,
  line   => "\tadd_header X-Served-By $hostname;",
  after  => 'server_name _;',
} ->
service { 'nginx':
  ensure => running,
}


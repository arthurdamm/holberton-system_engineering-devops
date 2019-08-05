file_line { 'Turn off passwd auth':
  ensure   => 'present',
  path     => '/etc/ssh/ssh_config',
  match    => 'PasswordAuthentication',
  line     => '    PasswordAuthentication no',
  multiple => true,
}

file_line { 'Declare identity file':
  ensure   => 'present',
  path     => '/etc/ssh/ssh_config',
  match    => 'IdentityFile',
  line     => '    IdentityFile ~/.ssh/holberton',
  multiple => true,
}

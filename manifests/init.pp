class enterprise-ssh ( $rootenabled=yes) {

  package { 'openssh-server':
    ensure => installed,
    before => File['/etc/ssh/sshd_config'],
  }

  file { '/etc/ssh/sshd_config':
    ensure => present,
  }

  file_line { 'SSH Root Logins Enabled':
    path => '/etc/ssh/sshd_config',
    line => "PermitRootLogin $rootenabled",
    require => File['/etc/ssh/sshd_config'],
  }

  service { 'sshd':
    ensure => running,
    enable => true,
  }

}
